Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082DC106FD60
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 01:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=maJp5b6SCmboZuSBDGXwFIAF2kE51SGwpSO+ttB/dC4=; b=qMxHZGLdhCzDOClxQjU/bOv0ar
	zsNXMBn4QMxAfkOafuZzQ9Axx0S8v/gYZQeQzThLgimfNA/4UxcFdmnVncH0S634w9jcwRginsdK9
	1ZYBXoiiuY6q7NgeKmpWPnQX2GC1MTCS2Z5ehTRlm+Dt7g3sbcu31VhUiyovDpzQxvcNJ5GgUACQW
	O4GWmCE8eg2uRBOSIXfMwomMe8s5NbLKGyU0458Mv5k7rpgGCnbCU2evSvwBHHtyqLZ4t5UyIC53J
	iE0i0/Rf0L3Sc78ZZhUn3qLgmwWb2GlbTr0OP/2fT2VwHVlPFjnByq+jPQglVEBQS9BFnu351iZk8
	krArRHQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0rf4-0000000G7Uf-44KH;
	Fri, 13 Mar 2026 01:49:58 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0rf2-0000000G7Ti-1EF3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 01:49:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UMnO2x4U5xVsjtlUtNp75TnTASAhuV+BiBXiJ4fP4xZysib5aPxo9RPOUBAsdaocdvc32pc/1zx20AqR/uu99MlhUC4Wod3bSuIDUCRFkkmLmcLMv5ZPrCf1AmCusswJnSkNCOc4Qjf6s519jvUKuy9TeocwzNxkDI+pHe86X9JFn8co9v4tWhQ504zquQGYADgaxoONZZN7LaalzXaVZ7a1hWFRpUtW/T4w3TBsvUjuLhP3XjwamiBtf+N/HalE7oHUO3Da8t/n6sheV+uG6PVPbc7YJdHwtqAH9egX9eikzu/g0dM8V6vcJ2h7g3YGW7Squ4Ractb1EN24yB4MYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=maJp5b6SCmboZuSBDGXwFIAF2kE51SGwpSO+ttB/dC4=;
 b=r2ldx81JQSyDQrX6LQsZfzZFHt1HxaxhkidvFZSL9TszJJZfSJkzPg9S0nx7kp0mve02RPdA/uwt9aQiBoDvYFPmMZJ4wYU33UYu3rHWuXcKMCT/OzZU1Xr7eWY8jCL1qndiW21gZ9ZbdxqNHLBnzSnWD7mA64Z2jzWdSP6JztRaq24EM9ZreRTGzeBRuKh39DhilnESori0VyixYvgJMTOfoI9xzkunDaQzgjDqjoV2EzoChza6tBJKZksdNSuPB1Ut2VKLKdOLZpHBCRQlExl7sqv9Y2u6qCgv2/hMlD6nxvUL4NQLENc70nEEpORcR3mjX7cMfahfnHL/IGmoQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=maJp5b6SCmboZuSBDGXwFIAF2kE51SGwpSO+ttB/dC4=;
 b=MwB3FOqhCkI7ru4lTdUXZuqA2Xi24Csr3xLrgtL1gHUYHU4G4096W+u+L5uVeOZQVhUJ4JKpkQ6PthQOb8jJIja0fOlpjL9NAh5S0CGjnUXT4RC3q81JdPq76AJ85aGFa0Ydo0aRDQ1E5hQKNYcKPl8n9Dp3f3xlrJ2Xykyi54pa/KviiPuX9siH+S0xbrGg8ZiBQRms2WPFnqaNLbBETbePaf2FD1jG0Ri2Ed5qMpKDm54t0LTipw+Zj2i0gBJBNhGpfWvTF2MMtA1Rya5i9KuL2jnMr+S3hVDplhX2BoPv+ra68KeNpRlXsWjMJYBF1SMd9XcWYEnA/7yc0HG/2g==
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by PAXPR04MB8735.eurprd04.prod.outlook.com (2603:10a6:102:21f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Fri, 13 Mar
 2026 01:49:44 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%3]) with mapi id 15.20.9700.015; Fri, 13 Mar 2026
 01:49:44 +0000
