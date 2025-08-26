Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E9D7CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 18:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=klvRA3jpKkeG4QBvDHfwgLsAyrGyro3H/ZhzCDvP2E8=; b=RiYoBBQMw4mFcRGTPYPbhyqd1X
	2mgVX5mFEM1RMfnJpiMjEIENpIVqHL3pjygMZdm5onjQAJ7Dm7fTImAVOOwhd5fws2fSEvEWS+koP
	839Z7adUHQwdPxV4iwVFJpaMcX5zYhxkI11/GcVe+NrdVoHQEIEQYKEpG7eZWwySKpfliP9oGDgJL
	rRMONA9kdaevnUA7D9cp/x6HlRToqTiAhI1xQ7+keJ4nYqr7ekYUWUJWUAHVZw4KEIDaGTJTCr9bM
	cTJ7eS/cbDSiBe3SN85Xn5pBkg6J7BWocSYr7Q0JPGhAJ5v2HnUzS8vtNYjnSL/BbHay3RUovXsKH
	HjEWi4hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqyYk-0000000Ct47-0VwO;
	Tue, 26 Aug 2025 18:38:18 +0000
Received: from mail-bn8nam04on2071f.outbound.protection.outlook.com ([2a01:111:f403:2408::71f] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqxOJ-0000000Cl5r-41VR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 17:23:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UrTnoVXQiKqXeopkvPlmkR9DJjo5OmABZtfcV0qLDWUExV5MIP6CUkOWXVpHeyGNdr3CTDy8fx02n7Ip8uPL4eDWcK8Xx1P86oKvul2I2ezCI0A5Keg+amA+djWgeMHQkRLcKr9ZtHsroRAplBNp0ugymjbpILHhjGgr0WCHAYGWwJuGyIxpJ1BnUhHzoAsVM++PHZxyw0FBKGfAiatZAEWDb1EJQ0J6s8+GpwgGle9yW5pM5v/v0ETXJQ4bpN3TfePh7/iRplshtUBqE3I81P1MwkT/hTSSFRHICY3zYLiOkSvukQWhRHvSoENuepqiHuAi55VU93fA2Wc5ImQDfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=klvRA3jpKkeG4QBvDHfwgLsAyrGyro3H/ZhzCDvP2E8=;
 b=eOABbnrOZr3PTd7/p5gBWp95OtpQjkFBA8VLZ5oKuDJXigx81cFDVoHnDKBt5VErGCL7QPZkitaxZB3FmC4KgMLQSPjdu7XWgwzFI1LWEg+fbMPX4FmLrcT6617SwhbKTh6Ro50AT/rYifk6JIdG2n6Hk26LSCm24gwq79dkiXQGxqNlT9KbHpr23kzMqH66HkoL6GCZE6Ljws41ofTcQ2W7c0NrnB7/GKL5B04+XFCiQWgvooACugxX3V7bnbBgj1oNHF/R9xNJBgjSMMKr0/7XSXRrtYj36HOu448iTp8ysGyC4WtmAUPyWBlGDpUyokaRN45M7RbxEm4ofShQiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=klvRA3jpKkeG4QBvDHfwgLsAyrGyro3H/ZhzCDvP2E8=;
 b=ITUZk1HQXtA/CzAnGMbEgdjLy8wJ03tKJmZKvu2NB0l4mAj9fPMu8nnjWkHjbqdPVNrxqlwZbWqlHdFblBl8Z1vcfBohhO6goXK2U/mPeFTtwoVwppLwgNvxfJhTB3iQ5KilO/3+yVNzBGEenc0nKHYK1NQ5UTbKvIdzdXjK7udQwxcYnWDCgXUFrLutBEu8BvImP9K5u0AtvsfmBmmJNn2gVXlg0kujZiupik3xi15SJiA2vA6SmalHfgEdJd5C2fujGtECdACNTXpgqdxVSrd/LIO8NTCxdqBPOv+aFIP625HjVU64mSAuSl1/b/vxheyzmqY604J+ZI6oqdpYMQ==
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 (2603:10b6:20f:fc04::c3d) by LV8PR18MB6004.namprd18.prod.outlook.com
 (2603:10b6:408:232::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 17:23:24 +0000
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::fc1b:1122:169a:5b79]) by IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::fc1b:1122:169a:5b79%5]) with mapi id 15.20.9052.014; Tue, 26 Aug 2025
 17:23:23 +0000
