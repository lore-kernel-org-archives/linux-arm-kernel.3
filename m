Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD77CAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 13:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dta3w9x0Kzr2/YC3aAI2cLcS4FTvsApb1bOklp+8AkE=; b=lMsmX18Ms48jYD/s7OMYIcaob8
	LjH87AVX3UVT66Di+GsgWSg+W07g6eHgw0Cg9Zn3sRhpbFhvvphEAly/xpSttY8bwRkpKxWzPhqiS
	BV7apsCElTpdRtfK4g2ucyZeUbB+bjrkHSQZbw2S7b7Y5G3fjuLqXk9uqwhHYeNw/Kec5f+J7FGpH
	R0/EgI5WdPTWh/CDf235xoOBoKmv9jFdv/JpqzJ6RwTc9gnRTDz3G+hFCvARPaV9QBHUe4uw3+U2f
	XP5Otuo6SuUyl2xo752+mGU3hMyllEhONUhDVgBX/7buiSBQmF9fnqS0qjyIal10VPqGcKFFKdd2E
	+7UPpj5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzbEv-00000003065-00RU;
	Fri, 19 Sep 2025 13:33:29 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzbEo-0000000302c-3HaJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 13:33:23 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3eb0a50a518so1403346f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 06:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758288800; x=1758893600; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dta3w9x0Kzr2/YC3aAI2cLcS4FTvsApb1bOklp+8AkE=;
        b=z+pqv/L8kCLLCFnAwm3xV4pHYSJdqy47KjEXcXDHwFsbL+oEBleoevEXW4z5ZHRDCe
         RPCrtBXVasKZTh9KJLWvBekPOHvy1F0c+2StKStRS1eaNK4VVxcxCPw46IZ6w7bqn9/P
         H2Gs5NNPnxpJk3cx/hZ5M2MMErvOEeRavhDhvrKGlA6vCmveyhAbTBiWaFpHpDlzeBvf
         lWXQdsY9x1732bEPSiio+OMNY/ZAlztbLVs63uAT2BbJLxYmw/JkpBAPs1vZ3FO1zDQ5
         dSbUV4BUJrUzXYK9eOrwA/umZVGQtajDlYnLEaHuevIHiYHeuaRIV4DCzZPi3tTqjiEy
         3f6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758288800; x=1758893600;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dta3w9x0Kzr2/YC3aAI2cLcS4FTvsApb1bOklp+8AkE=;
        b=nqAL4fm7xVwwAQO3KFYIiH4dGbLoZkrqa5r8IKbvIf3x2HL6Hok1It1702C3C0+hB1
         tvAHkpVkwNCXnUVJuUK9z6vQSJqzstzFds6UbPHsnh1Xswg6qRirGSFSyiwjXbUosQJH
         u4bFnu43kyNufjc/YhHeZj3HUqo4+XOcvoMCEX1zgA3iZgBorB1BrTF1M2iFau+PpAN4
         du2I/b0we5HU7h14o2tAL/gKcBrCYgKcJDeFQhK8yvnQNUcdJPxVsHARaRCxL6A/nC+n
         EVH2mxuW+nhqOlIq6WmINQpsUbGU0NNY5PRbHM+9dPLhb8ZI4GssvNb6zYJQ6WfYyAZD
         +PSw==
X-Forwarded-Encrypted: i=1; AJvYcCXoK4IggUFSLtHxsB2AV0SMBYFLxlYyd1KQf9xrJMkRE7kimLB6XPhgG0DlGiJC9ij4djSPfx+dkYUABxlKmIzm@lists.infradead.org
X-Gm-Message-State: AOJu0YzDw86KSDtNZ3ymu+y5HJ/jhV86FgU6BS2yQb2Wwkcz+C4c3WNj
	2icccFPjCNy9Qwem2acLraeeFw1vAcrydVzX/7/SwG4eDANnPaMiEb2RTAqW5E3utXlGfHhf9qL
	9rhwbB5a7KJxCXg==
X-Google-Smtp-Source: AGHT+IEfxiQvwNODoSv0Q8MyC2iij/p4VeQe4Qd7UQdXLmJ90VPgVJBy+TPvBsuyLaP4UaVBUz+AHld+iqa7Dg==
X-Received: from wmbdr20.prod.google.com ([2002:a05:600c:6094:b0:45c:b62f:ca0d])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:450a:b0:45e:8e:28bf with SMTP id 5b1f17b1804b1-467eb231105mr25807885e9.28.1758288800565;
 Fri, 19 Sep 2025 06:33:20 -0700 (PDT)
Date: Fri, 19 Sep 2025 13:33:10 +0000
In-Reply-To: <20250919133316.2741279-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250919133316.2741279-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.0.534.gc79095c0ca-goog
Message-ID: <20250919133316.2741279-2-smostafa@google.com>
Subject: [PATCH v3 1/4] iommu/io-pgtable-arm: Simplify error prints for selftests
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: robin.murphy@arm.com, will@kernel.org, joro@8bytes.org, jgg@ziepe.ca, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_063322_825107_2F270C04 
X-CRM114-Status: GOOD (  13.79  )
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


