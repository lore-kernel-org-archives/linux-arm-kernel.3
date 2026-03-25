Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DE6106B535
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 13:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jbK2zxykqgUc2zKfD989b3UBcjdHnraEMPLn432HyCU=; b=NeF7YAa1t+GQ7JIly/LRcb8iUH
	PvUPjvsi60vhdp3MvJ6pBAN4WAA+W/ddc9r1M8HtIUs/+50drvMX8N0JMnHWIfuXUe/KQAKdbyBb5
	GvY/I4PY+psGWY9/NkhMZQtEO5T5r2+ARx5u42waT2BjvD4s4yr1rFqAcsuB2DJbXnDQvbaXzmqX+
	TsUinMYzYq5KAVPWDrL0w+PxltnKWw5TBO4h+vGms5ONZw/jcZyuxdW1ZbNxuONnvKN2Fch8LE/Ya
	xjD/QiLqXLCyZomdWOHJvtDYgKn/YjTx1UOriF5C/NzKxBtfjgZG1+fEtlNN4fq9Y+NMJ1Rz43Zud
	+vsUkDxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5OG9-00000003Skt-2cWx;
	Wed, 25 Mar 2026 13:26:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5OG6-00000003SkL-3U61;
	Wed, 25 Mar 2026 13:26:55 +0000
X-UUID: 47a2adfe284e11f1a6de359d7043e138-20260325
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=jbK2zxykqgUc2zKfD989b3UBcjdHnraEMPLn432HyCU=;
	b=rwu7DwO4l4w79At0c1aJhIaVnRIGZJW0+woMNwNmjVWuodrKSuqKlwEhHJU8pEt8NwXdVZw4wqgi4NO4GXRbx0G+jbtVsJamLsZUyjbprcA18nswHS0RDb97e9NW/Ipofiq/F0mFqoQNhuR5nuRwk1s8uozmtZUhbvpXSaaRvG4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:9f96d882-99aa-4a37-adb9-39d1a210e2fd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:04711fd5-060f-4ecc-9ee0-121eeeb4a682,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 47a2adfe284e11f1a6de359d7043e138-20260325
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jay.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 884886058; Wed, 25 Mar 2026 06:26:49 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 25 Mar 2026 21:26:47 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 25 Mar 2026 21:26:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xoHSVkSwJ56bNs7+lsHwe8W/QqdD6NCfDv3bjqX4M2YdzrQ9w0tkWA8D7gSfdSbW/A2CKWYWlVItYWndEzPShckyKm1/cMcZHLwXnaXr21df5HYa+PntTea+PCelAFMy5VR4X2oDC3Qimwk3JoKLftXjiwNaD4cjuLADoAWl4v9/Uet8xNq4Gld7FB1f52rV3Yu3AIUmgTsHkemZ5wYxJtvWVYc6uQMMhjHq7M6d2VIl+Mqhh8L3/9/A6hM1h0I4ZLgvDmiRlN8apH8rOilfrs58nFnjeglIzYMIg5y61ySNuPV7JB72HpaAGrazIiHhsIhH9aWLFk5yB4TZrzKXiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbK2zxykqgUc2zKfD989b3UBcjdHnraEMPLn432HyCU=;
 b=HhQ0Yc7div/FF9inSi3KCqK9ZsOmOI3J7aPg5wz5LGQ2JT+ZMTXzQPEJ2Zuhnxw1LdWS28Lu/9PPpWnLd3vHxpbNv3CvmDcvUCowDLUYg62m1i/zzE7dxFnGyuUtM5SziiyyWxLxjZCjlaSchHOqC0MJXCFeEj/Xu2kkgEI97iaihF1qt1DWwzEQue+mSpLRdO4VNgOg3soC2nPw65H1Gnf9972zJfDP8z/1Nz13N+v93HPq8z2ZYWeyuKoJgmr10+ivFxp6P58YPI1c7K3ZF3WEe5z+VZfb/k6x1bPBtHRoLjmqXFVF6PPjYg8ifOoJgHucx21Pte17lOZhiZ6f4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbK2zxykqgUc2zKfD989b3UBcjdHnraEMPLn432HyCU=;
 b=vMlBkQAtpsaHtbG4b07JmOyY+/MYiUlOj0hv7Bi9A10vLk+1jvBW9YN7HXxxkPs0pWSmfPfnnk7b/Q7p/jYuVSHStbXILdTuo/K7ygOavvxZE6LE4FbBmI9rTJ2LDJJ4yWktaqMFAvT135EOoaZvNb+Szupybr82MPRFAVsdHdQ=
