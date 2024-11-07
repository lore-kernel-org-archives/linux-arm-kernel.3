Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A252D5AE6A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 06:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J39ztJJPp5Nd4R5VpwzQyK2Ms6KeAXzG+PM4hDlqzSM=; b=liPl0gh9/gO/MP8E4LIVSaeKpu
	/L6edWrW8RHygztZroezc+x8Nvnf5iX5sWFwPoSCb4Xt1pBMfhq//dcIyByq3gsZHkqBCtNW7584g
	uYIPr1VDMppD1izctkQgONXuA6fxm/k/auG1iFblb2irntvYgcwyiqdvDymc9EFu8PKKSeJ+HbJnM
	AVCBUAzTiO4su7EtHDZy076dLkP0msHI+dWS/t9L8iG9ziym81v1440BkW8dycZ23nYc2ueoamng5
	8QTENNWJaiCGU+TvzRG1eadVrO2U9HBJ/qrmkTwSsPU7B+U2wTTYLeejE4/fAgBb9xeqTYPUDD3+o
	fUbheEkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8wFR-00000005sMP-0E77;
	Thu, 07 Nov 2024 06:44:05 +0000
Received: from mail-bjschn02on2070f.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::70f] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8w8e-00000005rIa-1zuq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 06:37:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O4i8+7Y/fw0F1TjUJK0HFdXjjzfCeiufGirA2nI5Vi7LLvwMDfXVY3sBO1oa2RJcgAtIEUBhASfXVULBbbtFD5ofXUv2mLQRh4psjONCeXpdY9s1k3pHvTtGE2vYx+09estYs7CTSPWhDBRX9u1LeAaLXkptgmPQD0ODf1QSzncgVz4aEYhEWLmd53A6x1N7CyaxkX9Ddwexo9BN9y1S91sFz/sqy3/TKADl2q89ylP1w9nwTH+GNg6G1QKFAygKaKXy6HehpDBPU/F2j/JTxDkdgBYo0t6G4p5Rn23VIl5PojYuVuatxd6xPm0DUkD4YRVxPDHUn3yKBe9/4NFFNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J39ztJJPp5Nd4R5VpwzQyK2Ms6KeAXzG+PM4hDlqzSM=;
 b=hPzqSSfX4gFt49/iHNq8O9rpKuaHoq05My7NrQZ903+bPD4k5mR+zZ/t75zmnd6Iu1JV8MEzkgtjSqfKson9LgZR8GVxwzQZSNITstTgZI4NAe4eEZERvwF8hFBc8x/11UHtGEF8Pd3BrNpvLKUALLkLU1bWoCSC+hTvFqzCHWwQPpjI9fKP8jCZFmzS4jw/anOh/IpmW6fRKq0AXtBtyV7BHz7U8S/H3D4WNo0ckJNgBYHj8d5IA3GXkPwkl6A7o5u+jMj9PP/Zht2hhkQhl48RQlJhvRZp9wBMbQzRH9X6ByKGPtgIBZ0KRcqZCbi+sr+ABu0r/75hG/Hmr/xGcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:f::12) by ZQZPR01MB0963.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.26; Thu, 7 Nov
 2024 06:37:10 +0000
Received: from ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn
 ([fe80::617c:34a2:c5bf:8095]) by
 ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn ([fe80::617c:34a2:c5bf:8095%5])
 with mapi id 15.20.8114.023; Thu, 7 Nov 2024 06:37:09 +0000
From: Ley Foon Tan <leyfoon.tan@starfivetech.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lftan.linux@gmail.com,
	leyfoon.tan@starfivetech.com
