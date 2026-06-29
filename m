Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877E3C44502
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 15:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9dXasEo9k1rOgGIs4HhiuOKstMd796ZuXBsSxLKNGk=; b=RpyKO5Z3EE49REO+IcdoAvVRcU
	HV2F1Wu4s94Q+Y1LnqWYxfo4/ZV0BQhwTzE7IucOc0gXpUBvCuGvg5qamLUpaCuUl+CIXnjHJIhD/
	+OU0bm9mL+su1hqVEii8nQR7GGsNDnwAb+9pvm/XF+Kadv3xXkKkPCpKLPGS7CuN0sZnwGdlNVNyP
	KFM1LNJMATkzfq6yMpdYBM+KdY82VTSaOehJIMg5vJ8HKKP++oZtXAVZm+hluXERvYb8uzMgAACV1
	gCjGpHAdZqzSTzZTDIxxcpbSaU5Iqtv9/EOIGYTsXGd77YC+LHMbfg8kHsi7xQY8myb7bRa4Pc+dJ
	75D0u41g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDXM-0000000F0S5-30Kc;
	Mon, 29 Jun 2026 15:04:40 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDXD-0000000F0Oq-3hRZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 15:04:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jA1gyDBqOiA45CdLLFa8mJA0i8poX14rYf0+z4I1kl5y0FHu+fp07eoofxrOW/ZrHnGg6zUFB6ber+zlCV17Fom4kZ7oyfDBbEjxCSnTfVcGySyPSIOK8Qd54uWFlTYP1kBMF7K3vqICmkeNWi+f4zrZa+tglZAi8VWV/uPlGE36NkZk00riUstQQK2gLXHFZF77386K48t8atdnoMBAjcH+hajaRCpKU6NfY4GrBDTrexSCKjSJx1GR67ttqodjKAzYlnpZjn7dserGVJknDffUEeM1s1l9cEwb7CybL+/7DB816/h/441soKXG7nKusYvp720zeEF1VEaUVvTA5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9dXasEo9k1rOgGIs4HhiuOKstMd796ZuXBsSxLKNGk=;
 b=pOXouS26lXg7BXzpbiOsWvfByKKKbknZkCCG7ZrXgpOWQUvtlLeAf9ElpejcfB2Qq+k+SzpL6EOkPwDPb5oXc5u2fcI/9KvU616bnrQZRNo3Eys0zHnM6R+vzqTYyILX8QFct+8pPpUdjbtopCrCLIOqNmL6YedE3L67lq6dYc+3IvcsSyLuafLNmPYXbnbbd7FDN9I+9rr1+v3k2WKUUeULbLJgBht2Cs3fDqYVpEiB4t+1Pl/lSuDzkBp1FsY0cuuj2LQI1f6M92yAT/wYcqB548iVjaHgsA3VVCBZIhl2rsTY+LE9RzWSXiylXBbTXXR+5KeBVD78mTSBfuX9HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9dXasEo9k1rOgGIs4HhiuOKstMd796ZuXBsSxLKNGk=;
 b=d+HWaH8euZBYc6CbLwtNhpi5hjWU59+47sn3Sdz3nWrjJb6dJ1UqrJoRXOHQj/cebjaHC0NN8xdZo5fpZXP3j+w86M8T+bbIwx9lviQ+88lvYdaCwnHTGn6KDPovL50lmyi6/BDhhMlr5uPyo9MnInjWchMwTzNFciWBmOzCiIY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by CH3PR12MB7641.namprd12.prod.outlook.com (2603:10b6:610:150::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 15:04:19 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%5]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 15:04:19 +0000
Message-ID: <2939bf97-3ed6-4283-a1a9-9480c78c1a9c@amd.com>
Date: Mon, 29 Jun 2026 20:34:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 01/14] dmaengine: constify struct
 dma_descriptor_metadata_ops
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Udit Tiwari <quic_utiwari@quicinc.com>,
 Md Sadre Alam <mdalam@qti.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
 Andy Gross <agross@codeaurora.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com>
 <20260629-qcom-qce-cmd-descr-v20-1-56f67da84c05@oss.qualcomm.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260629-qcom-qce-cmd-descr-v20-1-56f67da84c05@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::12) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|CH3PR12MB7641:EE_
