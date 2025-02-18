Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2FEC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 11:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CpgeR7VoahAQXPxjsCCmjREMrMABqYO8ID1I5VBtA6M=; b=2+XrDC7JBCMNXOichk0BU/wUmM
	2X+Ro2nfFtU3RixmVeeNxl1voMiSK/hodqd5gN92WA1d81slmO8S3zTs8GzJy7O+t/fEPgSh+oZ80
	SJbvGBfxpGZcttNoSOTysQe0ukLGE96WDOXeQ3uYxYigUSoZ49WJq1ZiPVh0eUEegNQu3bzdIB6Bq
	clm5zqu7K/x0HPqDGf7+Qe9rcwKrcIejK6MU9tvIOyeAg0hKBSEOGxUMbQdy5Zmg8P1VAsMu+B9pY
	s+jwbfjz/4FY1qk+D/nYS8A8agJmkUGh0STEJUYZBlRoBy4s7NVbnNR9uYdRpE8cYfCXzyI0Uww2v
	ICBi8ARw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkLXb-00000007tkf-1Lrn;
	Tue, 18 Feb 2025 11:13:27 +0000
Received: from mail-eastasiaazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c400::] helo=HK2PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkLW7-00000007tNX-279W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 11:11:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qNNayVS3Uc2/PIFejfGfu479KE46zFddjn1vQhjEZgc9q6rY4iB6ejxaQakxSb9j63rjNvrjn2HoY0Qp0OBF54OSdkLTBJzj7EX5DHl+uNh8oFUBVgpIT2Mjq/tBLIT3uStYuSv6nDphwQ0xIp7g+hiSzbpw5Vdb5JNDbsY1ffHn1JTDQzQu4yJeIPo0uJMgNWexkc8RWXq+P2I84B1oNQ+4GE+vNUgKGhFAE1A2auLDIjrSP0RiSu+vGN2cadMV0+aYiy9/oDvXO0R2qTOTt5BFdmFveXQE27/TtG9gpteyBAr4yTJ9ILQINSGYeJqKZL/FZoec1S5FsOmgrUXsrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CpgeR7VoahAQXPxjsCCmjREMrMABqYO8ID1I5VBtA6M=;
 b=Tlz5RBQ6QLmKVgLVcIgauAVWK/y/Dp0pW7QZi3GIBqgQIvGTWQwHkYGrW4/FyYSiZQL+Xtr7XYMwlE1j5wAVZoUNnZNZFVdW9tFKILRXZ7BKHsn4N97Oe3VjiFttUYpTpkzy0pVdd/iY6GWovh4YJ5O5PSQhStwztIujHq3HYZBrldiDqZLorlld6QN+HjQZNXxChlaSiHLOl5bpPO3JOrX4Ar+pJiFStCu/LTH/gZeL/xhJnh0cvn7Cp5mWKSFe5eyxHt0dXvNMUPoNAioW+22dRWhGEeDyC/O34RyicP6bfeBfPtNDyKaac2+BPNsSbItlt6niHVrTvmBv2K/K6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CpgeR7VoahAQXPxjsCCmjREMrMABqYO8ID1I5VBtA6M=;
 b=MS1CSA9ieZRjqtWkrNtfgDeL2I1iguKIgbinX5UwfQ16kvnl3UHnR8cu66dvW62Ncsm6peSlYgR9vOgJm6UoGd1vfJfJsaRwFhZPFydAnUPwHVdxeZG33vobkI1M+HNfhQ82/C0HJd9LbllSQi2GWRFz1mqgMX8uQJ6nZfxAG5M9M9OiuBOtwX6vn3UV86hZQUoLwsvuvzQE1D+ncF41S7cyYQKxBjIjjD8AAgI7i3E9FOOTGioBTcnLRHA7suxChDre9EknM1JfibjBnNcCvMR5xAQnYO1pI+X9dyj81F/3jrPp+NOr0I7Qk5WRB4P9F51yrPYopCpekDtJXCHGiA==
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com (2603:1096:301:ad::9)
 by KL1PR06MB6371.apcprd06.prod.outlook.com (2603:1096:820:cc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.9; Tue, 18 Feb
 2025 11:11:42 +0000
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf]) by PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf%4]) with mapi id 15.20.8466.009; Tue, 18 Feb 2025
 11:11:42 +0000
