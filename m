Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F62EC98308
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 06:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qd05crYEDf1zOBsfrx9KiTFMAUGQioHKS/Nf5VbEp9U=; b=Zrm6LQCYIKMj5BXEsCppiQY9xb
	GRYUMuVZqHG6+dlZte97cFr07fwm6g/L6loD6EQNqiX28cfJZLuxrv5oBOWZhEKRWS4H3RgYTuxbd
	mKbvg19MAN+pvyyfZnQb9uB/TA62ee6BN7mY+WMfME5TfUu5Rf4EH25a3ZnVejMeq1YxbSbbsiNy2
	c7vHqGheGk8iMCfM+GYC5iyxhH5beta9eOetmSogMcYbKsK4/7hD3g0TBOIqx2kimpxPLnuET47MC
	6MxLTBmScVLW6w7itwTp2FnsTY4V9zH3YGbu+1zimkRakXPfPPEfXfE0oX0my3ZoQB2ZnFi09TnER
	skv1Xhig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GTU-00000007HDb-0bDw;
	Wed, 23 Sep 2026 06:29:00 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GTM-00000007H7o-2PRZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 06:28:53 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d747eefae4so1659175ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 23:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790144931; x=1790749731; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qd05crYEDf1zOBsfrx9KiTFMAUGQioHKS/Nf5VbEp9U=;
        b=mAA3XMScOmqbbVLtx9GxXyuBivgIi0cG+3LVuW1mRzK0vl+E8qFAX2Q6HZaB66AKFc
         0Z4v4NbyrDrH8qjXkrGjjRkpIS3X3if1M5ATnO/7vjMyu1G6QolOUDF1On6WUiqIUX6w
         LHU54H4Tr6xQEUz0uGLJ2rrd1T+QmN1y+8sENnH+1mD1mPfGFCsxKs3uTBrqYJRidlDL
         8ZeUYpO8fPUB5asz26XaUzC1rzbSvjHVz/w7XMq3+jSwfQT575mwj3xLauIlH1usykDk
         A5lwKgUJVtFcMgawgRbQ8dinrN6LdblgGznUZD7fq8PKNNxMu9vf2EoWbixgbAS1xCPW
         pQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790144931; x=1790749731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qd05crYEDf1zOBsfrx9KiTFMAUGQioHKS/Nf5VbEp9U=;
        b=Zr51SYh5HUYyaaFsA9vpjoo/NnJuJ/trlWArev3PhgYhdNW0yiDZeISec42EXyDVJp
         Rs0wp9PYa9Gzc1INPDs807kqq+i9XIBIGOH4Lccx8gdhSbFJI9NLPFY2M2H5uW1gkUcV
         YzpIninLmkcUx5gM0YjWqmTxpFR379j9ZOjr233+imHdYWCiVME9vZOWTsd6RzL43CUN
         XBJnFa1Rv1bWZiYOukS32kji1P3SmggmVZe4HbI5AerqF3nRKUA2snaxeYs+oNWGQuyt
         XtHixSgnkiaoxMhHehOQ4reU1WwHB7JBZDTQWrCX6CMiBHF30s7PZHZAaSFZUp2/jEBc
         IOBg==
X-Forwarded-Encrypted: i=1; AKwUvBwMXbgNSTqNX336tro2+6dnIbpRDdDlz5mga6RBJwAUqVCyreUZA7EtuaoqRLXU0GRdX35TH4qKzu5uND5luITf@lists.infradead.org
X-Gm-Message-State: AFuF++lwYbTVmAUAOtAw3Skjh9CXitYQBB74h3U4NMqVsjmDMW+hsmsx
	65jjTujy1OlAfFcPIAR6VmoOCaYVZFSTRsas3X0hPCW1JAWFPOL8/fFk
X-Gm-Gg: AYBFou2nmssQ/1OoZQ1q9gxit7O4gKQnjcNpH4jFTCyGabvw/nWEUKO5qMzKR8Ka4Xb
	i7KF/TvxyBU0F3EGwFSmH4LGoCfWzuCOaMbY7JYhwzzZSCYJWfF8o9sBaOoCiwCnWzUECux8e/p
	xNk1kjk3xcEFpzeF/m/fzHJoJ87GHjJwHSuDVsZp+h0U7R/QRnVwY7fqlEVUgb1pZlXwKH/y/4O
	lxhIC7uYGXLEfjpUDgJm3Wp0C0wNkG8j/2utoKeMjBWhkcFECiossSEfJkyx3VYG+EUm/qXDsYp
	R6+8kLMRMAJiYpN+7emyTrvdUmH2oqJazHi9tSLQxYgskfTv8XbfDY1kipdeLmrS/+DT91z5GDO
	3stLDC0ZEtWfVNS5HVLqDoVok/mji9+VXSb/HqLLYy6lCcuJK89C2eX7zhoynT159vkK+O7OKpg
	m9Bb1vwJSv1t7fDmStORuYAWwFsIw817124m7CUr88p3INKyMGiSh1Pi/FhOu27+u/E3b9376nZ
	C0aSD752inU7OOIPESlUw==
X-Received: by 2002:a17:902:d4cf:b0:2cf:b9f9:18bb with SMTP id d9443c01a7336-2df6987811fmr11433845ad.4.1790144931608;
        Tue, 22 Sep 2026 23:28:51 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a516bfdsm5620465ad.5.2026.09.22.23.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 23:28:51 -0700 (PDT)
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
Subject: [PATCH v9 02/10] powerpc/8xx: add pte_set_huge()
Date: Wed, 23 Sep 2026 14:28:24 +0800
Message-Id: <20260923062832.479455-3-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923062832.479455-1-jiangwen6@xiaomi.com>
References: <20260923062832.479455-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_232852_618690_1CDCBEFD 
X-CRM114-Status: GOOD (  15.64  )
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


