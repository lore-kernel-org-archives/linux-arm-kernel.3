Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2AFC5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 16:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6XZCWxY1XsBnWhwfRmFDK31ZwbItCUCQVYguDHtG3Y=; b=uHoyv5996KsahPS4PJCMkXnxi6
	x6nKZa9sYOKOl03X/43VGDpH5ABcKogxYHCZvZmsS5C0itZJszY9Tl7b7zC8/RfK0Hr43wUmP9Q32
	3ve0XekOdtM687SGBrDoEBaOozvJaDhDRtXtbiPG0UXgT/wT3IpeYRH4iP9oL1BaKzKZOb4Nz2VlR
	Jgy5UrDYYk568E4ZRPYEylfiWDPjMrZy4lGMa7M0uzRqwsvTDsZnn5AU4ZR+U33rBBITixW2O8/Wf
	Kjew61nrjlv8zqkFTw/3BTG9E45ppS2+Vb7tLunNiJlNJgXigNZRr+D7+GREA4dG+P9R2Oj5GE0ox
	Np9hemwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvzoU-00000006Tkk-0Twt;
	Mon, 17 Aug 2026 16:03:50 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvzoR-00000006TjX-1zM8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 16:03:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GTzfTe2v28fboiFMPNdF7neJzlJ/YDNZh37iHImVWbGAeH4APh+NeWuZZpAkF1Cjov7O9Z/fVHpazV0yGNYqCYFC9z+s9gFNSb7j34/3D8xtkM0aTTYPtNzhk07XUiVbHxFoHgF3vGA+YtaoEJOym6jDM8Oi5Otefrsx6iFkiZuajmGbyXgegCSHV30LkKwhPxMhBAbCA3yxcqPEU9nfimw3EwrEoJOnTEtHeah6oT9vRpNTC6RRyOH/zhO8cnYuwm8YCo3b2i+Clr3jPe8o27QkibRsd1DRAaiW0xEkIdwet4cQwcB70JIaAhJus97Zn3dj/PDYBJ0my7dJUH5QPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6XZCWxY1XsBnWhwfRmFDK31ZwbItCUCQVYguDHtG3Y=;
 b=kZMkD4Wy+rcL4EyVtqH6z4DsiAv2GHZFG1XdGZ4I5PzMW9bRbzeH7hkwN/ksfPU8d+bDUDUwpL2bB7xOz70Lz3xdoR+D7QbK8neXCpvsUT5AbX1fHbjcUCBwwlMDXYuR/VADaKRhU7pNxlwEOn/5UvI/fcOF7l0/3EaPC3ke16n/sYEUllXokNAGv2+7PyRbxe0PMkyI+HkxRbrkW1EmZ/gbvrLytzbBZbPq3Nb2afrdLAbIPLlc0IzCKYOxL6reCaz3F61QVKVaF44a0Q9u4XHQIeMTMy+XgFLaux/HkmnmSc0Wrt45bfI/ebMESGMEfizmm0Kd2G/y1ij2LQeYqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6XZCWxY1XsBnWhwfRmFDK31ZwbItCUCQVYguDHtG3Y=;
 b=mp824VsYLoBJOAS8OKTFY6oZwDIu5Nes80KzIX/cQR0/Xe7adDTzVO7oa92pP663Sj/5ZMBAb06Mn4KHwo67daFrr7Pud1GB7eJQlgzZ6DpVgOGMUCUeoyOv0fnmjWLh0p551IRWCKKFT7GmeMTV3JOMDTqBmkTARUxroLWrA39wecG2ZB83w/12OHsdkNl1VX/1dkDBeusjn1bBsKy1SteDjhmNsZ+xa/5DbiCYTqCEBteF+Pv4ics2HZYPJIfnz7ONqp3fh0uIHPSgDxluNLhw0yMZ8uqkqi0+C1Dcs3UEjzP2ZaVRQ1eXxAOA5zOt447xcUkaFFSoO8sDRH8cNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8719.eurprd04.prod.outlook.com (2603:10a6:102:21e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 16:03:44 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 16:03:44 +0000
Date: Mon, 17 Aug 2026 11:03:32 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] dmaengine: apple-admac: Add M3 generation ADMACs
Message-ID: <aoMw1AkJYMcaOBHH@SMW015318>
References: <20260815-t603x-admac-v4-0-1149e342dcb0@chaosmail.tech>
 <20260815-t603x-admac-v4-2-1149e342dcb0@chaosmail.tech>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260815-t603x-admac-v4-2-1149e342dcb0@chaosmail.tech>
