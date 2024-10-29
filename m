Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB182D2AB0A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 09:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hX86A++hru2wJXZRhUDEEpFaQRLNDRvP7CIgxENLIuc=; b=jjpCgi/j+GNAODSW9s0WhqH/Q6
	UcmrZos8+ZdNNa6CcC9eOrev4RrH+KD9m3EkmNQqucepi5gAe8JgR9PK8pJ0J0QVodjn3TnnQboqK
	439L0GS3bJdAKe/oyqp247OoC8+QpRGHzRs5BPJj3s8Wgf9x7ravhXBqW2JsOILrj4bvcpkuNqzuc
	Fv/syVb/Am/cVVSuFX0yJF+j1JPUAC+Y15bZNQPPYZ7T86SsOXRTwlAvYp4wpOWBgJ1CLCyADyPs0
	wiOPnf6nKETgAeogk+bgo2TNM/brdzNmNvyFZX/OXli0UN8zkELq9dOxdP8AVhL/Dk4u/CUbx8bh4
	BJ88gmnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5iqr-0000000Dv7R-2E0b;
	Tue, 29 Oct 2024 09:49:25 +0000
Received: from mail-db8eur05on20625.outbound.protection.outlook.com ([2a01:111:f403:2614::625] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ios-0000000DunF-0Ith;
	Tue, 29 Oct 2024 09:47:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ej44McUf3cdfbhGwQqOeUAeb9EtLSatuTPBWgxBGQlTpRruT+11rHgRuXGhd1trEIf9Dk+h/svU1TpKIy2Whmpx7nu7irycpJV7gkOzRg7bfhkweJ48bjWtRuzu4gnRZ0uHsIymoHOkFmzcZ/Wcq4uadfNkQTEqD/S7G/MPvT1hKKPO+evQPdP/HoCUwc+Z/ZhdfA7Jaz3KnnBWTKOhXiySHS351manLPTNobZSVyk5M3y9SNL3Sy2AJ/Nu7O60emcBQ6fdynnSvIQ5CAz+OSnlUYPRBvcrUNzlrlhu+Em4f/x9yN6bdOyEQvPAJ4MKvPRr5iU4G44fuAyD5cnrmPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hX86A++hru2wJXZRhUDEEpFaQRLNDRvP7CIgxENLIuc=;
 b=A7jxHHXqVhOWD/RE/kV4KhGQNG9v065WObgXY3xxxmtYYwmq1TtasX6AAgkcC9Q2rN3Nz146peyQF04OYOrLZBNqEK1RLlzYlFtofM7vo+Bxxf7i4LxOQLZEuuqDe3QCCFeIf8Y195w/ykfdKF1rP8ByfiA5pLkCNcrt3JH7VWLuV8dU0H0Ys1aVR8Ic0msUwu1oqptV9Z3ocviLP5UXT85gHbD2YIODU5ACJlkYCNSUXk3/hqmPQWB3H5lJiXDXpTAOVs9oFrElagcIJMj/xvcSEZviIDYDFOsqLvHCGVv1ajTAI4K1OGLKotRtQW5/s/Wnzf2LBq5sKo7Ky70eCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hX86A++hru2wJXZRhUDEEpFaQRLNDRvP7CIgxENLIuc=;
 b=do3IOwip18jIAPqXNEZ6cDeEqsuLkYMueANEcTQFsuYpT4KJisauGArMByo7bmO+Lf392B/AbhTDIZ5CQ0fiCaKmEDx4naaR3K2nc84vKTw4/1vTilXYgkhuOHZQ8YZVrO1iki0eXIWh7rngFxQZtK+nQUCTewa3rNk+E5iB9oLidtYA61PZN1WSo8Ve0ny57QfRqvdySeLMVgUsRXfm1jlLYhd/bBxd1+++2k8pF5OsNXG/MSWUZDUJQ0LG81VAGyRoDzQi1bZQZ0meUPFe0xoj6L2/72JZv2ktwlmFt1UsXF1xsZznjEMe3BeKGdc2VUjSAeMbtToJqE8kGSPiXw==
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DB9PR04MB8297.eurprd04.prod.outlook.com (2603:10a6:10:245::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Tue, 29 Oct
 2024 09:47:12 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%6]) with mapi id 15.20.8093.018; Tue, 29 Oct 2024
 09:47:12 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
	"andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
	"jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"vkoul@kernel.org" <vkoul@kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "mripard@kernel.org" <mripard@kernel.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, dl-linux-imx
	<linux-imx@nxp.com>, Oliver Brown <oliver.brown@nxp.com>,
	"alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
	"sam@ravnborg.org" <sam@ravnborg.org>
