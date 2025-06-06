Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E374C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 02:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=quUWWUBlA0TTYJrYgF2CJWOvFWipD0gkiRQt4sqVco8=; b=e9CfoKUDhukBcywhEeISqB3VTz
	771Sj/O5M/XZxxf5L7Dr1+mUo74f0WKfbd4qp9DQLAxcTn632fRP5PxaD6CD+fKqyXlJLweuCISxr
	Wq0h7DnRb2Dc/ziE46x+72+H5Z70F/PttZDQt09lOupyP5AkEtwn0cdvQ1XDq6s5QxnBy6QQ8hpKq
	SXaAwkye9V812FzW8jLGj8wEHsQM8QsMCU9b36KHwwFejKJBz3PPUVyIqI++fv2u4GjjKe1K8a73a
	jYB4NWN1RQ4Reb0b3qzFeTt1+r5JToS+V0uiwbNe2eApF5J47eObQaF2EsuwW5/RE27p3fUzCJsX/
	oBNyXElg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNMmJ-0000000GyEo-3c2o;
	Fri, 06 Jun 2025 02:25:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNMgG-0000000GxiP-0A93;
	Fri, 06 Jun 2025 02:19:41 +0000
X-UUID: ae1c2c08427c11f09eb0dd999d3936bf-20250605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=quUWWUBlA0TTYJrYgF2CJWOvFWipD0gkiRQt4sqVco8=;
	b=WL2bxhTpmVzG86yKcgTx3j/4MqpYe4u9PQffItntuuelLdqGVxhqkbYmZVWE/UXMezcDhiPIDPGCmBjViHvrhjSbR/49uvyqyTINC+cCRuVlwSky0f7Vcm/UVI2BSqY1076Hhc5VgCb1FIqqjC/JH314HCZt4DxC9+HGhJ1yPfI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:453b3541-b934-4078-8174-6d6b30636355,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:f1938459-eac4-4b21-88a4-d582445d304a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ae1c2c08427c11f09eb0dd999d3936bf-20250605
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1688348363; Thu, 05 Jun 2025 19:19:31 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 6 Jun 2025 10:19:28 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 6 Jun 2025 10:19:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SWx/PdCz/O33FvdR5nold3YUQlJhsKnKyyeY+6OlwvH8koNPkd+SCtp2hmJn/TW4PETXQEHFbk1wRf/tjvJZcPA1hwvWCNiQQJ320YY+Tk1r9NQqrNmDIjIL24VbUn/CGjf02DuCJVL5VuGR8JWNnVulvJK+kGO8RKvTTt3ALyBqJlcmYhAy/crIXmDG0VizuXqPvPQ668TtjCKEp2oFulXp6vN/kikXg9pitEI4gwYMFIEPnVruXGRnxdklJwcjvneKJkGRanX8IPjm7qsXEJa7cH/FjyY9MuoCqzKpZRjSWkShLLXbyYUbRRK0vO0aD0QXWWCq5A55cQnKOTQA5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=quUWWUBlA0TTYJrYgF2CJWOvFWipD0gkiRQt4sqVco8=;
 b=Mu6guS3CLzQmTH1PlsBl76vlv04J1lEonvEQfzmOc/kKQGsox8kJl9882Ba9RWsinOM+4qQvvObSIpyvmIH+6RJF4zh3ncw/cJF89rlm4iKL3tGWA4ZUv/B0g13EVrBgwfczvZWx7vtvIx8CzxfU9TL88IAUi4FQhI7QnugEThmdvgOX8BnpL069E+32phQT5KTvkSKXgHkd7yFKZUZEiAXNVsd6Ho/RX6gQvQz6tSqPKu5WxbW2bwjnTKVPSFG7w18pGsehC4nh3W6HLCcTOaJAyLP0rfoIWKW46AXW5GsfP3ECyK95KP6N7pSYVbu2MFksx5m5yT3btO1DOnT+Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=quUWWUBlA0TTYJrYgF2CJWOvFWipD0gkiRQt4sqVco8=;
 b=ODUTisPItDyiwFPTHRhgIiMc9lO4ws6O664Z/+JANlr09NGNiquA8wWY1tap+Sn6cgNwNlIc17Ss5j6Xq+HBl54zE2hJNjvYHaX7zkUZU1/ENI5oViexL6bYFrpYuPtdZv5xVhaL+iAcBOU8gAvAOKLz07c6VxyB2hl5PHkbyrA=
