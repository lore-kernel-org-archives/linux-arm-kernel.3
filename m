Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB13CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 13:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uWVTkJrDJIBXqlj9+8HdIo+Br2bIYyQNh7GqZUyPsO4=; b=tJHMZPi9PEmDv3e1pio0xZciO2
	+Ps6YYue9LkUKQm4dC6uvyIKcRstNvbz4Ipg5WZ/aURstfDvz0ke20GjKNx307+IKw6/4JrcVjPB5
	+jNEaR40d16tQIXL+nOnWal7MDnAR+OUan5fPNRyrKs+k/fQYsLgamAQheB+4VeUlDE99BfnwKa9p
	fehR2E7GndHm1WGNtAh40Xtz1SNCc/TSAgrPL9k6UDKIXzHYca23ZXJ4KCIxfp/dF4VutbpuAIRc4
	iAPccVLrmnAzCrDkhmDcAcRT8lOPVRv8y6WipUfZZX2gvajZE2Tdk7SrOP42yqhvEQ5Jg8H1d6QlB
	rH3AvBcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCHn1-00000009Wwv-45Lq;
	Fri, 24 Oct 2025 13:25:07 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCHmy-00000009Wvz-2Dre
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 13:25:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GBV+Nbirsy16JmmfVPdvK2wMRQwAma/G3843Tya4ljWGolwj3F72Zq6qAtp08j4aT3slahXi53pqeA9a/ETCPReMmyDBjZ2ng9sH0oKr9VSDecGpYLgUQydZSsGxtCrsYje1Sm05VEMdMyYoUn8oftpoYPalvkLKOgw9c4cOXL0JQAG/V3YHb83klEys6BN/To2x/XsJ8c/jcB8xNJ/yliRa5fK+vcJLkfrwtfcnC4GGccBypVHP1TIN7AgmffuWrHyYp3z1rybS6WPu9BtQsdxseP32Aw8zdXCeYuNkBBELPHM4d+v+yG14Myva9MuWpdEM53jv0WzGKSqZEAGz8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWVTkJrDJIBXqlj9+8HdIo+Br2bIYyQNh7GqZUyPsO4=;
 b=rRiW30dPlJvH9qu3vlWIK0nQ5LIxaHpdkVxvMBSEREp9Xq8zw3TigXWgSrA9E9A9WnHPk0hQGDHfQs+o5PTXbyqD1O5kjC45kCLxtaxSNLM3jYn+XqGa2njbRVnnVTuQO2vSa95LviTvSfos21TDtsBjfT+Dol6rtOF0HB2yu6oUWcHQRe5nLvMWMfvEhIXkajeKFrgpwawEZPARHzCIqMFZe/RBn1ClzVjVC4JUgLM3S8nsJoaODscDEgVEVkYshF5dFCLhQsCucP41esla4+V1H4yVtOXYeh2DWLFvw+94bmPvd95cBVQTR8n5Jz6N+2MASPcJjFhHYxS/QPF8yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWVTkJrDJIBXqlj9+8HdIo+Br2bIYyQNh7GqZUyPsO4=;
 b=TFHRyd4D7VEM1H/+Qh/S5KTvtIAzWekiM+FJD47j2h0Wnm/4JgP5XN3X592dxsFFL9YUBlXP8N8lksCEO+qs/oEhHBx/weJY5mOErC+88N215fMoa38cDOh2e2BGZy0bRYgy4suiAuyGhcrpI4z+GfQTpjoVjlNrXBgCdKyvdKthAkKLGtF8RdnvIdiBFlwQ8Vr74LqWve/+nhsvgGlLrXWwOs8B+xW68/F1FCOUA7q9pXu8oTe3rKJseasQ/KU12I1HZTKpIWy9yxQyHJgVqkEDeliWPab1DFv6Aa9fRP9DPMDsSHxVfz/aggtLsVXnoBvnOyQ/ZwXKJvOkPWRBlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PA1PR04MB10415.eurprd04.prod.outlook.com (2603:10a6:102:444::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 13:25:00 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 13:24:59 +0000
Date: Fri, 24 Oct 2025 09:24:52 -0400
From: Frank Li <Frank.li@nxp.com>
To: carlos.song@nxp.com
Cc: mkl@pengutronix.de, broonie@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-spi@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PACTH v2] spi: imx: add 16/32 bits per word support for target
 mode
