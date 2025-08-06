Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8E7C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 07:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+luBFgK18eI05hqQoeX2XJb45T/DS6s+A2Kelz/RcA=; b=U6Luey9JLrYJlecKlwGKABWreK
	U5FKOhqC9UweeIinNUqMuBI1Mnq+lXv2DzLp9APXuyNE8a+Z6Uu6N+zgsoPin3HLJh33qKEFIEU0e
	sQ02ND2ZeHqpakQaDf3Ry+H9bhSBDHgQ3aqcYfTIPCyc8aI8bbkT2wVTF3QPPGhC69CkPohZyfiVV
	vuPXqb8y/JxBFJGHXmJjU03qtAgzu0xYOUkChLew9fT1HhkvLerur72obsF9N5/rta5smjm174Bkr
	dtkTemph0qjyg02siIaWELxoORUj9Z9Es4jcIHPYC6tf8poCc9Qyfgx0wzxBws306eEH+5U6P2rs7
	fubAMk8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujYa1-0000000EVuC-371o;
	Wed, 06 Aug 2025 07:28:57 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujYLv-0000000EUU6-2tUk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 07:14:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BDV1izE/I4RsjUpl0ihATi/RiscjATSmIszDyYl3vh5JdXLL5Hd3HQl7vSYWIlQuqmrIT8mfs+9NvQwOSzkIlOcLPuE3MNOVckNBZbr1yPD60pU7Qty6/XSRjhAzHa3PI9UXnz5iDqVsjh9iABDuU6BfvADPE0WwQ6sfuEEBpH0mtexvwtTBrzyN1WnZZDL7k9mpIMADltQgASfMnZvQnZBdapkGZWLyxGJ3L0y+MOj0vATTp6hnbgbC7k8dxOLCyheYdvyQxBpuojnzcLK9DvI/hQmnJ+tz3Rgw/0FBhhltKeaFgKI/nGJVsnFQ0wnniJhrdtUYBR7NFItDlSqRBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+luBFgK18eI05hqQoeX2XJb45T/DS6s+A2Kelz/RcA=;
 b=H04aAaXgXtWcPAWpBxslUWGnf59vlMgnnVtYBTzbJ0bUpTEfiyhPKA29RVAQsMJDNgVaZX7YO7oti9A5QqUVoQvdu4ao+jstGLgAxZUjd6N2lAYZ9dglTSUjCry82VmxrO+ixmPPHdb6igGE3FD/SfFMgGil8ZrXd8sKvhmYBMyLa8LY39b17hQc1hOT2FE0cfeBwQE90MRij5rUrbIyPMP5005cPCHARN6OqfYCPKLEyGZVEUZAb+kE9MfhiA7bq9IdXYeuSkt/rhtywCYIEyFxSTl72MPgc1GbVoWNjCmyUQ6uFGAseukroVXmiNemPzQ7SvLKgb2EOkZp2nFowg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4+luBFgK18eI05hqQoeX2XJb45T/DS6s+A2Kelz/RcA=;
 b=BHZrKCugvkmUEt2trwXg04q+IbJAbR6lxkXVDwMntGXJa4oLQKxEGbsaWVvkH9Xu0n146b66BtMVYc8rPZVc2EhiTVyD9mcMYk33NAKzLARUAXQN8gQGA0nAWF0/0K+1RFBlGYzjzK2d1HAsxYDdJQuNbopVv8i627r+5Pts4IVInZDidE46nvvdmqvEa6WkwQBTXh89w4P0QpkGh1+CpWj8ekaqsx6MnYEBLhi66TrMXvV9JXGx6AFuiQgLvq0LYaFVy8Q7jVqJihFLQ7uES8MddzyjyHFabVlG7152b+VWYwCDahKS01OqS1pW0Glk1WYz1BIw+OyD8qeVCoUyTQ==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by PUZPR06MB6266.apcprd06.prod.outlook.com (2603:1096:301:11f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Wed, 6 Aug
 2025 07:14:15 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%5]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 07:14:15 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Rob Herring <robh@kernel.org>
CC: Eddie James <eajames@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 2/2] irqchip/aspeed-scu-ic: Add support for AST2700 SCU
 interrupt controllers
