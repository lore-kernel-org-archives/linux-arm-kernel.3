Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09ADACD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 18:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rls+kPRVRvJD8GIZ5z34Y5kzy+gNTl3URZw8LqE7NAw=; b=pm2AmXn3cDoeoAixEyCvyCDwNq
	YVPXHbSfw805pT3m5hZFa0cG6RRmLFwH9wiYJt8qcTirLMB//5wdKkCMJHQ1hrxwJFPJOpdA5oR/x
	cF49OE36AgFGbShxd/cA6OCD5C5TyeWw8UVMtTQsYS5kF1jo51gqC03rQ72YrVKhDnvRe0DXBeb+g
	rsCuOSo50n4kDGn3j/ew/k+FWwf4xQs7YpAc3y/StpbQ9E47iK5Lk04Xba8BxN1STgfQdkVzfa1dw
	uqvyE+xtIDhC/RtHmV8qxJxWsEklu7sF6oeo31jubzHa3MIu3hV1W84PYW5aWCa+LdJCs0rc4/BHW
	z1UdgrQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSfi6-00000006Dlw-0vl3;
	Thu, 28 May 2026 18:44:02 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSfi3-00000006Dl0-3Gha
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 18:44:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AXL7nwzNX1/N9ATHYIIplTxlwxoKlDd2Kk0+cLm7oK9Uj8XgFqRSZ/SsQFeikKWH6Cd/MTEIYgaQK1v+OGfsLhisuzzv55H8IhMOyoJHFuEgaPgsNVBh6MfON+fK3Z0tFjkb8db4yvXnHzgIIUuBlU27hmyuzqjhIYEDZNBT8RnPCM4XQ7lxgQaSRF2eyBtuD2Ef+GUcfewsxnCvNXF5yNajFXv7+cjrzRZy+1tXhHL3GdcwNscHowKE664y31x1JU0XYDOkN1StIguQqP9Jh2Mt1NBlgN7zbT1lowBXF3u0cFUr2jz/+V2bsgFQLjR4PG7dKCEiRUu8CGS3ZqPLMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rls+kPRVRvJD8GIZ5z34Y5kzy+gNTl3URZw8LqE7NAw=;
 b=YacHzjOGBtd8KovKdeLTXUSEq1nJOqBAC50jWanVwz4KH204MNHg0q/fdO2rCIb1O5pvff8xZJFCDLxp9Dm5D1XdLftlJQT/GQOYFCqsxvh6hOPmjO8lKMaAjEGuRBn8zWynTiha6sqH49ynyZXlJT6bOn8TsXSXpDHUIh3+1adwPQKZtgCHySK2zLIVZ7GVgEff0aTZhfYtTkE4cgYa1kOmcBaEVM4ZGxVrhidAIzQZ3PItOJC7kqurI6T5T2r9dhFM5ZOvP2tja5RI55UTdkwqEw3qfkvKpLoDyi69nSHVficqzQG5oGX5S1+zwnO7G8dR0A9sigWvKVvLgueTZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rls+kPRVRvJD8GIZ5z34Y5kzy+gNTl3URZw8LqE7NAw=;
 b=PWrUYECvPb0gJn3TkI+3lCJvcpC+ZaBUVj9VMXk5+rmkKU31zWHvBBVAOOosYAjw/1dgl4gXJ4iiPDQ/u47o6/7QEjTk0RIyu+eLmMLM4aSxJoXnzPRiuTwj3WeeySgolGK7RBRKemLikgVscjj0J3LeUZGAmjZIQoDQEAdKLWk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 CH7PR01MB8955.prod.exchangelabs.com (2603:10b6:610:250::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.11; Thu, 28 May 2026 18:43:44 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%3]) with mapi id 15.21.0071.010; Thu, 28 May 2026
 18:43:44 +0000
