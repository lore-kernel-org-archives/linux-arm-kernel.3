Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFEB5CFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 09:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBtN1lL05l1oIJMrwxXXe3h7NbHeBx/F8hCLYbskX3c=; b=g3gDnvxGb6UDkGLSd6gG/XlECx
	iMSU8DPR/vQQY+tAPEIMwyaVBotEQsGCjBswLr5BcWUOcqW81MiqUdSlbk3339Wy9lsY4EmgoNf0E
	Sc8U8D2GKtZBqNXJ1VfIVcgVIz1DCVminwEOn34ZvkMYrsus5RsY206rT0JWjT5XYmbA+HxSQkUyx
	CTYvj1Yk7ISots0/yA/i+KPWNRyhOEX6aZG4M+thY4NCz8kGuo1CnosGuMx11hFi2NiE2pitNqgao
	M8w8zUooGqkCVV6y4qmNWaTj47HqbIt1xmvf0hq3s1Zy2jxmt3BAu98EuB0DQ4N8h4UqEeJ2y5zFs
	hEDrp1dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNSed-0000000BJzg-2v1S;
	Mon, 24 Nov 2025 09:14:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNSea-0000000BJys-1Yjd;
	Mon, 24 Nov 2025 09:14:37 +0000
X-UUID: faa3fc7ac91511f09f706fa2197c6ceb-20251124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=rBtN1lL05l1oIJMrwxXXe3h7NbHeBx/F8hCLYbskX3c=;
	b=TSPyT63jhGnO8s/xRgT3Jxj+UO40Wp7n+DZ7ftsTUkgeO9aaIRSYYuDL56A10A+UZpyz9np4PFGGcHEf5YX1V4sz3CURhAkx128DjfIxbyzctX4zoTwWZ9831djDM4JN6Scnfd7RudUMtfMbYp96yd6BUQQFe9mOW5EuWXLQL84=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:d96f77f1-287c-47ac-a827-5687eed9b6db,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:e6eafb82-b6af-4b29-9981-6bf838f9504d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|51,EDM:-3,IP:nil,URL:80|1,File:130,RT:0,Bulk:nil,QS:nil
	,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: faa3fc7ac91511f09f706fa2197c6ceb-20251124
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <liankun.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 322242758; Mon, 24 Nov 2025 02:14:28 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 24 Nov 2025 17:14:25 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Mon, 24 Nov 2025 17:14:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qti7iRyC0lA+AzbpOEbvY1a0rUrpw4ihwMqS8Y5AZ99fB9/BBZtArku1gXK6qzktckrYPLMp8vr4MN1PLCcIRT1xVsCWIZIJ1G3tkvleQTyHLEFi8VMh7ebo6shUUOq6AKUZNKj1EI/FLpXmsPjbsLVtthfo3RD5ZEUaqmOB6VYXRnuG7Pz1uSv0MF7Gk53sEb+O06jnY+5+DY8l3VzGUWmn7xmXtLJhpSpOh3Odbn6HUN/yjhAwC45D5spQePb2p7NQ4TVN959mA3z4ioOWbrlNJPNsXNkYzKkeQGRxFS16NbEjeXNp+SaSPGGW0n4MjsizGjcx+6KBXgdNaCHLXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rBtN1lL05l1oIJMrwxXXe3h7NbHeBx/F8hCLYbskX3c=;
 b=nCtFECQjlgdLHdiN2+h8s1r185ARpGep+qMEu+jJg4QeJOfHqtwNj8nMsZX3yD4BvX7OBML6XYYzH0HoCGwImqRcrYN0ZhQiIaiWiOUmCGeWM8P3ej+NNU5nEEGm8thtzQM6lRalgaRQTHIgt/j35KMwngV8EsEnVyB4rHc/G2MZs0Qi4o/KMv241rueP+shEN/Tv3xV76QSdpVK06Yf84ME24l9UROh5cMyHXSc3SurGBVbjUSqmw/3iMM16mN/rxBr/h5VtASd7qt6Q4FeDOAvebdEFxoeS4vYDnTwK+xWQIAValrCj8VJuwM4uWSuh6+blvU72VYl4+HhKHjR/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBtN1lL05l1oIJMrwxXXe3h7NbHeBx/F8hCLYbskX3c=;
 b=forZSCNH7rx7+6nCko2TMhRlO40IwGh0pho9VnNJqVYY4jkexms7Wt0NKvn5S4AlAAVk84X3kvpCpzGL4RoRW4L0BiEjf36hX2t79n1GAXClI4NUgAwdGA30HVD2NnlsDSJ5LdpdRA1oIHHA8FV83XnqjENzGglf6epOw1a9u4c=
