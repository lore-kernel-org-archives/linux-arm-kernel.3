Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B2EC982C1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 05:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qf2/Psgvj1EaockCLCoqTAU5YfPvsk9Hzwk+BcXGZSE=; b=bOM5rEIqxhKmpgXXsw88VtRsVl
	LJOnOkc3DM4tGfPu9SuC1Ho8jZ8UgXG7aCKqdbvgeUoR0cfWJHwtDdZcNV+ijvKItddNpTAhjqQpY
	Zl51zHQWSAIb8vvIgVwmCvGzLKEHbg1+lXu6p+Qhg9F6Anl0rCqzJDSYwEFojZxYYdQTb1I5lBTlG
	TrWkXHq70IpYI5wuD1OHxK5NnCdBIU+FLTSnm0w0R+PHUDhsDWniroLVyBRCKzbe6ea0IstX0zYTr
	7YsoJ+HZWJixeMYt8M8/c+KjoJ4yOY6DXbffQvXT57U2QKZT/fmJ/QmXT832E6qxcecgQm4flDXbm
	h1RIlJew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x74h8-0000000Ab3G-3UQR;
	Thu, 17 Sep 2026 05:30:02 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x74h5-0000000Ab1u-1CRQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 05:30:00 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccd5cef0so308097a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 22:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789622998; x=1790227798; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qf2/Psgvj1EaockCLCoqTAU5YfPvsk9Hzwk+BcXGZSE=;
        b=DTIjMb0oXekSIYtamWjqQVPIUUT38NTGiMZzNdOZKOkBcgUHZB7MldfedA8AWMuOXh
         t+Q+KeXfXLDCLeMrXSjV3gGU1lJWyRMB/H+TxoSZ/16Ng5TkpJdde3A2vY3kiZBVdjND
         5LjmvsH0Auq+Uvsy4sE64f9gIFG+Ema1rHoxmjHOkUfNpV4jBfSf6SPwLkKci4p7extS
         3qVTFoAfdUp+39PQiKSB6kYUPDKOaV875tCAeu1S0Dq8AMV9qr7oLaFVHT5t8JNoq8mN
         rASukB6cfCgzM+FRucVwKgpJxg2nro2QZgaRlvVhm92m6XzDelPur79aQfaYVH6ClFOU
         jXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789622998; x=1790227798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qf2/Psgvj1EaockCLCoqTAU5YfPvsk9Hzwk+BcXGZSE=;
        b=PY0zDQC1GX6YAhbxb+v28GVumL5q5jhxXiQU4wc02Bl4FqeLsGCtJ9RCkerAh/YYL/
         z2mchL+NjDy8ArGzzbBogFS848Zupjrb+XSvrBdbmK6jNTYmmjeb7qX42j6AzPsmoqgn
         1xrk/HxkNChGw3LAn2KPjgvlXmV0WEyc1PrBTemtMg4Fanx3+wfh2CgtiybLf2fjIlzj
         PuhFduWVQ3VM17wKKN7rytHnQPL09nzpgLjjot5WAXxIAVuq+1I0H+s3J5Md86le4H0a
         7IfkKhYyaVsH4MtLtcaZcgOBp3uxQIxYXa6eWhzjoOHv0laLbWFEhjDRA19NEoOqh7mK
         QtTA==
X-Forwarded-Encrypted: i=1; AKwUvByyIwJ+pcWjrrPFB8TYGbtPAG+i1cvuwcbhEtH+X4gYmCaWfROvaGQdrdU/iv1EyoVNNTpwuTpOlrR0HjyN2Wj6@lists.infradead.org
X-Gm-Message-State: AFuF++mqfYtLXoPr16fIxgmN4RRIPC3CaZzBF7tk4GJ/RiNMemGbxppr
	HD7S5ODBwfRqFclS5v13+Hk29CxKspIXIfLrBBLtKOQsR+eAEPjj4qKU
X-Gm-Gg: AYBFou1LaeUNdHI1CsVt0iSRlockVYnLvQn+p4mksgYiDaH4xcHkQJAdVUhkpEr5d9K
	SLh6jSKviyqnAbxJIIm6SruJnVIA8F91Buu8+30JDF0l0Iu6nGyZhSBe+Fyyp3ecu+gnk3FS4jn
	mBkSs8mzylORwj3uBvkDLXccHPX2+GZd+ONsUbe9jzJEJYA7oJXiSW9z3pdc0TtZFpaJbZABCKG
	MQS04l+OegrmaMcRmUHrLjiC9YMqUIccZVNl+JoiPmnBJz57sIkBHxDoiDYY1t6aazrRlk3dnGC
	WqQ1GbcXnIAnCoYVXO2JQClH70elFJp6Fqwq+5n/cWAJMn3o40bwwWq1r6iothVyk6XjEU+XJud
	k1Ujj25aDKWWMrKYpGMaQZSGm+DPaNX+r3APsCBGsIs6P+K5PB8pCOqVmy9iyNqW32yGfh/+HnN
	hDuqs1lQ41Q+Ve6zMonsxSKcNwOi3Wzef5eO1YL35Z5Dp1ZSNuDWTpohvaaRiLm7yUUqoTcr8eE
	ZHaXG6bcVUtNHOG1mIFFkI6cQs=
X-Received: by 2002:a17:90b:53c3:b0:398:c0ad:711c with SMTP id 98e67ed59e1d1-39e1e48a517mr11683515a91.15.1789622998238;
        Wed, 16 Sep 2026 22:29:58 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3abada87sm1955836a91.14.2026.09.16.22.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 22:29:57 -0700 (PDT)
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
Subject: [PATCH v8 02/10] powerpc/8xx: add pte_set_huge()
Date: Thu, 17 Sep 2026 13:29:25 +0800
Message-Id: <20260917052933.188679-3-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_222959_352604_9421EFD5 
X-CRM114-Status: GOOD (  15.26  )
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
block-mapping branch.

In practice PPC_8xx selects HUGETLBFS unconditionally, so
CONFIG_HUGETLB_PAGE=n does not occur there today; this is a decoupling
cleanup rather than a new configuration.

There is no caller yet: mm/vmalloc.c is converted later in this series,
once the generic fallbacks are in place.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
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


