Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B849CDE002
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 16:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sqZ2wO48UYLxlaNbThccYzBuNYAooHb+dh5RphM+d8Y=; b=IRU06bSWAJVm3q3yZwiuOOi4DK
	Tsb4FTZj3nLUA37G/FgDoQG78PmVXspklQdPaOfKGlqg0cOCLntbzj+Bw3yqI9WcP0FTaRA8jPQC8
	zUZM4rFtVVNDTY9jSzyncs/bHYdsA1G9RjDTBWnyjA9ppYNgJJjMcXAHGsHusigH8uu3ZOmizGaTO
	hK1ISQVmUvwg8XLBSn2eDhnNOWbTeI5RI+wsH6c/+AGUpj49S5lzFJbyTYd9HHhdvlhotaPjTPfDJ
	NVcESudEUUB6Qc4BhNikOQWY2sbqdu1e0GFhoK+nKX/Qc22HqrQe+0eymn64LB1AntDSzk+CMi9Do
	ENg+62aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcmYE-00000009RnI-0oY1;
	Thu, 25 Jun 2026 16:03:38 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcmYB-00000009Rmi-2P9P;
	Thu, 25 Jun 2026 16:03:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H+TfrD9p2VEjgq/XHHE2lKQq9ozFcWKYTmLV/Z20H3nzCdqlTk+ikXcPCI9EA9s7qjEA5LZEJ8+4ofSskqhOb7zgp35CalYrEkHLhiluX0M4xBz5BSsRU1QNfiR0udVBSfcZoygKsSp3ZJMCJRQ/dF2vC6hRue0IuU1eB63B+hV2cfcYN+EubM/wyZu4qqKYBpq6d8QOwgnvTY6R4gGiO4y+pSAT+H5DcA2vkJhAdtupG7oeGgP8fhOsQnmoHRXGV6dOupL1t2FjU1ncltl55qFLGfQEr3y6JPpduhlA5AlguaoweFj/KUs3CZw1xbA8QB714hr+bbUBdVmnkyFtbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sqZ2wO48UYLxlaNbThccYzBuNYAooHb+dh5RphM+d8Y=;
 b=rQMbW7iGxcs18cM/boTRkXoDs3LVcBcfsCY2boeUvrhbzdoDMitpcv0i2Oe2mjhmAG9pjfxN/Bo85y514oVi06EuaQKD7gP8BDdW28P7rAw4cDmlQaEQCirAUA+Cwagsjob7zosKLRaAQyFZrw1aiJLkCeswDBZqL7SnUoMYm2MZ9C5GsjcmNpU9q7oSIwfVd9/64rhb3uNxFaERQlCHJzH6KxXKBvqTo5LqNYAP9fXxhSzWUodk3SRcQH5wJgvpQ+ro7wWDEptdaLZfaApBwDd49/qpOJWwVHKoXxRa/H/bicdMzkRRRhWs9CTZ4wCfVvZuX1gdaG4Y1MHqs8ZN1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqZ2wO48UYLxlaNbThccYzBuNYAooHb+dh5RphM+d8Y=;
 b=aM6m2Oy+YfUquqo+pMN9TKH5dv9v601kk3a9Ir3CwR8ql0SCt537jhdI5eycPpbIvnIv0TKH3P3/6Dr3vmWzraFVxG68mP+XE6hwa5/ukj2o9XyF3zRWvfZi1yPgs8Exql7KbyHZp0GiDxjx4swo+Np2pa5WvETKZtMH+iFHA61NSrl/XBoqXwmbmFRU8g/qZfDuuuUH3E/CroXbblUbQKHXYR6Wqdc+KEQanW9juFpJdtxCYgyYXFN1Lif4/6ANv2ng1v+uBgZ3PXXdj22MNA9gt3jdZmH9hp286Nk+hBr5BBg8vaiBTrdYlOicWmdq97MR9uqPi7QMhZ4kmf8C0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB9992.eurprd04.prod.outlook.com (2603:10a6:10:4c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Thu, 25 Jun
 2026 16:03:30 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 25 Jun 2026
 16:03:30 +0000
Date: Thu, 25 Jun 2026 12:03:22 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH] dmaengine: mediatek: hsdma: fix runtime PM leak on init
 failure
