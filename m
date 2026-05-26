Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923DFCD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 02:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+YTjvc0fUV3kn6SQcEw5IWdlWZ6UEyx9xAL7htsywg=; b=UMe9RKOlX8A1kIiW6dMNbN2KbV
	TOZDM3UwiFq2gFC1OCLZMGcqTafhLSk9pKWfW8fvnZCXHsfvbVkF7VgI8qmGzieZ9JWBJUUPtGXsw
	L7Wl6OD/xRUtAHr7FiluA2V/wN+6ChycFkLnzesnU2qup7me6HzeK6bujU/AsCzmNLLH3+XCO4fIH
	1Rgmzr3rUJ9EyRkyDu8MxfhyYpj3ggNCKkdFNeiOBqd0YCSpdGBavVxReK4Hqg0OPy5x9sFw5w5+c
	SA7BS1IA/xQcyxtPiI/LAKI/dVuCkmeodJzYRbY6aaB6jqs+W0NJz69n/keFAh8GVw5+WyK7QD0++
	C8q04gjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRhsp-00000000tGu-3h3Q;
	Tue, 26 May 2026 02:51:07 +0000
Received: from mail-eastus2azon11011031.outbound.protection.outlook.com ([52.101.57.31] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRhsm-00000000tFr-3x7R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 02:51:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dW+H+3QRLftJYhVjwE9BHHsRZascKCcU19fsfZAyL/nNDvbUwfF6ykQtcM/5AwjwVn88AvzW9AvF+G2Z3LzUcE9LdbuOwKVrRyFFE4Drji7eJwNkNugt6BHNSUguE/MA4/prgQgUeWOkBeIElEreLu+i+s66V9UgleDH9yWc4W0oy1qFKvNiVKM4XL1XlcN1putxObuOk/pIE7CoaSzNcwIIIDrepzJkw+srTfmEc9f+uwrUeJysBE7cfuYh9dPZgVX2iH+ZGCyn1flrs/6WZ4/Yyq6jLVRSLBkkR2jyakoMR1O/JSeeuXA7FiFARNiHaYEKvLrMvqGYuNqhZzIHvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+YTjvc0fUV3kn6SQcEw5IWdlWZ6UEyx9xAL7htsywg=;
 b=RDP4Hb4l0l0Ci0RQOw1v5QCK7vy44qfYeN+S8jDnTEM6SXXxBdpgBrEh8+qiyqu+xrbcLc0h+NxVt3adhQBl+sijLxIXcXIoSXbMGc0Ih/gSDHdzBEJnYGMmWVNGCg8eTsjUjJdW0DMdKtZ85PTyOcktU5gkKc/8Igo3yQLrm8DDHMO7NJxxJjfMBOLjA3bc4Kf5PQvLbPWZCjUp+q6qdjCUZvCplXdRfx8TFdjiBZWPMkNc192yjhppSVTq+zY8AfE0Dnt+Q28XtY0U0q499Et/0o/AeZ8yqWhd4lFYzFRQtBSyvYGO+0i0SS6T5Bmco2uRajtvvPpCp0abtnAL5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+YTjvc0fUV3kn6SQcEw5IWdlWZ6UEyx9xAL7htsywg=;
 b=WWnLRuK/qCTDmNOEtnaYo658stk9Sq6KAs3UbS74BYvPzLs0ghK4qbtkyqAMx85GP/tNfr0meRNTM5dpdxJS6QM7GpN+nuzI87K5sa5zN/ksP8ln5weggI9z1RaqrxmE0eEgL+mWV5pYyQJ+NJ5aOSLUM1KU9ojlq4T5zrpSQ4owDuil7iUYdNbJBRKWtibvYZ4kY+gqDQYzTXBv+fEJxSuJZqUFE15NKarFf+OkVh8eA2PkCU0OQhj+GAt+zA9qfmKzWVwBR9OYfdVmNSj9z2voS+bKFCUCeDDQ5F7XZ1+Wp5oY4SuBZxme6leRkl8fQr1EDG7Kboj38kHNdllvrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 (2603:10b6:610:2fc::17) by IA1PR12MB9500.namprd12.prod.outlook.com
 (2603:10b6:208:596::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Tue, 26 May
 2026 02:50:57 +0000
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688]) by CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688%5]) with mapi id 15.21.0071.010; Tue, 26 May 2026
 02:50:57 +0000
