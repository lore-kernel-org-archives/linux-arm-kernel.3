Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74EBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 20:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NpAl2LpETSiul+DxLsPYjXdIv06G75C9yDItENpzmzw=; b=iR6gbPM48wjtHpsDMRv7iUTEzU
	wx6J9RG0QlwJiMG6DP8qiGulUqOWwOBlQdKAJGbs9A78NJSh9qBP8O+poO8MUFdK+9aTfAunR45Qm
	Pu8m0BFQnuAB8KdPclhRVybUmrL6tGq1yJCZ/RZW0JRZIsJ7Y1Vr7y/goeGYJ2/6OLDeT99xPrShO
	uCHo6qBJ0NZw9Npg6hg3hrXwzu8bg6HYQSVpd6sZFNKjTMjNPziEffXw4/Ka8cRON/LSn00CjZcdr
	fS43/N3voLR9e9cGdqfVeBTMeRdupSG8khRq6c/mdMaIY7o+C1UQ0lhG1kegCN7toG4Pml2yP67A1
	28DQpE5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whZ9J-00000000O18-3Wr5;
	Wed, 08 Jul 2026 20:45:41 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whZ9H-00000000O0L-12qV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 20:45:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZiqqiLAFekil6LqA6LzoFy46C7V8mBUCI7ZSnBeIgjtXBmyyH2ljQCrs08vVrZVLNllbZ8xGxmafYOzhTfMmv5LdDsGOMdTgoTs6LO7Jhm+TLIXLHUTE0TptJkgA6lSn3ZPuyPFRw+dgMdHbEA8sEyPY/xw9ysGZOTcHCjRw2Cm4cMH6fiJxbDkhtrGIbkAmLfUBuTQ/XASKYdE+vUmnjJWsxWVjxYTL42ROWJkXSM8Lby+sCXCZ7x2okBybENZLc3Zek6DirXGlJlFiTHj+hVvS8A9DoC5x4vjrE7UWKHeqZ+5OTuCuUndtqODm6lLraI/mKQzKCpAx2vkxLd5L/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NpAl2LpETSiul+DxLsPYjXdIv06G75C9yDItENpzmzw=;
 b=sAdn+jVkbpuK8NRFUd9nJsD6e5OuTizgO0WGv85QBItcVSnMRuhPLB9AMtLJ2mmy8E+wX2T0Q9PggvPcuj/H70O60ZA9KvZsT3AAp7vOmXc8M1V7dNYYdocFyj6VIQs6Prv+TyeAy1+ELp9iKHbRZpgnQJk97BVaeEXMJVE+Czddj0Y1W21Jf4/caIfVSGB5haLhmAS9nQNbi2KWnAP208RS+yNcVg9fCRbV9H9bFUFx5V3qENp4fpeuzU4yCnKsXvWT1I1IKU2eCz4QnHRt0OUTAWS5KvJ2i10tJFQvnp8lsU4CwgW5QoapNWWj8XRB4y1W7AwGJuBR/mQmpU1k4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NpAl2LpETSiul+DxLsPYjXdIv06G75C9yDItENpzmzw=;
 b=cQcARz27yfmdo3vQ9CNIY2QvF/w19cBDzTIBpqVbZJ9tjuhZoHThrD/5+I50FvQjSnXzZ/t7GzFAgt0nNdXAWgasZdKoPmRCTigZv0CEo6qcr4GfgUxMkzvr56hcyyTZ4zUfrIBoOQ4tvbXNdIyIAfwVCDlmxdsA0w5WqkxoFZctrv69NvZ1T5+DVx9VqKWzwlzeV69dV71kwWfeuLMxyMisdoEOaaqA6nRHo5irgkTeu3ixvhn8adc0ygRfZ+aXjZkgNngAAr4Zr3Eqysgqm8AIv+wSmLMzI6UQb/ohb2M0OG5X0C6c981ZSFOjKp1fvtE/nLxARc3b+w0GtT785w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBBPR04MB7898.eurprd04.prod.outlook.com (2603:10a6:10:1ed::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 20:45:35 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 20:45:35 +0000
Date: Wed, 8 Jul 2026 15:45:25 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: chancel.liu@oss.nxp.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/6] ASoC: dt-bindings: fsl,micfil: Add audio-graph port
 support