Subject: [PATCH net-next v3 3/3] net: stmmac: dwmac4: Receive Watchdog Timeout is not in abnormal interrupt summary
Date: Thu,  7 Nov 2024 14:36:36 +0800
Message-ID: <20241107063637.2122726-4-leyfoon.tan@starfivetech.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241107063637.2122726-1-leyfoon.tan@starfivetech.com>
References: <20241107063637.2122726-1-leyfoon.tan@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0034.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::11) To ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQZPR01MB0979:EE_|ZQZPR01MB0963:EE_
X-MS-Office365-Filtering-Correlation-Id: 4472be9e-78d2-47d4-dc54-08dcfef69afd
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|41320700013|38350700014;
X-Microsoft-Antispam-Message-Info: ABEevHAuwl3TNStqcZmoJOJrTwnCKTvJYbM9sh8NnA8ZZWquheGxWlPrYPbdWdn/pJV4j1LM7CXChbikobN5DKWSmQOSck6WLiXjxD2Iaa+YW5SFzFDKpCSNhFPcIsyD4ck2lxW6KprNc3lkCX3ECGhBVruNzQxsUfMM7CvBIo98rEgmvoTe2RcBzhkMNZWMq1bOLkXrkvwcNLhft8F084dUYuIIh57GrtrKj1lvnela6zg+HLffodwcpWsEqBbSRC3ngdV9aDWoteybN6aQQLZ+Tqz8ONLAYmelQiCEN/y/s5gz8swaAtXZDS+3/iKdnOkAzTBPEcU07vyhAIDym26lzrlmW3Hvdw51tr10Yf9uwdy2fJGJTtPU9OJkXWLuuip1c0G6Tn4Vn7WzwgC27SNvPOSvfqQhO3oJNl4yZiCM8pUmkisDg5ZwFRW7SJM9EtwiXxJzjigUuOe8oKm8sD0WQ4JGabTyenLTYdTgOt/QfYEF4z8Xa9nVxWUVV3BXJqAkK5WX07iGTrlTcJ/UT7DtoMEwp2G0SV2cYBILP6WIfMvRsGqHBMGvSC8M8E783h7+rDFySLfMpHpOA617+4RX/9W5CE+jLCqPQ0ai3syPQ3QvEqVbDTMdgM9NEY1x
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(41320700013)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MVNOjN4p7Lhw5D5ADRVY06mJyPRsEONHxoc1Z8KR38WMLMhVkYZdb99uvcT0?=
 =?us-ascii?Q?2DU4ur8092nSJZkVZii5LGcxVFppdZDN+BHu4hE86whJEMhUguwWqik+bFh+?=
 =?us-ascii?Q?0BPNSrQqGWErtZCTr022F1C5twamo9x0uerqBhXy8MLn+25VjjDiZjc75sPx?=
 =?us-ascii?Q?7vww/lNndh/b8XFwDbbJUAOngKRGMU2MzFo4On0n6LKfq7LVqtFmbdY+9iGX?=
 =?us-ascii?Q?rgNwkthYPfM/Hm70Z318UVHIB78hb31U1g9MkI6ql+XrfNOD9wRinmEBoN1k?=
 =?us-ascii?Q?daSuWDg3G9HIqipgOuxYTVbtgGht1oo0xyIg3aXkFPl2/F3hrkWEQzHN2FEp?=
 =?us-ascii?Q?xNIBQbDpImXpoikMDqxXCkvCOUknu16/aGBkmCwQ9fGFXyypKJ9uMI8Qoc2R?=
 =?us-ascii?Q?j6zn4COMjEwZhYXQ/iUeOnRAfq9hTOe7AfsXklqle0F+PLGDi23593o9MxiJ?=
 =?us-ascii?Q?Q364aoRgHFY9je88WtbfoyqReqq+w+FGQd2nbygBXwOk+mNhpMkWdxoe74uG?=
 =?us-ascii?Q?ieEkKynlXHEy73YQeIfEL+MY6puoN8fRhM7d5KpogeVCXw8XYQY55C/YQpX1?=
 =?us-ascii?Q?VWNA0X4aHaRBqbAtiuOFw4DYFuHehIuN5nm2ZYVSxM4www1wl/WOPlTRE1/b?=
 =?us-ascii?Q?PixILUw1tmvk5ksV4ixd0OHCp2ytUJO3K7Mvr7SuvrkJQyC2cxtsgfvMH401?=
 =?us-ascii?Q?KSp2DzfiHXfUqAgsuPDlY8NobV2dVkC6434T33p1ZBDQLLmIMUiM+KSgBV4v?=
 =?us-ascii?Q?0IdKdQDoXJ4X4jkz29Tm2QC+SnvTY8Yu6qd8CB0IsfsE8UmjivtrjKp3/Vl7?=
 =?us-ascii?Q?upYIVHZEnSYDB6vbMXZYKk2PNVILxp9xahP/+7Y2ot9k2lTDCDRvsu6MqRuS?=
 =?us-ascii?Q?PIgdY56bQt4n0qKYfWWpIxFJ+BLbTZemYVf0DSv3ZiQXYPgTeow3xZPWBDl/?=
 =?us-ascii?Q?y/SlsoEOJ8G5e9Rywb3Z5cge+GHteVq8HKfK5ElyNfIOdLzWnA6fwMRD9Q6l?=
 =?us-ascii?Q?f+GyNqbsdd0LwxVSFYbMgVn/vNE3lDJtLz70VEqV+ox7BSF/1gjLWaKAIOB4?=
 =?us-ascii?Q?KJeG6A7598K+bozTnPY66nBPXenALN/WIP/M9YD+ciJdBrwPWHa73LopQtRs?=
 =?us-ascii?Q?YkhYzwAFRzVCjFzb3oJSfRW3x3T0Dm5WcVX0gp11l/ilrEdj9q2w9dvmZJm8?=
 =?us-ascii?Q?zYYxWVe8zSkmiv+HS16hx8/vwJTPIjJ1Ff7ZAL6FXM+sS74PIU/pu/9cpyPZ?=
 =?us-ascii?Q?f6JrDtuz9DLBWdrcXVJQaczAGmlQtvgEUns8W2EtnPxkqCgFrGtsxhdQbLX+?=
 =?us-ascii?Q?w+h4xALugxSFPRhG80zmCIRaGHG92u5dTxphrqOGGn56ZsTgn0QCMF/iqSGz?=
 =?us-ascii?Q?p6fx2rd/ahzCE66YN9JPaFIKYYGythJh7ZINBsj9VJ4ITcdTqXb+d4Gh0mgT?=
 =?us-ascii?Q?67pbCVcA52HU4ioldcNf85GpKkBgP3bkt1uEcV+FpkEGBLbIldV/ueEERboL?=
 =?us-ascii?Q?hQaXkGucl8Rg++eROgoCsXYhe7gkzEDPN54hpqVfr7CPLBJjPw7Ja/Av5wna?=
 =?us-ascii?Q?PXl25V2JENKCsStr93YqOxACNMQPNsIKZ78EcbzMmTLrhLUBerpoRBe3r8tY?=
 =?us-ascii?Q?wQ=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4472be9e-78d2-47d4-dc54-08dcfef69afd
