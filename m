Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8E5C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 11:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HD8OwDXSFJhOIcXvFlJRdZVzctNybNccNcG7v6KE4tI=; b=I5enFApURTdxQbTMnMa5j57Pp7
	HfXf74/W17KziZPomINYmIhEIdfDLJO7WLACh9aXN9iXOYEzeCinV1F7oI50e/XHmzKEugq4HUtiu
	SQQ+8yihS62E2ncEfdjKvVeJ/umcb8XYS98zPVtE6qiHoG8rDmDE8SUAt42lr17e+7L3pG2z/XNUz
	wLfKrwMqjkuTUx2awAlV8rzE2uC1c8bRZQyXgpTiE01CojouOQ3UxLYAUcnpsutB2LPZHn9EGan+E
	CE2eIeeEWjGXI/tP/jDHoEnKospdQwnByQojTjiAEi8SfgpY6cJ0iZgBJtNrTp10D98M2OxgybwPw
	U61Cz+8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEndx-0000000CEuo-3l57;
	Tue, 13 May 2025 11:17:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEnbg-0000000CEaw-3gtC;
	Tue, 13 May 2025 11:15:44 +0000
X-UUID: 921bb5f82feb11f08d385d50fb11b32d-20250513
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=HD8OwDXSFJhOIcXvFlJRdZVzctNybNccNcG7v6KE4tI=;
	b=HRTWUxiZ8gAy6bdj9uSRviuVqtGlifATd000yyQ0vGac3uR6M6FQ7r88HSylu4olv/kmZqBjSQqROMTdTkb1Ug5QAHiQLulwAiQ4/DMMUj1Aj5oaMdwLd1vMjtyB7vn4OiauuMIuDoqYNeN6CxHLQ9K7jM9QZLILVbSrzGvErLQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:7e005d7f-7f9b-4292-b4fd-97e8fd890044,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:bf887951-76c0-4e62-bb75-246dfb0889c6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:80|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 921bb5f82feb11f08d385d50fb11b32d-20250513
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1657125450; Tue, 13 May 2025 04:15:26 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 13 May 2025 19:15:23 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 13 May 2025 19:15:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ayc3My5b6cGRTH1+oyP8nr2hHrvwg//AqGmOVytmwJ1RmAWMm+BBO3+Nwm/NtaCRCW2L763ej00BKJygIxc7dxyEDFb1LFnLUQwo3tsH+GeRTbChCGSCcTkX5ZraCInVjYkMz3ixKTTdg8Of3oNC8+qaA3NSMcHm+3/5wXQ6ElVfsae1QRwGOMrVcgyFWNcyiVomS83KRuQddd0IkYT1xyBOYpY5v3x0SX5GzmkS8KWFsf0X/HNJAjfIZVCvNmx/pIHHRVKkFSkmDbbvG7qWssST9FSH3s0Rxob1TaIn6OVfI35+k1S6B3XdgFzfMEyd9cDRSe/fauwSAWtRz3AEIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HD8OwDXSFJhOIcXvFlJRdZVzctNybNccNcG7v6KE4tI=;
 b=l+GwoT3sTUt2Nb+kbNQCRpvARxNovfNY6c2TAsw5nmfEFvUcOP6q8iyzAdw/p2dUyP12trW+GEMdq+z1NtUMT54cN6YodeghILsiZ+5K4Q7xxd92PPVegYZKqLcFF0MkInFM5DzF/GXsi2/gQBfguJRWfvQrwYRdZ6JGsd9rGWmkSpOEoAlMOVvQsGqeC2qo4CggZcPt4seeQr26gRPYbn8YGxp6a0XU/sAlvUzUKRN5Q8Z0GLVfqyRTmWK+vAbvfE1sl2hXVGI+pCpQ3can7QPLi9qBSvHjs9VYBNxOU9Ojh9BV9gDVvbnr0UOMi0Wxw97DtIVw7H+dMFmvoFSEkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HD8OwDXSFJhOIcXvFlJRdZVzctNybNccNcG7v6KE4tI=;
 b=WprlUV1Q+9tkDN/uUqUB0O1iuXOFyEVO0ShIlLZH8Uo0uxvQGxO08ds6puXvL37hXN/9+v0nY+tkNlYXCRc1F93AMzpf6gmbnH063/kxAdm6rGyRqlkneaWQwLTsM+6Jn9fSmd7Yp66k6/8+AlM36nJOeZnYBzWMLv2Bw6NfOzU=
