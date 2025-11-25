Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F39BD0E6E5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 14:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dzgyC5mae7/1MWnuKyayoHr/JeBZWDjZVN1fUFLF+48=; b=qs4D4zDBd0U5k2xz38rFtuFM+v
	yKa85OTNaPh34wUi77pyWpK/EG5hmvam/W2edjfyV/r+zRWK//11Ba4QVSr+blCOTGHyz0vUdwehM
	B79CxnjxKcf9CD7Nu4RG7QXMWS7wWB1W5F45/weY1LVi/c9+3OFseM5qsP+48hg0rFwGc0szQT3Fe
	P8fVswwADLL44xRXgPU60iup+2j8fTBulerUc61EKjl1v5ldJADvaLTlwoSK8dKE+U8VUY5Bnvj9Z
	v6q0X4yvw8ZpIWI2K1EcsY/tA+AWa5suyB8mJu5OKDPq8EndA3TcKuHgBvR5BbohNwQEG1DnnP+Sg
	IWVkurTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNtma-0000000DPJK-1rHl;
	Tue, 25 Nov 2025 14:12:40 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNtmW-0000000DPIj-1SZ2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 14:12:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aS1pfqCEEHml/M53eeMBa8P4HgnRT2xy7gidNv3DHqzKu4jzpBS6bVq9/Hk+O/o85X4Gwgc3bA8uHImO8VBhPDMwcxN2lDfDyUoVhFHOJ3CLafkkAxZf3ST2uvd+Rf0FyGR4TXZm9ZGAZTCeXaLzugmPWPcc11GjYBAvzk5Li6DG+68UaUqIsGpWbMBQByzMiJQ9qeLdXLQhY8vmbMMkUlOLmR3yuZUlrDSWWt5k/DYN03CrS3nPDrT2irgXb7himot3fbm5aeomeBoHD33vwnvHmwYpVeqXT56vvWXK0chVS3SS2chj2hK+shMxbjr92BFB98o1bZOasUiodnHVMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dzgyC5mae7/1MWnuKyayoHr/JeBZWDjZVN1fUFLF+48=;
 b=jMs+lH9aLuCmnRw9iCGTP/JmsYqT38EpPsipjDnbn57QaVER6RZRe/NUAkBHj88x/4y69S10cPga/6vx5fvoY0jk2zLcfzhTtmI5dGi/t4adRO8yCcV14tund8iCYPnwPt7W/bsH75eGvuccdH6i3ZHu+qF13+T3MqGix+Jgncf1nzyVtRUXgC813geHaocZqJ1l28zW1fRcNuuHDPojW6LqoOje9mkjDBvkCnWkF7eChJxHk/kbPL43qarqoBpJSggkYm18RbBK9utXfet/PnnjSvMGB76W3E3irTGlt9+ksS0IwJc+bR8JHuRRCbv/w699iPWvL1pYubbzaNW3cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com (2603:1096:301:117::13)
 by SEYPR06MB8248.apcprd06.prod.outlook.com (2603:1096:101:2f4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 25 Nov
 2025 14:12:24 +0000
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d]) by PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d%3]) with mapi id 15.20.9343.009; Tue, 25 Nov 2025
 14:12:24 +0000
From: Gary Yang <gary.yang@cixtech.com>
To: Conor Dooley <conor@kernel.org>
CC: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject: =?gb2312?B?u9i4tDogW1BBVENIIHYzIDEvM10gZHQtYmluZGluZ3M6IHJlc2V0OiBhZGQg?=
 =?gb2312?Q?sky1_reset_controller?=
Thread-Topic: [PATCH v3 1/3] dt-bindings: reset: add sky1 reset controller
Thread-Index: AQHcXQwhfNCb98lfBUeduaIW5fDwVrUCPheAgAEy2aA=
Date: Tue, 25 Nov 2025 14:12:23 +0000
Message-ID: <PUZPR06MB5887CB84BC4D006EC594B654EFD1A@PUZPR06MB5887.apcprd06.prod.outlook.com>
References: <20251124063235.952136-1-gary.yang@cixtech.com>
 <20251124063235.952136-2-gary.yang@cixtech.com>
 <20251124-selector-blemish-ec6e9a356bc6@spud>
