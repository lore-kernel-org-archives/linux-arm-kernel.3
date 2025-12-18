Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A462AD65C7F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 01:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cUh6POBVSZpNfC9xdUvOL0JMFk5YF7VX0vW0f3yJ85k=; b=wVQm15lUkrigw48PEROtnSxG1r
	3zIttSJI1egD4xriHT3S5zM5DkRrh3pP/IvPTELl3d3xY1VLYMNrFB9LuLklWH9TTmtipttURqnxS
	x60oAHf2V+7kBHqQg7e/b2K6gHk2N0aHlir7lG5wWQvnhhPWE4n7RnEbqDaZQcyhDggvuMdljCHLV
	GXOMf4XDZkCFcNmMPTpnZ0UqgiGTWd7cIoYurj1iGojqEP789xKnI1p81KeEegb9i683C1QvASWf3
	nIBFXR90hVqaUvl4PB2utAKzzDo3x6t8e9UQCzEja4rGQjJk/eaDiHlh8VEt8xbfbPN27K76az9dU
	2HR/PLKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW2aH-00000007e15-3uCI;
	Thu, 18 Dec 2025 01:13:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW2aF-00000007e0U-1oeS;
	Thu, 18 Dec 2025 01:13:36 +0000
X-UUID: c56b21ccdbae11f09f706fa2197c6ceb-20251217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=cUh6POBVSZpNfC9xdUvOL0JMFk5YF7VX0vW0f3yJ85k=;
	b=Z2MY6Ak2KW3TDKPw+b2jNYdKoU7M1SU9XHTdgx5vbY5woLTHg4haiqXj0KbUbcV1hpebRmBaQDgHvK26tQoZhHMW4WPpnl0w/emiK7qB8KG+1Kv9DJFFt4rHHX8N2ecwLaB2ej+f3hGDC1ApINKpXFePqglFRgfSQ/guDERi8TE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:9d395ef6-f530-496e-82b6-c624c465b3a8,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:bf2950aa-6421-45b1-b8b8-e73e3dc9a90f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|52,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c56b21ccdbae11f09f706fa2197c6ceb-20251217
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 828309377; Wed, 17 Dec 2025 18:13:33 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 09:13:29 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 09:13:29 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RVRpNQQEEoXhyDh9NuDNHNWwLTRFPzrnvgVuA+d31qRWxtqQKob9zedPQ7dErLyzpfku6uQeaLfVhq0iUbpcps9XlBEaIHVkKueSdooniCJnr6lmn1SqM4YElVjNidVZTI1eNMsMov35h3m+74FN8IDDjaf0rcwPPPgWDW/6LjxNSFk54Fe+VbtTJcO1CeUZ38k+nwBZXJegeBXF14wkbCAiWlh3T1UUmE2ituSm4G+Dkm2cGEYz+hUi2QHxEAA1MVX2D9F6VjEIj9Rl0f3LAQ6kQ63fRO5Bd8sXZVP3iIZPCAUTAw8MKavl8RcaEI9z7yuXb8qBBQXONP/INI6xFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cUh6POBVSZpNfC9xdUvOL0JMFk5YF7VX0vW0f3yJ85k=;
 b=lxginPKrTE+1qhqbJN1x84M+688wpR8a9Vav+SahhYbI6Y6s/55unrQoamkyBuIIk28FgMAPwyFcxdSxXE2Dva2TfpVF7d4RFRY2sl7+iINWF8gCqd+G15iIG90e9fOWuG32ZgLSzFyAvnL1ZeGtZD8mZdpuHpbcKASrQcxNDt+Mcs4UIeRb35t0mKLg7ffM5yD6mohpoAT2jFwcPNrj2yhNYxpytmhLM/6akmzdy0LtgITdXSc3dQgFeLCRJL+T1Zr3zrHHS/kDfNeteCXNYzrdJtKbr3LiGZh4ITr0CX9CTmjXq6Ej8S0b3h0lEpq4e4xjAn6XEhQqfCnLsAZnig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUh6POBVSZpNfC9xdUvOL0JMFk5YF7VX0vW0f3yJ85k=;
 b=tLURypgQkVXPCvJk/yqUsdmHOXfJwHs0NqgJXKZZbG8ue/olPrbYRhJJ/XiS3dZT63m0NqYAle6IWu5ilVcX4SWP40qHIuPrZAomkJqyKCpZxHkM8M3VdcNxFR6C4L80WLAphnjYIr++JntCvyi2nQTmRAHrR/rpRHbBZLH28ao=
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com (2603:1096:101:83::7)
 by SEYPR03MB6770.apcprd03.prod.outlook.com (2603:1096:101:8f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 01:13:26 +0000
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba]) by SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 01:13:25 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "simona@ffwll.ch" <simona@ffwll.ch>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	=?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?= <Mac.Shen@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "airlied@gmail.com"
	<airlied@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, =?utf-8?B?UGVuZyBMaXUgKOWImOm5jyk=?=
	<Peng.Liu@mediatek.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	=?utf-8?B?TElBTktVTiBZQU5HICjmnajov57lnaQp?= <Liankun.Yang@mediatek.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 1/2] drm/mediatek: Adjust bandwidth limit for DP
