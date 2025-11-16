Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB789CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 15:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0E09kqI1k/eMfbnVlX1vuJnVfT3Vn/3ogwcFhnHFvoU=; b=PgfI/gVG5nz4lrczvi1QvvcqxQ
	GOV93fbTHuz3Z1f0H8lOMrfsDWezB2PLexzcUMCwr2mPqB11rPfDvVMBVqQpiGJk/6g/hnEWMtYMh
	h1AmR+4fBMcrxgVJanCtS8l2GJBjDy1qBKrbQ+GsLPZB/45u+ITBzK+KWY+o34Gd5opLYukyp9nfZ
	zyhr757lSwRPq0DomVulPa72u2saEn6zENbEZgQ20AeSXijTvSRx8ZGBkK9feplRgYHXH3H8Y5b9H
	jr2/Zr4fe4k//QvN8atiaIqDV3x088O7WnMJ31xQHa+MznGrGgCEUKRQQCc80ieYWr3gwwwVwY+1o
	MoZaWCkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKf6Y-0000000EofW-190o;
	Sun, 16 Nov 2025 15:55:54 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKf6U-0000000Eoea-3Wyr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 15:55:52 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vKf6H-0006Dx-Vl; Sun, 16 Nov 2025 16:55:37 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vKf6G-000lfs-22;
	Sun, 16 Nov 2025 16:55:36 +0100
Received: from hardanger.blackshift.org (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 514694A0D69;
	Sun, 16 Nov 2025 15:55:36 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Sun, 16 Nov 2025 16:55:26 +0100
Subject: [PATCH can] can: sun4i_can: sun4i_can_interrupt(): fix max irq
 loop handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251116-sun4i-fix-loop-v1-1-3d76d3f81950@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAO7zGWkC/x2MQQqAIBAAvyJ7bqGVFOor0cFsq4XQUIpA+nvSc
 RhmCmROwhkGVSDxLVliqECNAr+7sDHKUhl0qw0RWcxX6ARXefCI8cRVW2M1zdb1PdToTFzdPxz
 BuwDT+36eMwq4ZQAAAA==
X-Change-ID: 20251116-sun4i-fix-loop-f265621b6a99
To: Vincent Mailhol <mailhol@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Gerhard Bertelsmann <info@gerhard-bertelsmann.de>, 
 Maxime Ripard <mripard@kernel.org>
Cc: kernel@pengutronix.de, linux-can@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 =?utf-8?q?Thomas_M=C3=BChlbacher?= <tmuehlbacher@posteo.net>, 
 Marc Kleine-Budde <mkl@pengutronix.de>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1639; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=piiZABcIkPvCH85m5XqijCtUq+SBcVfDPS3VKibeIzs=;
 b=owEBbQGS/pANAwAKAQx0Zd/5kJGcAcsmYgBpGfP1O2x1G+zpjpRJjKaXo54TmBgwthKqzmzGq
 fbf/sJiZTiJATMEAAEKAB0WIQSf+wzYr2eoX/wVbPMMdGXf+ZCRnAUCaRnz9QAKCRAMdGXf+ZCR
 nJaoB/4rjKBfJJSDQ4zQgHs1guSEV6YizBk5eiUmnvir8afm7j3J8t8qoG8bzJM8kaQ41q21AtI
 7NqTPanSTdclNme3HWvizX4SWZFi4TRxMIy4Mw+3sO3nuXCtVN+vwr6pBKhqQZELQ8fPrOMvZli
 xmK/aJhJKiPZp2vm8raNr5WhWDPrTtVkftP2TM8MnYCLbNG2aCPbxjb55KPpc4EMxvQUkdjdyCp
 eNzWiqHIMRpjXWSwVtqhAy1IUqjm/m03ywNMA+kar6PQCgEwsSGgTBDD9Vg/hbQMWp/42Z5QDTT
 K81IIXmX1yuSs0lberkstH0VPRbX/9FvRoIE8RPdQ23NC+89
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_075550_902745_729DBE98 
X-CRM114-Status: GOOD (  13.99  )
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

Reading the interrupt register `SUN4I_REG_INT_ADDR` causes all of its bits
to be reset. If we ever reach the condition of handling more than
`SUN4I_CAN_MAX_IRQ` IRQs, we will have read the register and reset all its
bits but without actually handling the interrupt inside of the loop body.

This may, among other issues, cause us to never `netif_wake_queue()` again
after a transmission interrupt.

Fixes: 0738eff14d81 ("can: Allwinner A10/A20 CAN Controller support - Kernel module")
Cc: stable@vger.kernel.org
Co-developed-by: Thomas Mühlbacher <tmuehlbacher@posteo.net>
Signed-off-by: Thomas Mühlbacher <tmuehlbacher@posteo.net>
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
I've ported the fix from the sja1000 driver to the sun4i_can, which based
on the sja1000 driver.
---
 drivers/net/can/sun4i_can.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/can/sun4i_can.c b/drivers/net/can/sun4i_can.c
index 53bfd873de9b..0a7ba0942839 100644
--- a/drivers/net/can/sun4i_can.c
+++ b/drivers/net/can/sun4i_can.c
@@ -657,8 +657,8 @@ static irqreturn_t sun4i_can_interrupt(int irq, void *dev_id)
 	u8 isrc, status;
 	int n = 0;
 
-	while ((isrc = readl(priv->base + SUN4I_REG_INT_ADDR)) &&
-	       (n < SUN4I_CAN_MAX_IRQ)) {
+	while ((n < SUN4I_CAN_MAX_IRQ) &&
+	       (isrc = readl(priv->base + SUN4I_REG_INT_ADDR))) {
 		n++;
 		status = readl(priv->base + SUN4I_REG_STA_ADDR);
 

---
base-commit: 5442a9da69789741bfda39f34ee7f69552bf0c56
change-id: 20251116-sun4i-fix-loop-f265621b6a99

Best regards,
--  
Marc Kleine-Budde <mkl@pengutronix.de>