In-Reply-To: <20251124-selector-blemish-ec6e9a356bc6@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR06MB5887:EE_|SEYPR06MB8248:EE_
x-ms-office365-filtering-correlation-id: 39078f32-62d5-4fa3-60b0-08de2c2ca7f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?gb2312?B?OHRzWXR2OHl4SWdrYTd4OHlGV1FBUzBhcVdOY1FFeE1mb1RDcjBZOG54NFdE?=
 =?gb2312?B?blRFVHVRdE84OUFtZ1BEVkxoTlM5R294Y0hTck9XZWxURjI1NG9FV1RCc0li?=
 =?gb2312?B?d2JSRkN4R1FOTFp0UGRweTY4VTBFSEdwOVk1UUhEVmRMMFpMNmd4UWJicWcv?=
 =?gb2312?B?cUY0VzNrb0JacEZJdm1zYVZ6SzBCcmpxeU8rNkRTY1NDVlg2eHJoaU9rallh?=
 =?gb2312?B?T2NXeUtsbklVdkJyeGpnZUtjS3N0WFNaNFFSVnk0RVE1bWkxK3p5Sk8yUGRs?=
 =?gb2312?B?RGFPeTNENU9jeERycjdIMVlFSzdSeUMyVTgwZVBCazNXN2pnQVprWFJ1YUsv?=
 =?gb2312?B?b2tqUVVqbndqT213ZmE5eWJRS21kZVlpblpKc0I0YkJPK0hHVGN1RjB4anIr?=
 =?gb2312?B?K0dmWCtIdHVMeXZwb2pZbnJTb0xua3VwUDduTWp1VEV0Y1VLbjlod0tRcFdr?=
 =?gb2312?B?Q0xtNFZIMnpIUWIxeVZ6TzlyQTN1RnNuTmJNaWpSL2ZDMUxCNlZyWThYbGdW?=
 =?gb2312?B?L0czRjE2c2I2NTRQVktIeGYzbUh5aGpTWUxoRkEvT1dUbC9jQ0FtNldpdksv?=
 =?gb2312?B?VUZtOTVnUk5BOURhWTlERGt4RnNpV3FiVTl3WHU4bjdDNzVld0xEWVU3TGlC?=
 =?gb2312?B?ZXZjNjNKaFh3TmdpeVpFU0x3bWlBK1pVZ0xkUGxuWkdtVWhNZ2J2bUZ0eFJh?=
 =?gb2312?B?WFhBY0FNYUpBenFtb1RYU0ZjSlB5WFBQcmpwTEZRRTczVnJadkRkRUtKMTN0?=
 =?gb2312?B?Sm1TVWN5RkJXV3JLR1VpUmxTQWcwd3VNK2RhOG9ZdGhpeXV0blNlWnVKWjUx?=
 =?gb2312?B?aFZKZTZqcmI2Z2J3WitKaTQ1YmdERkRzY3lpLzBJeHc5Njc3d2dFOXA3RHph?=
 =?gb2312?B?WWVDOFRSRnNDYUU1eFEvZGxyczJLQVRkbHRKRUNFcUJvdm1zUEJuR3NUNHVR?=
 =?gb2312?B?bUR4TGpCREgwTExzN1Jwai92ZXN6WHJ0MEVKNURLMVloRm5LenowMnZ5Q3Bw?=
 =?gb2312?B?UkZXQzhkZ0NTK1cvT3F2TlVNbGRjMUY0WjlzdXNhNzFFdTVLTDZWUmoxQm5v?=
 =?gb2312?B?czFWYkxZQ3VrZHVkQTV4OFRiQkNTNFJJZHNibEtvbnFjNTZveEwrd1FKYVZx?=
 =?gb2312?B?MEtTRGk0T3hpR0pMdmFYOG8xc0p6b3MvS2d3U2ZBSXVSYkE2RlBDeVVvbmVH?=
 =?gb2312?B?RFhlTHdzUDIxUUJoTVovL1pVdDhUcDdQWjNOd0gyTVNtSlpzQS9ZQ09vTmFz?=
 =?gb2312?B?MVE0bG8wUVllbGUvaktwbUQ0UEJzaVB5YTJBTVZLVXZlR1JaUS83V1RMQUMr?=
 =?gb2312?B?dEI0Vmh0bFlEQTlRbGFGRERCMGNpSU1jdlpVQ0hMa3liSXVZYk9na0lYTVFY?=
 =?gb2312?B?S0lxekRTTVJnbHlpd3YzM0wwbFFQdGQ1QmF1WXZCS09tY1BocEFraE5LeEFK?=
 =?gb2312?B?VUdCNmlZNHNmUUVwMXg0aGNZOEtURjRZWDhPVmYxV2YzVksvemVuMEkzcW1i?=
 =?gb2312?B?WVhLK1BIc2Y0SDJhYkZoZ1BYTml3R2s0TlducXBSTkw2N041NzFQNDhNeEl3?=
 =?gb2312?B?YlgrazFjYWZjclhOQTBoRHBzR1VHaHc3elJpd2JtRGNrczJQTWoreUFBSFBF?=
 =?gb2312?B?R21hUUlTdFUvcXdFSEhZUDlTZ202RXAvdFNhUS9JS1I5ZWkvdkI1THZueEw0?=
 =?gb2312?B?dXpTcC9pU3hRYWxsc3pYU2xJN3ptc3hoSTZRdWFNQXpVMnJPY3JaQ2I0MkR2?=
 =?gb2312?B?aHRCWTlod1pNcFNucmxXTmdLTmM5bzFKV3NWZnh3L3Y1UVVzSDk1SVFibUxo?=
 =?gb2312?B?aGJYMWJZRFF3K2VxQVdRaS80KzNnNWVpaS9XcHR6ajN1RTVZOUYranlsek9J?=
 =?gb2312?B?MExZa2h1emdoVnkrVnFhQnVFOVdXTkViUUdkVmxkWWlDVUNiVnR6Q2lVK1Ro?=
 =?gb2312?B?b3dBclRpZ2NCT2N2cFdzWWdYQUJSb2FPRWZNTXEvMWhNTUxDdFg2ZHdJOVlM?=
 =?gb2312?B?NmFaNXN1WkhRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5887.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?QlpSaGxlRW5yMDhUcEZHUWdoa2hMQXRaRjlCSjlIZW03VU9mN3dYMWxTeDk2?=
 =?gb2312?B?VHYrRnMwTlpJdzBnUFp4OG5xUlJWSXZXRkF2SGV0NXBLVU1SOWIrcnZ5Z3hZ?=
 =?gb2312?B?QXV2STlyeURaUHk3S2ppMTRaQW52enNJNkY5K0UzUW1aczk1N3ZaSWFFMm5s?=
 =?gb2312?B?TEw4Wk1lQXhiWVhkMFpBb1g4K1FBRS9QYUo0N1pjNTYxRC9zOTUzUnJGTS9Z?=
 =?gb2312?B?dEVtankyYWlsdi81TmlUazFzay9DbllyczgvckFvZFdjVHcwaXRINkROMHcz?=
 =?gb2312?B?U0pOSlc0ZExwNTNpUGJrMUZ2Z01tSzRTY05OdkdtTGM3RjNGWGJ6UHBGK0Yr?=
 =?gb2312?B?VXpFcFIwZ2RuTEwzYjFtb1o5Rkp0STZzdUZHMmxnREdleDQveWVPL21GeTZh?=
 =?gb2312?B?RjkxYVJaME1WQVhDZjdWNVBZU3lIb3M5LzRkZ0h4M1UvbFdmZFg0SzFIakZh?=
 =?gb2312?B?a3UzSjBsci9mbzlPLzlmclJKNk9hSnUvVDdHeWNaQUc4U21ORWVBeTUwMXJ6?=
 =?gb2312?B?cEE5elFsZE1yRjFqb3N3MmhncWt6aklJVUlvaWhnT1dPOW80OUpjK0lnbFYr?=
 =?gb2312?B?UU4yMGg0eDBNWTMrZFE1MmRSUUdSV2YyRU40R042KzduWWg0ZlFZY2pKejRk?=
 =?gb2312?B?VXZlNVYxSWVDWktTUE5kZGpWeUdNbDFjWUdnTUlhQ0VZTlVwSTRhRTFXU0dG?=
 =?gb2312?B?NjIwNjZLSFRYeHA5ME5lYXR3OGhsT0N2RDlvNWQvYXR5TUk5RUlMeHJqMjZx?=
 =?gb2312?B?VW1qWFl5d0hZSEVNS1RKV3NCMFprb2QxaFRHMmc0M0xiK3pNblJLRGxoNklp?=
 =?gb2312?B?bE55ZTVORXZ3ekJQN3kzVUk5Y3plU2VERExrVlMxNDR0Y1RHa0gyRDYyOE0v?=
 =?gb2312?B?MStTRExQSGtJUHhQZGpjOTVFN3U1VGE2bEIzalNpVGJmVTNjMXhaK2pZYldO?=
 =?gb2312?B?N3FpVHZkdEVlY2MwbUVlQmx2Nys4NEdSNXdhMGwwVUIxSEVURmpqREM5RnR2?=
 =?gb2312?B?blhQU0JvVmVYdTRtb1dMcmhQZGVpeVJTK25LY2R3R2k2WGZxRkRuUTBPdStq?=
 =?gb2312?B?VDhOUnJrb002ejNUdHhWd3FrS1M4d2tWSWc4VTRRWjZwWE5ycGV2NWxkV1FG?=
 =?gb2312?B?WW9HRGdTTjdvMmZaUWVWVjNEdE5mYU82MllxMU9aSVd6eHJveHp6aE13aVFi?=
 =?gb2312?B?UW1VTGozTXJtVXgyZysyWUY1dElVSS90elpJcmU2VFQrNXlPYk4wQVN4Ym5Q?=
 =?gb2312?B?V3pxZVJhc1h0NHJuQTBueEF1dGNhQ3dwQm1qWFV2b0ppV1RwVXhvUGRabm1p?=
 =?gb2312?B?QkpFWGEzckU4M205eGtnVHNsMDNjdTlDL3c3VlFYQkd6YzNUOWZEYnhDbnNZ?=
 =?gb2312?B?NVJ6QWU1WlV5QUtaVnkyck9vNE93RGRlR2kwclYxdzBCdlp2RFdJTi82bUZs?=
 =?gb2312?B?bkZJZytUbDVEZ292R0JXQ1hnWGs1ekcxUkdDSmJKNmVBTTVZcXdaRGFqL0tj?=
 =?gb2312?B?QklVVlIwT0lHb045TmFBdEE0NGhkUk9XZmwzRDlhVlRmYmNPYi9RTlhhTHNs?=
 =?gb2312?B?Z3hqVURIY0V5WkhDOVNVQ3Bub01UTGU3Q1JWZlNqUzQ5dDFramVZenZUWU5O?=
 =?gb2312?B?eGF6ZnVORWJHeUoraW9uVG5lbzZlaTZ3dlNjaFJ2Umc1cVpRcEhGTm1NTmRa?=
 =?gb2312?B?cUV5UEFwdElhTXYwQkNmRVpBRzhtMjg2Y1FjTjB5Y2NzNjIxaFA5eVp0ZHN2?=
 =?gb2312?B?NDB0THc5M0JVU3d3OW5hejQ3WVVmVUY4Y1ZiRGhhNmNIdGdCdFk4dmFHdjdI?=
 =?gb2312?B?cTV3OEtpeVovL1k1L0hMbmVBTVJwSXVFb3ROczByb3dDQUZjZWU0bklwc1h0?=
 =?gb2312?B?UTBWdWdYaGVJQVRYdWFsT2xDZlhGajNnRGZ1azFMQ3JnaUhWeHk3YjBNdWp6?=
 =?gb2312?B?dnNhMDlrc3MvbjNLcW5Bd2k5WFRrUnJoT25hZkFhcGJxNFlWaTFud1VNa2o1?=
 =?gb2312?B?cVJ3S3lIbFNIUHhuekY4Wk9uUGpoanFrS2xuSzJMcVZMTHZWUmNWcllISlZT?=
 =?gb2312?B?WERGS0RPWmZXOWlFUk15cEIvNkx4ZUk1dFIyMFRTcTlqVTVZbk55WDluRWU4?=
 =?gb2312?Q?1ljViiMFatnlJaFAEvcLbndCp?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5887.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39078f32-62d5-4fa3-60b0-08de2c2ca7f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 14:12:24.0635
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xMPPnimNJu1zzmpI9XYEKJnpPz3672EUSu+MySgKpcUN8ykXKaN9snLjiHsWygLJzhSrbt6SISA+KSkIUcb4BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB8248
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_061236_517924_F208E56D 
X-CRM114-Status: GOOD (  25.44  )
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

