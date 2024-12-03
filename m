Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B288BD49797
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 09:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cvScFPNML5wuLkrGtThqNzGeBz1cPT7Mu/sRK8Q3O+g=; b=oq2iNuw0DLYJsoOl/cQVfjNwcv
	4xPj1c0H/Cfmrvr6wsZtDejEETDr4S6zFbH84r52p5uKnVorK26FGcdalHgOLe2LQh5/VITdZjsAh
	dopn63Thm1vpHWn95n+LhO3Qd7IK8AYjTPzXT+kCVvVXa+9AUV4JlqgMIud70bMKnufQJdkbH5eYy
	OCED+KMadFlsqcVGYDJHQsN5ejep4q51DPG8P+3htypWfGbVtHbzOO+0J4Rg3nwZXoZaSdzCGB3KL
	SZZWwXqdZtnMFnQ46zns1YLkI0mgtwSb7DGD17xrSguZBz86+GnCr9zq5HKuypVnK/sZgaBdRgCk3
	OAzbOkag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPJd-00000008uLF-119X;
	Tue, 03 Dec 2024 09:35:33 +0000
Received: from mail-vi1eur05on20701.outbound.protection.outlook.com ([2a01:111:f403:2613::701] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPHc-00000008tco-2wrb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 09:33:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VZGdp3/GrFRncxn4TUNBJSRDEo2gwM5P7jYha9mq82a+Vzujun6S8wTHleUY7JRZzaPwJMVtKyi1iy+F2w0gMGZR+z2fJ8xReC3nGLxPhzZbjOZeyftKEfEDTYegzRBJ8JiAo5QHfY5G4x1yKWy15APBgnmoDrNjJojumPV8x+fePFNLRwxLavowfV5q7uNQeUcJFoMP+42n8K8L3M2pObjKzg4WwyQGwLymTAS/6qL3GRfr+a/L2mf+X/Oq0LZoD+sp4r80J2iW/UDY4ZVzCVA5n3cscvJZJHq+vTd4yXqg/wKIQJIdgFT3lzClbXIiKFKLbXdGP84WXebD+MEtdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvScFPNML5wuLkrGtThqNzGeBz1cPT7Mu/sRK8Q3O+g=;
 b=g7cy5c6EA/LQJ8ZO4ta4QxAeH8MJja7l7bstr/S+ChM1c6AYLuFm0WMlq0cydHDMwUHQwyUZLtpIxMcIO7iacEsjunZa1YFfajbQAX+KGr5Ss+wfGaKRQRAohITs4sN+kQuA8wGS9jt49UIS5QaaUQALYp6nDnuqY8GCCc3yKa2j8uJLYKCo/6uMy1qfixOZIwcB56y1ar2MFXryl26/VoGLsF/TeBtyf8aqMTYZjKEat2zrwnTtObpsDMdNa6+xEOR+B4ip0rDmsyJMQ5f7KISmTlnCTGM+jKx6U66TTgOUsCKEuLUhvvUmIyuRmb3LkA9ZYwQZNfPTEprD4gG7sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=uclouvain.be; dmarc=pass action=none header.from=uclouvain.be;
 dkim=pass header.d=uclouvain.be; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uclouvain.be;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cvScFPNML5wuLkrGtThqNzGeBz1cPT7Mu/sRK8Q3O+g=;
 b=jxqvzoQTOtl9GGD1ol1a3mrTVeEUrber87LjIbgj8xWGV+6UYXvPv/CbxAl1z50GpvFXzbg3Zzkan28mNhZnD/f9TZMCHYdrsbpl2xOgfKvGXC34+Dz8m3yLai+HyqAGLaiCKslT55SPAsHz5dSK7A8sNDAPkBS+Kb2W8tBWxc/3QvcoXhcGYYtlM+WmH4GFOBjf1IkjLFptXa8upbZ4JNK23rBjuougEg4+zlosGfuxOXiW6iYd1XjUevyFNlDAHncZTilb9OBP8zrqsd1HyNgEdP6hMH3lMjM7jr/U0YBIJSG2l/fnaBFLJzqSXRYQhQbMnNCM8HNzokau9JVyxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=uclouvain.be;
Received: from AS8PR03MB9047.eurprd03.prod.outlook.com (2603:10a6:20b:5b6::13)
 by GV1PR03MB10894.eurprd03.prod.outlook.com (2603:10a6:150:202::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 09:33:24 +0000
Received: from AS8PR03MB9047.eurprd03.prod.outlook.com
 ([fe80::c90e:deef:6dcf:538c]) by AS8PR03MB9047.eurprd03.prod.outlook.com
 ([fe80::c90e:deef:6dcf:538c%6]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 09:33:24 +0000
Message-ID: <20588923-a660-49fe-8efb-766bee22f215@uclouvain.be>
Date: Tue, 3 Dec 2024 10:32:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: power: supply: add max77759-fg flavor
 and don't require nvme address
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20241202-b4-gs101_max77759_fg-v1-0-98d2fa7bfe30@uclouvain.be>
 <20241202-b4-gs101_max77759_fg-v1-2-98d2fa7bfe30@uclouvain.be>
 <fe254a002000f2bbfbe51d074cf28f7427a27f9a.camel@linaro.org>
Content-Language: en-US
From: Thomas Antoine <t.antoine@uclouvain.be>
In-Reply-To: <fe254a002000f2bbfbe51d074cf28f7427a27f9a.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR1P264CA0103.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cf::10) To AS8PR03MB9047.eurprd03.prod.outlook.com
 (2603:10a6:20b:5b6::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9047:EE_|GV1PR03MB10894:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fab7347-6674-480b-b826-08dd137d88d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VHdHcGIxNmI2OHAxTWpIOUd6OVR3Q21pZHJWM3hMdFRMVHU0ZzZ2OEtzSEZM?=
 =?utf-8?B?RHlnZjJpczV3NVVOR1NHYk93SWp2NWZTaDFVZ0ZwZzZLbElBenFyc3BqY2t2?=
 =?utf-8?B?eUxXNm5sa0JUamJHZFliL0ppNUNLeXFtekgwSzVCTC9TZEtKRjN1S1VmQ1BL?=
 =?utf-8?B?ZS9KZU1GaDVUYUNuUWJtUEcrWVU2bExRVVMvT0szazlCU2VQblRhcW9keTM2?=
 =?utf-8?B?anhCK0V5SjFMcEt0K29yYURsZzRTRWs2d0tMdUZSQ0hDakQ4UHJiVDRHNzBm?=
 =?utf-8?B?bEYwTGJCbFBHRzRmZkpRby9nYXRMRXE4ODBPV3Z2M2RWNjhEQWN2TGRaRUlR?=
 =?utf-8?B?M0FvMGZtaEpOc2lkRFpnVGJmV3ozMHRzZFRGTy9wZndCaDBDT28yUmpMRUl1?=
 =?utf-8?B?Z0dvQkhldmJTZUZ1VTluZ1Z2Q2w4Ylo2Vm5vNGNtdFVGTWRoZlQ2TjBxUGxO?=
 =?utf-8?B?a3VRT3dTc1cweG9VT1lTWXovb2ZidTI0YlFMdGswODUydFE0ZFNCYU04b2E1?=
 =?utf-8?B?S3FXZmMvNTZsUFByMUkzUVZEQTdGQ0o5TGZ5d2FRUGR3cTJXZ0k0aG1GYUxJ?=
 =?utf-8?B?VTZMY3ozazBzL1hKUTFGZW5DQWJRa0NtVFVSaDQ4ck02ZElGMjNQd1d2amNz?=
 =?utf-8?B?dElYNVhuY09LZWpibUYxMGRaci9xdE0vcWVISkxBWW5YMlNCU2VCRmszaEt2?=
 =?utf-8?B?NEw2c0dQQlJUNFFvOG54WlJnZmE3dWZLdG1jOWwzdWgxWlBFWnMwZVoxOC9T?=
 =?utf-8?B?V3hMdWI1SytnSk9SRm9mVU1vUjhadXhlTFc2L0N0MUVTSXhuV2lWeWpBSmFs?=
 =?utf-8?B?d2gvdTExWlBQRkxkaVlZdFIvS2NRTzJlMXdwSmhkNmhqQjhrSFBhQ05LRDFz?=
 =?utf-8?B?MjVwRndTbGJsbVBuTEpKVElYY2h5K0RTbFRHZjlmbWpZUUNYZDU3S3pyemY5?=
 =?utf-8?B?MzBwV2gvOElyZ2FuUkFUNS94NGQ5VGV1UTJ5ZW1WM3pFa0Nkd3FFYndSaFR5?=
 =?utf-8?B?c2FiN2NsdWtsazJOZnpGd0pkbTVhdWNYWGxMYnJFNHY1Y3k1TmRCK2RMWEpX?=
 =?utf-8?B?RG5LazJPZ2xYNktlQ20xR0dpS2tWWHFxU1JXL1VqZ0gzZmtmYldlalJWQ3ln?=
 =?utf-8?B?UnM2MUkwaTdPZUpvYkxXL1Fja2s3TSsxamVKOGpKUW1nZkg1U0grYzhwK1lN?=
 =?utf-8?B?UWRHMlVPKzF1aVBUQTNUV3gwVDg3L0o5VFMrc3FBS2x6RnV2S0RQUGcxSjgx?=
 =?utf-8?B?YVE3NTFUNTNjMU9samZQZ3JCVEZ2bmFGd2lqRmZJaERUNFVpa1IveVFEc1ln?=
 =?utf-8?B?QkVyNE45WkhzRFlXNnlRZ2FtSzBZeG1ORDdscERyaEYyUU5IcEZPbEU2R2l6?=
 =?utf-8?B?UXJuaWRmTkV1U3kyK05mSjNmYmJ6K3NzdVNFL2lYRU5YK29mdWxXTExsRng2?=
 =?utf-8?B?RTdBc3ZUYk81M0dFRkc3aFpXWHR5dWd3aVk1bm9QYUw0d2VuNGR5MnJxSlBJ?=
 =?utf-8?B?dW9GNGhOK2hCVnFoR09qc3BRQURDeE9FVFBHekY0NVdYM2hqd3hvSkJjVTl4?=
 =?utf-8?B?bFJST2h1T3hZN3V3RmFKZ01VdUMwMmFsMENMZWgyNkhjT2xpaXNWSmk2UWNl?=
 =?utf-8?B?UzRYaWJQSm80WW12czRkbGFtK2tZT3FabVRjRGxEd25pKzNsNnhaNVRIRW05?=
 =?utf-8?B?TlBHQjlxSXFPaERvSUhHNXQwUVJSSVgxUGlpMGhtdlNFTjkyaE9PaXR6djN3?=
 =?utf-8?B?WVM1K2N1aWtvQVZ5QUVCbFlPL3VQMEgxeHZtTXJ0VTJDRFl2NGJ6UEhvR2xQ?=
 =?utf-8?B?Rzd3VjNYYWkzMkRnSjZ6TUNSQ0hiQlBQNGJZMnUySGUxUHBFcW8yOUhrb2JQ?=
 =?utf-8?Q?eDJTZPahBE9Rs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9047.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tm8wM29ma3lKb1ZTUUMxcHluckdYbm42MU9YcFp1WW4xNGt4SFVhaEVvcUpi?=
 =?utf-8?B?K1VnaFlsWWo3L3VIZEJzaHhjcjhjcXVvblExeHczQVkwNkQzWndOREpmc21I?=
 =?utf-8?B?L0NQYUMrTDlVS1RtL0RHV1QrMWJwRWR3K3l3MEZLQ0FPWlJEYXVZVzBIdUpi?=
 =?utf-8?B?d21BNDliRnN5eFgzZUlvdFp0ZW5QdC90Y1VJeWJzUllha0Q2dVgxWllpSmcy?=
 =?utf-8?B?WDNnSG1XT0tlZnpQbWtJVE1kVXhaOTdGcWRQSW5PRmtWK0hOdGh3Nmlud2dn?=
 =?utf-8?B?S1lXaUlyZmtnN2ZlQ20vTlVUbTk3RmlhWFJGOFYrd05oNGlsTGJiRDlqaUpF?=
 =?utf-8?B?blhrSGFJc3JxL0V6SXJUWWlVMW1XazlTNENESkhTNCtyZ3dPODd4L2lndGs4?=
 =?utf-8?B?ZXJGK3ZCdEVtZ09MMjJ5QTZxM3RRRnM1aDd0MHhWYUpVckJ3Q1EybWx1NVNC?=
 =?utf-8?B?NFBnWHlTU21CdC9XSnVSdmRtTEhObi9DTkxkZmx2L0x1bjd1Q2dNaUFMblNO?=
 =?utf-8?B?YjdZT0xKT09qUHUxL2Fxc2Ezc01taFVxbnhmQmMrYU5oZXhwT3ErRk53cWZh?=
 =?utf-8?B?MjJIaG0vOGVGMGVUY1FSenZqUitRVnBwWEl5WnhXVEI1ekx0d2NtZG80c1dM?=
 =?utf-8?B?dkRaNDFzWTgrS2hlZ1BCY3RRWG81OGFoMWFrdDdDNTQ3MHFWbjZubEFsL0hD?=
 =?utf-8?B?ZGZzbmZVd2hzU1JjSHhYNTN4dWM5eW11WW1EWjRpRys4QjJ0anNuaFVhVVFY?=
 =?utf-8?B?aFMxdUNKT2NQc2dDR3dta1NDUlVHZ1VDTEF3aHhsQzQ5YjlYNjNhck03WUR3?=
 =?utf-8?B?UDBIN1pQV0FUVEZsT2tMcU5vekVrK1VaWThJYjdiTjEyTWkyNm1YSUxNNmhW?=
 =?utf-8?B?RWNaQ2xQdVdlSzVsYmRSamVrTms5STRPZm5EN3ZMR2hoTmY5VUROMXhJWGZl?=
 =?utf-8?B?S3JGK25rVWtDNDZYQy8yNG9mYUhIdHRQNXhKYUk0b3g5SEVqRHFOOWZnY3Y5?=
 =?utf-8?B?Y0NHejZjMUNHUXl1bXh0dS9qVEU5VFd5dGkrQ3Y0U2JHNWRDQkdSY2RKWDcr?=
 =?utf-8?B?Rmg2dnNpYWROaHlRZHowYU4vT3lmeE5qZDhuNnVuSXd4aXFFSWhYR21MRWEy?=
 =?utf-8?B?aTIybXJiT1hzZG1aTGhxTlhVQi9ZS1M0M01OWTlad0hib29WcExCYkY1T3E2?=
 =?utf-8?B?dHdSVFZTWUNJcytBVUE0VENkVmNzSXpOYmk3QWdENUt2TVpidTBBQ0RML3Jh?=
 =?utf-8?B?VzJjV3RsMXl1dGNCS3lKVlRWR0JtaFhzTG1UOFV6SURMM3V4UkdEb1RVQkdx?=
 =?utf-8?B?d0QxenRiaVBHZ3EwTnpvRjQ2V1ZjeWhkNWpDeXRwZ1lsaXJOWWUvMlY2R1Qy?=
 =?utf-8?B?SGlXcm5RM2I1T2Noc1U0RjBqY1gxS0dvaFpUeHZnbGRsTy80S3lsZjlFbzRY?=
 =?utf-8?B?SWJDRlhUN09GVlgzdEVOY252VFI3Y3hnWTUxNEJNVnNJbnhCdmVkQ1NMZmdM?=
 =?utf-8?B?bHZkS3ZyVlpta1lKV1o0L0crS0pXbEVXQndybXRPdjRtbXFtdEVycFR6clV6?=
 =?utf-8?B?dlJxWER5R0RtMnM1UkdTWE5LY2twdE1XR1o1L2RLRUlBVkxuZ1VUK2RPWWhO?=
 =?utf-8?B?RTE3ZXNvQTBqMnpHVzhZY1RibkdJazhMaEVEaXlPZGVXb2ZMZWVnSzg2VGVk?=
 =?utf-8?B?L1FGVFF1a2ZtWEFhTUN2NFVZcHJ6NjhaSUI0b1hNZXlHOHNUYWx0SnppRG1u?=
 =?utf-8?B?MXRZdUFnYTNwU2lscHQvY2hPYnJMMHpGTFgxck4xdnJFdlkzMDBLQTlzN2ZF?=
 =?utf-8?B?a1NlRkw2VDM3YmVWY04vTnlDYXh3UGg5RjE4R21Fd3lnK2VuYUMvM0ZxcFg4?=
 =?utf-8?B?TXV6WHV2ZEs2Ylc3ampZTFZuQWxuSTJSaGVFUHFQdmtNVFRqNEduaDdiZ043?=
 =?utf-8?B?SlhsWU9pdmdEYkxQcE9IMUEzMXprcHhDa21RYVViSWpYU1U1cmp6VVM2TjZV?=
 =?utf-8?B?RVRnUFBPQnhPbEdsNWRzd0REUVB3TlF1RllWeEVzWWZQanBVaUMxdEhTRjdL?=
 =?utf-8?B?cU5CbWFhOHFKQUhUSVVQT0dkcnFyRjhVS1U3MTY2NGw1OHRsRU1udGlUZkJ3?=
 =?utf-8?B?azZJdUxwMmQ0YWFzZzRUZDFZTmRMZjdSQ1J4bVNab0tQaldkYy9hRXlYcWdl?=
 =?utf-8?Q?53pSjAQl94LDsHCRiJlnMdkHKzH8mqovjkFg+H7Rxhze?=
X-OriginatorOrg: uclouvain.be
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fab7347-6674-480b-b826-08dd137d88d4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9047.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 09:33:24.5956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ab090d4-fa2e-4ecf-bc7c-4127b4d582ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mNB/NZ4g/Nx/N5NbtarylLMHp5mHmRorYI5AHwGgbuAtjuvPB00nx4JqN4814ZsSoYdzGx/A07UALF1bp74oBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10894
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_013328_740431_BFD91DF0 
X-CRM114-Status: GOOD (  14.39  )
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

On 12/3/24 07:57, André Draszik wrote:
> On Mon, 2024-12-02 at 14:07 +0100, Thomas Antoine via B4 Relay wrote:
>> From: Thomas Antoine <t.antoine@uclouvain.be>
>>
>> As the Maxim max77759 fuel gauge has no non-volatile memory slave address,
>> make it non-obligatory. Except for this, the max77759 seems to behave the
>> same as the max1720x.
> 
> It also needs an interrupt line, and the previously mentioned shunt-
> resistor-micro-ohms, and probably a power supply.

I will try to add the interrupt line for v2. About the power supply, I
didn't see anything about it in the devicetree from Google. Even it
there is one, I guess it would be a single power supply for the whole
max77759, not just the fuel gauge. Wouldn't it be more logical to have an
mfd which activates the supply when other functions of the max77759 have
been implemented?

Best regards,
Thomas

