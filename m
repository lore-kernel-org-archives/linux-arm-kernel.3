Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8000BE77183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 10:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mQGiAPhzxIkSfV8vi21upoj8AkMWRMJPaLOYlCpk9no=; b=oItYdlsEVG5wrZ/VsdoGmqMh6r
	48M6frP1xkrTHq1QdMbIe3E4Stc6aGm2+jhUzC1910Y+OJouNisWNAuymK3BJbHqpN/TLXBlI/KOD
	6b+TnIFV0tgvStEE4DbyNQj/aMPJB37DpUKYaxNkaFMtTSpv2fEYDU3dRKpTz3Yc+6SrhX+9/vSmH
	8uI18ZJy2QvVl+zPLJ6cPgdaayGi6a10k5kf7c/GbSUbDmV9lAiUbCZ1k+DoWgYZZlmkXstc5V6AC
	z06BWpa1UaP2axyILYhEU7H6ObK0rjwxrkEzFUzGcv670jqHiUMh8zyrBGESto6BETCkaqCvaogHq
	u2AS1uqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN82u-00000009e9h-45k3;
	Mon, 16 Dec 2024 10:09:49 +0000
Received: from [216.200.240.184] (helo=mailgw01.mediatek.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6v1-00000009TE2-2DEJ;
	Mon, 16 Dec 2024 08:57:38 +0000
X-UUID: c8f5a37ebb8b11ef82ff63e91e7eb18c-20241216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=mQGiAPhzxIkSfV8vi21upoj8AkMWRMJPaLOYlCpk9no=;
	b=nvCtlSy9uONNEMpPqWakD6qqFH4IDsXu354DQFIeI2j9DvmRXasOXtpgenE6XZM0XUsWTQoCPDK6eoRFLJ8pkAvRGaqz+rxXbQBrZAzUL3EqYTPL/3SxlFkAQ/IvvJLcn0ArhdkEO1rZ4k7W1snOVVCoUo6In7zA/JHhTNnH2RY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:6e73aec4-615d-49c5-8e2c-2ff639abca7c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:cf369728-d2eb-4de2-b5c9-495d1bc17256,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c8f5a37ebb8b11ef82ff63e91e7eb18c-20241216
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 113282575; Mon, 16 Dec 2024 01:57:31 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 16 Dec 2024 16:57:27 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 16 Dec 2024 16:57:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LFd2nPDuuCsC0EK4AXxyLki3tEMLomTGB+zv2hg2DvLLeSEAFLYkDWmA1EWsEHQhtYqZIYETm8qjWFhSh4ESB0DfUiv27wF3Eq6c2IjnT2VryFAmjLFInhgGN6OS2e/z0PFsqrnDFR4gJ3LFrmUaGv6XtfT34Jww73z0lFnxiPwMoRnSYkqfuTXOcMZlG9dTiFtysbIEDaj4cctYhbUeRsrM/wuNrH7iaZgHRbxziQn2gZ4ljxAETtaF6cbKgfQlFwCcxnB1Iw9NIXnMdiqJihGAQGS31j4vpkdsM/Cgbz5pxPcEft3uzJyEYSBgk+n7TRikTNOycKBSWG9cf/keLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQGiAPhzxIkSfV8vi21upoj8AkMWRMJPaLOYlCpk9no=;
 b=CkXM56SUXF7ORRyJeg1XVfG8hPp+B+B/oUCtiJakyEjhn8R3omIZ2Anej65IX5tsm3QZRvO9yoZ0TTLEhj3NproFIs8Ri2Nvi6BWf9eLPvdCbCkbfBVgNSgINMS5PrjJ+nVrAI+lg2l4LnhPWKUU34xRu8fdYUxYIewiHUOHk5eSfygL15IjC+aC5CrxCg2Nb9OiN5A6l3Cj9KGbFCZ5tRLK0V6ozLMe4CyviyhmGMGX0IEvv5k9XB18NcQw6EO8119E5EEO34ipGc5QyB3ooLMg4ggovoA9E1WqnW8cxCHjDUoSqryQDGGrNI1YjtBzuvcZ6waRzHDAdSLDjZp2Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQGiAPhzxIkSfV8vi21upoj8AkMWRMJPaLOYlCpk9no=;
 b=oHSYvdvZSY4a5B5jJXnAXJROsP5L/AKOTTnrGomnRpQZh/mWBBrHH20VYfwbHP6BTTcPAdBUgI0/pHdpabHd2fYl6of7Xb9PtksxuHMnebc+9QcpYXAquSkgSP2nsG1I7jY1uCpNR/xBoASzc8cFLmV1AwFs8bPkjOjsKgARbVw=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB8002.apcprd03.prod.outlook.com (2603:1096:820:fc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Mon, 16 Dec
 2024 08:57:25 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 08:57:25 +0000
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
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "junzhi.zhao@mediatek.com"
	<junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v2 15/15] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
Thread-Topic: [PATCH v2 15/15] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
Thread-Index: AQHbRwuJJIpw1RNG4k2Br44bBPRYWbLoovUA
Date: Mon, 16 Dec 2024 08:57:24 +0000
Message-ID: <803bc2bd802506635dfa9ea9b26a6ca40a7f4912.camel@mediatek.com>
References: <20241205114518.53527-1-angelogioacchino.delregno@collabora.com>
	 <20241205114518.53527-16-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241205114518.53527-16-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB8002:EE_
x-ms-office365-filtering-correlation-id: 1e90b187-3989-4fc7-77c6-08dd1dafa912
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UUhPN3lNMWUzOVZjTjBOQWVORGpIdTRGOXlnVG1RczFPcFIzRTVla2tJTm9r?=
 =?utf-8?B?dWdzZFNRTTZUUDZZNFRPeUd1b3Z2NGJkYVFNeVlTMEFaN3RkWDZ5d2dVVkR6?=
 =?utf-8?B?QVVMdkxTazl6QlRYTDlaUEc0NXVOUzhrZUlBR0F5YkcxZGRFZVR4emhSNWox?=
 =?utf-8?B?NDdLYTNSbjB2QUt2cThST2ZUK1Y0UUlqRHc3YUZ1cVIzT2ZuU1RHVTNWTHU1?=
 =?utf-8?B?VWpkVVhaZGRqQm8yUUNGSm1KT0habVRVTUNCZ2dsTjVPN2xGSHdkalB5b09E?=
 =?utf-8?B?NVpqWHlEMGs0aEhTSStyQ1U1MUs5RTBuZlBtaDJiNXVhNHVXWHc1TTdZeEVZ?=
 =?utf-8?B?cVJHbi9wSURFTloxditnM3ZnejhJbWxzZXdrRnE0SzcxYkd6cUo1cTl2MDZy?=
 =?utf-8?B?ck1NOXpzclFJWEN5VUdYa0h4MmpzaFY0QzBZOTlkOS9NaDlLVE1VQ1FtS1Jl?=
 =?utf-8?B?K1hjL0kwRjJWdm54RTVlYmYzem1EQWY5N0Z3Y3R0TDFqUm0vZVFmWFZuQUNl?=
 =?utf-8?B?Wk53ZnRJQmJZQUw5cWI3am9VNFRuVUVpblpvN3hFalpaQW9xQ3pvWkFJSWpZ?=
 =?utf-8?B?YmYya29oWmIrZ29GcnVIQ2p4cDhRZ0kwK3dyaFdBd0lOR04xeVh2M3pxZnJJ?=
 =?utf-8?B?bWluT3V3d0RHSmVwdFNkYUYybmczbVQ3Sk1OemFKYmJ1OEFvNFBGSFZUUkw4?=
 =?utf-8?B?dGFjSXQreUNxYnpLMU8zSjlaeFlEQ3lVUjB6c1EzU1NIZmN3S3JaRFpuejF2?=
 =?utf-8?B?K01DYytodVQ0T2ZPajlxZ09DWjNiZDRRZzJaNS9pQWRmVktYTk9zUS92Vko4?=
 =?utf-8?B?eTJCaVFxZXo0aTJmelJaZkNTSFBHWk1FQ3Mrenl5andPcjNodmVUOGFsNnpx?=
 =?utf-8?B?Sk9kZTduektKWFdzeTNFMnFsSGM1YmI5YTU0UnNFVHM4OUZ0OTVsRlhrOEFU?=
 =?utf-8?B?TWJvaTBPdXZzREo3QXZnQTRuLzFsTWY5VVNOZ2oxbjVodDhVcDlSTGRLSkNI?=
 =?utf-8?B?LzdNWU80MElQYTQ3RlJsUVVhRzV1VzN6ZHpkT2xJS2U5MEJqUzQ3eDRrcllw?=
 =?utf-8?B?dmNwSGhrMWVKc2wxZ2tOT1Mwa3czYWlOdUdKOUkwMEwwWmNkV0RSdE45RDRC?=
 =?utf-8?B?V3M2eVRzaG5GSTJIdUVqWW4zQVQ1NWxKa0hlUm14eGZ3eXBqdDNUSUM0MWU1?=
 =?utf-8?B?bGlrK25EWGtHK3ZBSnVEbi9zcGtMemdSNzV1a3N6dlJOMWNINVhuVEhNZ3dU?=
 =?utf-8?B?aGVsWHpvUFBqbVlBbUhZQ1A4T2F5ZkZPdjVubFROcWc0a0QvRHhnZnE2c0VB?=
 =?utf-8?B?MFdBSlhBQlFSRmFWOEtrMHMzaERSa0MrN0NWL3ROaWw3SXNiWC8rcHpjOWhP?=
 =?utf-8?B?WndUVnRKdVZyeEk5ME16U3FlZXdvSGhhcU4zRnhPeGtUQnRBUW1VWW5KODVJ?=
 =?utf-8?B?TCtuSTRjY3U3WUE1anZCZDBRZE4xQ3l0YUZyWTFpWUUzRUZsdmNZREwxbGpx?=
 =?utf-8?B?SEtPUFhLeXJMelArclkxaDhaQTVqZm5FbEJvR0VtaXZ5b1R5dHNLeEFIZkVp?=
 =?utf-8?B?a0UrdUtXTjZuR3FLVTB6cDh4amI3OE1XS1NpclBuZXhMY1IrcnMvS09oUHh2?=
 =?utf-8?B?MXNPMFk4STR5enc0U1ltc1NyZnNzTzMybkEzY1lMRVlkZ0ZickZwSVBvc09a?=
 =?utf-8?B?TnkxNGZzcC9TWHp0VUVoWkVwNWJYaWUwQ3lPYURWSlpicVdKZ2pocXVOYnVu?=
 =?utf-8?B?L3dMUmM1azBVQS81K1ZLaGlLOGdrc3gzblUyN1RyVmtXYld4TWV4ZkJhVDEx?=
 =?utf-8?B?S1lZYnVKNGJQUm5OUFM1cDdYM2FKMUlLd1MvdzJ6dGJlcEpaV1JMaGhsanU5?=
 =?utf-8?B?eVFLR1IwUUhSOEp2YUwrTUZCKzJNR2FrcThtTGREQzBWVlRRbEVralY1bGVx?=
 =?utf-8?Q?zSk5e/obuPpjCKS+cPm6ewC8MMNJM6l6?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rm14OUxJUm15bFRPMm5nSlhQVGd3Zy9BdTJpYUJnSUhmeDFuM2VpWjFVQWxo?=
 =?utf-8?B?SitFcE9kb04zbXpWZ1BlOEk2V1JwSkVhb0QzV1FnZ1BEYVlwZElmRmg5Z3lh?=
 =?utf-8?B?Skg1TlpQWS9JWUh6ZXZKMk5RZ1Y5WjJ5aWVZQWNxQ2lLK2FRaUw3NkxQSU8r?=
 =?utf-8?B?L01YaWs0emFxOEpaVVNwdDY5cXA0eGtGN1Z5R1k5ZHRIMDlvYnBZWUxBdGRl?=
 =?utf-8?B?VXpjdEduRkp6c2daWlRpc3YvQlV1UXpqKy9OdldvMGprVkhqVTlCSStHREcz?=
 =?utf-8?B?a25MOUVrTCtUa2tQb2pMN2FRN2FsZTRnY2JRTUlxTnFaYlRIWVF4dnZJZ0VM?=
 =?utf-8?B?RGlpbmVCbTJjTGptaGtodXkwNTBlNzIxbmxvQWtDUVRnc3JPbnhEQ2E2ZlpI?=
 =?utf-8?B?QUlxdWtrNHhKYTNKMEdqMHlsMlIvbmtrZk5qZGNuT1gzZ1JxVllyNWNWWGRr?=
 =?utf-8?B?MlI0S1g0MXFXdzBUMkhTS0pjOUN5QUwybjZ5amtOcWJpcU1FQndwdThSSWp6?=
 =?utf-8?B?eGRnU3B1Y1hBck9TSCtMTVVoYXNBbEpxZ0VmdUtPVVhTdDRmYlZnaWp2eHdI?=
 =?utf-8?B?VmtweElZTHlOSjcvR3FNKzlGMlpqQzd6MHB0YmJHM1doTVVIejREVkRyaDlY?=
 =?utf-8?B?M0RJU3hZYlpMNjNRVTR3QXB1K1E4MVlFUFVpdHRKTmpwaC9VbmRMa3pOV2RE?=
 =?utf-8?B?V29lZklnayt0T2I4L09VYThPdEpLNUx2NTFuWkduMDExTStiaDc2c0JVcDE1?=
 =?utf-8?B?OHFMTy9nSFE4U25RT3JWbkpZUUFNTm0vOHZ2c25oWk5wR25PWWxpbEozQ0V2?=
 =?utf-8?B?Mnk5djZTMzB2UXlsOTZDVkxGWktPbWV3WDNTdVhPK0cza0IraC9LY1ZibHkr?=
 =?utf-8?B?bTczRnlKS3RiSm1TdGs0endvYUhUZ0E5QjBZYTY1a3FXVUlSVGhRWC9KeUFQ?=
 =?utf-8?B?bW96NmNpK2UrRXhSdW5nM0JISWk0Z1h6U0kwejZrdEd5Z2FjUnJDaGtxWVpN?=
 =?utf-8?B?NlZsdXN3SzhvUmlLekV4bzNxN2p3N09xUWVZMU9Fd016UUtNTUFvWXZsbmJx?=
 =?utf-8?B?U0FkMEFPL2JEc3RFWXM3RVA1NmhwekZMNllEZ0JReDFWNDhSWnZ0NW1JUzlF?=
 =?utf-8?B?dys5ZWtPSSsxand1T2QyK2oyaWFLbHZOblMvNXFKdnM5MnhjbERFdzREZVpl?=
 =?utf-8?B?bWNqK1FNQ0t3VUE5ZStTVlBKQncxNDFndHZyakJrZmpqZW4zK1BTeW94cFdE?=
 =?utf-8?B?RDU3REZoSlg3Q09oUUlsRUZ3ZnRER0oxTWRpaWdSTjV1RHd2VFJxYUwyamhO?=
 =?utf-8?B?eEpRcDRmNDdLTmFWUkw3ZkVXMG5KSGV4Ty9DOW85VUg0a1hnMUNDUXp6elRj?=
 =?utf-8?B?ajVVNytwdndnOUphVlZMK0I4Mmx2bUtFY3NpYThOeTY0MWhTRE5kNjBORmdV?=
 =?utf-8?B?K2txRk9ISmlZM1BsTXVVTks0cHRxZ21RZUE3WUllaWNnSklOb2FNY1NtWkdC?=
 =?utf-8?B?VXoxNmhQamo0UGl0TGNGK3hrVzRIelhydkthZHVrZXRXSFlUam1HakxKSkhY?=
 =?utf-8?B?cXhEckRyMTgxNGpZVzZ4RnZ0M0YxdGE3bHVEekdQVTdCU0t4RjJ5OGpIQ2Jo?=
 =?utf-8?B?Zy9GMHBFSUwxN3IyRmhoaGRTOWRZaHZ6V2dsMjBJenNNRjkxUElmbXcxOFRq?=
 =?utf-8?B?ZVVVY1hNYUtHYnA4c3AwTXFrU1ZVMG9IOE84bmU3Z2dJektISFdqay9XZlg5?=
 =?utf-8?B?Ky9iZDB4UlVoOGJWcnhCUHc5TG50dWt3L3BPTnhFZUpWUURSVUZkMU1GK255?=
 =?utf-8?B?akVqT1BpeG9tZ0k1dUx0T3owdnY2MGwyRW40SHoxYTZHWlIvZ040YXdOQzZW?=
 =?utf-8?B?WEZ0Vm1SSTVEV21rL2lCZ1FOT2dEQ2p6TUttVW93SGNXZ1JxNE9yTXJ1bzNo?=
 =?utf-8?B?SDBrYkw5OEhYVkdQL1g0WjBEeUNhc3pKZTRHTFhWNUlGUHJWZXUrT0dxTlM4?=
 =?utf-8?B?NWpDbkxYaDBnZ09QTTFpWlhGOGR6VlVmMnl3TmwrdktMamxkckRwRHp5eERl?=
 =?utf-8?B?THRqNVhKZXRzUTZkc1JLVlBhaFFkQTZLbjlhUnNSYjhPTVUxT2FPaEFYZzhH?=
 =?utf-8?Q?A35NdRNgJGuhxksisQbY4AOOv?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <510E9EEB9140334EA0297996C781844C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e90b187-3989-4fc7-77c6-08dd1dafa912
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2024 08:57:24.9029
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4LaFTe6p4f5fmu6aVoxwbh6iyrNdooe3EmcB6WLcqWjEPvCjEPSuFDRYB04+1rbhgWHyg9Ul0XeUxVxccEp5ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8002
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--14.429700-8.000000
X-TMASE-MatchedRID: L8tZF6zWW2oNtKv7cnNXnSa1MaKuob8PCJpCCsn6HCHBnyal/eRn3gzR
	CsGHURLuwpcJm2NYlPAF6GY0Fb6yCsME2BsoiKJMBfVY7O+c8KYiActr2yXJYt9zZd3pUn7KEAi
	HpwMlPnM2GwJiqvFBX9qspQ7EuDzT0//3OV6Cj+ZH+PTjR9EWkiEdaywSZvzO+Cckfm+bb6AcaY
	+iIPlpkgHXJ8eVIgKFtauPEYeMK/XlTJ+0UBH8J8NrWpY804TGHIOuQjCOKFubKItl61J/yfmS+
	aPr0Ve8oTCA5Efyn8CNo+PRbWqfRDsAVzN+Ov/soGeXtNQGUsC6DyZ3EP2GqBXu5FXE+Jr2jfJr
	4w1JeTtlimhMkZiEiQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--14.429700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 714F8FBF4A77F6EA6538D2DDD01A6C4A9EF1892604174C03B21A9B84556275282000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_005735_590129_AF022126 
X-CRM114-Status: GOOD (  16.17  )
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

SGksIEFuZ2VsbzoNCg0KT24gVGh1LCAyMDI0LTEyLTA1IGF0IDEyOjQ1ICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBBZGQgc3VwcG9ydCBmb3Ig
dGhlIG5ld2VyIEhETUktVFggKEVuY29kZXIpIHYyIGFuZCBEREMgdjIgSVBzDQo+IGZvdW5kIGlu
IE1lZGlhVGVrJ3MgTVQ4MTk1LCBNVDgxODggU29DIGFuZCB0aGVpciB2YXJpYW50cywgYW5kDQo+
IGluY2x1ZGluZyBzdXBwb3J0IGZvciBkaXNwbGF5IG1vZGVzIHVwIHRvIDRrNjAgYW5kIGZvciBI
RE1JDQo+IEF1ZGlvLCBhcyBwZXIgdGhlIEhETUkgMi4wIHNwZWMuDQo+IA0KPiBIRENQIGFuZCBD
RUMgZnVuY3Rpb25hbGl0aWVzIGFyZSBhbHNvIHN1cHBvcnRlZCBieSB0aGlzIGhhcmR3YXJlLA0K
PiBidXQgYXJlIG5vdCBpbmNsdWRlZCBpbiB0aGlzIGNvbW1pdCBhbmQgdGhhdCBhbHNvIHBvc2Vz
IGEgc2xpZ2h0DQo+IGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgVjIgYW5kIFYxIGNvbnRyb2xsZXJz
IGluIGhvdyB0aGV5IGhhbmRsZQ0KPiBIb3RwbHVnIERldGVjdGlvbiAoSFBEKS4NCj4gDQo+IFdo
aWxlIHRoZSB2MSBjb250cm9sbGVyIHdhcyB1c2luZyB0aGUgQ0VDIGNvbnRyb2xsZXIgdG8gY2hl
Y2sNCj4gSERNSSBjYWJsZSBjb25uZWN0aW9uIGFuZCBkaXNjb25uZWN0aW9uLCBpbiB0aGlzIGRy
aXZlciB0aGUgdjINCj4gb25lIGRvZXMgbm90Lg0KPiANCj4gVGhpcyBpcyBkdWUgdG8gdGhlIGZh
Y3QgdGhhdCBvbiBwYXJ0cyB3aXRoIHYyIGRlc2lnbnMsIGxpa2UgdGhlDQo+IE1UODE5NSBTb0Ms
IHRoZXJlIGlzIG9uZSBDRUMgY29udHJvbGxlciBzaGFyZWQgYmV0d2VlbiB0aGUgSERNSQ0KPiBU
cmFuc21pdHRlciAoSERNSS1UWCkgYW5kIFJlY2VpdmVyIChIRE1JLVJYKTogYmVmb3JlIGV2ZW50
dWFsbHkNCj4gYWRkaW5nIHN1cHBvcnQgdG8gdXNlIHRoZSBDRUMgSFcgdG8gd2FrZSB1cCB0aGUg
SERNSSBjb250cm9sbGVycw0KPiBpdCBpcyBuZWNlc3NhcnkgdG8gaGF2ZSBzdXBwb3J0IGZvciBv
bmUgVFgsIG9uZSBSWCAqYW5kKiBmb3IgYm90aA0KPiBhdCB0aGUgc2FtZSB0aW1lLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hp
bm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0KDQo+ICtzdGF0aWMg
aW50IG10a19oZG1pX3YyX2JyaWRnZV9hdG9taWNfY2hlY2soc3RydWN0IGRybV9icmlkZ2UgKmJy
aWRnZSwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCBkcm1fYnJpZGdlX3N0YXRlICpicmlkZ2Vfc3RhdGUsDQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNfc3RhdGUs
DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJt
X2Nvbm5lY3Rvcl9zdGF0ZSAqY29ubl9zdGF0ZSkNCj4gK3sNCg0KSSB3b3VsZCBsaWtlIHYxIGFu
ZCB2MiBoYXMgdGhlIHNhbWUgYmVoYXZpb3IuDQpXaHkgdjIgaGFzIGF0b21pYyBjaGVjayBidXQg
djEgaGFzIG5vPw0KSWYgdGhpcyBpcyBiZXR0ZXIgdG8gaGF2ZSwgYWRkIGF0b21pYyBjaGVjayB0
byB2MSwgYW5kIHRoaXMgZnVuY3Rpb24gd291bGQgYmUgY29tbW9uIGZ1bmN0aW9uLg0KDQpSZWdh
cmRzLA0KQ0sNCg0KPiArICAgICAgIHJldHVybiBkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3Jf
aGRtaV9jaGVjayhjb25uX3N0YXRlLT5jb25uZWN0b3IsDQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbm5fc3RhdGUtPnN0YXRlKTsNCj4g
K30NCj4gKw0KDQoNCg==

