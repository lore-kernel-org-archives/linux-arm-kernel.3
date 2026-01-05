Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026D4C2A077
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 08:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VITGdk9ey6ZjpS6n9ecKINgZ6XD+LwCV+XPFgTMzePg=; b=AfXrdMiAYW8kb/Wt56XNHmJlYO
	Mw42hpuhtOIIw5NRt7VM7iJc/lBXedyY2yo4lHOO9HHyKvWv3x/831NCDWKTsAqVbPKKcpqSe8qqn
	+H3Dhyvb6NYIjae4GPYJqXPcV+eNvsCsVWT8hkvnKMw6+MGvZbY14apQ/COb2OXK+E/pN4By/Idx5
	7RZHFCwxlEKOYwbOCCKfTx0V7VUX4y0fTUcp3/5tzFsWJM4bRnZB4FLJfbfv96nUZdw894f3VltjG
	qMpS39aSfbtFHTUnxiptEjmJ7mVgevYLdyp+Je34+1d03lAUV6usBUUCr1Hn0OH+heD1KLiD0BtNF
	nu2KPY9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgHg-0000000B0lV-1Cfq;
	Mon, 05 Jan 2026 08:49:52 +0000
Received: from mail-koreacentralazon11023112.outbound.protection.outlook.com ([40.107.44.112] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgHc-0000000B0i0-2i1f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 08:49:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ASi+NLO5ReP2eY6cox9C9fKjrH7A6JTnsO1nRiCO4e6y6CWXJLcQzW3H+U8owGBQhX1tpdZz+PLSoBU1gKUYBcBsWRhlgQYO0Tj0VYnhZdFCWo1dIi+V4kUTk3YUNb+GaH/oIGbE6JCdWpNO+tDEu4pPKcxeSH/J8jPoQA3AxWGpG6Wu8rz7VSN4C7MpOh/QcHsj7MgMsuqpMItTZiSe+fbiwb3BmXK8L1s2S/s3XL5a6R6WTfu4PJrdY3krfPw6Vat8IsEGC/2tY5ytN7KskbQ6u6yJkz9ujt3JwwC42lXB2hZ8620q9wh7Zcek1ldIyQ2iBQ7JPaDwCuKEPB8hsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VITGdk9ey6ZjpS6n9ecKINgZ6XD+LwCV+XPFgTMzePg=;
 b=aGdqJPidj3Kbt9811K5UyC1p5vAIO7zp6vxQ49OdwgWLWjgb9F870+tkkEzkH/1LwnE8dg/SovV8wqxHekKhqSRK9mhKjX7XhoxGh+q01dmPvT9GImIvFouXy4wt9hofTdPnpgRJYydYK57Njk9rycT8hE0B2duxJ8objurK2c3ZOGGhBrKZLgbXIJZT4IuCgI318mFBJaWuCMjYP36BpMvrLzhUariWMo89Er2f7y/utlR1Yb/F4ryrmFwxRzbFDenMH9duVr0va2IQKVrXH+/vrWJttbkM4kZF0Avqg+EN4VwtW5tlYNcu9IurrNEMqYhpfr0dYzGTgwpFFnD6Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com (2603:1096:301:117::13)
 by KL1PR0601MB5613.apcprd06.prod.outlook.com (2603:1096:820:9a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 08:49:39 +0000
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d]) by PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d%3]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 08:49:39 +0000
From: Gary Yang <gary.yang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Peter Chen <peter.chen@cixtech.com>, Fugang Duan
	<fugang.duan@cixtech.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-cix-kernel-upstream@cixtech.com"
	<linux-cix-kernel-upstream@cixtech.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: =?gb2312?B?u9i4tDogW1BBVENIIHYzIDEvMl0gZHQtYmluZGluZ3M6IGFybTogY2l4OiBh?=
 =?gb2312?Q?dd_OrangePi_6_Plus_board?=