Thread-Topic: [PATCH 2/2] irqchip/aspeed-scu-ic: Add support for AST2700 SCU
 interrupt controllers
Thread-Index: AQHcBQGAHPbqy57A20e2dQZRkDylV7RUNCYAgAECPsA=
Date: Wed, 6 Aug 2025 07:14:15 +0000
Message-ID: <OS8PR06MB75414ECA0290018D5D113B62F22DA@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20250804053445.1482749-1-ryan_chen@aspeedtech.com>
 <20250804053445.1482749-3-ryan_chen@aspeedtech.com>
 <20250805153908.GA1807801-robh@kernel.org>
In-Reply-To: <20250805153908.GA1807801-robh@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|PUZPR06MB6266:EE_
x-ms-office365-filtering-correlation-id: cf08e347-ea4a-44c8-d2fc-08ddd4b8da40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?M2l2VUlVSm9NQ01IOXJCTlUyZk9NejZLSVA0VW9QNWRQZUtmQ0QwUWVQWEtx?=
 =?utf-8?B?ZkFIRE9mSWY4ekVPNkttWEFQTmZ6QjBOTjhVQVNXR1FZMHM5RlpuSTJ5TEgr?=
 =?utf-8?B?YWNqRTlqMnhtZllWeVJhTUl6NXVlYllHV2IwK21DejJhMjVyZVkyNmw2Yjcx?=
 =?utf-8?B?SEV3R2FVMnZtZjVwMHUwMEhxYXdWc3c5ZEd3NkVhR1JoNysyL2hvQjREN2w3?=
 =?utf-8?B?Y050VTdzYU9uK1VDdW1hRjhiQ2VwMWExZjh6R3dIL1NyUHE2dFA5NEkrZUZH?=
 =?utf-8?B?VjBQc2lOMUN4L2pvM0s0NG9Id0dRcGkzSzFIQ2w3bDIxT0R3ZktncGtEZ29m?=
 =?utf-8?B?VVRMRWk2a0pUUFVkelBrMFhtTnNNZFp3M3ZQb0dHMG1iem5IemRiUUp0MHZW?=
 =?utf-8?B?dzVJdHNTQzVJQ0lQVDVXWWhuMk4zWWI2VUJ3MFdGSjdrUG5Nbjg1VUdPTGdn?=
 =?utf-8?B?cHRPUFpvbkNidVp5Z2s2SW9SUU5DUWFubnhLdFFSdHZOZFpVbFZnbFE3VHdp?=
 =?utf-8?B?Z3VWN2pENFJDamdBeGpITEtpcXRtT0pJaDRYNHhrQlIwUDhJWFpRRGdWcWVo?=
 =?utf-8?B?My9ueWxrQkdSa1NUczdrZE5lMHJYdkpPVU10aHZTUDdRN2Q2VTBKTEppU0xa?=
 =?utf-8?B?cjFEendVbW91emtLdG1zSjBrNzdEOUljY1RzcDhLcmlVUnE1WnRQQVBGTnZG?=
 =?utf-8?B?Ny9BazVLZU94cTRudGtFRldpTVdGZkRreG5WaTQ1MlBCNlRUU05TYnp0U0Mv?=
 =?utf-8?B?MURHclBxcW5VUkJJdTdUcmFrNTVYTU1pY003S0FhRkFhNG1Fbm55bXpPM2cz?=
 =?utf-8?B?cXlsTm9LbWROUmdIankzS01DRHY2djRScm9XZERjcHkvczVhQnZyRlA5dSt1?=
 =?utf-8?B?SDdjYXRXcjY0azFBU3A3MU1xZ0p4blhIODdTQjByaDE1ck1WTFkxV00zWGZp?=
 =?utf-8?B?ZWZBb0tyK3luMHNUOTJKSVV6TC9lclNlOWVPenRrODZqa0I5ZEFHNXBIOGRq?=
 =?utf-8?B?VE5nY0FPUzBhSGptSjE5azg1ZW9vTnVBYTdkTkIzU05yWUpFWWFDQTlCOW1v?=
 =?utf-8?B?R2hIc20renRydUp1bmJ5TUgrMnczMXM5c2RGT2hhV0lTQVpDQlE3MVdnQUFk?=
 =?utf-8?B?VHp2WVlpUFdVc3k4ZHhaTS9CbVg2T2ViYnZpQ2ZvdWZHZ2cvN29YL0Y3NmpH?=
 =?utf-8?B?VWxwTXd4Z0lOT3hXNkNabjk5Qnh5UEpocU9hM2F6UDR0Slgxb3Z0L2M5RG1q?=
 =?utf-8?B?S1pkc3VIRnpoaXVzSU8xU0hpVWdwQjM3N05vdjNMYzYzK2RkWXFaL25MN09K?=
 =?utf-8?B?TllQOFowQVFMTWRjbGNpTmtSNm1SZFRLeCtZN1Y5NmtqWmJQWEphR0xJN0d3?=
 =?utf-8?B?ZjljMVF0SHp0S3RMTEdjb1gxYnN2R3Q4T3NZWXFkYitRNkh4Z2lzcldpblFr?=
 =?utf-8?B?ZktSYXMvR1E5dDk3UjhnVlo4U0FkWnN0QVlPV3EwVmNzbzRMUGlpR2FXc1VF?=
 =?utf-8?B?K2tBNVFMY2pQOGNpWmxUYWExa3Y4b3RLWTFlR1B3VTIyZjdiL0FwUmQvRlpx?=
 =?utf-8?B?RWs2Mnd6YWEvazJscmZna3NMUG1nZE9TMXFDS1JUNmpLMURMZU1OTitoOTZs?=
 =?utf-8?B?aEwxajliYndWMlpVMjA4aVRPNnRXZ1FZdHNBdkhTU055M1ZyaDFxNzg3NVFE?=
 =?utf-8?B?ZWJFZnlmTnVTOGcrRTdldXY1Y3pCTU4ycHlEL254YURGcWMwcGlwUkkxMmRG?=
 =?utf-8?B?ekZINi9aNmVzc25hVk1Ba0VKd2tDZ0J3TVlVV05UclhRaERkVS84Ymw4SnZX?=
 =?utf-8?B?MndJWDRVeUN3NVVXNlJMTFFuYmpRV2x5MXlqaFhMa3pTbThQK2U0SFNPUFJi?=
 =?utf-8?B?ZTB5Z3EzMUg5eFluZzEvY1V3bnllU0JvSHB3ekZDbERqNVorTHRaTEtJVkk0?=
 =?utf-8?B?cDNrdytuZ1FwT3ZBaTFVMEkvRGRtNFN1dVQ3QjZIRStIVE5aL1VqdzZER056?=
 =?utf-8?B?OHJhQk84d2hBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L1A5WkpRRVp6dUdHOVpjR3lkQlJycjhuU2xqNXdrSDZ3cElBdGVONkhObm5N?=
 =?utf-8?B?cmRYNmRrQ2dUQ24wcGxRc2Q5dThvN0dZdGg2ZXh3c2QrRUZzeWRXVHlteTY5?=
 =?utf-8?B?YSs4K2pZNWwyV1IvQkt5azZDbWx2Nm94SWhHMXJGU1dLS09nSzlUaGYwM3JU?=
 =?utf-8?B?bXd2ZXl3bng3OTEvb20xZGlEMnpWeTU1OHczZ2dJK2RpcjBLVWtqamV0YkFR?=
 =?utf-8?B?MGU0eEpGbitORUVZMmdCeXZGM0szNTFRUWI5THY2NzRuT29EbStYeDFFeHRI?=
 =?utf-8?B?cnVPMHk4OW56YkdPYU11Ri8reTJyQVpwQW96dGlXNTQ4d25nL0EvZVBVZjQ0?=
 =?utf-8?B?RzNudlRZTmZLMytrR3Bld29LS2dpOWRHSGFKaEorYVN3cjVpZEtHbGZhTzVy?=
 =?utf-8?B?YjlsN2huL0ptWFYrNlF5c09JaHRhdmd6N1ViVUxKMk5TUGl2K0J2c1loM0lr?=
 =?utf-8?B?UzcrL091WDZTY25MZ3RsQ1pVdEZDSHRSWVBFM1dmRVBCMEcyUnJoQ0ovS241?=
 =?utf-8?B?RGV3QTJvK3lvdkdHdldkQW1wQWphamVBZVRqd1I0bmVCMWErbmFpQ09MajBJ?=
 =?utf-8?B?cUVjanV3cFR2amZqbnl6dHlOOTdpSjk3NGpuc1RoQjF5M3RTOFlxWkw4d1Ax?=
 =?utf-8?B?azNJU0pHK00rdFdHMmVMWTluU2VrVS9mRk4wNGFyRGpyOVJNU3Z1VnRYV1kz?=
 =?utf-8?B?SE0yMDROZUVSaXgxQmR4MllpMkhmeHgwTkRic29DU01Hdk5PN1hWUUpMU2tk?=
 =?utf-8?B?Y0h0bkNOWTE3bzFUUU5mTHYzemVhbDR2OG5vS1YxdHRZbWxWeC9GSUhlcnRL?=
 =?utf-8?B?ckVoN2o4VnFjYTMrdjg5alBlRHh3YVN1RHBPMHpyM1FBUE9HTnZWSE10dzRh?=
 =?utf-8?B?UG0rWHduL0E0ZXRxcjJWMS9lTDVmWWEvZzR4VnMwR0NIclBScjg0MnlyR1lZ?=
 =?utf-8?B?OXRTQTZWcGhIdEZpN2ZoWTZCQThoVWtTNFp1ZHBUZGZMekNLRk5CdC9qaGlw?=
 =?utf-8?B?MVFsOGtwOHYzTGlsMi9aWUtEVG1XVUdFcHpnaktBWVlHSWR1dDRJdmUxWlFp?=
 =?utf-8?B?SE4xaGtZK1JtVU5COU15SW15bHI0eTlRSkpPenJNMmJrc0tPdGUyQmVoMzJM?=
 =?utf-8?B?VGp5czVOc0Jma0xaMWg1VEs2ejM3QlZSc3l3Q011MG8xYUw0L1Y1Z2xaRmJG?=
 =?utf-8?B?SjRMSW9vZnlZUnl6M0NNZkdSWVlWWFlxMmR6bHYyVXhwaXRwck9YOER5d3l6?=
 =?utf-8?B?VlUwK3BXOHBzVDAwV0E2ZlB0Z0hNc2FFM0I4VVhIdEZXTnJJWmF4M1BrK2ZS?=
 =?utf-8?B?M2E4RGV4ZndIcS9KN0MzT2dyUEVIMzloek5sR1A0T2RMa0pZSUFuTzc0L3VL?=
 =?utf-8?B?dDJ3Q2lYN2EyeDNjQTVtS2lmc29tTTE0QTlaUDV6WkN6QnhabjkvUStkTVR6?=
 =?utf-8?B?YzBPb0JuWDhZYVNJQ1psSk9kc2pzRHFGaFRkMFV4dFhQSnNlNnVyOXUwM24z?=
 =?utf-8?B?dWMvekNaRzYvOXAvRUI0SzA0LzMzWk1BQ3VOeFJLSTRKcDJadHRBMTZaVm0w?=
 =?utf-8?B?bGpYSWJQcEt2SUF5cFU3ZXo1YndKeWRPaHk4ZnZFUlVUbnFtSnFDRmtqUHkr?=
 =?utf-8?B?NEpNTk5NeGJLeG1Cd3JZNWJKRk44dmZLYlBSRlVseTh1b1o0NS84Z2wwSU55?=
 =?utf-8?B?WS9saGE4SWVjc25QRkhLelVPK2oyeXMvNlRTd3JkczB4bXJFa1dxMmNiQUM3?=
 =?utf-8?B?QVYxQTNVcm5FVkhrTVJVMGJmUWwxWWpFZTdCbCtmcHMwRlZNQXhELzdFS3Zk?=
 =?utf-8?B?N2RmOXNhQzBsVG54M1ErTmtrUDFXSjZ0R1psQk54SHoyZUhRVkVITHhRNVVB?=
 =?utf-8?B?YkJOcmJvakxyRENwZWpXRXlmdmMyZXk0bmRRZGo2bTlDelZLZzMwbmUzUkJo?=
 =?utf-8?B?NTJsaXVZTVpHdzhscmVkZUJDdlhlSXpaNzZ1RmJMeDBZK1J5WXNLdmI4cWZQ?=
 =?utf-8?B?aWZ2SmRabjQ0TjljMkQvVGZIZnU0K2UvTUpCM3V6eE4zaTJlTEVEc1JxU2FM?=
 =?utf-8?B?WTVVUFR6WDYrL2VWTURZbFNzU2g5dWM5RzJuVnk4d0JEWlZLSkJGY3pvVVZW?=
 =?utf-8?Q?QGi6RMQEsbTZe5MtAi3BDRi7P?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7541.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf08e347-ea4a-44c8-d2fc-08ddd4b8da40
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2025 07:14:15.6704
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0G6N58ym5lhfBTr59uJ1kvhmiJkE7cdCpdbM3mU3T2S4puOgrphWX8eB6H4cLG5+OKutgNXaBmbvu13uaBHfY40Gti242IxKKiNCyWbOqis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB6266
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_001423_835095_F0E7221B 
X-CRM114-Status: GOOD (  24.26  )
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIDIvMl0gaXJxY2hpcC9hc3BlZWQtc2N1LWljOiBBZGQgc3Vw
cG9ydCBmb3IgQVNUMjcwMCBTQ1UNCj4gaW50ZXJydXB0IGNvbnRyb2xsZXJzDQo+IA0KPiBPbiBN
b24sIEF1ZyAwNCwgMjAyNSBhdCAwMTozNDo0NVBNICswODAwLCBSeWFuIENoZW4gd3JvdGU6DQo+
ID4gVGhlIEFTVDI3MDAgU29DIGZvbGxvd3MgdGhlIG11bHRpLWluc3RhbmNlIGludGVycnVwdCBj
b250cm9sbGVyDQo+ID4gYXJjaGl0ZWN0dXJlIGludHJvZHVjZWQgaW4gdGhlIEFTVDI2MDAsIHdo
ZXJlIGVhY2ggU0NVIGludGVycnVwdCBncm91cA0KPiA+IChJQzDigJNJQzMpIGlzIHRyZWF0ZWQg
YXMgYW4gaW5kZXBlbmRlbnQgaW50ZXJydXB0IGRvbWFpbi4NCj4gPg0KPiA+IFVubGlrZSB0aGUg
QVNUMjYwMCwgd2hpY2ggdXNlcyBhIGNvbWJpbmVkIHJlZ2lzdGVyIGZvciBpbnRlcnJ1cHQNCj4g
PiBlbmFibGUgYW5kIHN0YXR1cyBiaXRzLCB0aGUgQVNUMjcwMCBzZXBhcmF0ZXMgdGhlc2UgaW50
byBkaXN0aW5jdA0KPiA+IHJlZ2lzdGVyczogb25lIGZvciBpbnRlcnJ1cHQgZW5hYmxlIChJRVIp
IGFuZCBhbm90aGVyIGZvciBpbnRlcnJ1cHQNCj4gPiBzdGF0dXMgKElTUikuIFRoaXMgYXJjaGl0
ZWN0dXJhbCBjaGFuZ2UgcmVxdWlyZXMgZXhwbGljaXQgaGFuZGxpbmcgb2Ygc3BsaXQNCj4gcmVn
aXN0ZXJzIGZvciBpbnRlcnJ1cHQgY29udHJvbC4NCj4gPg0KPiA+IC0gUmVnaXN0ZXIgZGVmaW5p
dGlvbnMgYW5kIGNvbmZpZ3VyYXRpb24gZm9yIEFTVDI3MDAgU0NVIElDIGluc3RhbmNlcw0KPiA+
ICAgKGNvbXBhdGlibGU6IGFzcGVlZCxhc3QyNzAwLXNjdS1pYzAvMS8yLzMpDQo+ID4gLSBJbml0
aWFsaXphdGlvbiBsb2dpYyBmb3IgaGFuZGxpbmcgc3BsaXQgSUVSL0lTUiByZWdpc3RlcnMNCj4g
PiAtIENoYWluZWQgSVJRIGhhbmRsaW5nIGFuZCBtYXNrL3VubWFzayBsb2dpYw0KPiA+IC0gVGFi
bGUtZHJpdmVuIHJlZ2lzdHJhdGlvbiB1c2luZyBJUlFDSElQX0RFQ0xBUkUgcGVyIGNvbXBhdGli
bGUNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFJ5YW4gQ2hlbiA8cnlhbl9jaGVuQGFzcGVlZHRl
Y2guY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2lycWNoaXAvaXJxLWFzcGVlZC1zY3UtaWMu
YyB8IDI0MA0KPiA+ICsrKysrKysrKysrKysrKysrKysrKystLS0tLS0NCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDE5NSBpbnNlcnRpb25zKCspLCA0NSBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLWFzcGVlZC1zY3UtaWMuYw0KPiA+IGIvZHJpdmVy
cy9pcnFjaGlwL2lycS1hc3BlZWQtc2N1LWljLmMNCj4gPiBpbmRleCAxYzcwNDU0NjdjNDguLmI2
ZjNiYTI2OWM1YiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLWFzcGVlZC1z
Y3UtaWMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtYXNwZWVkLXNjdS1pYy5jDQo+
ID4gQEAgLTEsNiArMSw2IEBADQo+ID4gIC8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wLW9yLWxhdGVyDQo+ID4gIC8qDQo+ID4gLSAqIEFzcGVlZCBBU1QyNFhYLCBBU1QyNVhYLCBh
bmQgQVNUMjZYWCBTQ1UgSW50ZXJydXB0IENvbnRyb2xsZXINCj4gPiArICogQXNwZWVkIEFTVDI0
WFgsIEFTVDI1WFgsIEFTVDI2WFgsIEFTVDI3WFggU0NVIEludGVycnVwdCBDb250cm9sbGVyDQo+
ID4gICAqIENvcHlyaWdodCAyMDE5IElCTSBDb3Jwb3JhdGlvbg0KPiA+ICAgKg0KPiA+ICAgKiBF
ZGRpZSBKYW1lcyA8ZWFqYW1lc0BsaW51eC5pYm0uY29tPiBAQCAtMzQsMTEgKzM0LDQyIEBADQo+
ID4gIAlHRU5NQVNLKDUsIEFTUEVFRF9BU1QyNjAwX1NDVV9JQzFfU0hJRlQpDQo+ID4gICNkZWZp
bmUgQVNQRUVEX0FTVDI2MDBfU0NVX0lDMV9OVU1fSVJRUwkyDQo+ID4NCj4gPiArI2RlZmluZSBB
U1BFRURfQVNUMjcwMF9TQ1VfSUMwX0VOX1JFRwkweDFkMA0KPiA+ICsjZGVmaW5lIEFTUEVFRF9B
U1QyNzAwX1NDVV9JQzBfU1RTX1JFRwkweDFkNA0KPiA+ICsjZGVmaW5lIEFTUEVFRF9BU1QyNzAw
X1NDVV9JQzBfU0hJRlQJMA0KPiA+ICsjZGVmaW5lIEFTUEVFRF9BU1QyNzAwX1NDVV9JQzBfRU5B
QkxFCVwNCj4gPiArCUdFTk1BU0soMywgQVNQRUVEX0FTVDI3MDBfU0NVX0lDMF9TSElGVCkNCj4g
PiArI2RlZmluZSBBU1BFRURfQVNUMjcwMF9TQ1VfSUMwX05VTV9JUlFTCTQNCj4gPiArDQo+ID4g
KyNkZWZpbmUgQVNQRUVEX0FTVDI3MDBfU0NVX0lDMV9FTl9SRUcJMHgxZTANCj4gPiArI2RlZmlu
ZSBBU1BFRURfQVNUMjcwMF9TQ1VfSUMxX1NUU19SRUcJMHgxZTQNCj4gPiArI2RlZmluZSBBU1BF
RURfQVNUMjcwMF9TQ1VfSUMxX1NISUZUCTANCj4gPiArI2RlZmluZSBBU1BFRURfQVNUMjcwMF9T
Q1VfSUMxX0VOQUJMRQlcDQo+ID4gKwlHRU5NQVNLKDMsIEFTUEVFRF9BU1QyNzAwX1NDVV9JQzFf
U0hJRlQpDQo+ID4gKyNkZWZpbmUgQVNQRUVEX0FTVDI3MDBfU0NVX0lDMV9OVU1fSVJRUwk0DQo+
ID4gKw0KPiA+ICsjZGVmaW5lIEFTUEVFRF9BU1QyNzAwX1NDVV9JQzJfRU5fUkVHCTB4MTA0DQo+
ID4gKyNkZWZpbmUgQVNQRUVEX0FTVDI3MDBfU0NVX0lDMl9TVFNfUkVHCTB4MTAwDQo+ID4gKyNk
ZWZpbmUgQVNQRUVEX0FTVDI3MDBfU0NVX0lDMl9TSElGVAkwDQo+ID4gKyNkZWZpbmUgQVNQRUVE
X0FTVDI3MDBfU0NVX0lDMl9FTkFCTEUJXA0KPiA+ICsJR0VOTUFTSygzLCBBU1BFRURfQVNUMjcw
MF9TQ1VfSUMyX1NISUZUKQ0KPiA+ICsjZGVmaW5lIEFTUEVFRF9BU1QyNzAwX1NDVV9JQzJfTlVN
X0lSUVMJNA0KPiA+ICsNCj4gPiArI2RlZmluZSBBU1BFRURfQVNUMjcwMF9TQ1VfSUMzX0VOX1JF
RwkweDEwYw0KPiA+ICsjZGVmaW5lIEFTUEVFRF9BU1QyNzAwX1NDVV9JQzNfU1RTX1JFRwkweDEw
OA0KPiA+ICsjZGVmaW5lIEFTUEVFRF9BU1QyNzAwX1NDVV9JQzNfU0hJRlQJMA0KPiA+ICsjZGVm
aW5lIEFTUEVFRF9BU1QyNzAwX1NDVV9JQzNfRU5BQkxFCVwNCj4gPiArCUdFTk1BU0soMSwgQVNQ
RUVEX0FTVDI3MDBfU0NVX0lDM19TSElGVCkNCj4gPiArI2RlZmluZSBBU1BFRURfQVNUMjcwMF9T
Q1VfSUMzX05VTV9JUlFTCTINCj4gPiArDQo+IA0KPiBUaGUgcmVhc29uIGZvciBpYzAvaWMxIGNv
bXBhdGlibGVzIGJlZm9yZSB3YXMgdGhlIGVuYWJsZSBmaWVsZCB3YXMgZGlmZmVyZW50Lg0KPiBO
b3cgaXQncyBhdCBsZWFzdCBhdCB0aGUgc2FtZSBzaGlmdC4gRG8geW91IHJlYWxseSBuZWVkIGEg
ZGlmZmVyZW50IHZhbHVlIGZvciBJQzM/DQo+IA0KT0ssIEkgY2FuIHJlbW92ZSB0aGlzIGRlZmlu
ZS4NCg0KPiBUaGUgcmVnaXN0ZXIgYWRkcmVzc2VzIHNob3VsZCBjb21lIGZyb20gInJlZyIuIEkg
ZG9uJ3QgdW5kZXJzdGFuZCB3aHkgdGhleQ0KPiBhcmUgaGFyZGNvZGVkIGluIHRoZSBkcml2ZXIu
DQpUaGUgb3JpZ2luYWwgY29kZSByZWdpc3RlciBpcyBjb21lIGZyb20gcGFyZW50LiBzY3VfaWMt
PnNjdSA9IHN5c2Nvbl9ub2RlX3RvX3JlZ21hcChub2RlLT5wYXJlbnQpOw0KSSBrZWVwIHRoZSBv
cmlnaW5hbCBjb2RlIGxvZ2ljLCBhbmQgYWRkIEFTVDI3MDAuDQo+IA0KPiBSb2INCg==

