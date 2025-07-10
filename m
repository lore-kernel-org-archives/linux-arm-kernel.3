Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C165AC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 22:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WwYe3xupMTSG2+11zL2c0yQ7oBVvIn5KSYLqAXZibDs=; b=SFTHjAiMiRpcEar0rAGjSlwTff
	Udk0cvhHeN+oDXbfFlumXqTw9QArhDVUAKufpynYHYntwjUlZzLnGE6hCIvThKlT2VAtwJTlAq62L
	S2bMgY1FdExUYGipV9gC1EnkutcPnYFYYXm0f/TfC+RfLzZ10Oct4d1SlMVDhj2NQD3VUaQ+A692r
	eszJzNIv3dEEn4XZwdvm7aIkZFZ0vwdw8QnpErq8SrcqXUUWS+7v9V0cGzZK22caOdfGZUqM2isqn
	6Mh713P7OVxb4ip6MoW2lVbReYc65L0LQFhoiN8CP5eLtOc903JpQYzHLmcUIDFdyvybLrRrySTCS
	2xgbmRNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua0AJ-0000000DD15-1Lto;
	Thu, 10 Jul 2025 22:54:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxZI-0000000CtAs-3gZQ;
	Thu, 10 Jul 2025 20:08:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=WwYe3xupMTSG2+11zL2c0yQ7oBVvIn5KSYLqAXZibDs=; b=KhtmPjMHISy/IKFd4HX/uH7fkV
	p/X+/8TvFab4aKvJ7tj65OHOh52/1JWTXMncNbXBcS1a3noWe1ehfdhMbEFlKH/Hh+TOIbYHeFM2q
	sT+CgyW8RD8seW5DnsVHv8lJLAuAyFu+TdAeA8apuax800+0I3rrZVTwd5kx4iqrUyVdRgB5qZKFV
	kW578Xfha9BHoU1vtvefDBAPo5QGGiEJUDcmQjOOyoYrCuuwrFKIsOibH1NWAHF/qA9Y+8prDeEG4
	BZE2c/0jaAIxm05/0haaTdVngviIZBAfYWIPJAqAgjbHsDLye9CFbm8g24MkOdB6q18KWEsOjKBCD
	my0pvSKg==;
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxZF-000000098yt-3U9x;
	Thu, 10 Jul 2025 20:08:31 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-74931666cbcso1185192b3a.0;
        Thu, 10 Jul 2025 13:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752178108; x=1752782908; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WwYe3xupMTSG2+11zL2c0yQ7oBVvIn5KSYLqAXZibDs=;
        b=QbYeEQ9NX4vt1KgpQtdvU1+XOMez7oqs6f0Aud0Koz5DbTi1RX7vLFdnLodLTUjwE8
         L9KG4Dvq2E+t8aZtIlOVIpCVmR7R0a2NJfN8JBxH7d2FU3QSYYhCX3AtR/DhU6JAzvRd
         vSN9nvH4EEGiFQ1z3nQ5+yAJBVDkt94xMfbqp6ZqB5cpLZ/qN1Wnwpx4rHmM1Mpc+UAl
         fLuzVjkfbgHkrJOQc+KezHV3sIkETKJfps+HhMEZkWtX6jjnfcnRc4ldFpqaIeRS9h24
         uxRMcHGJ8HbL6f9/TiaDRgc1e4PUvvqOH+OKcmKL5AbyBhDkKTxzR98KN/YYp8Sl0NJf
         /jbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752178108; x=1752782908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WwYe3xupMTSG2+11zL2c0yQ7oBVvIn5KSYLqAXZibDs=;
        b=wf/pJM7EnNOOBDjqr9lBxSicnnpXOg2bSkqfTNkc8jrNdh4r68pC5ekQV9Kb0H2AM5
         /X9PwdLvWJ8mGl/YPWiHDNn2Id/zRIBDUfiLfuOltUkiv6N6jMFI9pi21JPc7e4CtBcK
         d2W99FCo++j0lmvwn54pRGbosTB3cGzN1ZBxHdI7h7qQRTopgLBpsGL5BsAXNZOgUnxN
         YgqVskboKZrEsrL+3zKpOsLhnUenknZMGnEtIpxN8waXybpfyz/QIpctMUQ19xjQGrDc
         KQ1csVgRysQlDzZCGF3t7nJ9XXW8TZieucaVvldqMt0Fx7iEplnLNzlHwHcZvqdNZJ9f
         C6aQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjRdBKznwfLdblLTk3OKbZhT7zwdJ4gmkF5eyAmE7r89+5XD5DoiPq6NnUUx/uVNhacc2nZR9qqiWwcc/KcZyo@lists.infradead.org, AJvYcCVqMTsnXlW03+k1lB48VHctY5qU0s8/FqDIHSlykvzPB/0CbVDoQ9iNXJFWoEhKNoYFE7HfH46c4Ag7V4saQ+o=@lists.infradead.org
