Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8F1C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 00:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2oara7myM8nv4Vp4Ck1Jx2wZFy5Eu70Xafs41Za0vYc=; b=E8hFXpvek7Df3ySmMMGjBCocAp
	jeu1TLgKk4xlPk5qLPs9xq97HyFX0dRm7tQzirLH66jBxqk5arGQtHnOTwhro9UY//t0MlyCq8x1v
	rvkwelxnfK99kusGFog2Srw97Nqglz2jL9Ot9cYHjft2bPyteC9u7+BYNbwwUjAloEMX70ygSlU1/
	94AuRRIpO6zlIMe7tGrNVC+BpLZ5gEmgtc3mACpDeHM0/u9kF5mxrFJE1iMHaSVD1Wosswi1nMaG7
	ZpAf7IXAuWv7qRgsSLM7GPg7rzyy68ts/Drp2mtBS3A7XqDEtazWD9ug0QEvNXsaxvqDbQelUHrSQ
	me7+evPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uejlp-00000006EsY-1O2i;
	Thu, 24 Jul 2025 00:25:13 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uejZg-00000006DKL-0jJR;
	Thu, 24 Jul 2025 00:12:41 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-23694cec0feso3810555ad.2;
        Wed, 23 Jul 2025 17:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753315959; x=1753920759; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2oara7myM8nv4Vp4Ck1Jx2wZFy5Eu70Xafs41Za0vYc=;
        b=G09QHmFJ/854pI4g9iGc4k4mhDXOP0TSN2D90RYEEF5FD0B9Jfxke7+Bn4MbJ6yDwU
         Fad5pN/UjH5rx7w3IlpCZTHOlXI/xlHpGp0E5BHQKBjpjhARvDr/XA4sXWySIqWgYwEG
         ro95/W9MAivV0hYfbfDqDuU2gXIGFfIkjdXKjdNyEoyTk14PFoWlWFWbYzzkP7XS4Hgo
         TEFKz+1v341Quzqhl+DFY4cumNUAsBJaNfd2eD5jhsrKH0EeKPrpRGf7ECNxs2EPuc5A
         2amGaxOJygc9iHXtJiZInuboJyI4FdM4IfXZSglYWSujqh1DNxYHehO3ebTPw+mNbJFe
         khFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753315959; x=1753920759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2oara7myM8nv4Vp4Ck1Jx2wZFy5Eu70Xafs41Za0vYc=;
        b=c2FrYPnRYL6PysVlfxqi/8QMAeBzC9oTzQakgXbPmdI2NPogx/n5zvTASAwGMbv8vI
         Gd5XMQTO6P/DOzM4L0+GtfTfWwBN59LTuQpF0lEykn67oK26sOJaoQ0ZWuykj+tswptV
         mYsPwZq1D02xdQODVMGeTY2hE3D4bkxdHfB5SED7WkDK1oTD/Zl/QGMR07WTw2w0woOU
         3KzCjCzqCMD3u6LCe3BiwzmM3N+xBNKBh1Aa+KXnhW5FZ+KW6ybMXZP442gxapz+97g0
         SZ/hMZYgQx7utZIaS9waXq+CGBcVtBp6K/PotoJLI6McxyP1qXm1DAqgjgts9ESx1xQs
         Sipg==
X-Forwarded-Encrypted: i=1; AJvYcCU5GW4QKhUeMHyJ8v985Vg8v3/7Ahbom+54YNx3d+9fhKIlf4KPZTjpgHDkBXR9NwGuR+tJPfF1IezisWBJsdo=@lists.infradead.org, AJvYcCUVyY0u4+khcO4IsUCI3NZliLxgev4EmBXK/gKEC+3izkzx9s/EFkMSycg2qw9kG0jDo+2bKy9LMYqnfpzGsp7u@lists.infradead.org
X-Gm-Message-State: AOJu0Yzbai6BNADd+/7kqL2T4a/VFO/P7bcEMw670wilBBxApCZf7jsn
	LcyWqWnhbScZsweHQbX6ShBk+s4Z7j/XwRK/jDW2I5yWI3VR++UtIzKA
X-Gm-Gg: ASbGncuYgL2Z23+NsC9n6BDdJGESVHjgg1PHULWKZZ8nBdHM3+EXcVjEO2xOfPfl5lf
	aJbispX+8pEV0UVgKR68GtzBkGwxLF2h17YxIpj5a+ql5y+io4kzbZu+99GJouTrEAO2xATyVGz
	h+R/QqzA091JSGtssgT5ZmZhtHfa7yZPc/2r9SVfIrCamxi59cnzvHFfEIvqnn1TnwDHYfqqRWu
	0KsEkDFvr6QRCXnquvYBFV83/CWDZwNVMkAIrQ7GNScsm5yV8kCobbYu5NcqPMeq8zidNjrEzGB
	JUU0j4g3wSzWH899h9P1vdRS8FsNOvjJvQmWHKzQAux1H1QBd3NLWX5WvX843Ni2H7PCAAsXH4u
	Qf9U=
X-Google-Smtp-Source: AGHT+IEKPEUMIZThOFTGx3XGoF+3Xxli9iRvqhEVb711hy9o9eIOm12XPyp/gY6FW3a9xIIs4NgdIQ==
X-Received: by 2002:a17:902:ef02:b0:22e:6cc6:cf77 with SMTP id d9443c01a7336-23f9820349fmr64890305ad.53.1753315959283;
        Wed, 23 Jul 2025 17:12:39 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa476c131sm1872265ad.45.2025.07.23.17.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 17:12:38 -0700 (PDT)
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
Subject: [PATCHv6 wireless-next 4/7] wifi: rt2800: move 2x00soc to 2800soc
Date: Wed, 23 Jul 2025 17:12:29 -0700
Message-ID: <20250724001232.2275-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724001232.2275-1-rosenp@gmail.com>
References: <20250724001232.2275-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_171240_216851_FF9ED273 
X-CRM114-Status: GOOD (  20.96  )
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
Acked-by: Stanislaw Gruszka <stf_xl@wp.pl>
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
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
index a0dc9a751234..4d98b7723c56 100644
--- a/drivers/net/wireless/ralink/rt2x00/Kconfig
+++ b/drivers/net/wireless/ralink/rt2x00/Kconfig
@@ -203,7 +203,6 @@ endif
 config RT2800SOC
 	tristate "Ralink WiSoC support"
 	depends on OF && (SOC_RT288X || SOC_RT305X || SOC_MT7620 || COMPILE_TEST)
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
index 8015089c4a39..4d06f49ec6d2 100644
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
2.50.1


