Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183A5C88E66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 03:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OtN5FPSKCGNs5pMa1pYq9igP2vP81fNP/piE94f5ogU=; b=OoDNHPVuFVOqmfG4WroIM3UwuX
	d+0gv8Fhh3L+ktmEE5XohX8iyORFrI7rUc5zZOX8wolWohYFICKX2Ai2mWiIBs/0zauR4MLuFXvxd
	pnFI23GQIBHjtknkp26RZjVjCaQCySd+SSWAzOf5woOM9qorsjdFADBhefV5P1QTRnV+8OVmQpfUu
	CZoS9MSdxUtjnqqJe4cCe47Bs2/8eFDqyCJQoq11ms2UCd7FwdLEFqRhawudmWFsI5CiJ9oV8popw
	uw5QmP2yHwiG4D/aobabjRJC4Mkv3BoYi/6eh2dy4s5nwgjqb5AsLxyG/8w3QMi2dw6tFjyd6RSR/
	kxH8P8TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5xE0-00000002GAV-2zye;
	Mon, 14 Sep 2026 03:19:20 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5xDx-00000002G8w-3WbJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 03:19:18 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747ed9866so18045925ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 20:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789355957; x=1789960757; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OtN5FPSKCGNs5pMa1pYq9igP2vP81fNP/piE94f5ogU=;
        b=YAU8INdA/zNEkmLjqig+ICmSspC2pqgt+CGzH0RlTQwZQGgUTVg5CHrVsRu74OsE0t
         SEnI0bT3+MajpJkYG7vz0mZ1oLWXZgNXTrnziTL3zzqpxjAnj/c7k3OfzkuI7VDe0N9g
         OOek8x0CzrwhTCyCBGdjSBJLM1rPOiwlCjeunZCZv97PM7r2XvCea1WYQxN3w009NmTe
         KF5RljrlS7XYmtpH0ieIDxoM1+xuNs+vZMlqx6QC026tdD4zrZ2IwySXvGynJgbSMCJo
         CPSTo389CgReg/ej8/v4SZy8B2k9SKZgBYXOb0oQVC85eu4j4ZnqI57YmPn8Eo2HO/t2
         2IXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789355957; x=1789960757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OtN5FPSKCGNs5pMa1pYq9igP2vP81fNP/piE94f5ogU=;
        b=jTN1mK98gyQe0nOu+qVE/ixnJtv+PNyewlvP/5xiJtmYQw2U8SgLhPQWmKQwHRELKd
         L2I7Ck5ewPOt/YGDbEDbVV7VzEZAmrqSxNT1CbHzsKTwMRbHlNUpM7hjCztvWPCSRg/N
         lSfUU4y9B5vBtB//pWSGjNoaO+XnhK7BEFBIBGB8gLatOwPIcOzH6tbGuAv/BhUb32tX
         CaBXERz764CR9DAU38uQX/ibz2WSW5yY5Q6gDs2YurUbElcnbNuiXxX8VET6JhguajyL
         2+nVsFvY7FonrGs0e+QWuqIsWcuIHhMcSSORjBOQhlgvQsQax9imTeexTfXjov2lZkbJ
         +Olw==
X-Forwarded-Encrypted: i=1; AKwUvBxcT3kOvY1Xaa6Tmg96BV/XTjTG+VhxRf030/rg9k5DrmUYs+JgMcaRmCHESVMwxb3eZJz5ZRckoTmPXLgJh74z@lists.infradead.org
X-Gm-Message-State: AFuF++mLFTjQvgIkZ0kM7x5AHGxGvYaYspeYooz0xx5zQ9nD25Xsu/vI
	CRN8weGxmup0Dm9GRWys4rO1dsx3dPQP2kHpJDp7efL8CUSH/EpvrwQE
