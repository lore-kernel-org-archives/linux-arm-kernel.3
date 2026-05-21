Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FA2CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 08:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=67GxWVV7KudmGLluNHMN7T/eL7yIw6j5sPwUF4A8FPI=; b=KVciIB6DO/0pV+cUc2LnZkYL5e
	NAXW6JXC4yLFl2zmb6RR//BfBrw0PygbD2mp01CM4JiUuQZZReMIv5KtwKt5QYt9WKziLL73R685/
	O+tv4Ba8Kv95xNo0MrI1gPvEOEJc16rUiGXW8dT54sTY/vbj9fIw3N3wbzUfE5I0+4OnmyUfhAHU+
	YgLtAF8Zol5qjRPEQTy0Edemw1S0v0XTLC+JU+ZmD7OuCPfudcfoBAF4ol+S80T2KjmpRbh7dqhMs
	IbaKS7RRjNe3hd327VmRg7RTJ0d8somfs20blVBsQohxfBihfmoeQcZU0brg5162hTHYYByQ8/67G
	/u7OVQNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPykJ-000000078XW-1cjH;
	Thu, 21 May 2026 08:27:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPykH-000000078VT-02sP;
	Thu, 21 May 2026 08:27:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5EC9B60212;
	Thu, 21 May 2026 08:27:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D278AC4AF0C;
	Thu, 21 May 2026 08:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779352027;
	bh=nrmg3HWgO9uceNXtSgM/Z0gIFOwywmG6C/cjZ3MQNRg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lsbs/SCa6p3fbOzxKPf34ToX+DYsBS5QxvDLoTNHqWIRdx14VpoHl0McLsd9Cmf5F
	 Ca7WXCX7Uh68tuyMhLF8/OeeVIWZ3EUGKMNgAZwFRFmsHDClBs/ATGXRLXPppTzMt9
	 ZLobIdIPV0q8aZjX0npQFH2hAzCzFZEsjafiBSmkC9krjvHAaTYa0ZqyfSJ8PkSy6k
	 LywhsXikY28TB3eW2Ko612L2KZ6gK+KyJXg739OA/TkEXmrU5QOXMVxiudW74ddPCJ
	 Vvb15xvM3g2dO2lPY+t8N2Fs+LC46tj1mne3UulrO8LaNMIevGYawA4z23D5f4oioP
	 PyLXYwhMHUyrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0881CD5BAF;
	Thu, 21 May 2026 08:27:07 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 21 May 2026 08:26:59 +0000
