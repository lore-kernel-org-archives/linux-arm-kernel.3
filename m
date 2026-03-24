Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CEEFEC116
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 21:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EnBSK7v97b5CLLrPgOyZBfAhZjXIFld1Q7LJunoIU8s=; b=XBel0DRKFnWJZa+XROQh3LFr9J
	ocjQEtx29fYsarrw2tx5uWFi7YCCwLIq0V8jdz8ns/UsajsXiQvaZt3XMu9kvu9qDT0NKY8eBXuoZ
	jbI4Z4EFk4rbJdqCdaYJI4XvqKP6Wc+q8SrwGl2ElpbicoePduIgDvGIr4pIx0IGJzegJR9Ean+MN
	bnwqwRmOVs0FBK4xLaMqc+q+IlN4Zuc0QfzWjIeK6CXDEsjkWRwXs3cNh+NpP+I4JI44n9CVP2Aia
	+xYJgUJ+q/1fuDfABhXpvFCBuBCqq6g4Pi6DxzcmSmyvSPelJ+MALOzKBEMT8LhJAReiMtTz+Bc96
	ZBOlMtvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w58vo-00000002EV9-0C9A;
	Tue, 24 Mar 2026 21:04:56 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w58vm-00000002EUo-1SgR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 21:04:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bhm1ggTMED5jEjbnCAo/LFzREnMRU9rSqyNqJuVYaaU+C3fhE1fRPE5E0kABrcNlOYQk7eX5CZiTarlj3V3bWmcc8XMz7a5UMbAnPQfBQXhmehlQ7GKghm+38flmmljHrjC9DpvCmuce2oOwcUgLAaChOYY3XFFdZmH1tICWmDQeHJDy0yLlWlzc/cr+6isOCodIb7O9wmrKoxzJgo642ki0yvBZ6YCoc+39Jk7wConvi13bkBpSzb0+x6g5HxB8KIZiAmDJCwJ/y2QG+GmPe0rZsxjzgw7m/5Q8sJUPECn+7yDbJqugx+9aaKOvTosQYqghQP3/GR4Qi+56eCnk8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EnBSK7v97b5CLLrPgOyZBfAhZjXIFld1Q7LJunoIU8s=;
 b=tMKzeGxhT8tdpZvIyIV//BXv4afc4Xe55+c7gel/7wduKQXepIuDy3l3IEC25q2VVATKAmBzbkYezCmsRVdhoat17+A/ClUf1ccPd1I+zFRJFmfPpT1o/2sarNBkPXh26GqFJWAaFD0pjqRzzfosLz6FEx6jTUk4aBihLJ26gInPCs7QxmIiYkPHfJq7tUDs9yGcOGWlEvtJueT6lrNz5EA407b6GD422L4uMX1cIcdM9An+UZo8w5WjgjWBjPTsJRxyK0MnRUdzAEsAk0/l9xSIoDBmVcXInJqkNJy97K5u/kD2etqpQ822mgvR5M1YQqz+W/ks6ELhd/taBz6e+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EnBSK7v97b5CLLrPgOyZBfAhZjXIFld1Q7LJunoIU8s=;
 b=YL/N6p6wWKxbIftX08QnCglYrw1RQLn/RAayREM7nebL61q06TDi8KyiCA+0O7NA4Sewe4Rcb2QLUxb6XI5tPx8W5pDhKyHTh9lbIogI11yfnq/727INT3PJKwULIGgRVDSEqwjI7POUzIzw1vAFr4tXh541/FrKW+8aqaxnZ0jql7b2KiakfeM9SQk3/vr0UlVbOJv0cwZpfubHWFrCqLgslqOJEGmTHZFAkuT8QUmJuKJUX3WiPEy35Nzt+jO7ckOsup+pifh/oTnvCf1loDtrCdfZt2tD2eTXevzXBM7ryIhS+rw2VPNBfNyxQoVjHB58/V2Gu7cJGJU9ffnW8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by CY8PR12MB7241.namprd12.prod.outlook.com (2603:10b6:930:5a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 21:04:45 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 21:04:45 +0000
Message-ID: <0debe6f9-581c-4093-ae4a-9025bf1a7760@nvidia.com>
Date: Tue, 24 Mar 2026 21:04:37 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] i2c: tegra: Replace dev_err() with dev_err_probe()
 in probe function
