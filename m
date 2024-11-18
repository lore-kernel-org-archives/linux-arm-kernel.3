Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4D2D43FE3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 07:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=deGeM9CSb4i1dVIAB9jlcSo+kPrcZT146Z2M89+8p6E=; b=wIO27P7H0tDOuED8wBqVMLOOOv
	LCWMCKwOgnf7uiLJwncDzRPc7bWflvTXnzbzfgR5ox8Qsg2YdUheuPJJz1mGCC6XMpeMUNuFyARWF
	vYtN3gCaOFpplaJNWy61UXlaU5DE6e8ego3S8RAQYn6wNOHjaxHWuvgiRWiMTr3xQ37xxblK06XaK
	kcAK2a7T9IZue6fMN8YYEMk9JrPUlp4GPscveL+kVps4q+kaPJAFvml5JoF8bXHgzUC4PolHHkW01
	8LuKGKEL+CMM4BhbAPjlGYdSOGSuYB6sbEc0eI+VF5N4aUgIxISP+sXRaOBKqOa6w40GEISj9qF45
	9x7X5cQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCvlK-00000008b33-1Gn3;
	Mon, 18 Nov 2024 07:01:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCvkL-00000008apo-1mul;
	Mon, 18 Nov 2024 07:00:33 +0000
X-UUID: bed9f9aca57a11ef9048ed6ed365623b-20241118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=deGeM9CSb4i1dVIAB9jlcSo+kPrcZT146Z2M89+8p6E=;
	b=KOcD+i5auSaJ+mXb7/d5rSLEhswiL+UMYSCcn1uOepJQDIhF2XpvmD6xcv73FJAF/31r0lUiRs6okSH1jP0KmjRi5gSg2NWq1VbKb4ne+uLxFNwA3nRoOHSOhlxBn9+VXkTuu6aJSPHZ8CZ6j1v2KUi/vH8MvFbn5dOdacLGxto=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.43,REQID:a6c3d985-f48f-4989-be3b-4b09efe9341a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ce19b8a,CLOUDID:83533f07-6ce0-4172-9755-bd2287e50583,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: bed9f9aca57a11ef9048ed6ed365623b-20241118
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 765077544; Mon, 18 Nov 2024 00:00:07 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 18 Nov 2024 15:00:05 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 18 Nov 2024 15:00:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZOFRELFEkV4skqsnXJTLaNhRgsx2fzBiPe4f4Px8Ud4NCO14Y7EqT/M0ASrstFFj4S7UdbPGuj7nkzfhuh3OIZ5hEtAqPWAbted+hkIUngNyHe2481BnDlzcJqJN9nFuZ5i1G4AE9AHwCTD7hTGnOmL8eC6ycCmjwfVvwqCfhcVSyrrONUcOCrr+h+KP8xLeBeWgKGgmMfVXJ7EHi7OlxxWi1QE6rceSwrXXxjIAcaLjcwLHEw8mdUvKh/ILfHyQaYzGKdKjSWarQETeqQY/t7jnBpDgdxl2jL6DQq8r3qMq/gg3DUnQ1oImYE2p3105V7q4a5G6c16kmH4zNHejQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=deGeM9CSb4i1dVIAB9jlcSo+kPrcZT146Z2M89+8p6E=;
 b=vJpB6cCJkwC49DiduBERdXR5hN291aGLs8QA1npmw8gyhjho9I74vy24KQsBef1DG+y+byzLmC36toNkebJ5xCXDrnbZTIU69WHm7JsHdT+Z08r0rXEAesbXX3k2JkBag36A3qPIKn+mTYrmevf4Gney3e3zQRtWTOROUp3uK5t4q0vnZ1k0mRStc7bN58ddknX5qMN8jgRba8bJ2yxYqw5b3m22RK031WaJcqQB2oOZyoPdxb0FAXhmua7miwTcvPf4EJy0xaC4GJ2+r4+RF55/m2IhL7342yH4rI2vTDPen4mWTwMdigUAzhtoYU5NuPIuNqvGnQvNZleJ/BZ4qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=deGeM9CSb4i1dVIAB9jlcSo+kPrcZT146Z2M89+8p6E=;
 b=Q6FnpnBReTxFsffUxfaREKpNRA8FOls/lpno0aYfbdlU/vpgV5w+/ANTAu9qRjydeYGWOsRGW05lWKKOfMW0PMTgs8c6mX9LAhW9LHTsa+JliFhEiM8aKFLkaycXh/XCDoSI5UUWw2dYnuAoY/SMiH4JolcsBLYT6jjaw37BaSE=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB7831.apcprd03.prod.outlook.com (2603:1096:101:18a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Mon, 18 Nov
 2024 07:00:02 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8158.017; Mon, 18 Nov 2024
 07:00:02 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "fshao@chromium.org"
	<fshao@chromium.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] drm/mediatek: Add support for 180-degree rotation in the
 display driver
