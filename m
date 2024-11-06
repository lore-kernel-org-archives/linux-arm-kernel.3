Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFDCD3E788
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 03:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+XZeJQBs2xrFKbXlnar/DsFPzinXSUraVXt9U6/Ir4=; b=2uGrk+kyYxFbYpPFzB0HcHsvVO
	vy/n95tyF7JsqlNJAfkVFf2MuTz+ZaxtFLHOLlcoHQtUToZDVobVSxdsCRnqCipmX1F5pdbmxPCaI
	hbNM/HyacSSArQYvD1Ca1zcbtRXlHI9atLhWNdAKSqkMrcNattu4AClS4pgcHE55z9pjPK6CIobb4
	/safyn3/+BaoTk2GZsav8w0GZTQCnQcWSebptNxopRe8VT2pEgDEaz2pVhRyJk+tzhWclTsGZm7ox
	k6ZThl8mEc2bOoC3lW1v40fLVJu5EgrozQMWeD1VpvfFjZe2a4kQUxr0xuncMh5lyAgeEGyhqChIM
	09580whA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Wwu-00000001inB-2zyi;
	Wed, 06 Nov 2024 03:43:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8WvB-00000001iQZ-2aKJ;
	Wed, 06 Nov 2024 03:41:30 +0000
X-UUID: ff5b0e829bf011ef82ff63e91e7eb18c-20241105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=3+XZeJQBs2xrFKbXlnar/DsFPzinXSUraVXt9U6/Ir4=;
	b=pFhOOvUFUXX//2XtX7wSsmV0LC2rnN2oa6rq+Al28xsX/QLdC0tQBkz492tClAZy2HN/F8x6ztRgBS/pRT9cefo5jc2KHP69WlSz7l9UenJ4ooR7pQJRUPNbCOlX4BFTQseiRtnOAC+e11jyovjP547Thkw+8/hQfF0hn2csHUY=;
