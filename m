Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B513C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 16:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+g4ui3KyaQOQSKRLvVELivVjmRwDUGPsshAD03VPkCo=; b=MVob6kUpcCnPj0LqjS4ubvIvlQ
	mt6rahVRWi/QG/gNlCjNEddghwgfTo6TKUHuhWXWd1NuEY3AVK0i+9cQza1QU5JJfVWhXYNmGS10k
	IVpmM2yhotWftwuypw14QVoGLv0fAV7zMi0neQTmg8ejUYZghlP7kvH0fLkLU06/I39w68+8mxrxi
	cfewPwgp14cCPOComrCfpMmja9qRbO3QEPh0S/Jb3BBB+5bB3creRydDb5A3BvaaWYnqaaB40ug1Z
	MZ8Osrmy5mL2PxqC9KqOktpK8nbSXclTZhI79kjo1SCfrKdUy/UStDzQHiGsNBcIq4Tmg3XFEF5lN
	rxju0PRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KxI-0000000CHPT-47wS;
	Wed, 09 Sep 2026 16:15:25 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KxD-0000000CHOd-2PYS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 16:15:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mpKxqJzDTs3SfYbIJGht0zT8bSIoe8YSjAiVcv/q37rRwHEqo8Zrjk5wWD0bBcJBfdUJ3DAzw4Zg9n687qZy6+3MHH6xesKTRtm1Q9ONrVLtllC9BLmK5cqCRuj4tyGY65pxNx8MeImzqmrP0cpibpGVZhMJ9KGSmw/BSzBQqBTPMQSQUqRfwuNzyUCBbSoLE/N1Iof710Xo+FnmAHDCUTs2DUTjXpggu4GH2lQGSOvjrpdgeFQSxcg/DIYdr51srzhLdSqM8YgmJhNPjK84wId8p94v66MMlpvO/oAPyVdEOlsMjXn5rGd9pESkwvwz9Sk2pgf8yyn/avFyuf5zgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+g4ui3KyaQOQSKRLvVELivVjmRwDUGPsshAD03VPkCo=;
 b=OkHfYvVh8I2w/c/V1VzEQ3POOf8tdSJ0qRNzDWyQFiHFTvcMOshb1pTi7ud1UsWzC5mxNCKG5h6T9FCwrHIWOFZR37W/ktMHzSQajUAHrVdiamb3KxD3hqnyZpGiDdEiEiSvtgyWsNzhTIIvZHXqdqlbjJWaVpo9BN6bNBhXzRld9q44gm7362KwefvSy3evZuAnbu7Zo+del4TumKfPrjD1QkOcM9tSCqTutFwX+OwAiBrAB1fUiso3BUagvBziyqviLpkzjyJCgoZ3nNlS7Er8qzaGHZ5rQDcoOKaJ8L4m7gw1ev19ww0hIRRCNf8/9cU5BC0Ru8vr1A2X1bdUJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+g4ui3KyaQOQSKRLvVELivVjmRwDUGPsshAD03VPkCo=;
 b=Bcn6K4yC3RgHHrAZjmt4kgwdDtrHAJJB7aiiJKLabSLikHYlGFSeiN2vnnTpc8sbP8uTgcdQQHb1H2uqDURdSaf1nlwbjarm/ftuiMkW5y/nsRlm0X6OJxUND8yS1r25aGyV9cXlAumWlAPdNC35TIdMhY7YG4yCeY7YRxuf7sY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA1PR12MB6798.namprd12.prod.outlook.com (2603:10b6:806:25a::22)
 by MN6PR12MB8492.namprd12.prod.outlook.com (2603:10b6:208:472::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 16:15:09 +0000
Received: from SA1PR12MB6798.namprd12.prod.outlook.com
 ([fe80::e317:e4a3:6ae9:8c54]) by SA1PR12MB6798.namprd12.prod.outlook.com
 ([fe80::e317:e4a3:6ae9:8c54%5]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 16:15:09 +0000
Message-ID: <b2dfea6f-078d-4a8c-9b92-db956e6cd18e@amd.com>
Date: Wed, 9 Sep 2026 21:44:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 3/3] net: xilinx: axienet: Fix IRQ error
 handling
To: phucduc.bui@gmail.com, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Michal Simek <michal.simek@amd.com>,
 Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260909045450.16176-1-phucduc.bui@gmail.com>
 <20260909045450.16176-4-phucduc.bui@gmail.com>
Content-Language: en-US
From: "Gupta, Suraj" <suraj.gupta2@amd.com>
In-Reply-To: <20260909045450.16176-4-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0156.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::11) To SA1PR12MB6798.namprd12.prod.outlook.com
 (2603:10b6:806:25a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB6798:EE_|MN6PR12MB8492:EE_
X-MS-Office365-Filtering-Correlation-Id: 2728317b-d958-4808-81eb-08df0e8d847b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|6133799003|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: B8SE1WkYdQBL4cWKDcKz7FVJUxGAvtIO+pNR3nHrgzEy6ssZM/GBjgIJ+awxzGiOzOnAv3P/Ras5mO4jSvwZUkZ1vl27F42DkR0jrgdql81A4vhE8dcIiQL+eiSmfzlhzR0Alj6d8CPz+tYJwP1xPeoL/lFxBBxhj2v1xGIYvPDuDIkAqpEeN+JP2L0fVtJzwHwfYxKQl/N39qBFwpKLxM//lvDQ5uBRH+86Lrdi9mXsCHf2xOS9he2hXrnP8y6vtBHFWpCiWAj6v+7jcbagjHgE+8JoDwqnHFydv4u/Kjr8BRCrbj2E4x7kLm63BbGuqQB1N+LW+TfafLghoqIOmDrq9ohw9hEfhu/a0QrVr7i9kJmSfx98Yo0UBenDUHh53bunAJ9AUdoxyLfqpKMKbuXuf2DqkOm+X3JMsaE/vSmQE5DQOt7Ng69vgP4+W0yqlCTaFJ2m9d1UMYyNugVKheSsqoibmzHy0VA9KdejoVXfaqFdo4a0wanLulRqP5MFDiRqaeUWB5tnJRx2sLzkJd2u5yE7qWJZlWNGy9/LNNB6/KM5Y/HrFQ2Cl6fM2FppJEknlpuKtRluGC7Sp5N0FCRewmIAJgMqtUdF9dz0xbxuWe00b9EdXh3xq+2cpG5gAtjF3a1Zvrw37A2WOmuJ+W7VVllrO6aXHXjR61hwBis=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB6798.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blFsZktnSFN5NmtxOHAxdUcydzd1amYvdlo5TzQrWmpLcXE0NlQrUTAyZmNM?=
 =?utf-8?B?WmwwcjBkdnBtakJoajNmWWZCRkJybjZWZ0RHak9CNWs2eU1XMUVjVHZsUXpR?=
 =?utf-8?B?eHlCZDZnWS9jcGdYUFc3cnRGUkEzS1lMZERoY3pqNUZFRWVFQUYrbXVnbWxD?=
 =?utf-8?B?SlVZNjU3aFU5ZXc5VGZCaUllOHprUENJSk9aV3FpaHVMVjBVMFo5dmFFYUc3?=
 =?utf-8?B?R29qdnRqbjV6K2VWQUFTaEpEa2R5ZnNJZFVpSHJMMTc4NnZUc21vOHBFeGo3?=
 =?utf-8?B?L1Q4UDFycjVjc2tjSnpaSjV2SWlSekQzZm5BdXR1NEhvQmVrQUp6NTF2VDEr?=
 =?utf-8?B?R2g4V3RrOWFlWWZXR0t1RzFsZGNmaXNHQXR6MkIzZkVuRkFkY0w0VnRXVWtM?=
 =?utf-8?B?Zk5hU3hVWUNQZWpSRkgyL01UQjBkWjVsRjlaM1ROVlRnR2xSUFdPSEQvYStj?=
 =?utf-8?B?Q3g1MFNlZ05aQUpDZmdRVUVyM3lRa0JhQTNobkk0R1RlSzk1S1JwaUFQK3hO?=
 =?utf-8?B?aHNMbmRNTEZhbDJrbUpxa3R3TEw2L3ZiTzBoalRwLzJ0THE5QzJhZWc1WnU5?=
 =?utf-8?B?VFhIbHh1MVFWMVJwbkZHSVpCQitvSEZIdXBsN3dhaytvVHlJSTFPRFkzSEI3?=
 =?utf-8?B?bTNEcVVxbnppUStwdnRXMjFvRE5QZ1ZLVisvbm11TFdpQjFlSjhhN3FPTCto?=
 =?utf-8?B?MFBQU0NzVUpmbzB4ME5BU2wveVRFR1YvWCs0M0ZWWTBBNkxZekpGTmhjQXgz?=
 =?utf-8?B?MU5iRCtjSC9kTDczek9PNTY1OXdqcXFvT1RnWVV3bHZwV2ErcWlOdGZSMXha?=
 =?utf-8?B?Q1F4T2JiNnNoNXVZT1g3eEV5R2x0ZEhaR0JQb2lTeCtjZkVoRlZ2WW52Ti95?=
 =?utf-8?B?emJTa21MRVdVS1dEbTR0NU9pbC9kRHd2WkVUU1gzL25wZFZxY0VBeFpDbTJW?=
 =?utf-8?B?YkptbFovcFI4ZkVZSEJsSlV1UmlSSFhWZWpOSzhiakpqY05jMDRibGswRUth?=
 =?utf-8?B?eWNZUERWanFlTi91cjREZkdvbTVlOTdYeXVuSWJvbXg2ZUNqVC8wVzU2N29Y?=
 =?utf-8?B?azdCdmZqSytjaEIrMkZKRytTM05mVGppcWNDTGxuT3M0cG5NUEszZm0rN1Jq?=
 =?utf-8?B?dXF3R09yMjZZOVFJb2NoelBFTk42WERKMlVOMVRQR0FOV0NBMkExUFEwNk5x?=
 =?utf-8?B?UGM3dW1UZXZ0elBKejFEY0dlNS9na0c4MUlLbVNHUTRBMzBsb2NXZktqQmFT?=
 =?utf-8?B?QzF0QmhhTkl2MHlMVVZhQUVuSDVDT3pqR05xd21rbUFlZFY5ZzhzZTh5aFZt?=
 =?utf-8?B?bi9BWmE0NXh2SEh4amUwRHlzZzNPR29pVUgyMndVamlYZGRkZFFrSUJPMGJP?=
 =?utf-8?B?bkZsVmVSUUE1Y3VSYnNJVUUyN2RyR3QrV0Y5M1RIWWVCb2lOaURXZWF1ZHlo?=
 =?utf-8?B?RkR0bXhMM3pJdWNZQlIvZG1SZ2NJTzBFUnZDQWEyVWNYdmxpekdBanNTaWxG?=
 =?utf-8?B?UHFnMHE0dVhmZkh2QUR1Wmt6cDBpWE1JM0VkM2lIWDAxUk0yNnU2S0VFNUU5?=
 =?utf-8?B?TERiTzhrNEpoOWhEVXcySFVpZjM3azBlVEtvb3liQ2VFbnA0L1hXU3Fzbkx1?=
 =?utf-8?B?MjNkOUZrQlRwL1ZSK1VMbS9DaURoeHBXNlpyVHV0bmFWc1AwZDhjV2JuSGJO?=
 =?utf-8?B?U1g2RUFLdThuN2RXdWdKMWJCVk81dk94VGhTbVVuTUFpekx5T2w2czJGelBh?=
 =?utf-8?B?RU93WFJuaUJROFo5U2V2OXhVclBJdnNaZTUrTDdXR0tXTHJWTW5rMG5UdlNu?=
 =?utf-8?B?RHJPcHJTOStQYnJsTmlRMG8rSGF5ZklLTDh0U2p6VTg4azB4TnZXQ0pWWE04?=
 =?utf-8?B?L09ZdTVLRzhrRkt1eFN3SUdHNG1Ob20zbTdNTzA1bGk4d2p3d3k2a3dFSDIv?=
 =?utf-8?B?Z3hHSXQvWWJSeDVRWjN0bTVEUjBNZnJxZGJ0RUpkVmNxMytjbFNJd3VrQnZY?=
 =?utf-8?B?OUErNjBzOHEvUnJWRXM2aEE5YndRM0hpWGFFYkg3bzl4NDNraEk5bFV5Wm9n?=
 =?utf-8?B?R2dqU1h6NmkzQzdieTBUS0Z0eVBaYWEyVGZsNVdnZDY0Tm5tWU1XOUg0TDRQ?=
 =?utf-8?B?bnB3RDZWWlpyRGNmdThHdDZNSVc2eVZ0bEY2aG1YYkNjaUJvWjhJL0hoZVNp?=
 =?utf-8?B?TXZsemNsVnBORUN1STJZZVdhTmFjdEdEOVNTRllhYUoySUFLMVg4MVg2QWFP?=
 =?utf-8?B?TWU4bGF4TTBJdEN0NHJsV2hHcG1mK0RGSDVHdDFRZUVMWHlhVWNwamtMdnNN?=
 =?utf-8?B?bEJyajZvbzhxZTVpUkRzU3M3MDlTUUxHL2FIaVcyN1pXMUtzQm9JQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2728317b-d958-4808-81eb-08df0e8d847b
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6798.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 16:15:08.9625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: inLJgpsSM17d/wsoHoo0xmQjTdL8iFs/TZ2Yax+a5xMg+k4InBeynx1E2kSJWZDptK0KhHgvcR7pBL0BPKUHjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8492
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_091519_641638_818B8ACA 
X-CRM114-Status: GOOD (  20.96  )
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



On 9/9/2026 10:24 AM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> irq_of_parse_and_map() returns 0 when parsing or mapping an IRQ fails,
> while platform_get_irq() returns a negative error code on failure.
> 
> Handle both failure cases appropriately: return -EINVAL when
> irq_of_parse_and_map() fails, and propagate the original error code
> returned by platform_get_irq() instead of returning -ENOMEM.
> 
> Reviewed-by: Simon Horman <horms@kernel.org>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---

Reviewed-by: Suraj Gupta <suraj.gupta2@amd.com>

Thanks!
Suraj

> 
> Changes in v4 :
>   - Add error handling for irq_of_parse_and_map()
> Changes in v5 :
>   - Change the error code returned when irq_of_parse_and_map() fails
>     from -ENOMEM to -EINVAL.
> Changes in v6 :
>   - Add Simon's Reviewed-by: tag.
>   - Drop the Fixes: tag as this patch is intended for net-next.
> 
>   drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index 3927ababf833..782f903d318f 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -2971,10 +2971,14 @@ static int axienet_probe(struct platform_device *pdev)
>   			dev_err(&pdev->dev, "could not map DMA regs\n");
>   			return PTR_ERR(lp->dma_regs);
>   		}
> -		if (lp->rx_irq <= 0 || lp->tx_irq <= 0) {
> +		if (!lp->rx_irq || !lp->tx_irq) {
>   			dev_err(&pdev->dev, "could not determine irqs\n");
> -			return -ENOMEM;
> +			return -EINVAL;
>   		}
> +		if (lp->rx_irq < 0)
> +			return lp->rx_irq;
> +		if (lp->tx_irq < 0)
> +			return lp->tx_irq;
>   		if (lp->eth_irq < 0 && lp->eth_irq != -ENXIO)
>   			return lp->eth_irq;
>   


