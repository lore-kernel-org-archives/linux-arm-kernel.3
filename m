Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD18DC44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 05:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TukdG1O1z/TD7JqsetBr+2eUexLhHVc8efYajkoD62Q=; b=TPkpWeuclfTwV8CXnSNuzxHeF8
	WSdTwQG/j1z+564afY3Omj/ivXS8bjIB83rC4UGbaN77R0d8mopCQa0zsNxP7N1wyj6nyU/hy5SIZ
	NpuzC+uHNpkdOsMBJvuSwsEtmCH4exdKAqlnfGe8gIUkUJaQznBec0aY+v8UZSO7nmC6xreDtJ7yd
	ggUqNmBG96Fu53/DOpTO/fjWJCO6vJ50Py2LLhMHnTjlHrfLY6vtnAZajGkO+u4Hm6xNv8wFiUAcS
	wubqIj6UIXc7WNzV+HdLJq39ZefFi4K1EE9EJbL6ilHWXwR5YVyjpoUwEzem3O/wv/Ex699XV7S/i
	vCRDaj+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfWNF-000000063oX-3eZV;
	Fri, 03 Jul 2026 05:23:37 +0000
Received: from mail-westus2azon11012024.outbound.protection.outlook.com ([52.101.48.24] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfWND-000000063o8-0rBi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 05:23:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ySd9bCN6q6IcaosH9g2j3qS+rQHFX5xwrWBoau6RiLQFp6+AqmmxpogsgsM4qwmK9QI0BQi12nCseR2hLWxGRjzSiXvSofGEdxiqQjI/a8XUBHBaAqdpirk4cJcXuGrYSAawN1xotJUnE9Ooi9ATT585lxVUrFW+6ScwDksZpGFUKa6suX2m2amZkAcmQQguRSTqqOUkjslPnTUbkvPc18b9N+PaWUmNW3JTVvtCdtCdN2av9cJoVxTHg9WdQv9NgdWY0HTDGfRu1xtjK9Or32Q8vSjvWsPZV1wYNX6yfKieMdNuCw1VxGhmK+8YjtXNwYPAkd7Da+mqCXUXK9uJ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TukdG1O1z/TD7JqsetBr+2eUexLhHVc8efYajkoD62Q=;
 b=OiVfwlUywIKQpuGs2Y0tJHS7EaZg+Wj1EAdDWynzVIK5wSAAPll+4Pa6UWufin5VfW2QDId4+4dcXP0dOdbnCHq3mGq0BUdg9YGLxp3kvdnr9UXuOYXu5ikvddhyM3xEGIOmDRN7+Zwpf7CoW3ITF/p7dAb6/We5+KoxhTEgSvoVXK2tPfDLo6vNskrQ+pJ3ssTrY3QtJ5FyYoGxcehXtp/qVW6eXvmukYsgEKN8AFZR/fLAFZVZZa4stmMFj6SoKA/1y6cJ5dsf+OW1er2LgAO8iKbH2Q0BWlZOHfeassfgkfM0dMMje50cT1nag2rpJJCf9g+cjQJwlQz+wfhbJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TukdG1O1z/TD7JqsetBr+2eUexLhHVc8efYajkoD62Q=;
 b=A8me2LJAzYll4FxOG1VXAaneR2BqkFI1Vkh8T7byf1LsAhSyTKQdH0s0k9FRVFOnln1fIl18flxxttwFp31/zHS5HHPMge+TJGB8m9X+sI8Y7uXUA1ty9kFj2dML9UQYniK8YfvS+1N4tR4k1vTnyapVYm9mYtIs7C7U0sUfD76t7uz2LaOWwi7nPXyu9/mQ66P0m5Yxzmc+au7BiHDNQPQiU8sV7nmwKiuoPg+jKRWHB3Md5zxtpL3EGMHmzPHw0NP8Nn+FotjXUGwOpewTTjA2lniVbJ9IkjDjCONSOtrIG9kTHsomOTyALRv9T9nErl1EMXi0Va7iYt6FbhnLag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by DM4PR12MB5867.namprd12.prod.outlook.com (2603:10b6:8:66::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 05:23:19 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%4]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 05:23:19 +0000
Message-ID: <7cc07877-3318-44bc-8122-f8d493be833d@nvidia.com>
Date: Thu, 2 Jul 2026 22:23:16 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] arm_mpam: resctrl: Add resctrl_arch_config_cntr()
 for ABMC use
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 gshan@redhat.com, james.morse@arm.com, jic23@kernel.org, kobak@nvidia.com,
 lcherian@marvell.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, peternewman@google.com,
 punit.agrawal@oss.qualcomm.com, quic_jiles@quicinc.com,
 reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, zengheng4@huawei.com,
 x86@kernel.org, Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260520212458.1797221-1-ben.horgan@arm.com>
 <20260520212458.1797221-4-ben.horgan@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20260520212458.1797221-4-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0371.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::16) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|DM4PR12MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c20d004-9ea3-47cf-a947-08ded8c3310b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|1800799024|376014|366016|18002099003|22082099003|4143699003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: zUYnexv0VPj+jx6Ef4sWP7KQm/p0Xk+8qxHLisdPTGJvxP1yONUgXju/C1VHOqghJFh+zYOWxrUwLl6QXGGI+orYBmZMbdfnzw4ZRR+yBdXDC8fB5pjF5srYQux9hQMrEI8PDtrera7+KP/YXvUG/3l1NzoTl+fxU7IeRmrhzq7ezni9xP0LyXxNhlEllTVUlsmF3LfRzDEtHoqAB+VHQbFaxfGKe0lmAcFCdNVyXkkyepb8tbUWfhy05LYOdXz1J9KgbQLSWEmGcktG6izrdZQi7VhqlL31RltS/fkaTos2gdzB7xKYcrdt/OhPjW6JCcDgc4c1ilRBPVWu19bs4ctI9UbfDFSS/0HolVhbe4jbMjTwSc4pfnIWW3L5jSN6Dj/N8qkVX3geaXXuR1Y5R4Lm4d4kFL7rKfDm/Tls72/mVqESPYeDdUxeWD+UK1gS5W6pnyE6UF7T+z/g+8swX8DsLb+NqkApPczi0EwSncc7rN3Hxp0UTWnRe54O4D7NCUbMftClEwX71BIKVAFj7V5pmrF57TtXcrOXc+NYRDE3/0bKvaMOnFTIL1Oaotv6+qUYoHX8ddshTWJgOLyLioXMqAOc/gNo2WiD54HbEqOEcMhuNQGkISjVUydA6Rtx0uRjWHX0V2ZAl97GeEch4s4KfYsnBSJH+oqVZe41zGg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(376014)(366016)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emxiY2VWVWFZSTdJSW5VMTNJMXJoRlgwK0hsc2VYTzZLMitEUnVLaE9vV3BZ?=
 =?utf-8?B?VEt4cXp2MWlmZFlJRVFTRVlERWpNOGFla0t4OUJBM3NkU21CTks5czViYjJ4?=
 =?utf-8?B?NlYyd1FPUCsydWg2dEl2VTlqV01tTnZXWnNURlhkdi8yaU1MWjNXUTkyeFZz?=
 =?utf-8?B?YjMwZU5hd0Iwb05ycEtkQXBJZG03ektWemU3ZGx6MWpHSzFYWDUwZU9CMVBs?=
 =?utf-8?B?M0l5TFB2U0UyYTFZeWl5ai8rZHl0WUl1eHFFZThwam0zaTlGUzNpVkFpRUI1?=
 =?utf-8?B?RGNUWmFTY0g2dkRueXJuU293WWpBVEVhbE40a1Q5K2hteno4b3EwbkdkcFlT?=
 =?utf-8?B?Z1ZKUHJhdnRUOVBRVDlPQTRhenNjaEFiVjB2RlF3Y3d4SFVWYVRNd1h4VlMw?=
 =?utf-8?B?UW9yK0VLdE8wTWpNUVZ0MEF0MGdZRzNkV0dOWkQxdm1qNnJjQ052WURYMXRW?=
 =?utf-8?B?clpsT0ZMdjQvYjRuYVNXMTBrenMxYk0xTno1b09payt2VzdSOEtTOGlOOERH?=
 =?utf-8?B?ZXRWa1JRQ1BTQ2RYTEtDbkRpN1ZSNURrR2d3a1BsYnlNbmFIUy8yODRXOVQ4?=
 =?utf-8?B?QjBJb2dOcUQvb1VORDljSXlxR0NlY0tqMzJ3QmZFZzBhS082bHgxOVVNQURG?=
 =?utf-8?B?eEpWTGpkNHJCSmpBYURZOW1idG9jL0tQQUl2enRVY1A3bm9semZiVGhqY2k5?=
 =?utf-8?B?OTkvNUF6djFqRWU3QjlOV1FQT3ZSUFRIOVNZV1JRSWNiK0pLMUZwQ3dsY0kv?=
 =?utf-8?B?Z2F6Z1RubDkwSW5SQ21jaERlQ3I1NDg3R0VVRUcxUngranFqYzlySis2cWtW?=
 =?utf-8?B?emg1dDZiVGNTaHdRaThXeUJoa2hWYWFocGVDT3J0ZzJKeFRlU0FPZGc5dlB6?=
 =?utf-8?B?czJtRER4Smkyb0Fsbk9sYkRxeWMwNEtxT1ZmKzVVRGxyNDZNaUJUbFNGS2t5?=
 =?utf-8?B?a0dXNHRLY3IrNHpLc0ZGNlg4SDI4bEtwOTFyUjRMQmlSbHZURHhWcC9mTHlO?=
 =?utf-8?B?NDdiMHU3bjlFbHFSUDZOMUkwdUt0Q0xUSjQ3NkgzUEFQTU95WDIvR1duOVRN?=
 =?utf-8?B?Q1JscEhEL1IzSTBvbHBwdHlkaCs1MW9KMmJ3a1ZiY0JKZk1pWUU3bkkyT1lJ?=
 =?utf-8?B?VEpzOGhwYnhiSnlpSHZzOGhVZFhUQXkrRklhRlJHTGhQVkVUZHgwRmlrWjNo?=
 =?utf-8?B?VHVXcFc0cU5Md2x3TVFoblA5SXZCakFDRDlMK3dVTHpQL3RvVXpXVi8zcDFp?=
 =?utf-8?B?clJ3ckRIY2RhelFrc091d09NeHBGbzhIbnpLcVFuTGxKaklvdzlyWDd5cmY4?=
 =?utf-8?B?dFRDZmxkU285SjlyRFJJZnRzeFY4cU1qdjU2Q3I4SUszLzBDWlovMUJkZGgz?=
 =?utf-8?B?VENXWVEwVUJCb2s5WUpNQnA5VlR5QkdmZVp6M1lNVFBtUmZNWWFGZXRGRGJM?=
 =?utf-8?B?eTJ5KzAyK3k4TTZTNzhzZU5qRlhjSVFRVXhCS1lSajNkOHE2ODZvSXQ3MFFh?=
 =?utf-8?B?THpsaFhNVkpPajhvRXFRUjZVV1M5b2lweXpYdzgrdGUvcmd0ampGcmxNVDNj?=
 =?utf-8?B?QnpiOVlJQ0p3K2lVbUp4b0g5ZTZla1lFN0w1T0Z5Z2l4cDVuVDlIT1pRbk1n?=
 =?utf-8?B?VGl0Vzlmc2dReXNiNXh0ekowZ3V5aFgycjVDalo4TjN0MHZtVXBQNjN5TitE?=
 =?utf-8?B?N0cxNmxYeTJoRWF4SEhDdnVEaTN4S0JEenlMR0JpQnZRV01oR3JVTVM5YXE4?=
 =?utf-8?B?OGdmVU5UT1FSUFFTZ0tBTzZCRjN2dlBYNlVnWmREQTBuOHdCTllwTkN2dVcx?=
 =?utf-8?B?VHZ3N1lFMkE2TkNOZkxmc2dmdkVvdHhKc2RRR3JGVFJwS3ZaV0dScG9mb3lH?=
 =?utf-8?B?cm1EN2d1d3Eyaks4ak1mR3VrbHJlUFlWd1VYK1lJMnRnRU1PSGJTdStMTXhx?=
 =?utf-8?B?VzV4N2s5akhFVUxQcXU2Y21mbjFFMW9UTXFabXlSL3dmY0VQNURMcitRKy80?=
 =?utf-8?B?ZmxOT0R0L0pLdktzclRQWFkzUy8wb0VQRnhQMFMvR3FXTy9BYXpRWjl2VGQz?=
 =?utf-8?B?eVMrYnIrbjlENDdGV2ZoWW9mMzlLb25lakhHU3V3KzBTTkV4K0daL2pRTEdy?=
 =?utf-8?B?OHBVa20rVUk0YS9Qam9FZm9FWXp6STZYWklhL3lCeVVGb3Y3b1RlVGRSc0Ir?=
 =?utf-8?B?eEpzQ2pwSnQvaEl4ZERERzdDeUgzRXdxb1Z6OFRuR3psUzdPWnlZRWR0eFVQ?=
 =?utf-8?B?NHBhcUhwUzZVMUpHNGNaS3N5WUo0dDlpWldDTXVvcDJzOUxSc0ZNbDZkc3dr?=
 =?utf-8?B?Q0dQRGd5RnN1ZkNGeUhRdVFmUzYxMTk5bUJtVDlCeGNnQ09lL2N3QT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c20d004-9ea3-47cf-a947-08ded8c3310b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 05:23:18.8444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8IspIc0JnXBzdjGqiIVAmck+pS9Gb9G+5Kom2GYHCoNfu2ojpEQgDKDtK6yyOMzzHbJPZx1apKKv/jS4A8jmnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_222335_276247_4A437C9A 
