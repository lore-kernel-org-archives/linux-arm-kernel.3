Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F85C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 11:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RovP2dDpF1AW5KZSitPSWA/TtW5F2LS++qJ9K0rYawM=; b=l98VdSwRTUkbK+8/iHyiY4PL66
	2SIL9/dwCmO6D+hgYHUaebZB1eBe/UFcUwmYU7sZtBA+5NfIxBWYWHF4nTnuZdS9064sxk1JxiK8g
	a7QGoVEFF82kA947zs7zOYmUckcwRTn9X34mWqUKF1EcvGb6LG4MA5Bbc69dg5lYpdmV7bXlmBUEh
	IFwMSpvCfB+nytSNEQKUOJkGHt+V1ei/WNEzD5MCAw51wnmjrf34BV7PYYRSLBeJkK0SOJb0E/X00
	MRfcflrK802RLHLWDJdOl42P8mUpfgyhWo35bOx3TTlCb6cP34IHvK96tbKuBW0B2VSXcXgzDj0gy
	SOiUaUXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wghGH-0000000CKSi-1N2B;
	Mon, 06 Jul 2026 11:13:17 +0000
Received: from mail-westeuropeazon11013046.outbound.protection.outlook.com ([52.101.72.46] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wghGF-0000000CKRN-2gHt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 11:13:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I05vRcwBalT0nLr8FC+l/E4lhmR+n8c3Ji0jgpIMoAvsNqBQzVrJcFJYuOhnYAS56ssrr33pFnvdzfbx+CGWd0M93MvpL1dMcB0nYBNPkG/ke/y/lVfZO4xDfuA27VML0y+uKIZVW/2SJMOsvZp8yfsIWCAj0r3NZ5Dgc2/3R+PnTB2JG6C2bWeDD35YjFHtnuxV1tw2WUsECOlhsCknT+pnrf3nkko2roWrqHRN4Qm0ch8kQfBZgEeGAOXpK5Mk8GZ/97y6Fz2BsFvM9nJB86kFrgAlssZMiS8pMybwNRZBvvSVu45H0v7JQAMslgUdRrfDoDCIINvtiQ3zAk18Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RovP2dDpF1AW5KZSitPSWA/TtW5F2LS++qJ9K0rYawM=;
 b=xaiIYUODRqv6KARERh2O2UCA9tmWiKz6ifXTM581kfrGZrDNhnnHiIeZ40sWhzw+CXfeTQwlPy3nbPcMvtH4Ji3iELXpIinMEPz3kF1QYi4tgUxyUspKLreqcm+lw3azBwm7toe8OF4HcRuREyeFS9Wr812mFGTLSlRQe3cJAe2EPtHoM5YWsgNWwHf/O2O6VoiW8B+iDGeL8DxRAmw0AsADwC7THF8c49pgf0mYc5Epl2GYag3zGvYqhzuwpEg2sXDJA6TY6Z+Rygzm/HRvExIO5ZOJaeE1zaNV0tbgPfxqa8aq7hkHxs+LAvhtVPYC1W/mIWbfiWKfcZnucb6KaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RovP2dDpF1AW5KZSitPSWA/TtW5F2LS++qJ9K0rYawM=;
 b=WYQ4jAyLuFqKLj4MsSYQbYViImWEdB5mBtSii+VPhRabz29a+96pJHu/seqQRyeAJi+vTLJ/kPAclSLXLQ2Y5LtsbK1rgob5/emZw/9gH3g4hmCijxbg0oFvzT/g2YqNaNoCtN8p8O6D6JqN7Svhm0uED08s0+5MQ3VNh8Y7l9rA9SIBBb4Po/9v7xpWo83An6QiaQP/AahwWa4fykK4uqedGlEabyo+BOY6c2GYjx0gjgfpEZ4zcmU11hh/0P3Lm0dEZDyMs3O+iz2X+YeUkH0EsdCznYMbFxnlViQiH4hbaAxbOvAnnFwdoJrHi3lRFzqFrnpjiowbw0xxx7jW/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS8PR04MB8993.eurprd04.prod.outlook.com (2603:10a6:20b:42c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 11:13:07 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 11:13:07 +0000
Date: Mon, 6 Jul 2026 19:16:30 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 01/15] arm64: dts: freescale: imx8mn-var-som: Move
 UART4 description to Symphony
Message-ID: <akuOjuQcBKU5C6yN@shlinux89>
References: <cover.1783330236.git.stefano.r@variscite.com>
 <3ddf65049a048dc4760df1e8ae5af4d3e91ca77f.1783330236.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ddf65049a048dc4760df1e8ae5af4d3e91ca77f.1783330236.git.stefano.r@variscite.com>
X-ClientProxiedBy: MA5P287CA0173.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::9) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS8PR04MB8993:EE_
X-MS-Office365-Filtering-Correlation-Id: ec6b493f-bd2f-4237-7c06-08dedb4f8e77
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|366016|7416014|1800799024|376014|6133799003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: eEbNt9pUz8GCah7e7zCOYsLcaFWLv6/TqugQQYb3eSxD5DBM9mbjo4bbIltCibCLKDdlrXk+05T0V+G2htINyOieDYplFof/kQq1vA7A8XhX0NLza+psgnzXhptXcu5Caa1AQxIiFbyt3GnkdStf6kC84PFj6G6v+3xhZik8R3LmmfRdgYoWeK4xG3QaoSR7L77VEhNfH6DoTGEjPGwdmiehYYoTHjmL3HWZLvBj643bHQP7UN7sa62p2TS1FRJrh1f3yhChhkY/ur5BRlMqxmTbYIWDgBvbkeNsYiRick3dn7USMXHdcM761ru5nARiXT1xQ+2R0XpC8QRp3EJrsELZQtq+IipvY2DR64L1/u0+opwuKLvAcP/ihPmSCiCvL7U1/XBqlnsEanz1r7WH4HR7MZKr7habiIsKdlDvytTPDiiyhKqZ5C7+lQRe4lw7bIcz6E6DPmxSqJm5PkwbqrLOjwZhm4D7wG7Y8i9z6MTQ2QVvsKzZ3xF5br+rwkuiJDOxAMqQ/iiuWjjwZpJ/W2JD9a9k/7Iab6IivdCtshuog1ub8jNrKe+6ozpSnhfnVk/C18Nl5f3UmH+8vP3mmNbvMfyUdd+PSwisqe5Z2YanNqeTHPYAQsbiNRSlOv8CuI9uWspm662EDmCZVdAWvwbjd3wdc8Iu0O5htrjrgnE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(7416014)(1800799024)(376014)(6133799003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/AG4c6Umq8NglSsL/JUMID0vhJlVA5Jg6VIxiQahgmwOpuDIW80G7cAFJIjf?=
 =?us-ascii?Q?7Np2p34Y4eplR2loaZnQqQWB050GxMoov8Kp+gLqV8hZJCf+ECFTzP5fcztm?=
 =?us-ascii?Q?0zy6HPvf2PXEUprbz97FOxb/N8dbqBotJTM3aLgUyFAgnJZtMHTbeYC10FSZ?=
 =?us-ascii?Q?c8uTCytZv6kWffXNrR5A3TZXzSXVH6lU7Mrx/ys/YW8TkozEuFh2xMaytcA2?=
 =?us-ascii?Q?5S4vEqxs/yb7qAme4BmEt+vvZOEF3FnLjh9EoCKuiIwUkUAO5kN0HFyMzIak?=
 =?us-ascii?Q?mzWdT6wr2maOSp0EmE/m40NX+suGq536Ti+9wJVwbHj9ztEXQCRswLUmN5J/?=
 =?us-ascii?Q?OOxkwg5rQjfLSfKh309Edw9gzkx9swiKd/vFl4mzCpXtZkb3U9ONJswNOXKf?=
 =?us-ascii?Q?qy6tcaUiycWmtE1qCtxI+JkId7wHmpyWMQdQW05tN+gcbmgPUiSiXew2oeyW?=
 =?us-ascii?Q?/17iKUwisY1JqVmJrbq5DaIMjCxRBNQ1cgCUXKm5lM2XfXp1+c7GG23UW0aU?=
 =?us-ascii?Q?HR9l/DU22TtKPptb4Uf154ujSLiL/su6lSdiKzyYjxcsrvIqT3KV493mk5Ed?=
 =?us-ascii?Q?SzhevvpO9NbD7Qbn2fBT7m02Oo9im5XR9RZDHL4uKSNU6Ub3Y2ejPy3OEePg?=
 =?us-ascii?Q?MKAlYn0r9UsJBEecnUgKnIkWsGrJBRVq16FVgjzHINHBn7YKSBS+yelq9QQU?=
 =?us-ascii?Q?0vJmTOgwAXrQDJHzFcpMbHjLrTyIeBoNo8nadE/BjuttMII8eQzVLI/4OSXX?=
 =?us-ascii?Q?mIeluKOkYg7idLyktoW4fnx5im/L3HghSvq85rbGNoe2wSscLEoZ3xuaSLqZ?=
 =?us-ascii?Q?A2MQQbASgy2NpcPpQ15AIDdUlquQo101UbfiWTMZRn1bI4IQWIORniAyATVy?=
 =?us-ascii?Q?Km9RdkVUUMyuYm0pvDUkG1kSAeC9ql4hVwgn+pIVcYNwWt1xrWPoLZ3GvZqk?=
 =?us-ascii?Q?oq8hR8oIiMBsehHXyDNtU197YRVoliUKljL4eZybIb1Y1Y3xX+zuf/cSeQV8?=
 =?us-ascii?Q?sKNyEZk9EFbAJV3TZfThpsmPybmSoik/o1bNKd0Vq3ZgZnBtWCJRhF9eGsxA?=
 =?us-ascii?Q?WFc3sEYyKNkE3dWjD1vJ3r4Kfg1+EPRB+y/6m24pEei5tV8eTvjaeGqvCFzC?=
 =?us-ascii?Q?WyPinJTQjxcj2++DlOAEzB2Bm1gPPNJF3kSoSD2uPSjl8+s2Zz67V06oT7Xq?=
 =?us-ascii?Q?6kU/lvGXiiZkb9Bg6JfJwv1su4tFUEqk2rs/s6gAt5PzfjRsM5CWdvh3rWXf?=
 =?us-ascii?Q?3R3zCSbK7esqc0bsGzr+aDkzk+/KywUU1COQYo+J7pVQhhCZG0z9tzxMy8re?=
 =?us-ascii?Q?+BsmoxQj6mAxh2mJpcws0wCgGcyfGbbjE/zj1kQQZTcEi/f6KHCM1sDxGb0u?=
 =?us-ascii?Q?aYAjh7hKVVrbZsrofpxMTTEF0he4743USM506iRoR/mCCW8zyZGfKpm3g2w3?=
 =?us-ascii?Q?0W1Cb6lDl36QGmQAkKhlDqTD0/elpXUUVX3p4b/gT+UpuDVUl4hBzb2zdyT5?=
 =?us-ascii?Q?C4fOLcRPH0PvAA47EoHUH02VsXEG2Wh+LQnw+zs9B2SmRivFp1NSL/CVB8WC?=
 =?us-ascii?Q?NP4Cm0Qw3HWx46DIADhug0Z1P41v890gt1G+2vAfFL3kR2XqD1fo76gBuVqg?=
 =?us-ascii?Q?UbADirjsbYfWtNlpV0fwNb4BdVEwp12EQZSShmE+iuANwQZ2Ji5bPExlhqfQ?=
 =?us-ascii?Q?X8KHPhoV8sWuDj6ADWKgQK4LxX76D7y43LXrDgg5tVpv92HB0pLM3qZbrFZo?=
 =?us-ascii?Q?7akimu6pWcxyUJgJxOX5ynKNQz3mbvxFyqXAIkfm0YNvTR33Aq3z?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec6b493f-bd2f-4237-7c06-08dedb4f8e77
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 11:13:07.3490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RWPIN1SzsxJWrOKqXVeKOc+8EEnIQXYjE3ejjgcg4GPliHJ/h+XC7tOHNgKise7pPnvp/M9LgdDHIa0Ga3dARHZmgGAR2YQwHVnsWQyQkXNpPz24D9w+WQ3I5J1uawgZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8993
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_041315_687413_317B7705 
X-CRM114-Status: UNSURE (   8.04  )
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

On Mon, Jul 06, 2026 at 11:34:31AM +0200, Stefano Radaelli wrote:
>From: Stefano Radaelli <stefano.r@variscite.com>
>
>The VAR-SOM-MX8MN module does not provide an onboard debug console.
>UART4 is routed and exposed only on the Symphony carrier board, while
>custom carrier designs may choose to expose a different UART.
>
>Move the UART4 node from the SOM device tree to the
>imx8mn-var-som-symphony.dts, keeping the SOM dtsi limited to hardware
>present on the module itself.
>
>Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

