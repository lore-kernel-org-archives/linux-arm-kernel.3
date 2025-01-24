Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A538C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 09:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SflR29bEnEh6KmRda/hICqbFmGxCBSkLPZHHh3uZlpI=; b=U2J/JIrDOSNBhnmk8U1qabZmPN
	ZsHHOTB6E9aS3lwo/VxIaHpTk7UVRwnH7efrzyMSOmaqakrBv3K8J2BMzkXTvVgmauKe4QbhIfoDc
	NI/fdLej2NcwjDAnW45L+0ZGG99D7QR0Jmt6RwCmTSkLTLFAl3chsvIDn4GL6HAMt/6PTAxETjQsO
	rOjwtPJD2tHAJoZR4u266n3z6mXkakgH+feQhzFCF9cVJ3lmH2FV21DzoTWc/l1c8aAjeRVA0PymV
	OpmraEZaZFqrWvFUyNVuaVqsco/mQ0kbZeDBFT+Axxg0ND2uWpdzrVuLcaO51bHxQDBNzZ4kBNvME
	bf1MIsLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbFg1-0000000EKUT-2ea7;
	Fri, 24 Jan 2025 09:08:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbFYM-0000000EJCx-1cC5;
	Fri, 24 Jan 2025 09:00:39 +0000
X-UUID: a296d3d2da3111ef82ff63e91e7eb18c-20250124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=SflR29bEnEh6KmRda/hICqbFmGxCBSkLPZHHh3uZlpI=;
	b=kpU8qx9D6nsOiab5xdQX+WhsLpuqRS6NF2S4LvYBih5LPxk5++eFRQOL2G3bH7YhNfqMRnNUZLti4rIACwp0mQlmhQ7dgCQyMLE/67XvvJzcTkQJhrcMIxV5/XGeuRk4VO72unhGv0ZhQ/C5USCy+KvUdJvhYDlpDi3LzRGRcJ4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:5305526a-8d35-4806-8046-260402f05e4e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:6ad8a23d-da39-4471-8a46-23da908abe46,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a296d3d2da3111ef82ff63e91e7eb18c-20250124
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 881218066; Fri, 24 Jan 2025 02:00:18 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 24 Jan 2025 17:00:15 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 24 Jan 2025 17:00:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=imY/4CWGoBREYKLxJcU5Q3mVIors7mmO360iE5esX3F3udaJQz0lPdFBPLCqJfh1BPFUGextHPX4ZhqwEFlanaYSK9VxqCyXfQdJVdEJpvRzcgp+UuZRAXPGsbEri0eKHFZ323YYzK+NQCdRYVs9FtLcfLD0dQyRDHgA/1/eucCNJsTP281tcEeQ3c1TQbfRG6tx7zDzYdhPmG7N3IbNPUl++C0a708BddUsuJvDae8UuxHa2LuqX+V5nPg7xCnIs4OGghEl6nKzde3iXiE2a5SJQpPsuQmjire7G7PCkf0ywcNUkCOvxr99ErmlA2VkeR23bA7sqhXaNt6lrdGsRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SflR29bEnEh6KmRda/hICqbFmGxCBSkLPZHHh3uZlpI=;
 b=EsnsPJ4XEQo0/xsQfXbRgezyebE7GJXz4RwF13vAYv1MK/rivsrWvte9EU77hnoG5s5pfE9PgTk+0K1IJ8uLGhtNr+eMeGachDISXol5vxNZ1YTC9IgmD3z3InxWBjXH8it2GD+yCXvl3ypc7ULoWWmUf8mGTflSK8pgrL2OyabMRwMA3i1HIOCQzP3QuDA1LIIhfUQjm5Ad4cBJSD4/LM4WQW32C7oxYxO6ddmnt80xCvWrm13sWuImOSj9zpCHT4sghieYX6FskdHTbfz5Ojf48jsgvdWg6KY/HfU1UXgqbh60YV1/dOuXjZI5ZFmI0sJ8u5eQWrD8RodF8IhWuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SflR29bEnEh6KmRda/hICqbFmGxCBSkLPZHHh3uZlpI=;
 b=faknt5DFcuIKdL4pfpNt5PPbhOOsCXGzY+aR/fNW72kyCF2+tc7HAI3uCrijjqG5aL7hM6NFtY0Icws9hTApFNnTBsEh7EsftBr7bmOJqPr8tUeWMM3m56kB/x2a9pvGm0GBvUVpuvoASmaDj/eiSMuLLjQidgHbxDsU6gBe04Q=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TY0PR03MB8248.apcprd03.prod.outlook.com (2603:1096:405:17::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Fri, 24 Jan
 2025 09:00:13 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 09:00:11 +0000
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
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	=?utf-8?B?TGV3aXMgTGlhbyAo5buW5p+P6YieKQ==?= <Lewis.Liao@mediatek.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, =?utf-8?B?VG9tbXlZTCBDaGVuICjpmbPlvaXoia8p?=
	<TommyYL.Chen@mediatek.com>, =?utf-8?B?SXZlcyBDaGVuamggKOmZs+S/iuW8mCk=?=
	<Ives.Chenjh@mediatek.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
	<Jason-JH.Lin@mediatek.com>, "junzhi.zhao@mediatek.com"
	<junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v5 06/34] drm/mediatek: Add support for MT8195 Digital
 Parallel Interface
