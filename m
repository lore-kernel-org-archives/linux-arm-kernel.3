Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AEFE7719A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 08:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I+l2UqL438OHvJ0IOsercWPj8bifC5rb1gX9AjZUuiE=; b=I/Qx544ECmcIj5ajKswuLz4Dpj
	GyHctEmrVRhqwXGpGrbNRjLb7534IubvsdknLTNToxNr0f9vJJz5EDK706L7ujK4VSdK5xBuF7D5N
	zyChpYlDMUgsZHX64TWh9iyp+bE/FYcETSOy6MYMCrFFCEWrc3NczWxyW+V8CbsbgLKXCbt6GllY0
	TK7vFdeUGXl9A4CvPxcA0tzN88TaMO6HxXcz3yvip0Iof1Ja8JPoDmsxZwfab2gwBJaDvkY/N5fvn
	ILsUQ9neyawTuo7hR+pNxVXaVOH7bIIdz3gEEIw/6ESlFCj4b654QnoTlqGsym0AgyL+yzQrz+OG3
	v5SJz0WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRYy-00000007al4-3Gr9;
	Wed, 08 Jan 2025 08:37:16 +0000
Received: from [216.200.240.184] (helo=mailgw01.mediatek.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVQWT-00000007R9Q-0GvQ;
	Wed, 08 Jan 2025 07:30:56 +0000
X-UUID: 7115cb0ccd9211ef82ff63e91e7eb18c-20250108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=I+l2UqL438OHvJ0IOsercWPj8bifC5rb1gX9AjZUuiE=;
	b=MGOWgI97usT1U7bh6dnbofjEYmNdHmj8ByQjc4guDrTVVUneowdDmUHrSI1EmkGIQGljlXpCNt67/XkzjJtn3YN8HzI47iuVbk0FSrCrlNIl4/zfDfOgB1J9Q162OjziYtT1p+QPD2GrQDcRnHFqODZVys6VgW5LbtznxNN1gOg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:c5e63415-2666-4112-a42f-92d414ad0cad,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:56b68c37-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7115cb0ccd9211ef82ff63e91e7eb18c-20250108
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <jianjun.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1299060630; Wed, 08 Jan 2025 00:30:31 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 8 Jan 2025 15:30:29 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 8 Jan 2025 15:30:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ELZp0JiYanEGu18aO+/3ZTfT225MfCBpY+9dyAyktw56jaY3NXrnV8KJlXWwk8claRTRAD1xEpnWB6+MsgdxlvJiYprFyQQ/zSemgosXHioMVkyLoYjGYq/Zdzc4Psf1vNj/xc/2ncwNZllL4FQ/6DO3KLik1PIooxm5Kg3jI6ZnRGNc57Q9t/qF7cssr3DflohCLgCanQlFkG7vIHhMETFWjAn4vAPW/Q5BUs0R2og8RF3d2zBHJM4ai8ms1IX5ABUHlq30v/FkrMnWnwdLgrYIOEdTUSMhk2GDfh/ebm4GNMiDHzn8OcxB9Il7dCOEOXi7bSouoFEK6B31eqeL4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+l2UqL438OHvJ0IOsercWPj8bifC5rb1gX9AjZUuiE=;
 b=o/YJsMfW6UamJ4cEuXr6Y4ZyGG6xoVRvZsRduyZWA0TXQMX6i3aCPHsLi25hx88iQ4/jj9Klo7kfXCfYC7zJvt/ZnCwu+K90ZjGhuBg6yijeMCMWhph5rm7z+egJyZ7DrvOsyBgRDU74nSIyIg83wDmWnzL7iiDk77uq/Nxb4aSt6fKKO/97zhtJ9Wttj7/S1JwT47Ls1iefBuL7ko4b1bCcccYXfZQn9/lzywkm3D8bdOvWYXoDo/IBfeXdrYToHm7se9f2eLR80zlQjHHgt1p8NY2zJ2xsubrnYIeEBdN7OkfGbAJ/fMqKQHOXtCviZWJmIUwzmiCvtYH1gh51Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+l2UqL438OHvJ0IOsercWPj8bifC5rb1gX9AjZUuiE=;
 b=Zbl/FtNVMJrZgJki1iOK6uAiIAxu+zCpuC1XHYNKX4CcvyXanZVn5S0Rc9TfithbU4ZXoPfbJsqvkkf33gigmf26Kc6lfBlSNGiA9cA0AFdwF6FV8u3YfbMF0uXm77CgVzaStgLowK7o+hXTX7X7yvukpdavrqZl7Ce+LN3TZnA=
Received: from PSAPR03MB5365.apcprd03.prod.outlook.com (2603:1096:301:17::5)
 by TYSPR03MB8835.apcprd03.prod.outlook.com (2603:1096:405:96::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 07:30:25 +0000
Received: from PSAPR03MB5365.apcprd03.prod.outlook.com
 ([fe80::1c6e:6591:5151:27e6]) by PSAPR03MB5365.apcprd03.prod.outlook.com
 ([fe80::1c6e:6591:5151:27e6%3]) with mapi id 15.20.8314.015; Wed, 8 Jan 2025
 07:30:24 +0000
From: =?utf-8?B?Smlhbmp1biBXYW5nICjnjovlu7rlhpsp?= <Jianjun.Wang@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "manivannan.sadhasivam@linaro.org"
	<manivannan.sadhasivam@linaro.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "kw@linux.com"
	<kw@linux.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, =?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?=
	<Xavier.Chang@mediatek.com>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Ryder Lee <Ryder.Lee@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: PCI: mediatek-gen3: Add MT8196 support
Thread-Topic: [PATCH 1/5] dt-bindings: PCI: mediatek-gen3: Add MT8196 support
Thread-Index: AQHbXaTW76fSj2ANakexjY3C+uSV4rMEw32AgAS7TICAADKxgIABU9KAgAF5zACAAAP5gA==
Date: Wed, 8 Jan 2025 07:30:24 +0000
Message-ID: <d7b26561b60f8aee2674dfebc45856d7fba305eb.camel@mediatek.com>
References: <20250103060035.30688-1-jianjun.wang@mediatek.com>
	 <20250103060035.30688-2-jianjun.wang@mediatek.com>
	 <ndj6j2mmylipr7mxg42f3lcwgx55cvcjnuuofmlk6n6t5uz5pr@bxugolyfublc>
	 <04ae2a07e2c2d3c03e82596034b1b7711450a0ae.camel@mediatek.com>
	 <eb2088d3-81f6-4cb8-a4d7-6ef985aedbda@kernel.org>
	 <9b0a463312702fb78e4ca2ba79c9ec6b62e33c58.camel@mediatek.com>
	 <14a456bd-3f24-4daf-9329-873d0f051a83@kernel.org>
In-Reply-To: <14a456bd-3f24-4daf-9329-873d0f051a83@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5365:EE_|TYSPR03MB8835:EE_
x-ms-office365-filtering-correlation-id: 24c232a4-3b48-44ef-94f4-08dd2fb650c7
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RXlpWDJ3cHVmUWJwWXJkcGozaDlRL2VTc0hkeXFyRUFmL0t4WHJPeXhMNDNB?=
 =?utf-8?B?eGlDUTZScXBZd3dNWHhzOVlmVSs3Umk5L0oxUzNaeTVEZmV3ZFQzSGhIcENH?=
 =?utf-8?B?VnJ4U0VVd2RLOXhJRG9kRTNqMXd5bGk1N2VlS0pEcUVQa3pQNlJpN2xzOUh2?=
 =?utf-8?B?T2EvZk5VMkF0OGxGWm04NDNMVTZYZ3lJclZ2Szg3WDc1TVRjZ3lMV3VRSDlk?=
 =?utf-8?B?ZHBzT08rdkFQKy9abmNaTHp0V25ZQVlUcTBHNDFER0dLQm42L1BFV01XZUdW?=
 =?utf-8?B?YWRlWGZ0aDFaLzA1UnRhQzl5L00zaEpHMHYxWDRFREVVd2VPOFVLSi95bnhX?=
 =?utf-8?B?Z2U2S2hmanhRUGROeEJKdFpFTFhCV2d1VVNRMGI1eXNQcHVkMVhZQVh2STZy?=
 =?utf-8?B?UjZBWk9OdHdVSXAyeWh6a3Irc0JrNm5DWnExTURqL3o5cDNVL0U3S2JDNVZQ?=
 =?utf-8?B?eS9xNk1BbHQ3NmwzSFdqZjN0OWFCQ1hneHlMUTlzajMzMVA1eXlvN0w0OWpK?=
 =?utf-8?B?bldPakJ1WkZYTXFMc1RkY3d5b1kzYzVBK0dNdkZuMDZmbVhaM2VqRDJNK1BY?=
 =?utf-8?B?K204eDR4VzkxQmhxOWZwaXdaeVlQUE5sQWR4QVFMWjFTM2pBTDRLN25tSXFS?=
 =?utf-8?B?WTZGQk5mSkFmK2REUkZQbXZpU1J3L0VnK052Q0pkMFBhRkZqYVdVbG5veU9y?=
 =?utf-8?B?TGE0d0ZqSGIzYlI4T04yV0Z4bzYzaHdpMVVmMlV2NW9BdXk3My9zYURFRmJU?=
 =?utf-8?B?cThuUHBVSUhBMkdHSkZXeUFRaGJyTTdMSFVsM0d3TG40cU81Um0xOERMcDJh?=
 =?utf-8?B?aUhiKzlvODdVL3JaV21FNkk0eFRQd1d1WTJTTVVVd2FxL04vOHdzUm0vQmhi?=
 =?utf-8?B?ZXZmMnpOR2puWjlzYmZNbjUzV1ZJTW4yZ0lEbWRreGsva0pGUno3UlFOUnh2?=
 =?utf-8?B?YmZLSmZ0bTBRSVU3eEhITS80UWdqZnZTZXdmSGJFMHl0cW5MUUdEY1BVbENm?=
 =?utf-8?B?ckY0NGE4QlpSMmJCNDFqcjVCaWtWOEszTnppTU5CdThWRlRuYUN3U2wrY0Zn?=
 =?utf-8?B?bUMzTlU3YnJNNU84NG9LaVVaTHE4SDN5aDlsRmxnK3BackZHSjROaHlJVy92?=
 =?utf-8?B?YWo1Y1kvd2MrV3oxUTIzL2g2TmNuVXAwSG5TbWlSRndsWWw4Ym91NmtwbVhr?=
 =?utf-8?B?bE9vMjE3SFhLdi92OTRrWFJJMXVHaGh3T3d0R1dWb0hnL1ozaTFnemIySmxn?=
 =?utf-8?B?R1NWOHhPdm5iTDczTkhja2d3VUhZODNJOHgybG9SYXJ5dFpKUDhESzNJT1lv?=
 =?utf-8?B?YXVIT0c4Y0hNbHVlemExY0VHN2J4T1hIYlVWS2RPK2Y3RWEweDVId20rdW9Y?=
 =?utf-8?B?UjM3K2NHN2NzRnVlcGcvOFBVdjNzRytTdmd0WXF5SXJQTEVBZ2pTY0ZaUzNO?=
 =?utf-8?B?M3FmeUFKUmwwb1pGSys5Q1Y2Q05NSmRiTml3Sk9vejNpbEM5MTdPeEZibm5t?=
 =?utf-8?B?RkI1Q0U4UFlYME5NRUJvamlPVUNyMXVVanovR3h0cVJ6ZEo1cGJYVzhvZmUx?=
 =?utf-8?B?dmtVcHkvNHV0Lzg3Q1FVSEwzOHJiZ1MzRmcwWEJEMDdHbVdDTDFVMDhSN3Bk?=
 =?utf-8?B?bEpid2t1MnlSdXpvMm9keE94aE1SckYxTHFQQVNtQXNzNFRqQm52VUFoOStk?=
 =?utf-8?B?NnVuem1ad2JtQ0pqMmM4YW1YMEdFaDFlRUREekJzRnljWUhIMmZTOUhKQUZN?=
 =?utf-8?B?QTdrY0dPTGxIOTZuZ2praTJwb2hRanZZYkR5a0pBK1ErOWxxYzk0L0JPTkJo?=
 =?utf-8?B?UFNxN09PZTIxNGxrVWhHbkxRemVUd096Y2tpSU5ZWXBvcWhvOThIUThoYnZj?=
 =?utf-8?B?MmFzUW1mMytnN1RxSGRRbXk5dzNUdmJ2R29oR0oxdW5hd25kTFozcWQ5WGpk?=
 =?utf-8?Q?bR8pIGcsnCbvD8k6Ca/tWBGDFK2hTxzF?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5365.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MzN3VXlMZmNqQWVaTTluclZIWlZBREhYMEQvcXdxTUhaenhnWE9sMmc1dEYr?=
 =?utf-8?B?MXVVS0tJTUZlYWtCOWtDd0I2Szh6dFRPV2pLaXh0S2RGWHkrMENONjFZMmVJ?=
 =?utf-8?B?RDkvNVRlOFREd3dlbzgwc2FZYWpwZ1poK3NTQWZCVzRteVVPUWhHQVBMcUZz?=
 =?utf-8?B?ZmVoZ2tsK2hYL21VRFhmbkRxeDJ0eDA5czNlNjlWcWwwM0ZOL3JIQVJWTEd3?=
 =?utf-8?B?VDFqSXRpa2ZoUmFWVDJvMXZQeUoxalYvUzhxa29HZ0hHWmhMT0NKOTdpdWJP?=
 =?utf-8?B?anoyNUZEL1pMVG9WMVduS0hPUDZOdzJqTmZ1VFM0WDBtZTlNZW1kd09LNmJu?=
 =?utf-8?B?YXlES05BSkRaQ2tGem9abkt1d0R5M2V6a2M3NkJ5bDczNEh0SlE2OE9pcnc2?=
 =?utf-8?B?ZkVPN2tJaURUN2NnUXpMR1Y5V21zSHpIVGVleFFYWUdsUHFvdWRKcjVmUGJP?=
 =?utf-8?B?U05JM2hOb05yQ3IxWWdIMGtSYjkxMCsvMGVTOEpSTWtqVitmMWVUeE9HczNY?=
 =?utf-8?B?RTJmR3cxemJxaEhKeGhpRk5IdDBkM3pWWWtJSXdyd2xYTlp4MUU0QmtsZHYv?=
 =?utf-8?B?bGp5WnNxWll6cmZRYUxwR0pQM3JjS0Nkb3FFMnNyT2kxOCtDam5vWkV6ODVT?=
 =?utf-8?B?K1FVT21kd2RmcmJ1dFRKOGNHV1UzUW53ZTBhOUdRaVFPdzZvUU4zQVQ4aTRx?=
 =?utf-8?B?RDdtR0NxS3FHdGF2bTV1M2YxaG13dXk1b3ZPQUhWaWg4U1U3bHZFUzlwMSth?=
 =?utf-8?B?dXp0ckhiL1N4YzRkWVczbGx3RVlYbmxoNWIzZ1dSS29DcVBSUGJXb2dQWUV6?=
 =?utf-8?B?ZkJPellxdWswN0tBMkg4TENmbHN4dlc5OWRMS1RGWXo2NGF0OGRNRlZOV1FL?=
 =?utf-8?B?SkVxYWppY3M3eE5rTEMrYlAyd0NWZERraU5Cdit5Y3NpWVZYNVpoY0laV0h5?=
 =?utf-8?B?WVRsV0pUVVZ0cVkzZkMyRk82VGJ1OGxYUmxnTDU1alVHcWpDN0Z0dTJ6RUZK?=
 =?utf-8?B?VGM3Y3E2U29qQmd0Mm8wc0EzZ2RJUkJLWUdqV2ZqaCtTNThIK2xNdVpXU2lN?=
 =?utf-8?B?VWxqaVVEL0xmU3J2NnpBdmJJb1hVcVdpODRCalFkTGxpZnh4Y1EvSUMwMThC?=
 =?utf-8?B?QURtYXNoSEZXVlM2S3RUL1VMcWhXMUtneGRvaFplZHpwc1d6MXBRYXVKeXlS?=
 =?utf-8?B?Ky9rU3JhYkdMd0VxdFROd0RoVHdZMzBRbHFza0tXZ2MxM3BYUTFYVWF6TnlJ?=
 =?utf-8?B?WDNmeWk1SDJCbkd4MnNrU0d5RWRITGpyVG9mWXQzbllVbHdscWJFb3FIemc2?=
 =?utf-8?B?eVFFczFaRVJySHUyUXpHSzVwQ1VDNDlPNFo3NjZhRzZ2bUVBbjZTajdtL1Ev?=
 =?utf-8?B?djR1WGR6U1YwSDhiNThXanlqSGZrWWpkdVlqL1pqN3BMS3laYVNTSEk5cmNQ?=
 =?utf-8?B?TXB4RlpBS1o2YS80RU91VmVMQWIwa0NUbldaRDZGc1FhenB6UFN4U0VYbVlk?=
 =?utf-8?B?Y0x3QitGUEl5cEdMN0R6TWhGeFFsNzkzU3BpTTNiT3d3T3VwZWVNUXduaGdv?=
 =?utf-8?B?ZlBGTS9sbW82ZkVBODZIV1BxY2kvRTVUaXBjNmpUZ3NGVGNldzVFYkIrdVNw?=
 =?utf-8?B?MUh0bVhwNW90Z1NSRFNJT0ZhZmdlSVdiZFE5NVFvMGd0ZlBmK2IyQ3EwYWtJ?=
 =?utf-8?B?WGFWT28vMzJrK2phQ1ljbnBOZi96Wk5nZUVYcVJPVFRwTHVMSUdaY1VVSjZI?=
 =?utf-8?B?WUw5b3VBZmtOUkpXNHBIMThlQkxDZUVYbU1mZWJTMHVCTGFEK3dweStEakN4?=
 =?utf-8?B?cStrZ0xaMkI5QzJUei9zVURIQ3BGVytld28rMnlwL29BZUk2S1g5U2JJN05a?=
 =?utf-8?B?bmViZ08yVTVjZWFpZ2MzbXlwSkZjVWJRampNdXJocUVnZmFHMFZzSHpjbjVq?=
 =?utf-8?B?RUMrTUZMdUFuSVcrZ28vWUYrNENWTjRaOWtCS3lhVFJRUU1LS2tZRW1wRU12?=
 =?utf-8?B?aktmcG9CUnRrcmZpR1ZSWG5JQ3I2eXlyS2srNjk1S0k3dFFMbU9XMTBRaTBE?=
 =?utf-8?B?OEdaZTZNSzNLVm9OQUhWZzBLRm90dS9BUys5TDVaaSt4WCszdkxURDJGUVRt?=
 =?utf-8?B?TmtJUFIyR05FellhT3hOekIvZU9sWkEzallCWDZISkJ2bUpTREd1M2hCbEJq?=
 =?utf-8?B?YXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <24079CE99B7F2B47861E83CC42EACBBE@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5365.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24c232a4-3b48-44ef-94f4-08dd2fb650c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2025 07:30:24.2126
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fEwKbo/sBJ9T8ORxVRCWBs43uSrvVkvFhV/34TSA4DDBfbviELJjnsgnd3jsWBZBFIwQ4dahn31/TIDzbo3E2XQMcG+lZUl3lBkzImYIn50=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8835
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_233054_039337_DB2E18B6 
X-CRM114-Status: GOOD (  22.97  )
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

T24gV2VkLCAyMDI1LTAxLTA4IGF0IDA4OjE2ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDA3LzAxLzIwMjUgMDk6NDMsIEppYW5qdW4gV2FuZyAo
546L5bu65YabKSB3cm90ZToNCj4gPiBPbiBNb24sIDIwMjUtMDEtMDYgYXQgMTM6MjcgKzAxMDAs
IEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+ID4gPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFz
ZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cw0KPiA+ID4gdW50aWwNCj4g
PiA+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ID4gPiAN
Cj4gPiA+IA0KPiA+ID4gT24gMDYvMDEvMjAyNSAxMDoyNiwgSmlhbmp1biBXYW5nICjnjovlu7rl
hpspIHdyb3RlOg0KPiA+ID4gPiBPbiBGcmksIDIwMjUtMDEtMDMgYXQgMTA6MTAgKzAxMDAsIEty
enlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+ID4gPiA+ID4gRXh0ZXJuYWwgZW1haWwgOiBQbGVh
c2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4NCj4gPiA+ID4gPiBhdHRhY2htZW50cw0KPiA+
ID4gPiA+IHVudGlsDQo+ID4gPiA+ID4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0
aGUgY29udGVudC4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBPbiBGcmksIEph
biAwMywgMjAyNSBhdCAwMjowMDoxMVBNICswODAwLCBKaWFuanVuIFdhbmcgd3JvdGU6DQo+ID4g
PiA+ID4gPiArICAgICAgICBjbG9jay1uYW1lczoNCj4gPiA+ID4gPiA+ICsgICAgICAgICAgaXRl
bXM6DQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgLSBjb25zdDogcGxfMjUwbQ0KPiA+ID4gPiA+
ID4gKyAgICAgICAgICAgIC0gY29uc3Q6IHRsXzI2bQ0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAg
IC0gY29uc3Q6IHBlcmlfMjZtDQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgLSBjb25zdDogcGVy
aV9tZW0NCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAtIGNvbnN0OiBhaGJfYXBiDQo+ID4gPiA+
ID4gPiArICAgICAgICAgICAgLSBjb25zdDogbG93X3Bvd2VyDQo+ID4gPiA+ID4gPiArDQo+ID4g
PiA+ID4gPiArICAgICAgICByZXNldHM6DQo+ID4gPiA+ID4gPiArICAgICAgICAgIG1pbkl0ZW1z
OiAxDQo+ID4gPiA+ID4gPiArICAgICAgICAgIG1heEl0ZW1zOiAyDQo+ID4gPiA+ID4gPiArDQo+
ID4gPiA+ID4gPiArICAgICAgICByZXNldC1uYW1lczoNCj4gPiA+ID4gPiA+ICsgICAgICAgICAg
bWluSXRlbXM6IDENCj4gPiA+ID4gPiA+ICsgICAgICAgICAgbWF4SXRlbXM6IDINCj4gPiA+ID4g
PiANCj4gPiA+ID4gPiBXaHkgcmVzZXRzIGFyZSBmbGV4aWJsZT8NCj4gPiA+ID4gDQo+ID4gPiA+
IFRoZXJlIGFyZSB0d28gcmVzZXRzLCBvbmUgZm9yIE1BQyBhbmQgYW5vdGhlciBmb3IgUEhZLCBz
b21lDQo+ID4gPiA+IHBsYXRmb3Jtcw0KPiA+ID4gPiBtYXkgb25seSB1c2Ugb25lIG9mIHRoZW0u
DQo+ID4gPiANCj4gPiA+IEV2ZW4gbW9yZSBxdWVzdGlvbnMuIFdoYXQgZG9lcyBpdCBtZWFuIHVz
ZT8gSXMgaXQgdGhlcmUgb3IgaXMgaXQNCj4gPiA+IG5vdD8NCj4gPiANCj4gPiBJdCB3aWxsIGJl
IHVzZWQgYnkgY2FsbGluZyB0aGUgcmVzZXQgY29udHJvbGxlcidzIEFQSXMgaW4gdGhlIFBDSWUN
Cj4gPiBjb250cm9sbGVyIGRyaXZlci4gSWRlYWxseSwgaXQgc2hvdWxkIGJlIGRlLWFzc2VydGVk
IGJlZm9yZSBQQ0llDQo+ID4gaW5pdGlhbGl6YXRpb24gYW5kIHNob3VsZCBiZSBhc3NlcnRlZCBp
ZiBQQ0llIHBvd2VycyBkb3duIG9yIHRoZQ0KPiA+IGRyaXZlcg0KPiA+IGlzIHJlbW92ZWQuDQo+
IA0KPiBTbyBpdCBpcyB0aGVyZT8gVGhlbiBkcm9wIG1pbkl0ZW1zLg0KPiANCj4gPiANCj4gPiA+
IFBsYXRmb3JtIGxpa2UgU29DPyBCdXQgdGhpcyBpcyBvbmUgc3BlY2lmaWMgU29DLCBpdCBjYW5u
b3QgYmUNCj4gPiA+IHVzZWQgb24NCj4gPiA+IGRpZmZlcmVudCBTb0MuDQo+ID4gDQo+ID4gWWVz
LCBpdCBzaG91bGQgYmUgU29DLCBlYWNoIFNvQyBoYXZlIGl0cyBvd24gcmVzZXRzLCBhbmQgdGhl
IG51bWJlcg0KPiA+IG9mDQo+ID4gcmVzZXRzIGZvciBlYWNoIFNvQyBpcyBkZWZpbmVkIGJ5IHRo
ZSBoYXJkd2FyZSBkZXNpZ24sIG1vc3QgU29Dcw0KPiA+IHNob3VsZA0KPiA+IGhhdmUgb25lIHJl
c2V0IGZvciBNQUMgYW5kIG9uZSByZXNldCBmb3IgUEhZLg0KPiANCj4gWW91IHJlc3BvbmQgd2l0
aCBzb21lIG9idmlvdXMgdGhpbmdzLCBzbyB0aGlzIHJldmlldyB3b24ndCB3b3JrLg0KPiBQcm9w
ZXJ0aWVzIGFyZSBzdXBwb3NlZCB0byBiZSBjb25zdHJhaW5lZC4gWW91ciBhcmd1bWVudHMgdGhh
dA0KPiBzb21ldGhpbmcNCj4gZWxzZSBoYXMgc29tZXRoaW5nIGVsc2UsIGRvIG5vdCBhcHBseS4g
SXQgZG9lcyBub3QgbWF0dGVyIHdoYXQNCj4gc29tZXRoaW5nDQo+IGVsc2UgaGFzLg0KPiANCj4g
PiANCj4gPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gV291bGQgeW91IHByZWZlciB0byBzZXQgdGhl
IG51bWJlciBvZiByZXNldHMgdG8gYSBmaXhlZCB2YWx1ZQ0KPiA+ID4gPiBmb3INCj4gPiA+ID4g
c3BlY2lmaWMgcGxhdGZvcm1zPw0KPiA+ID4gDQo+ID4gPiBFdmVyeXRoaW5nIHNob3VsZCBiZSBj
b25zdHJhaW5lZCB0byBtYXRjaCBoYXJkd2FyZS4NCj4gPiANCj4gPiBGb3IgTVQ4MTk2LCB0aGVy
ZSBhcmUgMiByZXNldHMuIFNob3VsZCBJIHVzZSBhIGZpeGVkIGl0ZW0gaW4gdGhpcw0KPiA+IGNh
c2U/DQo+IA0KPiBZZXMuIEkgYXNrZWQgd2h5IHRoaXMgc29jIGhhcyB0aGlzIGZsZXhpYmxlIGFu
ZCB5b3Ugc3BlYWsgYWJvdXQgc29tZQ0KPiBvdGhlciBzb2NzLg0KDQpHb3QgaXQsIHNvcnJ5IGZv
ciB0aGUgbm9pc2UsIHdpbGwgZml4IGl0IGluIHRoZSBuZXh0IHZlcnNpb24uDQoNClRoYW5rcy4N
Cg0KPiANCj4gDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPiANCg==