Thread-Topic: [PATCH] drm/mediatek: Add support for 180-degree rotation in the
 display driver
Thread-Index: AQHbOWTep+mGnhKSk0OqoXPmeRs3lrK8nC+A
Date: Mon, 18 Nov 2024 07:00:02 +0000
Message-ID: <6c6780d849b205fc84969463240cf1cdf74bd80d.camel@mediatek.com>
References: <20241118025126.30808-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20241118025126.30808-1-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB7831:EE_
x-ms-office365-filtering-correlation-id: 1856fbe2-1f20-4d47-e5ba-08dd079e9fb7
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bTNKUzh3QW5vMjFrM3FOUlNjU1Z5dTdVQzlEWmMweFE3QW1UT0c5NW53L29R?=
 =?utf-8?B?dXlvSFZFcTRnRFZaKzJmUC9MZ1ZsejlBUjBlZFFBVmlSOERiejE0V2RnVk1D?=
 =?utf-8?B?ZHZ4blFoUWMrTllBNG1jbFNpM1QvUElwNzdyeldYSUVzK2hlRjc1aUtZWVJF?=
 =?utf-8?B?TFpyMUtMYUp4OHkzTUpvZTdwRFVnMWhtb0JLQXJtTjlQRzQzbHNRSnJHTjI1?=
 =?utf-8?B?bUdzdkpzbjZBNFdFQXg4TTZNVzNLNVhDT0w1UTFqS2ZZWGhERUkvbjdvQzY2?=
 =?utf-8?B?Ylhlc1ZuR2pmY2hicVJEcUk0WHJ4Q3dFNzlIazFoZ2N1OTdNUUkvS1NmVHNM?=
 =?utf-8?B?cHRFS0VjZmNhUkEwSmJXWXBLd3FPK2ovNE8vbjYxcG1FZ3JHUGE3c1pnb09q?=
 =?utf-8?B?RFp5aU5ZUE9yZ2w4NUZMY2JqczN2WlduTkNKN0VFNUJpMnp0d1JpczRaU1Fo?=
 =?utf-8?B?dWE1bmZTeWNOSFFiZkVTTVN1SkZYb2h0T3YweTFGRUFvWCtMOWszZWFkVXJY?=
 =?utf-8?B?TmxuaFhxdDlwSWNUT3JXMTM2ZFRQRTQ0OXFqZ3VLc0djakd5dDVFb1V1T2V6?=
 =?utf-8?B?ZnE2MStDQ0daT0NPY0pmSmxRMGNGTk1ueC9FcFhQTGpPaTFwbVNPcFpTTzRP?=
 =?utf-8?B?V1lVRVpocHNiZG85R3d2SThWZjk2ZWdvbmhOaFJncVdyNUtscjIxTTBWKzlx?=
 =?utf-8?B?RHczRk84WXZnNzdXcjgzR29XNnlXb0FGMklDREgwTXNBTkltSGZGanRmOElU?=
 =?utf-8?B?MnJ3eUMycFYxNUdHaXg2bnpqZ3I0MzBpK1J4V2dMZ3pDOXFSS1hNUnBMeFZ5?=
 =?utf-8?B?M1dTOGllWVc2M0FqUGwvdTZNNFp5S28xQW5ndmI3MTNxRDBuelRRUlZwWGFN?=
 =?utf-8?B?YUExRGxUem13amNNMGlmUkpWOTA0Q1A3TUxIdTZiaHdRMVRhT05QSDYxV2NI?=
 =?utf-8?B?WXlvcWZzWVQyVi8wOGRNcW1BQmt3VmF3a1g3V1JQUW0vV0FrRnVxNzdzWFd4?=
 =?utf-8?B?bUFHSlRYbGR0UWNLUnIwcGJadTlWbC9ZcVFaVTZMbGN2MGdqQ0ZkcTNMS2JP?=
 =?utf-8?B?UHNTN3ljQjFFcGxxTFpGUXdGTGJyQm4zVittTENlRGtXTW0vZFRuUCtxbjE1?=
 =?utf-8?B?WVprdFcwZGxKQnkxUGtERHJnbExyT3Q3eTNiWW85b0swb3gyaWUxdHQxeTBq?=
 =?utf-8?B?V0RFYkxDaU55T2puSG9aYnByWmlUbFV0ZDRQek55YWk2eXpSNWNHYi80VDJB?=
 =?utf-8?B?U0FFdzMyRE4wdWsrakNPZVhYNWJTTkZEVWNWaHllZWM2ME5mRkZLQVBBcXNI?=
 =?utf-8?B?anpWSi9Ra1pYSS9SY1ZsUWV1Zy96U2JIbXlLWHlRVU8yL3JaR1hPU05yeEtk?=
 =?utf-8?B?Um5vNzhFcitJclRjN1d3bUZaWUhHM1pYTS93N3doZUZEREVNZkxlNTNYa3k3?=
 =?utf-8?B?R3doUitkRW9UODVFcTZGeDVmVVRlSlc5K2dPeWkxbXI1eW4vdGNzc0hvWm9B?=
 =?utf-8?B?cVJuQ1VjT3BIZTgyd3REUUFVWXBQNEVLMnBUZWN1TDFWTlplcnFvRGZEUEtY?=
 =?utf-8?B?L01lc2FHMnA1eTNLN0c1a3RxYmQzRTVTcm83SVhzYThXWkw4N3lsWERVR0Vs?=
 =?utf-8?B?SDNVQmlmY1dWd3Erbi9iR09TSStEaU96SmtBN1V2TTNTR2M5TFpXM09FQnVX?=
 =?utf-8?B?SHJlQUlNNlRZaFlHcGorcHB6NUowKytJK2dLcVRhYnhJckJieUtGYlkrQnY3?=
 =?utf-8?B?bTZOd3B5TFR1QlZSMXlES2JUMXlkVFpoYWpiWkNCbUphay96RmZIODZYL3RY?=
 =?utf-8?Q?M/WL6OfC8JsffU502V4jMvc6O7Ez9VdHPZYCc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SURpLzdUdGVxMlJRd2prdGgzcjl3b01KcFAyWmZkMDA5WWs2b2pCSjZxM2hu?=
 =?utf-8?B?eFloNzMzR1dVZEJKa2hSZ1dSbXpJMCtJaHREU2g2em5RMjNWRGFkT1QzWmE0?=
 =?utf-8?B?OE9lR212VVNySjI1Nkk4ODZGcmtQR3NBcGhScFM1cEJ4RVE0cXpmMTdKQzlP?=
 =?utf-8?B?S3VocXBDbUdXUkhLOUhVd1p6ZWF1K21QUmRNVkRRalhRSk5FdWxnQ2FYMDJO?=
 =?utf-8?B?eGhndm9mR0pFMjRrMDY2YkY4VmRsOG50S0Rsck5XSVRhdU5YUkpNVzNuSXB5?=
 =?utf-8?B?NWNwaHU1UHM2eGk1THNOcUNlZDY1VDZKWCtsdTduempmcitGcE9PSHozVllJ?=
 =?utf-8?B?YUkrRnhtQ0NFb29xUm0rR3Q3SE9sbTNCalRIWDdzajdFRWVOWnpXdW9nblMz?=
 =?utf-8?B?MlN6bUFRbkdoNHJLYVhXVkpvZzZNWDB2NGtaZ3NNNloxQlFCKzJvemlTNGR1?=
 =?utf-8?B?dEJrNXdRTWo1UWdwbVQxUkJ4RGZ3REkvdTMrbTNieVFLZGVSTVl6cUE5Zno0?=
 =?utf-8?B?UjZIRkV3RXBwRmt2Y04yLzhLOGNGZC9OWk0rVFR3T2RUSWZjejJzVEJ2R3R6?=
 =?utf-8?B?MXl2N2FXNFBSL2JMbU1nWSs1SnR0am1IVThsK25GTFlGem8vODhYT05POFdL?=
 =?utf-8?B?UHk0MzdmdWRlQUFIUmpxRlZqU0hUYTVaVTlUU1luVUUzcUI5VHlsdlNnTCtV?=
 =?utf-8?B?ZE9ZVjBtbFcwZ0ZTb1NHWHNGaTI5UzN4Q0poUUxWbWFnaDV1YW1NWW5YRzNk?=
 =?utf-8?B?MXBRb1RqQ2NISHR2MXZYSGl4alUyMU1BNDhLeHF4VTVBeUNsVllVdWJ5RG01?=
 =?utf-8?B?RmNNZUI4NTZzMUwxcStPcE1WNTBtTFZFa2VJNE9NeGMxemRQaTN0SW0wdjBO?=
 =?utf-8?B?T0t5WjRsQnJnZm5jMzdDRkhwVUhveXk5d2l2QXpoNW9PNFkzY0hGRHFxT1Jl?=
 =?utf-8?B?NjhNeWpkMzErdmtSZEpaTXVtdlFHdngwYjUzS1c0MmRuaC9jbS82R0piOVpG?=
 =?utf-8?B?RitJTk5MK2h3WkJRNmpNVWpXTFcrVTlRdHVOaDE5UDJib3RuYmpWK0pPNXBO?=
 =?utf-8?B?S0lXbmNndlMraVRsTHROYWhDdCs1cmRldmZCQ01kbXBtOFNCMUpxcmQyeDBo?=
 =?utf-8?B?a2xkR3Q0a0U2RXJqQkVwVFFGeG16SVl4em1PN0N1bGVFR2s1UW5xTFJSQmpI?=
 =?utf-8?B?NUlZWGxZc0RBZS9HNTdzN3hVN0ZoWUhNK1hleDdaTmFpWnREWE12azAxampu?=
 =?utf-8?B?UytvaU96Wm5OZU9nSGx5cU1TSUJJTHVpc2JsdlI0ZHBOMW54Z1lZdERMcThV?=
 =?utf-8?B?Z2EwZnNDMkdKVU5aUEFQbHBvOXFKa0hXUTFqbExOaERjV1J2WXZpQ3BXTlZl?=
 =?utf-8?B?WmZUQTVpcTNYWE00WUdwVHBPOFZhNnFXRGlJbXcvRkFEME5aSzAwM3c1eENv?=
 =?utf-8?B?VmIrbjJvMDBhNjluTFZLYVI3RU44SnNZSUh0OERIMkY4N2FNTzAra3Z4K2dS?=
 =?utf-8?B?QUZzL1FERWJkZ1d2Vy9CTUpqU0sxWGwwSjE4MU9MRmZMMUlSOGNUYVo3VDNh?=
 =?utf-8?B?MGxHMXV3K3N3UmVENG4rcTVVVWgzWnY3dTY2dTNDUVh5OGJUY0tveklocHda?=
 =?utf-8?B?RFJxejU1cHJlR1NydkxIcHF3YlVtalQvUkJuZGYrb1o2TmVuQzBvbWpucXFT?=
 =?utf-8?B?TUJuVEE4TVVlYklFSm9yTjJETmNLdUpZUWdvOVg5N3V3ZHMrVzJMSSsvL1Iz?=
 =?utf-8?B?MEtiSUpkaERMQjEyNnJqTkoyOWwveVJ0RFZMUW1uSmc2eWg3dnNPOUU3aWJ1?=
 =?utf-8?B?T3lsd28xaFRWNmhlWVdIaFdLVXB0bytSRUNsL1BQcDF6cnhySm1sY0t6SlFw?=
 =?utf-8?B?dnFaRkNIREVPYkxuTVQ1UkcxL3lOcjhpR3lSODgwVFBYUFUrREVEZ0hRa3Nx?=
 =?utf-8?B?R09CblVxajJSNThEMytCSGdiV1Fiazlyb0pDR2s5bkwzSEFFeHZuZ1FqTHp6?=
 =?utf-8?B?KytMeWhMb0xnYUNsOW4rOG12anVkcSsxWmpyZ2pRVzhlbHBZM3Z0VVBDaWIy?=
 =?utf-8?B?OXFmS2ZydWdZKzBwQXBwbjZZb0pBTkxXRTVHaXR6RVVIb0NSaFc4dlF0a0dl?=
 =?utf-8?Q?6O1QLjFtPTRVdOZicVGZvl12M?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6180AA7D4977874FA14CC1F535032CC9@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1856fbe2-1f20-4d47-e5ba-08dd079e9fb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2024 07:00:02.1707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SjVP0bdKuCsQyo6s2r3uwjGyDYvJhJ7Ch2zGhNf8DAyFYeA8/M7CJuRBLTZHv9otUqQo03d1R9c9we6eU0ax5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7831
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_230029_485194_A24345CA 
X-CRM114-Status: GOOD (  21.47  )
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

