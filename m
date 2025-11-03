Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897C5CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 07:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9xz9zUO5VACIjPzZ7kJcBSQ9+Rvi5l0Ffv0/o4ELf4=; b=vflf3Uk3jVXuwAIISUnwp4poNs
	PQd5eh2pWEj6NeAIONX/AiOlDV7pfdiDdFHcZhzcuwnlifBHH4Q+tH0VjsRAN63lwepzrDgzBVimd
	TzPOFjLXdJ1EpcZbZD0fn0RPWD03PC1nVuMg/HS39a/mrdHWWvxaLnA+6aJVGmaKooD858G3DKLNJ
	f39SuNt8wnwnlg1GXfYZOxRClmrZDtXvi0ymZKy9RjsIPlN0rNRI/dpMlyQWANRZs3uFUnOoPzq+P
	ApCnorBO+OpYUJLCe1aWuo1dFei7Vqh+Et2UKtkhORVcgZ78mPdv/Wc191vOtLFqXeB3JYg7gss+L
	Ua3X0SvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFpFK-00000009NaG-3Jpv;
	Mon, 03 Nov 2025 07:44:58 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFpFI-00000009NVv-3vIb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 07:44:58 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 3 Nov
 2025 15:39:31 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 3 Nov 2025 15:39:31 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Date: Mon, 3 Nov 2025 15:39:19 +0800
Subject: [PATCH net-next v3 4/4] net: ftgmac100: Add RGMII delay support
 for AST2600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251103-rgmii_delay_2600-v3-4-e2af2656f7d7@aspeedtech.com>
References: <20251103-rgmii_delay_2600-v3-0-e2af2656f7d7@aspeedtech.com>
In-Reply-To: <20251103-rgmii_delay_2600-v3-0-e2af2656f7d7@aspeedtech.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762155571; l=6843;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=1wloGNNVsoIOYfApIhEtsrZ4/JcgHz40F3WbPMyHM2I=;
 b=IbTCiNJSMVeN46KAGwM6smmb4SlvlDS0giiLkC2aPV+1ijm2hi8g3hPKPyNwS+BzPaMFHewgh
 B6/atZuzn+DCIYQZTmeRLLALXB3RZ3uAn+VBzZ6POfVsIOBlQi0X5Zn
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_234456_987392_BCD846F0 
X-CRM114-Status: GOOD (  20.19  )
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
 drivers/net/ethernet/faraday/ftgmac100.c | 110 +++++++++++++++++++++++++++++++
 drivers/net/ethernet/faraday/ftgmac100.h |  15 +++++
 2 files changed, 125 insertions(+)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index a863f7841210..bc83ef079095 100644
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
 
@@ -1833,6 +1836,108 @@ static bool ftgmac100_has_child_node(struct device_node *np, const char *name)
 	return ret;
 }
 
