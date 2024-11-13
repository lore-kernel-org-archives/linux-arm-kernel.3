Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A3AD637B2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 20:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=apZtN+vUaaoZlJzwLtABq38u9DD5rkWfaNI9QQ+bXzM=; b=aoboMcKjwSG2dAQyIia/1yRCQJ
	HKPbNhkH2m6t+Q6FQHH1VwVUe8XBDD4DNVLFeSHXuY09mICtCfl5nXh83MFqpFIQShNau/kF/gYo2
	49123vvMb7heGrp8hTFFspLMLI9CnJ2HdshRopJmBVwcYAPN/qyi7knVb8dNUzE4/StjMtv5v0GlG
	c5hp0CC2yFxvoam6VreTHVHQp+aEfsoTa4hhMrkr3xvI0kaevE6nchBQLAVcZfBk4lrmpRiE0eSo7
	ts/YOIi0mh5CY2W1VDe6giTz65ODwZQr5V92p7FgexPUZ9WQ448MAu1oHB5GSb9PhFostE/uh+RrK
	2oXj/ejw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBJts-00000007xOO-0utg;
	Wed, 13 Nov 2024 20:23:40 +0000
Received: from mail-am6eur05on2061a.outbound.protection.outlook.com ([2a01:111:f403:2612::61a] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBJrn-00000007wqJ-0Mvg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 20:21:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WpXJ9rA0xLcVYdGST25HPfwmY9CVbE8rhBKLWj+rULduVHe23Ndp1PIgW7k+iADGp6w7eqKMSUQFhp14vZo4MyLmOWPitK8UPiqWApN6BzgLPVslqq0R+MiszlBIa2IvDuH08Rw9iTfrRHzOIBd1OT93ilaiBJ5SgmopFXUU1x+u9MGXETDdXO/W+e4+ViZcB1wFqXjI7v4TO/rgzRLtKM94A4vRUVXG7SNlgg8wggAdJ2KksU/8A4wb5sQQQ9LNf3DA8odQO5AsmbTEYXM82XhsfY9yYyqrGkBA4MblKS2rxoidZjKXQdHJmx4SS+9us0GSpsSHUBDI708klbcA7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=apZtN+vUaaoZlJzwLtABq38u9DD5rkWfaNI9QQ+bXzM=;
 b=T65kcyXG/MWMwlRDHsTDeyEGJGGQR1CmB/h8aP0Nvkfn4l3ajrMCKwwza0DN9QvaUPKQBxsZTVZhSlpU1tL62uzb+eRBOethdIdyARBq0Wd6wICl0iJ8B//h6N224zir6kGkcdAYqdkE0H9UWIm5hZUe8jyaLgbc2kRgbb26X+7H700Wdzde4WGnql2JaH+gottfmf0fZqwPoO1UdChXcJ5H25FnHcOmDk+px3WhoAGeZ7CDisyT9VRXFhFnR6O/dVZha4Zh7CxQlOECFrXfLkjOWMuph23NcHf7xTJQCdUsfP9X+gZWXcLyxcR5zgNWBc88/bORnXZhI8VU2jX8Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=apZtN+vUaaoZlJzwLtABq38u9DD5rkWfaNI9QQ+bXzM=;
 b=Ka7yT9dB5d73OMnPHEomajqX0IJvEQz91ok3lQn5lvle0+sFtVZgZDiGbFZ7+EkzXH0ufeOkdv/uATaJni5G/W/uzvNKSZ2IwasV/Wlr1KrftAotfZMnbdDrbEij/0VJvq+Sumo4gwSt1sopo/r49jMkXkRP1i8h0HxuuF137gS0DWX0QBnHjNSlcfSWXwi1AOrualcBfU6B6cC+bc4Af63yK/eUHBWVLWifdwXWn2D2UK14AEouaihwnowuQSex6FsZE32gtyjzvcLkVWeQNWAk0gApzGDEYpUGhzRiU+ccTcoqwK8ntNunxhesVbCXvhf0caLgmokqkNXj9zYhuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8514.eurprd04.prod.outlook.com (2603:10a6:20b:341::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 20:21:25 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8137.027; Wed, 13 Nov 2024
 20:21:25 +0000
Date: Wed, 13 Nov 2024 15:21:17 -0500
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] arm64: dts: imx: add imx95 dts for sof
Message-ID: <ZzUKPehw2G9XcRsb@lizhi-Precision-Tower-5810>
References: <20241113195240.3699-1-laurentiumihalcea111@gmail.com>
 <20241113195240.3699-6-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113195240.3699-6-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: BY5PR16CA0013.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::26) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8514:EE_
