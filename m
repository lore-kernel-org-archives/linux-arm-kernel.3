Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D6EC36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 08:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YDb2e/egU5w4mLt1Y2Jnxs0Pg96j/BDUiBm1WdbHp+M=; b=wiJXJ87GqHOEqz+G3xkHwkzfpQ
	teSa2k9+7TlEHmNKuNYSvynoQrPIAeG9AgKD7IIuwk1OMZ5pI+bN250SSZeUIskIdjcln/0dIa982
	J2sRxZctaQIXX8UaRpzYjGcYWIUY02kBcWEMN9ksUeuNkk8ET8eQe+w3OTfqwKyQStjvRhDuRfH+T
	uRGX1jdN6WJP9aLtRbQ6yI7xhrZyz07+lFJc8PtVkAVnEXUY8W3gBmk5kSPR+Ncr6SnmFWWmuxSIt
	r0vEtb/xMtzNuB1Ei6WKixJwCsQr6qQH/wTqlryvV5qiGtq98uSu1C7KXsMmuBlRsrkbOdh2Wtyzj
	Da7kZ+wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9JuE-00000005SPl-1H1A;
	Mon, 28 Apr 2025 08:32:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9JiO-00000005O66-26ls;
	Mon, 28 Apr 2025 08:19:49 +0000
X-UUID: 89383d50240911f0a2405d5ef59ce188-20250428
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=YDb2e/egU5w4mLt1Y2Jnxs0Pg96j/BDUiBm1WdbHp+M=;
	b=ivnqQpbZgXWdnbH2COIGDrjISq8U89+uLJ26sg/smnEwMNP4b7MOumLpIGHpC4bGgiOIq58Wgn8NMdKuFZOWBL71tjDa7YFvSmBZi240JoshGb13lNcAxlMFCQWY5qtQFygws6nc3gIUunuHCKcFgShOrDy/YO+MjCriWr60VKk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:195b82fa-66a5-40dc-a0bb-f2c03dcce446,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:d7b1e076-5fec-4b3e-b8cb-933843551e81,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 89383d50240911f0a2405d5ef59ce188-20250428
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1214193485; Mon, 28 Apr 2025 01:19:42 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 28 Apr 2025 16:19:39 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 28 Apr 2025 16:19:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NwAShC6Gg5yo5ZECO5psBrP0rnn9JOQLn7qsz071rNOwtCVhYtfCKbMA8xokYvTLvDZiBGyVv4dU7iqtEsviDwLvQmAMt7Sdvhf6KLVvA1LbepACa58X4EcnB0c8CWxhky29HDOuv8wJroJzCmskB1NBmmG8HYGRiEOTeB6LAtDqnR1SXKAEZdpp9p/tNfOtN8ws6XcyCy4F2Vay6wQct/WjGV2t9gjUBdBZ7IbgYfM7ruJ6rjrvEQJ13bmIfJ/R9DMF4y+oWxUjj2oqEl5R5a7NvmOL7lcyZ0+u2t6BtnN+9rfecsx3jlhUqC3yr0RLhnVYq+E7xTI/yHDooyv/gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YDb2e/egU5w4mLt1Y2Jnxs0Pg96j/BDUiBm1WdbHp+M=;
 b=QG5ACadRxtEWjIAeq9PbcaJ3nqj9r55hFzXK9As9AxPwJvYOVruSOUc14ncJtGKdP8IlbWLBBYUkXthO31W91am852ifggYYyq4+8lwC4ncRFCZer6Wi8ATngd5EdgzKzAMdbTPk/hH8r4fUGOZI+G0uel39Dz+mOqhe8f0jyKOedcG+vOXbo2Xcf2my0Iljt/sm7k6P0cY2tTUEoYqyt2g8r08NCHuB2nA6QSOGKWVkVz0K8+LIFJtIU+X81hOuN0sikMEvL81eHzDMQ6loSqYJnRfDLG02ABzCt6l6hhi2sppC4/INu5vNcQ2KB2nwHM+Rm+tCAUx20gGMFMmvVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YDb2e/egU5w4mLt1Y2Jnxs0Pg96j/BDUiBm1WdbHp+M=;
 b=EplOzB/1PxsMhFDGbnA/mMgLGATz7yd94zeokRiJRxhpICBukKeAOlFoSfOHkCiJ9gBJ7DZ87GH7yX3t/42V0AWMCvyjy1ENwASm8/J6mPHBLdrSCBQqiXsqU+O9YXu6bh5xZjwFUul168j5Ai+72DiS7cXEPsIcKoEbCkLabDs=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by KL1PR03MB8449.apcprd03.prod.outlook.com (2603:1096:820:130::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.30; Mon, 28 Apr
 2025 08:19:35 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 08:19:35 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"kyrie.wu@mediatek.corp-partner.google.com"
	<kyrie.wu@mediatek.corp-partner.google.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 01/12] dt-bindings: media: mediatek,jpeg: Add mediatek,
 mt8196-jpgdec compatible
