Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2147EC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 11:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lai4C/NPGAyRDDCHzTxWhw2AAButiixADYy5f3n/rqg=; b=1TLa3ZhwnO46RuxuygPF+mLdbc
	rrmTXx6FCHlkyvOxk1be/wjj31qIjqJnpNP02Uy2OzX+uCCp2eMLKOV8I+/GSEmk0Xw6hLkJhco/e
	OErWFHGNwIHwV2M34c/j2evHKO+ehF0zzAjfbeSC6AscbtLxgs2foPr9b+g5q79nZZmcSvk5EDw6i
	PZ32M2uu6CkEQ4qHnAcdmJKa34gE/LKws3hFdZSaytjoI5LrEGLqUgUD5alvaGuuM1iSMEV0cwpgW
	UvYm7q1qLPKsUsyvO8NpkYYrEgWkotf42AfWpQpOLBFBLB8y8H7yQcEuB1aFH1ODaucLs0fRa1LWr
	40WvyEwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsILc-00000007nru-1tSK;
	Fri, 07 Aug 2026 11:02:44 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsILY-00000007nq5-3FEM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 11:02:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NDfkHWrUg8n/wgZPfgSFShwGFJco7bIzuGE1Cv/86xZ7zso3+gfTy2q8nzTohDVsEvl95eyASVOUgi1HDnxoLGXSL9z54K8/EUd2CLpfIAwfMYGdOheLffqcSXhszYBkoNxML6gg8LsNDKqnVu0Gk8qc4qKYBBS560RrgcEQ3bvk0rIpBTX5EkVH4g8vO3DyGi5gTCoZjYIOVnbCrknR1BQrG/9IPBjqdRM6fnz04dGeCjOP3ayE7gTWDMmw/yqGICQ3DFbH00SIUdpgDYPQWzPBqN5koCg9OJRsICkh3cyrgYG0ZeC1XRllzOFdiEpYdPT2CXA6hL69HXPt4Zgs6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lai4C/NPGAyRDDCHzTxWhw2AAButiixADYy5f3n/rqg=;
 b=MReLY1qXMqdAoCQaxfMf4Rv7fQNDyijizdyHOiRvz6rwABssGQgDTfCAixPmhfAC1WJ5AW7QdEaEQArEqfkHSXpR/rxv4PAkPfOYdm5+9rxYLsINkNZxsljozDCVK4GVPA9u8tA9fWurSIPIiCrgbNt0awAIO696J5VPUUBt4G43YzE2BKO4vMbESUDiJTWKYWcwe7d8eqrTOo5/oSjPkAiV7HCokEQ8ncUuwr4+aMoOWnPpSN/Tlr1Y/XpBDfA2FTcd59Zf1CGCLtV1mLkOc/cfGoV/Gn+bQFOngsiFCIfm9V8ZuRA2iUmesHeqiZ9sg4BvWQia0L5zzGPCJzDQPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lai4C/NPGAyRDDCHzTxWhw2AAButiixADYy5f3n/rqg=;
 b=xy5cCTv5rqc2MBw/VW7zSqy9WMIU5XQWgURRvMycPLT1nJdfOZ0lIO6/vCg3eIFvf/9FoQfg0QqzG47oQNBUOSIn6FavdSKKFadciIKl+YRI2y0XFcGLqeSOgwrrbM/lmC6U2Zl/8er1yCBsIIyNGZkiCiyiNjpMSpDsIgX3mvs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS4PR12MB999075.namprd12.prod.outlook.com (2603:10b6:8:2fc::20)
 by MN0PR12MB5787.namprd12.prod.outlook.com (2603:10b6:208:376::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Fri, 7 Aug
 2026 11:02:31 +0000
Received: from DS4PR12MB999075.namprd12.prod.outlook.com
 ([fe80::4c9d:851d:3f44:800f]) by DS4PR12MB999075.namprd12.prod.outlook.com
 ([fe80::4c9d:851d:3f44:800f%6]) with mapi id 15.21.0292.019; Fri, 7 Aug 2026
 11:02:30 +0000
Message-ID: <14677ed1-2586-4d65-a078-986084b40c2a@amd.com>
Date: Fri, 7 Aug 2026 16:32:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] dmaengine: zynqmp_dma: Reject zero-length memcpy
 transfers
