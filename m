Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A8BD3C92D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 16:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x3pj2iNo1vRlaqUY/804p/ntnGBU7rFigj8vdyor0y4=; b=JDjNipFtudIMRqVo8GkFI/lok2
	1/JeaUeDvXKoNoezq+LDPrK7YNOK3cnRK8D46I3sOJ0z8d0FXcfrF7RYXvvzhTE/CwjbsaA4Vtn6I
	ypj24p4QKBBGuKJ/A8U4ipjfwGYFOO3WXQA5IqCV3x8cj1fnQ6igmc5fh7TityxzMNe3yoiSg9lsP
	v02FGaMH6o+YG/6qBHgNvvocln/vAPRFHcZdVJqdbKq7gejfZ6Cd2sBqjH68xPv5AjHJv4V2Fb8kq
	RZTR7KfDnR3IgC/rf4jfzzphRehN3M822q9n4YFGvdcPJq2fA9YbTg0nPJiwAEzSFwZvGxnOHriNY
	IRsJ4ltQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTN4S-0000000Fe8h-2wdF;
	Wed, 10 Dec 2025 16:29:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTN4M-0000000Fe80-0hg3;
	Wed, 10 Dec 2025 16:29:41 +0000
X-UUID: 6a46c572d5e511f09f706fa2197c6ceb-20251210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=x3pj2iNo1vRlaqUY/804p/ntnGBU7rFigj8vdyor0y4=;
	b=tbTyyxRiXeGeLHX06L6kBxa+hEwiNADQz+s7GgNUiY2tIyQZRwYr6nqfjsmu3f5ayPW+avHkzPWx62n88NDiaVcz4xGqGCL1PqoWf02kSdG+sIABjupmyW7yUsdzLJYObUhaq5ylzCkUgS2y5JXDgvYPP/s4Sr1v2m2cYjRJaKo=;
X-CID-CACHE: Type:Local,Time:202512100917-07,HitQuantity:3
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:e31e0d23-f864-47ca-bcc9-c6ba07aa50c2,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:cdb29f02-1fa9-44eb-b231-4afc61466396,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6a46c572d5e511f09f706fa2197c6ceb-20251210
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 582626084; Wed, 10 Dec 2025 09:29:35 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 11 Dec 2025 00:29:32 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Thu, 11 Dec 2025 00:29:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9ADzWu4grjVFFutQq2rYHxopC2yvKJv9796cxM72VCrXvKkTyfAIL+FsiHWD6+4HP9C3y5stajiBEMYLpSZsMkQd9pHPyEdaYsJOs88ohm+Dux44XU9Z79yUcaKuinkfRUex88v+tFu+f0eb3SdWlDVgOxROR6xnxvBoJjNLlPtN+MYFRl1vSnB8wlywp3jFGOacFq6pGJ96nLBlZbJvGUKSot73lXWlzmsJN5vgLTQJoW0kX99DGmRrVigBbeidHPzfvnm26n3p74E7xbK5Fz0LKFW0/dU8e8y/EttVTbErOiJP7fCH9GMDv5pJ3xgDnT/jPrbwHvqYZy+lTsaOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3pj2iNo1vRlaqUY/804p/ntnGBU7rFigj8vdyor0y4=;
 b=LL5f3wFCJaGyqwGLwVG47GlKy2romZaIBW0iAnUgSPWwVSuqJyRdHiOGJjO9/hOxMhRlyKNdMrEtFnLbPB8GYw1ArgVJI2mk6B3EDEt64JPjxTjUmUQXLseZLBV17zeclzq5knl4OrBvrCiZk+nz2/+q7LPR7xkRh+JFvxedYSAwwfjJCXrCFBhldQuv94atijSOpgmiD8bmpKM2OOmCzlCDztUXGkoylOquAkPAkz4XpvaQEIWRfGYfiV8b2LhV4EXjXhTkb3Cf3UWxVCe1utD/Zu2ewE1vJXHYBmsQNbdiEPGIF6n3dXKLvgM/+9w1rj76iSA8/mcSx7XyCiApiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3pj2iNo1vRlaqUY/804p/ntnGBU7rFigj8vdyor0y4=;
 b=GMSmZnsGhxSVGnVbNeq24Yiyo1Cv3WVfYBeVXRJSykkwxW4PTtoB/gA+/7ym5aIre251m4wSKQ/4alzUeqbS5Mmce3ZVCelFRizk3wI42cjpaSLThDvY9cWzVRzmx9zAIHuAoiFDOISgVXq6fhS9s9zopDGETaDAetbMERvZC9w=
