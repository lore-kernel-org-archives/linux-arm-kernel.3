Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEC1CD8C85
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Jun 2026 06:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rzt8BYs7Mzw4Tpacz5I+FsGVINJwYYFtlK1dNESkZV8=; b=S2bjJS35TYJvciJiS9aIu5bDXj
	KQWaC7fGb34ECsy2m7rSDgelHZyTf/c5bkHSu+8kCSGNrJIHYHN8eYvfz2shqK8idRULU+afBgawo
	0eQ3U9QDjFOUH5yGuQszcDwQsvDi8/rOxRfXNlIxNp38Ojb2ilVWSF3sdEp2Gtg/xmxC+Mq9MDaGg
	KjLLwGxHLDSx2SddGgikuTTypC9qGvY5M4x6lhBcICyzPep7BCQtOw4pXzPZcodM4+SV+7s653qK/
	lhzYQw5Cg+lNmbzTBKEzPQEgZWqO2nCUELHv06iCvn/y0emQO2SfSetGzARUlexDTVVhbCNx+8Ss6
	9u/bOaVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVkYl-00000001TyR-2MGp;
	Sat, 06 Jun 2026 06:31:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVkYj-00000001TyI-3Lr4;
	Sat, 06 Jun 2026 06:31:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 16D4F600AE;
	Sat,  6 Jun 2026 06:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA3C1F00893;
	Sat,  6 Jun 2026 06:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780727463;
	bh=rzt8BYs7Mzw4Tpacz5I+FsGVINJwYYFtlK1dNESkZV8=;
	h=From:Date:Subject:To:Cc;
	b=Z+lXylQT4fdRJesqlmUhnBnaSdHQACBqhDLtOOOfEc9iN9wmZaIxPhgFMn/kByR8R
	 hBxTCvPPRKGL/1bYt+J4y7xP4rRJlbAsao2PLkX8lvteRehF0dpY5Qrfs2JEw8U0Sr
	 FUpIaxYYw4bGdZCpAanqT513cd6qwdYDjqljdvKuefBua0CGZ5wSvWmepNzpNe5ROA
	 Ow3t9eqYdL3H/B2yqPb/Mrh5nJ+qzGcoEktIr6lK5FMSA/5alvjLOLLbJbImURWWnS
	 ATWipIkkF5vCmKAUsxCgsUvirZ8TgcgZuUG4qJTPRhbAJwe7R5/8OA8/32ezZM3KCc
	 K6OSsZFk6gp4w==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 06 Jun 2026 08:30:12 +0200
Subject: [PATCH net-next] net: airoha: add ethtool priv_flags support for
 LAN/WAN and GDM2 loopback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260606-airoha-ethtool-priv_flags-v1-1-401b2c9fe9f1@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAMAwEvyI5G6geVPyKiESNNiCtpEUE8e8GG
 ViYw84DiVU4QV88oHxJkhhMqrKAxVPYGWU1h9rVjTOQRKMn5OxzjAeeKte0HbQnnBui1i02nQP
 7n8qb3H97gMAZA98Zxvf9ALVh2/B1AAAA
X-Change-ID: 20260606-airoha-ethtool-priv_flags-b6aa70caa780
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Madhur Agrawal <madhur.agrawal@airoha.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.3
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

Introduce ethtool private flags infrastructure for the airoha ethernet
driver, allowing userspace to configure per-device behavior via ethtool.
Implement the "wan" private flag to let the user select whether a GDM
port is used as a hardware LAN or WAN interface. GDM2 is fixed as WAN
only, GDM1 is fixed as LAN only, while GDM3 and GDM4 can be switched
between LAN and WAN at runtime (when the interface is not running).
When a GDM3/GDM4 port is set to WAN mode, enable GDM2 loopback to
support hardware QoS. Conversely, when switching back to LAN mode,
disable the GDM2 loopback and restore the default forwarding
configuration.
Add airoha_disable_gdm2_loopback() as the counterpart of the existing
airoha_enable_gdm2_loopback(), and define FC_MAP6_DEF_VALUE for use
during loopback teardown.

Example usage to configure eth1 (GDM3/GDM4) as WAN:

$ ethtool --show-priv-flags eth1
Private flags for eth1:
wan: off

$ ethtool --set-priv-flags eth1 wan on

$ ethtool --show-priv-flags eth1
Private flags for eth1:
wan: on

To revert back to LAN mode:

$ ethtool --set-priv-flags eth1 wan off

Tested-by: Madhur Agrawal <madhur.agrawal@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c  | 175 ++++++++++++++++++++++++++++++
 drivers/net/ethernet/airoha/airoha_regs.h |   1 +
 2 files changed, 176 insertions(+)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 5a8e84fa9918..487c5470fb01 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1960,6 +1960,45 @@ static int airoha_enable_gdm2_loopback(struct airoha_gdm_dev *dev)
 	return 0;
 }
 
