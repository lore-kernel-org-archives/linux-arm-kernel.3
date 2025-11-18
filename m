Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCFCCEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 02:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sLnDkC7czMeQm7aAiKTaobgKwp3Fne/Rphct4BwVqt8=; b=MSpNPLIvQbQ5VfflG7THL8JDrR
	kXW39Ao2Ye/jpTgV5FLnIhvhsIs1yEno349dnzH5fnk2ZdN9Sdk6q+V5p1KwmQkQSqKFfSipQX1nC
	K6cqi1cAhBvmKTtV1hrE2v0dD0jnaXO7+i6JTFf+HLOr7y/aNMniX9gh8dZzhqdmp4MoI1Hf4qe06
	vOrqjFgXUY2CUrI+zgfi6vsXKIA+gk8x6LbTX1J4WJ0lX2Ca4X61YDZzksLSCYYJjffzMZFMCP3n6
	chM3X+M9VfVXn9ccOOgK4SW4jQNAoVLT7cwO6Qh2ez1qk4dHFX0iq3V+IjO8xyINRExhNY6yjpZgM
	nsBEbS2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLB8J-0000000HCPA-2asw;
	Tue, 18 Nov 2025 02:07:51 +0000
Received: from mail-japaneastazon11023099.outbound.protection.outlook.com ([52.101.127.99] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLB8H-0000000HCO1-3rlA;
	Tue, 18 Nov 2025 02:07:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C1iSXas/9x7kjiVEyQnLUhRjzqIe/m0BJswgKYrKGoPz6yMT4ln8iUlXBXCWHsV+3xlU/A+3DcBMblN8njUbFtxsb3HrY3rLOc6Y6X4PJSJphr1cBHiGeBSJ4L1SN3+q6FCImvSDF/GtR3fOANt88KdRNWG/7AR7Xrq2RVy+NGqHz4V05S+k0x4EAxiSF8vGUc4zHHINeS9LOtLnqlYaTbOGyq13GzWPVfSuuRJ3Ig38BZzGkt5U3UheDfGS4OX7CI7yaYgaTAi9VNRTcGwHFPzMMM+JZSg5JGTBzT53d2KW7dEykPAcU9twrMM0EEAhSTXRJuyt67rAXNI6GW0tSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLnDkC7czMeQm7aAiKTaobgKwp3Fne/Rphct4BwVqt8=;
 b=vWsLibrDj/ncKpq4/ZQgaMAp0s+cbhVekfu595fIJVekOG+ONWgnn5eoqj+EDw8kqY4lHPY3g6cgWdLKff4SUDV0C0MgXhzgL0TN1pne68TO43LkeaLerUtJDPC8TUXpqGJ8CyusGh7RmVqSxeCii8taAwCFyL0EnfPSbqBY/s9g8DTap19tnu6ChbXQV5hwYm5dINKIyccTVpuGSHSat227S3oClF5dIQMxNdo8V53fwniOpEUjwM5OIORiLdnza/03j4Z59zpWoapwM12dJNDhz43iHo9nhE3Xq1/G9agBr3fWj0EeW3WaBoTslUNoyWmZDQI9xDHIYYrbEbsJsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLnDkC7czMeQm7aAiKTaobgKwp3Fne/Rphct4BwVqt8=;
 b=RLqmZO/VqNctLPTkI+vT+smlzaQ7VGl2UTQXvGHK/vxfz9OuOA/uSQ8aBGpcSkzbOEeIxRun4SvVSZb/A98IdyV21qLDVcABIEsyzhJwypCxqKMvAfliGei4KYLRvtVXTNJ7kSGxRg7DQ134YhQeWREfIltNR6y8bWCFTZDATmlsULWyMUszULunb8hjCuS5zHUq8G7xZnPiqmULYEKBaFg1wKbATg6trE6c3j1hbAxLztcZAW1ph4TTushVO3C5WOQNINqYziRaHTRqhy0tppwGyU2FC4rOAyUzTs/Ihc8+nhmUKF6pmLiuRWd/JlXALRlaYvfk8jTLvs/ugpxUoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by TY0PR03MB8277.apcprd03.prod.outlook.com (2603:1096:405:16::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 02:07:32 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%4]) with mapi id 15.20.9320.013; Tue, 18 Nov 2025
 02:07:31 +0000