Subject: RE: [EXT] Re: [PATCH v18 3/8] dt-bindings: display: bridge: Add
 Cadence MHDP8501
Thread-Topic: [EXT] Re: [PATCH v18 3/8] dt-bindings: display: bridge: Add
 Cadence MHDP8501
Thread-Index: AQHbKchysDeMCVHJNEu0yEsxBchosLKdTAIAgAACD7CAAASYAIAAJ8jA
Date: Tue, 29 Oct 2024 09:47:12 +0000
Message-ID: <PAXPR04MB9448A5B29B4BEF2935A8E57BF44B2@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1730172244.git.Sandor.yu@nxp.com>
 <e11ba0cf836d6f27935f58b7987e792026ab0233.1730172244.git.Sandor.yu@nxp.com>
 <c664wq5wzzvivvkpedkicz6ku55epoa75oyycm3hohoms46yi5@myn542dqlpmu>
 <PAXPR04MB9448D20D5EDE86DEF060222CF44B2@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <c0b9157c-48cd-41a7-ab38-c0334f1e5af7@kernel.org>
In-Reply-To: <c0b9157c-48cd-41a7-ab38-c0334f1e5af7@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|DB9PR04MB8297:EE_
x-ms-office365-filtering-correlation-id: aa7d8d3a-1c65-4521-17ea-08dcf7fea9ba
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eHU2UmJDcnBlSUc0amVIb3ljbmxVVGkwc1Q0MjI4VmthUGlIRzVqR1J6dGF0?=
 =?utf-8?B?UEZnMXpVNjlmSEcrOHFmUDdnV1RJZGVGc1lUaWNvaCt5UWpjZnd4b1VKMXh5?=
 =?utf-8?B?VWpNWEVoc1JxUjJDbVJBWDlHYmJwVVp3WWdPVzZ2WGZyM3ZlTzJFYzdvV1RQ?=
 =?utf-8?B?SkNWb1FHT1JrMWlELzd5eUtXTUt3ZEJhU2pzMEJMTmdZUyswdGFkWGZZUWkx?=
 =?utf-8?B?dVk4MkUrbk9jVW05alc1bVpyWVpHUVd2OFZ0VHhDb2pBNDhML3hiZzdRdklQ?=
 =?utf-8?B?c2xES245OVZIWDVCT2dtSDBMb051ODRqRFRMWGZNNks0cVJMblNiNE56SWVQ?=
 =?utf-8?B?Mjk0c0ZpSXJscU1VK2JYdDY5NDJJUHBtSktWVUJyNlExdXRqUTlkOFp2d1dw?=
 =?utf-8?B?bWZrdUc1NGdUZDVMU3ZxbEJpWU8vNTdRQ3VlSmhCeFluT1QxTnpMWlduWGlZ?=
 =?utf-8?B?cDNvVHcyWWQ0Z3dnNm1PYWQ5VXB4cTB6aThoTDFpM2g5SHdiVFl4UThXU2Uy?=
 =?utf-8?B?c2RDb1lPRWhpL0RFb21vdGtyMDJoemlTcFREYWVCTFY4TTZhMVdVOVIvOUZq?=
 =?utf-8?B?eHVtQTJTejJ6T1Z2VDIyaytYVStuL2VadmREVGpDUlQwbFJORTlFQ24ybk5S?=
 =?utf-8?B?SjVveHpBa2VEamNpSmY4TzVic0doemg2R3N6ZU1taEFJSEdoU3pud1IvOVh3?=
 =?utf-8?B?d0lLemdRcnFaSzNXSGh1ZDU4TXpyeUlYa1g4dGRZUDNQdFBqdkk2TGIwWHVV?=
 =?utf-8?B?aGlVRTMveXRKdzNQMFRmSXdhdVByRXlQVDh3S3Q1WSttUlg0MEhVMklKaUNB?=
 =?utf-8?B?QThUOFpqdlBITTNDeVpZd2NsUVBvci84T2xRbFFiWU5IbGNHZ3ZmS1JKelU4?=
 =?utf-8?B?TFpXUXNGWUxIWVpmVFJwbnN0WUU4TDRiR2Zid3VralBCSExJcG1SRVdmK2RE?=
 =?utf-8?B?WnRuTjhsekkxcXU3ajgwOWZ2b3BUalNJbnR0QjdTcGlCR1V3VnlMeW0zYnFm?=
 =?utf-8?B?WjA3TGZ5elozd3pHMkRsc3htNnZvZ0swdHdCbmZlNkYyQkp3Yi94SitiSGla?=
 =?utf-8?B?aU1TZFBGRDFvQ1lIa05jLzJGWW5UL0lKOU0vc3V4RXJPbmhLbjNQNmtWZU9s?=
 =?utf-8?B?NFBqVDVjRURYVGNmZ0JMSFcralptTGR3TDNhSmF5SURHRTBSc3A2bVh6b1dz?=
 =?utf-8?B?a2Z6b3dWS1dBQnVGWlpuSHRuUlpZWkErQUdJZk1CM2RkYTIwL0ZjL0syM3Av?=
 =?utf-8?B?WFdnWVhxdEZXVWdLRHdsRDVWU2hNUXR3Z242aW5COVg3a1Bsa1FPV1ZIQ1Bs?=
 =?utf-8?B?UGNjWE44VDVhU1JWNFhUbVFWR2t3UWJvS2lCVmx3eERoazFtVnJzWHE0WmNS?=
 =?utf-8?B?TVFTVUo0WGw0OG5jRGZlL0UvMGxjY0tuenFnOVY5RWIwc0NmQWI3Q2EveTcw?=
 =?utf-8?B?YlRXUU9JNGVORWg2TjBxUmd3RnVSaEFTNHIxeFVwMHJVRjcweE1hdnA2bTJi?=
 =?utf-8?B?TE9uRWpCa2hRbWJ0QXJTMm9Wdit2TFlyaHJVbVhnZXhIMUt6SkNWc3M1K0tT?=
 =?utf-8?B?SkFkb2gxdWRRNEVHbjdVaUdNcWVwVzdMVlNoT3d0QTFuOEVtSmRpSUJzd1Zk?=
 =?utf-8?B?ejJ1dVNSQnVXUmtHQ3hYa21CVEtIbW5kelUyYXVVQmlJWktNZWM0Y2FpVDJZ?=
 =?utf-8?B?YjBSd0lxcHJMc3NRZFJHVWQ0aERkRVBIdUNtZitCc3pROFU1UEFVKytlcWta?=
 =?utf-8?B?SWQwK1grREpPQlkrRVoveTh3Vmx4NXVvR2tiUWY3QVBHU0lkT0VZS29JTGU0?=
 =?utf-8?Q?6exXsTnvp9um3oh2SGabtMMLrngvWkvpjrxeQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SXcxU0VOU0sxdUJFU1NRYXVRVTVFNWJndW56NXdHcUgwTXBPN3JIc05IVjBv?=
 =?utf-8?B?RkRGbGxTT1RKejYyZWxUelU2V3RaVDU5MlRkbnZCNmcwZHRZZXdlUUI1Vlpn?=
 =?utf-8?B?bzd1WnhFNEpxd0hMRnN0cGJhbmxvMFp0Z3BWMkRtVnFyNUhxMThuVHZ0N2FL?=
 =?utf-8?B?aHJMd1dTSGNhTEJscDUxR1FoWlNNd0xWMlVLNE5jdGxMbVNDVVYwSkdyZURy?=
 =?utf-8?B?a0tydEhnY2dTY1YrS29WcGZ1UzlMQmdCM083M3dBdGhqQ0RjL3hmRHFvblF2?=
 =?utf-8?B?Q2JyMm9Vb3VVSUR2bHlwTU9Ia09FK3p3a09rVDdFYTVaZ0c2cTZoeW9hZFZv?=
 =?utf-8?B?bzBGZEZISXVJOUhzZmNDclhmR2NuOFptWkNocnNHdFlTQ1VEbmtRdUNaNTRD?=
 =?utf-8?B?SWRhRzVnY3lKZjhxNkNkQU5qTGViY3dIblhKczNEQ01WZXRmRnpCYUhUMWtC?=
 =?utf-8?B?QkJlZjAzc1RYUStYM2JnS3VXR0ozYmVqYXExSFdTRGpVV2xZTVVxeWswa2FE?=
 =?utf-8?B?a1RnalN6aWdvWEQ5ODVyWXRxVUxCSUVsZUVIMmFnMnBxekRWWWZUd0dYb1Vw?=
 =?utf-8?B?c0VVdTZmaVBmMVo3ZWE1VTM3R21DY0NlNXZ2TnNlU1g3MVZJWGUvQ0ZibXFt?=
 =?utf-8?B?d05USDNSUnpMTjZKdGljbXJpUGxZRkZLNVlRNG9QaksyQ1puR0NQcXlOdXJQ?=
 =?utf-8?B?SkhLeUN0QzlYeVBrVGNwSytKM1lrRlBBZDdoQXVVbElkZktwNkUzOXBTZ3dY?=
 =?utf-8?B?Z3VDNTRNRy8wd24zakMxZHhSaEFSckhGQlpVSEFCZmxzbGFRYTZKdHZ0dC9o?=
 =?utf-8?B?NTJub3h0cHNTRTY0SEVCT0xQU0pCeVJlWlh2V3ljUU5pWTQvWWlVRDQ0VjFv?=
 =?utf-8?B?OXZVQlFDazRiUEdETVRqVkc5dWNCOFdxNjJDSG9ucEl5eW9lWm8vbEZsRXkz?=
 =?utf-8?B?L3F2VjIvVW04cjFGbVZJOHo3aVZaZERkK2pvTGNSWlQyOTBlTUd5Z2hmend0?=
 =?utf-8?B?QWdpUGExRnJMdzFyNG1GS205c210Wms0U2t2VGwxVjZKMGtUQnZuaDJUUGRv?=
 =?utf-8?B?dzI0VGpKUWVXU25seDMwdjk3dnZqejliNDc3M2h1QTR1VHlLYzFOWE52V1dM?=
 =?utf-8?B?dUVZSmRvMW5tQytzdUZydy9zVWNlOEZwZmZaemlSNzBxN3NYd2hHQ3lsWmtO?=
 =?utf-8?B?SUR6TmhxejlPemtpTUFCYlhuOVRZclg3SmlvQWZlK1RCVHB1NmUwS3pkVnQ4?=
 =?utf-8?B?WC8yR1VldzVFTWx0WENTTkw0S0dVNVh1Y2k2NFUrbHVTdkVVLzdIb2JQeHhi?=
 =?utf-8?B?dXpGVkU4dGtGUGRkODA5ZWlwaWlFVGN0dXNrRWZKcllHWWN0Y3Q3ZW04QXFG?=
 =?utf-8?B?NFIyc1lrdFAyeHVFcm84NktHdGRFRjVtdU83TXluVTIrUTAwNFVwdytoR3Vu?=
 =?utf-8?B?bDBoU0s5QUNGSDBIdmNFVjViZEp4c2x3UjJzMlJGZjNFQ0ZkeWVEbS9jdFls?=
 =?utf-8?B?OGVsSmI5ZFBubDF2Q3BkaFd3YXI4Y2JGOXRVYXZscVdiaDlhNzVOdi90SUEv?=
 =?utf-8?B?MVVFK2xiZEdlTE0wWmIrZDBrOUlEYXRwY1VEZm04Tlc2d2VIWG5OM2lUb0pC?=
 =?utf-8?B?Yk5TMEdYeWN2NXlSK3F1RHZuMFZjWlZ4QTNQSlgvYnRDNXNmWDB3NXlKcThn?=
 =?utf-8?B?c25yYkJxejRvUHIyNllJMHNDQm1vZnVtKzlIRnRmbm0wQkYxdWFkMWhLZnF4?=
 =?utf-8?B?WG5VQzhVQnc2R201YzRzWit6NG95WnRTdEFkWmhDcW9LR2xnc1RyMkNkaTBi?=
 =?utf-8?B?bFJXTUZLQWd1Nm1KellnOWtwYjlRK3ZRRUswVWRyV2Y4dFlpenhHR09OMEwv?=
 =?utf-8?B?YWVDaXlQWnZQamlmTlAzU1JHSEgwOUowRGpwSzZMNHZ6Z1Q0V3A4MVZ2ZklF?=
 =?utf-8?B?LzdwZlJVdjR1SGpTaEJrTE9rbm15Tm11ejV1T1BGZWpGZk0rRnVXMWV3ckUv?=
 =?utf-8?B?K1hndUZzV3dGL09UREx4WTJPUnRDc2xUdFJXZEtOc0tmSDV5UzJWVzk0NHQr?=
 =?utf-8?B?aWt0NUxuYWFaQjFhVE43UW9PWFg2TWx0ZFNKQVFxWjE1eHdyVUlSdGtqL2RO?=
 =?utf-8?Q?1TcI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa7d8d3a-1c65-4521-17ea-08dcf7fea9ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2024 09:47:12.0695
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xJOjLWVEeH8djvbR5TWnfdQ+5Wv6F+ZcNhJJjVk9shv0CDTbFiaTvGdujJlrW5w2wcgG55V17itvfsn23AWRrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8297
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_024722_124342_A37A98BC 
X-CRM114-Status: GOOD (  18.13  )
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