Thread-Topic: [PATCH v7 1/2] drm/mediatek: Adjust bandwidth limit for DP
Thread-Index: AQHcTWmCip4eLqWqN0GPcdLj8ezueLT5z/4AgAfanoCAAr9PgIAIFa2AgBpcmAA=
Date: Thu, 18 Dec 2025 01:13:25 +0000
Message-ID: <1fdb12e5f06c3087ebf0c0296f6b1cad45c237af.camel@mediatek.com>
References: <20251104085957.1175-1-liankun.yang@mediatek.com>
	 <20251104085957.1175-2-liankun.yang@mediatek.com>
	 <18cd9c74699b5afe4d0bff9a6c325389d2881e29.camel@mediatek.com>
	 <dfd8767809d52efee2e7592e4b45cfd2425334b8.camel@mediatek.com>
	 <54b075b4ff6b9aa7cd916bb65e34e5edae3642dc.camel@mediatek.com>
	 <f4e8ba2e9f9a8e5fd4b35afe25b9874c64c6ea17.camel@mediatek.com>
In-Reply-To: <f4e8ba2e9f9a8e5fd4b35afe25b9874c64c6ea17.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6626:EE_|SEYPR03MB6770:EE_
x-ms-office365-filtering-correlation-id: b829bf2f-6f01-46be-2d4d-08de3dd2a53d
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|42112799006|366016|1800799024|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?aGZ4NjN1SStMSi8rRHU0b21QTEdMOHJLQURraTU4MnlqNk9aS0xWVmVhK3Ja?=
 =?utf-8?B?cEl1TDAybXNkaXIrWVVVYUI0SkpyK1plQ2d0c2lkNENLb0JGbXEyc0Uyb3VU?=
 =?utf-8?B?VklWTFFUUHF5MWl0UU5vdklzTzNSMUtGSkpTcnFlY01zbzlEeWxrOEhteHRN?=
 =?utf-8?B?a0oraWM3bE0wNGdlakhRbmQ2NWF6TlFRWUxiVVMwdkp0ZlBHRktNaUQ0NXQ2?=
 =?utf-8?B?dzBIWS9GV3dWSkhBSUpoKzZXWFppeFZDWm1YUWZncXQ0Z3YvczJ1UzVDamxM?=
 =?utf-8?B?WFhFNUtFTDNlUHlVTzJvdEFvekwwOGI3dDFzejA2SFUzbDdObDlsSW5oeHRD?=
 =?utf-8?B?QlROemltT2FXdEQ3ZTRWYmZ6M2xVTkVYRW5LejRUYWs5eDFQSVBveXZyM0M2?=
 =?utf-8?B?RFQ5WjlTMXdQL0lVdDNsYmlWblBvcVRiK2F1YlpSRUl6TEZYNzZERzJ2MVMv?=
 =?utf-8?B?bmJsbFlkMEhLVW8zNm84bmg3SDFPMmEvRE44MmhENTNmRnEvd202ZmQ1ZEhi?=
 =?utf-8?B?dVUzQlhadTcxYk1VN0IwSWl2dUF4eFZjb1h5ZVE5VGgyL0V5QzVyZ2F4a2dQ?=
 =?utf-8?B?TVQzRlNDWmZHc05oVWdzRzhOeFROZ0pEeHNQNlh3QUoycyswTmdQN0lWVEQx?=
 =?utf-8?B?b2JIaEp0SFJyQjJta0hMeTdZNE1TUW92TU14WjBaa0JiSFhsRGtNWFNwT0Vn?=
 =?utf-8?B?YzR5c295UGIxamRPZjc3U2xHaVp0SVdVQUJEdXF2Z2VCcjhMbFFRazcxN2Vx?=
 =?utf-8?B?U0k4VCt1M3l3WWF2eVNDVWxkbFlYZTZzblpHbTFKcXcwWHhLMkRweXBLQ01j?=
 =?utf-8?B?SW96Ymt5UHhCblBnWjROSFJ0U1E2WFA2WWRHYVNHRnVDQkpyc25GZE9HL0x0?=
 =?utf-8?B?YmNhTnJicjJHQjZ5ckZNQ0QwcDVEZkVjOTdlS3p0R29BQW9DMUlFdTlSMTE0?=
 =?utf-8?B?K2ZndWhwdHp3YW5kRkNJM1NDczV6VW9aYmFrUkM2aUhWRndONkZGVjB1Tjh6?=
 =?utf-8?B?RnFaUitlbFdDUUMwOC9hS2t1djNtV1I2aEFwc1hpSGZIajdpT1hSdW5RNnVu?=
 =?utf-8?B?anIzdFk1aGhVcTJ3RkJWR2lkdFVmRExnQzJTbjMwNXQ4Rmc4dGtaZXNiUDhJ?=
 =?utf-8?B?QWZZenVZcXdnOEp1SnFmT2pRd252TEdvS1ZqMVlKcWQrNVo5OTdCb2JHVW9D?=
 =?utf-8?B?bFRHMkM4RXI3d1BCUVlWbnpYelNsSnpYL0ZLYzhJMHpBczhYUHJNUWM0RCtO?=
 =?utf-8?B?djh3UlQ4eWRTTy9OV1FHQlFvWEpSYXQ5RFF2VGxtMU8raC9tVUxsTmw0eGtN?=
 =?utf-8?B?ekE4K3NuNkJQbm9iMnpZMHlxeE45dzVIZlpWeUpYcm1SZVgxcFZsd2ZQS1l6?=
 =?utf-8?B?Q2lrMExrNHU0N2ZaaDFVTjhkZE1RdVFJRmprd1Bxdi9FM25VaHI0aTBvQjdD?=
 =?utf-8?B?T2g3MVhRQUFQbDRaTkpBdjdaaElwV0ZqbjlrQnUwVHkxUEVNazhVNnVBQ3JX?=
 =?utf-8?B?NGpXb0UzYnR1NnhYQ3FyZzhPVFAxMllkaS9Yd2VENDZ4Kzgwb3NZUUk5VmNE?=
 =?utf-8?B?dkozZ2p6S1lOWTdGQytXWXF5VGMzdXlFOUFYYXh3ZVp4UHFqbks4Mk45WUp1?=
 =?utf-8?B?QUJya2hFUGxubW9RVlZncFVDT25qVWloWnJwZlZ1MUMyVFByMXZ1VnJONGd3?=
 =?utf-8?B?M0FCeWJFV0h4TFE0dUlwR3BXalErVHVOQVg4S2ZLMjhOblA1VlIzMnprUzR5?=
 =?utf-8?B?cS9HY1h4UEx0ZkphQnBqc0EydVV2RmVJcWFtUTk2d3R2S0g1NHRrektLKyt0?=
 =?utf-8?B?QlBQcm9qa2J6cVlYeFo2OHdyV2pSTGtWK3dlMXBGaUVGc0lIeVBPUy9URVhW?=
 =?utf-8?B?K3p0Zy9GSjBpUWNza0pkcHo1bFd1TUljazVEUjhSa2R2NnpLeVpvWHVuTVhI?=
 =?utf-8?B?d0lDTkZZRTJDL3pNTlhiZmlwNXZuYU1URTN2UENWTXFOaTNOd0kzUW5mbFJQ?=
 =?utf-8?B?Njh5Q1Y0ZzE5ZGpQWXlEdEx3MkxKODU1Y0xpdTY1aVp4TzF2QmlUem5QaXJ5?=
 =?utf-8?B?cDk5QXo4ZHJFcXNLZ2xMTE55aDJkOG1KbkR0UT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB6626.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(42112799006)(366016)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WlErdnpBUzJZTzAxL1NKa1BWWm5FMUdCeEUzTmJxOFViSlk0SVFtS3FLVFJ6?=
 =?utf-8?B?S00rSzVtYkFKc3d4TlI5N2pqMGRObUJ0ZVcyMGFvYi9vekxPZkpMYTJDSWJO?=
 =?utf-8?B?YjZNWXZ5OXMzT3p0K3V4NEV3SWdwUFZ2WEtKOFE4cStKQmtLSm5Feko3SGZ0?=
 =?utf-8?B?UnA3bHdwTHlJR24wRTY0R1ZMNDFDd1M5OW1YMk9qOU1KQzlvdWVZNHlrbHpi?=
 =?utf-8?B?T0JEZVNUaHRjRnFZa09sVHFYMkN4UzM1SHUvd1hMQjVpaGYxTFlIWTRZa0lj?=
 =?utf-8?B?b25lWG1yaTZGV1pPbml4OTJDclNWalpsbkZzcSt4UmNldkxsZGpMRnVhMitC?=
 =?utf-8?B?R3RnazlWQmN0aUxSeFlVbGY4RWhxUmtHYjVtZFZ4Qk0rcWdVZDdiRTFqN3BD?=
 =?utf-8?B?MGVUS3RWSjhlejdPc0F3M0ZuU0pFYWNEWmN6L0pMcWJXTjIrTTVmV2ltc3Nw?=
 =?utf-8?B?QkU0MkJHd0RYcFVPUmc4U0tyNTNuTThQYTFkUnpIOGpOTmdUOWhscWd4RnVq?=
 =?utf-8?B?NnNHL2dQVGliQ0JHR1Jaem1JR1RIYTQwdWtEenhDR0RYWDNJb2VwazFOSUlm?=
 =?utf-8?B?dFdycWpRMS8wcXNlMlhZUHZnUitGc0UvdWNrbGlrRFkxUCtYdWFPVHlpcVpq?=
 =?utf-8?B?T2xkR2QxQTdhODBNSVNwaUZxb3Z4ZUxkQjgySDUxK01LcGs1Y1c0cUpUcUtZ?=
 =?utf-8?B?MkM2Z0VBc2J5VFhORnVyMnZrblFKU29ra2hPKzVVTnNIWlFDdnlLSExPREcx?=
 =?utf-8?B?MnZhVnZpeWVldWoxR3orem5WSnVtRWdTYm5UMnVHaldlZUhjVHJLVGZZR0tj?=
 =?utf-8?B?SEV2eWRmaTFNRnhXSENuZVRNMFF3cmIyelNBbWM3UlRzTysxcXQ3RU1lWHpY?=
 =?utf-8?B?SGlUZ05HbnhjOXJqc3k1Y2dJMnljQ1BKWlhQZ1ZLNXN2MlBnVm4xVWt2eUNq?=
 =?utf-8?B?akNXQ3dwMlNQWXBCb1ArK09LK3MwWWp6T1hVa1B3NFNZQ2hqLytmNkE0VW9o?=
 =?utf-8?B?ckJ2TDhtWS9xNjcrZjdrK21rUERQN2JrbThaZDhTM0F2T2RkR2tjbDZiRytL?=
 =?utf-8?B?NU5Pd2VFR0JqNHM1YUVaTmUvbjEwTjhuM0QwYVFtOE9xOU1JczJ0a2taWTY0?=
 =?utf-8?B?am9zWk5lbHZ6UUNVUENNRTBTeTVIZThsT1lUZjBjZWdjbjRMa01mZzZtUmZQ?=
 =?utf-8?B?UWJkQ1RUTSt2WjVhUi9tWlRta0ZHNzg4R295K3JqaVRjeUU4bmtBNVVVRkxu?=
 =?utf-8?B?QWpPd1Vkby9KSUlHYzV4aXBtMkd1Qkh3ckMrbUNGblB3bE5HMkFhRVFHRERX?=
 =?utf-8?B?ZVFTak1VZ0dZamMxM1NUVlVIMlJwMkU2ME1zSXY3Z2laeVJaN1B1SHRySGQy?=
 =?utf-8?B?Y0lnckZBSHk2L0Z2TGlrRzA1N0psZTM2TXplMVV4UmJTK0VSMVJrZXk0czhx?=
 =?utf-8?B?S1RLVTIxNGtvREM2dUo3R0dLT2twTFQ4STVMNXFyWkFmZFBTSHVvbElmdTVh?=
 =?utf-8?B?eTVLT0tWMkRxajJzZkFnV0FqVVJhZWtydWtzNWtXRWg1dVFTQVhpOTBPK29h?=
 =?utf-8?B?Zno3cnpkNjN4THRzTDd1M2tyZHdFOWtrcnowYkxOcU5GU2x2aEhNdmlyci85?=
 =?utf-8?B?dXBMTkZQRVEvN1hTbkN0dkpWbEFiRnhkbkRCcG1zcFkwQWg2blBIV1lxSzZE?=
 =?utf-8?B?R2g3c09lTDZ0RmEzTGwyK3dOVHBJdCs5a1hyM2IrekxjVEhsVDM1bDFaMnVU?=
 =?utf-8?B?VTh4VWZOOHBxalVGMnVZaGk2SHNUamRUL0ZQTTBManQzNEFVbnNFQkI1NlpC?=
 =?utf-8?B?cTFJaFVFMFRTdjZXbEwzZUw5a0ZWWldhMGdrNHd0dE1Iay9Qemg4Q2lGSlBh?=
 =?utf-8?B?bXNrVnRTcVFFUXdQMm1oUzZ4Q2QrekY3SnpVUmFmamJCTlhQV1BhL3pzS2pL?=
 =?utf-8?B?VWxFYThLL2lMMVdWbnh5MzJXaWkvU21qbTdLelUzZkRMZU1mQ3F4MEdBZ1lH?=
 =?utf-8?B?SFRvMnE4LzFDemlROE1tZEVJR252UVEzb1pMNSsxMXQ5eTd0TUU5akxZYjE1?=
 =?utf-8?B?ajNwZTFQeHAyK3RoZmhLOXFFdjdTMnFUSlNDZzJJODBhSkJEaUhJZjM1SXUv?=
 =?utf-8?B?ZkV6enlmUDhadkc2VGEwWmZwMk4rOEdoZ0NMWTgvUVNPcU8rYVF4Y29tMXVi?=
 =?utf-8?B?WTVHaFFSRFZxWENEQ0ZpVHVkTDdHWTZGdHJIZlprc1I4Tlh1bVZwK05xRjFt?=
 =?utf-8?B?aU0weTd2WWlBYjRoTHBxOUdhY3NFdEsvQnRPU0l3bXMwR2ZFd2c2NGxMdzJa?=
 =?utf-8?B?dFZsVzlpbFphTEd1amhyMkdMMkdtbWxSMHBQbVdNV0hCNzJXSEF0dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E03624E8009E944693291302E71543C4@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6626.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b829bf2f-6f01-46be-2d4d-08de3dd2a53d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2025 01:13:25.7489
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7EX1JVlxxdYFqwFHDY5OvC3va//HyfnOCA0YmZEFViNo9aMFLByO0WCZ1RhW34njCHlQJnzo5o0cHE/SsSOnBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6770
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_171335_499916_3FF3B877 
X-CRM114-Status: GOOD (  22.67  )
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

