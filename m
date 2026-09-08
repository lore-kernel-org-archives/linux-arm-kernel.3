Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF0CC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GoJVdgu3OR1hm3Ux9hMLG80GY2W7JeBpJE05sP2z1ao=; b=Jbb+wFH0Dod5l3bPbmiA1oj4aJ
	fChZZHv+lZGiUX7Hqe01ZBiuRj8iGxl67Ab7pgrxrviuKVrVqtE+6MErOVBbo/ReHIwg839wKaHrk
	fRwOOvU5EZ3kTVr/lqCOnky9caNHh0ALIfJ1RxdO7szF3T2XYh3JkkngSKZn8yjHTWiqYIHbttB02
	7vELyREEXLdKTOr5MDZ7Qi1/OI2mdTEyf5q2cSenX69aqax0Vb9ScqD+HEQQCPpTa4ZnhNlCDIo+f
	zrD2/0mBrrHGA1+TRj8h+MiMZ4q3LIZ4SUNipWHiq/drmAmhH3mSahHePgu20o4mBXcn3E+hNS8DD
	ZCQ9m3hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zry-00000009rrj-0Ua9;
	Tue, 08 Sep 2026 17:44:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zrx-00000009rpa-0kT1
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 17:44:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=GoJVdgu3OR1hm3Ux9hMLG80GY2W7JeBpJE05sP2z1ao=; b=nWj9q9DEjrSY7dqA49+WIe/TRD
	83XtwW87wG7vpGarnDB39du+yCo+hisD1173sAOfu2KSmw4B4NwJHta8rlMeQoi0RsoPiebL2BIyw
	8oA27+Xg58w7YyG3Vw8dqRSuUxKlRrK9VglNVGK0Z5TI0Y7k6w05TGfYT0kVHMP0hmNwHyRui6luK
	hJ37XHDxTO6cA6XuHf/1t984m4WPgV1bkDaN3cVFtO1vMDDVLOBM1/qRa15Dd+17LhQ5SMmT3sklt
	lm/M+q6e6Pd9IncgPzcAUOZXavn+0ogCDaRai6tULwGHY6M1153KrXAkWBZEUJ0M5pv/iULDxwJdU
	zX2Iwxuw==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3zru-00000000Ayn-1pln
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:44:28 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso40453235e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788889464; x=1789494264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GoJVdgu3OR1hm3Ux9hMLG80GY2W7JeBpJE05sP2z1ao=;
        b=N/b3PdeEt8Do7Fd/iFinhGzyOSXUeL6oyHQ8S0qVv/7hxBK5gxSWqaF+zxbPWKIJG3
         UeJe4kc/fDRLQ/REIc7gN3LvAet1N0YR0ukx8ArZTFczTPQlkLEqDHLexA63Wo04C2lT
         zeHAYcrkWos6vDekSPAE7LjXd0lkAQm/m8zAe2oC13/iodju1gA6pZT4qcYBVOPxTnFz
         mLS1ufEKqPd/ni829Yvtfih1q+3gabRPBnJ09MFs6meD4lRWHY+n0/ccjVYVDdipJ3cE
         l91ZlYH2RMfnwnMhtXayWyb+E1GRfRtSgnK7ChkzsxDFzQ3nxgH9zqM1iJjV74SHAF5P
         ebVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889464; x=1789494264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GoJVdgu3OR1hm3Ux9hMLG80GY2W7JeBpJE05sP2z1ao=;
        b=i7dDuO7o20HQT/0dWXK0hcAea8GS0OdyA0Em+452clM8LDNLOYs2vvBTGjK66zN3Px
         QhIgoL0a9/1cfy3Tos4nCStjxymZH/SLepYgfo9iza0sfqkadlSPYhTeQgJydGdKZ55c
         z1oKV+b0GLtFLBWAoynxnTPfn7tLM5LV4wtmf6aL5502s7b6GPNJ3PddeBj3CntZJ9Wc
         dXKOUSRK5hYOr6NvnMkbrnOQYk+wdNnydmSEgegNNNvWdl4y2hUzxUVdkAI+hGV435JB
         MTem3tG8tHe25BE1C/+K/wg9ZuscxmtUjoTMfMqjB7NXM8f1MLp1MOO4ISKiV3bcIdZa
         O63Q==
