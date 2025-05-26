Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E621EC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 10:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZZLCfMP5fZMv/VyvLTDpyXWXqE59zu+CLv/AHwAy7cg=; b=3Zu2J9ktyRztyCYw1bar6xDn9B
	siMyDP0bGW3k/Ij7R1CyCLo2gVFq3vD2GHMUKCd/8QZYhuu/XNCT7X24AW5eWuyYHnEcRv4gT81Tf
	/WoTWmYhHRDP4VGM82G9grWYRujfHH2KDhaGFWpfoPacbJBTvfne/s77Vp/FcHRTfjOkuLqL0Q96I
	4gLX/paH5zL3gn/iJ5mWLwfFmnMItGuojRcDhoaw2ouUJqLbUdDQsO9v3zOftEd9iine0AOftLAnR
	FS5JQ3ZEosRVJ4rU6NbonwKbbChEEgXBVrgZ19OkJFamjJPjTxJAMDDzDAMGMUyTa+Iw6H/8Rm9ns
	81xJ+PqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJVVG-00000008exH-2X4d;
	Mon, 26 May 2025 10:56:22 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJVT9-00000008erl-1Nxo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 10:54:12 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=myoaifRSYGMwpnCOeENKeEhB3IpIa73qlywqNrar2qg+FFvuKxdf7QIZuFv6yfXMcGq2QUhGs69IWKoFVlzTVjW0Ea2lwrf+Itic1+88Le5XThQouBHB5Bw7osDq2Vzifhd305RG2eEntdHWvcJd0EaWz1xs8/iIiDLQCBz91YRYW8bN9BAIbzwJEJgsfnM/px3pGQ6b/PjsqWyjVnCptqUB5oNGVJKfvqUQFHHToJsAYFpUK4bP/vKJXrcU9DlfpH8y+SBowzvYBDAr9QbDRY+HPwgZPkizeJj0JZ6vcvxLoWw0zVpQrRTT9hrhDdJ1fZC3OPRSzATgvvs36SUZcg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZLCfMP5fZMv/VyvLTDpyXWXqE59zu+CLv/AHwAy7cg=;
 b=QSS4yd4bCWpXD9HBkQiF0BeLLc0FOOl5+7AmsIQyQqGVoIZhj4XfcFgTpqTwip8kzM7L+Lql5nv1oSDvpImJ9YFLMtkXwEL/a+bpGPjz0T9zvqRZM/EPMlvO5EmJ0aFcZmnDV0+rPVhDXI/pyFEOWoL3r1dKtnbWeOgudPg/E9lcejPXxHoM2vD566ZneB7GMrk9sBk+n8plcyJpc1kJ4XtYBT2yxn4q7v0OKjNHYKbFsKJJwdzqJ4gNA3lZvnDyV123P7z5voGokKYGhWnCCT1HhZEQldnrWw14yy69fHEUE6M9EnMp3qU/ztroLtKdERszusuUz1syOErTMcID1Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZLCfMP5fZMv/VyvLTDpyXWXqE59zu+CLv/AHwAy7cg=;
 b=WuqzjD8Jo74gT+8h7T/+1az7FejWbuNYXfTSD4nlDOWkEQfn2PToCjdsKkCPW1up8++6mVsNSXuolDiJvhKmL+Q6+jMoTrYU9va9nAOsqv+d0UXXNiFaHN124oJfPx1vQEDm4KItLMQlSuzcmwJf+jdYHR9ljgtB2D7C9QW1VjE=
