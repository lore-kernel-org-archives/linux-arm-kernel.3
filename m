Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EDAC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 07:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDJUUnkbIpYeRkQVZtMHHFj5Al/pdfPffqRtsU+Rm+8=; b=G9G/Onw5q+XePLtaHHf9CjNNex
	AyN49zyNeTfpZhWLHZUAT1+4/E02CgL8/fiVzrnA+xuF1NgYycLBxFli2trJe/TFbgdKBwOUGXs/Z
	2zTIPZ+ivVk2HkKUO0z8PGEjWsNc5Z9D5Xy9x7ZttyFkGdKHKR4GCc02PfIWdTNLaIYYrVStOzFrs
	sewHrVN82QDrSbUULOK8mK59oMYor7K2Gz7gPBN81BlgK3XvPTTRSXlbnAenHuMlK+uoqKaOT0th8
	FyIr/O9v6p/4nPOI9KFpADKI67wXmkHHYJSIS6y6+VL/qkRZBmptFkLnxHf4HMvDsl5d/sJGI7mIn
	x04LUIww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taVMB-00000009cNu-0lYN;
	Wed, 22 Jan 2025 07:40:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taVKs-00000009c95-39Xp;
	Wed, 22 Jan 2025 07:39:39 +0000
X-UUID: 060c5a76d89411ef82ff63e91e7eb18c-20250122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=NDJUUnkbIpYeRkQVZtMHHFj5Al/pdfPffqRtsU+Rm+8=;
	b=U+JNfcpnotjq8F3LOYzlTvx3oX61i3MWwoUjRitT4ffpdxEWK3lIyoljdgFCKGzEbv5iR3gVIeQcWLkSSrqbSvIix7tWl1GodZHEJh05PflZhlp/0A2gf2mjh3ntKsuh1tlFQjSYzcSsFlWYUP7ohlERNbvcp8oZq+azcGJwwic=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:4bd346e5-7536-4786-b1b5-41903e506166,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:499cb278-fdda-4ad2-be9a-d144dfbaf8ee,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 060c5a76d89411ef82ff63e91e7eb18c-20250122
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <friday.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1846742072; Wed, 22 Jan 2025 00:39:33 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 22 Jan 2025 15:39:31 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Wed, 22 Jan 2025 15:39:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vNqpEg9WE7kj05RLhMKXjzhhORn2rnIJle9wr2I7UwlUW/19J01DI+Ecqqb2WrtVq+6WjnHwDfIQnkOVjhK/mSo/Goh7rhKCeTVxPbkjsynDN5B/jf+xURhog+dsLPWORFsei4ILM6Xf85xVTMunxj4hzs0tfSGDgZWO020DKnhNcfsHVZz6w9KgYSJ745vhlQ7iDLD0RfL4I+E6HDmsBEF3HAFZILp4mdGyg2jsgYqDGVLEX+wHhr3hJIxr39zq/62UbHobbHtzKyyNWfDNuDpFfrwYeZOgzM9YyImid07Lh99TBGUWJihmDajhFoAdrDx/s//HQwRjsxVhx9v+yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDJUUnkbIpYeRkQVZtMHHFj5Al/pdfPffqRtsU+Rm+8=;
 b=apSqSSGXXbcxVmEglgk6QtFovedC4hLI7anKpBwIVB9IIooxODfsO9tuf6jeAwQrnJqNFYSjWkA223iLsX1bw12gkrB/whMVpL9ZFxqmMvABg11p/BSudVZ+IXa4LSxE0omu/aEwsXO6SCiSF1r8IesSYOvdB6jRywx0qzbxYsb7XhAuRFJ5mkgMdXt1r0+DDOyDEnGlo6WdY8bQAmxXOTpAq17tJCvO/3tV/PYw1sEqw5k8gtl/GVegL3+rWVKBgOASZIOE+OGp0CZpNkL9ju80Vr6F1IjABu029SQ2qxIBL7AjxGHXIeL4AXyGL8OFqIh9Juo79gqwNUYB3TTS+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDJUUnkbIpYeRkQVZtMHHFj5Al/pdfPffqRtsU+Rm+8=;
 b=wBJbwEBbutdUDLT+GavQPyXNZIgT6Lkd4QyitLEd0PJUrU21McTouiBoEbHMfGtLmfx4n2CtJIbqK8awcEVfDxbJAGb3JOoBFzqC68orsb+wh+iPo+1ys9gaqrGbKQ+W896iR189/5hdpLN5kN4aW/2AWgtSAD7Ax0z0jpVZ4CM=
