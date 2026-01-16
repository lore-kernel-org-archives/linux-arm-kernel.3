Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E243D4A607
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 07:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qBGC9jtM0lgsiPD40PIUr/ZiPV8bfnFGIrnAK0oYcrM=; b=zqPWu2a2N/oIZ+qupWzZr/kvFD
	TV+WEOixvTUYrZYPr5eke5A9dR/aMP/Ri+OIoJm1+fvKGY3qGCecHPLCg0L53ZaHuTuf9hKe976k/
	Hl5d2+SIvNe6LK8rf37Kxyynd46GYrG2KYnpa18nkr2jmcAV0f1yb3Nb3zKxGu4rYjWqWIgI0mglj
	z3k4hyp55kLL58Uci6HS/DE2Rc+Sm9Qqh6DTpqa1A06QoA7xfWZXctdMMGO3e0pfGwyoBxCITjVrU
	TgWry2D1WWvRW4Axfs/2Oy2S5+ZLmah26BZErj+XrxdKFkrAjVdMrKchA6G5wyzDMq3R/VszHpNcu
	rgd2Br4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vge7I-0000000Dh6h-1KX4;
	Fri, 16 Jan 2026 07:19:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vge7F-0000000Dh5q-02hW;
	Fri, 16 Jan 2026 07:19:30 +0000
