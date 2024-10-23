Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C675D0BB41
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 22:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Gv5a6CXw8C9Rvs5kl0MwkUefSwLGw3s8Bb0/DNmRqk=; b=PROlWNTShHhjH1VP0S14TR9/0Y
	VzaryZsO9vmIgXOPGlmJiKdFl66CYmI9sg4eaA+dXwzJtvGeBxvLyCkTBIXqsTzobNhHc3QffX+oA
	oI/DsiPtnI3QeYCTebkc1D7Us9cJdw5s30Sshl+8G5wZVbiKzryF+6wbTVLSHC8WM8xW30iMJHKx6
	yfwIPSGe90RLw6Qmv6AE7FuY30IjLKgMxQcvAqrgfdeIFCtl0xXYJ9OpoDmfc9tvH1vjb2DfQKZmD
	adoS15xog5RzlVsmpufFEk+CbmcE9Fe79hE67xDJrOQSp8H7ex6Zbi5pvzyeEX+50CX/IgCdkk6SC
	5FkuS+og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jfQ-0000000G4Z7-2yZs;
	Wed, 23 Oct 2024 22:17:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jRB-0000000G2Gs-1VCN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 22:02:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1729720961; x=1761256961;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=vwMgBh8rF4YruDkEUaNvk44Eb8em21K29W9Ne4EAcnA=;
  b=PPDnM9NsqgaDc07SKCMsqy9WUCpa8di3rL6ocSDfpvtyNoAMaTLsACrT
   hMzzS+WSoRcnWszcQ1c/woLbAUJp5u8wbuFPvPEsLNutdZ46qGxktG+Kc
   ZZGHIntkhY+/t+fzNy2rFiPgSusslnAMCnIu5uFsisQHt6Q9h830NSUnd
   2O6KDpr+GOHAMbNxgoFGrUtHUwEPOdukwWoREmOL6LYta3H1cXqB5XHPj
   a5W6DxJ/ABCMGV9SjNEO5ahifpwb5PJBcSR+WvAQNUMiq9oOd6hhVdw43
   5nXFtmEER/7xBdWHZtvpV0Y/ChUO2V8QslyTPBgmqSR1iOosMqpaJ5knD
   w==;
X-CSE-ConnectionGUID: wd8IJW4NTJ64cR86gqDN2Q==
X-CSE-MsgGUID: uCehCdvbSU2XvHM8M6WRMA==
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="200831271"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Oct 2024 15:02:36 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 23 Oct 2024 15:02:16 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 23 Oct 2024 15:02:12 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Thu, 24 Oct 2024 00:01:28 +0200
Subject: [PATCH net-next v2 09/15] net: lan969x: add lan969x ops to match
 data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241024-sparx5-lan969x-switch-driver-2-v2-9-a0b5fae88a0f@microchip.com>
References: <20241024-sparx5-lan969x-switch-driver-2-v2-0-a0b5fae88a0f@microchip.com>
In-Reply-To: <20241024-sparx5-lan969x-switch-driver-2-v2-0-a0b5fae88a0f@microchip.com>
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Lars Povlsen
	<lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
	<horatiu.vultur@microchip.com>, <jensemil.schulzostergaard@microchip.com>,
	<Parthiban.Veerasooran@microchip.com>, <Raju.Lakkaraju@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Richard Cochran <richardcochran@gmail.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <jacob.e.keller@intel.com>,
	<ast@fiberby.net>, <maxime.chevallier@bootlin.com>, <horms@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Steen Hegelund
	<steen.hegelund@microchip.com>, <devicetree@vger.kernel.org>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_150241_589787_291E7CC2 
X-CRM114-Status: GOOD (  15.58  )
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

Add a bunch of small lan969x ops in bulk. These ops are explained in
detail in a previous series [1].

[1] https://lore.kernel.org/netdev/20241004-b4-sparx5-lan969x-switch-driver-v2-8-d3290f581663@microchip.com/

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/lan969x/lan969x.c | 122 +++++++++++++++++++++++
 drivers/net/ethernet/microchip/lan969x/lan969x.h |  28 ++++++
 2 files changed, 150 insertions(+)

diff --git a/drivers/net/ethernet/microchip/lan969x/lan969x.c b/drivers/net/ethernet/microchip/lan969x/lan969x.c
index 19f91e4a9f3e..2c2b86f9144e 100644
--- a/drivers/net/ethernet/microchip/lan969x/lan969x.c
+++ b/drivers/net/ethernet/microchip/lan969x/lan969x.c
@@ -6,6 +6,9 @@
 
 #include "lan969x.h"
 
