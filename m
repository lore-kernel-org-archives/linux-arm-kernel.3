Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6129C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 17:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V7xpiSqeInQmCCpQ2ynBS61txQNcQjjgq6PfjhT54YQ=; b=3QGjs8A3Ejqx4IbtUzJ10UdTBQ
	ktQ/6otiZVE+UFpU17pm70d/CaEfGaB0s3yutGjLsflRWstVaIdtDnlBAyG/0gQHFzZ5UvV+uwu5e
	kBAzw2OFppmGopseSbsQTILYiWsiRVSyaonA05EkRNAmbVgOKFn3pbu+aEg/punSZVh19IHaRsSnl
	l88bPxyCYSKfhv2gM2UkW/aH0wGwukDWxEY417tAuIdoadQ1gqUY5H7MXl0X7DorHKGANfcGPDi6x
	FDao94fuI2C8H5HUIU18kuQ3Y9QO3IXLl9yHemkmHrqCyFaBHbrLEjAKfVdYpqQlYv11fxlP9oDO+
	1FjkkfLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whs6Y-000000034qu-2OW3;
	Thu, 09 Jul 2026 17:00:06 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whs6V-000000034ox-01ob
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 17:00:04 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso59571f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 10:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783616401; x=1784221201; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V7xpiSqeInQmCCpQ2ynBS61txQNcQjjgq6PfjhT54YQ=;
        b=JaSj+yQOs5Xzmr4V8uwbN/u5Lgir38LT9xciDmSbjJJNo5E5FwiQq9zNHa6CbwoWbC
         Pie1ADdbkw4rK26RmDsT2EGhoxl/g0c29I3tttIN89CwJmjMQhKCznCqPXT/5CbmEYyA
         w2tDpfNE1iNYgIlt56dj3FBS7mcX9OFnOaBUFUgr2IfBYwbRQxLXCid4Amt6TYDcb0H0
         8+dQTQp1UbTawjW2FOCELH8Sz7lj7yPtMKjYlUQF3GFzfzjjg2t8jXH9ucEc2m0qP1aQ
         QucsdOC9Rmrt8ciaFMrXVwrUKdcbe2N9g7WS/deM9TzD2BcVECG+UZe9RZWR8/iXs6nP
         yuHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616401; x=1784221201;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V7xpiSqeInQmCCpQ2ynBS61txQNcQjjgq6PfjhT54YQ=;
        b=E69PLo+QXT3moxkQ5Ql4mhucznwl2NWScfFOgVeaqoFo2l8kt4dVbO8FK5HnorSJd9
         jNspUHcJFT8nuyweHmOlNjkvYBGnIKg40vXw8spnVPHfvSfMaslJHi61ZJM69G+IeCgb
         vuxI7hVbGvQgnpBZmo/Df81Xk2MM9cS04l3N07Q/FX+GTOe4OqQGhhgMTjrnm8G7KLQC
         JNobABRWmKhiKffkzftB2AECmfjhQh02Zh6tcdtBkr3mZJI2yU/c/cN+quqgJqfY4e/X
         G1pWIzWQv5vf+4FDZVlowTI+7hH2O3JUj0QgA+c993rhyuLBi7CbkxwY9Fmp9++zZShj
         aYhw==
X-Forwarded-Encrypted: i=1; AHgh+RpECw7RYaB27SqGpNQQI8E246wBInfllYNABnc4QGLP9RmQcBXFbFLnrPdGCu5U3yevemRCJX4q24bUeDKn6jy8@lists.infradead.org
X-Gm-Message-State: AOJu0YwzU68WRMO9D3GsIKjFfFNLW2GHgrN1lfDS+Ap3Imvszbvnkw36
	/0/fZ4qLwLVAwQlIJQUXwMjrYhkqqOIMxhcBXe0ELNJNRm2Pl2Jlzvvn+4o6dPcnbsU=
X-Gm-Gg: AfdE7cmx0GtRheukb8u01V+3Yo/LMVdtK74XGmCEd9mrUSpvPrmbEAxn8z8VRshbOxq
	GS0rE752iFtcbQMxx/64LpZXu4OmllIWYxCyVgveYcpBZ5Z7HSi8nD5payLOdicz9dH7zOHP0G3
	AOBfK6xDAnxPkGN+Cq8KjAy8Vach2cS97iymOiD4akCY0+JtNUdEDtMHmfO/YuJhtMrmggINSA2
	gYgHir2AwD5tQpj07Y8LDCN3BlnQMpCzmizlx+qIosDbO6pF1DPxzcxRqPll9i5jEXF5fG51Yfm
	UF4ovYFaRXvEZofIW3EdQmvj7YI3AJSfko1sIqqdT9ZDFYaeFuTPmBE+oSBAb728ibI81+eaEa3
	004V9vmykJFJXYcJUlF31jBHHmz1+rZ8N3vyGioWav7Th5pCQtpbEEKwg96+4qW1S2xpyOBn+9k
	7J34kV8gYXgAmYG2jpVlOX0D3TGbkD11/BFRTMPxdftfcQEYJNmr0CmZvoXtxcrIecw7YdVONfA
	pCK
