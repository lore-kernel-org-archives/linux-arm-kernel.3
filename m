Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A7CEDF04F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 07:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wc53uzVNRevN40zZOq/2ehs/C9Ues93p07JgxrD/3O0=; b=MZnsGjJlrtGe91HkZ0b/Sx8lYm
	s8InDxk5cxUD7gdlDZzELUPoUs3yXEuaUnXIhaXBUdVOfrA9H06w6AUJ22P/d/RmKFqDL8/+E4Oo+
	agyiSwEbhcKK9kUSQAxwtiXF5A3UDZO+Fp8ZJYcb6L/Ub7LRDZmHbWYKxz31ybklduOQ+Y2+h4Ich
	Uw3kBQBU9OYKqmqEBFvtPawvRIDBEqVDWZy/OzROfFoOYT+7+XwQ1ugucN6AZbfI2RvgggnA/Uc/L
	qOnqvTCnYRw1VwYg/HCaUnpRpCPwBkvn4goed6NZ7gWLlEPIUdv0Tug14izOVb9E59TpcfYLpZx1n
	k1gxjxfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqQr5-00000001hiu-14eI;
	Thu, 12 Feb 2026 07:11:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqQqy-00000001hhh-19jv;
	Thu, 12 Feb 2026 07:11:11 +0000
