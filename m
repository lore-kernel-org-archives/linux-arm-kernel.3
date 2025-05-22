Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBA4C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 14:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jkLik41aLAjjaxE2A+wBeRdVpWMyI4Si3Eq0VywtaS0=; b=MvZ8l6X0ZaXC7DjNOY7RHjiDu4
	8kqq/PnuEbauJpWo8tx/1BPQUBQMNaaqlWrxaoZbAqijQdSvqlXuBvh0IBSee0WKwGh4ghxX6Lujg
	nwrdka55RDjSYQvvNhkRQ3f9z4q3CiC4e9q8GrtsqMgNulIy7jWNzhuvZXgprLr7OC9zHw6iVt86Y
	RHxpaqhMGxszAmh+o+SlHJ/VYLQIrPdRdpiQcYDMNJ5y73LBdwlw7Xjn5YU8ae6AkV5FAR+HYRA4G
	S9fwZgGmruVyzn5heCRI3HXgOan0Ai522Fqg8ZgFTyvn/JB3592kHPdfN8+NfWp8ZTSF41l9zTWSL
	vTKmMoRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI6pF-00000001Eut-1lrT;
	Thu, 22 May 2025 14:23:13 +0000
Received: from mail-westeuropeazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c201::7] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI6a2-00000001ChD-17Ia
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 14:07:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OtdwjhY8ImDDrKP/D69Bq2EBir8cH9GeBxezf/2QcVZHoqSuAIC0EyEXo+fxndOb41J3BpSmHkxBXT0b+XWbS0AfPpcxWWT2hleF1KFLaZdy5Yl+yA64AvRciatfeAVrqU/b7ljeQ5qaAa8FFS3Lo0jUxP1rOHUs4C7UrfR+qWu8uCiInIJpCWUjUwKaBxDI4cseaB/O/vf7WNw0XHwvemqYjWoI5ZQJliBEb4Rk/ujFf69MzEhHt7p/zGemiRIztGpv60pCgmQuJ8brkZf5VVj74ayxYAtHp326ocp5/aYZ/scolKqut7iXclTHYSodkTDaTniEIwP2HT9fuEmBiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jkLik41aLAjjaxE2A+wBeRdVpWMyI4Si3Eq0VywtaS0=;
 b=ExVhddK9hbZPayHqNND2gaOpW48MZaHOY5WOdU+5OFc+aNwQ7PF2PLNDkIcwtBXBQW/L/Oi+WDR4579mlHFbAzOvAQoyw/b/8G6BEEtnypM6CRr5UEGpTvlBikMtdJtDSTTEQn3sInMxyJr/uHi5kw3iP6n+SkUWLGKQ7KJem1vujNBMaclJWxt3P1IBCQ5wUSB2YAzg6Vp9vuEdi2rItB83PsonCA3xnF0pQbPYVGpV8I76VJKAQUowfC8q2a6O67iBX01O0L3Jz898yslveWAwNUnL7gQuKRIxoaj0d6yYxdywV9hpfE1gYoMz6YdE6UyozNDGj+g+4Drcy9xbaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jkLik41aLAjjaxE2A+wBeRdVpWMyI4Si3Eq0VywtaS0=;
 b=eaDYFw6deov1Q0RPxYjmWb7lhNkAWmMIwZzKuA4YF62J7AKOATvHDMjXXxlJX0bM0G/alUSVkujhHlDPu8/GhZJkua96NRo4RCBgflHFdexOaw+hmZBgqtc5P2JKLWW8mHb3j/mECHurqcm+9A611wV3yj2K6fop7Kd0IEyXul1dY2ueP+YOJuiV+uAL8HxIKGuzT1bbLSC4/wN4AILhnOr/CUx1EEFP/K6W/WBVY38Y/HVF0VeAT5fGPrRTLXKe3Y+ETteB4o/s5kFNuHgwWPN2zBTmeGJE3aRmG/CofTYTokNNaIky3Y+ZmhP8KU84hlpmhmGzl58C7rN2mMT0gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by PAXPR03MB8252.eurprd03.prod.outlook.com (2603:10a6:102:23e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 14:07:26 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 14:07:26 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v5 7/7] media: mt9m114: Set pad-slew-rate
