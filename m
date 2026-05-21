Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33EC7CD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 11:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M2wBvAgbcKrD9/cpzNfUAymnEsJHgeGlsKasCsZokwk=; b=CPTCAnlgCQripsAFBsNx83A6Oa
	5noC30bzvPTqPq/F60cNgx6mrwj6sgm/ScLjrR3m00O8m5Re8LLpxyUoCOqzFKgfgWpRLa48NuVf8
	ZIsHKnEt0q/hBdi4T9Bsk++ecrZGM6cme8Y2ezhPvNLps2vmswQhigAw7l7rQ5ShKjXZuWQetb+HF
	8tMxWooj0gJmfX+JQ9yoxRzQkjnCGG8/gYcn3lrMBdZ/0iSTDAfIspS5KKmiZgJDyJ7OJjj4EBqsJ
	ADBRBGJMWkUZVEc31fpcsXsqs6k0h3Uj/h7Tpp3KDpKXAzvNmvdeUtcGRk1QLzL5TtYlNML0DJded
	268G1sNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ1lE-00000007czy-0liB;
	Thu, 21 May 2026 11:40:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ1lB-00000007czB-3cqG;
	Thu, 21 May 2026 11:40:19 +0000
X-UUID: d2c4823a550911f1afed4741b24580c9-20260521
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=M2wBvAgbcKrD9/cpzNfUAymnEsJHgeGlsKasCsZokwk=;
	b=Ng2qPBKWmIYVppZUlltPTuAaDie43TWrzu1Ze/yt+Twe60DMEEdNxo8NctRql9cGQI4LnwR3Of1+n4di4f2dSojAGqiRVjbJ6Lq3jZ2yZ7H/y9IcRs94/MueCGuRGhR2uhXkFBc6B8YJQGNvOdzlmKp5BMwan76SKYs1ad1OAxg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.14,REQID:8dc0d663-d904-4900-82ca-01b4b0ccca32,IP:0,U
	RL:12,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:12
X-CID-META: VersionHash:9091e75,CLOUDID:cf2b3322-bef7-463f-902c-5f40f7404c33,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:0|15|51,EDM:-3,IP:nil,URL:11|97|83|106|99|80|1,File:130,
	RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:
	0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d2c4823a550911f1afed4741b24580c9-20260521
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <jay.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1052563456; Thu, 21 May 2026 04:40:10 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 21 May 2026 19:40:07 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 21 May 2026 19:40:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Obk3khxRD62A+JMTU/BeMuLq9bleSt5fcxk9dJgM+e6YypDiNXOL1yN/ta+RLFZyyy9t9h+lwYxAtG+MLG/IcOLkcWzHGMClaEG1RBa2HjcFikFn2gJrwkSArWVyGaLNosM4V9DzG57RehReGceXU/0zaxALaR7CXQ1h6IV3Ed8+qUxotKrGse5surGmh+GxDh+XPGcjmS3GSxniq4i1Q/+sgDUZKo+SDBs4mFjz9qdW41HSD3DNhWcXCs9hG7F/Yi06walbv1Uuu/rsFbY68TOxAyT/nHnJ2z/ACfmkKogqrztw/gcIJU22mfoSuabzXBaU9+Nsoo6tiXm/IobKMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2wBvAgbcKrD9/cpzNfUAymnEsJHgeGlsKasCsZokwk=;
 b=CxsEnoBTn0jqr+XcwtIgudXtpfBLJS1iFpBvzYYSVqiE106ffve/nTmIRT8Lh9kK8sYdYypHPighXYVkQ3E0tQY5tDsuLM5fWWSucCHqvYivfxBMLGXcdYxGhU1t48uBOLLtmIVy6toqTrDv8b2qAK3XK5GjpgH68A84uqkmEwChcufvM4oU03IBDHh9+HTaV573nV6HpHku9sRUpnFfm+BtIG8MnSbzn4+ub1IXHZ0HpOa7Et04zHVNGlmnYjVpNqEFhaQa4bmIvqHS46q00SAuxNfSmZNaXMqypgktTky5IhwmZdvRgUIBYgcvSWS+YjxFODHo55NubnLqFMsHCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2wBvAgbcKrD9/cpzNfUAymnEsJHgeGlsKasCsZokwk=;
 b=gxYx6dB72uvsbHuG9/oaxZDfH0/uiKF2qhUHl8uqKnEKIK4tUq4uFSFAORHCS3wTtmnLWGTB+CRCYf0CyJTPFN4NSbDzOW23gVNEYjdaWLBaV1hh4YoHWcfLq9yeaat+PP4NDRkyIoXRzSwKvmSQHO5oFbSMyIMB7AiD6In+zyw=
