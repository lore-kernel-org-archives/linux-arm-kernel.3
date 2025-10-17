Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB21CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 15:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y5McXCLjrbzu1IBDic9hkOXLJ0a5/z+JJFH6TqUC828=; b=FK0Q0dwKZRoTlAAnIyUybRMQvJ
	HD7yMsHhDxyj/yqzE9MKE/G4/X607V3Q2WDNYYHseZTGJhRBeq+eWzhjCif6tAhaFUfnzTFW98sdC
	b8jhWW6wWHk28RrZF0IzkpOc5sknYauXCuh4v29K7MMoBEx47orOr1ARXOJv/g2uHiJ107oCQLoNp
	BObkQZmcQQozKU6WCugJLTngf5CKrwvTfNrRgObcVkodQtdkRD+UdNZl916YhmlgNrcTwAVkWPqO9
	T0GNKBJMwcX1Un8Ge/Zmkk8pSScvUYwqstL/qgpF1yZDt+K0FrFmTyJ7BOpncupd5gWZ/gQr3+EIA
	ZX7YsS4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9lwX-00000008Bka-3Z0D;
	Fri, 17 Oct 2025 15:00:33 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9lwQ-00000008BbV-2fMb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 15:00:29 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1v9lwJ-00028F-Pd; Fri, 17 Oct 2025 17:00:19 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1v9lwJ-0044jZ-0N;
	Fri, 17 Oct 2025 17:00:19 +0200
Received: from hardanger.blackshift.org (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id C0D6A48928B;
	Fri, 17 Oct 2025 15:00:18 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Fri, 17 Oct 2025 17:00:01 +0200
Subject: [PATCH can 3/3] can: rockchip-canfd: rkcanfd_start_xmit(): use
 can_dev_dropped_skb() instead of can_dropped_invalid_skb()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-fix-skb-drop-check-v1-3-556665793fa4@pengutronix.de>
References: <20251017-fix-skb-drop-check-v1-0-556665793fa4@pengutronix.de>
In-Reply-To: <20251017-fix-skb-drop-check-v1-0-556665793fa4@pengutronix.de>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Vincent Mailhol <mailhol@kernel.org>, 
 Oliver Hartkopp <socketcan@hartkopp.net>, 
 =?utf-8?q?Stefan_M=C3=A4tje?= <stefan.maetje@esd.eu>, socketcan@esd.eu, 
 Heiko Stuebner <heiko@sntech.de>
Cc: kernel@pengutronix.de, linux-can@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Marc Kleine-Budde <mkl@pengutronix.de>
X-Mailer: b4 0.15-dev-2196b
X-Developer-Signature: v=1; a=openpgp-sha256; l=1226; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=do8Wgxd/SePEpeQkAsWrN+ulD9bfSWdKS4T6ApEwOUo=;
 b=owEBbQGS/pANAwAKAQx0Zd/5kJGcAcsmYgBo8loAzlnTFkscuFLWoJevL9wZCAxD/XhVtKVyT
 9cJR3/TvYyJATMEAAEKAB0WIQSf+wzYr2eoX/wVbPMMdGXf+ZCRnAUCaPJaAAAKCRAMdGXf+ZCR
 nFH3B/9qk6/QRm+Ue+6x+T4+qzokomC+tS3HS7duJg/kTEO0kLDl0XBKzZ8c3pRByh+d6fNMbHc
 RYV3oGCG6S6P5FokWoSfxTxb2S0KdrpooyWsiOagVv2RDy9qWlzr9GG+IFqF4tXB4InOKq+rcts
 MfayrVhn1ONZxd+WkCIxVEgZ7EsiJfEz57jFqJ2/S7xH04URxxmSwYj5WwJ0tMSAwHHn6X3vJ1v
 OLuZwfKs4GFwihpejvX5cx0dKmQOZZveBwM+UJ8bmFfOYJ0+X3FQpwM9poSR7HUvn1WZ7ReuPFa
 l+dtdTeUuQmTFx7LqiYzUSPxju6tTkf/ciJFQSWKfgkN4z/2
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_080026_680992_885834EF 
X-CRM114-Status: GOOD (  13.04  )
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

In addition to can_dropped_invalid_skb(), the helper function
can_dev_dropped_skb() checks whether the device is in listen-only mode and
discards the skb accordingly.

Replace can_dropped_invalid_skb() by can_dev_dropped_skb() to also drop
skbs in for listen-only mode.

Reported-by: Marc Kleine-Budde <mkl@pengutronix.de>
Closes: https://lore.kernel.org/all/20251017-bizarre-enchanted-quokka-f3c704-mkl@pengutronix.de/
Fixes: ff60bfbaf67f ("can: rockchip_canfd: add driver for Rockchip CAN-FD controller")
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 drivers/net/can/rockchip/rockchip_canfd-tx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/can/rockchip/rockchip_canfd-tx.c b/drivers/net/can/rockchip/rockchip_canfd-tx.c
index 865a15e033a9..12200dcfd338 100644
--- a/drivers/net/can/rockchip/rockchip_canfd-tx.c
+++ b/drivers/net/can/rockchip/rockchip_canfd-tx.c
@@ -72,7 +72,7 @@ netdev_tx_t rkcanfd_start_xmit(struct sk_buff *skb, struct net_device *ndev)
 	int err;
 	u8 i;
 
-	if (can_dropped_invalid_skb(ndev, skb))
+	if (can_dev_dropped_skb(ndev, skb))
 		return NETDEV_TX_OK;
 
 	if (!netif_subqueue_maybe_stop(priv->ndev, 0,

-- 
2.51.0