Received: from TYZPR03MB8136.apcprd03.prod.outlook.com (2603:1096:400:459::6)
 by JH0PR03MB7655.apcprd03.prod.outlook.com (2603:1096:990:d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 13:26:43 +0000
Received: from TYZPR03MB8136.apcprd03.prod.outlook.com
 ([fe80::6ae8:431f:acb5:6294]) by TYZPR03MB8136.apcprd03.prod.outlook.com
 ([fe80::6ae8:431f:acb5:6294%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 13:26:42 +0000
From: =?utf-8?B?SmF5IExpdSAo5YiY5Y2aKQ==?= <Jay.Liu@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"tzimmermann@suse.de" <tzimmermann@suse.de>, "simona@ffwll.ch"
	<simona@ffwll.ch>, "mripard@kernel.org" <mripard@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4 0/6] porting pq compnent for MT8196
Thread-Topic: [PATCH v4 0/6] porting pq compnent for MT8196
Thread-Index: AQHcu4000bpzCw8SSEaCv9Ba226/6LW+6ICAgABWbAA=
Date: Wed, 25 Mar 2026 13:26:42 +0000
Message-ID: <62bd99417635c7c77f2e3fba77296ed3ac9aa603.camel@mediatek.com>
References: <20260324125315.4715-1-jay.liu@mediatek.com>
	 <20260325-hissing-jasmine-crayfish-caef70@quoll>
In-Reply-To: <20260325-hissing-jasmine-crayfish-caef70@quoll>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB8136:EE_|JH0PR03MB7655:EE_
x-ms-office365-filtering-correlation-id: f3a290bb-0421-47ab-9663-08de8a722792
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: xhyV1c8pOeb4SPxhsoPyI9b3YUcZCyL0ZbmRxDiw05w5hyuRYwMR1168MU5WfOGgDu9XfvdKYu3CU83GGzpecRJJUArwz3bDRfWuWj2fXFq/wF1pdqCPCcfiAnmpYomUK9Z7n9rg8vgFo5MLH9rJCDT3FbThKhtFvMaKmSi5zVQjam5ZGUIO1bauL9Ml/bMIoY/XcSdoajX+Smh4w3L/qb5sSXdwPbHdTgVRLph2ElmzpOD1hN3+Fb/ZDVkYlEJONwZ+Kt+xt93k4Sj2SsTgKQjeLdufOsSjN5t/s0rf67raKaY/4ONCX/YmUhnSC2dsB3109YfMZ/ppVSCGt+WsGF8vpEt8fyFKBFxFe/jH/5W2efXJ+JiDvvQ5usbhvqXAMsXselytyaJYnpKU4gCCCUr7A1oOGvyvj/6uwRvKkbBHQrPt8jVCuJux1ozSpL0+q+y6aak87dUfSm3hwjG9rNYhQq9UkG/gAF4D3VdL6APc0KYeBbUDXlQ7RKg0scy+JoAGWW/OLrY5rwjMMScWyXC/dp8UKMvyBYsCiHexJqG3S1TsnTCDahSoai1z4iNuAFLgm69f7JsvDsidL5QBZNkYDbgjQKLZkzzDIDpdFnoL0c6GI/89zOv5dGiGcYCI08Yu/NqHgLi0PxgTId+zNaMo9ZSFM9+nxN04BfmsDEV5O9lyT0J233++q5+bYgjS5Ol3ws/3VbmycvAzTycnubW08EmEWzYqk33nidkPKaGZKNep7F+yh/q/jfldSCmaEliRiaihElsURNtN46chLE1nq42Dgb+kP9MAjOIu1O0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB8136.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Lytnd0hob2hGV001MHhERzZaS0dmRXN3WjFpcklESVpqNzU4WHNuVlpMZVdD?=
 =?utf-8?B?K3h5dUhqME05TkVSTnZoVVF1dFVRQ1RwWUNKYjg3RWphWitaNnJWVzJ3N1Ry?=
 =?utf-8?B?YW5YZFU5YnRRSk9EbkRTOE1JRU9USVdhU0tzU1BpcHBUc1k1SXRidE5CNGNy?=
 =?utf-8?B?QVJYVUVOVk1IaWs1ZzRRU3MvektJMnE5Z0pnNDFISTI4VXloNWkrUnZncitq?=
 =?utf-8?B?TVp2RTBqaVdqWnlnS05PTlc5RFJlK05UaStMNGZxT3VQQkhJNXkvSUQ3UDd5?=
 =?utf-8?B?cSsva3lqemRnZmdjVXpBS2xwc3R6czhUdjRSTHVEclczc1F0eTFFRWd4RnE5?=
 =?utf-8?B?bTFsUzFFTTJCNzZ5U28wQjk4QU1JSFh2bkJsL2FnVjdZemVkV0FIUkpIQ3Ro?=
 =?utf-8?B?YTBDWmYxTzl5ekp4VGsvbFY0WWQ1Yks5bkJIQnBuYUtrOFpOT0VCRkIvdGxk?=
 =?utf-8?B?cFN2NFJwc3BFbTNVSWVLa3AvdWphckhYdTA1UVprd2MvTzYvQmVqeTN0QlZM?=
 =?utf-8?B?QkdoTmh6SmNqVGFvNkpEbnZvMG90YWdYNFZXTzNNK1JudmF4emg2R29lTEVQ?=
 =?utf-8?B?WDlad2dKSTFDT05SQjJ0emJNNTVBbFZpTmlrd0ZGVWN0cnZaR0dXaHlUTEZI?=
 =?utf-8?B?VTZJL0RMTnQvVVVQTjV5d3R2aFVhb2pqazUvemJURk9IQzNIVjFjTEpJSWl6?=
 =?utf-8?B?VmFpUkY5Njd3bFYxOENiejU1NGJSdjNETldES0dRaDFEdU9vbHJzUndZaFVo?=
 =?utf-8?B?ZmpGYWlaZXZuRVZ2bm5HUVk3b0hETHNxVjZDWkpaMUlnWVFROVVoUkFaUmdE?=
 =?utf-8?B?M1c5Mm5WN041d2F5OG5BRVFkVkVzNi9ta0x5dEJHVXNjdHJsWmd2dWhXRGZN?=
 =?utf-8?B?bE5wOWdHN1hsaEVuNkhUMDRGVTh1bXd5bzNibmhUWnFBci85SCtvdmI4OHR6?=
 =?utf-8?B?VkxHK3dJSVYvRno1L1JYOWhYWlY1am5oTU1scFU1SUNSN0RyMWhxVjRqZE5P?=
 =?utf-8?B?RzRxM0RGVFdUMVVSRGdSRGZRdjhFU0ZxeGRnTGhPZ1ZQQTg5Q0U4T1pZVnky?=
 =?utf-8?B?SE1FcENaNkQzQThHYUhpclBuWndxMjdqWFArcDJHWlhsNEtCMm9UZGhwN1Fs?=
 =?utf-8?B?c1VSR3gwalMvcGViWmVwMDBVeWtFaGZZZ2xHRnVoN2Q4Z0drc3ZqZXVuaWNy?=
 =?utf-8?B?Y2QwTm5EVWZKekF4TXRrSnV1WlBGZnNjTDBxTDBlMzJ0VE9yVFJuVlVOMzcw?=
 =?utf-8?B?RlB1SHI5TklQc3N3TGZ2RzcydWltUkFYTm1abnhtM2VEL1l2UW5zR3lxZHNN?=
 =?utf-8?B?QVN2OHFwZjdjMTd0VCtmdWFLeVBwREt5UjlmVHVjRXR5cVp3ZGlWNFVpS2hm?=
 =?utf-8?B?RkhRVGFKVGdQbjRXT2xTT2lrZXZ5enpXRW1Ha0gwQTRoSFNNTS9oWk1LdTVY?=
 =?utf-8?B?dmJ4MjF6SzRaMkVsbE1HZS83bzArbTRsR2E3THpKamxXMEJ2Q0prVTJ3ekJN?=
 =?utf-8?B?UENsU2dxUUlHS3FOL0w5U3E3OUpUb3B3dWY3aXJNZ3dUZklHVktVS01kaGJa?=
 =?utf-8?B?NXEwM1l0cmlvZWMwTm83SXd6Ym96TFJvNHZiSkN6bFBBWU1ZMmRsN0JUWEI4?=
 =?utf-8?B?R0V2UlNGVGpIeWNmbGpXY1ZwOUxhNFdPVFdIMXAzYmtveHU4OGNVQ1hsY1NG?=
 =?utf-8?B?c0VFQ2FkOWhrY2tpUjg5d3p3NlFKZ0gxbnFLN1cvUUZ6S2ZKb0pmcEtUTCtE?=
 =?utf-8?B?Y1lEc3dITGIvTHZTU2c1WElEbkRTRVhuQmlKam1ZdjdDUFVjQW41YVIrYjVE?=
 =?utf-8?B?K2gwSFMrSnBrWE9Oa2FHTFF4SCtJOWdpVEpaVjB0VW15L3ZoQjZGeTJWaFR4?=
 =?utf-8?B?c0ptUitTaFZPWTdYRElEMkFTVkhmOXhVU0h5LzcrdDEwZUgxNnFRSzJWMDZh?=
 =?utf-8?B?SHVFZTg3Tk9wMTFjcldUei85M3BoKy9LN2gybFh3azg2MWhJVVl0UUt0NFRx?=
 =?utf-8?B?cGRUbTk3RkxjQjFBa1NoM3FuRENVeTBSNmxuU1Y1SjE3NnZmS3JTb0ZTbnpn?=
 =?utf-8?B?NENleTNrWXk4WFArN3Z2UEo4QVJrZGhnek5CL2UzcElCQXJKOHhORTJVdm9Q?=
 =?utf-8?B?OEVXTjJobnYvRVlvWUpncDdHWE9pUDFrN3g4U1VzNlpMOFNuZUpsY1ROQnIw?=
 =?utf-8?B?R2hmQUZQcFRCNU41LzZBMVE0OGtRdVJRSHJ5VDY4ZFpEZXNrNDVkK29NdVVs?=
 =?utf-8?B?aW90VnJVS096NnZqaU5vQjlmMGxzdkFHYldKSHF3cVhrYm5pOFcvZEV6cmZr?=
 =?utf-8?B?WnZqTTMxUXh5VU04Q0o2ZHliT1JVK1BqVzZtcnJoTlViYjYwR25hQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2A9B3AE08ACE504FA11D2761DA93F383@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: VGaMEbFN7/RvRRIsU5oV4LZLSWyc2l9Ie+8DGJcf5vsGlHJ6Os7dMQxI6SrbP13gD+2tXNeTu/49NK0EwZxcSFm39GTRuAuyvwL6GYMNJvD33u3d6u402peJcOfNl6oehLGiZeb1Sk/pNdwyTeZUtNOXJA+YR2shc3urqP5d3nU29Mo8XoT+jm0X61vmtnedYJCUMD0I4nmVlr21wZLwc1vW7l8Nb11PUCvHdnXhXETCRJ5RlpfziGyRiRySU15HwwpSCwI9db9Nlkpy/jDG7RGv6iZHz3GQrHjfyGyGS70+QgsqwbqZ/WwkqbDUQOdk444WLvY/EHXhACcmTCXlaA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB8136.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3a290bb-0421-47ab-9663-08de8a722792
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 13:26:42.7719
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7TxE0cdXAvOjUcJm0j4Vg/tUP4VtVKdSoooqPZE8BJBToY1jji1tN1NbLihLmGI1WSdPMT61FSXU0rg+UuAvDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7655
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_062654_894429_606A4AAC 
X-CRM114-Status: GOOD (  19.96  )
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

T24gV2VkLCAyMDI2LTAzLTI1IGF0IDA5OjE3ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBPbiBUdWUsIE1hciAyNCwgMjAyNiBhdCAwODo1MTo1N1BNICswODAwLCBKYXkgTGl1
IHdyb3RlOg0KPiA+IENoYW5nZSBpbiB2NDoNCj4gPiAtIEFkZHJlc3MgY29kaW5nIHN0eWxlIGNv
bW1lbnRzIGZvciBkaXNwLXRkc2hwIGJpbmRpbmcuIA0KPiANCj4gQ29kaW5nIHN0eWxlPyBXaHkg
c28gdmFndWU/IFNvIGRvZXMgdGhhdCBtZWFuIHlvdSBpZ25vcmVkIGFsbA0KPiBpbXBvcnRhbnQN
Cj4gY2hhbmdlcyBidXQgZGlkIHRoZSAic3R5bGUiIHRoaW5ncz8NCj4gDQo+ID4gLSBSZWJhc2Ug
Y2NvcnIgZHJpdmVyIHBhdGNoIG9uIHRvcCBvZiBsYXRlc3QgbGludXgtbmV4dCB0byBmaXgNCj4g
PiBjb25maWN0cy4NCj4gDQo+IFdoZXJlIGlzIHRoZSByZXN0IG9mIHRoZSBjaGFuZ2VnbG9nPw0K
PiANCj4gV2h5IGFyZW4ndCB5b3UgdXNpbmcgYjQgdG8gcHJvdmlkZSBhbHNvIGxvcmUgbGlua3Mg
YW5kIHNvbHZlIGFib3ZlDQo+IHByb2JsZW0/DQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlz
enRvZg0KPiANCg0KRGVhciBLcnp5c3p0b2YsDQoNCkkgc2luY2VyZWx5IGFwb2xvZ2l6ZSBmb3Ig
dGhlIGNvbmZ1c2lvbiBjYXVzZWQgYnkgbXkgdmFndWUgY2hhbmdlbG9nLg0KTXkgaW50ZW50aW9u
IHdhcyB0byBiZSBjb25jaXNlLCBidXQgSSByZWFsaXplIGl0IG1hZGUgaXQgbG9vayBsaWtlIEkN
Cmlnbm9yZWQgeW91ciB0ZWNobmljYWwgZmVlZGJhY2ssIHdoaWNoIHdhcyBub3QgdGhlIGNhc2Uu
DQoNCkkgaGF2ZSBhY3R1YWxseSBpbXBsZW1lbnRlZCB0aGUgY2hhbmdlcyB5b3UgcmVxdWVzdGVk
IGluIHYzLiBIZXJlIGlzDQp0aGUgZGV0YWlsZWQgYnJlYWtkb3duIG9mIHdoYXQgd2FzIGZpeGVk
IGluIHY0Og0KDQoxLiBTaWJsaW5nIGRlc2NyaXB0aW9uOiBSZW1vdmVkIGFzIHN1Z2dlc3RlZC4N
CjIuIEVudW06IERyb3BwZWQgdGhlIGl0ZW1zIGxpc3QgYW5kIHVzZWQgZW51bSBkaXJlY3RseS4N
CjMuIEZvcm1hdHRpbmc6IFJlbW92ZWQgdGhlIGV4dHJhIGJsYW5rIGxpbmUgYW5kIGZpeGVkIHRo
ZSBpbmRlbnRhdGlvbg0KaW4gdGhlIGV4YW1wbGUgc2VjdGlvbi4NCg0KUmVnYXJkaW5nIHRoZSBO
b2RlIE5hbWUgKGRpc3AtdGRzaHApOg0KVGhpcyB3YXMgdGhlIG9ubHkgaXRlbSBJIGhlc2l0YXRl
ZCB0byBjaGFuZ2UuICJ0ZHNocCIgc3RhbmRzIGZvciAiMkQNCnNoYXJwbmVzcyIsIGFuZCBJIGtl
cHQgaXQgdG8gYWxpZ24gd2l0aCBNZWRpYVRlaydzIGludGVybmFsIG5hbWluZy4NCkhvd2V2ZXIs
IEkgdW5kZXJzdGFuZCB0aGUgdXBzdHJlYW0gcmVxdWlyZW1lbnQgZm9yIGdlbmVyaWMgbmFtZXMu
IFNpbmNlDQp0aGlzIGlzIGEgc2hhcnBuZXNzIGVuZ2luZSwgd291bGQgeW91IHByZWZlciAic2hh
cnBuZXNzLXByb2Nlc3NvciIgb3INCnNvbWV0aGluZyBzaW1pbGFyPw0KDQpBbmQgVGhhbmsgeW91
IGZvciB0aGUgcmVjb21tZW5kYXRpb24gcmVnYXJkaW5nIGI0LiBJIHdpbGwgc2V0IGl0IHVwIGZv
cg0KZnV0dXJlIHN1Ym1pc3Npb25zIHRvIGVuc3VyZSBsb3JlIGxpbmtzIGFuZCBjaGFuZ2Vsb2dz
IGFyZSBnZW5lcmF0ZWQNCmNvcnJlY3RseS4NCg0KSSB3aWxsIHNlbmQgYSB2NSB3aXRoIGEgcHJv
cGVyIGNoYW5nZWxvZyBhbmQgdGhlIG5vZGUgbmFtZSB1cGRhdGUgb25jZQ0Kd2UgYWdyZWUgb24g
dGhlIG5hbWUuDQoNClBsZWFzZSBsZXQgbWUga25vdyBpZiBJIG1pc3NlZCBhbnkgb3RoZXIgY29t
bWVudHMgb3IgaWYgeW91IGhhdmUNCmZ1cnRoZXIgc3VnZ2VzdGlvbnMuIEkgd2lsbCBkbyBteSBi
ZXN0IHRvIGFkZHJlc3MgdGhlbS4NCg0KQmVzdCByZWdhcmRzLA0KSmF5DQo=

