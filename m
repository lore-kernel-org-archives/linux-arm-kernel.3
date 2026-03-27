Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B10AC10BA420
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 04:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJBya6/LmYnWlClU5XM64v+wxE3rk4moA5iaJ3QpSO4=; b=K9N5sVmg2/d5mk6roWeaf2YP8f
	X1Hf1xgttOhJvsHd+WLA1itkZVX7C8pkM7ul0ieeJk/dSGpwgwU14tVIG4TtvWYqh+hVPxk/zedNn
	KtkelI+7R1cjPcRcSyWqqgdoVkDDg4juOkn3OqxLn/t9+qbtFZp1K+9rhY9Jr4uX7LX+e1ia0Tjct
	mnTAkYEo38wRuDTZ0Q/hEcAfUJh8R392763ZwOGMMHW4S/KncUEJ7flBMP+3Wniv9HrejVfPvopSC
	Xw8qPPztkYMDXcRuWDW5XWElpEUnDSEOftR3A45WJYxmE3sQwNcKgtvrfRwT++pnbYkBFT1C33XhP
	wLlK9wMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5yam-00000006e8r-21cJ;
	Fri, 27 Mar 2026 04:14:40 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5yaj-00000006e8Q-2XIn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 04:14:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FRqKEhKQAzVPA+bUx7rrHMA+t4CUK6/t6bTHZa1ASqmdXPCITKKjU9V/LkhlOie5Mu1jUuJ/wHZd2ZmJutJ/+cqRP2gSHLpBL8EG7B/xNEHa6w27yZv4wGrlofIHcA1/JMC/O3oIIYY7sM1W9M+tf9QNwMrajlgJ7kDSBHee3mnBGKazBCFQNH7uzL8lYvd4UHZKsQNF0gVSQjQJBJl8ukoKO7cFKM4Ldx6d+w+Mn9+SwO8qwE7muEvM/kW+5Oxc3e7SjBA3uGivNfoTt8vNPHiZhorTK58edqw0pmG+VDD7w4+2ArkqI5I4jS20o/CTF0kHB+cAoM0IIPY//iQozw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJBya6/LmYnWlClU5XM64v+wxE3rk4moA5iaJ3QpSO4=;
 b=LIkb/gzte7nPhu+VEvndadoqtDEqCcNK86Th3gikp2SMdlqc+xuAnXFKFeYg6oHUTD9QC3VsGP0EFGSquZGCXi1OSm8fZXODfyrnidQN3OwkT6SXn3CruArNb2ACxCQgVxPC75JsRBoww4btoZjxoIE0XBL9ueI7GYy17ilSECgLDN3LwWlRnGEI2Kf2TaCcCZ2SefnyK2wE8ewujC/WgATvt9Y4V+JhdBapVNkbTwM0zzikxLmcJSyq+HRBfrYFXM7GRsBZWHN161X4oaZDBHOgnYQYzVkuhDkaWKil1glU97LI4RmwnN/8CGxA/nKFTff5UuIBK9Hn0UIYKUDkZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJBya6/LmYnWlClU5XM64v+wxE3rk4moA5iaJ3QpSO4=;
 b=an4kSsbiwhTEQH3knQFgfalIuo9Uuhkpz5AP72f2k1ISx91MRlSEi1V5wGHdPhmL/FayfIoqF199WS4DyagqUR2IgEVVnz+i/EuPm/4pWag9wIeTPjjbvKrSFzFjBWyvq52PpZHWfFisLFnxx4Yz8BykSECI0NPwNOEEiHIVCzj3z6U8c8gt/fF6DeRhsFTvEKsc0IShzIeheJku9kgr9pBzUQJMoFOioMdK3qKZ8pVwsW5IHN40WMD0HrbHcu0QPZARqqTwLNwHduQPmh2Bnn3l4hpDbSxgwhiwNKRFp8QyQOpP48Syf4tbhCq5cYxGTdTOoMQ7FfKw6vYoJF3PKA==