X-Gm-Message-State: AOJu0YxYBOxn1RZR+vvMynAyT6S/it54IBRlVR6uxl1TBKgRmyF/wAVl
	djdM/6cRS0uM2p6kSyNi3TMGYFOr8joeXfPLIsz42BWQMkVRPWrtOk8t
X-Gm-Gg: ASbGnct38QRiQsfNhqeLRiqOuyjSJEDt/wPC2M7NmsxOdoTs0q4wfpXbtnmD594x4AL
	60y+tXjt+466359uJ8lMmAPTymSbsiV0kW3TxGu2sieVx5bhkJ20qSj9tS0oT2PH5Xr6KxbnYoL
	rRyuXqEue6qlwN93SnEWHcbl9ikOrv7CFUAS3/JAcfZAMch2vDknlpmlo7jVkjdVj9Zqd7smDDo
	ZkgKsbL2KdYON2SrhTYYMl2naaIL7Tb22mu2wuXD/EE8j+YMyzHE4rE3ySx1WpulkTcLLmNext1
	7/e/00XC55lNBMirtiCFxPOT1nZ0Z3lJfE5qa85a+xk=
X-Google-Smtp-Source: AGHT+IFGENkAdv+V/dfx5FamicrJ6jx64xFv4YqiFq5sarFKCvXAwSk4KPlooZcc+d8/G07famlB5A==
X-Received: by 2002:a05:6a00:1945:b0:746:3040:4da2 with SMTP id d2e1a72fcca58-74ee109a194mr529659b3a.8.1752178108233;
        Thu, 10 Jul 2025 13:08:28 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f1b29asm2729453b3a.87.2025.07.10.13.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 13:08:27 -0700 (PDT)
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
Subject: [PATCHv3 wireless-next 5/7] wifi: rt2x00: soc: modernize probe
Date: Thu, 10 Jul 2025 13:08:18 -0700
Message-ID: <20250710200820.262295-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250710200820.262295-1-rosenp@gmail.com>
References: <20250710200820.262295-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_210830_109285_ABFF0B8B 
X-CRM114-Status: GOOD (  19.64  )
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
---
 .../net/wireless/ralink/rt2x00/rt2800soc.c    | 185 ++++++++----------
 1 file changed, 79 insertions(+), 106 deletions(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
index a19906c35d0a..6f148dec2469 100644
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
@@ -357,7 +258,77 @@ static const struct rt2x00_ops rt2800soc_ops = {
 
 static int rt2800soc_probe(struct platform_device *pdev)
 {
-	return rt2x00soc_probe(pdev, &rt2800soc_ops);
+	const struct rt2x00_ops *ops = of_device_get_match_data(&pdev->dev);
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
 }
 
 static const struct of_device_id rt2880_wmac_match[] = {
@@ -372,9 +343,11 @@ static struct platform_driver rt2800soc_driver = {
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


