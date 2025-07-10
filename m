Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72294C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 22:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SucvbX7V2pEE0KBr9pkRROL7F7h/88OMsOWVW0teiP4=; b=l3MgVNS6YhxTub2rbPcRU2Kpxq
	nvCaOwcRiYfElyAzpTrmhgIX72DbxNHYGULJsfXKurhg8pDdiA/8I717FzzG6aoIGbyy5eSVPRxmp
	+/vL+xbKgjU+40iBFXMlycAdwpeQRNw+x1++wJLov+7RX7qZ/aB6S4Iinev5S5a9ZUiBDY+S6aAUI
	gbyr3r00vm7/9BpVUoWTtdc26Yxj+q/KFQPFgtjWmUIOkLsnQUHqr8cdcbpAcPRedciDOot6+TjNf
	Kx/MsUATRzk/w7NTTOpEz8tBKfGm6pfzk5EChL4GDRczBGZv4/rE/+Xv8AwFzKLdibbaQxIWB8M+3
	2WHwh+ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua080-0000000DCgU-1QGr;
	Thu, 10 Jul 2025 22:52:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxZI-0000000CtAp-0hJV;
	Thu, 10 Jul 2025 20:08:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=SucvbX7V2pEE0KBr9pkRROL7F7h/88OMsOWVW0teiP4=; b=iS4KCe0Zs4hhVnQveQ4aUGK4d8
	RDw5l5+WlTGrqOb7d2FAQ6/8Ujp/hHtYqCzNdVL+HLFWfMAYu6fvs1Vo9J4lta+ZAA0jp951mwUGB
	VLS59feeBHcW+mTyOvLBhr2bEY2hFcHTIvD9e9n1CjVqUCPwqKWg7o3DGd/DbbWMkRsythmNKNYJF
	pwsBnvBk2wSxdkRK3EWGGZWTFsnhR5T4yzSfwBntJZQ3+XzsIXoBYwPiTj7EmsnJuqy4DsmhrBK9X
	gRcSzrurrRDGtzW/8YSdppWp7FhF+QT09Cif6rP65jd+fHpRcl2Csc8tkS0UvJ2oD1R2rxq72GjEh
	4zuHDo+Q==;
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxZE-000000098yL-3mKd;
	Thu, 10 Jul 2025 20:08:31 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-73c17c770a7so1878718b3a.2;
        Thu, 10 Jul 2025 13:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752178107; x=1752782907; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SucvbX7V2pEE0KBr9pkRROL7F7h/88OMsOWVW0teiP4=;
        b=J30r2fjWsRtRroc7TGUttjTbuuZnxciuqpWPbRjfwDyFR0v0eHYV2axaRYdYkQrGm6
         Bx76AjjcxS2TJg3iuP1HS40oTnw2vI/FmXCyPvoGYgzloHcopyVUi+bTxr/3PC1JHHa/
         ZfQ0YuBVm9nLz82vrCfIPg/QyxEjx/tB5SGIdJuADARjd/MfZIq7F+HH2Kik3xSQsUQp
         Zc7cnd+INXTs3UwodUk5SdWisRt1/cFG5t+NBu5tFF/VK7j3exC+x1soAHX9PvbrRJKp
         rlU4k5ZaWUXLPyyXb8sf9oWYSKINqsGUCYisilqjbNR+u5fhM2U2lGbQmDG6jmYq5tIz
         Ssaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752178107; x=1752782907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SucvbX7V2pEE0KBr9pkRROL7F7h/88OMsOWVW0teiP4=;
        b=g+D+Y0eSk24Hflys0M3FENo+LE36eMAW4lsyUrir4PfMr0MKHpBLf6C/02DhkfJnM8
         8l9JPODMH/fDdFigL7NGO0qiyoc2w/4x7WS7vLvw+gWrBNOonNJM0RXFBzZkRzWnylzx
         5uXRB6TFnXPuLM2wB8yr8FI0if8nuG5jiAmRKTuafd/6t/WRc5TXsNjYNoX1BVDfJWv3
         jm6KyVjseBPl7xKAlkoefmo7mLRRk4pu34O4pqqgb8XC/cHXZPY04kE1Qa+VfI/RTqvr
         aL7fQhWDaLv0xOsB7RBvxBFcNig/7lFHDRtkyQ7yJR9pkc+xs3faaS5gvrXtRTN2CDHf
         di7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWHLnFdT5K7Q3M7Pr/BFjct73CBEIT9jJsICABFBwA7AR6e3/3iCy8HW1lNicieZTTOAuCWqZdgUQBjEdmGc6Q=@lists.infradead.org, AJvYcCXuaqhi4o9nDCBpAGbVcH/Fsw3WYqRqYev3DppyGm4BGuhrn8NiwcES1tkozihlynppW0CDvBQjN/9/f9eNTjQT@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1xCUjMk3B7gJiTeoqODfMOEkSgXfLl2B/t7TvXD9/t0D8RpeS
	ucUurlg32oUWZblkZTQr5yBGnQzfj5aoowAkHM3jKgJ4nhVsa0Ow5nV3
X-Gm-Gg: ASbGncts/SeVcQHd1MVSgq4h6IZseGzhsWXSEADyRFsuLrUkvNkhByJ9hY2qXELdka6
	TTxQm3QzJgnC2IRsufOzvepjkj7l/kIux8ohYeXkofwa44EQoRFX4+s2UfceJ/kuZuioPlnkfXX
	y3qsB8E/zD6L1CfGDZBipeVkPbQYaPsuIuVtdpp3/RonNDQt6oOD0Nazjy66DItV/P1Jl7SihJ3
	nJqp1sRrSNIZ+kB+qJ56UJV78S4iZyNYwgIZacNSf52ggWzlw1Ybk4frsC4i2eT2lZlmquXrY/t
	P5qPpzN7B0dnFbEIotOBFugvp33h3famgtdVZ9LyJEs=
X-Google-Smtp-Source: AGHT+IGzltVPG6v737yVxcn1OOATgggO1wpQnPVQueIdozqaVYvOu4BC08JXO33LVZziHbIXS7BKzw==
X-Received: by 2002:a05:6a21:6da4:b0:21a:da01:e0cf with SMTP id adf61e73a8af0-23137e8e69bmr556789637.22.1752178107010;
        Thu, 10 Jul 2025 13:08:27 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f1b29asm2729453b3a.87.2025.07.10.13.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 13:08:26 -0700 (PDT)
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
Subject: [PATCHv3 wireless-next 4/7] wifi: rt2800: move 2x00soc to 2800soc
Date: Thu, 10 Jul 2025 13:08:17 -0700
Message-ID: <20250710200820.262295-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250710200820.262295-1-rosenp@gmail.com>
References: <20250710200820.262295-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_210829_249452_B2F7D189 
X-CRM114-Status: GOOD (  21.03  )
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


