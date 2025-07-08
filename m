Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F2AC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 20:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqy93qDm+nsA/Mn8c0ouKxjLutoxP/tuRg1tiXEUTCg=; b=Zpj/Z5W+Dw+4lw/q2CaRmte2uO
	idI6Vl8IhixwPLBvK+LegaYkrgNpSJg6K6Ibr9FDDuKfYp1m6RgDPoMBzevk/FLYnj7TGfdN28F2s
	M+mobGNnazOvjApukY1bD9gxisXRUVzPSG8982/nTAoAochd7eMEvcB5H+QlOsDN5ghzTOHklWtzB
	FWC24DAJCSf8QvIXn4zClq5K2I2NAtKJ5y3js5m1lGj5V9chdyCigKze1Od1z2rKITR0h+660/9d0
	mw2PpRjNaIskWqWm8Weg26M4rjlBN151SnHkUoIuLSExyPEj9JH3jLfgwedfVNuyVsahFs43bq6yK
	WdiPfuvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZFFb-00000006Ykx-0SmE;
	Tue, 08 Jul 2025 20:49:15 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZElF-00000006U5Y-3h6A;
	Tue, 08 Jul 2025 20:17:55 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-748e378ba4fso5773989b3a.1;
        Tue, 08 Jul 2025 13:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752005873; x=1752610673; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqy93qDm+nsA/Mn8c0ouKxjLutoxP/tuRg1tiXEUTCg=;
        b=gMgkWCncUwY9gP+7GMFNTmvT6OmDThzH4vz+RXPtpvgsz2ZZ9ryIlxwdq29qHyUr9L
         zyFusEG3W7q+iT4ek0HYCtVucfd7KtHMfAxVb7bcrPn1+De/LyOGAC/dSeJZPSWN3RSM
         8Dcrw67JgfsdE//OswLbblMV6xRBNitOdaEZ3RUaTXDKpb9nDD46JyByGv2JA1xOCo04
         w4q9trMxRoZCwEdLgZUjZGnNRdRGpUyMASAqqKe/Db1XvgM3jqAU9gFImKAa1oC6JB7M
         HaAkJNx/cMYqQUglep4H3IS2CxYLrNXbMe3RRhb0stP2hEc7VhL6hniQg4Qqb0n47lgk
         1yWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752005873; x=1752610673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqy93qDm+nsA/Mn8c0ouKxjLutoxP/tuRg1tiXEUTCg=;
        b=bkjAsZhFYoUv62A7+MkDskf3CUkVPjHnzCpofcIrHmxclOD46JCeTXYFasPEQC5Y7E
         CV4sdo6UAM2GjCjgiw9EOmCvtxz4lOXSThZkCyVo7CwFR8SE9U3wvfrxQwwmZs8uZ8Wd
         djJPGa5oq2rx7LOj5DTEYxKBQdSwhPJrNf7kWhW52DVriWcn6l3cYJw339pXQmOZVl69
         M130CG14X6J6lJrMTpovVsgzGuKtzPIZdA++ypaot5PskJIwSv2As0YuSM6vkQZdFfot
         W8+4e3ut8Ehmmar3D0T6K+a7pu4ArEbPr4/4L/Wx2ffk7oABWdGwz8N/bdgq6qMgoABW
         0x0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVvtPp+ID2mciW2Bi1JcqGCIoZz4l4pJG+JWIrdu0/sjIyYNaQlNAq8I8joNhwOxzK1HwS23EYQF2O9RiMJVG1u@lists.infradead.org, AJvYcCXI9WMF2Wlc9BOPNGDTUjbiZLEq+Z6/H37nYyvYaxGqAl4IBs8Q5nTOzznbI2dY9SbBdTE9KAIaKh7HvMbuZAA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyFRBsTB2qo0Gqhsx/Bge0hdAexlWBNbBRRKdWP/Rs0aJewSRwp
	ekae+PzPKKu03haqGnACldSl7sWmOkX+PX4HsD8xnkYP8z5VVKHoQM/2XFHezGsA1/M=