+static int ftgmac100_set_ast2600_rgmii_delay(struct platform_device *pdev,
+					     u32 rgmii_tx_delay,
+					     u32 rgmii_rx_delay)
+{
+	struct device_node *np = pdev->dev.of_node;
+	u32 rgmii_delay_unit;
+	struct regmap *scu;
+	int dly_mask;
+	int dly_reg;
+	int id;
+
+	scu = syscon_regmap_lookup_by_phandle(np, "scu");
+	if (IS_ERR(scu)) {
+		dev_err(&pdev->dev, "failed to get scu");
+		return PTR_ERR(scu);
+	}
+
+	id = of_alias_get_id(np, "ethernet");
+	if (id < 0 || id > 3) {
+		dev_err(&pdev->dev, "get wrong alise id %d\n", id);
+		return -EINVAL;
+	}
+
+	if (of_device_is_compatible(np, "aspeed,ast2600-mac01")) {
+		dly_reg = AST2600_MAC01_CLK_DLY;
+		rgmii_delay_unit = AST2600_MAC01_CLK_DLY_UNIT;
+	} else if (of_device_is_compatible(np, "aspeed,ast2600-mac23")) {
+		dly_reg = AST2600_MAC23_CLK_DLY;
+		rgmii_delay_unit = AST2600_MAC23_CLK_DLY_UNIT;
+	}
+
+	rgmii_tx_delay = DIV_ROUND_CLOSEST(rgmii_tx_delay, rgmii_delay_unit);
+	if (rgmii_tx_delay >= 32) {
+		dev_err(&pdev->dev,
+			"The index %u of TX delay setting is out of range\n",
+			rgmii_tx_delay);
+		return -EINVAL;
+	}
+
+	rgmii_rx_delay = DIV_ROUND_CLOSEST(rgmii_rx_delay, rgmii_delay_unit);
+	if (rgmii_rx_delay >= 32) {
+		dev_err(&pdev->dev,
+			"The index %u of RX delay setting is out of range\n",
+			rgmii_rx_delay);
+		return -EINVAL;
+	}
+
+	/* Due to the hardware design reason, for MAC23 on AST2600, the zero
+	 * delay ns on RX is configured by setting value 0x1a.
+	 * List as below:
+	 * 0x1a -> 0   ns, 0x1b -> 0.25 ns, ... , 0x1f -> 1.25 ns,
+	 * 0x00 -> 1.5 ns, 0x01 -> 1.75 ns, ... , 0x19 -> 7.75 ns, 0x1a -> 0 ns
+	 */
+	if (of_device_is_compatible(np, "aspeed,ast2600-mac23"))
+		rgmii_rx_delay = (AST2600_MAC23_RX_DLY_0_NS + rgmii_rx_delay) &
+				 AST2600_MAC_TX_RX_DLY_MASK;
+
+	if (id == 0 || id == 2) {
+		dly_mask = ASPEED_MAC0_2_TX_DLY | ASPEED_MAC0_2_RX_DLY;
+		rgmii_tx_delay = FIELD_PREP(ASPEED_MAC0_2_TX_DLY, rgmii_tx_delay);
+		rgmii_rx_delay = FIELD_PREP(ASPEED_MAC0_2_RX_DLY, rgmii_rx_delay);
+	} else {
+		dly_mask = ASPEED_MAC1_3_TX_DLY | ASPEED_MAC1_3_RX_DLY;
+		rgmii_tx_delay = FIELD_PREP(ASPEED_MAC1_3_TX_DLY, rgmii_tx_delay);
+		rgmii_rx_delay = FIELD_PREP(ASPEED_MAC1_3_RX_DLY, rgmii_rx_delay);
+	}
+
+	regmap_update_bits(scu, dly_reg, dly_mask, rgmii_tx_delay | rgmii_rx_delay);
+
+	return 0;
+}
+
+static int ftgmac100_set_internal_delay(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	u32 rgmii_tx_delay;
+	u32 rgmii_rx_delay;
+	int err;
+
+	if (!(of_device_is_compatible(np, "aspeed,ast2600-mac01") ||
+	      of_device_is_compatible(np, "aspeed,ast2600-mac23")))
+		return 0;
+
+	err = of_property_read_u32(np, "tx-internal-delay-ps", &rgmii_tx_delay);
+	if (err) {
+		dev_err(&pdev->dev, "failed to get tx-internal-delay-ps\n");
+		return err;
+	}
+
+	err = of_property_read_u32(np, "rx-internal-delay-ps", &rgmii_rx_delay);
+	if (err) {
+		dev_err(&pdev->dev, "failed to get tx-internal-delay-ps\n");
+		return err;
+	}
+
+	err = ftgmac100_set_ast2600_rgmii_delay(pdev,
+						rgmii_tx_delay,
+						rgmii_rx_delay);
+
+	return err;
+}
+
 static int ftgmac100_probe(struct platform_device *pdev)
 {
 	struct resource *res;
@@ -2004,6 +2109,11 @@ static int ftgmac100_probe(struct platform_device *pdev)
 		if (of_device_is_compatible(np, "aspeed,ast2600-mac"))
 			iowrite32(FTGMAC100_TM_DEFAULT,
 				  priv->base + FTGMAC100_OFFSET_TM);
+
+		/* Configure RGMII delay if there are the corresponding compatibles */
+		err = ftgmac100_set_internal_delay(pdev);
+		if (err)
+			goto err_phy_connect;
 	}
 
 	/* Default ring sizes */
diff --git a/drivers/net/ethernet/faraday/ftgmac100.h b/drivers/net/ethernet/faraday/ftgmac100.h
index 4968f6f0bdbc..6a2a9159bee4 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.h
+++ b/drivers/net/ethernet/faraday/ftgmac100.h
@@ -271,4 +271,19 @@ struct ftgmac100_rxdes {
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
 #endif /* __FTGMAC100_H */

-- 
2.34.1


