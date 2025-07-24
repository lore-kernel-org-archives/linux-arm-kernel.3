Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37539C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 06:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NXIkP/4s5e0AkaM7nd7cWwV+Q6q2Vnay/LpUkeGnDUU=; b=EyRVmam8AEFy+x+YzYL7Y3M85l
	KGQW4gBeAdAxs08i6I6rEWeZ77gty8MYwX8I1f+niFecbj3xLHYa/bM7w7xhhc4nVKSIk4BC9+8sz
	x/HBc+o8qpt8TJ3+GoTUL7C8cEoguKxYKfsimu4f3dpjzp6sMmkjmnQ1JDklJpGHFhh8LhZ6zgM65
	yyfEkYmJjuVXMdF2QPs05XlI4yNoj/+QQ6NqBWHM9IBu4Oqrk83AQ92nXBxhixHzNWK30lWw5Jgjc
	U6T6YMbFke/Zw2Jdlq1XZR6wh2rfi7ifaGcI+IExOrXOOSMcAFyPNdUAQ4QEj/fnWIG7u3lgwSjVL
	ff9ZjT0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uep0j-00000006ZW6-3hXj;
	Thu, 24 Jul 2025 06:00:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueoxS-00000006Z1s-28f3;
	Thu, 24 Jul 2025 05:57:35 +0000
X-UUID: 1520b8be685311f09eb0dd999d3936bf-20250723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=NXIkP/4s5e0AkaM7nd7cWwV+Q6q2Vnay/LpUkeGnDUU=;
	b=BVdHvloCX37bR4WtPw5LwpsV6Qt5ETt9wlNliDMZNL3gX3uDsmBrdAzj2UbrriEZW9Dw8zk5R+DP7W1uO8Xw3PsoOOLkLW4+SpPHcFV8gvrAENFj/eDKdDTkcQCz3B6YRja3xVXOzjlfTWaf7AECHIc1Qi70bWBWIrmlWKLEb7g=;
X-CID-CACHE: Type:Local,Time:202507232241-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:fd42f40f-eb47-4903-b96c-07d7ad160eba,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:97ad1e0f-6968-429c-a74d-a1cce2b698bd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1520b8be685311f09eb0dd999d3936bf-20250723
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 583426051; Wed, 23 Jul 2025 22:57:29 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 24 Jul 2025 13:56:53 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 24 Jul 2025 13:56:52 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CHzE+EaglTWPtXua7UQRtoo3pTboeFVVnwOCUwP3qbC9frvW/wtJiofm+cPW1Jm2LT8i4Ikj+AogZq/wU3jvDqPq6eAmDhXnyMW5TPIYshtXkBEQx//kBDV1X/xv6CnNkHT7TJgpbEhLgERg45Hhm0rE/OZOI7wQ21ZmGw7XaAQqTT57kTMLDYWo+eMZz0zG1PmOBDhQ5AsNM1HyB+qH7aj8HWBebbEs6ljhB4sNHBlFxOegvHEk/g2ZOGxD0LQDpIZqLDgxn6i57+PmQR1vU+tM3UT1SLp0EV3QZPRRVsaf41Tc8hrjVBeQOJJf4HtnwQ8qHZdZiC3fGKRhW1eGag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXIkP/4s5e0AkaM7nd7cWwV+Q6q2Vnay/LpUkeGnDUU=;
 b=QUe9WqhW5ZnGNqN00I5bDgFAdzET2Kcdjkm6Ud+kM4X0sS+plWc+juiizNt2oyAC3bJG7f1NjIgil93Dk83SA3ldRhpfsPDa+QzAP8Lp+9+iVY/eVAdmPOgACrs0gXdk+owLY40af9pnr65IWJDmP0yRoobOu9yo5Z+NMQv+CfaNItTH0sXhEJzf1wbWmooXvuIo9L8RIDxGrRWO+JNNGrod1GWIdciLuWJ70UJSF66hWbH6ap25fybuk5zx+eLOqwcCqHlVCxHk5Pq05Nq0GJsqPswM5xaGINcTctA9BsASJ8fD4mYkpJ0O9+4pw+2PrqUechNcvkO9nZU/vpHiog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXIkP/4s5e0AkaM7nd7cWwV+Q6q2Vnay/LpUkeGnDUU=;
 b=oteyQKK7QNwGV1JQUhYWXDfo1YwnaeapD27fxMDZ4pz7fYRfE0Ez20E6Dcm2pxcsoN3BFAcoRnrLDtgPV8Y4UxxWE3oLs/bORHXnVCO09zREelH69T40TNBmfiaQjMXYPF+Nwq/nUBfewKNTnQv6ujwtu1vC/l4fjO29CJRnZc0=
