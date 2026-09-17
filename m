Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5D1C982D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 05:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMxiXZ3VjT6yairvAxeBbjdHvNVDdfswnxYz1hMIZxE=; b=cubQUt0izLc7wkeGxrHpAouduU
	Y/LW/0eRL3gpTWkWKINq0/pTPjXYJIKt6BC4o5b9+paeqO/tazidshuI5Ta7M2s1NKpOllHf2J6g9
	/fkpI+Ya/vK4nH92zhQmE9q/QgpYbuRkvx0BfKOyCNO64C/aoczKrIv4JXsGtQ9I1HsWiV1/Y5Esj
	4P5wwp0K/q5yIVyLJq0PFQpmyAHN1gtcnh5mdSHN4beQPPvGpdq2RdWXVWZqu5bhLl945qVzKCldL
	OgRd2g3EWSdEhNtsF06eESnn27q9INl+fpOIe+DvhJ0ToGEslrrcMVMsmsBaWaGtMRF+9YalweuL4
	//v21xlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x74h2-0000000Ab10-2qL6;
	Thu, 17 Sep 2026 05:29:56 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x74gy-0000000Ab04-3imW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 05:29:54 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-39e03468a5fso389220a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 22:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789622992; x=1790227792; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aMxiXZ3VjT6yairvAxeBbjdHvNVDdfswnxYz1hMIZxE=;
        b=imlU67DuzdVnR4IQKGCcilzmhlkb/zkzl6oB64+OlQnEbK3gyU2PoDYDW0nPkvtiBI
         vLHaKn4oOANwshFDPvonXoQccPxeLuzy9hxfhYs+nhYffPKViUbwaL/8TTLUabAmN1BB
         SfEWjGT/W7Dzgh/RMyNTGMuLdTTboj1JKwWGOzXXF026gRLCHA3LJmX4KX5pTltCd+Ys
         HNp/O57Mhm1GM3dwNPYQs33DEWrRZOEgCbQSCvCflhqgStRtpSqTTuKFMsp4p+rQQmm/
         +f18edU1Q6oNmwkF4GnekPTpYhdvLWV0/nOFnKjEo1KfAeK+1FaAgBd8T+uHVMKQhL1p
         14Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789622992; x=1790227792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aMxiXZ3VjT6yairvAxeBbjdHvNVDdfswnxYz1hMIZxE=;
        b=tPfgRheMM2KAWyRq8avvmbp8E+T7Ca979qcz/dTPT4ebtKJ+PznMcKlF2SSOIrHlwC
         nXRoSFxloGrlBUPAaT51jGyikFxQBwB2cez7EwYxFO9UzvSCYU870hkUOdyPosEtI0uT
         kNLPAcGiIRSPhhbs9lXHdG3g0qQPPfOqMRhnMvjPIvKBoCl+DDmfI3A65kLDEU8zFviG
         oUCjfsVmMDpaWx1FF1BW5I+T6aYxwyDj6n6rerFYhQ7adSCej3G8DV6Tbh5l0M7QwDiy
         DoO/zIKRjT4iA3+Go7rjzQZPcGiMulJji0923ZGDjsXupVFM30lVLrUzXoUmUqngZxQq
         ORjA==
X-Forwarded-Encrypted: i=1; AKwUvBx9T5BoHH/LvGO6c+A0yw7Bnbv3eGqsfvvYOf95MQvNcw3fBGDIp29KoGTRkLMucDk2uaAq7MHaz+XGHHe8FyKv@lists.infradead.org
X-Gm-Message-State: AFuF++lChmrkH5ApwMvtPphMDbE+eFMx17bu79TUrsfZcHWHO13QqvLH
	2NqeBD4kt7qbPWU5JBGjO/K4XxBTgWyVvZSZqMJFgLIm6ykcPqegtlIe