To: Frank Li <Frank.li@oss.nxp.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, michal.simek@amd.com,
 robh@kernel.org, krzk+dt@kernel.org, radhey.shyam.pandey@amd.com,
 kees@kernel.org, sakari.ailus@linux.intel.com, yukuai3@huawei.com,
 git@amd.com, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260806123014.2120447-1-nagendra.golla@amd.com>
 <20260806123014.2120447-6-nagendra.golla@amd.com>
 <anSuuPHDh2lcAhBL@SMW015318>
Content-Language: en-US
From: "Golla, Nagendra" <Nagendra.Golla@amd.com>
In-Reply-To: <anSuuPHDh2lcAhBL@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0137.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::13) To DS4PR12MB999075.namprd12.prod.outlook.com
 (2603:10b6:8:2fc::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PR12MB999075:EE_|MN0PR12MB5787:EE_
X-MS-Office365-Filtering-Correlation-Id: a6ff90b2-b5f6-4849-de98-08def4736038
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|22082099003|18002099003|56012099006|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: UT1COtTuRSfeRZAzVcEgwtdI+YMdhKE0YIjN/EmRkPs2DU4WmXKtkNJw2hg0a+SqQYGUK0od/GK2vqT727FxYy7+En0KOYMBS50mzwRI30dtN19rWA3MIneE+g9hGVJgUxCPd+qlKANj/sv8+qRHGoPSpC9Rdtc3Q2OQq3tk5bLm6p7eyfvxwQZLg4hWEQf/M+1v92yNCsCKKEY5ur9C0/YW1q8l4Vcph4BlcQRcDnN3sppOVeCbse1ASOV8ZQsORRfJcx7qBYeaxT6Rp5Z5VRnwU0jPORzvoFB8jp88zdyVFEYGq7F5JjnY9s3Dcgc+ByyoH2mKwt7l4dB23kpBCPOJXYwP7yNqIWDiwlwZVPxXS1tbkBkEOFpQzsSbBStBFWS10T6Xg/oxWfz5dRIG5uFYXMB9WRiiXaaeOJBSHpTasmoMlEeCak0SbsNB0Mk0YTWCCRO2/MIgCRYyBb/yAjM+XycOHp1Zx0CCGi/5cEm5wcL4JMAIFy35EQu06aOjmW5EbIvC/CEytDZ7QzXoFg9k9WmDpxKrUHussvdkRyXTKc2j+G4X2pjzMLJFK/5Slidl7Y7yxx4rgHKyK+0XwzgnJMjgJYgxnOtm8Mk3JtS7+XVlsfpYMbuM1Kd+wF8y72kUotoDlzcZoJQlAGilkX1AREstasKi47kW2vEaAEE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PR12MB999075.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZThRZ3cyRXB1dU53OTh3bFBjU3U5Sm53ZkpRaEhUWmN6NU5aRldSVzZETDBo?=
 =?utf-8?B?NkFpWkJORmp2YVhnZU81cU9rM05wQkFTeUZIbUJLSVVTL1FITzJYK25OMDlE?=
 =?utf-8?B?dy9ENnZBS284SXVtTGM4WGgvWFJyL2x4STRVSDVMN2U5emVUOU5JZkFYM1ZT?=
 =?utf-8?B?OThaNnVJRk5Xekw1VlFDWUQzK3hGeGJLeStRUHNTSmxnVmRsOXcwMnlZckZB?=
 =?utf-8?B?S0EwVVNabFVnUDN4VXAyNEpHMkY0cVNDdU1BYVc0ajc1a0sxbDVSRzlTKzVG?=
 =?utf-8?B?Z2lSbmdlOGRlcFQ1a3pPQXRMa2gyRDlCbStldTNna3RXMm9hWkFoRDNnTWhl?=
 =?utf-8?B?L3VkSTB3OG5FODJkRWJKSDhjY1pxUXB1Z1h1ZkdndFRaYUFmWFl2aEdLcllj?=
 =?utf-8?B?bjFYOWx0LzN3S1JQVHlGc1ltakh6akVjMW1rcW5EejVYUTcwL3dZbmlpTjcx?=
 =?utf-8?B?azJkU3g5cElYdzVmTmQvZXlCQ0Qreks5Q0V5V3BjREJsY1JtNDd3TU1TMmpE?=
 =?utf-8?B?di92T05VYkRRWWxMRllkNG04dnVCamNUM1JjYXU5bUh2UzhRQzVRVVVxNmRS?=
 =?utf-8?B?WEt1Z29DZmdQamtCS3BGeEVuUHFuQW1tQmFsZ3FzNDNGQ2xQWnAvMDQ5ZnRX?=
 =?utf-8?B?T3NBQnhRV28yd2gyN3YwMEE1Tks1Zi82aXZPTUpMQkdYZ0I2ZGliMjYxRnpG?=
 =?utf-8?B?LzRlYkdPbHlqbmxDTlhlSnFFWG5iajRBL1BSeVlheDNML0hjVFEzc2R6WXpz?=
 =?utf-8?B?ZVAySjk0ZDNUdlRxV3p0dHphekJZcVQzREUxTDdaVXJnTjFwUnE4b0g5VWRp?=
 =?utf-8?B?MjdjQ2dUY0ppeHFIblJnSHRIelBlR29ZMHhydGduTTdiZjJIaG9FNDNWSWJE?=
 =?utf-8?B?MWJNRVBHY05NRVhXR21hQ2w0cmN3OUVEcW9hRVo1UWxoejJZZlNCeVpVZW1S?=
 =?utf-8?B?ZGxUdExQanVzalptb1kxWW95RVZkeXRHcFhGWGk2Ly9WOHZNRFB4SEtEV3hM?=
 =?utf-8?B?aGt2OWZoVVZxZFBRSm9YZGJZUW1XbjhQVGdPMFdMU3ZTTk1FSVIrUEI1YzlL?=
 =?utf-8?B?UC9FRFVXdnp3aGExZDIzVmNpODM2NjhFYlBmcDZ0TWhUY2dBOUZ3SWxxa3JF?=
 =?utf-8?B?bCtnQXFzZXl1bDF1enZjZUJUUXNQYVFpRC9VdksyY0FJaXpJSVFWT2IxWjJ0?=
 =?utf-8?B?bk1OWExFUTVubFU3eDRJTzJjL0NWV0FqRDVBMkNyS1RMb2FwdGs4WkpLNE9S?=
 =?utf-8?B?L1Z5M0lOM01vTUJxU2s2emw2K2tHN1YwQnYrMVg1YkFROUZ4cXJ6MzAxZ2ht?=
 =?utf-8?B?VFdwcVB6WVAxNytXSTh4SWU0U2xoTTZ3V2U1NlRjdnJZZHpVQjRGdS9ydGNI?=
 =?utf-8?B?SGNNbDlOLzFlRTBFc1hseEFNQ0ViMEkyTWxBWTNqU2Q4azk1MDZqVjNCT25j?=
 =?utf-8?B?SW83RmpkTCtaNzhzbG15T3dVVUEzZnpuYXFscUFRL1BBWElVd1B1TDU4aisy?=
 =?utf-8?B?TVlDelBFRWxtZExzUE1pYjNENzdnbVlUSEJlVlBjTktyc2NWSy9sNU5aaldo?=
 =?utf-8?B?Sk40cmpWdkIrcHU5VHdnU2k5cDgyN1hZZHRMbGdzRHpReU1oUFN6SXZvMVUz?=
 =?utf-8?B?TGxEdHpPRnZ1Rkt0TnNCSkZoTFY1UElmSHpiWHZOQUlsc2tPa1BJbkkraEF1?=
 =?utf-8?B?UzhMK2RRcTBxQ3hPY240RVJkdjFvQTNKS2ppTEdlWWF4WmZueklNa25INTJM?=
 =?utf-8?B?RG1FY1FoVDJLU2tsR0RKbWlLTllpOW5oU0hxUnR5VWRRNEd3Nkxta3RramI3?=
 =?utf-8?B?ejBoNXdXZUhsUVFtbEVGUWJJbjQ0ZWcvRDlVaTVSZ3pzOGsvNnZ2YkR0N3Zo?=
 =?utf-8?B?NDdqVWlYSDIvcHlmbTVBWlJXT0ZKaTdTcjd1elE4S3Uwc2FyelYvUGJWT3ZI?=
 =?utf-8?B?Z2ZhTi9rOWVsWmJXU29obUZrdjJpZHlndWtyS3B3MHRyZE9Vc3J0M2p5QTdY?=
 =?utf-8?B?MXk4NDlrelZOKzIrNmx1ZFhRMEdhc25IYU93UWRmVmRRbGlBb2c2bW1ENU5i?=
 =?utf-8?B?RlhMdEx3b0VLQkRkNDB6R1g5OFh4U2hWR005WVp3TzE1MGgyRzZKNUpiTERm?=
 =?utf-8?B?M0hHeGd0NkpKSTIyNlJWS2xRYzU2L0J1alBhd0FJK0IxVjEyeVJmWjZVbkFR?=
 =?utf-8?B?YjRhWXRnSjhlZFlUdmVYcWV2cmFLRC8yak9xck5Qd1N2RlFsTDJqZGVRaTAz?=
 =?utf-8?B?ZnVyeWdMc0FyOFdxbW8zbHZNNmpJOSt2OWRMOCtPZll5NnZlMExRWGdnQTNo?=
 =?utf-8?B?b2NSd0tOS0d2SnZiclFwS29pTHd0ZVErZmh3M054YmVsYzI4Tm80dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ff90b2-b5f6-4849-de98-08def4736038
X-MS-Exchange-CrossTenant-AuthSource: DS4PR12MB999075.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 11:02:30.7084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zcnCE4AOYDCAgCqh0k5GhRrZ6/oWWOL8F/Y2CfjaI6PuUy7nb6OUjKPDPD/FJyeZJGDo7oGf9qDY4YyPGJNtlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5787
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_040240_822061_1194B108 
X-CRM114-Status: GOOD (  16.66  )
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


Hi Frank,

On 8/6/2026 9:26 PM, Frank Li wrote:
> On Thu, Aug 06, 2026 at 06:00:13PM +0530, Golla Nagendra wrote:
>> Zero-length prep_memcpy() needlessly consumed a descriptor slot. Reject
>> zero-length memcpy at prep time and document the behaviour.
>>
>> Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
>> ---
> 
Thanks for the review
> Is it caller problem, which pass down zero len? or are there special usage,
> such as memory barrier.
> 

This is a caller-side issue. In this driver, prep_memcpy() expects a 
non-zero len.
When len is 0, the path allocate/fetch a descriptor and append it to the 
transfer flow, but it represents a zero-byte transaction (no meaningful 
data movement). There is no intended driver-side special use of 
zero-length memcpy (such as a barrier/fence).
So rejecting zero-length requests makes the behavior explicit and avoids 
consuming
descriptor resources for a no-op transfer.

Thanks,
Nagendra
> Frank
> 
>>   drivers/dma/xilinx/zynqmp_dma.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
>> index 2d56ea08ce45..e70874d65123 100644
>> --- a/drivers/dma/xilinx/zynqmp_dma.c
>> +++ b/drivers/dma/xilinx/zynqmp_dma.c
>> @@ -836,7 +836,8 @@ static void zynqmp_dma_synchronize(struct dma_chan *dchan)
>>    * @len: Transfer length
>>    * @flags: transfer ack flags
>>    *
>> - * Return: Async transaction descriptor on success and NULL on failure
>> + * Return: Async transaction descriptor on success and NULL on failure or
>> + *	   zero length transfer
>>    */
>>   static struct dma_async_tx_descriptor *zynqmp_dma_prep_memcpy(
>>   				struct dma_chan *dchan, dma_addr_t dma_dst,
>> @@ -851,6 +852,9 @@ static struct dma_async_tx_descriptor *zynqmp_dma_prep_memcpy(
>>
>>   	chan = to_chan(dchan);
>>
>> +	if (!len)
>> +		return NULL;
>> +
>>   	desc_cnt = DIV_ROUND_UP(len, ZYNQMP_DMA_MAX_TRANS_LEN);
>>
>>   	spin_lock_irqsave(&chan->lock, irqflags);
>> --
>> 2.43.7
>>


