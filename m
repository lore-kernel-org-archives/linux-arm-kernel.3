Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCDDCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 10:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nGervPkR+nLGjNS0N08rMWVv3BCWLJaDY3jG6HoBCc8=; b=JcaA0j+28Y5zOANf39XQl8OX0Y
	vYkMwYCUFkc3NdTSM0P4vjFpYftmBYMRSSpZIaNVY6HN3aoJvdJn65y1vJJPafokQVOE+SMLfWJmi
	3rkJ47f3cC2UYrtTZvWRF0gsTNNHq2pgtWi0D93H6Q7sVDZRYmhzl7lGZR1mK9+O0Z2dV02IhWnuK
	ELa0pMYXfD7Nu596vC4+2vzzP1OYwNokQytDsBNxeezOIDjJvpsGS2dIVT/BogWWf60+J7dfrRem1
	HXa9LGSSQwB6lVm5yq1ld0Pv4vu2Pu+Qtwn3vmlDbtWbdbbl+R5NefdHvLBV9GPrvgEGLS1LxyZnc
	z7EvLVeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPI4Q-00000001DK2-3d05;
	Tue, 19 May 2026 10:53:06 +0000
Received: from mail-northeuropeazon11011071.outbound.protection.outlook.com ([52.101.65.71] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPI4O-00000001DIO-1Tzv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 10:53:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=acWNdlDSO3unQig070ZL5EdH+xAD65Zj/fwo3fZ9o+qZv28/ztOU76hHpr9klNI4KYucKcXtX8pFGWQeRF6o1CwYR/iJGpyMQL1UMoc1Gk0hp+iA2HXpSB0T1JDhirdn8HLiGPHtLa/5AhvzF8wuXlHMeAa2TqOmcJqJPRLlAZtwK8GUnuqEIrMdkDJnXlhGLEqOcRkw4dRIYTzUaUCJXBY0OYPQ+hYUFLtDXFS8GCZHCizNFYAxGN20JoOR1v84+0D4/spdx3UYqh8By2pG277DP2kaYe2ah/qa9Q+twHpeMO9ALvt5UrgkfusqNv2IZVZe4qRoq7YJeqoJWUX9pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGervPkR+nLGjNS0N08rMWVv3BCWLJaDY3jG6HoBCc8=;
 b=tsIYlU6ui8ul/Bq5iWjGL+W1Ry6jdlHC+7iKqaVMPRvxlkQCYa7FFKATJyKvQMfVq4PBRgwkWj4RQV6gf0ALA00H8JWcCk2RiUhep1hh+0MzmBXB7cT3rFWguO5JUk9vMKdj+GOHQOvphtV7we1VOEdCbwvsABRiAe1yhpaQbegNcUnpOlyZwGyDyMJeLT1T48e2tjgiGUUXmnGPslvdESQG5lrYCyQdXJmEyU3LObP663hh7wJVWvFagMZwlCybAsHav0FdRQqJjQxRW+gDMYWmQwLVOLekw682a/gaPLd7BGs8lS9n+YSfpe5rEJCgoIInerH0qNKjEMEr+v3iww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGervPkR+nLGjNS0N08rMWVv3BCWLJaDY3jG6HoBCc8=;
 b=qm54QTkD4qpUSRZl4fQ4WcdkZIrEdr/dn5GeuZKVnYqD8WXpXG6weUCVKTpIYEDv02IYEXWxOj8Yj6ohpBAfRk7rb9bJyoRg69VRm6CCKhj4D/PFmAsDxeK0N2UBURLqvIU5U0ZwzdRfGref8w/997mgiOhZfSofOjdnrL/UwZqQS3ukw3YljMiOYWSLHe0gdRKGnARy3TOaY9lB6nZkEi8lKeHZACg+R4fNjAfDh+4RNGmLXhX4LbiBo9JMRUj0y9DQaE9QvrIKztyDFtbtdHSWgpPoNvpr+R70TubsoiV9RIXzEAvROyE5/f6udfho2sd0y+OKS58deqUfbaM+ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9644.eurprd04.prod.outlook.com (2603:10a6:102:242::11)
 by GV2PR04MB11633.eurprd04.prod.outlook.com (2603:10a6:150:2b0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Tue, 19 May
 2026 10:52:52 +0000
Received: from PAXPR04MB9644.eurprd04.prod.outlook.com
 ([fe80::cf3:c5b0:7a0c:d11b]) by PAXPR04MB9644.eurprd04.prod.outlook.com
 ([fe80::cf3:c5b0:7a0c:d11b%5]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 10:52:52 +0000
From: alice.guo@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] arm64: dts: imx94: fix DDR PMU interrupt number
Date: Tue, 19 May 2026 18:55:15 +0800
Message-Id: <20260519105517.3638614-1-alice.guo@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0308.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::17) To PAXPR04MB9644.eurprd04.prod.outlook.com
 (2603:10a6:102:242::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9644:EE_|GV2PR04MB11633:EE_
X-MS-Office365-Filtering-Correlation-Id: 17bd9655-93dd-4cfb-c355-08deb594c660
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|376014|52116014|1800799024|38350700014|18002099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info: pZLBcsniJWkx8EZUNz15XWaApGODjNG/sUJvDEtFnnNb19lsIzF4j0DaHxybAtKpFmWNjfRpn+miJc8TvSLallP3PHIqGELBnCtbuRsyWAQBLestp7DPHNV5B/S4NkKvZ1Tf8r6NvnAFvQB2fbqhO5ip67CDkz+eT2P+nAnyptnJnH5ccsGkj5FDNWUAnMv6KwyqW56ZmorTjTHW1noACcaO6zmK0q0PTn3/AmtFeTM+y5DBmCImSuA8mUTKEWD28EnU6ibSE+FKhCcafhI8viYcNP9tAR+FhT+5aEYEf7p+BFrA0CD2zSoppNMsBSWue0/8R/aACHuijxFuM3APOFVFrh5CLP5aGGhdUfkDQkhRG5bAYO65bxyFyftV8+vTb0zKApCPs3ohVjFlUYR0EVJ+GxCLdit7w6KjGKZwgUZ/oxHO0wRzkTlarPB3nEIuKqeR8+8zXLbZgE8DQBq4oIW+PgAdZ0JCcHFXa1a5+S4fPBppRRY4roj/BMpXRLy1Dn/FjbkZ2wk+cAtNc8yXgefPR0JWA8z4MpXwVRKM4JeV1lGdc9Uj00C8Cw4O+saTSQu5f/k4liSYEmbcvY7Qd1VVRix2jbBxNT+DJ6PhzZMC7xYZjVYwCAmPaVuBn0ud6JKDW1UieMe2mRtwD1rBswEvTwYPVABiV49qkJwQgFlN/uaS/Itf6ifucQ3GXJ76Eu5jrWC2/GS9sXeaZfrlvSqWaRf/h72MZyCgRZbRKuarqjSWi68T+sskDB/qx0Mr
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(52116014)(1800799024)(38350700014)(18002099003)(56012099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T2dv6kDCDhLbyQWANRfqCTl/EMbJ28DThKKB9+N8q0cy35zHy7IWpTvGm27w?=
 =?us-ascii?Q?MVFfnH4o4ERZ75+nLlv6Xn+vXBfmL3DkbMcFJ0zi9vDH573o7E6G20dY9jeZ?=
 =?us-ascii?Q?y9sQHUjozKtTVnI4YZlrLlHxr04PTpdzKQmzTSI+zWLacHzxmyn0JPjrXNjz?=
 =?us-ascii?Q?zkErIWu52kTw/4RXD4ZjZ8Nn6hSOq8TDo+Y6wPM0M8T/KhjJkEMSUzm1nfYh?=
 =?us-ascii?Q?7ETWiuF1ADDb5E7bglLaWc3bolO8B/SCrFSErzGRGL8T3lAYFLhd0slk0rV3?=
 =?us-ascii?Q?B8afiAT00xnp889J4oQQbTTbNO+wvapYNui+zo8IZYN2phO9YLs7rm9hgPbg?=
 =?us-ascii?Q?ZnGinRCGl/nGYaSLqSWShyb/u/0QBOR1n+lYxiJxp893gZjv/Ks26YVBkQ3j?=
 =?us-ascii?Q?/3pzGJ4nyqn9W+SAKt21PE9Ssc+b1fzn3WpnuvuubFV8LjWd41DhzEOLY9Vh?=
 =?us-ascii?Q?7ct6jgVQw+qZCnBAFQx3YKr189Nbufe6bxLZFDVb1jwsAZYvuoQC09JUjEK3?=
 =?us-ascii?Q?D7SgTJCsThDDyqiO4k4WUWHAkr66VJxIUK+1SIWaXv937VbuHv3c5xC0b+Fn?=
 =?us-ascii?Q?cXOgj0fMKRT/Zd7lH4FQDDdS/4APQW9HIdxImiv1thjAPUETZqZCxxZgMY6g?=
 =?us-ascii?Q?QpmhekMRxD320qaz/FcnVOJoqVban/33vX3TVyWvQscTXOx8N3VVAcFis3Iw?=
 =?us-ascii?Q?OM/tFmwKQP18RfPmX5IEuDXdjh+hXGhSUSVsoVLp112BTvCVyv+QcCbUar8Z?=
 =?us-ascii?Q?XkEBLj4Br/B5lk8bRQ+xYrfgMeoepnJFqvu0l975oY6XPVQvjmaZtJCDz+Q0?=
 =?us-ascii?Q?m08CxcOyJwVznCxZP3f2t0wqXqcUxehhfkeSOyIpGcKi2A7pOVZSrCoaQgiN?=
 =?us-ascii?Q?nJBRbaWwjoLTemDqktRdPAIV6+YKRFupcsebQBGA4fbldTyObu5ZZTBI4Jor?=
 =?us-ascii?Q?QPcsafS/wuokOmFaOEgi66hhnc6UgV/6vERkbLk+zUdYot2jgkqBtb2kwB6p?=
 =?us-ascii?Q?5A5DOXTuV8E4WmkenG21DLLs7m0J8X9JEkqfnAENLeSf88YsvyVclwpUusoB?=
 =?us-ascii?Q?pAajRgFWnlidhg3r2MgR7pjMPVtiJY6XkfHqtOTfxnLnW97g2jjCpLEcf9CD?=
 =?us-ascii?Q?PB8cGEGQEbA3Jo0mwJDS325Tzhgw/LALCn85jvXZwkIJec7PHm4emREtiM/H?=
 =?us-ascii?Q?z8gtgCeh5PMh9J39CNrkDXfG8szFW4Xs1dj5Cl/WV4bEj1pOH5vwW0x7+ILA?=
 =?us-ascii?Q?fqSS45yevdgFNPdaBy/XpOOnljXSXAai5u/DTHVG1ZGEpTQqg4Vx1UyX/Ldz?=
 =?us-ascii?Q?UolHWTaVIwXeEllEo6WOQ8V3t/oI+KGNJsXSswjgKqutF4s1lAcJRKFF3Fce?=
 =?us-ascii?Q?q6InTeJegIT43ASNNXKwF+V+de9UojkHiTUrNtLIqyqNgzMkE02P83Qly/Ki?=
 =?us-ascii?Q?zCtIF0HF0SYAMXJRIfegTsXLCNVfDKqUkkqNAMIMm8sWMU7yJB3bJYI4Im75?=
 =?us-ascii?Q?JjBkxMeYFkgw3XVKEhjU4KLLZBeP6f04nY8Kw8nCb+GNKt4BXzqBfPDBttQT?=
 =?us-ascii?Q?X55Qn/gcxriK/HNACsfCGpoiabkZ7WgdlyDCKS8/ns0/3OYOWGdZwDz2Hr6H?=
 =?us-ascii?Q?SdiR6fPoMjUWI+5o9QPpMKG3vIv4M+5Ej+RHFmkmWOjjB7+3VUnuF03fY5Gm?=
 =?us-ascii?Q?cbDJGwn8Uogovh+059fIKmCKcl/Fq0RE00C12dqnNRv5jXTSCO1YdyHB+cA6?=
 =?us-ascii?Q?6zOEDx4Eaw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17bd9655-93dd-4cfb-c355-08deb594c660
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9644.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 10:52:52.6131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fL9XGMoVVjnq0PaMZPI8aU2JA3Jrrp01uJciy1yicgFcrxeNRfCDWiMCV0Oj7QqoILgnsVCZnnScFxAd279xcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11633
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_035304_398195_BEECB713 
X-CRM114-Status: GOOD (  10.54  )
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

From: Alice Guo <alice.guo@nxp.com>

The DDR Performance Monitor node was added with incorrect interrupt
number 91, which actually belongs to the wdog4 watchdog. Fix it to the
correct interrupt number 374.

Fixes: e918e5f847b3 ("arm64: dts: imx94: add DDR Perf Monitor node")

Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index c460ece6070f..379429b3072a 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -1481,7 +1481,7 @@ netc_emdio: mdio@18,0 {
 		ddr-pmu@4e090dc0 {
 			compatible = "fsl,imx94-ddr-pmu", "fsl,imx93-ddr-pmu";
 			reg = <0x0 0x4e090dc0 0x0 0x200>;
-			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>;
 		};
 	};
 };
-- 
2.34.1


