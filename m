Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A571DCFD376
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 00:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uCNF53Li60QdPXxf/q2DlB7bjSdyWe25Wed4MJMg7yg=; b=Jk9dcgysmd2dF2VEoON5U/I8WY
	iG9JIn4POSpJucEZzLWmwmACW3JfgOL4gXhEOr4bqalHYfOEOvkHxPW50h5btnhbXd66wkXpe8v1m
	r197/1F2ma6aXL0GtR6PIM85eR1hnMu0OjbzTt7upIp32RWufFjNCngguCEGboOK5oK8phDAIQBhQ
	VLWJfdac/oH0/8lanJjjCqnCt8UoNgo9AuqdukUN+RT7xZlEF4W4WO5Jr+93SMMBKtxspEwskYyLT
	oklDEEbaSzpcLor356m6mg3M6HiOcOiineuiQF/H0uVngpK5g07W7OQOTID1oZlmG9kpaheed55UY
	GU6MwhCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPrSm-00000002hAZ-2aaX;
	Mon, 01 Dec 2025 00:08:20 +0000
Received: from out-189.mta0.migadu.com ([91.218.175.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPrSj-00000002h9a-26Ch
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 00:08:18 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1764547685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uCNF53Li60QdPXxf/q2DlB7bjSdyWe25Wed4MJMg7yg=;
	b=coaP8mReT1H7VX76ICiZUOitVVGjcUrWSnvZFHLeCLfv2BbATVaykMbq2LQRNsQqNuTH1D
	fNzipGLA/HIxuDPic5mDEF6AyfUUl+mxfjW9QQ+R9N2ncErc72vco0GGMlRbLZU3N1SbDw
	c5c6uI113EKlcXqaD2QDC2qjeJNM5ns=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-pm@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] thermal: broadcom: Use clamp() to simplify bcm2835_thermal_temp2adc()
Date: Mon,  1 Dec 2025 01:07:09 +0100
Message-ID: <20251201000714.74752-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_160817_695437_932795D7 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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

Use clamp() to simplify bcm2835_thermal_temp2adc() and improve its
readability. Explicitly cast BIT() to int to prevent a signedness error.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/thermal/broadcom/bcm2835_thermal.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/broadcom/bcm2835_thermal.c b/drivers/thermal/broadcom/bcm2835_thermal.c
index 685a5aee5e0d..c5105dfc6ec9 100644
--- a/drivers/thermal/broadcom/bcm2835_thermal.c
+++ b/drivers/thermal/broadcom/bcm2835_thermal.c
@@ -11,6 +11,7 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -80,12 +81,7 @@ static int bcm2835_thermal_temp2adc(int temp, int offset, int slope)
 	temp -= offset;
 	temp /= slope;
 
-	if (temp < 0)
-		temp = 0;
-	if (temp >= BIT(BCM2835_TS_TSENSSTAT_DATA_BITS))
-		temp = BIT(BCM2835_TS_TSENSSTAT_DATA_BITS) - 1;
-
-	return temp;
+	return clamp(temp, 0, (int)BIT(BCM2835_TS_TSENSSTAT_DATA_BITS) - 1);
 }
 
 static int bcm2835_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4


