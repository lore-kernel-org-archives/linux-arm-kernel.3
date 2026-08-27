Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CAFC61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 08:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fVZkd6yETQZF4b70clcGhzJ5SWiVoQhGNRs3mh78Cac=; b=nzlWDI/ZMnq5rheW1x4uPX9L+Q
	6GmLeIV6s6DvkvABL4NNGkdKoRZdlc59IJNGFydUro9e81XtvQ7Amc1NsshySKK4x8kBm8P4WSEuZ
	y1Y/JA78TQU62A1Mjw3LKxVCN8dEM4UhaLK1p2Irn3rRL3QavPFirzAIjvQlOaBiDwwgkkurlO/Ls
	/UkJeR/A1DJNUOCJxBPNg2LkHauow6eQNRQSTpaF1TIOAM36WVgrsyULycjNm2e0nxSKLwk1rjYUv
	YA0lp3zU6sLmaOSgg5OLixVN8cSHm7vslHw8JJnLvglryLgMfvhY4tJRNBSI6wwh7QGVO/DWAhItY
	O4wflPFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVfE-00000003eyi-1UI2;
	Thu, 27 Aug 2026 08:40:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVfD-00000003exj-2ZeF;
	Thu, 27 Aug 2026 08:40:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0FB27434BB;
	Thu, 27 Aug 2026 08:40:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB58FC2BCFA;
	Thu, 27 Aug 2026 08:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787820046;
	bh=fCtAMe4g2dnp7uoVqhfhA8xkjx6xBz/IzJykgOh3Txc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DjsG7k9bWHXICF7RpPVzkZG6RfWV6Fo2Qi2sFeg1Omjdot5AkVq0IOulj4prdd5hQ
	 VqfNGp48Ndd/7/G7XHEyGjswMY20sy//Jy+RG6fFIEui8QU1xPYOH+lcTTnxvFc168
	 mSJs00CGcvzzVQBwDsyOkqXP1PEPekVuwYZGZ/ea8hRyzsl+g2FbvM/uvmClan5CN1
	 oRDJ93rHHv6YMf2kwlgBSgVRhQUiKTPc5MxEwOP80mLEKZ+hEktHSkBuFAKjZd87DD
	 09a39hrdTd6m6DLnorUKt6CIQLD8WFo9qDmeBVhboW0M6LbrosLItrdV69HeWekHLi
	 edtsjwwk9p5og==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A016FC61DC7;
	Thu, 27 Aug 2026 08:40:46 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 27 Aug 2026 08:40:11 +0000
Subject: [PATCH v4 2/4] pwm: meson: add the PWM count driver data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-s6-s7-pwm-v4-2-d28a2015177d@amlogic.com>
References: <20260827-s6-s7-pwm-v4-0-d28a2015177d@amlogic.com>
In-Reply-To: <20260827-s6-s7-pwm-v4-0-d28a2015177d@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787820043; l=4621;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=XWBLCai/fzPSLXT+rV6gvMmqDHi7OFZogDsuyVzW6gk=;
 b=Rh9OjEOD7SNxnECzTQEmrJSTchFP5bhVfta+X6y2sVbP3EbhfJ6CZfSi1WkgC2qIsCwNZv0rq
 Z1YyvX/Xj/fCH3vrsAFgdZ5vcf9hEZiU/0sVB4IXqNQ7PoIEkRdXils
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

