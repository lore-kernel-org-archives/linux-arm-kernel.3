Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74597C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 08:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+fKVLMJDgqOzM2AJVsapDIB7NBWbP0uSiLzwxR4b0A=; b=vsE/redhK+tHkA9Ih1b9VX8Y/U
	znKZUmrX74EhksiGVfbk9auRJZLwvfWoEXf4GeEmgRUY8pcJv6RSDDfIka+z3+8I4PTbJ25+5GMOs
	ZhkITxcuM9JwKIUH7502Gzz6ihFqVPJU3dwSW/YBk2jgm04MVShZQKyJnib3FJhd5O9w32RZPZJag
	BBEvQsGko6CDJuXyVDlU05eniqC6eSe81T2v4J/buPl6xtOYbmDmqP0HNRvttvSlI+qYEC25l4s2h
	CMCVJxMtLwrhKcya1av0pLZyik2r6lP0wLcTXyn/9l8L8JZvpn7tTl0fNQ44v7wXT0nLkCjaRx65J
	cYJ6WwHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8L6-00000001pWB-2TFW;
	Tue, 22 Jul 2025 08:27:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8Ay-00000001n3f-2aZd;
	Tue, 22 Jul 2025 08:16:41 +0000
X-UUID: 2e9919c466d411f09eb0dd999d3936bf-20250722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=t+fKVLMJDgqOzM2AJVsapDIB7NBWbP0uSiLzwxR4b0A=;
	b=GMu9d6s4hJz5L8smO9Z+1E4IkeTOw5yi815OwtFMHWr5DnLsiK/l83xLzKICNJC83DiEQHXgkMY/CvGFUeXWfu07Q7Z2lrrkJf0NlWjDh/PZNNztdyStA0VS5WdKjAypGeYOQXWZOwgN1+3AGD20N4B5tagoO02oqly0OZaI7Tk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:0afe93ad-8a20-4e0e-912d-a7e6ed003336,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:d5b3b484-a7ec-4748-8ac1-dca5703e241f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2e9919c466d411f09eb0dd999d3936bf-20250722
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1150843671; Tue, 22 Jul 2025 01:16:34 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 22 Jul 2025 16:16:31 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 22 Jul 2025 16:16:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lukj7tin21/NmSrfbZTJ1W4F6grvX0AkmgGacFJjD5XCuMyEqeADov2VwrvjOx7PBv1MIAl7AePI4BJiQ0rmhTBILABZJp0/qaj7+4fnSttkrACUD3/eGa+fDjGwfPWnm4RPc7bVJO4Op5GRzp6/svdH0vL1Hc0CD7UWvIMV5XM0WeKYwdTG7PuCMCz+e20Fcgzq1BTXiUae7k95RmGDcFmBRvXdmh9VDoE8Rmv+GAQ1b7+dfD2tnDbus0HWqsibn7/iAnAtG/vLkcMF78EUE8kKcJEQ7eoduU3dcs4ruHybo6sNB7Oopo5O3uICK0xICNbDRBe/x83UHPu8fgsEcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+fKVLMJDgqOzM2AJVsapDIB7NBWbP0uSiLzwxR4b0A=;
 b=hUkI4BjxJVXejyOP+2UaBBGwVobVYnzZdIzJBPTAd5uG4EDpx/SDUycjVZsPfcqt46JYx4QiOg79bUuaaMWjELNjU/Eudc7mODf6fJUnOwRYm2n9X1Ck5jISkjq89XYEsHqzwbtmot20uAAsBjWvC043bRzSKnGjGn98GrKxcusqNEa/pci0/tOBjQrrg+/wTHrhCpjjYk3ifWMQv+S5mf9sfI8V4b62B0qc9rVL3ECJlyzp8aT8GV+uJFGp5MuG2MQD9MY/0GpczaEwZq7Uzb0tMu1rc3pHqGSw3zoa5bdm7QMGkBy7ecLzPg/a8G69Tn9nKovAY1Qe0OOd8ojHuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+fKVLMJDgqOzM2AJVsapDIB7NBWbP0uSiLzwxR4b0A=;
 b=ADsy6Z7D/wNOBL9poIbdLESc/7dg/Y/6pgUf47cXZMzyMho9xUqM/R5lIu5wtxs/Jtva6U8b54XCJ91V5AJb7iwle2MSufRxiHG6yv7IEa/sR2S3XzwtdDORNirxUSC/6LW5Yr/fMfDfR33nUR55JusLAypsZd4N5B3J0QDsW0U=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by TYZPR03MB6979.apcprd03.prod.outlook.com (2603:1096:400:284::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 08:16:29 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece%4]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 08:16:29 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?R2VvcmdlIFN1biAo5a2Z5p6XKQ==?= <George.Sun@mediatek.com>,
	=?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"andrzejtp2010@gmail.com" <andrzejtp2010@gmail.com>, "nhebert@chromium.org"
	<nhebert@chromium.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>,
	=?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	=?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
	"robh@kernel.org" <robh@kernel.org>, "sebastian.fricke@collabora.com"
	<sebastian.fricke@collabora.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "christophe.jaillet@wanadoo.fr"
	<christophe.jaillet@wanadoo.fr>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"arnd@arndb.de" <arnd@arndb.de>,
	=?utf-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
	<Andrew-CT.Chen@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 7/8] dt-bindings: media: Add MT8189
 mediatek,vcodec-encoder
