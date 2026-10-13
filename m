Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D37CA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 11:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dXIJ8xkcncFbQkpA/INiogKRasKZvPb0dIiPW9fm01k=; b=XoSQj444o3/WLm0vAze0ajr2I+
	AokJvbauE8hboA8QFHz4fgbAG2HOLzvZVaGG0Ye56V1KQU+ibXcrstf42dP0mWKy7/7uKu+o50agI
	bndZmz4w/rbm7b5G0oY4NuWGf2qilirpAYNOSCsDduKrl25iK09FZKvmCWWkTtC2Gpdd4A/mOXnb1
	ebXdOS65jO27tGHZbW6eOlz4zCmUUwb8V83patkTBA8R/7cM4eQZ1qI+mAqBlYJCuJMUKdb3cbHNq
	uiC9+nuOIHb22TEKiAlETMstRu29nANEhNIlru85xiieKEM1aIxIsnKFA3YAIl4ZK/iy0aekFDw7h
	tSR+Nv+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGawo-0000000Cjhx-2wiM;
	Tue, 13 Oct 2026 11:45:34 +0000
Received: from mail-japaneastazon11010043.outbound.protection.outlook.com ([52.101.229.43] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGawm-0000000Cjg1-1c6o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 11:45:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VOtaOFL/kB6TdYYNDbZS5mCQva7TGRwlmYtw5n+j3jDQNYitPGOCQtrOvSd2qHdNI5ainw+ygF8hFC7zqUIw42En14ovnhb60QBJaj+ozX+73ihUah1aGAtFnZ//4kjsOGBBboH9o1rOCuhmA6B/b8Cd8V+XAh3mVa8DA65zDf3EYOZ/4R82MkwAiBnw9CITFd9mbzMjdUv70AQtkDTrgc1DvIhH10M6YrqHKmpa1zzjsF6akqFYl+sLWlS4tniEFg8buUY/ON07KQ1WC0sa8PfhXhjEgNb+8D17Nrxz/9EOfYv+9gQV6JJ+5NUnY8GBF8fYjjpPD5MZeyZkfB9Zkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXIJ8xkcncFbQkpA/INiogKRasKZvPb0dIiPW9fm01k=;
 b=hOrDUKCm2o6wT9NB7PjMvhUKe5H/UOx3/CEhC5M6yLJ238dsZxcktga9LXLEjRDnJCM7RgA7TNGxbmx5SEFZGvOgipKGwD5djiQTgev4yE5IsCThcfAciZfwSluFCuSZFwGy47XomdDIE9KjMO6wuWGBzscVqRWpibf8iXLVD9OAO+DI3rCx7ee3XMzAzR9xC3Fn7mg5eNAIL4pUV42WJL+yGPIF3emoRjVue2S7Hk7LWGQzlHtb5rMlok5l4InQtShDzGOTIxXdo47sOSViCCgYzgmHE3lsWcD6h9P5Q1ssf1biNS36UrTP/Vo8WEIGmU5sX1WtnRHdFBebUfcbiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bootlin.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXIJ8xkcncFbQkpA/INiogKRasKZvPb0dIiPW9fm01k=;
 b=kUsuUqRFNVb7BcwL3haCmB+PllaxqP0vAJkPy3ybLW/GWdG7X9D50YPYXMxSCCE8XGVVKcvTRP51IyI7IwzQvyl5N53CgsM0xDD8HLQ0fdIlUOFFlszzFwmXPYFFoNFL9Qu9rJFj85ZTiGhMqYrRvmsJ1D7dD1xOJ/MtlCIZ1wc=
Received: from OS3PR01CA0075.jpnprd01.prod.outlook.com (2603:1096:604:da::8)
 by TYRPR01MB13740.jpnprd01.prod.outlook.com (2603:1096:405:18e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 11:45:24 +0000
Received: from OS3PEPF0000003E.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:da:cafe::d) by OS3PR01CA0075.outlook.office365.com
 (2603:1096:604:da::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue,
 13 Oct 2026 11:45:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 8.62.32.50) smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 OS3PEPF0000003E.mail.protection.outlook.com (10.167.240.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Tue, 13 Oct 2026 11:45:22 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.5])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 37880300026D;
	Tue, 13 Oct 2026 20:45:17 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	xiaoliang.yang_1@nxp.com
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH net 2/2] net: stmmac: Report the TX DMA threshold per queue
Date: Tue, 13 Oct 2026 11:45:03 +0000
Message-ID: <20261013114503.57487-3-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013114503.57487-1-ovidiu.panait.rb@renesas.com>
References: <20261013114503.57487-1-ovidiu.panait.rb@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PEPF0000003E:EE_|TYRPR01MB13740:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7399e220-82d7-42c1-a0df-08df291f76f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700016|23010399003|11063799006|56012099006|18002099003|22082099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: 5ZXZ7VtQVhtPuk/WBdOpowdsViRmDL8NzTjsiDJmLDShSfLQMnhNCSfcAf9lYc5UYdp005S7IpvDu4lPSEOZvN1XK/nTNbk0c3hNKOZZYtYwD2wkwN3OOD8xD6lsBvUMXeh15Lfnx+3JQCeCosDo8BvPiOOr/4k+MhBy+pp+OMPDr6TI6fv1OPQ6lRki+J/WkpHZPoF13I1fVoaYbVg7sIqxuIpURsDRT9zpUBZnRG+xLP7sYVM0zam/XvGHpR56sRnNm50XmvsyKyilUOWr87pEopAErAEtLMfFBOUNnAcHQvIdX2o23YxsxM64yEjODtyWC5NY3pwT/4jEAQ4G6c0ReO0a3oY0fhqYDj6q/99x/+4T2VwAbsQ8R+WnixojfXBGVdpguf/AUqLQMtaUds88rZ6+9/RdwYHvQDT4TA1ngDLHWuRQHTfDbskBSJeaBNSVXztcWxlY2yM4SNabrol4Su1KBNpE2FhPAIr6wc1yhsvvPzoewXzUaD40BcorG94hpK0rx/BFhAvdYBqkfd/ldRki4yPo9LXWx0LNxvTOhLURVDip4gNP0RuTf4ZvU5Jdai0pKQuv3MdRiO8NvCB5739VKs51+nTwdC8Pq+GbFOLssK4PrjrVLRjL6Z7Cdx5PSqY8vLaRm765k+8Tb6+EyLx73WaZ2UQpCbX/9c2DOy3KFqRbv0H+iIchzxcX3LMApxzoxMHAtHahopiWLw==
X-Forefront-Antispam-Report: CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700016)(23010399003)(11063799006)(56012099006)(18002099003)(22082099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: P0ZLqLv4hPngVOlexAgWBFSazTF0mIlny9FlJ+6EE2aoKUEP9xJVwFZf7+EtlJ9F16dK32u6rs9FfTqX2yDIIZJ5htDZX3fcOQqpY1GUMsJDQsj0b5keP4HcxVHJRG1QgL+WoH1PZUlnvt5XZjmKpYY3v+2+9/OplYa5wY9eZ8Ah5csOXx4QGGTTZMlnvIj+nndzetg4V4/jG8N0U0UTzqiYtvadHGrjugw6mY2zgyxdf6jJLLZ37Ix8Xj8duqsq0ZBueGJSd5Bs2J5l/t6snAxR4mz7QzfXQewZ4bXYc+axQ8QoNHCHeSeVY1hj+91KUwp81exxb1gmfqvvq0IaaR66QHS2yLhhK00ZtHncLbEq+RVAAaUW9IH0bkGa+PwHtEe0GsjPsTrM9gYHrnO8ZK0e0SH8KUSotbyLvui+obxWSOxvIpqmQWjn7BjKWhRy
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 11:45:22.5797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7399e220-82d7-42c1-a0df-08df291f76f5
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS3PEPF0000003E.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13740
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_044532_718303_77924E4A 
X-CRM114-Status: GOOD (  15.49  )
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

The "threshold" ethtool statistic reports a single TX DMA threshold for
the whole device. However, since commit d62a107a4f15 ("net: stmmac:
prepare dma interrupt treatment for multiple queues"), a single TX DMA
threshold per device doesn't make sense anymore, as each individual queue
that underflows gets its threshold increased, so the queues are out of
sync.

To make the reporting accurate, remove it and report the threshold of
each TX queue instead, as "qN_tx_threshold".

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h         | 1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 3 ++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c    | 4 ----
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 1729fb29ece3..c74bc7c9750e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -158,7 +158,6 @@ struct stmmac_extra_stats {
 	unsigned long fatal_bus_error_irq;
 	/* Tx/Rx IRQ Events */
 	unsigned long rx_early_irq;
-	unsigned long threshold;
 	unsigned long irq_receive_pmt_irq_n;
 	/* MMC info */
 	unsigned long mmc_tx_irq_n;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 30e0d499326d..c616a1c95e5d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -89,7 +89,6 @@ static const struct stmmac_stats stmmac_gstrings_stats[] = {
 	STMMAC_STAT(fatal_bus_error_irq),
 	/* Tx/Rx IRQ Events */
 	STMMAC_STAT(rx_early_irq),
-	STMMAC_STAT(threshold),
 	STMMAC_STAT(irq_receive_pmt_irq_n),
 	/* MMC info */
 	STMMAC_STAT(mmc_tx_irq_n),
@@ -289,6 +288,7 @@ static const struct stmmac_stats stmmac_mmc[] = {
 static const char stmmac_qstats_tx_string[][ETH_GSTRING_LEN] = {
 	"tx_pkt_n",
 	"tx_irq_n",
+	"tx_threshold",
 #define STMMAC_TXQ_STATS ARRAY_SIZE(stmmac_qstats_tx_string)
 };
 
@@ -496,6 +496,7 @@ static void stmmac_get_per_qstats(struct stmmac_priv *priv, u64 *data)
 
 		*data++ = pkt_n;
 		*data++ = stmmac_get_tx_normal_irq_n(priv, q);
+		*data++ = priv->tx_threshold[q];
 	}
 
 	for (q = 0; q < rx_cnt; q++) {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b5ee0f297df6..2fed7713e376 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2633,7 +2633,6 @@ static void stmmac_dma_operation_mode(struct stmmac_priv *priv)
 		 */
 		txmode = SF_DMA_MODE;
 		rxmode = SF_DMA_MODE;
-		priv->xstats.threshold = SF_DMA_MODE;
 	} else {
 		rxmode = SF_DMA_MODE;
 	}
@@ -2836,7 +2835,6 @@ static void stmmac_bump_dma_threshold(struct stmmac_priv *priv, u32 chan)
 		stmmac_set_dma_operation_mode(priv, thresh, SF_DMA_MODE, chan);
 
 	priv->tx_threshold[chan] = thresh;
-	priv->xstats.threshold = thresh;
 }
 
 /**
@@ -8135,8 +8133,6 @@ static int __stmmac_dvr_probe(struct device *device,
 #endif
 	priv->msg_enable = netif_msg_init(debug, default_msg_level);
 
-	priv->xstats.threshold = tc;
-
 	for (i = 0; i < MTL_MAX_TX_QUEUES; i++)
 		priv->tx_threshold[i] = tc;
 
-- 
2.34.1


