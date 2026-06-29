Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC90C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 21:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ZlLJ8eKeokazvJmP1FmZ3tWkJpJ2bQi4AHoWyzKyEI=; b=Oxx1oFZtUyFnSc20EdrJ6v3WQv
	vMq6UFn9VCAcVKS697Xqv06dbjd76DJakendyq57F5UG05EaEonwOuF2YopeagVKN1RY9+cofPwwz
	r77I4emNMkvfDJ8sNdCC9F+2V3wr9K94+Yb//160mejibWdreUGodQUK4VQSbhsvrNLyhq1gSdLqF
	xMRG7Vj2majA+X/44YNaKP1/HYqTYkmoSFB81kAAD9PEsEwwNlxcukxJaLcJBiMosajWkxRPeYGZ3
	x4GEe+EKBE1fdxyOVJiAq+pu5U8ZLZFEZSPm7y6vTXx5Q+XyJMgcKv9tDPM4KRjoizmkDo7a5t+bu
	85JcRDxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weJS2-0000000FVpE-2UYS;
	Mon, 29 Jun 2026 21:23:34 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weJS0-0000000FVoq-1YvQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 21:23:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QbI3ZjOKsFMRd4Yqxk163dHW4FLhGwLb3tdqdddqp5HhwN27LYH0MXh7pBboG/kB4wWEV+JKW0kogxbz0IbG3wsPqvh0NdzRqhpXaQFMx9a0T6Hhl8iELvKxUBrtcT3QzITEyQ535ESUGZ2vBrJYgBcUXOzo54YBC0/8MHkrjYGSlsN8yoZTI3va47P2tmfYJz69W0RTD/b+7PrLudWO8VcfT1KFqcpSN5USvS6RLxXiowKb/gyask3Zf6qhjMqK9ZHKipEqM8UfxV4K9ay4664SpG/jMG6rx9DvfFKOUAUyZTTJKlqv0ychQ9ivsQpGbf+cFSY3Wqg+503zq/J+/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ZlLJ8eKeokazvJmP1FmZ3tWkJpJ2bQi4AHoWyzKyEI=;
 b=MnmTzUXxA7vQPqeofSWP1O+yzQkihc9u0BbtRjQJSrA8PaBkcOYK7RoWh6pwXIOnVkjkvKyzcvPKKXkieWh2va99FEO41IxIIQxpNlrWf/STw2JFrsCvtFJqwbDLEuCI0MuhNq9kF0NHOEoaeE5/xrnBm8GtGf5tek6k8Qn+BdFgpxGl+TCH71VOOlEyDgx+9oPDMw7mkimrXaxkl9OkLsSQzxeid9INONggxt334ItK1JorrLfLAa9/oGwKpq/dF5YURYnaT0wbp9j6AKYDGsHaoggIVZqKdTdI6VeGcvweW2h2MBcyDgntvWJUkbh2J+8RmChXE4dmlieqb+NKcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ZlLJ8eKeokazvJmP1FmZ3tWkJpJ2bQi4AHoWyzKyEI=;
 b=ZzDuV3vBuXvBL8pGavjc5gj0JDIl9osWlbuEsh17UX2ZWyg3G3OhicEa74w+iruZPz9zwOygw9MTZDKXhGdWptodhi1hTCAPDQ15aBlfTpnsfQLy4vO6F+RiFR8PdcW5PTYC2pJ+k/8c9G4KwRYyvMVmvTzS0lr0xoPnTollagKNhct+n8dAk2NdTAPT9hKSJHTXFhnieTSfYizzMLPjF+mD9urqhvBhG000jfDsi62tYubactucmrfI5F6B++Xgk8C3eU3Qz+PwgtOmjQM4FfhNsHWYMyAMuZh5IMG/2+tjok31aH1snsxR21OPzKdvKzfNtORxORncABHRaXPlCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB10305.eurprd04.prod.outlook.com (2603:10a6:150:1d2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 21:23:25 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 21:23:25 +0000
Date: Mon, 29 Jun 2026 16:23:13 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: guoniu.zhou@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v11 2/3] dt-bindings: clock: imx95-blk-ctl: Define
 formatter child node schema
