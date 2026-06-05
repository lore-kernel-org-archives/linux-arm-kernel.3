Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47252CD6E6E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 02:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UBzMLZKku5HL+q5vUuAgVCyMjQv3/tfyYgT3s8gphBM=; b=bRA2BTmMGLYugpEjz/u9MTIYZc
	dT1phkDuv6gE1piyS3PsH5VXLGZ9bWAKTS1W9+XrrSsaiJLw6qe7EhSNmfIKMSj10BVbx5zER6sLm
	KmheAKESE174fev0DmnsSqBcWx3mIF3CqiePxFRbd2BWRcmz7KTruoL+lGXTsQ/pBE1Uo6xnoUxfU
	cmD95FUqR0U+Ph+ptyPlNPQItq44y1kvv18FKcLVJBAH7ev9rUmtJc9QHSXKTylOAnP3LomuBFnjN
	07n9e6KgwXatSXOydllWKx93Vft0wRjec3FbcV+culRQt19JVeatWQkhSBzSgOXlYugnbXuJeXy+v
	A9Vdh8ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVJvX-0000000HYYI-0IMS;
	Fri, 05 Jun 2026 02:04:51 +0000
Received: from mail-westcentralusazon11010055.outbound.protection.outlook.com ([40.93.198.55] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVJvU-0000000HYXu-3Ozd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 02:04:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rC0Z2cocCUyXOIQpDZA+BWJK7ZY+y1A9D1XYL8y4JHELZC1DhrqPNX9YoHq1riSrmU5Zylzgvf+rTdex+LkVr9ihDpnHh8uxNwdKBpJY0vfFyhTY90OP/ZjwSNBRSm74u9R8maw0SQur55OrMjnlPeVxYAY42hZ/DBRd4d66yWlili5lw9uQ3TLPKjn0FzBQ5vc2tFDFBsv/qc+oDbbqtzEJmvai1Wwk437wWpJWtpz1vJr1KqHLql4D/ociodemJcEMi+DP67b1WY1JrljKOWX4Oz1LDAG//tvre8rXDXtemVNzR1LsKBAMiK7j0yk57M440H50w9dgyF68ynKilQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UBzMLZKku5HL+q5vUuAgVCyMjQv3/tfyYgT3s8gphBM=;
 b=vbUa52FP1zfMy6jSeDQOKLxIKiY4maHWrR+mbK5H8kaM07ZK2hVIM3UECQfEmUXGRKHr/BE8M3xkrAe75JTa/R+E4oKgvQbiAW13Hbj3Fp9FeEayiv09JVhzfLf6ETdfY+0sA+8Tb73Y1wu1j7eHZuVAKG3/TsP+s1rQPILpJ3okG1KECgfzDWJcvDb2RPNiNkisdlLNARQvJ9mRcqxTeNeW2EfYJ8KlG+jGpfUB1FoYsa+bg9dbAbleOp/uKoCPzQpjPHhOgelO3SBP9pXPCdXv/cbYPqcoSRwVeauTiJQ29w67nTXAGcwKgRP9bW4s1Ws0SmOdwMjGcCpxXovk0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UBzMLZKku5HL+q5vUuAgVCyMjQv3/tfyYgT3s8gphBM=;
 b=os+J9goy+Vreo83cjwh9c1lbQnDrRjQGdXUhvYtVCdzCJtdev20bnS796iMVVKvLPYKPJ/7AoSXM3Z2PeiuUwYqW+6eiNthl2VisEprnGb6Ky8HCQ8Vq4lzOyM9EdaL+fGZFLPdpoUnjGxj+Y4t6ElLXIaVTryVqu8LTxFcQH0T40WjOA1f0U974j7xO7tKnCLMwR9nPe5xQ3q9x8CSV7Kx/wAHdS2tFlkbFDFP4W6nc9DpqjeX2S/V7EWCj3y0llapLohwuujf9oDmBz6LvC5h8Xot0WCrY3nA9pAM9Wm8VNKU3fh1e8HjOyBfL6jxLLzQ405UCfmp3dRYUNTw7Ew==
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 02:04:43 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.21.0092.006; Fri, 5 Jun 2026
 02:04:42 +0000
From: "Nazle Asmade, Muhammad Nazim Amirul"
	<muhammad.nazim.amirul.nazle.asmade@altera.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "andrew+netdev@lunn.ch"
	<andrew+netdev@lunn.ch>, "davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>, "kuba@kernel.org"
	<kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
	"alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
	"rmk+kernel@armlinux.org.uk" <rmk+kernel@armlinux.org.uk>,
	"maxime.chevallier@bootlin.com" <maxime.chevallier@bootlin.com>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] net: stmmac: xgmac: report L3/L4 filter match count in
 ethtool stats