Add .npwm fill the  existing entries, use it in probe, and switch the loop
in meson_pwm_init_clocks_meson8b() and meson_pwm_init_channels_s4() to
chip->npwm. No functional change.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/pwm/pwm-meson.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 8c6bf3d49753..22cefc6d5dd0 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -113,6 +113,7 @@ struct meson_pwm_data {
 	int (*channels_init)(struct pwm_chip *chip);
 	bool has_constant;
 	bool has_polarity;
+	u8 npwm;
 };
 
 struct meson_pwm {
@@ -382,7 +383,7 @@ static int meson_pwm_init_clocks_meson8b(struct pwm_chip *chip,
 	char name[255];
 	int err;
 
-	for (i = 0; i < MESON_NUM_PWMS; i++) {
+	for (i = 0; i < chip->npwm; i++) {
 		struct meson_pwm_channel *channel = &meson->channels[i];
 		struct clk_parent_data div_parent = {}, gate_parent = {};
 		struct clk_init_data init = {};
@@ -510,7 +511,7 @@ static int meson_pwm_init_channels_s4(struct pwm_chip *chip)
 	struct meson_pwm *meson = to_meson_pwm(chip);
 	int i, ret;
 
-	for (i = 0; i < MESON_NUM_PWMS; i++) {
+	for (i = 0; i < chip->npwm; i++) {
 		meson->channels[i].clk = of_clk_get(np, i);
 		if (IS_ERR(meson->channels[i].clk))
 			return dev_err_probe(dev,
@@ -530,6 +531,7 @@ static int meson_pwm_init_channels_s4(struct pwm_chip *chip)
 static const struct meson_pwm_data pwm_meson8b_data = {
 	.parent_names = { "xtal", NULL, "fclk_div4", "fclk_div3" },
 	.channels_init = meson_pwm_init_channels_meson8b_legacy,
+	.npwm = 2,
 };
 
 /*
@@ -539,6 +541,7 @@ static const struct meson_pwm_data pwm_meson8b_data = {
 static const struct meson_pwm_data pwm_gxbb_ao_data = {
 	.parent_names = { "xtal", "clk81", NULL, NULL },
 	.channels_init = meson_pwm_init_channels_meson8b_legacy,
+	.npwm = 2,
 };
 
 static const struct meson_pwm_data pwm_axg_ee_data = {
@@ -546,6 +549,7 @@ static const struct meson_pwm_data pwm_axg_ee_data = {
 	.channels_init = meson_pwm_init_channels_meson8b_legacy,
 	.has_constant = true,
 	.has_polarity = true,
+	.npwm = 2,
 };
 
 static const struct meson_pwm_data pwm_axg_ao_data = {
@@ -553,6 +557,7 @@ static const struct meson_pwm_data pwm_axg_ao_data = {
 	.channels_init = meson_pwm_init_channels_meson8b_legacy,
 	.has_constant = true,
 	.has_polarity = true,
+	.npwm = 2,
 };
 
 static const struct meson_pwm_data pwm_g12a_ee_data = {
@@ -560,6 +565,7 @@ static const struct meson_pwm_data pwm_g12a_ee_data = {
 	.channels_init = meson_pwm_init_channels_meson8b_legacy,
 	.has_constant = true,
 	.has_polarity = true,
+	.npwm = 2,
 };
 
 static const struct meson_pwm_data pwm_g12a_ao_ab_data = {
@@ -567,6 +573,7 @@ static const struct meson_pwm_data pwm_g12a_ao_ab_data = {
 	.channels_init = meson_pwm_init_channels_meson8b_legacy,
 	.has_constant = true,
 	.has_polarity = true,
+	.npwm = 2,
 };
 
 static const struct meson_pwm_data pwm_g12a_ao_cd_data = {
@@ -574,22 +581,26 @@ static const struct meson_pwm_data pwm_g12a_ao_cd_data = {
 	.channels_init = meson_pwm_init_channels_meson8b_legacy,
 	.has_constant = true,
 	.has_polarity = true,
+	.npwm = 2,
 };
 
 static const struct meson_pwm_data pwm_meson8_v2_data = {
 	.channels_init = meson_pwm_init_channels_meson8b_v2,
+	.npwm = 2,
 };
 
 static const struct meson_pwm_data pwm_meson_axg_v2_data = {
 	.channels_init = meson_pwm_init_channels_meson8b_v2,
 	.has_constant = true,
 	.has_polarity = true,
+	.npwm = 2,
 };
 
 static const struct meson_pwm_data pwm_s4_data = {
 	.channels_init = meson_pwm_init_channels_s4,
 	.has_constant = true,
 	.has_polarity = true,
+	.npwm = 2,
 };
 
 static const struct of_device_id meson_pwm_matches[] = {
@@ -650,9 +661,10 @@ static int meson_pwm_probe(struct platform_device *pdev)
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
@@ -664,7 +676,7 @@ static int meson_pwm_probe(struct platform_device *pdev)
 	spin_lock_init(&meson->lock);
 	chip->ops = &meson_pwm_ops;
 
-	meson->data = of_device_get_match_data(&pdev->dev);
+	meson->data = pdata;
 
 	err = meson->data->channels_init(chip);
 	if (err < 0)

-- 
2.52.0