SGksIEphc29uOg0KDQpPbiBNb24sIDIwMjQtMTEtMTggYXQgMTA6NTEgKzA4MDAsIEphc29uLUpI
LkxpbiB3cm90ZToNCj4gbWVkaWF0ZWstZHJtIGRyaXZlciByZXBvcnRlZCB0aGUgY2FwYWJpbGl0
eSBvZiAxODAtZGVncmVlIHJvdGF0aW9uIGJ5DQo+IGFkZGluZyBgRFJNX01PREVfUk9UQVRFXzE4
MGAgdG8gdGhlIHBsYW5lIHByb3BlcnR5LCBhcyBmbGlwLXggY29tYmluZWQNCj4gd2l0aCBmbGlw
LXkgZXF1YWxzIGEgMTgwLWRlZ3JlZSByb3RhdGlvbi4gSG93ZXZlciwgd2UgZGlkIG5vdCBoYW5k
bGUNCj4gdGhlIHJvdGF0aW9uIHByb3BlcnR5IGluIHRoZSBkcml2ZXIgYW5kIGxlYWQgdG8gcm90
YXRpb24gaXNzdWVzLg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4N
Cg0KPiANCj4gRml4ZXM6IDc0NjA4ZDhmZWVmZCAoImRybS9tZWRpYXRlazogQWRkIERSTV9NT0RF
X1JPVEFURV8wIHRvIHJvdGF0aW9uIHByb3BlcnR5IikNCj4gU2lnbmVkLW9mZi1ieTogSmFzb24t
SkguTGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyB8IDEyICsrKysrKysrKystLQ0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQo+IGluZGV4IGUwYzBiYjAxZjY1YS4uY2M4
MjVjNGYyZTA5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rp
c3Bfb3ZsLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5j
DQo+IEBAIC00NzIsNiArNDcyLDcgQEAgdm9pZCBtdGtfb3ZsX2xheWVyX2NvbmZpZyhzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBpZHgsDQo+ICAJdW5zaWduZWQgaW50IGhkcl9waXRj
aCA9IHBlbmRpbmctPmhkcl9waXRjaDsNCj4gIAl1bnNpZ25lZCBpbnQgZm10ID0gcGVuZGluZy0+
Zm9ybWF0Ow0KPiAgCXVuc2lnbmVkIGludCBvZmZzZXQgPSAocGVuZGluZy0+eSA8PCAxNikgfCBw
ZW5kaW5nLT54Ow0KPiArCXVuc2lnbmVkIGludCByb3RhdGlvbiA9IHBlbmRpbmctPnJvdGF0aW9u
Ow0KPiAgCXVuc2lnbmVkIGludCBzcmNfc2l6ZSA9IChwZW5kaW5nLT5oZWlnaHQgPDwgMTYpIHwg
cGVuZGluZy0+d2lkdGg7DQo+ICAJdW5zaWduZWQgaW50IGJsZW5kX21vZGUgPSBzdGF0ZS0+YmFz
ZS5waXhlbF9ibGVuZF9tb2RlOw0KPiAgCXVuc2lnbmVkIGludCBpZ25vcmVfcGl4ZWxfYWxwaGEg
PSAwOw0KPiBAQCAtNTEzLDEyICs1MTQsMTkgQEAgdm9pZCBtdGtfb3ZsX2xheWVyX2NvbmZpZyhz
dHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBpZHgsDQo+ICAJCQlpZ25vcmVfcGl4ZWxf
YWxwaGEgPSBPVkxfQ09OU1RfQkxFTkQ7DQo+ICAJfQ0KPiAgDQo+IC0JaWYgKHBlbmRpbmctPnJv
dGF0aW9uICYgRFJNX01PREVfUkVGTEVDVF9ZKSB7DQo+ICsJLyoNCj4gKwkgKiBUcmVhdCByb3Rh
dGUgMTgwIGFzIGZsaXAgeCArIGZsaXAgeSwgYW5kIFhPUiB0aGUgb3JpZ2luYWwgcm90YXRpb24g
dmFsdWUNCj4gKwkgKiB0byBmbGlwIHggKyBmbGlwIHkgdG8gc3VwcG9ydCBib3RoIGluIHRoZSBz
YW1lIHRpbWUuDQo+ICsJICovDQo+ICsJaWYgKHJvdGF0aW9uICYgRFJNX01PREVfUk9UQVRFXzE4
MCkNCj4gKwkJcm90YXRpb24gXj0gRFJNX01PREVfUkVGTEVDVF9YIHwgRFJNX01PREVfUkVGTEVD
VF9ZOw0KPiArDQo+ICsJaWYgKHJvdGF0aW9uICYgRFJNX01PREVfUkVGTEVDVF9ZKSB7DQo+ICAJ
CWNvbiB8PSBPVkxfQ09OX1ZJUlRfRkxJUDsNCj4gIAkJYWRkciArPSAocGVuZGluZy0+aGVpZ2h0
IC0gMSkgKiBwZW5kaW5nLT5waXRjaDsNCj4gIAl9DQo+ICANCj4gLQlpZiAocGVuZGluZy0+cm90
YXRpb24gJiBEUk1fTU9ERV9SRUZMRUNUX1gpIHsNCj4gKwlpZiAocm90YXRpb24gJiBEUk1fTU9E
RV9SRUZMRUNUX1gpIHsNCj4gIAkJY29uIHw9IE9WTF9DT05fSE9SWl9GTElQOw0KPiAgCQlhZGRy
ICs9IHBlbmRpbmctPnBpdGNoIC0gMTsNCj4gIAl9DQo=