X-ClientProxiedBy: PH7P223CA0028.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8719:EE_
X-MS-Office365-Filtering-Correlation-Id: 966cc80f-d7fd-48b8-63df-08defc791ccb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|7416014|19092799006|10067099003|56012099006|3023799007|18002099003|22082099003|4143699003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info: S3jM+zN9O9vPlnai/lwVG8JE/OhiTpDU5bYvv1l1ZptA32QhlojG8NYKHs81VFkMpWk92kz+Gmx5By/CGi+ShHb7uxYEZFaj03/BE58c3lYUEtBYr0ZO6PS52598Zsr/f6yKOF0SjV66E2uK6iVl3v8Z//eB0Dlb+qLlpmRexD6SMy1QxrAW/GB+Kf7qlWxQPADNh339qPiysmPWyf6SNScdGJMNYRbJQ4qJ7dxQG26ElCyYQcK2ObEWwLN266xbt4uq/ANjwEa/3/TKnyn30a3NY6FxP/ZzpPfr3N9DdGtO2UEqyrYFQUxnKwzpDf+iAKssZrm6pdMty9qYQ0gvzMsKJp/LDowVCNMTiw5pAaHZaesYzC4DXhUdgPZYzSpjY528H8M5ybGq4cInrdwsmdQl05I+RLjUwVEPpzMd5DLZCeHp/pzzvf2GGgFY8Ho927Bdc4dqG+lanT68yyEz/q1SC3FSrRvMnedl4K0fjTGUetb1UD206as6OEdwxqIZKzc+2CMaJdSc7tqt3eHYCu94MXu2+gj/7RrKE15DqDnSng1vV+W97kfb/2Pjky48xITnPjo/eqkDAwFK7qQtTsZHwu86sOhuzcfOAzguY9iFZaixsJUOKp3QzrSlW4qjQMZ6aF2VKCmiSoZHCyPe9+J/x29bXfTHMIBPR1zz3LQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(7416014)(19092799006)(10067099003)(56012099006)(3023799007)(18002099003)(22082099003)(4143699003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aVJwqkDn2E2d8aIDBz9npPbAuPxoKqAjDmd6tS6+R/allkydfzeOLvA4P1Il?=
 =?us-ascii?Q?i180eG/NBYUkNTwNegPE6yTnvW0ERu2Kbm9am/dKHZ3V+++SWDG18iIZ8UFU?=
 =?us-ascii?Q?P6mkqFspdGukEGRptXluHPYLGR/zUwHEFD4aSXz5o3fSrEpYdXuKigyQKTyw?=
 =?us-ascii?Q?DgpJaarULTzFogoUWMfd+ANTQFrmXP/7Y11yIA/0/wL/0qWfZ9OKufMAGRgi?=
 =?us-ascii?Q?E5jQJCj9rCQdws55Lbip6p6VPtaaEed2M2zUfnNEcdFPypaET/+Wu9H47/l4?=
 =?us-ascii?Q?w65Qz2o0XN3PLhRYqoJnVJKOYggvr+dBdA+kMmCqldkZF7Jyn3b5dk/qOMcH?=
 =?us-ascii?Q?+d1sgfK4YKibbVTyJr7qRKPBYDepFcdaQFrnTmeFWfCi5TIKSK+pgnsBl9dL?=
 =?us-ascii?Q?D0CpGpFD4PSyQmbzBQ8pMFJBSCgoc78P7wXnaq5SGVm18mryEgMdMP6bIfRE?=
 =?us-ascii?Q?kWjJK50T3Ib2s5O3dKg5lTWk808dVp+JGF/OcPj/1SkXQthK4uyp4Y3lwfrE?=
 =?us-ascii?Q?mXWbUFpYdgTHa4jIkjFYxP6vIRaIabXZPF6tKuWFfGguufGyt3VV0suIC31p?=
 =?us-ascii?Q?WZOV5PaLCrzE7PjsYo7nQsWcXrAKcnH/srTiaH63pzKkQi7f4sOjF8dml0AU?=
 =?us-ascii?Q?Tkg+UksnG5kujXGsOzUx9Fpohbn4yPKc9ygWd/HoKAhyEaI+SVBRJcEE3E4k?=
 =?us-ascii?Q?eOL2H7o22bxVG2ODYx/LemS5ZSgIGrLrSoPq5O9qLn6VFJITKtznQWNqtor8?=
 =?us-ascii?Q?4PF1RpVenkpPdE6emIjl7x/kzzdBuJ2Wg7GiEuvA/ciwUWPHw0h/Top64+4i?=
 =?us-ascii?Q?HtYJZMaYav0bpemEA9y6e0G9QV/83asTs0vq9i+LdbUXLyqVZVjxP6072J9H?=
 =?us-ascii?Q?PCf4M6TGgHhhOmLMKqQwaGjwfW2RdOZgSi8gDdOSx89P9r7ikBDoEhbXW6kk?=
 =?us-ascii?Q?XOp/bsjRNMQUlDKSS28dZbM8VkqefKepohkCwGb94tX43sWREAmanBxs7Wh0?=
 =?us-ascii?Q?/d9LA3v8hHOhZbzhloXzD9/HxSRZ+kL4Ro+8iMCVY8OvB1IrVJpP3vFxqWYI?=
 =?us-ascii?Q?v19zv56/juuBP4lsskYMDuuBOrlrlH7dRWQgME2NbLRL0oSfjqClboKstcpX?=
 =?us-ascii?Q?Jo1dFULh1wkoWsqqx2kvvJP3D+bKZD55rIxcSynjvljqMt/RzsklT0kLb+m3?=
 =?us-ascii?Q?7zN6tRStmgs9aZZe/MvftDBvtUmiyUIlPk1UHecEVwmQF/m2tR0fE8ljyiM5?=
 =?us-ascii?Q?UVFTBLejZnw70nFSwQAYQ6pNGgmJqx9BJDuceoqm/MUQJOO2x+kgqA1BGb0C?=
 =?us-ascii?Q?tDTuAtMqKRm4q4ts45weo8Gozwb4yjWdLMb2jx3IjHV28qdpMiCawv3Xg1cz?=
 =?us-ascii?Q?uvkqMze4Vh6cPANapElBG3re1HMQ3wf3Bcj70efXq/BnKZaQiT7gEYl05jOP?=
 =?us-ascii?Q?u7pm8kvKCYLz5r51KcuQEKot7flXiUovjUvXummzP3s2i/hGm+UUkCPx2Ir9?=
 =?us-ascii?Q?ZsWREa8Ta6RS5S+tU/JBXh08ekTysXYwhNH/N2HLJGG0ew5o/J3XEUzTXUrC?=
 =?us-ascii?Q?QFqbvgzy8sjumYw3aKUJvqVCMakGIz4/hy0yo+8oanX67Tor0uxnebHg+M7K?=
 =?us-ascii?Q?7+S+2xMzwd1xBuHvWM7i8xdKNqV2G3igjamwEb2+PQy33kQjSIaiOh7apP/c?=
 =?us-ascii?Q?JyuZGq66J+k5u7L45ZheJ9Og7ciwcs9F5qjthQRmopsuE8mS02kurihBlNgR?=
 =?us-ascii?Q?PU3GED3JiEn3fz+d6lmLzTbByqWINWPNrAVfyA12hwpTf/rngrGi?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 966cc80f-d7fd-48b8-63df-08defc791ccb
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 16:03:44.0365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lwY2uyHTqZcs1REDvCIE6W9usv9HznCPAWv/8LnJu01+U7sNB47mcx+iPaQ1Q6+qniFfIsiLg52kMVG7opgEK1mggzN8pofI7NLBougMdBeUxyM50HVzSljz5NJ2g+zx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8719
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_090347_516504_D976FD7A 
X-CRM114-Status: GOOD (  21.38  )
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

