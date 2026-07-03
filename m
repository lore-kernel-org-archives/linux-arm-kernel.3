Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDD0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 06:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZPJOlv/FEKtgyGxqhKcXf2nQb2n1/s73ufxaVh1SlyY=; b=0oJTncdSK1vhR69Iq1esy2GcRL
	GIaRPyxm/HbbwwtEFXZvL4pPZXIZXHFR0Xnsb6naK23L4yeMO0UDiafOBzH729/ETxVj90JRv5JJ+
	xZKGKnZ2HX7PKAAJC3TM3mTi7iJi5i+6UgaOSVawAmnM26vGQHgsjTRZlfh4ylAWuTj3hiVqGesEd
	OSiDyEfasZgSsewmdWGM//BQqbmWLZmY0LI8aYZuH6oSc3ybJj9+4c+uuOX8L/SW55/O6/tTDpJmg
	fxaG42XIusZd1BmlBLmRqyVFwv9rBnXCL9quLeIeW43Ax1cBe8lrHDZxfc2u4oOUQ5xFTR4S0DoQB
	FDmhCmFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfWUW-000000064Lp-3t2p;
	Fri, 03 Jul 2026 05:31:08 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfWUU-000000064KZ-2ezJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 05:31:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ubeapTyKyTLr9PNI1U7+9GNndxJhgrf6gJpwW72ViOiVDgXRp8vhyG2xsNkMCqlwTIRn8dpvc+OAZgIgR7xIBTeEAyRvM3pOw0cLuhMtE4YgIKo7FnDO6mnqb+UscZILc2XpYkiivBZAvYrq17s39eGojMJGalKAEBXsx6ZZKQls1z4rTJF/0naD+QJjnjl7XxLkf7h8309MSYZsziNcgsK0tAi1VtdwpA/fM/0htHhGupBuVRby3BRv5V6I3p0QRk1Dkmedmhbw4fdNVm5r6tZQMc6GOA10PFRCTeBXzS1Cbyu66bCJFcVMs02tgOSP/GMJOAuB3sYaNXbTXkoLUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPJOlv/FEKtgyGxqhKcXf2nQb2n1/s73ufxaVh1SlyY=;
 b=CB+9neyjsygNjY5rhh9TTIMrTBbyIDHixRdq/xTevkUTJeZirCJrmNmnTujiN5g2ShNYbD5Z8jaWOl/Wbb+jFgEOKK2SpWxEFyQJOdu7CnQXBFSCxRWVyVPWMLRvU/AIxUn9wWKrD0Q/c2sSzRcOv1xQwkE5y5zkWlCQ+orFojSTdBSS7jabAlSaoU7ZxPPp0zf9JElRZ/wJeDK0Oo/v0CKhcBhp68s4ujZGhAceKwuDAdT2P0jU9Q3MrHoCbbw3F1xNmkfwJY1cLoJCRLQsbhPZKV9p4mqe6fNzB1KxqCa4UyNJNJh+QJ6UTYa+Dt2tEZO5p6nhmXb0be99zTzy6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPJOlv/FEKtgyGxqhKcXf2nQb2n1/s73ufxaVh1SlyY=;
 b=UmclCZv/RBMGcC1QusvdUinydZIxdbgFS7/G0UrWh2PSJXkPIlYDY12iJRXw0T9RLlqSA32X2ftj3n35wM6WOJXZDPA7UTldH2Hmpef7UC/apjXdaMIr8UmQXQz21K/mt0DIe49ZW8kFpEUumIKupQEs/03B6vQk2yhcvwN8n63QA7zXc4eV0cRE1PXHGW/K6bnVAInCfWWP6tWR7e8tl+hYCyzG3QhAamTrmjBmijGbzagBd2Dam6JP4xA1r01BKPsV1/Yxtd5XoIoatAZrX8erVXfMMSJrpnXskanukE36i0FwZrUlimw6ApgsL8anTfZq9lKf6AV7qrx8cMpDMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by DM4PR12MB5986.namprd12.prod.outlook.com (2603:10b6:8:69::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Fri, 3 Jul
 2026 05:30:56 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%4]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 05:30:56 +0000
