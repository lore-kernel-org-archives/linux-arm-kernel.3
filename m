Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA96C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 02:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OavIwKDMCGo8vxKJQ41/8MC6awa5ZMd4XYf9menDxqw=; b=uCd/XG7ATcdm2w0ELg+1VoxwEx
	LAXgETXU5Zy/ZFzwLl92EVx73ltLwL3UwaZNefTnplpEjkKnHuYub/8Uv3OwnmPJ1MQVA/sZMy1eO
	cm7+sNRPQqf0zF7huwZqhuSfVYVxLO+CrJIiNMZptYQ8QVPTka4zaoKWkku9CXfsCz5bM8LYyycMs
	ghN/D/J6g/ImbNtEYCRkUDA1sJW+Tb6GEtbyF1CaIcIDRxnvv6WIbGgzi4hijmx5fV2HKAo6UBHbE
	fWHfhcPJ6q8LyrbCHhtsXmCjrJmwPKwrKxoHSpyCqXDPwcWadvuf524W8Omsm4uJ9pNn7tgyXRmBT
	wgzI138Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OS4-0000000DKV4-0Mc6;
	Fri, 18 Sep 2026 02:35:48 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OS1-0000000DKUX-2Jqy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 02:35:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbVk1hNA8gXmQ+iUen2onFFNl3dw+qqkaO2qjt6kXC4Iu0Tp0zotV/feKxknuOYDGy4edZZsRQWZ9xl2HQ9ZETlI+JJWfj49jgz9qaVdz8uY/9sv9w1c8j4SB0qQw2CVVjQBqq6xZApEUFtZ+tO05qWDeIBi2OZm1A68+KTI3fLtibqgOEmGt2hux35uocLPRF+/BxQyMsT9gaT2ao1Ga98h8lKj/eEL1cilCKIjdU1lSWRv2r9FHqsaspMoolyln1KNi6VfygCJ1TVD2vUrLmkMfj15FB9GZI7uzGmoZ/H3do+kIvmFFE9g2lWUH6k25qpZ8qNP9n2PpNgn/zkS5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OavIwKDMCGo8vxKJQ41/8MC6awa5ZMd4XYf9menDxqw=;
 b=nWSj8vSM33cGEPsGHg9YAr7NqBVnO7DxR973XFNq5OMvRTg8UHuMBEZaki6rFS4gSQ/DOtpIVby1AM0w4muO4lL+UwvpvDVSONJ7IrCByDHuR8Kv73dd2uxirTThVsjZ0/ayqn96kMT/QnjohUgMZrlYvb1vHPPWHtrciANHFKy2JYqKgpYDkW7OSdSWtm8VgL1k79V7IszZdWEz9/BzBRCynQHKo3MJsat/wSicIFn8cdLgV9X+ORlaJ8KHeqPGYpN6vQwJK2vDqUqjTOqYss/nhyrMrwjydhOWCLitGyZl2xXC6XzFkxBigX+Edoo8y/M6rgBUzucHoiFkcY7eNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OavIwKDMCGo8vxKJQ41/8MC6awa5ZMd4XYf9menDxqw=;
 b=wFxeV2jjMQwlWgpRgUmiuF6SwsWUZuN69qvTEQc8KmNz/YyqCI9n2xOqvwOFLoWDD61fap5ZkrdIaJHrOeG9fum5RTjSpuqJWA9UzFwfGUFE2gPj9czJWjUkuVurL69RLViQCicZrYnohraDlTF3SbCX2cexC1RciULqpiNG4d9FQpUyUgRXP4KPu3x5bj7dsHtdbzTaPb1MeYwaT17Ltg82AN24Wh7sxGMkHZ9K9MNLLTbFkn1PCDXSprafpuGakRTvtaZOJfEwa1DnVFiF3e2sJ2MsrxP5vUcdvt/E7g/kJCEJvihe5VvHngNtPfyhvlJ+jFWX4tYyk9RcCcORvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by SA6PR03MB7638.namprd03.prod.outlook.com (2603:10b6:806:43a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Fri, 18 Sep
 2026 02:35:32 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 02:35:32 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: netdev@vger.kernel.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	"David S . Miller" <davem@davemloft.net>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: stmmac: Setup TBS only if HW supports it
Date: Thu, 17 Sep 2026 19:35:30 -0700
Message-ID: <20260918023530.31971-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0057.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::32) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|SA6PR03MB7638:EE_
X-MS-Office365-Filtering-Correlation-Id: a9ff2b20-6d43-4120-b247-08df152d82b3
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|55112099003|18002099003|6133799003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 1HyhTeYgSF9rOw48VuVvfFl03jSS+cgl+ILTtdvP2B91nhMUwxD1m4yQyeosHCMWJth06cZMdEA0IQ4Hr2EfwgxN6/hYrmof+TOSzk7UrdHMhRjmBXIiZpTJ9HzNNmZTiZI8raGHVPjEux8oNzOhFc1YjMXVSFUvu48KpqIs/i3yYwNmQN5cBEG70im6Yf42YQawe3LtsEWfQABp/GY1T+6XdVzqPunXwBcHU3Gx+NYij7Fljsw0JxQucNAfTVAXfwfsLzOUTS+L5OSuqE1Ip2ElFV6L7ipaL4huICiVjXhFO4ZiZnH9UqNOyumtbIpcJsmXR16MR7lSxIvzSxURJ/qNpzsfYT1unpq6eXCv8CUFOcrAmMguO2751Zwp45Fvwg/HFHxKlLXmflmmtdlf9Vu6B/DDEpE5TM1ROZCMkAmcDcHwPaP+c7qs5ebtzrpdK/ZsWUfAFZ4i/kFaYzZSqkiq80pRUUCZElihZc04nhQp3WhyI5vDFozb2uBA6X+Q9tt5a1/rfCnVuGtdcy83UXMfQHmsTOqKm8Ub9XEHt2SF8zabtInoLoR/Kcw/Bn9ZzioWDLBo/dWcHpPdpE/z7dfBy54KhZsYRghT8Imcht+h24B5ATQKF6H7V2ZnRD/dVT4WuS9pDYWkKbKs9/VXFZw0poch+mfGSe+AgV4ho2k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(55112099003)(18002099003)(6133799003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NMoMpTv3MuecbRaq2vSNbm9ISyX1A6B5r2lPR4bGtTybduTlS5KPjAAKCDPv?=
 =?us-ascii?Q?SQxMRoqm6r86wEtJfyXgsUZ8EwM5bBRZMkroIA4woLBE1ihqPkFoI5Asgism?=
 =?us-ascii?Q?al3hizx8nZwo3rRDzcbDdX8YyiQYpFxfvbl8chxIErwvyP1Tgis9PHI7QTUT?=
 =?us-ascii?Q?hbm0KswYS1r9H6IaVwfGu6BcQBjirM3LbKTHEW3C+U5teTsNWW9FfirNw6Y3?=
 =?us-ascii?Q?u6weGJXEGcltBE8mDLB9yyhXiJ6NA592tY2jXmL4pPUqikSqfvQTWsRZqdX4?=
 =?us-ascii?Q?hlAtEkfh+dJ2ajQ6761SAOFv0XPRBYBO5z00xuGFMAii0Lm2WDkcDn4OQXm8?=
 =?us-ascii?Q?7/UUrSU1OK4dE50j1Ajm9TfSpeQZiTf3XR/Lv2ZpPkX2c0exttfg9UuQtqbE?=
 =?us-ascii?Q?MClR7pnoWmFWXZwE2JmmggykpGReHDLpmxVB9jCRZnsdfGivrZ/8SLo6Qn5t?=
 =?us-ascii?Q?+E8Ro4sxJN7tWOl/huEBDr2Y5nhyTEb1LuB22g8qKMioeS7fqxuAC5VyIoMS?=
 =?us-ascii?Q?ZQsfqSeqq8GULwX6YL5xtOn4u73yI/Cov3UCO4s5Y5gsVIkFOMLzdaIFLiBY?=
 =?us-ascii?Q?67qLXbOgG6dxJluaAykoaaP23Vt792pxGrq0wZDhzfj6IpoX51xpuqf0Cu8T?=
 =?us-ascii?Q?kqrgWhgliCpvJsmru4jLLfYmKtBAzLn+2SqqPtDK+Xuag1lnIMAeV6qxH8Yf?=
 =?us-ascii?Q?zQBY9n5MD+N19B+mRGDgpCKIZl7c+xEua37IG1t7cpVGJ/eQbuqfl5X11r8c?=
 =?us-ascii?Q?QY03ohQLcUHrYBi20MfsJkjJWYZIo8I0dnIKKmK8xDBB9fYCaLHc5yOa8PLa?=
 =?us-ascii?Q?s76SOL7WoUKjN94KRCbYJsDIR2xWnVdjZG5Pue7mQS43Jt1UF2hCvFLTap7v?=
 =?us-ascii?Q?tYoIR/8rT25k9iAi1Sfffwae58sfSs7t/zozL3bbzIBcWptC1o9NidLSlrPk?=
 =?us-ascii?Q?YDKiCYsSJ5qN2tPgVFXILsHw9y4Bruhkr2sRink9TEBo1+e9hkoGeWowBxGB?=
 =?us-ascii?Q?JpJgaq1RWs2MkedxIKZfTrnEzRRKxKsnnab+qHJsXy/po+jck73e86K6MTUq?=
 =?us-ascii?Q?71kfYROY04J7vFSLLvyjDtH+lpYQruhtKJcfitqMa3SAmwej8Fqj2aCoA7VZ?=
 =?us-ascii?Q?7ze/7nKn9iIsQ2U54rA0/Ja2Z/RFhgwkA/4P67MdyUA0rIYcsnzAblGoKE6e?=
 =?us-ascii?Q?baMcPwTYsOYyJDep9g2X3gEyndvWDAWSh+Wls5wIQls5FlUddveNV5aLY4Bz?=
 =?us-ascii?Q?sGEzNFMpZMhPh4J3nuQQZPJvlizto65I1WoI4iVIJARE6PatIlarZHWzXc5b?=
 =?us-ascii?Q?2MnR+LtYnbebsQqebdhH4n+SshV90ec7cmZ4YmqS9CIgS3/QvpAoFngBsJsE?=
 =?us-ascii?Q?+ewkyRuKN1i69h4E7Onm07b88VVBFQYxuNfuTDTWVVO4/9C5XP9Mi4pfF4CU?=
 =?us-ascii?Q?qeDF2vVywA+4wseszHBVBfflKS5kfhOzM868Y37eVhzV2x3IdgfVOpSMFoaC?=
 =?us-ascii?Q?Ihq3cQ6b5+lY34YFY51OV6Mbb4GkvJFU+64nTHVBz0Bh8KLosGB8xDJshUVc?=
 =?us-ascii?Q?5S0pknk6qY2QRMwNymRQYc9T7jGWiz+b7Dv33XirxZxjQaj+ms7+4YMHd08e?=
 =?us-ascii?Q?2CLX1okjp+k/ieG/z7lvsQSewuWXfJPiKjq5FDdayAEQtAdleKZdy2V8Rcr/?=
 =?us-ascii?Q?0/vhp+B9mPTNG3Dnp6irut76g6niZ39+xQNdBC+5ZtzYiHEipkV3v8VbErj0?=
 =?us-ascii?Q?oG5ih/H+s2J5EO9gWnBDK6aoQY+AWh+4A/Bs5quvgaMg1l1U4925L707StvI?=
X-MS-Exchange-AntiSpam-MessageData-1: 113xQe5+e0V7ZA==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9ff2b20-6d43-4120-b247-08df152d82b3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 02:35:32.2471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S5r4SJa71R/dw+uBEiQXMTjWpNWFkCi+bB6cyT/pib5KvroFVp4PuUncx6cQSgUMdwh+gUsR9P2zcrzQEBOxQycK4dCONIMtbQ/YqDT9FN4+ueZL+8BQ3ZYN8xb4k4iRyLO4LsmxglmD6MsV+/JFtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7638
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_193545_604220_57B25668 
X-CRM114-Status: GOOD (  15.06  )
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

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

stmmac_setup_dma_desc() unconditionally honors the per-queue tbs_en flag
set by platform glue drivers and marks the queue STMMAC_TBS_AVAIL, which
selects enhanced Tx descriptors and enables the EDSE bit in the DMA
channel. However, glue drivers set tbs_en in their setup path, which runs
before dma_cap is populated by stmmac_hw_init(), so they cannot themselves
validate against the TBSSEL hardware capability bit.

If tbs_en is set on a controller whose MAC IP was not synthesized with TBS
(MAC_HW_FEATURE3.TBSSEL == 0), the driver lays out the ring using the
enhanced descriptor stride while the DMA engine stays in basic-descriptor
mode, mismatching the descriptor format.

stmmac_enable_tbs() does read back the EDSE bit and return -EIO when it
does not stick, but that happens after stmmac_setup_dma_desc() has already
allocated the ring with the enhanced descriptor stride, and its return
value is discarded by the caller. Gating on dma_cap.tbssel in
stmmac_setup_dma_desc() prevents the enhanced descriptor allocation at the
earliest point, which is the only place the mismatch can be avoided
cleanly.

Only set STMMAC_TBS_AVAIL when the core has read TBSSEL from the HW
capability register.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 07a6fab6460e..f604ac848f77 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4094,12 +4094,14 @@ stmmac_setup_dma_desc(struct stmmac_priv *priv, unsigned int mtu)
 		dma_conf->dma_rx_size = DMA_DEFAULT_RX_SIZE;
 
 	/* Earlier check for TBS */
-	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++) {
-		struct stmmac_tx_queue *tx_q = &dma_conf->tx_queue[chan];
-		int tbs_en = priv->plat->tx_queues_cfg[chan].tbs_en;
+	if (priv->dma_cap.tbssel) {
+		for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++) {
+			struct stmmac_tx_queue *tx_q = &dma_conf->tx_queue[chan];
+			int tbs_en = priv->plat->tx_queues_cfg[chan].tbs_en;
 
-		/* Setup per-TXQ tbs flag before TX descriptor alloc */
-		tx_q->tbs |= tbs_en ? STMMAC_TBS_AVAIL : 0;
+			/* Setup per-TXQ tbs flag before TX descriptor alloc */
+			tx_q->tbs |= tbs_en ? STMMAC_TBS_AVAIL : 0;
+		}
 	}
 
 	ret = alloc_dma_desc_resources(priv, dma_conf);
-- 
2.43.7


