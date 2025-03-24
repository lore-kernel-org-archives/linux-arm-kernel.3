Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB25C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 02:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hSd2CTgnL92WCZkZ6FjgcjTeEwpo8GaUSsIcb9MAKDw=; b=1tRQfaUb316u4STf9dnZhe4rT3
	ep/O8hFiBFSDsjOwTl0z3U8A4u4zE+ybgXV8pKMCo4eOSas2NDxVXPlqfLDiwS4IjB9RDjLpeqFMb
	r2LNvICg/WzAgZ5HrvVNOZvDyVtMTw3wpkcNf0tSQs1plLbhdQwxSza4TMm8x3dIH/Zgad4HPqWeR
	YFb8Hry/Pdjfo8hZdK+OyhzN3N8aw+R+MRuSJMd7cY3HkgMfyUoTeXx9zmLIwuBFS7poJKHVcbzgi
	cUshReW7bPV2uRPOeTm2fiqOOeTpmF5sHWrAr1c9wnVqFuvqV3j8XC/cVnyGJl/V5zyRL4+n60l82
	kQ6jUBwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twXqh-000000025jW-2QVp;
	Mon, 24 Mar 2025 02:47:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twXox-000000025dV-1IRI;
	Mon, 24 Mar 2025 02:45:48 +0000
X-UUID: 129c07dc085a11f083f2a1c9db70dae0-20250323
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=hSd2CTgnL92WCZkZ6FjgcjTeEwpo8GaUSsIcb9MAKDw=;
	b=ATnnbNdf8as8ko0Zcjgzz9XGR/rLXT9BQLZsaZQzU5RXkkf09YxrrTCMY86qyQ3NAWkQwGaA346inSX3vhDGaMrkv6SAZSMONEccIOTi/UOpnrZRu79+jnLQvahS7gGEZn8QY29oo5r/Ow3f+ev49Jiiyr+FE5koHNo+IEg4OW0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:e6d7ea97-c423-4df3-b149-cea87a8f9e58,IP:0,UR
	L:12,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:12
X-CID-META: VersionHash:0ef645f,CLOUDID:0a1748b9-9b8c-4860-be67-5b80134d13d6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:83|11|80|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 129c07dc085a11f083f2a1c9db70dae0-20250323
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1130116730; Sun, 23 Mar 2025 19:45:40 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 24 Mar 2025 10:45:37 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 24 Mar 2025 10:45:37 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=edkN4yk5h2aQy7/RqHJVfQtiO1ahJPXJf/RKFJHjLRyOL18BpA/XAe+dUSXepv0cbjF7BVG8tdikhW/qPf4Bo15KuD7+7kxy4t5ut1A0wSf7OT7wojCX6HFuni2RpDbi/svcBGODAkse9/H/bgKHocsAOwGqXm/TG70vp3+26GlX7Whkr9k2mrt2mbvyPzMlwqQSUoA+8mFbWAk1rHMQ2nFKvl7mFU+5ypip99324XrCUnYxdPMUwLgs/pbO3II+ArOk/W4TiFmi8F/1GHMbxTfhdyP1+qKvfSUSF1HlSlVVh1Xgt/k5zIkM2cByY7IDH9yVAKn3nGFGgBsbXjmfLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSd2CTgnL92WCZkZ6FjgcjTeEwpo8GaUSsIcb9MAKDw=;
 b=UY+XcT6LViO6Be+0R1tqkVWhEKdHpAkHZBGB80VCnwuE71xTJyyYzUbV0+jW0g/undajLvk9n1KArYj8hChPin4eCq8QjHQvW+gas/Efpb7jB4UkmUOezufc6d/iM1kXmm+aBtkqKl5I48KcjC4Tew01YDTsXvYUXdR2qsH9vCuzbCxY3Y2Qh5VNOTCN/a5eXmcGO2BcYxLsrRF14wpxKhLo6/A0fCrDcWSpu1ZusYXzrv3TwH8oTwTMrMRnHUdnu9FfeX3HpNFodcraLuEK71Yb0rzI1RV1Tq5RcvFwm5njRSHZSdD1lo5teAOmNNTLHDWppxb+RcqqtAeK8UPcUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSd2CTgnL92WCZkZ6FjgcjTeEwpo8GaUSsIcb9MAKDw=;
 b=VGDrOFQk3M0KYRnMPM56fXo8RmJSP4Qx91l994vZC/1N4liH2g52zG4fQPhwQVARYL5a6xRqwTuy5XHXYSTcu+PHkWMe33ZrTuFDMDemZt5kjoFWcb876u/nzvbowchtQ2GTcZ42yFME5GIkdZt4YqFz5VaxubVdGVrqsObSgTE=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by JH0PR03MB7927.apcprd03.prod.outlook.com (2603:1096:990:34::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 02:45:33 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%2]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 02:45:33 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?=
	<Paul-pl.Chen@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: =?utf-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"fshao@chromium.org" <fshao@chromium.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?=
	<Singo.Chang@mediatek.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "treapking@chromium.org" <treapking@chromium.org>
