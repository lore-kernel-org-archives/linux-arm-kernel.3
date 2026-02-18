Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D04DE9A03E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 08:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mlpB0IdsSubPX75+rsLWZY7lPVptQzpa+T2HlkH9JCA=; b=3q/6O1y1MT2LR9sBTbtTQIWZY/
	WXa6yYiYJzUdET2HxeXZOwfQds0Mi+LsXUuZvMm4OKGJyrNrZ9adTNDoaawLjrLW81OTz73Z1kydO
	Rmm//EF3U24XZAKvMQ5TBaopBzfveDA6VE/rL0dCPz12FA7I+bE7tvZdtqV/hSzUeR6mN8hJGIE3V
	TMNRmABC5IepyBov2L/u2jpjGar8Zx6Aewmck7JVkt+Ur0r66lEevaoytm5ONza6VEWtIi+EUhtFY
	3s+v9kCYLh2EUzD3NJxzxHYrGDHVpHOyftk+ZwSdd0EP7vrvJadTRIuID32L1UgL1a+oVteLBgd+J
	QaoWud5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsd2y-00000009TbR-1ECL;
	Wed, 18 Feb 2026 08:36:36 +0000
Received: from mail-westeuropeazon11011042.outbound.protection.outlook.com ([52.101.70.42] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsd2u-00000009TZ6-3IZC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 08:36:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vPgPlMiX16d0XW2++LTkOy4eEFCXmdD1tWe2gsBEHqA2tl4SluFqa9zLyLzBpbLuzGDUJaoiMiadksG4CnFslkFXWcSq3lqM8kfzW6KQjKQhfHiQI2kgAKC30rDjnReoA3bPZKblstmb0r8dxNWb9RjxanFcBIDa984P6ff5wkdgzNyv17epZ3CDAWZfDAPNYeu8Ajs86wqRyarLbxnbofRJTSB5UVrRqf4X7gxZXc801LTWhk/mRViTb1+ZVD46tQfuZd4rJ/pNaeBP/UCWeshAxcybJa/VM2irYJd6hh1loMIggW8oS37kkinyoVm+y+RHKqEGjyvZ5lMQ3yw4Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlpB0IdsSubPX75+rsLWZY7lPVptQzpa+T2HlkH9JCA=;
 b=WaOMjJMv0gsdssw6ePSrI5ghf8TcCLYR3pOhnvNWoydmXv3He4DWwHASa2ytGEAhUZ8/GohGzaQ3G3snB6tvDN4cPPzqrXKo4KGiyxpOuyilAfeM0iyWJAss0/UUP7X4YrfhwQqhLLH9Dt1VSNAiuzUGuPsVhx/xyuKiDv6pBZHQBu8xfvlhAKezo+dIgghbcWUErkH9geJPSBOEXKswYHCbqEBlR2nARZCs+Oo7nyeHoGznI1ywlOT5M+N0N+5KEGDagpek+ASFH73kfOaAaw6qaXcM9G3lSQm82455yMuUCt+mc8XbEJFF642bqXr3r8F4DPcVcgEI6NGiEl+drQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lunn.ch smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlpB0IdsSubPX75+rsLWZY7lPVptQzpa+T2HlkH9JCA=;
 b=VLhY3eWHFOLb5z3pV81AYn3vDRRaO8VrM3LJLNPSANCQldvz11mT7B+XL/8iFmBCNldERSoX3+VHUZkmN4gMZW1ZjUq81nTwHi3hSJYKzIQw4crcJ/Ctw2Ow64Ph2p8O97DqlCAmoLStRnT+e1dLCCg8gNgE1l5pkhA+sQuZSx9qOqelKO2NqeknCWkB0Ij2lq+F6XACpvtpk9TysmxpIedehzBE+NR7zp//Zbyy4e0QXsBjJU2wsJ4BrNRrdIsvF5b6PiaVFg2Snc/Ad3W6+QYTiXF4jN+/Y6Ns9qyAB4IPGzK+ddrF6u5CjxtlwTgKuA44PpSlX+o01IRjCSyKfQ==
Received: from DUZPR01CA0239.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::28) by VI0PR10MB8402.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:235::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 08:36:24 +0000
Received: from DU2PEPF00028D0D.eurprd03.prod.outlook.com
 (2603:10a6:10:4b5:cafe::7) by DUZPR01CA0239.outlook.office365.com
 (2603:10a6:10:4b5::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.14 via Frontend Transport; Wed,
 18 Feb 2026 08:36:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028D0D.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 18 Feb 2026 08:36:24 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 18 Feb
 2026 09:38:19 +0100
Received: from localhost (10.252.6.190) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 18 Feb
 2026 09:36:23 +0100
From: Christophe Roullier <christophe.roullier@foss.st.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <rmk+kernel@armlinux.org.uk>, Maxime Chevallier
	<maxime.chevallier@bootlin.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>
CC: <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] net: stmmac: restore pinctrl when driver remove.
Date: Wed, 18 Feb 2026 09:36:17 +0100
Message-ID: <20260218083618.67805-3-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218083618.67805-1-christophe.roullier@foss.st.com>
References: <20260218083618.67805-1-christophe.roullier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.6.190]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0D:EE_|VI0PR10MB8402:EE_
X-MS-Office365-Filtering-Correlation-Id: f0e1222c-e389-4718-c8fb-08de6ec8cd30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RRCyv9BD/YqIh3bIZXHKcXDUc22WqpR/qrwfvv8C9Fb0Y6zhkMwZgeKrYLXN?=
 =?us-ascii?Q?vHsXWPergCiAbmjXqpIJiGmUVfI8LcjWT8WbG0ETeEr0cGkHWlvBgWKzIDEo?=
 =?us-ascii?Q?txB7lSHuA46uI0wb7QaKMn/fkWHFr1JU5OXOr80VRR0VMbSKOcpE25dWRAol?=
 =?us-ascii?Q?uf6KQjljuQ8KjXNAPn7KF9xGqXLorXzs94ZqtnoMGLBckerTZyoimLk2S+qu?=
 =?us-ascii?Q?1E1G+u7rFMy5dlSbnJN9OynKHO2eWaF10E22iDoLKezG0SRDREeTqOo/zjqk?=
 =?us-ascii?Q?DFb505g8uAeeOmcWpsuJzuAGV9cFsninNSRFADZBNmXGQBRzGeceBGhO6/kc?=
 =?us-ascii?Q?Mx17u5M+mts7xQnxpk88eHOQSKyltXNZry7j7yM9B8wjslqkLfOV/MvI+t3Q?=
 =?us-ascii?Q?z3ORBRlJhGu4tzeBEfBJqVWvqT+VME1onzlPRz2s0BwUY0A1Hey4Qta3coF+?=
 =?us-ascii?Q?DUhGn6FY7z0k9Gu4VCgiK5aOyKqpf9DqeeY980vDfBrdpk/k+CuGZsfNFSN/?=
 =?us-ascii?Q?MiottQ0Ev1VsmoQl0merTFcd3I05hIvMjgrptDVOsvRMJTcIRv11tDqrjdai?=
 =?us-ascii?Q?WuDH88V2ASqURUfc4vqePMyWLoo35Ic1xxxpqILAop+GdCK/tMUKFzZrVpBe?=
 =?us-ascii?Q?WCoYKQeM/MnldK6E+Buz7NVItfynU6RxJZECoTllHChV9Ys/mD4a4Q9gVZQX?=
 =?us-ascii?Q?1LjRkQnTu2T1lRnPo/6oqv9ydreutfpUcwC+FMUG+7g/Nrfu3qnlg8glOeJd?=
 =?us-ascii?Q?nmruMnL2lIc29hsy6wRLMapPn4znX9sOKSOT/mexVliV7OZJYPcfRS6C0vOu?=
 =?us-ascii?Q?e5uxMEDyjIjU6f57qKVF8p4ymBfqMv9m3UBLMWxF9pPTErlb1ZveOB+Qp2dD?=
 =?us-ascii?Q?QdHlQVW5CI1WH49tOWvpcMNxdFanPGqrX0Zt0BV4iqHnj1ee4SIU+oFyJKqD?=
 =?us-ascii?Q?uSCf1fJox3k8aRf9dsZICMGgzS041mvpM817X0ZKUJCTzDsBKBbuWiKM5UYO?=
 =?us-ascii?Q?ha/OEVUzoZpVlITdrLjic8jAbrXyBB9gB1pOll2H7WHxO8IugVBA3Zq3XyQI?=
 =?us-ascii?Q?21UOwGEbmXltHbUKLZjc3ZOVGbNU5mvVTLUZ5Ud/kvz/IrTfaPHzCHccCYRJ?=
 =?us-ascii?Q?xNiRe2JjhqUNSJquqyJZzZUnJYviXRzQiYK0b9dwQOrsE8KZVdw1rRGckBu9?=
 =?us-ascii?Q?NaKgTgImkbtcgruEiCRalmFtys93mnkv3CEOUoPmRUseC0LwkWDHVUyprs+g?=
 =?us-ascii?Q?2NB/F+RG8n+p30IeDUVfyCBj0vuyv2FfuIRLQOxHAqcN/Do4ttk5Oz7bLLyE?=
 =?us-ascii?Q?PMRRXkvU7JAvgO1R5TINE667PTeFWxuxLMmEBJrT9j7yWgKcNzVhiUre1NsK?=
 =?us-ascii?Q?QFe8X9KQTzwVITvVjbi4Tv/D1h9mCx0IPe4PvrKrpV6niWahrB1UFb6Qh0nT?=
 =?us-ascii?Q?MCb8Nx/t8huJHMqliFUZGrziLxrDRo0D+fozhoF7EeqU+A3lF1BJs0LRD2Vg?=
 =?us-ascii?Q?22dfRAMz+v8uAQmMKAoLlu/kKoL9K1J/jTmWfWP0wFpnHVCqdPRgonx0t7eV?=
 =?us-ascii?Q?pQue1DXIkprCvmJDwNWdaox3kSaO2B6xdaWdNJ9CjUihodETACo3YkGR8rG2?=
 =?us-ascii?Q?wobNAHhMM1pixx0ihnoTB35WodCSWU48aJjs6TTKBSrwPB7slo596+/mU9M9?=
 =?us-ascii?Q?BeYh16NopL5vtwTYjRV5ftqk/2Y=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OrToNUQTNd9BUPlTNo7IlN2CiqyiCmi9AVyb8+8Vds4+M/+JDQ5imMaZ9fRsJzAvTNCd1yzgX5mt7UTaxME8CzWLm5E7YvlcH0I9xDvh8aQp7sYLLqorefVNYfTUMRRg+w2JKFctIit5MJD+gAI3yY0/+YaAcdvSXhvzYxwEE77Bp8/8hUOpHJ0xbm1vK43M1h2YabPnouw2Qp8pq9lVzqbJIpLgy06jDKnZKIqTQXEmJam1+GVWK2liUXhFkmUzvG1Q8dIRCrDKX2BydD0TqwlaUnysSZz4zow3p1y58osGW08cZnUUHiZbAPqnF1GxiqAcI2ST00Z5vnwrS+P7k9fU5CX/9DD0wzpQhVsOqZo2A+uwSbKdAisSuA4MTwNAzPOAmE2GkKvFy25EMPtULOPL/MS2qAtq9CGgU2bk4Izwc+IXgxmbsXzseGm/kUOy
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 08:36:24.7062
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0e1222c-e389-4718-c8fb-08de6ec8cd30
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8402
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_003632_825560_29C0458B 
X-CRM114-Status: UNSURE (   8.34  )
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

when system suspend or unbind, need to set pins
to low power state to save IO power consumption.

Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 067b17f03cd09..3d4f0e4cb53fb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -8071,6 +8071,9 @@ void stmmac_dvr_remove(struct device *dev)
 	mutex_destroy(&priv->lock);
 	bitmap_free(priv->af_xdp_zc_qps);
 
+	/* Select sleep pin state */
+	pinctrl_pm_select_sleep_state(dev);
+
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
 
-- 
2.43.0


