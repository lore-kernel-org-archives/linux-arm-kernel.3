Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BBACCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 12:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ux05tU7+D0B7IZxmyew0p2paYr4GUNmlb17Kgdor7nc=; b=B5IUOjt1QUmZUuWC1XDfW/a/QM
	+mkiUWgfsk/EVGGnkZIgvC38dGzexzdpZaXXz3yRBrCK4uuBKhdQlkICFWzGz2gg9A7xQK+4hHpv1
	d30myalC3VFx/VIptVtGgVU+8s3gvLWCcCNyWw7pN5io6Z6tvnVdyp6qs46nwM8X+W6yr98gL41kR
	hHkXvBx5OIA36nb/YwyDzwPTN1So5jT8rCq0PjWm8TNlIYatcnT5YDLAbnE6sDT8W3sBNQtGQoZ8q
	EnZH/au2E/IdtmwbFYDGyuXl84nQHOnZdy00ewG0A/nksEA8DsdGcGyTnUrPEvmlOZJ2IQSBSD/9i
	8QE7Ex/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFtl8-00000009p6v-3yTc;
	Mon, 03 Nov 2025 12:34:06 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFtl6-00000009p5Z-3CSt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 12:34:06 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-429ce8ac89bso650232f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 04:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762173242; x=1762778042; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ux05tU7+D0B7IZxmyew0p2paYr4GUNmlb17Kgdor7nc=;
        b=QAS9+20zSB5v9BiidVtKvrQW+pJgNiapVyKwkjfoXBTOhV15IGRzmVAjUk+gqkjhIJ
         1G5hDT9w7ReAmWVVV6M0r1LIhsypKdcMI7L5BWxGx3WnKk116kieMFtEYLtN1K9XRQ3l
         mAqtCZu1XsOLiLx/cxVmRJmtx3sned5mB+V7yY+MWQp7ChZZz9TleAUenaKEqMMpxD3R
         xovyrsqTkeD9gEDE4RXdVR5tlNG/vyzSrB+YDIRnWVmTDo1I+k9rX1D3LDMXpuYv0E4+
         drNP8tUqTlutMa6MKtN6q83m75sEsqsvRYzpF4We4E2Hu4aTGOa0MdMnpYlbCk+RFU5Z
         +h/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762173242; x=1762778042;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ux05tU7+D0B7IZxmyew0p2paYr4GUNmlb17Kgdor7nc=;
        b=LjkyLVj8tPaWuBXEZgtzB3soahgfP3dA1NgiHaEGQ0T67/c186vw8QXnPxuXZqKveb
         mBP/94+UXT/D9LYQT5JRLK5ZQE5pZPVaisB3jJR4VBHhOgQZqbbv1ei1UMd0DyOKfJ8l
         nhRT2bz+35mggQWA5APmpinpvuVl6KTAFPRgWjhrakQi12HS9Xqxc1MeiRWysNufPJv5
         Vip54McgQuYsX57OAgFBorzHl8deYMCaoeekk6n+jA9um2Av4DkOF5CJaAD/VDJ+9Iur
         uvcFiXpebd+6gGxyizjVH7a2WOQfh+1Up4ufNDbMCkYZAS8mvHZN8FUrfZW7HCnIjurN
         zWBg==
X-Forwarded-Encrypted: i=1; AJvYcCUrSsPw/D73Lr0gLPLqO2hItXP2t37PeGjVcGvft9zhGpdDVhJYn6XThWZ3npuwFvG3REhI/mR23LfyWSvSasnU@lists.infradead.org
X-Gm-Message-State: AOJu0YyizskYraGzZxrD0wlCSSUzawc4RxvZjL2kpn1ta7UrjTdEMEQq
	pjsG7KKy2OzP0x1XNmHV947BF76GQ7KhAt1QDQLcP68YgsWoez6qiPVQxrhgIpsRrhcMFaN7XM3
	rrb4TKPGwkH2TRg==
X-Google-Smtp-Source: AGHT+IGrApuZXSqW3lxjcwRKlTmVFlztNd2Jc9n1hjMR+iMt6HX4Z1G6N1X7IymUPj+PYiV5MnuQog6Tf7KgIg==
X-Received: from wmfv2.prod.google.com ([2002:a05:600c:15c2:b0:475:d804:bfd2])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2301:b0:429:bcd7:ac9f with SMTP id ffacd0b85a97d-429bd6ac60fmr10501171f8f.53.1762173242489;
 Mon, 03 Nov 2025 04:34:02 -0800 (PST)
