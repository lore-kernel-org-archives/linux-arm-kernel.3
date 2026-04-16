Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4301BF43841
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 06:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iIKJpCLDT//e7JGdWyU7PR+XaF31JFRzw47Kspbo3mU=; b=0rQxaOy0vOGNa6Kkm5hRYB47hI
	uco15pHSDmIaYrK2zoLKPudw5m3J/YJrOuFoGQluiBQivbOUOs0pMEClGcsebzunxlWI0EqlzVfGB
	qXA+h8zbzCWc5fOUmJG6BKfqwHrKBVA9WXCjpHELhfaUiKrColWVfQJfKrpucxdmu6Q4knnRWEGxb
	LD+L2spUGPVMpUn1yCH2U1YHkWz9lxLz6R9ePxHZARvfzb/YdAoPUGESgVFpBpjlRnjTkXo2rWe9k
	rW0bh2exRRXhfkTpKiHkiK+R8XaFas9rBeTvU4PyPNkmHk9vkAQIsvRagnbwwERkT35qPv9Z0v+xD
	4xCloYnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDGEX-0000000239E-3h8r;
	Thu, 16 Apr 2026 06:29:49 +0000
Received: from mail-japanwestazlp170100003.outbound.protection.outlook.com ([2a01:111:f403:c407::3] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDGEV-0000000238s-0c5b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 06:29:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AfH4L1ZeLiLXzEl/0/I3WIPu0SME2wnXX0Pjmb9Wuel/fxGg2vwwaH0dt95x4HTBknDGzwNvOXFMPTMdEU9wMlLttw9XzqaLEInsJj1VxcW5ye87JIHUBSnzwv8m6N9HLerNS+wZ6uTap3z7c8qjwT6bjuZk58vhbgzC6WJ52+Q/JdI940UkOu5q9zuDpNM8xRsBH93+PXEuIYEwrpqt9wTE6wgRl4z0KHOUo4cPv10SYOi9i+S3SsxdJ25BrO8bWpdsGUteXlp+TVvRZvYM2ub8X/E5YDmb8e1HardE3SHux8hKcLhogvwV1rNIwKLmu/Sgf9rqOWpGcLGwQh9Asg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iIKJpCLDT//e7JGdWyU7PR+XaF31JFRzw47Kspbo3mU=;
 b=EE9DK38VrVGmSJPEnHgSa2tpCSU7EKJGXDRhYgazdbSRLHYbU4mXw8VHhTmeeq8FCKQnq9w6hzljbK9u0mLBcfHgBht/j9vJTckO8yiqavzD35Z06WHKuVfjQ5d779I2VsyqajOwGNOirRgRwV8UCkUFMYl6j8axTivCj8Jdo5bi40SwUxRDvoYSElUfLKGwwCenOFwSPgm50qcMvs0AApkvYLC3u8Me0J64bv1BH/ffCHdsndwq2bElQKJRIDWem0hkXlWDj4AR8OwFpXsF2JC30Y/p5ZfN1b/WJNm+YfAVT5NjILgsfqAWfstZQNPkXpLcVaNxKr3EMGawbbvagw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iIKJpCLDT//e7JGdWyU7PR+XaF31JFRzw47Kspbo3mU=;
 b=FNeOz0HJ6VIpcIynDpydjfegmMiDDJ2LlVW7zLahZlDMGF9iAcRkuO9asOeikI7CeZju1gnrKsBdKHwRxSkIwtkk2JYWsAKWJeRCkeSM/w6DVStb+wXwAhBvtLgEbwfMPtw9jqICAc0tR79XyP+dwcoQhHesfkeTI1CybAEMCkT6xodNNHIaJCXENuc6/kotfRTmG759YFqfvZq91LVpriRLa7lJnRLOFskjNuFUnGSm9cxQjRkgAiyItPj9EqrJFyvE23xeL7TAr50N2yTDTPQwQbzZKJd8DHfpiC1/M9lXZfe1zO7HFbqroL6eg/7gGrkExMzTwQDEeBJErBdOFw==
Received: from TY4PR01MB16930.jpnprd01.prod.outlook.com
 (2603:1096:405:338::19) by OSOPR01MB12440.jpnprd01.prod.outlook.com
 (2603:1096:604:2dc::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Thu, 16 Apr
 2026 06:29:34 +0000
Received: from TY4PR01MB16930.jpnprd01.prod.outlook.com
 ([fe80::38bc:7870:6f23:a957]) by TY4PR01MB16930.jpnprd01.prod.outlook.com
 ([fe80::38bc:7870:6f23:a957%4]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 06:29:34 +0000
From: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
To: "ben.horgan@arm.com" <ben.horgan@arm.com>, "Dave.Martin@arm.com"
	<Dave.Martin@arm.com>, "james.morse@arm.com" <james.morse@arm.com>,
	"reinette.chatre@intel.com" <reinette.chatre@intel.com>,
	"fenghuay@nvidia.com" <fenghuay@nvidia.com>, "tglx@kernel.org"
	<tglx@kernel.org>, "will@kernel.org" <will@kernel.org>, "hpa@zytor.com"
	<hpa@zytor.com>, "bp@alien8.de" <bp@alien8.de>, "babu.moger@amd.com"
	<babu.moger@amd.com>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "mingo@redhat.com" <mingo@redhat.com>,
	"tony.luck@intel.com" <tony.luck@intel.com>, "gshan@redhat.com"
	<gshan@redhat.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v8 next 00/10] arm_mpam: Introduce Narrow-PARTID feature
Thread-Topic: [PATCH v8 next 00/10] arm_mpam: Introduce Narrow-PARTID feature
Thread-Index: AQHczWlOc1sZm8p1sU2G3k2Gi3Y/3bXhOJ9y
Date: Thu, 16 Apr 2026 06:29:34 +0000
Message-ID: <TY4PR01MB16930EB1ACB3A3356A92169BC8B232@TY4PR01MB16930.jpnprd01.prod.outlook.com>
References: <20260413085405.1166412-1-zengheng4@huawei.com>
In-Reply-To: <20260413085405.1166412-1-zengheng4@huawei.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-04-16T06:29:34.118Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB16930:EE_|OSOPR01MB12440:EE_
x-ms-office365-filtering-correlation-id: 99d0c1b0-fdcd-4287-b436-08de9b8186b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024|18002099003|56012099003|22082099003|38070700021|1580799027|921020;
x-microsoft-antispam-message-info: YytwHUxVxh75QesgOr+2/fVEkWI+4exfjxo7iqVEduWT29mqjbUrOwIpf3V1WQzouQidXWG/6cDM30mS/PqDTX2m0sipzJgG/JNzFt/8VYP7ExLaAc5Ho4MlExG1mCe/LeiADdUN/2MvLRtoo7vVTg1DrmPtvishW1mW89yTD8P6Qac/XKAFfMm++3cJV6jF4yrfU6Mba32HD/MLsVqC5rR5I2a/R9EUn9SlpmqRsIOteiz2MnnL3CZr4+fJTHn8OEihBQ7YkDOS8yAgSaluts4ujn9MeM+wsC68fwnb84+8fN+PWPDq3UaQXOYzg2nhAL5moRQAHd1znJMrfg/X5C0DzXFnaOEA2B7sNi1Vxf9ji9pF+No5kA3zYeGKC6kG94Y1Bi8hgGNxJyJteZCa9T+hRIKkZsfuaQKwHxXvmldsGFjiAhSoXVVZ5ShU2OfLpGutUt07hS+TQaLi16K7oNmbvc8Ae8CeINTAdJmg8Eejt9cAmp0LccDDZcYH2/bClXIG3v9rhYo5wzrO/ddaS+GQ8NRHQxQ/0hiMt+mlz/cTo/fomdIcNIj1zaage7NaRsL2RDeLoL7VdbeUmzrrwydtTm0y3Korrs76IyEWgUoardRidYOiBqLURfFk6T9rf719hXvNMmM1CEltBm0NDsUlh3Sm9+K/T1VDBi4x8DTQ5zcstorXJ081IP/F24KJlSC7aNO1AzshaDTssRIRnoTRe0KzjEa4zZQ3t5DPjO07J6tRcUWeMnpnboRRJDUbuzOXyp72nFG4ZONm1DIE1lWloX3Ji86J48ASHHjp4C+tHrh2R7AMERfCn6MgTIZhmYtspWMdsrCRgXp5vteIqg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB16930.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(18002099003)(56012099003)(22082099003)(38070700021)(1580799027)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?ZTR3NjVUQzhFaUdiL05scEw1a3NZNW02d3NrM2YzZjBBV3lhbGgwUStR?=
 =?iso-2022-jp?B?TktTN1VDR2liaWhuN0NtbVZRWFg2QUgvU3I1M3NQRXpWZEpsODNMcS9w?=
 =?iso-2022-jp?B?bVFyTjBVcDBmbDZGRjJZbnZXVzhYYnRhMXlrMVMwN2JpeGU1WFBKUWpT?=
 =?iso-2022-jp?B?QlAzVUR0QkxRMnZjc3NHZU8rZ21NMFplaDdjcW44bDIzUHlCaHhCM1A0?=
 =?iso-2022-jp?B?cTJxQzlmSVJaWituM3pmVTNjL0VRQ2FCU3UzOW5VYnNaREttV3A3WVR2?=
 =?iso-2022-jp?B?SjhDK2JGM0dXODRPb0hCVm9CaWdYNjRHak85b2RkWjRTa1BzTFFxOTYw?=
 =?iso-2022-jp?B?eTAvdHdxYjdmUXFNRkltNkx0WTBPdWVIVnJhK05CTk94Zjd3ZGl6clRG?=
 =?iso-2022-jp?B?eCtPNVB3VXRHOUhHZG5DWkpaU1VqekNSNTMydHY0VEVGNERRenVIeHAv?=
 =?iso-2022-jp?B?a2ZEbnBPQStDZHdrcEpBalZGV3N3cEVFQVpkSFRMVWdqSk1raUZWV29G?=
 =?iso-2022-jp?B?ZHZyZkROb3NmV3N4NlNtcGwzSlIxYnFUYVN0K0djNU9WQm1KVHRmNE82?=
 =?iso-2022-jp?B?c1FsbTl0VTBZS2wyTlpWbW1xSlhwUW92a3dZLytmZUJsWWdKbHhYZjRO?=
 =?iso-2022-jp?B?c0tkazY0M1BldXFpR0FMZkhQZm5wTGk3QVhwUkJBZVdOY3poMk1TU09r?=
 =?iso-2022-jp?B?dmtRYWlTaU1hL3hpMjNGRnV4V0NCbDRGaDJ0L2NlRm1nM2pVY0IzVEs0?=
 =?iso-2022-jp?B?SURJVjZpdVZDUjNXY3RwSEhSaitvZzIyL0ZOQzFWallmZmhhSHU0OEE2?=
 =?iso-2022-jp?B?czEvYUxNbVJVNDJsZXg2dzVoZjJBMEYwemZkZXM5bmE5SDI0Qm1GTnFk?=
 =?iso-2022-jp?B?aGQ2N3UveE1hNUtXT0NSdWlKaXRRaDViYllvT1FMKzlaZkU1bkxmditv?=
 =?iso-2022-jp?B?VTI4S3JVVlF2ODVXQUpFeXI2RTM0Qy9jVHJNNEY2aVdxZ0tLZzZGeHNI?=
 =?iso-2022-jp?B?eUd6dVVMcTF6d3IxOEtKd1dGR2p1UVRSVjFTYnMzR0xLUUsyRkxIRko0?=
 =?iso-2022-jp?B?MVFnTmcva2VrQnE2RDNRb2dOQnJkRVZkMlJBOVVHZnU0S0hLRk1RTVFL?=
 =?iso-2022-jp?B?UzZQZkNzUGFCckw5TlJoV28wRWlLZ0dxRjMyVnYyc0dIRkhNMUwvdWJk?=
 =?iso-2022-jp?B?b3JwSnhMNVlaRysrTDJqZ0lIQk1KQ0ZyR0ZWWHRoRjdJYVlYaklwT0VE?=
 =?iso-2022-jp?B?ZXIvZ3VBMWNpYVRqNGg1MnRSbDd4OXZ1TWhlOXdGTmtzc1A0RlhCbC9X?=
 =?iso-2022-jp?B?UDBNOTdnaXdmaXNWQlJReWJTRmg4MXcvOEF6ZVlXbEFKeVFSMGFqajBj?=
 =?iso-2022-jp?B?N01UMzZvczg0L2NUVVJBMzlsbVQ4UlYrWlVDcnBVSzAwSWlHUWc5TUF4?=
 =?iso-2022-jp?B?RWtLV0RPbDFZRVh2czU2cFE3SVFzWEp5V3JwZzRSd20ySEZsZXF0bTBu?=
 =?iso-2022-jp?B?OEVnNjM4Snc1ZFc3WGtMR0Vaa2ZDaVNTUGtrNDVJRmFuQldxeUpmUEEy?=
 =?iso-2022-jp?B?NnArcUo1Q3c5NlQ2ZnBWZ0syaDZOalk4eWVEVXlNMGRxWWJXQ0pHb1dJ?=
 =?iso-2022-jp?B?VXpQallQQWJ6WUl4M0hIR29TVDVHbmpYL2lqN0xSUXZVT0FFQXc3cXNJ?=
 =?iso-2022-jp?B?SEdHaWxIQXJleFZ4Vm4wWk9uZ2R3a1dFT0Y2bWhJMzA4aVMyUzB0M1NP?=
 =?iso-2022-jp?B?Mm4wN2d6d014aWcvSnVkM0ZxVmRreE02UERrejdYZlBPQ1d6Y1NKMDRi?=
 =?iso-2022-jp?B?MFFlaXdyVnhvVmNaRXpuMEEvTWR4REV4anYwaVp1a0FoMmh2S1BnSjM1?=
 =?iso-2022-jp?B?bVFHSVhQU0FqOTdTbWs5RUZnZ0pJWnZRQzNsR2JXYVpoV24yOTdHTVVF?=
 =?iso-2022-jp?B?WW00WVlnbGpOSEFHaHluSXJBWG4veDhZV3hNTS85TElwMEdtVXErdENF?=
 =?iso-2022-jp?B?a21Dc3VlbkFGTTZYRGkzUjlkSVFlNXYxRTUweEw4cjROQzU1d1VmaVFt?=
 =?iso-2022-jp?B?UG9XUDh2ZisvQm41VnA4Vno5ZklnckNZUkZlZUJkVDd4Q25LamV3S3ZE?=
 =?iso-2022-jp?B?bHgwZjlSa3pWYkRKRmw3OHAzeFg0U2N4TFpzOXB6c2tGaGZFekxLZnNN?=
 =?iso-2022-jp?B?SHB0TEk1YURnTlN4cUdVbWY5TXhuRFo4eXpUZ2NrNHllTFExZmNjZDZz?=
 =?iso-2022-jp?B?WkRLdkhzSk5vQU9XaFdTWXp0UGpIZDE4YkltS0FBM2t2ZXJaU0VCcDls?=
 =?iso-2022-jp?B?bStSRE5IVDdyTzZqQnV1MEg4dVkwMFJMY2xXUGR0MkxWYm4wUklVSVhw?=
 =?iso-2022-jp?B?TyswYVRLUXk4aDRuU0h3KzljNitwTE1PMVd5TUFFczBSMVBQbzlIM3Rz?=
 =?iso-2022-jp?B?aW8ydS91ZHlaV2YydlMybXZ4Q1dyY0pHd3ltYThpQ3J4Y3NEdGdWTE1T?=
 =?iso-2022-jp?B?YVVvbVVlVFcyYmhSR1RYNHloRzJzc2FQODd5QT09?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: RiTXd0WmHxWqwAc/vntPfR/z17GCLKM27hI9gIO+729704PpA9ZLgUeOGTm0+WZkFu+UIXl2NhRPTaQPOpD7YEd+dRT9PcmvarHiZAjErNLPTtJdB97gwqqkHUaijR9m6LmDEfXqnpoEgxuIfxBHWD3LBGl2a36qmt1+zzaWn1pbIs6K58KeI7kShijFyrXtwQfX0uD/vsSQT2gNnXubJM+mkzA3G1eolMHpwHpA7plMoitfaTfjZDS7Ca19Bpkqw5tVf2YTn+VqCjtycf25ZomWWyTqfNva9fDknsK2YqImQeEyJWRJJzdXFvnjFoV8TaWmMwfjum2RQerEb8QWVA==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB16930.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99d0c1b0-fdcd-4287-b436-08de9b8186b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2026 06:29:34.5932
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: URQW0GF8pzaOHEWrvnpm6ieCb7raFecurqknaL6gQFxuc7TIBjLaIek1R4NzTc8ypa3gxtiKaJkozRco2mTJKu2GB+7p1eqoeh8xD0zyrsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12440
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_232947_188791_4676E322 
X-CRM114-Status: UNSURE (   4.00  )
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

Hello Zeng Heng,=0A=
=0A=
Could you tell me which branch this patch series based on?=0A=
=0A=
Best regards,=0A=
Shaopent TAN=

