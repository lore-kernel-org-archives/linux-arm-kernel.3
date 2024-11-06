Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9C4D59F6B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 19:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jueOCmo2sbGBqTTNKcZATjiyGHKsbp0HDxDy+PaMIb0=; b=mJ7TdClspZAcTXnG/TwaazlVzo
	zfovJrKtZJ+5WTz3+B/0WwJ1GMxXnHn1KyWCKw8AfJ0kf6zS6Hse31cnI19H+KO7U3fcVxTjziAB1
	alvY2A2BWLxh03vDisYhz0HXevfV2eRRT1SW/qv+Onw8D4E9fQL+qsFbS0vokXpmWp71cQS57O35l
	iAanyYwpcafuhlG3E5wnshI4lbxh8GiihE8BbvxGs8Od0t4VQfhWDEHxZsCz6cVyvJqofaPcyIn7h
	0mLodyx0OCv06ounlwtjGY+dUXznlrYAINoFqB2B29UQm9xAkrvmdQe/t6tt6K1JLZhkLwWomAMtw
	Js/PBMJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lit-00000004Vww-2zs8;
	Wed, 06 Nov 2024 19:29:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lXL-00000004TIC-2ZEl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 19:17:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1730920671; x=1762456671;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=oUwJ+FCZePBc7/upX3mDxs2QlaWyc4n9jjTguyvbq64=;
  b=1uydF8w9Cm+dWDt481Y/JxvlYNwW5Hrf3GcNf/b/tZqZdb5tzAwGfVam
   QrvVRZ8VntcDflh+svM5MgzSD/PbiKc6bhKmWvJibj0k9JY3J3QHzidgt
   eKVd97QppoiyMa+C4Lzl8ZqU5/ywdva8wdwwb6qKOpd3jvcRTHzeYWj+M
   6PECMuTuv08RdUckNUWGx4eUcLeYra0B5eTa7YTgb58ofUMZ1td6tHyLz
   INozuTPU/1Oy6vequAF5F0DmYvuyNfG2B1XhGuDcAwaB6g6yzEqcpAtE9
   VK+HQKCq9tlbi1Bh8438EtqO3s0vUw3z4F5CAiVTWhV7K4fXYmr6BjGyb
   Q==;
X-CSE-ConnectionGUID: R5B6jnU1TTWc0t0C0FxLpw==
X-CSE-MsgGUID: PpcyY+1cRIa5I2fT9W4UDQ==
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="37447987"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Nov 2024 12:17:47 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Nov 2024 12:17:23 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 6 Nov 2024 12:17:19 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Wed, 6 Nov 2024 20:16:45 +0100
Subject: [PATCH net-next 7/7] net: lan969x: add function for configuring
 RGMII port devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241106-sparx5-lan969x-switch-driver-4-v1-7-f7f7316436bd@microchip.com>
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
X-CRM114-CacheID: sfid-20241106_111751_710604_EB478177 
X-CRM114-Status: GOOD (  19.42  )
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

The lan969x switch device includes two RGMII interfaces (port 28 and 29)
supporting data speeds of 1 Gbps, 100 Mbps and 10 Mbps.

Add new function: rgmii_config() to the match data ops, and use it to
configure RGMII port devices when doing a port config.  On Sparx5, the
RGMII configuration will always be skipped, as the is_port_rgmii() will
return false.

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Reviewed-by: Horatiu Vultur <horatiu.vultur@microchip.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/lan969x/lan969x.c   | 105 +++++++++++++++++++++
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |   2 +
 .../net/ethernet/microchip/sparx5/sparx5_port.c    |   3 +
 3 files changed, 110 insertions(+)

diff --git a/drivers/net/ethernet/microchip/lan969x/lan969x.c b/drivers/net/ethernet/microchip/lan969x/lan969x.c
index cfd57eb42c04..0681913a05d4 100644
--- a/drivers/net/ethernet/microchip/lan969x/lan969x.c
+++ b/drivers/net/ethernet/microchip/lan969x/lan969x.c
@@ -9,6 +9,17 @@
 #define LAN969X_SDLB_GRP_CNT 5
 #define LAN969X_HSCH_LEAK_GRP_CNT 4
 