Received: from KL1PR03MB6226.apcprd03.prod.outlook.com (2603:1096:820:8c::14)
 by PUZPR03MB7090.apcprd03.prod.outlook.com (2603:1096:301:112::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 11:15:20 +0000
Received: from KL1PR03MB6226.apcprd03.prod.outlook.com
 ([fe80::f3:c11:8422:7ce3]) by KL1PR03MB6226.apcprd03.prod.outlook.com
 ([fe80::f3:c11:8422:7ce3%3]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 11:15:20 +0000
From: =?utf-8?B?U2t5TGFrZSBIdWFuZyAo6buD5ZWf5r6kKQ==?=
	<SkyLake.Huang@mediatek.com>
To: "andrew@lunn.ch" <andrew@lunn.ch>
CC: "dqfext@gmail.com" <dqfext@gmail.com>,
	=?utf-8?B?U3RldmVuIExpdSAo5YqJ5Lq66LGqKQ==?= <steven.liu@mediatek.com>,
	"davem@davemloft.net" <davem@davemloft.net>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"edumazet@google.com" <edumazet@google.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>, "hkallweit1@gmail.com"
	<hkallweit1@gmail.com>, "daniel@makrotopia.org" <daniel@makrotopia.org>,
	"horms@kernel.org" <horms@kernel.org>, "kuba@kernel.org" <kuba@kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
Subject: Re: [PATCH net-next v2 3/3] net: phy: mediatek: add driver for
 built-in 2.5G ethernet PHY on MT7988
Thread-Topic: [PATCH net-next v2 3/3] net: phy: mediatek: add driver for
 built-in 2.5G ethernet PHY on MT7988
Thread-Index: AQHbgqn0+oUccgrII0yLc8X4a8i6V7NOXWgAgArSKgCAAHDvAIB3SsqA
Date: Tue, 13 May 2025 11:15:20 +0000
Message-ID: <034a4ef542aec33a8ef44599114749ebd6af8ec5.camel@mediatek.com>
References: <20250219083910.2255981-1-SkyLake.Huang@mediatek.com>
	 <20250219083910.2255981-4-SkyLake.Huang@mediatek.com>
	 <Z7WleP9v6Igx2MjC@shell.armlinux.org.uk>
	 <5fae9c69a09320b0b24f25a178137bd0256a72d8.camel@mediatek.com>
	 <73080f10-5077-4165-9fe8-e2ccca497feb@lunn.ch>
In-Reply-To: <73080f10-5077-4165-9fe8-e2ccca497feb@lunn.ch>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB6226:EE_|PUZPR03MB7090:EE_
x-ms-office365-filtering-correlation-id: aa9b1a72-05bc-43da-cf2b-08dd920f72e5
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SkF2djROZFFoN1oxSGZ6UGpyLzFaN3lrTlB6N0xxZWRyQlFEdndyZ2dob1dC?=
 =?utf-8?B?V3czV3JvcEQ4NnQrUHJQVmlrM2wwQktMTUFjeDZha2xsNERyOUJIMzc1NjNa?=
 =?utf-8?B?aXV5WDN6dmVvc1hOdytTaWYrN0tpVGpQT3J2ZDZqS1ZNOE9TbGRHZmUzVHB0?=
 =?utf-8?B?ZUJreXRmTXkvcXpiaERCOTdLZUxYbGswbDZHUXZZbXRiS0VSY2Z2NXVISjdt?=
 =?utf-8?B?MWk1ZUNXNVc3Ny9QbkZBcmtYSUNlNTVmNmRMWWFlTG1QYktFYjMxc3diQ1BH?=
 =?utf-8?B?QUJIR1ZKNzZvWkw5NUVsWm8wUS8yKzU1N0ljL2h5TUwvVXJOQVVtdjljTHI5?=
 =?utf-8?B?WGJZTHJFK2JGSU9TcmpoU2N2MU5WVmM2ckIycEJWSXdwSytZN2tTQ2lZcUZZ?=
 =?utf-8?B?M2hvdEg3ZW12RmZIdUFNUVV2aFh1V2JTTFNwY3kwRVk4T1V4Y1E5VFZUR0E4?=
 =?utf-8?B?R1Nkb2RMZmVQdXZoaGF1YW5kZHU2QTBOSVVvZ3dYckt0eFY2a0VpQnYzV0Zs?=
 =?utf-8?B?bnpNSDB0Y1lWVnpsVnRVbUtaWEVEZG9xMVU1UXppMXR0K1FHclRabzZaU3Rz?=
 =?utf-8?B?ZjczT2N2ZVovMVRocnpJeXF5Yi9BVC9QSUF4RlUvNXVOZmtXZVUyVU50V3p1?=
 =?utf-8?B?SDlodzhGRzduZWtrK2NjUDZsV1B6MGEyVHVJc29rUlNvakYzeGt4djlLd2VB?=
 =?utf-8?B?WXNrL1VLT1R1L1NyaXZDVHFkVGg5SW14VXpyQXZOS042bWkxemg0NTFFNTVu?=
 =?utf-8?B?UUxpVWl2YzBFZzJ5YUlrckNab3F6UldxUStJYkhkbjVwU0JFeW5kNHlPS0FI?=
 =?utf-8?B?SnNzVno5N3RVUE9MRytmaFpjQzZYSjM2SlQzemNVaEZ3cUxOMit1SkZxUGht?=
 =?utf-8?B?b2FEWmh4bTJnUXRhdTVQbS84VzdjeDh5c0ZYR2J2RHMwS3BIelMxSVN3ci9Z?=
 =?utf-8?B?Wi8xbThUc3FINU9ER1FjUHVNM3hKWHJBcTN6VFRIZXRIZWFSdUZNUlZoazdJ?=
 =?utf-8?B?SWRTYUxoT1Y3cjFBdTlvcitNSzNuNUc1ZmtPRVBwYmt3L2ErWGttR1M1N25z?=
 =?utf-8?B?eGxWU0VtWWZEajRURWdLd0h4V1d4dXJnNXFVSGNreEJtRndGN1lBZWV3YmZJ?=
 =?utf-8?B?YmRDanVFYTZlaVg1cmorR01CNzVINTdPOUN6alJML1ZrbzRqemF5QUkzTFRv?=
 =?utf-8?B?bHl1YU1WVzFzRFZzVm81QXJ5cFJtNkNmbWZzeU0xYXB2REh4VzgwN3NkS0lz?=
 =?utf-8?B?YjhmdWZ4N0NKd2hPVlNRaDRVWmhwVzAzRUpweWRtcnhVeXdtWi9zNXd2UnF5?=
 =?utf-8?B?WER4YVBVRHduTTZwaGR2ZnBoM2N5Q1VPRDBUcUtvalRJeWZveUR0VWxuU1hv?=
 =?utf-8?B?YjRPV1JKY0pPK2ljM01XdjZhZ2tGYVBYRTBEUU1DK2ppN2JpZUlOSVRCR29u?=
 =?utf-8?B?eENEczZVbHQ5UFZVajhkM0UwNkJ5TlBUM2dVL3VaSXRJSzdYYkRFcTJlVWdR?=
 =?utf-8?B?TjJrSDBYaTVpNmFucHM1NTdwMmw1VlcyR0RVUW1IemQybkRKNkZVd1F1RCtn?=
 =?utf-8?B?NGZ1cU9DUTlHd0RycURNc1drdllrOElXbzcyL2ZDazI5Z1NWTG1jbXBOaGVN?=
 =?utf-8?B?UjdQUVMyaXZlNmdTWHNPWUc5ZWhMRzc5REJBUGZOb3M1YUk1SFBET3RReFhw?=
 =?utf-8?B?S3A4SFU0NmlqS2ZLZVVyUGs5U0Q5b3FyakVRbHloZ0svY0lqU3NWYTBlc2NU?=
 =?utf-8?B?VDNISHBWclRzSXd2T2pFdHRUeWhFVnhPWHJjTFVOMk0yTmNOTTJGaUdhOGNF?=
 =?utf-8?B?aThEeENXeEw4aGpTT2p5eEZkV2t3elk0bUpHMHErcUN2dFBWaWxydnZZOWpO?=
 =?utf-8?B?SnJOQlgyVURkOFVmaW9VR29tN3JpSElZZHo5M1JMdHordjV3UVY4a1JnY3Zi?=
 =?utf-8?Q?kV/BRXma5SA1RN+Phv/dNFBXmY+eShpv?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB6226.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aG5sWUYxcVZpSEFYYnA1aGhydE5RZHNoSDFUejVGNkZJQ2Ywb0lzRXB5bXEy?=
 =?utf-8?B?L1ZEOXFhaFlpMFZ1STlaa2E1eXdMTndFUThlZy9RWUdMamJyUGIvQVZRQTF0?=
 =?utf-8?B?ZVJGRUZlL3lCNStaUmo3elhiZHJld3BVK2ZYY1MwWkdpVklaOUtDUGprVW5D?=
 =?utf-8?B?UENBZnRPVUxrOCt1cTQzdDhndSt4cmFicjM1MnFycGFTRFZwMjM2MndxSGVn?=
 =?utf-8?B?cURMSmlPanI1Z1BlTnBNUnk2RXo2Ym5ua2JtMmIxZ09MZUZTZjlZRkZjeVYr?=
 =?utf-8?B?YmhKZWYzTU5wSjZ5V3RiLzQzM2pPcFhBTWQ0dnhDNDdBQnhiTW9PY21heVAv?=
 =?utf-8?B?VVNYZjdWVmFDMnNXYVczVDdjTUZsU1lzeGNOWHdMVlFkeURlekhROVp6dndH?=
 =?utf-8?B?TmRnc2RpbC9ZVExXekZSVTJwU0g5Y1dXWUs1NHlYeHdqMjEwU0JUNlh1TE12?=
 =?utf-8?B?RzVyWVZHeDAzQnZ3Y3FPSVY1TDVSMjRDcmNNV282ZXdrY2QyY1I2SzIxZHNy?=
 =?utf-8?B?UEpQQnhQeXNxaVQvQTFSbERKMm41UjZiUm55TDJXdGlJWGhjWEJza2poaUQw?=
 =?utf-8?B?R1gvQkZqcjZyTGNweHJjNkx5UDJlc3hGZ2wyS2VtNklERExTL0YxNWNGT3lt?=
 =?utf-8?B?bG5NNklTU3pETmxqVis1TUo3OU1jeFpnYXc1UmdsUmgxSzFjNnRjMkNmU1dx?=
 =?utf-8?B?eWxEVm4wSjJaSEdIenhjSTl4d3ZSWEt1ZnJjdFFMY2lzRDRJa2lGYkUyMGpH?=
 =?utf-8?B?bmtJK1hPWFRlWllCVFNTYmJTeFBtS0xkWmlMVFpNL1dkZHhKT3A1REdqZ0py?=
 =?utf-8?B?TXNkR2VJMDBISHBuYzEyNGV0dGFpbm9DempwdjBjenFWY0FCTGl1NTNvTm1U?=
 =?utf-8?B?d0JNaGpydGRpTjUvMlJvV0lUMWt6ZUZCUnczZ0RveEJPeHR1Sk0yRUFOZE1a?=
 =?utf-8?B?QUlVM1Z6V3krZW1SVlcvTUlBUnhIOVZBcDkwajYzbXQ5bWt5M1ZiWFdIenpv?=
 =?utf-8?B?TXRSVGJLMmpoeUpkRXJrRWpER0hSbUJGZURZZFM4NzVpaXcvMGpWbXVUWEw2?=
 =?utf-8?B?NExrU3ZidDlObC9oUGpPMjRDYzkwaTFHcG9ROEEyNzZHTU9OVVVTZGVPaUlZ?=
 =?utf-8?B?WmZUMi9maWFVWGtnL21hVFB1dSs1RFljTzNTcGFaazgvN3Q3YVVZeDc1b3NC?=
 =?utf-8?B?TFVEd1dBU0Q4V0VIUTZXN0g2eDRBVWhUMy9ON1RYRWhPUXpFZFNpRXBhQTRq?=
 =?utf-8?B?aGREN0pXK1RwRlB0UXdoQnlOR2dBTDFpTDgwTDROUVhPQjRqRUMzYVg3cUx6?=
 =?utf-8?B?dXBKM2xaVWJxQXZxU3BlbGxBNUk2c3FUcktmbDhrb2ozby9HRW8yTk4vd3RJ?=
 =?utf-8?B?WmpGbFZNazJKZzJHajl5MnFOR0VjdlJhNWFjZWRPWU1ucHorZ0V3OUN4SUZP?=
 =?utf-8?B?TFR2djkxdGJZM1B3dldra3pVdFRETFg1MllMSjRJKzBGOFBQdjA3ZFV1aHky?=
 =?utf-8?B?c2lJRXdicm14d0ttY0QvRHMwUlA1V1FUT3h3VWZnVkhrb2RsZ1E4RW52Wkxp?=
 =?utf-8?B?dVlnNzBsQy9tRjlta0FDWEU4dFp1NVVsVGFDNHZZZ09QVWdBdy9qdnY5WUYr?=
 =?utf-8?B?L2cxcWZIZjJBajBmMFNOcUVmelJxN2QzZml6UUQxOHM0bG12N0R2K0pqcWZ3?=
 =?utf-8?B?anpaUWhiQmsyL1VJZmpoUkg1L1dNMGp6ZGk3Sm1xM1Zxa1ZRejE5dlBGV1M4?=
 =?utf-8?B?NnZNbWlvSyt1cjJKcEdKZXpvV1RjbTBLMkF0UG14d0xWME1CTWlNUFo3Sk55?=
 =?utf-8?B?S2sxUVFWSjVsRGE5UmpvR05wU0cxZnZETGRqcnNOVG44N2FjdWJUdmNmRXhi?=
 =?utf-8?B?ZWFvaUxZcjRHd3VDZlBydVpyOVVqaE00QWxxeUZGVUJvaFk4ejBxek5KdlM4?=
 =?utf-8?B?cEJUMVY3MzlXQ1F5S3J6RWNCV0tBRm9nbkJNZmNLbFpCV2lBT3NpT1VUTXBI?=
 =?utf-8?B?ck1aNy9qREV0bDBDbmNuRkM2a296aTFyT2FXOTN6MnpycGxmQXorSTg1Wi8z?=
 =?utf-8?B?cWFjRy9jeGtPcjVzY0oyZUFBdXpFbEY5V0lpQ2N4anhMZXVqTmZQUUxjKzFE?=
 =?utf-8?B?eU1QRE9RUHlpcEVEVlZldG1aUi90U3JBYlprNVNuU1BWOU9KNjFMKytpUko0?=
 =?utf-8?B?c3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <69E25701E8E6C148B13AB6F3A99CBDFE@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB6226.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa9b1a72-05bc-43da-cf2b-08dd920f72e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2025 11:15:20.5738
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wg59//QiVktSB4P5P2uYzTZFXvP2Q+CO8BH+K1cJjVbsO9U/r47+97bef28pAs1IPfmBNVDlH0+dcP9NKyb6fbKJp2RPWGLyo8Xm7GpRLh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_041534_407517_5A902654 
X-CRM114-Status: GOOD (  20.59  )
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

T24gV2VkLCAyMDI1LTAyLTI2IGF0IDE0OjMyICswMTAwLCBBbmRyZXcgTHVubiB3cm90ZToNCj4g
DQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0
dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNv
bnRlbnQuDQo+IA0KPiANCj4gT24gV2VkLCBGZWIgMjYsIDIwMjUgYXQgMDY6NDg6MzRBTSArMDAw
MCwgU2t5TGFrZSBIdWFuZyAo6buD5ZWf5r6kKSB3cm90ZToNCj4gPiBPbiBXZWQsIDIwMjUtMDIt
MTkgYXQgMDk6MzMgKzAwMDAsIFJ1c3NlbGwgS2luZyAoT3JhY2xlKSB3cm90ZToNCj4gPiA+IA0K
PiA+ID4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4g
YXR0YWNobWVudHMNCj4gPiA+IHVudGlsDQo+ID4gPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2Vu
ZGVyIG9yIHRoZSBjb250ZW50Lg0KPiA+ID4gDQo+ID4gPiANCj4gPiA+IE9uIFdlZCwgRmViIDE5
LCAyMDI1IGF0IDA0OjM5OjEwUE0gKzA4MDAsIFNreSBIdWFuZyB3cm90ZToNCj4gPiA+ID4gK3N0
YXRpYyBpbnQgbXQ3OTh4XzJwNWdlX3BoeV9jb25maWdfaW5pdChzdHJ1Y3QgcGh5X2RldmljZQ0K
PiA+ID4gPiAqcGh5ZGV2KQ0KPiA+ID4gPiArew0KPiA+ID4gPiArwqDCoMKgwqAgc3RydWN0IHBp
bmN0cmwgKnBpbmN0cmw7DQo+ID4gPiA+ICvCoMKgwqDCoCBpbnQgcmV0Ow0KPiA+ID4gPiArDQo+
ID4gPiA+ICvCoMKgwqDCoCAvKiBDaGVjayBpZiBQSFkgaW50ZXJmYWNlIHR5cGUgaXMgY29tcGF0
aWJsZSAqLw0KPiA+ID4gPiArwqDCoMKgwqAgaWYgKHBoeWRldi0+aW50ZXJmYWNlICE9IFBIWV9J
TlRFUkZBQ0VfTU9ERV9JTlRFUk5BTCkNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCByZXR1cm4gLUVOT0RFVjsNCj4gPiA+ID4gKw0KPiA+ID4gPiArwqDCoMKgwqAgcmV0ID0gbXQ3
OTh4XzJwNWdlX3BoeV9sb2FkX2Z3KHBoeWRldik7DQo+ID4gPiA+ICvCoMKgwqDCoCBpZiAocmV0
IDwgMCkNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Ow0KPiA+
ID4gDQo+ID4gPiBGaXJtd2FyZSBzaG91bGQgbm90IGJlIGxvYWRlZCBpbiB0aGUgLmNvbmZpZ19p
bml0IG1ldGhvZC4gVGhlDQo+ID4gPiBhYm92ZQ0KPiA+ID4gY2FsbCB3aWxsIGJsb2NrIHdoaWxl
IGhvbGRpbmcgdGhlIFJUTkwgd2hpY2ggd2lsbCBwcmV2ZW50IGFsbA0KPiA+ID4gb3RoZXINCj4g
PiA+IG5ldHdvcmsgY29uZmlndXJhdGlvbiB1bnRpbCB0aGUgZmlybXdhcmUgaGFzIGJlZW4gbG9h
ZGVkIG9yIHRoZQ0KPiA+ID4gbG9hZA0KPiA+ID4gZmFpbHMuDQo+ID4gPiANCj4gPiA+IFRoYW5r
cy4NCj4gPiA+IA0KPiA+ID4gLS0NCj4gPiA+IFJNSydzIFBhdGNoIHN5c3RlbToNCj4gPiA+IGh0
dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL3d3dy5hcm1saW51eC5vcmcudWsvZGV2
ZWxvcGVyL3BhdGNoZXMvX187ISFDVFJOS0E5d01nMEFSYnchaVYtMVZpUEZzVVYtbExqN2FJeWNh
bjhuZXJ5NnNRTzN0Nm1rcGRsYl9HVzhoc3doeGM0ZWpKb3p4cWtVM3MyV3p4U2l6czRrZmRDNzd5
cjdIR0dSSXVVJA0KPiA+ID4gRlRUUCBpcyBoZXJlISA4ME1icHMgZG93biAxME1icHMgdXAuIERl
Y2VudCBjb25uZWN0aXZpdHkgYXQgbGFzdCENCj4gPiBIaSBSdXNzZWxsLA0KPiA+IG10Nzk4eF9w
NWdlX3BoeV9sb2FkX2Z3KCkgd2lsbCBvbmx5IGxvYWQgZmlybXdhcmUgb25jZSBhZnRlciBkcml2
ZXINCj4gPiBpcw0KPiA+IHByb2JlZCB0aHJvdWdoIHByaXYtPmZ3X2xvYWRlZC4gQW5kIGFjdHVh
bGx5LCBmaXJtd2FyZSBsb2FkaW5nDQo+ID4gcHJvY2VkdXJlIG9ubHkgdGFrZXMgYWJvdXQgMTFt
cy4gVGhpcyB3YXMgZGlzY3Vzc2VkIGVhcmxpZXIgaW46DQo+ID4gaHR0cHM6Ly91cmxkZWZlbnNl
LmNvbS92My9fX2h0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRp
YXRlay9wYXRjaC8yMDI0MDUyMDExMzQ1Ni4yMTY3NS02LVNreUxha2UuSHVhbmdAbWVkaWF0ZWsu
Y29tLyoyNTg1NjQ2Ml9fO0l3ISFDVFJOS0E5d01nMEFSYnchbkVKQXFXcTllU1B5dkQ0c2lrZzBE
S3FOQ1U1T1BHQ0p4NDJKNm11VTFkV3JIc05saUE0QlIxT1U3cl9YQmY1M09DMDJHcGhFMW9kSUlZ
VFQ2Njg3JA0KPiA+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL3BhdGNod29y
ay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvMjAyNDA1MjAxMTM0NTYu
MjE2NzUtNi1Ta3lMYWtlLkh1YW5nQG1lZGlhdGVrLmNvbS8qMjU4NTcxNzRfXztJdyEhQ1RSTktB
OXdNZzBBUmJ3IW5FSkFxV3E5ZVNQeXZENHNpa2cwREtxTkNVNU9QR0NKeDQySjZtdVUxZFdySHNO
bGlBNEJSMU9VN3JfWEJmNTNPQzAyR3BoRTFvZElJYzJ0T19ZaSQNCj4gDQo+IElkZWFsbHksIGFs
bCBQSFkgZHJpdmVycyBzaG91bGQgbG9vayBsaWtlIGVhY2ggb3RoZXIuIFRoYXQgbWFrZXMNCj4g
bWFpbnRlbmFuY2Ugc2ltcGxlci4gQ3VycmVudGx5LCBhaXJfZW44ODExaC5jLCBhcXVhbnRpYV9t
YWluLmMsIGFuZA0KPiBxdDIwMjUucnMgbG9hZCBmaXJtd2FyZSBpbiB0aGVyZSBwcm9iZSBmdW5j
dGlvbi4gSXMgdGhlcmUgYSBnb29kDQo+IHJlYXNvbiB0aGlzIGRyaXZlciBuZWVkcyB0byBiZSBk
aWZmZXJlbnQ/DQo+IA0KPiDCoMKgwqDCoMKgwqAgQW5kcmV3DQogIEFjdHVhbGx5LCBJIHdyb3Rl
IGZ3IGxvYWRpbmcgZmxvdyBpbiAucHJvYmUgYXQgZmlyc3QuIEhvd2V2ZXIsIGR1cmluZw0KYm9v
dCB0aW1lLCAucHJvYmUgaXMgY2FsbGVkIGF0IHZlcnkgZWFybHkgc3RhZ2UgKGFib3V0IHRoZSBm
aXJzdCAycw0KYWZ0ZXIgYm9vdGluZyBpbnRvIExpbnV4IEtlcm5lbCkuIEF0IHRoYXQgdGltZSwg
ZmlsZXN5c3RlbSBpc24ndCByZWFkeQ0KeWV0IGFuZCBwaHkgZHJpdmVyIGNhbid0IGxvY2F0ZSAv
bGliL2Zpcm13YXJlL21lZGlhdGVrL210Nzk4OC9pMnA1Z2UtDQpwaHktcG1iLmJpbi4gQWxzbywg
YWRkaW5nICItRVBST0JFX0RFRkVSIiBkb2Vzbid0IGhlbHAuDQogIEknbSBub3Qgc3VyZSBob3cg
YXF1YW50aWEgYW5kIHF0MjAyNSBkcml2ZXJzIGhhbmRsZSB0aGlzLg0KDQpCUnMsDQpTa3kNCg==

