Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2886C369D2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 05:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cCwV/wTVjWh6G0PztVVI98X1lPgPM4EUM3gKfeDlHjk=; b=ZuSahLFVLW3RBbtIQSVsitsb/x
	XSFH/LQEk7yRqCIuXWJXS1Mt8cW2HRWJN/S4MbUk47jaRnbM4XxgYgNnhTs6RYHRw0/Tt8LJ+Jb6Z
	JErNno8O979vtnNMJt0Tw5o7IE4BGALi6G4jeWHyqmdAFSiDfnaSdJxSndpyOxw/yP5cLyWxDYN1V
	qo8g6dDBnismuQK2h3ZNFT8kY7ZsF7Twaj5CL/ok8XbVYOmxZjLHWaSraSGSX5JaGpIO5gLjAYARD
	zX1eyy2KTDUVl7CLfLddfQlDPwa5i7KpxU06rFEhjoyGujezbhcrzCuML1JIqOakBikaNjf1qenac
	YqLPLbdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6jPA-00000003bj4-2CuB;
	Mon, 21 Apr 2025 05:09:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6jNI-00000003bWf-1zzn;
	Mon, 21 Apr 2025 05:07:21 +0000
X-UUID: 7d3aa38a1e6e11f0a2405d5ef59ce188-20250420
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=cCwV/wTVjWh6G0PztVVI98X1lPgPM4EUM3gKfeDlHjk=;
	b=MauOvy+87zUZgqvJYxQ45IKqB4LLkB56vVGL2HV05gYIUQZiILfIPdzEGSL39KWko6bfoeT6AO+LtDjTk1PGt3tLl+BTid2pj3cPPGhrFoSmCHisb9jzKBZf2UJLv0g5ZKvYSdu8hXXZt3qAEH3GmcQrx0JpEeMnFig816up5jE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:5cdde46d-74e7-48e0-9227-030005ce5577,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:e7794fa6-c619-47e3-a41b-90eedbf5b947,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7d3aa38a1e6e11f0a2405d5ef59ce188-20250420
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 203755748; Sun, 20 Apr 2025 22:07:14 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 21 Apr 2025 13:07:11 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 21 Apr 2025 13:07:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VtK8fJX2XS+lsLYSYuRn1zbJyECXEaShEiasdCCVmVKy/nFpH2Ib9I9lXcZqb2PGAaJtxzAINrR4d2A+ozYTzoxd64qWPQBUzaoBfVyUri4eSmRw5F/WZnxXn6CMJ+5CsLDrFC2sudGowmHtEMVnM6bVKPqmWJ/6Wq/p6qTW7duQLkmGv0HkrUjoDnn5GkUR6r54AhOOy08ic3iSa3yFcCLmGKBcTMx6ZhsiHsgjFCNs6aRNQxvyaLjr7utXHRz5EOogYbUVBVU8xzd2iHzOBS3L53C4Rpno3Jf4RlPGp2fDPEzlCwT69ZkaYW1/R9qTPEXB3E1gSl/SLEYxSti8Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCwV/wTVjWh6G0PztVVI98X1lPgPM4EUM3gKfeDlHjk=;
 b=JUOdadFqbY7q0fswwOMsEUbZ/sStiElrZhSUi7J9fu/qBwt7zTXYu0/B9AfommYFSiCuBYH3H61/43WyKhe5F5z0efD4G3MHR2ZKqCy4yp8eKBmcvfPRcUaD4VkZATMU9vrdHtHdmyfvWDVAHV6IRZx6QLaoOAID8E/vXEMIdc2Yh9dNiJa5FcIpRV31S7BPS8qWD3WH38/LoxGQ3fWYhSoLKmbjlhnUQFqHPdjq4kIPMQRn0CB++EfLDAbkNaH8MYtNJn3zp6EoYXWNy23fU17aKkLZPZ2wQkox1yy2vLZa+uB/HuroWiwwl8/lHhCUcfSBn/k4jGfC6LsFn9MMJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cCwV/wTVjWh6G0PztVVI98X1lPgPM4EUM3gKfeDlHjk=;
 b=VElYDUCmA6Xjlh8zutiUD4sLmS1aruUyg1C1hUS9cPhwJHL/Z1XgGlW1lqbpKDQh8RTGaaQV7CnsfQTj+ZB9hxynTdUe8CfTfT3hP53g1qOXsP7/L51vd7abDwHrrQyiapyGXskhH9sBG4KdvJIt7lRTYBfgGPtXKQQqdgLkXl8=
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com (2603:1096:101:83::7)
 by TYZPR03MB7553.apcprd03.prod.outlook.com (2603:1096:400:421::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Mon, 21 Apr
 2025 05:07:09 +0000
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba]) by SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba%3]) with mapi id 15.20.8632.035; Mon, 21 Apr 2025
 05:07:08 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>,
	=?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>,
	"kishon@kernel.org" <kishon@kernel.org>, "tzimmermann@suse.de"
	<tzimmermann@suse.de>, "simona@ffwll.ch" <simona@ffwll.ch>,
	"mripard@kernel.org" <mripard@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?QmluY2FpIExpdSAo5YiY5b2s5omNKQ==?= <Bincai.Liu@mediatek.com>,
	=?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, "vkoul@kernel.org" <vkoul@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/5] dt-bindings: dvo: mediatek: add dvo yaml for mt8196
