Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AF9CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 10:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SsOef+TNOzEd7NTvAF7h1lVqcjpOf3QI8WH0/HJSuuw=; b=SJJJtlF388bt3Vr8Epmj44nYjw
	osjdi1/F7x0aCT1bCb6mU/eojMkdXHblV/rMKl9NEtmevjZumdfTVWC3IBHRlv2OypepdHySPCNcR
	61uEzkqnxH1VoGhsL5dcUSBARQHndqiy36USTAMFfFtrIYxcMDVLYLkWGCkgG/vsP3/joyjMtP89n
	4dnQ5/2lb6YVygjz1Pya+OjXUydBNSC9Zys8S+DPuUQXpxUY6SoCARIxtvCq6xD2Wzb08GpNGx/V6
	RdX8g3xrqMtS9N3KkiSAWsL0G7BZfsN6Hi2DP4aYRw27W2XmyKURSu/6KtWV67IqjlcvnYQrkc/KB
	C1BXIFtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDhFb-0000000Fn5C-1Q00;
	Tue, 28 Oct 2025 10:48:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDhFY-0000000Fn49-0ZKk;
	Tue, 28 Oct 2025 10:48:25 +0000
X-UUID: 9d8173eab3eb11f09f706fa2197c6ceb-20251028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=SsOef+TNOzEd7NTvAF7h1lVqcjpOf3QI8WH0/HJSuuw=;
	b=Xx7zYvXt1jx6Q6/FPii/ivKnNhZdCInKMNxqbivg5To3Ei30dXOtMFWLIeIlv7bRkV73rxVaaEmQUwk2j/WBBpeek9siU375vRLOCR17Y3Nq0GRBmi4vCvLnjIREVQtotjzyKxyUYVIpqHMhPR4tJzMieKN05TJvGsmiGmky8qE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:cd13b97c-3f0a-4d78-8817-6f3fe0a8a366,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:0907e958-98d8-4d0a-b903-bc96efd77f78,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9d8173eab3eb11f09f706fa2197c6ceb-20251028
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1449149735; Tue, 28 Oct 2025 03:48:18 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 28 Oct 2025 18:48:15 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 28 Oct 2025 18:48:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q5VVGUc8lJ/JuzMRZaVYVh1cGSfLyfgEFnhaqpJTGfFjozOdFLrVTmAO5kkbCsfJdzXLJgb4qzcVLf1A/9RGyJVoOQRLUXmobkKnNjYyvgwLtBmTaVf29ko5C6TPvcwSxgEp5FB1xyt+NPjzTZ/jvIUhH4cPPvxVlePJV9T8K7Gvnz6K0La46OHM/bzQBokUwga2kVwBQCPm8EbziDfbqX1CrAJPljgHXCCGmCWXGm7i3/gye+ROBF+I7Flho65JiGvAnXaV/UVz/jEsgZ6WISnEqMYKU3GTvOysSZPsXlgbBisUkVh6LmZUG/RCXqoIFyWbDBAuV4RQCJyBRsa9hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsOef+TNOzEd7NTvAF7h1lVqcjpOf3QI8WH0/HJSuuw=;
 b=oyScrQ+cDUWEMgqPHyO3sir+3AZZB7SCCPlKmroKq7WYT7p0ru1Edih98okTYiN+6gQOH8hgg2KwOlE/s0H8b+jYRjZ5y05DQctGUBt+9S25l+rOGWMH4Ebm4OS/pjSsg1Blnrc9yK/g7DbjjmnzVYCOL2tUwda5VMRNg8BhByM+wGLMuVu9qEQYouJZnaxr8oprkIMD6Au49525dtSGtARO/Lswv9TDn/INhexMXrEkjmsghP894FdehZ9lUnQeOee6JKLSEAsX5AgAUN89XPdO8Oh+grPyYw4/EkO0DPklDwu4I24uMaGJHZDeN0AWiEf7Px0CTvPzRYPB8POiBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SsOef+TNOzEd7NTvAF7h1lVqcjpOf3QI8WH0/HJSuuw=;
 b=GoDBRrZwSYXoSYkghjlXkO0sQJofzP2NMoBQN0FZd1kcGYKAKp6HZ3QG17SLBm8CF9obASll/dZ6EmGaCid6MqyhigTHINHFp1PZUBdWvUFjfa1fI4LrVZ+DXrK5AWiIWQe9HCLKj6qdHp+algtPLAFoLJBQUbC6lUnhSGOJgkM=
