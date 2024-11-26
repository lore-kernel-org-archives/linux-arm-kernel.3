Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9086AD3B993
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 14:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ydkHAiz27zMSspkKNWB71wfdm9oJZmEM27xAi4t4NgQ=; b=WchVDnDqapNPvB9qxJ6OZCJ7Ch
	1ZtYjL0L+rR3FtbOLh/cJwsMhsPfcN1QlggWs18Wtu5VTDexQjUvjpg1TqTtTPjquttuQinZv+XqJ
	2hUae0IMQlknNRghzMCI9sH7B/p9Zrg3CeIXPz6FqlGjaVK9dVoMsBXrd8dBWkSa+3yFJmvtG/zQY
	7qp/KjKvmrDTreXi+XleeBUevujAKyuV+d74AsL3tK/gBXAGOKdcRZERx7O/AzqVx7vK9m+y4z8yD
	w4THoPC+tBdOwOE9hV4XPkJ82B2BOH21Cc2H0J/l+H0h00ojI+84B0qyUD39N/Xq3H6H+GK6UR8ys
	j6KwzvNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFwNW-0000000Aq0a-2hK2;
	Tue, 26 Nov 2024 14:17:22 +0000
Received: from mail-northeuropeazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFwJd-0000000Aoxx-1vLJ;
	Tue, 26 Nov 2024 14:13:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSw09ET0QXWage2Z+hmtpw3CbRcdNp2ixfWidiDhpIn6n/zAL8p3dQSXTjNDUfxAaOqLDNi2MQGxL6IQannGq86zMiBqBH82r8s4dgYMl/+VwvrnFiPJScGEgCjJ8MFNbZGH1WSxCBFHq/QUcdXZ6U0SBFbElC3LqBVrZillhEZt/S350atUn+ExI8eiVPODl8CpfmiMdWb9Q9pVRdpCPB+VN8xRJZz3g7de5Xdr235MsKGifXq+fFMLiAt+ZpoLZlsriVfLzmQDSy9m0CthRSb97dUdC3IUoCerL5B06+2fKHdAEmrkl6QKIAU2GXe0UC/UEPf4QNSx5t8F9MbH2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydkHAiz27zMSspkKNWB71wfdm9oJZmEM27xAi4t4NgQ=;
 b=LZCXJKvxAZAPknFB/R9UeAdSNsjfn1X59xvwoe/A+xX7Uq3N8lXuXbXobnTKcLP73PPwtGqytxeq2JNXWFkjoPk+WtZn8HEZBFogDBx4XhCts8OH+YhDr2LhypjFSWEfbJf28fVYP1vaN7s3xdk4qjT6Br6OIauSeExaOqzt33r+39QHW54mu25vnf4Fg5ULaejnU+2KHdJvNmhuX/5T1KGNZCLiiSVWQzYTOBWTfBMFsdd7FdkCWKcU3wzg/ty53xOyLnyM/CM9gYfduBQd3Lc5l4uAkrBFH5EMdp0v2IiFfs1NSuLdlmkV+pn/CnhRUty6MSFlriE83SlS1B6tNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydkHAiz27zMSspkKNWB71wfdm9oJZmEM27xAi4t4NgQ=;
 b=gK+GqGL18X8YCU6MfYgoeI6LW0tdowyq9nmr5SjrKQRrAm6wVapW4xC6EKMDzyE+b+ixMvVvx//1jjExfr2a1DfPgnkDMkGvsQPk+trEC8eW4LEcAsBB3eUqtWen2p7qICVf+URroCy/WsuPWEwkM4/Ed7bliJog1IjNms00yRExFN9tgF7IBduXE2xQqxt8q+OOBiJXFzPJ0BD2KvlWtQGdNWWF+5oGOO2gKUSRRMJ83F83LylgnVk+T30+PgrA31GTtt+eBRdUqdnVVblyEDrNKBDJOSwRgfeE/Dq/sHD4t8KVmjFsdtk9SwNuVs0cUPqqxz0mtJLbA1jLewIoNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PAXPR04MB8894.eurprd04.prod.outlook.com (2603:10a6:102:20d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 14:13:19 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 14:13:19 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dmitry.baryshkov@linaro.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	vkoul@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	mripard@kernel.org
