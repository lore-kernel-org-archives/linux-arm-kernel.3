Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB09CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 12:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qAiPV9s09eZQCK9pbDecU0PJOarr3yujb/6PZToOKFM=; b=4nXM482gHqIRcg3lRs7KRZdjwp
	a6zKbF0bi5Lj2edNZGrXb1tV7EP056RbSjVyWkCvwLMRXSA1xggYHG7SjFFG06dhAyVjY5GAiztLl
	ZN5dpVhATwQMT/HRk/73K4uZFpRhtCCxaFGxYzZ3BbZ1ycA31QxCUS2TJOP2Pr8PTovwfQkEbEKaI
	v7laWRKQ9L+3eCn3m6UJI0p6sInoH+fi5TqEVv/lXI+KDrUhvdVBUrZl1XYmYnbXwTVw6krdEuJr3
	wIezPKgTHzrzv16Z35SiNScU9QN628Aos9vc4ZSrWeRyfp08M6dUC4uoHY81jirlbSdDFkQSA8XmN
	O6LpFxAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU21J-0000000BA75-0epG;
	Mon, 01 Jun 2026 12:45:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU21H-0000000BA6x-47X1
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Jun 2026 12:45:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=qAiPV9s09eZQCK9pbDecU0PJOarr3yujb/6PZToOKFM=; b=WYnNky/6NnKBsEAj1GjfvZvyNW
	IYAP0tCQrFvUoc00pGbGv8thir6ScA0wRa8YG2TmzoAKlRa7vuWakGVO+0lIl+hIxfV4YA0MuKkla
	E/KDisoYGRx+aks3Wxhr5RH+lbGZh2T9bbuaLIDR/Ph2t41uDSakR6lR/9jvBAGJHsOdShiGswfBl
	8d970pP3rGVzH2XGnoNS6uXnRsCZJM3dCosKLUh27+lwNn2+BUejUYRbmoTFR4Gx9vV0BDUlV/FZ7
	TXxjdYgKvfXCFWWwyQjq5MQcV7X+8FdWCW1NwxhC8WuEC4PcpRLrAzqNmTTD5WLzV1yh1JtG4B8WK
	hf3+mGfQ==;
