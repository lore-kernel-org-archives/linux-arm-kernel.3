Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7083CC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 03:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dfPNm4gjbKk/wSrXYiTAOhvmCS7f3bgH/l7AyRMHyTk=; b=hpU6hrT0TjSmY4baZ67NVYQjDp
	/p3EQVce48doozwu7yb1Agdp2ZjFb8cy4Vnen0dwdhAVTvbbziIHa6VsLfvJkZlg11KW8NMeVHKHX
	hVb5hQHvDwguiX7MmO41VXhAyFthjWPjrlVtdmL9bmPJDoIibZcfwnA2OWqXm64NHl7ZByhUQt9FR
	4d5H6PMhH3rjbu0T92sgF7qBpSJpcIL+akFXzA4f1+86/k2mX6R2fQR0K/BbyafvlPCf/AjQeqvbY
	r5X6UQ2nwX9U3tlLmjSWbObzc2+iQT+NPgrRpcrVAr9x7P1fVS+njuw8SvniPiOccHiD0kucQxS/R
	YJ8DlX7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu0pm-000000011ar-29DG;
	Mon, 17 Mar 2025 03:08:10 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu0hd-00000000zyY-0Sfy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 02:59:46 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 17 Mar
 2025 10:59:22 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 17 Mar 2025 10:59:22 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <ratbert@faraday-tech.com>,
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>
CC: <BMC-SW@aspeedtech.com>
Subject: [net-next 4/4] net: ftgmac100: add RGMII delay for AST2600
Date: Mon, 17 Mar 2025 10:59:22 +0800
Message-ID: <20250317025922.1526937-5-jacky_chou@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250317025922.1526937-1-jacky_chou@aspeedtech.com>
References: <20250317025922.1526937-1-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_195945_148421_7C35B51E 
X-CRM114-Status: GOOD (  15.12  )
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

Use rx-internal-delay-ps and tx-internal-delay-ps
properties to configue the RGMII delay into corresponding register of
scu. Currently, the ftgmac100 driver only configures on AST2600 and will
be by pass the other platforms.
The details are in faraday,ftgmac100.yaml.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 drivers/net/ethernet/faraday/ftgmac100.c | 88 ++++++++++++++++++++++++
 drivers/net/ethernet/faraday/ftgmac100.h | 12 ++++
 2 files changed, 100 insertions(+)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index 17ec35e75a65..ea2061488cba 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -27,6 +27,9 @@
 #include <linux/phy_fixed.h>
 #include <net/ip.h>
 #include <net/ncsi.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
+#include <linux/bitfield.h>
 
 #include "ftgmac100.h"
 
@@ -1812,6 +1815,88 @@ static bool ftgmac100_has_child_node(struct device_node *np, const char *name)
 	return ret;
 }
 
