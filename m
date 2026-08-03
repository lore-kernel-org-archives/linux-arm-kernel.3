Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED59BC55189
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 05:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DdvS6JgS1wsN4XXB/DPlHPE/KXR5tqJa5L67sBE8VSE=; b=qEVYYsrmRayRfi7YWf+piuZbo0
	tgmO3Bz7VxuyoBDBCZvYnLdEvkTBn1vhACsFhz745veq5mDu/6SVd3Y4x1TaZyM1b7HIunnAyAsjk
	Kf+zPJ79W7nBVSSX3Wi2QmOloVk/X799BoMI/HA9DjZEEPcvV0MaJtIon61z380RCam2S04cb3gSO
	QjOm2VCCUis761Hoz1f+lUeEFF7SgHfxNJxl3gk7O9peGsVn4uYXAajVpcRY4RTCChNLBsrqwezWJ
	Isfcbs/OfKOdoTBsj9yZiWSbMAEE2lwdMsdWS8+xB1KB7FRJDRlDUkMCT8e1B2bjxf1Tl04TTbf/c
	P+9+KEQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wql1Y-0000000GKrN-1We5;
	Mon, 03 Aug 2026 05:15:40 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wql1V-0000000GKiy-0JtE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 05:15:38 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-7e9eaf04bfaso1038883a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 22:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734136; x=1786338936; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DdvS6JgS1wsN4XXB/DPlHPE/KXR5tqJa5L67sBE8VSE=;
        b=sBacbuvGs3S7X3annaYsVn5eXox0LvWH05bc28o/CXDr5N8hyw8Y8Yqt9aLNQj/d+9
         fBCHA/F6Da+J/Y+8Ud5ZWzZhskTscQ5SyNDpqf9oMEVsG80B6vCKnx6yN9Tawese3NJE
         fh+kURnrxKl4UbrpJNjo8P+6104MJS/pp23bG/w20ppBMYxE0BF0oRZfscSAh9GA9Ju1
         Sow2sFBbZLLkbZBfJa5dE/Ssb1kIkDS0e8n+vRCebmRMfHtqRxF3XSzS9S0XFLkACbNe
         g+Zt7IqkXvSoWHzjrMBPAChTCOSFDUajHjQ3qKB+wVieIrlTSNYjhxT9yIOCDHQiQVT4
         D0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734136; x=1786338936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DdvS6JgS1wsN4XXB/DPlHPE/KXR5tqJa5L67sBE8VSE=;
        b=F4iU1IbXUx74BHjvzBg0/Z9BukelRMAGDq1xWT+WVDhiVd6AcLB/FJmzF8szB1MgLr
         AD2f7fWM/H+Jn/VOcC/gnmsJg/KntFw97bJVRSuD0GhsvQYbBeSBhDzye0Q+28SpojGY
         YKak0lm/PlqP1J+2RNHcZTnpID66VIRPK03mJxwkHfUcxNZYPMwuejdB1D/8jiDfG5iZ
         f38EakHhPZPDmOgC5CfqeslXGBtsudzMqipo5OYj40tkzgAPugOIB8Odq/wIyB+CcTtA
         G9ABZBG+oMVOfzYHjUHtRBMPMidb3Tzjeb/eKffTGAb84WsXWKICGFKnBiqIqUvT0h0c
         CR9A==
X-Forwarded-Encrypted: i=1; AHgh+Rpgrhmwc+HD22dlQN79/ZfNLNlY32UpQ4sk0AvozluJo5Ctf7bDZVNUKWDPgtjbGEeVsGR5NXaKbJJMWE3CaG1u@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg872tjJC7vcwLDcW23B8NKJbACbaedWRb4aD+lLqWQat/VC6F
	4VXHdv8KYKmfsFUfIUgEEp7vZJx/0er1UAYKzRr7dhpwvqn4ElPnlm3oS/lcxk1Q
