Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A014E6BF1F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 15:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c7qCNVrRFkd0ftN72A4k9TptEGPlOOp1rhmfU+DF4z0=; b=Z6Ps7VIykHwBu5dtSvTX9Sn+Z7
	XiVYre7kXVPsxaHX+HrBr0gJB3S2yRrSrXXSWdnqpPG1CjYt6GlCtaz8+PvwAasg2jBls0E8nIQ5C
	fHP2tJW67EF1HmGDtJOGx1IPT2UFOKpzLBa9VXZzeulUvDECHCcH66sVKYnG7LCdiEtZ/sYXVS+Aj
	ggr0HZac4zFDcLRmh4QHvFNty6f2Sau+VmXOXdKzDeu1JskLxExSGFQF1s0f24uUW0KIlUyCoO3Y/
	+/f3AfElB3nYgZa1nafxQHBGqy4MiqwV2fxD+8dGvgrHoJZMnrbn+x8j692E0PM3oC/9X0o2v+Rh+
	963u69/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlqVs-00000001es2-3bET;
	Fri, 30 Jan 2026 15:34:24 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlqVq-00000001era-1KyL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 15:34:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XwrueY3UvW3ExuAGstYmoIIVch1SqqaAMIgrXpJgsqvmyYJ32ssc4tU+elm++vmdZwptu66kHr7QCWcgQ1rvmwE0gSAEL0He6iazgb5wQSDRdeDI0t99lglJPshUqjlQRhDCWdxMe2JGy6kLIBkh6Crh4iNUeYLYc45F+vIptAGe3JzKrDu3PtG335Xs+WE1s4uoZy6Mvl+xPmUE+EH+Y0+UGuii9xsdLQh/SRj3jn50guPrAH+gSO6EJf04TQK6KJjabLaRO+4fMKdFBWal8wh71zjVoJUza3Rj2GN0J27rg2bx9a3B4KgJk+hxVNYmLShSdWopgMBQZVxYhvNggw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7qCNVrRFkd0ftN72A4k9TptEGPlOOp1rhmfU+DF4z0=;
 b=f205Ztxl0RNUgafFtUeVgcRmZWQlSiOdM/A3+QlYwfHAL+1Yx/SsuUWC6Fy4xChacSSBkyX9iJMmaFwnQwZ+X1GYFfNK6j0SnHsoBOKLovQ/uZAXsGjRQnNXW0wbSBNgm2dyiR8aMMDuwPDhRBK+9+PUq3i4P9YjRwSJ4r7vITBVQZG4vXNBQlooWzNg3ToXrYqYGT4SqUhB3HNBmg6/cpZzY3UQbK7lOWp5OW16DyTyHPEAGPWYvusmdjJ2Xi/n8ZDKDMuw0w899JNy1TAh9xM9L/dcmLDm5k4MV4HGrYrYcJsdndzv4BQVt/BOhS2v96y+mYq+QYcNldbTHnErKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7qCNVrRFkd0ftN72A4k9TptEGPlOOp1rhmfU+DF4z0=;
 b=LSKGoflcl3sQsbYvbJTN2q72xkHwxe/b1KwPsch8K317/gjjYss4DhSjBjhDLGdyIkNIZnVqHCTHSE8Ijf/DozivZwfusxbg2yfZBUEXNmfS8NTUklzpRYSz7eMEJQPYP9HB8Iaqjpq8iRtAUYuRI2Dk2ymEhjyR2nWyUgZAUqBF2nzxWVFQhLRr7gov2nB26EZ06U+phogx4YPk3doblKXjPcXm65YmDkulMq+6mKcQEJofcrxLNMg2lAAYNeHrp/YoFa5j0HAxTVyGjKkfvFI63j14WZqx/gIRS5aphnK7c+QI6hI5LAoLZkppQiITanl4fxbyldv/9YOz1ygr+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS5PR04MB11466.eurprd04.prod.outlook.com (2603:10a6:20b:6c6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 15:34:18 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 15:34:18 +0000
Date: Fri, 30 Jan 2026 10:34:10 -0500
From: Frank Li <Frank.li@nxp.com>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Cc: peter.ujfalusi@gmail.com, vkoul@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com,
	ssantosh@kernel.org, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, vigneshr@ti.com,
	r-sharma3@ti.com, gehariprasath@ti.com
Subject: Re: [PATCH v4 13/19] dt-bindings: dma: ti: Add K3 PKTDMA V2
Message-ID: <aXzPck9B6cTsTTwU@lizhi-Precision-Tower-5810>
References: <20260130110159.359501-1-s-adivi@ti.com>
 <20260130110159.359501-14-s-adivi@ti.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130110159.359501-14-s-adivi@ti.com>
X-ClientProxiedBy: PH7P220CA0046.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS5PR04MB11466:EE_
X-MS-Office365-Filtering-Correlation-Id: f2d9d47d-2800-4856-8ce9-08de60150853
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rGfXNCDj5nJQFwfVEm3B9FdDAKmPuqv6wp2BB0bVNyuPD0TJWWViJmovPq4+?=
 =?us-ascii?Q?U5OxS/5RXvWYnJvxgRg5N+Bi7Y3rTzCMyD94McBTcdQzV+pXobqmA0b16OA/?=
 =?us-ascii?Q?CyrdijcCAyJVypY7Qh2qfHlq++vnfb6LAZqSoh5rt2xaVn/YqvKxecIxY8rZ?=
 =?us-ascii?Q?s/7FVTyAiLUjpIvVIZDYhMtypQS7va2WaBrsM+OAxW2KV6imoW1Jx/wARXgx?=
 =?us-ascii?Q?4XSIboLNGB92/fEC3MymqQFX9a/LaViM/S7q0jler9WG4Bl25Wl1ZlRJ4UdB?=
 =?us-ascii?Q?22gbCyv+wjomre3G/HNmhaNUZ/POXyrEGRO9r9TBAZRRJSm3QIzpIvJqteko?=
 =?us-ascii?Q?6M5FgytOa2zsukYmaxXGoW2ygbHVlopgZ42AIqnaEs4yBWb09Vlf2uv32UYh?=
 =?us-ascii?Q?n4moXtaVrtAWlmVLo79IhipB6SlHgg0KY3Z+5Pd9LJ7JW7YpzyTvZv3Svo9p?=
 =?us-ascii?Q?dXpXWE/QIXhxPzffIxUUT7mp2mMa671DlIgoGnKggsOQgtkUrf96fzQFV+FX?=
 =?us-ascii?Q?+6uO/SQt4W0P+w2oMN7uwWcLBaK15OLopemMfw31VZkqcZjYm/ib21qs0NMF?=
 =?us-ascii?Q?fqRPKlubHPXEQZDTvBe79g/VngxDp9n1TmJ6JjI2FVZOriFYqi1EGTb3upPE?=
 =?us-ascii?Q?G3dfW5+E/yFM3GGjZr+oPLNQIt44+K013OIYQ7bd3oZj6A7n8tympMTGwFDf?=
 =?us-ascii?Q?HpKXuhn7b3j7vpuJ9/R0/F90GNAgTZbG8JyrNNIDu0jkpdkWqAETHv2C51Sl?=
 =?us-ascii?Q?2MEkycNsBIftPV5O2F1FMsw3whLnywIYXcKamVAjmzJPM+9TSdD6de4ytHb9?=
 =?us-ascii?Q?b7WO+4YSY8x3Y22gIX5TR51hCyPgP9yqcfx47CD7RU1i4i5VzskuE4qodfMR?=
 =?us-ascii?Q?CD9uPdbqfssGWeGZscQMQYXhLtaC+WvwRKD/pZcnsC2+8v3Etm6aF9u9zSsE?=
 =?us-ascii?Q?k6dlCysYZZ4BreyhSiawi5LpnK8U4C7drq3OLcND39DPS/0Cxgm/pRgRdcj5?=
 =?us-ascii?Q?Tj3yXh8Fzc1amaEe9bH/YKErsEXmNwqC7c/IfpxDtzZsD7+tsXaVMOuSW+gP?=
 =?us-ascii?Q?Va2ahJelwRf8c8vi7uvIPE0kWqLtBoQ/O+6ms5UWR61wphcxj338QXDqykrl?=
 =?us-ascii?Q?CD8t1prrpyno2bFIweUxxpuTnBMDogHAJdc1LSdJ85yi91t12Rw1zxin1NYC?=
 =?us-ascii?Q?Ih+yq6hy835LSdDiq5CpkGCbKjEZEMEnXy8JR7xf7cdxzeo4qDS0jJaDB8Ze?=
 =?us-ascii?Q?cJ7W8TpR0wj+6oNgBTkMNdooEV5MFSe7rPEOAMT4ZOELd8BMJ4ZKMMqDGCiS?=
 =?us-ascii?Q?SVeovFKJ7N6kSBLsSjnI4aHU3B7ycAtJkxahxkrKrXW2vOGbSZrRgwpc+dGt?=
 =?us-ascii?Q?/E7o3JGG2NKK3o4kK/gTr4ufpar4g0fs0TiX/00nfSwWf2QZRz36gBzAtyvM?=
 =?us-ascii?Q?zhHH74xCM5ZaE2gcdfyoSvzmCVhHRrmbgLIDBHZhHQ4bB7m8x+nSTIy5Hqgh?=
 =?us-ascii?Q?gCksXvWw3nKfkQwoHqxcvCM5N9OEDX3PX24Q4UatoJOK5GE7A4VPBmYUn8w2?=
 =?us-ascii?Q?KgYAvpCZgM3KrEKuujUMYaRzDMZC3WXXfAxiwLst?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zmReDAaz7/h9cImthP3eHUoIewWtZtsyvzOvzdO7tDcOJ8NvuUDiGNmAVHPG?=
 =?us-ascii?Q?VzJGmNgvuyiGKCWK6NXZ77mtuZ+1m4i8AvdapJGjWGhRBNgnbjvme/swnSC8?=
 =?us-ascii?Q?tdYP+Uzd7G/kNMQshmyCZcSjYhYbvo7MTwbNm/VmoXdiaJlCd3OFM5LY+3+C?=
 =?us-ascii?Q?Qhg6P07lV0RKueBiBToJPXA3PGSxYx+N9osvN2b/w/zAMnrzCPNtPE+RQZxO?=
 =?us-ascii?Q?xvxPXukUMgbeVREy0r6XmWSupCkIXIuAfq20PpPHw6Yk7LPCCm2xSLxU+oj1?=
 =?us-ascii?Q?gLdwgfxeiKS5T4FMBu19mQAfORYlI6AfXiQC7N1fpA4Yp8QpqujJ9KjpSNSm?=
 =?us-ascii?Q?M2Z8owQOdFF7DR+mmGv5TOwyvLmP2QikO50eVVkfJ0/RJub2I3E6wjzHs+WX?=
 =?us-ascii?Q?8VK5mqraHUns7LSRjv/d0dF+S8RVlQRcf/wrKK4pq4m7EBSp5Kvel/LJprqy?=
 =?us-ascii?Q?5w2brXpFYT+b61Mvf9s8e6gwtiUaBH2o7pp33d4gEFz9lF766AJY7LE18JZQ?=
 =?us-ascii?Q?vxV1VYCMZZJ+hIJxmQb5v32yZPU7Cbo+ncp4sRKv5RGTQFLjlsqEuwObSXVL?=
 =?us-ascii?Q?7KYgP3ntIgFKbj82j8jMJbIj/lw+2RkeMAjPHLB0BW/C76owIfiV4S6Vja0F?=
 =?us-ascii?Q?QRAgQuR0x8lAl4xzfIhfIPRxTlYzWoimOyewFeuVYl9/5vgFT+4oOxbq2fHW?=
 =?us-ascii?Q?L7Wl0a8jIFLAPTym1BDDBgGX9lfUhXROpHaYnMGcvcUFnFzzUefgn9/mYXS1?=
 =?us-ascii?Q?EV41Q1UAp9NhrOphkkWhXNrKjVEHTwUC9VFIZVMuIUBdQsWQD2DYQx/wMwJe?=
 =?us-ascii?Q?7qqnpzrN5BfJ/L54M5icWXoM9wJ2LV8sE5kzgzcV7/dnqgQzvPjX00tpxmoH?=
 =?us-ascii?Q?GLmztDJfo+uPz3kdXuKQMVVsqROYjOh6hJ+xDED3AYzTkJacErzqUFCUXhJy?=
 =?us-ascii?Q?ATcOFWDwZOwhqpdAr4QJEAu/MZFAfLzYAe4XmjZiaJfMfAPlfIsMicpJXToU?=
 =?us-ascii?Q?wcRRCb0yjsjW+WusQfNmzg3yMVHdz2wEUqeTgpeG8ww7ZDvDiXmdW2UcsdTZ?=
 =?us-ascii?Q?IarlN5vASBIXcJRWCcpH4vwlqST1oZnjqQt3DQhnCMppUpOuTHAFO0Nzhfo1?=
 =?us-ascii?Q?xqBXxM5xbbmeEVDstcaTptre40ir2pdFf2Qc3dTSMsgwdYQz1xNxVQJOZPEt?=
 =?us-ascii?Q?3NdOSP3+2YIVUQRJqn4JAUIVAkUcfwr68dBmS1tvPKEmMZ+Acp5ptma5GwwW?=
 =?us-ascii?Q?yrYErH5LJJLlk9xrNe7ySWQhJtkNkUed1Qg3hi5ZlWCX1xUAMcjLzKD7NI73?=
 =?us-ascii?Q?wWIi4D981ieibtgM07Eaib1hYsnDFWJ9J0Tm8F1WBr8LfgDTOH/LMJBXjEzu?=
 =?us-ascii?Q?jaydgNJNX/qJ4OnB3cPl1SfK8RPJVpUWVtTT2mCAAAOffsE/rxR3bznd41Qy?=
 =?us-ascii?Q?a33GCt9XFGrypF8LzCEktPenAPgnX06UrYfNVrOxVqRfRjKcxzYysjfVuI6R?=
 =?us-ascii?Q?mr9J9rijgzqEkeb0pKObRcVTvfqve0MobJhgxIzMMLLwOUw6dbh74/v551Oj?=
 =?us-ascii?Q?5U9OgDUnAIpy7PCjSobpF9yGgopc3pVLUyexD3a00tdFirG38BWHx48KhKSV?=
 =?us-ascii?Q?shEJ+/vFaDBeNFFeDv8dHUvCwn/unUYl3hn/b+JWbQrVJsZCCpp3BfjhoEec?=
 =?us-ascii?Q?rSAP/r1fp0+XjKSJ6CnIIkYJP0RCd6uW7IYPgrat4hY2WpjIIQz5TvH/OfEn?=
 =?us-ascii?Q?pUbePwb7Fw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2d9d47d-2800-4856-8ce9-08de60150853
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 15:34:18.5737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Exlz/dqrLqsqGmbidevSRe+JpAiBO9RpbiyJKv20KgPDzNd9FDHTZRbu39lF0PAK2TRNYctm2baC5NCbn/ZTiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11466
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_073422_363456_4BC0EC2E 
X-CRM114-Status: GOOD (  21.74  )
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

On Fri, Jan 30, 2026 at 04:31:53PM +0530, Sai Sree Kartheek Adivi wrote:
> New binding document for
> Texas Instruments K3 Packet DMA (PKTDMA) V2.
>
> PKTDMA V2 is introduced as part of AM62L.
>
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> ---
>  .../bindings/dma/ti/ti,k3-pktdma-v2.yaml      | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/ti/ti,k3-pktdma-v2.yaml
>
> diff --git a/Documentation/devicetree/bindings/dma/ti/ti,k3-pktdma-v2.yaml b/Documentation/devicetree/bindings/dma/ti/ti,k3-pktdma-v2.yaml
> new file mode 100644
> index 0000000000000..e8afa6f6738b7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/ti/ti,k3-pktdma-v2.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2024-2025 Texas Instruments Incorporated
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma/ti/ti,k3-pktdma-v2.yaml#

filename need use one of compatible string.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments K3 DMSS PKTDMA V2
> +
> +maintainers:
> +  - Sai Sree Kartheek Adivi <s-adivi@ti.com>
> +
> +description: |

Needn't |

> +  The PKTDMA V2 is intended to perform similar functions as the packet mode
> +  channels of K3 UDMA-P. PKTDMA V2 only includes Split channels to service
> +  PSI-L based peripherals.
> +
> +  The peripherals can be PSI-L native or legacy, non PSI-L native peripherals
> +  with PDMAs. PDMA is tasked to act as a bridge between the PSI-L fabric and the
> +  legacy peripheral.
> +
> +allOf:
> +  - $ref: /schemas/dma/dma-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: ti,am62l-dmss-pktdma
> +
> +  reg:
> +    items:
> +      - description: Packet DMA Control /Status
> +      - description: Channel Realtime
> +      - description: Ring Realtime
> +
> +  reg-names:
> +    items:
> +      - const: gcfg
> +      - const: chanrt
> +      - const: ringrt
> +
> +  "#dma-cells":
> +    const: 2
> +    description: |
> +      cell 1: Channel identification for the peripheral
> +        PSI-L thread ID of the remote (to BCDMA) end.
> +        Valid ranges for thread ID depends on the data movement direction:
> +        for source thread IDs (rx): 0 - 0x7fff
> +        for destination thread IDs (tx): 0x8000 - 0xffff
> +
> +        Please refer to the device documentation for the PSI-L thread map and
> +        also the PSI-L peripheral chapter for the correct thread ID.
> +
> +      cell 2: ASEL value for the channel
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - "#dma-cells"

No irq and clock?

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    main {
> +        #address-cells = <2>;
> +        #size-cells = <2>;

If use 32bit address, needn't main

> +
> +        main_pktdma: dma-controller@485c0000 {

Need need label

> +            compatible = "ti,am62l-dmss-pktdma";
> +            reg = <0x00 0x485c0000 0x00 0x4000>,
> +                  <0x00 0x48900000 0x00 0x80000>,
> +                  <0x00 0x47200000 0x00 0x100000>;
> +            reg-names = "gcfg", "chanrt", "ringrt";
> +            #dma-cells = <2>;
> +        };
> +
> +        serial@2800000 {

Needn't this in example.

Frank
> +            compatible = "ti,am64-uart", "ti,am654-uart";
> +            reg = <0x00 0x02800000 0x00 0x100>;
> +            power-domains = <&scmi_pds 89>;
> +            clocks = <&scmi_clk 358>;
> +            clock-names = "fclk";
> +            dmas = <&main_pktdma 0xc400 0>,
> +                   /* tx: PSI-L thread ID, ASEL value */
> +                   <&main_pktdma 0x4400 0>;
> +                   /* rx: PSI-L thread ID, ASEL value */
> +            dma-names = "tx", "rx";
> +        };
> +    };
> --
> 2.34.1
>

