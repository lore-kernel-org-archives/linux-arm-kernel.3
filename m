Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5E5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iplcuTTPRwSnozuQb7SS/0EMqEkId1i2Qpz8+GM7fVg=; b=S/8RXbMIg251OYSqs5PVfIKA09
	by+CNkTPB2pe8d0U5Zswu0ACuI0ZHhfe3nTo9cNAPKDTCJiXsvDGGIRGfc9s5Ie7yvn8jSX6Qw6cr
	jhKJ5RvexA107/kA2VrcfeH/WoQJFEuGWBpuDKTJlbRdM/hdnmQdoqWBHesZ07zecxtRFdqbs8bfc
	hp9F+an72OLdhk5ja/LDUQxsnSYmm6fJIqEqfXjKKTAUd+uSV++0eeh+C0UUlCZrrQSslywebs1NS
	QmtUZDDE514oUBhuu+1xiQy1CA99JvGza9GVUOD1qQHb3iVifkb2nP3ovpbKhnqHMtx5gc1byN3+m
	OlSJUOFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKJh-000000050xK-1Byo;
	Thu, 02 Jul 2026 16:31:09 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKJd-000000050we-2td5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:31:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YrzgtmOuydRWuxwa+hYoNLOOZpb/yMMGdZVCTbf+wgh6I/PHK084PyjAykPSbZf+3nSLtSppmrW7VCMWLuDNAMPQH1Wn+XZxZ5llAoAPJvFeuv6x1qmw1+4hV7nAdkmm+FEQVR/o4exA3Qn474o+kqZDoBLoruZ/nBcFdOYbC7HyLdiD7ejjcU+Vm+G/wOMw6fkZcKq+Y/c27swUSArLBUlDJFhu4IS2a5JnZHmt+BxiPws8y+fYofDo4+YS/3rov61VFUV2ihXMPRpMiMRm8MT6bkHOSzYCmu0kLb2JgPe249E+pF6Z/UU5Ma+nO55dhTamyCKQ9e5Y234KFEXD3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iplcuTTPRwSnozuQb7SS/0EMqEkId1i2Qpz8+GM7fVg=;
 b=BjAA1Y23OILTDcLF3abz1ECf7dUQscWe7VnAQleB21M1QJN5Ep5CyCles2HwT56k5rfdqICsWFeUdcyT/QVnzndxmKI1udMx+VH1j8whn7u23KwGV17t2ojkvqRcxOcw2st6tIWocfF2/TtL9cgMnftlFP/LJIMA+/RBmqnG3k3D4DaOxhgIaMhdnibc1TC28VHe1TeENYk/kgT0vyHW6xVhfWf29sIyeuiXUmMwWVADq8CHzXw3RsRWWJUeNdguGHgEVkr2GBiPuui+ZPSEDsNnFxnYyyl/93WIvDG3zQaiVnG1BE5eVF1fYzN6pIVb4afNbHk3sJIaip/Keuny1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iplcuTTPRwSnozuQb7SS/0EMqEkId1i2Qpz8+GM7fVg=;
 b=fMBcDdAPfIYNV+K0aMiJpVDhwWZdm+/ou/iMI5nqQZ6u2jNocv/5Gb61EDPnotyNCUyNMoaZkH6NCL3qz5FdrPpusyuDf8w5xcy4gG/u9bKkCA89Om0GNE8N449AoNDnBgP3I75KpzNMZwQovkJ3zkiNlM+RWM08TYnvOElCrNWvzQ5LT1XJpPqKFB6w8BMcLJByK84X3aLiWGJI9QUVW+bESOT8t6GBdCSQhb6c27Y9d/HAtA9VIHk1E1wlZpXRbLYmmXLE7tfEY6LNzP5p6CBF4C6rUpMHFqGv0ZIRL1RHREpmbUa+62LBmvAyndKH+PNNuD7JvrrD0OpgqStvIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by PH7PR12MB8427.namprd12.prod.outlook.com (2603:10b6:510:242::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 16:30:52 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%4]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 16:30:52 +0000
