Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABF2FA3753
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 18:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cdsRG53+MfpkA0In14GuBnrMa+IkJh25l65pJ1Sq7UE=; b=Izu8Au9uNP41v9XUHCkOVaWDO8
	/gjw4mJfLvK4ikbza71Hl2qnuSQ5GxWb7g2g9guGFddsYnjgK3Q6I1ADAij2NQPkYvNAnpEbtBjbN
	KiyPicVtUHqN/iw9bt1OybsgIzHhvZT6LANhegdCNM3FxYGYKvO8npJUTebEfY6gk2wLfzPOBJWwy
	48vXO5KhwaNsjycLQY312erBwcE4fDZ/PqeVuX13KbvF1yIt1k8kQYL4Qipj/t2Zb3UzwXEZpwj+u
	ZU8LonyYnnH5bIqMEm/mRcc+WCIkwBJ1ihLMuiUDwEi2oYENY2lnp9u7PLRU3x4h5KUIaT7G0zzO2
	acuZoKxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbjSS-00000008ayV-1ryG;
	Fri, 02 Jan 2026 18:01:04 +0000
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbjSO-00000008awm-21xW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 18:01:01 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1767376840; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=bpkUvJ1ttMvQpswwBTHfb1g1+IGSG1G1uYBaeYVhDax8xrpjukpdkctwD7AwleirGl
    gw2wLa87RhZhhmf/d4DLriAm47LpCKyC2PlM8U9S+lUBiq6AWKUhkIFi/JYvkttZ/GtX
    FanQLOnjGDRPr3VLk8JiPVmqBOASOObdAZdMlgyJhSQgP4mIlygXGh9ow7+KxjTzvJSZ
    kznu3E1cY9LcgIH6N8ZGzSzrVI6ut//S0//z93K4jERT11vRhMNCxH3qAsn1b9UDKzUI
    7NMP1kWhNGdIJ3Grk0s2FWZvdjzygHkmOiQF2qmn8t7xuc9/2uIynrxoaiasO5awR31H
    ++1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1767376840;
    s=strato-dkim-0002; d=strato.com;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=cdsRG53+MfpkA0In14GuBnrMa+IkJh25l65pJ1Sq7UE=;
    b=hBBceFWDbEDhjI2MeL68+hi0xnZm/du88dE2jitPmvy+FiYj9KvT69HzqemU2zHB5o
    S+N9R/DGXiNcmESUk4ViA1eGK7pTMEFGZ9z3cFfJAG8JI36zeAuMhJl/UD8oExKiCYp3
    HwgmL2Ysamf/wp0gHCsC7Aw5DznvHFlxZn6Uvok4HMxC5KezUuhGj0YfgR+2FBegk3ts
    XqZuKJf6+8Wkk+2YDbuHeHjj9+IwaR5X2XBrajMY/RiSVuDcWVTXJ8jRg7cxw+pTWPAf
    B81E4CU3xQN7Ej/vQpXM/OUqIVUjqYtxmcLPlAZKdvmcrlL2vTAMnlvKBhvuZWjCFpua
    Bxtg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1767376840;
    s=strato-dkim-0002; d=jm0.eu;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=cdsRG53+MfpkA0In14GuBnrMa+IkJh25l65pJ1Sq7UE=;
    b=IPmpkBedYXxRP8KaFF3rLMKqs3JXQos4/H7PtJ93KW2TGxhLO+aEJIFxOjW5CYjtYX
    DeWZNK/RtjN/B3RWvPE1LHJKU1EOSKS9IloJoX1F+/w8wZITDrELYybRau2YWPwAWtjX
    epfKOVgpLmoUK0V17pbXsZiM/IkAYmYOSZ5bb65SEwtGrzwUb6H3clp66PWPFwtConyQ
    +r9A6bCcjJl2lmYmeisFRr5ktGTAES1mSETGVfw+Mwy5T6BvkCvg2NKQgaUTNWb66B3G
    JZjkrARJJuNuYQ3R60f+MwbL5XCRXuzi4YwhmB2egAkKeXTXgS8050Id7XYDhn/69J+h
    5ppg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1767376840;
    s=strato-dkim-0003; d=jm0.eu;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=cdsRG53+MfpkA0In14GuBnrMa+IkJh25l65pJ1Sq7UE=;
    b=kgSJBa8g7By62VnqIEP/E6n0X/1/9ueHINHJDd7NlRmzS+AntWr2vMpPEkWMmYKv/L
    RBrUiaQ6tE9hv7W36xCQ==
X-RZG-AUTH: ":JmMXYEHmdv4HaV2cbPh7iS0wbr/uKIfGM0EPTeoCaRth8YQivJ4sfKeu9QyRDNI="
Received: from Wablet.localdomain
    by smtp.strato.de (RZmta 54.1.0 DYNA|AUTH)
    with ESMTPSA id z0d4ec202I0dEUB
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 2 Jan 2026 19:00:39 +0100 (CET)
From: Josua Mayer <josua.mayer@jm0.eu>
Date: Fri, 02 Jan 2026 19:00:32 +0100
Subject: [PATCH 3/4] power: supply: add battery driver for netronix ec
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260102-kobo-aura-battery-v1-3-501f2a8fa575@jm0.eu>
References: <20260102-kobo-aura-battery-v1-0-501f2a8fa575@jm0.eu>
In-Reply-To: <20260102-kobo-aura-battery-v1-0-501f2a8fa575@jm0.eu>
To: =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Lee Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua.mayer@jm0.eu>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_100100_736261_BCDE4385 
X-CRM114-Status: GOOD (  19.25  )
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