X-Gm-Gg: AYBFou0Ism4gJ0gHCQL0KcvC8n2DyiUTHOEcYPSm21zgGlCMQzqg28Bz95TV/GLHdML
	FtUL2gLVSNNyzP432WSyS+HeFo2yvQriQBL5fCRmjq1ci7TJHCQBQ+vreoFsX2bL7obeGd00yfk
	VBsSAPCBIyGkVhefkH5MiZpKKZuoxTejdCOWTgaCuoMtA33kotTzj9Us3jZmrTYQmMuRgATPGz1
	jwK5r7MjCg0fCqnCTxfHDblb+Q/SYcPoAWBnqbUom5BboAUEJ1nRfQX/QtpW5CUqq901AB04Gmr
	hZ+il9/JkmtC/Jp+zto0+klqoakcQJVs/co2MwVXH09Fnykp+dqduUAgQW/gD1AkcTZAS5IXmWi
	knu9RrnLqF09UMWVTHtlnog8M1VSmD3G9KMfBEIyOCjBVHCU0o1SxvpfdXizuZp2Ab1sQwDlxKK
	PygMWxqyxmXi99AJ4SBacToymfzvM9eYKrfKc/lAF0o+0ZVs0w50ZTY91ngfO49kTeHlbTTW1Rk
	9SdE7xYmmwtZwUekLMFnQWlMATQa8ueqj3ioO0OaYdM0GVE+n4+7JGaiQWow0Q=
X-Received: by 2002:a17:903:2cd:b0:2c9:bf82:dd11 with SMTP id d9443c01a7336-2dd6c5d60f0mr16116055ad.7.1789355957164;
        Sun, 13 Sep 2026 20:19:17 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfc2d3bsm41355145ad.48.2026.09.13.20.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:19:16 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v5 3/3] phy: nuvoton: phy-ma35d1-usb2: extend to dual-port with OTG support
Date: Mon, 14 Sep 2026 11:18:59 +0800
Message-ID: <20260914031859.385224-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914031859.385224-1-a0987203069@gmail.com>
References: <20260914031859.385224-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_201917_911305_D8039E06 
X-CRM114-Status: GOOD (  29.12  )
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

PHY0 and PHY1 use the same power-on/reset sequence in USBPMISCR, with
PHY1 control bits shifted 16 positions relative to PHY0.  A separate
driver for PHY1 would duplicate this logic, so the existing driver is
extended to manage both ports.

The original driver polled only DEVCKSTB after releasing PHY0 from
reset.  When USB0 operates in host mode (USB ID pin floating or tied
high) only HSTCKSTB and CK12MSTB assert; DEVCKSTB never sets.  Polling
exclusively for DEVCKSTB in host mode causes a 1 ms timeout on every
phy_init() call from the EHCI driver.  The init callback is changed to
accept either host-mode or device-mode clock stability, whichever
asserts first.

The power_on and power_off callbacks are replaced by a single init
callback that handles PHY reset and clock-stable polling, because
there is no PHY-specific clock gate on MA35D1; the PHY analog block
derives its reference from the HXT crystal.

A read-only USB role switch is registered for PHY0 to expose the USB0
role to userspace via the standard role-switch sysfs interface.  The
.set callback returns -EOPNOTSUPP because the hardware mux is fully
automatic with no software override path.  When CONFIG_USB_ROLE_SWITCH
is not enabled, the registration returns -ENODEV and the driver skips
the role switch gracefully without failing probe.

Two new optional device-tree properties are implemented:
  - nuvoton,rcalcode: writes per-port 4-bit resistor calibration trim
    codes to the RCALCODE field in USBPMISCR.
  - nuvoton,oc-active-high: sets the UHOVRCURH bit in MISCFCR0 to treat
    the over-current detect input as active-high.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/phy/nuvoton/phy-ma35d1-usb2.c | 284 +++++++++++++++++++-------
 1 file changed, 210 insertions(+), 74 deletions(-)

