Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA795E9E31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 01:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cknNDnBSeBZD5fuGArtPsaIDtC2E4WtF0leoYNcVuGI=; b=2Odv5MJc9SCxQOXvs//AGBp8HM
	LkPAacR6fN07T132zGPDJ/kGpPYWg+sI8QjibkODsaClfIrDBHlTbvdebMlQWrfO49pKLketUajSA
	F/PUQFNxPuXu1X7dhVSQhjGtLsfCGUKGiLrNsaMfRv0Ts5YhVadEJ/s0NUdXGFH9BIqemSW5DWygq
	ZQGHBiHJOthySDgFMG2XSZ7U2aTlKw5/KL3Bb6kbt1LRT7NnszPvnZgNpRPFjxGwBz9PvQx6aheh2
	kB4NinMBuuQfWD9Q/4QapFlLu+oveY2cTFfA525SJUL2TJc2wh/Lm0QasJQhpLqjHAUQIavmet8XL
	3539asnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqLvE-00000001I55-0OWw;
	Thu, 12 Feb 2026 01:55:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqLvA-00000001I4T-2X5s;
	Thu, 12 Feb 2026 01:55:09 +0000
X-UUID: d6ca38f807b511f1a16f0188aa809bee-20260211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=cknNDnBSeBZD5fuGArtPsaIDtC2E4WtF0leoYNcVuGI=;
	b=p229DnE0wQ3r/FHdCo82kXSiClvZe9MTdY6dEKYhfKxepxhtLLoWPWs06ING0tKeuZFUdtwegJe8nbW597guFlm8Gbd339UVlNe6F6pNJUo5f8V7gcr3pPRU+qdvqwIYqFJho8p3HrMb7l24uUK/mgoXZXob9XAP2S00WbsB558=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:5678a837-1d39-4ada-b6b3-51441f2592df,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:d1549af0-16bd-4243-b4ca-b08ca08ab1d8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d6ca38f807b511f1a16f0188aa809bee-20260211
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 781672357; Wed, 11 Feb 2026 18:54:59 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 12 Feb 2026 09:54:56 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 12 Feb 2026 09:54:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PKjqVvQu1+NJSH0FnIj3s53M0otmCY4UiJnU0EPM11y3aVRJZS/ICdbuL72yThajdiEEc7/b/mklMh1vMp0+d0UduXfyW0G1YuIHYvtWdk/z1er2Edz0DrDWLEYu+psxY6+xK/DUyojAH76M8mipvxf+KBmPhNC9KOTSN6rBkBMySG3cYxI/rOoCr+uXZaPoRyX7D+JRBHByqQ1zNmg4tKJ/P2We9IWodxG3/SNYN8wNxVmzu/0VwwByJsM8C2jGUHqKCnhyaolW2M5u267LQQkUAd5qBS9buKRSg52v4vlzjn4q/zlLX7ylWvahUyUf9i/vPgx0caMP2dFruH2BwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cknNDnBSeBZD5fuGArtPsaIDtC2E4WtF0leoYNcVuGI=;
 b=C1s+GWYD2cv2OK2lpbD4fPbbZhNd+xOf4DcINXnpzp8PZ5trf+i3EWsCIAanVKZ+3/7aT1tDVKWSH7BYM97CWhQNzeTxBj6QhgVmegOQRe19GjeN8z5t9ZmPUVFyaWpuORceZVAqGDbDK9TyG4EXviLG1/gRFMmB34ZyfYzkqjNgInZzDB5EbrUC9mrEHB6LQylPkPa7Lr3xJJ/MLoMMsQ0NqYzo4f2gZZHFway4qcyfPA44kSoNhYDAGwFGlFIIElNMtI/TI3fJ3ZgVForP8hEbBc8PAytJzaBGKDareXkVJHGy3MNF22SknhSXIgr/I3cyJjRPVaG8h3cbkZHC9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cknNDnBSeBZD5fuGArtPsaIDtC2E4WtF0leoYNcVuGI=;
 b=H59/fxD/AZdDYGiUelz0KelDp7IACfWYD5WzJvu9/hQbWCBU9hdRgUP8DDAJ3zlX/1AJGhy/CDc4/tHdaoa9rqEwQZvCMgqKYIIwhLSwDFS7hGbhutmZogOS8Tv6dJrYKuxkYd5aaAHijm9HD7jRM1vPErXr9/wam0D1fbtG8c4=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB6717.apcprd03.prod.outlook.com (2603:1096:400:1f2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 01:54:51 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 01:54:51 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "simona@ffwll.ch"
	<simona@ffwll.ch>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "greenjustin@chromium.org" <greenjustin@chromium.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, Nicolas Prado <nfraprado@collabora.com>
CC: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Daniel Stone <daniels@collabora.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [PATCH RFC 3/6] drm/mediatek: ovl: Fix misaligned layer source
 size on AFBC mode
Thread-Topic: [PATCH RFC 3/6] drm/mediatek: ovl: Fix misaligned layer source
 size on AFBC mode
Thread-Index: AQHceZU/SlrIiCW2Fky/SXbbIg72WbVwbskAgARFBwCACd4qAA==
Date: Thu, 12 Feb 2026 01:54:51 +0000
Message-ID: <9f458655385bf7d0ba57d9a048075aec1df7fb6e.camel@mediatek.com>
References: <20251230-mtk-afbc-fixes-v1-0-6c0247b66e32@collabora.com>
	 <20251230-mtk-afbc-fixes-v1-3-6c0247b66e32@collabora.com>
	 <3716cf4707924e97c097cfefa11c7feb09a1ee16.camel@mediatek.com>
	 <1394a4b34db511c921b2709a58dfaf28c1cce45c.camel@collabora.com>
In-Reply-To: <1394a4b34db511c921b2709a58dfaf28c1cce45c.camel@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB6717:EE_
x-ms-office365-filtering-correlation-id: bc9a41a3-8c3c-445a-07f8-08de69d9b61c
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|42112799006|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?aVV4Vi90YUZJMDArTGZUV1l4elRCcHZCUnppaHhta2RrWlFseXFLSXk0b3I0?=
 =?utf-8?B?ZmllVTloblJZemJZR0szaFVPNjJaK3lQbFJTS1pYK1l6T0Ryb3k4dlpEUXA0?=
 =?utf-8?B?Vm04TjhPb0hzSmd4QWRjUFMzY0ZlTUhNbFcydkJkZG5mYTdFNGs1QUE1SFh5?=
 =?utf-8?B?NUZmMXNOUHQvUCs3eEYyUFhaZ21HS3lBNEdMVFFaclhKZzBaN0VBai9IaGhX?=
 =?utf-8?B?bWl4YmxaZHFBaHpPd2V1YW9yZlRJNElJWnFFeEtYek1YM1lzdHVvY3Rqb1Bs?=
 =?utf-8?B?dFlVSDk1dXExbG1aY1o1MHk4cldQcS9MWEovSlFsYnJrUHc5OXVOaDJ4Wndh?=
 =?utf-8?B?STdSeVVtaElsYWFnM1RiSG15dkY3QjM5NFFaR25NZ3BtcXZmdXVGeGc4NFIy?=
 =?utf-8?B?eVk1Y0U1ZGloaUhFcy8wNHp4Vjdad3Jaam9rT0dPZE13eWNHQzM0ZDRjWXMv?=
 =?utf-8?B?bVk4KzRpZWEyck5tY3c1c0ROMzR6QTRBNnc5T1Y2NFV1YnlxRDI0WmRPajZk?=
 =?utf-8?B?eEhxS2xkNUZLWmpVQ0RQWDJlTzBzT0dXV3RQbnl5SUdFU1JoUGtneHhucmhB?=
 =?utf-8?B?K2piY1c0TTV4Z1FhVTRVaTkwLytJemtXU0h2b2loSVlad3RUK09XaEdVV2RK?=
 =?utf-8?B?U1hVT0NlbWMwb09WTXgyNXNOekR3N25LTmJ4RjRybnNFMDZxNnM3MXkzQjM0?=
 =?utf-8?B?dUNyRUpZSU9LUmI0NmpzVlhLdHhESnpYeTBBZXExNVIzZUtIdFBGYzNNaHFE?=
 =?utf-8?B?UEY2Q0hXS2VJbGJGZFlIZzRJWURiSGJ3djZtVmlRak0rOTBrYldxZHR2Vlla?=
 =?utf-8?B?UTB0MS93VEhtTGlINXZZT0NMTUw5bmw4dGhZaDZEc3o2VWZhaWwwRmJkVGxY?=
 =?utf-8?B?RElQWTl4ZXYvVHFZdmtxbDExTnBSUXBZZENrNWFuYThQd0RURzRJRGFOM0lu?=
 =?utf-8?B?TlFwcVVOUUEwNUtKVWFDaXF3c081NW9EbkNWSWtYM0hIbHVJZUNycVV6M2FN?=
 =?utf-8?B?MVFrQXpXek5vSnVBRDRROW9yeC9lM2dYVGlHL0VIdytuQVpvU0FZOVVwc0or?=
 =?utf-8?B?d2VvZEV0SUoyU0haK0F0WVAzSW1jdUpZampQR0hDd05hYjNMUE0xTVMvUlkx?=
 =?utf-8?B?bmtyWG05QWRhbFlCbTd5ODMzUHB5enVTMTZ5M01rTFM1blYzZ1FMdGp5cmFh?=
 =?utf-8?B?cHc1emtwakxvMzd1OWhCZUdtUTNTd3VyMnc1bmdMeHh1MyszdURLQUM1VUt4?=
 =?utf-8?B?NWN6UjgzeU1PbmVtQnJVdE9hZ2FxSHNDeDVyY0pjL2w3ZUJGZXpWdDc1SzdY?=
 =?utf-8?B?aXpWZ0c1azZEZXBCM0s3UWUxMStXUFRndS81bU5DNGd5SzZTdXFBSWVpYitH?=
 =?utf-8?B?K2c0QUpDUW56NWxoTHduS0VKK1lRSXE1TlU5ay8vVUFuZFhOOE9mRG42Vk1V?=
 =?utf-8?B?Y3JwZDM5MkIvVEgycW5VU0ZhQ1hXTExrKzZDV1lBVnVESlMrZlBrK0lZN0FQ?=
 =?utf-8?B?dEFCdzFNK1ZmcFdRWHBTQnBkZEsxci9TQndPckt3Sk1YOVVVVnJzWEsvMTBG?=
 =?utf-8?B?ek5LRjdiQldaaTZFOHB2Qk5qOTg0aHd2ZGM1L29rSlNxbWZ2amIzK2I5Y3lL?=
 =?utf-8?B?eW0wOXNBMkVtV1UyeUFoWGtFMW5nSTBOa0JsNk9uczE3UHc3aHllUEc4VFpm?=
 =?utf-8?B?S2ROdC90L0NaRDl6NHl1TEo2VVBhZUxZOVRlUzdvcnhDcFRHdDBwV2NqdWZm?=
 =?utf-8?B?ZjdiRXlVYUVXM2FHcTc4Qy9KcWZNUjZRbnlEaEFmNVBaSURkNDhDM1FIQ3Ro?=
 =?utf-8?B?MU05SUpKU29TVzlvQUFodUtqQ1dhWFRyK0JpUFJhTHZHZWxkY21BK0dhODN0?=
 =?utf-8?B?b0R4NGQzTVlYY2Y1WUcrZ28ydjZpMURESGdtT1ZBeW01SWszNk9DWVBpWnNm?=
 =?utf-8?B?WjRLcjRBQmFJYjhwZm9Oc2ZFa1czNHhmUHdkOVI5eG1Ea2hSaWZVSXhWYWp2?=
 =?utf-8?B?MmRjcmJWcmtnNlp6d21vdDVya0ZrMFhvQzJRZjVROGRkRnJudnRZMHJrL09T?=
 =?utf-8?B?SGM5T0t5ckhkSU4vdG8rM2diVFlBQmdwTDdUSEQ3QUFsQ1lXdXp3bzhMaGRl?=
 =?utf-8?B?ZHZiaTFualNQVVlOcllsMXdiN0NBREUreEIxbWhPMURpa0FLS2UzbGkyMTRV?=
 =?utf-8?Q?I1wh7/m4e4/qFYd83nykio8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(42112799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dXlQR3RwclJJZ0M5aUJOUDJLdWN4a2NjQ3hZV2pEUFNWU3dVVWhzb0UvSGln?=
 =?utf-8?B?ZUhpbTBLWFlPWG1DNVVkbUFoUS9iam1ma3d6QXhsalJETTh3TGx5ZE1jdXIv?=
 =?utf-8?B?ZGVEYkZGaUx6Nm5hSVFqKzlyY1EzNlJ2TDZaWU43WGlJRFN3WGVvckQxbXJl?=
 =?utf-8?B?L3krMUpqT0dTeGg2eWdQREFScGhZalRhRFkxU3N0RTRBaFNsVXNNZk9vazF5?=
 =?utf-8?B?VXo2UDFYdmlSdS9TajdRZXJQQ1FlMTluL2tjbDBITE1QV2J0SWZJQUI0N0l5?=
 =?utf-8?B?Qy9WOVBUTnlKQ09iNGdiSzRZZnlKVEdSdVl4S2hEUFNJaGpUVXpGM0JHc2ho?=
 =?utf-8?B?QmJkNEdCNnRuMmRYRysxLzJKdGcrOUM3dE4vbDVLTnNTaEtBWXZKSzhhclZk?=
 =?utf-8?B?c0FSZElobGx6Ym42emszTEdxMDhxdFNKUHplZ251bFpvOXFoTHo2STAvWmFl?=
 =?utf-8?B?M3dSc0FZN1F3cG9iblhtVkVZRENsZk9Pdm0rc0VsaFJHbzRyUlBzVkxuL1Rk?=
 =?utf-8?B?azc0a0xqVy91Z1pobDR5UzBrSWk2UnFNVmpNYmduL0pMd25VV2padnFsZVFu?=
 =?utf-8?B?cC90YmFncnk5SXNTT2R2eFVrQ1MwSlg4LzJYdVQrZWM5NVZKL2ozeCtVaHpH?=
 =?utf-8?B?QTlUT2lnZkFGeExraml4VjNGZTNoaFc5NnF2NnFvVWJkS1VzMVo3QWEyOS9z?=
 =?utf-8?B?YzE5VHFLYU53WGcrL0h5V3NMZmk3bEYrQXVESSttNTQzWHEyTEFLSmJxRVBF?=
 =?utf-8?B?c3RiNnM1MHRXaGJWWUkvaFFkTzJoU0pnemQxbE5GNkkyY1VXT2w3czk0MnBY?=
 =?utf-8?B?bEkzSGY0OHplUGJFemNIc1loV0hoTnBIUUkyKzY1d0locnV3bWpBMm0rUlVI?=
 =?utf-8?B?T2NCcmMyamJ0MVQ4VlhFR0NWaEcxalpNVWRuWHJqWGc5NU9MNzlmazFoT3lF?=
 =?utf-8?B?OEw5UUhKYlZTdlBRU2FxMTlVeXV6eG9ieWsrOEx6TFZVQVlNMFNXV0hEcWcv?=
 =?utf-8?B?WXlWbmNsV1BjY1hZMkcvcFhEYXE5S2lPR3VDSlJRRVFLcTRISTNrTXJ1RkxX?=
 =?utf-8?B?Y1d6eGxSeVlCNCtFZ2FEVWZCbElWaGpIOVNocWM1UFhyWm1XREkvQktiaHlM?=
 =?utf-8?B?RHpPbklhQ2VsTERVWTdvWnVrQ1VtdDNkdDhxZDNtcWR0YU92b2JQc2dGMnFu?=
 =?utf-8?B?aTNsaTdKOTZpNUFobXBMNG9hZk5vSW16aDE3VFE2Q2NLSVArOTNTZU5pdTBh?=
 =?utf-8?B?TlpaeXFxdnhRd3N1N1N5Rm15Q211cEdWdjBrdDRPeExMeE41Ulh0VzdlNGp4?=
 =?utf-8?B?RXlYUmd0RW54Q1dqMWhySVc4VFRtSzRHMlV5SHkrQ2Z3cTM1Ulp6aVJmM05T?=
 =?utf-8?B?aWk2Y3hMKzkrZllRYnVUcHgzSi9rbERPeHJZUDgvb0ZSK1ZXMm1NTEZOai9m?=
 =?utf-8?B?OXN4bTFpVEoxczlRQytHeTd2cTRRMHdlK3M0NmRrRHlBM1B1SUZNMi84RXV0?=
 =?utf-8?B?UjVsL1VkWEJLRlJPcnk1SGJTeExqMmJXbFR6NDlMbVk2U1dRNTZlZkduTUxp?=
 =?utf-8?B?OStqR052cEs4cjBIUlF5RmZSa1gwN0lDR2NxdFIzTDhDODBnZ3BWVnpCUEI1?=
 =?utf-8?B?ZVZHbWlLb3RLNGxlUDRCR1MxNml6WktmenRIOGFxNEMxeFNIZzhKK2xacnd4?=
 =?utf-8?B?MzRQelgzZzVkbjR1Q0czaTlpZ3o2Z0dnblZtakdZT0o1M0VUaVZodkNhMGlh?=
 =?utf-8?B?OWdlSGhoRWtjWkZIRDFKNnBrS0J0OXVzaG8xMTQzTHhHb1lYeW8xOUQzL3Zu?=
 =?utf-8?B?YTJ6bmJ5ak5jVUNXYjdkRTdPK2UxeEVadk5lZFBFb3NNRnJPOXJpUEhNM3RI?=
 =?utf-8?B?dVdHcnJNOTJOdENDUmxmYTVhMk00VDBuQ1RKeEk5SXJSV09pTjBmYm56Z0xU?=
 =?utf-8?B?RG1CbXdaZTJZZkg5d0wxb2hIQVhwSFV0cmV3MzNXT2hTRGFESENUUVBRYVAz?=
 =?utf-8?B?Qy9mWFo4Z1lXQzI5bitVNForQmNxM0hXaEZGTUNSc2ZaMlVibE1EallSMjR2?=
 =?utf-8?B?TTJaTm9yUG5GVm5SQWZ3cWhUTnVBcDd4dUs5VS9uS0lQb0tMMmtpZTEzb1I2?=
 =?utf-8?B?ZE50WXVoRk1ZTnh2RnlkS0JVZHhqUVFRWEV6UFBBVk5Yb09QSWE3eUdYZFZU?=
 =?utf-8?B?cDFiRWVMQ2dLYk4rOVVYOUIraFJ4ZkpScVZIcVV0R0lobmNkQytXUVIySSt6?=
 =?utf-8?B?WlQwNjVoYVZuaTBOMlVYNHUwNmpCajZNWlJUaW5XWU8rajV4VXZLOFdUL0dP?=
 =?utf-8?B?MHVNQXU4UzNPclFrMUx5RjNyOFNCNyttWUZ3ZmhNSDhiSjFKb0JsUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8771A39CC76A3249A40AE44DA9121C7F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc9a41a3-8c3c-445a-07f8-08de69d9b61c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2026 01:54:51.7028
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u5AVCkvHYUbO0vXQqsj+YAyFdggdxGlm/scGIQMcAkFQj+0n8F1UI0O3ttjfCypCk4xXnnz8X3aJz+biQ6BClA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6717
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_175508_686546_62D709DC 
X-CRM114-Status: GOOD (  15.85  )
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

T24gVGh1LCAyMDI2LTAyLTA1IGF0IDE0OjEzIC0wNTAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToNCj4gT24gVHVlLCAyMDI2LTAyLTAzIGF0IDAyOjAxICswMDAwLCBDSyBIdSAo6IOh
5L+K5YWJKSB3cm90ZToNCj4gPiBPbiBUdWUsIDIwMjUtMTItMzAgYXQgMTE6MDMgLTAzMDAsIE7D
rWNvbGFzIEYuIFIuIEEuIFByYWRvIHdyb3RlOg0KPiA+ID4gRnJvbTogQXJpZWwgRCdBbGVzc2Fu
ZHJvIDxhcmllbC5kYWxlc3NhbmRyb0Bjb2xsYWJvcmEuY29tPg0KPiA+ID4gDQo+ID4gPiBJbiBB
RkJDIG1vZGUsIE9WTF9TUkNfU0laRSBtdXN0IGJlIGJsb2NrIGFsaWduZWQuIER1ZSB0byB0aGlz
DQo+ID4gPiBsaW1pdGF0aW9uDQo+ID4gPiBvZiB0aGUgQUZCQyBmb3JtYXQsIE9WTF9DTElQIG5l
ZWRzIHRvIGJlIHVzZWQgdG8gYWNoaWV2ZSB0aGUNCj4gPiA+IGRlc2lyZWQNCj4gPiA+IG91dHB1
dCBzaXplIG9mIHRoZSBsYXllciB3aGlsZSBzdGlsbCBtZWV0aW5nIHRoZSBhbGlnbm1lbnQNCj4g
PiA+IGNvbnN0cmFpbnRzLg0KPiA+ID4gRmFpbHVyZSB0byBkbyB0aGlzIHdpbGwgcmVzdWx0IGlu
IHZibGFuayB0aW1lb3V0cyBhbmQgbm8gcmVuZGVyZWQNCj4gPiA+IG91dHB1dA0KPiA+ID4gd2hl
biB0aGUgQUZCQyBkYXRhIHNvdXJjZSBpc24ndCBhbGlnbmVkIHRvIHRoZSBBRkJDIGJsb2NrICgz
Mng4KS4NCj4gPiA+IA0KPiA+ID4gQ29uZmlndXJlIE9WTF9DTElQIHNvIHVuYWxpZ25lZCBBRkJD
IGxheWVycyBjYW4gYmUgZGlzcGxheWVkLg0KPiA+ID4gDQo+ID4gPiBUaGUgZm9sbG93aW5nIGls
bHVzdHJhdGVzIGhvdyB0aGUgYWxpZ25tZW50IGlzIGFjaGlldmVkIHRocm91Z2ggdGhlDQo+ID4g
PiBjbGlwDQo+ID4gPiBzZXR0aW5ncyBmb3IgdGhlIGhvcml6b250YWwgY29vcmRpbmF0ZXMsIHRo
ZSB2ZXJ0aWNhbCBjb29yZGluYXRlcw0KPiA+ID4gYXJlDQo+ID4gPiBhbmFsb2dvdXM6DQo+ID4g
PiANCj4gPiA+IC8tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS1cDQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwNCj4gPiA+
ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8DQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIC4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfA0KPiA+ID4gPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAuLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi7CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHwNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8DQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHwNCj4gPiA+IFwtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0vDQo+ID4gPiDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoCB8DQo+ID4gPiDC
oMKgwqDCoCB8wqDCoMKgwqDCoMKgIHNyYy54McKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHNyYy54MsKgIHwNCj4gPiA+IMKgwqDCoMKgIHzCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgIHwNCj4gPiA+IMKg
wqDCoMKgIHzCoMKgwqDCoMKgwqAgfDwtLS0tLS0tLS0tLS0tLS0tLS0tLT58wqDCoMKgwqDCoMKg
IHwNCj4gPiA+IMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzcmNfd2lkdGjC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwNCj4gPiA+IMKgwqDCoMKgIHzCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8DQo+ID4gPiDCoMKgwqDCoCBOICogQUZCQ19EQVRBX0JMT0NLX1dJRFRIwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgTSAqDQo+ID4gPiBBRkJDX0RBVEFfQkxPQ0tfV0lEVEgNCj4g
PiA+IMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8DQo+ID4gPiDCoMKgwqDCoCB8PC0tLS0t
PnzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfDwtLS0tLT58DQo+
ID4gPiDCoMKgwqDCoMKgIGNsaXBfbGVmdMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBjbGlwX3JpZ2h0DQo+ID4gDQo+ID4gQXMgSSBrbm93LCBjcm9wIGlzIHVzZWQg
dG8gZHJvcCBwaXhlbCBkYXRhLg0KPiA+IEZyb20gdGhlIG5hbWUgb2YgJ2NsaXBfbGVmdCcsIEkg
dGhpbmsgaXQgd291bGQgZHJvcCB0aGUgbGVmdCBwYXJ0IG9mDQo+ID4gdGhpcyBpbWFnZS4NCj4g
PiBCdXQgdXN1YWxseSB0aGUgaW1hZ2UgaXMgYWxpZ25lZCB0byB0aGUgbGVmdCAoc3RhcnQgZnJv
bSBheGlzIDApIGFuZA0KPiA+IGFwcGVuZCBnYXJiYWdlIGRhdGEgaW4gcmlnaHQgcGFydC4NCj4g
PiBJZiBzbywgY2xpcF9sZWZ0IHNob3VsZCBiZSB6ZXJvIGFuZCBhbGwgdGhlIGNsaXAgd291bGQg
YmUgY2xpcF9yaWdodC4NCj4gPiBUaGlzIGlzIHRoZSBub3JtYWwgYmVoYXZpb3IuDQo+ID4gSWYg
T1ZMX0NST1AgZG9lcyBiZWhhdmUgYXMgdGhpcywgYWRkIGNvbW1lbnQgdG8gZGVzY3JpYmUgdGhh
dA0KPiA+IGNsaXBfbGVmdCBkb2VzIG5vdCBkcm9wIHBpeGVsIGRhdGEuDQo+IA0KPiBCb3RoIGNs
aXBfbGVmdCBhbmQgY2xpcF9yaWdodCB3b3JrIGluIHRoZSBzYW1lIHdheSwgYnkgZGlzY2FyZGlu
ZyB0aGF0DQo+IG1hbnkgcGl4ZWxzLCBvbiB0aGUgbGVmdCBhbmQgcmlnaHQsIHJlc3BlY3RpdmVs
eSwgb2YgdGhlIHBsYW5lJ3MNCj4gZnJhbWVidWZmZXIgd2hlbiBjb21wb3NpdGluZyB0aGUgcGxh
bmUgb24gdGhlIGZpbmFsIGltYWdlLg0KPiANCj4gSW4gdGhlIHNpbXBsZXN0IGNhc2UsIHdoZW4g
dGhlIGltYWdlIHRvIGJlIGRpc3BsYXllZCBpcyBsZWZ0LWFsaWduZWQsDQo+IGllIHNyYy54MSA9
IDAsIHRoZW4geWVzLCBvbmx5IGNsaXBfcmlnaHQgd2lsbCBiZSB1c2VkIHRvIG1ha2Ugc3VyZSB0
aGF0DQo+IHRoZSBwbGFuZSdzIHdpZHRoIGFsaWducyB3aXRoIHRoZSBBRkJDX0RBVEFfQkxPQ0tf
V0lEVEguDQo+IA0KPiBIb3dldmVyIGlmIG9ubHkgYSBzdWItcmVnaW9uIG9mIHRoZSBpbWFnZSBp
cyB0byBiZSBkaXNwbGF5ZWQsIHRoZW4NCj4gc3JjLngxIHdpbGwgYmUgbm9uLXplcm8uIElmIHRo
YXQgeCBvZmZzZXQgY29vcmRpbmF0ZSBhbGlnbnMgd2l0aCB0aGUNCj4gQUZCQ19EQVRBX0JMT0NL
X1dJRFRILCB0aGVuIGFnYWluIGNsaXBfbGVmdCB3aWxsIGJlIDAsIGFuZCB3ZSdyZSBiYWNrDQo+
IGF0IHRoZSBzaW1wbGVzdCBjYXNlLg0KPiANCj4gQnV0IGlmIGl0IGRvZXNuJ3QgYWxpZ24swqB0
aGVuIGNsaXBfbGVmdCB3aWxsIG5lZWQgdG8gYmUgdXNlZCB0byBlbnN1cmUNCj4gb25seSB0aGUg
aW50ZW5kZWQgc3ViLXJlZ2lvbiBpcyBkaXNwbGF5ZWQsIGV2ZW4gdGhvdWdoIGl0IHN0YXJ0cyBp
biB0aGUNCj4gbWlkZGxlIG9mIGFuIEFGQkMgZGF0YSBibG9jay4NCj4gDQo+IFRoaXMgaXMgYmVj
YXVzZSBub3Qgb25seSB0aGUgd2lkdGggYW5kIGhlaWdodCBpbiBESVNQX1JFR19PVkxfU1JDX1NJ
WkUNCj4gbmVlZCB0byBiZSBhbGlnbmVkIHRvIHRoZSBBRkJDIGRhdGEgYmxvY2ssIGJ1dCBhbHNv
IHRoZSBzdGFydGluZw0KPiBhZGRyZXNzIGluIERJU1BfUkVHX09WTF9BRERSLCB3aGlsZSBzcmMu
eDEgYW5kIHNyYy54MiBzdXBwbGllZCBieQ0KPiB1c2Vyc3BhY2UgYXJlIGFyYml0cmFyeSBhbmQg
d29uJ3QgbmVjZXNzYXJpbHkgYWxpZ24sIGhlbmNlIHdlIHVzZSBib3RoDQo+IGNsaXBzIGFzIG5l
ZWRlZCB0byBhY2hpZXZlIHRoZSBpbnRlbmRlZCBkaXNwbGF5IG91dGNvbWUgcmVzcGVjdGluZyB0
aGUNCj4gaGFyZHdhcmUgY29uc3RyYWludHMuDQoNCk9LLCBpbiBtdGtfcGxhbmVfdXBkYXRlX25l
d19zdGF0ZSgpLCB4X29mZnNldF9pbl9ibG9ja3MgaGFzIGRvbmUgdGhlIGJsb2NrLWJhc2VkIGNy
b3AuDQpBbmQgdGhpcyBwYXRjaCBpbnRyb2R1Y2UgY2xpcF9sZWZ0IGZvciBwaXhlbC1iYXNlZCBj
cm9wLg0KSSB0aGluayBwaXhlbC1iYXNlZCBjcm9wIGNvdWxkIHJlcGxhY2UgYmxvY2stYmFzZWQg
Y3JvcC4NClNvIGRyb3AgeF9vZmZzZXRfaW5fYmxvY2tzIGFuZCBsZXQgY2xpcF9sZWZ0ID0gc3Jj
LngxLg0KDQpJbiBhZGRpdGlvbiwgdGhlIGNsaXBfcmlnaHQgaXMgYWxzbyBub3QgbmVjZXNzYXJ5
Lg0KVGhlIHBpdGNoIGFscmVhZHkgdGVsbCBoYXJkd2FyZSB0aGUgYnVmZmVyIHdpZHRoLg0KSSB0
aGluayBoYXJkd2FyZSB3b3VsZCBub3QgYWNjZXNzIGRhdGEgb3ZlciBzcmNfd2lkdGgsDQpzbyBk
cm9wIGNsaXBfcmlnaHQgYW5kIGl0IGNvdWxkIGJlIHNpbXBsaWZpZWQgYXMNCg0KfDwtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tPnwNCiAgICAgICAg
ICAgICAgICAgICAgcGl0Y2gNCnw8LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLT58ICAgICAgIA0KICAgICAgICAgICAgICAgICB2YWxpZCBpbWFnZSBkYXRhICAg
DQogICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgIA0KICAgICAgICAg
ICAgIHNyYy54MSAgICAgICAgICAgICAgICAgc3JjLngyICANCiAgICAgICAgICAgICB8ICAgICAg
ICAgICAgICAgICAgICAgIHwgICAgICAgDQp8PC0tLS0tLS0tLS0+fCAgICAgICAgICAgICAgICAg
ICAgICB8DQogICBjbGlwX2xlZnQgfCAgICAgICAgICAgICAgICAgICAgICB8DQogICAgICAgICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgICB8ICANCnw8LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tPnwgICAgICAgDQogICAgICAgICAgICAgICAgICAgIHNyY193aWR0aCAgICAgICAg
ICAgICAgIA0KDQoNCkJ1dCBjb25jZXB0dWFsbHksIHNyY193aWR0aCBtZWFucyB2YWxpZCBpbWFn
ZSBkYXRhLCBpdCdzIGJldHRlciB0aGF0DQoNCnw8LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLT58DQogICAgICAgICAgICAgICAgICAgIHBpdGNoDQp8
PC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0+fCAgICAgICAN
CiAgICAgICAgICAgICAgICAgdmFsaWQgaW1hZ2UgZGF0YSAgKGZiLT53aWR0aCkgICB8DQogICAg
ICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgfA0KICAgICAgICAg
ICAgIHNyYy54MSAgICAgICAgICAgICAgICAgc3JjLngyICAgICAgIHwNCiAgICAgICAgICAgICB8
ICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICB8DQp8PC0tLS0tLS0tLS0+fCAgICAg
ICAgICAgICAgICAgICAgICB8PC0tLS0tLS0tLS0+fA0KICAgY2xpcF9sZWZ0IHwgICAgICAgICAg
ICAgICAgICAgICAgfCBjbGlwX3JpZ2h0IHwNCiAgICAgICAgICAgICB8ICAgICAgICAgICAgICAg
ICAgICAgIHwgICAgICAgICAgICB8DQp8PC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0+fCAgICAgICANCiAgICAgICAgICAgICAgICAgICAgc3JjX3dpZHRoICAg
ICAgICAgIA0KDQpGb3IgdGhlIG9sZCBTb0MsIHdlIGp1c3QgdGVsbCBoYXJkd2FyZSBidWZmZXIg
c3RhcnQgYWRkcmVzcyBpcyBpbiB4MSAsIGFuZCBzcmNfd2lkdGggaXMgKHgyIC0geDEpLg0KVGhp
cyBpcyBiZWNhdXNlIG9sZCBTb0MgaGFzIG5vIGNyb3AgZnVuY3Rpb24uDQpXaGVuIHdlIGhhdmUg
Y3JvcCBmdW5jdGlvbi4gSSB3b3VsZCBsaWtlIHRvIGNvbmZpZ3VyZSB0byBmaXQgdGhlIG1lYW5p
bmcuDQoNClJlZ2FyZHMsDQpDSw0KDQoNCg0K