+static void ftgmac100_set_internal_delay(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct net_device *netdev;
+	struct ftgmac100 *priv;
+	struct regmap *scu;
+	u32 rgmii_tx_delay, rgmii_rx_delay;
+	u32 dly_reg, tx_dly_mask, rx_dly_mask;
+	int tx, rx;
+
+	netdev = platform_get_drvdata(pdev);
+	priv = netdev_priv(netdev);
+
+	tx = of_property_read_u32(np, "tx-internal-delay-ps", &rgmii_tx_delay);
+	rx = of_property_read_u32(np, "rx-internal-delay-ps", &rgmii_rx_delay);
+
+	if (of_device_is_compatible(np, "aspeed,ast2600-mac")) {
+		/* According to mac base address to get mac index */
+		switch (priv->res->start) {
+		case 0x1e660000:
+			dly_reg = AST2600_MAC12_CLK_DLY;
+			tx_dly_mask = AST2600_MAC1_TX_DLY;
+			rx_dly_mask = AST2600_MAC1_RX_DLY;
+			rgmii_tx_delay = FIELD_PREP(AST2600_MAC1_TX_DLY, rgmii_tx_delay);
+			rgmii_rx_delay = FIELD_PREP(AST2600_MAC1_RX_DLY, rgmii_rx_delay);
+			break;
+		case 0x1e680000:
+			dly_reg = AST2600_MAC12_CLK_DLY;
+			tx_dly_mask = AST2600_MAC2_TX_DLY;
+			rx_dly_mask = AST2600_MAC2_RX_DLY;
+			rgmii_tx_delay = FIELD_PREP(AST2600_MAC2_TX_DLY, rgmii_tx_delay);
+			rgmii_rx_delay = FIELD_PREP(AST2600_MAC2_RX_DLY, rgmii_rx_delay);
+			break;
+		case 0x1e670000:
+			dly_reg = AST2600_MAC34_CLK_DLY;
+			tx_dly_mask = AST2600_MAC3_TX_DLY;
+			rx_dly_mask = AST2600_MAC3_RX_DLY;
+			rgmii_tx_delay = FIELD_PREP(AST2600_MAC3_TX_DLY, rgmii_tx_delay);
+			rgmii_rx_delay = FIELD_PREP(AST2600_MAC3_RX_DLY, rgmii_rx_delay);
+			break;
+		case 0x1e690000:
+			dly_reg = AST2600_MAC34_CLK_DLY;
+			tx_dly_mask = AST2600_MAC4_TX_DLY;
+			rx_dly_mask = AST2600_MAC4_RX_DLY;
+			rgmii_tx_delay = FIELD_PREP(AST2600_MAC4_TX_DLY, rgmii_tx_delay);
+			rgmii_rx_delay = FIELD_PREP(AST2600_MAC4_RX_DLY, rgmii_rx_delay);
+			break;
+		default:
+			dev_warn(&pdev->dev, "Invalid mac base address");
+			return;
+		}
+	} else {
+		return;
+	}
+
+	scu = syscon_regmap_lookup_by_phandle(np, "scu");
+	if (IS_ERR(scu)) {
+		dev_warn(&pdev->dev, "failed to map scu base");
+		return;
+	}
+
+	if (!tx) {
+		/* Use tx-internal-delay-ps as index to configure tx delay
+		 * into scu register.
+		 */
+		if (rgmii_tx_delay > 64)
+			dev_warn(&pdev->dev, "Get invalid tx delay value");
+		else
+			regmap_update_bits(scu, dly_reg, tx_dly_mask, rgmii_tx_delay);
+	}
+
+	if (!rx) {
+		/* Use rx-internal-delay-ps as index to configure rx delay
+		 * into scu register.
+		 */
+		if (rgmii_tx_delay > 64)
+			dev_warn(&pdev->dev, "Get invalid rx delay value");
+		else
+			regmap_update_bits(scu, dly_reg, rx_dly_mask, rgmii_rx_delay);
+	}
+}
+
 static int ftgmac100_probe(struct platform_device *pdev)
 {
 	struct resource *res;
@@ -1977,6 +2062,9 @@ static int ftgmac100_probe(struct platform_device *pdev)
 		if (of_device_is_compatible(np, "aspeed,ast2600-mac"))
 			iowrite32(FTGMAC100_TM_DEFAULT,
 				  priv->base + FTGMAC100_OFFSET_TM);
+
+		/* Configure RGMII delay if there are the corresponding properties */
+		ftgmac100_set_internal_delay(pdev);
 	}
 
 	/* Default ring sizes */
diff --git a/drivers/net/ethernet/faraday/ftgmac100.h b/drivers/net/ethernet/faraday/ftgmac100.h
index 4968f6f0bdbc..d464d287502c 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.h
+++ b/drivers/net/ethernet/faraday/ftgmac100.h
@@ -271,4 +271,16 @@ struct ftgmac100_rxdes {
 #define FTGMAC100_RXDES1_UDP_CHKSUM_ERR	(1 << 26)
 #define FTGMAC100_RXDES1_IP_CHKSUM_ERR	(1 << 27)
 
+/* Aspeed SCU */
+#define AST2600_MAC12_CLK_DLY	0x340
+#define AST2600_MAC1_TX_DLY		GENMASK(5, 0)
+#define AST2600_MAC1_RX_DLY		GENMASK(17, 12)
+#define AST2600_MAC2_TX_DLY		GENMASK(11, 6)
+#define AST2600_MAC2_RX_DLY		GENMASK(23, 18)
+#define AST2600_MAC34_CLK_DLY	0x350
+#define AST2600_MAC3_TX_DLY		AST2600_MAC1_TX_DLY
+#define AST2600_MAC3_RX_DLY		AST2600_MAC1_RX_DLY
+#define AST2600_MAC4_TX_DLY		AST2600_MAC2_TX_DLY
+#define AST2600_MAC4_RX_DLY		AST2600_MAC2_RX_DLY
+
 #endif /* __FTGMAC100_H */
-- 
2.34.1


