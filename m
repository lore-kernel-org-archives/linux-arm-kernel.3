Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21B1C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 15:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/sMGJAEIqAtnLrtZinEyRORRHW7pkU2ix8f/5Cm7oB4=; b=K8TiLa0PAF5T4z8dZYp7GBkl5o
	hXJBa0ZjbXErQ/pW3a2h4lboGIMLEjxrfH1TFo2Qam6ehF8U/QnQJoQmpxJFAKAIq+MfrvK2vHhtO
	f1hbhIl86zmuAuHdf/UttuNs8V4Pfzm2H6QNjkjmWEifmIE8utXiNhNAWjeJhgm2lM4xbLE8+kPn8
	IRnj2bKF4C2pWyQuTQFtkX216AzbGEn8CzFH9SaaaXs2fFZsjnFriE3HheDOgejlrtRrU1SY0oH5n
	emLfHEG4laktQ2m7WJ8zQTXFuD2mvcdvBb1i1u2Zujmn1YwiAQe44GA6Y2X7DHfz69KNVPeFfl/WC
	QZZH1RTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmpq-0000000CusG-1v2z;
	Fri, 18 Jul 2025 15:17:18 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmnN-0000000Cua2-2HXt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 15:14:47 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Z6+XQYLXcSUbQhgkbt0thQCkSQG1WwtispzOva1HzOBnnPNeCGJ8J4dT09jrCPz10Fflf+smucGXf+rLVokDzm2raNoiGLlAtHVec84L5dUVyms/VKWJ82Kt4BRcbZdv9GYKBl4gyGUmdO4kWFCTNVv7m71kgs5INFOYKrZS9hUDvBTMo2o8wPpLupud1ao5n57cGxMKG0p11m6Tn99Ivsr1mm1EFCwO67DDbYVDEKr4P2eNPgu9a2+K2YhrG7SB1RxK2331FuJuZ7RM7sXRswcdSaIVtWlwRJRGdVrC3HSIHB3RfDThnprzHUdzbxJPKZKV9n7D2CJDE93eZZPFnA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/sMGJAEIqAtnLrtZinEyRORRHW7pkU2ix8f/5Cm7oB4=;
 b=c8M354k6nIgxZPapiuVpN7qtS4K410NCw3HnSCbQ4OkyDjBk2TllFh4q5/S2oxSnkqmFTXDO5VZIOTO5Esm7VmeIrfKo12CNBLgwsPqsaXKxK27l4sZL1tE1Bh38by/u6DlsABESRkEr+YqZzAiDKufuhGNzjr4WzZKoCaRPVg1dvffoY2PiPdjdLsWGeeQWof99UlRVOZrgjROdJMyqPq2N6Qi5dxJjT4Y7FFAj21xK8gPDHaSwfxtOU1LyXwyPuqONGiV/kOyC98JeX9L1qWyjnAdgv43O6XQqvcW2whiV2kETByD9wFKMmk37OAduprbQ23W3PVDFcggvzvfr+Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sMGJAEIqAtnLrtZinEyRORRHW7pkU2ix8f/5Cm7oB4=;
 b=jGXrL1fQLSGMZIS9JyU3KkIytFlI3z+ibl1iIg0HoQF5sByfyR+uN1X7xMNqq+ON4a5UO8gkuZVtTQHQja6LENrIp8fr6WLJ4G3DqF0w3gK6OqCqp9o1BowEpdkFMT7ggL2rs9/Z1quVi1jHFJ6rvaUgo7PvQ5KLO1aRm7HTcH4=