On Sat, Aug 15, 2026 at 12:41:39PM +0200, Sasha Finkelstein wrote:
> The admacs present on t8122 and t603x SoCs need additional writes in
> order to operate correctly. The exact purpose of this register
> is unknown

Nit: miss "." at end of sentense.

>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/apple-admac.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
> index 14a5ee14a481..9a1c79c12268 100644
> --- a/drivers/dma/apple-admac.c
> +++ b/drivers/dma/apple-admac.c
> @@ -39,10 +39,14 @@
>
>  #define FLAG_DESC_NOTIFY	BIT(16)
>
> +#define T8122_UNK_28_VAL	0x200000
> +
>  #define REG_TX_START		0x0000
>  #define REG_TX_STOP		0x0004
>  #define REG_RX_START		0x0008
>  #define REG_RX_STOP		0x000c
> +#define REG_UNK_28		0x0028
> +#define REG_UNK_2C		0x002c
>  #define REG_IMPRINT		0x0090
>  #define REG_TX_SRAM_SIZE	0x0094
>  #define REG_RX_SRAM_SIZE	0x0098
> @@ -85,6 +89,10 @@
>  struct admac_data;
>  struct admac_tx;
>
> +struct admac_hw {
> +	bool set_unk28;
> +};
> +
>  struct admac_chan {
>  	unsigned int no;
>  	struct admac_data *host;
> @@ -127,6 +135,7 @@ struct admac_data {
>  	struct mutex cache_alloc_lock;
>  	struct admac_sram txcache, rxcache;
>
> +	const struct admac_hw *hw;
>  	int irq;
>  	int irq_index;
>  	int nchannels;
> @@ -747,6 +756,11 @@ static int admac_device_config(struct dma_chan *chan,
>  	u32 bus_width = readl_relaxed(ad->base + REG_BUS_WIDTH(adchan->no)) &
>  		~(BUS_WIDTH_WORD_SIZE | BUS_WIDTH_FRAME_SIZE);
>
> +	if (ad->hw->set_unk28) {
> +		writel_relaxed(T8122_UNK_28_VAL, ad->base + REG_UNK_28);
> +		writel_relaxed(T8122_UNK_28_VAL, ad->base + REG_UNK_2C);
> +	}
> +
>  	switch (is_tx ? config->dst_addr_width : config->src_addr_width) {
>  	case DMA_SLAVE_BUSWIDTH_1_BYTE:
>  		wordsize = 1;
> @@ -800,11 +814,18 @@ static int admac_device_config(struct dma_chan *chan,
>  	return 0;
>  }
>
> +static const struct admac_hw admac_base_hw = {};
> +
> +static const struct admac_hw admac_t8122_hw = {
> +	.set_unk28 = true,
> +};
> +
>  static int admac_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
>  	struct admac_data *ad;
>  	struct dma_device *dma;
> +	const struct admac_hw *hw;
>  	int nchannels;
>  	int err, irq, i;
>
> @@ -822,6 +843,8 @@ static int admac_probe(struct platform_device *pdev)
>  	ad->dev = &pdev->dev;
>  	ad->nchannels = nchannels;
>  	mutex_init(&ad->cache_alloc_lock);
> +	hw = of_device_get_match_data(&pdev->dev);
> +	ad->hw = hw ? hw : &admac_base_hw;
>
>  	/*
>  	 * The controller has 4 IRQ outputs. Try them all until
> @@ -936,6 +959,7 @@ static void admac_remove(struct platform_device *pdev)
>  }
>
>  static const struct of_device_id admac_of_match[] = {
> +	{ .compatible = "apple,t8122-admac", .data = &admac_t8122_hw },
>  	{ .compatible = "apple,t8103-admac", },
>  	{ .compatible = "apple,admac", },
>  	{ }
>
> --
> 2.55.0
>