Date: Mon,  3 Nov 2025 12:33:49 +0000
In-Reply-To: <20251103123355.1769093-1-smostafa@google.com>
Mime-Version: 1.0
References: <20251103123355.1769093-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251103123355.1769093-2-smostafa@google.com>
Subject: [PATCH v6 1/4] iommu/io-pgtable-arm: Remove arm_lpae_dump_ops()
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: robin.murphy@arm.com, will@kernel.org, joro@8bytes.org, jgg@ziepe.ca, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_043404_815893_AB334199 
X-CRM114-Status: GOOD (  14.20  )
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

At the moment, if the selftest fails it prints a lot of information
about the page table (size, levels...) this requires access to many
internals, which has to be exposed in the next patch moving the
tests out.

Instead, we can simplify the print to only print the fmt and
for each test ias, oas and pgsize_bitmap are already printed.
That is enough to identify the failed case, and the rest can
be deduced from the code.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/io-pgtable-arm.c | 41 ++++++++++++----------------------
 1 file changed, 14 insertions(+), 27 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 7e8e2216c294..7d6d7221f540 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -1297,21 +1297,8 @@ static const struct iommu_flush_ops dummy_tlb_ops __initconst = {
 	.tlb_add_page	= dummy_tlb_add_page,
 };
 
-static void __init arm_lpae_dump_ops(struct io_pgtable_ops *ops)
-{
-	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
-	struct io_pgtable_cfg *cfg = &data->iop.cfg;
-
-	pr_err("cfg: pgsize_bitmap 0x%lx, ias %u-bit\n",
-		cfg->pgsize_bitmap, cfg->ias);
-	pr_err("data: %d levels, 0x%zx pgd_size, %u pg_shift, %u bits_per_level, pgd @ %p\n",
-		ARM_LPAE_MAX_LEVELS - data->start_level, ARM_LPAE_PGD_SIZE(data),
-		ilog2(ARM_LPAE_GRANULE(data)), data->bits_per_level, data->pgd);
-}
-
-#define __FAIL(ops, i)	({						\
+#define __FAIL(i) ({							\
 		WARN(1, "selftest: test failed for fmt idx %d\n", (i));	\
-		arm_lpae_dump_ops(ops);					\
 		-EFAULT;						\
 })
 
@@ -1340,13 +1327,13 @@ static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
 		 * Empty page tables shouldn't provide any translations.
 		 */
 		if (ops->iova_to_phys(ops, 42))
-			return __FAIL(ops, i);
+			return __FAIL(i);
 
 		if (ops->iova_to_phys(ops, SZ_1G + 42))
-			return __FAIL(ops, i);
+			return __FAIL(i);
 
 		if (ops->iova_to_phys(ops, SZ_2G + 42))
-			return __FAIL(ops, i);
+			return __FAIL(i);
 
 		/*
 		 * Distinct mappings of different granule sizes.
@@ -1359,16 +1346,16 @@ static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
 					   IOMMU_READ | IOMMU_WRITE |
 					   IOMMU_NOEXEC | IOMMU_CACHE,
 					   GFP_KERNEL, &mapped))
-				return __FAIL(ops, i);
+				return __FAIL(i);
 
 			/* Overlapping mappings */
 			if (!ops->map_pages(ops, iova, iova + size, size, 1,
 					    IOMMU_READ | IOMMU_NOEXEC,
 					    GFP_KERNEL, &mapped))
-				return __FAIL(ops, i);
+				return __FAIL(i);
 
 			if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
-				return __FAIL(ops, i);
+				return __FAIL(i);
 
 			iova += SZ_1G;
 		}
@@ -1379,18 +1366,18 @@ static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
 			size = 1UL << j;
 
 			if (ops->unmap_pages(ops, iova, size, 1, NULL) != size)
-				return __FAIL(ops, i);
+				return __FAIL(i);
 
 			if (ops->iova_to_phys(ops, iova + 42))
-				return __FAIL(ops, i);
+				return __FAIL(i);
 
 			/* Remap full block */
 			if (ops->map_pages(ops, iova, iova, size, 1,
 					   IOMMU_WRITE, GFP_KERNEL, &mapped))
-				return __FAIL(ops, i);
+				return __FAIL(i);
 
 			if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
-				return __FAIL(ops, i);
+				return __FAIL(i);
 
 			iova += SZ_1G;
 		}
@@ -1406,11 +1393,11 @@ static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
 				   IOMMU_READ | IOMMU_WRITE |
 				   IOMMU_NOEXEC | IOMMU_CACHE,
 				   GFP_KERNEL, &mapped))
-			return __FAIL(ops, i);
+			return __FAIL(i);
 		if (mapped != size)
-			return __FAIL(ops, i);
+			return __FAIL(i);
 		if (ops->unmap_pages(ops, iova, size, 1, NULL) != size)
-			return __FAIL(ops, i);
+			return __FAIL(i);
 
 		free_io_pgtable_ops(ops);
 	}
-- 
2.51.1.930.gacf6e81ea2-goog