Received: from TYZPR03MB5760.apcprd03.prod.outlook.com (2603:1096:400:70::13)
 by SEYPR03MB6532.apcprd03.prod.outlook.com (2603:1096:101:89::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Mon, 24 Nov
 2025 09:14:21 +0000
Received: from TYZPR03MB5760.apcprd03.prod.outlook.com
 ([fe80::7a62:8e4a:b62a:3c13]) by TYZPR03MB5760.apcprd03.prod.outlook.com
 ([fe80::7a62:8e4a:b62a:3c13%5]) with mapi id 15.20.9343.011; Mon, 24 Nov 2025
 09:14:21 +0000
From: =?utf-8?B?TElBTktVTiBZQU5HICjmnajov57lnaQp?= <Liankun.Yang@mediatek.com>
To: =?utf-8?B?UGVuZyBMaXUgKOWImOm5jyk=?= <Peng.Liu@mediatek.com>,
	=?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?= <Mac.Shen@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "simona@ffwll.ch"
	<simona@ffwll.ch>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	=?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 1/2] drm/mediatek: Adjust bandwidth limit for DP
Thread-Topic: [PATCH v7 1/2] drm/mediatek: Adjust bandwidth limit for DP
Thread-Index: AQHcTWmO3OYFqtLGQ0uUopbs6IX/eLT5z/+AgAfanAA=
Date: Mon, 24 Nov 2025 09:14:21 +0000
Message-ID: <dfd8767809d52efee2e7592e4b45cfd2425334b8.camel@mediatek.com>
References: <20251104085957.1175-1-liankun.yang@mediatek.com>
	 <20251104085957.1175-2-liankun.yang@mediatek.com>
	 <18cd9c74699b5afe4d0bff9a6c325389d2881e29.camel@mediatek.com>