Message-ID: <e8239a83-bdc7-4702-8f2d-8c639fcaea59@nvidia.com>
Date: Thu, 2 Jul 2026 22:30:53 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] arm_mpam: resctrl: Pre-allocate assignable
 monitors
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
 x86@kernel.org
References: <20260520212458.1797221-1-ben.horgan@arm.com>
 <20260520212458.1797221-3-ben.horgan@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20260520212458.1797221-3-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0148.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::33) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|DM4PR12MB5986:EE_
X-MS-Office365-Filtering-Correlation-Id: 594442d1-e4d8-4966-902c-08ded8c44193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|56012099006|6133799003|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: svRzr+JVqTgrIY/QfENZBiqGrgqcqmDKFAqOyV83uzfppkKmdcug4QDGOHgwtKgCG/qW1BOI+SDzcFvjM42TPf3cjarKBD4fyU1wWBvwj4IAekXG/Dp2fhq74h+sQjNiAG8BMlkDAQP5JWSsZXv0dfGg68GaU0LNrmq7fDl/mhMPWjilKkG8NAHNq4BAXfbecldesZtjB4u3dAVNjXP+ylckMcWMP6uBhZKdPlCA9xGIo3mMavmaVWFb6u/GdCb9o5UOqVW4LjB7VWs74ktNqO+1V7fYAj9JRX22SiFJZ6qAttuRoSbeg8uULnqn+esnhjkaRkAZmdfgTcsDRHSS6MWGAa0fSACWzZ1eSQtDxIhxg3PySmnhqcqdrimzVjlaGtKDX8uR9HB61hIY4ITcxxT/tQ4mt/krb9cyqFJk5WPwKf6T39Kf409Wzs2Ntfye8mPXbbBIDhf5iGm2NFUaF+I9Mcd+Y7j9BjOar31AADOlbSnNlCH/Zm45DYE2ORjffBnrjdA0WHXow6wl3bk8ugfjAVbWf4CkIcfa1mMLyudBhpMw4+P8m1t9j1SctkwbZ1qUEniZdIP82UVjGL7/T0Aa17O5GeZ/KU3axzGMEP9kFssMyVgi6u7nxp5tnLoUdf6gEZeobMatpFmhndn2b7YiI71EpnBzoZeTGt6Qzzo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(56012099006)(6133799003)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmpleDVXakpjTTJ0ZGs5bFFmejd1TVo0SVRpcnU1b3ZLZEtSUkpkZnQ4azRU?=
 =?utf-8?B?RmphNk5aWWVSTnlORnBTTG5BeTBxbzR1NXp0bXhzc01KaDJJaE1CTVkxS1cw?=
 =?utf-8?B?THlQV1ZMdk5PUkNSTlJyUlNVUUFaL3hVNmZxYksvem5MUEo3bGhEMlR3S2Y1?=
 =?utf-8?B?U0JBNzVSMlVwN0locldQamNJOXZkWWdWQm1RUDI0UFpYUW82RTNNWVRlSFRq?=
 =?utf-8?B?T2dyYUNVWWd6RlYvaEZZSDFVSE80UWxFRmhjNE9xamxkSEJaRUNlSWhsemI0?=
 =?utf-8?B?OC9sMDBYa0gzYW5lZFBTRkticTd5UHUzekw3YzlyVWtoSVZsTTFFVEVDMVIv?=
 =?utf-8?B?TGE4b2JxVEpqUzk0T1Rrb1RJM2JTOUNkL05xUU5oczh5WFB1RjlQT2ZRa3h1?=
 =?utf-8?B?L1BFbWg2RkZ5MXFieVExdlQ5dkxCWDJLRjlMc0xNbC9ZUFIwdmxrcyszQlZa?=
 =?utf-8?B?VVRKM0dnWHBGaW5qTVlFVG5OZ05pQVB3eVBuTkEvZnVVNTBLc1c1M2Z5UTBr?=
 =?utf-8?B?SXFHVm1MMkZ1azFxcWw4cjA3d3pEUWZuMk9LTUgrSzA2KzM1UUhxcDljU09J?=
 =?utf-8?B?SHd5SXl0NHdSRTVYTi9WWmd6MVdubVhqY1d5ZjZLcU5JVHdTd0JXc2gwVWF0?=
 =?utf-8?B?em1rdXlnRW1sd01Yai91YVJvNDJrOHV1QTB6WUNaWkFtK2VXUEVlZVZOYTJW?=
 =?utf-8?B?MmsrMG1zYS8xdElrWjVYTlJVZUhPc1NzR3JMNmtlRUdubVgySm1ZeXlmcWpE?=
 =?utf-8?B?VHo3Vk5wZkdpY2FBNmhmcXlsUHdDWVJneXNIemozTDNkSE5SbTdOYjdtN2Jy?=
 =?utf-8?B?a2ZlMVNnRHpGMitKY3hkUUZtUXNaZUFySnhINTlJTC9EZDA3Z0FGb3MzVmZm?=
 =?utf-8?B?WHRhQmhOSC9WSHZ0S1NaeU12QUtmMnFZWDNJV1ZqV2hJZmlhd04yblBQVXBm?=
 =?utf-8?B?UHRCRE90TmZnT1lIcS9taTRYcE5MMU9DaFd2eG5lbVRDZmNkVkU1M2FKaFJF?=
 =?utf-8?B?NThDRzRyYTlGQWxNdlFFbjNzdDlWdXBHUGh5VzZtSDdwVTY1RXFaT0tmenFz?=
 =?utf-8?B?ZGgwL0J4eUVLaHdFTkFRYXQ1QlFWZTFIUitaMGVFRkdFQ0RxRjFGeUwvRlly?=
 =?utf-8?B?NVoyVzBqMi9HOTNKVzlpa2djQVIyU2hoRUQvRkNUZ25WbmZSVHB4amZKSVhT?=
 =?utf-8?B?b2dVQVJsZEtOMmw0aXB6Mld5bVhSTXQvZ21COTJiMVdkemVob0Ftd1d4aklr?=
 =?utf-8?B?T2RFSjNxNThiaVNmVUdhWUNRVnc0ZWs1cEVJd05rdlpSSTlpSmhpL0Y3dVJn?=
 =?utf-8?B?TDNNMkx6VTM0YjhLWXhCQW4wU3NTSVBVT0pLeDlOL0Z2U2UrVWQ1UFJ0eFNU?=
 =?utf-8?B?d1pwSEUraDlDWmpuOUlGdTlmeXhmOGw3RFZoSzc3eDFoTnBvS244bDlFcXI1?=
 =?utf-8?B?aGFEZmkzZy9JVGNFbXc4REE4Q0F0bDFDQmd6U1Rmb2hoNzZqc0pGNHAvNFhD?=
 =?utf-8?B?Y3M0anEyR2k0bVczeldCN3FJdzJEVDRGVEdNN0JFMDYvRm5UOGxxY2pQZk5U?=
 =?utf-8?B?TEFyL2VETUVKcUdIeWxSZlZLVi9MWkVyUS9kWk5vbGxBQXZpdGRYa2hSL0Q3?=
 =?utf-8?B?Z2tFdEV5NWZQTTM3bGR5SXJOT2gyOU52WStXVE1QVjZudkpWTDlpeUc4NVYx?=
 =?utf-8?B?K1k2SE9Rb0w1YitiUm95OGZKaDVZZ3huZ3RvMEN2Qk9Ma2lTdFBSdzRKNG5i?=
 =?utf-8?B?dm9wRVdqb0dXTUk3ejMrdS9EN0ttUDZCcUV3Tm5vSVVydjlmWXNoWWMvNVdJ?=
 =?utf-8?B?dzJBN1RrUkxMOXdFV0J1anN2ZFBOMVAyWXo2bmtSTFI5REVFK3pUaGQ2UVJj?=
 =?utf-8?B?eTdTRmp2L0RtNnhsL3NvQ0ZwbytpZ241cktGa3F4VGZwbDVRa3NXTTBodzQ1?=
 =?utf-8?B?VzhZdENRb2QvTXhIa0cyL1Jzbk9MRFQ2TnNGM0lLYms1OXUxdEpkblZIcFp0?=
 =?utf-8?B?d1lpWmxjY1o1K3lodkt6T2tFMXpwUGM3b2Z2NUNQSUd6b0xNczZXaWRoeXRk?=
 =?utf-8?B?T1hVc3BKYmppSENOOTgxSnY0M01ITVpUb1YvUjdCT0FyYXFUR3ZkYjlMQ0pZ?=
 =?utf-8?B?bzhLZExhMlZXWWVOMjQvbytBaU41ZWE0UTl6bStHa3JjdlUvejdLd05FeHk4?=
 =?utf-8?B?R1I4eDNNQUV4S3Nia0I4ZlB2aVlVeTVLZ1NiOXlVTElKalpyZEpTWWtYNzJ4?=
 =?utf-8?B?MmVQWXkyS0hzQTJKb1EvRmM2bzNoeTJWYlFBR3hCY2lOZmloOEEycGlBQlNh?=
 =?utf-8?B?M1lnSTFqVlFDQm1XS3JMZ0dyNFN0UytwU2VibzZURDF4QmtEd2h0UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 594442d1-e4d8-4966-902c-08ded8c44193
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 05:30:56.0534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZmJx68Yr4D+EEDDtk7SiAHVeid77CgR5j1Hq7h59iVIWXFkjfLTVqy/9pogyBeBAxMcgSj1LUrXdu/kMt0Sv0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5986
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_223106_703878_EC4B1472 
X-CRM114-Status: GOOD (  26.60  )
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
> MPAM is able to emulate ABMC, i.e. mbm_event mode, by making memory
> bandwidth monitors assignable. Rather than supporting the 'default'
> mbm_assign_mode always use 'mbm_event' mode even if there are sufficient
> memory bandwidth monitors. The per monitor event configuration is only
> provided by resctrl when in 'mbm_event' mode and so only allowing
> 'mbm_event' mode will make it easier to support per-monitor event
> configuration for MPAM. For the moment, the only event supported is
> mbm_total_event with no bandwidth type configuration. The 'mbm_assign_mode'
> file will still show 'default' when there is no support for memory
> bandwidth monitoring.
> 
> The monitors need to be allocated from the driver, and mapped to whichever
> control/monitor group resctrl wants to use them with.
> 
> Add a second array to hold the monitor values indexed by resctrl's cntr_id.
> 
> When CDP is in use, two monitors are needed so the available number of
> counters halves. Platforms with one monitor will have zero monitors when
> CDP is in use.
> 
> Co-developed-by: James Morse <james.morse@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>

Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>

