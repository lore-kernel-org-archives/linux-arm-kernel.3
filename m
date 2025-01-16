Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFA0C02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 01:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tSfL0idn2muhR8tsHFO91+bvYkeWfV2USxiFBqFIHP8=; b=xt575NOmICTLme/XTmXkLpOzWh
	D2F4Wu3dGsezyIxBBrfSESaowbAT1nYCSokHE8Q+TN3S59d9nxvYt+NmxoPOKtvdLpmGk5gwksohv
	mas1w33/Rs3wGMn63Qq5fZShB/wvOZUenkDqxYgX5gyDPuDpS/AZxLcfbvIjKA6Md5zH/Rs77szbd
	Nvimd1B2aGlnXQB/s+vbKIL6jJtl6dQI6za7v+nSnIFb1Mb6VW46sYnq9iegdqMJ6SJm3YaMui3YW
	UhU2lDAzlMohqZ2HGWPrrnUZX83LGcUxIqBZ8bVO6PSa2ZsAl/57wCYTJgFNMmV5NKaEFP2nm6Kev
	mQ1JSiNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYEyj-0000000DZhJ-2uZh;
	Thu, 16 Jan 2025 01:47:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYExA-0000000DZXO-1WUq;
	Thu, 16 Jan 2025 01:45:49 +0000
X-UUID: 9951dfbad3ab11ef9048ed6ed365623b-20250115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=tSfL0idn2muhR8tsHFO91+bvYkeWfV2USxiFBqFIHP8=;
	b=dqRB/aCV0fLww+siLFui/Ifz34CJboO2N3tBKVzDCMkZcT1ltSOkXOCnSzg7yifhJgoTexNmU/TvyMU2sce0lGxxwh5AVYXSmStQpz8X/AXPPdlK9sE5eqjZhPuy97c+G5dUwoWw5u/gtPEQWkh3bpOq51yc6Hd45F1MmWmQ/m4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:3c36dad8-dea7-411d-8be8-824e52c25675,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:22f4f337-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9951dfbad3ab11ef9048ed6ed365623b-20250115
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1644845498; Wed, 15 Jan 2025 18:45:43 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 16 Jan 2025 09:45:40 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 16 Jan 2025 09:45:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SFDOagtfHypNMqQebyuslpkC2fCgLkR1StFmHL+mthbZ1b34zZ0+gWQ8+Y4kGn5xBeg8jIFf+QidGjiMOxE6h988ul8g8wJJ5g8e9M0vyXmSctkRWSDFA0EjKI9kfjzSaA5rt3UtGbV0d8zHsqcGIm3ROXNXbpBorwg0VQyDIqI0cLDvB1dE2HqTSxHh+YoWQsdH08kpiydBF9zAuwZ9/JTC/c11jyNxT2lLvWw/JLp12VrkvTcHnjfBfdN0nKhdlKECNypbz8tnEB/pVewRfbO1GsHZkHmkwTtLCi60S7oyM4Vy72J+V50dKLV/LAyqi+s6okpcZJ+0kpYMqd3EuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSfL0idn2muhR8tsHFO91+bvYkeWfV2USxiFBqFIHP8=;
 b=D40493XkaHqXNxRCFEk7QI8cjeH3+jOKX2ghIxtjRiNiWx2KCx52CGgvVQQweKGUsLW6HnZgSy5h5aP9hwWT9Ra2Vp8ojj7pIysDb/l0n3c4guk6PbE8mjI9heiU4dzmtT7Do0T/MdEl5+DBaOrOcqTwup4YAiq9HVsaaVtF6TALwq5bHwlnmQuXfKcvj8J6qcmMMg/Ly+s+dRO0hvSz4YITOogFdVuBcwwkPdLwOW0dms2hwgc0snYsCoS/dagIMmcrkB8LYTKETCFsFF5C7Ieqd+jvWkub2Q5wXMdGzt+P6Nhgkvibu7QHmJkLgvAHPdQNZwTVMOWwpBlMGwYbjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSfL0idn2muhR8tsHFO91+bvYkeWfV2USxiFBqFIHP8=;
 b=i60Ab9/31edERUPOqostmx9pn69D6z2u6XgpNw08uYNUHiu4jyHfD4SzeAB3jiN1US466rm4xeB/uzUmdbH2tg5chPhFLAmKDrKJEpjYAaZSO15ZS2pf8JiBjbkBU29eVGT46BuJy0Kkb48AOgfot8xso4APKDe3udAJ3MCXd68=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SI2PR03MB6590.apcprd03.prod.outlook.com (2603:1096:4:1e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 01:45:36 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%6]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 01:45:33 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?=
	<Paul-pl.Chen@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"treapking@chromium.org" <treapking@chromium.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 08/12] drm/mediatek: add EXDMA support for MT8196
