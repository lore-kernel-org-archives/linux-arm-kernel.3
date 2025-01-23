Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F07C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 16:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sb6MQDpQKfHTEVkNYGkpriPFzH3c2cgr1e+++oAMCvU=; b=Q1FyuEeyIuCDoG4/c9v7uywhlp
	K6Of0qRGFDTyjzlRuQKiEM6iR1+5N5/L/YWZSBZrNl+m59mDzB3rlFCCWbMW6AbPCvIND2uyrKckw
	7dq/YlcwUqQ0jn5MbZCvOza5r9WyZac4mHPgUYUGsObijdNZ9r+h9B6aATLLjDecus8AqH9T7IF2S
	uRbjOCQUJnFW10rNYH09lTqh3IFco5G00vkZd5fNdPNAT42AlIQwLjWkMvinJR46uOJzpCGJ8X1Vd
	pCeid4geegNsYD6mhVeDdJfTmI4l/fp9rJtAi+XHe/oqVIq39rDGTpnmUoidpOpFQ3TXJUszX6ghY
	EyFGdWMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tazs0-0000000Cnsv-0Fso;
	Thu, 23 Jan 2025 16:15:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tazqh-0000000CniY-49W5;
	Thu, 23 Jan 2025 16:14:33 +0000
X-UUID: 1d5e5c3ad9a511ef9048ed6ed365623b-20250123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Sb6MQDpQKfHTEVkNYGkpriPFzH3c2cgr1e+++oAMCvU=;
	b=N71mycNIoP3dYYHpzkbvardLI0DARCH0kioaHZHliLOlKHoS88E6stDc2okE5CozAhFzfe3GFAirRCHisRQeu782MT79rny0mfVPBOhqzB9uRSlDZGPw7Ah/owC3dNWJrjB0/PUON5ysAhhJdYyyJV2KeG88CeVsEwI+GNtp1aA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:ef0701d5-64cf-4fe9-a22a-2ff297b0be85,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:8b46983d-da39-4471-8a46-23da908abe46,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1d5e5c3ad9a511ef9048ed6ed365623b-20250123
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <paul-pl.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1055654197; Thu, 23 Jan 2025 09:14:25 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 24 Jan 2025 00:14:23 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 24 Jan 2025 00:14:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rwWZQwVZ612rCBiN6QCta2JDmoGWiF18U2NXk01hxHpw9N2+t/8iA3j0oqjHcORfxnhfO8H+EmZDUMssBabAEqYfdhGeQZFdRpDhq5wfy1+Mpiap7QUqSEea5iEv3JGUsUEnkTZ4gMgXRQWf8MEC3JFyWGQ6y61cS8gywepkHgXUb+9YApXVXjgqeeGEcfIN5heMmEasaaiT3DffPwQQrnfJXQIsiCkyz/+zC5roBLQsU/l3zJ7acxEFjnnpwDm71bE7TnXLs46UiMMCNprGZvZqQlWqqVZacsTtR0z3nCj3k3k3F9S1Jgq2P/0YHtrypQ5C+y4b63Kni+gM0qD/wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sb6MQDpQKfHTEVkNYGkpriPFzH3c2cgr1e+++oAMCvU=;
 b=ULxZ+V0t4YMNnAJ0I3vm/uxyk5vHC3M5a76N0m+EybcPyDK3qSlQ0lb/P+H5RBLlx1U7FhBFKdmSRF80+eo0TRnDAciC5iKFNd87NZyKURXYYkgIRIxUw825UoO75EZGCGObZkU+FpokesPf1bnYh8/58v1dpuNJpmyYw19vaC9NnzMupMn0W/g5wniOZ9YeffNagrfHiiI41Aawbko6EdZRus6R76nbFNMrznHFNXuAigKH3EIaNXw0g9N60PVOoyYqMyzog9YxmgHcL9S0oqACE0dz8w4cMEiqax3G1vqa7H2+S7M19x9UcKa0UFYnf2CBndR8LzbgzwU0EQ/W3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sb6MQDpQKfHTEVkNYGkpriPFzH3c2cgr1e+++oAMCvU=;
 b=bPbzUDYQS+g4rPwTwDQVsJR+4s8VhitfxlRRbWND0RzpiSz0iQAFVL8eaYBF3u1blT5HNE9vsKVwrl+UD4rrc5wU1gdjn2uxwHuaFQwwk5E96aIs0vhw+QZVozpzQTMY+eqg/u/h418CehkEh8jcGR/IwosM+YhdrS3FxNdk7Wg=
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com (2603:1096:4:1b8::6) by
 SEYPR03MB6904.apcprd03.prod.outlook.com (2603:1096:101:b1::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.21; Thu, 23 Jan 2025 16:14:18 +0000
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052]) by SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052%3]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 16:14:18 +0000
From: =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk@kernel.org" <krzk@kernel.org>
CC: =?utf-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "fshao@chromium.org" <fshao@chromium.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?=
	<Singo.Chang@mediatek.com>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
	<Jason-JH.Lin@mediatek.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "treapking@chromium.org" <treapking@chromium.org>
