Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C98CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 02:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFPDBIQjcqg93y3jBX7pXZz9qd4wEt3pVUWPemRPbX0=; b=phKSVkF8GKGxXnQjAQwvHu0fAk
	t9ErwwFnVe3R3o/WE48uTskU9VB0WAW15qNC+48GGMzllebFF/BElwkaF1U6vh808F5il0uxkRPXK
	+YzsVytTHqlZEbsr2+d462APHwxVWhU3CG29bhymDzXJM6yNkJslKjHrEer5YW6Acw6W9AXWcDP9v
	k91RyQhOda12QZ1UbzwOEuUaE3G2HVUALDaCDyMi7Ri8Ju9dAIXRF5hiYsSYBEHEHvrwNI6CG99/C
	0BM7qa4LVVAmLG/XPtYZ4ByywM08ZVFQJbPOFckYoY/7rSxluoyGp+iO4TIP9LQO9QTV1AeC+ggLM
	wF81R32w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9wgS-00000009O1w-42dJ;
	Sat, 18 Oct 2025 02:28:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9wgL-00000009Nyj-1DJt;
	Sat, 18 Oct 2025 02:28:34 +0000
X-UUID: 22ad8902abca11f0a52f393f94899d25-20251017
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=NFPDBIQjcqg93y3jBX7pXZz9qd4wEt3pVUWPemRPbX0=;
	b=nfdng9PkhCD3pLwi/pA1O+3cntlsFvWdkJqBnHB7VbdJ9hqbS/S7MAhgxFFsxG7c7L9bsuE0gCow1SBySR/InaraOf7BO/sYGhck8bCzOfCgFpcflp6kY5oRAjxdbR9doVGIjllsWMONhymHiiseu5nR85O1idQCMFC7fVs13uo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:e27ffab2-af11-490f-8c06-96411aba05b2,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:1f1a4cb9-795c-4f99-91f3-c115e0d49051,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,
	BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 22ad8902abca11f0a52f393f94899d25-20251017
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 670120991; Fri, 17 Oct 2025 19:28:30 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Sat, 18 Oct 2025 10:28:25 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Sat, 18 Oct 2025 10:28:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kCucQJlT+nMJ4weabG7gMUMNAckZiXZme+81M3CgeIqp6aqmuLfaj9tXPl+9nF8Fe8krKD14v/TAUuMHTxT4CS2DvPBSTe0kyobIV37bOKLmzPQyvFTcdE/XUvDJuakpgIMIe9cpmt/WS/gsv4yI4TKavGVvmhOCqECjX4MwTYJpnmRWyszcEVTbwcttnnA7A7DTk+y4vy9X5kKR3PovctcskWB/K5w9nzuUCvakpjHS/WStKZpBCGvoRKt9XUO83OwudYUZ37gKNbvFX7ddDwjmQZV2ojv2xUAJXKDZr6v60uf4RgrL13RmlSm1b1UzT4NMNJyqhv6zrbTkxmrdvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFPDBIQjcqg93y3jBX7pXZz9qd4wEt3pVUWPemRPbX0=;
 b=vCO+SdJz9UPEeQpmeMCOJTwHlsoe4w8pBLDZuNuRT+hkgfGsEsK8UQKBIWr1C5r8PE3+T6Tfxgap9PpwZbiyVE5cP8km0Pbpc2HwjHg2OKqa32adpaeQpm7HnWjJJIXg+GK2OlAj4AfTTGGOeFXKkmJ0Hwd4O856UxYxX6IUaqOgZ7TfAu/dU7PRE7oaeOcT9T0u/li7RoIbDVWJ5E/EkE+I1YQ5/ZPU1t47s5q3zKwstRSebYm0scLYLOlxxwiJvrqFW930otofrucAzevLXCwPPLsYxkT65wquZRXSveqtwStjRkoAPxZTQCmw+Gktqrz7lLC2aj1Y3WkFmJa9yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFPDBIQjcqg93y3jBX7pXZz9qd4wEt3pVUWPemRPbX0=;
 b=ByGYeU86wlaZl3rfoKTKqK9Q/4o9nElkju96anFszOWRY0G99e1tus4nyQgwzIr8gDw3suNJhATOAeuYAjPfD2+T2CmwaNzQj1G2KFIgmzZGiF/dkIIFa5Yly65Xar1eS4dYQ79RJ++76wN+GgQMzG8w600wXta+hvqc1FNOxDQ=
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com (2603:1096:4:142::7) by
 TY0PR03MB6982.apcprd03.prod.outlook.com (2603:1096:400:276::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.14; Sat, 18 Oct
 2025 02:28:24 +0000
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::683a:246a:d31f:1c0]) by SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::683a:246a:d31f:1c0%7]) with mapi id 15.20.9228.014; Sat, 18 Oct 2025
 02:28:24 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: =?utf-8?B?WmhlbmduYW4gQ2hlbiAo6ZmI5b6B5Y2XKQ==?=
	<Zhengnan.Chen@mediatek.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>, "joro@8bytes.org"
	<joro@8bytes.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "will@kernel.org"
	<will@kernel.org>