X-CRM114-Status: GOOD (  22.16  )
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

On 5/20/26 14:24, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> ABMC, mbm_event mode, has a helper resctrl_arch_config_cntr() for changing
> the mapping between 'cntr_id' and a CLOSID/RMID pair.
> 
> Add the helper.
> 
> For MPAM this is done by updating the mon->mbwu_idx_to_mon[] array, and as
> usual CDP means it needs doing in three different ways.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>

Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>

Please check following nits.

> ---
> Changes since new rfc:
> Mention mbm_event mode in commit message
> 
> Changes since v3:
> Warning bound (Sashiko)
> ---
>   drivers/resctrl/mpam_resctrl.c | 44 +++++++++++++++++++++++++++++-----
>   1 file changed, 38 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index a13eb232a19d..1f9a8ae157ca 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -127,12 +127,6 @@ void resctrl_arch_reset_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *d
>   {
>   }
>   
> -void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
> -			      enum resctrl_event_id evtid, u32 rmid, u32 closid,
> -			      u32 cntr_id, bool assign)
> -{
> -}
> -
>   int resctrl_arch_cntr_read(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
>   			   u32 unused, u32 rmid, int cntr_id,
>   			   enum resctrl_event_id eventid, u64 *val)
> @@ -1076,6 +1070,44 @@ static void mpam_resctrl_pick_counters(void)
>   	}
>   }
>   
> +static void __config_cntr(struct mpam_resctrl_mon *mon, u32 cntr_id,
> +			  enum resctrl_conf_type cdp_type, u32 closid, u32 rmid,
> +			  bool assign)
> +{
> +	u32 mbwu_idx, mon_idx = resctrl_get_config_index(cntr_id, cdp_type);

Nit:

Reuse resctrl_get_config_index() to get cntr_id->mon_idx which 
resctrl_get_config_index() handles closid:
/* For use by arch code to remap resctrl's smaller CDP CLOSID range */
static inline u32 resctrl_get_config_index(u32 closid,
                                            enum resctrl_conf_type type)

Logically it's correct. It's just a little confusing when reading it.

Maybe adding a comment to make reading easier?
+       /* Same CDP index remap as closid; maps cntr_id to 
assigned_counters[]. */

But it's up to you.

> +
> +	WARN_ON_ONCE(mon_idx >= l3_num_allocated_mbwu);> +
> +	closid = resctrl_get_config_index(closid, cdp_type);
> +	mbwu_idx = resctrl_arch_rmid_idx_encode(closid, rmid);
> +
> +	if (assign)
> +		mon->mbwu_idx_to_mon[mbwu_idx] = mon->assigned_counters[mon_idx];
> +	else
> +		mon->mbwu_idx_to_mon[mbwu_idx] = -1;
> +}
> +
> +void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
> +			      enum resctrl_event_id evtid, u32 rmid, u32 closid,
> +			      u32 cntr_id, bool assign)
> +{
> +	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[evtid];

Add a sanity checking on evtid == QOS_L3_MBM_TOTAL_EVENT_ID here? To 
make sure this helper is not for llc occupancy event. And the sanity 
checking matches other functions in mpam_resctrl.c.

> +
> +	if (!mon->mbwu_idx_to_mon || !mon->assigned_counters) {
> +		pr_debug("monitor arrays not allocated\n");
> +		return;
> +	}
> +
> +	if (cdp_enabled) {
> +		__config_cntr(mon, cntr_id, CDP_CODE, closid, rmid, assign);
> +		__config_cntr(mon, cntr_id, CDP_DATA, closid, rmid, assign);
> +	} else {
> +		__config_cntr(mon, cntr_id, CDP_NONE, closid, rmid, assign);
> +	}
> +
> +	resctrl_arch_reset_rmid(r, d, closid, rmid, evtid);
> +}
> +
>   static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
>   {
>   	struct mpam_class *class = res->class;

Thanks.

-Fenghua