Received: from DU7P195CA0002.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::9) by
 FRZPR08MB11161.eurprd08.prod.outlook.com (2603:10a6:d10:135::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 15:14:26 +0000
Received: from DB5PEPF00014B8F.eurprd02.prod.outlook.com
 (2603:10a6:10:54d:cafe::6) by DU7P195CA0002.outlook.office365.com
 (2603:10a6:10:54d::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Fri,
 18 Jul 2025 15:14:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8F.mail.protection.outlook.com (10.167.8.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.21
 via Frontend Transport; Fri, 18 Jul 2025 15:14:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TnKZMbAAF1imWdxjnYEFanvgtY/hQ60m39/0HkqJzLUCcF7p02/RGsubIqq26M4RXjjxOG3LvVI6JoR9qf5mARAZvQobhkqesek12iSGQjuRejGuMDTxjNMYFPiW1r3sfN2TLSwH/aO6//ynmuEBFnybcrqHBX85XtFAV3TYZ0vfcM6GxbJzJUUvS9gHxvpFZpxiNntxqiy3qMoZqJK/jSbNvzYqChkESP81IlwJ7TUwg+59aBIh9Ull7oAE0nOBVHrv0r/e7uMsLD+5CvS+VreH5n1ztx5dW/rES2Ja8MzsBMGonsNSqrGHw5eNzaMrmwrDBNUhLIwY8duiJv9H9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/sMGJAEIqAtnLrtZinEyRORRHW7pkU2ix8f/5Cm7oB4=;
 b=ylJM5bar1iUzruqn1FtiK/Oq5S3u6O2oM8B9ecYr9gDhgdeYvR5SbWRhOQsuUWKCY3xVd3ERrsR4sLqX8qHpIufMlpjQUSCCKJRL3piwjaZs2bA4QcopIDIRlv4504rtjAYpZEV94kjKU4ueNtptg5Du1lIglHu0Y9Dc0IFor8PDQLLOpJl8hV0A2cIr8aogB1iPLppeLkzBjL5/Prqks+kP+SGwdu7CfX6tY2BsBvfm3xopULIW/Drd7ESClhVTWXqKA4kz0ZtkU3oLzYIqHCgu16bB6/7De2c3atFN8Czq6+KhkEH5uJYnyhUZnuEX6Zs7S1vXkGyzmTQQ9k+Vtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sMGJAEIqAtnLrtZinEyRORRHW7pkU2ix8f/5Cm7oB4=;
 b=jGXrL1fQLSGMZIS9JyU3KkIytFlI3z+ibl1iIg0HoQF5sByfyR+uN1X7xMNqq+ON4a5UO8gkuZVtTQHQja6LENrIp8fr6WLJ4G3DqF0w3gK6OqCqp9o1BowEpdkFMT7ggL2rs9/Z1quVi1jHFJ6rvaUgo7PvQ5KLO1aRm7HTcH4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DBBPR08MB5915.eurprd08.prod.outlook.com (2603:10a6:10:20d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 15:13:53 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%5]) with mapi id 15.20.8943.024; Fri, 18 Jul 2025
 15:13:53 +0000
Message-ID: <e82e69d0-e639-4652-8cd8-b70065cb8140@arm.com>
Date: Fri, 18 Jul 2025 20:43:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/entry: Mask DAIF in cpu_switch_to(),
 call_on_irq_stack()
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>,
 Cristian Prundeanu <cpru@amazon.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>
References: <20250718142814.133329-1-ada.coupriediaz@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250718142814.133329-1-ada.coupriediaz@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0165.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::35) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB7120:EE_|DBBPR08MB5915:EE_|DB5PEPF00014B8F:EE_|FRZPR08MB11161:EE_
X-MS-Office365-Filtering-Correlation-Id: 68cad7f2-7c28-412b-530d-08ddc60dc881
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?S3BPMDNqOExjUHYxVTluaGdEaFVsZFJiUllVSEhFSks3OG9TWlFYYmVPUmR3?=
 =?utf-8?B?aDA1N3NWTElwM0xRekU1eEJyRG1mMzdabFEyWHlPVVdhRDc5cCswdkZSMHh2?=
 =?utf-8?B?UVBjNnc2bUszL3MyQlJ3Y3lpbmZGUjV6YzJnODZPdDl2cVVnaE1RUEVia1Yw?=
 =?utf-8?B?SjBxekV5ek0rTTRSdzYxRmsvUk1LaGpIMjA5Q2N1RVZhTmIrTTcvWERERXd2?=
 =?utf-8?B?d1RWa1Y4OUdwWENuZ3lzRDhlNlFsdWovM2pIWHEya1hvSVprWjY2ZFEyZEwv?=
 =?utf-8?B?K2hTWFpMNWNjVno3VUxSTDBzdEJXUXdrVDJtdC92Rjh2Yll5c2lmY2Q5WUJX?=
 =?utf-8?B?eEszZGRZTVhOeWN6dHRhWU9FYnByMFZqdnVaR1JmWEUxc3VWNHpCK3VqbTFI?=
 =?utf-8?B?RW9nZit5RTVoeUVqcmZVYmxNSmxDZVdCenE4cU9WOU9JM054WlNnNWhwa0tG?=
 =?utf-8?B?aDlObldUR0piWkxkOXN0TnVqSTFZS0ZpVFU4YWxpa1NhNy9NdUduQ0VXVVZ0?=
 =?utf-8?B?MWFBbzZDMG54WTBrNXFpMXVnTlJxZWh3Vkt4QkJFSzFabnRHV0xoaVVzSXVJ?=
 =?utf-8?B?cnp1eUoyZmZWTUxUbXJXZUI2YmkwbzZ3OU9mTk9jZjBKMGRFYUdsamxEbDFj?=
 =?utf-8?B?ZGl3cFB6bk4waFljMnpMWmlPMS91Wlg4UXhSMTlLdG1NaThkelc2UG5kYUFl?=
 =?utf-8?B?WW5PVVF2RlBtZXozM2kxdFVFUnF5R054d3cyRFF0SHlhZDY0dk93WFZqVk9v?=
 =?utf-8?B?UVdhL1k5RTE2WFNsdTM3and5anEvT24rQzRSR2xkQm9IdnJIY1VaVk5acjBh?=
 =?utf-8?B?NWF4d1NpTkhlYnNYUklGQ3pNUU1tTk9Hd29pczNTNFVyTFJIY3Rhd0hFM3Yr?=
 =?utf-8?B?WXhvek43R3BXSjJJQnM3UklCTHFZbWdsbk9ZWlFlZWxZdW0ydG80bi9QeFhT?=
 =?utf-8?B?dHdoZjlMWkFjWVNwRExoV0R3UlpacjI1R0owYWN6RlRaQVF1eHpoSnd5Vjc3?=
 =?utf-8?B?eXRkSHhlTDZiMnZoc21qcU1uamJxc25OQkEvSDkvTTBvalhsN2svd2NqdjQy?=
 =?utf-8?B?ZGxmWDhOUm5rQVFBMkVEOFJVbEUvc2FKR2pwRzlvSDNsWkFGa2hkdG0zN0hw?=
 =?utf-8?B?SlFSd3Z6bHcwT3lHeDdMd2dQYnprQVptbHNFSXBqOEw2KzBCVmtYR1RJNkRu?=
 =?utf-8?B?SEthcVJJUGlRY2FiUFB2WDIyNWRWMVlDZGtoK0lrMXV0UVkyYkx2dzFpeVo1?=
 =?utf-8?B?UHZKK0R0YmZEVWFDcS9JeWFGaXl2dnkxM3B0M2s0MFZEMW5weGJXRDJkMENn?=
 =?utf-8?B?Q2xOTXNub1prbW84QlFrMVlXTUlNdmMvTFVoR1FUdDVqMFJodUxadG9nUzlh?=
 =?utf-8?B?SWhYcmFGTzduRFY4eGRhUWJZOHUxNHNKNnBtTkhvTnBNUW5wYldBRnNqQnQx?=
 =?utf-8?B?ZWtDcnBIVEYzUnBqU3ZmSGVScG1ibEJkSGRiTkdhWXJ6aDV3aVJReWNTVGRy?=
 =?utf-8?B?WXVUM01ham5teEVySEVjVG1QNUVDdk5HRFhGTUJ5bUlJaUtYTUJQZVF6d2F2?=
 =?utf-8?B?YzQ0TUJjWmRReUhTcnFTaWJZdmNrU2dHN2VHS29oQXRsbGtROTBMdmVHMDFG?=
 =?utf-8?B?a2pKc0tSeXhudXoybERmcythWGVJQmYxTDZvdlJUQ3loOVl3VHRreExrK0hK?=
 =?utf-8?B?cndNUFNQTHNKeU1RREtVWjhXVXZtM1BPQWFEY0pMdnUxWDMwcWtTV01XUWs3?=
 =?utf-8?B?ZTBGVWh4K1hEaS92dGpTN0RUdUU2MHVBY1Y2T2Q2akowb0JmeTd0aWZBRUg1?=
 =?utf-8?B?c2hkZTRFN1VVMi9vSGJoWmFKcHZoVGdIVkl3aHF2bkJMZDRjUFFkWi85aExs?=
 =?utf-8?B?VEVBNEI0V084VjlDMnZ4OXFrRVViTisvOTFPQSszeXZNNUc0QU01OUFhNjln?=
 =?utf-8?Q?ZHsMVPtXqp0=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5915
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 17c82995-66c7-4fac-6eeb-08ddc60db4ec
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|1800799024|35042699022|14060799003|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUV2bW1QWWdFb0pSdzd0U2RYNGM0TzdBdkErYUNEMDR2QkUwZ0QzYVVFV24v?=
 =?utf-8?B?d2dObW9ENyt3NUNXZHc0SHNKbTJFNzdwVHJqbUFXeDVaK1hSRUZSTzNZenZ3?=
 =?utf-8?B?NmJYem9QekgvajZIUCtSN2Y0aFMvSUF4WjNaZms4aUlTUlVEREVhZHpmQTFS?=
 =?utf-8?B?dEh3ZG4vYzlxYkFPNDZNcHNwMVVFL0JWckFEYUIyZmRBa0N3ZEZYVlBYWDRS?=
 =?utf-8?B?TWtBRUQvQ1pSbmpYWmsvZTlUVHlyd2FMc1o3bW1xOVYwSm0vbHVTWG9COFhq?=
 =?utf-8?B?ZzBiY2pKK1hoQ1BoSnpoQUtRRkZMd0xOU3J1TUVCU3ZDYlo3cTBmRmkyNm50?=
 =?utf-8?B?SFVhK0FieXpBQng0VFB4Q1FXaFJBaVlVN3NiZHhKRk9zVXd5ZE4ybVFkZWNv?=
 =?utf-8?B?WTMweUNHK2hyUysrSDQydDNHQnI0MnZLNFE4VFRYSGxpQzlVQmhGVDNtVzQr?=
 =?utf-8?B?SGZKTjYzVE9nVWovcjUydUMvWXkxMWFTVVZyNmZSQjhxY1dRY1B0ckl3WGNo?=
 =?utf-8?B?RTZneGU5cjVFVE5EMU9jY3FDNEw3M3RTNXBUZVpOakJmMVgyb0J3cHU3dTlW?=
 =?utf-8?B?K3JLcWFtZ1dSSzJTZnFSVXBPSnNiSkJsbkg0R0hoUE50QnJhMHNyekI0TDdq?=
 =?utf-8?B?L29oTnJDaExGRi9BT0NIR3A4L3cyYmFCd2lBa01Wd0Z4WlZXVHdET1JYY1c5?=
 =?utf-8?B?NkRmYU16ampraVFQSm9jTXM0RThZWTliQnBKNnZhTFg5dTRVc0JMNXh3RzJX?=
 =?utf-8?B?bmZjVFRoUnBRb0pMc1RnRGNoay9YL3FPRmE5cHZ2NGlNWFJ5VmNCQko1VGVH?=
 =?utf-8?B?dmd4dGk3L3FBZXkwSmRzT1FnY1FQUkpOSy9pZEpuSWo4UDNEemRmcXBXemJ4?=
 =?utf-8?B?QlByRHhwbWMzN2NGbXV0eTNxMktmS2RSZGEra0FHaTBDTzR1V3YvSjNuWk1Z?=
 =?utf-8?B?dTZVVm1waDZzWjl6WUgycHMzbmdJSUc5djUvZU1ocnIrc2g3TjJnZk9PbDk5?=
 =?utf-8?B?VktUSzFDM0laRUhOdEQyb3haWklOZU1uMkRndWVQLzdrdUR1Qkt2UnYraS9r?=
 =?utf-8?B?UDdFbVp0R05PT0VpZFNQcVRweUZVaWZnbHJCdXMrbGNPbnQ0UE9HbS9WZ3lX?=
 =?utf-8?B?UnJidEVyT2VSOW1ESElrM1JwOG9QQnNmZmhKSVZNbFB4TE9UU1VmUjk5SkNI?=
 =?utf-8?B?N3Jmemh2aTcxWTZMQUxsdjNDamxCV2lvbkhtOHZsbWlZcnpZV0FkQkpzQnVW?=
 =?utf-8?B?MklOQUlkOGJCK1oyc21TVFg3dDJ0STY5bHV5ZUM5NlVJdVFjUVRWWEtpOEdw?=
 =?utf-8?B?dEJGcGM0TWtSM0hKbWZLTnM3R0p4aUxUNjU4TDhUS0VFZUNCN3IySXdMQWRU?=
 =?utf-8?B?OHhhaW8wbzNUK1I4b1hqUTl3ZW02MjczQXZmZ09qb1pLUWt4UGxJTzVZYnU5?=
 =?utf-8?B?ei95cDBWNkpoS2tNODh3Q3EvQk1wNFlNSi9aTmpTKy9GTkN3bGlQUGU5MGNq?=
 =?utf-8?B?SVRmcmgvcUNVT0dJVk1QejVtTndmbmFNRWNaY2pEVXJhV24xZjVmeXJxeFpo?=
 =?utf-8?B?d3YyaVpNaWRHVks0SmtncjJYMjZzdVVKalo1bUJ3U1BBMnhRRWNHK2kyZHNo?=
 =?utf-8?B?MjRuSUZwTlZRZ2dSK0Q1bkJLSW1VODcvSnVDS1NkMFBSajlLMlloQi9nZHln?=
 =?utf-8?B?bkoxZ1VPTXBvM2k4YzlFZkVieW44UkFBdjJuMnJjaUxtZDZHaUZtMGwzK0ZD?=
 =?utf-8?B?RStGd1dnM2xNTG80VTZRYWw3akVKeENCTkhBV3piVDdvaGpzMTZsbHducDhI?=
 =?utf-8?B?QlpmRlVQWWRsNG1ZdGxKbjFOcFpQcnc1RUp4RGVvcjlGd0c2TUZPWXRnTlcr?=
 =?utf-8?B?VFlnalpjOWM0eUJ6dFhjaUREcThkdFp4dGw5TkJGZlhGc3FIb25zNC9ib1pk?=
 =?utf-8?B?aXZxL1ptQm16Z1Nma05lMVg2c0xEdnFZMVIyMkJ4S1l2YlZpTkR1bnJhWjhi?=
 =?utf-8?B?NXdxWG1QUFUycWJiRlVuY2dOSS9wcTQxU05jYUV6Z3BTUDBjNEdUZ1d0NCtj?=
 =?utf-8?Q?ikxN5U?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(35042699022)(14060799003)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 15:14:25.6302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68cad7f2-7c28-412b-530d-08ddc60dc881
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB11161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_081445_797461_5A12427E 
X-CRM114-Status: GOOD (  18.06  )
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


On 18/07/25 7:58 pm, Ada Couprie Diaz wrote:
> `cpu_switch_to()` and `call_on_irq_stack()` manipulate SP to change
> to different stacks along with the Shadow Call Stack if it is enabled.
> Those two stack changes cannot be done atomically and both functions
> can be interrupted by SErrors or Debug Exceptions which, though unlikely,
> is very much broken : if interrupted, we can end up with mismatched stacks
> and Shadow Call Stack leading to clobbered stacks.
>
> In `cpu_switch_to()`, it can happen when SP_EL0 points to the new task,
> but x18 stills points to the old task's SCS. When the interrupt handler
> tries to save the task's SCS pointer, it will save the old task
> SCS pointer (x18) into the new task struct (pointed to by SP_EL0),
> clobbering it.
>
> In `call_on_irq_stack()`, it can happen when switching from the task stack
> to the IRQ stack and when switching back. In both cases, we can be
> interrupted when the SCS pointer points to the IRQ SCS, but SP points to
> the task stack. The nested interrupt handler pushes its return addresses
> on the IRQ SCS. It then detects that SP points to the task stack,
> calls `call_on_irq_stack()` and clobbers the task SCS pointer with
> the IRQ SCS pointer, which it will also use !
>
> This leads to tasks returning to addresses on the wrong SCS,
> or even on the IRQ SCS, triggering kernel panics via CONFIG_VMAP_STACK
> or FPAC if enabled.
>
> This is possible on a default config, but unlikely.
> However, when enabling CONFIG_ARM64_PSEUDO_NMI, DAIF is unmasked and
> instead the GIC is responsible for filtering what interrupts the CPU
> should receive based on priority.
> Given the goal of emulating NMIs, pseudo-NMIs can be received by the CPU
> even in `cpu_switch_to()` and `call_on_irq_stack()`, possibly *very*
> frequently depending on the system configuration and workload, leading
> to unpredictable kernel panics.
>
> Completely mask DAIF in `cpu_switch_to()` and restore it when returning.
> Do the same in `call_on_irq_stack()`, but restore and mask around
> the branch.
> Mask DAIF even if CONFIG_SHADOW_CALL_STACK is not enabled for consistency
> of behaviour between all configurations.
>
> Introduce and use an assembly macro for saving and masking DAIF,
> as the existing one saves but only masks IF.
>
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Reported-by: Cristian Prundeanu <cpru@amazon.com>
> Fixes: 59b37fe52f49955791a460752c37145f1afdcad1 ("arm64: Stash shadow stack pointer in the task struct on interrupt")
> ---

Nit: We only write a prefix of length 12 for the fixes commit.