Thread-Topic: [PATCH 2/5] dt-bindings: dvo: mediatek: add dvo yaml for mt8196
Thread-Index: AQHbsC6nBq2GF7QIRUqaX2yXmfTM9rOtlheA
Date: Mon, 21 Apr 2025 05:07:08 +0000
Message-ID: <8ae9c99227fbfedafb4b118578e0228905d2f9d5.camel@mediatek.com>
References: <20250418065313.8972-1-bincai.liu@mediatek.com>
	 <20250418065313.8972-3-bincai.liu@mediatek.com>
In-Reply-To: <20250418065313.8972-3-bincai.liu@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6626:EE_|TYZPR03MB7553:EE_
x-ms-office365-filtering-correlation-id: e044f321-0825-4576-6a02-08dd80925e06
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?enVNd0dpMWdTMWNsSXd5ZUlhd25zdmhaYjNIcUh2L1o4MlpValRtQzV6bHh5?=
 =?utf-8?B?OUVhV29hRzZXM2hwSGpDSXhCQStlSTVBaGZ5YjhsNXFkZVBPSnBnSmhLSXNH?=
 =?utf-8?B?bDZWTlBncVFkeHVGZWVsSGVZY0V2MDFndVBvZnFHT2o4cDNtWFJFS2twUHgv?=
 =?utf-8?B?LzJVTWtpaWMwNXRIcjNPZWRBRVNVNVNMUlFPd3l6VHZsSlAzNUo2eDlQVHN0?=
 =?utf-8?B?MHFsYVFISEQ2dUg0dW9FZDVUbVloYUc5dmR3azdWdng0cEpNby9EOVdXbExz?=
 =?utf-8?B?UExoWFkwTDBUWHowY2o0KzNjQ3Vxam1FVVJJdWszc010L1FRZk1tY0pVd0Jt?=
 =?utf-8?B?ZjFGTUtzbWNmb1hhVG5uLzczRnhmUkJhR2Ntc2lrWmNXOGJXb2hZUHJkTVY1?=
 =?utf-8?B?Z1JDQWROT1M4VXVsdXBiclpWZXhVZXpQYXlYbzlzU2ZDTEwzcFNPckd0Z2JV?=
 =?utf-8?B?NisrT0lUTTV6WGErQVJrZTc0d2JhazhXQ2JLakp5L1IxMkRnaUFCN0JDR1BE?=
 =?utf-8?B?L056R29ZbnUvYlZzdWVvRzVSZmRoUjRZT1F5Rk1mTC9UMUF4TzdRUy9OTmwr?=
 =?utf-8?B?YytUbGtVdGVMTUcyZnpTNVNZWFRqbmpVOVBsY01IMTJOSkt2NXZXWVFHczBS?=
 =?utf-8?B?TnNxVVlaQmFYNUN3azQyZWZidVljclJzT2Zva2tPOUN0MGF4YVM1bitvUFFV?=
 =?utf-8?B?bi81WjNabHQwaHZJcUdYSXhRd0RtREtTTWV1NEpkdjVaVU1vZnloZDRVTGVL?=
 =?utf-8?B?Qk9Fakk1V3daWjR1NzdKeDBzOFRWaGdBM1ZGdjRZY2ZreDIxR1NXMTM2bzdt?=
 =?utf-8?B?Y3pUekkxTkZFT2dSLzlzQjl2SG1Kc2FpNEE1REUxYjdobjU4ME5hYnpleEFk?=
 =?utf-8?B?aGU5ZFIxZTEzTWJiTm9MVU5vUFpOaW5KVzN5VmgvSXcrbjB1cFZXcC9ZclRz?=
 =?utf-8?B?T2kzZHIrSlFjMXJuSVZRa0kyMXZjcHFISlo5Vk1USWdtL1M4NWE4MG5FVHhv?=
 =?utf-8?B?Ym1raVoxbHFSN00xZFA3VFlEZ2g4MDA1a0hFWVA0ZE1HQ2V3K2NFcmxkRlhW?=
 =?utf-8?B?bEd5NDJSM1dnUjZTU21Kd3U5MXErQzVLajVTd2p3OFZyUDB4djdOMmliejlB?=
 =?utf-8?B?NXk0WTYwR25PUk1xRFpyUnFEcHFmcGNPVldTUXZNSWswTy9EKythUXVEU0Uw?=
 =?utf-8?B?NVRXb3ViNVUva2R5MFdGMHhRdmxrTWRraHdwSTd3TWlGUzVtc3JkVWRPeDBj?=
 =?utf-8?B?QkgvakEyaTZIdXVhWjhtcENUTHFqWDE2bmVGUXV3THlqaWVWM0pxYzJBaVMv?=
 =?utf-8?B?UUgwRDhmLzNvMTZXUDIwYmdSN2tFSjhBTmxZc2liMlB4ZlpsVFVlVGd5dnRO?=
 =?utf-8?B?TnZ1QVAwNTE3YmNJUHg3eFdWRzZYK2VnRSt1TWZvaERBbG83V1hQN1FlVDAz?=
 =?utf-8?B?U2N2MkxHTTYwYldOVkhUOGx6QjRXWkt6bm5TMmVaejFFcEQxYVJuaVRHYWln?=
 =?utf-8?B?SzJLNnlodWQ0NHBySzdnaFRScGR6aUZyKzQ3RVZpbFFvdXRNSzdNOGpDcG9r?=
 =?utf-8?B?cTJ2TG8wR2dwQmxxc0VjWGx4OXJJK0ZCV1pOa2Q4cDhWc3U1UFV3dHZ5TkJz?=
 =?utf-8?B?cmw4RDh0VG5ad1NENG9HMGJ1QXhqSmdLMW15K29OMHkxOFBiaWFDaWNqS2gr?=
 =?utf-8?B?Q0w5bUxwaDF6KzlhRHNrTG5yTkV5ZFVjcjBOM2lJMDFYQ0NNbloxYm9wa2Nt?=
 =?utf-8?B?dXprNzlsUkl4SUJ1cmNwWU40OHNScWlZY2k2NGZPRUtOUitiWHo2ek5zY3lH?=
 =?utf-8?B?UlhvWExKY2NZMTg3NXBKL2dPanFBL3E5MmpBbGwyTDBCOTdndWhwY3F4M0RQ?=
 =?utf-8?B?RGZpRERwWUZveDJXWDltcDEvcE50NjgyT3ZpTElRUGFJaVVjZCtISlRNVHJ2?=
 =?utf-8?B?Vm5JMGR6S2tORGZTUEdPell1YTUvTlFhUnNLMU42TUxzNklmaUtmMHV3K1M3?=
 =?utf-8?Q?GyIwOG2fzUr4CQ5oLybwFXoaYrIz9Q=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB6626.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RmNsR3R5eE90WU9xWSs1Y3ZacmRTdkVWU3dXSEE0RVJRVWlGczg0M0t2d1NQ?=
 =?utf-8?B?dnFTeDZORDJ1TG94alVBRlA2Q0IzUnF6Rk92RHk2UkRCSHF1K25nY282RnAr?=
 =?utf-8?B?UHY2Um5VVGhHSkJTK1hrS2VjR1pJOVN0cWkyT1poVTVxbUoxbllZSHZoOFEr?=
 =?utf-8?B?Q1BITzdCTlVpR3Z4YWN0Y1RGM1pSWkxBcFpYeEloalBDUEhCN1dpcjJFb2hC?=
 =?utf-8?B?RDV4c3VVMmV4LzVPZlV2ODVnMjdYTUFYeEE4T1E0czFQdURVeW5OU3Urb3pt?=
 =?utf-8?B?YkxjaHZ5bE1kOVowYm9NZjlZVjY0cGhVRlFYd3JSTmFaQ0FKdTVJa1pCalRq?=
 =?utf-8?B?V0g1U1RxbWlvNUpGMDdrQVpqbDJhNGc3WnR3TWZjeGYvUm1mdEhUY0VYWXdm?=
 =?utf-8?B?M24yK0tVR3VsZWdOT0pyTGFTOFdvV3lCZE5GRWdsSnJPc3VRa3U4N0lSU3Mz?=
 =?utf-8?B?SmcvQklVQ0dKNU5JcFQzRDV6USsxTWovUTkyWGVzby85Y1dKN1VPRzB4dU4y?=
 =?utf-8?B?QTVVZTd2NkVSUEZsL0xCRURKVElDaUN6K2FpMGlCVDNxaUljeEZJM2dvSHNj?=
 =?utf-8?B?QnQ3YnlzeHQwRjZPNFgwU0UyUzZRcm93QW0veGp4eVdxbEpFd3BBaVVJVEZO?=
 =?utf-8?B?dVRzUmNTMk1yVEx4UE5XVkp4VE9mUkkvQjZmbTFjZ00wTUVTeGxpYXM3WEE4?=
 =?utf-8?B?ZExvY1dCK2graklZVW83MXR5NkN6aUJpL29yY2hWUVA5dDIzb1JSNnk2Y3Uw?=
 =?utf-8?B?bis3QVg3cHNuWjFXQTVGZlFaQW0wN1VyRHlXbGVJU245dUQrN3daMmdBRUhO?=
 =?utf-8?B?d3BrVEkvaWFWbHRBa3g2bzh3cit1bGdRVFd0ZDNCN1h1WVROb2YyMmtzL2l1?=
 =?utf-8?B?YzlWU3V0WWEzeENqdzBkd3p3WnBvQ3p6UG5CZFQrKy9sa3ZBRFI4NkdDcm1I?=
 =?utf-8?B?ZFhXZlZWMllpL29mSmxORm9QRDJGTkgzaXNHQVQ3ZTlQRlQrbGxyMWljQ1k1?=
 =?utf-8?B?elRhazFEK1lCbnFqdGZGNmRWYm9xVU5FTWptVzdVRkQrUG9Mcm10S0dvZ3k1?=
 =?utf-8?B?WC9ZMFRBdWZRanRJMjlaMnZDN3I2czg1NUh5bnh1Sml1ckJjREY4cDVHU3hZ?=
 =?utf-8?B?b3Z3SUlaNWQyVzF6RWYrTDZ6ZFMzVDM2c2hURlVYb1A3K2hiNFFtSEtuKys5?=
 =?utf-8?B?VWRMUGhtblF6dEpUVVVtUlpWMFdHL1ZXUFVkeXVVS0Q3allNcm5EUFJIS1o4?=
 =?utf-8?B?dVFKSjM4M0o3RzVGRlBPYW5TeUovVkJPT21YK3FoZDZJNTdYK2gxQUJXclNM?=
 =?utf-8?B?SGIvK2d3T3FJbkNZd1k4bnI1cWNDL0VzcU1JYzRzbGphOTc5eDUvTyt4anF2?=
 =?utf-8?B?dThxVkdxLzdqR2RDSnpONFQ2THdOcVBQOFpqbWpwM0hrbnFIZS9jRFlvV09y?=
 =?utf-8?B?eVpBK0poc0xRaXFSYlFCM3N0VXhPbm5yTjlVNXpDVWVVajh6Q1VzVUxGTjNu?=
 =?utf-8?B?elkxcjlwL2JvZm9oZm12cndjNW5nSTZQNFg3T0FXcERqb1Y0ZXdMWExxUjVH?=
 =?utf-8?B?bzBBOHlTR2F2QXg5cExaS0QxOGUrQ2FnUG1xQitSTVc5NXZvbWJNYktzZ3Ew?=
 =?utf-8?B?VE9VQXozb0FSc05MTmZjNXc5eDMrUTh5eUhWNG5YTk5BbVg3MlBjMm5KZjZ1?=
 =?utf-8?B?NC84UEpjOFZja29TQy9YTmVtcjdPWFBma3F6aHUvME1OblBQV1RkRzk5RFNN?=
 =?utf-8?B?dkpVR1h3dlhUYXpFSUtVVnd1OGF2a3puVEQxV2ZGZXNocmtQeDAxclJkM0ww?=
 =?utf-8?B?aTZ3bC9ldW9lTVNVOVNWL2dNNDltVk05dFpGRWJkNXl1WTc3bTNzTzM1bTYy?=
 =?utf-8?B?cjgzbkJNTVBsWTFiZWg4ZW5nTkU5NExWeGgzeFh6a1NvanRiOXhuUGdYVG9L?=
 =?utf-8?B?N3duWURHY0RqU2t3RUxTbno3cG85QWU2NnRZNGtvVjVoQUxhaEFzVVcvR1hS?=
 =?utf-8?B?VVlENzFpcWNPOU5jUnMrZ1RGay8xam9ObWxtWjBNdWZXdjBVQ2x0UnVCRGZh?=
 =?utf-8?B?V1FLMU5mTldFRnR5S3FJSDB3VzVWZCs1SlpZOGVpNnB6WGdSK09LVzV0dGp5?=
 =?utf-8?Q?adSfnhl9dqTx4R15cXhy1FALY?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6E1AE18E617D24FAC9AFC8CDC406582@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6626.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e044f321-0825-4576-6a02-08dd80925e06
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2025 05:07:08.7148
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dy6uF98JyU7ubYLaGwrqfjaScI6Sl1sB4pknUEcLihNOzB3PHkMlbdDN6OLTyFJDNwrVGqCTgz80UCnVro/wxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7553
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_220720_568383_2A686918 
X-CRM114-Status: GOOD (  12.76  )
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