diff --git a/drivers/phy/nuvoton/phy-ma35d1-usb2.c b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
index 9a459b700ed4..2c60be0ee50f 100644
--- a/drivers/phy/nuvoton/phy-ma35d1-usb2.c
+++ b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
@@ -1,11 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (C) 2024 Nuvoton Technology Corp.
+ * Nuvoton MA35D1 USB 2.0 PHY driver
+ *
+ * Supports PHY0 (USB0 OTG port, shared between DWC2 gadget and EHCI0/OHCI0)
+ * and PHY1 (USB1 host-only port, used by EHCI1/OHCI1). The hardware mux on
+ * PHY0 switches automatically via the USB ID pin.
+ *
+ * Copyright (C) 2026 Nuvoton Technology Corp.
  */
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
@@ -13,131 +18,262 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/usb/role.h>
 
-/* USB PHY Miscellaneous Control Register */
-#define MA35_SYS_REG_USBPMISCR	0x60
-#define PHY0POR			BIT(0)  /* PHY Power-On Reset Control Bit */
-#define PHY0SUSPEND			BIT(1)  /* PHY Suspend; 0: suspend, 1: operaion */
-#define PHY0COMN			BIT(2)  /* PHY Common Block Power-Down Control */
-#define PHY0DEVCKSTB			BIT(10) /* PHY 60 MHz UTMI clock stable bit */
+#define MA35_SYS_PWRONOTP		0x04
+#define PWRONOTP_USBP0ID		BIT(16)
+
+#define MA35_SYS_USBPMISCR		0x60
+#define USBPMISCR_PHY_POR(n)		BIT(0  + (n) * 16)
+#define USBPMISCR_PHY_SUSPEND(n)	BIT(1  + (n) * 16)
+#define USBPMISCR_PHY_COMN(n)		BIT(2  + (n) * 16)
+#define USBPMISCR_PHY_HSTCKSTB(n)	BIT(8  + (n) * 16)
+#define USBPMISCR_PHY_CK12MSTB(n)	BIT(9  + (n) * 16)
+#define USBPMISCR_PHY_DEVCKSTB(n)	BIT(10 + (n) * 16)
+/* Mask for control bits (POR, SUSPEND, COMN) */
+#define USBPMISCR_PHY_CTL_MASK(n)	(0x7u << ((n) * 16))
+/* Host-mode ready */
+#define USBPMISCR_PHY_HOST_READY(n)	(USBPMISCR_PHY_SUSPEND(n)  | \
+					 USBPMISCR_PHY_HSTCKSTB(n) | \
+					 USBPMISCR_PHY_CK12MSTB(n))
+/* Device-mode ready */
+#define USBPMISCR_PHY_DEV_READY(n)	(USBPMISCR_PHY_SUSPEND(n)  | \
+					 USBPMISCR_PHY_DEVCKSTB(n))
+/* RCALCODE: 4-bit resistor trim */
+#define USBPMISCR_RCAL_SHIFT(n)		(12 + (n) * 16)
+#define USBPMISCR_RCAL_MASK(n)		GENMASK(USBPMISCR_RCAL_SHIFT(n) + 3, \
+						USBPMISCR_RCAL_SHIFT(n))
+
+#define MA35_SYS_MISCFCR0		0x70
+/* USB host over-current detect polarity (shared, both ports) */
+#define MISCFCR0_UHOVRCURH		BIT(12)
+
+#define MA35_PHY_NUM			2
+
+struct ma35_phy_port {
+	struct phy *phy;
+	unsigned int idx;
+};
 
 struct ma35_usb_phy {
-	struct clk *clk;
 	struct device *dev;
 	struct regmap *sysreg;
+	struct ma35_phy_port port[MA35_PHY_NUM];
+	struct usb_role_switch *role_sw;
 };
 
