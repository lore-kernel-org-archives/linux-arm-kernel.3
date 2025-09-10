Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1B5CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 15:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1dCBas39GICBZMUwfMRsUconcBnn5Gt+YGB9oKIwWxM=; b=w6a6LVBfQ+jeo5iqjzvu93hNuF
	g91ll0xuST6VDR+kpAXmUZKkcf/TRllh9BBIRYnKHKTAX4obiAXj/hvy2t4f0To4So5l499VfKSza
	0polWcksjbOjBev5k4grH1UUxHjn2bkbRgvJmnVCfhfO0NNzXXj8TvuGwjFu7+lsj4N4Y83ou2aZe
	LrpQEebzXnYsyiYFTWhSVm8UjYBIvWF87dOaM00iQ+06QwkvZYy8R9GRWYohPXssg7nJzM2Ld3gBs
	31gKK2o+xAMFYmz0H/EzMbcWz5c9JTjY5Z5EUIt6mhzyQ4kLismo1lZ57D8RMmiAInhJmEuVCGVjj
	eIRtuO/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwN1D-0000000FDW6-3iR2;
	Wed, 10 Sep 2025 15:45:59 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwN1C-0000000FDTv-0iX6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 15:45:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W6GCWrg7V6Lryyqlth2e3uc3mkM+1DVo33knL7LzEJ6aKnfTY8aiHrIQ+mJvAMuyX4uVxGMmVA3TqLBOp/BT4K95OfyR+j1fYovUDk5L8axiiQR0H3JD8gjsd8NxPutwoYfXqIzEfyVDJ72MilGu09gB1IoiR1uO4gp4JRUSk6gQWugRiESzjH1k9SeBbiL/IEqrTgY5CsYt4WLwysqT1zMkMc9VXQgVj2AgAxQzh3N54C911mOa2dAV26f1H7QeHTnZB4W9mIP5o6Ia3bXRT085Ou3Uxk8wmFLq5iM7eojIgvAAIjW7mUacy1/vT+hGLo/yJ4kyA8aGuvRqfJ78UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1dCBas39GICBZMUwfMRsUconcBnn5Gt+YGB9oKIwWxM=;
 b=KHlnhTHCCnA4XAqA6B7mfCYBh7wSOzzMDIgIelqTAgkY5pcnqfzkHYT/8c3AJHlSfNoC4NISFgJuIlri61WT9zjlm40mJ29rfbIdp2Hn45UrcEcNttMEx7WGMvoS9RTxVmJa8C4J7n/59NvykjxKZeHzWr2o07CCjG8bhLX5hArpR+vBGV5RyOiT+u0DuFe7DEHHlQhMvB/U2PzFCTG/M/igETu4QgSsirbxUdYo0yd3l0ObLD2OPaNaamY/NDnmyX4PDyzxZrXVYBeXf6gpU76y1bfZlyaRW/855pi3UqqeqZFMn2UYTobM4tRPIEToCckQAYJpd8gcLy6l3L4QXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1dCBas39GICBZMUwfMRsUconcBnn5Gt+YGB9oKIwWxM=;
 b=GOWFjTVVGGTiwWjViAMXYB758gXfHJnzeu2C0vDSd29kl1rOb7+zuNY4+mOdBSSUlUmjViEBNPi9XaMVlkRvKCieow0l9jRUbr97qHualv3vsuGL7Cvoxp04rScwtgvygXxuKYPTQp8O3+wbz9EVJ78nceLvdbHb11c+X5key4dv7ziSSnSFxSZvb/A+43/cP7+3C91KR7LXVrUfpeXugCeJI7KVBC6AeeIdpowdQMk42de+tC2p5lHa0BZSzJcLnNiE+kB4ydRwrOhkG2KMcS1kBdBbvT1mhCJ4qn3kLwQYD+Dcbw3mAAMf+xwZCmg2p3zeabQ/7sYaTTUe04Q5iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VI0PR04MB11503.eurprd04.prod.outlook.com (2603:10a6:800:2c7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.13; Wed, 10 Sep
 2025 15:45:45 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%5]) with mapi id 15.20.9115.010; Wed, 10 Sep 2025
 15:45:44 +0000
