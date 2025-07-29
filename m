Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192F5C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 02:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/huJQyhltE9gsAAAOl+NhS9ypoKojRtRx8dgVFShT9A=; b=djVcnXGuOhEqMH1OWeHbEzbCOf
	nP6LlRSTT9+lA5CE4m8w14yUaphuOeZMP3W5ymI13T6GA9LeU+7fAmheG0zNu+VnXa9kxVIRUOYzT
	FeaRGIVZJ2rzllA7M5GgGTNLsnEKjGJTd8ND2mc5YNBKxQxWjJ6oxMAw7cdayNQf0YLG5ssYW3ZMn
	eZQOMqX58vc41EUZFgrfAhlrAUnLNZdeeMMit5BRHq/ykTYTHwCv6EisrCLhZioUEbyWAkioFzdp/
	kIlFY3Hnu1cLf2fLauwJ4OoEwxFAC2Y7JKM/AxHj0wFoMh9ZCWO3jIs+JXqExacbokQo0twXwzEJ9
	aRyB8i0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugaK9-0000000FnAO-3RJN;
	Tue, 29 Jul 2025 02:44:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugaC6-0000000FmEQ-3JXR;
	Tue, 29 Jul 2025 02:36:00 +0000
X-UUID: bebb79526c2411f09eb0dd999d3936bf-20250728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=/huJQyhltE9gsAAAOl+NhS9ypoKojRtRx8dgVFShT9A=;
	b=uec9a/tJylvXYfE3APi/GL8N8saPQ28/aGyfWhxapN01RBpz+zbrJNaD4Zg4OqTdpdwOeduAamne6rwLByFLC1b9yhT3GMZ4iJ8ViiWhVbMV8nrNAq2ssjWac8jXJrQGw7YbMzP1gmlfIU27fWFmt5ZEtuzXWrT/kHSKSy9WwXQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:3c7a8a72-1920-4a6c-a88b-9831e42c5ba3,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:6bc8450f-6968-429c-a74d-a1cce2b698bd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|15|50,EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,
	COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bebb79526c2411f09eb0dd999d3936bf-20250728
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 863199587; Mon, 28 Jul 2025 19:35:52 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 29 Jul 2025 10:35:49 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 29 Jul 2025 10:35:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aB9E1o2P4a61fGN6WzXEqz6D3GL1LDxX5J/svYynXjL1YSw9HWg4fvNaahIV6290Zt7f7ZqGOeSLYbb5cbCNn5cDxyiwar0lIRE0prSQh4j1RHbLMTBDrIQmd2PWFw8GWUsKCqfjgEyUaalj4CWySCuYPwi2BcjO1DRlGaz8v5z7PjkLvc3NOZOkfX7NuKGFKi8y1G+gR4RVZEqGBSYOO3Jdv9NhgbVMn+FLXwVWy8TmtBtASM3mOdrZoG0l/eQYHwZ7K+GAn4sjRWPzQfN5yiNEGLIvCLj79YHvankow9RBqXaa//g0S9S321fMn4e0EPshuo6+5ZxcK+FutidPBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/huJQyhltE9gsAAAOl+NhS9ypoKojRtRx8dgVFShT9A=;
 b=fDkb9f6Jnq6gGnaS08RBF+WwScMmA+v1rM/I82doDfiRUH9T8ASikn6Min4BwHHwb+6y3ykqfY7s7Llst7iyjNM9x+KNFiD3pNYvTxfQVlZ2TzZkoEsj4u6gyiw35OnvzdcQjY+H5yfv0FTg+GPZE9aCJfGBziD6XbC8KbfqMRwhPC5j0foNdaEbhOEq7RIeN/iohKB0VWTrsuo/rYk/I9xoAwiQWYH4NfZSCPtveyx4Dt6P/sfc5oqteHMldiyIyMB4yd4cFcHHIz3DI4eKw6WzT8ak+wgWIWUc53130Kc+vnC8EMWZTaDaUk/qwJQ1j/jY9rOFeHCwzXGIF9F2Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/huJQyhltE9gsAAAOl+NhS9ypoKojRtRx8dgVFShT9A=;
 b=mdKwvb71fWLxk3NVKo84TTc5/lEWtrkS3kv9CZdmpndaAJ4eF0eJllgAp1Pkg8a9uljO1pC1PRZwDCAYwfqIfkkoB/ap3CB3ic/9JppMrexp3WBo1phXppzNTFFWag+M2wOqil9C7r/DQrmiYNUCA+Ucuo017HgjLsfsS94hrd0=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by TY0PR03MB6629.apcprd03.prod.outlook.com (2603:1096:400:206::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 02:35:46 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece%4]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 02:35:46 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?R2VvcmdlIFN1biAo5a2Z5p6XKQ==?= <George.Sun@mediatek.com>,
	=?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"nhebert@chromium.org" <nhebert@chromium.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	=?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
	=?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	=?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
	"robh@kernel.org" <robh@kernel.org>, "sebastian.fricke@collabora.com"
	<sebastian.fricke@collabora.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "christophe.jaillet@wanadoo.fr"
	<christophe.jaillet@wanadoo.fr>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"arnd@arndb.de" <arnd@arndb.de>,
	=?utf-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
	<Andrew-CT.Chen@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "andrzejtp2010@gmail.com" <andrzejtp2010@gmail.com>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 0/8] Enable video decoder & encoder for MT8189
