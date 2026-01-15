Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE61AD3CCB2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 05:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7+KvXyMZ7MX4yVwQdhJX48FGctzaMMZ62AQvRiP4+qM=; b=no4mx5xLRry8A8DKU3gnwC//aC
	MyQz+JHRAOb9CCSfbnTtWWNnpcKQhUPAEF0FKcca/NXw8s6hDpVoWiaKDxBN41wE7FiYdPlas3RCx
	DRuaT8Ky8wzQi2mHjqxCzAj3I9keCu/Qr6I1dqCQMYbYn4dDBLRNTvgt3VM2R/Cpk2bAQfhIbwzuI
	paO51K7r/rF+5alM0xNwF53lhkMWxHMcMDWHMqSN214RXr/xzVj6f95njJaWyys5McKYSuR0uxuEb
	RlxIcjc/xj0wTTdOWZvf2Gy7eKXqFVsQByLP72pexhoFg0PTxldqwNuAC4Z15suvVmOh5wNPj+2RE
	zsO6LG9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgG76-0000000BoUQ-2eiN;
	Thu, 15 Jan 2026 05:41:44 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgG6z-0000000BoTa-3AEB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 05:41:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oxeHAtNICYGAxMgu1dt36E+pYgO9ZpC/gLtIu3UprqmcSc5++ejdOhn3ZxGKzhvgA/7TPbrSbX4GERKB4KuwvkZuh/waFNF1uzVXfiUJlWMCnfU+FWxexC/3wam8t8WmRE3zq99vdNdJcphjiQge/uV78ws44q8gpWqvdAM2K7QBZ6ECYjZozT5n9GsmGssympXizAKFOw3DlWpdRfUM8x4fcEN6p7avpeVm+5brUg0HkHsUpi2kYjQ5IGCEI3ZEg4iHeaBR5SPedbVOqODnZnbMRGH09ik/JwVMMrPkNjsQU/suGlXnKs70/TMTpEKy+wpI2LedRdwTmuvXzne1Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+KvXyMZ7MX4yVwQdhJX48FGctzaMMZ62AQvRiP4+qM=;
 b=hFbe928MH9M6p9yDej0+zfAJGGmNV2dBKuFhAjUC1d0NOcATKPDuM1cYMCp7Q+/gaBp3yJWK8XPqFREQGuhqc49Z3TIQAfb3aHxwNAFxrcjGiKlNGwNcPBx97aJmM5mhElGQDecCLQys73HIo/vNSqQAXuJ5ixQ9qsZwU9cn99HZFTyttxYrECEs5DL8tPqZkMyTo9j2WWUfoICHMcca0QbKg9XYeALpn0qJXG8KBfv1stmrsmWkv3sMayvvCIBX3quGLtCBBALOpvRsUa8Z131Jjrxu/Kcehvlj0/kimtsMyXEhVsiF5Utrn+EcD/5L3oH0mp34eKWVFBR5yWD0Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+KvXyMZ7MX4yVwQdhJX48FGctzaMMZ62AQvRiP4+qM=;
 b=XYf0aAdoRaoVUlGcCzjmT0fcwk1CVEBKuJjac41zRrbJZ9CYCrPKF2eIfqHy9kJ4EmjZegNWRgmKZkroiZUX6kZXQOpQVr8tEreQWttxw+HqY/Gb6Zr3AgfaEEn21sIyoETFTgoFofCj4h+aRzdFm52ghULQJrPKbk3fADZUOqU=