Subject: [PATCH v3 2/2] pwm: meson: Add support for Amlogic S7
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-s6-s7-pwm-v3-2-57b073fbafef@amlogic.com>
References: <20260521-s6-s7-pwm-v3-0-57b073fbafef@amlogic.com>
In-Reply-To: <20260521-s6-s7-pwm-v3-0-57b073fbafef@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779352023; l=5104;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=ee7S/9E5/xxvFyHNx3kYA681vl0XgvW4Y8eFZhpoo0U=;
 b=TXiAdEYbw/KybAgqyonbV6T/exp3oQ74Da0C919cp5Yin7jK9EMw1J+LofGU2rmIBRHa/Yom2
 qGwM9+P1ScGAT1BFgu9YEEYa3gT6jpNbGBiMxyO/URz5UFU2L/CFeJe
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
 drivers/pwm/pwm-meson.c | 41 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 8c6bf3d49753..66c41bf036de 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -113,6 +113,7 @@ struct meson_pwm_data {
 	int (*channels_init)(struct pwm_chip *chip);
 	bool has_constant;
 	bool has_polarity;
+	u8 npwm;
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
@@ -530,6 +543,7 @@ static int meson_pwm_init_channels_s4(struct pwm_chip *chip)
 static const struct meson_pwm_data pwm_meson8b_data = {
 	.parent_names = { "xtal", NULL, "fclk_div4", "fclk_div3" },
 	.channels_init = meson_pwm_init_channels_meson8b_legacy,
+	.npwm = MESON_NUM_PWMS,
 };
 
 /*
@@ -539,6 +553,7 @@ static const struct meson_pwm_data pwm_meson8b_data = {
 static const struct meson_pwm_data pwm_gxbb_ao_data = {
 	.parent_names = { "xtal", "clk81", NULL, NULL },
 	.channels_init = meson_pwm_init_channels_meson8b_legacy,
+	.npwm = MESON_NUM_PWMS,
 };
 
 static const struct meson_pwm_data pwm_axg_ee_data = {
@@ -546,6 +561,7 @@ static const struct meson_pwm_data pwm_axg_ee_data = {
 	.channels_init = meson_pwm_init_channels_meson8b_legacy,
 	.has_constant = true,
 	.has_polarity = true,
+	.npwm = MESON_NUM_PWMS,
 };
 
 static const struct meson_pwm_data pwm_axg_ao_data = {
@@ -553,6 +569,7 @@ static const struct meson_pwm_data pwm_axg_ao_data = {
 	.channels_init = meson_pwm_init_channels_meson8b_legacy,
 	.has_constant = true,
 	.has_polarity = true,
+	.npwm = MESON_NUM_PWMS,
 };
 
 static const struct meson_pwm_data pwm_g12a_ee_data = {
@@ -560,6 +577,7 @@ static const struct meson_pwm_data pwm_g12a_ee_data = {
 	.channels_init = meson_pwm_init_channels_meson8b_legacy,
 	.has_constant = true,
 	.has_polarity = true,
+	.npwm = MESON_NUM_PWMS,
 };
 
 static const struct meson_pwm_data pwm_g12a_ao_ab_data = {
@@ -567,6 +585,7 @@ static const struct meson_pwm_data pwm_g12a_ao_ab_data = {
 	.channels_init = meson_pwm_init_channels_meson8b_legacy,
 	.has_constant = true,
 	.has_polarity = true,
+	.npwm = MESON_NUM_PWMS,
 };
 
 static const struct meson_pwm_data pwm_g12a_ao_cd_data = {
@@ -574,22 +593,33 @@ static const struct meson_pwm_data pwm_g12a_ao_cd_data = {
 	.channels_init = meson_pwm_init_channels_meson8b_legacy,
 	.has_constant = true,
 	.has_polarity = true,
+	.npwm = MESON_NUM_PWMS,
 };
 
 static const struct meson_pwm_data pwm_meson8_v2_data = {
 	.channels_init = meson_pwm_init_channels_meson8b_v2,
+	.npwm = MESON_NUM_PWMS,
 };
 
 static const struct meson_pwm_data pwm_meson_axg_v2_data = {
 	.channels_init = meson_pwm_init_channels_meson8b_v2,
 	.has_constant = true,
 	.has_polarity = true,
+	.npwm = MESON_NUM_PWMS,
 };
 
 static const struct meson_pwm_data pwm_s4_data = {
 	.channels_init = meson_pwm_init_channels_s4,
 	.has_constant = true,
 	.has_polarity = true,
+	.npwm = MESON_NUM_PWMS,
+};
+
+static const struct meson_pwm_data pwm_s7_data = {
+	.channels_init = meson_pwm_init_channels_s7,
+	.has_constant = true,
+	.has_polarity = true,
+	.npwm = 1,
 };
 
 static const struct of_device_id meson_pwm_matches[] = {
@@ -642,7 +672,11 @@ static const struct of_device_id meson_pwm_matches[] = {
 		.compatible = "amlogic,meson-s4-pwm",
 		.data = &pwm_s4_data
 	},
-	{},
+	{
+		.compatible = "amlogic,s7-pwm",
+		.data = &pwm_s7_data
+	},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, meson_pwm_matches);
 
@@ -650,9 +684,10 @@ static int meson_pwm_probe(struct platform_device *pdev)
 {
 	struct pwm_chip *chip;
 	struct meson_pwm *meson;
+	const struct meson_pwm_data *pdata = of_device_get_match_data(&pdev->dev);
 	int err;
 
-	chip = devm_pwmchip_alloc(&pdev->dev, MESON_NUM_PWMS, sizeof(*meson));
+	chip = devm_pwmchip_alloc(&pdev->dev, pdata->npwm, sizeof(*meson));
 	if (IS_ERR(chip))
 		return PTR_ERR(chip);
 	meson = to_meson_pwm(chip);
@@ -664,7 +699,7 @@ static int meson_pwm_probe(struct platform_device *pdev)
 	spin_lock_init(&meson->lock);
 	chip->ops = &meson_pwm_ops;
 
-	meson->data = of_device_get_match_data(&pdev->dev);
+	meson->data = pdata;
 
 	err = meson->data->channels_init(chip);
 	if (err < 0)

-- 
2.52.0