X-MS-Office365-Filtering-Correlation-Id: 75153a00-4946-4926-7944-08ded5efb21e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|23010399003|376014|4143699003|56012099006|11063799006|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: S2RYZG1cHhDRdqTxKUrfrKRZh0B+klCVZFYEKumrf4Rwp110Cf15d0236BHkHqFyOVP6DPpE0z/Rksr66+Wel1hQ3Ks4cQv3YrlRRTJ4LZzjXEIHglDM/ecM3yuG1TwILg2Av0ql6liWP37dphmP1F4EH7++PubZ2aTbuMPJchginZ6i0ww9BJ32k9Xt42XZYKFyyu8MJKr6ynlJyIk6DWgreWsDt+8TQo8OObAsmvKzYSvg6ndbNsabLQagp5VCghhq/XW35agGPE4EIUmN4+joiKPHKvClGegLGCoWGkwDbKhfBfzSsrtF63Bo2J/ctCi3WXza2lTj6E7viGZg43k0jWfVmAqeElAexXDN7AZPonaN4cLh6XMA1s/QPKCkUb7HKjELeFlKIXaMNnP9BCoh0t+zxkznX/kR3wpODmDo1Brz3hBOO4PAmlwD/v9cYkvbSbWBJqihdghwWx9LcatoQwWllzYyXuoTUTnZEyIcsfhKTu6fZHZIHKsuas8F8Zuoy6qv3fRX+2C1Eb89ue4gtrS+g0UnKldw4LMHgjxkMImxnXeTVn5S3ZfrYQ4msb7nQO6snhytsszsWHQ3seRjeiM0XvRtVtSm6DnFjmH8dBN2TwptI+fhr1dpDu0VmbGueZ9TB5f6rPaXurcjQgINJDRD8GnJ0loWDx4dhBVKxGe5ivTxDZR1S/VkKWqCgE1DB4R/64wGKYD0sDLHrw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(23010399003)(376014)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2JmSS8xdVFjS21ETWRHK1hteXp3b1NPU1VLVDN4YTJLMHNZemlwQkE1UzNo?=
 =?utf-8?B?S1hja2pLWmRsNVo3ZlM5OHRsSER0WjgwY3FQMUZRRllEaGRGck4xN1ZDeHR4?=
 =?utf-8?B?VmJJc05EODNiQllMZXVsSkxZMzdxK08xZDdyT2JmbDhmQzVDeU5zWktHOWZC?=
 =?utf-8?B?MWJ4L1IvbHdqT2VmQ3V4dHVrK0tFbkZJVDE2Q2VPZ1d4Q21MOGFRTFNrRzBm?=
 =?utf-8?B?MHdmdURqSkxnUWFQZXRtOFpublh4d25kRzV2YmhoTFlmYldIekpOMERISXVx?=
 =?utf-8?B?TTVIekhXbzJvYWExdWtxQ1BxbTA4RWR6Y3EvUXZuYVNNbWZTSkp0UU9TUGpZ?=
 =?utf-8?B?cmhLSGI2M0szY3AvSm4vc2RLbnhVTC8zSkZ4OGhpVjhpaFZBQldOUDE5K0My?=
 =?utf-8?B?UXJzODhkNEdtNXRWUVFvdnZKaHQ5Y1N3S25CeDFmdnVyT1BRT2dvWEpqS1o1?=
 =?utf-8?B?MjFVejZOb0kyN0F3WWxyNnVHbnlTVGcwd3J3d2FDRGl0M2pURVVPQ1JkdjJQ?=
 =?utf-8?B?S2ZRYURMSXoxV3ZldC9sZWdKdWlUT0ZKcUpmRENmWCtnRkFjWXlvM1dXYmM3?=
 =?utf-8?B?MmJIWFBDUFZROHhCa3liL1kzZzdhTGo2Rzl6RTZYaTA0K25pRUNjcTNPRUtV?=
 =?utf-8?B?QWEvVXQ2b3E1VS9NVGdaVnFPQTJqZHVFRnhlL3hFVTI2MmxRUFNUd28vdVhB?=
 =?utf-8?B?SWczRmtRL095Qi9sc0lCZzRKTXJ3dnoxTlhBbzRTYTRST1lQM3p6SXorc0pB?=
 =?utf-8?B?emRlSEZKUTNwZGRRaGw4OUtFVFpGUXdLNHBmZzlxSTFZNjJYTjd0elRqcGpG?=
 =?utf-8?B?VElrcUZNcW5sY2NibjVTV0ZUTEx6SkRSc1hZekgxeW5FM2tKNEdDaWdFa25Z?=
 =?utf-8?B?QXZkQ0hYQWNrWnhPZ3ZNL1JBTG56OVY0VVFxM0c3c3pGSlJWbG9PR1BlRUhw?=
 =?utf-8?B?K0ErVm80ZjYyS3FuaHNWRkx4aUxtVUpwM3VsVVM3OCtUM0VuVzJMU0FSaTNj?=
 =?utf-8?B?b2FCOGFjSEVla2xDdDNVUlYvZkRnVTZ3blRGU2hCN0RITk55L3hiUExtTGJ4?=
 =?utf-8?B?bWV4NFYyTXpRdDRBdkdDa092bTFwLzc2d3ZGZlF5TkM3WFJCeXk3RHh1U2tW?=
 =?utf-8?B?alFublJMY054dTFjdzZ0M3VBQjcvU1NtTGlQR2F6UHFHY2VZdTMrckpFYVVO?=
 =?utf-8?B?UFVVMnMvaFlxTTdEQm1QeGNBa3JPL3FzUHY1MC9xVVUzZ3c5dFl3TFhSWnRC?=
 =?utf-8?B?RDI5VTErVVJBelpEMVEvVjNncGxPSCsxaHBrUnZMNWtvTnY1KzVXdGtxaE9S?=
 =?utf-8?B?VHFJbjZ6TnlicnhCM28zRWRGNUxVaFVpODR2bHRHVitNUnBCN3RPQ2hOQUF4?=
 =?utf-8?B?UDM4RlI1cmRNNlNCRUxzL2YxY2UzZUVzU3NwWGpjUm4zMDdaSlEwYi9hTzhH?=
 =?utf-8?B?RnpIVDI2bCtYcE83SW0raXBIUktCOEF5R2JaaFFWYmNzaHBBRUQ0VHV5cHZ5?=
 =?utf-8?B?RmdNRmk1V0tJSm13NXZ6SDBrNEFUczdTRkM4K0pHOW94ZzZvT3B4amI2SlFl?=
 =?utf-8?B?amtUaVQvYlhleFhISmpSb3V4REN0WDNtd0svcU1RNm9oZUdncWRWYlN2ek5S?=
 =?utf-8?B?Y0o1U2djMWVsQjZrRUZXZ09rcmFibjVCMktaUkxWNnY0U0NwSzdnd2xIZml3?=
 =?utf-8?B?MExyUXpCa1ZVMS91dXZhTEswdTZLKzUxTGlLbkgwaHdCblBZMVhNa1pGb05j?=
 =?utf-8?B?ZWU3OG9XN2VrMDJnUE9uMmU3KzlXT1hwcG9CZWdxVEVxQ0c5VVU2Y0VyQjd1?=
 =?utf-8?B?eXNkNWptdGNpaUhMekhHSDVGRXdEbDhQYWN4Vk9rWmFtQTl4L3cvaXRWeWZs?=
 =?utf-8?B?UzlsVWtrNm9oRmJIZUQ4dmxUS1JCOUFvUXI4SzB4Q0ZJcndUZUJQRmxQTno1?=
 =?utf-8?B?c1pTeUg4QTE0RW1kalJ6dXVIVzFQK1ozUGFISHFoc0NzaGtmcytNbUpWUmpV?=
 =?utf-8?B?OGlkQmxkZk5UT0hSdGczSy9ya1pEckZFVHU2amx5YjFUVzFRckM0Y1FtZWRW?=
 =?utf-8?B?TUlOallyZEVXUzR1UlBlSzI2SjFjdU9HN084MGJZM2xzUjhPV1hMVVRvT0FU?=
 =?utf-8?B?Q3hVb1M2NUpxa0JLZGN2YUkzTTc0ZGwxUkREQldSVnNSNzdFZnVBN3Q1L28y?=
 =?utf-8?B?NVBuNkVtdmtwNEtab0Z2dFRWb2tyS1RBK3dWTGxxOU0vY0tyWmc5cUoxRk5B?=
 =?utf-8?B?UTFrbTduRFVTWEZGbnJEMkNpd3FRSndZZ3YrUVdIZFUvQnlxNjdSTkNwQW1k?=
 =?utf-8?B?c3FxeTdWaDlIMUhZWm5jN3BlTm52OUJPKyt6cVVhRHhXK3VTSUlndz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75153a00-4946-4926-7944-08ded5efb21e
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 15:04:19.8719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m+BlNyiwEDbPjFUT0SQlkeqCjlEnL8uxSGRM5N4l1v+Yz25KOVzMJ2qkGjSNLpR/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7641
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_080431_929400_E7514956 
X-CRM114-Status: GOOD (  15.82  )
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