Received: from SEZPR03MB7947.apcprd03.prod.outlook.com (2603:1096:101:187::6)
 by SG2PR03MB6609.apcprd03.prod.outlook.com (2603:1096:4:1d8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Fri, 6 Jun
 2025 02:19:24 +0000
Received: from SEZPR03MB7947.apcprd03.prod.outlook.com
 ([fe80::ee7a:da9c:2ea4:50d3]) by SEZPR03MB7947.apcprd03.prod.outlook.com
 ([fe80::ee7a:da9c:2ea4:50d3%4]) with mapi id 15.20.8769.029; Fri, 6 Jun 2025
 02:19:23 +0000
From: =?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?TG9uZ2ZlaSBXYW5nICjnjovpvpnpo54p?= <Longfei.Wang@mediatek.com>,
	"wenst@chromium.org" <wenst@chromium.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	=?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 5/6] dt-bindings: media: mediatek: encoder: Add encoder
 dt-bindings for MT8196
Thread-Topic: [PATCH v2 5/6] dt-bindings: media: mediatek: encoder: Add
 encoder dt-bindings for MT8196
Thread-Index: AQHbz5sIZlWYNltu7kOZejvdMmqsTLP072WAgACEOQA=
Date: Fri, 6 Jun 2025 02:19:23 +0000
Message-ID: <d91be38c6eb0c4c51485ce228ef1a183d3f72cc8.camel@mediatek.com>
References: <20250528063633.14054-1-irui.wang@mediatek.com>
	 <20250528063633.14054-6-irui.wang@mediatek.com>
	 <20250605182607.GA2983549-robh@kernel.org>