T24gRnJpLCAyMDI1LTA0LTE4IGF0IDE0OjUyICswODAwLCBCaW5jYWkgTGl1IHdyb3RlOg0KPiBB
ZGQgY29tcGF0aWJsZSBzdHJpbmcgdG8gc3VwcG9ydCBkdm8gZm9yIE1UODE5Ni4NCg0KU2F5IHNv
bWV0aGluZyBhYm91dCBkdm8uDQpXaGF0IGRvZXMgJ2R2bycgbWVhbj8NCldoYXQncyB0aGUgbXQ4
MTk2LWVkcC1kdm8gcHJpbWFyeSBuZXcgZnVuY3Rpb24/DQoNClJlZ2FyZHMsDQpDSw0KDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBCaW5jYWkgTGl1IDxiaW5jYWkubGl1QG1lZGlhdGVrLmNvbT4NCj4g
LS0tDQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVr
LGRwaS55YW1sICAgICAgIHwgMSArDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykN
Cj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9tZWRpYXRlay9tZWRpYXRlayxkcGkueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRwaS55YW1sDQo+IGluZGV4IGI2
NTlkNzkzOTNhOC4uNGY4OTdmMDVjYjM2IDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkcGkueWFtbA0KPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9t
ZWRpYXRlayxkcGkueWFtbA0KPiBAQCAtMjgsNiArMjgsNyBAQCBwcm9wZXJ0aWVzOg0KPiAgICAg
ICAgICAgIC0gbWVkaWF0ZWssbXQ4MTkyLWRwaQ0KPiAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4
MTk1LWRwLWludGYNCj4gICAgICAgICAgICAtIG1lZGlhdGVrLG10ODE5NS1kcGkNCj4gKyAgICAg
ICAgICAtIG1lZGlhdGVrLG10ODE5Ni1lZHAtZHZvDQo+ICAgICAgICAtIGl0ZW1zOg0KPiAgICAg
ICAgICAgIC0gZW51bToNCj4gICAgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDY3OTUtZHBpDQoN
Cg==

