Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88361E6817E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 12:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mTRfn8hViiSMBRFusMfrDGj0a7NQtxOjIB5UzhB1kgs=; b=civ/Ru4iqbJ4HPNCcDHct3kV2J
	XoFcCkVebMpcg6J5P89gMF5VCnQnwDBSTUOUH5WIYVG9S7IUqMEZcdjwzcCBhiIgiDWqg+biYBG3z
	DLeux88eqk+UxYdvBUCT+r2woa4FhLvlSfUZmeXoLjWO7q2lhqR0uvESSj5o9TFL4MDqvB+R6/iJF
	tH1m1wMysc+J1uRzdTsToUGx0ovvG6OTXg25v5oTJwOpNataZUEkdK3ubMai0aigMBjLUNPAhneg4
	7Mzmlo8hF0E74b/1q5/aez+33YjFoCiIdMsyU8VeHcuq2Bnz36jaTG0yafWLspBfIDrZuBpqUSv+Z
	iH5FCLyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsKeE-00000008Fsy-1Z1b;
	Tue, 17 Feb 2026 12:57:50 +0000
Received: from mail-northeuropeazon11011061.outbound.protection.outlook.com ([52.101.65.61] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsKeA-00000008Fs5-25G6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 12:57:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K1KQc19GDUUv4ZkV27ncwQ/W/IAc4vktzOYkYcPBAfSfPTxKjDNLGfnM3qrtsW6X5YWCkM8HmajPeV+7XWk64iwdoyrC5CgEuIVK8Ei8g5g+5MD4X0tzCP7l2hmCwZRpdIIMPoMRu1nW8vbrurXETv60tnQsB+yQacURb7s6QIllrO4atQZsk+ISpkO0vc1l8sAxtr1F1Mm8oP8QO32Otivp1grkyxEBHKBAfxtD0tj49YLq/rTmvPxXJJID4ktNdOd4P4NxkVR1znqwiub10Gc0oGyMZ579lmLL928sl3kTLc40n8n1WoHARgBmBMDr3/j/zsF0cqOLUr/HGpuILQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mTRfn8hViiSMBRFusMfrDGj0a7NQtxOjIB5UzhB1kgs=;
 b=kd4TqJYGmkYcuoM/pkaE1sOYZue2SJI2NhEpUVBvx7P/pEnbkPiM57lVldpKP2M1+3DulDksNpEhxW2ry+x6j9cjo+y/JqeJ1yhBeEXDNwPsWfBLQCmVAVgKLOMn2BhBPg61p90CTFTYHmYKzRalC0t1Ma6zpCjni/iB6Fu3B0gAfgYDiHjNNzSAZFhwzlZuIpEPsz6CCxKOe02XNZ4gUSjoovFCp5YAGJN/4Ueyu/gfIZS2YIXyO6lknEQad3nWRAWI/CdVe10T29FXQfXzI++5xjA6FGqKMUTgl/3jM9jWwkTz1OTksAkorNCJHrWbkKSWCAVVYiSA6KUp0hQL1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTRfn8hViiSMBRFusMfrDGj0a7NQtxOjIB5UzhB1kgs=;
 b=wWoqdF5bkr8sojJ8TW3iIejFQn/0VL+EQDp/bpe2nDhMPJHBke9mJPr9KDsDO98ILERwH36EaIxsB9yCkMf4+50atav9kansFuswfxPigByR63/vj5jfMzqpRS20YkkpSEqLSmjzOuJXurJFwVnU8bmwpE5L7GhuZWBy2GyAF3I3Ppfv7pND8NoYoW9Ds0rA+ogJmfJHrVY5L+4gDDhtv4cLCOe65FAZhVNslXYy8FBhvLGYiM18UB2B0IuIY5y2EWE8NykU1FLkri95zrpP2vWPYF7Y2dMXx6k71JaQ1kzjJ3moLACsU3yPP3xeTJSk4P0lpyZsLZtMUCdE7Al3Hg==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by AS5PR10MB8146.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:673::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 12:57:40 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f%5]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 12:57:40 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "alexander.sverdlin@gmail.com" <alexander.sverdlin@gmail.com>, "jm@ti.com"
	<jm@ti.com>, "msp@baylibre.com" <msp@baylibre.com>
