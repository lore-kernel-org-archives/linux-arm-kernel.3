Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACB5F46442
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 09:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cde3A5fI9SJhNgYz48oCDLepFz7fEWdTxNai9pIddkM=; b=1K83KbuN15ZWJf6O2nfN/heRyY
	P8RIl+iklBGyqqxgt5C1gnROeDcfi0BtH6YKCPjVP3vGfnEDpBQxxg3pUMi/wdK57vtCQtcxmZeMw
	UY+y3LU79yy8UHoGPcqZhyTIfiH6TRLBx4JYn9tfSk/Gh+7aW2XTT5zFmjgYNPA6Z4bV6B2q7ilHJ
	GoGDTJKAg6OqbLYNpLSD9kuVfiPLkz1cDfs+CxruM1aRpnzDI62Bv377S9eTkazbl+BcBFkDAIdJk
	SeX8yRKMZAuGp5vVsv7b5EY5kQagn1JryKMVquqMWzl0maTHyEq3a85ucXr+XmsoKG9D1pNVzt1y5
	eBvjuAgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24cJ-00000003i4F-1cK0;
	Mon, 16 Mar 2026 09:52:07 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24cG-00000003i3S-2eD0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 09:52:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YrBrD57/DvEIBbPzVx3muXrmGJHks5Nj2GmVlHYavogbYkKuZzCQ2c72lcxZ8Op2hFGu+fmC5W7I8dKBTiyP/E2xAAAXiRBDxvqzbEGrHn8EnFlfNig1QWegnXT0FS7Rcy5Tcnqz2aRaMQl2opKyo6tpdXobRHNDo/8a8SL87bpa7WX2cKhliHwu8b972DS2Un27P2J2S7o/pyUTpQjMKBtepbcW2ursGdds9x0WZ+Iixk1iQySCoHptnbgztfLSkxrNnPlby98L8ROxR9D5gXomTih4PgVCOU/nzk5rbhNsiuozhNOCzwObZJI1s7BySBwYiqPg/BIiqj4Nm0XbBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cde3A5fI9SJhNgYz48oCDLepFz7fEWdTxNai9pIddkM=;
 b=SHwPedm8NI89Dtje8Vwz6Exf4I8Tsdb2sCGj1HT7e6HtTOdK3Voj/MXyCnMVkRFKRt5dniSkSnq3G4hfauDKTd1VGm+YoFW6DLMIDC9X67vh5NUChHVrQmdT0lfBZsjkhiYOeyIqR0x8yUti3W/0I+AX62mELIBszdh9M+8fXf94lLgU7lQwiaBy9DfRt0BqRNDV587oszTrmFVJ+4p7HP7weUJtrfQQqcAeHq46y6sLO9qVH5w4bxJ8tUJ6eS32bWuoi1HnmIrgJjaqnV9dkcBbimsb1XrCUH1Jiu5F9yjb+tNX9pIUcDoxZjjCyWVsd5ldJ0uXCi34FB3cVKq2WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cde3A5fI9SJhNgYz48oCDLepFz7fEWdTxNai9pIddkM=;
 b=Vc4i10SVfbPX/Un61jY8/ovyCkB9ZXLbXNZXUGVL5kVZeQ/30A5s/1rmj30j/wBUjRiVqfy5nffOi37HXslgRMRv9a7zDi9BM7fLDwrICJ5kl6Qh68fEYMF/pz11C3NdyhG22mvNWWlLqQ5g7vTvemAFQzCT1IYbpxMbXSKOrHDtIrzgMHhKsdF+3XrubIL/W2s1QI1iy2iLm3BtJBER1vMh6l/Eh+keIqaVTvvuVlWncsjKvms03qFUR6wBiSTL0Pb3kM2izfFfVq286US5mHA1U17IYQSWzM01pjwkIkxj9Cvjewo6/CLJ4z8hRDn6Ntb+6JoxmrdrEpX4rMxe4g==
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com (2603:1096:408::791)
 by TYPPR06MB8102.apcprd06.prod.outlook.com (2603:1096:405:317::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 09:51:56 +0000
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::8c70:cb01:78fb:d9c0]) by TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::8c70:cb01:78fb:d9c0%6]) with mapi id 15.20.9700.013; Mon, 16 Mar 2026
 09:51:55 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Ulf Hansson <ulf.hansson@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Ryan Chen
	<ryanchen.aspeed@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>
