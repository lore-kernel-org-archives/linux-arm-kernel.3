Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71303CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 09:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxsHa5a/TnumwuS8wGt++Dj39uNGV0RG0Oz4S0LjiTY=; b=THu5fXrQEEd0rO6Y6c3whEqbmG
	pJjZnRqoSwjfVFrW9qNjxzgDn7mtBFtAOHaB4gJpZsXO4sNtzQRcj3jKArC6IrMCX9OWhoP/S++sy
	LJlqdtlNqWTLdrZN7qVi6J9qilWjZws9D6KYhec/vLWUOkT35UjEL9CqG9zasTNNHIX6L8TttVlt9
	sQAI2inggno2+6v29eCPzjBxzC7SLAqaQv0athhf+xxPwW5QLLx/BIEwfTLPCXy+zawy0DxCf+g/y
	h4DgAXsvDpb+tXFQTJkauk0k11jHqHUlTf1gDk/GQZv4jY6Q2ignnh939myfIh/Mt33eIqsBrGAQ6
	zLvtFVpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0cPA-00000009ouR-0jVk;
	Mon, 22 Sep 2025 09:00:16 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0cP4-00000009oqb-1yYj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 09:00:11 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4612d068c47so29429945e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 02:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758531608; x=1759136408; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fxsHa5a/TnumwuS8wGt++Dj39uNGV0RG0Oz4S0LjiTY=;
        b=RyX137glycqPLosjOU0Ac1xQtZkOkr9JrvFVGXnjoJMccFSfEKKRJyqfALPv84vNQ+
         wfkHk2JAd9tD8g311VHq95vYGMua3+C0jGZUkRptqmPGBaj2vXc017Trx/Y3Rnu4JqCl
         8u8dXyaSfyXlH7eag4VuSVVaf+M9WWbKyAD3zWPRSJiW7AD1rlBTQe4KjYRX29wvVePR
         Y28tCoUVsPbCTDEZH9ZBs2UshpaRugZEItzjjg4gYQ1j9TX79z5+pAa/FrqTUuhmPqjD
         jfGSwFiGWMGTEIf+pUzTmPqElDk1zGwp96emizbV/C/SgjkEXgQdG5z8PLm+HgznnJWN
         8+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758531608; x=1759136408;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fxsHa5a/TnumwuS8wGt++Dj39uNGV0RG0Oz4S0LjiTY=;
        b=KwNTMdJBEHnylwCEE3/V0mG3oy2mfPpqnxhdSTIidPejWEchVzOftfVeEKddww/mIZ
         KHA9DFaly2RqjS2nUcgtt0EqTeyNRJ5hYFze/1MLvQOIU9EaYAzG46tvpWXQXh/P4/PW
         AVCcjqExxYIn+0Vy67E1Xns/vIXjqmSnvnOd+PwKX4PklJ4iMdlSdKWzX4IR3or6o3EY
         dWdSRRLYxZjdmrmySvoglVNW1KG7lDjDZU4fqA/4LS2tG2O4bZs5WrY7aIl2unUC3pqc
         MuCW72d6xpnEcw3W3yh3HHluTjO1FhqCTiNbCAWDCN6njtV68gmQzCAHF/O5hjUQu+hy
         M55Q==
X-Forwarded-Encrypted: i=1; AJvYcCWf6Of5TNveMZCI735TgbVL5wzIrXSgmeCNF0dQKQcefxYiNjiFZkk69HH5FtBXVZ+eR/MkNPMHlIs5f7JWCzo4@lists.infradead.org
X-Gm-Message-State: AOJu0YwxqrphYMaObiifU6NPc5/PZ21VRtk5CCwP691aPr0rOVX4/aBg
	j06QaLsAonfBfvB46Ta2lvfPFMQbgdHRE3zQXJRF2mZgvCLP/3UGwpRgE5nSTA13qc/4BG8Elr8
	MLygekNA+S3QAdA==
X-Google-Smtp-Source: AGHT+IHget1O4BPqdwANeAahSQkK78lrpcEF2/nHFiBWfVpUCmbTfdZneqa7756vBxWSeKVk9F/QEVfsPjcQ4A==
X-Received: from wmcn18-n1.prod.google.com ([2002:a05:600c:c0d2:10b0:45b:7262:8426])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5491:b0:45d:d5df:ab39 with SMTP id 5b1f17b1804b1-467f2cc83afmr101921075e9.26.1758531608493;
 Mon, 22 Sep 2025 02:00:08 -0700 (PDT)
