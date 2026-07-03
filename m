Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8FDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 00:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YMRi94ua8l1twnpvm0eV26rVKH5H6Wa/ERW+ZvB8Y8M=; b=2RcNCCxpszShNRu0hyzqwsN744
	tw71pvhL7IVFZs66WqfPFgOXIfA4iNTQVUnvsQbLCVq3/W4xyN4Vp7csE7lZhLBbDz/LSiB28llwb
	N2ODeKNTcVdckgV2kJySm7wIj7JUV67KxKwmII3bTa3u5s0y7aeNKbU71RR9Jg15qqIAr40lRZXHg
	8lM1gvhbLVzYof9uvMoBJXeGjabI/6ZPKYQqREmAhH1GnkUnf0XG3Kfc0UeRVeVXddy8F0f3VkLPw
	ogZegGvX3DRUoMV9rI7nf/wUB8p5TYY8JKGpl/hY22wQ+Szg0UGr3Ez7ezh4mTM2sS1hCFSp7mjy9
	GSu2lHgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfS8G-00000005o4B-00ff;
	Fri, 03 Jul 2026 00:51:52 +0000
Received: from mail-southcentralusazon11011023.outbound.protection.outlook.com ([40.93.194.23] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfS89-00000005o3X-2TBs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 00:51:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AeMEDIKgO2D/WI2hekGYogESG0hVIRADrJMQfr4V/aT8gTBZ+DzyevePo4kAioy8qbJFDm6WHVg3hGSlSpuEaScIn2CcMhAcHir3YVLDYS6AsrC4RmsjMugOhuLiM/wbrafTH0pFERIwaX7IddAmnqvVo/tXGno3Lsu/MVIDBhutoZeh+fCsB2HuYzapI3GpsYh68jUxL40iCZpk3Nd20KjBznJICuBMbG08MwZ9PUPT1l/Pq0G7kjprdLU2D0+8LmryRCJVLcQgQD9ZO0DJUMpDB1d4Tno0zj24L/Kmt8bu8KF28ctrUD66dhTlKcXZtWU/f9OHBgciSTwCBr1atA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YMRi94ua8l1twnpvm0eV26rVKH5H6Wa/ERW+ZvB8Y8M=;
 b=IJEGyT6uHXX9sGh30lAEsxxtJa26jO5p/pnjWbVt6E2uQADzD0nn5KerdebpliPYnp76XLlIG9oQsofY6ps98bI3gBp2mlNcNNt+/l91IRLyFrepe3WnLCUUBLV/2t7utjGdPjyRsD+6TkNGsT29rvH/EANdWxvA1RCGGQASWh2iluHu5xlwdvr1nGn5UV9+W2Zl96pZRRWLzkXi24e/wCGwoRHYL7c8ouwfQ6c8usySBuea2mjGYP0fARXE+8lTzF7KSfc5R2ReqA8/VNbpK82aKaQk+q8BsVp71hJwnCBw/m26KnRi2FcN9GeeJsmV+OCNYSeioCQ1Dt94Ve0ZDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMRi94ua8l1twnpvm0eV26rVKH5H6Wa/ERW+ZvB8Y8M=;
 b=Tc4EXZUYY3Do+INSbUxF2jY4S9lVV7H/kGPbgGUwoNbkqPbP9hLTAGdejlkDMRpIFyVJy/hmQMQRWoWWRQg9IQOVG2WWgA2Khs8+VwI73qAbWZM0lTfDi+8HkUR+SZE4elSytRH7D8TESzKAH2FSK1wp1hqaB6ENpY7sls19xx8LnvfoY/1dT73MC94K1iZTJdcJU+wnhASJQdLZfTGYrgvZ5doWIPsFO6jW8mh1N9uvC0dRa9cM0P0h/qYtDMoQA5Gzv/0yoejdhz/bYQSpeWAdbk3Hjrbh5JWD+wq//RBIMvYOmU+vx5nMxkbpoC70PZnrKrf4eLLVnvVVUHQpQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB6089.namprd12.prod.outlook.com (2603:10b6:208:3ef::9)
 by CH3PR12MB8284.namprd12.prod.outlook.com (2603:10b6:610:12e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 00:51:38 +0000
Received: from IA1PR12MB6089.namprd12.prod.outlook.com
 ([fe80::abd0:32b3:6f57:1d3c]) by IA1PR12MB6089.namprd12.prod.outlook.com
 ([fe80::abd0:32b3:6f57:1d3c%3]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 00:51:38 +0000
Message-ID: <cb745e73-26ea-4d3f-80f2-ab3467e68426@nvidia.com>
Date: Thu, 2 Jul 2026 19:51:27 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] arm64: errata: Workaround NVIDIA Olympus device
 store/load ordering
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Vladimir Murzin <vladimir.murzin@arm.com>, Jason Gunthorpe <jgg@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Vikram Sethi <vsethi@nvidia.com>, Jason Sequeira <jsequeira@nvidia.com>
References: <20260625182425.3194066-1-sdonthineni@nvidia.com>
 <20260625182425.3194066-2-sdonthineni@nvidia.com>
 <akPQ8F3OgER621UP@willie-the-truck>
Content-Language: en-US
From: Shanker Donthineni <sdonthineni@nvidia.com>
In-Reply-To: <akPQ8F3OgER621UP@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9P221CA0008.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::13) To IA1PR12MB6089.namprd12.prod.outlook.com
 (2603:10b6:208:3ef::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6089:EE_|CH3PR12MB8284:EE_
X-MS-Office365-Filtering-Correlation-Id: d334596a-aa4a-4754-b097-08ded89d3d2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|3023799007|11063799006|4143699003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 0is6dAHWcQkxgdZB9ZpxCAD6pnthZDSc4uEbK1tXnXcfWe0U+MHgQ785mpyTgZdDlOZiSmVAY5FNf1n8rC1M16FqI9lrbkvXc2oxyuYHdcn/gIAwgxcwrOgbLab/nLn1Q/jWp0482NDG1wc/VZPiF6GY3pelA8+8mHux5G3VpNDRFdUUvrVb4gdCbb6Fv7Jikguuo/tjkAbr6N8wY4InmNE8Yre5gBG1M3GLlwNicIwXltG8h5D6Lwie+t97LDFM/xo0vJAFRI2lbiol4HU4dC23+XSjkNPZ+MB8pQYiVrZ+bYpeI1Fku48pjLtQiiNFq4Yi8npPJ8rGM+DNVhWXpydwYNsyBsnrsINZuUpmFUr/IrlNh89PT3bAptdvTpwlu6ax0RRn8QpWHFLYTix2f285fOOJ7JzQkEX8BQVcSeTyNxMlkmDE3bQIMcqx11FeY6DF4KBp2eASzbsrkOSdsUlgrPNpNExO+wR98jVlpC/cj4JrZ7jcliRzS0AVz+QEbXdPd6OQtfLvfbaCljQGmkHqz0PKyemHi84kTxsmGagSH2niPyu/mPLfsWmWxLJCdEh2undCmZb8NOYh40gOEHDRa2Kq0zYJdZnD1Ax2l9SjPesiOVrWBe2cWVlpUQyhdDCCSc2ZPJtebtuuALbG3a+rbmW4psWjCBmjkrpXZW8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6089.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(3023799007)(11063799006)(4143699003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dThKL0hIL0tiaVpvSHZzQ1Zod2d2UURXV2kzSHZPZE9KUUkxSXRzN2RZYTZv?=
 =?utf-8?B?WmdxRWwyYzF6Wi9CSHdrQ21TdmZKbHRrRkZqdXpQUFdxbVdNMHN2NE1hV01L?=
 =?utf-8?B?K1NVOE1Pb2RWK2IxUjdhYkpBVGs4WFZ2NHlEM0tTS01ZTTY1dnlMRUdaeXJE?=
 =?utf-8?B?SklOOTNzbVgxbldPTWYramorOVh2NUtjN0RpTUg0K3JaR0tFcC9GYWE4dVR5?=
 =?utf-8?B?dlEzOFllRmY4b2tDZW5xMW41ekxUOFlteHQ4YU9aQUt6dDlRby9jcFNNb24x?=
 =?utf-8?B?aTlRdGRIdFNSUjNGSjRhNTN2MGJwVGZRb3VYNlMwTEpkSEZLZHpFSmdrdy85?=
 =?utf-8?B?WS81dWFrVmZXMXZXaWwxYmZFeittU1dHUFlZUTZZaDAraEtUZ1MxbEZveHZa?=
 =?utf-8?B?M0dHOEoydlhJWDExUFowcUpwcjhvNFRPak9WZHZ1aUVxZzM2MTVaZ2gvMXI2?=
 =?utf-8?B?TlM2QzdmcUZRNExYVWMzdkpuQ3VGNkJGTTFpT2hJR2NPZFV3Q3o1TlJuYVEz?=
 =?utf-8?B?L3NtL3ZYRnhGUWprN203eWhXTUlodE4rT1RaY20yc3JJaDNsekFVWEhqMTdI?=
 =?utf-8?B?U1RNSGp4ODA2RVllTlQ5ZjM3cklLNEtpdTcyWEhyc1RiUWIyNXlMWUNtVEIw?=
 =?utf-8?B?U0lDaHY2NitIVTVOM3lqNStCV0JLNFczZGthQk9Dd2ozVDMxc0hrNWFYc1cy?=
 =?utf-8?B?ZTg2WFR0cE9VRmlGRlN6cUo0VjNtNHR2cytvdUkrNjdVZ3Z6T1Fla0VkdkEw?=
 =?utf-8?B?ZHNYb2R3anozcHJFOTZnWGNIcU9RWDk1dXBTRFlhUzhiUXRjRFNOV0xXS0NS?=
 =?utf-8?B?N0x6Mlpzd21GQkFOVHhUanZid01tbGpWWlV5Vk1vZHQzcXpOQ25HcExmQTBZ?=
 =?utf-8?B?V2RHeVp1VE1Zb1JoU1BvRStxZzlHQXUwZWw3eEgyVE9nVU03dXdvSEtTdmpD?=
 =?utf-8?B?RGV0cGNuL01CT1FFdEdkSTM4ZWV0cVJqdzRNa1M3dFFYL2U3VWswS3ord0Uz?=
 =?utf-8?B?ejNuK3BOdk1oLzIrbWNCRmo1RS9XVVFGUlJUSjFxZ1ppcmFsbzBGTFhSNFhU?=
 =?utf-8?B?dnJjcTIyRnI3eEVtdFFUb0E1dkVmaWd2L2ltRGhnMnBISXhGTlVnanM5YmFO?=
 =?utf-8?B?NXU1MXdFS2pXN05qTHR1UzB5ZWZqak9KdmRLQkhqdk02WWRlYTlUT3VtOUdr?=
 =?utf-8?B?cWJQOFcvak9teVVPN3FtWXM0S1I1YjFWMUtMeVB6VmVhUy9RSVpVNkxhUDFj?=
 =?utf-8?B?V2R0amxrOVI1aWVTUGJxZ2FwZmIyYVIwdnNNWHhWajhLQnFVUkZjQTI1VlM1?=
 =?utf-8?B?QUhHYm9vZ1IxSjZMTW9hTGFWOEl0Z052ei9LVG45ZTV3TUZMWTFuMGUwREtE?=
 =?utf-8?B?RUE1TnFWQ3ExTlhSVWRpYjNTeHZMa3hXeFZCUUZyV2Q2RUZqMVF2LzFJMXRW?=
 =?utf-8?B?eTIvRFh4d09iMWNvaVRSYnloV0xTSDNxSzlBU2YvSVFsMGgzYS9lWmQ4SkJm?=
 =?utf-8?B?Q0Z0ZTJaSzZtQkNTTTdrdGtQV0NUSU5lL01HbEhLU29LMzkxMm9qTHA0N3px?=
 =?utf-8?B?QXB0Ukc2bzcxZDZYTnNiL0YweVZPaUlrSHVIYlRsNjhvYUtobGUwSlBxYjR3?=
 =?utf-8?B?TmN6MGt5Mmg3aytWWUl0bEZOemd0bUZsV0xnVkdqOUxEQVlta2krazY0WDll?=
 =?utf-8?B?WHNpKzFuaVJ5dFFtWDBDazIyek1kVWxUNGMvVlJaQmR3WU1sYmgvbFozUVJ1?=
 =?utf-8?B?MllzZzNGN1VPc29UNG9RZ3psWU9FdWRBSUtXM20xYlZKeldKL1AyNlA2U2J1?=
 =?utf-8?B?NVQwVGVvcDYyRGU2aVN4UHdBQ29ib3BmSmlVOEpRdlBLUU1IaGhkdzM2YjJD?=
 =?utf-8?B?bUJ1a2FzdjNweDQ3bVVkaG9nR1NxcHFlbDRqMTJHK1ROYWtiSTJBdjlIS2Vi?=
 =?utf-8?B?amxuOEg0d1pGVW0zdWVVb1pGMkpRWnlBWitMb1hJcEJiMTY3Mm1Sc2J5MVpX?=
 =?utf-8?B?LzVvenhFOHFreGpPdHhSOFpqc3h6c0M4dmNNMlR3c0JZekwvQnUzeUg2NkJu?=
 =?utf-8?B?Sk81Z05EOHczWkZuN1VPNitMNjduMzB6Mkg4RldVdDJnc204dExPSVE4ZHA4?=
 =?utf-8?B?T3c1VVlEUzBtK3Fpd2JGSW9oUzJtMDR0d1JCZFh0Zm5JNm92STl0QWVFY2lD?=
 =?utf-8?B?bHIzdWIzVzhsaE9SMGpvWXFoYUVwUDIzK1NwcmtCMHFmbyttS3oyVlZMb2NX?=
 =?utf-8?B?alRmdTJMM0sxdll0TDhydWY1UkUrWW5aS0tkUHhzREJWYjBrbjd4eXNhaW8x?=
 =?utf-8?B?QXRXSlBFZVAzZytHd08rZ1h1ZmpidExOMG92eWxLOWVhbUs3ZllXdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d334596a-aa4a-4754-b097-08ded89d3d2c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6089.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 00:51:38.3773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qjaGfa7i4B7rthEt1Jh6c3QmeODX7GQxFcpQ3dCn1BRyJ/9jy8wLzDSk6OW0qWdYQRlsLxXP23KXJXRPL0Ri3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8284
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_175145_638590_D1CB00AD 
X-CRM114-Status: GOOD (  20.08  )
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

Hi Will,

On 6/30/2026 9:21 AM, Will Deacon wrote:

> External email: Use caution opening links or attachments
>
>
> On Thu, Jun 25, 2026 at 01:24:24PM -0500, Shanker Donthineni wrote:
>> On systems with NVIDIA Olympus cores, a Device-nGnR* load can be
>> observed by a peripheral before an older, non-overlapping Device-nGnR*
>> store to the same peripheral. This breaks the program-order guarantee
>> that software expects for Device-nGnR* accesses and can leave a
>> peripheral in an incorrect state, as a load is observed before an
>> earlier store takes effect.
>>
>> The erratum can occur only when all of the following apply:
>>
>>    - A PE executes a Device-nGnR* store followed by a younger
>>      Device-nGnR* load.
>>    - The store is not a store-release.
>>    - The accesses target the same peripheral and do not overlap in bytes.
>>    - There is at most one intervening Device-nGnR* store in program
>>      order, and there are no intervening Device-nGnR* loads.
>>    - There is no DSB, and no DMB that orders loads, between the store and
>>      the load.
> Does that mean that a DMB LD between the store and the load would
> solve the problem?

I appreciate your suggestion to leave __raw_writeX() unchanged and apply
the workaround on the read side. It results in a much better
approach, write-combining performance is preserved and avoids dgh()
promotion to dmb.

The hardware team has confirmed that DMB OSH between the store and load
prevents T410-OLY-1027. They are still validating whether DMB LD is
sufficient, so I do not want to rely on DMB LD until that confirmation is
available.

> It would be interesting to see how your benchmarks motivating patch 2
> look if you leave __raw_writeX as-is and instead add a barrier in
> __raw_readX before the load instruction.

I profiled memcpy_fromio() after implementing your suggested read-side
workaround using DMB OSH:
   - Patch 1 leaves __raw_writeX() unchanged and inserts DMB OSH before
     each load in __raw_readX().
   - Patch 2 provides an arm64 memcpy_fromio() implementation that applies
     one DMB OSH before the block copy and then uses direct Device loads.

With patch 2 applying the barrier once per block, the results show no
noticeable performance regression when the workaround is active. The
micro-benchmark uses a write-combined MMIO buffer and is pinned to one
PE. The loop count is adjusted so each row performs approximately 10,000
64-bit MMIO loads in total. The table reports the per-call latency of
memcpy_fromio() in nanoseconds, with CPU cycles measured using the PMU
cycle counter shown in parentheses.

+-------+--------------------+----------------------+------------------------+
|  size | WAR off ns (cyc)   | OSH/load P1 ns (cyc) | OSH/block P1+P2 ns(cyc)|
+-------+--------------------+----------------------+------------------------+
|    8B |       830.4 (2735) |         835.0 (2750) |           835.1 (2750) |
|   16B |      1660.1 (5468) |        1669.6 (5499) |          1664.8 (5484) |
|   32B |     3319.7 (10934) |       3339.1 (10998) |         3324.1 (10953) |
|   64B |     6638.6 (21866) |       6677.5 (21994) |         6642.3 (21880) |
|  128B |    13275.8 (43729) |      13355.3 (43989) |        13279.0 (43747) |
|  256B |    26549.7 (87480) |      26714.5 (87993) |        26552.5 (87475) |
+-------+--------------------+----------------------+------------------------+

Micro-bench test:
        local_irq_save(flags);
        off = 0U;
        c0 = wc_pmu_read();
        t0 = ktime_get();
        for (i = 0UL; i < 10000; i++) {
                memcpy_fromio(dst, map + off, n * sizeof(u64));
                off ^= buf_size;
        }
        t1 = ktime_get();
        c1 = wc_pmu_read();
        local_irq_restore(flags);

Patch 2:
void memcpy_fromio(void *dst, const volatile void __iomem *src, size_t count)
{
...
     asm volatile(ALTERNATIVE("nop", "dmb osh",
                  ARM64_WORKAROUND_NVIDIA_OLYMPUS_1027)
              : : : "memory");

     while (count &&
            !IS_ALIGNED((__force unsigned long)src, sizeof(u64))) {
         u8 val;
         asm volatile(ALTERNATIVE("ldrb %w0, [%1]",
                      "ldarb %w0, [%1]",
                      ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
                  : "=r" (val) : "r" (src));
         *(u8 *)dst = val;
         src++;
         dst++;
         count--;
     }
     while (count >= sizeof(u64)) {
         u64 val;
         asm volatile(ALTERNATIVE("ldr %0, [%1]",
                      "ldar %0, [%1]",
                      ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
                  : "=r" (val) : "r" (src));
         *(u64 *)dst = val;
         src += sizeof(u64);
         dst += sizeof(u64);
         count -= sizeof(u64);
     }
     while (count) {
         u8 val;
         asm volatile(ALTERNATIVE("ldrb %w0, [%1]",
                      "ldarb %w0, [%1]",
                      ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
                  : "=r" (val) : "r" (src));
         *(u8 *)dst = val;
         src++;
         dst++;
         count--;
     }
}

I am also discussing with the hardware team to understand any broader
implications of using a read-side DMB instead of store-release writes,
and to evaluate the correctness and performance differences between
DMB OSH and DMB LD. If we proceed with the load-side workaround, I will
drop patch 2 and keep the implementation limited to the raw read
helpers. I will post v5 after receiving their feedback.

-Shanker