From: Kevin Chen <kevin_chen@aspeedtech.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Krzysztof Kozlowski
	<krzk@kernel.org>, "lee@kernel.org" <lee@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "joel@jms.id.au"
	<joel@jms.id.au>, Z-ChiaWei Wang <chiawei_wang@aspeedtech.com>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Mo Elbadry <elbadrym@google.com>
CC: tomer.maimon <tomer.maimon@nuvoton.com>
Subject: RE: [PATCH v1 3/3] soc: aspeed: lpc-pcc: Add PCC controller support
Thread-Topic: [PATCH v1 3/3] soc: aspeed: lpc-pcc: Add PCC controller support
Thread-Index: AQHbgTHkHx9CTwRXuEqAh/w3KRppVLNLZMoAgADY0YCAAKoPgA==
Date: Tue, 18 Feb 2025 11:11:42 +0000
Message-ID: <PSAPR06MB4949C65DF5C034BD6B40C9B589FA2@PSAPR06MB4949.apcprd06.prod.outlook.com>
References: <20250217114831.3225970-1-kevin_chen@aspeedtech.com>
	 <20250217114831.3225970-4-kevin_chen@aspeedtech.com>
	 <e43b5f8f-37e4-4468-b3ca-5059a5e6f3c3@kernel.org>
 <6fd7cd57261ddf9831f57dc4c637b24e9f8982d9.camel@codeconstruct.com.au>