X-Forwarded-Encrypted: i=1; AKwUvByNN8/k+CYY3YNheNaoFJwQU3SrNt9anLDrwEaWKVS24KqCNmrQjklLcBxcbBzbEqlNBy2O5XkHAK5nPtOfudQp@lists.infradead.org
X-Gm-Message-State: AFuF++n1dsxnHRJXwFkWpIPnmYI34PE/HvneT2TWZcdUrzinrzoZlO5c
	fLRJhMFFhAqF8ys3rIBJqWxrikc2M9/S9xdLfslS8vhGpScSqKv/qwr4
X-Gm-Gg: AYBFou2u4avw/IsyLK9M1HSebASiZL0UZc4yp2Zt+/0KYlAkIQQ1j+eJLAxw/0TnsCV
	ngF1mXlAHUlOLYQ6gNLOzmN2xSymnOVz0TTI2V/7phftzIYI8pa/nXnq2gPkA5CY65xL+zCF1R2
	V5cC5ZVukeDkUV/GBKNeT9vWFw09XM7OsU04ToC7EXTblDqCmbQSU2TBL+zyrfXD6pImS+xDtkB
	mjfXTClEkiVg0N1T5Cf8ZxODduEx8MNkFMaRMOybe0GaHno9D2/RxMmSpIav5Q0IkCEa0TPbRrF
	jGQxrAGoK/bZov6k5pAOXIVnk+BWgeIGacSGfShfXfuDkZpcWyccINk4cffgBkMQf8Iu1BTB/K8
	0O+ItwNDItnx3e9KbtpoN400ncyo3B1qjOUYCrJwptGJkFGxfRBGKTuOUBIVlJ/eBN5wLCDfIkb
	os4gLGZHEuG1buusPAOyJM3DFstTSTAEXB0PrGKztCx6v+MYEcmC56Wsydew==
X-Received: by 2002:a05:600c:3b0e:b0:49c:fc6e:a3d5 with SMTP id 5b1f17b1804b1-49cfc6ea726mr268044365e9.20.1788889464237;
        Tue, 08 Sep 2026 10:44:24 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm487081105e9.15.2026.09.08.10.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:44:23 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 1/8] watchdog: mediatek: Add wdt/toprgu resets for mt6589
Date: Tue,  8 Sep 2026 19:38:28 +0200
Message-ID: <20260908174259.9009-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908174259.9009-1-l.scorcia@gmail.com>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_184426_600642_9F476968 
X-CRM114-Status: GOOD (  14.49  )
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

According to Android sources, mt6589 has 12 reset bits in the
WDT_SWSYSRST register. Populate toprgu_sw_rst_num to allow toprgu resets
in device trees of the many compatible devices.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/watchdog/mtk_wdt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index d9c30e4c80e3..d609f0fa35e3 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -64,6 +64,7 @@
 #define DRV_NAME		"mtk-wdt"
 #define DRV_VERSION		"1.0"
 
+#define MT6589_TOPRGU_SW_RST_NUM	12
 #define MT7988_TOPRGU_SW_RST_NUM	24
 
 static bool nowayout = WATCHDOG_NOWAYOUT;
@@ -88,6 +89,10 @@ static const struct mtk_wdt_data mt2712_data = {
 	.toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
 };
 
+static const struct mtk_wdt_data mt6589_data = {
+	.toprgu_sw_rst_num = MT6589_TOPRGU_SW_RST_NUM,
+};
+
 static const struct mtk_wdt_data mt6735_data = {
 	.toprgu_sw_rst_num = MT6735_TOPRGU_RST_NUM,
 };
@@ -493,7 +498,7 @@ static int mtk_wdt_resume(struct device *dev)
 
 static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
-	{ .compatible = "mediatek,mt6589-wdt" },
+	{ .compatible = "mediatek,mt6589-wdt", .data = &mt6589_data },
 	{ .compatible = "mediatek,mt6735-wdt", .data = &mt6735_data },
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
-- 
2.43.0