+static int airoha_disable_gdm2_loopback(struct airoha_gdm_dev *dev)
+{
+	struct airoha_eth *eth = dev->eth;
+	int i, src_port;
+	u32 pse_port;
+
+	src_port = eth->soc->ops.get_sport(dev->port, dev->nbq);
+	if (src_port < 0)
+		return src_port;
+
+	airoha_fe_clear(eth,
+			REG_SP_DFT_CPORT(src_port >> fls(SP_CPORT_DFT_MASK)),
+			SP_CPORT_MASK(src_port & SP_CPORT_DFT_MASK));
+
+	airoha_set_gdm_port_fwd_cfg(eth, REG_GDM_FWD_CFG(AIROHA_GDM2_IDX),
+				    FE_PSE_PORT_DROP);
+	airoha_fe_clear(eth, REG_GDM_LPBK_CFG(AIROHA_GDM2_IDX),
+			LPBK_CHAN_MASK | LPBK_MODE_MASK | LPBK_EN_MASK);
+	pse_port = airoha_ppe_is_enabled(eth, 1) ? FE_PSE_PORT_PPE2
+						 : FE_PSE_PORT_PPE1;
+	airoha_set_gdm_port_fwd_cfg(eth, REG_GDM_FWD_CFG(AIROHA_GDM2_IDX),
+				    pse_port);
+
+	airoha_fe_rmw(eth, REG_FE_WAN_PORT, WAN0_MASK,
+		      FIELD_PREP(WAN0_MASK, AIROHA_GDM2_IDX));
+
+	for (i = 0; i < eth->soc->num_ppe; i++)
+		airoha_fe_clear(eth, REG_PPE_DFT_CPORT(i, AIROHA_GDM2_IDX),
+				DFT_CPORT_MASK(AIROHA_GDM2_IDX));
+
+	/* Enable VIP and IFC for GDM2 */
+	airoha_fe_set(eth, REG_FE_VIP_PORT_EN, BIT(AIROHA_GDM2_IDX));
+	airoha_fe_set(eth, REG_FE_IFC_PORT_EN, BIT(AIROHA_GDM2_IDX));
+
+	airoha_fe_wr(eth, REG_SRC_PORT_FC_MAP6, FC_MAP6_DEF_VALUE);
+
+	return 0;
+}
+
 static struct airoha_gdm_dev *
 airoha_get_wan_gdm_dev(struct airoha_eth *eth)
 {
@@ -2296,6 +2335,87 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 	return NETDEV_TX_OK;
 }
 
