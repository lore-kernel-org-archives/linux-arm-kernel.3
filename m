Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A664BC79F87
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 12:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tmsC7tVniwT8Wa+M6xzLWHZmhRLH7ixcu3nderl3sVI=; b=qm2XZiIRdFMb1/J4vuJ7WgsOZc
	yiEwrZ7gI5fMYA33em0ZvnbuugD6C/TF3yTmP0WBDWhzuBtLBy5Y+oTw3GLMWCHAqbmo8A01070p3
	TGGQYPzRrybg+MQuKoZoNRS3fg8jsje8TeXGjIoTpuKiWfgKUs89WviUw4c0rsmpB5MPQItBpjHut
	eqBH2l2csEciJ8ETYGT5yMGsOc9IMnGCcyYI7hkxZi7YxjMlNNC6oRoK2dTYACS77BuikvL1PXFJQ
	V2LVkO79ibLQgDDWU96r7OGQs8kYyVZvxSbay3+d8fiauc0IJn1tPqqOpAtn1W8uNMWk/xKyyx7zU
	MUYK9bNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjSm-0000000BG2d-2JRH;
	Mon, 05 Jan 2026 12:13:33 +0000
Received: from out-183.mta1.migadu.com ([2001:41d0:203:375::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjSk-0000000BFza-3MJw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 12:13:32 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767615195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tmsC7tVniwT8Wa+M6xzLWHZmhRLH7ixcu3nderl3sVI=;
	b=CJC3xu91f8z5MbjqZWTN3ji6eUc+2M8SkU0lULgvVcv6kFMaSlzxBLzNIhAC1dYxF3/KX6
	UTBWDtRTNwYgWUnrm/MXi8TuxktMs62H0KvoeTthaM18dO1zh8BKT4DUs6DKYYedTqMt6r
	a4sdCA8V2JqI8UMjf9ATjdLy3bZWDko=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-pm@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] thermal: broadcom: Use clamp to simplify bcm2835_thermal_temp2adc
Date: Mon,  5 Jan 2026 13:13:03 +0100
Message-ID: <20260105121308.1761-1-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_041330_970404_340325D5 
X-CRM114-Status: UNSURE (   9.50  )
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

