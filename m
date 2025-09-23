Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739E2CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 02:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tkc/jU4EmBNaU4csRfxmwLEshvFXLHeuoH3vfumMQIs=; b=k4xdTUgIPt0UNkhgJpLTmzMIiZ
	Pc2cJoK/FEE2967b66thNfxbDjzHcXE2yd+1rfVpgBKkfs2NCmnW4pD5WsCMi7mbGs/NBpfpVotNE
	QB2t86VXghGZULQoNjA6HPzV3D/R6jOI647qUX9vqvDY8VeGO8R8BmgwKMl44C5Pi7RYEideF6zkj
	xEVUtmVg/hKU39Uy9jWCUN/j5fs4eZpFOq7LjYlzx+LVro7R065KpZybwdZnbX99V/Eu3xJOMb2c0
	IrA1BNHouVD3o8pbs/7sjoRH2IC+ViVuj75Rsu/M6DGcCA4Fof2krpEPzd5wRwIRcXRth1TlnA/dc
	uT9ATSCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0st5-0000000C9eh-1PeQ;
	Tue, 23 Sep 2025 02:36:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0st2-0000000C9dw-3uys;
	Tue, 23 Sep 2025 02:36:14 +0000
X-UUID: 0f10eb9e982611f0a52f393f94899d25-20250922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Tkc/jU4EmBNaU4csRfxmwLEshvFXLHeuoH3vfumMQIs=;
	b=GRUY6nK2yw+atZMNxF9GYvbT4hI2pzsBpk7e+PWpxSktwjDlFz/D7SqP8vlWghRuRg0CHt6WrfnVOj4CtSqJNWF+ifNqiBGiS3A16g6FHb3M+/fqN90j+f/q24OHmgdktoF/3zamQhwb4Qs17V7PvfSf4pjbvuaZNKhnxfCdYMY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:a134680e-4ba6-4bf2-9d9b-74ca81ea1216,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:1ca6b93,CLOUDID:233ebe21-c299-443d-bb51-d77d2f000e20,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,
	BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0f10eb9e982611f0a52f393f94899d25-20250922
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jjian.zhou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1575042542; Mon, 22 Sep 2025 19:36:07 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 23 Sep 2025 10:36:04 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Tue, 23 Sep 2025 10:36:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQLyCmgwabQ11P2malch+ZPK3GT61zO9WFvY+4bzB42Hda35Q0oKs4Sk8zbepa7Fh/p/3+CyqXeBLJSgob1Cf17+62lp35jMPGoy69kT+2IiE3SlCQlBrNKu4whqp/BMa+HiO4bGGC6HyQcZZOQUDB0Faw2Z6EsdK8BRJrI6JU5iEp5fuz4U3dQNaaUKnoxcfzANNXHCt2vaNLynK1zRBau+JPN8pS8FvcDT8lH85SIbZlJZyUbhCw/YR3Ohtxc4iC/MEtarD/62he9J/YH3MmtKbxoBtz+N5t5DePfo9j8IBLhPrskyLzYjRrEFagwiLJS7XlMcEzkXmGmTcduNQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tkc/jU4EmBNaU4csRfxmwLEshvFXLHeuoH3vfumMQIs=;
 b=pmhaRQen6SZYYh2G8lopQlBhrU5oXPTqa1zRXwOZobl/2tQx6yAPgq89a+YLUATAVvxHgxaWPhNVHMhErdn0Jhc5k1zWfS784i6i3I9ubUHtuBRcyhDzLVQWjnTDv/AyublHHL7wW0BQv0Dy4ZjexbVWe5MOgyA9FqJPV5eNnll0nF/FSkxbP12tOfVSjoZf0dNZzk31rzO44lSk6KonSiqQ7lcrssl2ej3bk2aKLkRCbyOM6jdsbmKqMkBi5T/IwcA7tyboGUyXHfafbd1g9g+TMKVTuY5otIj5MMfZKExoml2e++BLLhWqgdb8rcGN1IZIDP9HTm7SfUlG32XBiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tkc/jU4EmBNaU4csRfxmwLEshvFXLHeuoH3vfumMQIs=;
 b=e5TT8YCfkD3y37sZOxdGBF2aE3zHCTnaaPY3Lw4t3x1Hf44yoH4UNSAIUDGk6W4YHPn+WRR5V+hYFqceBi7RlsqeJqJmQXSHEh2Igx/Az4r4GNE7rmdomPefAhCp/vzVsslDn1tUGfBdL2X+3Rr8OU10ZGJEmb8GkzFKwLSG5Uo=