Received: from SEZPR03MB7810.apcprd03.prod.outlook.com (2603:1096:101:184::13)
 by JH0PR03MB7835.apcprd03.prod.outlook.com (2603:1096:990:2d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 05:56:52 +0000
Received: from SEZPR03MB7810.apcprd03.prod.outlook.com
 ([fe80::2557:de4d:a3c7:41e8]) by SEZPR03MB7810.apcprd03.prod.outlook.com
 ([fe80::2557:de4d:a3c7:41e8%4]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 05:56:52 +0000
From: =?utf-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	=?utf-8?B?Smlhbmp1biBXYW5nICjnjovlu7rlhpsp?= <Jianjun.Wang@mediatek.com>,
	=?utf-8?B?Sm95aW5nIEt1byAo6YOt57695ZasKQ==?= <Joying.Kuo@mediatek.com>,
	Guoqing Jiang <guoqing.jiang@canonical.com>,
	=?utf-8?B?SmluZ21pbmcgSmlhbmcgKOaxn+e7j+aYjik=?=
	<ot_jingming.jiang@mediatek.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	=?utf-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?= <TingHan.Shen@mediatek.com>,
	=?utf-8?B?SmlleXkgWWFuZyAo5p2o5rSBKQ==?= <Jieyy.Yang@mediatek.com>,
	=?utf-8?B?Q2h1YW5qaWEgTGl1ICjmn7PkvKDlmIkp?= <Chuanjia.Liu@mediatek.com>,
	=?utf-8?B?Smlhbmd1byBaaGFuZyAo5byg5bu65Zu9KQ==?=
	<Jianguo.Zhang@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Remove suspend-breaking
 reset from pcie0
Thread-Topic: [PATCH] arm64: dts: mediatek: mt8195: Remove suspend-breaking
 reset from pcie0
Thread-Index: AQHb+iZWCG0KxKyzi0y0YhAzFhw1VbRAqV2A
Date: Thu, 24 Jul 2025 05:56:52 +0000
Message-ID: <02910dd923a9267a82e0ebf22ec0248e71d71e71.camel@mediatek.com>
References: <20250721095959.57703-1-guoqing.jiang@canonical.com>
In-Reply-To: <20250721095959.57703-1-guoqing.jiang@canonical.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7810:EE_|JH0PR03MB7835:EE_
x-ms-office365-filtering-correlation-id: 9a44186a-e6b5-4717-2f36-08ddca76e33b
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?dXMvUEZzUjJlQ3BTWjA2U3hLbmVaYURGa2UwZnVBTTlSMkFhZU84WnNXMU45?=
 =?utf-8?B?cmZBc3p0cHUybU9pdXNmVXlGQ29XbnhoM0p6MFU2UzBwQ3lLNUc1TC9mWmt2?=
 =?utf-8?B?eHU2a21HUnZGYmVldE1OS2hxS0ZDVTlTSWVEblEzK042TXB5RDEwZktBTzdl?=
 =?utf-8?B?Z21KN0M2WG14bWVBUjN1dkh3TUE3UE1RRkY5eGl0ZXZXYkttRzJpODIyNitw?=
 =?utf-8?B?VC80azN4WUZGS3czdVJGNHIzMzB6cDQ4Q0VlbUQ1U2Rsa0lEOW9qaTBZWEhi?=
 =?utf-8?B?WGJRVjMveEtML2FNTFJjR1l2Q2paakFSM2VMb2xLSmRNR05hcFF5MFVzcDNX?=
 =?utf-8?B?Nkt3cm5LQXVrYjFLc295SmhHc1BxUWo0V3J4YlV3UmVhSU55L2srZm0xS3NE?=
 =?utf-8?B?bUQwd2RSMDcxakFDYVAwcnNreFdEcHlwRlJPU3RlM3JrcXIzUm1PNnAxY2dL?=
 =?utf-8?B?NytVd3RLK1I1bHViYVozQWgrOVQzdiszRkZ2cnI5VEtuZDZuS1ZDRFl4cVBH?=
 =?utf-8?B?MG1SK0lPVWNISlQ5c3VnVkNJWjNBNDhER0VtaTZSU3dIdDJDNkRlT1QyMjFF?=
 =?utf-8?B?TjNkeHpjVUZGNjB6OUhkRWJBbWdJNHJhSVhlWmx0MkpaYVZHeEpkZndHNHpy?=
 =?utf-8?B?UTNvSUxCS3dZTnRnaHE5Y0lham8rZUJISTZRME9tUzQzcFRMMkJ4S2ZuNUlX?=
 =?utf-8?B?QkV5Y0VUYktWaSs3WVRVOGRaeTQrOHAzZnZJU0tqU2ZPcUdVUjJsQ2Z5allv?=
 =?utf-8?B?UFU1d1JXMW5xb1BlVjVOWmpVMUg4S1NWYWRqM3BVYmhoNEFKQUtVYXBoT0dr?=
 =?utf-8?B?YkZ4cFZVY2x3cyt6czI2T0phU01sc01rcmgySUFFbU9NanlWVWRUNmU2WE84?=
 =?utf-8?B?SGVKNWJsVjRPd3NDSTN3RnJDL2JKNjFvQWxPSlIwdlU4eUYwTysyYnhzSFZk?=
 =?utf-8?B?MUpuazEwVXE0U3ZPc1UraUlGTWcxb2M4b2hFOURheUFnMzNaRWFPNlExRmw0?=
 =?utf-8?B?UXE4OEFvVVNITER1Yk42Z29uM1YrTk0zVUhSV3R2TjY0VW5sNFB4cmxUL28w?=
 =?utf-8?B?R2dGbjYyY0xDNU9ySEpZNEpPM05MUnprMmtJdW5TRkRyRjBZV1Jzblc3amFl?=
 =?utf-8?B?dENvdkRCQ2RDTmt3dHVPaGEwVWZ6SnpyODFOaWQreXMwVDNlaTJyQWY0YkQw?=
 =?utf-8?B?bEh3Q1UrbFgvUFRhSTNHVWJzWUxIbnROZERyMkhJOGgrbDhkWlJFY2NJeHFl?=
 =?utf-8?B?a0xoajRRZ1BQNFNIbVZWVjFvbGV5a3AydUNIOUNNVndTNi9McmNSbW9CRHd6?=
 =?utf-8?B?eWNLd1lkR0w4Q2RqdkZzZDdWU28yZzBEdEttQnhOVUE1dnRNTklTOVdnNDRT?=
 =?utf-8?B?Zm1pQW9yVnBveDJuTVpkdHFUTm1NWE16UVRWYnoxT1gyeG5TSU5heG91bGRH?=
 =?utf-8?B?OGFwT2RyOFROZjZtMzE5eWxtTlFTZnkrZUV1WFpBSHRVK1VXNkhQcVZUQ3J5?=
 =?utf-8?B?YTRYcHhNR05aZmlFOU8xNlVmMm5GUTN1R2VmOXlrcUNPMmM3eUQwRC9iVTVX?=
 =?utf-8?B?V0QyVXhNb0J5b3lqd2tFcUkrU3phajNEak1TSEl0eGtwZlM1NkFGT3ZkbVRM?=
 =?utf-8?B?T2FTcnZQNjJpSUJBdDVaVi8xK2lGZVBEcVU5eWM2RVFwVkVXTStiSXFhKzdq?=
 =?utf-8?B?cTJsZGpWSkRkeG5PZG5sNFZFK21VUVlEaU5uUTM3ZVliNmxHMFBOakI0Rmg3?=
 =?utf-8?B?MUs3MC93NnY2Q2FxbXZCdVVPT2JUM2kvZmk1S25IMnp0L0VXWHRMUVZ2RHBW?=
 =?utf-8?B?UWVwVnE4R0J5bHExaVk4VWlNZFRRMzlXelg4NmFRdlVGR2RWVHB3SG5Jc1Z3?=
 =?utf-8?B?SlRRYVJNU3BhVXZScmwwdmltT0Ivb3hjQVhUYWJMdUJhajZ3d1ZNbTBEYjF3?=
 =?utf-8?B?NmMwclppMzZxTy82WUVNODBFZytacmZmYWRXYVlxRThFOXRKUzA5M3ZNU3c3?=
 =?utf-8?Q?zCnjZjEBOoEMtQyWMlYB7bkIqG6PNk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7810.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V2JjWHdRVW05cFN0QVNXdytGL01ZWktjVDJ0ZDdpaUFvcjA4d0VXbkQ3VUFV?=
 =?utf-8?B?YU1CRWw3NzhMMVFJRHVMYzlHYSs4eWIrNzduc1FBTkxVZXBwYUZQZUF2REVW?=
 =?utf-8?B?RG9PRU5BUXJaTlJYMTV6UXRYdnRtQnVlS2gzTEFFSzZIZE0wcGlFNWRqK2Nn?=
 =?utf-8?B?eStrNlVlK2dLZk9PSkE2OEF1NWZ5ZzdIM0pOcndEdmRzRUQ5WVl5aWFCZUZv?=
 =?utf-8?B?VGI1bnQ5VERWajN2TklKdnYyeFNXMzRtR1ZndWpRSDlHdWtRT2M0VjZqWjZW?=
 =?utf-8?B?aXdYdHVPejUwNGk4ZG5MKzJUYURHZktlN1NFbU13WkpSM3AvZkFIVGYwVFlH?=
 =?utf-8?B?YkVBWlRDaldORUNDcitvQkcrMm1VT1lHWVhlcnYyUmFsQ1ZFc0dsNWJVNExG?=
 =?utf-8?B?Q0pmRjE2dUczeUd2MHV3WFRlMnFKcjNYUFpodDZmNlhCZXBNcGl0djEzanRV?=
 =?utf-8?B?cEl4UnhzQlNVQU1YaXV6WDQwLzI5TDRJUmRHbDNoblVtaVFXUzIyUExyQTlV?=
 =?utf-8?B?MVhPWG9uQUI0ZHZvMW9yKzZOMHAvVWlIU2p5SnNsZEVvZXN0ZjJvckZ3Uk41?=
 =?utf-8?B?WnpDZ0JSa2ZUR1JrVXhWWTByWHREQzUyMzZwZWJqSjBhNWZveUMyVGo5Z3RK?=
 =?utf-8?B?djdpV0FSZlZkbC80bWJQeFU3bXpjbS94OVhwVDR0c0xGRm5xZVExeXEvcTQx?=
 =?utf-8?B?M0lnQndNbktCd0dyWGh5T3pBTWNpT0V2bTRDS0M0YnN3V2hZRkF5YzR0MlU0?=
 =?utf-8?B?cTRSWGhFUnNIczN2bFZIeDc5VGZhYU0wU2dYemRUQ3kydnVvV3M2bExxSU9y?=
 =?utf-8?B?bUIwckprQm0vekZSOG04TXN0TEtpNFcxR1lNTlRKTkQ5b2FYeXVCVXkyQ01k?=
 =?utf-8?B?dkhSaERwQXZBRGlmM3g1UlhWRDdIbnNPY2lLOThxMmtBcEI4NGRjWlNKcW9K?=
 =?utf-8?B?UWREQThIYmhPUFlkN1pEKzNBSExzZGtoZEhhWitzUStUOXFpcEhiM21Ydzl2?=
 =?utf-8?B?eTFhS01pdWZGeXQ4WWF3WTNGT2JzVXVmZnpTYUwwcXlPUC85Q1RSNTd2YXRk?=
 =?utf-8?B?azBaaitvODdDUWVLVGlvdUNnT3VBdGVXWHkzWStGQVdOTHMyWnVwYVhmc1hK?=
 =?utf-8?B?WkE5VURPdVRMNlV4MjV5MTVDNzZrTy91eFROdmF4N3dYK1lxdWRVL1Y4WS9k?=
 =?utf-8?B?ODRLOVZ6a0ZtNDJSNkZUQnNZVzBDYkZDK2dMVk1QVlNWS0VXbkQ5SWZNT2ky?=
 =?utf-8?B?Z0FqVlozdHBlK2dlcEw0L01jME1aMHFrMUhzZEtWVTBicUNQMlA4NjcwbGVp?=
 =?utf-8?B?YWtldjU0NS91TmNOUjQ5UXZXdHEvZFp6dGxtYXREVWtjQ3VOR0t1Y1ZRTkIz?=
 =?utf-8?B?R3Y2OHZVMHF1OWtjR3hDR0hpamdNVUlidTBGS1dYcHl0MjJsQ0puL3FCajc4?=
 =?utf-8?B?RmJNSHUwZUpCMXVxcE9SdDNhODRNTTIzRVlhanREU2I0QjZmMmkzNXdSWm96?=
 =?utf-8?B?T1U5dUZFeFV5QlBUTU9pQ3VqTUIwS2orOVExVlRDa0pOYjFlU2tqbzJLR1Zn?=
 =?utf-8?B?dW5JR0pSYUlDcnBRNTBxa2RaUlByWEtvdDZBZHFqTk5HczdZWlNzOHJyVnZL?=
 =?utf-8?B?enpxRGg1S0ZCbDNaaW1za3hhcys0WTUxdFFMK2tvdG9JR1hhQmF2eW4vUEV1?=
 =?utf-8?B?QkJpcUE5OUNFemVDYU43SGRqUWw3czl4aHowcG5UUzZHODdqUnBGY2F5Q3pn?=
 =?utf-8?B?QXpnc2VFb21SSW56RXBQaTR1MGxzMG1iZ1Z2bm1kSjRzdzl6YnlpbXhWYy9j?=
 =?utf-8?B?R3hLSzJZKy9lSG0ySjduVWpGYjRDZ1I0QkR0SzdYZkRjTHVmdVFGZUNEYm03?=
 =?utf-8?B?aWtET0kyWFpRWFFZRHBzTmxJbEVOZUtUSFBMZTRzQUxDUG4xUEcrM1hKSXpG?=
 =?utf-8?B?Mlgvc2RERjBkRmt0bUlXeWFmc1I4aWZSK3hVUGtGS01POFZUKzNVVDhKQVNT?=
 =?utf-8?B?QmlPTHBvMFNqWEhFVW1zQ3ZyNU1tYUpHbWFGdWFCWmRMMkJZU2ExbWVxSEN2?=
 =?utf-8?B?MUo0YUozTEpEMXpWTnBrMERZVFBlbExpNjFKWWN1S2toUEpmNytpSk5hTkZN?=
 =?utf-8?B?OGRoT3BUUk4zekxLUHlTeG8zMGFqM05CczBYcjJUU3Y5ZWtWS3VxWmFZTmV5?=
 =?utf-8?B?NWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F814632C7665B94899D8E42FB60D6CC0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7810.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a44186a-e6b5-4717-2f36-08ddca76e33b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2025 05:56:52.3693
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZxYeYyVB6/5XFpM7RoyANMMq6BC4CBw8U4T67fvAZXRjQLh+bE3JYOgwjSlL/KwfKQNwhg6WhzRPP+RO3jKsPCV7FHvM+A961SGTfbaR1Kw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7835
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_225734_549916_EB2EA6E9 
X-CRM114-Status: GOOD (  18.50  )
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

T24gTW9uLCAyMDI1LTA3LTIxIGF0IDE3OjU5ICswODAwLCBHdW9xaW5nIEppYW5nIHdyb3RlOg0K
PiANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4g
YXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUg
Y29udGVudC4NCj4gDQo+IA0KPiBXaGVuIHRlc3Qgc3VzcGVuZCByZXN1bWUgd2l0aCA2LjggYmFz
ZWQga2VybmVsLCBzeXN0ZW0gY2FuJ3QgcmVzdW1lDQo+IGFuZCBJIGdvdCBiZWxvdyBlcnJvciB3
aGljaCBjYW4gYmUgYWxzbyByZXByb2R1Y2VkIHdpdGggNi4xNiByYzYrDQo+IGtlcm5lbC4NCj4g
DQo+IG10ay1wY2llLWdlbjMgMTEyZjAwMDAucGNpZTogUENJZSBsaW5rIGRvd24sIGN1cnJlbnQg
TFRTU00gc3RhdGU6DQo+IGRldGVjdC5xdWlldCAoMHgwKQ0KPiBtdGstcGNpZS1nZW4zIDExMmYw
MDAwLnBjaWU6IFBNOiBkcG1fcnVuX2NhbGxiYWNrKCk6DQo+IGdlbnBkX3Jlc3VtZV9ub2lycSBy
ZXR1cm5zIC0xMTANCj4gbXRrLXBjaWUtZ2VuMyAxMTJmMDAwMC5wY2llOiBQTTogZmFpbGVkIHRv
IHJlc3VtZSBub2lycTogZXJyb3IgLTExMA0KPiANCj4gQWZ0ZXIgaW52ZXN0aWdhdGlvbiwgbG9v
a3MgcGNpZTAgaGFzIHRoZSBzYW1lIHByb2JsZW0gYXMgcGNpZTEgYXMNCj4gZGVjcmliZWQgaW4g
Y29tbWl0IDNkN2ZkZDhlMzhhYSAoImFybTY0OiBkdHM6IG1lZGlhdGVrOiBtdDgxOTU6DQo+IFJl
bW92ZSBzdXNwZW5kLWJyZWFraW5nIHJlc2V0IGZyb20gcGNpZTEiKS4NCj4gDQo+IEZpeGVzOiBl
Y2MwYWY2YTNmZTYgKCJhcm02NDogZHRzOiBtdDgxOTU6IEFkZCBwY2llIGFuZCBwY2llIHBoeQ0K
PiBub2RlcyIpDQo+IFNpZ25lZC1vZmYtYnk6IEd1b3FpbmcgSmlhbmcgPGd1b3FpbmcuamlhbmdA
Y2Fub25pY2FsLmNvbT4NCj4gLS0tDQo+IMKgYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9t
dDgxOTUuZHRzaSB8IDMgLS0tDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTUuZHRz
aQ0KPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTk1LmR0c2kNCj4gaW5kZXgg
ZGQwNjViMWJmOTRhLi41MGNmMDE0NTIyMDggMTAwNjQ0DQo+IC0tLSBhL2FyY2gvYXJtNjQvYm9v
dC9kdHMvbWVkaWF0ZWsvbXQ4MTk1LmR0c2kNCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9t
ZWRpYXRlay9tdDgxOTUuZHRzaQ0KPiBAQCAtMTU2Myw5ICsxNTYzLDYgQEAgcGNpZTA6IHBjaWVA
MTEyZjAwMDAgew0KPiANCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBwb3dlci1kb21haW5zID0gPCZzcG0NCj4gTVQ4MTk1X1BPV0VSX0RPTUFJTl9QQ0lF
X01BQ19QMD47DQo+IA0KPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmVzZXRzID0gPCZpbmZyYWNmZ19hbw0KPiBNVDgxOTVfSU5GUkFfUlNUMl9QQ0lFX1Aw
X1NXUlNUPjsNCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHJlc2V0LW5hbWVzID0gIm1hYyI7DQo+IC0NCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAjaW50ZXJydXB0LWNlbGxzID0gPDE+Ow0KPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludGVycnVwdC1tYXAtbWFzayA9
IDwwIDAgMCA3PjsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBpbnRlcnJ1cHQtbWFwID0gPDAgMCAwIDEgJnBjaWVfaW50YzAgMD4sDQo+IC0tDQo+IDIu
MzQuMQ0KPiANCg0KUmV2aWV3ZWQtYnk6IE1hY3BhdWwgTGluIDxtYWNwYXVsLmxpbkBtZWRpYXRl
ay5jb20+DQoNClBsZWFzZSBoZWxwIHRvIGFkZCBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZyBu
ZXh0IHRpbWUuDQpUaGFua3MNCk1hY3BhdWwgTGluDQo=

