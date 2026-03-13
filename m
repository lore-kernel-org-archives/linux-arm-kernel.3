Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AAD5106FD9D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 08:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gMWg3F5EEKBPmmpuEvb/JbjJMebxNu3Bx5SW/Yrh5V0=; b=UcAtgw0Zlq+APO4ksnfJ6qfpr0
	u70uw1v+rbPOjXHZncv9D/M7/XFnsDwIO4d6Zlv53vzLtz+p78uM7suBq5CVOdA2BNaVRh1YvQx3W
	8gaJdH7jaNsH8DH6XSHAatBzcMMXkCOslZPXQOmuLMdKqSNbUhhqAw73uOboIaS+jmKOSlqVY/MY4
	dAs88qMWlmsj7F7WWQQtd7SmxXX5gqs2g8ocrUm010i3YxbW++Q+l8Li5CuZfS0/yT8guogrn/6PL
	JkpKYetxLuJ/Qhu580j9KmHaAvXxYoVzpGTmewSQUGhfL+oDkMpphlZTgZUcU7LetRBlIEs67l/M4
	dz03K5JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xzb-0000000HHML-1vhB;
	Fri, 13 Mar 2026 08:35:38 +0000
Received: from mail-japaneastazon11022082.outbound.protection.outlook.com ([52.101.126.82] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xzY-0000000HHLy-2lpf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 08:35:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=coprM28oc0lm0768lFLpmyAO8DK278wOQt+HFIELxrAgq/XrUXPGpq2uupIdyMfatMhx7y54EzY/Q1a3Spfmqw9125uXy5pYhlkiw7FwaIlbTp+wT/UnB9Rtdi9v2znpSzQkccyawiW2qOWlmYu73vhyHaV06c3wsttYTSrw41Bfxr1di8EJplrC5GTU1jcMbSPNQX7U5Uwc5tx9UCjpktovGBxN1TWWe8OODm+bNnEata0U55nshd6od3MANnosFuU519fkifQAYrj3z6ao1GX8VNVIKmudM9h7Qh7rU9OZgP/zbLGfCAAsH1aZb2HIKPEOBEwxUiZj5TBmjeLDRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMWg3F5EEKBPmmpuEvb/JbjJMebxNu3Bx5SW/Yrh5V0=;
 b=EV9rjtAKTOLMazH8b4LIAYzgs7dRaf7ZSEhyUPQW9JIi2FIxsUBUo6tgZhl/MiR3vFYh8JHlnOUIcK6iaG0HQK6gXtN1HZ/Q2Vfj0iXfweBbjInfWUh2mwXH9DR4Wqt4aaSwpyRlIBpqK68SSxQqKA6KIcEk6pQMpfblapfo1t9/IRgSJrO5lRPw+SEFshniuOM778sXawrcV7GXGQ1xVSI1B3TRo+seoJHAWpNJZsy9Nxnqk1/QIly36sWUjbA4SWwbXejo4biXzP7ge6RcC6iILXHVBL3Zp0+TjrytFHvA3M5uDHrBZrxEsATYdvMnReiBxR/hBLCQaOAmhZV1tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMWg3F5EEKBPmmpuEvb/JbjJMebxNu3Bx5SW/Yrh5V0=;
 b=WZMkz6JEGSSUDTdCMW1/+OMBPvWZiTGzSaSUCaWGvIZ23w+xAop/3N+KqE9IfJXjj5o5mfa/xcVw+wfw1vzmxVaxgQnkP56zhuSrwLpJK9orXj2QmDtw+46MW/rp7Sx8GQwhgLWsll2CB3pyUq3rU/cp+Cbd+rNdUuk4TBsgWYLVlz2uRReSFKA9sZJk9GGCJ8O2TfkLvWfbZgUVKDHUoBgy0EM4FN3J9vSCtT7ohMr9pkcc5a5wJPPCX22tS7BXqItCpuXF20bk5K5TmpGeGCqslMOx638/CtYwJnrPuxu7MAWShe3WktRi/6rhyTakmGfOu7kglQXgRI0SvjP1tQ==
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com (2603:1096:408::791)
 by TY1PPF492B3076A.apcprd06.prod.outlook.com (2603:1096:408::90f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Fri, 13 Mar
 2026 08:35:24 +0000
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::8c70:cb01:78fb:d9c0]) by TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::8c70:cb01:78fb:d9c0%6]) with mapi id 15.20.9678.024; Fri, 13 Mar 2026
 08:35:23 +0000
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
Thread-Index: AQHcsqoqa/wkH2eIMUucFBg3jcknirWsIJ8AgAAB8kA=
Date: Fri, 13 Mar 2026 08:35:23 +0000
Message-ID: <TY2PPF5CB9A1BE6C2F2EFFA36CD917C623CF245A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20260313-sdhci-v1-0-91cea19c8a67@aspeedtech.com>
	 <20260313-sdhci-v1-2-91cea19c8a67@aspeedtech.com>
 <352a522b5325e9db80c880dd7a3a052516f3b673.camel@pengutronix.de>
