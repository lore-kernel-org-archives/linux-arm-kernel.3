Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E0DCD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 08:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HxJ4SFItrIwn4wtg1v7x05Vg15dsr/aCZ2aGWUrKLNE=; b=3rTRomCTTIsjytQPYNb4pVNrgY
	ora9vkbjphNrdxgwQKqXdikqHV3JSEBGqzkzP00bggievdXYjcwye70TmvIUr3Jjgm2ArQfO7H02E
	k4UliDrN1D9pza+fGQOc5M1AheUWYL1ZryGIqY9VHyvZXhJXYCuALoXQJj35HdjYuaVLJ3ttZg1Ai
	lKrnhmLcLXRs1pmTEyM0tKFRWAWdQfpK+eBu5Td3Igq9WY9JJw1qx3s7khYzmSYIMI1lZPqOtqNq0
	bC9H6v8Qf8PdSIkIA80RVU+PBdiPm6BNEGVEPZhBqZ23y6//zNxuMVbjb9LlShWPWYeKHwik4Jgto
	7HFiIVQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtIv-0000000EnLH-2iU1;
	Mon, 18 May 2026 08:26:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtIu-0000000EnKF-1MuW;
	Mon, 18 May 2026 08:26:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 81D1E6001A;
	Mon, 18 May 2026 08:26:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 302C8C2BCC6;
	Mon, 18 May 2026 08:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779092783;
	bh=gF8Z0lDWvqPjxyeiNxBSuBywQXoR5uTnCFjFlTsul+w=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=AFTFtOBszLvoMlud9z860++DzA04pwIvYtlIMxUN4swYXjLWVU7tLL+K78Wi30C4S
	 jIbR6aj2H3npLY+qzNewg79qPtreHLHwlKd/Oii0Xb919FSESb76bgUNSpWvnKUalN
	 XEU+wCUMFghSbAcBGaO4lscsoTP69iHdkB3UG8opj4iXn3YtoKVI7qRMi6FwObYfeJ
	 FEztjG37D2Mp+62tER9gl82Mpgu761zxsakSu8dzKUJ6ytmuEGuQN+K7RxJXl6p9wR
	 cz36sqgQsmlXK6wh7FW7qSESVwIC3RcFfnd6umgHxsYltkVXheX89z+ncdOv370TRF
	 z0d18VZDgYzLg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F49DCD4F52;
	Mon, 18 May 2026 08:26:23 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 18 May 2026 08:26:20 +0000
Subject: [PATCH] pinctrl: meson: amlogic-a4: fix gpio output glitch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-fix-set-value-glitch-v1-1-d350732dc934@amlogic.com>
X-B4-Tracking: v=1; b=H4sIACvNCmoC/x2MQQqAIBAAvxJ7biG1pPpKdBDdaiEstCIQ/550H
 JiZBJECU4SxShDo4ciHLyDqCuxm/ErIrjDIRuqmEz0u/GKkCx+z34TrzpfdcGmVdUprK4cOSno
 GKt6/neacP6WFXLJmAAAA
X-Change-ID: 20260518-fix-set-value-glitch-f43cd366c295
To: Linus Walleij <linusw@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779092781; l=2464;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=HQut5DoHHLHMAAEMHfB1ndnbzPoAfeLWYAz1btYy/v4=;
 b=iSGDTNSp99CxN/n337nlmpKipA9olU98cB3IT8K22NnaIVpfwhI4C4MCEB0dIVlmR3IlTXd9Y
 FhrDNoLUCdxC0Nekxu1rUksY4RIWqW9zWwDlGWEmyCvbAmOWryO6CqJ
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

When the system transitions from bootloader to kernel, the GPIO is
expected to keep driving high.

However, the Linux kernel first configures the pin direction and then
sets the output value. This may cause a brief low-level glitch on the
GPIO line, which can be problematic for regulator control.

By configuring the output value before switching the pin direction to
output, the glitch can be avoided.

This commit fixes the issue by swapping the configuration order.

Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
fix one issue when set gpio line high.
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index 35d27626a336..1bd58fbbd26a 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -548,11 +548,11 @@ static int aml_pinconf_set_output_drive(struct aml_pinctrl *info,
 {
 	int ret;
 
-	ret = aml_pinconf_set_output(info, pin, true);
+	ret = aml_pinconf_set_drive(info, pin, high);
 	if (ret)
 		return ret;
 
-	return aml_pinconf_set_drive(info, pin, high);
+	return aml_pinconf_set_output(info, pin, true);
 }
 
 static int aml_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
@@ -921,15 +921,14 @@ static int aml_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 	unsigned int bit, reg;
 	int ret;
 
-	aml_gpio_calc_reg_and_bit(bank, AML_REG_DIR, gpio, &reg, &bit);
-	ret = regmap_update_bits(bank->reg_gpio, reg, BIT(bit), 0);
+	aml_gpio_calc_reg_and_bit(bank, AML_REG_OUT, gpio, &reg, &bit);
+	ret = regmap_update_bits(bank->reg_gpio, reg, BIT(bit),
+				 value ? BIT(bit) : 0);
 	if (ret < 0)
 		return ret;
 
-	aml_gpio_calc_reg_and_bit(bank, AML_REG_OUT, gpio, &reg, &bit);
-
-	return regmap_update_bits(bank->reg_gpio, reg, BIT(bit),
-				  value ? BIT(bit) : 0);
+	aml_gpio_calc_reg_and_bit(bank, AML_REG_DIR, gpio, &reg, &bit);
+	return regmap_update_bits(bank->reg_gpio, reg, BIT(bit), 0);
 }
 
 static int aml_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)

---
base-commit: 73d4991a6949eedb51e442d4e81415017d85975b
change-id: 20260518-fix-set-value-glitch-f43cd366c295

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