CC: "d-gole@ti.com" <d-gole@ti.com>, "sebin.francis@ti.com"
	<sebin.francis@ti.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "kristo@kernel.org" <kristo@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"a-kaur@ti.com" <a-kaur@ti.com>, "k-willis@ti.com" <k-willis@ti.com>,
	"vishalm@ti.com" <vishalm@ti.com>, "khilman@baylibre.com"
	<khilman@baylibre.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "vigneshr@ti.com" <vigneshr@ti.com>,
	"nm@ti.com" <nm@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a7-sk: Disable mmc Schmitt Trigger
Thread-Topic: [PATCH] arm64: dts: ti: k3-am62a7-sk: Disable mmc Schmitt
 Trigger
Thread-Index: AQHcoAz+v8NLvcx+EE++zWoSs7wclA==
Date: Tue, 17 Feb 2026 12:57:40 +0000
Message-ID: <b649669afe4e2c829389a6bedabe47446d2f3d2b.camel@siemens.com>
References: <20260106-topic-am62a-mmc-pinctrl-v6-19-next-v1-1-1190ac29aadb@baylibre.com>
	 <c47697b4-6ebb-4af9-be96-c964d990835d@ti.com>
	 <DFO764ES0FNP.1SUQK9R0EUUDQ@baylibre.com>
	 <1a91fd40-e814-4b4c-8914-d8f0c4768e07@ti.com>
	 <DG59D7WGM35A.1WNIIMNCQ8U3C@baylibre.com>
	 <7ae7f6a1-0ee1-4d56-b1d0-f038a7d22b4c@ti.com>