Received: from SEZPR03MB7810.apcprd03.prod.outlook.com (2603:1096:101:184::13)
 by JH0PR03MB7731.apcprd03.prod.outlook.com (2603:1096:990:e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 16:29:29 +0000
Received: from SEZPR03MB7810.apcprd03.prod.outlook.com
 ([fe80::2557:de4d:a3c7:41e8]) by SEZPR03MB7810.apcprd03.prod.outlook.com
 ([fe80::2557:de4d:a3c7:41e8%4]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 16:29:29 +0000
From: =?utf-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, Louis-Alexis Eyraud
	<louisalexis.eyraud@collabora.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?UGFibG8gU3VuICjlravmr5Pnv5Qp?= <pablo.sun@mediatek.com>,
	"kernel@collabora.com" <kernel@collabora.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?QmVhciBXYW5nICjokKnljp/mg5/lvrcp?=
	<bear.wang@mediatek.com>
Subject: Re: [PATCH] soc: mediatek: mtk-socinfo: Add entry for MT8391AV/AZA
 Genio 720
Thread-Topic: [PATCH] soc: mediatek: mtk-socinfo: Add entry for MT8391AV/AZA
 Genio 720
Thread-Index: AQHcSNqWJe+QFQ6c+kKd0acOklXd8bUbTz8AgAADWgA=
Date: Wed, 10 Dec 2025 16:29:29 +0000
Message-ID: <136d43b6382d09a1e60a24ae72a5c05be6218dc1.camel@mediatek.com>
References: <20251029-mtk-socinfo-mt8391-v1-1-61412dcd9938@collabora.com>
	 <d631c04f62edac5d5ee131160c3b287534d6b2c6.camel@mediatek.com>
In-Reply-To: <d631c04f62edac5d5ee131160c3b287534d6b2c6.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7810:EE_|JH0PR03MB7731:EE_
x-ms-office365-filtering-correlation-id: 02d33562-270b-495d-7906-08de38094ab4
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?UW5pZEpmOFdiOXQrZVNEdnhDOTRBSGEwNGNLQ2NJbGJ2SnR4Z2U3VjFBZkdI?=
 =?utf-8?B?c08yaWhIK2lWNndpdzZHalo2QlV6aE5rT2NzNnJ2ZnZzZ25KSWZGV2prQVZs?=
 =?utf-8?B?RlpDanN1NTFEdm1sb3ZVeEsxenVBYU5rbmltamtZdXA5dklWL3YrUjBoVnoz?=
 =?utf-8?B?aHloQk0xOGZoSldiKzM1S3VZS0VYVm9tS1pXYWNSdDRRd0ZKWlVIbGdWejBk?=
 =?utf-8?B?NFBkSUFDQ2tlYjhsS2hWNEZZYVJiUjFtVnZCQmFaTFZpMm1UTyswT0pYa01W?=
 =?utf-8?B?czJJQmd0QzB4VVVyc08xTjFZN3VjV2Jabit6VkpMVk9QUkx0d3BycTdqVkF0?=
 =?utf-8?B?cUJOK3BMYUFOaURLU2djVEhTWkora1JLZUh2Z3ZRZGhVMzFsbStBLzIvRUxV?=
 =?utf-8?B?cHR0THhuRis2cm9KcndnVkNLSjBGaXNQMG1ZUCszcU9nMCthNkNnUUszN08x?=
 =?utf-8?B?OXZjbWtZMUJaRDFEcEpzejBXeVVxRU94bk9oandMdGFBMGZnc0E0bVdmaGpl?=
 =?utf-8?B?eERteCs4dmtudEVUNGwyeTVOSTBjem50UGQ5MHZMTTZHOEZYbXZTa0VjREJN?=
 =?utf-8?B?S3hTS1J5TWE2OUMxbzZkQ05mNG95Rk8vWVppVGp2MExGVGhkNlpIUjg1aHNs?=
 =?utf-8?B?RGFGU1ZoNzU2eDgwdmFVMkRMZGtMUkEzUjFCQzRzQVhGWHVpN0NaUGpJOVla?=
 =?utf-8?B?NUdCdGtrbjNOeEVVNGxXZUdpL1NpTjV6b3FUWVBxWXBTUGREeVBWZEVjUklH?=
 =?utf-8?B?RXFRdEkvaGVlWlFETmpwOUNqa2tmdERGNng2OEVDdXBvaHZYMVhPZmIrbjdL?=
 =?utf-8?B?MXVtMEU5TDYzL0lOUTlvb3RicitEYzdpZEFwTUZDSStTaVJmYkRUa0xxZlBL?=
 =?utf-8?B?bUJPaU1UUGE1Vy9XOHBDOGJXRTV0QXdXekRaOFVJR09sL1J3YjBzN0tuWmJp?=
 =?utf-8?B?bGp4Y2FqalEzZXQ3UmZLQklBdlBnZjRvb2llMWYwT09RRUtnc21RKzBXZHJW?=
 =?utf-8?B?dFpPTjd2R2xJd0NqSWdJa0hiYndXcUJnTk5sd3R5cTZ1WWFJc0JJMlprYVJI?=
 =?utf-8?B?VlVNeU1Ddmwwb29PSXRkQnpiUzZXZHNiaUxzV1EzdUNZS0xjZDZ0TmhXNkdP?=
 =?utf-8?B?ei9MSmgzMVBRN3JYdHVxc0tVUzBMdmI3ZC90NTVZVVNjbXB6N1RLdUM5cjQw?=
 =?utf-8?B?aFU1NjVJOGgyWFBjK2NyZVdENXN1cUZvMHFCRXByZldnaER2bnBuWjRCWUhv?=
 =?utf-8?B?aERmczRMRXI1d3NhM2UzZVptTlpVRk9Pb2tyNC9lZUg1c01BMWtqS3gwdHJs?=
 =?utf-8?B?VytqSzMyMHQ4a0pFOUlpKzhWNWYzOHpEdTRTblJ6MithQ2Y2enJhd0xjWnFy?=
 =?utf-8?B?SXFHQjdBSkg3d0ZGMGZpM3Nwdmd3NC9XOHJvSURxTVcxNFQwZ3pEOEhrWCt5?=
 =?utf-8?B?QW1TTStJbkdCZGJvdGdDYlhmWUdwS1V1emZRMTZrQldJZHhZam1UU0dBaTZq?=
 =?utf-8?B?cHdQc3hiY04xL0RmcVBnUTBHMXRBbHF2aFZTRnk4STlkbFpGSnVYNVhjTklu?=
 =?utf-8?B?Y1JGSHRCbnZIMTBiQzM1SFNlMTBGK0RpMFBLNGxFNHQ0SUl3b2tuUVZFVlVh?=
 =?utf-8?B?dHloTVR3NEpzZDFLTGFHK1JZVHp3cG12TmFvUzFxRFlGRnRHSnhhVXFzQm9G?=
 =?utf-8?B?RTYzcUl6MXhJU0Nrd1g4ckcrWlJCL2Q5MUpwem5PcjAzY3BpQm9RV1RQNVQ4?=
 =?utf-8?B?U25qVWN6STdwTnNTT2V3ZVMxSVlsL3ZMSTNKRkpmRVIyTU9NL0JzSnMvZUtl?=
 =?utf-8?B?bFRCekVSN3hlTTlodDdGS1hOcndaYjRYZHdMS3c2SE1xcks5S00va1FtMEg4?=
 =?utf-8?B?dHRabkszQWltTkxBN2lNK3FQYlFJa0ZUWEFpR1hTZlNmTnBuVzBrVkxGQXAv?=
 =?utf-8?B?bDZ5MkRWc01nVFpWZXR4akI1Zlh2WWtvOEYvektNSWRYT3k1bFNQN2d3NUpI?=
 =?utf-8?B?UjVDcnNvdWlabk5wSUZJbm9pc2tRaUZEWG1GOXBBTDVTN0xnYzNLaGJhOXNs?=
 =?utf-8?Q?Ei0gFl?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7810.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UG1XQXFOQlJhN0x2aUF0MDc5b00vNkVINTA3ai9LQjRwcVlEQkZKSzJVVE9Z?=
 =?utf-8?B?R3A1enMxSjhoMHdSY0dFYURCUWs0OFJYRVRvNGtUQ2hhdnVnOUdoazAxZzRS?=
 =?utf-8?B?Z0NJci8zNmU5RitYWndHMzlzY3VGdEl5Uy9VbVBkOFM0TUFBMEIvd1BYSm1n?=
 =?utf-8?B?ampPUkRsa2NjK2RiN2hKMG13NW9ubVBndVNFZmFRWk9Yb1QzNUkvbDB0UDJQ?=
 =?utf-8?B?UUFTbXlTaHlrMkg5REFJZU55eFM5RDZiY3BOV2xraXlkREcvNVcyYTdzWVRK?=
 =?utf-8?B?ZUx0RHNycjd3R3FMR2ZxbHdDYXRHSmNkOVBwSFZnN2VlYUlXUVFMc0NiUFR1?=
 =?utf-8?B?WTRJYTNGNUFhWjR4aWpQeGdpSnlLTFBRRC8wRnhsMWs0TEJRN012L09WTmdr?=
 =?utf-8?B?V0JDNzVJdTVkbEpQN0dPWUpCcXVxb0dwYVNJNDIxRDJpamp4RUdVM1JIK2NE?=
 =?utf-8?B?aWNnK05seXJVM0NHMm1KdzZTL3pCWll6aUpVamRuNVBGTmlNcFRwWm1uT2FB?=
 =?utf-8?B?SHhzUzcwbUlLckZiMnp5RlZSdGExS2FkdzB0U2RVbVVPMndvSURGQlcxVHdN?=
 =?utf-8?B?SlVkMkNibnUzTUEzeXVscHNTQnB0Z0NKVFNQU2F1d2Z1aG00T1hLaHUxemFt?=
 =?utf-8?B?WGFhVFFnSVowY3FTeit2elRTVks3Y05FZU9OTU5wc0xDREJnWExMYTZyVmNl?=
 =?utf-8?B?bkFYV1B3aytUMXBaK0tpWTdmMTVkcEFTS09UOGVvczBNZnhJbkR2WjNETUNR?=
 =?utf-8?B?Uzk2d0lzd0VEbmxRVnZic1hPU0NaV1o4My8rdXlqb2FyY1dOSW1PNGY1dFZ4?=
 =?utf-8?B?WkZmVndGRXY2UkxEVG8yYlNVVEdQMlhVb1pwcG1yc1hGSUxoWkFsbUMybjU4?=
 =?utf-8?B?U21OLy83MERseFBtQWZqWHFvYVlibUNYdVJ5cjJBeWt4cmtVSGdHOEp6ZFJy?=
 =?utf-8?B?Rm5sNW95WFI2S3Z4ZS9acVRZa1A5Z3hkZDc2alpRMUQ1MjU4YWxoTFBmdEh5?=
 =?utf-8?B?dGI3RG5MU1dMZDdVWHVZYTdJKzlWaGhrRllBb0g1VktERHRpT0RsQW5HQ25W?=
 =?utf-8?B?NUpaZnNUNnhxa3RxdnNTbzJpbEFmcDBPUkV6NGlSNXhoNVN5eWM3K240Z3RK?=
 =?utf-8?B?Z3M3ZWcxS044TUNtUFlQNkJTN2N5elRSblludlpZMHFvaXU5dVhIQm00cis1?=
 =?utf-8?B?eXNRdkxuQ2FFMGtIVU5MREszMW83MzdUdG5GZ3l1ZEhuSDAycVMvUng4aCtn?=
 =?utf-8?B?VEVZL1ZNQW9HK2o1S2NRdWJVNWNhaFpyTDRYeEhHeis2MFZGTFlOMU10Vyt6?=
 =?utf-8?B?YU9RRHkxYXhDMXRrVXVJcTRtY3hFL1ovUS82SXF2alh5Y2s3c0dMSjMvZzZ3?=
 =?utf-8?B?QXNOUjRnMTdrbHphNEZ1QmpaaGZIa0VXTThIc21KWXE0a2x3SWNPam43cTRW?=
 =?utf-8?B?WWhGUG81cVhJRmcvaS9NMHZadDVGWnZDMFVkRkhYQ1puY09EeEhET3diM3li?=
 =?utf-8?B?MXJlTzdxcU0yQnFiZjlPYUxmWlV5Nm1JbFRTeVpzRU1RY09hYkdTNGRuOURy?=
 =?utf-8?B?cjQ3TFMxZ0ZCZkxsdE0zTTJmalBMY0dXVFFMd09SdktKWldxY3BnNzgrK2o0?=
 =?utf-8?B?NXZmTnJiZlhuWnl5UXFXNVBoRDhpNTk4THNpK1Y0TTVWMFFxNFhBdUxYTTEx?=
 =?utf-8?B?bE9nS3NqZndHQ1dDRGNQWWtDbk1QS0xCeHNtbFVNU3FUSC9IZFQ3TjNvQVlQ?=
 =?utf-8?B?Tlc4OGdhdEwvNk1SVWh1SjZMYnk4Z1JPcHUrSEtKU3h3WGo3eGwzTS9lb20r?=
 =?utf-8?B?VDNWZWtMdUJIRmk2K2FnT1loaElNaDRoNDBaR1diUzZ3RkNCY2twSmh1NEZJ?=
 =?utf-8?B?dHBJdkNVempVbzJiMC81SEFvZjFtY2l5NXdjT0Z1ZHNpODJMTG1WNG5JSUUv?=
 =?utf-8?B?bUx2NzgxWWlxK0VSeXJFT0x5MEFsNFkrZkhjbDZHVWJJS1lCNzBVK0JUY0k3?=
 =?utf-8?B?MXVweGQ0SlRtN1FldTRZb2NVUWJhMUNhMWpaVU40NjQ1L2p3ZWNZa3NqVXRT?=
 =?utf-8?B?YkZDbEtESURxV00zN0FDVk1VR0ZjMlNwK00wS0N5eVVpVkl6K0tGQVFJaHBQ?=
 =?utf-8?B?dVJsaG9CcTJqamVNL3FrMGpDS0RZcVhpeXVsdTc3V1U1NUNIcHp2WklFUVBR?=
 =?utf-8?B?T3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <32857B6AA413BC4EB3C5C47F118B7017@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7810.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02d33562-270b-495d-7906-08de38094ab4
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2025 16:29:29.1844
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HONF1rh+DITxJKux2DPt1eHbUEu3+cCLvWM4YlLNbvBEV8xIYL4tzIiEFBgWm76z5yq/LBz2muwQxfRkd9KBoM5a+9V+s0xBej5+eUBoWO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7731
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_082940_639080_D42C6FF6 
X-CRM114-Status: GOOD (  18.18  )
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

T24gVGh1LCAyMDI1LTEyLTExIGF0IDAwOjE3ICswODAwLCBNYWNwYXVsIExpbiB3cm90ZToNCj4g
T24gV2VkLCAyMDI1LTEwLTI5IGF0IDE0OjQ2ICswMTAwLCBMb3Vpcy1BbGV4aXMgRXlyYXVkIHdy
b3RlOg0KPiA+IA0KPiA+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5r
cyBvciBvcGVuIGF0dGFjaG1lbnRzDQo+ID4gdW50aWwNCj4gPiB5b3UgaGF2ZSB2ZXJpZmllZCB0
aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiA+IA0KPiA+IA0KPiA+IEFkZCBhbiBlbnRyeSBm
b3IgdGhlIE1UODM5MSBTb0Mgd2l0aCBjb21tZXJjaWFsIG5hbWUgR2VuaW8gNzIwLg0KPiA+IA0K
PiA+IFNpZ25lZC1vZmYtYnk6IExvdWlzLUFsZXhpcyBFeXJhdWQNCj4gPiA8bG91aXNhbGV4aXMu
ZXlyYXVkQGNvbGxhYm9yYS5jb20+DQo+ID4gLS0tDQo+ID4gwqBkcml2ZXJzL3NvYy9tZWRpYXRl
ay9tdGstc29jaW5mby5jIHwgMSArDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLXNvY2lu
Zm8uYw0KPiA+IGIvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLXNvY2luZm8uYw0KPiA+IGluZGV4
DQo+ID4gYzY5N2EwMzk4ZDkxN2MwOTQ0NjYxYTc1NjY3ODI0MzY5MzczYmEyYy4uNDRhMjFlOTFk
MTU5YjkzZWQxNTQwYjU3NQ0KPiA+IDRmDQo+ID4gNTUxMmQyZDljM2ZjMCAxMDA2NDQNCj4gPiAt
LS0gYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstc29jaW5mby5jDQo+ID4gKysrIGIvZHJpdmVy
cy9zb2MvbWVkaWF0ZWsvbXRrLXNvY2luZm8uYw0KPiA+IEBAIC01OCw2ICs1OCw3IEBAIHN0YXRp
YyBzdHJ1Y3Qgc29jaW5mb19kYXRhIHNvY2luZm9fZGF0YV90YWJsZVtdID0NCj4gPiB7DQo+ID4g
wqDCoMKgwqDCoMKgwqAgTVRLX1NPQ0lORk9fRU5UUlkoIk1UODE5NSIsICJNVDgxOTVUVi9FSFpB
IiwgIktvbXBhbmlvDQo+ID4gMTM4MCIsDQo+ID4gMHg4MTk1MDQwNCwgQ0VMTF9OT1RfVVNFRCks
DQo+ID4gwqDCoMKgwqDCoMKgwqAgTVRLX1NPQ0lORk9fRU5UUlkoIk1UODM3MCIsICJNVDgzNzBB
Vi9BWkEiLCAiR2VuaW8gNTEwIiwNCj4gPiAweDgzNzAwMDAwLCAweDAwMDAwMDgxKSwNCj4gPiDC
oMKgwqDCoMKgwqDCoCBNVEtfU09DSU5GT19FTlRSWSgiTVQ4MzkwIiwgIk1UODM5MEFWL0FaQSIs
ICJHZW5pbyA3MDAiLA0KPiA+IDB4ODM5MDAwMDAsIDB4MDAwMDAwODApLA0KPiA+ICvCoMKgwqDC
oMKgwqAgTVRLX1NPQ0lORk9fRU5UUlkoIk1UODM5MSIsICJNVDgzOTFBVi9BWkEiLCAiR2VuaW8g
NzIwIiwNCj4gPiAweDgzOTEwMDAwLCAweDAwMDAwMDgwKSwNCj4gPiDCoMKgwqDCoMKgwqDCoCBN
VEtfU09DSU5GT19FTlRSWSgiTVQ4Mzk1IiwgIk1UODM5NUFWL1pBIiwgIkdlbmlvIDEyMDAiLA0K
PiA+IDB4ODM5NTAxMDAsIENFTExfTk9UX1VTRUQpLA0KPiA+IMKgwqDCoMKgwqDCoMKgIE1US19T
T0NJTkZPX0VOVFJZKCJNVDgzOTUiLCAiTVQ4Mzk1QVYvWkEiLCAiR2VuaW8gMTIwMCIsDQo+ID4g
MHg4Mzk1MDgwMCwgQ0VMTF9OT1RfVVNFRCksDQo+ID4gwqB9Ow0KPiA+IA0KPiA+IC0tLQ0KPiA+
IGJhc2UtY29tbWl0OiBjOWEzODlmZmFkMjdlNzg0N2M2OWY0ZDJiNjdiYTU2Yjc3MTkwMjA5DQo+
ID4gY2hhbmdlLWlkOiAyMDI1MTAyOS1tdGstc29jaW5mby1tdDgzOTEtMjYwYWU5Y2M2ZjYxDQo+
ID4gDQo+ID4gQmVzdCByZWdhcmRzLA0KPiA+IC0tDQo+ID4gTG91aXMtQWxleGlzIEV5cmF1ZCA8
bG91aXNhbGV4aXMuZXlyYXVkQGNvbGxhYm9yYS5jb20+DQo+ID4gDQo+ID4gDQo+IA0KPiBSZXZp
ZXdlZC1ieSBNYWNwYXVsIExpbiA8bWFjcGF1bC5saW5AbWVkaWF0ZWsuY29tPg0KPiANCj4gQmVz
dCByZWdhcmRzLA0KPiBNYWNwYXVsIExpbg0KDQpTb3JyeSBmb3IgbWlzc2luZyBhIGNvbG9uIGlu
IHRoZSB0YWcuIFJlc2VuZCB0aGUgcmVwbHkgYWdhaW4uDQoNClJldmlld2VkLWJ5OiBNYWNwYXVs
IExpbiA8bWFjcGF1bC5saW5AbWVkaWF0ZWsuY29tPg0KDQpCZXN0IHJlZ2FyZHMsDQpNYWNwYXVs
IExpbg0K