Subject: Re: [PATCH v2 03/15] dt-bindings: display: mediatek: add EXDMA yaml
 for MT8196
Thread-Topic: [PATCH v2 03/15] dt-bindings: display: mediatek: add EXDMA yaml
 for MT8196
Thread-Index: AQHbmkTXfAjIYabPNke+YWiVKerW2LOBmRUA
Date: Mon, 24 Mar 2025 02:45:33 +0000
Message-ID: <990774c68015d73fee297d12992d7c3e6421cc71.camel@mediatek.com>
References: <20250321093435.94835-1-paul-pl.chen@mediatek.com>
	 <20250321093435.94835-4-paul-pl.chen@mediatek.com>
In-Reply-To: <20250321093435.94835-4-paul-pl.chen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|JH0PR03MB7927:EE_
x-ms-office365-filtering-correlation-id: b8a7f63d-3981-405f-bedb-08dd6a7df2fb
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?M0pBcGhyRWxIN2lhdCtSRjBmUFhLQVAvOG45YWkzSDgrZ0Jkb3ZFL2FlMUdE?=
 =?utf-8?B?dXNtUU84aERwK0UxeEtHZzZFTElTVVlNeEgwRkJONjhEaUVEc0NCUk9MZkxV?=
 =?utf-8?B?dVJiVXRuVjAvME5sZ2JGOUtNM2lZWFRzWjhIOTZibk40bTdtSTFZR2J2bjBD?=
 =?utf-8?B?Znp2SkIwQUZpc1dYUkJxdnE0M3NlZzYwVzEzNGsxS0duSHdISlU2YW5aM2lD?=
 =?utf-8?B?elBlUG4yekJSWko5aG5VaGhYUVNpcGZUSy9LUGgzUHhreG54SHpqOWg4Ykk1?=
 =?utf-8?B?SitHNUhVcTA1ODMya2dZMTVtVnpZaFlmNzlkL1F1N3FPNE9hS0RNeUM1emQ3?=
 =?utf-8?B?Mm9JdWdIM1hpRS9QWEhvcURnbTFGWFVyK2ZkK0p4SXEzTitXU0cwWFMzZVB0?=
 =?utf-8?B?T2EvUFJXc0VEK2ovVzJhNTZSQUwyZ1ZBdnE2UDBScWQ5eXArVFZiTE1NZVdX?=
 =?utf-8?B?S0J5WHNFY3lBaUM2dGNSdjVUaVgxL0JoZUZMdXFmV3UveCtQc2k2NjB5amFh?=
 =?utf-8?B?dzBSdXplL2tMYXdsUXFQRW1BcEdmcUtMRElwRlFBUW5SRXlsWjlUOWtnZkNF?=
 =?utf-8?B?YStodkxWVUlYM0c3aDlZUVU4N1NSYStuZDB1OGxLOCtWaXR4WGI1YURpTE5J?=
 =?utf-8?B?Qkx2NGJuNXA4dUsvajFZV3Zja3JTOHZYT1d1a2V1MWlKMlNBRTQrbjFwM2dm?=
 =?utf-8?B?czIzWTVaOTJGbCtTWHVKUXR6WDVMbmJVMnZXS1h6cmRma3JKdHdDcHlaL05B?=
 =?utf-8?B?Smo5K2JHNDhmaG5aWlUremd6ekg4M2ZDSzBvRTBXMGZUaW5jTksxRFc0eG9T?=
 =?utf-8?B?QzBocWVmTHRCUkZ1U2pENjVqTEp5Y05jLzk3NVIxMlk2N3NobG9uT1gyL3FQ?=
 =?utf-8?B?Vzk0QmtDUnNTbkEvK1FyTG92TUhzcjB1WHRwcHZXSDV4NjVBbVpMendyTHRK?=
 =?utf-8?B?aHNWV2w0Mjg1VXg5SGp2R0huN1o5bDhQMnRJbWd3V2hkQVpMQmJ6WXhRYU96?=
 =?utf-8?B?ZjF5bmhFYVdVRUpRYTlqT2wrRk1oZnUrY1pGZy91NzIxMi9SVkQrWkhJTitD?=
 =?utf-8?B?YnJFK29TK1R1OHJUb1h2bnVCM2VKKzF6ZTB3Z3J4OE9nZ3JhWnhvR2FWWVhU?=
 =?utf-8?B?NTd3MmEvZlQvMnYyR0ZFRkVXQThTQ0ZtMFV2VVpFY2pNT1hTREVuZ3pwQW8z?=
 =?utf-8?B?aWF5MzdiS2dkckRULzh5eVQ4NmJPUFlOaHoxQzhMWjBNKy9MVEI4aGQ3V0hs?=
 =?utf-8?B?V3k5QUNBd1pIeVRvQkZPRGJjeE1McDVaTHFBNUdsbVZXc1FheUx3eGN4UWF2?=
 =?utf-8?B?Y0l0UWhZcEJwbzIzS3A4M0FoeS9WZGNiMmxLWGIyd2hKU0ZsNVpNQmE2L0k2?=
 =?utf-8?B?SjkrcmtrQ2d0YlU0SkNGdU10WGxnZkw4VE5BQTh2YXJ4MG0yUi9ONTlVOGF0?=
 =?utf-8?B?S0tMNlJ3SllBSnZ1NEZ6YUpoWlFQU1F0R2dLYUtzTk9rcGp2OTlPbUo0NmdK?=
 =?utf-8?B?TkQyRDIySS9BOFhjT2U3RTlDWi9HdDM1SXZrMlpLenlHLzdLdlJIQjFqc05s?=
 =?utf-8?B?N0tjdStOWDFES3h5NFpVeTZEbU5nYk1PVUk2K0M5Z3QvRHZqaFJXV0ZiZXFp?=
 =?utf-8?B?cUtkL2NDT1RURnNYK2Z5TFJTMFBNMmNydlo4SUExcHBkMVVmbzBsQ3ZscHRp?=
 =?utf-8?B?R2NvR1lpeng2T2xDRlJiWEw5U3o1UTkyWFJGMVNjdURtZUNSZW15VGd3Unlq?=
 =?utf-8?B?U0VrYVNndnNRZFJVUHdxc2VsU1FxSnJNTjRQMW9wQzdrL3Fac0QxcG5zMXl0?=
 =?utf-8?B?UVFiS0lpTWJzU2RLaEFmaVR4NmZ6aENOMmorN2xtYkRrK3JXZFBiVWlBeVdw?=
 =?utf-8?B?eVVuZ1V5M0xiazVwSGw4Tk8yeDVjRm1TS2pEWWF1SG9zWHBYYk00ZWJVMW5C?=
 =?utf-8?Q?uMfucXtmGKBb+xzi4Px8tE/RELPPfWal?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RTl3dFI4cUwyL2ZLazUxRnl0dHpaWi9CaVVENHRWZTNxVjZseStSNWVib0F0?=
 =?utf-8?B?Vlg1L21hZHpqU29MRnFHWUlna2JIY0xGSS96Q3VDT3F6KzNRazJ1TGlTMzBw?=
 =?utf-8?B?VzBnWVZaL1BDZDhQNVZCMGhDVUVUcURNS0hCN0dXS0pXNTBvVC9CS283ZGE5?=
 =?utf-8?B?Q1NsSTFvWHRSZnNQdU92Ky9wWHE5dUY0c2dEOWZrejIydlF0Zi9ibms0NkEy?=
 =?utf-8?B?bHFNMVM2SVpPWk5iby9PcG9sL0crM1E3WS9UbDVncmZXVStrOGQzUnZTbEVy?=
 =?utf-8?B?U2hZZEg0U2lsTi9wcStQQWNWMW05K2U2RFAvRENlYTBONGJsQTZoSFY5UWVt?=
 =?utf-8?B?SXNQSlYrQ3JmY3pLRW1zSVJBeVhFdHlHVmtOZFRETi9zMXpiQXNkQmFNZkxQ?=
 =?utf-8?B?bUNEWlJiRFRYTUpSU3M1WEpRN1R5M0d5aWYwK1VGMFErWHBZZ3ZaWVpHQitq?=
 =?utf-8?B?VXlPZkRrVHB1SWdBVE1YM3RMcENvQmJ3OUM4d0xzdkpJN2VZSG9nenN0S0xk?=
 =?utf-8?B?SXFNaUVramErQ2xRZCs2T1ZSUGdQUkZ2Sm51M0cwUlVyMjlZS09adStGQ2Ji?=
 =?utf-8?B?SzJ1UnlzTllRdzJqVGYyazVaSlNMYkM1TDdHbkVrQ25pQ3IxVkdFNi9YdStZ?=
 =?utf-8?B?QkNQZ3NscHRDKzVGWFg2aEFVaWlYT3QwUXE5Z3dIRXoyLzRXb3lYQytPU04r?=
 =?utf-8?B?ZnBBL2VTUUkrYW5SN3BsS3ZlSlpiNCtYOE4zajkvNmkwMFlPZEJPZEFyR2NK?=
 =?utf-8?B?eW4zUGxjYXZYY0xxeTlibE5JaTNmdkt1TzI5alB2SjNGSFhLcEJUallMeS9D?=
 =?utf-8?B?RDJ0YTJUcnIwRmRoc0Q2L1VaU2xjVzg5Z3k4M0tES2s4UzZqK0JDTG5ZYjJX?=
 =?utf-8?B?M2N3L1haNDRlRzlMNGI3QStuT1M1ZzdEaHR5WlNyYnRtWjM1M283RWFmcFZM?=
 =?utf-8?B?bU84V1BaZHBrcjhCakx2NFM0WmJwWWlwMlJOMEdrMmNCem1HZW0zb3lKQ01I?=
 =?utf-8?B?Z1dzTExMaWlpdUpMdUJlNEh1ZFdhNlBoUVhKcTEvNUFHVENWa3RXQWIvUTQ1?=
 =?utf-8?B?YWtINmVKQ3p6dDdod3pVYlQ4NjM2M0NTb2Q0dk0zcnlLUnZaRVNpWGR1M05L?=
 =?utf-8?B?U3ljQ1N0UjV1NlMzMkZ5cnN4QXpEb1VwV3QraHh2MHI2b3ZqZmoxbkpndkd6?=
 =?utf-8?B?YWhGcEpybCtGNURJSWswRkRFOUZ0eXgxWXFaelBURHdzR2xoVTE5b0NpeHlU?=
 =?utf-8?B?NDZhalB3aU1SR01NSUtmaCsrN1Z5MURiQUdaMXVDcC8xZkRUKzd4Z05aeXVW?=
 =?utf-8?B?YU5kWG5BK3dRRGxiZ3hyRXZ0VjJkMnlsWXpnT01LOFA2STVMdmJaV3c5TGJF?=
 =?utf-8?B?VTI3SEJEcXQ0OHpvbjFYdk01Wnk1Z0x3SittT3NCRm1QWDBjYVVOMkNZTFI2?=
 =?utf-8?B?TjkrYWVaOEtBS3hIbU1XQTVkR0NDRjhTRkpKWmFGTUdjbVhGVFRyWVRsY1VS?=
 =?utf-8?B?QWZKNFg1Y1hFcFYvL2VIK2F1RFhMY29RNWU5bmFLbElNcjJjYWRma1FYRUFB?=
 =?utf-8?B?SEFEMnVrWEsyZTdaVkIvcHZMbmZNVlpGUk9acktjV21FT1B1NkVqbW55aU44?=
 =?utf-8?B?ZjRMNDhqNHRWc2RPU2dPR25GN2ZIZWVxSE1Kd1FFRGtBVTJET0RFQy9xVzJv?=
 =?utf-8?B?b0YwWmdHV0hGelZEZVJ4WFZwMnpSM2RQa01lZ1RGUlNtOE1VQlZUSzNSSysx?=
 =?utf-8?B?R2VudTh5ZTQvUW1Tbk5Yd0RGdlErVTBIL29wVElUdVZHcG1XZEJ3M2J3KzhV?=
 =?utf-8?B?L2lrVEhOR2REa2NmSEk1c2lhZmlkWEVudWNHa3psTjdoTVRJSGdDa2VuRENU?=
 =?utf-8?B?N3dJVFJ0dEEva3hGMmNyd1FWeHVXZmdOam9ublh1MEtlQWwwUTZvOWxuQ0NM?=
 =?utf-8?B?cjcwdjRkM1dxaTJiZnRTMmQvSHpTMGU1K1VIMmdTemxOdTV5QXlMQWllRG82?=
 =?utf-8?B?RTNaL3VjaDhFQVpMSlJMNXpUR2xSRlByaUQ3ajJScHNHTENDd0krb1Zybkw5?=
 =?utf-8?B?Q1VqZ3dKNnFSL3JkcnRzOXhmcmd0Tk4zMnh3YTV1WlJDNkNLdXcvNmZDbTRI?=
 =?utf-8?Q?NEtfegLKUdHOMx/25w60m7wLg?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <27F737E50C7BB9408C80AEEF864EAFE9@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8a7f63d-3981-405f-bedb-08dd6a7df2fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2025 02:45:33.6029
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vP0JaK97sW4uoidf7AubuJu4vNFr93SKaStbKZCktBLMYw429qgexsZ7vQwb5tyDFidBhjfW5RwgV6mwz7jRmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7927
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_194547_367948_659CAD3C 
X-CRM114-Status: GOOD (  16.63  )
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