Thread-Topic: [PATCH 08/12] drm/mediatek: add EXDMA support for MT8196
Thread-Index: AQHbY17n1MDSJJbk8EyTw+G3YouNKbMYqeoA
Date: Thu, 16 Jan 2025 01:45:33 +0000
Message-ID: <df7472540cd546ed9ee0c2fb3e10c666b442a68e.camel@mediatek.com>
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
	 <20250110123835.2719824-10-paul-pl.chen@mediatek.com>
In-Reply-To: <20250110123835.2719824-10-paul-pl.chen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SI2PR03MB6590:EE_
x-ms-office365-filtering-correlation-id: b73b0324-089a-45d1-4e80-08dd35cf7794
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RCtRN01ibURIcU80Ky8rSDRFemlzYjQyN2UveVZHbFgrYmdFbXdRYitxVThG?=
 =?utf-8?B?T1ovVVpPQ2FrSDhoTlpuQmREQm5YbWZLTWRhSUQwS1llYU1OaXUwL3pGQUpR?=
 =?utf-8?B?RWdCN1FLMk5TZDU2d1hrZE5UanhVQkd3RUlGeDFQajgyWDRzSzIvaFBNeW5X?=
 =?utf-8?B?VW5SY1g4OTMzeFVMVStQbGZSakhCcHBucGxJa0ZVdmtHWXZEWDBnam55cFpR?=
 =?utf-8?B?KzhVSmVGUFNUQ2JDcnNNbUlXNmpQaU1JVGpaY0xjcFhpWXpmcVdXSHJKVGpP?=
 =?utf-8?B?ekJpVzZHWVBaVUQrTXJ4Z3MxZDdkVUNtYWQvdlEvM0R3TFJJNDdVemxGR3Nz?=
 =?utf-8?B?SlQ1N3RJM2prVWZQeXd4RHZNNEZMZzNNMjFBRENJeGhWVndldFE2ZG5TU1dX?=
 =?utf-8?B?STNnaHlxOERjU3RuZmlPRUZ2L0hkU21hanVHUVBDUnRLYkY3YjQzdmVaeEFs?=
 =?utf-8?B?ZGhtRndTWlEwRnhmQ0V3dlgyd3pQOGVyVDBWcmVRN1hOZCt5UGdNWTJWOFcz?=
 =?utf-8?B?dnRyaXVKd1d5dWdRQldEZS9PcDRuMzhXbEZCM29MZG1Gb09ZTm50R0g0Y243?=
 =?utf-8?B?ZmpZVXg5Z0pKRk92MDRYRCtHbHVYc2dXbldndE9uUXBXWTNjWG9JMy9odkly?=
 =?utf-8?B?cWdKNWVOWW1RWHY5bkdOaGl0ZTRkS2ZHY0J2RitTS1kwaEdSTFh0clZPWlQ4?=
 =?utf-8?B?TTU5c0FrSkc1VzNXeWZkbmN3emFBa0NGa2JvQWdXMmt2MDJCT09hMHpoL3BW?=
 =?utf-8?B?SytoK2drNnl1UEx0bUxnQTl4Z3FKKzBkYUdPYWhoV05WNFFpMkhzNzNtL3RN?=
 =?utf-8?B?d25KWjFYRGV1T01SWVE2bmVCUVI0MzJFSGtPaG1GdS8wSEZKanNNSUVuSVpi?=
 =?utf-8?B?R3ZVNFVlV21WeFNwMHM4NUN4Z3k1VVNXWFUrVTFPNS9qaWpHUnY1OHlZdnBF?=
 =?utf-8?B?UFhYczJ4Z2EzNi9ZcjFrbHRZZVNIVUs3Wnl5RW1hSGtKUjhqQVJtZWdOb3gw?=
 =?utf-8?B?eU93QlBRY3NwZVViY05SelZySFdnT0hMQm9ld01NejRWRnpGcytsMWR2clNL?=
 =?utf-8?B?cHB2ZWFkS0pRWWlzUmxFZWtYWk1xZUcyeXJDcFRudGtkQTlFMmVDUVdqcnBF?=
 =?utf-8?B?c3l0cXhJYU9QTm9FOE9CQndsYW5Db0xhYW5tbWlMUFNlUzFwWFIzaENZRXNZ?=
 =?utf-8?B?NXo0R01BL2ZDS212bnZtNkdyMHdoSU9YRFpDazJVbkJpSWlRVHQwUmx6M0dM?=
 =?utf-8?B?Q1RzSGVuZjM3NDUwaDBLOHFwQkJVUys5Q01kSnJxNjJENERqOEVMakFEVEFB?=
 =?utf-8?B?RGpsekJLTHlUTzI0WkdBOG1vdHdhYzdNWFhKY1BWN28xcC96bGRFM2R2eW5L?=
 =?utf-8?B?bkpzSlk5a21UU0VvN3ZzOG54Z3kwUDk4LzMxZTZ3RDRGbVhud0s3SExKR29M?=
 =?utf-8?B?UHdxa2lrUFJUdzBtQnF1a2l4WWZvUVR5TDVBbE1iQ1lFc2cyUkRYUXFGS1FS?=
 =?utf-8?B?bFdaRVh1eW1nYS91MU9KV2hTS1Z6NXFVQTJSQTdnV3U3RUg2YlR6emNheTAv?=
 =?utf-8?B?WTk4c1BYWUVMR01aQ2hLVEVQeHAxNFUrUGRnOHB6L3dsb2dvaDViellnbCtF?=
 =?utf-8?B?NXNGbzc1NTRPZ1JwcWZtQ0tiR0lhblovMUtid2MwZFNpMUQrdGFyWXBmbFIw?=
 =?utf-8?B?UHduU0JKRHFDWm5RenRqTnlhYm8yU0J5T1pvUTFST1d3UFZnNGhxQlg4b0c5?=
 =?utf-8?B?RWh3Qldaam55OVM1MTdGdW9KN2c4YXFPUnVFd3NvZUY0QmUybDJrMWV1SHR0?=
 =?utf-8?B?WWtmaUR3a011RUVNeHRiQ1JEUnQxNDlaOVMyUFlKNXNYRTFTSlJDUUgraEQ0?=
 =?utf-8?B?cytYVU13YVM1dWxqOFY4NncvUVRTSlRjbURabGZ2ZUtGRkZVMmZmUjFQMVBi?=
 =?utf-8?Q?vP3P2HyAHUD1djIv4QLpEG7llVxPX1Gz?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWdmaCtVa0tUTWYwSzl0ekVUdW5qdUwzWEpXR3h2NHQrRVl1bk0wVit6eUQ1?=
 =?utf-8?B?Tm5abGxKa2ZWNlNyaVkzRTJEY2dWaDNiRXVmaDFFMVpIOFNFMmNWSExOeWYw?=
 =?utf-8?B?RVB5LzVaU0ZFZDBqN2x2SE1KZXZLWmd4Z0drbjZIMGt0ZS9ldVNKbFNacWxi?=
 =?utf-8?B?Z0ZETEdIR3JOYzVyTVhmWk4rU2Zja3R4cnJUSXFudFh1WW0xRmlrTVFhdjdB?=
 =?utf-8?B?UjRYR1diN0huWDRONEdOLzFWMUZyUUNQK1p4bDdNUExXZEtLaGdvOUxQR1hv?=
 =?utf-8?B?WXRxWXFQK01iT1RyQ0NJaC9hNWY2eUt1YTJYci80T2dmdWhFbnh1eE1KOGcr?=
 =?utf-8?B?cXB0alFlWlBGWTkrZ2NDUXhOVzBhWEpsSWtrQzFlcEFEQTRzUVAwUDVIbERh?=
 =?utf-8?B?dUdjeFFWd2V4US9HeVV2VUFUcU50UEVCQklQNDJTZDFNekNTNEVPT2w3Z1RH?=
 =?utf-8?B?WlNsUVJ1RzRiQWFYTEF6cTVHT2xoUEJCSnJabnl6Y2JIaWZ3ZTlGdjhQMmNL?=
 =?utf-8?B?bCtxL0ZqUUFrL2l5cU1TMERoSkZRVCt0VC8rVnFleXo2aDhlcDl3S21iSVFD?=
 =?utf-8?B?R0VsSHpoRmhMbys0cHUrS21vQ1p2R2IrRlgyallQQjNiVFdCeG81UTBjbXBv?=
 =?utf-8?B?RXl4bGl4UVI1SDIvUmlmS0h6TDF5dS96eVYwVUNTVnJMTmMza1NOQWkrazdx?=
 =?utf-8?B?bzFaOHpFRHdyeVJRS0w0MFpUanRCb3pSV241S21DbWo3M1lqWmZVTTR2amZM?=
 =?utf-8?B?M0JFbWVSUWNMbk5GbE9Zc3g5MThhWFhOYUdpV3UyTkRLazlqblpmTi9mTmdl?=
 =?utf-8?B?NTlTbHNnK0NLN0NCWnF5a0YwYyt1WEkwTityWlNtOEsxZDl2VUhmUE9RY2xn?=
 =?utf-8?B?Uk5KRWJmUmhiUEQzcDI2RVhMbkRJVG5hZkNGTmp2SUhSU2VuK1hlNkxlUWFF?=
 =?utf-8?B?eTJIcVJxNXowd3V2MEwxR3JUV1NhYURkZkwwRmprdVBESkVUT0V6eTF5RHFz?=
 =?utf-8?B?TlFjcTRiZHVPZWRaS1NkNHBwQ1NveTRvRlFvV1VMeXJqZHZLN2pkZ2czcm9l?=
 =?utf-8?B?cFpGNGhzMVRaU1MrZGthUVN6TjVGbjU0SEdDVmxnYWc2WjRRc3NzdHZ3Vksz?=
 =?utf-8?B?RWxUTlNtQjdiV2dZZ3pIa3hFZFdRZExCWHFjZ085Qjl5cHU5ZVBzMVBVa3pt?=
 =?utf-8?B?SldqVUZGMVQyK3YvQnh2eU5BUDhkRXRadkNjTER5ajVlbEJVaGRXWEdtaC9O?=
 =?utf-8?B?cUtOVG1JVWltRWRWUG1OeE8wa3k4Z215MzhweHhRSnpXUHdGUzlXOUtXWTJr?=
 =?utf-8?B?M3B3aHBIS1c0akJKWU12Q1V5Y0F3WEVEeDJBeDRjNHdjVVVlRXkwSDJpeXM5?=
 =?utf-8?B?RUYvWUY5ZG9Jay9TSFdIOFRhT1FkRXBBaVFBbVdPTHBSQitnMnpvYThEOW5S?=
 =?utf-8?B?TmNiZlRWeTdVdGc1SWZzMHlYODY2RGpUREFJUTFQbUdUYVRjbkhUU296VHpz?=
 =?utf-8?B?M1ZvUXZCd2tSd1VyOVM4aWw5dWEwMW5OenRqVktuMGJhN3Z6by9XTW9wU1JV?=
 =?utf-8?B?czB4MXUvMndXd1ZVMHpOMWc2WkNERnBSSzUwVExkUHRUSXl1ZmZGUjBtSlAw?=
 =?utf-8?B?QzJDYjhWNnVqYnFXZU82WWRXRDh4VGNXTWxvOFF3NW01dXhjTW5ndENMM0Vy?=
 =?utf-8?B?NEw2OERMZ0syWW1Cbmw0ZUs5TVNTNFRyZDNQekUwYURsZzN0Z0VybFdkdTFX?=
 =?utf-8?B?NW1DVEJuU0l4WU5Va3g1L3BZcElXK2YzaDdqNlBwY0hqWVQ1RW81ZU1QZ24x?=
 =?utf-8?B?RURwZjM4Wi8rTWxxNjBpYjRQL2pYWEFsUnNYUXZVVzB4Q2drMHBRVWJGUHE4?=
 =?utf-8?B?eWc4L0xWVUx4T1BpcmJYMFljTmdueTZsTTRzZGROUDhab1BCVXlUcjFTT0lI?=
 =?utf-8?B?WnJaTDBiMnBtWkJMMmN6bFQrL2JTUlUrV1d2c20rNGtIR1pCQVB3bXRFWlNL?=
 =?utf-8?B?NmJMdXZSOTEreWRLNDRoQVRXdnFIczJPWmJDdUQ3MzU5REFTdUV2MjZOQVpo?=
 =?utf-8?B?VzdlUllaV3NPRmdnclU3NTBOakJ1Rnc5MTRMMHpvaDZYaXdtbmQ1Rlk3dlVK?=
 =?utf-8?Q?lOwQnaD7AHG/rtusMOQ3qVYCU?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F8E20F0C85475343AA0EF59333544FA8@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b73b0324-089a-45d1-4e80-08dd35cf7794
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 01:45:33.7055
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I5RwkozB6Xb0ogdXySkPjut7PwicVOMqrjA5jLiIXJGRYaJk1OOFixHTm8u3kwMkqLM8qJCQAjHiR1UfZNaF4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6590
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_174548_424187_CDA663EE 
X-CRM114-Status: GOOD (  11.72  )
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