X-Received: by 2002:a05:6000:2909:b0:476:504f:7a8 with SMTP id ffacd0b85a97d-47df081e2c4mr8751545f8f.55.1783616400988;
        Thu, 09 Jul 2026 10:00:00 -0700 (PDT)
Received: from localhost (p200300f65f47db043de98c19b374aa68.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3de9:8c19:b374:aa68])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9e4d780csm53200632f8f.11.2026.07.09.10.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:00:00 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	mfd@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 01/23] mfd: bcm2835-pm: Remove member of struct bcm2835_pm that is only used locally
Date: Thu,  9 Jul 2026 18:58:20 +0200
Message-ID: <5fdf1d0cc5a00e4a9aa68322bd2fca323b418dee.1783615311.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2363; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=1xIJ7j6GCqXs3V5UyxCknvTsa2XEwpXsBfO8oqhftBs=; b=owGbwMvMwMXY3/A7olbonx/jabUkhiz/y0Zd0x5Ha5ybNiGfffOCbO6Tn2cvqXVeymujVd4W3 OSwSiesk9GYhYGRi0FWTJHFvnFNplWVXGTn2n+XYQaxMoFMYeDiFICJTPNg/19+K53lc2fqJpse V4Mg0/Boqe+O520iROe/q0g2dlcqFQm6kM9tcF1kJU+d/HGT0LW5Xf5dk94s8f+hG3bkjJ5KRkx A9qNnwaEHn6xgW515nnHzxGfBK6ZvDooRvFzQFrpR+NF2hx8u0+u6s1Pn3GX9XLzqpHX13bj48/ 3GLzX7xPewsPVcXvq/M8ZQ+bjX5L8NK/6JPJ33X7V3amvkhwuazjMVcvbkyIYE7+U1zHB6fe5nu cRnsWYbl4fSxuu0unbMme2xtFf6a7CX6+o0hnM6G4/knjnFd/hftX1uRKgxd7KK9w2Zoqiscy9W p7nv8zty/mNPkN0R94aEhrvvPl1kPPypuKxh7rdDOlqFAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_100003_061006_E88AC550 
X-CRM114-Status: GOOD (  15.87  )
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

struct bcm2835_pm::soc is only used in bcm2835_pm_probe() and thus can be
replaced by a local variable.

With that change enum bcm2835_soc is only used in the mfd core driver and
so the definition can move there.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/bcm2835-pm.c       | 11 +++++++++--
 include/linux/mfd/bcm2835-pm.h |  7 -------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/bcm2835-pm.c b/drivers/mfd/bcm2835-pm.c
index 9e8e3dcf4bce..87de35075419 100644
--- a/drivers/mfd/bcm2835-pm.c
+++ b/drivers/mfd/bcm2835-pm.c
@@ -69,10 +69,17 @@ static int bcm2835_pm_get_pdata(struct platform_device *pdev,
 	return 0;
 }
 
+enum bcm2835_soc {
+	BCM2835_PM_SOC_BCM2835,
+	BCM2835_PM_SOC_BCM2711,
+	BCM2835_PM_SOC_BCM2712,
+};
+
 static int bcm2835_pm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct bcm2835_pm *pm;
+	enum bcm2835_soc soc;
 	int ret;
 
 	pm = devm_kzalloc(dev, sizeof(*pm), GFP_KERNEL);
@@ -81,7 +88,7 @@ static int bcm2835_pm_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, pm);
 
 	pm->dev = dev;
-	pm->soc = (uintptr_t)device_get_match_data(dev);
+	soc = (uintptr_t)device_get_match_data(dev);
 
 	ret = bcm2835_pm_get_pdata(pdev, pm);
 	if (ret)
@@ -98,7 +105,7 @@ static int bcm2835_pm_probe(struct platform_device *pdev)
 	 * bcm2835-pm binding as the key for whether we can reference
 	 * the full PM register range and support power domains.
 	 */
-	if (pm->asb || pm->soc == BCM2835_PM_SOC_BCM2712)
+	if (pm->asb || soc == BCM2835_PM_SOC_BCM2712)
 		return devm_mfd_add_devices(dev, -1, bcm2835_power_devs,
 					    ARRAY_SIZE(bcm2835_power_devs),
 					    NULL, 0, NULL);
diff --git a/include/linux/mfd/bcm2835-pm.h b/include/linux/mfd/bcm2835-pm.h
index d2e17ab1dbfc..f70a810c55f7 100644
--- a/include/linux/mfd/bcm2835-pm.h
+++ b/include/linux/mfd/bcm2835-pm.h
@@ -5,18 +5,11 @@
 
 #include <linux/regmap.h>
 
-enum bcm2835_soc {
-	BCM2835_PM_SOC_BCM2835,
-	BCM2835_PM_SOC_BCM2711,
-	BCM2835_PM_SOC_BCM2712,
-};
-
 struct bcm2835_pm {
 	struct device *dev;
 	void __iomem *base;
 	void __iomem *asb;
 	void __iomem *rpivid_asb;
-	enum bcm2835_soc soc;
 };
 
 #endif /* BCM2835_MFD_PM_H */
-- 
2.55.0.11.g153666a7d9bb