T24gRnJpLCAyMDI1LTAzLTIxIGF0IDE3OjMzICswODAwLCBwYXVsLXBsLmNoZW4gd3JvdGU6DQo+
IEZyb206IFBhdWwtcGwgQ2hlbiA8cGF1bC1wbC5jaGVuQG1lZGlhdGVrLmNvbT4NCj4gDQo+IEFk
ZCBtZWRpYXRlayxleGRtYS55YW1sIHRvIHN1cHBvcnQgRVhETUEgZm9yIE1UODE5Ni4NCj4gVGhl
IE1lZGlhVGVrIGRpc3BsYXkgb3ZlcmxhcCBleHRlbmRlZCBETUEgZW5naW5lLCBuYW1lbHkNCj4g
T1ZMX0VYRE1BIG9yIEVYRE1BLCBwcmltYXJpbHkgZnVuY3Rpb25zIGFzIGEgRE1BIGVuZ2luZQ0K
PiBmb3IgcmVhZGluZyBkYXRhIGZyb20gRFJBTSB3aXRoIHZhcmlvdXMgRFJBTSBmb290cHJpbnRz
DQo+IGFuZCBkYXRhIGZvcm1hdHMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQYXVsLXBsIENoZW4g
PHBhdWwtcGwuY2hlbkBtZWRpYXRlay5jb20+DQo+IC0tLQ0KPiAgLi4uL2JpbmRpbmdzL2RtYS9t
ZWRpYXRlayxleGRtYS55YW1sICAgICAgICAgIHwgNzAgKysrKysrKysrKysrKysrKysrKw0KPiAg
MSBmaWxlIGNoYW5nZWQsIDcwIGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZG1hL21lZGlhdGVrLGV4ZG1hLnlhbWwN
Cj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZG1h
L21lZGlhdGVrLGV4ZG1hLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZG1hL21lZGlhdGVrLGV4ZG1hLnlhbWwNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXgg
MDAwMDAwMDAwMDAwLi5kZTdmODI4M2JiNDgNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZG1hL21lZGlhdGVrLGV4ZG1hLnlhbWwNCj4g
QEAgLTAsMCArMSw3MCBAQA0KPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAt
b25seSBPUiBCU0QtMi1DbGF1c2UpDQo+ICslWUFNTCAxLjINCj4gKy0tLQ0KPiArJGlkOiBodHRw
czovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZG1h
L21lZGlhdGVrLGV4ZG1hLnlhbWwqX187SXchIUNUUk5LQTl3TWcwQVJidyFqSF8tMkk4TmtUVVg5
MHZiWkdqZHVVQW80b244RHNDR0ZUclZYNWpVZHhMX3pwS3Q1UFNQUkdtMzFvdFBaNHdJRHpJMmg5
SEZHYkY0REM1alB3MW5lam8kIA0KPiArJHNjaGVtYTogaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92
My9fX2h0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sKl9fO0l3ISFD
VFJOS0E5d01nMEFSYnchakhfLTJJOE5rVFVYOTB2YlpHamR1VUFvNG9uOERzQ0dGVHJWWDVqVWR4
TF96cEt0NVBTUFJHbTMxb3RQWjR3SUR6STJoOUhGR2JGNERDNWpyMWp4Sm9RJCANCj4gKw0KPiAr
dGl0bGU6IE1lZGlhVGVrIGRpc3BsYXkgb3ZlcmxhcCBleHRlbmRlZCBETUEgZW5naW5lDQo+ICsN
Cj4gK21haW50YWluZXJzOg0KPiArICAtIENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJu
ZWwub3JnPg0KPiArICAtIFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+DQo+
ICsNCj4gK2Rlc2NyaXB0aW9uOg0KPiArICBUaGUgTWVkaWFUZWsgZGlzcGxheSBvdmVybGFwIGV4
dGVuZGVkIERNQSBlbmdpbmUsIG5hbWVseSBPVkxfRVhETUEgb3IgRVhETUEsDQo+ICsgIHByaW1h
cmlseSBmdW5jdGlvbnMgYXMgYSBETUEgZW5naW5lIGZvciByZWFkaW5nIGRhdGEgZnJvbSBEUkFN
IHdpdGggdmFyaW91cw0KPiArICBEUkFNIGZvb3RwcmludHMgYW5kIGRhdGEgZm9ybWF0cy4gRm9y
IGlucHV0IHNvdXJjZXMgaW4gY2VydGFpbiBjb2xvciBmb3JtYXRzDQo+ICsgIGFuZCBjb2xvciBk
b21haW5zLCBPVkxfRVhETUEgYWxzbyBpbmNsdWRlcyBhIGNvbG9yIHRyYW5zZmVyIGZ1bmN0aW9u
DQo+ICsgIHRvIHByb2Nlc3MgcGl4ZWxzIGludG8gYSBjb25zaXN0ZW50IGNvbG9yIGRvbWFpbi4N
Cj4gKw0KPiArcHJvcGVydGllczoNCj4gKyAgY29tcGF0aWJsZToNCj4gKyAgICBjb25zdDogbWVk
aWF0ZWssbXQ4MTk2LWV4ZG1hDQo+ICsNCj4gKyAgcmVnOg0KPiArICAgIG1heEl0ZW1zOiAxDQo+
ICsNCj4gKyAgY2xvY2tzOg0KPiArICAgIG1heEl0ZW1zOiAxDQo+ICsNCj4gKyAgcG93ZXItZG9t
YWluczoNCj4gKyAgICBtYXhJdGVtczogMQ0KPiArDQo+ICsgIG1lZGlhdGVrLGxhcmI6DQo+ICsg
ICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQ0KPiArICAg
IGRlc2NyaXB0aW9uOiB8DQo+ICsgICAgICBBIHBoYW5kbGUgdG8gdGhlIGxvY2FsIGFyYml0ZXJz
IG5vZGUgaW4gdGhlIGN1cnJlbnQgU29Dcy4NCj4gKyAgICAgIFJlZmVyIHRvIGJpbmRpbmdzL21l
bW9yeS1jb250cm9sbGVycy9tZWRpYXRlayxzbWktbGFyYi55YW1sLg0KPiArDQo+ICsgIGlvbW11
czoNCj4gKyAgICBtYXhJdGVtczogMQ0KPiArDQo+ICsgICcjZG1hLWNlbGxzJzoNCj4gKyAgICBj
b25zdDogMQ0KPiArDQo+ICtyZXF1aXJlZDoNCj4gKyAgLSBjb21wYXRpYmxlDQo+ICsgIC0gcmVn
DQo+ICsgIC0gY2xvY2tzDQo+ICsgIC0gcG93ZXItZG9tYWlucw0KPiArICAtIG1lZGlhdGVrLGxh
cmINCj4gKw0KPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ICsNCj4gK2V4YW1wbGVz
Og0KPiArICAtIHwNCj4gKw0KPiArICAgIHNvYyB7DQo+ICsgICAgICAgICNhZGRyZXNzLWNlbGxz
ID0gPDI+Ow0KPiArICAgICAgICAjc2l6ZS1jZWxscyA9IDwyPjsNCj4gKw0KPiArICAgICAgICBk
aXNwX292bDBfZXhkbWEyOiBkbWEtY29udHJvbGxlckAzMjg1MDAwMCB7DQo+ICsgICAgICAgICAg
ICBjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Ni1leGRtYSI7DQo+ICsgICAgICAgICAgICBy
ZWcgPSA8MCAweDMyODUwMDAwIDAgMHgxMDAwPjsNCj4gKyAgICAgICAgICAgIGNsb2NrcyA9IDwm
b3Zsc3lzX2NvbmZpZ19jbGsgMTM+Ow0KPiArICAgICAgICAgICAgcG93ZXItZG9tYWlucyA9IDwm
aGZycHN5cyAxMj47DQo+ICsgICAgICAgICAgICBtZWRpYXRlayxsYXJiID0gPCZzbWlfbGFyYjA+
Ow0KDQpsYXJiIGlzIGNvbnRyb2xsZWQgYnkgaW9tbXUsIGFuZCBleGRtYSBoYXMgYWxyZWFkeSBw
b2ludCB0byBpb21tdS4NCk9WTCBhbHNvIG5vdCBwb2ludCB0byBsYXJiLCBzbyBpdCdzIG5vdCBu
ZWNlc3NhcnkgdG8gcG9pbnQgdG8gbGFyYiBoZXJlLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiArICAg
ICAgICAgICAgaW9tbXVzID0gPCZtbV9zbW11IDE0ND47DQo+ICsgICAgICAgICAgICAjZG1hLWNl
bGxzID0gPDE+Ow0KPiArICAgICAgICB9Ow0KPiArICAgIH07DQoNCg==