Subject: Re: [PATCH 03/12] dt-bindings: display: mediatek: add EXDMA yaml for
 MT8196
Thread-Topic: [PATCH 03/12] dt-bindings: display: mediatek: add EXDMA yaml for
 MT8196
Thread-Index: AQHbY1yrDUiFOy83+0KImka1ZzUdabMQB4wAgAXBksCABoVHgIAHpisAgAATeoCAAJTwgA==
Date: Thu, 23 Jan 2025 16:14:18 +0000
Message-ID: <843f2dcee012007572f41df991e52369c1e5ed22.camel@mediatek.com>
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
	 <20250110123835.2719824-5-paul-pl.chen@mediatek.com>
	 <173651725269.2671643.2891127782637834272.robh@kernel.org>
	 <SG2PR03MB66367B4A9DBCC971F55DB326BC182@SG2PR03MB6636.apcprd03.prod.outlook.com>
	 <d116e180-a056-4595-851c-ed1bb6f24cef@kernel.org>
	 <b9405b09da418eb3c65592b53489d7f0dd4093f2.camel@mediatek.com>
	 <e6fd5225-b437-4f3b-9835-f206ae4b9d2f@kernel.org>
In-Reply-To: <e6fd5225-b437-4f3b-9835-f206ae4b9d2f@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB6636:EE_|SEYPR03MB6904:EE_
x-ms-office365-filtering-correlation-id: 4dc3aa31-48b7-458a-2ffa-08dd3bc8fd61
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Y29PT3JRRzh0eEZYWEFFdmNpQTRUZjI1M2hQZlhaNGszMVc3REQ1TW05R0Ny?=
 =?utf-8?B?SUQxTHpGUCtGNDNaOWNFTDNTM2N2cDVoTk9MVUcxeHRkSm1uU0xORVJrMFdx?=
 =?utf-8?B?dWRBeWwvU2psQzFnWHhEMzYzWnRseEx4bEdlaWNpTFhYV3EyZ2RmWXk1a0JR?=
 =?utf-8?B?ZWNleTA5MHpJYmx2aHJHMkF6Y2F0TGlabkIxNUpCTHZQMkhvUittYnFLNjJu?=
 =?utf-8?B?WnZobzRBMzUvOXpIWkNYWmJrWkVNdkxiUFVzQnFmcURFdEF2Nm9zWWRxM1Zx?=
 =?utf-8?B?dVU1alNFbm52b254dUJNUXdhN2hYeCs0UVZYdTFYeWE4d3lDZUhyY2Z4bWNa?=
 =?utf-8?B?MXVLeWV3Zzh0a0NxcE9ua0pkK2NtMjRaTVNENXNjR2xEbGlCM01KdldBU2lE?=
 =?utf-8?B?U05DK2h1YVdCb3hTQjlhMHNnYUtPUFBVeVNsTXBGSU9DV29xS21hYWtURVJJ?=
 =?utf-8?B?NHpFVExpUWVtREd6cERvSTNRc1ZPRE4xVU4ybklPUWg5QVVMbWdDR2srdFJn?=
 =?utf-8?B?R0xKdDF5T0pIMTNiT25vekpYbFFmRzdaUDNMRXZ1bDdzZGZjTU0zOHJTQmRr?=
 =?utf-8?B?UFlRK0hsNzJiMTYrdXBVdWh3TkJoVFZaZHdha3NDbWtQMVpqVVlDVTJ1Witt?=
 =?utf-8?B?WTNpcEdTQVptRjVpNlhxVUIwRFNvY2YzMjlPRXp0L1EyOHFoNjQ2WnhtSndi?=
 =?utf-8?B?N3F4QmdtR2hXYjJaaGpjbnVnSTBXS2l6RGpRUUtJTDJCTnUwZjM3bjlCRnhZ?=
 =?utf-8?B?RjIycDBXZnovTktwUmFkV2RxZmtUdlZ2TGlQU3AzemlxaloxYlpsRWlqaUJr?=
 =?utf-8?B?aUlVd1VweWNESUlnQmZSdFB5SGdsSUpQN0N1TlpiZDdIcDV2NFpqQmxCK0xp?=
 =?utf-8?B?SzUwM2paMXNsOXZNZVNUSkJjSmc2N0p0NkNnNHR3YzZxYjRLbFByeEVJY2Yx?=
 =?utf-8?B?Y2NWQ3d3WjFTbG8vL2VMK2gra2trK2NuVlhuK2xVRTlWSXovYms5NWYvYU12?=
 =?utf-8?B?WGdaQ1ZXaU16YWk3N0xzaHRpV3A2UWo0MllKUzg5TS9HM0U5NHJoa05USkYw?=
 =?utf-8?B?RjNJNnU1VXJvelEzTkNLdUxkNzUvS0UxdzVLNnJpclRUc0pZZGJFZEFvNHVF?=
 =?utf-8?B?anJRWHVibGF5ZmlDVnhvaHdMbXpoTDhNQUorTlowTy96UGhyaDhIY3hFN2lZ?=
 =?utf-8?B?TVBOWUN2V0JqR1IxRC9JR0ZwTjd0VXcraU44cnlCejdiN0lycmVZQW93byt6?=
 =?utf-8?B?ODhnZlNkVG9uNWVJb20rbkM5aytWVXBXQ0JZWisvQUZxSmpTc2wwWjdabWl6?=
 =?utf-8?B?emV4TktHa1FCS0FNVitES09QejJMSW04UkcwNVU5VjQwMnpJWXVDcGlDQVhG?=
 =?utf-8?B?Z0FraURqeVRJSGk4QXE5cENlU2JrTVFVN09NYlZNaS8wdlpnSmdHNEhXNFIx?=
 =?utf-8?B?akJkbjdPOEtUSlFicm5hSEVyYnd3M1A0V3FMMjJxMWpuVHVUdzVXN1NyOC9t?=
 =?utf-8?B?ek4vOXIzaERWM2hIc2FJQUJMa1FNRTNpYnY1T1V0bDlKeWJXV3NsUDNKRnFX?=
 =?utf-8?B?dWFZY20rd1dFYU1CY3QvY2Q4dEdEYlRudTUwZmp4YkZWUy9ySnowMUNxQWFM?=
 =?utf-8?B?QVJkalJ1Q0FDKzFzcWxyVG5sSTJSWHRZMUtoOEdmVGorN0d1UmdONFI4Z1Iw?=
 =?utf-8?B?T3pLTzEweTVPdyt6VEUyMnE5UHNTaytMRGM0eElRTGJneW5HM2lkR0EycWdn?=
 =?utf-8?B?NE0vd1dXdVBnQzVpRFVZa0ZUc055MTlMSnUwa1RLUFFEQ3pnNGY2enVNOGti?=
 =?utf-8?B?R3FheXlzSUhjL3JtWGxMM0NwRWsrdDRMcnhIZFRocG5weEM3Tml1WS9kWlho?=
 =?utf-8?B?by8yWDc2cm1yM09HVEFDMmZFbW92UHQ5OGZkOHh0RGk0ZE00WVVMMm1tYUZ6?=
 =?utf-8?Q?By5lnY0tSnHzxhBpFINwGYpO1Sg/PGj/?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB6636.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S3JkcUFISzhEY1lscXhVQi9oN3cwQk5nSGhyQ0dQN21ZNkVxbjZhN3pkVWZZ?=
 =?utf-8?B?ZVdrT3E3Q0FGZllzMk1LYzFDbEp3ekUxS1pmM3ZZbzloSFQxV25RQjJmSS8z?=
 =?utf-8?B?THRRRGlwVnlvODBadThrdFlLVlpJM0RpWlZSb1lrSGZQUkRNVG9KU1pPVDdH?=
 =?utf-8?B?QUF4aG5hOXliYlZSbnlmVXQrTTdyWjVqcldLUXZ0S08rWjBNcnZrcXpIdXha?=
 =?utf-8?B?SUdhcVkvU1oreEMvbm1wT3BRc3pZRmlHVzZJMzBVWGF4ZG9OSEZ3T01PeWYv?=
 =?utf-8?B?d01DcmYrZ2RHN1VWMmxSMXEwMzQ4TEVXVHlSTVdna1Y0VThQdXRlbnIreEx5?=
 =?utf-8?B?bDBtMkhyZXUrWG10M2lGem9KeDhyMjNhb1RtMjNYNUFLZ2Y2emJPZWhNT3hT?=
 =?utf-8?B?d0JoV3QrK29VV0g1TmpKeGh1dENSS0ZaamFXRkRGYzhFMUZFMUJiRVNQT3k0?=
 =?utf-8?B?dVY5NG9kOEVlZ2dRTG1od3hKZjRDNURGWWd0QkhLTWVPMk9Nc3hGcTR6U25J?=
 =?utf-8?B?YnNGb3FvMUtTRUx1blJMYXBqU3FxbFF4OCt0aW1WYnQ0VU1sRlc1eHpyQyty?=
 =?utf-8?B?ZGNiancyOFVCQkJqN0kzR05CZGlGYU9KTDR2N1FVL1orU2x2ajRhQzl0L2F1?=
 =?utf-8?B?VlBIVGRMNnZISzdWc2VXTHI2U3ZCOHRMK05NSHREOUg3UHA4d3Y4ekQzZVlz?=
 =?utf-8?B?VVpRNnNSNzdYeU1kUTcvM2gzcWtnWExteUVRWUdzMTdWcWY2ZklEbDYzRU4y?=
 =?utf-8?B?bWFTQUZzRmxiQ3FFUUdkQyswNUduOGYzYityWVhHOVJMbVN3WnNqQkR6MHpv?=
 =?utf-8?B?V0dDeC9uaTFMdnNlZlRoODZuanUwc1JNZ1ZweXBia1UwUnZNUXJya1pTUTNo?=
 =?utf-8?B?RDJ2QXl5djdGNnBOaEZCd0dvdFlLYkxXdTdXV2xnY0NlMWNCMkZlR3RCcnJR?=
 =?utf-8?B?d1hIckM2b1BKb1ZWcmphRStWQU9VTjJ6bDBBbkRvRmdSc1U0cDlWWE5LNTJx?=
 =?utf-8?B?UHpkNENXb3BQaFFpQ20rVDdBSVlFT3hQQThiQ0lkMTR6c2FkczJwZ2poK25H?=
 =?utf-8?B?MkszV2pBdTNzMkhxUkZIVUJySC9DZmRIbXJQeVR1cStqR2hjLzBTaXU2UDR4?=
 =?utf-8?B?a0duSWJZZjd6S2Y4ZjVWUWJJb2NGaG9IMnhGb203RjZCVDBuaW9iK2YrYzVK?=
 =?utf-8?B?OFQ4OStoUVE1bk05MWwrMjdvdTlBd1ZBcWNTVXNFMDNsbGtvNUhQblVBbUhh?=
 =?utf-8?B?RDZoTjhuejZqcERPTS84a1ZhKy9OcWtiMEVlTkQ3S1QwaWpNWVMwUjZDelIz?=
 =?utf-8?B?ajY4S2creHRoelRGUU5CQ0hBWGhPb0p0RW1oUy8xZnY2eXJjZDFiZkt5L1FY?=
 =?utf-8?B?QXRIaGxWV1ZjbHl5MktONmFueFZCSEZPUk5hM2tJT21sdlFldkdublhjdEZu?=
 =?utf-8?B?MkVrNmxOSlVFd0xTNGVWUW9vZUp5QlZCRDlOSkgwbmVSbDZwUHU3L1VhRCtT?=
 =?utf-8?B?aTRHcStUU2FtdnUvOEtPNUplMlRqNFpOT1ZpbE1iZVZ4blQ3SnJqWjBNeTJQ?=
 =?utf-8?B?M0FxRDBKT09LWHhGLzgrSVVxY1VYYnl0SVRXakg2YWp5OXd5cW5ucHIvMXJO?=
 =?utf-8?B?YlJ6djhJdVUrZEIzUmlCYUJLckEzN2x2WTNWZzk5Uis3NnRzMXN4a3BkRkpt?=
 =?utf-8?B?UysrQldjQTlLcUhuRDJSeUFsYkpyZEIvbmt0bFdQVmtEU1ovTDJ5NWhTdFR1?=
 =?utf-8?B?a3VXUGZYLzlZNEp3Ukc2eEtSV0hOOFhUVEg5VGJjVjhhQ1BsV3pQYTRHM21T?=
 =?utf-8?B?ZURDQzBuKytBQ2xabXluNWVXQk5kdUNMOGVSZ3BKTlhyNkxYQ0M3REh5bzl2?=
 =?utf-8?B?L0h3MHFwbGtiRzlWWW9RWTJuQ0tFTVFkU2gzK01GUnhwcXFxYUtsZVVkalZE?=
 =?utf-8?B?SnR4am1PRGJRMWJZZUNTcWpXK0g4TDFWSC84Z29uc2p2ZUMvU3V5RWpJUzBh?=
 =?utf-8?B?Y0JzdFBIcjE2NUFmcmtEa09pcnc0UlA5bGJBTzVoenBNMDc2YVN5OGI0TUoy?=
 =?utf-8?B?cEsrSWI1dXhRd1grYjJlcU9NUEUxZmNMYkduem5CeEp5QThmKytEVVY0Wjha?=
 =?utf-8?B?UGJMVlpUZC9NVFh1YmZyYlR5K2x2emZtOGEzcjZ4S0crQ1ZHb2hXamFwbkl0?=
 =?utf-8?B?ckE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DCB148A67ADCEA4BA8477813CE345E35@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6636.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc3aa31-48b7-458a-2ffa-08dd3bc8fd61
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2025 16:14:18.6827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f9YtjGtdhSpk+aOnYCEgovTVPmvJ7PHXb4h2HoidLYF0KVFnr43cVAG26wHI/JI7cB9t0oklUvhe4beHmPTjlUrFD0ZRyTcnu6vHtZXBP0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6904
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_081432_031761_05EB6128 
X-CRM114-Status: GOOD (  18.38  )
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

