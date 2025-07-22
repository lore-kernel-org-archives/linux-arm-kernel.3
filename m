Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29C2C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 21:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hPV81AlONYtTEX391sJmYZIjF/VDHDvhGEKKxh4sMlY=; b=x82OR8GZBQxKt60jAjDpc/b4Wm
	zqJJWDrQTGOq+8S7TSrGGrB1DclDaEDdNjjZnpmAwuvqHza+LpZfc81xPdzLblyMbcGajV17AdDg3
	v3qYpuFc0yfeNUHc/PO2o4rq5iugABRn1HWMYv5cnvYG9oKsZZS98X76s/vP1ebnvcUDo+ePV2NvP
	hKSPxipfPepAC2UHKWck8ttfCs4oNvmIhD9EFt2/h5HkjMGBDP48cpl2VgrOBYTbdOGRBsPaBRgxz
	zSr4/JcKWSSTHuSlFrOCecZUspPTgIuIuxZmmVmhVoOVacg/DH+NP+L06PbrFqKWxabkTePtRDgTl
	Nn+xDrTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueKmd-00000003XK4-3diN;
	Tue, 22 Jul 2025 21:44:23 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueKXq-00000003Vpn-2RZ1;
	Tue, 22 Jul 2025 21:29:08 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-311e2cc157bso5126602a91.2;
        Tue, 22 Jul 2025 14:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753219746; x=1753824546; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPV81AlONYtTEX391sJmYZIjF/VDHDvhGEKKxh4sMlY=;
        b=H9F5MhUhcsCgGgNyrxuLTxIZm0SI5VK8abOZw6mFoDMG2/iCEWbs27RdEwH/vFkzUT
         DJWfTMUB1+AHMxH7LKFk276fLj2L1VVI0Il7j5AajMVs/x/eAHYBgDqM8TWjSW6fw69M
         wEJlbr6YdlamLRUIkFHwblY3nYKKDpHT9EZRNSpl0DIROCKpyyQ4eqL9GLI7waljOVvI
         wjEm6F88kglB89vC3icogvKnRpwQI1DvU0O3+y0OW49ozLTy0RDBpEnc7O36HrO/rHaF
         8YvfVgkGKB1MVUcL7Wy134pgiKZjdzIZZ5jOuD8ZRuKElBM3qJmCP5+I0er4ZVdd6S/I
         86cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753219746; x=1753824546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hPV81AlONYtTEX391sJmYZIjF/VDHDvhGEKKxh4sMlY=;
        b=D49Z0Pfa48SZP/SJ44bAFQ/x1d1i0fTUehB91AveCP3inRz4tPZbN0ibCDJNCdvifd
         QrFMyUZMZB5vL4260wPBjtvINrE1XT8qZuiZRYIAVjqhd7yeqabEk9YZ+5AcHqMlyaif
         IgT8NA0NuqRnTFCt74P1bxS5AqUOt7oao02ltLpPen6bP4j48HbE+omtmZsSZqM1qVrO
         1xKbOghodv8h6mZ46Cfk1wiES97Lgy/aF9sjNlAa5IlMY0NQsCT/S+qViZWxDZOQiPts
         O5dtefY0dM7w0VdgqJNvBWSIyvva/EVpfp0Etc21bn6Pd7ju2Wdd7bNfk7ImXQusuuM4
         mdsA==
X-Forwarded-Encrypted: i=1; AJvYcCUf6nY2yh+GhnmDBalkZ13wKCvS8wFsgOBxTUQJ35v5wNTfY1pzCREHgIRN0v5SHmaUMZznlUPpDtSbyR/1UQQ=@lists.infradead.org, AJvYcCXfE2guONydT3NhOTFWavk6k3zV0BFd3pFaRVq/yB1gYuUvrWJXv86vEUT0mHm3Ol64tdi7MoYANKNp5YMk0j4U@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5dp3QmMbC/EXEQgXDMp6nY3B7b7OPCLmQPSNO1/WSRyjLIjT0
	g7CdVNT3WpkSiGcjspgAmOMKgXcEngah/ILo0ySGX04bdL7qM7XNyDZz
X-Gm-Gg: ASbGncvaGujukxiSbYyR5f4bBI2Vb0/8ccRKrqpnlg+Y3Rg29xLggj/sbIfTqAZGMul
	8pDDF8/PIgiqhzYMCdW12XTbRbo4VQKW7HQYJEKR2KLuKUls+S55WOu+FGPu6/XO8jF5XcXoozr
	gvuWlRa6HIbyP4jU6aI/bRe1iv2pya80TMTxM82oFG5thWAhnDfEa/bptR8h5bnAEL6skg+lgWX
	SQN0Q/MrBxGykbfSWf7SaoBWjZmffJm0Bjr+km80UkJ1PBaIGRy7zfbo1WmctxNpcTbTqnFzL4e
	3ZXCQ2pXiXsHAfMtDAKVCRpZU5/8XF9iQhHGtVpJpSnw5F3/ZCLUw8fGDIWGR51nb1kUOsZn90I
	eddE=
X-Google-Smtp-Source: AGHT+IFrXERZmxVR5cGpCCvdM73eimb0RuQ25NqpOVWFg7vgN1A2Wg3f1NmQlNRve33bigcGv+d1/w==
X-Received: by 2002:a17:90b:254d:b0:313:f6fa:5bc6 with SMTP id 98e67ed59e1d1-31e507c491cmr1239853a91.20.1753219746011;
        Tue, 22 Jul 2025 14:29:06 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e519ce384sm94942a91.2.2025.07.22.14.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 14:29:05 -0700 (PDT)
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
Subject: [PATCHv5 wireless-next 5/7] wifi: rt2x00: soc: modernize probe
Date: Tue, 22 Jul 2025 14:28:54 -0700
Message-ID: <20250722212856.11343-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250722212856.11343-1-rosenp@gmail.com>
References: <20250722212856.11343-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_142906_622415_CB911324 
X-CRM114-Status: GOOD (  19.50  )
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

