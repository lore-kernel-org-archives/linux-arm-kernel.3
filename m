Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545EF105D99B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 02:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yfPtFj5B5lJqYQYocslP/VZqEDVBz+14COSNMVRnX3k=; b=kfjA+QRLI8US+77R26Zbx/P/lQ
	cCjlkfj612VQ2mMr10DNQ1rMQtLw0CQE4//+FoBOnsa6CJutOfO56FAp++LAhIzJDiVRhGNlTJRG4
	IKO5gMUsndQaBDMfSybby1W4WMSUF0bdDu7CEFN3I8jEvvZq8+RoCTdpc1FRK1VOp+aT0fyerDD7p
	JMo59XcOfovyRvdtxjZqhuMWfagL1g2iQaLc2RJhGjNFCk3Habp6ruS7CnMJyssVsnAdPK61ESn/9
	WTg+gLdM0Li6HqAPzVjjShSbR3Kpu97PrKovywm4ruV1slUyRfaQt/XvLLkyQgc4pR+JHOK4cKPSq
	lAg3mblQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAJ13-000000089A9-2awd;
	Wed, 08 Apr 2026 02:51:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAJ12-0000000899h-097R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 02:51:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 77F9D60138;
	Wed,  8 Apr 2026 02:51:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 715D1C19424;
	Wed,  8 Apr 2026 02:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775616699;
	bh=WaU87kHk5fdaxiwAyibksVupa8Ba+++SUKhvjx8Yo4g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dx7NiL2d22U6fw3kZORHXgxH7PInpyHrU15js7b2oe2n3ns+9bjxR6fCg5/6GWmbZ
	 X100BzWea1lmMJjJ6MdI4MUdHcBeVF7B5uM/WEvWcCEm8BVy6Pbh1p/3A+RD0RPLyd
	 ibBOiRdc68xmP+7tu0ifGfDelO2NXJ+pGkpj3oWQRlDQvP2UoUKzd/9deSD6GkZpfj
	 CWHUftf54l4oWYzxj53bFKSLczJLFYUKvXew2QSbMul0LTXPMa71Mw+zyAJ6cgsVd6
	 2i+tgpHiraeRUGyW7OH5pBqjXSAwzzFJJYGcfEpN75VTBYNu2rwUlTiNTjPq/GQsBi
	 vAmBHA+W6YXnA==
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
Subject: [RFC PATCH 2/8] arm64/vmalloc: Allow arch_vmap_pte_range_map_size to batch multiple CONT_PTE
Date: Wed,  8 Apr 2026 10:51:09 +0800
Message-Id: <20260408025115.27368-3-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260408025115.27368-1-baohua@kernel.org>
References: <20260408025115.27368-1-baohua@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Allow arch_vmap_pte_range_map_size to batch multiple CONT_PTE hugepages,
reducing both PTE setup and TLB flush iterations.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 arch/arm64/include/asm/vmalloc.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
index 4ec1acd3c1b3..9eea06d0f75d 100644
--- a/arch/arm64/include/asm/vmalloc.h
+++ b/arch/arm64/include/asm/vmalloc.h
@@ -23,6 +23,8 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
 						unsigned long end, u64 pfn,
 						unsigned int max_page_shift)
 {
+	unsigned long size;
+
 	/*
 	 * If the block is at least CONT_PTE_SIZE in size, and is naturally
 	 * aligned in both virtual and physical space, then we can pte-map the
@@ -40,7 +42,9 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
 	if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
 		return PAGE_SIZE;
 
-	return CONT_PTE_SIZE;
+	size = min3(end - addr, 1UL << max_page_shift, PMD_SIZE >> 1);
+	size = 1UL << (fls(size) - 1);
+	return size;
 }
 
 #define arch_vmap_pte_range_unmap_size arch_vmap_pte_range_unmap_size
-- 
2.39.3 (Apple Git-146)


