Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4B0C61DC7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 08:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uzQpYO3GzJYubJwe9bU/oZAWUxm9r3xHMkEAGThKKR0=; b=YN4gHQ1ySDHbaKcGv9LVO4zsbt
	coo6pkS/H0zkibMo9p4kSKShcwL3U0ziiqjpbmcw/cEFqm4rj2wx3swttrXEmT5mdwAfh4udE8czJ
	i86KuWyQaVkcQoXGWGu0K3B5bRdvbD+MjWx/dYMG0fPP+aw/e1r/HAMKm9zi408WehFQR23qkUC7Q
	N7LZO9mC4pR10O5N1aj6PL9Ib+0uvEDP47pJUYYtGAnJnbymCEwuPveAXC7UMv67J65bQQ1b3NqcS
	6CYq9Bom/hr+npr7Oa19aDRjddrNLt5E5z/Z1/0BmWsl60eklFW/KhS88itCIhNevBc0vy8qedm0e
	FQcOzSaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVfE-00000003eya-0nBy;
	Thu, 27 Aug 2026 08:40:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVfD-00000003exk-2Zam;
	Thu, 27 Aug 2026 08:40:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 18EAF43987;
	Thu, 27 Aug 2026 08:40:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7B2CC2BCF6;
	Thu, 27 Aug 2026 08:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787820046;
	bh=NaNfG9VIpzM+1OSGZeUL4aPn9tA6VrN3YYmwZiUXjh4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=K/XL2UZ7cnkaYDOB+1ro36ujWEHvHBsp6voGnJSLubpJSusBpgotz/df6++mFp0Ko
	 QTIWObb/v43hIBDr+sVGOnA3c/0zAorLwkVBuvjWhJSS5i3JOYU/ffZ67IsZJUTRe+
	 ZVlUXbe+SOvjXX5Hr/HIfPUYUO1t8oKVYeyeQl7hB3HyEU3FiPq8cM0GeAP7z0wQes
	 OlTdfv4u/9Qk/QAdA+JfDJ6y6fXfaZF7cVPCReYDM4e4G+VqhZM+weXnKrHslvlAOG
	 4wW8lFRddlFFDBIKmGzT9+0+ae74P5Obs6zGWFUkuEtIv9km3aoV3pKAYBOiurkE+P
	 MNJXrc6LF83Lg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4289C61DB9;
	Thu, 27 Aug 2026 08:40:46 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 27 Aug 2026 08:40:12 +0000
Subject: [PATCH v4 3/4] pwm: meson: use bulk API for per-channel clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-s6-s7-pwm-v4-3-d28a2015177d@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787820043; l=2584;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=I6lbpR1bOMmChsZo3uQ/k/8BNNbhwj3qLcmflQoEjK8=;
 b=j1659NKbIuXJqxgowGvB/TkkqxEEPFicBgqlHDxBXEX9bMCN9fRiQx9seZz5ofywGTUY37R5K
 0EH1aPdXWnQBkszh56C7j+op9cREnOXfODis0Hj3utlZ1eD5vzSxP3i
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

The S4 PWM driver currently gets each channel clock individually with
of_clk_get() and uses a custom cleanup action to release the clocks.

Use devm_clk_bulk_get_all() instead to retrieve all per-channel clocks
at once. Verify that the number of clocks matches the number of PWM
channels and assign each clock to its corresponding channel.

This also allows the per-channel clock initialization code to be shared
by Meson PWM variants using one clock per channel.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/pwm/pwm-meson.c | 40 ++++++++++++++++------------------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 22cefc6d5dd0..6f151464d7cc 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -497,33 +497,25 @@ static int meson_pwm_init_channels_meson8b_v2(struct pwm_chip *chip)
 	return meson_pwm_init_clocks_meson8b(chip, mux_parent_data);
 }
 
-static void meson_pwm_s4_put_clk(void *data)
-{
-	struct clk *clk = data;
-
-	clk_put(clk);
-}
-
-static int meson_pwm_init_channels_s4(struct pwm_chip *chip)
+static int meson_pwm_init_channels_per_channel_clk(struct pwm_chip *chip)
 {
 	struct device *dev = pwmchip_parent(chip);
-	struct device_node *np = dev->of_node;
 	struct meson_pwm *meson = to_meson_pwm(chip);
-	int i, ret;
+	struct clk_bulk_data *clks;
+	unsigned int i;
+	int num;
 
-	for (i = 0; i < chip->npwm; i++) {
-		meson->channels[i].clk = of_clk_get(np, i);
-		if (IS_ERR(meson->channels[i].clk))
-			return dev_err_probe(dev,
-					     PTR_ERR(meson->channels[i].clk),
-					     "Failed to get clk\n");
-
-		ret = devm_add_action_or_reset(dev, meson_pwm_s4_put_clk,
-					       meson->channels[i].clk);
-		if (ret)
-			return dev_err_probe(dev, ret,
-					     "Failed to add clk_put action\n");
-	}
+	num = devm_clk_bulk_get_all(dev, &clks);
+	if (num < 0)
+		return dev_err_probe(dev, num, "Failed to get clocks\n");
+
+	if (num != chip->npwm)
+		return dev_err_probe(dev, -EINVAL,
+				"expected %u clocks, got %d\n",
+				chip->npwm, num);
+
+	for (i = 0; i < chip->npwm; i++)
+		meson->channels[i].clk = clks[i].clk;
 
 	return 0;
 }
@@ -597,7 +589,7 @@ static const struct meson_pwm_data pwm_meson_axg_v2_data = {
 };
 
 static const struct meson_pwm_data pwm_s4_data = {
-	.channels_init = meson_pwm_init_channels_s4,
+	.channels_init = meson_pwm_init_channels_per_channel_clk,
 	.has_constant = true,
 	.has_polarity = true,
 	.npwm = 2,

-- 
2.52.0



