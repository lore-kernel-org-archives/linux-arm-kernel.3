Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328FECDB471
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 07:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Npcy15CwlFGqUCqFvVVzRgWDhCtiKeLW9P9x7xp4f78=; b=jaCyFpPA8PQRXozoRaMNfHMAAo
	9+5bdSGmakHTSa8YKKhLbU+24MEof5FdKok3bI7iNN5CQjL09Nr8NsGdhNrsJC/BC1QbL5xl83c3i
	YvCbKAS9Vy/wIJZaeNlkBn5CozhC2bWKhtEetccKe6AcjEw08KTJrsWl2HZWOnARp6urrtRaEy77U
	9VRDbOf+d0AsWbuALEf8wOlxjRbZPw6hgOV0n+AUXQTZpKGZ6/z7ZbyBRdp71tdEFee7mNB2asqmL
	AgBLSH0uXoReQhBSedXcg/VMOlGqOt4hvTmNieiY/b0NXO5J54PSSaT1N4mt/gkDhbMYnyxNwLPsm
	Lf+lYokA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZ7t-00000004XgP-2csg;
	Mon, 22 Jun 2026 07:31:25 +0000
Received: from mail-japanwestazon11022092.outbound.protection.outlook.com ([40.107.75.92] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZ7q-00000004Xfo-2FTi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 07:31:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jja8DADvNDP57z42fOpe51dNOz3t14Lihy9vaEKNzwafMIbPGz7aDOqeMEZsvAPqv1JzpVUQ7+eQ7cmZbviZ49J/KmyWkrRK34Mg32HavwueELwCb1sQySSktWuUpgK3WmeTFrl9Z9UCKhfCfgp5cK+iqJv2xWbjbkpeT809/wLrc2YQE1znuawuD0+KsiSbCod0CG0LvjIUwygADY5diRsWzPjYSST0pTmBMvRYYpUq5V80Utr1Ac1ZQY3C7KL0jlJ3wBmN7CiGZkgkSMEif1rH3rsUlV+38V/KhaJHS9k/rgl1fV4VzyD6XWY0TZK+W76Ci8aCyV/NMXfZ8+6/fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Npcy15CwlFGqUCqFvVVzRgWDhCtiKeLW9P9x7xp4f78=;
 b=lrZ9FMoiVN7uusv4zyEa+93r/9YEAmvJcMlbWdaYu6pjZzuLJGwRhq57dPOV0lDZEhOMI7j8cdxRGFNu5/MtTS/F2t+L7+rWRkNP1kEKOb/oNtALbgKRURE985DExHfBswvLui4i25aOCZd3QfeHdg2CqARGwS5mqDeAoRHQP8SLIxlr27GpytVnwmR0lumxENvYiATfhP/z4n9jq3ZYEZ3NTPTIUVoHyHf0+R0hH/flZBdjJ7UbRZivKnNZwR9VOtdFKGIraRJ12WDhfKjhgCRNYrf1q3yLyglnjiWiM/ewla2uiNkeyrCFX0dalEwWK6u4nKPYBqwvAlvyrK1Msg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Npcy15CwlFGqUCqFvVVzRgWDhCtiKeLW9P9x7xp4f78=;
 b=Q0TPEMFckrfXfA8pDXM2Ia4yFv5QMrxSqIvKNKQxqbl4poyCcO3b+0uKF7vyCN7/1EwNQMjindcG1vw+12t+3ZWv5LylsZV7F1TSd4cm9v3QPuI7tCET86VEv8G8aAo4T2tyZp0F/NiQ4NdoMTnEsiDNqI52X7ODZu9b0FvxKMjW/Sg8YKaD4hJZ0kbq1cB1XYeSy4fOsu0UWum5lb1l8Oup2LNNLatT4uIuVsQg0xGza32EEzEPxeoKxsRX2hHH8BoSRJeH1n8hf110kVqtKstMZkEADBBVblPpeHJJf4FelIKjbFtBnWCXgpfffXA69mPFzNBxvCe5ZYDpKCEMPw==
Received: from KL1PR0601MB4276.apcprd06.prod.outlook.com
 (2603:1096:820:78::12) by TYZPR06MB5907.apcprd06.prod.outlook.com
 (2603:1096:400:339::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 07:31:01 +0000
Received: from KL1PR0601MB4276.apcprd06.prod.outlook.com
 ([fe80::b7f3:3c41:fd0e:e3f6]) by KL1PR0601MB4276.apcprd06.prod.outlook.com
 ([fe80::b7f3:3c41:fd0e:e3f6%7]) with mapi id 15.21.0139.011; Mon, 22 Jun 2026
 07:31:01 +0000
From: YH Chung <yh_chung@aspeedtech.com>
To: YH Chung <yh_chung@aspeedtech.com>, "Shulzhenko, Oleksandr"
	<oleksandr.shulzhenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Andrew
 Jeffery <andrew@codeconstruct.com.au>, Conor Dooley <conor@kernel.org>
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
Thread-Index: AQHcstFOqEOl3ItXl0mr3midS8GMZLWsphAAgABXFACAA7sEAIAAT9LAgAF5RgCADH1X4IAAILCAgAK7OMCAEYY3UIAvrvqAgADtghCABnSAgIACyQAAgB+RCFA=
Date: Mon, 22 Jun 2026 07:31:00 +0000
Message-ID: <KL1PR0601MB4276452D09689C90B04209C190EF2@KL1PR0601MB4276.apcprd06.prod.outlook.com>
References: <20260313-upstream_espi-v1-0-9504428e1f43@aspeedtech.com>
 <20260313-energy-casket-ca8adc1f1fd1@spud>
 <23909400-4e7f-49c9-a982-14036372af98@app.fastmail.com>
 <c3b28ee92fa46700887d0c68b23045b2418358a7.camel@codeconstruct.com.au>
 <KL1PR0601MB4276ED93723F0B1F42349AD89041A@KL1PR0601MB4276.apcprd06.prod.outlook.com>
 <0f7f0f96-a918-47d5-a0bd-bbde494c8fed@app.fastmail.com>
 <KL1PR0601MB4276B5BE3B96C18E3A66AD709049A@KL1PR0601MB4276.apcprd06.prod.outlook.com>
 <14870d17-2471-4522-b8b5-03cb9002a4f7@app.fastmail.com>
 <KL1PR0601MB42763DAD359305DEBA4B769D9057A@KL1PR0601MB4276.apcprd06.prod.outlook.com>
 <KL1PR0601MB427603A6A5768D6A537CAFCB905AA@KL1PR0601MB4276.apcprd06.prod.outlook.com>
 <b1d56feb-9847-41b1-8bba-733963055cae@linux.intel.com>
 <KL1PR0601MB4276AB799EC03BB00C4C0E5490392@KL1PR0601MB4276.apcprd06.prod.outlook.com>
 <be4f662a-b986-4b4c-8263-2fd7b63c238a@linux.intel.com>
 <KL1PR0601MB427604A7136947D020CF272D90002@KL1PR0601MB4276.apcprd06.prod.outlook.com>
In-Reply-To: <KL1PR0601MB427604A7136947D020CF272D90002@KL1PR0601MB4276.apcprd06.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0601MB4276:EE_|TYZPR06MB5907:EE_
x-ms-office365-filtering-correlation-id: 6a74edef-10cd-4630-58ec-08ded03035b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|42112799006|1800799024|366016|376014|7416014|23010399003|4143699003|56012099006|6133799003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: UQRfA+8ggx+i9yo6mXhxSeYhh+7sko0ajLSBUmasNoNoJnjMEjvPTM4A82C21EjA3BS2jgTboP7C65TNQ2y9HDA2ICkplF+hMdGmibWrNUboBgd15bFzJcDWHwS59Zl28KQhJc8BqGNNlSIbIjYwPKEJvqNy7OXtPfdC4Yuf43AkqXUS3RnfSveLAfZGPHyOQkk/BYH9dlJErp6pyW1zw2/XYW1qZzyZavDOAE8B3sBIiwVTZmDAtSQr3av9HjrgLfX3nRWymwlK+cvzNy/G+jI31+4g9YM6UA1lWSHn9v6jBMTJKvpX3pbkAyyhcTcVux66EsSs+lntQzQzW2G7ARW9rFyu4Fx+L1gKazPgUOlAd+j7cGqTd08uQX+YX5ql/1u7XJHRe8mM7YPw7lylLPOSympdN/5Se4cF5rIlfG+wC3XBeMEUekJFei0I+YoM9F8UMU2JXdrPMD9pReJJIfRFN8/VN75aCTGuvqFsI8e6FVqDF3ENqhBdKrqiTK+40ToMB3rYoNvNCXZScyLxAYV0Ipc1onxSNatarnly26CoF6HI9kbYN992XEVL4Ih6PV2GVv2YdL68JD9yT/FyQeV0ujD5+u+0CScFc/Kl/xaU0cFy/Z6U0QWG8vE60/JYV8Ogj8wnX0C91ocd3zyCat2oAobm8cSMt+n+zRC9L1xsBQqkMGghMU6KmHh6JRQ+xpMw7pz412qperZC5koG/Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB4276.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(1800799024)(366016)(376014)(7416014)(23010399003)(4143699003)(56012099006)(6133799003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dzdudkM2a1kvVkpCMHdqMzY0VnI4YnphQ3gwdHE4bldMcUFxYXArSG5jOHht?=
 =?utf-8?B?Z1lsbVdqazAwZzZaeTAxeENBblNPYlh1NEJPUDNiMnBoMUZBODNYRXVyTFYv?=
 =?utf-8?B?OXAvMUFxcnovTnFnTEFadGc0Qmp2TnNqMTBOK3FoVUJVaFhCQUJhM2NrdzBF?=
 =?utf-8?B?UzV0TExEZ29rOHNkT0hyOEszQUw4Vi9ILzNLb3o2OHVFU2VMM3hhb1g4ZVZS?=
 =?utf-8?B?TGRoT3V0ZXVXeUpuUThydlMwa3ZnQkVSMjdGSGt4bjd4YmloaXQzUUpVOGtJ?=
 =?utf-8?B?YnUyYlM5ejRCdkg0WUNaa2o4RG9qSjZwVEltdnFZVDZ2TFR4RTlZTktUVGt1?=
 =?utf-8?B?dWt6eFlJa2xrQkZBZXZ0MTV4N2ZBNDFybmw1UTg5NWljbDgxanhZcGQrZW5p?=
 =?utf-8?B?d2pCb2xDWTQ1ek1KRUxIV3A3cjUvM3BqOEpLL0VQQlkxSjZrMmV5aHNWb1kr?=
 =?utf-8?B?SjlNcmlsNTdOR0hNVHNHZU8zbExOQlgweDdjM0EzNndlRUlKSWMrbFFKL0tH?=
 =?utf-8?B?OEYwdE5OdDVwSnMzL1NEa1hrY2FESnZudmVVQ01tWEVVQS8wLzR2M2kvdzMz?=
 =?utf-8?B?SlBGdGdyT3grMCtEcmoxZTFCN3BiNG1WeTlvR09VM0w1WERIdy9XVWdCcXRk?=
 =?utf-8?B?RVRGaTcrQys5N0Y2WjBMRCs5SkZROTIvK1M4aUR5bzFudlFQQ3dzL3ZFbFlP?=
 =?utf-8?B?SzdabDJJeTdYZ3NFR1IycnFLZWR3OXAyMmZqeUltQnJFdlZzbFJiSGtuQ2ZT?=
 =?utf-8?B?aUVLUzU4bTlqUHNDTS9ocy9TejhUTmxQN1ZMRGVUT0tUeEpuNVhndm5VRktZ?=
 =?utf-8?B?Wk5lT2lFUXlFU3NWMnFWZXlCWUFqamx0N3UvOHR1dVNaZGU1OUszcC9KT1Mr?=
 =?utf-8?B?Nm9GTGFSOUN6b1JJTzY5Sk5raFBYWndFM1N0NHFIdHZKTjV2MnpSd3JyZGpQ?=
 =?utf-8?B?dGwzdVc5aVdMMTBvWXo5d2lDQ2ZsL2RLeW4wYXUzSTlYMXFETGhkTUxSSXFJ?=
 =?utf-8?B?Wnk4ZnhMZXBTbVlpRUF1VHFVcmRtTVpENllXS21RQTdaRTcxWjkyNXBzTDlj?=
 =?utf-8?B?RkQ1Y1J3QzZMSFk4S1YwdkZ3aUlUMHVwTFJGOGN6aldyTm0vOGNWSWRXVkxJ?=
 =?utf-8?B?a0lwMnVWaWE4UFlJNncyUS9EVGhNVk1qdW1pdHBEUmxsTUtZbU1nVWVxY0xv?=
 =?utf-8?B?NklETnpYMFY4djFsb0Z3NVAxczgwc0pMeTFKc3pwb0U5NVBZVjFiOFZxSHV2?=
 =?utf-8?B?VkFKM1NtMW1wdG5NSVpCZFo5dWtYWDIyMVVKd2IrcUh1V0FYNWlzaGN2RTdn?=
 =?utf-8?B?dlR0eHdkOHM5Qkd6Qm9sVTQ0UEF4K3c4Z2pQd2tWUlJnWkc2S3VicDZCOHNi?=
 =?utf-8?B?czlqajBoUkFpcWNVK3Z1dlk3VXFscktsYzJwcjR0ZTZKUkFzT0xkdDJwWkRo?=
 =?utf-8?B?OTlDZVpxVk94TWpzS0NoVmhSZisxV21rbWc5elpYd3ZNalFJQUVlVXMwRUNl?=
 =?utf-8?B?bmd3Sm1jQ1hyck1rdWtsdkkyUFdIZnpIL1pzNldyMWJCbCtCVHF4QkRHbUpz?=
 =?utf-8?B?T3U5WEQxMUZRSG1CODZxcndsY0gwYXVZM2x5MTdQN3Y2TjNkQWM5cHZYaE91?=
 =?utf-8?B?d2xOb0JYSE9XZDEwMFVNSTd3bFZCclpSUGNNWloyazVkQm1SQ3NNc0JYOEZ6?=
 =?utf-8?B?a0MrUFM5YWNmNi9mRlJObjFGcnUwUnFxZUM4cE1uMmFaaG84aDRrMGVUMkFE?=
 =?utf-8?B?dGNqMFdNblBQdFB4N2NCS0h5UUJVQVFYcVRUZHo0elNtVFlkZ1k5cXFDMU5C?=
 =?utf-8?B?NENsQTVUbHA4bnNXMytWa05IWHhSZENYWlVENkt4TlA2ZFlYVlUxZm5xVTE1?=
 =?utf-8?B?dEN0MEhBVzVqaGNKZDFEYkF1UUd1eExYVklOR3ZMVHVlRUhLUHp0STYwRy81?=
 =?utf-8?B?bDdmaVZMYnlVZVJ5RXJzNlZyRE5uVitnMFQ1V0I0S0FBeFR4VVNYbnBvem9I?=
 =?utf-8?B?b0hiOEViZmZWTUsvdGsyK3pQL0c4T0twQUV3VFNEZTVOSzRwOUY0TXZmVU81?=
 =?utf-8?B?ZW1uT3pRVmhRQ0lRQ3pqOW9ST2cwVldqeEIwaHBZQmUrYWt1S3daeEU1alFv?=
 =?utf-8?B?K251aTc5elRHNGo2cWgvQ3dYeTVicVR0LyswVU1wY05QSmRuc2hTT3l2V21l?=
 =?utf-8?B?UUxLNW01cFFId05lbk9xVVNiYjNmcjNCZWo1Tzk1UFMrRUV3amhUWXF1cWZ0?=
 =?utf-8?B?TXJNYjkvcXVoVTNVNkRtdWxtR3V3cFNFU3ljSW1MOXl2WFVRdXlyWDlGMXZn?=
 =?utf-8?B?dDdXVzU5aWVMUVpnaXVzRW5JejVLZWgzaGJEMEp1NUNzbjFCZmVjUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4276.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a74edef-10cd-4630-58ec-08ded03035b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2026 07:31:01.0858
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gRnEgylKLu2huyzOJiH9UNDgLPQXn3H+qnDwx3GNmcBsTV4CJeMzc/0bWAorknNx1dvH2XXxlqUMZ0DxvszErQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5907
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_003122_890648_04EEC9F8 
X-CRM114-Status: GOOD (  15.21  )
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

SGkgU2h1bHpoZW5rbywgQXJuZCwgQW5kcmV3DQoNClBsZWFzZSBhbGxvdyBtZSB0byBzdW1tYXJp
emUgdGhlIHBvdGVudGlhbCBhcHByb2FjaGVzIHdlIGhhdmUgZGlzY3Vzc2VkIHNvDQpmYXIgZm9y
IHVwc3RyZWFtaW5nIHRoZSBlU1BJIGRyaXZlcjoNCg0KKDEpIFJldXNlIHRoZSBleGlzdGluZyBT
UEkgc3Vic3lzdGVtIGFuZCB0cmVhdCBlU1BJIHBhY2tldHMgYXMgcHVyZSBzaWduYWxzLg0KKDIp
IE1haW50YWluIHRoZSBkcml2ZXIgdW5kZXIgdGhlIFNvQyBzdWJzeXN0ZW0sIHNpbmNlIHRoZXJl
IGlzIGN1cnJlbnRseSBubw0KICAgIGVTUEkgc3Vic3lzdGVtLg0KKDMpIENyZWF0ZSBhIG5ldyBl
U1BJIHN1YnN5c3RlbSBhbmQgcmV3cml0ZSB0aGUgZVNQSSBkcml2ZXIgYWNjb3JkaW5nbHkuDQoN
CkZvciBvcHRpb24gMSwgd2UgZG8gbm90IHRoaW5rIHRoaXMgd291bGQgYmUgYSBnb29kIGZpdCwg
YmVjYXVzZSBlU1BJIGhhcw0KY2xlYXJseSBkZWZpbmVkIHNlbWFudGljcyBmb3IgZWFjaCBjaGFu
bmVsLCBhbmQgb3VyIGhhcmR3YXJlIGV4cG9zZXMNCmRpZmZlcmVudCBzZXRzIG9mIHJlZ2lzdGVy
cyBmb3IgZWFjaCBvZiB0aGVtLg0KDQpGb3Igb3B0aW9uIDIsIHdlIHRoaW5rIHRoaXMgd291bGQg
YmUgYSBwcmFjdGljYWwgc2hvcnQtdGVybSBzb2x1dGlvbiwgYW5kIHdlDQpjYW4gZXhwb3NlIHRo
ZSBwZXItY2hhbm5lbCBmdW5jdGlvbmFsaXR5IHRocm91Z2ggdGhlIGV4aXN0aW5nIEdQSU8sIE1D
VFAsIGFuZA0KTVREIHN1YnN5c3RlbXMgZm9yIHRoZSBWVywgT09CLCBhbmQgZmxhc2ggY2hhbm5l
bHMsIHJlc3BlY3RpdmVseS4NCkhvd2V2ZXIsIHRoaXMgbWF5IG5lZWQgdG8gYmUgcmV2aXNpdGVk
IG9uY2UgYW4gZVNQSSBzdWJzeXN0ZW0gYmVjb21lcw0KYXZhaWxhYmxlIGluLXRyZWUuDQoNCkZv
ciBvcHRpb24gMywgb3VyIGNvbmNlcm4gaXMgdGhhdCB0aGVyZSBpcyBjdXJyZW50bHkgbm8gb3Ro
ZXIgZVNQSSBoYXJkd2FyZQ0Kb3IgZHJpdmVyIGluLXRyZWUgdGhhdCBjb3VsZCBzZXJ2ZSBhcyBh
IHJlZmVyZW5jZSBmb3IgZGVmaW5pbmcgYSBtb3JlIGdlbmVyaWMNCmludGVyZmFjZS4gQ3JlYXRp
bmcgYSBuZXcgc3Vic3lzdGVtIGF0IHRoaXMgc3RhZ2UgbWF5IHRoZXJlZm9yZSBiZSBzb21ld2hh
dA0Kb3Zlci1lbmdpbmVlcmVkLCBzaW5jZSBpdCB3b3VsZCBvbmx5IGhhdmUgb25lIHVzZXIuDQoN
CldlIHVuZGVyc3RhbmQgdGhhdCBOdXZvdG9uIG1heSBiZSB0aGUgbmV4dCBsaWtlbHkgdmVuZG9y
IHRvIHN1cHBvcnQgZVNQSSBpbg0KdGhlaXIgQk1DIFNvQ3MuIFNpbmNlIGRyaXZlcnMvc29jIHBh
dGNoZXMgZm9yIE51dm90b24gQk1DcyBhbHNvIGdvIHRocm91Z2gNCnRoZSBCTUMgdHJlZSwgd2Ug
ZXhwZWN0IHRoZXJlIHdvdWxkIGJlIGFuIG9wcG9ydHVuaXR5IHRvIHJlY29uc2lkZXIgd2hldGhl
cg0KYW4gaW5kZXBlbmRlbnQgZVNQSSBzdWJzeXN0ZW0gaXMgbmVlZGVkIG9uY2UgYW5vdGhlciB1
c2VyIGFwcGVhcnMuDQoNCkJhc2VkIG9uIHRoZSBhYm92ZSwgd2Ugd291bGQgbGlrZSB0byBwcmVw
YXJlIGFuZCBzdWJtaXQgdGhlIG5leHQgcmV2aXNpb24NCndpdGggdGhlIGRyaXZlciBsb2NhdGVk
IHVuZGVyIGRyaXZlcnMvc29jLg0KDQpDb3VsZCB5b3UgcGxlYXNlIGxldCB1cyBrbm93IGlmIHRo
ZXJlIGFyZSBhbnkgY29uY2VybnMgb3Igc3VnZ2VzdGlvbnMgdGhhdCB3ZQ0KaGF2ZSBub3QgY292
ZXJlZCwgb3Igd2hldGhlciB3ZSBjb3VsZCBzZW5kIHRoZSBuZXh0IHJldmlzaW9uIGZvciByZXZp
ZXc/DQoNCg==

