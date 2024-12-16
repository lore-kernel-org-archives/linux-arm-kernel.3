Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834DFE77183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 16:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j64LIIZimFutGiG29jIqbfP+pR+rgAw9rPBRlUHThug=; b=RBAXc8tveGm30hrinDYWxRU4NC
	VQt0G8yJYL4XWnOQw80sV67NCo9hyw2s0CbQGl4mX+H9irhxj1zI9KaWpIEA541TVop2Is0nCh3eW
	FfrSv1I0uO7xvaPh0ATsLoYSVgsTSqh7vC2yjzT6whgWkKX3nWRp+e3kGCdRS+XFbBRCAC9WTRLKm
	p6l6BPXNMOYRE9wMBkmrK8J0iImlalB5aDPmetVYVc7GWl8AO8rD3MPLEm0WIh9JqMFQwE9Ve1IFi
	S2uBUYiaBlU45bz5K0MbEr0uqVWhtREEL9J0GtQihuDCHyl4S6VoO+sHyNt4012LMDOgwaut17fix
	4fb2oWtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNE9f-0000000AdGw-2VZG;
	Mon, 16 Dec 2024 16:41:11 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNE8Y-0000000Ad6h-38ll
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 16:40:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y2MM1TlCD3ugOBegAlcIBmGnqjYzfiOuTIgp1gZ0V4Yc6Ac5NejN5/nQiUv4NenOIb6pOk+8sEZvDeVoCjh7oZ6zP71pi47qxp9wXvhELk97OGYmotYeBSbRN18T4QhU7M2wRefy/oAPoudha0P2jX93LKhq0ZNb57mFLUrkuOAmcHJML/rBLxb2BJ4zQrB84SB+eP9LE5rPztne2rdHsi0mhh1YPLZZRJgRTUJugQMru73vXJJYCXELydXKpzlyWE7lUMU70RWyQKsp4hCCBCpIEe/CaUbCUaLTkt8sTDQIj+YQfaeSb4vQ3m72ymHFEXLW6i6e/czIgJhcPQHpYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j64LIIZimFutGiG29jIqbfP+pR+rgAw9rPBRlUHThug=;
 b=uEielfKaFyihliZ7GN8t29kqw+LmTcA3QgdlpWxmmuFKAuPoFQOOkkkMmK89aJ5QFRtDZiDC3H1PmuC9BqkXb3HGHqiHJoynE3svlJjvO1PSw5qdrUgbgu7s6vHXRhXmN004bFMPUGqbomX0kW6cMxuTOZt0Uy+u45AEdgFu5/Ow7MeUF7U07Y7eu9wbzQEUogxyizmlsxvE/LmxOSLfggNWFcutgm4AkoQJbmLjXk5hlCFOjgGUkucejF719ouRFXh/zWiVO1Kpvw+zredtlelDU0cEQaq76inyxcuXRYqW64QgzB5hyJK9RdE3mvZXNghhW/K6+bZB61gUMR6n+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j64LIIZimFutGiG29jIqbfP+pR+rgAw9rPBRlUHThug=;
 b=T/VC4NOJmlQ3dnn7WjLd9CD+vFindd4qVIuqjKuYKmztbcLxdDRrqKpxakQpSJBXsxPUpxbDeIoQFEF/4WxGynt9IrkYUTcia3cnZM5pyb9USgHNpBMS/k2d0Vs6BvsDNAeaW0zAgYYSlHoiMiUbF0dmxm6Q89Wtl0eBHjrPOEebHG8+v60V1FEeLix7qFt2vQQrnWs8JMEt3jw6lEsaO2xX4Mk4JtOdmAyU7HWD+4lIzLPQOuuXV2ETEsb8uYVdodI4o8dutaQa/x5pYWaVcIlYgo/C1ZkIPqpUca0ggHHWh7l57Bhk/meiEyG6TZ9rzYAafrxX8ECc9NPJwZcDTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB7776.eurprd04.prod.outlook.com (2603:10a6:102:c4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Mon, 16 Dec
 2024 16:39:58 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8251.008; Mon, 16 Dec 2024
 16:39:58 +0000
Date: Mon, 16 Dec 2024 11:39:50 -0500
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
Subject: Re: [PATCH v3 2/5] ASoC: dt-bindings: support imx95's CM7 core
Message-ID: <Z2BX1nfd3Y2FYQXf@lizhi-Precision-Tower-5810>
References: <20241216145039.3074-1-laurentiumihalcea111@gmail.com>
 <20241216145039.3074-3-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216145039.3074-3-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: BYAPR06CA0005.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB7776:EE_
X-MS-Office365-Filtering-Correlation-Id: de67047c-7973-4e65-c59c-08dd1df0474e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cZVHDEb+yJaqWpbPkIokHvS8iwW5Gtzs11M0XqWVMPCDADEA461rA8AlEJfb?=
 =?us-ascii?Q?BQTWqZlWKp7UNdJpBHp1eDFHoFiPX4qX1Tz2Ex4HZnYBsUsXtwd1JpmCG4QM?=
 =?us-ascii?Q?ise02zpeSGuKNpz1n5l4FXhjlO54VlAqTKEVZifM6TC154XAyPx41VjT2zSn?=
 =?us-ascii?Q?PQGMbnD1G73TnlS5Zmvn5pWCC0L+uiQDPVMhVZgSvc73rfh7Y6zgV9hSM1qX?=
 =?us-ascii?Q?aA7snzDgJULTkT5UcwmSRHuYLg0amPfY9/8IqNN+tMzjFDj6uRKkGmUWMTu0?=
 =?us-ascii?Q?du9tojzu6kG8DoQkWCIHrvu8xbmwkhtocfLXSPLuwfbwkLdWPM0KFBhn5CBF?=
 =?us-ascii?Q?n08dW2lsmRhFwErsTDHZsG+BnxBtS8TCgyIlhvcUsGJo4Hw9DvSCEHoCELoa?=
 =?us-ascii?Q?EQqsM2WpJcpgiHa1xmVojholp+Efn6qCxBwtxMxymohvi4m39vWupF9Er5Si?=
 =?us-ascii?Q?A4sFev+ZKEdMSFdmUW4FDnEpPqaWvmC4Ap04mWwKb/+aN+9Lt34SNqd6vOC6?=
 =?us-ascii?Q?nvcXNEK1yiT5Sl+7SJMHY1hMIU+6M8HvHaWA209XG3Jp6jiSx4SCLvDWPrii?=
 =?us-ascii?Q?XgLdBSsR2hVkh/eNrfWwTkjMFfjYEVd5y7KogZetAOsfneMXAaqki3I1VKK2?=
 =?us-ascii?Q?HX5uWKGftHZQImBPXRsp2eWZLslnSksY6flxDAHstC0FMq4EBoxiCwht3WJ2?=
 =?us-ascii?Q?3hen0YwNp1BdmdVYydymYaUyszC49dQvHDCxr0JKAlb/yTbgg+yjrdqk4X+9?=
 =?us-ascii?Q?14TfsvssGEu/0r+eoofQV/G3AEcY6kyWNPPNVb2nQXMAf4qdLBOuZYvq+z+Q?=
 =?us-ascii?Q?aZgnX1ncr2MAVKfKz/Y4tbEHCLkYuhwMJ3Quub7Fy9fgJO/y4K/8a64gjta2?=
 =?us-ascii?Q?O/YeWLiwJ8VPmRpa1317UjGkkWGGNsHqoGUtetibI2QcyqX59KxyNxqr64t9?=
 =?us-ascii?Q?w2sX86ljFD2wETVi/bRHZbFNY/q9X9pkTMAFPoeyI6kwkfatMujw4jgCy+J9?=
 =?us-ascii?Q?v33VG5Kydl3mlDruhNR0cgmQRKyKRApSXtKgpDu4lntSWaKymBe9Xcwo9CG1?=
 =?us-ascii?Q?5rHJqBoSV1C+EuLG9A3JePuoggZGwKosthw1/CpF8J6gpyqm8ziDIZuO/OJA?=
 =?us-ascii?Q?0nSWVoDXDJhQLN210xQFTuC3FXuz5Q73ZxoTZV8+a860xGq3W96cocOr69Rj?=
 =?us-ascii?Q?0N6xsdgkCiSkBuhYa/HrJeifSIaEDNiNL8lbGisYsPyRl88eQeiiOzocXky3?=
 =?us-ascii?Q?6NNoCe6osHF3G/JspL08lloH28B5iPRuxAczZ+l7WnGd6WQ30gbLE05+39PG?=
 =?us-ascii?Q?VDY5G32mnZERZCmsGqhiWPlSuze8m79WJZhbju3pL3gIIYXH7gJpXzhDCCn2?=
 =?us-ascii?Q?dB8nf3WVTyuN+TWgKOicczyNq+3i?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VcGJnNf3ZA/0NLgB2jPEYPBm4jACGZQYvhIKDlJhuI0ZIvRVHJG3pV7JSLLM?=
 =?us-ascii?Q?HX0yIh+QzxHvYXaIn9YtifHusPbtaCEmQi6nJEUndqjsSPdChEZPkeoLvrgp?=
 =?us-ascii?Q?pmxP9khGSeNQSZF4i2YGb6F827oUdK25u7SJKxzI7y/c0cLoSRlCoGEZNv4R?=
 =?us-ascii?Q?vYX2lQ09s+/uAX8jHEoQG1OPO22jOmrkQlN8nSTc1DqWNcpNYQI1T3z1E935?=
 =?us-ascii?Q?iC2BsrKOIAvQFZF5WS4h7oR6ll4m2YJTEUgKLyZadduOnS/7SMqrCQgqoEWY?=
 =?us-ascii?Q?CUYYsiL53HaHt4VltwTVAudygPTql4d0p8qtGseQMtgXPNYnUK120Y/ZPl6G?=
 =?us-ascii?Q?XL3g/58Qn9WOwSgGp6JzvrvkGkdYP9YSSVlQOO2M+61/nNoh+lsX68j33lAi?=
 =?us-ascii?Q?MoFsHp5VP6l+Omz/XOFUyADAnsYfr9ZouMATLjcDrpaQj1MwO3E0hBhojSNj?=
 =?us-ascii?Q?32BfUJWKxFBWC6bR5ypDMPvXLxO6m1HreRhGAd7ApBVAck0HzXS+RVxqpgDL?=
 =?us-ascii?Q?Cr+mRd3qMNn660n6pAojtTFjnxIUTajXKfggfGZeHssSjNHHQuOopZhZW6c6?=
 =?us-ascii?Q?lOMQGRrheFpa2fGzdaN0CWr8dqJfgMtbVV8rPRoSz3mGCGtmcfIxWbblKYM9?=
 =?us-ascii?Q?rGCDKkHYaTsnTrb4bCuFXBtJs8OYOMJS+9P9NkoXSVrkRacpDRocoISwf1Dp?=
 =?us-ascii?Q?fCOsb/3LJirdkCobIG3IFx+97nEZ3jRuUKVT6DMHDqVmP2kU1PBzh37iOP6S?=
 =?us-ascii?Q?W5Wd8EH1aPcx9JNQMe+Ac3dX2QTkKHLgEi3db2yuteEZnUBPS9cZrrmDuKXN?=
 =?us-ascii?Q?TLip7RO3/9UFyLkjvUMHNU06P3bdXOsmPIfm6A+H9bsEKCdy7UF9vpTMiKdg?=
 =?us-ascii?Q?nuDUKGbtFxHGVGC9JknW0Rd2dcATP7w2PmsL/vNnEMxwNEHShzI7QAaAcX+z?=
 =?us-ascii?Q?x1CC5PXo0sxifz2ONv4Xj/UwREB3Mr8xmB3iE/A5fOFBto0kQ8VPC57cADJw?=
 =?us-ascii?Q?RnbYGj+uWsPsay3dbdKL0NRcNtELH0CXrBedrv2528q8kyLWn/Q4atP9D51P?=
 =?us-ascii?Q?+uC+ozCdyCWWfXEykOU2mdL5BpVjrWs8sHqa6qN9Qpz/dZXkEjEMynky8A2N?=
 =?us-ascii?Q?bDKNqvmNJbEPnDJcs06t6Gz2Jn7EjFcmDpxbSu3bLIbDqJoPm3h1ViKwQJrW?=
 =?us-ascii?Q?7iYX0/cC86Lxl0UgsCWBG0PGv043S2eEz8up8Wxpn9mUn+cslJpCdNeEfb6U?=
 =?us-ascii?Q?9X1t01tBAe+TJsnbM2ISPPHT8l4mUNOsK2ALxT9Xd1MrQE4sulnu/UGffxGQ?=
 =?us-ascii?Q?yXkzlERj9ezSgZoCO7bw6UKQOExFEYQ205v5F68iDy2AIUYdu4vQvxnZT7ge?=
 =?us-ascii?Q?5zfSnLYfLszyv3HxQpK9a5iS55qnU8MgyAt1TxueBl79zy4BHAEgBopBVkSe?=
 =?us-ascii?Q?jMlNIP/OeBfvKD4Gk4dfX6Nbjc9L4T4NfEVjnp8C/7vbg/z5r9FszBMSRqY0?=
 =?us-ascii?Q?ClwwWXtqYZiA8USWgNLivQoCpWt0rqLn0ux1qmG0KdKW2ukFPy8C0xgQF3/n?=
 =?us-ascii?Q?8aTyRxyT/7PgxWEYA61IMwg5TxUZDK0TfSlDbuv6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de67047c-7973-4e65-c59c-08dd1df0474e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 16:39:58.3234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5CznWhxG1H7Qz+CPxxMCjsBT0jdd6M2wETi128Yjnp8l8S2J8obfoByX4O2h0MjnJ20XZ2SIpBzZMUiaxKJjxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7776
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_084002_794140_5EB5E153 
X-CRM114-Status: GOOD (  16.60  )
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

On Mon, Dec 16, 2024 at 09:50:36AM -0500, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Add binding for imx95's CM7 core, used for audio processing.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  .../bindings/sound/fsl,imx95-cm7-sof.yaml     | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
>
> diff --git a/Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml b/Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
> new file mode 100644
> index 000000000000..cc1eb358f288
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/fsl,imx95-cm7-sof.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP imx95 CM7 core
> +
> +maintainers:
> +  - Daniel Baluta <daniel.baluta@nxp.com>
> +
> +description: NXP imx95 CM7 core used for audio processing
> +
> +allOf:
> +  - $ref: fsl,sof-cpu.yaml#
> +

Generally, allOf should be move just before unevaluatedProperties in
case need if-else-then in future.

Frank

> +properties:
> +  compatible:
> +    const: fsl,imx95-cm7-sof
> +
> +  port:
> +    description: SAI3 port
> +    $ref: audio-graph-port.yaml#
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    cm7-cpu@80000000 {
> +        compatible = "fsl,imx95-cm7-sof";
> +        reg = <0x80000000 0x6100000>;
> +        mboxes = <&mu7 2 0>, <&mu7 2 1>, <&mu7 3 0>, <&mu7 3 1>;
> +        mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
> +        memory-region = <&adma_res>;
> +        port {
> +          /* SAI3-WM8962 link */
> +          endpoint { remote-endpoint = <&wm8962_ep>; };
> +        };
> +    };
> --
> 2.34.1
>

