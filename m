Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A84CD8C8B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Jun 2026 08:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48ux2oANNu4kIp3CQiXs6dQskNEele14DnkYwNyzRXY=; b=tfLaw2clEw9/l9hkkgmt1A/nr6
	wLocODK9rK4d/VpTeawnNpGU2jDWGZ+AWWJlPjuKKDk+rvUs0+GxpLpGLSHrshzTx1ys10FkvrAhu
	MqOdStoLKtLK5+/1eDSptdhB6KqltGBLc6wDugSdzWqC+FtgLh0YAYui1EegTp2m7p3Eo8GnQUwJ/
	RsYJ1F4kyOOenCRkrgW/kSacy3NfKneTCqYTZM4TJ6N1nJXZDeQ/FatMtgs/91io0SCAdWQyoY1DK
	CHkuP2Gb7T4qnYz1SJk9R6NfS+yjOx18qVukhByMgq5uv0s1Hvfba74KOUxIs8E04uoYEgfVXZxvm
	QmNLI0RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVm3M-00000001VzN-0tZ9;
	Sat, 06 Jun 2026 08:06:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVm3J-00000001Vyo-3ubN;
	Sat, 06 Jun 2026 08:06:47 +0000
X-UUID: a48c5f10617e11f1acbe4559397dec65-20260606
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=48ux2oANNu4kIp3CQiXs6dQskNEele14DnkYwNyzRXY=;
	b=D8mA+OyK3idf7F1azehe8k8YS9TTyQsoaU199sojGhn9ogCj20BoqvRKN6O59+h+xSMZZX68AeIXfelIVq0UVSZUZkmDYxrzVLt9w4EJ4+asW2LMccYhL0vNawG0bw7HZRBmgnAXbhEOqVoL4jPfhkLoJWiIFl1ZQm9IbKshhrc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:55192197-2e96-4608-8f9b-b2a7ed5874fd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:644d2b50-23b6-41e0-a310-51c498ab6908,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|136|836|865|
	888|898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,Q
	S:nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,A
	RC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a48c5f10617e11f1acbe4559397dec65-20260606
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <zhengnan.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1918589401; Sat, 06 Jun 2026 01:06:37 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 6 Jun 2026 16:06:35 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 6 Jun 2026 16:06:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T2iUEf7FBM/YnXGO3wLifNu5IMJG6XhJ/KP+GdncVrRcEUByhG9AzQ+k8mMcgqbkme1MEtcf6AJRdf7GZvqDK4dLOYEDr89oVikK+eSgIbnR+2Vx7xUB9SlX1fLFeu+ZZ5qg2NfDyCHBBxLPj5gL0yhp/RXk+eP8yKaGoEmosYPUfiDChppgIai0B0l02gga7uFbi7bjQryhCuX+5oOCZX5f1X7OslzsJLcI6y1JzA0IJ1gD1g6ZDytWliX7BbNjgbT85z2UgWWRlDFXXVHaGq7oRKXbGzOJqjBUmWVY8AwAH1zYp9ky06RJdxdnPJv3ejDJa+OsDc/iPAMB+Chhvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=48ux2oANNu4kIp3CQiXs6dQskNEele14DnkYwNyzRXY=;
 b=gCP2qtMksZMZ7+HhtsDJowB83f2H6Yqnji6X+izeH5zfIAbstCKP14FmT5AAAkb0zzS+pwdeAda8CfCabkBEbu8qivD4eU88+FU5r7wcR0luD76oP/FVE6KVljY0JDG+hwUi40y6/0oQ7zu5C8tX7JeTbeYk1svKDPzY3uVNTqmwclhXk7xFhehz0C+4rhNNuZFmmfntMm68EgbEEwHOTpLR0mohn4xQV77OW796QEZVr+AT6FPqr0zg66h8dqPWIzI3I8GhiTePxBDjYf3o/Vua1nyL+S8KNRQ5HH7debKb1bKne+GwQFtwa9duv1h0/g3pb5/CC4vcqIR3O5pfBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48ux2oANNu4kIp3CQiXs6dQskNEele14DnkYwNyzRXY=;
 b=LstNVihpBgWButUYHvF2cTu3rH4oRalB44JyqvBY5uDExdUm/e0ptO9Mk5uMXCTnhiUbaz20160H2Dosvht160amfky4eK68hUPM+F6dv7yn1AUOV0gmebOOHVXPGja7BqcQX0jNyvXXqz4pvkVGAEukfUeidR9GDW/4+XYdfw0=
