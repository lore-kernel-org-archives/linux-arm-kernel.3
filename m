Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41859C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 10:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L9nnzDSPE+EidbdHEfcVSsL5ckUnh3VMW6wGoOEeprM=; b=h3mCFlDZpF+xtqGQ9Otv6rTAus
	KpubRfxJocxd4UsKBiNw63TtCmwXbDU4YpW7dwYW+NlLEk+IxxaFJo+Um4sqrltTdfU5/kEgT+GkG
	xy6+no9Ey8t3kyKvsER9VHezHag4roAIVmrB64CKwtGMJyJpQdfRAvANmDdxFGsurhsN8AvtjTdn/
	NeamyH46BSbhmcPb+E/VxWYtwmnUWlE2AyOpSULyTed0/vT6G2empfKP2BZEYtBufGNHQ4FYhudcH
	4zA2Mvw2186aJwmN/f1mVqKDswjGgwOgmTikZKFaQXtNFDg7amLV3yoqj9xzS1/yJ2/URRGkBDHED
	TAs1Lb1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9hr-00000006wKW-1DIU;
	Wed, 12 Feb 2025 10:10:59 +0000
Received: from mail-db5eur02on20601.outbound.protection.outlook.com ([2a01:111:f403:2608::601] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9Nl-00000006rRk-1OF7;
	Wed, 12 Feb 2025 09:50:15 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=EmV/wxWms0s7C8zVukXr5fFZzI7fUGbmaJZ0yCcq5EJSCuBvgQKlSfHnIuR1SFZvGBEPu2NCH/0UbPGOnaq5wezi7kFPUTG2vgqfhkjlxrGWNLJdWpoCGEdpPdgO4PhrMMhFQhkolrMGrvtpNkF5HYDUcKPkvz9lUaLZvnE8h7gMyzlLzj/aZjEh4u/vNihq9PZPrlFkDxcBXQPXD9SPCxmUeLF6k3u5ZlUHBjjf33Q3U0LsOGJlyFW9xJnsDAS6NoR0wjUCi6Dl77dqUeVFQH/TiMLPfWyHOEBtkEQYBxzBj6lSCXuqdSZMsYtGa3/9u4+7yyTBaopF3A6f283Dfw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9nnzDSPE+EidbdHEfcVSsL5ckUnh3VMW6wGoOEeprM=;
 b=mihFJ65UpuT/iR/eJrqY6gNLSr72ay5G2szzTvOAwYU9cl/wHyfQIRmk2sSqBfoN6zT5kpscjAxb64h2W6MQ8sApfMNMy98F19kSzrBdy7GeeVyPXg2QRnvSE3SerWpIAcPt4Bt8sMpxB62zGlKqgRpKMhMoa000zU34v/LoJ2HOuU/NfTGjzjSZKxhBCX8Zk5vjifJwaoeFN1+DUrzGDQKj4yKDNA+iHRL50fRKZIXAmJkfXt3m9G+JhoLQohxUWK3fr/x/wJK4vzUaIgtr95BT/lNIhoI+3EnuBl3KXbumbfmNpN0UV5s+q8UZNG9LXrrujHjsjxZRU3GQQmacdQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9nnzDSPE+EidbdHEfcVSsL5ckUnh3VMW6wGoOEeprM=;
 b=gvdLfuwpj62/hiZfqMyDpj9ElpUIJc1P7WaDhLLiqePjRbnztjfUb2hpUIe3Xx+A8+ScpRyfbiG1TCjLC3jPipEVqhES0EtdAU5vcV+5UV9QGPwU/j/zCeDQI0lJj18DbaJSvxzobqBrOS8bEZXf+cDF0Md+aO2mYq30yIebL44=
Received: from DU7PR01CA0012.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::15) by PAVPR08MB9580.eurprd08.prod.outlook.com
 (2603:10a6:102:31b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Wed, 12 Feb
 2025 09:50:07 +0000
Received: from DU6PEPF0000B61F.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::d) by DU7PR01CA0012.outlook.office365.com
 (2603:10a6:10:50f::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.12 via Frontend Transport; Wed,
 12 Feb 2025 09:50:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B61F.mail.protection.outlook.com (10.167.8.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.10
 via Frontend Transport; Wed, 12 Feb 2025 09:50:07 +0000
Received: ("Tessian outbound d73f074635d5:v567"); Wed, 12 Feb 2025 09:50:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6df9c6bf7683384b
X-TessianGatewayMetadata: 4M0JT0e1YttWwI5J1aFwVdVJADMGnyveM9FVPWq063QYidGdnrEPt2aOFUim9c1bLrc0bXgZXOvFC6zWTraRu69MPBTpQhZncTCY6epcfgouGxaQFuttH4eR9M2BRMnsdrice4KmK8NkXTLgu61KsQ2b9vKYnkAItTgeiZCQLRw=
X-CR-MTA-TID: 64aa7808
Received: from L17136468abae.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A0A385C2-D2AD-4534-8C08-78AD9C5DD0CD.1;
	Wed, 12 Feb 2025 09:50:00 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L17136468abae.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Wed, 12 Feb 2025 09:50:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nk4Or2GcAKAziL2Hc6u5tWiAvMYaoadzyGZFPSXYP8rAHhnmdofYkqWLyaqaSSWiMLnoauNE0D24B8Bk+QkBs1Spr1OR+/sbDpXoA9fMME2mYv62N0R+w5PrcdMYd5QftdSq+gIMWe11XFiHcBntVNkQIPVDcAMDShfZb4vbxfbJ+7W0WkoNca7+KPLy3v/E7fLpIJ7B0q30pxt9KEYBiCR2y2p0+8X7hTCbQQLTzRlWQlQ0ugXYgJOwdSzxfEk5CzLPBOzRlo+pdw7BOsKm8j+50vACehxavgJpctGQ69nHURegpcvWlSQvD4ETs5yyEO6vilrKOaeTAU0zwN/f5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9nnzDSPE+EidbdHEfcVSsL5ckUnh3VMW6wGoOEeprM=;
 b=qzkQ+gXyC6CBcPncaJsN8nHAqVVOJ8sIg71Dvl1LZa/FaADHYGus4XxEzDgmHa6JbovS5GG/RJOx/KthRrRMhuxTkluayOaDzznrVHxaxHZ2dvAMx9fm8IDxfu64CUROP48Pjsc4QrqygeyRUMoz4PUQA23DTQWDYR23vViG41f9HjBI2ssSd9ehnCeO+lPJkW+4g2a5U+1RsCqMlFNlwPvFzAZIrGzPZ7WEieRX4h4tsv18c0JMt4+73/RYgaeu0lm/qrwWvkn2p88ZtjvdSMzQL07CGCYsM/vHxVyHDuvPkmH03JOMUWR+4z4T8sDftyFIHyGQOme/IxsbwoEvVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9nnzDSPE+EidbdHEfcVSsL5ckUnh3VMW6wGoOEeprM=;
 b=gvdLfuwpj62/hiZfqMyDpj9ElpUIJc1P7WaDhLLiqePjRbnztjfUb2hpUIe3Xx+A8+ScpRyfbiG1TCjLC3jPipEVqhES0EtdAU5vcV+5UV9QGPwU/j/zCeDQI0lJj18DbaJSvxzobqBrOS8bEZXf+cDF0Md+aO2mYq30yIebL44=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS4PR08MB7925.eurprd08.prod.outlook.com (2603:10a6:20b:574::8)
 by DBAPR08MB5607.eurprd08.prod.outlook.com (2603:10a6:10:1ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.22; Wed, 12 Feb
 2025 09:49:59 +0000
Received: from AS4PR08MB7925.eurprd08.prod.outlook.com
 ([fe80::8ef3:b027:e22f:1ea7]) by AS4PR08MB7925.eurprd08.prod.outlook.com
 ([fe80::8ef3:b027:e22f:1ea7%4]) with mapi id 15.20.8445.011; Wed, 12 Feb 2025
 09:49:58 +0000
Message-ID: <fae8df2a-3e47-4266-aace-392c5f37581f@arm.com>
Date: Wed, 12 Feb 2025 09:49:56 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/5] dt-bindings: dma: Add CMA Heap bindings
Content-Language: en-GB
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Maxime Ripard <mripard@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Boris Brezillon <boris.brezillon@collabora.com>,
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
From: Florent Tomasin <florent.tomasin@arm.com>
In-Reply-To: <b02711c901e8acf2bc47926919de7673a0cb0b98.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0462.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::17) To AS4PR08MB7925.eurprd08.prod.outlook.com
 (2603:10a6:20b:574::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS4PR08MB7925:EE_|DBAPR08MB5607:EE_|DU6PEPF0000B61F:EE_|PAVPR08MB9580:EE_
X-MS-Office365-Filtering-Correlation-Id: fb14f8a4-3df7-4fca-d0a6-08dd4b4aa1f5
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?ZTcvc3M5VkhxVjFUcVcvbW1GS2ZjQ25scW9hdWZ6THpQTzNxQ2c4K21aUDhR?=
 =?utf-8?B?cllFZWUrd2FWUG0zb1B3V2k1SEIxdUZ3QjFwSDhpd0xrRDBvVHJMRGlBN3Bz?=
 =?utf-8?B?b1RvTzRDN0c3eDc5QkVEQTZRSWdmOWs0SHBKb0xJUE9Ka3lEc0VaRVkvNG1S?=
 =?utf-8?B?VnZUOWFPQzFrODZrNVhIaUYrVzZaYnVYRjIrejBETzQvREFsSVdKclFsRGpx?=
 =?utf-8?B?cXBkU1ZOTWM5YWk1a0FBQnErWFkyc3BSV2pzR1BBODQ0T2pqT0orZDQ5UlVO?=
 =?utf-8?B?WXNFWGVjck00V0gxUUNpR3JPbnRGdWdpeEp6QTNOT0huTFJERUdNWndONEpX?=
 =?utf-8?B?UzdhczNMTHpMOE43MmkvYmYrbXI4VE9idTl0WTU5Tk9CdzY2UWluT1ZkQ0tq?=
 =?utf-8?B?VzRZQzFHYVFxRVh0SCtwRDV6eEpUS1hMc0E0VTZHZllhTDdhUzhBa3hrVDJF?=
 =?utf-8?B?SGpXL1AvVTQ1WnNrYXBFSmNIUUgyWWt0SnNJcGtMYTUrTVZwNU1ISlNKZjRt?=
 =?utf-8?B?RGNSaER2UlBOeG02WkdvUnF0WkdBS1hCV0dYY3M3QTZjU0UwbXNDb3V3WkVw?=
 =?utf-8?B?LzBKZmJSdFh1N0RMOHJlMlBhSWpIZ1ZGclhDbXEzNDlvUXAvVTNsc0pRc1Jm?=
 =?utf-8?B?WGMvdkoxV0pGQ1ZDU3dPMHRHZ3dNUXlmNmZ4NkEyTndTRE5qa25PL2NIaFJh?=
 =?utf-8?B?d1V3WStSclVoUTd3Mk9ja2xKRkVkdnRVOTd5c0tLR0ZyNVhvOU91bjNGSEtN?=
 =?utf-8?B?QkE0VFBmekZ5OUJxbloyN1NPK3dlaERGa1JyYkJ3RHBiakxMdnFZek9rK3RX?=
 =?utf-8?B?amV1ZlMwL1RnenlPakFKbkNZNytYY2xiV2Z0eGQ0YksvNlZBRURDeHl6NUw5?=
 =?utf-8?B?OGl4d3R4dHZIOFEvUE93NGRZVno4WWdQRkZxRC91cUVDV0ZDaDU1SjRoL2xi?=
 =?utf-8?B?Y1RubzhqVFdJVmJJeEFENnRQQ3dpZHVmbC83RWNFaHhSU2wvWmh4REhsZzBu?=
 =?utf-8?B?NzNNaHpWM0dhRnpmcnRvbi9Ic2JteWsrQ3ZjdFBmK3FXMGZxTXZYOUZBam9q?=
 =?utf-8?B?dDdJOERTNWtETlZKOUlxaWdyUVg3NEJMR1dqSDArVnFIdHBHSWtjTW1vV3Bv?=
 =?utf-8?B?L2VMMU9rOEgvV0R5UDlGbHlPMWk3Tk9YbTNnOUtKN2pDNjFWTTB2TXI1OXZL?=
 =?utf-8?B?cUMyQlloOEhTclBqRGJlcElCTGk4TmhkNmhPUHJHcmxyd0ZmK1JBT0NlTjV2?=
 =?utf-8?B?VzRGV3dNR3dmTU1kQnpDSXBFOWZSMDRhY2dmbVpaT2VGd3Q1K2dZUDE3aG5w?=
 =?utf-8?B?cFpGK3hwY1JGR1Q5VEZ5Z2JsR2lUNTczaWFNSGYzb24rcXVHT0thOFpKTXJv?=
 =?utf-8?B?akpaUG1oY0xCYUVqbUFuRlR6SDhtc3REMkZQZ0dLLzJRdE5mRGlUNTdrd2NF?=
 =?utf-8?B?S29CTkJrcmNpV1BlOElONlpYNXlYaGtUMzRnZ0VWNFpOajNGVmVoTHBkOEg4?=
 =?utf-8?B?VU4zZ0lKVUpBeGlGYzEzbi9lRDFOMXdWRzI3RTFJTGVnWU9hQmhoaDdobkhX?=
 =?utf-8?B?dVIvZHkvNThPS054YmdJOStOb28xZlp3TEpxa0xMZS8zU004VG8xcmtvOWtQ?=
 =?utf-8?B?c1VQclcrSzYxemFEMkRoN0tubTAxbmN3b1ByaVJjWU9hOG5zZU41NU5ZMzJG?=
 =?utf-8?B?ckpaNnhPMklNVENyNzFFYlRaWGlqQnJLNHY0V2srdjhXTWpQcVhBZlhFZHJV?=
 =?utf-8?B?b1QwSlRoMlVwcTdTNVlJOSt4K1NXUmoyTTdTSTVlRktmd1N4dEpSTlZRTUc5?=
 =?utf-8?B?aHZrME1IamJzQjJidWlkVjB4RTN5bmNneEdRUTJYQjU2VldHOFBlOXdUaWo1?=
 =?utf-8?Q?kpf+B/TZEFrQ3?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7925.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5607
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:574::8];domain=AS4PR08MB7925.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1d339af0-1ede-426f-f647-08dd4b4a9c49
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|1800799024|14060799003|82310400026|35042699022|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TURyOEhRMzJwdm1aU0N3R09pMzZEZlQzdUZyK2xwRlc0UUxwb3R1S1ZhRnN2?=
 =?utf-8?B?a0dSanREc3BGemhkWXlXVFZzMnFlbE1ZZkVtYksvV0tiR2hNa2Fuek5EU1pz?=
 =?utf-8?B?ZUZHZnR1TU5rSDBnaVBnL0R6cFRIMnRrVGpSa1gyNUV6Q1F5bDZVT0doR3Ex?=
 =?utf-8?B?Z0U2eW8zNERKQ3k5RVl4WnVGNjFvUzBxMzhnOUNJTzhjTXErc1RKTWtPdGhP?=
 =?utf-8?B?bXM4SHhpclRlc3Q3SG5TTUpxUFlPVUtMK3RsaWxoU01UbmZxaGRMOWV1U3Rz?=
 =?utf-8?B?ajZFNlBuLzdIc0VFcWtvVGVqdXpRVnFtRHJ0QWFVRVh2TFliUERhZGFKWW5x?=
 =?utf-8?B?ZzhhNnFkdStXV3llOXVBNEo1bzFhUURTaitJWkNUUDVlYmE0ZWNVemdmYlRE?=
 =?utf-8?B?cm90c3NzeWlCN0VjbzNzc2h0dHREQVRhWFkyWEo4aU95TFk3cysxRkdWUmxN?=
 =?utf-8?B?V2huSDh6RTF0OFJseHJHTzQ0dERzOUxlWTBXZGc1M0pFdENjbStEeXpLV1Ax?=
 =?utf-8?B?N3ljR1Zmd0FoeU5CM1o1WmxTUmhiMTcxTmFkVW5mU2hUV3JIK3czWGI4Q2hZ?=
 =?utf-8?B?T0dJV2lJcy9jNHBQM3NNdStDWGV3azNlNWlKK3FNL0J6RUVOQjlQQ3U4ejBS?=
 =?utf-8?B?VVFydkNEbXAzNWRQbi9wQXc5NkQ0bFNlcGwzV3BYSjhQUUIyOUVYNHhsTHRw?=
 =?utf-8?B?K0dwaGRneGl0U2hVRFVieDh0a1BROXBvbHVUSW5PUEMvTjFHeUhlemV5WHRC?=
 =?utf-8?B?VEJZQzRKamFkZTNzcGFQTjk0V0FoSzJYMTVDSG90SUd4K0NsSEpOVnNVeXV4?=
 =?utf-8?B?OFpjNnBmbkVMYXRUWTlHOXhSYUtsWEhlcGJ6RjFNWlJVNTZKVkl0YlR0TEg1?=
 =?utf-8?B?M0lnOGdZRkFVQ0U5Q0g5ZkVrQlZHMVY4aE9sWHFhM1crc3FROGxNTmErM3dl?=
 =?utf-8?B?SHZQaTRRclRBbVMwaHVjb3NJcGlxcjlmYVB4ZC9ZRUNPRTBvVE9xekxFYnpX?=
 =?utf-8?B?THk5Q1JMNWlvWTBXNXlWN0N4VjFIZnlub29ZOGFXazlrOUtDRVk5Z1IxQUht?=
 =?utf-8?B?eXRadDhMQitsVktLTjdneWtDaXlJTWsvS0NEUEYwcDV6L3pkZC9LUzZ6QmFQ?=
 =?utf-8?B?VUgrUnFPM2ZlRVBMYjZrMGJQRHR0K2p0dEFtZ0JNc2g1dklpS29vODlpYlY5?=
 =?utf-8?B?WnJ5UFFyb25Wc2xoUE8xa2ZaZW1HR2plakZYdVhwRWlZN2tYRExDbDNnbFFL?=
 =?utf-8?B?RkNTejlnbjBIYlNTaDNYZ04xdkVhZ2ZCbEFaTXByRnQvNEc2dDArVjNNSE9P?=
 =?utf-8?B?ZWZSSWJEbTEvNS9GSUs5bHJRejJqak8vd2hCM3RsWVR1NVY2ZEhyUHZrbk5l?=
 =?utf-8?B?SWxHazFGWWFYbTFFeFNHZmwrN0hqMXNQblJqSHQyc3ZOVGgzaVQ5aURjblRv?=
 =?utf-8?B?ZWZBbjg2RTdONzM1UkR0aHFWaU1qYjJkVktIdzhDWnY5REQrTjN5UVVQNm1D?=
 =?utf-8?B?b1lRbllhMmJZbTdnRlIvT09yNzMwbEVuRWtydFdLRk9vakZuRHRKQWFYeVQ5?=
 =?utf-8?B?d3UvUWJCTVU5U3g0bWE4SlBERDdwTGo1V204V3QzZWxKaTh3ZXZHcVl3TEh3?=
 =?utf-8?B?S1BKcmM4WW5sTFhxMW56SysyeWVMSnZYOW14MjBLMHgxTmp2dkdNU2tYNFBP?=
 =?utf-8?B?VmNGcDJDWjZobHRzSU5zMXhKcC9ldXZ0SEphRm93RFM2T2l2TUdjVU9HVGlv?=
 =?utf-8?B?TlZjeDZCYVRJMWhsTUw2eHA5RjlESlBQT3drYWNpQ2IvRmZPV3VZNXJRd1pS?=
 =?utf-8?B?bGhvbVZENU94a0FkREVVS2xrblFQaDNDYXNhS2NacFgvczdDcTZ0bE5nY2sv?=
 =?utf-8?B?UXVoTkxxWFB3bENVQXdvZWhnNmZUK3pzdWZkUXdOV09NdzZRRmpwbTlFOVpJ?=
 =?utf-8?B?Uml5dFBSTHBzTXhXTG1vUzFzS08rU3ZoVFZuRnNPTjBUMmRYdkVtZUhZaVdL?=
 =?utf-8?Q?1X3EyMj4RjDqh1nbIUUo0Q0OiAYOmk=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(14060799003)(82310400026)(35042699022)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 09:50:07.2758
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb14f8a4-3df7-4fca-d0a6-08dd4b4aa1f5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9580
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_015013_525844_49F3EB1D 
X-CRM114-Status: UNSURE (   4.86  )
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

Hi Nicolas,

On 04/02/2025 18:12, Nicolas Dufresne wrote:
> Hi Florent,
> 
> Le lundi 03 février 2025 à 13:36 +0000, Florent Tomasin a écrit :
>>
>> On 30/01/2025 13:28, Maxime Ripard wrote:
>>> Hi,
>>>
>>> On Thu, Jan 30, 2025 at 01:08:57PM +0000, Florent Tomasin wrote:
>>>> Introduce a CMA Heap dt-binding allowing custom
>>>> CMA heap registrations.
>>>>
>>>> * Note to the reviewers:
>>>> The patch was used for the development of the protected mode
> 
> Just to avoid divergence in nomenclature, and because this is not a new subject,
> perhaps you should also adhere to the name "restricted". Both Linaro and
> Mediatek have moved from "secure" to that name in their proposal. As you are the
> third proposing this (at least for the proposal that are CCed on linux-media), I
> would have expected in your cover letter a summary of how the other requirement
> have been blended in your proposal.

Just to be sure I undertand your suggestion correctly, are you
proposing to use "restricted mode" instead of "protected mode"?

In the case of Panthor CSF driver, the term: "protected mode" refers to
a Mali CSF GPU HW concept:
-
https://developer.arm.com/documentation/100964/1127/Fast-Models-components/Media-components/Mali-G71

If preferred and to avoid confusion, I can remove the reference to
"protected mode" and "Panthor CSF driver" from the commit message to
focus only on the CMA heap changes, which are more generic and can apply
to any type of CMA memory.

Note that the CMA patches were initially shared to help reproduce my
environment of development, I can isolate them in a separate patch
series and include a reference or "base-commit:" tag to it in the
Panthor protected mode RFC, to help progress this review in another
thread. It will avoid overlapping these two topics:

- Multiple standalone CMA heaps support
- Panthor protected mode handling

Regards,
Florent

