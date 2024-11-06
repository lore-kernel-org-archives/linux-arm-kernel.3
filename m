Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99781D59F6A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 19:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dxEDTPlM2IpuYqhtBqtKroudyhA7A4N9EbjmrO5BE3g=; b=R9Snm/CuZCDi5dBFS97ruMDrlC
	yY6sLa664gMWcm5U4RDi6lIjLbgUbLFReWL6xvpEhI0/U45hQ2rUTyLDkopyjNEYPsKW+nx74YOtS
	9QY2sTYdtI3AXtFZgzNFDQ251ZcfD3YRfQhbwqkLlpwdbpmiuesds+9QdjC6jCIDfMu5Pq83K6FJU
	DZ0aK73uxDm1UITsHjPI7CWKD7+cDGTrKSTzIlzLb5gQd1/x1YhhnmQvCRtnD9UZqDgu2F5lvoEXJ
	cscmXZ/wGoa07BB6oAScErc2P2p1FJeZCKdNyJhTGQzc8qiUUdcSwmQ+03/Qetb1ElXPDBnfWOW3S
	Z6QVit/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lkc-00000004WIA-1dLa;
	Wed, 06 Nov 2024 19:31:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lXh-00000004TPd-2vOU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 19:18:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1730920693; x=1762456693;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=oU863Kwn7GFPSRJfsJTS+xW4A//cqLjSy0be7pAvEak=;
  b=DELdUbZJ0ZOCJU8uuBIN2fRA9mseqHaOSTqAYjv+fNQKCLWUazbCoOjF
   5WASzSYpb+ScmDtOdnys4bFESgHkZ3L70M17X6CJ6y1AA5gQxvSPc6CXL
   vWHTJB+ipkMpbqYiEPg06r9G0om75HtjWGgUKpvF1HWObwT6dMzSbLx8p
   BJHD0Gfk+uO+dsAWoKI5uuGoN2pkubfm4zyXCzZfbNtQtk+Z/kCyPvIGV
   VfPIoaKYmcnSY4wu3mh2Wz1d7xLE/j1oGv/KFbljtu+z7hPJGYKuMZTDr
   etFnHdZcg00p52UIk7w0uvavVcrDOSxU/Kl8LWTL84m5U5K6fQLS/6Ncg
   Q==;
X-CSE-ConnectionGUID: ZmZl/QlxSRaWd1IoElCqFw==
X-CSE-MsgGUID: tmB5CBhDRj+1r6TTcTSFkQ==
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="34481087"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Nov 2024 12:18:13 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Nov 2024 12:17:05 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 6 Nov 2024 12:17:03 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Wed, 6 Nov 2024 20:16:39 +0100
Subject: [PATCH net-next 1/7] net: sparx5: do some preparation work
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241106-sparx5-lan969x-switch-driver-4-v1-1-f7f7316436bd@microchip.com>
References: <20241106-sparx5-lan969x-switch-driver-4-v1-0-f7f7316436bd@microchip.com>
In-Reply-To: <20241106-sparx5-lan969x-switch-driver-4-v1-0-f7f7316436bd@microchip.com>
To: <UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Lars
 Povlsen" <lars.povlsen@microchip.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, Russell King <linux@armlinux.org.uk>,
	<jacob.e.keller@intel.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_111813_879032_777BD278 
X-CRM114-Status: GOOD (  16.40  )
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

Also, expose the two symbols: SPX5_ETYPE_TAG_C and SPX5_ETYPE_TAG_S,
which will be needed by the lan969x RGMII configuration in a subsequent
patch.

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Reviewed-by: Horatiu Vultur <horatiu.vultur@microchip.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |  3 ++
 .../net/ethernet/microchip/sparx5/sparx5_port.c    | 39 ++++++++++------------
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
index 146bdc938adc..91ae383a5555 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
@@ -134,6 +134,9 @@ enum sparx5_feature {
 
 #define SPARX5_MAX_PTP_ID	512
 
+#define SPX5_ETYPE_TAG_C     0x8100
+#define SPX5_ETYPE_TAG_S     0x88a8
+
 struct sparx5;
 
 struct sparx5_calendar_data {
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_port.c b/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
index 1401761c6251..bb04c2ccf112 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
@@ -12,9 +12,6 @@
 #include "sparx5_main.h"
 #include "sparx5_port.h"
 
-#define SPX5_ETYPE_TAG_C     0x8100
-#define SPX5_ETYPE_TAG_S     0x88a8
-
 #define SPX5_WAIT_US         1000
 #define SPX5_WAIT_MAX_US     2000
 
@@ -1067,24 +1064,6 @@ int sparx5_port_init(struct sparx5 *sparx5,
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
@@ -1108,6 +1087,24 @@ int sparx5_port_init(struct sparx5 *sparx5,
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


