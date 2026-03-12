Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27175106703C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 14:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8rYUCaTVbhrASmUWxl8M6zHKkkCW0DzqAk+MmAh/AU4=; b=rybrbkNWjFoE+wQ/5sWImcJ+3w
	SqZHuFQIw4SGe1sTOMGrFkvs6QCuwTPzWRG5mYiDBAN+xMMdPJhZZyyaSyWtlCcRbGmc560l6cMZU
	P3kPDdS8eQE0vW3l0ZdoGKS/idijWFLlVB7hn1n5WgLKTrrnhWQwQYgw7isQJsJW1MyTnboxJyl63
	dARQIVAm52Rk8udB9a5e5bVhWxhzLqhYraI7fcRmFipcWMhfMaB5vI9Q8nECbEYLV9/3g76RVEA51
	kztt1J+n2Lz6IklJd1F2qp+nqZUWWrQkZr9ENTIQdejnizL5QhuLoB7gnBHDMh3sk1YDM+x3Lngfi
	jLurXP7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hKr-0000000EFbC-1Xnr;
	Thu, 12 Mar 2026 14:48:25 +0000
Received: from mail-westeuropeazon11011065.outbound.protection.outlook.com ([52.101.70.65] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hKo-0000000EFao-2q1q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 14:48:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VaW7Cx+DHab72DyXvnLNMO7WhRLBr8VKZvBnTc0dDqBHrSXlTMVqv9qd8tFbu4woSKKXSijuBw0CVnC3j9hsBwbB8RZImrGw5brn841v15c8XUMuY8vf2laTxkxFHTSfoLlOJlIWtDIoNDOUz+d38OmKj3626NbvFNZT53VAqcM0p+uNH8nPK5I3QQYYtp57ajFKig/lhbRtlyEaLYnLQbgv/LCSYK0BI7IKok9U8NkgONPRgPdI5JHlJ2qouvARHw5a9378FRRd0sl5NCFycqsa9MPvu+dUEfLGAKBx2cDceA+MQjco9f2Hg+jFIHtbTEf2ItxDclrEDiSaS4/Ztw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rYUCaTVbhrASmUWxl8M6zHKkkCW0DzqAk+MmAh/AU4=;
 b=HzapHKX85GN7o1jZvANwpUObiT9lQf+kIfso57cwetJw2YObyvGtnAd6ktMsAV6aLmabM1ljvXu3P8sgpD63JQG+J8MLv6GE/aErtVC+HPMrOqszkcR0I0hrtBghygOCWbJbu19SN+7fwoGQJysRUIqslDTp51m+dJAaoD27LtYkhFTkOOjRNY58SeQBk39nyuY0AIxv09sHH8SPEjceJ2p9Y18jucmGuKzgWv2gSllhLMnYbwFDM/1he3TEMjO/aUD8/fm6NI+dN+SE+DVFZN7J86An0n06mqPm+0Kl2m2KIW39Au1Ynhjj+1x8kHvpJUQOETMCIKOs84AVZr3l+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rYUCaTVbhrASmUWxl8M6zHKkkCW0DzqAk+MmAh/AU4=;
 b=RH1CwG76bhc/KkY6kvaJf7JeqcTvPbUyX2CFOquNkbF18taOfdMgD5Y5i3d2KpgUJEWMRc3QHDTz2EaKBQM/Am8nDg6w/9B7xUuSce//2K7AZwXCoo5xyVjfP3jIoAMj0oWWANTiO7QzZIFH3/YAsUc2BxgwWVK+yKWYxlQ6hXHTF8WKIXq95srDqDm81n9u1KLeX7R1kGFUS/s2U9vlA2BiAR/i2oDAXdIpyYwhDUnrUELDuxFFw5PiE1keQl+1/x8AyYXF8jQ8E2kPPyB7lJSu7CgbvhfpN7DJECd+QpQykBcUlarjbs0IchRdA4WTMas70vOBRVMo+KgNOwdzWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by OSKPR04MB11461.eurprd04.prod.outlook.com (2603:10a6:e10:97::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Thu, 12 Mar
 2026 14:48:10 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 14:48:16 +0000
Date: Thu, 12 Mar 2026 10:48:09 -0400
From: Frank Li <Frank.li@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/4] dt-bindings: remoteproc: imx-rproc: Support i.MX94
Message-ID: <abLSKVyYP3WPIHHu@lizhi-Precision-Tower-5810>
References: <20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com>
 <20260312-imx943-rproc-v1-2-3e66596592a8@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312-imx943-rproc-v1-2-3e66596592a8@nxp.com>
