Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7DFC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 14:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sYrYrkNOortt4zG5RN2BZmwFtyXOovuTBoX7tmUX9BQ=; b=wQQBPJ16C7w6o+fyYUU1Es0LBo
	E3sd1Dxuv/rUqFQZ8wYoQmQqFobZIlcxU2s80mOk6SaPdv1kohMB2K3X7mFEFKKgtpzw5FA2kw2kq
	Bg/ZycCr3/r5AjtT19ZRv4/S3l+1kCEmTsytkZ+Kr6qlxzyvYPenu+C0/YD4Ge25wn1ZO9sKnI+n4
	dbTNsXYKtJnAg4etc3DL4Sd8h41AwiIza2tvkSJPICHycu978EG/NUgeR0AL5aJXuG1Cbwi41+INw
	jrKbFizeCpLnGmv51Qw+DLnGEKCpYM2ku/ir+gNk/ZmhLwKUYkw1XaW3njB4xZrH2+sTRPfnYmdcQ
	H2vdQ/YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uArIo-00000002B4x-082v;
	Fri, 02 May 2025 14:23:46 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAr9O-000000029fR-20n3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 14:14:04 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1uAr9K-0000s5-5s
	for linux-arm-kernel@lists.infradead.org; Fri, 02 May 2025 16:13:58 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1uAr9J-000lOy-31
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 16:13:57 +0200
Received: from dspam.blackshift.org (localhost [127.0.0.1])
	by bjornoya.blackshift.org (Postfix) with SMTP id A17484065AB
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 14:13:57 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bjornoya.blackshift.org (Postfix) with ESMTPS id C8D7840659F;
	Fri, 02 May 2025 14:13:56 +0000 (UTC)
Received: from hardanger.blackshift.org (localhost [::1])
	by hardanger.blackshift.org (OpenSMTPD) with ESMTP id 2f2dab4b;
	Fri, 2 May 2025 14:13:56 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Fri, 02 May 2025 16:13:45 +0200
Subject: [PATCH 2/3] can: rockchip_canfd: m_can_class_unregister: fix order
 of unregistration calls
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-can-rx-offload-del-v1-2-59a9b131589d@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1452; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=5nFrpQd9CUa012/GckQTi/lhWF6yzNe/Y2s7EnVqJ/g=;
 b=owEBbQGS/pANAwAKAQx0Zd/5kJGcAcsmYgBoFNMeP4LWFCBDYcQbczXAXiVIxU95CWbmX7+W/
 wOU0gSWp1GJATMEAAEKAB0WIQSf+wzYr2eoX/wVbPMMdGXf+ZCRnAUCaBTTHgAKCRAMdGXf+ZCR
 nCn0B/0UMKR2GTxZ/k7J5SU8yW/Bhib/H3TGkg7426M95DLuHIPgf8B6VWddUWQAikF6m/DfuvL
 vLIy/2LqUeBT7O2b+aKjH7MOYKCGekmmtJLyJBIwNapj7kxahfmdkLIQlKjA5RR3WiHkW+as5+2
 5ASOR93haIYNulqKd2CmRh072BXfZOMe+37ykvupQ/IKQMEQz67Vbc931Ht2Fuml4oZnY73g2LO
 WqAMfEpvrCeM1rLeWhCOS8O7hfLg2wAPsOl1MiukX8qwGyUyJWWiWmtSmy1dWfXqQ8pHT/wMlZr
 /AxjoZCWiNoN2t2DQCJhPd3pN1etMVw7k/Kis3xHfXZnpa4+
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_071402_538750_B247530C 
X-CRM114-Status: GOOD (  17.16  )
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

The removal of the module causes the a warning, as
can_rx_offload_del() deletes the NAPI, while it is still active,
because the interface is still up.

To fix the warning, first unregister the network interface, which
calls net_device_ops::ndo_stop, which disables the NAPI, and then call
can_rx_offload_del().

Fixes: ff60bfbaf67f ("can: rockchip_canfd: add driver for Rockchip CAN-FD controller")
Cc: stable@vger.kernel.org
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 drivers/net/can/rockchip/rockchip_canfd-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/can/rockchip/rockchip_canfd-core.c b/drivers/net/can/rockchip/rockchip_canfd-core.c
index 7107a37da36c..c3fb3176ce42 100644
--- a/drivers/net/can/rockchip/rockchip_canfd-core.c
+++ b/drivers/net/can/rockchip/rockchip_canfd-core.c
@@ -937,8 +937,8 @@ static void rkcanfd_remove(struct platform_device *pdev)
 	struct rkcanfd_priv *priv = platform_get_drvdata(pdev);
 	struct net_device *ndev = priv->ndev;
 
-	can_rx_offload_del(&priv->offload);
 	rkcanfd_unregister(priv);
+	can_rx_offload_del(&priv->offload);
 	free_candev(ndev);
 }
 

-- 
2.47.2



