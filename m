Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA70D68B36
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 16:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DOSHt+MVfqoI6yUFl7+wi3kWGpaEllOtAf6f4LEbPEc=; b=EB76He2UiH68ogBVLVvOPaoSaE
	RCSC7BPdTnedU3qm788AnVAmBsK40p2NbN0uXr61vv2OdTi+BGWVjG3e9hDKttV4lRME1CNjf12EI
	JYQG6zbt/tLpLmDS6XnY1EnPDh4AlV5p/Z9zROC73r8lykgYmZ8R5/n/JEgcLTUO4WxmFcVqGLrGY
	PLlItbWc9rFkeP0P0h0Uq3P1UIF5lkzG8i8h55YuS48T0vVdhB2NtHb3J/PHBZot3Z/6LATBBw9ng
	J3UUvsOwMFnE49sB9Dkxlq3M9zT25JfHt9tbyGHX8uyhJMOttXSSEQx7PCp4iHRjHTLuuUHM5WDc5
	jDR6koYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcqW-000000009tw-1d1h;
	Thu, 14 Nov 2024 16:37:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcoh-000000009OU-1wQs;
	Thu, 14 Nov 2024 16:35:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=DOSHt+MVfqoI6yUFl7+wi3kWGpaEllOtAf6f4LEbPEc=; b=VuqjpOaVqv54A4WFLnRx0Niuu/
	IIEKLId+dZVuSQjjspG6haPN5g3G8vX0cT5n5jH03qH49iVh2KjsfZP5vgrfhBiDNz/Yy2yHO8UaM
	/7aEkKKl/9gZAMNX1sXSP0EX/vUfTGGJXvvozEmgpeiELHZ2DWBIzdrdi9DniIBZAU71Uc3Hru/Aa
	UDgUwCUlwQjwJ+3y+t1But02+wqBJW9UQu535AUTx/z5lilHe+GnXqBXIgY2lYKA8hN+wGE6fWQHM
	jiFZcaiABM7E8yzrxOJnH+q/DKGaH3ouBk8fgtBGZsa1bO27b0jQrqdR4sAeR5ylbyCJNdqAdF7fM
	e6fGt9zg==;
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcod-000000007pu-027X;
	Thu, 14 Nov 2024 16:35:33 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id EC46D12000B;
	Thu, 14 Nov 2024 19:29:32 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru EC46D12000B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1731601772;
	bh=DOSHt+MVfqoI6yUFl7+wi3kWGpaEllOtAf6f4LEbPEc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=rzvOSwCYK/zMLnQrueRDbBS95+kMns5Op0wLS1mA4qqbvlQVtFI5qo/3CrR2FCWSZ
	 JX6a7Jz0n1kHn2Qyt4OoLb+i28bacSjb+wfvgdkYpTy7CGwnSItJ9fqhuRcUPoyQ5a
	 vcht/sWqWCIFm3lpq4XMNFiR0MHpHzyE5a1dAUEhYMG/k5Ok99TqVXCiADkFZnfCwL
	 Jm7MSvlJZPldihhF6N/Fnid1uno3wjQRv2zp+txJSHKNtx2zZntb4gjpAJ6qapH4i2
	 PF/YmgcLGzrKG1ysrsTpin9s9U9aZNBnbO5V8k1+mY4PY07QnRx+lHjOj+wQiGCHIz
	 UYP5zySafFU/w==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 14 Nov 2024 19:29:32 +0300 (MSK)
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Jerome Brunet
	<jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, Michael Turquette
	<mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>
Subject: [RFC PATCH 1/3] clk: amlogic: axg-audio: use dev_err_probe()
Date: Thu, 14 Nov 2024 19:29:24 +0300
Message-ID: <20241114162926.3356551-2-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114162926.3356551-1-jan.dakinevich@salutedevices.com>
References: <20241114162926.3356551-1-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.28.64.45]
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 189183 [Nov 14 2024]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 41 0.3.41 623e98d5198769c015c72f45fabbb9f77bdb702b, {Tracking_smtp_not_equal_from}, salutedevices.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;sberdevices.ru:7.1.1,5.0.1, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int}, {Tracking_white_helo}, FromAlignment: n
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/11/14 14:31:00 #26861614
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_163531_355302_C85FD447 
X-CRM114-Status: GOOD (  12.90  )
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

Replace dev_err() with dev_err_probe() to simplify the code.

Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
---
 drivers/clk/meson/axg-audio.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index 7714bde5ffc0..05a72a199ebd 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -1714,10 +1714,8 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 
 	axg_audio_regmap_cfg.max_register = data->max_register;
 	map = devm_regmap_init_mmio(dev, regs, &axg_audio_regmap_cfg);
-	if (IS_ERR(map)) {
-		dev_err(dev, "failed to init regmap: %ld\n", PTR_ERR(map));
-		return PTR_ERR(map);
-	}
+	if (IS_ERR(map))
+		return dev_err_probe(dev, PTR_ERR(map), "failed to init regmap\n");
 
 	/* Get the mandatory peripheral clock */
 	clk = devm_clk_get_enabled(dev, "pclk");
@@ -1725,10 +1723,8 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 		return PTR_ERR(clk);
 
 	ret = device_reset(dev);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to reset device\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to reset device\n");
 
 	/* Populate regmap for the regmap backed clocks */
 	for (i = 0; i < data->regmap_clk_num; i++)
@@ -1746,10 +1742,9 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 		name = hw->init->name;
 
 		ret = devm_clk_hw_register(dev, hw);
-		if (ret) {
-			dev_err(dev, "failed to register clock %s\n", name);
-			return ret;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to register clock %s\n",
+					     name);
 	}
 
 	ret = devm_of_clk_add_hw_provider(dev, meson_clk_hw_get, (void *)&data->hw_clks);
-- 
2.34.1


