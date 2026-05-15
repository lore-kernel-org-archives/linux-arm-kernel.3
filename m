Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8ACECD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 09:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eXEOz2QeKOCh0TWnA0XGyH+pUT8xTMvIoFYTLYn5JsA=; b=hDLZ6sBdGDB7JtEYK/r1ydthWt
	R74Gh+xlQL0h3o2RFpXr90mjP2HhUrtwueu98kAaT7EOOPTPLpGkq6WCTG/IMKaT7hFD5jbFxl57x
	rUOSIc3XbE3rpKd6Af57I41ZsVsxqoi6yhKhJ1dmdrwvfN3tNd4P8tCAPaBGIEVSKoCVtL1V+sIbP
	ORwK61m6f8xas0JOSihzmKmqQ84AgBIR3T6HfFVdnpshC8775lPVp1EuI6mtEqxDxiU6GOOw/xto7
	rZeU9aqd4VUlbP/7WMJ5qaB/0bWpi30Uaova8uw0AO5d7e5Y9HNXlkmIrTqE5UHfP4Mta4tUeulGN
	kOYyFYvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNouP-00000007ttd-3CBS;
	Fri, 15 May 2026 09:32:43 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNouL-00000007tpR-012v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 09:32:38 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-393a44854d2so69754671fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 02:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778837555; x=1779442355; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eXEOz2QeKOCh0TWnA0XGyH+pUT8xTMvIoFYTLYn5JsA=;
        b=GRwayay4eNDM6m3pc/KCwDrBDx27i/o6FVJGOwx/TcrGcC8/tC5PE5CFYdXomW+QEI
         YdXoAvkPHD/K8Nz3ZuLCgJFLyaCyKTStx4jKe8STfCUOSQOz69lCPjTOK4ENTOEWl6jg
         CBp+cr6ZcyeZEmkCsN7GjnQp5tFOOhFXDnTMM9vj1BRfy9zvTbLjyvtsy3tBnTavdSyK
         4gFgukUgqVqwFpboWMmV7a9O3k55UXV7OH8mwu/TFBlYC+jVjUsujfFOY+fQyHOFedBx
         W9iCqtcNGBcf4Mwd7gnvQEi9pFrlysGUQzJKoWP/9apajs5EFmCJ2wt8fv4VKJl2tTGv
         w7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778837555; x=1779442355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eXEOz2QeKOCh0TWnA0XGyH+pUT8xTMvIoFYTLYn5JsA=;
        b=I85IZ4f0zRqcbMrXY/QVDiSlQARMK6GdpqU4zPMn43233xEfr1/r3WuaE1csT9Ec9z
         7SWbe7YeAGEUxnNNOTlw1XF8mc4vOfPodi2GlsYZnIqwRjkvuwpNmmEUTDD45GXcbYO2
         qO9jthaN58ts3Hpt5BLCrY0Pu0V/2HdkuWkWAyyIb+YRlVR1QZ4h4EqnrGbAxckmeUT1
         7773urjkqYMDIjtR94xAPNwTsVBobtxwtEi0COugnI+xovjMeqczEIyPQBMeBKi9RMpF
         LYVfnV7tujdBggjcj/kQB4zrZgr9cDPf4vBBK5Stu7lkT/z2J/lLXaWd3T1d7QmsqziU
         S6Tg==
X-Forwarded-Encrypted: i=1; AFNElJ/qlHDWaqqhlpNJLEcS5X0B4JXK+5Q1QySIycv0ooVnPro2Wnm8SKntjkKVO+UhuVLW571SBT5q7wiCiJeQvum1@lists.infradead.org
X-Gm-Message-State: AOJu0YwnPlzz+KqwT9FM1Jeh7U8Kx1Ja6fsXIg13YGL6DfuwagL1oH2S
	PgXPNMRy6d3WnlIijXVRdbKLXXdMgm6poGbp/8uFFFPi7f3Nu/d89XBNJTzpaIVcd6TlQ4sMhBa
	2/7S6RIQ=
X-Gm-Gg: Acq92OHMbOMp9XdDM/bkUDd+0TTCspjRw9HizRP8hR1n2JdiZ4dV2XBSZzS7pePNqfj
	LxwwYyb2edBWPgmYnWBXChB+Ivx/mQDY4rVUfXl/5bpKDKJ+Cy0W6Kn12ESJEdZw2KvoA3BLVXw
	rKXwTZlLHyhS00EaSOv9MYX9mYjzkUki36KZXQzJHPD/uhAhOp4c/wWaRiUqP8KOiYFt0m0GZ/j
	UZCiQFREMf2tqr/O6heuW+LK1GO1O9iEbefLyYZGiR0aRi3Ozvzx1Ov2o7mZT+pv2RxthQERUUw
	Hnu1HtPdPNVmReBahMbP9oLdUBUqMsaMVe/nT9SvElwDC/KqQ5h7udQyou176JzRxOIYIH4ske3
	nle6R34JLyKAUXzawv6DAH91MWmuMTW4ZUzfwZl+Mq6o5xK/aBTDyWcq4wAfDbbV3U3FYIbv2lb
	vCd8hBRxCPn6Hii+bqqmZpJhgOYBsDumPAt1mdz99+hRASglPuReMVpSFNzhSgpRkqtn+nk2wK3
	YKdCAb2
X-Received: by 2002:a05:6512:3b86:b0:5a3:ff48:f7db with SMTP id 2adb3069b0e04-5aa0e770e43mr771565e87.34.1778837553313;
        Fri, 15 May 2026 02:32:33 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c5e5sm1181661e87.3.2026.05.15.02.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:32:32 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 15 May 2026 09:32:28 +0000
Subject: [PATCH v2 4/6] firmware: samsung: acpm: Make acpm_ops const and
 access via pointer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-acpm-tmu-helpers-v2-4-8ca011d5a965@linaro.org>
References: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
In-Reply-To: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 peter.griffin@linaro.org, andre.draszik@linaro.org, jyescas@google.com, 
 kernel-team@android.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778837548; l=6120;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=CoP0NftcObikN9l/cqR8xC1/WPnUUUtOTxMCtFFGUC0=;
 b=JykrzFSkaugjyVv2ZC1Afc38Icl+cZPzHA0PelYSx0/Aod56VAyjzXXnp71T8x6UfdDhWg6+d
 +DxXNeVgIACBpEFooXdOpNKHF8ZNEpeMerhyWRsjrPKO+/35Jp4URZQ
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_023237_449122_909AE9E0 
X-CRM114-Status: GOOD (  18.29  )
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
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
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
index da960d3e1145..1a0d98b55439 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -670,30 +670,26 @@ static int acpm_channels_init(struct acpm_info *acpm)
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
@@ -734,7 +730,7 @@ static int acpm_probe(struct platform_device *pdev)
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
index b206efa62be6..fbf1829b33db 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -42,10 +42,10 @@ struct acpm_ops {
 
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
2.54.0.563.g4f69b47b94-goog


