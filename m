Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545EBC5516F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 05:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMpLqvLPj4rvPj5SZvuQI1CV6P3xEdk1nLLBNVxHBq8=; b=u66rWa2oIuqOq/vTW8zXscp0fp
	xlM3yEAMGpAZ4rfh7zK8Gl62ZS08olNUOPcq4SsGWmsFYXSILIK54+moSwl0aoedqdEzF+xmLn3hS
	lyuWUptGbnvdsON9426Hodn2INZDOCXRJkXjKz2t8bjNERULHh7Ec67FWhndT4GkC1MMB5cb4aOuq
	yCo3qFKW7257EYqCJPqEK8t2s2Mz9xPTeW2nhh0iksCYjJ03wBn2mnzZaWwrJmEP9sPJevelQ6Mg5
	XG6R9a45L5E0dQu8ARWNHVNKYQ+qYXwpwo9AvjbqkyfLDcNtSkZETnfH0fQjqTIlz/v45KpOAN1Ne
	9MVIgejA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wql1d-0000000GL1Y-0OoC;
	Mon, 03 Aug 2026 05:15:45 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wql1Y-0000000GKrb-3iKk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 05:15:43 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-7ee4399c423so1835969a34.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 22:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734140; x=1786338940; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qMpLqvLPj4rvPj5SZvuQI1CV6P3xEdk1nLLBNVxHBq8=;
        b=RKV5DQC5v4e0J4IJ+ixmyGUzmKHJmyeSn4E8jy6AlLBcY0sJoiYxCfbsi8f530+imz
         fWu0UbqQfRAS8cs0DVPkhPZhovOV+V8LU+B4r+piUKcvhA085drZy//hzcZC6XQnKj73
         7JF/eFI2mDbT6cfxGycTzmNU9NFoGSKqAT8MFnF9ddzBXY0sMJVWaAqDq+4Fq3kkCy4m
         VHixnnIYuuitZlkMzwDSTILpOQG7+Gvt+OhfbMRQgVFMG0ioXYZZqRwxKOC48JDAAxc9
         X8Suqn0kuWbvcGVK+XHgEDvTxv+GuqJ5A403cFMA1wf6hTvc2qrVUJYLWnjmhICOpY/t
         RpWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734140; x=1786338940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qMpLqvLPj4rvPj5SZvuQI1CV6P3xEdk1nLLBNVxHBq8=;
        b=q0WT1Msl1wpa8R2Ra3e0sLCouQkyZp4uPOg6PGbROFbO2OHwCEZl7sPq9S6Wz/tbg1
         jrAKv/6ZPAbG5znYcORU4hpsxNF93n6Yp0dPSTBVMnQriKX0coBsFUMxDr1thw8sY2Q4
         yb7S0xx56moGYUdIgCrKEV+6IiFrxw0KEiVSi2LNXRxkKvtFa5rm1HWKfquvJD/x1tBu
         DirhtcYusclbyZ0iRGszcIHpULAyfBx5uTVZzGyYFrrQz3iH4PqwsvpToWJYv1joPY5i
         oMCWn9pocX+blKWsQmELajkV0ht4Dio8BRcd3jdLSUfSIXYtK8RUvzOSz4O8fSq86Sqk
         Cziw==
X-Forwarded-Encrypted: i=1; AHgh+RqAK9+gkcReDSxTyCflKD8yC4+TgcD8MqWtJc+Tp0bgFcQKWn4mqo3DSl5ijnY/oXO8xFydFN5hC+WNKyimREsX@lists.infradead.org
X-Gm-Message-State: AOJu0YxzzUsMeEtDiDMoxBCArUHBHLVru/K8ucTPK1KXgTrZLppolvBx
	4cXRzh71SGACqeP9EMbv1QC0vtDRtAUUWogERiegplVwGHRCMvY0W2Nq9HcdGXbP
