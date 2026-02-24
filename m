Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D721EC1133
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 09:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K7jUH19gF7eIzeKZReXQqXfAAVSLPSMhuw4pn2+Jj/4=; b=DrYtdUfc2Gy9xAWtiqDZoA+5PK
	CKTCLGpn3idtCVQ2zjcvUm42b1uUa6FAWDpaVl5QnBQQdzS2mRmbWw3YfW79JthOBFZcdQs0zcZ3Z
	/YgqL/WZ0UAWaxLArLFVY+FMHIOfZoniXCw6wGEWemks3JtoU3xIjh71UUc6guPyec9xvdpxMVsCH
	snWG55VPHDIoD5UxnLnXnA0h4309/Gf1PcYd2dw9xXrw6Fi6blfCjRVxQEZl6Xr/InkttEeBfZdcQ
	zP05xEa0owLNs4qjh/xRYV4MndtoTgc8Jdot7o/nvRRhLL1eWiqw6HDGm396aqom6qtX5uGV89u9h
	BPAOmfcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoeY-00000001jon-2tDr;
	Tue, 24 Feb 2026 09:24:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoeX-00000001joQ-0nDr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 09:24:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E04BD40975;
	Tue, 24 Feb 2026 09:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9754EC116D0;
	Tue, 24 Feb 2026 09:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771925063;
	bh=uQkHCoaVMsbIow9DIRdiKl4dMdChJyAoiW4v51+fGJc=;
	h=From:To:Cc:Subject:Date:From;
	b=Q/BBUPbGuivU/3KKIE3Jy009WbSHgigc9tzUhfXD5AOsueekvSOFTbc0A2s1MUp7i
	 lryWg/g4w5eN/lmhswpUBFdodqS8G4UP+qsMNg86mnXGA2fGeESRQUHHqGcUFsr5zX
	 LnRgsEZr17xE82K1ddsemEhxLDV+foTmbBNEA02SojkqAQO044nw3tlNCDcuXgPchg
	 WzEtyW4VKVTQ0+EZpqfnn7jGlmViQCneCqhtOT7oArSsWzoBnL9W269bTtMxvjd1n7
	 Q3xwG/PlAzAHVdY+eZ/Qo2iNEvV1QVLKDc2HPWQZezKf/fTku6QD8iHeghnFD7UMC4
	 K9FXLQQM8/hCg==
Received: by wens.tw (Postfix, from userid 1000)
	id 0051A5FD2E; Tue, 24 Feb 2026 17:24:20 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linusw@kernel.org>
Cc: James Hilliard <james.hilliard1@gmail.com>, aprizel@wens.tw,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2] pinctrl: sunxi: Implement gpiochip::get_direction()
Date: Tue, 24 Feb 2026 17:24:18 +0800
Message-ID: <20260224092419.1275016-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_012425_305632_8E97EBE9 
X-CRM114-Status: GOOD (  17.31  )
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

After commit 471e998c0e31 ("gpiolib: remove redundant callback check"),
a warning will be printed if the gpio driver does not implement this
callback. The warning was added in commit e623c4303ed1 ("gpiolib:
sanitize the return value of gpio_chip::get_direction()"), but was
masked by the "redundant" check.

The warning can be triggered by any action that calls the callback,
such as dumping the GPIO state from /sys/kernel/debug/gpio.

Implement it for the sunxi driver. This is simply a matter of reading
out the mux value from the registers, then checking if it is one of
the GPIO functions and which direction it is.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Please merge for fixes.

Changes since v1:
- Corrected commit attribution for the warning
- Add example scenario that triggers the warning
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 51 +++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 0fb057a07dcc..27b2a3e9d78d 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -204,6 +204,32 @@ sunxi_pinctrl_desc_find_function_by_pin(struct sunxi_pinctrl *pctl,
 	return NULL;
 }
 
+static struct sunxi_desc_function *
+sunxi_pinctrl_desc_find_function_by_pin_and_mux(struct sunxi_pinctrl *pctl,
+						const u16 pin_num,
+						const u8 muxval)
+{
+	for (unsigned int i = 0; i < pctl->desc->npins; i++) {
+		const struct sunxi_desc_pin *pin = pctl->desc->pins + i;
+		struct sunxi_desc_function *func = pin->functions;
+
+		if (pin->pin.number != pin_num)
+			continue;
+
+		if (pin->variant && !(pctl->variant & pin->variant))
+			continue;
+
+		while (func->name) {
+			if (func->muxval == muxval)
+				return func;
+
+			func++;
+		}
+	}
+
+	return NULL;
+}
+
 static int sunxi_pctrl_get_groups_count(struct pinctrl_dev *pctldev)
 {
 	struct sunxi_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
@@ -930,6 +956,30 @@ static const struct pinmux_ops sunxi_pmx_ops = {
 	.strict			= true,
 };
 
+static int sunxi_pinctrl_gpio_get_direction(struct gpio_chip *chip,
+					    unsigned int offset)
+{
+	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
+	const struct sunxi_desc_function *func;
+	u32 pin = offset + chip->base;
+	u32 reg, shift, mask;
+	u8 muxval;
+
+	sunxi_mux_reg(pctl, offset, &reg, &shift, &mask);
+
+	muxval = (readl(pctl->membase + reg) & mask) >> shift;
+
+	func = sunxi_pinctrl_desc_find_function_by_pin_and_mux(pctl, pin, muxval);
+	if (!func)
+		return -ENODEV;
+
+	if (!strcmp(func->name, "gpio_out"))
+		return GPIO_LINE_DIRECTION_OUT;
+	if (!strcmp(func->name, "gpio_in") || !strcmp(func->name, "irq"))
+		return GPIO_LINE_DIRECTION_IN;
+	return -EINVAL;
+}
+
 static int sunxi_pinctrl_gpio_direction_input(struct gpio_chip *chip,
 					unsigned offset)
 {
@@ -1601,6 +1651,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 	pctl->chip->request = gpiochip_generic_request;
 	pctl->chip->free = gpiochip_generic_free;
 	pctl->chip->set_config = gpiochip_generic_config;
+	pctl->chip->get_direction = sunxi_pinctrl_gpio_get_direction;
 	pctl->chip->direction_input = sunxi_pinctrl_gpio_direction_input;
 	pctl->chip->direction_output = sunxi_pinctrl_gpio_direction_output;
 	pctl->chip->get = sunxi_pinctrl_gpio_get;
-- 
2.47.3


