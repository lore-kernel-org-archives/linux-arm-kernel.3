Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D2DC3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 11:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wl5Fi7h3OsJQu2lCB6cDdU7uevEZCl/0b+CgLOHl8wo=; b=xik18CeVgTIuGCX+/cHpQmj4ZX
	MKl6NdUZbdaOYb/sihYIM2+7mLAtytGxuYKgcB2w/dqCj/GdZ7sfbGlBxdVhJ8flg3Ha0jRsPrmvB
	LWQ6oIHeBoWLFXWUVWy50oTW2h6hMP2b8g8wpvZB1xR7PDpD0Cfo5HWmOUDVSaR8i8E/YEIpEPz3k
	+hzpkIN6wsauPYaSQy2Tj4VOoIvuW6mlZA50PnrNLgFbUvfQBCaHiQWhwsPwNzUYN9kJ6UT8qiR63
	tSqR1A7FbQm5PnZppA063C5EvGN7w+N+d0A4JcdsQypaMNo6bvMMclk0cFAxDcnUHOklSIjcNHSEN
	3anfUWWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEnbd-0000000CEZf-3I7U;
	Tue, 13 May 2025 11:15:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEnZU-0000000CEBm-2qeS;
	Tue, 13 May 2025 11:13:18 +0000
X-UUID: 4249b64c2feb11f0bed96b30c12bc3d6-20250513
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=wl5Fi7h3OsJQu2lCB6cDdU7uevEZCl/0b+CgLOHl8wo=;
	b=TMjR0FaCiM026EhTqEF4WK2tgyNtCS4PjatIahPa7kJ97fBSB1fxyuw9xoyy1Fd8yoWWUCSNtnLt6Vv6WblJUfeODs0mgi7balNQRaEJ/Fmzt4PIUPkNzQUqNvTCi9Pw9Tet3P3LcLHTZ++NwtfZnUzCaOrabBiwjeyBks8LkBY=;
X-CID-CACHE: Type:Local,Time:202505130356-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:ff70befc-186a-4f3f-aef3-9dd3872d044f,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:5183a8b7-5e6b-4d0f-a080-a5e9cb36bea6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4249b64c2feb11f0bed96b30c12bc3d6-20250513
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 822293993; Tue, 13 May 2025 04:13:12 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 13 May 2025 19:13:08 +0800
Received: from OS8PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 13 May 2025 19:13:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OS6oJl9x3g4ZsAq2uqqMBl025zSgKtfIaj8X2ryS0+FCepQm+4gVonMChsJ+lrcCh/p+0cV8xQ8ITxWWjvbpo8c9YJU33ku08PafA5OHIq/yUcfcnwfIZqZPueVvaut3MkBKQbNxnfRzdRfofcOET6bqcF6xq0b/RaHjifI8lGNdOjvDawSBWChzRDuVxtqWxBkaIP27p0L0qLto/C/xOdabGWmaEYDZiJcuN+qTUOf0YhatiZxOkY6aw6Fsli5yEqRWbytRCzDJc3UQenbLVuDS5K2bqJuUUAY4cSgt9OIgik+Iy1cMebn/CpSd6R5BH6J2yjyj6TXFhxOFJ3Qi8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wl5Fi7h3OsJQu2lCB6cDdU7uevEZCl/0b+CgLOHl8wo=;
 b=M3hcsLf1+eqBiMw4AtL7XvdwwwHAfhQ7/6lb491HUe0xjoKn2cFWTbBGiDuIykf3LMyH06lOMASvq8fC9hD6q7g8IfjG6Tg+CUIj/C9ZV8Now30WrOXkIgWw/Y//rdPuXFHBk03trlLHK7dj0rWVJB2d0io4JpYmlLReWYz58I0pxQFU5sk/d4OzMywG+RsfnDjgr2STE7xcZhz4XS7D/Ph1bCWOgSMW6CEEihwR4qbVYsF7ZaqsDUKSyoZtA1fCYlYlxHYlouF1Sqn2gDWmGR2p4tTBkcYjF2pVEs+cFaAdYRg3JAt73W25+KAi5L/WssuzYre9MSakh2K017NhiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wl5Fi7h3OsJQu2lCB6cDdU7uevEZCl/0b+CgLOHl8wo=;
 b=Y7OcjAoeqlTsWy3rxMl4A43c2y7oWUzpF3LhDUaIKZCCxFsRZJUt7pF5hsv4LQJKo04XagY+FPcpCsJGNg46bRN3NXJsktn0DfdzK2NH0x/JrwfUbB0F1+G6Ue7U80l0V9BB49j5aLV6Dtmt0hDZWdsuRsSW6U2a3X2Sc5xsZS0=
