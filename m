Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC7CF5A8AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 17:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vxBc/M4G+txQiEXs+oWY+3uh4E2qPUY9zSyWwwZhU0Q=; b=GHYnvAGUfbNaSSKWaIw8/1GOQr
	XpPLCkEJVVFvmQnunk+/j08Q6YVP6TeJUigIPI4isacxRKOR2y2eeQs0nUddMNKRdVmqJ/XrN131c
	PGoV+67ac0Xz5n21DTkqps0XoATO0RqITxlZ8fM6fMGIZ8g47S+B9x6G+rykGZ5yOO/+Zu89AqLiW
	UGDx9Zn+UHxELZSsbZeCyC3L2Y30utjBm+/f3IA35xaWyUceSlANGLBzJpE9Ewxfrjyv2Ut108g+9
	doDGl6+DVEgvyRfo0GKxzaj428cCMCExrjxngifCYXoJrIibXJlKBm4AW3L+Q+bOxUjZ0sU7EYChM
	0Zs/Tz5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEsba-00000007V56-0mTT;
	Mon, 20 Apr 2026 17:40:18 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEsbS-00000007Uzd-0AxI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 17:40:11 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-48896199cbaso35033685e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 10:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776706808; x=1777311608; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vxBc/M4G+txQiEXs+oWY+3uh4E2qPUY9zSyWwwZhU0Q=;
        b=PMC4u2yUY/8n4ihcZTb5ZIoNMG46oysDONYF3GhsXJnb381GJJgx/L+BcRRXkR1loD
         P/VjPzeEMieRJWYs7pdg9OlNfuSzzbyQft2qxy6m94oQKDhEFiJ5K5z1aj5zHmx7aTEi
         LTuMdkOXJcU2yWlz74fC+n3ozPACKxOq3fCbuTDVaE4b0RVjnleWQVJS48rrg7bkkBs7
         aaCzTj3VSp5wiazIO4z5rDqAIryW+Vm38OM0Suhk72QnkQcFxnsGOc3lS3j6R5EZpZkw
         btEr/z+3aaa94dEqdEnXgSZRHYO3htrjSsxRmsT9Vjlz4mqvfyeuKglwFLX9k/cySQfq
         b6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776706808; x=1777311608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vxBc/M4G+txQiEXs+oWY+3uh4E2qPUY9zSyWwwZhU0Q=;
        b=NAo02M8sEtwMywBtcliq5xoE52qHSwv2+mxhW6uUZk2u0WP0PrmukQIxBVJFPMMM+d
         wRaZHItunvGvvVTS98gOtsmFeCNE8EQInxSGiBWa1OaKOCmCwjJeg7WAV6D3hnV23XFj
         K5I0apqtQTchiPIiTa8k6IyFgyaV4zCbMKkxJvHlegH+Y6Nzh2tCWLrOmIbY3P6Vvz+C
         KOPSswiairAL3JJkU41/EI+QRmhnrGMvfRoBbJ1GP0xIby9U0vTmk692wyRHK9i9m45f
         FzvXGOSOizb8VZHFirkfh2YQuE/R3oakl2Ym+MERVaCLTcloTSY/lVNqhnb07ulq4MvE
         uJzA==
X-Forwarded-Encrypted: i=1; AFNElJ/0z+EeD6vpbcYRE4RrhhH4muDPt3ccyZFaNNfydoicIcinPCRsmuZsst4v/Sgp4fTiT9e9zPaqvKg1mDfK2b03@lists.infradead.org
X-Gm-Message-State: AOJu0YyQkRGrvGcoQQLRW8JXtz1vISnWNdmOQiCQUeFlsBDSj8vi9BMf
	9shLJADygZ8oNZADIL/+UiPLHWaSkDPNFe4gWmTZ1R0G/B4XmkMvitI2xnAoTBa8vsk=
