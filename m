Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69A0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 15:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rbGjnqNN1M3eMka6X8LKE5WFoFEezwh/rt1UlSQJASc=; b=ctSTEm5VOT95MZnVWLR+JAx+iI
	JGBF/haY2xqodGXs/YSikSTZm96isnit+bylKGNAVL0OBBq7JXMFqjJQTN4f4ZCAPJZnHdUpVKMHm
	oDUo2mHDoBMH6DWnF8UBXYwUhG/rQ1Cd6aTzHanhGELVOw5QfDDjFokw1+izgUmsu/owb65XMdPuS
	dHjtyi0246bx2LcIB/afW/piuaOmdI+096uh/896bFfmABIH9NWfUOwd4bbCL9Vq0Tqbf4rsBQ3Vq
	W+yNR/tc59TFwdvF1a+DZ3ZDQeFDvuZC8J8D7jWxBAFuUkZ4atYizxljVnFcJyzKMDk3ycnREimFP
	1wVzFY2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJdH-00000004r78-434n;
	Thu, 02 Jul 2026 15:47:19 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJdF-00000004r6X-2BTZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 15:47:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=giIlhMzYvPi7oSBSqju9XvpfSHI/38epOGWNwmr3+0pPagoDgT3MiA8kDfWTzUvlN1IUtF0EwHZNOsPAQ9Ue7PFGDTxPiw8KjRlx8+Yq1NZTcFyBZA1e/QVfQ6SivswxS3Xdq+EAukw4qcydTlpjzwPh1826S1yIajlVGtE7dsq5fpu38poxFqx2Vdp6EPSRXE6qZyAufo15JntpCm4AFUY6aUdeaupo6gb/Wl/cUNL5yoxcRk5Z47aV+NQ+W06aJczO055yWBcVXEPDWS7QMpGu0ptR7JSIQWv2C9j9llvFJbUCX/nUi997tDwXtP8Wk4UDXY9vOPDx/PM7pnFCCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rbGjnqNN1M3eMka6X8LKE5WFoFEezwh/rt1UlSQJASc=;
 b=IrMmLzEHDV6ezpA2qod/Mthz0/1uBhDHZ9nTxtZi4AykdTTVbtzg5TW1YBuhtQB/UXRditlnDe5foj9Zz0qfAd+2YxX2CtmP+AO/PG+wsYQHim2RUZwyENtsg4Fbri923fwS1mF3azH0mnNSdKSPZh/W8hloXNW7j00wJMHY4GoQsb+ZCKk9gFEne69zseBlv4PPoHeMe4cbhJ59WfpzHqKifOTK8tw+mKq/RIt7O12E4f6EmjJ6M+7+w/oXZWBOQvEyfhd2h/cyPQP0uc6PM51OmfLjjlZ6lJvgaxiBiQtzNHV0ukl5Ao+K7kYXvfiNC2rz50IWef6KuPDSl13GdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbGjnqNN1M3eMka6X8LKE5WFoFEezwh/rt1UlSQJASc=;
 b=h5XpfXIxaqfFCdsOjgpv9/D9kcw4j0rNMHBujwNSIhwdTH29W7wNuBufS+3gxuq+GFWa5btFrbAB52ppOEn1RBN32n+FNwx+fSlTg1LJARsoogOHac9XQ7m6W9oV6DAfmjpIa4hREX6QUlNsUqtMxpMT4EKab3SN2+vuRfsg5fHvbkosmPB53e5YzAiAIZTuupypZee0tulZrb2ahnHeE0e5zX1fjLDNTN1UaUhIgt8DXtsO8nnsccQh2tX7G7PgLdxAbLfF/AbuLCDfuetHPY8dgBaAIsVpdNcP+8/uM4Xgt19z7Sa134lWr5xld5r90gmCUoC28yVgLbrbKCHJLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by SJ0PR12MB6989.namprd12.prod.outlook.com (2603:10b6:a03:448::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Thu, 2 Jul
 2026 15:47:02 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%4]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 15:47:02 +0000
Message-ID: <c7d6acae-cf47-40e9-9937-116303d8dd53@nvidia.com>
Date: Thu, 2 Jul 2026 08:46:59 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: mpam: Add memory bandwidth usage (MBWU)
 documentation
To: Ben Horgan <ben.horgan@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 gshan@redhat.com, james.morse@arm.com, jic23@kernel.org, kobak@nvidia.com,
 lcherian@marvell.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, peternewman@google.com,
 punit.agrawal@oss.qualcomm.com, quic_jiles@quicinc.com,
 rohit.mathew@arm.com, scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, zengheng4@huawei.com,
 x86@kernel.org
