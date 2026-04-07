Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC7E4EDB7D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 09:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hF3cT3FsyuZ8AZZiuEaGbvXL0/cTln0Cs8B0gKRySgQ=; b=NSodotvwlkbIewwjSxuWHVsOx9
	UM+yOf0rykMFJoKYKsY4cWhNdFRgfXLTTwP2o0Nca9DEVyaVOlByRPdqfpI3WoDkTntwGQINEdxxN
	7cnWQ4jpJfKz3qafUBCku6d+1cMM3SWOakpGXAHGHbv161Gml9tmnuBUyuZ6tNEVzDVEtbqkMrbjf
	9gX/haG23hgrJdrCuwnf84v1mDqQllXWTQq1bBb8cxx2sHuOvR1xlEoQxAypQVbC3AdPuflSV80gM
	blIN+spIbWFX9Dy+WVxDRv+KMeuoRre94Kj80LyBbUORnCYWny/VCySKb7PzoRDkP9PqHQRwjCH4t
	gQJ2zt3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA2rr-00000006EOx-1wrN;
	Tue, 07 Apr 2026 09:37:07 +0000
Received: from mail-koreacentralazon11023091.outbound.protection.outlook.com ([40.107.44.91] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA2ro-00000006EOQ-3Bxy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 09:37:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tfcJEffn4DtcgTssdTYC4t37LEYKHcdz0SLBt0osNjl2Cjb0GzsXLoWsrN5LIBwjuJ+WG1QBxXCMr57SLmVJMq3qaM/gyNV/6C0oM3tdUUUWlNOM51ofiebxujy70NITg+JTEn943is7r1fXD1izzH2uOw4NUtccOPE0djaXI5RKsrLudJMRO8rKWLc+x1JU9rp5JhVT9pHMk+dCnR+1CWkoYYHmHywFMvYhl7uoWh+U4KqWir2xOT3tyb+ewryiI6NSCRzF9vWV5gO/eLnPgfWz/7ASYiH1bUZnMlC5bD0AMrJo1+tjJI6MKl4dDdWuWDuZ3L5l+PbJxehKRyuucg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hF3cT3FsyuZ8AZZiuEaGbvXL0/cTln0Cs8B0gKRySgQ=;
 b=xvTeR5KXsAzZQrAQzae5hCSKRq/6wYr2Yo5P+XYzUmWrVIHYaOlaN+VETGj4J/vAWWJ0t+TNvk5iA7sKnlLLz6TG6quKomr8eMjf+7TJynJ9TEvdSp7MYW0Ly/FCGdfftqStW/pyPLq/g+JY6CUh0hcr0JsuZ+Hx7b6w/WJOqqafJfgjm39q6o/5h5KBz83y2DBB92iuxfZFB7M/CRPgIDA0B3n9/DnOtQ5Krg+boSRAP52VUe6tqXK907zWlpf+X6Zml3N7du+L/4eFPAToeyW8anp3T2ObdsVrhmYFviXcCeTkeiLZLI5nsj1W/kjQqhCYKnk/MlKucRwstyizsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hF3cT3FsyuZ8AZZiuEaGbvXL0/cTln0Cs8B0gKRySgQ=;
 b=kW9t6UD77aJPL1IHVt0WldCxAI8d1QJXM6EcmFtunJGrN7W2HBNiC2umHcMF5qIQhjFeCjrB7hDaMJpSL894i1VZ1e+RJUc+1RQjD7vB1WOJerK2LgynKsjYvUZYjMPZ2M0CkStH+3K9KxNetg+ZlJz7fmi+trXqsqB8KxdUJwch/bdZQI3UO1qrzqccH4Ecml+hwcCBqudXjMq0lhPcVuoxvCNClRMr8I87MLCVlYHHI+iVF7BPGTXbrwVfXyLytX4EYmQIvwxASUgSqsyykiv6cjWLREf7gMfXKS0bmeRcf3B7Ct8dFQTR6VRaYRmtHESD8o+tT0ucKXSaS00xkA==
Received: from KL1PR0601MB4276.apcprd06.prod.outlook.com
 (2603:1096:820:78::12) by SEZPR06MB6120.apcprd06.prod.outlook.com
 (2603:1096:101:f2::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Tue, 7 Apr
 2026 09:36:37 +0000
Received: from KL1PR0601MB4276.apcprd06.prod.outlook.com
 ([fe80::b7f3:3c41:fd0e:e3f6]) by KL1PR0601MB4276.apcprd06.prod.outlook.com
 ([fe80::b7f3:3c41:fd0e:e3f6%5]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 09:36:36 +0000
From: YH Chung <yh_chung@aspeedtech.com>
To: Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Ryan Chen
	<ryan_chen@aspeedtech.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "maciej.lawniczak@intel.com"
	<maciej.lawniczak@intel.com>, Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH 0/7] soc: aspeed: Add AST2600 eSPI controller support
Thread-Topic: [PATCH 0/7] soc: aspeed: Add AST2600 eSPI controller support
Thread-Index: AQHcstFOqEOl3ItXl0mr3midS8GMZLWsphAAgABXFACAA7sEAIAAT9LAgAF5RgCADH1X4IAAILCAgAK7OMCAEYY3UA==
Date: Tue, 7 Apr 2026 09:36:36 +0000
Message-ID: <KL1PR0601MB427603A6A5768D6A537CAFCB905AA@KL1PR0601MB4276.apcprd06.prod.outlook.com>
References: <20260313-upstream_espi-v1-0-9504428e1f43@aspeedtech.com>
 <20260313-energy-casket-ca8adc1f1fd1@spud>
 <23909400-4e7f-49c9-a982-14036372af98@app.fastmail.com>
 <c3b28ee92fa46700887d0c68b23045b2418358a7.camel@codeconstruct.com.au>
 <KL1PR0601MB4276ED93723F0B1F42349AD89041A@KL1PR0601MB4276.apcprd06.prod.outlook.com>
 <0f7f0f96-a918-47d5-a0bd-bbde494c8fed@app.fastmail.com>
 <KL1PR0601MB4276B5BE3B96C18E3A66AD709049A@KL1PR0601MB4276.apcprd06.prod.outlook.com>
 <14870d17-2471-4522-b8b5-03cb9002a4f7@app.fastmail.com>
 <KL1PR0601MB42763DAD359305DEBA4B769D9057A@KL1PR0601MB4276.apcprd06.prod.outlook.com>
In-Reply-To: <KL1PR0601MB42763DAD359305DEBA4B769D9057A@KL1PR0601MB4276.apcprd06.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0601MB4276:EE_|SEZPR06MB6120:EE_
x-ms-office365-filtering-correlation-id: 1f8282a9-94e1-454f-44d0-08de948929bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|42112799006|366016|1800799024|376014|7416014|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: 20zd4ou7FWK/FVEEBN/2mhI38Sdx9O8dwv1ihkcNm+E8adHSSh0ren8G0lI16UhkBioJXL5ys1Xy0OCDVVeDsXiaS5euJur38Pq7UAAgpHKYLbGy43j2JsFqsjMcYuW2L3nJaOqUTazxheMrYRvvetyqto5iU/10mH9KUzchN8h3cw4Cu7ABLQd91r/oO7jmEcErXAGakDaaDMf+3XdPLW5AwQbpHXyzNkW5OtzMUCX7ZZeKuMKVMvZ3B3J3e1hhyrLE43oJpHn1ugurmjZv/ptTko6Hu8cP+b0FkLEJdixevhfSJ9XuQ0mucPXq2406j0mIDl65BsgWauXrwNKMlWg06yWvxfSA+q89JvMKdZwRBx02H8WR3ZmZAWgX2JEKixfiQ5IPYkfCrjflEkUQBp0Nypfd28S+7eJC2AxGzwe2RbyTmvq/A80PNVUzTLz/h1fuVUaANgKi6xmTyuYIBFTDG6xU7sfD2QpqYYf/RvjC73lT7d2u9mgPzEWjIaJTTWbRLxu0LckjIADm0N/hRsB5ehezIMv9V6XlpjpWZ9lFYGOb0BmUVaFvKDatjhtZU5mlkWgFfkMKuBh0b50ds3YngLreYMSWCUNqO8pMGfXbqK3eI2y9IMIkrUvqq8T6IoYdLlPVgo/KYX5YleE/0SDq8tYHxOvFVP3ud9vYWqnPJcZCFx9uDOV/42GDYm35q5rgJz5jucKdGvyChdDKdxjbjdSVjugDhTUbTDmUtQ2W4aZ+TfDPhoTH8aij0XN/aKOAQ9/zVXrlSfK5WqHQWhbm2nCzZAIotuXCkPhoqv4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB4276.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(1800799024)(376014)(7416014)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OVZtVmV3alh3WXFlRXNBTXN2V0V2ai9zQ3hUcEFsNlNvaEoweVNxaVFucE9y?=
 =?utf-8?B?VFluR1dja0dHZ09HbXQ0RzVHa1U4SW5mdm9JRFZBaExIY05GZitOdG9QTzUr?=
 =?utf-8?B?Sk84L0Y2eEgyR2taeitqMjhFdlJRV0tNZkppR3F2SHFDcjFORkZQUllRUEs1?=
 =?utf-8?B?SVlEdjBTbkgySlhpdFNKdElGUEFIVVNFUWY3eVFjMTR0Q2lUMHNsZHFTQmFt?=
 =?utf-8?B?SUNOelZHcXlFeUEwWWNrWUsyWDBUZkF2WmxxZWVtU2lmUElTN3VNYmxhQnJo?=
 =?utf-8?B?OWxJS0lNQnFTMWI5M1VFaEhaL2R2YlJnN1FXK0JNWVdBS2Y3YlMrZDBCbWVK?=
 =?utf-8?B?SytWbURPK3FudVluRDd4cmFzRnRlZUVmSm1lTG9QOWhZV1VpOEk2VEcwKzZy?=
 =?utf-8?B?Q3hiMXJCUFA1QkU3N0Vlbkt4c1djRVAzZ1hlWTVOem5WSVFVZStHdGpBcmxr?=
 =?utf-8?B?Y1NrRXNLdENES2VRK3I3OEdIRGxxTENBekh3L3JsK3VvM0prTEFnc2w5QlRW?=
 =?utf-8?B?ejRhcTAwYkdEcmU3SEdKM3dOSDNvWFFSVVhjKzFJVVV0N1BvcmV1bDZvbWdx?=
 =?utf-8?B?UTBaU0JlZGYrdGVCQTNkbDRjdW83OWplZkpRaVVydFRMY1ltOGF1azJVZFhN?=
 =?utf-8?B?aTBZS1pTb0dVUjAvS0hNbVRmdUdYRWdxdE9SSVZvZUFZaDJlWldBYUpseDZm?=
 =?utf-8?B?WGI4V1FINy8rWDREQWRXeUFoRE80KzJFTmZhMnlqbGJYWVZ1R2lkaXJXY2Fq?=
 =?utf-8?B?UkRKMWh2R2FBVDI3OVVSM29nbWNvNjhuVHVNUDdkVzZXKzg1eThRK0IyYkp2?=
 =?utf-8?B?cHBYV3RGOHRlNXh1SkR6MW9hUnlISG9WM0FGRTBlaU9adXI5MTJra1h6YXQz?=
 =?utf-8?B?Ty9jVm1DWmxBRHY4NnZzdGpvYkZLKzdxVi8rRU5leVZPNHJkWGRHS3dUaW50?=
 =?utf-8?B?ckxTOGU2Ukk0eS9XMUlTbXFHcGZJMWhReUk2eCtpK1lPaGZ2aXdDSktTK3pB?=
 =?utf-8?B?aUJyd3lwWHdmcDZuVHB4ZnNjNzA2amhiUEFjUUt2L2MwOXlqSFJHc0VEbDZL?=
 =?utf-8?B?MEljN0IyM3lvMTVCck5HUWZlMDJYRnNveTV1ck9vT2RHZ3cwbklhZTlOMitO?=
 =?utf-8?B?OE55WUZ4aHh5T085WDluUkNKMHdlajJmcHpWcG5qNTRHY2FTNHJrMndvSmpY?=
 =?utf-8?B?dlRzTytRNEVrTkxRNnQvRjlMdEgwVG9vQlBkdll4ZWRvVkN6OXRBWlNGRGhI?=
 =?utf-8?B?bDRiV2Znak9nV1JlZ0ZBUlNPUk5JQ20zSll2RFltWEk0K0V3dFVGeUhxVmYv?=
 =?utf-8?B?T0Y5Rk1UcTA0TWZabVFDMEprdzVxQ1BVQXZrZ0h3R0ExNWJqY2tSOElnNnJ0?=
 =?utf-8?B?MElMRTNWTnQyQVhGNzBKTytQL3NnVCtFMjN2YkpISHlmNjNzdVZOL3VEZEdT?=
 =?utf-8?B?UXBOeE10b2ZWVUVpOWNXZ2dWanBxOEdEaWhIL1daS2FMYWlocHg2RHRCZFZ3?=
 =?utf-8?B?ekF0ekd0Um9TNm9CMWpJcEUxTzVKNDlCRGEyQUF5Sm9paGl0L043aThkQmE1?=
 =?utf-8?B?TnBCM254Vk11SUZUZ0RVUnFWY29kMGJXcVo3ejV2MWY5bGozRHpTSGtTZmhh?=
 =?utf-8?B?RmhUaVF2ZTNIbVBqZVEvZDFacmMxaW5adjVNVUJtUFJmTzZOL21EWmw4UVB1?=
 =?utf-8?B?dWRhVlRlQUtEMXM3K0p3YWRjc3M4OTBEcnpJMlc1V0NDU1ErbTBRd095cjNP?=
 =?utf-8?B?T1c3czZ1S2JQNGc2VThNbGUvbDBoRnhSRnNGdTcvb3ZJMk5abGNPcXQvblV3?=
 =?utf-8?B?TWVJTU5IVDJsaVk0dnVCTzBSdWNuZTBYa0tQNGN3OGkrUlg3WC9iUURMTFVQ?=
 =?utf-8?B?ak5RdmpsSUtEbHNTS2hqWkhXenpYMG1RUmZBek9WRHRPUUt0emFVQmJKOWtP?=
 =?utf-8?B?cmdXL3pwQW9ZTVdteXQwUWNjZ3RUWGpnUjFncXlXUGpVRVBuMlFDbDRxd1Bu?=
 =?utf-8?B?ek1kSXpIeWx4ckU5aS9rUUtaUi9xY1ovTEEzNldaWkpNWjR6Y0dQb1VxbmpO?=
 =?utf-8?B?R1d0Z0VXbVV2NGhOaVJyUkVXZ1NWZGVibW56aVVqdHQ0S2g1cGhrbmlScGhX?=
 =?utf-8?B?M2hHNkJwaVRYbFJ4KytUNmM3NkhyRTBKOFBXVHhieUMwSXpKOFNhaTlVTnRK?=
 =?utf-8?B?aXVKN1JMNzRXd2xBemsycmJEcjhlc3VKVjZDbW9kVU8zeU4zNzJOMUdDZy82?=
 =?utf-8?B?R0o5UFJLekJwNExzNS9xQVpUSjN4Mzh2MjI2MUhWY1J1Wk1xRy9ocHFQZkpK?=
 =?utf-8?B?K0FXTmZpOURoeWpvbFJicGxRem5leTFjWTV5SDVzYVpWcFpMemwwUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4276.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f8282a9-94e1-454f-44d0-08de948929bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2026 09:36:36.4372
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D5YJPuhmezaRov3owavrewl3etvkb8i3Q4ZWbiiLwDsZLYq6QtockisNUfh2IXyDW7+OXuaVuPyf8dxSnq0DXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_023704_960614_9A62EEF6 
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

SGkgQXJuZCwNCg0KVGhhbmtzIGZvciB0aGUgY29tbWVudHMgYW5kIHF1ZXN0aW9ucy4NCg0KPiBU
aGVzZSBhbGwgc2VlbSB0byBiZSB2aWFibGUgb3B0aW9ucywgYnV0IEkgc3RpbGwgdGhpbmsgd2Ug
c2hvdWxkIGZvY3VzIG9uDQo+IGFncmVlaW5nIG9uIGEgZGVzaWduIGZvciB0aGUgbG93LWxldmVs
IGhhcmR3YXJlIGludGVyZmFjZSBhbmQgd2hldGhlciB0aGlzDQo+IGNhbiBvciBzaG91bGQgYmUg
YWJzdHJhY3RlZCBiZXR3ZWVuIFNvQyB2ZW5kb3Igc3BlY2lmaWMgZHJpdmVycyBiZWZvcmUNCj4g
dHJ5aW5nIHRvIHNvbHZlIHRoZSB1c2VyIGludGVyZmFjZSBzaWRlLg0KIA0KQ291bGQgeW91IHNo
YXJlIHlvdXIgdGhvdWdodHMgb24gd2hldGhlciBpdCB3b3VsZCBtYWtlIHNlbnNlIHRvIGFjY2Vw
dCBvdXINCmVTUEkgZHJpdmVyIGFzIGlzLCBhbmQgd2hldGhlciBpdCBzaG91bGQgbGl2ZSB1bmRl
ciB0aGUgU29DIHZlbmRvci1zcGVjaWZpYw0KZGlyZWN0b3JpZXM/IEFueSBjb21tZW50IHdvdWxk
IGJlIGdyZWF0bHkgYXBwcmVjaWF0ZWQuDQoNClRoYW5rcywNCll1bkhzdWFuDQo=

