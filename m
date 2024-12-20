Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2B4E77184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 02:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4NsfShooApBVH8hP1C5IqTlRRG4JhbJBdwvlKrPIcr8=; b=duc1hu2fbjHcDrqkPYIkQnL5yw
	8zfjFKmpa+B75FhXETpYZDjzezv/kqsVW/mSQoUwbJnVccPzVo6mYQjDPOi9wOmlxA1nhj0uLEexA
	qUEr9JTqh0p54rfekcCkvY0uaKzbHykvT3w/UeNF477lavEF9euMpbVub3eOaEojLmbvdidqjWVFr
	XMoBbozd/HDnvbxU28/EkPlJLOIksz+qi4pfIMqJs/P53cws56VPvVxlEAjtSRyRJ5wGR9cRJIV0S
	mln8W7efpKG1PKVFXILx/dK1oStId4V8VooigkdigUMwA3PecEfyV/1jVttFgnGrQeBofqTytuiTm
	1NYRkUWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOT6r-00000003kLx-3Wwo;
	Fri, 20 Dec 2024 02:51:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOT5Q-00000003k8C-1vL1;
	Fri, 20 Dec 2024 02:49:57 +0000
X-UUID: 10bdfa0abe7d11ef82ff63e91e7eb18c-20241219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=4NsfShooApBVH8hP1C5IqTlRRG4JhbJBdwvlKrPIcr8=;
	b=dzo2HxoDUommOYUU6Ye+tc515nwGTYnndulL862EqCmfvLfE18bFKSdjQXel0mI8/GdppNOkvPv0ptaqlY608uGJ/rrCrdfn1yLHfyRpadGOSqx+68/OltksYOURoQAA6KqIqn0WPRlEezv+XfNe21BxAEZyV8LXDyNn1mqsj0I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:8c0a1285-25a7-4d40-a45f-754e9d5dd8a0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:-32768,SF:-32768,FILE:0,BULK:-32768,RULE:Rele
	ase_Ham,ACTION:release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:d3081cf7-de97-469d-987d-6ebf2dbbea3b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 10bdfa0abe7d11ef82ff63e91e7eb18c-20241219
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 532125757; Thu, 19 Dec 2024 19:49:43 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 20 Dec 2024 10:49:40 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 20 Dec 2024 10:49:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lR4fyraxccnSS/yTxk1kSHXB3uoA8x/hCIcge9QXNDDLHhgZhrQIQzxd6Ad/YeCTu6ECNlzj1qHxdP4Z+rg/lTQqgbKe3IQ4pA9bc5iwOpSqpqNs0C8tw5D5Z0jZOGNVyUGP4jjQ62Xebfpqwn5m4IK5rhqhok0xLu35gDT1h3NVlT6i98lnOxDcVTmj10/uCIMnklU9+yRK3DnQQ+y0yY2rdlhDVQ31YPLCi70b+ot8CftLlSuSRqMNUHbcWqoXAix5Mj+HEhvHiWt2rCJKnO9e8E06y/lZHPCqsLbFsiDCwghI0n1/+M+jFVflHsnmqxkfdtHHxVFT5EROQYZVLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4NsfShooApBVH8hP1C5IqTlRRG4JhbJBdwvlKrPIcr8=;
 b=zG0AGYf+ouVwsdpB82OA+zwTaErpzRdOCVp9vpQ5XaWdSyaXit5aaqYAeKzUHV8r/DLOtS9uRQHh7Ih43MphHCFAXL0JNyiFQUKHXWlWrmNR4LhUpZWuwUWPUK/Cgx13beWCpYJP78mRApqsYx/MBV4e1QlLniMwE9N25HfoE/cb0SqIHBL5GoMkoKxBWTKK0ALnELLsUUFjOD+pDPpMkqdB6qMkteXn+9jTHERyTQLn6tk8X+YMgfw0JT1MMWP8NI5iOKSuwFgTa85xWBl60iQm9oTuASFAdSY/aRpvLahSyhyP8Z4lZ4Z1YjctUhrcCRONQ8UNWaTNeLVFMC/eYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4NsfShooApBVH8hP1C5IqTlRRG4JhbJBdwvlKrPIcr8=;
 b=cUNVORLr4vuBlghEQRX3uN3aSocu3Zwb4OWl2bc82MAJS4ah3cXmnie0d/azgUCYMpX38LgDL521rAAkF89XK+C3HHP1J2vMLL5Qmh3MUNEInsJMowWezek8h5agx4HAd3+ZzCUZ++wlEDBaXH/Z5q6ZwCsxD0KBY1eFbn4BQvE=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TY0PR03MB6630.apcprd03.prod.outlook.com (2603:1096:400:207::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Fri, 20 Dec
 2024 02:49:37 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8251.015; Fri, 20 Dec 2024
 02:49:37 +0000
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
	"granquet@baylibre.com" <granquet@baylibre.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "junzhi.zhao@mediatek.com"
	<junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v3 12/33] drm/mediatek: hdmi: Use regmap instead of iomem
 for main registers
