Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1586EFD20F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 08:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FoZp6jNcCEaT/Ccdmw4bn+zNUMICznMLgaI2mCBLKg=; b=UB+Vipwpnk65hMgyEi81wSVnDS
	yw4+FU8G5Tpr1J5E83v1ujkgH0tVwgXvqbbrJRcItEEmCVeJ0UUh0wboB6i+vX6+HfqxcXffpLkm6
	pR6VPDB0w8Z15+ujczmTv/pX0kG2ptsxJ22P5cM42rEOlgV0oZ/PTqymzNgHEUbU+cFdD25bUKHmv
	TZWCSWPEKDRXo205879gmiAeNyraXLXv7ssWi+NAXQ1s3Od3BhtBAqTQpkzQgluHCSzmzT4M6gKJp
	3UJT55vQsxOVdGJGGF0v3Q/5E64xTjWVf0PybNAI28qTlCJbsqUGph9vt1FbvBld4v65mLNp9Qsdj
	BHxIquwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAjV-00000003brQ-0jgg;
	Wed, 25 Feb 2026 08:59:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAjS-00000003bqw-3laV;
	Wed, 25 Feb 2026 08:58:59 +0000
X-UUID: 36091ee8122811f1a16f0188aa809bee-20260225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=6FoZp6jNcCEaT/Ccdmw4bn+zNUMICznMLgaI2mCBLKg=;
	b=EeCcec8zedu6Vwi8CJMzluzvkikKxkYc7Wih/OGEzhW8eHJpvoIRwls++DYJiqGANAtUXjbIWdKryCBiUCcnC8sjKN8sHvOr+72y70S9rqFw8tht/9dMSNhyu7KlnzRPH2kxf5zcTosIU2DQwwJPEGAFQZJN9yfhCunSeWMZZjk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:53a2552e-f051-44fa-9db8-d277761166d5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:53b5f9e9-ef90-4382-9c6f-55f2a0689a6b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 36091ee8122811f1a16f0188aa809bee-20260225
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 322910687; Wed, 25 Feb 2026 01:58:53 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 25 Feb 2026 16:58:51 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 25 Feb 2026 16:58:51 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aOi/nWHLSBiIYvkAMT5iqewlsB6Fn73ac1mt2uNyHWFwq0c/Nzbccoku5ynPQKMlCdTn6xk/MGYsHP4YkRiFYKJummBFS5dBZYbdY0WYBpcwc8qbUK6OKgw6jBpQaW5/6HHi/cGiCBVCgiCfw1CuWa5d6GGF9/e5IfixJEgqcpbjLC3avf6AWlNh0Rw8ffJuygTg2cGcXwvcr2RmsifJmmqfosJsbZMkpyqhBI+lNXJ+CliqytVa44cu6uiw56t3oFJXVAgvwFZyUEoXWrbuo6gPM66ulAJEiwF5vyU96yLMbVhqOFEZ2rhMwuVCtsUxSaEqZVfzIGSbMm4EzvDzGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FoZp6jNcCEaT/Ccdmw4bn+zNUMICznMLgaI2mCBLKg=;
 b=hvJ1MXuB2LZjGWqOUYtc4dB6kU+lyijQdQDFwLRR2o3zg17YwoF+P1Nby6euH9lW3wbhJEEurcSeA4NDy9WlrJHa5KSrleVF0GzxlFes7tvveHqm+bGPDo0E/FVmIT9h/gJEjLjldGrAjmhWwrHV3MLOq1V1RaP58SzX5yP19k4E0ODWdDJ/HrJFKahfkPckqS20Mz6BO5JQUPZRx+g7S+adv+quMAfyu24UXn+L0FkhMFOoY4WecRlZE6eVF0JAzfalA54KqZIbqGQ5uCeuzF31Y2WQMSWBVWgdcmYOiM2SJAvMmv+F9NxVYLA5K1NGI9FM92Hz7UPz/0FtYQMdoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FoZp6jNcCEaT/Ccdmw4bn+zNUMICznMLgaI2mCBLKg=;
 b=RB/9hB/3e2Wl1RUC0fX+lS3Mk2ZYuqMje6kVvPNC/n1Uo5Lgylt0Wn3YOQOpeOIoeynGHBvFrTIQYOIsMkxdkOZ6OfEozByXKPCTsYsiLWuq2WbOWkWfNbPyQCkGqVa2Gcnh6CyBuPjbOlLS8lt1hLUsHK3rgPGilfPRHwSyd7U=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB7124.apcprd03.prod.outlook.com (2603:1096:101:e1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 08:58:46 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9632.015; Wed, 25 Feb 2026
 08:58:46 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"airlied@gmail.com" <airlied@gmail.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "maarten.lankhorst@linux.intel.com"
	<maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
	<mripard@kernel.org>, Nicolas Prado <nfraprado@collabora.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	Daniel Stone <daniels@collabora.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Ariel D'Alessandro
	<ariel.dalessandro@collabora.com>, "kernel@collabora.com"
	<kernel@collabora.com>
Subject: Re: [PATCH 06/11] drm/mediatek: Add plane_colorops_init() DDP hook
 for OVL
Thread-Topic: [PATCH 06/11] drm/mediatek: Add plane_colorops_init() DDP hook
 for OVL
Thread-Index: AQHcdET/Wjx7u3BZBEGUPtDj+1+59LWTgVwA
Date: Wed, 25 Feb 2026 08:58:46 +0000
Message-ID: <371db0b1f401aefd558bfcc1172564ecf4de4756.camel@mediatek.com>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
	 <20251223-mtk-ovl-pre-blend-colorops-v1-6-0cb99bd0ab33@collabora.com>
In-Reply-To: <20251223-mtk-ovl-pre-blend-colorops-v1-6-0cb99bd0ab33@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB7124:EE_
x-ms-office365-filtering-correlation-id: 2dc1c6f4-3ef5-497d-08e1-08de744c15e2
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|42112799006|366016|7416014|376014|38070700021|921020;
x-microsoft-antispam-message-info: 9wbkF/8iSO9KLfkEonMSQ9GeivjiGvyCRsiWHhJ0BiKXXaQTqmBXge/PRXwRBcZQwajJE14WEWzAzJHr6s0yScNrGD92V7EQb9GUHKcoGi2aHg39+Ns2LHUxaUfoubF3Q+d79S9T4LnWleW9kbeWU7zJZU5a3tVoUf7nIyICruKpV3b8XvgUPoq/rHjNheS/4P34FdHRWEk+9rhgS/Y+LbKkkk5p2iX8OwZv1MLEyyvsYKfxAo+ElzdGOCSttnC7l8gupwWZMj2QQkF2ond3bOhwoqODaGVzkgOJ6wOkmHFw1TCjgV3GzorgSqxrU+3IGhWyYpC+jHJsLuh3O2B3s18zkiI6dxEvwEdvychfhHfVAVocHjpdixsaSWBmC8XymHr49cDBKQj863rLD5Irr4l7dgG5J/4+5TjitPRh/Uv7ZMOvzo6MwMzqg23y6DjkVLPhD6LeS7ZM4gAKIfDor8EEtmtVi1nYC1FKklv2xIiqNXfXATI/4t1MOEO8zAYj/pmx55eRZX00zhyMC2y8WTyswGiZHtMXK3MN72k9jojm1d8I5WNLTKNI9iHwTU9EQ6nhCxpOMaXMiwtFIZBa1hUqJx+Pro6n/cNpKklPjk9qjyXy5LbF+rX8taiEx2QArHYmx1JZJMgbutnWmM/bR08kcsMkDj5moxN/Ccyp77iLj2Qn1WWzGqByS9hyGOoPi4KJq5Mx+zfwidxnDoN4i6ilJ+5ywgJfqNmMD05DRF5Y7U+TLeSDn+ZTu8W/QnL7GvSAsRgsiomPScppbc8/sRWWeNu8jC/cTvEtUnDJNLI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(366016)(7416014)(376014)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFhOZlY2cjlwc2gzTWw4MmowMWhPYkZNKzFnYll3Q1ZiSkZxTmFSVGtUZjVi?=
 =?utf-8?B?aHdtME5EZW1DMVIybmhrK2NCejNwbksra1RNNUFCRkVkVWliaEx3UDRJdDc3?=
 =?utf-8?B?UHI1NVdtUmFTS3M2VWw2VlpFdm92OVk5aXZBekNUeTRCL2hZN2ZDVkNJWHI1?=
 =?utf-8?B?aDU4VkExbmIrTXBnQzlxbWk1MWl5M2RQWE82OXpSSVowTUozd1ZOWmJjMkJz?=
 =?utf-8?B?cEQzK1ptVy9lVnBKeGNtY2NmM0xqd1UzNyt2ais3azBOTmxOSXM1Unp4VTQz?=
 =?utf-8?B?YXVhM3BUU0JEZmhZWGlPWE9zc0VTMzB4eWw3aFdPT1B6TjJua1hHZDg0S3dI?=
 =?utf-8?B?cG10ZER2Y1Nmb25ZOFladENybDdLU29GVUpNK2JlSk56eEljeisyeGdacnFt?=
 =?utf-8?B?ajFwc2NXbS9yWmFJK25OQWJ1eWhuZm9IZjRYV1hmQ0ZiQVpIYlZBVlJzbHJD?=
 =?utf-8?B?WmVGRnFJZ015OS9Ra0p6NFZFeDNjU2JLUFZFV0dMSUxjUjBuTEovZ2NROG1Q?=
 =?utf-8?B?WUtyMUxHN3JZeHpIVTZiZFh6YlE0QjBoMXk5Q09tclRmWldFazl0SzVudms3?=
 =?utf-8?B?c2UzUVA1Qkc5WmJZWXlFTGVCR2tlaDdoS25iSmxQdFVvSzUzb2tENU5QOGo2?=
 =?utf-8?B?VzdzeWc1UjhmU2kyU05RUzhVeU1iL3NUcEVpS2tkV3JINklwQmxhdlpzdHhk?=
 =?utf-8?B?TUlTL0YvNlVvM2h6T05Od1FmSGxwaEh3dGlmMjZ3MmZ0ZUIycUNZZTNXdm84?=
 =?utf-8?B?ZEtQNGt5VWZOQndGc0ZIWXBDZ0RxYnBqVVNabWJ3RmZTNndGK0RNdSt6WHlZ?=
 =?utf-8?B?QnhLWHc4V1hPRmhIRUxIbUE4SmV2eG5ZS1owM1QzQVlxN3QrRnlMQ1BYM0hZ?=
 =?utf-8?B?a2pGZnhWMnJNUHdaTWFlUkNXU1hqT0dHbklWUlNuQjdGa210d0Z6ZE0xWDBJ?=
 =?utf-8?B?cXJEYlI1WTJmcVJQc09rNVBDNEpvTjYralQ3cEx4aExWaW1RM1RZK1RVY1Ny?=
 =?utf-8?B?Vk52cVo1a1RMWGxTdWxjZjJYTGtXSjExTFdjczlxNzMzaDB5QUdUeXpTU3N1?=
 =?utf-8?B?VlZMcWZSU2NwODVURkR0djJId25yV2lZMDgvdmRXc1dwSWdpV0pGY0FkNEJU?=
 =?utf-8?B?bmZqSVdLaW5KcFRuaFZUb0MyQlhiNFVyN0xLUXUreG8xMEtSelJSNm8zVnZZ?=
 =?utf-8?B?amdER1BoSHRjNWt5MFNOSE5MS3RLNUdqeTZkQmF6aFVOeWhHc2RCeitzdWt1?=
 =?utf-8?B?RzhhRkExNnk5NUJZQjE2eUdVdUZFajg4VjFOSUlXNFhUMzFlQU5yL0JtSSt4?=
 =?utf-8?B?ejc5SUVMTjhiMDZkVExvNWZpa3lhakdYaWgyRjBxbGpZbCtuRUNpRzRPZ3lM?=
 =?utf-8?B?aGhUNW5EL1c5UjZreEgyOFFKWUxvcjN0aENGWm1zOFI0ZDdNYXRBb1h2R1lQ?=
 =?utf-8?B?VHMvZDVCQSs3ZmZTSWp5QUNDa0cvZGIxTXk4KzNpem4vTzVvVTY1WHNNUjZw?=
 =?utf-8?B?VE54WVBHR2kxdm81TENsMmxURTZBMXZXSjVHMlVDZFZ1TThzbWhzSnJYVWJT?=
 =?utf-8?B?SzNNTmpwcHRpQmxYWmU2Q0NQOUtFa1NIbnpXR2lmMmZIL2psWWNGS1V6SDlw?=
 =?utf-8?B?LzFSeXdySVdJR0hQZmxod3BnK2ZCK1E0QnM3R3o2blNoK1ZVcDBqems4akta?=
 =?utf-8?B?N2wrVEJITjBkbHZ5YWhTSE5zbkxlVTdDT1VxNEZ1VHBkMDRXTEh3QVdwc1li?=
 =?utf-8?B?TnRUb2luTW9FZ1RtdzRmSk5La3kxYWZUOWM5S3FpTGdJc2FaeVVNczJ2bHlQ?=
 =?utf-8?B?eXdIWEpuVVoxWEhHVlVjaGMrbkdMQjZmaFBzd1JqVzdrR0RIbzBoVUdlTVJH?=
 =?utf-8?B?MUI5U1Y1OS9hSVZMQ0xrMWJmdGU1ajFkKys1ZDdHU1E0NExYNitOUjZhdk9r?=
 =?utf-8?B?NHVFUUtSWHB1NDNNczdhbXdWVXVEd3VLZzExV1B0UTY5V0tyeW9RYkNxenpO?=
 =?utf-8?B?aEViejZtQ21HTmNuRFNhUTIyVzN1bG90STg4Y2FZMDdBbVZaU2ZFdHh3ZmVZ?=
 =?utf-8?B?ejdXNmlWNGlVNkFOQWRXemhyS1FRUUFaYnlHZEVmSHRLMmo1Y0VqbHJzOGdX?=
 =?utf-8?B?RUppTVdWa2luRU5GNFBrQVNzU2p5YWJBSzVmUDhQWnk2N3kyTW5XQkJwMCth?=
 =?utf-8?B?Tk5FTkJ6L1BRRFVlYW13QzZqdXRXWERQcjlneU00R0JHeldvQTd1UXhvRW9D?=
 =?utf-8?B?ZFYzNVJuNmgxWERoOExVZGE3UHhEQ3JiZFZjWmpaNS9PaVVRV09Wc3hVQ1pu?=
 =?utf-8?B?eU13cmtmdEYyQUJjVFZqaDljT0xROXVTZEdNL29pQ3c4RU96SHpTdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B7FC6812ED0234AB6BF0B16A9AAB053@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: BSvpK8fkJU7nCgdem/8GomIXplby9Sxz73K5CFh5Avt2pf05GpK0kSVxntkeYR9xdCT3G1kNhQOquSQ3EKBMg2OG20vt0gWj4wNCWOan3rI0i2Ag+OMDKGAsuO+OXpTo9qQ6YJuGhUmFRyRDbZDt8WnaS/ChbjPRR2hpEnEgM9G0W5pcparNgyKaEc5BlVLmIGr7xJbOQmT/cmUOnFFg3TwttQnwaQDuuLa3q1KP1AXsNeyIyuYy/VdRH9fuIlBD+BrlR4Xn+D1/k9Mk8Gb+5EPG+CD2XGz0ku28UE4G1q533HL0v/a5X/9HLz53EffGQj/hA++1GX8jKVS13GQxWA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dc1c6f4-3ef5-497d-08e1-08de744c15e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 08:58:46.6451
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: El8ejhLVLipQGVP8ARHFq7hNShjwyissrNV3uziMecq3kQTYkn6XwIAE1imcB/voda7+a2lWxqh1fzl2c9o34A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7124
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_005858_943917_27BD850D 
X-CRM114-Status: GOOD (  15.93  )
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

T24gVHVlLCAyMDI1LTEyLTIzIGF0IDE2OjQ0IC0wMzAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0
aGUgY29udGVudC4NCj4gDQo+IA0KPiBIb29rIE9WTCdzIHBsYW5lIGNvbG9yb3BzIGluaXRpYWxp
emF0aW9uIGZ1bmN0aW9uIGluIEREUCB0byBhbGxvdyBpdHMNCj4gdXNhZ2UgYnkgdGhlIE1lZGlh
VGVrIEtNUyBkcml2ZXIuDQoNClNxdWFzaCB0aGlzIHBhdGNoIGludG8gcGF0Y2ggWzUvMTFdLg0K
DQpSZWdhcmRzLA0KQ0sNCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4g
UHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZGRwX2NvbXAuYyB8IDEgKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kZHBfY29tcC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kZHBfY29tcC5jDQo+
IGluZGV4IDk0YjM1NmRhNmRlNy4uZWY5MDZiMmFmZjc0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RkcF9jb21wLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kZHBfY29tcC5jDQo+IEBAIC0zMzEsNiArMzMxLDcgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBtdGtfZGRwX2NvbXBfZnVuY3MgZGRwX292bCA9IHsNCj4gICAgICAgICAuZ2V0
X2Zvcm1hdHMgPSBtdGtfb3ZsX2dldF9mb3JtYXRzLA0KPiAgICAgICAgIC5nZXRfbnVtX2Zvcm1h
dHMgPSBtdGtfb3ZsX2dldF9udW1fZm9ybWF0cywNCj4gICAgICAgICAuaXNfYWZiY19zdXBwb3J0
ZWQgPSBtdGtfb3ZsX2lzX2FmYmNfc3VwcG9ydGVkLA0KPiArICAgICAgIC5wbGFuZV9jb2xvcm9w
c19pbml0ID0gbXRrX292bF9wbGFuZV9jb2xvcm9wc19pbml0LA0KPiAgfTsNCj4gDQo+ICBzdGF0
aWMgY29uc3Qgc3RydWN0IG10a19kZHBfY29tcF9mdW5jcyBkZHBfcG9zdG1hc2sgPSB7DQo+IA0K
PiAtLQ0KPiAyLjUxLjANCj4gDQoNCg==

