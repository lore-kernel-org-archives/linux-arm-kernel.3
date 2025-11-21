Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 830E1CFA466
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 03:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qiaKkWHgo6SRRu39VglkNqMxCOTYNrrd4ihYNZzaI4=; b=2wipWwzQiwr+EC6r+IsEiDUUmt
	GdXGV6aVd5S8kKZlgBgzwii8clQZgdgdSAEbJtdJKKLMvrALiBDIHuULknCPNuF27QdNfUc/Gdq5p
	CEPJRZUMDEsLxKGpijVWucdBOLvZ+wyEbimJxSUZFBPum/jlcAZ0BCR70UxWljkw1U6VKBamIt1d2
	TKaEtmATcrB3/+XUxh5yTIdcN6QacoLC03HLpuGkXy5VT8DFQZHjaLHXWNYnWLWG0316Np/p2sJ96
	FF2ET2f/+3OSfzkzflZ4wDqEXhiLM9bhOfixu/ebPO4sDn8zj1KRmlB1K3iyYd2IETsf9ffMyqVeE
	HyAl9iEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMHUZ-00000007kFs-1ufc;
	Fri, 21 Nov 2025 03:07:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMHUW-00000007kFM-2XUo;
	Fri, 21 Nov 2025 03:07:21 +0000
X-UUID: 300b1588c68711f09f706fa2197c6ceb-20251120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=7qiaKkWHgo6SRRu39VglkNqMxCOTYNrrd4ihYNZzaI4=;
	b=P2BhhPr+x/ZTbN18GCeuRVJyHbGEsb0b/R+LCZdCB76EdMr37iRe7n9WM5GQcCDqMcy3ZuQXn8mgdLF8Dsg6raFV0X8SHhLaDr1dpnir3dZM8HnHoDDzWDuqNEyrtQODkvjxGmJ3GZYwis6d2C8Jb7j28UjLNZY6rKouxvpbfec=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:5e33d3b7-5137-4e87-99bb-31cfe495b758,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:62ed09bb-0c02-41a0-92a3-94dc7dc7eeca,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil
	,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 300b1588c68711f09f706fa2197c6ceb-20251120
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <ot_shunxi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 218244521; Thu, 20 Nov 2025 20:07:17 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 21 Nov 2025 11:07:15 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Fri, 21 Nov 2025 11:07:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qrmr5woMRpbS89m9s8N138n5VTfomWtygCiz5ZdRSNefj/O4dTDP31dvK//+oDeoPyJmwUFismKoYjAdpnknkRu4AnlpSAwdUriYEJarHcHOMvBnekuRLFcQIBh62RL4R5dZSp7dtAuCJ4qUtk7izDhbMb4YGqZvJi2BCd+f91lkOronLJ/XdJVfntvxdtegJyvPgw54xG228i4lN/Cm/BFHYVMf8ulHfhG1l8e9llzaIkao5t5SKNxVX8TV7KkaeoIEV+k8P0kD4E3GVWB+pGk/x0gidaTp40DfIO19Y0wfWCxc97AZlXQMnB9QmszOHvli5Wt59o6NK/56rfehHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qiaKkWHgo6SRRu39VglkNqMxCOTYNrrd4ihYNZzaI4=;
 b=rQXXQEBOt2+UoQbX8RWhe0pbkD1B7QdGf1j8YWbOrUn87OXIiJRL2gJOQ+2+/mW5ifoAJU2Z0uawotvhANt9jHSUaOuKN1y1eehucd6jY9T6DzKXBhoob6Xnc9GVGfpzzSZ7JTvKstNIIC2PIiALt0LJRX38HqLCkU2l5JsEPN7dbj9ZJbr6LXJ0W3yhn2cLZzRb9iJx6GrFN9DES60wMmpW4dOYDbVASIO44IsgQFJeNjhZAgizZjD5j+XNABAxn/f6nUFcLNSFUtuzLyj4DTPaRmZduHXrxiTPns0+A0hZxfM+U4W0rbH1Sp4l4GoREMUQV9go7eNMYCW2xZ//+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qiaKkWHgo6SRRu39VglkNqMxCOTYNrrd4ihYNZzaI4=;
 b=k225XV4VfE+AK652kA9QMf0Eg5pObs5t4iJi6U+fMr5ajzMIWMaGLSfAF9JNkhBUo8+gwvgOWtyyKaD1v+MwvD4rm6ApTRIae7S/7YrjI7SU6mZ77XxylcQwPsJ89anThxDK3MLUy+srviw2GRPUQiEI2Qkhppk1YbRUJhpcax0=
