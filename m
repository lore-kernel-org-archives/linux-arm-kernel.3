Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99D8FF513A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 02:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m8O2Q+OOohPaG3znAvecqv/xmF0EiFxUP+dvhSeqtjI=; b=nDdU02tSEWP9T9RCxUwgYCzqus
	ZCAOlM94hjK52IkUsEyP3qucxdFTVK7c3vLibue+SZuWVwtfM6q47LkeIb6NR477awUqgHzRQMYoO
	7nMlDZdE/4ZI+kqJBgVp634ima1FWfjlXuvj6eAKu3TwgtK3qUU4SbLeNSUlBZ2RGxQFSkuzqmOas
	6XUAbaxA2gfQycBU1OEAcfOoDZUH3OHODjM05xPshYhHLwBH2PYBcL/it5S41Oh7LKaQJkKsVSDxA
	1V4/XstqNEQ2R5ZwKxebJ/QaBG5FJ7HAKWpEF07uWCiUne8N5x/00vio52rK9ZgglOIAE5wPyYIMB
	bcW8+oWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAJ11-0000000899J-1M5H;
	Wed, 08 Apr 2026 02:51:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAJ0z-0000000898U-19Zl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 02:51:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 25E7840B92;
	Wed,  8 Apr 2026 02:51:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A765C19421;
	Wed,  8 Apr 2026 02:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775616696;
	bh=4KmW52ojotdS2xyp5e7cHouikLW+lgqmv208rSJWWic=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BzW0ige8moHKxCsRbPugd62Yndyj4ujFsahw2nRcpTm9uavw9pSg+Cl3QXZMbhbOs
	 CRJ/obpvlt+QtfpvDJqG8erfrQUDxd/jWu23tqqnM6x+1x30CnyupCQeq5j9qD0kxm
	 JCSvjzPRI2QgUgvpr9pYX6THqbL5wDqC0F8YDbumK+wvx3tKpJxUN8VB+WXAk1WGa5
	 RJuGyF0FkI25BxDdvd7tqG7jgI2YTJ7vwg7NSKi9reKMPaQ8jeRM/iCXcV5rbidTje
	 H40htvvu58zYGzXh1d37lXzt0+aPfGvRwj8LGEX24mIvIpT14Bwm7cRX5l5Wy4tBOb
	 SutlY4vi8RBXQ==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	akpm@linux-foundation.org,
	urezki@gmail.com
Cc: linux-kernel@vger.kernel.org,
	anshuman.khandual@arm.com,
	ryan.roberts@arm.com,
	ajd@linux.ibm.com,
	rppt@kernel.org,
	david@kernel.org,
	Xueyuan.chen21@gmail.com,
	"Barry Song (Xiaomi)" <baohua@kernel.org>
Subject: [RFC PATCH 1/8] arm64/hugetlb: Extend batching of multiple CONT_PTE in a single PTE setup
Date: Wed,  8 Apr 2026 10:51:08 +0800
Message-Id: <20260408025115.27368-2-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260408025115.27368-1-baohua@kernel.org>
References: <20260408025115.27368-1-baohua@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_195137_334676_CCD2A1C1 
X-CRM114-Status: UNSURE (   8.79  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

For sizes aligned to CONT_PTE_SIZE and smaller than PMD_SIZE,
we can batch CONT_PTE settings instead of handling them individually.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 arch/arm64/mm/hugetlbpage.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index a42c05cf5640..bf31c11ebd3b 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -110,6 +110,12 @@ static inline int num_contig_ptes(unsigned long size, size_t *pgsize)
 		contig_ptes = CONT_PTES;
 		break;
 	default:
+		if (size < CONT_PMD_SIZE && size > 0 &&
+				IS_ALIGNED(size, CONT_PTE_SIZE)) {
+			contig_ptes = size >> PAGE_SHIFT;
+			*pgsize = PAGE_SIZE;
+			break;
+		}
 		WARN_ON(!__hugetlb_valid_size(size));
 	}
 
@@ -359,6 +365,10 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 	case CONT_PTE_SIZE:
 		return pte_mkcont(entry);
 	default:
+		if (pagesize < CONT_PMD_SIZE && pagesize > 0 &&
+				IS_ALIGNED(pagesize, CONT_PTE_SIZE))
+			return pte_mkcont(entry);
+
 		break;
 	}
 	pr_warn("%s: unrecognized huge page size 0x%lx\n",
-- 
2.39.3 (Apple Git-146)


