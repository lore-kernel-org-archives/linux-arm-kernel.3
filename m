Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D438CC54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 05:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7HyOsAgvOWxiGQwbtVIqt/W0zKNypfQKrABTYASBhdU=; b=kvyIb9U7vyN7s4PDwrDeyHyzF9
	qVDz7wdgkW+lxiq/JiFYDA6NpOJkjFggzRmaBaGYksu5+8dILVVfocpht9Cdi4d3D7ab2FVgTg33p
	jEXtC/7UH8+EAa2U+vH7st8YCWTqYiWrdkRbf0oSx1/OxepnuIrvCd1DOuI7gk9k2oxbYagvdZphz
	GVLcSV+4P9zizkDCR2W/lZwEt5N5FTTtYmrogERMdy4yLU/X25/qKJgbdqO84cQVPruhINU80mvTh
	SO/tQu4DrRhN7gnHJMJBA6McnyQH/78DYa5cqHA5UuaYp1LigmIp83Bd3JAOGGaaI7AopsGwM/pY8
	58J0LFdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpg7K-0000000BppU-0JLq;
	Fri, 31 Jul 2026 05:49:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpg7G-0000000Bpof-3XHY;
	Fri, 31 Jul 2026 05:49:07 +0000
X-UUID: 87d16e888ca311f1acbe4559397dec65-20260730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=7HyOsAgvOWxiGQwbtVIqt/W0zKNypfQKrABTYASBhdU=;
	b=Pe1SXn2B+8jfN3ahHvwVP6Ii82jr4LSkHOR+sz2qHdwRMvT/Rn8IMwZWad/qKwCn7FX3np1lwUmJRSwg/0YsA35sGgFODWGfFFPDxAAtMFREaC4JS2jN7DRTfdn4eSa/PiPxza6rgU8gvNu2dSNfZPpfezEwLzYR3P2Q007zRqQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:a44b2f86-47bb-43bd-b42c-0bedbcc05134,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:35eda66c-3b50-4451-bcf8-9f950fd136e5,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-
	1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 87d16e888ca311f1acbe4559397dec65-20260730
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <chaotian.jing@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1737942687; Thu, 30 Jul 2026 22:49:01 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 31 Jul 2026 13:48:58 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 31 Jul 2026 13:48:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qT3C96MY5Ie9qBKgW7HI3ytcWDKy8YNad4vs9b5J/S0qKsPXAaNadgfnjIB1x3I3XUB386P6suclK5z564W8uNswTtv4iqvm98fbGKeDgdg514H+M8w0fZ3osoaSddLqQcrVygAk9JsCNym6o5B+hEhval1IW3G0g2mbpoXhGb2VsPi1XyvskLama5hUj/3mkTwxnMB9VzZxPnwuLpUJhjQ45eB4S1+mqrgjPIU6mhB8i4nGnWqDZc1PLTnUhP/DuPtk9aPMQe7K4vPJnNiZxtUNjDjeiZyHp+38Ugi/iSvJUpSOAdUG+0xTkusMTv9gZw1baPSw7HrJVpW7BWOdgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7HyOsAgvOWxiGQwbtVIqt/W0zKNypfQKrABTYASBhdU=;
 b=JfbGUswZyW0pv3p5n7Ms5B+RBWoxJP8g4hwU0xlCh3H+Pg0xle75IONRS749k+RSoJEgxLPX/9nrgC/yn8MPACrhIKpDZhNCMJIkeQ1nfHrNDdIA9inV0MwpPTK5npQuMMMNX6gKq+CEjC8GkCzgPo6uUgHDCBBC0CblUKahrkyC58AAimJlX5FVjhu98FTx9KcqqlkgnC3/IX+TXEHjhLLuHsx5+UCFKmAE27fPV8uIKvcelRN5exCk9TU8BQlnrfj/UGn1LZWg4/y2lmXVmbHOqI0/iDeIvYlZ9CXb4dk8q4bkw9DWt2hP6zISdEKQf+Mv/jMBP1WsZ5GxPEw6OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7HyOsAgvOWxiGQwbtVIqt/W0zKNypfQKrABTYASBhdU=;
 b=mDkmcKKi9jhKPRA/aTwOGYVYRZhLEVViL9vPc+j4EMM/AnWcgR483CY0QEhhAjKqznzvoAC+9zK89fIa5t84dxkA9NUDAodsGa38X80b70vaMKHM2oKVzSXO1KKvCAbDK8Aewrr3XkfRUXmcShZvJUhpabFRdC3KUvQzQ9P3/2A=