Message-ID: <aj1RSj5ZXvc-9yu7@lizhi-Precision-Tower-5810>
References: <20260624081701.19358-1-mhun512@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624081701.19358-1-mhun512@gmail.com>
X-ClientProxiedBy: PH3PEPF000040B0.namprd05.prod.outlook.com
 (2603:10b6:518:1::5c) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB9992:EE_
X-MS-Office365-Filtering-Correlation-Id: 01e24da5-ce7a-44b7-eb96-08ded2d34c9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|19092799006|1800799024|23010399003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: thkr5k3GyRThMpNt+9y9i2RaE93mW4ErqoTYDAVFh2B+Ye/NXpVAScxjs7yN/Ts3mRGt1M0JDdm+lKmmc8qD5ffGy6qu/MU8jEpKTE5zEeUo00uviZafHcLGu+cO8J3oE8MbZVrRGziKu8cG59CEfhJO4DMJ17nkzRMZk2jkXZtLmr6uEXYE1eTnX8MAfi5s915td9e1gd9Qmeer5ygrkvYzXM91e9AkgX4rtpWJxNC0Dqx7WQ5v9HVARPYDKiY+d5gE6tKsL27mqd1EuBAOSKFMkELYMi6YlhIRHUyfeGRyzkwckrvmYoiZW/aDHWK1bkR2sY2J6YIj+gSylel0QRywHXVGSK01OeI/VoghwyNtL6ZtcCUc1tUiMKdaOrkKNvrJwfZswyOUUKK2Z4H36eGMGntJlWnQNCIuoRH35zBQ9+x5aFQL+bqBK4wzvOZCwCQ2Ps7I5NIDBSMSWzGyCvDYGlI+TSfZOfEAOzUCzpjQT3i84vhEoG5O0juUUQAlXVvnQyokONtmyEHC8nXKNrpx9Axzv549y5yiRjFh5iOvR3CQNpb8j3fk2G9c5FDsUfdje8NUdXd15sMnBI1U7usoNaGr1u17kXQOKgqi8mqwdeq0rE5r5hPY9Djo0Yn4Bk0l4KygNz+1HXTmsa8tPEp/0IVUzyWcOBGoBCIsMYE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(1800799024)(23010399003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q2RmVqq4+pgTvL9VXgWrdPo7PGa6IQhREBx66SL2PZxP/fVhmexz9bvNbFQ2?=
 =?us-ascii?Q?DwEz9Zpk56r4DbPbziNHdw//lj4WdNfyA01IsbPKR2LXLGQE5ohlMlIUFZIV?=
 =?us-ascii?Q?Bui2Rn9zxKKQkKAl3pi7yjQdRJcT+M17nlXdwtOmoTpvvY/o9Ezh8cjTM9j4?=
 =?us-ascii?Q?XkRciO+PHr+iT7uvttqv6/a0x4uxZMB7DqZekvmVTZXRU/pALklDRJBzEmuI?=
 =?us-ascii?Q?ijuf6ZsC+qI3MZVY7wRrWRwdx5jt97g9hnIyfR9vqBrCyEWI3Ujya1TdLWAD?=
 =?us-ascii?Q?tzbzz7wuLjWIYPrxUbAYMn7J/wo2LWMSjMX3BSa/rxdPq7fbrgZr//C71kw7?=
 =?us-ascii?Q?YkTn2Pg3fGTmcRNGOxBdIYOu70J6zxqM1Ty9IrSc1XX78HCcmhAc6yqF1ltF?=
 =?us-ascii?Q?GQRqC/Lm0RKGLH2LTt8WrAWYpDZ8KMRj7Wu2KpCcEXCnOmHqaAl9z/P5jms+?=
 =?us-ascii?Q?50Am94JfjkiPj2XThiYdUTRHNm2Kuv5ZdW+z4c7OSy6YbjL+om4bG2DJ6VWV?=
 =?us-ascii?Q?OPDJR6SXkFdfla8km7BS30VUdxSvtstxBs/8b10OFtE8kGKueRzQK119YJiG?=
 =?us-ascii?Q?Ze4P6wBw55mg1ebYO+qmeH9rvzt9fv2th84DOeWsU7ZGOZ91P3iYhhGTaPUy?=
 =?us-ascii?Q?x49IG2Sq4Ic/sqhqskxEE5trikmPummQCTmDUC4AHudIJ7n4MjIlYc6HT7gv?=
 =?us-ascii?Q?pD0AS8EN5YqZTs7+yZJK44f43Ite0TkovacCnHywIzohcL7TnaoUHi0akZSp?=
 =?us-ascii?Q?199crC6VZrBz8XJdIONPG68W9LuSbzkIsmoz5pjdTHrohi16G7zzCxpk3e+S?=
 =?us-ascii?Q?/Jrl2WiFYq/o58O0mn6sagM0mZIKtt2kqB61PV/9eHBuxjJ9vMIIIANVhnbI?=
 =?us-ascii?Q?scvljEbHIq7MZ0DT6+CSoSFKszrCRl3/4HdniqePhtBKN8g9aEHE7CjTXApI?=
 =?us-ascii?Q?mxdo9Hg6+sLC7BjZz312agfqztCU7yezk/JUVoSBfoR6Yan0douTboab51HH?=
 =?us-ascii?Q?/Awt5OG8QLhgmFW7J7Zz6QIAvcNwcpUCAAxJDquZKVQ+FkCdEObijZ+AEX0C?=
 =?us-ascii?Q?Jjhl8MfROEvzb/0wB1jx1QNK9P1sYazocXARfbuOMtjVw0AMM4M4wf9u0Wh7?=
 =?us-ascii?Q?5dJ+nbnFEGkmtSM7o7UeweWoZ6/WLj+oqf4suiPm8MEYpI3XqPwgSft0bBee?=
 =?us-ascii?Q?5QknFiyB50HJ0/rRYlQ0aB83X+xt7onDDWjcfIhoaJ14K1ACxYD0pDn5dsv+?=
 =?us-ascii?Q?5LKmMTHh9vbgb3uUb2LTKmwewrer2TP/VPceYuz/zKScAeys7G08+2nVPQny?=
 =?us-ascii?Q?tpm+k7RI3LiEXA2Olbgx5WC3jrSJC+BNqfY9cBfe/dDvU3zcAgJ91Y6mXctz?=
 =?us-ascii?Q?TXKWYQ5aiIyImRKP5gqYoQ7msQRjdGEPbHX1MMZCay7oioKlx0ewCOlGOVQL?=
 =?us-ascii?Q?3xaPBT0wVu/zU2ds87wKBv9fRSHNUSm/pG9AbCuLqxKXLbpxuOAp6Pg0DdWv?=
 =?us-ascii?Q?8fePbHgSl4eZk/vWwC7XIQlTutegU0WU8RQ0ag0ZTAYy4kY2q0hCmx5nyu+i?=
 =?us-ascii?Q?4/YgIfdMMOwP5yM/D+6gAucdaqEpIDxMwEzTpqXnGvfAokmVblCpCOVse/ha?=
 =?us-ascii?Q?dxZjVpLtGSieI15WcEa0N5miOLb6NiKW4JqcqlWbnUAb/nbGM3ug2F+LAeXw?=
 =?us-ascii?Q?h/ziPhXvg9Z4DEoZHuuBWkhUajNq0Zlcaj8Z2GC4kctnmk1x0VDduqlMmjfY?=
 =?us-ascii?Q?1B8Nn64VpEQmey1ihT2VnRoTJcgGsDuv7EoKd/qpomN2vQ/VvlKP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01e24da5-ce7a-44b7-eb96-08ded2d34c9f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 16:03:30.0520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k7YJLh4OvMkPzLmacvu4eD2FgPzjBcuF2VauVa9IH4gu2N0zrTigenRHZL+GdpKEPOEBWBct7tQUKjkuLRt20hbWubpYZ94IMlayniHp3oox6FgNa9gSPW1KTNRA23VF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9992
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_090335_846856_F21E41A9 
X-CRM114-Status: GOOD (  21.63  )
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

On Wed, Jun 24, 2026 at 05:16:38PM +0900, Myeonghun Pak wrote:
> mtk_hsdma_hw_init() enables runtime PM and gets a runtime PM reference
> before enabling the HSDMA clock. It currently ignores failures from
> pm_runtime_get_sync(); if runtime resume fails, the usage count remains
> held. If clk_prepare_enable() then fails, runtime PM is left enabled with
> the usage count held.
>
> Use pm_runtime_resume_and_get() so resume failures do not leak the usage
> count, and unwind runtime PM when clk_prepare_enable() fails.
>
> The probe path also ignores the return value from mtk_hsdma_hw_init(), so a
> failed hardware init can continue as a successful probe. Propagate
> mtk_hsdma_hw_init() failures from probe, while keeping a separate unwind
> label so mtk_hsdma_hw_deinit() is only called after hardware init succeeds.
>
> Fixes: 548c4597e984 ("dmaengine: mediatek: Add MediaTek High-Speed DMA controller for MT7622 and MT7623 SoC")
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
>
> ---
>  drivers/dma/mediatek/mtk-hsdma.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/dma/mediatek/mtk-hsdma.c b/drivers/dma/mediatek/mtk-hsdma.c
> index a43412ff5e..987e5274fc 100644
> --- a/drivers/dma/mediatek/mtk-hsdma.c
> +++ b/drivers/dma/mediatek/mtk-hsdma.c
> @@ -849,16 +849,25 @@ static int mtk_hsdma_hw_init(struct mtk_hsdma_device *hsdma)
>  	int err;
>
>  	pm_runtime_enable(hsdma2dev(hsdma));

use devm_pm_runtime_enable()

> -	pm_runtime_get_sync(hsdma2dev(hsdma));
> +	err = pm_runtime_resume_and_get(hsdma2dev(hsdma));

It enable runtime pm and resume_get here. and suspend at driver remove,
so whole life cycle, pm is enable, why need enable runtime pm management?

Frank

> +	if (err < 0)
> +		goto err_disable_pm;
>
>  	err = clk_prepare_enable(hsdma->clk);
>  	if (err)
> -		return err;
> +		goto err_put_pm;
>
>  	mtk_dma_write(hsdma, MTK_HSDMA_INT_ENABLE, 0);
>  	mtk_dma_write(hsdma, MTK_HSDMA_GLO, MTK_HSDMA_GLO_DEFAULT);
>
>  	return 0;
> +
> +err_put_pm:
> +	pm_runtime_put_sync(hsdma2dev(hsdma));
> +err_disable_pm:
> +	pm_runtime_disable(hsdma2dev(hsdma));
> +
> +	return err;
>  }
>
>  static int mtk_hsdma_hw_deinit(struct mtk_hsdma_device *hsdma)
> @@ -983,7 +992,9 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
>  		goto err_unregister;
>  	}
>
> -	mtk_hsdma_hw_init(hsdma);
> +	err = mtk_hsdma_hw_init(hsdma);
> +	if (err)
> +		goto err_free;
>
>  	err = devm_request_irq(&pdev->dev, hsdma->irq,
>  			       mtk_hsdma_irq, 0,
> @@ -991,7 +1002,7 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
>  	if (err) {
>  		dev_err(&pdev->dev,
>  			"request_irq failed with err %d\n", err);
> -		goto err_free;
> +		goto err_deinit;
>  	}
>
>  	platform_set_drvdata(pdev, hsdma);
> @@ -1000,8 +1011,9 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
>
>  	return 0;
>
> -err_free:
> +err_deinit:
>  	mtk_hsdma_hw_deinit(hsdma);
> +err_free:
>  	of_dma_controller_free(pdev->dev.of_node);
>  err_unregister:
>  	dma_async_device_unregister(dd);
> --
> 2.47.1

