Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7760D5B16C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 15:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXIqwxM50iKmWl1AhQwYkLJ5E8NGzdEFvDX0hTFxgXo=; b=oPwtY2KHMaWM3E+S2sF18DXGny
	ReRLB5aIA1gvL5YELaJ1GqM/v2TuUyMKI22sJYKNkEs0V8rA00fG8+mExk0iCvxG6sIIRZRIt/IrA
	OiaUnYVmSwsnCg4hjvrhHg7Pirw5AqLDfh66B2VoOemgK7oHwvwEfuM3VIG7Xw++WYO8bJ7yqJEPF
	C9MrxuBqBGUkwv/PGEuaoy0BOPaGn5sLzvEqpSqcPwkpT05uFzzO8k+JhQNpH6EVQmXABjVxy4dmg
	29N9fF5mEp2/0DeB0O3QlD57QKv6zinUApyMWMvWm6teCkub+devLd6l5aK0mkNp1xrJjuBYv3AE2
	m/5op27w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAl2-00000003unk-3HWO;
	Mon, 15 Dec 2025 15:45:08 +0000
Received: from mail-swedencentralazon11023114.outbound.protection.outlook.com ([52.101.83.114] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAku-00000003ulE-2KYd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 15:45:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tgbO/MFvWti/+tVuc1blIXtcG4Ezde2UjRfp92MYWEx6UDbfYRoQWQQm6tghiDfiVOdT8m9gTtjfZPptZ+Xi6WsKHrZPhPL0tvPNrT90Pgzh7jUjq6ewgZy824KSWtWlmvXxISWg0SXKHp//JR+/8bTYx4tJvKj3zoCHeuNbhQZXkHjcEHvMRCofeqa2BQkniQ8Mj/uoj100m2AMYM4t0FZpRvuaQlv7A4XspI6UR16ZHhFpfFw797O+wNjfid0UBTHeYFRRU6KBn1atcnDJkOqQGRzu1HDddbbJt4bf21hIJYMDaY9S6JmzgwoygCu6ZifkmUODR6ihl8XygR79MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXIqwxM50iKmWl1AhQwYkLJ5E8NGzdEFvDX0hTFxgXo=;
 b=Rah5m9blL4+pDykpEKBznXWFDD4P80nQNy3dmpMK3wmwAcbocnlhQ2COWky39QttAjpGIirYC9aermiIGmT4IRSJyA/KC8DMbAA8JSWFD8V7Y0nUGIK6JOee+4e8uExTJ8HwzwK7FkurmJQ+oXkNqDWRPi8GgtPcxihJ3aBNlCwpuZ03ldbBHC3W9VwHk1KCpWn+HHX71tk0jLd3SeqTQVkPi1mOl5SK74hXtaUCki+sF7Suachftw9lI0a+ASeM1cTJtRdV64W4Jdm4ba+H+KIB/gbs/B3DYmXiTbsi6/NX+pZ+Qh0HcT+DMu7GYUXQ/feCyzBIjGUhyAnIaVF3Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXIqwxM50iKmWl1AhQwYkLJ5E8NGzdEFvDX0hTFxgXo=;
 b=zTyAv9wBIp4i+Wh8iA/UBgN94gWHErepQ/xH5wsgOXs4JWpzE6+zEAgMPKgP1XCUrZZJrHqF0nrKYpprqf9qL2noZqfPm2Ka58sJ/ua+YHEz5DyJHjz8gwj54YHvlyAy2EKNRIPJKPl3X7nGqcakLD6MHjer72dJLNHbJa2lPYDOeaYUSbBGyPE7KxzliFB9LZvXDYNx6ZQeVYUEH4/jt0fFvDmJ4xpIfERywzqBoy+JWsZKqcTeg1XCNEDN/CxeRq2hcRFAR4sdOCazcztAed0xl58TF1iQJSzLskworMdLS4WYhMbl2nA7+WkT8B3jSn+jgY87qTVQEOatoDnOhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by DB9PR06MB7930.eurprd06.prod.outlook.com (2603:10a6:10:29e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 15:44:51 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%5]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 15:44:51 +0000
Message-ID: <0435af95-a3bc-4ec7-b07b-bdec42f25c56@vaisala.com>
Date: Mon, 15 Dec 2025 17:43:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "arm64: zynqmp: Add an OP-TEE node to the device
 tree"
To: Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251125-revert-zynqmp-optee-v1-1-d2ce4c0fcaf6@vaisala.com>
 <88b72343-e86f-4b13-adcc-ba09683eb898@amd.com>
 <199062ba-9a0d-40ae-ac8c-0fbed5615cf8@vaisala.com>
 <3654c600-553f-429a-8bec-1add7f6eb5c6@vaisala.com>
 <db79cd4a-548d-46f1-b498-aac82ca53010@amd.com>
Content-Language: en-US
From: Tomas Melin <tomas.melin@vaisala.com>
In-Reply-To: <db79cd4a-548d-46f1-b498-aac82ca53010@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVX0EPF00014AE0.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::313) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|DB9PR06MB7930:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a1858ba-9a50-4cba-f0cc-08de3bf0e26a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTBxTFFhMkFrUDhZOFgxUDRUbFUvVzlIWmN3eDczSVNmdkVGZUZMSmtBdTJZ?=
 =?utf-8?B?WS9OTWpLcWpId2pOWTNsOVllaCt3emp5RzNidlJqejJMTFVkSWp3bHl0My84?=
 =?utf-8?B?RGNsYnpMRXJUSU4vZVZTV0VBRXk0ZHJGOXZ5V0NnOE9aMTlIN3gzNm9GcDBt?=
 =?utf-8?B?cTA5NXdlYUM4N1RVWGZWZVpzdWNrb3UrWXdVaHhpZjlPL1Y2MWFWZVpmbjJh?=
 =?utf-8?B?UFdseTFydHpPUnlZdzZTODNnQVpQWXJ3VTJ4RFJwWjhZeDRiaUtYTnBGbEIr?=
 =?utf-8?B?ck5iKzI2NWFOaldIU2xSd1orZzFxUXpjblpIdVJNY1dNRElYVU0wUm40TUxr?=
 =?utf-8?B?UjZBeDZNV2R0VVJ4UFJWK1VjYkRFOHErMUhvTUNmKzhEZi9yMnpJYTlwL0tQ?=
 =?utf-8?B?SklDelZEMEdyK2tpT0ZMcVpBeVRVWEF0UjNIM3lWYVFXdDNLTWd0TUpRSzdz?=
 =?utf-8?B?UFpXOE84SFhVU1c5OFlpN2hvb1dRUHVMY2MxYVN1cDF5MEp2azR3UHN4UVVB?=
 =?utf-8?B?ZjF0MDU0SmlCVVFONDN1ZzNnL1JiT09pSjRkekJYeS9vSmE0Nzc4bWtaZTF1?=
 =?utf-8?B?a2VLZVVLZ0lzSkJvV05jY2hORGROQ21zcGR6eFhKdHhhbWFKNjRhd20yWm9h?=
 =?utf-8?B?SUhWbVczMU9JSjN0N0NmRVFVS1c4UlNrOWQrcm5tQXlFeWsrRG8zNlRnMis5?=
 =?utf-8?B?amcvQ0h5cjJtV0I0dHkxbDB1MDY4NXBmTzA5bTQvM1pxY0lxVkptRFowcWxo?=
 =?utf-8?B?b3p3WGpTdkZDdEZRZTdzcVlqalJTYlRGeUJja29ibTJwTE1Md3NLODZTOHZk?=
 =?utf-8?B?dTlzVjdzSW90M3FYQnBMS3crZ2h4VXVFYnpEZWN1R213Z2luQTJCdklvcnVR?=
 =?utf-8?B?T2FiS1NQWjBBcHZvejlQYjd5Q1pXMlM3UFozdHRRZmZVUVJkWGRUYUNTUGRt?=
 =?utf-8?B?di8xeDdYVEpIZFhhSzdVZ01idm1sandnVWh3aG1BTmVsRjg5ZTFRN1lYcEdB?=
 =?utf-8?B?eHQzV0NHR2xZcTZXOWljcGgyN3lQd1RWemZCNXIrRUd3VWFjUWJ2cVB3ckVF?=
 =?utf-8?B?RHo4eENVRjRvYWZIVnhkR2FQcUd5ajY4alBWSFBYMzdmaG5VZVJCdEh5V0Ja?=
 =?utf-8?B?R3U3QTlqc1FJMDIrT01hWFBROW1FUVVnWjNpdGJLWmEwSlFlaTlYMHp3M2Nt?=
 =?utf-8?B?VU5HM0cvampTS3Y3UldGUEJlM0hTTzh3L3dTSzErOUpsQ2RaS1hNeEhCTlo4?=
 =?utf-8?B?QWNBb016aUJDZk4vVWFjV1JwRHZyTlhyRDRtd2lEWHRCUTk2YUtGd2tOZW1W?=
 =?utf-8?B?VE43SVhqWWgxaVpxUW1VQkdjUVJoc0dxTzZKUTA1Qml1VU5qMEZER3ZpMU0v?=
 =?utf-8?B?cU1EZmR5OTZQZCtMclUzK3NhRnFZSUt6U0NMK3pLWW1vN3JDZjZPZDFQT0Zy?=
 =?utf-8?B?SkJ0dUZlWWM4d24wZlUxZUZiWk1ucnpGVVJLSDk1WUFLMTBtV2JBb1BBNzNE?=
 =?utf-8?B?Zm52ckxUbzBsbUpZSnJLajhoajcxNG5lRU5aR1NwVis5cCtyc1p1d0JiV2pq?=
 =?utf-8?B?V0ExUkxrZFNJR1NWbnMzU0lkMkRPUjExcGs1SjkySi8ycTJwV3lTTS9ubU85?=
 =?utf-8?B?eUppZ0JwTzdrMUVhczlPSmFvWUIrL0tEbzZlNUdybHExTyt2N0FkK3BZeVdI?=
 =?utf-8?B?WEtMZURIUTVRdkJzMmMrbHg1ajdUVlQ3NFFuNEluVUNWNGVJVzIrb2RxTjYv?=
 =?utf-8?B?UkExNjVQOUFUNm81N3ZTUmg3Y25hV1dmdkZEWThDcXdNMEhBZzZ3ZUJibXRy?=
 =?utf-8?B?cmF2V0RFMlVXOGJoRmFhclFzek9VRnd3dFdDR1IxU05MRUd4b3JWd1NtM21Q?=
 =?utf-8?B?clJhY3VFM1diSklVSUlkVnE4cldqWjYzNzFGVmcrVjlsdk8wVTBmUXYyeWlD?=
 =?utf-8?Q?7FviktIANhinc7YZGj+2kWb5AKOGLji7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVk1d3hjRGd1MlpqdldSTS9kNE5Xc01DOFJ5U3ErU0hDTS94MEpKM0FlTGZu?=
 =?utf-8?B?K3FuOXVLKzd2VWlOZE5OOFJXd05meEt3OGdzU2UrSVVJcEZFMkJmbm5OSDE4?=
 =?utf-8?B?TEc4NUtPU2FwOFdMY2FjS1lXNnJibWxueHAwOHNJemRGZFRZRHBqeFJWWmpt?=
 =?utf-8?B?cUR5NFU2MVJSdkVIb0tGeE13aHV3QlhTWE1qbzdwQ0hJOVYzTnJpL1BpdmV3?=
 =?utf-8?B?NXpPTWkzNnVWRXpBQ01GMjlNd3dHd0p0SkYveS81aVRYNUExOTVCc3llQ2ZY?=
 =?utf-8?B?UzlSY3JoNGxuQ1BlL1lqU0duTktMTFpXRkhxaVNkZlZLSjZpejVSTjVSTXFT?=
 =?utf-8?B?UEkzVzViNWxselJYaXY1VGdGQnpsMHpNWmpReHU5TFdRU042c3RHcTFWWVZp?=
 =?utf-8?B?ek9qaEUvVGZwOUJlNnFXeXJCQ0xLSGZsODJWM29MWDlObXFVVE4zbEFVTHBx?=
 =?utf-8?B?N3VJRmFSdTFwak12K0FlWm40YVFuOEV0SU1RaWRkb0ZuR1dwbGhlQU1oLzJH?=
 =?utf-8?B?NzVVU1lZczJwYzRxVUN1MU9xTHZ5bVk5d3kva2t4NE1ZTHA5OXhhSGZHTFls?=
 =?utf-8?B?N2E0clFGR2FOUExqT011Umt4RlhXa0lGS3hrbmNoYUtpVE5TZnBJMHZQakQz?=
 =?utf-8?B?cnhCY2tCOXY1Uk9SREpWVlNWZmpiLzR3ZUJuQmo3RzlvSlk4VHZLellQeG5L?=
 =?utf-8?B?UGRzSkROV1VtWnIxb0ZzYmZUMm9ZRDdoZHpTdWdVNG82OEFOZWpid0o2Y3Bl?=
 =?utf-8?B?YTdxZkJIdUE3MlpieVo1WEg3NEFoaStEU1pRZ0JjY3FuNGkxRHdPd08zY1pB?=
 =?utf-8?B?dEE5N2M3RU9vRlQwczdKYVZKcUx2am1OUisxNGFGR0RaVjFWQ1lEWlJtaUk4?=
 =?utf-8?B?TmE0UzJKbVlrOWRpVm9YK0wrRWVvT2U2WnViekxHMXVXcytzUWxNY0FqN0tl?=
 =?utf-8?B?NmZQdENGZGlKT2F4ZUJhdnJ5Z2FxWk94RnhpaEIyQi9FODF1ZVR6UmQxU3ZS?=
 =?utf-8?B?c2tLWDAvWU9UYm9Fb1JUMjFuUjRLTFZyV0ZuN3dCZVJscWhMUkVSb2tibjZ2?=
 =?utf-8?B?SXk0bzJtQ21QVFJSSjBxVjF6NVpoeVFaZE52ZUdDR2ZScUhscWtSVDhQZU81?=
 =?utf-8?B?VjRVQktZeHZ4dHEyWGFEMEdMaVR3b00zOGVkaDV4SW5raWIwbEc3WFdrT2VM?=
 =?utf-8?B?WGNiWVVEOEE4eGFPTjVROGgwcUdod01UWnBjaXQ2NFBaTnQyK2wxeENtOXZQ?=
 =?utf-8?B?N0xDNHJxR2dFTGEwRjh4YW9lTTVIRzl3OEkrWnZHQzFneEdPOHV1UWt5MEpV?=
 =?utf-8?B?cFRpV3lVSGhIclpDV0liRlU4eXRaZEptaExnbFBtZVdSNXpkTEUyU2JtNTE1?=
 =?utf-8?B?Wm5ubDRhK1pMdmpCWlFlRjVnY1JhcWJYS2NHS1d3cWFQUEZMQWlQZGMxazU3?=
 =?utf-8?B?NTFBRFh6eTBqeDU5bUMwZ2J0TVl2Q3FYODJCSUpJVm9wdkpaeFh0YXptdnU2?=
 =?utf-8?B?bVpwUGRzTFh1dSt6RFB6THQ0cmpDcHZvKzBQVkE2akRkd01OaHhGZDhTQ2k2?=
 =?utf-8?B?RHV0OEVObEUva3YvM2k3Q0lBTFB0WFpQOGZkWDcrTE9ySS9mNTh4aTFvTEVw?=
 =?utf-8?B?Q1FaeDNTSHVUSWo1RzRST0J1OWFWRWJFZjYrSDZUZjBkK21BdUh6eEdWay92?=
 =?utf-8?B?b25CSThaQnR1TDd5SFpaNVdISkw2ZUZzeDVFeDA1U1dRQUcySUlEQzV1YVJE?=
 =?utf-8?B?RlErRlJVSkpnMVFkTHBaOHFWM2VTMDNlLzFBVUFrc3UvRU9uaktXVm9kKytG?=
 =?utf-8?B?NjVWOUU1UzQzSkRXV3pveVhiTDlBdmNZcUxyNDc5MUJIZFdhV0JhWWJCZnpM?=
 =?utf-8?B?NUpmSmNiMWZNZUEzVVZqeDZjZVNaNW52M1BDWWg4UzNxZHlSWDl3UkM3TnI4?=
 =?utf-8?B?Qm91VnBIOWpFSmthRW0vMHZVU0JuQ3BUSnY1ZUk5NGh5VStEZTB6aS83R1pn?=
 =?utf-8?B?Sk1uYW82WVlNeGkvRXh1QnhUYlFsZVpkN2dmMDZJOWVxb1Boak9WeFc0eUUv?=
 =?utf-8?B?WmpvSStnYnp6VGFVMm5tSVNwNnl5L05jcDFQNEUzVkhTZXFmZTZEZXNLZUYr?=
 =?utf-8?B?dHdNT2lCLys2Q1hVVHN1a1BnZGZzekNuNmFVNXgyZzV1WnZDQlMyWlFIV2lV?=
 =?utf-8?B?Snc9PQ==?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a1858ba-9a50-4cba-f0cc-08de3bf0e26a
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 15:44:51.1759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9UsnrWt2Uh97ItgvmMq0MVHQyvNGZdS1zwcWuxSO6P8/DFau28IjZYf4+h/gItwSV48hkP6KtZLIg/kn/4zbXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB7930
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_074501_743528_E2AF0ACE 
X-CRM114-Status: GOOD (  12.48  )
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

Hi,

On 15/12/2025 17:21, Michal Simek wrote:
> Hi,
> 
> On 12/12/25 13:09, Tomas Melin wrote:
>> Hi,
>>
>> Is there some more specific information I can provide regarding this patch?
> 
> I am trying to identify U-Boot code (2026.01-rc4) which does what you have 
> described in the commit message but I can't find it out.
> Can you please point me directly to file, line number where that described logic 
> is skipped?

Please check lib/optee/optee.c, in particular lines 128 ->
Target dt being linux kernel devicetree where the reserved-memory nodes
are automatically injected. When node is already there, it bails out early.

thanks,
Tomas


> 
> Thanks,
> Michal