Thread-Topic: [PATCH v1 7/8] dt-bindings: media: Add MT8189
 mediatek,vcodec-encoder
Thread-Index: AQHb+i4mtZyJaKiOLECv2gcLkk8xwbQ9v6cAgAAN1QA=
Date: Tue, 22 Jul 2025 08:16:29 +0000
Message-ID: <1d51ab1398ea0eec7bcaeaa31f52e4c39d11bd7b.camel@mediatek.com>
References: <20250721105520.5625-1-kyrie.wu@mediatek.com>
	 <20250721105520.5625-8-kyrie.wu@mediatek.com>
	 <20250722-lovely-mustard-scorpion-e07e92@kuoka>
In-Reply-To: <20250722-lovely-mustard-scorpion-e07e92@kuoka>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|TYZPR03MB6979:EE_
x-ms-office365-filtering-correlation-id: 327ed8e7-be51-4701-b09f-08ddc8f80fb5
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VStSbTFXOENuUHZNV1RzYUxCSjd5L25GVEw3a2xrdDBmTkdWT29sZW11K01x?=
 =?utf-8?B?TXI3WmNvaUhWWlNFSjcwUHNBaXU5dzV4ZUllbml2RHU1Zmd4YVZndldaRUtn?=
 =?utf-8?B?SjNZM2pwTUVEeGpHRXNRMkZWUDhpUnpIZmtRM0FxOS9XRU56bXh0b2JzQ1lV?=
 =?utf-8?B?ZERyVWMrbHJMK01zT2tObUI1RzIweDlOK1d0VTdHb3ZiaDh5dXNHUU9aZkRW?=
 =?utf-8?B?K2tHMm5QZUtrbGx1L3F4YVpCd1FjLzI4Q0pUZlcrNnBvYmFvL2pFbHh2aFFD?=
 =?utf-8?B?enVMc2ZzbitJTUtlOTJuU3hPQ3lFQmpiMTF1bFJtM04wVEh5UGQ3M3Z4WDJF?=
 =?utf-8?B?akp6TlAxbDRqdUdPVHBSYXM3a3ZmMkxLRXVadGhTMTh3M29HdFhEV2t3L0Zo?=
 =?utf-8?B?WVErbThEZkl5WW0zak1IWFZmL3FzQnpuQXlPZVZnZ1BQN0J4VFhJY1RrZ1VE?=
 =?utf-8?B?b09waWk4dERXV0xhZzQ0LzArWnZ1eGlEZmNwTUZUYWlLa2U4aEF2b1NwbHpQ?=
 =?utf-8?B?N2pVUjdsSjdLaFhibGZIR2I2NURTV3dZSWJZUExpYnpYaTQreEtZdFJkMmZa?=
 =?utf-8?B?T09JSUQ1SmZYRm93L1NXMG5WcDlEdnNyOUxsUTA2UWxROGRxZlExOElRZlZx?=
 =?utf-8?B?N3o2dGdPdFl1Y1JCbVE3VVl6NkYxSldab3J1RmZXa0pkWnNHOS9hSklaVndi?=
 =?utf-8?B?aHA5OHRaWHVTQjdvS3FmUVpoTTlPYkIzekVzV3cvZTVlTUZ4OHE5VG5QL29G?=
 =?utf-8?B?TWNZRGZtWkRha2VGWG1abWdmVmQwTExSK3Y2SXBobXM5d29ubmlYV0FrOXlI?=
 =?utf-8?B?a0pSLzlUU3hrYW0rK0RPVzAyd3IvUGNhVDlCWFZmNUtWM3NmNG5mTGhhUGdj?=
 =?utf-8?B?aU5lZ2FZUFo3bjg3M3ZOdTVZTjVEeXlqTUVsZTRTVzhuWVp0NFZZcDZWSzdU?=
 =?utf-8?B?WDkzVEM5YzBndlAxUEUyRkRROGdvaE0rUnhPOG1zK0U3cVBaVURYRUNFS3hQ?=
 =?utf-8?B?cEFVREk4eEtxbGhNMm9YVjk1UkZmdHFGWWRQZ1lZUnJQbXJjMVB5ZzVRTWNT?=
 =?utf-8?B?RW1zcGl6d2xiRTRmalh3ajgwb2o2WVppUlp6RlhVdkpqUVNOdHFBb3FSbm43?=
 =?utf-8?B?L1dDaENwNEx1TUhzZ3VFRGJrUER6cTlOdUNmV2Y3WXBhRXN5WS9WT3VrQk1R?=
 =?utf-8?B?QkIvNzVJdFJKZVRxcG1IMTY3eVA2TFVPdHE3SEI3UHl6bGxVSndKbGtFcXhY?=
 =?utf-8?B?ZkZPQTdoa0Y5ZVozckcvcGRiKzhLaEthTTh0UUJWeTVnT3BERFYxNU9LVjJR?=
 =?utf-8?B?RG1sWUZrRkhKY09IbmZYUjBDVnlTdERuSm9PQ2diSXpYYURsYWZtcjhBNXZo?=
 =?utf-8?B?UFJ0Ly9UN2kzWUNYSkt1YXZLOXBCRlU1OXBTNlRrbURSZGJNblh4eWR0SVNP?=
 =?utf-8?B?cXJFbnFYb3ZQMitlUFlNUEZVSlU0aW80MmhSelk1b3FwaXFCWi9XMmxkakJz?=
 =?utf-8?B?czJPclBXdE9aU1RZSVQxYWswVzRNeEM0dG1zaDhRSUZjWVN1ZnA2SDJOdjVo?=
 =?utf-8?B?TUJRcTFkQUdZQ1doSEIxcnROWFhQNG96M1FtWFh4S3QrWDBGL2xJTlBQUjNF?=
 =?utf-8?B?N0xRY1hsTnVXZjhBVFAzUW8vYkhVVzc0UnBXMVg2eE1MS0c1Y1dqQTBmQjNT?=
 =?utf-8?B?dUU0M3NtK1ArZU9MZ1hLbElmaUhuWGR1dnNvZ0l3Qkd3MjBxa280ekNEL0k2?=
 =?utf-8?B?YjJESTh2Q2tJNHJ5ZWE2VmFHMWdKSVJQZGc0ai8vNGdKQmNnbzBRMnpCRENn?=
 =?utf-8?B?bVRsYzNqSnZMUDVTekpORnpBMlUvSVgzWHR0RzdvN0NyWXRiK3JLeTNQRGZO?=
 =?utf-8?B?SlNqbUVwZjdKZ1psZ0g5M1BJV1JCbjNwRXRKRDkxZnBxS3hGSzEyK2NuOEJr?=
 =?utf-8?B?Tnoxem5BMklYOGtMa1NZazA3cFBjRHNOOExIMy9JUEMxMTVRNVJLYit3aG9M?=
 =?utf-8?B?b0tLYnhNV1ZnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RHNKSTVNbzJOOTBLam5XMU8ySktpcFBlNDdSQTJVMlBtUXEwSGVxL2xUZ3RS?=
 =?utf-8?B?eWo2bmhLRnQzbSs4aC9VdjJaQkxLZHp4U0tUVXU5UjRmbGsyamhkd2JkMkJy?=
 =?utf-8?B?bGRZUGQ5M1o1MXNSV0lVWjlJZEg1ZXVLSUp6eDQvSmFubyt3Wm9CeTVTMTZ1?=
 =?utf-8?B?SURsWkc4YmtmaWpRQzIxMDVFMm9kaFYyYlZuUnVhNEtPUFpoeXlKaElNc1dK?=
 =?utf-8?B?MEp1d1hRZWhKODdnVHQrbGlCV2NZNldkUXl1OCs5ZWRCOEI2eGMzeXJTTjNR?=
 =?utf-8?B?RWxwdnZtUXQxb0hoY1NaSkJNNkVtdHdnaENXNGZmVE5aT0Y1anVpQkkxcEZj?=
 =?utf-8?B?VWRFQmN6ZWsvNWZlellZS0V5bDljWmhoTDM0SlcrYjB5YnhYdExvNkpoUWRs?=
 =?utf-8?B?MHdRU0VUTk1RRzFaOC9NWjhqTGlJOVhEcU91WGVLQmV0alhjeStFRU1LSEZN?=
 =?utf-8?B?TUVPL2ZJRUFpeU1NakhiNzVxbmtRd2V3RzBtdnRSUlY0V0ljV293VUxMaS9X?=
 =?utf-8?B?aWFLUzhCV1gxdUxpdVJZM052WlJiQjR2SENYNnh3VEVjZ1ArZmNscS9xYlJi?=
 =?utf-8?B?SWZFQ2xjMGlUN2JOeHY1MVE3cStTSmtmSVNTUnR2THZocUw0UzAySGNpeFJl?=
 =?utf-8?B?Rmk0bE8yNHBZWUtBWWZqWWtMTlQxb2tiN01HTnFEYmYyNlh3YWd4Qkx0bU5N?=
 =?utf-8?B?NzZwNEhvOHFQdXY3NGwrc0dQbVBCTUpEdkJZNGdpcjVmaHBWUThvQVpVUzZU?=
 =?utf-8?B?RUxjbncrREZrOUt3N1BNUzlkZzRadi90VHAyVTBjaHV6RGFiQ1hwWlhpWEtl?=
 =?utf-8?B?Y0lyT3dQQXNQcmpERk84U1VyQSszRWozZ3Z4SUNQL2RhclFzUjlqUVZBVXVH?=
 =?utf-8?B?QTBXOTFQWTg0WjFaV0V3UFdwZGdpM2ZEemQ1LzZRT0JRUEh3RTMvMXVPQ3hK?=
 =?utf-8?B?Y3hVYlNWRW1oaU83MnJFNWpZbDZMcE5rS1daZDNQLy8ycC9UcnRPWk83a0lC?=
 =?utf-8?B?QjU1QkZlOURPSjVwamN6OGdaWkU5ZDlBWEtpeHRhdG4xV1JQRGU4cEUrbm9O?=
 =?utf-8?B?TmorTytzU3p5V1psMnN0U2MwSFhJMlc3bUJTTEVENjZVQzJYUUh2VlFoS1pw?=
 =?utf-8?B?TE1raE9KUk95dHgxQVd1bVBLaXhJT3VVcHRpcWdrdVBPNGJqZzgwSzd0MEhl?=
 =?utf-8?B?NmVhbjNvajVucjA3eGZ6dldPVG5nQlJJMnFCY1lRSUswQTNIeFNlNTViTG9s?=
 =?utf-8?B?NDQ3VnNTUGhYZjlnMFRkL2VOdGtKOHVMbndMeTFsaGw5eU5kWXhDWW5qOGZP?=
 =?utf-8?B?UTRzNStjVTVHVTUweDlObURiZ0N4TlRkckNobHNWOEJYaUFlMFBjSElROUJP?=
 =?utf-8?B?WWFsdW44a0R1YjlXcm9lSVZBVzk1OGh6OUtNalJxcDlGc0gxQVBoQnVBeGU0?=
 =?utf-8?B?R2dDaWtRTDBFbEN1SEdIdFVYK2dkN1d1MlZ2NzUrdnlva0ZOL1RqdER5Kzkv?=
 =?utf-8?B?YWx0d1A4OWV0ck02Q1k2SEEyUFBHK0N6bVp6ZDIzWnA3elpSOURZbUNTMUFI?=
 =?utf-8?B?bXZ1c05mNmVEeUpMcTJlL3dTeHZMK0VWdnliVlg1am5sL25DMGd1WG1KZndq?=
 =?utf-8?B?d0hHMmRDbW5rcVFHSk5DQU9ZZk15YjJKOUhlSURldUdObU8ySDhqajBxNmtu?=
 =?utf-8?B?K1hXbUUzc2dJNzdWdmo3NVRLMmNpTjk1cC9rbmZ0bXlSclRLNTYvc1pRNVFn?=
 =?utf-8?B?VVA0RFFqR1NxZEY3bVJwUjhpbmlMVm91ZU9TSW55WjNGdGR0WWtNWGp3dzlS?=
 =?utf-8?B?LzVEbllBeENydEl1WjJ3dzAxUWFibmovWGJWRU9UWVJ5R0xWVTdoSmtoOFFz?=
 =?utf-8?B?WnpTNEUzVUxkd3RLRzl1N3NSTnZDNHRuWTNDL3ZtQndIeUlGYmx4TUZVNHpV?=
 =?utf-8?B?Q0xDWDAwanRsMGQ3M0JzYlJWWDRyQ0Z2cVB2WnBFbk9JOFFKajF2M3U4TEhq?=
 =?utf-8?B?Q1lTWC9qRVQ1SzdJazg3WE0xOGc0ckk3dDh5UjBQTkJlSk5JR3ZmRkNHYUV0?=
 =?utf-8?B?ZUxZQnJHeXY4aUpHRkd3UlRRaHQwYXU0WHZPU3pSVmtBNXRrRHgyc3ptTFJC?=
 =?utf-8?Q?4nXr4t5VBs1zHap5/K3jqbZm6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6898221DEB92AE428D30C38CDC8969E3@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 327ed8e7-be51-4701-b09f-08ddc8f80fb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2025 08:16:29.7374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wyB+z4Cckrnik62ZYkVWRF7Rr0n5R5k9XgbSLLGtmkyMji/oQPM7JR5jBp1AWR85Pve6SN2BZGxsfnlOmpMD7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6979
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_011640_655124_425914DD 
X-CRM114-Status: GOOD (  13.38  )
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

