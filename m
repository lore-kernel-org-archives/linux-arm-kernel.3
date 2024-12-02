Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 279A8D49795
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 05:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SeeQ7khnRDN0fQ5Ff/oOkF9KTQIM5uYHlvJo+RkyjUQ=; b=43pVLbztrifnWwc2qvoq6vlq/q
	kh6lrIw5ws77FAogvrYJruq9gHw1UMlLsw86AMoYVH+EO8GmXGRmnBonwrTrdNTxxFY18zxPTsKtX
	mfunsItyfvOf2JPPMRPYJHYhAFdR0Qh7bgI6/CkzDZxlGgM1CCZQmL4wYOw3uOK0qqUD48V+Ei1h5
	UkqTzhzC/T2RYRzZItLW12dEcRHZMEssS/EvsuAgvXAKh6yn4sfbTXJI/EStakTIXgyCavBlYwUml
	M9fX1PC7p5D9WjxjVvaub1QdV8Hzq9gbZIHaT1JBxzW37pREqwb7Vij983jqdtSPZ2wAlhsqBoFNe
	9SxOXvzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHyqi-000000056m8-49OJ;
	Mon, 02 Dec 2024 05:19:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHypj-000000056eS-052Q;
	Mon, 02 Dec 2024 05:18:56 +0000
