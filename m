Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D25BC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 19:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+p8wEaEewSd5thikZSP5dZv5aport/wNF3V4IdekTso=; b=gjvhW2tgZ8ueJPLr66R8ANPKZT
	0268NoTXXpQXv4aRWheuj929F6CEfiTJH6qwpz2F2cFpvfooRcxMLq8t3miqkfF6DPRomIYh/rLLC
	l/1ObIJZPjBZL5NHsjEEPkYRLyhEZvF2/lp5/Rr36PXy2JK7s6vqg6OZ9wwECoqKJRtYkuvyXG5Zw
	L36xnMrq+y4ZigjJ8vTqSV6Bb6ClcK4Y3pq6fIdTD+IVQjU3CpDCUbdXhFAF00EUT8J/J+ar+6D8s
	jConVw43nSiBaCJCI/uwoDYhyrOZ7iFYswnpdYqTIt2L7AO1cTNgpJtMFdBEYdOGxI5MBmkgAUZXw
	z1TvOkag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYVr8-0000000FwJb-3c87;
	Thu, 16 Jan 2025 19:48:42 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYVnQ-0000000FvaC-1FD4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 19:44:54 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 6AA36C004305;
	Thu, 16 Jan 2025 11:44:50 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 6AA36C004305
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1737056690;
	bh=IcjiODguC40y78u4uqPvE4L9y/vTL7BHxqp7PNXf8UI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=akHQe3vngF/Tinu8bCQyyaUSzR1V3VZM4bmGXvCrKAXLU/SON6FLTz1OHD3LXsfTS
	 dwqnUyhzzQkg+xBus5kKBqWJ0q3Yu/je2mHvA9bx13+kTTz1BSfdyQjsmwf1IsMS3j
	 Onio1Eq4EDoTfzNgcN6et91nRPAAX3dBIZ8sBYd4=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id EA1EA18041CAD2;
	Thu, 16 Jan 2025 11:44:49 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Markus Mayer <mmayer@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-pm@vger.kernel.org (open list:BROADCOM STB AVS TMON DRIVER),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH 2/2] thermal: brcmstb_thermal: Add support for BCM74110
Date: Thu, 16 Jan 2025 11:38:42 -0800
Message-ID: <20250116193842.758788-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250116193842.758788-1-florian.fainelli@broadcom.com>
References: <20250116193842.758788-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_114452_491723_1C4DFFFF 
X-CRM114-Status: GOOD (  13.45  )
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

BCM74110 uses a different process node compared to previous chips that
requires a different equation, account for that.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/thermal/broadcom/brcmstb_thermal.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/broadcom/brcmstb_thermal.c b/drivers/thermal/broadcom/brcmstb_thermal.c
index 270982740fde..f46f2ddc174e 100644
--- a/drivers/thermal/broadcom/brcmstb_thermal.c
+++ b/drivers/thermal/broadcom/brcmstb_thermal.c
@@ -286,14 +286,20 @@ static int brcmstb_set_trips(struct thermal_zone_device *tz, int low, int high)
 	return 0;
 }
 
-static const struct thermal_zone_device_ops brcmstb_16nm_of_ops = {
+static const struct thermal_zone_device_ops brcmstb_of_ops = {
 	.get_temp	= brcmstb_get_temp,
 };
 
+static const struct brcmstb_thermal_params brcmstb_8nm_params = {
+	.offset	= 418670,
+	.mult	= 509,
+	.of_ops	= &brcmstb_of_ops,
+};
+
 static const struct brcmstb_thermal_params brcmstb_16nm_params = {
 	.offset	= 457829,
 	.mult	= 557,
-	.of_ops	= &brcmstb_16nm_of_ops,
+	.of_ops	= &brcmstb_of_ops,
 };
 
 static const struct thermal_zone_device_ops brcmstb_28nm_of_ops = {
@@ -308,6 +314,7 @@ static const struct brcmstb_thermal_params brcmstb_28nm_params = {
 };
 
 static const struct of_device_id brcmstb_thermal_id_table[] = {
+	{ .compatible = "brcm,avs-tmon-bcm74110", .data = &brcmstb_8nm_params },
 	{ .compatible = "brcm,avs-tmon-bcm7216", .data = &brcmstb_16nm_params },
 	{ .compatible = "brcm,avs-tmon", .data = &brcmstb_28nm_params },
 	{},
-- 
2.43.0


