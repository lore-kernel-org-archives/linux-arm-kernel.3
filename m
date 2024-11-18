Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B1DD49212
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 13:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8jWpUu0+gN6g2QC4B6zSiMqV9te+ZaKsIk2lVOXl6S0=; b=NDsWIuzb87PDXpMCCX4cm3NPAf
	HeUcZS3OZPkjQbbEYlP6R/UIn3O+06WcBdW7EnIoH8BXGNlAFshwowut/YTOQZfDx7sqq21gb0bn9
	ENdJPZBf7xe7hC1dg0gNjp9FpwfGuvB6hemgVyuS8qsHajTLDiIBL6AReyYOvD0cR9ZXjm0uxmab+
	lsv1deRDUiYjZ2gLoe/gEL2Ne6q0vQtrHVpg33Dx1Frj1CNIVu+VvTZOdTRwkyIzGy0tQL/Sfaqk2
	CDUd31MR25nOmE3J0zz80ACCMj4IATKq7KgkJHoif6fLEfeR55LOMjIRB15uxTWLMSjVyl08+vMV6
	kQRpQr/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1QO-00000009UH2-0d84;
	Mon, 18 Nov 2024 13:04:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1NY-00000009TJC-2XUM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 13:01:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1731934880; x=1763470880;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=KeW3AYf2jpvtv6/CK8M/J7DhmMsyVE7KO7tfyVKcTQM=;
  b=jEnYdbO89po+UZ2s/o0YusTTIc2ltpMaLmurxmTPUD7GLfKx81MDkZ6K
   fs3fNcDrkJZuM8LsqTxErAAuAwi4d+Mw2YotpBUeZsqHxgYvUq1umOgEU
   IX37bp19x65nWn1OS1uU2otSPQNbuCS/17zCh1kPrFeyvunNw7x7GfilJ
   wMyBhH/TB4rhy5cSXL8dyOLcgH2W/kaBIAATqFrJKz4kpVBWiWIgX3QXG
   aXC/9D4ZDYXLDfYP6eQEB6J3XFwX8HRgGfTpHBSPpzxgs3zxtexw+b3Dv
   jaRfwdm0qmcOxAday32GUQvRyICVTGZ3tZtqCGPBBurFvW3MVk6mW+Ed9
   A==;
X-CSE-ConnectionGUID: pV1s/Z6yQPOamzioY1xjCw==
X-CSE-MsgGUID: EZfMw2aTQUW42kAxXZYWhA==
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="34953029"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Nov 2024 06:01:17 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Nov 2024 06:00:59 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 18 Nov 2024 06:00:56 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Mon, 18 Nov 2024 14:00:47 +0100
Subject: [PATCH net-next v3 1/8] net: sparx5: do some preparation work
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241118-sparx5-lan969x-switch-driver-4-v3-1-3cefee5e7e3a@microchip.com>
References: <20241118-sparx5-lan969x-switch-driver-4-v3-0-3cefee5e7e3a@microchip.com>
In-Reply-To: <20241118-sparx5-lan969x-switch-driver-4-v3-0-3cefee5e7e3a@microchip.com>
To: <UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Lars
 Povlsen" <lars.povlsen@microchip.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, Russell King <linux@armlinux.org.uk>,
	<jacob.e.keller@intel.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_050120_708106_A9457DC6 
X-CRM114-Status: GOOD (  14.22  )
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

The sparx5_port_init() does initial configuration of a variety of
different features and options for each port. Some are shared for all
types of devices, some are not. As it is now, common configuration is
done after configuration of low-speed devices. This will not work when
adding RGMII support in a subsequent patch.

In preparation for lan969x RGMII support, move a block of code, that
configures 2g5 devices, down. This ensures that the configuration common
to all devices is done before configuration of 2g5, 5g, 10g and 25g
devices.

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Reviewed-by: Horatiu Vultur <horatiu.vultur@microchip.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../net/ethernet/microchip/sparx5/sparx5_port.c    | 36 +++++++++++-----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_port.c b/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
index 1401761c6251..c929b2a63386 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
@@ -1067,24 +1067,6 @@ int sparx5_port_init(struct sparx5 *sparx5,
 	if (err)
 		return err;
 
-	/* Configure MAC vlan awareness */
-	err = sparx5_port_max_tags_set(sparx5, port);
-	if (err)
-		return err;
-
-	/* Set Max Length */
-	spx5_rmw(DEV2G5_MAC_MAXLEN_CFG_MAX_LEN_SET(ETH_MAXLEN),
-		 DEV2G5_MAC_MAXLEN_CFG_MAX_LEN,
-		 sparx5,
-		 DEV2G5_MAC_MAXLEN_CFG(port->portno));
-
-	/* 1G/2G5: Signal Detect configuration */
-	spx5_wr(DEV2G5_PCS1G_SD_CFG_SD_POL_SET(sd_pol) |
-		DEV2G5_PCS1G_SD_CFG_SD_SEL_SET(sd_sel) |
-		DEV2G5_PCS1G_SD_CFG_SD_ENA_SET(sd_ena),
-		sparx5,
-		DEV2G5_PCS1G_SD_CFG(port->portno));
-
 	/* Set Pause WM hysteresis */
 	spx5_rmw(QSYS_PAUSE_CFG_PAUSE_START_SET(pause_start) |
 		 QSYS_PAUSE_CFG_PAUSE_STOP_SET(pause_stop) |
@@ -1108,6 +1090,24 @@ int sparx5_port_init(struct sparx5 *sparx5,
 		 ANA_CL_FILTER_CTRL_FILTER_SMAC_MC_DIS,
 		 sparx5, ANA_CL_FILTER_CTRL(port->portno));
 
+	/* Configure MAC vlan awareness */
+	err = sparx5_port_max_tags_set(sparx5, port);
+	if (err)
+		return err;
+
+	/* Set Max Length */
+	spx5_rmw(DEV2G5_MAC_MAXLEN_CFG_MAX_LEN_SET(ETH_MAXLEN),
+		 DEV2G5_MAC_MAXLEN_CFG_MAX_LEN,
+		 sparx5,
+		 DEV2G5_MAC_MAXLEN_CFG(port->portno));
+
+	/* 1G/2G5: Signal Detect configuration */
+	spx5_wr(DEV2G5_PCS1G_SD_CFG_SD_POL_SET(sd_pol) |
+		DEV2G5_PCS1G_SD_CFG_SD_SEL_SET(sd_sel) |
+		DEV2G5_PCS1G_SD_CFG_SD_ENA_SET(sd_ena),
+		sparx5,
+		DEV2G5_PCS1G_SD_CFG(port->portno));
+
 	if (conf->portmode == PHY_INTERFACE_MODE_QSGMII ||
 	    conf->portmode == PHY_INTERFACE_MODE_SGMII) {
 		err = sparx5_serdes_set(sparx5, port, conf);

-- 
2.34.1