Message-ID: <aPt+JJhaB9dUOwL8@lizhi-Precision-Tower-5810>
References: <20251024113107.513604-1-carlos.song@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024113107.513604-1-carlos.song@nxp.com>
X-ClientProxiedBy: PH7PR17CA0035.namprd17.prod.outlook.com
 (2603:10b6:510:323::16) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PA1PR04MB10415:EE_
X-MS-Office365-Filtering-Correlation-Id: 102d46bc-8df5-41ea-ff48-08de1300bb48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|52116014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3iiLFabNabSjN4KlfBT2Jy366RtTCYmfUbGWQb7auIuWU7YqpkAynkqWyVgk?=
 =?us-ascii?Q?dxjPczvZ52hG7MUtYjIHJLEXhs5ngN6LyICnhNntx9tIiOLhcgx6IiNH4mco?=
 =?us-ascii?Q?OT2cE3rC3u8VokTdBQLsV/liZ3A/904LAhp+tAPVXpLOVPUPP+RE6CcyVGgd?=
 =?us-ascii?Q?N1ujuYAkZ1Ie/wd32gHIUAz2DGQ0DgNaJkzoC4ehboUa+FdwAyAD6azEDSXk?=
 =?us-ascii?Q?wFHSRgoKj9KtQtY2VvCkIGsa3Fqn5vtWNIu+uqxKZXKXrhkCjF0gNRHJ2ZPI?=
 =?us-ascii?Q?tcnjOHaBZ/NjgrS5IjhOXRrn0n8dpAC9l4h+kyk/W0b/MpjW/xPppMNHwdjG?=
 =?us-ascii?Q?/v9EgWuX79HuxxYqaoYPcIZlU9lBKIfeWnLFbHedWXdrxc/n7QNRZjMWvWdh?=
 =?us-ascii?Q?fMraLBXNkes5iu21Da4s+sdTdpM/EXRjX8irJyO7/ac11Sn1jorxTxL6bJ29?=
 =?us-ascii?Q?aTT+jziqlLX+QF+/uc0vampqVO17mXaRBKGwdSkbazjCy6vdDe2+ACm6w4WE?=
 =?us-ascii?Q?qQOvUXkAHl2Xu2o7AT8eX9PMgjkPmK8hhL2u8YXqT1V0obE7Yx57KfPmOlOZ?=
 =?us-ascii?Q?9ZpB4T6OM+rNb/gB5KWe7DADeWKlBh8HxnXJfBh7/ImenO10dLbXLMqFHPiD?=
 =?us-ascii?Q?V1OSxy2Wsn95amOa2j25n9dhFyjVl5vxysPMNF0UkGXkwwn3CIVo9kgdFUwq?=
 =?us-ascii?Q?7jMmtjtIekZsiWTfpVWi5Qhh/EypD5eh3wFuCbGdaWFcOQtYFX7wfHjt2oEz?=
 =?us-ascii?Q?Y97ysNOByei8je+jUBZvqi10jqKG2CgS5u/trlvfBM0uDDBeYrKkjeG1i6Yw?=
 =?us-ascii?Q?JGVrTV9JUPBEN3+mPF1tK4kt8SlvTrOUbqJAiU6fG2QdyMjmZKXc/XSaIqWw?=
 =?us-ascii?Q?oDjpB2tXIfssVw12+O4cs8RDtgVFfPHDcrcS1CRsruv6tpcWdcWkZl8TpmIL?=
 =?us-ascii?Q?USPknUP/YYdeCXanon2KYSPnQTb8PTsS18gF6MRQiWd+BRoIShtO22Jojdc7?=
 =?us-ascii?Q?ZJ+eu1X8P5hwdkTdr19AVavDlsGJ+Zkzd83mj0fuXxzCiDCnBwc/eaQLfZTP?=
 =?us-ascii?Q?vTKX5uPgK16Cy+ZJ+5zEtrCE3eKoJFxVaO08ozPTqvRwOxrMnbtvTa6xK1mv?=
 =?us-ascii?Q?vnYQdQTUZH2PtYPC6eF06zafPFPBso64c/znKkzWeOwAuX6QLLZbEtgFTexm?=
 =?us-ascii?Q?pD85FVdtNphA4vwMZCyfTEOllfi2I2FZbevOSEwAiicRvdrR7SOrG0Vt9K9v?=
 =?us-ascii?Q?wKuyKs195MtY1Qc4ubbFSGPYR0tXINtYps8lEGe1Lsx3FA4C2gniWRHnxYNO?=
 =?us-ascii?Q?G5NLMwB07CPPwvuOOCc7dju6RWu3v0bSTFQQALW2xt5WUZT/VVmalKBBvxR7?=
 =?us-ascii?Q?xiBkNQedpxN0w2lX+MKgKeR0kN7Ng3SjXs+Aqz6lLjKQaYxGySL8Ed36ZnlP?=
 =?us-ascii?Q?NFoHWQsMlmljigpbVZ/NelfbXfgStUXrt8eMrueI6FBAc4iM6W6/jrS25fHC?=
 =?us-ascii?Q?Xz+9gdFysMGNlUMX+aW8kmdtJlhvd1m/DCDn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(52116014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EZaXrB248ejz7iECDaGqiuun62+2ucPygwUqC9nYHNqmxu7gSOTjzgCMbbiZ?=
 =?us-ascii?Q?HEQ6xSrFjcWy4g5CYob0+Wbw9wzwSu/cKLbT9XOSkXZ88SnBHV1jfjpQrawm?=
 =?us-ascii?Q?skGqxagAOCyDxUjKY71/lyT3HFKPRHPK+pjnfFk+UBC2gCPjkwx4ZV3FZ30g?=
 =?us-ascii?Q?s54Fe6TEIGGS6sG2haan1W+ZE4hv2FVSk7miyyi+atKJOFsQA3PvovfyGe/X?=
 =?us-ascii?Q?wJZqxSBKrF3mZPFmSLeuLG08R2QL1xE4+kKP3JPGnMzgvBLaMbimhKZg5CL8?=
 =?us-ascii?Q?EvMsSiDdi6+IPoWn0BSk8LGFIG+6twEfqkzDIEkOdJVvB2WNKIZp5UthP4VA?=
 =?us-ascii?Q?05aV5qPqM/zDsNI/sYHdE3jvYZrJ/OOdujsnzA2QLWE440uzHf7RmR6PAjZ8?=
 =?us-ascii?Q?0kAO8iro1fMML1y7mHPyA860P6gpWNaGp7JJSI2Ofg3HDR/IwWeQR/lBX78d?=
 =?us-ascii?Q?jTsUPIP0/KXarbF16A3iOtcIBpo466ldBEGixMB8FMOVE/KjNLshAcq1TQmU?=
 =?us-ascii?Q?bHE33WcBQHPkSK8Rm4MGx/0tZyKMhBTC+95Pi0WzACXeU0MCEnKheS4M6qrr?=
 =?us-ascii?Q?/g9M9fS7VFGQhXWb9ZHTmi9aYIocc6DY/6639+QiXxvehR7bBywlZo1WT4Je?=
 =?us-ascii?Q?QHOTc1AJThUivtETKLod9+oqTOinS1ezgJTFJyv8poap7N40/kmLhXZ/2QwG?=
 =?us-ascii?Q?2Bm0eBD6j11mlERSgwGpO6BaApFxt4MmzEHyiBDkyYcIPCWvDyPNy/rgtSo6?=
 =?us-ascii?Q?TRUdgH9uIzTh79BbyaVyANyKOHMx9k7dTGE32wuD1OfyNsUCJZnxHTVeBYzj?=
 =?us-ascii?Q?aS7L9zPPXWVaN8P9JhkZitTPjGML9dr+LXicB+iyxxtRsVTrux7p/kdvB7CV?=
 =?us-ascii?Q?X3sfrwIjUP69AKooEtNvuHbw0EZMuDfDhUW63sBCeGaHPZELKEIP3Y63RVoA?=
 =?us-ascii?Q?ECocg9+JCNzXzeycHz85+vykMmxE68Zf7Sn8CKiCESlHfo5x5cSMo4cIZ8VK?=
 =?us-ascii?Q?Q2Ya/RqAlZ3CqqMSp7eETSaPGKRgRCPDp21SLP2BHfXo+NrddvymIVKmGLaf?=
 =?us-ascii?Q?vaf2g0drMiMupOQfovHfioD1N7HDDgTl3ls3CbXOvMA/3MuRFUP7TGGmNuKx?=
 =?us-ascii?Q?OXu3c2vxF2zj1otwLSqaKV5KoMY4sx1QQuLRBH+9ZKvjawl6Uvgh1f6j7WtZ?=
 =?us-ascii?Q?qMU+I5/9Djo4iDG/He1pQDVBjGKmiv28ovup/59ejA2OfXDwSN+xcqhxYsIQ?=
 =?us-ascii?Q?hJJy6lnW0dX+gFoBTaudRSUIjBTBi8SNo5tMOr9LKzMN/tTPIKtOt+eQurGU?=
 =?us-ascii?Q?vWfnHpXad9wlRe3U9U3GkcSsCbvTmzCebLxSFuI6c3hAFsTYKc+UVboe5zeu?=
 =?us-ascii?Q?ILiciW3cLPSkMT793RPzDuXr90iJ99dkOpBYCbxF4dzmMpO85B0ZpBvt/1or?=
 =?us-ascii?Q?EkPO9kK9/1SYHrOmgrGcLWmA4d6byx6yaE4pK0JwBOQb9O59IiAuwMl615/y?=
 =?us-ascii?Q?82B5SB+Wz4KxQtWLMY3XpSJ3IFvz0JLieilABvla1gVBvSGcUg47UgrXgLj1?=
 =?us-ascii?Q?miEYJ483qUAGoDmOjx9HEvd64efCkcq6ht+Zwex6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 102d46bc-8df5-41ea-ff48-08de1300bb48
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 13:24:59.9345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MxgBP1EncL7IEw3xaZYca1lo/k/60i8qQaiku38KekuJgFDC4I2Ydu/7YPA4qSz0tKchpNjWjMOJHWFaZJdBdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10415
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_062504_574482_B59D605D 
X-CRM114-Status: GOOD (  18.10  )
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

On Fri, Oct 24, 2025 at 07:31:07PM +0800, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
>
> Now for ECSPI only support 8 bits per word in target mode.
> Enable 16/32 bits per word support for spi-imx target mode.
>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> ---
>  drivers/spi/spi-imx.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
> index 155ddeb8fcd4..017f83f5dfdf 100644
> --- a/drivers/spi/spi-imx.c
> +++ b/drivers/spi/spi-imx.c
> @@ -424,8 +424,12 @@ static void spi_imx_buf_tx_swap(struct spi_imx_data *spi_imx)
>
>  static void mx53_ecspi_rx_target(struct spi_imx_data *spi_imx)
>  {
> -	u32 val = ioread32be(spi_imx->base + MXC_CSPIRXDATA);
> +	u32 val = readl(spi_imx->base + MXC_CSPIRXDATA);
>
> +	if (spi_imx->bits_per_word <= 8)
> +		swab32s(&val);
> +	else if (spi_imx->bits_per_word <= 16)
> +		swahw32s(&val);

Needn't swap when bits_per_word > 24, like 32? or our hardware max support
to 16?

Frank
>  	if (spi_imx->rx_buf) {
>  		int n_bytes = spi_imx->target_burst % sizeof(val);
>
> @@ -453,12 +457,16 @@ static void mx53_ecspi_tx_target(struct spi_imx_data *spi_imx)
>  	if (spi_imx->tx_buf) {
>  		memcpy(((u8 *)&val) + sizeof(val) - n_bytes,
>  		       spi_imx->tx_buf, n_bytes);
> +		if (spi_imx->bits_per_word <= 8)
> +			swab32s(&val);
> +		else if (spi_imx->bits_per_word <= 16)
> +			swahw32s(&val);
>  		spi_imx->tx_buf += n_bytes;
>  	}
>
>  	spi_imx->count -= n_bytes;
>
> -	iowrite32be(val, spi_imx->base + MXC_CSPITXDATA);
> +	writel(val, spi_imx->base + MXC_CSPITXDATA);
>  }
>
>  /* MX51 eCSPI */
> --
> 2.34.1
>