Thread-Topic: [PATCH v3 12/33] drm/mediatek: hdmi: Use regmap instead of iomem
 for main registers
Thread-Index: AQHbUJqoTDyTcyw3ZEywiJJ1SboFK7LucmiA
Date: Fri, 20 Dec 2024 02:49:37 +0000
Message-ID: <292899cc3420242629305be95225a28713849e00.camel@mediatek.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
	 <20241217154345.276919-13-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241217154345.276919-13-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TY0PR03MB6630:EE_
x-ms-office365-filtering-correlation-id: 661612b1-2cc6-45f6-6534-08dd20a0f1ae
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Ykh3V2FxV3pDNCtWT2R5M2l3a2lMQytNTTZwZ1locmEwOVBDSjRTVVpxdHVs?=
 =?utf-8?B?OGFVR1F4S05TVWc1RlZ4N3FFSWNZY0FRZS9vUW4yRHFCb0dlS20xL091Zmtz?=
 =?utf-8?B?THFSK1RhK21tOTVtMDkyTjVuU0wvUi92eW9YNXhJdXp4YXRBNEhPeE1SQlRk?=
 =?utf-8?B?MnRTamRPbXdUZ1h3RjZET3AzUkVONnN0SjBYSkZpMUtkMHpuTzJLbEgzZTZ0?=
 =?utf-8?B?RTVPdVNnV2QvaDhNTVhXYU9uZFlZTGhFRGJzRWRMck1DM1BLK05lNjFCSVdT?=
 =?utf-8?B?RFZkTTZVU1pNL0ZUZG1nMXNrSUVGcEN2eW5FTFB1MjlseUZyUTN5ZXh3bHlV?=
 =?utf-8?B?R29DZnhuMmdoRThoL2ZHcDgvMGhWc0FMNmxKeVorS3FQRlAvZHovaW5IVkJQ?=
 =?utf-8?B?SnBVZkFKL1dxVCtuN2RsVXM4WEVYUm9NbExRbytYcUdVcHYwSlhzWWR3RzdL?=
 =?utf-8?B?N1g4RnBtY3p3dFB0NUpyT2QxVUNKc2NQOTVkaG5YUG9oLzkyZVV2cTEwOFZ0?=
 =?utf-8?B?c09aOU0yME9rRWZxajM2dzZ3YVRxYWVqaXNPamhXVk9Ra2NDM1JtQnlockRy?=
 =?utf-8?B?UHNaYUhSWlNIOTYwZUJsM0J4STIyVjJFSGNnZHlBcFVhQVRmQlFLWDdoVVov?=
 =?utf-8?B?c3h4UkQrYTRqOHpnZm1sZkVVUDRsYjZabTlHdHVIbkIxaEQ2dXNBMTBZMnRZ?=
 =?utf-8?B?bkVVTkxLMHVpYkZ1Y3EwMFVYR0RjMFU4QmVqL2F5b2Zybmt2YjFnckFvSWpQ?=
 =?utf-8?B?dlJ3K2FMM1dOcFNHMG8wTDJIYUREeGNVL2xYVHI1RWgraFZ2VWRMVVM5SXBx?=
 =?utf-8?B?SXhIMjdKaXIrVXRCazRjc1hVUXg2RlJkWURZQ2VIcXFOY2FqNVB4OUl6OTJx?=
 =?utf-8?B?R2ZIdXV3UVBtdWhBc3ZJZVEyL3V4WlY2OXVsdDZXUUxaeEZldmlXOUxlajdZ?=
 =?utf-8?B?aTZvRzFSQjlDT1RwOGU4THF1aGhidmgvRkhPYlovb0R1NVZvTDhYOFQ5a1Uy?=
 =?utf-8?B?blY3UkREbm5BMjNZUHhmL2hYWDNDRmlwb2xiU3lOd3cvVGdzbUhmN3JGWitq?=
 =?utf-8?B?OEpmRit5b3BLOE40akZwdGRxRDJwZGZQaC9WTnhMTmRQdFJyUnB4WlpGcjNF?=
 =?utf-8?B?a2FKYThORnJENWpibzM4dUVJT3ZVbGV0Mi9FNW95RzBUMWhaVGl2T3JMRHhG?=
 =?utf-8?B?bWhLZ1NBMFFzU0RveHdsZUJRVFMvRlRNQVI0L2MwWThJV3ZjdS9Vb0JKK3ZR?=
 =?utf-8?B?VGF6SXcweUUwdUJIbCtyMXVLN1d5MnFmVDk3WmhyUG1OS29QR2tPMXl1ME5H?=
 =?utf-8?B?L2tXNkhTcnFjTDJOd3lkZUd2bDlqUUNRUGdNaGRJcnJDbEhISVBQdEM4WHNp?=
 =?utf-8?B?eERqTDR5SjRPR2Nrdy9WRTJrcG5XcEZKSWVOWGpjTUtveFhxanJabmFXZEhk?=
 =?utf-8?B?TlRPdHBNbUtxSUdjYVZmMkljZ3hSYWt5Ym1TRk5rbU1hSGJrNjY1QWx5OFNX?=
 =?utf-8?B?OXVsL2VhUGxieEFiQ2JQL2lGZU1pVk0zM09VaFZDZWxxOGs0SWVleHJmZ3hv?=
 =?utf-8?B?SDU0QTZ0NjY3WTM2U1EyRG95OURXOEZYRUh5Tm5Nc3FjK1U5U2ZRY3hUSHdH?=
 =?utf-8?B?VHpCK3RUQjdMS0lxWnhuN2JNOUw0TC81eng4Q1FuSUFWT010YmZKUFNEWW02?=
 =?utf-8?B?VTdhWk5rR3hpTGd1Y0FZVjZ5cXJsd1VPVHFKbkV4OTB0VWo4N1NDam9BZ1lQ?=
 =?utf-8?B?NlBYaVJkQVhNSTNBUThHZmxnWm9LajhPckFTRmIxdUpUOFkyTG5HRk5PdEZS?=
 =?utf-8?B?Q0k0YnNaRk0wYjZQcG16eGM3WU9EclQzZEFxam5vTG5uamxjWU5IZk9YRndJ?=
 =?utf-8?B?bGZYcjB2d21hZlY0Mzk4a254OHBaaWlTcG9XSmowMEVUTFdSNFA4RmZRR2Qv?=
 =?utf-8?Q?Cfzg+yboI3ts3VSp22GDUCSXtZi2WrwQ?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVdpTXNVbXdOd0N1VVN0NEZGbDZGZ3lHYUpsckJKMzFVM3ord3JyUGFDelY2?=
 =?utf-8?B?dlBuY29jaFhhYm50ZzUrWGlWR01yN2ZmRFhTbi9zcEhVM0lMbnNtc0hyc01p?=
 =?utf-8?B?Vm05VlJtc0w5ZEdodGVNV1g5cUJIbEJpRmtMc0hLM0kzZWpUcllXdXgxR3Qv?=
 =?utf-8?B?aU9aeHV0VGF0ZFNJN3BnQ2NDc1ZZNGFObStLTE0xYjBQOTRkWGREZzA0bEs1?=
 =?utf-8?B?Q2pUQkZsa3ZPd3V6N1JnQVh3b3Y2cnhVT1phRHNMQklqVlBLNUlCb2lnay9i?=
 =?utf-8?B?VmJ0VkV2SkxxSlcyaG9pb1cyMldFL2dtZ3BMaWRpQUJ4NU5YbFlWMzZjQlNT?=
 =?utf-8?B?OExOL0ZaSlVFV2swS2RvOUhGbzM5b2NrOUlUVm1mdEtzSGJ1a1p0VzIzdGFG?=
 =?utf-8?B?azBsVDdaZ3BOeWlwZVZqQ3ZMMVpZaUJjNUI3VzlNQUUzVU9wRE15bmhCZTF1?=
 =?utf-8?B?WkE5djVEUTh0aVFHUHh5aHdjUDlqV3FOSnVSVkd1WVdPWDFSNHZZUFgwRi8x?=
 =?utf-8?B?NXNrcGZQNEdXN1k2bDBKMEUyY21abG1IMzdYT2IyKzJaMlJUdmVTelp0cTZE?=
 =?utf-8?B?MU1EcGFyeE0xUkp3WGZ2STlIYnd2T1dtUEdOMUdVeGlzdmgyMllLV1gvdGJ6?=
 =?utf-8?B?Ymo3RjhLS3lOOVJtaUh2WmlUWTlXeDF1U3JqL0lyZDhaMG9BeE9SUStPaHpF?=
 =?utf-8?B?Z1J6TUtiTU1jSEJ5ZEVyV1lybnRWTm5rM0g2OWV4TURIT2c3UFdTLys5MFpj?=
 =?utf-8?B?V3kxcFF0aHJPcnJjM0ZqU0wvcEFON0hoL3VTdUs3T3JhVUFjNGpTQTgwY3lq?=
 =?utf-8?B?dzNhQ2pzMUExZStIOTBVK1NlRkVFZGJjYjV0alQzMFdra2F5b09qbXVlMXNw?=
 =?utf-8?B?L1Avc2lSTDVEQmd0NU1rTWNUQ3lwbldOQzE4RlFNL0crRXpCbVp4aFhnaHpp?=
 =?utf-8?B?OEpNSlBXNHJUNTBsMzIvZjFDT1JlLzMvMFkxN3pMM1FIYnZlZ3dYU3ZOdFFu?=
 =?utf-8?B?Y2hQT2VEU2NBR3Rsc2lxUWZLbnhKeDVpbks5SG1UN3E3eWgwRndMdk1OMjJU?=
 =?utf-8?B?eGVWdG9MWGQ1U29YNGd5OVQrS3AycHpINmxBbzZpbXhhemdHUnNpazZwTG5C?=
 =?utf-8?B?OVZ5eXpkVUFtekJWMzloa1RjZy9JTWJxN2VPU0h5d2ZkMXByd2tOdFZQalZ4?=
 =?utf-8?B?M1ozNEw5WHhTSmtjSjdrSzZBYlRJMnIxWEY3NklyakhtbTJFeTdrbk92bCtv?=
 =?utf-8?B?Z21aT2xrMFJyMVQvM08rVFlWRVlidERUenJnSkFHd1lJQjhCUkcrbWhzT09Y?=
 =?utf-8?B?YVc2MEJBTHR0SGpPbWc4R2xlM1hoTVduSldkSWN2QldyZm5qT0JMTGhTL3V5?=
 =?utf-8?B?YVErNHUrQi9ycHNidEFJYWw3TlRHb1I1L1VoTFY4aDhjTzhpc3Z1Kzczckx0?=
 =?utf-8?B?S3p5RllSakNEQjVvbjVEQ0dSWUxhMGUrQ2RuaUdkUkdYRmMxZnEyS0Yva0ds?=
 =?utf-8?B?WEFDdExSMnRWRzN0eVo5cGh4UUNjc29WNzUrUWRHWHhMV0I2T2czalNzQzlX?=
 =?utf-8?B?b05OQTdma1pIVkFxcmdWcGlEdXd6dXVqZXpkbHZ4MGt0dXpVRC85cTB0Rmsr?=
 =?utf-8?B?VVFESG8rVC9vanFIOVROMGIxSkUrUXpnYzZVMUdRYVRUdGtMeHhjK210YWd4?=
 =?utf-8?B?SUNlMlBNNERxcmI5c2NqM0R6MXpUaTFiQ1JWaFA5WXBiaGFqMzYzdjdDQjhz?=
 =?utf-8?B?a2svREM3dG14UG1JZ2dqaUkrQnRud1g4WXdsMzR3SzBQcXRTbnRkRGRzUUxu?=
 =?utf-8?B?Ty9wSEprUXJoWE9sMHVqVVNlb0FySVRqMUM4dXp0NjlPbmY4NGJKUjBnQjM5?=
 =?utf-8?B?eUhoSGRNMEVKYUpxS3JST2pNdHNHd1NDVHJnTFkrVThRQ2g1YTdaZHB6b0lH?=
 =?utf-8?B?WGJjWS9INlhpSTJWNFdRQVpIdC83UGRxUmFYU2k4eUJwbWFHVlB4VnlzNzZM?=
 =?utf-8?B?L3NWYkhuZ3FQL21oTmpYSzhGL0xiN1JVRVJVMVZDYlNpNDJ5SEZNMHFqWVkr?=
 =?utf-8?B?azRrMis2TmtxSmZQRW42SE0zbmsxZEdPWVhKRWNtK2Uyb1hxNk5RT1pkbGht?=
 =?utf-8?Q?Y06k19MQ15KB02QR46do4Zahx?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <85B179EC79245C4F982BD88635EBEDAE@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 661612b1-2cc6-45f6-6534-08dd20a0f1ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 02:49:37.7568
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5GfjX4rDhInQ/pZvR4wi7HGdNc0wuKWBMQQbYGJ3CaxrSyi4SkIa9nz2wsnOGc4qlV391zJ/6aE76MsH70fRBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6630
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_184956_519703_A0FB0553 
X-CRM114-Status: GOOD (  10.09  )
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
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBGcm9tOiBHdWlsbGF1bWUg
UmFucXVldCA8Z3JhbnF1ZXRAYmF5bGlicmUuY29tPg0KPiANCj4gSW4gcHJlcGFyYXRpb24gZm9y
IHRoZSBhZGRpdGlvbiBvZiBhIG5ldyB2ZXJzaW9uIG9mIHRoZSBIRE1JIElQDQo+IHdoaWNoIHdp
bGwgbmVlZCB0byBzaGFyZSBpdHMgaW9zcGFjZSBiZXR3ZWVuIG11bHRpcGxlIHN1YmRyaXZlcnMs
DQo+IGFuZCBpbiBwcmVwYXJhdGlvbiBmb3IgbW92aW5nIG91dCB0aGUgY29tbW9uIGJpdHMgYmV0
d2VlbiB0aGUgdHdvLA0KPiBtaWdyYXRlIHRoaXMgZHJpdmVyIHRvIGZ1bGx5IHVzZSByZWdtYXAu
DQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBHdWlsbGF1bWUgUmFucXVldCA8Z3JhbnF1ZXRAYmF5bGlicmUuY29tPg0KPiBT
aWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGlu
by5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPg0KPiAtLS0NCg0K

