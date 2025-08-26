Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284B1CA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 12:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cYIIDEF78t8waEhEnZ5wN61fob6LUvrseBC+xsLDkxs=; b=VOKjDEU367prqGcYBmFn20sisH
	Usvt8GUEYPWCDerxtGKuFut6CNjhqWZY60oD7+rEClXXHxpOW6r+bnBUgEihpSmheE+qBNTdRE3sF
	GSTMf65EtvsSJkkOIQCPV38dArjlk3BdZ3SlXDRI2JLwpWGhNHHOAevFFyD0o8+ZEUS9MdZT/KKub
	xNPOuVw++PDetcTZLZ9Z7X3slMxUsM3l/xNvOyhQlyZaIlmPdGUsJSyuFNAMZMHqdL7B2wwjq/dMS
	I8/HI/8ybrzmP9TPZqXcS2AxqPZWqCXp3RpLN35suDVchwk1NaUpXcZcV2TZFS+tVp30Wy4GpYB5B
	vtldf0bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqsc8-0000000Bv28-0Q6q;
	Tue, 26 Aug 2025 12:17:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqsUE-0000000Btvl-3JYC;
	Tue, 26 Aug 2025 12:09:15 +0000
X-UUID: 77c3b6c4827511f09eb0dd999d3936bf-20250826
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=cYIIDEF78t8waEhEnZ5wN61fob6LUvrseBC+xsLDkxs=;
	b=MmsShJoB0H8lM56uYytvy5doy7n+CFelOrZlPoro5+NtrW67j7ozTA1kHnm+y0dBrzrkA9FIXu0NlUtnnMiXwl46ptZjlg/1tHNPvTTz5BmYDcc3Hg3PkWNhvoHnyzZbuy8lFTRBZRn4F0tEa6D30EEQKbVPtawicKAq5fG+NRw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:31260cb1-bd41-4056-a184-5092e3269300,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:f01fa16d-c2f4-47a6-876f-59a53e9ecc6e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 77c3b6c4827511f09eb0dd999d3936bf-20250826
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <xion.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 152602617; Tue, 26 Aug 2025 05:09:08 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 26 Aug 2025 20:09:05 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 26 Aug 2025 20:09:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a3Sxwu1gUJRlkIrKYjFmQrvUhjzPqXOlwWDjLOzpV2+gcBc880yMl0tK0Kgsy1tKKSpZ7sxMPBLMsZv9x4bOmHQylROdgatlB4YffLzSsJX20xgPIzgg84gPp5zBfGo6fXq1LZoB9kDYHBVkWe7u4LQ+DizfShcAZ9bItXoMkMAFABv6T3wwNB5zswWeQ+L9gbKWc7polQ8rnYuJ+vzCoavPtIkaG4OP4Pv9Utx2nfsncD7267CX1zmbf1/rvVqk/7yGpyLMdiPUxEXh7XAzE0QBuESICR0zoyndjAyDqGLoDG9Y7gp9+B+UHFfYPF2MIrSo+GJFZ8HuSvhaCa9WAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYIIDEF78t8waEhEnZ5wN61fob6LUvrseBC+xsLDkxs=;
 b=JJEDZYjeE4Nd1VFW5RuVJcdQqwFnv0p6w3eLGKxvSeT1g9uT6LO312XpORr8bHzCdCebW3VNjQ9VpoI7iUnrYjksFxLkqHmSfooZmEChcuGGoNJRoiJhaPdO8ItsKLXunXKB/b9ODDb2vZM58wuVTSnGBH44eUJK0DACh0yPErVglo6ypY/G6PzNVSZl9gfwrRatx9M6fzpZVRg0I7Us7Rw2huhSPjArs+5QKGGUPW57Yv4XZ5rdtyDLp7r3q0tSERtg6biA4KLgrOno/Nsa802U9bI5h1HN4q/HC+pY2CQcy7iQTzdujWkkikZMTRCyyHw+EHdhlvz7qkrDrVOfzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYIIDEF78t8waEhEnZ5wN61fob6LUvrseBC+xsLDkxs=;
 b=qauH15VfHc9x/fT3kR6HczAZDjWXqMDfxuarIXraYq9C5AcJRhtTcm/drBLjqgjz6roE8EKYnQ8Q/OUmMpvRqF+76rN6Ntmknjn/nt0F09rnrbaKyeyFOnT2hMhTeXfJ9oKmw7fFGMHjwYj47/nfkyIYvDuZTKSkzTEcc4BMj0c=
