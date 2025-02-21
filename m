Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E4CC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 17:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T3WgRzy4kpaXRT3ICE5y2+X96J0Ruon3+7nXfsH9E7E=; b=IGIv3ftr4vbhi6Zp2lycCVdI87
	tS5ncSdOoH55t9Tbd4uAkIFIx9hDdzqRrKHdUARqeS/jekPcHQuh30G+ENHF6qps2XSLV+W5YpLI8
	TalM85j/U4QQ5cV0z+0mmqsIP5X+M4GEN7VkHA8GGboxHYl3ksp5Q+qejPVIGJVyg/mAOYkg8NK3M
	nGcyNfzV34zoyd4F57HFF4UgoCoXROiXBWhbSyMYKwESAv3Mu+onZQFrlpNXyqr7raX5i/Y1Qa63K
	I7ZiPeLrDjqZlfy+hqf+ql3Gon0CMToAIOQwy4IwtCWNrCdgDI4Q/kH8CSPDVV9YJG2GUVStIeNpo
	deY02wYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWkT-00000006MYy-12Hj;
	Fri, 21 Feb 2025 17:23:37 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWiz-00000006MNw-3Efd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 17:22:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UqJb1w0RhnE3PgJkReiSnbLACRjdETplIpluVutu4cHt2w+4/fW/ermL2oLBYZ4ozgjb3/s0shSKOX8T7GWu+LfvSnxnhef0iq2Ziy3kOn1HN2j0HTZTFcyummMUunYqB5t7iT9GabqAYrHF8ojocgLFLhndSRQisbHxQibesejdp+OUvFF/8kLOIh+v4/0pAuFRoI6KaqmHF1qm36g40gMEGf1x10MSTwRvfGeLt50gBmidZGUXoN+N1orOpVRQdGJwkTNLtpRVIK9L2LwhWBwlWo4tz8KeImSdG/RSO1sz4euIfaJDcdUK4Cnz+aMvBR37JxLcapDny+G2lOPtyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3WgRzy4kpaXRT3ICE5y2+X96J0Ruon3+7nXfsH9E7E=;
 b=wGhGTCQsW0ahgXqj7UwT4hRS3eyoRmuY+hn5ZoRQ5uxP/RT8osAyc5G7bnnpk3CKZb9Gmf56iMANJPtQS8eShBFmX7F8Gyi3PV6s6sS0DLmFvlc/kITzDdetVat9iQJksqujKBa9l7oRH9SjlhVHhwT0RT/XMM5V4fDTXfBDmqrZ00rgqUR+zRguvjOk66T7oAEFgN1PqY2e7SljmPO0NgcvSPJjPP3w5enha5jXJLE6m70UbTawdabdA/7UKc7njg/8cQROTeejgIEW7PcA94QbUiXvhwNDRjjrcVnQdnCfEGT4RWAvkBZyixBoq7XoOvN93anKgJZzfPkZfVxAmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3WgRzy4kpaXRT3ICE5y2+X96J0Ruon3+7nXfsH9E7E=;
 b=jDEsU05XYfS+SDgW+Lf/gSnZyFQ02J9L6D+F4FkxDsJXQOefNJJafKfkmh2HLcZ8TLBSWg0IvPTYfAT4LgEhSVGxv/s3JbiAVHjeWtKsvXIDS16KVdTnc/UTm83LtW7dFvg/AJOhzaNecNSvgBc+5IUqfnjluLD6bbKoKpFjhxY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 SJ0PR01MB7511.prod.exchangelabs.com (2603:10b6:a03:3db::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.16; Fri, 21 Feb 2025 17:21:59 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%6]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 17:21:59 +0000
Message-ID: <d34a5bee-14ab-4e63-9910-bd5fdd5bea2d@os.amperecomputing.com>
Date: Fri, 21 Feb 2025 09:21:55 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] kselftest/arm64: mte: Use the correct naming for tag
 check modes in check_hugetlb_options.c