-static int ma35_usb_phy_power_on(struct phy *phy)
+static int ma35_usb_phy_init(struct phy *phy)
 {
-	struct ma35_usb_phy *p_phy = phy_get_drvdata(phy);
+	struct ma35_phy_port *port = phy_get_drvdata(phy);
+	struct ma35_usb_phy *p = container_of(port - port->idx,
+					      struct ma35_usb_phy, port[0]);
+	unsigned int n = port->idx;
 	unsigned int val;
 	int ret;
 
-	ret = clk_prepare_enable(p_phy->clk);
-	if (ret < 0) {
-		dev_err(p_phy->dev, "Failed to enable PHY clock: %d\n", ret);
-		return ret;
-	}
+	regmap_read(p->sysreg, MA35_SYS_USBPMISCR, &val);
 
-	regmap_read(p_phy->sysreg, MA35_SYS_REG_USBPMISCR, &val);
-	if (val & PHY0SUSPEND) {
-		/*
-		 * USB PHY0 is in operation mode already
-		 * make sure USB PHY 60 MHz UTMI Interface Clock ready
-		 */
-		ret = regmap_read_poll_timeout(p_phy->sysreg, MA35_SYS_REG_USBPMISCR, val,
-						val & PHY0DEVCKSTB, 10, 1000);
-		if (ret == 0)
-			return 0;
-	}
+	if (val & USBPMISCR_PHY_SUSPEND(n))
+		return 0;
 
-	/*
-	 * reset USB PHY0.
-	 * wait until USB PHY0 60 MHz UTMI Interface Clock ready
-	 */
-	regmap_update_bits(p_phy->sysreg, MA35_SYS_REG_USBPMISCR, 0x7, (PHY0POR | PHY0SUSPEND));
+	regmap_update_bits(p->sysreg, MA35_SYS_USBPMISCR,
+			   USBPMISCR_PHY_CTL_MASK(n),
+			   USBPMISCR_PHY_POR(n) | USBPMISCR_PHY_SUSPEND(n));
 	udelay(20);
 
-	/* make USB PHY0 enter operation mode */
-	regmap_update_bits(p_phy->sysreg, MA35_SYS_REG_USBPMISCR, 0x7, PHY0SUSPEND);
+	regmap_update_bits(p->sysreg, MA35_SYS_USBPMISCR,
+			   USBPMISCR_PHY_CTL_MASK(n),
+			   USBPMISCR_PHY_SUSPEND(n));
 
-	/* make sure USB PHY 60 MHz UTMI Interface Clock ready */
-	ret = regmap_read_poll_timeout(p_phy->sysreg, MA35_SYS_REG_USBPMISCR, val,
-					val & PHY0DEVCKSTB, 10, 1000);
-	if (ret == -ETIMEDOUT) {
-		dev_err(p_phy->dev, "Check PHY clock, Timeout: %d\n", ret);
-		clk_disable_unprepare(p_phy->clk);
+	if (n == 0) {
+		ret = regmap_read_poll_timeout(p->sysreg, MA35_SYS_USBPMISCR,
+					       val,
+					       ((val & USBPMISCR_PHY_HOST_READY(0)) ==
+						USBPMISCR_PHY_HOST_READY(0)) ||
+					       ((val & USBPMISCR_PHY_DEV_READY(0)) ==
+						USBPMISCR_PHY_DEV_READY(0)),
+					       10, 1000);
+	} else {
+		ret = regmap_read_poll_timeout(p->sysreg, MA35_SYS_USBPMISCR,
+					       val,
+					       (val & USBPMISCR_PHY_HOST_READY(n)) ==
+					       USBPMISCR_PHY_HOST_READY(n),
+					       10, 1000);
+	}
+
+	if (ret) {
+		dev_err(p->dev, "USB PHY%u clock not stable (USBPMISCR=0x%08x)\n",
+			n, val);
 		return ret;
 	}
 
 	return 0;
 }
 
-static int ma35_usb_phy_power_off(struct phy *phy)
+static const struct phy_ops ma35_usb_phy_ops = {
+	.init		= ma35_usb_phy_init,
+	.owner		= THIS_MODULE,
+};
+
+static int ma35_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
+{
+	return -EOPNOTSUPP;
+}
+
+static enum usb_role ma35_role_sw_get(struct usb_role_switch *sw)
+{
+	struct ma35_usb_phy *p = usb_role_switch_get_drvdata(sw);
+	u32 val;
+
+	regmap_read(p->sysreg, MA35_SYS_PWRONOTP, &val);
+
+	return (val & PWRONOTP_USBP0ID) ? USB_ROLE_HOST : USB_ROLE_DEVICE;
+}
+
+static int ma35_role_switch_init(struct platform_device *pdev,
+				 struct ma35_usb_phy *p)
 {
-	struct ma35_usb_phy *p_phy = phy_get_drvdata(phy);
+	struct usb_role_switch_desc sw_desc = {0};
+
+	sw_desc.set = ma35_role_sw_set;
+	sw_desc.get = ma35_role_sw_get;
+	sw_desc.allow_userspace_control = true;
+	sw_desc.driver_data = p;
+	sw_desc.fwnode = dev_fwnode(&pdev->dev);
+
+	p->role_sw = usb_role_switch_register(&pdev->dev, &sw_desc);
+	if (IS_ERR(p->role_sw)) {
+		if (PTR_ERR(p->role_sw) == -ENODEV) {
+			p->role_sw = NULL;
+			return 0;
+		}
+		return dev_err_probe(&pdev->dev, PTR_ERR(p->role_sw),
+				     "failed to register role switch\n");
+	}
 
-	clk_disable_unprepare(p_phy->clk);
 	return 0;
 }
 
-static const struct phy_ops ma35_usb_phy_ops = {
-	.power_on = ma35_usb_phy_power_on,
-	.power_off = ma35_usb_phy_power_off,
-	.owner = THIS_MODULE,
-};
+static void ma35_role_switch_exit(struct ma35_usb_phy *p)
+{
+	if (p->role_sw) {
+		usb_role_switch_unregister(p->role_sw);
+		p->role_sw = NULL;
+	}
+}
+
+static struct phy *ma35_usb_phy_xlate(struct device *dev,
+				      const struct of_phandle_args *args)
+{
+	struct ma35_usb_phy *p = dev_get_drvdata(dev);
+	unsigned int idx;
+
+	if (args->args_count == 0)
+		idx = 0;
+	else
+		idx = args->args[0];
+
+	if (idx >= MA35_PHY_NUM)
+		return ERR_PTR(-EINVAL);
+
+	return p->port[idx].phy;
+}
 
 static int ma35_usb_phy_probe(struct platform_device *pdev)
 {
 	struct phy_provider *provider;
-	struct ma35_usb_phy *p_phy;
-	struct phy *phy;
+	struct ma35_usb_phy *p;
+	struct clk *clk;
+	int n, ret;
+	u32 code;
 
-	p_phy = devm_kzalloc(&pdev->dev, sizeof(*p_phy), GFP_KERNEL);
-	if (!p_phy)
+	p = devm_kzalloc(&pdev->dev, sizeof(*p), GFP_KERNEL);
+	if (!p)
 		return -ENOMEM;
 
-	p_phy->dev = &pdev->dev;
-	platform_set_drvdata(pdev, p_phy);
+	p->dev = &pdev->dev;
+	platform_set_drvdata(pdev, p);
+
+	p->sysreg = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
+						     "nuvoton,sys");
+	if (IS_ERR(p->sysreg))
+		return dev_err_probe(&pdev->dev, PTR_ERR(p->sysreg),
+				     "failed to get SYS regmap\n");
 
-	p_phy->sysreg = syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "nuvoton,sys");
-	if (IS_ERR(p_phy->sysreg))
-		return dev_err_probe(&pdev->dev, PTR_ERR(p_phy->sysreg),
-				     "Failed to get SYS registers\n");
+	clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk),
+				     "failed to get clock\n");
 