In-Reply-To: <20250605182607.GA2983549-robh@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7947:EE_|SG2PR03MB6609:EE_
x-ms-office365-filtering-correlation-id: d460cff5-52d0-4008-2860-08dda4a08dc5
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TWh4UmRhN0NobjdyZ2tnclJpRDF2OGdVYW85YnhZV1hrUHQrQlU0SzZNSS9E?=
 =?utf-8?B?RDIyM0VSankwZjduMEdFSGlxYzVqQURPUXNQQlRXZmh6cHBUU2xrQVEzT1Bz?=
 =?utf-8?B?dEQ0UHZ1Z01ESm1qL2d0UUNIUm1KWjZDd1lvM3k0a3dueDFnT3V4dCsrTHNC?=
 =?utf-8?B?dThud3MvWllOVkM4dWwzRlJGZU5TdXlscitTTFNETkhyVG1XOEh6UUVoT1Zl?=
 =?utf-8?B?TStRYTVPM3ZUN1BRL1FxSC9oclNwKzlFcURZdzgrVnZLMmx2NVBEUmNsTWVk?=
 =?utf-8?B?VmwwQzB0RzNiTnZJaWdDTkVQcDNpdURyZlJ3ckdhM0lrZzZsckxpaDhHWVlh?=
 =?utf-8?B?ZmowRW9uZ2pnVlNFdnZmMC9EYXJ5Y01mQkk1MVVTNi9qMlVBTDZ1bWZoK3d5?=
 =?utf-8?B?N2kzSkNxTVlJZXgzMHFSb2JHK2FvZ0hrTVFkbGZmdE1jeERhemlNYjlKOTBx?=
 =?utf-8?B?K2VXL1NvNG5CSnc4L0RHYlIvMjJYYUpWdWR3Z21ZY05sbUxYMjVUd0pGWTEw?=
 =?utf-8?B?em9vUVJhSzBRd0hMclNpNHp2YXZjS0QzbUNvcmVxT3BsbmJLTFRtdEJnVEYy?=
 =?utf-8?B?aEVVajRvNDQ0clJRSm56MVNPemJVUExGelJMajZXdzhuNHZUcUpyMXRMcHhy?=
 =?utf-8?B?L3A3MDlVNU9CdXRqM2VmRHRicHd0UTVuOGU4ZXRvaldtdklrVkFqYTQrZnhz?=
 =?utf-8?B?RkZ0SUI5R1gxRGo0MlA5aUVSM3VXUEQ4ajV0RmNCRjNGMnEyREVDVjJncTRE?=
 =?utf-8?B?eVpqbXdCTWhSOXdFSXByYzNWNDVFNUozemNHdkZXamNUL1NkTVFIMnZwWHBC?=
 =?utf-8?B?dVVxZkZtczBUTmZBMFNkbWE4SGpubEsvZThVZHRvMWw2Z3ppRjJnaDhFUmFp?=
 =?utf-8?B?aGxPLzYyaHk5TzBTelhjVHVLMTcybWkyMlFxSmlWZ2Y1MzllRUh1VlVWTjho?=
 =?utf-8?B?S0IyZTRYa0NpRjJnU1VzOVd5SmRHWEZvMENLRXZ4SGJqKzMxczdXOHcvcjYr?=
 =?utf-8?B?WjArd3ZtVmUxdUs2emlnM0c3Z1JKQTZ3VzU1bDNBOUdRWi84QnRhZ3VkL2FO?=
 =?utf-8?B?aDM2dmg4SzZWVVU1ZmpxYnJpYzBiQ3NDTE1nV3BsdGhBVFZxQXdoUjVRa1dx?=
 =?utf-8?B?cEJ2WGhRSVhRZmNYcVJXc2NQaXVLbU14TXB4SmJua1NIcWNHWER6dWltY0dD?=
 =?utf-8?B?YWdkcSt3V0NMdTBQMlBMQzU0VmlTQ2dXY0Jxb1V4T2FtczE1cU1NaGlYZmt1?=
 =?utf-8?B?MGQvUTlielRqWWQ5M2pEZE9HMGtqNEdhTjZ4Y0JjbWx2bEtJVnprNFQxSlVW?=
 =?utf-8?B?d1NBMDJXMGt0aVRBTkhqOFRXQ3F5c3RJM1ZMZktDTy9tOFk2NFdpWi9HMHVN?=
 =?utf-8?B?QjNtaFhOUEVUVXNZaU9RT2EvQjR6V1hPYjAvWDdGRzRlKzNaMlJoMzhxZFB0?=
 =?utf-8?B?dUg5bXEwWmpUeG96U05hM1pmM3grR2Z0c2ZKU2hSeXd5ZXY3OUZxbUQ0V0Nn?=
 =?utf-8?B?UFJzK05UL3NMSHZLYWdNVFlITEo5RW12Sm1RRGlCYVU3SVZKakZ4T29qWk1i?=
 =?utf-8?B?cW9zR1VKdEJlWXJmMDhOdy9Ea1pLWXV3czM3ajliejBkVTNsQkI1SUpZaVFq?=
 =?utf-8?B?WDVPSXFCT0llSDZOT2Y5MktLaTBmWFhKSjBXeUxXcldYUUZScmdxR0kvLzVz?=
 =?utf-8?B?NWp3VDVoZE15aEMrb3B1U0tkWThxVm00c003QWN0b0RkWWpSeHFkK1ZOVlpK?=
 =?utf-8?B?WVpJM1pmV1RwVHlYSzMwZW1ucWo3RzduOGlGeTAzVkdHOU04bTk5RGZlSHVi?=
 =?utf-8?B?Sll0Q3FpSktvMGRGQzRPazAvcHhDZlFzeEh3aUd4aEx4Z3VnQUQ5MWpvSUhE?=
 =?utf-8?B?UlNWUGx3T01HdUk5VC8rRkNGcUJ3eTczOEVjTHpMTjNXR1lrRzJwZzBnUHRm?=
 =?utf-8?B?YVluM21JaGluNlpoUzhPcGU4OWx4QXdVdkQ1OGo2d1BhNURhU1pqbXdPci9I?=
 =?utf-8?Q?ywY8T5ZZJaLpJV1EYxRk16DERf8s6U=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7947.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S0V1OEFIRG16SlhwM1pBZzUyOWs0UzljTlh4QkEzaTc1WnpMSVE0b3RKL21D?=
 =?utf-8?B?dStuaitOZ1ZKTXZKUE16RXNDbVNLaDV6VEhHSUNBZkt2b1VqdFBGaFRTb0po?=
 =?utf-8?B?WjJpQlJ3M3g4YXJtMS9JTnFzNFVZVk15THZHbjFRMWlSTjIyV3hIOTV6cVRC?=
 =?utf-8?B?VEYxRlE3Z3dvM3R5ZUxscTJUbWtpV3Y5Z0xMMm11WEpCT3ZiM3NoT0g3Z1l5?=
 =?utf-8?B?a3htSCtMT0l5bEZKU0RNRmtVbFpRUjRrMjFvUjJxa3k0U1k5cUpZNjk3akgx?=
 =?utf-8?B?TjJ1SHRSZmFobVREY2lrVm5NemNJOE9welFLdkhnbGZMdUUvS2x6MGtJaTJR?=
 =?utf-8?B?c2tzd3hVcmtvNjNZYTF1SlREK1FaTTFMa0xvMnRQTGxEMnBuRW55YS9wZldi?=
 =?utf-8?B?UDJXTW52enIrWHZ2cWtOaEFXNkJNUmJmRzE5VDlBdy9idXhjNzJBd3BFLzNk?=
 =?utf-8?B?em1LSUZLRGJlRUxXQmtJM0xsS3ljNlNSZ3NrcVQ5MStORzAwNGQzaUJtL0Yx?=
 =?utf-8?B?UDUzVlZKWWhpa2hBMVFsbDBDMjlraWVENGxwZTRVTnNERDJqZHhSRlQvck90?=
 =?utf-8?B?THAvMmVqcTJSMzM0ekRMaDNuanMzVnJGM2h2TlUwVGl2dEtsMUdGK2s3S3Y4?=
 =?utf-8?B?aXVJQ1VwN3F4aVROclZsRkg4dWl4UjFMbVczL2pxb3Z0SFUrek9ZdTFBdlQ4?=
 =?utf-8?B?Q1JnOUhXSW45cW9EL1NwcEtSU29xYkR2andXYjVkWjRVS00ra3dKaWZUaHdy?=
 =?utf-8?B?L2dQalI5M25waTVEai9Bc3hZVEU3SDF4Uk5FQlBiN0srTzRsK3cxUUNHRmtu?=
 =?utf-8?B?UUtJbitqazFTRDBPV1VYL01hRGZyQzVZemlKZmhxM2xmNmNUbWpJeFgwNjhr?=
 =?utf-8?B?dzU0b0g0ODlCSjFxaGtuamltNys2R0ZBQ3VQa20vb0haYjA0ZnlDY0wwOE1u?=
 =?utf-8?B?UHAzNE0wSlFBVEc0RkV1SkJUNGlaN2NRNHFwNFF3MndVNnBCaTNVaG9oemlF?=
 =?utf-8?B?VFp4UHVmZ1EvaE5iWHZDMldtRUVHTWdRMVdtTUdvUmxKL3N6S1ROYnEzQXps?=
 =?utf-8?B?YjVsVVdSdE83b2YxVjZhTHpkWHR2RmdyOCtTc1lpK1RITUk5THMxOUYyMmxD?=
 =?utf-8?B?WXMwZ1d2YndKS3JTdHp6RkJlSk54ZDlrZUx5RStFQ0dRektUY2V3YkJkamVk?=
 =?utf-8?B?cmlRYlAzZzJHU0ZGcWpiVjQvaGJpMWtQSFkvMm5oM09zcDltQ2tmcGZEamhy?=
 =?utf-8?B?dTh1ckd5Vk9icnFGMlFuQVk4RXp1NjlPSWlRYmIwZklKeW5mNVRiRmF5b05S?=
 =?utf-8?B?QXFlNmVOY0FtUG05bUVVak10SVdmczNKMG43bUJRNHpUWVBSMlBiVy9yaFdi?=
 =?utf-8?B?NDJBTnVhOXZNYlMzeWVQSGg4R1BmK05XU0N4V2RUR2d5a0xWRFVNUGJhYnRX?=
 =?utf-8?B?eUcyZHVBUVZMQmp3MlFnbEJxZU1jQ0tGaXpyOFduUHZtaEhpTFQ2YWwrQUNT?=
 =?utf-8?B?Wjh4UDZROE5qdjJZUlp1aDJ4eTljdGF5MW1GUVRpclF6c21kU0hoRHE1VElM?=
 =?utf-8?B?QTRjNGQ0VXhjb3c3M1B5dWZxSXhmN3Q1cDQyQTBMZ1BiQkh6VWFSOWZKMXBW?=
 =?utf-8?B?OFdnbVRtZ0F0R2FpbGZHRWVxYmpjbXNqWDVhSU1sanhWWmtwdXlzbHZnN2Nx?=
 =?utf-8?B?L044WXUrOVpCN09zODVqTUtDd1IwSm56VmV0UFhBNWdlVHhqSTFoN3FaZUp3?=
 =?utf-8?B?Z1UvdVRsWjZxckgwWWxTU21Bei9sNk10cExWZS9rTDEzdGZNckM1N0RHMEVJ?=
 =?utf-8?B?K1Nwd0FBeDV4cVcvZ1lNc0hjWWVUWU5DaTlXM1crTHVsZzJNdXBLNkFMTm5B?=
 =?utf-8?B?YmpXTE1IeCtPMDF5ZnltU1N6RmxkSmJDcW1PQ1pBU2I4VDdUL2wyLzFuMHZO?=
 =?utf-8?B?SmxOK2hURHh3eVBTWU1xQ1l6UlR4NDRnVWhuTndnRmQ2b3dVQWNsWUZhMVdt?=
 =?utf-8?B?ZlRiREZITGYrU1k4V3p4cEJmZy9jdFBLWGNrZTRZLzJvN1BKdHJ4MFd0cG9n?=
 =?utf-8?B?enh5VjdwSEtaV0cwUDREY0s4RDdmRHJiWFE5ellaWU16ZmFyU0VDQ3Q4TTFa?=
 =?utf-8?B?RVd6R2xPZW5uYmhlbk56eG94aUVOOWxoQTVOZ1hnYy9UOXNXN2pSQzVyRzla?=
 =?utf-8?B?SlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6AB12E31B5EC1C40B2F7367B8F4785ED@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7947.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d460cff5-52d0-4008-2860-08dda4a08dc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2025 02:19:23.6684
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pYEYeakmitBaGdqFEkBYI7bUDzcRGxZulcfEoePHsvcWLrHqfQqBvMdL9Fk4htF4sYL3QMDYfNj9c9wdBCngag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6609
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_191940_076349_5479658F 
X-CRM114-Status: GOOD (  17.07  )
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