X-CID-CACHE: Type:Local,Time:202411052035-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:359644f5-c2d1-45fc-a7a2-93328b4c278a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:505f9e06-6ce0-4172-9755-bd2287e50583,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ff5b0e829bf011ef82ff63e91e7eb18c-20241105
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 495066195; Tue, 05 Nov 2024 20:41:25 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 5 Nov 2024 19:41:22 -0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 6 Nov 2024 11:41:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vd+odNK/cGNvrnU+PZ8GKWJ00UUwuGqwZp7mr0uFWR1eP1BlGoMdNLIrxCX9Q90Wh5N1fIalNyB2CckOE3GTxbcGYIRRVRo61HYFbFhFeIKrnoux2biXY13+UiqsmkvvT2+JY+JxiMU9p7IQEN74KWjTjd52dI8ZGxNRX8Y82xxRHJXqvBxZVgdrTs1Do+w19DiRzHaKaD8RLLXXizmPZ9iv5Z3Sd8Gl0wEbxMcuUoRK8Yex/PfaVMjwDy/tzXZTEy6iysCNWKNWa7WdoqmcHFzTvaJ5lQXLfHVnUoPiasaCxbxXVmwT/5/vw6uqLOAm1YgJ+4UL5SeckKpc6e1YJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+XZeJQBs2xrFKbXlnar/DsFPzinXSUraVXt9U6/Ir4=;
 b=ltw5xVe8XtnFIEIU28zLyCT08IdnZlfw0WzSsPYUzczztfbyZavZOfbJnlyvsfuxxLOI2YgEb2moANKPSKXz6XT7hkOWt/WZhppZ6yYfnr0ScbOhEvqqiR0GiQsZHOGyYeD+1f0Yr8W497MNaYZ4SAhDL480ewJiquVxYUQXwrNGYi/CC55cQzx16Xspg0k/jHcu3l7cmyIyn3iyIDOcyiYYdLSR+Wr1CzOFxB3m7zEWjEYKucyulWiDaW6lcsuFMKRP1fDQtaj3X+jtEjYbTLnGm8o1zUgJ3W9/OY/dFZacypT6/Wbsla/Oic3Mku8ibwuiwMypVFwPJYxFyPInsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+XZeJQBs2xrFKbXlnar/DsFPzinXSUraVXt9U6/Ir4=;
 b=Krm4WEvZkEdWY28otaM6CMr+vPNLbYh0Wfd+9yVbQ+Tz3jo8XEwb5anqj7iS5Btvqga2BvjoSZTpRAuWA0hgkqsrJ1Vda0LcqG6D12RV+om3lt3TpyuL9ZV9Qvp8C6WdQqV9qbZCAFdRmX5kRVmlRlYJ8rGnqgQBUyNFj1Xlk1o=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7903.apcprd03.prod.outlook.com (2603:1096:820:f3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Wed, 6 Nov
 2024 03:41:19 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8114.028; Wed, 6 Nov 2024
 03:41:19 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"christian.koenig@amd.com" <christian.koenig@amd.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?U2h1LWhzaWFuZyBZYW5nICjmpYroiJLnv5Qp?=
	<Shu-hsiang.Yang@mediatek.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"yunkec@chromium.org" <yunkec@chromium.org>, "linaro-mm-sig@lists.linaro.org"
	<linaro-mm-sig@lists.linaro.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, =?utf-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?=
	<Yaya.Chang@mediatek.com>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "hidenorik@chromium.org"
	<hidenorik@chromium.org>, =?utf-8?B?U2h1bi1ZaSBXYW5nICjnjovpoIblhIQp?=
	<Shun-Yi.Wang@mediatek.com>
Subject: Re: [PATCH v1 06/10] media: platform: mediatek: add isp_7x utility
Thread-Topic: [PATCH v1 06/10] media: platform: mediatek: add isp_7x utility
Thread-Index: AQHbGj2JaAd/ufwz/0W0Edv5eKs5YbKpxv4A
Date: Wed, 6 Nov 2024 03:41:19 +0000
Message-ID: <e53234811109852c31de2ccb6d94aa565e20dd7a.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-7-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-7-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7903:EE_
x-ms-office365-filtering-correlation-id: 5898ceb4-62ab-4820-8a44-08dcfe14e03f
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SW5ZbDFEeUxtWHU5Qmg0MVVCQ3JyV2ViQmZiN2FCSERWOFVxRGxoZWo3UmFV?=
 =?utf-8?B?QkFQMXEydGRjblMvZmVtUjhpZWU1d0xzWkhtYXgvUXlNdzhEMTVBM0FjVVUz?=
 =?utf-8?B?WmhNT0ZJWWxON3A0MDV4blB1T1Q0MHZJeE5mZGp0allSMmpsSVN5NWNUUWtL?=
 =?utf-8?B?MEJkd0gyM093SmdubVJlWDEvLzN0dUcvbzRYVTV1R0RNTXFIMjRkbWl5WGdE?=
 =?utf-8?B?WWJrSHFNZWZtd3BPNE41L0FiSWNTUGRwVmxUbThJOUM3dUN1L3BERVpVRG9p?=
 =?utf-8?B?UHZhUjdoNjBBV3ZNVXdWd1ZHWVpNZm1GVHdGNTgwUVEvZkl3VzgzcDdqTkE1?=
 =?utf-8?B?Ymx6TWFmUU5jTlNzeGZHcGw4dW1tU3IzdTM1SzJOV0FmcUhXejhOV1poZmpz?=
 =?utf-8?B?c0E1U2RLWWNNY3VNVzNpV1ROUU1USU9INXdQV0ZpYVJUbDRJMzNNUkJOcEg2?=
 =?utf-8?B?MVE1c1E2N1lMZTdQU1phU3QvRG1kVzg2eUxtbHoxbkQvdEh5VVE5ZWsxU3Jh?=
 =?utf-8?B?RUJBK2dxdkpYeXpBa1QwNStYVEp1TjdCOFk1MUFjRFp3OVFtMmxGTSt2Tlc0?=
 =?utf-8?B?NUpKcCtEQjZNSUM1V1I4am81bk5TdEhTcFRWMVorRmN6eUZXWWxWRzk3YVdw?=
 =?utf-8?B?YnFUcmNWWGd0UlNnQjlmKzNWbGY0eVRhRmg4aGtmc3p2TmtPWXowOFJCMVZK?=
 =?utf-8?B?U0pRMTZobHVCcTk0d0x4VjYzdFk3ZEJQUWFyb3g3M0FaaGVCdVVWVnAyTFhz?=
 =?utf-8?B?eFoyd0dJaW5ReVU2cHBCTFdmSjlIaVM2cXJKdW1tQkNhVExkdlJJaGtBeHF3?=
 =?utf-8?B?MTB3QWs2bXRBendmU0pDMWxYbWpYMXNCZitidjlrV0dleFB3cUorWTkxWTBz?=
 =?utf-8?B?K1FIR3NSR1EzbURHaHFBOXNnT09RZ1hxVzVVSnlubFpFVGdPblpGWVdwS3dX?=
 =?utf-8?B?UVYxRjI5Y0paTHZhQ29uUjJQSERvUm9iV3JrcmJhMSt4cHZTSDNGQ3AvRXhO?=
 =?utf-8?B?TVJjakFDVWcvVDFoaXNNcE44UDdIcDF2ZmdGTEFIcGpGQnZScjdJSWZEOVFC?=
 =?utf-8?B?eUM3c2xKWmMvR1I1ZnhJWVpLZExBWXBqaXlLVGlYd3Y4dnNSWXJiZ25iTS9T?=
 =?utf-8?B?c2F3ZUJzUXgrYXRVTTNrNXVtYlAvZFBnWVBPb3JkZVg4UjNGSWVIZjE4Ry9H?=
 =?utf-8?B?TjJIL2dSSHEzTXRiK3lJZlZYWUgzQ3dVV2V1c3pBRXZSK1Yrd1gwNGtNaXJL?=
 =?utf-8?B?T04yKysxQ016ajg5R0g3ZnpVbk5FZmNlcTVkOVM2TkF0b2FRUWJEQU9qN1hD?=
 =?utf-8?B?QTBYY0dRa0l4QnNra3YxRVA0TWhoYzY1emtnb3hOT0hPb0ZIU1YvRXFIVEhE?=
 =?utf-8?B?aU1LWlBZV0VzcENxWlg5b25GL3FQWm1ST2RycG1BN2FtOTk3MzZZYjJoNHFY?=
 =?utf-8?B?TEdOMkJnRGJHS1Raa0JIeHdQT1dWVEV6NTRJc29QRHR3UjBhcHZlS3RXNVNx?=
 =?utf-8?B?NHFzMnNUY0h1c0RpZFFuelJXTHlBOG16S3FmMDdLUzdQTUhWMzZPaUJ1d0t6?=
 =?utf-8?B?cDNod3Q3SXZsWXovclQ3ZGRINlZsN2djcHhXaFJMTGxKc2hadDhlNHZLUmRx?=
 =?utf-8?B?SEJJRi9HUkZBTnFKcm1mVHNaWlBDSHJBY1Qya0haYkxMSWw5NmlXZWFzbnIz?=
 =?utf-8?B?TVg4d1VaL3lWK0l2eFRPUnpET2d1VTFSSmExYUYzNGpnUGNYMEVSZHBLZkxI?=
 =?utf-8?B?R3FUanpidWQzR3lJZFNGTUtNaGtUMGk3K3NGMjNXZzFaWWFCM0oybkY1eW1T?=
 =?utf-8?Q?jjwGWKeyYbUqHiE3Kuvd51TY2gly+e9DTye7E=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VG5nRDN6N0RYWWNLNk1mU1hSQk1NVk0yMGtKNG94cGxLOHc2dG5tdEgrM3JF?=
 =?utf-8?B?ODBmSytTdlhmeDRWZlZCOU5ya29na1BqOUhaT2FGeVBHRzBvYms4WU02OEZi?=
 =?utf-8?B?T0MwMURKSzdOdG9kYzdnWVFqVEZPbXRNSm4vVUFOeEo5b3owWE82eXowS2FZ?=
 =?utf-8?B?WjIxbXVPS0NMeG5sbHQ0SkdDcSsvMFhVa015ank4ODlyZWx6enJGNENSNUtk?=
 =?utf-8?B?V1dLMkJsT2U3cDZKMG85UmRJV081LzRFbUd4OE9yK0d0aU1KbzNVeW5JOEhH?=
 =?utf-8?B?Mml0RmhyZlJXY3JQaTFqTm9KcTlka1F4blRuVEZlNjM4TTh0Uk4xYWdQQUd1?=
 =?utf-8?B?LzE4aWkrOXZJeVBFS3ZmUCs5bFRELzJZZUZoSFNPWVlFMTRtQ3RXdjg3VkRw?=
 =?utf-8?B?L21DbnJZN1UxOVJwckpKNXp4U0J1SWZ4SWJNUVRNaDQ1a2poeFNqcWxycEo4?=
 =?utf-8?B?ckE5V3FybTZiL2JGb2RjUjUyVE5ER1lvbHZmZXU5WlhOWVlBRmt4MzZpc3lI?=
 =?utf-8?B?a05YanNDUURsQVdMaHB4KzlQdjB2bnVrWXd5dU1keUZMbEFKTk1WVngrMDdy?=
 =?utf-8?B?QmFGdXlIc0tXR3l5VjF2YUVvbDB0TDd5S1kyZUFZZFhYbFlndmlnYVVDNkc5?=
 =?utf-8?B?WDJyaEZxNVVFTkw1Mk51dnpvc3pOTlB3WUtSdUY5TlA0Nm9OYTJ4aDJ1cllC?=
 =?utf-8?B?NU9NNjFWMzRmcXlqeFJUcjlZaEZ3UU5xZE9CZElTZUhGQ3Fwanc0MTFqNGR5?=
 =?utf-8?B?TUllejJaYUsrMTJ4WXBiUWY2dnNmaWV6Sjc3VzdFMGtsdndYRlZ4bGoxVUFy?=
 =?utf-8?B?bHRQa1RNbXU3Qm1rY3p4c2E5UzFHbE1QR0k5a0Y4bmlCMEtpMENvM3hQRnR1?=
 =?utf-8?B?ZXV4UzlKVHhaaFpKZVZHUndMdjRYUXZlQkNtVlpSaDBWR1pJb2xIeWFaT1Ar?=
 =?utf-8?B?REJqQkdNaU12NlRKUTdlVktzK3kxOHk2VHlZWjlEN01UVHcrRWZVYmErR3FC?=
 =?utf-8?B?QWhPNWhkMVR6Z0wvVHpFalB4T1U2b3NjRXFIU3JpSUFhR0hlc3hvTjNFUm9Z?=
 =?utf-8?B?S1hPRm5mdGMvSTRlM25qdExrRjhKZ1RCNko1SXVId0Y2ZDZCRHNmN0dOR2Fi?=
 =?utf-8?B?Y2tnazhpTk9DMXh3ZkVzZlFScHJMWk5YZklVRldKYnJZNXdLOXZiNE5vdW1P?=
 =?utf-8?B?ZjkzekJ0enJ0Y05LWnlhcllpSnZjMEM2SXhqYVFLZ3hPMlhDUzJLVWVyeTFl?=
 =?utf-8?B?ZVE1RlR1RVl0V3JCYUxhVndiSWtzTU4zT0RIbDdDMTJpeFZ6ZWwwVi9KekRH?=
 =?utf-8?B?czJrOExZcVVtVDJUUHNrTHFWZEVlOEdEeFdteGd0U1diNG8wamNHMGx6QTMw?=
 =?utf-8?B?NkJESDI1SjE0OER0bEZVeEdDZlA3THZJWmFiUDN5KzVUYlZhUjJJbUJMNFV6?=
 =?utf-8?B?c1VMUmJwVzZrQlYrZExnNmRhU01hT2Ztbm9EVlZGdjV6WU5EM29LKy9XdWF4?=
 =?utf-8?B?d0pXd2t1cVRYNjltK2JBS2FXTDhvTVNYTTJSS1FIR0FURWJia3lvZDBuVENy?=
 =?utf-8?B?UWR2c1BoOHhMRHIxdUJ1ektteXhNbzNBM0V2TCtyZWRjVUw3UCtaVGU4SGto?=
 =?utf-8?B?MmdpSkdGcFlhNDVuUEZBQm9zMVFRUHdYbjV3QlRhUGNUVE8vZlhpTVIrbFRz?=
 =?utf-8?B?Ty9JdHRlQWtKa2x4U09nd2dWdXk1bERMNFI3MStvek9CMnNPVysxVnMySzdt?=
 =?utf-8?B?NVdXL0o5dHZGMXRVdXlHdlZTWHY5WUY1b1UrWGFiOFpwWHBORnA0N1p2NGJp?=
 =?utf-8?B?MEF3cUxualQ5ejROZDBMREJSVy9uNEVPeG5uYkUrRkIyQXZ5RG5yY2JLY3Q5?=
 =?utf-8?B?UDRUdFhZK2ZON3hUM1M3c2xEVFFvc3hXRHBEN05Wa2s1SzFtNXZiU3RSQUo0?=
 =?utf-8?B?cms4aDEvOEVOU3MxaE4yMmxyNGRMbnBDUmdKZlJ3Zm93YldZb2NKMG0yZlBv?=
 =?utf-8?B?U1NWY1hFSitMcU80N3JEV01YSldBNkxGdEZkYTYyeXErYXYvZEJTNGFJdTBL?=
 =?utf-8?B?Mm5LZmd5SnVYcXlMaTI3U3IwTktDUVV6MHdOOHRkcXhqN2d2S2RCalhkZUti?=
 =?utf-8?Q?hbA+FTrjktTXgz14RpnAHOHO+?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <274B31122BC81944BB6B0755968A35E3@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5898ceb4-62ab-4820-8a44-08dcfe14e03f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2024 03:41:19.4350
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h0iP0JtIXsXHlmVOru7ZYlu9TwujOuRlY+lobV0MHBTCcThnFdwqBMBaC5bMymHa0c2gXeEmLgMZDUbdL3XTqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7903
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_194129_709573_1AAE5141 
X-CRM114-Status: GOOD (  11.18  )
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

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHV0aWxpdHkgZmlsZXMgZm9yIHRoZSBN
ZWRpYVRlayBJU1A3LnggY2Ftc3lzIGRyaXZlci4gVGhlc2UNCj4gdXRpbGl0aWVzIHByb3ZpZGUg
ZXNzZW50aWFsIHBsYXRmb3JtIGRlZmluaXRpb25zLCBkZWJ1Z2dpbmcgdG9vbHMsIGFuZA0KPiBt
YW5hZ2VtZW50IGZ1bmN0aW9ucyB0byBzdXBwb3J0IElTUCBvcGVyYXRpb25zIGFuZCBTQ1AgY29t
bXVuaWNhdGlvbi4NCj4gS2V5IGZ1bmN0aW9uYWxpdGllcyBpbmNsdWRlOg0KPiAxLkhhcmR3YXJl
IHBpcGVsaW5lIGFuZCByZWdpc3RlciBkZWZpbml0aW9ucyBmb3IgbWFuYWdpbmcgaW1hZ2UNCj4g
cHJvY2Vzc2luZyBtb2R1bGVzLg0KPiAyLkRNQSBkZWJ1Z2dpbmcgdXRpbGl0aWVzIGFuZCBidWZm
ZXIgbWFuYWdlbWVudCBmdW5jdGlvbnMuDQo+IDMuRGVmaW5pdGlvbnMgb2Ygc3VwcG9ydGVkIGlt
YWdlIGZvcm1hdHMgZm9yIHByb3BlciBkYXRhIGhhbmRsaW5nLg0KPiA0LklQSSBhbmQgU0NQIGNv
bW11bmljYXRpb24gc3RydWN0dXJlcyBmb3IgbW9kdWxlIHN0YXRlIG1hbmFnZW1lbnQgYW5kDQo+
IGNvbmZpZ3VyaW5nIElTUC4NCj4gNS5NZXRhZGF0YSBwYXJhbWV0ZXJzIGZvciBjb25maWd1cmlu
ZyBpbWFnZSBwcm9jZXNzaW5nLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2h1LWhzaWFuZyBZYW5n
IDxTaHUtaHNpYW5nLllhbmdAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCg0KW3NuaXBdDQoNCj4gK3N0
cnVjdCBtdGtjYW1faXBpX2h3X21hcHBpbmcgew0KPiArCXU4CXBpcGVfaWQ7IC8qIHJlZi4gdG8g
bXRrY2FtX3BpcGVfc3ViZGV2ICovDQo+ICsJdTE2CWRldl9tYXNrOyAvKiByZWYuIHRvIG10a2Nh
bV9waXBlX2RldiAqLw0KPiArCXU4CWV4cF9vcmRlcjsNCg0KZXhwX29yZGVyIGlzIHVzZWxlc3Ms
IHNvIGRyb3AgaXQuDQoNClJlZ2FyZHMsDQpDSw0KDQo+ICt9IF9fcGFja2VkOw0KPiArDQoNCg==