Message-ID: <887e73b3-a3ec-419e-9583-6a2c288106f2@nvidia.com>
Date: Thu, 2 Jul 2026 09:30:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] arm_mpam: resctrl: Pick classes for use as MBM
 counters
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
 x86@kernel.org, Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260520212458.1797221-1-ben.horgan@arm.com>
 <20260520212458.1797221-2-ben.horgan@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20260520212458.1797221-2-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::21) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|PH7PR12MB8427:EE_
X-MS-Office365-Filtering-Correlation-Id: 5205e131-f0b0-4d82-8cd9-08ded85747cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|56012099006|22082099003|11063799006|4143699003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: rsc5hbxs8I3gQpuYCuKcXXD2dX/NiGFP7bMwWBVB57//hhMQmvfQU/dln/dmO3TMLKWwJfdfT5b3dXifu2BSqg29w9kuSp8IPFXkFbPtvdt8t4dx2AUW7ud9I+TElJIRDjvB7XUD5wjwXocD2wvq0i1mDdJGyuRkdPieErQwpKe1PivHU472yo8CNXvjNFv5JNhiE2420jrn3l0guD4aFszzkMDkD874YB57O9RN4u5cvJcsgZjLVmDbWGs+efvOD/p7WGZOsf12pCuSmfrTWM9SSOCz/ZoS51yHEKQH8dP1zHPfnYwhpQKQJx/9U3aNtiSIvwW16FQfSy+U/RHK2OUc+tbyg3AcP8z3Pzb/igyh8rj5a94wAdnooRBoPgS6RvYhUcsTEqNbPoCV1t01nVy40YS/qNvEXKoBeNJgfFNLeQL7hIjBRLK+ShFpD7Fz/UDWW8mNcTk3o846+BQ5lNwxPilsQDTIC2Nz1DIoOdqXsoLTlAUj144EJ1Z9cpNZ/ItW1uZoyUyA376JI7fLElOkXz/7p8Y5ia22DSEHlanEyIil4kbIoCLIHnEuMUNfiCCxbTYrosWelgY7P4yqkDTJRqwrOFubX4Jh5Ji8nFDc7IygfdJsWYAQFXh6PuBIhDTPITSHp2bnSPdr6vGTmx1ob6IhkeU3Ksi9CVmRp8Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(56012099006)(22082099003)(11063799006)(4143699003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHVKcjRIYTdzU2N4V2g0NzcyRHBvWmtOOHhQU3B0QmR5dzJFZWxRelN6cW12?=
 =?utf-8?B?WjUvQk10SXFnSEJzYk5TVzFPMEVsNjVVTjA5VEtla0pFa0dCbU9tWHM5QVB0?=
 =?utf-8?B?MFdjb3h5T1d4T0tKeXptU0lqSzhtVTlqUUJpeUYyd2ROMENUYWhPTWozcERq?=
 =?utf-8?B?ViszcDlndGZjVlJWTW8xTUZxUG1pa3VnWGxVcnBTb1JCb0FxYm1QSXVldHgr?=
 =?utf-8?B?ZmlUcTRCR3FZSWhPZWtHdWNRam80dTZLUnhLdW43QUloMk5ZTlZpN2VXVVN6?=
 =?utf-8?B?cGtNN2l0ZExFMnhaTVhxTnR2Mk81b250RUd6ekptT29DcW9FcEFMVXVYU09i?=
 =?utf-8?B?a0dSdyt5Q2pOTmlucjdCOXU0WTRPZEZwTUQ2bXFodzV1UWJpRitsT3VYMnY4?=
 =?utf-8?B?OXJhNEM1R25aNE9VT1g3Y3Z3UWVxVkphbU5rcmFlaXpNT2xCZW1kTDAxcUVW?=
 =?utf-8?B?ejh0NjB1VWNDcGtuVWZsY3Z2WHpzZEcvSUxoZDRRYUlGSUxDdEZVTTB3Wm1C?=
 =?utf-8?B?eXhmbXk1QkNtMU5udjkvditwcXpvUnNES3BwaGpzRVpmTElyemt4SThRdUJh?=
 =?utf-8?B?aWtKZ0lEaEQ1MjZyajFHRHN5blZ2WmV2cmw4cThJbUVhNFprWFlQRmFLb0Yx?=
 =?utf-8?B?d3krc2ZwbnBvWitYTmYvTHVOM09rWmpDRlhEV3JOL2Z1emRCVllMdnJTV01V?=
 =?utf-8?B?bUgxQUFRU1grSXVHNVlFT3BFMmZDOUY1OTBSYWFidGlrWHp5NitQT3pvWFNz?=
 =?utf-8?B?dkZJNld0Y2dVQmloOFc4VTY2d1ZxSXFOaDhaQmdUa0x4dkNHOUp6dmFtTjZE?=
 =?utf-8?B?a1E0QkNsZ0krbzJlQUFzdWJTTHhCV2oyZGR3M1dRUVQyNDlMMDRSUkJEMzIw?=
 =?utf-8?B?aUZheER6NnNEU2dqRUo1Z0dUQTZ0bG4wOFVWdW1KMnhic3NtY05GcGFPZ1R4?=
 =?utf-8?B?T3h0ZXBEUHcvTnVWT1VMaElCcFNzNmFhS2svd0NYdG00T3g1ZS9JS3h3YjJa?=
 =?utf-8?B?UXhITTJLV0l2MFlOclpaZ2o2eVpQbjNMVHErc1ZwOUJndFBWUDlLcFFpYnZa?=
 =?utf-8?B?M1RNSCtMQ0dneUdzcEJDbDlZRnhHR2hOQ0xtcENXNzNsbnY1OHZtZk42Y256?=
 =?utf-8?B?WnFUT1JvZENDQjVxcW8wdlIyNjVpT0xYVnN4TnliaVhEYjllWEc3VmdMM2Q2?=
 =?utf-8?B?NWhGeXRlK3M3NXVYZmc4d2ltd0FqeGJaRUhxOUJUNjB0Z3dsVmpWV0Y2WSt2?=
 =?utf-8?B?WWJicmhKd3EzTzk5b2xKVEJHalVhd3JZWjJDMTduRVFMRjhPb090QXYydFVL?=
 =?utf-8?B?MlZrT09aUWdFcERZbXcvc0wralVvRjJaelp5cHRyaTRMV1pVNUNGQVNsMS9r?=
 =?utf-8?B?T1VvRnJydHRnRkpWZm1YOGwzVlhCZmdRT3ZMYUxtb1hCNjMxRFROU3RBdVFs?=
 =?utf-8?B?SUVZQ21oM1piL1BKSnBuNnY3Q1VUQngzcitJbUoySmorMDRGWTE1VkhvSGg5?=
 =?utf-8?B?Q0NraUk5Ynl4T3NvVEpJblhyQ1loNVk1dVd4SkJEQnYveUpuNSs3Q0trWk1O?=
 =?utf-8?B?c0VMN0FFL0h0VVhES3NwRkxMY3luMDJZVmFXdFlWS3FlbkJtU1BOUHpyaENZ?=
 =?utf-8?B?akM2cFZjb01kcGNMbkxvd09mUWhDS0pjL0lCTFh4TXRTcEtvS3BmVm45WURD?=
 =?utf-8?B?Vk5YMjFQckZweEpFMnlJTkZWMHdEVEVidHVVM2NuekQ5Sm05NkJHT1Q1VFRH?=
 =?utf-8?B?UU8rb0N5NHAwUG50VVZXTEJOeE13dlFaeFI4ZXNjLzE0ckN4L0JETFFWS1JM?=
 =?utf-8?B?NjVOUm9tdnZOK3ZVaVBjcjRIMUdHRGVWUGJNQWIwRFE3dkx5STArS05rSmN5?=
 =?utf-8?B?WXdTdzRnSWZpbHVqNnB2YTZ1cm9sZlpwWDF5djAxV0FJUDlsb0EzWjRJQWRT?=
 =?utf-8?B?aTIvMmFFQXpuc0VNck9OdFNDd1UzWXpNZW1sU0RuUE14T3Z0amk4c2dZeUNG?=
 =?utf-8?B?amd5Y1E4dzRjc0lEYU4xbC9UWVNPc1pLck14UVpRZFZXK2RSM0lPTE4vZUVD?=
 =?utf-8?B?WStaSHJWZS9RZVVyV0hVdnhhcExtM3p1TVkyRmVDRjR5YVJzb2M5blVGdVV6?=
 =?utf-8?B?Vlgzb2pydlE0alB5cDhhYjdnc1FHa1hJQlAvUU1pL1Z3bU9iY1YzSWdZb2xO?=
 =?utf-8?B?TTgySm5maklOZUM5ZHdIaWprTUxHakFrUTZEYmkrM2NxNXFGa1hwaWt5VWxO?=
 =?utf-8?B?YUNmZTFaWlREL1dCb2ZFaTNjVUM3KzRRM3E1LzdTcXNZM0t0UEcxanpSb2V4?=
 =?utf-8?B?R3lNWU9GdjZDNE9QNVh6VVorQnJWVFlUR3RKdWVvQlI4VjNEU1N5Zz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5205e131-f0b0-4d82-8cd9-08ded85747cd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 16:30:51.3647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wevIFY2JG6Tbuisxrp3P/B2Z57b0LS7qSFbY8n6JyTA9FbBpIFP8UL6NMEfs5YwQ0IqOQHSNNdrNTg9i1+HYog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8427
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_093106_953330_13065E72 
X-CRM114-Status: GOOD (  27.79  )
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
> resctrl has two types of bandwidth counters, NUMA-local and global. MPAM
> can only count globally; either using MSC at the L3 cache or in the memory
> controllers. When global and local equate to the same thing continue just
> to call it global.
> 
> Pick the corresponding MPAM classes to back the MBM counters. As resctrl
> requires all monitors to be at the L3 cache, we can only use the counters
> at the memory controllers when they have the same topology as the L3 cache
> and the traffic they see if the same. In particular, for the bandwidth
> counters at the memory controllers to be exposed to resctrl it is required
> there is a single L3 cache and a single NUMA node as otherwise cross NUMA
> traffic will be counted at the wrong instance.
> 
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since rfc v1:
> Move finding any_mon_comp into monitor boilerplate patch
> Move mpam_resctrl_get_domain_from_cpu() into monitor boilerplate
> Remove free running check
> Trim commit message
> 
> Changes since v3:
> Extra paragraph in commit message
> ---
>   drivers/resctrl/mpam_resctrl.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 226ff6f532fa..f70fa65d39e4 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -606,6 +606,16 @@ static bool cache_has_usable_csu(struct mpam_class *class)
>   	return true;
>   }
>   
> +static bool class_has_usable_mbwu(struct mpam_class *class)
> +{
> +	struct mpam_props *cprops = &class->props;
> +
> +	if (!mpam_has_feature(mpam_feat_msmon_mbwu, cprops))
> +		return false;
> +
> +	return true;
> +}
> +
>   /*
>    * Calculate the worst-case percentage change from each implemented step
>    * in the control.
> @@ -983,6 +993,22 @@ static void mpam_resctrl_pick_counters(void)
>   				break;
>   			}
>   		}
> +
> +		if (class_has_usable_mbwu(class) &&
> +		    topology_matches_l3(class) &&
> +		    traffic_matches_l3(class)) {
> +			pr_debug("class %u has usable MBWU, and matches L3 topology and traffic\n",
> +				 class->level);
> +
> +			/*
> +			 * We can't distinguish traffic by destination so
> +			 * we don't know if it's staying on the same NUMA

This sentence makes me think counting only on mbm_total is a "software" 
limitation. In fact, it's a MPAM hardware feature (or limitation).

Maybe add a sentence like this to make it clear why mbm_total only comes 
from originally?

MPAM only provides one memory bandwidth usage value for each MSC that 
supports memory bandwidth usage . We can't distinguish traffic .."

> +			 * node. Hence, we can't calculate mbm_local except
> +			 * when we only have one L3 and it's equivalent to
> +			 * mbm_total and so always use mbm_total.
> +			 */
> +			counter_update_class(QOS_L3_MBM_TOTAL_EVENT_ID, class);
> +		}
>   	}
>   }
>   

Thanks.

-Fenghua

