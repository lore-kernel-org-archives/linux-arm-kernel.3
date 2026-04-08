Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AAB7FD5F92
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 08:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yVnADYKk8bv0RenJhFaOcvhIfhLREb/HVAdwV4cNR8s=; b=t7KUHDYqTWODHYnnHyqVsnos/m
	4cPmeVISSvklWCeiyxz74w7ozx88CSMjfEjF9+gOjtcqw243200cdPJywi7aSq+ygVQtCTAwaAMaA
	vOu+UOMfv/pm2HgYd0MRxRMEjJWCM988HP/2tvhi30Wdv/KqC750L50YODPmwoTjLkxvuQpsWpK7N
	Lnu9kcaZ3l0EHIN8yGkbUz9PA/ONntQ9Xeo/4ZjeeMQ6xgK4HNx77CzeCIDTARq4QDbK8DPKBBPFL
	r3iT8R/UIFyNjzPmb9vrgA93ycGiCNOeuxsLkI1ZU9jkWavCkkjugHW2qIqixJllsD6x+eiL101Xo
	E6MpBQNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOHW-00000008WJe-0DAE;
	Wed, 08 Apr 2026 08:29:02 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOHU-00000008WIz-0Xep
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 08:29:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dVxfn7FuW/QxWnFTyigZnoHC6SMKssJgpPtPw/zjGEq0vNoBKaFL1+5qb/mPQtNIxqhnway0RsBmFMFypdk0csdYLVgbpWBjxFJ224S3UQ+kdjYfpfUy1/DRyNxddFoQGEul/ENkyaDx9z2/gyfpIs8eEZna6dRp09/vM+dXSZeOjM9MnAwfQpwqeQB51mAaNaDhALEuD33SRgi5bsoyht7vJ6G15wcXtbUByrO2PcTFyH2Ti0BNo5NVrz0rYV/5qRqmTJmyWfGqeCLsieQbBt6ghXq9oPqprcUJ9zWRPM80+W77q2r1mVaOaHoosYc3TYKSnZMqmYiOYd17vO2blg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yVnADYKk8bv0RenJhFaOcvhIfhLREb/HVAdwV4cNR8s=;
 b=Dj/ThSbQvWHZkMGwWIkpv49FEP9T5vJ57s3jofOjjl9F//Ay1ONPl/BGardwRdbje5qaJvoX1hrb786cGMzN9yQr8dNFsJ5EzWCPjz3xJiuyuZS+CRRmGKqxDAKkuLueV15E5UNuPioV8oldLmRJ12nFRJzE1QeqjdWBsd0lHhkSGFZTfSZmS9VCeOJqzBKHvjGORdoRbBEJR9HmW8RBYk2+aKBVJY3/2ZIZt/LWbopHvu4ylmHNv45JOo2VxGXm1dlgf8DT4JwIQgoWBmfg2OvKUV2H+Q4NyY+K9zZxREY7e0nqkTGLM9vsIvHLdl9eW/SiLp4ssf8mE8I/PiTK7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yVnADYKk8bv0RenJhFaOcvhIfhLREb/HVAdwV4cNR8s=;
 b=ff7xr44wT6RfAi5p7P8ehtvIEs4Whp00yYTvrD38Y6TJ3cAlHTkQGjc7ucUZZ4dQUA+ldPWI+VW0EX9b4Mv+Bxw4JVSjiBHOFpFirI+ACuGJupomP2er8VaUq+1+bca4GHfrAEzoDDKAE8nn/osKZUiLjbaYs/WPJF9lNXdAtGcQHmesAxAAlg7gzxduUMhCNn8g09lxqnk6Z7FxWiyT0LxF0+qQR6aexZbxRrIFOi1+vSFb8oqdax9ZX+SpoXs1avyd/tq8IX3eYPs/2A0G5E9MLhsz803R0h0VeQ+EO26yQMk4MeP7wfLm0zNGkEChCM1VsXPh86NVTEVVw7Lb0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM8PR04MB7841.eurprd04.prod.outlook.com (2603:10a6:20b:244::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Wed, 8 Apr
 2026 08:28:49 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 08:28:49 +0000
Date: Wed, 8 Apr 2026 04:28:40 -0400
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
Message-ID: <adYRuAU5ueEKHK5l@lizhi-Precision-Tower-5810>
References: <20260407-tianma-tm050rdh03-imx93-9x9-qsb-v1-1-24d514a62fdc@nxp.com>
 <adTUkWvqVUhLiw_J@lizhi-Precision-Tower-5810>
 <a31e926e-9e7e-4ba4-aafd-0f76f53fa176@nxp.com>
 <adYKtjPvIgoK2oou@lizhi-Precision-Tower-5810>
 <f5cd5da8-566d-4dff-b712-3d48927f97eb@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5cd5da8-566d-4dff-b712-3d48927f97eb@nxp.com>
X-ClientProxiedBy: PH7PR17CA0006.namprd17.prod.outlook.com
 (2603:10b6:510:324::28) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM8PR04MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: 213eebba-3971-4560-8484-08de9548dbbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|19092799006|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: sZ0UkpcbTntzv0Pt8aOsD1nnsPwvGQCVEIfEQDKKqx5B+FmWdX1NH3NxvU1vtmlHROg6Bc2c1gEbzpH3lv/4Ewva1A6g+o6VjkwugXG3s93jaoCRT33fiyU4DnQmyLCfr/moOKP2n6v0iM+oklCeoOsWIXvII/umDBKPInWO+6+C4mzRiGSsj7ZRHSLs4QWMOS+DkE9I6QlPiksd2Prgi8sWFOiZ4CiRSrQCZl/lkK+/hVvW9DsD+BhwIlFt1nooLuYI7+Dly3leEi5WnbI+SchGrI7RVFRZuEMGkRbXyHiwpOF8uk9V+QUsm5yRFIAsuKNaCLKvYDiBvP8d0qtnfoOvnKCHD25G3zZ373x/NkyHgY6YNsrDO9y6IO6RclTDA8ko39QkMZSFO/qFj0O/YyP1ONUYECUJ+jct7/gxWYEbqdCBRweWOcUg6vRkoaL9m+5JstRvBiJHS7SG+TKv/asXD9sODLdMur5kxTfYNjb+vyLm1D+t1ozAIwZunWf0sCDTfbAgtivJjMoTHaVo6FIVwotSrH8aBDU4SzJrwT7SrCWN2GNhGbVcOZBMAuJ4elk+tze8thAkHWfW5tFVaoPBrDMzGwPzR1vWcn21TSS5AHtok+hBjqxtlY/inqimXAnHa5b6oUztSQWg377csMwE0+ukCzmpwaK8k3paz6O8xgpyuNmzfeSykIsJ7xTUtRj4W/P4TqUXh4v+Vu6lMyDNISwkZMChgwdLN5T9VEghPnwyF06ham+tlliupply9gAMFd46QobRpENrTNN8pSZ5/A0FlvlXNmuAdOmjonWGZcxguKLFeOW6N5KsjhfX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(19092799006)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lUFqpPt6aWEExFsL/d7pCALJGzyQGfxd10dU3f1oFy2jZI8V6fvKz20TGbGz?=
 =?us-ascii?Q?uSOJ/FLJcaDDP4V8j2gAGmtURP3QzXOfC0u/oQ1Ni53TtyKa68gFkhlJC6ZL?=
 =?us-ascii?Q?acXjsusvZbpCujaFtKi9ksjUvsWAGyARpBOjiGpPFe+RaBQr1v0vNDjZM8yr?=
 =?us-ascii?Q?Zw7ZzgwWk9AEuGqiZXmGpI9vfqmzNqfd0/53idF1WT7nv3rOROa06ptyDIfZ?=
 =?us-ascii?Q?QNbTgzCDnYd83u59pG+ubuV97iPCNDfEb6ctYjN7dEvHR5dgcSEekrZwY7tt?=
 =?us-ascii?Q?JVA3x5MSHLPn6LtaGGL3uDLjttGiK6LVbqtKT8wpeKkVCwN4odPklXurnydy?=
 =?us-ascii?Q?brDFL2EI4aHw5GUO4ptzfRCGN00A8NpGAGGa591hb4CJ4ePXqgU4H4KJU/0W?=
 =?us-ascii?Q?DTbWPj7tC67BBadMfJZaWcwGyVwgKVJo8lDx2wAAVGYPqqlieVRfA0gHGfDg?=
 =?us-ascii?Q?E9rPBQJ24f8ORiq2AiaPsDA1xsMXf/JJg8B0ULY2gbxFx/FL/YotwDY/3qeO?=
 =?us-ascii?Q?b5ThCqh1Q+TcUV2GGh6HRWX5rERbF8A47aM3C+GHHroGB9gQt9kyHoViJADh?=
 =?us-ascii?Q?04uVWsD0xgaSLayvtDX9wrObT5MhOA7JnBCITyISHx7qHi3HoacFcUddAMOS?=
 =?us-ascii?Q?IeC58LfNoD15iEPa8jMzfVrW3X6iHKt6nhweZJMmxDvcaGlbD1TCohi++3OI?=
 =?us-ascii?Q?6VnEvixU/2Y5ibZ584mtiS3UrN/lxyB+SncIJ9AZTo3rNVFN55ER7F86xN+m?=
 =?us-ascii?Q?DRfGKYF/hwJgGfEangV5ouanBD7re9TbyvRt5aU6xxQSsdUHt5D9+dGTQjqJ?=
 =?us-ascii?Q?nsaxKqPeproLpsprzwf021tM2y1zo7UkxfLT9jpvT0/In8KdnNuDvjFWVypq?=
 =?us-ascii?Q?ooXoBDLMKDtbLMY/HytQ42XiF2aBaNSUzCN10Fz85v6DDU52x6u96Zkbc4VQ?=
 =?us-ascii?Q?Jb7gC3w/28EvuCVsZmPb5aCndtyrWM/z39mV6lh8oN0ONg0DUi0WrYU7SDW2?=
 =?us-ascii?Q?byPTTHvc/FUPlnZ1H3V0lzffppTdfPkQAhwGIUD11wTKnXfQ0OmbaRvu0Y40?=
 =?us-ascii?Q?QYoHq+SINzej6zODu9XMzg3WyPeYomfzhMMCsmmrADOEEp2ZiouEQHouMGas?=
 =?us-ascii?Q?NXLNO0mSg1meigvmrzLlpcw7QoR9uU+jeE4awmjBZGBlaokL8BNWgrvlmwjM?=
 =?us-ascii?Q?1NN1H5hfp1MQPJdHXgGxcmHPpep7AoZXYKwEKtrLGIH5UGnGiXQZY0STcZGr?=
 =?us-ascii?Q?y0Vrq/+X3xVIv5aDc/rKULqZU38gsgQ3ieiOD7oduJaQNlsNRhHMVjO3lwcB?=
 =?us-ascii?Q?Z6vfOpa/CcaIGXWGFYHjaGjWuYpoyOtV0q8fkJLxazC8MMc9PRilcVOAL0M1?=
 =?us-ascii?Q?Doefd6OMgqflyEhfGPHue5Vc/i21x6gPlglj9RgQn4C5eF9Q2ISjM726xci7?=
 =?us-ascii?Q?CydIBjAmaHC2MbeY4CjTDFFZhvdtqiHmCJaar85MNuKZ4LzRD08l8amdpuho?=
 =?us-ascii?Q?8WQNsyaE1rWvtCFRIoZpQdrkTg8UZk49/uA7TuIiZLq0LoO5uTYCuafUuyC+?=
 =?us-ascii?Q?dril+Eh7db6CY2CxfuzylabyCclqm2uPvrkOvCt7f+loC/I5bjSTJ1sdliEK?=
 =?us-ascii?Q?pVxlKNVv0bGfvxHab+Q1cZ7PLO+TVXzAdQfkAlG7a2daSvQnxed9z4APCB+I?=
 =?us-ascii?Q?MeUoshEL5WQ8RGb+j583LFz3WK7+LaedP42+qdM1bLay++SH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 213eebba-3971-4560-8484-08de9548dbbc
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 08:28:49.1518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yLsx+2CHrlJk4wr5HatCD23+b6k3rVrUjxmLnajGLslc6M8lp0qLgNEuIVPFZMKLLcPI6kjQyKBM6QKay6v+Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7841
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_012900_173199_0AD6D393 
X-CRM114-Status: GOOD (  30.75  )
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

On Wed, Apr 08, 2026 at 04:08:24PM +0800, Liu Ying wrote:
> On Wed, Apr 08, 2026 at 03:58:59AM -0400, Frank Li wrote:
> > On Wed, Apr 08, 2026 at 02:02:54PM +0800, Liu Ying wrote:
> >> Hi Frank,
> >>
> >> On Tue, Apr 07, 2026 at 05:55:29AM -0400, Frank Li wrote:
> >>> On Tue, Apr 07, 2026 at 05:15:31PM +0800, Liu Ying wrote:
> >>>> Support tianma,tm050rdh03 DPI panel on i.MX93 9x9 QSB.
> >>>>
> >>>> The panel connects with the QSB board through an adapter board[1]
> >>>> designed by NXP.
> >>>>
> >>>> Link: https://www.nxp.com/design/design-center/development-boards-and-designs/parallel-lcd-display:TM050RDH03-41 [1]
> >>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >>>> ---
> >>>>  arch/arm64/boot/dts/freescale/Makefile             |   2 +
> >>>>  .../imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtsi       | 110 +++++++++++++++++++++
> >>>>  .../imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtso       | 106 +-------------------
> >>>
> >>> Can you add some description about raname in commit message?
> >>
> >> I'll add some description about the file copy in commit message.
> >>
> >>> Use -C option to create patch.
> >>
> >> Will do.
> >>
> >>>
> >>> ...
> >>>> diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtso b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtso
> >>>> new file mode 100644
> >>>> index 000000000000..c233797ec28c
> >>>> --- /dev/null
> >>>> +++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtso
> >>>> @@ -0,0 +1,14 @@
> >>>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> >>>> +/*
> >>>> + * Copyright 2026 NXP
> >>>> + */
> >>>> +
> >>>> +#include <dt-bindings/gpio/gpio.h>
> >>>> +#include "imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtsi"
> >>>> +
> >>>> +&{/} {
> >>>> +	panel {
> >>>> +		compatible = "tianma,tm050rdh03";
> >>>> +		enable-gpios = <&pcal6524 8 GPIO_ACTIVE_HIGH>;
> >>>> +	};
> >>>> +};
> >>>
> >>> Is it possible to appply this overlay file and kd50g21-40nt-a1 overlay file
> >>>
> >>> to imx93-9x9-qsb.dtb, so needn't create dtsi.
> >>
> >> I'm sorry, I don't get your question here.
> >> Anyway, the DT overlays are needed, because the 40-pin EXP/PRI interface on
> >> the i.MX93 9x9 QSB board can not only connect to a DPI panel adapter board
> >> but also to an audio hat[2], and maybe more.  The newly introduced .dtsi
> >> file just aims to avoid duplicated code.
> >
> > My means apply two overlay files to dtb
> >
> > imx93-9x9-qsb-tianma-tm050rdh03-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtbo imx93-9x9-qsb-tianma-tm050rdh03.dtbo
> >
> > In imx93-9x9-qsb-tianma-tm050rdh03.dtbo, only include
> > &{/} {
> > 	panel {
> > 		compatible = "tianma,tm050rdh03";
> > 		enable-gpios = <&pcal6524 8 GPIO_ACTIVE_HIGH>;
> > 	};
> > };
>
> If an user wants to use imx93-9x9-qsb.dtb and the DT overlay blob
> imx93-9x9-qsb-tianma-tm050rdh03.dtbo to enable the tianma,tm050rdh03
> DPI panel, then it won't work unless the user also apply
> imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtbo, right?
>
> >

Yes, imx93-9x9-qsb-tianma-tm050rdh03.dtb already created, which already
applied both overlay file.

can the same board be use for imx91 or other evk boards?

Frank

> > Frank
> >>
> >> [2] https://www.nxp.com/design/design-center/development-boards-and-designs/mx93aud-hat-audio-board:MX93AUD-HAT
> >>
> >>>
> >>> Frank
> >>>>
> >>>> ---
> >>>> base-commit: 816f193dd0d95246f208590924dd962b192def78
> >>>> change-id: 20260407-tianma-tm050rdh03-imx93-9x9-qsb-6e4bbbde3d08
> >>>>
> >>>> Best regards,
> >>>> --
> >>>> Liu Ying <victor.liu@nxp.com>
> >>>>
> >>
> >> --
> >> Regards,
> >> Liu Ying
>
> --
> Regards,
> Liu Ying

