Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59808CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 09:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dta3w9x0Kzr2/YC3aAI2cLcS4FTvsApb1bOklp+8AkE=; b=JUmsY8uTjgFDo+yKhvd6GyV898
	ybwgaWjmcjKoMFQTXxcQn1ft8hOK/QR2tJRWxV3QxZczk/JFBsuW/dzOzDY33Omp80da7W4U4nJyd
	wzn92Z4TEeCObAyurQ0n578aXtmkDit9zVbMOevepcaD3/81LK6n7BQEOAjdzpDXoZoiPSCUG7Kc9
	4PWTH2wpgmOI5jivps7NMvRldOEtIuy+0P6eEeXnwCYxSovLrWpgM7DS+z98EgZZbJfR0WuRivhpE
	b6c/xYVXb53TlAzEP2t6z1RrNnbR6QNbFd/r1qCZkm/i+YlHDN6qu3p++mNYcMArfxcrOvWLTz1gE
	fj3cqkQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0cP4-00000009or3-13rD;
	Mon, 22 Sep 2025 09:00:10 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0cP2-00000009oq4-1ID7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 09:00:09 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-45dd66e1971so33660225e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 02:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758531606; x=1759136406; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dta3w9x0Kzr2/YC3aAI2cLcS4FTvsApb1bOklp+8AkE=;
        b=aHgQY27xglRFqVrzbBVJsk1R+L7a4Thbguvg/prs1QrfD6D5zczclnu6ho5uOJc+aG
         2hJ43qjkjv9gHTEl5//6QuF8vKlCWfGTJHqwIsN05dVx0Y7lNyWdC9eGfGNzfKggUrM6
         k1e413US927wLtOtBduOcXI7C+CZvnkdhVugR/XjUw8E8a+uV3efxhkPg58ua4LjovQa
         YbldkUFIUM5dkClF92ZkgyO3Yn8l216EidOXUuoN/QabhhmbEdbPdnCCQteyycIlagEI
         uifQwoUkZPOPA66nn9PuxGmAbAoWBFd42jXL8/1wAE6CGe+c8pGYU8CnOOsGgBp8Gbfj
         HR5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758531606; x=1759136406;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dta3w9x0Kzr2/YC3aAI2cLcS4FTvsApb1bOklp+8AkE=;
        b=jbczICFlGD8OlkEnT7rF+85yJlnAPI9FL0mvRDB2WCuXiVtEB/q+IYO+qN0J2sDoeH
         gLMIBnB68sZNn/6opMqIEpompE/a8W0Z8R62rET4lqog3J7OaZXq7KOG661X49d7TlaH
         a65bjxzm7sn3jdqoXOZKU0rv7S9i+Q/4Ehl4ecMbHYyIxDBSEKFxaMJH7IC3Vs4TQHfU
         CePvY2SDd8vxJGVyjcj95OhFHXSontWeI0oVnaZUE9BYs7DI3c7PZdyRZDv4v9EdWOf9
         yZT24lZmrRdjXegwIwfu0YAJnamUKsjT83I9wH4FzzSLrYwnoALLEEYQVGLlrLkuJ/Ll
         yMlw==
X-Forwarded-Encrypted: i=1; AJvYcCWe8V3glcXcVyPvrFvtb+DPbfg7SidmxM1E2tnrl3fcL31uNFIWhdDi9micQqbERJil2CO6DEhWbQdVQJrj1WHl@lists.infradead.org
X-Gm-Message-State: AOJu0YzKslL9lcR7o9Yof20cHpp7yVbS3LKcbXDtNpEMxGCT5kGwPsdA
	OdC9xhY7I4reTwJHcBjUUgwkuBV4Y26FBrO7CfEv3LVPNkTZ1EsKf6jwIijsskW6IL1tNqOxC9W
	8JJpMtxVaIyr3VA==
X-Google-Smtp-Source: AGHT+IEqtivvAp1LSR1yfY3OPo8H0NhHHFJcQpxkNow9ciOTTfMvMKV71pcO7sOl6lYxK9wepfDZCsUMSsF6Iw==
X-Received: from wmbep17.prod.google.com ([2002:a05:600c:8411:b0:45d:d179:882f])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fc6:b0:46e:1aa8:44a3 with SMTP id 5b1f17b1804b1-46e1aa845c9mr2814975e9.37.1758531606327;
 Mon, 22 Sep 2025 02:00:06 -0700 (PDT)
Date: Mon, 22 Sep 2025 08:59:25 +0000
In-Reply-To: <20250922090003.686704-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250922090003.686704-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.0.534.gc79095c0ca-goog
Message-ID: <20250922090003.686704-2-smostafa@google.com>
Subject: [PATCH v4 1/4] iommu/io-pgtable-arm: Simplify error prints for selftests
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: robin.murphy@arm.com, will@kernel.org, joro@8bytes.org, jgg@ziepe.ca, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_020008_348625_F9C5FE29 
X-CRM114-Status: GOOD (  13.98  )
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

At the moment, if the self test fails it prints a lot of information
about the page table (size, levels...) this requires access to many
internals, which has to be exposed in the next patch moving the
tests out.

Instead, we can simplify the print, using ias, oas, pgsize_bitmap
and fmt is enough to identify the failed case, and the rest can
be deduced from the code.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/io-pgtable-arm.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 7e8e2216c294..00218af5d5f7 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -1299,14 +1299,10 @@ static const struct iommu_flush_ops dummy_tlb_ops __initconst = {
 
 static void __init arm_lpae_dump_ops(struct io_pgtable_ops *ops)
 {
-	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
-	struct io_pgtable_cfg *cfg = &data->iop.cfg;
+	struct io_pgtable_cfg *cfg = &io_pgtable_ops_to_pgtable(ops)->cfg;
 
-	pr_err("cfg: pgsize_bitmap 0x%lx, ias %u-bit\n",
-		cfg->pgsize_bitmap, cfg->ias);
-	pr_err("data: %d levels, 0x%zx pgd_size, %u pg_shift, %u bits_per_level, pgd @ %p\n",
-		ARM_LPAE_MAX_LEVELS - data->start_level, ARM_LPAE_PGD_SIZE(data),
-		ilog2(ARM_LPAE_GRANULE(data)), data->bits_per_level, data->pgd);
+	pr_err("cfg: pgsize_bitmap 0x%lx, ias %u-bit oas %u-bit\n",
+		cfg->pgsize_bitmap, cfg->ias, cfg->oas);
 }
 
 #define __FAIL(ops, i)	({						\
-- 
2.51.0.534.gc79095c0ca-goog