X-Gm-Gg: ASbGncsaxKvOtNn0Fyn38ZGvODuuH5Ll9yQ2H+rRD6COgY5cTumrdQWmiThnGh50QvW
	IQ8SPQH7IDBjwh0Kd8APffux92RDZB3AgLL1uhfH8C9MdYavaLUR7NPpxq5bxVvlEHez62WwEoo
	OWJg/0yAfYv1BgJlE6T0dzMLEeoV//YNsswKQ1bgBdYuqAyHVt2Ze1vufTz8Bqc5vz1t8dnMTUa
	Ukn3eOzvzC+cNSz62RQRAqzRcxgpVxGgn6qNYVCpPiMo8954xpgXfuidYJ5tYu2xOQNATdP1S6d
	RmOq+PLZFZU0iALsknmikE+SmMR2CSb3izyk9PWDw+E=
X-Google-Smtp-Source: AGHT+IGYqOdrg8modWX5yq3jcxC0oSBAHrTIGU34hvqP9V4WtFdhu3+iwwxBh0+kOmo6ZEjYHZYiig==
X-Received: by 2002:a05:6a00:3d53:b0:736:6043:69f9 with SMTP id d2e1a72fcca58-74e4ac18359mr995807b3a.19.1752005872927;
        Tue, 08 Jul 2025 13:17:52 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee5f5d8csm12289625a12.39.2025.07.08.13.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 13:17:52 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv2 wireless-next 4/7] wifi: rt2800: move 2x00soc to 2800soc
Date: Tue,  8 Jul 2025 13:17:42 -0700
Message-ID: <20250708201745.5900-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708201745.5900-1-rosenp@gmail.com>
References: <20250708201745.5900-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_131753_924627_528155F7 
X-CRM114-Status: GOOD (  21.49  )
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

This driver was written with multiple SOC platforms in mind. However
since Ralink was aquired by Mediatek, it only effectively got used by
older platforms. As such, we can slim down the driver slightly by moving
all of rt2x00soc to rt2800soc in order to benefit from inlining.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/ralink/rt2x00/Kconfig    |   5 -
 drivers/net/wireless/ralink/rt2x00/Makefile   |   1 -
 .../net/wireless/ralink/rt2x00/rt2800soc.c    | 119 +++++++++++++-
 .../net/wireless/ralink/rt2x00/rt2x00soc.c    | 151 ------------------
 .../net/wireless/ralink/rt2x00/rt2x00soc.h    |  29 ----
 5 files changed, 118 insertions(+), 187 deletions(-)
 delete mode 100644 drivers/net/wireless/ralink/rt2x00/rt2x00soc.c
 delete mode 100644 drivers/net/wireless/ralink/rt2x00/rt2x00soc.h

diff --git a/drivers/net/wireless/ralink/rt2x00/Kconfig b/drivers/net/wireless/ralink/rt2x00/Kconfig
index 3a32ceead54f..28530c1fac5c 100644
--- a/drivers/net/wireless/ralink/rt2x00/Kconfig
+++ b/drivers/net/wireless/ralink/rt2x00/Kconfig
@@ -203,7 +203,6 @@ endif
 config RT2800SOC
 	tristate "Ralink WiSoC support"
 	depends on SOC_RT288X || SOC_RT305X || SOC_MT7620 || COMPILE_TEST
-	select RT2X00_LIB_SOC
 	select RT2X00_LIB_MMIO
 	select RT2X00_LIB_CRYPTO
 	select RT2X00_LIB_FIRMWARE
@@ -231,10 +230,6 @@ config RT2X00_LIB_PCI
 	tristate
 	select RT2X00_LIB
 
-config RT2X00_LIB_SOC
-	tristate
-	select RT2X00_LIB
-
 config RT2X00_LIB_USB
 	tristate
 	select RT2X00_LIB