Message-ID: <1aea92be-0e7c-459c-a96c-5a54cea073ff@nvidia.com>
Date: Tue, 26 May 2026 10:50:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] arm_mpam: resctrl: Pre-allocate assignable
 monitors
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
 jic23@kernel.org, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, zengheng4@huawei.com,
 x86@kernel.org
References: <20260520212458.1797221-1-ben.horgan@arm.com>
 <20260520212458.1797221-3-ben.horgan@arm.com>
Content-Language: en-US
From: Koba Ko <kobak@nvidia.com>
In-Reply-To: <20260520212458.1797221-3-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KUZPR04CA0019.apcprd04.prod.outlook.com
 (2603:1096:d10:25::18) To CHXPR12MB999244.namprd12.prod.outlook.com
 (2603:10b6:610:2fc::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHXPR12MB999244:EE_|IA1PR12MB9500:EE_
X-MS-Office365-Filtering-Correlation-Id: 15799991-ad96-4fb9-461e-08debad19c67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|18002099003|22082099003|56012099003|11063799006|5023799004|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: 7QctG0N2BZwTnSrQhs8kTXoLWhPn4/jZk5jCX3i/eqZLad+lPiaOYfFiWzwvg8/5oRNfCBpuMFssB4XXUil046fY5t4rKmaVYPnEPbcq+OEOvd8/o3Bs/h51hreCZH/1UtpTaGNqCyrA3phHDaT08DTWZm4YG8X2hfnHZ4fQCHL+GVqfoLDpn5XbA/geMraq9Nnmu22MOhUJxlMxWo22uowvRDfNJVXfgCzfgWiM3A0OmmlzHCafTMclKGO9+JeqayCGTTOv6IFCWx5RdP+iwNgOLfW30PrRlBkfHAOOkO6Wowt8mPsI0SxY+x1ESbkZ3FeQyLpqrjd1KesAHJ9+Qo+m3+S2QjgvZTAqoC5Zp0nVRA53caP4aCwITcy5OQ5/WbyV7aBEdl2Z+V2jRwktZWlJXEo0wAiZ+9DSsBv0dfMlKko5ZTx9HGNX+MIByw540ymgg8004YrKu5kQVBsBesWjxf4jIh0jUIVDNHZ/Dz1662p841v3wFL0jqdwcuc7TbpZoSRkL5S6fy6/mNxDbNASe4TvwoCZPVYp3EToACSQq31jmHshEd1NFOaeJOrie1dAI3hgANxlzglpTymVSI8FdvHcUCPugPBerT2wwa3ujaqhP1deHWAfVNBT4FRs9de2SKGSt6oge2HPKNHuJaEq+qXiipNcmoP/O8+qS1W2cmw1/wHt/e8qY/sTJW/q
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHXPR12MB999244.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(18002099003)(22082099003)(56012099003)(11063799006)(5023799004)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTNFMzBFN0tsUGI5Tmp3Zlg2Y24ra1g3WlIybHdNem1mUEk1R3hJaWJHazM1?=
 =?utf-8?B?OE5HVDNpVVRBaUd2ZzdUUE5oL2YybFNWUnZXMG82M0RuV2d0bTdsODVmY2lj?=
 =?utf-8?B?SUxjbGpIQnJPbGpKRjNhcXo5bGRyeHhibW5TdENSYnQ4SzVDNm43akNlK1ZG?=
 =?utf-8?B?SUJZdXRBajU2enAycklmT3ZJN01QY3l6SU80N1VlY3RqN0tVZ3VYQ1l4ZXAy?=
 =?utf-8?B?R21mMHR3Wm4xb1RvNGU2K2htRWNZRnhRN3ovekgzTGN0a1JMM0dCbm85bmpE?=
 =?utf-8?B?WTlmd29TN2loMGliNWswY3VCQWMyNTlRQldpK0VXb1VXdUtUMENDclFESjR2?=
 =?utf-8?B?TnBrRThwamU2MVJQazVHekhZamFJaFROYlNQbTdZd3BVZUFBUDF3MHVDMCt4?=
 =?utf-8?B?VmhST1ErQXl3VHhhWWRja1hyMCt1UVRGNTNFZXhIVGNaUm1wUlhCOTdkUWdR?=
 =?utf-8?B?UlpoSGxzV1pTRGVyekY2aSsvY1NRNmhidmc0dXBQODc1bDNhVHVnVVlSejUy?=
 =?utf-8?B?d3NmVXgxTkl5ZVV6VFI1bWkxVDdZZlpnMHc0RlRCK3ZWcWlJdVg0MkFUc2hn?=
 =?utf-8?B?bzRMbktyZ0tKTURIMlFxbXJlTXJJZkdmUlVZQm9IbHpWTU8vaEthYnRobkVj?=
 =?utf-8?B?VkFRREZ1aGFsa3FoSkYxeFlJRXBsUlBPRXJZMEhFNzBIdnZDQmptTHBsMDBO?=
 =?utf-8?B?R0hydmZtbGpSU3hFQU5jUkpoUXJCWGRWckpmZThEdk1EZUZRajlnUDQySjBE?=
 =?utf-8?B?Ulo1bzhRSFgxZTdraFJ6cjhPVEpBZ0M0b0pFc09zdk1KOXJMZS9KVWRWU1dm?=
 =?utf-8?B?ajlmcklWS1Z2a1FHci96b0U4MzQvR1ZyTG9iTWpqNlNzQlB0bVliT2ZXMS9C?=
 =?utf-8?B?Q0p3cjVWTmxhZERWeU45MGcycHJkZkNwNGVoRmpXazJkbkVQTTh3cE9qUm5W?=
 =?utf-8?B?c09GWDQ3SWVrcG9IaytNaXJORFp2aXNONFl5dWRkL3V6czZOTVNYTFFNSFMz?=
 =?utf-8?B?eFRITzM1dkJqeEtNZzNDTkxpV0dKcTNLSi91aloyYmFWdTJQRkY0QUhnY3Qy?=
 =?utf-8?B?djc2dlR6R1ZYRDBadmFGVWtMQkRQQk9yWndmTG1Zelk4MnZyWmJjNXc1a1ph?=
 =?utf-8?B?M2p5QlhDNmNNVDZUSTFxc3ZPc05EanhyRHJ5THhsUFBPT2VTZzIyVVY2YnA3?=
 =?utf-8?B?NGorQlZVdkM2SWd6V1gxUG9GTmpnMy8wVGx3QkdoWjhqd3VId3Fva3diaGxC?=
 =?utf-8?B?MzI0d2hrOHh2aitZekV6Vzg2bzhHREVqc3JJU3dKS0hreVpXQ0J0TjM5dEFS?=
 =?utf-8?B?T2FWMDBXM2FkQnNtSFA5SkZ4VE5qNUVMQTF0aERFdGpFWWNuZDNTdHk0RWF6?=
 =?utf-8?B?K1RmZGRJZ1ZUdXh6eDRhdVdyVk84Q3BCSjRUYU9xcFNWNnFaMGZFVUZiM1FW?=
 =?utf-8?B?OFN1NFltY0UxZEJOTlVSWnVLNnMwd1pxcmw2L1BnVUlTMG9kODV6N0MrOXhO?=
 =?utf-8?B?c0dhY3AxZ2NPSit2V1VRaUxmeTJGT09MU1QrUFQ0L2lpVFpDVTdaWTVlRDJi?=
 =?utf-8?B?ckhiL3pncmRhQ2IvVUNuMFVhYjZSM1N6elY0S2Vzb3UwSFZweEhZMXBLL2Va?=
 =?utf-8?B?amd4Ykx1UDZXd21CY1ZmdHZ2Z2k5ejlRbC9sQVhHY1NKTDd1NWF5SzE1Zmgz?=
 =?utf-8?B?ejRpb1NrKzZZdUpVeDh0YnhqZlMzYThEcHhVYzRWSElMSnBYSFVoZGM2UGg1?=
 =?utf-8?B?NGl2RnlheGttVmxPeHpvODBEYld2ZmNtb2FCZmxqYy9YUmx1THo3eGhhQzVV?=
 =?utf-8?B?MTk2ZjdLb3g1K01OOW9JNTE0L2RLQTlwTjBvc0lXYjljYWZXcHczWkFkSjJv?=
 =?utf-8?B?dktJOE43a1I1VkYxWDhaUGJGUWNVYkFTTytSOVVJZUIrN0x2cUIvV3J4bDBl?=
 =?utf-8?B?VDhoallHYUwwQ0EvcGZQcXRBaTMrdmxkK1ZqWWtlWTRKWHJaVzNWODFnYVZG?=
 =?utf-8?B?YzhIcUtaREduUWFlV3c5aUxWODB0QlFrOHd1UStoOGhIUzg3UGtWeUVma1Mw?=
 =?utf-8?B?dmFqY1FEd0wzS1hPSzdXNEhMdnF4Q1JXd3g0bEpsWnN1YU9ScUJ0N1VTcWdR?=
 =?utf-8?B?MldEQ28zayt4cEhNMEJzaXUrTkFsNWVOMnRFNVpwckVkbTNIK09FY20xdVFP?=
 =?utf-8?B?N0Z4eE5RL1hLYUtoY08rYXk4TVdzeDdweWV2M25ka3JGWklQVmtzOEVVM1FP?=
 =?utf-8?B?VXFzR0pQTWttNVFKOWFPMWJEMDB5eDQwYUwxODFCellrdWJRaGtqbXZPV0lH?=
 =?utf-8?Q?WVcBQo0aNyoniTlVtV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15799991-ad96-4fb9-461e-08debad19c67
X-MS-Exchange-CrossTenant-AuthSource: CHXPR12MB999244.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:50:56.8969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fBoLMf2MJ5mmW791W536pPBg7B8bK6MJGbR91GsIBDBTdHuRBPTvg3TiOdf09Ex8Tlnm4dmd8qRO8D7ckIlrCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_195105_069210_8B70F64D 
X-CRM114-Status: GOOD (  33.09  )
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


On 5/21/26 05:24, Ben Horgan wrote:
> External email: Use caution opening links or attachments
>
>
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
>          struct mpam_class       *class;
>
> -       /* per-class data that resctrl needs will live here */
> +       /* Array of allocated MBWU monitors, indexed by (closid, rmid). */
> +       int                     *mbwu_idx_to_mon;
> +
> +       /* Array of assigned MBWU monitors, indexed by idx argument. */
> +       int                     *assigned_counters;
>   };
>
>   static inline int mpam_alloc_csu_mon(struct mpam_class *class)
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index f70fa65d39e4..a13eb232a19d 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -75,6 +75,8 @@ static DECLARE_WAIT_QUEUE_HEAD(wait_cacheinfo_ready);
>    */
>   static bool resctrl_enabled;
>
> +static unsigned int l3_num_allocated_mbwu = ~0;
> +
>   bool resctrl_arch_alloc_capable(void)
>   {
>          struct mpam_resctrl_res *res;
> @@ -140,7 +142,7 @@ int resctrl_arch_cntr_read(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
>
>   bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r)
>   {
> -       return false;
> +       return (r == &mpam_resctrl_controls[RDT_RESOURCE_L3].resctrl_res);
>   }
>
>   int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable)
> @@ -185,6 +187,18 @@ static void resctrl_reset_task_closids(void)
>          read_unlock(&tasklist_lock);
>   }
>
> +static void mpam_resctrl_monitor_sync_abmc_vals(struct rdt_resource *l3)
> +{
> +       l3->mon.num_mbm_cntrs = l3_num_allocated_mbwu;
> +       if (cdp_enabled)
> +               l3->mon.num_mbm_cntrs /= 2;
> +
> +       /*
> +        * Continue as normal even if enabling cdp causes there to be
> +        * zero counters. This avoid giving resctrl mixed messages.
> +        */
> +}
> +
>   int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
>   {
>          u32 partid_i = RESCTRL_RESERVED_CLOSID, partid_d = RESCTRL_RESERVED_CLOSID;
> @@ -244,6 +258,7 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
>          WRITE_ONCE(arm64_mpam_global_default, mpam_get_regval(current));
>
>          resctrl_reset_task_closids();
> +       mpam_resctrl_monitor_sync_abmc_vals(l3);
>
>          for_each_possible_cpu(cpu)
>                  mpam_set_cpu_defaults(cpu, partid_d, partid_i, 0, 0);
> @@ -613,6 +628,9 @@ static bool class_has_usable_mbwu(struct mpam_class *class)
>          if (!mpam_has_feature(mpam_feat_msmon_mbwu, cprops))
>                  return false;
>
> +       if (!cprops->num_mbwu_mon)
> +               return false;
> +
>          return true;
>   }
>
> @@ -935,6 +953,52 @@ static void mpam_resctrl_pick_mba(void)
>          }
>   }
>
> +static void __free_mbwu_mon(struct mpam_class *class, int *array,
> +                           u16 num_mbwu_mon)
> +{
> +       for (int i = 0; i < num_mbwu_mon; i++) {
> +               if (array[i] < 0)
> +                       continue;
> +
> +               mpam_free_mbwu_mon(class, array[i]);
> +               array[i] = ~0;
> +       }
> +}
> +
> +static int __alloc_mbwu_mon(struct mpam_class *class, int *array,
> +                           u16 num_mbwu_mon)
> +{
> +       for (int i = 0; i < num_mbwu_mon; i++) {
> +               int mbwu_mon = mpam_alloc_mbwu_mon(class);
> +
> +               if (mbwu_mon < 0) {
> +                       __free_mbwu_mon(class, array, num_mbwu_mon);
> +                       return mbwu_mon;
> +               }
> +               array[i] = mbwu_mon;
> +       }
> +
> +       l3_num_allocated_mbwu = min(l3_num_allocated_mbwu, num_mbwu_mon);
> +
> +       return 0;
> +}
> +
> +static int *__alloc_mbwu_array(struct mpam_class *class, u16 num_mbwu_mon)
> +{
> +       int err;
> +
> +       int *array __free(kvfree) = kvmalloc_objs(*array, num_mbwu_mon);
> +       if (!array)
> +               return ERR_PTR(-ENOMEM);
> +
> +       memset(array, -1, num_mbwu_mon * sizeof(*array));
> +
> +       err = __alloc_mbwu_mon(class, array, num_mbwu_mon);
> +       if (err)
> +               return ERR_PTR(err);
> +       return_ptr(array);
> +}
> +
>   static void counter_update_class(enum resctrl_event_id evt_id,
>                                   struct mpam_class *class)
>   {
> @@ -1089,6 +1153,43 @@ static int mpam_resctrl_pick_domain_id(int cpu, struct mpam_component *comp)
>          return comp->comp_id;
>   }
>
> +/*
> + * This must run after all event counters have been picked so that any free
> + * running counters have already been allocated.
> + */
> +static int mpam_resctrl_monitor_init_abmc(struct mpam_resctrl_mon *mon)
> +{
> +       struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
> +       size_t num_rmid = resctrl_arch_system_num_rmid_idx();
> +       struct rdt_resource *l3 = &res->resctrl_res;
> +       struct mpam_class *class = mon->class;
> +       u16 num_mbwu_mon;
> +       int *cntrs;
> +
> +       int *rmid_array __free(kvfree) = kvmalloc_objs(*rmid_array, num_rmid);
> +       if (!rmid_array) {
> +               pr_debug("Failed to allocate RMID array\n");
> +               return -ENOMEM;
> +       }
> +       memset(rmid_array, -1, num_rmid * sizeof(*rmid_array));
> +
> +       num_mbwu_mon = class->props.num_mbwu_mon;
> +       cntrs = __alloc_mbwu_array(mon->class, num_mbwu_mon);

hi Ben,
One thing double-checking here.
The allocation path uses class->props.num_mbwu_mon,
but teardown frees using l3_num_allocated_mbwu,
which is the global minimum exposed counter counter.
If classes can have different num_mbwu_mon values, a class with more
monitors than the global minimum may leak the tail of assigned_counters 
during teardown.

koba

> +       if (IS_ERR(cntrs))
> +               return PTR_ERR(cntrs);
> +       mon->assigned_counters = cntrs;
> +       mon->mbwu_idx_to_mon = no_free_ptr(rmid_array);
> +
> +       l3->mon.mbm_cntr_assignable = true;
> +       l3->mon.mbm_assign_on_mkdir = true;
> +       l3->mon.mbm_cntr_configurable = false;
> +       l3->mon.mbm_cntr_assign_fixed = true;
> +
> +       mpam_resctrl_monitor_sync_abmc_vals(l3);
> +
> +       return 0;
> +}
> +
>   static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
>                                       enum resctrl_event_id type)
>   {
> @@ -1133,8 +1234,21 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
>           */
>          l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
>
> -       if (resctrl_enable_mon_event(type, false, 0, NULL))
> -               l3->mon_capable = true;
> +       if (type == QOS_L3_MBM_TOTAL_EVENT_ID) {
> +               int err;
> +
> +               err = mpam_resctrl_monitor_init_abmc(mon);
> +               if (err)
> +                       return err;
> +
> +               static_assert(MAX_EVT_CONFIG_BITS == 0x7f);
> +               l3->mon.mbm_cfg_mask = MAX_EVT_CONFIG_BITS;
> +       }
> +
> +       if (!resctrl_enable_mon_event(type, false, 0, NULL))
> +               return -EINVAL;
> +
> +       l3->mon_capable = true;
>
>          return 0;
>   }
> @@ -1697,6 +1811,23 @@ void mpam_resctrl_exit(void)
>          resctrl_exit();
>   }
>
> +static void mpam_resctrl_teardown_mon(struct mpam_resctrl_mon *mon, struct mpam_class *class)
> +{
> +       u32 num_mbwu_mon = l3_num_allocated_mbwu;
> +
> +       if (!mon->mbwu_idx_to_mon)
> +               return;
> +
> +       if (mon->assigned_counters) {
> +               __free_mbwu_mon(class, mon->assigned_counters, num_mbwu_mon);
> +               kvfree(mon->assigned_counters);
> +               mon->assigned_counters = NULL;
> +       }
> +
> +       kvfree(mon->mbwu_idx_to_mon);
> +       mon->mbwu_idx_to_mon = NULL;
> +}
> +
>   /*
>    * The driver is detaching an MSC from this class, if resctrl was using it,
>    * pull on resctrl_exit().
> @@ -1719,6 +1850,8 @@ void mpam_resctrl_teardown_class(struct mpam_class *class)
>          for_each_mpam_resctrl_mon(mon, eventid) {
>                  if (mon->class == class) {
>                          mon->class = NULL;
> +
> +                       mpam_resctrl_teardown_mon(mon, class);
>                          break;
>                  }
>          }
> --
> 2.43.0
>

