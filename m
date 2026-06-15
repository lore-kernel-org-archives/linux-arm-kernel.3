Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A53CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 05:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqLmOEHzO9b3obVkT8LXv4MKOicfgU7dyQguJRSQB8g=; b=I7MQEadqLVTSbVyIAiXdE8DyrS
	OYj/nrGkDPchiM4g7wPUUEhfP03lVD2pt0y8Sk3j2mJ2jIQZAr3XUN/SpZ2S07Av61UodiuFk/AF6
	QZYEzmpTrdFdrC4pFFsEQJKe2ZE8DIjsHIg2Mru1udKG5b8Vyn4zSkBhLi+qA/9f/vLHgtgHz2Vqk
	q+XED8BP60OGpYx0DBC3NsbeyH9jVCFwRKkWkYNfj06Wfg+Iu/+Ik0Zaf6TdkHpreMC8o4IuFmoPg
	ejonWd5AOjfCTqdB3V2ufvfji+tiz3P5y3pHL1qsmuroYu6Wa1buoOl1xNLt7l0ukaT5tRc/Z4+Uu
	a02wB8vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ0CU-0000000De4N-0FYS;
	Mon, 15 Jun 2026 05:49:34 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ0CQ-0000000De24-2EFW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 05:49:31 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-304df7ff4c2so2248202eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 22:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781502569; x=1782107369; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mqLmOEHzO9b3obVkT8LXv4MKOicfgU7dyQguJRSQB8g=;
        b=rs+PsTepH8iJOFIbIQ1QiXcBuy3FqiJIIra2WVSMLgM0hWpgJqfFTIf4pRVNHtsXa4
         FCXltlgmK8Dqx66aD5nQK8FY7eW79Xzg/CJXlzCF9wq+NwUphUhS32GjgALPLb546Ohv
         M3eTel3D79TspSNB0YoS7OFYuaCUjBalH7Jgn1S+rij5RH9hFZqxWsIxYaqJoQdPPY5u
         p3oTmFtJryWwq7vBDeG4J0kXinZH+Ff1yqXdEEuUHZ3iW781CeQFkNnKD33FrFrUxKD8
         OpNyFSlzqhC/KL3vB1tlaAEzmor8MlETWkmYk5Wk5i0iIeLKXAyS80nNPvEFeZsaKJiJ
         S6BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781502569; x=1782107369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mqLmOEHzO9b3obVkT8LXv4MKOicfgU7dyQguJRSQB8g=;
        b=OWJxwJnv3W4fwtbTKWe0QH9KXFJnhb7yDT8+mUq0yKB3yluya1S8r4PfoqEamQd6QY
         CrEc/ONj3UqnhQ3t9boGRbpNfeDv9F2bCT2R2pBufwZxpAoL8J5GI6iTiZafElKKFi6h
         6urFGw0pCngJ3IL01QCI/EI0CxHNc1JjY2VmTNVNZ/D9G+Osh9U4L6EzuIiS8T2ZZU79
         HdxthFbzwY6XzZ7Y3SSSo0DS0uvGWoLw9uScHd3dq4VumTfCLNlfD/b7PA8670OdxB4S
         gvYqf1ICd/ze//7oCXwIpEdKkEYpjr9suL0De9exF90acL+Gzlg+qbHE9KumFZHd/lxE
         6v2w==
X-Forwarded-Encrypted: i=1; AFNElJ8vxB5IH6YGonCoQK9njdTeX9jQ3D0aiRQsRXfqwLjMQBfUxiHxARPQrr7FvtClTfkN67YccZ3oLMcdEVhikm2x@lists.infradead.org
X-Gm-Message-State: AOJu0YzIjeiVf59uXJy3zj0jzwRWFXUB+dOIlO5SnGsXNyMdTWHrypJn
	Sp0o0FSXW3XmRMWj/n6JYKEkn0GHk2somu8UO8MUcToik8Qgpo+Pa9cy
X-Gm-Gg: Acq92OGCBjTDg/frx+OcU6HHR0i0A6og2QTJFAPsULo2Tjqa+HP2aBzrmHkQdFHyWX7
	RNfXCA7y9vmQCUXb/dO67EQfNcgl1OfqRH+ou207im9hw9skBCywze+UI/laY1ndxQePR1MTOCE
	HBB6LE4CP8xXliNYG38rUIx/62Hbl0IsSuHKTh9+tkODRth5/fJdcOf5CDkgjcrVLS4ZLovB/Wc
	w6vxlgZExVJFywZUv4sm2w3or5D9u5apOeFp3bYPZZDygGTXGiqNpiYKgC2E2lEtTvtnZJvQrLc
	IyqDbRIiK/cl9JyXUXWmdo+f/3D8q7L/LOdPM41SNgQ7meCOeZgQRMSR8JCYZeEuTityMAqEiPU
	q1Z4rbSHiP8Lna7ADM09/6owiQqcXrl7z/cva36NZ/3iraiokwYhLjAtwqQT9V58wtad3m332Ni
	pO9+anhvOBMvpnAMoayohoUyvzA88yyqElddxxCoURlsS+cB6rvuwHpQncglE4PlqjJ4DCc0D7l
	s/srybFARJtVuHtl2+aeQ4=