Received: from SEZPR03MB7810.apcprd03.prod.outlook.com (2603:1096:101:184::13)
 by SEYPR03MB6651.apcprd03.prod.outlook.com (2603:1096:101:81::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 10:48:12 +0000
Received: from SEZPR03MB7810.apcprd03.prod.outlook.com
 ([fe80::2557:de4d:a3c7:41e8]) by SEZPR03MB7810.apcprd03.prod.outlook.com
 ([fe80::2557:de4d:a3c7:41e8%4]) with mapi id 15.20.9253.018; Tue, 28 Oct 2025
 10:48:12 +0000
From: =?utf-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>, Sjoerd Simons
	<sjoerd@collabora.com>, "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"simona@ffwll.ch" <simona@ffwll.ch>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "greenjustin@chromium.org" <greenjustin@chromium.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
CC: =?utf-8?B?QmVhciBXYW5nICjokKnljp/mg5/lvrcp?= <bear.wang@mediatek.com>,
	Tzu-Hsien Kao <tzu-hsien.kao@canonical.com>,
	=?utf-8?B?VG9tbXlZTCBDaGVuICjpmbPlvaXoia8p?= <TommyYL.Chen@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?UGFibG8gU3VuICjlravmr5Pnv5Qp?= <pablo.sun@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Jian Hui Lee
	<jianhui.lee@canonical.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "kernel@collabora.com"
	<kernel@collabora.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] drm/mediatek: Disable AFBC support on Mediatek DRM driver
Thread-Topic: [PATCH] drm/mediatek: Disable AFBC support on Mediatek DRM
 driver
