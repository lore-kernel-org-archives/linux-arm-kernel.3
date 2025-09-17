Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29DCCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 19:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/5kKzg8OPO0Cw4eskhZqcihDqdYuLltlJ6a6ZgtbvOg=; b=Qh6/ezkYwHl+QaFwRvbyrxpSMo
	5g3U/QOcWtYQ67HkOtcDnC0bFwR5AVT2c3HEX9wdCNBLnwJO1eUPP11BexauNyDxVETdoChy0Qd46
	QtoKah05V72y61UdX2lHnQeOiuR/FquPMSRgQnDgkoxGe1pTzlk81mJgB1DWcFNs+/gVN/hOw27hk
	Dwc5OKdPsWYjLWneUA+VQEcp/Ib7tPRHEEiuTKepF+8/jGECQq7a/iz1Og0Usv3bf654GP+3L5Nvn
	sTcNUe6+SHwctIfYqL2oiJWF+g6JWITbYzd9SQiSaVuOyp8i4IbpJk3KrIKEoHUvecqARcEjnLzhg
	Z9U3rC+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxZU-0000000E9Y2-0nzD;
	Wed, 17 Sep 2025 19:12:04 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxZN-0000000E9Ol-2Pta
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 19:11:58 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45b467f5173so1053305e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 12:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758136315; x=1758741115; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/5kKzg8OPO0Cw4eskhZqcihDqdYuLltlJ6a6ZgtbvOg=;
        b=cdWSp96sYND1kuJujmXue4EGzw76piOby99Pt22G6E8ba96elPOFtEKkiMjy4TpJBy
         X3/9suctxqZ8vky/YLUPnbEByq1OxPmgUBYWiArg3ahmEpCcLYOm113RgwXaWBgwhqjm
         M9evXsHq07gy10V2erIE6m+OKk0/k9qmqyYQp6bt5X8bnic3IahKw/U31WUYLLJg1IbZ
         iMtPblWyOt90OAKC05avEHgIiqkGfTkv0tPUkolX/MnuUWiDLmbGneUh8KpulxIAFHTg
         VgzP2S/yPfF4kAJEQVQCoH7C4eAVhdrZgTJjMdvg9yqLPyEI6aIi6hg2JNfaHZuOZwWA
         c3rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758136315; x=1758741115;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/5kKzg8OPO0Cw4eskhZqcihDqdYuLltlJ6a6ZgtbvOg=;
        b=amUbeq/pPWcMs3Zr0rn2vQg4JyeWvafip1IDKP5Nbiafc4nrEy5LaplyDMk1ksqPgF
         gWqo+t83u8bj3LG9OSYCETM+Ww54uvSR9X5seX4nPIE2fFcP6sW+Kw46NCnT/UuNPfDG
         H9IDNhHO/xdUw3OqQPiB9ozLuQzhGW/GamzTHTeB3rSKHPYdwnCIQdwmpo3uWy3VLf91
         9nsYb2cWW8ebFAfd6rJaaOi72J9S1KGWeLXFIBGm0hZCACXtJrhSXxq4R/GkapvKKZx5
         ZZQWeIpUHkXGiGJeeT1kj8XDMuivgO/TusYipuz1eaPXezQ9TyTWOk0qPp97SuEiQkLj
         as0g==
X-Forwarded-Encrypted: i=1; AJvYcCXgI1ofElR6wUw/CRqBZzmvtR1tbWHynQRkbwNP8KLYu/W6TDom/NZSvRfiNPAljbI2w11KZKpE7KKfnzumchE+@lists.infradead.org
X-Gm-Message-State: AOJu0YwadFD0yH48UcVZuml1RkQXb637HOwqLtPxGp8quLM0FxDroNz4
	ktC0pN0cZTtEjz023uz4vg9+WBqK0BesxKX6VZEsi3LlhaEaPCDV/vhLf/hWmj+GCHUr/eOwWlv
	pIdeLgIe/aeMjFQ==
X-Google-Smtp-Source: AGHT+IFOU7LN1P9SI2vg/wWZstNB2r3hO1DClo1GN39AeEZT7OFuBcSCZpdcfIdpWCtlY2IVLQVavjRwLe6APw==
X-Received: from wmbbi16.prod.google.com ([2002:a05:600c:3d90:b0:45b:7fa6:f2ef])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:42c1:b0:45c:b6fa:352e with SMTP id 5b1f17b1804b1-462d4ca0573mr19699685e9.18.1758136315274;
 Wed, 17 Sep 2025 12:11:55 -0700 (PDT)
Date: Wed, 17 Sep 2025 19:11:39 +0000
In-Reply-To: <20250917191143.3847487-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250917191143.3847487-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250917191143.3847487-3-smostafa@google.com>
Subject: [PATCH v2 2/3] iommu/io-pgtable-arm-selftests: Modularize the test
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: robin.murphy@arm.com, will@kernel.org, joro@8bytes.org, jgg@ziepe.ca, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_121157_638646_98E32AA1 
X-CRM114-Status: GOOD (  14.21  )
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
index f7746ff2c7a0..5ac3e792c56d 100644
--- a/drivers/iommu/io-pgtable-arm-selftests.c
+++ b/drivers/iommu/io-pgtable-arm-selftests.c
@@ -12,34 +12,34 @@
 
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
 	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
 	struct io_pgtable_cfg *cfg = &data->iop.cfg;
@@ -57,9 +57,9 @@ static void __init arm_lpae_dump_ops(struct io_pgtable_ops *ops)
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
@@ -160,15 +160,15 @@ static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
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
 
@@ -208,4 +208,12 @@ static int __init arm_lpae_do_selftests(void)
 
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
2.51.0.384.g4c02a37b29-goog


