Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D2FEF8FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 15:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=acegtQ5IV3jv3BA51TZR+KMviP17isK47QERD083Vtc=; b=eDmsuHsxlTbBuf1Taf1ah9u58+
	sdbYe81wBaiRu24iB0yz9MYF2+sPNiViANQ5/Tt/JXyCtJJ9lZyz+c/ZvykyB99ckxIMzcLZihQgZ
	ofBMrf45bZJ0Gp2BKwQwdEJaPvcBtyi5m8wrc+Ycd3T+uJ4ne1gj6LkQT3pODy0M2mueNmJkFhy3u
	LmSP/lM17afbyLJlAhJ6gNdV1pKel38vwRpJZtsE7T96VZOj/adRvWLgNBhAzBKiuFU+6V+CEjIhG
	EMBtLAcJg4FIQ6XQ2y6ejWHC1tuX4bJjG62zMoqalH5A0UASfWcaAiBpSeDvywvVMNAXAqR1KXzJh
	5uyDi1AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxoDv-0000000HZ9I-2MSN;
	Wed, 04 Mar 2026 15:33:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxoDu-0000000HZ8L-1liD
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Mar 2026 15:33:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=acegtQ5IV3jv3BA51TZR+KMviP17isK47QERD083Vtc=; b=oobuiC96EP2j4uy+/kjCtTOL5G
	0lqYDVPjshBilKR9O+hLXRkPzIs6WBxtAW6E4uXWz4SaCCniss4AjPrY16sZsY3R9sTbgzXgAV7Fv
	e8HzN7NKov8WjMLNj6IcmzqNLVLCom+u3qqKy1z1dwjbaERv+AdD43gQwEUkn7iuGha7vOAkmRvNW
	itYH/c9vcmmNPxPJW5pJX+lAQfh8JV11MkC+T+SjD0JKqZ2na6XSPnmac/DAlfmQoOMJ2wDye5apz
	AD3R6/iW7R/EwahZHi4MsU1RSylpxBcCcbaC2aT+D531kRxiF3FoSrc25FlOYDucl0CqA7y+x3GVs
	DgG39+1A==;