RGVhciBSb2IsDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXdpbmcuDQoNCk9uIFRodSwgMjAyNS0w
Ni0wNSBhdCAxMzoyNiAtMDUwMCwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+IEV4dGVybmFsIGVtYWls
IDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+
IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+IA0KPiANCj4g
T24gV2VkLCBNYXkgMjgsIDIwMjUgYXQgMDI6MzY6MzFQTSArMDgwMCwgSXJ1aSBXYW5nIHdyb3Rl
Og0KPiA+IEFkZCBNVDgxOTYgZW5jb2RlciBjb21wYXRpYmxlIHN0cmluZywgd2hpY2ggd2lsbCBy
ZWZlcmVuY2UgVkNQDQo+ID4gZGV2aWNlLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IElydWkg
V2FuZyA8aXJ1aS53YW5nQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRpbmdz
L21lZGlhL21lZGlhdGVrLHZjb2RlYy1lbmNvZGVyLnlhbWwgICAgICB8IDEyDQo+ID4gKysrKysr
KysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4g
ZGlmZiAtLWdpdA0KPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlh
L21lZGlhdGVrLHZjb2RlYy0NCj4gPiBlbmNvZGVyLnlhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayx2Y29kZWMtDQo+ID4gZW5jb2Rlci55
YW1sDQo+ID4gaW5kZXggZWJjNjE1NTg0ZjkyLi43Njc1MzkxZDdlYjAgMTAwNjQ0DQo+ID4gLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLHZjb2Rl
Yy0NCj4gPiBlbmNvZGVyLnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssdmNvZGVjLQ0KPiA+IGVuY29kZXIueWFtbA0KPiA+IEBA
IC0yNCw2ICsyNCw3IEBAIHByb3BlcnRpZXM6DQo+ID4gICAgICAgICAgICAgICAgLSBtZWRpYXRl
ayxtdDgxODgtdmNvZGVjLWVuYw0KPiA+ICAgICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTky
LXZjb2RlYy1lbmMNCj4gPiAgICAgICAgICAgICAgICAtIG1lZGlhdGVrLG10ODE5NS12Y29kZWMt
ZW5jDQo+ID4gKyAgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgxOTYtdmNvZGVjLWVuYw0KPiA+
ICAgICAgICAtIGl0ZW1zOg0KPiA+ICAgICAgICAgICAgLSBjb25zdDogbWVkaWF0ZWssbXQ4MTg2
LXZjb2RlYy1lbmMNCj4gPiAgICAgICAgICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10ODE4My12Y29k
ZWMtZW5jDQo+ID4gQEAgLTc2LDYgKzc3LDE3IEBAIHJlcXVpcmVkOg0KPiA+ICAgIC0gaW9tbXVz
DQo+ID4gDQo+ID4gIGFsbE9mOg0KPiA+ICsgIC0gaWY6DQo+ID4gKyAgICAgIHByb3BlcnRpZXM6
DQo+ID4gKyAgICAgICAgY29tcGF0aWJsZToNCj4gPiArICAgICAgICAgIGNvbnRhaW5zOg0KPiA+
ICsgICAgICAgICAgICBlbnVtOg0KPiA+ICsgICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTk2
LXZjb2RlYy1lbmMNCj4gPiArDQo+ID4gKyAgICB0aGVuOg0KPiA+ICsgICAgICByZXF1aXJlZDoN
Cj4gPiArICAgICAgICAtIG1lZGlhdGVrLHZjcA0KPiANCj4gV2hlcmUgaXMgdGhpcyBwcm9wZXJ0
eSBkZWZpbmVkPw0KVGhlIGRlZmluaXRpb24gaXMgbWlzc2luZywgd2Ugd2lsbCBhZGQgaXQgaW4g
bmV4dCBwYXRjaC4NCj4gDQo+ID4gKw0KPiA+ICAgIC0gaWY6DQo+ID4gICAgICAgIHByb3BlcnRp
ZXM6DQo+ID4gICAgICAgICAgY29tcGF0aWJsZToNCj4gPiAtLQ0KPiA+IDIuNDUuMg0KPiA+IA0K

