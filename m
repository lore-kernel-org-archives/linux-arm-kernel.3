Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E247C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 06:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F1WtjJT1Aab/kkbQRcWetVy9iSkSqa5AL8+HJxSU1XY=; b=FkNvKhhBfKd/RV3lDsXtnLBycH
	dqtVI0SNqjd2wgarKySXQnjVzMbwoDusLaG0iurODDiHKo0X13CmnpvzSDOYu9gA5vlUPR5OlHI2E
	RpPtr0AeNa+F/dGfHUMoI5Eo7Sm32Jq3OxbsqCDx/8dbLdwo9kskTZFr3Us9IMpPF4r0lzJ5RFFOm
	pKNh9I6tMUp3S8wv6KEsCUvfEpvssW4GP11qB5Mlk6C1h9RcYW9AvdU2t6J9WYEXFTKJNEBmUZ3bZ
	m6SKVO6iWIm3d6x3xKe4HNkDzHX4nxNOm0F0+tujQ8M/gceZWtU8U/gLwOouCmolVWSdc2n/6O147
	vwpGTCZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfBKh-00000003gCI-0gid;
	Thu, 02 Jul 2026 06:55:35 +0000
Received: from mail-westcentralusazon11013062.outbound.protection.outlook.com ([40.93.201.62] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfBKd-00000003gBk-1MOM;
	Thu, 02 Jul 2026 06:55:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SdNm7qVq2GNw64jzEQJzuMkFxOMBDP87QLzzPAnfXZyeOAlxtzJ0v8F8xXwfFhgU17YMOZ5bytebnOvdcHdxOb44FieSDYRM+a1UZ6ahnPXwqaz4q0JlIaahIdaxNOAizps+SAjyw4u9I5Svs0jsUlacrmvPDlrQSkoYrsg97Fsh7rCMhCbEg1SFmnBa0R2MPkN2l53uLY+35PEe/IfYGEkaZfaKsv+4C1hfbi2uKRP2KQR4IZLCa2nvnk+j5k2/v0uYlQT8mYZS0sjIn5vZjZ/0vFVwxtAP6GYlOd63Rui/gvRCtHrODTknNdvRd8mw8u22W0AVyVBckkLPu8+IiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1WtjJT1Aab/kkbQRcWetVy9iSkSqa5AL8+HJxSU1XY=;
 b=P5uDUSw29SJFZ4avI3//qtfccLaMEfG48iq9QpxGBkgG3dgD+qQvw8p5egjc4r5v3P7MuN7kwHbz41zWnaRXSMaemU10cfYU4yP8XIHCSMflgN8OCVuDsmabtBVMtQQmleTES4cBv0q3zmiIlkQ4wzbQsCTt4omrLtdcWADw8YWSpGdPkW11UQqqhwdbRZagrlJOK/Pc5Y5lOMhVVCgA2+bZDntwo950ZplURmz4qYA+2t9KxN9JmvH0SQMMnsHgQD1RCF4HnssUnwvHHwZleDMfN9zIV+Nld1G9QJiCF2+JNctU8gx4u7evkMqqY5tcrxbTI4D3qY0zDsOXfgsUdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1WtjJT1Aab/kkbQRcWetVy9iSkSqa5AL8+HJxSU1XY=;
 b=aiGX8ScsLRGN5DNPEiWN0n4Cezbe7La7IHQIq87lYRBCyXnFO7ErzWARVbBnXopxQfuZ7y+TlDE02QOyk8KIsp1JggOyg1D4frQ4YzD3NMiKdCjNQSQ1gBkzGzYrtOdgvik1SYBAinH+BOcSROxbCtCFkWS2BRGKsIQNJy4XcadjghADPiSbIpE1s1E1NyyTDFKH6n7Y+1oBKnbGib0lh5na5TPhXkS8qqEzSZaH1aREXSia4bNf1hm+eUO1C9hi3/9vwsSEYbHfi1sq1siYz0b2OBeVs3uPBfJnXaQTJDw57xztJhP4oW658stzKg/aH7o5hjBpLn9fPKiS4CLvFQ==
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f3a) by CH3PR11MB7297.namprd11.prod.outlook.com
 (2603:10b6:610:140::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 06:55:15 +0000
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::ad98:5674:dd4c:875d]) by DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::ad98:5674:dd4c:875d%6]) with mapi id 15.21.0139.018; Thu, 2 Jul 2026
 06:55:15 +0000