X-UUID: fd3fac4e07e111f1a16f0188aa809bee-20260212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=wc53uzVNRevN40zZOq/2ehs/C9Ues93p07JgxrD/3O0=;
	b=utGa5F+EO86Z4P19mt/Z9oHpw8gdcO5RxcNY9WZevQZHsW1zd5hdiyG9RTu5cQ+m2K45myrCEUEud7Y8W0tW1CAU26wYxvZS7JzJDs/XMABGo01PPlMyA0x63iGSlYk1OII4So1gnEPa5nr4fjsYHxxbYSYQPA1XGLMf36khmMM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:5433af53-02b3-456d-84d1-3352c907f4f3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:c74999e9-ef90-4382-9c6f-55f2a0689a6b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fd3fac4e07e111f1a16f0188aa809bee-20260212
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1102264352; Thu, 12 Feb 2026 00:11:02 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 12 Feb 2026 15:10:59 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 12 Feb 2026 15:10:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QpnCTFrflSa94Gt6V4TaUUKYHIfy3gnBI4/6FDUoso+Z5Y3ktrAEMLlLcnfMmNVbXDS7yMOMO9FuRWZL6YVwC4K//Jh6UN+4lT+1/qNa6B/xP7bYrFmZFcyht2nKiWg6MDzLw2+Y9ZfaJQPlRf5kJP55R6l4iFYjSGHMDocXneLHCWKi9L2/qWSfMD96U9oGsAP8nXpErJRFFFNJ75UF9PS/+hyRP4wKA1AI9QOXco7telt/GSioCxaZfT91BpkiugGiXkdFqUFnoXwhXO+bEkt2+SAvFjI7vs55+5BArNk702QdUl3t4Gn3tFr3HqCHUib5ZufJcrWZHcFu6vuOeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wc53uzVNRevN40zZOq/2ehs/C9Ues93p07JgxrD/3O0=;
 b=FOz3MGyS5HoaJvsaAouIAe9SUm0YLqC0oe+Ks6t+qJeFKyYivRdqGB5xUGBorP8KVYx+999/3ysyCv4Eoz45fatuRn/fv6O21KhvEtt4xN20EJgtmt+HeMRCpbScEQ3N6HJSDUj2PdJq9An4U+W8LMjEW5I/YZ21kdFtyg4+SFkNNqinkmLHPy5Vp7sDlywc1M9RKDz58uJm4lgG0UCFqHBCSDkAtdqZRHB2UWu7mt8szSsTumdRpjg3QQwkb00gLu0WhoaqxfTb/AASCX562WwVqxldQFEnVeBZSTUTgItLECsXHZLoXJ9aUvl12ekgf3W/Ahk+or62D9sq+YTINA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wc53uzVNRevN40zZOq/2ehs/C9Ues93p07JgxrD/3O0=;
 b=N7J4rTuWZbazDlqpaeLSQPjzdOM2ndbNI81AxKShuItR/ftuhkT5et+NeP8nGrNYwXVz3SBKK42LhoHri1/3AkllDunM2sc38o8HeXKL6YFqIAAhsIOR6FuZFwzM4NOyqqYYxge4hfY8iNzOy8qHvEM6y/ncPCUwmxf7O5jEprw=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB7566.apcprd03.prod.outlook.com (2603:1096:101:128::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Thu, 12 Feb
 2026 07:10:56 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 07:10:56 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "simona@ffwll.ch"
	<simona@ffwll.ch>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "greenjustin@chromium.org" <greenjustin@chromium.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, Nicolas Prado <nfraprado@collabora.com>
CC: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Daniel Stone <daniels@collabora.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [PATCH RFC 3/6] drm/mediatek: ovl: Fix misaligned layer source
 size on AFBC mode
Thread-Topic: [PATCH RFC 3/6] drm/mediatek: ovl: Fix misaligned layer source
 size on AFBC mode
Thread-Index: AQHceZU/SlrIiCW2Fky/SXbbIg72WbVwbskAgARFBwCACd4qAIAAWFCA
Date: Thu, 12 Feb 2026 07:10:56 +0000
Message-ID: <1477ea561b7f6be8ef9b9b371878e030ac91baca.camel@mediatek.com>
References: <20251230-mtk-afbc-fixes-v1-0-6c0247b66e32@collabora.com>
	 <20251230-mtk-afbc-fixes-v1-3-6c0247b66e32@collabora.com>
	 <3716cf4707924e97c097cfefa11c7feb09a1ee16.camel@mediatek.com>
	 <1394a4b34db511c921b2709a58dfaf28c1cce45c.camel@collabora.com>
	 <9f458655385bf7d0ba57d9a048075aec1df7fb6e.camel@mediatek.com>
In-Reply-To: <9f458655385bf7d0ba57d9a048075aec1df7fb6e.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB7566:EE_
x-ms-office365-filtering-correlation-id: c7dee58d-d38f-4fe7-9873-08de6a05ddc4
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|42112799006|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?UjdlN29qcUxPejRJdmtFZGZ1NkVyT0gveUdrQXRWVEw4RmlhbmxIWmF0ZGxi?=
 =?utf-8?B?MU9tMjZFQTk4TzZDYW5lVEc4M0M1bndXQXVDbjU1ZnN4NnF3MWxXckdPaXpi?=
 =?utf-8?B?RkE4azhYcW1WUDJIS3JUYVpyYWlFMnhYWmRKLzNrdzFFQngxdjNyd0RFZ2pX?=
 =?utf-8?B?SXhnc3NZQm51T25PTDNROTFmNVcxTUJIWm9QWityaWxxZGRlQ2RuVms2WTNZ?=
 =?utf-8?B?NzkyMzZER1NwblVUZGE0ZTRObWRoU1lMQ3UrNUdmUGt2aGxtenU3RFFnSE90?=
 =?utf-8?B?K1k0RVkyODZqbWlrWnVjS0xZdTdSMDl3Qk82WXJFRkI1UUdHUStTVHgwRGl0?=
 =?utf-8?B?QWxvU3ZWMndpeFVHTWVGLzFsd3Y5TE5idndmSmlqVkR4K09VdFdoeW5ZYndy?=
 =?utf-8?B?VmVvU1l5K2kyOTE0bjNkVzhOVFVvb3BXbVRrdGJZUEVmQmlndUZGR2JCL3dx?=
 =?utf-8?B?VHNvQzdoT3pIU3NtcjlkK0hRU0xDcnYwUm1pZXFxN2hqZVNZZFdYNXZkanBL?=
 =?utf-8?B?UGZkelZNZzZqNmxIeFB4YkxmYTZSRE5QeHg0NjNHOURtTFZ6V29McHBjY3Fn?=
 =?utf-8?B?Q0tSamdsUjdKMldKSGMra3pHOUR2eXdpMFlIajJ5WkRONTZlNlJ4RnFpaVN3?=
 =?utf-8?B?eGhpV3EvYVJUYlZEdE11ckJTYUpYdC9pSGh6K3VoencvS0NGbHFnSWF1enl0?=
 =?utf-8?B?VXVmVmZPdVV0UmdxWEpmVmZuMHlYSG5vZ2YxWW41aUJVSlpFYWRaN3RvOGdq?=
 =?utf-8?B?NXBvSTkrZExaUThUSE9td0NPZ3F2cWV1YTRHOVRnZEIvMEhZVjhBU3lVVXBL?=
 =?utf-8?B?TUF0RDU5TDFnRk1qL2pOWGVGRUQzR2NoZzdUNXorV2d4UjFvaE9RbTVGNGEv?=
 =?utf-8?B?eVVCeld5V2o1ZWZYWExFTExoUXdUYWxJZ0I5cS9XTTRLNzcxaDJuQ0dyKzVW?=
 =?utf-8?B?NU1yVEtFeFpVVDdWRWN3TVpWcVJPQW9UL2xyZ29WWjFkaXRnTVEyV1kzVEhy?=
 =?utf-8?B?S0RPdTMzMGxjY0JmQjJFRE5qTFJvb2lHdlhsZFd6V3llK2l3MmNKakVieGNX?=
 =?utf-8?B?YVFjWVhsNE5pKzhjdnpyVGxOT0lRTXkyalZpNmlPS2YrSlh2KzFJU0o0SHJH?=
 =?utf-8?B?ZUZQL21CdVp3RkdIVjlSVkNIc1YzVHR0M05iWUZqZk0wM2tHSnN4MXRLM0dJ?=
 =?utf-8?B?dDl2akd6emd1ZktKMDhLWlg3RklsUmdvdjVna2FMbEJ0cE95bWNSTlRLeWRp?=
 =?utf-8?B?YTYyMjVkUyt2VXd3STErUlhvMXJjR0N3dktvcVp3b0hJNHhEVjVWU252ZGRl?=
 =?utf-8?B?ZUZrWTJDeHA5OGRaTUI1N0pRNzg5aDg2WGh1d3AyM2thYndRY0MvSHViYXF4?=
 =?utf-8?B?dGU4azJVdVJ4MmpiVHd4VFZnRkpZdWp4TjJzY3ZkT3BSWVMxb3NaeEtrZWEv?=
 =?utf-8?B?VDV4aXAxS0xzWkNlRFpiaG9iREZoODRMNjhMWXZpQmE2TjBaWENXNms0d01v?=
 =?utf-8?B?R0N3cndoaFZETE1aTWc2L1B5T292eHFCRUJ6TnVyMy9SVnlRNFIwaXVFZnFl?=
 =?utf-8?B?RGNuK3RaSE0zNHZKSnIrUWJ6aTd5THYxK1l3U1hadm9ROEpFMGlrK1ZOc1g3?=
 =?utf-8?B?Tm5sUDNGSWc1bEgwSzA5RTNRNVVYMVVKZ2pXSWFyUTZkeXNPVkQ0L2RYNnFN?=
 =?utf-8?B?ZzBqUGRYaHR2TTNTRHVBb2I4MmFOMmVudUt1aCswYXIwMDFPWnY2N2ZoTm9I?=
 =?utf-8?B?ai9GYkFzK2tXQzNEdGFyVTlqd0prYnhoa0I2T01nRkQ1Rkx2b0F2Y3FEbm11?=
 =?utf-8?B?ZmxoeUwzK3J2SmgraFhWUkp2RUxEM3V3RUdZQ2VseERGblNSampoeDgxZ2R2?=
 =?utf-8?B?OG1ZQXNvejRjcnFBMG4zY1pjazdnTTdqQitvd3FUS2VXSGtjZXFQek95dzBt?=
 =?utf-8?B?bWFOQzNnT2VOenVmL2F1TGc2ZWpqRGdNWC83Y0ZiSnBKVzM2NEtmWUppSW5P?=
 =?utf-8?B?MktIK3NNL3dRd28zUlU1ZFhxbG5ZYUpyNjlYRGhVYUxnZE5Ialo4U3M3ekw4?=
 =?utf-8?B?ckk2WVBjcFBxWWRhSTkzMGFMci9ISlc3ZmJsWUJZYUhOZFppWE95amE4NE9I?=
 =?utf-8?B?ajIzWER6TzZMZG1OUUxYSW9PUHhqL3o1TEc4c3EzZ3plTGczNXQyZmh0aE9N?=
 =?utf-8?Q?gDh6lE3lotD9aHOajyEC4+o=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(42112799006)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVBaNmM3SFpLdkR2Zkh4V3drM0dnaWYzQ1lBS3pZck51cDh6V2V1Slg4UkNu?=
 =?utf-8?B?ci82NS8rb0UyTDlVV0FsSGtieFdkZ1ZWTWJBSHJmVjBaUFRmemtoNmJKQXVk?=
 =?utf-8?B?b0tleU15QlpsY1o2YWtNdmJWZDFJZDFQbEpFcnVWNXc4QXpKN1NBRlk5eG5T?=
 =?utf-8?B?TTRUVzNlYnNnWE1CcHVBUzNBckU2U2lmWWx6dHdTazdJMFNKQ1NFK0xWRWpF?=
 =?utf-8?B?bWFtNFd1ajVOTFpOeHhxSWgyTm9KOXpwUmttYVhqNFZ5RDBWV3NmREhLdk5D?=
 =?utf-8?B?WGFRSUVJMEhrc0RrQkx1aHZkMHRSZGJzalZQeTY4NWtXa3VkV1lnNFdrQ25J?=
 =?utf-8?B?eldSa0xwaEJVZEd0Yk1wNnkwZ2ZTSHRna1BiNStHdzg0aEVYTTFxNWhRL1Rv?=
 =?utf-8?B?WWJqVVFCTytWV0pCVkRyeWxLazRIbElnZ3JDek5LR0pNRmZWTGVxUTVsc2k0?=
 =?utf-8?B?Sk1BK3JyOFl1dDJWK3E1MmU2dWJ4TUwyU0xvMnBUWlMrMmhzRnBocmRVU0Ra?=
 =?utf-8?B?UEt0akM0U0JoSXpZMzdmZVIxRUdONFZucFEva09LU1JvK3JpMjd3cStldFdV?=
 =?utf-8?B?dlBlaG5tdlJzcnRxVVQ0ODBSalJ3T1JlNXBvNWRveFd2NDJaSXBubWRPcEdm?=
 =?utf-8?B?VFErVXAreDVTZmhrWHc1aWpCUEtkeUlFS3ZsQmYwcVdYT2Noem1uckJrOHYv?=
 =?utf-8?B?TUtiS3h2T1Ztd1RsRDFXMFhBdytrSWVQN2lEMnpxSXF6cytMMlIwd0V2VURt?=
 =?utf-8?B?ZUs1RUZHUmtwWGJPUXBFd0FzQVllUjU0OG11MWg3TWhwenR0eDFCdDdlTitr?=
 =?utf-8?B?clplKy9VYU1RbGMwQXVOdVRVRUxoclZrd2NkczN6ZGJpVmxzci9KanZCY1dZ?=
 =?utf-8?B?UllkZkZaMitLQ3M4bXg0SEdPd0JPZFBBVi9oQ3JvckxuMzBEL3c4U0ozRE8y?=
 =?utf-8?B?UmlYelk1Ymg5d09XYnZQeGk4eDVVcEFsVHdNanlReVJZQmlpMS9pR1Q4MzNF?=
 =?utf-8?B?Y1RHM094d0gxVmZxZGx6Zy93QnZZTlcwTTdlNkdmUnBkM3Vsc3pWOE14ZzU4?=
 =?utf-8?B?ZlEyK0RENUZkY29EWnZLVld3N2lGMnZzaWZCMCtNNXRRNUlVQ2MzaWI2anZi?=
 =?utf-8?B?SURVempOVXIyMWJSTVVrelJXR1FmVFVHRTk3Y0JFQmdiK3VLeDBhQXdOaHVI?=
 =?utf-8?B?QW9DQkZ4RlFaNUg3TVVhWVlCRjNkNzFyOU9sSUhQY3Z1SXgxalNOaGpLUUgr?=
 =?utf-8?B?YzVVUldEQnVUYVhHMXlFN3ZoS2NRWnZFcHJUMWM3UEFtVnY2cno5eTh1Ymxl?=
 =?utf-8?B?UDZueHRCcFJxeGlENGtGSDVLdmRKSUZnV3ZBWGgxZ1FaYnpUeVJ3Y3BiY1M3?=
 =?utf-8?B?QVR0SUxka3IvK29KeWhLNm5zTnQvVE5pVnVmQ1ZqcGVUZ3I0NlpUNFV0ci9Y?=
 =?utf-8?B?TVBtUUxWNjBqVytVeURmVlpKOUdNelhuRXZtVGhSeW1pVWpXbCtSMmlQZUJY?=
 =?utf-8?B?YWxWTzQyMXpjd3NJWkpESU9HdCtGM292Q1MxL0ZENk0vZnBtY0sza0R3MzVy?=
 =?utf-8?B?RWNEUVlBRXYzRFUzZmZrV3ZsZlhNMlFnVmRncFVYai9BWUJTTEpZdXJyeFpQ?=
 =?utf-8?B?TmVoM0VTQzF3Njk1UkpjbVl6TUpzbUNhazVVRVJTeWU3TUorVmRJZDRNcnh0?=
 =?utf-8?B?VnFzUVh5MW9zTFpDeityMngwdWhOL0J1TEZuUFJrZ1NCYmRxcEFWM0NnRjJG?=
 =?utf-8?B?VnpoMmFJODFLY3BIOGIvVHNkaDJGTmljcUNLaTNDWVBGMDNhamc2a0NtY2FV?=
 =?utf-8?B?WnhVbFZVN3V3ZmlEaVZsaW9NekR0QXRHbEdZWFV1RW82bU9oazFuN0ppVXBU?=
 =?utf-8?B?MytlODBZazNHVHBwZVZxNTVuT0pKZ0c3NGVUNHdPL1ZVaG5mTmJrbEZrSjc4?=
 =?utf-8?B?WXlvbE1NNlVsZndVcEIyMDB5ZEJxRUNwNXk4MGRUVGJjNEpYZlVoRS84ZFR6?=
 =?utf-8?B?cDJuY2RzTVNFSCs2SEU1Wm9mVkVhbUE2cUpXK2dQY0VZakVtdExXZ3hybHVu?=
 =?utf-8?B?R2p0SktLa29qeHU5cXNWRnhpWlZMV3hGZTFHNzJ0V2FPb1ptUGJBczNQRmh0?=
 =?utf-8?B?U29Ud0xDOHNXa1V1U1ZpRmtTeERNUkpxNzQ5a1lMbjZBU1BVdTlhbC9TTTlZ?=
 =?utf-8?B?OFNGR0VHWnJFdHZiUG9DWDlSTHpHblo2SlkyeTArRlMvbG5yMHMxTGVkblVJ?=
 =?utf-8?B?RC9XMmUvK2VmSURuaW5pRjV2eCtLazNRMGxBSklLVXhKVWVidWdXWGtrbTFC?=
 =?utf-8?B?c3Axc2MvZlF6ckpVdnc3S3hsb3c0eW1VVHF0T2pNT2txdERFNG9DQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <66B63B9861096840855F457A812A9D82@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7dee58d-d38f-4fe7-9873-08de6a05ddc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2026 07:10:56.0659
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7FD81W/g8rrXHV0/qqmiNPbC9NSKaYzdu7vZki89LN+ljFxXMq4YVy5+C71XtpmVRgbixSJxo/EwDizRTEZ7Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7566
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_231108_800119_A4719EF1 
X-CRM114-Status: GOOD (  16.44  )
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

T24gVGh1LCAyMDI2LTAyLTEyIGF0IDA5OjU0ICswODAwLCBDSyBIdSB3cm90ZToNCj4gT24gVGh1
LCAyMDI2LTAyLTA1IGF0IDE0OjEzIC0wNTAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyB3cm90
ZToNCj4gPiBPbiBUdWUsIDIwMjYtMDItMDMgYXQgMDI6MDEgKzAwMDAsIENLIEh1ICjog6Hkv4rl
hYkpIHdyb3RlOg0KPiA+ID4gT24gVHVlLCAyMDI1LTEyLTMwIGF0IDExOjAzIC0wMzAwLCBOw61j
b2xhcyBGLiBSLiBBLiBQcmFkbyB3cm90ZToNCj4gPiA+ID4gRnJvbTogQXJpZWwgRCdBbGVzc2Fu
ZHJvIDxhcmllbC5kYWxlc3NhbmRyb0Bjb2xsYWJvcmEuY29tPg0KPiA+ID4gPiANCj4gPiA+ID4g
SW4gQUZCQyBtb2RlLCBPVkxfU1JDX1NJWkUgbXVzdCBiZSBibG9jayBhbGlnbmVkLiBEdWUgdG8g
dGhpcw0KPiA+ID4gPiBsaW1pdGF0aW9uDQo+ID4gPiA+IG9mIHRoZSBBRkJDIGZvcm1hdCwgT1ZM
X0NMSVAgbmVlZHMgdG8gYmUgdXNlZCB0byBhY2hpZXZlIHRoZQ0KPiA+ID4gPiBkZXNpcmVkDQo+
ID4gPiA+IG91dHB1dCBzaXplIG9mIHRoZSBsYXllciB3aGlsZSBzdGlsbCBtZWV0aW5nIHRoZSBh
bGlnbm1lbnQNCj4gPiA+ID4gY29uc3RyYWludHMuDQo+ID4gPiA+IEZhaWx1cmUgdG8gZG8gdGhp
cyB3aWxsIHJlc3VsdCBpbiB2YmxhbmsgdGltZW91dHMgYW5kIG5vIHJlbmRlcmVkDQo+ID4gPiA+
IG91dHB1dA0KPiA+ID4gPiB3aGVuIHRoZSBBRkJDIGRhdGEgc291cmNlIGlzbid0IGFsaWduZWQg
dG8gdGhlIEFGQkMgYmxvY2sgKDMyeDgpLg0KPiA+ID4gPiANCj4gPiA+ID4gQ29uZmlndXJlIE9W
TF9DTElQIHNvIHVuYWxpZ25lZCBBRkJDIGxheWVycyBjYW4gYmUgZGlzcGxheWVkLg0KPiA+ID4g
PiANCj4gPiA+ID4gVGhlIGZvbGxvd2luZyBpbGx1c3RyYXRlcyBob3cgdGhlIGFsaWdubWVudCBp
cyBhY2hpZXZlZCB0aHJvdWdoIHRoZQ0KPiA+ID4gPiBjbGlwDQo+ID4gPiA+IHNldHRpbmdzIGZv
ciB0aGUgaG9yaXpvbnRhbCBjb29yZGluYXRlcywgdGhlIHZlcnRpY2FsIGNvb3JkaW5hdGVzDQo+
ID4gPiA+IGFyZQ0KPiA+ID4gPiBhbmFsb2dvdXM6DQo+ID4gPiA+IA0KPiA+ID4gPiAvLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXA0KPiA+ID4gPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwNCj4gPiA+ID4gPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAuLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi7CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHwNCj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwNCj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAuLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwNCj4gPiA+
ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi7CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHwNCj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8DQo+ID4gPiA+IFwtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0vDQo+ID4gPiA+IMKgwqDCoMKgIHzCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgIHwNCj4gPiA+ID4g
wqDCoMKgwqAgfMKgwqDCoMKgwqDCoCBzcmMueDHCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBzcmMueDLCoCB8DQo+ID4gPiA+IMKgwqDCoMKgIHzCoMKgwqDCoMKgwqAgfMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgIHwNCj4gPiA+
ID4gwqDCoMKgwqAgfMKgwqDCoMKgwqDCoCB8PC0tLS0tLS0tLS0tLS0tLS0tLS0tPnzCoMKgwqDC
oMKgwqAgfA0KPiA+ID4gPiDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Jj
X3dpZHRowqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8DQo+ID4gPiA+IMKgwqDCoMKgIHzC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8DQo+ID4gPiA+IMKgwqDCoMKgIE4gKiBBRkJDX0RBVEFfQkxPQ0tf
V0lEVEjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBNICoNCj4gPiA+ID4gQUZCQ19EQVRBX0JM
T0NLX1dJRFRIDQo+ID4gPiA+IMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8DQo+ID4gPiA+
IMKgwqDCoMKgIHw8LS0tLS0+fMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8PC0tLS0tPnwNCj4gPiA+ID4gwqDCoMKgwqDCoCBjbGlwX2xlZnTCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2xpcF9yaWdodA0KPiA+ID4gDQo+ID4gPiBB
cyBJIGtub3csIGNyb3AgaXMgdXNlZCB0byBkcm9wIHBpeGVsIGRhdGEuDQo+ID4gPiBGcm9tIHRo
ZSBuYW1lIG9mICdjbGlwX2xlZnQnLCBJIHRoaW5rIGl0IHdvdWxkIGRyb3AgdGhlIGxlZnQgcGFy
dCBvZg0KPiA+ID4gdGhpcyBpbWFnZS4NCj4gPiA+IEJ1dCB1c3VhbGx5IHRoZSBpbWFnZSBpcyBh
bGlnbmVkIHRvIHRoZSBsZWZ0IChzdGFydCBmcm9tIGF4aXMgMCkgYW5kDQo+ID4gPiBhcHBlbmQg
Z2FyYmFnZSBkYXRhIGluIHJpZ2h0IHBhcnQuDQo+ID4gPiBJZiBzbywgY2xpcF9sZWZ0IHNob3Vs
ZCBiZSB6ZXJvIGFuZCBhbGwgdGhlIGNsaXAgd291bGQgYmUgY2xpcF9yaWdodC4NCj4gPiA+IFRo
aXMgaXMgdGhlIG5vcm1hbCBiZWhhdmlvci4NCj4gPiA+IElmIE9WTF9DUk9QIGRvZXMgYmVoYXZl
IGFzIHRoaXMsIGFkZCBjb21tZW50IHRvIGRlc2NyaWJlIHRoYXQNCj4gPiA+IGNsaXBfbGVmdCBk
b2VzIG5vdCBkcm9wIHBpeGVsIGRhdGEuDQo+ID4gDQo+ID4gQm90aCBjbGlwX2xlZnQgYW5kIGNs
aXBfcmlnaHQgd29yayBpbiB0aGUgc2FtZSB3YXksIGJ5IGRpc2NhcmRpbmcgdGhhdA0KPiA+IG1h
bnkgcGl4ZWxzLCBvbiB0aGUgbGVmdCBhbmQgcmlnaHQsIHJlc3BlY3RpdmVseSwgb2YgdGhlIHBs
YW5lJ3MNCj4gPiBmcmFtZWJ1ZmZlciB3aGVuIGNvbXBvc2l0aW5nIHRoZSBwbGFuZSBvbiB0aGUg
ZmluYWwgaW1hZ2UuDQo+ID4gDQo+ID4gSW4gdGhlIHNpbXBsZXN0IGNhc2UsIHdoZW4gdGhlIGlt
YWdlIHRvIGJlIGRpc3BsYXllZCBpcyBsZWZ0LWFsaWduZWQsDQo+ID4gaWUgc3JjLngxID0gMCwg
dGhlbiB5ZXMsIG9ubHkgY2xpcF9yaWdodCB3aWxsIGJlIHVzZWQgdG8gbWFrZSBzdXJlIHRoYXQN
Cj4gPiB0aGUgcGxhbmUncyB3aWR0aCBhbGlnbnMgd2l0aCB0aGUgQUZCQ19EQVRBX0JMT0NLX1dJ
RFRILg0KPiA+IA0KPiA+IEhvd2V2ZXIgaWYgb25seSBhIHN1Yi1yZWdpb24gb2YgdGhlIGltYWdl
IGlzIHRvIGJlIGRpc3BsYXllZCwgdGhlbg0KPiA+IHNyYy54MSB3aWxsIGJlIG5vbi16ZXJvLiBJ
ZiB0aGF0IHggb2Zmc2V0IGNvb3JkaW5hdGUgYWxpZ25zIHdpdGggdGhlDQo+ID4gQUZCQ19EQVRB
X0JMT0NLX1dJRFRILCB0aGVuIGFnYWluIGNsaXBfbGVmdCB3aWxsIGJlIDAsIGFuZCB3ZSdyZSBi
YWNrDQo+ID4gYXQgdGhlIHNpbXBsZXN0IGNhc2UuDQo+ID4gDQo+ID4gQnV0IGlmIGl0IGRvZXNu
J3QgYWxpZ24swqB0aGVuIGNsaXBfbGVmdCB3aWxsIG5lZWQgdG8gYmUgdXNlZCB0byBlbnN1cmUN
Cj4gPiBvbmx5IHRoZSBpbnRlbmRlZCBzdWItcmVnaW9uIGlzIGRpc3BsYXllZCwgZXZlbiB0aG91
Z2ggaXQgc3RhcnRzIGluIHRoZQ0KPiA+IG1pZGRsZSBvZiBhbiBBRkJDIGRhdGEgYmxvY2suDQo+
ID4gDQo+ID4gVGhpcyBpcyBiZWNhdXNlIG5vdCBvbmx5IHRoZSB3aWR0aCBhbmQgaGVpZ2h0IGlu
IERJU1BfUkVHX09WTF9TUkNfU0laRQ0KPiA+IG5lZWQgdG8gYmUgYWxpZ25lZCB0byB0aGUgQUZC
QyBkYXRhIGJsb2NrLCBidXQgYWxzbyB0aGUgc3RhcnRpbmcNCj4gPiBhZGRyZXNzIGluIERJU1Bf
UkVHX09WTF9BRERSLCB3aGlsZSBzcmMueDEgYW5kIHNyYy54MiBzdXBwbGllZCBieQ0KPiA+IHVz
ZXJzcGFjZSBhcmUgYXJiaXRyYXJ5IGFuZCB3b24ndCBuZWNlc3NhcmlseSBhbGlnbiwgaGVuY2Ug
d2UgdXNlIGJvdGgNCj4gPiBjbGlwcyBhcyBuZWVkZWQgdG8gYWNoaWV2ZSB0aGUgaW50ZW5kZWQg
ZGlzcGxheSBvdXRjb21lIHJlc3BlY3RpbmcgdGhlDQo+ID4gaGFyZHdhcmUgY29uc3RyYWludHMu
DQo+IA0KPiBPSywgaW4gbXRrX3BsYW5lX3VwZGF0ZV9uZXdfc3RhdGUoKSwgeF9vZmZzZXRfaW5f
YmxvY2tzIGhhcyBkb25lIHRoZSBibG9jay1iYXNlZCBjcm9wLg0KPiBBbmQgdGhpcyBwYXRjaCBp
bnRyb2R1Y2UgY2xpcF9sZWZ0IGZvciBwaXhlbC1iYXNlZCBjcm9wLg0KPiBJIHRoaW5rIHBpeGVs
LWJhc2VkIGNyb3AgY291bGQgcmVwbGFjZSBibG9jay1iYXNlZCBjcm9wLg0KPiBTbyBkcm9wIHhf
b2Zmc2V0X2luX2Jsb2NrcyBhbmQgbGV0IGNsaXBfbGVmdCA9IHNyYy54MS4NCj4gDQo+IEluIGFk
ZGl0aW9uLCB0aGUgY2xpcF9yaWdodCBpcyBhbHNvIG5vdCBuZWNlc3NhcnkuDQo+IFRoZSBwaXRj
aCBhbHJlYWR5IHRlbGwgaGFyZHdhcmUgdGhlIGJ1ZmZlciB3aWR0aC4NCj4gSSB0aGluayBoYXJk
d2FyZSB3b3VsZCBub3QgYWNjZXNzIGRhdGEgb3ZlciBzcmNfd2lkdGgsDQo+IHNvIGRyb3AgY2xp
cF9yaWdodCBhbmQgaXQgY291bGQgYmUgc2ltcGxpZmllZCBhcw0KPiANCj4gPiA8LS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLT58DQo+ICAgICAgICAg
ICAgICAgICAgICAgcGl0Y2gNCj4gPiA8LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLT58ICAgICAgIA0KPiAgICAgICAgICAgICAgICAgIHZhbGlkIGltYWdlIGRh
dGEgICANCj4gICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICANCj4g
ICAgICAgICAgICAgIHNyYy54MSAgICAgICAgICAgICAgICAgc3JjLngyICANCj4gICAgICAgICAg
ICAgIHwgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICANCj4gPiA8LS0tLS0tLS0tLT58ICAg
ICAgICAgICAgICAgICAgICAgIHwNCj4gICAgY2xpcF9sZWZ0IHwgICAgICAgICAgICAgICAgICAg
ICAgfA0KPiAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICB8ICANCj4gPiA8LS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tPnwgICAgICAgDQo+ICAgICAgICAgICAgICAg
ICAgICAgc3JjX3dpZHRoICAgICAgICAgICAgICAgDQo+IA0KPiANCj4gQnV0IGNvbmNlcHR1YWxs
eSwgc3JjX3dpZHRoIG1lYW5zIHZhbGlkIGltYWdlIGRhdGEsIGl0J3MgYmV0dGVyIHRoYXQNCj4g
DQo+ID4gPC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0+fA0KPiAgICAgICAgICAgICAgICAgICAgIHBpdGNoDQo+ID4gPC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0+fCAgICAgICANCj4gICAgICAgICAgICAgICAg
ICB2YWxpZCBpbWFnZSBkYXRhICAoZmItPndpZHRoKSAgIHwNCj4gICAgICAgICAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgIHwNCj4gICAgICAgICAgICAgIHNyYy54MSAg
ICAgICAgICAgICAgICAgc3JjLngyICAgICAgIHwNCj4gICAgICAgICAgICAgIHwgICAgICAgICAg
ICAgICAgICAgICAgfCAgICAgICAgICAgIHwNCj4gPiA8LS0tLS0tLS0tLT58ICAgICAgICAgICAg
ICAgICAgICAgIHw8LS0tLS0tLS0tLT58DQo+ICAgIGNsaXBfbGVmdCB8ICAgICAgICAgICAgICAg
ICAgICAgIHwgY2xpcF9yaWdodCB8DQo+ICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAg
ICAgIHwgICAgICAgICAgICB8DQo+ID4gPC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0+fCAgICAgICANCj4gICAgICAgICAgICAgICAgICAgICBzcmNfd2lkdGgg
ICAgICAgICAgDQo+IA0KPiBGb3IgdGhlIG9sZCBTb0MsIHdlIGp1c3QgdGVsbCBoYXJkd2FyZSBi
dWZmZXIgc3RhcnQgYWRkcmVzcyBpcyBpbiB4MSAsIGFuZCBzcmNfd2lkdGggaXMgKHgyIC0geDEp
Lg0KPiBUaGlzIGlzIGJlY2F1c2Ugb2xkIFNvQyBoYXMgbm8gY3JvcCBmdW5jdGlvbi4NCj4gV2hl
biB3ZSBoYXZlIGNyb3AgZnVuY3Rpb24uIEkgd291bGQgbGlrZSB0byBjb25maWd1cmUgdG8gZml0
IHRoZSBtZWFuaW5nLg0KDQpTb3JyeSwgSSBmaW5kIHRoYXQgY3JvcCBsZWZ0LCByaWdodCwgdG9w
LCBib3R0b20gYWxsIGhhcyBvbmx5IDggYml0cy4NClRoZSBoYXJkd2FyZSBtYXhpbXVtIGNyb3Ag
Y291bGQgYmUgMjU1IHBpeGVsLCBidXQgdGhlIGFjdHVhbCBjcm9wIG1heSBiZSBsYXJnZXIgdGhh
biAyNTUuDQpTbyB3ZSBzdGlsbCBuZWVkIGJsb2NrLWJhc2VkIGNyb3Agd2l0aCB0aGlzIHBpeGVs
LWJhc2VkIGNyb3AuDQpQbGVhc2UgYWRkIHRoaXMgaW5mb3JtYXRpb24gdG8gZGVzY3JpYmUgd2h5
IHdlIG5lZWQgdGhpcyBtaXhlZCBjcm9wIG1lY2hhbmlzbS4NCg0KUmVnYXJkcywNCkNLDQoNCj4g
DQo+IFJlZ2FyZHMsDQo+IENLDQo+IA0KPiANCj4gDQoNCg==