References: <20260520212458.1797221-1-ben.horgan@arm.com>
 <20260520212458.1797221-6-ben.horgan@arm.com>
 <4b0552cc-85cc-40b6-ab65-6b7620149f74@intel.com>
 <0ebb1365-9883-4974-9e8f-05c2eaa01fb1@arm.com>
 <b2dae9c4-d0b3-4ec2-884a-569020039b5f@intel.com>
 <5bba66e2-f671-4bdb-a2e5-f2cf9fb1f9f4@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <5bba66e2-f671-4bdb-a2e5-f2cf9fb1f9f4@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0219.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::14) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|SJ0PR12MB6989:EE_
X-MS-Office365-Filtering-Correlation-Id: cb7015b5-6f27-46cf-99bd-08ded85128a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|3023799007|6133799003|18002099003|22082099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: hEPQ3EdvtweZKHMVa8gJibPVsLV8i+7bBpFEkFj7y6GmoBO8EpIqH1I59+YPeag5osQZVrVCWOSKAWa68CTy5F/wxNkVRr/IW2sFNVjnsa+wo4N95nlbljHqY6mzQJNLUC9BgeLAJ+niw69K//CpcNXkTaaLr2t2FqysOp/2h8nRTv4VLNxDRgDA0cQgy/QLwggxEvvOdNp6PZpLHjlJO2M2klkGl9vWn32Xv4rwqIi4wnurxv1wPBH/KaxsvHj4wFfJF1XySFaGdbtl0wIuElYurMm47cZyb8fEyiwpodD03jScPXfaiuIGcnALf0xk7kmfU8pjh4W+FZe/ev8ztaXJcxinLJjBxTPFa42ZCHuLZUSNSGZUBKfvTW8yKlfwJCELj9rPr8CVCCiIuQBY3M/t9zocDXINNGHlLdsaDBP1pKgGuIWYGEkTSZpmAtNV5u+23JODrSQ2t2wn0uluKsDfBj1ChEwzNYHHPsBSU6it3yZR4u8hGp4Tx0xMhm3wUFrURbZTnQ5nzk0+VK4kW6kFjnW3Lmn2ebuQbUqofneC4xUp/UQZHEH9G87jhyQKwIiAx7PMBd7NC8aFYEUvIafFg1FLQin/t3EkaoVnqqjkwRo3QBOcgyrcSS6Ynm8uFTP4IB9R3Du0hMEoz5a9W7mFYHoAz2asNHFGLqcsWEE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(3023799007)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NE5LdC9UWFJacEZDdWJ5dk5yU0FzaEYxV1RGMFBzYTZPR0RNbFVxTit0M0tl?=
 =?utf-8?B?WE44dVp3R2RLR1VGRkdpeXAySE1xMFhjU28vNy80QURvY01qbVlFR0VBdG1p?=
 =?utf-8?B?QWtVSEt6cTQ0OGNkZFg1ZzV2ODY0b1E5WGVEYzZGTWlwajNqdUlNcC8zK0xP?=
 =?utf-8?B?T2JCVW5TWkNDdkQvVGxoV2JJYnVXR2dDMkhkU1pKWXNEZUJhVFJacE5LZkh0?=
 =?utf-8?B?YVlVMlFYeUVaOGk1T2VHSlc3aVVnTjdoS0RxY0lzcmNmSkYrTWV2SjlRS0Jt?=
 =?utf-8?B?WEZUQ3RJbXQvTXBjbUcvaEFxRXJxYW5DejRZVXZNTXM1QSt2WCtWS0I2TWQ5?=
 =?utf-8?B?TnNiU0hjWFhzc3dXNDU5ODdTT29paEllZHR0OUVGNjhSVHcydVo0YzNoUSto?=
 =?utf-8?B?dzFhZCtjajFxNURQUFl5TUJmMDB5OThqQlNyU0hzWnJqSnNUdWlGbFdWdGVE?=
 =?utf-8?B?SEFwVVFyTnY0UWwxM1ZMSEdvckh3U1VuaThHWm1ZVklERkViVXVZbXRNK2tJ?=
 =?utf-8?B?NWpuWWtMdUlGNnV5NGdublZVdE1mZ0pKbm41eWdqdVJqQkowUkUvMGMrNHp1?=
 =?utf-8?B?clBQcnJuSXY1blJwaExpS2R6Z0tBaXJ0bk5DdjN2Z2dpZG8waUp5SGgyckd1?=
 =?utf-8?B?QWR1RmsxdzREMnJ0Tkk4MDBMU2NremoxSlA5cHVYaWU5Y0hYZjJWUXNha0VM?=
 =?utf-8?B?UlBmenU2T1dUOG5EYmtvb2JOb2ppam9Nc2gvZ1hYcmE1d04yTm1sM01xV0pX?=
 =?utf-8?B?UGEvc2RVdHdqaEJRUlgyRW1JOFhmYjZZQmZsaWJHbUVMelpDYStNQlZHTXIz?=
 =?utf-8?B?TXJPQzJYaG5HVHY2Z2MwMHpwaEZNVkpSWHo5clM0NzhiYmUwQVVMRnNtNmtI?=
 =?utf-8?B?VHcvbUk3cXdjZHZlbmFodXpoejFnbGhEMlpNZGxYSFh1LzRaWEgvRzdlTHk5?=
 =?utf-8?B?NHMxWkd3dDFrQTVzT0VxY2d1b2x6VXBMa04wRStnYjYzS3JRZ0d2ZTZSRCtO?=
 =?utf-8?B?TGc0OFZHckR4QU9JWmdiaGRuSHlYM2VhSHpPSXVHa1B6TkZxV0dWbzI1UTZP?=
 =?utf-8?B?cC9yOHdPNVVaZFZVeGZ6bUhKOE5OT3JuOUl2Vm1PRzQybjlteXVLOGpOQ3J5?=
 =?utf-8?B?WHB1ZWpCTmF6UVAvWkJWV2dDRGNNUFdyNEdTTGdMUzFDQUt6ZnNWUFZyRWxS?=
 =?utf-8?B?MVRTN0xHWUVMclgrYk51YTJIdXNCKzlYc0ZqV3B5dEtBQmJtLzA2NFRkeFN1?=
 =?utf-8?B?L0JFZG0zbDg2OCszR1BGVHI3NFZRLzVJRGkyR05zS0EwRnhlQk9meFlMeWJx?=
 =?utf-8?B?eDg1RHE2ODd0UXBOclJ0MnhEN1Jjdk1pdmhyVGpwRXBhU09DUzMyN2FBZmRu?=
 =?utf-8?B?VFJyVFkxUXk3dTlwbjlCaTVVMTlZMW55S2JQWEZlRllGeTJBUmJ0Znc5VzFk?=
 =?utf-8?B?b0V0YytRVkhYQ0lTMXAwVVkxM3hiLzRKNEhRYklXRy95Y053dkYweTZhZWFL?=
 =?utf-8?B?clRMQ1k3ZnJwMlBpUnVKbTlrdTY0dUh3d2pQTiswWk1zL0JtV3l4bGpzVWhq?=
 =?utf-8?B?d0tIZnlxUnBhUjVRdWE2cUw2QWltSjB3RnM1OTdvYVlDbmFCZmFpdFZrc3M0?=
 =?utf-8?B?M0w2Znd5K1ZGUENSOGRtZXl6ZU5vWmZEUVFtYnMzMENOV1dDZkgzSnc3OWVm?=
 =?utf-8?B?NFhDTE1KMFcwaGtFSmpXS3F4REsxd2hLMTBBUFZqV1NHYStFVUUzS2FQRHoy?=
 =?utf-8?B?UUd0aFcwbFNSazgyaVJENEVQWkVNMkVycTQ5T1NDVGxsTnAwMi9uLzJEVU54?=
 =?utf-8?B?alBZdWp2S1dHa2xhUmZKZXg3cEMyWXRJWTBsOFBuaVRybTllZmdFUk90L1hH?=
 =?utf-8?B?aVdJdVh5UG9nVEh5aXpGbmFhNHNSQXg3eW8xaDJScHJLcWN4TERSWjRqY0Nq?=
 =?utf-8?B?STFkR0xGazhKeXdyRW92TnNNT0RMcGMwcVp4Z1RYaWZmdUFHQ1BNM2tFNW43?=
 =?utf-8?B?WHRYWThOeGl1Qmt3aXV3ak9HSGRJcFZ3ZE84bm8vN3YzMDhVTG8rS1JCeUZI?=
 =?utf-8?B?WFdyRDdaNWZ2V2JreEhwWVNWUzFaajc2azFrSmpCTldXbEVhc3pPZzcvdzg4?=
 =?utf-8?B?RlcyVms5MTkvc2xzT1ZGQlhKb0c0ZUlpL2JVU1hXOUw5UXBZVk4rNlpUQmRy?=
 =?utf-8?B?RlRrOW1POWZheTJuRW1XeXUvZ0oyaHJ2MUVZTkVPN08yU0ZDQ2xncEtpQ1Vr?=
 =?utf-8?B?WGZsbngyN01Ca08rMGhnWkp1NXJydFVHakh3S3VENHVFNE5iZWJDL25aM09G?=
 =?utf-8?B?ZG51OS9HNDZaTEJtL0xXRHFKZ1pUOUl0MzJWdVdQc09LNTJOVFA3QT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb7015b5-6f27-46cf-99bd-08ded85128a0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 15:47:02.1253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sp21Vsm1PnH70Te/ZG0lNKzHpsCxLFtaTpae+X+HU9lTNAYGp6ieQW2l6g93WPd6pecOdhFg2ILVMclH08YhRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6989
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_084717_619072_4906F7D2 
X-CRM114-Status: GOOD (  18.92  )
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