From: <Manikandan.M@microchip.com>
To: <krzk@kernel.org>
CC: <pratyush@kernel.org>, <mwalle@kernel.org>,
	<takahiro.kuwano@infineon.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <srini@kernel.org>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux@armlinux.org.uk>, <richardcochran@gmail.com>, <linusw@kernel.org>,
	<arnd@arndb.de>, <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>
Subject: Re: [PATCH v4 1/7] dt-bindings: mtd: jedec,spi-nor: allow the SFDP to
 be exposed via NVMEM
Thread-Topic: [PATCH v4 1/7] dt-bindings: mtd: jedec,spi-nor: allow the SFDP
 to be exposed via NVMEM
Thread-Index: AQHdCHJO2Gcoz1g2RUeN8B826tcfiLZZw6SAgAAK74A=
Date: Thu, 2 Jul 2026 06:55:15 +0000
Message-ID: <860213fd-6a4b-42d4-a8f7-7308e070f09e@microchip.com>
References: <20260630092406.150587-1-manikandan.m@microchip.com>
 <20260630092406.150587-2-manikandan.m@microchip.com>
 <20260702-utopian-termite-of-perfection-f1f3ec@quoll>
In-Reply-To: <20260702-utopian-termite-of-perfection-f1f3ec@quoll>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF9623118BD:EE_|CH3PR11MB7297:EE_
x-ms-office365-filtering-correlation-id: eee063d6-db4d-4028-366b-08ded806df03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|3023799007|6133799003|22082099003|18002099003|4143699003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info: d8KWq0q1tBJSS14KojuM5Oxpue8Tvql1WnCnUYp8xUNvqMt8EPHiuP7QrKAZAXBxsF8hXqFp/8jjozMN4G313jZrUQ9yXLtJOiUiTKmgG9xCm9sD9l2Fq8MiSite0EOhJLltBBNfiIEihiQlwoqI+Kjk0JstZ02NJiT4cqYqU4hSZFrB18XceNfcfn3SaTEmz8ekc9j1PD7/oKcxsrUDofPwAv266QMTB1pNB8XO+2ALL8/u8BNLdr9WB5u6WYuLvFAVB1iu/dlnbIiDW4QjlsZhCHALBLOwpG/JoSZpEWO8Bym9Ad8/EyXdathGQzOqZgALD6RzaKNY5i3bAp2uRfewiReA36pYvwAEC21Wux0d7AbcLPiSKQvUiWrzsqevHrELggA8GxUpoQfbq4yMV0qhhTvP37sS2ZLBgLy/zkEJlfKkhuwbEsTy4mgPu46DQOMgUAKLFy6/GfxZ0Vz3qJxMVDSvgzmVIkWQ8FuyEy+AWQ+vvuT/sMsXaxFNetHiqSEi1wxeOe8a93nX6rXHaxnA0glQGt/nz4ofAkPnMl5BRGRFLATF55fKecIUIme3Vo9rJVuH/QOTLEDv7ZjxuZ+jPEEy+Pe4kosmrbT8/VXu4MfiEol3qeTgxYraACARkJHbWh9dXRS8Ybd9LvCVtW+kXi2iMOd063dgFl2isE30Uf1wktPuzFFu4wPiEeZYncd1SdIyOy6dBPocs0j8THuc3AMNkawiwJagWZvx1GA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF9623118BD.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(3023799007)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aWtuc0FwNnF2ZHJhMDc1S2d5NDZxeDRzUmorNEdjSFVkYzhta3pIa3VqQ251?=
 =?utf-8?B?cG5zYi9PRHhRcERPN2NoNDdCeFRRcDRBMUVZVUY2dTFqNlRWRVZwdStJNEZp?=
 =?utf-8?B?ZWdCcXpDVk00SHU1VEpRbmZQaUcxdS8xQjlkcDhVSUpUWXd4RlE4UDZ6d2Rn?=
 =?utf-8?B?SWFFQ1JsMWpGTTFnUWlMMC9nSk1UWXUyUk82SUVRRElJSWdtNmNyNU1KN3la?=
 =?utf-8?B?T2R5YVhRVWYxNE54dVZxZjdLOHBBL094ZGlUYlU4MGU3Q3VOZ2ZjUC92a0Zh?=
 =?utf-8?B?bk00SEZXZ0Z0cVJ5b0RtZXVXK21OdWVENDFKeDVEVG5BYm5aOVhMZW5MVmRi?=
 =?utf-8?B?SnZqRWFkdWdPSy9qekdmcG5URXhBb0JTZTZPVEhqWUJleUVXc3ZHeWN6YjJV?=
 =?utf-8?B?enJwbWxDM2pFQm5tMGpWbUl3OTEzUlNsQWRrYzlta1VXT1FXSzdrQk9iUDhO?=
 =?utf-8?B?aDN1VFBaM2xsdTBZL2dLSDBWMmtKWmw3R0ZPRGlsdWt3NmtDc2UwQkEveVpu?=
 =?utf-8?B?QmJNTnlzU0tVNmttYk1ibWozaysxSVZXckdNdmpnRXpQeTIyR1RjRitYRGRY?=
 =?utf-8?B?VkN4dDgvdTNjc3pmODV2TVdad1cyMU43NlQrK21mdTRGMUMwN0FUMk1HQ2tG?=
 =?utf-8?B?RjQ1K01DQkl1SDNoWTE2WnBUK1A1ZHh4Wk80eHliaHdYQlBuYkl2TENJdXZS?=
 =?utf-8?B?Q2RTQld5ZnFtbk5EU1MycDU4aEhJYTExQ0tJQ1RtUnY4TjhibUJBS3Y4OVhs?=
 =?utf-8?B?ZG40TnQzUXROQ1VXS2RIRTN5V015c1ZLQmxVZVcveFVLVFNnTmVRUjhtY3FB?=
 =?utf-8?B?aVpJOFNaaVB5dTBNSWxrYk8zakNJclAzZ3ZJRmpycGRHbEtkbzlJeDZDaG1Y?=
 =?utf-8?B?Rm5hanZqYjduWDhrWUtLVkRZYTNKa04zR0o5dVRXaXBUOWNaT0JNdktYZXEx?=
 =?utf-8?B?andxSHhYaXZwZnpNdDh5bW1PcndOd3hJamdNVlR5Wkw5bW5DeUdsOFpPZ09S?=
 =?utf-8?B?M1hrSEdvWVcwb0RzcXRUZWdEZ2VKdFJldm1ubGx0S21URmFEem9RTDRCVzEz?=
 =?utf-8?B?S2h0eUNta0Z5R1FuQitNY0lNQjczUnhVSzViR0xXSG1TdUtjSStOOXpBMGdi?=
 =?utf-8?B?WXJYL2Mvd0FveFROd094cXMxZjRrZGNJOU1nTVlTcU9zVVk1NVdwdXdGRUE0?=
 =?utf-8?B?ZGlTZ1A1STdXUlB6ZmVlNUJFYUZaVFNWY0owUG1JaitmdXB1dU5WRmhpWWdl?=
 =?utf-8?B?WEFJRHU1OVlVUDlhaVRCSGp2REFpenBERm9nZHV5bGlaT0tWaWJoem5hUDJQ?=
 =?utf-8?B?bmxjNmE3S1JKVjBkSGNkRFEyeDZUTVVxbTIyY0MvbVJyS0VyQVNrSGhkOWFO?=
 =?utf-8?B?VTNZSGpJU1p3d0twUXcweitZZ1NuWEY4akcwSVhvOE5TSnMwU1VEQUhscFlM?=
 =?utf-8?B?Nm5hdEd4ZFBIVHZLRXFITklzZ0d4R3d2dStFQ0RYOUxNQ21udWtxOTUrR044?=
 =?utf-8?B?b1hMdTUrVFpSL0VTMXlqQnRJMkpIK1JvSkRvUEZwWi9kK1dOczBUSHFvZFdB?=
 =?utf-8?B?ejI2SzcvNWdvVTg3aGhZOHBORWZkTTd1V3lSeFIzMDF4Y0tXN2s2SzNZYXd2?=
 =?utf-8?B?OXFobTdIM0dYY05QQ3BiSHZuUHRPblpnVWZzbzB5elo5TktyT2kwRGJMVnpu?=
 =?utf-8?B?MlhoL3BtVmdNWFNHYkFnUXB0YXducjdEY0V6TFljVjhnbWdtSElRZCtlTE1l?=
 =?utf-8?B?NUdhSTVTeDJYaUhyMUlnUEVRTEVQUUo3eDl4M1BVTXNGMVVQdUR4aEFzaXBY?=
 =?utf-8?B?V1c0UDUvSzFscmhJNWdoZEFEb0dEUHhLNWpRNGxsS0daL3ZoMlc0eUtlU2J0?=
 =?utf-8?B?SFpMbHNDdzhZcDR4RmZNa2ZzNmFEd3dIcG16bmdYb2lwTldOQzc2YXNZYlp2?=
 =?utf-8?B?RG1FdEMvQk5uOG9CM2hSWmZHN1B4cFIzRG5lU3UzaWpSblJmSDRsYldxbE15?=
 =?utf-8?B?NGVqQjQ1emRmRDlyRFg2Y28yZC9ac3BUejFPcW5lTjJhRlBEZzMwY0ljaExv?=
 =?utf-8?B?Z0RVSlJaOEpZNklWczEyS2ozV2pHZTNtUjZrOXZ6cGVQMlg2OHhZNys4bHBS?=
 =?utf-8?B?eEs5NEljZTVvMXQrT0F5N203OEo1STBKWmtGaTBQUkNHV3lQbTNIVGJZVDB0?=
 =?utf-8?B?bUVET0tXR2NhK3ZSbEZucnFkUzNmK1dwQmM2YytQTmJOMjRjK2s2dmJIOUYw?=
 =?utf-8?B?QUtlWk1WeEtVc3FxSll0ZzNSVjhhRko1YlNqZWFLM0h1U0RJNkdWMGI4ODdk?=
 =?utf-8?B?ZSsvcW5sK0lEcXFTTG0rSDFNSFh1eDJwWnJxaW1uaDVUeitPS2g4UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7E966EAD5E12804FAD9544DCC9D95867@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF9623118BD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eee063d6-db4d-4028-366b-08ded806df03
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2026 06:55:15.5761
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k4WZ/XCi+Gp0fg0hWTtSOLmRyrF31WHEP2bYPW/y7yG7YFyDSbCIPNxS9QAmhtPrqQlZHW415OZS5vlCwdUBAVPT+Danpi/o/gr5rWrNRkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7297
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_235531_783603_6A8C7941 
X-CRM114-Status: GOOD (  19.96  )
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

