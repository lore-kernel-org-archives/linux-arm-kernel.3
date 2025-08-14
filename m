Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA00CCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 03:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7JmZtq02oA5H+o3xnJztpqTuss6sBDVQTD2EwqjpOco=; b=v7hL53Qr5auQoZp14As9g5QEKR
	V7iaHve+hqWmrlSH4/6MbmAB7fAzo75alNbJAJ/TWStl14l1bYSu5iDt6O2zhEifX6aRHrkz/2HhZ
	bdf6493sZ+2UtR2a1vNHAveyyEWzsHhtOGz7NMVp2K+jXTd9X51/D7UvqcPLdnN7lj0c7uYpktawr
	d680lhwb4dypYY0DS3Nf3f5YeJ1dch77EsLCYNHwIMAXglA2ihsK7+vsszGy2sjrAOnRPRMbNP5YG
	Ec9F6w95ZxKaDE3Lr02HnHG/tHJB/Gjdo6Omukkpu1Ah1Kn57UenDmwDpJK3nOZ2ExTTdoXhnHpkY
	in9QIcQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umOfb-0000000FeuP-2InY;
	Thu, 14 Aug 2025 03:30:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umOcy-0000000Feef-3V9f;
	Thu, 14 Aug 2025 03:27:46 +0000
X-UUID: a1fda8c078be11f09f706fa2197c6ceb-20250813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=7JmZtq02oA5H+o3xnJztpqTuss6sBDVQTD2EwqjpOco=;
	b=EDD+QEJcFtk4UesAvZCIPZBJR+ctOtSulOb7DawMiX8IO9WjqMxsIK0NbypBXGzhDLIflWm0qwXJy7iicjap93wwcTHzDkoieIbqZi/W5kZAXeupUTGJ53N+7rahoosUJW95nmMcAF9xItPc83PpbsxB7ckvKRi1o0/bNl5J8ss=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:e46b167a-1640-4535-8174-2f95d2d7bf2a,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:81ab346d-c2f4-47a6-876f-59a53e9ecc6e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a1fda8c078be11f09f706fa2197c6ceb-20250813
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <liju-clr.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 563119340; Wed, 13 Aug 2025 20:27:40 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 14 Aug 2025 11:27:37 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 14 Aug 2025 11:27:37 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JADfFz+sIaFqA6iIWsW65kVU2bVil4Cw6il16hUH1+iC0TOO3UmN1VIg52Urp4un7tYiZNYy1I07wSKiP0i571lLyurK2r8AdC36jBpPwhw9QJGUXdE4EsLJFln7S+rXYXBl93dsT39BIJsZIHwua0eJQ6BG6jGZD3GdftG/enOj9Gvn+zEFB8LlnKxmwRSN83lN1grFvG/ewE0Fts8G02PrYhsemGHofMHNUkTCkToXsBIX+04aR3SZRJhpW495P8D/LY6PCWVsV9XkQoLkSyP7lwKm1lGCFQbII0KFTsy1B5w1GVt+DNbIeZIi7Cvbwg70h4QVcPvLoQUOOEpACg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7JmZtq02oA5H+o3xnJztpqTuss6sBDVQTD2EwqjpOco=;
 b=ns5gI3zWZdX8IsV44taLMQcxocvxWOIDsumOvnCYE9nXfbaeHU8q5nxsoo6YikC1ShFPL0WwNdGeys3HFzIYnKw0ePiCENRcpF5wNDOZsEF7jUpkIg7pOQZv3R8blrt9UzXDhLjTBU8DsheKKnk7mkmRQ7vApxMtLOxeXRW0LWavyU8H2WeyzZABGyE2F79T90X5CCmBW8/4aCneV2nOAxnG7dbG44iyFf2kN5hpHj8U2KqdGvC3qs3SDWfkL/f7v2oZ/TZknFSDgGMoIFhqNEfMAxcxRDe3ewmrgUusBXKic8I2iQoNxAwlQpbtJzQ+3BKNGzxAo1rojxgbPhWcmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JmZtq02oA5H+o3xnJztpqTuss6sBDVQTD2EwqjpOco=;
 b=hM7bTbDHmJfTIl6iDQkplMuKSyet/VU6Vke+3G2Fq0wPdPT+PZ6zcKzFu+xoJLTvyLfM7zPp4uJnrvWEhWsrVBZkfCU+JrbSoaGWY+/+2d2u8+LVrizWjleuJUswvR7iZENmyyyyoPq4CeEqkqWgPG86MWrGJoCCkf0xLWn5o5Q=