Received: from SEZPR03MB7007.apcprd03.prod.outlook.com (2603:1096:101:ac::12)
 by TYZPR03MB7846.apcprd03.prod.outlook.com (2603:1096:400:45d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.6; Sat, 6 Jun 2026
 08:06:32 +0000
Received: from SEZPR03MB7007.apcprd03.prod.outlook.com
 ([fe80::9c76:eb8b:1cad:54]) by SEZPR03MB7007.apcprd03.prod.outlook.com
 ([fe80::9c76:eb8b:1cad:54%2]) with mapi id 15.21.0113.004; Sat, 6 Jun 2026
 08:06:31 +0000
From: =?utf-8?B?WmhlbmduYW4gQ2hlbiAo6ZmI5b6B5Y2XKQ==?=
	<Zhengnan.Chen@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?=
	<Yong.Wu@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"krzk@kernel.org" <krzk@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?Q29uZ2NvbmcgWWFvICjlp5rogarogaop?= <Congcong.Yao@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [RESEND,v2 1/2] dt-bindings: memory-controllers: mtk-smi: Add
 support for mt8189
Thread-Topic: [RESEND,v2 1/2] dt-bindings: memory-controllers: mtk-smi: Add
 support for mt8189
Thread-Index: AQHc1hRAjD3LboVwzkmNK55SMM8SprYdtUeAgBO1UwA=
Date: Sat, 6 Jun 2026 08:06:31 +0000
Message-ID: <4ea8bbd938866f7b81e9d644d00641b2a2f0304b.camel@mediatek.com>
References: <20260427070444.20247-1-zhengnan.chen@mediatek.com>
	 <20260427070444.20247-2-zhengnan.chen@mediatek.com>
	 <50e53fd9-4cca-4cac-9f8d-868de3a8a7bc@kernel.org>
In-Reply-To: <50e53fd9-4cca-4cac-9f8d-868de3a8a7bc@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7007:EE_|TYZPR03MB7846:EE_
x-ms-office365-filtering-correlation-id: bd32321f-16d7-473d-58dc-08dec3a28518
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|11063799006|4143699003|6133799003|18002099003|22082099003|56012099006;
x-microsoft-antispam-message-info: J8qfXJlzdjm6iS5ox2ceQy5mTasmeJ5hIDHi/dCa01xb6rihBNFtcnIcFvCi47LkyejHfcPnHcyIhgzzEYP7njeqW4CLoYCfPRaVegfhScX+vLshXBIjApQPwTJJvq1Z6huls4cfK3MbyNsb8978VNJK9Mskrz/T8ZcyAF32wqnMuHQfZ/X2wcJd1pVi4toJN51CZTllw88sN4CpmKG8aPI58jP4Pqcfln7TrShKADMfRJp+A9ti9g4hETpj7xOafhwF3H5mydebTS4a0cn3BzqnQhdS9lwmCK02hQ583g5cMk7843/0DgA6f7VAaAKEXFr2LLsQqGEKRXjyrW/fiXQ95EK+qv6L2cW9kGC504kG2CN6t0aDAYQFj98fBmrxgDkllEZWknKtbpn6cOpVE8nVPwEkuyc+8qFopx+EDRv0Xf7dnQXvIKQHgFhjIOC2rTVgFDvwZmlDPArJclkKkL8gEcjX3V7PljfIZYjpG8AMnsZegDKLMlPzPXIDzv1OWb6n95BwaSzoAvP9LsIk9LMEl1oAPsF6BOg45qguPh5J1nIiaXi1ZA/HdZGgdRH71eZ02BQftF4jtjnmpu2JsNh2YDKoJH2UYf+AJXJLdUvg7vTuCjjfTeMKHk6Xy6OmS680NZL7xSoScmMCTczSPb74Qhihhs/0UhBupQ3PUUdfiEEizTsJ02p8IC/Dl6rf/mcg28OYWd7Ag1OZV6CHgqOQQck1dn+VkwhBGzpZJngN10s8N4758kv8CTjvsEAt
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7007.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(11063799006)(4143699003)(6133799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b3NkWG1CZmhaRkcranNWOTZLY0pRUnRWNjNQb2JYNDBQNGI5OTljbjdRdXVQ?=
 =?utf-8?B?T0tzNUEveVNjRHZRMW9tY0xxQlBkMGM0a3pjaXgyZ0l2UHI1d3ZqKzRFYnRT?=
 =?utf-8?B?TXArWHh5RHJGV0MzaTEySiszNVJ2KysrUWVISUhkSUl5MVliNHY1NDB3SDgz?=
 =?utf-8?B?ckN1Sm9Xb0dZRVBicmI2eURtSmI3VmlZL1AzUmdGaExtOU5Sak9WSDlGazlK?=
 =?utf-8?B?R1JkYW5DRTZzVVZKTjJFdmcvazlNMEdIa0oxRlpOWXZRRG85RXdnUk9XOFgx?=
 =?utf-8?B?SjUyTXNQY2NQbGthcnFLZWJPRlQrenNzZzRKUGxRY1laODdXUHRCSUNNNkxG?=
 =?utf-8?B?TDB6NzdtS1d6U0NxYVZaWjlvdDZRZGhEcnNOY3cxWDhWa2ZJVXVHVy9PNTNU?=
 =?utf-8?B?NVU1Qk5QSlVRRFpJY0M2eEFGdzdDb0owTk5ZeVA3SXZlSUxwZmRBLzRKKzhp?=
 =?utf-8?B?ODI1enY3Vy9wSXB2R2F5MXNMaUd4bllkU1A1bENocDNjWm5pNlB0WFozNEVw?=
 =?utf-8?B?UUl0WU56VHpEa3FGbmt4UWIrbENqaHEwZlNRT0daR2p4bGZxUEFGVXZkRWxN?=
 =?utf-8?B?ekFLc3RDZmZia1E3dFVhSVp6SjdXdzJyWjlFK0JrYWRQSnZNTVpJMFVDYy8w?=
 =?utf-8?B?dHk2NXlUK2x4Nk16bUI4OE5nVEVkMEdIUFBTSVV2cHlBdHN3eVZkSm1lZHJW?=
 =?utf-8?B?TFZPaW1aRjc1eHphOG4wMjJIY1R4UEpyaml3QTNWa3dNMU5veWVmNk5DSEkv?=
 =?utf-8?B?YktFblJ2M2pjY3V2UHE3YUVIQWFCYU5BQmlxbDc1RHJtWHJhRzlDRnpXeWd3?=
 =?utf-8?B?aG9ucUZyTS9KbFREOHZST2pLb0Qva1JxRVBsZk9EZk5jWFhaYlNOdjRHd1BQ?=
 =?utf-8?B?ckxzaTdJQyt2d2pqMUNkOG9ZL0dOU1hnZ0lLek1jQ2RpVSs1M2Q5UWVGWm1X?=
 =?utf-8?B?UzNtcFRUTEVyWnZleUFtSHBHaUhQSkhrYUdUY3c4NU9xWXRSSTBqai9MeXE0?=
 =?utf-8?B?ZDJaNEJmL2RsZERjU2gybnVtWTROcGJSUmJSNmIzRnVJbTRRSktXUmVCV1Fw?=
 =?utf-8?B?ZWlIT21DRmJOMzdYRlVJTGo2MUN3am1RRTE2OU1YMlFFSGdNMnVodUVaa3Zi?=
 =?utf-8?B?YVhwK0FvQkttQ0MyVHpaSUNSdUJ2TWQxcGZPd3ljNFF1T2dzZk9tY0tWV0pM?=
 =?utf-8?B?VWtnQVY0UlRMekp2SzZVUXhGbWE2VU15bXVra1hjemlyZER2djlIRFBpeFlE?=
 =?utf-8?B?Q2JJNERTVUh6dnpYMnBlc2VVM2h4Q0puSUpwcmluRERBd3V1T1hCMGpBQko0?=
 =?utf-8?B?L3VFYTU4YnFjYnJkT1BQYytpMzJGMDVKYUdBVDRZVHg1M2FWZWRoU3Q4Rm5E?=
 =?utf-8?B?aTdiM0hLZGx6RTBJWmVJV3JMdGsrKytpV2hzOGdnU1B5bVFRNmRsQ283S1NH?=
 =?utf-8?B?OTMxVS9XTWQzejMwaWkvZHdMUnFzb2VQemdaby93RDNIZXZ4UFdyTE5HQ1VK?=
 =?utf-8?B?aERrTVRwSkZucWgxT0pEMlFJckc5KzJVZkZLcTlFRS9YTTJsKzV3TVBRMXB3?=
 =?utf-8?B?VFN5cnVray85bnlRQU1mSE84YjN3VCt1Z1YwT1dJS05JNHcwbUZwdjdSK1dU?=
 =?utf-8?B?S3ZVdVJ4WGRFS0pqN2NTenZZR1Uzdklab2pqcUZxaTdMUlNkM210NHJWbmc2?=
 =?utf-8?B?V2FoTnFBQ2Vud3BMcXBobEE3SjlRTjlEaTRuZERVRzJCUEx2SmZwOSs1V2hP?=
 =?utf-8?B?NmxxWkNFRk5sOStveTRwMGZMM2xTTnZJQzdtQWZDV2JSbGl4ZEU2cjdUMGlm?=
 =?utf-8?B?U0lhNFltK1B1bUE1TWFmS3ZoUnBQaVBwWjBhMjN6MVZYTTcyU2xPTUQ3UVVl?=
 =?utf-8?B?d0NkcVlpUkZoYWJVaXVsUkE3M24rOUpmZ2p3YktOQWUvRWNGQnBpOFZKd2th?=
 =?utf-8?B?NytvZCswaHhSaEc3Wm9MYi9sRlg1MkxXQTRDOG5wR1N3OWZMcXNUcnJWU3dn?=
 =?utf-8?B?WkIzYSt2cTlRTkk0OEx0MEJyR2dtejkybzlmMVZnSndpQlY4cjFHRFFhZUZZ?=
 =?utf-8?B?VTUyWURMTi80a2hZWUpsbVNIYkZnK0dhL2xOdXloWURiOFMwRzAyd3o4bU8x?=
 =?utf-8?B?QjVNNHpVeEdaYTZBTng2VHpBSExEa0toV2d3OUtrN2JzUlpVVm9MU0NJSDNq?=
 =?utf-8?B?dmY0Ris5eUN4cTRnQmpiMEhXeDFJaXdNdWtDMXp0R0taQmFMNGRqWlJWNGJk?=
 =?utf-8?B?UHlMTWN3Z3QvU1MrRUtDbG5Fa2ovUnV3cUdnQWtLZVFpbGsrVWFDTG5lUzVE?=
 =?utf-8?B?SlpNRTZXakJ5cmEvWU1RM1Nvc3hHQkNlcXpnTkd1YmRlN1NORnNsTzQ5L3p3?=
 =?utf-8?Q?pFugz+GXypMouiM4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F149B9C0D8BCA2488867D9F0A358DB7D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: iH/79zM1hDyVDcZBbPz4QOcykIsOxweGABdunvA4ErIKhD4aETDD+c5fPql2HjCbU8SjZUxjzEiI2HkjXwEhbyW7GAEzI8wzotJVaAjABrtDEIxzwn7TNloMufVBUl9WjOjh4yTFwv2oO/IrgMHWPG6XlFSoFOEBp6iOFabYhqASex7agIFYOHK6WXLkLIP3T3BfoJ48RFIjBjyUgaqCMi6l/N6bAIQhUrLHSVeTZf1YOhzZnWRoOYOerYDx4a9Y19gNoMe87hABMlIY11RRqd5mb4W3mj6sJZrkDcqSVstVyGE3seG9pdz3nMM++Xevl2EW0XuJ7ue4bi3IWbfsbw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7007.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd32321f-16d7-473d-58dc-08dec3a28518
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2026 08:06:31.7655
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eBVYffVRLqVsJ16oO/WHrIooFsMJ2t1szwx12wInmr+0T355Q2Yz9WYedV4smg6mZfi86nJJjEnOonsjw9CCth0e3xxVvf4iTsOSKCHTPjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7846
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_010646_010761_5316DE46 
X-CRM114-Status: GOOD (  17.67  )
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

T24gU3VuLCAyMDI2LTA1LTI0IGF0IDIxOjA4ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBPbiAyNy8wNC8yMDI2IDA5OjA0LCBtdGsyMDg5OCB3cm90ZToNCj4gPiBGcm9tOiBa
aGVuZ25hbiBDaGVuIDx6aGVuZ25hbi5jaGVuQG1lZGlhdGVrLmNvbT4NCj4gPiANCj4gPiBBZGQg
YmluZGluZyBkZXNjcmlwdGlvbiBmb3IgbXQ4MTg5Lg0KPiA+IA0KPiA+IFRoZSBjbG9ja3MgbnVt
YmVyIG9mIG10ODE4OSBzbWktc3ViIGNvbW1vbiBoYXMgYSBiaXQgZGlmZmVyZW5jZS4NCj4gPiBJ
dHMgY2xvY2sgY291bnQgaXMgMiwgd2hpbGUgbXQ4MTk1IGhhcyAzLiBUaGVyZWZvcmUsIHRoZSBt
aW5pbXVtDQo+ID4gbnVtYmVyIG9mIGNsb2NrcyBpcyBjaGFuZ2VkIHRvIDIsIHdpdGggdGhlIHRo
aXJkIG9uZSBiZWluZw0KPiA+IG9wdGlvbmFsLg0KPiANCj4gVGhlbiB3aHkgZG9lcyB0aGUgYmlu
ZGluZyBzYXkgdGhhdCBtdDgxOTUgaGFzIHR3byBjbG9ja3M/IFlvdSBhbHJlYWR5DQo+IHJlY2Vp
dmVkIGV4YWN0bHkgdGhpcyBxdWVzdGlvbi4NCj4gDQpUaGUgTVQ4MTk1IFNNSV9zdWJfY29tbW9u
IGhhcyBhbHdheXMgYmVlbiBkZXNpZ25lZCB3aXRoIHRocmVlIGNsb2Nrcy4gDQpXZSBoYXZlIHJl
dmlld2VkIHRoZSBIVyBkZXNpZ24gb2YgdGhlIE1UODE4OSBTTUlfc3ViX2NvbW1vbiBhbmQNCmNv
bmZpcm1lZCB0aGF0IHRoZSBNVDgxODkgc2hvdWxkIGFsc28gZm9sbG93IHRoZSBNVDgxOTUncyBz
ZXR0aW5ncyBhbmQNCm1haW50YWluIGEgdGhyZWUtY2xvY2sgRFRTIGNvbmZpZ3VyYXRpb24uIA0K
V2Ugd2lsbCBzZW5kIG91dCB0aGUgbmV4dCB2ZXJzaW9uIGFzIHNvb24gYXMgcG9zc2libGUuDQo+
ID4gDQo+ID4gQWJvdXQgd2hhdCBzbWktc3ViLWNvbW1vbiBpcywgcGxlYXNlIGNoZWNrIHRoZSBi
ZWxvdyBkaWFncmFtLA0KPiA+IHdlIGFkZCBpdCBpbiBtZWRpYXRlayxzbWktY29tbW9uLnlhbWwg
ZmlsZS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBaaGVuZ25hbiBDaGVuIDx6aGVuZ25hbi5j
aGVuQG1lZGlhdGVrLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwg
UmVnbm8gPA0KPiA+IGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4g
DQo+IA0KPiBObyBuZWVkIHRvIHJlc2VuZCB0aGlzLiBZb3UgcmVjZWl2ZWQgY29tbWVudHMgYXQg
djIgYW5kIHlvdSBzaG91bGQNCj4gaGF2ZQ0KPiBpbXBsZW1lbnRlZCB0aGVtLg0KPiANCk9LLCB3
ZSB3aWxsIHJlbW92ZSB0aGlzIGluIG5leHQgdmVyc2lvbi4NCj4gQmVzdCByZWdhcmRzLA0KPiBL
cnp5c3p0b2YNCg==

