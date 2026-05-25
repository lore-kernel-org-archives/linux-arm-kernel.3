Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD721CD5BBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 06:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5gpO/m5U6dhG1Fw6pNJX/0AuIuOPrHKn8DHFiNGEli4=; b=NhUVuC250dbm7O8akgxnTz9wWW
	dzm5uwFttj4nhfsTREgQRpyCtq2auDnOBq5BKth1zo9f3UKNxrYCYSn7U/XYGQNJJZyuyzP4S6XK1
	AxRrMTPQ9DbbrKCO03Jh47PzOhlCYmW7UBa2tqNURAJKGw/Bl3rP4qpmLg3SOOrDbxIYugKnjM+mQ
	dzSfr8dOJwRiqyaHGbbV7CKNV1miw/GAdzkl9FSOPBXvX5T++HEzUbKct69onrS0ffvlVfx1TPwQH
	MSDmJjS7FpOqmBxbhzVtr1sxa0UK+Jb9Qs9n/E5jZakU38puR+4VhusN2FIc3kPgGKiWAYeWA7pC1
	shoIrhEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wROvP-0000000GR8A-1M4a;
	Mon, 25 May 2026 06:36:31 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wROvN-0000000GR72-0hbm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 06:36:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=du02nio4LGD/YFNZujDdEbjqZFBJxS56BgIjEaOCbJQjXLLjS0LEkrFbACAw3K6Pk2VX/N3C48YW7KPNFq0XYBQvfOrGi98iDV1AFXrcIq6CqDuRBxYzA7mgulykwPS4KrNmd2QcNaYNIlbwsqCQ20ogtRtcnu1774OamHpMXJRsrdEMWfwgfhhvBDQZjkkXP2LoA+7N1vTkRkLLbwSYmZrMMR2E0TjLGOV08y9KSB9Rz3agwGt6v9PDRYLeJd4lCJ/XR1arASK7WVt4RCObf1ML5ZbTVCEISE656yzYbtPCnnoULprADUPVuBQiNuWebX6TuFoG3f0k2HUgSBKxPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gpO/m5U6dhG1Fw6pNJX/0AuIuOPrHKn8DHFiNGEli4=;
 b=knwSaiAWdKl1go4vyvdtpDrN3O0x9Ye7JmnHSqxvRbk2+SEVqyKwS3TN3cVJeVzZPQRgrYs5xY+kQZ5CN0gai2DPZX/sVRo6x3PHTaguMb8A3tC7LDjUQluSwc5vvw0D4KmLAxjQAWYZuq2tJdksniUeHmwIS1MoABNSTNEUcC4XUrsMJ2ptpU/9y/SxTVWCWeYfgro4KXT6gWRKDxSW7OWe2R4wcPdwdTb7dd84rkFimwJYk9/7VVRGsuwickN/WyOAdnIi1mMh/Oro1S3TXxYE0k0k62cYnlAepD3slHCTpo2AsxOXg+S23697Eu1SECDqFGhj75yTfOY1ILmDRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5gpO/m5U6dhG1Fw6pNJX/0AuIuOPrHKn8DHFiNGEli4=;
 b=eFVhnlAsTdnUwyK5APAJ21R3tp+E8ATOO2EHyuM6/GeGWVRpVkpeswUMiOg2q8oWANAtZu63nqdmof6p+UjOD341WWmVKVIflGVc2+Ux8CPr+ALknFtnR/bBab8f26stXvvVsGerqclIq/g+H85rRItctIn8ksVjnrRM/27SOgTipPMqUZNVj+6cGPH6swzwNrwOaUM78BtYyGOE7go1pwCjLbmLDQmDKvTYfyttDHWmHepCyIGbuFztIuQq/QPYKOX/SP8JcLPQS1c5ZbYoveeETwu1GzgmhR8hINwVOHVFb/sAiFLsBd3QJUCs++XQUCQCLA8PS/AsZkyR3YzhuQ==
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5)
 by AMBPR04MB12336.eurprd04.prod.outlook.com (2603:10a6:20b:732::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.18; Mon, 25 May
 2026 06:36:22 +0000
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035]) by GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035%2]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 06:36:22 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frieder Schrempf
	<frieder.schrempf@kontron.de>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH 4/7] firmware: imx: ele: simplify SoC device registration
Thread-Topic: [PATCH 4/7] firmware: imx: ele: simplify SoC device registration
Thread-Index: AQHc7AiOjcnZYatpx06yhN10/ipKP7YeRRFw
Date: Mon, 25 May 2026 06:36:22 +0000
Message-ID: <GV2PR04MB12271F6C4AE26BC37B19BE8DE950A2@GV2PR04MB12271.eurprd04.prod.outlook.com>
References: <20260525-ele-v1-v1-0-a9570c4bffc9@nxp.com>
 <20260525-ele-v1-v1-4-a9570c4bffc9@nxp.com>
