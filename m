Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D34FF5A8D8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 02:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T94o6yvizssNqyzMVomKgnvKUCLFVEGKhpjCYTMASJI=; b=c+hPfkmJq0LPVcyrEaXspB8A+L
	LlZ3YUM39f+tSkgv48KZafVEPLPCl35qulYF/Lu6LmaU+sykOBkUhcoJYbcQcEzDu/LR0vsfyK5Sn
	7m0ndO3FJecLMjJRbof6YtiK8JrUmxESWyFpUnGR58y/+BEnsWeNmf2Olj3V1RCxkNeGo6wiSiuov
	l0S6H2KPT3A8Fn+1i/jFKxJYjykEl4PdunlmUe/qdeu9KDKUTthb0BN9iQ0GBRehesJNjUKR8Uhsk
	NGPwtlbDp9Ybi2w9aER6dVAFgVChnkqksiVSykHxCuD2WX1VpsIy5AUXpr0+mX+ww1TJylRNu5bn6
	Bz6BH3vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF0zh-00000007wWW-2n2P;
	Tue, 21 Apr 2026 02:37:45 +0000
Received: from mail-northeuropeazon11011055.outbound.protection.outlook.com ([52.101.65.55] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF0ze-00000007wVi-3Os3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 02:37:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tobJDayG3CTxnTOU+Eub5bpYIU5HSlbauijit23Q849DtuuI0EWdRZ91uM2QrCtqLWoNbqiCtQPPjq2DwIQyAwibsJugbTIoit00FlPZdqtchLbbVAD/P3tb2Lbne0ykLhSKsv1ynh6RPJbCpt6X0J40eYOTQhgU1kItY9u1oSljoiAGXOrgaYy5dV7Rm5X76FuDRR2VGuD3LTMuTmhaPIr4BuSwU4L/jx7pCLRi+IKiLuzp46UyfgltjHBTTSCwg+r2iPmDQdeWtlC+1lsl822VwYyVxivg8/VvFg8s3M0yA9xgCugDj1zFR8OtSg9VaLWVzA/087JoWMZefNIIVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T94o6yvizssNqyzMVomKgnvKUCLFVEGKhpjCYTMASJI=;
 b=tPR6H3w2KhgIOEt8CrFpz+byFbzqTyOGlpbDBdARcEnI5qUMdgZdxePb+xtj4Mk30M2pQAeNGmKIrwBxItcVoW63y5PMmw6uAeR7N4l/iRTlA2kVzERGK52MIV7l1+7e+kuRvy4rCDgjie2Y7yVgFV0rDhc81/NXT3W/qzdZpB+hUunCDU5+Npq20cmAtFHcQnrNSh5+hWgIc+yUV7Yaj0cWrkfp6tKw+uJ6FVx57IWz+zY3xPiMOi33XZM8v++Y8Xx2BPQTn3nwB1RIEUubj/XfXCmHxAJ2fHVif0DlsqhB1qQAstyRjdQBIP3D742yAiNKaXPf/c6XRLFBLxOghQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T94o6yvizssNqyzMVomKgnvKUCLFVEGKhpjCYTMASJI=;
 b=al4HFSjt6hq3TrU3LBqGl2CdDxDJVc5oz5htRBt7ThfPjsoVN5J38UOEzH12j2tc3PbNWzKl1OmEO1rTcHIGrtjSCR/JX9S4N1JwwrG9+QOvAQebF4ziAuJ82EdU+6qKTi0R/IiubXpN9c/ev7AggK+9loOg9uZZgqaO1yYWh5l9zY4kjN4cyb1LaZqWP5OfjBE/BRM5qPf2anDcqvqX2SYv9oXVT6WHIXFINo2yu61CBCKMBarF9HEFC5cdvNepZ2CPDTc2YtqKKCs2IZHw6WOheAUrTeOueVHfrfSMZ7hcYnq++UkiNxJcBKrZUz2ArZGYFLMcMvhg5ZRip7H3PQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB9497.eurprd04.prod.outlook.com (2603:10a6:10:373::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Tue, 21 Apr
 2026 02:37:37 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 02:37:36 +0000
Date: Mon, 20 Apr 2026 22:37:29 -0400
From: Frank Li <Frank.li@nxp.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	dmaengine@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3] dmaengine: imx-sdma: Fix SPBA bus detection on
 multi-SPBA platforms
Message-ID: <aebi6W2215meIQsI@lizhi-Precision-Tower-5810>
References: <20260420100854.2095549-1-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420100854.2095549-1-shengjiu.wang@nxp.com>
X-ClientProxiedBy: SA0PR11CA0197.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::22) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB9497:EE_
X-MS-Office365-Filtering-Correlation-Id: c8d4c334-a059-493e-5595-08de9f4ef2c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|366016|1800799024|19092799006|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: +04c2x5nIgOLQ9fWXxLqxzHk64Am0IiFZuEtDG7tRZlcD300UIHfhZpIQyrv2JldFClpZ4uN0v6ZU/nTh0bm1NA/DIX7ykEysqXho2vjXWB41KBYFtcRzwLeotHkuK4ZSPCqbXxq/utSpVr9bafCXJAyVaw5Ua+I80fBojUt/hlRjE4Kp3Jqy3PMVSPFI3BqNoPmhv2O7B52WuBA5op+NHvZXc9AkBdKv3fLeGcgx9oTnqEo4IixdcLOvws+vtI0q5Z5Vw5ZR8AsJRuoEC1oLjZGxm1uGn/8yn9NTAtt8TCsuiHNTl1twKjftg/cbsUixRPjXn/DSRZJ7ne5DhNGkxUJEmaZldE7uSoSq58oYZCMUF2otcDTcE8Y3stD4I65BGCQw2BZXxjDhrdg3pSWqVyKq4Tx5b6mT/w+L/lLGOW5zicyZeycIyxEMlwqZIHr/YRI6gjcxOaLMYAyiyYGNR6A3KyutCcOmq8NaYOx+v3th7rJslI2XwwTwdFv1umvfxEYFUiimEQwTpxs7AMeJ17IKG22dJ420tjxo50+mN4GOil6cGhuidLwWsUjfUa7uzxkxQeHiICGFFCT+gfHJasI/S+DCD+gyj3YDKgt5qvbXcZSnhrEEq+rzvZuZuMVcOXFQrjR9H9aI56vDXvso19ntBsnGpuLiW19lDQi/v7jg6jFbgKGyQl9a8yKG41klIEbuP3IxpaKUNQTt9qqWrOZ+bj3vXWjuKMlnQ4Q+ExuwC2rJTYeN5g2pOHlIdANwlXgyqtowSBYPY7mr0CyLfxWpSFbZsGYLJ9FUbMQ2KY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(19092799006)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jZUX2CVeUjLvdVGuT0vAYMBSlePMuok48sG7NhNaKFbpQkh+KQrvOV7gTLxX?=
 =?us-ascii?Q?d70IskGQsNzofE0F06p4i6bPcm6YkLj3tg2inSw8NMOrisn1HBj3IyboNXS/?=
 =?us-ascii?Q?t7cnRirn5Q78NGO9L+fLBd5r+Koq21Eoz9JKCDwcS9bGGtN86G7oOSouZacN?=
 =?us-ascii?Q?cbfvDEY5GKmNudivAJ1rJWhO4I6QUJ+jKkFpqw32CB2VE1Q3iiFfHe2aWSwx?=
 =?us-ascii?Q?0syNl/KdCT1IfazvVrOcK0n/JBBq7WkzVK8O8cxj/e4AEKVc4NvHmCwvDW5Y?=
 =?us-ascii?Q?4y1q5zhSdJcMHxLlQqlupxu6NxIwlg82aGmcGN+V30VGfuLueyYUBuzOjIUE?=
 =?us-ascii?Q?NhsR5dkCRQVZbcijjbUIMNm/D4ak0w+fw/dSIUAemjoIxBf4u9GxS75muaCb?=
 =?us-ascii?Q?/jFM686G00g03DLjf3nHiCrgu/RTlhA+0HZQ4Az9Z2MktTr+9xbRzn/p5fK3?=
 =?us-ascii?Q?GWGpcgB5jqGR+UT/e5KNbWuNAzau0UPHNvNKgqGGTeC3XsBYZ0BCamnGYpVU?=
 =?us-ascii?Q?ReUfbwFr5EyVTjMif8yPOYY+zj+iDSS1CtqaZZ//5X1HUiR1gTCxdCV6Baj2?=
 =?us-ascii?Q?mw5qU5TMX9yphrSL3xkJOHhEYoNH5Ln+PHnSgQJbxL/gM2cw2QPiaUNvdf4M?=
 =?us-ascii?Q?ck0u5bNEmfuto9SWzQqoFaHtqY8DlWr8mhOLAxmAWKFfgq5noZ3JJn3sC6qd?=
 =?us-ascii?Q?vgZVAeB4v1CPsh/WGREKxSu6/Nz2oeGU5LJVr3y0hMuZFNzgCNYXLDKUYuKM?=
 =?us-ascii?Q?HPUSMHiuCCZ81nwiGaACGBc6TV6O0Bw+55kpFo/nzbAEfQvAar5KItKGW8z4?=
 =?us-ascii?Q?OMn4nR+UxkzgKVund0/PVvD2Cumg9ZHK9Uy5R3oHlXj4WR4ZSIGi+Z+GxeMU?=
 =?us-ascii?Q?bv0dm3rzrvFWVwlYytkNCZJkgoi5l+bjEDOTsNrJrPbFi0TjaI0ZdlEjKPcp?=
 =?us-ascii?Q?yN+/gN8Cveoh/xQP6+sN9FfN+CnQO3u8OPDa5XRaSVXy850mTHOPKNNvJVUN?=
 =?us-ascii?Q?8XINkQ33EaH1xv0dDrutMVYRHHii6WAjcDy8J4koX51pGTyjLaZsyGsXZGWt?=
 =?us-ascii?Q?oQ3nDlr/ZWszIVZhRRC0fiGo9TVzVIYLV1DYaDirRz+Q0I4HFP9dHxxUEIC/?=
 =?us-ascii?Q?iRmqMyOocaBpaQE6T/Q2QAg2LtUnRdsj58oZs6joLgVaeQI6FtvWqWR6TDap?=
 =?us-ascii?Q?6jXRTRcUjmdC80BSuY6cfMCTRpFrCjCs8h7kVsVZgJSy7oqHKkjhYv5sqshV?=
 =?us-ascii?Q?qxOQBRwOjQj/J7JuLUDB25mbi5RhDVNtJ7DPiXYrIAep12BkRFXZRVOWJt64?=
 =?us-ascii?Q?LDONQXwhw29Q9EYP0rG3RaSQpRlODq0ogYjSi2uLU+ZfNUExp1iEsnsRaDOS?=
 =?us-ascii?Q?/oelXr9JbAmOjf1HuLEAvJk0eyhxN6DoIoPHdhhkFgwXivKcXzeEPFDTFKrp?=
 =?us-ascii?Q?CVPajryf9E2lq/GlV8FLRYf7z7vYKhHlxSGcQiFPfhydy5+q6hjbAbA7fEt6?=
 =?us-ascii?Q?63RYJXKQSCkp6s4JlUM1IH11uWIliJa110b+dcDuoWG5mFec6KGsr+VIrs+0?=
 =?us-ascii?Q?3zCYia/Za2vb+WwAblASkuhA8t9G0nUCpbrrMBONAHBKTcPBnGzsHC0FT327?=
 =?us-ascii?Q?pnph6aWITdpo+noUHti1ls7V/HFHbLvdV8rbPYL08c2C1S6FwM9bBorFyXQ2?=
 =?us-ascii?Q?NRyLzzztmzbR63bQ7XP4lsWMx7LY9vstORdCE41vGPtaBS6yprpjZrXvt9s3?=
 =?us-ascii?Q?oiECu0lxgQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d4c334-a059-493e-5595-08de9f4ef2c7
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 02:37:36.7479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w34rFRjTLgXb85XyIGUptAPUOEzkGy6WeKo3P/f59NuwrjFcj/LaHo8s6Y7pL+g3gWypHZ8egBMYwgZi09iX7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9497
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_193742_856214_8DF632E0 
X-CRM114-Status: GOOD (  28.01  )
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