X-ClientProxiedBy: SA9PR11CA0016.namprd11.prod.outlook.com
 (2603:10b6:806:6e::21) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|OSKPR04MB11461:EE_
X-MS-Office365-Filtering-Correlation-Id: df500a2e-90e7-4467-4a02-08de804664d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|19092799006|1800799024|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: RlsZXPpmJt1Das379BO0n9Ei20sdnYiToHsnlxxSoY7cV7xvFCgYGq04g9/1gsRuCaPh2VbewAKTiILsR75MvDK1psX9TH+xOOyiGHNIAtFyQXZxh4z0/pOALROcyeKXwd3S/W2YZklIp2/9MqvkaUXCdxElNyI6nOSsCTPQwkPHMANiWK+bqsbFFqE+Skz8u+2MugUTnoRuFaCFXjvmM9RjP+76wDX58TUiVesvwRVkSxbTsi5aMf989BbH8uvKueAwm2uXMhXEu5Y6B7EdcDXzkNUEG/L8ucCEhfLSdGNdpAUgWtV/HJ7dQIIFNYuXdYIvyOeLf2VYk5+eSFO0plg+KcekEQtzo0OlS43K79yOrL1SRV3CCQkqI7cylZ4y8G/iJlHmq/usz5f88VQK6BB97w42sA2SNbqEDqtYpESFM/Vd3l8jsh86l5N1YKQNK6Mv4mas3xzraEyBqMSUqT4J0UNCg/cnum/5aNFvUJiAKNQc5Pom/xvU1CUpa96AAyQsenWhYpsnkWA/OQ5s5ip72+6MNkZdYlMS0KcPAqCZAtOG7hC+cdRaJanaaHzNZuMmZ/9y8wlDn3aHr23SqC0ch3l92pYZA+vu7btRx1yDVtuRE5Wgkf0JyqSUYUo7x2H9sVKKLXYwcGIoaKH7MqWahxTQKx8VoV9Xe7tKvzFFeQ6y51rnc2QaVTemS6Rq4/88xYBLL1xK7mLhC7CPttsiRAiFjcQysEp7RuKnS46A17VUKybSDV6dNN1QkwCV9YmoHOj2DoSMHeglFncWGn5tfelJe6R/fB4+BnaVjgk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(19092799006)(1800799024)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ud2vVq7u3D8wS88mqwTccS3xZ455hf1hWhT0stRmhh53Wx01WYsFPu/b2L10?=
 =?us-ascii?Q?AzpX3YRIwh/D4RT00yREbvaFeCfxXRoi8yR0n0eDZMjy3TNHgSMrtPvgvfQM?=
 =?us-ascii?Q?TKLNw7k9kwsamEJ+9rBuptj4b88kFDjCR3W3Eby2IIabl3uF7NT1+avidBpE?=
 =?us-ascii?Q?v9gg8rpHletjzcu6ser25WMIeD99J1sLzfNLfe5s933Fk6w7CYTDYpxKvOZ3?=
 =?us-ascii?Q?ovVXHIr8XRO7gwIYTpgz50e1sjbnogvZIxwXuyURws/IZ4XPm8J2BORClLxi?=
 =?us-ascii?Q?52k+HFedGpbV2O4lTlRjOIkmMygqR4xyyU5uJIJaquWRq/3rKpVdN4EgFCAA?=
 =?us-ascii?Q?W2zAiKLocqnLaTKgEgvk5y3iObRU08vSNl5j+5ER72xVhwLgIbawNZXDNNvT?=
 =?us-ascii?Q?vkEXsQXny3F1lENO4gPIhbj4PYHNhbiXimUxBAa/ZAOTxV32Bm+7xn76K5ib?=
 =?us-ascii?Q?4kns5Y8PcTxU4+eGdWrAtGfXo0XSnkCuIHlAPIJg6P1stlsz4tEeygfxao7x?=
 =?us-ascii?Q?QPLqxDnmGPmhBUuOPAXd9oBloGDfb8BYtukxDHY3E8GGz2n829oNWSmlCF8c?=
 =?us-ascii?Q?kwKiC8tnpvvWRtxkoiZVLCGxgCLok6iKrUBGbMzY6odjJSNf7cqlhvdZny/D?=
 =?us-ascii?Q?/N02HzQA9u9SawKTazsx6UgBsoSSUrpzRmfbpt1To7CfHiZN2dyLEk2G6b4X?=
 =?us-ascii?Q?TNZaRC3pO/OQZ1lyWyF9tjfTjDjQ09ld5Ct++nskwT7qmNLZ+cS4uCkIi3JM?=
 =?us-ascii?Q?RhWePCmO/3+CT0FZPz/kp+EmGUmwlvjAy+smrZTZd6y8JobkMglwZBjkz3Ec?=
 =?us-ascii?Q?/zx1VnzVdnRbhTpM1tk4etHiZjN8MWZ7OPBuHMd5wc2dU2Sc7PgZ6yuH07Tv?=
 =?us-ascii?Q?9gBG8uLlO+Z47KJY3S7OFEGotiPYa6DtqVJEgotPn8qWTRm0LMpBo9LIF0n/?=
 =?us-ascii?Q?mCJ05bKhfgkYnmOi1FlPXjs+0s93a/RAcXm0a0Gn4jI486vXyCUgWfSy+g5T?=
 =?us-ascii?Q?w9CGgYC7niiTBOELNjA9scpQIoBZ4KApYQcUOiBjVKTlud2kGQDCMpmezRQd?=
 =?us-ascii?Q?dl8xTW1XxV0rbieWOF/4b8ZUCTYrsHQyFt2Eobi5IYFOZImRPYc1mFzubrTB?=
 =?us-ascii?Q?ZwWPTgBUeFGFNmk+71qI9JC0gBArEd1WpD8evrMQR86VogXM61RX37OT5eNy?=
 =?us-ascii?Q?fQshfiebmQ/H50L8EM3g7/tGzzsdmH3s4ecs1crVVpRENTi2EvfWgN38EAwS?=
 =?us-ascii?Q?KnQ0ubx6LR5crDNgHvU2qJEF+lUfVoIZx0D6iLOpNHoY1q0oebrPVBS+ZGOo?=
 =?us-ascii?Q?03Zus7KB5A3Q/e/uk63OwVnmkyX2gUYvTfLY2aZ1UHADmTpnsYCrUMjeW7Bu?=
 =?us-ascii?Q?QyDDJ7b40vLO/HjlBrEb7ZL5deRUQrLqedXeHcgcOvF8NjJ0RRN67lkYDq43?=
 =?us-ascii?Q?jujq3oLY8vlTxEUdS6s1L+ON7RDlEe568qgEpt/gFYulr28UY59kJh+GJXEx?=
 =?us-ascii?Q?TAvHW4khytmhgrwVpcAw5jPnUYU27v2ij3/0GTQ2neJ0j7Q3/kR96qCmBUh7?=
 =?us-ascii?Q?9jTyQGFXegYnUq2M3af+/VGG65oLFYK/AjIYXeVKxP7wtJN4c8Kr7UT1Zyh3?=
 =?us-ascii?Q?SHqhExe9Uqk59uywv89oVIAwqM7nWaqD2qyPCwVdII7V8wDcgatVIKQyQuz6?=
 =?us-ascii?Q?LOafchBjSQIkkvW73LOBV4p/TRA6MUu9bv/rW3i0fdaQE5hvN5HOjsKzij/G?=
 =?us-ascii?Q?q3pnJSY7GQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df500a2e-90e7-4467-4a02-08de804664d8
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 14:48:16.3192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OYUK5mPGWa/XsbA3YGk6mudcT0xGUg4nIl9zal+o45D70iQNZjEUHRq5SSq2YUL4Yh2RB51GpIdzFbEwnG0WrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11461
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_074822_741965_0FF02A18 
X-CRM114-Status: GOOD (  13.82  )
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

On Thu, Mar 12, 2026 at 08:36:57PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Add compatible string for:
>  Cortex-M7 core[0,1] in i.MX94
>  Cortex-M33 Sync core in i.MX94
>
> To i.MX94, Cortex-M7 core0 and core1 have different memory view from
> Cortex-A55 core, so different compatible string is used.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index 683f0c36293c08616621daa79c0b8914b0f48bba..b136b3c3ca3ce9ff92d91f4b8ffc29c614edb66a 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -28,6 +28,9 @@ properties:
>        - fsl,imx8qxp-cm4
>        - fsl,imx8ulp-cm33
>        - fsl,imx93-cm33
> +      - fsl,imx94-cm33s
> +      - fsl,imx94-cm70
> +      - fsl,imx94-cm71
>        - fsl,imx95-cm7
>
>    clocks:
>
> --
> 2.37.1
>

