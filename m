Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA0CCF3184
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 09:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cU8WU9Fpg9Nm7SpdfR7CFgH+4lkmqXJytFOghfB3K0c=; b=AutVK6jb0HcTj0pQKTpY9Qcsxu
	VGFu32UIhCra6MtHxsgTCbpx2kMj/pH/g0bxXYB65BUrYcL5BiqKHZlNhiQI6is227wS5+6l0Bdh3
	hXoxY2xpN1YIbVJBWHFIi6EmL9mnB/KsEOGrpwqqLQc8ZNwmQqNGP3XpmEwftW7chr3voKHv5UsPu
	+Mp7vHRhvuUgD9FDlmpXpoVHHxqJduyCGmW8zNnDS0uefxq1192tyzKh4rRQsBq9jBmDNT+nWfSIl
	y1mMeXshOx1qtxMmMNwR5GgyQd+q3YIV5+FTKqRrMFxCyq6wZBHBGlkLyzQ5MIllSlf1AFbrV6xE6
	1aBQDN/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLeKX-00000002qmm-0XwD;
	Wed, 19 Nov 2025 09:18:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLeKU-00000002qmH-0ewI;
	Wed, 19 Nov 2025 09:18:23 +0000
X-UUID: addf2018c52811f09f706fa2197c6ceb-20251119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=cU8WU9Fpg9Nm7SpdfR7CFgH+4lkmqXJytFOghfB3K0c=;
	b=CuUA2fw+Nuui0+XkU+D2+xnF/weWd5/Jg8Jloftryu0guv9Q3cWIsZvA9j9VLtbD4KTFSHDcCPnhcFf89Ya+Ry6fBjVw8m1L87VI41LlztzMBC8zUJyZBiEV7KeCcz33Kj4kezqJWjZ3U0LX2P214e94uEe0+2m96Z2bEaGAjtY=;
X-CID-CACHE: Type:Local,Time:202511190218-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:7352a2c0-0cae-4c5a-a08c-3b2937910303,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:1bf79b92-7fd3-4c6a-836a-51b0a70fa8fb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:80|1,File:130,RT:0,Bulk:nil,QS:nil
	,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: addf2018c52811f09f706fa2197c6ceb-20251119
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1631311155; Wed, 19 Nov 2025 02:18:15 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 19 Nov 2025 17:18:11 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Wed, 19 Nov 2025 17:18:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J12KQ/1WV5FWEtJdc4hcvDvRSToU8d1X1SQDu/pnFpmNMf7Kp2EOkXGRHVj4Lh5haqupiWiLdu92ay/nF1MCTQ5cbxKzfDfYhTEcnt+Ucso7KjMN//oqXJizxwYT3xIeKTNvWAhjaKngW17ENKpIJ342UiQr0NqtwMF80sb/1ffk9cWofUwqOtiphoLMl4b7AP18dWFG3F7ua1Fu6h783hoR9BWx+Wz/eiVb4/wBjFavTkDrmrArG4cDRaMH6ulbbd72rQ9xVVEgnDXbc4jUVMnsKkvfMaXa6OcE+R6/CogG9jMqQgGu0kaZk9CuJWE/e/vKSacQjGgE0mXsEVxokw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cU8WU9Fpg9Nm7SpdfR7CFgH+4lkmqXJytFOghfB3K0c=;
 b=qnRKh3nIN6/zbjXVyo6j/zkWps3vNUXU2ru0tx8DobonHdaZF8c/wneVtYMHVNg7JvCIHCBhd4vpfAvFw2HdrCAZsuol9eINjzwAj7ovIJbLoCoGTujcV9fe7SWLWfF8LH3IRFIlRpPMakuvaBdPzPB+Z0d7XI9WIh6nCApu/EYlGytRTu+6kguyg8r0+UEutuksoUg7miR4XunUz2VYa2X7C3UzPbJk2hLks2cJ7NIBqcb+xttU6Ln6jItHeYjJPsP87fc2AK3P2+KJNWYEOw1jH8V/a2Z9R4izjZ60us9MQzTyaa52sWkCWZohcL9v4bqDn2Fy2BPHCGO0dETWRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cU8WU9Fpg9Nm7SpdfR7CFgH+4lkmqXJytFOghfB3K0c=;
 b=N1rr+o2v03BkMZ8rcutcChL7e4BZwWubvU+gCxvgqcAS08sTImUpGfJ3DqyklnU0CFoENWjNBCMMR7jYxxu1ium81J/SlWeJcB8k+NMvE7WGfDXkZyNTwb1m8VJPz1bn2imFN9BzT8jCIZCHDuPbE+OP9csCrPtGSt8LFt1JzsQ=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB8761.apcprd03.prod.outlook.com (2603:1096:101:214::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Wed, 19 Nov
 2025 09:18:05 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 09:18:05 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "simona@ffwll.ch" <simona@ffwll.ch>, =?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?=
	<Mac.Shen@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	=?utf-8?B?UGVuZyBMaXUgKOWImOm5jyk=?= <Peng.Liu@mediatek.com>,
	=?utf-8?B?TElBTktVTiBZQU5HICjmnajov57lnaQp?= <Liankun.Yang@mediatek.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 1/2] drm/mediatek: Adjust bandwidth limit for DP