SGkgS3J6eXN6dG9mLA0KDQpPbiA3LzIvMjYgMTE6NDYgQU0sIEtyenlzenRvZiBLb3psb3dza2kg
d3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gVHVl
LCBKdW4gMzAsIDIwMjYgYXQgMDI6NTQ6MDBQTSArMDUzMCwgTWFuaWthbmRhbiBNdXJhbGlkaGFy
YW4gd3JvdGU6DQo+PiBBZGQgYW4gb3B0aW9uYWwgInNmZHAiIGNoaWxkIG5vZGUgKGNvbXBhdGli
bGUgImplZGVjLHNmZHAiKSB0aGF0DQo+PiBkZXNjcmliZXMgdGhlIFNGRFAgYXMgYSByZWFkLW9u
bHkgTlZNRU0gcHJvdmlkZXIgdmlhIG52bWVtLnlhbWwsIHNvIGl0cw0KPiANCj4gV2hhdCBpcyBT
RkRQPw0KPiANClNGRFAgaXMgdGhlIFNlcmlhbCBGbGFzaCBEaXNjb3ZlcmFibGUgUGFyYW1ldGVy
cyAtLSBhIEpFREVDLXN0YW5kYXJkaXNlZA0KKEpFU0QyMTYpIHJlYWQtb25seSBwYXJhbWV0ZXIg
dGFibGUgcHJlc2VudCBpbiBtb3N0IFNQSSBOT1IgZmxhc2hlcywgdGhlIA0KdGFibGUgY29udGVu
dHMgcHJvdmlkZSBiYXNpYyBpbmZvcm1hdGlvbiBhYm91dCB0aGUgZmxhc2guIFRoZXJlIGFyZSAN
CnN0YW5kYXJkIHRhYmxlcyB3aGljaCBhcmUgc3BlY2lmaWVkIGJ5IHRoZSBKRURFQyBzdGFuZGFy
ZCBhbmQgdGhlcmUgYXJlIA0KdmVuZG9yIHRhYmxlcy4NCj4+IGNvbnRlbnRzIChlLmcuIGEgdmVu
ZG9yIEVVSS00OC9FVUktNjQpIGNhbiBiZSByZWFkIHRocm91Z2ggTlZNRU0gY2VsbHMuDQo+Pg0K
Pj4gU2lnbmVkLW9mZi1ieTogTWFuaWthbmRhbiBNdXJhbGlkaGFyYW4gPG1hbmlrYW5kYW4ubUBt
aWNyb2NoaXAuY29tPg0KPj4gLS0tDQo+PiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9q
ZWRlYyxzcGktbm9yLnlhbWwgfCAxOCArKysrKysrKysrKysrKysrKysNCj4+ICAgMSBmaWxlIGNo
YW5nZWQsIDE4IGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9qZWRlYyxzcGktbm9yLnlhbWwgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2plZGVjLHNwaS1ub3IueWFtbA0KPj4gaW5kZXgg
NTg3YWY0OTY4MjU1Li45OGZkOTU0NTk4YWIgMTAwNjQ0DQo+PiAtLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2plZGVjLHNwaS1ub3IueWFtbA0KPj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9qZWRlYyxzcGktbm9yLnlhbWwNCj4+
IEBAIC0xMDMsNiArMTAzLDIwIEBAIHByb3BlcnRpZXM6DQo+PiAgICAgc3BpLWNwb2w6IHRydWUN
Cj4+ICAgICBzcGktY3BoYTogdHJ1ZQ0KPj4NCj4+ICsgIHNmZHA6DQo+PiArICAgICRyZWY6IC9z
Y2hlbWFzL252bWVtL252bWVtLnlhbWwjDQo+PiArICAgIHVuZXZhbHVhdGVkUHJvcGVydGllczog
ZmFsc2UNCj4+ICsgICAgZGVzY3JpcHRpb246DQo+PiArICAgICAgVGhlIFNlcmlhbCBGbGFzaCBE
aXNjb3ZlcmFibGUgUGFyYW1ldGVycyAoU0ZEUCkgdGFibGVzIGV4cG9zZWQgYXMgYQ0KPj4gKyAg
ICAgIHJlYWQtb25seSBOVk1FTSBkZXZpY2UuIFRoaXMgYWxsb3dzIHN0YW5kYXJkIG9yIHZlbmRv
ci1zcGVjaWZpYyBTRkRQDQo+PiArICAgICAgZGF0YSAoZm9yIGV4YW1wbGUgYSBmYWN0b3J5LXBy
b2dyYW1tZWQgRVVJLTQ4L0VVSS02NCBpZGVudGlmaWVyKSB0byBiZQ0KPj4gKyAgICAgIGNvbnN1
bWVkIHRocm91Z2ggTlZNRU0gY2VsbHMuDQo+PiArICAgIHByb3BlcnRpZXM6DQo+PiArICAgICAg
Y29tcGF0aWJsZToNCj4+ICsgICAgICAgIGNvbnN0OiBqZWRlYyxzZmRwDQo+PiArICAgIHJlcXVp
cmVkOg0KPj4gKyAgICAgIC0gY29tcGF0aWJsZQ0KPiANCj4gV2hlcmUgYXJlIGFueSByZXNvdXJj
ZXM/IFdoYXQgc29ydCBvZiBzdWItZGV2aWNlIGlzIHJlcHJlc2VudGVkIGhlcmUgYnkNCj4gYW4g
ZW1wdHkgZGV2aWNlIG5vZGU/DQpUaGUgc3ViLWRldmljZSBkZXNjcmliZXMgdGhlIGZsYXNoJ3Mg
U0ZEUCByZWdpb24gZXhwb3NlZCBhcyBhIHJlYWQtb25seSANCk5WTUVNIHByb3ZpZGVyOnRoZSBT
UEkgTk9SIGNvcmUgcmVhZHMgdGhlIFNGRFAgYW5kIHJlZ2lzdGVycyBpdCBhcyBhbiANCk5WTUVN
IGRldmljZSByb290ZWQgYXQgdGhpcyBub2RlLkl0cyBjb250ZW50cyBhcmUgdGhlbiBjb25zdW1l
ZCB0aHJvdWdoIA0KTlZNRU0gY2VsbHMgLS0gYSAiZml4ZWQtbGF5b3V0IiBmb3IgZGF0YSBhdCBh
IGtub3duIG9mZnNldCwgb3IgYW4gDQoibnZtZW0tbGF5b3V0IiBwYXJzZXIgZm9yIGRhdGEgd2hv
c2UgbG9jYXRpb24gbXVzdCBiZSBkaXNjb3ZlcmVkIGF0IA0KcnVudGltZSAodGhlIE1pY3JvY2hp
cCBFVUkgbGF5b3V0IGRyaXZlciBpbiBwYXRjaCA0LzcgZG9lcyB0aGUgbGF0dGVyKS4NCkl0IGlz
IG5vdCBhIGJ1cy1hZGRyZXNzZWQgaGFyZHdhcmUgc3ViLWRldmljZSwgc28gaXQgaGFzIG5vIHJl
Zy4NCg0KVGhpcyBtb2RlbHMgdGhlIFNGRFAtYXMtTlZNRU0gYXBwcm9hY2ggc3VnZ2VzdGVkIGR1
cmluZyB0aGUgdjMgcmV2aWV3LCANCmluc3RlYWQgb2Ygc3BlY2lhbC1jYXNpbmcgdGhlIHZlbmRv
ciB0YWJsZSBpbiB0aGUgU1BJIE5PUiBjb3JlOg0KDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1hcm0ta2VybmVsLzIwMjUwNTIxMDcwMzM2LjQwMjIwMi0xLW1hbmlrYW5kYW4ubUBtaWNy
b2NoaXAuY29tLw0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCj4gDQoNCg0KLS0g
DQpUaGFua3MgYW5kIFJlZ2FyZHMsDQpNYW5pa2FuZGFuIE0uDQo=

