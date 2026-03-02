Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E831AE9B357
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 10:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rOkw9FfDBGCkerITFGafKBy3Fv/osobwB6tvgMjHYJk=; b=3dD5ukF2cSh70N+k1wpQJNkpZZ
	ynQ6E0SfYayiPYlsb1BFbQ/BBAATJXa5z9voTbx2qKOv1q7MD01xM1h6dLc0O9Pfr9gJKLMuLMUZ4
	dJNjKeXNs6tc0ryPgzMc9BKPLhgp5xeT2XpYHx2eaGdlDc42tdufOwQqhHTiLNKO9V/F41Gth1yyA
	/keDQJy6fTbURDnHnrzdgolEy6HwjtJMH+DdJi2Zwau80Hmv/8L4dOzCdLldI1q8Ae4TcnCHjIbRS
	gTQ0Svtx96QccndOK8RIwV25U68z++yVm5eSaVjj1ektC1xKRlHlT3NA4q9j2hDoNsDuEz9EUTBK4
	3dMsBSiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0SD-0000000Ch1t-3oJ9;
	Mon, 02 Mar 2026 10:24:45 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0SB-0000000CgxJ-29yR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 10:24:44 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 2 Mar
 2026 18:24:30 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 2 Mar 2026 18:24:30 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Date: Mon, 2 Mar 2026 18:24:30 +0800
Subject: [PATCH net-next v6 3/5] net: ftgmac100: Add RGMII delay support
 for AST2600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260302-rgmii_delay_2600-v6-3-68319a4c4110@aspeedtech.com>
References: <20260302-rgmii_delay_2600-v6-0-68319a4c4110@aspeedtech.com>
In-Reply-To: <20260302-rgmii_delay_2600-v6-0-68319a4c4110@aspeedtech.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Po-Yu Chuang <ratbert@faraday-tech.com>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <taoren@meta.com>, Jacky Chou
	<jacky_chou@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772447070; l=9482;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=UqUrbBeIvhqRy5zO6BS/+j9eXsnua0SQu5iczuiSWSw=;
 b=Hyr5u52113fwYtjR+T2Fm/3UsyYDONXJfpqXEsy8g25AktaHUXp+Pcu8OMkaETISqf6d1pcm7
 athTal752XkDnVYQaARVK5Gve5sWto8CrQ21396tYPhVQJqjnpLvAxA
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_022443_563013_D00B2684 
X-CRM114-Status: GOOD (  25.56  )
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

On the AST2600 platform, the RGMII delay is controlled via the
SCU registers. The delay chain configuration differs between MAC0/1
and MAC2/3, even though all four MACs use a 32-stage delay chain.
+------+----------+-----------+-------------+-------------+
|      |Delay Unit|Delay Stage|TX Edge Stage|RX Edge Stage|
+------+----------+-----------+-------------+-------------+
|MAC0/1|     45 ps|        32 |           0 |           0 |
+------+----------+-----------+-------------+-------------+
|MAC2/3|    250 ps|        32 |           0 |          26 |
+------+----------+-----------+-------------+-------------+
For MAC2/3, the "no delay" condition starts from stage 26.
Setting the RX delay stage to 26 means that no additional RX
delay is applied.
Here lists the RX delay setting of MAC2/3 below.
26 -> 0   ns, 27 -> 0.25 ns, ... , 31 -> 1.25 ns,
0  -> 1.5 ns, 1  -> 1.75 ns, ... , 25 -> 7.75 ns

Therefore, we calculate the delay stage from the
rx-internal-delay-ps of MAC2/3 to add 26. If the stage is equel
to or bigger than 32, the delay stage will be mask 0x1f to get
the correct setting.
The delay chain is like a ring for configuration.
Example for the rx-internal-delay-ps of MAC2/3 is 2000 ps,
we will get the delay stage is 2.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 drivers/net/ethernet/faraday/ftgmac100.c | 162 ++++++++++++++++++++++++++++++-
 drivers/net/ethernet/faraday/ftgmac100.h |  20 ++++
 2 files changed, 178 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index 1e91e79c8134..0b2a0bb8a4a9 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -26,6 +26,9 @@
 #include <linux/if_vlan.h>
 #include <linux/of_net.h>
 #include <linux/phy_fixed.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
+#include <linux/bitfield.h>
 #include <net/ip.h>
 #include <net/ncsi.h>
 
