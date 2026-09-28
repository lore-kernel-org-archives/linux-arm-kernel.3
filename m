Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1969CCA5FA6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 20:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vCSwz9VNW563xpD2rG44QoXA+DsdtHhUzQ3zDgYen7g=; b=1mEvZkBUEeugmXY+NXBFGR0Ii6
	KI+iy1lO3PqZ6Pd3tPt2OdG0heFeU4gidZQEKedFWQN3BERRbn+VsTb4M93hzr7OVSh6Z1l4ghdxS
	IoesPHmk/mT9wyxPrTlwgO/wAaUrc05kcSBGlLo5VFQWDHkQozgugqO5ZF/OWmsKmCmoZ1u+8jkuq
	fVvVxXO7pk4zEQo0C+ltQa3ZFzqacYgPoZeWjsRGMZ6ZfBjdYbxhfsN3VVa6/KQbEZPFBTh/hwegN
	W4AqLIVS4KF+VIeEU5htSBbtteCD1ayhj+uaxF9RwVKVF5k3QKlXSieUk7My/7NXFLfAep7DIk7O0
	gM8UmnfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBI4V-00000001ZoY-0frm;
	Mon, 28 Sep 2026 20:35:35 +0000
Received: from mail-japanwestazon11010030.outbound.protection.outlook.com ([52.101.228.30] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBI4K-00000001ZjW-1eok
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 20:35:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xj1lYCbN8jMsYKXLSJ4diHlSTcZ9WR5Zz3svEt+2Buak+bNF3PmtaJXx1NYALtAz7K553cyseag76PL1iuc7a3943+RgR4X3pX7u2f/tSqHgxD2HZUPL8OqdHmb9gTPOkTLxLNH3nLJAJivdRt67NYYarxTaJM8ujjEV0WK+xT8CLXvMgetbqvqhhcozdRRdugOpll3GmTxo8Vl1WDURGV/6LL0lDdvs8O1a/nA7W2fWu+BuCx085Id3WNcIz5nYPYJSWrZJi5KO/c43s5I9awnoI7aMyv9tfUNhMB3go0xi/Naw9piXKCtdJF2huSMVSkV4KqKzeVf2SzZp29A03A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCSwz9VNW563xpD2rG44QoXA+DsdtHhUzQ3zDgYen7g=;
 b=UJ6Hs6V/FPk/Y3pIUzRA6fnp8PZc+cr6d/bNqn6qX2ZxpesgEDRehKh3BjWpb6ES+mhD4ItcNFZKaSYlTyDWnDnk579rMzEL4LhSNoqfq5ufTPYps+qLwwOi17+D2aZzMkNfGf68lJSG1IaEYmZ5CuBJ8ZfRxCuIM6KzDw2j4ySwFB3AiwaBniNSOEwTiR+4uFd7t4QYo0ktNmrjV5pIKOZiUZKzfXEIxLnwl0WpVFo5ZGa7puALK4R1xBCq68SP83nmFl9X5nY82moG8YTkZPauclfj2vEy+rnC59XIgP7IZnnSlrsZDfXLf+14EXiaq2CK2Ccz7i3AIXry935u1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bootlin.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCSwz9VNW563xpD2rG44QoXA+DsdtHhUzQ3zDgYen7g=;
 b=YfucQcxU6OFq9EmCilHejdnflcyOFH8q3w11TqImT8TqHc5fB0fYc77+ED0dnsjBnW0YUOcpgmpD2OofLuJ39HFfJ2I7rGRJJiGiBuJJ1KY5wlpCCb53jfYVn9YVO13H+Q5CNSTtJ48dNdAAP5wCtetTMNQ+EpvxAbkSSlOuu+A=
Received: from TYCP286CA0065.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:31a::6)
 by OS3PR01MB6840.jpnprd01.prod.outlook.com (2603:1096:604:117::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 20:35:19 +0000
Received: from TY2PEPF00005623.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a:cafe::96) by TYCP286CA0065.outlook.office365.com
 (2603:1096:400:31a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 20:35:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 8.62.32.50) smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 TY2PEPF00005623.mail.protection.outlook.com (10.167.240.54) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 20:35:18 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.32])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id E456B300026E;
	Tue, 29 Sep 2026 05:35:12 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: maxime.chevallier@bootlin.com,
	recv.jo@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	jun.ann.lai@intel.com,
	yi.fang.gan@intel.com
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH net v6 5/5] net: stmmac: Disable S-Tag processing on dwmac4
Date: Mon, 28 Sep 2026 20:34:41 +0000
Message-ID: <20260928203441.34876-6-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928203441.34876-1-ovidiu.panait.rb@renesas.com>
References: <20260928203441.34876-1-ovidiu.panait.rb@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF00005623:EE_|OS3PR01MB6840:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9cee6ee1-1a2a-4d75-0684-08df1da0025c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|376014|7416014|1800799024|82310400026|10067099003|56012099006|3023799007|22082099003|18002099003|921020|11063799006;
X-Microsoft-Antispam-Message-Info: 4wLientPfbf0n5uc5dqz38NiWRgtbQ+GVLNvxlixLK8KJtUS/eZVA1uMF6WF3+S4+g3osrQ6hoWXvhKLq2QgG0Xegqx9baCA7yTyi52zvwHfQoOVF34wOwRCUBOQjnzKMerxq9OD2pjBeg9e7g5EGbOVBgFQlWIzPyrIa+MZ8rcbxRuURJ/ory9IH/htCUzC1W0xPIsbGoscKRQHs8QkhhgJyDgX5oUuYLfKxR0EHkOntiRw4Os9sis5ZUraqzX7P1CUYDRg+Ao67rCGnjej4sWj/8MCl34n7a13k6bjK49brWcNsvz6IaBZxwVL1iZsuVLjWdk6deL/vzbQpJgbrtZqqY92geyCIAeoGQ3rBnlv+Wo2t1u41u7L5GoY9fBHAkynPlqQatI9R+SIW4TkaN6UdPubNjYgQPEIBC7CMBzyeRDLONGuBIts6ey0NEovh7hQuk2seB0aF6d81HhOGtMB2t18pT3KrKYBPfldlMZBjUZLxA0Fz9r9IGQ3WoGyn0Ex8RIQhIWJpGoc8L8z7ZOderaVzI3Vnwei8TR/65ilBZQigd8kbWr1hJItE9saGx9+r1Kif+slABmnnDArYgmGer3v6JPh8H8KHuOFojSLqvwsKueUfas7vxj78SKsOHbKP2J2G1mC5fJqnSfAgVJMzQTVo0wi/RuV6ZNoPnIr0lcM3ZLAnBrOLLJH74z4EYwNiZC/hz/WqDzoT+9O5H+ODKOzWB891VKWRM2pgqzO+BItxi6Ekx7uPgv3GFUD
X-Forefront-Antispam-Report: CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(7416014)(1800799024)(82310400026)(10067099003)(56012099006)(3023799007)(22082099003)(18002099003)(921020)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Lpb+0CuMt7yO0B9m+USGyJ147CblnxRD3ZGcdMP2p5aO9q8b4SQmKQTpwWIFmM4/5IwfJFYDoQiQjxSu0FJIkWIBGrzizoAkJRy5tpb6ZHjLKHPEGnmyd2P6F0+9+HAS3/vRlRN2kFLDxeQbpme8/lYNwPVCdDd/AOVumFYphrSYakL8CbuXYVM05m24EdoiX33W1Cvrf+b8lsRmIu8zEBGNU9bjcCcqUaO3Kx4iYlr3/kU9A9ujYXPtkFruVucLFFu+3pToAsv45qzF+MafHX+h6E/c7jPEABRPBSfu2HiOe70AmG7dKvMbex+GNqlReDxqsze6ICN8QRQCJmkt+KUH9ypi6EfHhmC6N9Y7ZncopvEweli5rx/ItaFgINAIiYxWgemoP583iELQhfzyAl7AC5qVgFuEIHnSjgta4df+UmP0+rYjcPY7WrEtaz2f
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 20:35:18.0962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cee6ee1-1a2a-4d75-0684-08df1da0025c
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF00005623.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6840
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_133524_437686_ACA0A846 
X-CRM114-Status: GOOD (  15.39  )
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

