Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6762ECCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 06:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dn1QzVSX1RJou+kwhuuwi1qMVDRVe80ILhQPpxTFZ00=; b=w78OCzd3mR/bfxd3nvyviiPIGL
	0BTfXSd4gdU5YoU0xNaw54oDUf28O5dyRR5EBm/niJthTu+Zk8YTPPxast3MpXsLl/9CDLe9B/sRK
	nWnGSdS8JAjUqvQrgA5qmhuIa7y60Djfpd71Y+1G4BUgUecz5pe0esBjQvtDuI1ERYSGFhqgzLHWP
	4LlaiAnAUaNqRqZDp5YWsJaNDFDxO+jsWqJxBUZEslxlR3bvE6FTAepe/6zEWv6LnUlFXsfVfGqoe
	HKwBk2gOQ8EDnHdnGN/M/NhBykNY9vwzadMkZF6d71KJFjGlYVjno++oDAO/40APVIYkfsWrs2z2l
	al0A/Mkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vILcm-00000004qXa-27Jk;
	Mon, 10 Nov 2025 06:43:36 +0000
Received: from mail-japaneastazon11022120.outbound.protection.outlook.com ([52.101.126.120] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vILci-00000004qX6-1NVD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 06:43:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TPZrIziY8a+aK543DzPpYBjZ4neru3My/iAgy//0+PsVI3wJwWA11O8DXsZywP0jdF1KZxndo7XACpv/lAs1Sz3z2BfqyqW6I+RGto9qvkKOFwfKOuP60hNGjU/YHREXa330y9XVFlVZyV7IIzRWlWVLykZCMeLPLHlezk8mJiCVw+x1JZq2psa52yVX1Cfdbw2gwIZSiYEDSRCz7MTa0sqiyUdrphJV3L1y6HotX4mLdppbfIZ1Df6fHrSOfAkFbcnEJLO6FiLXsN/iuV4ywpKPzgbRoYGCGrCQ4pMHGUhBhSqj8cfZ2xv7kcm/f/xLaiMszwl54kYC0ap6QhkSYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dn1QzVSX1RJou+kwhuuwi1qMVDRVe80ILhQPpxTFZ00=;
 b=j70hzbp2kBavKpmP2DpmLpFDt/7I/1umNO0iObFQwhVB3sooGM9jo/nIEw8iIdUALRyrvN1BM63xv4mlBDvY+Zya655ZeOzEXrAeMcyL5XWQoKGSmJeXqAhDGt4czUdX9WfEwSNvf32SQ72ErSdK3KN3mPbCtYVrl5qtY70REuOIoQNithG+p48iQRHUnk3AwWMhi/ZbztTJH3C192al6OVQm3ohauKqt9VqhXV2q5ZHXZR7LydOsjHbredwv82jBthF91mYX4WYoGKM1RtJyBP8fEGFCofZq6lHepHX6+RVbrIxv681ESgddQni6xkPdySHfPfWaRONUpq6G3y6NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from TYUPR06MB5876.apcprd06.prod.outlook.com (2603:1096:400:35e::5)
 by KL1PR0601MB5775.apcprd06.prod.outlook.com (2603:1096:820:b3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 06:43:23 +0000
Received: from TYUPR06MB5876.apcprd06.prod.outlook.com
 ([fe80::ce17:7330:b522:e920]) by TYUPR06MB5876.apcprd06.prod.outlook.com
 ([fe80::ce17:7330:b522:e920%6]) with mapi id 15.20.9298.010; Mon, 10 Nov 2025
 06:43:23 +0000
From: Gary Yang <gary.yang@cixtech.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggMS8zXSBkdC1iaW5kaW5nczogcmVzZXQ6IGFkZCBz?=
 =?utf-8?Q?ky1_reset_controller?=
Thread-Topic: [PATCH 1/3] dt-bindings: reset: add sky1 reset controller
Thread-Index: AQHcT5f429TQoTcB9UKGzGT7g1ZiKrTnNLeAgAREogA=
Date: Mon, 10 Nov 2025 06:43:23 +0000
Message-ID: <TYUPR06MB5876E999BEE87D3F80AF38E6EFCEA@TYUPR06MB5876.apcprd06.prod.outlook.com>
References: <20251107033819.587712-1-gary.yang@cixtech.com>
	 <20251107033819.587712-2-gary.yang@cixtech.com>
 <2841ae5f1f4ccafcbed6c70866d0237b9abdc338.camel@pengutronix.de>
In-Reply-To: <2841ae5f1f4ccafcbed6c70866d0237b9abdc338.camel@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB5876:EE_|KL1PR0601MB5775:EE_
x-ms-office365-filtering-correlation-id: f3651f50-90bd-4454-7885-08de202471a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|7053199007;
x-microsoft-antispam-message-info: =?utf-8?B?WEpCVk5GSlMxNkZEck55SGpCN1V1dUw4Q09VSkZGSS9OUGRPb2JIdzBXL2VZ?=
 =?utf-8?B?NXh4Y2hjMWtacmY5TjJjQjFnTmZqdGJsY0tYMm5yN2RwREw0UHZJc2FLSnpt?=
 =?utf-8?B?eGNpbCtRRmkvdFFDdDlweExIbS9UOGRRb2F2SnNaeWVuZ2ZMUkJtWEJwN285?=
 =?utf-8?B?enR4RzdGYkw2SEVLMkdMaVBKWW1XRW9JUEZUUHU0cVNJUzVsKzFYK2JaTGhC?=
 =?utf-8?B?ZEJFQnVCOGY2UjlicUV4MmdudGowYnE1RmdVQnk2ZkRySEZnN3NVTFJMaUc4?=
 =?utf-8?B?cTRSbksvb2RUNy9WN1lUL1lVcVRiZWNZNnZzVU8vMWhaU2ZaeXBGbVZyRDdU?=
 =?utf-8?B?NU1OUHJEZlVDYmtrR0RkalJ0V1VrNllPTHVsSFRMY3lvMFUwVnpUK28yNURa?=
 =?utf-8?B?NHBET0FhZFUyejZhQ1ZabmhZVmgxaGFMS3NkZDhBUHB2anlFV2IvcStXeW5j?=
 =?utf-8?B?NTNWSTV0TEU4aVY1b2JOY1VoMVZBNVJ0NGZpMndrZGoybjNjU1gycGRlQmEw?=
 =?utf-8?B?dWxNWkZhSlBkWkFkTDROai9kU1RFOGpyWllWTkhaaFh5WlRFMXFyRWhOZkhy?=
 =?utf-8?B?R1ZtVHh5VXcvWEtQLzNNaTlPRlY0UitNREp6UXhJWUI3MDFNeGFzemVIeFJV?=
 =?utf-8?B?d2o0VStFSTVybzljbmdiVlA4ck83OVdNVkJOWXptaTZmZWtIVlFyRUZJQ3FD?=
 =?utf-8?B?aTFjTGNIOHVwcWw1OHpidUp3c2xqWEJxUndxRGFqWlRaMEZiTjVpUnduL3Rw?=
 =?utf-8?B?WWV6aG1haCtObGxEZTZwajZVUE5ZSG9mR09MN0Yza09nMXZvMmtnOW1Jd0RE?=
 =?utf-8?B?OHdRYkgrQnVuR3grc0k0NFgweXBMYm0zVmxMVXhiblM3TmRCcDVXVXU0WkZW?=
 =?utf-8?B?MmI3ZEhhU0JmWlVQVUhJc3pCTGt0dDJ6bUVrZldEdnZrVXNPUzVTWFBzZW42?=
 =?utf-8?B?WjdKTG9FNWp4NlJCYUNmQmVHMExDY0pjWUV0cFFPTzBLRUMyRUgxUDFCdHVt?=
 =?utf-8?B?SlltbUY4TktKWW9sWWZQbTVpQmJFVkhEb1A2OWc0WFNRUXh6aWoyWVZjVGUv?=
 =?utf-8?B?bXJxVXRUSkFWbUdNcmZxd0g3RjlKS3RlTkxUWDVzWDY2a2FyYVlLT3VGWkE3?=
 =?utf-8?B?RHZ2anAyVnBaT2VocERsaEloYy9hTVF1cWEvcFU5ZXg2TTg1SUVDcnVXdEpn?=
 =?utf-8?B?MlNNU2R6bGkwNUFkUDVRb1cwd240aTB2Nk5IdHhrdUNVM1FXU1FSUTNTSm1G?=
 =?utf-8?B?SzdJODlIYytZcFVZWTFOOTM1b0c3eS80RHFiVkhJaHVRT2dpTHA3a2JNckpW?=
 =?utf-8?B?aWdlNTVKOVUvSDBCdzllM3FHTFdpUnVxS2FTTkxyNmlBajVhYnpOVVNkMUdH?=
 =?utf-8?B?VVlsRVY5M3FyUENyOE0rcVpCQjBRMjlxNldEYVlpN29oUm9rYzZCL3JxSDFC?=
 =?utf-8?B?UGJydU1CK2FtU1IzeG1qbnY5QXoyUVZudjNaT0pnaHFFUnBldk5hbUVtUjll?=
 =?utf-8?B?MkxDM2MyMGNVMXhyNStpa3hJU3UxZkZDYWg0UXBNdi9VKzhQTXdIRnhGbFNF?=
 =?utf-8?B?OUMxeTYyM0MydEpQSnNZZTMwbjJrYm1CbVdtSHU1Sk9DV0lWTjcxbTJnZFN5?=
 =?utf-8?B?eGdRMk1MWjJBMERXQ2k3ZC9TNUl2Um1YTlNIbXdVeVBSa3pxT1EyajdSeEgy?=
 =?utf-8?B?T04vRkJBT3dBbGpsTitCL1liN29mVkZPVXoxMjFLSno3a0l2MEdtbnJQMXBh?=
 =?utf-8?B?ZDc4cW05UGpabkhuQnJ5QzBqcDM3bTRldmRaNThDVkZJWE9qYkg0blRtaUpn?=
 =?utf-8?B?NFAxOW9MRVY0dDF6Lzl2cW5TOVYyZEdEZyttMDNEUkV5d1ZrMkQvU1BzL2x0?=
 =?utf-8?B?cEEzWkI5eEtRSGxVVTk3STlHSDNzbHhGeG5uRmt1Y2ZyRVRSMmFSektVanp2?=
 =?utf-8?B?Q3MzNGdzVFY3UVRqU3R0M3R5SjNjU2lLTldpK3Z0RUpGSlUrbHRqZzlkL2Jj?=
 =?utf-8?B?TVB2ZDNIczV3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB5876.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXB3aHNmZ3NLckVIVkY4MjdPUTBpR3lGekpaOGZoMXRaV1ZZS1htLzY1OWdt?=
 =?utf-8?B?ZE9IL2JjakJUZHcweHdraXRkOThoL2xsc1JoSVFodWt2MFZIQ09wWE1sZXo0?=
 =?utf-8?B?eVl4ZG1ERHRXajlCL01RcWdURkF2bTF4U1QxMlRza3R4MDVKUUpIdXhueVNq?=
 =?utf-8?B?cExTMmFOR21TN2NIdER3N0lQVTdPUGVDUEFtSERDeCtEbkxCQnQ5YStZdTR3?=
 =?utf-8?B?VEFoeUwxZTJzSGFnakc3V0d1SmgzbHpxWWFrNUFrZDBSVHhHanhzVU5zdVlC?=
 =?utf-8?B?MFBMM1NadFVmZSs2cXJ1cFZlRDlOT0VSQ1VrTFMxZEdEZERpMFFENVNGMDJo?=
 =?utf-8?B?K25Ob1NiZHdmVWJjOEZiUTJhQmdwd3JDRDRRc3F6Zkh0OGdSeWtCMGtHaGxC?=
 =?utf-8?B?WFBmMndRRVVLaDRaYUNmSFM3dmYyamRVMUo0c3dDTzhEZ0JiQ25wQUIxdGRz?=
 =?utf-8?B?Yy85SWNTV3A0bFV5TGEyODVPdWFJK3JCWUh4dmw3MG1rVWhsVXR1OUx0dmE0?=
 =?utf-8?B?ZC8zcXBBdG1ZZW1leWFWMVk0R3pVTUVYNG5YampTZW1yZTVYQzVraEdpZEZ0?=
 =?utf-8?B?T0RYclpHeitSSTNiczlBZGxNZmgwSkJwV3hhYjdmcG8vbVhoNkg1cE4xWVJH?=
 =?utf-8?B?S0Q4VURqNHNEZkpvaGxxZk9rRmxWd2ZQZk5GQ2ZGelYrbG9Qb2ZUdzc2MGsw?=
 =?utf-8?B?aGxMbFhZTGtucFdTYUszNzJqdVJKdTJ5eDc3WElNWlBMaGh6WTdIcjB0Nlgy?=
 =?utf-8?B?dHhQUi9TSWhEMmZ1WlJvTExJa2N6bTNBZkwrZVk4eWIzL0oxZEorNmpWdmg1?=
 =?utf-8?B?K0FGQUp1bFg1WDJwdzJDVlY0UW5PZ0FkckJLdVh3bXRJNHVxMmErU0luQlhJ?=
 =?utf-8?B?M0pJYlBxcitQTkdvYnJ3bld3akE3dFE1T1Zwa2QxTmxZVEdiQmwvbFJBKzVt?=
 =?utf-8?B?elY1N0xDUXRObHRxMXVlNWVSS1A2dmV1ZU1pcFhPNlRRajkyYklxbERoRkZk?=
 =?utf-8?B?NkVYbzQwT1YwVDlpVXBXWisyZUlCbG1PYXRxb25wMGhjSTd2bFo2Q1VSQStY?=
 =?utf-8?B?dXYxMnpoNnBYSTNoWWlZSVJTV2JYRW0xMjNIUHVFOVZHYTVRbDMzK3l1WWly?=
 =?utf-8?B?TDJJM1BENTRKVS9HdDVvNTVkb251UlcxOVZzQUdSaS9GblR3VXpoOEVYVG5V?=
 =?utf-8?B?SW9TUUNZVEg0NEd2U2xNUFVGNk4rSTFsYVNPb1FONlhVOVN6Qkg5V3hVVjN1?=
 =?utf-8?B?ZStwUkoyd203V3J1ZnFtbkNYQjJNODZVbUVJOTB5Q2s3aXBqRjRXalRtZ1pW?=
 =?utf-8?B?L0g3Sk1JSkxiRGdVMktnYVllaU02Z1U4YzBjOHNtWlBGRFJrUEluK0N2THhR?=
 =?utf-8?B?eVNrcG5yeVFnTC80ZFMrQnVoemRJdGh5OTBOT1pzU0hXbmVneDNqcHVCMVY5?=
 =?utf-8?B?V0dPL2IyWHlidGxOVVZpOVk3eHlHTWJhYlIxeUxJRWp6eU91UVI5Zng3ZGR1?=
 =?utf-8?B?elRyQTA4YXFMcHgzTXN6NERZc290cEIzRktBejYyOTRILzlNY3JkYXVDUGVZ?=
 =?utf-8?B?clQvUHRxR244MktCbHZNQkYvSUx0V2hPRUJ3RlVuRWdQMVpyUUxVdng5L0Rk?=
 =?utf-8?B?YnI5M3lLd0ZIRXhZZHlhZ2h4OUJlUHFSMC9sVmpTQjlWZk5qTGxQS3VhckY1?=
 =?utf-8?B?eThMSUc4ZXVHd0NJQXp2bUdHVnVQbnRGRUQwcGZ6eFJuYTRKMHJIYW1tbUo1?=
 =?utf-8?B?UUFickNJR3dId1RWcHYyNlVyN3g3R0NkUk1DNStuamozV0IzcDRBRG4rK25k?=
 =?utf-8?B?eXNXUFg3YmVDV0ZLQWlKZkEyTkVoWjdwaGxlY2t2bzRVWExKTTJNOWtvb2hs?=
 =?utf-8?B?YWk0UTV2VlFWUkNuY3p2bk1rSkZHNXV4VDBiTUsrQnBsZk5wZENKaG1JYlpN?=
 =?utf-8?B?T1R1VCtOclhUM2EzUGRCMnRRQkluREF3K0NxditvT1lNcTRoRDM3WXB6Q2NZ?=
 =?utf-8?B?dDNWdjYwRURXNnN6Y0poYXhOUlIxM2Q5N0xTbGJheVVNeFFDOWNWSzMxMmhT?=
 =?utf-8?B?aG5URGtWa0JpS01EdDYxdERQRkJOVzR4ZHl1SEtLRDdHaTZrMWJkTW9kWlZL?=
 =?utf-8?Q?GlrVNI+Tf5yuq4dseRA8hxYG5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYUPR06MB5876.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3651f50-90bd-4454-7885-08de202471a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2025 06:43:23.0227
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TFuI2HtMS7qtIB6Dor6Jz29UItoduaB60rhMwIb3ULQoIZMq/AKV1xYjbbv4htxFcw70mbkyCaqiU7OFE+YwfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5775
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_224332_390748_A72D62ED 
X-CRM114-Status: GOOD (  22.20  )
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

SGkgUGhpbGlwcDoNCg0KRmlyc3QgdGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzDQoNCj4gLS0tLS3p
gq7ku7bljp/ku7YtLS0tLQ0KPiDlj5Hku7bkuro6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVu
Z3V0cm9uaXguZGU+DQo+IOWPkemAgeaXtumXtDogMjAyNeW5tDEx5pyIN+aXpSAyMToyNQ0KPiDm
lLbku7bkuro6IEdhcnkgWWFuZyA8Z2FyeS55YW5nQGNpeHRlY2guY29tPjsgcm9iaEBrZXJuZWwu
b3JnOw0KPiBrcnprK2R0QGtlcm5lbC5vcmc7IGNvbm9yK2R0QGtlcm5lbC5vcmcNCj4g5oqE6YCB
OiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9y
ZzsNCj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBjaXgta2VybmVsLXVw
c3RyZWFtDQo+IDxjaXgta2VybmVsLXVwc3RyZWFtQGNpeHRlY2guY29tPg0KPiDkuLvpopg6IFJl
OiBbUEFUQ0ggMS8zXSBkdC1iaW5kaW5nczogcmVzZXQ6IGFkZCBza3kxIHJlc2V0IGNvbnRyb2xs
ZXINCj4gDQo+IFtZb3UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20gcC56YWJlbEBwZW5ndXRy
b25peC5kZS4gTGVhcm4gd2h5IHRoaXMgaXMNCj4gaW1wb3J0YW50IGF0IGh0dHBzOi8vYWthLm1z
L0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdDQo+IA0KPiBFWFRFUk5BTCBFTUFJTA0K
PiANCj4gQ0FVVElPTjogU3VzcGljaW91cyBFbWFpbCBmcm9tIHVudXN1YWwgZG9tYWluLg0KPiAN
Cj4gT24gRnIsIDIwMjUtMTEtMDcgYXQgMTE6MzggKzA4MDAsIEdhcnkgWWFuZyB3cm90ZToNCj4g
PiBUaGVyZSBhcmUgdHdvIHJlc2V0IGNvbnRyb2xsZXJzIG9uIENpeCBza3kxIFNvYy4NCj4gPiBP
bmUgaXMgbG9jYXRlZCBpbiBTMCBkb21haW4sIGFuZCB0aGUgb3RoZXIgaXMgbG9jYXRlZCBpbiBT
NSBkb21haW4uDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBHYXJ5IFlhbmcgPGdhcnkueWFuZ0Bj
aXh0ZWNoLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRpbmdzL3Jlc2V0L2NpeCxza3kxLXJz
dC55YW1sICAgICAgICAgIHwgIDQ4ICsrKysrDQo+ID4gIGluY2x1ZGUvZHQtYmluZGluZ3MvcmVz
ZXQvY2l4LHNreTEtcnN0LWZjaC5oICB8ICA0NSArKysrKw0KPiA+ICBpbmNsdWRlL2R0LWJpbmRp
bmdzL3Jlc2V0L2NpeCxza3kxLXJzdC5oICAgICAgfCAxNjcNCj4gKysrKysrKysrKysrKysrKysr
DQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMjYwIGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0DQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jlc2V0L2Np
eCxza3kxLXJzdC55YW1sDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2R0LWJpbmRp
bmdzL3Jlc2V0L2NpeCxza3kxLXJzdC1mY2guaA0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5j
bHVkZS9kdC1iaW5kaW5ncy9yZXNldC9jaXgsc2t5MS1yc3QuaA0KPiA+DQo+ID4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZXNldC9jaXgsc2t5MS1yc3Qu
eWFtbA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jlc2V0L2NpeCxz
a3kxLXJzdC55YW1sDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAw
MDAwMDAuLjcyZGU0ODBiMDY0Yw0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVzZXQvY2l4LHNreTEtcnN0LnlhbWwNCj4gPiBA
QCAtMCwwICsxLDQ4IEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4w
LW9ubHkgT1IgQlNELTItQ2xhdXNlKSAlWUFNTCAxLjINCj4gPiArLS0tDQo+ID4gKyRpZDogaHR0
cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvcmVzZXQvY2l4LHNreTEtcnN0LnlhbWwjDQo+ID4g
KyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0K
PiA+ICsNCj4gPiArdGl0bGU6IENJWCBTa3kxIFJlc2V0IENvbnRyb2xsZXINCj4gPiArDQo+ID4g
K21haW50YWluZXJzOg0KPiA+ICsgIC0gR2FyeSBZYW5nIDxnYXJ5LnlhbmdAY2l4dGVjaC5jb20+
DQo+ID4gKw0KPiA+ICtkZXNjcmlwdGlvbjogfA0KPiA+ICsgIENJWCBTa3kxIHJlc2V0IGNvbnRy
b2xsZXIgY2FuIGJlIHVzZWQgdG8gcmVzZXQgdmFyaW91cyBzZXQgb2YgcGVyaXBoZXJhbHMuDQo+
ID4gKyAgVGhlcmUgYXJlIHR3byByZXNldCBjb250cm9sbGVycywgb25lIGlzIGxvY2F0ZWQgaW4g
UzAgZG9tYWluLCB0aGUNCj4gPiArb3RoZXINCj4gPiArICBpcyBsb2NhdGVkIGluIFM1IGRvbWFp
bi4NCj4gPiArDQo+ID4gKyAgU2VlIGFsc286DQo+ID4gKyAgLSBkdC1iaW5kaW5ncy9yZXNldC9j
aXgsc2t5MS1yc3QuaA0KPiA+ICsNCj4gPiArcHJvcGVydGllczoNCj4gPiArICBjb21wYXRpYmxl
Og0KPiA+ICsgICAgaXRlbXM6DQo+ID4gKyAgICAgIC0gZW51bToNCj4gPiArICAgICAgICAgIC0g
Y2l4LHNreTEtcnN0DQo+ID4gKyAgICAgICAgICAtIGNpeCxza3kxLXJzdC1mY2gNCj4gPiArICAg
ICAgLSBjb25zdDogc3lzY29uDQo+IA0KPiBXaHkgaXMgdGhpcyBzeXNjb24/IElzIHRoZXJlIGFu
eXRoaW5nIGJlc2lkZXMgcmVzZXQgY29udHJvbHMgaW4gdGhlIHJlZ2lzdGVyDQo+IHNwYWNlPw0K
PiANCg0KWWVzLCB0aGVyZSBhcmUgc29tZSBjb250cm9sbGVycyBpbiB0aGUgcmVnaXN0ZXIgc3Bh
Y2UsIGZvciBleGFtcGxlLCBhIGNvbnRyb2xsZXIgdXNlZCB0byBtYW5hZ2VyIHdha2UgdXAgc291
cmNlcy4NCg0KQmVzdCB3aXNoZXMNCkdhcnkNCg0KPiByZWdhcmRzDQo+IFBoaWxpcHANCg==