Message-ID: <1114eb5a-d04c-4497-896a-789c02527eaa@amlogic.com>
Date: Tue, 18 Nov 2025 10:07:26 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] soc: amlogic: meson-gx-socinfo: add new SoCs id
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251117-soc-info-s6-s7-s7d-v1-0-6ab8aab03dce@amlogic.com>
 <20251117-soc-info-s6-s7-s7d-v1-2-6ab8aab03dce@amlogic.com>
 <592374f6-6fb3-47a0-a834-ba6702f4b2a6@linaro.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <592374f6-6fb3-47a0-a834-ba6702f4b2a6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0350.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::16) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|TY0PR03MB8277:EE_
X-MS-Office365-Filtering-Correlation-Id: 9287e615-a77c-4bf6-f04c-08de26473afb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MmQ1aitNKys1bFNnU1o4c3d1bEwreiswY3VDKzJUdXV2c0dwM280Mmt6dENr?=
 =?utf-8?B?ZU15NlZKWnBvU3pET21ZS1BpOC9SSlgzN2tNMzAwUjMrVFFrZnlndktVQytY?=
 =?utf-8?B?c1Q2V0tKM3AvMm5SbmNEd3dIRWQ1Njcwa2YwUVRtRXJybkNlVkJhL29vU3FI?=
 =?utf-8?B?Tk9qYzB5dUpyUE5VQ1I1SFFPM2J4YXNYbXN3K3h6aEpIOUc1UGRmSnZHUHM5?=
 =?utf-8?B?S2owcHZtc0tHZG1UVDdmSmYxY281ZUdYZUxJcks2c250bU1VbUUybnA1ODZu?=
 =?utf-8?B?YWt0NU91cFR5TVBkZE9MWUY0VzBSVG1jUEF4dGl4R1NmVDVuWUcrUG10VkFm?=
 =?utf-8?B?WDJWbmJzekRKK3RGYk9qT0FuOGJLdFZLMjczRmNIUzk2QkVQdW5kWmFQYk9l?=
 =?utf-8?B?dnk0RmZWTyt3OHV2S0tYdCtRb3FhNXYxeFZiNE04MmJZdTljZW9vQ2o3VDl5?=
 =?utf-8?B?R1V5UW5pOGF3WXdXeERNRjdRdWNmbzZDRHliTy9MWFZHYlgyY1Z2RWtvMVN2?=
 =?utf-8?B?Nm5MUlJNazMzRllJdHg4anA5T2JVUkFVVEg5M2ZudmZhMHFtNTFhVndSbU9o?=
 =?utf-8?B?ZTM4NzdJd3RNM1N1Y2ZoVGRsTENSU1lCS3BLdFhUdFJ6MlZCR0R6UnI3V3l3?=
 =?utf-8?B?QUFONkcxMzJpUzhsNHlvSG1BZkNRQ3BMc2NsNTV1dmZtM1BtYzdqTTNSYzZW?=
 =?utf-8?B?cHpNQ1BwNWN5bjVVM01ReWVESDFua2I4aFFCMkhiL3ZaY25FYzFtN3pIV3RC?=
 =?utf-8?B?Wk9oOWZkYml2eFZNM0tDclVoNTZab1lScEF4QzVCV1hxU1lLSVMreU1jMmIr?=
 =?utf-8?B?bTdrZk9rd0U3NnIzV29ENGU1aW56Nlk5dVVvdW9oYVgwSytySnRTSTlOTjkx?=
 =?utf-8?B?R3RBOWYwRjAva1FBdVFtaUNxUXd4c2VmU0xSQ3ZHRkJXVzhRSDVNbkYwdHp0?=
 =?utf-8?B?YStYL2Rja1V5SG5yUGJOWlBjMFJHcUtIWk1YQjUwc3MxVk5FdWRDUjh6Z1U0?=
 =?utf-8?B?TFF0bHNhenNvQ1NROHFiN3pSZ0Y5TnRaazBaamZNbWdHa0M5TFFZVmtjbU1N?=
 =?utf-8?B?RktqY0xpU1ZSTzFtVlNrZ2thaGRyUlAzeHU1UzNOTXk1S0VITGc2QTRISU9w?=
 =?utf-8?B?ZXFzQVMvWnB6U2JodUlkeHhhekE3TDQxYzRNeGgxVy9MR2czVTNjRVhRYitH?=
 =?utf-8?B?Q21iTC9USVl3OTEwcytCVVErVXlQeE01TlJuSHJzRUg2S2dyRm82c0M4UlNu?=
 =?utf-8?B?RUVJa0ZPTHRGUithd1l4UU5NMk1jL01nbW5yaWZKQ2p0VVhteXF1RHhZN2Y2?=
 =?utf-8?B?dHR3NHdKWFk1TEtGaWhlVnZrcjJ2SzFzb2dVOENNeS9CNStHZGJKeFFUcDNL?=
 =?utf-8?B?eFRCNE9RQWtkOTlyZUtTVkpxRzZQZGp4NWdRUFNBVytUdGpUc2lqVXArTHVa?=
 =?utf-8?B?QXZ6ekFQYS81K3NmZnNEWmNZL01lQkZRTUQrYUlWWjdjTmJ0bGFLbWI1bjBi?=
 =?utf-8?B?VGhCRW9pNWVxOGt6cGIvRzJnOWkrd0lTaDZHMEV4RTNpWDJtZ04xTjFTRUFT?=
 =?utf-8?B?SnVZQTRUaFNPQlVvdVI1WlZHanlsWVpKYStJUXZVVnFBSk83SC9zOGk0S3Vm?=
 =?utf-8?B?RG1VZUg4QXp4b1p6Y0twa0Q3S1NDWmNLRWtzMlJDeXMvOU9DblZ2aDBMSGRz?=
 =?utf-8?B?M29VbHc4LzcrQURWMDRtbmIwZzMyMHJpaCtpUk9lamZCUnl3NHZ0aDlOTXg1?=
 =?utf-8?B?Q3djZGNXdnZrVS9hR3dBZi85MTJMSHAvalVCdnBxdmVhaEp0TGN2NU84UnZQ?=
 =?utf-8?B?aXlDRDRHS1hnR01Ec2U3YWNUQk9Tc0w3ck9sQm81eEpVWU9lN1hGUjJWYmRM?=
 =?utf-8?B?aVRaeU82UEpxN2JwdXRKNnMvSXB0Y2l2UmdENkVCajZyY3A5QlRtYm4yYnNB?=
 =?utf-8?Q?Cseasv1eZ73drtdCpFVV5WN2k7DzCny+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3VYaTBxUlZzSVZXeGdpK3NDOGl1ZlhVejZXRGFYaGFiQ0laRWxzMzVpOEVo?=
 =?utf-8?B?b3VXZzN0NjRlSStUMTkxMzQ2R2o4YWFSSFZxVGVpL3RYeWxPNVkyU2xXZ2hq?=
 =?utf-8?B?eWFZVEVicUhXZEpMZ2hHMjJIVGlMc2FNdDBlZnVZSUVFY2lqYXUzemptOFZm?=
 =?utf-8?B?TnhmRUE2Ny8rRXdaZ3pWcDFQYnd2VWpScjltbmprMWJQMjM3SHBKM1VWdHY2?=
 =?utf-8?B?TU5NTEZHQ0cvUnlJRGNvWnA4SnVoUjdhWW9SOTFnd3hmL0hXOVlXeXB3Nmww?=
 =?utf-8?B?bzdPLzBOT1lqS3BJZ016bHlpQ1pHZnJyeWVRbVNjNVBXSDNUKzJackJIdzhp?=
 =?utf-8?B?U08xN1l0SFFIRW81eFpYcEI4Rm9iM0duTGxiektLbG9CWGt0cVlmc1hjaVZL?=
 =?utf-8?B?dHNMV3E0OUN2aFZyejhEaTQvQitwRUl4T2dkT0dkZHZieEczT3lFMW1tMzlG?=
 =?utf-8?B?SS83aXV1U0lNMXh6cjJ6MFo3b0trMGtOeFNjRnhKbXUwcGVjTjNiRk5LRzdx?=
 =?utf-8?B?UTYzbnFzdE9xWG5wSU1vbG9uTWdZelpIbE9mbHQ5QzJXelh4TXY3OWlSS2x3?=
 =?utf-8?B?WTd0STFJMzJhR295bXd4cDBCbkVyd2E2ODMwY1VBeWlvVjM2N0hYSms4dVFw?=
 =?utf-8?B?SENuSzJZVkdIZFdpek1XamxFcFVSSDhETkFxaUN2S3p0SU5hSlB1cC82dm1a?=
 =?utf-8?B?WkJkbGYwL3FMdzRNTVZNV2xsd1M4d2lpWkdsS1lNTk5sVGdRN2xyZWw1d1Nx?=
 =?utf-8?B?bVllZ3pmQTJrQ0xRRm9ObDZidGpuL2Zkc2c5L1ZYTXNtUUtNU25YcHlzeXN5?=
 =?utf-8?B?NnJWQWRZd3VJWlg5cG9JRHdKYU9PMFU3bXMxSGE5Y3dWbk5RN0Y1QkE5SDZF?=
 =?utf-8?B?SUc2Nnc2bXk0MXozYlZPZjJ2a0pnbG5GZzFrVFJuRjlGaWFkMlVMY2JDS3Bi?=
 =?utf-8?B?N21STzg1VFM2aitxM3g5SmRQQnN3Wkg0ZHJWQmRQT29KRWZaTjRha0VNZzFk?=
 =?utf-8?B?SmpBbUN5K1UyRmJGcFVrNmh3TUZXTXJSOXY5aFBpSkxic3E1QTV0ajdySksx?=
 =?utf-8?B?MWxKdXpURTEySEhiRThKMDVza1oyRUJhekFqWFpJM0xXcTNGZzd5dGVWRG05?=
 =?utf-8?B?NGh0L3RqNHhiTXVKSUk3bVVEbzBIbXBPVGJmWjEwdWNHWlZLeDdYVWNWdDh2?=
 =?utf-8?B?RnJ1c1JwRXdEbDFWcFYyVUxFYzR4NEg3VGdYMEsyZEtoMnJtbWdsK3UySG9k?=
 =?utf-8?B?MzdiZ0J5YnJxeC8xbzVDRWxvak5iMmpPN0VLQ1lyemtidHJWbGJDRjNPdHov?=
 =?utf-8?B?YmVpWndQV1UvWXVWUTA2aTVsZXliWFFNOUFsYmRNUFd3UHZIVGZNTnI2c2U1?=
 =?utf-8?B?ZlRDaERncWlkZXVkazVxY2JkZ0RHdHB4YlF3UUJEMHZHL2wvWmxqOVZvdTFH?=
 =?utf-8?B?WU1rWHNvNWFtbmtXQUUvUUlwdWJWeFZlMWpicit6ajF3TXVNTk9IOUtBQ3Z0?=
 =?utf-8?B?OFhWR05DVW1pOFJzRStiajhwY3VRQUJNL29ZbENwSzJJUmdNUWk3TTVNdWhn?=
 =?utf-8?B?a3lFTys1UStiR3hOeGhheERiN3hXQ0dDcngvNjgyMlRNM2NXTXRZZlU2Tml3?=
 =?utf-8?B?NlRHdnFUcFFabFM1OTBlSkVQMmFLakFzMTF5dkNvV1owQktaMTNXL05SdFFM?=
 =?utf-8?B?dHBzUk0xdkVLcjcrb1hRZTFham9pUTZFVHI4bFRzbFJraEFRZWhqTlpnWnBh?=
 =?utf-8?B?aUlIV2c2M3Q3cVl2cm10ZFFDS3VoYTNFa2dMZEY5MDhpeE1WM3czcE9lZDRD?=
 =?utf-8?B?clg3U2I5NGVJQkwrdjlXRWhnVUs2am15VEh6eFpLVk9tVk5KVFA2RXp0c2dz?=
 =?utf-8?B?NHRPS1A2OTRrOVpmSDZuVnUwRjdzU1dCK2dBc0RBRWZGdC9ZL0ZrYU5qRWYy?=
 =?utf-8?B?Q1IwN0duUjRxeXpIcHhLdFZ6RU44bm51ZE9RMDJJRkJzU1VYWjdqSDRQeWxI?=
 =?utf-8?B?bDhUaXZERWNNbm5aMlAxVW1oc3hYaDdYbzJkKzlaU0VJWFRJa3hqVTNTVXAr?=
 =?utf-8?B?TzIxUlY4anB0cnNGRTFsSEpwcDNyY0FhaWNiSVo0VmhjbUw1Mjhzempvekk1?=
 =?utf-8?B?emkyaTVEY1QrVm9zNGt1UytXbU1ZUkpWWHBadFgycGNSTktvbkcveFhTQlBY?=
 =?utf-8?B?REE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9287e615-a77c-4bf6-f04c-08de26473afb
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 02:07:31.4310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9fjMHmB/PRD8xEYHtaQfEZ0/+LW/nDJIBUFAYzt1MIOwU2zDj3D5hIMmFiGbJIcJamujZj4AmPpOsdPpeXJ8mkOEescWL4ZS23BLeOSWBzw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB8277
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_180749_975793_3FDA4F52 
X-CRM114-Status: GOOD (  12.27  )
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