X-Gm-Gg: AYBFou0v/1JaeAyxiAr87mVWy9EfqqngiI1BERmY3xc1bCeNCQGFa3R4/uYr/kedWtg
	BqbGwcuDWN3gN8sYr0I0+lDmyyX9CCb06QhZBgpPnD2NtJtFZn/WSssLoa0TuOVH7OeyX+Qmigc
	+HHPTSCGCSXFBdhLWA3ZspCYr0uycvtjhG7NdMaGaiSjefK0l4PkqBcXb3Xu1V3ZK2c9Fm729WJ
	5LPTeRNsJ7fMwcHtKg3kLlqFFO1/ZBJ0W70gdvRoKePX9sOPe2NDaE5YxrYq5+5ISifM/e61Y5k
	56QHXqm0yvjCBVCN5EOvtAKNtNMRBSLdmnewKV+UPcBNbzc3xKJsILIKT5Hmcwzu/0/RukOfrPc
	ZpuS4PGDIfGpj1c79T+CQv0/wt23Hf6e0RkKSYmXQ89v5Xgw15efAsjaX3ZXYWtaXL2RgcxIW2E
	eWEQ3fa/wczMK/BZwM6pdQm+89y+Jfn+ytvWUDZ8SRXis3y38P7RbGGAtEAk39mIpjI8007uI9F
	ioCJT/M1lo/BVJi5KU4IqrpIM4=
X-Received: by 2002:a17:90b:3b91:b0:39d:ec43:3cc3 with SMTP id 98e67ed59e1d1-39e1e2f3e9fmr11172449a91.10.1789622992190;
        Wed, 16 Sep 2026 22:29:52 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3abada87sm1955836a91.14.2026.09.16.22.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 22:29:51 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	linux-mm@kvack.org,
	urezki@gmail.com,
	will@kernel.org
Cc: Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	baohua@kernel.org,
	chleroy@kernel.org,
	david@kernel.org,
	dev.jain@arm.com,
	jiangwen6@xiaomi.com,
	leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Subject: [PATCH v8 01/10] arm64/mm: add pte_set_huge() and pte_clear_huge()
Date: Thu, 17 Sep 2026 13:29:24 +0800
Message-Id: <20260917052933.188679-2-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_222952_940664_8C9106AB 
X-CRM114-Status: GOOD (  11.09  )
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

From: Wen Jiang <jiangwen6@xiaomi.com>

vmap installs PTE-level block mappings (PTE_CONT on arm64) by reusing
set_huge_pte_at() and huge_ptep_get_and_clear(), which are HugeTLB
helpers gated by CONFIG_HUGETLB_PAGE. This makes the feature silently
unavailable on CONFIG_HUGETLB_PAGE=n kernels and couples mm/vmalloc.c to
HugeTLB internals it does not otherwise need.

Add pte_set_huge()/pte_clear_huge() to arm64, joining the existing
pmd_set_huge()/pud_set_huge() family in mm/mmu.c. They build on
__set_ptes() and __get_and_clear_full_ptes() directly, so they do not
depend on CONFIG_HUGETLB_PAGE.

There is no caller yet: mm/vmalloc.c is converted later in this series,
once the generic fallbacks are in place.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
---
 arch/arm64/include/asm/pgtable.h |  6 ++++++
 arch/arm64/mm/mmu.c              | 19 +++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 4dfa42b7d0535..6ee1522fac78f 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1949,6 +1949,12 @@ static inline void clear_young_dirty_ptes(struct vm_area_struct *vma,
 
 #endif /* CONFIG_ARM64_CONTPTE */
 
+#define __HAVE_ARCH_PTE_SET_HUGE
+void pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
+		  pgprot_t prot, unsigned long size);
+#define __HAVE_ARCH_PTE_CLEAR_HUGE
+pte_t pte_clear_huge(pte_t *ptep, unsigned long addr, unsigned long size);
+
 #endif /* !__ASSEMBLER__ */
 
 #endif /* __ASM_PGTABLE_H */
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 92fedf4db9278..93b602a6c68a6 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1872,6 +1872,25 @@ int pmd_clear_huge(pmd_t *pmdp)
 	return 1;
 }
 
+void pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
+		  pgprot_t prot, unsigned long size)
+{
+	unsigned long pfn = __phys_to_pfn(phys);
+	pte_t new_pte = pte_mkcont(pfn_pte(pfn, prot));
+	unsigned int nr = size >> PAGE_SHIFT;
+
+	VM_WARN_ON(!IS_ALIGNED(pfn, CONT_PTES));
+	VM_WARN_ON(!IS_ALIGNED(size, CONT_PTE_SIZE));
+
+	__set_ptes(&init_mm, addr, ptep, new_pte, nr);
+}
+
+pte_t pte_clear_huge(pte_t *ptep, unsigned long addr, unsigned long size)
+{
+	return __get_and_clear_full_ptes(&init_mm, addr, ptep,
+					 size >> PAGE_SHIFT, 0);
+}
+
 static int __pmd_free_pte_page(pmd_t *pmdp, unsigned long addr,
 			       bool acquire_mmap_lock)
 {
-- 
2.34.1