Thread-Index: AQHcRSTKfXYmIFNQnkeW70uhc6JwZ7TXZlkA
Date: Tue, 28 Oct 2025 10:48:11 +0000
Message-ID: <6a13caa9f566951df8fad7ce79460ef35760e798.camel@mediatek.com>
References: <20251024202756.811425-1-ariel.dalessandro@collabora.com>
In-Reply-To: <20251024202756.811425-1-ariel.dalessandro@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7810:EE_|SEYPR03MB6651:EE_
x-ms-office365-filtering-correlation-id: 0259e95e-5c7c-4219-1617-08de160f7d84
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?bGhJY0YrMWYrL1FTV3hLYUVTYnBscXc4Tml0VkVISFB0UXNVTmt5M1JiS2ZV?=
 =?utf-8?B?MnNlY1p0WVl1UWZEd3owb1NVd3ZTb0IwUzZ5YVRwSGlTK1EwUlcvRmorZFZG?=
 =?utf-8?B?MHJ1SW9mNU5aa1BWK3pVQ25WUWUvS2FoeDNBeC8zSk1panZBWk8rMkhKMDZj?=
 =?utf-8?B?SUVPUTNsWkpEVHVYVS9BWlNuY0hjZmU0OWZsMUEzRndiWnhFOXhyMUY3cUFT?=
 =?utf-8?B?WnJ1eTNhYWpIek1jbWUyWEpHSWsxU29RUENNUkw5NHhRNWU0TCtoRTRjYklO?=
 =?utf-8?B?V0t0OEdvWFY1cjNMTUtaT3pPcGNacjc5YXE1NEpOSml0ZFBUSG4xc0JMOTFD?=
 =?utf-8?B?YUVOSnp0MTFTVTBwUHBIbE4yZDB4c0hhWDZzMUp5eDlPSFlyeGhvYkgwaFg4?=
 =?utf-8?B?YUxVMS94SUNDWnBmZDlZZ3p2Q2FVS3RnMnJrRkZRT0h0OUpsdndPUmxYQjhG?=
 =?utf-8?B?UmpUQ29jUHVYRVVycnVQUThNOFNhTk9JK3BwcWxORmp6d1VmODYyM2I0eVdK?=
 =?utf-8?B?Tjd4ZUZpanBheUhkeGhiL0p6KzBQRXhBZWJGK0pFVENlMXNCQW9JVFVYd0Fa?=
 =?utf-8?B?ZGJhVk10YlZOV3h3cjZYcXlBd1UySEVtNTF2a2F1a1E0Y25ySU1YYjFPY2l0?=
 =?utf-8?B?NnpCTXVXM3hncTBpczhSK0dCUjJvVk1xZ20vaCtqWUc1WkNYRXhtdVhKd3hB?=
 =?utf-8?B?WUZUd1NyYmpTZEpZQW8xVk91WWJyM2s0Y09lRVg2eSswR0VHdXRRdGUrK0tY?=
 =?utf-8?B?QUFEZWVwZ0swQlkwRHFvNGprWk9aSlk1UjhKMFZFZ0hjeDhITkdiTHcwRWky?=
 =?utf-8?B?UFVuVXZRclp5cTA2OXRzNnZNdkxEaytiV3Q0bWZEc0dIbHdaUlhUV3dYaTNL?=
 =?utf-8?B?eDRUTkhZNzg2eXVKN3ZTeVp5MytUaVpzYTdUNitXUjJPb3dGTENCSkhTSDZU?=
 =?utf-8?B?bDRmNXVZbUp1ZVI4VFg5N3RtdFpDeTl2Z1daQ1BaRmljRkxjSjF1OFlacWZ0?=
 =?utf-8?B?R0wxOXFqOXlzMTRPckwxZVYvS1M4OVRqakV3WERUWWE0dVE1cm5qdURwVjhj?=
 =?utf-8?B?VjVSZHQvNHVHUTFRQmE1RUhCWEJmdE1pemt1RHBaZDRxZjdCRnJ5SHNMdkZB?=
 =?utf-8?B?Mk9OZ1ZpOTRGMnNHZ2ZuRGQ5Sy9nZlV2NWpYMWVLOWNPY04rUnRTN1NOUXVu?=
 =?utf-8?B?L2lpUHJlTnVEdWwwdjVHK1RJNDE3OEQ0Sk5qandDeGRwMm4rbStzQmgzZHdZ?=
 =?utf-8?B?aGFUUlcwYk45amphNFRuM1NxRiswT0svb0puNTJLbGV0aTdVNlJLK2lBRkh2?=
 =?utf-8?B?NW1LdDFGaGYwZ0N4NVVObzVmK09vWmE4YWVkS0xKYjAwL1lIbEhKMjN6SU1Z?=
 =?utf-8?B?amc2Um9uMWU2NVJXbmxub0tpakRrQXlwbUhYTzF4dDlpSXRoNnRVZG54T3BP?=
 =?utf-8?B?bTNaNktZNnd0cERJQXlGcTVDSlh6WjFkc2gwRDIybVFDWmNEUno1WE5YYzZ6?=
 =?utf-8?B?UExmOWs1Tm5MT2VaZTJNWGVucDNab3hxenI0QlI2TnRmSnJzbytrdnl1Tnlw?=
 =?utf-8?B?WnNiaDBjSEZrSnN5citoZUtoNERoNEozcm9Ic3VXc0wvZnovVTB6dGxMUzRa?=
 =?utf-8?B?ZEp4T1NEeCtyR21tWVI5TUhLWTB0bHFhNmZrZk5wemZiL0Qvb09ZcStTSGZU?=
 =?utf-8?B?TDFmUjJmOHZNVkt4N1B2eTRLbU9zTWJCWjR0QUNvT1RlSlRUeHFxaENkSHN4?=
 =?utf-8?B?RFdNQWdaV0ZlbXVyUURjWjJMemNWa1B1NmRtc2x6OTVoRlFLKzlZTy9EaFp5?=
 =?utf-8?B?MzJYQTJmSlkwQzZaSCtwTWZxdUZBZFpZZDNUSGNMUUhvczNYSnZWbFdmUWFl?=
 =?utf-8?B?T1dwdUd6bEhneGhJMTRBWUxIdTNzeUpONmh1clhMNW40OThxcUVEdlZFNGYw?=
 =?utf-8?B?N1hRUWRVNFlKODVvNWQ2RkNCckRyY2syUUFFVlRmblVqVHdmS3ZFay8yTG9v?=
 =?utf-8?B?dUlCZEsyRVdVTDYrQW1KbWRDODFYOEJmV0xLSHFTTEgzTFZEZUtKdXRQNUxw?=
 =?utf-8?Q?mEeAo+?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7810.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a0VLYk9QRnZHSWRlSzJkbUpnQ1dzMXpOdURxMlRlWXZ1M2tHbkF1RU1sc1JP?=
 =?utf-8?B?TGNkWUJFdElqT3hyNFA4OVgzYTUrVTRrZURXQnB2TVcyR29MV2lkZ1lFUmFN?=
 =?utf-8?B?ZUZLQVBRMHphMmp6ZzZkS29tNjFPRzBnSHhLaTJLYXQ1RldrWlhUQWE1d05N?=
 =?utf-8?B?SjBxVDErelVPa1lCUWtndlhHK05JM1k0UHRKb2lTbFpyUnFMOHc4TFhlb1dC?=
 =?utf-8?B?OU1nbStEREhpbGpKQU15YXplWVdsQVdUT2FtdTROcE1mTmpCOEFxOUdEMTRY?=
 =?utf-8?B?R2oxVjdKODlaMUFoTjMzT1k5OStReEtiS25nMDZiZXcvWnpRUFJTU1l0Uzlk?=
 =?utf-8?B?dmY5eHVNMFl6cHZDRTd3RjhUNXkwZWxUVitWc1lUN1JkbnlkQjMyRUdlSU9Z?=
 =?utf-8?B?aEJ5YVUreENPdzBJVDRiUHR0M0VldW1HaXV6YUFRbk1udkVBRjVYbml4Ukx0?=
 =?utf-8?B?c1d1RXlUWU1scW84TjJhOExXSFBYcUtUWVFNd2tLMisvV29XbHBObVd6bmp2?=
 =?utf-8?B?SFNNMGJMUUJua2UxRVlnWjJNU1hyczdKY05GRTdvVGVmVHZYa0Iram9wR3pL?=
 =?utf-8?B?dXVFZjB1MG5EdDBXN1RXSm8rOTkyb2EwOGNhd0xER0J1QjRpR1hFZElDelVH?=
 =?utf-8?B?Qmx4NmJEbVlLTFdBc1JwcGNDTnhFYTFkNmV1NWpuNWdJeGNxNE9GOGFZc3FW?=
 =?utf-8?B?TWFKRmFMajNlcTZxVU9jdzU5Z2I1Zi9YSmpoeHRZRkhHVEo3MmhYSzA2WlQv?=
 =?utf-8?B?TEIxZ0NYMUxkMW1IazJxUURCWWlkaE8vQnl2YVRGbDVlZCtUNmhVZFV3aEhU?=
 =?utf-8?B?eks2aTdiYmJqVHptRWtqb0RoVzNBK3ovaWJUOW1uaXpDdkswMFZad01POUVD?=
 =?utf-8?B?cVdSMnNaZVB2cHVGL2xCblJDREYxOWxGalBjK2FjSFk3OWdYbjdIQXkzNkdz?=
 =?utf-8?B?Z2p1THM5TnB1WC9tQnZoRGc5REh1VHVPc1QraVROR2h4K1VCS3RWZTBKa1kr?=
 =?utf-8?B?NFUxSGZTNUdsY0JobUNkVDg1djdHMkowNlArRE9HZkdTeHVzZTA4alB0WVo1?=
 =?utf-8?B?V2ptUjkwa1NtZ20zcDRmbjg1eVpMMy82b0JZcXdXdFFBZm01U21uSDA5anhx?=
 =?utf-8?B?cUJBK0lDRWxlM1BleW14cE9weWFJdzJibDMyMUpXRHF5elpVOGJFQ3VETzZs?=
 =?utf-8?B?WWVJK2FiZHlhKzgvYWVVcG4xTHUwa1pDQ2JLdkV2Y0tyRHIwRklKY3k4dGtW?=
 =?utf-8?B?N0xacnZFTmN2SUU0VllzMm43RWZsSWNEUWJrOUt0NTdvL3F1VG1NSGN2ajZN?=
 =?utf-8?B?cWNiL3NtNHRxei93WHp2Qm8veCthbmFraURKZGdrRmJ1YlZrMXpxNjhsemdt?=
 =?utf-8?B?S2UyUlFaZk51Z1Vac1FreFM3dkQzK09MS014YkMrSWgwbGJlK1VzV3FZQU5Y?=
 =?utf-8?B?am9HdGh3OSsvMzMvZDVybmR2T1hnMmlOUG5ROGRSZTZkaDBFVjcrVFErSFpK?=
 =?utf-8?B?SVk3aFhLN2EwRUNKVnVtSmE0T2d6TWQ1YjQ4RWdXLzJEN2V2VEZwZkEveTRI?=
 =?utf-8?B?eWU4eUgyaStnOUlyeC9Td0t5K3hQaitwMmQ2bjRtNVl2aUh5YzM0WXl1VzRr?=
 =?utf-8?B?V1lCQTRObE94c1ZELzRKdHNENmlUdUp0UXV0R3NjWDFTdTlpWGRxdjRZSzE5?=
 =?utf-8?B?YThCbHEvNkVzaWphVVdiQVp2eFVBZTFKNURTa0Q5VDZ4NHpmRUNjY3VYbHJV?=
 =?utf-8?B?VjhaMEhJR21Eamo2TDRFMUUzTzVVbURJTkYyN3NRSHBKVGVJUEZ1VkVpUWs5?=
 =?utf-8?B?YzBOWXFRQ2MxblBGZkhIOVZRRG1tMDFtaE9vMUZ3VmRaNDFKQlcyZUhueGFJ?=
 =?utf-8?B?L0JVK3Z2eTJ1MnlQL0U5Tk8rTk9sSTZHdWNTZURqOUhPcGhCenJZajZjMmo4?=
 =?utf-8?B?bHp0QkRoTnBCTm9MOWR4S2VMYkszejFjUzJ5blNGUmtUU3IzcXZ4aE8zNWRu?=
 =?utf-8?B?KzZlZ1hhaEdhS1R6bGg5cEJ2alJBdkU3aVNoM2EydDV6ZDQrT01oNG1hK2lY?=
 =?utf-8?B?SmdrelVtWHk1eXBvUThBQmoySTFaL1R5QXJmb0hOczJIOUxzUC81eW1wcEF2?=
 =?utf-8?B?MndwdW5OdjZFdDN0TWNIQjNkeW9GMUt0ZGNsR21QUGV1bEo1QW1KeWUzVm9B?=
 =?utf-8?B?U0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8017B41A0284F642A39751B7899C9B25@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7810.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0259e95e-5c7c-4219-1617-08de160f7d84
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 10:48:11.8969
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GI3dgW9pbEh/cuf9sfBBFNCU2LsCbXdMbfjtgVx3YjsGwXGS+pWy0tLPgVs4Wbzd7WzG6AFB+9wxW8Rmdx+k15qJMZxLreLfwl8YHnlwlBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6651
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_034824_192308_8058796D 
X-CRM114-Status: GOOD (  10.29  )
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