+#define LAN969X_RGMII_TX_CLK_DISABLE 0  /* Disable TX clock generation*/
+#define LAN969X_RGMII_TX_CLK_125MHZ 1   /* 1000Mbps */
+#define LAN969X_RGMII_TX_CLK_25MHZ  2   /* 100Mbps */
+#define LAN969X_RGMII_TX_CLK_2M5MHZ 3   /* 10Mbps */
+#define LAN969X_RGMII_PORT_START_IDX 28 /* Index of the first RGMII port */
+#define LAN969X_RGMII_PORT_RATE 2       /* 1000Mbps  */
+#define LAN969X_RGMII_SHIFT_90DEG 3     /* Phase shift 90deg. (2 ns @ 125MHz) */
+#define LAN969X_RGMII_IFG_TX 4          /* TX Inter Frame Gap value */
+#define LAN969X_RGMII_IFG_RX1 5         /* RX1 Inter Frame Gap value */
+#define LAN969X_RGMII_IFG_RX2 1         /* RX2 Inter Frame Gap value */
+
 static const struct sparx5_main_io_resource lan969x_main_iomap[] =  {
 	{ TARGET_CPU,                   0xc0000, 0 }, /* 0xe00c0000 */
 	{ TARGET_FDMA,                  0xc0400, 0 }, /* 0xe00c0400 */
@@ -293,6 +304,99 @@ static irqreturn_t lan969x_ptp_irq_handler(int irq, void *args)
 	return IRQ_HANDLED;
 }
 
