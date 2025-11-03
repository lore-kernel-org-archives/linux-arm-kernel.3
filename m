Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B529CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 12:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eb5/iRLBLqsffznaL4L+fLHOh9qr7aNQqsvWygVRwbI=; b=yyuGHguAzBRZfm7HmNPvIr1qAw
	2sIzMf5+fr5yIuuqV7l1uVRH7DCsVlcZcMqGLC6rVHiHNBuWbD2lPPYPAJelBKdrsRctXmpq/oa+m
	nWdNPevvZCKeHgWMlLWAMF/Ht7jd+1HcXYmCFBRFGMiwImPBAaJWZEQh8ntXtKHhX0ioraHL7BoxK
	QJe2vXV2fcUQvVzVuRCu1oFKW+i7q0kRZJwN+SYNH3vuvJEpx/UwIc6g873aEPRhYYMW1Q/1RWp42
	B6de5GskLsl3apS2ghnsZPzWbavIeY9vV8+tSNAvh6/zAJhcYGl/s/rBd3Wmts9afYOAOwGwXk/MP
	judLTtCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFtlC-00000009p9B-0FOe;
	Mon, 03 Nov 2025 12:34:10 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFtl8-00000009p5r-1rX4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 12:34:07 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-47106a388cfso34641815e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 04:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762173244; x=1762778044; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eb5/iRLBLqsffznaL4L+fLHOh9qr7aNQqsvWygVRwbI=;
        b=TM+PA1jGb3gesFulLpDWTt4TxAuL//WBBwn1stiE2+EMEq4oqpaKiBy/vLawxtg39B
         l++4BC0REY+9rHdYjaPlzmSHc0IUKN2ghBxoUoYMpV+cO+lz7sku3nIF6U2GPzSEFGxD
         FS1g2V4aetKTE3HeYjqMkd7RAJtsR9TvLM365WhshiJANp565iLLVDwP5LYe9eYgPN3u
         DIwL93cthnqlON05gcO6vcDiD4HUpyZZ9XAYqrzoWieDsL1sPC9ivkQWpTKJ+qRauRVQ
         /5TInUivL0b+Zrsb81tyatJmg1H6JPkMBxjc+z9XHhnHLkNPBRLKS7jJY457CY6Aq+vY
         qcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762173244; x=1762778044;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eb5/iRLBLqsffznaL4L+fLHOh9qr7aNQqsvWygVRwbI=;
        b=e4necfC2dhsRBf0BmI43koTlmlnvZ7EpZ8Q3FgEpnQRbGu4twqbnIPfPHRxkQVkkjc
         wIThgvylSDHI1jt7/rKpC+QU6fy/31R8vwf8ezMnFpjQb/3VHBA/gC7FwvT7m2ANi2DM
         g2eRhz6CC9/JpvdEixDEurLp5gM7dNEIwHrE6CkOc5kQT6++dgtmQenHs2IvO8XOwgtu
         IfWmlu8GOYsn9E+sM+f/GgI3Dpxc1BisaaQabw9n7YlQ0fKW2EaxaKP95uePTpz6jruD
         dGf+hviTU0gMX5ikEMbKIkTVtIgFe968fdL3cqlMNeBkfhsr8cdhejoOw1e6aMv390SI
         ayAw==
X-Forwarded-Encrypted: i=1; AJvYcCVV7pNWhMoFDpSE70VpFM0P3fRasBUK041qb433BXFaMGyUtwBZtKSaTIZdkwUIKulcfBB8Aqgjz9eseHlxIpNE@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0+Ig8O/T4f24wVmexlvKoAHnWmXzU8eiQ2MNaHfYbVFIpM/QF
	kfhqAnp1fnVRTUpe/vaE8XsxODbdSJHyz4Pq2uA/1DU1uOcMjLGKdl5KfKLqjxwtZYVq2q1YqEQ
	o2M0IvuC+oxROAw==
X-Google-Smtp-Source: AGHT+IEVmWefjtycrwY1ECoBVYWfmLjbUY7S32z2Glhi1U/9AlZNIJz93PqCys7M1yOpDXipEHbSZOCG4Dm05Q==
X-Received: from wmbdv10.prod.google.com ([2002:a05:600c:620a:b0:475:df4b:95a9])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:530e:b0:477:1bb6:17e5 with SMTP id 5b1f17b1804b1-47751697433mr11754125e9.30.1762173244166;
 Mon, 03 Nov 2025 04:34:04 -0800 (PST)
Date: Mon,  3 Nov 2025 12:33:51 +0000
In-Reply-To: <20251103123355.1769093-1-smostafa@google.com>
Mime-Version: 1.0
References: <20251103123355.1769093-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251103123355.1769093-4-smostafa@google.com>
Subject: [PATCH v6 3/4] iommu/io-pgtable-arm-selftests: Modularize the test
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: robin.murphy@arm.com, will@kernel.org, joro@8bytes.org, jgg@ziepe.ca, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_043406_499847_83AA7BB5 
X-CRM114-Status: GOOD (  13.48  )
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
index 5da6d4b69920..8361d01b49c5 100644
--- a/drivers/iommu/io-pgtable-arm-selftests.c
+++ b/drivers/iommu/io-pgtable-arm-selftests.c
@@ -15,28 +15,28 @@
 
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
@@ -47,9 +47,9 @@ static const struct iommu_flush_ops dummy_tlb_ops __initconst = {
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
@@ -150,15 +150,15 @@ static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
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
 
@@ -198,4 +198,12 @@ static int __init arm_lpae_do_selftests(void)
 
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
2.51.1.930.gacf6e81ea2-goog


