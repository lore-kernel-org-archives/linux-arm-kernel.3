Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B69D3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 09:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wYdtppTYuizxfAkSc7HHEaAmfPuP1tb6bNlblbL7cAA=; b=1zytXtOam0cIx207+Sj/61TZmx
	Bfk5qi2ke/M55Uess3bWAYtcI+RYTxd8b+vHe4XDM+YWTmcckb7qRtqOeC/8CAzjeIPpHObYmDuu8
	pb4ugbausBEb7av4nTQY16H/kO/G4y4Zb3P9Gn8NpjG3rQzs6vgCNlHqs/f7/xCdNHKyrfsZgcw/Z
	cDr6u/g6jI5n5rmXq3+lnpSuYBJcBgtISYWjYHbWxE4SOmc7o8QvRGSdl9hAkMj9EYl3CyrNi5C0A
	7hFxs1c2sT7USkEZZSEM0+1l/kI9KpKWMTcM0ljWZcC2XUOLobjaA5ORIpD7hrP+Jz3FOH+DQGUA4
	o53f6pUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUjI6-00000000f2t-0s2r;
	Mon, 06 Jan 2025 09:20:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUjGt-00000000ebM-2Ib7;
	Mon, 06 Jan 2025 09:19:40 +0000
X-UUID: 56d1bd7acc0f11ef82ff63e91e7eb18c-20250106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=wYdtppTYuizxfAkSc7HHEaAmfPuP1tb6bNlblbL7cAA=;
	b=cpn2/1Oax/kf1bweIcASD6HcrWCYr/XHeYlhHkZaWNQ43JgI2WEGpQa2UH9ACopbCT+/wM4rcmcUrNpeGiweZjfhV12o1XKiDpfdAuoi2PQwWtBX71X2gIoKKTzI22FbSkmuqB318VcNRQqAw7WnqVcdyLP3fPB/QB5DwJIKps0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:859184b6-56d5-4398-bac2-df8b203904c1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:76976e37-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 56d1bd7acc0f11ef82ff63e91e7eb18c-20250106
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <jianjun.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 731326340; Mon, 06 Jan 2025 02:19:32 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 6 Jan 2025 17:19:29 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 6 Jan 2025 17:19:29 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rDXqM3viwHF9kRKh/ZxMSmf7pMDsM8S+bS9QPEuC8wlNb7/djbmmhDpo8xC4RBTQ9IKZSxBEfGnwhrvNj8RaYBReWf0yYldRZaxe1Q1P6WL1zy3UyR3XdKUyNWna2s9c96BUnI2PVMsa1LlIt/tFbtAZC0uCWy/IsMBQXvlHgYKUTzjcErLDyMndMBUsw0i4TW8J6Kaw63s6GMxWuNIyp8/nTtmy5e2/6u6Hs3t5P3US9gfxLpuyth4H9cVnuWbG+Dz0MgVLKr37ZhsKwxsX8pimKOYbSBSQHIci9cc+EO09ZVqJOcnpHSKaK/mhoW0zGgwGiG742/B5D+l5x5KrVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYdtppTYuizxfAkSc7HHEaAmfPuP1tb6bNlblbL7cAA=;
 b=uupuuGm8+Y1FsUchiPqysB9jUAf4MHdjauBzIIPl+SrVMa8QIBf44AIY9cYGk00pwSdq4rohNx6qwuC35gRFcdCNEokrFTN/wkCPj5p2vtZqxPxJisC4jlb4KonAki5JLWBEgoT5Vz2/FCEw9mCBjuFSRQH1gXLAZ6YfUadlLQnbgwUVBqjTQzW51HAHBAFPlUuZs+QpAfLpTmLFRJIznJn3KZvk1LCVB0AzC7Ce7WqiI+s37IYzFUkjuHAy+oLDFJFZWVR9TQIjZofXQcdjlGXGZYT32r3w5VYi7wodti8irkhiRKksxLvJVzsFcP/CXj5N/QHjliK0BVUUqrgK2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYdtppTYuizxfAkSc7HHEaAmfPuP1tb6bNlblbL7cAA=;
 b=kzZtWXTHnZIKL7o5kca1njGaEjeQbaVhLYEyDpkndCOZqRf6zgQlEjP8wnEfKStnK6oufH9/irrkIB3/Fs1sjJImEHW/XyYjreqKhxZqkoxfvk/1+kL+CYO9zPSCpcWHumECv6qNGVglCDVe0VAD6d1dwE4hJuPIJa2qb2SnATM=
