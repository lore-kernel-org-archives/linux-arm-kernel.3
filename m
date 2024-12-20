Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4461AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 09:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T971+1XADdJDQk5uMqyu48kZsiuAo3kOxtckrsLC+1M=; b=SOhWd5sB++y5pVzFZxvLz5T3HB
	YUjF8nATmla9Zds/Qmq/rxDIPFLWiN182YXiH23RZeojxnYyr3ajJEXdE/k4DooTRASW5elnX453i
	PDryNDD0EJEEKsg9MtSkaOG20CuNDuxJXtpdltqnUhN1pOzPjZKoUDEpFBAjJQ/YVhExRKD9BNv1D
	Zjlfi/B97/VOvHIZ6i55gK+kyPvTztyrzFk4uuLVhIHCn0hFaNfGOIhq4DGs7SSnr7UTJ5kDGmJhi
	O6h8B7x7pg70+NPSlUTzaqSWpkczNHuXfom7TGzhuQ2KYynoPK4E9k0hd+raxDk//oA5f9HArF/y0
	AZGVBmOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZ4Q-00000004Ni7-0451;
	Fri, 20 Dec 2024 09:13:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZ3G-00000004Na4-43Mf;
	Fri, 20 Dec 2024 09:12:08 +0000
X-UUID: 7a693cb4beb211ef9048ed6ed365623b-20241220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=T971+1XADdJDQk5uMqyu48kZsiuAo3kOxtckrsLC+1M=;
	b=lMUd3nDLg73ivSMhSQf2pb8JRpfo/gCUTCi5NklADkb7Kh5zgilhyekSB4svaK3imikuJw/3keiX0Rs/w/azo1+wFarZcQ0WGiMwje2vNpMhxvqTSzaivrFNI4QpYd4qP44WGjneNy5Bba/wT89hJAepzdmmHPvjsbLpaSDWNSA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:31c96e1d-a09e-4a4c-a508-b22fd878ca41,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:a4dba036-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 7a693cb4beb211ef9048ed6ed365623b-20241220
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 429689513; Fri, 20 Dec 2024 02:12:03 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 20 Dec 2024 17:12:00 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 20 Dec 2024 17:12:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oyPgmY8Zxp2Ze7E7RPkLZ/NoPueZp29U69VRGuSYr0lbyxbcrPhm4R7i0KkKocjfglxVbsng1ArThxGyO6HvY3B1q5QL017OHNfD2WbJfQBKNVDZUzOlnU8zB/yDef1BKmohHvSU/k7vc9OBzPSLU4txXFBfxBo9ly7dmXlzhHAfN50SvMHAUM6G3INsGbUpWCKvL67s4HB6P3pBD3epXM5yJOCCVtc/HoJvwnfCcsgo0vkqK9YlJNUWXkJr4Mtp5xSKOQHGuiytOmllqAjkmLuMvrOIYbOlhwVgqJ8k4jwjs/3vs5x9hpRQebeOtPiTl+cohTXsSFawihpmo8frNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T971+1XADdJDQk5uMqyu48kZsiuAo3kOxtckrsLC+1M=;
 b=EOxdScg3/hnFbcibWiI4R4mE8PDAuCdi4fEzd+Sjfy4Qcybi5SChb4N5kUZ6WXgpr+wn6wwihX4fb4es3iV84kNIlrknwv3VlzF2WVLteRmfXMbP6PP+QWWpTdxmsN3rEJLKLOha5V3bouZs1TXcSq9HGZoLyW5O70mB3/mj/Z15rkNkVjArcyeKcmU5dUJc8Ufnr+98q66P9ndzqkaW69gZVnDv3RFsB9dIIqCFMVv4eIyH8qimMugQkDzf5Hch7PmlkB8X9BsMB0WX77h6/O3jm7fFOsKWUXWS5fGmQS7DGjQUnupQNHQhIsTZlWEPUvdiVc7Yr7L8+J87ScdtRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T971+1XADdJDQk5uMqyu48kZsiuAo3kOxtckrsLC+1M=;
 b=v8P6fjgGbAhTpGYF7awbvdop3/R2T3j6MMtIsPlvWpyY32JTuDx56vonlwsdXDxCGv11n75l3azjYIHKTDaSU9BpM/98MCsOsvzKi0wI3fEFk9JA5qOvDwSeWR2+G6QfUv6A4VZj1oNdYEMbiWcLuQg9cWaTtDojL1DE9TR1YJQ=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7197.apcprd03.prod.outlook.com (2603:1096:820:df::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Fri, 20 Dec
 2024 09:11:58 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8251.015; Fri, 20 Dec 2024
 09:11:58 +0000
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
Subject: Re: [PATCH v3 25/33] drm/mediatek: mtk_hdmi: Remove goto in
 mtk_hdmi_clk_enable_audio()
Thread-Topic: [PATCH v3 25/33] drm/mediatek: mtk_hdmi: Remove goto in
 mtk_hdmi_clk_enable_audio()
Thread-Index: AQHbUJqwnMcw6UtEjE2w+j0P3/uN67Lu3TqA
Date: Fri, 20 Dec 2024 09:11:57 +0000
Message-ID: <02ff0113fa1d6c0215b64ec3d353ec61efd34733.camel@mediatek.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
	 <20241217154345.276919-26-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241217154345.276919-26-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7197:EE_
x-ms-office365-filtering-correlation-id: 11e1b413-f76b-478d-e517-08dd20d65b18
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cFllZjJDSjFWMk5TKzRzdGUrRXgxemtrRk5XV2lhRHFlTnY3VUdHS1FxTlFY?=
 =?utf-8?B?cm1PY2ZXZ2lTQnJ2ZlZqaldpWldxK3EzNTBsYU52OGtKNkJ3RzBUM1ZJd0JU?=
 =?utf-8?B?bXJHcnA5QWUxMzRGOUZtMDRxQVJlbENKV3M0cmtIMUtQRXZnb2NZSkhpNzQz?=
 =?utf-8?B?cHF4NUZPbzdqL2JUK3IwNTBkNi9EMGNvQTZIMDlOd1duQnNUQmhZZDhEMHlW?=
 =?utf-8?B?VSsrWnZKekhyMzlEejk0R0pRSmlzckpUMGhncXdoWjIxVlE4eW9LK3l4dnRZ?=
 =?utf-8?B?SU1INGk0dWx6bG9DR1c1eTBNdDJZdndxdDFjWFdEdExiNzNjQnlBaVRnK0ZO?=
 =?utf-8?B?dXV0b2JDOFVCcnZ3K1llODZlbWVJNzNYY0VUSWlEa1BTM01PTGpJRWNSZFM1?=
 =?utf-8?B?UnlVZDFYaHM4ZEhQMW1zYzNIRlhWZ0QrK1lac3JqOGg4TUgvYk8wR1JQZy9u?=
 =?utf-8?B?M3ZpN0VLenAzRE9rZS9VT05ONDBwc0pqTUFCMmpFeGp3YjJoazZKcGJCS1Nk?=
 =?utf-8?B?anpkRVdFWWVVeXROWWJrVWpPc1pvdk1JaHIyb2NCdituVHBNWnhuTzVsU0w0?=
 =?utf-8?B?cTAyVnVmYU1iSU1sbk9LQjB2UE0vN3FyRlkzYVZIOVpnbVhVTjNrUmE1M253?=
 =?utf-8?B?c0FvRzYzQnBKRDBIWnJURDBoK1dERmxhZ1NSZDJqZUd6OENVUGVpT21jQ0ZM?=
 =?utf-8?B?QjFRM09yelZwY011UlY5M2JEdGFJcENIVmZldllpQUFEcExIeTdPSFNDaXM0?=
 =?utf-8?B?QWFERXUySW9LaWZQKzJIRnRsL09iTEhvSkNWTzY2ZTVveVI3U3BZNENmNWRN?=
 =?utf-8?B?dVdyY01DMlpDU3hFRDBpNXBaeUc3RE9ZQ0lOZ29xZlFYTTBLYk1WN2tNbjJx?=
 =?utf-8?B?YnBLQXFCaHpiSWZHaWxraG1vUjRzcmJUNVk0aFlwb0UvRGdwR05PZDdVSWVr?=
 =?utf-8?B?OGlHVFhsZ201WjVHcU0renBRdmROUUJtZlN0ZTQwbmJDNnFKcEMyYVZrVnNs?=
 =?utf-8?B?UzdDdnlYZ3RLekg3UUFNZDkzTWhuOHpiS2QwU1p1Rm5iOXBxaVhGYldNTHVp?=
 =?utf-8?B?cGllaEVnY2VhMVJsVThIWWRVL29wYzZXWjhxSjFJQ2hoMml0dU5qTUNVWTJF?=
 =?utf-8?B?MVBsczFVVkZGdytleHBzZzExMlVmTW12ZUlrWHdUV1BkbkU0NFA5c2FyVTdv?=
 =?utf-8?B?U2dQNi9NVW1qV1R0Z0UySWdFWHhPSmpEbFlNMUtIakNjUXRFQjU4UE1iUGcw?=
 =?utf-8?B?NW9RZWhJNitlc0xRRWVOc1ZCaGh1dEl4RXB2L1B3SVQvKzEwcmN6SVFCV1pV?=
 =?utf-8?B?QXJPUHdqTnVtbnVjb3RxZjRjbW1Ka0t6MDNMb2ZYUkg2dUxjYWtBK2hPQTFF?=
 =?utf-8?B?Z2N0ejEwTFBuUVBwYUtHRU1YUWFGS3lxVWhHQWNPSktQQUlCeDVpb29XS0oy?=
 =?utf-8?B?aW9pYkx2TitReFF0OUNQQWh5TWpsR3BncjdLSkY2MVorN3BGWFIvMWFpNk9h?=
 =?utf-8?B?YTkrMGVpdjlVR3B3NHU3dG1OM2JzMndZYVE2aEE0SVoybmVZNXNTME9oSitT?=
 =?utf-8?B?SmV3ZFR6ZCtPQ2MwZnFubHRiOHhySHQyb0ovNlR4WldiUUhrZ2dzYW9ndVlq?=
 =?utf-8?B?Mm9xV2t3QWhEYmp1R2RRRy9yUDNBallrMnJrNWplZWxkbzdta3JxQ2RjS2Ew?=
 =?utf-8?B?cUtVaEgxaytrbjR5T0hmR3R6YUFxQW81WmZXRkdycHFiWVNrMllHeEZ5d3VK?=
 =?utf-8?B?dGFnUXZJeWhsMGtQTlBTSTlPTSsyT09JWkFnUVFtS0NqaGxLYzA4eTE4NEpQ?=
 =?utf-8?B?Qy9CQ05pUVRLWDZsamNxSmo4S1BZNnhkTEU2aFVVdlhvVE93bHlGNy9IR1Yv?=
 =?utf-8?B?dXFPWlFUd05ObllmZkNXRDA0T1YrYnE0VlpKYkNqaU1nY2kwMVBnMGdhaTZp?=
 =?utf-8?Q?7s7cLa/EGnQ6+hqbWnT4kJ87k7D569Pu?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MFIyZTR0cFNsWmVSQkJza3lpWFpXZUt5bGJsMlRhcGwyaFJEdE1uRnZVa2ww?=
 =?utf-8?B?QWN5bXZYNTgybi9oa0J2MDlmNXRaMEZLV1JaMXN1dllFTnhDclJYSW5RUUJL?=
 =?utf-8?B?bjlra1djTkxaSmtqR0lpREhpUHNIQThCSXYvaGRCb01vMHAwWUNpS0cybFBL?=
 =?utf-8?B?SW9CVVZTNnpJeEozT01ibHRLV0J1amZZWHF0TFlnVkVtVnpTcjZVWm5RNWFw?=
 =?utf-8?B?NG5EeXJVd2RSQ1g1anNNUW1SYldyT0htdkRBWU9hSjFjSTZ5eWVoak41OVdU?=
 =?utf-8?B?VkU5R3ZocjFPVzhHaVlNZ1F4dzl2TDRhOEtyeEdUZkMxTGJhVTJYZVhzL1NB?=
 =?utf-8?B?QktvSWpMVWhHWFZmK0dqb1R6T2tJK0s3S2FOS2FvSXhURDA3YXRmek5BUy8r?=
 =?utf-8?B?YXN3NXFSMjJjQ2pQdHVIUWdXRlBYNTBrY3BmYmdqdFBTQjVRUWlONVNUQlJw?=
 =?utf-8?B?TkZ3RCtscmRsUEZWVHFselRhSmh0WXNDS1hXemh3RFhGbTZHQmpMK3d6M3Fo?=
 =?utf-8?B?WHVrVktINTc5ckgxbkR3TTE3S1N0MVZWUkwxS0lwc1cwZ0RhcjJZVkhpRHU0?=
 =?utf-8?B?Q2Q3NnovSmNrNUhORUgrUnc2b0dtTHY0NzZnL2dKdDB1QmRUaWw0MTc5S1hp?=
 =?utf-8?B?WWlPM25xd0VUZXRMcWR6aVpjVVQ4VmlIRmpIbHpvbzRaL2p5ODFGU3RxZG4x?=
 =?utf-8?B?NmdNWUlIRDUwVkxCUTc2TVRRd1U3Q2hyb29mNXA2cGZidERaKzRHbDVOa3E0?=
 =?utf-8?B?d2F2RkVZaXAybjFvRis2YnRLMWpUekY3ZmpDeDAyeTc5YlE0N1lVOUZYMTNu?=
 =?utf-8?B?Y2hlWmlLZi9ZVUlNV3VBM3BRSU9mc3Fvb05OM2RkYmZMMWxzZW43NzlOY0hJ?=
 =?utf-8?B?U25VWXpucnNtVjVCa1FCelJXeGpqWThrTUhsTXZSa1hDVkZYcHdwbmszN0l4?=
 =?utf-8?B?aTkwRHVneGQ5dFROdWthWk41UDdQTWhsa2VickFSb3EyZno2UG9ucnAxQVhw?=
 =?utf-8?B?a2NYUWlvS1dJQ2tXMlpRQlc0eUZsTE9Wam15Q3lhNFFMUElRRjQyVWhHYWo3?=
 =?utf-8?B?WUxTWGw3MkRTSFpHQUdvaFZvbTJIZUNXY1pQTTBFdWNvcTlNOFIyVWF2dVFB?=
 =?utf-8?B?QmxiNWdhWXU1WnVpUDJVK0dBcnRqczhIcnNtVkw4czM2WGlxU2hkcUdHKy82?=
 =?utf-8?B?S2dFYTBkbFJHc0YzZG44d0EwS3o3S1NkMlRIcW1wL0xIazFQRGI3NHFiUzhu?=
 =?utf-8?B?TDZ5Z3R1ZW5EOG50a05XWitlbGhCS3JVZ3QzRTBlcGc0VlRUNk9hb0RTSkdk?=
 =?utf-8?B?QS9BbXFaeUw4bEg3cU0ydzdWL3YwVE1hYnBROTdnWWxTOFJIZzdQajZNeTQz?=
 =?utf-8?B?eHBWN2dwZ2xSTEsyU1F6QVMxU0lERmpIaGhFNHhDdE5VVkp2Mk44Ly9PbGZB?=
 =?utf-8?B?RGlGOFY5ekdXRDRQQWlNU1VSRjdGR3JMV1J2ajdwZUpKS1c3eFh0M0ZvWktj?=
 =?utf-8?B?d1NISzZzYWxRcjF4ZUZkZHFhNFd0MFViaVJ4YzVIMGE5U1ZnTkd2MmphSUw2?=
 =?utf-8?B?UCtEaHRDZmlGZ29PZDkrZVl4OVgzUE9QTEd4eDJ6Q0dSdytrVkQrUWMwK0NN?=
 =?utf-8?B?Z29scmE3ZGFzWXlTVldEMFIvQjUwK2pBb1Vxc0V5dEdYamt1Z3pwTVVHSXZV?=
 =?utf-8?B?Q2I1S2NGNXZNc0dhSVg4aTIyaWU0MG1VR0pzRWNRSC9xV3RFM0pkOGJUZFZ0?=
 =?utf-8?B?Ynl1L0lDaG9hM2dWTVh3bStObkpXSWRudzJib1hNbnJMcld0Uk1mZVk3bDJN?=
 =?utf-8?B?M1pqRDBMUDFjcVdaVHc0SmloOXhqcXNRNWp1eDZWczVSbmt3Ums2OEF5MXJz?=
 =?utf-8?B?NDZ5SWlGdzg3WWUzVmVJOVd6UGIrYlc1R0RMK0VvT2dCWTc0RHoxNEM3ZENs?=
 =?utf-8?B?RzhWWmp4Qk1WY1FxM3FjSXk2RjQ5TFRHSTRiZ2FPbnF4NHI3azNzblJ4djRo?=
 =?utf-8?B?T0NTdTJMcE9nNll4R2dKOStna2gycCtEZ1ZFcTJEMUZQKzFtYjRuY2MvVFRX?=
 =?utf-8?B?ZFlkUjBIVEtQZk8zQm9Rc0hsams0d0dNdmU2aXBmb1V1L2NvZXlEaVkzajRq?=
 =?utf-8?Q?gecJW7THmsZYBgQ6Qw9e7jZMW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <02D90CFBE6E43142849C9F0AD39C0641@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11e1b413-f76b-478d-e517-08dd20d65b18
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 09:11:57.9726
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4kJldYUUw4rhhyuT4gkhS/Y1Lx5+QJdlNFakbNNheTA2z+19H4MIUKtD5xmum9AEaLr5ncN113Br9MFrNOsjQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_011207_016301_6A13BCA0 
X-CRM114-Status: GOOD (  18.73  )
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
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJZiB0aGUgY2xrX3ByZXBh
cmVfZW5hYmxlKCkgY2FsbCBmb3IgdGhlIFNQRElGIGNsb2NrIGZhaWxzLCBqdXN0DQo+IGRpc2Fi
bGUgYW5kIHVucHJlcGFyZSB0aGUgY2xvY2sgaW4gdGhlIGVycm9yIGNoZWNrIGJyYW5jaCBhbmQN
Cj4gcmV0dXJuIGltbWVkaWF0ZWx5IGluc3RlYWQgb2YganVtcGluZyB0byB0aGUgZW5kIHdpdGgg
YSBnb3RvLA0KPiBzbGlnaHRseSByZWR1Y2luZyBjb2RlIHNpemUuDQo+IA0KPiBUaGlzIGNvbW1p
dCBicmluZ3Mgbm8gZnVuY3Rpb25hbCBjaGFuZ2VzLg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNr
Lmh1QG1lZGlhdGVrLmNvbT4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlu
byBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4g
LS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyB8IDkgKysrKy0tLS0t
DQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMNCj4gaW5kZXggN2U0NTM2MzkxY2ZiLi5k
YmNiOWZiMDllZGQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
aGRtaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jDQo+IEBA
IC0xMDk1LDEzICsxMDk1LDEyIEBAIHN0YXRpYyBpbnQgbXRrX2hkbWlfY2xrX2VuYWJsZV9hdWRp
byhzdHJ1Y3QgbXRrX2hkbWkgKmhkbWkpDQo+ICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0K
PiANCj4gICAgICAgICByZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUoaGRtaS0+Y2xrW01US19IRE1J
X0NMS19BVURfU1BESUZdKTsNCj4gLSAgICAgICBpZiAocmV0KQ0KPiAtICAgICAgICAgICAgICAg
Z290byBlcnI7DQo+ICsgICAgICAgaWYgKHJldCkgew0KPiArICAgICAgICAgICAgICAgY2xrX2Rp
c2FibGVfdW5wcmVwYXJlKGhkbWktPmNsa1tNVEtfSERNSV9DTEtfQVVEX0JDTEtdKTsNCj4gKyAg
ICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+ICsgICAgICAgfQ0KPiANCj4gICAgICAgICByZXR1
cm4gMDsNCj4gLWVycjoNCj4gLSAgICAgICBjbGtfZGlzYWJsZV91bnByZXBhcmUoaGRtaS0+Y2xr
W01US19IRE1JX0NMS19BVURfQkNMS10pOw0KPiAtICAgICAgIHJldHVybiByZXQ7DQo+ICB9DQo+
IA0KPiAgc3RhdGljIHZvaWQgbXRrX2hkbWlfY2xrX2Rpc2FibGVfYXVkaW8oc3RydWN0IG10a19o
ZG1pICpoZG1pKQ0KPiAtLQ0KPiAyLjQ3LjANCj4gDQoNCg==

