Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5762CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 03:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LePEsTRsGCVRKoX6Ftiz0mWWpfyqjSShlJ8n68rBlSI=; b=d4Ir7Z5hj9AA1ugfSAYSD4LdtZ
	VJlJk9jo9uclR1DMyRVTEBe5O5B/UCpdQgYOPQ+QXApw40QWqLV1qheyHjcCa8+rC+tTCqrczKHSZ
	3pYXZ/Oderk1dCITjabB0eEVqZiguY9PW3rGscJlhzMwN+XC7NcA255YsoLHz2pZGx1AhuZNrC/YO
	NZi0HoCSIxfSE8Qq8buUbLIers9B9CryuLfnZWkQx+OHDAO0X/4y+UPyNAcpTLn+RDQqqGyuwoglF
	G6YgKAiQfwya9ztgSLYQNpJ9xWn0w+FAD6OCraEkxX9DYdN0pv1gkmrtuJA5PTQuRG42NOQBQhBGn
	3oNHusOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ETL-00000003LVW-0wJz;
	Thu, 16 Oct 2025 03:16:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ETF-00000003LUo-10g4;
	Thu, 16 Oct 2025 03:16:09 +0000
X-UUID: 70ff54b0aa3e11f0a52f393f94899d25-20251015
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=LePEsTRsGCVRKoX6Ftiz0mWWpfyqjSShlJ8n68rBlSI=;
	b=QwiibFHO3SOm/cW3Aprt49+FmQlDUzu7/GO6VxeJvPrPwkaeCe1nhZ4F/7EUq7mbRTGQY8sh7oF/m5qLsS2NXBUEZewFrLk+7wJIvaPTohw6+C9/SaFtRkCSwN0AjWn9fQThmo0Uwmqt82sbSlbdBE2pLSIqtjXaB5v6gZauLBI=;
X-CID-CACHE: Type:Local,Time:202510151959-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:1dbb7397-5b33-43b9-a3b2-0920244f5e99,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:33591c51-c509-4cf3-8dc0-fcdaad49a6d3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:99|1,File:130,RT:nil,Bulk:nil,QS:n
	il,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC
	:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 70ff54b0aa3e11f0a52f393f94899d25-20251015
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1768182167; Wed, 15 Oct 2025 20:16:00 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 16 Oct 2025 11:15:58 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Thu, 16 Oct 2025 11:15:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yB0yyLIp2fZU/3iK9TqJO1E7NFHDJGo//u0b7T7GgRam6wosNGem4BXFachPOOQbxyWoDOzYf1MDfrkg1gBSnQA+hhHr6kO2aknSbepVQ436NtO3JItY04AUR06UaXaxUklRVJyrZPuHubKmjhjIZtJmSU7HX59O5muVGa/MfFc1cYeh+rWFH2LP6pe1fHzmOyayOVCs3r/22p3KAVYhK1eVGRLrCjNOHf/RD/uosdw03g6LLnU1HlHhEdqzOdWolpO4bomhTgVVhDaKvZbwtPoaVA0U15t/RhcDCj4lnhNkSEy9xR4CsO5ruzRwvOY3pUPtOJ+anSIS94Kz15WaUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LePEsTRsGCVRKoX6Ftiz0mWWpfyqjSShlJ8n68rBlSI=;
 b=Yf36lEyG4UBr+ydsiJlIfaZ9Nab1Om3PhT/YY9wgag61m8UcUuna3sgVZjUgu/Wl0hvDyJKiKV/ljhDB0dkHcnUy4wtZD+92Fk+btm+yZX7okl9uRmGcAeZp7IAO3ToiabWCSDHCs+tD7hM4ZUI216pLdsIhK0oxErufyAzZGF+Wp+tLHVdpda9M8icNOdn0Yf+XKNHcfkXk2HoSfz4X12al4CmGl7Sq9dkC5DnSrXq4PZQU6XJYBiWg2xsQBrMb1Cjo+pwMOIQymV8pyiAKxFicKSEZkPOnmnj7Ngp858e6wj8OPfLuerPk+A9NIgxz9v1rRvB9fE38TTQYgqBBTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LePEsTRsGCVRKoX6Ftiz0mWWpfyqjSShlJ8n68rBlSI=;
 b=o5RM46wvNXrakqDUPgdBox98sFouyAdxgVANQea91AgZ5yWiJiqcW5A/txgvsAOZXpMpXzsSzFt5Qr/hv/VDn1ITmBNVGVYc+zyqOmczijh/FG25BMTjLCYd1Zt5Arkh60tWwj+mKSMv/SSTzTy+ej4TSYtFNmAIMMfMxwdrSX0=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by TYZPR03MB6599.apcprd03.prod.outlook.com (2603:1096:400:1fd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.14; Thu, 16 Oct
 2025 03:15:53 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%6]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 03:15:53 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: "chu.stanley@gmail.com" <chu.stanley@gmail.com>, "robh@kernel.org"
	<robh@kernel.org>, =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?=
	<Chunfeng.Yun@mediatek.com>, =?utf-8?B?U3RhbmxleSBDaHUgKOacseWOn+mZnik=?=
	<stanley.chu@mediatek.com>, "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>, "kishon@kernel.org"
	<kishon@kernel.org>, "bvanassche@acm.org" <bvanassche@acm.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"nicolas.frattaroli@collabora.com" <nicolas.frattaroli@collabora.com>,
	"vkoul@kernel.org" <vkoul@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "avri.altman@wdc.com" <avri.altman@wdc.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>