Received: from KL1PR0601MB4276.apcprd06.prod.outlook.com
 (2603:1096:820:78::12) by SEZPR06MB5878.apcprd06.prod.outlook.com
 (2603:1096:101:e0::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Fri, 27 Mar
 2026 04:14:27 +0000
Received: from KL1PR0601MB4276.apcprd06.prod.outlook.com
 ([fe80::b7f3:3c41:fd0e:e3f6]) by KL1PR0601MB4276.apcprd06.prod.outlook.com
 ([fe80::b7f3:3c41:fd0e:e3f6%5]) with mapi id 15.20.9745.023; Fri, 27 Mar 2026
 04:14:27 +0000
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
Thread-Index: AQHcstFOqEOl3ItXl0mr3midS8GMZLWsphAAgABXFACAA7sEAIAAT9LAgAF5RgCADH1X4IAAILCAgAK7OMA=
Date: Fri, 27 Mar 2026 04:14:27 +0000
Message-ID: <KL1PR0601MB42763DAD359305DEBA4B769D9057A@KL1PR0601MB4276.apcprd06.prod.outlook.com>
References: <20260313-upstream_espi-v1-0-9504428e1f43@aspeedtech.com>
 <20260313-energy-casket-ca8adc1f1fd1@spud>
 <23909400-4e7f-49c9-a982-14036372af98@app.fastmail.com>
 <c3b28ee92fa46700887d0c68b23045b2418358a7.camel@codeconstruct.com.au>
 <KL1PR0601MB4276ED93723F0B1F42349AD89041A@KL1PR0601MB4276.apcprd06.prod.outlook.com>
 <0f7f0f96-a918-47d5-a0bd-bbde494c8fed@app.fastmail.com>
 <KL1PR0601MB4276B5BE3B96C18E3A66AD709049A@KL1PR0601MB4276.apcprd06.prod.outlook.com>
 <14870d17-2471-4522-b8b5-03cb9002a4f7@app.fastmail.com>
In-Reply-To: <14870d17-2471-4522-b8b5-03cb9002a4f7@app.fastmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0601MB4276:EE_|SEZPR06MB5878:EE_
x-ms-office365-filtering-correlation-id: 85e915de-7c79-4f8d-20a4-08de8bb75619
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|42112799006|366016|1800799024|376014|7416014|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: N4QeTal56dhX/5ztHQooK1qVTuGqwdVJDs4qNJZrOtAg0fnXGxL84R4ssY3cKoy1NydfHCP14bxQDDLh7MepeSiP+6s2NnHWqlvZituVYDPAP8+V5Vyqe4kMiK+3m0DOdRyKijpsQhFwKgEXXOIx1YeKUdtoWIJNxu/UWCAfq4+VeqXJ5I0YYQSEFD6UmVYdElz6lRMjP/vIu/3PHgZs6TezANs6ZPWVa/teuqudrHCJV4lzT/vTB46dEyjWsxmY7nhicyli7f7obHAJAZh1+r1WiKOFFtKgBO34aV5OjgDF5CnKsdIHJnzykdvakF8XgAjXqCjc2ittQlQ+vJaLCtAX3vNiNoWyhycE55GKyI0s0qXcGzTz5UEUlwtAExlXGHhVm/vQricc77qDziDdTzuHg5GBFWZuMVtUfAVH8OW+g8owuWOw/rP4wJaYwNCedSxZ6HG8FGIgq10JFDR9xkGJTRqnPXQJtE/3u8HhzW9O5vEdMxs8LELCsPlAimaBQ6vVECZ+uEORHnGPwpef4ToT0UFt7+iD0QChK8Ie6+7ooA3u//9AsM9ATJlfdmAlA9auSMYAKEjgYlihT77bXRFeQKdpxJUn9pt2cs3HgZnnPUZ8Eb4COoFG6RuLAcpd/veMOPqKz6qXwKhIt2/cukcOiCBFHNruYTxL+V+W+qZ9k7uUCwhQ2r+vNw80GkZga1GiWHVYw7WXXPWNsW50IXYw2TIuEeSiAoXcOzgF4VG0d++GRIZOBpmzPQxGxuf9xK9DLrDFA+vISRQ2HS0E5TiEZtoZZc4CpWNUoVmkslw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB4276.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(1800799024)(376014)(7416014)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkFDbUVJb0pqSHhTd0VuTkVSNGZ4eGNWRmFzOUFENVFIY2dnQllLVklTY2Va?=
 =?utf-8?B?RG9FNUV3M2paZmk4aW1PQmNxWG0yeWc0YTRmOVl3UEZiUGsyUDZMTE1rSEVP?=
 =?utf-8?B?dW5Xb2JNZHJ3bDlQdGZ6RkZ3WFFmRmluRXlUL2plVEQvVnRNWldCYndiNFdm?=
 =?utf-8?B?Z3RYVFY4LzNaaUcrbnF3SlZJUXRpbmVnMU5rNkdIMGMwenZKclF4VjlLelBk?=
 =?utf-8?B?R3B4UnhLaFEzL0pjZjVtNStJbENDTTNlMFozME1pcDNhcXNIQXRRUnJxZjZU?=
 =?utf-8?B?aE1tT3FBSDBYcHJ2Z21CbDVsWjUyTHBZSktwV0I2c2owVDZrTWJpemJqVjN6?=
 =?utf-8?B?bTR6d0tTMjk2UWpLem4vZHBya3BCc243aG9XMlZxanZyRXRXRFpJa1MzVkRL?=
 =?utf-8?B?WDB4d0xwVW02VWtCWlpDbUpIaEdXOGs2T0Q5bGJsenU4N3hzNG5zNGdxUlRi?=
 =?utf-8?B?ajZ2NkVhUEJLTnlOTWZXM0FNdWRJcEhLa2pMQXMwVG10U2cyZW5TVEdSc2xr?=
 =?utf-8?B?MTk5M2dQTUZRY0dGZHovbk9UQzhvZFUwODJEWitWdWY1cDBtbUowczdwN2l0?=
 =?utf-8?B?UFlOK3FrdE9iUTRaUHlDZXVpZ0dvOXJnS2U5aHdPK0JocEZVMzB3ZFQrbnA5?=
 =?utf-8?B?YXJzUVRXQVZlSXo0eGtiTVlEbWFjNzdjaDNSUnpTYkdOcmRZQyt3eng5NVh4?=
 =?utf-8?B?VUpDTkoyVjEycDhjNmlUcE9yR1piek1CMFlha0pzWE1wVy81VUZjZGJCb0Ex?=
 =?utf-8?B?aDVtQlZNcTRDakw0QjhPVWt5dkxTQlhHM3hCcmJIQXQzdklxeXU2Z1FQeGVu?=
 =?utf-8?B?b3QzM3ZkMllXQXZNeEpFYUpsS1k3MEYwenhwYjd2QjBaVW10VVMyL3RaYzJ2?=
 =?utf-8?B?T3FQdllzVFg5Z0tTaUpNRlloSGNDTnRQVDRONU80elF0MEtaNDNabkxPUlVn?=
 =?utf-8?B?QlFpVVNKakkzZC9qL0hnaWYzeXVXb09iSUsxazJXK2o3Q2g3dThqa25iWDBn?=
 =?utf-8?B?blh3QnRHNXBzTURUMjMrRUVwS1BMblpJdEtaZ3REQUVNNXM1UXc0Wkdtczcw?=
 =?utf-8?B?dk8xdW1YMW9ncHptRzRMMUYvb3gzMTRQOGVYRFdVNlhkSEszRCtmOG0wS01q?=
 =?utf-8?B?NXZick45NEhEREJpcW14OFg1TW1qNnNXOHVZTWV3a3JkTDJtU3ErSUNlblE3?=
 =?utf-8?B?UzJna0R5cHliWHQ1US95bGpIdmZqTnlsUFU0OVpIWk5FeFZuRXo3Tk9MQkRj?=
 =?utf-8?B?WkcvYlBKa09oWFc4SDJ2SkRTSGVMZk11NExiU0NDOXpuTFY5MXdVNG5TTTdj?=
 =?utf-8?B?MWIxdHUwd3BQY2p3VENodUNMQlh2bWJOa3lUbmRwZzZhdnBhKzBMN01lODU1?=
 =?utf-8?B?VEhjQzhRTzIvcWZCSzFjbWUwNjkvMjIxZmNDOSt5Z1FXVnptUGdRd2ZWTm1l?=
 =?utf-8?B?T05yb2pqbWZqS0JGby8yNnpiU3U4cGFmVVNlKytBb3VqOHo1UVZ1RGl2eXRl?=
 =?utf-8?B?ampRM3E5dzF5OVYzcmdOa2gxbERkQjJlQ212V2VDRnJJUkpJUmVWQWZ1Q2d1?=
 =?utf-8?B?QXJQMkNKcWwrb0FMZjVub1VFNUEwYjRVTmQzVXpDSHpGRGdSd0JGNEdVMzF0?=
 =?utf-8?B?NzlISzRiTXhUQnNHNmJ2ejFNakJuKzRta2lVcDltMzd2V2QyZGQycHRzYi9p?=
 =?utf-8?B?SEQ1NVpuSHU5YVpzOE5tNmp0SXpjdzkvVlZpNG12WUt3YUJkalpEVUVYU0Fr?=
 =?utf-8?B?dnV3Mk9EdVdkQnhNTUMwRzFOTmNEdnozZTI5bUtwRFM2WDBuUlk4TGlFd2Zv?=
 =?utf-8?B?ejEvVzI3UjJZQUJ4WG9jR3Fpd282N2xsY3hRN0QrWTNMWW11T0VnbEFmZHdv?=
 =?utf-8?B?TjFuZE5jODUxdFVya0xTTGttRHZoa1hqM1VqYlBmSGNueFNqT3R1dnFVc2Zm?=
 =?utf-8?B?RkxKbElRRlphaG5WMEhUeXBrVEtONUxsTUc4Uzd4dEY2Z3BhSkxyZDQ0bXZI?=
 =?utf-8?B?azdVR0t2NmhHWGFtcnVJdHN0M29kQmhxUitFamFYWFM4RGgza0o3bHdzOThS?=
 =?utf-8?B?V3dVU1FGZXpUNTVLTUNmNnR2N2dpUnpXMC9lcGZBUG1qTGxudkJFOHpWSVBQ?=
 =?utf-8?B?OE1kRE1vdVZmV0lzZkRnYkRDNTVWblU3YXdIZ0dZL3NjMkpxUk5WbDNvczBM?=
 =?utf-8?B?Rk1oN0ljN3dMeHBIYU9lZUd5cDFZc05sTVNWY0VzOG1STE5wUFBhZ2pqT2w5?=
 =?utf-8?B?d2JTdC9wWlJLMnJTaS83VS9wT1k1YTl4Y0drUXc1c1Jmd1NMVnJWTDJKRWx4?=
 =?utf-8?B?cDExenpDNko4anl5RXE2bkYwV1ZjaXJOVmk1d1FtWEN3Mlk3bU5kUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4276.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85e915de-7c79-4f8d-20a4-08de8bb75619
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2026 04:14:27.2855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: slRsF0j7zCZj0TuQHSUsQxxHPNb7DEYgM2l8137Jatcx5wrmBvrSv5BbG2oUijNZ8T7d8CSEG+MtFD3lgEjuKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5878
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_211437_949326_BB53BA09 
X-CRM114-Status: GOOD (  15.94  )
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

SGkgQXJuZCwNCg0KPiAtIEZvciB0aGUgSFctbW9kZS1vbmx5IHBlcmlwaGVyYWxzIChtZW1vcnks
IExQQyksIGlzIHRoZXJlIGFueQ0KPiAgIGRyaXZlciBpbnRlcmFjdGlvbiBhdCBhbGwgZm9yIHNl
dHRpbmcgaXQgdXAsIG9yIGlzIHRoaXMgY29tcGxldGVseQ0KPiAgIHRyYW5zcGFyZW50IHRvIExp
bnV4IHJ1bm5pbmcgb24gdGhlIEJNQz8NCg0KRm9yIExQQy1zdHlsZSBJTyBhY2Nlc3NlcyBsaWtl
IFBvc3QgQ29kZSBDYXB0dXJlIChQQ0MpLCB0aGUgYWNjZXNzZXMgYXJlDQpjb21wbGV0ZWx5IHRy
YW5zcGFyZW50IHRvIExpbnV4Lg0KDQpGb3IgbWVtb3J5IGFjY2Vzc2VzLCB0aGV5IGFyZSBhbHNv
IHRyYW5zcGFyZW50IHRvIExpbnV4IG9uIHRoZSBCTUMuIEl0IGp1c3QNCnJlcXVpcmVzIGNvbmZp
Z3VyaW5nIHRoZSB0cmFuc2xhdGlvbiBmcm9tIHRoZSBidXMgYWRkcmVzcyB0byBhIHJlc2VydmVk
DQptZW1vcnkgcmVnaW9uIG9uIHRoZSBCTUMgZHVyaW5nIGRyaXZlciBwcm9iZS4NCg0KDQo+IC0g
Rm9yIHRoZSBvdGhlciBkZXZpY2VzIHJ1bm5pbmcgaW4gU1cgbW9kZSwgaXMgdGhlIGludGVyZmFj
ZSB0aGF0IHRoZQ0KPiAgIGRyaXZlciBzZWVzIGFic3RyYWN0IGluIHRoZSBzZW5zZSB0aGF0IHRo
ZSBzYW1lIGxvdy1sZXZlbCBjb2RlDQo+ICAgaXMgc2hhcmVkIGZvciBhbGwgb2YgdGhlbSwgb3Ig
YXJlIHRoZXNlIHN0aWxsIHNlcGFyYXRlIGZ1bmN0aW9uYWwNCj4gICBibG9ja3MgdGhhdCBlYWNo
IG5lZWQgdGhlaXIgb3duIHJlZ2lzdGVyLWxldmVsIGludGVyZmFjZT8NCg0KVGhlIGNoYW5uZWxz
IGFyZSBkaXN0aW5jdCBmdW5jdGlvbmFsIGJsb2NrcyB3aXRoaW4gdGhlIGVTUEkgY29udHJvbGxl
ciwgZWFjaA0KdXNpbmcgaXRzIG93biBjaGFubmVsLXNwZWNpZmljIHJlZ2lzdGVycyByZWdhcmRs
ZXNzIG9mIHdoZXRoZXIgdGhleSBvcGVyYXRlDQppbiBIVyBvciBTVyBtb2RlLiBUaGVyZSBpcyBu
byBjb21tb24gbWVzc2FnZSBmbG93IG9yIHJlZ2lzdGVycyBmb3IgdGhlDQpzb2Z0d2FyZSBtb2Rl
cy4gVGhlIGVTUEkgY29udHJvbGxlciBkaXNwYXRjaGVzIGVTUEkgbWVzc2FnZXMgdG8gdGhlIHJl
bGV2YW50DQpjaGFubmVsJ3MgaGFyZHdhcmUgZnVuY3Rpb24gYmxvY2ssIHdoaWNoIHRoZW4gdGFr
ZXMgYWN0aW9uIGFjY29yZGluZyB0byBpdHMNCm1vZGUgY29uZmlndXJhdGlvbi4NCg0KU29tZSBs
b3ctbGV2ZWwgZnJhbWV3b3JrIGNvZGUgbWF5IGJlIHNoYXJlYWJsZSwgZm9yIGV4YW1wbGUgYSB1
bmlmaWVkIElTUg0KZW50cnkgdGhhdCBjaGVja3MgaW50ZXJydXB0IHN0YXR1cyByZWdpc3RlciBh
bmQgcm91dGVzIHRvIGNoYW5uZWwtc3BlY2lmaWMNCmhhbmRsZXJzLCBidXQgdGhlIGNvcnJlc3Bv
bmRpbmcgaGFuZGxpbmcgd2lsbCBiZSBjaGFubmVsLXNwZWNpZmljLg0KDQpUaGFua3MsDQpZdW4g
SHN1YW4NCg==

