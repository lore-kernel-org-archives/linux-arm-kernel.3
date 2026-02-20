Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B461C55AB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 12:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OuaRlAzYquysGHqgQsYO8dbZj3/V2h62EGjUS35oIJk=; b=aD/Bdng1/+j41VNhFPout94QZY
	h+g9QOxBZiYYwUD7NcFNNGv0OX1gqPymnEFulzZpI285harLYOZlnExsuvUEFbkJcvxvrDQYFbQhA
	pWawHxdqLVKfmH6KdLu6NR7Kdq7YRi3FrSC8itSjbjgIyLLPWTzGfs+RGGDgei+rvNhhtWUCOTU5e
	5apk+drWZ6QkXxXN3N5zFP4O8+lGNKGFiah6jjJxsnP+LZVxCRucNTvpsswWmMpNX3ymVQMh8yN7Y
	EBWvA9RR07C3sr+9LUa/3SAiZytR74NNdM9VImtdng/pKAvaGWB3+3pGIXhdDgDg2TE1uDQtkgQDU
	/dsoBrnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtPyO-0000000EV4X-0C3F;
	Fri, 20 Feb 2026 12:51:08 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtPyJ-0000000EV2z-2X9D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 12:51:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ka87eJV4couDANRuolqFCpsGxaDXQNpJQiFyrXoMfJCoSRdeQozF4pMDpc8muy9QafPq13IKQxRoNRJoVcxiHm23VlJ0WODVgu0GcI4UDIb2EJ6Gobg9q6FHkH8hqLiwzWXhvtpY2ZZtyaPEqoU4DjBeZJZHWTOQQ8mHqFKeIm/+IlSFobR+O9P3zVDFH4TmecNKGhJAEf/SUL5b5s6x0vou1Mi462Ko9EcuNfE2j29Se0ZCgh9i++oSKI8ra0SEEhp3DK3vbT1J2PTc9zsfbZuFtxhZWppAI/YXeB6qbCxR/P6uU1lNHR5P0qRcM3DFroPwG3LJHJxY/0zniHhVQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OuaRlAzYquysGHqgQsYO8dbZj3/V2h62EGjUS35oIJk=;
 b=cOq9/XT/Tzs+TBFKXz1pcUekU+3Qz72nT0N6gUWlgE5lb4QxFSY/xNFiHJtzhFmIx/2C3DjSmJRf6M5MIzHgCcAcdO0HPw0V75pbklE017QRlBFEAEGiARpJSlzf4aSa4xuNxsJEjD/NcpRRtIm+5npdtP2ckHFKe7gWnQwDRrjvsSV32O9dW4Y4cYYclpt7ho5L8CBIYmzv5EeGY3jtxBMIB9qGV2GKCuXICmoeVlZ8/cXBfxFRjc5xuwCttOf9FlcYjOJji6eoa/a1Q8o0vSz8LfS8dutJZ7OhVLd9xpm/+BwrEYcjzinYdToc2/RhUEk51JMQl7WOK9yh+SYfdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com (2603:1096:301:117::13)
 by TY1PPF9FCAE99BB.apcprd06.prod.outlook.com (2603:1096:408::920) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Fri, 20 Feb
 2026 12:50:52 +0000
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::f320:58f6:4dc6:b908]) by PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::f320:58f6:4dc6:b908%6]) with mapi id 15.20.9632.010; Fri, 20 Feb 2026
 12:50:52 +0000
From: Gary Yang <gary.yang@cixtech.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, Peter Chen
	<peter.chen@cixtech.com>, "unicorn_wang@outlook.com"
	<unicorn_wang@outlook.com>, "inochiama@gmail.com" <inochiama@gmail.com>,
	"alchark@gmail.com" <alchark@gmail.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject: =?utf-8?B?5Zue5aSNOiDlm57lpI06IFtQQVRDSCB2OCAyLzNdIHJlc2V0OiBhZGQgU2t5?=
 =?utf-8?Q?1_soc_reset_support?=
Thread-Topic: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjggMi8zXSByZXNldDogYWRkIFNreTEgc29jIHJl?=
 =?utf-8?Q?set_support?=