Received: from KL1PR03MB6032.apcprd03.prod.outlook.com (2603:1096:820:8b::7)
 by SEYPR03MB6901.apcprd03.prod.outlook.com (2603:1096:101:b4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 05:48:53 +0000
Received: from KL1PR03MB6032.apcprd03.prod.outlook.com
 ([fe80::8d8a:2d79:b170:1ec4]) by KL1PR03MB6032.apcprd03.prod.outlook.com
 ([fe80::8d8a:2d79:b170:1ec4%6]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 05:48:53 +0000
From: =?utf-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
	<Chaotian.Jing@mediatek.com>
To: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
	"avri.altman@sandisk.com" <avri.altman@sandisk.com>,
	=?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"bvanassche@acm.org" <bvanassche@acm.org>, Louis-Alexis Eyraud
	<louisalexis.eyraud@collabora.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
	"chu.stanley@gmail.com" <chu.stanley@gmail.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"robh@kernel.org" <robh@kernel.org>, "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "vkoul@kernel.org" <vkoul@kernel.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"nicolas.frattaroli@collabora.com" <nicolas.frattaroli@collabora.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"kernel@collabora.com" <kernel@collabora.com>, "linux-scsi@vger.kernel.org"
	<linux-scsi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>
Subject: Re: [PATCH v10 03/26] dt-bindings: ufs: mediatek,ufs: Add mt8196
 variant
Thread-Topic: [PATCH v10 03/26] dt-bindings: ufs: mediatek,ufs: Add mt8196
 variant
Thread-Index: AQHdIAji93igLX6eA0mDqmftc6+2JraHIHYA
Date: Fri, 31 Jul 2026 05:48:53 +0000
Message-ID: <f0c2efdbaa0399a50e2985aee42b8f387e5daf37.camel@mediatek.com>
References: <20260730-mt8196-ufs-v10-0-bc5ecef202dc@collabora.com>
	 <20260730-mt8196-ufs-v10-3-bc5ecef202dc@collabora.com>
In-Reply-To: <20260730-mt8196-ufs-v10-3-bc5ecef202dc@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB6032:EE_|SEYPR03MB6901:EE_
x-ms-office365-filtering-correlation-id: 2e53d6c2-1b09-41c5-3623-08deeec76788
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|18002099003|22082099003|4143699003|11063799006|3023799007|38070700021|10067099003|56012099006|921020;
x-microsoft-antispam-message-info: 6L/jhPEZlyeewH22e8TE69hZGO2ytW9MzIdD9yoMjetc6x0eQhx66N2UM3OeKJsvO2NBGk/Ytv19SiglIRB+VrreP8PQxE0rOlKtgqmARPFnSxmffNbqN2xaX2OXtfzTQ8dxuFKXBpPdCQR9rRGtbn/lItoPsNlnKgJvre6MVwc059cCtuJRNpgckPrwD9t9LXkHOR6otrOu7ImFq/9KWKMUQ1KQ6xUpRtIgyk3NJn7BRYDW1iByhDZpcusP3wxY+JNCGyRf/jHTeeP4JWb9gRXT+fbkRA+2Fl5VY0f89Ny6/Klb5HbbFSwMacjIU0yFZxTP4YCikYHhxLGImINBsFMpz03QQUbo/Xdcim9USrdWXcR8+z2H/n8rKVr2y9tM+aVSRocpaCsfJtr6SFnaYTmlJDxVN4OO7sHjOlfhvE+JKLNxWGXWINhral/Ed1cYM7X9tKhbfej0IC/FEDpe+fxRIRk0bvRmWtXP79mmReRcNfByivXhCTzBHEk+qTElJJbnyr5qSnTLgK29nNhATcgaqtAvmHtUMlFg/3wwmO4HaKWFfc/lLqlRKMeL0jWBgg/TBDSQvLkOY3+V32Mpq5Np/bK1agweIgfXk/cRytdytzGCIzoSxK5xoB9kYA5Q2xSNC1wv275uiFnqDEj7q0+kRF9eIBvODcFoFbQeez4EgEYMtXdQWh0S+K3DoK33iaD9ywmpBOf++t11mUHuvCI7OpvyYpR3h9fM4aGIUNmaFb1a3ADQ/ejnzA/Z2x+l
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB6032.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(18002099003)(22082099003)(4143699003)(11063799006)(3023799007)(38070700021)(10067099003)(56012099006)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUFrYlBnSXBtNmVLOFdqeGt0UGwrTEt1WDNDakxUZ29Jd3dxc0tuMUNMU1NM?=
 =?utf-8?B?ZmFnbmNJYWhha2svYjcraFdMV2piQUFqTmNuWGF6c2xscjIvSUM0eU40TGF5?=
 =?utf-8?B?NmlwcEVUTHBFbW1KZDQrMWIzQ01tWmExQmw5T1ZXVXRzeERUVkJFc3JlL3hi?=
 =?utf-8?B?Q1BoRHphSmlmdkl3YWVqMXJQdmVvREtVT3hNbndSdHJkWUxGcE5IZkIwOTg4?=
 =?utf-8?B?eTlPZ3BDa2s0dHZadW9Eb3hsQ3B1Z1llZHA1K1l1UERicHpzaDR5d2hLeU9i?=
 =?utf-8?B?Tm83RTlndzlQaFlFeVNzZCtUNWdGWWcyV1hXS2dQQkg0OHhqaW5zMlE0NHJF?=
 =?utf-8?B?R3NmZFF0WXJlU0RaSUI3NEFia05oanVrdTkwTUVsOFRQTTlPenAyRU1tZnhm?=
 =?utf-8?B?VUxvNnpwQXJkREM5RkxYWFRuSXphbFg1QXJxNGd0ZGh6ZzRKbHVpMzhMTHRj?=
 =?utf-8?B?ME81Y3QwMExzSXo0Nmt1VFNoMEVUa0lkWHBlTFdZdnlQc0tsdWtrSmVDeGxZ?=
 =?utf-8?B?VEc1aklJMGttU2tpYnAwZ3NrK2tYNGNKbTg0ZjZWYndTaE9WWEcyd1VNKzdB?=
 =?utf-8?B?STV6aTB0Z3Z0aXBKeExIV3htOVp2cnBJTmgwc1BFSnd0QXRmczBOeGJHQlRy?=
 =?utf-8?B?S2krYzBJckxnL0dPTGhoNEM2K1NSYjZGc2tuUEgvajBoQkV1UFFPUk1BQkts?=
 =?utf-8?B?cXpIeXFqWER6cURZeFRvbnlPWUFTNGI0cDBReGJ5NnQxYVpCdWpKWmdUWmJW?=
 =?utf-8?B?YXkzNEJ4ZW5teFkwaFV2QWx4SGpXUDNCa2cvUWEyWmJIbXFINWpzZm1BL1ll?=
 =?utf-8?B?NHUvTDR2Yjk4eUQ2OStobHZrQ09TVnJVOHVDZzRub0dvK0FzTDBDdTdmSjFV?=
 =?utf-8?B?ei9ocW5UNm9BdTNiWmgyaFlpMnpPOGd3enNNbHFKOU5lU1ZIOUpNclRsSnJq?=
 =?utf-8?B?OVpnQ0Z1eUVsbFVlVVJqUmVnQmhxV0VKeCtDaGFQdHZVcjVBODdZZWlRditO?=
 =?utf-8?B?QUdHUmFsSzVpREF2bDB5Yk5PRmFoSE1WMXFUbWxWeTAzQmd5Rzk0QXJ2Si8z?=
 =?utf-8?B?QkUvSEZZdkJqR3J4ODM1N2Nlc1EyRWpNMjE1aTJTVzFWM0ZYMGcrQ2lwZzZD?=
 =?utf-8?B?THlkWDdVYTcrTVJJMGtUUGVDczEzSkpMSUFtb2VvanNERkhwTS9tZEJWTW4r?=
 =?utf-8?B?RzlWN1loVEhvdFNycTBzWFdLOUdKNnFOaXAxa2xyY1pQZ21qNEFIS3ExNk1z?=
 =?utf-8?B?czNPZ3ZTQjh1aGRkdUlvYk9Fd0dYQk9yUjNoNlBvbE1qbXhiQUNqYk52SXQy?=
 =?utf-8?B?dHBOaWgvbnZiN1QxN05lQjlaWVNTa0FXNVU1SUsyYVRYQW9QY1JCT0Z6ZkVh?=
 =?utf-8?B?MU1FbFRrMEp1b1pNMFJsSFJkWW4rMWxZVmRxSEplM1lBdDRUbXhCSjlzVGc1?=
 =?utf-8?B?SGJLcDR4MXBaRm5CMm54TkRYaUV1MlMrN2E2MDhmcDhLclFsaUZ6b3dHM0l3?=
 =?utf-8?B?VE8rUkdBTDRuMThGOTRnUENJZUlsSjdEazN1SmZJYzlET2Q4bHVVK3dvUDF2?=
 =?utf-8?B?SkhpaXZ4ZUYyS1EvY2pzMDBLb1FSK2hHdnFvck85YXNsblM2ZkVISnFUZmIw?=
 =?utf-8?B?QmZrdEo4THNEL2J6SkV1MjJVVzdsS3l5eEg3N2plbHhnMzEvYWpwL2gwNjA2?=
 =?utf-8?B?LzZZOVJxeEoyWGFDZ3EyV0dWQTl5KzJ1T1hwRjRmTEtHVTdrY3FyN2lHZjda?=
 =?utf-8?B?WDIxTGlVa0hsN2xjeW1MMUdwbDNEL21xcEpTdE5waStSSzB1QnVMbCtqaG1N?=
 =?utf-8?B?VzhQMnIvZmVIdnFZMGYzeE53MDRUKzJ4SHZmWTR0R0t0dmNHNGlWZDRjVE9J?=
 =?utf-8?B?MU52eHk4VXQwamFrSjBWUTMzQlhGL0JOeXBGNkNuSHhrUk1FQjkyMnlOakgx?=
 =?utf-8?B?VzZGMUpibld3MFFaWnNyOEhVaUlhb2NabXVwZGg1OVdKRzhZRDU1bm9RRXYz?=
 =?utf-8?B?Ykw4dTB4R2dwWWU3NGpUVXRpRS9od0VwYURuejNQaGdtSGtWNmpKSGlxSlht?=
 =?utf-8?B?S1J2dUl0RkkrU3orTGk0N1gxaHdRRDdVd2pZaGZXb2tpaFMyeU5JdzVtRVNN?=
 =?utf-8?B?SC9aREFkKzZvN2gzczl6ZlBGdkNESzcrQjJhL3VuU0szSVJ2M3ZVY2hwV0V1?=
 =?utf-8?B?R2NJWWVBdEtNYWlJRlEvbkttYkRHUmVNNThkOTh0eGszbitqakV6VnozcjZU?=
 =?utf-8?B?WnRSQ1dOdVVGajRralhiMzg0bXFCSlJEN1VzSVBvODFvUHZ0RG0rdWVKbHdn?=
 =?utf-8?B?dmQzbnJkaEJTNWoyNnRycGs4MEZFOUM3eUxtNUNXcUQvbTdBTXpwOFJ1NFEw?=
 =?utf-8?Q?YdavyYOWtZfLd7q0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF6A686B90A0AB40A6FBFF7E27FB11D4@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: QkknaMdju00DGv498a65QYEFefLsc8kcIEj6J8eqFg/nQAw9v7fbhFO6fNmi+jTepmPT25PBuWBhQgXehhh7ofDZL4XqLy6PRLGudbXwel6MTfs1atM1KTkmelgSZ05BDq8hZySxVfbubgYf9nKYNlS+8+PMJd67+yas0/41lFTEV5nD4vJYqOZvtunxOuNKv3Qhsc39/Hsb1qbODTro05Ks2YmvnnqKjmI58RtJR7e0xP3a4l7TzYxTzcrsfPo7zN37ucBgRrtyA5ZDNXZkBRrRNkwQPLTFbzUqTL0bGfjINc0P8qnweVehln9bMo/vaFF4Dx0+BrwfnflQmT02og==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB6032.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e53d6c2-1b09-41c5-3623-08deeec76788
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2026 05:48:53.4854
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YnWJqaFmXQUh0SbZ6rJjMT4wJsyR+uMSyYcsrAmp7XT45OWEeIaCmhnzR+RtUcgfUBFsCs5MKS+SCRxprVLQ++MHbVgRgJyhkTriz6YzxcQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6901
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_224906_891392_1DB71D0F 
X-CRM114-Status: GOOD (  19.46  )
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

T24gVGh1LCAyMDI2LTA3LTMwIGF0IDExOjQ4ICswMjAwLCBMb3Vpcy1BbGV4aXMgRXlyYXVkIHdy
b3RlOg0KPiBGcm9tOiBOaWNvbGFzIEZyYXR0YXJvbGkgPG5pY29sYXMuZnJhdHRhcm9saUBjb2xs
YWJvcmEuY29tPg0KPiANCj4gVGhlIE1lZGlhVGVrIE1UODE5NiBTb0MncyBVRlMgY29udHJvbGxl
ciB1c2VzIGEgZGlmZmVyZW50IHNldCBvZg0KPiBzdXBwbGllcy4NCj4gSXQgaXMgdGhlcmVmb3Jl
IG5vdCBjb21wYXRpYmxlIHdpdGggdGhlIE1UODE5NS4NCj4gDQo+IFdoaWxlIGl0IGRvZXMgaGF2
ZSBhIEFWREQwOV9VRlNfMSBwaW4gaW4gYWRkaXRpb24gdG8gdGhlIEFWREQwOV9VRlMNCj4gcGlu
LA0KPiBpdCBhcHBlYXJzIHRoYXQgdGhlc2UgdHdvIHBpbnMgYXJlIGNvbW1vbmVkIHRvZ2V0aGVy
LCBhcyB0aGUgYm9hcmQNCj4gc2NoZW1hdGljIEkgaGF2ZSBhY2Nlc3MgdG8gdXNlcyB0aGUgc2Ft
ZSBzdXBwbHkgZm9yIGJvdGgsIGFuZCB0aGUNCj4gZG93bnN0cmVhbSBkcml2ZXIgZG9lcyBub3Qg
ZGlzdGluZ3Vpc2ggYmV0d2VlbiB0aGUgdHdvIHN1cHBsaWVzDQo+IGVpdGhlci4NCj4gDQo+IEFk
ZCBhIGNvbXBhdGlibGUgZm9yIGl0LCBhbmQgbW9kaWZ5IHRoZSBiaW5kaW5nIGNvcnJlc3BvbmRp
bmdseS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5pY29sYXMgRnJhdHRhcm9saSA8bmljb2xhcy5m
cmF0dGFyb2xpQGNvbGxhYm9yYS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IExvdWlzLUFsZXhpcyBF
eXJhdWQgPGxvdWlzYWxleGlzLmV5cmF1ZEBjb2xsYWJvcmEuY29tPg0KUmV2aWV3ZWQtYnk6IENo
YW90aWFuIEppbmcgPGNoYW90aWFuLmppbmdAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCj4gIC4uLi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3Vmcy9tZWRpYXRlayx1ZnMueWFtbCAgICAgIHwgNDUNCj4gKysr
KysrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKykN
Cj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdWZz
L21lZGlhdGVrLHVmcy55YW1sDQo+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3Vmcy9tZWRpYXRlayx1ZnMueWFtbA0KPiBpbmRleCBlN2UzNjBjNTliYTUuLjcwMTY0ZTRlNTRj
NSAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Vmcy9t
ZWRpYXRlayx1ZnMueWFtbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvdWZzL21lZGlhdGVrLHVmcy55YW1sDQo+IEBAIC0xNiw2ICsxNiw3IEBAIHByb3BlcnRpZXM6
DQo+ICAgICAgICAtIG1lZGlhdGVrLG10ODE4My11ZnNoY2kNCj4gICAgICAgIC0gbWVkaWF0ZWss
bXQ4MTkyLXVmc2hjaQ0KPiAgICAgICAgLSBtZWRpYXRlayxtdDgxOTUtdWZzaGNpDQo+ICsgICAg
ICAtIG1lZGlhdGVrLG10ODE5Ni11ZnNoY2kNCj4gIA0KPiAgICBjbG9ja3M6DQo+ICAgICAgbWlu
SXRlbXM6IDENCj4gQEAgLTEzMSw2ICsxMzIsMjAgQEAgYWxsT2Y6DQo+ICAgICAgICAgIGNsb2Nr
LW5hbWVzOg0KPiAgICAgICAgICAgIG1pbkl0ZW1zOiAxMA0KPiAgICAgICAgICBhdmRkMDktc3Vw
cGx5OiBmYWxzZQ0KPiArICAtIGlmOg0KPiArICAgICAgcHJvcGVydGllczoNCj4gKyAgICAgICAg
Y29tcGF0aWJsZToNCj4gKyAgICAgICAgICBjb250YWluczoNCj4gKyAgICAgICAgICAgIGNvbnN0
OiBtZWRpYXRlayxtdDgxOTYtdWZzaGNpDQo+ICsgICAgdGhlbjoNCj4gKyAgICAgIHByb3BlcnRp
ZXM6DQo+ICsgICAgICAgIGNsb2NrczoNCj4gKyAgICAgICAgICBtaW5JdGVtczogMTANCj4gKyAg
ICAgICAgY2xvY2stbmFtZXM6DQo+ICsgICAgICAgICAgbWluSXRlbXM6IDEwDQo+ICsgICAgICAg
IGF2ZGQxOC1zdXBwbHk6IGZhbHNlDQo+ICsgICAgICByZXF1aXJlZDoNCj4gKyAgICAgICAgLSBv
cGVyYXRpbmctcG9pbnRzLXYyDQo+ICANCj4gIGV4YW1wbGVzOg0KPiAgICAtIHwNCj4gQEAgLTE3
NywzICsxOTIsMzMgQEAgZXhhbXBsZXM6DQo+ICANCj4gICAgICAgICAgbWVkaWF0ZWssdWZzLWRp
c2FibGUtbWNxOw0KPiAgICAgIH07DQo+ICsgIC0gfA0KPiArICAgICNpbmNsdWRlIDxkdC1iaW5k
aW5ncy9yZXNldC9tZWRpYXRlayxtdDgxOTYtcmVzZXRzLmg+DQo+ICsgICAgI2luY2x1ZGUgPGR0
LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FybS1naWMuaD4NCj4gKw0KPiArICAgIHVm
c2hjaUAxNjgxMDAwMCB7DQo+ICsgICAgICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTk2
LXVmc2hjaSI7DQo+ICsgICAgICAgIHJlZyA9IDwweDE2ODEwMDAwIDB4MmEwMD47DQo+ICsgICAg
ICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAzMjAgSVJRX1RZUEVfTEVWRUxfSElHSD47DQo+ICsN
Cj4gKyAgICAgICAgY2xvY2tzID0gPCZ1ZnNfYW9fY2xrIDY+LCA8JnVmc19hb19jbGsgNz4sIDwm
Y2xrMjZtPiwNCj4gPCZ1ZnNfYW9fY2xrIDM+LA0KPiArICAgICAgICAgICAgICAgICA8JmNsazI2
bT4sIDwmdWZzX2FvX2NsayA0PiwgPCZ1ZnNfYW9fY2xrIDA+LA0KPiArICAgICAgICAgICAgICAg
ICA8JnRvcGNrZ2VuIDc+LCA8JnVmc19hb19jbGsgMT4sIDwmdWZzX2FvX2NsayAyPjsNCj4gKyAg
ICAgICAgY2xvY2stbmFtZXMgPSAibWFpbiIsICJhZXMiLCAidGljayIsICJ1bmlwcm9fc3lzY2xr
IiwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAidW5pcHJvX3RpY2siLCAidW5pcHJvX21wX2Jj
bGsiLCAidHhfc3ltYm9sIiwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAibWVtX3N1YiIsICJy
eF9zeW1ib2wwIiwgInJ4X3N5bWJvbDEiOw0KPiArDQo+ICsgICAgICAgIG9wZXJhdGluZy1wb2lu
dHMtdjIgPSA8JnVmc19vcHBfdGFibGU+Ow0KPiArDQo+ICsgICAgICAgIHBoeXMgPSA8JnVmc3Bo
eT47DQo+ICsNCj4gKyAgICAgICAgYXZkZDA5LXN1cHBseSA9IDwmbXQ2MzYzX3ZzcmFtX21vZGVt
PjsNCj4gKyAgICAgICAgdmNjLXN1cHBseSA9IDwmbXQ2MzYzX3ZlbWM+Ow0KPiArICAgICAgICB2
Y2NxLXN1cHBseSA9IDwmbXQ2MzYzX3Z1ZnMxMj47DQo+ICsNCj4gKyAgICAgICAgcmVzZXRzID0g
PCZ1ZnNfYW9fY2xrIE1UODE5Nl9VRlNBT19SU1QxX1VGU19VTklQUk8+LA0KPiArICAgICAgICAg
ICAgICAgICA8JnVmc19hb19jbGsgTVQ4MTk2X1VGU0FPX1JTVDFfVUZTX0NSWVBUTz4sDQo+ICsg
ICAgICAgICAgICAgICAgIDwmdWZzX2FvX2NsayBNVDgxOTZfVUZTQU9fUlNUMV9VRlNIQ0k+Ow0K
PiArICAgICAgICByZXNldC1uYW1lcyA9ICJ1bmlwcm8iLCAiY3J5cHRvIiwgImhjaSI7DQo+ICsg
ICAgICAgIG1lZGlhdGVrLHVmcy1kaXNhYmxlLW1jcTsNCj4gKyAgICB9Ow0KPiANCg==