T24gTW9uLCAyMDI1LTEyLTAxIGF0IDA2OjM5ICswMDAwLCBMSUFOS1VOIFlBTkcgKOadqOi/nuWd
pCkgd3JvdGU6DQo+IE9uIFdlZCwgMjAyNS0xMS0yNiBhdCAwMzoxMSArMDAwMCwgQ0sgSHUgKOiD
oeS/iuWFiSkgd3JvdGU6DQo+ID4gT24gTW9uLCAyMDI1LTExLTI0IGF0IDA5OjE0ICswMDAwLCBM
SUFOS1VOIFlBTkcgKOadqOi/nuWdpCkgd3JvdGU6DQo+ID4gPiBPbiBXZWQsIDIwMjUtMTEtMTkg
YXQgMDk6MTggKzAwMDAsIENLIEh1ICjog6Hkv4rlhYkpIHdyb3RlOg0KPiA+ID4gPiBPbiBUdWUs
IDIwMjUtMTEtMDQgYXQgMTY6NTUgKzA4MDAsIExpYW5rdW4gWWFuZyB3cm90ZToNCj4gPiA+ID4g
PiBCeSBhZGp1c3RpbmcgdGhlIG9yZGVyIG9mIGxpbmsgdHJhaW5pbmcgYW5kIHJlbG9jYXRpbmcg
aXQgdG8NCj4gPiA+ID4gPiBIUEQsDQo+ID4gPiA+ID4gbGluayB0cmFpbmluZyBjYW4gaWRlbnRp
ZnkgdGhlIHVzYWJpbGl0eSBvZiBlYWNoIGxhbmUgaW4gdGhlDQo+ID4gPiA+ID4gY3VycmVudCBs
aW5rLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IEl0IGFsc28gc3VwcG9ydHMgaGFuZGxpbmcgc2ln
bmFsIGluc3RhYmlsaXR5IGFuZCB3ZWFrbmVzcyBkdWUNCj4gPiA+ID4gPiB0bw0KPiA+ID4gPiA+
IGVudmlyb25tZW50YWwgaXNzdWVzLCBlbmFibGluZyB0aGUgYWNxdWlzaXRpb24gb2YgYSBzdGFi
bGUNCj4gPiA+ID4gPiBiYW5kd2lkdGgNCj4gPiA+ID4gPiBmb3IgdGhlIGN1cnJlbnQgbGluay4g
U3Vic2VxdWVudGx5LCBEUCB3b3JrIGNhbiBwcm9jZWVkIGJhc2VkDQo+ID4gPiA+ID4gb24NCj4g
PiA+ID4gPiB0aGUgYWN0dWFsIG1heGltdW0gYmFuZHdpZHRoLg0KPiA+ID4gPiA+IA0KPiA+ID4g
PiA+IEl0IHNob3VsZCB0cmFpbmluZyBpbiB0aGUgaHBkIGV2ZW50IHRocmVhZC4NCj4gPiA+ID4g
PiBDaGVjayB0aGUgbW9kZSB3aXRoIGxhbmUgY291bnQgYW5kIGxpbmsgcmF0ZSBvZiB0cmFpbmlu
Zy4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBJZiB3ZSdyZSBlRFAgYW5kIGNhcGFiaWxpdGllcyB3
ZXJlIGFscmVhZHkgcGFyc2VkIHdlIGNhbiBza2lwDQo+ID4gPiA+ID4gcmVhZGluZyBhZ2FpbiBi
ZWNhdXNlIGVEUCBwYW5lbHMgYXJlbid0IGhvdHBsdWdnYWJsZSBoZW5jZSB0aGUNCj4gPiA+ID4g
PiBjYXBzIGFuZCB0cmFpbmluZyBpbmZvcm1hdGlvbiB3b24ndCBldmVyIGNoYW5nZSBpbiBhIGJv
b3QgbGlmZQ0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFRoZXJlZm9yZSwgYnJpZGdlIHR5cGVjIGp1
ZGdtZW50IGlzIHJlcXVpcmVkIGZvciBlZHAgdHJhaW5pbmcNCj4gPiA+ID4gPiBpbg0KPiA+ID4g
PiA+IGF0b21pY19lbmFibGUgZnVuY3Rpb24uDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gVGhlIGBt
dGtfZHBfYXV4X3BhbmVsX3Bvd2Vyb25gIGZ1bmN0aW9uIGZhaWxzIHRvIGFsaWduLg0KPiA+ID4g
PiA+IFdpdGhpbiB0aGUgYG10a19kcF9ocGRfZXZlbnRfdGhyZWFkYCwgaWYgRFAgaXMgZGlzY29u
bmVjdGVkLA0KPiA+ID4gPiA+IHRoZSBgbXRrX2RwX2F1eF9wYW5lbF9wb3dlcm9uYCBmdW5jdGlv
biB3aWxsIHdyaXRlIGZyb20gYGF1eGANCj4gPiA+ID4gPiB0bw0KPiA+ID4gPiA+IGBEUFJYYCwN
Cj4gPiA+ID4gPiBjYXVzaW5nIGEgZmFpbHVyZSBhbmQgdGh1cyBwcmV2ZW50aW5nIHN5bW1ldHJ5
Lg0KPiA+ID4gPiANCj4gPiA+ID4gSSdtIGN1cmlvdXMgYWJvdXQgYW5vdGhlciBjYXNlLg0KPiA+
ID4gPiBJbiB5b3VyIGRlc2NyaXB0aW9uLCB3aGVuIERQIHBsdWcgb3V0IGFuZCBwbHVnIGluLCBE
Uk0gY29yZSB3b3VsZA0KPiA+ID4gPiBub3QNCj4gPiA+ID4gY2FsbCBtdGtfZHBfYnJpZGdlX2F0
b21pY19lbmFibGUoKSwgcmlnaHQ/DQo+ID4gPiA+IElmIHNvLCB3aGVuIEkgcGx1ZyBvdXQgRFAs
IGFuZCBwbHVnIGluIGFub3RoZXIgRFAgcGFuZWwgd2hpY2gNCj4gPiA+ID4gc3VwcG9ydA0KPiA+
ID4gPiBzbWFsbGVyIHJlc29sdXRpb24sDQo+ID4gPiA+IHRoZW4gbXRrX2RwX2JyaWRnZV9hdG9t
aWNfZW5hYmxlKCkgaXMgbm90IGNhbGxlZCBhbmQgYmVsb3cgY2FsbA0KPiA+ID4gPiBzZXF1ZW5j
ZSB3b3VsZCBub3QgaGFwcGVuOg0KPiA+ID4gPiANCj4gPiA+ID4gbXRrX2RwX2JyaWRnZV9hdG9t
aWNfZW5hYmxlKCkgLT4gbXRrX2RwX3ZpZGVvX2VuYWJsZSgpIC0+DQo+ID4gPiA+IG10a19kcF9z
ZXRfdHhfb3V0KCkgLT4gbXRrX2RwX3NldHVwX3R1KCkNCj4gPiA+ID4gDQo+ID4gPiA+IEluIG10
a19kcF9zZXR1cF90dSwgaXQgd291bGQgc2V0IHNyYW1fcmVhZF9zdGFydCBhY2NvcmRpbmcgdG8N
Cj4gPiA+ID4gbGFuZV9jb3VudC4NCj4gPiA+ID4gQnV0IHRoZSBjYWxsIHNlcXVlbmNlIHdvdWxk
IG5vdCBoYXBwZW4gd2hlbiBuZXcgcGx1ZyBpbiwgdGhlDQo+ID4gPiA+IHNyYW1fcmVhZF9zdGFy
dCB3b3VsZCBiZSBvbGQgdmFsdWUgd2hpY2ggbWF5IGluY29ycmVjdC4NCj4gPiA+ID4gSWYgdGhp
bmsgdGhhdCB3aGVuIHBsdWcgaW4gYW5kIHBsdWcgb3V0LCBpdCBzaG91bGQgZGlzYWJsZSBEUCBh
bmQNCj4gPiA+ID4gdGhlbiBlbmFibGUgRFAgYWdhaW4uDQo+ID4gPiA+IElmIERSTSBjb3JlIGRv
ZXMgbm90IGRvIHRoaXMsIEkgdGhpbmsgd2Ugc2hvdWxkIG1vZGlmeSBEUk0gY29yZQ0KPiA+ID4g
PiBvcg0KPiA+ID4gPiB5b3Ugc2hvdWxkIHJlY29uZmlnIHRoZSB3aG9sZSBEUCB3aGVuIHBsdWcg
aW4sIG5vdCBvbmx5IHRyYWluaW5nLg0KPiA+ID4gPiANCj4gPiA+ID4gUmVnYXJkcywNCj4gPiA+
ID4gQ0sNCj4gPiA+ID4gDQo+ID4gPiANCj4gPiA+IEhpIENLDQo+ID4gPiANCj4gPiA+IFdoZW4g
RFAgcGx1ZyBvdXQsIERSTSBjb3JlIHdpbGwgY2FsbA0KPiA+ID4gbXRrX2RwX2JyaWRnZV9hdG9t
aWNfZGlzYWJsZSgpLg0KPiA+ID4gV2hlbiBEUCBwbHVnIGluLCBEUk0gY29yZSB3aWxsIGNhbGwg
bXRrX2RwX2JyaWRnZV9hdG9taWNfZW5hYmxlKCkuDQo+ID4gDQo+ID4gDQo+ID4gV2hlbiBEUCBw
bHVnIGluLCBEUk0gY29yZSB3aWxsIGNhbGwgbXRrX2RwX2JyaWRnZV9hdG9taWNfZW5hYmxlKCks
DQo+ID4gYW5kIG10a19kcF9icmlkZ2VfYXRvbWljX2VuYWJsZSB3b3VsZCBjYWxsIG10a19kcF90
cmFpbmluZygpLg0KPiA+IFNvIGl0J3Mgbm90IG5lY2Vzc2FyeSB0byBjYWxsIG10a19kcF90cmFp
bmluZygpIGluDQo+ID4gbXRrX2RwX2hwZF9ldmVudF90aHJlYWQoKS4NCj4gPiANCj4gPiBSZWdh
cmRzLA0KPiA+IENLDQo+ID4gDQo+IA0KPiBIaSBDSy4NCj4gDQo+IFRoaXMgc2hvd3MgdGhlIGN1
cnJlbnQgdGltaW5ncyBhZnRlciB0aGUgRFAgY2FibGUgaXMgcGx1Z2dlZCBpbiwNCj4gYXMgd2Vs
bCBhcyB0aGUgbW9kaWZpZWQgdGltaW5ncy4NCj4gDQo+IGN1cnJlbnQgdGltaW5nczoJCUZpeCB0
aW1pbmdzOg0KPiANCj4gbXRrX2RwX2hwZF9ldmVudF90aHJlYWQoKQltdGtfZHBfaHBkX2V2ZW50
X3RocmVhZCgpDQo+IAkJCQkoaW5jbHVkaW5nIERQIGxpbmsgdHJhaW5pbmcpIA0KPiAJfAkJCQl8
DQo+ICAgICAgICAuLi4JCQkgICAgICAgLi4uDQo+IG10a19kcF9icmlkZ2VfbW9kZV92YWxpZCgp
CW10a19kcF9icmlkZ2VfbW9kZV92YWxpZCgpDQo+IAl8DQo+ICAgICAgICAuLi4JCQkgICAgICAg
Li4uDQo+IG10a19kcF9icmlkZ2VfYXRvbWljX2NoZWNrKCkJbXRrX2RwX2JyaWRnZV9hdG9taWNf
Y2hlY2soKQ0KPiAJfA0KPiAgICAgICAgLi4uCQkJICAgICAgIC4uLg0KPiBtdGtfZHBfYnJpZGdl
X2F0b21pY19lbmFibGUoKQltdGtfZHBfYnJpZGdlX2F0b21pY19lbmFibGUoKQ0KPiAoaW5jbHVk
aW5nIERQIGxpbmsgdHJhaW5pbmcpDQo+IA0KPiANCj4gUFM6DQo+IDEuICIuLi4iIHJlcHJlc2Vu
dHMgb21taXRlZCBzdGVwczsNCj4gDQo+IDIuIGBtdGtfZHBfYnJpZGdlX21vZGVfdmFsaWQoKWAg
Y2FsY3VsYXRlcyB0aGUgYmFuZHdpZHRoIHVzaW5nIHRoZQ0KPiBjdXJyZW50IGxhbmUgY291bnQg
YW5kIGxpbmsgcmF0ZSwgYW5kIHRoZW4gZmlsdGVycyBlYWNoIG1vZGUgdG8NCj4gZGV0ZXJtaW5l
IGlmIGl0IHN1cHBvcnRzIHJldHVybmluZyBhIHN0YXR1cy4NCj4gDQo+IDMuIEluIHRoZSBgZHJt
X2Rpc3BsYXlfbW9kZV90b192aWRlb21vZGUoJmNydGNfc3RhdGUtPmFkanVzdGVkX21vZGUsDQo+
ICZtdGtfZHAtPmluZm8udm0pO2AgZnVuY3Rpb24sIHdpdGhpbiB0aGUgYG10a19kcF9icmlkZ2Vf
YXRvbWljX2NoZWNrKClgDQo+IGZ1bmN0aW9uLCBgYWRqdXN0ZWRfbW9kZWAgc2V0cyB0aGUgY3Vy
cmVudGx5IHNlbGVjdGVkIGRpc3BsYXkgbW9kZSBmb3INCj4gdGhlIERSTS4NCj4gDQo+IDQuIERQ
IGxpbmsgdHJhaW5pbmcgdGVzdHMgdGhlIHNpZ25hbCBjb25kaXRpb25zIG9mIHRoZSBsaW5rIGJl
dHdlZW4NCj4gRFBUWCBhbmQgRFBSWCwgYW5kIHNlbGVjdHMgdGhlIGxhbmUgY291bnQgYW5kIGxp
bmsgcmF0ZSB0aGF0IG1lZXQNCj4gdGhlIHNpZ25hbCBjb25kaXRpb25zLg0KPiANCj4gNS4gRm9y
IGV4YW1wbGUsIHRoZSBwbGF0Zm9ybSBzdXBwb3J0IERQIDRsYW5lIDUuNEcsDQo+IGJ1dCBwYW5l
bCBBIHN1cHBvcnQgRFAgMmxhbmUgNS40Ry4NCj4gDQo+ICAgIFRoaXMgaXMgYSB0aW1lIHNlcXVl
bmNlOg0KPiANCj4gICAgYSkuUGx1ZyBpbiBwYW5lbCBBLiBBY2NvcmRpbmcgdG8gdGhlIHBsYXRm
b3JtLCBpdCBjYW4gb3V0cHV0IDRLDQo+ICAgIDYwSHouDQo+ICAgIGIpLiBUaW1pbmcgbW9kZSBz
ZXQgNEsgNjBIeihJbmNsdWRpbmcgaW4gbXRrX2RwX2JyaWRnZV9hdG9taWNfY2hlY2sNCj4gICAg
ZnVuY3Rpb24pLg0KPiAgICBjKS4gQXRvbWljIGVuYWJsZShCYXNlZCBvbiBwYW5lbCBBIGFiaWxp
dHksIHRyYWluaW5nIHBhc3MgMmxhbmUNCj4gICAgNS40RykuDQo+ICAgIGQpLiBGaW5hbGx5LCBk
dWUgdG8gMmxhbmUgNS40RyBiYW5kd2lkdGggbGltaXRhdGlvbiwgdGhlIHBsYXRmb3JtDQo+ICAg
IGNhbm5vdCBvdXRwdXQgNEsgNjBIeiwgcmVzdWx0aW5nIGluIGEgYmxhY2sgc3JlZW4uDQo+IA0K
PiAgICBJZiBhcHBseSB0aGlzIHBhdGNoLg0KPiANCj4gICAgYSkuIFBsdWcgaW4gcGFuZWwgQS4N
Cj4gICAgYikuIFRyYWluaW5nIHBhc3MgMmxhbmUgNS40Rw0KPiAgICBjKS4gVGltaW5nIG1vZGUg
c2V0IDJLIDYwSHooQmFzZWQgb24gdGhlIDJsYW5lIDUuNEcgYmFuZHdpZHRoIGxpbWl0DQo+ICAg
IGFuZCBpbmNsdWRpbmcgaW4gbXRrX2RwX2JyaWRnZV9hdG9taWNfY2hlY2sgZnVuY3Rpb24pLg0K
PiAgICBkKS4gQXRvbWljIGVuYWJsZSBmb3Igb3V0cHV0IHNjcmVlbi4NCg0KVGhlIG9yaWdpbmFs
IHRpdGxlIGRvZXMgbm90IHNob3cgZXhhY3RseSB3aGF0IHRoaXMgcGF0Y2ggZG8uDQpUaGlzIHBh
dGNoIGRvZXMgbm90IG9ubHkgYWRqdXN0IGJhbmR3aWR0aCBsaW1pdCwgaXQgYWxzbyBmaXggc29t
ZSBidWdzLg0KSSBwcmVmZXIgdGhlIHRpdGxlIHRvIGJlICJNb3ZlIERQIHRyYWluaW5nIHRvIGhv
dHBsdWcgdGhyZWFkIg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiANCj4gQmVzdCBSZWdhcmRzDQo+IExp
YW5rdW4uDQo+IA0KPiA+ID4gDQo+ID4gPiBJZiBEUCBwbHVnIGluLCBzcmFtX3JlYWRfc3RhcnQg
d2lsbCBiZSByZWNhbGN1bGF0ZSBiYXNlZCBvbiB0aGUNCj4gPiA+IGxhbmUNCj4gPiA+IGNvdW50
Lg0KPiA+ID4gDQo+ID4gPiBSZWdhcmRzDQo+ID4gPiBMaWFua3VuLg0KPiA+ID4gDQo+ID4gPiA+
IA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IExpYW5rdW4gWWFuZyA8bGlh
bmt1bi55YW5nQG1lZGlhdGVrLmNvbT4NCj4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiAtLS0NCj4g
PiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcC5jIHwgMjAgKysrKysrKysr
KysrKysrKysrKysNCj4gPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKykN
Cj4gPiA+ID4gPiANCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcC5jDQo+ID4gPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rw
LmMNCj4gPiA+ID4gPiBpbmRleCBiZWY2ZWViMzBkM2UuLjBiYTJjMjA4ODExYyAxMDA2NDQNCj4g
PiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwLmMNCj4gPiA+ID4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwLmMNCj4gPiA+ID4gPiBAQCAt
MTk3Niw2ICsxOTc2LDcgQEAgc3RhdGljIGlycXJldHVybl90DQo+ID4gPiA+ID4gbXRrX2RwX2hw
ZF9ldmVudF90aHJlYWQoaW50IGhwZCwgdm9pZCAqZGV2KQ0KPiA+ID4gPiA+ICAJc3RydWN0IG10
a19kcCAqbXRrX2RwID0gZGV2Ow0KPiA+ID4gPiA+ICAJdW5zaWduZWQgbG9uZyBmbGFnczsNCj4g
PiA+ID4gPiAgCXUzMiBzdGF0dXM7DQo+ID4gPiA+ID4gKwlpbnQgcmV0Ow0KPiA+ID4gPiA+ICAN
Cj4gPiA+ID4gPiAgCWlmIChtdGtfZHAtPm5lZWRfZGVib3VuY2UgJiYgbXRrX2RwLQ0KPiA+ID4g
PiA+ID4gdHJhaW5faW5mby5jYWJsZV9wbHVnZ2VkX2luKQ0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+
ICAJCW1zbGVlcCgxMDApOw0KPiA+ID4gPiA+IEBAIC0xOTk0LDkgKzE5OTUsMjggQEAgc3RhdGlj
IGlycXJldHVybl90DQo+ID4gPiA+ID4gbXRrX2RwX2hwZF9ldmVudF90aHJlYWQoaW50IGhwZCwg
dm9pZCAqZGV2KQ0KPiA+ID4gPiA+ICAJCQltZW1zZXQoJm10a19kcC0+aW5mby5hdWRpb19jdXJf
Y2ZnLCAwLA0KPiA+ID4gPiA+ICAJCQkgICAgICAgc2l6ZW9mKG10a19kcC0NCj4gPiA+ID4gPiA+
IGluZm8uYXVkaW9fY3VyX2NmZykpOw0KPiA+ID4gPiA+ICANCj4gPiA+ID4gPiArCQkJbXRrX2Rw
LT5lbmFibGVkID0gZmFsc2U7DQo+ID4gPiA+ID4gKwkJCS8qIHBvd2VyIG9mZiBhdXggKi8NCj4g
PiA+ID4gPiArCQkJbXRrX2RwX3VwZGF0ZV9iaXRzKG10a19kcCwNCj4gPiA+ID4gPiBNVEtfRFBf
VE9QX1BXUl9TVEFURSwNCj4gPiA+ID4gPiArCQkJCQkgICBEUF9QV1JfU1RBVEVfQkFOREdBUA0K
PiA+ID4gPiA+IF9UUExMLA0KPiA+ID4gPiA+ICsJCQkJCSAgIERQX1BXUl9TVEFURV9NQVNLKTsN
Cj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gIAkJCW10a19kcC0+bmVlZF9kZWJvdW5jZSA9IGZhbHNl
Ow0KPiA+ID4gPiA+ICAJCQltb2RfdGltZXIoJm10a19kcC0+ZGVib3VuY2VfdGltZXIsDQo+ID4g
PiA+ID4gIAkJCQkgIGppZmZpZXMgKw0KPiA+ID4gPiA+IG1zZWNzX3RvX2ppZmZpZXMoMTAwKSAt
IDEpOw0KPiA+ID4gPiA+ICsJCX0gZWxzZSB7DQo+ID4gPiA+ID4gKwkJCW10a19kcF9hdXhfcGFu
ZWxfcG93ZXJvbihtdGtfZHAsIHRydWUpOw0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArCQkJcmV0
ID0NCj4gPiA+ID4gPiBtdGtfZHBfcGFyc2VfY2FwYWJpbGl0aWVzKG10a19kcCk7DQo+ID4gPiA+
ID4gKwkJCWlmIChyZXQpDQo+ID4gPiA+ID4gKwkJCQlkcm1fZXJyKG10a19kcC0+ZHJtX2Rldiwg
IkNhbid0DQo+ID4gPiA+ID4gcGFyc2UNCj4gPiA+ID4gPiBjYXBhYmlsaXRpZXNcbiIpOw0KPiA+
ID4gPiA+ICsNCj4gPiA+ID4gPiArCQkJLyogVHJhaW5pbmcgKi8NCj4gPiA+ID4gPiArCQkJcmV0
ID0gbXRrX2RwX3RyYWluaW5nKG10a19kcCk7DQo+ID4gPiA+ID4gKwkJCWlmIChyZXQpDQo+ID4g
PiA+ID4gKwkJCQlkcm1fZXJyKG10a19kcC0+ZHJtX2RldiwNCj4gPiA+ID4gPiAiVHJhaW5pbmcN
Cj4gPiA+ID4gPiBmYWlsZWQsICVkXG4iLCByZXQpOw0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiAr
CQkJbXRrX2RwLT5lbmFibGVkID0gdHJ1ZTsNCj4gPiA+ID4gPiAgCQl9DQo+ID4gPiA+ID4gIAl9
DQo+ID4gPiA+ID4gIA0KPiA+ID4gPiANCj4gPiA+ID4gDQo+ID4gDQo+ID4gDQoNCg==

