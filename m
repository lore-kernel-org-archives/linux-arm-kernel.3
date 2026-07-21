Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C58C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 05:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gi72kHzL/Ak+nO6IZ+2v8iPbxcuTNuASehZ0f5RHzzU=; b=GAhsF/EVRRS7vK+G9GwqMjpQDJ
	Ey6kkoGFYqmc3ADZgNkVgS0+C2jFbyHxMj8kgSEBMVZMeZIBDAlTCBxowhQy4ju81bAoOjztUiduS
	KLLOBp1J8yN89xqQEhIvfW7DFlPADAU90GokNqUtDFSzUC/rwoo/1UKUtqg1fq46XoYDLW8hd0qIA
	S92Gsh1DFS3hPpB4w0EeI0ZowDuOsjEsW6a6twrQezQpNbSSvgxpwMGiUhXMwsJJRq2FAxALQkmnk
	a2OT8376gWTa4ypOU4ChPA5uL0SY+A6uuRhVjRjeOdMSL6lRv89BoNJ172IErWuuSWyZ8nnJeaoaF
	mfZx+H1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm3Cj-00000008T3v-1DDs;
	Tue, 21 Jul 2026 05:39:45 +0000
Received: from mail-westus2azon11012051.outbound.protection.outlook.com ([52.101.48.51] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm3Cg-00000008T3E-3keE;
	Tue, 21 Jul 2026 05:39:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q7jbvEF+0+Kki5Ax7aOqenWcx7JWxgKqbKItvV8xTEyhr9yGXgs5j0PRL9r3Jb8+hQ4aXBOW7I8ewQUDG7D18mOuQ8hkxT440aXiLkWbZES89CW5JM0GGeuJfxYYZX9yMDrBvPzJmEPn/9KE8bY9qBAdKDv4rFj1H9USe0ZXG59OwODzH9b2HfLvNVdNrcAOrvXUVZDjVpAum09ZwJx9Zc4bOxGzIq06AQ8SIlT/QNX8J44ODNdZD6KKVAWxGMY1Esoeq/lmooey8dwF/4TtiqgcXXdd/w5uVqtpG+rAgRT6ibvbJS0Qgm5d3mUbJVVhgNBy6B/u2sWz7bWw/Sj7ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gi72kHzL/Ak+nO6IZ+2v8iPbxcuTNuASehZ0f5RHzzU=;
 b=E/cpTMZoqQPq8f7YRrEnfoUdP+JfedmYbuSYpHayivlrodAepm6GtIEIwitolsEbAkwmo+TTbaU0rrZAr+MuqMeMK5n8PEtlRIpty00NZdskGVvr1KqVn4/jEnJ9ZtgFXZrz/3RmBvYJ6W20pPrL5OSugkcr3noVbwBziELxwXjB3cLwOpx0oeVNhb1S4ZPPUCZyjwatTpnKf/bjDkLn0+2jL0oTFTtRw7LadsHwaWp5Xj1oC216xaTb4WgEp7ctxVCzbsMxL8Ky0Y0W/Rbe94pczRMIZ6fAjQiaX8owJsb2UXGg6Ba3oVtEKuBZbVdKGtjn9ksY3Eb+ENOMhnSM4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gi72kHzL/Ak+nO6IZ+2v8iPbxcuTNuASehZ0f5RHzzU=;
 b=eEYzRuBnVmEJ5oDPEAbKj/7FCL4Wbw0Qt+kJc0hSPSBUQVedpKRnSU/V7qNaCjqfLXuUiOT5J66UTTfW4KUitM+Af2mporhTjolu60mx9d4cI0nqkXSvrpMDcJjd6unO6Cttb2omJXX3jZRqLifWmV9tnJN608d5EX5+fdcYb/8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by DS2PR12MB9637.namprd12.prod.outlook.com (2603:10b6:8:27b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Tue, 21 Jul
 2026 05:39:34 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 05:39:34 +0000
Message-ID: <7b9c645f-145c-4703-b8ed-13f5303e2a4e@amd.com>
Date: Tue, 21 Jul 2026 07:39:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: zynqmp: fix runtime PM leak on probe allocation
 failure
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 tomi.valkeinen@ideasonboard.com, vkoul@kernel.org, neil.armstrong@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, git@amd.com
References: <20260720153832.1130006-1-radhey.shyam.pandey@amd.com>
 <20260720153832.1130006-3-radhey.shyam.pandey@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260720153832.1130006-3-radhey.shyam.pandey@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7P222CA0028.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::11) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|DS2PR12MB9637:EE_
X-MS-Office365-Filtering-Correlation-Id: a43b2f0f-32c3-477e-7e89-08dee6ea71c1
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|56012099006|10067099003|18002099003|11063799006|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: lLZT1Dma+MWGrS2IT0p/Z7C46iuan96xLgNCTBwMiRez8T2uzaOINPFCLnMPqlGkTAv1sW9QE1us6X6uL5tp6tJcVbuUrxesFoGVydhpmG25dea+f0ZVJYjS62n7DwEoldzokpEHTfCEshaI4E0FaOnC7ce4Ns3MFDh5tNdxn9mz0Pu7J6CcGzI46Le+gEOBVn5+5mVwMyEMv+zQq8aiyBZNuyqIZVZTmCyp2w55oXawMmX9DovIOFwpTljGcbEEXr8+lwOSYgxNd+TCaXJQ7nxh0uCK4lqfoBzj4n8hNWs33mjck6dxf1SUvkzsDagzq9i5E5M5595FvtJug6Og+3zHFFZI2i8DjXVPJHe6kMvBIgpVh1S0Yl2pGoUmvWvQSKUsY/Ox7x6IrxdDybY7YPcIusVTuZQ9O0nFzpH1k3dAtzKRxHjISHlqmDolVMZEK5IAdW/UCx64fGdTYJfeJCv/A3VzRvN46qQMxB0frpyoacKtR1JmolclJ38z9au2dsZzQGoRW855mPhJwvV5edBfrCpElS6kuRSMvEgtaEL5amUp37Oomow+26kRzyu+Ziz+28VqXSvb4UAOhmEAckrxln9bBuAwcuhCXHUcuofJh7vEueLZq2JpyBVh5VcXZbJhv8THK5K5uOyRZ8ABcqPOWxj3jEPsjbgfDJCnfbc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(10067099003)(18002099003)(11063799006)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDZYNE9aTGJJY21kSFQxWHVYczNzd0RkaXJQL1lYbGZYZkRSc0ZNWVc2RGxp?=
 =?utf-8?B?czQxVktSVnZSSnhpRklWLzZaYW1tSXpIQ3pkaHBybXVFZGhPbTBXL1o1Q0k0?=
 =?utf-8?B?TXN4Zi8zRGc2a2tPc09YdG1WUWRnTGM3MWxMS3pqeHpkWk53NnRFbUZnb0tl?=
 =?utf-8?B?eDk0T2F6Zm1hZysvU1FVTXNlU0ZFL3ZyWTRSazdaVnJRbG5lUFdRWFcyVm8x?=
 =?utf-8?B?OVNvYnc5VENTdWM2RzVBK3pGTkR2alF0MjhSZnMrMjVCNnd4akM1b1owTHR6?=
 =?utf-8?B?TGpDSi9uajdHS3pHT1dBR0xNYWFqdndHT1hYTXUxT0NBYTdiZXo2dC9OOFBn?=
 =?utf-8?B?VHI1RUxYZk5IS2szNHNjanpsdVhIQ2U2ejZITUNpNC9uK2lTVDNybWQwaHhi?=
 =?utf-8?B?dEhDVldrWUt2SkZzMHUxZk4vTHJmc1hpZU9kMUtiWVdEMjVqS3lTUUErMk1p?=
 =?utf-8?B?QXBZV1E4VTFTZXhnZDBpeDFJNFA1Tll0N2twUWtycHRQUGJHaG1US0F0TVVh?=
 =?utf-8?B?SllaSWhWN3Vnc0ZuQ3VIaTVnZTdvWngxZjJGYThjOEMyZkFvcElmcEp6OHdC?=
 =?utf-8?B?MHZESWVsL2o0R0lUb1NrOXR6R2dzRVBES0Z5Q3NUbVBCcEV4Q083RVAraVFr?=
 =?utf-8?B?bUh0M3ZxMm1Rc1lkMnRZQlczNDhoYnRwVnpBcnBXUEtlMjd0WnNPNS9zNkd6?=
 =?utf-8?B?ODJVU3RuU0dETzd4bFBSSEpxOWQ1cnZiQzdBdTZURW9IeDRNaWFHRjIzVGpJ?=
 =?utf-8?B?Qk1tSnYyakNLaXNmU05tWllocENRczgwZnpxeklMR3pVOEhTTUhXdG5rNk1W?=
 =?utf-8?B?YitzNmhjSkp6M1FhcVpFeDJQWTlyb2RneGFrTGFpeVNSY1hFSjc0ZUtvZEF5?=
 =?utf-8?B?Y24wMHBTRm9pNUkzWmo5TDh4MW1sL2svN3VtYlJPUXVZVUpKRnQybzU3Vmdj?=
 =?utf-8?B?cmdOM1dlYmpmcHJ1MXl5NGRFN29YcDUwbDd0NlhiUEJwbUQ4cGNsbmxUT2JY?=
 =?utf-8?B?UDYxaGZhQWp5djcwU2JSbFJLZ3lsRytRZWtuaEd1N0M0eloyVnlqaGNBUHpI?=
 =?utf-8?B?d3JMT0lDYmNPdXBIZU4wdTBpQ0QxZWNkZzVBdjJXVWswU2NUYkxsWlUxWHdj?=
 =?utf-8?B?VWVYYUxPRnl6VDBhRlZiSm9sRzVaNnlhZGRSS296a1JOakliUDRJMjRLRU92?=
 =?utf-8?B?WENzWWFYK005cnpOV3VvVzRXcENUNHIyb21oN3FDaGNMYTR5MExKcWZsTFJ1?=
 =?utf-8?B?RHhndDZzZ2FCYkd0MlBZdW9ZOCtDOW5BRVFYamQwWHJpZDMvZ2ZrQUkwTG4v?=
 =?utf-8?B?b2RaS1krMzFTNUl5c1FZUjlScEpjZ1VlSW9FdHpaRjJoYlpJQlVUTFY2SXB6?=
 =?utf-8?B?UUg0RDc2VDFQakdwU1lCUFVGUzJPcW14NGErcUdXNlVtNlBQa0VPdFFPU2tk?=
 =?utf-8?B?N2R6RnorbXUrVWppZm9YSEJWVU95QWhCa09TbXo0ajFrWmVOdlNKS1VuL00v?=
 =?utf-8?B?RkJDZC93UlBwMGdBZXk0QllsZStZNHRXMjBmOC93Wml1MnJFamF3c0hoL2Vj?=
 =?utf-8?B?UEN2RExwenRkWGh1MkRXSFBrYm8xOWx1ME5YVFNSY0hTOCtNb1JZRUZWdVNp?=
 =?utf-8?B?LzZTTm0xM1RQTTJwYm5XN21LbHFWRkduWlFCU2o5NytZalZmamYxT2RxWmZU?=
 =?utf-8?B?K1ZQbUdLcWtqMG05dXllb3pIOFF3MzVIQnNCUVUrNGhSRGx3NlNGVGN6ZmRK?=
 =?utf-8?B?UWxBYVpmVERFSm94cjQ4Mm5ibTRabFRvbXcrRnVzbDZQQ1h0ejNRNFVicVpz?=
 =?utf-8?B?Yk5LUmxUc2dOdUt2N0hyTFA4RzcwRVVQUDIyRW5iYTExdG4ySXkxcEpnUzht?=
 =?utf-8?B?NExQZDVxNWNpOWExRkIrSXp6c2xjVk94b00vcDVvT21UVEptV1NESDdQMXUw?=
 =?utf-8?B?S0YxWGZ0RTlkTVZVc2hpb2pUWGVLYno0bllZR2JId213aE84a1dSUU1vTjFM?=
 =?utf-8?B?Nm92a1RnN1Z2R1JTQmkyM25RekJhcGVnbHdmbjllTW5kTGowVEFoK2VpeDZH?=
 =?utf-8?B?dW9td0RmdDlFaVIxUDZaU29nMnlVbVpoRC8rYXZTQ2lVQTFUa3NSQm5kaWpw?=
 =?utf-8?B?NmhUeWJlRkFtekEyaDIxTitaQktlQmdTVU8zZG1WMmMza1RXUS9ONjhXYTNQ?=
 =?utf-8?B?Mko4S2dRNHkreWsyWDllMnhMdHZrRER5bU1jYTNIKzhFbjdlYklTVGJIVWI0?=
 =?utf-8?B?WDR5K3FIeXkvRks0OHVQU0gzRXJ3U3JKUWlleW40em41L0VDdlhWMThtYlo1?=
 =?utf-8?B?a3NyZXVldUNYYi9tWnNBZ1dEVlZ6TFpsTjBlaU1KOVRxd1lnQ3B1Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a43b2f0f-32c3-477e-7e89-08dee6ea71c1
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 05:39:33.9529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /bu6GYkcjkcTioYxfuS/O0drLSClBWXfbe8F8Ep8LE43tzLNm4nZreCtrCwJO5qZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9637
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_223942_940465_E1CA47DE 
X-CRM114-Status: GOOD (  14.59  )
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



On 7/20/26 17:38, Radhey Shyam Pandey wrote:
> Allocate saved_regs before pm_runtime_resume_and_get() so a
> devm_kmalloc() failure does not leave an unreleased runtime PM usage
> counter.
> 
> Fixes: 5af9b304bc60 ("phy: xilinx: phy-zynqmp: Fix SGMII linkup failure on resume")
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
>   drivers/phy/xilinx/phy-zynqmp.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/phy/xilinx/phy-zynqmp.c b/drivers/phy/xilinx/phy-zynqmp.c
> index c8230f2bda62..2138f5399821 100644
> --- a/drivers/phy/xilinx/phy-zynqmp.c
> +++ b/drivers/phy/xilinx/phy-zynqmp.c
> @@ -1044,6 +1044,12 @@ static int xpsgtr_probe(struct platform_device *pdev)
>   		return PTR_ERR(provider);
>   	}
>   
> +	gtr_dev->saved_regs = devm_kmalloc(gtr_dev->dev,
> +					   sizeof(save_reg_address),
> +					   GFP_KERNEL);
> +	if (!gtr_dev->saved_regs)
> +		return -ENOMEM;
> +
>   	pm_runtime_set_active(gtr_dev->dev);
>   	pm_runtime_enable(gtr_dev->dev);
>   
> @@ -1053,12 +1059,6 @@ static int xpsgtr_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> -	gtr_dev->saved_regs = devm_kmalloc(gtr_dev->dev,
> -					   sizeof(save_reg_address),
> -					   GFP_KERNEL);
> -	if (!gtr_dev->saved_regs)
> -		return -ENOMEM;
> -
>   	return 0;
>   }
>   

Reviewed-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal

