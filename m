Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C696C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 03:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Nl62NtlkEq5ALtFLjtQ5AGx38czK9K3XMJPBTb4YpgM=; b=iGUTEfJNFZaQFtVTiMvAsWRfhp
	3G4FaGeXyESBW9Ccp6+IFWownmfhP6V5KELOHIoyYs7HzNBWnZywpVyxZi6QHuUwYP4dDdUXN6xcM
	QQokZ4sj1LTqOv9yFSXe0fhLBIcLidAuBRoLMzztpFCmgIAEIay9AUy0HdfotHrhvI++nY+YaKbX4
	P+kyQnB/SySrMdDs1rd15COB81qnp6W4GXJ6iB1KEio84Jg2d1rxIzl2AD1c+PtUSK34mmVNqhcvg
	NQnEi6wegYbj112ptJN6pLwXUDfAF/5nUHsDFZww0BmXObCO2oX2Lfk6h6w6eJmxJPj2f3QnnUSLA
	P1ODryMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjs0i-000000039Hy-2b9g;
	Mon, 17 Feb 2025 03:41:32 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjrzG-000000039AC-1ML0;
	Mon, 17 Feb 2025 03:40:03 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2fc4418c0e1so1811410a91.1;
        Sun, 16 Feb 2025 19:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739763601; x=1740368401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nl62NtlkEq5ALtFLjtQ5AGx38czK9K3XMJPBTb4YpgM=;
        b=kqoN3g6gvRP0wybNQYycUlMdb0hcpejDxoLtK3bF665lT0Dt6XKXWZ8oUwU/vll/9O
         2nGjEmlOFyF76owY4vmJvceb9UHRXONLHEbjIdDU6ZzaxACXric7VXsAqbyA++2dE197
         B2rRy2zrOOLZ4B4/HbEJtjyO8EfyH+PctouLgQ98tiARTwoIeaDpiH7s2V2tGoSuY1fo
         UHEd4PuYp9kUQU1lEJBQf4LA5ad0MAAUDkZxA4QznwnkEHNbk7k9WImh4Ig9OXyqIeph
         06n9aSJ726oNC1cz223zAfN35DMsi8+wifYopfae539rtZ+e+oKKM2xIR2M9iqIgBeg4
         XcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739763601; x=1740368401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nl62NtlkEq5ALtFLjtQ5AGx38czK9K3XMJPBTb4YpgM=;
        b=QpLhtvkBBOfULGVhLsxv+j8wTl0QT5MKknCLGhAs4JCMU2fZ1h5UelFQ5i/EfLGo8X
         K2p4JBGFjtt8uC2NNDCEftjpEYlE+bp6+/xKAmZzSKe2gVd4gs0Aq2tlkRrmcSlLlHlX
         RAs5scWWCXNbsEdHIduMHmGSX4x6e877rkZQn4AcPeAo1kDBEVku3YpghlcC4c9/8uFu
         ciex/+7unOQkjxOr2cjlYiEBcmwUycHazJEem+JJ+O7Xu/hBzAHxsdxnneFddeaN+I8L
         pHTwPBGg89VJ6qkqa0raeqOixRxH20TS+B/XJ2im9Ky3yx2xKTs1N77dpd83PRs8AKhE
         QEmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBV0ZTn+noFyMZagTM9YBmwPBbjOj0Pt9Fc5eLhALw9BcN9opIEsEnYcBHk4UYWaSfbEK1yNg3tqESLnbcoJE=@lists.infradead.org, AJvYcCWiaEd8NqbTj8QhRNzXpfzOXhBmz2G4+9/iy9Xbck6cbrAu2UiDhxpsgU3L/SI0NNpd4VZPFp3J5pd2OPwMN0u/@lists.infradead.org
X-Gm-Message-State: AOJu0YwohyGGye+MP2C8TxtuosZ34aAJLEN2eGxjKck0evrvRDC84cbM
	ivmerSAEj3KCf+fLy3Cbeg+lPnWusnUuTwz6Hs2ONLHeRpAOEtBX
