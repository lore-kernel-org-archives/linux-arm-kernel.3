Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED416C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 12:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+HX5BXsn9wM2EBUZZMewtz7hF+AUa+2YgmArnqmHTHs=; b=Zx62Oeb4HaKCfrIfSzOfzDIrWm
	mDrjxJSFBXa1TAZuRRx7hiKNRJGdbcHOTvv2gxzlELZ7xL080v/pDf3F69UcdCQFsIm9rPwPDWU3L
	2U2OxnsPFWqVCB38RAAHkVA+HmlMg5Y4xriTofu1PVquoTZJZWcpqLUeZ1FVrIeuK757PIqapG5Y0
	5AQS4J9qjYAxjEIeq3VOJrl2EFslUmrnAQwo1wOBfqW8OC5KPg+7T6AT5PSiICk/COJwa4hre3pef
	a6Qt7jlJXxpDJ4v6MyHzkPP3Q+6sfxC3wiHw8eK1wVZuavzgHYp5i2hH+9lced2zyy0RJUM6/EiIF
	Ld9HqR1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgiWg-0000000CTxE-2WTs;
	Mon, 06 Jul 2026 12:34:18 +0000
Received: from mail-westeuropeazon11011030.outbound.protection.outlook.com ([52.101.70.30] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgiWe-0000000CTwY-0ZZk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 12:34:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pnrJSCE+/ZKnBCxKUOKVadRRWZLuTjCNpfiI02AIk3OpnUfqdx/nLshnq35a3Zsu6DtouT8Zu3TiADuUUjV0EF1zrA8acuhRCSVZGFLXCTH6jxHIhgXnUdGH7wT+Rsg/1fXvOOjYTjbDIlPqCYf1kN8yrIWZItdTZZEaO8hEiYN7J2ngX40+K45uO5r8dUMXJSc5wY+BBqfiGV+Wg6gdnIi3bXS9HZGPsfx2Jtq4RkWIvrOewQAr6+bOhDKvSedFeIDPss8WFM5WOZfXSlDD1dc9ARh8tskhoD3IbLe3QgkxNJi5yLl1vnLeIwkKPWUKcazyjLZLm0bIWcLjb6cbZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+HX5BXsn9wM2EBUZZMewtz7hF+AUa+2YgmArnqmHTHs=;
 b=QnGIkw/ur8ZhLiV8soGzFtPDdarVtqa8iKpU5jbc5RnKx0+Y4waGO9KecD763/yaeNVUmKGPt7ifN00tIG/DiM7WHaK64Nv8cJp4J8PjGOQigpofgqSh2/Jm1vsiUJ/0VlXxpMZTHSF/sET7vZYDAu64u4iCTQ7TUbN10MnojH56S5TyCx1H5KkqyP+kxEKt8sqWkU0To2TDXHSYaTTdPj3c7BbZwNpofbhrLjRvv1O8CtDWatRSf9k+s0z0uA8uY5H3QxYWxbNn/9UGTWVBEPqSxAJ5QeSgciFmyNNJwnssVDgBHXRDmRbNrmd/lB7pc++hUZGNlnb0tFLJj+eXzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+HX5BXsn9wM2EBUZZMewtz7hF+AUa+2YgmArnqmHTHs=;
 b=mgYgxZOGkGkXsg3EAR3TA7BlkiVAWg2nIZvjCSNHk8etbn7RB3PCs9hg+ESFAZ5SUtnx0cGTCig/YaQF04n4eTBV+Sc40hvYrwNFGq+a35EJaHmLdoCYLvDp360SkbSNQvzQEyRBMWoIw3ZG/8Dg4VD5KWDkldA8oTYDipxKqfrF3h8b0pOjclLToi4mNds5KIyTp/BJV230KBCKKIhqJy5oooW2fG3pxCi0foJD4tMa3caVJ8n5/sb54t02OsXEI1v1uhW/HDyi5FM/LsJ/yMi5bOB3xDHuVtsjAmle9on3CKmUFcVLPsAL86Mb2KuM323i/pUQ+X2FRUX5RfLroA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PA1PR04MB10700.eurprd04.prod.outlook.com (2603:10a6:102:48e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 12:34:11 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 12:34:11 +0000
Date: Mon, 6 Jul 2026 20:37:38 +0800
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
Subject: Re: [PATCH v2 13/15] arm64: dts: imx8mn-var-som-symphony: keep
 RGB_SEL low
Message-ID: <akuhkhjy5B1lxMq8@shlinux89>
References: <cover.1783330236.git.stefano.r@variscite.com>
 <0b02e984925f48a2b22f46e21d7e237fa9558679.1783330236.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b02e984925f48a2b22f46e21d7e237fa9558679.1783330236.git.stefano.r@variscite.com>
X-ClientProxiedBy: SI3PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:295::15) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PA1PR04MB10700:EE_
X-MS-Office365-Filtering-Correlation-Id: 84270ae0-77ef-4b4f-2e3d-08dedb5ae16b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|23010399003|19092799006|1800799024|376014|6133799003|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: updvXvRJ06A5/Wmn9qKrnFEelO5uE1jq/YDOqFcLf8evBWp6poDykjg6W8hccablCY5/7ri+TeO0HxJ+LlHRrOEDn4HSZsow9DTNlBTB/uUXPza3tkGwLwC8UuRcrbrBdRz0ggt+NHgVig7FOvc4ua6/CVKpNvwrmCEdN1tPY8TTGCsY6lvZXKuV3T73YxpOQcS5p2kdOXG4G9YV5fhvoWRKmt0Mk/ajTm2bhbgBQmbWuor3EYJKhUqg51XMtZis1kw7HXaT9973JrcLu/U43glcIiW/1cuD4lGdMR3ntUmp3WvrwtM/Xj1zuBDIfTn6zo3PBd98a125jh04pLl39JHH7axbMDW2cVCtMmwd4R3MXvf9Mpxugzhy2jgvaLbsyGd9DPrh7KyTTvLLFz5ILJsWbBS+DGuxhBmJ4wn0JnoKBxWGTIPPq7Mh+OhP8bJyFY5cvwhCn8wRROYXBswPgQZ4nu2Z2vylHztYeNJrzX/eii7NUzQJ2EVfUlnxVWWYTjPQ2r6xgkuSjcxod3/Z9Aq5XoWmpI0H3Kd8OfFhbfMxLzDkjTMFjrZqngFj/JAi3BYayBNwjJmFRLKo1gR/S5l/xru1v7yyNheqvXeaUaKzeSYuOFKk3qWaeA+UmJz10q4u27snI7n2RaXbQQ4Z4ky8+HaRRGjXC1qffCAsG7s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(23010399003)(19092799006)(1800799024)(376014)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DL6GbuNUPJBrsfKR83YPKPW0PmbzLCYgm2tdd3UOqMWHGv6yxtOOhADIoYA8?=
 =?us-ascii?Q?rRVMwbb/9uLQ6QciEBVeE30KWO9FR0YCvlSXL+lAHljv4eLmjgSzn+Eh3Xv1?=
 =?us-ascii?Q?UQVF4Sxggck/YjvMj+R3nNCcaypw2JrwYSSdtSJx6h3NhW2pS1eBNxJvHosD?=
 =?us-ascii?Q?kiEXvS5LuKqiReKFKW1pt3gqy1M9HG9ouk1imOhDxjUV1yvkPkRj1hvXbkdm?=
 =?us-ascii?Q?DaUbXa6VRzbRpsRAEq0jdXJn2ZbNqAJncesAoDksHnCYRomvAS2ReycSv/rL?=
 =?us-ascii?Q?TsVQFB580FZdO4aIdkWndjpVaNJoidLJDB0tHMnZx5JR0uP3jmBGiyG5+p1M?=
 =?us-ascii?Q?UxzUGGgVPYidge5Rkp6muzwgZHvCkXXOZqbnSaSwYwvE3WdKW0QFXwqfNI3i?=
 =?us-ascii?Q?Uc9aXxFJEEV1McqXg8zn7veuKZQAXjN9DVuAI9PjJTxtUBFSXHlz0871vvhd?=
 =?us-ascii?Q?VcVG2XJ2hiPZQm60Fx47RnQx0VW12M0oVUFJGthL+1XQrmIafe18nMl8rGFC?=
 =?us-ascii?Q?VxDFhYR0ZenaKFoNd9AB0HkHF077tjXUXROP5TSpLPviQojY5GRb+Sicdp7A?=
 =?us-ascii?Q?TqOzjEynyEj46dOY6DW1Xknz3lY+otzjflQnPxK1XhSOYg4jk55u5EC6JBRP?=
 =?us-ascii?Q?w5RnoF1ngSvEJ/FfAYha8e/GLQBFXvmBl4vBPrWqhD1Tj0lQ4+L0y8BMCU55?=
 =?us-ascii?Q?Lc5Fmb4zTP2TxmmqlBcKTna6uFEy0AirKRHjqKZYr+vWvc3pAMAa6pzecpZM?=
 =?us-ascii?Q?v71HJegw2hlLhJvF0EO15NNuW/dyBf0k+bww5xO1UdCM4tbxlbqomAnnEUyU?=
 =?us-ascii?Q?iu5EmtJaFw9KwBeaos+t8PBEB1Ku4ULyrLg6jFRekMDOog9yXVvvKRE/87Ff?=
 =?us-ascii?Q?4Mqo3LS9KFO0fppnXeHVo66pRd3v9xqQxe/FOWWTLwjGWny0+O3HyOF11aBD?=
 =?us-ascii?Q?EGON/4/4a5fUtAbkXn5OGoLK5MyUdxsn1F51C0OKJNv4hHB53UCkBtNXdYO1?=
 =?us-ascii?Q?v5Ih1ZR2Em9BRRd6Fo0FXvKT7dJ2qaWQb6KVutK/9eunmRgTA0p4HXWzrBxm?=
 =?us-ascii?Q?W6tMSFxLfYPBdJ96mxG27pP9OBQ1lPdyZZUi00IJgApFB7nBP43EVDk1BvbK?=
 =?us-ascii?Q?mB50iOXActr5XIf1jYjyIUt8S5v+nHIpo1xVozj5xgNa8wWxj+Iu2bVept6C?=
 =?us-ascii?Q?bGvjVjdtujfvCEW27H6Ndmxc78o2q4wgf1DPPLgvVuBhb8K25K1VB/sGxBmC?=
 =?us-ascii?Q?KDBe+gSWpvfKgBuyiQxCpZAbtKW40GLEoUyCuhwHX+EV1Z6tneu2QQ1sV8RZ?=
 =?us-ascii?Q?4oJeVYrarnFR/gS8mtDWZs3KwOOViVS24vLssRY4lHknCn2j7DMw31VSJm5I?=
 =?us-ascii?Q?NsLDat8wuDCaevhZ0bdbFxI8ZlKUpQ7Zzrv4zrBvE7pobdB8x3+NqCX5USkc?=
 =?us-ascii?Q?HRV8AA4k849stDhNXQc0fzt6C46JpwfZheFX2pBRAa7JuSMEfAmZpInl2Aah?=
 =?us-ascii?Q?3zjNOMAN3dRYsEwAnT7nlcB5dBegy2MwR1Mm7l3Z7YJPjM4Qqy3vlU2KGfhW?=
 =?us-ascii?Q?ID8IHSnGQJ22ouifhl1vskFrtymDQUI9+zmKSNGxg5VWsuhJeY00C8lin98d?=
 =?us-ascii?Q?NbpJDpcnG/sygA6+l9sxZqVa2zaWNVBnMuGvtcMAQLxmQwSL4iN1l5FPaSGW?=
 =?us-ascii?Q?sNel7BPUpkRk/olV3ghPt3Y+0bcEiUkCWiIvTee206ziNOR2asz0MYTG8Xyk?=
 =?us-ascii?Q?8QWIevOrlcBFv8t48hcjRf/VDWoIYnUsiAswBoAAHSWKujRAkRli?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84270ae0-77ef-4b4f-2e3d-08dedb5ae16b
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 12:34:10.9808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uidq/tbexuT+tIkBourIwsojXSWJc5loJxo8QF2guU5HLVMW8d3cQCG/1NUw0DBt9tkUWehWl8kxrvj+YdohJs2Tlns0Z3I2WGgk/xcg9yhJsjpANcef96Lj8+p0hTur
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10700
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_053416_178088_CAEE3074 
X-CRM114-Status: UNSURE (   6.60  )
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

On Mon, Jul 06, 2026 at 11:34:43AM +0200, Stefano Radaelli wrote:
>From: Stefano Radaelli <stefano.r@variscite.com>
>
>Keep the RGB_SEL line driven low on the Symphony carrier board.
>
>This avoids leaving the line floating and ensures the board remains in
>the expected display configuration.
>
>Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