X-Received: by 2002:a05:7300:fd18:b0:304:ddc3:2c35 with SMTP id 5a478bee46e88-30820cc39d0mr5584490eec.10.1781502569070;
        Sun, 14 Jun 2026 22:49:29 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081ddaf69asm14295300eec.0.2026.06.14.22.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 22:49:28 -0700 (PDT)
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
Subject: [PATCH 3/3] phy: nuvoton: phy-ma35d1-usb2: extend to dual-port with OTG support
Date: Mon, 15 Jun 2026 13:49:11 +0800
Message-ID: <20260615054911.48821-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615054911.48821-1-a0987203069@gmail.com>
References: <20260615054911.48821-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_224930_585283_EFBEB0B2 
X-CRM114-Status: GOOD (  27.08  )
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

The existing driver handled only PHY0 in device mode (DWC2 gadget).
Extend it to manage both PHY ports and integrate OTG support, per
reviewer suggestion to reuse the existing driver rather than add a
separate one.

The MA35D1 SoC has two USB PHY ports:

  - PHY0 (USB0): OTG port shared between the DWC2 gadget controller
    and EHCI0/OHCI0 host controllers.  A hardware mux in the SoC
    automatically routes the USB0 signals to the appropriate
    controller based on the USB ID pin state.

  - PHY1 (USB1): dedicated host-only port for EHCI1/OHCI1.

Key changes:

  Dual-port support
    A loop in probe() creates two struct phy objects, one per port,
    each with its own phy_set_drvdata() context.  A custom xlate
    function selects the correct phy by the single #phy-cells argument.

  Unified .init callback
    A single ma35_usb_phy_init() handles both ports using parametric
    register macros (USBPMISCR_PHY_*(n)).  If the SUSPEND bit is
    already set the init is skipped entirely, preventing the shared
    PHY0 from being reset while a live link is active.  On cold boot,
    PHY0 polls for either host-mode clocks (HSTCKSTB + CK12MSTB) or
    device-mode clock (DEVCKSTB) since the hardware selects the role
    automatically; PHY1 polls for host-mode clocks only.

  Clock management removed
    .power_on/.power_off and all struct clk handling are removed.
    Each USB controller (DWC2, EHCI, OHCI) already gates its own
    clock directly through its DTS clocks binding.  Having the PHY
    driver redundantly enable the same gates added unnecessary
    coupling without benefit.

  OTG role switch for PHY0
    A read-only USB role switch is registered, reporting the current
    OTG role by reading the USB ID pin state from PWRONOTP[16].
    .set returns -EOPNOTSUPP since the hardware mux is fully
    automatic.  allow_userspace_control is kept true to preserve the
    sysfs attribute for observation; writes are rejected by .set.

  syscon regmap via parent
    The driver obtains the regmap by calling
    syscon_node_to_regmap(pdev->dev.parent->of_node), removing the
    need for the nuvoton,sys phandle.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/phy/nuvoton/phy-ma35d1-usb2.c | 263 ++++++++++++++++++--------
 1 file changed, 189 insertions(+), 74 deletions(-)

diff --git a/drivers/phy/nuvoton/phy-ma35d1-usb2.c b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
index 9a459b700ed4..336680161104 100644
--- a/drivers/phy/nuvoton/phy-ma35d1-usb2.c
+++ b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
@@ -1,11 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (C) 2024 Nuvoton Technology Corp.
+ * Nuvoton MA35D1 USB 2.0 PHY driver
+ *
+ * Supports PHY0 (USB0 OTG port, shared between DWC2 gadget and EHCI0/OHCI0)
+ * and PHY1 (USB1 host-only port, used by EHCI1/OHCI1).  The hardware mux on
+ * PHY0 switches automatically via the USB ID pin.
+ *
+ * Copyright (C) 2026 Nuvoton Technology Corp.
  */
 #include <linux/bitfield.h>
