Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7CEE8B387
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 01:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t9F7gn655lsdOhkZNU58hB7mUp2/tFezTefNNXxofAw=; b=rg/QZ6Ju8pw4PDdwL+dKkVcucr
	rU+ZqrUuVvqznVl1MiUmciyYxjV3M6rFb9PX7mNwk9RYsGIw1FGg5/CFHBTdFp0HjpQFFbjQGBBWE
	rK7MIUcTrnsFcvJP3umNB2DNjjMAPhcelDFOxCprA46aMx1DhEqqJ3cCNkavOHWZMiDQLMZaL0GXn
	L7DLWyh05Ytp4yzmhhFvclFQ9fiW8vfPwiURZwUXUE5nEeihAP3aaSX2QtDpKi/uPS4iMDfcTxP2D
	KkE+2mJz822G0tQrDeQdHPHobYZHNuzgrQlB6fg4Wgc8cZgNle2U+mvAASMiO8GEmL1MhPLmRJLVN
	Zwa4K7JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnS02-00000007ib9-1xmL;
	Wed, 04 Feb 2026 01:48:12 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnRzz-00000007iaA-0nu1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 01:48:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPB9XWEdnDjH3lZjyqjYMFCz6QAqaSeXEVtNEcUOox37AJxpfgRPVk/q2YtGPryLjZya/arZpXm42e0hsMbzlmRuZ/cV7mT15FU4bjSw+wEG2UI55G1pEdzAS/10WT5qakQ7Y/YSQhBISzJ/VOTeykMc6DHd9XROI7jrycpZXtyTMXFDNGECy4a9dfUSA9qDw/AVDLPThV/mT4Z2QmcjesgwjqXHvtwjriQtrFzN9gVrquflWYaV38WIkvullr8ccBCGRzmIVnpClAGnHyVSxkad0FykSGt73RcPZrEE/8lu+TSomWxeoTFUn0l9/L93eMsMY8tTVjTfKv7vXMUG8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9F7gn655lsdOhkZNU58hB7mUp2/tFezTefNNXxofAw=;
 b=EjI3pFKMkZfz7Giefsrlwa1Bmu4RGDakYhGi2j7awsk8PE0bO/N3MjfBJWP/9rR8a29JKCV+yF04x/jE5eW+jlRYzgQWsYqfuR0PvwoZx2IjalpOjcEiafmKK8rhFvxbBYcG3kxmzUuzcw5bj9tbtwii9dqtV3YEaU70vjQ2IWtcqc/x0KO9Don54ZNgZX93DFlbrPCwAeE2oS9Ndjdl/gyZz36aTgb/61rfBM+ID511ffB88YoX1uMj4bH/mdFm07xj4gASQaL6n8vRvd5ufl5wRV9OAq2EodRweDJmv74N2CWH10GPiHyFPDfjGndzGusbCHvq/uui+NqwwVQ+uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com (2603:1096:301:117::13)
 by KL1PR06MB6164.apcprd06.prod.outlook.com (2603:1096:820:d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 4 Feb
 2026 01:47:57 +0000
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::f320:58f6:4dc6:b908]) by PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::f320:58f6:4dc6:b908%4]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 01:47:57 +0000
From: Gary Yang <gary.yang@cixtech.com>
To: Lee Jones <lee@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, Peter Chen
	<peter.chen@cixtech.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjYgMC8zXSBBZGQgc3VwcG9ydCBmb3IgQ2l4IFNr?=
 =?utf-8?Q?y1_resets?=
Thread-Topic: [PATCH v6 0/3] Add support for Cix Sky1 resets
Thread-Index: AQHclLJX1nTCGlQg40SxyK9r2lz9j7VxJ1yAgACerPA=
Date: Wed, 4 Feb 2026 01:47:56 +0000
Message-ID: <PUZPR06MB5887278092D23EDB68B05971EF98A@PUZPR06MB5887.apcprd06.prod.outlook.com>
References: <20260203021053.4073258-1-gary.yang@cixtech.com>
 <20260203161557.GA7629@google.com>
