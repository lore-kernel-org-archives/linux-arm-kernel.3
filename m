Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72077109E556
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 06:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i6YhX3a9DHJpg1phBkNK+f4yai3vuNt2ernwks+wFQE=; b=iAEOx0zSXj5b/MTIhAgS1vsdb/
	sH+xuIuKqG2Djaltg1kIgAlZHUm5lXDBeAuy3pd5ywZQ6UURP0h+eKiZQC0bfQGO7cT0rJ1EYNJdf
	PDoGybQ/ZP2X0oth3HgptcJ8on2CuW1pfGbaPtFpmSqFyhaYotKe127Yqa+hYnTW3AzrKjJTljTKC
	Fxm1p9ZD6i8IIcgbevCytxen4SEWkyWDeuY96KTVM52ekKreuiuYbhcC4fI2wGdnZ6Nk9VQHAW9VY
	zoU7xvf4EpDOv/SkkEzU43qRavc5irXeQzwwC8p5ApmhJjbfPSY2CCbiCqpEw4Wuj6oUWZXqKpaOf
	CPTHF/Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5eJs-00000004qks-0c3u;
	Thu, 26 Mar 2026 06:35:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5eJo-00000004qjp-3FUF;
	Thu, 26 Mar 2026 06:35:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B07966012B;
	Thu, 26 Mar 2026 06:35:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D9AEC2BCB2;
	Thu, 26 Mar 2026 06:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774506947;
	bh=8CZX++UUTXa58HsRlEqWqi7GMzVxrwXHQ2fHN+iqTfw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mhDypZ5AES0Rvc312KkiBO3mUBEuroyw6jhnlm0ICSg0AGaCm65g4FGDSdxVfUq7a
	 sV7VmN4ScATfCy+CEaYpctYESMzJJ8gr9q8fmuUveCkPIVIvCJaorOGFeTSGvoXxDu
	 dYpPX3TSUHnuga4TMg+OpIBMBHtLv8oktpMq7FsEbm1tsY42cVwYBlPFMyWY33HlPI
	 s2s9xoIVU8HiHaBSKMF9oWa999rn/y2qWrZPfxDzsxb9uJJIh9Ba01RfuzyubWgXV+
	 oi+q7DFiFMofhmkHWhNg3TZ4TxtmuXFhw00MAyoev4kDZ5kMUDA2ST3K8uT1zdYW9g
	 D/0HlUj+5fHrw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31AA7109E556;
	Thu, 26 Mar 2026 06:35:47 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 26 Mar 2026 06:35:39 +0000
Subject: [PATCH 2/2] pwm: meson: Add support for Amlogic S7
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-s6-s7-pwm-v1-2-67e2f72b98bc@amlogic.com>
References: <20260326-s6-s7-pwm-v1-0-67e2f72b98bc@amlogic.com>
In-Reply-To: <20260326-s6-s7-pwm-v1-0-67e2f72b98bc@amlogic.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774506945; l=2820;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=sjF9pLMeA6zX83u1Sj97nxYlkERmG+eMOAkz7HWjlx4=;
 b=9MtBShGvvikwdhcA8XgDQsj3gtE8V3HDwdmZS7YqfG2UubeK+WFWdHjoZS12VhGczRcW2mTgY
 TH797RUyvAPBKlHcxIVAFct8fC6mM2rA+0dnXsEIdY/8waPvmNWja3O
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add support for Amlogic S7 PWM. Amlogic S7 different from the
previous SoCs, a controller includes one pwm, at the same time,
the controller has only one input clock source.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/pwm/pwm-meson.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 8c6bf3d49753..3d16694e254e 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -113,6 +113,7 @@ struct meson_pwm_data {
 	int (*channels_init)(struct pwm_chip *chip);
 	bool has_constant;
 	bool has_polarity;
+	bool single_pwm;
 };
 
 struct meson_pwm {
@@ -503,6 +504,18 @@ static void meson_pwm_s4_put_clk(void *data)
 	clk_put(clk);
 }
 
+static int meson_pwm_init_channels_s7(struct pwm_chip *chip)
+{
+	struct device *dev = pwmchip_parent(chip);
+	struct meson_pwm *meson = to_meson_pwm(chip);
+
+	meson->channels[0].clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(meson->channels[0].clk))
+		return dev_err_probe(dev, PTR_ERR(meson->channels[0].clk),
+				     "Failed to get clk\n");
+	return 0;
+}
+
 static int meson_pwm_init_channels_s4(struct pwm_chip *chip)
 {
 	struct device *dev = pwmchip_parent(chip);
@@ -592,6 +605,13 @@ static const struct meson_pwm_data pwm_s4_data = {
 	.has_polarity = true,
 };
 
+static const struct meson_pwm_data pwm_s7_data = {
+	.channels_init = meson_pwm_init_channels_s7,
+	.has_constant = true,
+	.has_polarity = true,
+	.single_pwm = true,
+};
+
 static const struct of_device_id meson_pwm_matches[] = {
 	{
 		.compatible = "amlogic,meson8-pwm-v2",
@@ -642,6 +662,10 @@ static const struct of_device_id meson_pwm_matches[] = {
 		.compatible = "amlogic,meson-s4-pwm",
 		.data = &pwm_s4_data
 	},
+	{
+		.compatible = "amlogic,s7-pwm",
+		.data = &pwm_s7_data
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, meson_pwm_matches);
@@ -650,9 +674,13 @@ static int meson_pwm_probe(struct platform_device *pdev)
 {
 	struct pwm_chip *chip;
 	struct meson_pwm *meson;
+	const struct meson_pwm_data *pdata = of_device_get_match_data(&pdev->dev);
 	int err;
 
-	chip = devm_pwmchip_alloc(&pdev->dev, MESON_NUM_PWMS, sizeof(*meson));
+	if (pdata->single_pwm)
+		chip = devm_pwmchip_alloc(&pdev->dev, 1, sizeof(*meson));
+	else
+		chip = devm_pwmchip_alloc(&pdev->dev, MESON_NUM_PWMS, sizeof(*meson));
 	if (IS_ERR(chip))
 		return PTR_ERR(chip);
 	meson = to_meson_pwm(chip);
@@ -664,7 +692,7 @@ static int meson_pwm_probe(struct platform_device *pdev)
 	spin_lock_init(&meson->lock);
 	chip->ops = &meson_pwm_ops;
 
-	meson->data = of_device_get_match_data(&pdev->dev);
+	meson->data = pdata;
 
 	err = meson->data->channels_init(chip);
 	if (err < 0)

-- 
2.52.0