Received: from mail-eastusazon11011044.outbound.protection.outlook.com ([52.101.52.44] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU214-00000006iqS-0poX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 12:45:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vIptba2QeIaUFu4t2/2kmDlQRWUYoZ2GrYMDHyh8L1Mjtxllc7MFK276Am/09TJhcIirV7CVUh8TbPHX/0chdmxTM/KyoMRQlHQT5uaQV/iRxDYBW63seI/iIchNiCjERhVaL7OuAT+w2MCcUmhpZEUGfj50Sp/0VqhZwYqegHkhSywgQHBuG1/ZDEB2TsM7Sf7RHDApfhMYrF68YAS/kuvN5x24TQVWtJLnpJYnHZaa6Qq4DiJoVuflpe4F+k98woan+iTYALSzqrp+wWc1/LhZSnqrKcMWMPKMqVJOPfV7nY4Epd38/F1Lkzg8QJzPNb5dUA/83pRSiFd8kf/RsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qAiPV9s09eZQCK9pbDecU0PJOarr3yujb/6PZToOKFM=;
 b=VRUHyqpDEt2stSRrPvFSdU4z6/eMkGQdQCCKvzM/sefNDZ6qJQqiJu/DCPoZ2szA3WvqSBaC381lvKtTmbkX0ogl94petCBjYXdrUnTjoTyiEMAhl5BqeHOST8WBX0thQdoglVrSCg7IOVyXzYE0IGY5mWk2Jq3uIVFPpMno0P9gDQ9aHzFzhWH7Qy9sLY4BllGZDB1WpBsAy0Hm0uyEHuyR06603wEHDB1lwG0gezF2sJpAdHPF9g15xQxWp6qCkfqjJ8hLsDfydcL8n3YnpmO5vmRBO8WyVucR9HH/kkXDzp4yxXLU+2IRb8SJBA/WTiitcT8WtuYC7MaL29cpFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lunn.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAiPV9s09eZQCK9pbDecU0PJOarr3yujb/6PZToOKFM=;
 b=cfu5kHWC4gd8MLPlgUBgaER4unZqHBilFgEmFic92HNCi8CDGk8Rt1lIWbrjEYrhEQ3cGxq8uz+igSxc5bdG6tlkokO1hnIS3o5KA3FsbpBi36Vi0z4o8B3jY4Uhz43TGGqcyb8CfRpITW2G4I2Sd1aScQbPCYf3gzO2u8NB8z0=
Received: from SN6PR08CA0031.namprd08.prod.outlook.com (2603:10b6:805:66::44)
 by IA1PR12MB9063.namprd12.prod.outlook.com (2603:10b6:208:3a9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Mon, 1 Jun 2026
 12:45:05 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2603:10b6:805:66:cafe::33) by SN6PR08CA0031.outlook.office365.com
 (2603:10b6:805:66::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.15 via Frontend Transport; Mon, 1
 Jun 2026 12:45:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Mon, 1 Jun 2026 12:45:04 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 1 Jun
 2026 07:45:03 -0500
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 1 Jun 2026 07:45:00 -0500
From: Suraj Gupta <suraj.gupta2@amd.com>
To: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <michal.simek@amd.com>,
	<sean.anderson@linux.dev>, <radhey.shyam.pandey@amd.com>, <horms@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <harini.katakam@amd.com>
Subject: [PATCH net next] net: axienet: Use dedicated ethtool_ops for the dmaengine path
Date: Mon, 1 Jun 2026 18:14:54 +0530
Message-ID: <20260601124454.3384601-1-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|IA1PR12MB9063:EE_
X-MS-Office365-Filtering-Correlation-Id: 50764a5f-882f-454d-a099-08debfdb9ad2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|82310400026|7416014|1800799024|11063799006|6133799003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: SR28xbgH31eiL2hxxZlOTvP5sibq7K4Cr4xKd3tadabV8f5r6entSl1G/XoIt7IyOyfIXHPcOU00acCktYJ0pXg9p0xyh7TTwP5TALydVc/9/R+D2MyMr4CqWOV6B7N/nX56fPIipXOQOW+DMTfv5hLWY1BNEtvZ9UK/IVYU7wc5DcFrO9zcbglfV/F7DlIliT7h3jZq66J7/eAJTVeALKgfKMl86ElgcfA6xuZzSfE4/TxVFgIYL4m0tb1Q70oX0duCk/nbsi+UF1thcB/QTUJ7XbJnKLcgf6KqDka2HUkVTMhn5Qgo1QLUfRo0Q5WMdWEk4hWHRp6SNbovOC2uFQ2FGw4AFnWcfcRr8JOvZUQBc8OlsfMA7XSsFVtd+oPfyXvCLIUG11NUiuNqvnMn4IGGkc+Tjvs/TtfRdySO2nhwyhFtNDugwcCd+4P4ZvP/iRymdIvpS2+fpqIZTkAAYB6MtItMbseRVmuug/waeNCpzRXE5qJxaHIzqUtMvgzey9YXL3bmifW57VOXRLTTadCLCS0S+vuuGDnfN1VIV8MhAIAGDGmuJ6Hoe0sKiIOM3fWoqQsN04fDtk1YP7tU/K7xcAY61WaWwzTJWwspkZZNNbdVKRQWdGmeT6aCWNjA/sndtlQAAKfVIxo6YBixHOBfiCUa2KNJwUCmUp3+T7wcrW8zzhFNxInuvoF3qRPhWUtr63oEapXlDeauhBPz99Kh75ab262f3JTTMR/XZ9Y=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(7416014)(1800799024)(11063799006)(6133799003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: E4e0IxxnvZzJeDyvYrrYEmE66NxnSgpXDifgDhOoth/PtjEIv5ncIDCIcNCxRpwLtQIxAewFIxRMVpAfS80ghftvxsezw5AZYWKwWpNPjWfOhcfKPyR2PAsDaNI4uMis6z0dvYUwrN0k/IpIbdGLRD9x2FfGB1cE7ick2WAIjbfVWGu8z9Jycg/eMAegLD5DNxWmlRLZDJd8Juke0N1rbpZNAvErvsAwDiilqB+VRB42HhN548rQM5KHI30hjBRVoGZpQzZbW6Q3V1+oPPnfjcpN1KdBXLyjovfl9KvD7zA3YQu9om316onfJ4SNceiFpsI1ntEMT6RJ+lr4mDLjyr4GrD9YOb9+Ve/Z3DnhPdboleA1XVVghi/t7kVZnDKfrfUtcU9xk0+wkzTCeQ8Qr42Pe5W/Hu2IFoTbMR95NuH1MyRTb47vNRuHjXupFiH8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 12:45:04.8703
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50764a5f-882f-454d-a099-08debfdb9ad2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_134515_005709_9996352D 
X-CRM114-Status: GOOD (  13.75  )
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

The dmaengine path shares ethtool_ops with the legacy AXI DMA path,
including .get_coalesce/.set_coalesce that poke XAXIDMA_*_CR_OFFSET
directly. In dmaengine mode lp->dma_regs is not mapped by axienet, so
those ethtool calls touch unmapped/unrelated memory and report values
unrelated to the channel actually in use.

.get_ringparam/.set_ringparam only touch lp->rx_bd_num/lp->tx_bd_num,
fields used only by the legacy path for BD ring sizing. In dmaengine
mode the descriptor ring is owned by the dmaengine provider and these
fields are not consulted, so reporting them is misleading.

No dmaengine API exists today to query or program either coalescing
or ring size on behalf of the client, so neither can be exposed
meaningfully in dmaengine mode.

Add axienet_ethtool_dmaengine_ops without the coalesce and ringparam
hooks. Also move the ethtool_ops assignment from early probe into the
if/else alongside netdev_ops, so the legacy and dmaengine paths pick
their respective ops in one place. No functional change for the
legacy DMA path.

Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
---
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 27 ++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 263c4b67fd5a..fcf517069d16 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -2536,6 +2536,25 @@ static const struct ethtool_ops axienet_ethtool_ops = {
 	.get_rmon_stats = axienet_ethtool_get_rmon_stats,
 };
 
+static const struct ethtool_ops axienet_ethtool_dmaengine_ops = {
+	.get_drvinfo    = axienet_ethtools_get_drvinfo,
+	.get_regs_len   = axienet_ethtools_get_regs_len,
+	.get_regs       = axienet_ethtools_get_regs,
+	.get_link       = ethtool_op_get_link,
+	.get_pauseparam = axienet_ethtools_get_pauseparam,
+	.set_pauseparam = axienet_ethtools_set_pauseparam,
+	.get_link_ksettings = axienet_ethtools_get_link_ksettings,
+	.set_link_ksettings = axienet_ethtools_set_link_ksettings,
+	.nway_reset	= axienet_ethtools_nway_reset,
+	.get_ethtool_stats = axienet_ethtools_get_ethtool_stats,
+	.get_strings    = axienet_ethtools_get_strings,
+	.get_sset_count = axienet_ethtools_get_sset_count,
+	.get_pause_stats = axienet_ethtools_get_pause_stats,
+	.get_eth_mac_stats = axienet_ethtool_get_eth_mac_stats,
+	.get_eth_ctrl_stats = axienet_ethtool_get_eth_ctrl_stats,
+	.get_rmon_stats = axienet_ethtool_get_rmon_stats,
+};
+
 static struct axienet_local *pcs_to_axienet_local(struct phylink_pcs *pcs)
 {
 	return container_of(pcs, struct axienet_local, pcs);
@@ -2792,7 +2811,6 @@ static int axienet_probe(struct platform_device *pdev)
 
 	SET_NETDEV_DEV(ndev, &pdev->dev);
 	ndev->features = NETIF_F_SG;
-	ndev->ethtool_ops = &axienet_ethtool_ops;
 
 	/* MTU range: 64 - 9000 */
 	ndev->min_mtu = 64;
@@ -3021,10 +3039,13 @@ static int axienet_probe(struct platform_device *pdev)
 		lp->use_dmaengine = 1;
 	}
 
-	if (lp->use_dmaengine)
+	if (lp->use_dmaengine) {
 		ndev->netdev_ops = &axienet_netdev_dmaengine_ops;
-	else
+		ndev->ethtool_ops = &axienet_ethtool_dmaengine_ops;
+	} else {
 		ndev->netdev_ops = &axienet_netdev_ops;
+		ndev->ethtool_ops = &axienet_ethtool_ops;
+	}
 	/* Check for Ethernet core IRQ (optional) */
 	if (lp->eth_irq <= 0)
 		dev_info(&pdev->dev, "Ethernet core IRQ not defined\n");
-- 
2.25.1