X-Gm-Gg: AR+sD10PRdfWbibMqjoEMdzDCixxANRB0s/7XEcSRN3vQI71XoyNMXlt4vIuyFCwyiM
	DyalTY/hwejdJ1BbhgM0lbzuGpFh2yuegnCLsUifJctGtJQ6Jduq//5h67YdNDDoYgvxAfg1kxC
	PpCrHFiW5P1p3lXBzGX2vhez57o62HcuQHi6s3nO+ChRQQlbRd34dbLVXm1fhYa42IvwmxFYJZc
	eWQhdtr9ALr/cwnT0V1RHq+xkilDwIOgxaY2AMHgmxU4+3JvDrTIqZXfBR1UFpmkgX2riuQbY3C
	Y7auK062+mHk1vImqbCkXiK/YgTk2e0FDJ/YELLWl/BO7jWtYkI8XWMZBkafpn/y0LzC8v9S1IU
	UlzPgcTQhBBgHOZi+TKFc6PfOAnl7QvXhaaD1G7JIAS1+6l5TK9TNH66t/lq2sQPSrhltK8A//y
	YJnMIYfljK3Wr4JLQTHEbx0astTuh+9mdKRf8UN8hvcYQoyQgK6xiqwXcita1VTuIW50P8asK+n
	ZJaJFHXDqnGymN/2nJrZ863lx7KoG9tLUbrMQPMLnB76/OjcQFw55ALeA+VduEm0ZUjImvt8WnD
	m5pPe7N+rb/VLJCLc6X9X89oFriJ3ybgL86BJx8hPKoRLj+E5NJyCEBLqwgj7U/PsOAqsJKX1VG
	4JeXb+w67XM8QZv3p
X-Received: by 2002:a05:6830:3814:b0:7e6:ca29:9609 with SMTP id 46e09a7af769-7f196d82b85mr13995078a34.13.1785734136211;
        Sun, 02 Aug 2026 22:15:36 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:20 -0600
Subject: [PATCH 10/21] net: phy: add X-Powers AC200 EPHY control driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-10-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_221537_181796_0791183F 
X-CRM114-Status: GOOD (  28.43  )
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

The AC200 Fast Ethernet PHY is powered and configured through registers
in the parent I2C regmap before its Clause 22 link registers become usable.

Add a control driver that prepares the calibration value and vendor
offset, interface mode and input-clock selection. Use an optional SoC SID
cell when supplied, otherwise read the AC200's internal calibration eFuse.
Derive the documented 24 or 27 MHz selector from the actual locked clock
rate. Although the feature summary also mentions 25 MHz, EPHY_CTL provides
no encoding for it, so reject that rate rather than silently selecting
27 MHz.

Program the link PHY MDIO address into EPHY_CTL.PHY_ADDR before bringing
the PHY out of its disabled state using the vendor initialization sequence.

Expose serialized, idempotent power-on and power-off operations so the
link-PHY driver can sequence the control block across resets and system
sleep. Also expose operations for the global LED polarity and package pad
enables. Initialize all three outputs active-low as in the vendor kernel,
while allowing an explicit link-PHY LED topology to replace that fallback.
Quiesce the block during probe failures, driver removal and system
shutdown.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/phy/Kconfig             |   9 +
 drivers/net/phy/Makefile            |   1 +
 drivers/net/phy/xpowers-ac200-ctl.c | 330 ++++++++++++++++++++++++++++++++++++
 drivers/net/phy/xpowers-acx00.h     |  25 +++
 4 files changed, 365 insertions(+)

diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index 099f25dceabb..e059bd6c5eda 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -469,6 +469,15 @@ config VITESSE_PHY
 	help
 	  Currently supports the vsc8244
 
+config XPOWERS_AC200_PHY_CTL
+	tristate "X-Powers AC200 Ethernet PHY control"
+	depends on MFD_AC200
+	help
+	  Enable the control driver for the Fast Ethernet PHY function in
+	  the X-Powers AC200 mixed-signal companion IC. It programs the PHY
+	  address, interface mode, calibration and I/O controls through the
+	  parent AC200 I2C regmap.
+
 config XILINX_GMII2RGMII
 	tristate "Xilinx GMII2RGMII converter driver"
 	help
diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index de660ae94945..e53ca319f9c4 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -99,4 +99,5 @@ obj-$(CONFIG_SMSC_PHY)		+= smsc.o
 obj-$(CONFIG_STE10XP)		+= ste10Xp.o
 obj-$(CONFIG_TERANETICS_PHY)	+= teranetics.o
 obj-$(CONFIG_VITESSE_PHY)	+= vitesse.o
+obj-$(CONFIG_XPOWERS_AC200_PHY_CTL) += xpowers-ac200-ctl.o
 obj-$(CONFIG_XILINX_GMII2RGMII) += xilinx_gmii2rgmii.o