Received: from SEZPR03MB8273.apcprd03.prod.outlook.com (2603:1096:101:19a::11)
 by SEZPR03MB6524.apcprd03.prod.outlook.com (2603:1096:101:73::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 14 Aug
 2025 03:27:34 +0000
Received: from SEZPR03MB8273.apcprd03.prod.outlook.com
 ([fe80::f7ac:70cb:3cb4:acac]) by SEZPR03MB8273.apcprd03.prod.outlook.com
 ([fe80::f7ac:70cb:3cb4:acac%5]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 03:27:34 +0000
From: =?utf-8?B?TGlqdS1jbHIgQ2hlbiAo6Zmz6bqX5aaCKQ==?=
	<Liju-clr.Chen@mediatek.com>
To: "corbet@lwn.net" <corbet@lwn.net>, "krzk@kernel.org" <krzk@kernel.org>,
	=?utf-8?B?WmUteXUgV2FuZyAo546L5r6k5a6HKQ==?= <Ze-yu.Wang@mediatek.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "rostedt@goodmis.org"
	<rostedt@goodmis.org>, "robh@kernel.org" <robh@kernel.org>,
	"mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>,
	"mhiramat@kernel.org" <mhiramat@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "will@kernel.org" <will@kernel.org>,
	=?utf-8?B?WWluZ3NoaXVhbiBQYW4gKOa9mOepjui7kik=?=
	<Yingshiuan.Pan@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"richardcochran@gmail.com" <richardcochran@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: =?utf-8?B?U2hhd24gSHNpYW8gKOiVreW/l+elpSk=?= <shawn.hsiao@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?S2V2ZW5ueSBIc2llaCAo6Kyd5a6c6Iq4KQ==?=
	<Kevenny.Hsieh@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, =?utf-8?B?Q2hpLXNoZW4gWWVoICjokYnlpYfou5Ip?=
	<Chi-shen.Yeh@mediatek.com>, "linux-trace-kernel@vger.kernel.org"
	<linux-trace-kernel@vger.kernel.org>,
	=?utf-8?B?UGVpTHVuIFN1ZWkgKOmai+WfueWAqyk=?= <PeiLun.Suei@mediatek.com>
Subject: Re: [PATCH v13 04/25] virt: geniezone: Add GenieZone hypervisor
 driver
Thread-Topic: [PATCH v13 04/25] virt: geniezone: Add GenieZone hypervisor
 driver
Thread-Index: AQHbNn029Xq+tnHy3U+kHaTtB6IkebLg5LqAgX9dFQCAAAecAIAC4FmA
Date: Thu, 14 Aug 2025 03:27:34 +0000
Message-ID: <1bc18dc60615e3eda0afe35a597b77dfd05ce010.camel@mediatek.com>
References: <20241114100802.4116-1-liju-clr.chen@mediatek.com>
	 <20241114100802.4116-5-liju-clr.chen@mediatek.com>
	 <7b79d4b5-ba91-41a0-90d1-c64bcab53cec@kernel.org>
	 <cb84d8d87a67516f9b92a89f81fe4efc088f7617.camel@mediatek.com>
	 <c44c9aad-b08e-4be8-b135-258305b1f950@kernel.org>
In-Reply-To: <c44c9aad-b08e-4be8-b135-258305b1f950@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB8273:EE_|SEZPR03MB6524:EE_
x-ms-office365-filtering-correlation-id: a525f0f1-bea1-4f99-f191-08dddae282ae
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OGxWNmlwMlh2endVQmlZYVlUa1dNVmY0VFhqamFiNWJ5Rko1bExJc0tzUTdu?=
 =?utf-8?B?ZlRSaElBQTFBejRBTmVjWVpOS0Z3YnFlV2hIbWFZZXk0NTBPbGdZdElNSCta?=
 =?utf-8?B?THVvUGJ4VXNpOVFiUFJNVXdNSGNhTUczVHlTVHFuU0ZlNURVa29US0wvSHBp?=
 =?utf-8?B?MVBRS0w5c1phajZub0duUERGMld1bkExT0RqdlV2N0Y1dVptbFovRnFKQ0xR?=
 =?utf-8?B?Y3EwOCt3ZTFObk9FQ1Q4M21FVzVJSXg5a3Jnd3grUTdJc21rWmUvd01QOVUv?=
 =?utf-8?B?azZuU3pGYWp4VGtVeFZJM0F6bjlIRUxFaGFzVlE4S1AyOHl3RUZzM2VseGpa?=
 =?utf-8?B?QXlkdDJ2MUorUGJnOGkzV25ENU1DL283Zkk5VW9kdW1qZjdoMExVWktnUlZS?=
 =?utf-8?B?NWlzYWZhY0lUYm52Rkc4VjQxUk1NMDE5Y09YVU9NeWxLZ0xNcEt3YU5LcFNn?=
 =?utf-8?B?SWo1NkRRNGNkV0xoNXR6OHd0eVUzNm1SSk9OanVWcy85SFNyTE1XM1FoY28z?=
 =?utf-8?B?ZHlIaW1qSGxhQWQycUI1dWh3WlhlRXorbGJ6REhSbjlhSE8xdWRJWWpUREtZ?=
 =?utf-8?B?WFJPbEhadWR1NTR6OHRTRi9hVTNhU25wcVJtcUxHR1JEWFgwYWJ2SjBZTVcw?=
 =?utf-8?B?elZjSzY3Ym1PYjJ1S3o1RUowbmd5U2VVNzRWRUR1UndrMmZ2N2FGYldTcFVs?=
 =?utf-8?B?NTVxTzFMZU91b0cvOU9LZHRKb3FFbUEyeUorNWVRNFEybXREVk1zT1VPVlBE?=
 =?utf-8?B?eGxUdmR1SnQvb2pUZHZHS2EvU0dJaUl5OG9FalBUWjRhVnhLM1FESFpFU0p1?=
 =?utf-8?B?Ry9IWG9YUXRENmVWSU8wSHNqWUNYWGl1Vzk2OGdyNXhZRFc5V1kyUnIvaXp2?=
 =?utf-8?B?MnRKcmppdE5yWXVqZ0ZRN0RoSG1zZnlDZHpYcVEzbU1ranBZcFpDRExzcmls?=
 =?utf-8?B?YlRkbzVENERSWFFGZDE0ay82NlhYWkxmY01BWVE2T1VTb0ZiL0pVQTRvdklo?=
 =?utf-8?B?MXkyYXFtS2hWY0w5aTRBM1RjNDlmL0FxZGNXbXRaQ2xWa0xLcTJZV2gyZGhE?=
 =?utf-8?B?bUFCN0o4ajk4bkVTNHpvZnBOVXJKUXBxVmMyL3FXZENiT1ZSeHhNOFNhMzhV?=
 =?utf-8?B?cmZhVEgrUnZDNFJEaDFxSHdrZWo5Zk8wY3pWYkR6bkRTZEVMR1NIQXRTZHUr?=
 =?utf-8?B?L2JJQ0hyeTlRS3cvbjRVT01VSzdoZ2dEc1IyWWhLUGFyVXNkY2djbHdnbEgr?=
 =?utf-8?B?dlZzeWsyNWhzaGNkZW1FT3FmUVl1Ym91Q2Z0RmwvRllPVXl6RVB1SEJRakh5?=
 =?utf-8?B?dTF0M3ZVQW8xb3dEcFQ0UGZJQVZrc0FWUktNOExWbjNrdzVMZ3N4cjJZVUN0?=
 =?utf-8?B?ZHB0bk9TTzFnS09JWTIxYmpiUEt6NzFhNEFrRFFJNmJ4S1p0WEJSa3JJd2ti?=
 =?utf-8?B?NDEyQ3pCT0lnZnk5UzJRUzd0NUNyZXphVFljS0FJVktHcnV3Mld2QXl4eCt1?=
 =?utf-8?B?bFNleHJTK1NXRGR1UnRUOHJaT2hCdGlxWnVmWWlhS1VHbFFaZWhXOWtNdlVm?=
 =?utf-8?B?aGRHcTZuNGZCY0pYWHFTMExhcFBsVWRPakhpM2pyZGs5S0F2R0Jnb2NVZDJI?=
 =?utf-8?B?L043RmQ2UnFQdVNQMXEveVdzcjc4ZG14OU8zY0NoNEF2ZmEvM0tWb084cFZN?=
 =?utf-8?B?czgyb2p5bkxBZFhxeUJ5Zi90MHdJUHJUS2hwUnVnWFBBTW8wNTJVT0p6Tndn?=
 =?utf-8?B?b2JQL3ZuWXNaQm1tTG9CQjFiM0dmVkVWSXdKTUZuQndrMEMwTnhqcGh1aTlz?=
 =?utf-8?B?YzNwSlJuaEVoRnZWcU94aEUyNitpRWl2UkhucVYwcXFRaklJZmovNTFaUnBU?=
 =?utf-8?B?ZG5iTGxxU21YSENOUnRRemV3VFZqRlU1UjIwd2pIWWhCUXB4dW1IRURhVUU0?=
 =?utf-8?B?WTBFa1dqdFh4ZkY5ZzdiZVAydnhPS25zOHA3VGZ1UkUzaXRma3dnNkpURGl1?=
 =?utf-8?Q?hYZEbcrF4MjIgzixyfwIcqz+mIq9v8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB8273.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cDhPRVZmNlRhcHI0cjlUdEQxN0JUV1lOSlVlS1BLL0o4MWlBRDcxZ1ZkTG0z?=
 =?utf-8?B?dHJQZkxPSzhlWjIxWmZVQUVzV1BValFDNmdxazNWTUlxT1B1NHQ3amQ4MnVp?=
 =?utf-8?B?N0haSWtjUmJiUHkrQWgybmFaWWNENElRZ2Z2Y2pnb2VhUEdFY293bm92dnVw?=
 =?utf-8?B?c3Jnd0xDOGEvU0hvVENiSzlxMFQ3cTdQZEF6WGZ5ZzQrSXdtWWZhK3dOeTdH?=
 =?utf-8?B?aEZhNm9BUVNKMmdoQkxxVnZyT1YzRTZmYnJWd0ZWbXVaSzFaSVE4S0xTK1Qy?=
 =?utf-8?B?Q2ZaajQvYXc3TnIwNXZxV2pBcnMzK2EzRVM2dWNHbDkrUmtkZ3RQZDBuTCtF?=
 =?utf-8?B?RVoxVms1YUZLWHdXNTF4VVd6WkpTTGVVM3RpczVHRFdnbC85UDVZY2xxNVNZ?=
 =?utf-8?B?c2k0c2hiTHEzQVJSaWl5ZEpudHVBVEFweHk4UnQ3cmMwYW54OS9LN21xOGlJ?=
 =?utf-8?B?NkhLeE9oTURqd1pNWktXbUtaQ0QxcUhzMCtnMzZoQitRRVNPcjdRazZIYWN4?=
 =?utf-8?B?b1c3Mzd3ZXpJU3UzVFVvby80MUxHdDd1RXM5a0VRRlJGNEswL2tSSG5wUXBR?=
 =?utf-8?B?dk4zaDg5M3VwWVFRWUV3WWRneEFOWnQzVS9aWEk3Y21vSEM5d3RPWEozcTRD?=
 =?utf-8?B?MUE1blFQRXBzem5Pd0dkTEtYblRqSjA1aUVNbmcxYVlXNWdlZkZaWlZ4ekFH?=
 =?utf-8?B?ZGtPQWc2TGZwN2o0NE1JVlVRQkNzKzZUY2lWb0kzelluV0Z2VGxHTWY0ck8r?=
 =?utf-8?B?bVZUS1JhaDlYejVobVhRVzRydGxqZDN4d09qZThadHkwWHk3WDdwbms5enpW?=
 =?utf-8?B?ZW9lOHNKVFNsNVl4MnZPZ3Ayb253Zm9TSFBpUjlYS2dtYTZvSUMyQngzY05s?=
 =?utf-8?B?WFlzNDhZaGYzN25nYWo5cUlNK1AySVRIVHRLeDRlSUdlOWlJblkvMmtjNGhz?=
 =?utf-8?B?aDVUN0lLdVZ6WU5xYXZObGVSZ0srTkFMb1dUNVNSTmhZdko3QlV6MkwyZnB5?=
 =?utf-8?B?enk0TDhOMUhJdXlYS2RLZmNva1BWTnQvWGlrN1dQTWZxcGVkQ0R6UEtJZVEw?=
 =?utf-8?B?dGNod1VtRituQVNhQlZpUHBhZUVuc01tamdHVGRRMmpiZVpITTNPMEh5c1Nz?=
 =?utf-8?B?K0traWs0U253ZnBaOVkwQVRoOExvWm0vZjFud2VNTk9FTVNaRHJjZDBvZzhT?=
 =?utf-8?B?Q3VmcGEwb09HUExWRXhjK3MrbEtHTFNJanBwUHBzQ3FmN2dpN2xGd1ozSkpx?=
 =?utf-8?B?SHI4RzBYbHo3VTQrcDNzR0JIblByWTZTcVV6eXRlYW1FbDZaQngxSkJ0RDcx?=
 =?utf-8?B?OW9vMzQyQXJSb3FMdzFLSkd0bzJmT2VsY0JYS1JYMGdnblBSWFBJVkdrRW5H?=
 =?utf-8?B?dWgxQkNrOWdsZEFwODgzUnE4RUNNSk9PMzFmdkV1N05pL2FCdjdkeG1HUzUz?=
 =?utf-8?B?a3J6eHQwTVFoWWdLK2x4NXpxTDkzaEY4UE52VjVFMmVGM1hSZVFyNnpqdkxG?=
 =?utf-8?B?OGhyMFRJRFlaNVRBM2lwSGs4ZVJTamJTaWZDN2RQRFdIVDl4cHpxaFl6S2Iw?=
 =?utf-8?B?aktURm9UWUwrUXpvVm5MaG1yUFBsc1ppTkdDNVJnUmdIVHZPQTJ4VXpEbk5u?=
 =?utf-8?B?UThKZzF5RFVVSDZyeEV4NnhOWUJsNTVXU3BYQ2dmdGJIQUdJblBGVlZ2MGh2?=
 =?utf-8?B?RlA2ZTlWVzZ2VVhSQ3U0Rzg0OENOOTlBNUNFVGtsd2pLbzNWUG95RHBET0dG?=
 =?utf-8?B?NHV2U1ltK2Z4R211ZHV1UTR4eS9XWVJwYk81eDJ4LzlncHNJK1drKy9rdjh5?=
 =?utf-8?B?elM3M0xWVER0ZG9Db1ZRT0gvTEt3NzFrcDRmN0ZlcFpwazFWL0RGQWFCYTd5?=
 =?utf-8?B?OEhZTS9LQ0Vma1VPQnNHRndNM3h1RG15dWd3RG5BaEZ6dURkRG5qNDB4TDRY?=
 =?utf-8?B?cFIrUHVGeWJiNkQxRUYrREJuZkh6WFIrcDRnOC9iOFBJZDBUaVBvOUZTZW80?=
 =?utf-8?B?TEJobHJTRmlIMzdEalJRYThZZ3Q3bkRZN0hGdmhvWG1sclZET3FTOTY4YnlS?=
 =?utf-8?B?YjNOdzFYbzB1SnZWSkVoVGpJNlFiSmNFT0QrN0JQbDQwSmsxN1dnVXk2cXV6?=
 =?utf-8?B?NG5rK2dMTkZlZGU1YVJnd2I5NTQ1K2NYeGd2K01Ra1ZDS2tWY0FxbXlQM21l?=
 =?utf-8?Q?AcL9fl3HmEltWeC1AmNd4aQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7EEE02581779F43901F7C73C9D7ACE5@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB8273.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a525f0f1-bea1-4f99-f191-08dddae282ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2025 03:27:34.6372
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /e8EZDZh6C2Uh1POoASPs8nzLw0jAVEIodrKTy9LYPjaCuMdmBqLVeCpMFYDCDVrnW6J5EInT0Wpz4W5U7DIYFKOxjCRvMv4XhFjtvRqcdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6524
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_202744_892926_082C8232 
X-CRM114-Status: GOOD (  16.69  )
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

T24gVHVlLCAyMDI1LTA4LTEyIGF0IDA5OjMyICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBPbiAxMi8wOC8yMDI1IDA5OjA0LCBMaWp1LWNsciBD
aGVuICjpmbPpupflpoIpIHdyb3RlOg0KPiA+IHdlIGhhdmUgZ3VhcmRlZCB0aGUgZ3p2bSBkcml2
ZXIgd2l0aCB0aGUgQ09ORklHX01US19HWlZNIEtjb25maWcNCj4gPiBvcHRpb24uIFRoaXMgZW5z
dXJlcyB0aGUgY29kZSBpcyBvbmx5IGNvbXBpbGVkIGFuZCBhY3RpdmUgb24NCj4gPiBzZWxlY3Rl
ZA0KPiA+IHBsYXRmb3JtcywgYW5kIHdpbGwgbm90IGFmZmVjdCBvdGhlciB1c2VycyBvciBzeXN0
ZW1zLg0KPiANCj4gVGhhdCBpcyBzaW1wbHkgbm90IHRydWUsIHNpbmNlIGl0IHdpbGwgYmUgZW5h
YmxlZCBpbiBkZWZjb25maWcgaW4NCj4gRVZFUlkNCj4gcGxhdGZvcm0uIExvb2sgdXAgYXBwcm9h
Y2ggb2Ygc2luZ2xlIGtlcm5lbCBhbmQgc2luZ2xlIGltYWdlLg0KPiANCj4gQmVzdCByZWdhcmRz
LA0KPiBLcnp5c3p0b2YNCg0KSGkgS3J6eXN6dG9mLA0KDQpUaGFuayB5b3UgZm9yIGV4cGxhaW5p
bmcgd2h5IHRoZSBLY29uZmlnIG9wdGlvbiBjYW5ub3QgcHJldmVudA0KcG9sbHV0aW5nIGFsbCBz
eXN0ZW1zIGR1ZSB0byB0aGUgc2luZ2xlIGtlcm5lbCBhcHByb2FjaC4NCg0KQXMgeW91IG1lbnRp
b25lZCwgdXNpbmcgS2NvbmZpZyBjYW5ub3Qgc29sdmUgdGhlIGlzc3VlIG9mIHBvbGx1dGluZyBh
bGwNCnN5c3RlbXMsIHNvIHByb2JpbmcgZGlyZWN0bHkgaXMgbm90IHJlY29tbWVuZGVkLg0KDQpU
aGUgb3RoZXIgbWV0aG9kIEkga25vdyBpcyB0byB1c2UgYSBEVCBub2RlLCBidXQgdGhlIGNvbW11
bml0eSBkb2VzIG5vdA0KYWNjZXB0IERUIG5vZGVzIHdpdGhvdXQgcmVhbCBoYXJkd2FyZSByZXNv
dXJjZXMuDQoNCkN1cnJlbnRseSwgdGhlc2UgYXJlIHRoZSBvbmx5IHR3byBtZXRob2RzIEkgYW0g
YXdhcmUgb2YuIEkgd2lsbA0KY29udGludWUgdG8gbG9vayBmb3Igb3RoZXIgcG9zc2libGUgc29s
dXRpb25zLCBhbmQgYW55IHN1Z2dlc3Rpb25zDQp3b3VsZCBiZSBhcHByZWNpYXRlZC4NCg0KVGhh
bmsgeW91IGFnYWluIGZvciB5b3VyIGZlZWRiYWNrLg0KDQpCZXN0IFJlZ2FyZHMsDQpMaWp1LWNs
ciBDaGVuDQo=