Thread-Topic: [PATCH v3 1/2] dt-bindings: arm: cix: add OrangePi 6 Plus board
Thread-Index: AQHcfU9MA9pbVtmtv0ykgDJk1l8qrbVDPd0AgAAFxIA=
Date: Mon, 5 Jan 2026 08:49:38 +0000
Message-ID: <PUZPR06MB588755A9FB6B42AAA870E30BEF86A@PUZPR06MB5887.apcprd06.prod.outlook.com>
References: <20260104075400.1673101-1-gary.yang@cixtech.com>
 <20260104075400.1673101-2-gary.yang@cixtech.com>
 <20260105-excellent-uakari-of-joy-f0dfa4@quoll>
In-Reply-To: <20260105-excellent-uakari-of-joy-f0dfa4@quoll>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR06MB5887:EE_|KL1PR0601MB5613:EE_
x-ms-office365-filtering-correlation-id: 3194cd60-5df3-486b-0e27-08de4c375c6a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?gb2312?B?b1FMaHExcFpHNStoOGc2Zm5tV3BzMzFuUXF2VzlETEx5TDZ4enM3Rm05ZWU3?=
 =?gb2312?B?WkNIaHl5Uk1MY0R0ZE1zemdiT1ljOVYyRkZrZW84ai93bkVsVGRpMkpmZG1L?=
 =?gb2312?B?a2NnOEtmQzRhSVp0eFpxcFMrVnIrdmZqcE5qQkpwTFR0TDNiTURoakQ2WVZG?=
 =?gb2312?B?aEFBR05uRUk5anZWUFVWVmxDVjIrOVgrQk1oQUN3VWtvMjg5NE1KTGNxM1N1?=
 =?gb2312?B?ajB3c2oxS1lTSXBuR3JQWnJTTVY2Q2ZPNm05SisvY3oyaEYwbWRmUXFtWDQ0?=
 =?gb2312?B?OE5Cb2taZ3d3blYyOURVRzFuaUtVNVFkS3lWZFhkc25UWC9TdjFlMkE2R2Nx?=
 =?gb2312?B?VkU4N3Bub3liQ3VrUUIvL1ZULzFVbWxQSWptYVo5OEh1WEhSUytWckZTSjNR?=
 =?gb2312?B?Z2gvczg3SmsveHJKTVo4d01pQy9vd0tGdHRQL0x2aDd1NXl1TlJNNU94dlNC?=
 =?gb2312?B?YjFPbmVwSHNqSWwzdVhoc292T3Q3TytHRzNEUG1YU1JvYXVZWk1GdUVqTmRr?=
 =?gb2312?B?VmFBaXJJaU9yMGs3OU9VeWFlQ2JHeHorV1JReDhqR0Z1bW94dkFiRXUvU2tG?=
 =?gb2312?B?UFN1L3c5N0ZVMVpGdnVLd0JlYWtDV0RpaTF0OHFsb3YvVlNxS1JlRzZ5RS9r?=
 =?gb2312?B?d3VDclZsa25vTm9UWityYi92K1JlQWUxMjgrcXY3TFIzSko4Z01FQjZrQity?=
 =?gb2312?B?N1Q3QlJOZldFQ1dHRlovQ1JjVXh5SlA1S0k5U1hjN1hSeVZCb2wwNE1wRy9Z?=
 =?gb2312?B?TGhkZWFUYkx3VStpakUrTFZWOWhUUTVkMFhHRlVQem9QZjBEancwbGpwRmdo?=
 =?gb2312?B?WFNFc2JtQm55QTNUMUZISE1UQUgyOGthZGpuL3lRTTV4ZG1wUjN0bHAvZTcv?=
 =?gb2312?B?N0lWZUtOY2FtRzNsY2VZNC9Dbk5WNUg4alVMM1I0Rzk5U2JnRHVDOVpJZllK?=
 =?gb2312?B?YkE5YUs3RHVUTWsrc1lGWENnM0dBdjNKbjNoY3F4MmtJUGVySm1oTm5zaXUr?=
 =?gb2312?B?MGJuNVhRQSttdjVjS0tRck9ja2dVK043aEUwSG04TmFBQ04xM0JkcXVMUlpY?=
 =?gb2312?B?dE5oNXkrMGpaWUJNaGNDQjk1YlF3L2lobW52dE5OSVVtS0lERCs1VWhuanN6?=
 =?gb2312?B?c1MzVG4rUEt1bXBVamJkaHBFQzMrUExRNWJvbUp4WjBabytGSm1rTjE2dmM4?=
 =?gb2312?B?aVRvczRrdk5obGxJdnFrd3U5eEREUHFJY2dMakx6UGRkMGM3SVZNclMwTDhm?=
 =?gb2312?B?a3Vsd3U4UzU5QXBGbnBHa0pKVjVrOS9PUlZ4WXVyRXU3NzhiNWNPdmFtVEp1?=
 =?gb2312?B?c3dlUHMxcEFLU0xzUm5oSFZuVjg1ZUVLbUZURDVPSzhXQXRqMFk0OTI0OUt5?=
 =?gb2312?B?Q1A4cXlCbEVkVUFLa2V5NTY2YVUzRkJqSkdrY2NxY0ljYWJOdjExR1krZEhk?=
 =?gb2312?B?UkhLdE1YYXRxVU9QbkN5THo2NlQxMzhJaTYzeG1uSURVN3NuVzI1V1FYMzhT?=
 =?gb2312?B?YWNXaThicjVWeUFBVURVb3RrVnFJQVlCVnBIRmlsWEthR1Z5YzhCekJFTHA2?=
 =?gb2312?B?N2xzSXNyZjdML3lKWXlFaDkyaVJvSThLelloL3dzVkVVRTU3eUJ5Y3JkSzQv?=
 =?gb2312?B?dysvRFFLVmpPS0I0UFZIUnRsOGdjSm1qS29rMW5XUVFmNit0K0wrMk8zNEJK?=
 =?gb2312?B?NU5JdW9HRG9UMHFlK3A3ejQrdW9McWZObVJqN1kyS1U2NjV4RWlvL3ZoMUk2?=
 =?gb2312?B?M2Fmck5nVE45dUVCUmxDTUFjY2Y4eThRakFpWWc2WXNiK3V4dmtwMlI0KzdC?=
 =?gb2312?B?SlltOGx1RGk3UUhMajMyeGtLaEE3Wk9DSEIvcDBLMDU1Zy9UdlJWWE9peU9P?=
 =?gb2312?B?RnhoNUhSWHd0eXhpbC96UWZjdmRCaG1ZRHZ6RkhtQTlYaGNBYTdtdXp0QWNn?=
 =?gb2312?B?V3Z0NHA0bVRTZFNGOWRRYm5BOVhkd0d2RWFZOHVtZEpWbEYzeEdveGxvSm1O?=
 =?gb2312?B?L2k4VjhWTmd1Z3BTeThWTXlobU5JQzFUSXcwZmhlMjhDem81cWltcVJwVGxh?=
 =?gb2312?Q?4VuDl4?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5887.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?VXdjSmNVUFYyWHlrWmVVYlBMckNvSWc0WlRlV0pPb0QyNzZXOWRzY2xKUTlv?=
 =?gb2312?B?TUFvT3pUV2VJbzk5cmhEMDJzM243RWNOa0drV0MrOGZTdzU3VjkrNi8rWFZB?=
 =?gb2312?B?bUVxTUhnZG9qbERQT0JwTWFlUm9VYm9uSEpmdWVXbklSeFV3QTlFM2pZVkxI?=
 =?gb2312?B?YmtxVno0OWtqMmtZTGp2bmhJYXVNSWc4ODQ4MDJ0SE1mQVlsQzNIaFlYbWZG?=
 =?gb2312?B?c1F0NkdQRnd0SmlrUy90YTMvOTNaaEt0MW51Rk55RkJubzJERWEvS1U0SFRn?=
 =?gb2312?B?blhjSVhNUjN1M0libGJhY3Nzb0w5Y1VkOElQemVXbWU5MG51RjNFT2drNW1C?=
 =?gb2312?B?Vzl5MC9KUUcvRlhsVVFCT2JUQXMyWkgrTzYvQzRrbnVXL1hOYURKZ2wxaXhh?=
 =?gb2312?B?UkZSbnliV2dlbU5wTmZzSmk5eHRCQkx2OEI2Y1YxUlBPbU0wdG5XYlR5UzJM?=
 =?gb2312?B?b3NBZ3ZscVRmUUo3SDA4Yy9TblExWnBhM2c1M3Qwc216RmpjNkhrczNmeXFU?=
 =?gb2312?B?VDh5L1Z1K1JoQXIreHJEbmJRM2NFa1RXNXh2V0krVnQ4Nk1BZmlvSFJxak5z?=
 =?gb2312?B?cWpIYlNzUGh3eWRUbFlaWk5EVDNqWnBXdTJta2grb2hrbGJ0dm1sMmtab2Zx?=
 =?gb2312?B?WnliSEthSzdsOWw1MDJzaWNYaFZMQWpJRUdDVVVWaFA5R052ek14RFZjNGJW?=
 =?gb2312?B?dVlESUsyOXV2YzZVaDQ1VE9kL1k5Nm9sUE8yQ1ZWbEhUdVhGVWhaYmFnQ3dr?=
 =?gb2312?B?dkliR0VxSGZEejd3YTNmR21FNGRTSVVrcDYwOGZyWkhsZ1Y5QkNsNTJFaGJo?=
 =?gb2312?B?S1llbTZES1FKbmRUWXp4dkZxay84U2NjTDJ3MHdUaGt4QklMclBoVnhvUlhq?=
 =?gb2312?B?RlZDZzd4SEd2ckVYUk91TEY2NGltNUdmV2lRTkNhOTJ2NktpaXNacHZiMTRB?=
 =?gb2312?B?MnRtamQ3RjNnUW9vY01Cd2FacC9sNWJjQVhFSmJrUTBBaWVaNzZDdFZuR0hG?=
 =?gb2312?B?YmxSN0RIdVZlZzJVSHE0czlRZDh1SmxLdFQ4WGZhSFIwY01mMFkrVXJrVEhU?=
 =?gb2312?B?R2NxbVZLVkxlUTBwZFdVWXlLeFNoa0hYQmFRcHpOMkVQZDRyWFFQWThFcUJn?=
 =?gb2312?B?eTkxQXFyc1BlNm8xZ1hWZXdVeDYyWXNqbFFhZ096aHVsTngxWjh6WnR1NnRC?=
 =?gb2312?B?OXUvdjZIVTg5Ny9laUMvOUdEZXFRRzdlell1bnZGV2JCdkJlSzloRzFzTjdk?=
 =?gb2312?B?TnRBTHNrczlNT2IzOUZEUDR1eTE0S09hc2JIOXNnclAyVkZsQTRpWFdxc3pT?=
 =?gb2312?B?R2FwS1UreDc4bVhVVTluOWVCcURyTTJDWEw4M2FTb3JKTXl5dG1lSXhUWTNz?=
 =?gb2312?B?dDZodzBDamVpQzdnT3UzZDRzQTdYNTREVTVVQTh3Z2U5WWRmTjR6eTdZV2ow?=
 =?gb2312?B?ZTZaMCtNZWwwVW54Tk1QYUo1SWlvTE1zYkI0SFRxQ3A5Tkt5TEZKWmlrL21m?=
 =?gb2312?B?TWZMYkNxQy9jeWlPaFVsRk9NQk01SDVmVkFRZWxQZjBFVTIzeHBsNGx1OW5K?=
 =?gb2312?B?RE4reFlyWmtjT21FOGNoN0ZHdDhibk84c1Q2a2MwMjhObUtNMUVLeWVhdWVr?=
 =?gb2312?B?SEVuUmhjd0RnSE5heVliSUFMNFFQdHhlUnRzMXdqblFUZFBJdDJ0STlrQlJ6?=
 =?gb2312?B?MWVnN3FudFRQbnRsaVBsMTlybnVCd2JOdmFLZE51ZkhtcjB1NTJPekRxWnNy?=
 =?gb2312?B?OUtZWGJQY2p2NTNMYXU1YURsSEhINWgyUGJhWVNiMGRMVStVaEpzRkhvY2JY?=
 =?gb2312?B?cGNaRFVwb3g5TGxQcFNLNDVMMDdmNjdVUXIxTnBzRFNkSWZVOHoyMkFGRVU5?=
 =?gb2312?B?SXdHS2lIcHZkRXRERDZJcFR1dUZ4UVZJT2ZyelZTUUcwRHF5b1pheWh0eHRv?=
 =?gb2312?B?aWt1bStBMm15Q25LQ1NYeWlteTdBYjQ5dnM0Q3dkNTlMV2NjZ3lMa1FBNnNG?=
 =?gb2312?B?c1Boc240MkFpWVVGVzZmUzlzcmFydW1tSURGUmcwMVpzZXhidlJqTzYvcTdX?=
 =?gb2312?B?eVp0b0JQUDZkSmhRWG9kUXV6YTdwNUpHc2hHMFdjYjdnOWJDR0VBMHVtNmdX?=
 =?gb2312?B?WWtoM0drNHZxZ1RkZWpWMXhCaXFycmV1V1NjU1FmVHJJMjNhcTZLaUx4QnBq?=
 =?gb2312?B?Z3ZaUjlzOGZnLzNnTUhCbXgwY3BZUGlvcWVyWXBNMkdXdUhuNUhML3ZIdWgw?=
 =?gb2312?B?NjhKVUZ1b3V0aTc1aXNTcDc5M1hLMVppWGNEblJ3QjVXeDZjUkxZNlVHemV5?=
 =?gb2312?B?bVY3clFmdzYvZVVVMlgvZ016Mk55dzMweFpOZ1VKTUx0RVpvZWJxZz09?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5887.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3194cd60-5df3-486b-0e27-08de4c375c6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 08:49:39.0261
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6cnfHnqZYC+c5xr0WqBiNJYHK2FeSVFt3ytJ+uU9KA7rg0Ua/QHZISDdbkoO2jBJJey+cZEiCc2TNpndAD6Tmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5613
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_004948_709063_DDA10709 
X-CRM114-Status: GOOD (  25.56  )
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

