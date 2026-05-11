Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77F0CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 08:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=47LJMsIBdFXLvToJ+dFbXL3HYE3MH4/eEbF2e75hhTA=; b=3HTe5HRFklYsDc3QhIi+VKONSe
	DlKWq89pQOWpNLqnFPycWue7VFCMqqECMoJCona3pq9aDqPfAwmVT3Pb8spjMtjfvlJn+5X0aYfbB
	uJnINeDB2dCviFvq+U69qQiiYUbuSHt4WAsqMpeoCSE/+jNBlgLsDBghRxKZ+pvyXEkI9wCMs5B2f
	Vs8djCSSuRR2xYcnL9SWvcycr37ju8DsGqwAL/aO+ovenhGNyXHCSon7aUXVvDN7Vu3499pBwfhgR
	wCnnQaWJq+2nulq5Rhz/QfygXks3qWHyqlH90szSv71o4Vxt8sihY9hH9dv2+OGHlItoEQeB3uKPM
	vy+Ky3hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLsg-0000000CkBO-2aAv;
	Mon, 11 May 2026 08:20:50 +0000
Received: from mail-westeuropeazon11013065.outbound.protection.outlook.com ([52.101.72.65] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLsd-0000000Ck9u-2B91
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 08:20:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=spaKTEAhSboI4WHsjcjPTu5B0fWS6LmRhVDEINKk5IekuBP2QYb38f5cDlKyMKWtOPHfItMjI3TfUGOtidIx5n8hcKEt56YXQ+srmtQsWSHfU4ZBfkhnqGcrjNwzmg6dn4Qb7TjpNuHeHzq95msTelbGUtXwZWyasKjzfaI5UxYt0qb3SUcNeW46BJ5IWuzBbhktfNR4r2cKXtUgImLprmJzr3QrOG4cx/2vLXPDL7VWHpStzyembsNxPRb1vdPF4EoZLdEDSXOlgNkN/4PFBwSQU9MjaX2v8YMLIgUzVFlcurYVAo1CZX9j/aL16Ru+DMqJ547ck0vpWxnD1cFK3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47LJMsIBdFXLvToJ+dFbXL3HYE3MH4/eEbF2e75hhTA=;
 b=vJAHiV4z/y0hoPellFvnsumGAwgrfHTF92gFmHXbAZwymRC6HGDswOYflXsjAGz5UxU/DY0kPA7VtUtgiMTzuqDPAtgpcOcVXp3tl/aSMrG6fKVLhpKe5MGIEXlzGrbgc5f4Bt/6TUtmT/ftjr8KPZykDFeMov+OtjacDT7PjzTQ0Uy18kuO9fYjgL6IXWuCVZOmG6dWCi4xr3/3Gk1n1O1ezC7jyo7uO0WF1JrgarF6iZEgPa0x/tzMfYQmUUBuWg2ZBkT6zc1QUvicZWqB3LmkzKsyzFzDdpCS3SZv6psTtWEO1coaoqC19iIt8eqwRtLYo7KX3DSPTh4pgPtOlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47LJMsIBdFXLvToJ+dFbXL3HYE3MH4/eEbF2e75hhTA=;
 b=VYuMQivbZkJkQCKl8cdkITBHDtnuQBRTBba3R6mJAkP1hvOwaDQSeTtL/Uwh9X4K/7QSawTjCwXVcnxmyWrBG9XwXuugzz6zdgahaFnzMDYoPyTYgKjn696J+qErj6xEvTkt3U+GZPYzhlS+JJmdEx2aM9RyjL8wDEh4/Mg7dJ3rX68hg4A5MEKzM5nlBznnBUfoMEUO6vAydOU/iBNW2eMegqingnOzc1RFxkYA61Rud8tYX6G2XD5t4+xv0ZVt14+pFBBz97kUnCX4OGUwIKyATKwjovzcX4CPNUJ5qEeH5RANUF7w/Y+M10/6+nUgEeUzyQ96M8nsEOOMSAzaOQ==
Received: from GV2PR04MB12272.eurprd04.prod.outlook.com
 (2603:10a6:150:328::18) by VI0PR04MB10568.eurprd04.prod.outlook.com
 (2603:10a6:800:26c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 08:20:40 +0000
Received: from GV2PR04MB12272.eurprd04.prod.outlook.com
 ([fe80::3c9e:6f28:93b5:b908]) by GV2PR04MB12272.eurprd04.prod.outlook.com
 ([fe80::3c9e:6f28:93b5:b908%7]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 08:20:38 +0000
From: Bough Chen <haibo.chen@nxp.com>
To: Chancel Liu <chancel.liu@nxp.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>
CC: "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: RE: [PATCH 4/5] arm64: dts: freescale: imx952-evk: Add IMX-AUD-IO
 board support
Thread-Topic: [PATCH 4/5] arm64: dts: freescale: imx952-evk: Add IMX-AUD-IO
 board support
Thread-Index: AQHc3164WXMRqmx0v0mFiJ0OoeSRcbYIfmWg
Date: Mon, 11 May 2026 08:20:38 +0000
Message-ID: <GV2PR04MB122722970C97CBA8B5FDFCFBF90382@GV2PR04MB12272.eurprd04.prod.outlook.com>
References: <20260509024846.2094049-1-chancel.liu@nxp.com>
 <20260509024846.2094049-5-chancel.liu@nxp.com>
In-Reply-To: <20260509024846.2094049-5-chancel.liu@nxp.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR04MB12272:EE_|VI0PR04MB10568:EE_
x-ms-office365-filtering-correlation-id: 3e5c6434-b356-4fd4-0e53-08deaf362ee7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|19092799006|376014|7416014|1800799024|22082099003|56012099003|18002099003|38070700021|3023799003;
x-microsoft-antispam-message-info: YMdnQMbUA/b5dZ8BUSBj8MPYVOwyBWVbO0F8q5Uq3TdGp/2V1AB5tbehGAecsyp12LkC5xiYmmpK4OVJeN51JlTCYZ13hOnyq8dlZ47cP7JVdvqSroXzxmNfp0B7Y03iGasw2QQ1Y8us9HcFEsV1SI6SnFGjWPV/Spbdw2mXV5XzZiYzrUSO2q7IlQdYIprdEgsxk63Rv+jkW2k7ZZIWGugdUARBHtUoRTgkBxDZK+Qs5TiR99a7tH3tSfdzuuJaTeWkTi+Vz8trbEBapqzxIEUqcOorikijicTCZnEZaSJRlySdC4XQ9QpIyaWTWGry0WT16AEjobiBc5yXSkLsGniEhQ1c070L0lESA7qU1KsuK116/V6PJMUZndrCsWz3Nv+pjnuNoxWSnZ+34RnpA5nGtmlXiThXn0WxGIdW76Hc6YJ5lN7EcmjdSxbyvS4KSUd/y/kABYb38+CvFQLKUA+pi/fz2YvqgtmvhusH8mVhrV/KYtuSMyqhNT35aaVD81gwdisI3l5bf59i6ikNYSSrFP7xyW9H+sRN15gRHgwC/YyF9BUIWnZaH8ehB4Kyt4qIFaCvcxmPVqDTaP5EuTFHmSS/OKgsW6ukTum620Q0YpT4wFmrvuZZIvpO2H/0zSKqeNRcykOYvvFPexzEZeemCibJHaV7CQ2pVkRvlP7XMkVnY6YE02/oSyOxYz/bwHz0CfwqQfP3Z/hI3HHA18vQhBPEt2MYQ2VEHBRwZplehiE89NKz/r+uyr2yP8QG
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12272.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(1800799024)(22082099003)(56012099003)(18002099003)(38070700021)(3023799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?a3dxcG9aNzhCMFpPTTdXQXUzNjhBb29SbjdDWGRDMWdzL2IzajJLUzU2d2pH?=
 =?gb2312?B?K0x4YytBVjByKys1WXpUWWJzNktma0FxVnNWMkdBMmdyY3hBUk5paTJhSzFD?=
 =?gb2312?B?QlZ2ZUR0L04xY21oK3VXaE1qajhSWmU2eERoQ1ZETWFBUExUSGxPU09DRFpY?=
 =?gb2312?B?blI1VHVnUVpKYzExc0ZSRkdXNENNb1YwWitLSnpHQnJ6aFFCem5ZeWNmSG1p?=
 =?gb2312?B?YXdPWmY1V1BkRzZnOGNiUjIvNlRCdm5kcnR6anhGWGIxbWR4aE85SEdIV0dQ?=
 =?gb2312?B?QnowR0E5bDAvc0FCZ0xjRFNCZW81TjlSTWJVWG1NOThvcjRzazRuT0NSWUFT?=
 =?gb2312?B?VXZNeWVPVHlINkFBNlRYOFpkSVQzK1FqdGpmR3h0U1l5VmJXamI0WUQ3Y0tv?=
 =?gb2312?B?NXB3WkN6bGZnSW9nU0ZnUGNTZDFSOXJrQitQc0syYjVFbExTTmllVUFoUUE2?=
 =?gb2312?B?eURjM0dhcU9ncEM5OVptcDBrQ1Yxbkwza3lmaFdLOWlkajZxVHZkNjZhOE9M?=
 =?gb2312?B?NXZFaFlwdlZjZVM4Si9BamxMYUdzUjVMSmNTbDA2OXFtWDgzdldyRHhHWkdP?=
 =?gb2312?B?SlZDbnR3K0ROTDNsSzRpZ1NyemI1WmpNaHdvZzZleit5emJQSFRlS2sycVdm?=
 =?gb2312?B?Yi8wQVNIbmgweVpmUmgxKzNVYlN2ME1GemNuZW13bG9qOE51Y0E0bnlDMDdN?=
 =?gb2312?B?eUV2bDc1L3BiRXVvNFFyRm14ckl3WFFKdFdqTk9zUEYwSGtJWHRmV2VZYVZL?=
 =?gb2312?B?eHN4TzFBVW1IaEZvU1hCUk13eWtYcklrS3JHc05CMTRBY1dNTWVrZWhJdDUr?=
 =?gb2312?B?cHY1SXN2cW5ZUElObXA1MzZDWjJrOXU1cEN6Q0N0Sm9zSHQzTzlZU0VGNHVn?=
 =?gb2312?B?dW0rdHJPU0Y3ZVpzd3AzTU93R240c3l1empsZHh6Y2RPUWk0N0xNZUttYzZw?=
 =?gb2312?B?NjNYRWlrRWRrVmM4UkVuYmRNUDlZQytqRjNzWkNTR1RVY3ZtekY4QmNDcHFk?=
 =?gb2312?B?QkF2WHpyNXFKKzJDWGtrOVhvak5OdzJXS2dlTEIxY3ZucnNtQnFCM0FtTCtS?=
 =?gb2312?B?MGR6NEZxdmNsZVBXTXo2TjNMSndJcUg0cDg3MHh1Z0prT3NvTnBXRG9qVVdl?=
 =?gb2312?B?Q3lwbDJ4c1dScEN0blovTFhnOWxHQk45dS8zd3lydHZEcDlZemxRSG9CRDNj?=
 =?gb2312?B?dnlHbDdiZ0Nwb1dONGd5dDhGaE5NRHRkdkdYbVNUaXMzdldWL1BPdE5DYXYx?=
 =?gb2312?B?b0U2UU5NTVdiN1QycVBGZjRIV2NZeEUyWjhuRWwvb0JGeUVhdmg2bFFkRlBh?=
 =?gb2312?B?UFg2NFJjZExjUjZoY21UcHA4eVYwMnpVYjNJdENtVDVISG9VcWxvb0VGb1RJ?=
 =?gb2312?B?K291ZTlZUFRoRERBZDg4b2tDM2dOVnpYdzhIUHN3cHdyQks4eFUzTi9XSG0x?=
 =?gb2312?B?UytyN0U2VWJ3TXMzUzY0bVE0TWV3MCs2ejB2MEFCUHRuelFyVEY5RHh1UlVx?=
 =?gb2312?B?cHU3M1paeE9aU0FleUVMOXFwMWVQb0dhZ0ZCUUdxZTlPdUQzdXVEd1QzUU1y?=
 =?gb2312?B?L2dWUy8rcXRqREtqNG5CQ01HMHJ5eTRxOGxnNHowRCttZExRaFJUZy9RVmJh?=
 =?gb2312?B?TXowVStDd2ZuQlZQTktjVFNmNkcrMFVHRlJEaXU1RFFJMUR5VjAyRHJGZ3cy?=
 =?gb2312?B?dkNqWDcyZFV6SitWWTRWZlJBM1NncGNPOGtmdDRpSGRma3dKRXdoeEgwdGRW?=
 =?gb2312?B?emhCMjgxckowa0FDdFcyZXYrdEkrbGJMdnBOdzROUmtKQ0dibEpKajIyYjQ0?=
 =?gb2312?B?L3YxV1Fqdlpwc2xsUkpwSCtERnJ0bTFUa2J0S05vSk84ZFRUQVFQOTRmOUlB?=
 =?gb2312?B?bVVZV0dkZXA0MmU3eE1ZT1d0eE1oWEtqL25YYmw0R2wzVDJwQlJDNEdoUm9V?=
 =?gb2312?B?YUhTNjFxNXdESStaR1kxQXVrbkZwVnJVYStVQ1p3YjBJRUUrZ3Ywa0RkaXhU?=
 =?gb2312?B?TDgzNElDbm1ZRFMzQXNnZHN5NE1VMysxVHN0WXFsTWtkMnZWeW93a3JKV0lW?=
 =?gb2312?B?cThhSjRaTEZzSE52alVhajdoRlIyQ200Mk5tai9ublJDRVY5N2tWOWpWcXR5?=
 =?gb2312?B?aDh4UVJEanBad2VIenI3bnJ3cVVNVmpzUmYzMUtKOGR3Nm5yQlB5eHpmSHgx?=
 =?gb2312?B?MFRwVlJTSnE5VTh6b05nb3RaeHRDY3RscnFLaXdibHI4UVpnNjFwUk5DL1Qw?=
 =?gb2312?B?UHZtRXBVOGkraGdVTGptVGVQaXRBSFlkVzBkTTVIMTduN0ZIWm0vRjg1U0Vx?=
 =?gb2312?Q?30hCgdIEFi8bZSdvh1?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12272.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e5c6434-b356-4fd4-0e53-08deaf362ee7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2026 08:20:38.2714
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6RuN7GSQY6eavCiPl0+f4TCQovF30wd47AA1TKFbPk1EkU2XPyhzaMZXHHfFMLUHB5smuKHX+hSQN/g9uh3yTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10568
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_012047_574788_E6B400DA 
X-CRM114-Status: GOOD (  19.41  )
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDaGFuY2VsIExpdSA8Y2hhbmNl
bC5saXVAbnhwLmNvbT4NCj4gU2VudDogMjAyNsTqNdTCOcjVIDEwOjQ5DQo+IFRvOiByb2JoQGtl
cm5lbC5vcmc7IGtyemsrZHRAa2VybmVsLm9yZzsgY29ub3IrZHRAa2VybmVsLm9yZzsgRnJhbmsg
TGkNCj4gPGZyYW5rLmxpQG54cC5jb20+OyBzLmhhdWVyQHBlbmd1dHJvbml4LmRlOyBmZXN0ZXZh
bUBnbWFpbC5jb207DQo+IG10dXJxdWV0dGVAYmF5bGlicmUuY29tOyBzYm95ZEBrZXJuZWwub3Jn
DQo+IENjOiBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3Jn
Ow0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBpbXhAbGlzdHMubGludXguZGV2Ow0K
PiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWNsa0B2Z2VyLmtl
cm5lbC5vcmcNCj4gU3ViamVjdDogW1BBVENIIDQvNV0gYXJtNjQ6IGR0czogZnJlZXNjYWxlOiBp
bXg5NTItZXZrOiBBZGQgSU1YLUFVRC1JTyBib2FyZA0KPiBzdXBwb3J0DQo+IA0KPiBJTVgtQVVE
LUlPIGlzIGEgZGF1Z2h0ZXIgYm9hcmQgd2hpY2ggY2FuIGJlIGNvbm5lY3RlZCB0byBpLk1YOTUy
IEVWSw0KPiB0aHJvdWdoIGEgcGh5c2ljYWwgY29ubmVjdG9yLiBUaGlzIGNvbm5lY3RvciBpcyBk
ZXNjcmliZWQgYXMgYSBmc2wsaW8tY29ubmVjdG9yDQo+IGNvbm5lY3RvciB0byBleHBvc2UgYSBj
b25zdHJhaW5lZCBzdWJzZXQgb2YgR1BJTyBhbmQgY2xvY2sgcmVzb3VyY2VzIHRvDQo+IGRhdWdo
dGVyIGJvYXJkIHVzaW5nIGZpeGVkIGVsZWN0cmljYWwgd2lyaW5nLg0KPiANCj4gQWxzbyBhZGQg
cmVxdWlyZWQgcmVndWxhdG9yLCBzb3VuZCBDUFUgREFJIGFuZCBJMkMgYnVzIGNvbmZpZ3VyYXRp
b24gdG8gc3VwcG9ydA0KPiBJTVgtQVVELUlPIG9uIHRoaXMgYmFzZSBib2FyZC4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IENoYW5jZWwgTGl1IDxjaGFuY2VsLmxpdUBueHAuY29tPg0KPiAtLS0NCj4g
IGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDk1Mi1ldmsuZHRzIHwgNjggKysrKysr
KysrKysrKysrKysrKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA2NiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNj
YWxlL2lteDk1Mi1ldmsuZHRzDQo+IGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14
OTUyLWV2ay5kdHMNCj4gaW5kZXggNjJkMWMxYzdjNTAxLi5iYjFkOGQ1ZjVmY2YgMTAwNjQ0DQo+
IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDk1Mi1ldmsuZHRzDQo+ICsr
KyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDk1Mi1ldmsuZHRzDQo+IEBAIC00
Myw2ICs0MywxNyBAQCBhbGlhc2VzIHsNCj4gIAkJc3BpNiA9ICZscHNwaTc7DQo+ICAJfTsNCj4g
DQo+ICsJYXVkX2lvX2Nvbm46IGF1ZC1pby1jb25uZWN0b3Igew0KPiArCQljb21wYXRpYmxlID0g
ImZzbCxpby1jb25uZWN0b3IiOw0KPiArCQlncGlvLWNvbnRyb2xsZXI7DQo+ICsJCSNncGlvLWNl
bGxzID0gPDI+Ow0KPiArCQlncGlvLW1hcCA9IDwwIDAgJnBjYWw2NDE2IDggMT47DQo+ICsJCWdw
aW8tbWFwLW1hc2sgPSA8MHhmZiAweDA+Ow0KPiArCQlncGlvLW1hcC1wYXNzLXRocnUgPSA8MHgw
IDB4MT47DQoNCkFjY29yZGluZyB0byB0aGUgaW5jbHVkZS9kdC1iaW5kaW5ncy9ncGlvL2dwaW8u
aCwgdGhlcmUgNiBiaXRzIGRlZmluaXRpb24gZm9yIEdQSU8gZmxhZ3MsIGhlcmUgeW91IGp1c3Qg
cGFzcyB0aHJvdWdoIGJpdCAwLCBzaG91bGQgaXQgYmV0dGVyIHRvIHVzZSB0aGUgZm9sbG93aW5n
IHZhbHVlOg0KZ3Bpby1tYXAtcGFzcy10aHJ1ID0gPDB4MCAweDNmPjsNCg0KUmVnYXJkcw0KSGFp
Ym8gQ2hlbg0KPiArCQkjY2xvY2stY2VsbHMgPSA8MT47DQo+ICsJCWNsb2NrLW1hcCA9IDwwICZz
Y21pX2NsayBJTVg5NTJfQ0xLX1NBSTI+Ow0KPiArCX07DQo+ICsNCj4gIAlidF9zY29fY29kZWM6
IGF1ZGlvLWNvZGVjLWJ0LXNjbyB7DQo+ICAJCSNzb3VuZC1kYWktY2VsbHMgPSA8MT47DQo+ICAJ
CWNvbXBhdGlibGUgPSAibGludXgsYnQtc2NvIjsNCj4gQEAgLTExNCwxMyArMTI1LDI5IEBAIHJl
Z18xcDh2OiByZWd1bGF0b3ItMXA4diB7DQo+ICAJCXJlZ3VsYXRvci1uYW1lID0gIitWMS44X1NX
IjsNCj4gIAl9Ow0KPiANCj4gLQlyZWdfdnJlZl8xdjg6IHJlZ3VsYXRvci1hZGMtdnJlZiB7DQo+
ICsJYXVkX2lvX3JlZ18xdjg6IHJlZ192cmVmXzF2ODogcmVndWxhdG9yLWFkYy12cmVmIHsNCj4g
IAkJY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOw0KPiAgCQlyZWd1bGF0b3ItbmFtZSA9
ICJ2cmVmXzF2OCI7DQo+ICAJCXJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDE4MDAwMDA+Ow0K
PiAgCQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDwxODAwMDAwPjsNCj4gIAl9Ow0KPiANCj4g
KwlhdWRfaW9fcmVnXzN2MzogcmVndWxhdG9yLWF1ZC1pby0zdjMgew0KPiArCQljb21wYXRpYmxl
ID0gInJlZ3VsYXRvci1maXhlZCI7DQo+ICsJCXJlZ3VsYXRvci1uYW1lID0gImF1ZC1pby0zdjMi
Ow0KPiArCQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsNCj4gKwkJcmVndWxh
dG9yLW1pbi1taWNyb3ZvbHQgPSA8MzMwMDAwMD47DQo+ICsJCWdwaW8gPSA8JnBjYWw2NDE2IDEx
IEdQSU9fQUNUSVZFX0hJR0g+Ow0KPiArCQllbmFibGUtYWN0aXZlLWhpZ2g7DQo+ICsJfTsNCj4g
Kw0KPiArCWF1ZF9pb19yZWdfNXY6IHJlZ3VsYXRvci01diB7DQo+ICsJCWNvbXBhdGlibGUgPSAi
cmVndWxhdG9yLWZpeGVkIjsNCj4gKwkJcmVndWxhdG9yLW5hbWUgPSAiYXVkLWlvLTV2IjsNCj4g
KwkJcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8NTAwMDAwMD47DQo+ICsJCXJlZ3VsYXRvci1t
aW4tbWljcm92b2x0ID0gPDUwMDAwMDA+Ow0KPiArCX07DQo+ICsNCj4gIAlyZWdfYXVkaW9fcHdy
OiByZWd1bGF0b3ItYXVkaW8tcHdyIHsNCj4gIAkJY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4
ZWQiOw0KPiAgCQlyZWd1bGF0b3ItbmFtZSA9ICJhdWRpby1wd3IiOw0KPiBAQCAtMzIzLDcgKzM1
MCw3IEBAIGkyYzRfcGNhbDY0MDg6IGdwaW9AMjEgew0KPiAgCX07DQo+ICB9Ow0KPiANCj4gLSZs
cGkyYzYgew0KPiArYXVkX2lvX2kyYzogJmxwaTJjNiB7DQo+ICAJY2xvY2stZnJlcXVlbmN5ID0g
PDEwMDAwMD47DQo+ICAJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gIAlwaW5jdHJsLTAg
PSA8JnBpbmN0cmxfbHBpMmM2PjsNCj4gQEAgLTQ2OCw2ICs0OTUsMjcgQEAgJnNhaTEgew0KPiAg
CXN0YXR1cyA9ICJva2F5IjsNCj4gIH07DQo+IA0KPiArYXVkX2lvX2NwdTogJnNhaTIgew0KPiAr
CXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ICsJcGluY3RybC0wID0gPCZwaW5jdHJsX3Nh
aTI+Ow0KPiArCWNsb2NrcyA9IDwmc2NtaV9jbGsgSU1YOTUyX0NMS19CVVNORVRDTUlYPiwgPCZj
bGtfZHVtbXk+LA0KPiArCQkgPCZzY21pX2NsayBJTVg5NTJfQ0xLX1NBSTI+LCA8JmNsa19kdW1t
eT4sDQo+ICsJCSA8JmNsa19kdW1teT4sIDwmc2NtaV9jbGsgSU1YOTUyX0NMS19BVURJT1BMTDE+
LA0KPiArCQkgPCZzY21pX2NsayBJTVg5NTJfQ0xLX0FVRElPUExMMj47DQo+ICsJY2xvY2stbmFt
ZXMgPSAiYnVzIiwgIm1jbGswIiwgIm1jbGsxIiwgIm1jbGsyIiwgIm1jbGszIiwgInBsbDhrIiwg
InBsbDExayI7DQo+ICsJYXNzaWduZWQtY2xvY2tzID0gPCZzY21pX2NsayBJTVg5NTJfQ0xLX0FV
RElPUExMMV9WQ08+LA0KPiArCQkJICA8JnNjbWlfY2xrIElNWDk1Ml9DTEtfQVVESU9QTEwyX1ZD
Tz4sDQo+ICsJCQkgIDwmc2NtaV9jbGsgSU1YOTUyX0NMS19BVURJT1BMTDE+LA0KPiArCQkJICA8
JnNjbWlfY2xrIElNWDk1Ml9DTEtfQVVESU9QTEwyPiwNCj4gKwkJCSAgPCZzY21pX2NsayBJTVg5
NTJfQ0xLX1NBSTI+Ow0KPiArCWFzc2lnbmVkLWNsb2NrLXBhcmVudHMgPSA8MD4sIDwwPiwgPDA+
LCA8MD4sDQo+ICsJCQkJIDwmc2NtaV9jbGsgSU1YOTUyX0NMS19BVURJT1BMTDE+Ow0KPiArCWFz
c2lnbmVkLWNsb2NrLXJhdGVzID0gPDM5MzIxNjAwMDA+LCA8MzYxMjY3MjAwMD4sDQo+ICsJCQkg
ICAgICAgPDM5MzIxNjAwMD4sIDwzNjEyNjcyMDA+LCA8MTIyODgwMDA+Ow0KPiArCWZzbCxzYWkt
bWNsay1kaXJlY3Rpb24tb3V0cHV0Ow0KPiArCWZzbCxzYWktYXN5bmNocm9ub3VzOw0KPiArfTsN
Cj4gKw0KPiAgJnNhaTMgew0KPiAgCWFzc2lnbmVkLWNsb2NrcyA9IDwmc2NtaV9jbGsgSU1YOTUy
X0NMS19BVURJT1BMTDFfVkNPPiwNCj4gIAkJCSAgPCZzY21pX2NsayBJTVg5NTJfQ0xLX0FVRElP
UExMMl9WQ08+LA0KPiBAQCAtNjg4LDYgKzczNiwyMiBAQA0KPiBJTVg5NTJfUEFEX1NBSTFfVFhE
MF9fQU9OTUlYX1RPUF9HUElPMV9JT18xMwkJMHg1MWUNCj4gIAkJPjsNCj4gIAl9Ow0KPiANCj4g
KwlwaW5jdHJsX3NhaTI6IHNhaTJncnAgew0KPiArCQlmc2wscGlucyA9IDwNCj4gKwkJCUlNWDk1
Ml9QQURfRU5FVDJfTURJT19fTkVUQ01JWF9UT1BfU0FJMl9SWF9CQ0xLDQo+IAkweDMxZQ0KPiAr
CQkJSU1YOTUyX1BBRF9FTkVUMl9NRENfX05FVENNSVhfVE9QX1NBSTJfUlhfU1lOQw0KPiAJMHgz
MWUNCj4gKwkJCUlNWDk1Ml9QQURfRU5FVDJfVEQzX19ORVRDTUlYX1RPUF9TQUkyX1JYX0RBVEFf
MA0KPiAJMHgzMWUNCj4gKwkJCUlNWDk1Ml9QQURfRU5FVDJfVEQyX19ORVRDTUlYX1RPUF9TQUky
X1JYX0RBVEFfMQ0KPiAJMHgzMWUNCj4gKwkJCUlNWDk1Ml9QQURfRU5FVDJfVFhDX19ORVRDTUlY
X1RPUF9TQUkyX1RYX0JDTEsNCj4gCTB4MzFlDQo+ICsJCQlJTVg5NTJfUEFEX0VORVQyX1RYX0NU
TF9fTkVUQ01JWF9UT1BfU0FJMl9UWF9TWU5DDQo+IAkweDMxZQ0KPiArDQo+IAlJTVg5NTJfUEFE
X0VORVQyX1JYX0NUTF9fTkVUQ01JWF9UT1BfU0FJMl9UWF9EQVRBXzANCj4gCTB4MzFlDQo+ICsJ
CQlJTVg5NTJfUEFEX0VORVQyX1JYQ19fTkVUQ01JWF9UT1BfU0FJMl9UWF9EQVRBXzENCj4gCTB4
MzFlDQo+ICsJCQlJTVg5NTJfUEFEX0VORVQyX1JEMF9fTkVUQ01JWF9UT1BfU0FJMl9UWF9EQVRB
XzINCj4gCTB4MzFlDQo+ICsJCQlJTVg5NTJfUEFEX0VORVQyX1JEMV9fTkVUQ01JWF9UT1BfU0FJ
Ml9UWF9EQVRBXzMNCj4gCTB4MzFlDQo+ICsJCQlJTVg5NTJfUEFEX0VORVQyX1JEMl9fTkVUQ01J
WF9UT1BfU0FJMl9NQ0xLDQo+IAkweDMxZQ0KPiArCQk+Ow0KPiArCX07DQo+ICsNCj4gIAlwaW5j
dHJsX3NhaTM6IHNhaTNncnAgew0KPiAgCQlmc2wscGlucyA9IDwNCj4gIAkJCUlNWDk1Ml9QQURf
R1BJT19JTzE3X19XQUtFVVBNSVhfVE9QX1NBSTNfTUNMSw0KPiAJMHgzMWUNCj4gLS0NCj4gMi41
MC4xDQo+IA0KDQo=

