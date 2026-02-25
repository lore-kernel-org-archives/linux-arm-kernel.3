Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0ABF55452
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 04:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZGs1GGpCNzrnWhajMuQmqkPd5pVMGv7ASx0wwj+yr9E=; b=OOr2oisxeW1LKwOF7Bw6wFJiO6
	wsQCm5w8yb/hnR8XfKCtxN/hUDEqD9aaowoIvRWXDxGktf4FbmXsH4oEWz2+/A3Ksd/O3f46Z4UJw
	d5fmxMWcnluHu9B0YO417Tyowm58a+F0zTD0Av79K3Qpi0GzCL2C1LKDgfPf+eZH/7Kn/rloptc/m
	mcgsB2xImtGKcJrOvQ4HysO1F25+LRoke7dBnSrB/nieubt20K3x7RRBRPeQ7AowqmaQJsjtCdsIz
	ha/I5KZNjpG8nag1gahEXfgaFbiETACOsbyXKG1D6V3JdVktbxpswbg/fZZ6zZ770WLTzTMQbHXM2
	0LxQz9ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv674-00000003Afg-2ib1;
	Wed, 25 Feb 2026 04:03:02 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv670-00000003AfI-3pRV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 04:03:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ISMFi0w7/ZD4+WH1qBCHAG+JEoX+kXpLEF7Lm5LCgTmIf+sGnTsLQpbouIZukSaExEEc83DJ3/nhnACpwuGw2Hz70j13M3GKV2t8g/YWxOmeOHf6eQ6n1tihSOjp7jTiz68WKqpl4ZjLTW+re8aW3nvqHav22WdhjmYrVlGEycpD/flOWEEOacclbqe+BmrSEbe13fAGHqCycqaXOOJU77AGIcw0/NmESo1bCGwESZ9dWnBKcw95ggRbOHywenP2ztndSH5gviWEt0JEk+Ni7UeMJUDehbpaKje4ZpHcHpkTbGqBBVsv75qjTufjoSdqh/S76jbdsApPB6xWTaGWwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGs1GGpCNzrnWhajMuQmqkPd5pVMGv7ASx0wwj+yr9E=;
 b=hw14vAbC7Febqqx32AG3M1/VzsgLxxVAQ6D70Au5CppFZ2vq2j1qL3ASa7FxOgkfDDGMM/Yq03kgYIsQD8Y8lUhUH6z7txog9K7pfqwYx4+6+IIVSfQhqrMfoxQoSA2Z7ynshQt8sT1Nm/0y4X11s25Lp6jykDzpyb4w4Fd0P0OeLiy0ro0YM8iP8qpbousgKypjgZiuixBxBjZBJ0KfAC1Kv6rcPS4TIXASXXF9W2woP88bxrz7z98TXsxku9zO0Y3jnbCLYfYEFIk+h7b4bdpJGN7UR3F2R68wPXanzEPleBJ0ULtWc5znNjWX7VNMB9fHawVmPhqs3AC1Gjl39A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGs1GGpCNzrnWhajMuQmqkPd5pVMGv7ASx0wwj+yr9E=;
 b=5PugyFLGhIOWJyP1h6lkyzXlIKH0l0mdOWBN4t6RU4eFFrPP99S98QSkqaFtQ2HkpvCOrQ1cBKyvDDsebZ/Cr4O44M7nhpqVXjx/EnlY5TBUJBwULLp9q3hkxiHhBWEstP8SMwyC//ngE2c3akmjM0C4z91j6jBwlcXRWAWAxBA2HxQONPKeRXC6aV5pe6UgF2ryzfKBrBYoKqQZb1lbeCTBfXGLxK4OGT3lpHKZSdks+7T4SoqwPF0THXs3exChGhG8rZfde8d+8GrqRXdtE5uXGjpVeaT5dNSR8H+g2SGj5TrUVo5lZKTdqhzFNuW4vdU/+sF56tVbMrByx3D2Kg==
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f3a) by SA1PR11MB6759.namprd11.prod.outlook.com
 (2603:10b6:806:25e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 04:02:51 +0000
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::bf22:8190:4af0:3def]) by DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::bf22:8190:4af0:3def%5]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 04:02:51 +0000
From: <Manikandan.M@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<dharma.b@microchip.com>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>
CC: <Ryan.Wanner@microchip.com>
Subject: Re: [PATCH v2 3/3] drm: atmel-hlcdc: add LCD controller layer
 definition for sama7d65