SGksIFBhdWw6CgoKwqAKCgpPbiBGcmksIDIwMjUtMDEtMTAgYXQgMjA6MzQgKzA4MDAscGF1bC1w
bC5jaGVuIHdyb3RlOgo+IAo+ID4gRnJvbTogIk5hbmN5LkxpbiIgPG5hbmN5LmxpbkBtZWRpYXRl
ay5jb20+Cj4gCj4gPiAKPiAKPiA+IEVYRE1BIGlzIGEgRE1BIGVuZ2luZSBmb3IgcmVhZGluZyBk
YXRhIGZyb20gRFJBTSB3aXRoCj4gCj4gPiB2YXJpb3VzIERSQU0gZm9vdHByaW50cyBhbmQgZGF0
YSBmb3JtYXRzLiBGb3IgaW5wdXQKPiAKPiA+IHNvdXJjZXMgaW4gY2VydGFpbiBjb2xvciBmb3Jt
YXRzIGFuZCBjb2xvciBkb21haW5zLAo+IAo+ID4gRVhETUEgYWxzbyBpbmNsdWRlcyBhIGNvbG9y
IHRyYW5zZmVyIGZ1bmN0aW9uIHRvCj4gCj4gPiBwcm9jZXNzIHBpeGVscyBpbnRvIGEgY29uc2lz
dGVudCBjb2xvciBkb21haW4uCj4gCj4gPiAKPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE5hbmN5Lkxp
biA8bmFuY3kubGluQG1lZGlhdGVrLmNvbT4KPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwtcGwu
Q2hlbiA8cGF1bC1wbC5jaGVuQG1lZGlhdGVrLmNvbT4KPiAKPiA+IC0tLQo+IAo+IMKgCj4gCj4g
W3NuaXBdCj4gCj4gwqAKPiAKPiA+ICsjZGVmaW5lIERJU1BfUkVHX09WTF9MMF9DTFJGTVTCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHgwNTAKPiAKPiA+ICsjZGVm
aW5lIE9WTF9DT05fRkxEX0NMUkZNVMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIEdFTk1BU0soMywgMCkKPiAKPiA+ICsjZGVmaW5lIE9WTF9DT05fQ0xS
Rk1UX01BTsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IEJJVCg0KQo+IAo+ID4gKyNkZWZpbmUgT1ZMX0NPTl9GTERfQ0xSRk1UX05CwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgR0VOTUFTSyg5LCA4KQo+IAo+ID4gKyNk
ZWZpbmUgT1ZMX0NPTl9DTFJGTVRfTkJfMTBfQklUwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgQklUKDgpCj4gCj4gPiArI2RlZmluZSBPVkxfQ09OX0JZVEVfU1dBUMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQklUKDE2KQo+
IAo+ID4gKyNkZWZpbmUgT1ZMX0NPTl9SR0JfU1dBUMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBCSVQoMTcpCj4gCj4gPiArI2RlZmluZSBPVkxf
Q09OX0NMUkZNVF9SR0I1NjXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAweDAwMAo+IAo+ID4gKyNkZWZpbmUgT1ZMX0NPTl9DTFJGTVRfQkdSODg4wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHgwMDEKPiAKPiA+ICsjZGVmaW5l
IE9WTF9DT05fQ0xSRk1UX0JHUkE4ODg4wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHgwMDIKPiAKPiA+ICsjZGVmaW5lIE9WTF9DT05fQ0xS
Rk1UX0FCR1JCODg4OMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MDAz
Cj4gCj4gPiArI2RlZmluZSBPVkxfQ09OX0NMUkZNVF9VWVZZwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MDA0Cj4gCj4gPiArI2RlZmluZSBPVkxfQ09O
X0NMUkZNVF9ZVVlWwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIDB4MDA1Cj4gCj4gPiArI2RlZmluZSBPVkxfQ09OX0NMUkZNVF9CR1I1NjXCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoMHgwMDAgfCBPVkxfQ09OX0JZVEVf
U1dBUCkKPiAKPiA+ICsjZGVmaW5lIE9WTF9DT05fQ0xSRk1UX1JHQjg4OMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICgweDAwMSB8IE9WTF9DT05fQllURV9TV0FQ
KQo+IAo+ID4gKyNkZWZpbmUgT1ZMX0NPTl9DTFJGTVRfUkdCQTg4ODjCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoMHgwMDIgfCBPVkxfQ09O
X0JZVEVfU1dBUCkKPiAKPiA+ICsjZGVmaW5lIE9WTF9DT05fQ0xSRk1UX0FSR0I4ODg4wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKDB4MDAz
IHwgT1ZMX0NPTl9CWVRFX1NXQVApCj4gCj4gPiArI2RlZmluZSBPVkxfQ09OX0NMUkZNVF9WWVVZ
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICgweDAwNCB8
IE9WTF9DT05fQllURV9TV0FQKQo+IAo+ID4gKyNkZWZpbmUgT1ZMX0NPTl9DTFJGTVRfWVZZVcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoMHgwMDUgfCBP
VkxfQ09OX0JZVEVfU1dBUCkKPiAKPiA+ICsjZGVmaW5lIE9WTF9DT05fQ0xSRk1UX1BCR1JBODg4
OMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICgweDAwMyB8IE9WTF9DT05f
Q0xSRk1UX01BTikKPiAKPiA+ICsjZGVmaW5lIE9WTF9DT05fQ0xSRk1UX1BBUkdCODg4OMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgwqAgKE9WTF9DT05fQ0xSRk1UX1BCR1JBODg4OCB8IFwKPiAKPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgT1ZMX0NPTl9C
WVRFX1NXQVApCj4gCj4gPiArI2RlZmluZSBPVkxfQ09OX0NMUkZNVF9QUkdCQTg4ODjCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIMKgIChPVkxfQ09OX0NMUkZNVF9QQkdSQTg4ODggfCBcCj4gCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE9WTF9DT05fUkdC
X1NXQVApCj4gCj4gPiArI2RlZmluZSBPVkxfQ09OX0NMUkZNVF9QQUJHUjg4ODjCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIMKgIChPVkxfQ09OX0NMUkZNVF9QQkdSQTg4ODggfCBcCj4gCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE9WTF9DT05fUkdCX1NX
QVAgfCBcCj4gCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIE9WTF9DT05fQllURV9TV0FQKQo+IAo+IMKgCj4gCj4gVGhlIGNvbG9yIGZvcm1hdCBkZWZp
bml0aW9uIGlzIGlkZW50aWNhbCB3aXRoIG92bCBkcml2ZXIuIFRyeSB0byBtZXJnZSB0aGVtLgo+
IAo+IMKgCj4gCj4gPiArI2RlZmluZSBESVNQX1JFR19PVkxfUkRNQTBfQ1RSTMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHgxMDAKPiAKPiA+ICsjZGVmaW5lIERJU1Bf
UkRNQTBfRU7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgQklUKDApCj4gCj4gPiArI2RlZmluZSBESVNQX1JFR19PVkxfUkRNQV9CVVJT
VF9DT04xwqDCoMKgwqDCoMKgwqAgMHgxZjQKPiAKPiA+ICsjZGVmaW5lIERJU1BfUkRNQV9CVVJT
VF9DT04xX0JVUlNUMTZfRU7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IEJJVCgyOCkKPiAKPiA+ICsjZGVmaW5lIERJU1BfUkRNQV9CVVJTVF9DT04xX0REUl9FTsKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEJJVCgzMCkKPiAKPiA+ICsjZGVmaW5lIERJU1Bf
UkRNQV9CVVJTVF9DT04xX0REUl9BQ0tfRU7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIEJJVCgzMSkKPiAKPiA+ICsjZGVmaW5lIERJU1BfUkVHX09WTF9EVU1NWV9SRUfC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHgyMDAKPiAKPiA+ICsj
ZGVmaW5lIERJU1BfT1ZMX0VYVF9ERFJfRU5fT1BUwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQklUKDIpCj4gCj4gPiArI2RlZmluZSBESVNQ
X09WTF9GT1JDRV9FWFRfRERSX0VOwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IEJJVCgzKQo+IAo+ID4gKyNkZWZpbmUgRElTUF9SRUdfT1ZMX0dEUkRZX1BSRMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDIwOAo+IAo+IMKgCj4gCj4gW3NuaXBd
Cj4gCj4gwqAKPiAKPiA+ICsKPiAKPiA+ICtzdGF0aWMgY29uc3QgdTMyIGZvcm1hdHNbXSA9IHsK
PiAKPiDCoAo+IAo+IFRoaXMgYXJyYXkgaXMgaWRlbnRpY2FsIHdpdGggbXQ4MTk1X2Zvcm1hdHNb
XSwgdHJ5IHRvIG1lcmdlIHRoZW0uCj4gCj4gwqAKPiAKPiA+ICvCoMKgwqDCoMKgIERSTV9GT1JN
QVRfWFJHQjg4ODgsCj4gCj4gPiArwqDCoMKgwqDCoCBEUk1fRk9STUFUX0FSR0I4ODg4LAo+IAo+
ID4gK8KgwqDCoMKgwqAgRFJNX0ZPUk1BVF9CR1JYODg4OCwKPiAKPiA+ICvCoMKgwqDCoMKgIERS
TV9GT1JNQVRfQkdSQTg4ODgsCj4gCj4gPiArwqDCoMKgwqDCoCBEUk1fRk9STUFUX0FCR1I4ODg4
LAo+IAo+ID4gK8KgwqDCoMKgwqAgRFJNX0ZPUk1BVF9YQkdSODg4OCwKPiAKPiA+ICvCoMKgwqDC
oMKgIERSTV9GT1JNQVRfUkdCWDg4ODgsCj4gCj4gPiArwqDCoMKgwqDCoCBEUk1fRk9STUFUX1JH
QkE4ODg4LAo+IAo+ID4gK8KgwqDCoMKgwqAgRFJNX0ZPUk1BVF9SR0I4ODgsCj4gCj4gPiArwqDC
oMKgwqDCoCBEUk1fRk9STUFUX0JHUjg4OCwKPiAKPiA+ICvCoMKgwqDCoMKgIERSTV9GT1JNQVRf
UkdCNTY1LAo+IAo+ID4gK8KgwqDCoMKgwqAgRFJNX0ZPUk1BVF9VWVZZLAo+IAo+ID4gK8KgwqDC
oMKgwqAgRFJNX0ZPUk1BVF9ZVVlWLAo+IAo+ID4gK8KgwqDCoMKgwqAgRFJNX0ZPUk1BVF9YUkdC
MjEwMTAxMCwKPiAKPiA+ICvCoMKgwqDCoMKgIERSTV9GT1JNQVRfQVJHQjIxMDEwMTAsCj4gCj4g
PiArwqDCoMKgwqDCoCBEUk1fRk9STUFUX1JHQlgxMDEwMTAyLAo+IAo+ID4gK8KgwqDCoMKgwqAg
RFJNX0ZPUk1BVF9SR0JBMTAxMDEwMiwKPiAKPiA+ICvCoMKgwqDCoMKgIERSTV9GT1JNQVRfWEJH
UjIxMDEwMTAsCj4gCj4gPiArwqDCoMKgwqDCoCBEUk1fRk9STUFUX0FCR1IyMTAxMDEwLAo+IAo+
ID4gK8KgwqDCoMKgwqAgRFJNX0ZPUk1BVF9CR1JYMTAxMDEwMiwKPiAKPiA+ICvCoMKgwqDCoMKg
IERSTV9GT1JNQVRfQkdSQTEwMTAxMDIsCj4gCj4gPiArfTsKPiAKPiA+ICsKPiAKPiDCoAo+IAo+
IFtzbmlwXQo+IAo+IMKgCj4gCj4gPiArCj4gCj4gPiArc3RhdGljIHVuc2lnbmVkIGludCBtdGtf
ZGlzcF9leGRtYV9mbXRfY29udmVydCh1bnNpZ25lZCBpbnQgZm10LCB1bnNpZ25lZCBpbnQgYmxl
bmRfbW9kZSkKPiAKPiDCoAo+IAo+IFRoaXMgZnVuY3Rpb24gaXMgYWxtb3N0IHRoZSBzYW1lIGFz
IG10a19vdmxfZm10X2NvbnZlcnQoKSwgdHJ5IHRvIG1lcmdlIHRoZW0uCj4gCj4gwqAKPiAKPiBS
ZWdhcmRzLAo+IAo+IENLCj4gCj4gwqAKPiAKPiA+ICt7Cj4gCj4gPiArwqDCoMKgwqDCoCAvKgo+
IAo+ID4gK8KgwqDCoMKgwqAgICogRFJNX0ZPUk1BVDogYml0IDMyLT4wLCBPVkxfRk1UOiBiaXQg
MC0+MzIsCj4gCj4gPiArwqDCoMKgwqDCoCAgKiBzbyBEUk1fRk9STUFUX1JHQjg4OCA9IE9WTF9D
T05fQ0xSRk1UX0JHUjg4OAo+IAo+ID4gK8KgwqDCoMKgwqAgICovCj4gCj4gPiArwqDCoMKgwqDC
oCBzd2l0Y2ggKGZtdCkgewo+IAo+ID4gK8KgwqDCoMKgwqAgZGVmYXVsdDoKPiAKPiA+ICvCoMKg
wqDCoMKgIGNhc2UgRFJNX0ZPUk1BVF9CR1I1NjU6Cj4gCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcmV0dXJuIE9WTF9DT05fQ0xSRk1UX1JHQjU2NTsKPiAKPiA+ICvCoMKgwqDCoMKg
IGNhc2UgRFJNX0ZPUk1BVF9SR0I1NjU6Cj4gCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIE9WTF9DT05fQ0xSRk1UX0JHUjU2NTsKPiAKPiA+ICvCoMKgwqDCoMKgIGNhc2Ug
RFJNX0ZPUk1BVF9SR0I4ODg6Cj4gCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIE9WTF9DT05fQ0xSRk1UX0JHUjg4ODsKPiAKPiA+ICvCoMKgwqDCoMKgIGNhc2UgRFJNX0ZP
Uk1BVF9CR1I4ODg6Cj4gCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIE9W
TF9DT05fQ0xSRk1UX1JHQjg4ODsKPiAKPiA+ICvCoMKgwqDCoMKgIGNhc2UgRFJNX0ZPUk1BVF9S
R0JYODg4ODoKPiAKPiA+ICvCoMKgwqDCoMKgIGNhc2UgRFJNX0ZPUk1BVF9SR0JBODg4ODoKPiAK
PiA+ICvCoMKgwqDCoMKgIGNhc2UgRFJNX0ZPUk1BVF9SR0JBMTAxMDEwMjoKPiAKPiA+ICvCoMKg
wqDCoMKgIGNhc2UgRFJNX0ZPUk1BVF9SR0JYMTAxMDEwMjoKPiAKPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gKChibGVuZF9tb2RlID09IERSTV9NT0RFX0JMRU5EX1BSRU1V
TFRJKSA/Cj4gCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IE9WTF9DT05fQ0xSRk1UX1BBQkdSODg4OCA6IE9WTF9DT05fQ0xSRk1UX0FCR1JCODg4OCkgfAo+
IAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoaXNfMTBi
aXRfcmdiKGZtdCkgPyBPVkxfQ09OX0NMUkZNVF9OQl8xMF9CSVQgOiAwKTsKPiAKPiA+ICvCoMKg
wqDCoMKgIGNhc2UgRFJNX0ZPUk1BVF9CR1JYODg4ODoKPiAKPiA+ICvCoMKgwqDCoMKgIGNhc2Ug
RFJNX0ZPUk1BVF9CR1JBODg4ODoKPiAKPiA+ICvCoMKgwqDCoMKgIGNhc2UgRFJNX0ZPUk1BVF9C
R1JBMTAxMDEwMjoKPiAKPiA+ICvCoMKgwqDCoMKgIGNhc2UgRFJNX0ZPUk1BVF9CR1JYMTAxMDEw
MjoKPiAKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gKChibGVuZF9tb2Rl
ID09IERSTV9NT0RFX0JMRU5EX1BSRU1VTFRJKSA/Cj4gCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE9WTF9DT05fQ0xSRk1UX1BBUkdCODg4OCA6IE9WTF9D
T05fQ0xSRk1UX0FSR0I4ODg4KSB8Cj4gCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIChpc18xMGJpdF9yZ2IoZm10KSA/IE9WTF9DT05fQ0xSRk1UX05CXzEw
X0JJVCA6IDApOwo+IAo+ID4gK8KgwqDCoMKgwqAgY2FzZSBEUk1fRk9STUFUX1hSR0I4ODg4Ogo+
IAo+ID4gK8KgwqDCoMKgwqAgY2FzZSBEUk1fRk9STUFUX0FSR0I4ODg4Ogo+IAo+ID4gK8KgwqDC
oMKgwqAgY2FzZSBEUk1fRk9STUFUX0FSR0IyMTAxMDEwOgo+IAo+ID4gK8KgwqDCoMKgwqAgY2Fz
ZSBEUk1fRk9STUFUX1hSR0IyMTAxMDEwOgo+IAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiAoKGJsZW5kX21vZGUgPT0gRFJNX01PREVfQkxFTkRfUFJFTVVMVEkpID8KPiAK
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgT1ZMX0NPTl9D
TFJGTVRfUEJHUkE4ODg4IDogT1ZMX0NPTl9DTFJGTVRfQkdSQTg4ODgpIHwKPiAKPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKGlzXzEwYml0X3JnYihmbXQp
ID8gT1ZMX0NPTl9DTFJGTVRfTkJfMTBfQklUIDogMCk7Cj4gCj4gPiArwqDCoMKgwqDCoCBjYXNl
IERSTV9GT1JNQVRfWEJHUjg4ODg6Cj4gCj4gPiArwqDCoMKgwqDCoCBjYXNlIERSTV9GT1JNQVRf
QUJHUjg4ODg6Cj4gCj4gPiArwqDCoMKgwqDCoCBjYXNlIERSTV9GT1JNQVRfQUJHUjIxMDEwMTA6
Cj4gCj4gPiArwqDCoMKgwqDCoCBjYXNlIERSTV9GT1JNQVRfWEJHUjIxMDEwMTA6Cj4gCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuICgoYmxlbmRfbW9kZSA9PSBEUk1fTU9E
RV9CTEVORF9QUkVNVUxUSSkgPwo+IAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBPVkxfQ09OX0NMUkZNVF9QUkdCQTg4ODggOiBPVkxfQ09OX0NMUkZNVF9S
R0JBODg4OCkgfAo+IAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAoaXNfMTBiaXRfcmdiKGZtdCkgPyBPVkxfQ09OX0NMUkZNVF9OQl8xMF9CSVQgOiAwKTsK
PiAKPiA+ICvCoMKgwqDCoMKgIGNhc2UgRFJNX0ZPUk1BVF9VWVZZOgo+IAo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBPVkxfQ09OX0NMUkZNVF9VWVZZOwo+IAo+ID4gK8Kg
wqDCoMKgwqAgY2FzZSBEUk1fRk9STUFUX1lVWVY6Cj4gCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcmV0dXJuIE9WTF9DT05fQ0xSRk1UX1lVWVY7Cj4gCj4gPiArwqDCoMKgwqDCoCB9
Cj4gCj4gPiArfQo+IAo+ID4gKwo+IAoKCgoKwqAK