X-MS-Exchange-CrossTenant-AuthSource: ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 06:37:09.7260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SadKhuLxLG6To0GP9RptRsz2TrGhdJ50YRxxUfZFnq2Lq7wxPnaKjELEL1VtnI/cHz3ATnGP7MYguHyFTTkonkm9DkOb+5OyYNH6U5pJTQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQZPR01MB0963
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_223704_537327_F3A109A7 
X-CRM114-Status: UNSURE (   8.50  )
X-CRM114-Notice: Please train this message.
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

The Receive Watchdog Timeout (RWT, bit[9]) is not part of Abnormal
Interrupt Summary (AIS). Move the RWT handling out of the AIS
condition statement.

From databook, the AIS is the logical OR of the following interrupt bits:

- Bit 1: Transmit Process Stopped
- Bit 7: Receive Buffer Unavailable
- Bit 8: Receive Process Stopped
- Bit 10: Early Transmit Interrupt
- Bit 12: Fatal Bus Error
- Bit 13: Context Descriptor Error

Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
index 0d185e54eb7e..57c03d491774 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
@@ -185,8 +185,6 @@ int dwmac4_dma_interrupt(struct stmmac_priv *priv, void __iomem *ioaddr,
 			x->rx_buf_unav_irq++;
 		if (unlikely(intr_status & DMA_CHAN_STATUS_RPS))
 			x->rx_process_stopped_irq++;
-		if (unlikely(intr_status & DMA_CHAN_STATUS_RWT))
-			x->rx_watchdog_irq++;
 		if (unlikely(intr_status & DMA_CHAN_STATUS_ETI))
 			x->tx_early_irq++;
 		if (unlikely(intr_status & DMA_CHAN_STATUS_TPS)) {
@@ -198,6 +196,10 @@ int dwmac4_dma_interrupt(struct stmmac_priv *priv, void __iomem *ioaddr,
 			ret = tx_hard_error;
 		}
 	}
+
+	if (unlikely(intr_status & DMA_CHAN_STATUS_RWT))
+		x->rx_watchdog_irq++;
+
 	/* TX/RX NORMAL interrupts */
 	if (likely(intr_status & DMA_CHAN_STATUS_RI)) {
 		u64_stats_update_begin(&stats->syncp);
-- 
2.34.1


