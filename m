Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB6AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 15:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G4oql9wZ6P0Nh4JXR/7Tc+RaO1qNEXQ9LacMhbbTZ+o=; b=rV0GZl1fmoa6MM+waRpjZ61Nv2
	IWOyRqTgPgRuK/3qQ/c/vhM4ywyKi2YjIBvGoct0VFcLofcQ2/o9dzmkYS76ixCVBGEFrjIOQ84zB
	0sNIa29sYgHEIeRle3BPIXM3Ag+slz8Q4PL8S92X2orWu0cNIUEvaIoO9FSIs3t3qhjHm+xuNNPjl
	m5rCEVKvlH9lq/G7e5vJOOmMcEwJ1XAHofICV+gFaBmR5KkNygzCmJf5llcnuZgN18vnLIHedtZ19
	AaPhVo9ShRWSaxGc76GGMkLjoXdjcvwDNyG7AWzkbjq7tzB7qb2kqTLzi8znch4Jdy+IHoeI4d1M8
	GVsHFvSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUodc-00000001hlG-0gBv;
	Mon, 06 Jan 2025 15:03:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoZl-00000001h1Q-4C6b;
	Mon, 06 Jan 2025 14:59:31 +0000
X-UUID: d129a0cccc3e11ef82ff63e91e7eb18c-20250106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=G4oql9wZ6P0Nh4JXR/7Tc+RaO1qNEXQ9LacMhbbTZ+o=;
	b=P5JbwDDrkpFtLP0C4w3XjxgY9H42CqTWU85f1qfR4S0FC0PvqbC+hqleb00ikzvYrWYFWiHvTGNun78PIoxZrpNvqVzM9qtZUW5n7S8UDc+fpVRk2ETmlC2O9TOKqihFF3yyF4+YwFsfWjkegWLhZp4EztWMRufsJYh++ic1wYc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:cec0175d-7761-4199-9953-bca9b4147aa7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:06b96a19-ec44-4348-86ee-ebcff634972b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: d129a0cccc3e11ef82ff63e91e7eb18c-20250106
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 515338026; Mon, 06 Jan 2025 07:59:24 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 6 Jan 2025 22:59:21 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 6 Jan 2025 22:59:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pzUl5aBu3/zzlyH2K7inw9dop9Sp8fk4L8VkMRuMeGpLwHs8kTeqyyI0Cwfl1CkWQNwCHBzJY60FET/mp4sv72Dw7+PNHHG1Z0gfvsW4vYCQ7DKXjljijwTDmsuaO/wI3e8550fKDa1oMpVbiKtyng4Fh2a/rK6yuEJjbmBhkNKk8v6nDiOT7xAz6vlNVIE2KChOpipiJucz+QPhlINkDZvdfRsO9Lwhjb6cQD9UHgWhDQg6vDmp4XifhUrrUNdNzh7zV7NPhO7Qfy+wltnlh10jW1JytGugtrQXfTEH3ncOXg488GdsrJNgf83czSGD/85uAHf2HMALiE27QI/TkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4oql9wZ6P0Nh4JXR/7Tc+RaO1qNEXQ9LacMhbbTZ+o=;
 b=Jk3HMknMoUylpFQsy6WY0q/UDRS9f6gsVQI1OMkAzIjWLR0qNONm5uewVTyLGgNTjw78sb8CjVS5CRKpt8IGrsXHAE2XsrfTQxui2z1QMJ5HIL2xqtOHbcURJR4AEeAYg6i4myMio39OgUwCjJ/ZNLapw8UGlSy/lrszMwFDK+BhRfoUyW+/KN63WpG8PlqSsKVQzCVD7pYDbt+07KTK6nXeUbDgIQYv0bkL/pXfVK0BAkejlh3GJzDQuTmPTBMBM4AWuB7cMERciRaV2TzH/fmp9MEQ8RRZXLdeNCTIS8iI4DuTvmHgn5aQGB7QXXy8elVGfXWiCww0PVfYL9Av3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4oql9wZ6P0Nh4JXR/7Tc+RaO1qNEXQ9LacMhbbTZ+o=;
 b=NNRXocOFLPjXSD3zKgRrrXSuDH11zN4CMYGVDNCGmNadQo212J5UFMqWht1Wg9w2PUdGj19xGeX5GChXn7M+GRW5ZBGcgEZu6mTyGPUr0+WMWZjyaInhTXTBm8hH5yW2bfrfizQC8Pp4zZCWhDSQB6UYqmQpY23cpLYpEUgmOkQ=