Thread-Topic: [PATCH v1 0/8] Enable video decoder & encoder for MT8189
Thread-Index: AQHb+i34srzGc2FZHkSzvcLzwuM8gLRICMCAgABl3IA=
Date: Tue, 29 Jul 2025 02:35:46 +0000
Message-ID: <468ff43c6ca5c172a619da04ac74fde10d7ea165.camel@mediatek.com>
References: <20250721105520.5625-1-kyrie.wu@mediatek.com>
	 <9ed47afadc8f624daff6711b86360cbd9e68af79.camel@collabora.com>
In-Reply-To: <9ed47afadc8f624daff6711b86360cbd9e68af79.camel@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|TY0PR03MB6629:EE_
x-ms-office365-filtering-correlation-id: 95ab92d9-a388-4ec2-033b-08ddce489f79
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?c2NLaHJOV0FGcmpRSE4vcDY0K2VUb1AxZ045N1Zrbk5CYWtWYllNV3ZVODlu?=
 =?utf-8?B?YlhMYnNGM0xZMkFZaWgydTdIUHZBR3FHQzhqdnRROUtVQmRVdlI3bXB2R1Mw?=
 =?utf-8?B?cmFLdDNYa2Q1MzN2UEJIMEtvUUIxUTBFRkd3RVRQTjFuN2FpUEx3Wmg0Y1Zh?=
 =?utf-8?B?VTM0Ty8zRzk1OXZnS0JYNXpNeS91NjM3TEttZ2FzTElsRkpScE5Yd0x2UllR?=
 =?utf-8?B?eUFBaHo2eXU4MVY3cGFvNlZSbWNnSit3M3FiWjQ1L3M3NzExU2swdE15b2FK?=
 =?utf-8?B?c3hmZ3FQVXdrRzJuYVpXNldDN0xBL3FGYzdpMTNuVmVQT0s2V3d1ckQreDJh?=
 =?utf-8?B?bVFoWHozdEtVcDNyTFBsYnYwYlNjNjVRWmJxL0VlOGhNbzRMTUFSVzgydGlX?=
 =?utf-8?B?WFByWWJiSFEzRmlxTXV2eHZadi8vMHc5MUZZQUZ6NmpvL1pSZnJadzFvS2xw?=
 =?utf-8?B?NzJLRWJRTFZFbC9sbjFNSlRjSXRzb1BIQVhJakdpcEY4UHpaU2ROQUw2UklL?=
 =?utf-8?B?S21pWHF6Y01WbXF6ZjVsaVpZYzZBSlJTQTdyRURFSk5XcXJwUmhXSDErb25C?=
 =?utf-8?B?Y3lwSlV4QlR3OW5hbmxlMkRTWmovMzRVaU1qS3lHbFNtOFh6SlJYUGQxTFRp?=
 =?utf-8?B?aUxqSmdvbVZUT0E5ZjBvQVFmbUx4TmtXcnhOVzc2eXlwdkRnWmtlclFFbWFY?=
 =?utf-8?B?WTRFN3R0VmVnS2xhWDlabEgzM05qTTY4UmljeWNZbi83bHJMSWxtT25BYjVq?=
 =?utf-8?B?OUJ2ZGZxRzZENnhFdmh0bTVoM211SGNQMmVXNHFDNlRsOFV5VGVEWW03UXpV?=
 =?utf-8?B?MDBBRUV6QVRtZ2Z5T1JHcHVSQXY5Z2hVaUxwckUwL25MeEtuNTh2UEFzMVJP?=
 =?utf-8?B?eXZFV2RlWlZnN2hZVUt0U3BxcEVFM0c1RXJ6UzluK2htb0NEMkx2MmYvUGpz?=
 =?utf-8?B?ditwTWtJTjF5QTFCeXlVKzZ3VnJMWWp5Nnp2Z09VNmdnOXcyODhZaFJ0WE56?=
 =?utf-8?B?UGR4Y0F6Um9panYrNWIrR0hIb0xKbFJ2M2QyeTBUTm9FMEhFR2FXTDhEUllq?=
 =?utf-8?B?OHVmbU5vblZHTEJPNnIyZmtWTk1WTGxLWlJRUzExMmRRVWh0Ris5RHAzSXBY?=
 =?utf-8?B?cTVuU1R5MWhYYUdXSll2YkxRdnNIbVg5cGRub1Fzd3h5ck41RzNnemhtWGMv?=
 =?utf-8?B?b1U0TjdnUzA3UFJNYmtzZExERFVmRHh2U1F3SWtPakRNcW0vZkF4YUEvUXk3?=
 =?utf-8?B?Z0FYaUJub252OHZ1MHdFNGYwaWJEWTZXRHorRFFLUnVBRnNrVW94cExEMkc1?=
 =?utf-8?B?TFgvdGl4K05RY1pBa2hQQWJzQmJjakhiY21pQmY0dkRDR0tNVml1VXZ4K2o0?=
 =?utf-8?B?a3R3N2hkWEhtM2YwR2s1UHh6WmlkMjFPdGpXcUdYaURkZUE1ZUl5ZFZZSUNw?=
 =?utf-8?B?Vm9uc0RWZDEzWVNqMlB6YTlHbVZwU05YQzdoN1dWY2FXR1hzWHRmb2MyQVF0?=
 =?utf-8?B?a05sTGhTTytGS1AwSjdEWkpMbHdzWFNJSnNmcjhYcDQvZzRCK2d0KzdYMWVi?=
 =?utf-8?B?eUdJU3RiYTZPdytxVU13djdHSmZjRkNFc0d4a00wZEZGZUVTK2dPbG5seitl?=
 =?utf-8?B?NlFnWkZEa3ZYdmdiYzZvVHNLYUFPQ1J0V2dKTWtFVFpoU2xISmNRVHBDeHhR?=
 =?utf-8?B?ZmVyb1lDYWhCOUY1eUhabzIwQ0V5WUZjSitVaEhIdjFhbktOeFIzNWpJY1ZQ?=
 =?utf-8?B?TE1VNmlEU0VKcVUzRHZVNDF3Vk1mRmhlK3JUcXZBZFFnL1BQNXV2RGFrSGdt?=
 =?utf-8?B?dkhCSGpMTnFrdit4Qzh1cml1eGVCbFJNY3lvTHV1ME84ZGtWbDI5Q3BYYlVM?=
 =?utf-8?B?Y0lRbzM5eUEyd3lmeHVENW1IbFNpYUIyaTJ3TGtDOGJHWVpVR2daK1NrQXgz?=
 =?utf-8?Q?5rISNpFnpuQm6/XkqVIVowhIUOexBdaI?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TERMMFNsdmVPVklwanl1VGJUOS9CblRLNzZqTUR4ekNhQXNjNVNVUkJXMlV2?=
 =?utf-8?B?UkpFbmJWOHA5eHFBeHFjMkhSek9wem9uaTBGaGtLTXZvMG5xYnZzTW4xenJv?=
 =?utf-8?B?amM3SG0wR2trYTA4bXh0a3Z5d2E0ekNhOFhnMlNLR2hTbzdidjlUR1pQdzFw?=
 =?utf-8?B?bExOYy9qanFCUXF5cDNydHpuM2ZJNFBSWFA5M2ozMGM0SENWeGRGNVRJL1Fs?=
 =?utf-8?B?THhqQnczSDkzWWdzQkw1VDdxbkRsQnNaSGkvOUl4UGc4bTBwc3MwV0R0TGVS?=
 =?utf-8?B?eU5iL0U1ZDdjY3MrTVpscVdyMkRBNzZVL0hyd0NQUXp1cXNqQ1ZZRm41MEJ6?=
 =?utf-8?B?OUZpUWhmM2hQbUo1dDY2eWNLcTFIdHJMMkhNVjVTKzJIN08vdWptWk9wYk5F?=
 =?utf-8?B?bmRtWTdJbGpqcU5ub1g2YXJUMHRMblQ2WjNMUTlpY2FGK0lCMUdEOGUwN3Rh?=
 =?utf-8?B?dC91Rmp3N3A1L01TZi85dzN5eW1OVDFHWW5LbTlVeXczWlRrU3pjVWZMWFdn?=
 =?utf-8?B?T3Y3bFlUQ0ZnbkFQTmNNOGJjc25pWE1nUTY3b0lQVmFUdkxza3FienVVVitD?=
 =?utf-8?B?bjNQazVDUWxhRHNDSkR3ZFlxVHMzUjJ1YkhhbUlaY3VPQ3pYamZoUHh1aDkw?=
 =?utf-8?B?SUZ3eDBxZUt6SXZPanZTbGQ3UjFQL3QrRFFiZm04aStYMmtkRnRnamliWVdh?=
 =?utf-8?B?NG1PcklYVHRCOU9Qc3p3aFVGMVJROW56RXU4djh5bERGMnljMUdNZldIek9l?=
 =?utf-8?B?bUh2alFtVlJQaGpuRmlhb0I4UGRtY2lzREk1K0pZekwvQ3hqSy9wZGhrSUU3?=
 =?utf-8?B?bFVsc2VuL0xHVTFQNzQrTzlZTFJUTFY4QS9Nd3BudE1MWXZDenVHc1pBRDNM?=
 =?utf-8?B?aG5seE9rbFY3WkFwYWVWWGQ1Zk1KQzNqQnZDUkhBNjVtNnE3aXQ1Ym5jNXEx?=
 =?utf-8?B?cFFEN0JYczFNdlRVNkRaTVJMam9PakJwR3I1bE9ZSnk1ck1EaWhGc1lsNkN0?=
 =?utf-8?B?cmFjMGFCdzhodVJxWlVPYkR0T3F6SGpOYTRCODdRS1haSHVLUnVWeU1iYzJq?=
 =?utf-8?B?OFM5K0ZvMUtyZk9lRGZKUnNLNGhjOCtvSkxlVE5FUlZWekFPQ21EUmtHeWpr?=
 =?utf-8?B?YUZnaEh4aG1FUFBaOVUzRjMxSjdndXNFOURkZDZpRGVicWwxeHBNaVFRQzFj?=
 =?utf-8?B?UVlyMTlNOFIvdFUyaGNPMWJ3QnBLRnNCNE44OVpuWXpuaGlQanFkTmZ2MXZZ?=
 =?utf-8?B?ZFdveVFwT1RoVWs3dU03Y3RVSG81TnVoZ3JKWkw3RFJkemFXblFJZlMxSHZE?=
 =?utf-8?B?T29HMzZxOWpHZWVTOWttb0hlc1NvamxaU0N6N1MzUDNoZ0tFUDcrd0VlRzI0?=
 =?utf-8?B?ejE1d0RrZnFFckFwWUhWTm02eUxJcks4TmIxRi9YcVZCWWpXajZack9NUFVa?=
 =?utf-8?B?VXFiUm5nRFJpS0hONjNCUUNEWWhQbDI3WGhHYmlBaVY2elM2ZS83elFERzZa?=
 =?utf-8?B?empneEhDeWdaNUtzay9iRUlTSmExZFBsdjQreWg4RDdHREVGMllYcVBucjVo?=
 =?utf-8?B?Yi9FeHVtQjJZRG83NlcwWk5mUmRkWXVqd0tYMDZSMktkUkErNXVMelpFdTlk?=
 =?utf-8?B?ZzkydjU3Y1dLN2FFR2RhSlV0SElVNkZuQmZBK1Y2bDZ0UjlYVitHQTE3VC9m?=
 =?utf-8?B?aUJlemJxWFo0elB1ekhUdGlNSFpwVnZxNkZaOTdWazRVbmc0N3MyRjcwcFRk?=
 =?utf-8?B?MkhrNlZjUnd4NEEwdFZqbUtVTVJwZ04yYVN2S1g2cnRqVVR5MWtmQ0dLbXA4?=
 =?utf-8?B?QWU3RGM4OWJUVW5pR3NwV1RSbnRieWppd1NNVndLM283NkljK1hUM1k4bEZr?=
 =?utf-8?B?d2thZVQ0Tno5YzNyZHc0OUxBU3VoaDN0aTNPejNpU3d4aGRRdGRKOXlRRmRi?=
 =?utf-8?B?RSswUUY5eUwyNTV4LzZqR0xjNHNtbnpQMVdoY0I3c1dXalE4eUpQTDh4UzM2?=
 =?utf-8?B?a1YxeWtwbVRQNkgzSnJYSVc3Y0RYVzRTL0ZaVEFZcURrbEp0UDd2ZEdTVG0y?=
 =?utf-8?B?anJTVXZwUlIxem0vR1JHMlRNK3pYdXVtdXVYYjRBbmtQeGhBZFFwVHRIYnpB?=
 =?utf-8?Q?FCXf0zEx+5sUoecml72SJ74Gs?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <01EB94B7A12CC44485633A952312BFE0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ab92d9-a388-4ec2-033b-08ddce489f79
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2025 02:35:46.4735
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bcNmNyv3u8vFB56gTbbshJ7iz623h5fAPSM43Sf7/1RezIIR3uruhoejmqCdjLulYKozkq/IsfMI6mET483nWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6629
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_193558_846165_1AEA8E8B 
X-CRM114-Status: GOOD (  17.52  )
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

