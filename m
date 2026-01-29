Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F13CD46BF0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 01:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lhyJZndUy+DLqnJo2JW+3gAcDCKpkTRWHXCwUVTqo6I=; b=qAvfGOb9QX7fi0NhYlgcjJvYE0
	1gf9mwQqdC+S4iLp1HZBlP82nzw2KgaQPLL4JX6HMNPesD4/B7wpjz9DzgKut2A7XYLwuB00hzb7z
	xh67hQtgUOsOBNnXXqChqHxItrrcjW5kA57b30pIV8nfVz06x0aZG/IACp0g9wVYZUsN/rEl+9sEl
	giL+UA5XUk6M4ias+3iFiFIpNYYvi+hSqixJGiDycbghdKGU+IiB8F4JhZpe6CSIdJ/TzzHq67E1m
	LPOtM2j+oGbONmsdghKw+uRZOy/ai094dnwV6sMuSfblrI14RITGs+1glML+f7o7M/a/DBnaro82V
	45zbgwAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlHIy-0000000H5jc-1F9c;
	Thu, 29 Jan 2026 01:58:44 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlHIu-0000000H5hx-07z2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 01:58:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UlaWeXG7BDE9CeB6OwHkEODSwZQl9y06Yabk3lE42ynUvB6uX8YWUzmnHmRDRlFidKLrtj5/USTzjlOhkwDhnUNveA9m1l2D17VGcwrG+Cguc3pNCRHHILtfjrc7Fmul5H3fa6gPlMukT2tjBB+sLqzHo1gh1so/M/TLdEJmeqfcBijVa0X/uIqH4Ba4a9n+HIUwRIBJ39ilPcAi9W85J8+b0dPCxJzeX80qbBdoQNpYpld3HFmwrN/BVA7N5WChIAb4x5ZxXWYiv8Ns5ep1fYc2zARDn9lGwjm28YLWe6S538HPXDNb4gnQj5LWnrHax13CSuDoOgHvFyef2mviMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lhyJZndUy+DLqnJo2JW+3gAcDCKpkTRWHXCwUVTqo6I=;
 b=SoUGjWFXZzz/uVaNmzNqn3z5W0BQctxzM69iNUu815QL8eTMg6d7gOBgwOxCU46NkS9MPtr7tBLsDSnTSfWQUQKI9v9Jg4KgzpcGQJnZ+vfKBiikwCAhykkHbTaSn2FGPgtUq6YemQfuZuYLcOzP9V4E0LMirudtdwHlpV5pjp39MCb2Tg3je3zehCklfQ0MmWtKhaPlRE/2GFhcf7MpdEeB35BqSqAvHljBdpPS07QgrURj4rKEDIv7rCbaH8QfE62OgTF/OtoSOzdilVV7LVUmLgqQHztqlYNCzS/Npygy4J3bnmDMFum9rwSwTr68qEvpEE6yo4tJnLkeA31B8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from TYUPR06MB5876.apcprd06.prod.outlook.com (2603:1096:400:35e::5)
 by TYUPR06MB5946.apcprd06.prod.outlook.com (2603:1096:400:347::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 01:58:34 +0000
Received: from TYUPR06MB5876.apcprd06.prod.outlook.com
 ([fe80::6718:b716:70e:9b32]) by TYUPR06MB5876.apcprd06.prod.outlook.com
 ([fe80::6718:b716:70e:9b32%6]) with mapi id 15.20.9542.015; Thu, 29 Jan 2026
 01:58:34 +0000
From: Gary Yang <gary.yang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "lee@kernel.org" <lee@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, Peter Chen
	<peter.chen@cixtech.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjQgMS8zXSBkdC1iaW5kaW5nczogcmVzZXQ6IGFk?=
 =?utf-8?Q?d_sky1_reset_controller?=
Thread-Topic: [PATCH v4 1/3] dt-bindings: reset: add sky1 reset controller
Thread-Index: AQHckDmQmNn/iZarbEiqIYnO2qvCnrVnWb4AgAEGcmA=
Date: Thu, 29 Jan 2026 01:58:34 +0000
Message-ID: <TYUPR06MB58769733681E924DB1CD8DC2EF9EA@TYUPR06MB5876.apcprd06.prod.outlook.com>
References: <20260128093611.1932770-1-gary.yang@cixtech.com>
 <20260128093611.1932770-2-gary.yang@cixtech.com>
 <556bf15b-727a-4eff-92c7-9fc6c744047b@kernel.org>
In-Reply-To: <556bf15b-727a-4eff-92c7-9fc6c744047b@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB5876:EE_|TYUPR06MB5946:EE_
x-ms-office365-filtering-correlation-id: 63175222-fe5c-4adb-12ba-08de5ed9e8f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?QlRmMkFnV3VoZEUwSFlQMkIrT1RGN25UdnBOb3BnRWRPcktVZDErWVR1NFRE?=
 =?utf-8?B?Z0ZwNXJ2MVluR3grbEt0TjJzU0Q1RVFxaENQemVTWlc1eHlhQkdOeE9uWkJH?=
 =?utf-8?B?bWpBWTdSQjE4RHdKUkpPS242RUYvQ1hKdnBYdEx6a0tVcVQzTzZvZFdwUStx?=
 =?utf-8?B?RVNta2dtTk0zMVBuYjFEMC8rT3E5N1lIV09pU0ZkTWlNV2tXMllnOCtCSHFi?=
 =?utf-8?B?YlAwQ0VVcXdmL2l6a2o1SDU5VGMwRWdHZnhJNEhMdkZZYnZsSjJFeGdyZkQ0?=
 =?utf-8?B?L1dYQkZTRVBINU9EZVo3T2FFcVhYcnVJVHh2U1ZZVUx4V2hsZkgvU2YrVHZS?=
 =?utf-8?B?ekNVTHk2eUFHbzRCY2IyNEEvZlJBaDZia0lMRmR2ZC9tUm5ieTM0akxIUG9Y?=
 =?utf-8?B?cHhnOVBNM0xIZ3NhbVBtdlk5SXZ0cURCQXU4NlV0REtvK3BJQXlOanRrcjR6?=
 =?utf-8?B?WHdxLyt2SUowck5LUTRZSEFYOUZFK0MzSFQwdDM0THYrUWdKQWlGV3RQdWRZ?=
 =?utf-8?B?QzhLdExxREFjd1c3VVV1QXF4TTFYd045cTNubzZJL3RzK2IybmVZMmphUE5Z?=
 =?utf-8?B?OGJ5d0hjbVhRYlhoSTI0Q3ljTGM4SHN2TWR0N0VyUmVkTmRhYndaWVhvTlFL?=
 =?utf-8?B?d2VqRjQrZmFBSUhQNWtRT1ZFMUp1SG9BZFBTUlhnSWNxSVVubk1OT243dlo5?=
 =?utf-8?B?TDlFMjhDUlNURjhBZWtIbVF0T0xtUE1WUFR3azlyTk5ZT2RQS2ZudUxVb1hX?=
 =?utf-8?B?emdUV3ZKOFRDb2pwR28xRVdmTDJxUER1TVRhOGJ4d1RJNktmOUhIcHZQTjND?=
 =?utf-8?B?MUltSUpiSU4zcGtlZWsrS21UZXBnUENrcXBoR3hXYTFvQTdtcVRrNFZ6MFlL?=
 =?utf-8?B?OWlQQUkvTmpWbXFRUEVzUWVUdkVXZ2h0VXJ3bkZKNXdMVlgzVGpjemMzVTdV?=
 =?utf-8?B?REl5dkhKRS9FZG50VlBxUVNPUlMya2RGUnZsVFgzcWFYTE9QVlZGbWpHV25F?=
 =?utf-8?B?WVBHaWNvZ0IzMUh6OTFSQitLRlVwbVV0VkpIY2hLVlJtMmJuN3VxSjI5WENm?=
 =?utf-8?B?ZUkwdzJDSzhoR2VlVG9RR2tscUlZNjBqazJsY3ozcW9ibG8yNGJUWExpcmhu?=
 =?utf-8?B?a3o3Zzlxb1ZCdGNoQXpQQlVsUjFCdGtDdDVoUUcxdnptY3NxZ083dGlhM1lJ?=
 =?utf-8?B?WVJ5SDA1T3kzbS9sTEFwQy9PV0N6aWxyMGlwNHFoWkRZdDZuWVp6ZEVaWHFS?=
 =?utf-8?B?RkZZZ2ZTZkUzSUdNMHJYcWdTTUwrRVNDMU5EcjNoVFlyTnNxTlZhS09RbGZj?=
 =?utf-8?B?QjNZcVU4c0JoelpROWJkRk1HdU80Y2FMamsrRVNSdEMwVFgrWW1yNCtsN09w?=
 =?utf-8?B?MlhqaEFCMU9iV3U2SnNsZHdDN29xSVNWajdzQTdUUkF2Ti9URXdmV09UZDJN?=
 =?utf-8?B?b3FQako5aDM3dzJka0FLdFAwR25lOGJDMUp6VXBJc3k5UkNSK05wbTRCZUdC?=
 =?utf-8?B?MUtJeXhac3lHUG5jRDY3YWpmOVpSV0dXd2w1VU04WEpjTk1qaDBzUFlsdXFO?=
 =?utf-8?B?anlBN2wwc01tSmRwdElkOXZlVTM4QTFVVFVkYUNFME9FWkgyUElDSVNqbzE5?=
 =?utf-8?B?YUNLL1czY2NmZEhVYmJoWUdZSlBPRlpaOXI2RC9GbFVtU0tQM2xCcDNrMUZ4?=
 =?utf-8?B?SXZyUk1xK1ppNEh5ZmFFd2xrbm4zM09xc3djKzhiaFFBdVhFWW1TSVppamd4?=
 =?utf-8?B?UTRBME0xY01BLzRsYW9Sa1NjbWdzdDZEWUNmaWF6QWppYmpuYUpQVGg1Z08y?=
 =?utf-8?B?MFpzSVNqa3g4NGN1Rm5oN1pTSXV3aGRTdHYzMjZUSG1wdVRRbGFqSHBKWkpv?=
 =?utf-8?B?QkF6QW5EYTdnbFJEcjd5V0xOenczMjF6MDF1d3dyWFQ1TUpobUVBWjFpSVc4?=
 =?utf-8?B?YXR4MnpKUkFMck1nTVU1SmNxeHFvblNZNTNoSXB4TEJTYW1SNVZ4YlFFVXBr?=
 =?utf-8?B?ak44SFM3WnVNa0liZ3dvdTNGK1R3aW9DbXE4MzB3UFJNMjEvOUNpRDIwdXk3?=
 =?utf-8?B?dGhPZ0xaeFNwTmNDMENxSUpHODRYZDVxZTFHQkhWZXBJV0ExMWpsd1ZQUEVh?=
 =?utf-8?Q?X81ptpsP9KaMnuG8i8a6z6RCM?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB5876.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U096TGtPVW1laHA0Y2wzcVZlbDNQbkxud0EzRFM0VktBVnQwWUluUXh2c0l6?=
 =?utf-8?B?VFZ4Njh3ZXZpWEoydlViZ3FoQ1lxTWxPVUdyWFVtZVNEcGJoR0Y1ZkVmK0Nm?=
 =?utf-8?B?U0IzZEJ6SVRWTGtJSW15bGQzS2twNFdhUzgyYStPVzcyc1FUM1M3cDRkRGVo?=
 =?utf-8?B?OXh3YWdETnEwVjd2TU5tMVJWNlltUjZQZk54VE4vdzVTdDFsa0pYMWFlYmRn?=
 =?utf-8?B?VGVzeTdLYzFkTVJoTFZ0QjdvOWR1UGdmMFZ3Tm9EemR0aEREZ1ZjNDJJMDZm?=
 =?utf-8?B?T0JrSlVFRytQU3lNZEh1OTVCTC9JK2oyMlVkRGNWV3VLbVVhOGRYTWprU3BM?=
 =?utf-8?B?cFowQ3NjVUJ6NUphTjVqUTYrcDBTM2hCam1SY0RXNUJuQWZGbU1CblhpTTd1?=
 =?utf-8?B?WU12dUc0a2FGRWJlYUVCMTVxeXhJZVZKTWRNcE5CdWcvY2JYbW1yVFptSEVl?=
 =?utf-8?B?SU9NMGxyQllTTlN2Wjd1UFpDUC9aK29YdTQyNXBNSGN6TFpJSlhDTmlyMjdL?=
 =?utf-8?B?dGV1RzNiQmlPT1hqb3ZsdmV4VEFYTmVvK3Z6dEtzWFp5SFV2OGhvVnk0UGVT?=
 =?utf-8?B?N1lwUnlYbjBGcDdwN3JTSGVudGNGb1plNW04VWJrWGVqMWxmRkNkbTRxNWFF?=
 =?utf-8?B?dUNJWGVwRWt4Nm5mZTlkSEs5ZTBhb1NUYnFRZjFjYnRhbnJsK0FHcnpsVTh6?=
 =?utf-8?B?dGV4Skt0VCs3ZTdzWithemZZOUZHTTZBdnR4WXlDSFFJREJCTEdEaW9IZzE2?=
 =?utf-8?B?SGdaL3NtN1p6QU50b25ZZ0xLZUp5WGFNeWN4NTl6VkUrQTBlVWVjbGVLMU85?=
 =?utf-8?B?OFlvbzZaQ0dxSmw1ZklJa0xDczhkYjVGUTBxMldGd1lyZFhSS0dDZzRNL1gz?=
 =?utf-8?B?N0VkNnBieWUwR25JcDYrZVVaUW1OMDBLWjFibFM0USsxakRGQ09lMkRwSGNm?=
 =?utf-8?B?SW9IUmtKcGdVeXFqVWlaMFlrOGd6TlBUajVZeXdPRU9veDIrU2V5a0tORGwz?=
 =?utf-8?B?YTZZK2l1bE9ZOEo3bVdMcVdMenRoMWJ2YmJIL1N3aHMydDVvckxzcWZmbzJV?=
 =?utf-8?B?QmZ6M2JCczZmQnJTYUVJc2F2aXhDcFpaM2FHUDcxUjIvTFd5OWxvaFZGTU9t?=
 =?utf-8?B?UTlXMFF4dkNvR2hpaXc3TWRxNVBEMUZrWk1xMjNZdUdDWkV0VG5EeW9FVXNI?=
 =?utf-8?B?TVZvdnUyaG1FTXoxZFhDSVVuYmRlbSs4L3RsL2N4bG9nd0JBT3pNVVpvTGZB?=
 =?utf-8?B?cktNR1JTQ1U3T2RabVUrSndqcjRJRTdyMm1HWklmcmlRNjdqcG92cytxUFFy?=
 =?utf-8?B?aCttL3VmUVlxMzNIZTM4d0JpbTFOVVMxSUxOUmJQaEdmU0UxN1pzRkt0NXAx?=
 =?utf-8?B?VFY0OFFhK3VtcTF1d2dwM2NyWUVpZ1B3TEQzaDgzb3AwbVAyd2VHTU9wenBZ?=
 =?utf-8?B?WENvZkxNSlQrQk5EUGo2RWlZNjRrSVdFckVsdGlmNlo2eWgyYkpEME80R3Vi?=
 =?utf-8?B?NHIvL3ZmQnA3QTBkUGxTTlJrdDFwMkJ2VWdaODA3MnFoNW5YSFBxRFNFWWZN?=
 =?utf-8?B?REFNVDBQVjlnOUlyZHRTdWJGdEVVUjFjWjhOYlMweEhTRUZBNXh3VHNyVUNF?=
 =?utf-8?B?dVlYaCtyZk1PZEFIa054dW1SdEt4OU90ZzhHWG8xNW1vTUtKZUVzV3RkNnVB?=
 =?utf-8?B?MkR6ZTBzbFhQSW8wSjF0LzRMbmFEaDhGK05sOVpXMXNPNG44WlpQUnV3TE91?=
 =?utf-8?B?ZS8yOTJ5NWN0ZTJlU1FFK0R2SzgzNXlrSlJ6UHh2dkdGUGphNnY3Vkx0MEp2?=
 =?utf-8?B?TUtrL1NvQ3BHUVcyVFdJMVV1aGVkWmd4QzZiVkh2UVI3YnYyb3EyMXpYSGgz?=
 =?utf-8?B?eUw5SXVXa2psQnZyYkdMamFnTjk1VkhDSWNoMXh1WmMwSWJxNUVhNkdzcXRQ?=
 =?utf-8?B?RHpzY0RodHVxQkVlamlmVTI5R25CNk9IRitwZGluZngydHpRL08yRityRkd5?=
 =?utf-8?B?RHFTT0VITVZxeE42WWw0TlRnWjB0NGpSdWRqSHBicUp2WExaV0ZJaXludHRk?=
 =?utf-8?B?MGhMRkV3UzFnb1pKZXMyc2FkM21QTHJZS2J4Rk1oSU5UbFZxVDlBNEJzWkZ1?=
 =?utf-8?B?SGdQbGVyeU9IZmI3M01nUWgyL085VmFrRytVTVhqVFEzWWl5N2hYU0pzdk1O?=
 =?utf-8?B?Yllab2hndlp6SnM1ZVZkTjhPVFo5NkJ0Y3RkWmNYbXFIdFBqTnJJWThTVmhF?=
 =?utf-8?B?eGs5cWU4UEIwdTUxN2RzU2h4NUJ5RFI0V3o2ZkRrc0NSYU51Q3FRN05QVkp5?=
 =?utf-8?B?Rlg1N3ZaZVUzeUhzNlhWZTQwL2MveWxxbTRCamxnWVNSVHlQcnVZQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYUPR06MB5876.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63175222-fe5c-4adb-12ba-08de5ed9e8f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 01:58:34.2071
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tWYwdKCzspTfirgaAG1UcVq0Mf9J2BCNdrp3JhHMfJthWIzEpNZfCIzT3VtmF66Z2GC+bCnE2KkP8A0LP7oWFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB5946
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_175841_278692_C268880F 
X-CRM114-Status: GOOD (  21.62  )
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

SGkgS3J6eXN6dG9mOg0KDQpJJ20gZ2xhZCB0byBzZWUgeW91ciBjb21tZW50cy4NCg0KPiBFWFRF
Uk5BTCBFTUFJTA0KPiANCj4gT24gMjgvMDEvMjAyNiAxMDozNiwgR2FyeSBZYW5nIHdyb3RlOg0K
PiA+IFRoZXJlIGFyZSB0d28gcmVzZXQgY29udHJvbGxlcnMgb24gQ2l4IHNreTEgU29jLg0KPiA+
IE9uZSBpcyBsb2NhdGVkIGluIFMwIGRvbWFpbiwgYW5kIHRoZSBvdGhlciBpcyBsb2NhdGVkIGlu
IFMwIGFuZCBTNQ0KPiA+IGRvbWFpbi4NCj4gDQo+IFBsZWFzZSB3cmFwIGNvbW1pdCBtZXNzYWdl
IGFjY29yZGluZyB0byBMaW51eCBjb2Rpbmcgc3R5bGUgLyBzdWJtaXNzaW9uDQo+IHByb2Nlc3Mg
KG5laXRoZXIgdG9vIGVhcmx5IG5vciBvdmVyIHRoZSBsaW1pdCk6DQo+IGh0dHBzOi8vZWxpeGly
LmJvb3RsaW4uY29tL2xpbnV4L3Y2LjQtcmMxL3NvdXJjZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mv
c3VibQ0KPiBpdHRpbmctcGF0Y2hlcy5yc3QjTDU5Nw0KPiANCg0KWWVzLCB3ZSB3aWxsIGZpeCBp
dA0KDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBHYXJ5IFlhbmcgPGdhcnkueWFuZ0BjaXh0ZWNo
LmNvbT4NCj4gPiBMaW5rOg0KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTExMjQw
NjMyMzUuOTUyMTM2LTItZ2FyeS55YW5nQGNpeHRlY2guY28NCj4gPiBtDQo+ID4gU2lnbmVkLW9m
Zi1ieTogUGV0ZXIgQ2hlbiA8cGV0ZXIuY2hlbkBjaXh0ZWNoLmNvbT4NCj4gPiAtLS0NCj4gPiAg
Li4uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3N5c2Nvbi55YW1sICAgICAgIHwgICA3ICsNCj4g
PiAgLi4uL2JpbmRpbmdzL3Jlc2V0L2NpeCxza3kxLXJzdC55YW1sICAgICAgICAgIHwgIDQ2ICsr
KysrDQo+ID4gIC4uLi9zb2MvY2l4L2NpeCxza3kxLXN5c3RlbS1jb250cm9sbGVyLnlhbWwgICB8
ICA0OCArKysrKw0KPiA+ICBpbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0L2NpeCxza3kxLXJzdC1m
Y2guaCAgfCAgNDIgKysrKysNCj4gPiAgaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9jaXgsc2t5
MS1yc3QuaCAgICAgIHwgMTY0DQo+ICsrKysrKysrKysrKysrKysrKw0KPiA+ICA1IGZpbGVzIGNo
YW5nZWQsIDMwNyBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZXNldC9jaXgsc2t5MS1yc3QueWFtbA0K
PiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3Mvc29jL2NpeC9jaXgsc2t5MS1zeXN0ZW0tY29udHJvbGxlci55DQo+ID4gYW1sICBjcmVh
dGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9jaXgsc2t5MS1yc3QtZmNo
LmgNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvY2l4
LHNreTEtcnN0LmgNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbWZkL3N5c2Nvbi55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbWZkL3N5c2Nvbi55YW1sDQo+ID4gaW5kZXggNTVlZmI4M2IxNDk1Li5iZTg2
NGE2YjhlZmIgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21mZC9zeXNjb24ueWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tZmQvc3lzY29uLnlhbWwNCj4gPiBAQCAtMTcwLDYgKzE3MCw4IEBAIHByb3BlcnRp
ZXM6DQo+ID4gICAgICAgICAgICAgICAgLSBjaXJydXMsZXA3MjA5LXN5c2NvbjENCj4gPiAgICAg
ICAgICAgICAgICAtIGNpcnJ1cyxlcDcyMDktc3lzY29uMg0KPiA+ICAgICAgICAgICAgICAgIC0g
Y2lycnVzLGVwNzIwOS1zeXNjb24zDQo+ID4gKyAgICAgICAgICAgICAgLSBjaXgsc2t5MS1zeXN0
ZW0tY29udHJvbGxlcg0KPiA+ICsgICAgICAgICAgICAgIC0gY2l4LHNreTEtczUtc3lzdGVtLWNv
bnRyb2xsZXINCj4gPiAgICAgICAgICAgICAgICAtIGNueHQsY3g5Mjc1NS11Yw0KPiA+ICAgICAg
ICAgICAgICAgIC0gZnJlZWNvbSxmc2ctY3MyLXN5c3RlbS1jb250cm9sbGVyDQo+ID4gICAgICAg
ICAgICAgICAgLSBmc2wsaW14OTMtYW9ubWl4LW5zLXN5c2NmZyBAQCAtMjU0LDYgKzI1NiwxMSBA
QA0KPiA+IHByb3BlcnRpZXM6DQo+ID4gICAgICAgICAgICAtIGNvbnN0OiBtaWNyb2NoaXAscGlj
NjRneC1zeXNyZWctc2NiDQo+ID4gICAgICAgICAgICAtIGNvbnN0OiBtaWNyb2NoaXAsbXBmcy1z
eXNyZWctc2NiDQo+ID4gICAgICAgICAgICAtIGNvbnN0OiBzeXNjb24NCj4gPiArICAgICAgLSBp
dGVtczoNCj4gPiArICAgICAgICAgIC0gZW51bToNCj4gPiArICAgICAgICAgICAgICAtIGNpeCxz
a3kxLXN5c3RlbS1jb250cm9sbGVyDQo+ID4gKyAgICAgICAgICAgICAgLSBjaXgsc2t5MS1zNS1z
eXN0ZW0tY29udHJvbGxlcg0KPiA+ICsgICAgICAgICAgLSBjb25zdDogc3lzY29uDQo+IA0KPiBE
byBub3QgY3JlYXRlIHlvdXIgb3duIHN0eWxlLiBDaXggaXMgbm90IHNwZWNpYWwuIFRoZXJlIGlz
IGFscmVhZHkgYW4gZW51bSBmb3INCj4gRVZFUllPTkUuDQo+IA0KPiA+DQo+ID4gICAgcmVnOg0K
PiA+ICAgICAgbWF4SXRlbXM6IDENCj4gDQo+IEluZGVwZW5kZW50IHBhdGNoLiBQbGVhc2UgZG8g
bm90IGNvbWJpbmUgdW5yZWxhdGVkIHBhdGNoZXMgaW50byBvbmUuDQo+IA0KDQpXZSB3aWxsIGRl
bGV0ZSBhbGwgY2hhbmdlcyBhcyBDb25vcidzIHN1Z2dlc3Rpb25zDQoNCj4gDQo+ID4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZXNldC9jaXgsc2t5MS1y
c3QueWFtbA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jlc2V0L2Np
eCxza3kxLXJzdC55YW1sDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAw
MDAwMDAwMDAuLjQzMjNhY2RjMmM0NQ0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVzZXQvY2l4LHNreTEtcnN0LnlhbWwNCj4g
PiBAQCAtMCwwICsxLDQ2IEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwt
Mi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKSAlWUFNTCAxLjINCj4gPiArLS0tDQo+ID4gKyRpZDog
aHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvcmVzZXQvY2l4LHNreTEtcnN0LnlhbWwjDQo+
ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1s
Iw0KPiA+ICsNCj4gPiArdGl0bGU6IENJWCBTa3kxIFJlc2V0IENvbnRyb2xsZXINCj4gPiArDQo+
ID4gK21haW50YWluZXJzOg0KPiA+ICsgIC0gR2FyeSBZYW5nIDxnYXJ5LnlhbmdAY2l4dGVjaC5j
b20+DQo+ID4gKw0KPiA+ICtkZXNjcmlwdGlvbjogfA0KPiA+ICsgIENJWCBTa3kxIHJlc2V0IGNv
bnRyb2xsZXIgY2FuIGJlIHVzZWQgdG8gcmVzZXQgdmFyaW91cyBzZXQgb2YgcGVyaXBoZXJhbHMu
DQo+ID4gKyAgVGhlcmUgYXJlIHR3byByZXNldCBjb250cm9sbGVycywgb25lIGlzIGxvY2F0ZWQg
aW4gUzAgZG9tYWluLCB0aGUNCj4gPiArb3RoZXINCj4gPiArICBpcyBsb2NhdGVkIGluIFMwIGFu
ZCBTNSBkb21haW4uDQo+ID4gKw0KPiA+ICsgIFNlZSBhbHNvOg0KPiA+ICsgIC0gaW5jbHVkZS9k
dC1iaW5kaW5ncy9yZXNldC9jaXgsc2t5MS1yc3QuaA0KPiA+ICsNCj4gPiArcHJvcGVydGllczoN
Cj4gPiArICBjb21wYXRpYmxlOg0KPiA+ICsgICAgaXRlbXM6DQo+ID4gKyAgICAgIC0gZW51bToN
Cj4gPiArICAgICAgICAgIC0gY2l4LHNreTEtcnN0DQo+ID4gKyAgICAgICAgICAtIGNpeCxza3kx
LXJzdC1mY2gNCj4gPiArDQo+ID4gKyAgJyNyZXNldC1jZWxscyc6DQo+ID4gKyAgICBjb25zdDog
MQ0KPiANCj4gTm8gcmVzb3VyY2VzPyBUaGVuIG5vdCBhIGRlZGljYXRlZCBjaGlsZCBub2RlLCBi
dXQgcGFydCBvZiB0aGUgc3lzY29uLg0KPiBGb2xkIHRoaXMgZW50aXJlIGJpbmRpbmcgaW50byB0
aGUgcGFyZW50IG5vZGUuDQo+IA0KDQpIb3cgdG8gZm9sZCB0aGlzIGJpbmRpbmc/IElzIHRoZXJl
IGFueSBleGFtcGxlIHVzZWQgdG8gcmVmZXI/IElmIHllcywgcGxlYXNlIHRlbGwgdXMuDQpUaGFu
a3MNCg0KPiA+ICsNCj4gPiArcmVxdWlyZWQ6DQo+ID4gKyAgLSBjb21wYXRpYmxlDQo+ID4gKyAg
LSAnI3Jlc2V0LWNlbGxzJw0KPiA+ICsNCj4gPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNl
DQo+ID4gKw0KPiA+ICtleGFtcGxlczoNCj4gPiArICAtIHwNCj4gPiArICAgIHN5c2NvbkAxNjAw
MDAwMCB7DQo+ID4gKyAgICAgIGNvbXBhdGlibGUgPSAiY2l4LHNreTEtczUtc3lzdGVtLWNvbnRy
b2xsZXIiLCAic3lzY29uIiwNCj4gPiArICAgICAgICAgICAgICAgICJzaW1wbGUtbWZkIjsNCj4g
DQo+IE1lc3MgYWxpZ25tZW50Lg0KPiANCj4gPiArICAgICAgcmVnID0gPDB4MCAweDE2MDAwMDAw
IDB4MCAweDEwMDA+Ow0KPiANCj4gRG9lcyBub3QgYmVsb25nIGhlcmUuDQo+IA0KPiA+ICsgICAg
ICBzcmM6IHJlc2V0LWNvbnRyb2xsZXIgew0KPiA+ICsgICAgICAgIGNvbXBhdGlibGUgPSAiY2l4
LHNreTEtcnN0IjsNCj4gPiArICAgICAgICAjcmVzZXQtY2VsbHMgPSA8MT47DQo+ID4gKyAgICAg
IH07DQo+IA0KPiA+ICsgICAgfTsNCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3Mvc29jL2NpeC9jaXgsc2t5MS1zeXN0ZW0tY29udHJvbGxlcg0K
PiA+IC55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL2Np
eC9jaXgsc2t5MS1zeXN0ZW0tY29udHJvbGxlcg0KPiA+IC55YW1sDQo+ID4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmY2ZTI3NzZlM2Y1Mw0KPiA+IC0tLSAv
ZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29j
L2NpeC9jaXgsc2t5MS1zeXN0ZW0tY29udHJvDQo+ID4gKysrIGxsZXIueWFtbA0KPiA+IEBAIC0w
LDAgKzEsNDggQEANCj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5
IE9SIEJTRC0yLUNsYXVzZSAlWUFNTCAxLjINCj4gPiArLS0tDQo+ID4gKyRpZDoNCj4gPiAraHR0
cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvc29jL2NpeC9jaXgsc2t5MS1zeXN0ZW0tY29udHJv
bGxlci55YW1sDQo+ID4gKyMNCj4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21l
dGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4gKw0KPiA+ICt0aXRsZTogQ2l4IFNreTEgU29DIHN5
c3RlbSBjb250cm9sbGVyIHJlZ2lzdGVyIHJlZ2lvbg0KPiA+ICsNCj4gPiArbWFpbnRhaW5lcnM6
DQo+ID4gKyAgLSBHYXJ5IFlhbmcgPGdhcnkueWFuZ0BjaXh0ZWNoLmNvbT4NCj4gPiArDQo+ID4g
K2Rlc2NyaXB0aW9uOg0KPiA+ICsgIEFuIHdpZGUgYXNzb3J0bWVudCBvZiByZWdpc3RlcnMgb2Yg
dGhlIHN5c3RlbSBjb250cm9sbGVyIG9uIFNreTENCj4gPiArU29DLA0KPiA+ICsgIGluY2x1ZGlu
ZyByZXNldHMgYW5kIHVzYi4NCj4gPiArDQo+ID4gK2FsbE9mOg0KPiA+ICsgIC0gJHJlZjogL3Nj
aGVtYXMvbWZkL3N5c2Nvbi55YW1sIw0KPiA+ICsNCj4gPiArcHJvcGVydGllczoNCj4gPiArICBj
b21wYXRpYmxlOg0KPiA+ICsgICAgb25lT2Y6DQo+ID4gKyAgICAgIC0gY29udGFpbnM6DQo+IA0K
PiBXaGF0PyBObywgZG9uJ3QgY29tZSB3aXRoIHJhbmRvbSBjb2RlLiBUaGVyZSBpcyBubyBzaW5n
bGUgY29kZSBsaWtlIHRoaXMuDQo+IA0KPiA+ICsgICAgICAgICAgLSBlbnVtOg0KPiA+ICsgICAg
ICAgICAgICAgIC0gY2l4LHNreTEtc3lzdGVtLWNvbnRyb2xsZXINCj4gPiArICAgICAgICAgICAg
ICAtIGNpeCxza3kxLXM1LXN5c3RlbS1jb250cm9sbGVyDQo+ID4gKyAgICAgICAgICAtIGNvbnN0
OiBzeXNjb24NCj4gPiArICAgICAgICAgIC0gY29uc3Q6IHNpbXBsZS1tZmQNCj4gDQo+IEh1aD8g
WW91IGFscmVhZHkgZG9jdW1lbnRlZCB0aGlzLg0KPiANCj4gTkFLLCB5b3UgYXJlIG1ha2luZyBy
YW5kb20gY2hhbmdlcyB3aXRob3V0IGFueSBjb25jZXB0Lg0KPiANCj4gUmVhZCBwcmV2aW91cyBm
ZWVkYmFjay4gUmVhbGx5IGNhcmVmdWxseS4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6
dG9mDQoNClNvcnJ5IGZvciBteSBtaXN0YWtlcy4gSSBkb24ndCBrbm93IGhvdyB0byB3cml0ZSBi
aW5kaW5nIGRvYyBleGNlcHQgcmVmZXIgdG8gb3RoZXIgYmluZGluZ3MuDQpJcyB0aGVyZSBhbnkg
dHJhaW5pbmcgZG9jcz8gT3IgUGxlYXNlIGdpdmUgdXMgc29tZSBzdWdnZXN0aW9ucy4NCg0KQmVz
dCBSZWdhcmRzDQpHYXJ5DQoNCg==

