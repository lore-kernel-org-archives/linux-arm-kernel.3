Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EDCCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 13:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+B9Rd0QSKX3f0a8GqzDwyxDt6n7MbipsBAu2cM0NNI=; b=p/ZJyFj3qcLfshTEzRLShUHjh9
	8vanvsMrtuLQM4XqIsJwg2dIk5MDcKj/aGBxiQc0FTjeII346KFi3ALZfqT4OVPnxEHMdtzZ1LsrQ
	NV4MKm+l2rWGkDsgKLl5eGU0gDsoR8Et4tJM2vI/e5lRlMw9mLW11UBxXrDEGhaVQvHP002bcZ38L
	HwZ2+WvM+RrVVYffWhHQ/Kv8jjYVLhwtGN8TvL4LE0BiI8T+OUpdatoC99kQAJGWKmUnGp/L64hy+
	b6FiXXtkkjDbi9RjsYWLUabnrVLQ3SFVJUwKaM25JGvEo0+lXiGRN6wmu/dw4n9QLTHrvk+vVidi8
	nIAEXY1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzbEv-0000000307B-2of2;
	Fri, 19 Sep 2025 13:33:29 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzbEr-0000000303H-1EYz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 13:33:26 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-45f28552927so17257905e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 06:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758288803; x=1758893603; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=v+B9Rd0QSKX3f0a8GqzDwyxDt6n7MbipsBAu2cM0NNI=;
        b=VTfVun04pZt9h+mf3FepZniHb/paXkWIws949xXC0uJdUGAE+VHbhDGK5VWYkwLEBq
         kzAxn8gCfkeSK0NW8wD2sW1rp2lj8KfgWyHxz8fZgGplaAm6wRtw1zGX6hFchGctmMVe
         2qWiaST/7Ap0zZZ0lSxJggs03Eg+Z6Is0QrvOGpITpSuSPpiY5Hq4cwPwrIi0Uf1+SRK
         LkNXrLNj/jp+HcsA/9YOsCKF8AjXC0tJ9uyJEYs7gYLHxRvEoare28RRTc7vnl0eQsUf
         56P6m/3XC79/aT5rA2ncFgOIH3MHaLQujIMfgpH7BhTvD0cRLwdDxwTjEclUa4+4vQzH
         G6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758288803; x=1758893603;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v+B9Rd0QSKX3f0a8GqzDwyxDt6n7MbipsBAu2cM0NNI=;
        b=kwU341bUgvTiHJUPa8mGLRbMgy+Uf1xAsmebs2R/ctazwoOuRgfnUe8KsP0OOUjxc2
         4qdvhqWVonKMC4kIht2uMtNLvaFZ1ZsCkGkH7lq2tHteFbzvnoIOpitjr2/HcWCtIp7v
         ryZ3d9N8CayjTXBjBlQJszL7Jq5TVLTT9LRKLM+2RQAfjG3SmeInVYyWhtBIBXgSt6N1
         jc9pItuIzqRVwGS4+Oa8UvoTzcB4/Cba/frT0JXu36tVKTtxUYxFMXC/agcbOfvg+4OS
         74OraLJZemodLDiA1JU/65HEFvGo94Bxj4EiQGNPHw6jLnQ/PWwGtF2l2w65MKsdtDiH
         mvlA==
X-Forwarded-Encrypted: i=1; AJvYcCXUsYTWG1dYuOhObzuEvId9lAo6ASi39iFOZ9OrfSTorMr9DDMrkp1GMavoxDE4CqZDGp/nz0yqcPP4DnhgJNRM@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7XUSNKhN9jVektgxov5ShmxGqp1u7r/lJR39zFiTstoeyrXhr
	CUWk0Gfx0mVtEsKXVBJJplTQUN7MhHgT51p3f7BISbH7ejkPnDYGHTS0GGGy/Fy/j+o4Ko3OrkN
	ueZw2V3QGKXFBkA==
X-Google-Smtp-Source: AGHT+IHgv9Oc1Q90zGIOvBR/gtnADwG6axckvKn1MbwYC6fQkHZhHVTfgauS5SWZ9dYzPTFs0YjJunsuQ96/hQ==
X-Received: from wmbeq6.prod.google.com ([2002:a05:600c:8486:b0:45d:e59b:2eb0])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3595:b0:458:bf0a:6061 with SMTP id 5b1f17b1804b1-467f00c5fd6mr42464245e9.24.1758288803025;
 Fri, 19 Sep 2025 06:33:23 -0700 (PDT)
Date: Fri, 19 Sep 2025 13:33:12 +0000
In-Reply-To: <20250919133316.2741279-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250919133316.2741279-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.0.534.gc79095c0ca-goog
Message-ID: <20250919133316.2741279-4-smostafa@google.com>
Subject: [PATCH v3 3/4] iommu/io-pgtable-arm-selftests: Modularize the test
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: robin.murphy@arm.com, will@kernel.org, joro@8bytes.org, jgg@ziepe.ca, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_063325_347567_CA3C54B7 
X-CRM114-Status: GOOD (  14.36  )
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
 drivers/iommu/io-pgtable-arm-selftests.c | 34 +++++++++++++++---------
 2 files changed, 22 insertions(+), 14 deletions(-)

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
index 17f48216647c..4c3dee4ba895 100644
--- a/drivers/iommu/io-pgtable-arm-selftests.c
+++ b/drivers/iommu/io-pgtable-arm-selftests.c
@@ -13,28 +13,28 @@
 
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