T24gTW9uLCAyMDI1LTA3LTI4IGF0IDE2OjMxIC0wNDAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3Rl
Og0KPiBIaSwNCj4gDQo+IExlIGx1bmRpIDIxIGp1aWxsZXQgMjAyNSDDoCAxODo1NSArMDgwMCwg
S3lyaWUgV3UgYSDDqWNyaXQgOg0KPiA+IFRoaXMgc2VyaWVzIGhhdmUgdGhlIGZvbGxvdyBjaGFu
Z2luZzoNCj4gPiBGaXJzdGx5IGFkZCBtdDgxODkgdmlkZW8gZGVjb2RlciBjb21wYXRpYmxlLCBw
cm9maWxlIGFuZCBsZXZlbCB0bw0KPiA+IHN1cHBvcnQNCj4gPiBNVDgxODkga2VybmVsIGRyaXZl
ci4NCj4gPiBTZWNvbmRseSBmaXggc29tZSBidWdzLCBpbmNsdWRpbmcgdnAgNEsgcHJvZmlsZTIg
YW5kIG1lZGlhIGRldmljZQ0KPiA+IG5vZGUNCj4gPiBudW1iZXIgYnVnLg0KPiA+IExhc3RseSwg
YWRkIG10ODE4OSB2aWRlbyBlbmNvZGVyIGNvbXBhdGlibGUuDQo+IA0KPiBTaW5jZSBpdHMgYSBu
ZXcgaGFyZHdhcmUsIHBsZWFzZSBwcm92aWRlIHY0bDItY29tcGxpYW5jZSB0ZXN0IHJlc3VsdHMN
Cj4gYWxvbmcgd2l0aA0KPiByZWxldmFudCBmbHVzdGVyIHJlc3VsdCBmb3IgdGhlIGRlY29kZXIg
cGFydC4gUGxlYXNlIGFsc28gcHJvdmlkZSBhDQo+IGxpbmsgdG8geW91cg0KPiBzdWJtaXNzaW9u
IG9mIHRoZSByZWxhdGVkIFNDUCBmaXJtd2FyZSB0byB0aGUgbGludXgtZmlybXdhcmUgcHJvamVj
dC4NCj4gVGhpcyB3YXkgSQ0KPiBkb24ndCBoYXZlIHRvIGFzayBpZi93aGVuIHRoZSBmaXJtd2Fy
ZSB3aWxsIGxhbmQuDQo+IA0KPiBjaGVlcnMsDQo+IE5pY29sYXMNCg0KRGVhciBOaWNvbGFzLA0K
DQpJIHdpbGwgcHJvdmlkZSB2NGwyLWNvbXBsaWFuY2UgdGVzdCByZXN1bHRzIGFuZCBTQ1AgZmly
bXdhcmUgdXBzdHJlYW0NCmxpbmsgaW4gdGhlIG5leHQgdmVyc2lvbi4NCg0KVGhhbmtzLg0KDQpS
ZWdhcmRzLA0KS3lpcmUuDQo+IA0KPiA+IA0KPiA+IFRoaXMgc2VyaWVzIGhhcyBiZWVuIHRlc3Rl
ZCB3aXRoIE1UODE4OSB0YXN0IHRlc3QuDQo+ID4gRW5jb2RpbmcgYW5kIGRlY29kaW5nIHdvcmtl
ZCBmb3IgdGhpcyBjaGlwLg0KPiA+IA0KPiA+IFBhdGNoZXMgMS0yIEFkZCBkZWNvZGVyIGNvbXBh
dGlibGUuDQo+ID4gUGF0Y2hlcyAzIEFkZCBwcm9maWxlIGFuZCBsZXZlbCBzdXBwb3J0aW5nLg0K
PiA+IFBhdGNoZXMgNCBBZGQgY29yZS1vbmx5IFZQOSBkZWNvZGluZyBzdXBwb3J0aW5nLg0KPiA+
IFBhdGNoZXMgNS02IGZpeCBzb21lIGJ1Z3MuDQo+ID4gUGF0Y2hlcyA3LTggQWRkcyBlbmNvZGVy
IGNvbXBhdGlibGUuDQo+ID4gDQo+ID4gLS0tDQo+ID4gVGhpcyBzZXJpZXMgcGF0Y2hlcyBkZXBl
bmRlbnQgb246DQo+ID4gWzFdDQo+ID4gDQpodHRwczovL3BhdGNod29yay5saW51eHR2Lm9yZy9w
cm9qZWN0L2xpbnV4LW1lZGlhL2NvdmVyLzIwMjUwNTEwMDc1MzU3LjExNzYxLTEteXVuZmVpLmRv
bmdAbWVkaWF0ZWsuY29tLw0KPiA+IFsyXQ0KPiA+IA0KaHR0cHM6Ly9wYXRjaHdvcmsubGludXh0
di5vcmcvcHJvamVjdC9saW51eC1tZWRpYS9jb3Zlci8yMDI1MDUyODA2MzYzMy4xNDA1NC0xLWly
dWkud2FuZ0BtZWRpYXRlay5jb20vDQo+ID4gDQo+ID4gS3lyaWUgV3UgKDgpOg0KPiA+ICAgZHQt
YmluZGluZ3M6IG1lZGlhOiBtZWRpYXRlazogZGVjb2RlcjogQWRkIE1UODE4OQ0KPiA+ICAgICBt
ZWRpYXRlayx2Y29kZWMtZGVjb2Rlcg0KPiA+ICAgbWVkaWE6IG1lZGlhdGVrOiB2Y29kZWM6IGFk
ZCBkZWNvZGVyIGNvbXBhdGlibGUgdG8gc3VwcG9ydCBNVDgxODkNCj4gPiAgIG1lZGlhOiBtZWRp
YXRlazogdmNvZGVjOiBhZGQgcHJvZmlsZSBhbmQgbGV2ZWwgc3VwcG9ydGluZyBmb3INCj4gPiBN
VDgxODkNCj4gPiAgIG1lZGlhOiBtZWRpYXRlazogdmNvZGVjOiBBZGQgY29yZS1vbmx5IFZQOSBk
ZWNvZGluZyBzdXBwb3J0IGZvcg0KPiA+IE1UODE4OQ0KPiA+ICAgbWVkaWE6IG1lZGlhdGVrOiB2
Y29kZWM6IGZpeCB2cDkgNDA5NngyMTc2IGZhaWwgZm9yIHByb2ZpbGUyDQo+ID4gICBtZWRpYTog
bWVkaWF0ZWs6IHZjb2RlYzogZml4IG1lZGlhIGRldmljZSBub2RlIG51bWJlcg0KPiA+ICAgZHQt
YmluZGluZ3M6IG1lZGlhOiBBZGQgTVQ4MTg5IG1lZGlhdGVrLHZjb2RlYy1lbmNvZGVyDQo+ID4g
ICBtZWRpYTogbWVkaWF0ZWs6IGVuY29kZXI6IEFkZCBNVDgxODkgZW5jb2RlciBjb21wYXRpYmxl
IGRhdGENCj4gPiANCj4gPiAgLi4uL21lZGlhL21lZGlhdGVrLHZjb2RlYy1lbmNvZGVyLnlhbWwg
ICAgICAgIHwgIDIgKysNCj4gPiAgLi4uL21lZGlhL21lZGlhdGVrLHZjb2RlYy1zdWJkZXYtZGVj
b2Rlci55YW1sIHwgIDEgKw0KPiA+ICAuLi4vdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWNf
ZHJ2LmMgICAgICAgfCAgOSArKysrKy0NCj4gPiAgLi4uL3Zjb2RlYy9kZWNvZGVyL210a192Y29k
ZWNfZGVjX2Rydi5oICAgICAgIHwgIDEgKw0KPiA+ICAuLi4vdmNvZGVjL2RlY29kZXIvbXRrX3Zj
b2RlY19kZWNfc3RhdGVsZXNzLmMgfCAgNCArKysNCj4gPiAgLi4uL3Zjb2RlYy9kZWNvZGVyL3Zk
ZWMvdmRlY192cDlfcmVxX2xhdF9pZi5jIHwgMzIgKysrKysrKysrKysrLS0tDQo+ID4gLS0tLQ0K
PiA+ICAuLi4vdmNvZGVjL2VuY29kZXIvbXRrX3Zjb2RlY19lbmNfZHJ2LmMgICAgICAgfCAxNCAr
KysrKysrKw0KPiA+ICA3IGZpbGVzIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKyksIDEzIGRlbGV0
aW9ucygtKQ0K