IA0KPiANCj4gT24gMjkvMTAvMjAyNCAwODoxNywgU2FuZG9yIFl1IHdyb3RlOg0KPiA+Pg0KPiA+
PiBPbiBUdWUsIE9jdCAyOSwgMjAyNCBhdCAwMjowMjoxMVBNICswODAwLCBTYW5kb3IgWXUgd3Jv
dGU6DQo+ID4+PiArICBpbnRlcnJ1cHRzOg0KPiA+Pj4gKyAgICBpdGVtczoNCj4gPj4+ICsgICAg
ICAtIGRlc2NyaXB0aW9uOiBIb3RwbHVnIGNhYmxlIHBsdWdpbi4NCj4gPj4+ICsgICAgICAtIGRl
c2NyaXB0aW9uOiBIb3RwbHVnIGNhYmxlIHBsdWdvdXQuDQo+ID4+PiArDQo+ID4+PiArICBpbnRl
cnJ1cHQtbmFtZXM6DQo+ID4+PiArICAgIGl0ZW1zOg0KPiA+Pj4gKyAgICAgIC0gY29uc3Q6IHBs
dWdfaW4NCj4gPj4+ICsgICAgICAtIGNvbnN0OiBwbHVnX291dA0KPiA+Pj4gKw0KPiA+Pj4gKyAg
ZGF0YS1sYW5lczoNCj4gPj4+ICsgICAgJHJlZjoNCj4gL3NjaGVtYXMvbWVkaWEvdmlkZW8taW50
ZXJmYWNlcy55YW1sIy9wcm9wZXJ0aWVzL2RhdGEtbGFuZXMNCj4gPj4+ICsgICAgbWluSXRlbXM6
IDQNCj4gPj4+ICsgICAgbWF4SXRlbXM6IDQNCj4gPj4+ICsgICAgZGVzY3JpcHRpb246IExhbmUg
cmVvcmRlcmluZyBmb3IgSERNSSBvciBEaXNwbGF5UG9ydCBpbnRlcmZhY2UuDQo+ID4+DQo+ID4+
IFBsZWFzZSBsb29rIGhvdyBleGlzdGluZyBiaW5kaW5ncyBkbyBpdC4gZGF0YS1sYW5lcyBpcyBh
IHByb3BlcnR5IG9mIHBvcnQuDQo+ID4+IE90aGVyd2lzZSB3aHkgd291bGQgeW91IGxpa2UgdGhp
cyB0byBiZSBhcHBsaWVkIHRvIHRoZSBpbnB1dD8NCj4gPg0KPiA+ICdsYW5lIHJlb3JkZXJpbmcn
IGlzIGEgZmVhdHVyZSBvZiB0aGUgTUhEUCBJUCwgYW5kIGRpZmZlcmVudCBib2FyZHMgaGF2ZQ0K
PiBkaWZmZXJlbnQgbWFwcGluZ3MuDQo+IA0KPiBZZWFoLCBhbmQ/DQo+IA0KPiA+DQo+ID4gQmVu
amFtaW4gY29tbWVudHMgaW4gdjE2LCB0aGUgaW14OG1xLXppaS11bHRyYSBib2FyZCdzIGxhbmUg
bWFwcGluZw0KPiA+IGRpZmZlcnMgZnJvbSB0aGUgZGVmYXVsdCBpbiBteSBkcml2ZXIsIHNvIHdl
IG5lZWQgdG8gdHJlYXQgaXQgYXMgYW4gaW5wdXQuDQo+IA0KPiBCdXQgSERNSSBpcyBub3QgeW91
ciBpbnB1dCBwb3J0LiBBdCBsZWFzdCB0aGF0J3Mgd2hhdCBmZXcgbGluZXMgYmVsb3chDQo+IFRo
aXMgaXMgY29uZnVzaW5nLg0KPiANCj4gPg0KPiA+IEFzIGRhdGEtbGFuZXMgaXMgYSBwcm9wZXJ0
eSBvZiBwb3J0LCBzbyB0aGVyZSBpcyBubyBleGlzdCBwcm9wZXJ0eQ0KPiA+IGNvdWxkIGJlIHJl
dXNlZCwNCj4gDQo+IGRhdGEtbGFuZXMsIHJlYWxseSwgd2hhdCBpcyB0aGUgcHJvYmxlbSBoZXJl
Pw0KPiANCj4gPiBIb3cgYWJvdXQgcmV2ZXJ0ICdkYXRhLWxhbmVzJyBiYWNrIHRvIG15IHByZXZp
b3VzIGltcGxlbWVudGF0aW9uIG9mDQo+ICdsYW5lLW1hcHBpbmcnPw0KPiANCj4gTm8uDQoNCkkg
YmVsaWV2ZSBJIHVuZGVyc3RhbmQgbm93LiANClRoZSBIRE1JIGRyaXZlciBoYXMgdHdvIHBvcnRz
LCBhbmQgSSB3aWxsIG1vdmUgdGhlICdkYXRhLWxhbmVzJyBwcm9wZXJ0eSB0byB0aGUgZW5kcG9p
bnQgb2Ygb3V0cHV0IHBvcnQuDQoNCkIuUg0KU2FuZG9yDQoNCg==