Implement a simple battery driver for monitoring voltage with the
netronix embedded controller found in certain ebook readers.

Signed-off-by: Josua Mayer <josua.mayer@jm0.eu>
---
 drivers/power/supply/Kconfig         |   9 ++++
 drivers/power/supply/Makefile        |   1 +
 drivers/power/supply/ntxec-battery.c | 101 +++++++++++++++++++++++++++++++++++
 3 files changed, 111 insertions(+)

diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
index 92f9f7aae92f..0f944c10e50b 100644
--- a/drivers/power/supply/Kconfig
+++ b/drivers/power/supply/Kconfig
@@ -1132,4 +1132,13 @@ config FUEL_GAUGE_MM8013
 	  the state of charge, temperature, cycle count, actual and design
 	  capacity, etc.
 
+config BATTERY_NTXEC
+	tristate "Battery driver for Netronix embedded controller"
+	depends on MFD_NTXEC
+	help
+	  Say yes here to enable netronix ec battery monitoring driver.
+	  It enables the monitoring battery voltage on certain e-book readers
+	  using an embedded controller by ODM Netronix. Battery design
+	  characteristics are read from device-tree if available.
+
 endif # POWER_SUPPLY
diff --git a/drivers/power/supply/Makefile b/drivers/power/supply/Makefile
index 4b79d5abc49a..db6fc815f9da 100644
--- a/drivers/power/supply/Makefile
+++ b/drivers/power/supply/Makefile
@@ -128,3 +128,4 @@ obj-$(CONFIG_CHARGER_SURFACE)	+= surface_charger.o
 obj-$(CONFIG_BATTERY_UG3105)	+= ug3105_battery.o
 obj-$(CONFIG_CHARGER_QCOM_SMB2)	+= qcom_smbx.o
 obj-$(CONFIG_FUEL_GAUGE_MM8013)	+= mm8013.o
+obj-$(CONFIG_BATTERY_NTXEC)	+= ntxec-battery.o
diff --git a/drivers/power/supply/ntxec-battery.c b/drivers/power/supply/ntxec-battery.c
new file mode 100644
index 000000000000..f49f0966d18d
--- /dev/null
+++ b/drivers/power/supply/ntxec-battery.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * The Netronix embedded controller is a microcontroller found in some
+ * e-book readers designed by the original design manufacturer Netronix, Inc.
+ * It contains RTC, battery monitoring, system power management, and PWM
+ * functionality.
+ *
+ * This driver implements battery monitoring.
+ *
+ * Copyright 2021 Josua Mayer <josua.mayer@jm0.eu>
+ */
+
+#include <linux/mfd/ntxec.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/power_supply.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+static const enum power_supply_property ntxec_battery_properties[] = {
+	POWER_SUPPLY_PROP_VOLTAGE_NOW,
+};
+
+struct ntxec_battery {
+	struct ntxec *ec;
+};
+
+#define NTXEC_REG_READ_BATTERY	0x41
+
+static int ntxec_battery_get_property(struct power_supply *psy,
+				     enum power_supply_property psp,
+				     union power_supply_propval *val)
+{
+	struct ntxec_battery *priv = power_supply_get_drvdata(psy);
+	int ret;
+	unsigned int value;
+
+	switch (psp) {
+		case POWER_SUPPLY_PROP_VOLTAGE_NOW:
+			ret = regmap_read(priv->ec->regmap, NTXEC_REG_READ_BATTERY, &value);
+			if (ret < 0)
+				return ret;
+
+			/* ec value to microvolt conversion:
+			 * vendor kernel source suggests linear behaviour from 3V to 4.2V
+			 * with readings 767 to 1023; each increment represents 4687,5uV.
+			 * adjust 3V boundary slightly to report exactly 4.2V when full.
+			 */
+			val->intval = 2999872 + (value - 767) * 4688;
+			break;
+		default:
+			dev_err(&psy->dev, "%s: invalid property %u\n", __func__, psp);
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct power_supply_desc ntxec_battery_desc = {
+	.name = "ec-battery",
+	.type = POWER_SUPPLY_TYPE_BATTERY,
+	.properties = ntxec_battery_properties,
+	.get_property = ntxec_battery_get_property,
+	.num_properties = ARRAY_SIZE(ntxec_battery_properties),
+};
+
+static int ntxec_battery_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct ntxec *ec = dev_get_drvdata(dev->parent);
+	struct power_supply_config psy_cfg = {};
+	struct ntxec_battery *priv;
+	struct power_supply *psy;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->ec = ec;
+	psy_cfg.drv_data = priv;
+	psy_cfg.fwnode = dev_fwnode(dev->parent);
+	psy_cfg.no_wakeup_source = true;
+	psy = devm_power_supply_register(dev, &ntxec_battery_desc, &psy_cfg);
+	if (IS_ERR(psy))
+		return PTR_ERR(psy);
+
+	return 0;
+}
+
+static struct platform_driver ntxec_battery_driver = {
+	.driver = {
+		.name = "ntxec-battery",
+	},
+	.probe = ntxec_battery_probe,
+};
+module_platform_driver(ntxec_battery_driver);
+
+MODULE_AUTHOR("Josua Mayer <josua.mayer@jm0.eu>");
+MODULE_DESCRIPTION("Battery driver for Netronix EC");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:ntxec-battery");

-- 
2.43.0