-#include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
@@ -13,131 +17,242 @@
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
+#define PWRONOTP_USBP0ID		BIT(16)	/* USB0 ID pin state */
+
+#define MA35_SYS_USBPMISCR		0x60
+#define USBPMISCR_PHY_POR(n)		BIT(0  + (n) * 16)
+#define USBPMISCR_PHY_SUSPEND(n)	BIT(1  + (n) * 16)
+#define USBPMISCR_PHY_COMN(n)		BIT(2  + (n) * 16)
+#define USBPMISCR_PHY_HSTCKSTB(n)	BIT(8  + (n) * 16)
+#define USBPMISCR_PHY_CK12MSTB(n)	BIT(9  + (n) * 16)
+#define USBPMISCR_PHY_DEVCKSTB(n)	BIT(10 + (n) * 16)
+/* Mask for control bits (POR, SUSPEND, COMN) of one PHY */
+#define USBPMISCR_PHY_CTL_MASK(n)	(0x7u << ((n) * 16))
+/* Host-mode ready: SUSPEND set */
+#define USBPMISCR_PHY_HOST_READY(n)	(USBPMISCR_PHY_SUSPEND(n)  | \
+					 USBPMISCR_PHY_HSTCKSTB(n) | \
+					 USBPMISCR_PHY_CK12MSTB(n))
+/* Device-mode ready: SUSPEND set */
+#define USBPMISCR_PHY_DEV_READY(n)	(USBPMISCR_PHY_SUSPEND(n)  | \
+					 USBPMISCR_PHY_DEVCKSTB(n))
+/* RCALCODE: 4-bit resistor trim at bits [15:12] (PHY0) or [31:28] (PHY1) */
+#define USBPMISCR_RCAL_SHIFT(n)		(12 + (n) * 16)
+#define USBPMISCR_RCAL_MASK(n)		GENMASK(USBPMISCR_RCAL_SHIFT(n) + 3, \
+						USBPMISCR_RCAL_SHIFT(n))
+
+#define MA35_SYS_MISCFCR0		0x70
+/* Bit 12: USB host over-current detect polarity (shared, both ports) */
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
+	if (IS_ERR(p->role_sw))
+		return dev_err_probe(&pdev->dev, PTR_ERR(p->role_sw),
+				     "failed to register role switch\n");
 
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
+
+	if (args->args[0] >= MA35_PHY_NUM)
+		return ERR_PTR(-EINVAL);
+
+	return p->port[args->args[0]].phy;
+}
 
 static int ma35_usb_phy_probe(struct platform_device *pdev)
 {
 	struct phy_provider *provider;
-	struct ma35_usb_phy *p_phy;
-	struct phy *phy;
+	struct ma35_usb_phy *p;
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
+	p->sysreg = syscon_node_to_regmap(pdev->dev.parent->of_node);
+	if (IS_ERR(p->sysreg))
+		return dev_err_probe(&pdev->dev, PTR_ERR(p->sysreg),
+				     "failed to get parent SYS regmap\n");
 
-	p_phy->sysreg = syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "nuvoton,sys");
-	if (IS_ERR(p_phy->sysreg))
-		return dev_err_probe(&pdev->dev, PTR_ERR(p_phy->sysreg),
-				     "Failed to get SYS registers\n");
+	for (n = 0; n < MA35_PHY_NUM; n++) {
+		if (of_property_read_u32_index(pdev->dev.of_node,
+					       "nuvoton,rcalcode", n, &code))
+			continue;
 
-	p_phy->clk = of_clk_get(pdev->dev.of_node, 0);
-	if (IS_ERR(p_phy->clk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(p_phy->clk),
-				     "failed to find usb_phy clock\n");
+		if (code > 15)
+			return dev_err_probe(&pdev->dev, -EINVAL,
+					     "rcalcode[%d] %u out of range (0-15)\n",
+					     n, code);
 
-	phy = devm_phy_create(&pdev->dev, NULL, &ma35_usb_phy_ops);
-	if (IS_ERR(phy))
-		return dev_err_probe(&pdev->dev, PTR_ERR(phy), "Failed to create PHY\n");
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
 
-	phy_set_drvdata(phy, p_phy);
+	ret = ma35_role_switch_init(pdev, p);
+	if (ret)
+		return ret;
 
-	provider = devm_of_phy_provider_register(&pdev->dev, of_phy_simple_xlate);
+	provider = devm_of_phy_provider_register(&pdev->dev, ma35_usb_phy_xlate);
 	if (IS_ERR(provider))
 		return dev_err_probe(&pdev->dev, PTR_ERR(provider),
-				     "Failed to register PHY provider\n");
+				     "failed to register PHY provider\n");
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


