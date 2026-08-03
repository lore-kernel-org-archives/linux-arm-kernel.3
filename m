Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C64C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 06:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pmB4l88Ah6hsVV4/wXgszWtm7GkGzhsED0NoXlKrji8=; b=KGHmm9Jj16M4dUb6ZpglnllGVN
	oCoidY1QHoub1JjUmvQLITZtNIxWd7UnrwuEO7SyMePxRrCbJOsVmQ6kPDRm/emRvb1FnX9QrquZG
	J3ElrYdBGk+pzofHw+PpdYRmm+kD9fbvSsAF52iXpUk7SA54ZLB2nqsPdIVKdJj0+rZsl8xWgK1Eb
	4mK80fXCYOkWS4aHbHAZyToYq2uVvTAXKpNWvzEk+3qsq3XgdBFYjbo1z+5Q4V9COWv/z7d45Y6Zy
	y5oljBOYkxm7Ox1bfsobsM0mxNFSq4KQXksiZdBm10TyoM0cgSaSSNW/8d0XO/t8z6z+xvPVSYV2x
	lBGqSG3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqmMi-0000000GSlQ-1AnW;
	Mon, 03 Aug 2026 06:41:36 +0000
Received: from mail-koreacentralazon11023073.outbound.protection.outlook.com ([40.107.44.73] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqmMf-0000000GSl2-1744
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 06:41:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gckHHbTKuybGgz70TS7sFuLKp2Y7b9l8GbA7s3I7iQBxsVWrJtM5EGAO4Mr57UDq01e3Jh8TFdaTQUW5EMDISeCrWJEidQ/fN4ZRgICmkXUIhWfrs+3X/UgisMo5tsNTpgFr2zPpsQMMJwQTg2Cft0Z1XNghHEMHRDaTjIGJILY+gFf3ZsObXq5gdzh5zEO70ntCfBqmwQvKZQelUtkTK9JRK+mlh1JYEMOWYN8BTJfhpGLc+jQGbVzZCbBOHB4SypWfcXWjCvUzh81IwU1HE1bj59XVWeqbQzjMumq9f0P9qPIVUtS0K/2MwNkyZjxT7l1O0Cl5PSS5Y3VfgQKlbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pmB4l88Ah6hsVV4/wXgszWtm7GkGzhsED0NoXlKrji8=;
 b=r+K4elN+Um9UmWsHzDE0CEo2SBAKesWIfxNXQOn1wrOoLkn3kyHI4fDi0vdFGZGKbOhcpbv2AzsA2Q3gtc9/c/rjNQm+7MU8IogrrSpYJfTBBI2IN9/oMhcnkL6duAZ1SCgQNADm/ZUB7pyhRjR08eaRDLZeyxC4ynNTgWIq4knwENUgtR6HSBtLCGh2qa0FHYhmxMlTwd/oHsnzfE8F7bP7CLUAMGGTmpmbtzBKeuvbg4qy/dDbPlsFSJcq9WbsXHw1y8lliDQkFJaq4wmT8JJGri0mR6EuAjjZLY25EH89U8zxi7yhqP3erCQfiDeA/jF+fcnnsHjsBVZv3pHXOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=transsion.com; dmarc=pass action=none
 header.from=transsion.com; dkim=pass header.d=transsion.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=transsion.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmB4l88Ah6hsVV4/wXgszWtm7GkGzhsED0NoXlKrji8=;
 b=Xw82hQVe/F5do+jhoWQ5Qr2Cp4qgsakOj6dz3Irixbu4NFxHOJMpZVMrkrPXIAAx7LRhDDOL7S5ZJY0tf4HT2W2z2zK+K8QFkev1FZ+kZTOUm6c5Wb9BKP3m8cplLM5bAzvtlf/5dEBOFskSf22Sd3PXToCHlfEHsl14hR3Ca78=
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 (2603:1096:820:c7::13) by SI2PPF209B14EFF.apcprd04.prod.outlook.com
 (2603:1096:f:fff6::7c8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.13; Mon, 3 Aug
 2026 06:40:39 +0000
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3]) by KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3%3]) with mapi id 15.21.0292.012; Mon, 3 Aug 2026
 06:40:39 +0000
From: Hongyan Xia <hongyan.xia@transsion.com>
To: Mark Rutland <mark.rutland@arm.com>
CC: Will Deacon <will@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>, Jiazi Li <jiazi.li@transsion.com>,
	Pu Hu <hupu@transsion.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [RFC PATCH 6/9] arm64/kprobes: Make kprobe_fault_handler()
 noinstr
Thread-Topic: [RFC PATCH 6/9] arm64/kprobes: Make kprobe_fault_handler()
 noinstr