In-Reply-To: <6fd7cd57261ddf9831f57dc4c637b24e9f8982d9.camel@codeconstruct.com.au>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR06MB4949:EE_|KL1PR06MB6371:EE_
x-ms-office365-filtering-correlation-id: 38adca92-f701-4cf8-251f-08dd500d0626
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?bDJ2MXRqdWlKemZtaytPWk9lQjA2VTFiSk45eDUweGFtTEFsRDNMbW92bWk5?=
 =?utf-8?B?OTNMZXd6OU1yQjUvWEd6ZlRPVURMOUxWdVlvWHlDclFOdGlIVnFrRFZUMnl1?=
 =?utf-8?B?T3ZkY0xUbkRWU0U3MzhrU0JLZi92U3FkelRZT0JaWWw2V1J3OEhjQWo2YW1V?=
 =?utf-8?B?NXd4b1hmMFdkbkY1Z2VqakhUQVZUTWovcGhQa3FmdGdpeHVzcVFyUURVVENu?=
 =?utf-8?B?Q3IvSlFyUFRXdjRwc0hGc1d0T0czSG81TStIYktaMG9qYXBrZUhEUUgzU1Mw?=
 =?utf-8?B?MUpZV0ZydFlYam82U2R5bzBPOWUzMXdRL2RhZ3d5QVg0d05Nb3N6VFQvdTA1?=
 =?utf-8?B?UmZWTlhiVys5Ym1hTWFaYmIxdGxHWGVXNDVMQ2F6YkFGR3BWdWdWUzRDK0Fa?=
 =?utf-8?B?WWIzcUdsNm5rQ215Y0RieXdZcWxMdUZZdVB1SnprdjJvT2xnUk1qR3B4VmhI?=
 =?utf-8?B?YWFnYjBlYTdMQzdnT3Z1cklkcjlqVU5JOUVLNkxnTUJ4N1Ftb3RXNENOZGpJ?=
 =?utf-8?B?RTNiWjNKS3g5M3BkdUlyZCt3NjdBekFTTU9rTGpQRlVJaEpFVmxkR0piVnZU?=
 =?utf-8?B?cUM5MVVpa0UxT0dQbUJQZTNIQSthUkwyQlhKTmVTdmo2M05WdmpYQ1R1REdi?=
 =?utf-8?B?c2RqRUJIZC92OWJQSWxWUE55MDU5OGNOWDV6ZUZWaVdOS2hzSFVUV1RmejNk?=
 =?utf-8?B?ZmgxNHUrZHErSEM4R0pRTk5RVFJWL3JobCs3SjhZbkdmcW5Jcm5SdjhBMS9z?=
 =?utf-8?B?a05QMXRtTHNKR0J6dVVlNTlhOWpSMWNUWTBTSlN0NTNqNHdZc2c3VnFQNVZ6?=
 =?utf-8?B?M3pFR2RidlF1UVlWaXdMbnZLMmNuUWNKV1IvcVBOZjd0RlZrZWYyWmlRUzhC?=
 =?utf-8?B?dk5qNTVjS3ZPZ1FqRXZnL0ZNSWIxTVoySlYwZmRVQW56QTlJTjlCSWl0cW5s?=
 =?utf-8?B?UlNGWlFsN1NvZWZ3S1JtekVDYU0rbHdSQ21rb3pERXdGZkFoN09GWWZ1ZFJl?=
 =?utf-8?B?aHVmVGhMd2p4MHY5cnFzZXdmcHlXN3NXdU93L1dGb2loMWtscndPTy9jTEl5?=
 =?utf-8?B?VUVIaVFCT0JHN2pZSnpFWTZ0UmpsanZDbW5Wb0pTK0d4Zm1VMmM1VVZtTlNk?=
 =?utf-8?B?UUxOc3hCOXd6OWhkWUxIWE13YXlHQVIrK3l2SGpTcUZjeHYyWE9qQU03NHNv?=
 =?utf-8?B?RHVVb0xvNnZBTkNsZUVKUDFaMVIrcVhycFdrcStYaDRxQnFsT09UMFZNWXht?=
 =?utf-8?B?M1V0N0FZcit4VnJqV0JhTmhhMTRhN0dEYWpVN2MySUlYN3djeGJ3YjFkQmRy?=
 =?utf-8?B?MWZVWHpxT0RkdWJYQUVUMFlrVS9IYStubGFxL2FLQTJYOHlDWEJaMURaZUNC?=
 =?utf-8?B?TVhVZ0Q3M3pTZXltQWlEYmZEdS9uVVNRWkpSdGxVeVdDUHdVeHA4MXJaVVhz?=
 =?utf-8?B?dE12bHlpcE1VUHB6QndXV3R6NkZGd2JRdStMQWtzVkRJTytjWHFhNnREOWdP?=
 =?utf-8?B?UjVFTXVTMnVzSHJNOXRkbXJlN3luTU5RdkdnV2dMdHFqWC9tbURGQW10SW5I?=
 =?utf-8?B?bmZSdlFWQ2srdlRVYmFKemluZUk0OHV0eGZNZ2xWY2d4ckZ2Wk43NVhiVG5p?=
 =?utf-8?B?dFpycEEwd2lHVlp0aFBvb1d0NVJ1ZzFKbWJ4dGFVZ3U2K2xrcS9nQVBDYVdu?=
 =?utf-8?B?cC9zOG05M0RYYWFOMVRpMXZkV2doWHhlS2ZSWm4va2wzUDUzS1VkdWxDenBm?=
 =?utf-8?B?VGxiK3pJUnkzMlg1YVlUZXZCVDlNUnRvRkoyY0xWUkNVZzBQdFRKVjBBWW1Y?=
 =?utf-8?B?czU5MTJUM093TWdtT05rUFZDLzhOUTNyWmlEMGZxUnBXV2lGTmJwS0F6Qndj?=
 =?utf-8?B?Ulc3NmpTdVpVM1RHUXhDNzZsUk1oWDNHSkZlVXlyZEg0RG5iVzlUZ2puMU5V?=
 =?utf-8?B?eHl6K1pFOWFEK1JTVGZJOG5IKzJUL0ppZzdLQ3BYdW5jZ2c0bENZM1g5dVc1?=
 =?utf-8?B?L1dxQ0F3VHZRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4949.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y3AzMHlEYm5iVWpvYjQvTWt2Z2h2OVluUis5UHJpNHBvS1Roam5JK1hVNzRS?=
 =?utf-8?B?WDg1VUN5Y3ZBakp2Y25NMGM0bDJrS3lXQ0UvNTNqRk5GMzN5V3VaZmo2ZmVZ?=
 =?utf-8?B?Y2RCVGorclpRYXZXOUdBTU5BNnZER0ZNRFpBVkRxb21hYTdGeUlzd0RETjRn?=
 =?utf-8?B?UUVaVitrcVlUcXRQb1krb2ZEMko4U1YzdllFbDcyMzVLTGY4REZZQWpqTGRT?=
 =?utf-8?B?bzFMOFdEN3hRUklqSHN1NFhaRUtwbHNLMmdrU0g5bUhhMGlSZzhYa25iRTVW?=
 =?utf-8?B?NFhyNGZMenNINWsyVmNIU1JZbGRYaWNFRHN2ZTlZSTVpYmNoL0NROG82N0pl?=
 =?utf-8?B?aDhkSS8wRjJsc3lHREhHY0VuOTI0dG5LNjcreXZCcXRRSW4wVTVTSU02OXhK?=
 =?utf-8?B?QVFIUHltclV6V3RhczhYeCtmTDVIV25Ja24wMm5lamp1MHdaL1YxOFdURHFU?=
 =?utf-8?B?QkpGWk9uVjZpOEZaeXMwVE9aaUNzQVRZRmkxQXB0VUFSWk1jckM5U3dxb2ht?=
 =?utf-8?B?b2x6bzZ6c05RR1FWRjdIYW85YVJWdVhHbDBVYlM3aE1wcUl0R2ZWaHUzZEZB?=
 =?utf-8?B?WTgvSmdBRklNR3lnODcrUXV0a3hQK25IMW4zbGVVM0p1c2ttQitURlZweHlU?=
 =?utf-8?B?bk5waDFVTE5rL0VnNno2ZGltWmM2emZQSEJEVnlMQnJjLzFqU2JhNWwwTktQ?=
 =?utf-8?B?Rk5Kei9xMWZDazBtV1V6bE1xM2Z1SE4xTXY0R0VBdm5pRG9maDNxcGIxdXdv?=
 =?utf-8?B?NU1DL3dVYVdlS1VUODR3SHU2QllQekhWUGxJdDBYdXNWL2NoSHhoU3ptN0RE?=
 =?utf-8?B?ZjVhOU51cWdUNm1ZVmwxS25VcU1mdFRsNi93eU03cnVkb0NKckV1T3M3RFpz?=
 =?utf-8?B?cXRvd0tOVThnVlc5bmlxVnF0cXBYSk9aWk5uSnM2cmJJa0U5NjNlYWFzWnFT?=
 =?utf-8?B?YnRUaWFCa2hTU2U5Rm1yYmFhd3doZC83azRQWXZVWlJXUDByYnZrMVpITEMy?=
 =?utf-8?B?M2VrZU9ya2VPWSswODdaeEFsQnlSUHFjbEkvYWxyN0o1Q0dVUzM5VHdNYVF1?=
 =?utf-8?B?dWFJYlBOdnZyYmNRRWpHVmI4bEMzUndnNXlCODR5bjlsdFViejVFU1FuZUVJ?=
 =?utf-8?B?YndkWGlmVFBYcGN5d3ZKWGN6QXpubzBtczQ3OVkvVncrNVBEa0dWeTJEWURD?=
 =?utf-8?B?QS9ldnJHVzRma3FWUnNST1lWeUM0aFFFeFFhcUY1WDNOMDMwZDJtVTNubE91?=
 =?utf-8?B?WkErYWd4NU5TNjA2dmZwUWpHRUlya1R4RkRjOFB5Q2RJMjYrTmVVcmt3TVZT?=
 =?utf-8?B?dmg3c1VLZWRKcTN1eHNadkxqaEpXaVBzb2toT3BFNVhjbUJUV2V0bE4vUksw?=
 =?utf-8?B?TVZNMndTU2NDNHBiZFJYWnV3ZGFMbGtGUUk4UGtUWHhFcGpqdjBsZ2RIMm9n?=
 =?utf-8?B?clB4YU8xak5QVGJRZ09lSDM2emZ4Uk5LTlhMdlhJWDV5VDJvVTVycVdFUFVq?=
 =?utf-8?B?UzFpQlREVlZ0aVZxUEdEeDh3VWFvcEYxVXg0RGJmd09BK1hsa0ZUZ2IvYWlM?=
 =?utf-8?B?UVhDc3VtYi9ZMThzMXoxZm85dUdnREFRVkdOaHJIUURRUTVhM0RtdHU1TEM1?=
 =?utf-8?B?bnY0UDdNZGl6U0E2Q3VJNVB2L2kvbFZDZXZuUUdnRFlXS0x5NFpMUnVRTWZ4?=
 =?utf-8?B?elRTcXVZdldqbWNsVlBVbFllaTZmbnc3cmMweTRlVTFWWGNMV0pkcFpaQWhv?=
 =?utf-8?B?RDN4UWRySCtFY3VRT1dLTUVXUjUybFlZQ3JWS3VNL0tBN29ROFU4bkJkUXlL?=
 =?utf-8?B?RlZ4NUR0MDh5Z3ZDN0k2bUpBdWZuNTdVWkZ2NXcyekMyUkNuejRHYitoNWpk?=
 =?utf-8?B?c0xoMnBLd3V2R0VxUzVWdUZlUk1VUHJ5VWlobW9SWVo1NGx6NXhvNWVsSXdR?=
 =?utf-8?B?ZHlhOEJ0NlNKY3pTais1RmlUYU9ZQTZieThMak1ISE1hRjl5T0Jiai84N0JX?=
 =?utf-8?B?UHlwdXdPRTlSSjNIb0Z1b2pyS3VTQkZ5VllLTHZhSUpnb1pwNTcwMTFYc3Rv?=
 =?utf-8?B?Mk1CZTIvaG01Y1BETFJXSnZLcWFOZzBjZGgzTy8rTkZSY05yN0UxYThtdERy?=
 =?utf-8?Q?7RPop6NP7Zs2RE2QGX/BWgAl8?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4949.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38adca92-f701-4cf8-251f-08dd500d0626
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2025 11:11:42.4052
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SsaPQ9iyA6Pd5xdM6tOv2WVNo4J4PfOj5djuMKiGD2Nh1IO2XTHKF9OHqHabjEGsIths7Z0J47AetaneznerFIqPJ3DR33iKkNld7ZckfsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6371
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_031155_542358_FEB624AA 
X-CRM114-Status: GOOD (  16.47  )
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

