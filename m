Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46EA9CA5FE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZrNUgiHK76eibcbmJczjwEumW62nZKL7vmCqyjldhkU=; b=Y+J6jNSKC+ByChOqPj1iwf8yeO
	I2gjpB3f/1IQ5YH82esWxujWJytlTyp5sDGc91l3vxhNhxlVf6gLFsUwdB/yNnZRfxah22i52VkkK
	qRPX35LYvJ9Q8x5/hHIwUnyJlbgyi/J1XmqMu1Jcoi2X6+WFgIjw3dsE5MyflQmeByKt1rcQPiA9R
	F59nU/GTABR0drTDd5/rHOOLBJuL8gyB7HBbzg4Y8bTKmJEhRRHEy1CZq7AwDdDX3wVySLKYNJo5K
	eB10Cr7XoOpYDnG6mRMHV3LVH+B0113FHeG1hFHCBMep2kwar+KdqYNx5Wuf3V8m80bSos/P8RFSm
	uTJoIh/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZHK-0000000B4VI-0uHu;
	Fri, 02 Oct 2026 09:10:06 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZHH-0000000B4TX-17dg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 09:10:04 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2caced6038eso7696575ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 02:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932202; x=1791537002; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZrNUgiHK76eibcbmJczjwEumW62nZKL7vmCqyjldhkU=;
        b=eEg747Qu9HZ58cStRufiVRy3ZSu7siQDJVtCv6asvwrvtncn/HBVQKd7+33XhZ4X80
         1aEXkcafp/geMHpVCvAgSKEXxL3zWVkDKKl7Sutbcac+EW3SzISrpZDmEI85wHlTk/57
         mqPx9D87FbrqGq15qkUaNZ063GnAC9fOpXyV36l9DOYWnFwWIZ+Z413NaI2mdCk19l/N
         srZsQQQb4vVG1RpN+6Ry7abvXHcrb5gZYKFwjxM6Kq4MCwLwb9VtH7ZGjIElaJWZKLpS
         Pz3Z5WS7QSK1xdOLKfV68s9vnaen/MN05MRnrFyY0kre6VIwiXyOJTeE+tphiEKA8tWg
         orKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932202; x=1791537002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZrNUgiHK76eibcbmJczjwEumW62nZKL7vmCqyjldhkU=;
        b=Et5P2H0yqMvsUioOw6qhnnzKXcRK1RETXLXZ2rIywWEVJflJ3Yr6q63EDvB8jGkyhf
         BM2dRBwGuPntGVrZHFO8DtJQPttmtzoBI9EJVC7IDyKSZDecJ7aO8vau0OCCM5v6sxCy
         Q3d7FBd6GHdAS60oG9Elb3LnniVXR2knmbiXjZjIRltHGndJc544q2NO79kUdr/R7zdV
         rCFYtljZWk/S6gjzppx4Z0TK/ofzH1vcrRGjmrlFqbLdxPCEyBrRFTUM/oC8r6tcfl9R
         SIfmT4lehRN0Vgu3z/WaA7zmyUsiiDiymO1XyL1EiYNdOYZSaZagNrCxzi08RV7KnqIS
         a9Qw==
X-Forwarded-Encrypted: i=1; AKwUvBzMTkGXMEcavXGtoJ5IVb73IACKNOKs17kw0pbpuhPhQnGf+ytPGDwkkWO/dhIzuaD8UKuCwkqvXlyUSFE8x0BR@lists.infradead.org
X-Gm-Message-State: AFq9FYLMXhGWwTi+mB5Oa1ppGqciAZrNr5lzp+Ayot3ac1B74ZteEJ5c
	e7Dxwxd04kUii1Y9ewdTv/Du/geA1yOi+ZA6pat63b5PyOysSpUo+C2y
X-Gm-Gg: AYBFou080ZLjVh6eCucyiQfRoD9Wjp2iDpBk+YeT00eUh1q3APODwqPYj5t5h3gw/yE
	l3KMgsNWdbjPFdpQlDY9kSKXGzSIAlqpipVWSp85JGK3g2a0IXWWp2ihc9dPOxPudF7jzqFY0sA
	9sowHXF6i6i5zoQUNBh3+gMRL/E2DuEx7TFPsVn2YlN+tMfMKeCu9V20NADQ/helclKULt9GDLy
	DnfjDOqSvT8X78iCHW7apQ0NWbcF4dlIVG42TH0AjP8wHeOtimuD9vfbHNMyr/7tmBvcw0vy3kf
	kYg6myDOieyb6SKQAlp3ICljfTLk74TzET0pLUgyyQWMRwT4NoKDHV/zqAfLg7Tj2kNBWMrHnGi
	OJuq0OQaMRXQQMgHaYrF7UZyf0PSp+NnrSdUnDd/WPNDEcUUJNIt7De+1JTZjScKCn6I85mcmZH
	Q3lIJF6bzfHoZKoa8EVCiS3KbtcT76zVZfR/+ootkb7PjwN/1zwCa+LxcowPdIbP59iMSsK4lhS
	V5Qgi2hqnAhldD/LyXjO/Jo8jHmm6P1mw==
X-Received: by 2002:a17:902:f686:b0:2e1:35ec:e03d with SMTP id d9443c01a7336-2e30029e1cdmr33883955ad.31.1790932201968;
        Fri, 02 Oct 2026 02:10:01 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6ab2b9sm5480555ad.36.2026.10.02.02.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:10:00 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
X-Google-Original-From: Wen Jiang <jiangwen6@xiaomi.com>
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
Subject: [PATCH v10 01/10] arm64/mm: add pte_set_huge() and pte_clear_huge()
Date: Fri,  2 Oct 2026 17:09:38 +0800
Message-Id: <20261002090947.869220-2-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261002090947.869220-1-jiangwen6@xiaomi.com>
References: <20261002090947.869220-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_021003_327744_9B9F8F02 
X-CRM114-Status: GOOD (  11.89  )
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
Reviewed-by: Barry Song <baohua@kernel.org>
---
 arch/arm64/include/asm/pgtable.h |  6 ++++++
 arch/arm64/mm/mmu.c              | 23 +++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 6000905a2e865..9b762eb68cff0 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1978,6 +1978,12 @@ static inline void clear_young_dirty_ptes(struct vm_area_struct *vma,
 
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
index 79d90226fd5dc..ae2f15618c97d 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1912,6 +1912,29 @@ int pmd_clear_huge(pmd_t *pmdp)
 	return 1;
 }
 
+void pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
+		  pgprot_t prot, unsigned long size)
+{
+	unsigned long pfn = __phys_to_pfn(phys);
+	pte_t pte = pte_mkcont(pfn_pte(pfn, prot));
+	unsigned int nr = size >> PAGE_SHIFT;
+
+	VM_WARN_ON(!IS_ALIGNED(size, CONT_PTE_SIZE));
+	VM_WARN_ON(!IS_ALIGNED(addr, CONT_PTE_SIZE));
+	VM_WARN_ON(!IS_ALIGNED(pfn, CONT_PTES));
+
+	/* For vmap, there is no valid -> valid transition */
+	VM_WARN_ON(pte_valid(__ptep_get(ptep)));
+
+	__set_ptes(&init_mm, addr, ptep, pte, nr);
+}
+
+pte_t pte_clear_huge(pte_t *ptep, unsigned long addr, unsigned long size)
+{
+	return __get_and_clear_full_ptes(&init_mm, addr, ptep,
+					 size >> PAGE_SHIFT, 0);
+}
+
 int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
 {
 	pte_t *table;
-- 
2.34.1


