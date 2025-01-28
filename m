Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536F6C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 08:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+UpDnYcjP5DkcHc8Pu6kDFxjfDI8/rhc9cJ4W3htRA=; b=vVAhsLnXekQcvDyCuC3vRh/rKI
	JrHNyosQKYM3rkGadJapV3xQnny5f4KBBuRrx0wuT4dRhLWhs6rl5nL/TT4JorH4AxqdEinGsHu7Z
	AKHo/rrNY0RdTwiBWqMmlcMHEKsh52/QcOKW37NekvgyMx74pjAeIyPESO90fesqWp16ueHY40H1d
	dtmuiMeUPumwPhIR0WM/ijnNanTO8Z3zIAzmX3oGPujCYYyzqQyRqhBRnnuItlXluLrA+N4zfblIA
	Er/Kq5AyM2GK11OXWsKrSkGXu5A7c13Gdmxk2dz/SDWQ4fLVz246pRWOt/EsFwvkcJ1yZgT1h0od5
	/EPY53nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tchES-00000004Q8f-29lz;
	Tue, 28 Jan 2025 08:46:04 +0000
Received: from mail-vi1eur05on2071c.outbound.protection.outlook.com ([2a01:111:f403:2613::71c] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tchCL-00000004PkS-0m5M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 08:43:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ggJH50AiV6XKUUiRZOWD1/A/08z7nz0PEdHuLFtIMA0J7AqqC5gWhz7y090720QdvnbIEIGeMtV0fFEm5r+UWl9VxI5dFwNfX1DZ4yspX89OEeGXxIk6EbtR3Hg6ZAkuM5nMrBReISOhlxHg8QPSHN2Z5huWMzFDhDWmCGQMaZXnJ4Vitp0YDnusS0g0M+rhtzDmY1WOotm8xP34++QZDv+RIA4+XzEmcmmGxkqiH7LOsSe1E7INFvvjAnuOY5pZHMK6Af/o8uTddhQVYFZWtWVxuF6lietTvdh1tHWsEAwJwUPbrUx+zSszJ3BfD9cRFitIQXuM4jPRgbhVJTKGhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+UpDnYcjP5DkcHc8Pu6kDFxjfDI8/rhc9cJ4W3htRA=;
 b=WjZSLfzVNzj9VEsXBsMSyo9Jer9GKPEq40sAqdJBpe2B2X1/vgplQKtssrLqoD0w98TOhKIOExNgd6Z7vmKbA9s4GuhgcfeITq9PFNIkFVABwQB4uQS7NICdv3lgBKTHRhaBGG5bvp1HvUA3Ds+k+E9KiHoJkCTEOcwse1Qo1VCJm9qNaXfBrCwxV0ozTbnZRyxrAQOUppiFq5IzbmWu8ckZk76Fqiq3wnB/nRMI8rztxgslkFTqmjmtpcfL7dhU5Hy/8pRK7nXbTyvVIhHDx6lPwmS0aKlF2kPCz6e3utlOP0FS5fHQmFvz3LNlmleKFrlljuPuQxHp9gzxsv+1gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+UpDnYcjP5DkcHc8Pu6kDFxjfDI8/rhc9cJ4W3htRA=;
 b=ASLDq2kQJw3D8cDTuuGTP43MgypbDLNC+MEyGrEBj4p7BBFxVTLwjVRZM1jYu8fzGPwbWdZVLuS+MKwWYRew0w3zSA1Dhc2TRU+mFC6/+Ql4RsugTI4J9qxjx6yUCL6m80I87ojV6LGWp5PisZFYwKDEDsdzTqXL7xyR0EL41BAfzUp4UhC3CZOcWx/iLUSgy3s/dMQ0zMw1wr8cAudC3AK5AyWpxXGpnEG5GffaxGDWjC7epffNkPiQh5f2J8hWYNlZF7QbI2IHv9ZsV9+R3u5zgAvCIgvP49kAxdDDgdcVm0QFDavaQ9TPOqp7ErjicjTxy/REoSazjRzLNJqhwA==
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:248::6)
 by DU0P195MB1794.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:3b4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 08:43:41 +0000
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981]) by VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981%6]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 08:43:41 +0000
From: Daniel Schultz <D.Schultz@phytec.de>
To: Krzysztof Kozlowski <krzk@kernel.org>, "nm@ti.com" <nm@ti.com>,
	"vigneshr@ti.com" <vigneshr@ti.com>, "kristo@kernel.org" <kristo@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: Wadim Egorov <W.Egorov@phytec.de>, "upstream@lists.phytec.de"
	<upstream@lists.phytec.de>