In-Reply-To: <20260203161557.GA7629@google.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR06MB5887:EE_|KL1PR06MB6164:EE_
x-ms-office365-filtering-correlation-id: b3ee428e-5e80-4b3c-2900-08de638f6bac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?eWdlTmE0MkxwUEhGdmdaTHlodmxpNTZPTHlVSW1RVlo4aEJRblFKb0V0L0Vk?=
 =?utf-8?B?bWE4c3FlNXI0VVlFeEFrYVBlaWlpS3QvZC9Ea2s3NXc1U2k2TmloNkpETXNl?=
 =?utf-8?B?NVE2bitrUUN4QXFMMndXcjl2WFNzY1ViZmI3ODBsRDRSQjFOQWczV2dMNzRZ?=
 =?utf-8?B?ZEc2a0dZUExTQnRTeGRkeDlUZEJ2Rm9VbnlweGxIcU12dEtvRERhVmNrS0FJ?=
 =?utf-8?B?YWluaFVOL2hSc3d1bzVmU3BXL2VRU2NNeVVZUGIybkxUTi9TUCthNXROK0hN?=
 =?utf-8?B?cHM1aGJqZlRKM3dBWmtlejZBcktFRU5XbVRGTFJUQ1JydzE4S0x0SFlqT0hL?=
 =?utf-8?B?MjRCQWpMSUxjMndIcnZoRnl2VEZWendldDFpOHdqUE9FK3dRWkNCS0pZYytW?=
 =?utf-8?B?dWtNaWxCT296R3NtTnRINnc4UHM0NXR1N00zeEI5YS9IdmVRa09aSERTUXpI?=
 =?utf-8?B?OFlwZ3JLMzJtTTgyd2xkdkcxeWJaOFM5Y1NJSmJackpOK2k5QVFQMFpNdk5w?=
 =?utf-8?B?MDVUY1VkYXNtQ3YwM2duc2VtNnd6V2xWbDF4WXBwRnZBMHEyTUcyU2tkQVZC?=
 =?utf-8?B?Q3h6NUJiWGplYTR6VWVGM2QwN0lNR3dYT2ZwZzJReFdZVzhsdCticzBWbEdl?=
 =?utf-8?B?bHRxMDFJbm1yZG8rRFR6RC9maFlHSkNzU3ZkazVsejBaVm5XWjlIWXJHb2cv?=
 =?utf-8?B?RnRVendiNzJ5anpjaVdGdlp2Z1R4MHg3dnJ3MjVzTDlzZC84ZmdBdHJuY3pk?=
 =?utf-8?B?UkRxQml5alpiOUI4eS91RzlFbTNweXhQL0NmYjdRdDArNnQySkdha0prdk5W?=
 =?utf-8?B?TThNY0o0Z0QxeFB1SmhicEdmUkVjb0QrTmMvSWVkbVhPenNQcy9Lc0xnWWty?=
 =?utf-8?B?MnFkamN6U2dtcm01VmlIWW90RGR5N01nVm1NL1EzT3JwL3N4aWlGckpxYktt?=
 =?utf-8?B?U210NndWdWhlckRzOVZBMHdaOTlSNVRFRkpmTEhzQVh3SzYrR2RXN1NuaGlt?=
 =?utf-8?B?ak1RRG9FS1RFdmdLdHBkOC9VSjZJZlIvSzEwTEVlYWtLY1pOZ2FNR0g4LzVH?=
 =?utf-8?B?MnhuU2dnT0E2aWRnMG41UGd4V0FDOGNjdUVnMjdReDU2S3gwdWdqalc2ZU4w?=
 =?utf-8?B?dGp2ZFp0eXhlMXVWYlNoTk0vdlhvaW5HSzROY055NjhUT3FoOFlNcVZSTmJv?=
 =?utf-8?B?THF1NkkrbEgwU1ZkNjhQQVQ3K1NlZVd4MWp6RkFLUHpiNjdra2xJaHY4K0ZD?=
 =?utf-8?B?d3ZZazM0WGRQTjVnU2R1NGpUT0VVYVY4VUw5bUE0Smk2cXl6Y2NzL0t4d3di?=
 =?utf-8?B?L0JxMDJYeDVuc3FQVGR3RUdsRllucEpkdTZYWVZ3OHR1TEtuWnp3d2NnWVha?=
 =?utf-8?B?Tlo0bUlVc3pCc215UUtZcnlCNlBMNEhWam9rOUFmOFRDcUpBZ1A4RWVNVVp1?=
 =?utf-8?B?Qm11NW5ONmFCZ3VyMUM0TXc4cTlTTENyUFhuWlZ5QW10cUhRSk43LzdKdU0x?=
 =?utf-8?B?Vk5NS21iR3NleVJXbFBTbmdDUDdUV2xMQ1JvblJRWjN1eDQ0M2MvUDlISy9h?=
 =?utf-8?B?ZUxoQlBYRDZuTHdJZGFOVXpCKzJPT1lLRjVWL1p2Tm1nTVVhK3B1dCtmSkhR?=
 =?utf-8?B?TU85QWY1M0czUmRUTW5sTE9PaVpRZzJpVWRsWlNmczM0VGtsTGYzNyt5dS90?=
 =?utf-8?B?eDZtaXRzenBla1l2cnljK3BnaFBDUjhBczk3eXUwVFVzSHRMenQwem1pQ3pT?=
 =?utf-8?B?TFY2Q1pHM05ESVhRd0F4S2NmT2JYVlBYVHBsbEhiK0NRdCtHR2QyNUp6empX?=
 =?utf-8?B?Y2p5c1k1NHkyTHJaNHlNTkJEZ1oxNGE4M21Od1VDOSt3WjhpUExEMFNnM3dD?=
 =?utf-8?B?UXpmMmVaKzI1VzdEVnp1MEZvMEllazIydGt2OVc0MkxPOG9qVDNXYTdaWUdK?=
 =?utf-8?B?U2JDVWttQVFFSmVod2g0cHVQRW5DZUprcnlDRVlyeHR5RThoemV2WnBidUly?=
 =?utf-8?B?MFM1VHRnbklJdGNqKzZmK3pJOEEzT3lzdm9uRnpBN1BLQ1B2ZDFMRXNDY05H?=
 =?utf-8?B?NjlRazFnYjRYcElxc1hRY216SEJVb3AxSjgvVWRvaWJkL2p2VTJydUhEYjRI?=
 =?utf-8?B?OGh5eE5zaUNKcW40R29CL2N4WHpLWmdCRVpGUFhxdlFjd0QvMGgzMEdaY0NH?=
 =?utf-8?Q?t0XkISGBuo7vERizZtZnu3g=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5887.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YnkwQXZVTkg1MXhHR2pIdmdRMW13TVNFN1dPQlZQVXBCdmphczlBMnlaRnBD?=
 =?utf-8?B?MWFYNDdYcW13MkJIdGEySXlMK3hqUVU1NXEyU1pvdnRHNVF5YkpsbVJwWE9Q?=
 =?utf-8?B?K3hEOEFaZVJGL1VMT0pOSElFakFRSXdQdjYzTEswelZPSEw3T1h6Qmk4T20w?=
 =?utf-8?B?dC8vMytjckR4cWo1YUhHQ21iY1RGb0FMbWw3SGZ0OTQ1RlgwV09QdndJT3h0?=
 =?utf-8?B?REF2S094djkzNGNSZHFjVk0rYTZNYlB3Y3BDNVVIaGtZVVltRG55L2JJcElP?=
 =?utf-8?B?ZWRjcitDcW9UaDVmZHk0d2gwRzhQMityVVMxY05acXIxTTZaU2c1ei9lZDgw?=
 =?utf-8?B?Q1dVT2Q3V1NhNjNkZ0pXdFFkMGNMNzRkUDZoZUJrYUh5UXhSUy9GMU1wSGFO?=
 =?utf-8?B?VTlSRWxvOHJnNi84WnNhQkNoMlowQWt5bVBWN1BMYzQwdWF3a0Z4RG1LdW42?=
 =?utf-8?B?TFJxaGhDeFpwMzR4Si9nazdNU2taaTIzRkJiYTlDcFhZa3FBYTRmMEo2dWdw?=
 =?utf-8?B?alh6K3lzNFV3UkxWcWoxa3UwQTB4akI3UEhGV3hyM3ZKd3RvYnZQcXFkWVNF?=
 =?utf-8?B?OWh0WHNLVi9meCtmaWdEZW9nbzFqSzdlUzBUOS9jZWY2SkdDQ3NUMDBhdzM2?=
 =?utf-8?B?WFoxa2dUdUN3ZGE1NkhNU1ZiYnJnOE1EaG0wampubnd5V09QbkxiK1hIOGl1?=
 =?utf-8?B?blBBVjBYV2NLdmtBYXYyVnRVUVk0UGx5Q255b1kyb1Q0eHJHNEs0MVdJUUNj?=
 =?utf-8?B?Sk9idmV1WUh6RkRkeG0xVS9oVkRLa2dhM1JRNzgxTWxmRHd6S2lISzJUamZ0?=
 =?utf-8?B?T3E5bjI4NEVkWTlyQlJpcHdSUkNyQmJpZS9PMFJOdnNHV1JaWjRnaXlMRCtG?=
 =?utf-8?B?TngwdVhKcjdFQ2YvNTN2c3R2RE80SVMwTHcwUzlXTTY3Y3p4dktmdGxOK3F3?=
 =?utf-8?B?MXhzUWVkMHhYS2xPN3VrYWF3RlFXM1IrbHNZMEk4akF0Zmpya3NpRnpkN2J1?=
 =?utf-8?B?OXZBUHhuNTJtYVpjNXR1RTRkNmRnR2dOQkVUekVhdDBJdzYxNGJxVmYzRDM1?=
 =?utf-8?B?VHhXYnJJUitaYzlxVWd1S1g0SDZMMmJOYVVSZ1lEZGx1OHlMR3NGcUFGZ0RR?=
 =?utf-8?B?UHViR0g4SlB6a0dSQitsUDFIenlHcEwwT0psdG4wS2pjeDBKVlVMT1dOZDFR?=
 =?utf-8?B?YjN6cWR0VEw1NjBOZHJYckE3cHpVMlhJdEJnVVpTNmF5a3Nad25VMG5YL1ll?=
 =?utf-8?B?TkpUSW4zdFE0ZldMVHl4VWk5VEN6MEVmaTRJU2xyWHVna1A2TTFnNlpUN3FJ?=
 =?utf-8?B?VUhuQ1FtRlZ5T2ZkcVFYZkZjSDZzNU03cG5YYWE4dGFCc0ROeG9jSW52ZlhV?=
 =?utf-8?B?aHFTRW14bUJKVG40Um1yMDNRaHQvcllhQkVkblJyNm9uUEp2Y1FmUTFJVUxx?=
 =?utf-8?B?Q2FsM0tjb01nMlczVkpJQ1BsNDhYOTFWc0xrSWxzM0JnSzErRDYvaStpYlVY?=
 =?utf-8?B?NjZGSThoZWZkUlpBOXNsTCtVRVl2aTlnaEJMSURrNUpLQzRvdW13WDRDTUNO?=
 =?utf-8?B?cVE3SzlBRk0rSWdKRlhBSHJIeVZIYU5lYXpQYk1QMUx4MGttRW9ET3pvZ0tM?=
 =?utf-8?B?T25ZUENNWFZ6dXR0VktWYTROaEVPdVFWVXlvY3dKL0NISnhjZXZVb0pCRkUz?=
 =?utf-8?B?aHBFcWVEdklTejhSalRnSG5lbUFCRzR3S09iUlFBUEFUYnFtK2ErUmNKblEy?=
 =?utf-8?B?QTlYdmh3aVhZVlJIakFoVEZxaUJWQ1I4WkVibUVtUnNoZ24yYVJPZlVjSXRY?=
 =?utf-8?B?d3lMSjFQR0pURndQNDAxbGJFNlZjRVNoWmpBekJIWGI4S2lCZHhGYldjY05H?=
 =?utf-8?B?RW1HZ2pUUjZUcnZmZkp0MlFLT0hUVFJCOFJxYXgwUXJaQjUvNnA1RXljejdF?=
 =?utf-8?B?VVBDTHlodnd3RldBamwxU28rRFc1OHh6NXNpd2FORGZVRWVRL0krVStzTGJR?=
 =?utf-8?B?ei83RWsxdkx2bjZWVzZyL0syWUZqSk5GczFoc3pGOURxOGpKZEN4Z21PdjFM?=
 =?utf-8?B?ZkVkMWxEcmVhS3o0OHRhcVBmR1UzT1E0Uk1TRklhVVRyWHZOR3pJcEZGMmNp?=
 =?utf-8?B?Y2JEQVRUTHNGOHcyWnp0TE85N1VscWlBZzQwekY4S0FtUVhLZmUzci80YTF4?=
 =?utf-8?B?ZXE1cXo3Y2wwako5TGE1bHZZME1CTElKU1I4TFErQXFQSU1wWnc3WGdnNkMw?=
 =?utf-8?B?eVVkQnRDOUpobXhlaFZ6WTBKNjRhOGxnV2pjUGZrd2dYYVdSeXBzWXZrVmZS?=
 =?utf-8?B?NkVxVnEvdVZCOHhPbnBmNWtHbWc3ZkhpS2xXa1ZWQXNDZnE1M1FyUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5887.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3ee428e-5e80-4b3c-2900-08de638f6bac
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 01:47:57.0458
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HAdH89xXJm+Tb/0aGMhmn8WMBjgNPEREXURbp9fyZqu8abgEUyhKLR03x3dEt856Kw3jcJH0Ws+uJSDAbxRDOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_174807_357257_8501D037 
X-CRM114-Status: GOOD (  16.94  )
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