Thread-Index: AQHcmacxi91bC/zAGE6o56iTabJV0LV6O78AgAF0eCCAAZ0vgIAOTTOw
Date: Fri, 20 Feb 2026 12:50:51 +0000
Message-ID: <PUZPR06MB58875D4B4CA02D20341A47FDEF68A@PUZPR06MB5887.apcprd06.prod.outlook.com>
References: <20260209093344.2013693-1-gary.yang@cixtech.com>
		 <20260209093344.2013693-3-gary.yang@cixtech.com>
	 <1c77ab31e6ba8b6285a67a6f2877a415dc9f3d3b.camel@pengutronix.de>
	 <TYUPR06MB587663CF0612A0552C0029E8EF63A@TYUPR06MB5876.apcprd06.prod.outlook.com>
 <fcbc10e7657a20c08eb1fd50f0eedad0d6361fed.camel@pengutronix.de>
In-Reply-To: <fcbc10e7657a20c08eb1fd50f0eedad0d6361fed.camel@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR06MB5887:EE_|TY1PPF9FCAE99BB:EE_
x-ms-office365-filtering-correlation-id: bb9ebc7e-4735-4f06-1430-08de707eade1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?NDRwaUVnVUZOOCtMR05LRFF4akpudjd0c1kvQ2FrWklJNEVLNFRSQmtMd3Bv?=
 =?utf-8?B?cEVhd2pIaTlUNGxZc1c5MENQejFYclFpaGpVd0tSZzdFTkg2RkMwSmV3RlBE?=
 =?utf-8?B?OG1SZXNVUitNZTJsamphVnVzMzc5anNJaTc1VkhuRVdzMU5rTUcvZGRBaG1J?=
 =?utf-8?B?V01RWThyK0hlVXRFMUFJeFB0WjM1cDBEc0FDNnE2R2xoQmltYktpU3Z6dVhH?=
 =?utf-8?B?d21kNkVpcWoySVAybGJTL1ZGbGU3Z1B0QmxSUW5uSGV3cC9OamIxZTBHWFZV?=
 =?utf-8?B?c2UybkNGY3F5a2hXQkZDM2J0VzBobXZ1TWg4dmlwM203TGl3K0gyMTJEUXVz?=
 =?utf-8?B?WFByVVB3WXhvVlI0d2huei9FMUJDZjE5eVErQU9uSEVLZkt1T0R4MGJ4YU8v?=
 =?utf-8?B?Q2VLVUxZdy9DWmkrUUZDa3dueXh5ZFJYVVNJMXorS1o5L052akk2NUNib1U0?=
 =?utf-8?B?OVhzVkRpMVVxVWp5K2srNGcrVWVTV2lMUGxuT2xDUllEOXRwSFczdjZyOFU2?=
 =?utf-8?B?WDRKTmZndzFJVTgwYTVlYy9VYUNqWEJ5c2h3YzNhM1gxNTBIMjgrMHI5ajRh?=
 =?utf-8?B?ZWhwZHpDVHhET1F1WFY4KzhvYU5MMWF0Z3ovSVczWklrc2xuS0xSYUgyZ0d6?=
 =?utf-8?B?eDNzQ0JCdDZob0tpSElZZWUvbTlrMUNqcFk3OGY2am5CR1o5clpHT1Q4a2cy?=
 =?utf-8?B?ZHBIOWtIQ1hURER2RitvdmQwbWQxeVl4VWYvNnZGTTE5MDl5ZWl4OUg4UnU5?=
 =?utf-8?B?TXZneVEzOXI1WEcyMnRTcmxKUVB1dHl3anowbDdrWGlRYWtaYUMrWkRFUkI5?=
 =?utf-8?B?dC9JQlg3NkpWY05aSEtmRjEwZVlXQlJrTWVhcDFETkxPSUEvNUdXM2xra21J?=
 =?utf-8?B?TWZNQ1dhZVFTMWtKdFlJM3FjYk05YkErMzJUU1F4aVJ5KytjR3h6NjV5bFVB?=
 =?utf-8?B?UHFJMFNUSkxhR3lqMXRsSFdIWFUvd2FvbGc3eHlsRnluYzJCUHNld0hKaHpV?=
 =?utf-8?B?S0hSRFc1b0d5TmQ0cll4aFIyc2cxU3I4UE9TTTlRVUlQZVFLMXYyV20yRmky?=
 =?utf-8?B?aFFaMTRXQmR2QXlrU1VGMnQxM2ptZ1gwZjBMa0dXNUVyNFFhOWVyYTlEVEhh?=
 =?utf-8?B?Vm5EcVJGTnBlNGQ5cWd1MTdJdHVucVdkdk5KNHRJRUpNS3ZwMHZoOEg3cVll?=
 =?utf-8?B?V1dvZnpmZnloVlZxanQ2d1VhdFFsMUM1QllnVUwvUEo3MUF4THdaV0JkbmJM?=
 =?utf-8?B?UlpQRmNwWEw3bGkzWXZuVlhFMFl2aUJReEExN09sd0o1NytGdHFKMmJoN0t4?=
 =?utf-8?B?M0tyRVYvbEVUc0s5MTkzRkR2WmkydklIaFBqNVpvOHVyWFEvaUpvVGFuNitU?=
 =?utf-8?B?aG1xYkgvZVV5U2JQbTA0T0tSU0hiSWtwMkNycEVoUS81UVRQS1IvRjNCZVRL?=
 =?utf-8?B?QVpCRUNKeStwRnpTaVdualpOa00zZTlCTURKaEU3a1B3ZHNlVVd1djMvQWVm?=
 =?utf-8?B?RFlrdEdwOWNkd1VZWjhTd2xPTzNrbUk1OTMwYjh5R3hFQmJDR1dGRmx6T05r?=
 =?utf-8?B?YlQ1ckxTYkFONVVrcllVYlpmOG5uRHhUZS9hYjgveE9WUTZ3OVNuNDlXNDNL?=
 =?utf-8?B?akxKN29RMG5SNEh1a1JJUzlicHNCOVgyUGJpYVVzcUtLd3VmN1NlamQ4ZXdR?=
 =?utf-8?B?cSthbzdCMW5EVDl1bWdTZ2F4cjViejhTZTBXTDg4UXRDK0NRMmlSQUdSdXAw?=
 =?utf-8?B?bVk3dmcveURURXFCM0ZsVU1jRFF6SmJvTDdreUNkbXFjaDV4RlV3RkRValpi?=
 =?utf-8?B?cVBvb09xU255d01LU2JpaEs5Y3FHMktKYVl4OEpKam9Xak5NVldzaXVpRlBl?=
 =?utf-8?B?dnZtNVdlTThzSHh6MHIrZGxJclN4LzJsOFdTRXhsWFZmMDU2QmZLMU85Uklr?=
 =?utf-8?B?bDMybFBjMzRPaXNlVi9JYXJ1bGFkVGcyT09CYytPL1dhOGdOUnFEQU0zRzZn?=
 =?utf-8?B?ZUtQZEpsRDFhZTdKYk5zMXh1Ty85ajNWUHVoQkJCcW5NdlJiZzA3dFlodGF2?=
 =?utf-8?B?TUlRRzAzMW50VFBJN3R1M0xXemtNRzRZVWZocWVYN0ltdjh4c05PeFJvbXhh?=
 =?utf-8?B?aGJydUp1dHFmNm1CQlAvbjQrcUwwLys4aTFrVzdKS3dWTVF2WmkwNDRYOFVt?=
 =?utf-8?Q?msd0uPgGVroCefRmGqkkEGw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5887.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aS9uM3dvRU9laWY4dWZRaWg4ZjlVYlZveFVpbEhEbGl5dVMzY3JOVXJ2SG91?=
 =?utf-8?B?dTRVUmhJaTBlZndyQVh1cllTbUNKT3ZYTmNYdFFwaGl4N1FIWXM3Tkh0bGVB?=
 =?utf-8?B?UThpd0tnbzhnbFU3TWxtdFphTHprZkV0aDJQTktIM2xmcmhKT1NycWMxSitC?=
 =?utf-8?B?aERrM1hpcVJDVWk2OGFPZ3BKU2dlQUc0UmpGcGpwZjZrcVczSTFibGZpQ1R2?=
 =?utf-8?B?dFZEUDJ1cHdIaUNTRjQ2NmlycjZidE9meTlSR3QrWXpsS2U1K0c5OUdjaW5S?=
 =?utf-8?B?WmUvaTd5NjZaVUl1S1NJSWF1MGNFdGNtcmxBamdUbkFReGMraEsvVmhONklx?=
 =?utf-8?B?OFU1UzFaZ28vcnNJM1N2WUpMN0wzODlLN041RjhJWVFmdGlaUFFEWEJOSTht?=
 =?utf-8?B?YVY1YUZUWUFDR2I1WXRiVjhHNDZGTE8vb2lSVGpLRXN1ZjlhR05Ja0RJQTk3?=
 =?utf-8?B?Y3FvNW5zNFB4YUtmR1hpUHJNdGNlQ1NSeElCc3VlQURGbGNNVWZjSWpONXhw?=
 =?utf-8?B?UTJZZ3hrZlpBVExXRjdNa0FjQzVSMHVWREJxMlpMYWFzTkhCZ2pMLzAzSjlv?=
 =?utf-8?B?MDBmNWJoZlBiaGJ2Wk5IemZjcWozb3VlbFVuaitHQlp1RUhsZW9WWnN0UEF5?=
 =?utf-8?B?ME9FODFDWmQweXFFTmxxQVluYVVDZGdPT2dYTk1nOFVCTEZ5cGdYU2s3NlFt?=
 =?utf-8?B?OG80eEwwZlF5UDVxSTRROGNhMkVUSTAvd2FRVklCRjVFR2V3Ni94Sk5HVDZm?=
 =?utf-8?B?YSt1eUlSbjBEVnVoMHZNVG5SQVZDQUdXWWNCaGM2aDF2REdlbWJPVVdWOVNm?=
 =?utf-8?B?Qzl6RkVKRTNuY0Q5TFdQeDBXMDZUamYzNkdlT0VNWVkzcU1ZcWQzbUhqRm9U?=
 =?utf-8?B?cDc5dTJ1V2NxTGNqaTRUcVYyd3c3NmFqdWpHTC9QOGZXWERKdENDVk83cy9W?=
 =?utf-8?B?R0trdjFIVDhUOTZ0U0MvZDM1eXJOU080YTVCbkVWNWhOd1BSNldIc1JROE1r?=
 =?utf-8?B?bDA0dXBmTGZYVzdGM1dLZGNkM21CRkp0WHN4MmlmZWM3Tis0amJrbDZzRVZ4?=
 =?utf-8?B?UDUrZEwrS1BhVlZVT0MzcVJNWnFqZy81UnZQckl6MTFjR2RnekQ4QzBPV2xa?=
 =?utf-8?B?RXViQjhRejAwYUxJVFZCR3RiMEc1ODBoR1BDdlUvcmlCUjBGOHh1dThpVEp0?=
 =?utf-8?B?Q25vQnR4dlE0bEhwbldRL0VtTjBxdnB3bVhIZ2VkKzBBVUI4K21ST3NNcW9v?=
 =?utf-8?B?YnRLVG5wbDBLUWhCYWpqOGZTaGUyS0EvNkVKSFZ6dEgwRCtQSTRkSjFOVEpw?=
 =?utf-8?B?US9kVzhjeTEvbkUzK0tic1BpTHFHWTdFeTd4eTBUV05EMkdjSnhQNXJoZnc4?=
 =?utf-8?B?dDBQSnVDdmtNYzh2Tk01WVFJRTh1a05sZ1gwdjBOSWpQUGkyektsZG85NGd3?=
 =?utf-8?B?YzRnbDIvdEl6VUlKT0tzMnB1MzU1b1VtU3B1L2dRUG5JQWt6clpWc3VxclY0?=
 =?utf-8?B?SkRNenh3M2NrbEpsa3lmOXpPVHhGV3N2cmUwR3dXQ3dtbVFvQzVScU5XYWdj?=
 =?utf-8?B?VzRabDA3dENmYm9tbzUwei9WNUx4ZmtZQ05LSjcvVGNiOHRRUURxMG5SRmZk?=
 =?utf-8?B?ZzdXa3dzTGRsQW00dW5FY2x5ZXM4YzJIbVREbExCMmhRNFdrZHdvM3ROcU1D?=
 =?utf-8?B?dlovK3lrVkFwdFVLY1Zuc3pIaDF1czdGYmFXb0tJc2ZGbXhlbFhxaVh4U3Nt?=
 =?utf-8?B?SkxwK016QzFJSFFBRnhhMWd2SzE0Y0pmVjQyaThDVDA1MG1Na3dhN1Z2RHlM?=
 =?utf-8?B?dE5ZTWpwNWpvb1ovaHlNZlZ6R0FpN2dMQ3hBUU5FN0lXTU5kNWZyalhmVktz?=
 =?utf-8?B?WTNWTi91RGtsRXFDbThLSFdmdHhsVUhOanlnR2pIcWZpcVNTYy80Z09FQVdH?=
 =?utf-8?B?a2JSNml6QUNyY1NGSUdyVk5MWXFiR3djbmsxaTMrMHN4YllvSHhzU2VHV1B1?=
 =?utf-8?B?ZmtGWEQ1dkZpMVkvcWduMFFBamljNDRRZS8rU1RDUWFPaENublk1dXMxZjRU?=
 =?utf-8?B?c21nb1QxVFFXZzh5MnFHRWNLSkxGdlFYc1dlZmh5Yjg5MU5BVnVhb21xU3Zr?=
 =?utf-8?B?Y1Exd2prdHFrSkJ0UjB6cGVzZHVUckZFZ1VxT3U4am1QUWovMEVycEhVKzcw?=
 =?utf-8?B?elkzMktlQ2dMRndMbmgzbHBmYXdRK0ZtSHBXS2ljVzVmTnJIN1cwM1BxcGE5?=
 =?utf-8?B?Z1ZXN211VDI0NS9HcG14VVBYSHJycHltZDZ3MDRFb0I2K3NYZW5lWmNiVGtZ?=
 =?utf-8?B?c25aRnBTRFBmNXJ0cHNXemJVL0duaC82VXdYbmZBTkxvYmJJanRmUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5887.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb9ebc7e-4735-4f06-1430-08de707eade1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2026 12:50:51.8517
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S76HchYcst7qBqOO/1hRdbVxAgYK4Pr6WhlRm8LTKtz4mZkeA4LY2/799UyRFQlmIACva8N8KPgbuphIHeOTcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF9FCAE99BB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_045103_649939_D4057E10 
X-CRM114-Status: GOOD (  11.27  )
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