@@ -42,6 +45,7 @@ enum ftgmac100_mac_id {
 
 struct ftgmac100_match_data {
 	enum ftgmac100_mac_id mac_id;
+	bool rgmii_delay_conf;
 };
 
 /* Arbitrary values, I am not sure the HW has limits */
@@ -1919,10 +1923,148 @@ static int ftgmac100_probe_dt(struct net_device *netdev,
 	return 0;
 }
 
+static int ftgmac100_set_ast2600_rgmii_delay(struct ftgmac100 *priv,
+					     u32 rgmii_tx_delay,
+					     u32 rgmii_rx_delay,
+					     phy_interface_t phy_intf)
+{
+	struct device *dev = priv->dev;
+	struct device_node *np;
+	u32 rgmii_delay_unit;
+	u32 rx_delay_index;
+	u32 tx_delay_index;
+	struct regmap *scu;
+	int dly_mask;
+	int dly_reg;
+	int mac_id;
+
+	np = dev->of_node;
+
+	scu = syscon_regmap_lookup_by_phandle(np, "aspeed,scu");
+	if (IS_ERR(scu)) {
+		dev_err(dev, "failed to get aspeed,scu");
+		return PTR_ERR(scu);
+	}
+
+	/* According to the register base address to specify the corresponding
+	 * values.
+	 */
+	switch (priv->res->start) {
+	case AST2600_MAC0_BASE_ADDR:
+		mac_id = 0;
+		rgmii_delay_unit = AST2600_MAC01_CLK_DLY_UNIT;
+		dly_reg = AST2600_MAC01_CLK_DLY;
+		break;
+	case AST2600_MAC1_BASE_ADDR:
+		mac_id = 1;
+		rgmii_delay_unit = AST2600_MAC01_CLK_DLY_UNIT;
+		dly_reg = AST2600_MAC01_CLK_DLY;
+		break;
+	case AST2600_MAC2_BASE_ADDR:
+		mac_id = 2;
+		rgmii_delay_unit = AST2600_MAC23_CLK_DLY_UNIT;
+		dly_reg = AST2600_MAC23_CLK_DLY;
+		break;
+	case AST2600_MAC3_BASE_ADDR:
+		mac_id = 3;
+		rgmii_delay_unit = AST2600_MAC23_CLK_DLY_UNIT;
+		dly_reg = AST2600_MAC23_CLK_DLY;
+		break;
+	default:
+		dev_err(dev, "Invalid mac base address");
+		return -EINVAL;
+	}
+
+	/* Please refer to ethernet-controller.yaml. */
+	if (phy_intf == PHY_INTERFACE_MODE_RGMII &&
+	    (rgmii_tx_delay == 2000 || rgmii_rx_delay == 2000)) {
+		dev_warn(dev, "RX/TX delay cannot set to 2000 on 'rgmii'\n");
+		return -EINVAL;
+	}
+
+	tx_delay_index = DIV_ROUND_CLOSEST(rgmii_tx_delay, rgmii_delay_unit);
+	if (tx_delay_index >= 32) {
+		dev_err(dev, "The %u ps of TX delay is out of range\n",
+			rgmii_tx_delay);
+		return -EINVAL;
+	}
+
+	rx_delay_index = DIV_ROUND_CLOSEST(rgmii_rx_delay, rgmii_delay_unit);
+	if (rx_delay_index >= 32) {
+		dev_err(dev, "The %u ps of RX delay is out of range\n",
+			rgmii_rx_delay);
+		return -EINVAL;
+	}
+
+	/* Due to the hardware design reason, for MAC2/3 on AST2600, the zero
+	 * delay ns on RX is configured by setting value 0x1a.
+	 * List as below:
+	 * 0x1a -> 0   ns, 0x1b -> 0.25 ns, ... , 0x1f -> 1.25 ns,
+	 * 0x00 -> 1.5 ns, 0x01 -> 1.75 ns, ... , 0x19 -> 7.75 ns, 0x1a -> 0 ns
+	 */
+	if (mac_id == 2 || mac_id == 3)
+		rx_delay_index = (AST2600_MAC23_RX_DLY_0_NS + rx_delay_index) &
+				 AST2600_MAC_TX_RX_DLY_MASK;
+
+	if (mac_id == 0 || mac_id == 2) {
+		dly_mask = ASPEED_MAC0_2_TX_DLY | ASPEED_MAC0_2_RX_DLY;
+		tx_delay_index = FIELD_PREP(ASPEED_MAC0_2_TX_DLY, tx_delay_index);
+		rx_delay_index = FIELD_PREP(ASPEED_MAC0_2_RX_DLY, rx_delay_index);
+	} else {
+		dly_mask = ASPEED_MAC1_3_TX_DLY | ASPEED_MAC1_3_RX_DLY;
+		tx_delay_index = FIELD_PREP(ASPEED_MAC1_3_TX_DLY, tx_delay_index);
+		rx_delay_index = FIELD_PREP(ASPEED_MAC1_3_RX_DLY, rx_delay_index);
+	}
+
+	regmap_update_bits(scu, dly_reg, dly_mask, tx_delay_index | rx_delay_index);
+
+	return 0;
+}
+
+static int ftgmac100_config_rgmii_delay(struct ftgmac100 *priv)
+{
+	struct device_node *np = priv->dev->of_node;
+	phy_interface_t phy_intf;
+	u32 rgmii_tx_delay;
+	u32 rgmii_rx_delay;
+	int err = 0;
+
+	/* Because some old dts using NC-SI mode does not include phy-mode
+	 * property, here need to skip RGMII delay configuration and prevent
+	 * of_get_phy_mode() from returning error.
+	 */
+	if (of_get_property(np, "use-ncsi", NULL))
+		return 0;
+
+	err = of_get_phy_mode(np, &phy_intf);
+	if (err) {
+		dev_err(priv->dev, "Failed to get phy mode: %d\n", err);
+		return err;
+	}
+
+	/* RMII does not need to configure RGMII delay */
+	if (!phy_interface_mode_is_rgmii(phy_intf))
+		return 0;
+
+	if (of_property_read_u32(np, "tx-internal-delay-ps", &rgmii_tx_delay))
+		rgmii_tx_delay = 0;
+	if (of_property_read_u32(np, "rx-internal-delay-ps", &rgmii_rx_delay))
+		rgmii_rx_delay = 0;
+
+	if (priv->mac_id == FTGMAC100_AST2600)
+		err = ftgmac100_set_ast2600_rgmii_delay(priv,
+							rgmii_tx_delay,
+							rgmii_rx_delay,
+							phy_intf);
+
+	return err;
+}
+
 static int ftgmac100_probe(struct platform_device *pdev)
 {
 	const struct ftgmac100_match_data *match_data;
 	enum ftgmac100_mac_id mac_id;
+	bool rgmii_delay_conf;
 	struct resource *res;
 	int irq;
 	struct net_device *netdev;
@@ -1936,8 +2078,10 @@ static int ftgmac100_probe(struct platform_device *pdev)
 		if (!match_data)
 			return -EINVAL;
 		mac_id = match_data->mac_id;
+		rgmii_delay_conf = match_data->rgmii_delay_conf;
 	} else {
 		mac_id = FTGMAC100_FARADAY;
+		rgmii_delay_conf = false;
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -2006,6 +2150,12 @@ static int ftgmac100_probe(struct platform_device *pdev)
 		priv->txdes0_edotr_mask = BIT(15);
 	}
 
+	if (rgmii_delay_conf) {
+		err = ftgmac100_config_rgmii_delay(priv);
+		if (err)
+			return err;
+	}
+
 	if (priv->mac_id == FTGMAC100_FARADAY ||
 	    priv->mac_id == FTGMAC100_AST2400 ||
 	    priv->mac_id == FTGMAC100_AST2500) {
@@ -2100,19 +2250,23 @@ static void ftgmac100_remove(struct platform_device *pdev)
 }
 
 static const struct ftgmac100_match_data ftgmac100_match_data_ast2400 = {
-	.mac_id = FTGMAC100_AST2400
+	.mac_id = FTGMAC100_AST2400,
+	.rgmii_delay_conf = false
 };
 
 static const struct ftgmac100_match_data ftgmac100_match_data_ast2500 = {
-	.mac_id = FTGMAC100_AST2500
+	.mac_id = FTGMAC100_AST2500,
+	.rgmii_delay_conf = false
 };
 
 static const struct ftgmac100_match_data ftgmac100_match_data_ast2600 = {
-	.mac_id = FTGMAC100_AST2600
+	.mac_id = FTGMAC100_AST2600,
+	.rgmii_delay_conf = true
 };
 
 static const struct ftgmac100_match_data ftgmac100_match_data_faraday = {
-	.mac_id = FTGMAC100_FARADAY
+	.mac_id = FTGMAC100_FARADAY,
+	.rgmii_delay_conf = false
 };
 
 static const struct of_device_id ftgmac100_of_match[] = {
diff --git a/drivers/net/ethernet/faraday/ftgmac100.h b/drivers/net/ethernet/faraday/ftgmac100.h
index 4968f6f0bdbc..d19d44d1b8e0 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.h
+++ b/drivers/net/ethernet/faraday/ftgmac100.h
@@ -271,4 +271,24 @@ struct ftgmac100_rxdes {
 #define FTGMAC100_RXDES1_UDP_CHKSUM_ERR	(1 << 26)
 #define FTGMAC100_RXDES1_IP_CHKSUM_ERR	(1 << 27)
 
+/* Aspeed SCU */
+#define AST2600_MAC01_CLK_DLY	0x340
+#define AST2600_MAC23_CLK_DLY	0x350
+#define AST2600_MAC01_CLK_DLY_UNIT	45	/* ps */
+#define AST2600_MAC01_TX_DLY_0_NS	0
+#define AST2600_MAC01_RX_DLY_0_NS	0
+#define AST2600_MAC23_CLK_DLY_UNIT	250	/* ps */
+#define AST2600_MAC23_TX_DLY_0_NS	0
+#define AST2600_MAC23_RX_DLY_0_NS	0x1a
+#define AST2600_MAC_TX_RX_DLY_MASK	0x1f
+#define ASPEED_MAC0_2_TX_DLY		GENMASK(5, 0)
+#define ASPEED_MAC0_2_RX_DLY		GENMASK(17, 12)
+#define ASPEED_MAC1_3_TX_DLY		GENMASK(11, 6)
+#define ASPEED_MAC1_3_RX_DLY		GENMASK(23, 18)
+
+#define AST2600_MAC0_BASE_ADDR		0x1e660000
+#define AST2600_MAC1_BASE_ADDR		0x1e680000
+#define AST2600_MAC2_BASE_ADDR		0x1e670000
+#define AST2600_MAC3_BASE_ADDR		0x1e690000
+
 #endif /* __FTGMAC100_H */

-- 
2.34.1


