Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A060C105F79E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 08:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JuFP5+poEMd2cToki9o4QuDkVVwl7kDDGFz3csvEi6w=; b=4lbgOkAnPhgT/ajEIOVxINH9X6
	VHl4hc1Kr/ba3yfOthhunEq/p6uNp5NYPPS/lqYulymU0wRYS+rSPNA6T4FtDH02efPcVCahsf5D8
	I6+yHUEMfg3ijmUlzOFBwYkzK94YRuc1JjXhPys4cawVjHKMYvk8WrgvvUoR7uYgad2vbdwyfh+Oo
	dizEc2RTSNKfCmuTjf52PedIwp0QRS+h6o8/HNeqRkMzIm6nLYIsGSu3F7RCaCNnLqoXGa9xo09dS
	PEJsMFdmPsd3+yMfewZjNjVy7uLOgrY9ROM8AuoSQYf6/jtp7dN2QoyMbxfeAdaQTYgLFMg0nThqB
	k0PFmzrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1K4j-00000001cFB-0RdC;
	Sat, 14 Mar 2026 08:10:21 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1K4f-00000001cEY-29p0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 08:10:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JuFP5+poEMd2cToki9o4QuDkVVwl7kDDGFz3csvEi6w=; b=IZLtkubNjEZUCIBj6UwzWWro5S
	dwTm4Jf8RTX7OSZoOe49Ri44sNKA1TFOZ4DhkPQx6dRnTuTpAOvLY1IXeBEvtHvMxuYnC5DU2+STl
	+FS+Bq9Z8+bBQmBHkuATFGEfwSxD4qIJR1dqiLIx+9VyVpfJRWRA4xFzfdmUJepqDsFigSguKLK5U
	HFGS3pxKmFq6rEmQ9iTMxVzuqHbQZwYLoESpXtsMCGg9seJMoLMuFiBEyq5DTFNXvy0UWk614fW2i
	QsQma/+/A+RmQdM3t9kDkX+Df2ayBVrLo/QgynyICasHW7Gkd+6iAoLTdPQkfMdVkp1iFFAFxRfST
	dDBE6GMg==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1w1K4b-0000000E3Ib-4AB0;
	Sat, 14 Mar 2026 09:10:14 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Sat, 14 Mar 2026 09:09:19 +0100
Subject: [PATCH v3] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure when
 pinmux is unknown
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260314-rc2-boot-hang-v3-1-0b48221181a9@mmpsystems.pl>
X-B4-Tracking: v=1; b=H4sIAK4XtWkC/33MQQ6DIBCF4asY1p0GhoLYVe/RdKGClaSKYQypM
 d696LJJu/xn8r6VkYveEbsWK4suefJhzCFPBWv7enw68DY3Q46aS24gtghNCDPsX0BdOaMuWkv
 VsLyZouv8+/Duj9y9pznE5eCT2K+/pCSAgy0rtKIuje3sbRgmWmh2A52nF9u1hH8FBAFK6M42B
 nml5LewbdsHLf6t5fAAAAA=
To: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773475781; l=3045;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=y0wrpgVe/vD8Ky8xVZLpP7/JzoI0TuJV77u/VjXtN84=;
 b=s1x0bAnmDtenjQITLEDVg8xReKC/2t2syyyFbqEyqOMA9aeL/KR817X65YV8fX7Cg0xHjLI/4
 YNoEt44iQrCAGcIsGfxu9YpSYQQsAm8HFpFZVMlFXrkTNk+fGaMV69z
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_011018_038340_0062F442 
X-CRM114-Status: GOOD (  14.44  )
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

Fixes kernel hang during boot due to inability to set up IRQ on AXP313a.

The issue is caused by gpiochip_lock_as_irq() which is failing when gpio
is in unitialized state.

Solution is to set pinmux to GPIO INPUT in
sunxi_pinctrl_irq_request_resources() if it wasn't initialized
earlier.

Tested on Orange Pi Zero 3.

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
Suggested-by: Chen-Yu Tsai <wens@kernel.org>
---
Changes in v3:
- Drop v2 solution which was returning input instead of error when pin
  is not initialized.
- Add checking pinmux configuration in
  sunxi_pinctrl_irq_request_resources() and set pin to input if
  uninitialized
- Link to v2: https://lore.kernel.org/r/20260308-rc2-boot-hang-v2-1-516fdb820953@mmpsystems.pl

Changes in v2:
- Dropped the previous faulty solution which was forcing the axp313 to
  use r_pio as interrupt controller as pointed out by Jernej Škrabec.
- Implemented suggestion from Andrey Skvortsov to return default
  direction as input
- Link to v1: https://lore.kernel.org/r/20260308-rc2-boot-hang-v1-0-d792d1a78dfd@mmpsystems.pl
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 13 +++++++++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.h |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index c990b6118172..7d46f7613672 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -1089,6 +1089,9 @@ static int sunxi_pinctrl_irq_request_resources(struct irq_data *d)
 {
 	struct sunxi_pinctrl *pctl = irq_data_get_irq_chip_data(d);
 	struct sunxi_desc_function *func;
+	unsigned int offset;
+	u32 reg, shift, mask;
+	u8 muxval;
 	int ret;
 
 	func = sunxi_pinctrl_desc_find_function_by_pin(pctl,
@@ -1096,6 +1099,16 @@ static int sunxi_pinctrl_irq_request_resources(struct irq_data *d)
 	if (!func)
 		return -EINVAL;
 
+	offset = pctl->irq_array[d->hwirq] - pctl->desc->pin_base;
+	sunxi_mux_reg(pctl, offset, &reg, &shift, &mask);
+	muxval = (readl(pctl->membase + reg) & mask) >> shift;
+
+	/* Change muxing to GPIO INPUT mode if at reset value */
+	if (muxval == SUN4I_FUNC_IO_DISABLE) {
+		sunxi_pmx_set(pctl->pctl_dev, pctl->irq_array[d->hwirq],
+			      SUN4I_FUNC_INPUT);
+	}
+
 	ret = gpiochip_lock_as_irq(pctl->chip,
 			pctl->irq_array[d->hwirq] - pctl->desc->pin_base);
 	if (ret) {
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index ad26e4de16a8..22c527fc6ae2 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -86,6 +86,7 @@
 
 #define SUN4I_FUNC_INPUT	0
 #define SUN4I_FUNC_IRQ		6
+#define SUN4I_FUNC_IO_DISABLE	7
 
 #define SUNXI_PINCTRL_VARIANT_MASK	GENMASK(7, 0)
 #define SUNXI_PINCTRL_NEW_REG_LAYOUT	BIT(8)

---
base-commit: 4ae12d8bd9a830799db335ee661d6cbc6597f838
change-id: 20260308-rc2-boot-hang-269e8546635b

Best regards,
-- 
Michal Piekos <michal.piekos@mmpsystems.pl>