Date: Thu, 22 May 2025 16:06:13 +0200
Message-Id: <20250522140613.104963-8-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522140613.104963-1-mathis.foerst@mt.com>
References: <20250522140613.104963-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0109.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::6) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|PAXPR03MB8252:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e7bed6f-4a38-437c-1643-08dd9939faee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?viqZ6JFwlwvdYefW2eH3Ofi3LNA690Vc5ee0oQ6Rs+YP8zIs9Y2+xOY4oNMJ?=
 =?us-ascii?Q?RAgpd6o6Hrl1tvGkKQmdaqAeWUMkuDdnGqIPvXF0XbR5H9e0s2unsrPU3CWL?=
 =?us-ascii?Q?QqTPSDpxE+r8Ytf+7SF8oSoF96cBQ7Dms4C1p0+zLkRaIwRxTBQnqaCavQRc?=
 =?us-ascii?Q?9qLna81+yfD7pXWaFYRuRnleM05vmKyTHuI0Ty2XMj+pCVbt3mXXV5MxL7FZ?=
 =?us-ascii?Q?4l2mrESj9yoQsKjpx3Y5gUtgS32wOKVzR0tfWuvn43rX6kk2+smT2Mrl1Pyc?=
 =?us-ascii?Q?0h/H5gyb/pA7A8VCwCEgVAPVB7GWTRlbT4hvVKP40jPzcdGeh5oEYSe1fN6+?=
 =?us-ascii?Q?vSBx3Wg4mWQAPA9OZVuE3RbUHnp024SeOGwlRmxwDXC7v+tGUZBGakBu3DLa?=
 =?us-ascii?Q?MDzAWLjFdYNhET0BX4Z0nX2MLcnmIkKFKjED8h5e3+Waa9oUWCPn1q3/EjlW?=
 =?us-ascii?Q?wYS9AJIrO6Wvn1B/vtA87r5OVrfsksIhPkIXCkv+JSz27AgHW1mVWHwqh3pw?=
 =?us-ascii?Q?vPJPD3yAEGuRuSzgFwayXaLWAiqulTX66d/6AaMOGbpvkZgHyLYoKP4Fv2C2?=
 =?us-ascii?Q?uwnjbEDFxWxflqsjjkSnPaPfrRodJhZFCJcYF7pdp80Np0us2XwBtB5YpBsy?=
 =?us-ascii?Q?bH+62lYMVyK5Md3LDz9yiDVbAZk/mTMOmvXdgq6NjFUFVlXT+gLnIK5Q1LKj?=
 =?us-ascii?Q?GvwA36mdQ3cGNZ5XWg8FrynN+N/DJvkKDhTVP/Rzpo9g+OAcWQOd3Cm3akLx?=
 =?us-ascii?Q?NBfEFt9D+wciIVXr2Wl/fnWpj+RIQFdGkqRh73Pafo4i92e317xiF2RjJEfJ?=
 =?us-ascii?Q?h3p5U/A4GQBpXlTBsQuingMKLmO1BwmTjj70TbMOFQStuaI3SwFkjWlKSyHK?=
 =?us-ascii?Q?42E0TUxj1bwcMcgRLUuu62ld6Dw2yzf+3i0zIjFV7cNaxuMnfx9LpOYuHvTw?=
 =?us-ascii?Q?BdA5YQpK6ezKdkjHhXYy0JvBLQ+NkZ/vsSlRH9AsOjhKqJVGEibVx2L9gxCD?=
 =?us-ascii?Q?KykD8f2Rzj6Zt3omFnLbPvXkyq4Jxj9eqTm5oiCnWTpQZRQkBI54PUCxH7AU?=
 =?us-ascii?Q?nz69gz9ZU2pzR2TuKyCTaWDKANtMQtRhUhGvuXEsP4Jamh5AuMZyj4+W9YFc?=
 =?us-ascii?Q?hq2+55WRZn0NjK6iH6IZyDkGIgvDrcNOV3tis+VEYizxUnCfhsdVzWXi8PPF?=
 =?us-ascii?Q?n8JEG17PrtovQx6cwwE1uVUOlds7/JDDGDyohK6oSalG74U4QvVGM8Oqm1gB?=
 =?us-ascii?Q?X21KjXiaS1Sz7+Jl7TklWcbMcCZhejaXjr4nhi6HXgoBfP3hScMnlr7/Yxj2?=
 =?us-ascii?Q?TbOxP54CssaIGuWRSdGWXTLqsyVeSI432rY/iEqaiMIFAuq7IfYcaWAkkDkh?=
 =?us-ascii?Q?w3dYsxDyqFN2GrOVOlZNFyJQV9hJgAH0hz2Pe21SlJyq+XOBOhKEoAqLjewz?=
 =?us-ascii?Q?aWUD6OYJJwK1sNBW2hDUpnUtMUD4JZzlTPxViSwCqMkD/AXh7Dw4aA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0yXjS+ZDYpxzSGgqN/LQXFH+CaXtG6k0FOcCQDUgcNtXIXwdm86UBburW88t?=
 =?us-ascii?Q?viNFW2F/ZZBQw2/rDOqkLv7cC1hQJb2e3C+5y9EuqaBr3SCucDrtiB9KQ2Hz?=
 =?us-ascii?Q?rYlXC9i3fQiFoLKZocxJ1JoTmKRbEiXiv/VHHeTKcCXMIlmacA1whCwEh/ov?=
 =?us-ascii?Q?T0TQsrXr79ZsrLA6EO1CF0/CtQy6CZ9ztbyYFnzL1C6S4WULDzQuk3pR23CM?=
 =?us-ascii?Q?LfktVXO+VOf2HCpBmMX8Ehu5pFT5DwkzezmIjZElIQuAK5b2nhGHBGpY7gk+?=
 =?us-ascii?Q?HbPaRqwCmZZyXySl2p1bDw5POdosY/4aGdvqt8oQZ5rnLxPzagaox+QjfqDm?=
 =?us-ascii?Q?kTNPcFbI0tS1z9wkX+p3mc7eGWh65nVBQqxvjgt6DfwJ+eGcmTySn21O7pUj?=
 =?us-ascii?Q?MHivQMG5ykE4XRow0jbbVFKllD4A/5ggyXbBhp0TvxAwVMInXUSo2h8Qmy+l?=
 =?us-ascii?Q?YwwzKmMZrXoDQV/G7G91SB+cZSGk8VoVKv9A9dMX85+Z/eO8ZXPKo070lsgK?=
 =?us-ascii?Q?oHudYg9pbN7AmsXgqBbvh/DdQ/Rz60tp8/t3H4eRVkeov56NRdaXMyAw9UpA?=
 =?us-ascii?Q?0mQH4ZrwhUVyTVaWvWnaAKJ0IYlt67jr2ziOmpy3wYTJu+tKw1AF3L0s8bgT?=
 =?us-ascii?Q?j6XS7WNSrwfr6D194BkT2jk9T4drK+uxLo+BMmBt2/IHh98mY/GHNpaL9awq?=
 =?us-ascii?Q?JRdvqOef8ugAQY9ZeAVCshaNf1tpHc3x1LC8nkhUxOsRDV/DYfFx9nvFpt+r?=
 =?us-ascii?Q?HlfGAszvwwN8bd+Cr94Jcrxt7mMY0H3hfoZBB4XhoLgqH0CU2b4GYdxWo6WC?=
 =?us-ascii?Q?3+boAA5H5BJc5NjrdrxleApokwb4stHWRI+pABVqN6q8pI39XRR0xtV/DM7o?=
 =?us-ascii?Q?8W2PgAKnon0nGsBmh9JckE2IONjw7Pe66hhsfi42b6tM/LxexQqLWIlWnMaZ?=
 =?us-ascii?Q?8yTweWiCgU6ZyQReLsi8afp4GsDbJU7Eh4J+GD6Q0DYcJT5RZk5uevs9n125?=
 =?us-ascii?Q?FZopFZMADkAKuBhxVgAA7TKyIex9gp3mgXzicLzP3WV+NY2rqtzdFxRzW5QM?=
 =?us-ascii?Q?9xse4DXg5TtzAiZHIz8Zxeh+ZlKCiEsma76VoJx7wCWW3waNiPTOtYrUk95v?=
 =?us-ascii?Q?M2+6h/eILR2A3hrrxBxzIh/P0TmdFGctlZNW+6Zt+S08Sg+1eZHRSggcsFWR?=
 =?us-ascii?Q?B+4Nz9tXLu4WG+aw9tp7Pg5dwROPSFfzFeRqefErC1NKdgnj481lAU4PzvoB?=
 =?us-ascii?Q?AuBze6TDwwv/FMYU3ARJMI5LCbJHfyAcOUVPF+68K+5JLHnejNR23Rj9sPli?=
 =?us-ascii?Q?rwbfOrqvB4iYD/WD/i0zyMVTl0iaJyGxDyl6oifr1ZkYrnUzPuONQ9zPN1SO?=
 =?us-ascii?Q?Z+OeAk7K4IuU3fZ5C4f0irJLaVdmt91PAPMN61jKz7MB82lydSSgaVXnfyxU?=
 =?us-ascii?Q?fY0pK/7ovbr/LfdKj1qmDKAfBmYd7UaUfKdwis+9ArJOwLai5gFZScqRZxMW?=
 =?us-ascii?Q?+gC/HhKTDGzUbkl2FvNdpopaCWdj2llHkqNwqy3lgjLP+waKnCdaXe+Bbi5B?=
 =?us-ascii?Q?yAKvcGElrmlVegNk8N91cjx0kvrzj4t2eGOPCsCY?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e7bed6f-4a38-437c-1643-08dd9939faee
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 14:07:26.0108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qRS8kfiaFTmdhW5ECxcVkSBqBACaVNlOEpG9ezrwbvRlHbR3/EN2zt/NXaj1cs+aLEaIsN887DAt0dBUY50X6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8252
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_070730_304699_CAD56FBA 
X-CRM114-Status: GOOD (  15.77  )
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

