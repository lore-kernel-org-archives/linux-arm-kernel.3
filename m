Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17D5C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uto+BvrZoeEwa6MdxOBIK2+F/boLU+ojvq4RxvsuJkw=; b=U/SVz4J/Kj01p4OIMCRFqDz5up
	f/5Kp/HtmdDUeqIqJduI2KCtg7x791B5cHe96RxxFWrjH0PbqHcuhg7Uy2BGwLFGZ6yPdHC6oYH2z
	Y6GTrkfCrxnTMbigopwozLSylyCVcYlz/4HlWs7sdHwnMC/I7pk7tbeHzN4U8wHIBhLEYwC1SjNTW
	TCaGeBk0wbtU8pgXzbqAfm38+i8+NqT7dJTl3im99zOhAXL7mJe6THM6G5i9DWMOdcWua4JM1JRi3
	c3TRoysmy+aRdd4HPexjZEKqPmlkDqM9SlyjuzFImi2FNjGuJphKIvat0emViu36+7mBIrz6oiYUJ
	E9d046zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcY6-00000004Hr2-0ayZ;
	Thu, 27 Aug 2026 16:01:54 +0000
Received: from mail-westeuropeazon11010023.outbound.protection.outlook.com ([52.101.69.23] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcY3-00000004HqJ-2L6g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:01:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZDHpcbU+TzgoModXJNVcCL4KFMsCcIVZfoLtqYQlAnuGkHOVhxWBArEak189wA39Z1rNVD0D1WDEa0s+IQHLpOD9eC26kIjj5HVughicZ/NPNgCPoihg0mGiDQtT8eo8NR/salC63G2JG0XfdUs6wyQIkt9zAgkS3+5nUHg4t418WZ93Gc/ZVA5jxVimDoIxJaef2qEO6a7a/9W1Vj/jiFtA3yvPWj382izFiQuiMhg5BnK1Iw5a5aZ8o332+7nuYrQTh+6XJvCOp/oYodFEXwVejI/S2ZQXi16BcLkYqc1NKict0gjBAxaiLZxIgsu+nbM/M2Ggq/yFNktJXJvb8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uto+BvrZoeEwa6MdxOBIK2+F/boLU+ojvq4RxvsuJkw=;
 b=XUVUwkEFCJv4hKI2iE7+LyIe0kJ8q0mUV2o3L4s6kVm+3pl7xs0/4zFIs9mYU/oBUkMcetiK5bT36H+/GbA3Sq6NGoWU75sr/CCNyy/5HpPOVyVA/Ue5kztB3t5c8I9W/XxDiRMJlV4e4lCtoDV+pay4tZEpGDLOxU/9hWf6O9FzjGZbdD5B17wD4/5ag8RlKs3Pj3eBBEr0iefUOw9NYkSCabCVdt8in2mSRP4CaQ3dtSyjwKvum99GF6JN5Wm8ZO79B6uGnBZSPg6FQwZXktdIrFNaOB1RVe+pb8Ub565KHr4SVmc5RDxEo/X/DJqNjMVJCLoWzh2JeKlNGL5RqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uto+BvrZoeEwa6MdxOBIK2+F/boLU+ojvq4RxvsuJkw=;
 b=wMhfGddHHjBGX/fGKjiDpVP5gmxoon6zuNU8Q4HfgXgfTrw9X+E4lLiFZ3ctW5E3ySyys8tS/f9CFDGfEW+Qmui5hDN3yQqrnngKn3QnZZSKj5JIRnV3eb5F/qm5X9GK07Iw6wbe/9bT1FLBHzTHa7cwgC44PjRy/1qp3HKGcL63swU8H0ZuTNYnJsfGBSARlMbYGftrioUhz0aH8GLU2FOxUoJxp7RFNFaN1l51O6YUamz4WMUXr0gxfzho6jU4NYY2UO90cBbyjOpRUaqhwx9cIG2hckAd1EBf3EKXaPaJOyDFXkR++Vgjwym6Gy4G1bwDOhbctfVcv5iToOO4ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBAPR04MB7302.eurprd04.prod.outlook.com (2603:10a6:10:1a5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Thu, 27 Aug
 2026 16:01:42 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 16:01:42 +0000
Date: Thu, 27 Aug 2026 11:01:31 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Wolfram Sang <wsa@kernel.org>,
	Ludovic Desroches <ludovic.desroches@atmel.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Yao Yuan <yao.yuan@freescale.com>,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Praveen Talari <praveen.talari@oss.qualcomm.com>,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/3] i2c: imx: release DMA channels on probe error
Message-ID: <apBfW01p9Zik5WOI@SMW015318>
References: <20260827-i2c-dma-channel-leak-v1-0-271d4adc03a0@cherr.cc>
 <20260827-i2c-dma-channel-leak-v1-2-271d4adc03a0@cherr.cc>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827-i2c-dma-channel-leak-v1-2-271d4adc03a0@cherr.cc>
X-ClientProxiedBy: SA9PR10CA0029.namprd10.prod.outlook.com
 (2603:10b6:806:a7::34) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBAPR04MB7302:EE_
X-MS-Office365-Filtering-Correlation-Id: 15851e93-b41f-4637-2496-08df04547c9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|19092799006|5023799004|6133799003|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 476jyKYPpLbeG3VPioPmcYwSVcias5eBiuQ/0S53+pHdDJqyrUesh77B6dNUurFBVWzoQgTzdRwtLMDZOZaXjNucgSD9YF2JLBmFPHtI2s1WaNy9jhjmXoBCp0x3PayfFsUikwlwce/A/3VMz44EBHqQUcO30wSgrtZAb2fVgc1rHjeV5Y3TVPAvO6W0q1VEAOAuaAGWMAgneWypmIbHUwtOktlDUNfUPA3E8/td4GMSK9SHrvtyUazJX4U+Z21PQxEBBIWIh2J8A0r5SQXCHYYKub8Ho9n9qpp68otCXFro4CMNpsA9RZqz0vHHjd7Nn17AOtRKg/ddHvAAzM5Ka9hGkFCwrxwA0w+P3R/DCAZX7eBpukhRWYhg7oMV0/2p4jVBztgE3z/WlMlOEnZaQRDjhIbMgWpVZAot0rjbP0VWWhQ6qdFXZr+0Yg8DwjF0PsMPdlPAzmFXjRjAELEzGv+8onnAZkbQHhej+bpWzaLiFcQSC8F3INpsG8kpFJ4kG9G3hojQOG4p69qptvp0RKvGnSUIjZc/hRw/LLmcgyuOOZDBh0OujH0qeTNl8FORMIEjH0yKLYGg5YQ9danAhowBDeA8eD5U/KpIkjyQEvmEg4XJHAKF4AHWMHOb8/yzrLkjxoUV5Ax2363yU4zSqEabKTpN6kwVDfkfe3DlR90=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(19092799006)(5023799004)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OnKWu6J3CMn66P5XzClU0w+xgKJYsStzajKpnEnhrNpE6qr6ZDoMgFR1WpmI?=
 =?us-ascii?Q?NUEUs2tcYFf5Ac4FMCrAl9YhCelB3gpQ7oXn1WL/Ady1oJ/47ySwX2SBbyHn?=
 =?us-ascii?Q?JUckQkOIVTSXe0USZBX9vV1+bUtOciCm4NE14CFJLwx5CkqUpSZI9Q/zl4B/?=
 =?us-ascii?Q?sSPrJE8Q55CPAZTYNjXePgrOtrVidHbrIGzLmmfSnl0OMVRYF5h7OMrJSvCI?=
 =?us-ascii?Q?tRStHTL614MdwliUpimtQyXRGDG4XtanePkZVwe+Q1NQKpyVEPCvH31kdqVZ?=
 =?us-ascii?Q?ClbMw3k55pJgRmdeKbA2dAeq+LrtkdDYs9uhVHI/9FkOA+y38eEQ7LY+KJCB?=
 =?us-ascii?Q?C7pTKiwgZPRtcoH53rfeRMEBBIcrRYde2LBq+eo+5wfCinrdFy7dGEPqxZOl?=
 =?us-ascii?Q?ABKiD+IV7qlW/pYRA0CVJ65H7+O1cFKcCffyDR37YoqbE/zdUlm1rbXoT1/p?=
 =?us-ascii?Q?0SVdfD+9fujfWUxWcbRhFHfB5bmSBNnwdO4ge0Bs9ITam6Q/ic54flDgdB72?=
 =?us-ascii?Q?1INXKkWl4tt/7OiqiWRkp7nZ1RAIaotTVerYx2rHCXkRfsruEDftR7MYyAiB?=
 =?us-ascii?Q?VvBAApTSCnWdQGlqKwCOHeHhi/TkkUt/1TVoof4crG9vo9bq9Tq+BxwPHaOt?=
 =?us-ascii?Q?Km25dAh24HGxWkHheDM1K3LlR4CXwuCyhBTK7fPKnb+0Ss0aGb8bQuZ8N+aS?=
 =?us-ascii?Q?ILwTMQ8ziI5/57wiAk7GH0VC3p/ltLM290mMdh1GMfDDgBiFL3g3r4pQD5Hj?=
 =?us-ascii?Q?qDhC6TxdreTMSVM7wPwFM6QDXzQlXIlKrEcDvYOXMUbGMMxL20O0vJ7GpGoq?=
 =?us-ascii?Q?XOxbyqeeeBA2B/DOsU8xmah4ZcSZnTJUiZEJu591n5tQ6r+ZlYd5ShVp4tta?=
 =?us-ascii?Q?zi/gPtfYVPDng1ye3jfz0QqJcfuz5Pw+fzQGmJIMW03oUvgBTqtlMb5pazqH?=
 =?us-ascii?Q?RpOwe5WliX4/23k0vreShTd7TWYUTnJjhjroRsle7FVRvuilRe6mzMBGjdGi?=
 =?us-ascii?Q?RBeYXEciCjpmlVrOnqXSulin/iCvsEhvKVv45GC4OgLxWpebHRED8DvF/tGc?=
 =?us-ascii?Q?gcxzck3g27oVghu3J3j+/Lpp+tjePZHW6HwxDXq9k5vM1RqQDcdmuu9LTvKo?=
 =?us-ascii?Q?ckcAyBlgbox66/+PpjoRVLnV6pmspBzx1SVR/JzFNregmrsiIluYg4jIFs3B?=
 =?us-ascii?Q?pXpOwH2dkFCAvJAa0UkmacVf5unJhA1HW82fOJQLrN7Zn6Tnovqm50GRdSat?=
 =?us-ascii?Q?Wfx/bBYEqvNYTG9NrAfe5Xrca+JCfVfGU+5M6msTAxg5v20Q6Tf6EXR6cMU5?=
 =?us-ascii?Q?TQbyDBRR4wXlFVHbT3BJ5UBVvsmND5bgNLxJ5FSc3K+CX8c/IMO/NnbA9h/X?=
 =?us-ascii?Q?yov0yZ2VrOxFmcyYI7ydr/tNSRcDv4pJxC9AffCrFGSbRaW0xFfY07JuWN7L?=
 =?us-ascii?Q?g6pc002Pct/RYZGIDWsI6S58Xct/Bwz+3eWx3S+FUpma7cLewqmPfGygG7KW?=
 =?us-ascii?Q?av54HvwZthdPA2iXBGExsT0QR9kJ0yDV4qNTaPLH6HvDXhYNm7ekRHlnyWIH?=
 =?us-ascii?Q?zRDeod32mkTt+XmFVjf3PJKiCQvR9idKCUP6qQ+eU3RjAWIXTUUur8jsu+Py?=
 =?us-ascii?Q?ZUDuMwDYluBW1+PjxXwN0X/C80csTHzM6onrUMSiJJ8YAuqhu0CgXUd0Is/d?=
 =?us-ascii?Q?lTS64zbuaknqYHSX8ULmZ7nDR9UtUfyZF+UVnplvpdFRuAaXr/aV1JX5PubC?=
 =?us-ascii?Q?47IQtTpI47EBdgL8LchysOAgxIeXD/IE4shO+9L0WjLxwbNBUV5k?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15851e93-b41f-4637-2496-08df04547c9e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 16:01:42.7995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EY61Z+41K5PYfM1+/pt3a0HXDpOFg6bvUF0pPF6pp0ZlswK1vOXurv7hCcifOe61BBvXEQGfFYtIXUumxGxsHv1hCSUxuzWeIhnmzNSCXc7dXrGuMT5h9GVlxo6an0d5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7302
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_090151_600568_288EA086 
X-CRM114-Status: GOOD (  16.69  )
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

On Thu, Aug 27, 2026 at 11:43:02PM +0800, Shengzhuo Wei wrote:
> i2c_imx_dma_request() acquires exclusive tx/rx DMA channels and is
> optional: on errors other than -EPROBE_DEFER the driver falls back to
> PIO mode and probe continues. If i2c_add_numbered_adapter() then fails,
> probe returns through clk_notifier_unregister without releasing the
> channels, because the remove callback is not invoked after a failed
> probe.
>
> Release the channels on the probe error path, mirroring
> i2c_imx_remove().
>
> Fixes: ce1a78840ff7 ("i2c: imx: add DMA support for freescale i2c driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shengzhuo Wei <me@cherr.cc>
> Assisted-by: GLM:5.3

Nit: signed-off-by should be last tag

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/i2c/busses/i2c-imx.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 19ec056b00af..c24d9201a60e 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1880,6 +1880,8 @@ static int i2c_imx_probe(struct platform_device *pdev)
>
>  clk_notifier_unregister:
>  	clk_notifier_unregister(i2c_imx->clk, &i2c_imx->clk_change_nb);
> +	if (i2c_imx->dma)
> +		i2c_imx_dma_free(i2c_imx);
>  	free_irq(irq, i2c_imx);
>  rpm_disable:
>  	pm_runtime_put_noidle(&pdev->dev);
>
> --
> 2.47.3
>

