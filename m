Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E69C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 23:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=apg9l8yUj/X72JUJ/9DcGw97bopBhDiKeD0Is3pAMrs=; b=PwoIZPz4k2hQMy/sS7X1vFY6sT
	KjYiCkUcIUziSZ7SfoCoJQ4ezUmyYOPLwpg5AqADTipP05HguZloVN+nrsiBDYGURo+TuANhtYJTS
	pCydxEj7CCKit1KGBCYeK3EJARkeQJf026ZBJIBK/55WKsBCqIZ9SnZvYS6WO20iBvdXMd042w2+X
	ntYqJYqzMQ0xxLI43HEh9Pk8qtFIsPm49hVwL0yAcI7J5yXGYD6Azk/aKjr/CNNL4re+1J0b/DRyD
	+yPIHrSJosOxzTm5Pt1yHqdTse+KPSwUzvzJs8S634eCzUesD78UVdEd2XM0u2YHN6q4GIZvMtuuu
	O4CkWWcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqKk9-0000000CVHT-0eSp;
	Thu, 06 Mar 2025 23:35:09 +0000
Received: from mail-mw2nam12on2072b.outbound.protection.outlook.com ([2a01:111:f403:200a::72b] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqKfZ-0000000CUbe-3ITl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 23:30:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NX+bqgB9tee7rO0PgI112X+eUxEi1BcdFkjZErVUWlRhbBX3eP1LsZuAtDFl3WBhkizQa+QR5LbRvyd/boVl1LuKTEJhRgFOdXSJKzhbPEHjoMqZdqjzO/NmeTvQxVXHAHHQg5rkC8Tjw9VkuYq4qQV4uCWjf/VUBw6lvH8IDMVgJESsWaayiouRMk7izsoBv3oybnk8wQzE0fAP89iN3Y1Ry96kEyrFGrpKal8YfE27wy2ARYI7Fg8hTp8uEyc85RV/Aa1LOJ38Zh7QaoJAuOPo9DLDqcBUoDj1WA36b5RxWbXb0ZBHb8NUrq3cnckOpmXdee+UN4B4fIqhWsmyUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=apg9l8yUj/X72JUJ/9DcGw97bopBhDiKeD0Is3pAMrs=;
 b=VvU6172mMexDc+xxoUT/IYab4yq4sns/Deqs+3w5YxsQ+LblQmSVtVUoOrfXDhfZkFY2xPwVlUOdWnxGoPQIqTrdndt6YX1odpNjHzouRKMCJ3hBksQpelk+XAhkgwIcIxE0tafoYpO2k1Qb5yq+F5CDCvpv6TkjT+zK9xINLtIHr/VJbE4tVJ64n0WNy/DrvVvkXT1T0NE1tIP4XJDV3Uxf3fm6nHwAK80jl/wTDd82YiZeuoj+776tdyn/MiV+59Boa9vVMCipX7PDv4ma8dbmwTUqQ+1WnUB+6n5RJddAr3o7T2ngsdVERcDoVPVyt1ViYl/mGs6rMzY29Qh9Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=apg9l8yUj/X72JUJ/9DcGw97bopBhDiKeD0Is3pAMrs=;
 b=ohysZexg0kNqjHDpaeaeM9PPAYEcSxGJ1T9nzkf4OHnH9WSJYdJ1goBfPy3WCwWGiarlyMePiXj4878LaNYFKwyXecBPO7NaxWIUw8E//ioT2RMiECnUw9xSTnmwCfm/Kn1OmzkMUxXEHADCEQ4w/KV0fGh2XeMz/X09ZMDwmHo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from MW4PR01MB6228.prod.exchangelabs.com (2603:10b6:303:76::7) by
 CH5PR01MB8888.prod.exchangelabs.com (2603:10b6:610:211::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.19; Thu, 6 Mar 2025 23:30:20 +0000
Received: from MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba]) by MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba%3]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 23:30:20 +0000
Date: Thu, 6 Mar 2025 15:30:16 -0800 (PST)
From: Ilkka Koskinen <ilkka@os.amperecomputing.com>
To: Robin Murphy <robin.murphy@arm.com>
cc: will@kernel.org, mark.rutland@arm.com, bwicaksono@nvidia.com, 
    ilkka@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org, 
    linux-perf-users@vger.kernel.org