diff --git a/drivers/net/wireless/ralink/rt2x00/Makefile b/drivers/net/wireless/ralink/rt2x00/Makefile
index de030ebcdf6e..48d84d243606 100644
--- a/drivers/net/wireless/ralink/rt2x00/Makefile
+++ b/drivers/net/wireless/ralink/rt2x00/Makefile
@@ -12,7 +12,6 @@ rt2x00lib-$(CONFIG_RT2X00_LIB_LEDS)	+= rt2x00leds.o
 obj-$(CONFIG_RT2X00_LIB)		+= rt2x00lib.o
 obj-$(CONFIG_RT2X00_LIB_MMIO)		+= rt2x00mmio.o
 obj-$(CONFIG_RT2X00_LIB_PCI)		+= rt2x00pci.o
-obj-$(CONFIG_RT2X00_LIB_SOC)		+= rt2x00soc.o
 obj-$(CONFIG_RT2X00_LIB_USB)		+= rt2x00usb.o
 obj-$(CONFIG_RT2800_LIB)		+= rt2800lib.o
 obj-$(CONFIG_RT2800_LIB_MMIO)		+= rt2800mmio.o
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
index db8d01f0cdc3..a19906c35d0a 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
@@ -22,7 +22,6 @@
 
 #include "rt2x00.h"
 #include "rt2x00mmio.h"
-#include "rt2x00soc.h"
 #include "rt2800.h"
 #include "rt2800lib.h"
 #include "rt2800mmio.h"
@@ -131,6 +130,124 @@ static int rt2800soc_write_firmware(struct rt2x00_dev *rt2x00dev,
 	return 0;
 }
 
