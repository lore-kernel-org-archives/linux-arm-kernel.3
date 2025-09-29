Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA0DCAC5BC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 15:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJHC5+QTP14fX//LZe/mxMEbJxRo0xwg0ar5poMq1uA=; b=q5X1aufxfqP2FbbaOelE46Yd2p
	ZrfDMsfGaQAaNS+voRzyphAe23MYuKOtBZJesoObpmzdhEeYryhdwEVv4uws/HBqpvBVEVbQrkFp+
	r/kbdhx8F7arJr8NB1bPvBqJGPk8eW0FjM+EDT8kdJPMVH7PeqbjGHys+SdP6HrOwklOMldNKIiA1
	pBEb/QhwS0Ifd181wKJf7PkHFleo7fUv7YIWlS4g0v8ZWEKfwHfUozjfhyX/qF3ZqN1cJf1qLYUDG
	XMXJ0NXnmlJ0zNDtBmnTBS0yozrXp93wzz5GnbRIpKfbC8EzfXE2bAbn8Cueu6CQSFzFFX/XJ+cob
	08wRfdHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3G8o-00000002pb3-3Gds;
	Mon, 29 Sep 2025 15:50:18 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3G8j-00000002pXA-1dfz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 15:50:14 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-46e31191379so30891085e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 08:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759161011; x=1759765811; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NJHC5+QTP14fX//LZe/mxMEbJxRo0xwg0ar5poMq1uA=;
        b=gL5772IOXzi5hlkKTo9Yv+5zrTOocGarzrF0CAKJfkQvPe2waqBXgz97JBi00H3fvI
         VwZHvqmVE2CaP50bmyGtjJ1Fb8LWoklG5GG/5T16oQGJz6FJA0aThS6ykysM0J3NncTv
         XvXrmTEf2od+pNsbHUtkFgEAFROR/v29Vw2fBmzwlc+sC/iu0bTTQvd5Uuw/FZ2Pyh7C
         1V7kqgyUxxRSs1lSLc8JJvTci0Ez2L/iOkDfo4xR/2Lb1qZzqqKDKroLrP7tcILovu86
         ojxTzVxZO/STFt4TJSdvdkLb5ho64ykvwI8bsnRLy5OdxQdDokzutFTItCkjja8bJryq
         jGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759161011; x=1759765811;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NJHC5+QTP14fX//LZe/mxMEbJxRo0xwg0ar5poMq1uA=;
        b=cN2BwV0gZCpsu6f7e5cjdeCmAkbAsPOY62z7TV5UrtelVXT/D91GLmRmy8EJNSj6TH
         VFvblM3+HPn2FnGIVut9rArBZWHrGfEIXN6C7fM7mMln+4gBTZXp9mwAfcRn8sBx1IGW
         2hSLzko0yD5QHSW+sqkz0xEebptjYyDLuMAE4wujZOA5ziPAL5IkYMX/NPvceg+QWclC
         IsqeqHPGA1pVsLkycaMDDNuJm9p/2EgE9YHhD6kQAd152nBU7kefsVKXw6sCKCPXPU07
         ZfNL39x3OeY6WViNGanTPnDotEbGYr/TEJCfb2SgHDn5lvr5iP7Ugp9He/UGC1qldZae
         rjEg==
X-Forwarded-Encrypted: i=1; AJvYcCUeZikPmPfWi056EJFcIiVUP7m97cCYdRf+Pw0s+8lhh2dBN/G4Vj+PkOtOaIzr1fufNM2SRNt2rJb+yo6lHN83@lists.infradead.org
X-Gm-Message-State: AOJu0YySncZlHiN8RDjWQyRHIg+3pSEMN58rAhaF2se7jhbGj7qK9z4j
	5TIRe3pP/tiWYyNfn9RMt39Fp1YSdfPe2Njxx6saKgFrPRXstYYJRJDnWlu2biFiu7IB1TguUDo
	yvwHq2+8ZHN+b0A==
X-Google-Smtp-Source: AGHT+IGJdB4UkTz6NAZVLYJ2/soJK1B0n31V38CHkgl+oXUofMABzkVMr26Gvt6jH1taH1deIPwoc1q3Va7b8Q==
X-Received: from wmv18.prod.google.com ([2002:a05:600c:26d2:b0:46e:37a7:48c1])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:444d:b0:45b:7a93:f108 with SMTP id 5b1f17b1804b1-46e3299a5b5mr158005385e9.3.1759161010656;
 Mon, 29 Sep 2025 08:50:10 -0700 (PDT)
Date: Mon, 29 Sep 2025 15:49:58 +0000
In-Reply-To: <20250929155001.3287719-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250929155001.3287719-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.0.536.g15c5d4f767-goog
Message-ID: <20250929155001.3287719-4-smostafa@google.com>
Subject: [PATCH v5 3/4] iommu/io-pgtable-arm-selftests: Modularize the test
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: robin.murphy@arm.com, will@kernel.org, joro@8bytes.org, jgg@ziepe.ca, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_085013_459490_F23721A8 
X-CRM114-Status: GOOD (  14.41  )
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
Reviewed-by: Pranjal Shrivastava <praan@google.com>
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
index 6ee5329c06c2..32c6a5c7af53 100644
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
 	struct io_pgtable_cfg *cfg = &io_pgtable_ops_to_pgtable(ops)->cfg;
 
@@ -53,9 +53,9 @@ static void __init arm_lpae_dump_ops(struct io_pgtable_ops *ops)
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
@@ -156,15 +156,15 @@ static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
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
 
@@ -204,4 +204,12 @@ static int __init arm_lpae_do_selftests(void)
 
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
2.51.0.536.g15c5d4f767-goog


