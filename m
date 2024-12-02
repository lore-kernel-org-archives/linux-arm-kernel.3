Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2017DD78321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 14:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h1RF9JX+BAZDIHBPnUvFPOFh27GXZinqCyp9d856qhI=; b=vnuSNN/kYSQ1tnaNsYphrYoJGJ
	H+s0T351A0T/quNwfTL/N/YE7zdX+sK2WGpTiWq0Y8boaIFI7S3fy817XrExETFwRdyva8MVOqIYD
	x5If1c2C/RMdKndXnMu4CjvYaaxm5DReG3jP6Ypqafv+a9s0+eBI7LgW/ryiHJHF5etWtuCEktwtk
	Ir4KwI1uoSoQxrtGj+CkbUwLe9DFq+lNl/l189y91k7UaS8geLqMWRxJQ8WDofnIr5RPEOVK8leDN
	RLWtQTuaVKhtaO72ng1/H/QrxNg5TInHprf2nPCS3K80+0NaLaVO4SK1pIjLBZHHnRpCUsZwPLMS2
	eDz8DYow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI766-00000006Mnc-1I19;
	Mon, 02 Dec 2024 14:08:22 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI74F-00000006MSv-00hX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 14:06:28 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4349df2d87dso40882745e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 06:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733148385; x=1733753185; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=h1RF9JX+BAZDIHBPnUvFPOFh27GXZinqCyp9d856qhI=;
        b=oP5rWWxAULFfL3w9XatEpm3o+bLVfB45nh+WbBQNrpSDXQjPfSfadr4U5bzBetf/KK
         LOker4bkQJZOGdkIswG8n9gnwfuCNwCmSiRBbwIrWf54QxQyF/z1mUs7iJ9O+D36zPxA
         ozfNcZHD8bKvdFdY6zLOcSJT0Yg4PARBQmWvHQUfLJg5p7/CL9feFoQMM8B2kz+kUwXQ
         2jvNuPlWWhpvK3YmKoOSYn1ej2uzbv4M900L+0pqhqnD8lAXIm+Lb6x+uVBMC7cX0exU
         XHEakcBW3xP6PqM4sfBN4GV827puVvUKo+36oalWAqNOJI/rWUboAXMBe4Dhhym266VD
         emrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733148385; x=1733753185;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h1RF9JX+BAZDIHBPnUvFPOFh27GXZinqCyp9d856qhI=;
        b=GI3cLjFFHeNL+81TFFIuL2qU1haLQxV4VprAz7tCKI/E/w9VGLf2+jI5/HJqhmhWC5
         JCvx1N5NQOHUpxf/NtDiyj6LK9ScfFh3CNG7ABqzDgnfMFUnD8xLwL2K17JWv44A4pOp
         xRd0t8VAxZQXxvhSkhK1ojkevYQrbbH55JjBgytufKKfUvRXc0SBNn7KuljpEdD3Hn8d
         rQX/oU5OIB86MTzfntKTdBpnHI7FVmbvFsO/dsFDjxHXvlW0QhQZLVFgTDm86xWVBZ9V
         glgVtFvMx7XK1t/jUUfX1u3liXrsz9rb2QKG95Z9OrOgvLpc67g8k98SirRtezBS8jba
         yKKA==
X-Forwarded-Encrypted: i=1; AJvYcCWyTl11l/gf5sDblhpAtDJAOX0EveMfDvebOGcB6ea/tzMs64jYoXtgTx2dcCFPFsk6muoUwNttq5jCgBHwm7qR@lists.infradead.org
X-Gm-Message-State: AOJu0YwcIhEBvVvQ/s07EAosLkGwyOP3OqERqOl6g1ItDKvs5G7qeeG8
	3465hTECyqQzkU5XjBb/tWeqRdYFiQA4Uh/bLa7QGvPa3vaNYvJoG7NgzWsPh74CNNAQvmUYuyW
	H9ibBY0B7Bg==
X-Google-Smtp-Source: AGHT+IGbcuRYpTh4YD2s/LlLvQ+RLHNmyee/bZzsqF0w9Suqv7VzmqnzD+QY/tWrJ1jck1m9Bz5q92qEuZjfxg==
X-Received: from wman26.prod.google.com ([2002:a05:600c:6c5a:b0:434:9fab:eb5])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5493:b0:432:d735:cc71 with SMTP id 5b1f17b1804b1-434a9de8e1emr227230595e9.25.1733148385023;
 Mon, 02 Dec 2024 06:06:25 -0800 (PST)