Thread-Topic: [PATCH v2 3/3] drm: atmel-hlcdc: add LCD controller layer
 definition for sama7d65
Thread-Index: AQHcb9OoBN0dkEOWM0Wikl6LzjOO8rWTN2iA
Date: Wed, 25 Feb 2026 04:02:50 +0000
Message-ID: <9f681783-2cee-4579-9f59-cc619f5e4295@microchip.com>
References: <20251218040521.463937-1-manikandan.m@microchip.com>
 <20251218040521.463937-3-manikandan.m@microchip.com>
In-Reply-To: <20251218040521.463937-3-manikandan.m@microchip.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF9623118BD:EE_|SA1PR11MB6759:EE_
x-ms-office365-filtering-correlation-id: 37ba94e0-2870-4729-e987-08de7422beaf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?SlljZUtzSTd6bUtVYXJzSHBZdG1FNzFzOThvRlJFSnovMFNFUE1FTjR6Vmsr?=
 =?utf-8?B?K1RPc0tSdkhOd0xVbko4dWJUZDNNVHU0Ti9jdmJ4Vzh3SGIydE94c1d5Tkxo?=
 =?utf-8?B?LzdhS3Z1NSt1N01PNHhwR05heVZHa1NBMkRzZGlzUW8ySTNuOTVQTlB1Vmpo?=
 =?utf-8?B?UmswVDV4T2dYb243cHk5c0xWWlJmNnF1RlJ5WnNJendFTjNNL3BBWlR1VC84?=
 =?utf-8?B?d25QWlNJQ1VtZFNpTzdzdDJUQTFYWGlCTCtxYzFvOHRiN29QdkpNeWNpQnZj?=
 =?utf-8?B?aG1TcHd1TFNzTFRXekRkWEgyM1RmTlJZZHZhZnQvTFlRUHFzVU1tZ2RaZXVh?=
 =?utf-8?B?eEtPVE9EVTBWSEdXOVU1OGRxM3UvdjlHbmdISHYyZHlvVnJnUGtQWHdlbVpo?=
 =?utf-8?B?RGNoMDVVellFV3hlenFHcERrYW4ySjUvZERJZFdhNG1RQVl5blk0TGt1K25x?=
 =?utf-8?B?T3Zac0hHSXdlc05CZ1l5cDVZT0VMYXdacnJkNnlTTjNvZjNTYUNsSTczTGJD?=
 =?utf-8?B?MlRYa0RIVW8wYUJST0Q3T21BbTlGVWdUT1BnOXllRjM3Z3RYcG5iSm5LZUdH?=
 =?utf-8?B?Y2gwOFZBQmgvSHVxTDlUdXc1RGswalZBTktjbS9jdEwwRE5JWTNnNGl2VHZq?=
 =?utf-8?B?bUw0ZGZzbWVyRDRrL3pEWDNVRmhiQXdpV3k0N25ia3Y4NURHc0ZLQk1hT0Rx?=
 =?utf-8?B?bnc5TTZjdEJpc0tHRmZxWHhMSm05ODBVaW53S0JQeGN1TnNWemdNQUtZMCsx?=
 =?utf-8?B?YnVzcHNFSklHYjltWmx0TFFOYjdLb2JFYVl6dHlHL2hIRlJTVC9sa3JIM252?=
 =?utf-8?B?VkVMdzhiYW0wRno3QnBYaVY4L3lhZjEwenpON0FVM3Z4NDBTQ2JLQ3pHL0w5?=
 =?utf-8?B?QmVUSlpQcmo3a1FJMGprOGlxbmRJYUVyb2c4T0p0MDhNZWZha0tYYUQ2K0kv?=
 =?utf-8?B?NExSZlFDajdCT0Q5WEhXZEhYWURzMTVpSzl1MHFJQURhdXloSXEyaERiVlNQ?=
 =?utf-8?B?bHhieGdhSlVJNmNzR1NWZ21yYU1LRXYrM3pjaDBPV05MUC96NG9TcTdwTWIr?=
 =?utf-8?B?bE1iMDdaL21oVWhVZ01KOXduY2VXYlZRRk4rMFVsbytaU2hTS291Qm9iMVdR?=
 =?utf-8?B?Ry9mK1Fzbmh6bVVQdkVveXdJS1JraVcxSWdCRG5LWmpIWEg4QUdEWkIyUjFj?=
 =?utf-8?B?YmVlMlJRUG5rTmJXYkNBdTJtNVFUWTJwQ3V1djhMMGhJa0pIY0pRdFRtTUZF?=
 =?utf-8?B?ZFR6Y0pHZEpubVEzWG02U25GSlhIYklHNHM4Qm82MUU5bVNVSDdFQWdnbzRW?=
 =?utf-8?B?YUN5MnQ4aGtMNDVWRTNVMVRrcmJOY2ZJcEV4K2N1WnV2WXR2cWhvQUU3UjND?=
 =?utf-8?B?TXBDSVcrcHR6UEZVSVBPdWpJRG1ZOHQrVllZcHp5bWFjRFBVUTd1T01DcklY?=
 =?utf-8?B?c2xuYjVrQk9TdzNQNWJVUEFtalVFS2dWWUd4KytIZGg4QWNxQ3ZDZ3VFME5H?=
 =?utf-8?B?d0xYYTBsTk9QL1BpcmZJRTJGdWRDWlEvWGRaZHhMTi9KUlkvVEp0emV4YlJv?=
 =?utf-8?B?N2dHcnFhbjFYV3ZzNHB4Q0hiTjIzb0hFN0JrWCtmRXFldjFLVmRGTGY2cFNr?=
 =?utf-8?B?TlB3UGEwVEc0c2taQzN6bDN4ZFRUTFdvYkxPQXdXRXJTRk5KaGFRaG5icU8r?=
 =?utf-8?B?Y1Jobk5KdFdOampBTmdybEZzbTk1eVhvb0lmc2dpWlRQdTZLY0RlcVNURmE3?=
 =?utf-8?B?aGVWS3hNNXZ4T282dFR1Qm5FRGEvYTN4UzQvTWNnM3BXbEJJOGpoajl2UjZu?=
 =?utf-8?B?WGtKM1FBRi9vSjN5L2tHNUFQekljT1hyMzhZQ1BCS2hTR0YvZWI3NjYxNFEy?=
 =?utf-8?B?amo4bVIrRWhORVVicHZZTlliOEZ1YjV5VDZvTEQ4RjQyK3F4Uk1FNTl1Y1Vh?=
 =?utf-8?B?ZU10TW5BMGtQeVNRY0QwQUF5R1B0cmxuVUlwYnh6SXJrQTBpajFDQUxhaE9t?=
 =?utf-8?B?VWtmQ3FqWE1UeXE1NytEMG95KzF1UmpUNVhwTGpOOVh1M2lWWDdmRzVIRGFH?=
 =?utf-8?B?bndUT2M4ZEc1MWx3VGNhTkMxTXJRU2hMZlN1UTdXZXAyRnFsQmdnZ0xTTFdO?=
 =?utf-8?B?dEVNWkZCdkE1bWkvM296ZitON0YzSWxTMmkrbUFaVmRQYWZjM1p4Z3hoNWc4?=
 =?utf-8?Q?5LhaFTR/EWugL4pBWitRSXiREmbDjitUMFYtFteURLp8?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF9623118BD.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aW5HWlV3YnY3aUduM1FQdWpPd0pqUGNyNXRhWGh0ZElTK09CeVF0akkzN01p?=
 =?utf-8?B?VlFVYTE2dEJyWmloVTFWMHNIU2tjNUlpV1VRSGZ5c1luRUNJcm1YdGIrVXpM?=
 =?utf-8?B?UmZ1UXhOS1lRbG5vTGs4MlF1b1RRRFNmRDdBY0IxZk5Uay9tQnVndUduNUk5?=
 =?utf-8?B?Wmx5Y05IbGtlNGlaOXcyR2wwVC83QlRRYUtkbXhvQjRLZW1PdjVxa1NuZHo2?=
 =?utf-8?B?eHlxTTFiUVBuQnFHUnpPbGNuZmlFNTk5TW41NDFTWW0zRzZmTDdDdFZkQTJa?=
 =?utf-8?B?MXNSemtzQmdSbnZ4U3dkQU0rSnkxVHlxUnpiVm0xZ1paSzlOY0gzQzVaeTAx?=
 =?utf-8?B?U2FTTENBUmo4dlpYU2FsQ1dvNWJ2eHlHVnB1YnBGRkNqYTFUUFkxclFjamFV?=
 =?utf-8?B?TUppVyszSEdlODA5dkxLbTVYTmVhMy9Ic3FCS1NYYzBMeHZKU2p4UE9YZlFx?=
 =?utf-8?B?K0dFcHBwT0tybEY1UWJtVDQ5MXhQSFBKcmhSWFl6ZlNQZmM0QlViQ2Zic1pR?=
 =?utf-8?B?ZHFBczRaMS8wZ2FoKy80Y0svbFhRVEFDMkoybjBDMWFrZ1IxMjh2WW1VeW1U?=
 =?utf-8?B?NXQ4VDBIcmZTUk1rbjA2TWpmWmNzYW9GeXUvWkMwVjVGUzNHT3JyUno4SUhW?=
 =?utf-8?B?VzQvaktiODMxZi9DV05pdVJ3OG5DZ3c0bVdWenNkUDFwVmhydnNFMjVObk93?=
 =?utf-8?B?T3hBSTJuVVpDTE1XNzkvaEt5NFcvS0xENGE0VFZCMS9iNWptcmQzTFZwbGRB?=
 =?utf-8?B?ajh4bWZuTmxnbmNQL0ZqcXJsYWVhd0duVEVkUnpodTNTcUVST2JuM3dWSGlP?=
 =?utf-8?B?WkluOFVqdGVBbkVuRkZRdTVoNmtKMk5kYVRjSEp4Szg1MzNiRndNM3FDZXg4?=
 =?utf-8?B?enF3elY5Qm9OZkFNSll4cjc1aERoKytVdzY2TVFaTmlqb1pSTUphQmxWcjU4?=
 =?utf-8?B?NVpmeEI0QXY2cFBiVWlGcWhRRi9kQ3oxQkhHODZYMjRsZEMxM0xHQ2JMVURM?=
 =?utf-8?B?TzdJSTRDbGxveTNKQWh4VDBVZmpYdkswempsbFBxeVFSVW05RWRXNlFIdkYy?=
 =?utf-8?B?S2pHQTgzZ3prYWlJc2FCWVAvZkhLM0lJYzFSU05FWklYalFJZXJDeHBlYVRF?=
 =?utf-8?B?QmpJbVRYbVpKWnNnTFN0b25LeG03L3dKdGwxd1ExVTBCQXdLd0ZKRGxqS0tl?=
 =?utf-8?B?YUhwUDYwemt0QThzUGtkTnVMM0pOY1VzeTdvQ3F3c1M3VlNjUndKa20zYmdH?=
 =?utf-8?B?VUlIY29NWlVCS1pmWFhiMy9ZTTJmb1MrTFFMeXJ5SXB3Q3FpMHkxR2xodEdG?=
 =?utf-8?B?ekdrejdIZStNY051clZXRWFhMzNINWhUWHNMeEtTZDBlUjc1WEVTT3RJSWgw?=
 =?utf-8?B?VXk2U3NXMXhUSkV5bzlOM2t6U3duNDd1a1dyQTV0WjVHUjgzYVNQNENYNHVB?=
 =?utf-8?B?dkRKWFJSeWdOZjRGai96cUJvRFhueHZsVzlVSUtKb3pESHVnMDNXcnhZTHEx?=
 =?utf-8?B?eG53R01LdzBpSFF3RVJSN0NuQ3JrUGhiaEE0L1FYd0RCenczSXBCNjEvV3dU?=
 =?utf-8?B?eEx1NXRlTmQzd21kdmpSL2l2dFFnT2lVd1lWNmJ6TWFWNndwc25pZkVxVWg2?=
 =?utf-8?B?VmRKK2k3OTZ3VkJYQTc2cTlqdzFqWSswOGRpdXhSQWRYNEJzYTlWRysxc2RW?=
 =?utf-8?B?R3ZDVXZZY1Y0c29rbnVWR1FPcXBxcytBbTZkNUV0TDBXbDczcEtxQjJqV2RX?=
 =?utf-8?B?cnlwT3o3WksrejFkZTM1bHFLbENIMUFWbUhQc0lpblFwVExRbUMwVVNXeEVs?=
 =?utf-8?B?a2xGa0RPMmxYQjJJVjBEQTE2dGorZG5oZ29OWlMrQ244eUxjbHpDUHVPdHp2?=
 =?utf-8?B?aDJ0QldQekRRV1hoVitCTjlpTHpoTFRmQlhHVGR0UEZET0Y1T1ZFdHdyTFJl?=
 =?utf-8?B?b1h3bmdzUGN1SzhPNUxKZXRLMmF5RnhvU1JJUXg5VnMwa1BIcnViSjhLSWZ6?=
 =?utf-8?B?YVEzYUpLemc0Skh5ZDVsRGxKUVJGZmt3UkRaZW9TUUxrSU81NmYzV0M2bXho?=
 =?utf-8?B?Y1hQTTJCTVZGdExYWW9WREhTRlFSZlpndnpBOFlYd01xUS9kMjV2VStNVHVK?=
 =?utf-8?B?V0FpZ1FZYXdId2FJWXZVQWk1MmdvcVJ5eUZ3VmlxSnpEZSttQ1JnT0pNaXRq?=
 =?utf-8?B?UzFweFQyS3hJdlF1QnkvU1g5SXFxbmJuNTgrQy9TSTcyanRCL2UvK3ZFKzMv?=
 =?utf-8?B?dEhTRWFabmMwc3NCWTNuU21jdTBFQlZRVXRTOVJ1RGhwWS9OUGxVRjdvUHlp?=
 =?utf-8?B?c0VMMXFMNHZ6WHNCeUsxVnB4Q1l5bmtXeDd4dGNvMDJvVzBmcXU2Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A3E056AC9E28241AF5CD0A0E96335FC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF9623118BD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37ba94e0-2870-4729-e987-08de7422beaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 04:02:50.9701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pLWz/isj5irquIUUfcjVbfDuAzJEzleUKFSGRTzhaxAW/QQfmxtsNgDDns5kHV7Saf0FdbU7JdnntPrMC4P6KV2XY+1ZRa5+l2aY7JZuEYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6759
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_200259_232271_138616F1 
X-CRM114-Status: GOOD (  16.53  )
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