X-MS-Office365-Filtering-Correlation-Id: 346ef30c-d984-408c-49c8-08dd0420bf7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cL6Y40y8xGZ5dyoWi5G06fZWhDuAF5sDCiweBiN4xhRTxc9bS4owc9HCkXBT?=
 =?us-ascii?Q?+zppScjrUCeWLmrDGYVZUMATGvStDzWm9Gr8EF9bmtvJ+adDbZjTfzRXdPzQ?=
 =?us-ascii?Q?Qk8TJnnNzCmDVYqNirzaNkrxbMn8uv93a8M5JDEY5X/bWpTCLn4+ECCFJPe5?=
 =?us-ascii?Q?jAJ9wN4haTq34SptHg1+ZtRVW4K99+nRDJ/8qMUotKf3vfsUak/j6Hjg14LB?=
 =?us-ascii?Q?LzADAE1735RhKdOwrea2WS1J7IK+0o1tCTCsBFY6/h8CPyrJUF4EoyxLpQua?=
 =?us-ascii?Q?oUNL6WY8wARkBc8SrFcjo6QPtYTvrXqDkD/Vh5pM1d9PJUafCU73e/w9V8Hn?=
 =?us-ascii?Q?3w54x9PifDDREsYzgF45N5agZZrJxmzVc7oPxuM7EuGApxpL79RPUmXMZPcM?=
 =?us-ascii?Q?9ClVcwRgqW6lQhxQedbmeqU3PkE+hO1U4XqMxSwB8xfl7DqcIfbq6mX+mwH1?=
 =?us-ascii?Q?POzVYjZX2SlrtDWDn4AbyqBYdteRuF82YROXyOzMrs8Ip0f2u/UVshBnQQMP?=
 =?us-ascii?Q?gG2zhvcI+DDHnv0dMScOhf55JLaslIKur2mGW+flbE1lIFLdMlRL1kl2RO6g?=
 =?us-ascii?Q?5Eg6v1SuqLgF4kSrtPE7g3Z+0EIFSxc9z2u1D6/0F2IEqLmazjoo0Unb+ixd?=
 =?us-ascii?Q?T7rQFPMPndUQk98MTfYvt75KlqWxYSh9UIeNTN27RCFC1J3m3nm7m5zvmn4z?=
 =?us-ascii?Q?CFTRtWnNzb/je/YN1l5SEwDyAqD5vcQzfAnBTXM5Nvm1o+ky//xL2C/YZoD+?=
 =?us-ascii?Q?Zl2eAeF0j1OSG2ZTclUW94Ldz6H0SB/Nm7y2vmMtZIEpLo5rC2QSUIguGpgL?=
 =?us-ascii?Q?VEQR4dtVTPsxM1aFEtLoiN0mRtJVo0hDbrux8TkepnlrMrfaDcCQ9rg+rsIJ?=
 =?us-ascii?Q?+TyteceZYvNzzjBshlUg7VlcCRHovfr8V32hIrzUZw2R7jBz7C3c5A9EFTeX?=
 =?us-ascii?Q?XID62wyqv/INmgdfiGrejdoWWQCrEnfPRi+9J7kisDb3WaKIgZKv+/kMaOEe?=
 =?us-ascii?Q?QAm+w5wcaYhjujRd3Gu6ZFd3i3soadpxFwV116048461nKYmJBV2PDBRdxAj?=
 =?us-ascii?Q?gufY4K3JnF/OqN8sbaEfoI5NR8i+900WiYQdOebN9rdmsCLahZkYlWGAkMxp?=
 =?us-ascii?Q?ftdtPIoQWd2ZAIS4tJ/K6bdzoFndYHMnBUP/Ua4oWkuYc6RdUcRR2SqvhNcN?=
 =?us-ascii?Q?3vuelokhGVx+EQ02yHnvrHkikXxcvf19urBWrikAbkUPl4yg1n4w1jwb6jJ0?=
 =?us-ascii?Q?fHWyHx94olL5tH/qbAlvo/s2v9jvQjpxusjRnfy1OiA9O3akJnjNkKWqCkFj?=
 =?us-ascii?Q?l4spQ/GX6SETI+9LF/lAH0nNeWDfOzAiWRhFg9mInTgto5zJsC9/fWvlkDwJ?=
 =?us-ascii?Q?sorkYFg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DacbkimK0CGB422YKpoYvAXQHZ0XqJC5E2fxo3CdNaeGo44rSrofxhzabmvf?=
 =?us-ascii?Q?33g+enNeICMLONv1ts+c0lTnSIQsMMuoboD/DZ9vqLcrjV0650aCXCDfFJEV?=
 =?us-ascii?Q?y85BaLdp6gQsxbhbDdQcymZpCA9QWskQd+f55lJQ3iJee6C/55OFbpIfx6aj?=
 =?us-ascii?Q?iY49jeSXBkhRC/pPpWF149No2ezqq/NeTFM0kdK7d00DE7R5x6QhhRCT9au2?=
 =?us-ascii?Q?0/UrfEJ6UCc0CVhf3sbjOKUQ5FsWIrbzgWZ+mllgMKmPDoH4/HZXWeRiIJN5?=
 =?us-ascii?Q?MuX+eLkdVYvY0nuT0cn3jaywEnNBgDQ+AfHITXKtwLXlJ7T0I6b2BtG9SS7L?=
 =?us-ascii?Q?v04B8M8GoZK+fUxKoInFX4jy0B6j0g28ELnVUkFI0crsf1CDbblR8gbM1yGQ?=
 =?us-ascii?Q?kDLad578S3gE5BqEDfHO1hxFqNP7wYJDrhBsse8ObYdZX1bToa+mgKklIgH6?=
 =?us-ascii?Q?j+mtsWiZOYZFzMePzeo5pNWMEd9J8jkKUt6wStVwNCw/GJcZJkxvn+X77L5f?=
 =?us-ascii?Q?WUj7bR0/uMGRen9wfCc/s9gMW3awQOoos2+DL0KiwGuatIZe4Ol2GRXZ6QEY?=
 =?us-ascii?Q?jq4clf+b9cRE7RZJ5cQrs1Ad42x2QukDMOqqYIXm9bvjFqzEpPizn3sts68r?=
 =?us-ascii?Q?0b+v3bcRkPr3rM8IBux/vDB0Nx0gRfLkuZXZuMNWtwqVJcMravpS/9UQH1PM?=
 =?us-ascii?Q?YDn6imrn8HU0PJ9YhPTrxD/Asa1u80G/1L6L2WBr+t1XQXW9FDv1gqz8e7tZ?=
 =?us-ascii?Q?n45//S4b93F/5AHhRARyOf1HS96PKazE/Zb7Jz0/2tPs7pQH18sifA6y7kxJ?=
 =?us-ascii?Q?imHNsPJqa17CZ3s8QeqS/AvPXBwyN9vbgkNJ6vOz92Y2ncmyCjFhA4rhz7Zq?=
 =?us-ascii?Q?PeXuKJQI1KI0JsBL/5E6RQBVnHSCMQTL574aHFTDnqQhqCy4XkaS/NGLIw/l?=
 =?us-ascii?Q?fLixeWsrH1SWw1FrNe3MjPAHuZP3wsTd8np8UBcTm4w6uoe04ClpPLNtnWCv?=
 =?us-ascii?Q?5CSKpxMy39AMzDky2rxpe6GCJoE9dK6rYRuKc/zAaBpAmqfgh/BhcMuDhDN0?=
 =?us-ascii?Q?U15rB7ZvhkYone+W/TMU0w05MH6Xr4aBghUPZlUUg1f0nonLA6xczsaYKiPp?=
 =?us-ascii?Q?NnheXN5Sz+Ka+xQtd87Ktr6H/jeKOeF5QtLsNmIznc2aX2dyEG68hKfiReyD?=
 =?us-ascii?Q?rgP9WsmeVxWMl8JN/zK+f/Rxg2D1KlCIyHH1jeQFdimfAPsE1iAwoB3iT/WT?=
 =?us-ascii?Q?qDvPyTxbb6cySt8OSbgnOFySqmN/V2T28qF7ZtMH6b5mVSgNlWwUXp+JqeQg?=
 =?us-ascii?Q?I1wm2muRIQT4CIt9IUrWoPJy3SfIkykVrd1nYKA9eYhHxuP2mQcds8WOcsqH?=
 =?us-ascii?Q?ArkUL01lKz9QTIEJd13o5Own2kkgHxe8P5ie1fIE4q3Yfgbkz8LZ/OROcyrn?=
 =?us-ascii?Q?UjlCRU5/UVRqfMZMsjxtSJ6vuSE9h4C1jY8+G8fsGyOJBbtdiywN7YBX3XR+?=
 =?us-ascii?Q?bxN2EXoAI6qaPs+6tr7JuaLwELgJdMO0v25ONUxuQuF1SAAldN9GV3/WLbzE?=
 =?us-ascii?Q?rkNd3lBPleVn6Mwp8sQ=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 346ef30c-d984-408c-49c8-08dd0420bf7f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 20:21:25.5980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EJkLNKon1yEbZy3YZzWGoMwroYaJqslD9YkQiBkWoopcTKQoGWuF0f9frW4Kdn50Y4zZRe7cPl+soGDlHt2QzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8514
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_122131_182265_E4C2A40B 
X-CRM114-Status: GOOD (  19.40  )
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

