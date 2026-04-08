Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DB6FD5F94
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 07:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8LdPWlnbLcengSsYaIbsB5QCHvagLYq+9G93RnWdyx4=; b=j41Y+v5s3Kt76yrCYKmJDW6li5
	1Xe78R7TX4O1M9AzeGthjC+WWpdTUyJbhJS02gqO4PwW0gOsI8emewDLUnQI6tN5mQM8MEIatimAL
	PAfSTEN4fSKLOkjDj5Ndp7r2gcKVEHlZI5EUackalCwlKKSYY0QPm6wzWljWAdWouO6MT3TlEtnWQ
	5jaKNejAkMxpkU4xJfe9WpY16jY1hkPCHJYqtBuHSr84Y5X4s7O6eoKObCkgZWXW12nsMgz0U7I+F
	x1jKvzODCUSDHv+Gn+JZzJdfsLAg3co2Ek2m/9FARSOIHm0yKyz7xsXMNBCVDeINzbhyhxoyphO2F
	vHem64Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANof-00000008TrI-1GBZ;
	Wed, 08 Apr 2026 07:59:13 +0000
Received: from mail-westeuropeazon11010069.outbound.protection.outlook.com ([52.101.69.69] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANoc-00000008Tqf-2fAO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 07:59:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DAr6ftBHP40wmtdBmHcvBcv/pbW/ljddRRwH6EXkCl2GeO2Qc00pUINX7WQ6zJn2AKtxIBhyrcRGGkn5bm4EadBOC8G4iGRIcIeqhL7X0n/Fb6e6pS9QPlEA/bUM1ukWCFqfASIFMhNnnHQ83BLdE5Yv8PtjEQEKFuyfBbplVSVPxF8c7JfpAGwbHPwOzqCUv4BTCtZ9X4CgmXrbfkrJbSw4essCJ6+lA+Tl5lxqyS0GEvbT4FAByAGLmobXIYn0FEXeFSAh5Hq97KhP0CjZfSW4yxiyJgX6qK3Rm114nmv7uOlmN2lwjgLhEaT3ZXmT9xSh4iRADJC3evDHD4KVmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LdPWlnbLcengSsYaIbsB5QCHvagLYq+9G93RnWdyx4=;
 b=PoE4KAvhneSI0XAE+zkMMpCSYTVcgVVY2O6HAB93sdxpKQJdSGFjRrnp0HPo49xVCECFq8NPpMnAbSd9OCnNjrEiWFkw4tY6ARpAWH8MTOHvrNs+CZgVbqpoIYaynk9M0TnhIlldVWYSR/Oehah1C3pHQzUfCkRClwHAkuvkts0kzekDoi6sH4Wn4+gVbC2VnpQ5nLX3NonRZV4UNHfsfmKkicxMUZMiJ8U3Nq3ic9N8UixYolXLuB/IhK6B7/nZqLyTyrKoGfCDsnSgzM05FLmg+HquujBMR3GXatERPr6PdT8aVR1tDjIpFft0P95EhUMLKPclTkeHS62jieCKiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8LdPWlnbLcengSsYaIbsB5QCHvagLYq+9G93RnWdyx4=;
 b=SK0C/yQza2YCSm0jYJrHvA9vfBCO09OoJr2a7EpCYb8reYuV5f5D/ydi1XZ101W4Snj0fbUiC4B0KBkOtD6ut9GeyNMc8BOVrvp80N/dyrN7MPLGANacHBrL3U9WjIlIreL3ohtjmVA3Texc2esdOKoHxVhYICNksNzCzMzVU2RK2mU1p9mPdnlYOX0k+GsIMHYCr6zS+X42xwe2bBW9aYXsec0uCtEWpILLCLz+mZK4gXdzhAtH0yIxHzpldIuMWfHMhpDk1tLtTPUBOJ2zHRRrqeRwPdsLABhM2RbWsej+ZFkyORqiBs2JH2nGzfy246mcGlUJxlUt3axi+EsEiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU4PR04MB11410.eurprd04.prod.outlook.com (2603:10a6:10:5cc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 8 Apr
 2026 07:59:06 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 07:59:05 +0000
Date: Wed, 8 Apr 2026 03:58:59 -0400
From: Frank Li <Frank.li@nxp.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx93-9x9-qsb: Add tianma,tm050rdh03 panel
Message-ID: <adYKtjPvIgoK2oou@lizhi-Precision-Tower-5810>
References: <20260407-tianma-tm050rdh03-imx93-9x9-qsb-v1-1-24d514a62fdc@nxp.com>
 <adTUkWvqVUhLiw_J@lizhi-Precision-Tower-5810>
 <a31e926e-9e7e-4ba4-aafd-0f76f53fa176@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a31e926e-9e7e-4ba4-aafd-0f76f53fa176@nxp.com>
X-ClientProxiedBy: SA9PR11CA0002.namprd11.prod.outlook.com
 (2603:10b6:806:6e::7) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU4PR04MB11410:EE_
X-MS-Office365-Filtering-Correlation-Id: 23477169-03cf-4d3c-022b-08de9544b49d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: TSPsUlnh05gpMXfkmQ7vEgx8gDO26Q/OwHRsVYlOVAlzFyyrxA+0DNuHGT+OjwZAVusPtpDz7lBG5K6xlFtFCYjgRUxh/dzzgpu/V2rOqfO1TSGbovpGGHGjZqChkhhLdUpfZ82brrRq6PFAf7EkbwKBQrCEUqeCCRFNgsyk/Qfy7ZkyAtv86+zSlHxPcxlswfGw3vD+//FVbRRHolE4qctCITr6BRn2vxGCpB/Sbow5CZAP3DBIH77z3XJwK5N9X2SdJy0W4wRoF9ilSBi/vzvDff8IxHztiwhmgFCgzXH9D7saW4MoezgcogrmrZd2dXtr5tLBsugkrRYZaV1zqnKq8RY5TVJ0lYaw2DEmv4vqq2bm2MYw0CYt34YriLXTkrKxFrjvVtfplYtv5MuwrPM3P9DLT1WP0P38b0Kbf0fQ86MDlwYLbA2OtTecJt/t62KzYLU88IaWwKXgy+arIOX9xWJBp6LhCGQEH918+kaNOO6ZN/W/EXnPK4G8fiGoRsUA6A5oLLq+gMYlaCLsBj9zcBbxM7fcqpBESheOlS6f5Cm2cDedE4WjvHJhNDNExKDpyEeUpQeYmdo9ERLpjCqm1ThXIbfh6RnToy/bKZ1K+eA487C6BPKcmlrox0E3gtxtQ2PbV7li0DF89sTSJqsWx2EiEsMMxT6mK+onrDo2oTueuIZjTwC6ILDNn3bbX9dDZwFyEM7v75vV0Z41DRaoMCIkS1ARRDEJFcVY3vxpguhR1LbY0nVlJQC/18h2txWQ3hSB0U3I72jps/vGVwIeH80oW7kCxgpEaSPYJ+tyQf9aSTQYRz9CBabCHvSk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+d0ZAaE3gkSzo2xVPqGYwbpKfMdJoqttsws5OeyCAnvdAt0HWTmis6Bz2w7/?=
 =?us-ascii?Q?BcFajFEpmDaOu9IEA14DvbjrYRzXdPELT00WAhR7R9z0fu1mYcy2f7EA7ANv?=
 =?us-ascii?Q?gkqilSPSFPzKGEKnON38G+xbuoMX863LCqgwDBgIw2cS/7nRRo6zj22CtkZt?=
 =?us-ascii?Q?QVv+S/P57gH/a0IYL7Xdwc485+rcOt0i4wbsvZaN9lAz7PWW1CrldYxauqmw?=
 =?us-ascii?Q?dRf41bqtCYe/JDjQyuKX4JtO7bNfVu0N249w/mRbKE7O4zkpxPsYHmEFsJiY?=
 =?us-ascii?Q?SnvvDQdlF6rHEO/EdvHy5gFIhC+Ja8fNbGj2Hdvay5C4x8J4pGo55hVCiukb?=
 =?us-ascii?Q?Je5krk9J57oTB0ZyrLVoT5JzOHKAzkw2TSE+EhYUiRfej1SAHJ6iYYvXX9vi?=
 =?us-ascii?Q?egvmsuSaLpXzqBRbFnlV2gHO+7Ya1ttonpwPT2CGmAsN9RjtC1RQ7mdX7k55?=
 =?us-ascii?Q?uTulKTT8NCRHZzywxuTg59gDantzUO8M3Lyg2ZCmdRCCKsVxnL0XLHtkhVYP?=
 =?us-ascii?Q?cdS454IHAIPY5mxzOX0ADx/xAqS8ULpQilLJlTLMl8TQTbK+sp668CyJkGr5?=
 =?us-ascii?Q?aaAKH8s/xLfxEkHwjpBRt4Wesz53Ii9gA7MmSUqOnndWGIk0CsvwbnWnI+0p?=
 =?us-ascii?Q?SSx8JuM3uAwzZEYL9UnJ9L3Nkr642UON8MSw23YPUMi5UBAQ6U4bXh4rmyIz?=
 =?us-ascii?Q?jG+oB3gbx5cpD+8R9BMgxj/h+f6xLxM1Iq50mVf3ZUi4o9QKZfeDgAfL5ddj?=
 =?us-ascii?Q?QcszWzINlDXTal8DN+ADhRNFAcHsyON8jxLdSE0NJLB54T9cWd5nV390Iwuv?=
 =?us-ascii?Q?a4umztcJurxIObiE2HdN97RACeYCcROgI/VQPHDtugrNVZaZ33QrtoV8eTH6?=
 =?us-ascii?Q?rGkv+b4YJvK4l9cxT53WUoQcIyiSF2T0zgZCgJ9QoV/8bnABZPai5ttRwMCQ?=
 =?us-ascii?Q?CxeQHjiQUfFOIh5Rw5MdwsSJe/MH3R4CW8jR1pfaNxPo4jXB4Khqrg7wXQrL?=
 =?us-ascii?Q?zeqFzqsYMkTQKsVCJkCi77t6XHoqBm5mqLVsVdjOUCCCUvx69/m6ID5eNR82?=
 =?us-ascii?Q?FX7BNTxoNg3AX3KnsXctbX3yLjJTqhkME2bc1ugQ51/8SolKbRdQLU8LIEZr?=
 =?us-ascii?Q?wV/rYGu82EouqhAB47BLX+Ue1/QeaEBi4UG4SPvbwTCh0gv7g/PTmLxYDnH8?=
 =?us-ascii?Q?GGWQAYxR7s5tuzbWx2tVmdNy7kovdYKDpaPA128M6i4mSD3ovj6nPhAN8fuH?=
 =?us-ascii?Q?JbnjfW6Lzc03+j45IJnID68tJxDD/jwNGTidpHnGDHmCnh2WMvown6Wg6ErG?=
 =?us-ascii?Q?61HpFV/zLOF+3bUHwq4AfduozczWWmEXQ01ppZ1ci3FpejHVmxMEIfgJjlUy?=
 =?us-ascii?Q?Zd7mUrNJ0qQto7LVFddDCUyFhpWrNt3IwJn/aSDtKpTOQWjeoPZHDgqHhxo7?=
 =?us-ascii?Q?n5gs0+uMnsq9D/Fqmqj7vtpTXXNWmfoVF37S9xpiSeOhU9q7K1vFrETqyuTN?=
 =?us-ascii?Q?OOjVHzkR7Uhzv0l3f01PgoOrmNESVIggE+686WzJh/BB5oR0pJASIu1THPZ0?=
 =?us-ascii?Q?809UycelgcX/IaLXgUouGFAsdFR5jIp3ZqEH/3co2v7E57j/uaB2Sg3+/15Y?=
 =?us-ascii?Q?3ACiwNFQCcepSocPIbCV6oyrC8n2sbV+flh81WRHDcd01omckRyPGovPUjxL?=
 =?us-ascii?Q?Vqv2RdtKgv8FmnYKtfIuJwSxLsw3JJxacdOEB6+Cdw+eMXgzqQKpmQ13tmC3?=
 =?us-ascii?Q?5X2pfqjEvg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23477169-03cf-4d3c-022b-08de9544b49d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 07:59:05.5297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oqlMh8ly7tD03wUbGjjouJcLvrvF6ts6FkG9V6P8cV7qVKzTC19vQcHfLhI3qwUumnyjCv1Dmdmxi4aYi+rF1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11410
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_005910_681601_43C0D71E 
X-CRM114-Status: GOOD (  28.69  )
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

On Wed, Apr 08, 2026 at 02:02:54PM +0800, Liu Ying wrote:
> Hi Frank,
>
> On Tue, Apr 07, 2026 at 05:55:29AM -0400, Frank Li wrote:
> > On Tue, Apr 07, 2026 at 05:15:31PM +0800, Liu Ying wrote:
> >> Support tianma,tm050rdh03 DPI panel on i.MX93 9x9 QSB.
> >>
> >> The panel connects with the QSB board through an adapter board[1]
> >> designed by NXP.
> >>
> >> Link: https://www.nxp.com/design/design-center/development-boards-and-designs/parallel-lcd-display:TM050RDH03-41 [1]
> >> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >> ---
> >>  arch/arm64/boot/dts/freescale/Makefile             |   2 +
> >>  .../imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtsi       | 110 +++++++++++++++++++++
> >>  .../imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtso       | 106 +-------------------
> >
> > Can you add some description about raname in commit message?
>
> I'll add some description about the file copy in commit message.
>
> > Use -C option to create patch.
>
> Will do.
>
> >
> > ...
> >> diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtso b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtso
> >> new file mode 100644
> >> index 000000000000..c233797ec28c
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtso
> >> @@ -0,0 +1,14 @@
> >> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> >> +/*
> >> + * Copyright 2026 NXP
> >> + */
> >> +
> >> +#include <dt-bindings/gpio/gpio.h>
> >> +#include "imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtsi"
> >> +
> >> +&{/} {
> >> +	panel {
> >> +		compatible = "tianma,tm050rdh03";
> >> +		enable-gpios = <&pcal6524 8 GPIO_ACTIVE_HIGH>;
> >> +	};
> >> +};
> >
> > Is it possible to appply this overlay file and kd50g21-40nt-a1 overlay file
> >
> > to imx93-9x9-qsb.dtb, so needn't create dtsi.
>
> I'm sorry, I don't get your question here.
> Anyway, the DT overlays are needed, because the 40-pin EXP/PRI interface on
> the i.MX93 9x9 QSB board can not only connect to a DPI panel adapter board
> but also to an audio hat[2], and maybe more.  The newly introduced .dtsi
> file just aims to avoid duplicated code.

My means apply two overlay files to dtb

imx93-9x9-qsb-tianma-tm050rdh03-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtbo imx93-9x9-qsb-tianma-tm050rdh03.dtbo

In imx93-9x9-qsb-tianma-tm050rdh03.dtbo, only include
&{/} {
	panel {
		compatible = "tianma,tm050rdh03";
		enable-gpios = <&pcal6524 8 GPIO_ACTIVE_HIGH>;
	};
};

Frank
>
> [2] https://www.nxp.com/design/design-center/development-boards-and-designs/mx93aud-hat-audio-board:MX93AUD-HAT
>
> >
> > Frank
> >>
> >> ---
> >> base-commit: 816f193dd0d95246f208590924dd962b192def78
> >> change-id: 20260407-tianma-tm050rdh03-imx93-9x9-qsb-6e4bbbde3d08
> >>
> >> Best regards,
> >> --
> >> Liu Ying <victor.liu@nxp.com>
> >>
>
> --
> Regards,
> Liu Ying

