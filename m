Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD726D41D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 07:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fIEwmqLK9xP+64ByglwAYjKLGHtN4uNZbqodmwsbAoI=; b=hdKU06ZOUjQglQcLShN0sfZJlL
	x3w+0mtlqtdlD7tIbt/kvtqRcUKaJ6vSH0X5Jlrcc5xlewiYuECeW3IvuyqdEArggxmHIm5N7hY6I
	HH7hR2Awhj1FSLhcO/mvXVQfsI2Js1AbveLYS5QCUeJB+Ku4QTs1MJKeGgnNGJYG7RbrxWdPuHzLu
	e6NuMOkpOO38sWFFpnBjMnnN7/bVjKGr3Pteu09/UOE1Er78Ibuc5FB6Zc+g3S7J0l0n1FlSz5QMg
	byskxVOHIBoZ75KPFbiM70BkzC8rRloEzSK3Bg7/wDFQ49bzJ0WCYNaTW4gFDLsIJVzrw1ggl74vM
	woUQihkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV3Ig-00000003Dgh-0iUF;
	Mon, 15 Dec 2025 07:47:22 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV3Id-00000003Dg5-2JQC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 07:47:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aoeBToHs8tYn2CJ2kbpFptmTz0X0oCcZX9rMNFDuWgLcNw/Q7mGEVkpkBsU7SskArGmsKYrlq97xOaCJuCZq2atiA3FM1Y3ouQQJynfFN65Dg1EPLsSZ31xZMb1fUpNiLkG0QhFvlg5AzZN94Qf7XWekz8vDsXggmd2fi/TF01WIhwtuFqZ8xxiQmbt5UPTS2S8uP31ZlDvmxkhsKcYSIZzLE1BZLoqgkF1MDvLuFopaPrVNYIyi0m7XMjkjWtQWm1ANpg6mvdYBQUtyWMadn6bXBSJMlbQQ8b7FNEz7SK71kVvDXqDtCPkKRC1zpQAv2LbWfMPetmvSO9SHY3rgmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fIEwmqLK9xP+64ByglwAYjKLGHtN4uNZbqodmwsbAoI=;
 b=G/kegFndOMSNZtc/fQbmEGVopCm2U/hY9equ3BMBe9wMRDp0MD73wmMCxNSeg+wEnAkb26hui2BxJBjAVwvRIQKAzNXETFfgfbavMC6a8+IohItKIt+dXuZ4rNcTcoEveP/3GGoHCDAbvH4rqzqg7sshZVfzLWfm/wThQhaoGTTSVxiDNjsjZb+xhSJscUdpPEsWPxs9KBWfQ8pts+wYNCnkXeCCoMlusewj14OZfv6wZwb7T/kuiL7qTWM9fWHGntCQHDfaFYTWe8a4ptWMSpBNCtfTj1E3ElbsdMSw0u43Ql979xA2mREfx0auiKvt08K0Aox//GZUORX4CIWgcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIEwmqLK9xP+64ByglwAYjKLGHtN4uNZbqodmwsbAoI=;
 b=kTx5SYTJ4BMG+pgakY3fup4jxjgZUA/Sbn11hFdAQwp/IVIjrUX7Hsg7NvTT28+OUaFDK2Rq6oypRrCs5pxiE4R6+UhsSqw7Qn+0/QB8m4LaLplAk+vQxqRV4hZPRCZRsN6JIK/MuWgyIm7p1R+k5qwmY4FTxl20S0oShKjqjrU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by SJ0PR12MB5635.namprd12.prod.outlook.com (2603:10b6:a03:42a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 07:47:15 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%4]) with mapi id 15.20.9412.005; Mon, 15 Dec 2025
 07:47:15 +0000
Message-ID: <7e44d434-faf2-4f14-9427-9e6173912d15@amd.com>
Date: Mon, 15 Dec 2025 08:47:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc/xilinx: replace use of system_unbound_wq with
 system_dfl_wq