Remove a bunch of static memory management functions and simplify with
devm.

Also move allocation before ieee80211_alloc_hw to get rid of goto
statements and clarify the error handling a bit more.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Acked-by: Stanislaw Gruszka <stf_xl@wp.pl>
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../net/wireless/ralink/rt2x00/rt2800soc.c    | 187 ++++++++----------
 1 file changed, 82 insertions(+), 105 deletions(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
index 4d06f49ec6d2..8f510a84e7f1 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
@@ -18,6 +18,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 
 #include "rt2x00.h"
@@ -130,108 +131,8 @@ static int rt2800soc_write_firmware(struct rt2x00_dev *rt2x00dev,
 	return 0;
 }
 
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
-static int rt2x00soc_probe(struct platform_device *pdev, const struct rt2x00_ops *ops)
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
-
-static void rt2x00soc_remove(struct platform_device *pdev)
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
-
 #ifdef CONFIG_PM
-static int rt2x00soc_suspend(struct platform_device *pdev, pm_message_t state)
+static int rt2800soc_suspend(struct platform_device *pdev, pm_message_t state)
 {
 	struct ieee80211_hw *hw = platform_get_drvdata(pdev);
 	struct rt2x00_dev *rt2x00dev = hw->priv;
@@ -239,7 +140,7 @@ static int rt2x00soc_suspend(struct platform_device *pdev, pm_message_t state)
 	return rt2x00lib_suspend(rt2x00dev);
 }
 
-static int rt2x00soc_resume(struct platform_device *pdev)
+static int rt2800soc_resume(struct platform_device *pdev)
 {
 	struct ieee80211_hw *hw = platform_get_drvdata(pdev);
 	struct rt2x00_dev *rt2x00dev = hw->priv;
@@ -355,11 +256,85 @@ static const struct rt2x00_ops rt2800soc_ops = {
 #endif /* CONFIG_RT2X00_LIB_DEBUGFS */
 };
 
+static int rt2x00soc_probe(struct platform_device *pdev, const struct rt2x00_ops *ops)
+{
+	struct rt2x00_dev *rt2x00dev;
+	struct ieee80211_hw *hw;
+	void __iomem *mem;
+	struct clk *clk;
+	__le16 *eeprom;
+	int retval;
+	u32 *rf;
+	int irq;
+
+	mem = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(mem))
+		return PTR_ERR(mem);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	clk = devm_clk_get_optional(&pdev->dev, NULL);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	eeprom = devm_kzalloc(&pdev->dev, ops->eeprom_size, GFP_KERNEL);
+	if (!eeprom)
+		return -ENOMEM;
+
+	rf = devm_kzalloc(&pdev->dev, ops->rf_size, GFP_KERNEL);
+	if (!rf)
+		return -ENOMEM;
+
+	hw = ieee80211_alloc_hw(sizeof(struct rt2x00_dev), ops->hw);
+	if (!hw)
+		return dev_err_probe(&pdev->dev, -ENOMEM, "Failed to allocate hardware");
+
+	platform_set_drvdata(pdev, hw);
+
+	rt2x00dev = hw->priv;
+	rt2x00dev->dev = &pdev->dev;
+	rt2x00dev->ops = ops;
+	rt2x00dev->hw = hw;
+	rt2x00dev->irq = irq;
+	rt2x00dev->clk = clk;
+	rt2x00dev->eeprom = eeprom;
+	rt2x00dev->rf = rf;
+	rt2x00dev->name = pdev->dev.driver->name;
+	rt2x00dev->csr.base = mem;
+
+	rt2x00_set_chip_intf(rt2x00dev, RT2X00_CHIP_INTF_SOC);
+
+	retval = rt2x00lib_probe_dev(rt2x00dev);
+	if (retval)
+		goto exit_free_device;
+
+	return 0;
+
+exit_free_device:
+	ieee80211_free_hw(hw);
+
+	return retval;
+}
+
 static int rt2800soc_probe(struct platform_device *pdev)
 {
 	return rt2x00soc_probe(pdev, &rt2800soc_ops);
 }
 
+static void rt2800soc_remove(struct platform_device *pdev)
+{
+	struct ieee80211_hw *hw = platform_get_drvdata(pdev);
+	struct rt2x00_dev *rt2x00dev = hw->priv;
+
+	/*
+	 * Free all allocated data.
+	 */
+	rt2x00lib_remove_dev(rt2x00dev);
+	ieee80211_free_hw(hw);
+}
+
 static const struct of_device_id rt2880_wmac_match[] = {
 	{ .compatible = "ralink,rt2880-wifi" },
 	{},
@@ -372,9 +347,11 @@ static struct platform_driver rt2800soc_driver = {
 		.of_match_table = rt2880_wmac_match,
 	},
 	.probe		= rt2800soc_probe,
-	.remove		= rt2x00soc_remove,
-	.suspend	= rt2x00soc_suspend,
-	.resume		= rt2x00soc_resume,
+	.remove		= rt2800soc_remove,
+#ifdef CONFIG_PM
+	.suspend	= rt2800soc_suspend,
+	.resume		= rt2800soc_resume,
+#endif
 };
 
 module_platform_driver(rt2800soc_driver);
-- 
2.50.0