-	p_phy->clk = of_clk_get(pdev->dev.of_node, 0);
-	if (IS_ERR(p_phy->clk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(p_phy->clk),
-				     "failed to find usb_phy clock\n");
+	for (n = 0; n < MA35_PHY_NUM; n++) {
+		if (of_property_read_u32_index(pdev->dev.of_node,
+					       "nuvoton,rcalcode", n, &code))
+			continue;
 
-	phy = devm_phy_create(&pdev->dev, NULL, &ma35_usb_phy_ops);
-	if (IS_ERR(phy))
-		return dev_err_probe(&pdev->dev, PTR_ERR(phy), "Failed to create PHY\n");
+		if (code > 15)
+			return dev_err_probe(&pdev->dev, -EINVAL,
+					     "rcalcode[%d] %u out of range (0-15)\n",
+					     n, code);
 
-	phy_set_drvdata(phy, p_phy);
+		regmap_update_bits(p->sysreg, MA35_SYS_USBPMISCR,
+				   USBPMISCR_RCAL_MASK(n),
+				   code << USBPMISCR_RCAL_SHIFT(n));
+	}
+
+	if (of_property_read_bool(pdev->dev.of_node, "nuvoton,oc-active-high"))
+		regmap_update_bits(p->sysreg, MA35_SYS_MISCFCR0,
+				   MISCFCR0_UHOVRCURH, MISCFCR0_UHOVRCURH);
+
+	for (n = 0; n < MA35_PHY_NUM; n++) {
+		p->port[n].idx = n;
+
+		p->port[n].phy = devm_phy_create(&pdev->dev, pdev->dev.of_node,
+						 &ma35_usb_phy_ops);
+		if (IS_ERR(p->port[n].phy))
+			return dev_err_probe(&pdev->dev, PTR_ERR(p->port[n].phy),
+					     "failed to create PHY%d\n", n);
+
+		phy_set_drvdata(p->port[n].phy, &p->port[n]);
+	}
+
+	ret = ma35_role_switch_init(pdev, p);
+	if (ret)
+		return ret;
 
-	provider = devm_of_phy_provider_register(&pdev->dev, of_phy_simple_xlate);
-	if (IS_ERR(provider))
+	provider = devm_of_phy_provider_register(&pdev->dev, ma35_usb_phy_xlate);
+	if (IS_ERR(provider)) {
+		ma35_role_switch_exit(p);
 		return dev_err_probe(&pdev->dev, PTR_ERR(provider),
-				     "Failed to register PHY provider\n");
+				     "failed to register PHY provider\n");
+	}
+
 	return 0;
 }
 