In-Reply-To: <18cd9c74699b5afe4d0bff9a6c325389d2881e29.camel@mediatek.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB5760:EE_|SEYPR03MB6532:EE_
x-ms-office365-filtering-correlation-id: 33bb6766-7805-4c5f-b8ae-08de2b39dab0
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?OG9MemFjRXp3K0svQWRZd0pMbDhrT1RadE5ielcvTkE5UUtOeUlJUkUybWtC?=
 =?utf-8?B?c1NocDJMWjcySm1MSnZZVTd6bXBBV2tkcGRwYUVHQjZVejgrRnRieGJ4NXFs?=
 =?utf-8?B?cXpybVRKK3pxeGU0RkxDZkw2UDVFOGl2bDlyZm5vK0ZTcEt2SU1sS21WVkMw?=
 =?utf-8?B?UVcweVUwWEk2UnRSczBSUzYzWUo0NStpbUpCc3h1QS9uSWxGa2V1dDRta2FH?=
 =?utf-8?B?clNXYU1UbFlVTGhydXZIdThHR2dCUUtnTGdabUU0NzB1RGxrWjRJOUgzWHQ0?=
 =?utf-8?B?Rjg5MFhaL2FndjF4L2ZhNlZpTnBoRkFDeEFOMVFVNnJ6TUE1WnJ2czFNdVZr?=
 =?utf-8?B?MmdGdmd4KzFQTkNtazY0NHAreEgzMCtYaHRETE1YdjNMQWQ2ZWhEc011emFz?=
 =?utf-8?B?ODF0dlR3NERmUVdZc2dveHdlMFZtY1RJZ2V4RmlKWnpGT1JmcGpBdTBoUDg3?=
 =?utf-8?B?YTZOUHNSTS9rd1RSbG96SGNmclcrdUpmRUp4d01SYmQ3TmVyTUhDNmxWUWZT?=
 =?utf-8?B?YmQvQ3ZraE54V2pNR2lTTGlzc3o3S1c3cmtXM3grNVIvaDJtaVNLUVhxOEMy?=
 =?utf-8?B?Y1BGT3pQb1AwNXJ6dXRpbHlqQUgvMFgvVHVGUkJoQlkybkM4SktaaDBiR0Vx?=
 =?utf-8?B?aUgwRG5Dem0rZTVkcUtWVnNrWFZTTjB0eVliMzJham40b1pLcXMxYlpiZTQz?=
 =?utf-8?B?NERPVk01MXA3cmRMbXBubnkweUJrNkxCbC9WZlFDRUl0TFFKTktjd2xmZVJD?=
 =?utf-8?B?clh1WjZXc3FaWUd3UmwveXJSQzQ5UXpJaXJUOFZsQXlqakM3MkN2NkxOVk5w?=
 =?utf-8?B?Z0U3YmVBWkdSd1BRYlRvQWJoMUgvaFBWdnBYZ2F5S0ttcFNCVmhVMlQ2aXZ4?=
 =?utf-8?B?NXVNMnVwckkwak01WElvakFWSXhraVlYWkFnNTFLUEk1WTQzQUxNSkx0MGNL?=
 =?utf-8?B?R3liMmpiL2VCUGIwQTNtK0RwbHF1ZE5MQVlUcXdvUnA4Tm9RM01hb1VrcnhD?=
 =?utf-8?B?VUFXWFNtTmQ2SjBEenFHOFhlSCtUUVNnQVh2QzRzdGV5OUlPaFZDVGtPcVAz?=
 =?utf-8?B?dDVzU2JvdkJVSUNuTzFZa0xaeVhuMHIzQ0ZRVElqYTVxOHF5RUlGMWdVRjMw?=
 =?utf-8?B?aUFhMXNZSzFnL1VENjQrZW5mYjI0T2h5UEpveTVnNDRJNnFNem9FbkVrdUxW?=
 =?utf-8?B?bmRKSWhTcnQ1K1RaMDVlaXlxVm9SNjh3b2ZOVXVqS1VXUmhHdVZRRUxyQzdk?=
 =?utf-8?B?WDRFcVJYYTRNSUQyV2x3bDZHS0VwK01Ja1ozVVpETUdBRVJ4Smh5ak4wWnNZ?=
 =?utf-8?B?Y2pnTlA4QjlvNW9seFUvNlNESVl3TGdNT1J4TURTVkpubHJUdWJnWTh4TzNk?=
 =?utf-8?B?aGFwYjZhb04rd0FhVCtTb2JNd1IyaFVZaVgxYzVKOUNQUko5dnB1M0s5SStH?=
 =?utf-8?B?TkpiUDd1VVZmZmdMUXVTdFJ3SENrY3FDMWMzN293ZUNaODZVbDhsaVdvZUJV?=
 =?utf-8?B?emRlMloxMS96UmMxbjdhWHNVQUFiMzFGaTBGZlpmY2oySkVON0kydTA4T2l5?=
 =?utf-8?B?TFBadENuN1g3Y1FtYWFERlZGS2FGa0FGbDd1Y1MreTJLNkc5U2s2TTd3d2V2?=
 =?utf-8?B?Vnpra21MSWxOU1NnSlVvVTJLYVp2ZHRPMEQyNTZuckxsRUJxQXZyS2h2TzJ0?=
 =?utf-8?B?bUlvczVWN3lnaUxlaFppMGN6TVFidkI3K3RPb05sM0EwRktDQzR3QTh1TEQ3?=
 =?utf-8?B?dDJKeWQ0TDVxRTF5alV1UDFGeG1ibTU3enYwTW41eXpqVUxWek9wUENoMDky?=
 =?utf-8?B?aXZlY0o0dWhBTGRtOFVNSldNUGYxQTU2Q1RtNENESWFBOFlGMnRpY1pRZnNv?=
 =?utf-8?B?K2ZIc0xnbzNuTXJvVzZqOE1OTGxBQVBPaUcvU3JvQS9wbUcwNnR3SWNQWWp5?=
 =?utf-8?B?TC9sODI5OEw2dFpXblFpdk9reUE3MTVXNVZibHVaTk8yNzdRb2NIY2dnKzVi?=
 =?utf-8?B?N0NkZmp1Vm01K1BkTjgxZFdEbXVqQjgxbDVrdlFORy9vcG5SS0NZM3AvaWpX?=
 =?utf-8?B?K1FQRTZ2WHpISEcvM0xRc0t6MHVZdGtEOXN3QWZFKzlQMmRJdDFZZktxU2ht?=
 =?utf-8?Q?da3g=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5760.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SktIazBJZTFVWnJyazZoT2dZaHAwLzVIcGNMSFZVd3l6VjJDUld6Sk0yQkl1?=
 =?utf-8?B?WkZBdEpPVXJkU2RCR2JnVWVKYmkrSkJsRGVaWUhKa2pMcU5ISnJ5YzNSZWdF?=
 =?utf-8?B?NzQ4eS9ZT0ZqU2ZUeWFpRytlOVAxbWhsMzJiVWNxQmQ5c0NXU1pzWGs4eUhQ?=
 =?utf-8?B?Q0lhL0VrVGxjYUZGTHdZQWJOY2pDZGcxbUoweGM4aHdPNThnSXAzcnBadWlo?=
 =?utf-8?B?WFdrdmc2UlBuNWdrejJHdSt3ejBKQlNEcitpOS9PS1dWbGM5ZURMeGFMbENJ?=
 =?utf-8?B?bUVhaUk4T28reXdPVWlnekNOL3o4ajRuNFV5SHlxZXRNZnR4ZU1vK05yaEc4?=
 =?utf-8?B?WDZ1czh2VUh5TFBLY25WRWtra0tPV1NUNWxUNk5sbWlaSlhiR3oxNDZMNzEw?=
 =?utf-8?B?Rll5RkpIVURFTXF2NEs4bVNnRkliVTlVQTZBeXRMeTNjc04vZnhqczVhcVdx?=
 =?utf-8?B?RnhoVjdmaUZGbTFkSWU1Q3F5M2xUNWR4aDdFaTROaU9aQ1ZoRytwRUVwOFdt?=
 =?utf-8?B?TU9FSzhPR1hiUXNZMEhxa0hINnJOVUo0OURHMVdtMUZ0WEN4MnVaUHVIeUFr?=
 =?utf-8?B?WkV5OEFVQ3RubnplZmNHOXlhTkFtU2RuSnR3UDAyVXR5SDMyQkZMbUFBUDNT?=
 =?utf-8?B?VWF3RzRVeHg5aVZubWZ6WHdOVWVJSGoycDY1V1p3cjJ1aXV0TzNwQXJCM3hU?=
 =?utf-8?B?ekVzWm9NTHhlazQwVGFLT1ovTkNCZ3NrTStpY0JJN0ZjNit2ellUUitrQk11?=
 =?utf-8?B?eWdqcWNUaFlQd3pRVzlIa2kwR2p5eTh4R2J0L1N0WGI0RDExYU1lMEl5bGEx?=
 =?utf-8?B?MDRndE9tWWVCcCtnUStWUGdWaHo5Q1VFQjNlMjRSRUwvSlhIbzJ6bUNkWGY0?=
 =?utf-8?B?Y1p2d0lrRndzbHUybFpteVR3ZWJGSXhPRzZrem1ZTHhGMU1WSVEyWlYweERy?=
 =?utf-8?B?UjhEeEZGenlWSXl3dHdKaGNjTHRmNlhOeWUxbElJZFAvcExyOVpER3hzOWJG?=
 =?utf-8?B?ekFnZ2dnNzMrQmp2bnVBNm5qbGdmQXVqeGJwWkppTnBUTVhVM2FYd09GWDUx?=
 =?utf-8?B?cDRJYndhNHRMdTdGa2Z6aXNDLzVUcmRmbjR1ektnYUlJRWVPbnh6TTR6K1dR?=
 =?utf-8?B?MndxNXdzVEdrMHJ2bmdYMHV1Y25WMmxaRk1yYmxXM2hRSUNEQmc5ZXBGQzZL?=
 =?utf-8?B?RlhFdGtUeDR5ZWYvczYzeUliNE5tTmQrZzBkd09ZQjJsYXJoMEFlZlFpdWo0?=
 =?utf-8?B?MElYdEZsVHVNR0VsbTNkZG5UVmtCWEVQbmFDRkFLZWhkSnpyWmdLQXpiRW12?=
 =?utf-8?B?Uy9vb1haZVNiN2hsQld5blVtUGRPMTFqWmtPWEN0NklGSGorZTVBbTl3VE1u?=
 =?utf-8?B?QW1yMzJaOC9yaG1uZVh6S2VBYUpTOXJpUnQ5SGZFWHRobmNpc3N1ODFjcXZp?=
 =?utf-8?B?R2NWczFHYVk0VFdRSUw4MVFUN0Mvc2RzaGJhTGp2UW5Mbm9xZldheWR5L1kr?=
 =?utf-8?B?Q2Z3cDBGMyt0ZmdQZlE2eHVXdGhoT201TXNMbTNEWU1QbTJpa2NscUhqM2hN?=
 =?utf-8?B?Y0JrTGRqeHJVeVdSZGtkdUp2TWh0L0JqL0xCK1JMZnNoZDRzSFp6Zjh2Wlhy?=
 =?utf-8?B?SlZQVStTc0RqeWkrL0hmekQxdndhWXFEOW1aTys4VHdFN1N2dzZUQjFFVUww?=
 =?utf-8?B?L1l4NnQreFkvTWlmd0FQVkYveUEzenY5dVVxc0JObXpPR1dmR0Z0WXd2WUh4?=
 =?utf-8?B?SHQzTHZkVDlCOGNkbHl6Wmd4V1djLzhLUHl6U2lZWU9xTjdJMkdTOThFaWZY?=
 =?utf-8?B?Zjl0WW0wRnExY3ZJUmhTRHRVbUZxRndidCtJR2lGUzd4dklwZmJWWVR0VFRu?=
 =?utf-8?B?RldOMXB3ejU1WWtaZElrMEZvMUR3RHRsMnl6aTRqdzE5NnhOYWQ2NExqbVdp?=
 =?utf-8?B?Q1hGM1QzaGt5Z1hKVVZQc1lyd2pESXVYcGw5aGhTdEtwL3dhWlRTR3g3OFZ1?=
 =?utf-8?B?bjNZMnVNbjZ3RVViejN5cVpQa3FkbVM3U0x0ZTg4WUwzYng4RFo0Skd0SzVV?=
 =?utf-8?B?azZuSXdKWXNDTHg0QitRUC9WVVFHVzR6MmlHZW16dGp4S2ZMYmlKSkJyVVBk?=
 =?utf-8?B?U2VCVDlaaEhrR1BSZzBmKzRsQldwNGh3QXh2b2VSayt4WXRHN2d1Y2ZDUHRP?=
 =?utf-8?B?VUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7B1E201B48D74E4288F2CDAD2A4A4D93@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5760.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33bb6766-7805-4c5f-b8ae-08de2b39dab0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2025 09:14:21.5318
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ddBuJkkwfpymDSqUUPvItf/1ki9Pk3Fqt6J4V4pdILz5dB3DzCPRhbe1FPUUjEpN/BYQp0bsjdjCPCvkwW4/F5geNAGOhrgxA66Cx1g5pyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6532
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_011436_459563_9D3300DD 
X-CRM114-Status: GOOD (  24.02  )
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