diff --git a/drivers/net/phy/xpowers-ac200-ctl.c b/drivers/net/phy/xpowers-ac200-ctl.c
new file mode 100644
index 000000000000..c2a37f958565
--- /dev/null
+++ b/drivers/net/phy/xpowers-ac200-ctl.c
@@ -0,0 +1,330 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * X-Powers AC200 Ethernet PHY control driver
+ *
+ * Copyright (C) 2026 James Hilliard <james.hilliard1@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/nvmem-consumer.h>
+#include <linux/phy.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#include "xpowers-acx00.h"
+
+#define AC200_EPHY_BPS_EFFUSE_OFFSET	3
+
+#define AC200_SYS_EPHY_CTL0_REG			0x0014
+#define AC200_EPHY_RESET_DEASSERT		BIT(0)
+#define AC200_EPHY_SYSCLK_ENABLE			BIT(1)
+
+#define AC200_SYS_EPHY_CTL1_REG			0x0016
+#define AC200_EPHY_MII_IO_ENABLE			BIT(0)
+#define AC200_EPHY_LINK_LED_IO_ENABLE		BIT(1)
+#define AC200_EPHY_SPEED_LED_IO_ENABLE		BIT(2)
+#define AC200_EPHY_DUPLEX_LED_IO_ENABLE		BIT(3)
+#define AC200_EPHY_LED_IO_ENABLE_MASK \
+	(AC200_EPHY_LINK_LED_IO_ENABLE | AC200_EPHY_SPEED_LED_IO_ENABLE | \
+	 AC200_EPHY_DUPLEX_LED_IO_ENABLE)
+
+/* AC200-internal copy of the Ethernet PHY calibration eFuse. */
+#define AC200_EFUSE_EPHY_REG			0x8004
+
+#define AC200_EPHY_CTL_REG			0x6000
+#define AC200_EPHY_SHUTDOWN			BIT(0)
+#define AC200_EPHY_LED_ACTIVE_LOW		BIT(1)
+#define AC200_EPHY_CLK_SEL_24_MHZ		BIT(2)
+#define AC200_EPHY_PHY_ADDR_MASK			GENMASK(8, 4)
+#define AC200_EPHY_RMII_SEL			BIT(11)
+#define AC200_EPHY_BPS_EFFUSE_MASK		GENMASK(15, 12)
+
+struct ac200_ephy_ctl {
+	struct acx00_ephy_control control;
+	struct regmap *regmap;
+	struct mutex lock; /* Serializes power sequencing and state. */
+	u16 ephy_ctl;
+	u16 led_io_enable;
+	unsigned int phy_addr;
+	bool powered;
+};
+
+static int
+ac200_ephy_ctl_set_led_outputs(struct acx00_ephy_control *control,
+			       unsigned long outputs)
+{
+	struct ac200_ephy_ctl *priv =
+		container_of(control, struct ac200_ephy_ctl, control);
+	u16 led_io_enable;
+	int ret = 0;
+
+	if (outputs & ~GENMASK(ACX00_EPHY_LED_COUNT - 1, 0))
+		return -EINVAL;
+
+	led_io_enable = (outputs << 1) & AC200_EPHY_LED_IO_ENABLE_MASK;
+
+	mutex_lock(&priv->lock);
+	if (priv->powered)
+		ret = regmap_update_bits(priv->regmap, AC200_SYS_EPHY_CTL1_REG,
+					 AC200_EPHY_LED_IO_ENABLE_MASK,
+					 led_io_enable);
+	if (!ret)
+		priv->led_io_enable = led_io_enable;
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+static int
+ac200_ephy_ctl_set_led_polarity(struct acx00_ephy_control *control,
+				bool active_low)
+{
+	struct ac200_ephy_ctl *priv =
+		container_of(control, struct ac200_ephy_ctl, control);
+	u16 value = active_low ? AC200_EPHY_LED_ACTIVE_LOW : 0;
+	int ret = 0;
+
+	mutex_lock(&priv->lock);
+	if (priv->powered)
+		ret = regmap_update_bits(priv->regmap, AC200_EPHY_CTL_REG,
+					 AC200_EPHY_LED_ACTIVE_LOW, value);
+	if (!ret) {
+		priv->ephy_ctl &= ~AC200_EPHY_LED_ACTIVE_LOW;
+		priv->ephy_ctl |= value;
+	}
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+static int ac200_ephy_ctl_power_off_locked(struct ac200_ephy_ctl *priv)
+{
+	int err;
+	int ret;
+
+	if (!priv->powered)
+		return 0;
+
+	ret = regmap_write(priv->regmap, AC200_EPHY_CTL_REG,
+			   priv->ephy_ctl |
+			   FIELD_PREP(AC200_EPHY_PHY_ADDR_MASK,
+				      priv->phy_addr) |
+			   AC200_EPHY_SHUTDOWN);
+	err = regmap_write(priv->regmap, AC200_SYS_EPHY_CTL1_REG, 0);
+	if (!ret)
+		ret = err;
+	err = regmap_write(priv->regmap, AC200_SYS_EPHY_CTL0_REG, 0);
+	if (!ret)
+		ret = err;
+
+	priv->powered = false;
+
+	return ret;
+}
+
+static int ac200_ephy_ctl_power_off(struct acx00_ephy_control *control)
+{
+	struct ac200_ephy_ctl *priv =
+		container_of(control, struct ac200_ephy_ctl, control);
+	int ret;
+
+	mutex_lock(&priv->lock);
+	ret = ac200_ephy_ctl_power_off_locked(priv);
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+static int ac200_ephy_ctl_power_on(struct acx00_ephy_control *control,
+				   unsigned int phy_addr)
+{
+	struct ac200_ephy_ctl *priv =
+		container_of(control, struct ac200_ephy_ctl, control);
+	u16 ephy_ctl;
+	int ret;
+
+	if (phy_addr > FIELD_MAX(AC200_EPHY_PHY_ADDR_MASK))
+		return -EINVAL;
+
+	mutex_lock(&priv->lock);
+	if (priv->powered && priv->phy_addr == phy_addr) {
+		ret = 0;
+		goto out_unlock;
+	}
+	if (priv->powered) {
+		ret = ac200_ephy_ctl_power_off_locked(priv);
+		if (ret)
+			goto out_unlock;
+	}
+
+	ephy_ctl = priv->ephy_ctl |
+		FIELD_PREP(AC200_EPHY_PHY_ADDR_MASK, phy_addr);
+
+	/* Start from a disabled state before applying the configuration. */
+	ret = regmap_write(priv->regmap, AC200_SYS_EPHY_CTL0_REG, 0);
+	if (ret)
+		goto err_disable;
+
+	ret = regmap_write(priv->regmap, AC200_SYS_EPHY_CTL1_REG,
+			   AC200_EPHY_MII_IO_ENABLE |
+			   priv->led_io_enable);
+	if (ret)
+		goto err_disable;
+
+	ret = regmap_write(priv->regmap, AC200_EPHY_CTL_REG,
+			   ephy_ctl | AC200_EPHY_SHUTDOWN);
+	if (ret)
+		goto err_disable;
+
+	ret = regmap_write(priv->regmap, AC200_SYS_EPHY_CTL0_REG,
+			   AC200_EPHY_RESET_DEASSERT |
+			   AC200_EPHY_SYSCLK_ENABLE);
+	if (ret)
+		goto err_disable;
+
+	fsleep(10000);
+
+	ret = regmap_write(priv->regmap, AC200_EPHY_CTL_REG, ephy_ctl);
+	if (ret)
+		goto err_disable;
+
+	priv->phy_addr = phy_addr;
+	priv->powered = true;
+	goto out_unlock;
+
+err_disable:
+	/* Mark it active so the cleanup sequence is always attempted. */
+	priv->phy_addr = phy_addr;
+	priv->powered = true;
+	ac200_ephy_ctl_power_off_locked(priv);
+out_unlock:
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+static int ac200_ephy_ctl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct ac200_ephy_ctl *priv;
+	phy_interface_t interface;
+	struct clk *clk;
+	unsigned long clk_rate;
+	unsigned int calibration;
+	u8 nvmem_calibration;
+	u8 bps_effuse_code;
+	u16 ephy_ctl;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	mutex_init(&priv->lock);
+
+	priv->regmap = dev_get_regmap(dev->parent, NULL);
+	if (!priv->regmap)
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "parent regmap is not ready\n");
+
+	if (device_property_present(dev, "nvmem-cells")) {
+		ret = nvmem_cell_read_u8(dev, "calibration",
+					 &nvmem_calibration);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to read calibration data\n");
+		calibration = nvmem_calibration;
+	} else {
+		ret = regmap_read(priv->regmap, AC200_EFUSE_EPHY_REG,
+				  &calibration);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to read on-chip calibration data\n");
+	}
+
+	ret = device_get_phy_mode(dev);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to read PHY mode\n");
+	interface = ret;
+
+	/* The vendor driver supplies no transfer function beyond this offset. */
+	bps_effuse_code = (calibration + AC200_EPHY_BPS_EFFUSE_OFFSET) &
+			   FIELD_MAX(AC200_EPHY_BPS_EFFUSE_MASK);
+	ephy_ctl = FIELD_PREP(AC200_EPHY_BPS_EFFUSE_MASK, bps_effuse_code) |
+		   AC200_EPHY_LED_ACTIVE_LOW;
+	/* EPHY_MODE and BIST_CLK_EN stay clear for normal operation. */
+
+	switch (interface) {
+	case PHY_INTERFACE_MODE_MII:
+		break;
+	case PHY_INTERFACE_MODE_RMII:
+		ephy_ctl |= AC200_EPHY_RMII_SEL;
+		break;
+	default:
+		return dev_err_probe(dev, -EINVAL,
+				     "unsupported PHY mode %s\n",
+				     phy_modes(interface));
+	}
+
+	clk = clk_get(dev->parent, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "failed to get input clock\n");
+
+	clk_rate = clk_get_rate(clk);
+	clk_put(clk);
+
+	switch (clk_rate) {
+	case 24000000:
+		ephy_ctl |= AC200_EPHY_CLK_SEL_24_MHZ;
+		break;
+	case 27000000:
+		break;
+	default:
+		return dev_err_probe(dev, -EINVAL,
+				     "unsupported input clock rate %lu Hz\n",
+				     clk_rate);
+	}
+
+	priv->control.power_on = ac200_ephy_ctl_power_on;
+	priv->control.power_off = ac200_ephy_ctl_power_off;
+	priv->control.set_led_outputs = ac200_ephy_ctl_set_led_outputs;
+	priv->control.set_led_polarity = ac200_ephy_ctl_set_led_polarity;
+	priv->control.interface = interface;
+	priv->ephy_ctl = ephy_ctl;
+	priv->led_io_enable = AC200_EPHY_LED_IO_ENABLE_MASK;
+	platform_set_drvdata(pdev, &priv->control);
+	return 0;
+}
+
+static void ac200_ephy_ctl_remove(struct platform_device *pdev)
+{
+	struct acx00_ephy_control *control = platform_get_drvdata(pdev);
+
+	control->power_off(control);
+}
+
+static const struct of_device_id ac200_ephy_ctl_of_match[] = {
+	{ .compatible = "x-powers,ac200-ephy-ctl" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ac200_ephy_ctl_of_match);
+
+static struct platform_driver ac200_ephy_ctl_driver = {
+	.probe = ac200_ephy_ctl_probe,
+	.remove = ac200_ephy_ctl_remove,
+	.shutdown = ac200_ephy_ctl_remove,
+	.driver = {
+		.name = "ac200-ephy-ctl",
+		.of_match_table = ac200_ephy_ctl_of_match,
+	},
+};
+module_platform_driver(ac200_ephy_ctl_driver);
+
+MODULE_AUTHOR("James Hilliard <james.hilliard1@gmail.com>");
+MODULE_DESCRIPTION("X-Powers AC200 Ethernet PHY control driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/net/phy/xpowers-acx00.h b/drivers/net/phy/xpowers-acx00.h
new file mode 100644
index 000000000000..8cf6fe616137
--- /dev/null
+++ b/drivers/net/phy/xpowers-acx00.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __DRIVERS_NET_PHY_XPOWERS_ACX00_H
+#define __DRIVERS_NET_PHY_XPOWERS_ACX00_H
+
+#include <linux/phy.h>
+
+enum acx00_ephy_led {
+	ACX00_EPHY_LED_LINK_ACTIVITY,
+	ACX00_EPHY_LED_SPEED,
+	ACX00_EPHY_LED_DUPLEX,
+	ACX00_EPHY_LED_COUNT,
+};
+
+struct acx00_ephy_control {
+	phy_interface_t interface;
+	int (*power_on)(struct acx00_ephy_control *control,
+			unsigned int phy_addr);
+	int (*power_off)(struct acx00_ephy_control *control);
+	int (*set_led_outputs)(struct acx00_ephy_control *control,
+			       unsigned long outputs);
+	int (*set_led_polarity)(struct acx00_ephy_control *control,
+				bool active_low);
+};
+
+#endif

-- 
2.53.0