From: Harshit Shah <hshah@axiado.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] serial: xilinx_uartps: read reg size from DTS
Thread-Topic: [PATCH] serial: xilinx_uartps: read reg size from DTS
Thread-Index: AQHcE5a/WWP54GZT0UWNAyx28TCQZLRvyVcAgAVrrYA=
Date: Tue, 26 Aug 2025 17:23:23 +0000
Message-ID: <da6c65a2-fe42-4b23-8686-4eb3e73e7050@axiado.com>
References: <20250822-xilinx-uartps-reg-size-v1-1-78a5c63cb6df@axiado.com>
 <2025082322-speech-blaming-b075@gregkh>
In-Reply-To: <2025082322-speech-blaming-b075@gregkh>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PPFBEC4B1F8E:EE_|LV8PR18MB6004:EE_
x-ms-office365-filtering-correlation-id: 865c9da4-1533-494a-99c5-08dde4c542cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?K3NqZHYwbEFIZFRYQ3VwOUZaeldBRW1Fc1VZVStnV2NleS9WRjZObmo3dzV5?=
 =?utf-8?B?TWlUMkFKdXdkdm9KVjE2SFhlRzM3T0xENk1xeDVrMlJmbUZKMFB2R2YyRlNK?=
 =?utf-8?B?ZU5hWW1tZEQrY2lyYXF4WlZwUzNYODVrSDhJWk9XcE05YUNSL1NFaldDV0pm?=
 =?utf-8?B?QnJiM0VxZ2p0bW01ODlCci9uMmFEamdQQXN6alZwbXVqZUFYMnExbXRsLzlm?=
 =?utf-8?B?V215SXVucFN5UUxzVGVKLzZ4ZWhBR3pWU256alUrL1ZBRzR0ZWxDQmErUlpV?=
 =?utf-8?B?Q2RIUGlNUTluS2JjMWNXaWI3NzhPUFo3UHBKK0RpZDdoNllCNW1rdHNOWHlM?=
 =?utf-8?B?NG1laVBrS1BEZXd5NTVHUVFYTTB4OG13clUrODFOZlVNamp6L05SZm10eFd3?=
 =?utf-8?B?RjlPTTB6a3d0T3lkOU5OaUt3NGcvUFlkaUdaYXZOQUh6TW16dUhaY1Z0NlJ1?=
 =?utf-8?B?T0RnS2ZSZiszN1lHZ0kvT013UVhVWTVvZnJpTSsyMDFtRitCUjczUVRMRHRJ?=
 =?utf-8?B?Zi8vRjVLK0FHcWl4WkVrc04xVDdUY1NFUUdDSm0wU2ptUFZSYmRiUVVubi9k?=
 =?utf-8?B?S05RWWRZNktvUVVwd08vVStERkFtRFhsWmtkR3g2ZExQV21wNXArNG9BMURI?=
 =?utf-8?B?ZzIxd1BFbEU2RjYrclM2OWFwdktnZkpTZE4zWW5UWGZHaHR4NndkSjBCOGpE?=
 =?utf-8?B?K1BjZ2xlUWZUcHc3dlBTcXpTUHoyVU1lbzVPZTl2WGpRblZPRkZBeWRJSHVs?=
 =?utf-8?B?cGxpYk1OVDM1S2E1SU50b1BTaTJaWkE0VStQZFJ4a0tENUordDllL3RCY1hJ?=
 =?utf-8?B?WWFoeTkwdjR3bnA2WWZjeEluM2RQRVdQWllQOXJWdTFLVXcwNGUzWkdGc3E4?=
 =?utf-8?B?TkVkRmpDMHFTMXhreUQzV1ljVXg5bWJkejV1Vyt3c0lNOE4vMlU3NTlPUm1q?=
 =?utf-8?B?d3BBU3dwNVQ3K3lmZVRUNGJNL0pEWFNhV3ZkZ0ZBQW5FbHNSNXJMdzRmUzZY?=
 =?utf-8?B?ZVlRRmFkaW5reThBcVlwRGlxTFVzb1VKZUNNOVBOd2hwT2pNMHkwSkVrU2l5?=
 =?utf-8?B?Q2pMSUlybE5PTVk1NEEvbUVsZFFRWXNiNEx3OER2dE8rYXUyZ0MvMThrenNy?=
 =?utf-8?B?aTd6NE9PQzNQOGxtMXRienZjMmtBbCtDY2N1YjE5VElNVnRLODJMbmR5NFRi?=
 =?utf-8?B?YnRyZWhRQnhQQUZ2NGg4NE41NUpkbUdLN2VSK05VdSs0RG94NnBIS3NjMEs2?=
 =?utf-8?B?VnBteVMxUHAzQ3EzdE5YdUJ4QXFueGhwNGNaZzVuQUhxSFVoNU5TS0tXZGJv?=
 =?utf-8?B?Y29MMktmcHQ5dExsbkhidVZRNHQrazJQeHZaNkV2dUZHTnAwZ3IzZkw1TW5l?=
 =?utf-8?B?eUJFRVlOaHVvTm9ZbFJEM0c5WUZ6UUdDRjYrR2VsS3ZLSUtVbmJWcjB5Um1G?=
 =?utf-8?B?OTdhbktnU2VmMTA2Q0lhanR6TnAxMDJyOVdwZTE4N1JVL2lKYVg1R3hKMTRY?=
 =?utf-8?B?RU01V2JIQ0pQVXNFenpZWlpLS0tsMndFRHVMdzh1SjZicHkwSHlCRVlDNEFG?=
 =?utf-8?B?NmtpQTdUZnM0Snhsa3ExZ0t4OHBNTm10c2NZVmF0U2VFMVQwZXIzaUg1T3cv?=
 =?utf-8?B?czRLbHRXZzJ0YlhXSlU3QmxlM0lXQUNuUGovUFIxaDQ4Wi9TOHFiSXJjVWxj?=
 =?utf-8?B?Mzc2TGFEdTNJUzBmT1R5SEk4SU1jV1gyR2VEeFFvdHhqUE9pVTM3MEhvV0Rm?=
 =?utf-8?B?akMvUWZJOFhZV1NEM0RUcUdieWl6cWUwb3NSZVNxT3Z6cTNyQ2xrVUtUayto?=
 =?utf-8?B?VTBSTFI2blZRZlB6NkljakpsWnVna0RLZElscDhrMGo5cGZCM3BPUHZsazJF?=
 =?utf-8?B?WkdTRC9jV0lucm1TYWhLc2RBellBVnQ4ZGtWYVFtMERqek1INHY5Y215eEt3?=
 =?utf-8?B?dy9aTHN2SkNidG5OaVRiVi9IRGNPb2xDNFFUZXFNMGZTaFdrM1ptSjFYWDFI?=
 =?utf-8?B?OEhlSlZZaWN3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PPFBEC4B1F8E.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFdsWjRBMUpiRW15UXMrN1pmVjFhWHh0M051Q09LenI4VnAvRjZYNkYxZWJr?=
 =?utf-8?B?L25tQkpXMXRmWklhaWNKNWcxYy96K0pMalVJNmRmL3NXOTROcFR2VTdJUmhP?=
 =?utf-8?B?VGdLdC92c09rZTZ6Rm5uQ2JGNngvK3JsRnZYU2ozcTNuN0JUVVNHVmNJcEhY?=
 =?utf-8?B?SklYQ2NKZDFTUW0zdi9MeFJZWFFqaWlQUXc1U2RUeXFDT1VWakUrREI0a3JF?=
 =?utf-8?B?MEhPQnVsdlUzbHN5YTlBL1VMSnJaeHQ1azJEamtEWlByRG5OaXdjMHJFeTJj?=
 =?utf-8?B?WktsVEIyRTJQanIvWlByVWk0RG5SZFNsSWNBSTRpME02Y1NrSlJEWmtwOGEz?=
 =?utf-8?B?MC9yY2JzV0hXZmVQelhVcm82OTVHcVJyb3F2ZGREenNXMUpzZjh2VlVmcmVV?=
 =?utf-8?B?UHVscGRGSUFpUkIyeXdjYmpNVWVJL0dQa2VDdzl5U1JCMG5DSDk2dm9EdUt0?=
 =?utf-8?B?b1VFTTNra0F3Zm40WGpzWSt3QVRkbVBwdUJOY2dPUE45VWlSV1B0RUwzWFVT?=
 =?utf-8?B?d1pxb2lZYnNhbHNPRlVGWXF1WDNKZStRcllMRlFvTmxXSGFWTmdmd21IV1A2?=
 =?utf-8?B?ZVc5NXMyOU1kN2Z4UHFIbXVkMnp5R2I2YWVsOENyK2Q1TnVxc3pmS0hsMFRx?=
 =?utf-8?B?NzJrbmJFRmprTDJHNHdOQ2VPMENBZ0dFOHo5TnMyMkR1aXNtTjJPdmdZQTJB?=
 =?utf-8?B?Vm10cWw0Rnp3K05YdDJTYjZhOTZqTmxWbGZlY2RjVzg3M3dGQzVxdGhxamdM?=
 =?utf-8?B?dXJJNnh0WXJCeUx1WWVwVDJVOWJYRHM0aHcvNk80VmlqaTQ0WjBhMW9vRERm?=
 =?utf-8?B?Smpna2Vjc2tJQldDaXdRNERITnFScUxjTVd0QVVHLytHTkhIYmxpekhxcGxv?=
 =?utf-8?B?eDZhSEszZk9YNGlwS3hsNmRwdHRFZ2NPaUJpb016RlZHdFNTcmVrenh6d2Jt?=
 =?utf-8?B?Zk1sODFOYXEzQkN3Y1c1UitBNlZqaTVWWHF1RWhxWTFwUmF6VGZkczdNWms5?=
 =?utf-8?B?dVJYRmJXY2lFRUlVaW16dUxLbmlHcjFMZWo1RVdTcEdLL2NDNllJcytRM003?=
 =?utf-8?B?WG81YnFtWVFrS0hqd0RNM2grRW91WkhWTXlZbXhqcTNtRW5vWGc5Mmd0TVRF?=
 =?utf-8?B?aTNZQzc2LzduRlpuSFFwOGo1VHZFV21VQ2t1djdySkFYM2VHRm5CNUNiMm9u?=
 =?utf-8?B?dC9obWYzNWJBWWtQVk9hM3JSK25qTTJ6YVNhVmdjZFViekV6YXd5MVJKRDFY?=
 =?utf-8?B?V0R6cHhsSFBXc0I1MWF5eExEdHU3SW1iNjVmQ0o4Q0hMT1REbEQxNGREWkZD?=
 =?utf-8?B?QWxWM2VzblRYRTJIK3dMdTBaTzlhQkVQNGplSndRQzk1RThGYkh5UE5vYmdV?=
 =?utf-8?B?WkZMWEt0TXNFMUJPblhBblpmRWVJdlF1c3lqTEJpUzdhbkJVaU5mWHBwRGsy?=
 =?utf-8?B?dHZGL1VSWUhqOXoxT2RHS0gwN2RYR001RUNCZjVrOVBZL0h5Z3c4bG42MTdq?=
 =?utf-8?B?UDc0a1V0dTJjMCtKZFIvYWVHZFVIc0V6dytROXI3NzhremU5UWp0amlZWlpo?=
 =?utf-8?B?RUNPQ2t2MzgzMkN3d0wzS0hUbUVxQjhuQzl0RHR6cFpLMDZnL0hnakg5Tm04?=
 =?utf-8?B?UGZncS9oa1MrdGpYTy9JbEFiWmNncWpJVFJiMml1eUZnWDhaOVlmMGJjcUUx?=
 =?utf-8?B?TzJBWXZaU09JV09XbzZVSHZSTEtsd1poZU1CYjQ5c0VMaHk2NU85YWxCbWZl?=
 =?utf-8?B?Nnp3MkduWTJFK3dvWHlYaEk5RWI4RkZ5UGxYUlZ0ZFRvS2ZURCs1MXA4RlVC?=
 =?utf-8?B?T2hFbitlSGpLK1Fzd0FKZEVLU3N2RWF3R3hYVWRQanAwVU5qUHNOdHVWUmh2?=
 =?utf-8?B?QXZuaVZlUjVneVhGUy9tM1JuaGRpTEhodHFRVWxwaXVDaGZJL05scmJRRkRU?=
 =?utf-8?B?WmJXK2lKTzFIME5NbEJ1ZDRIcElmOFA5MGlUUytIQ2Q1K0NmMTNpTUdERUZN?=
 =?utf-8?B?TW1PRmpVc1o4SGU2SjFsVkJhMzJTT3Rrb2U2Yk1scFkvazhvS1Vwa2pwRjZI?=
 =?utf-8?B?cGdvMmVFTzIzL0xXaTI3TkR3ZnU4dzlmNnFUd3EwTEFrUkx1bjdxVVEySk04?=
 =?utf-8?Q?3O7M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7A9221A794EB0948B2C5D95E2BD76BEB@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 865c9da4-1533-494a-99c5-08dde4c542cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 17:23:23.6265
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z+nPOnKDdVK5udCghO0UvqyrpYd0mU4X1Os+EYvBwsdLTYAL9bYn4sUC3dfGX6cCcCfxywfSofHgy9xaa3k1MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR18MB6004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_102328_003062_5C1684FA 
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

T24gOC8yMi8yMDI1IDExOjM2IFBNLCBHcmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6DQo+IENhbiB5
b3UgZml4IHRoaXMgYWxsIHVwIGFuZCBzZW5kIGEgdjM/DQo+DQpBcG9sb2dpZXMgZm9yIHRoZSBw
cmV2aW91cyBlbWFpbC4gSSBhY2NpZGVudGFsbHkgc2VudCB3aXRoIHRoZSBIVE1MLg0KDQpUaGFu
ayB5b3UgR3JlZyBmb3IgdGhlIHJldmlldy4gSSBoYXZlIGZpeGVkIHRoZSB0YWcgYW5kIHNlbnQg
djMuDQoNClJlZ2FyZHMsDQoNCkhhcnNoaXQuDQoNCg==

