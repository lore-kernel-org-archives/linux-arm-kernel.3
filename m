Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87303CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 02:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CHote/KZcM/v/Mk7D5rc/o927O6ysvycboEZEReWpCU=; b=q6HfyqX6e2cK37PJVci81aXqyG
	yHWfu/QGb5mg6QEppofcx1KEdOaHKBPUlDzW4zRrvKxnTGHSjEldTuer5JvMTROFK0p74davak3qe
	04kdayavrkGmL+DKWecGGZ+3waHeQEuYJBrWI1LuP1/gZdH1AwyiQqtyWj6mkfwMkWf4AyVjzVa4r
	mP3cV78JHLtuvxqeMpg9w7fyFVbj9WZnPsH9NqTp26WbJLi12a+Jl8o0vXC25J4waRm8PLkjVPAcX
	iC+B6l+R/J+LhsglhjxIHPskfCo63kUUM4bswAvYZWM6Q45ZfEFJCB5OkRfUVlKfCYQNuBOtPhTm+
	jvNycrlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWlrM-00000004cHI-0QYX;
	Tue, 09 Jun 2026 02:06:32 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWlrJ-00000004cGv-3iTi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 02:06:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A9C+aKFRwn9QxtCE+pHp/nwez7JoIzqPKRy24/xcIPm/OiI7ViBcgB3c76M3TL6VIk4wkZfJwwDx0LHGTtB6Ifqbse1rn/v+znyhdMLjnU9FbD1Z8et90TDIKj2HFRnTB3tZcEFacH7OpbSxgb/zXc1wGIwA97LMFzSsjK+oRh2AqFy0eRN5cin5GFzKp8iQSfbzN+QgZGS9jIJ/eCzDU+wfN2FCL0rUqDPUwuRiBtVItPOZpNLsoY7jXJYY4V1Rk3Y/1ySPKYtKxMaxPnGN6KAaIYkL7wZqLJDHwOxRnKzdx8Jsyf6wQHEH9PKlgpc6l+OBMDxA40Dl11Cw29rauw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CHote/KZcM/v/Mk7D5rc/o927O6ysvycboEZEReWpCU=;
 b=E+/XA4T7wWIQv7Vn5ycT0ROL1swlczPgJ3I7DJQBFdrztr5+tzMqcngqYOHkkrYTX9jjoHZv1unb3q/oVGlR9IR/okCx36qYGFgBcBRbyQZqZlTvrXyiQd4g+/rebtN7DNDTZu9iGhe4883FwfWlWmKsBetZTmzEVo/N5BItWbyEieyfAw6wcJ/Cia4EDkHKl0hIM+A2+lEQgAcstNxu9kCY8OPnAlv8cdsqPain31pEAEM7lkqg70Bk3OqwTWE4DvB9PabxhNC4+719w1FJ7aEY5EdiCD0fPSGgVoKI6IiWL5fDwttLiThtsIGIDlCavY6wqHlhcq0qVcH4jfHbfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CHote/KZcM/v/Mk7D5rc/o927O6ysvycboEZEReWpCU=;
 b=Ho9imUq1Suu0A2K2Q7BF7LIo01JcU5jL1BYWospfgYMw/U04b2GXRfBwPd4ntBQWklsZjKMTEPIHOhweJw3ByeK+XX4s75+nfLg9Ys68IdR1oHcHm4f4FZVJ8XdLtPGVTTyT03MA7t1uQHCFA3a0VJMtMagEqWgUNgDCGO7GW16Mcb7HnD6JGLxU0rMBdtwpfcuCneluXWlPq9WFPvImKNIwrJUtFIWkFovWgdXdk8o1aetfYD/mLf3eep1mXA5cQ/gkzernK/VgpwQmGt0+cCEpR+g933W0Ugwo4VIxTX2AjVib6I/HuKLXIhplu3Wq9rVPr+0EHglHlSc6B9nm/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by DM4PR12MB7526.namprd12.prod.outlook.com (2603:10b6:8:112::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 02:06:18 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 02:06:16 +0000
Message-ID: <c994c0a5-9610-49a0-8fda-82f088264ef4@nvidia.com>
Date: Mon, 8 Jun 2026 19:06:14 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: Fix MPAMCFG_MBW_PBM register setting
To: Gavin Shan <gshan@redhat.com>, Ben Horgan <ben.horgan@arm.com>,
 James Morse <james.morse@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Shaopeng Tan <tan.shaopeng@fujitsu.com>,
 Jesse Chick <jessechick@os.amperecomputing.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Matt Ochs <mochs@nvidia.com>
References: <20260607050925.252475-1-fenghuay@nvidia.com>
 <1a9e10ef-266e-43c7-8722-eb61a1af1565@redhat.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <1a9e10ef-266e-43c7-8722-eb61a1af1565@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0084.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::29) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|DM4PR12MB7526:EE_