+static void rt2x00soc_free_reg(struct rt2x00_dev *rt2x00dev)
+{
+	kfree(rt2x00dev->rf);
+	rt2x00dev->rf = NULL;
+
+	kfree(rt2x00dev->eeprom);
+	rt2x00dev->eeprom = NULL;
+
+	iounmap(rt2x00dev->csr.base);
+}
+
+static int rt2x00soc_alloc_reg(struct rt2x00_dev *rt2x00dev)
+{
+	struct platform_device *pdev = to_platform_device(rt2x00dev->dev);
+	struct resource *res;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENODEV;
+
+	rt2x00dev->csr.base = ioremap(res->start, resource_size(res));
+	if (!rt2x00dev->csr.base)
+		return -ENOMEM;
+
+	rt2x00dev->eeprom = kzalloc(rt2x00dev->ops->eeprom_size, GFP_KERNEL);
+	if (!rt2x00dev->eeprom)
+		goto exit;
+
+	rt2x00dev->rf = kzalloc(rt2x00dev->ops->rf_size, GFP_KERNEL);
+	if (!rt2x00dev->rf)
+		goto exit;
+
+	return 0;
+
+exit:
+	rt2x00_probe_err("Failed to allocate registers\n");
+	rt2x00soc_free_reg(rt2x00dev);
+
+	return -ENOMEM;
+}
+
+static int rt2x00soc_probe(struct platform_device *pdev, const struct rt2x00_ops *ops)
+{
+	struct ieee80211_hw *hw;
+	struct rt2x00_dev *rt2x00dev;
+	int retval;
+
+	hw = ieee80211_alloc_hw(sizeof(struct rt2x00_dev), ops->hw);
+	if (!hw) {
+		rt2x00_probe_err("Failed to allocate hardware\n");
+		return -ENOMEM;
+	}
+
+	platform_set_drvdata(pdev, hw);
+
+	rt2x00dev = hw->priv;
+	rt2x00dev->dev = &pdev->dev;
+	rt2x00dev->ops = ops;
+	rt2x00dev->hw = hw;
+	rt2x00dev->irq = platform_get_irq(pdev, 0);
+	rt2x00dev->name = pdev->dev.driver->name;
+
+	rt2x00dev->clk = clk_get(&pdev->dev, NULL);
+	if (IS_ERR(rt2x00dev->clk))
+		rt2x00dev->clk = NULL;
+
+	rt2x00_set_chip_intf(rt2x00dev, RT2X00_CHIP_INTF_SOC);
+
+	retval = rt2x00soc_alloc_reg(rt2x00dev);
+	if (retval)
+		goto exit_free_device;
+
+	retval = rt2x00lib_probe_dev(rt2x00dev);
+	if (retval)
+		goto exit_free_reg;
+
+	return 0;
+
+exit_free_reg:
+	rt2x00soc_free_reg(rt2x00dev);
+
+exit_free_device:
+	ieee80211_free_hw(hw);
+
+	return retval;
+}
+
+static void rt2x00soc_remove(struct platform_device *pdev)
+{
+	struct ieee80211_hw *hw = platform_get_drvdata(pdev);
+	struct rt2x00_dev *rt2x00dev = hw->priv;
+
+	/*
+	 * Free all allocated data.
+	 */
+	rt2x00lib_remove_dev(rt2x00dev);
+	rt2x00soc_free_reg(rt2x00dev);
+	ieee80211_free_hw(hw);
+}
+
+#ifdef CONFIG_PM
+static int rt2x00soc_suspend(struct platform_device *pdev, pm_message_t state)
+{
+	struct ieee80211_hw *hw = platform_get_drvdata(pdev);
+	struct rt2x00_dev *rt2x00dev = hw->priv;
+
+	return rt2x00lib_suspend(rt2x00dev);
+}
+
+static int rt2x00soc_resume(struct platform_device *pdev)
+{
+	struct ieee80211_hw *hw = platform_get_drvdata(pdev);
+	struct rt2x00_dev *rt2x00dev = hw->priv;
+
+	return rt2x00lib_resume(rt2x00dev);
+}
+#endif /* CONFIG_PM */
+
 static const struct ieee80211_ops rt2800soc_mac80211_ops = {
 	.add_chanctx = ieee80211_emulate_add_chanctx,
 	.remove_chanctx = ieee80211_emulate_remove_chanctx,
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00soc.c b/drivers/net/wireless/ralink/rt2x00/rt2x00soc.c
deleted file mode 100644
index f7f3a2340c39..000000000000
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00soc.c
+++ /dev/null
@@ -1,151 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
-	Copyright (C) 2004 - 2009 Ivo van Doorn <IvDoorn@gmail.com>
-	Copyright (C) 2004 - 2009 Felix Fietkau <nbd@openwrt.org>
-	<http://rt2x00.serialmonkey.com>
-
- */
-
-/*
-	Module: rt2x00soc
-	Abstract: rt2x00 generic soc device routines.
- */
-
-#include <linux/bug.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
-
-#include "rt2x00.h"
-#include "rt2x00soc.h"
-
-static void rt2x00soc_free_reg(struct rt2x00_dev *rt2x00dev)
-{
-	kfree(rt2x00dev->rf);
-	rt2x00dev->rf = NULL;
-
-	kfree(rt2x00dev->eeprom);
-	rt2x00dev->eeprom = NULL;
-
-	iounmap(rt2x00dev->csr.base);
-}
-
-static int rt2x00soc_alloc_reg(struct rt2x00_dev *rt2x00dev)
-{
-	struct platform_device *pdev = to_platform_device(rt2x00dev->dev);
-	struct resource *res;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENODEV;
-
-	rt2x00dev->csr.base = ioremap(res->start, resource_size(res));
-	if (!rt2x00dev->csr.base)
-		return -ENOMEM;
-
-	rt2x00dev->eeprom = kzalloc(rt2x00dev->ops->eeprom_size, GFP_KERNEL);
-	if (!rt2x00dev->eeprom)
-		goto exit;
-
-	rt2x00dev->rf = kzalloc(rt2x00dev->ops->rf_size, GFP_KERNEL);
-	if (!rt2x00dev->rf)
-		goto exit;
-
-	return 0;
-
-exit:
-	rt2x00_probe_err("Failed to allocate registers\n");
-	rt2x00soc_free_reg(rt2x00dev);
-
-	return -ENOMEM;
-}
-
-int rt2x00soc_probe(struct platform_device *pdev, const struct rt2x00_ops *ops)
-{
-	struct ieee80211_hw *hw;
-	struct rt2x00_dev *rt2x00dev;
-	int retval;
-
-	hw = ieee80211_alloc_hw(sizeof(struct rt2x00_dev), ops->hw);
-	if (!hw) {
-		rt2x00_probe_err("Failed to allocate hardware\n");
-		return -ENOMEM;
-	}
-
-	platform_set_drvdata(pdev, hw);
-
-	rt2x00dev = hw->priv;
-	rt2x00dev->dev = &pdev->dev;
-	rt2x00dev->ops = ops;
-	rt2x00dev->hw = hw;
-	rt2x00dev->irq = platform_get_irq(pdev, 0);
-	rt2x00dev->name = pdev->dev.driver->name;
-
-	rt2x00dev->clk = clk_get(&pdev->dev, NULL);
-	if (IS_ERR(rt2x00dev->clk))
-		rt2x00dev->clk = NULL;
-
-	rt2x00_set_chip_intf(rt2x00dev, RT2X00_CHIP_INTF_SOC);
-
-	retval = rt2x00soc_alloc_reg(rt2x00dev);
-	if (retval)
-		goto exit_free_device;
-
-	retval = rt2x00lib_probe_dev(rt2x00dev);
-	if (retval)
-		goto exit_free_reg;
-
-	return 0;
-
-exit_free_reg:
-	rt2x00soc_free_reg(rt2x00dev);
-
-exit_free_device:
-	ieee80211_free_hw(hw);
-
-	return retval;
-}
-EXPORT_SYMBOL_GPL(rt2x00soc_probe);
-
-void rt2x00soc_remove(struct platform_device *pdev)
-{
-	struct ieee80211_hw *hw = platform_get_drvdata(pdev);
-	struct rt2x00_dev *rt2x00dev = hw->priv;
-
-	/*
-	 * Free all allocated data.
-	 */
-	rt2x00lib_remove_dev(rt2x00dev);
-	rt2x00soc_free_reg(rt2x00dev);
-	ieee80211_free_hw(hw);
-}
-EXPORT_SYMBOL_GPL(rt2x00soc_remove);
-
-#ifdef CONFIG_PM
-int rt2x00soc_suspend(struct platform_device *pdev, pm_message_t state)
-{
-	struct ieee80211_hw *hw = platform_get_drvdata(pdev);
-	struct rt2x00_dev *rt2x00dev = hw->priv;
-
-	return rt2x00lib_suspend(rt2x00dev);
-}
-EXPORT_SYMBOL_GPL(rt2x00soc_suspend);
-
-int rt2x00soc_resume(struct platform_device *pdev)
-{
-	struct ieee80211_hw *hw = platform_get_drvdata(pdev);
-	struct rt2x00_dev *rt2x00dev = hw->priv;
-
-	return rt2x00lib_resume(rt2x00dev);
-}
-EXPORT_SYMBOL_GPL(rt2x00soc_resume);
-#endif /* CONFIG_PM */
-
-/*
- * rt2x00soc module information.
- */
-MODULE_AUTHOR(DRV_PROJECT);
-MODULE_VERSION(DRV_VERSION);
-MODULE_DESCRIPTION("rt2x00 soc library");
-MODULE_LICENSE("GPL");
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00soc.h b/drivers/net/wireless/ralink/rt2x00/rt2x00soc.h
deleted file mode 100644
index d6226b8a10e0..000000000000
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00soc.h
+++ /dev/null
@@ -1,29 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
-	Copyright (C) 2004 - 2009 Ivo van Doorn <IvDoorn@gmail.com>
-	<http://rt2x00.serialmonkey.com>
-
- */
-
-/*
-	Module: rt2x00soc
-	Abstract: Data structures for the rt2x00soc module.
- */
-
-#ifndef RT2X00SOC_H
-#define RT2X00SOC_H
-
-/*
- * SoC driver handlers.
- */
-int rt2x00soc_probe(struct platform_device *pdev, const struct rt2x00_ops *ops);
-void rt2x00soc_remove(struct platform_device *pdev);
-#ifdef CONFIG_PM
-int rt2x00soc_suspend(struct platform_device *pdev, pm_message_t state);
-int rt2x00soc_resume(struct platform_device *pdev);
-#else
-#define rt2x00soc_suspend	NULL
-#define rt2x00soc_resume	NULL
-#endif /* CONFIG_PM */
-
-#endif /* RT2X00SOC_H */
-- 
2.50.0


