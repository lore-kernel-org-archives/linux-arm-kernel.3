Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB7AD65553
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 05:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GdhExuZIEB8ulsJ033xFYqR0JvCeBeg6cBQXpnonmpE=; b=XuT6EJsYGBISjjN+RUIXNJ/pQA
	ahOH6fwqDxE6VuCHiTVuxTLRbe/7vjYGqLLlGd0qG91nmIz/YkGGkEQqnWLtk59wpCqia+QOP3IcR
	DYwc0rARTxV4vhk+yhSkCNk189Yi0F0AWzoIZiEMQvO11WxphJC/TY96MqTr77VZ6+wBNxdUOV0uY
	Yb7gORRyoaNmiH654hSyF+3avz7QJxMw52X1MeXbnxKj3nnLFDRmaMXkPVfTG/tvr1/DfjDzNTZ9D
	YcBm9zbk0EOytj0Q1u+d1CoVU0IdwdFsXpatOfq58hexF1O7CT4fMW5JVnREG36dCeGPgCwRzro0R
	V0jclv6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGXM7-0000000EkY4-3RF0;
	Thu, 28 Nov 2024 05:46:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGXL9-0000000EkS9-2BU2;
	Thu, 28 Nov 2024 05:45:24 +0000
X-UUID: f2a264daad4b11ef9048ed6ed365623b-20241127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=GdhExuZIEB8ulsJ033xFYqR0JvCeBeg6cBQXpnonmpE=;
	b=NsRpf9M4nGjFqUV8ZirzyMDfGPZeIipD3v9sdtmMl5AAXoRIOQanV+lc9K4yKDFXFUZb5+vBNYZmfAvgjTIB3FRCJ3te993F7IC3sjU1Q1vnTrrLlDB0iS/fxEKlx/RA8cY45mSAFueSlhGaXIBE6vb51kP2RencDSRIgJrzf08=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:d8f5aabd-ad19-406e-900e-4a1e93ead1fe,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:450fa123-634f-4016-85ba-2d63e55c9400,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: f2a264daad4b11ef9048ed6ed365623b-20241127
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 8144577; Wed, 27 Nov 2024 22:45:17 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 28 Nov 2024 13:45:14 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 28 Nov 2024 13:45:14 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EqAiKNuOe0pnSXJ/DHObjCOpjKk1HoXkO6aruyCRUHnHHsGSLGx+Q09+Vxlwnfy9QqsGEKKH07EPGlkHKCIIrRAld7FsOLoN0IZ8vgPnsq26WfvIGg4UB+fTMm4rmlZkYg54dPylhsbUrHeHxYUmSBNCOnqBVuU7cC5QVVOAAzl0qWsdZ7UJK5+Sb0K+o+tbnDV6U553ky6pYNyKQyJlwqDrGWhJ7MDQOX+QXIxjTZKrPDSLgtZ/svgtBMW5U6vWxLXV7exLfxsrJYEPAatRfyPUxVwgPkiPATLU/+dCU6T96/9mLcAktyUNNP06nSvUjKLvTARVPqToZJTPcYP0jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GdhExuZIEB8ulsJ033xFYqR0JvCeBeg6cBQXpnonmpE=;
 b=ejDS3OAc8tgEa3DSO63nKURcxOxY6ZTy3TWHnLdiAcxzadSCaPatxtOJDzYrAct9uNF1SWvzV7BorFetuyLDyjLgHk/ArfBzgltDeXa/4ACAkh9WyHpO5u1ESuQRXwvX4Qrsb759/T6UwOgGuBOH0kWOWadd6+8GxHn0Q/AXEdS3qCKp66r0YQX/UwRWhIKiLwfB4JB+Q+DmPEPsZTZVdETzrwbwTHLnbEvm+0fkYj/IfvhgxTBITMEAWMgJGW8fcO95JA8aSiCg1o+fzTiu/LxfjQvCdOr/LHB/9GSHEEDqAvjET9hSldzGDJgtqEkTyUityoJAJylCwoHcfB9Xkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GdhExuZIEB8ulsJ033xFYqR0JvCeBeg6cBQXpnonmpE=;
 b=sM/+O3Kmaan45Dl1b+af3Z1t1SphiKIknkCF2ljEpdffK3qEh7LYwhCLq16JM8gR/NMhDuabiVNE0G+x25cttd9/lX4etUkzg2QleNrozZbXMvo7J2FtR571IIqyNtErXoBX2dZvJ2WUkkWWxM4BdAo04DnLLTfapR4tQGQLDLY=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7475.apcprd03.prod.outlook.com (2603:1096:400:410::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Thu, 28 Nov
 2024 05:45:12 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8182.018; Thu, 28 Nov 2024
 05:45:11 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"sui.jingfeng@linux.dev" <sui.jingfeng@linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "kernel@collabora.com"
	<kernel@collabora.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Alexandre Mergnat <amergnat@baylibre.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "dan.carpenter@linaro.org"
	<dan.carpenter@linaro.org>
Subject: Re: [PATCH] drm/mediatek: Initialize pointer in
 mtk_drm_of_ddp_path_build_one()
Thread-Topic: [PATCH] drm/mediatek: Initialize pointer in
 mtk_drm_of_ddp_path_build_one()
Thread-Index: AQHbNPDFU6e2ZmspN0eeFYb8eurZvLLMR3+A
Date: Thu, 28 Nov 2024 05:45:11 +0000
Message-ID: <3021edf83e5ad32c1ebe9ea711127956aedc211c.camel@mediatek.com>
References: <20241112105030.93337-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241112105030.93337-1-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7475:EE_
x-ms-office365-filtering-correlation-id: b761be10-0779-49bc-528a-08dd0f6fd370
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cE4rUjVoajhxWDFwa3RhaU91RGVoLzFkYm1UN2FoU01oV2NIMHFoSVFkMVhM?=
 =?utf-8?B?a3dPa0JWTExta2ZUdE44bWZCY0k1SWUwS2R0Zm9SYUFVcG9SNjFsU1l5MVFp?=
 =?utf-8?B?SzNLK0ZZeEFMaGYyNXNsbGVLc29LUE80eVJSQjFWVkZmeFAvOFY2NzZiaTk2?=
 =?utf-8?B?WjdYWkpzdmFZUlhGb3dmR0N5OVE5MTR1N3k1UDRHNzFTNDVtakNLbVZmemIw?=
 =?utf-8?B?dkh4YkJ1QjVlTlNoZE5ndDB4QUk3SjhaRFJCbWthQUlaVXNPU1BGSzI5SHhx?=
 =?utf-8?B?ZW5ZVnBvZ1c4NTZPY0NjS3d0ZTNVbG5lTUhPcVhsNmNJN1RBNy9OSXF5K2NE?=
 =?utf-8?B?RHA4OEVWU3MyN0hsM2hWS1JQcDU0cXczU0FPNEloSldvRWZFNnczckszdS9X?=
 =?utf-8?B?d3M1dURRWklZaThJSEg5RGJaL2dwMUswR1ZRTUQ2eUFDNHpMUWlsKzBxdndM?=
 =?utf-8?B?TUZHWHE2cTZpREIxMDNvdXVGWi9pSHczc1h5ZTl6V2w0ZGI2cm44TzlnbW1P?=
 =?utf-8?B?d05nMmZoY3Nua1MzbzI4TThFbjFrS2hqNzRJbGsxd0RFWm85alVITFRTd0Fy?=
 =?utf-8?B?K09aZHlMNnFwWStjVW83SkNRTlQwRHV4WDhpL2xQeXhhb21yUjBObTNHaFQ4?=
 =?utf-8?B?R1hsSmNHOVV1OUM3Nnc4c0JUMDN0aHQxc0g5T1owOXNUMUFwRE9XN3RYUy9O?=
 =?utf-8?B?c3NsM0R4RmdoWkFKeERKVUlOd0FmcWxlMDJycmc5bm9NRnF5aEZIZElvT3FY?=
 =?utf-8?B?bDVNSHdyREdFUS9aZkZUdG8wN3BHNWlJY3N0MG9ia0dhMTBVR2FyWnJ3c2lB?=
 =?utf-8?B?dnpBZjhNYlRRMTNPWUFQUElZV05UeWQrTWxTSXozeFhXaUcvaWppMkJNVm1C?=
 =?utf-8?B?dVNLSm9aY01yQjIvc1psc2lwRDNCV3krZXN2SzdTQ2tGR1h6NGpTQ3RCUFJz?=
 =?utf-8?B?S3ptTEROSStwOGJoK0FoZWZrR2p1aCtQMUVWQXRlTE1hOVhIMHhQb0lic2cx?=
 =?utf-8?B?WStFVE05QVQvMDhYNWR6Y1YxY205Rm1ENG9abm5GOC9udGllSmtmRzR1bllx?=
 =?utf-8?B?UG1tZkUxVWFnRXZwQ3VwVzhDRGtUcXl5RmFKSkIvT04vTXpzakhoNU1ERHpG?=
 =?utf-8?B?MERMRUkzbThkRHFqZVVIR1hvTVVZRHRENDdBRlJ4QjBHbjVUTmtMWEszVG1n?=
 =?utf-8?B?T3lGdDZTK3owYzVMTkNyaVNCcHhSOFBHMm1BcitSTG1wWVY4aXZFK3N3dWZD?=
 =?utf-8?B?MFNXa0JDMVJQbjc5OWlHeFZXeEJ3RUozQktUaE1iSHFMd0M1c2w0eGIvaWFn?=
 =?utf-8?B?aUhuNEU0UUkzK284U09FZ1RVUEI0U3AzZGJOKzdlSTZMV3NjTk41ZmlFK2hy?=
 =?utf-8?B?bE9qT1FOU29LMDVNb1ZHZVIycTNYcUpCWFNKaEpidkVUd2hzR3FON1dLV0F0?=
 =?utf-8?B?SGxDYnBDTzl3N2V6eGVjRjd5UWFwZmV4ZkRSNkxTcUVrMHdla2dEWWluMElT?=
 =?utf-8?B?Z3lCeHRSTDdPVmtqWkJOTVV4dGdtMTRwcnZjOEQyU0pXRFhuRG16dEt1Smtm?=
 =?utf-8?B?a0VYVktCTFh5bDBaTTJ4YmNlNEsvM0FSQmxhKy90M0F2RWMrOUwxdWZxZVJP?=
 =?utf-8?B?UFFDdmg3NFpHKzNFTHlMT2lkNGp6VEJ5aGxEY3JZd013THoyRXdXbFJsSlRD?=
 =?utf-8?B?dzlDMTZoYjJxUFova29wNVU2MGs0anRGL1duZmtQL2ZIaU1BMGRHOEhjY1dj?=
 =?utf-8?B?S0pabWRxNVpvQlFQQml3MWVKYVZILytySmd5aFZ0dlZleDYrRkx5S0pzd1Bl?=
 =?utf-8?B?Ty82b0t2RW52ZVpiaW54YllJS2tSVDU1MEMydHdsMlpGbGMxR3I5b2FaczVW?=
 =?utf-8?B?eVE0MFBncisyKzVYMUxWRlRzUmZwanl4eGZxUHo0eXJJUkE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q3VtZXVtaEJrMzArL3h2N1c4TCtJMVV4WmZ5VEEyenFMVUViUjBOVDhsdUxP?=
 =?utf-8?B?cTVJQkdEYjZ3WFBua1RMUXVXNGpGRUo2K1VCVGlHelY4WnduWU5LMGJPQUZ3?=
 =?utf-8?B?Zk16VVV6WHJIMnVZbC9oN3RLcmg5MDVDSGFiR2tydStEUUJhdnN4dEp3Y1BU?=
 =?utf-8?B?NjE1cWZHSmplbkVaTmk1dUx6QzBQWk9WbU5FK1NWNWVXY3NSRmVxWVZHY2Q4?=
 =?utf-8?B?L1F4aUpHd2tRakREYzdCczVBblBsVXBXLzdycEdjL3FxdXJXVGF6VHFnL3NE?=
 =?utf-8?B?OG9aZ0M1SDJCL2tOTjRtZGZ4TGdlNEtzK25LN0RVbVhzeHVWekJiVE5YVjBD?=
 =?utf-8?B?Snd3NlpRWitIYXJTcnhJczRxTGVTMWxGVmh2dkZPMnl0UUtBNy8wVEozTkJG?=
 =?utf-8?B?WnNVbnVrZzB3M2NwL1NFRzBGRkk4Q0NpaHBROHprME81SDZsKyt1ZkhENm1D?=
 =?utf-8?B?VzJ1UDF1L2czTUYvOWVhK1FaQ01LU2VFa1k4NE0xZDdZazFVQ2ZtQ2pvcVRB?=
 =?utf-8?B?OFRCdkFOZDZRaFRPcWpRYVV3cllnS0hqeC9aUnkzSk04WXBJam9CeE8wNE5P?=
 =?utf-8?B?ZGxheUl1bHhjUjkyNnRCdjNNZUR5S3U4Wm1tN1pnMitva1lMZ0o2ZkZsb3d6?=
 =?utf-8?B?OFBoQmdwQUdLQjB3OTNXMDE3cGdGNVlIRlVPTGM2c0FxZWJFb0pmK2MzRmI4?=
 =?utf-8?B?TnU2eUV5QVE5cEhkdSsrd1FuSmJ4VTFyTEpDRW4xRTMxQlpRQ2w1cVpZc0Ix?=
 =?utf-8?B?Z0tncVBFaEl4MUxNTWk3RDlONXlGMzVYRit3TkZHcFArRzVWQVE0bk9JT2NZ?=
 =?utf-8?B?QmEvSEJIMXFtanhXVkFpZmdnUlpLL0RjU3pLRENVRTFYdytqbGV1WVI4TXRq?=
 =?utf-8?B?Tit4Und0WDlHSVpwdnEwRkxFVm1aaHplUWtoeUwzWTNXVEUzSWNRdldRTzNW?=
 =?utf-8?B?ekVacVpFVXVLU3oxT2EvcUFqWU1CU2hjT21iYXRPSi9KbDZRRlUzcEJJMkhJ?=
 =?utf-8?B?QWkwcFlJWEtrUFdPVGcwWHVDNjY2YTczbGNjcmF5UjZpOTdWRjhKN0dISWFK?=
 =?utf-8?B?cXhyaXd2UkVUZS8rNHlyOEFtWHQ4Y3BYTGdOMlptdFNMbjhkNWdIU0tzR1B0?=
 =?utf-8?B?UjF0SFYzSDhZaUNWQ3BZb3B4ZXFSRXVMdWxpV1BLKzRmSis2Y2JyVVJVWlRF?=
 =?utf-8?B?TGFLSDBaNi9hZzdOMk5iOERBbi84WmpGUGdJaWJwT05peDJMaDNZWU1YNkc0?=
 =?utf-8?B?S3lQN3JNbTRYOFRBbzdQWjlRNFBacHYva1d6dGovUW5ZQTFxNjVHdkwrQ0dS?=
 =?utf-8?B?bVY0OWFVOEVwZ3VIRldlbjNXWS9pd21MUXF6dGI3NWpVYndocVdGMFdkVi9Q?=
 =?utf-8?B?NVJEUlk0UEZPQ2RlQ3hHb1R2dzBVdGl5U3NoNUFvZVN6V1lxKzZwSWpYL0Zh?=
 =?utf-8?B?WmJyWE9DUldmTm95UXkvUHpWcjRrVVdrcDFVeUYrK0JxYUZCK0FUV1EwejRt?=
 =?utf-8?B?MVkvWHdzWXBTOXN0bGJWaG9tdG50RG9HTFJKbEZNQ2ZGRWtncGkzTHoreEdo?=
 =?utf-8?B?ajJrOStXVzhQVnU3VWFtMEFRRktTUmloS0NkVm1oUzl3aUZreUdFNlkxQlVU?=
 =?utf-8?B?WklYbmdTbU9CcitPMVNRNEhQRWp2V1ZOTVJLT1pTY29ueStQNmJROHZObWRT?=
 =?utf-8?B?UFUxUlM2aU5FM3ZIN0RVNVBFQ3J1TTBibTVITU1aNkNHR25wb05CUnhSZlNG?=
 =?utf-8?B?UWMrM2p5Z3Z0cXhwUVJTbUZUQWRyUWRvNjhhak5KSTNkazZ2TlhtazM3OGRQ?=
 =?utf-8?B?R3ZQTXkvN1pSdzFrbytYa1ZRL0VhVXVTeEdtaUNNREdHS0xyTWdISTcrazEy?=
 =?utf-8?B?UmtIb0lYU2Ywekg4NzRCZ094R0J4U1BrNkdVWHI1RzV3SkIxSGNlemFkNmVP?=
 =?utf-8?B?c3d4Z1FkQnRpRjd6SEtKTXRJSk04VzNqaWU3UlpMQjhRN25PeENDdlhXNk1F?=
 =?utf-8?B?bjNYVFMyK0oxazFVUWZMamd4TnZEcUJmL0hmZmVvTm9XSmxQa05xQjVHcFpK?=
 =?utf-8?B?NTFlc3FXY2hjWlpZR2FzNnovazhHZFpxbDN6cUhKR3hDd1E4a2VzM0FYT2Rs?=
 =?utf-8?Q?d2rG1Kg4dwPPnMxTZsx53idMk?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DD3E3B301E7EDA419E3876EC71D4405E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b761be10-0779-49bc-528a-08dd0f6fd370
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2024 05:45:11.9352
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SmfjI6tbazIGslRq4kSPz+VjX8xvd1/fLZHt/vNnN23juTPSs2ixTzUiUy8GGqkJpnomKoWTQnOTDPUAq9ZioA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7475
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_214523_581682_E2E4D948 
X-CRM114-Status: GOOD (  20.31  )
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

SGksIEFuZ2VsbzoNCg0KT24gVHVlLCAyMDI0LTExLTEyIGF0IDExOjUwICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBUaGUgc3RydWN0IGRldmlj
ZV9ub2RlICpuZXh0IHBvaW50ZXIgaXMgbm90IGluaXRpYWxpemVkLCBhbmQgaXQgaXMNCj4gdXNl
ZCBpbiBhbiBlcnJvciBwYXRoIGluIHdoaWNoIGl0IG1heSBoYXZlIG5ldmVyIGJlZW4gbW9kaWZp
ZWQgYnkNCj4gZnVuY3Rpb24gbXRrX2RybV9vZl9nZXRfZGRwX2VwX2NpZCgpLg0KPiANCj4gU2lu
Y2UgdGhlIGVycm9yIHBhdGggaXMgcmVseWluZyBvbiB0aGF0IHBvaW50ZXIgYmVpbmcgTlVMTCBm
b3IgdGhlDQo+IE9WTCBBZGFwdG9yIGFuZC9vciBpbnZhbGlkIGNvbXBvbmVudCBjaGVjayBhbmQg
c2luY2Ugc2FpZCBwb2ludGVyDQo+IGlzIGJlaW5nIHVzZWQgaW4gcHJpbnRzIGZvciAlcE9GLCBp
biB0aGUgY2FzZSB0aGF0IGl0IHBvaW50cyB0byBhDQo+IGJvZ3VzIGFkZHJlc3MsIHRoZSBwcmlu
dCBtYXkgY2F1c2UgYSBLUC4NCj4gDQo+IFRvIHJlc29sdmUgdGhhdCwgaW5pdGlhbGl6ZSB0aGUg
Km5leHQgcG9pbnRlciB0byBOVUxMIGJlZm9yZSB1c2FnZS4NCg0KUmV2aWV3ZWQtYnk6IENLIEh1
IDxjay5odUBtZWRpYXRlay5jb20+DQoNCj4gDQo+IEZpeGVzOiA0YzkzMjg0MGRiMWQgKCJkcm0v
bWVkaWF0ZWs6IEltcGxlbWVudCBPRiBncmFwaHMgc3VwcG9ydCBmb3IgZGlzcGxheSBwYXRocyIp
DQo+IFJlcG9ydGVkLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQGxpbmFyby5vcmc+
DQo+IFNpZ25lZC1vZmYtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9h
Y2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fZHJ2LmMgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2Rydi5jDQo+IGluZGV4IDlhOGVmODU1OGRhOS4uYmMwNmM2NjRlODBmIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KPiBAQCAtOTAwLDcgKzkwMCw3IEBA
IHN0YXRpYyBpbnQgbXRrX2RybV9vZl9kZHBfcGF0aF9idWlsZF9vbmUoc3RydWN0IGRldmljZSAq
ZGV2LCBlbnVtIG10a19jcnRjX3BhdGgNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBjb25zdCB1bnNpZ25lZCBpbnQgKipvdXRfcGF0aCwNCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgKm91dF9wYXRoX2xlbikN
Cj4gIHsNCj4gLSAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5leHQsICpwcmV2LCAqdmRvID0g
ZGV2LT5wYXJlbnQtPm9mX25vZGU7DQo+ICsgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpuZXh0
ID0gTlVMTCwgKnByZXYsICp2ZG8gPSBkZXYtPnBhcmVudC0+b2Zfbm9kZTsNCj4gICAgICAgICB1
bnNpZ25lZCBpbnQgdGVtcF9wYXRoW0REUF9DT01QT05FTlRfRFJNX0lEX01BWF0gPSB7IDAgfTsN
Cj4gICAgICAgICB1bnNpZ25lZCBpbnQgKmZpbmFsX2RkcF9wYXRoOw0KPiAgICAgICAgIHVuc2ln
bmVkIHNob3J0IGludCBpZHggPSAwOw0KPiAtLQ0KPiAyLjQ3LjANCj4gDQo=

