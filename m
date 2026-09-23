Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49550C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 11:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4gf0080cc1bOdD46SM4BmeA8Qe0JG/1hnNjmI0f6zac=; b=G7SLI6d0buR9/+OfnL3BuLy8Cu
	V+CdxURpneV1b0rnfzJ36tXIR6np77YIZgFwMlyIwLpMnGtp1vx+jPhNjv/KlkDKoKYEepr4C0PIG
	xm1330qcl4Dws/DY69UTJ3CcxwLpiqK3KOONAuL0LKMIia4+yGESdnUiGFLgJZJ+6SJg3I55N4tkl
	qtlBEHYxnSafzyO8pABZAk2F4eIzOxzhkLzZVIBN25bhRSJT8c28ecaqVGw1xINOjbYcxJVEsk2iH
	q1ZQqe/BJziT5WdyVxgyFvqHUgrjSARatd7Xws8z5xwaEALGaXcDR2l9+8OnHxp1X4x8fOsXysbnd
	LGVnLVjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Kzp-000000082YQ-1b4b;
	Wed, 23 Sep 2026 11:18:41 +0000
Received: from cp2.siel.si ([46.19.12.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KzK-0000000827N-2Y2E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 11:18:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Unsubscribe-Post:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4gf0080cc1bOdD46SM4BmeA8Qe0JG/1hnNjmI0f6zac=; b=RciFyTWS/TVrx3erMW9iTP3nFZ
	FLKH0CkPdXhNFOuDATa84r3SH1PWFKwGO0pmBlR3tcnADyBt6PH2RbAmnO0FlKUlvepxBXPWLx3YB
	mm59KWcW3cGsclU662MNmwyJJjroGRtwXn6H+7M97GNxQOFwTUgfs2MX4IeUH+hgHN0IWoPxaRmPz
	RRrDC4rJBerKKI/OvwUxftDRpgy4gBFMEGE96Xl5PNdW6/ncuESIWM1DG8leyf4W5BC7G6KCTzWD1
	EETSmokDYNpCNmHOMeGgPctddHhd7ytgof7NI+IUsqk+sW8bcv30p7srl/cBax848VJRFNXM+8LNT
	NYw0QXCQ==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:43182 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100)
	(envelope-from <primoz.fiser@norik.com>)
	id 1x9KyZ-0000000A1qw-3FP3;
	Wed, 23 Sep 2026 13:17:22 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-watchdog@vger.kernel.org,
	upstream@lists.phytec.de,
	andrej.picej@norik.com
Subject: [PATCH 3/4] watchdog: da9062: reset board on watchdog timeout
Date: Wed, 23 Sep 2026 13:17:18 +0200
Message-Id: <20260923111719.2032012-4-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923111719.2032012-1-primoz.fiser@norik.com>
References: <20260923111719.2032012-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_041810_829172_48107918 
X-CRM114-Status: GOOD (  13.31  )
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

From: Andrej Picej <andrej.picej@norik.com>

Implement a method to change watchdog timeout configuration based on DT
binding ("dlg,wdt-sd"). There is a possibility to change the behaviour
of watchdog reset. Setting WATCHDOG_SD bit enables SHUTDOWN mode, and
clearing it enables POWERDOWN mode on watchdog timeout.

If no DT binding is specified the WATCHDOG_SD bit stays in default
configuration, not breaking behaviour of devices which might depend on
default fuse configuration.

Note: This patch requires that the config register CONFIG_I is
configured as writable in the da9061/2 multi function device.

Signed-off-by: Andrej Picej <andrej.picej@norik.com>
Tested-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 drivers/watchdog/da9062_wdt.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.c
index 3d7bf2f351db..7ceef8cd7425 100644
--- a/drivers/watchdog/da9062_wdt.c
+++ b/drivers/watchdog/da9062_wdt.c
@@ -204,8 +204,11 @@ static int da9062_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	unsigned int timeout;
+	unsigned int mask;
 	struct da9062 *chip;
 	struct da9062_watchdog *wdt;
+	int ret;
+	u32 val;
 
 	chip = dev_get_drvdata(dev->parent);
 	if (!chip)
@@ -245,6 +248,30 @@ static int da9062_wdt_probe(struct platform_device *pdev)
 		set_bit(WDOG_HW_RUNNING, &wdt->wdtdev.status);
 	}
 
+	/*
+	 * Configure what happens on watchdog timeout. Can be specified with
+	 * "dlg,wdt-sd" dt-binding (0 -> POWERDOWN, 1 -> SHUTDOWN).
+	 * If "dlg,wdt-sd" dt-binding is NOT set use the default.
+	 */
+	ret = device_property_read_u32(dev, "dlg,wdt-sd", &val);
+	if (!ret) {
+		if (val)
+			/* Use da9062's SHUTDOWN mode */
+			mask = DA9062AA_WATCHDOG_SD_MASK;
+		else
+			/* Use da9062's POWERDOWN mode. */
+			mask = 0x0;
+
+		ret = regmap_update_bits(wdt->hw->regmap,
+						DA9062AA_CONFIG_I,
+						DA9062AA_WATCHDOG_SD_MASK,
+						mask);
+
+		if (ret)
+			dev_err(dev, "failed to set wdt reset mode: %d\n",
+				ret);
+	}
+
 	return devm_watchdog_register_device(dev, &wdt->wdtdev);
 }
 
-- 
2.34.1


