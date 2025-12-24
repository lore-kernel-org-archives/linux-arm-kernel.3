Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6126CE6B279
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 02:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3qtwzFg59I7gZD6ia/CZdyX0vt7aFxDbQdhn8SIUigs=; b=wBGc5qGep9h8+e9hb1Lb28DulE
	n51lQ+uhWTWQYep3QZzzrTtT3B0OX29Mdnr5aPQx9tISRtWol3A9y7cEKaBl5D5RKvQTWbWZ6nhvw
	Uzl9U5JizJtq/X8OVDLrqo/U9AGB84qivVr2QpxebOsQIwUtpkFnzdzMBbJzwmJW5MG2TTUVpQ9P3
	Uljj2mkKRynzLyyXhTCpAqnR+5WpqKaor3zjfpI1FUKYtqtGLYxHB1ESxeKMbp7MNc5HV70Ryzm2q
	vZJ6qWliCjwsNYNDrV9Vv+B/vtxmS7ZX2PlwTOTuLS00/gEOXFBYtQVCXS0O3Nhkl2SbOoGRcLksL
	AlYjbQ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYEUJ-0000000GJCH-05Le;
	Wed, 24 Dec 2025 02:20:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYEUG-0000000GJAv-2n3x;
	Wed, 24 Dec 2025 02:20:29 +0000
X-UUID: 1b68a2a6e06f11f08b17dd397dc63300-20251223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=3qtwzFg59I7gZD6ia/CZdyX0vt7aFxDbQdhn8SIUigs=;
	b=hb54VVBd+CaFfZR+wHBjmsozBdISzliHflc/SicxMm2ADAeJFYg5CS5aC2WphJm6A3qN/CXjK5ENqNNYS/Stb5vQBl1pgWtfRNvfyjIX32Ep6fEoD8FLWR4EoldaJETs+pXP+lJrHFjNqHGgElRJf/tSRfXk/Ifn42kLfsL5Dbg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:d5ef81f5-9a05-47f8-b498-59048312861b,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:5047765,CLOUDID:850b1b03-1fa9-44eb-b231-4afc61466396,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1b68a2a6e06f11f08b17dd397dc63300-20251223
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 385777626; Tue, 23 Dec 2025 19:20:25 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 24 Dec 2025 10:20:22 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 24 Dec 2025 10:20:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJaToZKnmnhNFKEVMewqnsXd9ubVipUNeogfEBGbch8kZht9S0NrjubfjHxWAi4JuIidfAJqaGmLnYNey6juUapKqq3g4FlkGK8zqhdCEd47rNS8aWLPk0NRbGwueMEPdkS1Jx8TekkVtoR5pS10ehaynhFUIgNJiLqnP4Yq/ItV8cvvczAKp8sMXwheK7Dfbmlr5kDG31BiUfcQE0yx3DO+G+s5E603wbnm29o9cae90SMnRwWi/o6e7/5yFjGleSMl42p0mELMacM/O8Pttlhu9amGfbSg/BOxQBbSW2m8RDdLlLu4KN4beebLuH64yOIG/UFmNbY7tGInwoAs5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3qtwzFg59I7gZD6ia/CZdyX0vt7aFxDbQdhn8SIUigs=;
 b=tBqP/KtgLtLjQJWI4Yd9g0xltPTrL+s6SE1RukJhq6x6cFclinNFvcNm9eFRIneApuvLGNPWNfazR1NqNXdqBHdeK2dayerhoTh1zGqIbimCEPA/SB+YzbczEzaMSPd2yWdGjvQGcViawWrRVpNT0kX+f+2r2pw5LzEykDRvueDK4kXjCqbCEZA5pSuiv8SNu0hHMKnzrHr7j/gWDApcTOKXzteeHqyozSVlZ2uw7oB5mN2dc+BLydkEmDn0OeUtQL6ccDcJjbcNfFzgeq6RNnIoMdJBh799rTfbAVYkIiGE2+hxks1MLGVDunobAdzXrZg3/6bDW6TeWixq6I0lmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qtwzFg59I7gZD6ia/CZdyX0vt7aFxDbQdhn8SIUigs=;
 b=r/mtevSsUCkpBPtCbasr5OT7aRHPS6Npx6o25sllhI9x1YdmwdvhsKhwW4kXFFaNjl2gZD/nq572bUarE6i+I9/aWzrQhLaBRfnaqD8K/GRnpm2N29aqBG5lJkCyAoTVIzGdSlRyGiMqk4Xr6V8yNylcK0vobtMgjok8wRF0pSY=