X-Gm-Gg: AeBDietJX5ISIuOdWeznDt3RwbqEVTuSO26stjehOpl4jkGELST7PnFMcuKI1h3497p
	3U0lkb5KpdcA4JPj2RWcYTIYIpEwPdHK5xsckI8K+SSpDw+QFCer1PuvuUpOEZ/h3fBhVwF4KZT
	C7G/sYsj5J5i9B1odBLpnjeCYy/igHVa6ThQzGFmJWcEWtxg7jooeuOZsPJDcS+DI7PEHaG+IWh
	l02j/HrhShKD+gymLWPyXIKW6Tzigj4WZki5wvLwm0yd+gtDb0/60D3wgQkL6Yd6dE5jL794FbI
	cGBWRseI0hS0H6bDZQrSUtcKLOCaVV/SH7g9Xpjd0HFVnlaNkVnu74XddOoxZ6QJmHvhbsgZJ5Z
	Wq2tUEEOHiqV7UPprjTM9z5yTTeqsYZx6df2ME6MmMk5mlIwXUShVi5gNYpgSLNarYf4b82EBQc
	ZG5JvGhzRjMbMQaohB0j2tRRqAB/QVIS2BLbzqDV3qTYNIS7rCUjBWrsyoxTyWA3mVt+IiCHWhP
	c+E4X2R9elLRcbNnA==
X-Received: by 2002:a05:600c:154e:b0:488:9ed3:1492 with SMTP id 5b1f17b1804b1-488fb74fc02mr205225595e9.10.1776706807908;
        Mon, 20 Apr 2026 10:40:07 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb72d365sm144280285e9.1.2026.04.20.10.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:40:07 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 20 Apr 2026 17:39:50 +0000
Subject: [PATCH v3 04/10] firmware: samsung: acpm: Make acpm_ops const and
 access via pointer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-acpm-tmu-v3-4-3dc8e93f0b26@linaro.org>
References: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
In-Reply-To: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 linux-clk@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776706804; l=6069;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=TKfgOUvv2UcX7X0tyk1IsalC6JmJHiID4ANvKVR4gGI=;
 b=yPHNYBxf7QnMWUXaEk9LWCsOzM8jHb2VsWtybvDRQxbO69Xt+rNMUJo0MncsB/iNRhmSVWg67
 oAcDAwgi6d0A7mvuDSXLbfmXaFZoou+EEXxq9wDSnbLCykXmuPaYAB6
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_104010_158363_A1BD5BCA 
X-CRM114-Status: GOOD (  18.83  )
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

Replace the embedded `struct acpm_ops` inside `struct acpm_handle` with
a pointer to a `const struct acpm_ops`.

Previously, the operations structure was embedded directly within the
handle and populated dynamically at runtime via `acpm_setup_ops()`.
This resulted in mutable function pointers and unnecessary per-instance
memory overhead.

By defining `exynos_acpm_driver_ops` statically as a `const` structure,
the function pointers are now safely housed in the read-only `.rodata`
section. This improves security by preventing function pointer
overwrites, saves memory, and slightly reduces initialization overhead
in `acpm_probe()`.

Consequently, update all consumer drivers (clk, mfd) to access the
operations via the new pointer indirection (`->ops->`). Finally, fix
the previously empty kernel-doc description for the ops member to
reflect its new pointer nature.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/clk/samsung/clk-acpm.c                     |  8 ++---
 drivers/firmware/samsung/exynos-acpm.c             | 36 ++++++++++------------
 drivers/mfd/sec-acpm.c                             |  6 ++--
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  4 +--
 4 files changed, 25 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acpm.c