In-Reply-To: <7ae7f6a1-0ee1-4d56-b1d0-f038a7d22b4c@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|AS5PR10MB8146:EE_
x-ms-office365-filtering-correlation-id: 959f14ce-0c86-40ca-6e5c-08de6e242206
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?SWd5RzZPY0VhMjdibE4ya0NtU3YwOElZcUdmZzFHZERZVlVFWnFWRU0yM1M1?=
 =?utf-8?B?aGNjK2hoSWpNNHRDYTVjblM4a0pkZWw3UmdsRnhaUFptbUNraHJaeks2T2Vp?=
 =?utf-8?B?YjhJMUQvMWZvZ2pjWTlGbmYxTUF2WFhyMmhmQ2NYQ2pjMUNzNllNSTh0dUZF?=
 =?utf-8?B?Um9vSUd0SVZad3FwaXZBVHhUMitUYVBoR29KSUJuZThFejlyNHdYYk1yUmZ4?=
 =?utf-8?B?aWlpTDRTRDNidjY2ek81NkpOM2V0OTAySlJGZ05xZ3hadVUzWFZGM3B5YWFa?=
 =?utf-8?B?MTh3a21DdmtnQmxibzdhcGh3c3d6ZkFxUnNra0tCb3FWaDdFMDBpczFIaW9h?=
 =?utf-8?B?LzJaVTFuSzhHVVVGWEpxVGloZnkwZmNvK0dDQkpqSzhWQlpjaytFMGxkcHdV?=
 =?utf-8?B?bnNjWnZsNlNqQ1NHOWVSUVJrT0hnK29jQUExRnFGelpiNkpzWGY5VWYxMjBX?=
 =?utf-8?B?NDJKWFlyTmZaaFNxYkNGSUJnZWRrMTh0YTkwM1QwRjJvNkpRN2NjM0xZL0o0?=
 =?utf-8?B?ZE4rZjRHbDFKMElnR0twRUpMRmJMdVY4ckFTZ3RscEVjQVlvTVB0TCtEUWlS?=
 =?utf-8?B?WXVLZzI3dTl5ZGFVRFFlWTBEMHZhMjYvRmFNY3l0SEZEVEI4bWk4UUNKS0Vn?=
 =?utf-8?B?YU5VVWdiazJwS3YzYkdmSW9rRFZQaUJ2MW1ha3VDS25HMWdDWVRvWjBzWjNF?=
 =?utf-8?B?bHFLeG9OR0hlQzZJS21yblZ0eVk2NUpMSEhraWtTVmJqYTFpNmpXTkNaK2ph?=
 =?utf-8?B?NnpOUDBNWGRsSGE5ckJCcEhTeCtkRUo0VkhielU0ZGFzYnJ0aHZDZkJ4dGRB?=
 =?utf-8?B?RFlLOTgxYVYwUXljMS90WGp0YXAvTHU0QzJxc0w3dXhFWnBDMlR0dnJDR3k1?=
 =?utf-8?B?Y3diRURuM1B3R1dJY2QzTUk4M0lUbDhrMVVYYlpnZnRRWWxWU0lyUW9jTmV5?=
 =?utf-8?B?eXJIbUdpU2pmUUdSTForRC9KRXNqMjJzTURDS2hZc3FSd0FFbHRqRFNZakhM?=
 =?utf-8?B?blI2d09GK0VzYWJMcVZqWkxhU1ljclBlZVNtbnAzY2hMYUNFUE1rWjJaU21n?=
 =?utf-8?B?S1RlNTcyRURQOU9PMS84YlVhZEJBTk9RREtkUG1JYXNLam1YTTk1TVR2bFRY?=
 =?utf-8?B?U3hTeWVjOVlMd3loRXUxQlNNUWRXT3dic0tLLzlBS0JUMzYrdVZxQzA5eXRa?=
 =?utf-8?B?ZjBQdHRRYndOelRqOGlXRmgrSW5HM2FxQTNQNy8zVkFicXB5UFZ6UTN0OENM?=
 =?utf-8?B?dVZXVFBSeHdsR0VLRFFzK0dDMnlWY2N1c0JCMG16dC9ZVGh1ejVTL0VxN01u?=
 =?utf-8?B?eUV1VmNqTmxFR1gxTlRuN3lMeTVpNy9FWVptMFoxOFVsdUlYaitMNDIrVjlH?=
 =?utf-8?B?UVQ5MFBva28zNE8xMmlKQ25XTENXSDJFQ0N3QWpBR2NBcE8wNHN1L0ZKV1VX?=
 =?utf-8?B?ZHN1QzZBY1p2Njc3cWhYdmkrR1BZNW1RZ0RRUjJNblJoS3JKMjdIdXRnNG41?=
 =?utf-8?B?VzJQWXU4amNJeFlOTitzMENmcHBsckJVTEdydVZ1czR1VHljS0tQY2ZkSzNo?=
 =?utf-8?B?V2VJZWxBVWR3MVZTNzZ5bGdocXEyOENWaVdUVng2UkllZUVBaktLMGVFUmdr?=
 =?utf-8?B?NkpQem44R3hNMWRmcHc0VjFsNGRRK0J3eUFNZjh5d2Y0NG00VFZocTFUS1FM?=
 =?utf-8?B?NkRMTm9CQ1VSVkxQMGxTK0xybnBLaDNmY1lIM3VsUkl6akpidUFJWlZPTEZ5?=
 =?utf-8?B?Y2tSV01KQUxHVnN6ZnFhZmVMZGloRldiT0liNVRmOE1OMXhoWEM3Ni9lOE1h?=
 =?utf-8?B?c05kQW41dGwvL1pNRXl1cU5IVTVsQm9WZ0tTWGlGYUh1ZTdKV2JPcUV5KzQ5?=
 =?utf-8?B?L3NKN2xRVzN2bm5UNGRlQVg1T0M4cHdUb3YzSm9teVJMaXpZc3dPbWRKSWRw?=
 =?utf-8?B?SmZTbXRQMS9qcUlhR01MbzFtUkllbnU3YUJPUFZmMGpzYXJZbUJtTE5hekIy?=
 =?utf-8?B?aDFLKzVoQlR1VG5KaHJtSGpOWU9MWUFibUJIYWlVa0NzU1drdXk0cFJTQUhs?=
 =?utf-8?B?QU1UVS81aUhIS2tVZHBUZ0ExR0o3a1RwaWpsN2FMU1hjSmU1VVYzR1hrNUpj?=
 =?utf-8?Q?b3+E=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a0Fmd2g1ZEU4UGRUalk1NFJ1NUlZMFozbUdTWit4TmdKVW40eks4R2RHQUQ5?=
 =?utf-8?B?YXI1YVdFSjIrckVrRmVJLzlTK3ZrRE5IZGZON0dwSW1CQkxjV3pZWjFSZGE5?=
 =?utf-8?B?R081aHJlNHByenNjb2VaZUlwY2RpeG9GcEo5ekd0U3E4QlJWRjcvTG9KZXlC?=
 =?utf-8?B?TWdQYmxmSmFtOTlUMFNGQWphZS9qUFpZdGhXQWFFbmdPOVV6RDJkMGp4eFJW?=
 =?utf-8?B?SDlOSGVxRDJNQ0ZhMldzQlc3Ym9nU1M2WnUvWVRMNmxEd1ZqVmVaSUN2RGFQ?=
 =?utf-8?B?ZFRCT3JCVEZobVl2OXlRSHpYUE8zYy9ObjB3V2EyWVlVSTVjck1ZV3cyRHo3?=
 =?utf-8?B?RXJaR0lZU2RWRGVYcEJDUldDMlNubXNFY0F3YUJCanNaMkRyNHVGNm5WYlNC?=
 =?utf-8?B?V3VFK0Voa2FERnJqUWF2bWNldEJTSjBBWXJxd09Rd2orU1NqRmoxSW9zMExt?=
 =?utf-8?B?TndYWGtVUzlkMnZka1g0Rm9lQm11NWE3dXBHcERXMmRDbVc5aU1GOVM4Tm03?=
 =?utf-8?B?cHZZTEVxSnE4WVVlaUpjaUN6RGhLSXdmaE5zZDBiV1lqQzljeDJua1NZQ0I4?=
 =?utf-8?B?elU4SUJRZTJIaUdxVG8rYmtsVzR0NnZocEU5R1RUSG1zdEY4UVl4YzdlNkNk?=
 =?utf-8?B?S3RtSUd6b1N5WkZTSTdmZGptZlVtZW1GUlc1LytXK3FRaDVBRkJtMUV3cEs1?=
 =?utf-8?B?R0NvM0NQTlcyYlJaQWs3T3V2YUliY2hLTHhuYTIycmVtSmN0dG54WklEdm1N?=
 =?utf-8?B?Q1FNUENwRUtZSjBzVDZVSGVIOEliMFNQRGlTck41OHhnc3hyNUVRa2JwL3BO?=
 =?utf-8?B?VmJNdzVxQWpvSWMxVWh5cU9hQVRRSFJBOGp2Z2NNZHpqa3VncFV2ZW9qNzZv?=
 =?utf-8?B?RVJ4TFh4eUlZVWMwM004UkhmelkrdVlaeXUyQWphdmF2TU9ZdWtJLzBhdStz?=
 =?utf-8?B?MHdkSjBLYVJwL0tTMm0yK09MUEdHOUdkY2hJUm1NRkpSb0lBTDNhNk5BRjdC?=
 =?utf-8?B?eWI1OW9sNG9laHF0akRwM2FkM1pzeUhFTTFTejlmQjNUVS9XYkhnSlFJYkRL?=
 =?utf-8?B?dzdkM3pCdDdtUkIwVTBYQ094K0w3N1lnaW1xcTNMb2R6ZUszOTJ3SG1XNXha?=
 =?utf-8?B?T2w5dWxzWWNDaWNCRFN0cWIxY2VBQTJ6MmFJblhRam1aVXVOTlNpVDZidC9l?=
 =?utf-8?B?V3hNZlVRazlEcnlZbXhWOE4rTmhGMHVSNk9mZ1pQVEJBU2VmS2sxa3RNb3dD?=
 =?utf-8?B?Uk9YOS9BMUVRNVhKMWJ3cENsWG9vRVBNUSt2UlVveHoyN0hwb1NxVzRQcmFj?=
 =?utf-8?B?d1hZR0xqM0pPVE9qcEltQjQzRTVDajJjbWM1SG92RHVWSVNIdmplMis0UVFW?=
 =?utf-8?B?RmY3OEozbVVWc0Q0ZUhSRGlXMEJLSUloWmE1bThNTTN0ODc2OGpRWExaUER6?=
 =?utf-8?B?WW5QVzQzRllLZTNPNy9pQmVzOGYvZVo0MVJpSVVMQlljVENmVUw1ZXhnZUs1?=
 =?utf-8?B?S0gyM05VMVhvMjhYNHd6cG4zd3pCME5jYUZpcCtwTm84QndtbEkwRlNiMTlx?=
 =?utf-8?B?U2p5QW4zRVR2TytnaUpINXlOY3IyYUpiV01CZGgwd2lrZ1ltbUoxL0plbW01?=
 =?utf-8?B?blBuY2E1TFk0TE9hcjJhWEg2MzBiR24zZERadjdiMm5XaHgzdUFpMi9CQUZB?=
 =?utf-8?B?dERMYVBJa1N4eDFHSW9FQzR3TnYvbnc4REhnRGlvS3hsdUhoVU5zUTR5ODNh?=
 =?utf-8?B?cjNGTnZ5akw2c0xXMWphTUhsb0Qzem9qZ0hlVHVlM2dKMHFLamg3VkdVNzBS?=
 =?utf-8?B?TWhKemdFR0J3TFNFT2hubGxkbEJzY0g2RVZnUG8rcVE3SllNQXU0cVo1SDMv?=
 =?utf-8?B?dWY0ejhHWVRrTk40TzlrS3lzQm1ncW1kYWI3L1lmV2w4WjBlZHFPS3BOUURh?=
 =?utf-8?B?YW1HRldWZWl0SVN1LytHdHNYSGdYK3A3aEFobkx2Tmd6NnJ5MXpSNG5qV2hp?=
 =?utf-8?B?RHltMWhHaDFmK0gwQXFmR2tSQ3FuNUFGNHV3anMzQzVqOUNDZ1NnRzdlWWk1?=
 =?utf-8?B?dlpGdGl4T2M5RlBMbHFVUUxabnFPaTF3cjZZcWI3OVNXckdsZk5UR3p3RlNX?=
 =?utf-8?B?VWpTL2M4cGthZ0ZDN1JBSGFQVjV1QXc2dlJwRFZTd2NOZlZzeGpnVDhpMG5u?=
 =?utf-8?B?QU9Xa0FDTElDbW1pRGp0K0JrdWgvSVlJKy90V3pKNGxldDhKS0hrTDQyRk5L?=
 =?utf-8?B?VkRnMHZFbTVtSWhGTVFpVUZidGx1enUrWTJJUllMOVpiSUNGOFN3RVRUenha?=
 =?utf-8?B?S2FGMjErNkp0MlY5TzYrOTdYYkVsQkRLZ1hmYlE4RTM3UGhBdXVDa3pnam5S?=
 =?utf-8?Q?dNC2tahkAwKAIGH4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A85A537BC188F9488A5EA5C7D0D3BFF6@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 959f14ce-0c86-40ca-6e5c-08de6e242206
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2026 12:57:40.1793
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zbmQNnhG6YMkBeCOPbCp6jIDm9uJ+efICrwgMT6p1u6ErWhqOAvrThMsoie1ehr7xdsbYDzoIOwP2dxrmo783mZZ7ogvdpsQH2uv+UnJYwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR10MB8146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_045746_804660_5C73D7F9 
X-CRM114-Status: GOOD (  24.95  )
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