From: Hongxing Zhu <hongxing.zhu@nxp.com>
To: Rob Herring <robh@kernel.org>
CC: "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, Frank Li
	<frank.li@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kwilczynski@kernel.org"
	<kwilczynski@kernel.org>, "mani@kernel.org" <mani@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 2/5] dt-bindings: PCI: imx6q-pcie: Add i.MX94 and
 i.MX943 PCIe compatible strings
Thread-Topic: [PATCH v5 2/5] dt-bindings: PCI: imx6q-pcie: Add i.MX94 and
 i.MX943 PCIe compatible strings
Thread-Index: AQHcsgJTKNEJJEpTmkq32cipnoVJNLWq5TSAgACx5wA=
Date: Fri, 13 Mar 2026 01:49:44 +0000
Message-ID: <AS8PR04MB883326B2CE4C86837DD8195F8C45A@AS8PR04MB8833.eurprd04.prod.outlook.com>
References: <20260312092745.295578-1-hongxing.zhu@nxp.com>
 <20260312092745.295578-3-hongxing.zhu@nxp.com>
 <20260312133203.GA2768492-robh@kernel.org>
In-Reply-To: <20260312133203.GA2768492-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8833:EE_|PAXPR04MB8735:EE_
x-ms-office365-filtering-correlation-id: 3593fafc-59f7-4b7d-5482-08de80a2ccc1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|19092799006|366016|7416014|1800799024|376014|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: qIcS2vgfK9qi1afVLX5Fc5NLWy/nOgNTQIANwWHDjmA4Pdfm2SLq9W6bYYFutL5n7ExukcOvKNuZB7DxbCZyIz7K6/JZ/4Svf08PplLsY7yUQXOV2YQZr1TFhEUGL0l93Eo68GlSonGpuVciK/nAfHoYX4Q7aFt24366bNqVU3ddiakbHOtWDcS9VETsM1O7m2TK14m+hY9y3eGzkOGui+UyqXdcdBph/zYO/rhYt0hI1fVyw30D11zQTZGHx94+DV4FFIqtWL4ZSOlyN1+1/cwRoEniSQqgmATh3V0BFgPtrcVFjYPu/zVs4oN5tO1wZEYCQGIso5Qmfn0qczCPzd3Y+2A1nK2uk5v0D0MKzpkNLerkt4fyqqk7516PpNPqbIE7F0hCR9PflMNglnagSeKQFe/MJpy8lCD1V/fjdQ5rfde1P34p4COtT0HLM3qDMXkIbsADFEogvqti4izdxufArlThnrComknQ96Y0ERplf0vOWFAwu1rMlkf9OIwhYc09XZein3bFjhz4+YFU5UkrBgqqQsRNJiSOEW+hianxBLJu4GjVvaJNlh9EvmAMA2q/g/+GJU3wdy7oT4L9ZczD50B+2w9jSS6QWiMiBiwEiB0HLcMJnxlX5kLYZF6sACUNdVkDB0hnzT7ozZjHICYwYCH36dxtFkMc/WqR/0XsN+My7A3Rm+YF2zxKhY27cZlHt2wb3JZt/yfY3473yvF9qBmxdek6EyZA0gxz9SBPF3tllV1tiS0OS6mBZ49K4z6D1ENmJgYBN1UW8OeOOwWRKh0jOYJuh9kc9gIk6CI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(1800799024)(376014)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?NXlqT0VnZjhTb2xJb0dzSVhoaGJnMzhsV3hoNHYzTzdpSFI0bFJhdHlNNFFh?=
 =?gb2312?B?cS8ydjVJbk1FeDhUNjJteXV5bk9QWE0zWU1IMnZmS1BYWWVlTjlMaE9PUGFO?=
 =?gb2312?B?MXFpUGJ6QWFpTFo5UHNERWt0ODZSMnVZblhqKzBvUkJ5THZoUXRMZGZCbnZC?=
 =?gb2312?B?S254RzE2RFpPSUhPK3ZvS0Eyczk5SFZKM3orNE5LT2gyOEI3ZXNOQmhYV0pC?=
 =?gb2312?B?ampjazNlQnBGN2NlMW5NMUxBQzJ6ZzNOcGYxRzdrb0hFOXNGTkI0NVlwWHla?=
 =?gb2312?B?NzFKeG15UTRzWVZzdXFPdGxjWkEzdXluOWpueEpBcmVDS1hCOHBMVHRMQW94?=
 =?gb2312?B?RCt0Qk1uVnVYcm95amlMTEJjRnpSQ0lEYVhWc2NaK01kUng5S0lSWXplU1Fs?=
 =?gb2312?B?bmNJMGFvRFRzaDZYUm1udzVuZDMyY1V6dkpCY0laQWkrcVFGdktlR0ZFT2k3?=
 =?gb2312?B?aVJESE9sbTUrVURUb3BFZDgzMWVmRlh6MGFGMmlnc0Q2U3JYS1dtM2swMmww?=
 =?gb2312?B?a0p5MmhDTWc1UzJpM1p3Rzl3YkdObUcxMlBNb0RtRW5Jdy9laGF5Rkk3Q2F3?=
 =?gb2312?B?eEFYZm93M0Z2QlVxeHNrR214bHU1alVJekllZVROcnFMcFF2S2RWVEhPdjNw?=
 =?gb2312?B?dWFzVDVzczJUSEdqbi8vNnBHKzVZampOblowZ2RTV09IenFEOGlpTjdwOVdq?=
 =?gb2312?B?UEx5Y0lJWFIrTnNRb2xtWEt1M2lzV0cyQWdybEVteUx4eUIrY3d5Qk5nQTJt?=
 =?gb2312?B?QXRtMk44c2VrcXgwcGNyRTRWcndiaHNGR2VYK0tVclJRTFFJakZTNFhGb21N?=
 =?gb2312?B?dE1oMFI4ZDk0RE9KQkZCeXUxb1FVa1pGRVhqdVlGczZBVlBLOXhmSWU0ajJL?=
 =?gb2312?B?MzloTHBTLzBqN2dmMXAwK2dNWk95VkNVUmNpYkRiYTVBYWFQS3dNa0FBcHBN?=
 =?gb2312?B?SmhMaDk2bG42bWpuYUxiN3E5S1ZyLzgvN3JhSEhoSE9PcG80TTRNSzZJR01a?=
 =?gb2312?B?dFZyQ2JJMjBKVTZpWDZPZVExc0tWa1YzL2M0ZDZPWldEY0d5cGdrTzdmTjlr?=
 =?gb2312?B?QTB0T1A1ellyYjkxU1BqaERPYm9TY1o1dk5semRTeExYeVhZRXZkK2lVbGNY?=
 =?gb2312?B?WDFuNEMyRUdzdTBOTjgxOWdvcVQxbkZ4SFVOVzVSV1lzU0tCZEJhR2M4eS8x?=
 =?gb2312?B?d3NzTjZ6N2NyZ0Fhc2VQc0dxMjQyK3IwaDduQ0NhemtUeCtaU1lLUE9GWkRx?=
 =?gb2312?B?L3VHTFVYTktkK0ZJaCtYSzA0M1hPRVk1OFYvWVlDQUFkUjd0YzVpQ1hLNkRI?=
 =?gb2312?B?T3lOYUtTdkJPTVltODBqblBzVTFxUnBtTkh4ZjBnaFFVcE5kR212VUZQTk04?=
 =?gb2312?B?M3pUVTJySm0va0FwMStnSjB6M3VHK1paMVM3K0F2ZHMvM0JWQTNsa2dNd3BI?=
 =?gb2312?B?d3BVYVFCV21FK3BQalVxeVVDYUIrZDR6QkZIU1FFaUVhcVNYbURZZmIyWmMr?=
 =?gb2312?B?M0hBS0Z2MU5wMTFXdExNNUY5dGVqQm9obTV2Vjlqa2JQYTByZHpNWFJtQjNH?=
 =?gb2312?B?cm5RdzZoZ1dpVGtEUXNxT25YMkVBVGt0dHcrMnZ2VWpxUC8vWEJMSERFek83?=
 =?gb2312?B?eGpoWS84TGVIWWhNdXcxQUhpRVY0L3lXRTRzU3QvSmpNK3NDVU1Yd1E1dHNh?=
 =?gb2312?B?V1JkVEF1QkxSazVqWVZvV1Z1bkRsejJEdVNRNDc1WVBFd0Q1QmV3YUI5UUNG?=
 =?gb2312?B?cldIdkNJT2paNVdxZjRHaE12UTFIWXkxVjhQSml0SU9udzYvbXFzM3dvSDl0?=
 =?gb2312?B?TDFnU1o2TW5ycXdocUwrYkNqTk9DWE1Pb0hEdnhuMjRyWmF6eE5DdWZmTjJu?=
 =?gb2312?B?MTE1V1h0M1hpQjFHWGtHZEZ6MlBoVVpCeDB1QjE0Wm9DRTRWS1J5UXE5WTBw?=
 =?gb2312?B?dGRjSUUyVGpCcDNPZ1Nvd3BsZTNQM3lCWXFqejcydFRGYlkwTXNqNzMrNDRB?=
 =?gb2312?B?OEhLMjlkTDhZU2JCejdYU0JSZ0svYW14QXRDVUQ5VERZQkphaEQ1blhPM2k1?=
 =?gb2312?B?V2x4L2NTZjlVRU1wMWdwSEJpZkg0V2c1bjhqdnNUYnJJc3lMQmc5K1pFd00r?=
 =?gb2312?B?VFBBdEtjWGg4eFhrVEtxS2ZTSmYzZ0FpcEx1eHFrNC9DdkVEL0hhTTRoWXJF?=
 =?gb2312?B?WWNtVGdYVC8rOGtpV2QxSDNFSDE1NXNTZnhnY3B3OFhpYkdab2JVUmZZdFho?=
 =?gb2312?B?ZjlmSlFkcTZzSGdjTXcwaFdndWI5SmsrTXpKYzVqODFnS04yL3p2ZUdOeUFo?=
 =?gb2312?Q?T/bCmFWslzvwGRE0OJ?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3593fafc-59f7-4b7d-5482-08de80a2ccc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2026 01:49:44.1334
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LbSmEs3bOXATkBWpJuN1bFK580MjU74TPJEUJAGksJ7QW/CAGhhBPbc+P4EtoEwFT9clirA04VWxm98vdHmacg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8735
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_184956_761850_F0AEEDB0 
X-CRM114-Status: GOOD (  18.47  )
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb2IgSGVycmluZyA8cm9iaEBr
ZXJuZWwub3JnPg0KPiBTZW50OiAyMDI2xOoz1MIxMsjVIDIxOjMyDQo+IFRvOiBIb25neGluZyBa
aHUgPGhvbmd4aW5nLnpodUBueHAuY29tPg0KPiBDYzoga3J6aytkdEBrZXJuZWwub3JnOyBjb25v
citkdEBrZXJuZWwub3JnOyBiaGVsZ2Fhc0Bnb29nbGUuY29tOyBGcmFuayBMaQ0KPiA8ZnJhbmsu
bGlAbnhwLmNvbT47IGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU7IGxwaWVyYWxpc2lAa2VybmVsLm9y
ZzsNCj4ga3dpbGN6eW5za2lAa2VybmVsLm9yZzsgbWFuaUBrZXJuZWwub3JnOyBzLmhhdWVyQHBl
bmd1dHJvbml4LmRlOw0KPiBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7IGZlc3RldmFtQGdtYWlsLmNv
bTsgbGludXgtcGNpQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5p
bmZyYWRlYWQub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gaW14QGxpc3RzLmxp
bnV4LmRldjsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHY1IDIvNV0gZHQtYmluZGluZ3M6IFBDSTogaW14NnEtcGNpZTogQWRkIGkuTVg5NCBhbmQN
Cj4gaS5NWDk0MyBQQ0llIGNvbXBhdGlibGUgc3RyaW5ncw0KPiANCj4gT24gVGh1LCBNYXIgMTIs
IDIwMjYgYXQgMDU6Mjc6NDJQTSArMDgwMCwgUmljaGFyZCBaaHUgd3JvdGU6DQo+ID4gQWRkIGku
TVg5NCBhbmQgaS5NWDk0MyBQQ0llIGNvbXBhdGlibGUgc3RyaW5ncyBhbmQgZmFsbGJhY2sgdG8N
Cj4gPiBpLk1YOTUgUENJZSBjb21wYXRpYmxlIHN0cmluZy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFJpY2hhcmQgWmh1IDxob25neGluZy56aHVAbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4u
L2JpbmRpbmdzL3BjaS9mc2wsaW14NnEtcGNpZS1lcC55YW1sICAgICAgIHwgIDYgKysrKw0KPiA+
ICAuLi4vYmluZGluZ3MvcGNpL2ZzbCxpbXg2cS1wY2llLnlhbWwgICAgICAgICAgfCAyOCArKysr
KysrKysrKystLS0tLS0tDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwg
MTAgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcGNpL2ZzbCxpbXg2cS1wY2llLWVwLnlhbWwNCj4gPiBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvZnNsLGlteDZxLXBjaWUtZXAueWFt
bA0KPiA+IGluZGV4IDBiMzUyNmRlMWQ2Mi4uMzIzZWQzMTA1ZDMzIDEwMDY0NA0KPiA+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvZnNsLGlteDZxLXBjaWUtZXAu
eWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvZnNs
LGlteDZxLXBjaWUtZXAueWFtbA0KPiA+IEBAIC0yNCw2ICsyNCw4IEBAIHByb3BlcnRpZXM6DQo+
ID4gICAgICAgIC0gZnNsLGlteDhtcC1wY2llLWVwDQo+ID4gICAgICAgIC0gZnNsLGlteDhxLXBj
aWUtZXANCj4gPiAgICAgICAgLSBmc2wsaW14OTUtcGNpZS1lcA0KPiA+ICsgICAgICAtIGZzbCxp
bXg5NC1wY2llLWVwDQo+ID4gKyAgICAgIC0gZnNsLGlteDk0My1wY2llLWVwDQo+IA0KPiBIb3cg
aXMgaXQgdGhhdCB0aGUgUkMgaXMgY29tcGF0aWJsZSB3aXRoIGlteDk1LCBidXQgdGhlIEVQIGlz
IG5vdD8gSXQncyB0aGUgc2FtZQ0KPiBoL3cuDQo+IA0KSGkgUmI6DQpUaGFua3MgZm9yIHlvdXIg
Y29tbWVudHMuDQpJIGRpc2NvdmVyZWQgdGhhdCBteSBzY2hlbWFfY2hlY2sgc2NyaXB0IHdhc24n
dCB2YWxpZGF0aW5nICotZXAueWFtbCANCmVuZHBvaW50IGJpbmRpbmcgZmlsZXMuIFdvdWxkIGNo
YW5nZSB0aGVtIGxhdGVyLg0KDQpCZXN0IFJlZ2FyZHMNClJpY2hhcmQgWmh1DQo+ID4NCj4gPiAg
ICBjbG9ja3M6DQo+ID4gICAgICBtaW5JdGVtczogMw0KPiA+IEBAIC05NCw2ICs5Niw4IEBAIGFs
bE9mOg0KPiA+ICAgICAgICAgIGNvbXBhdGlibGU6DQo+ID4gICAgICAgICAgICBlbnVtOg0KPiA+
ICAgICAgICAgICAgICAtIGZzbCxpbXg5NS1wY2llLWVwDQo+ID4gKyAgICAgICAgICAgIC0gZnNs
LGlteDk0LXBjaWUtZXANCj4gPiArICAgICAgICAgICAgLSBmc2wsaW14OTQzLXBjaWUtZXANCj4g
PiAgICAgIHRoZW46DQo+ID4gICAgICAgIHByb3BlcnRpZXM6DQo+ID4gICAgICAgICAgcmVnOg0K
PiA+IEBAIC0xMTQsNiArMTE4LDggQEAgYWxsT2Y6DQo+ID4gICAgICAgICAgICBlbnVtOg0KPiA+
ICAgICAgICAgICAgICAtIGZzbCxpbXg4bXEtcGNpZS1lcA0KPiA+ICAgICAgICAgICAgICAtIGZz
bCxpbXg5NS1wY2llLWVwDQo+ID4gKyAgICAgICAgICAgIC0gZnNsLGlteDk0LXBjaWUtZXANCj4g
PiArICAgICAgICAgICAgLSBmc2wsaW14OTQzLXBjaWUtZXANCj4gPiAgICAgIHRoZW46DQo+ID4g
ICAgICAgIHByb3BlcnRpZXM6DQo+ID4gICAgICAgICAgY2xvY2tzOg0KPiA+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGNpL2ZzbCxpbXg2cS1wY2llLnlh
bWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvZnNsLGlteDZx
LXBjaWUueWFtbA0KPiA+IGluZGV4IDdmZTFlMGU5YjU2NS4uNDZjMWZhYmNkMDcwIDEwMDY0NA0K
PiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvZnNsLGlteDZx
LXBjaWUueWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9w
Y2kvZnNsLGlteDZxLXBjaWUueWFtbA0KPiA+IEBAIC0yMSwxNiArMjEsMjQgQEAgZGVzY3JpcHRp
b246IHwrDQo+ID4NCj4gPiAgcHJvcGVydGllczoNCj4gPiAgICBjb21wYXRpYmxlOg0KPiA+IC0g
ICAgZW51bToNCj4gPiAtICAgICAgLSBmc2wsaW14NnEtcGNpZQ0KPiA+IC0gICAgICAtIGZzbCxp
bXg2c3gtcGNpZQ0KPiA+IC0gICAgICAtIGZzbCxpbXg2cXAtcGNpZQ0KPiA+IC0gICAgICAtIGZz
bCxpbXg3ZC1wY2llDQo+ID4gLSAgICAgIC0gZnNsLGlteDhtcS1wY2llDQo+ID4gLSAgICAgIC0g
ZnNsLGlteDhtbS1wY2llDQo+ID4gLSAgICAgIC0gZnNsLGlteDhtcC1wY2llDQo+ID4gLSAgICAg
IC0gZnNsLGlteDk1LXBjaWUNCj4gPiAtICAgICAgLSBmc2wsaW14OHEtcGNpZQ0KPiA+ICsgICAg
b25lT2Y6DQo+ID4gKyAgICAgIC0gZW51bToNCj4gPiArICAgICAgICAgIC0gZnNsLGlteDZxLXBj
aWUNCj4gPiArICAgICAgICAgIC0gZnNsLGlteDZzeC1wY2llDQo+ID4gKyAgICAgICAgICAtIGZz
bCxpbXg2cXAtcGNpZQ0KPiA+ICsgICAgICAgICAgLSBmc2wsaW14N2QtcGNpZQ0KPiA+ICsgICAg
ICAgICAgLSBmc2wsaW14OG1xLXBjaWUNCj4gPiArICAgICAgICAgIC0gZnNsLGlteDhtbS1wY2ll
DQo+ID4gKyAgICAgICAgICAtIGZzbCxpbXg4bXAtcGNpZQ0KPiA+ICsgICAgICAgICAgLSBmc2ws
aW14OTUtcGNpZQ0KPiA+ICsgICAgICAgICAgLSBmc2wsaW14OHEtcGNpZQ0KPiA+ICsgICAgICAg
ICAgLSBmc2wsaW14OTQtcGNpZQ0KPiA+ICsgICAgICAgICAgLSBmc2wsaW14OTQzLXBjaWUNCj4g
PiArICAgICAgLSBpdGVtczoNCj4gPiArICAgICAgICAgIC0gZW51bToNCj4gPiArICAgICAgICAg
ICAgLSBmc2wsaW14OTQtcGNpZQ0KPiA+ICsgICAgICAgICAgICAtIGZzbCxpbXg5NDMtcGNpZQ0K
PiA+ICsgICAgICAgICAgLSBjb25zdDogZnNsLGlteDk1LXBjaWUNCj4gPg0KPiA+ICAgIGNsb2Nr
czoNCj4gPiAgICAgIG1pbkl0ZW1zOiAzDQo+ID4gLS0NCj4gPiAyLjM3LjENCj4gPg0K