Thread-Index: AQHdHcMLnDH+E+QiOkqCwHQFbscIj7aHzvqAgAQbToA=
Date: Mon, 3 Aug 2026 06:40:38 +0000
Message-ID: <500f0d1e-7aa7-4f58-92fa-8abb0ed8876e@transsion.com>
References: <cover.1785153469.git.hongyan.xia@transsion.com>
 <c18bdf933f9712d9c1d5c06a6c07600d8e62746f.1785153469.git.hongyan.xia@transsion.com>
 <amzF2Rfan44rYxI6@J2N7QTR9R3>
In-Reply-To: <amzF2Rfan44rYxI6@J2N7QTR9R3>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=transsion.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0401MB6196:EE_|SI2PPF209B14EFF:EE_
x-ms-office365-filtering-correlation-id: 6612e6f0-4a4e-4dcf-c18d-08def12a2197
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|18002099003|22082099003|11063799006|4143699003|3023799007|38070700021|10067099003|56012099006;
x-microsoft-antispam-message-info: dCp2D09Y+w9XrFRBqf3y2suUkwBExROwk194khahErMqzmp3NwtjEbbMSiNCtNBtrYF0ChvhnqN7ouT9QeWhqvxjtrliqIKkbskY+lCeVpmfk9HVA/H+Nhc2RQukJfviM91JX8ER4iUpN3sQYIDHJM7pHGiznDu7jhhkc2rTq5ajW5abDRFOqz6oWacxA0GWVyZtCrXnn2SfOk/1s18kM5dzlRmstLJ1OQR3AMWQHtiKEZTrZ2BVVYFy43Bjbm5bawvwJBiSq1dYFM+amkTk8HKUvuOi6gB8Qnqonm0v0TUJ+hxQPWSjc8FNoO8HDc63sUC1nkvR2tFFmhLTIjzkouiG53y29I1upSmWmQjfAEobrGdAuoxQT6dvJchMMOMtpnalWQ2mF0nt7DZcE26AhgJWLK28b9PZRvZBZ+HsXuaW7D0kndthL2SFGIsT8BS5n2G1/ZqzrGh/riO5dnGHxhPM5Dz8U9B9sWLd4H7jdOSAiFMFzQaomrrXcEOYVZXkROxvSLESo/RDcZIHjOsok23SoZzE0r2s8x7puAxG7Fnq+r9hrlrEPcOJPpHwovHyMxPLD82B1h3QzFEzS/fgD5uFjeCGux5MNLKOoCH8bAqUIpwqW+SGS2twscWsu3CYJuUShIR8HzlabjAFJCZbIo7jGHNZWvjhMebZ++NqA1r649PY6Heq4mqIBbfa/mzKRORk0QfQS40hTUylw+oHswSj1LSuWKGjGakHFG1l648=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0401MB6196.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(18002099003)(22082099003)(11063799006)(4143699003)(3023799007)(38070700021)(10067099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a0F1R1o5czlNcDFLWUZQOUMwb2V4R01KU0hPRnlzSzRTVDVMbHBPQ29SVy9K?=
 =?utf-8?B?VEkxVDJsR0JpWlUzMlVrSFI4V3BiTTE1OXJXWFUrZE5mc2E2Z3lRK00zM0Nr?=
 =?utf-8?B?ckdtSHBTaU5QeG5tQm9VSWYxTUNUaWMxeUh3OHVyZEsrWTNYMmtDb1MwaHBL?=
 =?utf-8?B?aTIzTkVnTlZXVGFyYVppM1JqZXlESnNxc3hYZGNEaU5mQ1lWRUViOHN3UkpU?=
 =?utf-8?B?WFlzVStXUXRTWGdlMTg4bnJWNzh6QklFWEh1eklsRWZVU2RwSjlpcEhQUlJw?=
 =?utf-8?B?cVNoV1VpdGlCbmJ0MXlneUdWdURCUnhoUGlFNW0raEFSUUdqb3JiYit2VTJJ?=
 =?utf-8?B?MnNrVlZKeEJBNFoyc2w2cDVVaHVtMTY1T3RVc2J6YkRkdSsrcHc1MzhnL0Ev?=
 =?utf-8?B?OFcwdlhGT3BqazdlNkRUcWh0Um1vaUtrT1M3Mmljc0tGbUpTTmx4ZHhTVi9z?=
 =?utf-8?B?bnJETmJoTzNQZjhhRmVwc1ZNcXJHMFdwYTdDbEVUL1lqdVJuZUV1a3lHQWtx?=
 =?utf-8?B?dEhoY0FTeGhYR2R1SGJ0My81bFVCS0tGWCs1Y3RoaFVBTms2Vm1LdWU1c0VS?=
 =?utf-8?B?K2g1RXhVUlVzSjBucnRWQ2FHUmZwQlptS3NGUW0yVmlaZy9WelZObkhHWVE2?=
 =?utf-8?B?QXdPeGxuaFZDQkhlbk5nUEwzWDBKTXV1a0ZPcytEVllBNnRvQ2dqQkxkd0xZ?=
 =?utf-8?B?cVhzRnp6dlpsSXVNdDY1L0RSY2w0WCs3WHdKVDFZUTkvSHBYSVA5YmdIdk5G?=
 =?utf-8?B?eUpzZWE1RmlvaFFBRDgwWXZzcWVwby9VNTUvODZVNGc5Z3hZSGFMVTE0UExZ?=
 =?utf-8?B?VFNOa3RPcFA4eWRxckZEVFd6TWk4MVJqazlvYmFsekpMdGtCamdkL1FpeWhY?=
 =?utf-8?B?MHg5ZXJkRGQxMkxLZXc0RkxBMnFNdjRvTmlzZHlkZEVOZnZJeGttaW9PTlJr?=
 =?utf-8?B?UGJGdTF0blVkK2gwMUlzZW9WalhRdGprdGo4WXozY2drOTA2Zi9HL2VqaVpY?=
 =?utf-8?B?MTN6Nmk1b21NVUlodFhET0IvanZTNStvbEszdWNOMjZxdDUvbWpGOU5SYzgy?=
 =?utf-8?B?R0UrRyt1L2ZZenFFbmo0TVZTeGdRSUZuRXI1cmNUNStjOXJyZUFZSDU5SUJ4?=
 =?utf-8?B?T0x6WUhSaDR2UmZRK25mRGFlMzNGMG40ZEc5cDNzZ29yYWhFT1hOWVlTV1pD?=
 =?utf-8?B?UjExQ2M5UmJyS0lDZHVrRVZ3TTJ5MU1XcmxRM1JlMkd2ZFVSdlpkbUZlUkdO?=
 =?utf-8?B?YXBnZW84c3pzaVZrYWljTk0wcW5DOXlmM0k3SVVYTWtSZ1NrenNaV0t6aTAr?=
 =?utf-8?B?TFhLbzFXbWJCL0VKc0tWYng3bXNUTWc1YkFUWlU0SVQ2WWt2T2tKbm10bDl1?=
 =?utf-8?B?MW04OG90WFp1azVyYy9Edm0xT292N3dBVVY1OXFiUTN6ekp1c0hWY2JtaGhy?=
 =?utf-8?B?OGJiNGJjbHBnNUhxSUJCL0UzWTFhQTVxRnRBT1RZWk5FYUJrU2M2VDVlbThI?=
 =?utf-8?B?U1YyNDViNmRYU3JtYlpNZjZ4UTY3NGpSeXFQWUFrZ1hQTkhNVGJFbVdjdmlL?=
 =?utf-8?B?dDNpOWxrcVRWeG9oM3ROeHhjUEhsQjloOWtRL0tHaGlnUUFMS2daQlhoNkd1?=
 =?utf-8?B?L1VEUDFiZTRCTXNMb2d5eDhabWtTc0NiSHhOeEZVK2p4RXNvd3Z5YytPVTlj?=
 =?utf-8?B?alpNelZFUEFnL2VrSWRFVWgxYTNSSm41RVIxY0FCS3ZSbVo1bER6cTFvT3JK?=
 =?utf-8?B?UnRXRFQvaG9RUFFyVWVod3psSURaU2tSNHhWRzQxSFNXSUtCeloza0pqcTl6?=
 =?utf-8?B?dFRSb3NRYWxVU1N1c1E3dGlmb2Z2SzhnZDY3QUwxM3RBbVpxZDVyUkZwOHQx?=
 =?utf-8?B?Q2h5Q295Tm1icGFzK1RhbzlWUkFDT1dPanRhenVXZVQ1ZFJ4SzN2ZkZZZE96?=
 =?utf-8?B?QkhzUXVSUVo2OXAxcGRrRmdCSDZZMk8zUHBWS2tweXRSbFAxdnZnUmJ3emp2?=
 =?utf-8?B?SWNSemxQVXNEcThDME9wcFBMR1ZWYzVqOTdpNVE4T2dnZVNWV1dNL0w3SmJv?=
 =?utf-8?B?TUt1MGIwNGpBVTQyVWgxV0dqMEEreWQ3M1RUcTJwcjNUM3NrMjNuZWk5ek1m?=
 =?utf-8?B?ZkZSVDlIVlVqMjhabGw4SUhETkYvM3FjbnZ2T0VvTmNXc2VXdFYyNGRWWXBI?=
 =?utf-8?B?eG9VZkNUWlVoUUxlTFQrd0RNWHRYWEY0MTlsSmNiYjViejRyOTB6N08zcUxE?=
 =?utf-8?B?Z2VUY1NIRHJ3MDNXL0srQTQxemJrTjFZLzFIYkluU3ZpUktvWE03Uld4eC9n?=
 =?utf-8?B?ZVVVQ0pMZmRDTWpFZm9ZMWlIaTQwZTRiOWk4WlYzdWlkQ3N6clZaY3I2T01k?=
 =?utf-8?Q?xvIR0LvFYQEXowDE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A74C0E571A4734F9BA42A82991FCDA6@apcprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: transsion.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0401MB6196.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6612e6f0-4a4e-4dcf-c18d-08def12a2197
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 06:40:38.7596
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2e8503a6-2d01-4333-8e36-6ab7c8cd7ae2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qTpOGoCa1VkWT7n0f+CfsJlfCBmgcmj8IeDVkie/UUAYz8LnRwJ9uxJeRD8h5o9USFnnTuVIP5/c1hDHun0mRxuDLNvj9DLlayaEZcsUTgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PPF209B14EFF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_234133_318133_8CE8C27B 
X-CRM114-Status: GOOD (  25.65  )
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

T24gNy8zMS8yMDI2IDExOjU3IFBNLCBNYXJrIFJ1dGxhbmQgd3JvdGU6DQo+IE9uIE1vbiwgSnVs
IDI3LCAyMDI2IGF0IDEyOjI1OjQzUE0gKzAwMDAsIEhvbmd5YW4gWGlhIHdyb3RlOg0KPj4gRnJv
bTogSG9uZ3lhbiBYaWEgPGhvbmd5YW4ueGlhQHRyYW5zc2lvbi5jb20+DQo+Pg0KPj4ga3Byb2Jl
X2ZhdWx0X2hhbmRsZXIoKSBpcyByZWFjaGVkIGZyb20gZG9fcGFnZV9mYXVsdCgpIHdoZW4gYSBm
YXVsdA0KPj4gaGFwcGVucyB3aGlsZSBhIGtwcm9iZSBzaW5nbGUtc3RlcCBpcyBhcm1lZC4gRXZl
cnl0aGluZyBpdCBjYWxscyAodGhlDQo+PiBzYXZlL3Jlc3RvcmUgaGVscGVycywga3Byb2Jlc19y
ZXN0b3JlX2xvY2FsX2lycWZsYWcoKSwNCj4+IHJlc2V0X2N1cnJlbnRfa3Byb2JlKCksIHJlZ2lz
dGVyIGFjY2VzcykgaXMgbm9pbnN0ciBhZnRlciB0aGUgcHJldmlvdXMNCj4+IHBhdGNoLCBhbmQg
YmVpbmcgY2FsbGVkIGZyb20gYW4gaW5zdHJ1bWVudGFibGUgY2FsbGVyIGludG8gYSBub2luc3Ry
DQo+PiBjYWxsZWUgaXMgZmluZS4NCj4gDQo+IEkgdGhpbmsgaXQncyBmaW5lIHRvIG1hcmsgdGhp
cyBhcyBub2luc3RyLg0KPiANCj4gSSBkb24ndCB0aGluayB3ZSBuZWVkIGtwcm9iZV9mYXVsdF9o
YW5kbGVyKCkgaW4gdGhlIGZpcnN0IHBsYWNlIGdpdmVuIHdlDQo+IGRvbid0IHBlcm1pdCBrcHJv
YmVzIHRvIGJlIHBsYWNlZCBvbiBpbnN0cnVjdGlvbnMgd2l0aCBhbiBleHRhYmxlIGVudHJ5Lg0K
PiBBbnkgaW5zdHJ1Y3Rpb24gd2hpY2ggY2FuIGJlIHByb2JsZWQgY2Fubm90IGxlZ2l0aW1hdGVs
eSBjYXVzZSBhIGZhdWx0Lg0KDQpJIHRoaW5rIHNvLCB0b28uIElmIHdlIGNhbm5vdCBhdHRhY2gg
dG8gZXhfdGFibGUgZW50cnkgaW5zdHJ1Y3Rpb25zLCANCnRoZW4gdGhlcmUgaXMgbm8gcG9pbnQg
aW4gaGFuZGxpbmcgYSBwYWdlIGZhdWx0LiBUaGUgb25seSB0aGluZyB3b3J0aCANCmJlaW5nIGlu
IGtwcm9iZV9mYXVsdF9oYW5kbGVyKCkgaXMgcHJvYmFibHkganVzdCBhIEJVRygpLiBPciwgd2Ug
Y291bGQgDQpyZW1vdmUgaXQgZW50aXJlbHkuDQoNCj4gVGhhdCBhbmQga3Byb2Jlc19yZXN0b3Jl
X2xvY2FsX2lycWZsYWcoKSBjYW4ndCBkbyB0aGUgcmlnaHQgdGhpbmcgdy5yLnQNCj4gREFJRiwg
c2luY2UgaXQgb25seSBmaWRkbGVzIHdpdGggdGhlIHZhbHVlIGluIHRoZSBwdF9yZWdzLCBhbmQg
ZG9lc24ndA0KPiB0b3VjaCB0aGUgbGl2ZSBpbmhlcml0ZWQgREFJRiB2YWx1ZS4gSWYgd2UgbmVl
ZCB0byBmaWRkbGUgd2l0aCB0aGUgbGl2ZQ0KPiBEQUlGIHZhbHVlLCB3ZSBtdXN0IGRvIHRoYXQg
bXVjaCBlYXJsaWVyIGluIHRoZSBlbnRyeS1jb21tb24gY29kZS4NCg0KVGhpcyBzaG91bGQgYmUg
ZmluZS4gSXQgbWFuaXB1bGF0ZXMgREFJRiBpbiB0aGUgcHJldmlvdXMgZmF1bHQsIG5vdCB0aGUg
DQpsaXZlIG9uZSwgYW5kIHRoZSB2YWx1ZSB3aWxsIGJlIHBpY2tlZCB1cCBjb3JyZWN0bHkgb24g
RVJFVC4gDQprcHJvYmVzX3tzYXZlL3Jlc3RvcmV9X2xvY2FsX2lycWZsYWcoKSBkb2Vzbid0IGNo
YW5nZSBhbnl0aGluZyBpbiB0aGUgDQpjdXJyZW50IGV4Y2VwdGlvbiwgdW5saWtlIGxvY2FsX2ly
cV9zYXZlKCkuDQoNClVubGVzcyB5b3UgbWVhbiBzb21ldGhpbmcgZWxzZT8NCg0KPiBNYXJrLg0K
PiANCj4+IFNpZ25lZC1vZmYtYnk6IEhvbmd5YW4gWGlhIDxob25neWFuLnhpYUB0cmFuc3Npb24u
Y29tPg0KPj4gLS0tDQo+PiAgIGFyY2gvYXJtNjQva2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMgfCAy
ICstDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0K
Pj4NCj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jIGIv
YXJjaC9hcm02NC9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYw0KPj4gaW5kZXggZTlmYTY2ZmE0MjE3
Li40MTcyOTk4ZDQ4ZDkgMTAwNjQ0DQo+PiAtLS0gYS9hcmNoL2FybTY0L2tlcm5lbC9wcm9iZXMv
a3Byb2Jlcy5jDQo+PiArKysgYi9hcmNoL2FybTY0L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jDQo+
PiBAQCAtMzEwLDcgKzMxMCw3IEBAIHBvc3Rfa3Byb2JlX2hhbmRsZXIoc3RydWN0IGtwcm9iZSAq
Y3VyLCBzdHJ1Y3Qga3Byb2JlX2N0bGJsayAqa2NiLCBzdHJ1Y3QgcHRfcmVnDQo+PiAgICAgICAg
cmVzZXRfY3VycmVudF9rcHJvYmUoKTsNCj4+ICAgfQ0KPj4NCj4+IC1pbnQgX19rcHJvYmVzIGtw
cm9iZV9mYXVsdF9oYW5kbGVyKHN0cnVjdCBwdF9yZWdzICpyZWdzLCB1bnNpZ25lZCBpbnQgZnNy
KQ0KPj4gK2ludCBub2luc3RyIGtwcm9iZV9mYXVsdF9oYW5kbGVyKHN0cnVjdCBwdF9yZWdzICpy
ZWdzLCB1bnNpZ25lZCBpbnQgZnNyKQ0KPj4gICB7DQo+PiAgICAgICAgc3RydWN0IGtwcm9iZSAq
Y3VyID0ga3Byb2JlX3J1bm5pbmcoKTsNCj4+ICAgICAgICBzdHJ1Y3Qga3Byb2JlX2N0bGJsayAq
a2NiID0gZ2V0X2twcm9iZV9jdGxibGsoKTsNCj4+IC0tDQo+PiAyLjQ3LjMNCj4+DQoNCg==