Please check the following nit.

> ---
> Changes since rfc v1:
> abmc enabled even if enough counters
> Helpers from dropped free running commits
> carry on with zero counters if using cdp
> set config bits
> use kmalloc_objs
> drop tags for rework
> Configure mbm_cntr_configurable, mbm_cntr_assign_fixed
> 
> Changes since rfc v2:
> Don't set mon->assigned_counters to an error pointer
> Fix mpam_resctrl_teardown_mon()
> Remove free running check
> Separate cleanup allocations, e.g. __free(), from the rest
> Restrict scope on err in mpam_resctrl_monitor_init()
> 
> Changes since v3:
> Correct NULL check in mpam_resctrl_teardown_mon() (Shaopeng)
> variable allocation ordering in mpam_resctrl_pick_domain_id() (Shaopeng)
> Move mon.* assignments from mpam_resctrl_monitor_sync_abmc_vals()
> to mpam_resctrl_monitor_init_abmc() counters (Sashiko)
> use kvmalloc_obj() for allocations that may be big on some
> platforms (Sashiko)
> ---
>   drivers/resctrl/mpam_internal.h |   6 +-
>   drivers/resctrl/mpam_resctrl.c  | 139 +++++++++++++++++++++++++++++++-
>   2 files changed, 141 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 1914aefdcba9..7a166b395b5a 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -411,7 +411,11 @@ struct mpam_resctrl_res {
>   struct mpam_resctrl_mon {
>   	struct mpam_class	*class;
>   
> -	/* per-class data that resctrl needs will live here */
> +	/* Array of allocated MBWU monitors, indexed by (closid, rmid). */
> +	int			*mbwu_idx_to_mon;
> +
> +	/* Array of assigned MBWU monitors, indexed by idx argument. */

Nit:

"idx argument" is unclear and confusing. The idx is actually cntr_id 
coming from resctrl.

Is it better s/index by idx argument/indexed by resctrl's cntr_id/?

You mentioned "indexed by resctrl's cntr_id" in the commit message 
already. I think it's clearer than simple "idx argument".

> +	int			*assigned_counters;
>   };
>  
[SNIP]

Thanks.

-Fenghua