To: Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250221093331.2184245-1-catalin.marinas@arm.com>
 <20250221093331.2184245-2-catalin.marinas@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <20250221093331.2184245-2-catalin.marinas@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY8P222CA0003.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:930:6b::27) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|SJ0PR01MB7511:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bcda6e7-ec26-418e-7cb5-08dd529c3f78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHd2RTFseXB0eFRNUlZYMWVqMHhaalFSK2lab1VrbFArUlIwRUhWZ1daelV6?=
 =?utf-8?B?b0NFYk9YWkI2R0FZQVFacU1wT2pDWU9sQUlUK0R6V3NibyswL29XdTZqOVBS?=
 =?utf-8?B?Y2hrWitkNEtWclVJblFYd0ZPK0dIbFJHRlV2N0pRTkhrVE9BWEVkaS9SaUJw?=
 =?utf-8?B?cGRPRDg3WHZNc0NvVjd4ZElSZTJvQ3A0S2VWRkpYcmo1UmJVVkFWRit2aFNo?=
 =?utf-8?B?NVBuMWJBUTVpTVlvOFhFeVNwc2JHL2t4aGdhV2F0RFJmNzVkRjIzVTEyU0V0?=
 =?utf-8?B?L0dUUERHK1o2cVFrZjhkTGlxS1hNYzlXMDgwelZpc3U5NjVuUkx4TGYxd2dH?=
 =?utf-8?B?VlYzQXBycTFMamxkYVdQdTN4YWVoTGlYcE8vL3FzOWpnY2M2RDd4ZXNmOXpx?=
 =?utf-8?B?cG1HalJSaXp2Snoyc3F6dDlOVFp1ODhaaUszM3U3d21haldBRFVJRGl6WE0r?=
 =?utf-8?B?R1kwUXliRXVWNDdyRFZReE9ubWlUREp6REJ3L2ZTS1I3c3NpOGJ3WkJhQ0Nq?=
 =?utf-8?B?Z1pZSStIcEs5SnVuOVhJNkZPUmFxLy9IS3VDN2JONzRaMk1yUjFxVjl6RmtQ?=
 =?utf-8?B?MHdyTTdiMWVkT01MOHkxWGxIQlNoZG1jRVNRY2VXd1JRaUR0cTBER3g0Z0Za?=
 =?utf-8?B?aVpSRTJ2YjhvUjhYZk52U3BBY3did2luTVdTVVZOR2tHYTRON1hSOEtoV2lm?=
 =?utf-8?B?ZGhlUm56Qk1BSERnK1h2STcwNHdRRkVpQzljeVREZ1NHelJIWWYrN3VLYmdY?=
 =?utf-8?B?NTB5eDFZcTVseDc5SWxwaFhzQU5sMDdRZWwxNXZhOXVsRHE4clQrQmM4SnRq?=
 =?utf-8?B?cjdIQXhuWEsxMVIreHI4TWszSDI2OWNsSnplRzkvcCsxVHp4Z1NmeStWNDE3?=
 =?utf-8?B?eGtNTitUZFBJb1Q1VWJYZENDcEJReVRPQ3BsT0p6Mk9PVDdTZmo4V2lITnc1?=
 =?utf-8?B?Y1NlL0oyd1BLNmtxZkpZODNDUWJCYmhjQXpiZEROMkd2VXU2VmFCZXUySGlv?=
 =?utf-8?B?Tm5FOC9xZm9wb0dvTUJ6NkF3bzV2QzZCTjZjR3lRK3pTRkV0RmhSSGxSeDRQ?=
 =?utf-8?B?OVlIU1FDMGRYTCsyY0lwc0VScmxYbW5WdHVna3BNQXNVcW4weG92aEpSNmZU?=
 =?utf-8?B?TG02QjNYODVLc1g1M3hQWG9RN0JuMFdiZXg2Z1VFbFpISEJSL3JSRzM2REds?=
 =?utf-8?B?czYvdGRXT2NnKzE1dFdzMzdialB2U3hkTTMwRGdscWVjUzdxYTlYNUxId2l6?=
 =?utf-8?B?SVduaEN3YVRrN3prS3ZBNWZDamRZY3ZCQ3NaZFdCRmlUQ1JwL29scHNtUm5O?=
 =?utf-8?B?b3hjalNmVW12Y09vdzdsRXBSK2Z2bHUwVVd4Mi94SUNQNHA2RThSVTM2amVE?=
 =?utf-8?B?R0tac3FKT3RiQlExbTMzRmIzOUd0bUdtMndVNDhsQlAvYnNvUEJudEg0N2tJ?=
 =?utf-8?B?RWkrVXZUV2NBbzVoajJpQUxkWEVzRXlaQzFqUm1sNFFhWGl2TUxwMEcyaHhl?=
 =?utf-8?B?Q0lPcVRGUFo2ajdLd2JGTlh5dnRmUk9SM3RqeC9PdmxJQkZaWkt1NnFUbTZT?=
 =?utf-8?B?Z21lUG9LZWpyTFAwQW91elRhaml2anUxSVlhR0I2ZHZjTVVnQ1ZWaDZYYVhJ?=
 =?utf-8?B?VE0vM0N6M1MwbVNKVWJZd0dGUnZHeUtEYXRScmtCbUkvY3JtODFyT2tZcWo5?=
 =?utf-8?B?bUwrUHdsUUZwVU9jV3UwOENJNjZDdWsvNXl6R0dnYjlOemhnK2dFU2NvcjJk?=
 =?utf-8?B?cXdYREdWZ21XY0pUQkpML2VhQ0s5RE0vS0poclI1T1lQU0s0bTBrUUJqWXBy?=
 =?utf-8?B?Wi9wNmFtUm5CVW5nUkl3cmpxUWJ1VDVldGtuNzg5RWJOZzlKQmdBT1JHTWF2?=
 =?utf-8?Q?tYpVxzGF/gur4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDg5M2h6WEM4eGUreUo5M1B1OUQ2WlY3bU14NXdPRWJWS3Q1N2dOUzlkRXJV?=
 =?utf-8?B?MXdTT0pMd01UUlN0aFF3OFRIUnhBRWJzbWdsMy9UdzNkZ3RIa0xaMGxJMC9z?=
 =?utf-8?B?YlZGSFBQdjlMVjVSNE40QmZVWlhRQm9idkRiYjRVeEh0YWFLRldtTkJzMzM0?=
 =?utf-8?B?cDdlUCtTazRZUXdPZ2pidDVxUHd6eG1BeUU0ZFdUOFNJV1d5MmlKNndHNEtH?=
 =?utf-8?B?VVdPRjVvajNnUUYyczlDdThVUlB3S0EydUFSZFNuVU8xTmNGQWRwZk1TS0dR?=
 =?utf-8?B?ZHh1Vnp1OVFWNlZWaXc5VnNoUGlKek54eWkzVFY4dDN0M2F1SXVHNFlWOWYy?=
 =?utf-8?B?ZCtER0VySmhpY3pOUjRZc3FhSERGQm9uNkZVUVlmYXh4WnBNKzFxZHBTWlNj?=
 =?utf-8?B?QXEweW1kV2hHMWVVRVlXMGNzODlWOFQ1QVJtRzdMdVAzd1gyT3lBS01KYytq?=
 =?utf-8?B?eUpjODc4RWZuaUtTQXhuTndoQzVQVHBDYmNSSnJmV2lwbWN6MU4vMFI1QW12?=
 =?utf-8?B?bkJGaTBhS1ROMnR1Q3BjNW5DTlNoOFZJK3VjZzdZSzFoK1QzcUZQeUpydGtX?=
 =?utf-8?B?TndzTFFEVEp0eHFXb2NmOWlCbEk3K3lXeG5TamZ3T0grTEFDVXVtMFVMVngz?=
 =?utf-8?B?eU02cDZSR3ZXUUc4eTE3REtqa2VZbzMxdHI5V3hnbHpwZDJJS0NtNEVFQ1Rr?=
 =?utf-8?B?UXZzall3eGg2cTJQbnErS05XWWM2RWlnMkRwR0dOcWs0SkNTdm0vWE1VVTVB?=
 =?utf-8?B?YW1LMFVKa21aMlk5MHEwYU1hS1RtYmZEd0IwaG9pUmNwN2RjR2x5WGlEc1FS?=
 =?utf-8?B?RXZFeE16QkpxSUNmZ2VZOUhaZjVyNy91WGxrelI1Q3ZuQUhMNHFsOFFhZVZ1?=
 =?utf-8?B?MERsT0JTZnFwYlQwaE9WQUtxNXQrUDgyenJEOHJTc09iL09melpVL0pBTG0x?=
 =?utf-8?B?Z3ZoOGMzYU5BaHovbHBJRnhFak9yMlJwWlJoeGlHNkd3QnlaUi9vNUNyNysr?=
 =?utf-8?B?cW80ZE1LbjNsL2YxRVFzeGhyMXZKcjRVMFBhL3ZjYjRaYzJGR3pvNUxQL1hk?=
 =?utf-8?B?V2ZFL1ZWSjI5Tm5LWUo4SlVXQVpnMUwvWVNENGRhQk5YbGd1UkdocHBZOHNV?=
 =?utf-8?B?OVJJeFZVLzIySTVNQzZyV0NlTmd6K3hvaFhZOXlGeWhIM0tEdWJLZmxQZVlh?=
 =?utf-8?B?MS9PZGFZOWd4TUlDaHJLeTlnaExuZWp0QjEwS21ubFVPdE4vcjVBRnhpQk84?=
 =?utf-8?B?bmtrTmlsdUVaTWliVmFKNlZSd0hqdy8wQzd4WjhhTnl4dU1zL2RycGlrMFFv?=
 =?utf-8?B?UWRMdWp6MGhIUWFGcUUzZXlpWFBHalh6d2wzRXd4UFFtRFBSK2RIRElVdll6?=
 =?utf-8?B?Wm9KUjhJc1lKMFczYlBFcFdHK2tKcE1nMnhHMElCTEJVcXU1ZFIyZlRYY3Rh?=
 =?utf-8?B?b1pldWhaNXVIcXlselhMWXB0RlNQelJwWkVhQTJrYlVOaG5RZEdZdjBBTmZo?=
 =?utf-8?B?Q3o1dFhZVHYzZ3phTUdWTnp0aVRZcDVYSFFDZ2hrWHZQb0ZURUhlTWJwZ3I0?=
 =?utf-8?B?aDVTdE9TT2JvOWR3NlErN2YwV1B4WXhDOStxaTdDU3FUcEJURWJoL1VnYU8v?=
 =?utf-8?B?SklmTWJHYndiTU4xNWFueFVWcjJNZnQ0TlMrVmdDQVJEU2RBQVN1WDBkSGY2?=
 =?utf-8?B?cnZSbUo2SWtvekdtZHhUc2JhN0JKelFaVXEvMG1FVnJpV3lhZmtkZ0ZxM1d5?=
 =?utf-8?B?U2xrN2JqUTBJYjFqcjNSOFUvTmFHbnpWQUJLTUx0ZklDRGdDRW13Z0JzeXhk?=
 =?utf-8?B?R3RIZG5yT3dMaGl3Z2NwcVdaYVBZK3BzV1VXN2h1NVBhbzZIN01IS28yM1RC?=
 =?utf-8?B?ZVh6UXh5azgzcWJoaEtBK0k4NlRsa0l2b2huamhCcldyMC9raVB1d1QzekZq?=
 =?utf-8?B?SFE2dmJPc0NETEtwNGhMZVJINjlkb3VHY1RUSmhmSU4xUllxL2VwUjN5T0p6?=
 =?utf-8?B?cEtzbERORjRxVThhR3QvRXNSMklaZkVjUktzTU9CWnJTUitXZUsvT0JnMzJR?=
 =?utf-8?B?am1ZK2gwQTdXUC9yN3NJaUZ0dS8rNTcxMEE0MlFnTlNLRlJoMU9Mc1EyK3ZQ?=
 =?utf-8?B?R1pGUUpZbWtiTEx3TVBXYmx0M1I1VW05QVpiZmFSaittM2twMHJUNERXaFFS?=
 =?utf-8?Q?yxkCKs9irzU7Lf/OLAEdjqo=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bcda6e7-ec26-418e-7cb5-08dd529c3f78
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 17:21:59.1302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BwskpQ05tG4ljN4521Yij+UzhVy6ekQLJ28DgycnLJyfgEOnhwAadYX9FtOAuLpTynEEJnDCEBHZ932Bj4S7tGXKNEOllWG3m82A1Rx9myA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB7511
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_092205_828167_C56A1F8B 
X-CRM114-Status: GOOD (  12.22  )
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