To: Marco Crivellari <marco.crivellari@suse.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>
References: <20251104103942.96647-1-marco.crivellari@suse.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20251104103942.96647-1-marco.crivellari@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0072.namprd17.prod.outlook.com
 (2603:10b6:a03:167::49) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|SJ0PR12MB5635:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e4929fb-a86b-46ec-90be-08de3bae2a51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHZ5U1U1NDRwTXVZbkRTYU9neU1mcFAxU0FSaEdKelp0MHBKQThiaWlsZE5D?=
 =?utf-8?B?UThFeU9oUCsyaHF3bTUxNVhlMm5lbUo5Tno2VVROM1o1UEloemNnNEhkVThU?=
 =?utf-8?B?WTNodkFjY1NBMHRqbmtNQXdCeFdBRkE5WElVb1ZkZkk3aG9pa3paMkVaOGF3?=
 =?utf-8?B?MDhZSWFMK3FReHA2NHZCN0JLVDBUZkF4U3BSYVh1azh3TkEzSCtMV0d2K25y?=
 =?utf-8?B?Q3RLZVl6dGM2b2svV2w5T0hEU2lQc015Mjk1RWlZWTRvdCtYdlpiSmhGYVNi?=
 =?utf-8?B?K29kVXlac2N6Nzh6eXZHY1B2VGNYcmhTZ29jSEI5K0wySEdsN0tjVkZlbFNV?=
 =?utf-8?B?NFlSL3psbVMxM1BsU0ZkZVo1TzNQM3NLRXQ4ZWpVMjBJTU9jKzlFNS9Oem9Y?=
 =?utf-8?B?cUg1ZXcrYWQ3b3lKVk5aUTBIN25ITm0zMW5GMndZNWpBaU9sVnhCQ2thRlBp?=
 =?utf-8?B?UEFkSlRNYzVsRWVqeXg0R2JYM0xWWkxtR3FtYTFuZ2JsR2JVclNHWjJZQThZ?=
 =?utf-8?B?ZTcrMnVxUms0R3NLTkM2WEFxS3VOQjU4dzVJbGM1ci9HdXlpNUp3K2k4L1F6?=
 =?utf-8?B?UlNxNUhwaWllYmNEUWM3V3U5TkRXUjg0NW5CVnN4OFovT3M0SEpWWWZNbEpC?=
 =?utf-8?B?eC9yTWVrYThUY2JKSGxTNzV1a0UrMWw4ZE8yRU01ckozeVZPbWVtOVRDSElS?=
 =?utf-8?B?WjhOWGhHN1Eybng0aG1SNW14T0NVTWl6UkVadzhFU3pCNDdCTmttOTVPcE9K?=
 =?utf-8?B?K3lsOFBXV0h6UXhZbm9DYzZNMVdPZG93bG0ySUh1YUhOeWNnM3FDc1JOdzRF?=
 =?utf-8?B?QTEyZExuRjVUY1FjbkppOWR2Ky9xR24vZlJmVmRXWERlSjVqeTZYNTNyYWVT?=
 =?utf-8?B?ZGdHNnI4YS8xVzU4V1BPRXFsV2h6VU1xcHRSZHpOZHRzMjhCVFhkRkViN1Y3?=
 =?utf-8?B?WXVpSnJ2MUNSaEZSd0wwRkhkZlljK3JlcVNid2ZWT0RQZzV4ODBuVDdjQWF3?=
 =?utf-8?B?RFhqbVRRZkhleldTbnFMcW02cUhsaXR5R3NqZzViQ0JYakNudnJrOEhYVGpO?=
 =?utf-8?B?QXpOcy85NkZFYVhEWHBIRVkzZml4dHNqK1BQZmk2RGlCbk9PN3NFNEMxNi9S?=
 =?utf-8?B?QllBQW1xZVk5cWV3WDZlMnZjcTRhZThib0RLV21CYTI0bWVtRldxUU1DNkJI?=
 =?utf-8?B?MXBaOCtzcVV5ZnRiMkIwS29KdzVyeVVoc2JsV05FSDlTcU8rNFR2U0hITG5O?=
 =?utf-8?B?QmUvUGtwRVAwNTBBMmFuSmM5RzRERTBGMndWQlZ1R2d5cWx4ejRMSjhoZEVz?=
 =?utf-8?B?N0xrME5UeWdQY2x4T3R3em42VmFjQXhTMEpYU0lnbW5NNkZDNTNpaWRkR3BV?=
 =?utf-8?B?anNWanhJRkxGZmwvSVZZeWlMNjVLZUpMUzFIUktTVStpbnR5WXlZdlNMSk85?=
 =?utf-8?B?NzJ0aFc5UlNuQXFwSm02dlNwVUZudTNLS0NPUkJrOU9XN0dXVC9HcUorZkls?=
 =?utf-8?B?M1RFblZ4cWMxZ3poUXhXMytYWHo3R3J6SE1pSCtUY1ZVVnhVeHNLSk5xcXB2?=
 =?utf-8?B?ekF1a3FvOE9HK3pmTHZnNTErbS9DNzk3UkZYeWlrNklWKzd2SzBiNGVqcEFR?=
 =?utf-8?B?YVR1QXlNZDBQTkgzbGtacHVhVXRrYS9ySFVvSjA1RDJuRFhEdTNxWXR5ZWhF?=
 =?utf-8?B?M3NvWCtIYVVGdlBFRU4rWlpBQlpvZTZQaDdVVzVVbW42R1NHT1d5U1FZcUVy?=
 =?utf-8?B?MVlmNVJvYW54T1dsc3IrZzlxTUtoVnZhWDNhSGgyZ2YxRjVpR2szOFZoaHdn?=
 =?utf-8?B?U3dVN1ZmZnBRRVJReG9pSkkvdndoV3poUk1XZmMxWXdqWFVTOW9jNkErVU9N?=
 =?utf-8?B?dnFUOHBybWM5N3pjM1IvL1kyZ3d4YXQ0V1hEOGl2ZWFjSVZNWjZhNGttVTV6?=
 =?utf-8?Q?HSkYDGsJIJ+Exvs4u2UnTNomwXDZl7sG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3lLZnNUdWQyWi9RQWlkR2Z4S3phU1JPd0xHZWp0WThKSGNOalU5cVcvZzhY?=
 =?utf-8?B?S3A4S3VaajBqZys3THp5N2dZQmFucHltdldNZ0ZUNTNoKy9sbkw0b3ozc1I0?=
 =?utf-8?B?QXgzTHM5VVNheklLZnlvN1lkOUkyMlE4cUNxOTRZamkxRXZpRTJ3YlNSVkJT?=
 =?utf-8?B?WHJPMG16MmhqT2JaL3VRYW40eWZ5QnFMR2UxMFcyRHdEbGFqZ3dqbzA5V0RC?=
 =?utf-8?B?UWJYYlhlZ0psWWJvMEcxSWMySE9JRERibUcvSnhvVkdNeGovSnNMVUl1emZs?=
 =?utf-8?B?LytrRXk2ZEJhVkJURUZXd2hDdkp4RFNKdmRQY3RmL1EvNmI4NUJPWGdGak5u?=
 =?utf-8?B?R0ZuQWRZQklMa3dPN2pKYmdlaDI5cnlLV21iaFhxRXdMNyswbjhUZWJ5ZjRo?=
 =?utf-8?B?NFMxQjNIWkZJR0tJUGZ5VzEvNDV6eUZMYjhIVmhYdmlGSk9Ra3U5VTk4S0I3?=
 =?utf-8?B?Z2psdXBJSUpYTHlvenFUNzJsUE5zN1Z1MkEyOHFFbWozVzdVc05INWU5QXhQ?=
 =?utf-8?B?eHZKOWtFVFJUcWJOZWFCSWUxcC9GUjF4QmM5SUxKZDcrTzVjOFdiV0JaRlVL?=
 =?utf-8?B?aDgvcVpNRWhKSUlZQ05sdEdZOVJGN0Nnb09tMWZUSE1jaDhHQUJqbjJYQU1h?=
 =?utf-8?B?bWxacStzeVU3TVFOZytvNGIzUGNVNEdRNmVtZUZWbXpPdjJHWHhDUkszOGlz?=
 =?utf-8?B?Q3J2RzJ1ekFleC9aYVRxS2pJTmFxSnJBenc1TDB4emdGY1puYkljLzVLMGtq?=
 =?utf-8?B?cWlDRXJIclRNQ3hqVnZ5WnhMUjhDWkJUcXc2eTFWQ0ZkV2FBYXY4RFI4ZDM0?=
 =?utf-8?B?TDl0dUkwcUI1azAyeFJWa0hSNlpoYzBGZ1BSTUp4T1l6dHp5MGhNdm9SeUJN?=
 =?utf-8?B?d2w5bjBzamJpK05acVNJVlhvYW1vZWlQT29vdzlNMzdMRHBrZThmOXQ0S2Nq?=
 =?utf-8?B?RzQvcG9abE9wNFVyQ0ZMcENVRWhFSXpPSm55YzUyOWY3SWd0aSthMVFBRDFI?=
 =?utf-8?B?UmpYS3JQMmV6V3hyZEZEdHZzam8wUUZYUmZtQ09XM09HZWtoMHdqamdZcmF5?=
 =?utf-8?B?aHZWMXJPb0V3NTBRWXM5b1M4THFkTGdXc0VEQ2YwU1R2QjdBNTRCVERkZVNV?=
 =?utf-8?B?ZkFnR3daQU9TaXNFSlNRVVN2OG1sTFBvajBuM3NWK3ZDeVFlWm1kMUdaMW4x?=
 =?utf-8?B?OGpKclB1V3lhZk5sQy8yanQ5WlF4b1hvMzNGMkJDcVR1YkxibnRFVEdsdVRM?=
 =?utf-8?B?UlFDcFRGekdjYXFsWFliWEhLd1NVZEFhaEZpYklMejh1aG1Lc1NOTUswaEo4?=
 =?utf-8?B?bVN1MjFBd1RON3ZCSENNTXZXYmF1d2M0TU03eW9hbDJTeHljRUFGdEI5RlRo?=
 =?utf-8?B?cUc3Z1BkUmRyaDhqSW9sdUg2b1Q4c3k5VkFqRW5kNXZvMW1vZ0MwYjNTK21B?=
 =?utf-8?B?SndST0RLd2NpcDZLYXRNcm1mOUhQMTA0Uk5mOXFzZzF0MHVuQnEvRm1uemJT?=
 =?utf-8?B?Y2Ura0kxaVRWdktDRUwxZDcxQnRKYU9rTDZ6elpiRng3NDlNOVRhYndJd3pP?=
 =?utf-8?B?WVBsZ0pHYzBFUTQza1FMNHJ0SzhIUzlCUUExQ2J1Ry82Z0tqb29TSmRrbklk?=
 =?utf-8?B?Nk9rTW1qUS9ZTGpicm14TnBLbVdQdlgzVHJCQ1d5bnFENjdHdUNvYjc2emhi?=
 =?utf-8?B?SjlEUDA2K3YyazFyOTYyRFNmMWpvL1JVSmw3eVc3R004V0VETXEyeWFCWGE2?=
 =?utf-8?B?K28veGpoYmYrTUt0TVhJL1lDaTB4Y1QrUXJpWlVsL3EvSVB3SDhRUysxTzI5?=
 =?utf-8?B?dzExbDlqclk3eGdmN3cwWlg5aVg4L09wOVYrOEI5WlZUQmJZbGt5M1AvVjNy?=
 =?utf-8?B?bTljOTZtb0hHWmhEMFo2UmpPOFNrU0NXdlpKKzRiUWhaSmRqbXJmdHJ5Q0pV?=
 =?utf-8?B?WGIwUmhyREJKVUJrQVF3NDRLWVVNK2JnV2NQTmFuVEZBbTVseWVQU25UZ0tS?=
 =?utf-8?B?cFFoS1Z4aFlaUG9vMFlMMjd1UlVnN0lwRldNR2U3bldrVEIrM1ZtY0c4OHNw?=
 =?utf-8?B?UkxTOXJqSTJKOFI5cXNoN2V5YTRJaUVLMmlWSU9jNmxab21pd2F4MUtVUkl5?=
 =?utf-8?Q?Qwm+8aU0vi08H+yykWcA9HML0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e4929fb-a86b-46ec-90be-08de3bae2a51
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 07:47:15.5197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Ynp+vERwy6XeQBrgAik2mhArY2WWp61BGhtbIH2HNxQJE/BYe/HKm3YBpHIlrJ7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5635
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_234719_732332_2E102F93 
X-CRM114-Status: GOOD (  20.04  )
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



