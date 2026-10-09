Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DDACA6015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 03:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jhIzjb/ez08IyyoDOKM3KXrWPoAmPvEkYa9jAFQWHdQ=; b=G/SU+L3oDdoPgqoV1VE2RIw5up
	tGzB5lCT4+ajlv2VKHIieThm+KZgKleKFuLMRfCe+8t8t8v94djnSANe+bxrU3TX0fSnWVUcIxG7W
	PnbnmruD6Nr2yVVfKoAwIocR5FudVP9fS1d/UCMrvQjdy19XSpK1bFQGIV7PCXAzjIPZcUiApbfwL
	HS5+STrgPipAePrDfevJfjK/MGnfjZfxsC+Y+4VjeVlRh9H7pGuiOJJr+j0P5+qCpHjJamBNtsson
	R0Dhb7qpX7EcItSuxlPE1G4mGS5spVS6Y5NgGKI6z3Pf5bdQ6XJoBS/9spJHAi3LLTbRdYO2y5pv5
	Pwtgv+nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF14n-00000005JrU-1WVE;
	Fri, 09 Oct 2026 03:15:17 +0000
Received: from mail-swedencentralazon11013031.outbound.protection.outlook.com ([52.101.83.31] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF14l-00000005Jr4-29xQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 03:15:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dG9b/5oqBN1egppclMm3AsGoMD2EpmUrgmRzagLmUGS3pGeNGiRYF5N2v0Rnw8DLSy5GjqX8ghZKx9teaSSMMoT+c2pT/IduAI+gy1GW6OVVHZKCJ/cJxVcz3Itng8nVtAkFGKp1YpHdQbSeqBe7eyWI1kA96KrEUL/SfXVYlbKRyK0K1o5GUMr2laPFcxbVd7nZfAuIVr1QlFTp1S8uA+A0eu/YwdcdtnZk6oCzStkl9P44ZQJhRKXVFUamGkZKt5kTJAmN9x1sLkCoLjC6Bre9V76OOv8bQOhTH6H9FWnzgPnXiPd7NoneBZlZ4EC1axqSpbQMtjr+qZZ+uawitA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhIzjb/ez08IyyoDOKM3KXrWPoAmPvEkYa9jAFQWHdQ=;
 b=dfOaNuHB76RvbZYBu0/djk7uFwvtBkYMifn7+k4X3aMBFRyCaS7MIuKTNy8cRSxuYNFBk6ibNjYYrpl+6LDjUmWG6D0IE4sJhVGeLYHHr3/sk7tfHtt5VHcIrJwR8Gh64gVOkg12+DNTcLDNL9qE4mVE+EOHz3RLUoKguHZQ6+GB+FhCwOu9xEVOOP3dLgsA/hTF4gPV9+bDSVmG3ZVSatl8SJscnhd091iUiy3n4VXZxMHi6A01xfccjbsuttRjKErrGpNRQD1xWr3xHDz2aff9O8RjYg+8miZOkwOdihm9qRZVOxDjvvRuavBBq3UlbGLkAQRD2k2AnBuy270K7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhIzjb/ez08IyyoDOKM3KXrWPoAmPvEkYa9jAFQWHdQ=;
 b=A0EsY/lh9mh5slly0mSN/J3/m9XIc1LBWpBmavdEsO9dVZqYgyDIbdWJUCtLhEgj7yRhuirWhXH1cA7mU0LcqvMEodHjWmU5v5FcTyiCzx1JPog4GYxZgH/5T3z3cDlM/1LF0r+sIBnWHU187224yveCpdXbFENXtu/zM1WrWeLBKpvVcgycC8op/JDpT6cEltrNdGLlqACr4lIP5fJ4TBoOx7NOXQWFAGGC2Jp6hWNHNsu5EFbD7i0emTznMp9pTp5vd6OdQdDLFhHwq4ga0n8yBg3+9CKc0uwfMYosdQ/CxFbsFyd58Ere9PGV8dnMjK3ajOzOOU+yNdM5erkEnQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU2PR04MB8645.eurprd04.prod.outlook.com (2603:10a6:10:2dc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 03:15:10 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 03:15:10 +0000
Date: Fri, 9 Oct 2026 11:19:42 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Frank.Li@oss.nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: freescale: imx95-15x15-frdm: remove
 some rmem regions
Message-ID: <ashdTrRVvEh8BMuV@shlinux89>
References: <20260917-memory-region-name-v4-0-260755920ebf@nxp.com>
 <20260917-memory-region-name-v4-3-260755920ebf@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-memory-region-name-v4-3-260755920ebf@nxp.com>
X-ClientProxiedBy: SI2P153CA0031.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::7)
 To AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU2PR04MB8645:EE_
X-MS-Office365-Filtering-Correlation-Id: 266f239d-9379-4319-d07e-08df25b386b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|7416014|19092799006|4143699003|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: mdnSyJhKDRO/qpCa8SZvkgUdn72CGEv2xLKepjpdMtWWoFdlyP9at2+voH19xLcn93WRGxovc21J82iaTIIZu5HiUykHj1X5+uxVKFLZh3uR7TPKibSKOiunyTRxgvvKAdK849ggzDEoKB4lai5tUxf2oCJQeq00KGNzj8Vht5XSHSqxnw7k36sJ8C3jPeUhu4R0cl/dgj+Qhf9myEjTRd+9528uLeLiMEk3YXUU0/rYt3GiGlbS5V7me97oHJJF+42UitCvAZR0nQ/zIyZprTcDijNymH1WEGQz4K21JTG1hsw2tWy8Rnb0Cl0c8WjGwsRsLdRdnh3b9VUd8NsKtSk9E/qn/5kjEOpgLn/DeWtO6n3zk9Mgrml0sIl5A5SE8h9ctT5T2JeBRrEepB+tyY4l4uHgxIyXjUp1deDXvM4ghKhtNozLNpxnx3NFYjYb/CsILesEa28XxaBffUm6kNBq//2O6EOh9j92NK0BGcXsMSQP4Qp7VuIbpjBxLLkNiPBSOcxDOvAlq0KMynZ60eLAKBK1fmOp+hC5sCs/ltWEyYjy+I6XinBNLdFgDHzguM3j3Qt264p5M4nolEXadAetxbAhEN28ry4WWItKxitXNR0t61Jdd8RM0N8DCH2rDShJAchgeQensyE17K6lztL/fxlRa2DmYZD9OjR4v2c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(7416014)(19092799006)(4143699003)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HinaIxS4cFup4OX3Lj3fvyIfeBk8NTT4mj3/k7+D2PSB0G+LhL3efkzJnjP0?=
 =?us-ascii?Q?kokOTN5LkBBxayXF7AIR/7Ii4tNlNgIlKt68XjmV+K1ZWoBOQVEVxqWm9Zlb?=
 =?us-ascii?Q?P30nJAhfP4sEdCtF03Duz+ZI2dGK/z4XhyTfqFRvJgghOoIVNqhOY2kFQ49k?=
 =?us-ascii?Q?0OB2tUbcWDdRMBveCoYHQF3iN/liOL5IQWTfK2jeFXdCMT4p02pMdAGQPem4?=
 =?us-ascii?Q?OppZ+2pHWkypoKGKfGi1PUIKcG4lSeR7Lvook0TpB+N3PDpNUWGbFmHzsO+h?=
 =?us-ascii?Q?6C3Bm1Eb6UGYVbvbbEh6v5ca3QNDQaSc4XzfFt6KR+uwXkzTPonsRh4X+7Jp?=
 =?us-ascii?Q?2xJrQKjr6V9d6NWIfia21FrnLNGq6L1DW9fDL+pYQh9x6l8TELDruVZBT8c3?=
 =?us-ascii?Q?3STsH+wRjgKXFwSMZBtzfLijUgSCo7mfoeshkpkUD6YgBx3xrTKvGk+g72WQ?=
 =?us-ascii?Q?2+T4OO0f5SU8wKfbWHQB7OZ2OZD4unIqbbo6hwXbLrvVcpsmhkCPf2nf60Yn?=
 =?us-ascii?Q?hM1LEallGqwUjj74nZpkwoCYPNUGOQR2zO/JKZjX7YjdhySQbb7Eifnd4zXO?=
 =?us-ascii?Q?zzsO5Qvp6G/7O1aRl+HbDVHrHVPpKO/qnnexYwsDumzH3N0ZyV+izipLd4AH?=
 =?us-ascii?Q?ON1lnpJ1K/l2c7XyyaQrYEqk4NhGDCwru2q8ZqWZH43NJhQfRzf5Xq1tc7Y9?=
 =?us-ascii?Q?Pk7HSl3WZxZECSe75qWpTmdVO9LABK1egOAHPKa/8gIuwQLjG7I/ZPAyhsIJ?=
 =?us-ascii?Q?yQccc1pxq37twHlxOHiCh48lLGXkVAxNu8TxkdY5ICksIIKggEPYTfe6d/B0?=
 =?us-ascii?Q?eGfdVLqmLm+PVCgnSALSqaWLj+SJR3qNLxMj9zyGTgVRorHKz9pBX8QairxU?=
 =?us-ascii?Q?kTYYU1gyS8rSwNrI8mljyEG1196Ka9Iy37Br9p507/hvO5F612S+i8m3rSq/?=
 =?us-ascii?Q?OTZpa6hdZGy5iDHe2fczf2DvYlORM2z7OZJOGdq7tXb/3LSTx+s0pywZSUNj?=
 =?us-ascii?Q?DBX5Dka99zWPBxJ13gjYTpwSNdfII4mLaF9s3NaVyQVnY7XEY7m6VBR4p0fs?=
 =?us-ascii?Q?f6MxlIpEKvEwGo9+FtiAbhmjKhRqLL31l5bGl6OuyzvaslDCCnCp/+PVvvM9?=
 =?us-ascii?Q?b3u3PHlEbrVEf003HANJENNeKbOF+xn0bc0imf8T8iOtN7grhKxqpVD9ftF1?=
 =?us-ascii?Q?0ac2Yuf0iMficR7nR+NOXpgQRuvInXp3DJSYn2J2wPcp5uEJfarck54KOl5U?=
 =?us-ascii?Q?o3dSj1G9Wxn+N1Bl5v2zsZAPAP3f7qWyrKabfN9xUNoELTNFiVNlFbZ7BM5/?=
 =?us-ascii?Q?UrzphLy1sr3dm6JZxojE8Wmcz0DfpX45V/NZz4hcylFux2vCQ6KuWeLBVAvC?=
 =?us-ascii?Q?RQLdlof64vyjBuH9dKeQKCo+tXCUx11/VcjiUOt3VHTfd6jlXnBnUrBlwJV4?=
 =?us-ascii?Q?IyVHF1flGNvlLK87DSyAdYVlWDCpg+lrXmQIhHzVh0dNALA1RKsUmBckeJtl?=
 =?us-ascii?Q?lJJOWQ2SMe/xHWph/s6n9lqH7PBew2wTXV4hs8D4w2gN7cZE18bo81LT4ivo?=
 =?us-ascii?Q?ct1vb6TJo0DVVBzd6V4pd4trsu9x4rH/UY+g/aof3V+5dDpCE0rOIAeVwLK9?=
 =?us-ascii?Q?yndrWwY9PE0EYSagLAVF27yEBS+WmGhBhFQQI3ndClXVh0/erlJnntp6FTHU?=
 =?us-ascii?Q?03aQ4EOD70nWqttBgeSlghfMX1Ul5ZmBGdb+BeGaskWoK431Befi3oAf6H3Q?=
 =?us-ascii?Q?hwFgkw391BYDHK7GefaeimnYlaxdo56zrzxMvrqGLjQ0gQLt9ZcN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 266f239d-9379-4319-d07e-08df25b386b1
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 03:15:10.0380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zEcJEqIuCDJaGACZ/xzF5nVeF+8H9BE2KPYl40bEHdWYL2jFz9k4N9NdKGmw2TBGNXQ4i0V54dmYfNPL841L/6hieMV7lCYwm+XfZBfHohLYYx2eosqlm3KYg7d7U9Wl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8645
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_201515_582067_1DA78874 
X-CRM114-Status: GOOD (  10.15  )
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

On Thu, Sep 17, 2026 at 02:19:44PM -0400, Frank.Li@oss.nxp.com wrote:
>From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
>Remove some of the remoteproc reserved memory regions, which are currently
>not being used for anything. These will be added in the DT overlay
>enabling remoteproc support for this board.
>
>Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>Signed-off-by: Frank Li <Frank.Li@nxp.com>
>---
> arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts | 21 ---------------------
> 1 file changed, 21 deletions(-)
>
>diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
>index 0f43e3be70589..f9b0e266754d6 100644
>--- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
>+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
>@@ -188,16 +188,6 @@ linux_cma: linux,cma {
> 			linux,cma-default;
> 		};
> 
>-		vdev0vring0: memory@88000000 {
>-			reg = <0 0x88000000 0 0x8000>;
>-			no-map;
>-		};
>-
>-		vdev0vring1: memory@88008000 {
>-			reg = <0 0x88008000 0 0x8000>;
>-			no-map;
>-		};
>-
> 		vdev1vring0: memory@88010000 {
> 			reg = <0 0x88010000 0 0x8000>;

vdev1 seems to be missed?

Regards
Peng

> 			no-map;
>@@ -208,17 +198,6 @@ vdev1vring1: memory@88018000 {
> 			no-map;
> 		};
> 
>-		vdevbuffer: memory@88020000 {
>-			compatible = "shared-dma-pool";
>-			reg = <0 0x88020000 0 0x100000>;
>-			no-map;
>-		};
>-
>-		rsc_table: memory@88220000 {
>-			reg = <0 0x88220000 0 0x1000>;
>-			no-map;
>-		};
>-
> 		vpu_boot: memory@a0000000 {
> 			reg = <0 0xa0000000 0 0x100000>;
> 			no-map;
>
>-- 
>2.43.0
>
>