Thread-Topic: [PATCH v5 06/34] drm/mediatek: Add support for MT8195 Digital
 Parallel Interface
Thread-Index: AQHbZcrk8H/80B4y10iFgm+9aUHR7LMlsSgA
Date: Fri, 24 Jan 2025 09:00:11 +0000
Message-ID: <c729539dae9bc882574ea9e1048e0fd23b4c5aca.camel@mediatek.com>
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
	 <20250113145232.227674-7-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250113145232.227674-7-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TY0PR03MB8248:EE_
x-ms-office365-filtering-correlation-id: 3d23661b-5ad9-489b-80ac-08dd3c558260
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aUZKSll6VGRvQU0xeGhKWWd5TWlRenZyRktaTHY5R1BUSUdGQXNHTUlUSUZR?=
 =?utf-8?B?bnFic09ETzZ1UmhNaHZtc3k3N0tEbDNGMFNNOTZRSld0N2s0VXpBU1VtTEJN?=
 =?utf-8?B?T0p6dnhMbm13cERveDRjZ2J3T0hVOStqcGFxL1A2Y1pxSVFhd05JNFpMRUt6?=
 =?utf-8?B?UUxEY04yT2xBMGtqRDFENXNOSmhjdGlQMTRYekM2MnhLUUcxeDFYZkszKzdr?=
 =?utf-8?B?cGxvdmVSSzFvalpiUDBpNFkyUEtDVDMvQ2M3ZnRndm5XNHJZRGE1bk8yRXZG?=
 =?utf-8?B?NTJoUmExM0lZS3BWcUNsY2tveGRXczVaWkZ6YjhCNmxhOU04aGEzZWpiTU1u?=
 =?utf-8?B?U29sT1YyZlBtSTRnWlFBNWNnTmJUMitUNG1ZendHbjloOTFpMVoxeFRBMjR1?=
 =?utf-8?B?Z2NKRmJZT1g1eE9oSGdxUEVsKzl3Q0ZsZTE0MmpYSmkxRHh4d3JPcjFMdUxh?=
 =?utf-8?B?T0REekMycGRuQVRFMzR3b0MwMnNSREpzKzAzN25SNWxzS1h6N1dvU0hCbEZk?=
 =?utf-8?B?S3dtVkZBcVpuMFhBNFREcXptSy9tYnpURWp6bE5sanR3M1p0cEVrMUlzU2JL?=
 =?utf-8?B?QmptZEZuaXhQK2VPeGxTLytMSTdQNG9GdmpBeTdVN2pBSjdPT0kyRkwzQWJz?=
 =?utf-8?B?SmZoa0V6WG9LYXh3VmNFTkZkUGhvQjkram9MeW1TZTBoWHlac1hEQkJ6cURz?=
 =?utf-8?B?aDY3N1V6UnJ5elZETHlIR2hZQk5wN2laK2krdk9ydVRjQzBKdHgvVHpzZ3NX?=
 =?utf-8?B?anJvL09hRmxsWWVuajVJQVptU01FcjVVQWdzYmJUNGtwdzd0MllTaDN4MFFR?=
 =?utf-8?B?S0dtdXQxU3VXNklqNlNMc08wVGZYVzhJTzJwUHFwUVJDU3AvT2VFZEROdXpL?=
 =?utf-8?B?N3BDM0dyR1JYSGFyLzBicm1YU0tteDlDMGcxQWFrd1U3a01xR01GUENhWWMw?=
 =?utf-8?B?cjRlK0t1R3NJK3BrMjk2emhVWnJXS0NDWGRmekozRnAydkJmcVlBRjJmZm9Z?=
 =?utf-8?B?QTdxaGR2dm9aWHQ0ZFhuQ2ZUdTAzVFUxQm1kQWFQTk5NRUp0aHphTG0yeG1B?=
 =?utf-8?B?aDA5MWVSZ2x1NFA3SVBQVnlMcGNxVlZuSzNTZ1hoTldpVkVaRXloM0NaN29y?=
 =?utf-8?B?bjIyeVowRytCTU1jYXBCbzY3MnBVdXQ4aWtuNTN2bG9KUi9kMUp1Z3BXQ255?=
 =?utf-8?B?TlB1a092eG45MEd0eDRaWmJ0ck83bzZXMjdweFZaeVVTQStyc0t3SjhWU1kz?=
 =?utf-8?B?RHdRb3d5d3BFcEkvOTlwTGtOazJCaHpuRXkvSEt0czBXMmtEUEdtRnNPdkdQ?=
 =?utf-8?B?Y2dWZHZkdEZ2K0FvU1dvVW1PZVVERGZWSWNvTHdRbmh3YlpJOThZYlRsYTFo?=
 =?utf-8?B?cTJDMmxrQnZCbGFYc1g2VDNhYmVKVHVmQ0haL09FYm1UTEtESFhpYkNSUXVD?=
 =?utf-8?B?WVM4NTJHYWs4UnR0VEZ1dWlDbk5kQWhFaFo0dmNRQjVkNDhaa21zay8ycjBN?=
 =?utf-8?B?ZWV2S3J0SEg1UkpldkErQ3dXQ0VyTXduU25IQkxJM2lPTmdZWGQ2RHhPYUlX?=
 =?utf-8?B?K1VZSWd3WkJXNmFGSjNjeVNZV0Rwd1lWMWxieHRzeGVCbzVjR1FIZDBIMzJR?=
 =?utf-8?B?MEl2SDhVZnBzMDFnOGpCNHVLaHZ6M1B1QWl1REpjeVlwRUE3Q1ZCdTJZU0l6?=
 =?utf-8?B?dm83dTVPbGdwd0RvN2RZY1QzdlVxZDhMV0RDNFlrUEpLQVdZd2J5TW1UblQr?=
 =?utf-8?B?eC9zSzc1YjNIOEVlcmdkU2IwZ2xSaldaSzFacEdDenlMeXE3VnIzWFpTQnpu?=
 =?utf-8?B?cWFqNkVyeXRjNGlHWldUTy9vYXNFK1p5TDhyOG5EaElIcWVIek5HNEcycWxY?=
 =?utf-8?B?bWlqa3ZCMkl6dFFnaUpBaVRXdytURmZ0b0hJV2FvZ3VnRmtyK0pua2dFL3c5?=
 =?utf-8?Q?wzpcJCXyIa0vxdUq3Izs27eeolB6j99y?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RUVvMHRWNk9kNWgwVHN6eGV3MDlNSC9iaDhQOTgrR3cwYlVONzhPNTYxdmxI?=
 =?utf-8?B?dWJCTm5vUmI1S3FNZlk3OExJL1JWVkMzRUdUbkg5bmhBMFBUY3RTNEhhbk1S?=
 =?utf-8?B?L2dISG5OeXNhNWR0bkFPVFVoZjJsQndyNm1ka2IvMXZ3YXpXa0NIc1BXcERT?=
 =?utf-8?B?L3JYNkFldVp6TWh5dERwVkxvQURYVlhTR2lOdytpMVZIRWZoK3NxN09uaTZK?=
 =?utf-8?B?SmxEN2FScGZyeUFJaXRNZndEV3BhcW1ha0FkcjJtams3L0ozaWl0VGJ6a2F4?=
 =?utf-8?B?YXZ5cWEyMC9sb2lLWEQ5T0ZORGdXMlFJVXFSMk5uRHprVlluK1psQVlJVm4z?=
 =?utf-8?B?M1N5b1lkc0FwZ2h5bEFMdlgzT2ZlVFl6NEpMc0FMQTUwUXBRaWcwdExwYjJH?=
 =?utf-8?B?NWNpQnBMaHZtRDVEaUxZSHBpMmpZcGVGQlAwbXNDQ1lmTjBpRnl1QVI5TWdF?=
 =?utf-8?B?UmNvclJ4dFlLU2FOMEZIQUtiSkNpeWZJYSt3a0pGY3lEMTdDQktxRG5RaC9U?=
 =?utf-8?B?QThuRkxzd1VLSm81N3RCdFpMSHhUWnJmYmVRdmplNElmYytvRGhaRTJuc3Uw?=
 =?utf-8?B?ODY3enMzVDJwaWJtR2JEaDRZNEVGaWdtL28rbXFybHNubnZ5MEgwSlJXdytS?=
 =?utf-8?B?WXk4UEpHemJTNFhyNTFSZUducnhIQTlJMENYV0VmOFN5U1c4RysxOWxzTEpT?=
 =?utf-8?B?VjRUaEpPaW54bXFqWWFwSG5OTUVZR1ZRWXJQRTIxcUxpTmhwU1ZFYzJYNktD?=
 =?utf-8?B?N1p6VjVWY2RTSERkUUNHc0dkeTEzanlHdE9KYXdZaXByckdPYjlBUXJHVUkx?=
 =?utf-8?B?OCtOZlZzNFJVV0ttdHFoUkZMalZmbloxUnZLWGZiYjErVVB0d2ozL1ZqdEhD?=
 =?utf-8?B?MGxJN0cyTlgyZ2RCenVQL2YzSHZ1aXRONmNmZWN6OFJOOFJrZnFqYlJ2Q1F0?=
 =?utf-8?B?L292bFBoRm5GY1J2eXJBVTgzL2NqZlJaaHRiKzI3WlhCeUhNRUxTQVUyNU5D?=
 =?utf-8?B?RUROaU4rTGRRNE13RjZleTQrVms4NktMems5MUt2M2RHaHFaOTRCdk1TMFBC?=
 =?utf-8?B?ZU9WQzcvWVp4c0grNGpqT1haVm9tK0R0UjRKSHIwRDhhSktpZkZNbnpydzNR?=
 =?utf-8?B?U00vcU9Ldm5EbEt2L25oODhINEdrWStrOUtPZmdJVUp4K1A1d0JYU3ZNWE8v?=
 =?utf-8?B?dVVOM0phWjdiWXFXN2V6NjZMaWx5d1k2cjRqODBKOEZtckFuVmFvenZycmIv?=
 =?utf-8?B?NmN6MlBuQ1Fpd05NSUVDNFh6YXhxWW40VG4xWkpFdFJOTzQxMjBGeXh4L3hX?=
 =?utf-8?B?V3ZMcHUzY0lMOW9VLzAwZmQ1KzRKbmJZemdFeTJObUhwb1NQMjVkYU8ySmlh?=
 =?utf-8?B?T3M4cnpXZk9JcFY0cTdKZmpIRFVSWUxNcXQzcVVtTlBKNXl0NHN0S21UM3V1?=
 =?utf-8?B?UGFKYzBIaHZyQitTYUdBS3NvbjJSQlZkaXpxOGs1dC92STdmK2RLUUVKUmt3?=
 =?utf-8?B?M2VWOGZSaXJNSXdYdEhoeFMwVTZzRlNjOUU4dkxXMnplVm5MaDhLTGJCVnpu?=
 =?utf-8?B?VEJseXhnYkVDeHphQ3BrbVpFYjkzaXBKOE4wV3hZQ2trOGFtMHFnUHlYVVgz?=
 =?utf-8?B?WGpGOGlXL0dhNkNmdEJpaXpobG40cDlQYS9MNGpHSHNiQkYrdWVqdk9QNjd1?=
 =?utf-8?B?RnozWW02YnVsUDc5V2w2SUxuMTVBMG02b2xHT1ZGQS9zNHg3cjE5THRrUzIw?=
 =?utf-8?B?VHZmaE80OGVQeDJDOU42UVMydk9jb3FNU3ppeXBNVlMrUlFpOEFUeGw3Q2Fk?=
 =?utf-8?B?OUI5R1ZUekpDTVFUeEUwR3FCWVM4WUhUT2FDN24vNE1JMU1DWGdzQlVIRnU2?=
 =?utf-8?B?UDBFaitLN3hKVVNJdTZ2ZVdibkY2eGtKOHdEM1VBZWJKWU16TGJxazBjZUQx?=
 =?utf-8?B?T21vQlpZNFNvRXlrMkowd01WQU53dTJPSlZvcVhlbDE5d2kxZ25Sc2JyTDZz?=
 =?utf-8?B?UzBQeEpJR1laRVVWelYzakpsWWFpcjRRWkttWUtkTWJYdlFVaHA2bGpaenBO?=
 =?utf-8?B?cWlQNk1GMkJyL1dpQ0UrVnRmcGpRZ25vc2l4RGJmYW52RlNtVXlFT3pNZHZY?=
 =?utf-8?Q?xSWx5w8WXn4diwSYjZE6B8ZZ7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4021212473982E479686A45492C75E40@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d23661b-5ad9-489b-80ac-08dd3c558260
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2025 09:00:11.3531
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HaWwf/Ubs4BexfULmwWGJKIYUw1VVrmaIAewTKcA/950zqGx5fMx78kxWFEUe71zlMvK7C9iqsD3TuAArW6Xlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB8248
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_010038_424516_185FBEDC 
X-CRM114-Status: GOOD (  20.21  )
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

