Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F7DCD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 08:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a/eFrdHX4I4Gb1KkE3WjfyQ/IvEjGgSMSvjVXABAyic=; b=fvbA6Ex8yx8WfLgLXTkRep11Lh
	dZtSrj3DeJfW1SWNIT4xi6Tov36h6lIEAGca3UH+cJFbatzFHNwaiOMQIk8bBbGV/bmLeiCGp8cz9
	zFSoHmPdh9uTwDGZZQPsj/72t42T0im7Qw/lqATx3hPVlScBCyZOxKtpzVKJx96n2b+WTD8zEHAS/
	KfquCkGm99bMHBERkEfDrj+vgze525+uYMKs6Eamk51R/GGBul1Aye9HuOv54B35ew3FcvUAtaNd7
	xjukVW3VQI8+nrxtniKqh3bkuok+PouTJ9BUIV85yNcA4B/nSz8H+HoEtypc6383X2Jyq67N1W2g3
	QqWk+jKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPFzt-00000000hw3-0Nv8;
	Tue, 19 May 2026 08:40:17 +0000
Received: from [216.200.240.185] (helo=mailgw02.mediatek.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPFzq-00000000huG-21zj;
	Tue, 19 May 2026 08:40:15 +0000
X-UUID: 560bddda535e11f1acbe4559397dec65-20260519
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=a/eFrdHX4I4Gb1KkE3WjfyQ/IvEjGgSMSvjVXABAyic=;
	b=krxmnm5dvRXSwv7+0toSJ/NLRqyeWZckT1xoNkuCeWdfhbK2F9c0WNRmxafyt/MY8kCpNmgbQbtKIVB8msMRGZ0dqzgYi2uUKBl0RGgRn1rageOlWn4N3GVR0ZDLKWDJHoPDXfn3d4dXFL78BjsgyUWxyfipYHrrKTgJg9DM2jk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.14,REQID:d68b020e-d1f9-473a-af73-1aa336bd3752,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:9091e75,CLOUDID:f0b6f61e-023f-4f87-9e9c-6c116c694fb3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
	l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 560bddda535e11f1acbe4559397dec65-20260519
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <xueqi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 970303370; Tue, 19 May 2026 01:40:06 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 19 May 2026 16:40:03 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 19 May 2026 16:40:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=obn5VNoyQ3+zg08Iqen8d7OLeZVDwyKduf1e0rgE00L7Wy9HwjYK6s/ox7pYJ0pFLIACcMXOgjDyiSv2DvAv5Yxq45sqa+VqDnT7lQcWjF8y2ZWSa+o6kgATQ6nnkwdXrca3ufhmgeyQAb0Nf9GtXFYN45UmBXdoanRceNDHJ9YDLKaoNYPEcMdJCUYhmW5OPQBXNMnmnaIFwKIknKkje0dxanaanJ+Bp67Ywwz+vq+CubqPmw6+UMeeS4pP+lSIOi3L/dKYG6mx/mSinrVNC6TH/cqz+StnywqvpKwzekN2lVnb97U0dlU9K4pnhklVFnaCGqhT1hU8pZj+QiIbiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/eFrdHX4I4Gb1KkE3WjfyQ/IvEjGgSMSvjVXABAyic=;
 b=XYdyYm0TShTHUcLzCamG5tqucgSz5dwMTQ7ZHNXLewzWcXhMk+LZX/demulm+qQL2E0fKyut7cc8PrfJ+7p27ejWbLM3UwrWr6oj13GX9upVeb2RmQrlKCzlxu810EJ8BLkdXjoNwxgCDvcZX0jJQ43qnXuqDVCJGewq6UDWQJ2gRwe/sg+yJE7atIci/hjqj1kfLc4xqJn0UNd+jiHZbH50HiP5gsuDIP4WDewguJyN8fA5HERuFDOPS5UNVaCcRNGzSvFGEWyeOwiXjESEiQf+OEhyaIjAAEKgf/M7xL4ozCkpi/KCrE3ZFjF11WA9kXTxGfL4pWLjDo37VfTkSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/eFrdHX4I4Gb1KkE3WjfyQ/IvEjGgSMSvjVXABAyic=;
 b=DAzktQq6DJ2SjBoAtohM93BTEIfwSCr4C6Bng2pbcr19zea2jcjo+b76jLppYUrmrI9bf6QpZG3F0komnk12Ey90mDuVqPPlKMmVCG1jZRbZ+lxdubBVhFyKbgqRk0hNsnONxyS5s993JGuT/CMx2TXMclpRQd8T+hhRQzNrt8E=
Received: from TYZPR03MB6471.apcprd03.prod.outlook.com (2603:1096:400:1c9::8)
 by KUZPR03MB9494.apcprd03.prod.outlook.com (2603:1096:d10:2f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.13; Tue, 19 May
 2026 08:40:00 +0000
Received: from TYZPR03MB6471.apcprd03.prod.outlook.com
 ([fe80::6c05:f611:5357:7326]) by TYZPR03MB6471.apcprd03.prod.outlook.com
 ([fe80::6c05:f611:5357:7326%5]) with mapi id 15.21.0048.013; Tue, 19 May 2026
 08:40:00 +0000
From: =?utf-8?B?WHVlcWkgWmhhbmcgKOW8oOmbqueQpik=?= <Xueqi.Zhang@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?=
	<Yong.Wu@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "krzk@kernel.org"
	<krzk@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: =?utf-8?B?V2VuZHktU1QgTGluICjmnpfoqanluq0p?= <Wendy-ST.Lin@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/3] memory: mtk-smi: Add a flag skip_rpm
Thread-Topic: [PATCH 2/3] memory: mtk-smi: Add a flag skip_rpm
Thread-Index: AQHbmWr+ThkPYzLV/EeJKX653FeCxLN777UAgpo4ZDaAAXs4gA==
Date: Tue, 19 May 2026 08:40:00 +0000
Message-ID: <fe81b10f912a5984cddbaaf022a5859d6fc53943.camel@mediatek.com>
References: <20250320073625.25225-1-xueqi.zhang@mediatek.com>
	 <20250320073625.25225-3-xueqi.zhang@mediatek.com>
	 <46e0e1f1-e094-40f9-99f9-22678bb40d39@collabora.com>
	 <198865fb3184926d0b1b4e4855b5f863ad0d6a20.camel@mediatek.com>
	 <1a8b6793-661f-4676-bb29-6c1ee11a3ce9@collabora.com>
In-Reply-To: <1a8b6793-661f-4676-bb29-6c1ee11a3ce9@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6471:EE_|KUZPR03MB9494:EE_
x-ms-office365-filtering-correlation-id: 909ddce7-d0b2-44cd-b750-08deb58236d7
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|4143699003|11063799006|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: Xfb9hNDL7+YElLeiBduWjT8+IgxI8QPUvx4Z2NksYiEsFYuT5AvZzZfoCi6CiAO/W/T2clC23Qx/xAGMPgEilnvJh6tO/VPS7G5MttSOcKmJfZgFl87sNOxDvPA8UjvCJ6s4/X8Xk9FeIHOccBaWfpOaNWX+mwP8eJO/rVJB1n32z5XsfQELfuSa4AS2SG79zDBPXMxenHh5IcWKs48gsxKNheAoNvEJDpvQ4p2A2zefoPuOvLEHNu7DkMHB0573J0I0mH/WPE+XLz2wVEIjbpxazaTQn4DBIyxENHa3IdWCst8bvuY1FivO48bw0GPch91WBybWYRaH6TTgohF0QnPJ5IZPJL1nqR4bsZDRACkzyN4NYjgb2wZUiVSsEiVBXSDHYLRFGIOT0zf5848EXPuRLZ9PQfa16jgVnlblcXqxMA0PeQr2AOxPmH1UI9qBqtl/8WhdXbJf76ZonyrH9QHfHhepDm/sbdgO4TpmSERB2Qm9CCepr3nOV5PaqNI0sFuGJ/OD30lz7O20+eKHO/R2m/GuYTbbNP+xAizt9Z5085cN2rDX9A6DPrwtMa8u4uBeTaO8M8anyc1ZZCsnv2yGlw5ScDVZvSiBpL6mYfFAE9konOXOs/SWivE6uYxoMf5p1M2fuYVxH8Dcnf35P59vZ5YpJl8sSq4IlwA0Eb2Y8sBb0z30eAzNto0yLzk00PIa2o0OkoiQ3/02XpI4wz4G1e6SO5YYmt4gjIWus0Pmin+/P/GhjnCHvB1PBdhj
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6471.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(4143699003)(11063799006)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ckI5S1B2Y3RPR3NlZjdHWnRoNUdlVHhidVFXZzQwK1NrOHFrcnpOOUp5N0F4?=
 =?utf-8?B?emcvQzFXRXRRbWJaVHlnQzBYenhTRlkzVzNjS1ZtS2o0VkhIdlorMW1qbUJN?=
 =?utf-8?B?MGZaYmp1S1IwOEhvYmpTSndVcExQVUpRaTZjZno1cGtGazNuSGJqL3M5V3M0?=
 =?utf-8?B?Q1I4K2lpZnUyNkphSXBheGlxRHBjYXo1VVllcE1FT2Y3TkcwaWV0N2dqaFBq?=
 =?utf-8?B?TVkwVTRzRUtkQkZNaXVTVzY1TmhNeWFkcUhnUCtlN0VnbUZtWC9VL1UrK0Zw?=
 =?utf-8?B?c3lnbzhlZVByd0Rydjc0SWlzdVk5NE9JTngzYWFKM1FrTzI3WTJ5NDVVeDhD?=
 =?utf-8?B?UnI3ZHlSajlidFRyT3NzUGxyZkEvUWhpdGJ6emhPWUgvazFpbGs2ZEFkNnNa?=
 =?utf-8?B?UjVTemVRbXEvdDkwclJUczZKZ01VTEowOWM5cjRkcFRBWmJCZTI1REVCV0xW?=
 =?utf-8?B?VURHa0REdG1NZ1JaK2FxcjhRWXd5RDk1OGQxSW5nblB4a3BWbVQrS05jTnFL?=
 =?utf-8?B?ZTlZbWRSb2swQ2l2WTdBZnNGL0d1Q29EMWhPMGNCMDBXZVVQNDhTU0Q5dG5w?=
 =?utf-8?B?Z2lkWXFkUTJWaU5oeEJuTmovbjRSZ05WTVN0NlRaa0N2cHQ3STI4NXpETjFU?=
 =?utf-8?B?KzJGMks0K0grZk1SNTczOVY4U3NZRUx3bXlvMzl5a1l3SHBIaGliUkdJR1Jk?=
 =?utf-8?B?UDNRWlcwQzdTOXN3MG94Ni9HSlFPR0UzQUpnZ29yOE5ERU5VUUFVSndSbVho?=
 =?utf-8?B?UUhXM3VtNURIaWdmbC9JVWlwRXpKN1M0MFZLSi9nWG5UM2NIMEpWWXUvNVNV?=
 =?utf-8?B?MVBDck1DNUlmNGNKNlhHK3k5Tk5IMS9RQmxKRGZYb2IvcmZ0NGFRcUhiZSt2?=
 =?utf-8?B?aGlZMmZtNTZock96V1RqRlBjK0g2SHQ1WDljT1hLbk5hUFhoK3FqRXlPbFBD?=
 =?utf-8?B?bTF5VytOQnRoc1I3dVhvbWtnWnVHaUp4WTBKdU1La1JUYkVRWWZPT1ZFeEM0?=
 =?utf-8?B?SGpiM2RRK1VxaGlKY3ArMmQwNUhFU05HSk1YL1JyNzlvU0xpb2RyVG8vU2Nt?=
 =?utf-8?B?YmJ3TENlRmRGS3NwKzM2cmVPamtEV05BVm52ako1bjQwSVNSM0xGVEpzQWhC?=
 =?utf-8?B?T1RDRTh2QmVSRjR0RVh1Zm1DVDhKYmRuNjlrYmNCamF3d1o3V3ljRCtGd2VF?=
 =?utf-8?B?ZzRqbkUvVGRyQnJlUUZteElNY0t5cVJpeFIwTmUrVDg0VXRyUDg0OTNPY0Z3?=
 =?utf-8?B?M1Q3bGtrS0F1YXJNNG9xUUMvb0VsM08zaW9pQ0dJb2pvNzRVQ0VCUExlN3g2?=
 =?utf-8?B?NDVIeFJOa1dFczlOcXlWTXNrMDBBQnZaeXlScjcyUEFweitJUVB4YndZZ2U2?=
 =?utf-8?B?VlV5Skh1WmVRWVBRbTN4c1JIRjlmUlpIbUQyR044MHJSaXcwdmRsOWV1UnF2?=
 =?utf-8?B?RHpNOHQwaHVQeVBqZzRGNEdjUXdONzdsSkxGSEVyR1huN1ZMY0N1cjhSQk5W?=
 =?utf-8?B?SDcrcU9sUTVvQnZGeWM1Uzk5YUZsMndQTFZMa0x3SSttb2ViamxMVG41VEhE?=
 =?utf-8?B?dEVFNVYwRVF4dUtPYUpycGlJbHo4NkF3U21HSzRBKzVQbDlmMzB6ZWVvRGgv?=
 =?utf-8?B?UCs5VDBrSGNacWtUaW9YaUt1TzZhYWVXMThpUzlSQThtSjVicE0yY2sxQ25L?=
 =?utf-8?B?bElQUjNYZmpsWkY0WENFZmx6OE1nRHovMU5TYlA4ZS9acWYwRTQ4RnUzaE1x?=
 =?utf-8?B?ZFJhRkRwNEdvUStQUllFZjFtMXljRE5lTVNGY0pIK3ZtS21mU3FPa0xWVmEv?=
 =?utf-8?B?VkNORHZ3aERGckp5d01rdFZvNnpPZHVrM0h6ZEVpVndPNXhTbDhJeC9tT3d5?=
 =?utf-8?B?dThpaHhJc0dZV3R5M24ra0dYY0lZT2xpM0R2a2thdkI3QWdzRU5PWHE3WkJx?=
 =?utf-8?B?UHh1UHIrU05nL1BpOTQyK1hGdE1FVFhoWkplbkFSV0tHSzVDN0N1R09pY05T?=
 =?utf-8?B?cFlOTkZ6MXl2VDBCbEVHZ3VHUjQvOWtveVhROTZjaFNybUJNZ01yQTFlaUNz?=
 =?utf-8?B?bGhoS0VNSE5maVdRdU9rREUzZERnY3RvT2tjNDE5VkFZcEhvRHVvd0Qveklw?=
 =?utf-8?B?V1R6NHcyTitOZ1BOTFdkM1BFL3R6dUJ2SW5IblVEL0ZSUDFobm9lekZxUW95?=
 =?utf-8?B?VGk3bUg3YWNnTURpdHozK3MwR2RMYkhYellyekRwdHl1bU9LRlM3bWEvZDIw?=
 =?utf-8?B?elhGeDNJMHdBdEQ3SXN6MnBvYXE0NFh5ODQ4czFiUnEyaXFPRlpsWDZLajNv?=
 =?utf-8?B?ZDJrQ2JBMUwwUmpabFZaM2RzTDRUd2JJZDE4SGZUQ1QzV3RKNjNWRVYxQ1Fy?=
 =?utf-8?Q?uDu727V6Z/L2PTP0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3859B7FECBCDA04E909C3D37536F8C10@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ZHtVEa++wP0hCRoxWL5Vg/hDVT1mNmu/AT6X3ZqQlI7OMC01qWKsKK8naOd++axikj3x37LfO4YQw9SHcviq89LozKlLR5e+qKMCqeBvYduFFqQlPnhZsz7xpzi1VH/3k8vTi5qj76x7jdhWcund3USpp3YPgXnkqQ25i3EuwomCbAMahvdnZp9Uct9TmkMebQqaVoDmaIpE4Rr8WEuEb+lAvUooOCTABd3Y9Es9+rLvK7Ps+ottrnvTpzv2Bc4vtp7qAXUqBCz4FqviyLgb/FfpFxopgea/a7eiRrNCiyDBqVB6PyEbyTwFpgGywCUs3zxTFCqQ/Td8ZmlmairW9Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6471.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 909ddce7-d0b2-44cd-b750-08deb58236d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 08:40:00.2487
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SUNcqOgE2PihzfsJGFZuuWMD2JKVmsxqroCcKp4EqMVvEwbiCQ1lyGDucY6h8XCdVaQJ+j0+TdjfUb1GtsUskSC2ubCCtEBl83ayLIsBDqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR03MB9494
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_014014_554391_E46B73F2 
X-CRM114-Status: GOOD (  31.35  )
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

SGkgQW5nZWxvLA0KDQpUaGFua3MgZm9yIHRoZSBkZXRhaWxlZCBleHBsYW5hdGlvbi4gSSBub3cg
dW5kZXJzdGFuZCB5b3VyIGNvbmNlcm4gDQphYm91dCBiZWluZyBmdXR1cmUtcHJvb2YgYW5kIG1h
aW50YWluaW5nIGEgdW5pZmllZCBwbV9ydW50aW1lIGZsb3cuDQoNCkluIG91ciBjdXJyZW50IE1U
ODE5NiBEVFMsIHRoZXNlIFJURkYtbWFuYWdlZCBTTUkgY29tbW9uIG5vZGVzIA0KZG8gbm90IGhh
dmUgYSAncG93ZXItZG9tYWlucycgcHJvcGVydHksIGFzIHRoZSBwb3dlciBpcyBoYW5kbGVkIA0K
YXV0b21hdGljYWxseSBieSB0aGUgaGFyZHdhcmUuIA0KDQpJZiB3ZSBmb2xsb3cgeW91ciBzdWdn
ZXN0aW9uIHRvIGtlZXAgdGhlIHBtX3J1bnRpbWVfe2VuLGRpc31hYmxlKCkgDQpjYWxscyBidXQg
c2V0IGNsa19yZXF1aXJlZCA9IDAsIHRoZSBydW50aW1lIGNhbGxiYWNrIGZ1bmN0aW9ucyANCihz
bWlfY29tbW9uX3J1bnRpbWVfcmVzdW1lL3N1c3BlbmQpIHdpbGwgc3RpbGwgYmUgdHJpZ2dlcmVk
LiANCg0KVG8gYXZvaWQgYW55IHBvdGVudGlhbCBjb25mbGljdHMgd2l0aCB0aGUgUlRGRiBoYXJk
d2FyZSdzIGF1dG9tYXRpYyANCnJlZ2lzdGVyIHJlc3RvcmF0aW9uIGFuZCB0byBzYXZlIHVubmVj
ZXNzYXJ5IHNvZnR3YXJlIG92ZXJoZWFkLCANCkkgcHJvcG9zZSB0bzoNCjEuIFVzZSB0aGUgJ3J0
ZmZfbWFuYWdlZCcgZmxhZyBhcyB5b3Ugc3VnZ2VzdGVkLg0KMi4gU2V0IGNsa19yZXF1aXJlZCA9
IDAgd2hlbiAncnRmZl9tYW5hZ2VkJyBpcyB0cnVlLg0KMy4gQWRkIGEgY2hlY2sgaW5zaWRlIHRo
ZSBydW50aW1lX3Jlc3VtZS9zdXNwZW5kIGNhbGxiYWNrczogaWYgDQogICAncnRmZl9tYW5hZ2Vk
JyBpcyB0cnVlLCByZXR1cm4gaW1tZWRpYXRlbHkgd2l0aG91dCBwZXJmb3JtaW5nIA0KICAgYW55
IHJlZ2lzdGVyIGJhY2t1cCBvciByZXN0b3JhdGlvbi4NCg0KVGhpcyB3YXksIHdlIGtlZXAgdGhl
IHN0YW5kYXJkIHBtX3J1bnRpbWUgaW5mcmFzdHJ1Y3R1cmUgYXMgeW91IA0KcmVxdWVzdGVkLCB3
aGlsZSBlbnN1cmluZyB0aGUgc29mdHdhcmUgZG9lc24ndCBpbnRlcmZlcmUgd2l0aCB0aGUgDQpS
VEZGIGhhcmR3YXJlJ3Mgb3BlcmF0aW9ucy4NCg0KRG9lcyB0aGlzIHNvdW5kIHJlYXNvbmFibGUg
dG8geW91Pw0KDQpUaGFua3MsDQpYdWVxaQ0KDQpPbiBNb24sIDIwMjYtMDUtMTggYXQgMTI6MDIg
KzAyMDAsIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0KPiBPbiA1LzE4LzI2IDA5
OjE2LCBYdWVxaSBaaGFuZyAo5byg6Zuq55CmKSB3cm90ZToNCj4gPiBIaSBBbmdlbG8sDQo+ID4g
DQo+ID4gRmlyc3Qgb2YgYWxsLCBwbGVhc2UgYWNjZXB0IG15IGFwb2xvZ2llcyBmb3IgdGhlIGRl
bGF5ZWQgcmVzcG9uc2UuDQo+ID4gSQ0KPiA+IGhhdmUgYmVlbiBkZWVwbHkgb2NjdXBpZWQgd2l0
aCBNVDgxOTYgQWx1bWluaXVtIHBLVk0gU01NVSBhbmQgU01JDQo+ID4gcmVsYXRlZCB0YXNrcyBy
ZWNlbnRseS4NCj4gPiANCj4gPiBSZWdhcmRpbmcgeW91ciBxdWVzdGlvbiwgbXkgcHJldmlvdXMg
ZGVzY3JpcHRpb24gaW4gdGhlIHBhdGNoIHdhcw0KPiA+IG5vdA0KPiA+IGFjY3VyYXRlIGVub3Vn
aCBhbmQgbWF5IGhhdmUgY2F1c2VkIHNvbWUgY29uZnVzaW9uLiBJbiBmYWN0LCBub3QNCj4gPiBh
bGwgU01JIGNvbW1vbnMgaGF2ZSB0aGVpciBiYWNrdXAvcmVzdG9yZSBoYW5kbGVkIGJ5IHRoZSBS
VEZGDQo+ID4gaGFyZHdhcmUuIFRoZSBTTUkgY29tbW9ucyBhcmUgZGlzdHJpYnV0ZWQgYWNyb3Nz
IHZhcmlvdXMgc3Vic3lzdGVtcw0KPiA+IChlLmcuLCBtbWluZnJhLCB2ZW5jLCBkaXNwbGF5LCBj
YW0sIGV0Yy4pLiBDdXJyZW50bHksIG9ubHkgdGhlIFNNSQ0KPiA+IGNvbW1vbiB1bmRlciB0aGUg
bW1pbmZyYSBzdWJzeXN0ZW0gaXMgYmFja2VkIHVwIGFuZCByZXN0b3JlZCBieQ0KPiA+IHRoZSBS
VEZGIGhhcmR3YXJlLg0KPiA+IA0KPiA+IFRoZXJlZm9yZSwgSSBiZWxpZXZlIGFkZGluZyBhIHNw
ZWNpZmljICdza2lwX3JwbScgZmxhZyBpcyBtb3JlDQo+ID4gYXBwcm9wcmlhdGUgaGVyZS4gSWYg
d2Ugd2VyZSB0byBkaWZmZXJlbnRpYXRlIHRoaXMgYmFzZWQgb24gYSBuZXcNCj4gPiBNVEtfU01J
X0dFTjMgdHlwZSwgaXQgd291bGQgaW1wbHkgdGhhdCBhbGwgU01JIGNvbW1vbiBtb2R1bGVzIG9m
DQo+ID4gdGhhdCBnZW5lcmF0aW9uIHdvdWxkIHNraXAgdGhlIFJQTSBvcGVyYXRpb25zLCB3aGlj
aCBpcyBub3QgdGhlDQo+ID4gaW50ZW5kZWQgYmVoYXZpb3IuDQo+ID4gDQo+ID4gVG8gbWFrZSB0
aGlzIGNsZWFyZXIsIEkgcGxhbiB0byB1cGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlIGluIHRoZQ0K
PiA+IG5leHQgdmVyc2lvbiBhcyBmb2xsb3dzOg0KPiA+IA0KPiA+IFN1YmplY3Q6IG1lbW9yeTog
bXRrLXNtaTogQWRkIHNraXBfcnBtIGZsYWcgZm9yIGNlcnRhaW4gTVQ4MTk2IFNNSQ0KPiA+IGNv
bW1vbnMNCj4gDQo+IG1lbW9yeTogbXRrLXNtaTogQWxsb3cgbm8gY2xvY2tzIGZvciBSVEZGIG1h
bmFnZWQgU01JIGNvbW1vbnMNCj4gDQo+ID4gDQo+ID4gQm9keToNCj4gPiBPbiBNVDgxOTYsIGNl
cnRhaW4gU01JIGNvbW1vbnMgYXJlIGJhY2tlZCB1cCBhbmQgcmVzdG9yZWQgYnkgdGhlDQo+ID4g
UlRGRg0KPiA+IGhhcmR3YXJlIHJhdGhlciB0aGFuIGJ5IHNvZnR3YXJlLg0KPiA+IA0KPiA+IEZv
ciB0aGVzZSBzcGVjaWZpYyBTTUkgY29tbW9ucywgc29mdHdhcmUtY29udHJvbGxlZCByZWdpc3Rl
ciBiYWNrdXANCj4gPiBhbmQgcmVzdG9yZSBpbiB0aGUgcnVudGltZSBjYWxsYmFjayBpcyBubyBs
b25nZXIgbmVjZXNzYXJ5Lg0KPiA+IFRoZXJlZm9yZSwNCj4gPiBpbnRyb2R1Y2UgYSAnc2tpcF9y
cG0nIGZsYWcgdG8gYnlwYXNzIHRoZXNlIHJlZHVuZGFudCBSUE1vcGVyYXRpb25zDQo+ID4gZm9y
IHRoZXNlIFNNSSBjb21tb25zLg0KPiA+IA0KPiA+IFdoYXQgZG8geW91IHRoaW5rIGFib3V0IHRo
aXMgYXBwcm9hY2g/DQo+ID4gDQo+IA0KPiBUaGF0IHdvdWxkIGJlIGtpbmQtb2Ygb2ssIGJ1dCBr
ZWVwIGluIG1pbmQ6IHBtX3J1bnRpbWUgZG9lc24ndCBvbmx5DQo+IG1hbmFnZSBjbG9ja3MuDQo+
IA0KPiBJIHRoaW5rIHRoYXQgdGhlIGJlc3Qgb3B0aW9uIGhlcmUgd291bGQgYmUgdG8gYWxsb3cg
aGF2aW5nIG5vIGNsb2Nrcw0KPiBpbnN0ZWFkLA0KPiBhbmQgdG8gc3RpbGwgY2FsbCBwbV9ydW50
aW1lX3tlbixkaXN9YWJsZSgpIC0gYXMgdGhhdCB3b3VsZCBnZXQgYSBiaXQNCj4gbW9yZQ0KPiBm
dXR1cmUtcHJvb2YsIHNob3VsZCBhbnkgb3RoZXIgKG5ld2VyLCBvbGRlciwgZXRjKSBTb0MgbmVl
ZCB0bw0KPiBkZWNsYXJlIGFueSBwb3dlcg0KPiBkb21haW4gYnV0IHN0aWxsIG5vIGNsb2Nrcy4N
Cj4gDQo+IFNvIGF0IHRoaXMgcG9pbnQsIEkgdGhpbmsgdGhhdCBqdXN0IGRvaW5nIHNvbWV0aGlu
ZyBsaWtlOg0KPiANCj4gCWlmIChjb21tb24tPnBsYXQtPmhhc19nYWxzKSB7DQo+IAkJaWYgKGNv
bW1vbi0+cGxhdC0+cnRmZl9tYW5hZ2VkKSA8LS0tIG5vdCAic2tpcF9ycG0iDQo+IAkJCWNsa19y
ZXF1aXJlZCA9IDA7DQo+IAkJZWxzZSBpZiAoY29tbW9uLT5wbGF0LT50eXBlID09IE1US19TTUlf
R0VOMikNCj4gCQkJY2xrX3JlcXVpcmVkID0gTVRLX1NNSV9DT01fR0FMU19SRVFfQ0xLX05SOw0K
PiAJCWVsc2UgaWYgKGNvbW1vbi0+cGxhdC0+dHlwZSA9PSBNVEtfU01JX0dFTjJfU1VCX0NPTU0p
DQo+IAkJCWNsa19yZXF1aXJlZCA9IE1US19TTUlfU1VCX0NPTV9HQUxTX1JFUV9DTEtfTlI7DQo+
IAl9DQo+IA0KPiBzaG91bGQgYmUgc3VmZmljaWVudCAoYW5kL29yIGNoZWNrIHplcm8gcmVxdWly
ZWQgY2xvY2tzIGluDQo+IHNtaV9kdHNfY2xrX2luaXQpLg0KPiANCj4gQ2hlZXJzLA0KPiBBbmdl
bG8NCj4gDQo+ID4gVGhhbmtzLA0KPiA+IFh1ZXFpDQo+ID4gDQo+ID4gT24gVGh1LCAyMDI1LTAz
LTIwIGF0IDEzOjExICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubw0KPiA+IHdyb3Rl
Og0KPiA+ID4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9w
ZW4gYXR0YWNobWVudHMNCj4gPiA+IHVudGlsDQo+ID4gPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUg
c2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiA+ID4gDQo+ID4gPiANCj4gPiA+IElsIDIwLzAzLzI1
IDA4OjM2LCBYdWVxaSBaaGFuZyBoYSBzY3JpdHRvOg0KPiA+ID4gPiBNVDgxOTYgU01JIGNvbW1v
bnMgaXMgYmFja2VkIHVwL3Jlc3RvcmVkIGJ5IFJURkYgSFcuDQo+ID4gPiA+IEl0IGRvZXNuJ3Qg
bmVlZCBTVyBjb250cm9sIHRoZSByZWdpc3RlciBiYWNrdXAvc3RvcmUNCj4gPiA+ID4gaW4gdGhl
IHJ1bnRpbWUgY2FsbGJhY2suVGhlcmVmb3JlLCBhZGQgYSBmbGFnIHNraXBfcnBtDQo+ID4gPiA+
IHRvIGhlbHAgc2tpcCBSUE0gb3BlcmF0aW9ucyBmb3IgU01JIGNvbW1vbnMuDQo+ID4gPiA+IA0K
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBYdWVxaSBaaGFuZyA8eHVlcWkuemhhbmdAbWVkaWF0ZWsu
Y29tPg0KPiA+ID4gDQo+ID4gPiBTbyB0aGUgTVQ4MTk2IFNNSSBjb21tb24gZG9lc24ndCByZXF1
aXJlIGFueSBjbG9ja3M/DQo+ID4gPiANCj4gPiA+IFRoYXQncyBmaW5lIGZvciBtZSwgYnV0IHRo
aXMgbG9va3MgYmxvb2R5IHNpbWlsYXIgdG8gTVQ2OTg5J3MgU01JDQo+ID4gPiBjb21tb24sIHdo
aWNoDQo+ID4gPiBpcyBTTUkgR0VOMyBhbmQgbm90IEdFTjIuLi4uDQo+ID4gPiANCj4gPiA+IC4u
Li5zbywgYXJlIHlvdSBzdXJlIHRoYXQgeW91IG5lZWQgYSBgc2tpcF9ycG1gIGZsYWcgYW5kIG5v
dCBuZXcNCj4gPiA+IE1US19TTUlfR0VOMyBhbmQNCj4gPiA+IE1US19TTUlfR0VOM19TVUJfQ09N
TSB0eXBlcz8gOi0pDQo+ID4gPiANCj4gPiA+IFJlZ2FyZHMsDQo+ID4gPiBBbmdlbG8NCj4gPiA+
IA0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gICAgZHJpdmVycy9tZW1vcnkvbXRrLXNtaS5jIHwgMTEg
KysrKysrKystLS0NCj4gPiA+ID4gICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkNCj4gPiA+ID4gDQo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21l
bW9yeS9tdGstc21pLmMgYi9kcml2ZXJzL21lbW9yeS9tdGstDQo+ID4gPiA+IHNtaS5jDQo+ID4g
PiA+IGluZGV4IGE4ZjU0NjdkNmIzMS4uYjlhZmZhM2MzMTg1IDEwMDY0NA0KPiA+ID4gPiAtLS0g
YS9kcml2ZXJzL21lbW9yeS9tdGstc21pLmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9tZW1vcnkv
bXRrLXNtaS5jDQo+ID4gPiA+IEBAIC0xMjMsNiArMTIzLDcgQEAgc3RhdGljIGNvbnN0IGNoYXIg
KiBjb25zdA0KPiA+ID4gPiBtdGtfc21pX2NvbW1vbl9jbGtzW10NCj4gPiA+ID4gPSB7ImFwYiIs
ICJzbWkiLCAiZ2FsczAiLCAiZ2FsczENCj4gPiA+ID4gICAgc3RydWN0IG10a19zbWlfY29tbW9u
X3BsYXQgew0KPiA+ID4gPiAgICAgICAgZW51bSBtdGtfc21pX3R5cGUgICAgICAgdHlwZTsNCj4g
PiA+ID4gICAgICAgIGJvb2wgICAgICAgICAgICAgICAgICAgIGhhc19nYWxzOw0KPiA+ID4gPiAr
ICAgICBib29sICAgICAgICAgICAgICAgICAgICBza2lwX3JwbTsNCj4gPiA+ID4gICAgICAgIHUz
MiAgICAgICAgICAgICAgICAgICAgIGJ1c19zZWw7IC8qIEJhbGFuY2Ugc29tZSBsYXJicw0KPiA+
ID4gPiB0bw0KPiA+ID4gPiBlbnRlciBtbXUwIG9yIG1tdTEgKi8NCj4gPiA+ID4gDQo+ID4gPiA+
ICAgICAgICBjb25zdCBzdHJ1Y3QgbXRrX3NtaV9yZWdfcGFpciAgICppbml0Ow0KPiA+ID4gPiBA
QCAtNTQ3LDYgKzU0OCw5IEBAIHN0YXRpYyBpbnQgbXRrX3NtaV9kdHNfY2xrX2luaXQoc3RydWN0
DQo+ID4gPiA+IGRldmljZQ0KPiA+ID4gPiAqZGV2LCBzdHJ1Y3QgbXRrX3NtaSAqc21pLA0KPiA+
ID4gPiAgICB7DQo+ID4gPiA+ICAgICAgICBpbnQgaSwgcmV0Ow0KPiA+ID4gPiANCj4gPiA+ID4g
KyAgICAgaWYgKHNtaS0+cGxhdC0+c2tpcF9ycG0pDQo+ID4gPiA+ICsgICAgICAgICAgICAgcmV0
dXJuIDA7DQo+ID4gPiA+ICsNCj4gPiA+ID4gICAgICAgIGZvciAoaSA9IDA7IGkgPCBjbGtfbnJf
cmVxdWlyZWQ7IGkrKykNCj4gPiA+ID4gICAgICAgICAgICAgICAgc21pLT5jbGtzW2ldLmlkID0g
Y2xrc1tpXTsNCj4gPiA+ID4gICAgICAgIHJldCA9IGRldm1fY2xrX2J1bGtfZ2V0KGRldiwgY2xr
X25yX3JlcXVpcmVkLCBzbWktDQo+ID4gPiA+ID5jbGtzKTsNCj4gPiA+ID4gQEAgLTc4Myw3ICs3
ODcsNyBAQCBzdGF0aWMgaW50IG10a19zbWlfY29tbW9uX3Byb2JlKHN0cnVjdA0KPiA+ID4gPiBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gPiA+ICAgICAgICBjb21tb24tPmRldiA9IGRldjsN
Cj4gPiA+ID4gICAgICAgIGNvbW1vbi0+cGxhdCA9IG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YShk
ZXYpOw0KPiA+ID4gPiANCj4gPiA+ID4gLSAgICAgaWYgKGNvbW1vbi0+cGxhdC0+aGFzX2dhbHMp
IHsNCj4gPiA+ID4gKyAgICAgaWYgKCFjb21tb24tPnBsYXQtPnNraXBfcnBtICYmIGNvbW1vbi0+
cGxhdC0+aGFzX2dhbHMpIHsNCj4gPiA+ID4gICAgICAgICAgICAgICAgaWYgKGNvbW1vbi0+cGxh
dC0+dHlwZSA9PSBNVEtfU01JX0dFTjIpDQo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
Y2xrX3JlcXVpcmVkID0NCj4gPiA+ID4gTVRLX1NNSV9DT01fR0FMU19SRVFfQ0xLX05SOw0KPiA+
ID4gPiAgICAgICAgICAgICAgICBlbHNlIGlmIChjb21tb24tPnBsYXQtPnR5cGUgPT0NCj4gPiA+
ID4gTVRLX1NNSV9HRU4yX1NVQl9DT01NKQ0KPiA+ID4gPiBAQCAtODE0LDEzICs4MTgsMTQgQEAg
c3RhdGljIGludCBtdGtfc21pX2NvbW1vbl9wcm9iZShzdHJ1Y3QNCj4gPiA+ID4gcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQ0KPiA+ID4gPiAgICAgICAgfQ0KPiA+ID4gPiANCj4gPiA+ID4gICAgICAg
IC8qIGxpbmsgaXRzIHNtaS1jb21tb24gaWYgdGhpcyBpcyBzbWktc3ViLWNvbW1vbiAqLw0KPiA+
ID4gPiAtICAgICBpZiAoY29tbW9uLT5wbGF0LT50eXBlID09IE1US19TTUlfR0VOMl9TVUJfQ09N
TSkgew0KPiA+ID4gPiArICAgICBpZiAoY29tbW9uLT5wbGF0LT50eXBlID09IE1US19TTUlfR0VO
Ml9TVUJfQ09NTSAmJg0KPiA+ID4gPiAhY29tbW9uLQ0KPiA+ID4gPiA+IHBsYXQtPnNraXBfcnBt
KSB7DQo+ID4gPiA+IA0KPiA+ID4gPiAgICAgICAgICAgICAgICByZXQgPSBtdGtfc21pX2Rldmlj
ZV9saW5rX2NvbW1vbihkZXYsICZjb21tb24tDQo+ID4gPiA+ID4gc21pX2NvbW1vbl9kZXYpOw0K
PiA+ID4gPiANCj4gPiA+ID4gICAgICAgICAgICAgICAgaWYgKHJldCA8IDApDQo+ID4gPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gPiA+ID4gICAgICAgIH0NCj4gPiA+
ID4gDQo+ID4gPiA+IC0gICAgIHBtX3J1bnRpbWVfZW5hYmxlKGRldik7DQo+ID4gPiA+ICsgICAg
IGlmICghY29tbW9uLT5wbGF0LT5za2lwX3JwbSkNCj4gPiA+ID4gKyAgICAgICAgICAgICBwbV9y
dW50aW1lX2VuYWJsZShkZXYpOw0KPiA+ID4gPiAgICAgICAgcGxhdGZvcm1fc2V0X2RydmRhdGEo
cGRldiwgY29tbW9uKTsNCj4gPiA+ID4gICAgICAgIHJldHVybiAwOw0KPiA+ID4gPiAgICB9DQo+
ID4gPiANCj4gPiA+IA0KPiANCj4gDQo=

