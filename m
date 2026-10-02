Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9068ECA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qd05crYEDf1zOBsfrx9KiTFMAUGQioHKS/Nf5VbEp9U=; b=LaDz2O/PPBN2xlmQUsKw1RrzmS
	JbVumG9TMIgeZSGp+QDQkdImfLc7zgu2XkGL5g2mMULW2UQ1Umk0uZ6ofYYUDVEDl1rYdwj/ohuc6
	7u3b7cq/Y/LCDO//4lRL12E4x0kYUFiTaSuRgwVTRSlfuw51r++iIRLXRoobBEGPjzErkTsYXiIjh
	O1Ukc6zdLrPWjkt+tCGPw+bEJ1V3NEZZgxJm53x7OYPr5K4UGVCES8XgqOasKeNKSs8zwSbwSohX1
	cHrDMJU3OUA8f3RSCjwiFLDGnpH6SICEA/2++bzFizhflJ5C3gWWCTCNh2q9OrOoLyz6jMrYHqmTh
	+kflP5DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZHQ-0000000B4Yi-1RI7;
	Fri, 02 Oct 2026 09:10:12 +0000
Received: from mail-pj2-x0d.google.com ([2607:f8b0:4864:39::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZHN-0000000B4X8-2Ds9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 09:10:10 +0000
Received: by mail-pj2-x0d.google.com with SMTP id d9443c01a7336-2e4bc397f2aso230035ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 02:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932208; x=1791537008; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qd05crYEDf1zOBsfrx9KiTFMAUGQioHKS/Nf5VbEp9U=;
        b=qt+UXXJKxPTX4KtyYTzX6ut86jqHLmbOM9vl961xreQ7j+h79/KopFrsdTDsOZiBKD
         LF0KWbkmCnyA5SdGBCWY4tZN0lwMU8z25Ac9UZ7cJ5wu0NhY4w385Rm16EwXXpRTnYwQ
         Wbz8Q1WgmhWlEPU0C/FqRb2cglgQDROVjTM/ciVLBe1/eHw5y7ypqltmO6S4lS4rX0LM
         M0OkPRAH0FUCEsHehuMKiBbQJWvKkUqWbA/pN74q0QFkhjdk0/KjIYF2YWJ3RV9jBsyR
         vRVRYcdpg3Lw+crJSSabR8mAuf95m6BN+6h2ANJvffpp+1nlvCQDk/3Dy3KPfvJ2OE7+
         z1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932208; x=1791537008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qd05crYEDf1zOBsfrx9KiTFMAUGQioHKS/Nf5VbEp9U=;
        b=lE28iqwRgf7fiMGHadRGh/UbZ3zjD16XBh16ZfDxqi5VbwvdOecvOpFywvWhHsEGsl
         rfIIQ0T2liOwSvNsyyh9LZozRnYc0SnXvh6in1lt6cnen3XlGU+lw4TO/HSVf2+cgQ/O
         JmGHrQCxOH3YAm8QDNmvpCFmeFPm2eb1CRX++86tdKOxeAY2FGEQvcjeSh/bIcwOuJz0
         dmtC/LGQSIntoF1gdVN6G2tZtXXM4imdP/XsuQ8wGEQ0uGz8O+cVgqQ9vroIJcWM2mRr
         c2hZ2tML7aQFQ6bx4KaQUlF5MUqEzRzbMQjLEmrnScAgUhNgPkwqLO4WI5+z86smpVdZ
         /M1w==
X-Forwarded-Encrypted: i=1; AKwUvBw1bazxBMEw/+mfxv2yoexeQ5fgufM5kGOU99IADu731uVPIEwxQrftQBfrr+5ClCTCQsq7PAGk3RUis/n+axqS@lists.infradead.org
X-Gm-Message-State: AFq9FYKpA7ZkbnLh1K65g858HptDhoKNorr0uLUluwjgI5+2tWHSGc6G
	0qSUMBuOQITvfukVde3Q7nGzOdxQESg/DkFztRTTxpnfibHVmgMmYrb3
X-Gm-Gg: AYBFou0dKGXdF+HoQ43TltdufMaP2Bsdr155Es04a84Tgp7BsZHH2uvTcfHmio7L6Nl
	AK6jvSe6qRvnLV/ZzOF9qnKJvUSI3V2ZN8wgkT89arjRQNW7RPY/dhNl0ytp/1/sotwaj+VI0Es
	7/1RbT1sTwSN45iZDuL8V/vaGfeiZGYKVXU/5Rg/XNs+vnpi+9YW1N65TyUetgwKMip+WkgWvan
	0KYmbVXalUkiNRU/KoegjFpqfP4jkfPnv4EIaSqZvZ4aAtMjPuMxNAOUtzn67ZHyP7YpkOeWVFj
	P542xa9iyXcO4xGIybBTS8a3ky8oIasV1wz00ixZ5pLtmjuu4p4PxAioX6PgjqY5aaMqK9w0YUg
	rNxv977GrDzdGO6T1UYhQG+a68Dzfd354orTDC7ewouUDX/USbVElj8Ah5LdRq6WS8vEoWvcZuN
	CO7/2Pii1244Zo5KztrDc8uXTo6kU2+ak5GUN+16S1fBV3uyP01M4kzgwclS/hjLjLCunsf9rv8
	wT6pujakX0eLl4aWlq5dQ==
X-Received: by 2002:a17:902:dac2:b0:2dd:68a4:170c with SMTP id d9443c01a7336-2e49b612e9emr18357635ad.11.1790932208496;
        Fri, 02 Oct 2026 02:10:08 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6ab2b9sm5480555ad.36.2026.10.02.02.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:10:06 -0700 (PDT)
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
Subject: [PATCH v10 02/10] powerpc/8xx: add pte_set_huge()
Date: Fri,  2 Oct 2026 17:09:39 +0800
Message-Id: <20261002090947.869220-3-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261002090947.869220-1-jiangwen6@xiaomi.com>
References: <20261002090947.869220-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_021009_575497_17A32C73 
X-CRM114-Status: GOOD (  15.30  )
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

vmap installs PTE-level block mappings (SZ_16K/SZ_512K on powerpc/8xx)
by reusing set_huge_pte_at(), a HugeTLB helper gated by
CONFIG_HUGETLB_PAGE. This makes the feature silently unavailable on
CONFIG_HUGETLB_PAGE=n kernels and couples mm/vmalloc.c to HugeTLB
internals it does not otherwise need.

Add pte_set_huge() to powerpc/8xx, next to the existing
pmd_clear_huge()/pud_clear_huge() in mm/nohash/8xx.c. It builds the huge
PTE and writes it into the backing cells directly, without going through
set_huge_pte_at(), so it does not depend on CONFIG_HUGETLB_PAGE.

No pte_clear_huge() is needed: 8xx does not implement
arch_vmap_pte_range_unmap_size(), so the vmap unmap path never takes the
PTE-clearing branch.

In practice PPC_8xx selects HUGETLBFS unconditionally, so
CONFIG_HUGETLB_PAGE=n does not occur there today; this is a decoupling
cleanup rather than a new configuration.

There is no caller yet: mm/vmalloc.c is converted later in this series,
once the generic fallbacks are in place.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
---
 arch/powerpc/include/asm/nohash/32/pte-8xx.h |  4 +++
 arch/powerpc/mm/nohash/8xx.c                 | 29 ++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/powerpc/include/asm/nohash/32/pte-8xx.h b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
index e2ea8ba9f8cae..1ee3f8f0de974 100644
--- a/arch/powerpc/include/asm/nohash/32/pte-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
@@ -235,6 +235,10 @@ static inline pte_t ptep_get(pte_t *ptep)
 }
 #endif /* CONFIG_PPC_16K_PAGES */
 
+#define __HAVE_ARCH_PTE_SET_HUGE
+void pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
+		  pgprot_t prot, unsigned long size);
+
 #endif
 
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index a9d3f4729eada..2518d2a6bdb41 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -220,3 +220,32 @@ int pmd_clear_huge(pmd_t *pmd)
 {
 	 return 0;
 }
+
+/*
+ * vmap PTE-level block mapping. Sets a present kernel mapping directly,
+ * so unlike set_huge_pte_at() it needs neither CONFIG_HUGETLB_PAGE nor
+ * set_pte_filter() (a no-op for non-exec kernel mappings).
+ */
+void pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
+		  pgprot_t prot, unsigned long size)
+{
+	pmd_t *pmdp = pmd_off(&init_mm, addr);
+	pte_t pte = pfn_pte(PHYS_PFN(phys), prot);
+	pte_basic_t val;
+	pte_basic_t *entry = (pte_basic_t *)ptep;
+	int num, i;
+
+	pte = arch_make_huge_pte(pte, ilog2(size), 0);
+	val = pte_val(pte);
+
+	/*
+	 * Make sure hardware valid bit is not set. We don't do
+	 * tlb flush for this update.
+	 */
+	VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
+
+	num = number_of_cells_per_pte(pmdp, val, 1);
+
+	for (i = 0; i < num; i++, entry++, val += SZ_4K)
+		*entry = val;
+}
-- 
2.34.1