Subject: Re: [PATCH v3 4/5] iommu/mediatek: mt8189: Add INFRA IOMMUs support
Thread-Topic: [PATCH v3 4/5] iommu/mediatek: mt8189: Add INFRA IOMMUs support
Thread-Index: AQHcPdNV6fQEDDdFokaZMXZBbitJGLTHMhmA
Date: Sat, 18 Oct 2025 02:28:24 +0000
Message-ID: <b52295c763a3e15b6c87c610551364255b0f7e1f.camel@mediatek.com>
References: <20251015125532.9041-1-zhengnan.chen@mediatek.com>
	 <20251015125532.9041-5-zhengnan.chen@mediatek.com>
In-Reply-To: <20251015125532.9041-5-zhengnan.chen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5885:EE_|TY0PR03MB6982:EE_
x-ms-office365-filtering-correlation-id: ce92341e-e1c4-4e1e-1930-08de0dee0358
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?Vi9iZmFSMUY5Zm5XSUNmdEUveG9wV2YwdnhsQ2MyOFZNMUVqMTRKTE1pU3Za?=
 =?utf-8?B?NTl2TEhCb3lzd3I0VG9nQTU5N01QZ2NBK1FwZmtPVE1pTlFUaWx6eGltVFpt?=
 =?utf-8?B?MTA5bEJyVVo2WUkxeVlNOURjMWVGN0k4dFJLdHgrQXpZMXpxZkRBM092T3FP?=
 =?utf-8?B?TFhLOStyM3NQdkFVdTNOMExtRGVKT3hJcm5WUlBTSy9FVmJoWjk0OUxuZUth?=
 =?utf-8?B?UUN4YjlBNDJKa2JUYVdXL1ZGMVBJRE9iZE15Vnp6UlRvQUhyTWtDR2RyMFV5?=
 =?utf-8?B?aVZxWlFhcmpmellFRnY5bFpiWmF1SjRCQWpzdHNVckNSK1RlMko1Q0tCZmps?=
 =?utf-8?B?YXkzdGR1MHFyOS9FSVliMVh2aWE4WWdNUjZYUjFMdzgrWHpuRnFzaVRaMXZ4?=
 =?utf-8?B?VXZZcmZpQTRCTHBHOThuNmt5dlBENUtJN04ydXNTbGd0NlhYOWN5bVRsK0xk?=
 =?utf-8?B?MUFGNHM1ZkM0NStyQzhzSEdPNnhQM1MzUmFWdWp0bWxycUFyVWVaK0ZHakJu?=
 =?utf-8?B?MGpRL0JsY3h5dHZFMGVNaGxJeGxzbnZyb09UTXNYUFR4NFVCMHhrQmUvVHMw?=
 =?utf-8?B?S0JMNGU2UUVod2k5V2tiQlcxaG1QRXhNejZCUGNFR0x6cUUwVG5WRXRmK29F?=
 =?utf-8?B?R1JmUHVhL0poOSs4MHpPYW0vSHhvcUN2V1JWZ1Z1bHNDT1BYcHlXUWE2OVIx?=
 =?utf-8?B?NkNabkVYaXBLQXJjdU9EU1U1OGtVaFlPUEZPVEVhVVlnenpIVDN4KzNHNk9p?=
 =?utf-8?B?bThMV1oraG8rbEduYUFWZ1ZoZ1ROYXhZYTdMOVFaNmNZVlFxMjFRak85SHJj?=
 =?utf-8?B?QUd4VmVIcnNQWEt0WXhHblhEa0cvZjc3WDBXRHFQR2haQ2xjbUNLNE1Zc1Nq?=
 =?utf-8?B?YzRXTlYzUnhEUGt4WnAxcWg4ODNYZ05KTnpkS0R3K1FxV0xkRWdXYjZSTE9N?=
 =?utf-8?B?YitRbUY3M3VMcUJleUljWDNqc2NsNkd4VmZpMDFDT003REZOeE5nbGxEenpM?=
 =?utf-8?B?TFR5TTNFeXp6WUdsdGlWcElTdFV6dnFQMXlQUWgyeGZBK1J2MGNoK1FSdjhw?=
 =?utf-8?B?dGJKNGt2V3Z6bkk0SkxYSkx5Qm5jOWpjZC8yb3B0Q3JmcjFzMkNUa1RJajA1?=
 =?utf-8?B?QUhlZU1HS0gvMG5aOTFmVDIvY0lHL1QvSFF5aFdKdmQvWjdEN1VJVm04U0t6?=
 =?utf-8?B?SFltamdKZG9OSERiUWlUcCs4WkRRZElaMmc0M1lKOE5RenY1VTVuWGw1T0Fv?=
 =?utf-8?B?RTErREdxeUk2akZpYzIrRkJMUEIvZWoybFFGajRvNGo0Uk13aityNVEyKzVG?=
 =?utf-8?B?d3pkN2JJVEhaT1JvYUh5R1VPU2NFTUc4SDFLTzJSRGd5K200Q0M3SHI5OGM5?=
 =?utf-8?B?T3hzQlFtcTlRemU0SlRKV1VHK3gzRlNSa3pGY25qWGpDV2xqV2lGWDYvR3g4?=
 =?utf-8?B?RFlZNEZSMDZ0aFlScm0vT2VYTGVrdk1sNnlYMjRPSmJ5Sk9UVXd0M080Z1hG?=
 =?utf-8?B?dGRGSk9qdTZuMnlkaktralVVVk9CSFVraWdXbW1QcVlVMjl1bjhQNGNYVGMw?=
 =?utf-8?B?MnpsbXBBdUZtRitkU0NFd0tPanlZVUZKQVhuczdLNXNXZEh4SlE2N0JMUUR2?=
 =?utf-8?B?ZnFIeHFkdVNTUWs2eFNiMEJ1OVdPdXZ0RjNMYU4yTDVZRGFueTNxNFRiN0dX?=
 =?utf-8?B?L0JaNk9qcHpQWUVrM28zZHIzRklNU054ZUZ5QnVSaWF0dXNXQ2RzMmxPWENs?=
 =?utf-8?B?WUFRejRwcmo2NjFOMnpacGVKWUZlQWpUSGFTa0pONGM2VHI4TWpFV1NNYWJ3?=
 =?utf-8?B?U2l6V1BqZWlCNzVWRm9lOS9qalM3Z2FlQXJUV3pQa1hlWEJ5U3lRcTljODBO?=
 =?utf-8?B?MzQ0emVNa1ZNS3FFQTFkUHpHSkJ5c2hleWZrVENVdndyM0J2ZGoycUZmUVBI?=
 =?utf-8?B?Nk4zVTBOSUQxVHNCSHRVRDArb0pxcTdEa1ZhekxsQUpjbDRKN0ZoWnlHeUdH?=
 =?utf-8?B?SWY0L0dnakpQMGNsak5KZDF6TGtPVk9FNFY4VzZreU9CRjA2bUNNRmNscHVi?=
 =?utf-8?Q?k8XMxv?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5885.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFJHd1pjeUNmdys2YTB3MEQ2MEd4bWE0bWM4RkVFd2l5eWI0Y2wrNHRQUnIz?=
 =?utf-8?B?VmVyajNOWGlTbjJobWFYM2l0V2JYWUxRaU9wVzFESXBYYXkwNGZHdVIva2F1?=
 =?utf-8?B?S3VIMjcyWjZXVUR3Z1oyREVHc0NORHhDZENHbHU5cXgxQllXSzFHaEI4Nisw?=
 =?utf-8?B?RXlKekNPZzYvemRGTm4rU3BBRFFhazVGemJNY1RvWWR5UzNJWjEwRkpTdTFO?=
 =?utf-8?B?UEEycnlydlM1UFFFV3lYMzBFeEJsTnZSRnlNcE1zcS9HeGVzcytJR2hWTFN5?=
 =?utf-8?B?VE9td01oSHJPZDZnWjVEd0M0cThwL0djTXZrVFNIZ05pd2pCY0Izbm1HZVNY?=
 =?utf-8?B?T2NTaS9XOUUvUlA1ekloWkUwb2IrZDdObFJDOXVQQXUzeG4waElIU2JScllW?=
 =?utf-8?B?T1pNc3ViQUVPM2cyTEZYUlBrQ1Y0U0p5WVEwa3R3d20wd3Q4NUlsMExHRUJp?=
 =?utf-8?B?UkJRbnBnSHN1Q2NjREI4M3EzdU9nYTBlMW1NeDFBNXpQSXdoN01vdWNkTmV5?=
 =?utf-8?B?V2lvd0x1WmJvM094d0hTbjJKRzFsUXo1aE5SbU42OXM5U2NBaEJYN0hpTmdv?=
 =?utf-8?B?bFdiUzhGbkdjOFVacjgrZXUvTW9MUTNTV3F6ZkN3MGU1R0Jrdmk2NHdzV2gz?=
 =?utf-8?B?U0dRQWFLdnZjWWs1eER0d3QySmNBZDdaYTF1VHYyZENuYnVvdlp6UkxnRDVJ?=
 =?utf-8?B?a3l1TzdMUnZHeFJ5aE1LK1NpcEJ1UzlvTnFwRERLRUlNVlozUjQrczg5Snll?=
 =?utf-8?B?czd4VEg2YWtNWlI3dCtzNlQ1eDlqWFFFMlpTQitwc3NCQno1YkVZNWh0TDcy?=
 =?utf-8?B?cEg4MUMyK3Uxay9IZ010MFQxNXV2NmVKSnFCd0kwcXFKQ3JLSTNNTzBaSHRx?=
 =?utf-8?B?a25INzl2eU1WQTYrUlpSUmN5RW5kN1dHY0JQTVpPQ0p1K1VJNzhqWmFxcFBj?=
 =?utf-8?B?YU1JTFVaam90UDBEZW5RT1ZGa2Y1dGVrWFpKdGxPM0NKTG1QbGtMdjVta3Na?=
 =?utf-8?B?aXVSUEdURlR6dXBZT3lPUVFHdDlwc2x3MmFXRUNseW1xLzBadk9GTE5tZVJj?=
 =?utf-8?B?RS9DOEdabU1xVE9PSUxoOUtKbFRSZUZ2TytOU1h2K3g1Q1NrNVFMRjFTVlNw?=
 =?utf-8?B?SVBWSGZzL0trZ0hndUJjbkhGcHVCSmpCcVROTWJUVDB3d2VZWWtMTVFTMEVG?=
 =?utf-8?B?VkROSHhub2NKVitSRTVuUmw0TkY4L0ZFekhSSXBmaXpWaVA4UzZ3NUxBSzli?=
 =?utf-8?B?ZkVYeENOZllSWWRSYVc5OTZkVU50Y3Z0UExoTlNHYVpnOVpHd1dXN0ZqYWxs?=
 =?utf-8?B?d0hQTWNrVm1CNnMyRHlZQXJjclVGQ0lMWVFsRi8rK1FVTUUxL1JxSjNmNlVF?=
 =?utf-8?B?cGVxRERmRDZ3TEFaV3BwVmZTejd2ekY3TWhtTHdzK2dscmxxQnBxVW1uRmpM?=
 =?utf-8?B?V1hhUTE5V1BVRnVaZnM5LzczV29PYmIzY3RmUzhiZllzdTc4ZzNOTXNTaE5T?=
 =?utf-8?B?S0JaaG1QL1RqaW5FVjRFdzVzYmxwc3N0Y1lLL0gvOGUzUGcrNER3WHF0ZmZu?=
 =?utf-8?B?WUFHOFhadFNLamdObGlSMG1yWUtLTHlRY0hhV2lMa3dLd2pzcTYxRjRlbFJ5?=
 =?utf-8?B?bzI5U1piWis4ME9ZbVdxVi9IRW9wVVZ3RkRwRWdwM3NFaVk4NkdMb0w5Q2Rt?=
 =?utf-8?B?ZEVZR2ZTVlpSMEhWY1lNWElwdU1Kd0tnSXAxY3k3ZmNQRVliS2NCS1NyVGI1?=
 =?utf-8?B?OEJzZ0xTZWRkQ3VjT2lMTEJIb1R0SDZjOHgxWTZsQU5xandBcFA5QWYzVCtM?=
 =?utf-8?B?RjVhT3ljVXNRWXJVc0FuRGRYTVZjbXdQcVlMalEwczh0L0cwbnM4a0NKdXNr?=
 =?utf-8?B?TkFtUnMvV1Ftdmh0WVVwb2VtL3JEa1FqMXdUbUxZcmV6b1J2VjVJc2lqVkVx?=
 =?utf-8?B?TUpaQ3FNZ0pHYUUrT3VhNFpWN0RpVkRVYmZQVzI1QU4rOEZCMmFtNWFFd1M1?=
 =?utf-8?B?Mzl0UWRUcncxOUZ5LzkxUWZpUFVNc2R5K2hGLzg3c1hrdXptc2FnWWtFVnow?=
 =?utf-8?B?cFR3WUQvZjNtWXlhdE4xS04zdndNcDVMK1ovc2pETUhIeG1ObG95YzJRRWFp?=
 =?utf-8?Q?Y0ey1QNel56lJTL9UanS+SYWT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C95095445FEA9E49892CC9785CC82EDF@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5885.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce92341e-e1c4-4e1e-1930-08de0dee0358
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2025 02:28:24.2191
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zW2a4mZl9+MifuIIydJywKLRIJhA/IiXvwrf7jN0qdd9L2czoO9HRnCoUCosiVSoTBjthmElYvKGiqh76MAt9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6982
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_192833_328591_5FD495D9 
X-CRM114-Status: UNSURE (   9.13  )
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

T24gV2VkLCAyMDI1LTEwLTE1IGF0IDIwOjU1ICswODAwLCBaaGVuZ25hbiBDaGVuIHdyb3RlOg0K
PiBBZGQgc3VwcG9ydCBmb3IgbXQ4MTg5IElORlJBIElPTU1Vcy4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IFpoZW5nbmFuIENoZW4gPHpoZW5nbmFuLmNoZW5AbWVkaWF0ZWsuY29tPg0KPiBSZXZpZXdl
ZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPA0KPiBhbmdlbG9naW9hY2NoaW5vLmRl
bHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9pb21tdS9tdGtfaW9tbXUu
YyB8IDE0ICsrKysrKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygr
KQ0KDQpSZXZpZXdlZC1ieTogWW9uZyBXdSA8eW9uZy53dUBtZWRpYXRlay5jb20+DQo=

