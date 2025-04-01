Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9739C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 23:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Cu6V6NEmkSty3UhsLZdMo8N/PEmpQ1XSn1YsQWDDSUQ=; b=iCSQp+lmOKUecN3qhlSfbmjmjN
	qRltlvRYylKH7Hai3VjyMqhTQonXYI9imkdbGzd4feAzygc8Hd80TY9oEA2h/z6rnyjbxf8w4+znK
	oMJgRQ9EFlvpx8zymXZ7NPNEeIzkqjHVGi+/e5mYnrz0WXJiN0DY32ImLaJK/XcAZQvVyLFLArYKL
	Rhta162kRrbuj30UghNTgsdwUE19EwA8R/+AwYn5X5OIWJ7qgTI44jdFP5RTDWbgo6+n/hH3yrZuK
	IjURl1UYOAdjFHYoWme9/24uFIvUxoZY+7f3XVEEqVF6Wqt5jA3F0yPLmNd5ySmwqOk1/KF69tOFK
	gx5fILfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzlB9-00000004cpU-47e2;
	Tue, 01 Apr 2025 23:37:59 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzl9Q-00000004cca-2Rs1;
	Tue, 01 Apr 2025 23:36:14 +0000
Received: from mail-acc-it-01.broadcom.com (mail-acc-it-01.acc.broadcom.net [10.35.36.83])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 7CD26C0025A2;
	Tue,  1 Apr 2025 16:36:10 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 7CD26C0025A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1743550570;
	bh=mAjA0JnWOIbx2Fv6Om83zFHlYcQyGvwfkcmAcNYO5Lk=;
	h=From:To:Cc:Subject:Date:From;
	b=S1a/Ccmd4KJy/A1kCM1cUD9k2tPpQYur3/oCQJlDeQLeh8q6UrtJbBZUE3cGc5YPG
	 79qMq0NFieuhe/iZGSNj35jknX1H45zb4ayyLpjzeHU+ePsDctdC+kuRKQMNREaT4x
	 P5e9HsfDKaFhnHbgaz2koP4Kg69yiCaHnqiLpvNc=
Received: from stbirv-lnx-1.igp.broadcom.net (stbirv-lnx-1.igp.broadcom.net [10.67.48.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-acc-it-01.broadcom.com (Postfix) with ESMTPSA id 8AB524002F44;
	Tue,  1 Apr 2025 19:36:09 -0400 (EDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Mark Brown <broonie@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-spi@vger.kernel.org (open list:SPI SUBSYSTEM),
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE)
Subject: [PATCH] spi: bcm2835: Restore native CS probing when pinctrl-bcm2835 is absent
Date: Tue,  1 Apr 2025 16:36:03 -0700
Message-Id: <20250401233603.2938955-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_163612_725007_5DC7ECAA 
X-CRM114-Status: GOOD (  18.59  )
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

The lookup table forces the use of the "pinctrl-bcm2835" GPIO chip
provider and essentially assumes that there is going to be such a
provider, and if not, we will fail to set-up the SPI device.

While this is true on Raspberry Pi based systems (2835/36/37, 2711,
2712), this is not true on 7712/77122 Broadcom STB systems which use the
SPI driver, but not the GPIO driver.

There used to be an early check:

       chip = gpiochip_find("pinctrl-bcm2835", chip_match_name);
       if (!chip)
               return 0;

which would accomplish that nicely, bring something similar back by
checking for the compatible strings matched by the pinctrl-bcm2835.c
driver, if there is no Device Tree node matching those compatible
strings, then we won't find any GPIO provider registered by the
"pinctrl-bcm2835" driver.

Fixes: 21f252cd29f0 ("spi: bcm2835: reduce the abuse of the GPIO API")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/spi/spi-bcm2835.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-bcm2835.c b/drivers/spi/spi-bcm2835.c
index a5d621b94d5e..5926e004d9a6 100644
--- a/drivers/spi/spi-bcm2835.c
+++ b/drivers/spi/spi-bcm2835.c
@@ -1226,7 +1226,12 @@ static int bcm2835_spi_setup(struct spi_device *spi)
 	struct bcm2835_spi *bs = spi_controller_get_devdata(ctlr);
 	struct bcm2835_spidev *target = spi_get_ctldata(spi);
 	struct gpiod_lookup_table *lookup __free(kfree) = NULL;
-	int ret;
+	const char *pinctrl_compats[] = {
+		"brcm,bcm2835-gpio",
+		"brcm,bcm2711-gpio",
+		"brcm,bcm7211-gpio",
+	};
+	int ret, i;
 	u32 cs;
 
 	if (!target) {
@@ -1291,6 +1296,14 @@ static int bcm2835_spi_setup(struct spi_device *spi)
 		goto err_cleanup;
 	}
 
+	for (i = 0; i < ARRAY_SIZE(pinctrl_compats); i++) {
+		if (of_find_compatible_node(NULL, NULL, pinctrl_compats[i]))
+			break;
+	}
+
+	if (i == ARRAY_SIZE(pinctrl_compats))
+		return 0;
+
 	/*
 	 * TODO: The code below is a slightly better alternative to the utter
 	 * abuse of the GPIO API that I found here before. It creates a
-- 
2.34.1