SGkgS3J6eXN6dG9mOg0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudHMNCg0KPiBFWFRFUk5BTCBF
TUFJTA0KPiANCj4gT24gU3VuLCBKYW4gMDQsIDIwMjYgYXQgMDM6NTM6NTlQTSArMDgwMCwgR2Fy
eSBZYW5nIHdyb3RlOg0KPiA+IE9yYW5nZVBpIDYgUGx1cyBhZG9wdHMgQ0lYIENEODE4MC9DRDgx
NjAgU29DLCBidWlsdC1pbiAxMi1jb3JlIDY0LWJpdA0KPiA+IHByb2Nlc3NvciArIE5QVSBwcm9j
ZXNzb3IsaW50ZWdyYXRlZCBncmFwaGljcyBwcm9jZXNzb3IsIGVxdWlwcGVkIHdpdGgNCj4gPiAx
NkdCLzMyR0IvNjRHQiBMUEREUjUsIGFuZCBwcm92aWRlcyB0d28gTS4yIEtFWS1NIGludGVyZmFj
ZXMgMjI4MCBmb3INCj4gPiBOVk1lIFNTRCxhcyB3ZWxsIGFzIFNQSSBGTEFTSCBhbmQgVEYgc2xv
dHMgdG8gbWVldCB0aGUgbmVlZHMgb2YgZmFzdA0KPiA+IHJlYWQvd3JpdGUgYW5kIGhpZ2gtY2Fw
YWNpdHkgc3RvcmFnZQ0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogR2FyeSBZYW5nIDxnYXJ5Lnlh
bmdAY2l4dGVjaC5jb20+DQo+ID4gLS0tDQo+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9hcm0vY2l4LnlhbWwgfCAxMSArKysrKysrKystLQ0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vY2l4LnlhbWwNCj4gPiBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vY2l4LnlhbWwNCj4gPiBpbmRleCAx
MTRkYWI0YmM0ZDIuLjllMTMyZTYwOWI3YiAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2NpeC55YW1sDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9jaXgueWFtbA0KPiA+IEBAIC0xNiw5ICsxNiwxNiBA
QCBwcm9wZXJ0aWVzOg0KPiA+ICAgIGNvbXBhdGlibGU6DQo+ID4gICAgICBvbmVPZjoNCj4gPg0K
PiA+IC0gICAgICAtIGRlc2NyaXB0aW9uOiBSYWR4YSBPcmlvbiBPNg0KPiA+ICsgICAgICAtIGRl
c2NyaXB0aW9uOiBSYWR4YSBPcmlvbiBPNiBib2FyZA0KPiA+ICAgICAgICAgIGl0ZW1zOg0KPiA+
IC0gICAgICAgICAgLSBjb25zdDogcmFkeGEsb3Jpb24tbzYNCj4gPiArICAgICAgICAgIC0gZW51
bToNCj4gPiArICAgICAgICAgICAgICAtIHJhZHhhLG9yaW9uLW82DQo+ID4gKyAgICAgICAgICAt
IGNvbnN0OiBjaXgsc2t5MQ0KPiA+ICsNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogWHVubG9u
ZyBvcmFuZ2VwaSA2IHBsdXMgYm9hcmQNCj4gPiArICAgICAgICBpdGVtczoNCj4gPiArICAgICAg
ICAgIC0gZW51bToNCj4gPiArICAgICAgICAgICAgICAtIHh1bmxvbmcsb3JhbmdlcGktNi1wbHVz
DQo+IA0KPiBQcmV2aW91cyBwYXRjaCB3YXMgY29ycmVjdCwgbm90IHRoaXMgb25lLg0KPiANCj4g
PGZvcm0gbGV0dGVyPg0KPiBUaGlzIGlzIGEgZnJpZW5kbHkgcmVtaW5kZXIgZHVyaW5nIHRoZSBy
ZXZpZXcgcHJvY2Vzcy4NCj4gDQo+IEl0IGxvb2tzIGxpa2UgeW91IHJlY2VpdmVkIGEgdGFnIGFu
ZCBmb3Jnb3QgdG8gYWRkIGl0Lg0KPiANCj4gSWYgeW91IGRvIG5vdCBrbm93IHRoZSBwcm9jZXNz
LCBoZXJlIGlzIGEgc2hvcnQgZXhwbGFuYXRpb246DQo+IFBsZWFzZSBhZGQgQWNrZWQtYnkvUmV2
aWV3ZWQtYnkvVGVzdGVkLWJ5IHRhZ3Mgd2hlbiBwb3N0aW5nIG5ldyB2ZXJzaW9ucw0KPiBvZiBw
YXRjaHNldCwgdW5kZXIgb3IgYWJvdmUgeW91ciBTaWduZWQtb2ZmLWJ5IHRhZywgdW5sZXNzIHBh
dGNoIGNoYW5nZWQNCj4gc2lnbmlmaWNhbnRseSAoZS5nLiBuZXcgcHJvcGVydGllcyBhZGRlZCB0
byB0aGUgRFQgYmluZGluZ3MpLiBUYWcgaXMgInJlY2VpdmVkIiwNCj4gd2hlbiBwcm92aWRlZCBp
biBhIG1lc3NhZ2UgcmVwbGllZCB0byB5b3Ugb24gdGhlIG1haWxpbmcgbGlzdC4gVG9vbHMgbGlr
ZSBiNCBjYW4NCj4gaGVscCBoZXJlLiBIb3dldmVyLCB0aGVyZSdzIG5vIG5lZWQgdG8gcmVwb3N0
IHBhdGNoZXMgKm9ubHkqIHRvIGFkZCB0aGUgdGFncy4NCj4gVGhlIHVwc3RyZWFtIG1haW50YWlu
ZXIgd2lsbCBkbyB0aGF0IGZvciB0YWdzIHJlY2VpdmVkIG9uIHRoZSB2ZXJzaW9uIHRoZXkNCj4g
YXBwbHkuDQo+IA0KPiBQbGVhc2UgcmVhZDoNCj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20v
bGludXgvdjYuMTItcmMzL3NvdXJjZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3ViDQo+IG1pdHRp
bmctcGF0Y2hlcy5yc3QjTDU3Nw0KPiANCj4gSWYgYSB0YWcgd2FzIG5vdCBhZGRlZCBvbiBwdXJw
b3NlLCBwbGVhc2Ugc3RhdGUgd2h5IGFuZCB3aGF0IGNoYW5nZWQuDQo+IDwvZm9ybSBsZXR0ZXI+
DQo+IA0KPiBSZWFkIGxhc3Qgc2VudGVuY2UgYW5kIGxpbmtlZCBkb2N1bWVudGF0aW9uLiBXaGVy
ZSBkaWQgeW91IGV4cGxhaW4NCj4gaWdub3JpbmcvZHJvcHBpbmcgbXkgdGFnPw0KPiANCg0KWWVz
LCB0aGUgcHJldmlvdXMgdmVyc2lvbiB3YXMgYWNrZWQgYnkgeW91IGJlZm9yZS4NCg0KV2hlbiBh
cHBseSBpdCwgd2UgZm91bmQgdGhhdCBvcmFuZ2VwaSA2IHBsdXMgYW5kIFJhZHhhIE9yaW9uIE82
IGJlbG9uZ3MgdGhlIGRpZmZlcmVudCBib2FyZHMuDQoNClNvIHdlIG5lZWQgdG8gYWRkIGEgbmV3
IGl0ZW0gZm9yIGl0LiBMaWtlIHRoZXNlIGZyb20gcWNvbS55YW1sDQoNCiAgICAgIC0gZGVzY3Jp
cHRpb246IFF1YWxjb21tIFRlY2hub2xvZ2llcywgSW5jLiBEaXN0cmlidXRlZCBVbml0IDEwMDAg
cGxhdGZvcm0NCiAgICAgICAgaXRlbXM6DQogICAgICAgICAgLSBlbnVtOg0KICAgICAgICAgICAg
ICAtIHFjb20scWR1MTAwMC1pZHANCiAgICAgICAgICAgICAgLSBxY29tLHFkdTEwMDAteDEwMA0K
ICAgICAgICAgIC0gY29uc3Q6IHFjb20scWR1MTAwMA0KDQogICAgICAtIGRlc2NyaXB0aW9uOiBR
dWFsY29tbSBUZWNobm9sb2dpZXMsIEluYy4gUmFkaW8gVW5pdCAxMDAwIHBsYXRmb3JtDQogICAg
ICAgIGl0ZW1zOg0KICAgICAgICAgIC0gZW51bToNCiAgICAgICAgICAgICAgLSBxY29tLHFydTEw
MDAtaWRwDQogICAgICAgICAgLSBjb25zdDogcWNvbSxxcnUxMDAwDQoNCkJlc3QgUmVnYXJkcw0K
R2FyeQ0KDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNCg0K