> There's no reason for the instances of this struct to be modifiable.
> Constify the pointer in struct dma_async_tx_descriptor and all drivers
> currently using it.
> 
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Thanks!

> ---
>   drivers/dma/ti/k3-udma.c        | 2 +-
>   drivers/dma/xilinx/xilinx_dma.c | 2 +-
>   include/linux/dmaengine.h       | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
> index 1cf158eb7bdb541c4e7f4f79f65ab70be4311fad..fb21e0df5ab7b20e4e16777b5ff7f61d2ae67b2b 100644
> --- a/drivers/dma/ti/k3-udma.c
> +++ b/drivers/dma/ti/k3-udma.c
> @@ -3408,7 +3408,7 @@ static int udma_set_metadata_len(struct dma_async_tx_descriptor *desc,
>   	return 0;
>   }
>   
> -static struct dma_descriptor_metadata_ops metadata_ops = {
> +static const struct dma_descriptor_metadata_ops metadata_ops = {
>   	.attach = udma_attach_metadata,
>   	.get_ptr = udma_get_metadata_ptr,
>   	.set_len = udma_set_metadata_len,
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
> index 404235c1735384635597e88edc25c67c7d250647..165b11a7c776abc6a8d66d631e19da669644577d 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -653,7 +653,7 @@ static void *xilinx_dma_get_metadata_ptr(struct dma_async_tx_descriptor *tx,
>   	return seg->hw.app;
>   }
>   
> -static struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
> +static const struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
>   	.get_ptr = xilinx_dma_get_metadata_ptr,
>   };
>   
> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> index b3d251c9734e95e1b75cf6763d4d2c3a1c6a9910..5244edb90e7e7510bf4460b6a74ee2a7f91c1ccc 100644
> --- a/include/linux/dmaengine.h
> +++ b/include/linux/dmaengine.h
> @@ -623,7 +623,7 @@ struct dma_async_tx_descriptor {
>   	void *callback_param;
>   	struct dmaengine_unmap_data *unmap;
>   	enum dma_desc_metadata_mode desc_metadata_mode;
> -	struct dma_descriptor_metadata_ops *metadata_ops;
> +	const struct dma_descriptor_metadata_ops *metadata_ops;
>   #ifdef CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH
>   	struct dma_async_tx_descriptor *next;
>   	struct dma_async_tx_descriptor *parent;
> 