SGkgUGhpbGlwcDoNCg0KU29ycnkgZm9yIGRlbGF5IHJlcGx5Lg0KDQo+IA0KPiBDQVVUSU9OOiBT
dXNwaWNpb3VzIEVtYWlsIGZyb20gdW51c3VhbCBkb21haW4uDQo+IA0KPiBPbiBNaSwgMjAyNi0w
Mi0xMSBhdCAwMTo1NiArMDAwMCwgR2FyeSBZYW5nIHdyb3RlOg0KPiBbLi4uXQ0KPiA+IEFzIEty
enlzenRvZidzIGFkdmljZXMsIHdlIHdpbGwgcmVtb3ZlIHRoZSBmaWxlIG5hbWVkDQo+ID4gc2t5
MS1zeXN0ZW0tY29udHJvbC5jIE1ha2UgdGhlIHN5c2NvbiBub2RlIGRpcmVjdGx5IGJpbmQgdG8g
cmVzZXQgZHJpdmVyLiBBcmUNCj4geW91IGFncmVlPw0KPiBbLi4uXQ0KPiA+ID4NCj4gPiA+DQo+
ID4gPg0KPiA+ID4NCj4gPiBXZSB3aWxsIGRlbGV0ZSBza3kxLXN5c3RlbS1jb250cm9sLmMgYXMg
S3J6eXN6dG9mJ3MgYWR2aWNlcy4NCj4gPiBBcmUgeW91IEFncmVlPw0KPiBbLi4uXQ0KPiA+DQo+
ID4gWWVzLCB5b3UncmUgcmlnaHQuIFdlIGludGVuZCB0byBhZG9wdCB0aGUgYWR2aWNlcyBmcm9t
IGNvbm9yLiBCdXQgSQ0KPiA+IHNhdyB0aGUgbmV3IHN5c2NvbiBzY2hlbWUgZnJvbSBzcGFjZW1p
dCxrMjEwLXN5c2NvbiBhbmQgdGhlc2UgY29tbWVudHMNCj4gZnJvbSBLcnp5c3p0b2YuIFdlIHdp
bGwgZGVsZXRlIHNreTEtc3lzdGVtLWNvbnRyb2wuYyBhcyBLcnp5c3p0b2YncyBhZHZpY2VzLiBB
cmUNCj4geW91IEFncmVlPw0KPiANCj4gSSBhZ3JlZS4NCj4gDQoNCkl0J3MgYSBzdXJwcmlzZSEg
SSdtIGdsYWQgdG8gc2VlIHlvdXIgYWdyZWVtZW50LiBXZSB3aWxsIHN1Ym1pdCB2OSBmb2xsb3dp
bmcgS3J6eXN6dG9mJ3MgYWR2aWNlcy4gDQoNCkJlc3QgUmVnYXJkcw0KR2FyeQ0KDQo+IHJlZ2Fy
ZHMNCj4gUGhpbGlwcA0K