Currently, hardware VLAN stripping is broken for 802.1ad tags. vlan_rx_hw()
hardcodes ETH_P_8021Q when putting the hardware tag into the skb, rather
than using the actual protocol from the packet. Because of this, packets
that contain a 802.1ad outer tag are incorrectly passed up the stack as
having an 802.1Q tag. This causes QinQ ping between two hosts to fail.

vlan_rx_hw() is shared by dwxgmac2 and dwmac4: on dwxgmac2 the tag type
is available in the RDES3 write-back descriptor (the ET_LT field), so the
outer tag type can be determined based on that info. However, dwmac4
doesn't seem to provide the tag type. The Length/Type field in RDES3 only
indicates whether the packet is single or double-tagged, not which tag
type was stripped.

Since dwmac4 cannot report the stripped tag type, it cannot support
hardware S-Tag stripping correctly. Therefore, restrict the
NETIF_F_HW_VLAN_STAG_RX and NETIF_F_HW_VLAN_STAG_FILTER advertisement
to dwxgmac2 only.

With this, 802.1ad tags are left in place and handled by the software
VLAN path.

Fixes: 750011e239a5 ("net: stmmac: Add support for HW-accelerated VLAN stripping")
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
v6 changes: None.

v5 changes:
- Rebased on top of latest changes.
- Added Reviewed-by tag from Maxime.