Thread-Topic: [PATCH v7 1/2] drm/mediatek: Adjust bandwidth limit for DP
Thread-Index: AQHcTWmCip4eLqWqN0GPcdLj8ezueLT5z/4A
Date: Wed, 19 Nov 2025 09:18:05 +0000
Message-ID: <18cd9c74699b5afe4d0bff9a6c325389d2881e29.camel@mediatek.com>
References: <20251104085957.1175-1-liankun.yang@mediatek.com>
	 <20251104085957.1175-2-liankun.yang@mediatek.com>
In-Reply-To: <20251104085957.1175-2-liankun.yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB8761:EE_
x-ms-office365-filtering-correlation-id: 23dc94c8-8f48-445f-660e-08de274c8c34
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|42112799006|1800799024|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?a2wzWC9DRnNDSEZKYXlBVlVBdzJxMGRxaUN4NkVMYVdJOTByY3lUYVR6QTNx?=
 =?utf-8?B?OUczMzdPcHBkNXR1Y0F6UFVySnFWMzRmK3Q2ZW9OcldobkhRVUZZRU4yeWZM?=
 =?utf-8?B?R3hLSGFEZVMva3B1WnhDZ21BWGZQMmR2QzdzbzBTaFdTZ3N3dGRpZldFSm1M?=
 =?utf-8?B?S2FBVHZXYy85N1ZSb1RqelFpTzNVRmx3KzZCanl5RGVVYWZ4MDNqSDhZMVZy?=
 =?utf-8?B?NWZnc1Q1N0tTY0dQcHZQYWFUdmllZjMyMzBZSTZLS0FESjVMdFRCK0xncHFn?=
 =?utf-8?B?VGs3c1ozK2ZNUVdVTyswUWdhWWpSK0ZXQ2FkcDMraktPM2l4ZWVkTzU5c2ox?=
 =?utf-8?B?ZDJLbDc3VnV3WDFSOXUxVUlCZ1Q2ckRjdnp1RjE3VzJyWnhEYkppbFlZa0ZB?=
 =?utf-8?B?ZUdORkdJL2gwakorNVNwYTR6NDZzbUYrd0ZYUUgwQUVqUndZbFkydENrcVQ1?=
 =?utf-8?B?QitNclBzSGdJQkl3QzM4VUtTcVNSTDZMVG1uOWR1UHNWb1l2NXBPVVFRelNJ?=
 =?utf-8?B?YzFBZ1pTelo2c0VjVlJOM1N5NmEzdUMrZ0czVFMwSTdSdDNiRkpXMDN4WFU4?=
 =?utf-8?B?dVp3UmZ3QU1LTWdoMklwaTBrbklBY3RoaC91R1BUU3VJdXFWREMwTmpnQUxM?=
 =?utf-8?B?ZjhZenl6NVFNbjBnRDJvUzVuYjF1YzUyV2Q1NWJrUDZrWDNld2VGOWRDTEtU?=
 =?utf-8?B?eFV2MVJ4VTVXL0VwTlg5WlVCUUN4MmZ4VmhDU3FzT1VrcnBBUVVYdXhDWFJq?=
 =?utf-8?B?N0tXcWhMU2FNM3ljV1UrT3hxbTNES0tLeTJVei9DTm1PRk5nOGVUakRZNnJt?=
 =?utf-8?B?WlZjdE5kZURiMkRzQUhacjBJMWFDSUY1azJ2V3R4Nk8yOUVzWFVwZW95dU01?=
 =?utf-8?B?UVkzWVN1b0poRmljTVI1cGZXTmF0RDMrVnlKYUZmdjk1cGFOd05RNFVVVHJS?=
 =?utf-8?B?NXpCUGJrRXR1Wks5NmVlOGdtbnN6NXNTa2lqUFpUU1J0ZHlrdGIxeEtJS2ZO?=
 =?utf-8?B?UE5hakRHUGFma0JqTExGMU9IMFZWSGc5MUdyZVJYU0FvUkNlN1QzYjVVQUxZ?=
 =?utf-8?B?U0ZmbTQyVGNNWkZ4NkdpTEtrcmFqWjF6cXk4TlZrTXhBbW9oQzVWdmN4Q2RQ?=
 =?utf-8?B?dk5xcjlhcG9pOTBKMHZ6dExZeVM4Tnk3dXJUWUY1Q0Y5TlhLVnRvK0dTbHhC?=
 =?utf-8?B?cDRLZXRQUkF3UUJCLzhkN0J3enorR2FrbmtETCtkVzM0aFZiNkVUK25LcDlQ?=
 =?utf-8?B?cmdRdGd0Rm1LRkJhamZlcnIrdkY3bmQ2REtETTFIcC9KTENqL004RXNBa3pi?=
 =?utf-8?B?cVRFejhpLzdNbGVUV2szZHZtQzZUTVFZNjc1SHZDN3dMNDhkMXh3RUllRUZE?=
 =?utf-8?B?eUY3ZFJUTU94ZUI2Mzl0QUpDM081MHcycVRLUW5zaFM3bDhLaTNtYXJmYXdC?=
 =?utf-8?B?MHZYL2xIVmhZSHgvUnhUeGl2L3cvNzdnVkFPWWxaQTF3SUVzb2JuWXZITGlC?=
 =?utf-8?B?QUdXTjBxNisxUnlQazNhZnFOdkV2eGMrQjl1UXpqN09YZGNYcjJYLzVtOE83?=
 =?utf-8?B?aGk4QUZ2eFBEQ2YrSkhxYmJZUUNoSXNrcFlIcVZEWWo2NjRzdW1UakhzNDlO?=
 =?utf-8?B?WGo0N1hscnR3QWJGaTU5WTN0a1NCT3dqWFZubHNNayt0cCtreFU0amVEM05R?=
 =?utf-8?B?SlZReUxwdnpVSllVMHVkTm1SUDN4b1ZuZnZGZVFvSzFYYkdQbGFodWtTWFYy?=
 =?utf-8?B?ZVh4bUJhT2FLRy9WWFNyYUplZTJhenlhem04YTYyNy9KWTR4RTB5NmdKaVFq?=
 =?utf-8?B?SzI5OURESlJ2UnlPVm5RaE5rSHFEV3hmWXorQmJ4bXAvZmJUSzRQV1FmcXBG?=
 =?utf-8?B?T0NjOUVCeEpZanVVYnBJUVpwT083b1dEaGVQZ0FGTWZXclM5R2x4NXNzWldl?=
 =?utf-8?B?V0RvaUppc3BxZHRjNnM1UHNMVUxla1dMbGJaOXlYdWM0VWllZnVvQ2RQVGcy?=
 =?utf-8?B?dTMwOVpGRkJ6MURLWFVRc0NPell5ODBhSWF1K3ZOUlNYdUNqa3RmNnlXTG1I?=
 =?utf-8?B?VkZaM29Nclh6cXNsblNPWmtqWjlVM2JUZm1YMEMvdFFZWkdmWGlPUkxaQkNu?=
 =?utf-8?Q?ajcQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(42112799006)(1800799024)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUxRYnV1UEpYNDNwK3VNOEtrWEFlalYwVDdDNDFFVUQ4VUJBZC8relFFNi9U?=
 =?utf-8?B?TW5rdjd6QjduT21sZmE5a09HZldJY0FFcC9jaVVBdU1QK0Erc1g1NldCbS9N?=
 =?utf-8?B?RnJ2OGxQdW1PWE1Rak1vZDlBczlQVzJyMWd2b2JwZTRpWVdjUmsvY2pMcTZ4?=
 =?utf-8?B?ZUxMZWR3K2xlbEJSa1NuSi9OaFpGZFFhaTkybDY1UWFScmE1R2s0RWVVa1ZO?=
 =?utf-8?B?NHhVOEJnNWU3NkJiYzRBclpQZUFQdE5aNlhzUWJTd2pHWE9GekN5ME1tNENR?=
 =?utf-8?B?RWVWTlM1WHBZdkI1OG5zZjQxTitGbGdPNWVwSGxZRnBudHd4MnlhLzFxVndr?=
 =?utf-8?B?V0RxaEt1djVmdVFJSW5HdUUveFZ5Z2RsbGhUajk0R01lTjF5YXRxaEtBNHJr?=
 =?utf-8?B?UCt1SVRCMC83ejFkdEJqc0g1UDlKQmN6T0t5eURFVFVYei96eld1Z2hadzQy?=
 =?utf-8?B?VGNOZGsyaEdsQzVWbDNlSk9ld24zNjJ3ZVorK1BFVU9QMm1KM0tLRGZQYm8r?=
 =?utf-8?B?Sjd5bExLYXJ3RmNvY2tDR0kzSTlXTDVrajRWa2JsVlRubmRPYjNVdmVJQ2tK?=
 =?utf-8?B?c0x1UlI1QWJRV0lQSE5lUWY3SUFXZEVPOVlqT0dqdDloQ2VHeEs2QmlGM2tv?=
 =?utf-8?B?WnU0Nm1sUithMkVDUGkvcWViZUN0elcvUTBPamhrdm1sa0F3SWxzU1d2UlYx?=
 =?utf-8?B?aENXVHhFcEhkS3JTQnpEVGY4RGVPRUZTL0N0UlZZdjNpV0R6Y0tEMUw1TFc3?=
 =?utf-8?B?UU4zODkwVDJoUlNZLzdRbzZhcFhRL1YvOWk0amxiNzc1VVpINzRMNHVMaXhR?=
 =?utf-8?B?YTlGanVoSmlGUlNyNmsrNHlCc3YwS0dndGVsOTUvUVNZYWxIdlYvNnJDS2g3?=
 =?utf-8?B?TVlqZk9ybjNNSnJGSDA1N2NvS3I3Vk1KWDRVQnVtQktRdUtBdFZVN3c5NERN?=
 =?utf-8?B?bmwrVGY0bXl4VGpaTTJxV21wN2ZIb294SjVnZDk4cmt0d00zQitDN0s1UEdq?=
 =?utf-8?B?SXF0ek4yNmdleElNVys0R0FlbXgxNVA0RGdkbWE3dUprd1hDVWdVSlNFMzJK?=
 =?utf-8?B?Tmo0MURjOEtaYktyL3FHMTc5SldmNmdIT01IOERQUEpuMnpQc3E1d3psOWNx?=
 =?utf-8?B?RkdNN24zRmJIdk85WVdybWhUK3BkTVFIMWtvbjMyVndkMkxqd203SnltZ1Jp?=
 =?utf-8?B?bWZWNS9wTmRxVmtzeE9qUUVzdjBCZW50WHRiRWFTNXVGMnRhUUFlOUVSOC90?=
 =?utf-8?B?cEJPd216eWZTbnRCT1I0UU5nYU1WRkN5eEhMREtYQ1VzQVIwZ0ZWakJDdkg4?=
 =?utf-8?B?S0x5eVZSYnJqSlpMWndheEhTTE5VdWNuODFTSWplUUZ1SUJrVnZvUFEzWWRH?=
 =?utf-8?B?eWpDVGxoWmttMzk3dXJuczFGNWgvOU00aHhaaWYrRDRHbkVoM0M3aDB5TVdy?=
 =?utf-8?B?QUNibGtKWkIxVTNNYTN0czc5ZkwzU1lTa2o5YU90M3ZnR1FuM3VIb3M5RklK?=
 =?utf-8?B?a004cVo0UGVQUEFxM3ExbVlYaVZFR0ovYnpMaDJVQ1kzb292Q1FOenFxczZo?=
 =?utf-8?B?WFhEcTQyckwySDZRa2YyYTZHK3RTNzZhend4dDU1cjdJa3VjRkkrRUVxK25Z?=
 =?utf-8?B?WEFHanlFREwyelVYdWY4ZE1rdXRQRHYvS2NGK3JkbU5Vc3JZVUpZMVllSklU?=
 =?utf-8?B?dGE2RG04ZlZ3bGFjYWRBQXdHcUtqWTdWMEJRaE1kUHdJUERWdktmbUJsSUg5?=
 =?utf-8?B?NllPaVlTR3BmUHRuWHRmb1N2a013cWZiYWVxQ1M4TzZDa2Z0OVRLRmFhSGNm?=
 =?utf-8?B?RWJuYXlnUXkyQ2ZVTkd1VHUxY2g2MjNoWmdrNVl1cjRFRnlkaUYrWC9zOHI3?=
 =?utf-8?B?Y3htZXdIZjlDUTd5UXRxUTROWVdCUXMyWHBqSnJyRC8yTmQwT3AwOU82aC9R?=
 =?utf-8?B?MDFIT2lreUJuWFlpa2tKUWpFWUNsVDFWZEtWbWs4SU53LzBxSzNWVk1hM2Rz?=
 =?utf-8?B?U2Z3cEdJREVMWndNbHBNalhDY1pGc1ZQU240TDM5ejljNS94eGVHaTVpSmVt?=
 =?utf-8?B?UkFvZkpXcWdnUGNyUklya0wxc05QZFMzKzhNMVRzOTZKSVNqdW01UzJxeHp2?=
 =?utf-8?Q?LtN+YTNnr+smA0C7lehzgDcyq?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8A867DBA6784AD4782CED296213A509B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23dc94c8-8f48-445f-660e-08de274c8c34
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 09:18:05.6237
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hjpLpc7E7N8KaX2NXB4ym2W+pWQTdMt+pC9N+WKHZngEudJlccQcArhvN63uFKr+/Q7Jbwq1jJosMTJ1IqQp4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8761
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_011822_241538_A11F6B6A 
X-CRM114-Status: GOOD (  19.08  )
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