Message-ID: <akLiQc1q1G8C0ZnQ@SMW015318>
References: <20260623-csi_formatter-v11-0-a792fe9c1502@oss.nxp.com>
 <20260623-csi_formatter-v11-2-a792fe9c1502@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623-csi_formatter-v11-2-a792fe9c1502@oss.nxp.com>
X-ClientProxiedBy: SA1PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB10305:EE_
X-MS-Office365-Filtering-Correlation-Id: a1afa79c-f06b-40ed-bbd9-08ded624a764
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|23010399003|19092799006|1800799024|18002099003|22082099003|4143699003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: UZcGRLbWmXuf2I/3O9rNglXoOsuOmT0HmTHCShaz0ibp0J8Rtc69w0+tlgk3pepKPk6Dw/tKzB2ToOghmprZh27/cUD9cMHSG5TJqznk6gkHEBvjH0xoHtE3YkB3XYQEbDuEgnWgv9qzp8MWBbR+3o36WyIvb8qU0efIYrYChIRPNkwGEPQKyJGUvegkkv5bzZ2TzLx6GHZk5WaXlG/C7HyrhWaD6n+PKNDbxa7CgFnPoq0mcPrCydaOr9I5a2FW1nq8lNWgl7RfgFS/8MwzwobfHi8pzxpd0lMf8AvEKpw/EJrDx4GnmPeeQuIUElwTWpexwT9Ew6Riu5lXRT8OSADExPufyHGAlNQaP8OeBl9tyv5GHXxmAEGKJRcW3yoQ9fwCjrv+FQdqFlvc0uBL4rUx9/O9IZUwrfRijPP+YtGFE/CSO+feEw3GB1ugDb/l1KzXonY4GrmDkQUGWczL0m6+bgZlnZDNgR6TnOx5gT2BC2mDu/oAiRoszbwgFd+wISyke3lfUVyDcm4NuvRrTwmgz0TcwMwL4NNZN7Ah0ZxJAhJInux7PESwITnR8yIF5LTBmiWBb5rVyzdtAQo4BIs0K6UlSjCtiqkPDyr/mXc6hXSp41dgpDTziUjSCDCm2ZmkZZwK+TfNMODPiNpm4A2SQ/w9v5dsjI4EmmJwQas=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(23010399003)(19092799006)(1800799024)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6FxWADYGjnjDS+YxioJkZF/cgyTV7fMwmomXi9AZ6WIUz6h73keXItpvNM6N?=
 =?us-ascii?Q?N5KB77iQ1qRgPWWdcvHU/a8PusPgR0o78oZzzHazyOdz1fDJY5zmU7Lophfs?=
 =?us-ascii?Q?fkHANuWJQy0JoYWBNbAnK1rsRODGHrXAJPovROgJWVTAkUI3TFuYMhQXk4wv?=
 =?us-ascii?Q?Pw/RrwQwguv8uCqExEtUK/T4d0ZoO+SxcCiSwyFh40NV/3d+4rui3B3TL0qn?=
 =?us-ascii?Q?+0ngbU49dnmbsrhr3WKE1Mn9EzkRfymNkwLDPxnVm/OB4uuAL2GeiHjGPtg7?=
 =?us-ascii?Q?XyA/jTxTojcStNsOu4bohm5qQ8ZQ3IRNlrnOMPErFjGy84Mze5rfqoT0Jy9I?=
 =?us-ascii?Q?yibL4C7JCywXC5fukUsvzDwz3T7iyFmfLVlgaBvsmEMlIXssSL0XGe1QBO8N?=
 =?us-ascii?Q?+UP5EoxXDJ7sXhJnXLxPqU6BH7Guvc6BTlLlGd/DYp8czbHpMLkDvyxyI+oi?=
 =?us-ascii?Q?V3/IBZUkQ6G53cUtMYW3bIIat21OWEM3r5v6L8MSbr2XzdMxvQ7Z2jwXSV5Q?=
 =?us-ascii?Q?pf7uy/SBIn2rWeWBldQr65/eoZKkYKgun3oYR7Kn1xidKdjUs44pbu+d7dWY?=
 =?us-ascii?Q?bQDddJzqHsWJ4LvdN2JyN5CCjgs8ZGch7xLb1PqiNq+Cui4eCnoAh1vfA1j+?=
 =?us-ascii?Q?S3ZqEXGpBjGtsRONvbya+ct7AMU3cvdOYhtA0QJmrwM8mIof+7KAcYrjAbh9?=
 =?us-ascii?Q?2TGKHDPTH8evL0SlsasO7wNxYM0xDgsVRJd2iIeQelnZgB96yf1ZFoaeax3G?=
 =?us-ascii?Q?F254KVORMpl4S5ECmbxMd88mYzh0f59rfUCN02IYJ+jpT3fJsgn2yswxWBen?=
 =?us-ascii?Q?JB4RqPh6e8Gg3aF/fCUzdQ7KCRCLY4Lq5j7+amlrAA9Sb9/D8F0X2iQc3PFR?=
 =?us-ascii?Q?ZSPTVLSdWrev01Js04XqpjbWwGZDTUpqFYjYaHkx0SzisNrL4l2wRO9HFLY1?=
 =?us-ascii?Q?G9OCYRqiRGYNvfhgAFEyr/pjcP/9UY6LsHpYonOsmtGaAdy4sjXqQBOqOwnw?=
 =?us-ascii?Q?cv8Uti5vW7GVXcl9RkCiYBBz3onkZVFUtVHbVO1m/24IJFYiKuOyHP8mdant?=
 =?us-ascii?Q?A75onXwfiiouITRDQwsF/2cY6SnF42+BXiosEa1Bqwi+aDxlldj+I7CvBOUA?=
 =?us-ascii?Q?LDpVh25j0FVL8sFUuRcreIrip0HoxegL0MUI024V+zsQwM3Ih6KS5+4OTsEJ?=
 =?us-ascii?Q?qO3+Ms1EdlckObZcECnOilfUS9PWTEuOW/cVdH61lrpqm9qu/1MX7gR0aic0?=
 =?us-ascii?Q?n3zBw0PvDkcbWgFwhDo0xq5+qDFMRdq4/mJcaz/z0UegF7hubg/lF9ds+Dzh?=
 =?us-ascii?Q?um0ZEShojdh1Urx61BHJDZawkiIXDWq5AQu8/BdTNx01E03du7Ifno19CxlR?=
 =?us-ascii?Q?fhdt5CyhjvJrl4ABZFtKLKwsw7h1e9eahv0ws7x9iWBLTd/u8YhtnvGCeIF/?=
 =?us-ascii?Q?MyRpxFq6UmM9T1OxpPkY08q+Jtz6inXBpcdCgql6GRrxcknwUSEravtSz8dz?=
 =?us-ascii?Q?mIqF8ig/EwcbC3CkPx0PJ4aiNQFKGdBmFOycDotXH4Ajx/VNveZI7ioPcAni?=
 =?us-ascii?Q?fNHHbhIwk1v4AUtG0GyufjFvO7zMfPI7claIphZXx5pUKvPp7MDW0vPFrJDi?=
 =?us-ascii?Q?CpbD4vb5Xsv0f/frGo9Byetadi0SHczI6gUNjFwOb1EaEvxEP9/syeFOGMSj?=
 =?us-ascii?Q?zk7JmVKASeSjN0Itf5u/Ev3UlIuXlCykFeziTDo3sGyN3l0jAPJdMxfaJZHt?=
 =?us-ascii?Q?TgeTpB4EAzxuDlyas2jkScghrAiQrGRB8HGrN//8M3BYkWPeq3lN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1afa79c-f06b-40ed-bbd9-08ded624a764
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 21:23:25.1534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: exHAs7ZfsgFXLmqht9gV+UeDrNlHtGL9uVvxV+2URGyV9xfQ8rKnJXlc6jCNNWmmrZnhvpAKV62uUFAiNJ9i2Q8fuNIbpzLBUsM119w/Db54V9Ca51Mt6Vu7VQ+oWSjm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10305
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_142332_418540_662BA5E5 
X-CRM114-Status: GOOD (  19.88  )
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