T24gRnJpLCAyMDI1LTEwLTI0IGF0IDE3OjI3IC0wMzAwLCBBcmllbCBEJ0FsZXNzYW5kcm8gd3Jv
dGU6DQo+IA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Ig
b3BlbiBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9y
IHRoZSBjb250ZW50Lg0KPiANCj4gDQo+IENvbW1pdCBjNDEwZmE5YjA3YzMyICgiZHJtL21lZGlh
dGVrOiBBZGQgQUZCQyBzdXBwb3J0IHRvIE1lZGlhdGVrIERSTQ0KPiBkcml2ZXIiKSBhZGRlZCBB
RkJDIHN1cHBvcnQgdG8gTWVkaWF0ZWsgRFJNIGFuZCBlbmFibGVkIHRoZQ0KPiAzMng4L3NwbGl0
L3NwYXJzZSBtb2RpZmllci4NCj4gDQo+IEhvd2V2ZXIsIHRoaXMgaXMgY3VycmVudGx5IGJyb2tl
biBvbiBNZWRpYXRlayBNVDgxODggKEdlbmlvIDcwMCBFVksNCj4gcGxhdGZvcm0pOyB0ZXN0ZWQg
dXNpbmcgdXBzdHJlYW0gS2VybmVsIGFuZCBNZXNhICh2MjUuMi4xKSwgQUZCQyBpcw0KPiB1c2Vk
IGJ5DQo+IGRlZmF1bHQgc2luY2UgTWVzYSB2MjUuMC4NCj4gDQo+IEtlcm5lbCB0cmFjZSByZXBv
cnRzIHZibGFuayB0aW1lb3V0cyBjb25zdGFudGx5LCBhbmQgdGhlIHJlbmRlciBpcw0KPiBnYXJi
bGVkOg0KPiANCj4gYGBgDQo+IFtDUlRDOjYyOmNydGMtMF0gdmJsYW5rIHdhaXQgdGltZWQgb3V0
DQo+IFdBUk5JTkc6IENQVTogNyBQSUQ6IDcwIGF0IGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWlj
X2hlbHBlci5jOjE4MzUNCj4gZHJtX2F0b21pY19oZWxwZXJfd2FpdF9mb3JfdmJsYW5rcy5wYXJ0
LjArMHgyNGMvMHgyN2MNCj4gWy4uLl0NCj4gSGFyZHdhcmUgbmFtZTogTWVkaWFUZWsgR2VuaW8t
NzAwIEVWSyAoRFQpDQo+IFdvcmtxdWV1ZTogZXZlbnRzX3VuYm91bmQgY29tbWl0X3dvcmsNCj4g
cHN0YXRlOiA2MDQwMDAwOSAoblpDdiBkYWlmICtQQU4gLVVBTyAtVENPIC1ESVQgLVNTQlMgQlRZ
UEU9LS0pDQo+IHBjIDogZHJtX2F0b21pY19oZWxwZXJfd2FpdF9mb3JfdmJsYW5rcy5wYXJ0LjAr
MHgyNGMvMHgyN2MNCj4gbHIgOiBkcm1fYXRvbWljX2hlbHBlcl93YWl0X2Zvcl92YmxhbmtzLnBh
cnQuMCsweDI0Yy8weDI3Yw0KPiBzcCA6IGZmZmY4MDAwODMzN2JjYTANCj4geDI5OiBmZmZmODAw
MDgzMzdiY2QwIHgyODogMDAwMDAwMDAwMDAwMDA2MSB4Mjc6IDAwMDAwMDAwMDAwMDAwMDANCj4g
eDI2OiAwMDAwMDAwMDAwMDAwMDAxIHgyNTogMDAwMDAwMDAwMDAwMDAwMCB4MjQ6IGZmZmYwMDAw
YzlkY2MwMDANCj4geDIzOiAwMDAwMDAwMDAwMDAwMDAxIHgyMjogMDAwMDAwMDAwMDAwMDAwMCB4
MjE6IGZmZmYwMDAwYzY2ZjJmODANCj4geDIwOiBmZmZmMDAwMGMwZDdkODgwIHgxOTogMDAwMDAw
MDAwMDAwMDAwMCB4MTg6IDAwMDAwMDAwMDAwMDAwMGENCj4geDE3OiAwMDAwMDAwNDAwNDRmZmZm
IHgxNjogMDA1MDAwZjJiNTUwMzUxMCB4MTU6IDAwMDAwMDAwMDAwMDAwMDANCj4geDE0OiAwMDAw
MDAwMDAwMDAwMDAwIHgxMzogNzQ3NTZmMjA2NDY1NmQ2OSB4MTI6IDc0MjA3NDY5NjE3NzIwNmIN
Cj4geDExOiAwMDAwMDAwMDAwMDAwMDU4IHgxMDogMDAwMDAwMDAwMDAwMDAxOCB4OSA6IGZmZmY4
MDAwODIzOTZhNzANCj4geDggOiAwMDAwMDAwMDAwMDU3ZmE4IHg3IDogMDAwMDAwMDAwMDAwMGNj
ZSB4NiA6IGZmZmY4MDAwODIzZWVhNzANCj4geDUgOiBmZmZmMDAwMWZlZjVmNDA4IHg0IDogZmZm
ZjgwMDE3Y2NlZTAwMCB4MyA6IGZmZmYwMDAwYzEyY2I0ODANCj4geDIgOiAwMDAwMDAwMDAwMDAw
MDAwIHgxIDogMDAwMDAwMDAwMDAwMDAwMCB4MCA6IGZmZmYwMDAwYzEyY2I0ODANCj4gQ2FsbCB0
cmFjZToNCj4gwqBkcm1fYXRvbWljX2hlbHBlcl93YWl0X2Zvcl92YmxhbmtzLnBhcnQuMCsweDI0
Yy8weDI3YyAoUCkNCj4gwqBkcm1fYXRvbWljX2hlbHBlcl9jb21taXRfdGFpbF9ycG0rMHg2NC8w
eDgwDQo+IMKgY29tbWl0X3RhaWwrMHhhNC8weDFhNA0KPiDCoGNvbW1pdF93b3JrKzB4MTQvMHgy
MA0KPiDCoHByb2Nlc3Nfb25lX3dvcmsrMHgxNTAvMHgyOTANCj4gwqB3b3JrZXJfdGhyZWFkKzB4
MmQwLzB4M2VjDQo+IMKga3RocmVhZCsweDEyYy8weDIxMA0KPiDCoHJldF9mcm9tX2ZvcmsrMHgx
MC8weDIwDQo+IC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0tLQ0KPiBgYGANCj4g
DQo+IFVudGlsIHRoaXMgZ2V0cyBmaXhlZCB1cHN0cmVhbSwgZGlzYWJsZSBBRkJDIHN1cHBvcnQg
b24gdGhpcw0KPiBwbGF0Zm9ybSwgYXMNCj4gaXQncyBjdXJyZW50bHkgYnJva2VuIHdpdGggdXBz
dHJlYW0gTWVzYS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFyaWVsIEQnQWxlc3NhbmRybyA8YXJp
ZWwuZGFsZXNzYW5kcm9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19wbGFuZS5jIHwgMjQgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IMKg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX3BsYW5lLmMNCj4gYi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX3BsYW5lLmMNCj4gaW5kZXggMDIzNDliZDQ0MDAxNy4u
Nzg4YjUyYzFkMTBjNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19wbGFuZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfcGxhbmUuYw0K
PiBAQCAtMjEsOSArMjEsNiBAQA0KPiANCj4gwqBzdGF0aWMgY29uc3QgdTY0IG1vZGlmaWVyc1td
ID0gew0KPiDCoMKgwqDCoMKgwqDCoCBEUk1fRk9STUFUX01PRF9MSU5FQVIsDQo+IC3CoMKgwqDC
oMKgwqAgRFJNX0ZPUk1BVF9NT0RfQVJNX0FGQkMoQUZCQ19GT1JNQVRfTU9EX0JMT0NLX1NJWkVf
MzJ4OCB8DQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgQUZCQ19GT1JNQVRfTU9EX1NQTElUIHwNCj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBBRkJDX0ZPUk1B
VF9NT0RfU1BBUlNFKSwNCj4gwqDCoMKgwqDCoMKgwqAgRFJNX0ZPUk1BVF9NT0RfSU5WQUxJRCwN
Cj4gwqB9Ow0KPiANCj4gQEAgLTcxLDI2ICs2OCw3IEBAIHN0YXRpYyBib29sIG10a19wbGFuZV9m
b3JtYXRfbW9kX3N1cHBvcnRlZChzdHJ1Y3QNCj4gZHJtX3BsYW5lICpwbGFuZSwNCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVpbnQzMl90IGZvcm1hdCwNCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHVpbnQ2NF90IG1vZGlmaWVyKQ0KPiDCoHsNCj4gLcKgwqDCoMKgwqDCoCBp
ZiAobW9kaWZpZXIgPT0gRFJNX0ZPUk1BVF9NT0RfTElORUFSKQ0KPiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gdHJ1ZTsNCj4gLQ0KPiAtwqDCoMKgwqDCoMKgIGlmIChtb2Rp
ZmllciAhPSBEUk1fRk9STUFUX01PRF9BUk1fQUZCQygNCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBBRkJDX0ZPUk1BVF9NT0Rf
QkxPQ0tfU0laRV8zMng4IHwNCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBBRkJDX0ZPUk1BVF9NT0RfU1BMSVQgfA0KPiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IEFGQkNfRk9STUFUX01PRF9TUEFSU0UpKQ0KPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCByZXR1cm4gZmFsc2U7DQo+IC0NCj4gLcKgwqDCoMKgwqDCoCBpZiAoZm9ybWF0ICE9IERSTV9G
T1JNQVRfWFJHQjg4ODggJiYNCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgIGZvcm1hdCAhPSBEUk1f
Rk9STUFUX0FSR0I4ODg4ICYmDQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoCBmb3JtYXQgIT0gRFJN
X0ZPUk1BVF9CR1JYODg4OCAmJg0KPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqAgZm9ybWF0ICE9IERS
TV9GT1JNQVRfQkdSQTg4ODggJiYNCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgIGZvcm1hdCAhPSBE
Uk1fRk9STUFUX0FCR1I4ODg4ICYmDQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoCBmb3JtYXQgIT0g
RFJNX0ZPUk1BVF9YQkdSODg4OCAmJg0KPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqAgZm9ybWF0ICE9
IERSTV9GT1JNQVRfUkdCODg4ICYmDQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoCBmb3JtYXQgIT0g
RFJNX0ZPUk1BVF9CR1I4ODgpDQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVy
biBmYWxzZTsNCj4gLQ0KPiAtwqDCoMKgwqDCoMKgIHJldHVybiB0cnVlOw0KPiArwqDCoMKgwqDC
oMKgIHJldHVybiBtb2RpZmllciA9PSBEUk1fRk9STUFUX01PRF9MSU5FQVI7DQo+IMKgfQ0KPiAN
Cj4gwqBzdGF0aWMgdm9pZCBtdGtfcGxhbmVfZGVzdHJveV9zdGF0ZShzdHJ1Y3QgZHJtX3BsYW5l
ICpwbGFuZSwNCj4gDQoNCkdyZWF0ISBUaGFua3MgZm9yIHRoaXMgcGF0Y2guDQpJJ3ZlIHRlc3Rl
ZCB0aGlzIHBhdGNoIGFnYWluc3QgazYuMTcuNSBvbiBtdDgzOTUtZ2VuaW8tMTIwMC1ldmsgYm9h
cmQsDQphbmQgaXQgaXMgd29ya2luZy4NCkkndmUgYWxzbyB0ZXN0ZWQgdGhpcyBwYXRjaCB3aXRo
ICdtb2RldGVzdCAtTSBtZWRpYXRlayAtcw0KMzRANTk6MTIwMHgxMjkwJyBpcyB3b3JraW5nIGFz
IHdlbGwuDQoNCkknbSBub3Qgc3VyZSBpZiBpdCBpcyBwb3NzaWJsZSB0byBhZGQgYSAiRml4ZXM6
IiB0YWcgdG8gdGhpcyBwYXRjaD8NCk1heWJlIGFkZCB0aGlzIHBhdGNoIHdpdGggJ0NjOiBzdGFi
bGVAdmdlci5rZXJuZWwub3JnICM2LjE3JyBhdCBsZWFzdD8NClNvbWUgTGludXggZGlzdHJvcyBh
cmUgY3VycmVudGx5IHVzaW5nIDYuMTcgZm9yIHRlc3RpbmcuDQoNClJldmlld2VkLWJ5OiBNYWNw
YXVsIExpbiA8bWFjcGF1bC5saW5AbWVkaWF0ZWsuY29tPg0KDQpSZWdhcmRzLA0KTWFjcGF1bCBM
aW4NCg0K