X-UUID: ae46f476f2ab11f08b17dd397dc63300-20260116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=qBGC9jtM0lgsiPD40PIUr/ZiPV8bfnFGIrnAK0oYcrM=;
	b=Lh7WYQoEM2EDKdYdA/cXDnZDn5iXKlyTTph6HkG/95Y+umCuWwJxPw+o92MoFjg9vcTackJnRimSK7Oq8ng9cTvqyn5CpU4RESRLMWdZx7dJ5PZF4rnB0rk1HB37MxsjeYETUMgj6ddQB1wwq5NhvXWdBVDBSIvb0binzWQM1HQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:17271fed-d3c8-4e15-917b-76a27cc9d756,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:5047765,CLOUDID:069799ef-16bd-4243-b4ca-b08ca08ab1d8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ae46f476f2ab11f08b17dd397dc63300-20260116
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1450217929; Fri, 16 Jan 2026 00:19:22 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 15:19:21 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 15:19:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eG1J7lI0t3llPrFGeogm7nmrHER408MBBAVSiNgi3ySVU6V6hdO2frxLDXWZhuH00ep8hbSMh+krLyYMJNrSQeAOX7KElo9aSxfq7Ac5a7P5Xa++yIOOW1yLn7YMEZwsJIb3abUmlzqsd2TbEp++yVHFTiiQRqeDE7q5OhJPi0ToV2Wek8oBi6qFRpZK3q7K1VFOVY5Iiao3t3+AwQFTbEUMKRFBxzHJyP+ziQFoswtKfMS0u6WVBERFA9lBof/xhNDphzMDR69bPgNe9jZ6Q8WEuVUbPivCFgqkDSOcyrs9Vzauo1/uriczH+q6IUhPumC1KL2th2otxdwtKKzk4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBGC9jtM0lgsiPD40PIUr/ZiPV8bfnFGIrnAK0oYcrM=;
 b=IuwLKfH77+PaPNzk/Ll3BPakfPMJREqsAbZyCPGTwxTRarBpm1ff0EwxXSAEeoqCRmXinUEey0Let1jc27nvxVx2YysW8Q6CiJ0R7Zi3ATiMtqeJOM5TYih2OW/RRg9/xURaYrwMx9KGwdhcH1gZG7wv2699a6cx1hzPqIgLfXcnUbfFScE4wZ6pkT0AmmeVPxwvdOjti1+AGm5UAgIgdyWXJErfB5EbHXLgwdmHP/MqP9XQNSTLdAI+Pm+bZ0q8FwmVbg7CWmo4uVq86ccVrMqUx8m0x98bs8eibim9I0mOTAXvwFJWsOgSjanH2Xvj3i3K1Qa0WriJ76wzjAEZXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBGC9jtM0lgsiPD40PIUr/ZiPV8bfnFGIrnAK0oYcrM=;
 b=SSOCvrIfeW+OBZYpxPQbSufC7JararZswBorIRjtzxgy8mzbLCmsANVCuEyEaUmIQiLe4/uF9yYStQaPNUY2iej7ssjV+p43A000icW8dAJrAiFrNC6KnJwLExE3VZcqgSLzcaQasnrIFsFyc7N3m5l2Mvfy6lFfV9ecZ8uPSuE=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB8493.apcprd03.prod.outlook.com (2603:1096:820:13b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 07:19:17 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 07:19:17 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "tzimmermann@suse.de" <tzimmermann@suse.de>, "simona@ffwll.ch"
	<simona@ffwll.ch>, "javierm@redhat.com" <javierm@redhat.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"airlied@gmail.com" <airlied@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [PATCH] drm/mediatek: mtk_gem: Partial refactor and use
 drm_gem_dma_object
Thread-Topic: [PATCH] drm/mediatek: mtk_gem: Partial refactor and use
 drm_gem_dma_object
Thread-Index: AQHcUuhzKVhJ9741T0OwRTdnWBccnrVUywcA
Date: Fri, 16 Jan 2026 07:19:17 +0000
Message-ID: <46eccd39845cd516f243912981610d78f9b2d7a2.camel@mediatek.com>
References: <20251111085114.9752-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20251111085114.9752-1-angelogioacchino.delregno@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB8493:EE_
x-ms-office365-filtering-correlation-id: 5c13642a-cbab-43a3-11f4-08de54cf8f6d
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|42112799006|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?WjJYMlprVXViODRkbndKZTZIUStKcFhyOXh6YTVMZkZlWjZIeVdqSFBOdXIv?=
 =?utf-8?B?cEZTemtoa1VadnorTlFJbUpDUURZck41VUlUVFdPZDhCRjZxUEJIbTNWTW90?=
 =?utf-8?B?b3RZd3ZBOXdqbEZyNmZld0ZQVUxORG92eHpUKzdVTHZHSitURFRNb2pSRHJJ?=
 =?utf-8?B?cWFLK29sM0h2bnNaSlBUTkFpS09aVmgvOU9wZUZnbG9kMW9mVEd5dHZvM1N5?=
 =?utf-8?B?RHBHZlpGakdPUDA3QkNvMHU2TmE5U1VWdTJpcENzKzJnY0xpdlFST0h2d3VQ?=
 =?utf-8?B?d0ZQajkvSDZkMytsNGJRZTluc1I5czhhbytwSEdleXVlMjJIN29NV3FWNFJy?=
 =?utf-8?B?Q1EzaUd6OVkwUTZIODhVcmw1djh2U0k1NGN1WmFwZEtrNzl2bU5CeXdRUDFz?=
 =?utf-8?B?R3BuTWdrKzZoTkswdjlEaWFYZ1k0N2F4SUlnQnQ3aWlxYzBrUngwZXh6R2dV?=
 =?utf-8?B?MXhOc21sQW1yMVUxNllIQUVrV0U5d3hCN3AvcVVPM1pVM1pod1QzM1AvZXZI?=
 =?utf-8?B?L0VocWk0M0RhR2d2SkRmRGVrZDdkNU9PTC9KTUdieHc5N0t5UEY3Ty9aZ2ZV?=
 =?utf-8?B?RjJXcEl5bDhLOUg1N0V4RXU5amd6UFlJL3pqU1IvUDR0ck9VZUZaWUJaWFlY?=
 =?utf-8?B?cWhFelNUWGd3NnhVUlhoWktiR09paDR5MU84dHJBbzFCQUp0Y0Z5VGI3bEtY?=
 =?utf-8?B?ZDdQQ0xXSW0xQjZwOFAwUGI4L0hhUkxyaWF4ZUZHT0VocXBxSmJ3eDF6QnI2?=
 =?utf-8?B?WCs4RUsrb2FNT0pIUWpDS1lKRFI3S1A0Q1RSVHpIenlYejVXM2ZWYWNHMFJs?=
 =?utf-8?B?RWgrOFFDSGtHcWdPekc4MTZhanRrNmFkUHdGYjBqakFLU1dSRHk5aC9lRTdk?=
 =?utf-8?B?bmdrK2JNNklkYnVydFpBWlJOQmp4SHR2NkRMR1lObDNHYjNoZGYvaCthSjNu?=
 =?utf-8?B?cm1heXU1S2FYUmY1UzV4b3djdG4xT2lkV29DWERiUFZ5NFQ2SXYwQ2JOUVRv?=
 =?utf-8?B?c2oya0p1YUFmcUp1SHUvN1NoWHo2YWYvS1pKc3d1SkFnd1pNN1lUWmFoWmhr?=
 =?utf-8?B?UVN0cTNLWEIxTmNOQnY5WDVLN1Y1R0JkSEw5eUphWEE3TzhoZ0VjMkZjeVpv?=
 =?utf-8?B?WDJxb0g0RHRPR010K0hZSDhaeWRMdmxsWTJJQXIvQzVtb0lUTCtsdTVKeTJn?=
 =?utf-8?B?ZGJWeStrdE8zTituRTNvQXhxQVR4S29GTTJOQ2pMUHJLblRNYUYvdjlqWU1n?=
 =?utf-8?B?azdITHdWU01kcnptanBuVzhOVjBQTkJudW9HQzIwMEExdFdYNCtPa1lYcTlz?=
 =?utf-8?B?ZWlDVTl0Y01OUGJvQ1pvbGpQOUliRlJ0eDF3SWo5WkxNa01yM1Z0WmErMy9q?=
 =?utf-8?B?eFFDcm5oeVUwZi93TjFWRnlQSG1ERzhFYVJQWDE0cnRYQUFQMEJQbzlEbXha?=
 =?utf-8?B?ZlgrM2JWREJIOUFua0tFZXZQZjdHWDVRMHlhRW1pVDNYanVYcVZNZzlCQnBG?=
 =?utf-8?B?UU4raXFJWVZpcll3WnhVVEttUW5KQlc3N0NwY2FVRkJUbURCVHp0ZjY2Mm0y?=
 =?utf-8?B?c2dDUGc3SmowdGI0NDZZSkN5TEdRRXBzRnUxZnBSYUczNGoyRmFXaStNbmhP?=
 =?utf-8?B?Z2FHbmE2Z1Q2cW5kRTNqbzZuSFVTZHFLUjB5bU50UU1yc0d0bm1PSjJDMy8v?=
 =?utf-8?B?aEtFV3NhcHpoNFdzWFhkWXZZV0V3QUVuS0JoeXdHQ0VZcFlvRC9YN0drcGhL?=
 =?utf-8?B?KzNWT3FFZ0lyRDhDczJEejBneVJwMFJwbWxQYjEyUXJaQXZHZTZwLzhqU1Vx?=
 =?utf-8?B?T24rZm1KRFhNUW01b1VFRGlWUHd3Z0ZQTGNZYm1oOU1lTGJwTXRhQ2kxM1h5?=
 =?utf-8?B?MWZtOWZuQy9QVys1bFFOUWZlY1RBYlpyaEd3cENLNktGTU1PY3RDUUFLOVlx?=
 =?utf-8?B?MnhtNS8yTmJNeUF1eTU4VlNhZHcxczlMYXB2czdMejNYSEdsR01BMUo3VFlo?=
 =?utf-8?B?YTNLVUcxVmtyMjIwY1RBSHdrcmEwRTV3d0VkU3lwWU1kdG0rS3JiZWs0K2sy?=
 =?utf-8?B?cVloNzdObWxxSU1SS0F1U3VzaThQSi9jK2MvTmpBYm9McUsralhGTzFFcHV6?=
 =?utf-8?B?bXJpUVZNdnZDRDlySmVTdEVDVkJiaDRoRERzTHlIb2krNE5LQVE5L0Ewak5D?=
 =?utf-8?Q?sN5FpYiVLMo9SHZmLAY+axA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(42112799006)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R05nT0FoY0dHWlVwRWtHQldJMFVyZ3ZaZjR0VHRkSFpwWUhqTkdMZ3ZPbkRv?=
 =?utf-8?B?cWV6STArdFFGNHBhU1BZUGpGTngwcFFvNzRGSTltWkdMVTZqWWI1WVdkNEF1?=
 =?utf-8?B?ZjIwK3FsMWNhTDJNL05KVHI2M1NPVFhqT1N5alRoYlhHL2o3bE13Qy8xaXRk?=
 =?utf-8?B?UWRwdzRTeXdHalFacnZKZ1A1aGt2M0V0cFZoUk1JR2dJM0ZuUWM5dVdBQ2dO?=
 =?utf-8?B?WXN1VGpIV0RvbUlzK3pEbElEV25QeWhwdVNlU2t5U3J5RlRsMXVBdVVqMEJ1?=
 =?utf-8?B?YVRLUGtwdkc2aG9VeFhMTUhscDZhVGhWMVJFTXlFcTliK0JVK3VxYlpSSVhP?=
 =?utf-8?B?cy9UOUJsY3o4TFlyUWgvcGdaREdFeHk5TDlYU213NUFkMitRNG9EbHhZYUc3?=
 =?utf-8?B?VHRhM0R4ZHUweVNCWGFQZlFwSE9tTUpoT0l2dFdiMUg1TDJpM1UxeVFWWFhM?=
 =?utf-8?B?QXZXWERGQ241RVNhamIyS2ppN2t4TEdNdVBiUFZrL3lEUU5Xa29xR2Y2bmVT?=
 =?utf-8?B?RENLMFdGTElTY1Biam1uK3YzWVpwbk9mM3FQV1ZGNW1ubE4zaWZGV2JQREs5?=
 =?utf-8?B?cWk5ODhTdHRqODl0YWVRc1BWR29oUzZjZDJwZVZqWGVVY1lTbUg0UE5SU1Vl?=
 =?utf-8?B?K1lZRzY0T2wzdUYwZHVpMmRZbW9VM2M0N2ROTElvbTFyWTNvblBYdElmMFQr?=
 =?utf-8?B?dEpiYjdocG1Ba3J4RzNnUk5USko4ZzBXNUI4Vzg5V3dMcE9CVWpOczd5NGFU?=
 =?utf-8?B?SU1nYnJETmQ4aGhPb2RETTNUL25jeHRJL1dDOGh4dC8wa1VJZlkwc2lBbkhl?=
 =?utf-8?B?MEE3bm5wOFlIeWlDQjVkK1pHNWp4NDczQ1lrY1FQNFpiRFJITW1UWFBwOVVS?=
 =?utf-8?B?Y1QyZDVhV3M5ZEZvSnYwK0xGSStkM1ExZnp4TmdUL3gwZVE4aU4veThnbUd3?=
 =?utf-8?B?VmhvVTZlU3puUzJyTWVLSVF5SmFNeWxPSWRiTjkya0dmR0EzMVRwS0lFQUs2?=
 =?utf-8?B?V0hHc212S01KNjc4aUVScm9vazg4Y0xjTC9FamVKeXl6Nks5VmpBVDJDZkNt?=
 =?utf-8?B?WFNmeCtnSE9xdlAvS0lBNGJ0Wm1jdEpPajhEODl5TEpsazB2WW1QTnNabjJE?=
 =?utf-8?B?YlhxaXBBME8yU0p1Q3U3TnBvWitzSjd1YXVib2NEcHFsUGdxamE2YytEOEhE?=
 =?utf-8?B?V0tHcytxeGlHYjFPUS94U08zOVdVN1VXRnF2RHFIdDQxNDRBM3FaOWE0MFk5?=
 =?utf-8?B?VU1FN3hXUzhLOVdRWGNtSVczUjlYek5lSUZTMHNnR09YUUpWTTJaWHRsc3BJ?=
 =?utf-8?B?K3NYY3NMcXJiSXJ6Mk4xUkRhdEh2N0N2aUxtZGc5bGJyTFcySTBuMTQ2bVZt?=
 =?utf-8?B?YnczcGJtaUQrZy9ZU21PbE0zTXdubXdRKytxYzVPQ1pIRTVkU1pHTkJTWEpO?=
 =?utf-8?B?RStIcWZ0TG10RHJxR1VIcnJEb0FiSDBqdUJUWjNxZFlWaE5PNU5vSTVCUmtw?=
 =?utf-8?B?NzNLdnFsNkdFckhJNkdyWWFCSG1pOW5tcTJhWXdtMUhISThiNks0Nnc5TUxU?=
 =?utf-8?B?QzR3UHVzOHEyYnZJRVhxVzJ6SXI1eDdHMGFqMU1SQ0JPSDRhTWVHT3VQd2pO?=
 =?utf-8?B?ZktBc0Y0RWNBckZFU1RLZTJ1VndIV0FNbVcyelhYTzFJeHc0cjc3VXY4VXZG?=
 =?utf-8?B?OGorTXhJQTNoc2JmbndBZVVOTUNiOC9wc2hFZTZacG1kM1AxQkF6b0p1K3pP?=
 =?utf-8?B?TWV1WHJkb1NtUjZtS3M1cHBuNVRKcUczR0tSS0dwU1V1bEJnY0p2dnNJWUY1?=
 =?utf-8?B?RlBSMTVvancwaUtMOWZFMW91L1EvTzRuZ2lOdGpiem01VlV1Rm5jZ3l2emVJ?=
 =?utf-8?B?Ukw1YXMzSWcrUEEzYzhXTTMybEVwR21FRjVaYksxTC9GaDVDQmF4YmN2ZVNR?=
 =?utf-8?B?SklUdkhmM1ZwQVhaejBRT0pPN240dVczRmcwazNiMXd1YzFETnltWVE2ZFZy?=
 =?utf-8?B?SFRPTmlVNnhiUDIwY1Q3WS9aWjN5eGM1ZWZjaVppb3B2L3dmV0FTbEY4UEFS?=
 =?utf-8?B?OGlXQUxCVVYwUzd1ZWIrTUdCa1VyMmVmREdsMURzWXhWLzV0WGhBd1JmczB3?=
 =?utf-8?B?Smh0N2pWOGJIS1gxb3BMaC8wd2VDcms0MGw2MHgxd2Y0UXpjdUcwUWk5SVF2?=
 =?utf-8?B?a0gzUU5vcTl0bmpPVEtvdkRlWEMwN0VrVUZ2OElwYnN1cFpkaWNGR3YxeFRj?=
 =?utf-8?B?VlYvaSs4am9ISlJIOXN1NDFZTk4rT1Y0MFp4aFlyNHpwc2hsSTFzaG9KY1lK?=
 =?utf-8?B?WHhRbTIxcElaMWJkZTBHUmxwNUppcG5pdFhvQ1hOUGZEaURRemd4Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0F2E842C88EE5A4AB6B600DE2FE0F298@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c13642a-cbab-43a3-11f4-08de54cf8f6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2026 07:19:17.4317
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SkQSg/DLknhANIIiDBGtstYNHSxO1AeShYPEyR8ftM9gE10hi3CnCJ9iO9+EFI3yc+9K9VQnBh2LAIH2X9q4KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8493
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_231929_061179_99B5F9C8 
X-CRM114-Status: GOOD (  20.82  )
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

SGksIEFuZ2VsbzoNCg0KT24gVHVlLCAyMDI1LTExLTExIGF0IDA5OjUxICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBQYXJ0aWFsbHkgcmVmYWN0
b3IgbXRrX2dlbSB0byBzdG9wIHVzaW5nIChhbmQgcmVtb3ZlKSB0aGUgdW5uZWVkZWQNCj4gY3Vz
dG9tIG10a19nZW1fb2JqIHN0cnVjdHVyZSBhbmQgbWlncmF0ZSBkcml2ZXJzIHRvIHVzZSB0aGUg
QVBJDQo+IGRlZmluZWQgZHJtX2dlbV9kbWFfb2JqZWN0IHN0cnVjdHVyZSBpbnN0ZWFkLCBhbmQg
dG8gYWxpZ24gYWxsIG9mDQo+IHRoZSBmdW5jdGlvbnMgdG8gYmUgc2ltaWxhciB0byB0aGUgbG9n
aWMgZnJvbSBkcm1fZ2VtX2RtYV9oZWxwZXIuDQo+IA0KPiBVbmZvcnR1bmF0ZWx5LCBmb3IgdGhp
cyBkcml2ZXIgaXQgd2Fzbid0IHBvc3NpYmxlIHRvIGRpcmVjdGx5IHVzZQ0KPiB0aGUgZHJtX2dl
bV9kbWFfaGVscGVyIGNhbGxiYWNrcyAoYXBhcnQgZnJvbSAucHJpbnRfaW5mbyksIGFzIHRoZQ0K
PiBETUEgbWFwcGluZyBoZXJlIGlzIGRvbmUgb24gc3BlY2lmaWMgZG1hIGRldmljZXMgaW5zdGVh
ZCBvZiB0aGUNCj4gbWFpbiBEUk0gZGV2aWNlLg0KPiANCj4gQWxzbywgc2luY2UgdGhlIG10a19n
ZW1fb2JqIHN0cnVjdHVyZSBpcyBubyBtb3JlLCBhbHNvIG1pZ3JhdGUgdGhlDQo+IG10a19wbGFu
ZS5jIGNvZGUgdG8gZ3JhYiB0aGUgRE1BIGFkZHJlc3MgZnJvbSBhIGRybV9nZW1fZG1hX29iamVj
dA0KPiBhbmQgcmVwbGFjZSB0aGUgaW5jbHVzaW9uIG9mIHRoZSBjdXN0b20gbXRrX2dlbS5oIGhl
YWRlciAoYXMgaXQgaXMNCj4gbm93IHVubmVlZGVkKSB3aXRoIHRoZSBEUk0gQVBJIHByb3ZpZGVk
IGRybV9nZW1fZG1hX2hlbHBlci4NCj4gDQo+IFdoaWxlIGF0IGl0LCBhbHNvIHNldCBEUk1fR0VN
X0RNQV9IRUxQRVIgYXMgYW4gdW5jb25kaXRpb25hbA0KPiBkZXBlbmRlbmN5IChyZW1vdmUgdGhl
IGBpZiBEUk1fRkJERVZfRU1VTEFUSU9OYCBmcm9tIHRoZSBzZWxlY3QNCj4gRFJNX0dFTV9ETUFf
SEVMUEVSIHN0YXRlbWVudCBpbiBLY29uZmlnKS4NCj4gDQo+IFRoaXMgcmVzb2x2ZXMgYW4gaXNz
dWUgcG9pbnRlZCBieSBVQlNBTiwgYXMgd2hlbiB1c2luZyBkcm1fZmJkZXZfZG1hDQo+IHRoZSBk
cm1fZ2VtX29iamVjdCBpcyBzdXBwb3NlZCB0byBiZSBjaGlsZCBvZiBhIGRybV9nZW1fZG1hX29i
amVjdA0KPiBpbnN0ZWFkIG9mIGEgY3VzdG9tIG10a19nZW1fb2JqIChvciB0aGUgbXRrX2dlbV9v
Ymogc2hvdWxkIGhhdmUgYmVlbg0KPiByZW9yZGVyZWQgdG8gaGF2ZSB0aGUgc2FtZSBmaWVsZHMg
YXMgZHJtX2dlbV9kbWFfb2JqZWN0LCBidXQgdGhhdA0KPiB3b3VsZCBoYXZlIGJlZW4gdG9vIGZy
YWdpbGUgYW5kIGdlbmVyYWxseSBhIGJhZCBpZGVhIGFueXdheSkuDQo+IA0KPiBGaXhlczogMDk5
MjI4NGI0ZmU0ICgiZHJtL21lZGlhdGVrOiBVc2UgZmJkZXYtZG1hIikNCj4gU2lnbmVkLW9mZi1i
eTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9A
Y29sbGFib3JhLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0KDQo+IC0NCj4gIGludCBtdGtfZ2VtX2R1
bWJfY3JlYXRlKHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2LCBzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2LA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX21vZGVfY3JlYXRlX2R1
bWIgKmFyZ3MpDQo+ICB7DQo+IC0gICAgICAgc3RydWN0IG10a19nZW1fb2JqICptdGtfZ2VtOw0K
PiArICAgICAgIHN0cnVjdCBkcm1fZ2VtX2RtYV9vYmplY3QgKmRtYV9vYmo7DQo+ICAgICAgICAg
aW50IHJldDsNCj4gDQo+ICAgICAgICAgYXJncy0+cGl0Y2ggPSBESVZfUk9VTkRfVVAoYXJncy0+
d2lkdGggKiBhcmdzLT5icHAsIDgpOw0KPiBAQCAtMTM0LDI1ICsxNTUsMjQgQEAgaW50IG10a19n
ZW1fZHVtYl9jcmVhdGUoc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYsIHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYsDQo+ICAgICAgICAgYXJncy0+c2l6ZSA9IGFyZ3MtPnBpdGNoOw0KPiAgICAgICAg
IGFyZ3MtPnNpemUgKj0gYXJncy0+aGVpZ2h0Ow0KPiANCj4gLSAgICAgICBtdGtfZ2VtID0gbXRr
X2dlbV9jcmVhdGUoZGV2LCBhcmdzLT5zaXplLCBmYWxzZSk7DQo+IC0gICAgICAgaWYgKElTX0VS
UihtdGtfZ2VtKSkNCj4gLSAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKG10a19nZW0pOw0K
PiArICAgICAgIGRtYV9vYmogPSBtdGtfZ2VtX2NyZWF0ZShkZXYsIGFyZ3MtPnNpemUpOw0KPiAr
ICAgICAgIGlmIChJU19FUlIoZG1hX29iaikpDQo+ICsgICAgICAgICAgICAgICByZXR1cm4gUFRS
X0VSUihkbWFfb2JqKTsNCj4gDQo+ICAgICAgICAgLyoNCj4gICAgICAgICAgKiBhbGxvY2F0ZSBh
IGlkIG9mIGlkciB0YWJsZSB3aGVyZSB0aGUgb2JqIGlzIHJlZ2lzdGVyZWQNCj4gICAgICAgICAg
KiBhbmQgaGFuZGxlIGhhcyB0aGUgaWQgd2hhdCB1c2VyIGNhbiBzZWUuDQo+ICAgICAgICAgICov
DQo+IC0gICAgICAgcmV0ID0gZHJtX2dlbV9oYW5kbGVfY3JlYXRlKGZpbGVfcHJpdiwgJm10a19n
ZW0tPmJhc2UsICZhcmdzLT5oYW5kbGUpOw0KPiArICAgICAgIHJldCA9IGRybV9nZW1faGFuZGxl
X2NyZWF0ZShmaWxlX3ByaXYsICZkbWFfb2JqLT5iYXNlLCAmYXJncy0+aGFuZGxlKTsNCj4gKyAg
ICAgICAvKiBkcm9wIHJlZmVyZW5jZSBmcm9tIGFsbG9jYXRlIC0gaGFuZGxlIGhvbGRzIGl0IG5v
dy4gKi8NCj4gKyAgICAgICBkcm1fZ2VtX29iamVjdF9wdXQoJmRtYV9vYmotPmJhc2UpOw0KDQpJ
J3ZlIHRyY2UgZHJtX2dlbV9oYW5kbGVfY3JlYXRlKCkgYW5kIGZpbmQgaXQgd291bGQgY2FsbCBk
cm1fZ2VtX29iamVjdF9wdXQoKSB3aGVuIGVycm9yLg0KUGxlYXNlIGNvbmZpcm0gdGhpcy4NCklm
IHNvLCBJIHdvdWxkIG1vZGlmeSB0aGlzIHdoZW4gSSBhcHBsaWVkLg0KDQpSZWdhcmRzLA0KQ0sN
Cg0KPiAgICAgICAgIGlmIChyZXQpDQo+ICAgICAgICAgICAgICAgICBnb3RvIGVycl9oYW5kbGVf
Y3JlYXRlOw0KPiANCj4gLSAgICAgICAvKiBkcm9wIHJlZmVyZW5jZSBmcm9tIGFsbG9jYXRlIC0g
aGFuZGxlIGhvbGRzIGl0IG5vdy4gKi8NCj4gLSAgICAgICBkcm1fZ2VtX29iamVjdF9wdXQoJm10
a19nZW0tPmJhc2UpOw0KPiAtDQo+ICAgICAgICAgcmV0dXJuIDA7DQo+IA0KPiAgZXJyX2hhbmRs
ZV9jcmVhdGU6DQo+IC0gICAgICAgbXRrX2dlbV9mcmVlX29iamVjdCgmbXRrX2dlbS0+YmFzZSk7
DQo+ICsgICAgICAgbXRrX2dlbV9mcmVlX29iamVjdCgmZG1hX29iai0+YmFzZSk7DQo+ICAgICAg
ICAgcmV0dXJuIHJldDsNCj4gIH0NCj4gDQoNCg==

