Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B686BE77197
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 02:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q9+2Ha9q0pdtSae+Wq+6rP5M9+hKkE6PLfHVVmrCxsU=; b=paVXdag1O9c4QDyqdXd49XWSj/
	pS+UiQTSMomEEyErlX+CIcjB+4fgCxtIDfZqvZm7futmMlR6UPqFQHs/+ZFbSHXq42fIohE2Zc+ME
	bU7xqWs5R3JNr/TTxLcBSb6po4N9dpnGC5nivjbhWAzSLtDlkrmRMayN7Jwu5/qJyjaDiBzqhvvlg
	I5PTtxeZvn/UzxjLajriVx4YEOAQvZHRGPjXNo970qsQxfnbMYxU2TZ9bX0nrhUba1Ly3Y8TWp9u5
	MKjg4jdfXTnWiXnr1OdfxkXWAGVEhKWp8pRHSIePIgmUJfeh5eW3rdHdZDaIZ2k/qCC+DhQJVG1qZ
	rNkL4D+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUcWg-000000001A7-1z6b;
	Mon, 06 Jan 2025 02:07:30 +0000
Received: from mail-vi1eur05on2060b.outbound.protection.outlook.com ([2a01:111:f403:2613::60b] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUcVR-00000000173-4818;
	Mon, 06 Jan 2025 02:06:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YOz9tlknn7qFDel0qYfVKOrv7oB/EYLqsWU/ltr4Q1j5t9UajpQ53OV2PdnNQcu+Ji9usd2OhTLNYh9L+UIwPsoRjFqCFV8Xdqg8ysrD0OHT8eC0oEzmJ4R2zbXtzhRlAUBda8la1F1Trd+LQVfolggy76bIW+G3TYMlSqa0DzfDanEfEsAoeRRoeHBzPM1Kc2GURCVZDxm70aM1ok+ITWfBAga2d9nEixYdrVH3zheZMizJPHTyQ9cq3Dw7wdnBeef2LAhTbh+Vi5WHNWeBAwIlY9+Jc4tALct3p1u/7mpAYScz/UrcspoKBU5aNKgXMtx6t6s+y9bGwutYJoQEHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9+2Ha9q0pdtSae+Wq+6rP5M9+hKkE6PLfHVVmrCxsU=;
 b=D9VOi9G+cwdV/hZbuWg5NC64XOSdtBrfx+B+HE/2kITCd9/CfgGid9UkAlP0Ca5o/AO3F25NbVzUqsnEoqW+sfiJfIA2LW0SuXpqhvprZ51M884WGNwA0WTUNYhPKAkvlcY7CgSvs9BwavJRWfuwAZltOr6yIO5YGI0FWEp4su6Z7WHSFlTEwblqKjEct/zZLm/VH4cL0AFZCs1Wahb+/+G0dn5INaRqmdN5aHZLLpvdSXgZIywGOtTRRi6AfjymjG9mNHD2MxQtuB3LbkYWJz7ZXAPkIcOj1l0WA/nkj/WK4e/9sPRFY3rZhjGfl2wMmnRbpOZ1eTCgAKmXVMnUmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9+2Ha9q0pdtSae+Wq+6rP5M9+hKkE6PLfHVVmrCxsU=;
 b=DSxhMD4tRYpwqiBQ2u6sT2b6H4nZR7IC4a0uSJhoLlrvvgDC3SnlJgtzpZNUWiutKtxcNi0bgFU4/dSVgk7pgcSgo1pNMfXrvg5MgyqBUCw4cfspCm87zDSBcq5CK0zlwaqMcPRf6cMu0Z4l6lMueir6cYDweSgQAaWvKqAjkdGC0c/009kARqD3WXjUyWIwWyddxTsmDRtA5nTcyXtRFd4rlMp8Efc9OslyY0ZLffQMfuGDF3/0+MesGoFx0vFisj+IOhHHQNEen+a+Rg1s7xU+coc2ngpTuJRKMHXRBo7OYI9iLqyYQT/qUchx+q3iOgDhFQMUULfVGq6kElueuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA1PR04MB10399.eurprd04.prod.outlook.com (2603:10a6:102:452::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 02:06:00 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 02:06:00 +0000
Date: Mon, 6 Jan 2025 10:03:03 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, jun.li@nxp.com,
	alexander.stein@ew.tq-group.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v11 1/3] phy: fsl-imx8mq-usb: add tca function driver for
 imx95
Message-ID: <20250106020303.xrpo2pfv4knqszx7@hippo>
References: <20241204050907.1081781-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204050907.1081781-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: SI2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:196::15) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PA1PR04MB10399:EE_
X-MS-Office365-Filtering-Correlation-Id: ba2f39be-4b0f-464b-005c-08dd2df6aa8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+b8YUkAnJnXplZ0slhLxBuK769wMdUFoTrMVcBQXX4mf+D4TBy8MW7ATVCL3?=
 =?us-ascii?Q?ooW7i0VdrlqGadcxFXSVBySGkL3MLBBO9/NoWLTUMET2Sx4yKkMYCEV/ET31?=
 =?us-ascii?Q?ZP/Q9wCdxUrEjfgsjsgj2MhqUT71albP8cILVDL8rMiaEcIuTurYszOZIsS9?=
 =?us-ascii?Q?5BwJOXxxc6va24yTvonB0TkvaYTnEzD2BompgPcQaRD3cPGKTFPoC42+5wKa?=
 =?us-ascii?Q?WhWhvO0V28WSyblC1QYqK8uzsKk5lyjyDQ1AeU0FAbl7UWV52XumBaOwzUQQ?=
 =?us-ascii?Q?9d/X7bR9WvH4V96EX+f6OtSbDTz4gctqw5yILGrETqrxrnfU3vt/x0wwMw24?=
 =?us-ascii?Q?sZT7GaUSsjuznfM6tTuHWOL5yeYsS0QuBYjh0vVmA2wf11sUFbS6al9kMt3S?=
 =?us-ascii?Q?h8N9W1yd3zMl00Ky1FBHsSJqCkq95FiZsRXbHjUWjTsxRQe9vWHvbY95Hsh6?=
 =?us-ascii?Q?EcwM4wynGtS4EA5fpKK3VA7y/68vH9Xeef1eTojdZBA9r0S4Pu2Ywtlem+07?=
 =?us-ascii?Q?KCNutnpWro/S9mI3XTTdlej9E0lTh7KRsJekHd0liTEvkQGwlz31axUBCo0v?=
 =?us-ascii?Q?dvWZlZYtZOo3/NaOemU48tXHljKYma4uqH0behOQ+eLy54ECXi4nAjtKsgBO?=
 =?us-ascii?Q?lJBq3LAI4wQOeZdxxVLaJZElyBwPPMGYgu4ZE80gt09Nv+6smXR7AUobVpCI?=
 =?us-ascii?Q?A0VG80jN6Mx7SUkgyo5DHZYNRi0DPc8WFW7bUDH/EtiTAhF+IlLn/Bq7dEQV?=
 =?us-ascii?Q?LKb4NNThfPYgMyuP6t3QOgCcF3B0jdjG+u6/PrTnNLWWiiVpuP+UdhiyS+0F?=
 =?us-ascii?Q?qctTna/b6xqYopZCOn+WwJ+nfNePYs4hP/8+JYPDckZpASSKP4tvhoiPx+sA?=
 =?us-ascii?Q?eeGyjFgbkeNNYV5S4tvt2mTY6VVlZqS08UhJiVTNzmTVkzbOX3qOd9jZYzYr?=
 =?us-ascii?Q?Rt64tkVLn55/BwhPrzLvbu21/pAOJc56aG07g6skussiLgmIQUMnS/mS7bew?=
 =?us-ascii?Q?6VSoKHw+kfLqWAh8/oCO9u0AOYkPRjzCDAtgMqYqc4ON/b2nyJq4NLi+YosC?=
 =?us-ascii?Q?MpHRKW+sJkKRIPIsA44bAGI5KYwwoNQ3kqQiYPcjHrIvqkUBuANcD4Tm4Gll?=
 =?us-ascii?Q?LLhmTtUyCSsUMb6KksXcmR801l5yZ0hS7f5H2ASx1WbPusKViLh+Eunc3afF?=
 =?us-ascii?Q?lj5cGbmHoXwT31givbA+bD3BWKpt4Z/nDILICo7bhOs9shx4uTRe8kEeblav?=
 =?us-ascii?Q?PFWM0T/XUgf6PIi8OpV9/3jeezDUBs4USZrvKek0GxqMMRpu3kmi008dNRjG?=
 =?us-ascii?Q?IswltSYucWOPyKvFnxSmWzR7A0TZK+usjR6GUHZ+DIRZ7cRpt1yVm5MA9iQi?=
 =?us-ascii?Q?njaulIFgWK/ckXlkr4evAPwrH7DJp9a0Py09BMfuSzZ5qKMEngDhsMYCNcrO?=
 =?us-ascii?Q?L1obygS66UDQCKPmhaUjz3b0MWa4IbXcpbi+aPXxrXmE2VnRKVajTw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?457qfCo6Ry9qOCESVgWNtnV6nFLyzcwZtwVb6ptbggV73YLJNXTuigXz65pC?=
 =?us-ascii?Q?StDxf3WBepsv27xv+WJaHONbYOdKxleDI+eOWDAu93rSmB4ifTcoBFWGDZKH?=
 =?us-ascii?Q?QYrejkBf3w2PyH1LJFKcvTqIGoWO73ZAgkXjvIepOCr0L9V8h4mzeFnuhI+9?=
 =?us-ascii?Q?4VXXFSrl9FU707DLSNZclB3TSj8zWsyGnXcsk/JDKwmdjEzQQ7g0KIbPMXx1?=
 =?us-ascii?Q?jQmN3lLvYkgbHbnZB5D1c7muxbcXIznfLbqtzVhHkdHrDImQq05WcfKjA8L9?=
 =?us-ascii?Q?I3DhCjVPynl7iFodPjNjJd66tRCGamM5nXn1l4brxbt2hRgsauza4hBF8YkB?=
 =?us-ascii?Q?/1KEhIiCNwu4RRpegiTNIh7q0peq6e7f4vdtOv1Q6Yj25uIOHwkg0pb+hlkl?=
 =?us-ascii?Q?hCqA1Wd8PdJEp8kh8aX4tNWKiEiZLZeCIUUZbGNFD+4K8m8todH+A50hmG2T?=
 =?us-ascii?Q?3bctzPvOTNDK8ES8RRqhkmhmKEjUv9vhEj58P+dsgP+Q2/ZR+D9UTLAj34kO?=
 =?us-ascii?Q?gvNtLl80de7r0Jnt14lI2DkPbkcuoa6I9rLFXUuiAXSoX1SqdFpe6DNO/a26?=
 =?us-ascii?Q?b1yk7D8yT4hYU0WhoSp2N8bufVtaTMhZF3zQCwwyC/Xqj+5k+5UKEajMnXuK?=
 =?us-ascii?Q?y57JVZ6Ns/oDXEydREij66SEGbOxNHL5K0UKCO/PlXiI0xkV/y0WrzGoSpoy?=
 =?us-ascii?Q?/PA2lWV0u1T5lvenvV25iSUsKuie03NQqwlZUEx/4UWANLnsQ8IrLhJacQ2j?=
 =?us-ascii?Q?h3GwIvT2OxfXUDbmDtqdbfZ+lVQ5b0bnzEGTKW6BT0SbrPjfRUkla7E/AKql?=
 =?us-ascii?Q?lpWpB87iqHiHPXzcW4gGTBG4gXnP1jzPCOEGuV6mgP2qPkRhaes45NnhbpYO?=
 =?us-ascii?Q?44SPos6bTS5U4P3Rq7u/q5ro0LxiFrxiJIQ1XDdiO5f+HFjCGy9fY17ZDhCW?=
 =?us-ascii?Q?GDXFWJjZLbVQO6Mk0dXuB+Zntkff6CQIjHLWHS6QZxgUVzUklIhZiTDBEToI?=
 =?us-ascii?Q?kX0lg4A+IQCuvDzCRnvG7AutH5qQzQKwMJfTZb2IaR2S1jpoFEnVlO8xRT/o?=
 =?us-ascii?Q?oqLEFDYkY+SiFqLTso0JuhHJakGR1WHSNkvzVPii8B/EgTKL9FVuHmPy0106?=
 =?us-ascii?Q?CnSGX/d7hyU2LCaDcsnp2uaX1KDIb20aYJVNki2PgwTQwZjARBWxgxYskRzl?=
 =?us-ascii?Q?xiQ64EwiPGlV+cFxHwzW+o8qi199HHY4g0VAZ3i+0JIbHoGnKjuIZJ0bRIwE?=
 =?us-ascii?Q?5jNEBvNw+XwpHsYtXx2HzP5z129qBstn8QYikcPqcZ2ABGI7vnIp7K33u2IO?=
 =?us-ascii?Q?XYLoiZtjzrWPJoXKJprR3OD0rb6wt8hL2+1cEuWRENvXiXcUqQD+J5Zdc356?=
 =?us-ascii?Q?vVuEwoZIQ1pOiEiMnIC8TK2hBiAjeZP8m0fuzaqwCtwLL47f9zLNSw81sr+t?=
 =?us-ascii?Q?xAHkGQvekKHbOKEUjhY5veeBdK7rMBJBBEuQr1nU2X8/YeLD1/RWlrGBmIuD?=
 =?us-ascii?Q?CwOHp9MA/4EDFgTnZRrbae4bwKhgSNb3aYs0NMUDUj3S1l++eYN+C6+Wnuep?=
 =?us-ascii?Q?7vJz9AoaEmSHbnfqWv8jYTjmGXWNLSANRLoOyJvs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba2f39be-4b0f-464b-005c-08dd2df6aa8e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 02:06:00.6625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yZbALJ+gTeq+TVG5ohmhQSJGP9kJ2AEKnlQib96NA7Bl0f8477c3lkEc8gncgB7Gk2oBhENS34RqvDPtZohlXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10399
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_180614_200302_6CAD2027 
X-CRM114-Status: GOOD (  31.85  )
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