X-Gm-Gg: ASbGncsuBJrSY/5zp0sISmiIt9vinrQ2oEGsiAkbLhbfhFl540uKX0DI4He9NGY14z6
	tNTGAaAzujJckiuxQJdB99qrDaJJ25pi7Mz3hM6aj1g42QBgRuR996V2CzlmY30vBacD5oTBoAp
	KL1BFLGQufZsgpQA2BHtlmbvQP1CP1/M8Ga+AVo7ZbMsMvYmy1dhBqEicTpV6ltCgmw2AmgNSsI
	dnDYyzMJijHg+++Ie2Tinme1ExzfvVetCiPjRTGiq0so6AGIVBrRJG9pEr3zRUtnZCLL2aNqRVO
	Z9km0V0h
X-Google-Smtp-Source: AGHT+IFMjtFP6+eFxDZoPED1z+G8rAnlAtkY/tMQA24zNyKne9VxhqPhvrZG/sxzoSOa5figDdM6qw==
X-Received: by 2002:a17:90b:4b48:b0:2fa:2133:bc87 with SMTP id 98e67ed59e1d1-2fc0f955234mr25277232a91.6.1739763600850;
        Sun, 16 Feb 2025 19:40:00 -0800 (PST)
Received: from gmail.com ([116.237.135.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fc327a9d68sm5895139a91.1.2025.02.16.19.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 19:40:00 -0800 (PST)
From: Qingfang Deng <dqfext@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v3] net: ethernet: mediatek: add EEE support
Date: Mon, 17 Feb 2025 11:39:53 +0800
Message-ID: <20250217033954.3698772-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_194002_366433_020D0FED 
X-CRM114-Status: GOOD (  16.25  )
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

Add EEE support to MediaTek SoC Ethernet. The register fields are
similar to the ones in MT7531, except that the LPI threshold is in
milliseconds.

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
v3: use phylink managed EEE

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 65 +++++++++++++++++++++
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 11 ++++
 2 files changed, 76 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 0ad965ced5ef..985010a7b277 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -815,12 +815,58 @@ static void mtk_mac_link_up(struct phylink_config *config,
 	mtk_w32(mac->hw, mcr, MTK_MAC_MCR(mac->id));
 }
 
+static void mtk_mac_disable_tx_lpi(struct phylink_config *config)
+{
+	struct mtk_mac *mac = container_of(config, struct mtk_mac,
+					   phylink_config);
+	struct mtk_eth *eth = mac->hw;
+
+	mtk_m32(eth, MAC_MCR_EEE100M | MAC_MCR_EEE1G, 0, MTK_MAC_MCR(mac->id));
+}
+
+static int mtk_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
+				 bool tx_clk_stop)
+{
+	struct mtk_mac *mac = container_of(config, struct mtk_mac,
+					   phylink_config);
+	struct mtk_eth *eth = mac->hw;
+	u32 val;
+
+	/* Tx idle timer in ms */
+	timer = DIV_ROUND_UP(timer, 1000);
+
+	/* If the timer is zero, then set LPI_MODE, which allows the
+	 * system to enter LPI mode immediately rather than waiting for
+	 * the LPI threshold.
+	 */
+	if (!timer)
+		val = MAC_EEE_LPI_MODE;
+	else if (FIELD_FIT(MAC_EEE_LPI_TXIDLE_THD, timer))
+		val = FIELD_PREP(MAC_EEE_LPI_TXIDLE_THD, timer);
+	else
+		val = MAC_EEE_LPI_TXIDLE_THD;
+
+	if (tx_clk_stop)
+		val |= MAC_EEE_CKG_TXIDLE;
+
+	/* PHY Wake-up time, this field does not have a reset value, so use the
+	 * reset value from MT7531 (36us for 100M and 17us for 1000M).
+	 */
+	val |= FIELD_PREP(MAC_EEE_WAKEUP_TIME_1000, 17) |
+	       FIELD_PREP(MAC_EEE_WAKEUP_TIME_100, 36);
+
+	mtk_w32(eth, val, MTK_MAC_EEECR(mac->id));
+	mtk_m32(eth, 0, MAC_MCR_EEE100M | MAC_MCR_EEE1G, MTK_MAC_MCR(mac->id));
+}
+
 static const struct phylink_mac_ops mtk_phylink_ops = {
 	.mac_select_pcs = mtk_mac_select_pcs,
 	.mac_config = mtk_mac_config,
 	.mac_finish = mtk_mac_finish,
 	.mac_link_down = mtk_mac_link_down,
 	.mac_link_up = mtk_mac_link_up,
+	.mac_disable_tx_lpi = mtk_mac_disable_tx_lpi,
+	.mac_enable_tx_lpi = mtk_mac_enable_tx_lpi,
 };
 
 static int mtk_mdio_init(struct mtk_eth *eth)