+static void ma35_usb_phy_remove(struct platform_device *pdev)
+{
+	struct ma35_usb_phy *p = platform_get_drvdata(pdev);
+
+	ma35_role_switch_exit(p);
+}
+
 static const struct of_device_id ma35_usb_phy_of_match[] = {
-	{ .compatible = "nuvoton,ma35d1-usb2-phy", },
-	{ },
+	{ .compatible = "nuvoton,ma35d1-usb2-phy" },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ma35_usb_phy_of_match);
 
 static struct platform_driver ma35_usb_phy_driver = {
 	.probe		= ma35_usb_phy_probe,
-	.driver	= {
-		.name	= "ma35d1-usb2-phy",
-		.of_match_table = ma35_usb_phy_of_match,
+	.remove		= ma35_usb_phy_remove,
+	.driver		= {
+		.name		= "ma35d1-usb2-phy",
+		.of_match_table	= ma35_usb_phy_of_match,
 	},
 };
 module_platform_driver(ma35_usb_phy_driver);
 
 MODULE_DESCRIPTION("Nuvoton ma35d1 USB2.0 PHY driver");
 MODULE_AUTHOR("Hui-Ping Chen <hpchen0nvt@gmail.com>");
+MODULE_AUTHOR("Joey Lu <a0987203069@gmail.com>");
 MODULE_LICENSE("GPL");
-- 
2.43.0