In-Reply-To: <20260525-ele-v1-v1-4-a9570c4bffc9@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR04MB12271:EE_|AMBPR04MB12336:EE_
x-ms-office365-filtering-correlation-id: d85b1d2f-ee32-4eee-af04-08deba27eff6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|38070700021|22082099003|18002099003|56012099003|11063799006|4143699003;
x-microsoft-antispam-message-info: 19Hgvo+zQkgANNUP6eEx3VjHaw1lgPG8OGABIY1PQ+ym5DNyIo8LvPqOC6LZfQgL8GvZ+cKbMp04u3EBYmILoq19ACW7Fn2Qh2ZvFb3djyuyFIy4mziM5KftKxi5hcLoJbxLIvM65bhnSB0Om272ieGvim9Wt0dsNzvm+omvv0CVz2Sq/ORUuF/kf81115gB2rZPvPS+ji/zeiUEOEr6TD3Jtkp/WQvydAS4LdcdIbcGWstL4lu82Hlm7R/jBT07+fqCX6ZAax1HUztRp3pYPfXXJ6KovIzXTBMxnSMx+jQOLIwTcjuBSihQf/pCo/ZHXHjgwMT8x5a7vfF8Q5eqoHHEwIM6kF6W87JHNrxp7yo11N28FK/jyMEr4cl4FC/tO3gm5br2hsM5CUWH0xPBMv5trI9Lo0NlDo0+AcIhHZL1poWubm58OrmWvOfQeDwbJXNcFjrgiOKltGzrti7NxmYhm3PhXFJds0bEnb8kqEz1Qo0D0LzPHxhaJ0HRos0S0VQXhjrzV5FEX/5PnM1P5c4pcS+KU0L0JX9h7MFsGTBWGA+GMuP1FAP2Yir9vZ6LTxcOu7apqkRVq0JL8kZPXgj06W0SMYbcOb67ioaaa3LhtiKsi/E598l9wyktD7X9tiFDazQ94WJnMD1GPzzWwzum8xbOD8+efpCTNVk/UAMRpGs0k0gWdLLYiUrOC7mwtdpbljtJfmvhRv7Gp92FrNCUgPJLlTnRGQCMqts4DphQ9NFzUbPSBY50O71TK2te
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12271.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(38070700021)(22082099003)(18002099003)(56012099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R3V5VFBQa21qWVQyYmhxYXZGcDVlbFR0YW5McVV0M3BCUDEydVZ5OFpwZFJK?=
 =?utf-8?B?VDluMW9YVzAvWmVsY0ZmYTRDdmRlZDBxaVJlUmhIbDVMVklmZ1pnSGtNNHBV?=
 =?utf-8?B?aDRtTSs5aHdody9xc3NEQ2xrZVdXcGxOazFCV2JRNGNDbGExVHdvZFdCMGxl?=
 =?utf-8?B?OWhtRmJSS3V6N1ZnaEhoY2ozSEw0OGwyaDFGbG1UbWdGb282ZVFqdzhUdUMw?=
 =?utf-8?B?UkprTlBEU1VFejB5Z2NHempVSEpjenhIOWdWN3BselRtejdlNzZaeGtyRFRr?=
 =?utf-8?B?TVREZlhhZVNwb1JKQlh3eFVPc2t2ODRPSytZUk1WdFB1ZUV2cXl2NHFoampo?=
 =?utf-8?B?TlVXdGZGcEZwMHJCVjh5RWZpeVhYZXJ6NEdBSUxaRmJFd2k3VXVtQ2RvQTdh?=
 =?utf-8?B?WTgvK0x0ME5obm52SlJjSStsVDRyWklwUm9xVXVnYWw2SmppTmhzQWZMdUo0?=
 =?utf-8?B?dE5OUm1ZcFZlQXBGY2h0Q3F0TFp3SW9tY1ZaSGxVTDZmaExqc2pzOUdwbGdE?=
 =?utf-8?B?dlg0aGxIVDhtbVpramxJbElZdkNHR1MxbmhEallYbldjSXF4UXo2SzZ5SWlu?=
 =?utf-8?B?a3VFRnhVR0V2ZS9BQ3hVZHU3TVRPSVNqczh4ZHBRUk1ablVvODVwUmUyYjla?=
 =?utf-8?B?MUErTGM5UTFSK2NtV0VuQk02R1NkVjR4MjJhaFNkM3NOUGJwaGlVaTZnem5B?=
 =?utf-8?B?bmtsZWNaTC9IaVBtVWR5MkFJUDJUcjh4UXozTUcyWnV0YXlJQ1A0QVhUN0tS?=
 =?utf-8?B?V3VzaEIxckw2bXJ0a2h5MytFTGZWd1I4NWdNOU5JN01RcWNZd2xwWHVzdW4w?=
 =?utf-8?B?UXhuZXJ5ck1IN2l0OHVxbWZpWHJXTEltYnkydFF5QU9TTUFOcUJZTzdmczVz?=
 =?utf-8?B?cWpjUUZITG53ZGdnSDNyYjdINjJjbzdxVXExS0xibTF1RjROemtsbmRwS1pH?=
 =?utf-8?B?b2tXT1h3S3Qwa0o4aFVoLzNvK0tyU2JWVWl0MWJxN0JaNVVGNzBoOFZyZE1E?=
 =?utf-8?B?MG1ISllyam5EdDJBUkdnejVORXprRzN6Tjdmc3ZXdEFqZkJMeDhCUHFNU1dz?=
 =?utf-8?B?SkRmMkU0QVQxT0t6VFFSQTRtSHVxeDhZdklGU2FkOG8rcVlFVWVvYWE0R2JR?=
 =?utf-8?B?VUJDclNpRG1tNW8vN1d5b2JuaGxGanVRRG8yTTZuMGprdmJZdlh3TmhOdGVI?=
 =?utf-8?B?U2w0RzFjNUNuWFp0QW5PSkt1cnQzMVg4c3lQTXlKR0pXNVJFUTRmbDIvb0c5?=
 =?utf-8?B?NjlYZ3lyV1lhVzJnLzEwNjZwbmdTakZLaWc4V1BQL1NTeUJCTU9vVm9PaUlC?=
 =?utf-8?B?L3llWVVQWUV5S1c1clUzOGVqa1FTZWs2Q2cybjM3eS9FUHgwQVh1RFp4MmtV?=
 =?utf-8?B?dmZEQzJKc1Rxa2ZnL0hwL2tKNS90NnJScWpSMW5ua0NhU3dlUzhYUmtET2VZ?=
 =?utf-8?B?V1dSZHh6b2IwZ3hZbEc4WTcxMmxlSzh5aE1mWDhQUVJSVnhIU3dCVHdvV1lE?=
 =?utf-8?B?b05aVks0a3dEaDYxeUE3UUltMWJUamxUcGZQZHFnZ1R5aDhUdUtvVWdIMnY1?=
 =?utf-8?B?Y0xleXdWcFkrdDNJM2duVThDdFVDQkNaQThSWHRIdDFRVmZTSWRqVnZtTFY3?=
 =?utf-8?B?V1dKNFEzcHpQaDVHWjhkdHdtcVpBcksvSEpFcWxLbHk2aUR6dHVwS3ZrWFJE?=
 =?utf-8?B?UlRFZ2hoRnZWU3poZURXQnlQbWxPdDNseFU5MXNtTWdUS1cvT0Rxbm5qZ1hZ?=
 =?utf-8?B?V2x4a0UyNFNWdG5Md3N2dTh6VjhwdWdhSUJiZXB3SUlXT2lUZjNLVWRpclJN?=
 =?utf-8?B?T3lSMHcxSmFwWWJYb1lqeldTTW5ROEdGY1EvVUVrekpRamhPbFVGTGRMTmxM?=
 =?utf-8?B?SnVXa1p1U1BqMEpTWGZpOUg1M3o0LzJSZjg3R25yS3lOdlR4cTJXdEFYVy94?=
 =?utf-8?B?ZEplOUdLTVlRVkZ1dDJ2ZXZTRWFzVENKWURQZGNKeGRNL1lUZWRPSmJsUnd2?=
 =?utf-8?B?dGo4WTNMTFRUNWt5RWFoblpGdU16SlVDSzBSWWx4VnI5Q2g4NU9SdUZmb3hn?=
 =?utf-8?B?NFYraVlxdGJ5bTFFa3NNc2M2d3F1M2VlMVppTFdNZlg5NDZIWUJZV2lqdDRs?=
 =?utf-8?B?amJDcjlpRElUeE5MRkdpbTBrL2R5WWU5QUVzQ2NVQWtHaExxK3RSUEZNd3dx?=
 =?utf-8?B?Q2tsOUFGSzEzdXhuaFIzYk1oeGUxYmhIRHR5TUpGSHZUVjJNRkVsMXU4dkZr?=
 =?utf-8?B?ZXRLZkYxN3BjbUF1eXYxSm1YQTFVdkh4UU9iVVFRNEtaYncrZTliNVBocWY3?=
 =?utf-8?Q?1LIIAHjWgmh04K9Jco?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12271.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d85b1d2f-ee32-4eee-af04-08deba27eff6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2026 06:36:22.5253
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 81FydnljCGJbBhnpNiXj4P6jfrbZoiBJmpCq+BOJthfuicc+OlfzlX81r5S+BMNVbNqJwTB1+V+r/0BpJolBbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12336
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_233629_209589_03EFAD1E 
X-CRM114-Status: GOOD (  23.14  )
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGVuZyBGYW4gKE9TUykg
PHBlbmcuZmFuQG9zcy5ueHAuY29tPg0KPiBTZW50OiAyNSBNYXkgMjAyNiAxMTowOQ0KPiBUbzog
RnJhbmsgTGkgPGZyYW5rLmxpQG54cC5jb20+OyBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0
cm9uaXguZGU+Ow0KPiBQZW5ndXRyb25peCBLZXJuZWwgVGVhbSA8a2VybmVsQHBlbmd1dHJvbml4
LmRlPjsgRmFiaW8gRXN0ZXZhbQ0KPiA8ZmVzdGV2YW1AZ21haWwuY29tPjsgRnJpZWRlciBTY2hy
ZW1wZiA8ZnJpZWRlci5zY2hyZW1wZkBrb250cm9uLmRlPjsNCj4gUGFua2FqIEd1cHRhIDxwYW5r
YWouZ3VwdGFAbnhwLmNvbT4NCj4gQ2M6IGlteEBsaXN0cy5saW51eC5kZXY7IGxpbnV4LWFybS1r
ZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc7IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggNC83XSBm
aXJtd2FyZTogaW14OiBlbGU6IHNpbXBsaWZ5IFNvQyBkZXZpY2UgcmVnaXN0cmF0aW9uDQo+IA0K
PiBGcm9tOiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4NCj4gDQo+ICdzb2NfcmVnaXN0ZXIn
IGlzIHVzZWQgYXMgYSBmbGFnIHRvIGNvbnRyb2wgd2hldGhlciBhIFNvQyBkZXZpY2Ugc2hvdWxk
IGJlDQo+IHJlZ2lzdGVyZWQuIEhvd2V2ZXIsIG9ubHkgaS5NWDhVTFAgcmVxdWlyZXMgdGhpcywg
d2hpbGUgaS5NWDkgaXMgaGFuZGxlZA0KPiBzZXBhcmF0ZWx5IGluIHNvYy1pbXg5LmMuDQo+IA0K
PiBSZXBsYWNlIHRoZSBib29sZWFuICdzb2NfcmVnaXN0ZXInIHdpdGggYSAnc29jX25hbWUnIHN0
cmluZyBhbmQgdXNlIGl0cw0KPiBwcmVzZW5jZSBhcyB0aGUgY29uZGl0aW9uIGZvciByZWdpc3Ry
YXRpb24gdG8gcmVtb3ZlIHRoZSBzd2l0Y2ggYW5kDQo+IGkuTVg5MyBjYXNlLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVy
cy9maXJtd2FyZS9pbXgvc2VfY3RybC5jIHwgMTUgKysrKy0tLS0tLS0tLS0tDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2Zpcm13YXJlL2lteC9zZV9jdHJsLmMgYi9kcml2ZXJzL2Zpcm13YXJlL2lt
eC9zZV9jdHJsLmMNCj4gaW5kZXgNCj4gOTMyN2Q0N2U0MzEyZTdmMzlhNWY0ZmMyNGRkNzM1NjZh
ZjI0MGE5Zi4uMzBlOTdhNjA0ZWNhMTM3ZjQ1ZGU2Yw0KPiAzMjkwODFmYmEyMzQ2NDI3MzIgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZmlybXdhcmUvaW14L3NlX2N0cmwuYw0KPiArKysgYi9kcml2
ZXJzL2Zpcm13YXJlL2lteC9zZV9jdHJsLmMNCj4gQEAgLTU2LDcgKzU2LDcgQEAgc3RydWN0IHNl
X3Zhcl9pbmZvIHsNCj4gIC8qIGNvbnRhaW5zIGZpeGVkIGluZm9ybWF0aW9uICovDQo+ICBzdHJ1
Y3Qgc2Vfc29jX2luZm8gew0KPiAgCWNvbnN0IHUxNiBzb2NfaWQ7DQo+IC0JY29uc3QgYm9vbCBz
b2NfcmVnaXN0ZXI7DQo+ICsJY29uc3QgY2hhciAqc29jX25hbWU7DQo+ICAJY29uc3Qgc3RydWN0
IHNlX2Z3X2ltZ19uYW1lIHNlX2Z3X2ltZ19ubTsgIH07DQo+IA0KPiBAQCAtNzIsNyArNzIsNyBA
QCBzdGF0aWMgc3RydWN0IHNlX3Zhcl9pbmZvIHZhcl9zZV9pbmZvOw0KPiANCj4gIHN0YXRpYyBz
dHJ1Y3Qgc2Vfc29jX2luZm8gc2VfaW14OHVscF9pbmZvID0gew0KPiAgCS5zb2NfaWQgPSBTT0Nf
SURfT0ZfSU1YOFVMUCwNCj4gLQkuc29jX3JlZ2lzdGVyID0gdHJ1ZSwNCj4gKwkuc29jX25hbWUg
PSAiaS5NWDhVTFAiLA0KPiAgCS5zZV9md19pbWdfbm0gPSB7DQo+ICAJCS5wcmltX2Z3X25tX2lu
X3JmcyA9IElNWF9FTEVfRldfRElSDQo+ICAJCQkibXg4dWxwYTItYWhhYi1jb250YWluZXIuaW1n
IiwNCj4gQEAgLTE2Myw3ICsxNjMsNyBAQCBzdGF0aWMgaW50IGdldF9zZV9zb2NfaW5mbyhzdHJ1
Y3Qgc2VfaWZfcHJpdiAqcHJpdiwNCj4gY29uc3Qgc3RydWN0IHNlX3NvY19pbmZvICpzZQ0KPiAg
CXZhcl9zZV9pbmZvLnNvY19yZXYgPSBzX2luZm8tPmRfaW5mby5zb2NfcmV2Ow0KPiAgCWxvYWRf
ZnctPmltZW0uc3RhdGUgPSBzX2luZm8tPmRfYWRkbl9pbmZvLmltZW1fc3RhdGU7DQo+IA0KPiAt
CWlmICghc2VfaW5mby0+c29jX3JlZ2lzdGVyKQ0KPiArCWlmICghc2VfaW5mby0+c29jX25hbWUp
DQo+ICAJCXJldHVybiAwOw0KDQpSZW1vdmUgdGhlIHNvY19yZWdpc3RlciwgYWxsIHRvZ2V0aGVy
Lg0KUmVwbGFjZSB0aGUgY2hlY2sgd2l0aCAic2VfaW5mby0+c29jX2lkICE9IFNPQ19JRF9PRl9J
TVg4VUxQIg0KDQo+IA0KPiAgCWF0dHIgPSBkZXZtX2t6YWxsb2MocHJpdi0+ZGV2LCBzaXplb2Yo
KmF0dHIpLCBHRlBfS0VSTkVMKTsgQEAgLQ0KPiAxODEsMTQgKzE4MSw3IEBAIHN0YXRpYyBpbnQg
Z2V0X3NlX3NvY19pbmZvKHN0cnVjdCBzZV9pZl9wcml2ICpwcml2LCBjb25zdA0KPiBzdHJ1Y3Qg
c2Vfc29jX2luZm8gKnNlDQo+IA0KPiAJRklFTERfR0VUKERFVl9HRVRJTkZPX01BSl9WRVJfTUFT
SywNCj4gDQo+IHZhcl9zZV9pbmZvLnNvY19yZXYpKTsNCj4gDQo+IC0Jc3dpdGNoIChzZV9pbmZv
LT5zb2NfaWQpIHsNCj4gLQljYXNlIFNPQ19JRF9PRl9JTVg4VUxQOg0KPiAtCQlhdHRyLT5zb2Nf
aWQgPSAiaS5NWDhVTFAiOw0KPiAtCQlicmVhazsNCj4gLQljYXNlIFNPQ19JRF9PRl9JTVg5MzoN
Cj4gLQkJYXR0ci0+c29jX2lkID0gImkuTVg5MyI7DQo+IC0JCWJyZWFrOw0KPiAtCX0NCj4gKwlh
dHRyLT5zb2NfaWQgPSBzZV9pbmZvLT5zb2NfbmFtZTsNCj4gDQo+ICAJZXJyID0gb2ZfcHJvcGVy
dHlfcmVhZF9zdHJpbmcob2Zfcm9vdCwgIm1vZGVsIiwgJmF0dHItPm1hY2hpbmUpOw0KPiAgCWlm
IChlcnIpDQo+IA0KPiAtLQ0KPiAyLjM3LjENCg0K

