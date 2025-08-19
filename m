Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92024CA0EFD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 23:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N1bErkP5sTlhjX4U7A6bf6sVJWRScJoli0YJPCmL668=; b=tDfLLs4EZjhnB29k7ivOluPfO2
	CLkJAL9eJnjq4QpxuEvDT0bqr5829h4nW5EQpbpZhFdUg6GVGkUKTBA3Hz53pHmz4nKiZMafwEWHZ
	Muj+JmVI65bHpE5lS8kyje80O+94EkQAKsa0YfriDQD2zW8Tbpfys7RaCcJDnYXIkqFS55KqUfKif
	1nfKAN4LwjeSNOnK/FhwRqvy9mj+/rh+ob1/4ic6nqHJPgdh5jbtktcy/3libKHVqGbXz7jtU3tUk
	nyf9/4xsq2MRzFu4QejzLdvh27PQQAtgsP2Ka+jjBsIxJtHu01K8u2MFAHCYkgdjIrjl+CCL95WCU
	l81utC/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoVK5-0000000Bo77-3Dg7;
	Tue, 19 Aug 2025 23:00:57 +0000
Received: from mail-mw2nam12on20704.outbound.protection.outlook.com ([2a01:111:f403:200a::704] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoTsk-0000000BdWl-1G0d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 21:28:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VT6DLWhXKCQgSR76ljGuQQJ9XHMFIptduJWHsWFtIG5Ttjhv/wJE1sVIdlQ0si7KbgMZy1yvRIqP14i/crvBfeDn+Ngif3LvAT2kKhnEyH/PK7fLrDqJrTSfwzzlmlZSmUIKQBzJMYkizN1m2ZDVW9n7+tnQvUfibaMnmEbwW0cbpLAQj1YHhAouYYUmVAhddG+MC0P1eDGk9ik8+h+j61XeWHOrOGqprQxATSNk1riS94O4TF77N3IZxoJYru7n+eFibESoENPTQExHAP/dcDwhGAiVjY7th3MVRXUquIgrbMU12JaMCdxWQKUxeZ7M2+wXv7VVK0AtK5FjUBLvUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1bErkP5sTlhjX4U7A6bf6sVJWRScJoli0YJPCmL668=;
 b=mYvVt3udd4nb6je2lyJ0GSsIgCyCBju3+T4qUDlrunEdulu/+2St3CWIhtBLlvXh/4WZ422nuNVmDgJkT5n1uFwp6siq+7vHilUKsFT2dietMKmBDyraik9+gJIdFFscUjJCCtAJz8kf2wMV39G4bFx//Q7qmv7JtpZoVfSAcdDHMpSvR7oOB3+t2czwTIo/PGSBumdySX8KEcxr7NNNa7HwhKAjkNj6UNJX2v0KnR2/Y5WSL7Y5B969K3ADsza3CVf4fWzgesmJeDfKTQaVY+B4Gk6wtkTvNMwFBwXGkbUq8GHJ8Foo5XxROqOIUouLbbrDTF+0mdGHRg/IQE9iNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1bErkP5sTlhjX4U7A6bf6sVJWRScJoli0YJPCmL668=;
 b=Rzxl0s9o2mTz9JBqohG4ymNPGoAs7zPYpfHPPjzM8nVyV1VOcbPjTdyo2WmEJ652v1DZNpsbzCLqwZPPHfr1eSFuUeCiZNinKFcxHOTGcDdMVUCDeDl2niVHNB+r7rK/7/1skvlaM6zdRLIwDB4n0MNtJRHsFfhrnmgS/lo7hP4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from MW4PR01MB6228.prod.exchangelabs.com (2603:10b6:303:76::7) by
 PH7PR01MB7912.prod.exchangelabs.com (2603:10b6:510:269::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.24; Tue, 19 Aug 2025 21:28:29 +0000
Received: from MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba]) by MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba%6]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 21:28:29 +0000
Date: Tue, 19 Aug 2025 14:28:24 -0700 (PDT)
From: Ilkka Koskinen <ilkka@os.amperecomputing.com>
To: Besar Wicaksono <bwicaksono@nvidia.com>
cc: will@kernel.org, linux-arm-kernel@lists.infradead.org, 
    linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
    suzuki.poulose@arm.com, robin.murphy@arm.com, ilkka@os.amperecomputing.com, 
    mark.rutland@arm.com, treding@nvidia.com, jonathanh@nvidia.com, 
    vsethi@nvidia.com, rwiley@nvidia.com, sdonthineni@nvidia.com