Received: from PSAPR03MB6363.apcprd03.prod.outlook.com (2603:1096:301:5f::10)
 by SE1PPFC86F9605A.apcprd03.prod.outlook.com (2603:1096:108:1::865) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 23 Sep
 2025 02:36:00 +0000
Received: from PSAPR03MB6363.apcprd03.prod.outlook.com
 ([fe80::eb73:91b9:5905:e89f]) by PSAPR03MB6363.apcprd03.prod.outlook.com
 ([fe80::eb73:91b9:5905:e89f%6]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 02:36:00 +0000
From: =?utf-8?B?SmppYW4gWmhvdSAo5ZGo5bu6KQ==?= <Jjian.Zhou@mediatek.com>
To: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
	"nicolas.frattaroli@collabora.com" <nicolas.frattaroli@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"wenst@chromium.org" <wenst@chromium.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "robh@kernel.org"
	<robh@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v5 2/2] mailbox: mediatek: Add mtk-vcp-mailbox driver
Thread-Topic: [PATCH v5 2/2] mailbox: mediatek: Add mtk-vcp-mailbox driver
Thread-Index: AQHcEwpW87Sc9bspPUqF1pf91CjDQbSZyAEAgACRkwCAAIY+AIAAKeQAgAIpV4CAAcjDAIAAYpcAgADhGgA=
Date: Tue, 23 Sep 2025 02:35:59 +0000
Message-ID: <eb9b0ea70abb09f45c50e88b6221948ae09be6f7.camel@mediatek.com>
References: <20250822021217.1598-1-jjian.zhou@mediatek.com>
	 <CABb+yY2Ay+KqviJvOQC8X8kfzJN6-fQT04A+TCJAkLnWx+XwZg@mail.gmail.com>
	 <a9dd348fd7df95ebd5ad9cc58d57b588a18ccc9d.camel@mediatek.com>
	 <13850137.uLZWGnKmhe@workhorse>