On 2/21/25 1:33 AM, Catalin Marinas wrote:
> The architecture doesn't define precise/imprecise MTE tag check modes,
> only synchronous and asynchronous. Use the correct naming and also
> ensure they match the MTE_{ASYNC,SYNC}_ERR type.
>
> Fixes: 27879e8cb6b0 ("selftests: arm64: add hugetlb mte tests")
> Cc: Yang Shi <yang@os.amperecomputing.com>
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> ---
>   tools/testing/selftests/arm64/mte/check_hugetlb_options.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Yang Shi <yang@os.amperecomputing.com>

>
> diff --git a/tools/testing/selftests/arm64/mte/check_hugetlb_options.c b/tools/testing/selftests/arm64/mte/check_hugetlb_options.c
> index 303260a6dc65..11f812635b51 100644
> --- a/tools/testing/selftests/arm64/mte/check_hugetlb_options.c
> +++ b/tools/testing/selftests/arm64/mte/check_hugetlb_options.c
> @@ -270,13 +270,13 @@ int main(int argc, char *argv[])
>   	"Check clear PROT_MTE flags with private mapping and sync error mode and mmap/mprotect memory\n");
>   
>   	evaluate_test(check_child_hugetlb_memory_mapping(USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE | MAP_HUGETLB),
> -		"Check child hugetlb memory with private mapping, precise mode and mmap memory\n");
> +		"Check child hugetlb memory with private mapping, sync error mode and mmap memory\n");
>   	evaluate_test(check_child_hugetlb_memory_mapping(USE_MMAP, MTE_ASYNC_ERR, MAP_PRIVATE | MAP_HUGETLB),
> -		"Check child hugetlb memory with private mapping, precise mode and mmap memory\n");
> +		"Check child hugetlb memory with private mapping, async error mode and mmap memory\n");
>   	evaluate_test(check_child_hugetlb_memory_mapping(USE_MPROTECT, MTE_SYNC_ERR, MAP_PRIVATE | MAP_HUGETLB),
> -		"Check child hugetlb memory with private mapping, precise mode and mmap/mprotect memory\n");
> +		"Check child hugetlb memory with private mapping, sync error mode and mmap/mprotect memory\n");
>   	evaluate_test(check_child_hugetlb_memory_mapping(USE_MPROTECT, MTE_ASYNC_ERR, MAP_PRIVATE | MAP_HUGETLB),
> -		"Check child hugetlb memory with private mapping, precise mode and mmap/mprotect memory\n");
> +		"Check child hugetlb memory with private mapping, async error mode and mmap/mprotect memory\n");
>   
>   	mte_restore_setup();
>   	free_hugetlb();