On Wed, Nov 13, 2024 at 02:52:40PM -0500, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Add imx95 DTS for SOF usage.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |  1 +
>  .../dts/freescale/imx95-19x19-evk-sof.dts     | 74 +++++++++++++++++++

look like it should be dt overlay.

>  2 files changed, 75 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 42e6482a31cb..0a313133d013 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -269,6 +269,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
>
>  imx8mm-kontron-dl-dtbs			:= imx8mm-kontron-bl.dtb imx8mm-kontron-dl.dtbo
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
> new file mode 100644
> index 000000000000..3fa4c252e355
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
> @@ -0,0 +1,74 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2024 NXP
> + */
> +
> +/dts-v1/;
> +
> +#include "imx95-19x19-evk.dts"
> +
> +/ {
> +	reserved-memory {
> +		adma_res: memory@86100000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x0 0x86100000 0x0 0x100000>;
> +			no-map;
> +		};
> +	};
> +
> +	sound-wm8962 {
> +		status = "disabled";
> +	};
> +
> +	sof-sound-wm8962 {
> +		compatible = "audio-graph-card2";
> +		links = <&cpu>;
> +		label = "wm8962-audio";
> +		hp-det-gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_hp>;
> +		widgets =
> +			"Headphone", "Headphones",
> +			"Microphone", "Headset Mic";
> +		routing =
> +			"Headphones", "HPOUTL",
> +			"Headphones", "HPOUTR",
> +			"Headset Mic", "MICBIAS",
> +			"IN3R", "Headset Mic",
> +			"IN1R", "Headset Mic";
> +	};
> +
> +	sof_cpu: cm7-cpu@80000000 {
> +		compatible = "fsl,imx95-cm7-sof";
> +		reg = <0x0 0x80000000 0x0 0x6100000>;
> +		memory-region = <&adma_res>;
> +		mboxes = <&mu7 2 0>, <&mu7 2 1>, <&mu7 3 0>, <&mu7 3 1>;
> +		mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
> +		cpu: port {
> +			cpu_ep: endpoint { remote-endpoint = <&codec_ep>; };
> +		};
> +	};

please sort by node name.

> +};
> +
> +&edma2 {
> +	dma-channel-mask = <0xc0000000>, <0x0>;
> +};

Why need change dma mask here ?

> +
> +&sai3 {
> +	status = "disabled";
> +};
> +
> +&wm8962 {
> +	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
> +			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
> +			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
> +			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
> +			  <&scmi_clk IMX95_CLK_SAI3>;
> +	assigned-clock-parents = <0>, <0>, <0>, <0>, <&scmi_clk IMX95_CLK_AUDIOPLL1>;
> +	assigned-clock-rates = <3932160000>, <3612672000>,
> +			       <393216000>, <361267200>,
> +			       <12288000>;
> +	port {
> +		codec_ep: endpoint { remote-endpoint = <&cpu_ep>; };
> +	};
> +};
> --
> 2.34.1
>