Thread-Topic: [PATCH v3 01/12] dt-bindings: media: mediatek,jpeg: Add
 mediatek, mt8196-jpgdec compatible
Thread-Index: AQHbtb+Ip9hi9FnUgUW7BFGiHpfbe7O4rBmAgAAU8wA=
Date: Mon, 28 Apr 2025 08:19:34 +0000
Message-ID: <5b6e70181b417f1b25df6fc1838b0ad600e29e9c.camel@mediatek.com>
References: <20250425085328.16929-1-kyrie.wu@mediatek.com>
	 <20250425085328.16929-2-kyrie.wu@mediatek.com>
	 <20250428-ambitious-deer-of-plenty-2a553a@kuoka>
In-Reply-To: <20250428-ambitious-deer-of-plenty-2a553a@kuoka>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|KL1PR03MB8449:EE_
x-ms-office365-filtering-correlation-id: b33fb1de-7dab-4e9d-b711-08dd862d68fe
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eHFVODBSTHphQktneFNJb0o5VC94Y2ZuaW1MNVZoNFBKTTlaR2hEUHpVNTdB?=
 =?utf-8?B?ZXQwejk4bVlpRGlyNm5ZZndaQVVBUk82M1RGQjg5ZzlXSERvWXZWdnpyZXlL?=
 =?utf-8?B?WFR4QmtJeEFPZmNZOFZhSWgvL3VvdmlUTDNkRVF2MUZSUzR1ajEyOGJCa1Rr?=
 =?utf-8?B?NUdocWlud0Q5Y3VjZGxoL3RJQVVObEVUUThTbTg0dXFCN2RvRGc2YytndDRG?=
 =?utf-8?B?MWhhQTIwK0RNUlNUZDZ0dGNHaEoydGdOZ2d4RlNTQmdNcmZ1NS9mNjdOM0dZ?=
 =?utf-8?B?NE45MnZvSVVYbnVvOXpLVzNadzgwZTVTdlNyVWpaS2VibmlBd09jWGRoZFpK?=
 =?utf-8?B?L0tFbXR5b2JoTlU2WUVmcUNieXlHMFhCVjJPenY0MlNIVUdKMDFRMEM3T2U5?=
 =?utf-8?B?djJaYktVN000b3BBMy9VSkwzcXh1V3k1cXJqZFEzNGhUK3lmeEtZeVlnbUdu?=
 =?utf-8?B?bERCRlNqdzh2cHlKM1hHYkQwanFJUzhUTVJBQmhEeFJySzZWV0xpVFd2eU16?=
 =?utf-8?B?cDFzdWVqV3J0eFFyelBLQzJVZG9HVFlwSVpFNlQ5ZXowbURkUm02eEZURUdt?=
 =?utf-8?B?VUwrZXVuZUx4MVRFZ2NmY0VoS0xLM3ovRW82d2tvcVFPa2dSaU9td2FDMlFT?=
 =?utf-8?B?VGp2Sy90eG14K2xkT2dYbGdva0hVNXNZZXhTbzA0Yll3V3pidEVNdnQyd1VM?=
 =?utf-8?B?Q05LK1Z1NjN3M1F1bHQxbXZ2ZEkrR2I5V1QvUVU4SE9ic0VvZmJqT1NRdGUy?=
 =?utf-8?B?YkVhbVFKTlpvMnVGMmhIY3JOVU5mSzA2MmhJTWpaVmNkK1JsT2dCb3VtR1Fv?=
 =?utf-8?B?N2ZJNXhaZkZaU1pnbUFyT1R5M3o2cGh4U1BYTGp0NmVqdmtPekNWWHMrUHVy?=
 =?utf-8?B?TUg2emxjU0ttRk1HWHh2anp2SmxwbXpmeVBCcEJsNXVpamJETTdQQmM1ZDZW?=
 =?utf-8?B?SXF4aVQwTEJDbG1zZG1HMTZZV0RyajFob1A1Ly80YW50ZFdkVWxheXp5bElk?=
 =?utf-8?B?RUNQbExmSWFQRkRjTDRod040alV2VnB4T3NRZjR0KytmdHVrWkhhZk16MGdo?=
 =?utf-8?B?NjBmMXFicnJwUW5Nci9uYTAxTUQwWHNCY1NjdjNGejVvZXJaaGVYb0kvVzdu?=
 =?utf-8?B?SzZYcWVJcXZVblZPbXUySUVCSEc4ZWlKakZFbHkzcFNKNitUcUNuMnFkSkZE?=
 =?utf-8?B?ZmZlSnc3M2hvYlVsWDB2RjhNRVlnNU5Wc0Q1UklGM2xUY01nYzVYMmNoQStI?=
 =?utf-8?B?RkE5dnAvNGFFaktEUFo3RTJWV0NaUmY1cWJQZk1RTktPdGJKM1JERG5URE1P?=
 =?utf-8?B?aHU2cjhCY3lLRDB0RmRBNmNFS1pJcko4T3MrTjRtVm1VTHdCeHlTWWZEUzNo?=
 =?utf-8?B?VkRORHpCaUZxZXZoWGlYWUlpanJaU1kxNXFHY3k4VGtMWWsyRW4zUDhPRUhG?=
 =?utf-8?B?SUdIWUlWaVBxbDNlczE2UHNVcjNxQS9aNXFvOXJvTmltT0t0S3hhR3ZWcnpP?=
 =?utf-8?B?N2F1MU51SWM2OE1JK2JMVUdNUWM0ZW9hdmhXQ2phNTJzcGNuM2Z6QWxXOHN1?=
 =?utf-8?B?NW5sdnVsT2VFK0R0aEZ6Wjl1K3ZCeW1WclNwMTU3cStqM05yOUFSN2kzWUJP?=
 =?utf-8?B?SmcrSkY3VnMxSEJTa0R3SUhJQkZnamxwSGNSQjdSRGJ4N3NISkszRW9tMm5L?=
 =?utf-8?B?NVlYZ0gzejhlTW42SEhpQ0x0a3pXc2JIVWMvZ2NUSHFBMVdRU1FXTVBEUzdi?=
 =?utf-8?B?Y3VsLzFIbG5rTlZPVDZ0dGZzazllSTVUOFB4TjZSZjRpUTVWWDU3d0lYak0v?=
 =?utf-8?B?RTBIVzlTTGtXTjhtMkJEZEpYdHhhWjdEZ01GcFJTM0hWR1NWelVTTkpoK2cx?=
 =?utf-8?B?d3o2TE5yOGRIOXVSQzUxNW9MbzRYVjI2cUVzeWZ0RC9pazlrZ1k5QllTZU5n?=
 =?utf-8?B?M0ZrbXhNV2lES1pyV3Y1UXBhbTkyM21UVk4zRDVwdkF1RDQxZEtjMnkxV3JM?=
 =?utf-8?Q?jheyoY9cnG6gZLLM0fnDj+S2G8Rakc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RTErUEhjdzVpa0JTSzhOSFpHMStPQjBYREZPRFJ2YVQ4MUE1S1I5dTRzME1O?=
 =?utf-8?B?alUxeWMrYjBvWU84UWpBRVR1cUU3cVhtbzFJUXpCNGJrdTF5S0FpbnVwdGVa?=
 =?utf-8?B?SUNEM25zYi9ObkRiUzRIVTF0Q3BrOUdQSDNuSWd2RW9tQ0R2QklhazQ4YkYz?=
 =?utf-8?B?VDJ1UHk2QXpqT1NPU2NsL0dDZTdBQVcweW01Q1V2Vm5Wb1JvSTlIWThxdzQr?=
 =?utf-8?B?Q2cyc0dKUlRiRFRtZmE4dFFGbzRCYkRtL0I5SnE2TWhOb2R6S3BhWjhpV0Jn?=
 =?utf-8?B?clF1NVhqZEU3NkluZEtMQlBTNkM2b2RmbjBsMXh3K3FJc1ovUnd1R3R1NjV1?=
 =?utf-8?B?Y0VTaGNJV2VoR3VTYThiZXU3RGIvVEdNT0MrZW5CZnVqLzVPY0g3YjBkcENH?=
 =?utf-8?B?cW1KZ2h0MmcvaU91WGVrQ0tLMDhMemVTV3J4VzZOci9nS1BNbnN5RTJ2Tk82?=
 =?utf-8?B?MGd2RlF6ZUk0NTBuTDZIUEhzVCtpWU9uZkNOaE81c1F5RlR6SkJ5cFFkNHdR?=
 =?utf-8?B?T01VNjBhdE9Gbjd0L0ViOEZJekI3b2dVYWFRQWd5UlpXcFVLRzRmSDcyTFEv?=
 =?utf-8?B?b3ZYTjdseXozRkNPOEFVQ29mYXVaczVLa1FYVEpDT3lxeTVzVDg3c0NhUmFM?=
 =?utf-8?B?Qm1KSmhvbzdpNXIrR2k0V0lZR3NWbnhlRlJTVDRaenZndk9hdTJpdjVoOXB4?=
 =?utf-8?B?aVJSQmg1LzlJS1dHS1A2azVxMDBuU25rS2QreWNKY1laaWV3YjdtbjU0dllW?=
 =?utf-8?B?bEQ4RG0yWTZhWldMTVNDWjRqRDFxYXd4UEgzdVAxTUZqSTZLUTdrd085bkxT?=
 =?utf-8?B?NXdWTXc5anFOOGh4K3c1c0VaMVd5cHNiNUFza1BNQ1Bwc3YxNzNDNXhRZHFx?=
 =?utf-8?B?aHNaeFZPYzNSeU9rT3Q2V3Erb1lia3UxbUVuc1praFgzSFlPa1ZMbnhlV0Er?=
 =?utf-8?B?MkpjRTJBTFpZeXF4WjgxSjhnRGtJMFVBZU5ZVTN6Z1hTRG1YQUxoc3Jaci9V?=
 =?utf-8?B?QzA0cE55dkl2d0JRSE5PbWxiUEtBUjBkNUxHTGtEZmVjYmhzNzQvbkN3cXR3?=
 =?utf-8?B?c1YwMFJSMEF2V2UxbzBkQlMrU1NFTUgxWTZHV2g2MXdWejhlTGNMb1VrcVUv?=
 =?utf-8?B?MENYTXc0aFdKMmNNWDlpcDZvczk5ZlZuQS9WMjJIQVZPNThFcWR2WUNUeWY0?=
 =?utf-8?B?TE9mT3hsazdYOUpvTVRvTmtSWFlKNk1xWHVsSnZoanR1bEpKK010TFhjSDFx?=
 =?utf-8?B?clh2bzhYbVJjRnBSMmNjYVhOdkRySjgyckkvMzRrYWpZVjJPVHB3Zy95dEw4?=
 =?utf-8?B?KzdpcU1ieTlTYnJ3eVZzYlhIWHRjcGMwUGlDQzNYMmppdmxzOTAwUEgwY21T?=
 =?utf-8?B?RDdyem9UK2NaVXJYeTFrVlA4MVZxYlh5ZFJQYnI3bDVCaGZrNnRxWXlCZHZy?=
 =?utf-8?B?ek15ZXBEdUNYV010OEhiTUcxc3oyVFZ2NzNDM1pGUC9RYW9CcUpSdC81V0p5?=
 =?utf-8?B?ODRJcllKTmM4V1Z4ak9MZ05DdzczZ0pWTU5PMVI1Snp2UlY1LzZjUFF1SE5T?=
 =?utf-8?B?TG9vc2tiYndxelA1eWdQc3p0b2dKMXdMYUh2VVF6Z1lISlZ0TU1qdThTNUFN?=
 =?utf-8?B?bFpDbnBBQ1paTTJBaU1PM2x2c0ozVmx4R2pDaWkrc1EyRGRGZjhYZXZFSWNO?=
 =?utf-8?B?SHdUVDRtVENiaGxCT2pqVTZORGwzNVh0S2puVlJGT0UvMENxcDI1bmhqV2x2?=
 =?utf-8?B?LzNWaTB1ZGN3WVFpOWxOWGhhWnA3UStlUThtcDFucjI2ZVhrZ1FheTdJeU41?=
 =?utf-8?B?OUVnSjR1ZTA4OWlzSGhESFdGT0dQOTg1bUdvdVkrdHA3MzVyWEJIYVN1eU1a?=
 =?utf-8?B?bURKMnVkd2pGLzlpbnZBdkI5cFA0MmFobkt0WkpHdFdDc3h3UFdPMEpmYjU1?=
 =?utf-8?B?QjF0bzBaMThwNEVlMHZGaTliRjMvK0puM0NQTlByK2lEWlAwaWJBUWFBcTd6?=
 =?utf-8?B?OHFWbm95MCtrN2twUHIrdjkyV1RlNVVqVnVOVUpVVmtWR2lTWTB6T2N4S1hv?=
 =?utf-8?B?QUFxWHN6Vjk1SXZNcFNna1MycUM0K1JlZ2Q3Z2M4KzdOZ2d3bUxVZE5yWUxH?=
 =?utf-8?Q?eOEllrKUZmqsG9i8nHnymTzVD?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <425888CF2FEFDE468FF1D803F93022D6@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b33fb1de-7dab-4e9d-b711-08dd862d68fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2025 08:19:34.9159
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9TTMS6T582Q+5OLip6GTWl1mtww20sKmOS6skgIBWrjv3WBGfZOnY8efBbP72qhhh5e2f/s+NLoFBFLv5m05Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8449
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_011948_556095_C68525DF 
X-CRM114-Status: GOOD (  17.61  )
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

