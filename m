Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2313E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 06:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QoZpg/9kOFbCiIBGXMouQSZbiVO69Hw7p490sg22fQk=; b=tPYhijhoLhPpUD66DU8gPim1AT
	5STB51zmLzSxikQSrMJNUoJVklZgIUmjID2DWuI81R8yUPHUJFWmHGkfVXQemA+yPn1aOLxV6D8vB
	YeDvAhTwO4q29r7Xv3U/Il9p9PVeVL1pMeZ7Ls+/fpJFzjS+v/M+u0rAXekKaLwThcCU6NUn2K9G0
	B4K7kX9CwVfyBfUI3fmzmEicogaAVEk59kVsw166NOaCR0lJcOmoTy7XStFoAf5lSR/AQ618t0zvG
	CazSLN3K9A3CZWLPV219ch6KZjmaviVtNsyLPvIQ+tvXuEZv9L6dEJsL4Pyfazl2F3XS1FbY3C1QD
	lOq4Z//w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOAPT-000000010O4-0ijM;
	Thu, 19 Dec 2024 06:53:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOAOL-000000010J6-3SFl;
	Thu, 19 Dec 2024 06:52:15 +0000
X-UUID: c3191430bdd511ef82ff63e91e7eb18c-20241218
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=QoZpg/9kOFbCiIBGXMouQSZbiVO69Hw7p490sg22fQk=;
	b=EIj4lLmGWHYKZZEG1ULFGDw2byJK5khrdBxqgc2Bxr9l+ASxoF7eYJubDCpnXSchV/45GgVnSBFaah1lMkAfTyL1hIzhjTb4jwHcTx9sq0yztmMH5rxOrRHjLrI4tmOC/Eb7FBtZndriYIldbS2zl5BtD3OYxplxuj7trxkVn0g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:44c7d5a8-773c-4a63-83fc-1a30d86bc813,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:6d4c373c-e809-4df3-83cd-88f012b9e9ba,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: c3191430bdd511ef82ff63e91e7eb18c-20241218
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1219458555; Wed, 18 Dec 2024 23:52:07 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 19 Dec 2024 14:52:03 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 19 Dec 2024 14:52:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GEz6bHHnZ/F0Fx1NH+QyMJWZhJ7Fb9YvqXTDW86WCP7QkgKUXrf0s9IFYZpPtRyLq+04bx5tkst5Y1dkdYHYxYIeru46GvfjdlO2fZl+wTQNsSh8BXx0xwvVdKjybHDGa/HclySkyxgu/aTFZXJM0ZCaVcU+nQ0yre2bTCG62RiJLRfbEksC8YNfnDb/NKpzeR3/gn5HrrEw7v2DqbQM/mmFttXmaKL0Uu6jEjounpuO6jH3jjE+dDFYVyv/LvtGtqL5mwhp3KYLHz5XnwSu5w1rbG+GCLbM7yRVPy3RdmMYC2QC6OHXML7hLO4kqIT/wRNn5jYpBfYCypbEN8KxDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QoZpg/9kOFbCiIBGXMouQSZbiVO69Hw7p490sg22fQk=;
 b=hkQvneXQQEbdI76i5xhh5c2ry5ftu1xQolILZhi07u+Uh4KzUDahAyJDjXEonqE2F9rWw1LjJ0ROSlLxgnhDBepgC8BTx+iouxvRG8NgIvv+TzLZETr4klgi8H//I/HQZkjnJ3MXOayira3sVyOCAi6sLEVw3GfRiKqMPI83omwSOqSLPisi4dEhDXGRTyLxlGvYs7J1l2NRtnVPHJjyxPZ7nm+EQnS6gTCX8BkLriOE1puycmnkuM1CrcjRcFtzkB5xX6yGmuPT3jYPuocgbwML001vzfcL4epx9c0jI8V973HzMjUlJMxFVEkhXvRe2KLGtgMzOEci85Gw5E/dyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QoZpg/9kOFbCiIBGXMouQSZbiVO69Hw7p490sg22fQk=;
 b=JTzBmuIaYnMAeA6hd7dBGj2vu9U4elUK3RQpQ1Dbxz10ZW3iGuxA63mD6+o9e0YUVYcxjvCpo3405m3lfIp47r9hrmJype/wJY2s34SUOUzrbu4ByxudjE8iSotaV/LSc2ZQuXGXWlY2ta9jP9OToRS+jv1ae2yFmAPkQHfLYCE=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB6769.apcprd03.prod.outlook.com (2603:1096:101:68::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 06:52:01 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8251.015; Thu, 19 Dec 2024
 06:52:01 +0000
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
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "junzhi.zhao@mediatek.com"
	<junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v3 06/33] drm/mediatek: Add support for MT8195 Digital
 Parallel Interface
Thread-Topic: [PATCH v3 06/33] drm/mediatek: Add support for MT8195 Digital
 Parallel Interface