To: Atharv Dubey <atharvd440@gmail.com>, Till Harbaum <till@harbaum.org>,
 Andi Shyti <andi.shyti@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>,
 Dmitry Osipenko <digetx@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Jean Delvare <jdelvare@suse.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 Enrico Zanda <e.zanda1@gmail.com>
References: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
 <20260324-deverr-v1-2-7e591cce33a3@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260324-deverr-v1-2-7e591cce33a3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0483.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:3dc::17) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|CY8PR12MB7241:EE_
X-MS-Office365-Filtering-Correlation-Id: 09dd5e14-14ed-435a-87dc-08de89e8f9e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|7416014|921020|7053199007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: dCrRxOp1CMBX0KRuk/p+QxXqheZAL2wfrUNtxGG9J9c3VIR0CzDRPvKH2d9XECheJaMM4iAHvOwlyV6q2dSdM1iDclqAgCQW6wa74P1IlxHcborT703UfwoUVfLIE5I4YbEYe9Wdt7lHIPv+CzLMQLdiKZ50l+ZnL+gyCKLoeVdZ+csBLu7UyUyaJcz0Vyoda4tzjvdJ2tfGaVipKOkNEvsh7OPV8+BfuWn7KzoBbXxX4wHs8wvT8sc815szHHjN2EByEhhcEovr6QQyrapZn6VjmVTi2ds0aG+KsI487F573a+g86hhGKn/AtSWfcbWZL5kQOZOSM2ICokpkJ6I/GQmzRux2ASQub5wsDy2dYbN3YSkrPkfelxAUytkUTp+ROYxlQ85oWMRd0T52pcBVvjhvYDVaDxZijHacIFBc10+yx0H5SO0AdBJYYsuZkuHgryppDXuRjdCjdtCXesTWsdfb8bmuGcWU4UVKGRuKvj533MSAsp36mQpnaC0dMIw3b2EsBIKiS77rqOpdjCurv/+aDmiQnw/PKvS9vkrlFle/0O2BcjNX7dsyFRNJZLyNvoG/dtLWUDo43FnCssoBjZjH5QUOfgglDHJ9QWIO+9bx9lfeSBlb9dvgfrpLES0hfd5e9+RWbM7rG0Ba/ND7v7jgJbbTk7qcZua/adAFzF3TqEUc0sta/PgSFX5iecySJhjXFDHT1rb95nDNKAQDIpJqRcfVj+x+JnS6H9S8e0m5P2d07MyyqYBRlV91kTQQS1+j2undXX1T3f0tSkXdA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(921020)(7053199007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDRTZkh2UWM2UFlHbkpnN1B4L2k4UVBmMk9lRHN5Zy8wWGdwRWVpbnYxNGta?=
 =?utf-8?B?Z084azlWVDF3Sy9mN2p0ekhFVmNDaEhxSy9jU29ySEZiVHVmaVlHUDJqaFR4?=
 =?utf-8?B?WWdPcWZyY1YwQkJaUWk4NFdlbnNCdTFmUFNXeitOQ3hQNUVNcG14Mit0V09I?=
 =?utf-8?B?RFZqTnVVak16UHlxYUovT1BSK2pJaXNwV3Z6Rzg5b1lYV0FWWWdIV1hrRytr?=
 =?utf-8?B?VmgvTUhFWUhDODJuSE9kWTNJVmRZWFNTUDJLT2ZodC9BUHdEYVNQOE1PT3NY?=
 =?utf-8?B?K3F1a3VFMVkzeWZ6aStzOUFXVllyK0pKdDYvWXlkc3Q1dUVOSE5VZGZ5QUZY?=
 =?utf-8?B?VVBtRVlSdmZVcFBHSG9mZTRVVis0UjdsRnAvcFUyM25qazhLVlVROWV5OEoz?=
 =?utf-8?B?eU5kR256d3pjVGNabGplZWZMT1RVUjZCWGVTUElKdktLT3k1RFlXVlZQZ2Vm?=
 =?utf-8?B?bittOEx2anJnNVo2aGhwVmthU0FKSUxESXByd2xoL3hLNTZOQVJsaFZHSVVu?=
 =?utf-8?B?NllEVndaL280WnYwbEYvMFY3KytvUHVYVWhHYlQvU1dUb1R1ZDNVSEZES095?=
 =?utf-8?B?SW5PejQwZ0lNckVVOVVpOHZqU2lDNEdvU3Q5RWtiOGY2UGtHM29yektzSllh?=
 =?utf-8?B?R2Z0V1ZtZy95SEI1WGU3eFJ2d1IwVW9QRnV3eDRndkFoY0QyRE1NMFBWUDk2?=
 =?utf-8?B?MWxVV1E2ZzBRNVpDZzRiZmh1NUZYSE9GSVdyQ200WlpZYktiUmdzMUxYaE5O?=
 =?utf-8?B?d3BUcGdacVFUR0tmT1ZTTkU5eUFBSURYd0loaEJYMTNTNklhaW5QVUZMSXpJ?=
 =?utf-8?B?ZXF5N0s1Y0VkNkJKK2hpQ091Z0loUGZSQzE4cVZnMHpXMFRvUU44YzFFMjha?=
 =?utf-8?B?S2daeWx6YW9lQTd1ZU12QzY3ZjlaZkU0bm85Yy9vYlZFQW9nVkxjN3J4MDFz?=
 =?utf-8?B?cXlmeUM4dnBicXNCSmFjK0dmTWRQOHBDa2tzU3lNSWRCQzQ1OHh2S0pmenRY?=
 =?utf-8?B?dGlGNzZPREJxWklhQ1JCaU9VOXRycHBwbFlsNDJpTDJIZFNkZGRSQ1orQ1Bi?=
 =?utf-8?B?SGc0ZGhBWjVxQWRIZ0szb0xvV1lJYkozSjNHSjZRaEtJNndoNVd3SmFnS01X?=
 =?utf-8?B?aDREMkJlUFh2VlIzWDJsL0FZS1JBcnpESnpvc2lzMkYrbVovUU51WDRWQUEy?=
 =?utf-8?B?LzQ2TXpkbzdWQ3crbGg2UC81K29xampvZWZiVlN6TjZydmlUY2xSeHhjZjlT?=
 =?utf-8?B?cEdPRDNrY1gvQzAxZ3hrRTdQR21TTWdQNHRjaGlHam42WmJhemkzUHplTFdl?=
 =?utf-8?B?am4zRnRDRHM4N1JMZzhzMnBPTXNpcHJ0OHFwcDlGa0ZHODVkQ3JKWjZBRzVm?=
 =?utf-8?B?VW94Wnl0djB0M2NZa3JmbS9BemttZ3B3K0t5VEJXVEFRU1F1RFhRUStJMFRq?=
 =?utf-8?B?N3dCUzkybjlKUWtEVU9YcXZicmowbFdxMnZVWWRUUkVEY2hzSzNKSlZjSUov?=
 =?utf-8?B?dmUvbjJpcFZlbjNxVHJXVWMwRVdZb2I4dHNMb2ZqK1VNdXZic2xMWHgyZjha?=
 =?utf-8?B?RWJHcWlHWmR0eUVkcmloUzRZdnZ1aGtnWDgzMjBhTlBwL2NGSHlRL2JNUjNy?=
 =?utf-8?B?aWtyRW5jM2s4MEdEWmozUnlrSFg5WWhQREp5Qk9wSjBUekduc0NWcHVBQ3FY?=
 =?utf-8?B?RzVFTVNJVENzM2dKNlNoT3dEeUpHSW13d0VETFRlZ2tPZENpVlhHTXpBYTZk?=
 =?utf-8?B?ZS9hUEJRbU1aaFpMV2d5S205OXRSd3FaQTR1L3RPZ1B0MWZ5bVYyVUpVOTh1?=
 =?utf-8?B?V0xKeWdod1lJNXBXNU80UHVzN080VnZzWk1lZTVycGcrQndWTG5wSGpMVGdp?=
 =?utf-8?B?UWpKT2R0Qkk1WFlyekJmQlJKQUxCTTlNVzVPc3hBMkxmRXRPWlVWMzFQL1Vh?=
 =?utf-8?B?QW1XTTNCT3JVZ2FiR2JRT0p2d2hJcDhjVTN4WUFTM25iYmh3Qjk0c0VwbUY0?=
 =?utf-8?B?bHozOHFSVVRuTzMyVGlwc1RyaFJKNmI0MFlVbU9vS2RjOWt5UTBkS1BjUjlr?=
 =?utf-8?B?UzVWMkp1VU9GaDdTVWFmaGpRN2p4UUlnaENNcGc1TldRMGhjaDBBdlgvRitM?=
 =?utf-8?B?dGwzSkorS0YycHRQaWxXRWExOW83RkZEUUNkZVY3MWlTeTFYSndKbkY1Z29J?=
 =?utf-8?B?U0R5QmZLRFFoZWcwQTcyK0xENGFDaGVXa2VUaDVCVTZwWnloT1RkbllqamNo?=
 =?utf-8?B?emhEdFNXSGRzWlJWa0w2c2tyc1daaVZWTGkxdmFtaVJRVmc0eGYxcjl3ZTMr?=
 =?utf-8?B?ajVUbktCdXVqYVJDdXhYb1VFV3dXVm1pWDBZNm96SG56c05wdHRKeWx6MjQ2?=
 =?utf-8?Q?T7ge7fgnTXjAkskx24hkx8Cb0QYis+LDI2Jr/oiN+kSeI?=
X-MS-Exchange-AntiSpam-MessageData-1: 2sXMbZGQWzeN8g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09dd5e14-14ed-435a-87dc-08de89e8f9e8
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 21:04:45.3532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yEhHCc9WDWTwX+Hr1PygNKIaYtDq60un0uUrZTKmP/+kVZfyyLVpqG/PRg8temI/BdJsCUyY85UiP8Tt0RsR0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7241
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_140454_409545_F3F16939 
X-CRM114-Status: GOOD (  17.00  )
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



On 24/03/2026 18:26, Atharv Dubey wrote:
> From: Enrico Zanda <e.zanda1@gmail.com>
> 
> This simplifies the code while improving log.
> 
> Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
> Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
> ---
>   drivers/i2c/busses/i2c-tegra.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index bec619b9af4e..51d15fca82fc 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -575,8 +575,8 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
>   	dma_buf = dma_alloc_coherent(i2c_dev->dma_dev, i2c_dev->dma_buf_size,
>   				     &dma_phys, GFP_KERNEL | __GFP_NOWARN);
>   	if (!dma_buf) {
> -		dev_err(i2c_dev->dev, "failed to allocate DMA buffer\n");
> -		err = -ENOMEM;
> +		err = dev_err_probe(i2c_dev->dev, -ENOMEM,
> +				    "failed to allocate DMA buffer\n");

So this will never be a probe defer, so why bother?

>   		goto err_out;
>   	}
>   
> @@ -588,8 +588,8 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
>   err_out:
>   	tegra_i2c_release_dma(i2c_dev);
>   	if (err != -EPROBE_DEFER) {
> -		dev_err(i2c_dev->dev, "cannot use DMA: %d\n", err);
> -		dev_err(i2c_dev->dev, "falling back to PIO\n");
> +		dev_err_probe(i2c_dev->dev, err,
> +			      "cannot use DMA, falling back to PIO\n");

This is not right.

>   		return 0;
>   	}
>   
> @@ -1953,7 +1953,7 @@ static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
>   
>   	err = clk_enable(i2c_dev->div_clk);
>   	if (err) {
> -		dev_err(i2c_dev->dev, "failed to enable div-clk: %d\n", err);
> +		dev_err_probe(i2c_dev->dev, err, "failed to enable div-clk\n");

We have already got the clock and so I don't think that this is needed 
either.

>   		goto unprepare_clocks;
>   	}
>   
> @@ -1979,7 +1979,7 @@ static int tegra_i2c_init_hardware(struct tegra_i2c_dev *i2c_dev)
>   
>   	ret = pm_runtime_get_sync(i2c_dev->dev);
>   	if (ret < 0)
> -		dev_err(i2c_dev->dev, "runtime resume failed: %d\n", ret);
> +		dev_err_probe(i2c_dev->dev, ret, "runtime resume failed\n");

I don't think that this is needed either.

>   	else
>   		ret = tegra_i2c_init(i2c_dev);
>   
> 

-- 
nvpublic