+struct airoha_ethool_priv_flags {
+	char name[ETH_GSTRING_LEN];
+	int (*handler)(struct net_device *netdev, u32 flags);
+};
+
+static int airoha_dev_set_wan_flag(struct net_device *netdev, u32 flags)
+{
+	struct airoha_gdm_dev *dev = netdev_priv(netdev);
+	struct airoha_gdm_port *port = dev->port;
+	struct airoha_eth *eth = dev->eth;
+
+	if (!((dev->flags ^ flags) & AIROHA_PRIV_F_WAN))
+		return 0;
+
+	if (netif_running(netdev))
+		return -EBUSY;
+
+	if (flags & AIROHA_PRIV_F_WAN) {
+		struct airoha_gdm_dev *wan_dev;
+
+		/* Verify the WAN device is not already configured */
+		wan_dev = airoha_get_wan_gdm_dev(eth);
+		if (wan_dev && wan_dev != dev)
+			return -EBUSY;
+
+		switch (port->id) {
+		case AIROHA_GDM2_IDX:
+			/* GDM2 can be used just as WAN */
+			return 0;
+		case AIROHA_GDM3_IDX:
+		case AIROHA_GDM4_IDX: {
+			int err;
+
+			dev->flags |= AIROHA_PRIV_F_WAN;
+			airoha_dev_set_qdma(dev);
+
+			err = airoha_enable_gdm2_loopback(dev);
+			if (err) {
+				dev->flags &= ~AIROHA_PRIV_F_WAN;
+				airoha_dev_set_qdma(dev);
+
+				return err;
+			}
+			break;
+		}
+		default:
+			/* GDM1 can be used just as LAN */
+			return -EOPNOTSUPP;
+		}
+	} else {
+		switch (port->id) {
+		case AIROHA_GDM2_IDX:
+			/* GDM2 can be used just as WAN */
+			return -EOPNOTSUPP;
+		case AIROHA_GDM3_IDX:
+		case AIROHA_GDM4_IDX: {
+			int err;
+
+			err = airoha_disable_gdm2_loopback(dev);
+			if (err)
+				return err;
+
+			dev->flags &= ~AIROHA_PRIV_F_WAN;
+			airoha_dev_set_qdma(dev);
+			break;
+		}
+		default:
+			/* GDM1 can be used just as LAN */
+			return 0;
+		}
+	}
+
+	return airoha_set_macaddr(dev, netdev->dev_addr);
+}
+
+static const struct airoha_ethool_priv_flags airoha_eth_priv_flags[] = {
+	{ "wan", airoha_dev_set_wan_flag },
+};
+
+#define AIROHA_PRIV_FLAGS_STR_LEN	ARRAY_SIZE(airoha_eth_priv_flags)
+
 static void airoha_ethtool_get_drvinfo(struct net_device *netdev,
 				       struct ethtool_drvinfo *info)
 {
@@ -2304,6 +2424,7 @@ static void airoha_ethtool_get_drvinfo(struct net_device *netdev,
 
 	strscpy(info->driver, eth->dev->driver->name, sizeof(info->driver));
 	strscpy(info->bus_info, dev_name(eth->dev), sizeof(info->bus_info));
+	info->n_priv_flags = AIROHA_PRIV_FLAGS_STR_LEN;
 }
 
 static void airoha_ethtool_get_mac_stats(struct net_device *netdev,
@@ -2368,6 +2489,56 @@ airoha_ethtool_get_rmon_stats(struct net_device *netdev,
 	} while (u64_stats_fetch_retry(&port->stats.syncp, start));
 }
 
+static int airoha_ethtool_set_priv_flags(struct net_device *netdev, u32 flags)
+{
+	int i;
+
+	for (i = 0; i < AIROHA_PRIV_FLAGS_STR_LEN; i++) {
+		int err;
+
+		if (!airoha_eth_priv_flags[i].handler)
+			continue;
+
+		err = airoha_eth_priv_flags[i].handler(netdev, flags);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+static u32 airoha_ethtool_get_priv_flags(struct net_device *netdev)
+{
+	struct airoha_gdm_dev *dev = netdev_priv(netdev);
+
+	return dev->flags;
+}
+
+static int airoha_ethtool_get_sset_count(struct net_device *netdev, int sset)
+{
+	switch (sset) {
+	case ETH_SS_PRIV_FLAGS:
+		return AIROHA_PRIV_FLAGS_STR_LEN;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static void airoha_ethtool_get_strings(struct net_device *netdev,
+				       u32 stringset, u8 *data)
+{
+	int i;
+
+	switch (stringset) {
+	case ETH_SS_PRIV_FLAGS:
+		for (i = 0; i < AIROHA_PRIV_FLAGS_STR_LEN; i++)
+			ethtool_puts(&data, airoha_eth_priv_flags[i].name);
+		break;
+	default:
+		break;
+	}
+}
+
 static int airoha_qdma_set_chan_tx_sched(struct net_device *netdev,
 					 int channel, enum tx_sched_mode mode,
 					 const u16 *weights, u8 n_weights)
@@ -3094,6 +3265,10 @@ static const struct ethtool_ops airoha_ethtool_ops = {
 	.get_rmon_stats		= airoha_ethtool_get_rmon_stats,
 	.get_link_ksettings	= phy_ethtool_get_link_ksettings,
 	.get_link		= ethtool_op_get_link,
+	.set_priv_flags		= airoha_ethtool_set_priv_flags,
+	.get_priv_flags		= airoha_ethtool_get_priv_flags,
+	.get_sset_count		= airoha_ethtool_get_sset_count,
+	.get_strings		= airoha_ethtool_get_strings,
 };
 
 static int airoha_metadata_dst_alloc(struct airoha_gdm_port *port)
diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethernet/airoha/airoha_regs.h
index 436f3c8779c1..4e17dfbcf2b8 100644
--- a/drivers/net/ethernet/airoha/airoha_regs.h
+++ b/drivers/net/ethernet/airoha/airoha_regs.h
@@ -376,6 +376,7 @@
 
 #define REG_SRC_PORT_FC_MAP6		0x2298
 #define FC_ID_OF_SRC_PORT_MASK(_n)	GENMASK(4 + ((_n) << 3), ((_n) << 3))
+#define FC_MAP6_DEF_VALUE		0x1b1a1918
 
 #define REG_CDM5_RX_OQ1_DROP_CNT	0x29d4
 

---
base-commit: 903db046d5579bef0ea699eae4b279dd6455fc9f
change-id: 20260606-airoha-ethtool-priv_flags-b6aa70caa780

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