Thread-Index: AQHbUJqmO3SZQUBbuEKVSd24nYuYWbLtI8sA
Date: Thu, 19 Dec 2024 06:52:00 +0000
Message-ID: <4256dda4b6aed2688b4aaa4affb2e039a8f960dd.camel@mediatek.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
	 <20241217154345.276919-7-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241217154345.276919-7-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB6769:EE_
x-ms-office365-filtering-correlation-id: dc074e4c-5f8a-41e2-e9be-08dd1ff9a3b3
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014|7053199007|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MGM1S0M1NUREOXNQVVRWNERKcFhhdnRBTkpBN0JsbTJmcFVJWnZtUWd6Tmlt?=
 =?utf-8?B?Z1pkWkNLbWV6cWljeEEyelArcmVRNDNTZndWbVFsWDdtSWJ6RlUzTUs3YWtR?=
 =?utf-8?B?U000WHNPMVRhKzRHRE5sRitNN212Z0FjemQ3WGpsaGlZbFgxTU1wZ2lKazZX?=
 =?utf-8?B?RXlEUmV3czlFNktGOGE2YnpBUmZOR2tuUTZoU09YUmR5dUw1L2lLZ09Bc0ZO?=
 =?utf-8?B?dzUvaWErRXFRV1hKNjZtc3hVQ0o0QUxiMlRLNWg0T1E4TThDWDVVWnpYK1A1?=
 =?utf-8?B?L1FnaFlaVlk1YkliVWpURDFBU2FjZXF5L1p6SFlzM3lJeHpaZG5tU1RDSGli?=
 =?utf-8?B?Y3d5Snd1N0JxYVJDbU11WGVlYVJDUUJBR24xb05RNUdkR0RSL1YyQ3FMOW94?=
 =?utf-8?B?V2VNWnU1MXNsUDJ5ekxJUWltRFZXVVdSZkRpNmo0QSsxaXcwd0R6Zm5VZEIz?=
 =?utf-8?B?QnNudnhseDRJZ2w2NlNwb0FUcXplTENITDV6Y1lNYXVZTmpRRFc0ck9OdmxX?=
 =?utf-8?B?ekx1OW8xZDlJc1h2N1JvWmloaFJaajZ2VG5rcXNxSTByRDJJL3poMTRGdzJm?=
 =?utf-8?B?a0NZK0RXSnJoNHl6M3ZXT1JOdlFVeGFiUTQ4dmJ3d1BwbkdBVjJjRU5pWnpU?=
 =?utf-8?B?NExqYnJtUEt5anhnZ0tkSS8vRnhiYklBNlhSWjNJRnVJdzFPZGJpOEV0eTA0?=
 =?utf-8?B?QnNOY21tWGsvcmgwRlRvWGVFOG9xUkQ1VmRaZUg1RmFmR0dGMVlKSkZhSjR3?=
 =?utf-8?B?Wm51SVMvWlBCNkhoT1Z5dkVHTlgzUm1PK2R1VmtFM3A4cjB2d1BEdXQ4ZGNt?=
 =?utf-8?B?NHVmbXl5R2Y0Y3lBVmJhRElKb0Nkak4yak9zVTJzY2srRjVHSHp0L0ZGYTQ5?=
 =?utf-8?B?eTd4T3FWTjdyVFVRakpyZmt1VURwV0xuYStVR2I4MnR0VVdvUUNUeitKWDRZ?=
 =?utf-8?B?eUZkTTkzZ3JJcW8vRzlTT1JYS3daWCtwS3pKWDMvN1U0azNrbWgyWHFibFd4?=
 =?utf-8?B?TmdVZFAxeWcwUzd2TE0rYS9hSTlpM0Q3NkR1Ym1OQ2RBK2t2NHFtN1pxUWNs?=
 =?utf-8?B?ZXRFSFkrYVBXc0YrVTIyTkZNQWhwWDZFbzlTcVR3QmRvU2s4QjFBbWFXVVBr?=
 =?utf-8?B?aUdXRWt4a3RwMitVQW5iLzhjM29HSjV4NGMvUG5yR1BJY1d6Y3VIN3pnZ2s3?=
 =?utf-8?B?Y3BRcjlwUzQ4QkN3Y1BZSytSM20wVEVEUVp4TEtuMElKV0dMeFR6TndMVjRh?=
 =?utf-8?B?MDhmQzloMGo5aFkrb1JmT2NUaytubDVGZGJldHhpUFpZOExFb0RCSXJaVUJy?=
 =?utf-8?B?cHRSc21qajdla1VMc3pVSmxJaXJGMnFMKzFFZ0VEMzBNQzlvY3R3cCswNG1T?=
 =?utf-8?B?L1lObVZDYWhqZXFZVGVoUlUxbnMvR0xhNU5rUVBPY2ZyT0pNc2Y3TmlpVURa?=
 =?utf-8?B?OS9rTjI3UkcvcDBHbHNFNms0dVp2T0FFVFZtakhiY3I1ajMvWXpDRVp6WWhV?=
 =?utf-8?B?RVU1emdyeTk4VG1vYlc2K05rUmRPSEt4dkh3VzZWUmZObEM0aVJiclZJTHpp?=
 =?utf-8?B?Yyt3NGdpaEZqQk8xSjViNjR4bGlhYUNhMlZ1OC8vZFRReHJiTXU3Q0I2bjJ0?=
 =?utf-8?B?clF2b0QzdzFCY3VPdEE5ZlArZXVVbzRqdVhUL01aYXhFa2MrdkxXUkd4cHZq?=
 =?utf-8?B?RmZwV2R0UFZoeTFLdTl4U1MwU1BQZmpVZXA0emVlaGZudmFPR01STTdvZzNq?=
 =?utf-8?B?Y3k0UDB2QjJ3a0Q0d1N4VlhlYjJqRWYyQllNWDlEUzNxaDV0TFlzQ2lDYVBi?=
 =?utf-8?B?YWtoUElxcytYWk9jK0llc25VWGkybmFyaGNwa2tZdUpNL0FkVm9KZDJ0dndk?=
 =?utf-8?B?dHZDVStXbDFCbmhZQ2RDcVdwTGZoc3RPTFRwM21rTnN2VW00azNXT0N5SS8x?=
 =?utf-8?Q?9l+JU7v0GoDZRbvX4yCUvgB8L8Ka9WqY?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YmtacWNwcVZmd1R6Z1Y1blVrZnA1SnllSHdIejBOYk52TWpoS2hIdmxOMjVP?=
 =?utf-8?B?bWNwOS9BQ0QvRVo2djQrdnFYcW5CYUVGcktVdGIvS0FzRHN6eXdBN3hTUGQ3?=
 =?utf-8?B?R0RiQkNuYzdWb0dRNlFUWndWZitLQTc5TGNvaGp4d0RXZnc4dVlIOEdmNmNt?=
 =?utf-8?B?S3FBeldEWk5nT3VRdldXZ0lzRC9ubTR1NnJubXZaV05DZzE3RXd0Smh3aWJQ?=
 =?utf-8?B?YjJFcEMwczIxM0xaY2hqZjlHME44TUI1UVd5L1IvOUYzaDN2QjlzQlNWMjk3?=
 =?utf-8?B?aWw2Vmw2MXBDeXMrQ3V6emRmaVhuNGdGOFFOL0NrSlV0b3BDNVVGNU12Y0Y2?=
 =?utf-8?B?UnRobVhsS2V4b09EZEJ6aHpvTForUW1QNVlrN2cvdU5ScWV5SHVMUWo4MGFX?=
 =?utf-8?B?N2JtMVlVSlB6QkNKTGpvdk1HNkx2aDJvbjFPL3QzSnU5aW9uZHVUNUtQS0lo?=
 =?utf-8?B?WnZLcFMweXdmR2hqbk5jYjQwMnNKeWk1Yy9rNmxBNlh6QllZRlJwdUJkUnZQ?=
 =?utf-8?B?WGR0eWRJQlJxK1YwbFBUaGRkTEw0OW5FdGRWdEw2T2V6TlI2S2tHN3NNcGlO?=
 =?utf-8?B?MmlEODdWQjZiWXh5NkFTWFY1YVFpUHFxbitzdlJ3ZkdFV2ZtVmRsUHBaT3Nw?=
 =?utf-8?B?cUgzZlZtdjV6bWduNi9ObFpGcUIrWkltYUhWbXVJS3ZMU3NKTnllLzhtSU1B?=
 =?utf-8?B?YU5pbVc3VHpsYXJ1enJDWW5TVnlVMUI4NmY5b01sMVdsaSszTUlpZ2VPbTU0?=
 =?utf-8?B?WFZWcnhIemFCaXpGNVRWekVwQ1pla3czb2xLeGVQVmt5eEVXRVp6QzRpcGVo?=
 =?utf-8?B?RHk3V3hsT2x1dkZVQVZzSWtkZDloY0ZPSGRRdExscS9sYXRiTkx0NExPVWtN?=
 =?utf-8?B?bVg1SW8xNy9wK0hkZHdSdFhXZVFHbDBJclVudTlkNDZCc1dpWVVaWCthM3lP?=
 =?utf-8?B?cXBNWnJXUDJWODhsZWZjWmFKK2pqV0Y1U0oybWpHbldiV0xyeUtCYjRTZktZ?=
 =?utf-8?B?eW1RSUdTL05VTEZiV0hZc2JkditzcS9nMXFGd1VZaFNzYU1xa2RjYmQ1a2M5?=
 =?utf-8?B?N25rUEF5VXlZeStwQldYOWU1b0t1QkpES1ZhL1JuOVRKRVVrVktJWXF1Vmxn?=
 =?utf-8?B?c0lUVHVYNE1PQ1BTaXpiQnZ2cG1KRlBkdDZIUUNaU0tFdERJYUFJQ1cwOHMw?=
 =?utf-8?B?S1ZJK3lVMUgzTjE2bUVzK1NRa3hrOGVrT2oyT3MybGdQOWkrUVpqVFVqbmxo?=
 =?utf-8?B?ODA1UG9Ja3g1VFJsNzJQZlU3Rm1zTkRoWEZWT1dkejR0Zjh6YlBva214V3hx?=
 =?utf-8?B?d1VUZzhRb1BuQjV2SWhxRm1BMXJHMEo4aWFCOXZncnlJblArNnJsbWpSSTda?=
 =?utf-8?B?OXFaSmUyMFlncTRldG0xanZRSGNGSTA4a0RNSTJMWXBJcm9McTNHSzVNSktO?=
 =?utf-8?B?d1QrT0JFYmU4dUl4UDJWa1JHZWxjUzQzRTdxaHdVWGE3OWZGQzBhMjFUaEJt?=
 =?utf-8?B?OUplaWc5M014NTFwbHhUUWZQS2RvREJzSEJ1aGppT1QrTHJQZzBXTzA3K21n?=
 =?utf-8?B?SDNmQUxYZlFMUzVsczlJb2dOQzVBWXlISEZnUDJVOFFJY0V6YlAvTjZtOUlJ?=
 =?utf-8?B?d1V6SS9VWlNYVkxFUGRDS2xCeVc2MHVTOUxpdC93Yjh0L0IrR2grdUhjUFNW?=
 =?utf-8?B?SWRjS2ZjRy9OeFNSWDUrdkZLYVFjcDVkYlpIMmRESjZrMDBGVzMydHN4bGVE?=
 =?utf-8?B?QzhZb1VDRmNWWVdPeHB6MGVUL3FQdnJGMDBhcXdCS3g4NGZYanprRldQQ3g3?=
 =?utf-8?B?Q0JKSGplUnBKOThiQWdLczhKUjd2N1J2dHpZRFpoOWdrRW44RFdVbHBVa2Y2?=
 =?utf-8?B?VzlKajBta3NYeUFPRUVsclRQbFVXMzlVU01EUTZFeGtheG9JYm1adlNyMEwy?=
 =?utf-8?B?Z2oxc2tvZVh5dmZWejVkK0RJek9DTUhGKzMzQVBSNjRlbzF5dGMrWkxFTTJ0?=
 =?utf-8?B?R0ZzbnQrM3N1c3dTMzJpNFVpN3hPNjM3TVM5b3NZQmg3VVVSQzNyU21mZjdw?=
 =?utf-8?B?WGhkMElueUJFbkJoSUVORmlGRHB2UjlteEZKejNCS290c2hYZjl2T0NBczdF?=
 =?utf-8?Q?Hv+l9MHWMLEKaV6/HUku+5sJ3?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3F9926991EE8F44B95BF200B3FD0A63C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc074e4c-5f8a-41e2-e9be-08dd1ff9a3b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2024 06:52:00.9706
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8zVeS86pGbeY3zxs3dkTnil1wZQaQbw8J0OfIHRR1o2PevAMrGO7iYCRHekHnmoqwqzz/hH3aG+0rkIMjq9cBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6769
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_225213_890065_FA45455F 
X-CRM114-Status: GOOD (  19.11  )
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

