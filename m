Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5B5C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 08:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2M2OgravXbYKjFehWUR3PFTRlToH7LwA0WvnmatUgo8=; b=M97Rdowt8p/tozlEJXWDgjprkS
	HIBL6XTcIx4afCtI3uUEfuzcydjCSz2pj3+EKtKukMTleRr+OY2/JsAfydF+LrGJ8IuYys7cEdE2r
	DNfpHOoARbSI2lGmK8Cw44HUlSBfRnffdVo8Eu+1GN+7H+PYBraN+zlIm1cBW7ITVsDYgV0bF3B7c
	dA4p1ryM0TMTzw93JSapneKenJ+XoZe3MYpsCaKkpDH0E7vVG7Nxs94GOLR7T1SvFMzdhcJl7fx1C
	LAQMD+K4vo70lXl6gQyi+HIFvLZrVjbMJE/ZPVagYrcv0uVr8EPZb3U75voaws+H0M8Tki24jO3Zd
	kVhymh7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVfE-00000003ezJ-28Aq;
	Thu, 27 Aug 2026 08:40:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVfD-00000003exm-2ZjX;
	Thu, 27 Aug 2026 08:40:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 209A343CB1;
	Thu, 27 Aug 2026 08:40:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA36DC2BCFC;
	Thu, 27 Aug 2026 08:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787820046;
	bh=raey7IcSkGHwiWP9oHD9SowA1rYRlgfNL/m5FNUAnww=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PVnXVStMqKiADJZK4H5/iy0nEtYMV/mZgjz/i0AisjNSUdLDtpMzafZInmIUAJF8H
	 TFUdwUjGwcihgVkD7fxH77C7ibwd9uIqiSxUxrHvqHQrdl2/qPRwQpoPjuXpmB26pH
	 gnO+39rYFMmXpULHIS2hRrt7YGwpg4YbYscss4tGve5d8rYmUzoI/9Dh5oKZ8HKf/J
	 GbeMvwkfscRfVQNljge0kzlpEnr+zVNXGUE1UhnqWKTabHXoTobt8t0PZLdVCJt2tr
	 rEt8HW10F4MU8PcPCL2BPzg2xib2D1bP6PhtgVKZT7fWnw2GFypJvetogebx6YFuce
	 2FjlFDy1h+JsQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B31C61DCB;
	Thu, 27 Aug 2026 08:40:46 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 27 Aug 2026 08:40:13 +0000
Subject: [PATCH v4 4/4] pwm: meson: Add support for Amlogic S7
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-s6-s7-pwm-v4-4-d28a2015177d@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787820043; l=1273;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=bxanl4T1hd21Hw06PnQXj6xGMQbU+zReu1OrHg7McSk=;
 b=0vaQo/fBgbLRHzWKS3mXgLiyVajPMUz9dbrbZVd3jjmB/2F56tL5Ry9j/ENdIlQL/PLCowQAm
 P2g2nAg4w+RBIldLTwsxHkfgwYiA7ukj3SBodgsTJ8I/HNKY0pwBTxL
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

Add support for Amlogic S7 PWM. Amlogic S7 different from the previous
SoCs, a controller includes one pwm, at the same time,the controller has
only one input clock source.

Also use the kernel coding style for the empty of_device_id terminator.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/pwm/pwm-meson.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 6f151464d7cc..2da958231719 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -595,6 +595,13 @@ static const struct meson_pwm_data pwm_s4_data = {
 	.npwm = 2,
 };
 
+static const struct meson_pwm_data pwm_s7_data = {
+	.channels_init = meson_pwm_init_channels_per_channel_clk,
+	.has_constant = true,
+	.has_polarity = true,
+	.npwm = 1,
+};
+
 static const struct of_device_id meson_pwm_matches[] = {
 	{
 		.compatible = "amlogic,meson8-pwm-v2",
@@ -645,7 +652,11 @@ static const struct of_device_id meson_pwm_matches[] = {
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
 

-- 
2.52.0