Subject: Re: [PATCH 4/5] perf/arm_cspmu: nvidia: Add revision id matching
In-Reply-To: <20250812233411.1694012-5-bwicaksono@nvidia.com>
Message-ID: <9fe744b5-94fd-4ad8-8485-c3761b211edf@os.amperecomputing.com>
References: <20250812233411.1694012-1-bwicaksono@nvidia.com> <20250812233411.1694012-5-bwicaksono@nvidia.com>
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-ClientProxiedBy: SN7PR04CA0054.namprd04.prod.outlook.com
 (2603:10b6:806:120::29) To MW4PR01MB6228.prod.exchangelabs.com
 (2603:10b6:303:76::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR01MB6228:EE_|PH7PR01MB7912:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f2af957-8ce1-409f-e46e-08dddf67572f
X-LD-Processed: 3bc2b170-fd94-476d-b0ce-4229bdc904a7,ExtAddr
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BKAOmC6UN1WyC5DNbkrguVJIn3KW2p9FV+1yVSM+Yzaef8zKVHeJkjPd8+lO?=
 =?us-ascii?Q?UtuUta4BnmN9fbjB+clCzSQ/EpSWw9pw7SwiYlO9Z6ZvWislLiPT/tNu/AsX?=
 =?us-ascii?Q?+pRp2IEA9AAPAob2JieN41uNXviOuWPqZijVIi8axGBH5DeoYchGhImroP5U?=
 =?us-ascii?Q?uCBHY4Pp2TGCFav0EJ91AJdne8E9Yk+a5gGFfJ/9xVquw2Jh6R8b3fuWkChN?=
 =?us-ascii?Q?twrXk1WqmphJErqMlN+Foxx+KljSVV1qz3Q4MRXLhjfVwky18AOv8NcSxsQd?=
 =?us-ascii?Q?IeIiiYIgHkcT+4LCe1/M1NDvpppiLXy1fXNoyDwNr7CRrtqO/6Q5kVqnG0YG?=
 =?us-ascii?Q?IJtA9yCwcmW8XDZR9Fd32DM/dJtnkwyuRmvu6cuO+JsDKAAbspH9j5RlsDbl?=
 =?us-ascii?Q?N50X7d/AZvgjD6V7dzpPEbXuV7uxals4mSTtm+1Nri6e8hrl+y3TwNBAHcjK?=
 =?us-ascii?Q?UpfdlV71TYLLAsaFY7gUw59G4pOZw5AEEl9+94T9TXKXN3TJ94WntYu/ovmc?=
 =?us-ascii?Q?OSsNeCWrj4MeRBsXYe9VlZKCeC0C3R/JxAzq2u2R+U/ns4kOL1OMuEV0zqlY?=
 =?us-ascii?Q?MykrrWvp/7qUSfwrjLObE+Elqwd2FPUWuQ9ulxBN9MVheaO7CLBk42uaS+Fn?=
 =?us-ascii?Q?aJpMCdtx5nSdHRNeopPrJuWoquflrvlf5EgVD9XfsYXkoSbX7/fv9L/tM2rD?=
 =?us-ascii?Q?SVP+O50hK65HDTjp3Fk4qla9Cv0ai/tg87mmzLxuKf+PUm0+sOaltNSRNfwk?=
 =?us-ascii?Q?1hwAddqZC+shZ1JM1pJSarrpsPMMJiGj/B0ZJwb9Mh2Ppgz+waA7WZq6McBA?=
 =?us-ascii?Q?CBC8imk8K11V3KQK0z/9iy3igwWx9Kuc560UcvUyAUArE0u9cHIKNeg50w30?=
 =?us-ascii?Q?T1k/fyaSnijyRVWrP+/eH8x3isrNXW3UXKxOpsZFKcYAxHTEcg0dMxhNyAWD?=
 =?us-ascii?Q?YKDFokivQ90mMRwqLXMwVg8jBoZNKR79WE3YgxplXMSTu57z94Kv16EUNQkS?=
 =?us-ascii?Q?0fMsgunSIpS7IYMRRSzg9m1kLXICJeqrVzQvBoiKe0DBf5qCXQ3FxjWYmOFU?=
 =?us-ascii?Q?F15MyfjYUmor91/FN/cuU46hn9G4M/J+0nOjrf7bxlG8K03Lq2aScQAfm54n?=
 =?us-ascii?Q?xLFKWsj2HFCBre/Cnf18HQ2ogLKSfhFupcHWxhHfeQ3qYqmfARIbCZJCib7A?=
 =?us-ascii?Q?0j+lfU7ysK4V19NeE062Q+tElLClWs2rMnBGbdFoDJ89LvbRdy1YpNFyitbN?=
 =?us-ascii?Q?ZyQVvASrG7yfRXJaPkNwdG9j6itexJhSNpoqXiBcEsR+aQjtrgpF2LcJ6Blv?=
 =?us-ascii?Q?hQ2DS7++90pICbm7f+5fUE3bPTrQmVpsWjnvBpjj0L7bgcQmmJBgOaddHCi7?=
 =?us-ascii?Q?+xi1lKzi0h6EEGnmWPbcrpoY4uzlVPjbNUqnAw56ISVCGp2NeIpgludu6EXu?=
 =?us-ascii?Q?euZrRoMyzymZdw88PgY8+GJEtJvvFMI/8Qmy1+njtNQyhXDgtPne0w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR01MB6228.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3T+/+MO/kg8CsR+ein9Tl13/seMS82Hd309QFUM5yczUNJQgcD0Ecg+q9X8b?=
 =?us-ascii?Q?lqYvuBhcORaJPx6LNmURA45f2n4sovnvVQc1IfWMV72b1mzauvYVI2OkVBVu?=
 =?us-ascii?Q?WI8e8LYDGgJ3YUpyrEQehYZsSJo0XvXzNAAa2N6OCQSX1Fpht/OvGGhWUuvh?=
 =?us-ascii?Q?I92yuG46p8vrevQQsO6vWBM/lRnkj8t1YaZ1cqRAGly0EA1fxPwUReWhYcTS?=
 =?us-ascii?Q?bN54v2si3seWo1TnFR0szQoeSIwsjB4CyF+SFVFRQ4nza/g5n4ZWXX3dR8Os?=
 =?us-ascii?Q?RMW+DrMmt7zbJEOHowEeJTpVkzjs6Xns5WJj5IYEqWkPV8cuPO8sFpMtA01s?=
 =?us-ascii?Q?rF9x8twsF+fGgONrbFzw2Q0W7yZU7kXm2cyRlo3elHukDAF7F6JuJK4+g6ce?=
 =?us-ascii?Q?U6EUSRBZkLBGoQJeBbT2W3b65DDOh5mfPjLKB9zmY98H0P4rQgSwterusXIN?=
 =?us-ascii?Q?vayGNJ/KRKOafC2+rA5gnpebl9rNxcKV+/hJTfc/Y3ZrF3a2zDqAF8X5L7FB?=
 =?us-ascii?Q?hh00NaFR+XXs9uF0rvKtEs7Iu8X8N5/2o05OBkGYhVgh2BrHXaWIemw7iAGA?=
 =?us-ascii?Q?mmpXrk3i+HKAO07h76yT0elO/g7UlTpyQqPFXvTu2wRXHvuFlDC5VC8PfYKt?=
 =?us-ascii?Q?LW0Ht2O8nwROTK69X/RunLgRErhBnX2oJ6dAvpHdPW5ou/96S8iAfPNM318A?=
 =?us-ascii?Q?F5hgrcb/KcyGt0gc+mMpWlQEgo5CaF782GwY2xHzcAOXPQpGQ3BZn+ABcHP7?=
 =?us-ascii?Q?zStYbvRc85eG17lAlEhbArq/a1LjxXMAVAmuRsIavPrf4fpraC1xpuJbI5Gl?=
 =?us-ascii?Q?IlSmp/fvmZl74kXmQ80ZQbX91QdcjrMPUi7Mu9mKWak2hpsxj1/wnxHHMjW/?=
 =?us-ascii?Q?+0QeTxRSaNLmclgemItgrMxIVeLut6uZfa12ncX4iqhOgxJ7IfuNgJOL+I1S?=
 =?us-ascii?Q?v/i6FLxz2pEvtQHhea7JnnB6na8JjER3Ou4NZ4Wjm4ha5YH1AvhTOCmipxvl?=
 =?us-ascii?Q?4JdmRRKDl7a+MdCvNo0gjBHT5KgAmbLS9pq0D9ADwIbEj0/kEgG8ABzmv/51?=
 =?us-ascii?Q?bpMUwa/jVAbSmlKdovLDyltEkVowVSdPksYstRwr/VBeQP3c3iTYFT0B+e76?=
 =?us-ascii?Q?R9Uho3HZue/Hc3C5f+YqU081ephWlRzIu2yKbSlEpkVaYdAr0QIjH5XJgUGs?=
 =?us-ascii?Q?xiojxt5LtNR4FX+8PiumUyuJN0lClKLe4s2ReJewRE6H4jpVmAr4VERDQa2+?=
 =?us-ascii?Q?GAm+/E+Iw/aPHbzuL2nLYqLE4nOdsEfoU4Nh+mc2lG3qcp26pQGD64vQoL9w?=
 =?us-ascii?Q?+tHHWAPgb2XeKEI++ThxCu8lAT9QGoHTvxcBitemlYF0Io7vaqCT6Oh0sgmP?=
 =?us-ascii?Q?XsXHo22o/OfmKGfmJOO32FE9COxIH46PaMdgrPIFfDT5mZtID92ztioit8Ae?=
 =?us-ascii?Q?a6/9qDFqIZtmLwEo8dor5pGquI6+GUuTXKbeUauWpFHaq7iG58p8VWaxx9l/?=
 =?us-ascii?Q?pH1t1jn1Jd1KT2UJqcGAjx9A+6m07QB65s4uLzpTnStJHsylEbja68QW0O8u?=
 =?us-ascii?Q?COam8/MPtQqO9kpuoJgw1Nxf2XJVjZCHnM7dCSwMwfgbpjSz40+6QwP/E2SW?=
 =?us-ascii?Q?dQlbpGCMcW9ys37A6BI1G6E=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f2af957-8ce1-409f-e46e-08dddf67572f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR01MB6228.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 21:28:29.5438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lJpU0UMpQpaMSmBU/RjxhDgolPRD9jdhOTdKiZyFVE2MNXP6ev5cyhad0iMVQU1t36mHoHTMEoqHs+W1rtbeAI4b7haBGZmOiSVfc0C2Frrivl963CdNhJVfBE9t2xpv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR01MB7912
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_142838_343124_82840F61 
X-CRM114-Status: GOOD (  17.61  )
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



On Tue, 12 Aug 2025, Besar Wicaksono wrote:

> Distinguish NVIDIA devices by revision and variant bits
> in PMIIDR register in addition to product id.
>
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>

Looks good to me

Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>

> ---
> drivers/perf/arm_cspmu/nvidia_cspmu.c | 18 ++++++++----------
> 1 file changed, 8 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> index b6cec351a142..ac91dc46501d 100644
> --- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
> +++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> @@ -23,7 +23,7 @@
>
> #define NV_GENERIC_FILTER_ID_MASK    GENMASK_ULL(31, 0)
>
> -#define NV_PRODID_MASK               GENMASK(31, 0)
> +#define NV_PRODID_MASK	(PMIIDR_PRODUCTID | PMIIDR_VARIANT | PMIIDR_REVISION)
>
> #define NV_FORMAT_NAME_GENERIC	0
>
> @@ -220,7 +220,7 @@ struct nv_cspmu_match {
>
> static const struct nv_cspmu_match nv_cspmu_match[] = {
> 	{
> -	  .prodid = 0x103,
> +	  .prodid = 0x10300000,
> 	  .prodid_mask = NV_PRODID_MASK,
> 	  .filter_mask = NV_PCIE_FILTER_ID_MASK,
> 	  .filter_default_val = NV_PCIE_FILTER_ID_MASK,
> @@ -230,7 +230,7 @@ static const struct nv_cspmu_match nv_cspmu_match[] = {
> 	  .format_attr = pcie_pmu_format_attrs
> 	},
> 	{
> -	  .prodid = 0x104,
> +	  .prodid = 0x10400000,
> 	  .prodid_mask = NV_PRODID_MASK,
> 	  .filter_mask = NV_NVL_C2C_FILTER_ID_MASK,
> 	  .filter_default_val = NV_NVL_C2C_FILTER_ID_MASK,
> @@ -240,7 +240,7 @@ static const struct nv_cspmu_match nv_cspmu_match[] = {
> 	  .format_attr = nvlink_c2c_pmu_format_attrs
> 	},
> 	{
> -	  .prodid = 0x105,
> +	  .prodid = 0x10500000,
> 	  .prodid_mask = NV_PRODID_MASK,
> 	  .filter_mask = NV_NVL_C2C_FILTER_ID_MASK,
> 	  .filter_default_val = NV_NVL_C2C_FILTER_ID_MASK,
> @@ -250,7 +250,7 @@ static const struct nv_cspmu_match nv_cspmu_match[] = {
> 	  .format_attr = nvlink_c2c_pmu_format_attrs
> 	},
> 	{
> -	  .prodid = 0x106,
> +	  .prodid = 0x10600000,
> 	  .prodid_mask = NV_PRODID_MASK,
> 	  .filter_mask = NV_CNVL_FILTER_ID_MASK,
> 	  .filter_default_val = NV_CNVL_FILTER_ID_MASK,
> @@ -260,7 +260,7 @@ static const struct nv_cspmu_match nv_cspmu_match[] = {
> 	  .format_attr = cnvlink_pmu_format_attrs
> 	},
> 	{
> -	  .prodid = 0x2CF,
> +	  .prodid = 0x2CF00000,
> 	  .prodid_mask = NV_PRODID_MASK,
> 	  .filter_mask = 0x0,
> 	  .filter_default_val = 0x0,
> @@ -312,7 +312,6 @@ static char *nv_cspmu_format_name(const struct arm_cspmu *cspmu,
>
> static int nv_cspmu_init_ops(struct arm_cspmu *cspmu)
> {
> -	u32 prodid;
> 	struct nv_cspmu_ctx *ctx;
> 	struct device *dev = cspmu->dev;
> 	struct arm_cspmu_impl_ops *impl_ops = &cspmu->impl.ops;
> @@ -322,13 +321,12 @@ static int nv_cspmu_init_ops(struct arm_cspmu *cspmu)
> 	if (!ctx)
> 		return -ENOMEM;
>
> -	prodid = FIELD_GET(PMIIDR_PRODUCTID, cspmu->impl.pmiidr);
> -
> 	/* Find matching PMU. */
> 	for (; match->prodid; match++) {
> 		const u32 prodid_mask = match->prodid_mask;
>
> -		if ((match->prodid & prodid_mask) == (prodid & prodid_mask))
> +		if ((match->prodid & prodid_mask) ==
> +		    (cspmu->impl.pmiidr & prodid_mask))
> 			break;
> 	}
>
> -- 
> 2.47.0
>
>

