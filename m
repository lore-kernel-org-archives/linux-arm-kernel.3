Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD25C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 14:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ChFArhQc4UjuOW/ZrRHu4cHoDy98pviZhV3Uu5a5Yo=; b=K+0NbbbUxNF75cH2SQjgwIozKB
	e0upNAXOEtlYc0/vXb4Hdb/L3f+pXJlZkrfcwGykJzd32VmaF+gv/oDZ/GKR7WjM0qUe+9UuVTCzx
	7eAdjlbm/dY5Y1wNXsZ9r58WirKHQF6O1NRPMSDzjF84fP1OrXU2WyjZY8p+82za3nzCkZl4/SuBC
	VkuQ03joVt9DF6LkWmyCZr5wRIxWod/V0cVgnJ6NLqKimqs+dqKDyUX+P6qm5LnKtKw4BBj4VZMT2
	/dVKMBoP88T4yvc2KMSXzFDatf0HjzGXXSCEg6eKBi9lhs0+LstLh+h71akC4xTdR62XiUobCJOTu
	ua/kLgxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2B0-00000004rxE-2paz;
	Mon, 17 Feb 2025 14:32:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk1np-00000004mbb-3MG8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 14:08:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B39F6244C;
	Mon, 17 Feb 2025 06:09:12 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 459AE3F6A8;
	Mon, 17 Feb 2025 06:08:51 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/14] mm: Only call arch_update_kernel_mappings_[begin|end]() for kernel mappings
Date: Mon, 17 Feb 2025 14:08:05 +0000
Message-ID: <20250217140809.1702789-14-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217140809.1702789-1-ryan.roberts@arm.com>
References: <20250217140809.1702789-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_060853_881671_39C434BC 
X-CRM114-Status: GOOD (  14.02  )
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

arch_update_kernel_mappings_[begin|end]() is called from
__apply_to_page_range(), which operates both on kernel and user
mappings. Previously arch_update_kernel_mappings_[begin|end]() was
called unconditionally for both user and kernel mappings.

The existing arch implementations of arch_sync_kernel_mappings() (which
is called by the default implementation of
arch_update_kernel_mappings_end()) filter on kernel address ranges so
this change is still correct for those users. But given
"kernel_mappings" is in the function name, we really shouldn't be
calling it for user mappings. This change will also make the upcoming
arm64 implementation simpler.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 mm/memory.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index f80930bc19f6..4e299d254a11 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3035,7 +3035,8 @@ static int __apply_to_page_range(struct mm_struct *mm, unsigned long addr,
 	if (WARN_ON(addr >= end))
 		return -EINVAL;
 
-	arch_update_kernel_mappings_begin(start, end);
+	if (mm == &init_mm)
+		arch_update_kernel_mappings_begin(start, end);
 
 	pgd = pgd_offset(mm, addr);
 	do {
@@ -3057,7 +3058,8 @@ static int __apply_to_page_range(struct mm_struct *mm, unsigned long addr,
 			break;
 	} while (pgd++, addr = next, addr != end);
 
-	arch_update_kernel_mappings_end(start, end, mask);
+	if (mm == &init_mm)
+		arch_update_kernel_mappings_end(start, end, mask);
 
 	return err;
 }
-- 
2.43.0


