Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3476D58E74
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 07:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gGpUtWx2CpdbUCSQlITX/DpSts6Dzq9OiPX/OhLHNRs=; b=WAbbea33sPwyvMuLoMlTJ42sLA
	BOI8OzbqvBO2bNuvjzfx6bWUHlvlTQe+DSuRXs7ttLazka+yQz/xhH5uMt4L0xXiQJVQljXWff5hw
	jyHcxHmUEJgmWScc265ZjfUq5GvNJdWFk26QCtCMTXlQRg7BYDv65tY7reH5YBvQ88dM7NFIzOslN
	96NOVazVMf5fJU8yiWbwMa9V+KxRgS3QVatqeFx5fkAxKAJRsadX40lo8IaLM5ARDa0KTQs7dd071
	jnnh1yWJvlXkhuE+E6JuftRy+79FHNP11L8YJPagidhU7d/6t+zYIf/nZxoFUvxntE+10DSJxlxhY
	QKq8UoOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwxfh-0000000CPjf-0vz2;
	Mon, 02 Mar 2026 07:26:29 +0000
Received: from mail-westusazon11012021.outbound.protection.outlook.com ([52.101.43.21] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwxfe-0000000CPil-45Gb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 07:26:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VCCvzIyPlsIZH785yOrvIq6EEELQQqgBbe0htLSSD/9Bu15IXTDxzfCf8fv5xSgLeX2sxzIzl2sCPGia2bMzPtEcuhwxvzf3TW1YPCBQAnfcBkfyuS6CG91qLz7w2jog2dPT6HblTWkFMsjvBMYwpeZBMxNPYWXAcmwpBjCcYvNPbBIf+7/il8isn3Yb0NLh3FP9iDf0mzTB3YDroHscMLT6DW8d2UZZ/IcWQc+mqkb99rWppaxsAcY7AXlut3ndKFfHaEM+g+tAiaff8V+/KynJuzXV6X86mgFgizSb6jDjzw8qOj60rr8m+gZLiGq7qe8D7oNa40z4XT6bWiwGig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGpUtWx2CpdbUCSQlITX/DpSts6Dzq9OiPX/OhLHNRs=;
 b=voge8RQKRKzaDF4r5IBoGH/B1zqWrZdqr0NuL0ORLvZZEc8ayR8kJ7Pht62doiUICUOnqsnpt0ghFZfI8XkWZwQ85NXh36MZgmZkGAYy1OIpili5iRUz/RcFNEpbT9MjWpID349mSigGwPvisRbdr2iobk3rmtlAc9dZi4ggl+NB2pabv/2WClhIGqQ4pQh/JqF/NFiHcG58P04/HAgmRP9Ft3GL7ESWMkdJFq5wQRJ0Y+bax1M90tWEjC8gVh3NPfM58u6PSo4YISV8P7FCI8j79oO+SPnpDr2qByIGxKw4A7XIMofq6j1KSKSnRlIB4VqgeTV1jY71gekoEl388A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gGpUtWx2CpdbUCSQlITX/DpSts6Dzq9OiPX/OhLHNRs=;
 b=CQ86e8YvBn8Ux1zi6v5YUQtr9s/4XdAH/RG2ya0WLNNa7QM2bd0fIbuOMEvkfMMZ3SJ3Ih1z9jLfMMZ3kkkY7LkhLAfaXyqgLHZyT/BNP7QCgorhSb5wNZP97NyKNeWsFGhEMSaXBLR4yxTq6Y5gcvJpWRaWMnzzSAcEDMdTGaGsJ8WytI3SDWMqForqi1WE9nSR2H8HQ/kCSo+I3vERD7tN0ltHY8V7gnwdZoQ3G+JqPaMFAKkhcrEzOLsa7N3EvBiBbkMJN2LxPzu/8c80gFFzpTbgvU6D6d7HwRO/2kiZFMVaeFpeuGX72nJmubpqECV7E6Q28+G7B/UvW+T1kA==
Received: from CH3PR11MB8187.namprd11.prod.outlook.com (2603:10b6:610:160::18)
 by IA1PR11MB7824.namprd11.prod.outlook.com (2603:10b6:208:3f9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 07:26:22 +0000
Received: from CH3PR11MB8187.namprd11.prod.outlook.com
 ([fe80::ae7a:fa9:b654:1374]) by CH3PR11MB8187.namprd11.prod.outlook.com
 ([fe80::ae7a:fa9:b654:1374%4]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 07:26:22 +0000
From: <Balakrishnan.S@microchip.com>
To: <linux@roeck-us.net>, <wim@linux-watchdog.org>
CC: <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <linux-watchdog@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] watchdog: at91/sama5d4: header cleanup and driver
 refactor
Thread-Topic: [PATCH 0/3] watchdog: at91/sama5d4: header cleanup and driver
 refactor
Thread-Index: AQHcp7sWTpboeMkOzUqT90LMatIUK7WWKjoAgASyC4A=
Date: Mon, 2 Mar 2026 07:26:22 +0000
Message-ID: <660400db-d596-4857-be20-1ed2dbca7b6d@microchip.com>
References: <20260227073116.30447-1-balakrishnan.s@microchip.com>
 <e69972db-20c3-4ce7-ad12-bb91a8eadfb2@roeck-us.net>
In-Reply-To: <e69972db-20c3-4ce7-ad12-bb91a8eadfb2@roeck-us.net>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8187:EE_|IA1PR11MB7824:EE_
x-ms-office365-filtering-correlation-id: 5715d1d7-6219-409d-37e1-08de782d013d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: chlxoprl1oPgFC1Rqr6FcL0Geo2dUZO2DTIalRStl5amMOR0DvT+k4Y9dnMeLf5YsdM4zad2NkCVhCRQm+TumkmCx7TpvM7XBbtaD33BaoLvO1xWeY0jl36gUFKR2jSdCGEfM8yJLhnrum52Ou1UQZX0Vuxsd1tBvPdzwB1wuqxpQ946CCnYkRVkw7EjkomIr0PPWyMB2FWmg70ltpePA3jPaUZsk6/Ud0QOQD5hxPi6aZWIu2mVlhW1qoLrF4OZ2pBbd/h87rqV9BOqV6kmFbiHmXT593YrLfkEQ4mwA2zPk1MMlCKUnwS8sDGoz5MADAEWtnn5cLY61t31ipRTg8UmR3Kgf40ZfHKBT52yFojF5O3jOdOvjTBGBJaoRzi71Kck0Np80j2mJILnlGwEEhl+H+oCsMqUoJW1Ej73Cjydr0BOV6IRw02oIfGEutosPkD4FSEvqh/1vd57cp1wud2eyWpjFknEeon8QaP2us+ewVYziybA54aMbxRUmIXrctBMzhid7T51WIaUbKcaixNel03lLRMX9Tmhn3AlxORpUFzNB+fqP+tEelSa0D12dxOyMrJhgdkPn2UaX8dVi5u3TU5Ofzr+nqQAFmgj2fj+BvYliSFVEL0zkX3AhTnJAy5ISZQnOJ+1tEgDEchfoVMrw7cSe7ODnk8lbo8DVOZwEV8y1H2/NyGoaXB5EzxO3ttfLjTq8LVuFuPWyv7clwIoBP6p/dv1G1uej8MIA+STRhM/X8o2xVFBPw/VDM+7plO4Hd7FWCwTUNXt8FJY5SUFahUqK/9vgHqqxAKHir8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QndXSS9PYi9EMVU3bXh5MlFDVC9uY2F5SmplSHVDVDViYzl0dmU0WHVvY001?=
 =?utf-8?B?d2N2WTc3WW9ubjhnRGVRcGVSb0o3YXFCbUlYMUR6SEZCbk1xUG81anA1c2Mr?=
 =?utf-8?B?ZFpua2tZZnNrUVlZZlg5OHFQUmNWdlY2QkFWZzdvekdpcysrbTBzQ3l0QUVy?=
 =?utf-8?B?NmwwMW53ZVVaSEtWVlVreEhnQVE5T3czalJJN0lweW5qRkltc0dsNU1McGVM?=
 =?utf-8?B?UTZtUWkyRzZrK2JmSklKU3ZXQTRtVjhUQU1JV1F0a3I1QklFT1duYWlrbWw1?=
 =?utf-8?B?cjdGY0tvdVRXOXNQaDlTdG9wblNLTjZJUTNNdVMzeGdFOGw0MDJ2cmdGS0to?=
 =?utf-8?B?b0xoZ2ZTQ00zRTQySDJYWGljTit2L2ZWR05UQ0JFeFVPMlg3WUt6N0xydUtD?=
 =?utf-8?B?NXhILzA3OEJ3MlJ1am5IakhEN3BJY1dlWUxCOThhdDE1ZFV1NTZWdVN4Snl0?=
 =?utf-8?B?NUh3YTZvWUZnY1d5VVNBU0RCVTRYODFBWWlYVDNSbUJDVjV6RG5nQlIrMm5y?=
 =?utf-8?B?dkJ2SWRwaFBnSUppVnlTUElHd0tBcXpyd1hjajl6YzEzWWx4ZUw0SlVrdU5n?=
 =?utf-8?B?OHUwaSszckVicWpvWUxBUy94clJDZWs5Q0NVZExyK0paOENJbklVRS9HaERS?=
 =?utf-8?B?ckdsMGFFSU5BNGt0MlR2bDBkRUNnZWh4cXhYWVdEZDZpR2pxYlpZL2lOUE9G?=
 =?utf-8?B?SGRGeFJKNFZmOVNDcjNlc014V09oMTRWWHAyL2hEdnBkT2FlL3pNRGpPMXhX?=
 =?utf-8?B?eGtTMnlwZVIvLzNNTFZuOFZxVDl5MEhCK3ZwaStScSt4cy83OWdaYWhKdElZ?=
 =?utf-8?B?Z1Y3T2RPUFV5Q0R3ZkZ1V0NtdzRCb2ZUTXhsV3dmVTFOZ3FFeWF3c3lmRk5v?=
 =?utf-8?B?VEtBS29aV3Q5NzVlb2g5bTdiWEtuS1pNNGdZMXNpZVd5aEprWFhEdjBKUGVQ?=
 =?utf-8?B?dDYrdGI5aTBtbWRhQ3FJMHpXYlZoMWRoK3NER1kzMWFPYVI4VzNPQVFWZGNL?=
 =?utf-8?B?THpUSE5QMU5vU1c3MGhYdmFVNnJpY1RNS1Raem1DMWowSHl3ZEpyZ1pnYjA2?=
 =?utf-8?B?WWRMWlVoU0Z0dkx2WDJmWm1OMFgwNnRUS242QVdOZlVPeTJUN3NNbnZKU3p1?=
 =?utf-8?B?a1BZSm9PMDNXZGxEYzNJZ2lhQ3IrZFVGOUl5M1VFT0VNNXdLL0JIek80eUJ5?=
 =?utf-8?B?THRLYWVXOFk2V0U4N0hXTXhYQURwVHBLRjVzaFM3V2I5VnAyM25Kd1dHc1la?=
 =?utf-8?B?a3Y0c1o2TldmNjJSWlNoTlVCaDJHQUxkSk0xdGRVS1NpbEUxVGNPRGkxM1VT?=
 =?utf-8?B?UVp1LzVHK1N5ZzFPUERxL2FzcVUvT3c5dDV5cSt0VDNrckdnUVBVMDhaTFZZ?=
 =?utf-8?B?YTA0aklvazl5T1krZFppSmJ5RFphVTd3V21zeEUyUnI3cnJySTBCQmdIdFFI?=
 =?utf-8?B?aDNRbVgvK0RjaFd2dGhOVVVQSmdRQm5PdTJzbU1OUXJNa2NqbmVqRjNpVjRJ?=
 =?utf-8?B?MjYwSkxyODVTWFI0enFDeWtxRmphVDVhMjg4SmZnNTk3RW9xdnM2eG52bXVq?=
 =?utf-8?B?TGlvTzJLQnFVWmd1YXZwSUhYLzh2TFJoQnRkbEowSkltZmV2bFd5dUFveE1D?=
 =?utf-8?B?V2V1VWUyODNlSWJSMGJOWEhwUDFQbGQ4aEhCem5YMmE1NXFlczRqT0hVc2p1?=
 =?utf-8?B?bWFrT3cxUkcxanJYUTlMVTZxeVd0YWpacXYzeDZ1dGV2T010Rng2Wi9yVlJ0?=
 =?utf-8?B?VFY4b3JIR21VV0VBeEZGUFNpNEtDbzdrRDJGNUJ0TlBWTU9GbU01RzluMTZy?=
 =?utf-8?B?bjRweDErR08xSEJLajVDeUVXeVQ1T1dTUit1RDZQTzBYbmh0ZGlNZ29Kb21V?=
 =?utf-8?B?Rm9iYzZ0d0JQOTRianYvd1pyUjhtTWFDSE9tWXVzdXhMTDJWVjdTWXRsSk45?=
 =?utf-8?B?OFF4MTNMeW1sTVVXL3Rzb2xxZ21MS2E3dDFWdnlzblVPaGYvbm95dDhsZENa?=
 =?utf-8?B?eFdVL2hYenVwZHRQUWhFdk14SHE3SXVENXlsYWlreTZrWUVDVW9hRk0zbS80?=
 =?utf-8?B?QXUzcVlsVDAwMUpRUHdmYTB2aG5wQ1lwb2taS2FQVFkxVFdIRTQ0U2VBVnl2?=
 =?utf-8?B?bXoycER4eG5PcWhXL09YbkpYR1dUSWEwZUlqZ3kvcmIrTzhCNWRyemx2RGFI?=
 =?utf-8?B?cjUwVmM1VWdxYS90VDV0eGRzazloT2hWN3dHZlpua1dQL0NoeVhuT203dHpU?=
 =?utf-8?B?eEJXMEtlVGc2d0xmcWJ0NUI5Z0g4d1lEazQvZGJHTHI3N0c5dU9rdXZSOXJU?=
 =?utf-8?B?MDgweTI3bVdKRXNNV2xBMnVFYXhYdTQ2MXA2VDRSc3NXeFMrc0dnUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <57E358B076E06648853B4411DB109C46@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5715d1d7-6219-409d-37e1-08de782d013d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2026 07:26:22.2459
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bxiKZIUfUGSGRruUfniWZfEwHEI9728PzMa4GXTJMm1Ly1SYGaaVIcnZO2YnhL4t76/TTWyDsMJdKrJYPPIAQ/JCR7Chfk2iDBcE7lgYoc4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_232627_019586_71C661F4 
X-CRM114-Status: GOOD (  15.38  )
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

SGksDQoNCk9uIDI3LzAyLzI2IDE6MTQgcG0sIEd1ZW50ZXIgUm9lY2sgd3JvdGU6DQo+IEVYVEVS
TkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3Mg
eW91IGtub3cgDQo+IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIDIvMjYvMjYgMjM6MzEs
IEJhbGFrcmlzaG5hbiBTYW1iYXRoIHdyb3RlOg0KPj4gVGhpcyBzZXJpZXMgY2xlYW5zIHVwIHRo
ZSBBVDkxIHdhdGNoZG9nIGhlYWRlciBhbmQgcmVmYWN0b3JzIHRoZQ0KPj4gc2FtYTVkNCB3YXRj
aGRvZyBkcml2ZXIuDQo+Pg0KPj4gVGhlIGhlYWRlciByZW9yZ2FuaXphdGlvbiBpbnRyb2R1Y2Vz
IGNvbnNpc3RlbnQgcmVnaXN0ZXIgbmFtaW5nIGFuZA0KPj4gbWFrZXMgdGhlIFdERElTIGJpdCBo
YW5kbGluZyBleHBsaWNpdCBmb3IgbW9kZXJuIChTQU05WDYwLCBTQU1BN0c1LA0KPj4gU0FNOVg3
KSBhbmQgbGVnYWN5IChTQU1BNSwgQVQ5MVNBTTkyNjEpIFNvQ3MuIFRoZSBkcml2ZXIgcmVmYWN0
b3INCj4+IGltcHJvdmVzIHJlYWRhYmlsaXR5IGFuZCBmaXhlcyB0aGUgcmVzZXQgcmVncmVzc2lv
biBpbnRyb2R1Y2VkIGJ5DQo+PiBjb21taXQgMjY2ZGE1M2MzNWZjICgid2F0Y2hkb2c6IHNhbWE1
ZDQ6IHJlYWRvdXQgaW5pdGlhbCBzdGF0ZSIpLg0KPj4NCj4gDQo+IFRoYXQgaXMgaW5hcHByb3By
aWF0ZSBhcyBhIGJ1ZyBmaXguIFRoZXIgYnVnIGZpeCBzaG91bGQgY29tZSBmaXJzdCwNCj4gaW4g
YSBmb3JtIHRoYXQgY2FuIGJlIGJhY2twb3J0ZWQsIGZvbGxvd2VkIGJ5IGFuIG9wdGlvbmFsIGNs
ZWFudXAuDQoNClRoYW5rcyBmb3IgdGhlIGNvbW1lbnRzLiBJJ2xsIHF1aWNrbHkgZml4IHRoaXMg
aW4gdjIgYXMgc3VnZ2VzdGVkLg0KPiANCj4gR3VlbnRlcg0KPiANCj4+IEFuZHJlaSBTaW1pb24g
KDIpOg0KPj4gwqDCoCB3YXRjaGRvZzogYXQ5MXNhbTlfd2R0Lmg6IENsZWFudXAgdGhlIGhlYWRl
ciBmaWxlDQo+PiDCoMKgIHdhdGNoZG9nOiBzYW1hNWQ0X3dkdDogUmVmYWN0b3IgdGhlIGRyaXZl
cg0KPj4NCj4+IEJhbGFrcmlzaG5hbiBTYW1iYXRoICgxKToNCj4+IMKgwqAgd2F0Y2hkb2c6IGF0
OTFzYW05X3dkdDogUmVuYW1lIEFUOTFfV0RUX1dERElTIHRvIEFUOTFfV0RUX1dERElTX0xFR0FD
WQ0KPj4NCj4+IMKgIGRyaXZlcnMvd2F0Y2hkb2cvYXQ5MXNhbTlfd2R0LmMgfMKgwqAgOCArLQ0K
Pj4gwqAgZHJpdmVycy93YXRjaGRvZy9hdDkxc2FtOV93ZHQuaCB8wqAgNjUgKysrKysrKy0tLS0t
LQ0KPj4gwqAgZHJpdmVycy93YXRjaGRvZy9zYW1hNWQ0X3dkdC5jwqAgfCAxNTYgKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tLS0NCj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwgMTEzIGluc2Vy
dGlvbnMoKyksIDExNiBkZWxldGlvbnMoLSkNCj4+DQo+IA0KDQo=