In-Reply-To: <352a522b5325e9db80c880dd7a3a052516f3b673.camel@pengutronix.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PPF5CB9A1BE6:EE_|TY1PPF492B3076A:EE_
x-ms-office365-filtering-correlation-id: 0ff19f7f-7860-45ef-4eb7-08de80db7862
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|18002099003|22082099003|56012099003|38070700021;
x-microsoft-antispam-message-info: mdeeNGye0mTqwVej5mxgYHRLKZUDRp7GFPw2BUfV9+2dJM7XDekqT3r0ZA8kIr4tIXdtPLRzQBT4CVRwTY1MyqUqKZkUwxTXIF7ywVL3/W1Vm6PHAtlf6mW2sanUZCctDS56pT4oN4gLmrrw3avDyDEMIl289vyt0dpMh3/oS4YegtMHkr3GbAyAN3rvdvrkCaysOb6oZllunknowd2ViH42Zvrnsm6yehJz4VYxS4RzsVXfZ6jO7OgrN62NwbC0RglwGUzDipiuJgK57LglIXKSGgAqBoGX+CX63OROC8i+rq84zsYk2sSLHcw08d8UBE/4LolD/nYXFbITNgDITAdCTkQxN338195MHr3BdqoPz4w12vMVchgDei5TD10nKwzjh8BH804wl5LmxwFexAwqmoelYNEoEaIV9Gu9/JzdBB5b2zEiJSY29ooCnbNDI6a5p4K1fub6miLSesVbFfa1+/FPuTzNos90bihnRNhIA1m7LDgYN7bfe7UD7kNnnnpzv2dxEyOXzr+Q1Yn4uTHCj41Y2eA8PgWmpe3AcO+jo0oCz1QofM8hF1awU7kCZIcjBVzC7V6XOGTU99aTEE5A3iIlE7aK+QsO5r/i6/xYPSgpHIwTOtDU+boVXbCPFgoWQ/tDJtjLoMCXyVz2OQaFvfG/q5ZHAUbGhQcJk0N+mzJ7qIopBM9fuZCk8tI9WpM0GI538iQG/tCmyoaPsc+LDbOe4AK8+1B51j1ssDFs21QEjUKC2/E4VkZMprlLysxzjW2SnzhrJ9BJcHqU3qlqQpe9zpCMEYauw0AblkY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(18002099003)(22082099003)(56012099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dk82S2RZdnk5MlM3eFNCdmNqL3NyZStqZFhDaXdRVTkyd2RLVDU1cnI0VlVm?=
 =?utf-8?B?cDVaVjh6M1hPUFFleFJGWkJmMzFoNGZyQzExRkc3RTJhTFlwQm1RZEJTUnhr?=
 =?utf-8?B?UTJuY2gwUU1qVm56RG94NWk4bnhRK2pZL0NROWpCRkZwOTlEbkgrWWR0ajlS?=
 =?utf-8?B?SFlsbkZjVWh0MElKdEU1andYWWZWZWxWUHFrZ2dCblVIbHRrdGZqNGRQYXV5?=
 =?utf-8?B?VVdIeWxScE9LY054M05KSHpQc3Z5SW9qd29mYXZscTNmNWsxSXpSQjFLZ0x5?=
 =?utf-8?B?Tm13d1ZOOWsrU2xwZ3pIMGhwRXl2NW9USzY3VTJBS1lxeDVIZHNJRUhoM1Iy?=
 =?utf-8?B?ZWFzTURYRC9SRGwwMVpqdkY0Vk9Va2Z4K3M5SFFvRmt2VitneUZHT2RHQjdr?=
 =?utf-8?B?dndiU3N2STd1emFWTDdoNWFoT0ZjTkJ4M3kyL2Y3YlM1ekEyQXhHSzI0VEFr?=
 =?utf-8?B?OXlQR1Jsa29teXRuK2VvVzM2QnhLYURmd281L1FybTlROW82d0N5MXgzVHdj?=
 =?utf-8?B?WTNkdWZNUkxjVGViVC94cDJ4azcvdkhmbjZTN3hpWW5oSVpzL0k3UmtXQnR6?=
 =?utf-8?B?ZU1YcU03KzZoTzhBaU1UTWtMcUdOSFg2V1ozVWdLSHVFR0RHeTdpUVM1Nkox?=
 =?utf-8?B?dDJQV01pQ1pPU3RlSTRkaEptaGtHbkdrV0VmZGM5VXc4UmNPdTNiY2V4dVRM?=
 =?utf-8?B?ZGNnNzZ6cGxobHkyOFl1UHJVMGFVNHpDd0pxTEdia2k4d3I0RkRhYXZGUE1u?=
 =?utf-8?B?RVhLTGIwUlAvcVZDQUFkY3NwRlZWcjNLMUhYbVBWVW9CcTRjN2hHY2Q5OWFE?=
 =?utf-8?B?YjBKbG5PdzR4V2Z5QW5Cd1NvK1lVaDlSdkhUR0lUdExhS21RZFliL3gyM2M5?=
 =?utf-8?B?cTlPUkhyZUNvVlZqQ2ZubjE3bEg2QXM3K1hiajhGcUlzVDV0Z1YrVXA3U2Yv?=
 =?utf-8?B?ekhrT1QzSGFUUk85WkNma2pqbTdRZWI5K1dYN01iL1duNGVZQ1hBQ3cxaHBR?=
 =?utf-8?B?RHN5bFViRGh2UU80blJsS3BZaVNtZDkvd2JneDFnVTA2Vk1mRW44bE1FV1Vm?=
 =?utf-8?B?a2QvUUJWTHlTc1RFY21RejRIbGdZWTVzaXJxdTFsZ1JDT3JOS3dZb2M5THNt?=
 =?utf-8?B?WDZPMVZNNkE3VTljVlpkTVZ3eEU1VWlNS1NHMVVKMnZaU3BJeUtGU2RCUW5J?=
 =?utf-8?B?eGtkV2tnY2hvTGV1ajRrd2VoZXc5UURiSUtmUlRCRzlJdmJRQU13ZDVpU3Vr?=
 =?utf-8?B?SkhweThOSDBsQ3MzMnVsWVhTVDhIWGJDenhTZ0xWeFY3cktuU1kyUDJxRDM2?=
 =?utf-8?B?b2pvdGhOUjVWdEhNcGYzTE9EQkxuaUVmWFlVZVVVQmRXdi9QRS9iRE4veml0?=
 =?utf-8?B?R1hxZW9XV1NlSm82c1BDZFJkY1l5Q0N5bXpqMnhiYXFZNlh0aDdCWDRsSXRo?=
 =?utf-8?B?NlBUYkNKVTVqcGlZaU9lbHV3SjhrblhQNzhNU09qQlkyRy90THh0TTlDOEp6?=
 =?utf-8?B?TmZXRGpocnRkYWpOVkMxRWJVQlpXRzEvTEFHM2pTZzhDVmI3NWVlSDZmMTF1?=
 =?utf-8?B?cFE3OXROVGhWbmJsOWlRdm81aXl1VmlPMFQ0dDFCWTNkMERHVVpFRzVNMXA0?=
 =?utf-8?B?WncxanV0ekMwQzZxTzZTbzF3Y1BYVXhrZzR5OEdzL2REUlBWRVVMV3FQSXNX?=
 =?utf-8?B?Y2ZMT3RDWkVqY1hVd3ZPWFNDekdKWDFzNURoWmVBYlNQYmpERTRSUEd4OHEy?=
 =?utf-8?B?ZG5zYnV1ZzkydExpQXhBemxNQ1ZYY3E0MHY0NGZoa3lnZXQ3Ylduazg0NE8x?=
 =?utf-8?B?cXBzTDRNTXBQTUxUZnpmWFVJclZ1SnhHakVPNTdTOVdDNExJYXN5RmRPWnRS?=
 =?utf-8?B?ckF4M2ZsVTVOYlNEbHlydk9SUU1mSkt0bW5TVUVOVk9QdTlSRkd4cVJ2ZE9E?=
 =?utf-8?B?T2plNWN4eDlRLyt0b1NVclVWeFlidktnZjNvYVluU2tROVArdzgveXZwb1dm?=
 =?utf-8?B?eGZrYVhOM1JjSFNtWURTMUd3NzRFZmZCUitVWjEwdFJqTmtPU2dvSENnMW1Z?=
 =?utf-8?B?TkkxNm9tRTVVb2MzQ1BJbW9YSDFKdzJlUHNSK1hRK0tzWElhSXZxNzNJcFp4?=
 =?utf-8?B?NXUya0Zma1FBUis0QUhZaWJRd09GYUVzMkpKNlR6ZW5najRRZHYxcjc1akZs?=
 =?utf-8?B?dllOZElUWUcyMzNRMkJacTZZSVFabGRhcWsxZmdDY095LzdzNm11TkNpbkRu?=
 =?utf-8?B?cmFwVjAvUHBFK0hHdVNOVTJtcmpNenhpOE9tY1Vjcm5tbWtLdEJPRmt0NFhS?=
 =?utf-8?B?Z2RKRDh3bUQ1Ym9qLzJlL0NTaVhwS1ZqOW5IK3dvN3JyRkg5ZEdRZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: cfWONp2+Ga/VSrTrmus2UnAdrDK/ahoyw/Wuj/R7VmrpDlOqEIdvumuumnhB4BHW3rCsGogKrvDLw3flqkDb6x8hij/O82w+O1hj6JyfmZ5FWxmZkHs7XckxM4XYeA9xeTUygs21NAcKi7kENh5Fqs3e4RxGQwJxhoexy6LVHsce0cnAInzIiQae3sDSpJEQF0N/FFRtFbGDEIoPGPfwNf5ZR7UHlTOvGFuVopQUGh2TkPRhSPO9Jz1OaTSI7pLB+jCrlRlSNPKk4w9xDI+AvrlPZJ4y/Mlg9J48C4YaiIZNlEdgVwa7fugFlkhnvfWjpolAwbCYIzk98dJMjquU2g==
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff19f7f-7860-45ef-4eb7-08de80db7862
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2026 08:35:23.8890
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hnjfT/BJwOYxmC/aNDlxAb1tWlaPAsbZVWi7ifOZAOlANriXuWPK3sjz5xutuOqlc+4OQ+xJYi75sIaNuTwPnGAaXiYaYzduVK8g4DrIM5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF492B3076A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_013532_698936_272533D3 
X-CRM114-Status: GOOD (  20.32  )
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
NzAwIHN1cHBvcnQNCj4gDQo+IE9uIEZyLCAyMDI2LTAzLTEzIGF0IDEzOjI3ICswODAwLCBSeWFu
IENoZW4gd3JvdGU6DQo+ID4gQWRkIHN1cHBvcnQgZm9yIHRoZSBBU1QyNzAwIFNPQyBpbiB0aGUg
c2QgY29udHJvbGxlciBkcml2ZXIuIEFTVDI3MDANCj4gPiBzZCBjb250cm9sbGVyIHJlcXVpcmVz
IGFuIHJlc2V0IGxpbmUsIHNvIGhvb2sgdXAgdGhlIG9wdGlvbmFsIHJlc2V0DQo+ID4gY29udHJv
bCBhbmQgZGVhc3NlcnQgaXQgZHVyaW5nIHByb2JlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
UnlhbiBDaGVuIDxyeWFuX2NoZW5AYXNwZWVkdGVjaC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZl
cnMvbW1jL2hvc3Qvc2RoY2ktb2YtYXNwZWVkLmMgfCAxMSArKysrKysrKysrKw0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbW1jL2hvc3Qvc2RoY2ktb2YtYXNwZWVkLmMNCj4gPiBiL2RyaXZlcnMvbW1jL2hvc3Qvc2Ro
Y2ktb2YtYXNwZWVkLmMNCj4gPiBpbmRleCBjYTk3YjAxOTk2YjEuLjkxYzM2MjQ1ZTUwNiAxMDA2
NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLWFzcGVlZC5jDQo+ID4gKysr
IGIvZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1vZi1hc3BlZWQuYw0KPiA+IEBAIC01MjAsNiArNTIw
LDcgQEAgc3RhdGljIGludCBhc3BlZWRfc2RjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UN
Cj4gPiAqcGRldikNCj4gPg0KPiA+ICB7DQo+ID4gIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKnBhcmVu
dCwgKmNoaWxkOw0KPiA+ICsJc3RydWN0IHJlc2V0X2NvbnRyb2wgKnJlc2V0Ow0KPiA+ICAJc3Ry
dWN0IGFzcGVlZF9zZGMgKnNkYzsNCj4gPiAgCWludCByZXQ7DQo+ID4NCj4gPiBAQCAtNTI5LDYg
KzUzMCwxNSBAQCBzdGF0aWMgaW50IGFzcGVlZF9zZGNfcHJvYmUoc3RydWN0DQo+ID4gcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQ0KPiA+DQo+ID4gIAlzcGluX2xvY2tfaW5pdCgmc2RjLT5sb2NrKTsN
Cj4gPg0KPiA+ICsJcmVzZXQgPSByZXNldF9jb250cm9sX2dldF9vcHRpb25hbF9leGNsdXNpdmUo
JnBkZXYtPmRldiwgTlVMTCk7DQo+IA0KPiBUaGlzIGlzIG1pc3NpbmcgYSByZXNldF9jb250cm9s
X3B1dCgpIGluIGFzcGVlZF9zZGNfcmVtb3ZlKCkuIE9yIHVzZQ0KPiBkZXZtX3Jlc2V0X2NvbnRy
b2xfZ2V0X29wdGlvbmFsX2V4Y2x1c2l2ZSgpLg0KPiANCj4gSXMgaXQgb2sgdG8gYXNzZXJ0IHRo
aXMgcmVzZXQgY29udHJvbCBpbiBfcmVtb3ZlKCk/IElmIHNvLCB5b3UgY291bGQgdXNlDQo+IGRl
dm1fcmVzZXRfY29udHJvbF9nZXRfb3B0aW9uYWxfZXhjbHVzaXZlX2RlYXNzZXJ0ZWQoKS4NCj4g
DQpUaGFua3MgdGhlIGd1aWRhbmNlLg0KSSB3aWxsIHVwZGF0ZSB1c2UNCnNkYy0+cnN0ID0gZGV2
bV9yZXNldF9jb250cm9sX2dldF9vcHRpb25hbF9leGNsdXNpdmUoJnBkZXYtPmRldiwgTlVMTCk7
DQppZiAoSVNfRVJSKHNkYy0+cnN0KSkNCglyZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2
LCBQVFJfRVJSKHNkYy0+cnN0KSwNCgkJCSAgICAgInVuYWJsZSB0byBhY3F1aXJlIHJlc2V0XG4i
KTsNCg0KUnlhbg0K