X-Gm-Gg: AR+sD138G9EZVqO5NOeRQ91ngSM8fIw9tttfO/qpXq7gf1OAidkQNgcwW3jLtcJSHFC
	ZU5I+Ld8jg0NcgFmA1Xa0WBSU8I/hx6P06Cfv074tEVs+/G8MvNqNOtGZDwr6THX7NCqNlroii/
	vJcaYNapfw/dLJljtsd6J15QcyE8opvJwVs4WAkDHyOcAgdAT1YT7DeDLuvm59k32KqbI1FgXya
	tmugRt/vxgCOVq8NjMq6pk4DR/6E2wootyCGnZZ9YEWl/5uSLI/uruKR+77sBgHA+BdPTsmPUrO
	wppWPhcKt4/vPXKPNQV9BrFJqbnjtocy9NVpcdTsek+lD1/upiQsD1ai7rzf69YA/iwAMfFRlAI
	d1vsj/kV0ayurOvEEMWJpLKbThaeRTYTvk174BpKsUjY0BiO68dgii1dy9nDq4Prto+rgxmYihs
	P36ruSDBD2mR7TIdRLE5F6RwOjTqRZbZRnAtIg0VLhTzXfsPMs7v0HgOg7pN9Uwv2lhRhGDctzA
	rQd1DQC+7y3fXRpZ0lbSdDLfr23HvwWicn9w1b3i9BKsB8szDkfASJcEBUt5FlPXNNU/RrIGjgU
	TzrLx+rBHDGNzzXHNbadi3hKL4QUyrAlnUytEThuPkQtnOaedD02CBB1AUER1tW1q0TNGgslDZ8
	S0Togu/8di/+kvlhOTA==
X-Received: by 2002:a05:6830:67f6:b0:7e6:e022:4b44 with SMTP id 46e09a7af769-7f196f1c52bmr14209690a34.15.1785734139942;
        Sun, 02 Aug 2026 22:15:39 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:22 -0600
Subject: [PATCH 12/21] net: phy: add X-Powers AC300 EPHY control driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-12-0a53cd9e21cc@gmail.com>
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
X-CRM114-CacheID: sfid-20260802_221541_291659_E767F802 
X-CRM114-Status: GOOD (  24.26  )
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

The AC300 Fast Ethernet PHY uses a non-PHY Clause 22 endpoint for the
power-up and configuration sequence required before its link registers
become usable.

Enable the required VCC1 supply and wait the manual's 10 ms power-on-reset
interval before accessing the device. Accept the configured 24, 25 or
27 MHz input clock and program its corresponding selector, apply the SoC
SID calibration value and vendor offset, select the interface mode,
configure the I/O drive controls, and follow the manual reset-before-clock
power-up sequence. Retain the vendor eFuse and register-clock enable
settings.

Validate the control address and supply configuration against the package
strap state. Clear a latched MDIO error after reset and fail power-up if
it remains asserted. Enable the internal digital LDO only for the
corresponding package and preserve the external-supply configuration
across later power cycles. Report the chip, mask and package revisions.

Expose serialized, idempotent power-on and power-off operations so the
link-PHY driver can sequence the input clock and control block across
resets and system sleep. Also expose operations for the global LED polarity
and package pad enables, retaining the documented default drive strength.
Initialize all three outputs active-low as in the vendor kernel, while
allowing an explicit link-PHY LED topology to replace that fallback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/phy/Kconfig             |   9 +
 drivers/net/phy/Makefile            |   1 +
 drivers/net/phy/xpowers-ac300-ctl.c | 454 ++++++++++++++++++++++++++++++++++++
 drivers/net/phy/xpowers-acx00.h     |   2 +
 4 files changed, 466 insertions(+)

diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index e059bd6c5eda..9b202072d5a0 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -478,6 +478,15 @@ config XPOWERS_AC200_PHY_CTL
 	  address, interface mode, calibration and I/O controls through the
 	  parent AC200 I2C regmap.
 
+config XPOWERS_AC300_PHY_CTL
+	tristate "X-Powers AC300 Ethernet PHY control"
+	depends on COMMON_CLK && NVMEM && OF_MDIO
+	help
+	  Enable the MDIO control driver for the Fast Ethernet PHY in the
+	  X-Powers AC300 companion IC. It programs the PHY calibration,
+	  interface mode, clock and I/O controls through the separate MDIO
+	  control address.
+
 config XILINX_GMII2RGMII
 	tristate "Xilinx GMII2RGMII converter driver"
 	help
diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index e53ca319f9c4..2d22d5a4c93d 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -100,4 +100,5 @@ obj-$(CONFIG_STE10XP)		+= ste10Xp.o
 obj-$(CONFIG_TERANETICS_PHY)	+= teranetics.o
 obj-$(CONFIG_VITESSE_PHY)	+= vitesse.o
 obj-$(CONFIG_XPOWERS_AC200_PHY_CTL) += xpowers-ac200-ctl.o
+obj-$(CONFIG_XPOWERS_AC300_PHY_CTL) += xpowers-ac300-ctl.o
 obj-$(CONFIG_XILINX_GMII2RGMII) += xilinx_gmii2rgmii.o
diff --git a/drivers/net/phy/xpowers-ac300-ctl.c b/drivers/net/phy/xpowers-ac300-ctl.c
new file mode 100644
index 000000000000..eb3faaab9337
--- /dev/null
+++ b/drivers/net/phy/xpowers-ac300-ctl.c
@@ -0,0 +1,454 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * X-Powers AC300 Ethernet PHY control driver
+ *
+ * Copyright (C) 2026 James Hilliard <james.hilliard1@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/mdio.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/nvmem-consumer.h>
+#include <linux/phy.h>
+#include <linux/property.h>
+#include <linux/regulator/consumer.h>
+
+#include "xpowers-acx00.h"
+
+#define AC300_EPHY_BGS_EFFUSE_OFFSET	3
+
+#define AC300_SYS_CONTROL_REG			0x00
+#define AC300_CHIP_VERSION_MASK			GENMASK(15, 12)
+#define AC300_PACKAGE_STATUS_MASK		GENMASK(11, 8)
+#define AC300_EPHY_CLK_SEL_MASK			GENMASK(7, 6)
+#define AC300_EPHY_CLK_SEL_25_MHZ		FIELD_PREP(AC300_EPHY_CLK_SEL_MASK, 0)
+#define AC300_EPHY_CLK_SEL_27_MHZ		FIELD_PREP(AC300_EPHY_CLK_SEL_MASK, 1)
+#define AC300_EPHY_CLK_SEL_24_MHZ		FIELD_PREP(AC300_EPHY_CLK_SEL_MASK, 2)
+#define AC300_EFUSE_CLK_ENABLE			BIT(5)
+#define AC300_EPHY_REG_CLK_ENABLE		BIT(4)
+#define AC300_MDIO_ERROR			BIT(3)
+#define AC300_CLKIN_GATING_ENABLE		BIT(2)
+#define AC300_EPHY_RESET_DEASSERT		BIT(1)
+#define AC300_CHIP_RESET_DEASSERT		BIT(0)
+
+#define AC300_MASK_VERSION_REG			0x04
+#define AC300_MASK_VERSION_MASK			GENMASK(2, 0)
+
+#define AC300_PACKAGE_POR_INTERNAL_DLDO		BIT(3)
+#define AC300_PACKAGE_PHY_ADDR_MASK		GENMASK(2, 0)
+
+#define AC300_SYS_BIAS1_REG			0x02
+#define AC300_INTERNAL_DLDO_ENABLE		BIT(15)
+
+#define AC300_SYS_IO_REG			0x05
+#define AC300_MDIO_DRV_MASK			GENMASK(15, 14)
+#define AC300_LED_DRV_MASK			GENMASK(13, 12)
+#define AC300_MII_DRV_MASK			GENMASK(11, 10)
+#define AC300_IO_DRV_LEVEL_2			2
+#define AC300_CLKIN_PAD_ENABLE			BIT(4)
+#define AC300_DUPLEX_LED_IO_ENABLE		BIT(3)
+#define AC300_SPEED_LED_IO_ENABLE		BIT(2)
+#define AC300_LINK_LED_IO_ENABLE			BIT(1)
+#define AC300_EPHY_MII_IO_ENABLE			BIT(0)
+#define AC300_LED_IO_ENABLE_MASK \
+	(AC300_DUPLEX_LED_IO_ENABLE | AC300_SPEED_LED_IO_ENABLE | \
+	 AC300_LINK_LED_IO_ENABLE)
+
+#define AC300_EPHY_CONFIG_REG			0x06
+#define AC300_EPHY_BGS_EFFUSE_MASK		GENMASK(15, 12)
+#define AC300_EPHY_RMII_SEL			BIT(11)
+#define AC300_EPHY_LED_ACTIVE_LOW		BIT(1)
+#define AC300_EPHY_SHUTDOWN			BIT(0)
+
+#define AC300_SYS_CONTROL_ENABLE_BITS \
+	(AC300_EFUSE_CLK_ENABLE | AC300_EPHY_REG_CLK_ENABLE | \
+	 AC300_CLKIN_GATING_ENABLE | \
+	 AC300_EPHY_RESET_DEASSERT | AC300_CHIP_RESET_DEASSERT)
+
+#define AC300_SYS_IO_BASE_VALUE \
+	(FIELD_PREP(AC300_MDIO_DRV_MASK, AC300_IO_DRV_LEVEL_2) | \
+	 FIELD_PREP(AC300_LED_DRV_MASK, AC300_IO_DRV_LEVEL_2) | \
+	 FIELD_PREP(AC300_MII_DRV_MASK, AC300_IO_DRV_LEVEL_2) | \
+	 AC300_CLKIN_PAD_ENABLE | AC300_EPHY_MII_IO_ENABLE)
+
+struct ac300_ephy_ctl {
+	struct acx00_ephy_control control;
+	struct mdio_device *mdiodev;
+	struct clk *clk;
+	struct mutex lock; /* Serializes power sequencing and state. */
+	u16 sys_control;
+	u16 ephy_config;
+	u16 led_io_enable;
+	bool package_known;
+	bool internal_dldo;
+	bool powered;
+};
+
+static unsigned int
+ac300_ephy_ctl_link_addr(const struct ac300_ephy_ctl *priv)
+{
+	return priv->mdiodev->addr - AC300_EPHY_CONTROL_ADDR_OFFSET;
+}
+
+static int
+ac300_ephy_ctl_set_led_outputs(struct acx00_ephy_control *control,
+			       unsigned long outputs)
+{
+	struct ac300_ephy_ctl *priv =
+		container_of(control, struct ac300_ephy_ctl, control);
+	u16 led_io_enable;
+	int ret = 0;
+
+	if (outputs & ~GENMASK(ACX00_EPHY_LED_COUNT - 1, 0))
+		return -EINVAL;
+
+	led_io_enable = (outputs << 1) & AC300_LED_IO_ENABLE_MASK;
+
+	mutex_lock(&priv->lock);
+	if (priv->powered)
+		ret = mdiodev_modify(priv->mdiodev, AC300_SYS_IO_REG,
+				     AC300_LED_IO_ENABLE_MASK, led_io_enable);
+	if (!ret)
+		priv->led_io_enable = led_io_enable;
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+static int
+ac300_ephy_ctl_set_led_polarity(struct acx00_ephy_control *control,
+				bool active_low)
+{
+	struct ac300_ephy_ctl *priv =
+		container_of(control, struct ac300_ephy_ctl, control);
+	u16 value = active_low ? AC300_EPHY_LED_ACTIVE_LOW : 0;
+	int ret = 0;
+
+	mutex_lock(&priv->lock);
+	if (priv->powered)
+		ret = mdiodev_modify(priv->mdiodev, AC300_EPHY_CONFIG_REG,
+				     AC300_EPHY_LED_ACTIVE_LOW, value);
+	if (!ret) {
+		priv->ephy_config &= ~AC300_EPHY_LED_ACTIVE_LOW;
+		priv->ephy_config |= value;
+	}
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+static int ac300_ephy_ctl_power_off_locked(struct ac300_ephy_ctl *priv)
+{
+	int err;
+	int ret;
+
+	if (!priv->powered)
+		return 0;
+
+	ret = mdiodev_write(priv->mdiodev, AC300_EPHY_CONFIG_REG,
+			    priv->ephy_config | AC300_EPHY_SHUTDOWN);
+	err = mdiodev_write(priv->mdiodev, AC300_SYS_IO_REG, 0);
+	if (!ret)
+		ret = err;
+	err = mdiodev_write(priv->mdiodev, AC300_SYS_CONTROL_REG,
+			    priv->package_known && !priv->internal_dldo ?
+			    AC300_CHIP_RESET_DEASSERT : 0);
+	if (!ret)
+		ret = err;
+
+	clk_disable_unprepare(priv->clk);
+	priv->powered = false;
+
+	return ret;
+}
+
+static int ac300_ephy_ctl_power_off(struct acx00_ephy_control *control)
+{
+	struct ac300_ephy_ctl *priv =
+		container_of(control, struct ac300_ephy_ctl, control);
+	int ret;
+
+	mutex_lock(&priv->lock);
+	ret = ac300_ephy_ctl_power_off_locked(priv);
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+static int ac300_ephy_ctl_power_on(struct acx00_ephy_control *control,
+				   unsigned int phy_addr)
+{
+	struct ac300_ephy_ctl *priv =
+		container_of(control, struct ac300_ephy_ctl, control);
+	u8 package_status;
+	int sys_control;
+	u16 reset_value;
+	int ret;
+
+	if (phy_addr != ac300_ephy_ctl_link_addr(priv))
+		return -EINVAL;
+
+	mutex_lock(&priv->lock);
+	if (priv->powered) {
+		ret = 0;
+		goto out_unlock;
+	}
+
+	ret = clk_prepare_enable(priv->clk);
+	if (ret)
+		goto out_unlock;
+	priv->powered = true;
+
+	/* Keep the external-supply configuration across subsequent resets. */
+	reset_value = priv->package_known && !priv->internal_dldo ?
+		      AC300_CHIP_RESET_DEASSERT : 0;
+	ret = mdiodev_write(priv->mdiodev, AC300_SYS_CONTROL_REG, reset_value);
+	if (ret)
+		goto err_power_off;
+
+	/* The manual requires both resets to be released before the clocks. */
+	ret = mdiodev_write(priv->mdiodev, AC300_SYS_CONTROL_REG,
+			    AC300_EPHY_RESET_DEASSERT |
+			    AC300_CHIP_RESET_DEASSERT);
+	if (ret)
+		goto err_power_off;
+
+	/* Retain the vendor clock-enable defaults, including the eFuse clock. */
+	ret = mdiodev_write(priv->mdiodev, AC300_SYS_CONTROL_REG,
+			    priv->sys_control);
+	if (ret)
+		goto err_power_off;
+
+	sys_control = mdiodev_read(priv->mdiodev, AC300_SYS_CONTROL_REG);
+	if (sys_control < 0) {
+		ret = sys_control;
+		goto err_power_off;
+	}
+	if (sys_control & AC300_MDIO_ERROR) {
+		ret = mdiodev_write(priv->mdiodev, AC300_SYS_CONTROL_REG,
+				    priv->sys_control | AC300_MDIO_ERROR);
+		if (ret)
+			goto err_power_off;
+
+		sys_control = mdiodev_read(priv->mdiodev, AC300_SYS_CONTROL_REG);
+		if (sys_control < 0) {
+			ret = sys_control;
+			goto err_power_off;
+		}
+		if (sys_control & AC300_MDIO_ERROR) {
+			ret = -EIO;
+			goto err_power_off;
+		}
+	}
+
+	package_status = FIELD_GET(AC300_PACKAGE_STATUS_MASK, sys_control);
+	if ((~package_status & AC300_PACKAGE_PHY_ADDR_MASK) !=
+	    ac300_ephy_ctl_link_addr(priv)) {
+		ret = -EINVAL;
+		goto err_power_off;
+	}
+
+	priv->internal_dldo = package_status &
+				      AC300_PACKAGE_POR_INTERNAL_DLDO;
+	priv->package_known = true;
+	ret = mdiodev_modify(priv->mdiodev, AC300_SYS_BIAS1_REG,
+			     AC300_INTERNAL_DLDO_ENABLE,
+			     priv->internal_dldo ?
+			     AC300_INTERNAL_DLDO_ENABLE : 0);
+	if (ret)
+		goto err_power_off;
+
+	/* Keep the documented default drive level and leave the IRQ disabled. */
+	ret = mdiodev_write(priv->mdiodev, AC300_SYS_IO_REG,
+			    AC300_SYS_IO_BASE_VALUE | priv->led_io_enable);
+	if (ret)
+		goto err_power_off;
+
+	fsleep(10000);
+
+	ret = mdiodev_write(priv->mdiodev, AC300_EPHY_CONFIG_REG,
+			    priv->ephy_config | AC300_EPHY_SHUTDOWN);
+	if (ret)
+		goto err_power_off;
+
+	fsleep(10000);
+
+	ret = mdiodev_write(priv->mdiodev, AC300_EPHY_CONFIG_REG,
+			    priv->ephy_config);
+	if (ret)
+		goto err_power_off;
+
+	goto out_unlock;
+
+err_power_off:
+	ac300_ephy_ctl_power_off_locked(priv);
+out_unlock:
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+static int ac300_ephy_ctl_probe(struct mdio_device *mdiodev)
+{
+	struct device *dev = &mdiodev->dev;
+	struct ac300_ephy_ctl *priv;
+	phy_interface_t interface;
+	u8 calibration;
+	u8 bgs_effuse_code;
+	u8 package_status;
+	u16 ephy_config;
+	struct clk *clk;
+	int mask_version;
+	int sys_control;
+	unsigned long clk_rate;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	if (mdiodev->addr < AC300_EPHY_CONTROL_ADDR_OFFSET ||
+	    mdiodev->addr > AC300_EPHY_CONTROL_ADDR_OFFSET +
+			    FIELD_MAX(AC300_PACKAGE_PHY_ADDR_MASK))
+		return dev_err_probe(dev, -EINVAL,
+				     "control address is outside the package range\n");
+	priv->mdiodev = mdiodev;
+	mutex_init(&priv->lock);
+
+	ret = devm_regulator_get_enable(dev, "vcc1");
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to enable VCC1 supply\n");
+
+	/* Wait for the power-on reset interval specified by the manual. */
+	fsleep(10000);
+
+	clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "failed to get input clock\n");
+	priv->clk = clk;
+
+	ret = devm_clk_rate_exclusive_get(dev, clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to lock clock rate\n");
+
+	clk_rate = clk_get_rate(clk);
+	switch (clk_rate) {
+	case 24000000:
+		priv->sys_control = AC300_EPHY_CLK_SEL_24_MHZ;
+		break;
+	case 25000000:
+		priv->sys_control = AC300_EPHY_CLK_SEL_25_MHZ;
+		break;
+	case 27000000:
+		priv->sys_control = AC300_EPHY_CLK_SEL_27_MHZ;
+		break;
+	default:
+		return dev_err_probe(dev, -EINVAL,
+				     "unsupported input clock rate %lu Hz\n",
+				     clk_rate);
+	}
+	priv->sys_control |= AC300_SYS_CONTROL_ENABLE_BITS;
+
+	ret = nvmem_cell_read_u8(dev, "calibration", &calibration);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to read calibration data\n");
+
+	ret = device_get_phy_mode(dev);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to read PHY mode\n");
+	interface = ret;
+
+	/* The vendor driver supplies no transfer function beyond this offset. */
+	bgs_effuse_code = (calibration + AC300_EPHY_BGS_EFFUSE_OFFSET) &
+			   FIELD_MAX(AC300_EPHY_BGS_EFFUSE_MASK);
+	ephy_config = FIELD_PREP(AC300_EPHY_BGS_EFFUSE_MASK, bgs_effuse_code) |
+		      AC300_EPHY_LED_ACTIVE_LOW;
+	/* EPHY_MODE and BIST_CLK_EN stay clear for normal operation. */
+
+	switch (interface) {
+	case PHY_INTERFACE_MODE_MII:
+		break;
+	case PHY_INTERFACE_MODE_RMII:
+		ephy_config |= AC300_EPHY_RMII_SEL;
+		break;
+	default:
+		return dev_err_probe(dev, -EINVAL,
+				     "unsupported PHY mode %s\n",
+				     phy_modes(interface));
+	}
+
+	priv->control.power_on = ac300_ephy_ctl_power_on;
+	priv->control.power_off = ac300_ephy_ctl_power_off;
+	priv->control.set_led_outputs = ac300_ephy_ctl_set_led_outputs;
+	priv->control.set_led_polarity = ac300_ephy_ctl_set_led_polarity;
+	priv->control.interface = interface;
+	priv->ephy_config = ephy_config;
+	priv->led_io_enable = AC300_LED_IO_ENABLE_MASK;
+	mdiodev_set_drvdata(mdiodev, &priv->control);
+
+	ret = ac300_ephy_ctl_power_on(&priv->control,
+				      ac300_ephy_ctl_link_addr(priv));
+	if (ret)
+		goto err_disable;
+
+	sys_control = mdiodev_read(mdiodev, AC300_SYS_CONTROL_REG);
+	if (sys_control < 0) {
+		ret = sys_control;
+		goto err_disable;
+	}
+	package_status = FIELD_GET(AC300_PACKAGE_STATUS_MASK, sys_control);
+
+	mask_version = mdiodev_read(mdiodev, AC300_MASK_VERSION_REG);
+	if (mask_version < 0) {
+		ret = mask_version;
+		goto err_disable;
+	}
+
+	dev_info(dev, "chip version %u, mask version %u, package %#x, %s supplies, PHY %u, %lu Hz clock\n",
+		 (unsigned int)FIELD_GET(AC300_CHIP_VERSION_MASK, sys_control),
+		 (unsigned int)FIELD_GET(AC300_MASK_VERSION_MASK, mask_version),
+		 package_status,
+		 package_status & AC300_PACKAGE_POR_INTERNAL_DLDO ?
+			"POR/internal DLDO" : "reset pin/external VDD",
+		 ac300_ephy_ctl_link_addr(priv), clk_rate);
+
+	return 0;
+
+err_disable:
+	ac300_ephy_ctl_power_off(&priv->control);
+	return ret;
+}
+
+static void ac300_ephy_ctl_remove(struct mdio_device *mdiodev)
+{
+	struct acx00_ephy_control *control = mdiodev_get_drvdata(mdiodev);
+
+	control->power_off(control);
+}
+
+static const struct of_device_id ac300_ephy_ctl_of_match[] = {
+	{ .compatible = "x-powers,ac300-ephy-ctl" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ac300_ephy_ctl_of_match);
+
+static struct mdio_driver ac300_ephy_ctl_driver = {
+	.probe = ac300_ephy_ctl_probe,
+	.remove = ac300_ephy_ctl_remove,
+	.shutdown = ac300_ephy_ctl_remove,
+	.mdiodrv.driver = {
+		.name = "ac300-ephy-ctl",
+		.of_match_table = ac300_ephy_ctl_of_match,
+	},
+};
+
+mdio_module_driver(ac300_ephy_ctl_driver);
+
+MODULE_AUTHOR("James Hilliard <james.hilliard1@gmail.com>");
+MODULE_DESCRIPTION("X-Powers AC300 Ethernet PHY control driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/net/phy/xpowers-acx00.h b/drivers/net/phy/xpowers-acx00.h
index 8cf6fe616137..8ed15bc4eed5 100644
--- a/drivers/net/phy/xpowers-acx00.h
+++ b/drivers/net/phy/xpowers-acx00.h
@@ -4,6 +4,8 @@
 
 #include <linux/phy.h>
 
+#define AC300_EPHY_CONTROL_ADDR_OFFSET	16
+
 enum acx00_ephy_led {
 	ACX00_EPHY_LED_LINK_ACTIVITY,
 	ACX00_EPHY_LED_SPEED,

-- 
2.53.0