CC: Andrew Jeffery <andrew@aj.id.au>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/2] mmc: sdhci-of-aspeed: Add ast2700 support
Thread-Topic: [PATCH 2/2] mmc: sdhci-of-aspeed: Add ast2700 support
Thread-Index: AQHcsqoqa/wkH2eIMUucFBg3jcknirWsIJ8AgAAB8kCAARlecIADsZYAgAACAGA=
Date: Mon, 16 Mar 2026 09:51:55 +0000
Message-ID: <TY2PPF5CB9A1BE65A7A9825422A33715320F240A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20260313-sdhci-v1-0-91cea19c8a67@aspeedtech.com>
		 <20260313-sdhci-v1-2-91cea19c8a67@aspeedtech.com>
	 <352a522b5325e9db80c880dd7a3a052516f3b673.camel@pengutronix.de>
	 <TY2PPF5CB9A1BE6C2F2EFFA36CD917C623CF245A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
	 <TY2PPF5CB9A1BE6CFB3FA0165159C68D3F0F242A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <618f82e69dab57f9ba335e2fc4bb62d2d601f7cc.camel@pengutronix.de>
In-Reply-To: <618f82e69dab57f9ba335e2fc4bb62d2d601f7cc.camel@pengutronix.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PPF5CB9A1BE6:EE_|TYPPR06MB8102:EE_
x-ms-office365-filtering-correlation-id: 19961d87-1697-4b06-081d-08de8341a896
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info: dBuK6HFeq/JVgfBJFpdqM8y48R2gMLMwAt3ZNVRMhVTeMfZJ1CnsjK9060SErHvh5W2x/b+fh4PEfNpVmfjp0JwjG4JgSOca1a8JphoDlOjrPZPa4FzMt7nGs6lkipx9ImLeszNa1HEwea0zCS0UiMBV+r8ka6CLNxdR3XoC9eWd3FcA81iaGqhnlFUJL+zJbvUCt2MvpyYaKTcTkQWmwEvMGNxfOAL0JuFGVB1XrC4vFGzamAt9dzkFhaLoDzkloQKALNqkTa+CJQJermKpCO6LbB8CNQWwpSHFLBtylm4DXccWYkJOjdyxFvR2NHMh7QwMTWTja0CgM8RIOxLUtCXwSfWs44S91PznGjCPBcf1Jk4UAZ4shPC35BxEjbBUpJroes7jdHhs7Y4Yk9rVo8sAu97peORQzhW7tz1nVyjRcmz8vpGddHEE95DXviKtfch70+IDreurP5EKBD8kNDc/mH3SurpLnlNQNogFhw1VEsS/Nhov4Dq1Gsr/S/pq9j160ugqeAEsvZiUdWhaa4SDHfhHaF+LmnU7Mh+cBtCZ3F6J07geYyXhtqgOyPd9bNsEMqu0wOsInNKd9ARVkIWBBZjANagOXrlhvbRveYtykEY43k2V3E9tg3kwWjDLc3X46QU6l5FWohNN5AcDYYu9x5Hpu/YJ8Nw4AwuZOh/NEl9g+7J0nNQtSKnhCVtJrDVX1/aBR/TcyA78Kqwqiky06zkpBQn9CLXsSVgyv+mom6gsrvst1dWIKAVJiOcAJ+KhB/8wWH/XtiMDE8Z0ACCEwasZ7v325Cy/ZHNs4po=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?djZCeDlPcWdseE1LS1ZlMGdRN251Z1llU0lGbFoxY25BeTVYTVZ6MTVDQkRR?=
 =?utf-8?B?Z2w0ZGlEZ2R2SmJBWGR6SW04MGRWbGhtdTN2ZGQ4QzdJQjhaczFkeUF5WUF1?=
 =?utf-8?B?WHRZd21ZdFJHeGw5RFJMOXl5anR5YktxU2s5cnh5S29MM2dkWnQzOC9XdmRl?=
 =?utf-8?B?WVJXV1lOWFphLzc3ZkdrMm9mZmNWeGRkd2FWRGxRZ2pXZkdaS09JYnAyVEpI?=
 =?utf-8?B?TktlRWtXZXgvSWdxM2FDWEU1RFFxY2NCaWdBMkxacDluaU9QbXNEaThQbmVQ?=
 =?utf-8?B?d29Hc3RDcUxkejNrUUROcEIxWDM4V2J4ZlZwTU9rSWVVS3Q2S2FWOGxGcVo3?=
 =?utf-8?B?NlpINUJwRVhVYUxrQWR4RkpGaEV0RnoyU2tHQUZXN2taTkdUaHUwcHJsVm5R?=
 =?utf-8?B?bElJSzc4a0c5c0ZrL0RQMnJWbXhJck8ya2hpSGFmQ2pjYWtmbUpEM3U5UDdP?=
 =?utf-8?B?cVYrMFZvL3R5WFlOaGU0QkF6Rm54UGY1blliN0sxaFYrL01CTXYzSm9HWVpE?=
 =?utf-8?B?clY1VlNWQmJiVDM2QkN2T0V1V2trZXhnYUJSU2xVbXJZZTQ5dEl5dTJXYjZF?=
 =?utf-8?B?cU5OVXJENFpERk1NWXUwUGJJdjIydmtDcTQ1YXI2YnhUNFhpVGs2c3gyYWlE?=
 =?utf-8?B?NUJYSWRRYWg2WFdqc0ljbjZVc3oyVmZnUDN5T3NCOGlzR2poQmx2N1pzSWJW?=
 =?utf-8?B?bTNLR1hySThMYTVTWlRUc2ZTUFE4MDFwVUhsNExubzNuVlN2VUlaNDJxNWIw?=
 =?utf-8?B?QTg4dXNWR082MXppVTVjWlRmckFTbGFlMXRldlA5N3YxVGMxL243eVFYWk1Y?=
 =?utf-8?B?aUJ2Q25vejl4QXRQMkYzWVlpL0hMVjAxNXh2anVyd2J6NCtlSzhTQ3ExYVZv?=
 =?utf-8?B?LytXenNha2dQWTFJcUwydEdkSTFOTkd2RGFwWm5lOEUvVUgraXllUCsxaTRJ?=
 =?utf-8?B?Q09RbHk3ZUZhM1RqUldnOTFSTzJSUTFwcGo0RTJkMXVxNDZZSER2ajQ1MUFq?=
 =?utf-8?B?clpTNHNqd09EYjg0K28rWTBpZFF1ck94RW52ZGhseklQM2ZYSmxCd3FXdjhF?=
 =?utf-8?B?MitrUjJEenEzS0l5WkJaUGkrdTRLWTdoSGlMZmJORUhWc1ZydzlhVkRvWmZI?=
 =?utf-8?B?L0QrQXF1bjFlZW9tdW1QMlpKUmhUcHhWNUorZHlpQUYwVFBKRjZjT0MrTnR4?=
 =?utf-8?B?TFgreisvcVk5aktHVHphWGF2TGpvQ2xZNjd0dWJMTld1Sk14RndMWTVzc0tl?=
 =?utf-8?B?VzUxMVNpWGFMRW05aHFZZkZEZlFtMlRoc25BWENTR1NoRXBXQU1pak1WTWl5?=
 =?utf-8?B?QTF0TXVSWVdWem8rUGxIeGRHTGxjUmovVHFCTlE0eXVHSXQ4SEdQMytRdm56?=
 =?utf-8?B?TWVpOGdlNm9QcnhvL0JGTGtvQlVodjJrUjdlTHNWTzhBZFh5ZUVrT0RHbklD?=
 =?utf-8?B?RW1aNXM1RHQxM1JGMDdtekx1bE1HaG53MWVUK1ZHbEhXSG8vc0ZtT3hraEhq?=
 =?utf-8?B?R05KSGdmM0FIYlg5ZGRCU3NyTGowazVZTnBNQVZ4eUxCbDhYN1RYV0lnU2Rh?=
 =?utf-8?B?WFdidU5xcEhWc3gyL2hOT0hPQUdlUkJxcGUzWGwwUDFZQVQrWHB3aWZvOUJE?=
 =?utf-8?B?LzBKb2oxVml2cXgwNFIxUXpJOGpUZE5HTUZ6TjV4dkw3UzErQ2JqSG9WSkc2?=
 =?utf-8?B?bHUxUmxMRlliSVlwU082elV1MzB2RmorK3Rad0t2V2ZURDFiWWRoaElkWlFF?=
 =?utf-8?B?b1RWTHFqRWcwQndOOGlWRWNkV3NiZ2wwb2JUTXRyQ1I2Q3FjVWVPR3VGbEow?=
 =?utf-8?B?dStLUnZOL28xY1VBbituc2JNWDB5TzNPbmUyeEdrV3MvcVZMWitNQ1ZtMXlR?=
 =?utf-8?B?SWw1YS9zRHYxQnV1TlNnTkRPZ2F2NUV6MzhKeGk1M1JYblZ6Wm1aS3pvelFl?=
 =?utf-8?B?TnRvdXBVNWFxM1g0TXYwSVF5bnVLNVNNSFYybEF3NG1uMHgyWTlsMjBiMFcv?=
 =?utf-8?B?Ymd4WTRMaEtDNHVOMTA1RVU0bXBaVTQzWkJYVVB0WG9La1VkRzhnNUZWZEdG?=
 =?utf-8?B?SWl6b0h4VzBydFRiYUNUUmR0M1BNM2p2TG1WcjBmdEZXWUZJWmVqVzlLTVRZ?=
 =?utf-8?B?eXJYampkVkJEUko1eVB0NlZ0MG8yTzJvM2o0dkpvR01aMzBydDJmNzRibGdj?=
 =?utf-8?B?aDZZMlVKYjhyZVduZmowZDhRenNMRzFyeU45TkoyKzQ3ZENvaGhML0xDUXBr?=
 =?utf-8?B?VGRDVXhlRnZKYmF6cTdLdlUrUVNGWTdFRFpDMHN0UHhKK2laa2hBSWIrU3Iw?=
 =?utf-8?B?WUlQUWhVR2w1N0Z3Y3p1SW43engzSzVta2ozY2MzR3hkU1UvSUIvdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: JlX1nEcQFiY1diIM1JgyUsdbiocuYqOF4xl9Q1E6FMgVHdDzb2UYkXReeo+K+HILxuCRQW13dr+53hn9O4WtVp5P4rDhDsNjNj5ZsR6AF2xRrTV+rV++H9xeFgHv0/NnseVuC040JEDH2i9B9ZmoG9tN1zLBghnH+pRswpfUrq8/LzAdBGR46pKv3jgx6xEq5rWAUT7U6YXNk46NGC8C+3bsiB35XJ2Z72jALtGxVcbMgKtJSF6dgiC/Kb7eWwkl90/3Ysv/TMaZzLqiirAl02Z5xcSJWska704oA3DORhJcZTS/KnJapO3Rhgr0NpFPhe9G0/H/mXM5Y/YqhEm5Dg==
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19961d87-1697-4b06-081d-08de8341a896
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2026 09:51:55.7439
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y76wfJCm8X9ob/O8+lsLeyeLb5yzKPNJr8qxARggW0d7NtFoGwwGPprLss7gdR7KRJ9UCidjQlxJQOs1acHUT5sQ+6+FHihDkYjQiDxnk3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR06MB8102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_025204_678265_8FA62E08 
X-CRM114-Status: GOOD (  16.05  )
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIDIvMl0gbW1jOiBzZGhjaS1vZi1hc3BlZWQ6IEFkZCBhc3Qy
NzAwIHN1cHBvcnQNCj4gDQo+IE9uIFNhLCAyMDI2LTAzLTE0IGF0IDAxOjIxICswMDAwLCBSeWFu
IENoZW4gd3JvdGU6DQo+IFsuLi5dDQo+ID4gPg0KPiA+ID4gVGhhbmtzIHRoZSBndWlkYW5jZS4N
Cj4gPiA+IEkgd2lsbCB1cGRhdGUgdXNlDQo+ID4gPiBzZGMtPnJzdCA9IGRldm1fcmVzZXRfY29u
dHJvbF9nZXRfb3B0aW9uYWxfZXhjbHVzaXZlKCZwZGV2LT5kZXYsDQo+ID4gPiBzZGMtPk5VTEwp
Ow0KPiA+ID4gaWYgKElTX0VSUihzZGMtPnJzdCkpDQo+ID4gPiAJcmV0dXJuIGRldl9lcnJfcHJv
YmUoJnBkZXYtPmRldiwgUFRSX0VSUihzZGMtPnJzdCksDQo+ID4gPiAJCQkgICAgICJ1bmFibGUg
dG8gYWNxdWlyZSByZXNldFxuIik7DQo+ID4gPg0KPiA+IFNvcnJ5LCBJIHJldmlldyB0aGUNCj4g
PiBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X29wdGlvbmFsX2V4Y2x1c2l2ZV9kZWFzc2VydGVkDQo+
ID4gSSB3aWxsIG1vZGlmeSB3aXRoIGZvbGxvd2luZyBpbiBwcm9iZS4NCj4gPg0KPiA+IAlzZGMt
PnJzdCA9DQo+IGRldm1fcmVzZXRfY29udHJvbF9nZXRfb3B0aW9uYWxfZXhjbHVzaXZlX2RlYXNz
ZXJ0ZWQoJnBkZXYtPmRldiwNCj4gPiAJCQkJCQkJCQlOVUxMKTsNCj4gPiAJaWYgKElTX0VSUihz
ZGMtPnJzdCkpDQo+ID4gCQlyZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCBQVFJfRVJS
KHNkYy0+cnN0KSwNCj4gPiAJCQkJICAgICAidW5hYmxlIHRvIGFjcXVpcmUgcmVzZXRcbiIpOw0K
PiA+DQo+ID4gQW5kIGFkZCByZXNldF9jb250cm9sX2Fzc2VydChzZGMtPnJzdCk7IGluIHJlbW92
ZS4NCj4gDQo+IE9ubHkgZG8gb25lIG9mIHRob3NlIHR3byBjaGFuZ2VzLiBUaGUgZGV2bV8uLi5f
ZGVhc3NlcnRlZCgpIGZ1bmN0aW9uIHdpbGwgY2FsbA0KPiByZXNldF9jb250cm9sX2Fzc2VydCgp
IGF1dG9tYXRpY2FsbHkuIFNlZToNCj4gDQo+IGh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL2RyaXZl
ci1hcGkvcmVzZXQuaHRtbCNjLmRldm1fcmVzZXRfY29udHJvbF9nZXRfb3B0aW8NCj4gbmFsX2V4
Y2x1c2l2ZV9kZWFzc2VydGVkDQo+IA0KVW5kZXJzdG9vZC4gdGhhbmtzIGZvciBndWlkYW5jZS4N
Cg0K