Subject: Re: [PATCH] arm64: dts: ti: am64-phyboard-electra: Add DT overlay for
 X27 connector
Thread-Topic: [PATCH] arm64: dts: ti: am64-phyboard-electra: Add DT overlay
 for X27 connector
Thread-Index: AQHbcIjajdZ6Qfgzpk25X3QcXRk5qbMq332AgAEA5YA=
Date: Tue, 28 Jan 2025 08:43:41 +0000
Message-ID: <3f1d962f-ecfa-40e1-b699-95c38a853d15@phytec.de>
References: <20250127065756.3086450-1-d.schultz@phytec.de>
 <2dd9bffa-17d5-4635-b2da-15f59cf07590@kernel.org>
In-Reply-To: <2dd9bffa-17d5-4635-b2da-15f59cf07590@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0P195MB2484:EE_|DU0P195MB1794:EE_
x-ms-office365-filtering-correlation-id: ad154b43-5969-4f1b-a362-08dd3f77de0e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?bC9OaDh5Y3hxZWoyZmh3QWdKbUxNQlZSdVMrU05TOVc3eElVeXBNelhOY2h0?=
 =?utf-8?B?SVlZWVlkcDdqTjQ2RGU3WUhYYUlLWHY4U0lOeEx3b3FhUDBqU2xvd0pLcVh4?=
 =?utf-8?B?QzViMTljZWZ3eDB6VkJMSjk3RnBvRU9LZXFWS1JweFNqTnZhUW9pMENvNlJp?=
 =?utf-8?B?R2dGOGRTT0xLTEtsR1JRUVVMQnFWV2pSUTV5K0gxVi83VVRwS09OSHpXSEFi?=
 =?utf-8?B?cWVobE81cldoVFRTS3Vxc1EyeWZySUNyb1BybDI5UjY3NS9nSlZpLzJxMGZm?=
 =?utf-8?B?MEFKLzJNYlN6RWhRejloQVM5T092elB3eGdhczllWWhWbVJrU293dmNzNno1?=
 =?utf-8?B?bEFWN0RXTytZV3BtdTBtNmtRckloN1ZmUUlXeHhUR3BtbzNTM0djK3YvRHVp?=
 =?utf-8?B?cXlROXVKaVArYytxN3p1VGNBWm1qclBJWERLRDVuVXdKb3J6WHl5Z1VqQTQ5?=
 =?utf-8?B?akpQNW91MDl2M2NCR28rME5Yb3h6Yk1hRGVPUGV5cjVkZ2NydWhMNVJPdDNV?=
 =?utf-8?B?aWlNb1FydURibHpnQ0VFTTlOSmdLNlV4NHZpUHRyS3pPRmc5YmJhNlgweWpU?=
 =?utf-8?B?VmpMcUZSOGxoZ2EzbWtzdEtPWHQ1cE1OaUtOQ1BIZjlqcWpVOU1mVXoyaWp4?=
 =?utf-8?B?QkRxK2c1UGpwNDhQODljN1daNndrdzR0WFQxRnRHVFJZVVdmU2k0a0RjdlY0?=
 =?utf-8?B?dWtEUmNTR0ZQR3NVdVhCR1ZWMGRuMUNkU0lialkvZmtTWXByTzI4OWIzTWdJ?=
 =?utf-8?B?S0QzaFJrazR3VlYyQWFMTm1CN0ljNkZuS0JBa1FlcWI2c2I4YWZmcVNaK0xx?=
 =?utf-8?B?MzZGM0swYWk5V0JMYUovMzBHNE92RmJKdm4yeGhzU05MV2Y1ajFyVVRDV2w0?=
 =?utf-8?B?MzhMN2l3Q29xdm1wV3djRloxcUZycnI1OTRDa3M5ZitoMXplZ2NtM05abFc1?=
 =?utf-8?B?QUtTTVBhQ0ZFTDZhQzdoRndsTmpvRE1oV1ZFSXdtZkRodm5BWE82aENocXVB?=
 =?utf-8?B?Q0FGNEVCWlp2N2pXVVdzbTR4ckovOG1IZzJHMVlvTGhXeGtmMHdEUk5RZjBZ?=
 =?utf-8?B?MWY4VjhuYzB3Ym9EdnhyR1dnTC81MVBhWEpOVGgzby9kNndyanI0UUVlTHla?=
 =?utf-8?B?RUJ6YVd0ZU80S1VML3V6VjVLMWg4VVUrTm1KL1cyMW5WYm54Ymx1Q2NmWDl2?=
 =?utf-8?B?Z3h3c2t1NHk2c0hXbXhSMDlXQ2FTcFZ2TWl0SGRXaUVMN0Y2MC9DUy9RQVNk?=
 =?utf-8?B?U3p4cldFSUJIQWxlZUxrejFDUFMxRVJmTjJZVFBQOTJjajBsR1IrY0xaMGVp?=
 =?utf-8?B?Y3N0ZFZWOHlXYk1LT3h1S1NyZFZpR2F5NG5naDN1QUQyazlMd0JrWDdVcW50?=
 =?utf-8?B?RHdBeVdkeHdObUNkOEluZGEzS01SUGxaYm5ab2JRclF1WXhzOVNOR3pxVFhR?=
 =?utf-8?B?WWJENU5kbkVQZmtOdDA4OTBRSVV2TEpydFNPL3V6Qmh1dzR6ZVF1aEVQbkVH?=
 =?utf-8?B?R3lRMkVCK3p0dXpHU01hYU84SzcreDlVVWMxQzJsQnk1WEczVHd2U0VZWFhE?=
 =?utf-8?B?TDQ4cXgxMk9IMzQzL0xJdWRjT2tJZTRnVThGOFpCYmJQUVEvY3BMdEdFVFhF?=
 =?utf-8?B?UE5zbmtXV3FmSTkzcDlTUXlaay9sd3FjdENYaWx2R29RVDlVd2M2TDV6UDFj?=
 =?utf-8?B?bFZ1S05raitVZmNvdTRibXpWVGN3Z25IcmNJemlqVE05eTUrbUJLc3JpMUhV?=
 =?utf-8?B?WnFYY1NSWmJ1SlJFUThIdGV1dWduV2g1UHYwSFR3eEIzZUc5NTVJTnpOeWFz?=
 =?utf-8?B?b3prOFRlZmlPZ3llRndFK2hzRXcxTFZWdWt2dTdobFdhR3RobGI0RXIvbExZ?=
 =?utf-8?B?bzV6czZlTDV3bHZoaXBSZ1A3Z3dSck5XdGN3QWZ4L1pwV2c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0P195MB2484.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SDFaTUJ2Z2QwRldBN0tpREdUTDZiSmUrNVlTV3Q4K1pFbEp3NWlzVjlOOVoz?=
 =?utf-8?B?WGVPR3pFd29jZzQ4MFZ6dE9DWlg1WkZWcG9jTlJQem5STnh6R3Nod1JqYmJV?=
 =?utf-8?B?SjdJNXV0L0hzSTlHS3pZZ0U3MW5Zd0QvbzNIalNlTmZJQklkd1hieGN1S2Vt?=
 =?utf-8?B?WVNaMXA0cGVCTi9EZEdTWTE3dWNQK0IrU2tveXN0MDhTckpkSmRTbkhpYkZR?=
 =?utf-8?B?bFVGcnI2eStRSmlpWE5qVkR2THdScnROaVdRTTBhWEdJVENyMlNaYUpSbVl2?=
 =?utf-8?B?SGlHRi9YL0hXVDNyL3lEQjdRMVErOXFJb2N0eThZQ2o4eTNQZDJkTVFXMUFU?=
 =?utf-8?B?QzB6MTRITGUyYlJmZ0ZCWGlHVC9YZ1hDTDlEeXo1YVRoR1RQcWQzVHJLc2lS?=
 =?utf-8?B?ekE5ZVpwWjZvazhvRW9ER0dGckFOV24xdjd4dzFkb0tKRkdEek9Fcis1ZEZL?=
 =?utf-8?B?TDdMSDMzZU1yaDhWd0hhcWFyd3hIcTNiakRjMmFmNXZTcXdPMGZ5em1yS1lJ?=
 =?utf-8?B?cG94QU8vQ3daSGVvbzlYZkQrZnJmLzdrQkpIUXVxZThLMmVUZEd1bVVzSFRv?=
 =?utf-8?B?Nzd6TytCV2tmZERJWFdUamp2TmFsODNrZTI0U3QwSUhHU0k5VjZ2SFppTlJG?=
 =?utf-8?B?aE51RnNaa3UyVHFrR1Nvd3pUYXp0VUYrUEhnUG5iRVVkdFIxV0FKK1pkSlFC?=
 =?utf-8?B?QTNIYUVnRzNQb2RCcmNkK040TVZWaFp2bnljRTJPRFYwZGtTZ1AzekRYcjN2?=
 =?utf-8?B?QTJSZ3ltV2RweTdsVXVzTG5OM2h4dzlnNk5EZjJuRkpYbHlMWlc2dHF1L0dT?=
 =?utf-8?B?MTAxZkV5cWlnR3JONjBtS3JLM3hyTEZJYWpDTk81TzdWenJzQXQ1UmRmeEky?=
 =?utf-8?B?RG0wempVZ1F3T09lbytXVnNHZnFES3B0c0hLWkJXdDU5ZG1tcVljU0gwTmFu?=
 =?utf-8?B?WG0yQTBkL3VPR0RXOGxldzUyMmpGSnVLdElwTnlnK1lmcXNGVU1MS1o0UFNE?=
 =?utf-8?B?STlvSnNtUG9RcVd0aUJnRVJMVjF5S3V1aFRzd2tUM1o4ekg5aDcyRzdmYkp6?=
 =?utf-8?B?TDJrMzE5dTJNUjljY2xWSTJhbHFwVEwzL1ZXaW5lMTRlT1pTdTN2MkVIYmhk?=
 =?utf-8?B?M0pTL1VoTFFsYXdjN2pNWHRnb1hPUXFpeWJqdWRGOHk3Z2lPWGhIMlhObE1u?=
 =?utf-8?B?SHZKWCsrbVFxZVBwNldkdlZ4S1RZVVZDSnhsd3NPa3FCdEwyMnV1bHQyTVA4?=
 =?utf-8?B?RzRSKzg5cWllMUhSbFpXemU4SnVwVlBXcmdhempHQXhFZHI2SklkZndGWkdl?=
 =?utf-8?B?TGJlRXNFMzZ4ZzNSZ0VVT2hkSjVzY0lCOEN0c2RXRXA3NTRXdUxkeWRXb3FI?=
 =?utf-8?B?elhMdXhXNkZRWnl0NXZLSFRuOTlkQzY3K3JsSFNWaTdKbVJsNXQxTjByK1Ny?=
 =?utf-8?B?THlCdkhFV3RRZGJITk1xUFNmUTBhc3h1Zjljb0hjaUJSNUxOb0xMYW9VeWFM?=
 =?utf-8?B?VW1IWEMwd1dMc29udURoQzNaM29FUjFoYlBkRmJmMFMzZ0dtaTBSaG1ieklT?=
 =?utf-8?B?ZXc1eW04VzRIOWt6Zk1acUhVdWx0MGdTREI4QnpZRGsyL0l1dVg2QUVjemlv?=
 =?utf-8?B?dHVkbG1uK0d5T0dsUERjWUxBZGhuUlQ1NS8yZHdETFpXRVZGRVZmNEV0K2Qz?=
 =?utf-8?B?KzhGSDdqVU5kbmM5eFZsdXBtYXFHL1ZmREJ0dFhjcEdvSEJJSEFOTGxjT0Vi?=
 =?utf-8?B?ZmxKbHJ6bnhLNVpEN21jSU5UcHNBN0NQWXE5L1VNeGs2dnNkOGsvSjZYUytH?=
 =?utf-8?B?ZlkrcjR1RUp5bEZPZjBNNnYvSGdZeGEwSFlmUEs4dE83NE4rSWU1amtvMTdh?=
 =?utf-8?B?Zy9xMHpMKzhiTXBiNU1YYzE1bGpqNXQrZWx4akk4U3F4ckh2bWt1K3J1WVNQ?=
 =?utf-8?B?dk9Dc2d2UG9yRUNnbkYwUDVmcjhTc2psYUt2UkdiK0tLUjZyekVQQkNCUkU4?=
 =?utf-8?B?RHVLd2Z3ZU9iZHdtWXQ5dWhTOUJZcU1VWk0wR2FLTkZSZm1wK0RQRW1SdGZp?=
 =?utf-8?B?UGFsUHBtTnkwMkdtTzJaQlhLWGhZMEV4eWtMaUtpMVJ2RGMwd010RHVXZkcx?=
 =?utf-8?B?UVJrTENmZlZRUjNjODY0MlI5ODVaVzFLcVdwbmJUOHRXOTlBOWdFeHhBYVA1?=
 =?utf-8?Q?Gy19HJrF8PE6YFQbWK7G1Vw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D18986A4AEE55D4FA02046F59A814044@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ad154b43-5969-4f1b-a362-08dd3f77de0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2025 08:43:41.5392
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L2omLBavG4FqH1fsHbtU5g78KsZPFMLptScmzW6R3hqSEtaBqBIGntyk9Qk5YhPALB9Gh/Oiw3MBDBg2oKuqAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P195MB1794
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_004353_541162_7591A4F2 
X-CRM114-Status: GOOD (  13.91  )
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

