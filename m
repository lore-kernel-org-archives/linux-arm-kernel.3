Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CACECA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 11:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=94VH2akJzztUK2ry2+vfngSsy60hZZAUlX6wrv7Pzh4=; b=pyfBGfsgiFZG9WmXdrKMmLBD+2
	UO0JBTjX9oZkqq/YJLoEebsjMaCrJadr2AGtNNxvDq2y9iopcx6lQXosDsb4PGrENsKH/zHH9Ow23
	hkdUZgMi23+QjspTTQOLYz/amw8Y/STKLWn9h3PlFJcRTvDpJWvP3xkvFxBViXG1sN43D8d62muyQ
	TZfUKJMeEDfaKj8v6/ZKDnWUc4CM+ln+xlGcyVLtEv+J+RlGqor851qshhVrFTag40KJFiRP1WhuX
	i4negy1Am6cN/FPNA/HhVNLoAOnoTGF9m9XL7emOdTb0J5uC09j28e36J1tUkMLWzKdly1/7fkTBC
	PK4TPIjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uogZc-0000000DGZh-1G5k;
	Wed, 20 Aug 2025 11:01:44 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uofiI-0000000D5ev-1dQ4;
	Wed, 20 Aug 2025 10:06:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oRX7Xdo7QbCcOzLZLJQ0YMxViy91Er/RQR7YJtzS9BhUG+fc9rwLfojC/C1Xdv2u3PGdyRujBOAELsxOLWvOmzHXBWPfOcOnL9Eaa762T+FAv8bmVQe9dpZso6IdO2+bjmWnpy5EuOhjClwBvC7waYn6wWciI61Syhw+SESJFJB0p2Oxj+W6kuYOCObAmSS366Gtq8BcOBTH8dV1hHSO6WbyXQvIqsCAJ2ITcZrSodit4EXSepEp7g/OnPleEIUA54oXkKlUy4GEBplw8GARWLwQhEhgKfpuAsjlETPtgUP0JvtSOWA6FJszD9T3xYnXPQgrJSAw53J1JqwaOybTiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94VH2akJzztUK2ry2+vfngSsy60hZZAUlX6wrv7Pzh4=;
 b=drFj6WPL6mrg1FqZNxbDOqUxlILYuY0wUNdJoWIaRJ43djux/gj6fmI+lzXrSyx3h3hozN/MWDSU0D+h7HlAZddaTeYxgOalFCMqVG1tp4APkG/JCSXwSmo1PtgRkCF7geXnHe/9E5iBYMPYqFkkR/tqc/wvYbPjX6LKKCUctrKKgLo+wNhrIcR84LcLlf1jmbaeUCrTezi+aSe3CXhjm9yQEi6l2LS1kA/ZnjX0ayF3lQv3YnpwQ7lekiqPg0Nnb6OGg3yzamWnmg1dw3VrHiGZFPkuKerm9XaRKT+29kPwgAnYVVzEn40BRWS1+uQ25k0BIqtpC6lWDG9IhgVEXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94VH2akJzztUK2ry2+vfngSsy60hZZAUlX6wrv7Pzh4=;
 b=wdAJzlLqgD4tgh8USLn3TXTlkMfAvLcjGLumOIJnYBR36+QTtENHRJ+Y4tpxC3CqXjAoEQJVyIKlVG23CtOL+lnzKXaL8tQnx4VJF3f0GgATx3zKYRlAvKD8duNReILHoDuWfJhg7C2H7j702kcYNvz3ZqfS4cRdxpDobcQdliA0j13wiO+nKVUE1AAviEh7Xu3LWhoUHcwecWwtZ02s2N3SMl56AymM0AqzVIBMdS5dZnEYaqRZS3QFu7H2FIZprMFI7zDwaCjJUXumMrySs05l5LyC5knaUij7xFx4uugbR3A8N528afR6pTMuqUt6pzgxM60+P1Va/B3SHnPpZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from SI2PR03MB5786.apcprd03.prod.outlook.com (2603:1096:4:150::10)
 by SEZPR03MB8524.apcprd03.prod.outlook.com (2603:1096:101:219::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Wed, 20 Aug
 2025 10:06:19 +0000
Received: from SI2PR03MB5786.apcprd03.prod.outlook.com
 ([fe80::3f37:cacc:420b:9b86]) by SI2PR03MB5786.apcprd03.prod.outlook.com
 ([fe80::3f37:cacc:420b:9b86%5]) with mapi id 15.20.9009.013; Wed, 20 Aug 2025
 10:06:18 +0000
Message-ID: <469c017d-b0c0-4cc9-bea4-4c39ab2a5d2d@amlogic.com>
Date: Wed, 20 Aug 2025 18:05:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/13] soc: amlogic: clk-measure: Add more SoCs to support
 clk-measure
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250815-add-more-socs-to-support-clk_measure-v1-0-59f04ba67457@amlogic.com>
 <8e64245a-d7ce-40b7-b884-84a7234c4a3e@linaro.org>
 <673d8146-1cc6-430f-81fe-9e99896a56f5@amlogic.com>
 <20250820-spectacular-passionate-oriole-eaacda@kuoka>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20250820-spectacular-passionate-oriole-eaacda@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::6) To SI2PR03MB5786.apcprd03.prod.outlook.com
 (2603:1096:4:150::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR03MB5786:EE_|SEZPR03MB8524:EE_
X-MS-Office365-Filtering-Correlation-Id: 791c2986-007c-4c99-6f3c-08dddfd13496
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1dQcW5kS1J3YWQ5dTA3QlB5MWRIK3FjeWx1aDBrWEtSTEFsRDcrTTFHTHYz?=
 =?utf-8?B?bDF1UnRUMDNXTEV2aHZ3Tnh4NW9yc2QvMFBwMWpvSG40Mm5XbDJXbytiM0NN?=
 =?utf-8?B?VzVoMWh5SXozVWtQUE93TXZpZlVpK0h6bE8rVWdJQlFYd255RkVwU3ByS2w5?=
 =?utf-8?B?b3lDVE4za2daaEVGRUJaRFErK0dvWS9EVUUwZWYzeDAzT2l0R3pMNzg2WEFY?=
 =?utf-8?B?dXZMTkMyeisyZlJDM3JUN05CV1htTmRtMXBHN0Z3VTNJdXNGTGwwTlZvMFF6?=
 =?utf-8?B?RFlCSVd0N0swNkFSaUMrTlI1Zkw5bUhGa3FXRmsrRWl1SUt3bkJMdlA1elBQ?=
 =?utf-8?B?VmNOZmYzSUtXZXd5T3k4S2ZnbWZGT2M1WnErQ3FucUR2cCs3MFVqdHp0aXVR?=
 =?utf-8?B?QzVoOGp2WDVPcG9iTjF1UHR2QXpYei9zVVlUZjZMNGxiU3BtelJlT2UrcFM1?=
 =?utf-8?B?OXUxQlFPbC9OVzNpSUVxRG1NYyt0ZFhocE5PUTRaT1NTOVNTdTNCR2ZaMnVy?=
 =?utf-8?B?VmI1TkZmS2VML1BxYkdDQVE3ZVR4UERUSWJCdThhQW9mTENZTUZzSFU4UWps?=
 =?utf-8?B?UkpnRFE3WmEvNjB6Q0xheG5sVkovMTgrRlFHUXJwZlo1Y0xKVXRQSzdVWTlh?=
 =?utf-8?B?aVhJTm9WdFlqT1JIQTZIN0Z5RitqSmxjWVlMcDdPSkhSYUUrS3d3SkxpemEw?=
 =?utf-8?B?ZE00bE1RN216WFhTREV2d0RGWUNrTUVMWklvbnYxWW80NHJ2NGlISXFRMmFq?=
 =?utf-8?B?dC9wVEN1MjhNdG9tSEFzVThqaGV0YWlPYmhRMlRYZldNOVI1bFkxK0plbklh?=
 =?utf-8?B?SmZpd09mOVBYb0dGUGZaM3FZQS95c1JoMkErM2RmTEc5TnB0cHh5VFI2TUp0?=
 =?utf-8?B?UG1BelpnYkFoVzl6UFdsVGNqTms5VENraHpOMStkcVQ0amtveHJOdXFabm1Z?=
 =?utf-8?B?NDQyZ2Vkc1RMR3NrMlpJY0hPT0dDVlY0RkU0R0UrdWRBZ0tDVWRnUUJNUDJk?=
 =?utf-8?B?NzVLVHNlYTNqQWtWMis2Z01reGJTUlFZcVZxendSK21tTkRkK1dtVjZyQ3Ri?=
 =?utf-8?B?K21ZSHpPUzNXVDZLTGpqdFBISHRmOHhFbndGdExlN0htRUFweHFyVUErKytp?=
 =?utf-8?B?RVg0Kzkzc3BVNG5RaERpcy83MThjNFlSRnJWSHVFaUVFeTY1NXRLMkd4U0JS?=
 =?utf-8?B?MlY2a0lOWmdkblBhUVZaVFdiMXE1OXR3bWlieVlIRlYvUmtjdW5CUEhpa2hY?=
 =?utf-8?B?T0xMOG1HT0hra0JWR0M4T25mNkI3a1F1dHMzM3ZxNTBaK1lPRWtxeHQ2ZHNo?=
 =?utf-8?B?WWpuT21QcHdvMUhkeWNld1ROQnNTRTMyL1Q3Uk1CQUlDa2c1WjREbGRMMEQy?=
 =?utf-8?B?ZFU5V25kbWdKd1pYbDFaTnRjLzZ2VzA2Vkg3RTNuMDdxdk82bmRxbVdQVkRt?=
 =?utf-8?B?eTFMOHhNdStBYnhGRnlKSzBudnpZU0xYbkVraUZObDBUYnpQdFVRbkVOcnF4?=
 =?utf-8?B?bm1ZZXMyeXcwaXFVTjJZRzlMcmJWUVJTM0dYdGNxV0ExUlk5d1gwRXNHUk4v?=
 =?utf-8?B?Vm9DUC9FckhHQytBREZaRU12TDhaelFtN0EwM3dNTjgybGd0NkZxM2tuMCtR?=
 =?utf-8?B?Mjc3ZmladUZWdnZBeTVEbDJ3QTkzRzI2TjlsWksxRlhQT3VPUWdjV3JtQitE?=
 =?utf-8?B?SEQzUFRqSC9vbWRUSklpZ0tPajNhdVFKb2Ixa2NVZzRobWc5cnM5bHJraWxs?=
 =?utf-8?B?WEpINlUxZlVhRUJnRzkva0s2WFdZUE42RGJuaUxYTytlNFZaamIxUnJ2RXpp?=
 =?utf-8?B?TkpvQnVaQ1N3RTR1RUpBanNUQUxZU24zWEVwWTdDM0p0d2Q5RnQyS21CUlUr?=
 =?utf-8?B?cW1UWkNpUHlSWm1SMTdwSHNHZzhDZkN0aFBqWVBLT0NJeUJtYVRzaEhaNXZW?=
 =?utf-8?Q?4PNREbSMCFQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5786.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzAyTHdvd0NrVnlxSElIMUxKbUVFcHc5ZTBWdzhWckxMZnBhcUtsRlppNFVP?=
 =?utf-8?B?NWZNNWNDNnFGZDh4ZS9sQVFNMDBOY0Nib2Nndk5kSVVUaW45WWhlOXhZVURZ?=
 =?utf-8?B?ZHFXMGZUQ3U1U1IvajBaTWlLVlVEYXZlRkVEdWNjTHBlWnpoKzB4eWxSL2Y3?=
 =?utf-8?B?akIvUUZncWNxcFBXOHR2Y05CbTF5OERRWkdCbGZRSjYzQjQ2WGpkKy9JVm90?=
 =?utf-8?B?STdyc3dxZFRyQzdEUTZOMXMrbXNUc0hxeFBiZWNaZTBycXhqU0NUelVXVm92?=
 =?utf-8?B?OFFXdXdBYUs1b0xSVWI4NGZvQWd1aU83eWt4K3krei9DV3JFaElhUnNyMmdn?=
 =?utf-8?B?MXpFb1dxdjB0eXovUkZqRy9nQ2tNcUt1ejJJbmJoNEVSQXQ2V0V5d205V2VR?=
 =?utf-8?B?RGhyalZRZlVNVnV6OStPWnFaaDg2dVFtM2diT1RTL292TEc2cFJZZXVlNXEx?=
 =?utf-8?B?SlVuazd6WWlPSVVNa205MWVkUm8rdzB5UlRvNVd0bEQ4ZUZ5c1FiM2NOK1BN?=
 =?utf-8?B?eG9USDJHR3BmQVFmTGpUOXlwM1RNMTRjRW0vU0ZpMmtldk9ncklLOTUzRXRE?=
 =?utf-8?B?ZFhTTWJ2SDNRZE9NMERrUFRVRjlnbjlVWWJLSkJjemVWbzhuWTRmUkl4THhh?=
 =?utf-8?B?VkgzOVBqWDhzMStyeGpRRWJrYXg3VDlOeHZXYU1IenpTVE5KYTh0VjFKeVpN?=
 =?utf-8?B?SVlYVzlEUmh4SWI1OGUrSFFZYzBZNEY5Vmszb0hyRkRtRDBLYWI1RGNJNlUw?=
 =?utf-8?B?ckRQdTFxS1Zzd0JyQnhOaktReVVFRGd1TEF6ZStZVjBJeE1lSWM3a2U2T1V3?=
 =?utf-8?B?Q0pudDliamp1UWE2aUFZaEUrM0Zhc1BpTWdjeDFZNzNyekFEQURiOEt5RjRG?=
 =?utf-8?B?YUV2VGZDem1zbHZCVW04dEQ5VnNiNTQrYjhxYnVKenkwNWUra1YyZTdBd3pT?=
 =?utf-8?B?VjAwT05RZ0FtcGgrRE15VXo0QVMyMWpZdFhDc1h2NEpBei9MUFkrZWRIQlc2?=
 =?utf-8?B?WXp5K1p0MDlUdEx6TERvcml4UzYyODVsT1FFREk2MHYvbEZQOVJkb0t3WTJz?=
 =?utf-8?B?NWJPeDBLTnluUEM2Tlh2ZXlVNVZ0WEdQdklQT3FVMWNFQXBobk9WbnZyOU44?=
 =?utf-8?B?eXNIdTNlcW9RTkxWVTIxUGVscVlQb2IxVU1SVS8rcDd2azF4bThQbW9GWWZJ?=
 =?utf-8?B?RkR3YWs5NnB4eHdmU2xjVU1TT0VWZkhOdG41clpoQmR0RTdUN1NrK1hHcm8x?=
 =?utf-8?B?Nk1kR2xldEVlOGxkOU9haG9STitsdHpiK3hDRms1V2xnMlIxV3ZpNkpEZ2ZT?=
 =?utf-8?B?dTFOM1I2MEVrSFoyY2xrbFpnVDVXT2tLcGZYK2NtVFdldVI4d2w0OExHSE9N?=
 =?utf-8?B?OE9sMzhYY3ZubExNT1psZWF3eVZDdnV1N0ZQUjRWMEFXOXpON1JWKzhWMHFo?=
 =?utf-8?B?ZkQwL3l2MG52MkFiQkJrakxNazJHZHZLMUlmK2RTNnlmazB6U21ITkNmRGM0?=
 =?utf-8?B?MGtTYXE3M3JJZEV3RVgzT1diT2tjVk9jQi9Mb1I1bEVEcE15NkprblZnOFZF?=
 =?utf-8?B?RHhTYzN2RDh3ZG8rUkFleXp2UEJTZTBsVy9RRGo5Y1pKVFRyMThSOG80WUFp?=
 =?utf-8?B?Mk9UMXhCcVZNZ0drK01QZDV3VW1NUE84MGhyY0RoZE5wc2VadWNVSzRhL0hX?=
 =?utf-8?B?OFFMNWtIUTN3Ti9BWitxWHFZeFZwanFwTHpEYnVsMW1aNU9GaGg5dGVEY1ZQ?=
 =?utf-8?B?YTgvMmFnMGtmUEM1b0k1NEwzcWY3RHJaajlSNGtIRWppNzFWRVNabWhRamRT?=
 =?utf-8?B?dGJlVDU4a0dybThyV0xvTFhmN1ZSTi9Uek1yV3hTaUlLMG9VT0ErR0F1MHU5?=
 =?utf-8?B?Zmc0RFZ3WWtqQ2NlNTRiR2pVZ0xrNzBmMjV3TnNBeU0wL2lTRkZGQUZBVUlQ?=
 =?utf-8?B?RENoOVhuZnVCZmU4dkNzRU5GOTRnNERoMldURUY4c3ViNDVUNlRiRmxNUVdy?=
 =?utf-8?B?aU5EaDcwN2ZXdXJUTGZMRHBhMFBuRkNLalI4RHdocGVwcDR1ZzBLTlZlT3FK?=
 =?utf-8?B?NFRONHdRckE0YjN5Ylkxai81dTBnd2dmODN0SGt2dlNqVDRtVVppVjN5SHMw?=
 =?utf-8?Q?iTxaMOizj1MuI3dj4XYN6wuVg?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 791c2986-007c-4c99-6f3c-08dddfd13496
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5786.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 10:06:18.9024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A2jL4CzkrK+3yZye/wOlDPMSYL24V4q5Lm1lCnUChXRm7T23Kcy6hCMSGJsvF9V0ZVcYni5y7s2+2r+ENcrNnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8524
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_030638_437611_D2978ACE 
X-CRM114-Status: UNSURE (   9.70  )
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

Hi Krzysztof:

     Apologize for the rookie mistake. I'll study the rules and resubmit 
properly.
Thanks for pointing this out.


On 8/20/2025 4:12 PM, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
>
> On Tue, Aug 19, 2025 at 11:32:07AM +0800, Chuan Liu wrote:
>>> But the fact you need clkmsr-reg-v2 means you at least need to add a
>>> generic
>>> compatible for v2 register map and drop this property.
>>>
>>> Overall, I'm not a great fan of this, it moves data to DT and duplicates
>>> the strings in _all_ board DTs, which is worse in fine.
>>
>> If you agree with this approach, I can refine it based on your feedback by:
>> 1. Adding a new compatible property: "amlogic,clk-measure-v2".
> NAK
>
> See writing bindings document.
>
> Best regards,
> Krzysztof
>

