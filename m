Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26E7C5DF89
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 14:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xhl2n/afS+BVpYXMgZyv6wbyt06DX3Hmqp58CCrCkkE=; b=thw5HpHJ2uyETJyX7i/p2hX/Xy
	LCLFkOTkWvnfhShx5S99bHiK9mV227cAcliiBZXnhMzOQUHQkZtgN+WbtkpVwd5dbnExWh4W0LKcq
	HZHfFAeH3zHGJr/LVq7sQ4XFRbKFy/E3w7fyLvA67/wIsK9/bYsOKrczLgBwZQ5SsqoHa4jtzEVSt
	cdZAgqU5oOpee7ugjWPlGitSws8M2ycxAe0F6WP7ylDQwsrE/AaCARU9829+pDW/kAo43eg+F3GcH
	5ZT1rVPJNFNSlT546qV3tsx60VVObQPcGzCcgHe2BTM+worrTPxefHp1OIrNBq0E+D+JMsjFtX4JN
	2Kkn0wCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxQBE-0000000DXjm-0Zjh;
	Fri, 21 Aug 2026 14:25:12 +0000
Received: from mail-northeuropeazon11011021.outbound.protection.outlook.com ([52.101.65.21] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxQBB-0000000DXib-17PH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 14:25:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TX30Il+DBZWKV0NHHz8VETU1vZw9MXWaRuCPGvEgOBuMQhM2oJqF8u5brblGsIDiMa4+qVozd650v2+RKDyHVbN7vILtkAQhBpJiBosUqYu7ZF7x9wpW1Z7JRN7ov633T9WWRjc4qURoqmDB0Y7cEI3mZxT9zZGRplnqC7iC8qOA7bgD+m9Qo1CaO/xb0bt7rL1d1KCelGVks7GlG743LD4O8Kl1R6cJvs2LR6SK8PoIWZaQKOACeF712AP+VSmhIEAgyCCLZ+7wJFFMiAnz9gIPXHC+oeZ5QyFrGdE40fp8MlbiCESQx9ZMj6bs/EHKpixve+CyFEWshm6drprGEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xhl2n/afS+BVpYXMgZyv6wbyt06DX3Hmqp58CCrCkkE=;
 b=gYjveUgWSV+tiYNNJkVexjfCFLuxafTGZW+g7RMn21+ITzBzTk56nK3VCi7Y4DM4zKCkFy7KoCmxB+5d8uzceUWZIbOPDqBwPVboO8Fsxg0TUuDY6sOtltxheo90sdj+b59/yE/U3WHZOcNiB+QolA5snc7+pLOrS8jbZmvzgBEJunFSIiRnSTBSIITYKc433CgJtHMzBXBWqBN/DQqMz7mD0tlqwDxR5lLjiTKhX9tZKNLpl/6vGJ131od4KVsrjxcthO1IsmEqRlOD6A8uUNu+uBm6nDs+8onRoOeaKNxXPSIl9PKX8uF15tA1eCe3Ov/v/hgWIVhDb6i3wchcPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xhl2n/afS+BVpYXMgZyv6wbyt06DX3Hmqp58CCrCkkE=;
 b=NwW6y901U5oPKb5PCyIKf7VlxcYLukOSLGE4YQrmC3EyG5pPeq8KSYGzSIRJ7GYyVGk4FhSbwxxi3mNyWTZOTe+THVCYSV2x5LwE87D99xpRmPkCpb1DVm0/1cWQl4ATrsBgp02z1+qjaW943m7hDTeI3k9vRz0Tps8/bB2YNTJBienHjE+LD0V8NMHNA1PIFkWITQgIHXonWDdd7AUw8oZRkrOfIiJoEasaTb0cokhXgao5wCNcIeolkhUGuoIsyiGRVYXydZnXVmwcfl9CH6wbGX2V7lQ5qB7GOhEWJuqATsjL+TNkEIJctrPCkw/CayHCuQ1F6bCHoWyOciPRSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB9707.eurprd04.prod.outlook.com (2603:10a6:102:24d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 14:25:01 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 14:25:01 +0000
Date: Fri, 21 Aug 2026 09:24:52 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Zhipeng.wang_1@oss.nxp.com
Cc: Thomas Gleixner <tglx@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Radu Rendec <radu@rendec.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jindong Yue <jindong.yue@nxp.com>, xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 3/9] irqchip/imx-irqsteer: Validate IRQ count before
 creating domain
Message-ID: <aohftK95_iDsTPPm@SMW015318>
References: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
 <20260821101039.4037925-4-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821101039.4037925-4-Zhipeng.wang_1@oss.nxp.com>
X-ClientProxiedBy: PH7P222CA0009.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB9707:EE_
X-MS-Office365-Filtering-Correlation-Id: fc7285d0-4ea2-451a-cc33-08deff8ffc1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|19092799006|22082099003|18002099003|3023799007|56012099006|10067099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: mh0rk7ViCL/hKROkGLIZdPu3baYnxvzB90EmDEKr8SpjGDyYlDmAm2j5y5KAxOw1b9LRz3ZUKBks3gUBB2viXXRszLCbLKr+hP5+mJEd8FuHTGWZMpf5PJ5i92nLl/HNBvgr5jQhaqDpoKrCtNDrgKHzQEM1YD29KbeWcFL/+IJHmO7jPLsi34OzeqoB5YULvjVkSSyK0E3F7kl2bNXmKwCBsbq+CnB8KqATTCoxuEreAKZvnQ9qKYblFoXt+TV5vRi0h2epXlhlTYqv918IO5fNdDwkTvS5h0tKDeWIvcgG5tMtM1ecKzidaH6afXrHutF9jFoBN93kwKe0tA+oEbHWCUETrq77r7xV9Om/fBrNW/4lgetmpfCSNKphFE3ss5jj5niR69OdpEhE2HxFFkPPDMARrgEC2Bqp+1XPeT/WWzKUWDH3UIiIM4jHMg0pre0Ok8AwTHNVsG+b4uK29oeMaEOLjiDF8a4BKCByOVKkr0XCTtMUnZVpFcGFjYmEDauIF4Iq/zZSdJ+gRwzCuyG+cuc6WFH0Z4PtybQQvhSA99ErdrZ39VqAugSX+AmlKP/Omn5X9h5ZrsbjWrq0okt6qbANy2Rz+fSzjjFHru0GOZi9ci1s9d/1Cawv5xEdk5pYbo+0l2Kcl6BbmGkuwM/CXqC5ASenz2HPTyNtq+8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(19092799006)(22082099003)(18002099003)(3023799007)(56012099006)(10067099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cLrmi1E99LKCueXWtXZH4zrwTqU9SWvnAU8yECv7DPbpw6Miuj9pmem351nR?=
 =?us-ascii?Q?+E9wZJUgW/7uSKE7mWf4QQN77PrGPoS7OXI9XGcRMqwnzkYst3re1l9yypJD?=
 =?us-ascii?Q?ejliJjfeSx7rSREGI5XEXnTdHSBCATwZfewyfPwXIMM5r4WlIt4eoZ8lABhl?=
 =?us-ascii?Q?FOYo4hVBkBzXIpMjbjZq6ewegjjLhpkFLlpLW4T/iRN70Xfr5fe134NP8x91?=
 =?us-ascii?Q?SFOhMKIMcjaMkP+hjn7wfO6dtpgN9MDLRrioWu/GeI84IjnOABLq4BKdPKKk?=
 =?us-ascii?Q?DU98kU55eE4l+X6KznJdnj5ZXzvXul6nFzYgwL0ux0Wbp5+tcEC7CIYL3YqX?=
 =?us-ascii?Q?9/9DSUjnUE4fpzxOXAn53qW87QIUaeLmuHhOqlQTt6hCyQVvfp9fUI5hEHmq?=
 =?us-ascii?Q?It/KABInnMyYE3XKlXQPgiEgcH43JJteKpLOINGjnSvceGSdxvyzlaeD26n3?=
 =?us-ascii?Q?HZILkEJOqqfYQFkui+G245yqs2yevuXJF1Jz/u+M6DuTrmvJ00cWuQWj/8Ch?=
 =?us-ascii?Q?S5Gud32VwvYCeUaEknDmgsYy3Xiq/9q+8yu7zeXMiqCjFisMkn+QaxhMNPeu?=
 =?us-ascii?Q?qWgybw9E3Ig2OTQtijB3+IPANUI0qSNv7wn/mdbuaVu7LZZUN0MExwpbSyEY?=
 =?us-ascii?Q?NDyJjZFzzWrB0AhDGVrFJHyiveRnmN4JPhd7oGMC3m3gifNXQUIoO6t3epUk?=
 =?us-ascii?Q?cMATapgFeYD9od0usGS01sYltDTFqoQ2rf4j7JuLt6aT6bNWdEebVCvrWFLf?=
 =?us-ascii?Q?EJ6SYdTJwqA8Nr3tlP6DOZ2chO4TED4F7sQ4N27+Bm3p4rMBT97KwHYOfeRQ?=
 =?us-ascii?Q?Czen4tbFeVUG87EqPLvNf/N99DhnITgnIumxkrK1gjeM8cyzfiiNJnD5kEQa?=
 =?us-ascii?Q?8bLKR2rVVJpKtdw/DF407kFTu0K6bm/tPUxZ1GGIpsOBOxYAQPZMR997L4Qr?=
 =?us-ascii?Q?ceHKaZvA9PqQibpiz/5CbR3ka9WoQwIsYX3DPAz+uNlCkum5YrAmCtlHDqxH?=
 =?us-ascii?Q?AL1nVPmtMRjADsV+6tZdzzLHLfT/jBo8pHaKIFcuo4KiWSMTLZibWBvT1WeZ?=
 =?us-ascii?Q?HVInpDFkDrthvVxXdXY/Azk2QWxORa8S5f/mYeliMbhfYEMgQjftw/lxyqV2?=
 =?us-ascii?Q?VQJ92oT/h+gmq6Vc+ebaTVIaWZQ68aFnJA0LPbGg4YVLUY5Ql4JagbcUKhzy?=
 =?us-ascii?Q?mhpWaGonY/HoLR3MdjpZWfaIJUdfArU2EwZzPSKZaeEOpfy1JCYMm7zzT+pr?=
 =?us-ascii?Q?xeFwk2Nher8fecU3E+UBT3tNoFr2pkCpI3u6OCULph/Fe1vNx0wTXvgJ9Fys?=
 =?us-ascii?Q?6rb2Vg/yAtHk0kHFgwCG0s3t5lzxQRmNwfBQTqLfCSvRW+zQGrF1/BFFFgmw?=
 =?us-ascii?Q?ah/aNdfJ1wmmvn+vaznFEWjbTATiJrUblg5HK93BmqJbfYHSgOD7IBeoXC5y?=
 =?us-ascii?Q?ijgb8wZaAPPtDJ7fQxf/0hAwL/8HJVTaXGlaX5nhHdG/sg85cdamDdJm7/aT?=
 =?us-ascii?Q?sZ0FtrjhAv9R8sm5TmRa+eRQo2GagDQ8VudIqSchiL13XlLi/ZKsIFlIR/1g?=
 =?us-ascii?Q?xlBihtxvhCpt2FdF1ZQV5rNYrrFG3XDTIO8UNI7ZObarPioZ+2NapPFR7+2d?=
 =?us-ascii?Q?GhGvg7ulD0Gu5y/To9UnLKMeN/Hz/Jdo1oZkhdXkzFZ/6allACozTXH7R60x?=
 =?us-ascii?Q?uANAzn3AocDjJIGpYdQCb0soQXIJolZLpIEsrG84cwaYPJotBOPaqpqqAVI+?=
 =?us-ascii?Q?lZWRVGJapCvosnPsbN0T1E/J30IlML4l/5k5GOe2jARNl3DJiylR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc7285d0-4ea2-451a-cc33-08deff8ffc1c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 14:25:01.1249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qrb/Upkn2/Mcv5rH2fyqciVlvRZSrmrLl+Vv+URyzH79goFrVruMD9+8u3jwDwFFl+wheHNROcAI6nXEMzzLrm9on49e8KHWrsCO0jgLPe/EkFVODnmZPCszp6iksVBI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9707
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_072509_326973_257B442E 
X-CRM114-Status: GOOD (  21.35  )
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

On Fri, Aug 21, 2026 at 07:10:33PM +0900, Zhipeng.wang_1@oss.nxp.com wrote:
> From: Fabio Estevam <festevam@nabladev.com>
>
> The IRQ count is validated after creating the IRQ domain. If it is
> invalid, probe returns without removing the domain, leaving its host
> data pointing at devm-managed memory that is freed on probe failure.
>
> Validate the count before allocating resources to avoid the leak and
> dangling pointer.
>
> Fixes: 28528fca4908 ("irqchip/imx-irqsteer: Add multi output interrupts support")
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> ---

This patch should be second patch.  After move to second patch, some error
handle will be nice to have.

your 3 patch needn't because no error after it. change to devm_ version
will be improvement patch and put after new API added.

Frank


>  drivers/irqchip/irq-imx-irqsteer.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
> index c1df84551efa..571324de8bd1 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -218,6 +218,8 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
>  	 */
>  	data->irq_count = DIV_ROUND_UP(irqs_num, 64);
>  	data->reg_num = irqs_num / 32;
> +	if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT)
> +		return -EINVAL;
>
>  	if (IS_ENABLED(CONFIG_PM)) {
>  		data->saved_reg = devm_kzalloc(&pdev->dev,
> @@ -253,11 +255,6 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
>  	}
>  	irq_domain_set_pm_device(data->domain, &pdev->dev);
>
> -	if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT) {
> -		ret = -EINVAL;
> -		goto out;
> -	}
> -
>  	for (i = 0; i < data->irq_count; i++) {
>  		data->irq[i] = irq_of_parse_and_map(np, i);
>  		if (!data->irq[i])
> --
> 2.34.1
>
>

