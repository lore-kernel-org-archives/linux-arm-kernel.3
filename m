Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C53C02185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 09:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h6wxAfwijUWH5YAUvDQ2GVNNTvVc/xiZ5ehGeCHAcbM=; b=owg6KiT1NfpYNpoh9kuXyyHwEO
	J7MCy9K/qOIoEXnOlJiNsqP3FHrikNkEj8xmxqqrtfae1wkhcMBWumk9SHri6vZP11pYUOxmYBVsY
	o+3nQnxQ56zNA3tHuEdtaQImLZaysY3JzKdQ5aO1H99T1zNThML5K3U5N3wvMYkg3lICvLJBIIHq2
	XnUXQ4YKP151GKOiEU3FhbuwXuQplMI2+Z/xtWLl/vu7ksvcW3vbGX2+8fz4O2X2DP8vLUINVFvqy
	nQsLr8EXCE+1Up9TbeyMBkeSmrrXHsa3YO4VjKmImYHfn2VIhYiiVQgI8Av7dTH2DOIkcWCveTZTR
	CLZtJw0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZoQ2-00000005ErH-48F4;
	Mon, 20 Jan 2025 09:50:06 +0000
Received: from mail-am7eur03on20602.outbound.protection.outlook.com ([2a01:111:f403:260e::602] helo=EUR03-AM7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZo3F-00000005Acn-38tN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 09:26:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TwVS0bs9RxyJ6csuZTTsdXH4tN5wwnrTnRUVwF5wYG7xx4cWN9qRfk9WO6pSp13ijWV69yzD9wSl8O6a/hSbO7M0i/fgVPOFAxd6CSWw/ca/crX3YHxlVsAruScD75Mubmv+UMKAaoMdjVYTBnmaXUrY0X0dRwvkhp2S50EWv0YZTHaCNQHLVmT8cw0zq0J5HKqtS8hyBQjwpRDKx2mlji/z3+ngnQAvWZVQluHjaB1lIBPfhMaYrHk9/DQz6pRIQWBtzFqFFUBrk7uZI8JrwySwCiyIDQYwYGw0LR+cgM+EH/iJL6zUezFrv5MlUOdoV2cEn7fmigCCrQq9aQ1ZMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6wxAfwijUWH5YAUvDQ2GVNNTvVc/xiZ5ehGeCHAcbM=;
 b=cyM+fYqSrfVkwpL0RJ2CK5I0Zm60GOikus4fR3xKmlagBwUjVbattuXQfCcFuIxGERtmW6dy1nJoYslWEzsZmKxNgcxTTw5bkrwczJ9O0YaaBHsNF1WgyeJtAh5T9AruA6C2w9q/VevlhWaU7NsQSwVjrzMvEFtxdjCplT8trYOnuMUj5vftI65j3GLJSedmFs1zJRONP9GmGqe2/iIatUYKJVPhyS6rOZgJA0evdA3cMcjmSq9ujdSrsnE9W1grI+Hq21DV5bA5kVpDImUnBDF1HI5zzTXO6qTAjNmvTEJ0rLvH2hmrsViPwPzNgukFRVh5JJjDAw/0H9ob+ZIbcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6wxAfwijUWH5YAUvDQ2GVNNTvVc/xiZ5ehGeCHAcbM=;
 b=CHW3zvNV3oAaDQJ6iJP55xUWoDYwfEhQg1BJqGuZAs6irekSLIqNvdh5G1XsopC3yIUm6fUabRR8gPLWLUwAIOYFbdSG7F0yULeuhTHt1E5Kk0clFg19QD10CEiAVQm/6pbMwHEScEn414B3iNwOtbvCqicc3bMLd+DASwTQiiFeFL2gODqTEwXnxvELqPI4jVNIFTk6jXBmQM0pGzvbnAi6egPvMdvnVeiRdhsatcPsuwGjbjPcBPeroKzcI4KjU5/XYSCYaOKhhcCULqPhgo2nm5UUAjAuPz4Cd5jJsFH3FXiBIh+JXRbw9JomqnpjSNeS/UTcXIQkcjgrnp/x5A==
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by GVXPR04MB10731.eurprd04.prod.outlook.com (2603:10a6:150:227::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.17; Mon, 20 Jan
 2025 09:26:30 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 09:26:30 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Conor Dooley <conor@kernel.org>
Subject: Recall: [PATCH v11 2/7] dt-bindings: arm: fsl: add imx-se-fw binding
 doc
Thread-Topic: [PATCH v11 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Thread-Index: AQHbax1jM8ln+GPoYkCK4iQkHe/BRg==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 2
Date: Mon, 20 Jan 2025 09:26:30 +0000
Message-ID: <AM9PR04MB8604D1FBAFA253D2307DFCF595E72@AM9PR04MB8604.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-traffictypediagnostic: AM9PR04MB8604:EE_|GVXPR04MB10731:EE_LegacyOutlookRecall
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b35f1779-a109-4512-c76b-08dd39348603
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?+guqA9oCM/KYV55hLNdKJwP7Dv1ECjCCRGq5tFF1wHaOSbF3wTZvgpltfNQQ?=
 =?us-ascii?Q?RbyAelE8KiPyMMItF0nuTIfQDW3D5qNlEltoOu0jvBOOd1N2sg+KnfPAHGew?=
 =?us-ascii?Q?95GK0X0ow6n9b5ja83BCw2P7N/4ayve0aaC8kIPPpPIHC444qahT1p3sxfOQ?=
 =?us-ascii?Q?EsFC7MYcnz4bKoHu4t0NqI++FH4Uhm0Sli8s5nkxDkCgoLc0YIkRDt/FXHjS?=
 =?us-ascii?Q?Fr3JmOXAyRodqvoV3nPmyaOutmsHb7ZzjhrPycykaBCwnkWijmPI8SEhmxdG?=
 =?us-ascii?Q?QArtcMpaXb2c/YCxSQMBX4JfJJE3ySNyjZ9Ug8O+VSYQGGSllIh/J6WB5cQ0?=
 =?us-ascii?Q?YGnCT61KwK1MPwlU/jSGsyd85EQQ6USJpD2FEikwfApBxZjpw3+srVCZIrLD?=
 =?us-ascii?Q?cyrbn8QBeEqUcVv63QyM90zB8uPb8M7vAgCDvzLrgaIFKahr7opikULpqjXv?=
 =?us-ascii?Q?wYuLEpddmqKelNkHzoWJclAfedY3hil7P7b0T9jO8X6EcFst0TJCdkaxmabY?=
 =?us-ascii?Q?+JVYQ+odpooZITcJsv99IlrhD+2AEf82vk/LOWPHgyg3wqI3bGb9B1iyQVPp?=
 =?us-ascii?Q?TMzrvgRHBtNhxxlCVzw1TL+4huDt8w1Me3YO0ssTizgMdxpBeC2dxkbRVDjw?=
 =?us-ascii?Q?wMglQvdhhuQYieweHYYxrZqY4eQOs+TEocx41aCtQtyMo87E1ioEo1vIAYR8?=
 =?us-ascii?Q?jP918aftZAvzuaujjNsJDbAsQR6rb8/GrF8LyTWIRqnMaHoWvsfe9HApPUpl?=
 =?us-ascii?Q?vIYckWKV0qOyvHiNXK6raflv2OqaBj0x4Thm/XZe4wJor4lV9EPWHNSPFQbP?=
 =?us-ascii?Q?ge+qCdJ1H5+/3Fy3r1Dic0KOcVeVBzByAK52kpZJVGte2kkhDkNewENis9E1?=
 =?us-ascii?Q?2yqv/p/Ws9Woo/L+x2B4x4wUbVFOWICQOFc30+nCFtRpKfJGzlnFkaB69UiX?=
 =?us-ascii?Q?DS8bH8PA/pf1GsBDpMrAHAgcycOMs9VAEtC5bs8yh3KvBSkR/vD/XJZA5PcE?=
 =?us-ascii?Q?+6X6qgjYJznWB7QDOd/Ms9N0uQHRvTFSfdO4No71Zkd95MlwpQRBOKG7Cqdi?=
 =?us-ascii?Q?zbyfE/SmawtB2xv55CGWYVTOIUUqWJ86WPAs20uu34yl32ObvfVlh1Nq7z1U?=
 =?us-ascii?Q?xr59O2zAyw8bMAx23/7wTo6dzb5EmVNYVtJaDwMQIYmX04sqlOHKeBf0cY6N?=
 =?us-ascii?Q?0efky8rFzn5dJ1H3ZYjQ4nbd2q4bxZybhYexMAf3Q+4JtpqHvRC6Pqe0nQqW?=
 =?us-ascii?Q?Yg76B6zqSpzt1gIpsAf3YSiDgxveliZkmC2JZQI7m7Ni+8j5QYfXNv8ceDPX?=
 =?us-ascii?Q?qPz3uA7+QvIVMWuV8yFKKaHb5GlFrnps0sTxGYfks3v75Ab8SqfoOszc/+29?=
 =?us-ascii?Q?Ci8BxikCpIspeVgKYrihz6uDrwbFmsAycaNhH23r8gdqnsO8XMIt8ZTP2JAo?=
 =?us-ascii?Q?1OCpDhenIKWvwqOCianmgch5ZCoV4NAB?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gazU3T/77FzcHOWANNI1ucXCqbbZ9OY7M4veJwfBkRn2wtjg5dOlTjIkH2e9?=
 =?us-ascii?Q?89mpOLZeWbFOBRii1j8GV251QtdVoY3bjqRe8XFZkEdBaSF54s/xR615qqyK?=
 =?us-ascii?Q?hhHKnJ2V1t/GG+eXp4eaBw3M+Hap2ljh+PKVG+FGYWkvad20zEy21NPXLfdr?=
 =?us-ascii?Q?GsVPl8BGlJz9OfYJni24vQWas2k1/vugVaPgSQOHj3gSiIwsoN1Yy47FftME?=
 =?us-ascii?Q?1EaD+Y9cstN1KEXsa3EO+wK1BuD5tGlAT1vaVu2sNfpVv4NXj+JlrXiWE/df?=
 =?us-ascii?Q?4MPn4P9sbiG4kuf+LJJ+S4hfhLEASO5LnH7/EEQz4yCbIp4j66tRWU1vSzsi?=
 =?us-ascii?Q?H6kVy/fH7DYkKyooxC5oqL+ah7BuWJkd5ghwRJDxsHZnj/7D3kdScQCm2qTN?=
 =?us-ascii?Q?3kOZxjiqBUVGAHFrX9kq6qORtjlOn1013OMnbG99KtKqMZG1U2++g2/1TcPv?=
 =?us-ascii?Q?cC7Zl6QVHLwmHobeBH7JRz6Xli4iUkk72l0jemjXYjheW0R8vnD3r751MT40?=
 =?us-ascii?Q?WoEpCgRziMdQcYegdXohdJSEofgeuhOegV5DFMvaSTL79jEDgKVe4328RBtU?=
 =?us-ascii?Q?IdCUjfG8x7QW0zGoAkRoUjgI/eBKqTMTUG0gbR4NfTGPGwa4K4FFjST0gZ/o?=
 =?us-ascii?Q?8oy4URsYXRB8n+KsxnAbILWy42cJD51tLer6QZiWI7L/UX9tb+wBfPz0pa3o?=
 =?us-ascii?Q?h8jxGOtaRex7veql7QyvdvTZL9wrvJfN/5aVFpjjGT5s/W3p4tfVSg+QfSPB?=
 =?us-ascii?Q?2UcqA+dhxnkZuIvU1qifnGq0dWcs8Srrv6grX9KFFdjFb3/DcOfa8RDd5DCl?=
 =?us-ascii?Q?Gtzt0wmbMOdGUfcG2PZTPXRmnS8CUO1n0NztgTqh+2ciOZJQ8DRnKhHHh2uu?=
 =?us-ascii?Q?vwD0yNwaaGwa+YhW/sqNz/KR1qPdAmbdELQ3Uu1ELGRdsPHXp3DnUCml+aHV?=
 =?us-ascii?Q?N4CX0J+POv34F8TAQsZfgfRdJbU6H0tYSTmzSq3hm7WFg2SxmbS41/pLtOgm?=
 =?us-ascii?Q?Ij+C/HMmPCfIqv7Z+Mo+lMFn9cfphM5Sbn3+ab/7m0A6Dknr3DyiJ+aDjBIB?=
 =?us-ascii?Q?UTGtZiAWiodZYL4MIEEUr5lOK5zkXBgzN7qA6BAPgM1/wGgo/vWM+SgEh/5c?=
 =?us-ascii?Q?qJ0jbivLfmFQYO+2P+9lGued1C1QfYOkSdhQCzD+jqAYsh0OYwKvUT0T5aRr?=
 =?us-ascii?Q?laK/Dv/IGkXXu8mJ2jheFgM1C4Z2vORhNtGdRDswjHTFeP7RaYy1wg2yBBQ1?=
 =?us-ascii?Q?RNyuOI4HpnZvBE3UnDuGl8caFDSRERIFtVu/INpRFgsQWnElPfVX1/Ty3FVE?=
 =?us-ascii?Q?JzwDU7hQPM1VNREIMIUGbrOGWjRRaFsq0Vt35d1ZpSSpQDxG7JT8vO4H448e?=
 =?us-ascii?Q?ys1BGM5o+efr6veUrsPNJQuKBavOmzJKDyoRTm1UUejWdVy6fnIoGp91lgHb?=
 =?us-ascii?Q?832CTv+Os1KQJmmiAhj6wEtqOLyeq59+yl3M6MV8pQgSV5ZMGwM8v5bgbzZW?=
 =?us-ascii?Q?CKGlB1BBLRMvsLHSCtWAuiGBCa+H8J2fMlkDoith3aODeDVy9fnF83hFeRNd?=
 =?us-ascii?Q?S/YPF9w9fQS+BVB4NcQTdoMLbzVFwHqPKIqEgfxz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b35f1779-a109-4512-c76b-08dd39348603
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 09:26:30.5920
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BTMK2WiK459ub3csIfSjEZMTqf955/YqGHeIWyW+hyhNXt2AZ2kuoGihLcq9L3XhqYJAls+efPYrthY0yO5CnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10731
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_012634_142086_1C67F038 
X-CRM114-Status: UNSURE (   6.19  )
X-CRM114-Notice: Please train this message.
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

Pankaj Gupta would like to recall the message, "[PATCH v11 2/7] dt-bindings=
: arm: fsl: add imx-se-fw binding doc".=