On Tue, Jun 23, 2026 at 11:56:32AM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> The Camera CSR contains control registers for multiple CSI formatter IPs
> at different register offsets. Each formatter is an independent hardware
> block with its own clock input and media pipeline connection.
>
> Define schema to allow formatter child nodes under nxp,imx95-camera-csr,
> with 'reg' property specifying the formatter's register offset within the
> CSR address space.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---

Abel Vesa:

	There are week dependence with media driver/binding, Can I pick
this with media driver together? If this go through clock tree,
"fsl,imx95-csi-formatter" cause dt_binding_check failure.

Frank

> Changes in v11:
> - Move properties to top-level and use if:then:else (Krzysztof/Frank)
>
> Changes in v10:
> - Use single quotes for regex pattern to be consistent (Krzysztof Kozlowski)
> - Add formatter subnode binding and camera-csr syscon example
> - Update commit title and message
>
> Changes in v9:
> - New patch to address the issue of formatter acting as a child node of syscon
> ---
>  .../bindings/clock/nxp,imx95-blk-ctl.yaml          | 71 ++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> index 27403b4c52d6..fbbf1b3f1790 100644
> --- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> +++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> @@ -39,6 +39,18 @@ properties:
>        ID in its "clocks" phandle cell. See
>        include/dt-bindings/clock/nxp,imx95-clock.h
>
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +patternProperties:
> +  '^formatter@[0-9a-f]+$':
> +    type: object
> +    $ref: /schemas/media/fsl,imx95-csi-formatter.yaml#
> +    unevaluatedProperties: false
> +
>  required:
>    - compatible
>    - reg
> @@ -46,6 +58,23 @@ required:
>    - power-domains
>    - clocks
>
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nxp,imx95-camera-csr
> +    then:
> +      required:
> +        - '#address-cells'
> +        - '#size-cells'
> +    else:
> +      properties:
> +        '#address-cells': false
> +        '#size-cells': false
> +      patternProperties:
> +        '^formatter@[0-9a-f]+$': false
> +
>  additionalProperties: false
>
>  examples:
> @@ -57,4 +86,46 @@ examples:
>        clocks = <&scmi_clk 114>;
>        power-domains = <&scmi_devpd 21>;
>      };
> +
> +  - |
> +    #include <dt-bindings/clock/nxp,imx95-clock.h>
> +
> +    syscon@4ac10000 {
> +      compatible = "nxp,imx95-camera-csr", "syscon";
> +      reg = <0x4ac10000 0x10000>;
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      #clock-cells = <1>;
> +      clocks = <&scmi_clk 62>;
> +      power-domains = <&scmi_devpd 3>;
> +
> +      formatter@20 {
> +        compatible = "fsl,imx95-csi-formatter";
> +        reg = <0x20 0x100>;
> +        clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
> +        power-domains = <&scmi_devpd 3>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +
> +            endpoint {
> +              remote-endpoint = <&mipi_csi_0_out>;
> +            };
> +
> +          };
> +
> +          port@1 {
> +            reg = <1>;
> +
> +            endpoint {
> +              remote-endpoint = <&isi_in_2>;
> +            };
> +          };
> +        };
> +      };
> +    };
>  ...
>
> --
> 2.34.1
>
>

