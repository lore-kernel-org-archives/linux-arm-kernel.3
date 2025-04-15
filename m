Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F250CC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 17:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=geC3ZZywBXUpRLxBXH+7/PGAvP+uOI8nVJnCo5nRy9M=; b=xNU2GpXWUeFIQgtof01c+YNHyq
	lMFeJo6/U4D3CMwQxHK5HMtR8Sf/JwMhcAcvRQtNXJV+/eK4aKs8zzROqQLhkOcqTHMpqMkmj0Mbk
	fDOCoqqlteEO2W3DYgVpS7/EGghSjpa9lOQvvAMsmJIKI34zSlGYMviFSSsmxErLVXSV5tUv/oWGq
	1XoMeKUkZcBM5LyvtEM8X1qqrcgSA0Rrw5m7QfgV0f4rjhdI63STXUoza4Jvl8iuBQImVQ8qxPeqU
	FTAB7/SjPZP8GqjQbeOuIb7WkGgGmsp+q6/y7p8EyEEIxUZOOhxM28yi9WJJmR1MWz+rS8bdUGtpX
	pIzErgmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4kYd-00000006eT6-0qGe;
	Tue, 15 Apr 2025 17:58:51 +0000
Received: from mail-westcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c112::3] helo=CY4PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4k7U-00000006ZX6-29ou
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 17:30:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BAG2cpwFpy92yv6Jtc7C+4LVJL19aAnz/FaiFSgmGkcDQU4Z18LFllW2VjwJFTRVL4dD448YaEFGad3wzTfCu79wor7FMK8xL4R2XCazPJX9/bpUqDxbOJZTpPf3osVSj51wP7mQ1HHhxu8jEhqdFU3cs4XkngGf/PX2cx1tnFUzU7wnSWLnflOS8zh8YJi0thZfrCafNV61jPC7Nrgpa34fbp6vS2D7TPJ8mxC5NC8ci3TulfDUvwiviCrqPEznLNcRGZlZv0A4ZiVIuOssYGd03qJTVdWNqpnqvV+JyR8E1HLd1eFB7uqjzoeHXZBCY7EnOm0KoqMb4vT3IAH++A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=geC3ZZywBXUpRLxBXH+7/PGAvP+uOI8nVJnCo5nRy9M=;
 b=R0w7eJaRj53X5RaBUONfli/VXT3xIOF8/N7LJmb9Te5YnvXdiVFKy4vY1v6KS4c2NDuMhthx0B8JEHWR+xSYeQ3GN1YeT2D0zVFN9xPN3L4R03NULpDafux01cQFpI7UYNh2dJG8lt6BW1kx1eLIPvl3/aZWU5e82+/qSqDlyzH4s50QKHs70Xqmumj0L4pw9CNjzo6/EyB8TJakclGLeOgh9veie7A82XJAmToWG2cR+hvsWFWbw/Ecz5uZG/7P1GAgE+KBaRdSQ3s/S1dXnRxvbEpTf0jAlY/9xEtwUx8ihhOMyaZQd9wGCVkiUwshRll04LP9ew+DPe/rCeVPkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=geC3ZZywBXUpRLxBXH+7/PGAvP+uOI8nVJnCo5nRy9M=;
 b=BfjcTRdRoQJp+5IPbO1Lww6SfOcqfEiVfRM2xOajuy29s2szyfqWMv2CQ1d1HpVmHISxQMdKb3zC3wXJmlbvX65Ft6LHxaped32nBBDehjWUFumRyehDjUtimZjw/LptFdAzt2Dp+Mo/ThGS1ic8UWr6zfAGaB9x/kBYla2sUXQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from LV2PR01MB7792.prod.exchangelabs.com (2603:10b6:408:14f::10) by
 CH0PR01MB6859.prod.exchangelabs.com (2603:10b6:610:100::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.36; Tue, 15 Apr 2025 17:30:39 +0000
Received: from LV2PR01MB7792.prod.exchangelabs.com
 ([fe80::2349:ebe6:2948:adb9]) by LV2PR01MB7792.prod.exchangelabs.com
 ([fe80::2349:ebe6:2948:adb9%5]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 17:30:39 +0000
From: D Scott Phillips <scott@os.amperecomputing.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, James Clark
 <james.clark@linaro.org>, James Morse <james.morse@arm.com>, Joey Gouly
 <joey.gouly@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, Marc Zyngier
 <maz@kernel.org>, Mark Brown <broonie@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, "Rob Herring (Arm)" <robh@kernel.org>, Shameer
 Kolothum <shameerali.kolothum.thodi@huawei.com>, Shiqi Liu
 <shiqiliu@hust.edu.cn>, Will Deacon <will@kernel.org>, Yicong Yang
 <yangyicong@hisilicon.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: errata: Work around AmpereOne's erratum
 AC03_CPU_36
In-Reply-To: <Z_6Te1TjMqyXChvQ@linux.dev>
References: <20250415154711.1698544-1-scott@os.amperecomputing.com>
 <Z_6Te1TjMqyXChvQ@linux.dev>
Date: Tue, 15 Apr 2025 10:30:36 -0700
Message-ID: <86cyddgwn7.fsf@scott-ph-mail.amperecomputing.com>
Content-Type: text/plain
X-ClientProxiedBy: CY5PR17CA0040.namprd17.prod.outlook.com
 (2603:10b6:930:12::34) To LV2PR01MB7792.prod.exchangelabs.com
 (2603:10b6:408:14f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR01MB7792:EE_|CH0PR01MB6859:EE_
X-MS-Office365-Filtering-Correlation-Id: 45b1cb2b-5fa7-4703-84e9-08dd7c433d75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DkbLyBG9IfNasvJ+KupSBLIxgnbJ6OIbzsN6uoubxTqW9+EgoEL7u0TGmVRh?=
 =?us-ascii?Q?lMzQzRRmbbvjKjCuYedkGE3Eds34IDzUg6BTrPR5+KbxIUEvyCKw3N0p8M6u?=
 =?us-ascii?Q?9NXGXS8o61bd2rpSwyyn7jhq+CW5r2iEEse2QMQ3kXt3V0ZjWjAQanF7eT5v?=
 =?us-ascii?Q?drMr1VCY1aTObAowz3z7qT22rj3u4xngy2Ft6Afx7//1uzhjzWn9AtQf//g+?=
 =?us-ascii?Q?hcRC32oyezHn6XABGXsDNAPOauo9PZI5Bzx1zbmBD9AXALEI21lrwr+aIMGy?=
 =?us-ascii?Q?5i1ANDqrEPdj3aa5DL0fO+7oGSQL1MtOdn1PzTfZ1gYjates8v8R9EUFXaIm?=
 =?us-ascii?Q?b8lA0V1V4PC2Vlms7dFwU49SuJ+wl4gIhhSpjqN2Iae6xCVYqmWp+hXH+T2f?=
 =?us-ascii?Q?o7FaPBQUYFn3boERv21vPIUK8PBz8oS8Q484b139FHxlkikGfJ+Qjpt/beWC?=
 =?us-ascii?Q?wAil1BN8kemnIIFBD5CBpaa/iiMaUWGf3ORIjLfgiDj16m0LSpUllCk0rR2d?=
 =?us-ascii?Q?6AAl2EGyd/5TMMv6sim8C7YIOEd5L5ltxWF/87BpAviwcTSuOUz/X2JMRaOf?=
 =?us-ascii?Q?EaKe1GUEq9dCgkwFafmWdHCrICLUNYCfgVmz8hMXhAj3del6Pg3iISPPxAuT?=
 =?us-ascii?Q?gcnVXj+nfeQKnlUYNMwFXISruPVCnlZ0DL+Pr+zsjX5y4ssaBPxF52H5Kyhj?=
 =?us-ascii?Q?VIN1xjJJmrPWbZBwkuItj9vFLc3JGP1itBMKWeOGmbWN2cUZzCJgVtVMhfun?=
 =?us-ascii?Q?jOHjz3XiNZiHLq5n2lQOp2UWMv3Q8AFbmirxkglkrlkR2vBzHizcBY9363cQ?=
 =?us-ascii?Q?VwdGMMC+jnNRSl/o5m2OQno/4huMarLJFEOle4S9ebr6P2bn+7EGJUgyvZey?=
 =?us-ascii?Q?MkB/qvfC9I3dtqFTgWOVcj3D4DwSPRbE5XsXg21bk2M6SVrlRWf4yaSUcvCt?=
 =?us-ascii?Q?YkC0tAPwlXkE1nTieYcENX1OjjxJWOnPVlkMhpeBtJFLYrf/7di4XcLG3qzs?=
 =?us-ascii?Q?Un6bwkhR2keLH+hoy+zjEBiC5Yz73OF6cBrPUI5rt3CEZi7UZohzPjgaXKlO?=
 =?us-ascii?Q?0dDA6o8RXrKEhuJjeXoUjhQ2VfnkROBHXOhpXwks53XEyoMXncW4RBV5Qq8V?=
 =?us-ascii?Q?A7suFF7hEdtrwDxbg6zfLGHAXreoHTaDxVfoQFcMZ8ECzc3bzGh65wqUspI3?=
 =?us-ascii?Q?ocT4X5tk5HhiuifrzYEkpl87aS602fOJ8aFcR09gQLjrM7rLAe9lDabT1Kqr?=
 =?us-ascii?Q?ZVL8YZbt/eA9IDqLnQaVJ6N7lXzWyNNlh0RECdmkY3yRzvqdzh0sRo69/zT3?=
 =?us-ascii?Q?edVsGXPivk1RufpNVQy2CKlrJOMZk49yYkgYh6Xz67swNzlRRVM49tGAU9d7?=
 =?us-ascii?Q?UPJ5w4i3kQniJp+EO9xk+RCm/uhY2RX3POO8CUeY8+Vzu8i6LHVkCAjat/0w?=
 =?us-ascii?Q?GYeMrhAP8X6xJTr9uba4UoiU3hEvQ/8Q4jHTgQb4/PPAaYWX8ti4Uw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR01MB7792.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0+PlM72PJzD/8ol61DvxytGsaqV2T8/Ym1pUx3YMEtGmDC66rtnrUaQHpY3M?=
 =?us-ascii?Q?TsA4jSPYkBWVbK/jBPBZGd7ji3E0e9yTrLz0B25p/+3RHxmNoWmCagq1QN9Y?=
 =?us-ascii?Q?CpdcEF5oDCzyOb7i66LDNv/1j0M0ofnRasVc2YqIl77Cktbmh5M2MrWez0Yo?=
 =?us-ascii?Q?dVSswr/nyK4s24SFKzJ2tfSnE524H020RGqI6ee0EA1C22s8jwyuHJS3Sg9H?=
 =?us-ascii?Q?YYg4OIVR8Lm+wrLFPHEgBemsk9OzhdQsLy+ZheD2Y3xY00prZcIqyda/UhE7?=
 =?us-ascii?Q?zHZWYsrQdG5fOOvqXRN8BIqiDdy4Bv274YqNgDOyqtZxcNvmmgyqzsvXJ3Bv?=
 =?us-ascii?Q?9q+i9JktYOWCrG+qaxktla5g4y5pxHVtw0VEN2Qj6u3GgUaeaJz9hJecgHL4?=
 =?us-ascii?Q?ARmuCVh5dXeZ67ScNVao/UCxXL/E+M/CVdauLn4v+wfyQcnDSoLpmhIBERhV?=
 =?us-ascii?Q?r8pSIP7XCFRk3eQXVyAL1naXF+WFfSuMAKTR0xt2j+sBMfF9cVwOyHMxoIxY?=
 =?us-ascii?Q?UE/QHo8gOKwzmuckWvHhxe2WTwjlNJyyMU1Cek+eH1mfoIxQ62B5os+Puv8D?=
 =?us-ascii?Q?9P3AQ4cToP7zDRP8Icog2yxcqP5+jVdn+3YzuXK9vtxwSon3kFZgNzJBwIFz?=
 =?us-ascii?Q?uoOv4+KhgiEG0Fl/at628cWsoYUCvlNPhaCACdB+1TOw6TdoCPCGdLr5uIYK?=
 =?us-ascii?Q?Zt+ZGbHQTMEaRAaniNPFKdSGfl9nHXC5cY4JEWW7eOBTihqZqUhkcof/sjAr?=
 =?us-ascii?Q?LH174KL7uBH7g1AQTSSjGneNxI+kcCGwTV83lKAMfsNioaqwZipixKaNqZuJ?=
 =?us-ascii?Q?1Gn9G8oWYcFhyLxiOo4kbe4t/doQR8qzn5ACU/hAcCMJcjaVo7r2oYiGQJGZ?=
 =?us-ascii?Q?rxK4bKrCue8C0pt3NHJD6AlElcLd8ackCv7TGZIK5W6gOG/lTrxcxe3gcGMC?=
 =?us-ascii?Q?C2SQ3juUyh6iNyrkpfvUJhlcKcCQEeAcG2tXSGQ4E3WpAM4/KoRV/6kYlKXX?=
 =?us-ascii?Q?QoIC72+tdGD8b8jDibyboKMg9i6JxdVJ1wcAcU3uyA/WVI+7AM/EvNMaEP1b?=
 =?us-ascii?Q?OnzlOeG08TLj92+eKVIWgpLljX7/9q8UP8CSbMJntlqaHCYCs3nNeeruc5pF?=
 =?us-ascii?Q?HDjlxyhlzuxlobgWKvkDlRgZf1dFCrBdUPK14c0OrB3aGJ7CtR5P5NU+nRc6?=
 =?us-ascii?Q?9sY9rSBhHSd6ysVxhgMDlHSzAwtyBjpn6umwrwFcwq2qGjM526U4Y/za8oY5?=
 =?us-ascii?Q?SHFJTeA8PKbmJFM4nG2g194xam6ScuT3+2yPU3c9u3okIRJN74U18PUICnBN?=
 =?us-ascii?Q?q7+GcQyR3dGLhDBnQPcRuR2ybgTOAOLNrfoJC3ORsa1WA1cNu33X+K2w0h4o?=
 =?us-ascii?Q?d24Tt0UPsk7dKxqHg0kSqVnfA/9f9qjTt5ZJ9Tei5voir6YtcaoM+yk0uVjo?=
 =?us-ascii?Q?coqRpA76GhLUO+ZGyiNHPHwEdlwLaVd9uh0how2UPip9Z1Ip7bUfpCJEUDUn?=
 =?us-ascii?Q?xYiWoB2gKSv+ftNr7fIkiXK+BAttjfIIDWu/OUfhjRqYyjES3muRkZuDXIkS?=
 =?us-ascii?Q?Ha/HugJTIFIYO5p6g4WC02FmHaGZB2FN1SwMEzmGVe6XO8jHlHM4GIf/fIJU?=
 =?us-ascii?Q?bg+G8PgjihD+q3659Fu3SMs=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b1cb2b-5fa7-4703-84e9-08dd7c433d75
X-MS-Exchange-CrossTenant-AuthSource: LV2PR01MB7792.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 17:30:39.4019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gfKN7lIFVCjm/Qjtw/1PtTinz/R1R05BWDR+i61vdrMYMpv5gRZlYZ9e2UYyMKZe+2LPGQyKDkHPa6KbzVBEFtUkEC86vhVI3eJnMrgQB7EPoNMsHlicvaUr85XD4LuN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR01MB6859
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_103048_571585_22C6C02E 
X-CRM114-Status: GOOD (  18.56  )
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

Oliver Upton <oliver.upton@linux.dev> writes:

> On Tue, Apr 15, 2025 at 08:47:10AM -0700, D Scott Phillips wrote:
>> AC03_CPU_36 can cause asynchronous exceptions to be routed to the wrong
>> exception level if an async exception coincides with an update to the
>> controls for the target exception level in HCR_EL2. On affected
>> machines, always do writes to HCR_EL2 with async exceptions blocked.
>> 
>> Signed-off-by: D Scott Phillips <scott@os.amperecomputing.com>
>> ---
>>  arch/arm64/Kconfig              | 17 +++++++++++++++++
>>  arch/arm64/include/asm/sysreg.h | 18 ++++++++++++++++--
>>  arch/arm64/kernel/cpu_errata.c  | 14 ++++++++++++++
>>  arch/arm64/tools/cpucaps        |  1 +
>>  4 files changed, 48 insertions(+), 2 deletions(-)
>> 
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index a182295e6f08b..e5fd87446a3b8 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -445,6 +445,23 @@ menu "Kernel Features"
>>  
>>  menu "ARM errata workarounds via the alternatives framework"
>>  
>> +config AMPERE_ERRATUM_AC03_CPU_36
>> +        bool "AmpereOne: AC03_CPU_36: CPU can take an invalid exception, if an asynchronous exception to EL2 occurs while EL2 software is changing the EL2 exception controls."
>> +	default y
>> +	help
>> +	  This option adds an alternative code sequence to work around Ampere
>> +	  errata AC03_CPU_36 on AmpereOne.
>> +
>> +	  If an async exception happens at the same time as an update to the
>> +	  controls for the target EL for async exceptions, an exception can be
>> +	  delivered to the wrong EL. For example, an EL may be routed from EL2
>> +	  to EL1.
>> +
>> +	  The workaround masks all asynchronous exception types when writing
>> +	  to HCR_EL2.
>> +
>> +	  If unsure, say Y.
>> +
>>  config AMPERE_ERRATUM_AC03_CPU_38
>>          bool "AmpereOne: AC03_CPU_38: Certain bits in the Virtualization Translation Control Register and Translation Control Registers do not follow RES0 semantics"
>>  	default y
>> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
>> index 2639d3633073d..e7781f7e7f7a7 100644
>> --- a/arch/arm64/include/asm/sysreg.h
>> +++ b/arch/arm64/include/asm/sysreg.h
>> @@ -1136,14 +1136,28 @@
>>  	__val;							\
>>  })
>>  
>> +#define __sysreg_is_hcr_el2(r)					\
>> +	(__builtin_strcmp("hcr_el2", __stringify(r)) == 0)
>
> This looks fragile. What about:
>
> 	write_sysreg(hcr, HCR_EL2);
>
> or:
>
> 	write_sysreg_s(hcr, SYS_HCR_EL2);

I had also thought about changing the users of write_sysreg(..hcr_el2)
to some new function write_hcr_el2() or something, but I guess that
would have the same fragility. Any suggestions on a better way? Trying
harder with the string stuff, or do something totally else?