X-MS-Office365-Filtering-Correlation-Id: 42371470-3bc4-4c95-0e0c-08dec5cbb020
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|56012099006|11063799006|4143699003|22082099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: aMlDcQksIBFRQ7Y/WQ9h4P6wCQQehEgeZ6MaQ14G1hB4Y3fMFqCqzKgJzL39NDrVNqngMUVL4sXyeyDT+TFrgb6GVnyMW4JRnVj7Z/ptwUI9fkS8NmXGn6f4FZmgnRf8/4+o1fKkTrnOvTW5GPpOjsLRElxNgXH+Lrs2AsuJ7o/zt29I4ZviKRNqkrfNckADyy9sHK4qzdJD4IzYqzu6995WHmGE2k5vkkdS6BhB/i2GAPlPjLKFWsWNp5TBzoej7WpV7PU+Et+9djz8H5vOgVrrxnztyZZhLCE17H4t/Dw2zzdydzm8HbSPF4QVOocwbkF9vhc3WlG3EzvDTdQDDb6pTbJlG3eiyfq94mZ/Jtz82mZIdcauvqbNRed4yukiHy/JMAADTiIHmwWZZirCAeNSTspymvWz1iSJ1I+M6YqSrR6T8+2MyfkD5YlfQnIf0SIjQ6Y5nAHZnivE6s6TFrRNiAj6Pj230dP8yY9sAfOw0BE5Ppzlnv770fBQFCJHL+ajfw0Qe0NUGADji7aHVrb2M69CraPLkCZe4YTgZ9ZKLMWgJjg+OEMtwz6zgk71uwieYgQ814/7O4mBtO/e9nM/H+pa28BVRs9DcCphAwHyGIp6KtUJPOEWNGsHtgtESYcng6W+Nzced+RUSz5YVIn15YbrTWN2cE0Yxuz9jXFmIcwK3udiVrkAlyTGh2LG
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099006)(11063799006)(4143699003)(22082099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3hrWHJya0lnYnpqOWIra0IvV2lFV2ZvYittajJmQW9idkNZOUN2cmpOOENq?=
 =?utf-8?B?MG9rVGIxSzRpUStkT2dvRjl0WElpK2ZmaUR2RjBHbFBoMFRCZkhhVnRZYkw0?=
 =?utf-8?B?RlViV2Frd1dnN1ExL1BqVUxiZWxlSUJmeStWZ0gybWJscDJ6NlBVbExHSncw?=
 =?utf-8?B?OXhIOHFLM2cxR3NrcFRQclF2NjN4RXBPWmZFWmIycm1vTkdMRkQ5TXEvdFBz?=
 =?utf-8?B?TnpDbFQwTFdrVDFvSTZZSzlZNHBMRWZ0UjBjTFhHL3gxK0dGNXF6RTk1a1Bl?=
 =?utf-8?B?RS9oRkEyWVZERmRiQVVBc1V1U29CaTdWQjc5T1Q1dGQ0STd5eHhxTjFNZkhM?=
 =?utf-8?B?VnJxY3FpK0ZaME56cGJnQUkyd0Vrcnd1enl1R093T0NERHFpNjhUYkM2S0Iy?=
 =?utf-8?B?V05YSXdHVmZYU0FVZ0RSS2dLZWc3ankvVUQ5ZTE3VUE4SDZHc0N1YUJkZkVK?=
 =?utf-8?B?bHBkQ0ljTUo5Wk9RelM5NHREdklsaStjTnR0N1o4U2Y5L2Y0OStIRzF2SFBV?=
 =?utf-8?B?L2ErNFovZFBzMmJhS2FOMUUvVTZhaENqWGhQTGh6ZGFwK0JqNE83bEVTQ1dQ?=
 =?utf-8?B?ZjdTcWdqampTemFJYWlHQkJnajA5M09NZ3VtcE1wS1ZkOVoyNDcvTVJGcVBQ?=
 =?utf-8?B?SUdseWRiQ0lTQlpweEhhWjZQYzlTUGZKSGdJb3NqMkhoemRLUVhBM1UweWZu?=
 =?utf-8?B?dzFGUTNzWWdCS2tTSTdyRldzQ2s5WlBRM2h3UjRvSXgwYXhXTVJvZWQ3MzZQ?=
 =?utf-8?B?V1dZR1UyZXUwUTlQdTM0amhxayt2MFZEMWlkcmZnSHVzdTBUSnFvcmNzNXhZ?=
 =?utf-8?B?ODE2d2lLN3BMY2l5dEI5eTZsVWw1KzdqMDNzL0RaM01yL1lnbktjSkJTQmtP?=
 =?utf-8?B?Z0dyVlNDK2JudlQvbUtES3U0OWtiMXRhTTNNVk5BOWU3TWU1OTY2cldHckk2?=
 =?utf-8?B?WG9yODBHV25DV0dDVkc3cmtUT3F3SjhSeU15TDBqSzNzSTluTDR3dWwweDhv?=
 =?utf-8?B?am9pQ2ZESTVjOHgyRUR4MGJxTCtpbWVpUWVSS3ptTkY4REpRR2F2ZU9iMHQx?=
 =?utf-8?B?UUNjTWpISEJHZWl6ckhoVEZYZkxHNTludnVRajZEK04rcTloK2d5TDVVNG1X?=
 =?utf-8?B?SmRrQ3lBOS9WbVp1QVFMV3VReUhaUkwyd3lOMyt5QkIxNUZnSzNyTWt0UE0r?=
 =?utf-8?B?RW9BVWJxU3BmSFhEcFJGVEpWN094RnEvTXUxN0JZOHRYMjRycytZOGExbi9w?=
 =?utf-8?B?amJDZHM3dWc0aWlLa095YjBsYUZ0ZDVxYWpMZlFDRHVTKzFzUVpYTmZYV3B6?=
 =?utf-8?B?TFVYWXV5THNZMnpYeHZkS2t2Wkw2Zm4vcHNvNW96dGdGejZXKzZXQmFlYjF1?=
 =?utf-8?B?Rms4K01DVzFoYnpYZEdKMjI3YjlidENQSTJWaitFRnpIaVZnbDRSQVR5bDI4?=
 =?utf-8?B?WWxEckptdC9IUjlsL1E3YnpVdkFhUkJ6VUNneU1FdlRkVTZkVXJCaE42ekFD?=
 =?utf-8?B?NmhoSUZNczZOVzlCWEd6MitGd1Z3aTJXM2xmRzFMbUF6V2Q0YTlhR25Jbkla?=
 =?utf-8?B?TDNxWGd5SUtqaWo2Y09JaXcrS2dXTXNJaXFGcGdxVXBJeUpveCsyN2RkSk5r?=
 =?utf-8?B?QVlaWDk0djFpa3VqRCtrT0xlZHl5QzFhTlhpZUx0VlQxN1R4Zk5PZ1ozU2lZ?=
 =?utf-8?B?bzZBTk1wTmtiV1R0T25VcW9KTlBWclM4cElsR2ZYVXlLK012V0pFUzBSeDJ6?=
 =?utf-8?B?WTVpaGF5dU15eExrY2JhRXJndWx6RUlJQTNpREp1b0hoWFhXY29rTzNGc2dx?=
 =?utf-8?B?RW55UHFoNDJuejVlUitteU1rTXc5NmFldFByTlRxek12dG40VThrdEswZitI?=
 =?utf-8?B?TVFkOEJyZFRTQVJkRGRGRnNteXBmZWk5RktMUmxUUTM1SzFTNSt5QTVYRDJo?=
 =?utf-8?B?QjBIM2JiU2ppMGZSOWF2Q3N6bUQ5VWpoOGJjNVJWMmhHdmdXM2pMeStTT0dM?=
 =?utf-8?B?UHdWbm43TUZNQjY5dEhEUDBFWFA2TnJMdjR4WGh0aHlRV0FDeG15aHVENStP?=
 =?utf-8?B?eE1FcUhqa2lFanFqbWkydGl5MGV2Zzcrc3J6eUs4d2c3NVczNUdqS2J0cjcx?=
 =?utf-8?B?alc5NUtqNFBpSHViQzNFb0dkVkxqK2xyR3NmQmtaRFFlY2RsSjk5T1p6K2FZ?=
 =?utf-8?B?VVBKeXVxSkxsRVZkdlk0blh4a2Y0R2g0S1g5ckk1cGJ6V0VSczdCZXR5Q2k4?=
 =?utf-8?B?eXowSDkvbUc5d3pwclpOTTBjcUplQy9BMmE3dTlRUTIvRUJEYWhOaHVJeW1q?=
 =?utf-8?B?RlRYMEJzWW1VY3BQWDd4a3VyZHdLK2t6UVRqTXhJOVhaME1vVmh0QT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42371470-3bc4-4c95-0e0c-08dec5cbb020
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 02:06:15.8775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nu5HqVXqH0tH2xF/kiY9sC6k1DnMOowmWHoXATLn1uVphhuIYCtQRuwCHadukR+SkYLyAucdLn0UsUjLi+M/jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7526
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_190629_937101_6DD6C3FA 
X-CRM114-Status: GOOD (  22.23  )
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

Hi, Gavin,

On 6/7/26 21:46, Gavin Shan wrote:
> Hi Fenghua,
> 
> On 6/7/26 3:09 PM, Fenghua Yu wrote:
>> MPAMCFG_MBW_PBM is written from cfg if cfg has the MBW partition feature.
>> It is reset when cfg does not have the MBW partition feature.
>>
>> But the register handling is reversed. This may cause an incorrect
>> register setting. For example, during an MPAM reset, reset_cfg is
>> empty (no MBW partition feature set), and cfg->mbw_pbm is 0. Instead of
>> resetting MPAMCFG_MBW_PBM to all 1's, the current logic will set it to
>> cfg->mbw_pbm, which is 0.
>>
>> Fix the issue by swapping the if/else branches.
>>
>> Fixes: a1cb6577f575 ("arm_mpam: Reset when feature configuration bit 
>> unset")
>> Reported-by: Matt Ochs <mochs@nvidia.com>
>> Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
>> ---
>>   drivers/resctrl/mpam_devices.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
> 
> The fix itself looks reasonable to me, but two questions below.
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>

Thank you for reviewing the patch!

> 
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/ 
>> mpam_devices.c
>> index 4b93e89c2678..d8b0383cee92 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -1570,9 +1570,9 @@ static void mpam_reprogram_ris_partid(struct 
>> mpam_msc_ris *ris, u16 partid,
>>       if (mpam_has_feature(mpam_feat_mbw_part, rprops)) {
>>           if (mpam_has_feature(mpam_feat_mbw_part, cfg))
>> -            mpam_reset_msc_bitmap(msc, MPAMCFG_MBW_PBM, rprops- 
>> >mbw_pbm_bits);
>> -        else
>>               mpam_write_partsel_reg(msc, MBW_PBM, cfg->mbw_pbm);
>> +        else
>> +            mpam_reset_msc_bitmap(msc, MPAMCFG_MBW_PBM, rprops- 
>> >mbw_pbm_bits);
>>       }
>>       if (mpam_has_feature(mpam_feat_mbw_min, rprops)) {
> 
> Which machine or system where mpam_feat_mbw_part is set on RIS? As I can
> remember, this feature isn't available on grace-hopper.

Neither Grace nor Vera supports this feature.

> 
> Besides, I don't think this feature is well handled at present because
> mpam_config::mbw_pbm is only 32-bits in length, which doesn't match with
> the maximal length of the bit map (4096) as documented in the spec.

Right. The current code only can support up to 32 bits of PBM bitmap. If 
PBM bitmp length is bigger than 32 bits, it's broken. I guess we will 
need to handle this feature properly when hardware supports more than 32 
bits of PBM bitmap.

Ditto for CPBM bitmap.

This patch currently only fixes the regression issue introduced in 
commit a1cb6577f575 regardless size of PBM bitmap.

Thanks.

-Fenghua