Received: from TYZPR03MB8136.apcprd03.prod.outlook.com (2603:1096:400:459::6)
 by SEZPR03MB7472.apcprd03.prod.outlook.com (2603:1096:101:12b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.6; Thu, 21 May 2026
 11:40:03 +0000
Received: from TYZPR03MB8136.apcprd03.prod.outlook.com
 ([fe80::6ae8:431f:acb5:6294]) by TYZPR03MB8136.apcprd03.prod.outlook.com
 ([fe80::6ae8:431f:acb5:6294%4]) with mapi id 15.21.0048.013; Thu, 21 May 2026
 11:40:03 +0000
From: =?utf-8?B?SmF5IExpdSAo5YiY5Y2aKQ==?= <Jay.Liu@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "tzimmermann@suse.de"
	<tzimmermann@suse.de>, "simona@ffwll.ch" <simona@ffwll.ch>,
	"mripard@kernel.org" <mripard@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?=
	<ck.hu@mediatek.com>, "maarten.lankhorst@linux.intel.com"
	<maarten.lankhorst@linux.intel.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"airlied@gmail.com" <airlied@gmail.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v5 4/6] dt-bindings: display: mediatek: tdshp: Add support
 for MT8196
Thread-Topic: [PATCH v5 4/6] dt-bindings: display: mediatek: tdshp: Add
 support for MT8196
Thread-Index: AQHc1jgfpJI7gSEF7ESxohDvRCJRHLYLsXIAgAzPO4A=
Date: Thu, 21 May 2026 11:40:02 +0000
Message-ID: <7efa874439239f8f4196e8118db36335a3457be5.camel@mediatek.com>
References: <20260427112131.23423-1-jay.liu@mediatek.com>
	 <20260427112131.23423-5-jay.liu@mediatek.com>
	 <c9ed6676f1ae77e21b2ba2daf75a76f3a9a13389.camel@mediatek.com>
