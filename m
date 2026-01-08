Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DABD1D478
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 17:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bGefZzWNmvhNek8gIDG5hSklK834H8YYv5LE7a8Nh8g=; b=WGz3sOIunRENxnYqUYWckw4bBi
	Xurk/O+MUQFUuJnEWLLAwLReYzN1akiitUP9TNHf39OlSQ6MYCG1p/ynbGPGbyjLTPhoHIh24voua
	7QzKdLqm6Q33ssitPwOOcO3Eib5YSEdOf8szPprgWGM0m2JL4joxGoHjbfYWBhyfMNhlfAax6D1Lr
	SSKVgMCqCBl4fQxTUkSPtOKiq92CFrLMbEvm1FaEYx+Ft9p1IQGH8E9lMmtblXGcin5BKUBtm6MlT
	5mWtexNhARtvGClGvZ09f7PrzFPhjNQbuMY9cyFVRVN9lF6pJvNxwffFj3F7EfWp5q/Vcgi1ovGK7
	HaSouw9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vduDR-00000000WKV-28Vk;
	Thu, 08 Jan 2026 17:54:33 +0000
Received: from mail-northeuropeazon11011042.outbound.protection.outlook.com ([52.101.65.42] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vduDN-00000000WI7-3vlz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 17:54:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ARky+e8gI6WBHk3WevK7sFpYX1bzLO5qWwxXCrvX+Pu853qrR6rj2wMbjwcNqZxSMCnYW2hPYkZK44jcvOwa4Qsd1hjl7jkb2EiDw8gWPu042I6lphda52pVuYX2A4lQj24E/W1PIogkIdTRNEa7NwgxF3acITAxjIt0Jh/nN8+v+kTYNJyPr0HwkDigGOgN2vrTcW9roambleh7TUW9H7RqimxwKpw77nVrzn7vyRdDU2QXpAuaoCW5Fa4J8iFOSqfHoOs4A7UK7TJJPR7XwdxZPrhOl6wRAAIDD6kXK/LAsNUKyxeAhceh5URcFugh+b+S5mSlaDSDw1sWGUPbVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bGefZzWNmvhNek8gIDG5hSklK834H8YYv5LE7a8Nh8g=;
 b=dnSarvDuTtaRBPVcafo3vkhkB0t40+JlOp2VoMUWnsGh0FBCdiJ9Qu2mUeU5iNKtX7d2AXkBpnKN0bYqIdIPMqfrx/3rkoA2bKSFCwv61qMSWfBqPTyuvUuXH7nEZV2p3OT7ZPpTCLDSrOpmLPVJPgl3FqYOf1nI8o9R+6oxeeSOpbkj9oTSrb3pLjQ8v82ckYF/KJyTtXg4jXAQIzJX+M58jMGb/onENQfky/8k75cu7nuP99nQF83OD4kmRznJm+TFttoJQIRunTlD7N+EsiMXa2HF9GXg3agWOs7LGM5JMVhGHUmf8VT4HY9aKcc6u1XTxB4XmfGUn/WE9nE+uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bGefZzWNmvhNek8gIDG5hSklK834H8YYv5LE7a8Nh8g=;
 b=q/4mLzBXjdrxVDt/8ZwseOg3eWvNyE9ULTYbN26VrUgydPidmn8tJMyyXdt3heRKlerXr8+qry9LhFze2t4NDBqHlNx13okHovLhRgHySIhGvhJcTivT4+PeC/3RdBPNQEnpA+fyPmhtAAYbWxllt85qdZzcvm81foJI6zYM6cAVtS5Q4kYlk/WwhpaGDXoDtBZVzuqpsNwRYtSWy5qCjAKQMFXx3BG3ojniXPEvVXI6tWl+ZWvMKjIrD/bo7ZHafAGdNiDGPLbp6SjTguxXq9SU5C2CMXgBXcPDqMta8SeGAizKqQAHf/a2Y6IBXqkvYgtHJGkpyB/WpjgUtswkoA==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by GVXPR10MB6323.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:16::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 17:54:22 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f%3]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 17:54:21 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "nm@ti.com" <nm@ti.com>, "alexander.sverdlin@gmail.com"
	<alexander.sverdlin@gmail.com>