Received: from KL1PR03MB5974.apcprd03.prod.outlook.com (2603:1096:820:88::11)
 by TYSPR03MB8564.apcprd03.prod.outlook.com (2603:1096:405:61::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 03:07:12 +0000
Received: from KL1PR03MB5974.apcprd03.prod.outlook.com
 ([fe80::35d:48c9:580e:b5fc]) by KL1PR03MB5974.apcprd03.prod.outlook.com
 ([fe80::35d:48c9:580e:b5fc%2]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 03:07:12 +0000
From: =?utf-8?B?U2h1bnhpIFpoYW5nICjnq6Dpobrllpwp?=
	<ot_shunxi.zhang@mediatek.com>
To: =?utf-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	=?utf-8?B?VmluY2UtV0wgTGl1ICjlionmlofpvo0p?= <Vince-WL.Liu@mediatek.com>,
	"krzk@kernel.org" <krzk@kernel.org>, =?utf-8?B?SmggSHN1ICjoqLHluIzlrZwp?=
	<Jh.Hsu@mediatek.com>, Sean Wang <Sean.Wang@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "lee@kernel.org" <lee@kernel.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 1/5] mfd: mt6397: Fix formatting of RTC_BBPU_KEY
 definition
Thread-Topic: [PATCH v2 1/5] mfd: mt6397: Fix formatting of RTC_BBPU_KEY
 definition
Thread-Index: AQHcWhe+csqoXStMWUSue+jpiyZqUbT7kbKAgADh+oA=
Date: Fri, 21 Nov 2025 03:07:12 +0000
Message-ID: <b8c4a2420a5f57f4a646ca7abee86a203ac4bf79.camel@mediatek.com>
References: <20251120121805.6775-1-ot_shunxi.zhang@mediatek.com>
	 <20251120121805.6775-2-ot_shunxi.zhang@mediatek.com>
	 <de26ada1-0d8f-4d3c-a665-091925dd44ce@kernel.org>
In-Reply-To: <de26ada1-0d8f-4d3c-a665-091925dd44ce@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5974:EE_|TYSPR03MB8564:EE_
x-ms-office365-filtering-correlation-id: 7bc5df99-1cf6-4a0d-8214-08de28ab10ec
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?U1FPU1U3UTFZNkVSNnM3QWpiWjZVVmM5Wk9KRUFaeE1EZnFYeGhJN1NQdnhI?=
 =?utf-8?B?Wm9mOFA0ZmxLQUc2bFZraXVWMjRwU1A5TW5xd3ZHRnZPWWN1bzQ5MVlVdG9C?=
 =?utf-8?B?cENzR01MZm5SeVFobFR2ZDVoZ0RpV09mdm5hSllERjhsczNlY1NDWTZrUGo3?=
 =?utf-8?B?Tit5RWRuOU5rVGJMdE8rcTV4TURCeFFXeU1lMGUvSzVkT0p6VTFJNGxvSVB1?=
 =?utf-8?B?V3NKUDVCVElBdVZiTjh4NG5ZSHE1anVNTGxUcW9sMkFaWnMyeXNHOCtaUHpl?=
 =?utf-8?B?NVJ0MndyTFlIUVkybjVVWGg0S0piaFVEY2pFSmdmYXcyaE5QU1FlWlB2bWF3?=
 =?utf-8?B?ZlNRWUJaSTFjVTlZWkNlZUliUGZ6NEFxcVhwZVlkM1Z4bmdHZUpsMmhjZlNr?=
 =?utf-8?B?QjZ5enJEWGgxUGYyU0VWeTVMQ2ZnQnlkZWVPeXBpWUpjdXlEbW9jSktpS0RH?=
 =?utf-8?B?K3dhTEVLcFJzWGpqSytUZm9Bdnh4QnRmbFQvTlZVTWprRlFZUTRqYVQyKzFO?=
 =?utf-8?B?WEQ1ODZQek9FbmRIU0grSkU5c0xJeEpIM0NJTXd0dWZpVDVBRk1QdWJOMkZq?=
 =?utf-8?B?a1JaaEdLTmlCYnhJSWlGdStBT29nczVqb1lWT1U4RnFHMEtKSXAyZU9lU3Zi?=
 =?utf-8?B?VDlkdVowbTdvM2hSdGVLMXltTElkbnR4Z092MmRwaGc4enpkN1JLTlAwT2l0?=
 =?utf-8?B?Y05JSDZXcUhSNkVmSmFQYjNGaTFkdXZwd2VVbnJTaEZRd2xCaXRQS05iWi8r?=
 =?utf-8?B?aUF2cHpBNmVObXZYKzRGa2lTbFNnVStJekFrR1VtYVpFcVlUMTlDR2tSUlZD?=
 =?utf-8?B?UXBUMmNmN3cxelJEL21INWliKzBGSG9ReC8wYWQ1dnV5YmN6dDREeTlLbHZp?=
 =?utf-8?B?YjVpc3QySUx3bXZzczB6dWRSWVZ0aDREaVBqNjhxSFB1SFpLa01wUnR0Z3Bj?=
 =?utf-8?B?KzBieCs0cHFhN3F5T0ZHWDVOczNtRHZJbkZReDdrdHIxc3lKN3pLZXA0ZS9s?=
 =?utf-8?B?V293Y3JyZjdIVUgza3FQYzFtZUpCTkNHT3dNSTZaNTB5ZTRXUWh0QldhM1hn?=
 =?utf-8?B?anA5T1ZjUUcvT1BZak1vNytOcmRnVGFoalQzL0haU2g2Ny84d0twcXJZcEVu?=
 =?utf-8?B?RHlVZ3B2MHd4YnVpaUl0TGhpY0F4MW5DZDNySHVuYnJyWlZrK05BWWJacUlI?=
 =?utf-8?B?ZEdHT3VxLys0VVRSd3lIR1BHQjVXbDJEV0JTUFYzWmNkeHRRZ2NkbHR5b2lu?=
 =?utf-8?B?N0N4b0NGN0JXSzBIL013MGFDSGMzT2plSVo3d3c5b0JSNmF2eDJsY3JvclNC?=
 =?utf-8?B?UG82djdFNU8zNXhTMmU5YjBFQVhuQWNVVUw0QW1temtUZCtWV1pGM29EdFJT?=
 =?utf-8?B?S01IVE1HV3R5Vnp2cnpJUFJUQXVpdGx4d1R6WUZxdkowN2E0aHczaHRwWkFE?=
 =?utf-8?B?eGFEcjRGbVFVUVlXUHNGbjhWUEx2TjRhQTQyWWdTSTFNTEE3Ykt6dmhqZit2?=
 =?utf-8?B?WHVpam5tUWhvbGQvdCtOOHVBZ2drT3hKZ3IrbzUvQ1p4SXN6M2k4bTByY2Fr?=
 =?utf-8?B?Q2VMRXFGNkdNZEVSL1VjS1dlR3FGWEx2ZE95L1Zmd1pNRjZIVmJLMHZsaGNQ?=
 =?utf-8?B?a2l3ZmcvNmliMFVUM0tMc1FqeW03cHB4SzBabEdodDNXWW5vT09vNVlHc0RC?=
 =?utf-8?B?UVRYNFFFbmhuRTkvbGhXczAzQkZEZ2lSL0FDNXVJUG1kVFNUT2llS2twQy9j?=
 =?utf-8?B?RlgvaXI3R08rbjJmYnJTVFlhMGxCdkJHcFZmUmxSZHJlNythYTRRZU9IOEJ1?=
 =?utf-8?B?L3IvVTQwY2ZjeFppWUpQWlBHcmVyaG9EbWhWa0hKY1FYSWhqMFR2dW91Sjl3?=
 =?utf-8?B?RnZZTGp6ejAxdTVFR3hpNENwS2hmbXpFZndOQWVTNGdscUhrMFgyMEhuRmJO?=
 =?utf-8?B?VmZUMkZqakl3eTRRTG5pV3dTUFl1Qk9pdlV2NlN0d2RaTndOckZab2hFM3By?=
 =?utf-8?B?NSsrK1ZHNHNnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5974.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L0ZlZFo5amhRdmdPakx6MjVQMXVOUks1M1FHYitZNHl6RUxTenR6T2FuTzU1?=
 =?utf-8?B?MjlGOWV3b1RBbWxZdW5GY1YxN3VObE9BdDNQbTZMbGFKaE1OUzkvMk1JczI0?=
 =?utf-8?B?ZmxGQkwyaWxZcjNBekkwSFJqUUNJNTVBb0xXQ0FnVnVJZDlERXlqOXFjRnhp?=
 =?utf-8?B?YUpxaUhPMHptdURVUzZaL2tZOG9YanFBN2ZwcHZ3RnE0WlNxSDQ5TlVFcGdi?=
 =?utf-8?B?QlYzRnluL0VlRys0czBYZHp1L2dRMXl3TEptaGNVNHh3L000eTNiNXd6SWJ5?=
 =?utf-8?B?Q1J4TzRoZW1sUWphOElqbGhNeUNGRlhxZ1lIR2Z6c05vTnJsZi9EVVFrcTAv?=
 =?utf-8?B?cDRObWJqOC9xdEp3N1VzdHV2cEJ3VDQ3SGpqNkIra3JnenJXdWRsdVR6OENi?=
 =?utf-8?B?UlVWWFBaQUVzZTNJdGxPenhOTzlSb0liTjk5czlETW1BRWh2anhEOEd3UFQx?=
 =?utf-8?B?clFWNmJKL0lRTXIveGhHZjhtN2ZmU1NkaTErU3RRdXJKS0R1SGNRTEQ0UWNv?=
 =?utf-8?B?ODhzV09KVVIxLzl4YVJ0MjZPWlZ0OTlidFk0RC8yaEJLUk9IcVBLeU0vTFhB?=
 =?utf-8?B?Z3RoNzRVOGJ3UVJuQ0RNVmI1MXJXRUNhZ3B6V2pZMkZndUdSTlpXWENIanpI?=
 =?utf-8?B?bUJFQ0VCZ0tZNVpxNlQyT1B6bHV1alpaOU84b2dVMVd2YjRzUU9TdUhuektO?=
 =?utf-8?B?V2plNHVsekdKSzBtRysyamFUbnFHTSs1bVFiMVhzSGJFeXA4NzhEQ1d1dDhk?=
 =?utf-8?B?UGlPTG9sN3FheSsrbkRWNDUxbEFBL2JWQTNRNGRROEcxZFdsS0pUVmtJN0Q0?=
 =?utf-8?B?WG5hakQyalJmTFFRR0tzRFpORlhiM29jbXlvUVN0ZFR5d2pUQlJSeDUrdW9K?=
 =?utf-8?B?V3hYWjVKbGdSa2FJRG9tK3dvOUJKWDN3djFLNEdSbXVSVnVVTHRxcEdTNEVt?=
 =?utf-8?B?dlg1dXQvWkk5UTY1WlhvWDN1WUVpR28wVGdFN2d0NnBibHUyRVhLWmY1U3RS?=
 =?utf-8?B?aVVMMXA0bjg2NHJ0eCtiTjlrRjRFVVdwZjlDY0dzRWJnVEdBdDUwOSsyYmNh?=
 =?utf-8?B?T0lhRCtKTjk3YzdIeVNBZDRmM05wMWN4UDZqL2lJSjFyalJzZzZzN3NRYUFj?=
 =?utf-8?B?aE5YbTJEREdxZmtoTVk3bnQ1QXJGY2RYeUZISzVObjUzMG0yQzNxeGhMaFF1?=
 =?utf-8?B?K3FHMTlVd0MvWWJEaG16SlcyWktoenhUMW5uL0EvREx1TTdUWmFxNmUvRmw1?=
 =?utf-8?B?dGFzYW84RVQ4VnorR0hXckNBVEpwZXJjd1k0SHI3RVZuSjg2R0s2Ulo5SjlF?=
 =?utf-8?B?WEljbStueERSenY5SzIrMkQ1ZEpBbE1jY1ZOeXBnRnJMRjJsUitkcFRjY3l2?=
 =?utf-8?B?WkhnMGV1cmw5SFhaVG1CTnhzeG0rRGhxTVdJOEFpR0N2VVNzRFR2NzlsM1J6?=
 =?utf-8?B?VTY0WTFrZDVpWDE4bmlyby9wekZndnpqZ2lmcE15TUpUQk1Pb2xCL2tCWGdB?=
 =?utf-8?B?d3RqNFRUQlFFRVlwTk9aM0wxdXRiN0VTMnRpbWoxdXczZUo2WkdmNVVFWW43?=
 =?utf-8?B?NXVXaTFBdGRKdDROdm55MUJkSXJYRlNkZmRTMG52V3NXckJzZks4ZnMwOG4v?=
 =?utf-8?B?T2hiSVhDL0tvMWJHZk9uMlZLaHdDYkhCVnNaVnJJU1lIUmhPNk4zdSs4QU5i?=
 =?utf-8?B?ZWN6Rit4WkNwS1JmTTVISS9NTXpPZGROUSt6TCsydFBXcDR4RndTUnlLNUF5?=
 =?utf-8?B?NEl0d241MTk5NkxoUUsza3FPVW5IV2tpYWIvUG41UWM5VkFvRFdSVHIvcnRa?=
 =?utf-8?B?WVMxM2d3eHFYUjZCd0pPdmY3dnNsQTV1RTZwekVpbTlHWmtRK3o4ZGR2Ym9T?=
 =?utf-8?B?KzRLUlF1bHI1ZGxNc2ZwWUNhSUVieTNacU01eHNKT01pS2ZKWExyemZCVm5k?=
 =?utf-8?B?a2hjQlZCbENDRzhHMk9Pd2NUMDJEZzNLY29mMHAvUjhWV3JkZDZoMHRZRmNo?=
 =?utf-8?B?bXVjb3g0VmlENWhTVm5TTEExSnFienZqbWFCRkF4OG9FZVFxR0dpWHhSc3Bm?=
 =?utf-8?B?QlBMQjhwNWllOVY4V1U3WWpjbzlGb0pTbDFvRnF1bDAyLzNaeXQ5WDV1SmVB?=
 =?utf-8?B?eWR4SkltZnpKNkpOZXg4WlpaQ0JPcldSR1ZhL1h1dGlZOWtTV2NUVmU2ZWhP?=
 =?utf-8?B?RlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A908536E83DC0B4487D98905379493ED@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5974.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc5df99-1cf6-4a0d-8214-08de28ab10ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 03:07:12.1296
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6fEstXnC5YUyMtUen7PZZK63ZvoCsN5pSty99/g6iWOxlUjs1nQn/0DEsUBNxa6fMNDkD7PG7dredJqYpH/Ehu6Gw37aiw0L28J6OfleDBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8564
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_190720_653866_C3FF31FB 
X-CRM114-Status: GOOD (  15.65  )
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

T24gVGh1LCAyMDI1LTExLTIwIGF0IDE0OjM4ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDIwLzExLzIwMjUgMTM6MTcsIG90X3NodW54aS56aGFu
Z0BtZWRpYXRlay5jb20gd3JvdGU6DQo+ID4gRnJvbTogU2h1bnhpIFpoYW5nIDxvdF9zaHVueGku
emhhbmdAbWVkaWF0ZWsuY29tPg0KPiA+IA0KPiA+IEFkanVzdCB0aGUgd2hpdGVzcGFjZSBhbGln
bm1lbnQgZm9yIHRoZSBSVENfQkJQVV9LRVkgbWFjcm8NCj4gPiBkZWZpbml0aW9uDQo+ID4gaW4g
dGhlIG10NjM5NyBSVEMgaGVhZGVyIGZpbGUuIFRoaXMgaXMgYSBjb3NtZXRpYyBjaGFuZ2UgdG8g
aW1wcm92ZQ0KPiA+IGNvZGUgY29uc2lzdGVuY3kuDQo+IA0KPiBQbGVhc2UgZG9uJ3Qgc2VuZCBz
dWNoIGNoYW5nZXMgbGluZSBieSBsaW5lLi4gWW91IGhhdmUgb3RoZXIgcGF0Y2hlcw0KPiBoZXJl
IGRvaW5nIHRoZSBzYW1lLiBPcmdhbml6ZSBhbGwgc3VjaCB0cml2aWFsIHN0dWZmLCBpbmNsdWRp
bmcgZm9yDQo+IG90aGVyIGRyaXZlcnMgbm90IG9ubHkgdGhpcyBvbmUgKCEhKSwgIGluIG9uZSBw
YXRjaC4gVGhpcyBpcyBqdXN0DQo+IGNodXJuLg0KPiANCj4gDQo+IA0KPiBCZXN0IHJlZ2FyZHMs
DQo+IEtyenlzenRvZg0KDQpEZWFyIHNpciwNCkV4ZWN1c2UgbWUsDQpkbyB5b3UgbWVhbiB3ZSBz
aG91bGRuJ3QgbWFrZSB0aGUgImZvcm1hdHRpbmcgY2hhbmdlcyIgYSBzZXBhcmF0ZQ0KcGF0Y2g/
IFRoaXMgd2FzIGJhc2VkIG9uIGEgcHJldmlvdXMgY29tbWVudDogDQpodHRwczovL3BhdGNod29y
ay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvMjAyNTA4MTEwODE1NDMu
NDM3Ny0yLW90X3NodW54aS56aGFuZ0BtZWRpYXRlay5jb20vIzI2NTE3NTM4LiBJZiBpdCBkb2Vz
bid0IG5lZWQgdG8gYmUgYSBzZXBhcmF0ZSBwYXRjaCwgSSB3aWxsIG1ha2UgaXQgaW50byBhIHBh
dGNoIHdpdGggb3RoZXIgY2hhbmdlcyBpbiB0aGUgbmV4dCB2ZXJzaW9uLg0KDQpCZXN0IFJlZ2Fy
ZHMNClNodW54aSBaaGFuZw0K

