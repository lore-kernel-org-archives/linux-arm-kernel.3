Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826A2C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 10:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/D4REZg/vZys6vAoYvItBGIfiRfDS0UyGfk8fk3G/E=; b=gY2hErXZF3MdYQBN324NIn5Tvh
	+makW5x8wIT1CwXPIbspHVbS2yvralNw+IwwDtqV7W3NE1/d+XFhzvicXNJd7GnB7WGohVCxseksm
	k8vsFwKWGxIYFNX8OV1kW/lyHU5ozOGSbeJ/eDzX/zDSGcQruXjLqXEffPM7UA91sC/0ZuoLAy0Mh
	KJrSY9CwQ3+DZDOMhVDLgNHAwi8hs8Rb7GfN81Wua09gWtzvP+bb1HJ9RwrZFaL7YVR1dTClcgKDk
	h8LUFLA1LFI/QtYXKKVS1i7gOivFKh7J39FV9rBzkDa1b/BETY6/3sIhf4AZSB4Z9+fnStlPBwfdO
	s/CZcA4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAGe-000000072c0-1eAI;
	Wed, 12 Feb 2025 10:46:56 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiA07-00000006zJY-3WGX;
	Wed, 12 Feb 2025 10:29:54 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=IXx1opLOjjiKNWNAApBWF/hlYnH/loBfFFUFgmxSPFEYvVGFpGZcf5AHN/BOwqWlRbwzY0qEGAiuwKQqPIsWHltTe3D20eHthefR3v6mEQ7HArL+Lm3PAk/Izk4ttvt03I41w52DmdFXuGfx3DhsHxKihoP4iQQFK90E8ric13SzISEmVRLtoYQiAzIHfOY28uk7PrGtiwQtAXaj8fNeftyvK1ePfNRB/Cf+ww57xSUwHroiOfeWfcYJOeVPiP1TTVDdf2F2Ybc2b0xVl+2bZmbalIJOyUaqSTELVPVxgDKf8ZBY8ksf4XkHqm5H+6DiqtvLMsQeD7dRWa9cJHUzhg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/D4REZg/vZys6vAoYvItBGIfiRfDS0UyGfk8fk3G/E=;
 b=gw36fwhynt4D/iURBlBA+5gf5dReoTlgnXClouwLD9t75h6TK4v3+Wssgm2VYiePIRJBeSP2xQdbsjV3ues8TKbHtrKA5S84WSillgzrnDOy8XB8XJnCFGGbeavfaAyTGZSZ2MnBLb9T/+v6mBKIEghU3UjBhkUjDKd92eCFMVLLz3/xc27p6AAY5q7UxJLewpk4b50L5/2ryvX9mzkxuHoKB+miU4E1iL07GiiinsnBeBS7Fr/UrnavJGKZ/AWMfa2rYMU+xE+2wsWq8E+YP/OV30Z4U0AT93v8OafQ4tO0wVJvzvJmJYaZnMJwo8aBdkkcDes8RJHQ99hdesWLCw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/D4REZg/vZys6vAoYvItBGIfiRfDS0UyGfk8fk3G/E=;
 b=YX062vrnQFUks4o3xlKfkZkd5mXP4dpNnlKNmPgn0R8AtJr3I3Rq0da1e0+1waV3tt3fdE1kU2L9ICCUKugZIPjA2LQoCmx7GmsWrTe+P4t/ktE6Nt3IVjH1Li6wmg6RfYPoxlRZx9fpVKGipy4NurzeFARJxzSeyFTeZXzy/+E=