Received: from JH0PR03MB7983.apcprd03.prod.outlook.com (2603:1096:990:3d::5)
 by SG2PR03MB6537.apcprd03.prod.outlook.com (2603:1096:4:1d1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Wed, 22 Jan
 2025 07:39:28 +0000
Received: from JH0PR03MB7983.apcprd03.prod.outlook.com
 ([fe80::68cc:b424:7a97:b11f]) by JH0PR03MB7983.apcprd03.prod.outlook.com
 ([fe80::68cc:b424:7a97:b11f%4]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 07:39:28 +0000
From: =?utf-8?B?RnJpZGF5IFlhbmcgKOadqOmYsyk=?= <Friday.Yang@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	=?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: memory: mediatek: Add SMI reset and
 clamp for MT8188
Thread-Topic: [PATCH v3 1/2] dt-bindings: memory: mediatek: Add SMI reset and
 clamp for MT8188
Thread-Index: AQHba9Cpn/MZcFaCIkKTKmIXKW1VKbMhAvWAgAFm8IA=
Date: Wed, 22 Jan 2025 07:39:28 +0000
Message-ID: <e0aaa718aa4158cb5b276efa0529262d96db6b82.camel@mediatek.com>
References: <20250121064934.13482-1-friday.yang@mediatek.com>
	 <20250121064934.13482-2-friday.yang@mediatek.com>
	 <20250121-alluring-fractal-toucanet-c3b1ab@krzk-bin>
In-Reply-To: <20250121-alluring-fractal-toucanet-c3b1ab@krzk-bin>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: JH0PR03MB7983:EE_|SG2PR03MB6537:EE_
x-ms-office365-filtering-correlation-id: eefafdfd-a943-422e-36ba-08dd3ab7e70e
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NXBsdUwycTZ3UlRWSzJ4bVNrdFZzV2RjZDZNTkthb2k1VGMvMStGbWdFV2Fi?=
 =?utf-8?B?NGE2U2tRQ3NkaVJabVMrL1YvQjJqajNmK2FjUDFuQWZZRVhubjFmNWszc05U?=
 =?utf-8?B?MXpxRUtIcm4zMEFCcGVQLzQwd1dXcUtKR1F2eE51QUhudEthZkhXYlN6WkpO?=
 =?utf-8?B?aVZDRmR6dkhITGdRcXBzbGhUaTNqOHYzWkFhNllEcEkrcjdBOWpRR3dma2Ew?=
 =?utf-8?B?MmQrMzc2R0xyVURRU0pOTW4wb1dvVnZ3OGxhV1o4dXdQU3VkRG0rVkd6dzVx?=
 =?utf-8?B?VFYya2ZGRjM0bmRuVVpFZk9wUzVQdzdKYVJnT21XY0llQjF5OWhURWZkUjhy?=
 =?utf-8?B?bDQyNk4xZkpienBMWDY2eHVnK0x4UUJKOENMbnR3dUdpV3Z0cWx2WXRGeGVI?=
 =?utf-8?B?cUoyaVFCVWxZL25uaDh5RldoRHNJbzFZVE8yRis3a3N5MGlIMEpQRzZGMnlS?=
 =?utf-8?B?VHQ0TjIyZTdJWGxLZXVpSjNuaXRSeFVvaE85ME9LSHVMWGN0a21Ld29JaHNW?=
 =?utf-8?B?UmdwaWE5QjEvSmxPaWxSTlNVdUdiY1FvbFVOZ3J6ZGxuMjY3UGVpSytXZWl1?=
 =?utf-8?B?SkZ0TUNaRlN0MlE0VzFzaWk0MGRVYzYrRzdxdmsrNitacUw1NU0wWGFtNjZF?=
 =?utf-8?B?YTNZSHNKVW9uSEgrRHdnd01LOHgzV250aFozMTB1alhiK0c4bXE5dnVHeG8r?=
 =?utf-8?B?RDFRSk10T0JoZ0NZb2xVbk1YU1lvWTRmRE1VL1ZEdWRjR0greXJCdDdIeFZv?=
 =?utf-8?B?SGxCREVseFNtNXRhcFJlQ0c0bWI3ekRyUnRRbnJFQzFpLzRDNFpybERPS0Fr?=
 =?utf-8?B?SUFLc3FEY051TGJoMkxHWVl0VHlzeCt4NnFKbnlVeU5JVDl4azA3WnZHMlhL?=
 =?utf-8?B?OStWMVFLWm5meTJwS2dUQ3FLcURXbEFNZE5DYTUyODRWcmZEcjBiUW5Pd2Yx?=
 =?utf-8?B?UWpLSTl6VjIvT0JYVmgrR1l2d21tWjZ2U3U4cWUrTkphVmtHQUQxQzRhMzRt?=
 =?utf-8?B?WXJlYWxybVFNQTFxNnZ6M0EzU1U1YWRsdW5IejNjNGFwdkF1OFF3SVpTaktO?=
 =?utf-8?B?RmtrK2JXeGpkTEcvVkViRmZqeG15K2o0VjRXNW5mMUJMRGVtOU5UdE5hWVhj?=
 =?utf-8?B?T01INlQ0WVgySGk2NWZLeFd1MFJBWSsxVE9oTHBISUN2bjEvNUZTWVQrR2No?=
 =?utf-8?B?VDB4WFV4cWJoWmluTGcwR3d2Nmp4RmtacmFJSUMwSWN2S2IyZlgzSTJyWk02?=
 =?utf-8?B?YW9hWUZ1OXd2TjZzNkJiZWNLOGJYTk45RjlkbUh2bWVsemU0QnQydkU2TWdh?=
 =?utf-8?B?T3V5Unhsdk5pSzZiayt3T0N6NnhmSWRZUFoxbHdXVXpyYThOOU9EdFZsM044?=
 =?utf-8?B?MDFGdG1adytYK3NXcXcwRlpXUzc5dzhjWEsvWlV3R3c0U0x6a0x4QjRkYzRz?=
 =?utf-8?B?VWhJZ0ZGR1AweUowV2hzMHBnVGptRUFnZmlOTVFNQmRLNjlWQ0wrRmFmWStn?=
 =?utf-8?B?QVpTYzRyT3lMWm1Pa2Rhc3RhN000OGd0d0g0RHRSb0V1L0UrMURzOFJ6dTVj?=
 =?utf-8?B?MzRjWDhPMGh2YVFYczY1VmlBY0toL2FidndORVgyWVZIS2VsZW1yeHVLRllI?=
 =?utf-8?B?VGIyU01KbklKWG5UOE1lSkFvZ2czUFRDY1NPbVhmVjc2RUdFSllXd0VjcGRK?=
 =?utf-8?B?d1dacldRR24rRHRBNmcvOE01NVFLRnZ6cC95elhOZjhITjRPZVpuZTA3c3cy?=
 =?utf-8?B?RjRyRzVxay9ra0ZSK0NwRHZpeUtFVFRPYnlBZHlEUmU2TFBpZy91UUF5K2g5?=
 =?utf-8?B?UEswTE9kejh0bjJVQmFsZEJHT0k4R1RkMzg4UjNTMHVFSyszUUgwMjZ3SDZo?=
 =?utf-8?B?NTd4L2xrbkpsbXAxQ3ZxeFdmMWZMRllJZ0JIVmExMWNra3lKb3QwQjJKaE1o?=
 =?utf-8?Q?LQxEcRlQW1oZhAFe3C+JiBKWj36LKhzY?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB7983.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWhvU1Q5WjcwU3VydjROczk2L0pNRzlXeEV6UWVHWFdnQjU0MDFFSUxmS3Ba?=
 =?utf-8?B?UDlWMU5vUjdkdCtSbjJ4TXZYTS9OVk9nckttUW9WM0dENFRZVE5acEp1Z1ln?=
 =?utf-8?B?ZTQxbnVrWXNXRlR2bWl1b2dRUGZqTW5ieGhLdHJWRFNCNy9lSmdpTHdMUFBY?=
 =?utf-8?B?RlVsTnhTNFFrdWh2SWo2V3VaR1Y4ZUNCWHhTSFpQY2NVbnFqWk1aVVpOZHFU?=
 =?utf-8?B?ZjluWXp6b0ZjbVM3YmlIT3BVS3pwY3NSRWowRy9SdTI4WTdFMmRkek55bjV6?=
 =?utf-8?B?OG9rS2xwVTBxUHhlZWx0eHg3TnVSTGduNFJOc0RDK3A2SnVoZURPNUFrZmc1?=
 =?utf-8?B?MmFUMGRhWWYxcmh2ejZOOWVsQ20zN2c5a1JrQ09kelNNVzNLaU43Y0xvRGFJ?=
 =?utf-8?B?Q3ZvekJzZUx5QXJxeGJKeG00b0dmY1gvU1BXRVpUTXFKUnMyS1N6V05zZUI1?=
 =?utf-8?B?YTE3UWI3Qk9tNzh4dFY0dDJsWUR4ZUkxR1hhajN3YXZIT3l3T0wzcG91cGJ0?=
 =?utf-8?B?QlU3VDRielpub3FVQXJKRkw2VUMzdUcvSVYzZWdERUJpTFNHQjVCajVoNE1P?=
 =?utf-8?B?VVVaU21zWG1ZRjcrb05SaWt2a3J2T0JWRUs2QWxLTFYzNUV5aUFvc1dRa1dR?=
 =?utf-8?B?VTkxZGhDLzkxM3psM2g2TnR0ZzhZaExkSDR3OTNMeTVydGlQTVdFVGZmcW9W?=
 =?utf-8?B?NWxteURUZlh2ZlRzcGk2WnZEQS9SS2dhajN3cGZYbjBYdjF5M2RNWnVQU1Rv?=
 =?utf-8?B?MEduQnVhNTZuNWZlU3BrN09SeVU1Wnl1MDFiOTlNRlJicFcveEV6NzFyM0V2?=
 =?utf-8?B?aHVtUTlZWEExQnQyRkdxVDQyK1RGT3NsQnh4cyt1WnF1VFVBNE1aZVpFekN3?=
 =?utf-8?B?dkN4L1BRa29nZDlpNnRzdHIwNlBabmhSS1BJNG52Z203Snl0TlJhdFZ2M1hi?=
 =?utf-8?B?YWZTL2FZVEFLZ2JyTm51d0pDT2JBbnUyMHA1bzdJdmVVemhkSkd3YmliMXZU?=
 =?utf-8?B?N2g3WkZOZEVWdDRPTUVhTXdEZzZ4QWlPVkU1VlRQNjR5ekFrbU5ZM2U4RFU4?=
 =?utf-8?B?a0laSlhXTzMrVjBBMWNCZzRkSGNUeHBNYVNTZzJoRS92QU9tT3JaZHNSSEph?=
 =?utf-8?B?UWtSMjA5cTRQUDlkSzRRcVA0QnJPMlJxRW1mdFZxYWFXVUtqOGNsS2hNT3JW?=
 =?utf-8?B?U2pWeXh5NG1xRHBEUVl0VVlIeTJNVFlGVVFPSG5adGtjQUFaSHVnWmg0YXVP?=
 =?utf-8?B?QnNxS0ZCblhkcGdDc0VSbm41WW5YUk5rdFNwRkJnazBTcTM4RGQ2c1NINlFT?=
 =?utf-8?B?Q3NLRWswc2JMYSs5WFFwdkFKcnhyUlBFeVo1TCtnMnhGcEJ5a0ZQU2JxSHJ5?=
 =?utf-8?B?N2VlUGlTQnZRUjMvWGdwRGlrb2J6NzlzYkFZa2JsajBlNER3dVM1MXA0U1JL?=
 =?utf-8?B?K21WSGt3cTF3UnJONEE1TDZZdlRiMGw1U0pINUowWHE4VGptRGcxMlp2MUJM?=
 =?utf-8?B?cnp5OEJ6czN0b01NS1FENVNyVkduYmdXWVNyL3MyaXRiMDhBQklTc2J6a25j?=
 =?utf-8?B?Q2l3emZwekczVkNTRGErWHJvWGF2WTVlb0xKek50L3U0SUlKMERJRDBtRjJW?=
 =?utf-8?B?cUlJYVIrQjNsUG0xS3VjYi9uTXIydEdXR2IzVTdkUjQ1MWJhRWNmL28rQTFH?=
 =?utf-8?B?OFMxWVd3MmhUd05xMENORU8zbG5lWVdkZHB2YmVHK3ZXbi9YWG9IV0VYUVBT?=
 =?utf-8?B?dXNtQnNwd3lBZzkzL05LdkxBK3Y5OUlRNktyNGptSjh4Rk8vZWpVVmNZa3lm?=
 =?utf-8?B?ekRCeFZrZlA3V09MdldkSDYxVHFGNTdXejVyVmpIVUNoOFRsRzhUZEVIcnM5?=
 =?utf-8?B?ZG5KZ1pJLzJXaExnbmpqSHhhVXZicWJ0dG8xZHppVUsxa2I4VHdmL0RXeUtw?=
 =?utf-8?B?SFZyNHJQM1JRVWRnbzVPay9uSVJBcldOWHVqQy9qK2pxMHV1UzFVdW4yVW5l?=
 =?utf-8?B?SGZWVVRzUVM0bzI0TzArVGZ0NG1US05zQndlL1d6RWFRamJzNldkcUo1Z254?=
 =?utf-8?B?cWFCdzAyemtCTWFRQlVXQlo1S21nNE5IcEZDM0I2K3I1MWhuNjNlNklaRzhn?=
 =?utf-8?B?TjR0TjBBTWtUcnc1dFp3c2IyU2FDWUJuUG93T3ZpTU1rNy96L1N5dzZtZFh2?=
 =?utf-8?B?Q1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E719D69F6C69544E8CE34046DCA6B5F4@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB7983.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eefafdfd-a943-422e-36ba-08dd3ab7e70e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 07:39:28.6009
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lZRBUl66STnT8/pll+W5Gp+NkNAujuCZqzFsZxr60iEJ/VZ3jfKypBDEPZvV6zvzeuNq7bF4YLhRizYQNWUgJoq86FATXIHGWbFcSSYrci0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6537
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_233938_812237_49057429 
X-CRM114-Status: GOOD (  20.66  )
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

T24gVHVlLCAyMDI1LTAxLTIxIGF0IDExOjE0ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIFR1ZSwgSmFuIDIxLCAyMDI1IGF0IDAyOjQ5OjI2UE0g
KzA4MDAsIEZyaWRheSBZYW5nIHdyb3RlOg0KPiA+IEZyb206ICJmcmlkYXkueWFuZyIgPGZyaWRh
eS55YW5nQG1lZGlhdGVrLmNvbT4NCj4gPiANCj4gPiBBZGQgJ3Jlc2V0cycgYW5kICdyZXNldC1u
YW1lcycgcHJvcGVydGllcyBmb3IgU01JIExBUkJzIHRvIHN1cHBvcnQNCj4gPiBTTUkgcmVzZXQg
b3BlcmF0aW9ucy4NCj4gPiBPbiB0aGUgTWVkaWFUZWsgcGxhdGZvcm0sIHNvbWUgU01JIExBUkJz
IGFyZSBkaXJlY3RseSBjb25uZWN0ZWQgdG8NCj4gPiB0aGUgU01JIENvbW1vbiwgd2hpbGUgb3Ro
ZXJzIGFyZSBjb25uZWN0ZWQgdG8gdGhlIFNNSSBTdWItQ29tbW9uLA0KPiA+IHdoaWNoIGluIHR1
cm4gaXMgY29ubmVjdGVkIHRvIHRoZSBTTUkgQ29tbW9uLiBUaGUgaGFyZHdhcmUgYmxvY2sNCj4g
PiBkaWFncmFtIGNhbiBiZSBkZXNjcmliZWQgYXMgZm9sbG93cy4NCj4gPiANCj4gPiAgICAgICAg
ICAgICAgU01JLUNvbW1vbihTbWFydCBNdWx0aW1lZGlhIEludGVyZmFjZSBDb21tb24pDQo+ID4g
ICAgICAgICAgICAgICAgICB8DQo+ID4gICAgICAgICAgKy0tLS0tLS0tLS0tLS0tLS0rLS0tLS0t
LS0tLS0tLS0tLS0tKw0KPiA+ICAgICAgICAgIHwgICAgICAgICAgICAgICAgfCAgICAgICAgICAg
ICAgICAgIHwNCj4gPiAgICAgICAgICB8ICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAg
ICB8DQo+ID4gICAgICAgICAgfCAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgfA0K
PiA+ICAgICAgICAgIHwgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgIHwNCj4gPiAg
ICAgICAgICB8ICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICB8DQo+ID4gICAgICAg
IGxhcmIwICAgICAgIFNNSS1TdWItQ29tbW9uMCAgICAgU01JLVN1Yi1Db21tb24xDQo+ID4gICAg
ICAgICAgICAgICAgICAgIHwgICAgICB8ICAgICB8ICAgICAgfCAgICAgICAgICAgICB8DQo+ID4g
ICAgICAgICAgICAgICAgICAgbGFyYjEgIGxhcmIyIGxhcmIzICBsYXJiNyAgICAgICBsYXJiOQ0K
PiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEZyaWRheSBZYW5nIDxmcmlkYXkueWFuZ0BtZWRpYXRl
ay5jb20+DQo+IA0KPiBTb0IvRnJvbSBtaXNtYXRjaC4NCj4gDQo+IFBsZWFzZSBydW4gc2NyaXB0
cy9jaGVja3BhdGNoLnBsIGFuZCBmaXggcmVwb3J0ZWQgd2FybmluZ3MuIEFmdGVyDQo+IHRoYXQs
DQo+IHJ1biBhbHNvICdzY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1zdHJpY3QnIGFuZCAocHJvYmFi
bHkpIGZpeCBtb3JlDQo+IHdhcm5pbmdzLiBTb21lIHdhcm5pbmdzIGNhbiBiZSBpZ25vcmVkLCBl
c3BlY2lhbGx5IGZyb20gLS1zdHJpY3QgcnVuLA0KPiBidXQgdGhlIGNvZGUgaGVyZSBsb29rcyBs
aWtlIGl0IG5lZWRzIGEgZml4LiBGZWVsIGZyZWUgdG8gZ2V0IGluDQo+IHRvdWNoDQo+IGlmIHRo
ZSB3YXJuaW5nIGlzIG5vdCBjbGVhci4NCj4gDQoNClRoYW5rcyBmb3Iga2luZGx5IHJlbWluZCwg
SSB3aWxsIGZpeCB0aGUgc2lnbmVkIG5hbWUgbWlzbWF0Y2ggZXJyb3IgYW5kDQpjaGVjayB0aGUg
cGF0Y2ggYWdhaW4uDQoNCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCj4gDQo=