On Mon, Apr 20, 2026 at 06:08:54PM +0800, Shengjiu Wang wrote:
> i.MX8M platforms have multiple SPBA buses under different AIPS buses.
> The current code searches the entire device tree and returns the first
> SPBA bus found, which may not be under the same AIPS bus as the SDMA
> controller.
>
> This breaks SDMA P2P transfers because the SDMA script needs to know
> if peripherals are on SPBA or AIPS to configure watermark levels
> correctly. Using the wrong SPBA bus causes DMA timeouts and transfer
> failures.
>
> Fix by searching for the SPBA bus under the SDMA's parent node (AIPS)
> first, then falling back to a global search for backward compatibility.
>
> Example device tree showing the issue:
>   aips1 {
>     spba1 { sai@...; };      /* Correct SPBA for sdma1 */
>     sdma1@...;
>   };
>   aips2 {
>     spba2 { uart@...; };     /* Wrong SPBA - found first by old code */
>   };
>
> Fixes: 8391ecf465ec ("dmaengine: imx-sdma: Add device to device support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> changs in v3:
> - add fallback to a global search for backward compatibility, which is
>   to address comments from sashiko.dev
> - update commit subject and commit message
> - add comments in code.
> - add Cc stable tag
> - Don't add Frank's RB on v2 as there are several other changes.
>
> changes in v2:
> - add fixes tag
> - use __free(device_node) for auto release.
>
>  drivers/dma/imx-sdma.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
> index 3d527883776b..592705af2319 100644
> --- a/drivers/dma/imx-sdma.c
> +++ b/drivers/dma/imx-sdma.c
> @@ -2364,7 +2364,18 @@ static int sdma_probe(struct platform_device *pdev)
>  			return dev_err_probe(&pdev->dev, ret,
>  					     "failed to register controller\n");
>
> -		spba_bus = of_find_compatible_node(NULL, NULL, "fsl,spba-bus");
> +		/*
> +		 * On i.MX8M platforms with multiple SPBA buses, we need to find
> +		 * the SPBA bus that's under the same AIPS bus as this SDMA controller.
> +		 * First check the SDMA's parent (AIPS bus) for a child SPBA bus.
> +		 * If not found, fall back to searching the entire device tree for
> +		 * backward compatibility with older platforms.
> +		 */
> +		struct device_node *sdma_parent_np __free(device_node) = of_get_parent(np);
> +
> +		spba_bus = of_get_compatible_child(sdma_parent_np, "fsl,spba-bus");
> +		if (!spba_bus)
> +			spba_bus = of_find_compatible_node(NULL, NULL, "fsl,spba-bus");
>  		ret = of_address_to_resource(spba_bus, 0, &spba_res);
>  		if (!ret) {
>  			sdma->spba_start_addr = spba_res.start;
> --
> 2.34.1
>

