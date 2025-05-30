Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E21D4C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 08:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vZvfLBGK8X8jm8yAqcVB1P/FNMsYbL+LJ5AH3QTCLIo=; b=LVTzoAVf83Xr1Nikcj76ls8H+Q
	CGUBqI7QdmQTdUlAmQm18FkNBwku2H9S0xtmkcSyTu5k1y516yj4r03C5HgSyjtU4leAchlmR0sKV
	4qwCRVoQL268XJwmtOmthy8uagy+IMh0u3bnwPHU9Zj+ak4uZ4QiZvBaKRKP1OkuOuHovcHHjZaXm
	s+a4kxmVTzJkWoBiO/v0lYAALqqEd5KTA4BGb52XxxIH1uvVrOXJoHuJFpyZX7qcL1siQIVnt3grL
	USK4NGE94X8Bpc3SdLZBGyU+MDcOkiRTQW8ju6HPcUz6X0/tFu3kI226QVRbzKeZcBTkn2wPwH2zV
	SfaFIItw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKv50-0000000008H-3gZg;
	Fri, 30 May 2025 08:27:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKuyd-0000000HaRJ-4Bl4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 08:20:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57A0516F8;
	Fri, 30 May 2025 01:20:12 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (unknown [10.164.18.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1D82D3F694;
	Fri, 30 May 2025 01:20:24 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: anshuman.khandual@arm.com,
	quic_zhenhuah@quicinc.com,
	ryan.roberts@arm.com,
	kevin.brodsky@arm.com,
	yangyicong@hisilicon.com,
	joey.gouly@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	david@redhat.com,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH] arm64: Enable vmalloc-huge with ptdump
Date: Fri, 30 May 2025 13:50:21 +0530
Message-Id: <20250530082021.18182-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_012032_083574_E21E46B9 
X-CRM114-Status: UNSURE (   9.16  )
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

arm64 disables vmalloc-huge when kernel page table dumping is enabled,
because an intermediate table may be removed, potentially causing the
ptdump code to dereference an invalid address. We want to be able to
analyze block vs page mappings for kernel mappings with ptdump, so to
enable vmalloc-huge with ptdump, synchronize between page table removal in
pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
use mmap_read_lock and not write lock because we don't need to synchronize
between two different vm_structs; two vmalloc objects running this same
code path will point to different page tables, hence there is no race. 

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 arch/arm64/include/asm/vmalloc.h | 6 ++----
 arch/arm64/mm/mmu.c              | 7 +++++++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
index 38fafffe699f..28b7173d8693 100644
--- a/arch/arm64/include/asm/vmalloc.h
+++ b/arch/arm64/include/asm/vmalloc.h
@@ -12,15 +12,13 @@ static inline bool arch_vmap_pud_supported(pgprot_t prot)
 	/*
 	 * SW table walks can't handle removal of intermediate entries.
 	 */
-	return pud_sect_supported() &&
-	       !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
+	return pud_sect_supported();
 }
 
 #define arch_vmap_pmd_supported arch_vmap_pmd_supported
 static inline bool arch_vmap_pmd_supported(pgprot_t prot)
 {
-	/* See arch_vmap_pud_supported() */
-	return !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
+	return true;
 }
 
 #endif
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index ea6695d53fb9..798cebd9e147 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1261,7 +1261,11 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
 	}
 
 	table = pte_offset_kernel(pmdp, addr);
+
+	/* Synchronize against ptdump_walk_pgd() */
+	mmap_read_lock(&init_mm);
 	pmd_clear(pmdp);
+	mmap_read_unlock(&init_mm);
 	__flush_tlb_kernel_pgtable(addr);
 	pte_free_kernel(NULL, table);
 	return 1;
@@ -1289,7 +1293,10 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
 		pmd_free_pte_page(pmdp, next);
 	} while (pmdp++, next += PMD_SIZE, next != end);
 
+	/* Synchronize against ptdump_walk_pgd() */
+	mmap_read_lock(&init_mm);
 	pud_clear(pudp);
+	mmap_read_unlock(&init_mm);
 	__flush_tlb_kernel_pgtable(addr);
 	pmd_free(NULL, table);
 	return 1;
-- 
2.30.2