T24gMTgvMTIvMjUgOTozNSBhbSwgTWFuaWthbmRhbiBNdXJhbGlkaGFyYW4gd3JvdGU6DQo+IEZy
b206IFJ5YW4gV2FubmVyIDxSeWFuLldhbm5lckBtaWNyb2NoaXAuY29tPg0KPiANCj4gQWRkIHRo
ZSBMQ0QgY29udHJvbGxlciBsYXllciBkZWZpbml0aW9uIGFuZCBhdG1lbF9obGNkY19vZl9tYXRj
aA0KPiBlbnRyeSBmb3Igc2FtYTdkNjUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSeWFuIFdhbm5l
ciA8Unlhbi5XYW5uZXJAbWljcm9jaGlwLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogTWFuaWthbmRh
biBNdXJhbGlkaGFyYW4gPG1hbmlrYW5kYW4ubUBtaWNyb2NoaXAuY29tPg0KQXBwbGllZCB0byBk
cm0tbWlzYy1uZXh0DQoNClszLzNdIGRybTogYXRtZWwtaGxjZGM6IGFkZCBMQ0QgY29udHJvbGxl
ciBsYXllciBkZWZpbml0aW9uIGZvciBzYW1hN2Q2NQ0KICAgICAgIGNvbW1pdDogM2Q4ZmQyOGQw
NTZhNmYxOTE3NjMwNjFiMDU1NjRkNDYxMTBiYmVhOQ0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9k
cm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfZGMuYyB8IDgxICsrKysrKysrKysrKysrKysrKysr
DQo+ICAgMSBmaWxlIGNoYW5nZWQsIDgxIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfZGMuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19kYy5jDQo+IGluZGV4IGRkNzA4OTRjOGYz
OC4uM2Q1N2E3MTgyYzk4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxj
ZGMvYXRtZWxfaGxjZGNfZGMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMv
YXRtZWxfaGxjZGNfZGMuYw0KPiBAQCAtNTY2LDYgKzU2Niw4MyBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGF0bWVsX2hsY2RjX2RjX2Rlc2MgYXRtZWxfeGxjZGNfZGNfc2FtOXg3NSA9IHsNCj4gICAJ
Lm9wcyA9ICZhdG1lbF94bGNkY19vcHMsDQo+ICAgfTsNCj4gICANCj4gK3N0YXRpYyBjb25zdCBz
dHJ1Y3QgYXRtZWxfaGxjZGNfbGF5ZXJfZGVzYyBhdG1lbF94bGNkY19zYW1hN2Q2NV9sYXllcnNb
XSA9IHsNCj4gKwl7DQo+ICsJCS5uYW1lID0gImJhc2UiLA0KPiArCQkuZm9ybWF0cyA9ICZhdG1l
bF9obGNkY19wbGFuZV9yZ2JfZm9ybWF0cywNCj4gKwkJLnJlZ3Nfb2Zmc2V0ID0gMHg2MCwNCj4g
KwkJLmlkID0gMCwNCj4gKwkJLnR5cGUgPSBBVE1FTF9ITENEQ19CQVNFX0xBWUVSLA0KPiArCQku
Y2Znc19vZmZzZXQgPSAweDFjLA0KPiArCQkubGF5b3V0ID0gew0KPiArCQkJLnhzdHJpZGUgPSB7
IDIgfSwNCj4gKwkJCS5kZWZhdWx0X2NvbG9yID0gMywNCj4gKwkJCS5nZW5lcmFsX2NvbmZpZyA9
IDQsDQo+ICsJCQkuZGlzY19wb3MgPSA1LA0KPiArCQkJLmRpc2Nfc2l6ZSA9IDYsDQo+ICsJCX0s
DQo+ICsJCS5jbHV0X29mZnNldCA9IDB4NzAwLA0KPiArCX0sDQo+ICsJew0KPiArCQkubmFtZSA9
ICJvdmVybGF5MSIsDQo+ICsJCS5mb3JtYXRzID0gJmF0bWVsX2hsY2RjX3BsYW5lX3JnYl9mb3Jt
YXRzLA0KPiArCQkucmVnc19vZmZzZXQgPSAweDE2MCwNCj4gKwkJLmlkID0gMSwNCj4gKwkJLnR5
cGUgPSBBVE1FTF9ITENEQ19PVkVSTEFZX0xBWUVSLA0KPiArCQkuY2Znc19vZmZzZXQgPSAweDFj
LA0KPiArCQkubGF5b3V0ID0gew0KPiArCQkJLnBvcyA9IDIsDQo+ICsJCQkuc2l6ZSA9IDMsDQo+
ICsJCQkueHN0cmlkZSA9IHsgNCB9LA0KPiArCQkJLnBzdHJpZGUgPSB7IDUgfSwNCj4gKwkJCS5k
ZWZhdWx0X2NvbG9yID0gNiwNCj4gKwkJCS5jaHJvbWFfa2V5ID0gNywNCj4gKwkJCS5jaHJvbWFf
a2V5X21hc2sgPSA4LA0KPiArCQkJLmdlbmVyYWxfY29uZmlnID0gOSwNCj4gKwkJfSwNCj4gKwkJ
LmNsdXRfb2Zmc2V0ID0gMHhiMDAsDQo+ICsJfSwNCj4gKwl7DQo+ICsJCS5uYW1lID0gImhpZ2gt
ZW5kLW92ZXJsYXkiLA0KPiArCQkuZm9ybWF0cyA9ICZhdG1lbF9obGNkY19wbGFuZV9yZ2JfYW5k
X3l1dl9mb3JtYXRzLA0KPiArCQkucmVnc19vZmZzZXQgPSAweDM2MCwNCj4gKwkJLmlkID0gMiwN
Cj4gKwkJLnR5cGUgPSBBVE1FTF9ITENEQ19PVkVSTEFZX0xBWUVSLA0KPiArCQkuY2Znc19vZmZz
ZXQgPSAweDMwLA0KPiArCQkubGF5b3V0ID0gew0KPiArCQkJLnBvcyA9IDIsDQo+ICsJCQkuc2l6
ZSA9IDMsDQo+ICsJCQkubWVtc2l6ZSA9IDQsDQo+ICsJCQkueHN0cmlkZSA9IHsgNSwgNyB9LA0K
PiArCQkJLnBzdHJpZGUgPSB7IDYsIDggfSwNCj4gKwkJCS5kZWZhdWx0X2NvbG9yID0gOSwNCj4g
KwkJCS5jaHJvbWFfa2V5ID0gMTAsDQo+ICsJCQkuY2hyb21hX2tleV9tYXNrID0gMTEsDQo+ICsJ
CQkuZ2VuZXJhbF9jb25maWcgPSAxMiwNCj4gKwkJCS5jc2MgPSAxNiwNCj4gKwkJCS5zY2FsZXJf
Y29uZmlnID0gMjMsDQo+ICsJCQkudnhzX2NvbmZpZyA9IDMwLA0KPiArCQkJLmh4c19jb25maWcg
PSAzMSwNCj4gKwkJfSwNCj4gKwkJLmNsdXRfb2Zmc2V0ID0gMHgxMzAwLA0KPiArCX0sDQo+ICt9
Ow0KPiArDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGF0bWVsX2hsY2RjX2RjX2Rlc2MgYXRtZWxf
eGxjZGNfZGNfc2FtYTdkNjUgPSB7DQo+ICsJLm1pbl93aWR0aCA9IDAsDQo+ICsJLm1pbl9oZWln
aHQgPSAwLA0KPiArCS5tYXhfd2lkdGggPSAyMDQ4LA0KPiArCS5tYXhfaGVpZ2h0ID0gMjA0OCwN
Cj4gKwkubWF4X3NwdyA9IDB4M2ZmLA0KPiArCS5tYXhfdnB3ID0gMHgzZmYsDQo+ICsJLm1heF9o
cHcgPSAweDNmZiwNCj4gKwkuZml4ZWRfY2xrc3JjID0gdHJ1ZSwNCj4gKwkuaXNfeGxjZGMgPSB0
cnVlLA0KPiArCS5ubGF5ZXJzID0gQVJSQVlfU0laRShhdG1lbF94bGNkY19zYW1hN2Q2NV9sYXll
cnMpLA0KPiArCS5sYXllcnMgPSBhdG1lbF94bGNkY19zYW1hN2Q2NV9sYXllcnMsDQo+ICsJLm9w
cyA9ICZhdG1lbF94bGNkY19vcHMsDQo+ICt9Ow0KPiArDQo+ICAgc3RhdGljIGNvbnN0IHN0cnVj
dCBvZl9kZXZpY2VfaWQgYXRtZWxfaGxjZGNfb2ZfbWF0Y2hbXSA9IHsNCj4gICAJew0KPiAgIAkJ
LmNvbXBhdGlibGUgPSAiYXRtZWwsYXQ5MXNhbTluMTItaGxjZGMiLA0KPiBAQCAtNTk1LDYgKzY3
MiwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBhdG1lbF9obGNkY19vZl9t
YXRjaFtdID0gew0KPiAgIAkJLmNvbXBhdGlibGUgPSAibWljcm9jaGlwLHNhbTl4NzUteGxjZGMi
LA0KPiAgIAkJLmRhdGEgPSAmYXRtZWxfeGxjZGNfZGNfc2FtOXg3NSwNCj4gICAJfSwNCj4gKwl7
DQo+ICsJCS5jb21wYXRpYmxlID0gIm1pY3JvY2hpcCxzYW1hN2Q2NS14bGNkYyIsDQo+ICsJCS5k
YXRhID0gJmF0bWVsX3hsY2RjX2RjX3NhbWE3ZDY1LA0KPiArCX0sDQo+ICAgCXsgLyogc2VudGlu
ZWwgKi8gfSwNCj4gICB9Ow0KPiAgIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIGF0bWVsX2hsY2Rj
X29mX21hdGNoKTsNCg0KLS0gDQpUaGFua3MgYW5kIFJlZ2FyZHMsDQpNYW5pa2FuZGFuIE0uDQoN
Cg==