The MT9M114 supports the different slew rates (0 to 7) on the output pads.
At the moment, this is hardcoded to 7 (the fastest rate).
The user might want to change this values due to EMC requirements.

Read the 'slew-rate' from the DT and configure the pad slew rates of
the output pads accordingly in mt9m114_initialize().
Remove the hardcoded slew rate setting from the mt9m114_init table.

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 drivers/media/i2c/mt9m114.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 9ff46c72dbc1..f3f9ecc0866c 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -18,6 +18,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/types.h>
@@ -42,6 +43,9 @@
 #define MT9M114_RESET_AND_MISC_CONTROL			CCI_REG16(0x001a)
 #define MT9M114_RESET_SOC					BIT(0)
 #define MT9M114_PAD_SLEW				CCI_REG16(0x001e)
+#define MT9M114_PAD_SLEW_MIN					0
+#define MT9M114_PAD_SLEW_MAX					7
+#define MT9M114_PAD_SLEW_DEFAULT				7
 #define MT9M114_PAD_CONTROL				CCI_REG16(0x0032)
 
 /* XDMA registers */
@@ -388,6 +392,7 @@ struct mt9m114 {
 
 	unsigned int pixrate;
 	bool streaming;
+	u32 pad_slew_rate;
 
 	/* Pixel Array */
 	struct {
@@ -650,9 +655,6 @@ static const struct cci_reg_sequence mt9m114_init[] = {
 	{ MT9M114_CAM_SENSOR_CFG_FINE_INTEG_TIME_MAX,	1459 },
 	{ MT9M114_CAM_SENSOR_CFG_FINE_CORRECTION,	96 },
 	{ MT9M114_CAM_SENSOR_CFG_REG_0_DATA,		32 },
-
-	/* Miscellaneous settings */
-	{ MT9M114_PAD_SLEW,				0x0777 },
 };
 
 /* -----------------------------------------------------------------------------
@@ -784,6 +786,13 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
 	if (ret < 0)
 		return ret;
 
+	value = (sensor->pad_slew_rate)
+	      | (sensor->pad_slew_rate) << 4
+	      |	(sensor->pad_slew_rate) << 8;
+	cci_write(sensor->regmap, MT9M114_PAD_SLEW, value, &ret);
+	if (ret < 0)
+		return ret;
+
 	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
 	if (ret < 0)
 		return ret;
@@ -2398,6 +2407,17 @@ static int mt9m114_parse_dt(struct mt9m114 *sensor)
 		goto error;
 	}
 
+	sensor->pad_slew_rate = MT9M114_PAD_SLEW_DEFAULT;
+	device_property_read_u32(&sensor->client->dev, "slew-rate",
+				 &sensor->pad_slew_rate);
+
+	if (sensor->pad_slew_rate < MT9M114_PAD_SLEW_MIN ||
+	    sensor->pad_slew_rate > MT9M114_PAD_SLEW_MAX) {
+		dev_err(&sensor->client->dev, "Invalid slew-rate %u\n",
+			sensor->pad_slew_rate);
+		return -EINVAL;
+	}
+
 	return 0;
 
 error:
-- 
2.34.1


