Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58EEDE7718A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 07:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LNdYNZX9BYmZuo5jqyC+wb7BoqPGjl6KiYfHFw/JYa8=; b=kA+P73Sc2bNVtWIHyWoWPCO2IW
	BC2s6lmwGXBJdcQGqpu9Tnfc7CEIrrA6ZNKBdFn9iQ9+8m3tjxp3PobCwgwrGlLzs9YGtRGGI3vNL
	Lt5ZjXGrXAG1X4YO6HR6ymREqVmz5EVX76X1Le2+WWKb8FeYOwA9X07Ckib3QZiXNP7jNJ/OOVPd5
	KvQpL/oWq9LnUMXYlq5JhoXl+GByRtfQej00r8mXrpjtRBbEdvOxauhzqqL7cUtn9GiO7GlmFX/Q0
	o0bz3RRZo8AXn1fCK2vJCyDtckdgUBUEmKC/ioMJ54+GypJx6dXaI8wvonuiRIVn9rpX9OrYTPAn9
	kmNn8zwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOXVd-00000004BFc-2fUx;
	Fri, 20 Dec 2024 07:33:17 +0000
Received: from [216.200.240.185] (helo=mailgw02.mediatek.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOXOW-00000004AJc-0yac;
	Fri, 20 Dec 2024 07:26:05 +0000
X-UUID: a1d68b8abea311ef9048ed6ed365623b-20241220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=LNdYNZX9BYmZuo5jqyC+wb7BoqPGjl6KiYfHFw/JYa8=;
	b=dfgNO3aLZcBJhMa5ChNTixDWjTsgtMeSyZpiWqmwVSrywX/95/NsPT6ExyYVzM+298Cmi9u/aJz+Fdzj4bbBBbMjzdyyQj+6bi0B0sGeoxGqeQ0oAeP/wawZhZdNEopO2FCY241N8oWCx116szOd1qgfLnZ0cHkAt3ZBTOtRrKo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:fb64f9bb-1738-4cf7-855e-c08409c66f12,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:0a019818-ec44-4348-86ee-ebcff634972b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: a1d68b8abea311ef9048ed6ed365623b-20241220
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 297831892; Fri, 20 Dec 2024 00:25:47 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 20 Dec 2024 15:25:44 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 20 Dec 2024 15:25:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TgiUiNVGhFjGwQz6ApUz/mKuqMU9GVUCIrQdwbKlvR6N3RkVC7oqHKvshiTPMxXPK1lvxdFvJTc5IBh593yr6X1rsOkgoi8XLdlkVI3lI74J3xEGvl9/Y49E/p4X/fbjrm8Lv9mBadoAeJ1OlmiOECr4kBvoFdjm8nY01HOcCYR1WHtPriyNXvEDhvZCLSnudDJLh+Ch1ag0N2MXqEh661elkC07jJ/Y0SL6IQZOAh/GrUsJQP1ccyEgrR7+m3XCGqU+k1N7n3ewIl4vpbe4dBx15AeK5nWYofIS4VpUGiJO6Z9bgF5ELaDW7hbBoHEM5RzPdp2Um3dEOALr62etFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNdYNZX9BYmZuo5jqyC+wb7BoqPGjl6KiYfHFw/JYa8=;
 b=rZgpy0Ugbtx8nZDCl5S4N7qD4eBjNWcjDvRtb1EM9l8is+3gmIH7TznnbwDB3KrihadFPwHemy0drl/pGuS4rbmKUqvTNfhm1wDNlgHtmuRJTjx+byLB5eZUNpkFJb4W1Jxfgyfbgvcmr4Y+ocWMgQWKQjmPogQi58lv/vYqvcbmyI7FeTneCYkJOYtA3/ws/9P2Ke9QIPKGQKVyKNYNAeXD9JHI4+9wjT6octP1bLbC0pF1j5lLnwhEomnumJPTIikACjFCY5buDPDR+5Fe6ysvFxpxAWGL83ca834bzrWwL55cLVcDzNU6eTdI10281OrvRqLB+v63mkTyd2/JYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNdYNZX9BYmZuo5jqyC+wb7BoqPGjl6KiYfHFw/JYa8=;
 b=JRqjfDbh1vtdqih1DiyAZYjTabYYAuMHzgqhZY6xKj7LG8JX+AJLRe0rZ254+Y0LCngIm+FaHkZyd/9ki3/XhvV2oBTActETS9ruHJKqp8sNf3q75+Ts3FcrGLNEP4cYCTPuPkZ3KrCBrIEbLWxS7ZblWFm/wp9o43ZbONseUgc=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB6527.apcprd03.prod.outlook.com (2603:1096:400:1f8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Fri, 20 Dec
 2024 07:25:42 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8251.015; Fri, 20 Dec 2024
 07:25:41 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "jie.qiu@mediatek.com"
	<jie.qiu@mediatek.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
	<mripard@kernel.org>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
	<jitao.shi@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "maarten.lankhorst@linux.intel.com"
	<maarten.lankhorst@linux.intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "kernel@collabora.com" <kernel@collabora.com>,
	"dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "junzhi.zhao@mediatek.com"
	<junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v3 21/33] drm/mediatek: mtk_hdmi: Remove unused members of
 struct mtk_hdmi
Thread-Topic: [PATCH v3 21/33] drm/mediatek: mtk_hdmi: Remove unused members
 of struct mtk_hdmi
Thread-Index: AQHbUJqyhqmN0hUHzEG8Yx2uszSS3bLuv4gA
Date: Fri, 20 Dec 2024 07:25:41 +0000
Message-ID: <8531b18b1e98156e315e3a20506c3e9f274712fe.camel@mediatek.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
	 <20241217154345.276919-22-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241217154345.276919-22-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB6527:EE_
x-ms-office365-filtering-correlation-id: 2b612f54-5859-4a0c-62b9-08dd20c7822a
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?S00zS005WDlzcFhaVEhKWlBQbEU0ZXo3ZDJYeHZOVEpUVE16THpVWUZWcWl4?=
 =?utf-8?B?NUZIdUZCS21Zdm5ZdTFUeXNEQTlKbXY0SGZ4SkY3dlN0K1JSRDFmNFkySjAx?=
 =?utf-8?B?cVBVNDJpanB0ZWZIdllYRWtia2hnTVoyaWpodXoyL21qbXlIQlZqU25hMVNL?=
 =?utf-8?B?WnBFREFic1FXY3JnV09iNlRwbDYxSzQ5cDFxSWtXVTNMcVpoMHY3OWJPVnZ1?=
 =?utf-8?B?b2lGaTdDczBvck0zbUcxajd3cXZqY3ZPUG1BRG1rRVFWRFBCNGRtYXhiSURi?=
 =?utf-8?B?elV5Z3B2SUxpYnJaeFdhQ3ZIUC9rb01tQ2tHWVRxNFFydjk3VUZseldEb0Rr?=
 =?utf-8?B?KzNQRFNJL0NpV1AxelpHb3VIdWJGYWhMWTVqaTRIZXR1U1ZoYzYyL29ha0l5?=
 =?utf-8?B?NU9FRXduRWdSUnFtaThPZWs0WXZTM3F4WitEeEtSdjN4d1dIUWpJS1RpQVF3?=
 =?utf-8?B?MWFqMVpmMzl1YUVRTHNoMmQ1R3U3bHNEclFhZS9zQ1BPeFhYTU9ubm1MRzQ3?=
 =?utf-8?B?WExLdTVtTDhnNW16ZDVBMjk4L2c1ZVgvQU5GYlErS2ZKcXE0d3Fhb3pxeHJW?=
 =?utf-8?B?cEdGTjRraW5wRTVUSTdnR1ZINmFZYTJSVlNISWpRbGl0SVV2aFJ2U3JoZzVY?=
 =?utf-8?B?VEhESjVjcWZkdlYzd3dDc3lVMFRqbFozVFd0NmZqczVvOE9GNkhhaHFlMzYw?=
 =?utf-8?B?QlJMYW1JK0VVUUtTdCsxaitQUWdaSGljam80WXFIRDVpcU84OTVPaWNFKzR3?=
 =?utf-8?B?emMrZzVVbk85a2RBbUkyYzJIQ3RYSmlObHpzQlpJUXoxTzFnZ01xMWp1OE5X?=
 =?utf-8?B?djg3R09KY2Y3NVRiem83OFA3T01qYzRSSnpMYkNCdXJLcjNTNEt3ZmNqVENv?=
 =?utf-8?B?R1JjNG00SWlkVldUVXpSUysxRHdYeTFnaFJORXdhdXNHK3Yxa0NzOGFxaXBz?=
 =?utf-8?B?SVkyVXJnQzdqb3N5YXVPKzQzc1kyUXZ3VjkwSUZxRVZqTlF3c2FpSGlBcVdr?=
 =?utf-8?B?VHRCR0ZEdmZwMkVvQjYwZ0p6Umx2c1VrNkdBVmdrSnRHdm9YRWdhTmx1dFZR?=
 =?utf-8?B?alYxbXBHNnNEcDRBeTQ1aWtNUVlEQ0JCbVMyYUNCUThoN2FEcDV3ZVowVTlk?=
 =?utf-8?B?NGtwa0t0SDBCT25HUWxQN2VZMlhWbTlsaXpKQ1Q4amhPRmJoeW5aNDM1RHlj?=
 =?utf-8?B?YXRYNUZaVmF0M1RkN0lPY2tENUlmUHNidjdFUlJzVWp6M1kwZkp4UFBuU2pq?=
 =?utf-8?B?NTAvRWRQUmtHOUg1TWhmMlhEZTJ2ZUhiZXVneVRteDJRN2VDV2xDS000RGFQ?=
 =?utf-8?B?UmxFTzN4VlFacGU2UEpTaXdGWnZJUjBpQmJkY05CNTJ2b2ZlWTJFbVNPd1BP?=
 =?utf-8?B?WVkya1dJSnA5SDZSS25QbHhmdkdvZStTSUZSSkc2QU9PUFV0bFZ3aVlKcEtT?=
 =?utf-8?B?dys5VzhRR1hGMWlWdGp2QnhqSTgxUVUxdkIxeW9STEQwTlFQMTgraU5aUVJ4?=
 =?utf-8?B?Ykp6TzEydzE3NWlQeDduM0RxVFl3WkJsQmdzS01MVE1XVUlsSzBiNWdZN3R2?=
 =?utf-8?B?WHVtdCtVWEtXKzdMZVg2VmJiOUJmbXNDL3ZNN09Ba00vYUhQRVg5c3NHZUVx?=
 =?utf-8?B?UVNDdi85U1cyS2lVS0pYUVdub0VuRHlVZkQ3R1ZBbk5ZU3BJeDJBbCtvSGVB?=
 =?utf-8?B?OVB6bmJ2aHJqS1cwbThwa0lDQVYrZGxJSkZrRVFFeWdzb1hkbVY2YW94TW5C?=
 =?utf-8?B?aDdTNGtLM3R4TkpUcVhpazBOKy9pUCtPejc5UFRLZjcxMVg1UWVDMmpZNUdz?=
 =?utf-8?B?U2xlMEFZZlFsUVFOY2NSNmtxRjVhRVM0M1V4N2FWKzVsQ3EzQ2lnRlJ4bVZR?=
 =?utf-8?B?cElzMEtzQTJZVGpwd2Z5bnVoUHQwQjNtT3MzNTVPYWYwdkY5ZFU0Q0R3WEp6?=
 =?utf-8?Q?zypmmeQrKhF/sGcGTqHiA1lnhFzyV5wE?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MkY3bmpoODZWemVjcGluODJlN0ZWMk9tQlF1S0l4SEpPcXN3ZjhDeEl1NHV3?=
 =?utf-8?B?YVVHUVoxUjJEZUNQeEVMTFJrSTgvRGRWaFJwYTI4Vldsb05tMHp5czBFZmc2?=
 =?utf-8?B?RC9hYW1sQUN6dWEzbmNoZ294RDhOV1lldzA0cjJQbGNWNHlhTUp0SlRBR0Va?=
 =?utf-8?B?dkdTbXZYSDQ5enA0cm5rTWZuQnpTSEJIR3pJbjRpWFFHei83aWQ0c1FLRzNC?=
 =?utf-8?B?ZWxoMHNzUjMyWnh3RDdTWkh6NUpxQ0ZPcktsTHNKZ0YxUjJwUUxML0JWTGRT?=
 =?utf-8?B?Sys0Uy9qSU5WZjdyWmozQmVMR1hLWEQzVFdEODNNcDQ4aDcyeTlZTS9jalJO?=
 =?utf-8?B?K3IzSng1ZVFwZkt2U2JoREdRNC9hYXE5MkpybWQwT2h6VUFoRmpubFprd2ds?=
 =?utf-8?B?VDhXZGV4V3BDUW1MTG5KL0hEYS9YL3ZqTWplSE9WbTF2SHJyZm10WkpmNXR4?=
 =?utf-8?B?Zlc0amluK0dSSFZQTjNNMXV0TXFxZ0JkNDRkUEhoNWgxeFNRb2FJUFpBL0pz?=
 =?utf-8?B?blhLa2gzbmF6ZUp4V2NNaDlLb1dLY2tDOXJCN25YK2o0azJxWUNUOFNKcFgv?=
 =?utf-8?B?OFVyTjEveDdUSk9rZFJpZjQ3N1ppaTRzTlZvYWYrcVZoNndrR0dzaWMxMjhW?=
 =?utf-8?B?UnhXbFlGNStML29OdUxvVStSaTdOWjRGY0xWcXRjL0U1ZytaWnFHaGk1Y1JQ?=
 =?utf-8?B?TXM4K1RPMVVZdGRRZzJZSE9kRkU5ZzdOMks2Yld3bUp1cEJ2Zk1QK0c2anpv?=
 =?utf-8?B?N0RPQ0x6UXgwTGdrMEFjUkxSN1ROVEdUMUxTWm5za0FUN2tmS0swc2JMR0oy?=
 =?utf-8?B?SlNOVkhSOFZsTzdhbThqOERmVU9XYSs3Y1FycllHNFFPaVN1L0xScUt3Qmph?=
 =?utf-8?B?MVplUitZTTI2WUc4TUc2T0lKRUN2clkxM2pqS3VCK2drNmF6MUE4N0h6c1lM?=
 =?utf-8?B?OVF3VE9ScGdTcVZEUG8zNEZCVFM3MnpRRjdwODVpMnBPWGRwUXVwZWtyVW1L?=
 =?utf-8?B?ZGQ3RXh6MlV4Q1FKdlF2U1pHdEU2WHR0RjlTZ2Z6OHhxSnFSQnRMTk41d1dZ?=
 =?utf-8?B?aEovSWl0aDZta3RrSGdMTXB3TC9QdWlLdzdXV0RUTmpSWGFsbDZycC93WDFH?=
 =?utf-8?B?R1h4RytIdmo2aHM1cnl1aFA0MERpZTlUQ1o3MUcwTGMxZC9Ca2Y3akdaeDg0?=
 =?utf-8?B?NVVzdkl0WUN0S0dNTnNZVWdONVZGUFk5c3l6VS9OVjlwTlFmTU1VQVZweUkr?=
 =?utf-8?B?bG1sVjFHMjh5OWFoai9iTWhuZ1dTMTd2UXpmaWhUckJWd21BRVJnUVBpZENL?=
 =?utf-8?B?U3hmajRkQm5NZ053akFpQnFMZTVEeGV2bS9PbzBQV3NIWW5sYjVkUlFiN2hR?=
 =?utf-8?B?WjFpaHAyWlFOMUt3R29OejZrUkg1aUg4K3MzODl4WjZCcXZKVE84RzhrK2Jw?=
 =?utf-8?B?c201U05qdTUrRUVOcEp2V2NyRjdUNjRxbXljOUc1eWVmVldjZldDd2dXamVs?=
 =?utf-8?B?T3RpOStjN09KMVNMdm5WM3VZdE5xNWM4Z3dQd3NJR05Hc1Q0TTFBUzhtb0x3?=
 =?utf-8?B?cGpUZ2FsYnZhQ01Ld3k5cm9zUFRsbFZaLzE3Rmx2RlpXalkwMlR1dDhQNnpR?=
 =?utf-8?B?UUhuRTZoUDRVbi9mbUhoUEdqV3N6N3Y4UHlGdUlzdXZzRTJyYnV0b2dkNXpl?=
 =?utf-8?B?RFpwdVRGS0VaRE0veEc2SDNzQnNHTGRPSVNHMkQyWHFKakh6UkJLWWJNbUpm?=
 =?utf-8?B?OFhvM1pEQUFpSnVoUUdxN09HNXljNkE4Y3RPM3djdk1acHpYckJ5cnd0MUJN?=
 =?utf-8?B?QzYvMkhPYXZGWFBmNVB6Tks2aWJJeUxad1FQT1VOODhHRGtPdFRSM2pPWjNV?=
 =?utf-8?B?cHJ2bUpJMG45MXY5TDBMNmtZRnRKVjFLVzRja3lzWEFaR0JtNERRSGVjakxX?=
 =?utf-8?B?Q1pOOGE2Mmoyc0FicXhFaExsa3NwdCtOT2F2ZW8wNE96YnIrRTY1VmxHa3oy?=
 =?utf-8?B?WFpmNG1JTkM1N1htS1B6STZZWnZxMWZOUmw5a0w1MkhRbHluRFVjRlZRQmRx?=
 =?utf-8?B?MUxZb3ZBYVY2UG5KeFdOUG5ZNmRwd3JvRld1ekg5RFNydHBHRHUrM3pxS2RR?=
 =?utf-8?Q?W1jtBdZt3piLdJ/YqkqHIsfQd?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <46C96A824006E948B9FD1CEF2513090C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b612f54-5859-4a0c-62b9-08dd20c7822a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 07:25:41.0414
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8RQGXoVTFjOP2PW1hrxFpyX5lHW6fOOeEV2CAPNIZx24CK9k0AvL1M0w6bfQkb66cqdfqX4TOx3nikOOUiiuVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6527
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_232556_294391_C96A0C00 
X-CRM114-Status: GOOD (  17.60  )
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

SGksIEFuZ2VsbzoNCg0KT24gVHVlLCAyMDI0LTEyLTE3IGF0IDE2OjQzICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBUaGUgaGRtaV9jb2xvcnNw
YWNlIGNzcCBtZW1iZXIgb2Ygc3RydWN0IG10a19oZG1pIGlzIGluaXRpYWxpemVkDQo+IG9uY2Ug
YnV0IHRoZW4gaXQncyBuZXZlciB1c2VkIGF0IGFsbC4NCj4gUmVtb3ZlIHNhaWQgbWVtYmVyIGFu
ZCB0aGUgb25seSBhc3NpZ25tZW50IHRvIGl0IGFzIGEgY2xlYW51cC4NCj4gDQo+IEFsc28gcmVt
b3ZlIHRoZSBpYmlhcywgaWJpYXNfdXAsIG1pbl9jbG9jaywgbWF4X2Nsb2NrLCBtaW5faGRpc3Bs
YXkNCj4gYW5kIG1heF92ZGlzcGxheSBtZW1iZXJzLCBhcyB0aG9zZSB3ZXJlIHJlYWxseSBjb21w
bGV0ZWx5IHVudXNlZC4NCj4gDQo+IFRoaXMgY29tbWl0IGJyaW5ncyBubyBmdW5jdGlvbmFsIGNo
YW5nZXMuDQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNj
aGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfaGRtaS5jIHwgOCAtLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDggZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYw0KPiBpbmRleCBj
OTVjN2I1NTk5OGMuLjNlY2QwZWQ1OTg1MSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19oZG1pLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19oZG1pLmMNCj4gQEAgLTE2MiwxNiArMTYyLDkgQEAgc3RydWN0IG10a19oZG1pIHsNCj4gICAg
ICAgICBzdHJ1Y3QgY2xrICpjbGtbTVRLX0hETUlfQ0xLX0NPVU5UXTsNCj4gICAgICAgICBzdHJ1
Y3QgZHJtX2Rpc3BsYXlfbW9kZSBtb2RlOw0KPiAgICAgICAgIGJvb2wgZHZpX21vZGU7DQo+IC0g
ICAgICAgdTMyIG1pbl9jbG9jazsNCj4gLSAgICAgICB1MzIgbWF4X2Nsb2NrOw0KPiAtICAgICAg
IHUzMiBtYXhfaGRpc3BsYXk7DQo+IC0gICAgICAgdTMyIG1heF92ZGlzcGxheTsNCj4gLSAgICAg
ICB1MzIgaWJpYXM7DQo+IC0gICAgICAgdTMyIGliaWFzX3VwOw0KPiAgICAgICAgIHN0cnVjdCBy
ZWdtYXAgKnN5c19yZWdtYXA7DQo+ICAgICAgICAgdW5zaWduZWQgaW50IHN5c19vZmZzZXQ7DQo+
ICAgICAgICAgc3RydWN0IHJlZ21hcCAqcmVnczsNCj4gLSAgICAgICBlbnVtIGhkbWlfY29sb3Jz
cGFjZSBjc3A7DQo+ICAgICAgICAgc3RydWN0IHBsYXRmb3JtX2RldmljZSAqYXVkaW9fcGRldjsN
Cj4gICAgICAgICBzdHJ1Y3QgaGRtaV9hdWRpb19wYXJhbSBhdWRfcGFyYW07DQo+ICAgICAgICAg
Ym9vbCBhdWRpb19lbmFibGU7DQo+IEBAIC0xMDM2LDcgKzEwMjksNiBAQCBzdGF0aWMgaW50IG10
a19oZG1pX291dHB1dF9pbml0KHN0cnVjdCBtdGtfaGRtaSAqaGRtaSkNCj4gIHsNCj4gICAgICAg
ICBzdHJ1Y3QgaGRtaV9hdWRpb19wYXJhbSAqYXVkX3BhcmFtID0gJmhkbWktPmF1ZF9wYXJhbTsN
Cj4gDQo+IC0gICAgICAgaGRtaS0+Y3NwID0gSERNSV9DT0xPUlNQQUNFX1JHQjsNCj4gICAgICAg
ICBhdWRfcGFyYW0tPmF1ZF9jb2RlYyA9IEhETUlfQVVESU9fQ09ESU5HX1RZUEVfUENNOw0KPiAg
ICAgICAgIGF1ZF9wYXJhbS0+YXVkX3NhbXBsZV9zaXplID0gSERNSV9BVURJT19TQU1QTEVfU0la
RV8xNjsNCj4gICAgICAgICBhdWRfcGFyYW0tPmF1ZF9pbnB1dF90eXBlID0gSERNSV9BVURfSU5Q
VVRfSTJTOw0KPiAtLQ0KPiAyLjQ3LjANCj4gDQoNCg==