SGksIEFuZ2VsbzoNCg0KT24gTW9uLCAyMDI1LTAxLTEzIGF0IDE1OjUyICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBBZGQgc3VwcG9ydCBmb3Ig
dGhlIERQSSBibG9jayBmb3VuZCBpbiB0aGUgTVQ4MTk1IGFuZCBNVDgxODggU29Dcy4NCj4gSW5z
aWRlIG9mIHRoZSBTb0MsIHRoaXMgYmxvY2sgaXMgZGlyZWN0bHkgY29ubmVjdGVkIHRvIHRoZSBI
RE1JIElQLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8g
PGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQo+ICBkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jICAgICAgfCA1NSArKysrKysrKysrKysrKysr
KysrKysrLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaV9yZWdzLmggfCAg
NiArKysNCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jICB8ICAyICsN
Cj4gIDMgZmlsZXMgY2hhbmdlZCwgNTggaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYw0KPiBpbmRleCBiYjFhMTdmMTM4NGIuLmRj
YTgwMWY1ODljOCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cGkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQo+IEBAIC0x
NDUsNiArMTQ1LDcgQEAgc3RydWN0IG10a19kcGlfZmFjdG9yIHsNCj4gICAqIEBjc2NfZW5hYmxl
X2JpdDogRW5hYmxlIGJpdCBvZiBDU0MuDQo+ICAgKiBAcGl4ZWxzX3Blcl9pdGVyOiBRdWFudGl0
eSBvZiB0cmFuc2ZlcnJlZCBwaXhlbHMgcGVyIGl0ZXJhdGlvbi4NCj4gICAqIEBlZGdlX2NmZ19p
bl9tbXN5czogSWYgdGhlIGVkZ2UgY29uZmlndXJhdGlvbiBmb3IgRFBJJ3Mgb3V0cHV0IG5lZWRz
IHRvIGJlIHNldCBpbiBNTVNZUy4NCj4gKyAqIEBpc19pbnRlcm5hbF9oZG1pOiBTcGVjaWZpZXMg
d2hldGhlciB0aGUgRFBJIGlzIGludGVybmFsbHkgY29ubmVjdGVkIHRvIHRoZSBIRE1JIGJsb2Nr
DQoNCk1UODE3MyBIRE1JIGlzIGFsc28gaW50ZXJuYWwgaGRtaSwgc28gSSB0aGluayBtb2RpZmlj
YXRpb24gZm9yIHRoaXMgaXMgbm90IGJlY2F1c2Ugb2YgaW50ZXJuYWwgaGRtaS4NCkZpbmQgb3V0
IHRoZSByZWFzb24gYW5kIHVzZSBhIGNvcnJlY3QgbmFtaW5nLg0KDQo+ICAgKi8NCj4gIHN0cnVj
dCBtdGtfZHBpX2NvbmYgew0KPiAgICAgICAgIGNvbnN0IHN0cnVjdCBtdGtfZHBpX2ZhY3RvciAq
ZHBpX2ZhY3RvcjsNCj4gQEAgLTE2NSw2ICsxNjYsNyBAQCBzdHJ1Y3QgbXRrX2RwaV9jb25mIHsN
Cj4gICAgICAgICB1MzIgY3NjX2VuYWJsZV9iaXQ7DQo+ICAgICAgICAgdTMyIHBpeGVsc19wZXJf
aXRlcjsNCj4gICAgICAgICBib29sIGVkZ2VfY2ZnX2luX21tc3lzOw0KPiArICAgICAgIGJvb2wg
aXNfaW50ZXJuYWxfaGRtaTsNCj4gIH07DQo+IA0KPiAgc3RhdGljIHZvaWQgbXRrX2RwaV9tYXNr
KHN0cnVjdCBtdGtfZHBpICpkcGksIHUzMiBvZmZzZXQsIHUzMiB2YWwsIHUzMiBtYXNrKQ0KPiBA
QCAtNDkzLDYgKzQ5NSw3IEBAIHN0YXRpYyB2b2lkIG10a19kcGlfcG93ZXJfb2ZmKHN0cnVjdCBt
dGtfZHBpICpkcGkpDQo+IA0KPiAgICAgICAgIG10a19kcGlfZGlzYWJsZShkcGkpOw0KPiAgICAg
ICAgIGNsa19kaXNhYmxlX3VucHJlcGFyZShkcGktPnBpeGVsX2Nsayk7DQo+ICsgICAgICAgY2xr
X2Rpc2FibGVfdW5wcmVwYXJlKGRwaS0+dHZkX2Nsayk7DQoNCllvdSBjb250cm9sIHR2ZF9jbGsg
Zm9yIGFsbCBTb0MuDQpEb2VzIG90aGVyIFNvQyBuZWVkIHRoaXMgbW9kaWZpY2F0aW9uPw0KSWYg
c28sIHNlcGFyYXRlIHR2ZF9jbGsgY29udHJvbCB0byBhbm90aGVyIHBhdGNoLg0KDQpSZWdhcmRz
LA0KQ0sNCg0KPiAgICAgICAgIGNsa19kaXNhYmxlX3VucHJlcGFyZShkcGktPmVuZ2luZV9jbGsp
Ow0KPiAgfQ0KPiANCj4gQEAgLTUwOSw2ICs1MTIsMTIgQEAgc3RhdGljIGludCBtdGtfZHBpX3Bv
d2VyX29uKHN0cnVjdCBtdGtfZHBpICpkcGkpDQo+ICAgICAgICAgICAgICAgICBnb3RvIGVycl9y
ZWZjb3VudDsNCj4gICAgICAgICB9DQo+IA0KPiArICAgICAgIHJldCA9IGNsa19wcmVwYXJlX2Vu
YWJsZShkcGktPnR2ZF9jbGspOw0KPiArICAgICAgIGlmIChyZXQpIHsNCj4gKyAgICAgICAgICAg
ICAgIGRldl9lcnIoZHBpLT5kZXYsICJGYWlsZWQgdG8gZW5hYmxlIHR2ZCBwbGw6ICVkXG4iLCBy
ZXQpOw0KPiArICAgICAgICAgICAgICAgZ290byBlcnJfZW5naW5lOw0KPiArICAgICAgIH0NCj4g
Kw0KPiAgICAgICAgIHJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShkcGktPnBpeGVsX2Nsayk7DQo+
ICAgICAgICAgaWYgKHJldCkgew0KPiAgICAgICAgICAgICAgICAgZGV2X2VycihkcGktPmRldiwg
IkZhaWxlZCB0byBlbmFibGUgcGl4ZWwgY2xvY2s6ICVkXG4iLCByZXQpOw0KPiBAQCAtNTE4LDYg
KzUyNyw4IEBAIHN0YXRpYyBpbnQgbXRrX2RwaV9wb3dlcl9vbihzdHJ1Y3QgbXRrX2RwaSAqZHBp
KQ0KPiAgICAgICAgIHJldHVybiAwOw0KPiANCj4gIGVycl9waXhlbDoNCj4gKyAgICAgICBjbGtf
ZGlzYWJsZV91bnByZXBhcmUoZHBpLT50dmRfY2xrKTsNCj4gK2Vycl9lbmdpbmU6DQo+ICAgICAg
ICAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRwaS0+ZW5naW5lX2Nsayk7DQo+ICBlcnJfcmVmY291
bnQ6DQo+ICAgICAgICAgZHBpLT5yZWZjb3VudC0tOw0KPiBAQCAtNTg1LDcgKzU5Niw5IEBAIHN0
YXRpYyBpbnQgbXRrX2RwaV9zZXRfZGlzcGxheV9tb2RlKHN0cnVjdCBtdGtfZHBpICpkcGksDQo+
ICAgICAgICAgc3RydWN0IHZpZGVvbW9kZSB2bSA9IHsgMCB9Ow0KPiANCj4gICAgICAgICBkcm1f
ZGlzcGxheV9tb2RlX3RvX3ZpZGVvbW9kZShtb2RlLCAmdm0pOw0KPiAtICAgICAgIG10a19kcGlf
c2V0X3BpeGVsX2NsayhkcGksICZ2bSwgbW9kZS0+Y2xvY2spOw0KPiArDQo+ICsgICAgICAgaWYg
KCFkcGktPmNvbmYtPmlzX2ludGVybmFsX2hkbWkpDQo+ICsgICAgICAgICAgICAgICBtdGtfZHBp
X3NldF9waXhlbF9jbGsoZHBpLCAmdm0sIG1vZGUtPmNsb2NrKTsNCj4gDQo+ICAgICAgICAgZHBp
X3BvbC5ja19wb2wgPSBNVEtfRFBJX1BPTEFSSVRZX0ZBTExJTkc7DQo+ICAgICAgICAgZHBpX3Bv
bC5kZV9wb2wgPSBNVEtfRFBJX1BPTEFSSVRZX1JJU0lORzsNCj4gQEAgLTY0OCwxMCArNjYxLDE4
IEBAIHN0YXRpYyBpbnQgbXRrX2RwaV9zZXRfZGlzcGxheV9tb2RlKHN0cnVjdCBtdGtfZHBpICpk
cGksDQo+ICAgICAgICAgaWYgKGRwaS0+Y29uZi0+c3VwcG9ydF9kaXJlY3RfcGluKSB7DQo+ICAg
ICAgICAgICAgICAgICBtdGtfZHBpX2NvbmZpZ195Y19tYXAoZHBpLCBkcGktPnljX21hcCk7DQo+
ICAgICAgICAgICAgICAgICBtdGtfZHBpX2NvbmZpZ18ybl9oX2ZyZShkcGkpOw0KPiAtICAgICAg
ICAgICAgICAgbXRrX2RwaV9kdWFsX2VkZ2UoZHBpKTsNCj4gKyAgICAgICAgICAgICAgIC8qIERQ
SSBjYW4gY29ubmVjdCB0byBlaXRoZXIgYW4gZXh0ZXJuYWwgYnJpZGdlIG9yIHRoZSBpbnRlcm5h
bCBIRE1JIGVuY29kZXIgKi8NCj4gKyAgICAgICAgICAgICAgIGlmIChkcGktPmNvbmYtPmlzX2lu
dGVybmFsX2hkbWkpIHsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgbXRrX2RwaV9tYXNrKGRw
aSwgRFBJX0NPTiwgRFBJX09VVFBVVF8xVDFQX0VOLCBEUElfT1VUUFVUXzFUMVBfRU4pOw0KPiAr
ICAgICAgICAgICAgICAgICAgICAgICBtdGtfZHBpX21hc2soZHBpLCBEUElfQ09OLA0KPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZHBpLT5jb25mLT5pbnB1dF8ycGl4ZWwg
PyBEUElfSU5QVVRfMlBfRU4gOiAwLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgRFBJX0lOUFVUXzJQX0VOKTsNCj4gKyAgICAgICAgICAgICAgIH0gZWxzZSB7DQo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIG10a19kcGlfZHVhbF9lZGdlKGRwaSk7DQo+ICsgICAgICAg
ICAgICAgICB9DQo+ICAgICAgICAgICAgICAgICBtdGtfZHBpX2NvbmZpZ19kaXNhYmxlX2VkZ2Uo
ZHBpKTsNCj4gICAgICAgICB9DQo+IC0gICAgICAgaWYgKGRwaS0+Y29uZi0+aW5wdXRfMnBpeGVs
KSB7DQo+ICsgICAgICAgaWYgKGRwaS0+Y29uZi0+aW5wdXRfMnBpeGVsICYmICFkcGktPmNvbmYt
PmlzX2ludGVybmFsX2hkbWkpIHsNCj4gICAgICAgICAgICAgICAgIG10a19kcGlfbWFzayhkcGks
IERQSV9DT04sIERQSU5URl9JTlBVVF8yUF9FTiwNCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBEUElOVEZfSU5QVVRfMlBfRU4pOw0KPiAgICAgICAgIH0NCj4gQEAgLTkyMCwxNCArOTQx
LDE2IEBAIHZvaWQgbXRrX2RwaV9zdGFydChzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICB7DQo+ICAg
ICAgICAgc3RydWN0IG10a19kcGkgKmRwaSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiANCj4g
LSAgICAgICBtdGtfZHBpX3Bvd2VyX29uKGRwaSk7DQo+ICsgICAgICAgaWYgKCFkcGktPmNvbmYt
PmlzX2ludGVybmFsX2hkbWkpDQo+ICsgICAgICAgICAgICAgICBtdGtfZHBpX3Bvd2VyX29uKGRw
aSk7DQo+ICB9DQo+IA0KPiAgdm9pZCBtdGtfZHBpX3N0b3Aoc3RydWN0IGRldmljZSAqZGV2KQ0K
PiAgew0KPiAgICAgICAgIHN0cnVjdCBtdGtfZHBpICpkcGkgPSBkZXZfZ2V0X2RydmRhdGEoZGV2
KTsNCj4gDQo+IC0gICAgICAgbXRrX2RwaV9wb3dlcl9vZmYoZHBpKTsNCj4gKyAgICAgICBpZiAo
IWRwaS0+Y29uZi0+aXNfaW50ZXJuYWxfaGRtaSkNCj4gKyAgICAgICAgICAgICAgIG10a19kcGlf
cG93ZXJfb2ZmKGRwaSk7DQo+ICB9DQo+IA0KPiAgdW5zaWduZWQgaW50IG10a19kcGlfZW5jb2Rl
cl9pbmRleChzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+IEBAIC0xMDIyLDYgKzEwNDUsOCBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IG10a19kcGlfZmFjdG9yIGRwaV9mYWN0b3JfbXQ4MTk1X2RwX2ludGZb
XSA9IHsNCj4gICAgICAgICB7IDcwMDAwIC0gMSwgNCB9LCB7IDIwMDAwMCAtIDEsIDIgfSwgeyBV
MzJfTUFYLCAxIH0NCj4gIH07DQo+IA0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZHBpX2Zh
Y3RvciBkcGlfZmFjdG9yX210ODE5NV9kcGkgPSB7IFUzMl9NQVgsIDEgfTsNCj4gKw0KPiAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBtdGtfZHBpX2NvbmYgbXQ4MTczX2NvbmYgPSB7DQo+ICAgICAgICAg
LmRwaV9mYWN0b3IgPSBkcGlfZmFjdG9yX210ODE3MywNCj4gICAgICAgICAubnVtX2RwaV9mYWN0
b3IgPSBBUlJBWV9TSVpFKGRwaV9mYWN0b3JfbXQ4MTczKSwNCj4gQEAgLTExMTQsNiArMTEzOSwy
NSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kcGlfY29uZiBtdDgxOTJfY29uZiA9IHsNCj4g
ICAgICAgICAuY3NjX2VuYWJsZV9iaXQgPSBDU0NfRU5BQkxFLA0KPiAgfTsNCj4gDQo+ICtzdGF0
aWMgY29uc3Qgc3RydWN0IG10a19kcGlfY29uZiBtdDgxOTVfY29uZiA9IHsNCj4gKyAgICAgICAu
ZHBpX2ZhY3RvciA9ICZkcGlfZmFjdG9yX210ODE5NV9kcGksDQo+ICsgICAgICAgLm51bV9kcGlf
ZmFjdG9yID0gMSwNCj4gKyAgICAgICAubWF4X2Nsb2NrX2toeiA9IDU5NDAwMCwNCj4gKyAgICAg
ICAub3V0cHV0X2ZtdHMgPSBtdDgxODNfb3V0cHV0X2ZtdHMsDQo+ICsgICAgICAgLm51bV9vdXRw
dXRfZm10cyA9IEFSUkFZX1NJWkUobXQ4MTgzX291dHB1dF9mbXRzKSwNCj4gKyAgICAgICAucGl4
ZWxzX3Blcl9pdGVyID0gMSwNCj4gKyAgICAgICAuaXNfY2tfZGVfcG9sID0gdHJ1ZSwNCj4gKyAg
ICAgICAuc3dhcF9pbnB1dF9zdXBwb3J0ID0gdHJ1ZSwNCj4gKyAgICAgICAuc3VwcG9ydF9kaXJl
Y3RfcGluID0gdHJ1ZSwNCj4gKyAgICAgICAuZGltZW5zaW9uX21hc2sgPSBIUFdfTUFTSywNCj4g
KyAgICAgICAuaHZzaXplX21hc2sgPSBIU0laRV9NQVNLLA0KPiArICAgICAgIC5jaGFubmVsX3N3
YXBfc2hpZnQgPSBDSF9TV0FQLA0KPiArICAgICAgIC55dXY0MjJfZW5fYml0ID0gWVVWNDIyX0VO
LA0KPiArICAgICAgIC5jc2NfZW5hYmxlX2JpdCA9IENTQ19FTkFCTEUsDQo+ICsgICAgICAgLmlz
X2ludGVybmFsX2hkbWkgPSB0cnVlLA0KPiArICAgICAgIC5pbnB1dF8ycGl4ZWwgPSB0cnVlLA0K
PiArfTsNCj4gKw0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZHBpX2NvbmYgbXQ4MTk1X2Rw
aW50Zl9jb25mID0gew0KPiAgICAgICAgIC5kcGlfZmFjdG9yID0gZHBpX2ZhY3Rvcl9tdDgxOTVf
ZHBfaW50ZiwNCj4gICAgICAgICAubnVtX2RwaV9mYWN0b3IgPSBBUlJBWV9TSVpFKGRwaV9mYWN0
b3JfbXQ4MTk1X2RwX2ludGYpLA0KPiBAQCAtMTIxNyw2ICsxMjYxLDcgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXRrX2RwaV9vZl9pZHNbXSA9IHsNCj4gICAgICAgICB7IC5j
b21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4OC1kcC1pbnRmIiwgLmRhdGEgPSAmbXQ4MTk1X2Rw
aW50Zl9jb25mIH0sDQo+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTIt
ZHBpIiwgLmRhdGEgPSAmbXQ4MTkyX2NvbmYgfSwNCj4gICAgICAgICB7IC5jb21wYXRpYmxlID0g
Im1lZGlhdGVrLG10ODE5NS1kcC1pbnRmIiwgLmRhdGEgPSAmbXQ4MTk1X2RwaW50Zl9jb25mIH0s
DQo+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTUtZHBpIiwgLmRhdGEg
PSAmbXQ4MTk1X2NvbmYgfSwNCj4gICAgICAgICB7IC8qIHNlbnRpbmVsICovIH0sDQo+ICB9Ow0K
PiAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgbXRrX2RwaV9vZl9pZHMpOw0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGlfcmVncy5oIGIvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcGlfcmVncy5oDQo+IGluZGV4IGEwYjFkMThiYmJmNy4uM2MyNGQ5
ZTlmMjQxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaV9y
ZWdzLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGlfcmVncy5oDQo+
IEBAIC00MCw2ICs0MCwxMiBAQA0KPiAgI2RlZmluZSBGQUtFX0RFX0xFVkVOICAgICAgICAgICAg
ICAgICAgQklUKDIxKQ0KPiAgI2RlZmluZSBGQUtFX0RFX1JPREQgICAgICAgICAgICAgICAgICAg
QklUKDIyKQ0KPiAgI2RlZmluZSBGQUtFX0RFX1JFVkVOICAgICAgICAgICAgICAgICAgQklUKDIz
KQ0KPiArDQo+ICsvKiBEUElfQ09OOiBEUEkgaW5zdGFuY2VzICovDQo+ICsjZGVmaW5lIERQSV9P
VVRQVVRfMVQxUF9FTiAgICAgICAgICAgICBCSVQoMjQpDQo+ICsjZGVmaW5lIERQSV9JTlBVVF8y
UF9FTiAgICAgICAgICAgICAgICAgICAgICAgIEJJVCgyNSkNCj4gKw0KPiArLyogRFBJX0NPTjog
RFBJTlRGIGluc3RhbmNlcyAqLw0KPiAgI2RlZmluZSBEUElOVEZfWVVWNDIyX0VOICAgICAgICAg
ICAgICAgQklUKDI0KQ0KPiAgI2RlZmluZSBEUElOVEZfQ1NDX0VOQUJMRSAgICAgICAgICAgICAg
QklUKDI2KQ0KPiAgI2RlZmluZSBEUElOVEZfSU5QVVRfMlBfRU4gICAgICAgICAgICAgQklUKDI5
KQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KPiBpbmRleCBmMjJhZDI4
ODI2OTcuLjc3MmMzZDBmNWQxNCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZHJ2LmMNCj4gQEAgLTgxMCw2ICs4MTAsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZCBtdGtfZGRwX2NvbXBfZHRfaWRzW10gPSB7DQo+ICAgICAgICAgICAuZGF0YSA9ICh2
b2lkICopTVRLX0RQSSB9LA0KPiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4
MTk1LWRwLWludGYiLA0KPiAgICAgICAgICAgLmRhdGEgPSAodm9pZCAqKU1US19EUF9JTlRGIH0s
DQo+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTUtZHBpIiwNCj4gKyAg
ICAgICAgIC5kYXRhID0gKHZvaWQgKilNVEtfRFBJIH0sDQo+ICAgICAgICAgeyAuY29tcGF0aWJs
ZSA9ICJtZWRpYXRlayxtdDI3MDEtZHNpIiwNCj4gICAgICAgICAgIC5kYXRhID0gKHZvaWQgKilN
VEtfRFNJIH0sDQo+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtZHNp
IiwNCj4gLS0NCj4gMi40Ny4wDQo+IA0KDQo=