@@ -4469,6 +4515,20 @@ static int mtk_set_pauseparam(struct net_device *dev, struct ethtool_pauseparam
 	return phylink_ethtool_set_pauseparam(mac->phylink, pause);
 }
 
+static int mtk_get_eee(struct net_device *dev, struct ethtool_keee *eee)
+{
+	struct mtk_mac *mac = netdev_priv(dev);
+
+	return phylink_ethtool_get_eee(mac->phylink, eee);
+}
+
+static int mtk_set_eee(struct net_device *dev, struct ethtool_keee *eee)
+{
+	struct mtk_mac *mac = netdev_priv(dev);
+
+	return phylink_ethtool_set_eee(mac->phylink, eee);
+}
+
 static u16 mtk_select_queue(struct net_device *dev, struct sk_buff *skb,
 			    struct net_device *sb_dev)
 {
@@ -4501,6 +4561,8 @@ static const struct ethtool_ops mtk_ethtool_ops = {
 	.set_pauseparam		= mtk_set_pauseparam,
 	.get_rxnfc		= mtk_get_rxnfc,
 	.set_rxnfc		= mtk_set_rxnfc,
+	.get_eee		= mtk_get_eee,
+	.set_eee		= mtk_set_eee,
 };
 
 static const struct net_device_ops mtk_netdev_ops = {
@@ -4610,6 +4672,9 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 	mac->phylink_config.type = PHYLINK_NETDEV;
 	mac->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
 		MAC_10 | MAC_100 | MAC_1000 | MAC_2500FD;
+	mac->phylink_config.lpi_capabilities = MAC_100FD | MAC_1000FD |
+		MAC_2500FD;
+	mac->phylink_config.lpi_timer_default = 1000;
 
 	/* MT7623 gmac0 is now missing its speed-specific PLL configuration
 	 * in its .mac_config method (since state->speed is not valid there.
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 0d5225f1d3ee..90a377ab4359 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -453,6 +453,8 @@
 #define MAC_MCR_RX_FIFO_CLR_DIS	BIT(12)
 #define MAC_MCR_BACKOFF_EN	BIT(9)
 #define MAC_MCR_BACKPR_EN	BIT(8)
+#define MAC_MCR_EEE1G		BIT(7)
+#define MAC_MCR_EEE100M		BIT(6)
 #define MAC_MCR_FORCE_RX_FC	BIT(5)
 #define MAC_MCR_FORCE_TX_FC	BIT(4)
 #define MAC_MCR_SPEED_1000	BIT(3)
@@ -461,6 +463,15 @@
 #define MAC_MCR_FORCE_LINK	BIT(0)
 #define MAC_MCR_FORCE_LINK_DOWN	(MAC_MCR_FORCE_MODE)
 
+/* Mac EEE control registers */
+#define MTK_MAC_EEECR(x)		(0x10104 + (x * 0x100))
+#define MAC_EEE_WAKEUP_TIME_1000	GENMASK(31, 24)
+#define MAC_EEE_WAKEUP_TIME_100		GENMASK(23, 16)
+#define MAC_EEE_LPI_TXIDLE_THD		GENMASK(15, 8)
+#define MAC_EEE_CKG_TXIDLE		BIT(3)
+#define MAC_EEE_CKG_RXLPI		BIT(2)
+#define MAC_EEE_LPI_MODE		BIT(0)
+
 /* Mac status registers */
 #define MTK_MAC_MSR(x)		(0x10108 + (x * 0x100))
 #define MAC_MSR_EEE1G		BIT(7)
-- 
2.43.0