CC: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, Louis-Alexis Eyraud
	<louisalexis.eyraud@collabora.com>, "kernel@collabora.com"
	<kernel@collabora.com>
Subject: Re: [PATCH 1/5] dt-bindings: ufs: mediatek,ufs: Add mt8196-ufshci
 variant
Thread-Topic: [PATCH 1/5] dt-bindings: ufs: mediatek,ufs: Add mt8196-ufshci
 variant
Thread-Index: AQHcPR1fV3Js8w3WyEyEMbLOviTe6bTEF5cAgAAEioA=
Date: Thu, 16 Oct 2025 03:15:53 +0000
Message-ID: <f6a52923b9e35dde9e3cbae3f0479febe10f8af9.camel@mediatek.com>
References: <20251014-mt8196-ufs-v1-0-195dceb83bc8@collabora.com>
	 <20251014-mt8196-ufs-v1-1-195dceb83bc8@collabora.com>
	 <1948598d44a460349757b52fb580eac731ced632.camel@mediatek.com>
In-Reply-To: <1948598d44a460349757b52fb580eac731ced632.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|TYZPR03MB6599:EE_
x-ms-office365-filtering-correlation-id: 83cbd4a7-39ca-4b59-3c64-08de0c6250eb
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?WDBoeWhjbkJ0R1UrMk9iYUxyN3RyaXIxY1VyTGhidGVDdnNGV1A0UG5ycmxs?=
 =?utf-8?B?a3E5WlQvNHUveDMxR1NVTkdVUTNZTytNQU0vOHFCTXNjcW1NQUhGM0hxWHVa?=
 =?utf-8?B?SFZWZ0dyK21zU0RkaUpmVVliR3IzYmRsNEtSRnU1a1p6SnlPSG9CdHlqZmdX?=
 =?utf-8?B?NTFxeWxVbHVVdkFJOWJtQ1NUd2kya3pHNHg5Mld6cTR0bkpLQXZ4cmoxckdj?=
 =?utf-8?B?SE45eEFqeWZBUVlXR2JrNWdtZUYwaGZQeGc0WFUvcExZMUxkWGM1dnlVKzhq?=
 =?utf-8?B?OTRMSzR5OXB2aG1UankwZjRoVGIxRUVUMjdUSlp0QzBIdzg1WldYay85THlj?=
 =?utf-8?B?QkFNejJWU1hGMm03UEFFU2hOdncrVTNaOWVmNHpPRnlzZk9oNllGZnJod29N?=
 =?utf-8?B?RGIxTGo4eWlDZUdpWlVIdmw2c01kZ1Vwb0tTcThtU2dSTDRsUG9wTVM4b3pv?=
 =?utf-8?B?NXZPaHc5UTl5UWpuZjhNRkFwQVJacjQwM2M3ZC9CM01FdjhyWGMwTnFrblQz?=
 =?utf-8?B?bkNSZ2FtYU5lMXFWSmc2cnpBRXU0R2pweDIzeTFVeG0wbjVXakZ0YVY3aHY0?=
 =?utf-8?B?Ri85cjUvSDJUSWYyeDA2b1c4WlBjd0pFYlh4VXNlREtPK1ZCTzR1ckpQeVJs?=
 =?utf-8?B?ZlhteEF1NHpQakFWMklybTlNVkQ2d1lCK0tzRXFPdzViS1NqeWU1VTBoR3Uw?=
 =?utf-8?B?bGVMQmlRS0VKSmRiWU9tMEdjblRwRzZLYlhNNDh3SE9KRWdDRFQ1a044bkM2?=
 =?utf-8?B?TjdYdlZSQ1J3aVN2bmRndEoxM2xDYU9rMUdvaDJGM21QT3JESVNpcmkyUkto?=
 =?utf-8?B?ZnIySlJ6bzN0Wlp4UkhWbldDL0krSXRGdDFxaEFmbVZLUjU2MU0xZ096VUV4?=
 =?utf-8?B?NzltTW5WSHY2VE9GN096YTM3bXM5QVllUW9DUHByc0JVRVVVWHk4cGNERWRO?=
 =?utf-8?B?Y0xzcG1UaWdISndEYlkweHppTFlPdWM5RTVWb2h4dVJmNGh2NGVpbVF2R0RV?=
 =?utf-8?B?WU5aZkw4Y28wcnJWV1BZV0FmaGFDN3BvWSsyRGludEhiNlJ2VmNsa1VGTXQr?=
 =?utf-8?B?azZiQ0pjUDVWR1FDR3FJSzdiRXBlbDZwS0pGNlR3K1ROMVVobTgxQ0lQdjVs?=
 =?utf-8?B?a3pSTnRURkpSWjdYclVnNm1hS1ptOTlTbnRsRVdjMWNYRHFhU3Q2UmhMZDQz?=
 =?utf-8?B?ejlCNGRsdWRXUzFOSWtUeStDblN5RzN1UzZxOEtYSHVod1EvNlNqN1Z5c0pK?=
 =?utf-8?B?b3hoU0h1LzAwbG10Q2hpUHkxY01PVldyQXQ0ZjlHa2J3dzJ5Yms0YXpjcUk5?=
 =?utf-8?B?TjdIMDExdUNrT21KWXBkWnBLQnMydmtGblVZQ1RHUExjMjUyWUFwVmp2Qlg2?=
 =?utf-8?B?bWx2a2JnRjU5K080aldvZlF4TjBOMVU0NnltNjlQdzFES043YWkyZTE5VUdI?=
 =?utf-8?B?cUlkcmNIaUV6VGZBQ28xODlXUFpLWjBZYnNtRStjb0o4RXhNejU5bTUvVE5h?=
 =?utf-8?B?ckdzNjdJVWptcGoyMUxRRmg1b1BVQVNoa2FZNnUrUjZBN3N6UkZEU2JDb0Zp?=
 =?utf-8?B?MzR5NU9PcEY3YWJBaGg5SS9CRHVnRGc0MnNNNGRhL09Yenp3aW05UzNrdXB1?=
 =?utf-8?B?ak4wYSs5YmkyYk1BVTBqMC83MFBnVVh6RFJhd3lWY1JvZnBXYlpta3VNb0xw?=
 =?utf-8?B?S20vZThORCtxMEJGUERIQnRWK3ZkVG9NSm1vdFlUdWNXOTl0elNsVG16UlJh?=
 =?utf-8?B?SGlCUThTWVkvMk10WHEvSllEUFQ3dFJuOWZXb0pnYjRUcUZXL3AxbFJHYmE3?=
 =?utf-8?B?UC82aEtLU0x5NjBYdS94YjNoT2I1WlI1NnhYU0w1ZmVZZ293OTVwbG5sMGda?=
 =?utf-8?B?dGxsV002SzY2VXR5Q3dhczIrdWFsNThGcllsWkxWUmdOWUFjUldLaThXU1gw?=
 =?utf-8?B?bnNBK3J5aVhuNHNNZjRHTDlvNndHNEhQUS8xZHI4dWhkYm1HNHpjUWxtQ0RQ?=
 =?utf-8?Q?/h5Aa+VraqnGzBf5OnEh9yfiiK4Xm0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dTNsTTYybW1uZ1NBWTJvQlBtMHkwY2k5bnJhQXFFTzVLb3ZHNlVncGJrLysr?=
 =?utf-8?B?QU0zVG14L1EyM1p6cEZUcVk5SW9KaU9PbFFjNXlyZDhyc3FKMHBBUjZQako5?=
 =?utf-8?B?MlpKYnpPUXlGdzlsY0Y1czM1QlFPYTBmTXhGeGRPMHhqMllxd0VMaTRHQkpp?=
 =?utf-8?B?MnZac01BSTIxSWQ4T1dmR2c5eXJGMDJtUUc3azdmQ0FjajJOZ0tzeGpqaVNU?=
 =?utf-8?B?QlJLZUE1TEtVa1lZTGtnZ1owZWVZbWp6b0t6UE9vOC92SU8rejlZbUFxa2E3?=
 =?utf-8?B?cVFZUjVWNTlyK0h2VkUvNVV6d0tTN2RHUlMwRlNyQytsZktXbmluOVBMOWxn?=
 =?utf-8?B?QkVQSDhsb1BNNzBXUEg3ZUJRZWJwMnl1bHUzQ25EK2lIQXF3QWg0c1p5YXNs?=
 =?utf-8?B?ejFWaU5scmovM3dma3BPY1RndjRNcEdXemIwWEdtQnY4SkphdTluY21mVXM3?=
 =?utf-8?B?KzIwam9pQW84R0RheXdQRFpyTVQyeURDYzVXdXlPTlFLSmoxZS8wdFJCRWxO?=
 =?utf-8?B?cS8wTkwxSFFZVkgwMGNCb1lWYlNIZ25MV0lwRGg0b0Z5TE5BMUx3VXdYMmh6?=
 =?utf-8?B?T0U1RWZwSGlUNDFXb0grQWMxaUNJZHZDU0lQN0Z5cDEvcm05SUhLMzVBcE9t?=
 =?utf-8?B?d0hwZ0ZuTWxmYWhZelR6RGhUbGhlMkNDK2VaOWQ1cS9pUXFZK0hQaUd0dGJ1?=
 =?utf-8?B?YU5hQlMzRDJmSGtqejNVaC9rZVpZT0UrZUxVUXBsUnZsWDNaOE9IakxuSGps?=
 =?utf-8?B?WlFac2c3V05qOWdXeGdhVGxhb3ZYbXBGVGlSU1dBSklFYW1TWmx3cXlCTGlO?=
 =?utf-8?B?alJGWkJFTEtSQUZzcmZuY1k3WVhiR3hZNmNHM1Y2Q24vOElmS3hjN2J5RDlF?=
 =?utf-8?B?Yzg4T1pGVk0zT1pINml5VGJJUXVJSnNzMStVcGJTNTl2U3dhUmVYR3FwWXQ5?=
 =?utf-8?B?d0JsTUJIZEgrN3Q5a2o1ZHZjd3BTNllEWkFYVzFtZ3lHYyszb29KenRHV0Yv?=
 =?utf-8?B?ZXFtMDlhUlZsdHhIUCthR2JZT25GNlRLZzBUSUxTVi9WVVJsNkMwTTlEcFhG?=
 =?utf-8?B?T2drejFGKzFlbFRCMmpFM2I5TmRiVDdDNUlmWXh6V1hHQng5UnlNRVBPeW52?=
 =?utf-8?B?cEtoTDE1dTk3d1JYckw1MlVPODhEZkZtWitBTGxVUlRZL2ZuMFdUTWovakov?=
 =?utf-8?B?a3E3d1BNZyt6RFF0UnZ2bFl3RVhvQ1FLRHE0NytOWmpuMHE4cTI1UUd5K042?=
 =?utf-8?B?TGZjT25Ia2JOR1pJN2QrRTVwdlZjQWoySjVQS2JjQmZ1SWtiZzFyN0Nib1l3?=
 =?utf-8?B?WS9NSlYyaElBVWJYd1E4Y2dOclBIeFU1bGVXZTNiZFpSUUppc2FZVWZFNm5q?=
 =?utf-8?B?cURwM3Jxbk1VVjdaZXp5YlgwaUtRTzAyTXZpSjhyOHFpa3BqdUVYYnJRMWlO?=
 =?utf-8?B?aFhiSnYraGN3UUphVGdDVGJLVGs4M3N0TXRRbFBRQi9PK1AzemdXaU8rbUdj?=
 =?utf-8?B?MGE1RTk3cHZaaTVIYXloZld1SXVxUjgvcVJuWjZ2a09KYlEzZlgvclA4bXkr?=
 =?utf-8?B?RFJ4L1l1S0xiV0szRXNzV0lOdDRxRjFxSjhrMURENFNpMmRST202OXIveFFH?=
 =?utf-8?B?cEtsS08rMWRSY1dUQmxoTXJvaXpKcldCOHpxT0NYbVlUZUZrU2Q1aCthQXNY?=
 =?utf-8?B?SmJPdGp3a1pYVEZZakZTRTMrZDB1cTgweXA5VklyUUFRMFRJMll6SFdGaTE5?=
 =?utf-8?B?U2RqamFDL3VGTlJTbjFabUVNaW9IR0VjWndrem9QeHBiVGdLaXdqVnhZMkEr?=
 =?utf-8?B?SkRTczJtRktuc2p4V3hjTDBmVCtCL3BkVjhrY0VEWFRsQlNzdVBpdE9uZ1JB?=
 =?utf-8?B?SnF2MnJHQVB5eDZpc2VDODRUR3hocXlIZ2E3VUxUNEhjRUpWemh5bmxVeS8v?=
 =?utf-8?B?L1k0T2VxY0JwY0ZjMVhRaE55OXY5eGFxMDdjZGo0NHg0YjJxWTJldzZwUEY2?=
 =?utf-8?B?VVc0SHA0YStaeGJKL0Q0UXRHUEpqczY2TytTZ2RIczYvT2NnUWkzTGJnWHZn?=
 =?utf-8?B?K3VIYzNjVW94NGV5NTY4YzBMdmFZWkx4WVhGeFhOR0R5L1hHUTdMZ2FjZEow?=
 =?utf-8?B?ajJ3a2xKU2w5UHAwZTNiZWxHanlyN05ta0NGYVNOQjN4YWJlOFdMcVk3YzRQ?=
 =?utf-8?B?L2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ACBC94A564E75A45B9D43E42A6AA2207@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83cbd4a7-39ca-4b59-3c64-08de0c6250eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2025 03:15:53.6506
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wf6AvBloO7XFwWzCb7y4nKG7vV3zjkPsP3F9m/8JQjmc2XNjNiANLiV++WjMuYdVuKHop9Lmrn5RFwgtTbiEyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6599
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_201605_763163_F1344186 
X-CRM114-Status: UNSURE (   9.99  )
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