SGksIEFuZ2VsbzoNCg0KT24gVHVlLCAyMDI0LTEyLTE3IGF0IDE2OjQzICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBBZGQgc3VwcG9ydCBmb3Ig
dGhlIERQSSBibG9jayBmb3VuZCBpbiB0aGUgTVQ4MTk1IGFuZCBNVDgxODggU29Dcy4NCj4gSW5z
aWRlIG9mIHRoZSBTb0MsIHRoaXMgYmxvY2sgaXMgZGlyZWN0bHkgY29ubmVjdGVkIHRvIHRoZSBI
RE1JIElQLg0KDQpOb3RlOiB0aGVyZSBpcyBkaXNjdXNzaW9uIGluIFsxXS4NCg0KWzFdIGh0dHBz
Oi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRjaC8yMDI0
MTEyMDEyNDQyMC4xMzM5MTQtNy1hbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5j
b20vDQoNClJlZ2FyZHMsDQpDSw0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2No
aW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPg0K
PiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgICAgICB8IDU1ICsr
KysrKysrKysrKysrKysrKysrKystLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHBpX3JlZ3MuaCB8ICA2ICsrKw0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZHJ2LmMgIHwgIDIgKw0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA1OCBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHBpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQo+IGluZGV4IGVk
OTg0OWFkM2U3OS4uMzM0YWI5YmUyZjMxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RwaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHBpLmMNCj4gQEAgLTE0NCw2ICsxNDQsNyBAQCBzdHJ1Y3QgbXRrX2RwaV9mYWN0b3Igew0KPiAg
ICogQGNzY19lbmFibGVfYml0OiBFbmFibGUgYml0IG9mIENTQy4NCj4gICAqIEBwaXhlbHNfcGVy
X2l0ZXI6IFF1YW50aXR5IG9mIHRyYW5zZmVycmVkIHBpeGVscyBwZXIgaXRlcmF0aW9uLg0KPiAg
ICogQGVkZ2VfY2ZnX2luX21tc3lzOiBJZiB0aGUgZWRnZSBjb25maWd1cmF0aW9uIGZvciBEUEkn
cyBvdXRwdXQgbmVlZHMgdG8gYmUgc2V0IGluIE1NU1lTLg0KPiArICogQGlzX2ludGVybmFsX2hk
bWk6IFNwZWNpZmllcyB3aGV0aGVyIHRoZSBEUEkgaXMgaW50ZXJuYWxseSBjb25uZWN0ZWQgdG8g
dGhlIEhETUkgYmxvY2sNCj4gICAqLw0KPiAgc3RydWN0IG10a19kcGlfY29uZiB7DQo+ICAgICAg
ICAgY29uc3Qgc3RydWN0IG10a19kcGlfZmFjdG9yICpkcGlfZmFjdG9yOw0KPiBAQCAtMTY0LDYg
KzE2NSw3IEBAIHN0cnVjdCBtdGtfZHBpX2NvbmYgew0KPiAgICAgICAgIHUzMiBjc2NfZW5hYmxl
X2JpdDsNCj4gICAgICAgICB1MzIgcGl4ZWxzX3Blcl9pdGVyOw0KPiAgICAgICAgIGJvb2wgZWRn
ZV9jZmdfaW5fbW1zeXM7DQo+ICsgICAgICAgYm9vbCBpc19pbnRlcm5hbF9oZG1pOw0KPiAgfTsN
Cj4gDQo+ICBzdGF0aWMgdm9pZCBtdGtfZHBpX21hc2soc3RydWN0IG10a19kcGkgKmRwaSwgdTMy
IG9mZnNldCwgdTMyIHZhbCwgdTMyIG1hc2spDQo+IEBAIC00OTIsNiArNDk0LDcgQEAgc3RhdGlj
IHZvaWQgbXRrX2RwaV9wb3dlcl9vZmYoc3RydWN0IG10a19kcGkgKmRwaSkNCj4gDQo+ICAgICAg
ICAgbXRrX2RwaV9kaXNhYmxlKGRwaSk7DQo+ICAgICAgICAgY2xrX2Rpc2FibGVfdW5wcmVwYXJl
KGRwaS0+cGl4ZWxfY2xrKTsNCj4gKyAgICAgICBjbGtfZGlzYWJsZV91bnByZXBhcmUoZHBpLT50
dmRfY2xrKTsNCj4gICAgICAgICBjbGtfZGlzYWJsZV91bnByZXBhcmUoZHBpLT5lbmdpbmVfY2xr
KTsNCj4gIH0NCj4gDQo+IEBAIC01MDgsNiArNTExLDEyIEBAIHN0YXRpYyBpbnQgbXRrX2RwaV9w
b3dlcl9vbihzdHJ1Y3QgbXRrX2RwaSAqZHBpKQ0KPiAgICAgICAgICAgICAgICAgZ290byBlcnJf
cmVmY291bnQ7DQo+ICAgICAgICAgfQ0KPiANCj4gKyAgICAgICByZXQgPSBjbGtfcHJlcGFyZV9l
bmFibGUoZHBpLT50dmRfY2xrKTsNCj4gKyAgICAgICBpZiAocmV0KSB7DQo+ICsgICAgICAgICAg
ICAgICBkZXZfZXJyKGRwaS0+ZGV2LCAiRmFpbGVkIHRvIGVuYWJsZSB0dmQgcGxsOiAlZFxuIiwg
cmV0KTsNCj4gKyAgICAgICAgICAgICAgIGdvdG8gZXJyX2VuZ2luZTsNCj4gKyAgICAgICB9DQo+
ICsNCj4gICAgICAgICByZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUoZHBpLT5waXhlbF9jbGspOw0K
PiAgICAgICAgIGlmIChyZXQpIHsNCj4gICAgICAgICAgICAgICAgIGRldl9lcnIoZHBpLT5kZXYs
ICJGYWlsZWQgdG8gZW5hYmxlIHBpeGVsIGNsb2NrOiAlZFxuIiwgcmV0KTsNCj4gQEAgLTUxNyw2
ICs1MjYsOCBAQCBzdGF0aWMgaW50IG10a19kcGlfcG93ZXJfb24oc3RydWN0IG10a19kcGkgKmRw
aSkNCj4gICAgICAgICByZXR1cm4gMDsNCj4gDQo+ICBlcnJfcGl4ZWw6DQo+ICsgICAgICAgY2xr
X2Rpc2FibGVfdW5wcmVwYXJlKGRwaS0+dHZkX2Nsayk7DQo+ICtlcnJfZW5naW5lOg0KPiAgICAg
ICAgIGNsa19kaXNhYmxlX3VucHJlcGFyZShkcGktPmVuZ2luZV9jbGspOw0KPiAgZXJyX3JlZmNv
dW50Og0KPiAgICAgICAgIGRwaS0+cmVmY291bnQtLTsNCj4gQEAgLTU4NCw3ICs1OTUsOSBAQCBz
dGF0aWMgaW50IG10a19kcGlfc2V0X2Rpc3BsYXlfbW9kZShzdHJ1Y3QgbXRrX2RwaSAqZHBpLA0K
PiAgICAgICAgIHN0cnVjdCB2aWRlb21vZGUgdm0gPSB7IDAgfTsNCj4gDQo+ICAgICAgICAgZHJt
X2Rpc3BsYXlfbW9kZV90b192aWRlb21vZGUobW9kZSwgJnZtKTsNCj4gLSAgICAgICBtdGtfZHBp
X3NldF9waXhlbF9jbGsoZHBpLCAmdm0sIG1vZGUtPmNsb2NrKTsNCj4gKw0KPiArICAgICAgIGlm
ICghZHBpLT5jb25mLT5pc19pbnRlcm5hbF9oZG1pKQ0KPiArICAgICAgICAgICAgICAgbXRrX2Rw
aV9zZXRfcGl4ZWxfY2xrKGRwaSwgJnZtLCBtb2RlLT5jbG9jayk7DQo+IA0KPiAgICAgICAgIGRw
aV9wb2wuY2tfcG9sID0gTVRLX0RQSV9QT0xBUklUWV9GQUxMSU5HOw0KPiAgICAgICAgIGRwaV9w
b2wuZGVfcG9sID0gTVRLX0RQSV9QT0xBUklUWV9SSVNJTkc7DQo+IEBAIC02NDcsMTAgKzY2MCwx
OCBAQCBzdGF0aWMgaW50IG10a19kcGlfc2V0X2Rpc3BsYXlfbW9kZShzdHJ1Y3QgbXRrX2RwaSAq
ZHBpLA0KPiAgICAgICAgIGlmIChkcGktPmNvbmYtPnN1cHBvcnRfZGlyZWN0X3Bpbikgew0KPiAg
ICAgICAgICAgICAgICAgbXRrX2RwaV9jb25maWdfeWNfbWFwKGRwaSwgZHBpLT55Y19tYXApOw0K
PiAgICAgICAgICAgICAgICAgbXRrX2RwaV9jb25maWdfMm5faF9mcmUoZHBpKTsNCj4gLSAgICAg
ICAgICAgICAgIG10a19kcGlfZHVhbF9lZGdlKGRwaSk7DQo+ICsgICAgICAgICAgICAgICAvKiBE
UEkgY2FuIGNvbm5lY3QgdG8gZWl0aGVyIGFuIGV4dGVybmFsIGJyaWRnZSBvciB0aGUgaW50ZXJu
YWwgSERNSSBlbmNvZGVyICovDQo+ICsgICAgICAgICAgICAgICBpZiAoZHBpLT5jb25mLT5pc19p
bnRlcm5hbF9oZG1pKSB7DQo+ICsgICAgICAgICAgICAgICAgICAgICAgIG10a19kcGlfbWFzayhk
cGksIERQSV9DT04sIERQSV9PVVRQVVRfMVQxUF9FTiwgRFBJX09VVFBVVF8xVDFQX0VOKTsNCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgbXRrX2RwaV9tYXNrKGRwaSwgRFBJX0NPTiwNCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRwaS0+Y29uZi0+aW5wdXRfMnBpeGVs
ID8gRFBJX0lOUFVUXzJQX0VOIDogMCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIERQSV9JTlBVVF8yUF9FTik7DQo+ICsgICAgICAgICAgICAgICB9IGVsc2Ugew0KPiAr
ICAgICAgICAgICAgICAgICAgICAgICBtdGtfZHBpX2R1YWxfZWRnZShkcGkpOw0KPiArICAgICAg
ICAgICAgICAgfQ0KPiAgICAgICAgICAgICAgICAgbXRrX2RwaV9jb25maWdfZGlzYWJsZV9lZGdl
KGRwaSk7DQo+ICAgICAgICAgfQ0KPiAtICAgICAgIGlmIChkcGktPmNvbmYtPmlucHV0XzJwaXhl
bCkgew0KPiArICAgICAgIGlmIChkcGktPmNvbmYtPmlucHV0XzJwaXhlbCAmJiAhZHBpLT5jb25m
LT5pc19pbnRlcm5hbF9oZG1pKSB7DQo+ICAgICAgICAgICAgICAgICBtdGtfZHBpX21hc2soZHBp
LCBEUElfQ09OLCBEUElOVEZfSU5QVVRfMlBfRU4sDQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgRFBJTlRGX0lOUFVUXzJQX0VOKTsNCj4gICAgICAgICB9DQo+IEBAIC05MTksMTQgKzk0
MCwxNiBAQCB2b2lkIG10a19kcGlfc3RhcnQoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAgew0KPiAg
ICAgICAgIHN0cnVjdCBtdGtfZHBpICpkcGkgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gDQo+
IC0gICAgICAgbXRrX2RwaV9wb3dlcl9vbihkcGkpOw0KPiArICAgICAgIGlmICghZHBpLT5jb25m
LT5pc19pbnRlcm5hbF9oZG1pKQ0KPiArICAgICAgICAgICAgICAgbXRrX2RwaV9wb3dlcl9vbihk
cGkpOw0KPiAgfQ0KPiANCj4gIHZvaWQgbXRrX2RwaV9zdG9wKHN0cnVjdCBkZXZpY2UgKmRldikN
Cj4gIHsNCj4gICAgICAgICBzdHJ1Y3QgbXRrX2RwaSAqZHBpID0gZGV2X2dldF9kcnZkYXRhKGRl
dik7DQo+IA0KPiAtICAgICAgIG10a19kcGlfcG93ZXJfb2ZmKGRwaSk7DQo+ICsgICAgICAgaWYg
KCFkcGktPmNvbmYtPmlzX2ludGVybmFsX2hkbWkpDQo+ICsgICAgICAgICAgICAgICBtdGtfZHBp
X3Bvd2VyX29mZihkcGkpOw0KPiAgfQ0KPiANCj4gIHVuc2lnbmVkIGludCBtdGtfZHBpX2VuY29k
ZXJfaW5kZXgoc3RydWN0IGRldmljZSAqZGV2KQ0KPiBAQCAtMTAyMSw2ICsxMDQ0LDggQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBtdGtfZHBpX2ZhY3RvciBkcGlfZmFjdG9yX210ODE5NV9kcF9pbnRm
W10gPSB7DQo+ICAgICAgICAgeyA3MDAwMCAtIDEsIDQgfSwgeyAyMDAwMDAgLSAxLCAyIH0sIHsg
VTMyX01BWCwgMSB9DQo+ICB9Ow0KPiANCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RwaV9m
YWN0b3IgZHBpX2ZhY3Rvcl9tdDgxOTVfZHBpID0geyBVMzJfTUFYLCAxIH07DQo+ICsNCj4gIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RwaV9jb25mIG10ODE3M19jb25mID0gew0KPiAgICAgICAg
IC5kcGlfZmFjdG9yID0gZHBpX2ZhY3Rvcl9tdDgxNzMsDQo+ICAgICAgICAgLm51bV9kcGlfZmFj
dG9yID0gQVJSQVlfU0laRShkcGlfZmFjdG9yX210ODE3MyksDQo+IEBAIC0xMTEzLDYgKzExMzgs
MjUgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZHBpX2NvbmYgbXQ4MTkyX2NvbmYgPSB7DQo+
ICAgICAgICAgLmNzY19lbmFibGVfYml0ID0gQ1NDX0VOQUJMRSwNCj4gIH07DQo+IA0KPiArc3Rh
dGljIGNvbnN0IHN0cnVjdCBtdGtfZHBpX2NvbmYgbXQ4MTk1X2NvbmYgPSB7DQo+ICsgICAgICAg
LmRwaV9mYWN0b3IgPSAmZHBpX2ZhY3Rvcl9tdDgxOTVfZHBpLA0KPiArICAgICAgIC5udW1fZHBp
X2ZhY3RvciA9IDEsDQo+ICsgICAgICAgLm1heF9jbG9ja19raHogPSA1OTQwMDAsDQo+ICsgICAg
ICAgLm91dHB1dF9mbXRzID0gbXQ4MTgzX291dHB1dF9mbXRzLA0KPiArICAgICAgIC5udW1fb3V0
cHV0X2ZtdHMgPSBBUlJBWV9TSVpFKG10ODE4M19vdXRwdXRfZm10cyksDQo+ICsgICAgICAgLnBp
eGVsc19wZXJfaXRlciA9IDEsDQo+ICsgICAgICAgLmlzX2NrX2RlX3BvbCA9IHRydWUsDQo+ICsg
ICAgICAgLnN3YXBfaW5wdXRfc3VwcG9ydCA9IHRydWUsDQo+ICsgICAgICAgLnN1cHBvcnRfZGly
ZWN0X3BpbiA9IHRydWUsDQo+ICsgICAgICAgLmRpbWVuc2lvbl9tYXNrID0gSFBXX01BU0ssDQo+
ICsgICAgICAgLmh2c2l6ZV9tYXNrID0gSFNJWkVfTUFTSywNCj4gKyAgICAgICAuY2hhbm5lbF9z
d2FwX3NoaWZ0ID0gQ0hfU1dBUCwNCj4gKyAgICAgICAueXV2NDIyX2VuX2JpdCA9IFlVVjQyMl9F
TiwNCj4gKyAgICAgICAuY3NjX2VuYWJsZV9iaXQgPSBDU0NfRU5BQkxFLA0KPiArICAgICAgIC5p
c19pbnRlcm5hbF9oZG1pID0gdHJ1ZSwNCj4gKyAgICAgICAuaW5wdXRfMnBpeGVsID0gdHJ1ZSwN
Cj4gK307DQo+ICsNCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RwaV9jb25mIG10ODE5NV9k
cGludGZfY29uZiA9IHsNCj4gICAgICAgICAuZHBpX2ZhY3RvciA9IGRwaV9mYWN0b3JfbXQ4MTk1
X2RwX2ludGYsDQo+ICAgICAgICAgLm51bV9kcGlfZmFjdG9yID0gQVJSQVlfU0laRShkcGlfZmFj
dG9yX210ODE5NV9kcF9pbnRmKSwNCj4gQEAgLTEyMTYsNiArMTI2MCw3IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10a19kcGlfb2ZfaWRzW10gPSB7DQo+ICAgICAgICAgeyAu
Y29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODgtZHAtaW50ZiIsIC5kYXRhID0gJm10ODE5NV9k
cGludGZfY29uZiB9LA0KPiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTky
LWRwaSIsIC5kYXRhID0gJm10ODE5Ml9jb25mIH0sDQo+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9
ICJtZWRpYXRlayxtdDgxOTUtZHAtaW50ZiIsIC5kYXRhID0gJm10ODE5NV9kcGludGZfY29uZiB9
LA0KPiArICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTk1LWRwaSIsIC5kYXRh
ID0gJm10ODE5NV9jb25mIH0sDQo+ICAgICAgICAgeyAvKiBzZW50aW5lbCAqLyB9LA0KPiAgfTsN
Cj4gIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG10a19kcGlfb2ZfaWRzKTsNCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpX3JlZ3MuaCBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHBpX3JlZ3MuaA0KPiBpbmRleCBhMGIxZDE4YmJiZjcuLjNjMjRk
OWU5ZjI0MSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGlf
cmVncy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpX3JlZ3MuaA0K
PiBAQCAtNDAsNiArNDAsMTIgQEANCj4gICNkZWZpbmUgRkFLRV9ERV9MRVZFTiAgICAgICAgICAg
ICAgICAgIEJJVCgyMSkNCj4gICNkZWZpbmUgRkFLRV9ERV9ST0REICAgICAgICAgICAgICAgICAg
IEJJVCgyMikNCj4gICNkZWZpbmUgRkFLRV9ERV9SRVZFTiAgICAgICAgICAgICAgICAgIEJJVCgy
MykNCj4gKw0KPiArLyogRFBJX0NPTjogRFBJIGluc3RhbmNlcyAqLw0KPiArI2RlZmluZSBEUElf
T1VUUFVUXzFUMVBfRU4gICAgICAgICAgICAgQklUKDI0KQ0KPiArI2RlZmluZSBEUElfSU5QVVRf
MlBfRU4gICAgICAgICAgICAgICAgICAgICAgICBCSVQoMjUpDQo+ICsNCj4gKy8qIERQSV9DT046
IERQSU5URiBpbnN0YW5jZXMgKi8NCj4gICNkZWZpbmUgRFBJTlRGX1lVVjQyMl9FTiAgICAgICAg
ICAgICAgIEJJVCgyNCkNCj4gICNkZWZpbmUgRFBJTlRGX0NTQ19FTkFCTEUgICAgICAgICAgICAg
IEJJVCgyNikNCj4gICNkZWZpbmUgRFBJTlRGX0lOUFVUXzJQX0VOICAgICAgICAgICAgIEJJVCgy
OSkNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5j
IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCj4gaW5kZXggNDlhZjJi
MTlhODVhLi5hZDFlYjkxMDY3YzAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2Rydi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2Rydi5jDQo+IEBAIC04MDUsNiArODA1LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9k
ZXZpY2VfaWQgbXRrX2RkcF9jb21wX2R0X2lkc1tdID0gew0KPiAgICAgICAgICAgLmRhdGEgPSAo
dm9pZCAqKU1US19EUEkgfSwNCj4gICAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10
ODE5NS1kcC1pbnRmIiwNCj4gICAgICAgICAgIC5kYXRhID0gKHZvaWQgKilNVEtfRFBfSU5URiB9
LA0KPiArICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTk1LWRwaSIsDQo+ICsg
ICAgICAgICAuZGF0YSA9ICh2b2lkICopTVRLX0RQSSB9LA0KPiAgICAgICAgIHsgLmNvbXBhdGli
bGUgPSAibWVkaWF0ZWssbXQyNzAxLWRzaSIsDQo+ICAgICAgICAgICAuZGF0YSA9ICh2b2lkICop
TVRLX0RTSSB9LA0KPiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTczLWRz
aSIsDQo+IC0tDQo+IDIuNDcuMA0KPiANCg0K