T24gV2VkLCAyMDI1LTExLTE5IGF0IDA5OjE4ICswMDAwLCBDSyBIdSAo6IOh5L+K5YWJKSB3cm90
ZToNCj4gT24gVHVlLCAyMDI1LTExLTA0IGF0IDE2OjU1ICswODAwLCBMaWFua3VuIFlhbmcgd3Jv
dGU6DQo+ID4gQnkgYWRqdXN0aW5nIHRoZSBvcmRlciBvZiBsaW5rIHRyYWluaW5nIGFuZCByZWxv
Y2F0aW5nIGl0IHRvIEhQRCwNCj4gPiBsaW5rIHRyYWluaW5nIGNhbiBpZGVudGlmeSB0aGUgdXNh
YmlsaXR5IG9mIGVhY2ggbGFuZSBpbiB0aGUNCj4gPiBjdXJyZW50IGxpbmsuDQo+ID4gDQo+ID4g
SXQgYWxzbyBzdXBwb3J0cyBoYW5kbGluZyBzaWduYWwgaW5zdGFiaWxpdHkgYW5kIHdlYWtuZXNz
IGR1ZSB0bw0KPiA+IGVudmlyb25tZW50YWwgaXNzdWVzLCBlbmFibGluZyB0aGUgYWNxdWlzaXRp
b24gb2YgYSBzdGFibGUNCj4gPiBiYW5kd2lkdGgNCj4gPiBmb3IgdGhlIGN1cnJlbnQgbGluay4g
U3Vic2VxdWVudGx5LCBEUCB3b3JrIGNhbiBwcm9jZWVkIGJhc2VkIG9uDQo+ID4gdGhlIGFjdHVh
bCBtYXhpbXVtIGJhbmR3aWR0aC4NCj4gPiANCj4gPiBJdCBzaG91bGQgdHJhaW5pbmcgaW4gdGhl
IGhwZCBldmVudCB0aHJlYWQuDQo+ID4gQ2hlY2sgdGhlIG1vZGUgd2l0aCBsYW5lIGNvdW50IGFu
ZCBsaW5rIHJhdGUgb2YgdHJhaW5pbmcuDQo+ID4gDQo+ID4gSWYgd2UncmUgZURQIGFuZCBjYXBh
YmlsaXRpZXMgd2VyZSBhbHJlYWR5IHBhcnNlZCB3ZSBjYW4gc2tpcA0KPiA+IHJlYWRpbmcgYWdh
aW4gYmVjYXVzZSBlRFAgcGFuZWxzIGFyZW4ndCBob3RwbHVnZ2FibGUgaGVuY2UgdGhlDQo+ID4g
Y2FwcyBhbmQgdHJhaW5pbmcgaW5mb3JtYXRpb24gd29uJ3QgZXZlciBjaGFuZ2UgaW4gYSBib290
IGxpZmUNCj4gPiANCj4gPiBUaGVyZWZvcmUsIGJyaWRnZSB0eXBlYyBqdWRnbWVudCBpcyByZXF1
aXJlZCBmb3IgZWRwIHRyYWluaW5nIGluDQo+ID4gYXRvbWljX2VuYWJsZSBmdW5jdGlvbi4NCj4g
PiANCj4gPiBUaGUgYG10a19kcF9hdXhfcGFuZWxfcG93ZXJvbmAgZnVuY3Rpb24gZmFpbHMgdG8g
YWxpZ24uDQo+ID4gV2l0aGluIHRoZSBgbXRrX2RwX2hwZF9ldmVudF90aHJlYWRgLCBpZiBEUCBp
cyBkaXNjb25uZWN0ZWQsDQo+ID4gdGhlIGBtdGtfZHBfYXV4X3BhbmVsX3Bvd2Vyb25gIGZ1bmN0
aW9uIHdpbGwgd3JpdGUgZnJvbSBgYXV4YCB0bw0KPiA+IGBEUFJYYCwNCj4gPiBjYXVzaW5nIGEg
ZmFpbHVyZSBhbmQgdGh1cyBwcmV2ZW50aW5nIHN5bW1ldHJ5Lg0KPiANCj4gSSdtIGN1cmlvdXMg
YWJvdXQgYW5vdGhlciBjYXNlLg0KPiBJbiB5b3VyIGRlc2NyaXB0aW9uLCB3aGVuIERQIHBsdWcg
b3V0IGFuZCBwbHVnIGluLCBEUk0gY29yZSB3b3VsZCBub3QNCj4gY2FsbCBtdGtfZHBfYnJpZGdl
X2F0b21pY19lbmFibGUoKSwgcmlnaHQ/DQo+IElmIHNvLCB3aGVuIEkgcGx1ZyBvdXQgRFAsIGFu
ZCBwbHVnIGluIGFub3RoZXIgRFAgcGFuZWwgd2hpY2ggc3VwcG9ydA0KPiBzbWFsbGVyIHJlc29s
dXRpb24sDQo+IHRoZW4gbXRrX2RwX2JyaWRnZV9hdG9taWNfZW5hYmxlKCkgaXMgbm90IGNhbGxl
ZCBhbmQgYmVsb3cgY2FsbA0KPiBzZXF1ZW5jZSB3b3VsZCBub3QgaGFwcGVuOg0KPiANCj4gbXRr
X2RwX2JyaWRnZV9hdG9taWNfZW5hYmxlKCkgLT4gbXRrX2RwX3ZpZGVvX2VuYWJsZSgpIC0+DQo+
IG10a19kcF9zZXRfdHhfb3V0KCkgLT4gbXRrX2RwX3NldHVwX3R1KCkNCj4gDQo+IEluIG10a19k
cF9zZXR1cF90dSwgaXQgd291bGQgc2V0IHNyYW1fcmVhZF9zdGFydCBhY2NvcmRpbmcgdG8NCj4g
bGFuZV9jb3VudC4NCj4gQnV0IHRoZSBjYWxsIHNlcXVlbmNlIHdvdWxkIG5vdCBoYXBwZW4gd2hl
biBuZXcgcGx1ZyBpbiwgdGhlDQo+IHNyYW1fcmVhZF9zdGFydCB3b3VsZCBiZSBvbGQgdmFsdWUg
d2hpY2ggbWF5IGluY29ycmVjdC4NCj4gSWYgdGhpbmsgdGhhdCB3aGVuIHBsdWcgaW4gYW5kIHBs
dWcgb3V0LCBpdCBzaG91bGQgZGlzYWJsZSBEUCBhbmQNCj4gdGhlbiBlbmFibGUgRFAgYWdhaW4u
DQo+IElmIERSTSBjb3JlIGRvZXMgbm90IGRvIHRoaXMsIEkgdGhpbmsgd2Ugc2hvdWxkIG1vZGlm
eSBEUk0gY29yZSBvcg0KPiB5b3Ugc2hvdWxkIHJlY29uZmlnIHRoZSB3aG9sZSBEUCB3aGVuIHBs
dWcgaW4sIG5vdCBvbmx5IHRyYWluaW5nLg0KPiANCj4gUmVnYXJkcywNCj4gQ0sNCj4gDQoNCkhp
IENLDQoNCldoZW4gRFAgcGx1ZyBvdXQsIERSTSBjb3JlIHdpbGwgY2FsbCBtdGtfZHBfYnJpZGdl
X2F0b21pY19kaXNhYmxlKCkuDQpXaGVuIERQIHBsdWcgaW4sIERSTSBjb3JlIHdpbGwgY2FsbCBt
dGtfZHBfYnJpZGdlX2F0b21pY19lbmFibGUoKS4NCg0KSWYgRFAgcGx1ZyBpbiwgc3JhbV9yZWFk
X3N0YXJ0IHdpbGwgYmUgcmVjYWxjdWxhdGUgYmFzZWQgb24gdGhlIGxhbmUNCmNvdW50Lg0KDQpS
ZWdhcmRzDQpMaWFua3VuLg0KDQo+IA0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IExpYW5rdW4g
WWFuZyA8bGlhbmt1bi55YW5nQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiBDaGFuZ2UgaW4g
Vjc6DQo+ID4gLSBTZXBhcmF0ZSB0aGUgZWRwIHBhcnQ6DQo+ID4gDQpodHRwczovL3VybGRlZmVu
c2UuY29tL3YzL19faHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1l
ZGlhdGVrL3BhdGNoLzIwMjUwODIyMTIwNTA2LjE1NDg2LTEtbGlhbmt1bi55YW5nQG1lZGlhdGVr
LmNvbS9fXzshIUNUUk5LQTl3TWcwQVJidyFrNExmOVVhZ0d2cUY1cnpxcFB0V1JlbzR6RjRVekJr
bWdjSFpxMHo2cTNmN2t5QS1ydGo4a1Y4dWlLUDJucnlHMHNUcE9SbDFZNThTdW05ZGl4VEQtUDAk
DQo+ID4gIA0KPiA+IA0KPiA+IENoYW5nZSBpbiBWNjoNCj4gPiAtIEZpeGVkIHBvd2VyIG9uIGlu
IGF0b21pYyBlbmFibGUuDQo+ID4gUGVyIHN1Z2dlc3Rpb24gZnJvbSB0aGUgcHJldmlvdXMgdGhy
ZWFkOg0KPiA+IA0KaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vcGF0Y2h3b3Jr
Lmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRjaC8yMDI1MDYzMDA4MDgyNC43
MTA3LTEtbGlhbmt1bi55YW5nQG1lZGlhdGVrLmNvbS9fXzshIUNUUk5LQTl3TWcwQVJidyFrNExm
OVVhZ0d2cUY1cnpxcFB0V1JlbzR6RjRVekJrbWdjSFpxMHo2cTNmN2t5QS1ydGo4a1Y4dWlLUDJu
cnlHMHNUcE9SbDFZNThTdW05ZDJ1eVh5T0EkDQo+ID4gIA0KPiA+IA0KPiA+IENoYW5nZSBpbiBW
NToNCj4gPiAtIEZpeGVkIHRoZSBpc3N1ZSB0aGF0IHRoZSA0dGggdmVyc2lvbiBvZiB0aGUgcGF0
Y2ggY2F1c2VkIERQIHRvDQo+ID4gaGF2ZSBubyBzY3JlZW4uDQo+ID4gUGVyIHN1Z2dlc3Rpb24g
ZnJvbSB0aGUgcHJldmlvdXMgdGhyZWFkOg0KPiA+IA0KaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92
My9fX2h0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9w
YXRjaC8yMDI1MDYyNTA5NTQ0Ni4zMTcyNi0xLWxpYW5rdW4ueWFuZ0BtZWRpYXRlay5jb20vX187
ISFDVFJOS0E5d01nMEFSYnchazRMZjlVYWdHdnFGNXJ6cXBQdFdSZW80ekY0VXpCa21nY0hacTB6
NnEzZjdreUEtcnRqOGtWOHVpS1AybnJ5RzBzVHBPUmwxWTU4U3VtOWRwdGx4MWtjJA0KPiA+ICAN
Cj4gPiANCj4gPiBDaGFuZ2UgaW4gVjQ6DQo+ID4gLSBUZXN0ZWQgdGhlIGludGVybmFsIGVEUCBk
aXNwbGF5IG9uIE1UODE5NSBUb21hdG8gYW5kIGl0IGlzIGZpbmUuDQo+ID4gUGVyIHN1Z2dlc3Rp
b24gZnJvbSB0aGUgcHJldmlvdXMgdGhyZWFkOg0KPiA+IA0KaHR0cHM6Ly91cmxkZWZlbnNlLmNv
bS92My9fX2h0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRl
ay9wYXRjaC8yMDI1MDMxODE0MDIzNi4xMzY1MC0yLWxpYW5rdW4ueWFuZ0BtZWRpYXRlay5jb20v
X187ISFDVFJOS0E5d01nMEFSYnchazRMZjlVYWdHdnFGNXJ6cXBQdFdSZW80ekY0VXpCa21nY0ha
cTB6NnEzZjdreUEtcnRqOGtWOHVpS1AybnJ5RzBzVHBPUmwxWTU4U3VtOWRUeXJZSkxRJA0KPiA+
ICANCj4gPiANCj4gPiBDaGFuZ2UgaW4gVjM6DQo+ID4gLSBSZW1vdmUgJ210a19kcC0+ZW5hYmxl
ZCA9IGZhbHNlIiBpbiBhdG9taWMgZGlzYWJsZS4NCj4gPiAtIFJlbW92ZSAnbXRrX2RwLT5lbmFi
bGVkID0gdHJ1ZSIgaW4gYXRvbWljIGVuYWJsZS4NCj4gPiBQZXIgc3VnZ2VzdGlvbiBmcm9tIHRo
ZSBwcmV2aW91cyB0aHJlYWQ6DQo+ID4gDQpodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0
cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIw
MjQxMDI1MDgzMDM2Ljg4MjktNC1saWFua3VuLnlhbmdAbWVkaWF0ZWsuY29tL19fOyEhQ1RSTktB
OXdNZzBBUmJ3IWs0TGY5VWFnR3ZxRjVyenFwUHRXUmVvNHpGNFV6QmttZ2NIWnEwejZxM2Y3a3lB
LXJ0ajhrVjh1aUtQMm5yeUcwc1RwT1JsMVk1OFN1bTlkcmdjOVgwbyQNCj4gPiAgDQo+ID4gDQo+
ID4gQ2hhbmdlIGluIFYyOg0KPiA+IC0gQWRqdXN0IERQIHRyYWluaW5nIHRpbWluZy4NCj4gPiAt
IEFkanVzdCBwYXJzZSBjYXBhYmlsaXRpZXMgdGltaW5nLg0KPiA+IC0gQWRkIHBvd2VyIG9uL29m
ZiBmb3IgY29ubmVjdC9kaXNjb25uZWN0Lg0KPiA+IFBlciBzdWdnZXN0aW9uIGZyb20gdGhlIHBy
ZXZpb3VzIHRocmVhZDoNCj4gPiANCmh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczov
L3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvMjAyNDAz
MTUwMTUyMzMuMjAyMy0xLWxpYW5rdW4ueWFuZ0BtZWRpYXRlay5jb20vX187ISFDVFJOS0E5d01n
MEFSYnchazRMZjlVYWdHdnFGNXJ6cXBQdFdSZW80ekY0VXpCa21nY0hacTB6NnEzZjdreUEtcnRq
OGtWOHVpS1AybnJ5RzBzVHBPUmwxWTU4U3VtOWRZeGpOdEU4JA0KPiA+ICANCj4gPiAtLS0NCj4g
PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcC5jIHwgMjAgKysrKysrKysrKysrKysr
KysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcC5jDQo+ID4gYi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwLmMNCj4gPiBpbmRleCBiZWY2ZWViMzBkM2UuLjBi
YTJjMjA4ODExYyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RwLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwLmMNCj4gPiBA
QCAtMTk3Niw2ICsxOTc2LDcgQEAgc3RhdGljIGlycXJldHVybl90DQo+ID4gbXRrX2RwX2hwZF9l
dmVudF90aHJlYWQoaW50IGhwZCwgdm9pZCAqZGV2KQ0KPiA+ICAJc3RydWN0IG10a19kcCAqbXRr
X2RwID0gZGV2Ow0KPiA+ICAJdW5zaWduZWQgbG9uZyBmbGFnczsNCj4gPiAgCXUzMiBzdGF0dXM7
DQo+ID4gKwlpbnQgcmV0Ow0KPiA+ICANCj4gPiAgCWlmIChtdGtfZHAtPm5lZWRfZGVib3VuY2Ug
JiYgbXRrX2RwLQ0KPiA+ID50cmFpbl9pbmZvLmNhYmxlX3BsdWdnZWRfaW4pDQo+ID4gIAkJbXNs
ZWVwKDEwMCk7DQo+ID4gQEAgLTE5OTQsOSArMTk5NSwyOCBAQCBzdGF0aWMgaXJxcmV0dXJuX3QN
Cj4gPiBtdGtfZHBfaHBkX2V2ZW50X3RocmVhZChpbnQgaHBkLCB2b2lkICpkZXYpDQo+ID4gIAkJ
CW1lbXNldCgmbXRrX2RwLT5pbmZvLmF1ZGlvX2N1cl9jZmcsIDAsDQo+ID4gIAkJCSAgICAgICBz
aXplb2YobXRrX2RwLT5pbmZvLmF1ZGlvX2N1cl9jZmcpKTsNCj4gPiAgDQo+ID4gKwkJCW10a19k
cC0+ZW5hYmxlZCA9IGZhbHNlOw0KPiA+ICsJCQkvKiBwb3dlciBvZmYgYXV4ICovDQo+ID4gKwkJ
CW10a19kcF91cGRhdGVfYml0cyhtdGtfZHAsDQo+ID4gTVRLX0RQX1RPUF9QV1JfU1RBVEUsDQo+
ID4gKwkJCQkJICAgRFBfUFdSX1NUQVRFX0JBTkRHQVBfVFBMTCwNCj4gPiArCQkJCQkgICBEUF9Q
V1JfU1RBVEVfTUFTSyk7DQo+ID4gKw0KPiA+ICAJCQltdGtfZHAtPm5lZWRfZGVib3VuY2UgPSBm
YWxzZTsNCj4gPiAgCQkJbW9kX3RpbWVyKCZtdGtfZHAtPmRlYm91bmNlX3RpbWVyLA0KPiA+ICAJ
CQkJICBqaWZmaWVzICsgbXNlY3NfdG9famlmZmllcygxMDApIC0gMSk7DQo+ID4gKwkJfSBlbHNl
IHsNCj4gPiArCQkJbXRrX2RwX2F1eF9wYW5lbF9wb3dlcm9uKG10a19kcCwgdHJ1ZSk7DQo+ID4g
Kw0KPiA+ICsJCQlyZXQgPSBtdGtfZHBfcGFyc2VfY2FwYWJpbGl0aWVzKG10a19kcCk7DQo+ID4g
KwkJCWlmIChyZXQpDQo+ID4gKwkJCQlkcm1fZXJyKG10a19kcC0+ZHJtX2RldiwgIkNhbid0IHBh
cnNlDQo+ID4gY2FwYWJpbGl0aWVzXG4iKTsNCj4gPiArDQo+ID4gKwkJCS8qIFRyYWluaW5nICov
DQo+ID4gKwkJCXJldCA9IG10a19kcF90cmFpbmluZyhtdGtfZHApOw0KPiA+ICsJCQlpZiAocmV0
KQ0KPiA+ICsJCQkJZHJtX2VycihtdGtfZHAtPmRybV9kZXYsICJUcmFpbmluZw0KPiA+IGZhaWxl
ZCwgJWRcbiIsIHJldCk7DQo+ID4gKw0KPiA+ICsJCQltdGtfZHAtPmVuYWJsZWQgPSB0cnVlOw0K
PiA+ICAJCX0NCj4gPiAgCX0NCj4gPiAgDQo+IA0KPiANCg==