+#define LAN969X_SDLB_GRP_CNT 5
+#define LAN969X_HSCH_LEAK_GRP_CNT 4
+
 static const struct sparx5_main_io_resource lan969x_main_iomap[] =  {
 	{ TARGET_CPU,                   0xc0000, 0 }, /* 0xe00c0000 */
 	{ TARGET_FDMA,                  0xc0400, 0 }, /* 0xe00c0400 */
@@ -92,6 +95,112 @@ static const struct sparx5_main_io_resource lan969x_main_iomap[] =  {
 	{ TARGET_ASM,                 0x3200000, 1 }, /* 0xe3200000 */
 };
 
+static struct sparx5_sdlb_group lan969x_sdlb_groups[LAN969X_SDLB_GRP_CNT] = {
+	{ 1000000000,  8192 / 2, 64 }, /*    1 G */
+	{  500000000,  8192 / 2, 64 }, /*  500 M */
+	{  100000000,  8192 / 4, 64 }, /*  100 M */
+	{   50000000,  8192 / 4, 64 }, /*   50 M */
+	{    5000000,  8192 / 8, 64 }, /*   10 M */
+};
+
+static u32 lan969x_hsch_max_group_rate[LAN969X_HSCH_LEAK_GRP_CNT] = {
+	655355, 1048568, 6553550, 10485680
+};
+
+static struct sparx5_sdlb_group *lan969x_get_sdlb_group(int idx)
+{
+	return &lan969x_sdlb_groups[idx];
+}
+
+static u32 lan969x_get_hsch_max_group_rate(int grp)
+{
+	return lan969x_hsch_max_group_rate[grp];
+}
+
+static u32 lan969x_get_dev_mode_bit(struct sparx5 *sparx5, int port)
+{
+	if (lan969x_port_is_2g5(port) || lan969x_port_is_5g(port))
+		return port;
+
+	/* 10G */
+	switch (port) {
+	case 0:
+		return 12;
+	case 4:
+		return 13;
+	case 8:
+		return 14;
+	case 12:
+		return 0;
+	default:
+		return port;
+	}
+}
+
+static u32 lan969x_port_dev_mapping(struct sparx5 *sparx5, int port)
+{
+	if (lan969x_port_is_5g(port)) {
+		switch (port) {
+		case 9:
+			return 0;
+		case 13:
+			return 1;
+		case 17:
+			return 2;
+		case 21:
+			return 3;
+		}
+	}
+
+	if (lan969x_port_is_10g(port)) {
+		switch (port) {
+		case 0:
+			return 0;
+		case 4:
+			return 1;
+		case 8:
+			return 2;
+		case 12:
+			return 3;
+		case 16:
+			return 4;
+		case 20:
+			return 5;
+		case 24:
+			return 6;
+		case 25:
+			return 7;
+		case 26:
+			return 8;
+		case 27:
+			return 9;
+		}
+	}
+
+	/* 2g5 port */
+	return port;
+}
+
+static int lan969x_port_mux_set(struct sparx5 *sparx5, struct sparx5_port *port,
+				struct sparx5_port_config *conf)
+{
+	u32 portno = port->portno;
+	u32 inst;
+
+	if (port->conf.portmode == conf->portmode)
+		return 0; /* Nothing to do */
+
+	switch (conf->portmode) {
+	case PHY_INTERFACE_MODE_QSGMII: /* QSGMII: 4x2G5 devices. Mode Q'  */
+		inst = (portno - portno % 4) / 4;
+		spx5_rmw(BIT(inst), BIT(inst), sparx5, PORT_CONF_QSGMII_ENA);
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
 static const struct sparx5_regs lan969x_regs = {
 	.tsize = lan969x_tsize,
 	.gaddr = lan969x_gaddr,
@@ -123,12 +232,25 @@ static const struct sparx5_consts lan969x_consts = {
 	.tod_pin             = 4,
 };
 
+static const struct sparx5_ops lan969x_ops = {
+	.is_port_2g5             = &lan969x_port_is_2g5,
+	.is_port_5g              = &lan969x_port_is_5g,
+	.is_port_10g             = &lan969x_port_is_10g,
+	.is_port_25g             = &lan969x_port_is_25g,
+	.get_port_dev_index      = &lan969x_port_dev_mapping,
+	.get_port_dev_bit        = &lan969x_get_dev_mode_bit,
+	.get_hsch_max_group_rate = &lan969x_get_hsch_max_group_rate,
+	.get_sdlb_group          = &lan969x_get_sdlb_group,
+	.set_port_mux            = &lan969x_port_mux_set,
+};
+
 const struct sparx5_match_data lan969x_desc = {
 	.iomap      = lan969x_main_iomap,
 	.iomap_size = ARRAY_SIZE(lan969x_main_iomap),
 	.ioranges   = 2,
 	.regs       = &lan969x_regs,
 	.consts     = &lan969x_consts,
+	.ops        = &lan969x_ops,
 };
 EXPORT_SYMBOL_GPL(lan969x_desc);
 
diff --git a/drivers/net/ethernet/microchip/lan969x/lan969x.h b/drivers/net/ethernet/microchip/lan969x/lan969x.h
index 3b4c9ea30071..ee890b26ea79 100644
--- a/drivers/net/ethernet/microchip/lan969x/lan969x.h
+++ b/drivers/net/ethernet/microchip/lan969x/lan969x.h
@@ -23,4 +23,32 @@ extern const unsigned int lan969x_gsize[GSIZE_LAST];
 extern const unsigned int lan969x_fpos[FPOS_LAST];
 extern const unsigned int lan969x_fsize[FSIZE_LAST];
 
+static inline bool lan969x_port_is_2g5(int portno)
+{
+	return portno == 1  || portno == 2  || portno == 3  ||
+	       portno == 5  || portno == 6  || portno == 7  ||
+	       portno == 10 || portno == 11 || portno == 14 ||
+	       portno == 15 || portno == 18 || portno == 19 ||
+	       portno == 22 || portno == 23;
+}
+
+static inline bool lan969x_port_is_5g(int portno)
+{
+	return portno == 9 || portno == 13 || portno == 17 ||
+	       portno == 21;
+}
+
+static inline bool lan969x_port_is_10g(int portno)
+{
+	return portno == 0  || portno == 4  || portno == 8  ||
+	       portno == 12 || portno == 16 || portno == 20 ||
+	       portno == 24 || portno == 25 || portno == 26 ||
+	       portno == 27;
+}
+
+static inline bool lan969x_port_is_25g(int portno)
+{
+	return false;
+}
+
 #endif

-- 
2.34.1