In-Reply-To: <13850137.uLZWGnKmhe@workhorse>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB6363:EE_|SE1PPFC86F9605A:EE_
x-ms-office365-filtering-correlation-id: 0021a134-e7f8-42c2-9c36-08ddfa49ee94
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014|38070700021|7053199007;
x-microsoft-antispam-message-info: =?utf-8?B?Sm5kMzBBcEQ3Y2lrOStDazhHL0dVYUlQVDgxbllpK0FKeTVqU2dMZVgveFZU?=
 =?utf-8?B?OVgyNGNiczM0L0VLRUw5ZDhtMmVMYkt6YzQ5T0JxSUk5SDZZRiswc2xEZHNP?=
 =?utf-8?B?S09va0hGWERWb001N1psSmtrSHFabTBjSHh1SE5tOVlZOFF2SWxNa3d2SE9H?=
 =?utf-8?B?ZVRydGs5c0FCcUI4OEhRdUVCS0NJNC9qTEpnK3ZZUXVrV2hTR1JzZ1VLSTdl?=
 =?utf-8?B?amgvQ1FEaEw1NDZEaWFhTW96cXd2cng5eHRaSmticTFidTMwQ2huRlpSV1NB?=
 =?utf-8?B?bDVhZVBDQU1nV0lvUmsyTlZwU0pLN09zVm94bzMrQzRzbklHUTFRVU1mN0k2?=
 =?utf-8?B?NDdlZmpGK0F0aThyMWRCbjhIQ0hpbDRVODU0R1FrZmhjUW44RktHajF2dEo0?=
 =?utf-8?B?SFI3ckJiK1RvSzlwS3RieVdLRXdsUG96NzFZNS9VKzh1OFd1ZzlZVVJ4WG5u?=
 =?utf-8?B?NFVCWHFTaFRxcCtGL1gyUTFmci91U3p0aXRsQmY3eUw5cmYvR3dRU0c5eDVN?=
 =?utf-8?B?eUF6MENkUkNtdmIvVUNIT1hEV0dUbWttengxOWdZb1pwOXk1ZldNT2R4VUpq?=
 =?utf-8?B?ODFrN0htYVZzckxnb1MrbGtGaXJmenhkY0ZYT1RtNHU3bklIRWpQWHFqOUpK?=
 =?utf-8?B?QmpzNlZ0Zi93UFpCUkNLWWQzQ01oeFRLSjYrMStOaWdoaW1pd2FOQ1AyS3dE?=
 =?utf-8?B?M2hHUDJPNW0rRDBBcTN2blFQc2hqTEtrV1N6bU50aTRvK242bHp2Z09kVEk5?=
 =?utf-8?B?SE05UENtVlcrbGFLRW9HWGU2NHRHT3AzYzZKcW4rckkzaFlDRldhVXlEVXJI?=
 =?utf-8?B?RlhSMHljdWxsREV3dHd0UHdQVGlPdnJ5cnlWV2M5cDhrU2ovNjFDdlNxbjFL?=
 =?utf-8?B?ZWRkUXhvSVp2WlBrWVRpZ0xOK1ZlbUIxeFo2NE1JdEpRRUcvTk1oVkZvZ0Uv?=
 =?utf-8?B?VC9kNHgxL3NzUzN1ZEh5a1A5QVZ3YmwvK3FGK1B6OHlGWkFBVCtPUWE3Z1RM?=
 =?utf-8?B?Wi9TblgwTlZ6UHBBL044V210ejNwZGppZXlVcUhMVFF6cWZLZUR1RWx5dHhu?=
 =?utf-8?B?SFhuVXN3QW9ROHJ6TG9qZURnTW41N3RXMGNpeUsxK0FiQytEdytZeXZpUkEw?=
 =?utf-8?B?WGtrYUVtenJJekRhcVdqWVhmRHBkQ2pObjBDTnJXanhaejAxdjhTb1c3ZGE2?=
 =?utf-8?B?TlpnSXpNdTVkdE1nVGI3NE4rM2tBRTNmOVp1UyswZnJOT2llSE1qZkxrWWhS?=
 =?utf-8?B?STlrckR1K2ZPcGFUYVpkSEJJdTUvU0c2NzBzcWg1S1ZlR2xocXBwS2pEc0xx?=
 =?utf-8?B?TTNnYjVTQUxwSDZSKzJNQW1zblhrYUw3dmp4NU9HTHFZYnY2eU10MjZPSmdw?=
 =?utf-8?B?NFZzU2FJMEp1QnVORUNRTG9sVXBjbHBxeUVqM0lLcHFkckRLTjNteVdLWkNn?=
 =?utf-8?B?ODF4a1pnN0JqOUovNDZZTlBRWUVKL1U5eVQ5WGFlZ3pKNWgrOU5kUEFmUFF5?=
 =?utf-8?B?REEwM3FMaU1Hdzc3TDBSYTY2TXI4a0Zta3VoRTZzUnExT2pMOFFQZEJubWxz?=
 =?utf-8?B?ZlVFdUR6WjFRNi9DR2tlMnJmTktRQnRTVm1rTXlLeW5HQU5Wdko1TEpya0g2?=
 =?utf-8?B?dGNuT0tTMTRMb3k1YTNQalNHQkROSytIS01xa2g5Rjk2QXdXQTVGQUxuUkdK?=
 =?utf-8?B?TGpxWVlNbHZ1azVhUDRxbW53bjVFbkdWcWlETVIwb0dYeXA2ekJla0x6Z3Ex?=
 =?utf-8?B?T0NvOS81eCtRRjJ6aFkxRU1QM0dCN2kySUNxME9VcG50NmRWSzZpNGI2ZUJa?=
 =?utf-8?B?RHFKUy9jOVFVU2xwVExJNHhwT3RNaUdHcVZUSG1uQUg0OS82S2Nta2VwdkE0?=
 =?utf-8?B?azRxYWJ3RXYySnQ0YlNUZkZTVnQxeTdGMWtnaXdHRTdFRGU1N1BlSW9xbVBm?=
 =?utf-8?B?WUF6TTIzQmVOMnVEUFNsM2RpU1J3V05vcGJQZkR5ckEwVml1Zm1uZklqMitD?=
 =?utf-8?Q?rI7oPmSJqQzrhyO35iD3oCHygfFmzA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB6363.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?KzdnRUl0TmtyUjhhcDJ2K2Fza1ptcG5QSEJVZGtvbnRWOFYzV1llc3VCNmNS?=
 =?utf-8?B?K0x6Q1E5anpQUnkxTWdBNXVIWTNMdS9Ra2hJTUxWQituS0N0d1dLTDJobk1w?=
 =?utf-8?B?OWlMblExUzlDVi9CeHAyc05jUUlqYUFaWmV1N0NsMEMvRXBSeHRBcFdwRXg2?=
 =?utf-8?B?RUk3MWRyZHAzRFJSaUF0ZlVvRzVxU0ExNGlGdHo0WEhkNUJmeDNKS0E0R21G?=
 =?utf-8?B?NUZnaEl3ZXB5d2ZVTEYyaTZyTndrZGd0OHhSbHkxaXV3YzRITVI4SVlVT0ta?=
 =?utf-8?B?NE1MWS9sTDQ2REJQR3hoNlBjQVJlR1JHZVc0ZnhVWFNsSzE5VmE0MTUxV29H?=
 =?utf-8?B?aDlRSk1lZkNXUUxROE1EVzJxK25RTUtQT214M25mV0oybjZySFR6RTZXMkVS?=
 =?utf-8?B?cTVYaTVYQno3MW8vak1oRHJxZnFSSlBBdEJPa1c2ZUVYLzFuR2Zxa2x3MUdj?=
 =?utf-8?B?c2h1Z2crd0s0dGNqRzlzNjk5bHBrVTFOVWRjeEdDMyt1SVVtRDV4dzFMQUl4?=
 =?utf-8?B?NHBkekxUdTlDNy9TKzQ0TFR2OXV5SmpiSDJFRURBRUtpYkJFZzVwK202YWlo?=
 =?utf-8?B?V2wzNXRNcE1YQmJoeUFoeUJ1eWZJTHJwTXB2UmRjSVg4cEZ4RmpmMTAvSTRa?=
 =?utf-8?B?V2xVYWRpNVdJVERYaWpVQnNXRjlGNFlhN1ZDbGQzcTduVnl4cnV6aTJ2ZG8w?=
 =?utf-8?B?SkZRQVc2ZDRkUC94ZnFHV0Y5dEpyRURONFJDWlMwYUI0UVJHOG1MSTZMN1Uv?=
 =?utf-8?B?dkNLM2p0UVEvNldZY1JrNiszWktLNGdpYUFGQkxReUhRSi85VGUvRG5iZG1J?=
 =?utf-8?B?UDYxQlZmd0FONktOK0FSS3JGcGJQdGlZa3pSc0VlODV0QUNEdzVYMmN4MnhI?=
 =?utf-8?B?ZE5ZUmhoSk9meW1HazhScWZ4cG8wbEJzblZtRmRHdUc1QVljbmN1cG9YQy9H?=
 =?utf-8?B?dzkrcW1LYSttZVFoWEQ1cHZGN0laTkJNNWVrWTF6cU52MFJHT2pOdnJOdE9O?=
 =?utf-8?B?WS9wQUw0R2Z6OVZnUnh2MFFEYmR2ZC9wWDQ0YUh0Mll4ZEJHd1E3cE5oTFNn?=
 =?utf-8?B?K0tVT000UFJVaER4bm5lR3JsczlRUm8wTlZPUHlOMzVES2V4VExQNUh5YmNT?=
 =?utf-8?B?U3NsTnA3MmhzblZ5Nm1HVEFPN3ZGc2FXdVdML2Rodnk5bTJMZXRCV2VGWHJm?=
 =?utf-8?B?WUdVM01uVXFpYzVtZHFHcFR3TS9La0xQL0VreWhyQ28yQUJHU05zTzB1OUZ5?=
 =?utf-8?B?cW1vQU5NRFZua3orNXhqWEJ0c3VmZStXeStsWjRURk1xMGxZWktrS0ZVR0hL?=
 =?utf-8?B?bXpza0F4bHR4RUtnM1pGR0pMeDhIMGNua2RmZkdxampxZFc1aElCQ0IxTzhE?=
 =?utf-8?B?QXkxT3ZHdEdvQzZGZ3NCeTNvVGF5RmJFNnNDWmZERU54WTI0blRRcnNxbFgr?=
 =?utf-8?B?NVRQRUlVMTg4R082cXZ0c3JvUU9nNDhuMDNVcDk0cXdaMHhxdEkvOUM3NjJw?=
 =?utf-8?B?UzBGTW1ISStTcTB3eEpDQlhmbU9ZeDVCTUdIeExpSEtzK3ZNSmp6MXc5d2tk?=
 =?utf-8?B?cElMN05wZ1JJZnJFcVFtRE9IUkpxaGs2SExGN0dDUFdhdkpQYVhwMVFYS1l1?=
 =?utf-8?B?cGJqaG9nQ1hDOElqd0NFQURwVWdtWXJtdEVhRTRVcjFBaU1zT05Uaks0Si9i?=
 =?utf-8?B?NVlCUzB1aVRaWUg3NWM5ZE13VittK3U4RFVabnR2aFZOTkpRMGN6U0gzUFhh?=
 =?utf-8?B?TzJUbWVZUlFOQWZHTzJUVHczOTJFK3N6MVZ5ZlRULzVlcFplaStKbEc0bTZC?=
 =?utf-8?B?bEcwaURseTFXZEdOUGJNWVpZUVBIMGdCYklYeXQ1VUt2OHZOdEJJY0crU3NX?=
 =?utf-8?B?TDQ0bGxXblFHWll0RzYzckRLUXVjZkVCN1BmRkRTVXFScEg2WSt4SHVZbWxi?=
 =?utf-8?B?ZmxsV1MzTXZaV29Dc244bW9ndWw4Y0xYN1Q3T2RQZHlEZzhFa2loQ0h6Zk5J?=
 =?utf-8?B?YWVVb0JaOVJUVWRPcFdnbDNObTVEajZoZkxJR1pSSW84NUQ1emowUU04aXMr?=
 =?utf-8?B?MUFOc2tWRHZjNURONVd0VlBwTG41RGpGYk15T25XdTRqWUFJTTh4Rk0xREVD?=
 =?utf-8?B?dThWWWU2cHpVR3hwYUE0VnB5OThuSzB1YXZWNStPVjBTOXNaRWFFNGhTZC9Z?=
 =?utf-8?B?cmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3EDE9FFD4B0B474D9B83494C5C3E8A17@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB6363.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0021a134-e7f8-42c2-9c36-08ddfa49ee94
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2025 02:35:59.8691
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uueRBSxyzH4tbnS8K1ZV10bL6y39aEKY2/xj5EbAFhFk38qS1LgroxiRrBxeOSYfSwD97e3o9q0ncIzdTn4gAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPFC86F9605A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_193612_997571_74A454E0 
X-CRM114-Status: GOOD (  21.02  )
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