Received: from BN9PR03CA0087.namprd03.prod.outlook.com (2603:10b6:408:fc::32)
 by CO1PR10MB4497.namprd10.prod.outlook.com (2603:10b6:303:9d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 05:41:33 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:408:fc:cafe::51) by BN9PR03CA0087.outlook.office365.com
 (2603:10b6:408:fc::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.7 via Frontend Transport; Thu,
 15 Jan 2026 05:41:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.0 via Frontend Transport; Thu, 15 Jan 2026 05:41:32 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 23:41:32 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 23:41:31 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 14 Jan 2026 23:41:31 -0600
Received: from [10.249.130.12] ([10.249.130.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60F5fQqW894764;
	Wed, 14 Jan 2026 23:41:27 -0600
Message-ID: <3a62d6f7-ff88-4f5a-8dfd-ded3e5ff1c86@ti.com>
Date: Thu, 15 Jan 2026 11:11:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: ti: k3-am62p-j722s-common-main: Add
 HSM M4F node
To: "Kumar, Udit" <u-kumar1@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
	<kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20260114173551.2545088-1-b-padhi@ti.com>
 <20260114173551.2545088-3-b-padhi@ti.com>
 <f4319457-6c2e-42b6-a57e-6f326c93fdcd@ti.com>
Content-Language: en-US
From: "Padhi, Beleswar" <b-padhi@ti.com>
In-Reply-To: <f4319457-6c2e-42b6-a57e-6f326c93fdcd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|CO1PR10MB4497:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cfe81ca-3087-4a04-9964-08de53f8bd72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|34020700016|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c204WUZyemJENlluNXYrZi8yUHRmdVo0WitKbVdrQmRZbG5yMnVmd0FhZnRa?=
 =?utf-8?B?Tzl3a1k4eTR3cFZkeU9icDJLeG45QUxyRDFmWkQrU1pVZXdMaVBqYkwxb25p?=
 =?utf-8?B?cTAzcWQ5SmgyUkluOHY2N3ErN3QzUzQ0SkV2OEdzMVJvVXVSdE0zNkxOUmY2?=
 =?utf-8?B?WmE1c1BCcW1ScFp1YUl1bFBHYTh5b1JycHNPTFBrNklobXJXZ0Q5NFF4UUdt?=
 =?utf-8?B?SUUyanNWUnVxQm1jT1FpcGVIN3pVWVJ5bkowTjM3ZmNSQkE4RHJSR0Q2RjEy?=
 =?utf-8?B?dnl1NVdTSGJ4d2RhbWZZZW93anNPUldzOUd6RUlCTnlpT28wQmN4N3hXVGQy?=
 =?utf-8?B?YjVocldVcUgyU0hyLzUxNzVCTmJXRjdVMTJVVDJlMW9LNlJzaEpmeUJSV09l?=
 =?utf-8?B?SnlUKzJabldjRlhLZEZiWCtGR1prL0xHR1U1UXpQN211VWpVWC9LVUFpZGc3?=
 =?utf-8?B?bzdQVWppa3lEYXFCTnlUdTZZRStGMFRUT0JuLzZoRk1lLzQ0K3p6dEFNaCt2?=
 =?utf-8?B?UUFJSi9BVVZMcDNDS3AyUGFHUW9ma0VVZjJsU0U1QkdkQzhxNkZIM21ka3pN?=
 =?utf-8?B?YU9xVUxWS2hRanFyby9jcExqS20wTDJzcUlDSnh5VlRQTGpPblAyQWRacjVV?=
 =?utf-8?B?dU9tQW1HZGoya2R2alo0VFBnQkpqNldaQUEvR044SzJxMUU3dlMycHU4VStj?=
 =?utf-8?B?SExRbnJHRk5WdHQyVW9aYkRqc2pDZTFCWitHeFErRm5LcjRvQ0M5RDFXamI5?=
 =?utf-8?B?RlVwQmVxQU1RcDVjRmpxZTlKdWtXY3BHVXJwRHVPbmZlOUpyenB3VlR3Mm42?=
 =?utf-8?B?ZnpzaGwyRnV1eFRVN2FRaGk2Z0ZTTktvYjcrZzdOQTNLcHBBbituY3dzNndS?=
 =?utf-8?B?RVlyaHpvYlhHcDRMaXdSeU8yZjUzaTRJZTNwWExiTDh2S1lOSG1lQjBkL0F3?=
 =?utf-8?B?YWFQazA3Q2JKL2NGeDhpR2EvVGtaamtPYUdjeGJnNEViUzhwQW9wdlpXMFJq?=
 =?utf-8?B?UktIYWZxbWU5M1BDNnhCeklSOGNPRE5DcHdNWUtFclJDaHU1NnhHYU0zMDZQ?=
 =?utf-8?B?akhHTEZUMC8wQytGMk9QRDM5Q1ZYQWpuOUlBODJLNFkwazdiT1poNVhyR2Vq?=
 =?utf-8?B?TVN6cGtTeS9XcnFtTUV1OEd4ci9kZ1M2Y25yeDZhWjlrQzFaSUhEVjVGeGhl?=
 =?utf-8?B?WjJ5c2lHdHVyUy9DbkJ3bEQzTWNNRVlaakpaNmN0azRzZzFmQUIxNTV1Z0xo?=
 =?utf-8?B?T09sMVdES2ZsR1NUeGFDdEVTTkRvVHliMmQwTFdLa3BZdkw5TEZPdmlYQ1hD?=
 =?utf-8?B?U083OTcvWHdTeXJuKzhIbWFhSlVHcDl4YkpGOE1xbVlzdUV2Ykp2NVJ5YnhP?=
 =?utf-8?B?OE9rMUl5d1F3Nml1RWxCK3ZLUjhHczQ0YVJJQlJSZ0NxYS82aXZ4UmZGZHBv?=
 =?utf-8?B?OEJQV3RaSHBzYWw0VkVJV25ocmZ5bkVXQWJ2anNWWVFCNXhXZ1E4R2Y4amk4?=
 =?utf-8?B?MFdzblVsZW4xMWJtSnJ2UnIvMzdUNW1DQ3VtcE5WUk1YUXV2WmtrOUNneE44?=
 =?utf-8?B?czBFdjJMWWprQThHbjVURFl0MzlRQSs2cGJ3QzAwQmRZZWtHYUN6Y0J5N2hq?=
 =?utf-8?B?SExVc2djdWdCYU5DVWdUcGxKTFVlNDV6K2hibmFiTWV5TVZZZ1JkL3RvM3lr?=
 =?utf-8?B?OU9FRmtQejdvSlhqSmxpRmFqZEltOFk1UU9yTEw0aTJvMlVJU05wSEt4QWVL?=
 =?utf-8?B?aEMwK1ZJcWM1eWtBcC9SdVpUMVpIdERha1l2MG41Q2JJZXMyeStNdU4rOVcx?=
 =?utf-8?B?Qlh4bElOR1RtQUVvNEExLzh6N3I4eE1Ecy90ajdGTjJHVlorbG9VZGJBVGV3?=
 =?utf-8?B?SkUzVDEyTE1tVVMvaElrUUhnVnNxaWhJcDkxOUlYcllyU0NWeG53dklMWFhF?=
 =?utf-8?B?VEZlTDdJRmlPZGIxZUJpYUZuajkwZDhLNVZYMDB1Y2pHRWZoL20xT2lTaUpD?=
 =?utf-8?B?RXRVRFM1eHQwd1p1ZzRCZnZoU0hPd0k3VmZKaEIvY3NIY3psd0dOWGRiVHJu?=
 =?utf-8?B?TTRnZi9SNGk3V1FpQnZZRWU3U0k2eVJ1RHpLQ0pQQUVBektuNlgzMGhtVUtJ?=
 =?utf-8?B?VEZ1NWszSnZTMEx5S0hXTnZFbzVIT2V1VUFsMUNxOGpYRnBUYWtJeDViamlY?=
 =?utf-8?B?RTIzU05YZFp6SUFFQzF3MjlPMVdNeERzRHBVZXNSZzFVd1JuaXN5eDNweGdv?=
 =?utf-8?Q?SoxfnZKOLR5V1HMejBMutjF6RFcf7oyWI3CDwO+Wfc=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(34020700016)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 05:41:32.7434
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cfe81ca-3087-4a04-9964-08de53f8bd72
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4497
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_214137_906797_E40653F0 
X-CRM114-Status: GOOD (  18.51  )
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

Hi Udit,

On 1/15/2026 10:06 AM, Kumar, Udit wrote:
> Hi Beleswar,
>
> On 1/14/2026 11:05 PM, Beleswar Padhi wrote:
>> The TI K3 AM62P and J722S SoCs have a HSM (High Security Module) M4F
>> core in the MAIN Voltage Domain which could be used to run secure
>> services like Authentication. Add Device Tree Node definitions for the
>> HSM core in the respective SoC common main dtsi file.
>>
>> The HSM node is reserved to be loaded and booted by the early-stage
>> bootloader. The firmware-name property is defined at the SoC level
>> since the HSM is not a general-purpose remote core and boards are
>> unlikely to use separate firmware. If needed in exceptional cases,
>> board-specific device trees can override this property.
>>
>> The corresponding reg ranges of HSM node has also been added to its
>> parent node's (cbass_main bus) ranges property.
>>
>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>> ---
>> v3: Changelog:
>> [Nishanth]:
>>   1. Use generic node name 'remoteproc'
>>   2. Use label 'hsm' instead of 'hsm_m4fss'
>>   3. Add a comment for separate SRAMs
>>   4. Update firmware-name property to match existing naming conventions
>>   5. Change status to 'reserved' and add a commment
>>   6. Re-order bootph-pre-ram property before vendor properties
>>   7. Update commit msg adding rationale for firmware-name in SoC.dtsi
>>
>> Link to v2:
>> https://lore.kernel.org/all/20260106104755.948086-4-b-padhi@ti.com/
>>
>> v2: Changelog:
>> 1. None
>>
>> Link to v1:
>> https://lore.kernel.org/all/20251231165102.950644-4-b-padhi@ti.com/
>>
>>   .../boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 17 +++++++++++++++++
>>   arch/arm64/boot/dts/ti/k3-am62p.dtsi            |  1 +
>>   arch/arm64/boot/dts/ti/k3-j722s-main.dtsi       |  5 +++++
>>   arch/arm64/boot/dts/ti/k3-j722s.dtsi            |  1 +
>>   4 files changed, 24 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi 
>> b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
>> index 3cf7c2b3ce2dd..0e1af2a69ca2e 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
>> @@ -1117,4 +1117,21 @@ vpu: video-codec@30210000 {
>>           clocks = <&k3_clks 204 2>;
>>           power-domains = <&k3_pds 204 TI_SCI_PD_EXCLUSIVE>;
>>       };
>> +
>> +    hsm: remoteproc@43c00000 {
>> +        compatible = "ti,hsm-m4fss";
>> +        /* contiguous regions but instantiated separately in HW */
>> +        reg = <0x00 0x43c00000 0x00 0x20000>,
>> +              <0x00 0x43c20000 0x00 0x10000>,
>> +              <0x00 0x43c30000 0x00 0x10000>;
>> +        reg-names = "sram0_0", "sram0_1", "sram1";
>> +        resets = <&k3_reset 225 1>;
>> +        firmware-name = "am62p-hsm-m4f-fw";
>
> you don't need clock and power-domain for this ?


That info is abstracted out via ti-sci calls. ti_sci_cmd_get_device()
takes care of setting clocks and power domains for us.

Same for other rprocs:
https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi#L178

Thanks,
Beleswar

>
>
>> +        bootph-pre-ram;
>> +        ti,sci = <&dmsc>;
>> +        ti,sci-dev-id = <225>;
>> +        ti,sci-proc-ids = <0x80 0xff>;
>> +        /* reserved for early-stage bootloader */
>> +        status = "reserved";
>> +    };
>>   };
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62p.dtsi 
>> b/arch/arm64/boot/dts/ti/k3-am62p.dtsi
>> index e2c01328eb298..9d6266d6ddb82 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62p.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am62p.dtsi
>> @@ -96,6 +96,7 @@ cbass_main: bus@f0000 {
>>                <0x00 0x31100000 0x00 0x31100000 0x00 0x00050000>, /* 
>> USB1 DWC3 Core window */
>>                <0x00 0x40900000 0x00 0x40900000 0x00 0x00030000>, /* 
>> SA3UL */
>> [..]

