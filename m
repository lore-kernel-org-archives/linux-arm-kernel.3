Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2341ECDB479
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 05:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=feDfEtX/9kQs2f+wxAQHO2e71fm72OqRRtW4u3183hs=; b=E3+S8bA2hohkxvFRsTuOIvT0C7
	1mNTNctpwI0zqo1GzqUJCHcoYvbKbhS3VSOK0Xn/e6ufnAPKthMIGUmG0eXMM28/ibAssS9hlv/CZ
	k37nsL+dHeBzJytK4oYIh1SK6922tiqNvD2dOxchdOQEjONGdGjwz2h1Syomclmy8LU0oj6THDLYm
	2+1sa9WnIKvumFhOekMU1RD5qxWov+aeIGPaTN4POFBAYnoHJy6Mqgq9iIWd8v2i5R1P/Nk6uLuFo
	hD6GNP9sSRD2xAJIekybPP3JGIKq2aC+N01kuOcorhpYNiQeu9DzhxWTm/GNVcTg+O68ohax6xJMc
	K+hLnC9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcd1r-00000008gZr-2i6I;
	Thu, 25 Jun 2026 05:53:35 +0000
Received: from mail-northcentralusazon11010028.outbound.protection.outlook.com ([52.101.193.28] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcd1o-00000008gZK-18Aw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 05:53:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hxs5DuvYXuChmR4VabOnhPPYQzwA47orlDvV+1PcVnqUvAQtArGxn4/sOrfh8VqSRlb2yw0IVPeLuKt6sya0JDLgQttQjsXxvzft2UGr3znjqA96XL/ZBDJGCVuS2efNrYmNYhXD88c5UGZgDkDCpOiGduP0/E/oB9BBNErNjIaLlJ1zZQZBTk3vP2t95xhuBBLbsisIrqFB33905eq7Tz1oGqA8icqli80AiUIEX0jac8ervRfSUIwlpdv6wCG7+w+3ECndGvo/x7OLQkbJ9Ngt94V+jgFKedT/gqzyYMUEFI/JfYQgrnfU7ngmBiybwVtrHXJO7eU8Cd64zKf02Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=feDfEtX/9kQs2f+wxAQHO2e71fm72OqRRtW4u3183hs=;
 b=Ot/hzj9h3oPfJmnhGN3Jg7kQu7FK/gc8ugRVrk73ZJ4wRjef8CuMrhCuKUP9mpVxp75a6RDsQ4EtbMVTWVXEaPyuyZhAPYzX4R3d3lhqkSuDitDk722zKYwUVeVTvWXfjOtCLyxx2ovuZ5qjGHoyiLYYpwmVSVcaP0qSWRF8YLnN5/hByEP5bNCiGb5hcWnQsWEGBVBVHt/Ws/pkkE2eI55f01mSgA6p1/ks2rZpmYAipRq3Vd69Go359U5fJOBFbN3qauA1a0eA7Pk14Xx5FlLBzWZM+9OuUT7GPOb7G4+W3IuHl0egrhGsM35jAqKNX02dcNcE9VI8ALbJJJ/nPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=feDfEtX/9kQs2f+wxAQHO2e71fm72OqRRtW4u3183hs=;
 b=yH/EqiMbHXcTvoWwzpUcmtZBTS0w4iNVoO8nuuh39rM5SOnxkjkHZ17ZfJQRgPxNrgFi2PEnVlwgzckD4VajVwf53Vom/heHUSdtdz8/VHxLJrLAlOG1N5vmqaSivhiskj3lz8RutkNEAqFGg3yTuXc5BSLo59O8CAX8xHfQWK14O7xmf4q1f91PUhIVCM6oMVp7NsCRjcaC71w5vgcJT0lViaqViM8BS8GSnM705hlRN3eq4WrtOAAq3wt1XO8aptwOfc+ahhCyO9yecRd6s6l93U8juWTj4DWEFah0qzP/gFiOWpGVr5BHYHHeYcT70YgFvAgfhY+okvWB+GpWJQ==
Received: from IA3PR11MB9014.namprd11.prod.outlook.com (2603:10b6:208:583::17)
 by SN7PR11MB6703.namprd11.prod.outlook.com (2603:10b6:806:268::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Thu, 25 Jun
 2026 05:53:25 +0000
Received: from IA3PR11MB9014.namprd11.prod.outlook.com
 ([fe80::13c0:2f12:94a2:8dc8]) by IA3PR11MB9014.namprd11.prod.outlook.com
 ([fe80::13c0:2f12:94a2:8dc8%6]) with mapi id 15.21.0139.009; Thu, 25 Jun 2026
 05:53:19 +0000
From: <Varshini.Rajendran@microchip.com>
To: <andriy.shevchenko@intel.com>
CC: <ehristev@kernel.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 03/12] iio: adc: at91-sama5d2_adc: adapt the driver for
 sama7d65
Thread-Topic: [PATCH v2 03/12] iio: adc: at91-sama5d2_adc: adapt the driver
 for sama7d65
Thread-Index: AQHdAv+LPOlGq88v806dGbstYYVO9bZMdHmAgAJTXwA=
Date: Thu, 25 Jun 2026 05:53:19 +0000
Message-ID: <47964463-cfea-4808-80a2-393038c475ff@microchip.com>
References: <20260623105944.128840-1-varshini.rajendran@microchip.com>
 <20260623105944.128840-4-varshini.rajendran@microchip.com>
 <ajrO3-buCfS0vx1L@ashevche-desk.local>
In-Reply-To: <ajrO3-buCfS0vx1L@ashevche-desk.local>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9014:EE_|SN7PR11MB6703:EE_
x-ms-office365-filtering-correlation-id: a694a9c8-ff54-4be0-3a2d-08ded27e0f29
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|7416014|23010399003|1800799024|38070700021|4143699003|56012099006|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info: LHHKmRNFlCMV17fH1jH0vJoGelLHtApKMI8dqLemTcKjThtIOvjHUlHf8oo9psKwvvRlnHwDke+SeW81sJbqe3Ntv80xMzzmX5XIV8ruve2Hf4VRCGJH/lw0UehqEXGBRRhJLtiwE3QhrECvSwZF207F8Cnd57tUayCnaMc7dmS9eHRTAkXKMV7PpZ7RpxtBDFUBxhepVp/GMB/5LKJtB2v/vXJAKqfcfVA5OA0jx4avpBpqZtHvGn86CWRjrY3EjYok0Tv7NvD3dA3TLi+1e5GWgyeJjhVuW2FohP2+wgsaiXNnR6Vf+zKNlHLgkSo3MwjBgLw1nNj4Q5E9+VsWhdjdQxPCCg/A4EyrXfrbVtCDRfhW7dm7kiX+rUQ08vq7xFblD07RGw1jg9ORWP3Rv6+Tp1jwZeBqLQ2XZGPCUbbP/KEDD7n+f5WPwtyJibZ/lFqY+jjULYF2tVtiz7iciIWQ05pjyuyS97Cy+Rq5xAf1LeKuXc7P3MXLIYP5rUf7H9Di4M4vHz+m3LnnT28zamGfUy+RSmNkViBZWJwNIgopWCShnd3wvBzlWyXgxFi9rhF4zB6r9beNmdQ+QWXNRFE7eAaD01Ixzw++6Tp9BW3KufpJNffy9CQK25v3ucre3WuXyQUX/fPCelQbNBpux68HE1FT57QrqK1HxCbI5owffzGtuwW/xBeU4YQbdP7dySeKOATSfL0YXijBKoErEw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9014.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(23010399003)(1800799024)(38070700021)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?amdqZjVXTjZEQ3B4eXdUV1NNcDFiWWpDNm52Z1V2SS9LLzVJK2hOVWtMOWo0?=
 =?utf-8?B?NW9FOEU3TmsrQzRmTVRRaEo3QmVkd0gzNE9DRzRMWjM2WWgvR3hRQnVVMGh1?=
 =?utf-8?B?NkRzZjZpRzczLzVZOWhTaEpEemFnVTBhbkVEL2lud1ZGRUsvdk9OUXdBT2RU?=
 =?utf-8?B?eUtmZEJnWFZYcjlJYVRsR0JOK1BROWFYcFhjb3prNisra2xtWTNEMWlvaGti?=
 =?utf-8?B?MTlScWRCUjFNK3RjV25ya3hydkh6djRELzlKMCs4bDgzSmNOSTJzVk9teEJE?=
 =?utf-8?B?Y1hxS2xiNVJkcjhJcTlhbzhhOGdxUWdQcFpESW9UVnAyV3ZFNC9ZWGxWdzZS?=
 =?utf-8?B?RkpBbWhwOGVtZ0ExUXJNRm90YXBUSi9uaDRXcnhGck0rZk5mWnJRZnNSODFp?=
 =?utf-8?B?QVlPaWh6YzFjbzgxRnpUVTU2Rmdvdzk5dWlkN2ZaUkVRNWw3eStoZ2V3Nmcw?=
 =?utf-8?B?dXptUENHMEVQTnI0cjkvRlhnVlN1eXhQWXB4N2VCOVJNSVV5MmFndGJZR3Iz?=
 =?utf-8?B?WFlZM0JJbnkzaUtHZzFjL3hMeUdSMjNDaWdSb3R6dzdndEhZYWNiMHRSR2lZ?=
 =?utf-8?B?QnJUN2N0UFdKQ2xQWDhZOFg0THAwVE5IWXlaMGl6bVhBSnlDdkZSWHJYeFEx?=
 =?utf-8?B?V0ZUSGZBVVFvQTNTai9NS3pWUnRxWEZxOFlvc09aUllrYUgxdUNVY0FWV0Ri?=
 =?utf-8?B?WCtwTjZUb25xVHRwVlNhTHYyTTdzVzFxVXpFNVBGTStiSjB2bW14VDY1V1A1?=
 =?utf-8?B?eGx1djZ5UDF6U0F2ejk3S2owRi9RVkJQMlpGYStsYVdYRmtYTXE3eDF0WE93?=
 =?utf-8?B?WDNrWE0yQjgySjFlODcrNkYwdi9vRTdSb01BYXlkdk15UFVYeDYyRmMrdGZH?=
 =?utf-8?B?ZXJsTnlpbHBhK3BmWFRETUI1T3BCTU1QaHk2RUl6SnM3eGgzZnovb3dZTE9F?=
 =?utf-8?B?V3EwRUdJUi8vL1ZLLy9vK1NtbDRMNUx4alJJcEhHRGZQNUJNMTBlNERDZXlk?=
 =?utf-8?B?cWVzVXNUN2NNYzdEbW0rMzJCamdlMkJJSFRSVk8ySVZwZHpKVHNweS91TVRx?=
 =?utf-8?B?RFFRU1NLL3pIcjNPTW1SUWhxY3pRNW9QdUtkSzg4TEJjN0EwMG9iT2NYTUZ5?=
 =?utf-8?B?R251MiszRTgzZ1E2YWVMQlFtUDRsNXZ0UHZ5MzhuR1ArNVhrMFFydjJVRTlj?=
 =?utf-8?B?cHp2TENmbERibVgvODRGQS9CaXNmYWRkSGpRK3EvZkZ6TWQwYlNibG5RS1hu?=
 =?utf-8?B?TFZRMEgyMm9LVzNRY3ovRFI0ZUt1S2JhTTc2K0orNWowOGs3V3lhQVJzNWVN?=
 =?utf-8?B?T3h6d1RHSVN4TWY4bHpIRTJUOHNuaWhKSFBGMnVoS2hjUEtEZUVkSjBiR2NF?=
 =?utf-8?B?em8vL0JMeTdLcVhPVDNBZGU0VVBoaWtGK2l6RUwvcTBEandXWUNBdWR3V0Vk?=
 =?utf-8?B?UVJSTVozalkwSEhJZ0Fxdnp5WlF0N3lSdVNxNlhlbTdHNWxBNllFdEM1ck13?=
 =?utf-8?B?QVJmK0hXSGZrTzRLSWc3SGpwVytkck5NUXVDcFBnanM2NWx5bXlWREhHd2Fs?=
 =?utf-8?B?Y3ptTzdLTVI4OURlRmpZUUVpUk1zYVdGOGIxUExnVnJJZEcwRE44b0dLQ2k5?=
 =?utf-8?B?VmZ0Qmozems4RUJHUUVJOVNDQkVLcU91Q0ZQTjNoc3Z5aDFNbHZFd0ZtWFhp?=
 =?utf-8?B?REZoeFpEdWM1M0c0VXp0WGMyV1E5dkJjeDZvQ3doUTFlRTZjTXNOQkhFemMx?=
 =?utf-8?B?NmQ3eU11dSs4a3BBVktZZHc1L1I0MDNBZG8vY05KVHNpZ0x3VG1HUUJDRXRu?=
 =?utf-8?B?cU9UMFErREZnNUJEdnM4NGZYUnpNUTd0aVFCeVBmN0NzUmdsZHRaSHdCUWg4?=
 =?utf-8?B?dzhKMDFWSmtoU014ZUU5b3AxOTRrK0xFMXhaZkdKY3JIM3lrU2RpV0Uzc3lD?=
 =?utf-8?B?UkZqZEhwNTR6T2ZrREc4bFZyS0NpRVQxQ3hLWXJ2c2h3YjZyZVJrdVNVVjdv?=
 =?utf-8?B?TllqTm9MUjEyRmwxb1kwVXBqVXFiZ0ZWYnZMalZLdUVnb21kR2NINDkwSUY5?=
 =?utf-8?B?K3dKS0RNeGNUTEtDVGJHbGlMTXJJUi9rWnRvSzQxVWt2UUFEZmV5amRWS0Zm?=
 =?utf-8?B?VnByVE9pMzBDQlFRUjdJc0kvZ09wRDFiWndLeXNkMWIxb294R0xDdVlNWGVE?=
 =?utf-8?B?ai9aUjNkMlVCSWxGNzRTd0tuNTVtbVUxdE9kdm4zNHZ4cTNCc05QUFJLb3Fj?=
 =?utf-8?B?d01kVFlNaTdEWG1yQ0RwQnAxM0NaRm1jZ3UySDFqcmpYVzVHMEdkTzJCTElK?=
 =?utf-8?B?amgvRjk3c2VPOXNaaTB6Q2RjRnBtZldSWkVvMUNzOEZSR2gwOXJIaVJ3NnZN?=
 =?utf-8?Q?EPkimCJKWCfrV+L4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8480CCDEA79C44BA780F3C9B8ABA597@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a694a9c8-ff54-4be0-3a2d-08ded27e0f29
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2026 05:53:19.4781
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adtbBlU/e9lDNmkIBBq3yjk72Bhr9rTynj19P2QAhv4E7GlIPBgkwBZ1a/njG0JCGu/9w2NnkrdXu0CHzBCj5yA6LUIDrC/yposNQcAWVKh+gjziGpEqFFeLHfQq84vd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6703
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_225332_527221_863CB2FA 
X-CRM114-Status: GOOD (  14.48  )
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

SGkgQW5keSwNCg0KT24gMjMvMDYvMjYgMTE6NTIgcG0sIEFuZHkgU2hldmNoZW5rbyB3cm90ZToN
Cj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRz
IHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiBUdWUsIEp1biAy
MywgMjAyNiBhdCAwNDoyOTozNVBNICswNTMwLCBWYXJzaGluaSBSYWplbmRyYW4gd3JvdGU6DQo+
PiBBZGQgc3VwcG9ydCBmb3Igc2FtYTdkNjUgQURDLiBUaGUgZGlmZmVyZW5jZXMgYXJlIGhpZ2hs
aWdodGVkIHdpdGggdGhlDQo+PiBjb21wYXRpYmxlLiBUaGUgY2FsaWJyYXRpb24gZGF0YSBsYXlv
dXQgaXMgdGhlIG1haW4gZGlmZmVyZW5jZS4NCj4gDQo+IERvIHlvdSBuZWVkIHRvIHVwZGF0ZSBh
IEtjb25maWcgaGVscCB0ZXh0Pw0KDQpZZXMuIEkgd2lsbCB1cGRhdGUgdGhlIHN1cHBvcnRlZCBT
b0Mgc3BlY2lmaWNzIGluIHRoZSBLY29uZmlnIGhlbHAgdGV4dC4gDQpJIHdpbGwgYWxzbyBhZGRy
ZXNzIHRoZSByZXN0IG9mIHlvdXIgcmV2aWV3IGNvbW1lbnRzIGluIHRoZSB2MyBwYXRjaHNldC4g
DQpUaGFua3MgZm9yIHlvdXIgdGltZS4NCg0KPiANCj4gLS0NCj4gV2l0aCBCZXN0IFJlZ2FyZHMs
DQo+IEFuZHkgU2hldmNoZW5rbw0KPiANCj4gDQoNCg0KLS0gDQpUaGFua3MsDQpWYXJzaGluaSBS
YWplbmRyYW4uDQo=