Received: from DU6P191CA0066.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::6) by
 AM9PR08MB5972.eurprd08.prod.outlook.com (2603:10a6:20b:280::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Mon, 26 May
 2025 10:54:04 +0000
Received: from DU2PEPF00028D12.eurprd03.prod.outlook.com
 (2603:10a6:10:53e:cafe::b5) by DU6P191CA0066.outlook.office365.com
 (2603:10a6:10:53e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.26 via Frontend Transport; Mon,
 26 May 2025 10:54:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D12.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Mon, 26 May 2025 10:54:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CHklJcMtG86OLPALsh9XWJqV+31O9Fs86xmj30G/kd/+K2IouENxCVdYgc8qeTGa7phimwg6CT9Xzt6/dADhTZy2rrQCPh446rbfHy2OfT3r27huE2WASgxm/e8TTkVfMxQaYyUSLUyHRKhpvjH0/U/+anKK+oheMh/JnndYhyL+sDZY6j7/xY26gZue8O9vOC95vZPuRJiCuoGCE7RS1kmqeELWeuUbBZmRfgzr25L/gk2CelpxPBD2Tjt0PLry4gUW2VmP8Zd7S0NpxtCohhI9ELm/mng66V0qfKyvvqWOiczJgu7XjTmuCBLUh7eEZ2UXSa6RFaHmZvgvP8jrBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZLCfMP5fZMv/VyvLTDpyXWXqE59zu+CLv/AHwAy7cg=;
 b=D4ZjVy7g6Sfeh9dWXENwDxdSeC1zR6kaj+S0/fX+S3tHpCavPKNlbZjESzsHNN+IDmvTPbK2BxeKwBpZo2Qp0HR9TWkXSZrLnGJQV43XE46TyVHTZIQW0eobolngth2ZK94vdlcFc4ad7mxHUbP1g2G4gLJdpJYp5QSI9LJSX+fQfyRlqGz0wtP+n/Lp+BX5ii+uSkkMn0hXWnH87NWmE2Xeq96gIl1FRZ6tmGX6pq1YlfyqGUsHTxGQB7l+pvrZzfLVwOKz1IDV8vubpKPlJkPgIEwHY5hMZOOilYH9+t9uduX+7/lFA7GuRWHH/MX/5Mvg9YGU2wh9P/2BaZ14lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZLCfMP5fZMv/VyvLTDpyXWXqE59zu+CLv/AHwAy7cg=;
 b=WuqzjD8Jo74gT+8h7T/+1az7FejWbuNYXfTSD4nlDOWkEQfn2PToCjdsKkCPW1up8++6mVsNSXuolDiJvhKmL+Q6+jMoTrYU9va9nAOsqv+d0UXXNiFaHN124oJfPx1vQEDm4KItLMQlSuzcmwJf+jdYHR9ljgtB2D7C9QW1VjE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DB8PR08MB5402.eurprd08.prod.outlook.com (2603:10a6:10:11b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.23; Mon, 26 May
 2025 10:53:30 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8769.022; Mon, 26 May 2025
 10:53:30 +0000
Message-ID: <ba4a5dce-2440-4e31-8fa3-0c104c091797@arm.com>
Date: Mon, 26 May 2025 16:23:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] kselftest/arm64: Fix check for setting new VLs in
 sve-ptrace
To: Mark Brown <broonie@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Shuah Khan <skhan@linuxfoundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250523-kselftest-arm64-ssve-fixups-v1-0-65069a263b21@kernel.org>
 <20250523-kselftest-arm64-ssve-fixups-v1-1-65069a263b21@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250523-kselftest-arm64-ssve-fixups-v1-1-65069a263b21@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::18) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB7120:EE_|DB8PR08MB5402:EE_|DU2PEPF00028D12:EE_|AM9PR08MB5972:EE_
X-MS-Office365-Filtering-Correlation-Id: 751aece8-c17b-4c30-63e8-08dd9c43a141
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?VUQrc25hQUpGVUJnaTdPZExMRzZqNmhtc09kNkNTc2gxVXlLVnF2bWp2QXcw?=
 =?utf-8?B?K2RKQ3QwS0V0MVUyT2VLVHdrb09vSzRJNis0Q0FYL25QSklNakl0bTE5UjBt?=
 =?utf-8?B?cGR5ckJpWmQyRTNGZGRCRFNKQktESGVGbFZoTHdQeisrckoyc2oyYXpCT0pP?=
 =?utf-8?B?Rkd0dGVtQzdNdGdPbUtueXZFQW9vZ3BoYzVHS0FXa255RzRSNDZxU1grZDhC?=
 =?utf-8?B?NWJWTEZONjZpNG81UTlnODQwaXZ6dlcyOTVpR3JlYTlmMkxyK3VaQWFJTFox?=
 =?utf-8?B?Tlc0eERmTnlvLytUNUl3andSRDFveFI5ZmJJSVY4WmlSWGZDL016Qk8yVENq?=
 =?utf-8?B?ek5KNnNlYzhrWCtiRVFaajRTOVgyK1JoSlNDU25iZEI0S3Y0SEtCeUxzQ1hV?=
 =?utf-8?B?RXFxZks5d1Nla3lKNFZZUlp4UFdlRGlCb3Iwd3IwY0RuNDBOK1dna2VPOHRY?=
 =?utf-8?B?cW00OGRZSHN2cnJyNVVrVmdFT2lTRURrTXBXMG9DOWRnb1VoZFhZK2gyUTRz?=
 =?utf-8?B?SU1ybHZCTCtzb1BmNkpiaVQyM21GVFR6dXZGNjhvdUozbzhsS3NjcjVBTjh6?=
 =?utf-8?B?TkE1TGZNSkdBV1Z2eTZ2a3h5NVJ6WVdnNXBDMSt6TFV3OSthajhXUG0yMzMz?=
 =?utf-8?B?emZZamF6N3VpMU5DeUZNN3pMYWNJSHNvWCtHeXozOEF5Mzh1MzE3RW1wcDlI?=
 =?utf-8?B?Y29XSU9qYVV1MlV0K2YrRUJEK1hsVEE5Uk9wRlVzVzJ0dUZIZWhvK3ZZQWVN?=
 =?utf-8?B?aWt3SzJCYXYxZGZaQ1RjRFNhNnhKYk42K1hUMWFZcmlFUnhueEQ4QjljWjdO?=
 =?utf-8?B?OENNcDlGTjliZGpnOVpkYWtqYmptOHZsVnBHQkV5bWR5bS81ZGZEZzJwZlZ3?=
 =?utf-8?B?aDNIYXN2YVB2NVhFMm5HVG41NTdwVnJHZ0QvNVhMRUlsNmFydXNxaEx3ejNa?=
 =?utf-8?B?ZE0xNFpZYmNQMjk5cVhxL2JPN0YzVnNqaGNIcVZYVDZzUWFzWVN1Q0c2ZnMx?=
 =?utf-8?B?ZzQ1anAxdGhvd3luUXByaGJGd0Zqcmp6c1ZTZWFKZkFYOHVFTTRuS1RXWmlk?=
 =?utf-8?B?N0hoVHdxRWY4NEpmZldQSFIvNlhtdGZ1V2x6bmt2VWFRTWUwcysvM0pMcTBU?=
 =?utf-8?B?cHpLOXRVVUNiSmxiWTNTVHNZaHEvVzVNNFUraWJjUjJobDlnKzFJZUdIWVVP?=
 =?utf-8?B?NzdBM2IvSjlkTHhOQWx0ZGltcjNYQVp3aXhkMzBYdHNSUHVLUmEyajZMNVVV?=
 =?utf-8?B?VktudWQvVDZPeXF4SW93UkRnUXBsUXdlYm55SnhZTXlKY1N4Y01WZnd1WlNX?=
 =?utf-8?B?L0thYXlrMCtGYjZTK0NFOGNYRFgwWnBGZXBFTFovNFlWOWdIcnBRT2hLUXQ2?=
 =?utf-8?B?ejZOL0JzYTcyS2pLakhlSXo2bVNsZ3ZZbXNxWHJ3aDZIQ01FNTAvMFlSUmpB?=
 =?utf-8?B?UVZSNGMwbXRuUjFnVVcvOHM1S1prK1RCamlSam1Sa1NUMW1lQlpocDljR01V?=
 =?utf-8?B?Z28xYllvVUZ5Q2dhTHZKb0IrWW5vU2JaWHF1L0Y4bUx2TDB0SHMxaWw2eElS?=
 =?utf-8?B?c2I0eFR3WnBzTjJic05peVVjeVZaSnp3Z0dRQWo3bEZibXlMV1o4aXFhNlQ3?=
 =?utf-8?B?Mm8wK3M3N05RY3VycXR5cUFNN0srRHh2c0lWdnhvcS9xTUZ0c1daSVdzWE8r?=
 =?utf-8?B?YzJTQklXTjFyV3c2ZVFSQ25QS3NLYk92YVFBSjVpNDhQK3ZyQThCM3loeWxy?=
 =?utf-8?B?b0dzNGtMVW5hb1lWSHRTY2pROXhvTXZIQmR5UkQ3UW9SemplK1JCSmhBNEN3?=
 =?utf-8?B?TjNSa3JqOVNOREYya3dSL3lkVk9zVzFFN2M3bzF3Qk92WHVkUnpHWkhGU1Vx?=
 =?utf-8?B?a0Q5dWptL0dubFprVDlsemlEWDUzaCtUVUpQaTBCdXEvSVE9PQ==?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5402
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D12.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: c02872f2-9355-4833-8efb-08dd9c438ce8
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|376014|35042699022|1800799024|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MnYyWGIxaUNTdEJUVmdvL2ZRTGRvTGRsS3pwcmFvakZmKzdoVzZPUVB3VGFJ?=
 =?utf-8?B?T25OZ3VBZG5ndmU3Zi9DYVRUc28wemgrVllxNk93Z1B3Nk5EZjNvS1dnbzVD?=
 =?utf-8?B?ZnN0cXYrWSs5MzV1U00vSjQrUXVQNXZ3OWxuMytQc2pyQmFldHpiUjVXbFE1?=
 =?utf-8?B?Q2NZb09SWXBZR3dSTUVCb0JXNEJ6YnYvNnBrdXhVdWlhbU5Fam9Mc2Q5bWxt?=
 =?utf-8?B?TFNpVTBtbkY0aG5pTGxrZzRVNGNVZXlSTkN4NUJaakRUYVYrRTE4bnBQTklu?=
 =?utf-8?B?bUR2akMwUmlMUW5jeU9XY0JiNGpJTk9UOVM4UHhZemNyanNLQ1MvQTl6WHZw?=
 =?utf-8?B?YUVQd0txN0pZeC9IQXJpM1pta1BoTU1PR2ZEbnhZOTQ1SDhXRkVQc3htNVR5?=
 =?utf-8?B?UU5aZEQ4UFNueFBSa2k2OThqUm0wOGZKY2pGa2tJZWZ0YzdxS0VKaGdUQzE1?=
 =?utf-8?B?VCtlTlYwbXFIS1ZrVitNbmF3Sk1pNmFHd293UElGNVMveUdrb2IydmNWQ3JM?=
 =?utf-8?B?TWRZVmFnN3UxMXdoNWxuRW5DRjBmcTRtbkRQVmF2RkI1M0UvaHJrOWxJNUZE?=
 =?utf-8?B?SjRBWi9KMmZqcUFxTHZCQWZKTm1XTzRCWVdvTEZhZCttdW9xN04rMUs2eitI?=
 =?utf-8?B?NHY3UmlPT0JoUVdHUmRuY2FDZ1ZXN1FFL0VaZ0wzRldTN3Y2SUVETTZSbFUw?=
 =?utf-8?B?SjVNMzlVR0NJUWFKTml1K0FwNnR5N1hsZVptclhNTGhyelYzWnhKbjZVNEZn?=
 =?utf-8?B?d1BJNXRHL2JxaDhtU1pFV3RJWThIZTE1bkVNQzh3blAzaEE2SnVqeXQ0YUxO?=
 =?utf-8?B?a2UycW1oSU9yQUxzQ0JYMFY0SW1vSHBaWEVWMXhycUFhaUdyOWxOeUxtZ3ha?=
 =?utf-8?B?czIzQnlDNk1QSG5TVDR1TE45VDd1b0NwWDNiUFZoSzJaa1ZKY3Z0QnNGNDZ5?=
 =?utf-8?B?NDJ0dFQ5VFRNMGwzdEFTdDFYZEhpaTJkRnQ0Zk4wRDVmOVpWOHl1SzcvTTdW?=
 =?utf-8?B?Z3o0SGlwTWM4Y0l5Q2Znd3Q4R28rVlRxR3VsVCtOQ05OQkkya2pQelo3R3lJ?=
 =?utf-8?B?V2hWekxzVEN1MHMyQU90Zm5HRHp0ZnVhZVQweTJZNWdMUVJoYjQ0L2V3R05h?=
 =?utf-8?B?dE1EUys3NGhlNGhHSkxOTVlvNXM4bDRXcGJBMDliSFB3WFo4R2ZCTFg2c00x?=
 =?utf-8?B?Tyt4ME5KNUFmQmVSVGt3alBTZC9kRUIrZ3ZHb01ZZ2NYVjI2czIyTXFkelg0?=
 =?utf-8?B?UlFmYWF2UmtHVE8raU9jbUg3eVEvSXU3NTFiSmZIanZTTDllMlJmdHZ4Qlp1?=
 =?utf-8?B?eXU4YzFMTSs0YkVZRnR1MFNKSjJVWVdoTWtIT3Vqa0dQd3RidTFvZkppL2s2?=
 =?utf-8?B?ZWZHbk05VGNBSjNJWEV4bzhlZGxFM2VMVkIxbHdPTmg4ZHpYcUpnQldNQkQy?=
 =?utf-8?B?VzZFRHpGMWhuaW5pMDdzMytZaFlpTVZTMTc3Y2pGUUxpSFJkbXY2ZElxcW0z?=
 =?utf-8?B?bGwzSk1zaG1jR01sZTVobW9yUzBpZFVaL1FxZk02Uk9ublNwdGRPRjhkTXdN?=
 =?utf-8?B?cytxZnB0aG15T1dyTXoxQUdBOEZiTW5KeGRxZk0zNVFJZnFNYXNva0dBaU5h?=
 =?utf-8?B?bVI3M1QxRHZpTVkxVmRqdEV5WXpNenZmaGl3UUNVNitHanBNakhyeVFML3dO?=
 =?utf-8?B?Sytnbk1PT1pHbE01SzFBS0NMU0JtSkRCd2dUVHdOeVdYcEovZ2xaaGxFWWRx?=
 =?utf-8?B?UW9lTXlJbGtuV2NRMm54eC9lN2U2L1NNYjZ1RXJPRTFJdC9Cak1CODd3R3F2?=
 =?utf-8?B?UTNYZUdCVHRrb3ZpaHN3QWlsWHNOcjVrWlNBMmNSZE8xUGVKQXJzdUlaSVZU?=
 =?utf-8?B?M3BtdWNDSGh1cm83OW5BS3MvWkZieEM0dkVrU3d3Y0NxRUhEVzhEeFlwQ0l5?=
 =?utf-8?B?Q1VRWVJmSUc1dmh4T21Sd25MbkhOMHVTeWRpOVo2NWFpWjFEN25ZV09VamNo?=
 =?utf-8?B?U2tNZGJiOUpLZXVPVUZUdElmTHZLWVRaNW4rRjQ1ZkdVbEtYTS9Cc2FzU0VB?=
 =?utf-8?Q?k9aUt/?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(35042699022)(1800799024)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 10:54:03.7514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 751aece8-c17b-4c30-63e8-08dd9c43a141
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D12.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5972
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_035411_380872_03986E2D 
X-CRM114-Status: UNSURE (   7.68  )
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


On 23/05/25 8:57 pm, Mark Brown wrote:
> The check that the new vector length we set was the expected one was typoed
> to an assignment statement which for some reason the compilers didn't spot,
> most likely due to the macros involved.
>
> Fixes: 0dca276ac4d2 ("selftests: arm64: Add test for the SVE ptrace interface")
> Signed-off-by: Mark Brown <broonie@kernel.org>

Acked-by: Dev Jain <dev.jain@arm.com>

>