In-Reply-To: <c9ed6676f1ae77e21b2ba2daf75a76f3a9a13389.camel@mediatek.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB8136:EE_|SEZPR03MB7472:EE_
x-ms-office365-filtering-correlation-id: 212ce433-eecb-4970-ff08-08deb72db2a7
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|921020|38070700021|18002099003|22082099003|56012099003|3023799007|11063799006|4143699003|4133799003;
x-microsoft-antispam-message-info: +kkhJnG18aZ3oby4JoKb29khFv/iw6nZEOMyKstOb2qsED5Ptbi/uLRbsFDoMZO7geLdPPZgbOs4BiW6lomWKLl4RwMUn/YcCaepTH6QXHR3SnR0H6+k9QpTfPnhOr/7R+p/rqL2eRL+xYRF1yox30e6N/uJ4QkP7+P0VrZP/73whjEOvg40BBN3NfMbGXH3lMB1PlIx3v01jpdAqSzMzI9pdVQVuDGOM6kiUZoaAWCRCkLOlfiHSLxzKGl7NXZFNMge6MyOuUMgl2itA9ARjsEe17lPI7b68et4fg6S/08Po9ofGCNKjEt4d90SbGWmrmaUkjC1d5hCAMcOcXJ9gCig6CCSEKtonVTQdaVS+vGFsrH8yEfl3uXnlUeZ2Ge2tT1AnR6eRYDA4ssGjSHfGe0gmLj5zZX3pd6Y3m41ijv4yATtqAuXXMxdfvhahc06o5r71w1bhqvfy8LqpBu4mZTw7RZEzUpx70mkR+DzzzgovAJm/7u92/HK3w/qcpC6Vugs+Oj9he37Tpe6kp960LEBqcvYf90zjF7jaoRQLXlcr4Vm6fscVNpaD/06x7yWnrWxUsirji99Ox/pj6TM56YJYRGDU9qMQ2TsBdADlQt7XIaoXNjQd/Z5SbHMyDV4Iz6HU3vLfIM/DvDiTG8PisMPaVsjo9JpNdnQJilJ9GHw9OWRF4ZYi3kBYB1JN6pwZz6c40IAKn4jZH0XPMEntyEMfUlvVDxeZZO5RwVnsfE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB8136.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020)(38070700021)(18002099003)(22082099003)(56012099003)(3023799007)(11063799006)(4143699003)(4133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGhYQjBLYkxlUGM3eldUdkQ2aDhidE8za1RVT0I2ZDhMZm5SbDhld1l0MzlH?=
 =?utf-8?B?eisxOThVRFdtdEJHN2hTOVdvTkdGUithTHFaemd1N0VKeEdpZjM4b2RsYVh1?=
 =?utf-8?B?cStrN0F4eFR5YUhFVHNTWHhQTDg1VmZESHk5M2xqMFpWeHRyeEx5MG4xc3dM?=
 =?utf-8?B?ZC9acnZyT2dKR3NROHVHZHh0elJDWTFRT0tFUkZDUDRFck4wajNTamlDOXZl?=
 =?utf-8?B?UmJpbXEzUlNuSEtnb09QbHJNTCtVU1FJMkhCZFphSkJ1RWtzNUVTNCszbGtD?=
 =?utf-8?B?QWwvaEN2KzljRVUra1djQVltcUQ4RVhuMHptUzhwdGJmM0FBaTVkUHNEYTFy?=
 =?utf-8?B?dmZPaFFMWnBkV2h3dTFOek1Xc0R6b3FUajVDL3JDa2FuV1YvTWpxd3lWMUtt?=
 =?utf-8?B?ZW56dkhFaWNIZURwZGI1QnI1aXA3Smp2dDE2TmdGblUyNGt5NGhqWG54MVZv?=
 =?utf-8?B?L2xJb04yOVVnWEVxNGxXaVdGaXJBc3Q1dWFMVnExZjdsRlhvOEFVUERZYkJW?=
 =?utf-8?B?Vk9jb1lOS21SQTZOaDFQSVVLdnJWYkZEcC9ndVVpdVVucWNmMUxoZVJqTmZl?=
 =?utf-8?B?b0JOQjBCN04rUm9uY0J3UTRGT05jQWNwWVpWS0N2d2Ezbm5rbHR2cGRNQmNL?=
 =?utf-8?B?NVhDTjJFUjdjVWVRS2tQN0V4YVFueGhJZlZnWlVpVm1UV3ROWkdWcEZWT3E1?=
 =?utf-8?B?OXRUUGZEdFQ5RURZNjlSSnpFbTlsTko3RzhFZko4aDU1NHU5UHNjNGFsam45?=
 =?utf-8?B?bkZ6eDROdSttNFdKYzVFWEt4WWY3VWVNNTBWUlNUMkYxTy9jcmlOM3hpY0NG?=
 =?utf-8?B?K1NYRjJxWTJZQmtFbHRXdUFRUFBsbGhDTUZIbzVHbjlKUjlNUWxzczFxM0x6?=
 =?utf-8?B?dEF3eFA3VzZ0RHhhbE84c1d4bHpNTFJFd2NDOWpyeTBmUHZSa1RBSk02YmlF?=
 =?utf-8?B?ZVdXcDFNc3Bwejg3YkpNelFVZGo1U2xqOXVVS2NNVjNnNm5BNFlrWUtZekR2?=
 =?utf-8?B?eU5zS1JuV3UraUlnajA2d3pJQksrS0pVdzhUMTZPeks0eHZ4ajh5ZkpqU3dq?=
 =?utf-8?B?VjRkU2lYTkxKaWlGWHdaM3BQbUFFMmJHeXk1ejlqajBDQlRYRXZuU3FPaTdq?=
 =?utf-8?B?U0lIWWxkTlIzR0xyeXlRQ3E3eU9zeUFSTGZvRmNWYnltWHl6VmpsVnk3YTRu?=
 =?utf-8?B?K1doYkVDcThLcE5iT2U2TXFNelExZTNoZ1RJVVhPeFRuTG4vNUZiZ1RPMTZN?=
 =?utf-8?B?bHQzNjBJZVc4WTJBYXlzbzNLRU40MTkwL2JIcGpkNjVHTWttb2RLaWVJZlYv?=
 =?utf-8?B?dlhLcUQwUGtHZkhtTm5qc0pjU1B3amZkUFhzbjlFQ0lRWElwckNoRWtvY3E1?=
 =?utf-8?B?UFkwN1JqT3F0SG5HaVVMMys4K1EzdTJlRmpKdDliQWR4UjRuVjByekVXRkV0?=
 =?utf-8?B?dlliMytzVTF1MFFoK1cyUlBMVkZwM1lMQVh2SHYwVXFrR0s1OEtYK0h6WDdq?=
 =?utf-8?B?NktZbmlmN3NBM1JWRHg3V1RaOUZzNUFLYUliMTlDTjV2VXlRMmlzdkdvYUlS?=
 =?utf-8?B?dm8xeW5RaGV6amNRTXgvQUNhVzZKZmhob0MwSGJYeGZsWG00OTV0NTlnSytR?=
 =?utf-8?B?U1M5d2pqdy9OL0Y3UkZmTDM4ZmE5QlZnWStXY01pRCtyTEIxSTlZR2VMYXFL?=
 =?utf-8?B?anVSVmtVTnV4MktwVHppMDEvSVRaZ05pLytHeGxwakNzdGovMUxXaElMQVIz?=
 =?utf-8?B?L0VoZWFtZWRLVGRVZFJka29jTCtmNW1iWEx2QmJxeUlxSkZQVWJCd2pFUDFW?=
 =?utf-8?B?YlBHWEhtY2NrV2s2M1lCeWxWTVA1blhsVGpwc1hiZEdzODlRSk94MmJWR0E2?=
 =?utf-8?B?MGZzU2FLYWgxdEpRMWJZWVV2MDhHRUk0eGtld3ZjK0ZYa2tBSHI1N3JSNWRa?=
 =?utf-8?B?VWVRSmVRV1RZRWtFZkg0SFNFREVsaFgyOUxIRjdNNnpucnlBOXR0S2hzZUNt?=
 =?utf-8?B?Y1ZMWFl3SnQwUDNMeFVZaHF0RnI3QThmNmVPVGdZcGF4UEsyeGU0bGdQeVp2?=
 =?utf-8?B?NzV1SlEyR01YSFJBdXpEZ2w5Z2lwUGQ3K3ByMHMyUDI2OGc2R1FpZkx4dkxT?=
 =?utf-8?B?a3FXY0xqZ2hGMGsxbzhsREZhOUFDZDdxWDVLRDhQY2FZNUhZL0RMUFBiQjJn?=
 =?utf-8?B?NWhFT1FLRnd2Q1k2eHVtZXZJN21scE1wWklVVnNPcmdzT2p6aG1ZTnU0WjVN?=
 =?utf-8?B?SUlIUHNlUDY1TjhpV3BQdXk5WUdLQy9GT1hMMm8zN1krZSs5SGdEQ1o1NFhu?=
 =?utf-8?B?SFdRWHIwWWl2M1c0TnFSRTVIZytkSGZOWU9McE1XNm56ZjU3WWpQQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F4A79A0E17E2B349961709390E059093@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Dc4ckrxiidKRw0Y/XIoDu86RbM7Sm9diwQvMVj+lC75f942mJQhSuXW1zkrf++DoqesYt59I+jIUjT8aDWd/YBGg3nxE1JQr1vGGtF4aKGN6FMOIev4sSG0UKr6Kl8voYzIqylU1IxzOvAPV1uJZaDGrIUk9lV2UNSKKtIXjbs4XrX1FXJ2xBhqx7qNvd711L0ODOlVEYvNAQRFwyLfVAr6KOp+aAV0MtQ7Y+I7620BNeTt1Yd1OIVSwQskqBGUD5EoV0XOv5vKugsTFLz4xW4JFX/s9N7P8m5SW4GSHfsm6JEuZuTHK1WbA9bgT1LfEctAnQJb+BBjzLoSA42WAgw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB8136.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 212ce433-eecb-4970-ff08-08deb72db2a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2026 11:40:03.1223
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1WQI0eP3tZO9n2KVgqfH7WGiT0uaT1o3m3atH/lXtSI5NGxjgOPKvVW4Oh58TStTEGaWw+T810CQn7aJCrg1Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7472
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_044017_934128_BBF24A18 
X-CRM114-Status: GOOD (  21.00  )
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

T24gV2VkLCAyMDI2LTA1LTEzIGF0IDA4OjAzICswMDAwLCBDSyBIdSAo6IOh5L+K5YWJKSB3cm90
ZToNCj4gT24gTW9uLCAyMDI2LTA0LTI3IGF0IDE5OjIwICswODAwLCBKYXkgTGl1IHdyb3RlOg0K
PiA+IEFkZCB0ZHNocCBoYXJkd2FyZSBkZXNjcmlwdGlvbiBmb3IgTWVkaWFUZWsgTVQ4MTk2IFNv
Qw0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEpheSBMaXUgPGpheS5saXVAbWVkaWF0ZWsuY29t
Pg0KPiA+IC0tLQ0KPiA+ICAuLi4vZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayx0ZHNocC55YW1s
ICAgICAgfCA0Ng0KPiA+ICsrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDQ2IGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssdGRzaHAu
eQ0KPiA+IGFtbA0KPiA+IA0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLHRkc2hwDQo+ID4gLnlh
bWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlh
dGVrL21lZGlhdGVrLHRkc2hwDQo+ID4gLnlhbWwNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0K
PiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uNTBiMjRjYzIyNDIwDQo+ID4gLS0tIC9kZXYvbnVsbA0K
PiA+ICsrKw0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
bWVkaWF0ZWsvbWVkaWF0ZWssdGRzaHANCj4gPiAueWFtbA0KPiA+IEBAIC0wLDAgKzEsNDYgQEAN
Cj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1D
bGF1c2UpDQo+ID4gKyVZQU1MIDEuMg0KPiA+ICstLS0NCj4gPiArJGlkOiANCj4gPiBodHRwczov
L3VybGRlZmVuc2UuY29tL3YzL19faHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxh
eS9tZWRpYXRlay9tZWRpYXRlayx0ZHNocC55YW1sKl9fO0l3ISFDVFJOS0E5d01nMEFSYnchanZM
aUw2dzdTY0pxaGtNMEl5aUxvazRjd3piLWUxZ01FLW1POXI1bExUM0pUcmdhQkJpaVYxajhMRmtt
SmtJYWZhR2lCeWEyR0pONmgzOGUkDQo+ID4gIA0KPiA+ICskc2NoZW1hOiANCj4gPiBodHRwczov
L3VybGRlZmVuc2UuY29tL3YzL19faHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9j
b3JlLnlhbWwqX187SXchIUNUUk5LQTl3TWcwQVJidyFqdkxpTDZ3N1NjSnFoa00wSXlpTG9rNGN3
emItZTFnTUUtbU85cjVsTFQzSlRyZ2FCQmlpVjFqOExGa21Ka0lhZmFHaUJ5YTJHQ1BmbHJGeiQN
Cj4gPiAgDQo+ID4gKw0KPiA+ICt0aXRsZTogTWVkaWFUZWsgZGlzcGxheSAyRCBzaGFycG5lc3Mg
cHJvY2Vzc29yDQo+ID4gKw0KPiA+ICttYWludGFpbmVyczoNCj4gPiArICAtIENodW4tS3Vhbmcg
SHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPg0KPiA+ICsgIC0gUGhpbGlwcCBaYWJlbCA8cC56
YWJlbEBwZW5ndXRyb25peC5kZT4NCj4gPiArDQo+ID4gK2Rlc2NyaXB0aW9uOiB8DQo+ID4gKyAg
TWVkaWFUZWsgZGlzcGxheSAyRCBzaGFycG5lc3MgcHJvY2Vzc29yLCBuYW1lbHkgVERTSFAsIHBy
b3ZpZGVzDQo+ID4gYQ0KPiANCj4gYSAtPiBhbg0KPiANCj4gPiArICBvcGVyYXRpb24gdXNlZCB0
byBhZGp1c3Qgc2hhcnBuZXNzIGluIGRpc3BsYXkgc3lzdGVtLg0KPiA+ICsNCj4gPiArcHJvcGVy
dGllczoNCj4gPiArICBjb21wYXRpYmxlOg0KPiA+ICsgICAgZW51bToNCj4gPiArICAgICAgLSBt
ZWRpYXRlayxtdDgxOTYtZGlzcC10ZHNocA0KPiA+ICsNCj4gPiArICByZWc6DQo+ID4gKyAgICBt
YXhJdGVtczogMQ0KPiA+ICsNCj4gPiArICBjbG9ja3M6DQo+ID4gKyAgICBtYXhJdGVtczogMQ0K
PiANCj4gUmVmZXIgdG8gb3RoZXIgZGlzcGxheSBibG9jayBiaW5kaW5nIGRvY3VtZW50LCBhbmQg
ZmluZCBvdXQgdGhlDQo+IGNvbW1vbiBwcm9wZXJ0eS4NCj4gU3VjaCBhcyBwb3dlci1kb21haW5z
LCBnY2UtY2xpZW50LXJlZywgcG9ydHMuDQo+IA0KPiBSZWdhcmRzLA0KPiBDSw0KPiANClRoYW5r
IHlvdSBmb3IgeW91ciByZXZpZXcgYW5kIGhlbHBmdWwgc3VnZ2VzdGlvbnMuDQoNCkkgd2lsbCBy
ZXZpZXcgb3RoZXIgZGlzcGxheSBibG9jayBiaW5kaW5nIGRvY3VtZW50cyBhbmQgaWRlbnRpZnkg
dGhlDQpjb21tb24gcHJvcGVydGllcywgc3VjaCBhcyBwb3dlci1kb21haW5zLCBnY2UtY2xpZW50
LXJlZywgYW5kIHBvcnRzLg0KSWYgSSBoYXZlIGZ1cnRoZXIgcXVlc3Rpb25zIG9yIG5lZWQgY2xh
cmlmaWNhdGlvbiwgSSB3aWxsIHJlYWNoIG91dC4NCg0KVGhhbmtzIGFnYWluIGZvciB5b3VyIGd1
aWRhbmNlLg0KDQpCZXN0IHJlZ2FyZHMsDQpKYXkNCg0KDQo+ID4gKw0KPiA+ICtyZXF1aXJlZDoN
Cj4gPiArICAtIGNvbXBhdGlibGUNCj4gPiArICAtIHJlZw0KPiA+ICsgIC0gY2xvY2tzDQo+ID4g
Kw0KPiA+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gPiArDQo+ID4gK2V4YW1wbGVz
Og0KPiA+ICsgIC0gfA0KPiA+ICsgICAgc29jIHsNCj4gPiArICAgICAgICAjYWRkcmVzcy1jZWxs
cyA9IDwyPjsNCj4gPiArICAgICAgICAjc2l6ZS1jZWxscyA9IDwyPjsNCj4gPiArDQo+ID4gKyAg
ICAgICAgdGRzaHBAMzIxZTAwMDAgew0KPiA+ICsgICAgICAgICAgICBjb21wYXRpYmxlID0gIm1l
ZGlhdGVrLG10ODE5Ni1kaXNwLXRkc2hwIjsNCj4gPiArICAgICAgICAgICAgcmVnID0gPDAgMHgz
MjFlMDAwMCAwIDB4MTAwMD47DQo+ID4gKyAgICAgICAgICAgIGNsb2NrcyA9IDwmZGlzcHN5c19j
b25maWdfY2xrIDEwNz47DQo+ID4gKyAgICAgICAgfTsNCj4gPiArICAgIH07DQo+IA0KPiANCg==