Thread-Topic: [PATCH] net: stmmac: xgmac: report L3/L4 filter match count in
 ethtool stats
Thread-Index: AQHc8/xs8lKIhzRBZEySaP8kNuOik7YuyT2AgABuI4A=
Date: Fri, 5 Jun 2026 02:04:42 +0000
Message-ID: <ed1ead6c-0505-4e56-97e3-b8e32e3e8e2b@altera.com>
References: <20260604083037.24407-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <5e912b43-7c06-4d04-9ba0-8f929150429c@lunn.ch>
In-Reply-To: <5e912b43-7c06-4d04-9ba0-8f929150429c@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6964:EE_|BY1PR03MB7996:EE_
x-ms-office365-filtering-correlation-id: 8de5d91f-579e-49e2-1af2-08dec2a6cf1c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021|22082099003|18002099003|55112099003|6133799003|56012099006|4143699003|11063799006;
x-microsoft-antispam-message-info: r9BWqEkhM09vMLlB1r6CddScTXA/Dx1PkkOvol77RDlSxN2q1tFZ9ixsGj1YEL32J8bWnMzlhpP0NvtE2NLH3M9P/UKB85FNDe+wbjPBkWi+hQKd88/PzxqSaLO4h6M4z5Ll43iIDbUpwKkX08QtsK6wpuN+i+L5l/PppxXenoDzAzYV5lK7V2Jq1r9++GEvwgfdhQzW3xO4CJvLAs4Ll/PNcdR3NCTroobaw5ZTbPQDUzErGvsVrSjSW5/G9C8gAbg7lqKk06ec3Rl4MEQtszs3svOoh4smlsJQ/mh0r6NS79DbWBRhLvwEQ0mjjFCSx7KEAogaXIsFwlV4OLT2CYAYKiiLXDWi/pe1UL7zC/Dql2H+RhZDzVhg6hgLFI3RcauJ2TSWd9wMu8H0BI0HSjQCjspFo9REQpVTFk1hsON2KhCBFL9rrkuVHgDCbntfiKuNTTmUWtPAhNAWkSLS0n/6yf5sqVtQ/3OELOLAnzI9HCqhGeQtJ5l7MGxx5XZT+4er4LiKymLuCZOyq8h6ADd+S27vxS3oNzQ2rmk2dh8YKhHcdGNFVan+t5hyXvKEtudXj33FG+vvKQ7nmVTXtJGiY2qutKRtkPtWAgEd98IC/DG7qVKbIR9tulpd1XZdVSQdCVVBPesLHtnQSOn9hmrPqgPL0T8LVvG6Fz/qSqJA4ih0G9ZJfl0Pv5fvjjeRtZZrmfBBbb4nE/lwMf2xuFfQQSjd6W2lQ2jwxrNM5/7FZkcVua3JwymXxRBIdl9P
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021)(22082099003)(18002099003)(55112099003)(6133799003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2F0SFMxMjNYdW53NWJlbWJFZDBGYWR5bjBYb2hhTTdHU0RDN1FUTGlSUDVz?=
 =?utf-8?B?TjlNUlJvaTdnNFNNNjlpelpidVE0bUQrUWFtbC9tSXl5T3gwOHJYdThMcU9m?=
 =?utf-8?B?bFpGbHVLRXA0cys2bU9QM2FzU3ZKOXFhazJEd0dGNlp0clRPUGw2Y2dOMFpa?=
 =?utf-8?B?VVQ0aXB1RlBWeWxBNFI2NUh2OFRXMnRDRUxsL2F0Nng1RWFCNU5EVTVqbFRL?=
 =?utf-8?B?cGpTNkJXVXdKa1RhQkdxN2ZyUDhPQ0RFQ2ZvNi9zZnFDRG9RSE56RGM5MnRQ?=
 =?utf-8?B?UHNudUJQZ0tLWWxjNUpFQStjV3V3Q0xJVkh0cU0xcUZuaGVqTzJjaTJiS0o0?=
 =?utf-8?B?RmhNKzNrZy9yMVVlREQ4L0Y2UVpjOGErb25Sd2RmZU9RTk1KTUppOE9SbUZB?=
 =?utf-8?B?azRaQ3ZJTHRsUFZCWFM3d2ovbmlQZUlucXdIL08vUEg5cUJHMVFTOGRQbXF1?=
 =?utf-8?B?bUFoYzYwa3dieGF2REVJRjlaSTVZVzlqMWEvS2Z1RWZuRHB5TENsMk9TQ3RL?=
 =?utf-8?B?YzlHVFovcFh6VVpXNHd3SXdYdlNVcndQWndEbEJFZ2RIQ0FCZWZOOEs4aTF6?=
 =?utf-8?B?bm01bnhTbFkzMDQ2aGZIR3o4RnFCQjhKdzBOTWtKNVU2RWxybFRJMEx0aVlW?=
 =?utf-8?B?dTB4ZVl0RTdRYmZCSit0UjhlZ016Z2xEL3JlRkRIS3hTVVRFaHg5SGFNZWxV?=
 =?utf-8?B?VXgrZklISUF0WitNcGRnSG5lbW1yMzU3M2VLUzk2VGc1RTFOV0lKQkVLRUE2?=
 =?utf-8?B?cWVjdVFKMTA4RGdlTUQzdmFraTFKNnZzSWlQYUxZTTZNa1VRL0VMODNza3Qw?=
 =?utf-8?B?VzdZVmRmeGREd2lPME5QeXoxUGdaSjJXazI2Q09RdU43NzQ4amdaS0ZvTjJW?=
 =?utf-8?B?aGE3NXdWSDJDbHJaM3Y5VnIyZjlpT2pUVDR5T3NyaDlVWFE5TTlrejhaSDZj?=
 =?utf-8?B?RjdTak04ZFdHUUtzOTdPUzF5c3lLMFd2T00wY1gzSG9ielQ3Qk5ScmxHVDdi?=
 =?utf-8?B?UHhORDBWZTk4bEx6V0RwaGRGWUErbjZCL3JMaUJoaXdDVjEzU0JRVGFHa21I?=
 =?utf-8?B?QmVDVktqYlIvNG8yb1U1Q0pIck9hN0FOMlJWTFpFQ0l2NUhoOUJqdWdRc1py?=
 =?utf-8?B?VG5LcTcyU2oyZU1qSGFrbmp5cEFPemErSEpaSk1KR2FKVTNHY2NrRnFGeE54?=
 =?utf-8?B?WENVcW1id0Z2ZW5GMFdieHMyV3dQYjRBVkRyaXN6YXE2cWNyV2diazhFOEs2?=
 =?utf-8?B?L1JjTmNOK25xczUya3JCWHBKMW0xRHJxcjgyRVlwcmREOWozU2VGYW5KMW1h?=
 =?utf-8?B?Z2xvellQdDhIT1ZmNEZHM1ZkWng5Z3phbGFXY1lQU2N2TGV2K2JPZlVrM1pH?=
 =?utf-8?B?WXlqNzBYY1I2Nzg1YnNYVjNWRk5TaXI4a2RsOXF0VU1sYWdzMFFoejJ3Y241?=
 =?utf-8?B?aE41bVRpRW5NVEN3M3J0UXFKYlBKcHF0K1gxWnJKTVhpblBjdFhjdUNkbTBZ?=
 =?utf-8?B?bVR3UFZDWUJXNGdNbjZSSmVnRXBtK0UwZHZUcGFTUzNsclROSjRNazlBVEls?=
 =?utf-8?B?KzIyaVBObk5JWW1FUys4dHBNdzhHMlloWFZYNm1SM0hVUmtUc3NYaXFXcHNr?=
 =?utf-8?B?ekhQdU1hcjNSTDJ5QUFNZDRPSlNmSEx0cXhLL1pQeWtnQ1p5UFpFY2szbThx?=
 =?utf-8?B?eWNlRmVPY1pFYzU0UW9ZYVZDaFBZZXI5bWJRdVdDdFBGRDAvb1grMDBQNE9S?=
 =?utf-8?B?QVg4KzBNU2FDOXBCcG91NnpDSVdBZTNvaFQ4Y2Z6NVR3K2tDWjUwYnIvWjdN?=
 =?utf-8?B?K2JvSlFRbElZS2ZiVUtncHAwRE1YUjVUait2SG1Uc09FQ2dIYzMwcUtBSFZG?=
 =?utf-8?B?M1JKN0tuaTFheGVibW5NTHF1N2c1Z2dwTm5sWlMyZGhzSjlDVXVScjJQNjQ5?=
 =?utf-8?B?SjVVWTFpMHBXYmJBOFNEKzU2ZEcxa0s0MndmSkJGVVo0aXZ2MGIxZjJ5UElJ?=
 =?utf-8?B?Q0srd0J0cW4xZlFMd0xWNkd2NGJ4ZWxTN0dWTGYzZzdwd0tablRvWnozcTJW?=
 =?utf-8?B?U1pEQWloWTVRL3hxKzAyNVo3OGhKb2VUQmVyb0UzbXdHbG5UTFRORkVDdjN3?=
 =?utf-8?B?a1VKMlFKcWNKcENWeCtLcHk4OWU4bHgyajNiVEEzcjB0UGNQZmszbkRMa3F0?=
 =?utf-8?B?YTBlbm5PTnkwSnJEMitEdG5yL0tqVXh5RGY1TXFIbXduR2JJeUs3Uk0vQzRP?=
 =?utf-8?B?UjRRT0x1c0M5aGp2Vm1IQUhhcE1kWEg5WEIxRkE4eWR6WnQyMTRRMHVMMVdE?=
 =?utf-8?B?eGdmb3ZEV2pkRDBXempZMDlJaVpVY2R2ZWE2bE02WVVOU0MvOVZoYU5rSllW?=
 =?utf-8?Q?ghVIMip4L5x3abna+b0XXzQLahlTtbXPMGqFDJvyR1ls7?=
x-ms-exchange-antispam-messagedata-1: +H2on5ui+ZDXRtsOnCsjGE/ES4Wuolt8ldM=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8336B2B84C9C6446A56FDEAAD4C67520@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de5d91f-579e-49e2-1af2-08dec2a6cf1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2026 02:04:42.7804
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fz/z1V6O/behF5Kr9ylAq4CVAIgw88JO3fc5xQuXhgAds9TjHYCvErCDDzmei+YRfCbL5yf+XG7efrIOHIDwQD/ewXu/k2PlpYKFabNFI+WJSLPOMx3x8bSGTYsSvqZyhj5HShshK8B4nhcOaH4kZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7996
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_190448_867056_3F5C1352 
X-CRM114-Status: GOOD (  10.69  )
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

T24gNS82LzIwMjYgMzozMCBhbSwgQW5kcmV3IEx1bm4gd3JvdGU6DQo+IE9uIFRodSwgSnVuIDA0
LCAyMDI2IGF0IDAxOjMwOjM3QU0gLTA3MDAsIG11aGFtbWFkLm5hemltLmFtaXJ1bC5uYXpsZS5h
c21hZGVAYWx0ZXJhLmNvbSB3cm90ZToNCj4+IEZyb206IE5hemltIEFtaXJ1bCA8bXVoYW1tYWQu
bmF6aW0uYW1pcnVsLm5hemxlLmFzbWFkZUBhbHRlcmEuY29tPg0KPj4NCj4+IFJlYWQgdGhlIEwz
Rk0gYW5kIEw0Rk0gYml0cyBmcm9tIHRoZSBSWCBkZXNjcmlwdG9yIHN0YXR1cyB3b3JkIChSREVT
MikNCj4+IGFuZCBpbmNyZW1lbnQgdGhlIGNvcnJlc3BvbmRpbmcgZXRodG9vbCBzdGF0aXN0aWNz
IGNvdW50ZXJzLiBUaGlzIGFsbG93cw0KPj4gdXNlcnMgdG8gb2JzZXJ2ZSBMMy9MNCBmaWx0ZXIg
aGl0IHJhdGVzIHZpYSBldGh0b29sIC1TLg0KPiANCj4gQXJlIHRoZXJlIGFueSBtb3JlIGJpdHMg
d2hpY2ggYXJlIG1pc3Npbmc/DQo+IA0KPiBkd21hYzQgaGFzIFJERVMyX0wzX0w0X0ZJTFRfTkJf
TUFUQ0hfTUFTSyBmb3IgZXhhbXBsZS4NCj4gDQo+ICAgICAgICAgQW5kcmV3DQpIaSBKYWt1Yiwg
QW5kcmV3DQoNClRoYW5rcyBmb3IgdGhlIHJldmlldyENCg0KVG8gcmVwbHkgb24gQW5kcmV3IHF1
ZXN0aW9uIC0gQXMgcGVyIHdoYXQgSSdtIHNlZWluZywgdGhlIFhHTUFDMiBSREVTMiANCm9ubHkg
ZGVmaW5lcyBMM0ZNIChiaXQgMjcpIGFuZCBMNEZNIChiaXQgMjgpIOKAlCB0aGVyZSBpcyBubyBG
SUxUX05CX01BVENIIA0KZXF1aXZhbGVudCBpbiB0aGUgWEdNQUMyIGRlc2NyaXB0b3IgbGF5b3V0
LCB1bmxpa2UgZHdtYWM0IHdoaWNoIGV4cG9zZXMgDQppdCB2aWEgUkRFUzIgYml0cyBbMjc6MjZd
LiBUaGlzIHBhdGNoIGNvdmVycyBhbGwgZmlsdGVyIG1hdGNoIGJpdHMgDQphdmFpbGFibGUgaW4g
WEdNQUMyIFJERVMyLg0KDQpCUiwNCk5hemltDQo=

