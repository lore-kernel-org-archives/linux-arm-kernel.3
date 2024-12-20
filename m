Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E258FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 06:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7IAzXde6cpTjW8cfrvW51Jcieryj5YvybSe1WZ6ZxFU=; b=3dolFiTtbx0MEP646CLhMj3Gfk
	NKUIIQoOkqfsuzT4C+bZbNX9GoO4tO8gjdwOXVhmmsJk9SbWEosSKgjFzoYcNExNp/mF619DuuM5t
	OKEBtvzztUK3CUY/e9GN0pFlqASAQkvEDE8r7LL1LPjWMbj3VQyDqyO7s44E0yaRAed0M3hgHF8Po
	h5TDkfWPJzT2MNrys18sWkRlsvW0lJVMjWGHsP0PkBq88GswYwEhdJfOD+GrbfgSr7Os983N70DUI
	RCXYdxSOfDLiWrZOIQujRPgcComZUH36YOtNuvQjjoHeM/8y2R5fMKGGRalYuoIvWC3NZu1qkCqoj
	zkZI6TbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOWE4-000000043BZ-3j0k;
	Fri, 20 Dec 2024 06:11:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOWCv-0000000432A-2yqy;
	Fri, 20 Dec 2024 06:09:54 +0000
X-UUID: 0467c666be9911ef82ff63e91e7eb18c-20241219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=7IAzXde6cpTjW8cfrvW51Jcieryj5YvybSe1WZ6ZxFU=;
	b=cP+F7qrX/cc/xlyqNnVpyVzkwBrKYM8tTrAAzHiG4uzjtOZhr8xWXHnamC5dnR7b6NWc8KVQGFcUHJfbnCW6WEgt4LPGB7Ao69zF5ec9qGhfnAW7WlZSqEw5oerUcJ/b9rgDmQ32Q4YPO9Q4kOk4ges4w3NAxS1VV6gcOnzlKZU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:517e27be-103b-4625-9ca2-1a1549d93b09,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:87741294-0286-4820-a24e-6305e82d1261,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 0467c666be9911ef82ff63e91e7eb18c-20241219
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1424484208; Thu, 19 Dec 2024 23:09:48 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 20 Dec 2024 14:09:45 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 20 Dec 2024 14:09:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=roMpklUweBwknI62YD4mC47gjS87jcTYZ5YzQlJmx/gckh+UoecgCyti9+iAHe2nlxcyIezU7ATzr61QyKeVoDo4cfoaKY1TBCcPxUxnIu9Qc7gWvpfjOhHVdbixTmOGx5x+Fp7BbsW1N5kjQdgNeFL5s/uxzWavVL+uveGTW1uIr1vNixIqFuy2byb69OxJUbOMUIsAms99w8FRDisj49gWkkqlaQU24dZ0zldIBPd1S9chJ6HEfV9bSM21Cz77oJDGvh5NbF2mKKEiUq2IEUCelliQVkxncCX2WayGEvF7qQ3cW16iRMzgA8wvZEqML2pxZGjCenqXu5rZdWfBRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7IAzXde6cpTjW8cfrvW51Jcieryj5YvybSe1WZ6ZxFU=;
 b=T+muJjP3PD+a8DQscLNDnuPCRx3e/DFVnnIhYYnVUlAuwN0oZ8u4oUwmX9tOG453GVitFaJ15smhF3mi5vdd+8B60c2aIvm/uzo1hTzvoFajEtZhk2/U6RnfZ/Sn+kNAhqt6loQQy7vkM/WftWYiXbQ83fCMEJUHjuLH5Ipc/wVBeOfKM+gysKyTvsNu9ws8rIvfTk01TfjjOVnK4lSZ3XYojB7g/xhk4yEV9FmOaQ490noOf8yBJHnn8jeD0Y+sY7ZPBfnog20F9FFX5SQTISg4KFM4HnOxWZEZXlTWlk03oN3D37AphiOZogiMR1pqasC3TwnWJ67dMbTTXRVijQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7IAzXde6cpTjW8cfrvW51Jcieryj5YvybSe1WZ6ZxFU=;
 b=f//QASf6y9bPGetwxcPnZGQVUtUTEnsqBtxDragtqW6TiLRl67ynAKZRSdG5hK0gLmqyWAS+IfJFVz7m+1VmeHvKijXIVb1lbdrkkBK51bozTU1gxanwoXlpQilZTSBiSscgfcHgySU/KdE+CwtBohYHFVVWz/osGUVPDlefi08=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TY0PR03MB8223.apcprd03.prod.outlook.com (2603:1096:405:15::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 06:09:43 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8251.015; Fri, 20 Dec 2024
 06:09:43 +0000
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
Subject: Re: [PATCH v3 18/33] drm/mediatek: mtk_hdmi: Move vendor/product
 strings to drm_bridge
