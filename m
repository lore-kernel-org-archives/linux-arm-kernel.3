Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6219BC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 14:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/CCmG1GxGMYjK1pBoA+K9OycS51+5qtS5xym4iB2BW4=; b=mZHocuEvYlT2Ly4g7BtDFoungz
	IhYoE88l8L7kHC6Lbrn4MCqMoNWHrzwLK6bNHEBW/oWrLqom1P0+2PxMgvHQRe/296QvejrhhzBjk
	5/Ae0jhhQTVt1TeqH+QG9hhps30ovRdVohKTyy+02u3dMI6GNEaemI202u3YZfiWLQ3MgC612iZg4
	92MFXDRypVM8A+EnuOzLpdE6PVoYNnxhHh0YbbIAgyo8PS4dRH0HODusdpwYyVq1WxS9dnYCCFyB/
	DbSbCG/HmuT1wthVXyXM0qTMDMcNplDdkNDzW4DDVHVp4LZIav6Zm4+o5ZdGynSZ2aXi2S2j6n+7b
	4Yp7rJQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uArEy-00000002AbS-1Daf;
	Fri, 02 May 2025 14:19:48 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAr9O-000000029fS-0ytx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 14:14:04 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1uAr9K-0000sL-7p
	for linux-arm-kernel@lists.infradead.org; Fri, 02 May 2025 16:13:58 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1uAr9K-000lP3-05
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 16:13:58 +0200
Received: from dspam.blackshift.org (localhost [127.0.0.1])
	by bjornoya.blackshift.org (Postfix) with SMTP id B20ED4065AC
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 14:13:57 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bjornoya.blackshift.org (Postfix) with ESMTPS id E74FA4065A0;
	Fri, 02 May 2025 14:13:56 +0000 (UTC)
Received: from hardanger.blackshift.org (localhost [::1])
	by hardanger.blackshift.org (OpenSMTPD) with ESMTP id de45ef16;
	Fri, 2 May 2025 14:13:56 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Fri, 02 May 2025 16:13:46 +0200
Subject: [PATCH 3/3] can: mcan: m_can_class_unregister: fix order of
 unregistration calls
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-can-rx-offload-del-v1-3-59a9b131589d@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1395; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=Q5aUEap/j8onzIWPM9KgOWl8xHnHPU8XimRr1awIUwI=;
 b=owEBbQGS/pANAwAKAQx0Zd/5kJGcAcsmYgBoFNMh3UbqdYlr7CYNpBI0bFUBQXmQiPOeOyZrU
 g8+euFtBeaJATMEAAEKAB0WIQSf+wzYr2eoX/wVbPMMdGXf+ZCRnAUCaBTTIQAKCRAMdGXf+ZCR
 nPHaB/97GcHyND3HHSgiFPYIWFmO62VdzZbPx/n1WNPQt1+uqtw6LMICf3+QNpl8SOJVJJFj2SV
 TRg60q5Yo8pEZWbfVp6/Buppex7/67VKXM7BBTd9Q2Htu6g0O8WNBLXU9yPeIn74/rju2WhuVvz
 jJXwsVpuSCH98sk2UdAZVlyamEy2Gn3nwAbWZSmk8ansBmAlO4YCnWIqzraIuB1ChMseY/LsNyl
 6GauScLC3qQGpZV+OgcI11FsiBak3FQcC/2pjGqQLtWZ0gityXXQiOSbvJg40uCNnwN6N0kAnO7
 pk4Oo43gTPDZyYIDfIGtkX3asiE4A5y8xEQvHwsrEYwmJOBW
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_071402_280954_DE69F741 
X-CRM114-Status: GOOD (  16.02  )
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

Fixes: 1be37d3b0414 ("can: m_can: fix periph RX path: use rx-offload to ensure skbs are sent from softirq context")
Cc: stable@vger.kernel.org
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 drivers/net/can/m_can/m_can.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/can/m_can/m_can.c b/drivers/net/can/m_can/m_can.c
index 884a6352c42b..7c430eaff5dd 100644
--- a/drivers/net/can/m_can/m_can.c
+++ b/drivers/net/can/m_can/m_can.c
@@ -2462,9 +2462,9 @@ EXPORT_SYMBOL_GPL(m_can_class_register);
 
 void m_can_class_unregister(struct m_can_classdev *cdev)
 {
+	unregister_candev(cdev->net);
 	if (cdev->is_peripheral)
 		can_rx_offload_del(&cdev->offload);
-	unregister_candev(cdev->net);
 }
 EXPORT_SYMBOL_GPL(m_can_class_unregister);
 

-- 
2.47.2