Cc: kernel@pengutronix.de,
	linux-imx@nxp.com,
	Sandor.yu@nxp.com,
	oliver.brown@nxp.com,
	alexander.stein@ew.tq-group.com,
	sam@ravnborg.org
Subject: [PATCH v19 2/8] phy: Add HDMI configuration options
Date: Tue, 26 Nov 2024 22:11:47 +0800
Message-Id: <43757beec6cd418fc17252283de38009d531c7c7.1732627815.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732627815.git.Sandor.yu@nxp.com>
References: <cover.1732627815.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:195::16) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|PAXPR04MB8894:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a81c41c-c167-4af6-6d7d-08dd0e247a7c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014|7053199007|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mSNQsR2Ap17Vlni2+LHoGPioUak8mTrxjDJL6w+/XJ350QUpOAcSa5XN8Te5?=
 =?us-ascii?Q?0HJ4aSQMFS8A/0ILNBAAhDYpDhlT69cLH9s4+V7gbFrg+GJHPZyyg59oUDhS?=
 =?us-ascii?Q?gikGYuMR4K2NRcv8tM2F1ITcab25BfELCkPN+vcaOjUm6LZjPRURGziKq5SN?=
 =?us-ascii?Q?DSyPCav8bWBmnNaJqsAb1B12aJExGFiozoA1u+Z5BnnecGJ4pFS603RNsNSR?=
 =?us-ascii?Q?J4my2adJ/tZWL1MktMvhu0IfBkbuQLcV6FZOIwJu4cCBtvB+BcRdZ581NfqO?=
 =?us-ascii?Q?/JSHlBDtt7tHhPj6BPILvfjaJIB6J4olKEDF84J4IHS+WnMIOHxS8Z5Ei8YF?=
 =?us-ascii?Q?4Y41cUyjqy8W7xr7KoWAw3+78/+vbE+b8NaLflWpYsjnUAW3AzOKjR8OFNte?=
 =?us-ascii?Q?BwrXTYp3Obrgg3ajR7G7g5O0+2P3rGACf56pTg0HbHn62bTibrXMUwW0JWrc?=
 =?us-ascii?Q?c+8dxK+3kLuEfSZraTEB+3rlsIs5TQm0bKrUKtp3AvUxyOl0LmEx+ktLQ712?=
 =?us-ascii?Q?MILo7NJ1iG03FhySX6rSy9tLNu6yq/OGqfLTw9XZs/zo2rgvReCOsM0JzKxP?=
 =?us-ascii?Q?E4EOzH0zgMceWOcW3YE6atg9g7e6kUCbttiQlBr+Y6FhNPOywBUmJQvF5jAF?=
 =?us-ascii?Q?WNtLxnQjtwdOIK/1S6tv2FgJmVEbK+Ut+x3hZyyRz80VZ9qRAmopz+SDkV6N?=
 =?us-ascii?Q?tgTnxs460Zx+J7xEzWhdDAGLGIkkXDMcmuhVab7DYXZqp7Tp6PgX3bvNk3OH?=
 =?us-ascii?Q?U8yo5sjLXGwadz7z4Cp7Jc01TQi0SW6gx0i8ctiQ9eBPvmrd/IT1E+FfAAPN?=
 =?us-ascii?Q?mEacpIbo87prNv1GlPjdsqSCk8qMdV0TE8JN4TPTHy2fSU6rDmtEidc4pGHe?=
 =?us-ascii?Q?Jk946/62gDZCM0YFv16Vx5lQ2hWBxdbBmR711k4H6vmFDLpUgir43dm1ViQL?=
 =?us-ascii?Q?39pvG9FesndCO11zafY2JftDvsksmXMjQeJZcz5UfAdxndDEkT8gCP/wFCFa?=
 =?us-ascii?Q?7pAmoddl/LPJl2/NiOMF6CwWClTMoimqOGH+h2tUjL3wtq8D3srwjYDO7+Ht?=
 =?us-ascii?Q?RCIzIikers/0Ypf/HlNZA9vl9rAoh1CPXbNGIncKadmJ0A/4F/4IKdH0QWCV?=
 =?us-ascii?Q?53hAH0DvrRiWtZoJuaLlPRYpcuECbqt5+hpLkVLa3n7szfuIVQ56GcywVy2l?=
 =?us-ascii?Q?uq/jLSPA+YgMrzR3FxfdxK3p0agggFweuDxNwdp/QBO/rG4Amng7M+xzzl26?=
 =?us-ascii?Q?7WUwrOaahngknRF0QLcw0gOHaXmJepFFLs4AVXzhoQLoTYaaW/2hMRZ1uy5F?=
 =?us-ascii?Q?sDFJuIWwdq+bKHs7tfeFU+M9zRR8laTdmfjI6e1G2yxWPfDQb+GZSQSC6PnK?=
 =?us-ascii?Q?D3zqN+VqH/GaDAhkAwKgVXHFoM+9vx2KG4lvl0a72GEfFf+CqOF6kh+qc1FR?=
 =?us-ascii?Q?mchNbh13Yo0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xDEqEZ6JYx787lLNKa2jiOFyWpJOC8rNzKSEKCz6GcyPMv6UQrsEGm+OrNXK?=
 =?us-ascii?Q?NJkuF3AmP+5VDvBoRXM2Pz7aCesj8VY8wBKqE57f+JzpGrFIz+dKZuQWI3wi?=
 =?us-ascii?Q?oKOrKgn30ucqtQmmDvLwtcTkYPan/Ob13rgFSgDmgMpu3V1A8COBqMQB5kSo?=
 =?us-ascii?Q?LmCPEwAK7bzIfb+uOEOv8enWHrARv3EL0yRHvFIPNduajLXnFil8mQ2euc6f?=
 =?us-ascii?Q?G3TMB7Vuemrr1nQCKNaKvtNxzRxTPdqd21YUfCcY5sBnUKfJiIDlSyFx7dhk?=
 =?us-ascii?Q?M3any59ZhQ/FjIlsh8TxsesZpg02gnKhtQzlilz/3IwM8Oy/++DwCfAhobh1?=
 =?us-ascii?Q?FHxXJAsU9o+VE7LbdQPL/+leYfNUNJYf2+B/Sr9VXDp5AVJ2yfAQ95EfMXCt?=
 =?us-ascii?Q?Gn1Q5B37SiEHI4NumDVykVfBqD3fmu6pS/3B29aTVAwCGxksBWEmjyrzPVLi?=
 =?us-ascii?Q?EufJmK/uOv3A8sisVyxVgFBcuuSmXOsNiNd3gwKU7D9YuLR2NfHMHt4tQeDq?=
 =?us-ascii?Q?pf1VwuKJrRb31mxT74SAzcO8yyGAkeS32o+HjioI7pDWjMcNt2fI5dZYBYWo?=
 =?us-ascii?Q?zuxVBy7ilixLOX9uf1uSp0h9N7KjD24oxbkXTzd4/YP12NDOxsxuSXNnnXrX?=
 =?us-ascii?Q?y+BF7JHz8hnNvnDQtY/gEZfXnDeZp3yn7gy/Sk3yT/P+vXY/HmTp84n0mE9N?=
 =?us-ascii?Q?dAe3MVRO+IY2RfNL940ue7lMEwLhhmQaKoBVO9VGcFOUUjWPUDrNRBKrY6L9?=
 =?us-ascii?Q?W7y/KQgcBWtZfGAUNNu7zFIqEC5Q2yAlmiQFcjuVcPuawtbwRIUKYROCBtCD?=
 =?us-ascii?Q?lBV+TmECUVtmqt0pz0OcJuofA7VZXgGJ44Jur4WAxiwlDLnAZgZ4MguntUih?=
 =?us-ascii?Q?Al+zi9dMT5pva26cRyn5B/gDez8TSIsKhYZqAk/FOZGeluDDRLNoi57kGDYK?=
 =?us-ascii?Q?bTJkSu9w65JR6PX8DWEju/bKXbdpGoqDqIWMyGFw6bSrFWYRN64OoWc0TLLT?=
 =?us-ascii?Q?5LfuP02UIYTBoWwdyKmZsXbinXzQv9XSeKQ/zhIMfzTIlZcfIgS/+P0LX90+?=
 =?us-ascii?Q?ekiwT6n71N/0EnpncyHaBnp2LYNVx9ewp4PTX2kykqlc3mxPWpWHntvbn8lN?=
 =?us-ascii?Q?3/qHjJeGI8/ITWxfVdQX7cf5pnNB/leCA9rl20Fhmf5qu6XzAozGmPkLKVPc?=
 =?us-ascii?Q?nZ78xFkYVecdyR9wLzWo2IOgQOBOX/l2a3BEwHskLapzpKjmcHOP61ijo0F2?=
 =?us-ascii?Q?hlOE/r1HfxOBZUFbR/cfTDCOQeVp0KlP7AHLej9WJInvIDlBm8pf6mIja8HP?=
 =?us-ascii?Q?J9bIn1IywzbUrf/6ra4xL1E6oOK7CXh3T3txJyvyEm6OdebqCsw3rre/wjNO?=
 =?us-ascii?Q?qY6heWJmykM1S0ODUXPeo5vLBlMTfxA7FpJUsoFKGZWM0eN8TahFZPoYBwxV?=
 =?us-ascii?Q?5yvFp2aB66qne7noQDAvwC0jLOTMWmdECIbAlkNNpYedt0HhUJ5SWmgYgkYa?=
 =?us-ascii?Q?aTyuLXV3pJ06200QwjdbXJ+Pq0CHdw2yWPBH23KKdUaiYH9XxCoQcVW5q3YC?=
 =?us-ascii?Q?R7bAV/Ly5MW/ieKSWmM1di0NU7dSZNExaxkwkl5Z?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a81c41c-c167-4af6-6d7d-08dd0e247a7c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 14:13:19.5523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tf8PxiV1ESa3MOq1KFjV+Kf3xWWE6qoFcs5SNkx/xiE38o9vwW0lwkBU+yQDguHGdEzekjcNYGGFX9a/KK20jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8894
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_061321_501323_9D552FEC 
X-CRM114-Status: GOOD (  16.97  )
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