T24gVGh1LCAyMDI1LTAxLTIzIGF0IDA4OjIxICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBPbiAyMy8wMS8yMDI1IDA3OjExLCBQYXVsLXBsIENo
ZW4gKOmZs+afj+mclikgd3JvdGU6DQo+ID4gDQo+ID4gSGkgS3J6eXN6dG9mDQo+ID4gDQo+ID4g
SSBob3BlIHRoaXMgZW1haWwgZmluZHMgeW91IHdlbGwuIEkgaGF2ZSBhIGNvdXBsZSBvZiBxdWVz
dGlvbnMNCj4gPiByZWdhcmRpbmcgdGhlIEVYRE1BIGNvbW1pdCBwYXRjaCBhbmQgZGVjb3VwbGlu
ZzoNCj4gPiANCj4gPiAxLiBXb3VsZCByZW1vdmluZyB0aGUgZXhhbXBsZSBmcm9tIHRoZSBFWERN
QSBjb21taXQgcGF0Y2ggYmUNCj4gPiBzdWZmaWNpZW50DQo+ID4gdG8gYWNoaWV2ZSBkZWNvdXBs
aW5nIGZvciBFWERNQSBZQU1MIGFuZCBNVEsgY2xvY2svcG93ZXIgaGVhZGVyPw0KPiANCj4gTm8N
Cj4gDQo+ID4gDQo+ID4gMi4gSWYgcmVtb3ZpbmcgdGhlIGV4YW1wbGUgZnJvbSB0aGUgRVhETUEg
WUFNTCBpcyBub3QgYWxsb3dlZCwgd2hhdA0KPiA+IGFsdGVybmF0aXZlIGNoYW5nZXMgY291bGQg
d2UgaW1wbGVtZW50IHRvIGFjaGlldmUgZGVjb3VwbGluZz8NCj4gDQo+IERvbid0IHVzZSB0aGUg
aGVhZGVyIGNvbnN0YW50cyBidXQganVzdCBzb21lIGZha2UgcGhhbmRsZS4NCj4gDQo+IA0KPiAN
Cj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0KSGkgS3J6eXN6dG9mLCANCg0KT25jZSBh
Z2FpbiwgdGhhbmtzIGZvciB0aGUgcmV2aWV3IGFuZCByZXBseS4gDQoNClNPIElmIHdlIGFwcGx5
IENoZW55dSdzIHN1Z2dlc3Rpb246DQoNCisgZXhhbXBsZToNCisJLXwNCg0KKwlzb2Mgew0KKw0K
KyAJCWRpc3Bfb3ZsMF9leGRtYTI6IGRtYS1jb250cm9sbGVyQDMyODUwMDAwIHsNCisJCWNvbXBh
dGlibGUgPSAibWVkaWF0ZWssbXQ4MTk2LWV4ZG1hIjsNCisJCXJlZyA9IDwwIDB4MzI4NTAwMDAg
MCAweDEwMDA+Ow0KKwkJY2xvY2tzID0gPDEzPjsNCisJCXBvd2VyLWRvbWFpbnMgPSA8MTI+Ow0K
KwkJbWVkaWF0ZWssbGFyYiA9IDw4OD47DQorCQlpb21tdXMgPSA8Jm1tX3NtbXUgMTQ0PjsNCisJ
CSNkbWEtY2VsbHMgPSA8MT47DQorICAgICAgICB9Ow0KKyAgICB9Ow0KDQpEb2VzIHRoaXMgd29y
ayBmb3IgZGVjb3VwbGluZz8NCg0KDQpCZXN0IFJlZ2FyZHMsDQoNClBhdWwNCg0KDQoNCg==