PiBPbiBNb24sIDIwMjUtMDItMTcgYXQgMTM6MDAgKzAxMDAsIEtyenlzenRvZiBLb3psb3dza2kg
d3JvdGU6DQo+ID4gT24gMTcvMDIvMjAyNSAxMjo0OCwgS2V2aW4gQ2hlbiB3cm90ZToNCj4gPiA+
ICsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoHBjYy0+bWRldi5wYXJlbnQgPSBkZXY7DQo+ID4gPiAr
wqDCoMKgwqDCoMKgwqBwY2MtPm1kZXYubWlub3IgPSBNSVNDX0RZTkFNSUNfTUlOT1I7DQo+ID4g
PiArwqDCoMKgwqDCoMKgwqBwY2MtPm1kZXYubmFtZSA9IGRldm1fa2FzcHJpbnRmKGRldiwgR0ZQ
X0tFUk5FTCwgIiVzJWQiLA0KPiA+ID4gREVWSUNFX05BTUUsDQo+ID4gPg0KPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgcGNjLT5tZGV2X2lkKTsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoHBjYy0+bWRl
di5mb3BzID0gJnBjY19mb3BzOw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgcmMgPSBtaXNjX3JlZ2lz
dGVyKCZwY2MtPm1kZXYpOw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKHJjKSB7DQo+ID4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZGV2X2VycihkZXYsICJDb3VsZG4ndCByZWdp
c3RlciBtaXNjIGRldmljZVxuIik7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgZ290byBlcnJfZnJlZV9rZmlmbzsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoH0NCj4gPg0KPiA+
IFlvdSBjYW5ub3QgZXhwb3NlIHVzZXItc3BhY2UgaW50ZXJmYWNlcyBmcm9tIFNvQyBkcml2ZXJz
LiBVc2UNCj4gPiBhcHByb3ByaWF0ZSBzdWJzeXN0ZW0gZm9yIHRoaXMgd2l0aCBwcm9wZXIgQUJJ
IGRvY3VtZW50YXRpb24uDQo+ID4NCj4gPiBTZWU6DQo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsL2JjNTExOGYyLTg5ODItNDZmZi1iYzc1LWQwYzcxNDc1ZTkwOUBhcHAuZg0KPiA+IGFz
dG1haWwuY29tLw0KPiA+IGFuZCBtb3JlIGRpc2N1c3Npb25zIG9uIExLTUwNCj4gDQo+IEZ1cnRo
ZXIsIGRyaXZlcnMvbWlzYy9hc3BlZWQtbHBjLXNub29wLmMgYWxyZWFkeSBleGlzdHM6DQo+IA0K
PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxk
cy9saW51eC5naXQvY29tbWl0Lz9pZD0NCj4gOWY0ZjlhZTgxZDBhZmZjMTgyZjU0ZGQwMDI4NWRk
YjkwZTBiM2FlMQ0KPiANCj4gS2V2aW46IERpZCB5b3UgY29uc2lkZXIgcmV3b3JraW5nIGl0Pw0K
QW5kcmV3OiBObywgSSBkbyBub3QgcmV3b3JrIGl0IGJ1dCBhZGQgdGhlIHBvc3QgY29kZSBjYXB0
dXJlIGRyaXZlciB1c2luZyB0aGUgU05PT1AgcmVnaXN0ZXJzLiBBcyBhIHJlc3VsdCwgSSBhZGQg
c29tZSBjb2RlIGluIGFzcGVlZF9hMjYwMF8xNSB0byBjaGVjayB0aGUgU05PT1AgZW5hYmxlIGJp
dC4gUENDIGRyaXZlciBwcm9iZSBhYm9ydCBpZiBzbm9vcCBpcyBlbmFibGVkLiBQQ0MgaXMgdXNl
ZCBmb3IgcG9ydCBJL08gYnl0ZSBzbm9vcGluZyBvdmVyIGVTUEkuDQoNCg0KPiANCj4gTnV2b3Rv
biBoYXZlIGEgc2ltaWxhciBjYXBhYmlsaXR5IGluIHRoZWlyIE5QQ00gQk1DIFNvQyhzKSB3aXRo
IHRoZSAiQlBDIg0KPiAoIkJJT1MgUE9TVCBDb2RlIiBjb250cm9sbGVyKS4gVGhlcmUgc2hvdWxk
IGJlIHNvbWUgY29uc2Vuc3VzIG9uIHRoZSBiaW5kaW5nDQo+IGFuZCB1c2Vyc3BhY2UgaW50ZXJm
YWNlLg0KPiANCj4gQW5kcmV3DQo=