T24gTW9uLCAyMDI1LTA0LTI4IGF0IDA5OjA0ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIEZyaSwgQXByIDI1LCAyMDI1IGF0IDA0OjUzOjE3UE0g
R01ULCBLeXJpZSBXdSB3cm90ZToNCj4gPiBDb21wYXJlZCB0byB0aGUgcHJldmlvdXMgZ2VuZXJh
dGlvbiBJQywgdGhlIE1UODE5NiB1c2VzIFNNTVUNCj4gPiBpbnN0ZWFkIG9mIElPTU1VIGFuZCBz
dXBwb3J0cyBmZWF0dXJlcyBzdWNoIGFzIGR5bmFtaWMgdm9sdGFnZQ0KPiA+IGFuZCBmcmVxdWVu
Y3kgc2NhbGluZy4gVGhlcmVmb3JlLCBhZGQgIm1lZGlhdGVrLG10ODE5Ni1qcGdkZWMiDQo+ID4g
Y29tcGF0aWJsZSB0byB0aGUgYmluZGluZyBkb2N1bWVudC4NCj4gPiANCj4gPiBTaWduZWQtb2Zm
LWJ5OiBLeXJpZSBXdSA8a3lyaWUud3VAbWVkaWF0ZWsuY29tPg0KPiANCj4gSSBnYXZlIHlvdSBh
IGxpbmsgdG8gdGhlIGV4YWN0IHBhcnQgb2YgZG9jdW1lbnRhdGlvbiBhYm91dCBwcmVmaXhlcw0K
PiB0bw0KPiByZWFkLiBJIGRvIG5vdCBzZWUgaW1wcm92ZW1lbnRzLCBzbyBJIGRvIG5vdCBiZWxp
ZXZlIHlvdSByZWFkIGl0LiBJDQo+IGNvdWxkDQo+IGltYWdpbmUgcGVvcGxlIHNraXAgcmVhZGlu
ZyBlbnRpcmUgZG9jICh3aG8gd291bGQgbGlzdGVuIHRvIHRoZQ0KPiByZXZpZXdlciwgcmlnaHQ/
KSwgYnV0IGlmIEkgZ2l2ZSBkaXJlY3QgbGluayB0byBzcGVjaWZpYyBjaGFwdGVyIGFuZA0KPiBz
dGlsbCBub3QgZm9sbG93aW5nIGl0LCBtYWtlcyBtZSBmZWVsIHF1aXRlIGRpc3NhcG9pbnRlZC4N
Cj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo+IA0KRGVhciBLcnp5c3p0b2YsDQoN
Ckkgd291bGQgbGlrZSB0byBhcG9sb2dpemUgdG8geW91IGFnYWluIGhlcmUuIEkgYW0gdmVyeSBz
b3JyeSBmb3INCndhc3RpbmcgeW91ciBwcmVjaW91cyB0aW1lLiBJIGNoYW5nZWQgdGhlIHN1Ympl
Y3QgZnJvbSAiZHQtYmluZGluZ3M6DQptZWRpYXRlazogWFhYIiB0byAiZHQtYmluZGluZ3M6IG1l
ZGlhOiBtZWRpYXRlayxqcGVnOiBYWFgiIGluIFYzLiBUaGlzDQpjaGFuZ2UgaXMgYmFzZWQgb24g
eW91ciBwcmV2aW91cyBzdWdnZXN0aW9uLiBVc2UgdGhpcyBjb21tYW5kLCBnaXQgbG9nDQotLW9u
ZWxpbmUgLS0NCkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS8sIG9idGFp
bmVkLiBCdXQgdGhpcw0KbW9kaWZpY2F0aW9uIGRvZXMgbm90IG1lZXQgeW91ciByZXF1aXJlbWVu
dHMuIFNob3VsZCBJIGNoYW5nZSB0aGUNCnN1YmplY3QgdG8gIm1lZGlhOiBkdC1iaW5kaW5nczog
bWVkaWF0ZWssanBlZzogWFhYIj8NCg0KQW5vdGhlciBxdWVzdGlvbiBJIG5lZWQgdG8gYXNrIHlv
dToNCk1UODE5NSBhbmQgTVQ4MTk2IGJvdGggaGF2ZSBtdWx0aS1jb3JlIGhhcmR3YXJlIGFyY2hp
dGVjdHVyZXMuIERvIHdlDQpuZWVkIHRvIGNoYW5nZSB0aGUgeWFtbCBmaWxlIG5hbWUgZnJvbSAn
bWVkaWF0ZWssbXQ4MTk1LWpwZWdlbmMueWFtbCcNCnRvICdtZWRpYXRlayxtdWx0aS1jb3JlLWpw
ZWdlbmMueWFtbCc/IEluIG15IG9waW5pb24sIHRoaXMgaXMgbW9yZQ0KYXBwcm9wcmlhdGUuIFdo
YXQgaXMgeW91ciBzdWdnZXN0aW9uPw0KDQpUaGFua3MuDQoNClJlZ2FyZHMsDQpLeXJpZS4NCg==

