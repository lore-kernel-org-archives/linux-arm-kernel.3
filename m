Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F13D3B7F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 08:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ibntHFeX8sUWX1PKl8hmUYf2t80LiaahKCUqOjZHa6Q=; b=KtbBCJr/qsbS/QWQ6CqSDl3vrC
	W+auzAbGkRtqp1brDYzEX3DGJTW8D22jwNTnz5kjT9agPs1mawtX54OqGbdkEwi9Cp5nYbiq1D3j+
	y9iqNoH5vyeud4c22D51JklXPRRdBpS+3/U4yL4i4VGKM8cYc7dCWJteHPFzAnCUDvkEYSBbFTaVU
	hkOUZ0NXGynGQf1SUCRWZjratb23u/6TZuywlDpyTZyhicJp4NGoxczbb3qIjB5ANarIqKfi5xYU4
	tf9/FLU3mPtWmMEEMRUZaFjIQHLpgpfzW87CXLEwwn/tU38Otv68WEisF2oJCqtokwGxqw2/4mDML
	c1cbZJNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFUbT-00000007PUS-0zQw;
	Mon, 25 Nov 2024 08:37:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFUQH-00000007NNb-02Xc;
	Mon, 25 Nov 2024 08:26:22 +0000
X-UUID: f0b77198ab0611ef82ff63e91e7eb18c-20241125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=ibntHFeX8sUWX1PKl8hmUYf2t80LiaahKCUqOjZHa6Q=;
	b=enQBfai8X9C1nN/cA7Yyc+92tEGZAjlJ78PUrSiDIWbgmh4FChP+ZtMkfCfQ/nXNkUozxeZpusTUO4fUPHe03+xfFPr4jk+B2Qv+VeLNTt2TESnTzY9fNufzgV1nXJLoNKIrYe1ZuZjmK0iAmEi5wLTRGoZgd8qnpDInkmQ+Er0=;
