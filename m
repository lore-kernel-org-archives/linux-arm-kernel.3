Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F44D13570
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 05:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CYGopE+X1LHOk6bQWfNLSJFS9q1TUwReiKu5jy+FkYA=; b=XjqHvCQzb4bL3UJuJrqoAhXyoz
	2dK5cAUzu4QWOAkggnpV5d/pXEXRp9ptMPKUIt76wV3KYFJ1ldQKoQOEGEmLIBBz76h7xi0KlT1qK
	Slw7HidW47dMknCpMFwobzwfC7SVaUi4ETSiwTNQwH3mRlFUh9qsl9BsjOCAhAbbvuy9c2VSzoy5v
	Zpi3pDSZvtXJnhiaN8sLhFoT2HkdB4t61TGlzEdjMm3YmIYGdEK/nJl0tz4AMBJn2txq58EVsJvcH
	XRryN03e6Pmn02P+ovhDe3MQFsdeTngh9D+CXJFqdNv61D42s4h2DkkvMSPWVtmC/cltyPHVFl6RW
	L4OxTe6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5IED-00000009Zyf-25J4;
	Mon, 28 Oct 2024 05:23:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5IBU-00000009ZkU-2vnl;
	Mon, 28 Oct 2024 05:20:57 +0000
X-UUID: 656cf1e294ec11ef9048ed6ed365623b-20241027
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=CYGopE+X1LHOk6bQWfNLSJFS9q1TUwReiKu5jy+FkYA=;
	b=oLr6Qk1vL5m8ujd4qL2GH7AOHICrjDJIzY0vYLeDGDrPk29OxRsrpBgcVuTkqM58mTCR17Y54VnjUPNjCZzp+uu6ZHFHbXmwxl58elX1IDgyRhvmwzvgVcT0MjoNKoe2n8lReSD63g1vU/cCQGVp3km9pcx1od7/DBCEjYA1RVI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:e10e51db-cdad-444e-bbc7-38f1c904c684,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:9150342e-a7a0-4b06-8464-80be82133975,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 656cf1e294ec11ef9048ed6ed365623b-20241027
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 177706771; Sun, 27 Oct 2024 22:20:50 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 28 Oct 2024 13:20:48 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 28 Oct 2024 13:20:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W4SmLvFgjDRgsKufh7NaGNeSJca7CpsPMoaI+Lca89Yqg//8pgqSzssqf7vnH6byF2fW8vfM7hAsmVs23lPEcCvAik72sqRVx51qQD0nPYq6eKkmJ5ZGknbk8A1d5wUvALPAKrg/qFUxDFBEOT7jss80QQ2ZPWrIFPk2zWzvmiP6NM2FNym5u/zXWy5Sn+t7fC4KqRxJZnsPmKWRcPaxNaK2bd6SzOtsF6yJ7Yx0b+TMOF42fORW/SoQVqFHCt2Nx+ZaAZ2devY9eJZBQIis9jBZUYVf/7nFk9ab+cGc+VAXW5Ftm9BbInLKQlK9LUuTMSCwYO8dm066YsXySAQU/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CYGopE+X1LHOk6bQWfNLSJFS9q1TUwReiKu5jy+FkYA=;
 b=wqsi8WXAnzIbuNexJQP9vRwAsK9QxxEQk9maqn3tjMiKjOLX9kcxYy2CtOA9UM3dpo81IKeNnAX3nGsbsL/B7sRl7gfS1Kg0TW0UJXpRRVR+TsLuLp/Uk98wBdAHYkLsMAB1L0DzLXpyx7oQGPfAHK726zqNMsoiBj080pJ7ST1AtQz9lB22k1H378OVvWNeJPUTDsgHPcas3ixObCjVntCr/pvxovscwa7V9vbueguPF+eoT9EMKavLNa/PkGv3L4fbnN3osJVxLXGLpDCQBAWSd7Yvw7dzVz5JL8IWCElyvRhXk1leaaAa00uyEirRnBeOnPBCyCPL6EpGEWQSKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYGopE+X1LHOk6bQWfNLSJFS9q1TUwReiKu5jy+FkYA=;
 b=faOy26cyDrP+WE4VxvbqcYKEo4llroiXIBNYuIkwKIhdYxbogFlYqxtnET0Bs0tp8l5a1AF4eqFyQ8zHoh9by90IX993yfITDQeiVXKUpwSIHzU/XuxYyhRh/JBlWMIuCZt6rl63gGPRGQau7qBP8jWJccBF2B6vCLGCmEu47mI=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB7171.apcprd03.prod.outlook.com (2603:1096:101:e1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Mon, 28 Oct
 2024 05:20:44 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 05:20:43 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"christian.koenig@amd.com" <christian.koenig@amd.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?U2h1LWhzaWFuZyBZYW5nICjmpYroiJLnv5Qp?=
	<Shu-hsiang.Yang@mediatek.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"yunkec@chromium.org" <yunkec@chromium.org>, "linaro-mm-sig@lists.linaro.org"
	<linaro-mm-sig@lists.linaro.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, =?utf-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?=
	<Yaya.Chang@mediatek.com>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "hidenorik@chromium.org"
	<hidenorik@chromium.org>, =?utf-8?B?U2h1bi1ZaSBXYW5nICjnjovpoIblhIQp?=
	<Shun-Yi.Wang@mediatek.com>
Subject: Re: [PATCH v1 08/10] media: platform: mediatek: add isp_7x state ctrl
Thread-Topic: [PATCH v1 08/10] media: platform: mediatek: add isp_7x state
 ctrl
Thread-Index: AQHbGj2y1UKRq3h+wU6S0U6tpTQ9lbKbvcmA
Date: Mon, 28 Oct 2024 05:20:43 +0000
Message-ID: <1e6d50edc8c14313cdf2bd1b9d33e94e88ed2770.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-9-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-9-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB7171:EE_
x-ms-office365-filtering-correlation-id: 6e8feea5-121b-41da-d149-08dcf7104590
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?R0swUU1MN2g1MzRlWHp2bEJleXl1bE9vQkVRd29FZDF6MjFCZGtWMVZ3MURo?=
 =?utf-8?B?d29sR0kvM0RSdjhsNDdDY09GelFUNGswSERiY284UnRFWjN1MDhMRDZRTktO?=
 =?utf-8?B?RzQyamJZQS9UODVPVlgzL1ExR0pDbEVxMTZaZWthVUJJa0t2djFrWmNmSWJQ?=
 =?utf-8?B?VE5rUEZCNVl3TVVGVzNIZXpoZVdvT2d4UUZaZ01wNDJWcURXS0M3SFJJbEpz?=
 =?utf-8?B?Nnl6MHluTWx6ZlhWNDl3d1l2TytXYkpjaVpZU3YxNjdKclIwd3VzOVdJSEJ2?=
 =?utf-8?B?aXZmK2hlSjRjTlpzOEhZK2dydnpNK2d0SWRZMGZKcStyL0d2VFgyWjFiU0ls?=
 =?utf-8?B?RkJiSktGU0dxWHpSaDZmS1J4V3VsQWZUUXR1aWlhbEcyWlRKVUYyM3YrdDhj?=
 =?utf-8?B?bmpxazVGZGw3WjkzMjJYM1RSZXMvdTFFb3ZNVjFIbFRQb205a2ZYakFienVN?=
 =?utf-8?B?K1pkK3JkRVhZMGorRU1YL2FxblBUL3R6SWpFbmlpV1RhellJUTQ0SlRESzg5?=
 =?utf-8?B?dUNtOHZhUm5hMFBudmRQNTVkMmd2NEs4NUZxZkV4a2Q4UUUwZmdyRHZLVGQx?=
 =?utf-8?B?Ty9zSnN5WEI1Wmp4VUNzZWVTbWVEeVFDYjByWnZ2Kzc4eUxJQjFrQWJKSmhG?=
 =?utf-8?B?NVVlNUMvZXI0RE9rZXNzaVY1dDJSMHRnOUVCSjF1a0xtVW9WcFpYamY5Y24y?=
 =?utf-8?B?VWwwYUtkYXZ1eW0zNkhhd0w5YU9ZbGp3WFpnMDR5MGtCNStJZjgzbmZDNE1V?=
 =?utf-8?B?eXBhaTI0cjVKQlZFVnM2alo0UmJhM0xXMHJoRXFaUGxEcS9zQTE3UTVTV0VC?=
 =?utf-8?B?V2FGTUxTRE82Zjl2bmhrNHVBa1k5UVZCL0JaN01pVzQyMk1sdUxoeVVVWVNw?=
 =?utf-8?B?NDBvdE1OalNDaytKMjUwOFlPQm82NTJpRFFWeHovalhvMnNWUWxGT3IzZDFV?=
 =?utf-8?B?QVRpYkFDRy9SLzAzWGY2cTFOYnNyVW9hM0NDdWYybjN4YW9xNmRXaTFic2hp?=
 =?utf-8?B?SmhhSy9RWVh5MVg4ZGl2ODNQU2RWNnNPakJhT0dXV05ZZzRvZ3VDZEU0WGdU?=
 =?utf-8?B?ZnV5a3NtVEtFVm9JSDdSSmpkejJQeTI5OG9jSFJjcnprY1NTZ1RHTEUzYXJN?=
 =?utf-8?B?K0w4enJmNDRsYUt2ZHNrY2hYUGdVZVY0Uy83bUN6QUZUS1lEUk1CV0xMbnZh?=
 =?utf-8?B?QVFxR205NHVsdk53b2IxOFBzTFVSR2NJZlkwWWFOQUN1Q1luSGFBdjArekg4?=
 =?utf-8?B?S2hNV1doZDlHbG4yc3A2VVYzakluMm1rY2RBY3dha1E4UEpVaE10MGNwaklx?=
 =?utf-8?B?b1dLd0ZMb0R1TVRjWDZTM3ZPS0ZtQ3hySWo2dzc3SDlRUjk0NGZBc1hTNVRo?=
 =?utf-8?B?QXp3ckVmZmk1MDhPbHo0ZHlwWnBoMVI1MHc5bnRVcGpDNEdFMStKbk9IbUgx?=
 =?utf-8?B?c3hoOXdXYXNaemtid3FLT1dHN0NBUW02T1NUOTBCOGVKbnBYYkgzSUlKSmdL?=
 =?utf-8?B?c1pieUZzSXVTR2k4eVBYUGNqdUJCVDZOSWtuL2JlNFNrbFN5NEZiYXkxU0Ru?=
 =?utf-8?B?Sld6TldNUHQyTk56STVkNkd2M09uaUQxbnRJNHhjelVTNEUyTnZsVkh6QUVV?=
 =?utf-8?B?TjhzTUY2VkpaZDBZaHhnSXl2Yjg0UFdDVFpkdWZJdmNkbEV5M3pKWm9tQjh5?=
 =?utf-8?B?VTFzRHhCeXlNck4xbkE0R1Njb1hRNUlGVTdtcDBjS0lxV3o2WU82L0UwNmZL?=
 =?utf-8?B?cU4wdkY5b3JmTzZtQnZURTcvMFNpeHFpYmMxd1JRZ1NTcCs4YTVGVnpJZWlV?=
 =?utf-8?Q?oaCbvmCCS/3EeX6mybBVhl/iiyBu7i3kTQ6dE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NFJLSXB5ekRzZG1Rd1ZtZUVMS2d6ZHFRU2lERlJqWFlZWjJVWDdmdHdYcnZ3?=
 =?utf-8?B?emw5ZmFQdEVJZFc5MTVUemlhWlBxMFp0M0tBaTBuOVVCZDViSFg2ckw2aVN6?=
 =?utf-8?B?SC9OaHJmQjhNc3hKYmJ5Y1dTckIwcTVXVTBjdWE5K2NVRlUyODJuaVlIUlkv?=
 =?utf-8?B?eUpwSEdVNmNzUWxtd284andndnRCU21IVHp2QVNBc0R6bW5RRkNvU1JnemZm?=
 =?utf-8?B?cUdyS2JLRmgvYlprbWNTVCtmRjZrQkNEQk5xMHk3V1J5WG9GY2Y4QnFWbkhq?=
 =?utf-8?B?eWR5NGRlWTZwWkxnNWNQTWoxa2dqTGlwakptUUZVdlFYcy91WUE2a0RCL1lh?=
 =?utf-8?B?cWdVSElmeHQxNTNaUDB1RUNFdWdpWnlsYmk3TGN0Qzh2eWRyb2xieDVCVERU?=
 =?utf-8?B?UDQ4MCszY0tKNHl2elVsWGMySlNQNnc5R1hkMWJ2c3RHSkVyY0YxNjZRUmt3?=
 =?utf-8?B?blJ2bjlhUWdad05uZWRaZnplUGlYUllYeUdHTnVzRGszTFlJME1TSlF6aHd6?=
 =?utf-8?B?Rm5NWmZlZHo0bjA4TEhYTGswaFNRMlJrVk5PSjErWnpLTnJ5YjBOd2VBSCs0?=
 =?utf-8?B?ZXJhTTFaZTFsRWR1Lyt0cXRPMjN4Um5KUE1lV1Jud2I5R1daZkNwNXN6ZXpS?=
 =?utf-8?B?NmVIVlNGL0tkMm5ROWRCR2FUWVhOV2lSdnk5V3h4Nk1nME1OYWRXMlN0c2k4?=
 =?utf-8?B?UUFqMkVndFUwQ2lVRGFKeERNVEdCaHp2VS9EMXArenYrL3VIQ0I1cCsvd2Ey?=
 =?utf-8?B?WjNudkdiL01EaXZNd1VPRVdsbnRWYVdqdjY2d2JBSWYxR2JWM1ZvdWVUc0pI?=
 =?utf-8?B?TFp4YkpRZW5reEVJdE9yRXF6b1BCbXJiN1k3aDZlOTN3ak9IclZjL1FyTm9B?=
 =?utf-8?B?eVdiNHBUZjZJQnJLWFArN1VxSlV3VzQ2VnZZWnpvSGNoVnJtNkRZbXI1RjF4?=
 =?utf-8?B?b2RSSi84QzVtOFFTc2lYZGs3VG04NW5Jc3htRFRpeFlObC8zVzFCQzFHcjhh?=
 =?utf-8?B?dFFtWmhpenZuM1A3RnR2YnRySFl0Wlk2Mmtlb3lqYkpUWUJXc2NBTWVCcTVZ?=
 =?utf-8?B?UEZrYVEzWXZWOXMvNStKL25OeEN1RGsvUWx4UWErRFJMRWZxZnk5SVdBYTh4?=
 =?utf-8?B?V0ZHdFJudjAwdmowQXppbnVYdGkzZWVwNVU0ZGtQdVJaSEowRTNMT2o0aGoy?=
 =?utf-8?B?VXdsTU91TXZUcStMVnNJTXJKcjI5Ly9YZ1dJM2lURU4rNmtlOW9pdG1RN2Ny?=
 =?utf-8?B?cjRYaTZHZm9jMXdFNkI3aURLd3hzbU5IQkJ2em1SNzJpMXpLRFJjZHVtRXBK?=
 =?utf-8?B?c05ZRW15UnNtSzBuMWFCdUhNZW5RWVJ6czZMNmJCeU9BeDh4czRHZTAzN240?=
 =?utf-8?B?MFhXSkFrdDhrNi9tN0JWQWdBMmdOdXFUamg5RFZ3OUI1M3ZWblVIU3hOT1JH?=
 =?utf-8?B?bkQ1MXdkQnlIcjJTUUR5ajBkNmJ2ajhoam5UaldUc3lvcG51WnUrZWVpdjNN?=
 =?utf-8?B?Mm1ibjdYRFUrRm9UdSt0c3RqYVNDL1ZHL0hBOGh1bURtNFArbHVPenRMbXBZ?=
 =?utf-8?B?UjUvYTNRUFVKb1E5NzdlODJmUGpnMGd4cUVuTzVTeVJTVUlSVEkxc0xmZFF2?=
 =?utf-8?B?MWI5REk4djdwVmJuRjc5WlJZU1JkYjRRNHY2UDcvRWE3WmI1Q0EyMW0ydlF5?=
 =?utf-8?B?R1ZiM1E1cksrSFY3ZFJIV2R5bmpDUXZYRHpyRldmYUhxb0pMMzlEQVV6L0hH?=
 =?utf-8?B?VEh2Mm8vUEF3TkNmT1ltelIwR0NqZGV0R3Q4UGo5Q2tUVWY0b3hadlB1MEww?=
 =?utf-8?B?SzRMSHdpWnp4dkZsckhLWFhZN1VJUjBwc0l3SkJ3UXJEb0ZkWDVab052aHR1?=
 =?utf-8?B?ZjJ1RnY2VFAyQjNmL0RkTE8yNE9aQmsrQmdsRW8xdDhod290SEYwQmxtZWpV?=
 =?utf-8?B?TGxFV1k0Nm5CRi91R2tQdnlJTkFVNlJEUzdYQ0VoWnN3eThQRjl5RTcwN2M2?=
 =?utf-8?B?R2M5U3Zqc0d3NmZlSUwzSTVESm0vSWF4eWxjZkpPelVDNEhPU1pibjgyU0NZ?=
 =?utf-8?B?VTFOTFZQbzF0bkg1VDhUSC9FNWlnOGNwb3Bhb256MDhLNzdnMUhUSzg5bG5E?=
 =?utf-8?Q?dcBmHdJbOfN7W7VQwrb1By5gL?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <479343E9B8A79A4FBA0B9EA0CA793E62@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e8feea5-121b-41da-d149-08dcf7104590
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2024 05:20:43.8191
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 01a1YvO0Ip1MKLkNDhn6ru1KKSKJEnO06BVDc1IDTKy73T2mSQ73cs3tCcKdjYq6uoDFgNgjnAAyqNIp8mL1/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_222056_782625_21C7BDAB 
X-CRM114-Status: GOOD (  11.53  )
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

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHN0YXRlIG1hbmFnZW1lbnQgYW5kIGRl
YnVnZ2luZyBtZWNoYW5pc21zIGZvciB0aGUgTWVkaWFUZWsNCj4gSVNQNy54IGNhbXN5cyBwbGF0
Zm9ybS4gU3RhdGUgbWFuYWdlbWVudCBlc3RhYmxpc2hlcyBjb250cm9sIG92ZXIgSVNQDQo+IG9w
ZXJhdGlvbnMgYW5kIGV2ZW50cywgZGVmaW5pbmcgZGlzdGluY3Qgc3RhdGVzIGZvciByZXF1ZXN0
IGhhbmRsaW5nLA0KPiBzZW5zb3IgY29udHJvbCwgYW5kIGZyYW1lIHN5bmNocm9uaXphdGlvbiwg
ZW5zdXJpbmcgZXZlbnQgcHJvY2Vzc2luZy4NCj4gVGhlIGRlYnVnZ2luZyBtZWNoYW5pc20gZW5z
dXJlcyBzdGFibGUgb3BlcmF0aW9uIGFuZCB0aW1lbHkgZGF0YQ0KPiBjb2xsZWN0aW9uIGR1cmlu
ZyBhbm9tYWxpZXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTaHUtaHNpYW5nIFlhbmcgPFNodS1o
c2lhbmcuWWFuZ0BtZWRpYXRlay5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiAraW50IG10a19j
YW1zeXNfaXNyX2V2ZW50KHN0cnVjdCBtdGtfY2FtX2RldmljZSAqY2FtLA0KPiArCQkJIGVudW0g
TVRLX0NBTVNZU19FTkdJTkVfVFlQRSBlbmdpbmVfdHlwZSwNCj4gKwkJCSB1bnNpZ25lZCBpbnQg
ZW5naW5lX2lkLA0KPiArCQkJIHN0cnVjdCBtdGtfY2Ftc3lzX2lycV9pbmZvICppcnFfaW5mbykN
Cj4gK3sNCj4gKwlpbnQgcmV0ID0gMDsNCj4gKw0KPiArCXN3aXRjaCAoZW5naW5lX3R5cGUpIHsN
Cj4gKwljYXNlIENBTVNZU19FTkdJTkVfUkFXOg0KPiArCQlyZXQgPSBtdGtfY2Ftc3lzX2V2ZW50
X2hhbmRsZV9yYXcoY2FtLCBlbmdpbmVfaWQsIGlycV9pbmZvKTsNCj4gKwkJYnJlYWs7DQo+ICsJ
Y2FzZSBDQU1TWVNfRU5HSU5FX1NFTklORjoNCj4gKwkJaWYgKGlycV9pbmZvLT5pcnFfdHlwZSAm
ICgxIDw8IENBTVNZU19JUlFfRlJBTUVfRFJPUCkpDQoNCkNBTVNZU19JUlFfRlJBTUVfRFJPUCBp
cyBuZXZlciBzZXQsIHNvIGRyb3AgaXQuDQoNClJlZ2FyZHMsDQpDSw0KDQo+ICsJCQlkZXZfaW5m
byhjYW0tPmRldiwNCj4gKwkJCQkgIk1US19DQU1TWVNfRU5HSU5FX1NFTklORl9UQUcgZW5naW5l
OiVkIHR5cGU6MHgleFxuIiwNCj4gKwkJCQkgZW5naW5lX2lkLCBpcnFfaW5mby0+aXJxX3R5cGUp
Ow0KPiArCQlicmVhazsNCj4gKwlkZWZhdWx0Og0KPiArCQlicmVhazsNCj4gKwl9DQo+ICsNCj4g
KwlyZXR1cm4gcmV0Ow0KPiArfQ0KPiArDQo=