index 93667777094c..953ca8d5720a 100644
--- a/drivers/clk/samsung/clk-acpm.c
+++ b/drivers/clk/samsung/clk-acpm.c
@@ -68,8 +68,8 @@ static unsigned long acpm_clk_recalc_rate(struct clk_hw *hw,
 {
 	struct acpm_clk *clk = to_acpm_clk(hw);
 
-	return clk->handle->ops.dvfs.get_rate(clk->handle, clk->mbox_chan_id,
-					      clk->id);
+	return clk->handle->ops->dvfs.get_rate(clk->handle, clk->mbox_chan_id,
+					       clk->id);
 }
 
 static int acpm_clk_determine_rate(struct clk_hw *hw,
@@ -89,8 +89,8 @@ static int acpm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct acpm_clk *clk = to_acpm_clk(hw);
 
-	return clk->handle->ops.dvfs.set_rate(clk->handle, clk->mbox_chan_id,
-					      clk->id, rate);
+	return clk->handle->ops->dvfs.set_rate(clk->handle, clk->mbox_chan_id,
+					       clk->id, rate);
 }
 
 static const struct clk_ops acpm_clk_ops = {
diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 39d3d2317659..4f2ad84cd783 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -610,30 +610,26 @@ static int acpm_channels_init(struct acpm_info *acpm)
 	return 0;
 }
 
-/**
- * acpm_setup_ops() - setup the operations structures.
- * @acpm:	pointer to the driver data.
- */
-static void acpm_setup_ops(struct acpm_info *acpm)
-{
-	struct acpm_dvfs_ops *dvfs_ops = &acpm->handle.ops.dvfs;
-	struct acpm_pmic_ops *pmic_ops = &acpm->handle.ops.pmic;
-
-	dvfs_ops->set_rate = acpm_dvfs_set_rate;
-	dvfs_ops->get_rate = acpm_dvfs_get_rate;
-
-	pmic_ops->read_reg = acpm_pmic_read_reg;
-	pmic_ops->bulk_read = acpm_pmic_bulk_read;
-	pmic_ops->write_reg = acpm_pmic_write_reg;
-	pmic_ops->bulk_write = acpm_pmic_bulk_write;
-	pmic_ops->update_reg = acpm_pmic_update_reg;
-}
-
 static void acpm_clk_pdev_unregister(void *data)
 {
 	platform_device_unregister(data);
 }
 
+static const struct acpm_ops exynos_acpm_driver_ops = {
+	.dvfs = {
+		.set_rate = acpm_dvfs_set_rate,
+		.get_rate = acpm_dvfs_get_rate,
+	},
+
+	.pmic = {
+		.read_reg = acpm_pmic_read_reg,
+		.bulk_read = acpm_pmic_bulk_read,
+		.write_reg = acpm_pmic_write_reg,
+		.bulk_write = acpm_pmic_bulk_write,
+		.update_reg = acpm_pmic_update_reg,
+	},
+};
+
 static int acpm_probe(struct platform_device *pdev)
 {
 	const struct acpm_match_data *match_data;
@@ -674,7 +670,7 @@ static int acpm_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	acpm_setup_ops(acpm);
+	acpm->handle.ops = &exynos_acpm_driver_ops;
 
 	platform_set_drvdata(pdev, acpm);
 
diff --git a/drivers/mfd/sec-acpm.c b/drivers/mfd/sec-acpm.c
index 9e15b260b8df..3397d13d3b7f 100644
--- a/drivers/mfd/sec-acpm.c
+++ b/drivers/mfd/sec-acpm.c
@@ -391,7 +391,7 @@ static int sec_pmic_acpm_bus_write(void *context, const void *data,
 {
 	struct sec_pmic_acpm_bus_context *ctx = context;
 	struct acpm_handle *acpm = ctx->shared->acpm;
-	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
+	const struct acpm_pmic_ops *pmic_ops = &acpm->ops->pmic;
 	size_t val_count = count - BITS_TO_BYTES(ACPM_ADDR_BITS);
 	const u8 *d = data;
 	const u8 *vals = &d[BITS_TO_BYTES(ACPM_ADDR_BITS)];
@@ -411,7 +411,7 @@ static int sec_pmic_acpm_bus_read(void *context, const void *reg_buf, size_t reg
 {
 	struct sec_pmic_acpm_bus_context *ctx = context;
 	struct acpm_handle *acpm = ctx->shared->acpm;
-	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
+	const struct acpm_pmic_ops *pmic_ops = &acpm->ops->pmic;
 	const u8 *r = reg_buf;
 	u8 reg;
 
@@ -430,7 +430,7 @@ static int sec_pmic_acpm_bus_reg_update_bits(void *context, unsigned int reg, un
 {
 	struct sec_pmic_acpm_bus_context *ctx = context;
 	struct acpm_handle *acpm = ctx->shared->acpm;
-	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
+	const struct acpm_pmic_ops *pmic_ops = &acpm->ops->pmic;
 
 	return pmic_ops->update_reg(acpm, ctx->shared->acpm_chan_id, ctx->type, reg & 0xff,
 				    ctx->shared->speedy_channel, val, mask);
diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
index 62a3eb450067..e13d9ac73ff6 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -41,10 +41,10 @@ struct acpm_ops {
 
 /**
  * struct acpm_handle - Reference to an initialized protocol instance
- * @ops:
+ * @ops:	pointer to the constant ACPM protocol operations.
  */
 struct acpm_handle {
-	struct acpm_ops ops;
+	const struct acpm_ops *ops;
 };
 
 struct device;

-- 
2.54.0.rc1.555.g9c883467ad-goog