T24gVHVlLCAyMDI1LTA3LTIyIGF0IDA5OjI2ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIE1vbiwgSnVsIDIxLCAyMDI1IGF0IDA2OjU1OjE5UE0g
KzA4MDAsIEt5cmllIFd1IHdyb3RlOg0KPiA+IEFkZCBNVDgxODkgZW5jb2RlciBjb21wYXRpYmxl
IHN0cmluZywgd2hpY2ggd2lsbCByZWZlcmVuY2UgU0NQDQo+ID4gZGV2aWNlLg0KPiANCj4gQW5k
IHRoZSBkZXZpY2UgaXMgbm90IGNvbXBhdGlibGUgb3IgaXMgZGlmZmVyZW50IGJlY2F1c2Ugb2Yg
d2hhdD8NCj4gDQo+IEFja2VkLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296
bG93c2tpQGxpbmFyby5vcmc+DQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPiAN
CkRlYXIgS3J6eXN6dG9mLA0KDQpUaGUgcmVhc29uLCBhZGRpbmcgYSBuZXcgY29tcGF0aWJsZSBz
dHJpbmdzIGZvciB0aGUgTVQ4MTg5IGVuY29kZXIsIGlzDQpzYW1lIGFzIGZvciBkZWNvZGVyLCB0
byB1c2UgZGlmZmVyZW50IG9mX2RldmljZV9pZCBkYXRhIGFuZCB0bw0KZGlzdGluZ3Vpc2ggdGhl
IGNoaXAgbmFtZS4NCg0KVGhhbmtzLg0KDQpSZWdhcmRzLA0KS3lyaWUuDQo=