CC: "d-gole@ti.com" <d-gole@ti.com>, "sebin.francis@ti.com"
	<sebin.francis@ti.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "a-kaur@ti.com" <a-kaur@ti.com>,
	"k-willis@ti.com" <k-willis@ti.com>, "vigneshr@ti.com" <vigneshr@ti.com>,
	"vishalm@ti.com" <vishalm@ti.com>, "khilman@baylibre.com"
	<khilman@baylibre.com>, "msp@baylibre.com" <msp@baylibre.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a7-sk: Disable mmc Schmitt Trigger
Thread-Topic: [PATCH] arm64: dts: ti: k3-am62a7-sk: Disable mmc Schmitt
 Trigger
Thread-Index: AQHcgMfRv8NLvcx+EE++zWoSs7wclA==
Date: Thu, 8 Jan 2026 17:54:21 +0000
Message-ID: <f4100ee2c655df5394322bb167f62dfd0a6587b8.camel@siemens.com>
References: <20260106-topic-am62a-mmc-pinctrl-v6-19-next-v1-1-1190ac29aadb@baylibre.com>
	 <979eb1054dbe116c2c8bb9920e94e3a93db5346c.camel@gmail.com>
	 <DFHSDXTVL4AU.2OQ9VB9TEJ75G@baylibre.com>
	 <6c90102537c3e3f1712538ca0b165cd54d71d8c2.camel@gmail.com>
	 <20260108164024.fodfklk7xayh4dqj@authentic>
