Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A37CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 21:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FE4OazxnEuEqsJGj1oqKOojLfAER0Hnx+HNfebjuNlg=; b=oOix5tr4DAaHGNbKFaZ3uYThgY
	ShdN/J7qreA2Z28OTt/48L8l8oRKTdnRcuQSBVAzPpGnE1IzdcTDuj8ot6gZpIACQpYijlvHjqLQy
	DZx+7RTDqy0K62nVQDqD91dX5bi+O4Zcl1mTH2RcZo5LotplC6rwK/3dFALiuefSvNZ9DVFMuOhNS
	gOB5/hWpUNJBEltpB4gkByOq1VKxcuGBxAjjIfVUJLqZIcQzVGjQuusWo20NTrLcM4p7UE7Z6M7vS
	+X/oGJmHuYlPu4LRcP/mBnq6V9vkh0RJ3AtOt0GiWw8UHvX8DyZt91xVG78HKM4rk+x5JNwDFhLO8
	WkORcztQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwRzF-0000000GlYn-2grO;
	Wed, 10 Sep 2025 21:04:17 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwRzD-0000000GlY5-3hr1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 21:04:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=On80UI0SxHn5514p9QFurIDQb7KUQt4+fLBAg4qjm4u/Pq9QXpvSj7gjmv6uYKlnvEOk1k9gSnjS91qUc4s+WrzaABeieW4zzO5D+fRaN4oCWkGqZGM9OYiKF0Avo5DlKkf6QZ1oOOXGHdGQQL4SYEDLJf+f5zim5kNQ5dhDYB6brDbbT538OcwU6e38PcIgh2R8o8CDLEPSGCmrt5nimwAt1aNL9F3uRqWLpxOhU+XdtdSRdl66S8UcoHsYxZ4jxFLAPZZwuDYJtKovpQuSwFqAnUmhJ+BaDChW74c+ORgeL5KlvWUKI7T97YelGGXxr7G2LL6bKU0n7vqJK4Dv0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FE4OazxnEuEqsJGj1oqKOojLfAER0Hnx+HNfebjuNlg=;
 b=h5YY+0Bw+AYefJEkP0sjmcNTcxgMMxgdCNSe8KHZRcD3cWeIbf3YqepqKkeAwcpiniqVZlHYYsZ0uW4cOtJiJLY4K2eDQIOSa4MNy6dFHFKWxHa4K6OmRfcgXKyMBHQwZu+Yr0Ej03b9qgfT59DDPaKydUxw3om2KPYt2mk0c8/9aexwqSMk/M9Odi/46QxFlHdP04cLvxSwWrpetE1/csYSZF4jniPOaBY14L9A0Q4X4Mwt9AT89u7gVNtZQXhZa13R8QqK7UCwJLz1kmjgh+FP/ZbMA2wqgRF5KdbHGyiBVUZ/6UC+0V7kT+UFnKkp2YJdLlFIiWBlezdmBvO4Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FE4OazxnEuEqsJGj1oqKOojLfAER0Hnx+HNfebjuNlg=;
 b=aGu7WLaGKvckRWV5afLVmdnNLq9gIwYBry230dNFLoh7LXX9Sgq/KLBeaGiYKsZa2TUwJsUXCClyVXv8syLTC/EpTPi8+v7pjVqGX9Obb51X/W0Z7gipt8azauKfNn2Uqr4VUsUliPvFn0lNahll7R0FCzD3EhLBdXF0KhJTdciwqU3ZinJBf0AeEv2U/rPbLswzxwXmuFVbygokUMZMuSZpHzXoWMgO+wiU9ps4midL3sdhr0BnxFySGEL+IunOgYUryFKgglcnkNqJiD1WLSHalZW3fJu+tM1cBqKvFabD1t4hYArxbnZGPFzJ/I3ejNL3X9KSZ9wMfYf89ldrlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AM7PR04MB7112.eurprd04.prod.outlook.com (2603:10a6:20b:113::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.15; Wed, 10 Sep
 2025 21:04:05 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9115.010; Wed, 10 Sep 2025
 21:04:05 +0000
Date: Wed, 10 Sep 2025 17:03:57 -0400
From: Frank Li <Frank.li@nxp.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: soc: imx-iomuxc-gpr: Document the CSI mux
Message-ID: <aMHnvSMjAujvRb+J@lizhi-Precision-Tower-5810>
References: <20250910204035.540945-1-festevam@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910204035.540945-1-festevam@gmail.com>
X-ClientProxiedBy: BY5PR16CA0002.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::15) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AM7PR04MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: c3684ede-f955-4c48-14b3-08ddf0ad93ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|376014|52116014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?M+njKlx7j3DvE0ZU+J/dcUYWUy60XzPg94ntP1rgBPqdcX0wT9T9SxO4Z30J?=
 =?us-ascii?Q?1/Ren2NjmwwfctUD79GAuXNO4SMc0bYZFs3SspJcTlHkgUO0lW+SFue9XOHJ?=
 =?us-ascii?Q?xsfpyD9EjglqtMWH4Vc2Y73hkaPdEm4ew2P5ys4l8KRCP/qwDhaRRKDbLcGB?=
 =?us-ascii?Q?2YdBSDjn8L6jze6OCp5IpSvI5zeQObVGFzfBUDIWBQy07VNF3sikero5eMPj?=
 =?us-ascii?Q?hocAPfwNlSdxDW2BjJjvWHtVCcUS78fktC6Jn6DA6JAuuvGWe4DmADSOJgKH?=
 =?us-ascii?Q?FQBAUELZNDK6ImLERUGv4MR7auehT2X5P0iNleSXt9EK5xUX2XlLb3OdvWGv?=
 =?us-ascii?Q?m24X50rkqJYNnLm2z3FOcjznd8b/lCa0HqwoYQHHXdPOvi7yoHaxZAEKu1ep?=
 =?us-ascii?Q?LKrvbNFIvr84tNdN3OBtlBZdu12eXPaDd4oNJKKnk3ehhYeRe1rlgS5RYYdo?=
 =?us-ascii?Q?rlDfOjisMcsDOelNQZfM6y/WOIM5OTA04Jeu1DzRZYfXiY/pzaB9HUPibVkA?=
 =?us-ascii?Q?iXSUmjZKKYeA7lFWDTDDtDFeqzgDJv1GKxXNlP9xJJ1a6o2n92/exoLDhgE4?=
 =?us-ascii?Q?8YpA1rB5HR3DpVol7BnGaoKDUk0bJoyW5Nbo5JUt+MaZAJs7RbN9ONv98ulb?=
 =?us-ascii?Q?SJWVsNqv3DvOOXXt2EtBvvSEcqutMSyrBKXWXX599ZtU8Hut6ESAzC/uC6MU?=
 =?us-ascii?Q?puucAjmXqww8eOCIHLQo7cjq68SiEEFtZpYlzRWTdvvOGFlasXsOpYnUqPh4?=
 =?us-ascii?Q?b09NyCETfI7JMJvaPE72wIbmBaE0+l6PY/aMXDbg1lgNsFKYHNtlCqMLggdO?=
 =?us-ascii?Q?UCIoDKt2jshp2+7Ce0gBSGLLBLOKtbcUxlQL6i6K1Xocu1kFuALM26eLHWGL?=
 =?us-ascii?Q?7Dlvpd4xATX1e1qwu4j9WI4BhBpNhr7EaQjJN5Iaf3FWpuj5J46YgjvYK7lz?=
 =?us-ascii?Q?0JUbyJn5g7A148VDPrn2d6y2LQtTiYKi2nOqNpe1be1c6b98XIwzx2of7kj8?=
 =?us-ascii?Q?dwExUv8E52W6gj/vYgEOPs0vsNgb2+VBTrcBaZEdZ+u4Ucd3i3bJiAZlBeBX?=
 =?us-ascii?Q?/bDSebbNJk9KRzAH955q2kjan6pNHpD3WUFmTVWltKKTWUm9EqaYruLAIhNf?=
 =?us-ascii?Q?7fAV04sgGpdABQZCVYDsHhsonlVJ/meKtldk6ExbvUqawgUonnw7/mIuZtGG?=
 =?us-ascii?Q?vvcc0bVgd95wr1BRKV/HgDEChdn3LpxhSP4OlClRGYprZ6/smMLeK1akuDi6?=
 =?us-ascii?Q?/ABzu82/p2SxMm1TxwNSAjc+gqfn8s9Z7Kgx3PeFdiDCdUlw/Hm1stGdriYR?=
 =?us-ascii?Q?d7mv32i73u8NH19nx5Dj3bFe126BX76mcp2lhbq0v5SELfw7Et0qQ8wZvFUq?=
 =?us-ascii?Q?z49GUGWUc6MJBO0ap5YjaHHjMfASgd6xrl8+k+iWTKlKj4daNB3zcj2VBOcT?=
 =?us-ascii?Q?HGgY3BOWqR57sHikmKvKQsTFKNkNWtpNZGry/DpEGNG9AdinWuUWf4NA3YN4?=
 =?us-ascii?Q?kDaRMen2kTeFvDw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(52116014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?29O+VG2+mxrVYzNnHP9IhNlnR2BFz4dWPQk09KzO8Zcg/nU47NoJo2RukcT4?=
 =?us-ascii?Q?bCZNIolAiskvjIX49QG/ILoKebBs2Rsi82vWo6P2ZJ5ZKSQMQjGNkNQRLwbv?=
 =?us-ascii?Q?2oLdNyeO+p5Lwk6SV/1t1cPQsa/hNO4nwwWnMbEYm4wNtzNj4SrkBOMGoPVQ?=
 =?us-ascii?Q?ynz7kihF4Lq448/QR4JH0ik+66a3vMy33SIBVH/cYdLqIR/Mmmn+3RwYLYIQ?=
 =?us-ascii?Q?/Jkk5MCA8hRpnDdK9sJYfFqUysquNOL6FPUseC13knFtid8BXLbkqClJVqdl?=
 =?us-ascii?Q?OeH0I/1krl3tEqjfD3VfMfB6DiC/AA0nn4lcRoQUocp22MGVlbxpJNDnd2qN?=
 =?us-ascii?Q?UKoZ/Uh7hw0SASU2c4Az2QxD1vY6xqGjAwNwR+67oTTKhp2Ty+rU4pHTywOB?=
 =?us-ascii?Q?OvPUVn2vcVwzjFNRbv2ws+cJIggctAm8JDnqAQey20chFDdGPRWS9dzImLOx?=
 =?us-ascii?Q?1V3PggXRHi5rgvhMHtfEX00gJr0Zg6GMOLUe81O9ttq1QYb40wIEYKqqZKaI?=
 =?us-ascii?Q?PigsaQyFOgsUNSqbo1q9N35d0d3seWimeaXE0FnJNfZzAjvzF0j+DpzeMR3W?=
 =?us-ascii?Q?UST6C3dLwRgUcRl8SU7pYSzmXqNB4iv/T4GGepGjgJp+x7nCEC6RVOMsGfLb?=
 =?us-ascii?Q?az9PMJEIFx77i/ewfDmY9HRsWc82esIocsi4Nvrg6sG/ES2GPwXGiuX8SSKS?=
 =?us-ascii?Q?8aVjW2I7vA+Ti1ESKfXEt+gjaADgXH4VBgaB2qe46x7yLAAqgLkRNU5USEdJ?=
 =?us-ascii?Q?leKYnhHrzt3tzDVV1Q0nxpddi2t6uAWcGvis4LpKVORpAwib+4/vFOveNukb?=
 =?us-ascii?Q?NGZ27oFu1kNgseOa9x7bN965u81RiVXwmRcDHiFjhess+y4RBm9h2sRQXK0U?=
 =?us-ascii?Q?35U7g8Iq/iYuhEPr7vGKsIxaUpu1ZCanRW9zxGkW7DrnddHDscqW5nRfMqRx?=
 =?us-ascii?Q?u8rkmviy/tCUE5UkYkKFLTcRlqyJzNUTuMQNxwh/c/LEvFJgK2oI0xh9fsi1?=
 =?us-ascii?Q?BwU4EHLIRVEsFTdAZvWptwpMDiRnhyA0WFlxFDEt3lP+srW0zD12U9Mg0Eqg?=
 =?us-ascii?Q?yqtJBAoIONKo6xwrWqmigw7okDepy5rH56nNO+3vfSYitgQo/95Hk8b0h7OQ?=
 =?us-ascii?Q?kGtzAuE+2oSrn2g17PNurJ6ZPpL6ivpUp5FZ29g4FmHoc8uVO57ndMxZjGE5?=
 =?us-ascii?Q?VMkmBa5cVxoeaD8//CghZVfvthQ77viwdl5HpjJfL5dK6BLUfCv+y/Cbv97r?=
 =?us-ascii?Q?Wkqq15lUIQ2Cxjo6uz522vxAZ5yJjV2nJZvwTlF1tnPWrSUy/PmeDdxquh0S?=
 =?us-ascii?Q?OLyM+OgqnorMwukgkHWB2TznVvEVhyX4T7vEhEDwLenY0wrza0Ntbq3QP/1r?=
 =?us-ascii?Q?vUxS9vbHjWSq0pMgaxYDbeFK5ikcBrGG2t0iMT93GQUNzc/HoWuNCTzA9Yh5?=
 =?us-ascii?Q?ZHVloXHVryMCVKabK/xOZzSWTME+7md9Q7mDtpenigGzpRD9rQC//msJu7e/?=
 =?us-ascii?Q?cvHzpf/4uoBpkMNkIACaCYUpoTafNl5H5AsQx7sVvO/qKcBn/65hzWxwvd0O?=
 =?us-ascii?Q?nA4wai3nUFEgrQjkeoEgtLXNrrIfNOGJSBDYX7e5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3684ede-f955-4c48-14b3-08ddf0ad93ab
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 21:04:05.5992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZ1WOw89zNDE5tZLIojWUjsMQI946G6Skaht0HX1Ch6KANUhKZVk7UwWtc/jgJh37hIjT6/DW44zi7JouaJulw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_140415_942989_63FB20A3 
X-CRM114-Status: GOOD (  16.42  )
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

On Wed, Sep 10, 2025 at 05:40:35PM -0300, Fabio Estevam wrote:
> On i.MX6Q/6DL the following subnodes exist to describe the CSI port muxing:
>
> - ipu1_csi0_mux
> - ipu1_csi1_mux
> - ipu2_csi0_mux
> - ipu2_csi1_mux
>
> As they were not documented, dt-schema emits warnings like:
>
>   'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes:
>   '^pinctrl-[0-9]+$'
>
> Add a top-level patternProperties entry for these CSI mux subnodes.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  .../devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml      | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
> index 8451cb4dd87c..c5eea48c19fe 100644
> --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
> +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
> @@ -50,6 +50,11 @@ properties:
>      type: object
>      $ref: /schemas/mux/reg-mux.yaml
>
> +patternProperties:
> +  "^ipu[12]_csi[01]_mux$":
> +    type: object
> +    $ref: /schemas/media/video-mux.yaml
> +
>  additionalProperties: false

Need disallow it for other compatible string

allOf:
  - if:
      properties:
        compatible:
          not:
            contains:
              const: fsl,imx6q-iomuxc-gpr
    then:
      patternProperties:
        '^ipu[12]_csi[01]_mux$': false

Frank

>
>  required:
> --
> 2.34.1
>