T24gVHVlLCAyMDI1LTExLTA0IGF0IDE2OjU1ICswODAwLCBMaWFua3VuIFlhbmcgd3JvdGU6DQo+
IEJ5IGFkanVzdGluZyB0aGUgb3JkZXIgb2YgbGluayB0cmFpbmluZyBhbmQgcmVsb2NhdGluZyBp
dCB0byBIUEQsDQo+IGxpbmsgdHJhaW5pbmcgY2FuIGlkZW50aWZ5IHRoZSB1c2FiaWxpdHkgb2Yg
ZWFjaCBsYW5lIGluIHRoZSBjdXJyZW50IGxpbmsuDQo+IA0KPiBJdCBhbHNvIHN1cHBvcnRzIGhh
bmRsaW5nIHNpZ25hbCBpbnN0YWJpbGl0eSBhbmQgd2Vha25lc3MgZHVlIHRvDQo+IGVudmlyb25t
ZW50YWwgaXNzdWVzLCBlbmFibGluZyB0aGUgYWNxdWlzaXRpb24gb2YgYSBzdGFibGUgYmFuZHdp
ZHRoDQo+IGZvciB0aGUgY3VycmVudCBsaW5rLiBTdWJzZXF1ZW50bHksIERQIHdvcmsgY2FuIHBy
b2NlZWQgYmFzZWQgb24NCj4gdGhlIGFjdHVhbCBtYXhpbXVtIGJhbmR3aWR0aC4NCj4gDQo+IEl0
IHNob3VsZCB0cmFpbmluZyBpbiB0aGUgaHBkIGV2ZW50IHRocmVhZC4NCj4gQ2hlY2sgdGhlIG1v
ZGUgd2l0aCBsYW5lIGNvdW50IGFuZCBsaW5rIHJhdGUgb2YgdHJhaW5pbmcuDQo+IA0KPiBJZiB3
ZSdyZSBlRFAgYW5kIGNhcGFiaWxpdGllcyB3ZXJlIGFscmVhZHkgcGFyc2VkIHdlIGNhbiBza2lw
DQo+IHJlYWRpbmcgYWdhaW4gYmVjYXVzZSBlRFAgcGFuZWxzIGFyZW4ndCBob3RwbHVnZ2FibGUg
aGVuY2UgdGhlDQo+IGNhcHMgYW5kIHRyYWluaW5nIGluZm9ybWF0aW9uIHdvbid0IGV2ZXIgY2hh
bmdlIGluIGEgYm9vdCBsaWZlDQo+IA0KPiBUaGVyZWZvcmUsIGJyaWRnZSB0eXBlYyBqdWRnbWVu
dCBpcyByZXF1aXJlZCBmb3IgZWRwIHRyYWluaW5nIGluDQo+IGF0b21pY19lbmFibGUgZnVuY3Rp
b24uDQo+IA0KPiBUaGUgYG10a19kcF9hdXhfcGFuZWxfcG93ZXJvbmAgZnVuY3Rpb24gZmFpbHMg
dG8gYWxpZ24uDQo+IFdpdGhpbiB0aGUgYG10a19kcF9ocGRfZXZlbnRfdGhyZWFkYCwgaWYgRFAg
aXMgZGlzY29ubmVjdGVkLA0KPiB0aGUgYG10a19kcF9hdXhfcGFuZWxfcG93ZXJvbmAgZnVuY3Rp
b24gd2lsbCB3cml0ZSBmcm9tIGBhdXhgIHRvIGBEUFJYYCwNCj4gY2F1c2luZyBhIGZhaWx1cmUg
YW5kIHRodXMgcHJldmVudGluZyBzeW1tZXRyeS4NCg0KSSdtIGN1cmlvdXMgYWJvdXQgYW5vdGhl
ciBjYXNlLg0KSW4geW91ciBkZXNjcmlwdGlvbiwgd2hlbiBEUCBwbHVnIG91dCBhbmQgcGx1ZyBp
biwgRFJNIGNvcmUgd291bGQgbm90IGNhbGwgbXRrX2RwX2JyaWRnZV9hdG9taWNfZW5hYmxlKCks
IHJpZ2h0Pw0KSWYgc28sIHdoZW4gSSBwbHVnIG91dCBEUCwgYW5kIHBsdWcgaW4gYW5vdGhlciBE
UCBwYW5lbCB3aGljaCBzdXBwb3J0IHNtYWxsZXIgcmVzb2x1dGlvbiwNCnRoZW4gbXRrX2RwX2Jy
aWRnZV9hdG9taWNfZW5hYmxlKCkgaXMgbm90IGNhbGxlZCBhbmQgYmVsb3cgY2FsbCBzZXF1ZW5j
ZSB3b3VsZCBub3QgaGFwcGVuOg0KDQptdGtfZHBfYnJpZGdlX2F0b21pY19lbmFibGUoKSAtPiBt
dGtfZHBfdmlkZW9fZW5hYmxlKCkgLT4gbXRrX2RwX3NldF90eF9vdXQoKSAtPiBtdGtfZHBfc2V0
dXBfdHUoKQ0KDQpJbiBtdGtfZHBfc2V0dXBfdHUsIGl0IHdvdWxkIHNldCBzcmFtX3JlYWRfc3Rh
cnQgYWNjb3JkaW5nIHRvIGxhbmVfY291bnQuDQpCdXQgdGhlIGNhbGwgc2VxdWVuY2Ugd291bGQg
bm90IGhhcHBlbiB3aGVuIG5ldyBwbHVnIGluLCB0aGUgc3JhbV9yZWFkX3N0YXJ0IHdvdWxkIGJl
IG9sZCB2YWx1ZSB3aGljaCBtYXkgaW5jb3JyZWN0Lg0KSWYgdGhpbmsgdGhhdCB3aGVuIHBsdWcg
aW4gYW5kIHBsdWcgb3V0LCBpdCBzaG91bGQgZGlzYWJsZSBEUCBhbmQgdGhlbiBlbmFibGUgRFAg
YWdhaW4uDQpJZiBEUk0gY29yZSBkb2VzIG5vdCBkbyB0aGlzLCBJIHRoaW5rIHdlIHNob3VsZCBt
b2RpZnkgRFJNIGNvcmUgb3IgeW91IHNob3VsZCByZWNvbmZpZyB0aGUgd2hvbGUgRFAgd2hlbiBw
bHVnIGluLCBub3Qgb25seSB0cmFpbmluZy4NCg0KUmVnYXJkcywNCkNLDQoNCg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogTGlhbmt1biBZYW5nIDxsaWFua3VuLnlhbmdAbWVkaWF0ZWsuY29tPg0KPiAt
LS0NCj4gQ2hhbmdlIGluIFY3Og0KPiAtIFNlcGFyYXRlIHRoZSBlZHAgcGFydDoNCj4gaHR0cHM6
Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVj
dC9saW51eC1tZWRpYXRlay9wYXRjaC8yMDI1MDgyMjEyMDUwNi4xNTQ4Ni0xLWxpYW5rdW4ueWFu
Z0BtZWRpYXRlay5jb20vX187ISFDVFJOS0E5d01nMEFSYnchazRMZjlVYWdHdnFGNXJ6cXBQdFdS
ZW80ekY0VXpCa21nY0hacTB6NnEzZjdreUEtcnRqOGtWOHVpS1AybnJ5RzBzVHBPUmwxWTU4U3Vt
OWRpeFRELVAwJCANCj4gDQo+IENoYW5nZSBpbiBWNjoNCj4gLSBGaXhlZCBwb3dlciBvbiBpbiBh
dG9taWMgZW5hYmxlLg0KPiBQZXIgc3VnZ2VzdGlvbiBmcm9tIHRoZSBwcmV2aW91cyB0aHJlYWQ6
DQo+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL3BhdGNod29yay5rZXJuZWwu
b3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvMjAyNTA2MzAwODA4MjQuNzEwNy0xLWxp
YW5rdW4ueWFuZ0BtZWRpYXRlay5jb20vX187ISFDVFJOS0E5d01nMEFSYnchazRMZjlVYWdHdnFG
NXJ6cXBQdFdSZW80ekY0VXpCa21nY0hacTB6NnEzZjdreUEtcnRqOGtWOHVpS1AybnJ5RzBzVHBP
UmwxWTU4U3VtOWQydXlYeU9BJCANCj4gDQo+IENoYW5nZSBpbiBWNToNCj4gLSBGaXhlZCB0aGUg
aXNzdWUgdGhhdCB0aGUgNHRoIHZlcnNpb24gb2YgdGhlIHBhdGNoIGNhdXNlZCBEUCB0byBoYXZl
IG5vIHNjcmVlbi4NCj4gUGVyIHN1Z2dlc3Rpb24gZnJvbSB0aGUgcHJldmlvdXMgdGhyZWFkOg0K
PiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9y
Zy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIwMjUwNjI1MDk1NDQ2LjMxNzI2LTEtbGlh
bmt1bi55YW5nQG1lZGlhdGVrLmNvbS9fXzshIUNUUk5LQTl3TWcwQVJidyFrNExmOVVhZ0d2cUY1
cnpxcFB0V1JlbzR6RjRVekJrbWdjSFpxMHo2cTNmN2t5QS1ydGo4a1Y4dWlLUDJucnlHMHNUcE9S
bDFZNThTdW05ZHB0bHgxa2MkIA0KPiANCj4gQ2hhbmdlIGluIFY0Og0KPiAtIFRlc3RlZCB0aGUg
aW50ZXJuYWwgZURQIGRpc3BsYXkgb24gTVQ4MTk1IFRvbWF0byBhbmQgaXQgaXMgZmluZS4NCj4g
UGVyIHN1Z2dlc3Rpb24gZnJvbSB0aGUgcHJldmlvdXMgdGhyZWFkOg0KPiBodHRwczovL3VybGRl
ZmVuc2UuY29tL3YzL19faHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4
LW1lZGlhdGVrL3BhdGNoLzIwMjUwMzE4MTQwMjM2LjEzNjUwLTItbGlhbmt1bi55YW5nQG1lZGlh
dGVrLmNvbS9fXzshIUNUUk5LQTl3TWcwQVJidyFrNExmOVVhZ0d2cUY1cnpxcFB0V1JlbzR6RjRV
ekJrbWdjSFpxMHo2cTNmN2t5QS1ydGo4a1Y4dWlLUDJucnlHMHNUcE9SbDFZNThTdW05ZFR5cllK
TFEkIA0KPiANCj4gQ2hhbmdlIGluIFYzOg0KPiAtIFJlbW92ZSAnbXRrX2RwLT5lbmFibGVkID0g
ZmFsc2UiIGluIGF0b21pYyBkaXNhYmxlLg0KPiAtIFJlbW92ZSAnbXRrX2RwLT5lbmFibGVkID0g
dHJ1ZSIgaW4gYXRvbWljIGVuYWJsZS4NCj4gUGVyIHN1Z2dlc3Rpb24gZnJvbSB0aGUgcHJldmlv
dXMgdGhyZWFkOg0KPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIwMjQxMDI1MDgzMDM2
Ljg4MjktNC1saWFua3VuLnlhbmdAbWVkaWF0ZWsuY29tL19fOyEhQ1RSTktBOXdNZzBBUmJ3IWs0
TGY5VWFnR3ZxRjVyenFwUHRXUmVvNHpGNFV6QmttZ2NIWnEwejZxM2Y3a3lBLXJ0ajhrVjh1aUtQ
Mm5yeUcwc1RwT1JsMVk1OFN1bTlkcmdjOVgwbyQgDQo+IA0KPiBDaGFuZ2UgaW4gVjI6DQo+IC0g
QWRqdXN0IERQIHRyYWluaW5nIHRpbWluZy4NCj4gLSBBZGp1c3QgcGFyc2UgY2FwYWJpbGl0aWVz
IHRpbWluZy4NCj4gLSBBZGQgcG93ZXIgb24vb2ZmIGZvciBjb25uZWN0L2Rpc2Nvbm5lY3QuDQo+
IFBlciBzdWdnZXN0aW9uIGZyb20gdGhlIHByZXZpb3VzIHRocmVhZDoNCj4gaHR0cHM6Ly91cmxk
ZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51
eC1tZWRpYXRlay9wYXRjaC8yMDI0MDMxNTAxNTIzMy4yMDIzLTEtbGlhbmt1bi55YW5nQG1lZGlh
dGVrLmNvbS9fXzshIUNUUk5LQTl3TWcwQVJidyFrNExmOVVhZ0d2cUY1cnpxcFB0V1JlbzR6RjRV
ekJrbWdjSFpxMHo2cTNmN2t5QS1ydGo4a1Y4dWlLUDJucnlHMHNUcE9SbDFZNThTdW05ZFl4ak50
RTgkIA0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHAuYyB8IDIwICsr
KysrKysrKysrKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHAuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHAuYw0KPiBpbmRleCBiZWY2ZWViMzBkM2UuLjBi
YTJjMjA4ODExYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHAuYw0KPiBAQCAtMTk3
Niw2ICsxOTc2LDcgQEAgc3RhdGljIGlycXJldHVybl90IG10a19kcF9ocGRfZXZlbnRfdGhyZWFk
KGludCBocGQsIHZvaWQgKmRldikNCj4gIAlzdHJ1Y3QgbXRrX2RwICptdGtfZHAgPSBkZXY7DQo+
ICAJdW5zaWduZWQgbG9uZyBmbGFnczsNCj4gIAl1MzIgc3RhdHVzOw0KPiArCWludCByZXQ7DQo+
ICANCj4gIAlpZiAobXRrX2RwLT5uZWVkX2RlYm91bmNlICYmIG10a19kcC0+dHJhaW5faW5mby5j
YWJsZV9wbHVnZ2VkX2luKQ0KPiAgCQltc2xlZXAoMTAwKTsNCj4gQEAgLTE5OTQsOSArMTk5NSwy
OCBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgbXRrX2RwX2hwZF9ldmVudF90aHJlYWQoaW50IGhwZCwg
dm9pZCAqZGV2KQ0KPiAgCQkJbWVtc2V0KCZtdGtfZHAtPmluZm8uYXVkaW9fY3VyX2NmZywgMCwN
Cj4gIAkJCSAgICAgICBzaXplb2YobXRrX2RwLT5pbmZvLmF1ZGlvX2N1cl9jZmcpKTsNCj4gIA0K
PiArCQkJbXRrX2RwLT5lbmFibGVkID0gZmFsc2U7DQo+ICsJCQkvKiBwb3dlciBvZmYgYXV4ICov
DQo+ICsJCQltdGtfZHBfdXBkYXRlX2JpdHMobXRrX2RwLCBNVEtfRFBfVE9QX1BXUl9TVEFURSwN
Cj4gKwkJCQkJICAgRFBfUFdSX1NUQVRFX0JBTkRHQVBfVFBMTCwNCj4gKwkJCQkJICAgRFBfUFdS
X1NUQVRFX01BU0spOw0KPiArDQo+ICAJCQltdGtfZHAtPm5lZWRfZGVib3VuY2UgPSBmYWxzZTsN
Cj4gIAkJCW1vZF90aW1lcigmbXRrX2RwLT5kZWJvdW5jZV90aW1lciwNCj4gIAkJCQkgIGppZmZp
ZXMgKyBtc2Vjc190b19qaWZmaWVzKDEwMCkgLSAxKTsNCj4gKwkJfSBlbHNlIHsNCj4gKwkJCW10
a19kcF9hdXhfcGFuZWxfcG93ZXJvbihtdGtfZHAsIHRydWUpOw0KPiArDQo+ICsJCQlyZXQgPSBt
dGtfZHBfcGFyc2VfY2FwYWJpbGl0aWVzKG10a19kcCk7DQo+ICsJCQlpZiAocmV0KQ0KPiArCQkJ
CWRybV9lcnIobXRrX2RwLT5kcm1fZGV2LCAiQ2FuJ3QgcGFyc2UgY2FwYWJpbGl0aWVzXG4iKTsN
Cj4gKw0KPiArCQkJLyogVHJhaW5pbmcgKi8NCj4gKwkJCXJldCA9IG10a19kcF90cmFpbmluZyht
dGtfZHApOw0KPiArCQkJaWYgKHJldCkNCj4gKwkJCQlkcm1fZXJyKG10a19kcC0+ZHJtX2Rldiwg
IlRyYWluaW5nIGZhaWxlZCwgJWRcbiIsIHJldCk7DQo+ICsNCj4gKwkJCW10a19kcC0+ZW5hYmxl
ZCA9IHRydWU7DQo+ICAJCX0NCj4gIAl9DQo+ICANCg0K