In-Reply-To: <20260108164024.fodfklk7xayh4dqj@authentic>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|GVXPR10MB6323:EE_
x-ms-office365-filtering-correlation-id: 7ff543b9-4d88-4b20-e203-08de4edef42b
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?bHYrMDRmNjNpYnBaR254YnlrcTRuSUVzTzRVeWF5NUdzb3M2VDV6bTd4WFc4?=
 =?utf-8?B?b3M3ckZ4ZTNTb3J1cXlBek5KcFdsWkVRL2VrV20zUmVob0YvRjdndER3RHk5?=
 =?utf-8?B?cXBOdjk5U0t3M0RaUCs2RzMxUFUyODIzcTRlTHhKdHVoenRDL1o4b1VGaWx2?=
 =?utf-8?B?cjhscjJONkFicnpucGJNbFhjdTluNVFsdmRlODVnVG5YN0VJbE1ZZ0t1THk3?=
 =?utf-8?B?alptWUNmMHhKLzhhRGY1bTZHTUJwR1Yzalg3K0dnVzRzQ2lHQXVqM0xxUHZz?=
 =?utf-8?B?TFJqaFFaZUsxQmNzalBFRHYzMllDQjdEQlcrQTJ5MEV0YXZxUFdsL2RPeURa?=
 =?utf-8?B?ZWhNWGVNSnRtVncwdUdVWmtMQS9pVzBNMG16VmFubWdZR2J6NzJjSHVpZFAv?=
 =?utf-8?B?SHN5UWd0RVpxT09ELytucHRRc1h2VE1WenIwOUFyOUUwL2VXQnlyOTRId0RK?=
 =?utf-8?B?ZTh2STlianJxQlhxaDBvbXBOb3FESnUvS0YySXNaa205ZHkrbWZyQlpCdUdp?=
 =?utf-8?B?TTlhdGxHYTlxKzlobHh5cE8wUm5ocE1EdXA5bVcyRzFDRjhFcEdTZ1V3MkI1?=
 =?utf-8?B?MlZqczJyTUwyZlc2dGl3dFBOUXhnNVNDOXE2dUo0aldjSFY5dy85Y2ZyOHl3?=
 =?utf-8?B?aDhDbzZsMGxxN3doQWZHTUJETiswNUJYbFFwYjlqL3dnVzdiVXdGcUFCNndz?=
 =?utf-8?B?T2JIU1RCUllxd3BicFplU044S2NaRi9ycGtUc2F0eVRPYTFIc1RkTWlyYUdl?=
 =?utf-8?B?VnVjbVUybUcvano5MlRVZm9scmthWHViSjNZSnRxUVRteVZUVE9vYzFpa0VY?=
 =?utf-8?B?dHFaSWZTK1pjSnFIbENKNSsvRmp1SEE3eU00bEc3bHRXUzNuV0M5eGZzbFNK?=
 =?utf-8?B?OFZheGtKck9WZXc5QWVJb0tkcVI2MEE5QlN0OEpoVUV1NGJZdTZ4UU1ORGVz?=
 =?utf-8?B?MDA4N09RMjA2YWxqajk5MDFkdmRkdldxbGhrY29xVFV0Mjg0a2NxdE5Kb3BD?=
 =?utf-8?B?M3pxVFVyZ0xreDZSTFJDWG1HMklZZDIxODNUZU5Rdm1yaGFnaVpMT2RBblZw?=
 =?utf-8?B?TTZlZEpEZjVldGwwenNCR081OXpUNS95WjgyY2hOL3VHZFFqT2RZdTg2WFVO?=
 =?utf-8?B?Z3E3YlFPUHNkMncrbjRMRUFtNjF1ZklaUmVGV2J0UDArSWdkQTVDcmUycEtx?=
 =?utf-8?B?TkRoVEMvTEV0QVBGdnJsMEp5bzVkcHZBVmxsVFBZZTRvdUVtaGhmSG1VQWlT?=
 =?utf-8?B?TkE2VHFXZE45SUlzM2I0cUVqc0x0ODI0MFpIOEhmcTlNUVdsMHo0UnVMeTBa?=
 =?utf-8?B?WXljdGg0Wm9jM0I3WWk4VVR3WHhOTTRCMmM3MW40MkdlSjFsWHFWZThURDdH?=
 =?utf-8?B?MCtrZ01PamFPVEl2ZUtTZldiTWFpNXkvd2tXVmNZaUhKR1Jyem00ZTV4a1Bx?=
 =?utf-8?B?Rks2V255eXl3Q0pOK2pqeDZmUW1JMGw0T2VRQThQaVQ2MTdUajJVT09FOFkr?=
 =?utf-8?B?d1FtWjJTYWhtN3BVZ1MreisrK3VNVHljbGsrc0FiUUFlbUZheUM3Z0JZSEhN?=
 =?utf-8?B?S0lXVXN1VzJOZmJHYUdGVERyQTU1MVczbThWQm9tZnhpZEE4ZHhhWC9kSzRi?=
 =?utf-8?B?Ym9RUU1WMzdvSDF1ejFzS3VWSEZtNXN5WlZJK3ZENnJ5Q2p3NDQ1UUNMaXZE?=
 =?utf-8?B?Y0JFV2Q2ZER4MmNSbGlKN0JHSVh0b0l5SEhRQnVJV0J5SHFWcXhCMDdMalB3?=
 =?utf-8?B?Y2ZkcXkzQ3o3WnluTXdHT0Z4SSt3VW1XeWlzY1pOTktFMEIyZmlrS1p0RXRC?=
 =?utf-8?B?M3MzOVBDNWVUSTNiZVNTR1pCU1JxbXp5eitPb1RRTFVlSjVTN0dTVUNZZkZO?=
 =?utf-8?B?Y3pQZStoZlBQdGdvWGl5aHZxNlQ1L0xrNkZqNWhUOEUvYlVJRmwrV09XS3dv?=
 =?utf-8?B?anV1RWIyd1RqUVVnKy9NR1JZeUVZTElLSVBSQ1FybEpFTFhtVm4wU0c2aDJ3?=
 =?utf-8?B?ZFE0anNiNkVnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vk9hMU9KQmJWb2JzTnl6VHVZN2pydVQ3L2tGSUN5cldTZlIrcnFVUmlMWG14?=
 =?utf-8?B?TGRYV1NjcndSZ3laSmx5Wk5NQWNCaDJxbmtycmdiNUtST0szWXZCaTBRM1ZO?=
 =?utf-8?B?Vk1sVzFSK3JTZEM2UmdRZFdmRjdHdmNud21Sd2FEcW9qdGxoYnhxT3RlYUdZ?=
 =?utf-8?B?aEtIanFOa3Q5bUVtd3dwbGErZFVGRm1zYm10enBsWmc3NTc3dDhpNHE0Q2xN?=
 =?utf-8?B?K0JWUlJFZS8xMnN0WXUzWmJJaHhHM0VBVE5tQWV1QmEvRkhnSTlyaEZkV2RI?=
 =?utf-8?B?WndvWjBPVUIyeCtPdWRkZU1PVnJNQjlJRU1nN3d1VWFmbWFFaW5rQk5Eeldp?=
 =?utf-8?B?Q2I1T3ZRZWpuK3NWcG1FM1dsMGdOT0ViT0d5L2VpazU2dGppKzRzWVhKTUlV?=
 =?utf-8?B?M3VwQVN0UHBWZHphbHRyV3hKdDBKMll2d0o5SkpjNTdxMmhwUlM3UEpuUWxL?=
 =?utf-8?B?cVNmK09GbGRiSlBHSC9HRFFpem1Fb0h5L243UlhqSGhZd2pzenVYQ1UzNzhi?=
 =?utf-8?B?OEVoc2xXTnBLY25UQUd2b3ZXZFl4cERrR3dOL3lVLzJQWGlNTXBDdFp4RkNY?=
 =?utf-8?B?RkQwMExnOGR0em1YQWl4dzhkcXpBNkplbkJIZzEwai9vbWNYSWt4Sml2amFq?=
 =?utf-8?B?dUYxY21GU3o5aHY4bjhpY3F5eENRemZyYW5pMXgwNnFzNG5wT1Z1YzVsRldN?=
 =?utf-8?B?emRGTkd0VmlFWEhqaHYrb3hGbXZZcDJ6a2xnQ2o3bmt3TlJrS0lRRnl0L3Fv?=
 =?utf-8?B?am80cUNIdTczTERVU1JXWnRYRnUwZWsvSVNnSFI1M2FVTUVpN1lqZy90N0lz?=
 =?utf-8?B?UHhQblJUQy95UmhFR0U0R3JoaUJiRXM3dzR3NHl6bHZ1aEtVekZWcXBvNElV?=
 =?utf-8?B?RTlSVHk0OTdMMUpQYnA0TThNV0twbFR0MTJPUUw5ak5ac1FNa29LNkhRejlI?=
 =?utf-8?B?TGxkK2tRT3lDc3dDRlhRMm8ya2ErMUozcmE5amZPeGxFVFlFNjJ1ckM3OXlS?=
 =?utf-8?B?OFVWbDBPR0ErdkpsUEkyT0lWRGc1VDBraFNESlZQTEJSNkxSTDY4bFlpSTdt?=
 =?utf-8?B?UzhYclBOODdaM2U1MFRCRWMvSU5Ka1MxeUJsUmpMV1JrdXJUbmpITFYzYWVI?=
 =?utf-8?B?dnVoYVJmaXNieHlWQ3Z1b0RmUjFvS04yNGgzbUFka1p3U00zNWxOTzNlMUw5?=
 =?utf-8?B?ZE9zMjZFYnpBb05GamlPMDJBR3FzK0dZUE85MXdoZWdjN0dOT0k5eVgvZzhp?=
 =?utf-8?B?aVkxbWd6TDZaanFoTFRxTS9YKzdXdG1TTm5wRWlDV2c5TDVDbytYMHZ2YjJU?=
 =?utf-8?B?MGVBSkFpQkpLTllTZFJIeERjUGlYSHdIUEtGYjlnOFV3Q3JMeTdDdGVIcHM5?=
 =?utf-8?B?UStVd1FsR2pJM3RBdm5nZ3lvSWxtYVNjcm5pZDFHWTZJNW9oTVZ3K1FQT2wx?=
 =?utf-8?B?SDVXNncwMTNqeG9uT0FmSHdwNXVzVWE4N0xkVGE4eHgrVW5NMWp4Z3F6TGJl?=
 =?utf-8?B?dnhzNWl3VVMvakREN3JWdmNXUnNZNE5iQjdrUmtpdlZXVHh2TUFQTEZIUkth?=
 =?utf-8?B?QitYaWxJMmVvUUlWQzlGMFVNYmF4d0V4RStrbGtmeDJFMllXV1Z2YXRsN0g2?=
 =?utf-8?B?TytlcUZSQ0pxWm5USG1pZllVNzJRQlVRaHF6bDFIOEFMdDRFTjNjYnhIdHln?=
 =?utf-8?B?M004bk1IY1dHSjlxclN1bmhxUFN6b1lYR1dtQ1h3ZjRoQjVockNLWjhNVm5m?=
 =?utf-8?B?QXF6bS8ybzJZd21VVkpMUC9TZXN5dHR1UVJhZjZTRzduaUQ4elR4REUrYUxC?=
 =?utf-8?B?c1RJZHlQbktYQVZsTWRRd0VkZEVqY011SDl0M1Rnb1lVVHJNbmxxdU9TQ012?=
 =?utf-8?B?WVFHemNkQjJtMnRRT09KaFlYdG14WWtmRWRkOTlYOTlOVGduRnFUN3hMQTQ3?=
 =?utf-8?B?dmtrVnAxTWFORlVFbzFlWUVpMExQNDFCczNMdnM1R0x1aDhWWGlnejVvZE91?=
 =?utf-8?B?VnRBL0xWZlhNYkl6TzNidmFHK29ieHc1OFFoZ2NjTStkWXc4bjR1MEVWZkZn?=
 =?utf-8?B?cXk3QmpCMW9wOWlJTzBTMEh3cm92Y2s5bkxHMUtVdU0rdXBULzBrYzV5emZK?=
 =?utf-8?B?MjZsbE9wcVU5TEdEQmVwdFJ0cmlmUFpxM3pVWnpyMTlta3g3MmtzVUhzcitC?=
 =?utf-8?B?Qi9LYnNhZGtJZ2k5S2ZZNUkvbGJiQmxpSkRWdmhYY2FhUElOMjJZQUNFd3Qr?=
 =?utf-8?B?ZlhwNmFSSU53ZDdPZGl4TUdzc2RpMzU2TlY5ekpPU2JkVXZ3MDY3UGNTTTRZ?=
 =?utf-8?B?M2cwdTd5bXpIOE9NVFQ0MloxSlFGWWY2RnkvU2pCOFFVRXNKREVBNU1XcnpI?=
 =?utf-8?Q?NeiJk0riVJxpVwk0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <53EAEC7671248D4BB24DDB9D86444B96@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff543b9-4d88-4b20-e203-08de4edef42b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2026 17:54:21.8992
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e7bentU+DG2eHyIuHYeYuFmLw8FHyIBiR1DRrtRfzaoBKiWjoYZSRauq+1wXTsXU0FHSZkreOIPl3pVX6sJWIFAQW0pL8108Aj0rdYM1ykM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB6323
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_095430_192767_463BCA96 
X-CRM114-Status: GOOD (  27.05  )
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