Received: from PSAPR03MB6236.apcprd03.prod.outlook.com (2603:1096:301:9d::13)
 by SEZPR03MB6959.apcprd03.prod.outlook.com (2603:1096:101:9e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Mon, 6 Jan
 2025 14:59:18 +0000
Received: from PSAPR03MB6236.apcprd03.prod.outlook.com
 ([fe80::2b28:30c4:61a8:20f6]) by PSAPR03MB6236.apcprd03.prod.outlook.com
 ([fe80::2b28:30c4:61a8:20f6%4]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 14:59:18 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "vkoul@kernel.org" <vkoul@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"kishon@kernel.org" <kishon@kernel.org>, "heiko@sntech.de" <heiko@sntech.de>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] phy: Use (of|device)_property_present() for non-boolean
 properties
Thread-Topic: [PATCH] phy: Use (of|device)_property_present() for non-boolean
 properties
Thread-Index: AQHbW6G1xXN5zdiJLkCOb2stqzcJoLMJ3+OA
Date: Mon, 6 Jan 2025 14:59:18 +0000
Message-ID: <93e3073207cc2c01aa0f6b9a8c39cb091e4b9081.camel@mediatek.com>
References: <20241231163121.241543-1-robh@kernel.org>
In-Reply-To: <20241231163121.241543-1-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB6236:EE_|SEZPR03MB6959:EE_
x-ms-office365-filtering-correlation-id: 3a09f0be-9f28-4e79-db5a-08dd2e62b22d
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Q1FBbWpZQlJEeXlZeERxczVtM0VFZFRCbDJkV0RUdHFtUnZINm5Fa2VTU013?=
 =?utf-8?B?WWxOTnBXTDVQS3pDSDcyQjZMNHZXNFlDQWpVK0xHOFgzaklnRlprUmt2VkFK?=
 =?utf-8?B?dGRwWEhSVnlTaXV1SmFSUjVhTVFNbVI2TnpvNlZlQ2VrRjNKV0NnblNtbU5w?=
 =?utf-8?B?UmZkVlBNSVNvZHBqNXY4RFNWKzJrM21oeG1sQVc5VXY2WWVhUVdQTHdxNlRO?=
 =?utf-8?B?WFp2c2ZjWnlFUnB2Y2tIYU02YWN3YkkzRDl1bWF6UWFmZFl4LzR0eWVZR1Zo?=
 =?utf-8?B?NndmRkVlcUFCYXFjaWhHYVZzQ2pncElLN09Wcll0ZmdwTXZaU2dtZlp3SHNH?=
 =?utf-8?B?ZEVCbGdMbm1UZ3JTdmlMYlBmS09YbWpqMlRJY0k4NVZCWHdYc2ZmSms0RUxC?=
 =?utf-8?B?bEptU1hMTDBQYmFpYzVwNU5JTGdsMEJGdVpCNU1EM0wxdXhOSDBvQld1QWQ3?=
 =?utf-8?B?SnBQWUxPNWpEclpvcldvNnRpdUdNOXNNelNHcWJQUFUySnBHZmhSS1RrVHNl?=
 =?utf-8?B?VWhxc0ZabDNCRHllOXFDcVF0VUx6TkZlcGNybXVjazJ6R01Nb3NHM080bjI1?=
 =?utf-8?B?ZTdQZ3JEcXdUYmsycVdQTW91YWJMdFNMd04vNEZMb0tob1FlSmk5cVJmTGd2?=
 =?utf-8?B?Z3BIdENiN2lBNklRZC8yT2dKQmJubDUxRWFsbWR1TTRwNGxLcHlDSy9jYkVp?=
 =?utf-8?B?RXN2b1JIVVh2Tm9Wd0xUUksrYmFFVmNBSk1PWlhVaWVZWHgxYnZnQk13OHNH?=
 =?utf-8?B?THRGdlpVYUc0am5yeTZhZy9weHptTk8wMkQveitTWndXZUtYMkM2c1hlQTJo?=
 =?utf-8?B?TWF4MmZVNVlGUXNFZWxXWGQ5dll2Z0lMQlQ0WnIvcDJmTXFRMDVEUkg2MnZF?=
 =?utf-8?B?K2NMdHVXNUFIandIN1NodVlkb0d2SW1mTzZrNEhZRlBSNGg5TlBDYXdFTFJH?=
 =?utf-8?B?UThvZnh5VUhERmVZTjA3RUVGYW9nYlJIMVhlS054WUdhelJmelFDSUt3elo4?=
 =?utf-8?B?OU4xZGplaFFoMzhzL3JRQU1jNGtwSWxucnYrZmZMWi9SS0JjYWdzK2RlcHM3?=
 =?utf-8?B?c2pUM285VkhwU0lGWE10REMxeFJhN1lqaEVwR1EwRGIrNUhrdEVtTDBmbk1M?=
 =?utf-8?B?WmNxaFo4QndLSEF4MXpIRHdaalFDem5ieWl2K0s0V2VZekJWNzZQODlrM251?=
 =?utf-8?B?Vkl4RVpyOTZnWnBFNUphUjBrc0tRTi9zYk1HQndRajdQRVlUTTdxWEozNkRm?=
 =?utf-8?B?Und6N2FoTTlPRWR2NDNaTFhPKzc5bVNCOWZLbWR1eVAwQm03VXpWN1RLaVVS?=
 =?utf-8?B?bDI3MkxMVmE4bnNMclU1Y1NKWmVCTFRuU1ArbHE3VVo2Qm91SzlLZDRLYURx?=
 =?utf-8?B?OTMyakxjU3FnTW1oam1udm16blhQMVc5UTBTd3Q0emE5dUgzZEIrWVhJM0VB?=
 =?utf-8?B?VHNvZUtFUFpjVEViaDlGQmlnOUJ3VnFISWVSSmxrYlYrbExpaGRvMWdDMU1v?=
 =?utf-8?B?YVZHUDJKMXYyTGhSdjNydDRlU0NCN2xFOEZCVTlZS0xQVFpFSGdBbmttQVNq?=
 =?utf-8?B?dFpnTFZCMHlvVjJwSVJPdTlWMmxxK2xOOGJHY0hkRXlHU0U2VUF4aWVqLzE3?=
 =?utf-8?B?dnpldEFrTDFSRm1wOXdRZk1aSFJvTHUyMzYwYzEzeVR3RzdFNlB4eXZPUlVv?=
 =?utf-8?B?Y1RhbmNGOEEyU0VMYSs1OFVHd2xybWpSaEcvMnpVcnpjcDdGT3MxaVN3ZDll?=
 =?utf-8?B?NmdlaXNEQ3dzZ3liUFVhbjdyMmpnMUxXMVFPdzFIS29WaVBRODBrMUZuYTla?=
 =?utf-8?B?aXJOemVlVVBmYk1Qd0lXNmM5cWtxNzE5Y1NwV2F3b1o2Nnp0clVZNFJvRDdP?=
 =?utf-8?B?R3dWY05KeVdUclM0UEdRNXRHUlpOaC9wQVZ5cnNsaXoxajEzT20zVDdaSjA1?=
 =?utf-8?Q?7cbAaIRPhss3tgPqo2r5b4Nb6UvA2K6Z?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB6236.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWRTdWhldFJoRHpnMTEwNnNLYnc0dkJ5RzhndlN0M0FiTW9HUlp4NzRJMm9M?=
 =?utf-8?B?VkZibFA3TmdBMTczTytiTzVqZUZpcnprUVFaMXZmWlF4RVpsa2tLd0QrTHo4?=
 =?utf-8?B?bEpVbUxzb0E4WGFNMjNHOFhFNWUzS3grQXRJb0VsbmZtcVFKcW9TaVo0YjN5?=
 =?utf-8?B?OW9Rdi83UklySWk0M0laMEpjdTNYTkNlMCtIU1NqMUV1aTA0UFkxU3lDUXJu?=
 =?utf-8?B?Z2lPNXpVVmRuZTNydzZtMW05dVFVcnFNZEZDOTVCZXZaeVFBNHB1NHlRaTV1?=
 =?utf-8?B?eFVmODlEUVhQSTd4eXorSHRUTDk0TFdVejNFVWNIOHRMdklBVjlzL25GTGF1?=
 =?utf-8?B?ZE1aM3FuNEpWS3dISjhRd1NOSHNFRkxUWmYwVWlidWRaY2V5WkJxNENXM3Ru?=
 =?utf-8?B?cmJBc290QjZleGcxdlFTZFk4V0VOZ0JpQ2pjc0NHQTc5RWpGajRSTXZVZHkv?=
 =?utf-8?B?cmoxYU9XcmRpTFp6QzA2SXdxMDdDd25tamVmTGt0VGFUTFhkQ1FkUTgwMStq?=
 =?utf-8?B?by9IaURxbUExOEVYdmIra3VUT3ZLWjV2TlM5SHFGK1I0R2ZCTmx6T1BhNGt6?=
 =?utf-8?B?eWs5QXFQNmFibDBmRC9XbjFNcU9xYkk4bE9uZTltSTd1VU1WaXc4TVhYTnR1?=
 =?utf-8?B?aEpFZmxlNUo5d3hSa1NBMFh2bVlTRUlxSjFYRGZkQVRlMkc0YzRPdU83YnFn?=
 =?utf-8?B?QmxQWXh1NzVUNWtPaW1CRFU0MklEcTAzaWhqeDVWMk1PeUVMeDdMTnBYekVa?=
 =?utf-8?B?cEVxMmwxRk5GekpVU0tyckFEc09HaERPaHNDc0VtNnVRTTVxRTlXbFlLdGxi?=
 =?utf-8?B?eG9WMWg5WHR0TW5PVXR3cEo0ckFUaVpVOXRscTdaVEozbE5UaHd3RUhCaVh0?=
 =?utf-8?B?bWFlQUJ3OFZ1cHJmWXBISFl5SDZvQWpoS2dKTWlocnlaOUR0Z2hUdWRTeTI3?=
 =?utf-8?B?WUZnaW1DMFYzNStSWGZWRW0rWTZFNHhDQmxsaEN4Uzk1bVR5L3BpVWpQeGM3?=
 =?utf-8?B?NUdLQ2xhczRjTms1UStJa1VpTVdzWjFvL01TbVdNT1N0K1VIQjhGMDJBQ0E1?=
 =?utf-8?B?eklxWStRTlFlN2pHeHo1VzZxY2FqbXZrK0h4N1FPWEVHbkc2aHMxZGRyQzg1?=
 =?utf-8?B?ZWozUjBVWWxSbThVWmNQdUNwT0lwVFdrSTBZZ3gzM3VZbXJzZWdySEljcEp6?=
 =?utf-8?B?cmhHbUExZU9Vd21mL1FTWWdJR0RaOUhkelB3VnAvalZNaWMvWlNaZHllOWdU?=
 =?utf-8?B?TzR2eEFxUDZuTy9xVWVLVW16OHp1RnNvU1RadXdDamVXakNDSWJwU2tXNVdU?=
 =?utf-8?B?WmkyazlQUVVEck1zL3I5VVNqeDFpUDhyUEthRnhTdWMyVlBNRG5CYmVITmc0?=
 =?utf-8?B?dTBjb3NjRzlWWnluRUREeDdsZGNISjZENU9HZFBuZUZsVVRBZjE3MFkxN0k2?=
 =?utf-8?B?TkRiZzZaUWZQWDdqR0xlbUpOM0tJSlpiUmNLekFnZnJjK3FVVFZPR2VjYmdi?=
 =?utf-8?B?QTFMYnFQQ0kvR2VqdExSVDRoRTM3b0c4WGppN1lXLzY4SXR3RDc1YVNCQWVB?=
 =?utf-8?B?UWdsY2lHZ3o1dWlZVStZdXN0azNtejJ3aGZlR1V6ekVWTkcrQjlCSDN3ZlZ5?=
 =?utf-8?B?cGZEY0tHc2xPdmlMV2dySjR1Y3JXRnFHdEVlZlQxV1doaFpFRjlRZ1JYY0JI?=
 =?utf-8?B?OSsvVkJIRHc0VjFxemovQnNXdHMwc2xHYzg0UGxhdDdycUJKMGVFdmVtTWVi?=
 =?utf-8?B?TGUzYnNaTzB5WmlQa2xYejNvUDdOaFhnd1crZUVEdmxHMTgwbjdhK1JndTNx?=
 =?utf-8?B?YUdoS3ZlUXdVSTJHNEhxMlZuUUM5OVB6blExSVVvTThGNlJQSklyTmxDc3dq?=
 =?utf-8?B?WkROL1lnQVBVQXlWOWpPQ3JZQndxRm1rbVF6NEJ0Wm9kU215cUFtMEYvQWE0?=
 =?utf-8?B?WWF6NmUxNzZWcFhPU0FmT29kUTJDb1pnN3l3dVJFdW93SXBEUGIrZHpLVjFE?=
 =?utf-8?B?M0VHa0dzTXF3NmxPWnRkSmdwQWZjSzdTSXhSNmlMalJMM0pEY3JDRi9jZGVL?=
 =?utf-8?B?bDRoRUtVZ28rTUNiUVZ4aUdUb0pFNThwV09RRnFld1VWVUwxWUZmdjk3NDhG?=
 =?utf-8?B?WTZyY0J2NUd3eUpvN2tUWjhKcEdBaFE5MTVaSFBMd1BpUTVkNFQ2SVhIWWhP?=
 =?utf-8?B?UlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6D34F514EA1B714E8215BCC732EBE4B5@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB6236.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a09f0be-9f28-4e79-db5a-08dd2e62b22d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2025 14:59:18.7187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VF4tPeRTV1WMM3O0g7T8NctSU1sNmC1biWayH8iOGdIlMnVhUBxfBU6mr//8chYPETaVEE5ZrDhYKWsqepKRC5OjeHu75V8W7Y3KoitBIBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6959
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_065930_047025_6A544459 
X-CRM114-Status: GOOD (  17.44  )
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

T24gVHVlLCAyMDI0LTEyLTMxIGF0IDEwOjMxIC0wNjAwLCBSb2IgSGVycmluZyAoQXJtKSB3cm90
ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4g
YXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUg
Y29udGVudC4NCj4gDQo+IA0KPiBUaGUgdXNlIG9mIChvZnxkZXZpY2UpX3Byb3BlcnR5X3JlYWRf
Ym9vbCgpIGZvciBub24tYm9vbGVhbg0KPiBwcm9wZXJ0aWVzDQo+IGlzIGRlcHJlY2F0ZWQgaW4g
ZmF2b3Igb2YgKG9mfGRldmljZSlfcHJvcGVydHlfcHJlc2VudCgpIHdoZW4gdGVzdGluZw0KPiBm
b3IgcHJvcGVydHkgcHJlc2VuY2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyAo
QXJtKSA8cm9iaEBrZXJuZWwub3JnPg0KPiAtLS0NCj4gIGRyaXZlcnMvcGh5L21lZGlhdGVrL3Bo
eS1tdGstdHBoeS5jICAgICAgICAgICB8IDQgKystLQ0KPiAgZHJpdmVycy9waHkvcm9ja2NoaXAv
cGh5LXJvY2tjaGlwLWlubm8tdXNiMi5jIHwgNCArKy0tDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3BoeS9tZWRpYXRlay9waHktbXRrLXRwaHkuYw0KPiBiL2RyaXZlcnMvcGh5L21lZGlhdGVrL3Bo
eS1tdGstdHBoeS5jDQo+IGluZGV4IDNmNzA5NWVjNTk3OC4uZDM2ZjY4ZGQ2MjJlIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL3BoeS9tZWRpYXRlay9waHktbXRrLXRwaHkuYw0KPiArKysgYi9kcml2
ZXJzL3BoeS9tZWRpYXRlay9waHktbXRrLXRwaHkuYw0KPiBAQCAtMTIxNSw3ICsxMjE1LDcgQEAg
c3RhdGljIGludCBwaHlfdHlwZV9zeXNjb25fZ2V0KHN0cnVjdA0KPiBtdGtfcGh5X2luc3RhbmNl
ICppbnN0YW5jZSwNCj4gICAgICAgICBpbnQgcmV0Ow0KPiANCj4gICAgICAgICAvKiB0eXBlIHN3
aXRjaCBmdW5jdGlvbiBpcyBvcHRpb25hbCAqLw0KPiAtICAgICAgIGlmICghb2ZfcHJvcGVydHlf
cmVhZF9ib29sKGRuLCAibWVkaWF0ZWssc3lzY29uLXR5cGUiKSkNCj4gKyAgICAgICBpZiAoIW9m
X3Byb3BlcnR5X3ByZXNlbnQoZG4sICJtZWRpYXRlayxzeXNjb24tdHlwZSIpKQ0KPiAgICAgICAg
ICAgICAgICAgcmV0dXJuIDA7DQo+IA0KPiAgICAgICAgIHJldCA9IG9mX3BhcnNlX3BoYW5kbGVf
d2l0aF9maXhlZF9hcmdzKGRuLCAibWVkaWF0ZWssc3lzY29uLQ0KPiB0eXBlIiwNCj4gQEAgLTEy
NzgsNyArMTI3OCw3IEBAIHN0YXRpYyBpbnQgcGh5X2VmdXNlX2dldChzdHJ1Y3QgbXRrX3RwaHkg
KnRwaHksDQo+IHN0cnVjdCBtdGtfcGh5X2luc3RhbmNlICppbnN0YW5jDQo+ICAgICAgICAgfQ0K
PiANCj4gICAgICAgICAvKiBzb2Z0d2FyZSBlZnVzZSBpcyBvcHRpb25hbCAqLw0KPiAtICAgICAg
IGluc3RhbmNlLT5lZnVzZV9zd19lbiA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woZGV2LA0K
PiAibnZtZW0tY2VsbHMiKTsNCj4gKyAgICAgICBpbnN0YW5jZS0+ZWZ1c2Vfc3dfZW4gPSBkZXZp
Y2VfcHJvcGVydHlfcHJlc2VudChkZXYsICJudm1lbS0NCj4gY2VsbHMiKTsNCj4gICAgICAgICBp
ZiAoIWluc3RhbmNlLT5lZnVzZV9zd19lbikNCj4gICAgICAgICAgICAgICAgIHJldHVybiAwOw0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGh5L3JvY2tjaGlwL3BoeS1yb2NrY2hpcC1pbm5v
LXVzYjIuYw0KPiBiL2RyaXZlcnMvcGh5L3JvY2tjaGlwL3BoeS1yb2NrY2hpcC1pbm5vLXVzYjIu
Yw0KPiBpbmRleCA5NmYzZDg2OGE1MjYuLmI1ZTZhODY0ZGVlYiAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9waHkvcm9ja2NoaXAvcGh5LXJvY2tjaGlwLWlubm8tdXNiMi5jDQo+ICsrKyBiL2RyaXZl
cnMvcGh5L3JvY2tjaGlwL3BoeS1yb2NrY2hpcC1pbm5vLXVzYjIuYw0KPiBAQCAtNDQwLDcgKzQ0
MCw3IEBAIHN0YXRpYyBpbnQNCj4gcm9ja2NoaXBfdXNiMnBoeV9leHRjb25fcmVnaXN0ZXIoc3Ry
dWN0IHJvY2tjaGlwX3VzYjJwaHkgKnJwaHkpDQo+ICAgICAgICAgc3RydWN0IGV4dGNvbl9kZXYg
KmVkZXY7DQo+ICAgICAgICAgaW50IHJldDsNCj4gDQo+IC0gICAgICAgaWYgKG9mX3Byb3BlcnR5
X3JlYWRfYm9vbChub2RlLCAiZXh0Y29uIikpIHsNCj4gKyAgICAgICBpZiAob2ZfcHJvcGVydHlf
cHJlc2VudChub2RlLCAiZXh0Y29uIikpIHsNCj4gICAgICAgICAgICAgICAgIGVkZXYgPSBleHRj
b25fZ2V0X2VkZXZfYnlfcGhhbmRsZShycGh5LT5kZXYsIDApOw0KPiAgICAgICAgICAgICAgICAg
aWYgKElTX0VSUihlZGV2KSkNCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGRldl9l
cnJfcHJvYmUocnBoeS0+ZGV2LA0KPiBQVFJfRVJSKGVkZXYpLA0KPiBAQCAtMTMyMyw3ICsxMzIz
LDcgQEAgc3RhdGljIGludA0KPiByb2NrY2hpcF91c2IycGh5X290Z19wb3J0X2luaXQoc3RydWN0
IHJvY2tjaGlwX3VzYjJwaHkgKnJwaHksDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8g
b3V0Ow0KPiAgICAgICAgICAgICAgICAgfQ0KPiANCj4gLSAgICAgICAgICAgICAgIGlmICghb2Zf
cHJvcGVydHlfcmVhZF9ib29sKHJwaHktPmRldi0+b2Zfbm9kZSwNCj4gImV4dGNvbiIpKSB7DQo+
ICsgICAgICAgICAgICAgICBpZiAoIW9mX3Byb3BlcnR5X3ByZXNlbnQocnBoeS0+ZGV2LT5vZl9u
b2RlLA0KPiAiZXh0Y29uIikpIHsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgLyogZG8gaW5p
dGlhbCBzeW5jIG9mIHVzYiBzdGF0ZSAqLw0KPiAgICAgICAgICAgICAgICAgICAgICAgICBpZCA9
IHByb3BlcnR5X2VuYWJsZWQocnBoeS0+Z3JmLCAmcnBvcnQtDQo+ID5wb3J0X2NmZy0+dXRtaV9p
ZCk7DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGV4dGNvbl9zZXRfc3RhdGVfc3luYyhycGh5
LT5lZGV2LA0KPiBFWFRDT05fVVNCX0hPU1QsICFpZCk7DQo+IC0tDQo+IDIuNDUuMg0KPiANCkZv
ciBNZWRpYVRlazoNCg0KUmV2aWV3ZWQtYnk6IENodW5mZW5nIFl1biA8Y2h1bmZlbmcueXVuQG1l
ZGlhdGVrLmNvbT4NClRoYW5rcw0KDQo=

