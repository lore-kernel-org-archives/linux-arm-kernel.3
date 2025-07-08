Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E883C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 20:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WWDcW/kjZC4qhj4C//sbQ5nqQzgpn4vwd848BqxooNU=; b=FDibLoxYjvDh4Kz6xHV9CqE10P
	jaAoZL5+ASH5e16DBrhAMpI8pE9SiC0be7zJfDKnI9L+cnaZaO3D8nCH+xtKDOqbym8NITpxPAXb6
	ZN4lCqy1Izb7woFg/enmjsjYbeR7uOFsHiptyZKIO4EMnHMPDTueKYyVFqRbzHexk4ZWsqkIKmWaI
	UdH/Gidg8f5q4Ht2kyfkcHHaiNWcG4TdKOZNteQpvifr66Pg0+sVzloqiZrqkXSa/fgUgJ1b2ZtcL
	ivWdRTQ838NKRRNONEcQP9wRa9tHmHZ7cpaxIpIJsC/X7MVKElPNnOWylIfXZao/SyOTUUYEGcToO
	8R5iUyhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZFHw-00000006Z7v-0obn;
	Tue, 08 Jul 2025 20:51:40 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZElG-00000006U5r-31ot;
	Tue, 08 Jul 2025 20:17:55 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-73c17c770a7so5913955b3a.2;
        Tue, 08 Jul 2025 13:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752005874; x=1752610674; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WWDcW/kjZC4qhj4C//sbQ5nqQzgpn4vwd848BqxooNU=;
        b=HMfajha9X+mjDRtHalachLpxnP6hfwZvod1MbehI7L3N8htKtsqDUPjZcBUGcPp2uv
         nviTPiKBKX0xngqnHldqkSSkpVqE+tVSvTTPCDfv1rnfsAjdqIH4SKZgJ5F5NU0x1cbC
         hKujz2ZjZEDfIJDxjgLnGJmKJ17dVxZ0+wEXkW9S8pn7EeBmqxl5megp6u2YbIOhQJmU
         vAXwO4s2QOUueE0E+XHYY6dSjYZsxUUCq3cHo5RXPBah/O5xaOkguJ1Iiq/CpCJb2LDe
         nVi3G2tKgfU4GvA/XEpuOB8kpw5mstHJtrWwDVO6vwt3iEoHL6+fRo7SBL3YIfczY5YO
         3Gpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752005874; x=1752610674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WWDcW/kjZC4qhj4C//sbQ5nqQzgpn4vwd848BqxooNU=;
        b=pzrSiZpdlMigdFyh/Lwd8pUy7VCSd1SmRcXDtewf8OCU41TkRldlcPQm3IvuGd6haj
         NmQxooZot7ie9+SeY2DWhwqvuSk4fdp0v33xBq42w6nhtgwS9MBprhrbTw6fyRQQnj3e
         0qslKXVJawiIoemqpYakyPr/5lk1IBempCwwJexLUkURi57R2q4SwaChqzSYNMbqQV/p
         DjDd2HFUlZ8yQZqC6knh8hQAmE8sHxICNt7XLyEKTrS0ZjCQ4EV8zQo0xmL2cdjzyq9z
         iY+t5OlVTNLGNf6x+f79OCa4QT8Uo3mYqgr+8hpCXOlNwh6kASqCoqMc6WVRyduwekKZ
         rW4w==
X-Forwarded-Encrypted: i=1; AJvYcCVR9sWpdWAtEHSitl5Zp+utodzjTsQRErX2YZFxkgjIzfCVfh0CKLEgBr2E2dNzqfXFKN1/mF4zjtpDCOQkE7xu@lists.infradead.org, AJvYcCXa655tS1TJ82/lMH1Ms5EdN+1/yq/J2KKm+mTwoRX6MXjPZFZls5ubGYeIRpbvi/Km4ypJQfO3GD2iLBPpl9U=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1wHP3xKnpSnlNiF9eYggrdWa4j1NmqXAd0bNgs4mvvVhK9UaO
	ZXhjeu/TdX114tB/dzRSgs9FoW9balpfqdtNrZJhtwGKcoOfw5Y+NGHl