Received: from PSAPR03MB5365.apcprd03.prod.outlook.com (2603:1096:301:17::5)
 by JH0PR03MB7493.apcprd03.prod.outlook.com (2603:1096:990:a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Mon, 6 Jan
 2025 09:19:27 +0000
Received: from PSAPR03MB5365.apcprd03.prod.outlook.com
 ([fe80::1c6e:6591:5151:27e6]) by PSAPR03MB5365.apcprd03.prod.outlook.com
 ([fe80::1c6e:6591:5151:27e6%3]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 09:19:27 +0000
From: =?utf-8?B?Smlhbmp1biBXYW5nICjnjovlu7rlhpsp?= <Jianjun.Wang@mediatek.com>
To: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "kw@linux.com" <kw@linux.com>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, Ryder Lee <Ryder.Lee@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>
Subject: Re: [PATCH 1/5] dt-bindings: PCI: mediatek-gen3: Add MT8196 support
Thread-Topic: [PATCH 1/5] dt-bindings: PCI: mediatek-gen3: Add MT8196 support
Thread-Index: AQHbXaTW76fSj2ANakexjY3C+uSV4rMEx8+AgAS1EwA=
Date: Mon, 6 Jan 2025 09:19:26 +0000
Message-ID: <8269f5fb280d0847ceba288a83a64c99bbf92cb7.camel@mediatek.com>
References: <20250103060035.30688-1-jianjun.wang@mediatek.com>
	 <20250103060035.30688-2-jianjun.wang@mediatek.com>
	 <0555fb64-312d-4490-9b03-89fca580c602@collabora.com>
In-Reply-To: <0555fb64-312d-4490-9b03-89fca580c602@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5365:EE_|JH0PR03MB7493:EE_
x-ms-office365-filtering-correlation-id: 4ef5db86-1bb8-4c8c-0201-08dd2e3337c4
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7055299003|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aWNvaGtWSHRBRFY4dUtMZWJjZzJ4eVRLeTJLZG83d1B0bHplQTh0QStuOEs1?=
 =?utf-8?B?YVl6QkJ1WlAzL0xUaUdIbG50ZWVVRWRzOFMvTXJMY2ZvZlZWK0V1bVQxdXVM?=
 =?utf-8?B?RmlkZmNneENHdzdNZEVnZmZMQVA5Ynh5U0lpUjVzMUdpVzVmSVdDRnR5K1BC?=
 =?utf-8?B?V21NNVp5eU9FRlFlR2xKK0hsSFFHWGhaRUN0NXJSei92TUpITjBVS0FRY0ZU?=
 =?utf-8?B?dTF0TVZ5MGNXN3dLSkVjdVNBYkhvcnplbEE0czRiaUs0czJTem9BbXJGazgv?=
 =?utf-8?B?L1dpaytjN1lmdVN3YWdEeXBRNU9hRjMxdW93TUFpaFROekdvVXl4bExzNUVU?=
 =?utf-8?B?K0wwRHlUbEF3b3A3bWo4U05OZ0Q4Y2o3ZjhPcDhsQjZyTnhUQ0xWc3JPRFB6?=
 =?utf-8?B?Y1E5MEh4RnNhUEhHOXludkFPMVJpbFlLWTRoRHRBT2d4eDk5ek40NDJsVW5G?=
 =?utf-8?B?TytmcXF5Qmd5YmRtMGY3UTIvay94NXN4VUhlNm12QmpheHZvcUZVdFM1U01I?=
 =?utf-8?B?ajh6L3p0bUUyK3VpRjNPYlVFL2ZJVWtvQTZBYnU5d20ycWFZSkYrN3dkWURV?=
 =?utf-8?B?VjVmR3ZsQTVVZE5sdHNxejZacnZETUhLSkQ5Z0ZRYTl2R0ZNZTNydDAreHRO?=
 =?utf-8?B?RlpBalBDaDZLK0hvRHEwK1JsdjV2MWNkS3NzbXNWVXpDNXo5UHFQb05sZy84?=
 =?utf-8?B?dFV2bUt2YzhqTU0vN3QxcXpuK29yS1dKSXFRMzVacGtTYm95U3JCTzE5dTZY?=
 =?utf-8?B?NVI2VEIydUkzRUo1S0hqU3k4OW5tVGdCdG4ycDVvTnVCc3VlZzBJZzBZSXRP?=
 =?utf-8?B?UzZCbkFXUEthNVc4T29VenMxdGFCYnIzZHFPbmxwa1p5VFBBT0t4OGxKdklr?=
 =?utf-8?B?TEYxaHR0Rzg3ejAvRHB2a3M5NE5sNG8xaXhzM3g0WmhuczhoWWVma3psb2RW?=
 =?utf-8?B?VDRhaDgvUTFGTUszZ3FScE92Y2ZyV2l5MGIzbWV2cGF4dzFwK3RESWxMN1hQ?=
 =?utf-8?B?clI4Lzh0V2lKR2ZZR0lBcXJBMGx4dlpudm5kc2tJbENnWWNFSlpjS25OQ1JF?=
 =?utf-8?B?SVRJb2dFOUp4QmNrak5HSmN1bXRnbDZCZnE4YlZ3RFArYkxaMVRIa0dCNUdj?=
 =?utf-8?B?MTZRZSszWGM1VU9UUTBmUXo4Q3RnbjV2YzlqaUpldTZ6by8rVjd5anNFbmln?=
 =?utf-8?B?Y2ZOVnh6VHRtc0pnUmo1bitXbUZ4UUhST2RKNzN5NTd6L1hFbDEyWjBoS0o3?=
 =?utf-8?B?b3hKREp4ZkVJY2d3WW5oRnI2Um5LMEhERUN6M3NxRExQYzE1ZkJnSno2UTdQ?=
 =?utf-8?B?UXgwUHBjOUZNYjNjbW8ralpYdXNLVldKbDNxU2hGVmI2TmwvWDlqdTRBc0da?=
 =?utf-8?B?bm1YOTU3a0sxZXRQclVRRnBGVTlmUWJaVWV0Ykxzc2hVRmRKdlNvOHBFL0hP?=
 =?utf-8?B?cUdDNlBod2JjSWx2WmR0UUl3WUM0N2JrckNOd3pMSXExMXlNUTIwMENlSXVR?=
 =?utf-8?B?WERMbnMwMVBPVy9qR2RaL0JhVWRlRlJUY2M3c0YrUWpydmJIdTNrbDFYcjlN?=
 =?utf-8?B?WDBqMEMySW51S003VDc5ZjJZZFREMGs1TFo0SWJJTHg0TW1oTWEvbHhiSTda?=
 =?utf-8?B?Tm9lcGQvSmlCNGYxZUorR3RuUEN5cUd5TEp5UDBjRzRpUUNSaHdHcEJ0L0Zx?=
 =?utf-8?B?MGFVS094RzBPR0VPTVk4L24raU1HM3ZGaWhNbDRZcVlZOHpyaXhWSWRNbzdt?=
 =?utf-8?B?YU40MjJzdVZoanc0VzZaNXlwbEtXM1Nxa3FyVmc0bHo0eU9yMUwrYm1uWHVX?=
 =?utf-8?B?andOUVZlQ2dCMmFZZkVsVnp1TVNHd0Y2SFNoUkwxcFZEdWFzcms0S1gzWWUr?=
 =?utf-8?B?bHlMYUJmMVd5WXR0MzB5RXhXSEU1VkNrQXZhRDNMZnJPcDJWSVkwbDJ5MHdJ?=
 =?utf-8?B?TXNhQzc2dEtnQVZFZ2lJVUR0Z0VCcXIrOUY2bkFTeEloNll4TVY4WU5FWElk?=
 =?utf-8?B?eFd4VjYzM25RPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5365.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7055299003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YW1pR3BLVnN2WU4wVnU2R0xCSldvalhnZEpTYkt4S0xlbDhyWldoT0xTY2o5?=
 =?utf-8?B?aXltVHVUeTFYSXQyNGI5SCtUMVRVQWRHMXBENmFDZnFFYXZLVWdnUVRlYjZo?=
 =?utf-8?B?dFZKMWd1Y0pjMmVKZW5KMFlKRnZGR2NLdlZPN3Jod2JXSTlMZWNKbDJicjg5?=
 =?utf-8?B?WXpSaS81SCtyOUJTZ29zd0JtdXpnd3NzUFNINVVlR0l0cElFRGRiQ2lFM2Yw?=
 =?utf-8?B?K2M4d2dEaityb0lLMG41UEVGQUVVSitscUZiNUR4N0NWTkNvVmVCQ2JoVmZ4?=
 =?utf-8?B?RFZUMVdhTWJhSFc4YVYrU1JSUFBaa1RIa3RKMHNmaVk4cldXRUFBRWc2bkFL?=
 =?utf-8?B?ODRuSUFGdm80bmJWZUluTTZoRmY1UjVscGljdHJzMWdaRVliTnhWSlRFRkZX?=
 =?utf-8?B?eU9lVGpmdVVLR1RGZi9UdmxFRWlCTXBDQ3A1aUpCRXhlaTY4VnZhdDRYSkxs?=
 =?utf-8?B?YVFVTXZxRlEyZE56cWpDN2NCdDlUUzBIWEdvc1Y3U3EzY2MrTDZvTnRGZ3VL?=
 =?utf-8?B?T2FKQzFvRXcrQ3pSZEJZTytsUFdVM1ZnNnpvSUpBVHRYVmpsNTZOR1IyOTBT?=
 =?utf-8?B?dzEvT0M0MHliTlYzUDhtVTVGeG5KME5oTGJYSENGTWF1b2xXcEVSV0xweXQ1?=
 =?utf-8?B?ckhocHFBQTYzakYrZDhlVGZqbkdydkNKdGticHUyNlVvbis1Y1c4V3BpWFJi?=
 =?utf-8?B?TVFMbUFIdEZib2RqdWRwSHFVWVJ4L2w4RmhqKyt1MXBGOCszejZMQnFZSmJj?=
 =?utf-8?B?WDg0bDczOVBCWTREeGR6RU1SWjdXTHg5aDNHd205WFNVdEpJS1NhR2JpME9a?=
 =?utf-8?B?ZlB5bjVCRlpndFVmTmpqY0NVdCtodkoyNWpFcklUWHUyQUZFSk9VNDFINkhZ?=
 =?utf-8?B?RVVObGMzUWpldE82MWxMUFVYazgwMGVMVERlTkNBRnBCYVNMUG5ub3JxNkZ5?=
 =?utf-8?B?dlcveFUwQ0ZyYzQ0c3VvMzlqR3NIY3NxeUFDZk40UkdhcDdueDg0cGdhK1gx?=
 =?utf-8?B?eWtld1hMZDhkQnhwTkJXUm5QOGNiblZ1cFRBdDhIdXFLSUhwZTI4anhYaTYv?=
 =?utf-8?B?REt0S05NTm9LaFFidWdDcjc5U0tIWk1aR2lRRHJ6bU9OZTVTRko4d0pDa01Y?=
 =?utf-8?B?amR5WHBWbFVhQ2ZUZGRxbXFJNkJHcDFBRkxsNHNVZ2krRFdWU1dJa01adXhV?=
 =?utf-8?B?cytMNEErWFlwYzltWGNKdWljRzg3M3lERHJWT2VoeTQ4T1BHc0dad1ZaeFk0?=
 =?utf-8?B?VTI3aTZSKzlSSmhKMlI4VU9KWlNMcTk1eVV2eFlQTThYa1BPLzdtY0c1YVEr?=
 =?utf-8?B?ODUwY3c1eVpIMkNFeFVLZTVLb0FCRXdDNnphQi9qNHJJM2k1NkZUaUpsSzVQ?=
 =?utf-8?B?aWgrbFdKTFljK0VyZkxXbmJQWE5obVowc1N5ZHZnTnMvaFVya3NhcFllQlZZ?=
 =?utf-8?B?MEFPa3lSOFg4UlZBU3RDTkpCckpOazBxZzYrb2hJTi9XZnZXeE9LUjVuN3Vq?=
 =?utf-8?B?Z0R5Uk9WVXN6emRwUWZmZ1QzcjZuY3g3VisxdmhVcWZTYWJQMVBibmp4SVV3?=
 =?utf-8?B?Y1U0dmFkNXV3UnY1aEJSVUt6RjBIWGNQR3BsMjd6Q2R3ZENlUkN1S1ZiYWFW?=
 =?utf-8?B?Mm1XRjlQVDkwazZ2MWlSdXNvRVVnK2dFVEgrNTJPUDZ1TFQzZTk4bWJhbVpj?=
 =?utf-8?B?K0JNb1J1YVZqUUg0L0dyOUZBeXpQUVBoT3N0dWQxMkt6aU0va0gxZ1V4Y0pr?=
 =?utf-8?B?aERlek1paDgxem1YeGtmc0Z4WjRHZHIydTcxSWhqak1vdW9LSGFoNlBUZUFk?=
 =?utf-8?B?TEdNTTFreTl2UExRWHY0S3krZ2tGZ2kzOExPUEJsUlo5Um9wSmdYVEcwSnF1?=
 =?utf-8?B?RGpDa21pbFZtbFRGcThjVm1JS1dXM3JJamx2MmcyS1AzT3J2MCtVUDV0TVI1?=
 =?utf-8?B?dSt0akhQQzVRdk5wVERwcFpuM0lxaW5mdVFYTWZhUVcxUVptcHkzVmZHOHE5?=
 =?utf-8?B?R0FKbUJDUTQvVFQ0dm1ibmVaWkp6QjlKWGRFZnk0ZmRTSTJReTRia1Y4M1la?=
 =?utf-8?B?TElZQnJVTFJCeW9NQy9qU3BjUG9xcUVleldEOE9wVGQyaVVkeUwySUpsQ2RU?=
 =?utf-8?B?LzFtbFU0eUhxU1d6YzFjbDlYbXVRMGI1RkRCZTl6dmdUMHV5VnplM09Ncytx?=
 =?utf-8?B?RXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <47C7FD78392193489C75B2C00D55E21C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5365.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ef5db86-1bb8-4c8c-0201-08dd2e3337c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2025 09:19:26.9682
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jlEVyCy3vuBkHX5pQK4fbQLINXwrXmwYr/J3g9WLq7vi4NmER+frSmW10+bo0dzEF34QsjuX78kST9zLTdqCmpCSeUp2P6T4pYtK8b1LnWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7493
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_011939_606988_7A494D17 
X-CRM114-Status: GOOD (  18.95  )
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

T24gRnJpLCAyMDI1LTAxLTAzIGF0IDEwOjI2ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAwMy8wMS8yNSAwNzowMCwgSmlhbmp1biBX
YW5nIGhhIHNjcml0dG86DQo+ID4gQWRkIGNvbXBhdGlibGUgc3RyaW5nIGFuZCBjbG9jayBkZWZp
bml0aW9uIGZvciBNVDgxOTYuIEl0IGhhcyA2DQo+ID4gY2xvY2tzIGxpa2UNCj4gPiB0aGUgTVQ4
MTk1LCBidXQgMiBvZiB0aGVtIGFyZSBkaWZmZXJlbnQuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1i
eTogSmlhbmp1biBXYW5nIDxqaWFuanVuLndhbmdAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+
ICAgLi4uL2JpbmRpbmdzL3BjaS9tZWRpYXRlay1wY2llLWdlbjMueWFtbCAgICAgIHwgMjkNCj4g
PiArKysrKysrKysrKysrKysrKysrDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9u
cygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcGNpL21lZGlhdGVrLXBjaWUtDQo+ID4gZ2VuMy55YW1sIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9tZWRpYXRlay1wY2llLQ0KPiA+IGdlbjMueWFtbA0KPiA+
IGluZGV4IGYwNWFhYjJiMWFkZC4uYjQxNThhNjY2ZmI2IDEwMDY0NA0KPiA+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvbWVkaWF0ZWstcGNpZS1nZW4zLnlhbWwN
Cj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGNpL21lZGlhdGVr
LXBjaWUtZ2VuMy55YW1sDQo+ID4gQEAgLTUxLDYgKzUxLDcgQEAgcHJvcGVydGllczoNCj4gPiAg
ICAgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDc5ODYtcGNpZQ0KPiA+ICAgICAgICAgICAgICAg
ICAtIG1lZGlhdGVrLG10ODE4OC1wY2llDQo+ID4gICAgICAgICAgICAgICAgIC0gbWVkaWF0ZWss
bXQ4MTk1LXBjaWUNCj4gPiArICAgICAgICAgICAgICAtIG1lZGlhdGVrLG10ODE5Ni1wY2llDQo+
ID4gICAgICAgICAgICAgLSBjb25zdDogbWVkaWF0ZWssbXQ4MTkyLXBjaWUNCj4gPiAgICAgICAg
IC0gY29uc3Q6IG1lZGlhdGVrLG10ODE5Mi1wY2llDQo+ID4gICAgICAgICAtIGNvbnN0OiBhaXJv
aGEsZW43NTgxLXBjaWUNCj4gPiBAQCAtMTk3LDYgKzE5OCwzNCBAQCBhbGxPZjoNCj4gPiAgICAg
ICAgICAgICBtaW5JdGVtczogMQ0KPiA+ICAgICAgICAgICAgIG1heEl0ZW1zOiAyDQo+ID4gDQo+
ID4gKyAgLSBpZjoNCj4gPiArICAgICAgcHJvcGVydGllczoNCj4gPiArICAgICAgICBjb21wYXRp
YmxlOg0KPiA+ICsgICAgICAgICAgY29udGFpbnM6DQo+ID4gKyAgICAgICAgICAgIGVudW06DQo+
ID4gKyAgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgxOTYtcGNpZQ0KPiA+ICsgICAgdGhlbjoN
Cj4gPiArICAgICAgcHJvcGVydGllczoNCj4gPiArICAgICAgICBjbG9ja3M6DQo+ID4gKyAgICAg
ICAgICBtaW5JdGVtczogNg0KPiA+ICsNCj4gPiArICAgICAgICBjbG9jay1uYW1lczoNCj4gPiAr
ICAgICAgICAgIGl0ZW1zOg0KPiA+ICsgICAgICAgICAgICAtIGNvbnN0OiBwbF8yNTBtDQo+ID4g
KyAgICAgICAgICAgIC0gY29uc3Q6IHRsXzI2bQ0KPiA+ICsgICAgICAgICAgICAtIGNvbnN0OiBw
ZXJpXzI2bQ0KPiA+ICsgICAgICAgICAgICAtIGNvbnN0OiBwZXJpX21lbQ0KPiA+ICsgICAgICAg
ICAgICAtIGNvbnN0OiBhaGJfYXBiDQo+IA0KPiBhaGJfYXBiIGlzIGEgYnVzIGNsb2NrLCBzbyB5
b3UgY2FuIHNldCBpdCBhcw0KPiANCj4gLSBjb25zdDogYnVzDQoNCkFncmVlLCBJJ2xsIGNoYW5n
ZSBpdCB0byAiYnVzIiBpbiB0aGUgbmV4dCB2ZXJzaW9uLCB0aGFua3MuDQoNCj4gDQo+IA0KPiA+
ICsgICAgICAgICAgICAtIGNvbnN0OiBsb3dfcG93ZXINCj4gDQo+IENhbiB5b3UgcGxlYXNlIGNs
YXJpZnkgd2hhdCB0aGUgTFAgY2xvY2sgaXMgZm9yPw0KDQpUaGlzIGlzIGEgcG93ZXItc2F2aW5n
IGNsb2NrLiBJdHMgY2xvY2sgc291cmNlIGNvbnN1bWVzIGxlc3MgcG93ZXIgdGhhbg0KYSByZWd1
bGFyIGNsb2NrLCB3ZSBuZWVkIHRvIGtlZXAgdGhpcyBjbG9jayBvbiBpZiB3aGVuIGVudGVyaW5n
IEwxLjINCmR1cmluZyBzdXNwZW5kLg0KDQpUaGFua3MuDQoNCj4gDQo+IFRoYW5rcywNCj4gQW5n
ZWxvDQo+IA0KPiA+ICsNCj4gPiArICAgICAgICByZXNldHM6DQo+ID4gKyAgICAgICAgICBtaW5J
dGVtczogMQ0KPiA+ICsgICAgICAgICAgbWF4SXRlbXM6IDINCj4gPiArDQo+ID4gKyAgICAgICAg
cmVzZXQtbmFtZXM6DQo+ID4gKyAgICAgICAgICBtaW5JdGVtczogMQ0KPiA+ICsgICAgICAgICAg
bWF4SXRlbXM6IDINCj4gPiArDQo+ID4gICAgIC0gaWY6DQo+ID4gICAgICAgICBwcm9wZXJ0aWVz
Og0KPiA+ICAgICAgICAgICBjb21wYXRpYmxlOg0KPiANCj4gDQo=