Hi Neil,
    Thanks for your reply

On 2025/11/17 18:19, Neil Armstrong wrote:
> [ EXTERNAL EMAIL ]
> 
> Hi,
> 
> On 11/17/25 11:17, Xianwei Zhao via B4 Relay wrote:
>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>
>> Add new definition for Amlogi SoCs, include S6, S7, S7D.
>>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> ---
>>   drivers/soc/amlogic/meson-gx-socinfo.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c 
>> b/drivers/soc/amlogic/meson-gx-socinfo.c
>> index 7549f1644e5e..6fbb70c8922d 100644
>> --- a/drivers/soc/amlogic/meson-gx-socinfo.c
>> +++ b/drivers/soc/amlogic/meson-gx-socinfo.c
>> @@ -45,7 +45,9 @@ static const struct meson_gx_soc_id {
>>       { "S4", 0x37 },
>>       { "A5", 0x3c },
>>       { "C3", 0x3d },
>> -     { "A4", 0x40 },
> 
> Why did you drop A4 ?
> 
This was my mistake, thanks for pointing out, I will restore it.
>> +     { "S7", 0x46 },
>> +     { "S7D", 0x47 },
>> +     { "S6", 0x48 },
>>   };
>>
>>   static const struct meson_gx_package_id {
>> @@ -86,6 +88,9 @@ static const struct meson_gx_package_id {
>>       { "A311D2", 0x36, 0x1, 0xf },
>>       { "A113X2", 0x3c, 0x1, 0xf },
>>       { "A113L2", 0x40, 0x1, 0xf },
>> +     { "S805X3", 0x46, 0x3, 0xf },
>> +     { "S905X5M", 0x47, 0x1, 0xf },
>> +     { "S905X5", 0x48, 0x1, 0xf },
>>   };
>>
>>   static inline unsigned int socinfo_to_major(u32 socinfo)
>>
> 
> Thanks,
> Neil