SGkgTmlzaGFudGghDQoNCj4gPiA+ID4gSSB0aGluayB3ZSB3b3VsZCBuZWVkIHRvIGRpc2N1c3Mg
dGhpcyB3aXRoIFRJIHZpYSBvdXIgRkFFLCBiZWNhdXNlIHRoZSBjaGFuZ2UNCj4gPiA+ID4gaW4g
cXVlc3Rpb24gaGFzIGJvdGggYmVlbiBkaXNjdXNzZWQgd2l0aCBmb3JtZXIgRkFFIGFuZCB0aGUg
dGVjaG5pY2FsIHRlYW0NCj4gPiA+ID4gYmVoaW5kLCBhbmQgYWRvcHRlZCBpbiBUSSBTREsuDQo+
ID4gPiA+IA0KPiA+ID4gPiBPciBoYXZlIHlvdSBhbHJlYWR5IGRpc2N1c2VkIHRoaXMgd2l0aCBj
b3JyZXNwb25kaW5nIFRJIEhXIHRlYW0/DQo+ID4gPiA+IA0KPiA+ID4gPiBXaGljaCBoYXJkd2Fy
ZSBpcyBhZmZlY3RlZCwgaXMgaXQgdGhlIG9mZmljaWFsIFNLLUFNNjJBLUxQPw0KPiA+ID4gPiBJ
cyBNTUMyIHRoZSBTRC1jYXJkPw0KPiA+ID4gDQo+ID4gPiBJIG9ubHkgdGVzdGVkIG15IGFtNjJh
IGJvYXJkIG9uIHUtYm9vdCB2MjAyNi4wMS4gSXQgaXMgYSBTSy1BTTYyQS1MUC4NCj4gPiA+IE1N
QzIgaXMgdGhlIFNELWNhcmQgYW5kIG1tYzEgaW4gdGhlIGRldmljZXRyZWUuDQo+ID4gDQo+ID4g
anVzdCB3YW50ZWQgdG8gbGV0IHlvdSBrbm93LCBJIHdhcyBhYmxlIHRvIHJlcHJvZHVjZSB0aGUg
cHJvYmxlbXMgd2l0aCBTRA0KPiA+IGNhcmQgYWNjZXNzIHZpYSBNTUMyIHVuZGVyIExpbnV4IG9u
IEFNNjIzIHdpdGggU1QgZW5hYmxlZC4NCj4gPiANCj4gPiBXZSB3aWxsIHNlZWsgY2xhcmlmaWNh
dGlvbiBmcm9tIFRJIG9uIHdoeSB0aGlzIGhhcHBlbnMsIHdoaWNoIHBlcmlwaGVyYWxzDQo+ID4g
YXJlIGFmZmVjdGVkIGFuZCB3aGF0IHNob3VsZCBiZSB0aGUgY291cnNlIG9mIGFjdGlvbnMuDQo+
IA0KPiANCj4gSSBoYXZlIHBhc3NlZCB0aGlzIHVwIHRoZSBjaGFpbiBoZXJlIGF0IFRJLiBXaGF0
IGNvbmZ1c2VzIHRoZSBoZWNrIG91dA0KDQpHcmVhdCwgdGhhbmtzIE5pc2hhbnRoIQ0KDQo+IG9m
IG1lIGlzIHRoaXM6IGZyb20gYW4gaW50ZXJuYWwgZW1haWwgY2hhaW4gSSBhbSBwcml2eSB0bywg
aSBhbSBiZWluZw0KPiB0b2xkIHRoYXQgInRoZSBTVF9FTiBiaXQgaW4gZXZlcnkgUEFEQ09ORklH
IHJlZ2lzdGVyIHNob3VsZCBuZXZlciBiZQ0KPiBjaGFuZ2VkIGZyb20gaXRzIHBvd2VyLW9uIGRl
ZmF1bHQgc3RhdGUgb2YgMGIxIiBhbmQgdGhlIGZhY3QgdGhhdCBMaW51eA0KDQp0aGF0J3MgdGhl
IGluZm8gd2UndmUgZ290IGZyb20gRkFFIGluaXRpYWxseSBhbmQuLi4NCg0KPiBrZXJuZWwgaGFz
IGJlZW4gc3RhYmxlIHdpdGggdGhlIHNldHRpbmcgZm9yIGEgbG9uZyBwZXJpb2QsIFNvIEkgYW0N
Cg0KLi4uIHJlYWxpemVkIHRoYXQgTGludXggYWN0dWFsbHkgZGlkIHRoZSBleGFjdCBvcHBvc2l0
ZSBvZiBpdCBzaW5jZSB0aGUgZmlyc3QgSzNzDQooQU02NSkgYW5kIHRob3VnaCAiT3VjaCEiDQoN
ClRoYXQncyBob3cgSSBxdWlja2x5IGNhbWUgdXAgd2l0aCA1YjI3MjEyNzg4NGIgYW5kIHRob3Vn
aCAiZmluYWxseSB3ZSBhcmUgc2FmZSEiDQoNCkFuZCAic3RhYmxlIiBpcyByZWxhdGl2ZSwgd2Un
dmUgZm91bmQgaXQgb3V0IGJlY2F1c2UgR1BJT3MgZGlkIHByb2R1Y2UNCnNwdXJpb3VzIGludGVy
cnVwdHMsIGl0J3MganVzdCB0aGF0IG1vc3Qgb2YgdGhlIGRyaXZlcnMgY2FuIGhhbmRsZSBpdA0K
Z3JhY2VmdWxseS4gRXhjZXB0IGludGVycnVwdCBldmVudCBjb3VudGVycy4uLg0KDQo+IGNvbmZ1
c2VkIHdoeSBVLUJvb3Qgd291bGQgc2hvdyB0aGlzIGluc3RhYmlsaXR5Li4gSSBkb24ndCBoYXZl
IGFuc3dlcnMNCj4gYXQgdGhlIG1vbWVudC4gdW50aWwgd2UgY2xhcmlmeSB0aGUgcmVhc29uaW5n
LCBJIGFtIGdvaW5nIHRvIGhhdmUgdG8NCj4gaG9sZCBvZmYgdGhpcyBnaXZlbiB0aGF0IGtlcm5l
bCBiZWhhdmlvciBoYXMgbm90IHJlZ3Jlc3NlZCB0aGF0IEkgYW0NCj4gYXdhcmUgb2YuDQoNCklu
ZGVlZCwgSSd2ZSByZXByb2R1Y2VkIGl0IHdpdGggQU02MjMgaW4gTGludXggWzFdLCBldmVuIHRo
b3VnaCBpdCdzIG5vdA0KVEkgZXZhbHVhdGlvbiBib2FyZCwgaXQncyBvdXIgSFcuIFdlIGRvIGhh
dmUgb3RoZXIgSFcgZGVzaWduIHdoZXJlIHRoZQ0KcHJvYmxlbSBkb2Vzbid0IG1hbmlmZXN0IGl0
c2VsZiwgc28gU1Qgc2VlbXMgdG8gcHV0IE1NQyBvbiB0aGUgZWRnZSBzb21laG93Lg0KDQpJIGNh
biB0cnkgdG8gcmV0ZXN0IFRJIEFNNjI1IGJhc2VkIEVLcyBhdCBzb21lIHBvaW50LCBidXQgaXQg
Y291bGQgdGFrZQ0Kc29tZSBkYXlzIG9uIG15IHNpZGUuLi4NCg0KWzFdIGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC82YzkwMTAyNTM3YzNlM2YxNzEyNTM4Y2EwYjE2NWNkNTRkNzFkOGMyLmNh
bWVsQGdtYWlsLmNvbS8NCg0KLS0gDQpBbGV4YW5kZXIgU3ZlcmRsaW4NClNpZW1lbnMgQUcNCnd3
dy5zaWVtZW5zLmNvbQ0K

