Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEF0F513F4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 05:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+nx1rs5DXnl4sXTfF4ULbZC8zgEtGb7o1QjabjTYBU=; b=YQJwNjY5Pr8gZgkfpQ8kqTDKMM
	hYvCVeOn49GmyrgCumO6pXEi5IXSDwm6WFODVmBU+tm7ZFZeoRvW52fxWVw5ji+d6H+0Wa8ZRmxVA
	BGqM+BXTrLxm3gcNBurzbWTkRexr1OyhdphjC+qw+GbwiMJAI1NBK6toq8X21BZd698eo8YZ4Wn2P
	EuYmcvPa20qh0nuwbKR+1vizc4gOaZV4pGlqBRVFaKaXUdFKO3Cjvh2akPxPsXCe2aXY9XTBg6NnK
	3bQ9y6Rk40G19yiXFNmGH0HBOzkS7bipiwzHeLmo4zesCFuguNnW6p+X+sqWbs8qnSiDzRrmKtU+Z
	tmEJ4R6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyNUt-00000003250-3iM0;
	Fri, 06 Mar 2026 05:13:11 +0000
Received: from mail-northeuropeazon11010001.outbound.protection.outlook.com ([52.101.84.1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyNUq-0000000324H-2dJn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 05:13:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=apQ226LfCgWQTvIKPoObd875CmPLZ5ruf2NEv45eMW1/FRuP/GluhGiIg7C5nXDJ10lGG3qbSCtM4ZJwh1Oab7X6cGyOe6JppVmLqQOm2o4nu9RyTXRYSHhr0jdgCuTylF88BsMMvbt09lPV8NjLyGmhD1rIr0zZxavEdrAh3JZKCTS8FamrygR99LnB1aVbMszikADJnn2uCPe3V/PYKWsc6cf3hoNLGV/pqwCXugDOO34g8RzgMLG5DwuOnqma9U0eIhIDS246o6oE+aWZckEn62NCJtHmz0w3R6j+k7b7BQO6nZ2S/U10IF4Unh7fz+T7V22fowdxPqQ3sNzy1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+nx1rs5DXnl4sXTfF4ULbZC8zgEtGb7o1QjabjTYBU=;
 b=u8F0LcpjvNVXsM9BOgL6SAtZWV2nnni79Xw3JHZKiGpDtL9Wc9m7r2iDvWQKtseGxetWnBunml+k2tbCaayj0ZkgQts6SK2CIfJHQuZxTMjVGmkjrmEmc/5q/Buf+Ak86toqsbQF7a3dHOyhIUjAI1Z+c8cWMK+J1Phwm7nP2vwxq6UcGsZ2k3Mr6Gl/nVVZ96DzQnIq9ckQPcG7ZOAj2IsxEdgJ2eDpffQ+mhbEpxvNO6UnfgbMfjbk9HJ47Zbz4zfjl4b7GywvQpDrIqwZ86G2myylARYJlSZ95XrAL6Pxmf803suB068rZUS4DlFXaXUYQ5s9VnUG6+vRigbOaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+nx1rs5DXnl4sXTfF4ULbZC8zgEtGb7o1QjabjTYBU=;
 b=H8cCJnGE0nW2IOZ+H2bunzicqb97vbv1X0F6p/rB+Q27Nya1Q+L/xo4lqDk1nqsWNQZoGIpj8mQOSYTrcnogIVOrMVWLrWkpVlbJRhu7PG9qL3eafd+Goa05HgP5KFvoaC1fBGTk8eOp53TH7sdwHtR84NSx9u5c7TLlg1RKGdO3yusQ60kgbHUzu/MO1+swz8Gh4M93lOCjH1yG6t1QFW9r02mQWLJwoTyBNwkycfU5EzpjA5XlmOq8/FTx29hk15v0RojVsd3dJbmfi6ORIruLf4UQFIImxKM3ozjvWxTkt3KPgwhiZm6eY62a1818QJuAN/ogIDvmAv8YPU/0FA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB7957.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 05:13:04 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Fri, 6 Mar 2026
 05:13:04 +0000
Date: Fri, 6 Mar 2026 00:12:52 -0500
From: Frank Li <Frank.li@nxp.com>
To: ming.qian@oss.nxp.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
	benjamin.gaignard@collabora.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
	ulf.hansson@linaro.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, m.felsch@pengutronix.de,
	fra.schnyder@gmail.com, linux-imx@nxp.com, l.stach@pengutronix.de,
	peng.fan@nxp.com, eagle.zhou@nxp.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4] media: verisilicon: Fix kernel panic due to
 __initconst misuse
Message-ID: <aapiVPpPt_uYB-9M@lizhi-Precision-Tower-5810>
References: <20260306031059.801-1-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306031059.801-1-ming.qian@oss.nxp.com>
X-ClientProxiedBy: SJ0PR05CA0164.namprd05.prod.outlook.com
 (2603:10b6:a03:339::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB7957:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f34f858-e9a7-4490-6b73-08de7b3f0bab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 4I7hKpuh7Y6R+9872fCuvX5DkuYxxV5tZITGDDb3wD7xVLRbXQBqjC9gJKUbAU5CEnmcdIQFueuvI+tjnqOdE2zRFF5xaGFFJhoVQmrnsWAClN/zLsk5HyjTbtG+RK6SL9QAOh/ZXw9zpH7sb+S4Eciqj6sLzxOMev29e80DHfjtLayrVYLIxBmCmREaF3VDr4Halh1YqaEx5xhfBRJsuCnfKZ+HX7eQSdmHM2i0FQr9rTtt9TK8Ilaot6Wo6Z9qao4Ni2CVuuGgY4ehsrZzcYNyR2+E9jR5D1/qMk2SVfDIQC/lWqhyYGM4rCjORxMEc2cN76FVGHp0qUyVgqayVGCc3XYyJaGYXOfu6ymNd9aTJad06fKKKjzo0yZeVMmr0fWxuC/zuVXRuH+xLjvPBhoJKwktoEreMpqMoInLKtlGzsLX/c3WQF74E1ysC0DOJW7ma4kXacHih/sBZRmQS2hvqsgh/qJdV9hnOYVEEZEkrg2qz+tVgbbnf3T/IwOTB7e/RmbHYs+P92jUUqKCBJflYaM1XqKP6nXUQkyO29PEPg/QGTgmGzlqkFMorL0GSjVZxL/sciGU9iaRqM8WGeOJDF9tufv2qmR4iiuY+4ow3fKhee9wXOxSYVUEnWZvbocaQxAJZA8A8qBQzTPXWo1FxN8tNuqwvLTtt89eo4czumw6Njttdig2nEieOZF6i/Cf/ufPOPrBe1v/LezIKqv19g+O2D5i2o0qk7PL5PiH+eN9SLKWY4z5EW8+ff0sAhVq2SMlco7rmicop+W57HTSM4GyjQOpmXqOSCv6EIw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vFVzfNb6pYcg6Aj0wVtKbewxGIftm+sONvgy4spzIVvb4JKE4ESJjohgHwWc?=
 =?us-ascii?Q?v3rEqxiYfDkUEyC9cZl7XOEyqTBriQKYU2bvhkTMTrxqOnaYs78WbNn6x6qd?=
 =?us-ascii?Q?6mY6LNry4bV7Bf7KONyj7gTxnkV8mydRlyxerKBSo2QykkjuPYBeJ60ks7UJ?=
 =?us-ascii?Q?gjYVDWNmrGo9v4xo7DsEGYqK6Lw+APxPAXHLQQHRv2WXqUW6YgEukLwpApVK?=
 =?us-ascii?Q?QgdYRGpPj9niQvpMvVZupHZePVG+FD6CZZW26VGY81TZNwtFpjWrrU30gV9e?=
 =?us-ascii?Q?QbxEq927YqnQSfHjrN/SHnPlD+4N+KWdGPiUkdQpfBu9LuY3uETFZHOoIcuP?=
 =?us-ascii?Q?ptDZC9EeN2ZI0/WiULXAeT5GTtCPLinX03LIEYNy+fJVZ1DFInexrTeL8S9f?=
 =?us-ascii?Q?zU0NMpeqDQ90v4b/4VNSz/ybMFiAu3ijsSljv6naWRbYllhqjCpRTXUOFgrX?=
 =?us-ascii?Q?+81OXzLMbL6/zO2FJWav40fgnzT77Sn9438S4p10HDG6bldlp5V94WuQx2Fn?=
 =?us-ascii?Q?bODhO+4cg9QVkPGh6yTAyPxspn+u5F9aFdmo+1Ymb4JE8DSr7dm+thUie2t9?=
 =?us-ascii?Q?FDaT2Mxhkvat4V89cjKStk0+RktmvKipoEa6MUqq9uQ5NLk2pdfsUyB8pVlZ?=
 =?us-ascii?Q?Lro0HOxo4CWgsUopyzsjNCUHOHSCZx71+egtii8mgQ8V2Yx259qBLGWK1y7F?=
 =?us-ascii?Q?QHe92eiF1WMJ/l+DOAhyDsDuHYPDJYf5tx815RBrJ9KpSHBO569MGoAKRkwK?=
 =?us-ascii?Q?2wQlKu1MAyRwCXOZAhAECq58AEBFVCuBO6/v3q2TowOywhWWmeKGGFWAvEA6?=
 =?us-ascii?Q?PFecuyytmibQqMILshl63rQ/oNC0Shnr5S1LE8ecIEXqZ0Gf/geb1HtrHmjJ?=
 =?us-ascii?Q?PqA6BezPgTn1Fyrr4OIUV4yqSBXf8bfXqQq3TBnL+mpbyxtVW8d5Lcf10J9x?=
 =?us-ascii?Q?sNcNe5ofAzILkk03XSIezuHzLd5MwOKvppZckQTDc37VXf7tZkTDL6ciY/DB?=
 =?us-ascii?Q?aYW44aKJXJ+Zme7QSbmI3j6LIYlJtaIF9hN014Brgvi65nAnPWoRk4gBliMz?=
 =?us-ascii?Q?R8yenn/QDvIJRdEsnCshqAywcXP/KBtpM4RvRz1A8g1sEn3p7eZjtUT0R9o9?=
 =?us-ascii?Q?3+EN0LM+ePPyAJtkNZIYZicTeIUmlR4pkzFGvpOis+onqVNsl8PAW7y8rjvV?=
 =?us-ascii?Q?TlROjFR3sfdqXdlJSMMnXpTEXqbnwcqybSbJHeLP3jkAwvxOnbepZNDNxm9m?=
 =?us-ascii?Q?rXk2pzdow2R79L+0BOzTBzIW5zeUL/mjv1BbXNgsvEiP+F6mTn3y6ovDolCM?=
 =?us-ascii?Q?IpB+ar12TJV03L37yK7E8YcZxTNIuHf8sNka92JPIA9WjN66hDdznxDdUQCW?=
 =?us-ascii?Q?+2foCC3obf68SLAj4j9We/do8d63b7UahH74/4StlqLIvvF0lF8HgH7V7f0E?=
 =?us-ascii?Q?KN/lr9fpGsWGz3g46BYYbcl/+KfRLtPjYLMySpt+ZCzP4tfqZteOnU4JunVp?=
 =?us-ascii?Q?uC4AzyFYctpJX7Ng83fL7I0yoQIkTkOEG8xkXMhkB3Al2Rau34G89R9JQZtd?=
 =?us-ascii?Q?HtCTXE5WlGfDkSvpoBctLwtST7EYz5mM1Tsv4lMh4K83iLAO/TX8tgzY55Gf?=
 =?us-ascii?Q?q8V3kzvwnywiprWL7lhqy7yq8pA1DdnXViLhr7MkUXbL6CZp/s+p9AyvsT4T?=
 =?us-ascii?Q?OoFYnrM31WfxZIymXqQ6yTHvTTNSaAmvbozx3gIGmygnRs7z?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f34f858-e9a7-4490-6b73-08de7b3f0bab
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 05:13:04.3684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dmo4VC3O2zqmg1EOLi+o0rbJ1CpwYXEHrvOUkyyev3h2UKbx1s5J7v/N1MPU+/vBZoqk9yWrwP+4gCZw+dXyHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7957
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_211308_668487_B361577E 
X-CRM114-Status: GOOD (  23.67  )
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

On Fri, Mar 06, 2026 at 11:10:57AM +0800, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@oss.nxp.com>
>
> Fix a kernel panic when probing the driver as a module:
>
>   Unable to handle kernel paging request at virtual address
>   ffffd9c18eb05000
>   of_find_matching_node_and_match+0x5c/0x1a0
>   hantro_probe+0x2f4/0x7d0 [hantro_vpu]
>
> The imx8mq_vpu_shared_resources array is referenced by variant
> structures through their shared_devices field. When built as a
> module, __initconst causes this data to be freed after module
> init, but it's later accessed during probe, causing a page fault.
>
> The imx8mq_vpu_shared_resources is referenced from non-init code,
> so keeping __initconst or __initconst_or_module here is wrong.
>
> Drop the __initconst annotation and let it live in the normal .rodata
> section.
>
> A bug of __initconst called from regular non-init probe code
> leading to bugs during probe deferrals or during unbind-bind cycles.
>
> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Closes: https://lore.kernel.org/all/68ef934f-baa0-4bf6-93d8-834bbc441e66@kernel.org/
> Reported-by: Franz Schnyder <franz.schnyder@toradex.com>
> Closes: https://lore.kernel.org/all/n3qmcb62tepxltoskpf7ws6yiirc2so62ia23b42rj3wlmpl67@rvkbuirx7kkp/
> Fixes: e0203ddf9af7 ("media: verisilicon: Avoid G2 bus error while decoding H.264 and HEVC")
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Suggested-by: Marco Felsch <m.felsch@pengutronix.de>
> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> v4
> - Increase the diff context length to pass the checkpatch.pl.
> - Discard irrelevant changes to sentinel
>
> v3
> - Add missing Reported-by and Suggested-by tag
> - Add commas to pass checkpatch
>
> v2
> - Remove __initconst
> - Add missing Reported-by tag
> - Add missing Suggested-by tag
> - Remove comments of sentinel to pass checkpatch.pl
>
>  drivers/media/platform/verisilicon/imx8m_vpu_hw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> index 6f8e43b7f157..fa4224de4b99 100644
> --- a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> @@ -342,9 +342,9 @@ const struct hantro_variant imx8mq_vpu_variant = {
>  	.reg_names = imx8mq_reg_names,
>  	.num_regs = ARRAY_SIZE(imx8mq_reg_names)
>  };
>
> -static const struct of_device_id imx8mq_vpu_shared_resources[] __initconst = {
> +static const struct of_device_id imx8mq_vpu_shared_resources[] = {
>  	{ .compatible = "nxp,imx8mq-vpu-g1", },
>  	{ .compatible = "nxp,imx8mq-vpu-g2", },
>  	{ /* sentinel */ }
>  };
>
> base-commit: f505e978d1a0442adbbde48aed38c084ddea6d6e
> prerequisite-patch-id: 0000000000000000000000000000000000000000
> --
> 2.52.0
>