v4 changes:
- Dropped all "double VLAN" references from the commit title/message.
- Rebased on top of the S-VLAN rework.

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b007ff120471..5af245fd9ba0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6211,7 +6211,7 @@ static netdev_features_t stmmac_fix_features(struct net_device *dev,
 	if (priv->plat->bugged_jumbo && (dev->mtu > ETH_DATA_LEN))
 		features &= ~NETIF_F_CSUM_MASK;
 
-	if (dwmac_is_xmac(priv->plat->core_type)) {
+	if (priv->plat->core_type == DWMAC_CORE_XGMAC) {
 		if (features & NETIF_F_HW_VLAN_CTAG_RX)
 			features |= NETIF_F_HW_VLAN_STAG_RX;
 		else
@@ -7990,14 +7990,18 @@ static int __stmmac_dvr_probe(struct device *device,
 	ndev->watchdog_timeo = msecs_to_jiffies(watchdog);
 #ifdef STMMAC_VLAN_TAG_USED
 	/* Both mac100 and gmac support receive VLAN tag detection */
-	ndev->features |= NETIF_F_HW_VLAN_CTAG_RX | NETIF_F_HW_VLAN_STAG_RX;
+	ndev->features |= NETIF_F_HW_VLAN_CTAG_RX;
+	if (priv->plat->core_type == DWMAC_CORE_XGMAC)
+		ndev->features |= NETIF_F_HW_VLAN_STAG_RX;
+
 	if (dwmac_is_xmac(priv->plat->core_type)) {
 		ndev->hw_features |= NETIF_F_HW_VLAN_CTAG_RX;
 		priv->hw->hw_vlan_en = true;
 	}
 	if (priv->dma_cap.vlhash) {
 		ndev->features |= NETIF_F_HW_VLAN_CTAG_FILTER;
-		ndev->features |= NETIF_F_HW_VLAN_STAG_FILTER;
+		if (priv->plat->core_type == DWMAC_CORE_XGMAC)
+			ndev->features |= NETIF_F_HW_VLAN_STAG_FILTER;
 	}
 	if (priv->dma_cap.vlins)
 		ndev->features |= NETIF_F_HW_VLAN_CTAG_TX;
-- 
2.34.1