Date: Wed, 10 Sep 2025 11:45:35 -0400
From: Frank Li <Frank.li@nxp.com>
To: Andreas Kemnade <akemnade@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alistair Francis <alistair@alistair23.me>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: mfd: sy7636a: Add missing gpio pins
 and supply
Message-ID: <aMGdH7Ab+9t/v3CB@lizhi-Precision-Tower-5810>
References: <20250909-sy7636-rsrc-v2-0-cfd9f44fd259@kernel.org>
 <20250909-sy7636-rsrc-v2-1-cfd9f44fd259@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909-sy7636-rsrc-v2-1-cfd9f44fd259@kernel.org>
X-ClientProxiedBy: PH8PR20CA0015.namprd20.prod.outlook.com
 (2603:10b6:510:23c::8) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|VI0PR04MB11503:EE_
X-MS-Office365-Filtering-Correlation-Id: c7d78fb6-b981-4438-d3f4-08ddf08119e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|19092799006|366016|52116014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rYyHjhNC8QV0nT5hDMqHP2wC21IkiKq7cLVdTY/mDS6sSBxjpQP7xXJzcHNc?=
 =?us-ascii?Q?HeC9qRToG7OSPfQMAvec3fdpZ0PTeVRZXGz5P6VYa4XwVd3iWOsTnHuE9eci?=
 =?us-ascii?Q?0CMp5cVJXr2yCDpxnlBntwS0PWGlrbMpjrJqxcUNEEjUvWw8YgMz6CyLUj62?=
 =?us-ascii?Q?mZqD7xlSq51YvP36MgslKoINcOUKQJqSVo+j+j5h9vLbN7IAgSh1Z9HWQVd/?=
 =?us-ascii?Q?Be81IzwZDKMZKLsqXWtOjwLwLJbKa8oktg12L14BDgPclsjpBzjrwgodJYLO?=
 =?us-ascii?Q?oPseKEB3Ufz2dQ/Vpy8yc0t701xRU6BX5b4ZC70klNeNv2U0lwF9s5gZw4j+?=
 =?us-ascii?Q?Bt24EAr5MGQxUxtrKvrPGzwryuSclldRFqsOBDlg+TEZw/22S4dX5LqcwE1h?=
 =?us-ascii?Q?lfMvJ4u+hqJt90cY/oqJaxQ9Raqgu5pRr18yGM3CCtCsWU2qSwGRwSGPIkMT?=
 =?us-ascii?Q?iczq82eKfWLmMGTw98N02nF42o2+/IyLnpAA78rPTzm6n2UoDqZrDwtjfOlt?=
 =?us-ascii?Q?JWpK/aJxlvb0g0zEDVuHg1LtTdEmD30xbdM4DhXy5BTg6/Ta58DOsKMaE5gZ?=
 =?us-ascii?Q?TjDh1qhKVc5qx7X/e3j+qw/TuBTP/xuUzIlL7Cbv7GuCD5XUXRW49LJxqGsy?=
 =?us-ascii?Q?M6e5bG9dyTYw/DTtUGaGvE3j+JnSrKDuapcJfAT70Q7LRnX4+gMH8+dX+8ym?=
 =?us-ascii?Q?NNbIKHqNos3AvSZb6FjcdLkUDAWuv90cVYKH806ZMyqtAIQqbptikkbbNZYL?=
 =?us-ascii?Q?1a0uR1cUCwrhtMlBIdJg0kkvShsqxuXh0ccJwstUgBf6oI7lHXWGsMlb+8Lf?=
 =?us-ascii?Q?9yDVSu5R9CqJYd0YJzhyyJkYCz4/IT5wQ57lhYrFcXpuwtkqRjryA1u9oA2Y?=
 =?us-ascii?Q?8ewwiheo/+VI99img/JQqywJ9+FZxNbnIlEmLKT7hDZk1j+NylmcpZmoTBR3?=
 =?us-ascii?Q?/mmXdIKtCBN5MPSZrgZnOV9keLAy/L7gpMOuFzuXuq2GY5MNEs9kWwVVz0g8?=
 =?us-ascii?Q?vC9pgWsOZhwo1k0TPwo7HVm4ZTdf4Z0uNGXcoE8txSiwaA5h6SN4W6rFqZmE?=
 =?us-ascii?Q?9iZiae2eCUYLM+tdIWfwbIpyRwuboYjc5xBDIS4g8omBHu/xQOJcyG+FGAiB?=
 =?us-ascii?Q?L4Ffdm5dlhBDONyBphQx7U5LdoZ+ElBYr/8U/mdMMz/VUqWpVLFiom99oAHL?=
 =?us-ascii?Q?BjOu9QsQr7inow6Xbx/hHkHs4B5EwDbo32OPtT9pHmU1lqMqnc2h8anI/eV2?=
 =?us-ascii?Q?wPm5jOU/AyLTuu3aULW6UTpQV8YZJ4tEMElnTmLI7krEJ1AVIt/d60Lid92m?=
 =?us-ascii?Q?qpMQhUEfFlEcuNekIMgDFZkfvsSXu+M68/qoJcWDCVR5AXpHnGlgXV1J4XzO?=
 =?us-ascii?Q?vpl1OvZcuGVOKG8pIaXVOXbfCnDc03S0oxU/wkeWIRrQJFHSU1EZg6J+eIwm?=
 =?us-ascii?Q?Qe4Euxq6F6a3JXvO0rlvhJC71vrCzgoccsAe63BIPB+rTEe8ZVwgbd7SAJk/?=
 =?us-ascii?Q?vQH3s0W4AJYtQ2s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(52116014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8O2yZVqVsmAY//FrZdf8FlsaWUp1e5b8no1z7hijAEpd7X/Dvl1WwqV8nupW?=
 =?us-ascii?Q?DNLHwJJOE02BOY2YnpnEvGTuE/pvAyvurKwUiphWmok+8q8z1NibnXRJvbEv?=
 =?us-ascii?Q?A0LMSZBuF8nJDySFmuzD7KipJzKEIbyoVlMLyOCQLuEvDOBzyihhbXyrVcsZ?=
 =?us-ascii?Q?78DqBVVln6VYZuOTXyU22dVVUA5FoIHt83BRyxcyCPHmfdSUxOJE6D0hO7+S?=
 =?us-ascii?Q?O8ldxDvlTXSA7MGdn04895yFvHkUCusfjxRZZw0UjknjemHf7a7AkVyxC6MH?=
 =?us-ascii?Q?kefa02K6h7f2incSuNkETflb1XWAMrY4vrkysfP9yhuLZnRFmQs49TCs3O6O?=
 =?us-ascii?Q?Mc5JiKuUZSHA0kn2e9H+tkZPY5rtfAaB5MTOS0CqjAZZoxMSwFvt6meQJqnw?=
 =?us-ascii?Q?hPtpv1QRRLIsg6r3DyO1tTWVzIIOdQhB15u7jkjVnBhglCjVr/wOZG0JwRKz?=
 =?us-ascii?Q?Jlv8jCBm6vzFjh/mJaFKpGW9PU+vDq+MIimw1VbBK/qDa6jG89SHOuzPixGJ?=
 =?us-ascii?Q?lSYGTibNrBmXderSKB1apFKxVRmEiPjoxugtiNyr7LafQcL6z6zvw1GfaZUl?=
 =?us-ascii?Q?zbN5k1ab6oMQZ2SCRZs2d6+sbamn89awrxFheARHrz8QGGv1xUT80NI2shNs?=
 =?us-ascii?Q?2CfCkDWlW2DcpGy/NnnNs1nA9CC+Nh++uqEgjJPAlgXKFj9ielKF2rvE6uJM?=
 =?us-ascii?Q?TlE/rZLzwKtc5JDX1R62Lm/g/gdTAmghO3MBifJ5jmaF8xzXbhSv84+agHMx?=
 =?us-ascii?Q?5TvCejX+ISnTzLVlq+2/4l1GbnoqsGNDPuqCYHeXkz08rN/IwmLHZRIa+5tI?=
 =?us-ascii?Q?GScSAuxKD3VGRAH/Y+waO8kx09i7UAGBxsrCwpSao6i3k8kx7N99GbmnKrZC?=
 =?us-ascii?Q?eJIuQ3y432vBqE9PKCRnCeIvmNm6As70CY4CU55lw6a1x1mFlGl2xb04qQV1?=
 =?us-ascii?Q?rolg8FYVIsqF365aYu/b1g8NcAeewd4o0mFfFLCrhRfspcYTc/Kt2P2Vd7eO?=
 =?us-ascii?Q?BR12DsBpMiqyiiy5eOE6rlBE3tq6Srm/o4MmCiSeFMDx1u7sQz0NAhv1C2Ke?=
 =?us-ascii?Q?6YQu2tHDpDXBoOTxZ/sKTECp8SEngI0lVZoVTInu377fCd2cswbq6fxkBQJB?=
 =?us-ascii?Q?bcH10IEv0SXF5q95Hv0vPujKOVS2i6HZe9Esn3okdZKydDJ7eWRdAGuloi4c?=
 =?us-ascii?Q?FQnvIAttO5/2dLIRswc3pzWsMlUGj5Htt8zh7xoUY4u5YeW9wDe3lYan01AT?=
 =?us-ascii?Q?6Nl+Q2Uuuh348z+u8PBUego7mCE/Xab0Z4j5BJCQZkqc2AGi50T1SAav2O0m?=
 =?us-ascii?Q?EceuDMAe/B11KSZUa7FY1zxJ78Y9jRcyg5PexrNDFr2k4tVBJK20uZbsr9g4?=
 =?us-ascii?Q?DFpIVFDY4vG9ZnnvmgvMpfeORubKlFjRcBHTT8GzsidjWzLdn6XZpR7WRkhr?=
 =?us-ascii?Q?L1GCehvJBK5RCxec3GnTwXSLQq0K3zi9aRVsDBRFcj5e2M/ACnBwr+3zi0nj?=
 =?us-ascii?Q?YZkhFHST7KKJ99MP3NIeILZehX83aRy81snMRB+DO02HT2MUdDXJG3kfATMc?=
 =?us-ascii?Q?eouT4mOE5/vrYkh6MIfEyLmHotPvxDeVYrv1Hjmq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7d78fb6-b981-4438-d3f4-08ddf08119e3
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 15:45:43.8706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xY0FESpAjICxHIHc/hxBeGoP29SfFF/hYKqQpZYM69Jv9Nrj59Wgt/1U1uNZQPag2dHYsRHLYiDFkB+R4tUNcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11503
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_084558_214840_6395EBB9 
X-CRM114-Status: GOOD (  22.45  )
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

On Tue, Sep 09, 2025 at 10:33:02PM +0200, Andreas Kemnade wrote:
> To be able to fully describe how the SY7636A is connected to the system,
> add properties for the EN and VCOM_EN pins. To squeeze out every bit
> of unused current, in many devices it is possible to power off the
> complete chip. Add an input regulator to allow that.
>
> Signed-off-by: Andreas Kemnade <akemnade@kernel.org>
> ---
>  .../devicetree/bindings/mfd/silergy,sy7636a.yaml         | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mfd/silergy,sy7636a.yaml b/Documentation/devicetree/bindings/mfd/silergy,sy7636a.yaml
> index ee0be32ac0204..054b97dd0c5c7 100644
> --- a/Documentation/devicetree/bindings/mfd/silergy,sy7636a.yaml
> +++ b/Documentation/devicetree/bindings/mfd/silergy,sy7636a.yaml
> @@ -32,6 +32,22 @@ properties:
>        Specifying the power good GPIOs.
>      maxItems: 1
>
> +  enable-gpios:
> +    description:
> +      If EN pin is not hardwired, specify it here to have it set up.

Need descript function of enabel-gpios, you can ref data sheet sy7636a.

"enable-gpios" is good self documented by property name, needn't
description at all.

> +    maxItems: 1
> +
> +  vcom-en-gpios:
> +    description:
> +      If VCOM_EN pin is not hardwired, specify it here to have it set up.
> +    maxItems: 1
> +
> +  vin-supply:
> +    description:
> +      Supply for the chip. Some vendor kernels and devicetrees declare this
> +      as a GPIO named "pwrall" which does not exist in the datasheet,
> +      disabling it makes the chip disappear on the bus.
> +

The same here, descript function. such as power supply for whole chip.

Frank

>    regulators:
>      type: object
>
>
> --
> 2.39.5
>