SGkgSnVkaXRoLA0KDQpPbiBXZWQsIDIwMjYtMDItMDQgYXQgMjA6MDMgLTA2MDAsIEp1ZGl0aCBN
ZW5kZXogd3JvdGU6DQo+ID4gPiA+ID4gQ2FuIHlvdSBwbGVhc2UgcnVuIGEgcXVpY2sgdGFwIHN3
ZWVwIG9uIE1NQzEgYW5kIE1NQzAgaW50ZXJmYWNlcyBsaWtlDQo+ID4gPiA+ID4gc28/IGh0dHBz
Oi8vZ2lzdC5naXRodWIuY29tL2ptZW50aS9mNGE3M2E4MzIzZTQ0YmY3MTdjNmQyYzUyOGM0OTlj
YQ0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFRoaXMgd2lsbCBnaXZlIG1lIGFuIGlkZWEgaWYgd2hl
dGhlciB3ZSBzaG91bGQgYmUgdGFsa2luZyBhYm91dA0KPiA+ID4gPiA+IHJldmlzaXRpbmcgY2hh
cmFjdGVyaXphdGlvbiB3aXRoIFNUX0VOQT0xLg0KDQpJIHdhbnRlZCB0byBhcHBseSB5b3VyIHBh
dGNoIGFuZCB0ZXN0IG9uIG91ciBIVywgYnV0IEkgaGF2ZSBzb21lIGRvdWJ0cywgaWYNCnRoZSBw
YXRjaCBtYXliZSBtaXNzaW5nIHNvbWV0aGluZzoNCg0KLSBhbTY1NF9zZGhjaV93cml0ZV9vdGFw
ZGx5KCkgdHVybnMgb3V0IHRvIGJlIHVudXNlZCBpbiBhbnkgdXBzdHJlYW0gVS1Cb290IHZlcnNp
b24NCi0gbmV3ICJvbWFwIiB2YXJpYWJsZSBpbiBhbTY1NF9zZGhjaV9leGVjdXRlX3R1bmluZygp
IGlzIGluIGZhY3QgdW51c2VkIGFzIHdlbGwNCg0Kd2hhdCBkbyBJIG1pc3M/DQoNCj4gPiA+ID4g
VGhlIHBhdGNoIHdhcyBhIGJpdCBicm9rZW4sIGJ1dCBJIHRoaW5rIEkgbWFuYWdlZCB0byBhcHBs
eSBpdCB0bw0KPiA+ID4gPiB2MjAyNi4wMSBhcyBpdCB3YXMgc3VwcG9zZWQgdG8gYmUuIChtYXN0
ZXIgY3VycmVudGx5IGRvZXNuJ3QgYm9vdCBldmVuDQo+ID4gPiA+IFNQTCwgSSBkb24ndCBoYXZl
IHRpbWUgcmlnaHQgbm93IHRvIGRlYnVnIHRoYXQpLg0KDQpbXQ0KDQo+ID4gPiA+IEkgYXR0YWNo
ZWQgdGhlIGJvb3QgbG9nLiBJdCBkb2VzIGJvb3Qgd2l0aCB5b3VyIHBhdGNoLiBBbHNvIGNhbiB0
aGlzIGJlDQo+ID4gPiA+IGFuIGlzc3VlIHdpdGggZGlmZmVyZW50IFNEIGNhcmRzPw0KPiA+ID4g
DQo+ID4gPiBTb21ldGhpbmcgZG9lcyBub3QgcXVpdGUgYWRkIHVwLA0KPiA+ID4gDQo+ID4gPiBD
YW4geW91IHRyeSB0aGUgZm9sbG93aW5nIDIgY29tbWFuZHM/DQo+ID4gPiANCj4gPiA+ICMgbW1j
IGRldiAxDQo+ID4gPiAjIG1kLncgMHhmYTA4MTBjDQo+ID4gDQo+ID4gRmluYWxseSBoZXJlIGlz
IHRoZSBvdXRwdXQgZnJvbSBib290IGFuZCBleGVjdXRpbmcgdGhlc2UgY29tbWFuZHMuIEkgYW0N
Cj4gPiBub3cgb24gdjIwMjYuMDQtcmMxIHdpdGggeW91ciBzd2VlcCBwYXRjaC4NCj4gDQo+IFRo
YW5rcyBmb3Igc2VuZGluZyBvdmVyIHRoZSB0YXAgc3dlZXAuIEkgY29tcGlsZWQgYSBjb21wYXJp
c29uIHRhYmxlDQo+IGhlcmUgdG8gc2hvdyBhIGJpdCBvZiBkYXRhIGZvciB0aGUgdS1ib290IHR1
bmluZyBzdGVwOiANCj4gaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vam1lbnRpLzVkNDJmMWU0M2Zi
MzU3MDgzZWFhODEzY2ZlZTQ4NGE4DQoNCklmIHRoZSBhYm92ZSBkb3VidHMgaGF2ZSBhbnkgc3Vi
c3RhbmNlLCBtYXliZSB0aG9zZSBhcmUgbm90IHRoZSByZXN1bHRzDQp5b3UndmUgZXhwZWN0ZWQg
YXQgdGhlIGVuZD8NCg0KLS0gDQpBbGV4YW5kZXIgU3ZlcmRsaW4NClNpZW1lbnMgQUcNCnd3dy5z
aWVtZW5zLmNvbQ0K

