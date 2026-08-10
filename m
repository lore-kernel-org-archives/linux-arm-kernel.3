Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7584C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 19:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+zGFBcqC+oiIvPfX+QyAzfcYQ1pMo5jj2aoPygDmSI=; b=bj5Ulfq+ehkRBv+ll7Ny+he8Fd
	dNV6GBnpLoWlvZxrmGtwueCqxaThtJQL8TY8JzC+Fu3qA1RVrCyxoX9oL4diHU3dhHv4gQMso6PEW
	9OAtULEARLstmbbnPitKLYG4Zuot7EChGVImdWsXZOzsSaTrQE4FOzBAexQC103ODovVhLIpxA9Xd
	XWMfuYOqK+brnzQ5aew8KsWzErG7YK+y9Lz5hxeskn+wxMcDZNrLvWrgff/IuF8kGLnevM4NIjuuW
	b7NGPwnCl5DqZHf21jACTWDqjR93PrqKC1d71PFA0sLJRAEdlYxJoOkgFHkABGWhMzXIYaBNpxCTt
	yuRJW2Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtVFA-0000000ChBH-2wFm;
	Mon, 10 Aug 2026 19:01:04 +0000
Received: from mail-northeuropeazon11011042.outbound.protection.outlook.com ([52.101.65.42] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtVF1-0000000Ch8y-39Sl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 19:01:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fcqMmUeULbT6vVVQtdNH/WuA7OCbOW82gRJc3udEDoolZhAddpAFlvPEzH9KOKE/WLjj9GMq1I0IIEqoBNuAHGJowLIEPkyPa8C4P/1q8bahERnRZMw5lhe3wC7ij1Z3hrZPiUl5hqsLnhD22sNBndP2v5TLlYgTlFDioP4abYyR/8g2n1K7HsnnK/d2Kvvk4mIW3B8rRPY8LKAcg8EDY2DfFTiRsgPN5J4i0cTlYk0okLhx93VOvfGeBVuXr1wRxfGmpyJWG3aNFH3JUxY9ddbcj2lzM7N8X5e9+3dTF7tJUqHwuEZIQOL+EdSViwVLjiJJqIC6fuOwwYN+gdlVYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+zGFBcqC+oiIvPfX+QyAzfcYQ1pMo5jj2aoPygDmSI=;
 b=Rh0MbGMuSNbjwB8Nem28qFwjLV6EuSkq8ryOUVMmGk7wSddq0whreiqwYOf2eun8V7WWCp9J7Z1Pd1zyWgUNbBYfcI3CNtBu2vCsYGoYKQTAP/xum6z6LZyaWiXWd6VQ9Av8XHofj4Z69BmaEGmfkDjIHGSwHBvUjyPaGNaVOpfX8jqxNWVzdw8tjnvpiOPW7xASclzkMwkqZ+F7sWTBTgtlOu6+lKP6plrT7Pzi1bSajhQ1aquPi6cn8kBueBqJIN1lA15d+vAd3tvCm/w/i8WQ82ZEVkvcnU5PK0RXt5Wb2DH8T/o6ONAI9P2yNhUsNBWzjM9UD+aa0aiOy1u4fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+zGFBcqC+oiIvPfX+QyAzfcYQ1pMo5jj2aoPygDmSI=;
 b=ldAanEBBktfVdE4tGLLhn+bdRrgcKcP+8M7gUDhjcRxXZu1f/+L1DYfFtGZT0/juqzdugwFaqG6W8sIp5XvBEqA3AB+rT9wSh0hu1l4QKbrYpMr3ymAbYqJwqxN5YjMT3Rjp6ZeAAQJ9kUnv/koT58TMgfZEzk/aNwOzK0fhE89pJnVM3vVm9abG/UfExPfpMmp4pEuGZZfVZh79JyqnWy2Rm0amfFt0IWqGoeYIc7c+l1qb5PnOi+mssjOTLG1hUhjTorb+sBXKrQgpCKUEGsy2OrEzBvcWjB6gBax3qFBuJ2jyJerRLWtgeLLNrZsWPXKcWr/t32vhxXZZMXrzsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMBPR04MB11787.eurprd04.prod.outlook.com (2603:10a6:20b:6ee::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 19:00:49 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 19:00:49 +0000
Date: Mon, 10 Aug 2026 14:00:37 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] clk: imx: imx8qxp-lpcg: fix runtime PM cleanup on error
 path
Message-ID: <anof1XLXF5Epj7IE@SMW015318>
References: <20260808080215.2669452-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260808080215.2669452-1-lgs201920130244@gmail.com>
X-ClientProxiedBy: PH8PR20CA0006.namprd20.prod.outlook.com
 (2603:10b6:510:23c::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMBPR04MB11787:EE_
X-MS-Office365-Filtering-Correlation-Id: 57c5d51b-7839-4529-0172-08def711b100
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|7416014|376014|23010399003|1800799024|18002099003|22082099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: n8MqdcDxCawiJGXTR+WW7oOmXgTulMr2gPU77e6X7HWXD2TEo0Mqg4TnDxoVlVtl4kTlHcQJ6MI8fYAW6fB8olR5VmDXsRFTnvurdKjtvmwglNi895PvU4pRmmO6+lwGaBU1C6N1NLhzduEtIdM/Wj+vPLM5Fmn2v8qFD6pqXZ4squGiIgkkdNesdVYfwtoE4UXmOQWbwU/0vxKif/a6kzWes1TmePblqvlXFkJRwdx8E4JB5jSCBqDrYegnjX5K8sp6p/c8zSB4yk+tIhNC7q5LVccbHw1WafP+o2nSm5nK/Zh1btJBbMYzfGT7QjQ0mADHvW0N4TcXgd375WnM1bxsQIjztKOjt75MP9derhcTNgnQb+oqyWWS354iBkjxMNrYqYjmpw0+TTHPxhNvlsLa6yEmpDxRuw2amK2qPKoIHkDSlxkO1d8Ia30li0nr3ZZxAg2CyA72Ykly12mjxsFyHh7FinbQEQwZ+75BEu+FbrxY9yTeM0tvHvdKVseorfPT9kQtmrDPGwoFsz82SBvhPTclk4AzEzI5qD6po3d0jxuP7mcStG142FRkEQRRJzhRhDkkJaT/k9Ljr/WUSon1vLxuNOTYQledhg0A+ajH8qrMPRsl1rf+CxmNrpi2lv+xjsxWpD3yZpZjSpv84u+489aKVhZcLtfQBoPjZyA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ugBKA9o2snWALdrcZJGWWmJ0EzYfJ5BWlR8W5m12+ObJt3Qf+RLVguUR+2EK?=
 =?us-ascii?Q?50WCfYXrEXgafSmkLAGJbofu7vyWJks8dzS4WfCc3w2SP6z/qoQHnJXjZJxF?=
 =?us-ascii?Q?LCul/Hmx1PT5z7MvEiO4OaM/MC2oykxm3emzCowBRyKsSZYvpflJLUf3opoM?=
 =?us-ascii?Q?sAuDlJ8y2Lr7AKsP+02d1jWGo4Yl6FSxcnfuo43RPS7P1W3sVxv7r9eKztxr?=
 =?us-ascii?Q?wuxytAMY0IYucotJW0qOZyjR9CXdhtYeiigMz/rm3S7EoBjh8uGc4btzHxy1?=
 =?us-ascii?Q?b5LAROu1YLJMYUXrc/DQz7LG4pMdf4gj6gEnwxEPBnlWLD/FaJvQdP/BW4gi?=
 =?us-ascii?Q?NYP43AgwaqdgGVlKoB7GMSg0/1I3UU2aILHtEXy15Nj/zlALY5T1mUDRCQvU?=
 =?us-ascii?Q?f0Tx8IKr2twBftv7l60oMVYBL0MueNJFBPvXJdlprd7ZWoIPq14JrAsJrZvf?=
 =?us-ascii?Q?sQoDRYDIc1UXCrRAM3SwD8UHsMPjFTvM0gR3HcqOcmGthG31RG5rfvDc7gCb?=
 =?us-ascii?Q?CcXPwFm2VicJevoJ+bgCqS6Kb/IK92qG9gJrbFlDZMj/6eAgy7nR63R0KisR?=
 =?us-ascii?Q?ttxwfq2IS8RIF9zK8s3a7+oSu1Gh2epBGi1R/2jzHXdhPSsWdMX8Q/rpuFxL?=
 =?us-ascii?Q?vep9eLGgD98LYLw1yAJeKMjTm8pbKQ9TsBx1fdl6Eg2tFNjDOnsPSeh6aert?=
 =?us-ascii?Q?jfeE05tQXqJI7Ua4TRTVllVHScH2C2Kyhh4uK90FFmaCL6IFs6nK7epRKgW9?=
 =?us-ascii?Q?8J8MMwtNESnbiIBHMBiQ9/jD8otSQ7puRF/WxCyHaJEoij/wY/XYPNtz01v7?=
 =?us-ascii?Q?OgmtwVd1E008iith9qXbS7js+kUS0WmiI4JyFbwdcMvLobT1DusFULFhoEiL?=
 =?us-ascii?Q?njqkXwfG2QjOuHZ3Ap33caVrBG/NRfg+5DPN6RZwSnSFLOAqT4Gp4w6V7NH6?=
 =?us-ascii?Q?iAvbu2PGFlzKnGZ+t/kXWPJorvZSSzvk9Fbdi8ErFTzQpsdj2p7Z/31kHibQ?=
 =?us-ascii?Q?Uju5elV6uKCGxQDHTU2k9DtvDx/9VDNH9LFHLxKi/OfMCRXr3fALLOUGQPj8?=
 =?us-ascii?Q?/Rpfzgstcme9mmcK9F34PLpkw78n16vs3nAw9TKKsz0I90Ka/IeS5lPENDBh?=
 =?us-ascii?Q?fU5VrPRHaHOd05QqA1G1Z+Q/Rj0rmjLIf1n7hTuens7yKDiA0MvRq4Ojb51+?=
 =?us-ascii?Q?ssKURHGoCRLaZQnQNkMuAmYp6FlMnmI9tsHeA09q5+er9wgdX3YJvkGtDWis?=
 =?us-ascii?Q?Yc3kApOCN/O57lLALuGWuFjK6NeUZ16RLeONKSDnEQV23471CdylpCOeaj/O?=
 =?us-ascii?Q?2uy7lu0RnCgEdtULQgdGofiVPInoIeuyE+CH/IGnsTjFiqyY2cu3VQqLvEp7?=
 =?us-ascii?Q?ajJRvGBtVymknK9OqsXGbRWkK9ytgxi5sYHwVX9ieEGkNo0ogS3qDIVLy6L4?=
 =?us-ascii?Q?xSB3jagC8HBia1mooFJfPH6oBNfjtGExpLCOQxmbfdm/kd6n1GUPWJ6kXQBL?=
 =?us-ascii?Q?AGWZo3UHPVYgSY57Aa7x6vSSx5jICWP/MlM+0MxTfnsqaWkQ2Zz97M5riVvs?=
 =?us-ascii?Q?Yt1nKdw/s0midiM8LAqDD1+TN0RJ9mxWDyZmmwz8IW5lbnF2ZDRL/MatlDTJ?=
 =?us-ascii?Q?XSxSACm+F5hyU+XjFKsY/eZg6eyrxaHz+nrdvWoafa/Wwp500hiFzP9nrUDc?=
 =?us-ascii?Q?a9O+WakgBp6bogXDa9CBeyPPHRqWbOAnnT1CWD1EYXV4sysB72YbFTuKjYMh?=
 =?us-ascii?Q?6wz0G5dI+8beZe1jPj+yJYsLviAZp6tgTGxUkVbA+rvCDU9n3htT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57c5d51b-7839-4529-0172-08def711b100
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 19:00:49.4343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PR/W3kn0AuxxVk0jco8oYtWjLivx0rS/U6N+lOeAoV9s3FliPKX7nPWH9SYR/tWVri3+VI9mG7OUlKM4YijpKd+SZL81eQqUJYHO2bMEzP4j8t1Io0kjvDMwNHy02plP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11787
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_120055_798150_EDC8F691 
X-CRM114-Status: GOOD (  21.46  )
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

On Sat, Aug 08, 2026 at 04:02:15PM +0800, Guangshuo Li wrote:
> [You don't often get email from lgs201920130244@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> imx_lpcg_parse_clks_from_dt() takes a runtime PM usage reference with
> pm_runtime_get_noresume() and enables autosuspend with
> pm_runtime_use_autosuspend(). The success path drops the usage
> reference with pm_runtime_put_autosuspend(), but the error path only
> disables runtime PM.
>
> As a result, the reference taken by pm_runtime_get_noresume() remains
> unbalanced on registration failure. The autosuspend setting is also
> left enabled instead of being undone with
> pm_runtime_dont_use_autosuspend().
>
> Add pm_runtime_dont_use_autosuspend() to undo the autosuspend setting
> and pm_runtime_put_noidle() to drop the usage reference on the error
> path.
>
> This issue was found by manual code inspection.
>
> Fixes: 18cdbad40c6c ("clk: imx: clk-imx8qxp-lpcg: add runtime pm support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/clk/imx/clk-imx8qxp-lpcg.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> index 1dae3410ee99..262645bef62d 100644
> --- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
> +++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> @@ -277,8 +277,9 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
>                 if (clk_hws[idx])
>                         imx_clk_lpcg_scu_unregister(clk_hws[idx]);
>         }
> -
> +       pm_runtime_dont_use_autosuspend(&pdev->dev);
>         pm_runtime_disable(&pdev->dev);
> +       pm_runtime_put_noidle(&pdev->dev);

Can you use devm_pm_runtime_set_active_enabled() to fix this problem.

Frank
>
>         return ret;
>  }
> --
> 2.43.0
>
>

