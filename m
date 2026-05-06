Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85CFCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 12:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LC2V7L5MNeD6JRSN42bm026kYg+hHIPEct1+4nQZRpY=; b=vFWmcIss/5yeRMFbtKSUO/eyBv
	4NiRSXGoR+TVg4z4SQAlm52NrmnLxK5r/wGjMVKWoHueJG1E7jswkPiknaH07rDGaiysBhJl11JGw
	EscjNsvYEQ0n645qznJH5wOVNd7jA6C9TDoi23Qcm+ACSwPO2+w4suvNGm/AyxrLCVJd8VsczTpH8
	UfEK4yedtmjRZhcSYGGn22PyUzGhin7cx4s5kVmvLZPxb4UZxtDiLDRlwl7zRrGIKdzcE5j3A59Nu
	fJo+YxCWNcOuu4hPDTFvA09DeJCHFmFxiUGz2ldwx6LCJdTWXs82FSx12wrn7k9DuljbAEFNVecMV
	Y8dl+N7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKabB-00000000eQq-13Wz;
	Wed, 06 May 2026 11:39:29 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKab8-00000000eOI-36u9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 11:39:26 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so59956465e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 04:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778067565; x=1778672365; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LC2V7L5MNeD6JRSN42bm026kYg+hHIPEct1+4nQZRpY=;
        b=xS8Ur1gGDUKV2xmZ5DxsPEws9gIWjk95euRW5XxOSgCz4dDlYr91kEfTu4BdMo2wpV
         Bez8oVbjiXBZ4BSDtdnLbZjRKcWKR4xP4ZanYeU0dV9wSsyDCQL4AR6mWf2QlqrXecK/
         VYjixBrmJ3eqOhxwToVf8SGiCawOdzV9UMoMTZ25MCUp2GPATS7xM5YLMnbsOKFkCSsa
         F5obRKduGh6G+pbN+buJJsUIHCKKXGfBIfR5zlVp4zHNA4m2fySDHQZfRCayfdWlEKSx
         ZccSe5yZWNLhka4fv/Z6h/HCNpesXt6n4mfpZFSbZrldJWpUJxwlUAmyiKEabO9ZbdsV
         aojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778067565; x=1778672365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LC2V7L5MNeD6JRSN42bm026kYg+hHIPEct1+4nQZRpY=;
        b=DDwvCjnz3WjzK9bqZVmDA75swJ7N5YnYw9nBuWs63eYPCXfBvz59S1Asc6LzZjq2g/
         QCMOMFb9V+g+k3/QVH/e4EwW3FkQEPTQqpxxaxAD6jo7UlJCzSlWdab+/UhvK5BFoRvj
         lIwVceESXzcPmgs1X5RY4qD6aCSwG/J72JJvOv7TBMeafByOEbYf4A/9Gu46SJN+PeFD
         6EmNJj4WhjquWdBUQhBp+FEvt8pPv59/qGr/+Nnb6L8X8lV5PDmCgr9C2CcvOEiucIJ5
         n9lC7QXeGn2Mb8FlLss7aioKtXTsFd2LVbnlN3X2fu94FZbsP1OIeNIqz9tViQvILze2
         uNdA==
X-Forwarded-Encrypted: i=1; AFNElJ98tLMcPudITzifRPzaxqGAFk6XQmO3EELMhSdQ6bqx9Ex6H2VjyMWyl3ppGOG2PZ8an6WNL5Tpy3BTncAW8cCr@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0VhSuvxkVvBY0hF7d5xzGzb+qN003rxizq6zgGd9IWNPh1sqi
	zBWkIcFysWR9wZllwo/IfXkvrRidEkSYikh6LIP5TxlTVDXgDnRdO8zgFW9xpnGDZ50=
X-Gm-Gg: AeBDietXiLqMfL1SJXsNgkxbzFihECph6wCo6PMQ6cdlMVKs2pMc0uHkboOOe0N2e7I
	10/q7nv9nDoiLTpqFSO4fBUzh9cLMnFtCgiDz9/eeYCvVBU9Pz6GhEas2Vb6x/In/GcutdhG5rv
	UHmXaky0wI7ILxcTRrKD4Zxqw6AVWvj28w4EsQQvhZX1Ewd/CQVjcJkhKzT4QjV0JEauc37sYB5
	BmYDuSuWgcZFfUBrF+PpuYQFHx9H+7DDPZw3SAj99i0/NpRUzbbPbF9ulw22GMt7tYVVGBBKMqd
	sUEG+x1/P41elXX5QglVaU6FvWm+2rZbvQOcogVgb1yk8otBN4rATiovCdttMG56khzdjn0Ba+y
	Fj4SVCvXxbMee4ZeNaPBNtLBojgDobPS/LcYO31zUW+7GpxRI/ETtXziQjSMdJd0pdS0qI88qQm
	Xhnm5SWVUuj9K2WYUvS6Gq2sKWW4ww6CJoutMCck33681rjMiMYiS1WAXBG+L/mCaiOfFmV/cTr
	iiHAL3Om8NmTxcm9A==
X-Received: by 2002:a05:600c:8011:b0:485:35d3:ce59 with SMTP id 5b1f17b1804b1-48e51e1a545mr48855035e9.10.1778067564787;
        Wed, 06 May 2026 04:39:24 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4505238e6e0sm11852350f8f.6.2026.05.06.04.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 04:39:23 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 06 May 2026 11:39:06 +0000
Subject: [PATCH 4/6] firmware: samsung: acpm: Make acpm_ops const and
 access via pointer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-acpm-tmu-helpers-v1-4-a9cd5daf8355@linaro.org>
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
In-Reply-To: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778067561; l=6065;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=rvG1FU/yzeppWfRfa1yi/pl0sQB7nwSNY4B9HK/7PzY=;
 b=q7uxU2+x4M5v5Y7lgDRgH3mPouc9ZTFFuaU6VeV5us/VlznbPWvWpvFipIAUKrRTi3snxP0gW
 okPof9XAajAAaiPYBGDvOUvmWT0ve0ac68SgF5T1G8zj+VJ4ve9rS89
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_043926_843495_24672E66 
X-CRM114-Status: GOOD (  18.24  )
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
2.54.0.545.g6539524ca2-goog