Message-ID: <ak625RN6DKsr4kWL@SMW015318>
References: <20260707065725.312450-1-chancel.liu@oss.nxp.com>
 <20260707065725.312450-3-chancel.liu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707065725.312450-3-chancel.liu@oss.nxp.com>
X-ClientProxiedBy: SN7PR04CA0215.namprd04.prod.outlook.com
 (2603:10b6:806:127::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBBPR04MB7898:EE_
X-MS-Office365-Filtering-Correlation-Id: 551cdce5-d1e4-46bf-6dcd-08dedd31dc28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|366016|1800799024|7416014|376014|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: wtshSqhZlwYyogZuAOKKqPmVVk40qCo57QJbW5MGnZULCMKSzWWF1eiMtPmCzn3o3jypWdiqRCMONbUaGLaZ/XNiESIXUdxrgSDhWzLSyLzjVbU92mdSAKJfr0IMYwEWW4yp/Dt8U5hiKri/6S8j3WIAArD6eUSui4NGPpX+wnnYl6Kob2i79E8W76a3h1WhSU56CTAamG28pojk0uFO5nA9eLmJA4tpMs0IG+2gN81Ppkw4Cny96aAPni3NSqIfbSKFFD2gNNUm61M+Z5B88H1QTm15r9iN796e7euakT6LZWoTbIjzJ2j7m6/1mqRBqlNnCMowLUaYA+kzbEk705IGQNqeaC1DsnZb4tNxbIT7R3U/NUfdDfeOrbTO3Gc+Myy1sAzvf6Ym2ms/CNTJJ/fMtty7vcznyCBGTLJLUHwn43ll8GWS26DvmnvIAFReqcQagO3qftrJ2YnM5fWSuDsH8FodFUm4uivQOqyV5yYitxweVxjQUk1+5PH+avLL6D2gti5mQ8NE7n1R+kL+jt6ZF06pV9R6Ic3LOwVqRdDJY+HfK7GfZrt3kGMgL7IAdPU/cEo7fvFXpPGIUDwaVsOMBznaiz1bngBJfRPFeDTtF3weBo3OKEhPntN+4+5V0cCv19AADcMrx0qxV/Q1iIXpk+57TVSGYeISBM3YVMo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(1800799024)(7416014)(376014)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jQjDNdGZnLvq383/OZY5OLf+X16N1Qovm+aRPUMY6SNb7ehBUr1WKjAP1Pkm?=
 =?us-ascii?Q?6qFolmtxBHZhXM82KFeI/t/NKRBJcwI66o3wZUPl8AVtOayhggrDDtpDjN17?=
 =?us-ascii?Q?bb2ErpJAB5/uayZiKZmAPIaDUVVzD2+nLX49Ag9ItALTACHCwea0jopgyALl?=
 =?us-ascii?Q?XmYf38Xg4dgdFXQo75z4r03QnrEZTSc65saXUBz5QANiPF3/8EsgTCXvudzB?=
 =?us-ascii?Q?W+kt2NTBzKtzwRBMXD6ND0bQ7MgT9hfCv9ugZYEb3uDECSeD1hI+KpeAQJRM?=
 =?us-ascii?Q?yGj8v4EBDh5eUqJurk5rruR6SuLQzZVowbHJHqVKmg/W1DSsxedRqKexPN7a?=
 =?us-ascii?Q?3vb8+Q9WvIrbGwnG0Bi5Nte6dait43ZLqWOSYjCvynuF5AzrqOf6I4oM8sav?=
 =?us-ascii?Q?5uiHOTqjLjD7ooQGa0sAEcmNu6gBKzmijZ5b/VaRA3XPe6Ziuveahk9vIOab?=
 =?us-ascii?Q?FM+Rhxf/FKuAswJDSeotAJTiSHnMSFY4NVdZXTAVUp6bNuckQ3uUJdq1Tj+P?=
 =?us-ascii?Q?2KraLLZvHCPZq++/yBMfoGXY7y8ui/QIsv79VKTdFt6qu4lOHnfnycxe/Vsn?=
 =?us-ascii?Q?4nI6furu+CKCTyAp3UCgDURrfCSXPFzCyb1BkZ2xtJMEFj6Oq2tOAnoumgGi?=
 =?us-ascii?Q?aTFg/uSPd5b++vcolIarsftMunJTpMGsuRp4qrrGncYbO8mCL0eAXly065yg?=
 =?us-ascii?Q?QDO/tuh0SZppTwjMkmGEfwAQvEU8SF1jlujfHAkiLYS0TamJXgxMc8Tinlbt?=
 =?us-ascii?Q?a+zsmirrBl0WCemEJjjWXdDqIoOo+uHxLyNjNttbn7ri48MIJ6K5EXVpKcYj?=
 =?us-ascii?Q?U5FhXrDafCzckmTaipOMYnsv+0dTBPsuf2ZNq3v9sYvE82eehtGVv0OLfH6U?=
 =?us-ascii?Q?CrFWxmkHHQVTRVpKh8bKN5bzZesOOoYI/6CyeN823eXFtoEwOis/R3Rm5k39?=
 =?us-ascii?Q?5gBI6MXcPBYCVyhbcn5hdfBS7hW1kdf/3x5OI8B672nWCvhyr4QxfNPXylbb?=
 =?us-ascii?Q?qQG1C5N1Jw1ufFaUrb0F5j85YT8K6rOJMax1+7iG46FxHyY9g6wWjuTkXd17?=
 =?us-ascii?Q?70H/TJSAem92DWzes6oYAfVEhk2QOKJl+WhEUbXd5LoQeLdo2tM7H8IzEejy?=
 =?us-ascii?Q?+0J0AEdE1dubOOPoWlqPAg+e4fC2yrFgD/jnluNhg3y7YghPrE6C74+HyH9L?=
 =?us-ascii?Q?eR/hou5xzlWHgrcSrZ7WAh0rvpwzBO0k3i0Xs8KR7T8QEei3eJVwnWasEre1?=
 =?us-ascii?Q?SOXe9NRQHg2CR+5eYLf+5YQHVkKuQraDEC/CE39YVCM70NaVdrmqiqvI9ia8?=
 =?us-ascii?Q?/VGvxF6U6l3nILH73WPiuBr9wasr2/a3inPnSI2j3MrFoo4kEe/qGeWfZoOH?=
 =?us-ascii?Q?WKezNhYNEGRVWBEZ+pn3cc2arvOem9d+eVY5mcB9eXH6catSGqA1cO6LVipU?=
 =?us-ascii?Q?FOqCc03TT02ABOphv5i1RI/ORLBsxwMBRaBux9cYrbs1H/I8huTDJZieY2Q0?=
 =?us-ascii?Q?yHiFuq672dNpu/dQaqLxxr55tjZ/tF67EFrRHbE2kF3Sx2EkIJiwVjsFxT1s?=
 =?us-ascii?Q?wMa3DRjzHr6gr1edupBAfDipG27bzX6jbEJZ3UsBPPgMvXMnNa3K2dk9etFa?=
 =?us-ascii?Q?L2HjANnKauh3xMb2Iiu4/drXgOtVLb9EBu7Akhx6D2Zs3wyZn6a4cCGzMbPN?=
 =?us-ascii?Q?xq3VJVdNRb5vQNEyEcCfV8rnNwK3LPXcxriEmNoxE99uvmFKqmwTIcIQiC4K?=
 =?us-ascii?Q?LqXMaSoQ6Y0XX/EUPCecCBCN3OGSaIQWnYxJ4rCFiJLXc8mxJa9V?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 551cdce5-d1e4-46bf-6dcd-08dedd31dc28
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 20:45:35.3696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rWl7G6hJ3rPPD829qxzNOs0FGmIn7akJsKz9M8zw0XHg/C+5yBIyGzaL13gCTQF25t5oIUtnwqRKdlxsQ+76vtijFDbapbGUjKbb/B6Oql9WkHuGGWKQihwCibkvH7mb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7898
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_134539_286571_2E1B9B32 
X-CRM114-Status: GOOD (  14.12  )
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

On Tue, Jul 07, 2026 at 03:57:21PM +0900, chancel.liu@oss.nxp.com wrote:
> From: Chancel Liu <chancel.liu@nxp.com>
>
> Add port property referencing audio-graph-port.yaml to allow MICFIL to
> be used with audio-graph-card and audio-graph-card2.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  Documentation/devicetree/bindings/sound/fsl,micfil.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/fsl,micfil.yaml b/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
> index c47b7a097490..4c7dadb310de 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
> @@ -66,6 +66,10 @@ properties:
>    "#sound-dai-cells":
>      const: 0
>
> +  port:
> +    $ref: audio-graph-port.yaml#
> +    unevaluatedProperties: false
> +
>  required:
>    - compatible
>    - reg
> --
> 2.50.1
>
>

