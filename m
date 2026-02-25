Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39EAF55449
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 03:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kXVhR/yjT0ItPB7qzXAPmwG98wwEqe2SQrB5CBZ7pDc=; b=UfQFPrpyy6QklmtXBgoqsGNTny
	8MSDn9LN1zeVzy/IXicvh6uxVcgmzDFOhGDXZl78/+W6hPnqVUUxWo3zlm/prk9n8nW7NkifRTDSx
	HW0mNHH5YOJgcwtV0TPm5okdBayJjewEOJX8adv096E0YenCx22MCixR1hJf5//f30GEewcRWshsx
	zyfwmpbnX+6PfUgrS8ZHuRAMtezyG9JqLaU0HCmqma2RJRTgD5MdyyC6PMjZJ2GhevZ1qUxqSLTCH
	NUPsikcR2MRZBSq1hFLiQ8wX5rfFKOF2ykylctvebm1/XB1KzrtsYmopRXwqtgye9oj8jf21GDDXP
	S9PCWZZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv5Kz-000000037xq-268U;
	Wed, 25 Feb 2026 03:13:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv5Kw-000000037xM-1kig;
	Wed, 25 Feb 2026 03:13:19 +0000
X-UUID: eca104ee11f711f1ad39f32c34db0b1c-20260224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=kXVhR/yjT0ItPB7qzXAPmwG98wwEqe2SQrB5CBZ7pDc=;
	b=kI+8T2kNlKManwtEAQwcQnq2jfO9A9yXXShdXqo3FJ6YByfhiQczQcWD2Llxvezw1cvp9C/5+oXdhr61HivsmH7H9LmUqSDjLNvE3moaq1Q4vAJJPRMHXXsQRtEKEiGVogSYRy7gL99W270LLRQz0AG4BK3YW8U8hLthe8SZMc8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:6e0b39b7-9b11-4b34-a54a-0a348f1fe329,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:c4c73c7b-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: eca104ee11f711f1ad39f32c34db0b1c-20260224
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 903195500; Tue, 24 Feb 2026 20:13:14 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 25 Feb 2026 11:13:12 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 25 Feb 2026 11:13:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MHWk6LJDf1HNwh+mGcK7k5mgB+/fJvlIDU/sypIpEIDUuwHlaZuLworUScKtugLrPPcc6waf9BkTO1nSpf9LygyanCzNk2+0NP/8fyKgnigZbRbkwistLzmeKqiNdBI1FpL0qr7Hw1QrsEFtnThdaQLFq7QDq89Zt88+47Ak86sJUWOlE1p00XK0zgKNdFi67CgfKYpYX2aMYv5H+sH2bMSz3CW8aeGHqQMz3oNU8DlUhKO/y5P/gL1fqOVVr6evfC1n2gtN3fR0OPshHxy5/8I/wlQXJC1j1ivMIAKef/kZzOvh/ovCiU+5cG2DIQyzUcZN3YZUdc/J8lfr2gSIjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kXVhR/yjT0ItPB7qzXAPmwG98wwEqe2SQrB5CBZ7pDc=;
 b=P6qHjDuRA89BCvLuyivknALTbgB9Wh3nBZ5TmYH+iSbKe7skYv5CjKr4T3ISHL4+r4ftYZrKt/h/qyVFpfohruuDA64+W06gZRHRXM7LZI3fUv/2hsInPY4f7BYmvwxtNoKytGD9gNDAtk/ljfHcZY2fOrgiRdop+At6BO5oFcu4HXletlbMUFKqzpxYrN98BeIQrN4DavcLuYrPHQ6Gv0fQWE9eDZUlIaKfEMoBADNsBQ3dNlMSrEwTSnHqLK3vzGC006xvHMffsEV+Ndy/P6pv70dF1FEhzc1MkjgPfBi7yGRacDQKuge4eC/lhwDYx0ZW2rDacqCfdb7WW8pYUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kXVhR/yjT0ItPB7qzXAPmwG98wwEqe2SQrB5CBZ7pDc=;
 b=FhbWD9kWwb40JDToWHMmS0KPNbMai/THG7BfkPy9wzRVFJRCdzVgbmgw5PoKsAB2TBwW/ItAh4Wz9KtCYM9rv4GXGsGimuaWsydh4OwEWOGbal04XfvqEqszw7AJ9C3E2PBzWZbgtScHjbr+tEat5ICNzlP3C0XeRv11tRDd/ss=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYQPR03MB9460.apcprd03.prod.outlook.com (2603:1096:405:2fc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 03:13:09 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9632.015; Wed, 25 Feb 2026
 03:13:09 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"l.scorcia@gmail.com" <l.scorcia@gmail.com>
CC: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "simona@ffwll.ch"
	<simona@ffwll.ch>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Remove all conflicting aperture devices
 during probe
Thread-Topic: [PATCH v2] drm/mediatek: Remove all conflicting aperture devices
 during probe
Thread-Index: AQHcnFWcA7yfs1WLYk+qZ68OJt1tCrWS0KqA
Date: Wed, 25 Feb 2026 03:13:09 +0000
Message-ID: <b025e8152b99515f3b5a634e84d3a79707bb488b.camel@mediatek.com>
References: <20260212192605.263160-1-l.scorcia@gmail.com>
In-Reply-To: <20260212192605.263160-1-l.scorcia@gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYQPR03MB9460:EE_
x-ms-office365-filtering-correlation-id: 0865eb4a-0f2a-4dd6-3b82-08de741bcdb4
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|42112799006|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?SDRsUmtTSUdDVWZ0d3NOK0pQK2xCMzVMb3c1MVhDT25oZEl6bmpxWmlWTTdZ?=
 =?utf-8?B?bjFOUE0zditYcVNYNkxINXVNK1l6bVFET01WTHdrODR6dS9TN2MvNzYyMDRn?=
 =?utf-8?B?eVVpL3E0OFB2N0RzM0psVE9KZDBFRFpvYmEwcVRFbFRKZmlKbnlseGx1TS9B?=
 =?utf-8?B?V1FQa1pEa1FKVyt6d0QwOFA1aS9YWUs5dkhYclBlNmxoaFh5VWJaNWlLR0xX?=
 =?utf-8?B?cEl5b2ZLZFlEd0g1Y2ZFVXd2dXhxZWJYeHVPeXV5cXdjNXNGTDE4TVllUUxQ?=
 =?utf-8?B?M21yYzk2NWo3TzlGSTd4U3V0ZlJ3TFVidkZhUStoSEE5NDZyWUN0ZUZWZVM3?=
 =?utf-8?B?UExLYThhNVR6bnNvcFBPcWtsWVdGRHhuQzhHcjN6dnFtWEtMc3RpVnRFUzNk?=
 =?utf-8?B?MzdIc3dpdEI1dUIzRzhESldaNTlYbTRUdFZMK2NLeno2OUxuM3kzQm50Vzk5?=
 =?utf-8?B?U29YcVovdE9Tam1TMkkzQ2h5OUErODFVcC9OQXR5ajNxMXhvdnMySC9OVEN0?=
 =?utf-8?B?VXkrWXhsWTNZVUEyelVzVDYxRFpjQlNBdURQdVBiYTc1amU5Rnh5anJqNFV4?=
 =?utf-8?B?K3V2YllwekxSdVlTUWcyc1lNajRvckc0UW9aem1tMWVjbExhV1psU3VBM3l4?=
 =?utf-8?B?RWZQZFpqazBkT1daeFRvRVhsS01TMkZnZ0lBRkZkSm9CbGtmU0I0M2xQYVdy?=
 =?utf-8?B?VlJlMzhadHlneGRibThId2RiY3lJT2lPWkhXMUJLMGVYcFlKbDdJZ3pTaDk1?=
 =?utf-8?B?RU1CSWJSWmIwOEoreVNEN0ZvdVJMR28ydW0rMGl4ZDB6TVFGQTErbG5hblV6?=
 =?utf-8?B?WXJWNFduY0sweHI5Sit3alhyUGRERHVlczd1ck56UDZuT0NJUjcyQWE4V3JF?=
 =?utf-8?B?RTViWTI4MHhaR2xJb25scHBXaFA5a3RManJlRzA2VU5BbzZ0RzI5dGRqTU1Z?=
 =?utf-8?B?RnJkc2I5ZGs4eTdsc3JyQUxlSEZzcWxhZzV4c1JmUFkzM1dRM3BwL2VqZzB1?=
 =?utf-8?B?QzhmZWx2bUxmcGsraFVmV05oK3VLS0NqQTR3dUZLOGRvL1FwUDhONlFlRFBH?=
 =?utf-8?B?ZGhzWUU1b1pJakpOc1dQNHlBcDVTUkoraWhjYy9HdGRJN2srWUNYZXM0Wmhz?=
 =?utf-8?B?R2tjKzcyZFVjMWQ5d01jdTdHWXBJTWVndy9jZU9jZjAyRkd6TENrL3NMc0RH?=
 =?utf-8?B?ZXgwY0N3SzA0QlN6dnI0ZFBnQUgxaW1vS1ZYUG9IeExucjZvZ20ySXE2M25H?=
 =?utf-8?B?dWV1Z0N6MmU4cDM4YjBPMVJhVkhTaG9uR0tKcWRQU2pDVjhWVHZERkJMMDlz?=
 =?utf-8?B?VjZFM3ZoNFBHZXBqaHBwaUd3bTlSVS9aQ1pmVitNVW5VanNmSHR0YzNSODAw?=
 =?utf-8?B?Yk5YazFNOGk2RENtR3l5TnV1UzhUdW9WcHZHWE1jTUkrdTNJOWJNK0Y4dkJJ?=
 =?utf-8?B?em5CR3M2OHR3cUFZVUNMdlVyT0Mzd2lqaVdQZG82MU43bHN5cng4S0JmNFRZ?=
 =?utf-8?B?cFBDbVlSVVIrU2RyWXY4UlBkcjlhdTdrc1VLVktRYlpFSnpDcTBkdEZiTU5H?=
 =?utf-8?B?dHJycmdiUUNzcXJHSGNUVnovS0hQaHNSRHBTbnBOY1ZZMmFKVVcvSGtGTHFC?=
 =?utf-8?B?MWVLOFpLRC9udnpqK25qU2w4MjZwZTdRcElYNlF1TFpiamNicThNSW1jaUVB?=
 =?utf-8?B?Y1ZmeFZuaG1URTBOK3E0N3ZHU0xpa1RSVUJTVkRwVDY4WUlRdmdtVWhEaCtk?=
 =?utf-8?B?bUZUYVI4aWpVYVVqZ1RoWnQrM3RqelczL0RhMkl1Mkc1Kzdmalk4Z01DYUN5?=
 =?utf-8?B?bG9Sb2VHakFwSkg0RkYxbTZtUGxxZ0lCcWZWMkdwTDZ2QTc5d2xpeHJnRmZI?=
 =?utf-8?B?ZFBlR0wzajF6WDRXTmpXMnRUM0ZCZ1FiYUFPcFBzaFhKRjltSnkwTTBoVkdo?=
 =?utf-8?B?ZVVNWmFiYTgrY0hHbUtmcnpBNW9iMW5iajdvS0F0cnBSTWIwYnhEYXk2SnJt?=
 =?utf-8?B?SEVpcTlrczE0M21SbjBDT01DWGxoSjNIaWVmRVdCdE92L0FSQi9NRzYwczIr?=
 =?utf-8?B?VkhtRkhIZ2hWQXd6SXkxclBvT05oQS9EUW1KeHVjTUt1SjBGbkMyTEVacks3?=
 =?utf-8?B?SC83NDE5a1dWVE96cDNZbDJQY2JDQi81NFh5SzczWWZZV09XQnJCS3JGUW1K?=
 =?utf-8?Q?NOfItKOnrXq1dG/DMCYtJnk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cE9XclJxd0hFeGZycWIrK2ZsSUp2Z1JpNmsyZThld043MzlEWGlZZFU2Q2RB?=
 =?utf-8?B?MmZ2Z3hUTittcHIvYnU1RGM4Qm1sUFRaL3pnYUk2KzhZWkI3aVhQVys1R1k3?=
 =?utf-8?B?ZnovU0Vka2lmOS85V3VUTzArQ2t5S2t6Vy9McUpReG5QOHlwbG1sQ0ZNMDMx?=
 =?utf-8?B?VDFDUzlRQm8yWW1VMHNKUi9HNHJxbnplT3BWRnJacFpwWWFXUkdhN2lRN2Q0?=
 =?utf-8?B?T3VnNTVuZTdJakcyVjJCSDZielNzNm1iZVB4RmErenNyTE42VmJnY0kwOWY5?=
 =?utf-8?B?dElKYzZ2dXNaY2ZmaHRXNDdZdGpuNlB4eWZvRnpLVmRXOTI1YXB4Vjh2UlMw?=
 =?utf-8?B?RXZOcjhSWXRreXlZTlJyYUVhRUxsZXRDdFJ4ZjNNQmg5eUFHVE1BbW93Q09q?=
 =?utf-8?B?Rlo0ZnpNNWZRSHdpZllMZXdiemcxK3B5c3FEQktna1laZ0VFQkVmK2J2Tllr?=
 =?utf-8?B?NWpReW1TQ1RYbFI2dHlZUVV3VXZoejd5MDNjakY3UEQyeHlValI2R0o5MEs3?=
 =?utf-8?B?M2NIYngxdFU1aUR5UVJpQndXZmxSRmlhRVc0ZWVYYWk2OTRWQW9nV1hNU3dY?=
 =?utf-8?B?RkFHd2JLMXdCODNZblpId2xBdjZGV1NxL2pqRlJ3azQ2TkdZYUZ1NXVvdWJM?=
 =?utf-8?B?NVJ1a2MybFhFOGxIMkdPT2J0VWZFb0pIYzNJSUhJbWZsSTFDOTBWWVppWUdN?=
 =?utf-8?B?aHh0eEtyQWMrVXdwTERpcklHeWpaMXUwck9Wc1RsMnF5bWltZnJhTjd1cWlY?=
 =?utf-8?B?WFNMREZ3T0cwcUlES2M3TkpuZ0JhMWdCUVZ2UTJNRWNBSWlmQktvcTdsU1NN?=
 =?utf-8?B?SDFXd0xCSEFoSnE1Y2x5alBvTEs5MG5MWTVaVXV1bVBSQXFlc24yZmJvc1R6?=
 =?utf-8?B?ZkRtS2xFMUJab1VubUNLclI1NWdMRjFwQzJJUFNRSmw2NjJEL2c1ZTYxMHIw?=
 =?utf-8?B?UFBXdkprWHlMT0hFQWpUOEpjcVJBK2FIUFNETHdEU3BUaG9sOEdOOUJwQ3p1?=
 =?utf-8?B?TW0xdWk0bllieDBERm4zSSthQjhKU2x1blFBQmlta2g4WVQveVNyOUQ0emQy?=
 =?utf-8?B?UnBmUjN0Zm9jYzhTOXVXczd2dWhLOHlCcVBwT0NmVDVmV2RSZURnaEpUTE51?=
 =?utf-8?B?WURGbG5IQjcyVjlVMmVFcGk0ZEJtVVFOMGQvSHpqZlFZNnFBYWFFb2lPSnJh?=
 =?utf-8?B?N2p5Q1FqZm5Md2o1aGRXckFMUmhtSU1ZVXlsTHFpdGpnUWQ0T25lOTNZN1Vw?=
 =?utf-8?B?L2lsYlYwc1ZWZGcxamlsVjhpeEFabjV3cWxyN0Q5VDgvdklXRGkwRE5PV0or?=
 =?utf-8?B?MGF2Mm1DMnFXazhYQ1ErdjE5cTRwM3NMMEZkeG5BMy9sUWdsTURYOU5pRllZ?=
 =?utf-8?B?ZEF0UXVRUlhKNDR0Y3FyL3hhK3pyZ0JKdVlwMjhLb281THdsaGtSRTEvbHcr?=
 =?utf-8?B?LzgraEtBSmxFbmJJVkRZYUlJbEI3T3kwdzRPMUxGMUdjOTFYaHYzOEdJZzdv?=
 =?utf-8?B?QWZMRUNPME5aYWtOZGNPcDEzRDB2UmVKbkNsenNaQTBTNk9oRHl4aU4yaTls?=
 =?utf-8?B?aW1FT1lqUUl3U2tMR2ZhRnd4ZDA0NEFHYWNxNWMwaGlFQ3Jvd2t0VTdMemMz?=
 =?utf-8?B?OEM5WnQydk91Zyt3eVE1M3hXay9DWStaNDNJVVE0Y2p5NHRTejlHNzRwMmtQ?=
 =?utf-8?B?TFFVQ3NyU0tzbGZaUDNremlqQVdkWUFNUjJCcEFLREh6SGZKTWxhbWRrZXFj?=
 =?utf-8?B?M2N2RDNEUW9WMUFpdzlJZmRoWHcyZ0ZxdVhCbkpzdUMvN09raUxMM3F6WUhR?=
 =?utf-8?B?U1R6eWU3Nm1YU05rRTFqLzBJV09RVng0RDdva1FSSlFaSUZNTkR5LzNUUW82?=
 =?utf-8?B?TFY5cGtFRXl3cFpmSHJydnVuNm5NckZqTDhnWGxXMHdISVpsMy9KN1I3YXJF?=
 =?utf-8?B?Y1V2YWJFcGxiQUpFMUlMajBTeFFOd2tiS1B1NzczaS8wcXlPWnJub1FzT3Ru?=
 =?utf-8?B?YjNYZmg2RHdNdDA4Q2dGZCtsRE91ZU5rdHhaNlh3MjRTdDkvOENFQW5QY0Fz?=
 =?utf-8?B?cTFaSXpaZGJnNzNiSis0cTBZRHNscnFZeUEyV3JFV1pUREU0dWVwMDlLODRt?=
 =?utf-8?B?aW0yQmFCUThya2tTWVErL0d6R21panpic2JZYUQ0TUtZUXZIdGxmT09ua21T?=
 =?utf-8?B?Y01CNUU1OFZ0UVFSQ0lSME9rQmk1QUxOUkVMdmNTOEtFS1RzNlJjM1FSUU1z?=
 =?utf-8?B?blNxem1RdDE5YmNtaWVOMXNtakdtZTJiVVhIZk51cFVXa0sxQ3B1Qk0vd2Q2?=
 =?utf-8?B?RXNBdWtBc01KUWJ2czJ3dzlmdFVOaGJmVzhYeS9nQ21UOTFqT2QrQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8AFA260D5AC4344B9DFF0BAB81F3CDD2@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0865eb4a-0f2a-4dd6-3b82-08de741bcdb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 03:13:09.7025
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Ft+h7Z8daXGb7QeADsrrxsagcwar6tFI9kuF1pzcVVxbdQuCGAGZydLu5NBwxSKbFGg4fiabIGPuUmM5a+jHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYQPR03MB9460
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_191318_584654_B0FFE19C 
X-CRM114-Status: GOOD (  25.21  )
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

T24gVGh1LCAyMDI2LTAyLTEyIGF0IDE5OjIyICswMDAwLCBMdWNhIExlb25hcmRvIFNjb3JjaWEg
d3JvdGU6DQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBv
cGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhl
IGNvbnRlbnQuDQo+IA0KPiANCj4gSWYgYSBkZXZpY2UgaGFzIGEgZnJhbWVidWZmZXIgYXZhaWxh
YmxlIGl0IG1pZ2h0IGJlIGFscmVhZHkgdXNlZCBhcw0KPiBkaXNwbGF5IGJ5IHNpbXBsZS1mcmFt
ZWJ1ZmZlciBvciBzaW1wbGVkcm0gd2hlbiBtZWRpYXRlay1kcm0gaXMgcHJvYmVkLg0KPiBUaGlz
IGlzIGFjdHVhbGx5IGhlbHBmdWwgd2hlbiBwb3J0aW5nIHRvIGEgbmV3IGRldmljZSBhcw0KPiBm
cmFtZWJ1ZmZlcnMgYXJlIHNpbXBsZSB0byBzZXR1cCBpbiBkZXZpY2UgdHJlZXMgYW5kIGZiY29u
IGNhbiBiZQ0KPiB1c2VkIHRvIG1vbml0b3IgdGhlIGtlcm5lbCBib290IHByb2Nlc3MuDQo+IA0K
PiBXaGVuIGRybS1tZWRpYXRlayBsb2FkcyBhIG5ldyBmYiBkZXZpY2UgaXMgaW5pdGlhbGl6ZWQs
IGhvd2V2ZXINCj4gZmJjb24gcmVtYWlucyBhdHRhY2hlZCB0byB0aGUgaW5pdGlhbCBmcmFtZWJ1
ZmZlciB3aGljaCBpcyBubyBsb25nZXINCj4gY29ubmVjdGVkIHRvIHRoZSBhY3R1YWwgZGlzcGxh
eSAtIHRoZSBlYXJseSBmYiBpcyBuZXZlciByZW1vdmVkLg0KPiANCj4gV2UgY2FuIGdyYWNlZnVs
bHkgdHJhbnNpdGlvbiBmcm9tIGZyYW1lYnVmZmVyIGhhbmRsaW5nIHRvIGRybS1tYW5hZ2VkDQo+
IGRpc3BsYXkgYnkgY2FsbGluZyBhcGVydHVyZV9yZW1vdmVfYWxsX2NvbmZsaWN0aW5nX2Rldmlj
ZXMgYmVmb3JlDQo+IHJlZ2lzdGVyaW5nIG1lZGlhdGVrLWRybS4gVGhpcyB0YWtlcyBjYXJlIG9m
IHVubG9hZGluZyBvdGhlciBmYg0KPiBkZXZpY2VzL2RyaXZlcnMgYW5kIGRpc2Nvbm5lY3RzIGZi
Y29uIHdoaWNoIHRoZW4gYXV0b21hdGljYWxseQ0KPiByZWNvbm5lY3RzIHRvIG1lZGlhdGVrZHJt
ZmIgYXMgc29vbiBhcyBpdCdzIGF2YWlsYWJsZS4NCj4gDQo+IFRoZSBmdW5jdGlvbiBpcyBpbnZv
a2VkIGp1c3QgYmVmb3JlIGRybV9kZXZfcmVnaXN0ZXIoKSB0byBraWNrIG91dA0KPiB0aGUgZXhp
c3RpbmcgZnJhbWVidWZmZXIgYXMgbGF0ZSBhcyBwb3NzaWJsZSB0byByZWR1Y2UgdGhlIHRpbWUg
dGhlDQo+IHNjcmVlbiBpcyB1bnJlc3BvbnNpdmUuDQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2su
aHVAbWVkaWF0ZWsuY29tPg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMdWNhIExlb25hcmRvIFNj
b3JjaWEgPGwuc2NvcmNpYUBnbWFpbC5jb20+DQo+IC0tLQ0KPiB2MjogTW92ZWQgdGhlIGNhbGwg
dG8gYXBlcnR1cmVfcmVtb3ZlX2FsbF9jb25mbGljdGluZ19kZXZpY2VzIHRvDQo+ICAgICByaWdo
dCBiZWZvcmUgZHJtX2Rldl9yZWdpc3RlcigpDQo+IA0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZHJ2LmMgfCA1ICsrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KPiBpbmRl
eCBhOTRjNTFhODMyNjEuLjAyZWZmZDlmYzY5OCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZHJ2LmMNCj4gQEAgLTQsNiArNCw3IEBADQo+ICAgKiBBdXRob3I6IFlUIFNI
RU4gPHl0LnNoZW5AbWVkaWF0ZWsuY29tPg0KPiAgICovDQo+IA0KPiArI2luY2x1ZGUgPGxpbnV4
L2FwZXJ0dXJlLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvY29tcG9uZW50Lmg+DQo+ICAjaW5jbHVk
ZSA8bGludXgvbW9kdWxlLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvb2YuaD4NCj4gQEAgLTY3MCw2
ICs2NzEsMTAgQEAgc3RhdGljIGludCBtdGtfZHJtX2JpbmQoc3RydWN0IGRldmljZSAqZGV2KQ0K
PiAgICAgICAgIGlmIChyZXQgPCAwKQ0KPiAgICAgICAgICAgICAgICAgZ290byBlcnJfZnJlZTsN
Cj4gDQo+ICsgICAgICAgcmV0ID0gYXBlcnR1cmVfcmVtb3ZlX2FsbF9jb25mbGljdGluZ19kZXZp
Y2VzKERSSVZFUl9OQU1FKTsNCj4gKyAgICAgICBpZiAocmV0IDwgMCkNCj4gKyAgICAgICAgICAg
ICAgIGRldl9lcnIoZGV2LCAiRXJyb3IgJWQgd2hpbGUgcmVtb3ZpbmcgY29uZmxpY3RpbmcgYXBl
cnR1cmUgZGV2aWNlcyIsIHJldCk7DQo+ICsNCj4gICAgICAgICByZXQgPSBkcm1fZGV2X3JlZ2lz
dGVyKGRybSwgMCk7DQo+ICAgICAgICAgaWYgKHJldCA8IDApDQo+ICAgICAgICAgICAgICAgICBn
b3RvIGVycl9kZWluaXQ7DQo+IC0tDQo+IDIuNDMuMA0KPiANCj4gDQoNCg==