Date: Mon,  2 Dec 2024 14:06:03 +0000
In-Reply-To: <20241202140604.422235-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241202140604.422235-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241202140604.422235-2-smostafa@google.com>
Subject: [PATCH v2 1/2] iommu/io-pgtable-arm: Fix stage-2 concatenation with 16K
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_060627_037458_0FE03687 
X-CRM114-Status: GOOD (  18.40  )
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

At the moment, io-pgtable-arm uses concatenation only if it is
possible at level 0, which misses a case where concatenation is
mandatory at level 1 according to R_SRKBC in Arm spec DDI0487 K.a.

Also, that means concatenation can be used when not mandated,
contradicting the comment on the code. However, these cases can only
happen if the SMMUv3 driver is changed to use ias != oas for stage-2.

This patch re-writes the code to use concatenation only if mandatory,
fixing the missing case for level-1 and granule 16K with PA = 40 bits.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/io-pgtable-arm.c | 45 +++++++++++++++++++++++++---------
 1 file changed, 33 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 6b9bb58a414f..0055876b3527 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -223,6 +223,33 @@ static inline int arm_lpae_max_entries(int i, struct arm_lpae_io_pgtable *data)
 	return ptes_per_table - (i & (ptes_per_table - 1));
 }
 
+/*
+ * Check if concatenated PGDs are mandatory according to Arm DDI0487 (K.a)
+ * 1) R_DXBSH: For 16KB, and 48-bit input size, use level 1 instead of 0.
+ * 2) R_SRKBC: After de-ciphering the table for PA size and valid initial lookup
+ *   a) 40 bits PA size with 4K: use level 1 instead of level 0 (2 tables for ias = oas)
+ *   b) 40 bits PA size with 16K: use level 2 instead of level 1 (16 tables for ias = oas)
+ *   c) 42 bits PA size with 4K: use level 1 instead of level 0 (8 tables for ias = oas)
+ *   d) 48 bits PA size with 16K: use level 1 instead of level 0 (2 tables for ias = oas)
+ */
+static inline bool arm_lpae_concat_mandatory(struct arm_lpae_io_pgtable *data)
+{
+	unsigned int ias = data->iop.cfg.ias;
+	unsigned int oas = data->iop.cfg.oas;
+
+	/* Covers 1  and 2.d */
+	if ((ARM_LPAE_GRANULE(data) == SZ_16K) && (data->start_level == 0))
+		return (oas == 48) || (ias = 48);
+
+	/* Covers 2.a and 2.c */
+	if ((ARM_LPAE_GRANULE(data) == SZ_4K) && (data->start_level == 0))
+		return (oas == 40) || (oas == 42);
+
+	/* Case 2.b */
+	return (ARM_LPAE_GRANULE(data) == SZ_16K) &&
+	       (data->start_level == 1) && (oas == 40);
+}
+
 static bool selftest_running = false;
 
 static dma_addr_t __arm_lpae_dma_addr(void *pages)
@@ -1006,18 +1033,12 @@ arm_64_lpae_alloc_pgtable_s2(struct io_pgtable_cfg *cfg, void *cookie)
 	if (!data)
 		return NULL;
 
-	/*
-	 * Concatenate PGDs at level 1 if possible in order to reduce
-	 * the depth of the stage-2 walk.
-	 */
-	if (data->start_level == 0) {
-		unsigned long pgd_pages;
-
-		pgd_pages = ARM_LPAE_PGD_SIZE(data) / sizeof(arm_lpae_iopte);
-		if (pgd_pages <= ARM_LPAE_S2_MAX_CONCAT_PAGES) {
-			data->pgd_bits += data->bits_per_level;
-			data->start_level++;
-		}
+	if (arm_lpae_concat_mandatory(data))  {
+		if (WARN_ON((ARM_LPAE_PGD_SIZE(data) / sizeof(arm_lpae_iopte)) >
+			    ARM_LPAE_S2_MAX_CONCAT_PAGES))
+			return NULL;
+		data->pgd_bits += data->bits_per_level;
+		data->start_level++;
 	}
 
 	/* VTCR */
-- 
2.47.0.338.g60cca15819-goog