Date: Mon, 22 Sep 2025 08:59:27 +0000
In-Reply-To: <20250922090003.686704-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250922090003.686704-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.0.534.gc79095c0ca-goog
Message-ID: <20250922090003.686704-4-smostafa@google.com>
Subject: [PATCH v4 3/4] iommu/io-pgtable-arm-selftests: Modularize the test
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: robin.murphy@arm.com, will@kernel.org, joro@8bytes.org, jgg@ziepe.ca, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_020010_530477_CAB3006F 
X-CRM114-Status: GOOD (  14.81  )
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

Remove the __init constraint, as the test will be converted to KUnit,
it can run on-demand after later.

Also, as KUnit can be a module, make this test modular.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/Kconfig                    |  2 +-
 drivers/iommu/io-pgtable-arm-selftests.c | 36 +++++++++++++++---------
 2 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 70d29b14d851..553522ef3ca9 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -41,7 +41,7 @@ config IOMMU_IO_PGTABLE_LPAE
 	  up to 48-bits in size.
 
 config IOMMU_IO_PGTABLE_LPAE_SELFTEST
-	bool "LPAE selftests"
+	tristate "LPAE selftests"
 	depends on IOMMU_IO_PGTABLE_LPAE
 	help
 	  Enable self-tests for LPAE page table allocator. This performs
diff --git a/drivers/iommu/io-pgtable-arm-selftests.c b/drivers/iommu/io-pgtable-arm-selftests.c
index 17f48216647c..50350e88d9b4 100644
--- a/drivers/iommu/io-pgtable-arm-selftests.c
+++ b/drivers/iommu/io-pgtable-arm-selftests.c
@@ -13,34 +13,34 @@
 
 #include "io-pgtable-arm.h"
 
-static struct io_pgtable_cfg *cfg_cookie __initdata;
+static struct io_pgtable_cfg *cfg_cookie;
 
-static void __init dummy_tlb_flush_all(void *cookie)
+static void dummy_tlb_flush_all(void *cookie)
 {
 	WARN_ON(cookie != cfg_cookie);
 }
 
-static void __init dummy_tlb_flush(unsigned long iova, size_t size,
-				   size_t granule, void *cookie)
+static void dummy_tlb_flush(unsigned long iova, size_t size,
+			    size_t granule, void *cookie)
 {
 	WARN_ON(cookie != cfg_cookie);
 	WARN_ON(!(size & cfg_cookie->pgsize_bitmap));
 }
 
-static void __init dummy_tlb_add_page(struct iommu_iotlb_gather *gather,
-				      unsigned long iova, size_t granule,
-				      void *cookie)
+static void dummy_tlb_add_page(struct iommu_iotlb_gather *gather,
+			       unsigned long iova, size_t granule,
+			       void *cookie)
 {
 	dummy_tlb_flush(iova, granule, granule, cookie);
 }
 
-static const struct iommu_flush_ops dummy_tlb_ops __initconst = {
+static const struct iommu_flush_ops dummy_tlb_ops = {
 	.tlb_flush_all	= dummy_tlb_flush_all,
 	.tlb_flush_walk	= dummy_tlb_flush,
 	.tlb_add_page	= dummy_tlb_add_page,
 };
 
-static void __init arm_lpae_dump_ops(struct io_pgtable_ops *ops)
+static void arm_lpae_dump_ops(struct io_pgtable_ops *ops)
 {
 	struct io_pgtable_cfg *cfg = &io_pgtable_ops_to_pgtable(ops)->cfg;
 
@@ -54,9 +54,9 @@ static void __init arm_lpae_dump_ops(struct io_pgtable_ops *ops)
 		-EFAULT;						\
 })
 
-static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
+static int arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
 {
-	static const enum io_pgtable_fmt fmts[] __initconst = {
+	static const enum io_pgtable_fmt fmts[] = {
 		ARM_64_LPAE_S1,
 		ARM_64_LPAE_S2,
 	};
@@ -157,15 +157,15 @@ static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
 	return 0;
 }
 
-static int __init arm_lpae_do_selftests(void)
+static int arm_lpae_do_selftests(void)
 {
-	static const unsigned long pgsize[] __initconst = {
+	static const unsigned long pgsize[] = {
 		SZ_4K | SZ_2M | SZ_1G,
 		SZ_16K | SZ_32M,
 		SZ_64K | SZ_512M,
 	};
 
-	static const unsigned int address_size[] __initconst = {
+	static const unsigned int address_size[] = {
 		32, 36, 40, 42, 44, 48,
 	};
 
@@ -205,4 +205,12 @@ static int __init arm_lpae_do_selftests(void)
 
 	return fail ? -EFAULT : 0;
 }
+
+static void arm_lpae_exit_selftests(void)
+{
+}
+
 subsys_initcall(arm_lpae_do_selftests);
+module_exit(arm_lpae_exit_selftests);
+MODULE_DESCRIPTION("io-pgtable-arm library selftest");
+MODULE_LICENSE("GPL");
-- 
2.51.0.534.gc79095c0ca-goog