X-UUID: ea2ed332b06c11ef9048ed6ed365623b-20241201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=SeeQ7khnRDN0fQ5Ff/oOkF9KTQIM5uYHlvJo+RkyjUQ=;
	b=vCiWyvQm7RyvT4xRUijuMfQCDL8o1wh5ZbAnCsxgiN5Bi0gl7UUks0SvgiNXdmBldi658MzVpxWQDHHodEzO0TYlK2tBlGn6fSsZ70w9SoRM0B6SZDftDvUlk1+S12vkaAZaihUyYO4SU5ZMqEGuxtY91/IuURI9N0ZZVKaW10A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:96ef1b91-e57f-493c-8e51-26d54e57f3a2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:7670cf23-634f-4016-85ba-2d63e55c9400,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ea2ed332b06c11ef9048ed6ed365623b-20241201
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1107203310; Sun, 01 Dec 2024 22:18:50 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 2 Dec 2024 13:18:46 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 2 Dec 2024 13:18:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQ1j4TzhIHHvQ2XnVKCGL7DvjaVqUt+xwra9kUD35DFGZNGH5g6QvdkmTlnKh9weT203WtacrWGoxHrTZmqaknk/GGhqLk3FZeWZLKD/QI3k1+FA9pf9rVI4aErotFNLo7E7r0xmQVCH6CibKaDj+LurJylxZ1k11hBHWL1SdD0d3VwfIwhrNA2t905uu5AINWWxbHkSkydxIILWTxbcAoM0JYmYJSII8WUL9hnthxftaJzY/MRw6H087sx1bDSp8q19sf4yktiFEyJVO0EIw+cA2XQXuiGcbWEIktRcqN+gc4JAIuZ0QZUSVJDj2/RMsIoTo/BWKNjVcquhuN84Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SeeQ7khnRDN0fQ5Ff/oOkF9KTQIM5uYHlvJo+RkyjUQ=;
 b=hIqtGHLoyjv469MiMnopU7mKj1b2SyDUNSwNF3ed8ozpfpPIaAyHgnJhHX/gAf6fFDimLpJZmfTOJzTM4AYQeAveBkt0ZRdWT8j5hT+u3SGKY62ro3qnd86NhO3VthZkK0mYkPKrOJv6ZnSpYF2n2gjAnEQQLXrRs/61oV2DGXeCdfkIjtwSnXvGbZlWnNuajYQvanNuCpMZn2iR5d9vSTC6tmlc68w5X3lt5pbTLna4BFszEbgTQXFXc+MhdTxUsjZhTQVdxhnbCR4wdbrr+lAfHjpw3uP4s36aCy60kOCmYtkwa6re0I50xybjj8aIFqM9guyD+SiH1e2tSNxUlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SeeQ7khnRDN0fQ5Ff/oOkF9KTQIM5uYHlvJo+RkyjUQ=;
 b=W+LYRutzMbxIJPuA67NGCt0mXH8NRCdX1GRtdXfTQYIj4KnZWExheAgtU3PHgrTHbpe3onisIKncWAHjggZJz10NfaY9mIqVleTbN8raNSS86Awtwe/+ydMF2RYpLzJW4cGEdR/44VmNHwiOGg+hDg3ZT+m/ujtree9PtDZ+2K0=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TY0PR03MB6536.apcprd03.prod.outlook.com (2603:1096:400:21c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Mon, 2 Dec
 2024 05:18:38 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8207.014; Mon, 2 Dec 2024
 05:18:37 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"tzimmermann@suse.de" <tzimmermann@suse.de>, "simona@ffwll.ch"
	<simona@ffwll.ch>, "mripard@kernel.org" <mripard@kernel.org>,
	"kernel@collabora.com" <kernel@collabora.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "maarten.lankhorst@linux.intel.com"
	<maarten.lankhorst@linux.intel.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
Subject: Re: [PATCH v1 7/7] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
Thread-Topic: [PATCH v1 7/7] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
Thread-Index: AQHbO0pF3Zp6UXdpSEmkHbI6wNkmT7LSfLIA
Date: Mon, 2 Dec 2024 05:18:37 +0000
Message-ID: <5401e3a681e4dc92625566b87c1bf3c9e8cc0443.camel@mediatek.com>
References: <20241120124512.134278-1-angelogioacchino.delregno@collabora.com>
	 <20241120124512.134278-8-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241120124512.134278-8-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TY0PR03MB6536:EE_
x-ms-office365-filtering-correlation-id: 09dc9265-07dc-4acc-4089-08dd1290c6ef
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YXJGc3dVOUlQRWdlYU9WeXNmZEYwM1JMY3QyMUxIcTFaUERhOFYyYmxsSFQ5?=
 =?utf-8?B?N3NqaFRWdmMvVkVEbkRBUWd6alRwYlBhdDJ6UC91dmRYb0owejBmUXhVKzdo?=
 =?utf-8?B?aEpEQm5samIweERVcVZUa0N2eE5wQ3cyZDVsLzJYYlpwQ0lzb29YMmRiaC85?=
 =?utf-8?B?VDE4TmFhdGk3Smp6cDVaMFRqdGxzZ3VBOFpYRytPOEtqUUNseEF6V28zL1pS?=
 =?utf-8?B?MjFaVHdSZ1lxeFpxdTdmZWRBREhxT3RjREpSRGJ0WTlXNU0wRTdVaTI3S25i?=
 =?utf-8?B?U0hOZk8wVzJubHFXQVpDNnVFcHYzay9rY3U0eC9PRG01MWQ0QlAzK2psY2lx?=
 =?utf-8?B?SzFMS2RqZnA3OVFac1Qxa1Ztb2E2a01tbHpQY24rSzBTMmtiSkszOGsrV3Fy?=
 =?utf-8?B?RVBLOUZpei9mcUZUZkQzNXp5dWNKTTdMeWZRNjVaQy8xTmRQUU9RRlBYYmFo?=
 =?utf-8?B?aENINDJSMG4yUEhFT1lrTnBCRkRXc3FyUXhyY0lweGY4eFBqVnoxUldKdTlo?=
 =?utf-8?B?ZVdGcXg4VmN1WmErQ01OT3ZtVHlnSFgrMCtsNHdaZW5RaUc5b0s5clB0alJG?=
 =?utf-8?B?b0QxbHJHUWNqMUZUSVVkaUVxNXVSckNrTlBjR3pFL2owdlR2ZUpUNnVad0tH?=
 =?utf-8?B?Ulc1MmpPWlJiUmRaMEZ0RFh5RGxIV082anhlTm8vVHAzRFhoT0Z5OWJmYVhT?=
 =?utf-8?B?cUNCTDJyZnBMb0hTdGtkS0ptTS9ML1VZV3VlQ3JtNXYwbExRV0NSTXhXVXpL?=
 =?utf-8?B?QnY5N3AxdGNmbkxBanJ1Y0grbHY5ZHppUFdYZHc5RExvblNVWG0vYVVXaWU5?=
 =?utf-8?B?d0Vac2hVMWdjSXp6d2VqY1dnTHZWYUc1cDlxOVRLYnhwcVkvcVkxZEVURUM1?=
 =?utf-8?B?bGpMWWdKWXp3U3lZUXh6UUVST2Nvcm04QUpBZnIyOS81aGJVbzA4dm9BbW1D?=
 =?utf-8?B?STRhWER1V05aZmFZR2N4ZzE5aER2NnlCbjZicW5yeVYwcldIRmlEVjNlVjlJ?=
 =?utf-8?B?UDU3SUM4eXhzKzVack5GRWhoSU1HVXVrTXk0TTRHc3ZsUVdCYnFtL3RLSE1h?=
 =?utf-8?B?U3hQUzNOSWdabGlSQjd4bVgzZmErb2FDQlNQODNLTEdSbWMyWlZrQmtPeWtZ?=
 =?utf-8?B?Y2VoVjBYMDhpVjhid2g2a1dteGJ1ME9Lc0I5YWhtZTVrdThLNFAxOEIvT2lH?=
 =?utf-8?B?am53cEVVazRwSjVkNEhNNWtGTEU5VjBBUEF5eTl6N1VUM3k0Sk1NRW8wVzRJ?=
 =?utf-8?B?OTI3NkRkU0h6djl2YUE4dThKUStqUld5OE1sWWJSRFRUNnJtTVhnN1J2RWU0?=
 =?utf-8?B?dUcxdk5QU1lJeTVUZW1LL0wyOGlYaHhxcER3cjNUWDVIaGNiRjJKRExpM2JO?=
 =?utf-8?B?OVNuaytkNzNueWwyNzZrYTh2TUZ2OXo2NTdTb1FhYStwa1NHQ2J4anhvN09U?=
 =?utf-8?B?R0dvbndSNVJwbXVzTVIvR3pWdFoxdkdwUUN5SjFzZEtnVzdSK3h5Z2FXaU4y?=
 =?utf-8?B?REl5TnBlUzFUMWh1b1lKTTJ5Q09Rc3RMSU8ycWZweXpOZ3FMZmxENmNidXRO?=
 =?utf-8?B?VGhVdUEzWVhZaFhYVEFCMWlYcS9mb0hNRXU3WXcyOGZkZFZqQ0FwL3MyL0s5?=
 =?utf-8?B?Qjc2cm9iN01KRk8rZUZsRmtqL2VSWGo1UkVwdUJibFUyQzVFY0I1c2FxK0cv?=
 =?utf-8?B?MmdsK00yZ2xWVVJTUlRtNHBKWk1UL2RSaDdLS0dTMm1nMEx5Ym1RWVVYbVJL?=
 =?utf-8?B?VW96Wjl2UWhUUWFlQ2c2NEUwa3hpSGpBRzA5R0VjODliTFRRWHYvY0hkS25O?=
 =?utf-8?B?N0UyNXZsWkI3bE04L0U1aDk1U2dwcVdCNHVqdFhiVG51REUxYjlYaHRzSUg1?=
 =?utf-8?B?V3NnNlN0YWFkbFAwaVo2R2h5RDNySWNzeHd5aGxqZE1EbUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TTFqYTVsM0dsQnA4ODBobVR0eTJGVEd4N2owdTJvd1VGaU9ydVhkMHpqc0Jo?=
 =?utf-8?B?WnJwMCtiWUpGWm5uM25VVEtsQlY4RnJlUWppN2hpM29LY0p0emxGUXVscnQ0?=
 =?utf-8?B?dWRjZmZXc0RPQVFCVFprcnN1VWE2SHZ0dkNSMVpIM2JET091VDdhUjNrdFJo?=
 =?utf-8?B?YVhNS3RMUmI3cmVNSlpUV0ltbE51STdIQnhsaWNMVDJoV3B1MlBNaCs0TVdT?=
 =?utf-8?B?Wk1kZEVSVmZNWnVRRVM1MW1qa2lBb2hwT0tiYUwrakRvSVVPZ05lRlA5cDBN?=
 =?utf-8?B?UUdFaXhyZ3g1UDJ2T3pvbnJGNG5BWjMrRG1zU0t5aDZKTHJ2QkRPN1c5STY1?=
 =?utf-8?B?QzJCNWZlU1NpbVkwWDNERW0vZXF3c1AzY3VjbFRxN2xxcUw5SS84bHE3Kzg2?=
 =?utf-8?B?THJHYXNrSGNoamlJN29XVk1GNmRNWmZJd0plRlZRd3k4NCtSRy9iV0tZdmox?=
 =?utf-8?B?c2VVbVF6WXZKRFg4TUxVMDkwQTBlVFVTaDlNTkJiUWNFTG5RalNPcG9MNkVN?=
 =?utf-8?B?TGZtYk1lSGYwNnRyUjA3dGFMUTJoQXhMYTZ6OGNadExQRCswZVdXaVEwMjlI?=
 =?utf-8?B?Y09jL1RoalFEdWZIdHBRY3d0blRCVGx6c01EMjJXQkd4TFJpV21DOUNlOTVz?=
 =?utf-8?B?YUdDTmpBR1BDTkxacDN6MjJFclQwVHhQQXJNVkFvMkFSd204UUtCNTluWG11?=
 =?utf-8?B?VUdpalhMeisxK0lTS0pBaHgvLzdzYUdsOG9zMHJvWFVKdVVXV1BNTDluOU5C?=
 =?utf-8?B?ZFZKejYwMmZkR2U4V1F6WWpjNmx3a08xdDZCOEJZT1JCUEw0ZXNMMWlDNHNM?=
 =?utf-8?B?VmN6cHZKditjWjNwNU5FMnlJeW5oem1LaFJUTUkwd1BVb0l3N1VTUlpGOEpG?=
 =?utf-8?B?WkFUclplbGNjNmZkMXl5cWFGd0F3VS84UmRHeStVOXVNZ0RmSmFzQk5yYzRq?=
 =?utf-8?B?U1JYYnM5YlFidGpWY05XVTl1YmJZVjQvUjR3TzFhYXdSM05aenc0bXRWVThZ?=
 =?utf-8?B?ZGp0Z0xlZkR6c0g2WlQxMXg1ZjJMbmpXVGkwQ2dreDlvY2R2Y0FUa2xKVVNQ?=
 =?utf-8?B?b3NuaTU3U0s1T2ozSFc4TERrTGxUcm55SDJybnpVNVRxRjF4aFNWRkM4a09R?=
 =?utf-8?B?MTBsc3Y1N1lISldKQ3d4V2lCLzI1QkUvaFdGVnMrSlV3VVY2NDRuYVZXbWlB?=
 =?utf-8?B?eldOL0JxaCtXSnRLdVBaUDBQeHNSVDN3T3NkbG13LzIwR0ZEK0M4UUdEVjZt?=
 =?utf-8?B?U25IbmFtNEd6VElsUlFoSGVFdk1nMUxpa29NUE1jRVYyREJkME5HSjN3eUZ5?=
 =?utf-8?B?N2RQNGlLa1ZlaUx6QXdDeXlYVzgxazZlM0FPemJaaGdkTndCNEVUNjA5SjNv?=
 =?utf-8?B?SlZaMXo4R1V4OTFicksza014Y083SEVkbjJqa2w0YzA0cmxaeGJpekNaWG9P?=
 =?utf-8?B?U2xKajRrQlBHOERWekpGZHd2Y1dPTXdWN1Mwbi9ubWxrVll5SHJuUFNNdlIz?=
 =?utf-8?B?TXkvOCthdVVQNk9wWjFEaVJGSjBGblZmRktjTFJBNVdhb0E5WWNpYnVla29x?=
 =?utf-8?B?bkh0aTd0cVRaNE03ZE4xTjIzZTBjT1llR3FuMm5TWGZrM3dxcFl6MTNjWlBK?=
 =?utf-8?B?YXFOVEFZV0NVemhNZFdCdTRjWFZQSzRNb3Z2WVR4azljWXRuRGNDK2xycFBl?=
 =?utf-8?B?SXI0ejBnbVNNZ1dZb1J0K2twcnBNd0NRdWJsTFYzUWVOdnUyaFg1cFhEdEtp?=
 =?utf-8?B?Yzd0cm4rWWdGR21JVlUrWWRhQ0I2bnUyNm5VUmgwVWZkaDJ2Z0Jla2pmWXA3?=
 =?utf-8?B?RUVmQ0wxTWRmTlBCU0RQS3lTRmtMTVlVMjZ4aDZqTU04dmQyTWRySkZ6ZFA3?=
 =?utf-8?B?MzBwM2NQYk5XYk9IaWpJejlXQzQ4RTE1ZzNpWjBsTjVaMFkzRGw1UWZIRlBn?=
 =?utf-8?B?SmlCeGUvSGRId0ZuSERsOUs1d0FQUHZFSE1TZHVIdHNidnAxdUJsM3RzYjkr?=
 =?utf-8?B?UnpybU01SDdDL3B2V05Ec2xRZUV3dHc1ZHN2bWNqNG5FeWtyb3d0Y1V6QWZF?=
 =?utf-8?B?VC90STJIbWovcnFPOEhacGMwcEtHOHZpUUhJQ21ZczFCbmV0a1JRZmhRMUkz?=
 =?utf-8?Q?bLw3ODAILDnh8nxSKElFMbLob?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5252E5AFF2BE0148804C577EB693DA5A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09dc9265-07dc-4acc-4089-08dd1290c6ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2024 05:18:37.8140
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BTcAKICHeCjVAdQTqWug+jvnBOMPTI96p673dM4N05gc6v0W+Zbnfkom//OGHu45Od9bISErxU0pv81KbgLTZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6536
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.960000-8.000000
X-TMASE-MatchedRID: cgbqQT5W8hcNtKv7cnNXnSa1MaKuob8PCJpCCsn6HCHBnyal/eRn3gzR
	CsGHURLuwpcJm2NYlPAF6GY0Fb6yCsME2BsoiKJMBfVY7O+c8KbAuWcdTSiQDXvsbfoZixUT+1B
	ysa1PtqQR4d+Uvhl0qktO0oOhWhwmGClvwc20fT6HZXNSWjgdUxyDrkIwjihbmyiLZetSf8n5kv
	mj69FXvKEwgORH8p/AjaPj0W1qn0Q7AFczfjr/7E0UXztsRupI+YcHsgGycONnyL0k7h6c8JHB3
	/f/+OVY9GhrmdV1F7o=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.960000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: C11231B76759981DE923736EFAF38EC01852A49D7F0E69678A497AB92F8ECDDA2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_211855_078937_A430B138 
X-CRM114-Status: GOOD (  11.71  )
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

SGksIEFuZ2VsbzoNCg0KT24gV2VkLCAyMDI0LTExLTIwIGF0IDEzOjQ1ICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBBZGQgc3VwcG9ydCBmb3Ig
dGhlIG5ld2VyIEhETUktVFggKEVuY29kZXIpIHYyIGFuZCBEREMgdjIgSVBzDQo+IGZvdW5kIGlu
IE1lZGlhVGVrJ3MgTVQ4MTk1LCBNVDgxODggU29DIGFuZCB0aGVpciB2YXJpYW50cywgYW5kDQo+
IGluY2x1ZGluZyBzdXBwb3J0IGZvciBkaXNwbGF5IG1vZGVzIHVwIHRvIDRrNjAgYW5kIGZvciBI
RE1JDQo+IEF1ZGlvLCBhcyBwZXIgdGhlIEhETUkgMi4wIHNwZWMuDQo+IA0KPiBIRENQIGFuZCBD
RUMgZnVuY3Rpb25hbGl0aWVzIGFyZSBhbHNvIHN1cHBvcnRlZCBieSB0aGlzIGhhcmR3YXJlLA0K
PiBidXQgYXJlIG5vdCBpbmNsdWRlZCBpbiB0aGlzIGNvbW1pdC4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25v
QGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArc3RhdGljIGNvbnN0IHN0cnVj
dCBkcm1fYnJpZGdlX2Z1bmNzIG10a192Ml9oZG1pX2JyaWRnZV9mdW5jcyA9IHsNCj4gKyAgICAg
ICAuYXR0YWNoID0gbXRrX2hkbWlfdjJfYnJpZGdlX2F0dGFjaCwNCj4gKyAgICAgICAuZGV0YWNo
ID0gbXRrX2hkbWlfdjJfYnJpZGdlX2RldGFjaCwNCj4gKyAgICAgICAuYXRvbWljX2R1cGxpY2F0
ZV9zdGF0ZSA9IGRybV9hdG9taWNfaGVscGVyX2JyaWRnZV9kdXBsaWNhdGVfc3RhdGUsDQo+ICsg
ICAgICAgLmF0b21pY19kZXN0cm95X3N0YXRlID0gZHJtX2F0b21pY19oZWxwZXJfYnJpZGdlX2Rl
c3Ryb3lfc3RhdGUsDQo+ICsgICAgICAgLmF0b21pY19yZXNldCA9IGRybV9hdG9taWNfaGVscGVy
X2JyaWRnZV9yZXNldCwNCj4gKyAgICAgICAubW9kZV9maXh1cCA9IG10a19oZG1pX2JyaWRnZV9t
b2RlX2ZpeHVwLA0KPiArICAgICAgIC5hdG9taWNfZGlzYWJsZSA9IG10a19oZG1pX3YyX2JyaWRn
ZV9kaXNhYmxlLA0KPiArICAgICAgIC5hdG9taWNfcG9zdF9kaXNhYmxlID0gbXRrX2hkbWlfdjJf
YnJpZGdlX3Bvc3RfZGlzYWJsZSwNCj4gKyAgICAgICAubW9kZV9zZXQgPSBtdGtfaGRtaV9icmlk
Z2VfbW9kZV9zZXQsDQo+ICsgICAgICAgLmF0b21pY19wcmVfZW5hYmxlID0gbXRrX2hkbWlfdjJf
YnJpZGdlX3ByZV9lbmFibGUsDQo+ICsgICAgICAgLmF0b21pY19lbmFibGUgPSBtdGtfaGRtaV92
Ml9icmlkZ2VfZW5hYmxlLA0KPiArICAgICAgIC5lZGlkX3JlYWQgPSBtdGtfaGRtaV92Ml9icmlk
Z2VfZWRpZF9yZWFkLA0KPiArICAgICAgIC5kZXRlY3QgPSBtdGtfaGRtaV92Ml9icmlkZ2VfZGV0
ZWN0LA0KPiArICAgICAgIC5kZWJ1Z2ZzX2luaXQgPSBtdGtfaGRtaV92Ml9kZWJ1Z2ZzX2luaXQs
DQoNCnYxIGhhcyBtb2RlX3ZhbGlkIGNhbGxiYWNrIGZ1bmN0aW9uLCBzbyBpbXBsZW1lbnQgaXQg
aW4gdjIuDQoNClJlZ2FyZHMsDQpDSw0KDQo+ICt9Ow0KPiArDQoNCj4gDQo=

