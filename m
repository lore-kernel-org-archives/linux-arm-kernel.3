Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3754BC369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 16:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ne2fXTvDvNP2Ot3uN+Pirpn3NxJl1d4Zq2XUsoVNJD0=; b=XykHx1Gvhoo3EhM7JPNIzPl27q
	+457RWFVEi9/9lK62bTsctkT7Req5htYnJPOXqqdlJPDCJSTgsU4+8kLAlFifstGUhHVW8Zzd6ogI
	9uijciXHYzwngYTvnNITimDeI7uTzKBT0anM+mf+dKyqB2z/VW1tkHsuICDLilgfjvaoVp0o9g+ID
	8aeZbUWlJbQh6HsLHH0wpfIo48s6YEzMvU0UBhlaXEjXPhuzmNnQfhrxLJI7JiIOR5Rr5b5THJh9S
	FI3kXn9yJdsE9L4TIHTQL1Kp53+exymlf9lJp6zXju7KwlOA/6+MBlHBPLjVs3hyoAl/tI9D5RDrr
	7+HCV/AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55EC-0000000AB8f-2pbj;
	Wed, 16 Apr 2025 16:03:08 +0000
Received: from mail-am7eur03on2060f.outbound.protection.outlook.com ([2a01:111:f403:260e::60f] helo=EUR03-AM7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u53xp-00000009vyp-3TcZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 14:42:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YEPfCVYAZuTkAzSuD19G16FH4KnsHGjjGZ99g48gTCKiIWFUZUEEgXyFkOjjJE6w2ZmbMnyowrUtafxAqZRyuX6NlimHxCOhtuOjD5AUkm9x8dlHdMVOak8LcldpgLCOTBDPgqirwv0TKK69k3PW5FwBbutovPeNITHnN02qYlO/rwK4NTf3+7aNq0xE76sWNazAhpcBOe42jQEc+7k3UZ/htkkU1puUpqqOGy9lfEEdqw+VMAzKJa47Sq7Zr2gmKXiW0p9F1ZhNSCUrj32ZV0OKHWQrGO8e+xdmX+j0vrTWbUawg0bJILluquWhxboXFWeYmPeuzYS7/Jrip4ifHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ne2fXTvDvNP2Ot3uN+Pirpn3NxJl1d4Zq2XUsoVNJD0=;
 b=iLvR2/YC7JGunGANW+IVFpU/rfEcOAVqYjV/57lmQUfFjWZptQhkAc8JY74qE7VTMHmLUQzvCVk/u6BEoDc/nl+80ze9OFivl+f7+cUyi/2ubY83Rl+/ogUP/TMhChQeQEgbwmSDXJ/wCXEhRh2Hc4OVKNhj5ofDdqIZw0tqKtjuobu4XPoXdqflJaFzElKtppraoTgqjv9uG0Hh0pBoYIpC3pRJfMXG3faZUVXNh3PTCAdL535mqBv4DRCD74wgpu3U0cpArM+Ge+tvKKUCyGKh41owckWrDwgu1SxumjDem/BIp9iYc+G5CplY77eoLmEJSUO8PYEDyyNRlS+HSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ne2fXTvDvNP2Ot3uN+Pirpn3NxJl1d4Zq2XUsoVNJD0=;
 b=oXDERyIf2/gwjN/cwAxLVind4u2OZuhH8oRHm9Wr3Ys0beNG7nZPRYPfgPOLUH7J9IM//DNEIxtfHvR1s0p2QgHgmGTevMSzFRyrsbwiseFH1ZdhJOX/gOTRGge6MlpkBJG+Z3o0Oibf6goghrdMTshd813eiAW6nWgHJHn8Sq5IXL4Yc/jLI3IcFdMii9AfI4Wl9KOI1L2yH73t2EjWYYWnjH+Wxlroi/WbdzHDujetd4/kiYf/nyx2lS77DGwnh2Eb0yh11RzF2g7lMlPMlQ5SbAVRWESGYprNNw6Euv/eSjeZPyvJbjL5LbcsXE5RLsu4NraOZNIOcEO1ltq+/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10294.eurprd04.prod.outlook.com (2603:10a6:102:44d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Wed, 16 Apr
 2025 14:42:05 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Wed, 16 Apr 2025
 14:42:05 +0000
Date: Wed, 16 Apr 2025 10:41:58 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 04/10] arm64: dts: imx8mm-beacon: Set SAI5 MCLK
 direction to output for HDMI audio