Received: from DU2P250CA0019.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::24)
 by PA4PR08MB6224.eurprd08.prod.outlook.com (2603:10a6:102:e7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Wed, 12 Feb
 2025 10:29:47 +0000
Received: from DB1PEPF000509E9.eurprd03.prod.outlook.com
 (2603:10a6:10:231:cafe::6a) by DU2P250CA0019.outlook.office365.com
 (2603:10a6:10:231::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.13 via Frontend Transport; Wed,
 12 Feb 2025 10:29:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509E9.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.10
 via Frontend Transport; Wed, 12 Feb 2025 10:29:46 +0000
Received: ("Tessian outbound 4fd325905615:v567"); Wed, 12 Feb 2025 10:29:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4f356090565129dd
X-TessianGatewayMetadata: jpiB1WD/lQwSfYnk5y/KCz1pJF5Fr91gON+p7GZChpjeSvVsH4AB5zFjW5hD8rYO9XTjK4K22cSh+4f0HSQJpcX6RTBXA6skxi4CyWCVNnTvZIhJnsAT+/TxKaolmiwhsI+IQV4ao/3SZSgQrxWmGVhGwmawi4WVSon2Mcmn0F0=
X-CR-MTA-TID: 64aa7808
Received: from L9a14846fdea7.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 60517810-50C4-4AF0-9EFF-E33B587F7AF7.1;
	Wed, 12 Feb 2025 10:29:36 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L9a14846fdea7.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Wed, 12 Feb 2025 10:29:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DVYmfOTn7TMXztZ17ykn/yhjZapJ+SxDWXMUGK52XQpHL46zXZXJuBv4Iu11DoYf4g/s8hUcep3yDE7R5zoUEwXSIR0FKKB2ubIPk1Xj+U8qSW7NHl2w+VUvEddqhESE3PVz3e6o9QRER0wpiBZiD+DRnYHhOSENMaL9elUx2gg8ZRRTth3qjvJ0tLtabYixf0Xp27HbdeG18a1ClBhNeMlhHVjasTejrjnDe49WoaJoKS3WhCHH5vaQivduSyl++favGOR6juM4OZ8INC4PEsNRQ+jq0GBAnrR4gb3VrIsCcuWzRW6hUh22oJ91zsSv0rxUYLo35k+3IjkZwcVQtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/D4REZg/vZys6vAoYvItBGIfiRfDS0UyGfk8fk3G/E=;
 b=fPwVnmxcb88HdIPirAczjghfE8RDkUtFnCozsXatLc7Y3HQ3NT36JEtFoI79yFR+QUtvh8ZQUI55jb1HUyG18gUcLVpIUZAl++b86qgj4e4lFUXC6LZFSlcmMuEpN/DQRXPCWTH40YqasJgRVCT93trXysrSUbRk25B0ivY+HrpPzDqi3rqtTf/vdy/03/8CDucSh44TQY15VR3nhFMKumGPnSN3/aQdDqSZmBn/Rew06UDn6pzXUlh6J+8gw/25UD8miqiRXdVAuU4NdwjNmODDeSffPUz3xNAtPFRwnRT3o6BjBwip0B8ilPzKexcqO+RJH5eM79O4aRP/vFL+tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/D4REZg/vZys6vAoYvItBGIfiRfDS0UyGfk8fk3G/E=;
 b=YX062vrnQFUks4o3xlKfkZkd5mXP4dpNnlKNmPgn0R8AtJr3I3Rq0da1e0+1waV3tt3fdE1kU2L9ICCUKugZIPjA2LQoCmx7GmsWrTe+P4t/ktE6Nt3IVjH1Li6wmg6RfYPoxlRZx9fpVKGipy4NurzeFARJxzSeyFTeZXzy/+E=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS4PR08MB7925.eurprd08.prod.outlook.com (2603:10a6:20b:574::8)
 by DB8PR08MB5515.eurprd08.prod.outlook.com (2603:10a6:10:11f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Wed, 12 Feb
 2025 10:29:35 +0000
Received: from AS4PR08MB7925.eurprd08.prod.outlook.com
 ([fe80::8ef3:b027:e22f:1ea7]) by AS4PR08MB7925.eurprd08.prod.outlook.com
 ([fe80::8ef3:b027:e22f:1ea7%4]) with mapi id 15.20.8445.011; Wed, 12 Feb 2025
 10:29:35 +0000
Message-ID: <8ee8e684-0164-4e70-b42e-3827c7885685@arm.com>
Date: Wed, 12 Feb 2025 10:29:32 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/5] dt-bindings: dma: Add CMA Heap bindings
Content-Language: en-GB
To: Maxime Ripard <mripard@kernel.org>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yong Wu <yong.wu@mediatek.com>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, nd@arm.com,
 Akash Goel <akash.goel@arm.com>
References: <cover.1738228114.git.florent.tomasin@arm.com>
 <771534be8dfa2a3bdc3876502752f518224b9298.1738228114.git.florent.tomasin@arm.com>
 <ats2unrml5a7vbpdrqrzowodrsfj44bnubpbujg2igk3imeklx@nrpmg5oeq3gz>
 <be8e6b9f-c3c6-41d1-af9c-3dcd102f0fe3@arm.com>
 <b02711c901e8acf2bc47926919de7673a0cb0b98.camel@ndufresne.ca>
 <fae8df2a-3e47-4266-aace-392c5f37581f@arm.com>
 <20250212-naughty-chipmunk-of-potency-7e0ced@houat>
From: Florent Tomasin <florent.tomasin@arm.com>
In-Reply-To: <20250212-naughty-chipmunk-of-potency-7e0ced@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0085.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::25) To AS4PR08MB7925.eurprd08.prod.outlook.com
 (2603:10a6:20b:574::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS4PR08MB7925:EE_|DB8PR08MB5515:EE_|DB1PEPF000509E9:EE_|PA4PR08MB6224:EE_
X-MS-Office365-Filtering-Correlation-Id: bdf52c59-865d-48ed-634b-08dd4b502c4c
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?SXVFNEZFOXZ4bWRMT01UWGdVV3ZreW0wcWJyUW9kaTNqRmU2N0hjYk9vSW9n?=
 =?utf-8?B?US9nQzBLWmlkalh2Zyt3UWN2d0RucG1YMlBQL2ZIL25BWTEwL0NVUWpVTFQv?=
 =?utf-8?B?eURnQXRNZlQ5b2ZTWU5QdjNRQWxic3lKWFpkd1Vyc3ZlS2h3elErdi92eWty?=
 =?utf-8?B?YlBvTk1hWnhUTG1ZU1p4SnVoVHBUU0dLR3pCVElvYS9VYUw4Y3ZVWmhPc25t?=
 =?utf-8?B?dGFmZlpPT3ltVGNjcmlRam14Mm1aNFlRSWlqeHAxam05dVVKV21qSnAzdTFO?=
 =?utf-8?B?a3d3blF5UCtoQ25LakZ0RHhOdUxZd2tmRENGdlhQdEtKdUVlemo1R1FnZ3dx?=
 =?utf-8?B?SXlMWkJmOHhlNjJ6Rk04Z2ZNV25Fc04yTCtFSWlnT0ZOb2JaMnk3bTlMeGtJ?=
 =?utf-8?B?V0MzN3FTN0FtZWVjZXJ6R0dTL2dleXNsYUpjRmc1TExxVDZyMFV6TDJod0dm?=
 =?utf-8?B?TjRIZDZHQUpDaXRZcDZVblVCZUxUT1oxY2RLY0RLSVRBeWRFQnpKOFZtVEFH?=
 =?utf-8?B?T2JuZDJrdjNGaFFBeDhhMW1FZGtGOHZERUNGbk5SWmZmTWw4TE5KejE0YURI?=
 =?utf-8?B?dUJ6NTE3b0poT0Fybmwrak4rNmpLc2NnRDl0ZFIvbmhhVzFGbC9GdnVDUTJ6?=
 =?utf-8?B?UjB6cnNOVFJUQytjbzZzM1J2TjRJeEJ1eVZoeDBWOFYwVS93bDU3Zk1pcXdM?=
 =?utf-8?B?NjNRdUw3d091SHlMVUl3cmhuTExCVXpNSGNuZGhDTFkxZkJ4emo5TGo3MElU?=
 =?utf-8?B?YkN3QWZDcm5jdWI2OXh0b3FpOGFwalFMeE5TVXg2dElnR0JTRCtRbnV0d2x3?=
 =?utf-8?B?RUlrNHFqUkdJTVljVmhYcnNMaEFWL3A2UEtJV25ERnZQellMNWFuMllKY0Q0?=
 =?utf-8?B?V1NwVkRESTVjb1IxL3R5MTNtMTRMeFA4S09aWHhaeW1jeFBFMGdUUmFMbitT?=
 =?utf-8?B?TjhBQkE5WnUrSjFNUWNIV1JoZ3JZbGplSUwxMllPM0FmUkJEM2ZFMnA0cGxi?=
 =?utf-8?B?bkxwOEk5NkV3WlBFRkN3dm1wWW54VS9vdVc3WXRGaEdBY096WTlCamU5aitC?=
 =?utf-8?B?U0pMbkhsVUF1NFJQV2MwZmlmZ1M3YU9sUFVtMitBZDVlaC9qdS9USTJFdGli?=
 =?utf-8?B?NTZQWFQ3THRYd1FKRDJBUlhvWHhuQmE5bTJZM08rK0gycjJsajFzaWJJR1VG?=
 =?utf-8?B?bVRPVlRBT2k3ejBsUkd3b1VQNnZDay9XU2lSZkg4bHhnNWx6ZTZzekY4Y3dL?=
 =?utf-8?B?ODM0ajdhMnRIbmdjMCtPaC8yOTdVaitJS1BHV1R1RGc4bm5menJXNzdUaDZZ?=
 =?utf-8?B?bWUxZW1UU1VIR1oxTTFFZHFaV2dPcERnSUFQTWQ0QVVUVXNGNG53dHFOSTlN?=
 =?utf-8?B?cUNwenBPZnZyUm9KZEJCT0VlRUdzamFqZnMrdjdIMUR6Z2lmSzFCdzlRR2h0?=
 =?utf-8?B?U0JSQU52MUNKMDNlN3dXbTRxNlkrdkRqbzllQStQdzdKMW9uWFZmbjdTRURQ?=
 =?utf-8?B?YkdvSUlMTm5kNXZCeWg3a0VBS0lqSUY0eTNFTm42UzhEZjVRMUVwZ1JML1ZH?=
 =?utf-8?B?QzFGNFNiYXNQOHBrMmNLWFBJbUZQMVJnaU9nUjVsSDRhZU1kQWZoTnBncng1?=
 =?utf-8?B?dGo0andjbkVsK2FUMERSVWQ5OHhpejJEY1pIRkEzOVVwQTI3eS9iTkEwLzh1?=
 =?utf-8?B?NTdBRm9UY1JWdnJOU2ZBVXl5N2xRSGplYXh4N1J0Y0J2TmllR1Z4WGd4V2I5?=
 =?utf-8?B?cHhrMktMY2tuajRDV01CdnpBc05wWlhVT2RXYTFlang5TGVVTUo0NXR0WnRK?=
 =?utf-8?B?eWt3U1pTZjlyMkFhY1JEL1Y4M3M0TE5SOE9Wd24vT1JpODFWSVB3U2FjcExP?=
 =?utf-8?Q?54ItRiX0qWqQ+?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7925.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5515
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:574::8];domain=AS4PR08MB7925.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: cce96afc-2fc2-41a4-d27f-08dd4b502509
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|35042699022|82310400026|1800799024|14060799003|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHo2djNpYmdYQjAwMlZUbkRMR3lFMXFkZjU3SVJqcE5MTTMxaEJqcVJLZ2VL?=
 =?utf-8?B?OVR0dkdrSHZyY1JuRHdKNkNNUVhiMWE2eTQ3b0hVbHFzRjc1UGoxK1hUUUUv?=
 =?utf-8?B?S2ZRVXFuSnpnSlVjMjRsaG9sczRWNmhpcDZnejI4RVlIcDcyOWZjVDlXNW9I?=
 =?utf-8?B?VFVOajZweW9wQUZuMzlBMVFFOUhJQ09za3hDNHF1VjRnZSt0SFJRNmFNdklP?=
 =?utf-8?B?WC9tbDA1QkVPWEF4Si9MRS9DL1pMWFIwNlp0WC9wYllIRFhCV283aS8rTHRT?=
 =?utf-8?B?ajVUNzFWeVNlcGdQNlBwTmJ0UWV3dEVZM2pxMVpEWmdJY2p4M3VJN0d6c2E5?=
 =?utf-8?B?NGlRNTFqRGxrc2dhYXVEVmJQYUxtNFlxRjJMVlJ1TUlzU2s3MjNIWEtPY0Mx?=
 =?utf-8?B?b09SRU1najhnZHBneEhKb05WQTh3d05pZXlkV1ZJazRmdGpSZVNodnNabW04?=
 =?utf-8?B?Z01BbXROdEdNRFJFbC8rUTFwYW5rNmI0SzhzM25QUGp1eXZWTHZ6cTVIUm5I?=
 =?utf-8?B?bHRTdTJrOEpBbHZrWWJmV3ErRTlBM3plRlpyS21rZm9VaCtLcU4wU0FvYSto?=
 =?utf-8?B?MVAzOGJnMUFxbjFBZmpKV2p2Rm41VS93aGg3aDI4dUtQa0laSlZIb1l1RWlZ?=
 =?utf-8?B?bVl2WncwZDU4VGN4R281TzFxMWV2MnFycGRLamN4RGkvZE0wU1diQTNwU29t?=
 =?utf-8?B?akN1WFVJQ1BOTk9rbkJSVDEza2pKVmZVN1crd2liUXF6TDdLRkNYYzJ0c2ti?=
 =?utf-8?B?UUJ1RE5YeFo3NnhVMnNMNWF1UEs4d0Q3UUFMZUJncHJRRFhHY3J1V1gwaStj?=
 =?utf-8?B?TVZ6b0dGNVM2RUJMdGMwUzhkMUw2RzVrYTRFSlR3aHN6QU4ybGY5WmZtTnp5?=
 =?utf-8?B?WUwyRll2SVR6U211cDBpVjlRQ3p4T2paVlQzbTltTEFtSDhXdVpyV1JJV2Rv?=
 =?utf-8?B?d1ZDS05hZlV1aVpMdDNkVEtoMUhET0dUdjN3djNNL3pxYUV2R0tRMUtxU2Zs?=
 =?utf-8?B?UkJyYlhOM0xES1IydlU5SlVWZXQ2YTAxL2toUzIyUFhpMFJ6d3d4TUZJTHQ5?=
 =?utf-8?B?Ky9pUHlZOTgweUdTVkF0aFNyYVRSazQrN25aK0VNWU1IU2IxbUk3OXVXTVFG?=
 =?utf-8?B?Q1JpUG55cHpVN0d0Q0orQS9FK2FJdzdTS1ZDbGVIQlY0VzNabjhaRHBiNE1x?=
 =?utf-8?B?MzlxdG5Ld1lJT3BoL0VvamxLSTllQTZBQkxZRjZsanBnby94SGNvMHR4WmVF?=
 =?utf-8?B?cUVVUUhTaDBkdWFnR3cyYjAveGlMVmlNNmQzMlBIc2Y4WmdQV3dWOHFYaE0w?=
 =?utf-8?B?MEZGWElFWGtkTjF2ZVptc2JXT0xpditEdjhHaThMNXM0WlFyV2ZMRkp2anl4?=
 =?utf-8?B?cWdiSlhpV1o5OU1YTWRYend3OHhmV3NwZHNDMm5ydit4bEY3VndDSkRnZ2Zk?=
 =?utf-8?B?U24rWEVySHMzbGF5V3JzOTBTaUE1V0NVc0R2N0dxcE1teWFoZi9zMktoUmtV?=
 =?utf-8?B?MjZUQnBOS29nVDJvYnRsK29GMGpvVERNNXdwY2dTc0FOUmIwTUJldDFzOEd4?=
 =?utf-8?B?c3FJekJ4S0loUVJxdnlDeDZ2ekkvWTRMczEwbUFJYVA0RXAraStJRXN2c2RU?=
 =?utf-8?B?Y1JyNGNLRnhwYjZINVFVTndPeFhHcjhDZVB1UnAwNXZwRHhlaVFHWUdsQU9l?=
 =?utf-8?B?c1VRR1BOYnpoVkV3VnNibGl4SS9aS1o1K240ejhqQTJ2anFGK3ZXMzhvMEVu?=
 =?utf-8?B?RDd1MW1sQUQwbjNLUGZGTXpNNVI4SXp1YjRXcDlHMVhYNUYrSlFrMmNwcFhK?=
 =?utf-8?B?bnFwUzQ3dElSTk9qQ21EUXdvZFdtbFhJU0FYNGtkVzFtWjdxVWpMRGNHdmRo?=
 =?utf-8?B?SGFVanpzelM1TVQ0c0N3ZkJ5bEFWQ1g3OXZaUkFib0RhSVNzanNwa2F6eE1H?=
 =?utf-8?B?YzNuSTlib3ZVaGl5MGRmeGFEQU92MWl2a3BVSWRONTJ2ZmhUbDBpcC9SSVBD?=
 =?utf-8?Q?YcFs6RL9I5+otY7Q8N5DTdTnE1aOkI=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(35042699022)(82310400026)(1800799024)(14060799003)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 10:29:46.6961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf52c59-865d-48ed-634b-08dd4b502c4c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6224
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_022952_135826_704B0B46 
X-CRM114-Status: UNSURE (   5.08  )
X-CRM114-Notice: Please train this message.
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



On 12/02/2025 10:01, Maxime Ripard wrote:
> On Wed, Feb 12, 2025 at 09:49:56AM +0000, Florent Tomasin wrote:
>> Note that the CMA patches were initially shared to help reproduce my
>> environment of development, I can isolate them in a separate patch
>> series and include a reference or "base-commit:" tag to it in the
>> Panthor protected mode RFC, to help progress this review in another
>> thread. It will avoid overlapping these two topics:
>>
>> - Multiple standalone CMA heaps support
>> - Panthor protected mode handling
> 
> You keep insisting on using CMA here, but it's really not clear to me
> why you would need CMA in the first place.
> 
> By CMA, do you mean the CMA allocator, and thus would provide buffers
> through the usual dma_alloc_* API, or would any allocator providing
> physically contiguous memory work?

You are correct only the CMA allocator is relevant. I needed a way to
sub-allocate from a carved-out memory.

> In the latter case, would something like this work:
> https://lore.kernel.org/all/20240515-dma-buf-ecc-heap-v1-1-54cbbd049511@kernel.org/

Thanks for sharing this link, I was not aware previous work was done
on this aspect. The new carveout heap introduced in the series could
probably be a good alternative. I will play-around with it and share
some updates.

Appreciated,
Florent