SGkgTGVlDQoNClRoYW5rcyBmb3IgeW91ciBjb21tZW50cw0KDQo+IEVYVEVSTkFMIEVNQUlMDQo+
IA0KPiBPbiBUdWUsIDAzIEZlYiAyMDI2LCBHYXJ5IFlhbmcgd3JvdGU6DQo+IA0KPiA+IFBhdGNo
IDE6IEFkZCB5YW1sIGZpbGUgZm9yIENpeCBTa3kxIHJlc2V0cyBQYXRjaCAyOiBBZGQgZHJpdmVy
IGNvZGVzDQo+ID4gZm9yIENpeCBTa3kxIHJlc2V0cyBQYXRjaCAzOiBBZGQgZHRzIG5vZGVzIGZv
ciBDaXggU2t5MSByZXNldHMNCj4gPg0KPiA+IHY2IGNoYW5nZXM6DQo+ID4gLSBQYXNzIGR0cyBi
dWlsZCBjaGVjayB3aXRoIGJlbG93IGNvbW1hbmRzOg0KPiA+IG1ha2UgTz0kT1VUS05MIGR0X2Jp
bmRpbmdfY2hlY2sNCj4gPiBtYWtlIE89JE9VVEtOTCBkdF9iaW5kaW5nX2NoZWNrDQo+ID4gRFRf
U0NIRU1BX0ZJTEVTPWNpeCxza3kxLXN5c3RlbS1jb250cm9sLnlhbWwNCj4gPiBtYWtlIE89JE9V
VEtOTCBDSEVDS19EVEJTPXkgVz0xIGNpeC9za3kxLW9yaW9uLW82LmR0Yg0KPiA+IHNjcmlwdHMv
Y2hlY2twYXRjaC5wbCAwMDAqLnBhdGNoDQo+ID4gLSByZWZpbmUgcmVzZXQgZHJpdmVyDQo+ID4g
LSBmaXggZHQtYmluZGluZ3Mgc3R5bGUNCj4gPg0KPiA+IHY1IGNoYW5nZXM6DQo+ID4gLSBQYXNz
IGR0cyBidWlsZCBjaGVjayB3aXRoIGJlbG93IGNvbW1hbmRzOg0KPiA+IG1ha2UgTz0kT1VUS05M
IGR0X2JpbmRpbmdfY2hlY2sNCj4gPiBtYWtlIE89JE9VVEtOTCBkdF9iaW5kaW5nX2NoZWNrIERU
X1NDSEVNQV9GSUxFUz1jaXgsc2t5MS1yc3QueWFtbA0KPiBtYWtlDQo+ID4gTz0kT1VUS05MIGR0
X2JpbmRpbmdfY2hlY2sNCj4gPiBEVF9TQ0hFTUFfRklMRVM9Y2l4LHNreTEtc3lzdGVtLWNvbnRy
b2xsZXIueWFtbA0KPiA+IG1ha2UgTz0kT1VUS05MIENIRUNLX0RUQlM9eSBXPTEgY2l4L3NreTEt
b3Jpb24tbzYuZHRiDQo+ID4gc2NyaXB0cy9jaGVja3BhdGNoLnBsIDAwMCoucGF0Y2gNCj4gPiAt
IHJlZmluZSByZXNldCBkcml2ZXINCj4gPiAtIGZpeCBkdC1iaW5kaW5ncyBzdHlsZQ0KPiA+DQo+
ID4gdjQgY2hhbmdlczoNCj4gPiAtIFBhc3MgZHRzIGJ1aWxkIGNoZWNrIHdpdGggYmVsb3cgY29t
bWFuZHM6DQo+ID4gbWFrZSBPPSRPVVRLTkwgZHRfYmluZGluZ19jaGVjaw0KPiA+IG1ha2UgTz0k
T1VUS05MIGR0X2JpbmRpbmdfY2hlY2sgRFRfU0NIRU1BX0ZJTEVTPWNpeCxza3kxLXJzdC55YW1s
DQo+IG1ha2UNCj4gPiBPPSRPVVRLTkwgQ0hFQ0tfRFRCUz15IFc9MSBjaXgvc2t5MS1vcmlvbi1v
Ni5kdGINCj4gc2NyaXB0cy9jaGVja3BhdGNoLnBsDQo+ID4gMDAwKi5wYXRjaA0KPiA+IC0gYWRk
IHN5c2Nvbg0KPiA+IC0gcmVmaW5lIHJlc2V0IGRyaXZlcg0KPiA+IC0gZml4IGR0LWJpbmRpbmdz
IHN0eWxlDQo+ID4NCj4gPiB2MyBjaGFuZ2VzOg0KPiA+IC0gUGFzcyBkdHMgYnVpbGQgY2hlY2sg
d2l0aCBiZWxvdyBjb21tYW5kczoNCj4gPiBtYWtlIE89JE9VVEtOTCBkdF9iaW5kaW5nX2NoZWNr
DQo+ID4gbWFrZSBPPSRPVVRLTkwgZHRfYmluZGluZ19jaGVjayBEVF9TQ0hFTUFfRklMRVM9Y2l4
LHNreTEtcnN0LnlhbWwNCj4gbWFrZQ0KPiA+IE89JE9VVEtOTCBDSEVDS19EVEJTPXkgVz0xIGNp
eC9za3kxLW9yaW9uLW82LmR0Yg0KPiBzY3JpcHRzL2NoZWNrcGF0Y2gucGwNCj4gPiAwMDAqLnBh
dGNoDQo+ID4gLSByZW1vdmUgc3lzY29uDQo+ID4NCj4gPiB2MiBjaGFuZ2VzOg0KPiA+IC0gUGFz
cyBkdHMgYnVpbGQgY2hlY2sgd2l0aCBiZWxvdyBjb21tYW5kczoNCj4gPiBtYWtlIE89JE9VVEtO
TCBkdF9iaW5kaW5nX2NoZWNrDQo+ID4gbWFrZSBPPSRPVVRLTkwgZHRfYmluZGluZ19jaGVjayBE
VF9TQ0hFTUFfRklMRVM9Y2l4LHNreTEtcnN0LnlhbWwNCj4gbWFrZQ0KPiA+IE89JE9VVEtOTCBD
SEVDS19EVEJTPXkgVz0xIGNpeC9za3kxLW9yaW9uLW82LmR0Yg0KPiBzY3JpcHRzL2NoZWNrcGF0
Y2gucGwNCj4gPiAwMDAqLnBhdGNoDQo+ID4gLSBmaXggZHQtYmluZGluZ3Mgc3R5bGUNCj4gPiAt
IHJlZmluZSByZXNldCBkcml2ZXINCj4gPg0KPiA+IEdhcnkgWWFuZyAoMyk6DQo+ID4gICBkdC1i
aW5kaW5nczogc29jOiBjaXg6IGRvY3VtZW50IHRoZSBzaW1wbGUtbWZkIHN5c2NvbiBvbiBTa3kx
IFNvQw0KPiA+ICAgcmVzZXQ6IGFkZCBTa3kxIHNvYyByZXNldCBzdXBwb3J0DQo+ID4gICBhcm02
NDogZHRzOiBjaXg6IGFkZCBzdXBwb3J0IGZvciBjaXggc2t5MSByZXNldHMNCj4gPg0KPiA+ICAu
Li4vc29jL2NpeC9jaXgsc2t5MS1zeXN0ZW0tY29udHJvbC55YW1sICAgICAgfCAgNDkgKysrKysN
Cj4gPiAgYXJjaC9hcm02NC9ib290L2R0cy9jaXgvc2t5MS5kdHNpICAgICAgICAgICAgIHwgIDE0
ICsrDQo+ID4gIGRyaXZlcnMvcmVzZXQvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAgNyArDQo+ID4gIGRyaXZlcnMvcmVzZXQvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgMSArDQo+ID4gIGRyaXZlcnMvcmVzZXQvcmVzZXQtc2t5MS1iYXNlLmMgICAgICAgICAg
ICAgICB8IDEyNSArKysrKysrKysrKw0KPiA+ICBkcml2ZXJzL3Jlc2V0L3Jlc2V0LXNreTEtZmNo
LmMgICAgICAgICAgICAgICAgfCAgNzggKysrKysrKw0KPiA+ICBkcml2ZXJzL3Jlc2V0L3Jlc2V0
LXNreTEuYyAgICAgICAgICAgICAgICAgICAgfCAyMDQNCj4gKysrKysrKysrKysrKysrKysrDQo+
ID4gIGRyaXZlcnMvc29jL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSAr
DQo+ID4gIGRyaXZlcnMvc29jL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAg
MSArDQo+ID4gIGRyaXZlcnMvc29jL2NpeC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICB8
ICAxMSArDQo+ID4gIGRyaXZlcnMvc29jL2NpeC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAg
ICB8ICAgMSArDQo+ID4gIGRyaXZlcnMvc29jL2NpeC9za3kxLXN5c3RlbS1jb250cm9sLmMgICAg
ICAgICB8ICA0NyArKysrDQo+ID4gIGluY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvY2l4LHNreTEt
cnN0LWZjaC5oICB8ICA0MiArKysrDQo+ID4gIGluY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvY2l4
LHNreTEtcnN0LmggICAgICB8IDE2NCArKysrKysrKysrKysrKw0KPiA+ICBpbmNsdWRlL2xpbnV4
L3Jlc2V0L3NreTEuaCAgICAgICAgICAgICAgICAgICAgfCAgMTggKysNCj4gDQo+IFRoaXMgaXMg
aW4gbXkgaW5ib3ggYmVjYXVzZSAuLi4NCg0KU29ycnksIGl0J3MgbXkgbWlzdGFrZXMuIEJlY2F1
c2UgdjUgcGF0Y2gncyBtYWludGFpbmVyIGxpc3QgY29udGFpbnMgeW91ciBuYW1lLg0KUGxlYXNl
IGlnbm9yZSB0aGlzIHBhdGNoLiBUaGFua3MgZm9yIHlvdXIgdW5kZXJzdGFuZGluZ3MNCg0KQmVz
dCBSZWdhcmRzDQpHYXJ5DQoNCj4gDQo+ID4gIDE1IGZpbGVzIGNoYW5nZWQsIDc2MyBpbnNlcnRp
b25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9zb2MvY2l4L2NpeCxza3kxLXN5c3RlbS1jb250cm9sLnlhbWwNCj4gPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvcmVzZXQvcmVzZXQtc2t5MS1iYXNlLmMgIGNyZWF0
ZSBtb2RlDQo+ID4gMTAwNjQ0IGRyaXZlcnMvcmVzZXQvcmVzZXQtc2t5MS1mY2guYyAgY3JlYXRl
IG1vZGUgMTAwNjQ0DQo+ID4gZHJpdmVycy9yZXNldC9yZXNldC1za3kxLmMgIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL3NvYy9jaXgvS2NvbmZpZw0KPiA+IGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL3NvYy9jaXgvTWFrZWZpbGUgIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IGRyaXZlcnMv
c29jL2NpeC9za3kxLXN5c3RlbS1jb250cm9sLmMNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGlu
Y2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvY2l4LHNreTEtcnN0LWZjaC5oDQo+ID4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBpbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0L2NpeCxza3kxLXJzdC5oDQo+ID4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L3Jlc2V0L3NreTEuaA0KPiANCj4gLS0N
Cj4gTGVlIEpvbmVzIFvmnY7nkLzmlq9dDQo=