T24gVGh1LCAyMDI1LTEwLTE2IGF0IDEwOjU5ICswODAwLCBwZXRlci53YW5nIHdyb3RlOg0KPiBI
aSwgTmljb2xhcywNCj4gDQo+IFRoZSBtYXhpbXVtIHZhbHVlIHNob3VsZCBiZSA0LCBhcyB0aGVy
ZSBtYXkgYmUgYW4gbXBoeV9yZXNldC4NCj4gRm9yIHJlZmVyZW5jZSwgcGxlYXNlIHNlZToNCj4g
aHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTcuMS9zb3VyY2UvZHJpdmVycy91
ZnMvaG9zdC91ZnMtbWVkaWF0ZWsuYyNMMjExDQo+IA0KPiA+IA0KPiA+ICvCoMKgwqDCoMKgwqDC
oCByZXNldC1uYW1lczoNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgIGl0ZW1zOg0KPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC0gY29uc3Q6IHVuaXByb19yc3QNCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAtIGNvbnN0OiBjcnlwdG9fcnN0DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLSBjb25zdDogaGNpX3JzdA0KPiA+IA0KPiANCj4gQWRkIG1waHlfcmVzZXQgdG9vLg0KPiAN
Cj4gDQo+IFRoYW5rcw0KPiBQZXRlcg0KDQpIaSwgTmljb2xhcywNCg0KUGxlYXNlIGlnbm9yZSB0
aGlzIGVtYWlsLCBhcyBJIG5vdGljZWQgdGhhdCB5b3UgYWRkZWQgDQptcGh5X3Jlc2V0IGluIHRo
ZSBuZXh0IHBhdGNoLg0KDQpUaGFua3MNClBldGVyDQoNCg==