T24gTW9uLCAyMDI1LTA5LTIyIGF0IDE1OjEwICswMjAwLCBOaWNvbGFzIEZyYXR0YXJvbGkgd3Jv
dGU6DQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVu
IGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhl
IGNvbnRlbnQuDQo+IA0KPiANCj4gT24gTW9uZGF5LCAyMiBTZXB0ZW1iZXIgMjAyNSAwOToxNzoy
NyBDZW50cmFsIEV1cm9wZWFuIFN1bW1lciBUaW1lDQo+IEpqaWFuIFpob3UgKOWRqOW7uikgd3Jv
dGU6DQo+ID4gT24gU2F0LCAyMDI1LTA5LTIwIGF0IDIzOjAyIC0wNTAwLCBKYXNzaSBCcmFyIHdy
b3RlOg0KPiA+ID4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMNCj4gPiA+IHVudGlsDQo+ID4gPiB5b3UgaGF2ZSB2ZXJpZmllZCB0
aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiA+ID4gDQo+ID4gPiANCj4gPiA+IE9uIEZyaSwg
U2VwIDE5LCAyMDI1IGF0IDI6MDLigK9QTSBOaWNvbGFzIEZyYXR0YXJvbGkNCj4gPiA+IDxuaWNv
bGFzLmZyYXR0YXJvbGlAY29sbGFib3JhLmNvbT4gd3JvdGU6DQo+ID4gPiA+IA0KPiA+ID4gPiBP
biBGcmlkYXksIDE5IFNlcHRlbWJlciAyMDI1IDE4OjMyOjEyIENlbnRyYWwgRXVyb3BlYW4gU3Vt
bWVyDQo+ID4gPiA+IFRpbWUNCj4gPiA+ID4gSmFzc2kgQnJhciB3cm90ZToNCj4gPiA+ID4gPiBP
biBGcmksIFNlcCAxOSwgMjAyNSBhdCAzOjMx4oCvQU0gQ2hlbi1ZdSBUc2FpIDwNCj4gPiA+ID4g
PiB3ZW5zdEBjaHJvbWl1bS5vcmc+DQo+ID4gPiA+ID4gd3JvdGU6DQo+ID4gPiA+ID4gPiANCj4g
PiA+ID4gPiA+IE9uIEZyaSwgU2VwIDE5LCAyMDI1IGF0IDc6NTDigK9BTSBKYXNzaSBCcmFyIDwN
Cj4gPiA+ID4gPiA+IGphc3Npc2luZ2hicmFyQGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4gPiA+ID4g
PiA+IA0KPiA+ID4gPiA+ID4gPiBPbiBUaHUsIEF1ZyAyMSwgMjAyNSBhdCA5OjEy4oCvUE0gSmpp
YW4gWmhvdSA8DQo+ID4gPiA+ID4gPiA+IGpqaWFuLnpob3VAbWVkaWF0ZWsuY29tPiB3cm90ZToN
Cj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IC4uLi4uDQo+ID4gPiA+ID4gPiA+IA0KPiA+
ID4gPiA+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ID4gPiA+ID4gPiA+ID4g
KyNpbmNsdWRlIDxsaW51eC9vZi5oPg0KPiA+ID4gPiA+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgv
cGxhdGZvcm1fZGV2aWNlLmg+DQo+ID4gPiA+ID4gPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9zbGFi
Lmg+DQo+ID4gPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gPiA+ICtzdHJ1Y3QgbXRrX3ZjcF9t
Ym94X3ByaXYgew0KPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gTWF5YmUgJ210a192Y3Bf
bWJveCcgaXMgYSBtb3JlIGFwcHJvcHJpYXRlIG5hbWUgPw0KPiA+ID4gPiA+ID4gPiANCj4gPiA+
ID4gPiA+ID4gPiArICAgICAgIHZvaWQgX19pb21lbSAqYmFzZTsNCj4gPiA+ID4gPiA+ID4gPiAr
ICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldjsNCj4gPiA+ID4gPiA+ID4gPiArICAgICAgIHN0cnVj
dCBtYm94X2NvbnRyb2xsZXIgbWJveDsNCj4gPiA+ID4gPiA+ID4gPiArICAgICAgIGNvbnN0IHN0
cnVjdCBtdGtfdmNwX21ib3hfY2ZnICpjZmc7DQo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICBzdHJ1
Y3QgbXRrX2lwaV9pbmZvIGlwaV9yZWN2Ow0KPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4g
TWF5YmUgYWxzbyBoYXZlICJzdHJ1Y3QgbWJveF9jaGFuIGNoYW5bMV07ICIgc28gdGhhdCB5b3UN
Cj4gPiA+ID4gPiA+ID4gZG9uJ3QgaGF2ZSB0bw0KPiA+ID4gPiA+ID4gPiBhbGxvY2F0ZSBvbmUg
ZHVyaW5nIHRoZSBwcm9iZS4NCj4gPiA+ID4gPiA+ID4gQWxzbyBpZiB5b3UgaGF2ZSAgInN0cnVj
dCBtYm94X2NvbnRyb2xsZXIgbWJveDsiIGFzIHRoZQ0KPiA+ID4gPiA+ID4gPiBmaXJzdA0KPiA+
ID4gPiA+ID4gPiBtZW1iZXIsDQo+ID4gPiA+ID4gPiA+IHlvdSBjb3VsZCBzaW1wbHkgdHlwZWNh
c3QgdGhhdCB0byBnZXQgdGhpcyBzdHJ1Y3R1cmUuDQo+ID4gPiA+ID4gPiA+IFNvbWV0aGluZyBs
aWtlICJzdHJ1Y3QgbXBmc19tYm94IiBpbiBtYWlsYm94LW1wZnMuYw0KPiA+ID4gPiA+ID4gDQo+
ID4gPiA+ID4gPiBJIHJlYWQgc29tZXdoZXJlIHRoYXQgdGhpcyB3YXkgb2Ygc3ViY2xhc3Npbmcg
aXMgbm90DQo+ID4gPiA+ID4gPiByZWNvbW1lbmRlZC4NCj4gPiA+ID4gPiA+IEluc3RlYWQgdGhl
IGJhc2UgY2xhc3Mgc2hvdWxkIGV4cGxpY2l0bHkgbm90IGJlIHRoZSBmaXJzdA0KPiA+ID4gPiA+
ID4gbWVtYmVyLg0KPiA+ID4gPiA+ID4gQW5kIHRoZW4gY29udGFpbmVyX29mKCkgc2hvdWxkIGJl
IHVzZWQuDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IEkgZG9uJ3QgcmVtZW1iZXIgd2hlcmUg
SSByZWFkIHRoaXMgdGhvdWdoLiBCdXQgSSB0aGluayB0aGUNCj4gPiA+ID4gPiA+IGV4cGxpY2l0
DQo+ID4gPiA+ID4gPiBjb250YWluZXJfb2YoKSBpcyBlYXNpZXIgZm9yIHVuZGVyc3RhbmRpbmcg
dGhlIGludGVudC4NCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IEFuZCBob3cg
ZG9lcyBjb250YWluZXJfb2YoKSB3b3JrID8gOikNCj4gPiA+ID4gPiB0eXBjYXN0aW5nIHRoZSBm
aXJzdCBtZW1iZXIgdG8gaXRzIHBhcmVudCBpcyB0aGUgc2ltcGxlc3QNCj4gPiA+ID4gPiBmb3Jt
IG9mDQo+ID4gPiA+ID4gY29udGFpbmVyX29mLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IC1qDQo+
ID4gPiA+ID4gDQo+ID4gPiA+ID4gDQo+ID4gPiA+IA0KPiA+ID4gPiBXaGljaCBpcyB3aHkgaXQn
cyBjb21wbGV0ZWx5IGVxdWl2YWxlbnQgYW5kIHNpbmNlIGNvZGUgaXMNCj4gPiA+ID4gc3VwcG9z
ZWQNCj4gPiA+ID4gdG8gY29tbXVuaWNhdGUgbWVhbmluZyB0byBodW1hbnMsIGNvbnRhaW5lcl9v
ZiBzaG91bGQgYmUgdXNlZC4NCj4gPiA+ID4gDQo+ID4gPiANCj4gPiA+IE5vYm9keSBpcyBzdWdn
ZXN0aW5nIHR5cGVjYXN0aW5nIGNmZywgZGV2IG9yIGFueXRoaW5nIGVsc2UuDQo+ID4gPiBUeXBl
Y2FzdGluZyBiZXR3ZWVuIG1haWxib3ggY29udHJvbGxlcnMgaXMgZmluZSBhbmQgYXJndWFibHkN
Cj4gPiA+IGVhc2llcg0KPiA+ID4gb24NCj4gPiA+IHRoZSBleWVzIHRoYW4gdXNpbmcgYSBjb250
YWluZXJfb2YuDQo+ID4gPiANCj4gPiA+IC1qDQo+ID4gDQo+ID4gT0suIEhvdyBhYm91dDoNCj4g
PiBzdHJ1Y3QgbXRrX3ZjcF9tYm94ICpwcml2ID0gKHN0cnVjdCBtdGtfdmNwX21ib3ggKiljaGFu
LQ0KPiA+ID4gY29uX3ByaXY7DQo+ID4gDQo+ID4gVGhhbmtzLg0KPiA+IA0KPiANCj4gQW4gZXhw
bGljaXQgY2FzdCB3b3VsZCBiZSB3b3JzZSwgYXMgYXQgdGhhdCBwb2ludCB5b3UncmUgdGVsbGlu
Zw0KPiBDIHRvIGNvbXBsZXRlbHkgaWdub3JlIGFueSBzZW1ibGFuY2Ugb2YgYSB0eXBlIHN5c3Rl
bSBpdCBoYXMuDQo+IA0KPiANCj4gDQogICAgIHN0cnVjdCBtdGtfdmNwX21ib3ggKnByaXY7IA0K
ICAgICBwcml2LT5kZXYgPSBkZXY7DQogICAgIHByaXYtPmNoYW5zWzBdLmNvbl9wcml2ID0gcHJp
djsNClRoZSB0eXBlIG9mIGNvbl9wcml2IGlzICJ2b2lkICoiLiANCldvdWxkIHRoZSBjb252ZXJz
aW9uIG1lbnRpb25lZCBhYm92ZSBhbHNvIGhhdmUgdGhlIGlzc3VlIHlvdSBtZW50aW9uZWQ/DQoN
ClRoYW5rcy4NCg0KDQoNCg==