On 11/4/25 11:39, Marco Crivellari wrote:
> Currently if a user enqueue a work item using schedule_delayed_work() the
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
> 
> This lack of consistentcy cannot be addressed without refactoring the API.
> 
> This patch continues the effort to refactor worqueue APIs, which has begun
> with the change introducing new workqueues and a new alloc_workqueue flag:
> 
> commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
> commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
> 
> system_dfl_wq should be the default workqueue so as not to enforce
> locality constraints for random work whenever it's not required.
> 
> The old system_unbound_wq will be kept for a few release cycles.
> 
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---
>   drivers/soc/xilinx/zynqmp_power.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/xilinx/zynqmp_power.c b/drivers/soc/xilinx/zynqmp_power.c
> index ae59bf16659a..6145c4fe192e 100644
> --- a/drivers/soc/xilinx/zynqmp_power.c
> +++ b/drivers/soc/xilinx/zynqmp_power.c
> @@ -82,7 +82,7 @@ static void subsystem_restart_event_callback(const u32 *payload, void *data)
>   	memcpy(zynqmp_pm_init_restart_work->args, &payload[0],
>   	       sizeof(zynqmp_pm_init_restart_work->args));
>   
> -	queue_work(system_unbound_wq, &zynqmp_pm_init_restart_work->callback_work);
> +	queue_work(system_dfl_wq, &zynqmp_pm_init_restart_work->callback_work);
>   }
>   
>   static void suspend_event_callback(const u32 *payload, void *data)
> @@ -95,7 +95,7 @@ static void suspend_event_callback(const u32 *payload, void *data)
>   	memcpy(zynqmp_pm_init_suspend_work->args, &payload[1],
>   	       sizeof(zynqmp_pm_init_suspend_work->args));
>   
> -	queue_work(system_unbound_wq, &zynqmp_pm_init_suspend_work->callback_work);
> +	queue_work(system_dfl_wq, &zynqmp_pm_init_suspend_work->callback_work);
>   }
>   
>   static irqreturn_t zynqmp_pm_isr(int irq, void *data)
> @@ -140,7 +140,7 @@ static void ipi_receive_callback(struct mbox_client *cl, void *data)
>   		memcpy(zynqmp_pm_init_suspend_work->args, &payload[1],
>   		       sizeof(zynqmp_pm_init_suspend_work->args));
>   
> -		queue_work(system_unbound_wq,
> +		queue_work(system_dfl_wq,
>   			   &zynqmp_pm_init_suspend_work->callback_work);
>   
>   		/* Send NULL message to mbox controller to ack the message */

Applied.
M