Allow HDMI PHYs to be configured through the generic
functions through a custom structure added to the generic union.

The parameters added here are based on HDMI PHY
implementation practices.  The current set of parameters
should cover the potential users.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
v17->v19:
 *No change.

v16->v17:
- remove headfile hdmi.h
- add 2024 year to copyright
- Add r-b tag.

 include/linux/phy/phy-hdmi.h | 19 +++++++++++++++++++
 include/linux/phy/phy.h      |  7 ++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/phy/phy-hdmi.h

diff --git a/include/linux/phy/phy-hdmi.h b/include/linux/phy/phy-hdmi.h
new file mode 100644
index 0000000000000..6a696922bc7f2
--- /dev/null
+++ b/include/linux/phy/phy-hdmi.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2022,2024 NXP
+ */
+
+#ifndef __PHY_HDMI_H_
+#define __PHY_HDMI_H_
+
+/**
+ * struct phy_configure_opts_hdmi - HDMI configuration set
+ * @tmds_char_rate: HDMI TMDS Character Rate in Hertz.
+ *
+ * This structure is used to represent the configuration state of a HDMI phy.
+ */
+struct phy_configure_opts_hdmi {
+	unsigned long long tmds_char_rate;
+};
+
+#endif /* __PHY_HDMI_H_ */
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index 03cd5bae92d3f..4ac486b101fe4 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -17,6 +17,7 @@
 #include <linux/regulator/consumer.h>
 
 #include <linux/phy/phy-dp.h>
+#include <linux/phy/phy-hdmi.h>
 #include <linux/phy/phy-lvds.h>
 #include <linux/phy/phy-mipi-dphy.h>
 
@@ -42,7 +43,8 @@ enum phy_mode {
 	PHY_MODE_MIPI_DPHY,
 	PHY_MODE_SATA,
 	PHY_MODE_LVDS,
-	PHY_MODE_DP
+	PHY_MODE_DP,
+	PHY_MODE_HDMI,
 };
 
 enum phy_media {
@@ -60,11 +62,14 @@ enum phy_media {
  *		the DisplayPort protocol.
  * @lvds:	Configuration set applicable for phys supporting
  *		the LVDS phy mode.
+ * @hdmi:	Configuration set applicable for phys supporting
+ *		the HDMI phy mode.
  */
 union phy_configure_opts {
 	struct phy_configure_opts_mipi_dphy	mipi_dphy;
 	struct phy_configure_opts_dp		dp;
 	struct phy_configure_opts_lvds		lvds;
+	struct phy_configure_opts_hdmi		hdmi;
 };
 
 /**
-- 
2.34.1


