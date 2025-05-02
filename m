Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D52C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 14:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmAbOf32zhYHE3dfYejDfUxEGu+f8WK+3rcn/YPQiwE=; b=f4HsB7Fv6uZtM0tUe8M6y2nOa9
	Nuw1qE7HgN4NFwXSnhyqlcmOaSwpbiW+tGq9EZVaKMCDDqvmiVgDwBMlgPzLlOHI40Tyj9Y5Cv0Ju
	lIWolsw07VAsPuok3QxPV3P0cPVWaRVvWlLNS21gkD3WzOnGBW/l947kO1KDp5oTb+IqU76Ut5nL/
	YLZfWYr4aJdhZ6rmAkh2OU8dEjImHL3viNoeQ8FSn5q6mrX/D9G7sUFLahuMBmJ2TcZqWIShBLGCj
	XhDlzAI34TnEvbuIdbILeE1OS39pkpvDVanG6ej1CntV/Rh2PQp1BBAcLE5W6j0JR+EhymfS/ON/a
	n+SPPBbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uArGt-00000002Arj-1Eq7;
	Fri, 02 May 2025 14:21:47 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAr9O-000000029fP-1mk2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 14:14:04 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1uAr9K-0000rx-2r
	for linux-arm-kernel@lists.infradead.org; Fri, 02 May 2025 16:13:58 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1uAr9J-000lOp-2k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 16:13:57 +0200
Received: from dspam.blackshift.org (localhost [127.0.0.1])
	by bjornoya.blackshift.org (Postfix) with SMTP id 843854065A9
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 14:13:57 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bjornoya.blackshift.org (Postfix) with ESMTPS id ABE3140659D;
	Fri, 02 May 2025 14:13:56 +0000 (UTC)
Received: from hardanger.blackshift.org (localhost [::1])
	by hardanger.blackshift.org (OpenSMTPD) with ESMTP id 39826ef2;
	Fri, 2 May 2025 14:13:56 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Fri, 02 May 2025 16:13:44 +0200
Subject: [PATCH 1/3] can: mcp251xfd: mcp251xfd_remove(): fix order of
 unregistration calls
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-can-rx-offload-del-v1-1-59a9b131589d@pengutronix.de>
References: <20250502-can-rx-offload-del-v1-0-59a9b131589d@pengutronix.de>
In-Reply-To: <20250502-can-rx-offload-del-v1-0-59a9b131589d@pengutronix.de>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Thomas Kopp <thomas.kopp@microchip.com>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, kernel@pengutronix.de, 
 Heiko Stuebner <heiko@sntech.de>, 
 Chandrasekar Ramakrishnan <rcsekar@samsung.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>
Cc: linux-can@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Marc Kleine-Budde <mkl@pengutronix.de>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-048ad
X-Developer-Signature: v=1; a=openpgp-sha256; l=1617; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=Ti5fQqNL3/P0T43KCHmLdTJn2MrwLdnaKDWpyP6L+Yc=;
 b=owEBbQGS/pANAwAKAQx0Zd/5kJGcAcsmYgBoFNMbpz87OapaXKbWzF12J12gplVe/ENOKMJGg
 nwet94JJKqJATMEAAEKAB0WIQSf+wzYr2eoX/wVbPMMdGXf+ZCRnAUCaBTTGwAKCRAMdGXf+ZCR
 nBROB/0Ze9IdyFTWggQdVTIu7SikDc1++C+nVmbgh321px4R70xNq4/ln8+Rw4sla7liUoPagWP
 3FJEAS1wj/DM70+eZB7scbK3ySgrZ0kAtGAi4Cp1oy/YW+alOVrPU2kNOZiYD1D71/9cBE1Cg59
 tbXpe4vM3sP5fqCdXwV2cbSP/v5pe4x/bselx2ooObNKZCHhWm++PFf6kBRghaTQ2CH+XHkI7ro
 aRaAC85CqcLwvt3sZ0R1cyuT3VYPUc8IjJdIFoLvGRizHX1wzxMAtYEv2QxS0tBDVQup/BCKqNn
 fkIQXk/hmhYmATC8GIzHfJmHn7bTGvWSdJSTyDNn+do/gu73
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_071402_497270_BCBD6665 
X-CRM114-Status: GOOD (  17.09  )
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

If a driver is removed, the driver framework invokes the driver's
remove callback. A CAN driver's remove function calls
unregister_candev(), which calls net_device_ops::ndo_stop further down
in the call stack for interfaces which are in the "up" state.

With the mcp251xfd driver the removal of the module causes the
following warning:

| WARNING: CPU: 0 PID: 352 at net/core/dev.c:7342 __netif_napi_del_locked+0xc8/0xd8

as can_rx_offload_del() deletes the NAPI, while it is still active,
because the interface is still up.

To fix the warning, first unregister the network interface, which
calls net_device_ops::ndo_stop, which disables the NAPI, and then call
can_rx_offload_del().

Fixes: 55e5b97f003e ("can: mcp25xxfd: add driver for Microchip MCP25xxFD SPI CAN")
Cc: stable@vger.kernel.org
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c b/drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c
index 3bc56517fe7a..dd0b3fb42f1b 100644
--- a/drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c
+++ b/drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c
@@ -2174,8 +2174,8 @@ static void mcp251xfd_remove(struct spi_device *spi)
 	struct mcp251xfd_priv *priv = spi_get_drvdata(spi);
 	struct net_device *ndev = priv->ndev;
 
-	can_rx_offload_del(&priv->offload);
 	mcp251xfd_unregister(priv);
+	can_rx_offload_del(&priv->offload);
 	spi->max_speed_hz = priv->spi_max_speed_hz_orig;
 	free_candev(ndev);
 }

-- 
2.47.2