SGkgQ29ub3I6DQoNClRoYW5rcyBmb3IgeW91ciBjb21tZW50cw0KDQo+IC0tLS0t08q8/tStvP4t
LS0tLQ0KPiC3orz+yMs6IENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4NCj4gt6LLzcqx
vOQ6IDIwMjXE6jEx1MIyNcjVIDM6NTQNCj4gytW8/sjLOiBHYXJ5IFlhbmcgPGdhcnkueWFuZ0Bj
aXh0ZWNoLmNvbT4NCj4gs63LzTogcC56YWJlbEBwZW5ndXRyb25peC5kZTsgcm9iaEBrZXJuZWwu
b3JnOyBrcnprK2R0QGtlcm5lbC5vcmc7DQo+IGNvbm9yK2R0QGtlcm5lbC5vcmc7IGRldmljZXRy
ZWVAdmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51
eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IGNpeC1rZXJuZWwtdXBzdHJlYW0g
PGNpeC1rZXJuZWwtdXBzdHJlYW1AY2l4dGVjaC5jb20+DQo+INb3zOI6IFJlOiBbUEFUQ0ggdjMg
MS8zXSBkdC1iaW5kaW5nczogcmVzZXQ6IGFkZCBza3kxIHJlc2V0IGNvbnRyb2xsZXINCj4gDQo+
IE9uIE1vbiwgTm92IDI0LCAyMDI1IGF0IDAyOjMyOjMzUE0gKzA4MDAsIEdhcnkgWWFuZyB3cm90
ZToNCj4gPiBUaGVyZSBhcmUgdHdvIHJlc2V0IGNvbnRyb2xsZXJzIG9uIENpeCBza3kxIFNvYy4N
Cj4gPiBPbmUgaXMgbG9jYXRlZCBpbiBTMCBkb21haW4sIGFuZCB0aGUgb3RoZXIgaXMgbG9jYXRl
ZCBpbiBTNSBkb21haW4uDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBHYXJ5IFlhbmcgPGdhcnku
eWFuZ0BjaXh0ZWNoLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRpbmdzL3Jlc2V0L2NpeCxz
a3kxLXJzdC55YW1sICAgICAgICAgIHwgIDUwICsrKysrKw0KPiA+ICBpbmNsdWRlL2R0LWJpbmRp
bmdzL3Jlc2V0L2NpeCxza3kxLXJzdC1mY2guaCAgfCAgNDIgKysrKysNCj4gPiAgaW5jbHVkZS9k
dC1iaW5kaW5ncy9yZXNldC9jaXgsc2t5MS1yc3QuaCAgICAgIHwgMTY0ICsrKysrKysrKysrKysr
KysrKw0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDI1NiBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0
ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZXNl
dC9jaXgsc2t5MS1yc3QueWFtbA0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kdC1i
aW5kaW5ncy9yZXNldC9jaXgsc2t5MS1yc3QtZmNoLmgNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGluY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvY2l4LHNreTEtcnN0LmgNCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVzZXQvY2l4LHNreTEt
cnN0LnlhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZXNldC9j
aXgsc2t5MS1yc3QueWFtbA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAw
MDAwMDAwMDAwLi5hMjhmOTM4YTI4M2QNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jlc2V0L2NpeCxza3kxLXJzdC55YW1sDQo+
ID4gQEAgLTAsMCArMSw1MCBAQA0KPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BM
LTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkgJVlBTUwgMS4yDQo+ID4gKy0tLQ0KPiA+ICskaWQ6
IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3Jlc2V0L2NpeCxza3kxLXJzdC55YW1sIw0K
PiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFt
bCMNCj4gPiArDQo+ID4gK3RpdGxlOiBDSVggU2t5MSBSZXNldCBDb250cm9sbGVyDQo+ID4gKw0K
PiA+ICttYWludGFpbmVyczoNCj4gPiArICAtIEdhcnkgWWFuZyA8Z2FyeS55YW5nQGNpeHRlY2gu
Y29tPg0KPiA+ICsNCj4gPiArZGVzY3JpcHRpb246IHwNCj4gPiArICBDSVggU2t5MSByZXNldCBj
b250cm9sbGVyIGNhbiBiZSB1c2VkIHRvIHJlc2V0IHZhcmlvdXMgc2V0IG9mIHBlcmlwaGVyYWxz
Lg0KPiA+ICsgIFRoZXJlIGFyZSB0d28gcmVzZXQgY29udHJvbGxlcnMsIG9uZSBpcyBsb2NhdGVk
IGluIFMwIGRvbWFpbiwgdGhlDQo+ID4gK290aGVyDQo+ID4gKyAgaXMgbG9jYXRlZCBpbiBTNSBk
b21haW4uDQo+ID4gKw0KPiA+ICsgIFNlZSBhbHNvOg0KPiA+ICsgIC0gaW5jbHVkZS9kdC1iaW5k
aW5ncy9yZXNldC9jaXgsc2t5MS1yc3QuaA0KPiA+ICsNCj4gPiArcHJvcGVydGllczoNCj4gPiAr
ICBjb21wYXRpYmxlOg0KPiA+ICsgICAgaXRlbXM6DQo+ID4gKyAgICAgIC0gZW51bToNCj4gPiAr
ICAgICAgICAgIC0gY2l4LHNreTEtcnN0DQo+ID4gKyAgICAgICAgICAtIGNpeCxza3kxLXJzdC1m
Y2gNCj4gDQo+IFlvdSd2ZSBub3QgYWRkcmVzc2VkIG15IHYyIGNvbW1lbnRhcnk6DQo+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MTExNC1wcm9ibGVtLW92ZXJib29rLTM4M2Y4ZTQ1
Y2QwYkBzcHVkDQo+IC8NCj4gSSBhc2tlZCB3aGF0IGVsc2UgdGhlIGRldmljZSBkb2VzLCBidXQg
eW91IGRpZG4ndCBhbnN3ZXIgbWUuIERyb3BwaW5nIHRoZQ0KPiBzeXNjb24gZG9lc24ndCBtYWtl
IHNlbnNlIGlmIHRoZSBkZXZpY2UgZ2VudWluZWx5IGhhcyBvdGhlciBmdW5jdGlvbnMuDQo+IA0K
DQpGaXJzdCBJJ20gc29ycnkgZm9yIG5vdCByZXNwb25kaW5nIHlvdXIgcXVlc3Rpb25zIGVhcmxp
ZXIuIFdlIGFncmVlIHRoZSBmYWN0IHRoZSByZWdpc3RlciBzcGFjZSBvZiByZXNldCBzaG91bGQg
bm90IGRlcGVuZHMgb24gb3RoZXIgbW9kdWxlcy4NCldlIGZvdW5kIHRoYXQgd2hpbGUgdGhlIHJl
c2V0IHJlZ2lzdGVyIHNwYWNlcyBvbiB0aGUgc2t5MSBwbGF0Zm9ybSBhcmUgbm9uLWNvbnRpZ3Vv
dXMsIGEgc3BlY2lmaWMgcmVnaXN0ZXIgc3BhY2UgYW1vbmcgdGhlbSBpcyBleGNsdXNpdmVseSB1
c2VkIGJ5IHJlc2V0Lg0KU28gd2UgY2FuIHJlbW92ZSBzeXNjb24gcHJvcGVydHkgYW5kIHNwbGl0
IHNlcnZhbCByZWdpc3RlciBzcGFjZXMuIEFsbCByaWdodD8NCj4gPiArDQo+ID4gKyAgcmVnOg0K
PiA+ICsgICAgbWluSXRlbXM6IDENCj4gPiArICAgIG1heEl0ZW1zOiAzDQo+ID4gKw0KPiA+ICsg
ICcjcmVzZXQtY2VsbHMnOg0KPiA+ICsgICAgY29uc3Q6IDENCj4gPiArDQo+ID4gK3JlcXVpcmVk
Og0KPiA+ICsgIC0gY29tcGF0aWJsZQ0KPiA+ICsgIC0gcmVnDQo+ID4gKyAgLSAnI3Jlc2V0LWNl
bGxzJw0KPiA+ICsNCj4gPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKw0KPiA+
ICtleGFtcGxlczoNCj4gPiArICAtIHwNCj4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9y
ZXNldC9jaXgsc2t5MS1yc3QuaD4NCj4gPiArICAgIHJlc2V0LWNvbnRyb2xsZXJAMTYwMDAzMDQg
ew0KPiA+ICsgICAgICBjb21wYXRpYmxlID0gImNpeCxza3kxLXJzdCI7DQo+IA0KPiA+ICsgICAg
ICByZWcgPSA8MHgxNjAwMDMwNCAweGM+LA0KPiA+ICsgICAgICAgICAgICA8MHgxNjAwMDQwMCAw
eDEwPiwNCj4gPiArICAgICAgICAgICAgPDB4MTYwMDA4MDAgMHg4PjsNCj4gDQo+IFRoaXMgaXMg
YWxzbyBoaWdobHkgc3VzcGVjdCwgYW5kIEkgYmVsaWV2ZSB3aGF0IHlvdSBoYWQgYmVmb3JlIHdh
cyBwcm9iYWJseQ0KPiBtdWNoIG1vcmUgcmVhbGlzdGljLg0KPiBEbyB0aGluZ3MgcHJvcGVybHkg
YW5kIGZ1bGx5ICpub3cqLCByYXRoZXIgdGhhbiBwYXkgdGhlIHByaWNlIG9mIHVucmF2ZWxsaW5n
IGl0DQo+IGFsbCBsYXRlci4gSSBqdXN0IGRpZCB0aGlzIGZvciBvbmUgb2YgbXkgb3duIHBsYXRm
b3JtcywgYW5kIHB1dHRpbmcgaW4gdGhlIGVmZm9ydCB0bw0KPiBjb21wbGV0ZWx5IGRlc2NyaWJl
IHN0dWZmIHVwIGZyb250IGlzIGFjdHVhbGx5IHdvcnRoIGl0IHJhdGhlciB0aGFuIGhhdmluZyB0
bw0KPiByZWZhY3RvciB5ZWFycyBkb3duIHRoZSBsaW5lLg0KPiANCj4gQ2hlZXJzLA0KPiBDb25v
ci4NCj4gDQoNClllcywgSSBhZ3JlZSB5b3VyIHZpZXcuIA0KVGhpcyBzY2hlbWUgaXMgZGlzY3Vz
c2VkIGluIG91ciB0ZWFtLiBJdCBpcyBvdXIgZGVjaXNpb24sIG5vdCBvbmx5IG1pbmUuDQpUaGVy
ZSBhcmUgc29tZSBtb2R1bGVzIGhlcmUgdGhhdCBoYXZlbid0IGJlZW4gcHVzaGVkIHVwc3RyZWFt
IHlldC4NCklmIHdlIHRha2UgdGhlbSBhcyBvdXIgaW50ZXJuYWwgbmFtZXMsIG1heWJlIG1ha2Ug
eW91IGNvbmZ1c2UuIEZvciBleGFtcGxlLA0KVGhlIHJlZ2lzdGVyIHNwYWNlIGJhc2VkIDB4MTYw
MDAwMDAgYmVsb25ncyB0byBQTUNUUkxfUzUuIEl0IGlzIGEgc3lzdGVtIHBvd2VyIGNvbnRyb2wg
bW9kdWxlLCBub3QgU0NQLg0KSXQgbm90IG9ubHkgaW5jbHVkZXMgcmVzZXQgY29udHJvbGxlciwg
YnV0IGFsc28gc29tZSB1c2IgY29udHJvbCwgd2FrZXVwIHNvdXJjZXMsIGNsayBnYXRlcywgc2xl
ZXAgc3RhdGVzIHNldHRpbmdzLA0KZ2VuZXJpYyByZWdpc3RlcnMgZm9yIHNvZnR3YXJlLCBhbmQg
c28gb24uIEJ1dCBJbiBrZXJuZWwsIHdlIG1haW5seSBmb2N1cyBvbiByZXNldCBjb250cm9sbGVy
IGFuZCB1c2IgY29udHJvbC4NClRoZXkgYXJlIGNvbnRyb2xsZWQgYnkgdGhlIGRpZmZlcmVudCBy
ZWdpc3RlcnMuIFNvIHdlIGRlY2lkZSB0byBhZG9wdCB0aGlzIHNjaGVtZS4NCg0KSWYgeW91IGhh
dmUgYW55IHF1ZXN0aW9ucywgcGxlYXNlIGxldCB1cyBrbm93LiBJZiBtYWtlIGFueSBtaXN0YWtl
cywgcGxlYXNlIHJlbWluZCBtZSBraW5kbHkuIA0KVGhhbmtzDQoNCkJlc3Qgd2lzaGVzDQpHYXJ5
DQoNCj4gcHctYm90OiBjaGFuZ2VzLXJlcXVlc3RlZA0K