+static int lan969x_port_config_rgmii(struct sparx5 *sparx5,
+				     struct sparx5_port *port,
+				     struct sparx5_port_config *conf)
+{
+	int tx_clk_freq, idx = port->portno - LAN969X_RGMII_PORT_START_IDX;
+	enum sparx5_port_max_tags max_tags = port->max_vlan_tags;
+	enum sparx5_vlan_port_type vlan_type = port->vlan_type;
+	bool dtag, dotag, tx_delay = false, rx_delay = false;
+	u32 etype;
+
+	tx_clk_freq = (conf->speed == SPEED_10	? LAN969X_RGMII_TX_CLK_2M5MHZ :
+		       conf->speed == SPEED_100 ? LAN969X_RGMII_TX_CLK_25MHZ :
+						  LAN969X_RGMII_TX_CLK_125MHZ);
+
+	etype = (vlan_type == SPX5_VLAN_PORT_TYPE_S_CUSTOM ?
+		 port->custom_etype :
+		 vlan_type == SPX5_VLAN_PORT_TYPE_C ?
+		 SPX5_ETYPE_TAG_C : SPX5_ETYPE_TAG_S);
+
+	dtag = max_tags == SPX5_PORT_MAX_TAGS_TWO;
+	dotag = max_tags != SPX5_PORT_MAX_TAGS_NONE;
+
+	if (conf->phy_mode == PHY_INTERFACE_MODE_RGMII ||
+	    conf->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
+		rx_delay = true;
+
+	if (conf->phy_mode == PHY_INTERFACE_MODE_RGMII ||
+	    conf->phy_mode == PHY_INTERFACE_MODE_RGMII_RXID)
+		tx_delay = true;
+
+	/* Take the RGMII clock domains out of reset and set tx clock
+	 * frequency.
+	 */
+	spx5_rmw(HSIO_WRAP_RGMII_CFG_TX_CLK_CFG_SET(tx_clk_freq) |
+		HSIO_WRAP_RGMII_CFG_RGMII_TX_RST_SET(0) |
+		HSIO_WRAP_RGMII_CFG_RGMII_RX_RST_SET(0),
+		HSIO_WRAP_RGMII_CFG_TX_CLK_CFG |
+		HSIO_WRAP_RGMII_CFG_RGMII_TX_RST |
+		HSIO_WRAP_RGMII_CFG_RGMII_RX_RST,
+		sparx5, HSIO_WRAP_RGMII_CFG(idx));
+
+	/* Enable the RGMII0 on the GPIOs */
+	spx5_wr(HSIO_WRAP_XMII_CFG_GPIO_XMII_CFG_SET(1),
+		sparx5, HSIO_WRAP_XMII_CFG(!idx));
+
+	/* Configure rx delay, the signal is shifted 90 degrees. */
+	spx5_rmw(HSIO_WRAP_DLL_CFG_DLL_RST_SET(0) |
+		 HSIO_WRAP_DLL_CFG_DLL_ENA_SET(1) |
+		 HSIO_WRAP_DLL_CFG_DLL_CLK_ENA_SET(rx_delay) |
+		 HSIO_WRAP_DLL_CFG_DLL_CLK_SEL_SET(LAN969X_RGMII_SHIFT_90DEG),
+		 HSIO_WRAP_DLL_CFG_DLL_RST |
+		 HSIO_WRAP_DLL_CFG_DLL_ENA |
+		 HSIO_WRAP_DLL_CFG_DLL_CLK_ENA |
+		 HSIO_WRAP_DLL_CFG_DLL_CLK_SEL,
+		 sparx5, HSIO_WRAP_DLL_CFG(idx, 0));
+
+	/* Configure tx delay, the signal is shifted 90 degrees. */
+	spx5_rmw(HSIO_WRAP_DLL_CFG_DLL_RST_SET(0) |
+		 HSIO_WRAP_DLL_CFG_DLL_ENA_SET(1) |
+		 HSIO_WRAP_DLL_CFG_DLL_CLK_ENA_SET(tx_delay) |
+		 HSIO_WRAP_DLL_CFG_DLL_CLK_SEL_SET(LAN969X_RGMII_SHIFT_90DEG),
+		 HSIO_WRAP_DLL_CFG_DLL_RST |
+		 HSIO_WRAP_DLL_CFG_DLL_ENA |
+		 HSIO_WRAP_DLL_CFG_DLL_CLK_ENA |
+		 HSIO_WRAP_DLL_CFG_DLL_CLK_SEL,
+		 sparx5, HSIO_WRAP_DLL_CFG(idx, 1));
+
+	/* Configure the port now */
+	spx5_wr(DEVRGMII_MAC_ENA_CFG_RX_ENA_SET(1) |
+		DEVRGMII_MAC_ENA_CFG_TX_ENA_SET(1),
+		sparx5, DEVRGMII_MAC_ENA_CFG(idx));
+
+	/* Configure the Inter Frame Gap */
+	spx5_wr(DEVRGMII_MAC_IFG_CFG_TX_IFG_SET(LAN969X_RGMII_IFG_TX) |
+		DEVRGMII_MAC_IFG_CFG_RX_IFG1_SET(LAN969X_RGMII_IFG_RX1) |
+		DEVRGMII_MAC_IFG_CFG_RX_IFG2_SET(LAN969X_RGMII_IFG_RX2),
+		sparx5, DEVRGMII_MAC_IFG_CFG(idx));
+
+	/* Configure port data rate */
+	spx5_wr(DEVRGMII_DEV_RST_CTRL_SPEED_SEL_SET(LAN969X_RGMII_PORT_RATE),
+		sparx5, DEVRGMII_DEV_RST_CTRL(idx));
+
+	/* Configure VLAN awareness */
+	spx5_wr(DEVRGMII_MAC_TAGS_CFG_TAG_ID_SET(etype) |
+		DEVRGMII_MAC_TAGS_CFG_PB_ENA_SET(dtag) |
+		DEVRGMII_MAC_TAGS_CFG_VLAN_AWR_ENA_SET(dotag) |
+		DEVRGMII_MAC_TAGS_CFG_VLAN_LEN_AWR_ENA_SET(dotag),
+		sparx5,
+		DEVRGMII_MAC_TAGS_CFG(idx));
+
+	return 0;
+}
+
 static const struct sparx5_regs lan969x_regs = {
 	.tsize = lan969x_tsize,
 	.gaddr = lan969x_gaddr,
@@ -337,6 +441,7 @@ static const struct sparx5_ops lan969x_ops = {
 	.set_port_mux            = &lan969x_port_mux_set,
 	.ptp_irq_handler         = &lan969x_ptp_irq_handler,
 	.dsm_calendar_calc       = &lan969x_dsm_calendar_calc,
+	.rgmii_config            = &lan969x_port_config_rgmii,
 };
 
 const struct sparx5_match_data lan969x_desc = {
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
index a622c01930e7..763c827c01f3 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
@@ -324,6 +324,8 @@ struct sparx5_ops {
 	irqreturn_t (*ptp_irq_handler)(int irq, void *args);
 	int (*dsm_calendar_calc)(struct sparx5 *sparx5, u32 taxi,
 				 struct sparx5_calendar_data *data);
+	int (*rgmii_config)(struct sparx5 *sparx5, struct sparx5_port *port,
+			    struct sparx5_port_config *conf);
 };
 
 struct sparx5_main_io_resource {
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_port.c b/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
index bd1fa5da47d7..ef61e8164e21 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
@@ -1009,6 +1009,9 @@ int sparx5_port_config(struct sparx5 *sparx5,
 	if (err)
 		return err;
 
+	if (rgmii)
+		ops->rgmii_config(sparx5, port, conf);
+
 	/* high speed device is already configured */
 	if (!rgmii && !high_speed_dev)
 		sparx5_port_config_low_set(sparx5, port, conf);

-- 
2.34.1