Message-ID: <c0f9a811-0286-4e1c-8790-8e31d95e5819@os.amperecomputing.com>
Date: Thu, 28 May 2026 11:43:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] mm: make persistent huge zero folio read-only
To: Jann Horn <jannh@google.com>, Dave Hansen <dave.hansen@intel.com>
Cc: Xueyuan chen <xueyuan.chen21@gmail.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, david@kernel.org,
 ljs@kernel.org, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 ryan.roberts@arm.com, dev.jain@arm.com, lance.yang@linux.dev
References: <20260527035607.14919-1-xueyuan.chen21@gmail.com>
 <20260527035607.14919-2-xueyuan.chen21@gmail.com>
 <4e0696ee-895c-486d-aacc-71146f0e9047@intel.com>
 <CAG48ez2qj+QkLZvvi+6S78_v4Zk2eZBnBx6TozwgG4payOqPLg@mail.gmail.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <CAG48ez2qj+QkLZvvi+6S78_v4Zk2eZBnBx6TozwgG4payOqPLg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CYXPR02CA0018.namprd02.prod.outlook.com
 (2603:10b6:930:cf::11) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|CH7PR01MB8955:EE_
X-MS-Office365-Filtering-Correlation-Id: c6f1c93d-9379-4c44-a1b4-08debce90be1
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|18002099003|22082099003|55112099003|11063799006|6133799003|4143699003|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info: yYT7tDX5nB6iUiIeRk6/8yirT9AegM6g3o4Pw+f9R0M/xpOyatQz3PEG7loH3ew87L2ACFUSnGFaG/IfH7rwrfSCw4t8uLOKDVszG3+dfavfeakHfwCLGa7Yiv0m8FCIvODdHQLLeChq53IIhsmNpO/hK6cFX9Z+KjF6bOEBDuHMouZjtBw/AltY7QupSWvhvDLCiXMoEE2zLF9afWtqdlCOqMY6ubM8/dANehrb45Qy1ZbbHttcjX91c1QtzQYgjqIFP/+eQTDvQ6bPOzDBOrLESUEHUPVJBBhvq0rN+IHLzdGCeRdCkSN97iH9ZX58cOluqBDyzWc8oSK6CDXHddEco3dJYJrR0GTTghDSsEMLbXKKC5Gc62MOoLbdFbLfXcsls9JJUu7mDVsU8UMB85G7nDTus9n0dE6MrS5IkCFIvc217FHRsFSSgFPETlAI7/apsh9mA8l1x3kq5/6stQZYNw3tIzibArd8v7tj7iE4Cuu+8c9RUm2lqlxMPjXPEejvAs1OewuovQbDaT1d+8c5Ld0qBabH1aRzZSecdtjwascBRZQeNitmRCEPX6NXyeLPOzYYqAjFOZE2NPGitxMAjg6Z71OXR8kAa9XYtRMEvUe3dVqxcYOdxJxI8bKADPKRIFYUKCzW4gb9H9XhjvPn7EPKmmIW1uGSt5zUMM6NKISag+FMMNvIuKIdAj7L
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(18002099003)(22082099003)(55112099003)(11063799006)(6133799003)(4143699003)(5023799004)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MENvMytKSThuVUViRmsvVW0rcnU5em5ZV0ZEdVZWNzZybm1FRDRUQTFjM3do?=
 =?utf-8?B?R2hMUGJzeHpqQ1lWd1ZJSFBQc1cwdDczMXB5NnM4SFRQNTkyOFNES3c3dWtK?=
 =?utf-8?B?MUZLY1EyY3pROFJtcnpLaGlNZ3p5MmR3TGtaZHBTSXhLRUx6c0ZndFBLQlhF?=
 =?utf-8?B?a00weDQyN1R2cnhlV1NoQ0FMMW51Ukh1NTBCcjczcjVXL1hHRmgrMG5PTWFv?=
 =?utf-8?B?Z0I4NzNoZ1RMczJxa0xtWW8ybm1rV3RlT1F4QmR6Si9vanVNcjZNVDArbEVX?=
 =?utf-8?B?bWxxdDlsYmFUZGZtdkhvazVuSjNZTTErU3N2MzRCdVYzVjg3UWpsQjd2Y212?=
 =?utf-8?B?anJidUJwM2pEUDBuZ1FxTHdSdWxFdStpTHZ0NnBoZUtOMFJGTnkrazVyazRD?=
 =?utf-8?B?SWY1c1RuU1F6K0RvL3U2alVreXMyYWNhUUFDaVlVL05NeUd1YlNkb1Nmb2xv?=
 =?utf-8?B?SDlrYTVTMFRHYnZjbTd6N0JOdk1CUm1CZThUOVBKVVk1Z1VhS255dFA5dUFN?=
 =?utf-8?B?b2psNyswaUZmTHl4cktDYytWTlg4UWFwelRPYkNUbEFDYnBEQTBRM3kzQ0JL?=
 =?utf-8?B?cXlqRGRVWjNRUXBWNEtyZmdLSno3YzFKMlBHdXFRYXUwVXI2L3RGcjRhbGFT?=
 =?utf-8?B?aHloZWd6ZThKTHFaaE54ZHREdXpEYjhWKzV0OTRpb0JpQ0IzcmVMM2lZZ251?=
 =?utf-8?B?THNNUndYb2MxTXdEbHdCMnZuSEtrU2RPclQ1dFlha0sxazRVNExzWlZZWEFL?=
 =?utf-8?B?bE5EdkdVamZRWjBDUG56T24yQXJnRW1makM0aE9JeWlwM3hpMmpLNDlqam1n?=
 =?utf-8?B?WWtidzdOcy82bWpyNEk1dHg0UjB0MnlzVnJpL1A3TzFoL1FoeTMrdktVdFND?=
 =?utf-8?B?M3VvVFRtTjBxV01XRG15R0I1N1FmNzRrM3d5U001U014VC92Vm4rRGt6MTN5?=
 =?utf-8?B?WWRDTmJNTVN0L1RXOEphR2J0bHM0VFVPVzJENHJIcUpzVk1ZbHZQa1NKb2dx?=
 =?utf-8?B?L29OTW9kdUVLcTkxdEZjOFpLSGlyQVB1NEdEUk4xbE51aHZKUnYxdzFWbEVR?=
 =?utf-8?B?aVc2WC9wZnB0MEZIcWwvcUw5OGdCdVNOQTBXNVh2N3dhZDY1MDlkMmtsMDFR?=
 =?utf-8?B?L0RoYkF0UnhnU0FCNG1pRTRTWmk4R1c0SUJYMW9hcHVkTGY5MFB4RXlIVDZJ?=
 =?utf-8?B?VmNlbFI2Vm04ZzhBU2pXdHM0ejRNblUxaDZnNzNIWDZIa3ArUWFkSFRaZUVW?=
 =?utf-8?B?cXA1bjJwU2p0MW1kZ2hKWnBvSDdGRkRsZGZQTFo1VnVFRXFZTExvRW5QVms5?=
 =?utf-8?B?RkdidzZDSytPSTN3a1gwYTdJWlRaTjZ2Mk5VRE1IWkNKVS9nUjBuaWpJRDNU?=
 =?utf-8?B?TnQ0czEvQWFtTWpUZGV5MFZLNGFlSTBLbExicit6NTUrTFhvdzUzNHcwYjIr?=
 =?utf-8?B?U1kxbS9yK3Bzd25DVnBvNVJMTjFTRytYUCtXMktHaUhtVitCKzRYZ0VOQWE3?=
 =?utf-8?B?Wmx3UUs3NDEyRlZ1b2N2TnF6RTlsRGVja3UzK3hEQ2VaZGlPeXRJUXh2eE9E?=
 =?utf-8?B?QXJHNEx4dnV4WkozRVVMVkhSYTFVd2tmanJURXg2SFJJSm9qSmJ4SkNGVkpm?=
 =?utf-8?B?WGpvMzRmZ0xIc1N5a3BiZytjbmk3NWt1eXh1NnhsWE9nTnBqTlEzK3BtL3li?=
 =?utf-8?B?THBFK1I2ZmQ4RlRvdE8yTXAydS90MFVUODg5T3gybHYxekMxekVuczNVMjdo?=
 =?utf-8?B?d2FaQTlTZjVVNDIzRkVSekdCYVFjY1U5Y0M3Z1FUalZsZnFzckNxSWU4YktM?=
 =?utf-8?B?UENoUG9NbmplcHpaOGhhRXNxL1JyWndlTXNuaklzbi9YaTZvTTgvZjZDbFpz?=
 =?utf-8?B?eFpXZThwRmJXQ0MyQ3Nta0JYNzFkQ1NZUVFUbDNiSE5YUVFqdjk2Q2xoeTd5?=
 =?utf-8?B?Zi9QZnhiNDRSdjVoK1hDT1N5SCt2aE9NK202RU5oMzVaZ3dXMDNTeU5hTFUw?=
 =?utf-8?B?RlB5bHpra0JJSXh4WHJaVGpva29nT2t6cUNQakxSS3RMMzh1dWRuVGxFT0dC?=
 =?utf-8?B?Y2NpQU14Mk9URXlzZHJuMTczOUdHWmJoamZhWUxrcTRwUWxCL1MyQVBlbWxa?=
 =?utf-8?B?SXpGS0hwZGJxTEFjckZwZjF6ekwvaEUzQzZTN1Z2RXZrdVhuQ1pWNGlxNkN4?=
 =?utf-8?B?ODZXU0tYUGJQUnFrVXN0M0thQjFKWWdvRmo5UW5DcWVEV2NHMm1FWmV1WHZ2?=
 =?utf-8?B?ZXdJcDNmYlE4aHpvYVBuTVh5eU8vM29IRGNYQUhDSDJUaDNwVnp4Ti9SS095?=
 =?utf-8?B?QUJUQTAzNmdYc2FXV3JQc2FNK0YyZUNUQmxhMjdhUWloaHZvcXlEVDhOaVVT?=
 =?utf-8?Q?86ljTfCv3hnTYq2c=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f1c93d-9379-4c44-a1b4-08debce90be1
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 18:43:44.8891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r0VrFPqLz2CV2PORjXT2+UQwpa74LgPmD9bq1hTe4W4TfIPYg5rsUy2qm2ZGKAAOWmkLxASsMEEzYJomjCOuhleMdenJy37H1x52yGsMeBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH7PR01MB8955
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_114359_833272_688E7ED0 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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