SGksDQoNCk9uIDI3LjAxLjI1IDE4OjI0LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiBP
biAyNy8wMS8yMDI1IDA3OjU3LCBEYW5pZWwgU2NodWx0eiB3cm90ZToNCj4+ICsmbWFpbl9zcGkx
IHsNCj4+ICsJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4+ICsJcGluY3RybC0wID0gPCZt
YWluX3NwaTFfcGluc19kZWZhdWx0PjsNCj4+ICsJdGkscGluZGlyLWQwLW91dC1kMS1pbiA9IDwx
PjsNCj4+ICsJc3RhdHVzID0gIm9rYXkiOw0KPj4gKw0KPj4gKwlzcGlkZXZAMCB7DQo+DQo+IE5v
ZGUgbmFtZXMgc2hvdWxkIGJlIGdlbmVyaWMuIFNlZSBhbHNvIGFuIGV4cGxhbmF0aW9uIGFuZCBs
aXN0IG9mDQo+IGV4YW1wbGVzIChub3QgZXhoYXVzdGl2ZSkgaW4gRFQgc3BlY2lmaWNhdGlvbjoN
Cj4gaHR0cHM6Ly9kZXZpY2V0cmVlLXNwZWNpZmljYXRpb24ucmVhZHRoZWRvY3MuaW8vZW4vbGF0
ZXN0L2NoYXB0ZXIyLWRldmljZXRyZWUtYmFzaWNzLmh0bWwjZ2VuZXJpYy1uYW1lcy1yZWNvbW1l
bmRhdGlvbg0KPg0KPg0KPj4gKwkJY29tcGF0aWJsZSA9ICJyb2htLGRoMjIyOGZ2IjsNCj4NCj4g
VGhhdCdzIG5vdCB0aGUgZGV2aWNlIHlvdSBoYXZlIHRoZXJlLiBZb3UgY2Fubm90IHVzZSBvdGhl
ciBjb21wYXRpYmxlcy4NCg0KSSB3aWxsIHJlbW92ZSB0aGF0IGRldmljZSBmb3Igbm93IGFuZCBz
ZWUgaWYgSSBjYW4gZmluZCBhIHN1cHBvcnRlZCANCmRldmljZSBvbiBTcGFya2Z1biBvciBzaW1p
bGFyLCB3aGljaCBJIGNhbiBhZGQgbGF0ZXIuDQoNCi0gRGFuaWVsDQoNCj4NCj4NCj4gQmVzdCBy
ZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg==