Hi, Ben,

On 7/2/26 07:58, Ben Horgan wrote:
> Hi Reinette,
> 
> On 7/2/26 15:46, Reinette Chatre wrote:
>> Hi Ben,
>>
>> On 7/2/26 2:20 AM, Ben Horgan wrote:
>>> On 7/1/26 23:38, Reinette Chatre wrote:
>>>> On 5/20/26 2:24 PM, Ben Horgan wrote:
>>
>> ...
>>
>>>>> --- a/Documentation/arch/arm64/mpam.rst
>>>>> +++ b/Documentation/arch/arm64/mpam.rst
>>>>> @@ -65,6 +65,23 @@ The supported features are:
>>>>>     there is at least one CSU monitor on each MSC that makes up the L3 group.
>>>>>     Exposing CSU counters from other caches or devices is not supported.
>>>>>   
>>>>> +* Memory Bandwidth Usage (MBWU) on or after the L3 cache.  resctrl uses the
>>>>> +  L3 cache-id to identify where the memory bandwidth is measured. For this
>>>>> +  reason the platform must have an L3 cache with cache-id's supplied by
>>>>> +  firmware. (It doesn't need to support MPAM.)

s/It/The platform/?

>>>>> +
>>>>> +  Memory bandwidth monitoring makes use of MBWU monitors in each MSC that
>>>>> +  makes up the L3 group. If the memory bandwidth monitoring is on the memory
>>>>> +  rather than the L3 then there must be a single global L3 as otherwise it

s/a single global L3/a single global L3 cache id/?

>>>>> +  is unknown which L3 the traffic came from.
>>>>> +
>>>>> +  To expose 'mbm_total_bytes', the topology of the group of MSC chosen must
>>>>> +  match the topology of the L3 cache so that the cache-id's can be
>>>>> +  repainted. For example: Platforms with Memory bandwidth monitors on
>>>>> +  CPU-less NUMA nodes cannot expose 'mbm_total_bytes' as these nodes do not
>>>>> +  have a corresponding L3 cache. 'mbm_local_bytes' is not exposed as MPAM

Maybe remove the CPU-less example here since you will add CPU-less info 
later?

The CPU-less patches will update this document accordingly.

>>>>> +  cannot distinguish local traffic from global traffic.
>>>>
>>>> Hopefully we can get to a point where memory bandwidth monitoring data from
>>>> CPU-less NUMA nodes can be exposed via resctrl. When considering such possible
>>>
>>> Thank you for your interest here. I hope so too.
>>>
>>>> future I think it may make this work easier to build on if the documentation
>>>> focuses on what the current implementation supports and leave room for
>>>> future enhancements by not constraining user space expectation with an absolute
>>>> like "CPU-less NUMA nodes cannot expose 'mbm_total_bytes'".
>>>
>>> The intention was to describe the current limitations but I do see how
>>> this can come across as fundamental problems rather than just that we
>>> need to do some more work to establish how this can be done and
>>> implement it.
>>>
>>> How about if I add this paragraph at the end?
>>>
>>> All these restrictions based on L3 cache are due to resctrl, currently,
>>> only supporting monitoring at the scope of the L3 scope. It is expected
>>
>> How about "at L3 scope" instead of "at the scope of the L3 scope"?
> 
> Sure, that reads better.
> 
> Ben
> 
>>
>>> that going forward more MBWU monitors can be exposed to the user after
>>> support for more monitoring scopes is added to resctrl.
>> Looks good to me, thank you.
>>
>> Reinette
> 
Thanks.

-Fenghua