On 5/27/26 9:20 AM, Jann Horn wrote:
> On Wed, May 27, 2026 at 5:55 PM Dave Hansen <dave.hansen@intel.com> wrote:
>> On 5/26/26 20:56, Xueyuan chen wrote:
>>> +config READONLY_HUGE_ZERO_FOLIO
>>> +     bool "Map the huge zero folio read-only in the direct map"
>>> +     depends on PERSISTENT_HUGE_ZERO_FOLIO
>>> +     depends on ARCH_HAS_READONLY_HUGE_ZERO_FOLIO
>>> +     help
>>> +       The persistent huge zero folio is shared globally, and nothing
>>> +       should ever change its contents after initialization.
>>> +
>>> +       When supported, mark the folio read-only in the direct map so such
>>> +       writes trigger a fault instead of silently corrupting the zero contents.
>>> +
>>> +       If the permission change is not supported, the kernel keeps using
>>> +       the writable persistent huge zero folio.
>> I vote for no Kconfig options here. Why? This adds "security" with
>> _basically_ no extra runtime cost. The runtime cost is, what, usually
>> one kernel TLB invalidation during boot?
> Plus potentially a bit more TLB pressure from losing a huge PUD in the
> linear map, IDK how much we care about that.

This shouldn't be a big issue on ARM64. The most ARM64 machines have 
linear mapping mapped with PTE if rodata is on. Some machines with 
BBML2_NOABORT support have linear mapping mapped with PUD/PMD, but those 
machines typically have large memory, having 512 PMDs instead of 1 PUD 
shouldn't be a noticeable issue IMHO.

Thanks,
Yang