Received: from SEZPR03MB8122.apcprd03.prod.outlook.com (2603:1096:101:183::7)
 by JH0PR03MB7383.apcprd03.prod.outlook.com (2603:1096:990:f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 12:09:02 +0000
Received: from SEZPR03MB8122.apcprd03.prod.outlook.com
 ([fe80::e130:f417:b0bb:f2b7]) by SEZPR03MB8122.apcprd03.prod.outlook.com
 ([fe80::e130:f417:b0bb:f2b7%7]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 12:09:01 +0000
From: =?utf-8?B?WGlvbiBXYW5nICjnjovpkasp?= <Xion.Wang@mediatek.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	wsd_upstream <wsd_upstream@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?SHVhZGlhbiBMaXUgKOWImOWNjuWFuCk=?= <huadian.liu@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "arnd@arndb.de"
	<arnd@arndb.de>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/1] misc: Prevent double registration and deregistration
 of miscdevice
Thread-Topic: [PATCH 1/1] misc: Prevent double registration and deregistration
 of miscdevice
Thread-Index: AQHcFZwQOZEhJSUEf0OpnbqCU1Sn+bRz0oaAgABtc4CAAER0gIAAEBwAgAAsAICAABn3gA==
Date: Tue, 26 Aug 2025 12:09:01 +0000
Message-ID: <d3a780c367478868319064c27e0b41c69d4cc722.camel@mediatek.com>
References: <20250825084556.10358-1-xion.wang@mediatek.com>
	 <20250825084556.10358-2-xion.wang@mediatek.com>
	 <2025082533-ranked-simply-4b63@gregkh>
	 <d3d0fc0e19f939c093e6df1ff08ce23be71636a3.camel@mediatek.com>
	 <2025082638-parlor-retreat-56ff@gregkh>
	 <1ffa28bf6e3dcde83a6a6a5dde163596c4db639d.camel@mediatek.com>
	 <2025082631-hypnotist-snazzy-147a@gregkh>
In-Reply-To: <2025082631-hypnotist-snazzy-147a@gregkh>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB8122:EE_|JH0PR03MB7383:EE_
x-ms-office365-filtering-correlation-id: b6dc0348-bcd9-4625-54f7-08dde4995836
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UkZidDhYYlV1OVVFekVqTlhtdkI4dFMwT0NmL2xzOGFFSWhBOEQ2ZXIyd3ZG?=
 =?utf-8?B?UEFuV0N2MSt3NVlUUTVIbmxRTThrMSswRVNMOEF6cGJwNWZjbEFOZ3JnbWJN?=
 =?utf-8?B?a2ZOVWxIemVXbTFad0VCUHpPWEVaU0VHa2hxTzh3QUJXVnpVbjlCaG9WTU9h?=
 =?utf-8?B?Z3Fub3ZLemRCeHV4QjQya2Jabm5vTkN1bTl1MitXanFLQTNKZy95ZVRPYm5w?=
 =?utf-8?B?QTJQcTAyYWFpa2JZT1RmU2s2dU9LbktDRnJIVzdoRVBuM294UHRyTlZXMXhF?=
 =?utf-8?B?VS9wcUJxblRhd1NxcVkvZFVjUktKTkJQSEZOWUpabFE2YUNXdmFTaW15THpt?=
 =?utf-8?B?OTgzSzU2TGVkWDQvY29wSVhWMXg5SEVXMk5VeE8wb0dERUJ4T3V1M2NXbUk5?=
 =?utf-8?B?Z0tzdlVwaUROWEVibWdYWGhQZ21aYTd0eUdLTktJakJ0NUxxUjJjSmRJOUhI?=
 =?utf-8?B?T0pnL1l6L2ErL0xPaHQ2SFBxWWQ5MFl6Q1N1L29UaGRRM0JMdFJ3OHZ5L2Va?=
 =?utf-8?B?bUJxWmlGSk5DTzFob3A1S3NMa2VtN3B6a2hwWW53NzEvR3lvZ1R6ZEtUQi9W?=
 =?utf-8?B?b2lXUUZPOUFVWXpLalRUQ0ZpaWM1ZVFlbmJ5VDlaOWwxcHUxSDFSREdrL3pY?=
 =?utf-8?B?d2Q0djVTTEFoYlJ1dVJ4RW9yTFNudkU5aHNmckFoUnFnY1FCZ2hyM2lmT0VL?=
 =?utf-8?B?ZWVRa25jbFVaL3hxc2JXUGVuR1V1SVQrZmtRQ0svK1dJc1VQcU05TzdMZFZO?=
 =?utf-8?B?dlE2dG5GNUt0SWc2Rkt3dlZzNU5OYVp2L1ZnQ3pQOGd2L1JTaWcwd21zTDRI?=
 =?utf-8?B?QnJ1VFloYWliRGtmY1JIeHcvelYxZkY1SmdTcDVxdWpRZEdwNDgzVUx5WC9s?=
 =?utf-8?B?SW9PWXBzSStmNmNDNzNzMEh4ayswM2c2WEVQZDE5cm0wVUp1Vk8xVXF0Nkd1?=
 =?utf-8?B?RjVzRloraytERmxNOGhMWGR3NFJFNVVxR21WdVNWZmh5eFg1SzJJaVM3dEpi?=
 =?utf-8?B?VkUvU0dUdFI2cHphYnlVajdKOHhFem5SQWV3ZjZkWE8wTWY1dFFHY05BbjVH?=
 =?utf-8?B?Zk9sMTI5SEYvOGxLaElxNnhQMHJtZ2VSOWlNRXYxSHc5V25tck9IR3NDNVo2?=
 =?utf-8?B?elNiajloYUpEN3hnTWdsRXJacTR1VVVabDdhYkN6SFRFMmZ6UGR0Wk5IT1hM?=
 =?utf-8?B?TWRIa3EwbWhWRC9VVzVONGxJdlcvTXF3QVFoVXVYK2t2Yk5BVVlqaWpRWU9l?=
 =?utf-8?B?cDgvQkoxSXR5bmptRGdiRDlaeVAxRXBKbkhDZURzMWFmQTRNSUkwUUNuT0hi?=
 =?utf-8?B?QXhUK0dZSldaZmVTRURhU3NObnBycG9STGswZTVCemFxVUNXU3hQR1YyQmdC?=
 =?utf-8?B?Q2FUQWtrbDNYNHFJL0hEeHJHMTRCNzlCcHp3REhFZ2UvTkxUaUtXYUZCTHVz?=
 =?utf-8?B?azBvcE1tcGpNSW9CNXVlTjBMZ3VFMUVJNHpLQkt1WGk3VUJCeEdsVFdYZkpU?=
 =?utf-8?B?ZGNjcGJyZTdxZXZaOW9hVWJYd090cklHdW5Nb1kyenQ5dW9tcnpmajlyQUd3?=
 =?utf-8?B?ZXNoSzVNMFcxZEx6SGRNM2w3c0RzZmYxNndDM3FlS3BEVHlsNzk5QWZpVkIx?=
 =?utf-8?B?bkJTZzU4ZEE2a2E5dUIxRkR6aC9xRmFoU1hka3B6K1B2VzVmQWJuaEpnc3Jv?=
 =?utf-8?B?VXpxVUNtM0dpTGZORHRiQ0dzYnNaUFAzQ1B1eGxRNEZ0azduTkJSR3NyQ0hz?=
 =?utf-8?B?S2hLSlFJMzVtdnBsMFRtU0pLbE56ZnRYaWowcHBzWEVjbW51TTQrQXJ6Mldo?=
 =?utf-8?B?TklDM3FhZU4vdVVlQ3J1N0l5VkZiYk9EWUY0dXBRWXQvZjVHeGV1dk5yTVI3?=
 =?utf-8?B?S1lsNUVydVR1czZZMFVqb255YmtYZjBUZmhtR1pST0hGQkJWajVRYkRJc3VT?=
 =?utf-8?B?SVRlMytmRURwVjBYeFloM012NGZrYk90bDVMckFHV05VQmh4RzIwU1RFek5W?=
 =?utf-8?B?OG5PNmQwaUlnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB8122.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2RHTjBOV1BIbHNSSWVjdFdlakZWS3RjZXVnVlRvZWo4WWNjeUJqSXh2MXRW?=
 =?utf-8?B?MWgzcmpHcDJMSXhIR1BVNlJ5ZWVmcVdMV2NPZU5BTkQzT09LOFphU2cxQ3V1?=
 =?utf-8?B?QUVwLzRZMUp3a3E4ODgyOVVIenRjZENOdkFrWDRHeU9ybnd1amdaTm1neElM?=
 =?utf-8?B?NkJJekpSU05FYUxjSmNGaExDU3FWdG91QUJZaHRSa3JISlkvZkNDc1NtM1pN?=
 =?utf-8?B?Znh2VEQ1bUFXMGtsY1I4N29jVk5VZXNGY1dZbndlbmRsMFNTd2dvZTJhc2hS?=
 =?utf-8?B?QXpqODRtd3dGaWNPQ01HYkN5S3ZrZW1FR2QvQ3FSZXR5OGcyR1FZcWh0TE5K?=
 =?utf-8?B?YVBzMjJyZTMxNEpsSWprczk2ZklpSk1iUFRwdHRWNGVvaWtXQitYdkVzMXFB?=
 =?utf-8?B?Y0d1UlBOQlZhUTFpOU9YWXBlMDdybklLcGF6cVNDMWd1b3ZrM2JZMDZQQWN6?=
 =?utf-8?B?dFhBZXFRWHpORUlJYUoyMmFCNnNGQnE1Z2pqRDlHWkxwOGwydGVPNkFyYnZ4?=
 =?utf-8?B?d3gyamtMSVNmL3ZteldKWW55TmRRWWp1T3JqK3dwdnhKSGszVW50SkNiUWF2?=
 =?utf-8?B?dkhBMi84T0p0RjR0eXRGeUhvU3hxSXg3MWF2QWFWVmVOTkpXUWlkUEpyN2Zk?=
 =?utf-8?B?NmxQR0NBL25mNTJ2SFdiZUw2VnJ6cm5NN1RBUVI1d09Vd2p0RW91VlhRbmNU?=
 =?utf-8?B?QnZPUWVtV0Fib2NRMjkwR2p5QUQwUElTdFY3eXQzSmNvQnpSWi9JTnorM3Z1?=
 =?utf-8?B?YnpFaEZoTjlZN2kwSm5mQjVpTEdHL3RNRTdhZlg2MmtvKzNQZVhUdGE4UTJ0?=
 =?utf-8?B?MzB5MnB2dDdZODNkdkxkOVJ6ZWkvRElUMVk5c1NFM00xcUtaNUVOZnRqWFM1?=
 =?utf-8?B?aGVhU3ZHbjBtQmVjTDVBczhsS1piN2dpNk9wTjFnSWl1elJ4eTBmRFFMZUpG?=
 =?utf-8?B?b3VpTGV0MnEvU0RqZVQ4Ui9nQU1vbWJiaUF5YXpZb2w1YnBjU2tCc0hycUtJ?=
 =?utf-8?B?Q2NQYkJEaDMxemhzWllwd0xtS25NR1BndTRZTDdSd2dOQ3I1Z3RuZkxOaWlI?=
 =?utf-8?B?c2k4U1hnU1VEZGp0T3VhVkFZWVpYN1hEWG9mckp0MWcvaHorSTJDU1pKSk5B?=
 =?utf-8?B?c3lSNXNrK2ZPWVBDOEFYdDVUQmRFYmtBUE1GYy9PcGVFL1RFV3VqYllMdWd1?=
 =?utf-8?B?anAxZDRWMzZIWFRZYk90R2hVdHRPcW1tNVlUcVZjQ2NvWHI3MXk1am5OR1dr?=
 =?utf-8?B?NTI5NTJGeWJXZmtWeDlkOVhJdGMxNkxuWjhBb1NLMERMVXdKT1VEOTJZUW0r?=
 =?utf-8?B?d2wyYWVkdGtWeUVqRlNJNnk1RlBpZ01jZm9YL05qdWJBU2FBQVJvNVpIdTRR?=
 =?utf-8?B?ZzF5bE4yckVlWVdKdndJMlhaVWs3TDBvcTRZRXdYdVJZaHliN3Q3VG9NOGpG?=
 =?utf-8?B?alR1cDU5L21DVFFkTWlTMmdrMUNXRkFhSnZaMUVXdkF1enZNbUJWMmw2Ym1v?=
 =?utf-8?B?a0pSY0xOcERsbXRZYkZQeklqTCtzTUZvMW5iTEdBaTNMYzEvdDBDMFFSTXJj?=
 =?utf-8?B?K2NWa09yUmdDRCtyZ0J2aEs5Wmk5L28wVzd0TVdlcTBXWDVJNHNHOE02U1Ev?=
 =?utf-8?B?clZubnZsZ2I2a1FhSmVKcmNUUVFFTTdnWk5VdmhiZVJFaXJuWGtEWjZFald6?=
 =?utf-8?B?UGJ6cDROcXRsZ3Z3TVRad2hySWQ4U290c2RLbDFsZWpJalNlT3p2dUMwNmpD?=
 =?utf-8?B?Ym1FRSt5SUxFV3dOSXFCRDhnM3RXWTl2aVNzYUJvMk9Ydnd6Q1E3VFhDL2ov?=
 =?utf-8?B?YjUyKzJzcUZwYUs2R3pqRk9DT3pvMlpKbzZLMkZkK2ozL1dNQmhMYmhmYWFk?=
 =?utf-8?B?c2hidlA0TU8yR1ZjVVB2S3VHTHRLTFQrMHM5amlTMm5IcmcreG0vamNFVEx2?=
 =?utf-8?B?RWkrMjNWRkhPNnVuMHh3TXRsaW4zVS9TRi9oVU1zbnc5dDZMdnR2R2M0a1Z5?=
 =?utf-8?B?WUtJcGZzNG8xTXhMM1VtZytrVG5nY0ROcGJKZ3JaOWpYQnJta3dJTW05VTJV?=
 =?utf-8?B?SkNkZkJkb0FTcHNPTUdYQXViSTJ0TytUeDgwU1FUenpBbW5DOEd0ZDZHNTZU?=
 =?utf-8?B?dnRIRWhOVm5GdFBOVFhLY1dUV0VCYnA2elFHMmwyeGJoZjUrVXg4UEZub2hW?=
 =?utf-8?B?RHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E85779066A10AA4B94FA4BCBD373930E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB8122.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6dc0348-bcd9-4625-54f7-08dde4995836
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 12:09:01.7343
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /f3JPrQgOskhNxxsGzqJ4D1lcc+aZsyQqEnyicQNgB8gvXjMoV3xBdyyYJSRsarhLbS1+JuGfm84eACEvRQPvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7383
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_050914_857645_B4BD16E7 
X-CRM114-Status: GOOD (  29.19  )
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

T24gVHVlLCAyMDI1LTA4LTI2IGF0IDEyOjQwICswMjAwLCBncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBPbiBUdWUsIEF1ZyAyNiwgMjAyNSBhdCAwNzo1
ODo0N0FNICswMDAwLCBYaW9uIFdhbmcgKOeOi+mRqykgd3JvdGU6DQo+ID4gPiBBZ2FpbiwgdGhp
cyBzaG91bGRuJ3QgYmUgc29tZXRoaW5nIHRoYXQgYW55IGRyaXZlciBzaG91bGQgaGl0IGFzDQo+
ID4gPiB0aGlzDQo+ID4gPiB1c2FnZSBpcyBub3QgaW4gdGhlIGtlcm5lbCB0cmVlIHRoYXQgSSBj
YW4gc2VlLiAgQXR0ZW1wdGluZyB0bw0KPiA+ID4gcmUtcmVnaXN0ZXIgYSBkZXZpY2UgbXVsdGlw
bGUgdGltZXMgaXMgbm9ybWFsbHkgbmV2ZXIgYSBnb29kDQo+ID4gPiBpZGVhLg0KPiA+IA0KPiA+
IFRoYW5rIHlvdSBmb3IgeW91ciBjb21tZW50cy4NCj4gPiANCj4gPiBJIGFtIG5vdCB0aGUgb3du
ZXIgb2YgdGhlIFdpRmkgZHJpdmVyIGFuZCBkbyBub3QgaGF2ZSBmdWxsIGRldGFpbHMNCj4gPiBv
Zg0KPiA+IGl0cyBpbnRlcm5hbCBsb2dpYy4gSG93ZXZlciwgZHVyaW5nIGludGVybmFsIGludGVn
cmF0aW9uIGFuZCBzdHJlc3MNCj4gPiB0ZXN0aW5nLCB3ZSBvYnNlcnZlZCBhbiBpc3N1ZSB3aGVy
ZSByZXBlYXRlZCByZWdpc3RyYXRpb24gYW5kDQo+ID4gZGVyZWdpc3RyYXRpb24gb2YgYSBtaXNj
IGRldmljZSBieSB0aGUgV2lGaSBtb2R1bGUgbGVkIHRvDQo+ID4gY29ycnVwdGlvbiBvZg0KPiA+
IHRoZSBtaXNjX2xpc3QuIFdoaWxlIEkgY2Fubm90IHByb3ZpZGUgdGhlIGV4YWN0IHJlYXNvbmlu
ZyBiZWhpbmQNCj4gPiB0aGUNCj4gPiBXaUZpIGRyaXZlcidzIGRlc2lnbiwgSSB3YW50ZWQgdG8g
cmVwb3J0IHRoZSBwcm9ibGVtIGFuZCBzaGFyZSBvdXINCj4gPiBmaW5kaW5ncyB3aXRoIHRoZSBj
b21tdW5pdHkgaW4gY2FzZSBzaW1pbGFyIHBhdHRlcm5zIGV4aXN0DQo+ID4gZWxzZXdoZXJlLA0K
PiA+IGluY2x1ZGluZyBpbiB2ZW5kb3Igb3Igb3V0LW9mLXRyZWUgZHJpdmVycy4NCj4gDQo+IFdl
IGRvIG5vdCAiaGFyZGVuIiBvdXIgaW50ZXJuYWwgYXBpcyBmb3IgZXh0ZXJuYWwgZHJpdmVycywg
d2UgZml4DQo+IGRyaXZlcnMgdG8gbm90IGRvIGZvb2xpc2ggdGhpbmdzIDopDQo+IA0KPiBQbGVh
c2UgZml4IHlvdXIgb3V0LW9mLXRyZWUgY29kZSwgaXQgc2hvdWxkIG5vdCBiZSBldmVuIHRvdWNo
aW5nIHRoZQ0KPiBtaXNjZGV2IGFwaSwgYXMgdGhhdCBpcyBub3Qgc29tZXRoaW5nIGEgd2lmaSBk
cml2ZXIgc2hvdWxkIGJlDQo+IGludGVyYWN0aW5nIHdpdGguICBQbGVhc2UgdXNlIHRoZSBjb3Jy
ZWN0IG9uZSBpbnN0ZWFkLCBhbmQgdGhlbiB5b3UNCj4gd2lsbA0KPiBub3QgaGF2ZSB0aGlzIHR5
cGUgb2YgaXNzdWUuDQoNClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjay4NCg0KSSBhZ3JlZSB0
aGF0IHRoZSBrZXJuZWwgc2hvdWxkIG5vdCBiZSBoYXJkZW5lZCBmb3Igb3V0LW9mLXRyZWUgZHJp
dmVycw0KbWlzdXNpbmcgaW50ZXJuYWwgQVBJcy4gV2Ugd2lsbCB1cGRhdGUgb3VyIGludGVybmFs
IGNvZGUgdG8gZm9sbG93IGJlc3QNCnByYWN0aWNlcyBhbmQgYXZvaWQgaW1wcm9wZXIgdXNlIG9m
IHRoZSBtaXNjZGV2aWNlIEFQSS4NCg0KT24gYSByZWxhdGVkIG5vdGUsIHRoZSBjdXJyZW50ICdX
QVJOX09OKGxpc3RfZW1wdHkoJm1pc2MtPmxpc3QpKScgY2hlY2sNCmluIG1pc2NfZGVyZWdpc3Rl
cigpIGRvZXMgbm90IGNhdGNoIGFueSBwcmFjdGljYWwgZXJyb3IgY29uZGl0aW9uczoNCg0KRm9y
IHN0YXRpY2FsbHkgYWxsb2NhdGVkIG1pc2NkZXZpY2Ugc3RydWN0cywgdGhlIGxpc3QgcG9pbnRl
cnMgYXJlDQp6ZXJvLWluaXRpYWxpemVkLCBzbyBsaXN0X2VtcHR5KCkgd2lsbCByZXR1cm4gZmFs
c2UsIG5vdCB0cnVlLg0KQWZ0ZXIgbGlzdF9kZWwoKSwgdGhlIHBvaW50ZXJzIGFyZSBzZXQgdG8g
TElTVF9QT0lTT04xLzIsIHNvIHJlcGVhdGVkDQpkZXJlZ2lzdHJhdGlvbiBhbHNvIGZhaWxzIHRv
IHRyaWdnZXIgdGhlIGNoZWNrLg0KDQpTaW5jZSB0aGlzIGNvbmRpdGlvbiBkb2VzIG5vdCBwcm90
ZWN0IGluLXRyZWUgZHJpdmVycyBvciBjYXRjaCByZWFsDQplcnJvcnMsIHdvdWxkIGl0IGJlIHJl
YXNvbmFibGUgdG8gcmVtb3ZlIGl0Pw0KDQpJIGNhbiBzdWJtaXQgYSBwYXRjaCBpZiB0aGUgY29t
bXVuaXR5IGFncmVlcy4NCg0KdGhhbmtzLA0KDQp4aW9uIHdhbmcNCg0KDQo=