X-Gm-Gg: ASbGnctsmyhjXbbTHXQ/YM1jF88esRxnVhoQUww+rAYLH4lz3IHLZs3zwy1LH633Th+
	64hQ1vM0ZN6zXdF+TzqtYzU/ODsulBrLVUkGl4nG1GCBvzwxW0o+JCxks/hdSFS/EGeKm7nSWbK
	FFYy8zvs2j9H+i42lUDpOSavI50afZg+AcX+1QxCt9gdQduF2/vcRDM2FHvyqBq6kQyZ7LibXHF
	nBO2XK1zDAKinVGhVC+Iz+SAW5DeoKDvlmE5tT3tjwgdV/BbPE0fiC3Wwcfp8YFAhD2yE5ZypvH
	Ftdsstji7OMvMprXBESPGB47PxgObmw9HjrwarZP3Oo=
X-Google-Smtp-Source: AGHT+IHesj1rvCWvnUYMskuhzoi+0SVmWfj4l3v7+KPmXKe4dlWKWWZNDElUOFSLMFlp8RtXpFwlrQ==
X-Received: by 2002:a05:6a20:918d:b0:215:dee4:4808 with SMTP id adf61e73a8af0-2260aa9f41bmr27971148637.18.1752005874105;
        Tue, 08 Jul 2025 13:17:54 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee5f5d8csm12289625a12.39.2025.07.08.13.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 13:17:53 -0700 (PDT)
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
Subject: [PATCHv2 wireless-next 5/7] wifi: rt2x00: soc: modernize probe
Date: Tue,  8 Jul 2025 13:17:43 -0700
Message-ID: <20250708201745.5900-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708201745.5900-1-rosenp@gmail.com>
References: <20250708201745.5900-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_131754_759415_CFD7893F 
X-CRM114-Status: GOOD (  20.21  )
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
 .../net/wireless/ralink/rt2x00/rt2800soc.c    | 175 ++++++++----------
 1 file changed, 73 insertions(+), 102 deletions(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
index a19906c35d0a..a238f7b9634a 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
@@ -18,6 +18,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 
 #include "rt2x00.h"
@@ -130,106 +131,6 @@ static int rt2800soc_write_firmware(struct rt2x00_dev *rt2x00dev,
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
 static int rt2x00soc_suspend(struct platform_device *pdev, pm_message_t state)
 {
@@ -357,7 +258,77 @@ static const struct rt2x00_ops rt2800soc_ops = {
 
 static int rt2800soc_probe(struct platform_device *pdev)
 {
-	return rt2x00soc_probe(pdev, &rt2800soc_ops);
+	const struct rt2x00_ops *ops = of_device_get_match_data(&pdev->dev);
+	struct rt2x00_dev *rt2x00dev;
+	struct ieee80211_hw *hw;
+	void __iomem *mem;
+	struct clk *clk;
+	int retval;
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
+	rt2x00dev->name = pdev->dev.driver->name;
+	rt2x00dev->csr.base = mem;
+
+	rt2x00_set_chip_intf(rt2x00dev, RT2X00_CHIP_INTF_SOC);
+
+	rt2x00dev->eeprom = devm_kzalloc(&pdev->dev, rt2x00dev->ops->eeprom_size, GFP_KERNEL);
+	if (!rt2x00dev->eeprom) {
+		retval = -ENOMEM;
+		goto exit_free_device;
+	}
+
+	rt2x00dev->rf = devm_kzalloc(&pdev->dev, rt2x00dev->ops->rf_size, GFP_KERNEL);
+	if (!rt2x00dev->rf) {
+		retval = -ENOMEM;
+		goto exit_free_device;
+	}
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
@@ -372,7 +343,7 @@ static struct platform_driver rt2800soc_driver = {
 		.of_match_table = rt2880_wmac_match,
 	},
 	.probe		= rt2800soc_probe,
-	.remove		= rt2x00soc_remove,
+	.remove		= rt2800soc_remove,
 	.suspend	= rt2x00soc_suspend,
 	.resume		= rt2x00soc_resume,
 };
-- 
2.50.0