Received: from KL1PR03MB6226.apcprd03.prod.outlook.com (2603:1096:820:8c::14)
 by TYZPR03MB8133.apcprd03.prod.outlook.com (2603:1096:400:45a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 11:13:06 +0000
Received: from KL1PR03MB6226.apcprd03.prod.outlook.com
 ([fe80::f3:c11:8422:7ce3]) by KL1PR03MB6226.apcprd03.prod.outlook.com
 ([fe80::f3:c11:8422:7ce3%3]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 11:13:05 +0000
From: =?utf-8?B?U2t5TGFrZSBIdWFuZyAo6buD5ZWf5r6kKQ==?=
	<SkyLake.Huang@mediatek.com>
To: "linux@armlinux.org.uk" <linux@armlinux.org.uk>
CC: "andrew@lunn.ch" <andrew@lunn.ch>, "dqfext@gmail.com" <dqfext@gmail.com>,
	=?utf-8?B?U3RldmVuIExpdSAo5YqJ5Lq66LGqKQ==?= <steven.liu@mediatek.com>,
	"davem@davemloft.net" <davem@davemloft.net>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"edumazet@google.com" <edumazet@google.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>, "daniel@makrotopia.org"
	<daniel@makrotopia.org>, "horms@kernel.org" <horms@kernel.org>,
	"kuba@kernel.org" <kuba@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Subject: Re: [PATCH net-next v2 3/3] net: phy: mediatek: add driver for
 built-in 2.5G ethernet PHY on MT7988
Thread-Topic: [PATCH net-next v2 3/3] net: phy: mediatek: add driver for
 built-in 2.5G ethernet PHY on MT7988
Thread-Index: AQHbgqn0+oUccgrII0yLc8X4a8i6V7NOXWgAgArSKgCAADN+AIB3h5cA
Date: Tue, 13 May 2025 11:13:04 +0000
Message-ID: <23205135c80c77b99fe32ef7bbe4ee421ac80bb4.camel@mediatek.com>
References: <20250219083910.2255981-1-SkyLake.Huang@mediatek.com>
	 <20250219083910.2255981-4-SkyLake.Huang@mediatek.com>
	 <Z7WleP9v6Igx2MjC@shell.armlinux.org.uk>
	 <5fae9c69a09320b0b24f25a178137bd0256a72d8.camel@mediatek.com>
	 <Z77kcqzmCqdT6lE0@shell.armlinux.org.uk>
In-Reply-To: <Z77kcqzmCqdT6lE0@shell.armlinux.org.uk>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB6226:EE_|TYZPR03MB8133:EE_
x-ms-office365-filtering-correlation-id: b0da1b4b-ea28-4017-12ec-08dd920f2217
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|13003099007|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?K0pIZ0hVVjRWT0pZVVdsV1ZnendMeW1LNlZRNU1zWWhrZWZoOXpIWlA5WkV4?=
 =?utf-8?B?Y2pWWDIwRHNmbXpIL0N4UFh2Z1lQRjBVM2c5djVQOW81VUp3KzBnb0xJUTNQ?=
 =?utf-8?B?czlmVlExK2s0K0xpbVU3NzZteTVyTWEzeXR5Wk01VmMyOHJEZWFJL1VpTmJJ?=
 =?utf-8?B?emRhS3pJdElQMUlSMGNidWFrNi8vaWpiMkRQK3JwaUlvMmNHVHpVQlFmS0FN?=
 =?utf-8?B?Nm9GMDMwY2NHQ0sxc1RtcmN1ZmtOcTFoY1NaSnRDb1d2RHNGN3hidmxvQ3NN?=
 =?utf-8?B?cjNBbW13Qmo0dDJHNWZKR2hlWEZpL2U4NDA1YTNERTZlbkZnNWdkeUsyaEd0?=
 =?utf-8?B?Nk4yTDFaTG0xcUhxWEwyajI0KzAvZllKSGxLaEZzaW5NWWFPZkl2cXJnWXlK?=
 =?utf-8?B?VXdQRGlJNFM0bWNaSHljUDI5ZjhCNUpZNkJ0QVh4dzg2cDR0clNFM3ZKclFq?=
 =?utf-8?B?UjFGT1k2TjBLaEF0c0FhaHlWU3ozZnE2eFVCaUF1Y0ZCd0RtbTUvVHhYNFBT?=
 =?utf-8?B?TGNtTlBpMUxCK0E3K1I4K0hnMkxPMThRUnhJcTkxSFY0ZWdTRTlMaHJkdlhk?=
 =?utf-8?B?bnpoSGNGNkNITkJBbnBXWVZpa1dIUHNnOVNOVmM3ZlZGemFIY0xyMzVUanRv?=
 =?utf-8?B?MG41S1ZWTDY4K1dLMzB6TlVXNmNBcnJyNEhpT1B2KzJOZHk1S1VnaCtRejRu?=
 =?utf-8?B?dVNia3dhUElJbHM3Ylo0S2l1MUl1UjV4dG91VGl5UEdYMTE3bDlXbno4elRp?=
 =?utf-8?B?RHF4N294eDVpK0JlbVRINHhmMm1Ia25KZDhFME9EakFwNGthdVJ5aHZGKzlL?=
 =?utf-8?B?eVFjUkF5ODVJS0Fsd0hERWtlaXhGcnNtN0tyZ0QyWURQWnJoaFZsK1dsRENJ?=
 =?utf-8?B?UUNieXpGaHhnUjNYZDBGUUl2RnJUbHM1OTZ5MHhzZTg1aTVqMlk5UUN6NjRX?=
 =?utf-8?B?UVJWcHluYWFiUlRGWUd5R1V3WlFnN2xVamJEaGRrVUxZOTAvUzArRzRLNUk4?=
 =?utf-8?B?N05ZV3ltWHQ1S1Rqa2hJNWgvTk8rK040cmJVUjBxMXdCRTZ4cm5CeGlpV1Nw?=
 =?utf-8?B?WEVheEdzSDZybnhpZ0J4SFhtWWljR1VQSEtQL0twSUczUEs4blYxVjNSMjRB?=
 =?utf-8?B?QVV3a1NpVkNDbG5CNGtUeDB5WmFOdjlDZ2RjOCtIbXFqR2ZNWkE0VEs5dy95?=
 =?utf-8?B?YU1TbVZYdWhtWHJJeFdlMEd2a09mQklYWmlZaEZzQjJCRVU0SWZaYVFVWHRV?=
 =?utf-8?B?Z2trRSs5KzJ5ak96RjROVEU0S0E1RGxLSmlYUlRlSUw5T2ZGMVhQNjhrS3d4?=
 =?utf-8?B?SGVxcmZSUmNvNi9GQ2ZhMkxsUUYxSHlEaXkzVjBFQ3ZDaXpCV0JVcStkMzRm?=
 =?utf-8?B?OFg2V0xNWWVXZy9aenNablBTWndqWEtBUVNNczc2TnUyMGhOZCt0M0dxVGpR?=
 =?utf-8?B?ZnFmTzBmS1FkNGtXcE04WFBmaS9WaTZBWWxzTlp5NTNUbGtuaUJIcVJxYStM?=
 =?utf-8?B?cGV6cWYyZnRFL2hKU2hJOEdEMDdZc0p1YmU5akJhVnpCMVJYNHRBZ1lqUlJF?=
 =?utf-8?B?blpiME1wTVZPdi95Y2NJOC9jMlpIRnFXNk92ci9XZzcwQi9MbnJDb2oxejNz?=
 =?utf-8?B?SytRdTgvc055WE8vZkFWSEhIMkg0V2xnRWlzU090cnFCRG1OdjRuRVM4UEJi?=
 =?utf-8?B?SXQ0WkVPVjBWanFFZTI4SnNYU2FpSmlIcFl3VUZSSHp2SzVNdjN4RCtHS3Nj?=
 =?utf-8?B?SEQ5RHRtejhiK2NxMjdwZUwyeTlJMW9EdHB2Q1ZtemY2bVpMV1V4STNZU1dK?=
 =?utf-8?B?Z1pDZkJGOVc1MmJ2YTlobmpjanZJUDBuYXpob0ZlWnVIUDhXclVKRmVyc0N5?=
 =?utf-8?B?SW1TSjdCZDV1OTZMMkNlS1lXMHl1N1I5bkRua2RSM0ZRenpSc1l0czdXU3gz?=
 =?utf-8?Q?AY0W3OyIZXMCEhnPWxKgmEHnX/pb6pBJ?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB6226.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SWRpc0NYZ0lqeWZKTVo2S2sxTytDdGxQTjFXSGEvSWR1MFcySVZRSmU1SEtK?=
 =?utf-8?B?eExTd0JqZ2h0QWhGSDBOQWgzUkxHNGFiUWg3UnJwOHhJNGd5VUNUbXlHZyt6?=
 =?utf-8?B?M0MvTlY4d1dub0ZtUm1RQStmc1RVMFVVSWFNajFOUkNqSUJvc2pOUHdVYWxW?=
 =?utf-8?B?eDBGQm8vVmkxZE5wKzJnNUhQU2Qxc09JK1dSakQwemljd2MzZlBDc0RSaW5O?=
 =?utf-8?B?NS9VZ1RQUGszYTdZNFU1RkdYT1VNRWp3VWcyMFdpNEwxSUtmUWxqVFNENlBF?=
 =?utf-8?B?TjBtZWxHTXNxTjV4dmlGblVHa0VzQk1JcUpwMW52MWhETmlYcmJ4ZmhDSy9G?=
 =?utf-8?B?WlErbENJVUNEWS9yT1NEMXR6SHJHUGR5Zk10WDhjNnJzMFJSQVNVMDZmb2xX?=
 =?utf-8?B?VnB0dEhDRlNmT3E4TEpWNHM0T3l5eWJTanZmZkQ4M3VBRlhSczdpbzByY1BC?=
 =?utf-8?B?Yjc1czdwV096N3JvSVdNWjdId2cyMXN5YWhiUVp5bFFnNFdnamZ2MWV5RVhO?=
 =?utf-8?B?d3lhbUxCMzkrQS80NnduVmNpb0xENGxSQmRvaTQwSGlPU3Mxc3FubUJ6cEs0?=
 =?utf-8?B?U3kyVzQ0bnhuNnN4SGw3VUpDMkNtcm9DbkFDS1lZYnUySzJuWkgxWVo2aGFt?=
 =?utf-8?B?L25GcGdiUDZlYlRjdmFNekxJeVFuemlkZDNxZ0lCRTkwcFNPSDYwTDhFQlFO?=
 =?utf-8?B?WEczWHNHK1FHVE1CQzZhS0FDZ215UHkzdkk4Q3E5eVZJVjZyZXZhai9HQkE3?=
 =?utf-8?B?b3ZpVXJXUjBiQ2NILzhZM211WklnZndHQ0s2dTdiZHJJTnZtZ2hIVldzWjMx?=
 =?utf-8?B?TFUzUkxMMEJrUDErSmhza2ZiNUlvckMxOWwwWWNXTWF6YWhDU1ExRmVTcURj?=
 =?utf-8?B?d3VnK29ycllGRzJqaEwwSGFBVlNxcFhVVHpvQjdUT1BCc040d1hxRnp2UkJT?=
 =?utf-8?B?Qjd6UlU2MDltR2F2ZVZaZHhvRnFlWTEydFc0Mit5S3ZuV0NnQzFxSEFWZEgy?=
 =?utf-8?B?aElLTlZEZ3JYSWN4dG9rZ3lBQnlpK3dFTjNZUmVLd3Z0bVljNEdnT3I5Mmx5?=
 =?utf-8?B?bmtta0Q1RnZZTjlncm50Zi9XT0QyNFppSXhpSDVKb3hXMDhMMGprUUZiNWFo?=
 =?utf-8?B?TVF2Zi9uVi91cjFuZzNlSjI3SXgvSkdTRTRVUU83R1JUWGFHdlMrOW9Nemll?=
 =?utf-8?B?aW1HSDY5NnJkcGs4bEYrdy9rVU9kNDk0ZUdTSWN0aDl0UlNiWHNhaWJVK0dX?=
 =?utf-8?B?WWp3ZGZ0blRuRXRhTjhwdEFKOWVGMGVhZUJKRENqQmZ2MUIyb2FwQ3h2aWds?=
 =?utf-8?B?R3NtNHZEaHhZazMxdm9ldS9HeU5pNkNzNmIya1FEVlNrZ2FORnpvRWhub0hk?=
 =?utf-8?B?cWRtZWlYaVVOelVXUi9ENit6aG56Qk1NSnNTRDc3bzM1QndsMmg5WVBzUnhY?=
 =?utf-8?B?TTE4SlladlQ4NlZXNUl5NmpZUVJQT2pxODV1VGtPaTRzSm9JaWZhSnJWM01k?=
 =?utf-8?B?SE05bmhKMkI0b2tGN3oyYmE2SGJNUWQ1QXpFNnZMbE4yS3ZzTVZvUkVqSTFL?=
 =?utf-8?B?MGNxRnhOU1pNZTlub0dSRmZ5dkl6MGhySjVydGNZaU4rbThVeU5XK2ppcXVW?=
 =?utf-8?B?NVg3V2syMkhRT1JoeWlvTWRxMW0ycTgwVHhxQzF5UFNZZTQ2bElrcktlNzJs?=
 =?utf-8?B?elJtaXhaYWUzUGlDY2JNZVlMN1RyOXVNN2FHTXVmZ1hYbXBXUXIraGJRdE1E?=
 =?utf-8?B?QUNVQ0hIcDFMNDdkY25FMTVhaVNTYnlBV3VlYWRYUGg3QzRnME1QVEIzUHJp?=
 =?utf-8?B?NXkxK1NJellZMHZLc2x4NXowZXBYUTBZY0dhMVJ0eWxKcUQvSlBWVVNHd1Vo?=
 =?utf-8?B?aTZKRGUzczNlY3J4aHAxS0c2N3MzeGFZUlBmMyszbVhEYzNlS0FqUXdiZTkv?=
 =?utf-8?B?SytScVFuODBnaHhMVnI4ZzhnRWV2RHpqQXFXYlhYSkd6dGY1cXloZkJCcGE5?=
 =?utf-8?B?OGNrbXE0NHJ5K3ErNlQva2RzUFpuMlZ2ckQ3NDZLcTlFZnVCSHM4OFBobUdO?=
 =?utf-8?B?K2pPemdIaU5hMjN6bUVQamMrc0FuRmJmaFp6SjRuNDNMbzFPbTU0aGxYaUtr?=
 =?utf-8?B?MUVDR2ZyaVo4eEJzUmtOaXNkbEpzVW1yYldGMWg0azRFQmVCNmNKTVBSdjd2?=
 =?utf-8?B?UkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C6A502AC427BD46A70260EAADA3A567@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB6226.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0da1b4b-ea28-4017-12ec-08dd920f2217
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2025 11:13:05.0201
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QqnJ7ckcBpe71lFOlqMMlBm+ue9uXei6sYR1YYw8SpeJMQy4XWHV2kmsV+2P5i/gHcHESGpCdUXLKgoFYHzCQhHbgmcG2qwkfDbGXLbt+xQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_041316_729852_9831F189 
X-CRM114-Status: GOOD (  20.46  )
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

T24gV2VkLCAyMDI1LTAyLTI2IGF0IDA5OjUyICswMDAwLCBSdXNzZWxsIEtpbmcgKE9yYWNsZSkg
d3JvdGU6DQo+IA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mg
b3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVy
IG9yIHRoZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIFdlZCwgRmViIDI2LCAyMDI1IGF0IDA2OjQ4
OjM0QU0gKzAwMDAsIFNreUxha2UgSHVhbmcgKOm7g+WVn+a+pCkgd3JvdGU6DQo+ID4gT24gV2Vk
LCAyMDI1LTAyLTE5IGF0IDA5OjMzICswMDAwLCBSdXNzZWxsIEtpbmcgKE9yYWNsZSkgd3JvdGU6
DQo+ID4gPiANCj4gPiA+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5r
cyBvciBvcGVuIGF0dGFjaG1lbnRzDQo+ID4gPiB1bnRpbA0KPiA+ID4geW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gPiA+IA0KPiA+ID4gDQo+ID4gPiBPbiBX
ZWQsIEZlYiAxOSwgMjAyNSBhdCAwNDozOToxMFBNICswODAwLCBTa3kgSHVhbmcgd3JvdGU6DQo+
ID4gPiA+ICtzdGF0aWMgaW50IG10Nzk4eF8ycDVnZV9waHlfY29uZmlnX2luaXQoc3RydWN0IHBo
eV9kZXZpY2UNCj4gPiA+ID4gKnBoeWRldikNCj4gPiA+ID4gK3sNCj4gPiA+ID4gK8KgwqDCoMKg
IHN0cnVjdCBwaW5jdHJsICpwaW5jdHJsOw0KPiA+ID4gPiArwqDCoMKgwqAgaW50IHJldDsNCj4g
PiA+ID4gKw0KPiA+ID4gPiArwqDCoMKgwqAgLyogQ2hlY2sgaWYgUEhZIGludGVyZmFjZSB0eXBl
IGlzIGNvbXBhdGlibGUgKi8NCj4gPiA+ID4gK8KgwqDCoMKgIGlmIChwaHlkZXYtPmludGVyZmFj
ZSAhPSBQSFlfSU5URVJGQUNFX01PREVfSU5URVJOQUwpDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9ERVY7DQo+ID4gPiA+ICsNCj4gPiA+ID4gK8KgwqDCoMKg
IHJldCA9IG10Nzk4eF8ycDVnZV9waHlfbG9hZF9mdyhwaHlkZXYpOw0KPiA+ID4gPiArwqDCoMKg
wqAgaWYgKHJldCA8IDApDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IHJldDsNCj4gPiA+IA0KPiA+ID4gRmlybXdhcmUgc2hvdWxkIG5vdCBiZSBsb2FkZWQgaW4gdGhl
IC5jb25maWdfaW5pdCBtZXRob2QuIFRoZQ0KPiA+ID4gYWJvdmUNCj4gPiA+IGNhbGwgd2lsbCBi
bG9jayB3aGlsZSBob2xkaW5nIHRoZSBSVE5MIHdoaWNoIHdpbGwgcHJldmVudCBhbGwNCj4gPiA+
IG90aGVyDQo+ID4gPiBuZXR3b3JrIGNvbmZpZ3VyYXRpb24gdW50aWwgdGhlIGZpcm13YXJlIGhh
cyBiZWVuIGxvYWRlZCBvciB0aGUNCj4gPiA+IGxvYWQNCj4gPiA+IGZhaWxzLg0KPiA+ID4gDQo+
ID4gPiBUaGFua3MuDQo+ID4gPiANCj4gPiA+IC0tDQo+ID4gPiBSTUsncyBQYXRjaCBzeXN0ZW06
DQo+ID4gPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly93d3cuYXJtbGludXgu
b3JnLnVrL2RldmVsb3Blci9wYXRjaGVzL19fOyEhQ1RSTktBOXdNZzBBUmJ3IWlWLTFWaVBGc1VW
LWxMajdhSXljYW44bmVyeTZzUU8zdDZta3BkbGJfR1c4aHN3aHhjNGVqSm96eHFrVTNzMld6eFNp
enM0a2ZkQzc3eXI3SEdHUkl1VSQNCj4gPiA+IEZUVFAgaXMgaGVyZSEgODBNYnBzIGRvd24gMTBN
YnBzIHVwLiBEZWNlbnQgY29ubmVjdGl2aXR5IGF0IGxhc3QhDQo+ID4gSGkgUnVzc2VsbCwNCj4g
PiBtdDc5OHhfcDVnZV9waHlfbG9hZF9mdygpIHdpbGwgb25seSBsb2FkIGZpcm13YXJlIG9uY2Ug
YWZ0ZXIgZHJpdmVyDQo+ID4gaXMNCj4gPiBwcm9iZWQgdGhyb3VnaCBwcml2LT5md19sb2FkZWQu
IEFuZCBhY3R1YWxseSwgZmlybXdhcmUgbG9hZGluZw0KPiA+IHByb2NlZHVyZSBvbmx5IHRha2Vz
IGFib3V0IDExbXMuIFRoaXMgd2FzIGRpc2N1c3NlZCBlYXJsaWVyIGluOg0KPiA+IGh0dHBzOi8v
dXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3Qv
bGludXgtbWVkaWF0ZWsvcGF0Y2gvMjAyNDA1MjAxMTM0NTYuMjE2NzUtNi1Ta3lMYWtlLkh1YW5n
QG1lZGlhdGVrLmNvbS8qMjU4NTY0NjJfXztJdyEhQ1RSTktBOXdNZzBBUmJ3IWxRN2I3a2dEMEpH
T0hSX0NMZUh0RjVTRi1rbngzaFpjbTJ1X3RZYnpnQm5YOTFhN211UndxR2hEVWFQM1hvckhsdTlx
UW96TlhfcFhETUl4TzFEeVZJWSQNCj4gPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0
cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIw
MjQwNTIwMTEzNDU2LjIxNjc1LTYtU2t5TGFrZS5IdWFuZ0BtZWRpYXRlay5jb20vKjI1ODU3MTc0
X187SXchIUNUUk5LQTl3TWcwQVJidyFsUTdiN2tnRDBKR09IUl9DTGVIdEY1U0Yta254M2haY20y
dV90WWJ6Z0JuWDkxYTdtdVJ3cUdoRFVhUDNYb3JIbHU5cVFvek5YX3BYRE1JeEhEbTFJdVEkDQo+
IA0KPiAxLiBXb3VsZG4ndCBpdCBiZSBhIGdvb2QgaWRlYSB0byBpbmNsdWRlIHRoZSBsb2FkaW5n
IHRpbWUgaW4gdGhlDQo+IHBhdGNoDQo+IMKgwqAgZGVzY3JpcHRpb24gb3IgYSBjb21tZW50IGlu
IHRoZSBwYXRjaD8NCj4gDQpTdXJlLiBJJ2xsIGluY2x1ZGUgdGhpcyBpbiB2MydzIGNvbW1pdCBt
ZXNzYWdlLg0KDQo+IDIuIFdoYXQgYWJvdXQgdGhlIHRpbWUgaXQgdGFrZXMgZm9yIHJlcXVlc3Rf
ZmlybXdhcmUoKSB1c2VzIHRoZSBzeXNmcw0KPiDCoMKgIGZhbGxiYWNrLCB3aGljaCBlc3NlbnRp
YWxseSBwYXNzZXMgdGhlIGZpcm13YXJlIHJlcXVlc3QgdG8NCj4gdXNlcnNwYWNlDQo+IMKgwqAg
dG8gZGVhbCB3aXRoPyBUaGF0IGNhbiBibG9jayBmb3IgYW4gaW5kZXRlcm1pbmF0ZSBhbW91bnQg
b2YgdGltZS4NCj4gDQpJJ20gbm90IHJlYWxseSBzdXJlIGhvdyB0byBhY2hpZXZlIHRoaXMuIEFz
IGZhciBhcyBJIGtub3csIEkgY2FuDQpwcm92aWRlIGZ3IHZpYSAvc3lzL2NsYXNzL2Zpcm13YXJl
LzxkZXZpY2UtbmFtZT4vIGFmdGVyIEkgYm9vdCBpbnRvDQpMaW51eCBzaGVsbC4gQnV0IGF0IHRo
YXQgbW9tZW50LCB3ZSBuZWVkIHRvIGluc21vZCBwaHkgZHJpdmVyIGFnYWluLg0KVXNlcnMgd2ls
bCBhbHNvIG5lZWQgdG8gbG9hZCBmdyBmaWxlIG1hbnVhbGx5LiBUaGlzIHdpbGwgYWRkIGEgbG90
IG9mDQpjb21wbGV4aXR5LiBJcyB0aGlzIHdoYXQgdXBzdHJlYW0gc3R5bGUgZXhwZWN0cz8NCg0K
PiAtLQ0KPiBSTUsncyBQYXRjaCBzeXN0ZW06DQo+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMv
X19odHRwczovL3d3dy5hcm1saW51eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMvX187ISFDVFJO
S0E5d01nMEFSYnchbFE3YjdrZ0QwSkdPSFJfQ0xlSHRGNVNGLWtueDNoWmNtMnVfdFliemdCblg5
MWE3bXVSd3FHaERVYVAzWG9ySGx1OXFRb3pOWF9wWERNSXhFOWYyeFdzJA0KPiBGVFRQIGlzIGhl
cmUhIDgwTWJwcyBkb3duIDEwTWJwcyB1cC4gRGVjZW50IGNvbm5lY3Rpdml0eSBhdCBsYXN0IQ0K
DQpCUnMsDQpTa3kNCg==