Received: from mail-norwayeastazon11013058.outbound.protection.outlook.com ([40.107.159.58] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxoDr-00000004xAo-2H5Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 15:33:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SNoCMr6XHLtyeBf415iR8w7EEdx060r/sXhUajWtT/BSWd6q6AuQZ9aiv94QAt2dVZr8ttsVWfM4yD0DK2bIfC3KAG+TlyzXE3TZDMoNW3QfL5EHs1gVJ+PJDEjafw+SEk0v6MvEBrqvKoOk5fA1+pOC3GLTGF+fm5xvnyPqIyouYs37SfM/RFACLHj/T5B3emw3rPY64zdWHL4UiS20T2ZHHeIQ7RYp3hC0D7q3wZs+XNe9vc+CAvmq2wfgmULgs3EjFj978e0069ZwcGdL96bq05q4wamdl1H9LqNPLuJ3VlEEFytN1vOfP0SlkF6sAJjnnzt1DFjOrSUIoiKuyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=acegtQ5IV3jv3BA51TZR+KMviP17isK47QERD083Vtc=;
 b=aRAGoLZA1RDJYvs77crnVFSZ3OncAG/sp6XxNkPbiygQumMyqEerwj7ADos39T65rW2eTZG5xzcbKLgxMJr0YG/LSDNqgew56sZRbKcqYEpWd7ELko8S29+EvZ9kW8Lw/yU4azhwR+YPDWSt5Ceiz7bMuv3eJ9kPR7HZNBVgOZ9gQS9rJKrjFbGafYIxBDGdZFN1FPkHZqC4QbuXoly0FPXuar9cmXwz9gY9755ZpTzE2C3a71rmuHN4fuBH0CJwwVfyxT9yjfmmMs3dtxtk3IcACSD6AA7AzjEZsC6NTqg6BbCEWYAL+5E0NS+5EU/ibnmHidw499GPmxHD1lBGNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=acegtQ5IV3jv3BA51TZR+KMviP17isK47QERD083Vtc=;
 b=AYOsmRJoOWh9kitfoXBMjNvabNA4Ku4MtxD0cCareHt5dQqjbs2/5iFaErQYs3wijKKjqjjLnN5MLVk8QBUYGaDagEonDzed+rbMOAPnGqmV5E9zt+mAKPV5XrLxSv6BSYJ4G+ABxL7SCtxhX5pwkOpNZ71ZozU0peSz5n3hn0VbSBVmo46inxk4WVwe3H/J1Mug1bwcjWlmIeCHcsqy68ALjZ4s26FNhRwe1NNWM+Zi59zXWL2JmZ0ko7nybAYIpfMSdZKF2+Bs+2dBs+BzDijNQwciaq6+XgRUEcIcbqcFfPet+QfcH1dZbyEAs/MFfDBlfNSDSu0B4yvbLQvEeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8119.eurprd04.prod.outlook.com (2603:10a6:20b:3f9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 15:33:10 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Wed, 4 Mar 2026
 15:33:10 +0000
Date: Wed, 4 Mar 2026 10:33:03 -0500
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Lizhi Hou <lizhi.hou@amd.com>, Brian Xu <brian.xu@amd.com>,
	Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>,
	Vinod Koul <vkoul@kernel.org>, Michal Simek <michal.simek@amd.com>,
	Max Zhen <max.zhen@amd.com>, Sonal Santan <sonal.santan@amd.com>,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] dmaengine: xilinx: xdma: Fix regmap init error
 handling
Message-ID: <aahQr5HdvmeOCMES@lizhi-Precision-Tower-5810>
References: <20251014061309.283468-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014061309.283468-1-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: PH1PEPF000132FF.namprd07.prod.outlook.com
 (2603:10b6:518:1::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB8119:EE_
X-MS-Office365-Filtering-Correlation-Id: 04342c62-a8e3-4e28-dc5e-08de7a035743
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|376014|52116014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: UOg8D5Q97rMo59XRhq8dVqRqa8rhhDGBzUlhsQ9vpKuc5SVWN16/RoDHpMQvsiOYPrbK1LFn3n2I2Ldx4k4kg3IYMZeLpQlnLVdsi2258WVJmlqOW1yJ8YBMe508OgJy04IqcU67aC87kT6ce0dIRRMnlR+UmhesRRpUI2zC4s2poMDdrW074+wvHp59RYLbQ0L/doovpktJXx9X42BVNkkewCbSRAV0Ib2096GJt83bRlBkpMkZ0K5sbvbbV/0+S2fuOQpHrFhmwfDYUrAP1/HPPICfneK9bAcrRmzg+7cL+NbwN8Q5d0RfZWGKRtLc/sGOcBDGnFrxYw+AM2fV+p8FHLa6yZQUUlD71JaT8E23s5JWNr6269KM8yHPcjocVsuiRq3lQbPfpm24x5jVapTcn3x9iFcoOZUOWW7jzegCJa/4zWHqCW+x9tPTe5oao/2yT23aZkKjgajdOnzulS6zPVTNCyKozC6rmktN5SLYE6YifxPlm7Ne5qu41yWG9wBvTRVLq1JZNU0XLeG/sZEACUyeOIsZjt6fOlHKDBhErt2JySnS0/vA1kkbXAOl1aGwln4trdnqpMqxjTwgyGXP3JH2iXh9kbVEQI0caQRWtepVDaDr6QX/03w+hFaAUHJlJ1Bf+8QkWmVvFM62PHF3+WznXBO2Ey54lL9PQa3cFO5dnYChkSWxGDe1+/PN0CwXKw9ycZf8d/9HG2+M+0eXEHlL0nm3Yj+VjLN6L58VfapTlBShW6fqG4K/efJyPIUHxQbC9jHvTJQnU0DzaT00nTB25Z2k1Z46onwBh4Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(52116014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?94FdgKBz8jOcKf+ugkTqyL3OML3qozRDgVLF+DoylCebUo0as5bW2gJPGkjz?=
 =?us-ascii?Q?4J4ro7oxHWR/WjL0ezm10Ix1ydLNxasiK/G5ypoMtnholOc+shlTlj861HvL?=
 =?us-ascii?Q?hdaL2w0xhToNF5GD2MBKs9Iw0jHyaa9hEFVfl2jRXjMEHRC2TGbI7jtB3i4O?=
 =?us-ascii?Q?z6B0W1WyhzKcBkrEdwISReBYIxLejd8DvSMgNDeEuAJKT6j198qdwLye1V0K?=
 =?us-ascii?Q?EUkprXAlBkMgstPzkZ6+0VedYoauwEiikqCJer/rRYpp9BqKpY9JBVBzAvxc?=
 =?us-ascii?Q?wgrjZLtJH4kfXzhWY8KFO7p5667YeTJRwKeDo3CmZKvDHVwyS9hzt5AAy4K9?=
 =?us-ascii?Q?seDhzO98AVniN4mrjx9ceCwyr4UlYcA8Lcr3HAvgVTYYlueRIFn2QctkbH78?=
 =?us-ascii?Q?Uj4vo35bU5SqKxD3pgl2hSKain2W4I1UyCXfS4f6qeP+CRzjcOaVBwqt0rjx?=
 =?us-ascii?Q?uKWxF4d+1QIfg4ORoPHr2ZaCquJofj6Oi+DK1ITJfcT/hx8ZaDBlcDQa7667?=
 =?us-ascii?Q?BM/+mHmSWhArWoBTbqgv3kzsOxaV2oBME2At/WiE9SQbnNJ0+j7JjQToJnne?=
 =?us-ascii?Q?dKr0hAPH90OEo9RzLHrXro689F5lJrij2PHu/JqJ0qEIdCmrllxxOfjOM/YH?=
 =?us-ascii?Q?SKhLGM1F5CGdIMNEq6waBdoah+fefwyLvxpWHyk9HFys8momR6Dd9JBZQkAU?=
 =?us-ascii?Q?8IHXFgsu1CabycZ5RIrXxd8zFheYedx9Pc1TZ5TJAiZvHXoRWbZP2fHOz1f6?=
 =?us-ascii?Q?ruMLE30Aw22HiUg7+fOfq8V3BgNKwDCr1oqX5TkC77WYIZLOoZanUaaHXaW1?=
 =?us-ascii?Q?O3oG0PwcwylITNfO0NUZWEx25IQ/SVSyAZSp7n5ievyUyIoXISvmOTr6kM4c?=
 =?us-ascii?Q?iUR0GYS6GLtwu7mgRmUCNsElLkWLfO3/sTH9bSNpI6BRr4A1r7ByZ3F/hSj0?=
 =?us-ascii?Q?sQdo47R9f0UoEaMKatCQ4pyzrUfuckXNYKsQuQDc8vSt9uaNqMQRUfzZmCm2?=
 =?us-ascii?Q?u4v1BkzwsD3W+u42LMaWB9SFBVwBEVKRk/W6j/jDEzzQWY6zbXoe768vM6Gq?=
 =?us-ascii?Q?LKdViDVGaIU2DE+BRb9B7Uur0SkE2WR1XsBjm03MDOeZjxAMlGO+jqTLNkrn?=
 =?us-ascii?Q?bWTVXQWH+hdclKAH9bLgShmgcInbuqV2MUrIaWLHB/gJtF+98lU6MbTQxgWu?=
 =?us-ascii?Q?26uWxvK4SoBN5yvQFGAXJaCRYwqC8bXkgqrlC0q5rb37SVYfMXLd4CR6Jaq/?=
 =?us-ascii?Q?PSK2u1/WyGEc+c355tjUVcRP0WxiUx+yQmnu2e45mVm28CABkN566XeluQBX?=
 =?us-ascii?Q?zBAS3ZZyFaXYEun4VHUMrAbKmQS6s2NnV9mt9aqlvjkCQyIfNp5eArESAQCr?=
 =?us-ascii?Q?RCi60ABYHkyS8G9OlaoGcKni/nBd98hjL0l4F8OaxTrSnZ7l/c1CKL7i6xNA?=
 =?us-ascii?Q?SWV00PAZaOMexs72lkHMZbeOiLRSF65+mAActMLNYO65eEW1CVCdfyYPbUsL?=
 =?us-ascii?Q?LpBbEd6+YT2Dq70F7dRC3ERTnebnIPww4xiL6vdXfJ4OBSuY2GXYcFLPnl0q?=
 =?us-ascii?Q?8ozUxutQ7mbQVW941LxgMGKH9TodIEfZvh8sz/D+uPpEO1TpFx5crcNIDBHq?=
 =?us-ascii?Q?sRyctr6j1qoFSmb9GjCagwCklEgWmVaO0YEoH4bYyDDf9hRqt9gJNwihtKKe?=
 =?us-ascii?Q?L+0Z7oZcve6/8LZ5q+TGpOi+iNTc5a8YhTH266VEu5XjP2Q3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04342c62-a8e3-4e28-dc5e-08de7a035743
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 15:33:10.3188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NxA734/6ZdsxKLQ0xvM0bgKM/+rUtRzgx04cG4uDOn/VsM3zZP3lNGHWk2Gwi3M/UbX6zNf9l7yx7ug6CJw/jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_153315_644850_16EEBB34 
X-CRM114-Status: GOOD (  19.66  )
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

On Tue, Oct 14, 2025 at 08:13:08AM +0200, Alexander Stein wrote:
> devm_regmap_init_mmio returns an ERR_PTR() upon error, not NULL.
> Fix the error check and also fix the error message. Use the error code
> from ERR_PTR() instead of the wrong value in ret.
>
> Fixes: 17ce252266c7 ("dmaengine: xilinx: xdma: Add xilinx xdma driver")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/xilinx/xdma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/xilinx/xdma.c b/drivers/dma/xilinx/xdma.c
> index 3d9e92bbc9bb0..c5fe69b98f61d 100644
> --- a/drivers/dma/xilinx/xdma.c
> +++ b/drivers/dma/xilinx/xdma.c
> @@ -1325,8 +1325,8 @@ static int xdma_probe(struct platform_device *pdev)
>
>  	xdev->rmap = devm_regmap_init_mmio(&pdev->dev, reg_base,
>  					   &xdma_regmap_config);
> -	if (!xdev->rmap) {
> -		xdma_err(xdev, "config regmap failed: %d", ret);
> +	if (IS_ERR(xdev->rmap)) {
> +		xdma_err(xdev, "config regmap failed: %pe", xdev->rmap);
>  		goto failed;
>  	}
>  	INIT_LIST_HEAD(&xdev->dma_dev.channels);
> --
> 2.43.0
>