Subject: Re: [PATCH 3/3] perf/arm_cspmu: Add PMEVFILT2R support
In-Reply-To: <b11be3f23a72bc27088b115099c8fe865b70babc.1741190362.git.robin.murphy@arm.com>
Message-ID: <5ac3785a-83d5-e795-a9c8-d118973f86a@os.amperecomputing.com>
References: <cover.1741190362.git.robin.murphy@arm.com> <b11be3f23a72bc27088b115099c8fe865b70babc.1741190362.git.robin.murphy@arm.com>
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-ClientProxiedBy: SA0PR11CA0175.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::30) To MW4PR01MB6228.prod.exchangelabs.com
 (2603:10b6:303:76::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR01MB6228:EE_|CH5PR01MB8888:EE_
X-MS-Office365-Filtering-Correlation-Id: 53de0055-a5d1-4099-d263-08dd5d06dc53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SWFvBXs9zObK8iaSQPthhZOjKR2t38EUTqRKWT/s8SrU0XZBN89hgQhKceU6?=
 =?us-ascii?Q?ngXz16DYmzosdWAs7lwmcQQfG6iblgDh2NCjokZKXsSeVsO3dkeivqNGzaMY?=
 =?us-ascii?Q?BJn+cCE3h0hX8fveUY7rcDtZ5s2qU+mZ+ivWkrc4ORYZL6feUmLa1k/qgp7D?=
 =?us-ascii?Q?C/mufWBdovHqYHWLGrI6HWoUHEx8wnkCwPhJmtWTuVrhuNusNJGTKfYwErKX?=
 =?us-ascii?Q?jcIyuTorHT8W7Fy0SVrrBeMQ5RToZ173jU5AcU5FNv5g6k/7UiUe2qOqBbEB?=
 =?us-ascii?Q?3ZQ25iPEKhlkSKABUChnpyN+irqwvEvIcSVAM9bFEeoPwwG9dkrCL7ahvohJ?=
 =?us-ascii?Q?RMPQLaf+LKNy/vN+EXISGr2am7zAIM3vSjfjLWnaOxjvnyKwa6Gegss6VBBQ?=
 =?us-ascii?Q?+xc4b/BFvCrPdiCVsrIUqPs41vxaqLG7K4xIJQVagRBwdHXZCm5tXVmp1dZb?=
 =?us-ascii?Q?YG3wBmvq0kipI6ixPf31N5KihwQY8BSrOD+sqDonqyZqS6wOIdS6enlucnWo?=
 =?us-ascii?Q?0eOVbj0ZaVc/YQWpsxDU2xGqDLYDY9pVsxTdM47XcY+AsqgMM9kGIJrRjM2f?=
 =?us-ascii?Q?14cjyTmgKKJ8qPlpHR5zaZDeTMFc2zwsa+y/QyRuDg8o7KXekN1SZCf13iaL?=
 =?us-ascii?Q?WJUrUHBKWUUOF6byvoemyXarLyZClR69drSttOmcUMvLeZrv6YkP/1whLjav?=
 =?us-ascii?Q?cpuUR+cg09tCqLcX7UvBVpHcsm5sW8WbmbTsPvP77EJMnLdVBa7RKXWdzHDJ?=
 =?us-ascii?Q?T4DgXNbfOFid9T1moLvtovVftTU4mc7BpQXTeGxUW9X7szspOTzatScnU5Ib?=
 =?us-ascii?Q?hyr4TWOKaUkh/O2WuvIt/cI9xlX9nydUzj0d3lPVOv8rY4yjF9xnJhSIhoZs?=
 =?us-ascii?Q?nqmbcen9duh4wQKZpP7qg0Lqs8eSjoQsy+omeO3CMsFDMrp7eD2WLTfFTfvp?=
 =?us-ascii?Q?MXWaXdRzGUODi+WAVkPKvkkIap8U/SQQIeuu1263lXqgSJr+aqKGfxo9Waga?=
 =?us-ascii?Q?ly7VzfVDELH+uKZv4sqfx+OZ/iArSpsqxE4xdifrLrKlKe8UY76Zirf3pjXr?=
 =?us-ascii?Q?k1KrIhttfke/KO5ZMa9isbCQrQ6k1HaG8wbxyjEg143mJ2DvR56oWb2+oOxT?=
 =?us-ascii?Q?VHgWmtiriWTvMrcSiB5mFMyN1caFOna7fkVE1I28eC/zLrhDd8n1IxFN3H/z?=
 =?us-ascii?Q?MuomAP5cqkO3L5Bqwz32FBZNZ3PjH++NoniLAAiIaE6nP7c9+VkoxtBGh6ja?=
 =?us-ascii?Q?QKzBCmvMjADyB9nAbdBLf+hYEfbT1XaxFpT947Z46QqvuqYnIyn+Cb3+8Ka+?=
 =?us-ascii?Q?fUjMWDmgrRVdq5X+NHN8uF9I/OGet8w3R2Ghkq6MlfWs+RiMIGwK3ZAZ6dv4?=
 =?us-ascii?Q?EGQDfynFA+6DVgb1FNBqInVJepU3Xt8W0s+9beJuetLl78+DZV6mPv0O4ga7?=
 =?us-ascii?Q?aMhm7tr2ts9/eaedoJdURPKcnF661VLw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR01MB6228.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mOrEQhY77cr72PVSEDFfOKhvX3fdzDo6njniTG5Ow+jBDhRTGBFsGlQeF5AN?=
 =?us-ascii?Q?BO+o8lIKP4XR7gu5zklcSfeSt2frS7iy3eOwbVUTRQPrVZte+J9PdxmOzsAH?=
 =?us-ascii?Q?XysjqKgOkbln92pnvzJEp5Vz5Zr/yEoEIrWC3ZFCi1QyNxih8rHT30PjmoCO?=
 =?us-ascii?Q?pNjBBBP+CqZ55JfJXwFQMNk2uZgBTmcdijajW26grYdNxPWRUIjHDBNPooEs?=
 =?us-ascii?Q?i0EJsp1kl1Nb+H0GdSDoLcvvLxdN9bjnn5aIk3Kw7ifMZOxFzTgOCzdcv0gh?=
 =?us-ascii?Q?OUhPkKG1ASarGdEUOKNdKDC+eVoyCHMx/XSHOuxfI9KnC3pPUB41WjbYmCch?=
 =?us-ascii?Q?1GSjJ1QoxETGah38WuA276Q8EG2IrG0s7PpAkJE7F0jsED8VDjhj+Ll9eQZK?=
 =?us-ascii?Q?gQeKfzNqxvq06aoQlQctwDvGLCnkKdoL/1BsOk9H3pnZU0GinUpTSZI0VQyQ?=
 =?us-ascii?Q?NhDsfek313GeOfg3IwsKt+YnxHH3QctFIMjWs1Hjq7QfDveJFsBiZC6MI5XB?=
 =?us-ascii?Q?w7jH0JEpol5lYLviY36bhetx/Fq8uZIAP4Cs9kmBuIDTa5bkQIxVCgdTVUbt?=
 =?us-ascii?Q?uOokG52J0gCLTKiVqBYT8cZGqnMyhoS8Q/jhH3yfC2E1l5IpmGecdLcMAK8H?=
 =?us-ascii?Q?shEraLwGJv0jmGzvRKVmvJXEJTV5zeZASwbcTbHwSPGml/gBTgZ7XY5X3LZ7?=
 =?us-ascii?Q?FQ1X3M8mMgsHE0Jm+1fLpuDReDUPWkiEV6wySiyyJ6ZlBdiwZPdG5IQyK4Q5?=
 =?us-ascii?Q?bM+ReEYhQjv6W25kO4mx6iZ6c2wSCO6Nd6KHM7sX4A3qrk6bujiqQtronBUf?=
 =?us-ascii?Q?HVzmog2p/BnCjZ5QAJ/q4H1A9ytex78AnMJ28rhXa20OEPkHBWgysBj/Jhdp?=
 =?us-ascii?Q?ikXnuXbEoSsUnUPY1WfjCSVbk1veHwY1iQwtxpxyWAdJ/wA84alkobH3t3HX?=
 =?us-ascii?Q?FfJe+70g6XrncdTc8oG8+b2O+HsKfAdMZgJ33q26huoTrRy2V26iXdc4H5U2?=
 =?us-ascii?Q?mWi2jA2PBuWK1HmEM0xgqqTgiKmpFoFwiEBdKUrQNv0FAoGn+JhPQ6oQ7jbS?=
 =?us-ascii?Q?Aaaif8s2ugezKOOtNYY3qcGQDYi4S6CjWpobUhW8vuD+zl1GxuiPs78IMu4n?=
 =?us-ascii?Q?Zu0eFpvpEmxqQ0m/azwd+feEZsNmM//MIga3+9Lgd1ld+bIUGOgry80hD2G3?=
 =?us-ascii?Q?lCb90qG1DtHOVqxRcmtdmjeVwMKBdL5Uy0tyBRaZdxbrbFL05dFATkb41ZWK?=
 =?us-ascii?Q?QEHY8z4VGMifI56rBW2AVDOnSWcCNgMGk7ItpkFy/xNabkvuTLKlNwWP9IZE?=
 =?us-ascii?Q?8yTdHvRK3HihM6KaGxh/DkWTr0UqM/W9+dh70z+DqJjyDJy6Cvxi02YL1REu?=
 =?us-ascii?Q?i5DKlRxfOTUAHExQ3yKsspf7RFEdOJDTBKoaI9fYnSFt14Cmu5JOUgvZ7HVh?=
 =?us-ascii?Q?btikKtVclmlLqvS05IYyvz8x3F4APs/C5f6uhsi9paTV2ZmfXcn5/LO3LemK?=
 =?us-ascii?Q?s3BvMCqAJn2MLLR/xxfyIOn5Hvsb1PFcYvgvMq0k7ugo6pT9O7xNJNgdHyoU?=
 =?us-ascii?Q?sBKf3thr9dj7iP6blCVTIBXa6ZYppxt8Uvk6ViD3in97tI8NUp1X5LQOYJTk?=
 =?us-ascii?Q?YMn8sGbSzneWyTNqfvUNKOA=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53de0055-a5d1-4099-d263-08dd5d06dc53
X-MS-Exchange-CrossTenant-AuthSource: MW4PR01MB6228.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 23:30:20.5114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8YTICyz/9jjso6e/Ozfv1u8QK4zFE94ScersmT/kxY4btLy7+Ovg59f5PbISi1Yf8txSv23kGBCdwJKgfj7fZaZPzzLHgkQ2ZbZyKoKrB3x1OhBObz4z0ltQy/NJYBv9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR01MB8888
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_153025_832420_60C6E12D 
X-CRM114-Status: GOOD (  17.13  )
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



On Wed, 5 Mar 2025, Robin Murphy wrote:

> Architecturally we have two filters for each regular event counter,
> so add generic support for the second one too.
>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>

> ---
> drivers/perf/arm_cspmu/arm_cspmu.c | 7 +++++--
> drivers/perf/arm_cspmu/arm_cspmu.h | 3 +++
> 2 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
> index 053bb7920df6..efa9b229e701 100644
> --- a/drivers/perf/arm_cspmu/arm_cspmu.c
> +++ b/drivers/perf/arm_cspmu/arm_cspmu.c
> @@ -183,6 +183,7 @@ arm_cspmu_event_attr_is_visible(struct kobject *kobj,
> static struct attribute *arm_cspmu_format_attrs[] = {
> 	ARM_CSPMU_FORMAT_EVENT_ATTR,
> 	ARM_CSPMU_FORMAT_FILTER_ATTR,
> +	ARM_CSPMU_FORMAT_FILTER2_ATTR,
> 	NULL,
> };
>
> @@ -767,9 +768,11 @@ static void arm_cspmu_set_ev_filter(struct arm_cspmu *cspmu,
> 				    const struct perf_event *event)
> {
> 	u32 filter = event->attr.config1 & ARM_CSPMU_FILTER_MASK;
> -	u32 offset = PMEVFILTR + (4 * hwc->idx);
> +	u32 filter2 = event->attr.config2 & ARM_CSPMU_FILTER_MASK;
> +	u32 offset = 4 * event->hw.idx;
>
> -	writel(filter, cspmu->base0 + offset);
> +	writel(filter, cspmu->base0 + PMEVFILTR + offset);
> +	writel(filter2, cspmu->base0 + PMEVFILT2R + offset);
> }
>
> static void arm_cspmu_set_cc_filter(struct arm_cspmu *cspmu,
> diff --git a/drivers/perf/arm_cspmu/arm_cspmu.h b/drivers/perf/arm_cspmu/arm_cspmu.h
> index d59040d6a7e3..19684b76bd96 100644
> --- a/drivers/perf/arm_cspmu/arm_cspmu.h
> +++ b/drivers/perf/arm_cspmu/arm_cspmu.h
> @@ -47,6 +47,8 @@
> /* Default filter format */
> #define ARM_CSPMU_FORMAT_FILTER_ATTR	\
> 	ARM_CSPMU_FORMAT_ATTR(filter, "config1:0-31")
> +#define ARM_CSPMU_FORMAT_FILTER2_ATTR	\
> +	ARM_CSPMU_FORMAT_ATTR(filter2, "config2:0-31")
>
> /*
>  * This is the default event number for cycle count, if supported, since the
> @@ -72,6 +74,7 @@
> #define PMEVCNTR_HI			0x4
> #define PMEVTYPER			0x400
> #define PMCCFILTR			0x47C
> +#define PMEVFILT2R			0x800
> #define PMEVFILTR			0xA00
> #define PMCNTENSET			0xC00
> #define PMCNTENCLR			0xC20
> -- 
> 2.39.2.101.g768bb238c484.dirty
>
>