X-CID-CACHE: Type:Local,Time:202411250114-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:5be865b5-71c4-414c-9ff2-934959aa3199,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:7bf758b9-596a-4e31-81f2-cae532fa1b81,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f0b77198ab0611ef82ff63e91e7eb18c-20241125
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1789983026; Mon, 25 Nov 2024 01:26:16 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 25 Nov 2024 16:26:14 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 25 Nov 2024 16:26:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xv6vBkuuTVP9zWv1r3SXG4hf/RSZo97Pp8g5xOF6LWYfAYrus4D7+DDSz1iKEhBcxy0aAi88Fjr+FVtdXGM3VxOpnfUpcMc3verqM6utBVpwLnGcatbpYJ6zwRuLR6L8V+SwIVp1p7+H+dkaqg3YVTN9cqGL+LxGEOS805biUNABVxcJQcSIbPLX+j8yVIpJ9zEr4RmHp+8Vv7rsUnQ7Wmu2C5FchcuLR6PjvvC/n70PPZeUAFqgx9Twp6VWyRyrImU1VXmapm3sdFMEwxFZmiWHT3pDAbgk1rHUM3llJ7opw5t599Rit0MnyYlx/uU3z0uyP7fBB65wKaabmrpqtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibntHFeX8sUWX1PKl8hmUYf2t80LiaahKCUqOjZHa6Q=;
 b=LRuW1885MXTKwNG+izpO2JQvJklnn0XBiYNqscJZcTpRH1I9OQPPj5L1SGXg7fuJWFIN9B36YhUBnbwTPGPZTomwyd4v8hOkFsCdZcejxW7sG2FQo/C0EbfB1qHOg3fKmH+P/AK5FWSWzIUO/S65ofounrpmfe4EyiSwcRUHeBmQgreIDrmY26aD8SNur3l/Gat/4jLsUDPunGCvEBa2N2BpLBCZsEYzX/kheQabFYKIdejdiMoF7F7G4ob3fGfpkJlwflHl6sJ29EabUsE/7RfDax5isnoOeVXgsDxvXeBCAyf8iJpRLXbZWnJLvRN7YZXtYJIOgfjdbXwGToBCxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibntHFeX8sUWX1PKl8hmUYf2t80LiaahKCUqOjZHa6Q=;
 b=IloKhP1dMKja4m+KsBDQzNjW++YydwSdlmh658w8xX7Cv2Qfg5znXkASAc+XuO/BBOmRm3pa/cO0uluW2h/QLuD66XYLALcq+ADOAJzc7y/0HEzOy4ESMJkWlmz6ovQvdROavSQ8FGppQ44UT8a5BvxYAjwkFQ1mFwKracFWjXs=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB8534.apcprd03.prod.outlook.com (2603:1096:405:6a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Mon, 25 Nov
 2024 08:26:11 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8182.018; Mon, 25 Nov 2024
 08:26:11 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: Julien Stephan <jstephan@baylibre.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	=?utf-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "fsylvestre@baylibre.com" <fsylvestre@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"pnguyen@baylibre.com" <pnguyen@baylibre.com>
Subject: Re: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Thread-Topic: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Thread-Index: AQHbO/Orh37t76qSsU6WSMvGDnK0HLLC75+AgAAW2QCAAAOEgIAEpXQA
Date: Mon, 25 Nov 2024 08:26:11 +0000
Message-ID: <5ae9845164c6f7ef7d19693eeef3640a8ebc430b.camel@mediatek.com>
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
	 <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com>
	 <85ab1984c04b1eddbea71006ab5d95cb4333d838.camel@mediatek.com>
	 <CAEHHSvaEzCGZt3GpKBNDGUphetR7JWfJ7SZfvAU=O-3M4WZY7w@mail.gmail.com>
	 <1136391c4cf4067a4cac77da8490e1e009808b8d.camel@mediatek.com>
In-Reply-To: <1136391c4cf4067a4cac77da8490e1e009808b8d.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB8534:EE_
x-ms-office365-filtering-correlation-id: a385c140-3875-47d8-6e67-08dd0d2ad184
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Um5wQm51c2M2c2ZCRy9XUU5pLzdXS2d5V1E1Mk1sa0x3Y1drOWovdXorU21F?=
 =?utf-8?B?dzRTQlU5VmJmLzZkMWl6c05aNGcwS2twVkJ0cWtOZzNuSS95eGNnYm0vTW1s?=
 =?utf-8?B?d0tkK0dWWndVbVc1ZGNoR0l3K2ZXd0V4R0krQ0dZV0NWaFZ5YmtKUXNaeGND?=
 =?utf-8?B?Z2JyOFlubWQyTFYyYi85UWZsOHNlUHFUdEVScEl3WXk3OURxWjE0MkNIVUJ2?=
 =?utf-8?B?RjUvTHlvdS80ZjZXSlJBRmF3eHU4YWlpTklYcjJLdTA0MUtWcmxNbzlVb0lS?=
 =?utf-8?B?cVVydlhhOVFvNWVJRkhLczhOWk1ZRUR6YUVKVjZCVytFdjkyMnZrNjJkUG8x?=
 =?utf-8?B?ODFZbVFYdTQ2QkUrdmhIMWd2T2FCNjh6Y0Q2RXZ6L1AyS0JtbmI1TXZORHp4?=
 =?utf-8?B?ZjFMaUtHM0JnWEV6aEtsYURGMkRwb1dUd3dTUDdZdlF1Ty9ONFNXZ1RpdWd5?=
 =?utf-8?B?Z3BMOUlrYTVja3JGN2hXeDNkelRxN3E0Z1loOC9ZNWR0SlZWMHM5SkRaRUJj?=
 =?utf-8?B?VXFRSkM2YzZBQ3p3cGxlcUZOTUZZSTcvcW1pTndPNzdVNEorbU1mVEVyRkNE?=
 =?utf-8?B?dFRveFZDdENDTm1TSFVGRkEyQzd6VjU3VnB1Tlhqd1h2SUN1cVE5Y1I4Sy9Y?=
 =?utf-8?B?Z09LWU9lVzZiQUlyR3pyajNPZE9oaFR5Q1ZWZG96ck1xRE9uaDA1YzZUUUhJ?=
 =?utf-8?B?cnNkRUh3RGszZHBKUmFnZUovM0tZMEFxQTdQQzNyaGd3cE8zSFFkZkZ1ekxI?=
 =?utf-8?B?TFphRmwwNTR3K2xhVm1tZ21OVmk1YUNvUnVaNXU2OE1HUXROZVQrcG9zR2F0?=
 =?utf-8?B?RVR5UWhKOTRSbXVoN2FueTArcWhVaTFSWCtvcjA3WG1lMkhQWnhMeVFQKzV4?=
 =?utf-8?B?N0h6MGpEcjVYdnlNZDI0T1JrYlp1WU5KeXo3VWFIaTg3bzkzbnBsakxLSUdr?=
 =?utf-8?B?NWRyUmEwb0o5NWZLL3hzYlAweTlzNUx6MXY5cnBiMnIzakVWR0xtL08rTFQ2?=
 =?utf-8?B?enBYQzlkUWtncFFrY1ZpTDZHNkt1SktOMHlhVlc2ZzkrNXpscFJIckt4ckpV?=
 =?utf-8?B?NnpZaTR0emhQd1FKT2NDeWZLOFBkSHpBZmFxcmtJUWQ1d05CcGd3dkdtMkVC?=
 =?utf-8?B?NEFKSUxUdmVRT1gzQjBUY1p5UTF5Yk4weGlWUU9GbGpJVHRmQjVFNGhLbVVa?=
 =?utf-8?B?M1lxVVVORVlCVWlOOThBNS8ra0syUnRsSTZqSE9QZEpCMUltcGJmR2daaDRt?=
 =?utf-8?B?SVRTMWx2WUh5empic2xiRXV1dU0zN3VhLzFVRTkxRU1DcG5EVEJzNWZZT3Vo?=
 =?utf-8?B?bjVmZjErRDdlNDUvZjJDN3JPNWtDQWc1S0NPdzI4NGZqSWpzeW9zS0VEVUt6?=
 =?utf-8?B?Z0orL21rVmdyUmw4bEpNQ1dQL1dFRmNUTHBnQzVKV0o1R3BxOGVFOGpqaVg5?=
 =?utf-8?B?czlhb2tYTWhnbEJzeDZNWThRanBZTTVYY2JpdjNyZ1l6OUkvaDB1anhmVTU0?=
 =?utf-8?B?QWFYWDc0L3dBYXpIdWRBWTR1dVhMS3ZBclpCbGF4U1gyMkdCcTFVWjhicmo5?=
 =?utf-8?B?VGdjb3lZR2xlaXkvUWNpS3FrSVVyMi85TEtoYzFzd3JrY3NRNHRQTDBuYkxl?=
 =?utf-8?B?TWd5MHlnRkNoUVI0M2w5a3F6cmFsOUtHTU55OE83U042ZXh2MzRLdDYxTndy?=
 =?utf-8?B?NklpTXRpSS9Mc3dLWFp3UzB1ZmttMS9QbElNM05IekVHZHgvdEF4MzRta2FB?=
 =?utf-8?B?WDg2c0c4V095STVvdENNUmZlb1J2NjZRalFFTFFvamYxUFNkU3RyRFNHWjBI?=
 =?utf-8?B?L1VGbERMSDVjdnJwTVN0YjJ3OE9mMEpUemhuWDZHM3dCcll3S1RwZTFYM0xr?=
 =?utf-8?B?VDJNeWFCTmhxSnVNMGU1VmlHUjN6amRWNUpaWnFVWWdyb3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dlZnQmR5Q2JJMldDMitVbm44bFRHVyt3Z3N2bGxBc2tEclYvWkxuRzFHc0h4?=
 =?utf-8?B?Wlk0VkxuYmVDamxGMU5zWm1KQ1VYS2ZvVDh6akkrV0V2aGkvRVI1b3VydWZp?=
 =?utf-8?B?eVB4N0lZeVdBZEd5YnlnZlY3ZnVKWDBDUVJpN3JCVFdBckpsaldaWDhabTNX?=
 =?utf-8?B?dDhyVmduQW1VbldSMnQzaVNXWit0T0NDVXJMM0c3dzhnZUV0N1VWOFJxSjFa?=
 =?utf-8?B?QTV0dHVjbi9qNnl3UlRVYUphdWVjanBHejJXYmFwWXRBMFlZTmdIYWg4MDdW?=
 =?utf-8?B?RmpqNWpubmhCcGtacFpvWmZjMDQyZ3hTSzYvY3hxTUcvMTBLUnVpU0RYN09r?=
 =?utf-8?B?clI0T0Z2c2hUeEg5ajVNa3dxZW9CcFVGQXZkVnJ2N1RmclFrNHBXRm9NU0pG?=
 =?utf-8?B?dkRUODlhazlJZW5kajhLdndhWUpYYVpLbktPbFJBbTk0WGV4KzFiVkZVRnJK?=
 =?utf-8?B?L1NaRXA0M1lEY1ZYWXUrT3dBaFJVbEZiN1dVVVREWjhPNDd3MENacGRraWl4?=
 =?utf-8?B?Ym54QmxramUrcFVBbWpLRzdwbVZsTnp0WWxJcndtZ21jcTBDRmp6VDEyQjZs?=
 =?utf-8?B?MUhxLzhHTko1MGhacy84MkFyamNHa1ZvZGNoWWZLOWhlZWdkSDVRZUpxRUQ5?=
 =?utf-8?B?UnYwT2E3czlkYWwvS25KUW5hcDFwTUtaV28rbjJJQ0NDODQxb29kdUJ4SUFz?=
 =?utf-8?B?Z3BaUmZrbFVBTXh4OUhsRUZrSE1MWFZUK2o2TkQ5Vys1bEZHeHkvcWl0K3M5?=
 =?utf-8?B?TDVJWk40WVMrZ3ZUWS9KclhISVkvdFpwQUo5ckJLZWl0ZDdGYXMzdzdtYjJM?=
 =?utf-8?B?SW9NMjRtc1JTWHRKUUdnSk8yQW1qVnYwMll1dm1tUXFxQksvcXZPbmxtL0l4?=
 =?utf-8?B?UHVUelRHNzhkUDMyTHhmMGxkTlBkV21qMjR5UU93M0hmQ2YvT1ZlcWlhZDZE?=
 =?utf-8?B?bjV5NWJLbHZ0ZDM4U016RFlBclJXR01ieGszUHV2QkRLUExid25QSXM1U3lB?=
 =?utf-8?B?cTNmWjkxRHVETkZKV0hLdzhkSGRqQWk0RGM5bVVkMmY1dlFCTHZwWmR2Y1Jm?=
 =?utf-8?B?aW1naXZWaU5WRnR2T0syeWk2REpsenlVd0I3QXU1NStzNzVPVFd0MEwyNXdS?=
 =?utf-8?B?cE1Zdi9kcGVJRmFMZVBMWXhMVVVJZWdSRDF0RFI5ZFdTM05oNnJ1RHpydVdt?=
 =?utf-8?B?VHY3RjJmS01YVUQxYVEzM1JHa1dqL1V4Y0ZBdG93aGtxVk9yc1ZleTc0Z3NW?=
 =?utf-8?B?UWdZdjd6dGRJMklyYWRlYVFDVHM1dmtFcG1hd2N3V3Z5SEhNbUh6TG9qbjhl?=
 =?utf-8?B?QVhlWVNjYTlJbkVRdnhrMjVXRUZsTjYyOHZ2QTN4SnAzTWdKay9ZME0xSll1?=
 =?utf-8?B?NS9Kcm9RL094RGp2NUE3ZHA0V1kzNE9Hb2RleG00K1hWNE91TkRhTVFsNGpS?=
 =?utf-8?B?bFhmSkZxeHBRK1Z0ei9neGdVN2FJN1c2WmxlcmNpUTRVMy9wQmNXaDFYQ0dL?=
 =?utf-8?B?MUpJbytvNlB0NUszTWUwMmVVbGs5WXJWNFVhREZqNDZkY09jdm0vU2FSQWMv?=
 =?utf-8?B?THl1RDdnSDc3S3k5V2M4emgzNEVLa0hhM3I4c2VpaFpUMzNER2VDT0JlY1kr?=
 =?utf-8?B?d09JNjVDRTlyc0s3YmFSVVdEYTBEZnpRR05lVm04ODJvWE1XREFLLzhqczc5?=
 =?utf-8?B?cHBRakxpUkRDSUhYMnAzSkcra29RVEJOd1NLU0c5MUtuT2lzQmloQXNmbDlj?=
 =?utf-8?B?YzlzM1FxY3k1R3FsNHQyZEtka21QOU5wSGgvbm9UbXd0VTYvM0lSNTdUbDY1?=
 =?utf-8?B?K3dZcjJxMjBuMGwxbnphY2lyeWptWEk2a2NIaS9pUGxYVnVUellZS0pMeWtW?=
 =?utf-8?B?Y0c1RVdIOEczZGdqWHMrK2xIZTBkaEFHWDlYb1BJcCtkQkswejc4NEJ1UDY0?=
 =?utf-8?B?STQwN3E5VHFwN1lFdTVOL1pHWmd5emU1d2RSdFBETklLdUZET00wUzdVcllw?=
 =?utf-8?B?TExjYThuV0tWZk42dFR2c09heUJNNnh0cmdtQ01ScFlwMjZValpKS2Y1dzkx?=
 =?utf-8?B?N2dNcTdOVUFGQnNHc2Y0TEtKaTE4SlQrYnJMOC92ZGcxQjRQT3c1QVE1MURt?=
 =?utf-8?Q?AWPTfO4q6RZyfe+jgoN3IPJ2x?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F8FD97DC63C6404A964611569552318B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a385c140-3875-47d8-6e67-08dd0d2ad184
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2024 08:26:11.0998
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5ij0sNHhcWHoazE0cS4YYTcRBRFQniTkhsfk+ciQRJ5rv1wQjHw3zlt7VWoAmmZE1kmjfrJNjRCRd1JR63cnNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8534
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--31.377300-8.000000
X-TMASE-MatchedRID: 0dFPYP4mu5QOwH4pD14DsPHkpkyUphL9pkmFaIvGNrDBnyal/eRn3gzR
	CsGHURLuwpcJm2NYlPAF6GY0Fb6yCr3yXfw+3E8pbc297PAGtWYhdi6zxllm1t3eUkv0LDwMQet
	Uhp4fOly6VMXtSc8qd7WrjxGHjCv17c0is1Jg1FcXrP0cYcrA2/ioIsi7Sa0gYdn5x3tXIpfifO
	TDuK1oyBZDMUjKccymQ210vAP1wtihzaM0+ttmeFt3XMydUaMXMVx/3ZYby79tw+n+iKWyyCVy+
	Kp8zxMh/m7C1i3XHsgPrVNv1qdfVXTfKIAnynq06Zzj+kMRBrZRH5qmP/FmWY1OuwjPrj0EPQAG
	7zv2UCmcwvkq4AChksqwe1scGFNs+hmqIaTo27wktnKC/kfM5bTZ6Fd8KlC9L90kwbnYnbJOZHZ
	G9dmU9pz3ofeDinBXZqUD2HcZBE0vFLnuc5lNl54CIKY/Hg3AwWulRtvvYxTWRN8STJpl3PoLR4
	+zsDTtAqYBE3k9Mpw=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--31.377300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 29D43872A171A9182158A38BED82901C8CFF0B75BA4CAE84D204CF7D2C6D42572000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_002621_062145_6AFDB100 
X-CRM114-Status: GOOD (  13.28  )
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

T24gRnJpLCAyMDI0LTExLTIyIGF0IDA5OjI4ICswMDAwLCBDSyBIdSAo6IOh5L+K5YWJKSB3cm90
ZToNCj4gSGksIEp1bGllbjoNCj4gDQo+IE9uIEZyaSwgMjAyNC0xMS0yMiBhdCAxMDoxNiArMDEw
MCwgSnVsaWVuIFN0ZXBoYW4gd3JvdGU6DQo+ID4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gPiANCj4gPiANCj4gPiBMZSB2ZW4uIDIy
IG5vdi4gMjAyNCDDoCAwODo1NCwgQ0sgSHUgKOiDoeS/iuWFiSkgPGNrLmh1QG1lZGlhdGVrLmNv
bT4gYSDDqWNyaXQgOg0KPiA+ID4gDQo+ID4gPiBIaSwgSnVsaWVuOg0KPiA+ID4gDQo+ID4gPiBP
biBUaHUsIDIwMjQtMTEtMjEgYXQgMDk6NTMgKzAxMDAsIEp1bGllbiBTdGVwaGFuIHdyb3RlOg0K
PiA+ID4gPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBj
b250ZW50Lg0KPiA+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+IEZyb206IFBoaS1iYW5nIE5ndXll
biA8cG5ndXllbkBiYXlsaWJyZS5jb20+DQo+ID4gPiA+IA0KPiA+ID4gPiBUaGlzIGRyaXZlciBw
cm92aWRlcyBhIHBhdGggdG8gYnlwYXNzIHRoZSBTb0MgSVNQIHNvIHRoYXQgaW1hZ2UgZGF0YQ0K
PiA+ID4gPiBjb21pbmcgZnJvbSB0aGUgU0VOSU5GIGNhbiBnbyBkaXJlY3RseSBpbnRvIG1lbW9y
eSB3aXRob3V0IGFueSBpbWFnZQ0KPiA+ID4gPiBwcm9jZXNzaW5nLiBUaGlzIGFsbG93cyB0aGUg
dXNlIG9mIGFuIGV4dGVybmFsIElTUC4NCj4gPiA+ID4gDQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IFBoaS1iYW5nIE5ndXllbiA8cG5ndXllbkBiYXlsaWJyZS5jb20+DQo+ID4gPiA+IFNpZ25lZC1v
ZmYtYnk6IEZsb3JpYW4gU3lsdmVzdHJlIDxmc3lsdmVzdHJlQGJheWxpYnJlLmNvbT4NCj4gPiA+
ID4gW1BhdWwgRWxkZXIgZml4IGlycSBsb2NraW5nXQ0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQ
YXVsIEVsZGVyIDxwYXVsLmVsZGVyQGlkZWFzb25ib2FyZC5jb20+DQo+ID4gPiA+IENvLWRldmVs
b3BlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQu
Y29tPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBp
bmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+ID4gPiA+IENvLWRldmVsb3BlZC1ieTogSnVsaWVu
IFN0ZXBoYW4gPGpzdGVwaGFuQGJheWxpYnJlLmNvbT4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTog
SnVsaWVuIFN0ZXBoYW4gPGpzdGVwaGFuQGJheWxpYnJlLmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4g
PiANCj4gPiA+IFtzbmlwXQ0KPiA+ID4gDQo+ID4gPiA+ICtzdGF0aWMgdm9pZCBtdGtfY2FtX2Nt
b3NfdmZfZW5hYmxlKHN0cnVjdCBtdGtfY2FtX2RldiAqY2FtX2RldiwNCj4gPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIGVuYWJsZSwgYm9vbCBwYWtfZW4pDQo+
ID4gPiA+ICt7DQo+ID4gPiA+ICsgICAgICAgaWYgKGVuYWJsZSkNCj4gPiA+ID4gKyAgICAgICAg
ICAgICAgIGNhbV9kZXYtPmh3X2Z1bmN0aW9ucy0+bXRrX2NhbV9jbW9zX3ZmX2h3X2VuYWJsZShj
YW1fZGV2KTsNCj4gPiA+IA0KPiA+ID4gRGlyZWN0bHkgY2FsbCBtdGtfY2Ftc3YzMF9jbW9zX3Zm
X2h3X2VuYWJsZSgpLg0KPiA+ID4gVGhpcyBoYXMgZGlzY3Vzc2VkIGluIHByZXZpb3VzIHZlcnNp
b24gWzFdLg0KPiA+ID4gDQo+ID4gPiBbMV0gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRjaC8y
MDI0MDcyOS1hZGQtbXRrLWlzcC0zLTAtc3VwcG9ydC12Ni00LWMzNzRjOWUwYzY3MkBiYXlsaWJy
ZS5jb20vKjI1OTY2MzI3X187SXchIUNUUk5LQTl3TWcwQVJidyFseWRnTHlkdEF1enItQkM1cUFy
ejNBRXpPTTBpU1NyNlRYaWZ3YWIxa1B2V1ZKTHkwazdyVWlhc1JfZ29NQUZfNlhZbVBJcEVyR0Y2
Q2RMa1BRJA0KPiA+ID4gDQo+ID4gDQo+ID4gSGkgQ0ssDQo+ID4gDQo+ID4gSSBmb3Jnb3QgYWJv
dXQgdGhhdCBkaXNjdXNzaW9uIHNvcnJ5IDovDQo+ID4gSSBndWVzcyB5b3Ugd2FudCBtZSB0byBj
b21wbGV0ZWx5IHJlbW92ZSB0aGUgIG10a19jYW1faHdfZnVuY3Rpb25zIHN0cnVjdD8NCj4gPiBJ
biB0aGF0IGNhc2UsIHdoYXQgZG8geW91IHByZWZlcjoNCj4gPiAtIGtlZXAgbXRrX2NhbXN2MzBf
aHcuYyBhbmQgcHV0IHNpZ25hdHVyZXMgaW4gbXRrY2Ftc3YzMF9ody5oIGFuZA0KPiA+IGluY2x1
ZGUgbXRrX2NhbXN2MzBfaHcuaCBpbiBtdGtfY2Ftc3ZfdmlkZW8uYw0KPiA+IC0gcmVuYW1lIG10
a19jYW1zdjMwX2h3LmMgdG8gbXRrX2NhbXN2X2h3LmMgKGFuZCBhbGwgZnVuY3Rpb25zKSBhbmQN
Cj4gPiBwdXQgc2lnbmF0dXJlcyBpbiBtdGtfY2Ftc3ZfaHcuaA0KPiANCj4gSSBwcmVmZXIgdGhl
IHNlY29uZCBvbmUuDQoNCkluIGFkZGl0aW9uLCBJIHRoaW5rIG10a19jYW1fY21vc192Zl9lbmFi
bGUoKSBjb3VsZCBiZSByZW1vdmVkLg0KQ2FsbGVyIG9mIHRoaXMgZnVuY3Rpb24gY291bGQgZGly
ZWN0bHkgY2FsbCBtdGtfY2Ftc3YzMF9jbW9zX3ZmX2h3X2VuYWJsZSgpIGFuZCBtdGtfY2Ftc3Yz
MF9jbW9zX3ZmX2h3X2Rpc2FibGUoKS4NCg0KUmVnYXJkcywNCkNLDQoNCj4gDQo+IFJlZ2FyZHMs
DQo+IENLDQo+IA0KPiA+IA0KPiA+IENoZWVycw0KPiA+IEp1bGllbg0KPiA+IA0KPiA+ID4gUmVn
YXJkcywNCj4gPiA+IENLDQo+ID4gPiANCj4gPiA+ID4gKyAgICAgICBlbHNlDQo+ID4gPiA+ICsg
ICAgICAgICAgICAgICBjYW1fZGV2LT5od19mdW5jdGlvbnMtPm10a19jYW1fY21vc192Zl9od19k
aXNhYmxlKGNhbV9kZXYpOw0KPiA+ID4gPiArfQ0KPiA+ID4gPiArDQo+ID4gPiA+IA0KPiA+ID4g
DQo+ID4gPiAqKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioq
KioqKioqKioqKioqKioqKioNCj4gPiA+IFRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhp
cyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueQ0KPiA+ID4gYXR0YWNobWVudHMpIG1heSBi
ZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCj4g
PiA+IGV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBp
bnRlbmRlZCB0byBiZQ0KPiA+ID4gY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNp
cGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sDQo+ID4gPiBkaXN0cmlidXRpb24sIHBy
aW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0
cw0KPiA+ID4gYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmlj
dGx5IHByb2hpYml0ZWQgYW5kIG1heQ0KPiA+ID4gYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90
IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZQ0KPiA+ID4g
dGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlm
eSB0aGUgc2VuZGVyDQo+ID4gPiBpbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1h
aWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mDQo+ID4gPiB0aGlzIGUtbWFpbCAoaW5j
bHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KPiA+
ID4gZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNv
bi4gVGhhbmsgeW91IQ0K