Message-ID: <Z//Btmb7TytV1xLL@lizhi-Precision-Tower-5810>
References: <20250416010141.1785841-1-aford173@gmail.com>
 <20250416010141.1785841-4-aford173@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416010141.1785841-4-aford173@gmail.com>
X-ClientProxiedBy: PH7P223CA0027.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10294:EE_
X-MS-Office365-Filtering-Correlation-Id: a9048958-4531-4e8a-3ae2-08dd7cf4db9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|52116014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y+J3xhmIJAzmMbMPETwQag/cJZz6AqYmUKZYlHYTIv780m5ZuC1WIUaMNshJ?=
 =?us-ascii?Q?5fi3i/22oFhSqrTMfR03or3pywCGVP/FeVdUM3+M8NKUtKj+EAivOHBzPi5H?=
 =?us-ascii?Q?jbCpyzbLbrcf+CN6grBTU1GMarRjUtFIOWJFZGcCCFSdPGL4CfRo8QFyqg3+?=
 =?us-ascii?Q?Omy+ZjNiXp2uQJwxtebhZcVt7wOP6cnITlmGJ35Z1qwQtMZOlJWEIagzx1Ai?=
 =?us-ascii?Q?moLF7jGCsrDoxSzffqV+uSxhIQwWcujaLVGQxpcD5/zaFTll0qTdNbtAZtm9?=
 =?us-ascii?Q?dgOKNangB2t7Sm1LR8o1tpYK8u6mfPZLl6uv68xTKauTY2UZgaDXXzU8BVBw?=
 =?us-ascii?Q?fX2x7mSKgceC988fX9Lwr00WXRqx67AHV+nY3r0yONJCIoqZVPZ+qz/ns782?=
 =?us-ascii?Q?MDFDgzxYSJsSvMIBc650MdM3XycCtnR0pcN4jgrvPClse4OSipgLthAvMzfI?=
 =?us-ascii?Q?V0nrwSRCNxW3mmLEw/IgK4YUrcfQ5AL9DA14ledpMq9zb6xF+EgKc7ac/sAf?=
 =?us-ascii?Q?3zQhlAaCiwLO2UhnZ1prIhsF/o/AeyuP0E7STKcKC12gXujWg5AwTvI0/rT6?=
 =?us-ascii?Q?MsDD7pNU4E2TjKsZ8ikhHYrCykVJuAQBkSDfckO0YmtVb5nP2AxFkgYRrWxS?=
 =?us-ascii?Q?EzQWeRsYWIBzx8By3C9k9oPBjs6axy1teNCi/0k6yaqI64x7obuxZczhoucA?=
 =?us-ascii?Q?Ld2SkBpaDSoSCLsd3ln6rjcrC8pfkspmq9wdAzbP2J+WQPJS8cOffbMcWHgR?=
 =?us-ascii?Q?KPDgjilENQ70PjE/z+SXB3Ts2rV8//KlwMYGwvsuMAvN521DrA27znbd+eVI?=
 =?us-ascii?Q?VKROvNs3pO5R6YLVfR0gNI+hvsqjur4NALPlvVjvqBXhN/QNrvCm81bX6GLT?=
 =?us-ascii?Q?2aasFUtq1BVAi90GLfkReDSlQSxM/11CpPvdMf10I9pNunYZpUmzOtcWgy1w?=
 =?us-ascii?Q?NIGFkfpsOa+WaVBOgff7FEhbcsOn4FOv2GFU7bkqlUx5Ory8O5zj33emex6L?=
 =?us-ascii?Q?NlqELmcXUbMaoxNrwFrC37m1wPjXq/LaLb4HRmsWKs88JP1hu0cJb+cjA12j?=
 =?us-ascii?Q?95OMHoj+JhYWnkCQSEQKLvX31ti91AMm4UxgaFp2+hKB+Qu4B1VMDj0U4TdK?=
 =?us-ascii?Q?pCSS+UQihBWKm64T8mXmP/Ef+ajq2cU1vR3tRQ5xjIcwUJZTmxLRBKnj305t?=
 =?us-ascii?Q?sYLmTkSgqBqaXHA9UtIFe1L6OlX2ysQpWHOOr9fx5GO76OvuqOdYtWHjK7Pr?=
 =?us-ascii?Q?zQHhbBOyIwvox2aeIjeNv660XrTTT0Nz254lSs0YiNvKQP62I4csf6XCMvWi?=
 =?us-ascii?Q?aWH5xLHsN8waygybApydASZSrvVDvQl/5+6TVA7K+Hdui7zmxUEZCU904+Ol?=
 =?us-ascii?Q?SNALQilslx3sgq+Pkl/k2SHkcQIzFrTQfV9JRfiZ4DGA1JLC/f8A+68Bnuim?=
 =?us-ascii?Q?GJIqrbqSX5sBxz9DTFzJVKGgtkDkwzUsBX/mLsB0fkwERr9vO129bg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?myC6OkxWKKu5Qd44jN1U5yrPFW9jRp2+AksKMA4hNmxwX6nCrocUmUs+nEUg?=
 =?us-ascii?Q?iR7Uo++b9bwVZ9RGWKBannxXMwDnKBUi8DrQgNdGdgAK2xGMybrDGhOwnUvR?=
 =?us-ascii?Q?iFV8OtVKgzJfEKLtlkJqDTIoBCeHQXtkpiWBnCFx7AxLPKX6k+eUi1tHuWYL?=
 =?us-ascii?Q?bDC7s9aCCaRCFKoiJOZJcrCW42FgXHmV5pOB+pKqgGDo54XXoRwVT9LQf58F?=
 =?us-ascii?Q?ZiegVmH8NZwZwtp1HuRaM+iLYNl6CHykps6CHiPqU+IT8NOQaXpDWplPjK7l?=
 =?us-ascii?Q?T6iSD5YIj0Hl5b9PcQOuDYIjU076k/gIvBhWJGMcXFatna3bU31PVP/emvuR?=
 =?us-ascii?Q?N7uhEHe+2jYnxfL9ktj1Jc5r5rA6PWn4Nf+TkZKbjw16m2U/p9977bXR/K8V?=
 =?us-ascii?Q?1ra9TrpUm8vMuMQJgsqc1Gs3UhmpSx6YhVTczWitZqmwj+YTtXSfK53Lt+cY?=
 =?us-ascii?Q?oJVgKQl6T3OceOAFZHhHl5enoS/W6wp/Fbnmfuv8RGUHhzlo/ttGo7P5RuI4?=
 =?us-ascii?Q?KqvX1b056OXI0sm/qx3GDe9Kn16ll9pQpW7RsQFtLtdVBDlIhu80q/PBfgZI?=
 =?us-ascii?Q?2sOu9B5zFabM6CINRLqKJDSUyDs0VR15pQ+p3d8TxJiPkY4oAqspTzvrKtdY?=
 =?us-ascii?Q?I+rCLl4QZIpoRoFkkVwDRqRWWP/hP36JzgYhF9rnMy8aTZvyMA2vEDc8tOvl?=
 =?us-ascii?Q?Txqhl+jJjuMyX5F5L6PvJg0xybdq9rzM5Q7zH+H0IkG916XIdSaPpnAJAzNT?=
 =?us-ascii?Q?ZNaJQP1nXgqBXjIoBG+OdUiY6CfWbmFZj0HzO5sgTmBRmBhcsDIzX1f+GzWP?=
 =?us-ascii?Q?aoloEX0oUK6rrHpCcCM0sDiFF/fqFSYmyEsOZLHKLMY93tiyJo3ti6t7jHlK?=
 =?us-ascii?Q?1wa/mEKyDWeFavdt8o2AjpKqbEk9IY4VuqvDfS9vKJxd5/cKQzCwpqqN9/PE?=
 =?us-ascii?Q?pEvQM8OMp9kFFIZuDK+nK/csJXzw4anjq/nfmkzdicKTfhfMti+VU05baM6E?=
 =?us-ascii?Q?C+5EVlEqgJ/oh0P0Dj9lrHtmTsFJIwzIDFTnS9DHjgll61Kg0NulVbXLWvHi?=
 =?us-ascii?Q?WP4EkBMK6XqK2x+EfJl29wwzaJ+iy2er8ZRHUtLwqtt8Hu9p7Euk3o7mXUqr?=
 =?us-ascii?Q?4DTvo7wkTNrAfnoM9X5c/pu5FCNZbqJ1+yclYowknwyd86+bjcyiKkVlbb3t?=
 =?us-ascii?Q?a8rBIDE3v9vvdlX5XzTrJcuDxmBCvEVclz8OsKzj6zibEDD56Cp1eKemYISc?=
 =?us-ascii?Q?aAyJOLbLYUwTUAsBSCjnYgsxQvw+40vVrc8hdap8Y2AUfyEgkiJR4koIFEL1?=
 =?us-ascii?Q?m/9mmVUoV0DhJ1yYtVzm7y4bjhkofgLzc1+F+e89kcxcn193BANayltutkUW?=
 =?us-ascii?Q?OHUYUT1t/uguCTiU43q7UEhs8BJf7gaElxXA30nMJ7HVDSvsxpMfIoRiXVMD?=
 =?us-ascii?Q?8JsPaH/zZACh4fQqiWivNpQWFTaegINCe90p4Tau9yTEvsv2zK4RKYh+impr?=
 =?us-ascii?Q?KU4S0Hg6cM4w7ayhx21DVcvbwXpU6xYAODTr7Ia4MjvfRq6qUetfNH8Jdc1H?=
 =?us-ascii?Q?4ZUGdowoV33XzLzfdA/Tn0LDxFpEUDR8u8sYeXpC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9048958-4531-4e8a-3ae2-08dd7cf4db9f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 14:42:05.6519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v+3q4D1EQDWstq4LRcIX9/G5NYFxFvvtpJiWCFQjbOS66wEHdgMd4bDo0+i7ZtnRSpLmwFcer4MS9/GICb+vZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10294
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_074209_874982_FF4EC8DA 
X-CRM114-Status: GOOD (  17.55  )
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

On Tue, Apr 15, 2025 at 08:01:30PM -0500, Adam Ford wrote:
> The HDMI bridge chip fails to generate an audio source due to the SAI5
> master clock (MCLK) direction not being set to output. This prevents proper
> clocking of the HDMI audio interface.
>
> Add the `fsl,sai-mclk-direction-output` property to the SAI5 node to ensure
> the MCLK is driven by the SoC, resolving the HDMI sound issue.
>
> Fixes: 8ad7d14d99f3 ("arm64: dts: imx8mm-beacon: Add HDMI video with sound")
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> V2:  Change commit message, no active changes.
>
>  arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts b/arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts
> index 97ff1ddd6318..734a75198f06 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts
> @@ -124,6 +124,7 @@ &sai5 {
>  	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
>  	assigned-clock-rates = <24576000>;
>  	#sound-dai-cells = <0>;
> +	fsl,sai-mclk-direction-output;
>  	status = "okay";
>  };
>
> --
> 2.48.1
>