Received: from SEZPR03MB7810.apcprd03.prod.outlook.com (2603:1096:101:184::13)
 by KL1PR03MB6899.apcprd03.prod.outlook.com (2603:1096:820:9e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Wed, 24 Dec
 2025 02:20:19 +0000
Received: from SEZPR03MB7810.apcprd03.prod.outlook.com
 ([fe80::2557:de4d:a3c7:41e8]) by SEZPR03MB7810.apcprd03.prod.outlook.com
 ([fe80::2557:de4d:a3c7:41e8%4]) with mapi id 15.20.9456.008; Wed, 24 Dec 2025
 02:20:19 +0000
From: =?utf-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"airlied@gmail.com" <airlied@gmail.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "maarten.lankhorst@linux.intel.com"
	<maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
	<mripard@kernel.org>, Nicolas Prado <nfraprado@collabora.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
CC: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
	=?utf-8?B?QmVhciBXYW5nICjokKnljp/mg5/lvrcp?= <bear.wang@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?UGFibG8gU3VuICjlravmr5Pnv5Qp?= <pablo.sun@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, Daniel Stone <daniels@collabora.com>,
	"kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [PATCH 06/11] drm/mediatek: Add plane_colorops_init() DDP hook
 for OVL
Thread-Topic: [PATCH 06/11] drm/mediatek: Add plane_colorops_init() DDP hook
 for OVL
Thread-Index: AQHcdETz8gxuVbMf9kSn3uHshcXMAbUwDycA
Date: Wed, 24 Dec 2025 02:20:19 +0000
Message-ID: <5bc77576fc6e77f9f87cef27b42b67e2c2c2c9ac.camel@mediatek.com>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
	 <20251223-mtk-ovl-pre-blend-colorops-v1-6-0cb99bd0ab33@collabora.com>
In-Reply-To: <20251223-mtk-ovl-pre-blend-colorops-v1-6-0cb99bd0ab33@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7810:EE_|KL1PR03MB6899:EE_
x-ms-office365-filtering-correlation-id: 17e573e9-7962-4bf6-0441-08de4292fbf4
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?dVFibGxYYnFKNGc4bGc5cmo3cVZQTWFMSWlxZTZISlNKcExzSjRWdGQ3YmlJ?=
 =?utf-8?B?cHg0WDVCdWpZVWE3bUdnVG1yRFppME9qTTlHbzJ1L3AyTmZYcTVDU0pvUFc5?=
 =?utf-8?B?MEhQcVdreWNLU3E3WWM3cDVXTDkwSm9WRG84N3hXdFZzbHllN29GeHhlalNX?=
 =?utf-8?B?TjlIQ0pBMVNUQkUzT1B0dGJkekZRRmpMMUo5dEVERUg0ZWFBc2Y3TThrSnJZ?=
 =?utf-8?B?UloxVWRBVnNLYU9obG5oYktIaVl1QjFHTC96WllvOUVGaXJUS1RIREJVTlJK?=
 =?utf-8?B?YnZBdEh3VlgrOFlNckF1Kzk1YkVIS2tEdnU5OFdWT0MvWkhkZVQ3cjhobGd5?=
 =?utf-8?B?TVFXV25xcW44YzdSMzVBSXh4RjRyUUtFdGVFcUtWUmlFS2JYS2hTTGRRaVRh?=
 =?utf-8?B?aXpKeUJnUTV5TDE3REVFdi9zV0YzaWdHazU0dmZHVlhOd3QzRHN4QW5OYklU?=
 =?utf-8?B?UHZZM0ZZaFpZSU5oZ3hpVTc1L3g2aTNTY0tqWGwvdHQwaVZlTkZpRzlHdVpB?=
 =?utf-8?B?d01Vb3JuSU9abW9YVzRrcW95Y2JDcVRHUTg3Y2w5TUZYRXB4M3VFMGlaWkZ4?=
 =?utf-8?B?RTRYWkhTbnh2UWZwc09DSTRYdkNML0FCTlpBRG9wUG9uRGxscENEU3c4bHJi?=
 =?utf-8?B?RE5tVk5vNFhlRmtEdTFVOHFGYWdZQTNxcUljamZkQ0NwOVc4SW5IRFlMRkoz?=
 =?utf-8?B?VVorUnVSdUFiQ1R5L2NVSWV5aGFzTm1VS21HK3BnY2pDamgxYXNZY2dzSHQy?=
 =?utf-8?B?UXl3QnArQmxuWjd6NDBKdWYzU1B2blV2RkZ4WlBveWY3TEsrSGx4SUQ2TmxP?=
 =?utf-8?B?amhTSzIvV1dOVVU0Q3pXNm1RWUlQQTN6UitRNlQ4T3BRWFk4b2JpUmlJTE8r?=
 =?utf-8?B?MDQ0cHUxdWozVnBsUXc2Z3JKbmR3Z0c5b0JOTDhjcDlRUU5qaGNTTnZraHRE?=
 =?utf-8?B?K2hVQ21HVlZZUmlWQVNteXduVlgrcHZuVC9iZjZURUxaZnFVd2d5SVRLeTUv?=
 =?utf-8?B?Q2pVTmJkZ3NvOEVHelVGMGt6djY4eEpCT1VoU2JwZGxJTDludWVNOExTK2Jo?=
 =?utf-8?B?TmRLcDh3Ty9JSTNUT1IvV28yVktFRUxiK3RQYno4WHhaOUtCbWRSdjdRWEVS?=
 =?utf-8?B?L2g4WDNGdTh4bmlDZkVuK2s1SVFRYThMQSt2dWpxeE9ucmtnam5xbHY0WnVt?=
 =?utf-8?B?SWF2bGZVVzJKVVBiMlZCUWhhOWFUdFZ0cU1SbXFvNEZEcGFJUGIvbzBkMDZG?=
 =?utf-8?B?dVNKcXlCRzFFb3Q4bGdvbzFKOGh3Y2lOWXJmRFRlSUVsdU1yL3lEK0owaFJ0?=
 =?utf-8?B?OWNMSDJKdXFtbXg3bEFvMGhqQVRjNElkL1dZVkpEL1NrNGoyWStiYUI0WllJ?=
 =?utf-8?B?cDMrL3ZnNFNVRW5UaUxYQ3RmRFpSbHFUMm4rRFVYZjV0YnNXbzNnNFdBdGo1?=
 =?utf-8?B?SnhmTkZuZ0EyNHQ2U3ZPeTQ5b2NRTklVL20ra1pXV2dYb29oeHBpQ3Evb2pL?=
 =?utf-8?B?TzBFOHNyemI4Ync5TkVLek01dy9SU1pyZjBydVF2TVpFUVdmeWd0NnZ5b3lQ?=
 =?utf-8?B?cEx4dmpRTG5VZ2Q0MWlTU3h5cDF0eFpNSytZMVF1Q1M0enc3YUt6SGlsTnM1?=
 =?utf-8?B?cnVGOXdFeVFsV2NwdDNtNmpQQVQ0U3JQOUt2OUtvMnFuQXpjN2dzRDFhUkR2?=
 =?utf-8?B?VjNHZUhQdWNwMmRHSkRYakFZY3drOHJYNEhNTGxnd2RmYzVDZ29oTEhuSGU4?=
 =?utf-8?B?S2NmUWdGWWtGejFRMGdUdU9SbUJGa25NVjJCZ2h0ckFJdmhTV1JvczlXaUxX?=
 =?utf-8?B?ZTZ1N3VpZkVXNklPQUEwUVlNTTlSMlJGdS9zSkJuZEdRcXJVT0FwdTVnNFVF?=
 =?utf-8?B?clFEWFJ4bjBEWXpQdjc5VFRMV1cwVkpHaVB2ZC9wSm5qc2hESUtnTnQwSVph?=
 =?utf-8?B?NTlIeElST1d6Y2F2QU0xOEFMN0pGMit3Y0xUazdZVUoyT3JCQ0FMelFnT213?=
 =?utf-8?B?enEvNEJ0MTArQzJsNE1GTEVaeERFbk1ENGlDL0ljaFdxaC9rVVhwMWtNTmIy?=
 =?utf-8?B?K3c0ZGtqdksybTZxUkh3YTNwb29OMWdKc0tadz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7810.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cThMMC90eXRzcmdKUStsbjZ1Uk1BQXQrUEdFSzI5eXJJdUljQmFVSERDbmJM?=
 =?utf-8?B?V2tWb1hISHYyYlY5OWo1cDZLVjVVblhldEkwVjJMOVZmNnJSZmtIY2FwUXYx?=
 =?utf-8?B?QTVuMUFGd1hUYlhKa1EveEhxOXNYVVlrbW55M1ZXd255R2E2eU5uaytWdUZu?=
 =?utf-8?B?N3JMamNQdmk1WXdnYmdiVDRiN0VGU1p0TzdjU3dEZklScENQQWRydUo5blZT?=
 =?utf-8?B?TGRFWGkzSkdKMkhtSTBpbU4zUDZSaXpZUGhrZEw1RHpaemcxWnV0aUh3K1Zn?=
 =?utf-8?B?RUFrWDJrL1M1ZStPbmpaT2wxdEdhRVdtcjlNL1BaOElJUVIvMXk2RUVzaVJZ?=
 =?utf-8?B?QWhacWhQNlZNYUVkcGxqQVlneUpXd2dNWGtLNkpFank2NmZQN2ViWjF1eGR0?=
 =?utf-8?B?bWRmYjJTWGQyZTZDUTF2d1p1bEVNZFZUVlFXNFcyVmlZUVMwZ21FWVE5Vkc3?=
 =?utf-8?B?cStZMnZBV25Md1V1VWlFWEVOTisxTGVWTXEva0ZDTGFLK2dNai9GUVB4VHRV?=
 =?utf-8?B?Um5EYndVYUFoSG5YRXptcnBxRHpFNTE2UEY4czRuS1R1OHltMlJYUFJlazQr?=
 =?utf-8?B?TzV0bEtuYVJxeVZzTzZiZ09kd3FSa20zcHUwQnlQWGhIeVA5NHllSFVDK21V?=
 =?utf-8?B?ZnF6NmZwVENIeDdwcmdYUjl1WllyTFZqNXF4dDlmbXVBT0NtQVJUOUllWEx0?=
 =?utf-8?B?SFJieXlRcnRTNXdWLzdRZDErcjFBVnppYWl2M3hpYlV4WHhuZnhiY1Rhc3d4?=
 =?utf-8?B?cEQ4RmlWakdTWUQ1S1h1d2U0cE1mU0gzQ1l1cFhFaU4rRnNhS0o5UndJZGd3?=
 =?utf-8?B?bXo5ejdGaCthMkRTcm13NjJveS96TmhpbS9sZDE3aU5GYS81YmRRb1U0d05U?=
 =?utf-8?B?SVhSUnl2UVdBaUttZzFZb00wWDFveGtucGpwUmNsVU14cndHYnZrK3pTS24z?=
 =?utf-8?B?NUJGSlovWHBRWFlQVjh6YXFnN1l5K0RnS3J2VkJBMC9wWnl1M3VLL1Q1S0VU?=
 =?utf-8?B?TXdSSkM2Uk1qd1Nnc3pzNExQMURsTDhwd0o1cXp0VkVobDBjZjMzald2Wkdj?=
 =?utf-8?B?Tm14aEsxYTFIN3B4Wm1xaktpM1VQWkZZaW9DaXlyaTJsRFF6TzVONVFsQ09C?=
 =?utf-8?B?Um4xR1AxTTducThyTjhFTFVnaHRMUWhDa1lwd3FJSlRzclV1WmMrd2F4ZndK?=
 =?utf-8?B?UzE4Rm9waUh5NldiUi9DNUhJUVk4aVNPSTNZNHk0RmxONjBrVjB3MUJYS0NQ?=
 =?utf-8?B?ZWpoM0p3R1RqR2x3d0VIYnZrNEh2c2RQeU9vRGlKUzdVUkJKSG4zTXlERkZW?=
 =?utf-8?B?RmUzdnl0ZEw2RkMxb3pnWGhqR2s5aURjRTZXeFJ3MWFHVXhNMjhIbUIzbito?=
 =?utf-8?B?TUliVXR3dmN6MEdVUDRBNjhGWDJwcklYWDJ3U0tnS1YyVkkzUXpZZW5Pckhh?=
 =?utf-8?B?b2h0YTJ0M01jTDhhOEVzcVNOTE9vYjFSa2praHVESUhZbHBPeFloUjVsNHNS?=
 =?utf-8?B?V3pMa1ppMFg1ZnlvRFltTUNmTmJDU091SmtxWS9nMko0Q3dNRGVqcDhaSEt5?=
 =?utf-8?B?WVp5czNrRTFJQlRCNVNDUW5TbnhBOGNxMjZUTklqem1tbkJjTnJUdjVJWmVD?=
 =?utf-8?B?R0FZUHNKVEdxeEtVVWF1Qk41ZjVSQjNuak9PK2ZyTlgvdkVodnN6UHB5WHJo?=
 =?utf-8?B?Q0VNZHB0NUQ0MG5XNFR6NUtTUmZaaTl1QkxibnBaZnAzUjRoc2J0ZU4ybUpo?=
 =?utf-8?B?Y1pJQ3loUEowQzdxYkFRRGFuMTNndVMwTE5LUkxzalhhZkc2L2xwQ2tOeDhZ?=
 =?utf-8?B?a2pVMlFiblNBWnpUR01uTitsTmhzR0UzdEduTnJZVjJNWFkxUzlDQkNlSlp4?=
 =?utf-8?B?R1J0QXljS25SWlY1Y0Rid3pXOGl2MEh5bDNmY1ZOOU5BSmFyV0Qyb2dFcmxn?=
 =?utf-8?B?dWw3RDhNWDZkRWVFR1BMM2tURkZneE1DYXRqWWtxYksrODNJS3JlRzBlS0Nq?=
 =?utf-8?B?TTJRWTJGb3pheit6dFk2cXRjak80WkFhcFU0R0pFNXNZL0lWczBCTXRuK09U?=
 =?utf-8?B?bzMwZitGYnJCd291WmdzcDFjVnBzdmhiaVF2d2Eyc1I4c0Q2TnVRN01jVkdP?=
 =?utf-8?B?SjJKZTF6eG01dmpLa0xrRVdnT2JGTFRnMzNPOUdlc2g4L09xS0RJenNOWXVQ?=
 =?utf-8?B?ckVEWFRQVUwrMEFsNXFOV08rWUR6bWVISGlBY2dDZ3UwZDg4VlEyQ3BIdjNC?=
 =?utf-8?B?dnVmbWxNRktxWVBDNDZ6SEtzWmtYS1JXRnFNK1d3VklodUg1RWc5WjRZRE5G?=
 =?utf-8?B?THJtSzNrWU13ZEVERWdFdVZJa09WbUxIQjdYUkE0TjU0aVBpWjlFTXd4cC9W?=
 =?utf-8?Q?FcYMkpjWRD8S2e34=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BD46C029ED48A340BC8D6A2108A9E738@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7810.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17e573e9-7962-4bf6-0441-08de4292fbf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2025 02:20:19.2539
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1hVP71h4GGhkLzz/gOimzopqTB4w/yAqBvqV0VbSr3RA1EZ+YJlVOuE+OHtDFJ6+LuBXAjCUjuXtjFhrRvsYdSWb9jLmfimCEMc5QdYSuDQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB6899
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_182028_711068_AB6C5A5E 
X-CRM114-Status: GOOD (  15.82  )
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

T24gVHVlLCAyMDI1LTEyLTIzIGF0IDE2OjQ0IC0wMzAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToNCj4gSG9vayBPVkwncyBwbGFuZSBjb2xvcm9wcyBpbml0aWFsaXphdGlvbiBmdW5j
dGlvbiBpbiBERFAgdG8gYWxsb3cgaXRzDQo+IHVzYWdlIGJ5IHRoZSBNZWRpYVRlayBLTVMgZHJp
dmVyLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFw
cmFkb0Bjb2xsYWJvcmEuY29tPg0KPiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RkcF9jb21wLmMgfCAxICsNCj4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RkcF9jb21w
LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RkcF9jb21wLmMNCj4gaW5kZXgg
OTRiMzU2ZGE2ZGU3Li5lZjkwNmIyYWZmNzQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZGRwX2NvbXAuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RkcF9jb21wLmMNCj4gQEAgLTMzMSw2ICszMzEsNyBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IG10a19kZHBfY29tcF9mdW5jcyBkZHBfb3ZsID0NCj4gew0KPiDCoMKgwqDCoMKgwqDCoCAu
Z2V0X2Zvcm1hdHMgPSBtdGtfb3ZsX2dldF9mb3JtYXRzLA0KPiDCoMKgwqDCoMKgwqDCoCAuZ2V0
X251bV9mb3JtYXRzID0gbXRrX292bF9nZXRfbnVtX2Zvcm1hdHMsDQo+IMKgwqDCoMKgwqDCoMKg
IC5pc19hZmJjX3N1cHBvcnRlZCA9IG10a19vdmxfaXNfYWZiY19zdXBwb3J0ZWQsDQo+ICvCoMKg
wqDCoMKgwqAgLnBsYW5lX2NvbG9yb3BzX2luaXQgPSBtdGtfb3ZsX3BsYW5lX2NvbG9yb3BzX2lu
aXQsDQo+IMKgfTsNCj4gDQo+IMKgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZGRwX2NvbXBfZnVu
Y3MgZGRwX3Bvc3RtYXNrID0gew0KPiANCj4gLS0NCj4gMi41MS4wDQo+IA0KPiANCg0KUmV2aWV3
ZWQtYnk6IE1hY3BhdWwgTGluIDxtYWNwYXVsLmxpbkBtZWRpYXRlay5jb20+DQoNCkJlc3QgcmVn
YXJkcywNCk1hY3BhdWwgTGluDQo=