Thread-Topic: [PATCH v3 18/33] drm/mediatek: mtk_hdmi: Move vendor/product
 strings to drm_bridge
Thread-Index: AQHbUJq0gwwfSAqNM0+NcGMydc6TirLuqk8A
Date: Fri, 20 Dec 2024 06:09:43 +0000
Message-ID: <c93c81878ca5f45e2b7cf16863f1e4ab85f957e5.camel@mediatek.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
	 <20241217154345.276919-19-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241217154345.276919-19-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TY0PR03MB8223:EE_
x-ms-office365-filtering-correlation-id: 592aba0d-c707-4484-628a-08dd20bce56d
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cVRZZVd2cURyZ0piTmJIK0tNc3BwZUZ0elZEVXAwZGVMTFAyaXRZVGpxMWQ1?=
 =?utf-8?B?R3c5ZlZOakdFUW9MTThWdkZRaFBxVGVEanFqbEo1UkxXN2RIQUFHOThlV3F4?=
 =?utf-8?B?dW4xYnFhVUROTGxMN3Y0dFNadWF0b2FIRlU5MnVTMWc3RkppVThyTkF2YkVk?=
 =?utf-8?B?SUdnZlJ1TCtqbkNWcTNJQ3ZOMGo4eDAvQUU4ZjdBSmJVN3ZEQzNhUkFTUit5?=
 =?utf-8?B?andCL2hHRWtheGVhNkQ1M0ZDbC9MY00xRnVDblBVZy9wNWdBME1xNW9URUxJ?=
 =?utf-8?B?VjV3ZEgxU0V3T0FsSzQwTysyUWNxNjZmUjk1cUV5QzcybXdnRHJndHIvYWRo?=
 =?utf-8?B?SzJZNlNraHFyck1Nenp4dlhpeHdjZEVuY3NsRmZOT0JMeWRNbnFlcXFGMnpk?=
 =?utf-8?B?Y0Z2TXJTck1HWkN4RmxKZEdYUWV6UGgvVHU0R2QzdGZVMnBtQURDM0ZHOXI0?=
 =?utf-8?B?dDRFS2xqTmtGdWJPM2p6SlFjWldOeUZwOENKYy9oSlBFNEF2N050NVBNZXBO?=
 =?utf-8?B?cy9xVVNQQVFvV0ZtNytUd3k5YU5iY0JveWprY3lMaGFYb1U1QmtkdVM3Y0k1?=
 =?utf-8?B?cGRZdFBXUzIwZTllc1I5bll0SjVBYU1ycU9KMS94VG9salpLV09TWC90ajRQ?=
 =?utf-8?B?S1dRLzRiZ01SVzNOenFkcGFudVNCWi80UUt4MWpmTjc0Y0FWUVZLV3BGa1pv?=
 =?utf-8?B?aTYxaXpLZTRtenJOdFJDV3l4Y3ZwL0NlSWh4VnJSWVJZaktZWFVkc3ZkVWhB?=
 =?utf-8?B?cGV0dXM5RU8vWmM5YUF1V3RCSG5POEM1MzRKODh5SjViM1hKYi9UM2pxRk1Q?=
 =?utf-8?B?dFJTelllaEtkU29YWDFyMDJXRmRKYzE5MDFzTE8zUk81RUNtOHg0MFZsNzJD?=
 =?utf-8?B?dENoeVVYQ3oxU1lxK2wyL3BEbHNyWVVpTW1HaVNoc1V4T3VyVkFMZzR3ZVN4?=
 =?utf-8?B?VS8wUnBTYzVqeGhiWjBseFhiMUhoZHBFSGVEVjRnZUQzakxIRjVkVm5nSFA3?=
 =?utf-8?B?RW11NDZMQW44UUR3U1BSWEwrblNnZFlvYnZxcTAyNENZYm9PSmhicCtaOUVw?=
 =?utf-8?B?U1lpd3o5Y0ZlVGwxUnUwcnVrMlluY3VTa2hUaEtDNXJ0dVZSQ0pueklRLzh5?=
 =?utf-8?B?TWNnd0ptbm91cXRKVFZqenhBYnBMNnRxNDVjNHdnbHVEVWs0WDY3dnM4eHZS?=
 =?utf-8?B?U3NDUkd2bHBxUEhOV01iTzFhMU96UWhqdWwxMitWQ3RsNVFXdWl2bGRjcmhD?=
 =?utf-8?B?WmkrZm1iQlJCbktKSEdZdCt2c0RKQy96WFVTOGlid2ZsOGZER3ZNRklCbE5U?=
 =?utf-8?B?ZWZSRlBkSm0zUmRKUHNsYWdKK1lwQ2pRMWgvOFd0VFJXYnM2R2w2L1ZzQVc2?=
 =?utf-8?B?MGhMM3lkQVhmay9CazJJUHFYajFwZmFyUGh2ZjhUMGt6eHlZdVRKV2pFbEtI?=
 =?utf-8?B?V3ZWays4cmRXYmdzTEQyWmtKeEsrTDNuN0pyRDUwRnh0cW5rZWpaRDUwRXRN?=
 =?utf-8?B?YlJrbUw3bTVqd2czQkMzblAxblRYRmpraWFTWVZEbVVmQmhDSGtSVmFCU2FD?=
 =?utf-8?B?a01LOTVST3ZFVkdlWjZwYkRkbTV4bHBqOVNFbmhnU3hoRXU4SGRKSGFIQnNz?=
 =?utf-8?B?SFRPNm5lYmpVa2d6R2ljZnp1Y2NtVG0xQVBJZ2QxS0tBVkZ6eHBITWhieVhq?=
 =?utf-8?B?UGh3ajY5ZWpxNjdzU2swN0hpcmNzNjczRk50ZEkyNkhUVjFxbVZsVEVRelhG?=
 =?utf-8?B?OFgzSUN2RUNiWm05MDhLblp6QUZCRGZJcXRlYTNXMnZVZ3NOeFF0R0ZPbXNq?=
 =?utf-8?B?R1hRN25nK0Nmd1FpSThJdmRuMktsTDc0YnNkcVRnWkxHczhRcC9QWEJZR1V0?=
 =?utf-8?B?UzJMb0RWMHB2MkZKU0x4NFNpeEJCU0FScVUzS1BMdUJpbnhQSVVCZi9zN1VL?=
 =?utf-8?Q?U8MICf0UwgTzdVHaXowKIQGTzEjpiJIY?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZkdYMUMwaHg0VWk1UHZQTUJXaWxDdzNuK0E4S2ptLzNyK04wZnlEdm5yOTBG?=
 =?utf-8?B?RzduZmVUWDVXSmJCSUFVWHdjc25BNEhFalppdVFnRTVBa2t5K2I5UzdTNVZp?=
 =?utf-8?B?SkRkcy83N3pkc1RkVGY5WjZQY1JTcWdpWCtJdDlQVnprV24wTmZUemNzK1Zu?=
 =?utf-8?B?V0FJMElXRStwbTgxSGpGV3FQNXdCWkE1TnhTWEJOa2JycnIrYzh1NjVqNlVO?=
 =?utf-8?B?ZU13RDZFMnFNeTVXcXZRa3VaZkVPOW4vZjJ5b2RIcXBTb0VscFF5dUhmcTZI?=
 =?utf-8?B?bFNscjdPdm5SS0V4ek9NeHNZRC92UGRiY1Y3TnF2VnVYdTNFd3ROc3A5V2k0?=
 =?utf-8?B?TzdOeHJCL0gvSiswaWZkZk91d1ZsOHdPNEd1YTlmRkNLbzBRY2JtOWFRRFBY?=
 =?utf-8?B?RmlnNVN4ejRWSlpRYXVuNmUvVUtiYm1CRDFiS1pOZnZyTXlqenBpVE11RzZF?=
 =?utf-8?B?T2NlNWt4VmFVZTFWSlVlb3JSZVlkNkFFSmdOUVZjcy8xU294MmhRZXErYnJy?=
 =?utf-8?B?WWJ4NmVTdi9UblZXaElyL0c5L3dtVUpBcTk0em5aTXJHYkZuYlVSbjNKbmxk?=
 =?utf-8?B?NTBLNG1EUjUxTExFK1ZOOVFNR1NQeXhsL0lyemNqVS9wSS9uZ21Wcm1zNVB0?=
 =?utf-8?B?alBMcGZnNnhpQ3VzcVFwclB5VjZRTjM0dExYanJnMHNkajNkNE84K3pxQVBj?=
 =?utf-8?B?cmdRSW1wOEZYQjZSek02RG9Ea2xpNVVCdEdOL0NUZXk0dEJoQkYwY2krWTk2?=
 =?utf-8?B?anJ1SEpnb2xOaiswZ3ZDZkd2bHltL2pBNlVjRkZ1WEw1SmRDZjlwVHBkOVRI?=
 =?utf-8?B?WkluV3ZCa1g3cUhRY1JVd1kvWFRjOGh6ZTYyL3ZpY05LTFJoWkxOaHg2RzBP?=
 =?utf-8?B?ellKSzFueWFYUUd6eEx2SzZNaW1xbmFNR3JTT3V1UTZab0ZoZWc3dmEwWndx?=
 =?utf-8?B?VzBuN1N5RmwzTDBnYWwvaDNXbnZpZkJIMlhQbWg4ZTFQK3NVNXJ1WnJYOFhU?=
 =?utf-8?B?U2paMkZsSmUyemRvUFhxT2FPbFZlSWROekprSXhBT2diRUZiN2hnL1Zacm9Z?=
 =?utf-8?B?VTREY2U4SjdOeXdIdndCVVRCRmo1VlpiVEZSVS8vNnoycHpKdXdya21YMmpM?=
 =?utf-8?B?YkZEb0x4MU92enhNZnpKWVVJZUdqQWRmZXhBR1NJaVNLajh6enhuK0ZlR1pU?=
 =?utf-8?B?S1BMaGczMU45OG1lclNrSU9YejJ3Z1pmYk11aGtXakN4c1hrMERHc0ZSYUg1?=
 =?utf-8?B?N2puaVBrUVhqNFF5SWtzVEZ3d2VROU40djlNaXlmcjcrSHpCcnZoWVVEb2Iz?=
 =?utf-8?B?dG11V3B4djNRSHg0U2h3OHJLRVc1bE9yc0VIdWI0bTlIUUwvYkxLQUNWLzZa?=
 =?utf-8?B?YWE0eDc0aFZheUdmbFRrdG5NS3p6dVFtYVYxb3B6NTgvMzVka2sxU2V4dU0x?=
 =?utf-8?B?RUpvN2gxdlhZZHFqai9KRC9SZ0dPcjYvMjltYmpHYXZXZmxHcFo4RzBocGhH?=
 =?utf-8?B?Vk5POUcxdXdJd21pYTdVR1FCSXFzeU04eEtRS2pYNE9zSTYyNlM3VVBaSE9v?=
 =?utf-8?B?S3kvM1VYdFJsMHVpQ1BwWUNacDRoQm4wbC9LYkdJb0ZHUWJ2d0l3WHZZSjc3?=
 =?utf-8?B?WE1rQ3hHbmRFLzlmejF4NWRMN3NoYTRMYVpZdkF6azBkdkY4TnRMZWpFRDFi?=
 =?utf-8?B?WTZJdVFYOHpyR1dNQ0hXMk1xUlRVSzgvWHVqU2FROGpVNFIra2ExcSt5QWo4?=
 =?utf-8?B?NmlBaE5oaUltbEtaZGhZcUp3STVjbHpneDlsdExZeHhvMVdaVTF5Y3pjMGh3?=
 =?utf-8?B?S3VWUmcvYUdFVjNmalovbEs4SDFlTHBPVHV2ZnpwdEhhNnRCV3pCL0JyZ091?=
 =?utf-8?B?THEyUmEyY1Q4TWx5T1ArS0RnOVpzdkRRQW05TUlyNDByMnZYWDBDSjZaTHpD?=
 =?utf-8?B?cEpmSnRzS083dGQySVQvVyszY2xTWlJBWlNDTm5IQTAyd0x0T3BlZHNHb0Ny?=
 =?utf-8?B?a0hzeStQVUJlZlRTNlJxSXVkVlkxZW95dU1ReUZvQkFWeEdzZFByNHdNczZG?=
 =?utf-8?B?bkZIZk9icVk1OEhvSFVuNStYZTNvMzUzZElqbm5sOGlyQURSak5zNU80dWpV?=
 =?utf-8?Q?ObZiBzEWyC139sWcmzrA+VDnW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF76C43EFF959243A6B1DD298F76531A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 592aba0d-c707-4484-628a-08dd20bce56d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 06:09:43.1126
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C5AD6f+6J8bkvPA99R68027zAORSf7mPe9UH4VEHzsabRPBQ73eDZ8/DTpQcP6L+2kwH7O+4pHOPGEZX0AFdHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB8223
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_220953_761718_A43BB7E6 
X-CRM114-Status: GOOD (  16.97  )
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
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBNb3ZlIHRoZSB2ZW5kb3Ig
YW5kIHByb2R1Y3Qgc3RyaW5ncyB0byB0aGUgYXBwcm9wcmlhdGUgZW50cmllcw0KPiBvZiBzdHJ1
Y3QgZHJtX2JyaWRnZSBhbmQgdXNlIHRoYXQgaW4gbXRrX2hkbWlfc2V0dXBfc3BkX2luZm9mcmFt
ZQ0KPiBpbnN0ZWFkIG9mIGhhdmluZyB0aGUgc2FtZSBhcyBmdW5jdGlvbiBwYXJhbWV0ZXJzLg0K
PiANCj4gV2hpbGUgYXQgaXQsIGFsc28gYmVhdXRpZnkgdGhlIHN0cmluZ3MsIHNldHRpbmcgdGhl
bSB0byByZWFkDQo+ICJNZWRpYVRlayBPbi1DaGlwIEhETUkiLg0KDQpSZXZpZXdlZC1ieTogQ0sg
SHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lv
YWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNv
bT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyB8IDExICsr
KysrKy0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRt
aS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMNCj4gaW5kZXggZWY4ZGZj
Yjc3MzE4Li5lYjM4ZjRiNzY3NGUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfaGRtaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRt
aS5jDQo+IEBAIC05NTIsMTUgKzk1MiwxNCBAQCBzdGF0aWMgaW50IG10a19oZG1pX3NldHVwX2F2
aV9pbmZvZnJhbWUoc3RydWN0IG10a19oZG1pICpoZG1pLA0KPiAgICAgICAgIHJldHVybiAwOw0K
PiAgfQ0KPiANCj4gLXN0YXRpYyBpbnQgbXRrX2hkbWlfc2V0dXBfc3BkX2luZm9mcmFtZShzdHJ1
Y3QgbXRrX2hkbWkgKmhkbWksDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjb25zdCBjaGFyICp2ZW5kb3IsDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBjb25zdCBjaGFyICpwcm9kdWN0KQ0KPiArc3RhdGljIGludCBtdGtfaGRtaV9z
ZXR1cF9zcGRfaW5mb2ZyYW1lKHN0cnVjdCBtdGtfaGRtaSAqaGRtaSkNCj4gIHsNCj4gKyAgICAg
ICBzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlID0gJmhkbWktPmJyaWRnZTsNCj4gICAgICAgICBz
dHJ1Y3QgaGRtaV9zcGRfaW5mb2ZyYW1lIGZyYW1lOw0KPiAgICAgICAgIHU4IGJ1ZmZlcltIRE1J
X0lORk9GUkFNRV9IRUFERVJfU0laRSArIEhETUlfU1BEX0lORk9GUkFNRV9TSVpFXTsNCj4gICAg
ICAgICBzc2l6ZV90IGVycjsNCj4gDQo+IC0gICAgICAgZXJyID0gaGRtaV9zcGRfaW5mb2ZyYW1l
X2luaXQoJmZyYW1lLCB2ZW5kb3IsIHByb2R1Y3QpOw0KPiArICAgICAgIGVyciA9IGhkbWlfc3Bk
X2luZm9mcmFtZV9pbml0KCZmcmFtZSwgYnJpZGdlLT52ZW5kb3IsIGJyaWRnZS0+cHJvZHVjdCk7
DQo+ICAgICAgICAgaWYgKGVyciA8IDApIHsNCj4gICAgICAgICAgICAgICAgIGRldl9lcnIoaGRt
aS0+ZGV2LCAiRmFpbGVkIHRvIGluaXRpYWxpemUgU1BEIGluZm9mcmFtZTogJXpkXG4iLA0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICBlcnIpOw0KPiBAQCAtMTMyOCw3ICsxMzI3LDcgQEAgc3Rh
dGljIHZvaWQgbXRrX2hkbWlfc2VuZF9pbmZvZnJhbWUoc3RydWN0IG10a19oZG1pICpoZG1pLA0K
PiAgew0KPiAgICAgICAgIG10a19oZG1pX3NldHVwX2F1ZGlvX2luZm9mcmFtZShoZG1pKTsNCj4g
ICAgICAgICBtdGtfaGRtaV9zZXR1cF9hdmlfaW5mb2ZyYW1lKGhkbWksIG1vZGUpOw0KPiAtICAg
ICAgIG10a19oZG1pX3NldHVwX3NwZF9pbmZvZnJhbWUoaGRtaSwgIm1lZGlhdGVrIiwgIk9uLWNo
aXAgSERNSSIpOw0KPiArICAgICAgIG10a19oZG1pX3NldHVwX3NwZF9pbmZvZnJhbWUoaGRtaSk7
DQo+ICAgICAgICAgaWYgKG1vZGUtPmZsYWdzICYgRFJNX01PREVfRkxBR18zRF9NQVNLKQ0KPiAg
ICAgICAgICAgICAgICAgbXRrX2hkbWlfc2V0dXBfdmVuZG9yX3NwZWNpZmljX2luZm9mcmFtZSho
ZG1pLCBtb2RlKTsNCj4gIH0NCj4gQEAgLTE3MDksNiArMTcwOCw4IEBAIHN0YXRpYyBpbnQgbXRr
X2hkbWlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gICAgICAgICBoZG1p
LT5icmlkZ2Uub3BzID0gRFJNX0JSSURHRV9PUF9ERVRFQ1QgfCBEUk1fQlJJREdFX09QX0VESUQN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgIHwgRFJNX0JSSURHRV9PUF9IUEQ7DQo+ICAgICAg
ICAgaGRtaS0+YnJpZGdlLnR5cGUgPSBEUk1fTU9ERV9DT05ORUNUT1JfSERNSUE7DQo+ICsgICAg
ICAgaGRtaS0+YnJpZGdlLnZlbmRvciA9ICJNZWRpYVRlayI7DQo+ICsgICAgICAgaGRtaS0+YnJp
ZGdlLnByb2R1Y3QgPSAiT24tQ2hpcCBIRE1JIjsNCj4gICAgICAgICBkcm1fYnJpZGdlX2FkZCgm
aGRtaS0+YnJpZGdlKTsNCj4gDQo+ICAgICAgICAgcmV0ID0gbXRrX2hkbWlfY2xrX2VuYWJsZV9h
dWRpbyhoZG1pKTsNCj4gLS0NCj4gMi40Ny4wDQo+IA0KDQo=