Hi,

On Wed, Dec 04, 2024 at 01:09:05PM +0800, Xu Yang wrote:
> The i.MX95 USB3 phy has a Type-C Assist block (TCA). This block consists
> two functional blocks (XBar assist and VBus assist) and one system
> access interface using APB.
> 
> The primary functionality of XBar assist is:
>  - switching lane for flip
>  - moving unused lanes into lower power states.
> 
> This info can be get from:
> i.MX95 RM Chapter 163.3.8 Type-C assist (TCA) block.
> 
> This will add support for TCA block to achieve lane switching and tca
> lower power functionality.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> Reviewed-by: Jun Li <jun.li@nxp.com>
> 
> ---
> Changes in v2:
>  - return the value of imx95_usb_phy_get_tca()
> Changes in v3:
>  - no changes
> Changes in v4:
>  - remove compatible check for imx95
>  - check whether tca register region exist or not, yes means has tca,
>    otherwise skip tca setup
> Changes in v5:
>  - no changes
> Changes in v6:
>  - no changes
> Changes in v7:
>  - fix sparse warnings in imx95_usb_phy_get_tca()
> Changes in v8:
>  - #define TCA_INFO 0xFC -> 0xfc
> Changes in v9:
>  - no changes
> Changes in v10:
>  - no changes
> Changes in v11:
>  - remove some unnecessary readl() as suggested by Amit Singh Tomar
> ---
>  drivers/phy/freescale/Kconfig              |   1 +
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 240 +++++++++++++++++++++
>  2 files changed, 241 insertions(+)
> 
> diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
> index dcd9acff6d01..81f53564ee15 100644
> --- a/drivers/phy/freescale/Kconfig
> +++ b/drivers/phy/freescale/Kconfig
> @@ -5,6 +5,7 @@ if (ARCH_MXC && ARM64) || COMPILE_TEST
>  config PHY_FSL_IMX8MQ_USB
>  	tristate "Freescale i.MX8M USB3 PHY"
>  	depends on OF && HAS_IOMEM
> +	depends on TYPEC || TYPEC=n
>  	select GENERIC_PHY
>  	default ARCH_MXC && ARM64
>  
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index adc6394626ce..a974ef94de9a 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -10,6 +10,7 @@
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/usb/typec_mux.h>
>  
>  #define PHY_CTRL0			0x0
>  #define PHY_CTRL0_REF_SSP_EN		BIT(2)
> @@ -50,11 +51,66 @@
>  
>  #define PHY_TUNE_DEFAULT		0xffffffff
>  
> +#define TCA_CLK_RST			0x00
> +#define TCA_CLK_RST_SW			BIT(9)
> +#define TCA_CLK_RST_REF_CLK_EN		BIT(1)
> +#define TCA_CLK_RST_SUSPEND_CLK_EN	BIT(0)
> +
> +#define TCA_INTR_EN			0x04
> +#define TCA_INTR_STS			0x08
> +
> +#define TCA_GCFG			0x10
> +#define TCA_GCFG_ROLE_HSTDEV		BIT(4)
> +#define TCA_GCFG_OP_MODE		GENMASK(1, 0)
> +#define TCA_GCFG_OP_MODE_SYSMODE	0
> +#define TCA_GCFG_OP_MODE_SYNCMODE	1
> +
> +#define TCA_TCPC			0x14
> +#define TCA_TCPC_VALID			BIT(4)
> +#define TCA_TCPC_LOW_POWER_EN		BIT(3)
> +#define TCA_TCPC_ORIENTATION_NORMAL	BIT(2)
> +#define TCA_TCPC_MUX_CONTRL		GENMASK(1, 0)
> +#define TCA_TCPC_MUX_CONTRL_NO_CONN	0
> +#define TCA_TCPC_MUX_CONTRL_USB_CONN	1
> +
> +#define TCA_SYSMODE_CFG			0x18
> +#define TCA_SYSMODE_TCPC_DISABLE	BIT(3)
> +#define TCA_SYSMODE_TCPC_FLIP		BIT(2)
> +
> +#define TCA_CTRLSYNCMODE_CFG0		0x20
> +#define TCA_CTRLSYNCMODE_CFG1           0x20
> +
> +#define TCA_PSTATE			0x30
> +#define TCA_PSTATE_CM_STS		BIT(4)
> +#define TCA_PSTATE_TX_STS		BIT(3)
> +#define TCA_PSTATE_RX_PLL_STS		BIT(2)
> +#define TCA_PSTATE_PIPE0_POWER_DOWN	GENMASK(1, 0)
> +
> +#define TCA_GEN_STATUS			0x34
> +#define TCA_GEN_DEV_POR			BIT(12)
> +#define TCA_GEN_REF_CLK_SEL		BIT(8)
> +#define TCA_GEN_TYPEC_FLIP_INVERT	BIT(4)
> +#define TCA_GEN_PHY_TYPEC_DISABLE	BIT(3)
> +#define TCA_GEN_PHY_TYPEC_FLIP		BIT(2)
> +
> +#define TCA_VBUS_CTRL			0x40
> +#define TCA_VBUS_STATUS			0x44
> +
> +#define TCA_INFO			0xfc
> +
> +struct tca_blk {
> +	struct typec_switch_dev *sw;
> +	void __iomem *base;
> +	struct mutex mutex;
> +	enum typec_orientation orientation;
> +};
> +
>  struct imx8mq_usb_phy {
>  	struct phy *phy;
>  	struct clk *clk;
>  	void __iomem *base;
>  	struct regulator *vbus;
> +	struct tca_blk *tca;
>  	u32 pcs_tx_swing_full;
>  	u32 pcs_tx_deemph_3p5db;
>  	u32 tx_vref_tune;
> @@ -64,6 +120,172 @@ struct imx8mq_usb_phy {
>  	u32 comp_dis_tune;
>  };
>  
> +
> +static void tca_blk_orientation_set(struct tca_blk *tca,
> +				enum typec_orientation orientation);
> +
> +#ifdef CONFIG_TYPEC
> +
> +static int tca_blk_typec_switch_set(struct typec_switch_dev *sw,
> +				enum typec_orientation orientation)
> +{
> +	struct imx8mq_usb_phy *imx_phy = typec_switch_get_drvdata(sw);
> +	struct tca_blk *tca = imx_phy->tca;
> +	int ret;
> +
> +	if (tca->orientation == orientation)
> +		return 0;
> +
> +	ret = clk_prepare_enable(imx_phy->clk);
> +	if (ret)
> +		return ret;
> +
> +	tca_blk_orientation_set(tca, orientation);
> +	clk_disable_unprepare(imx_phy->clk);
> +
> +	return 0;
> +}
> +
> +static struct typec_switch_dev *tca_blk_get_typec_switch(struct platform_device *pdev,
> +					struct imx8mq_usb_phy *imx_phy)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct typec_switch_dev *sw;
> +	struct typec_switch_desc sw_desc = { };
> +
> +	sw_desc.drvdata = imx_phy;
> +	sw_desc.fwnode = dev->fwnode;
> +	sw_desc.set = tca_blk_typec_switch_set;
> +	sw_desc.name = NULL;
> +
> +	sw = typec_switch_register(dev, &sw_desc);
> +	if (IS_ERR(sw)) {
> +		dev_err(dev, "Error register tca orientation switch: %ld",
> +				PTR_ERR(sw));
> +		return NULL;
> +	}
> +
> +	return sw;
> +}
> +
> +static void tca_blk_put_typec_switch(struct typec_switch_dev *sw)
> +{
> +	typec_switch_unregister(sw);
> +}
> +
> +#else
> +
> +static struct typec_switch_dev *tca_blk_get_typec_switch(struct platform_device *pdev,
> +			struct imx8mq_usb_phy *imx_phy)
> +{
> +	return NULL;
> +}
> +
> +static void tca_blk_put_typec_switch(struct typec_switch_dev *sw) {}
> +
> +#endif /* CONFIG_TYPEC */
> +
> +static void tca_blk_orientation_set(struct tca_blk *tca,
> +				enum typec_orientation orientation)
> +{
> +	u32 val;
> +
> +	mutex_lock(&tca->mutex);
> +
> +	if (orientation == TYPEC_ORIENTATION_NONE) {
> +		/*
> +		 * use Controller Synced Mode for TCA low power enable and
> +		 * put PHY to USB safe state.
> +		 */
> +		val = FIELD_PREP(TCA_GCFG_OP_MODE, TCA_GCFG_OP_MODE_SYNCMODE);
> +		writel(val, tca->base + TCA_GCFG);
> +
> +		val = TCA_TCPC_VALID | TCA_TCPC_LOW_POWER_EN;
> +		writel(val, tca->base + TCA_TCPC);
> +
> +		goto out;
> +	}
> +
> +	/* use System Configuration Mode for TCA mux control. */
> +	val = FIELD_PREP(TCA_GCFG_OP_MODE, TCA_GCFG_OP_MODE_SYSMODE);
> +	writel(val, tca->base + TCA_GCFG);
> +
> +	/* Disable TCA module */
> +	val = readl(tca->base + TCA_SYSMODE_CFG);
> +	val |= TCA_SYSMODE_TCPC_DISABLE;
> +	writel(val, tca->base + TCA_SYSMODE_CFG);
> +
> +	if (orientation == TYPEC_ORIENTATION_REVERSE)
> +		val |= TCA_SYSMODE_TCPC_FLIP;
> +	else if (orientation == TYPEC_ORIENTATION_NORMAL)
> +		val &= ~TCA_SYSMODE_TCPC_FLIP;
> +
> +	writel(val, tca->base + TCA_SYSMODE_CFG);
> +
> +	/* Enable TCA module */
> +	val &= ~TCA_SYSMODE_TCPC_DISABLE;
> +	writel(val, tca->base + TCA_SYSMODE_CFG);
> +
> +out:
> +	tca->orientation = orientation;
> +	mutex_unlock(&tca->mutex);
> +}
> +
> +static void tca_blk_init(struct tca_blk *tca)
> +{
> +	u32 val;
> +
> +	/* reset XBar block */
> +	val = readl(tca->base + TCA_CLK_RST);
> +	val &= ~TCA_CLK_RST_SW;
> +	writel(val, tca->base + TCA_CLK_RST);
> +
> +	udelay(100);
> +
> +	/* clear reset */
> +	val |= TCA_CLK_RST_SW;
> +	writel(val, tca->base + TCA_CLK_RST);
> +
> +	tca_blk_orientation_set(tca, tca->orientation);
> +}
> +
> +static struct tca_blk *imx95_usb_phy_get_tca(struct platform_device *pdev,
> +				struct imx8mq_usb_phy *imx_phy)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	struct tca_blk *tca;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	if (!res)
> +		return NULL;
> +
> +	tca = devm_kzalloc(dev, sizeof(*tca), GFP_KERNEL);
> +	if (!tca)
> +		return ERR_PTR(-ENOMEM);
> +
> +	tca->base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(tca->base))
> +		return ERR_CAST(tca->base);
> +
> +	mutex_init(&tca->mutex);
> +
> +	tca->orientation = TYPEC_ORIENTATION_NORMAL;
> +	tca->sw = tca_blk_get_typec_switch(pdev, imx_phy);
> +
> +	return tca;
> +}
> +
> +static void imx95_usb_phy_put_tca(struct imx8mq_usb_phy *imx_phy)
> +{
> +	struct tca_blk *tca = imx_phy->tca;
> +
> +	if (!tca)
> +		return;
> +
> +	tca_blk_put_typec_switch(tca->sw);
> +}
> +
>  static u32 phy_tx_vref_tune_from_property(u32 percent)
>  {
>  	percent = clamp(percent, 94U, 124U);
> @@ -315,6 +537,9 @@ static int imx8mp_usb_phy_init(struct phy *phy)
>  
>  	imx8m_phy_tune(imx_phy);
>  
> +	if (imx_phy->tca)
> +		tca_blk_init(imx_phy->tca);
> +
>  	return 0;
>  }
>  
> @@ -359,6 +584,8 @@ static const struct of_device_id imx8mq_usb_phy_of_match[] = {
>  	 .data = &imx8mq_usb_phy_ops,},
>  	{.compatible = "fsl,imx8mp-usb-phy",
>  	 .data = &imx8mp_usb_phy_ops,},
> +	{.compatible = "fsl,imx95-usb-phy",
> +	 .data = &imx8mp_usb_phy_ops,},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
> @@ -398,6 +625,11 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  
>  	phy_set_drvdata(imx_phy->phy, imx_phy);
>  
> +	imx_phy->tca = imx95_usb_phy_get_tca(pdev, imx_phy);
> +	if (IS_ERR(imx_phy->tca))
> +		return dev_err_probe(dev, PTR_ERR(imx_phy->tca),
> +					"failed to get tca\n");
> +
>  	imx8m_get_phy_tuning_data(imx_phy);
>  
>  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> @@ -405,8 +637,16 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  	return PTR_ERR_OR_ZERO(phy_provider);
>  }
>  
> +static void imx8mq_usb_phy_remove(struct platform_device *pdev)
> +{
> +	struct imx8mq_usb_phy *imx_phy = platform_get_drvdata(pdev);
> +
> +	imx95_usb_phy_put_tca(imx_phy);
> +}
> +
>  static struct platform_driver imx8mq_usb_phy_driver = {
>  	.probe	= imx8mq_usb_phy_probe,
> +	.remove = imx8mq_usb_phy_remove,
>  	.driver = {
>  		.name	= "imx8mq-usb-phy",
>  		.of_match_table	= imx8mq_usb_phy_of_match,
> -- 
> 2.34.1
> 

Happy New Year!
And a gentle ping.

