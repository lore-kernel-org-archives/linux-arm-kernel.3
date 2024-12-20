Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B62DE77184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 02:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EDJmZv1jGzr3ENX/15KkvNbu/jikY+WGdDP+ST/hI+k=; b=RyZT+U/4Svuqa4RDte2AIfdweI
	8yuaypzOtLi3rueqlDnTJWB3Uf5058SRkWQ2sN+JmptPkyLoFApxg7Hy3SEVIr9wQOXi755pQ5ttf
	W+y/7FfuwOL8YLk5KjEn6sXHvx0ymJtJsga7xwIC2FUF5srg1eonuuVj/SN2SjRuN1siWCMxFzTjm
	TCPb5Lv7CjLq4Qgz86z0gfSVS2jS59OGJE7Ce4AiGklPJPKCwIep9NUtKgfVSzmK9HTywLukhN64I
	jolUzAe9M7DOM+49sgSW4vpmG46Ccjv5bnJEgMnSRUxWzUUIEhz7X5Y+Ut9uQBJexxwyrS6rAFNsj
	Zg5zsmBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOSkW-00000003iXE-1xkF;
	Fri, 20 Dec 2024 02:28:20 +0000
Received: from esa3.fujitsucc.c3s2.iphmx.com ([68.232.151.212])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOSjM-00000003iTa-33yD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 02:27:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1734661628; x=1766197628;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EDJmZv1jGzr3ENX/15KkvNbu/jikY+WGdDP+ST/hI+k=;
  b=d4OdlKIrz2zDQUwLHEv+4o/yjMYgMGeTluTuzzLK++w20VKm9wlfHR4H
   1aw61iIHJ0ox59/5pIUcSNyh603mBaB7+pMwm4ic4qxMgWDKu3osuz258
   DBhwPHDP2joROWLBuHcjOdH9BQcehmsBoKqkaePX0pUS2HS0PHu34MIsg
   0vN1glYKo+LQS7CoPHJY8wkrJpygxLFWAz/EzUE0bHrcUPVdcjfQa1z3r
   OHRukaR5g1sx1WGKkO/TJuQLwnNkPt3qai4JXju2ee8aO7LZof1K96uza
   dIl5qwxiMhVIdSqcu04zgH9naubGMSllVJyiLub0LAkQltcOHjRUGF++9
   w==;
X-CSE-ConnectionGUID: 75XCUyJBRxq1509caFa/8w==
X-CSE-MsgGUID: ceR/wibLSeG3acYYvTQa/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="52110094"
X-IronPort-AV: E=Sophos;i="6.12,249,1728918000"; 
   d="scan'208";a="52110094"
Received: from mail-japaneastazlp17011026.outbound.protection.outlook.com (HELO TYVP286CU001.outbound.protection.outlook.com) ([40.93.73.26])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 11:27:00 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p2Sc9gi/dhYYyn+a6N7/qhAZkHZ6zajjRXfe77SIoGweK0jURuHbNW9VsDdMq3Tvx11ZhLdQsYoLcjfwFKI5/KgVUioqW3u7v6cYKbesqMBE/iGp5g7BprmV7NWWZYjgG6knpwGrtzcqUM6GlRdbpesvfxan+FKNJJImoKdFBCtoSOliEl2EFhokiy8tnMLIOngW0zWi+niriMN099mfXpGjbbJN53oR5QoNDLI0kNjr3ZqJZ0BpPcnpTrNhd49Td+Df/wYk6QUm61It4Qzigg4b76XQRiSag1+ORrfba5KsXlBlPU0QgJKeqb/fLDH1sE+RY8WP82lMVU/oVeQGOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDJmZv1jGzr3ENX/15KkvNbu/jikY+WGdDP+ST/hI+k=;
 b=FZu6uMXZyp3ktSLKLh5cmRPMcu0s6brbn3Qdvgp4zdCAiER74DdBW3510V0Ohu/wXecYfTSBTsDEOh2KCWoxMIy8lYj8muTkjqSOR2GZ1c6V4ETWyjheOIEFgcpneZ/H/0E/VOnwmqIdTfLGFcpLPe80dzp72CkjwUB7eDpMCxOwvRnUPXLNoUqmuONpKg2xvXyzNBJsQnOm4g/s4QLLgn9y3s8mcVk9oITMPdbQz+AeBkh17HujovoUsJEPWD0kYLJwOTFq9fcG+epE8QVJ18gje84rbsREDocOzQbbntXKxyWB1Vmi7EW6t81tLoQBf5dC2gkxbI8pnCYvLqxV2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OS3PR01MB6903.jpnprd01.prod.outlook.com (2603:1096:604:12c::9)
 by OS3PR01MB6087.jpnprd01.prod.outlook.com (2603:1096:604:d2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 02:26:57 +0000
Received: from OS3PR01MB6903.jpnprd01.prod.outlook.com
 ([fe80::df96:5745:d1b5:cafe]) by OS3PR01MB6903.jpnprd01.prod.outlook.com
 ([fe80::df96:5745:d1b5:cafe%5]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 02:26:57 +0000
From: "Yoshihiro Furudera (Fujitsu)" <fj5100bi@fujitsu.com>
To: 'Jonathan Cameron' <Jonathan.Cameron@huawei.com>
CC: 'Will Deacon' <will@kernel.org>, 'Mark Rutland' <mark.rutland@arm.com>,
	'Jonathan Corbet' <corbet@lwn.net>, 'Catalin Marinas'
	<catalin.marinas@arm.com>, "'linux-arm-kernel@lists.infradead.org'"
	<linux-arm-kernel@lists.infradead.org>, 'Bjorn Andersson'
	<quic_bjorande@quicinc.com>, 'Geert Uytterhoeven' <geert+renesas@glider.be>,
	'Krzysztof Kozlowski' <krzysztof.kozlowski@linaro.org>, 'Dmitry Baryshkov'
	<dmitry.baryshkov@linaro.org>, 'Konrad Dybcio' <konradybcio@kernel.org>,
	'Neil Armstrong' <neil.armstrong@linaro.org>, 'Arnd Bergmann'
	<arnd@arndb.de>, =?utf-8?B?JyBOw61jb2xhcyAiRi4gUi4gQS4gUHJhZG8iJw==?=
	<nfraprado@collabora.com>, 'Thomas Gleixner' <tglx@linutronix.de>, 'Peter
 Zijlstra' <peterz@infradead.org>, "'linux-doc@vger.kernel.org'"
	<linux-doc@vger.kernel.org>, "'linux-kernel@vger.kernel.org'"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] perf: Fujitsu: Add the Uncore MAC PMU driver
Thread-Topic: [PATCH v2 1/2] perf: Fujitsu: Add the Uncore MAC PMU driver
Thread-Index: AQHbPKZNz/bIRpbD4U+x/W9u+XfZB7LhCUiAgAv34OCAAZEH0A==
Date: Fri, 20 Dec 2024 02:26:57 +0000
Message-ID: <OS3PR01MB690361C2E315CF9D1E6C7CBDD4072@OS3PR01MB6903.jpnprd01.prod.outlook.com>
References: <20241122061753.2598688-1-fj5100bi@fujitsu.com>
	<20241122061753.2598688-2-fj5100bi@fujitsu.com>
 <20241211113909.000039d0@huawei.com>
 <OS3PR01MB69035A6B5F695F039B5D77C3D4062@OS3PR01MB6903.jpnprd01.prod.outlook.com>
In-Reply-To: <OS3PR01MB69035A6B5F695F039B5D77C3D4062@OS3PR01MB6903.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9ZGQ2YjQ0ZDQtOWQwNC00N2NmLTgwODctMmFkNjRjYzhj?=
 =?utf-8?B?NmExO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI0LTEyLTIwVDAyOjIwOjU3WjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?Q?81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB6903:EE_|OS3PR01MB6087:EE_
x-ms-office365-filtering-correlation-id: 0a95a6cc-855f-48a1-0648-08dd209dc6cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018|1580799027;
x-microsoft-antispam-message-info: =?utf-8?B?bDhhazhMNGRhNi9rOGhRSm1kMkZxSUJjKzU2V2pEaWNNRWFKWDJDOHN2VDRW?=
 =?utf-8?B?c0ljcHcvU0NwUHhFZzE4TzdRR1hGUDF1ZlBPeFM4a0dyTEltMmNkREc4UUE2?=
 =?utf-8?B?czNoQ1NzVnFYYXJ1Tnd2blVRRERnS1FTUTVQMklvOW9lTVVnVFAwUjN3WU5S?=
 =?utf-8?B?bjNET2xBaVZyYlp3V216SFF1dlJaYk5FMUpZcDREZ2xJN1JWQ3FNSUdJYzhI?=
 =?utf-8?B?bVBpUHB4QjhlckdBK0dmMWZKcmF3L1oraE51LzQxQWk4OTlSamM3MUc1S1Q2?=
 =?utf-8?B?T3F5RHdpZUJ4WE1LVnNiSGtmVFJiUlB6OWUyRU1helN1cGExbU1vVzB2SG9p?=
 =?utf-8?B?ZkNIODhkZ0Q2eHRRMXpQaXV3VkM4ME1GZHZub1N2V0xlZWg4NEVIS2k3U09p?=
 =?utf-8?B?ZW1QZzZFUGcwTTFudms3a0RtaElCQ3VNcHc0TnpIY3g1Z1dvM1lBNGRtRkpU?=
 =?utf-8?B?YmJtWXJuK3ZGZXpaSjRXT3FzQ01mSUVKS25iT2tyQ0wxTG5PcEg5cW5RMTF2?=
 =?utf-8?B?OVlzTHZKZi8raU5wRTZQWm9SNEU5ZFQ0OFFINHlzSDc2N1l5VGFyNWgvcmVD?=
 =?utf-8?B?WWpuMGVUT2tTYmFWS1Z5enpFUW90VENaSytOVGJsenYwUkhMM0REWXJOQkQ5?=
 =?utf-8?B?d3EySXQ0TGhNS0Q3QmZGV0M5ZmRhTDVuVy9uYVhTVjFKU1dkblNNNGo3Nkpu?=
 =?utf-8?B?cnMyazRINHhGTlExR1BrenQ2REtHaVFUdHptejdEMyswOVhsbkEyMDdiMm9T?=
 =?utf-8?B?TXVHQ2puUXlMbjhxeEUvalhoUFFlQUFrYjd2TEZ1Nm9OajBabkdIMGptRkFj?=
 =?utf-8?B?cUpQMTFEUDFuV2JNZ3dia05iTWZMZUJMWkFFb3pNYjBSQ3hHcTgzYXRiMXly?=
 =?utf-8?B?bHlxV2p3VTRESlpnREcwNlBLK2t0VjZBU2hkOHVPck93cHN5bzhWNXpZMURC?=
 =?utf-8?B?L2FnaVpIR2swdzRackRua09tbE41YklteklTQkxWMjZkczJXT2VmMU1vcExm?=
 =?utf-8?B?VTBlZEdmbzVlUGsyRG5LampGTUpHZjB2YVdJV2JyT2VtaVI3bzljRmkwL1RR?=
 =?utf-8?B?SEQ3elVCZ1ozUUJSTGx0OU9LVVYraS9SSFY5U1ArRTRid01NUjhwb2M5NG5N?=
 =?utf-8?B?RzAwbTA5aEpiQVBaWlI3cVVRcmdRaUV4NHRkUHdlL3NMdDVuRFplT3RXZ01p?=
 =?utf-8?B?VHk1eS94MlA5T3BHRjRWUkhaOENmcmtpSGRvRGZDeDhUSHhJNTJyOEROSDZK?=
 =?utf-8?B?bW8yeXQ5UlJLV2NHK25PcWxBMkdhQTZ6c1J3RGJLVlltUlR5QWd0Z2orSWZQ?=
 =?utf-8?B?RHMxWi92STBEeElnZXRhbXdnemsxZXNKM0U5dWFOTmtSZjV3VGZId1VuU0tJ?=
 =?utf-8?B?amJ3L0RiSzhUckR1SGI1aE1GcjllKzVjNFNtRU82UDN6VXZKaW1xNnZKMUZG?=
 =?utf-8?B?Q1RlaDkvVGlvSmQvZjVrNG9JcndSOGN1ZllWU0xKZ2l3NjJ4RlNzRDd0aUw0?=
 =?utf-8?B?UkFqU2FJYWliNlFTbThWaWE0NDk1a1FsY0pLRSszRzNhWFZWOFJWeTI2NGwx?=
 =?utf-8?B?ZzBvU2xjSlYrSWkxWVJDTjN2RzhvbkZiTEhTT25iT1ZWZXlHWjQyaStNZHdO?=
 =?utf-8?B?a1E3SjVvNUNvNUYxNUJhZkk2R0JwaC9la3NhREdmTkU2S3c3NExscTl3MExw?=
 =?utf-8?B?S0pBSml4WlhiVVU3bUlmOHJrQVg5aVVDS0FNVkxxOTlsZnBSUDBVaEc2M1lC?=
 =?utf-8?B?VGdWeDJZOXE4TGZ1UkNiUmt3OTRZVHVHVHcwQytHK2l5R1NYTElnTlNPMHJH?=
 =?utf-8?B?TUxDOG1CeUNKeHNEUmZZN0dFcitESWN1SFluRjliVmtqdWVhN1lFRnRjTlJM?=
 =?utf-8?B?THhKVDg2VUwxZ1VaRFp3ODQ0SEdiWkpLakJsemhyYWk5NGNHS0ZjLy9ZZFow?=
 =?utf-8?B?Q0dnd3BpNFI4bGcyeHY0ZHgrVlBzTjUvZ04zRUVRdFQyZlNUT0lrU013Visz?=
 =?utf-8?B?bmJ2WCs1RlF3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB6903.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UlNWZ3Z1dWc0UTV5alFkbzdDUndHamVJOXBNemcxekU5bDZodkZDd25yQ3lm?=
 =?utf-8?B?VHdxc2RIbUVkc3FZSVRRQU1qcFJzOWozeTlkMGVRMEp5UGpjMCt1WGpxekVm?=
 =?utf-8?B?ak85aGRjKzdMY2lYVG9ldVQ4c0NTMTFONnovVE9LdmtFTTVwTXk2MVEwY1JK?=
 =?utf-8?B?c0Z4L21ZNHBxUis2bEhPSE45Uy9YN2ZTSmZJZ3EwZXpUNDdhN0xxTXZ2TVBW?=
 =?utf-8?B?ZExqM1cyRW1iM25QRzNYSmw1SlI3WkNzK1M3c2Ryb2NLUUVDaGNUUjhON0xH?=
 =?utf-8?B?Rys3bUdVSTU5L3RjM1pJK1RDb3M3TDVzd1p0RG40eWRYQmFhbG92T0dZR1BX?=
 =?utf-8?B?cXlCQjhKbWZBTXhaWWJnL0d3eHZzQWV3WWRJbVlOclFBWlBjSXNvOWgrbVBC?=
 =?utf-8?B?REdsdWJzRkVONUFxS0ZQV0dtcGhJTkQ5bHdOWUtlNkpkNHBIbHZXTktvcW1a?=
 =?utf-8?B?VTljdm1vL0M4YTNlTFpiV01PWkZ5c3VjcWdlRmRrTDVaUFJSYmVjUmRRRW82?=
 =?utf-8?B?OFZ2TG1DNVJ0Q2FadjJJUlFjWWNuM0tXYmoveEVWL3dFaWFvTFFzQ2hSSDFR?=
 =?utf-8?B?NzZ0UTZZK0I1TmNUNWdDVDQrSW9KUHZRV3lzc3F0VWNSUS9RbExBWWtLVmo0?=
 =?utf-8?B?Y3cxcWlmU0R2cFc5ZC9DNDFJUlIvd0F3ZXJ0MGJBdGxtNEUzU2RGUHV2QU9M?=
 =?utf-8?B?TzJHbGY2bVZ0UUZ6TGZCVHNMYXRsaThtVnE1VnBVY2N0M3dsQ3FUMUtEYVlz?=
 =?utf-8?B?WS9Qd1hNN1BJbFFUc3VYSjBFTmJVMlhLcUJPdndadFRGb0ZTZDZuWVRySXFU?=
 =?utf-8?B?S1hXMk8xdlBmUEd2dFFhK0lOdXdXYWYxMytUUXFDellVNkswOWJoa1ZwVXl5?=
 =?utf-8?B?ZzNhOXZ6UlBoYTFvelZweW9tWXRGQ2s0YWFvV2Z0dVBvODlleCswSHowamJw?=
 =?utf-8?B?WEF5OUlDM0RHWE1rZFZlWjYxSEtITVF5Q0VGVDFycG5xcG1jR0R1MlY5Zndx?=
 =?utf-8?B?QkxyRWlMNzlFR2NKZk53dk9MRDk1c0EvclBBQ0tEV3ZaSS9vVFZXWjFtMU9j?=
 =?utf-8?B?UzNqZlRjWXNiQTYzMGF2ck1PaThwWUxZMFdHY1lHQ3M0elpoUWRsTW5HbWdM?=
 =?utf-8?B?bGJzb0tkT2lkTWw1U01NaVc0ckcxZVA3R3g5ZGJWbzhsU2RVT3JaNXhsL0Rv?=
 =?utf-8?B?TXFWeUJicE52M21jUlJTWGc2WXByVmRzN25MTUZTSVpDL3FreFVDdUEzQzdC?=
 =?utf-8?B?RnpyV0J0WG5HdzVJM2R0RXdkZUx1ZlJld2hQSnU0TUZrVU1Bend3cS9kOGgy?=
 =?utf-8?B?N1pnS1ZaM3VPSWtDZWt3dXI1NVgyZEtmaTJnbkxyN2pSblV3MUxzdjdJRXVl?=
 =?utf-8?B?SUEzUEZyOUNLNWFIelVKY3dmSVUwRUdxQ01TM2RsZ1B0MHlJN2xJWUh6OW9K?=
 =?utf-8?B?a2FTWEJTNHNxdlkrV1NPZjdGRjg5N0haTnpFRWhFT3Z0VWNoRkZNQkw1aVpD?=
 =?utf-8?B?V1dCU25yY2ZNSEF5UnJMN2I0ZklGNnhhaTdmY2RzQTJCRTEzdGlGVmY0Mm1B?=
 =?utf-8?B?WXhnZWR6dUR6UkpPNy96cWxoeTNtcXorQmJxY1c1L0RWcnI1eW5VY1FDS2tP?=
 =?utf-8?B?RHVjK28xM0JJbm1RU1FldTFXTEFlM1hVQ2JFVFlCaHB4eWJBTXRMdHhtZG50?=
 =?utf-8?B?eVREUTBTZGVyVXJCQXBCeGJxekVNZ3E1QU5zYTBlL3NJS1lCMC8wVFlYOGJ3?=
 =?utf-8?B?SGNGQmlTSGkvdkR3bVJvY0hRRUN3U2Y1ajNsVWdyTGQ4WHV4M2dJYkpBR3kr?=
 =?utf-8?B?OEVTRjZiMUhGT2R4VHI5UFg1T0hlMDB2UHVlbWNtR1o4VUZoT1ZIMkQ5NnNy?=
 =?utf-8?B?QjBsendtSmNTazI0RWxodXFsdVM3WmhTdmQ1QlJqdmJTM1pETVQwUzZKRE45?=
 =?utf-8?B?N2dSZ1pjSjJGT0xkbXRlcG8zc0JrdndsNHowVnplV0xPSytNNkJQWDU0ajZT?=
 =?utf-8?B?K1VFR3ArdjlsNy9kWlBVZ3l0RHd2US8wSlF1WCtScHZZbHZub1p6ZFA1aFp0?=
 =?utf-8?B?UVN6L2xMS3VvckgzelBaa3Jmc2FHWGQ4a2JhNmlwMDJ4UjJEcXhFdCs3Q0do?=
 =?utf-8?Q?3TX4BFZWjeYjLmH8kZUBxMlJq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: PQR2wb2xJcAavLBRRIQvnXAR83SPW5c5nz1ASvJL8PpCr+h332a57z12EH75Twf7vQVX2CxjmZjUUiguSQ+SlgkBo5vxxJ3UWM8YZFs7V00dkIPIOlSFrtKGPJDV9gUusL+xwAL2/dW3E0ZZ9xv3zQz1Y9eYqI9vrPn23w8W98P4fOwnADMWQnq8w8CRAgztplZdFdQc8uYEaT3rjm149xDuZBAa5S/IU4uKgOSpQC+hYow1ofn/4dSg7lW3NGIQEBMRrtCVK9H6OwtGf+M6Q+/9Lg+z5Q35+qgfZDTUFBAQuLrcnNKbytHZFpjMRQJwORHgxr+YEF56z2g1DdUf0CZo7aXXrsqG46F4AuHUd4+26v1tW31wEY9Iad0yBdY01OHI2De+a1P8RMsXZQUOD2ynofI8ftuSN9MkjkFu3NEz02doNOlgt4SIRe9Tev1v1+umn269gfHySh52VDjsjrlrQn5qYYUCPaXx9P6ida00rOKsgYprxrGfB7rqRpGyUtsKS+Mh95k7gmIs9QjgT9ptyQ4838emZobMEiSOXJYvIAkjlvz/xibTTZ4LWY78k5J03OeFNjBkLGiJSo8F+0ws5DiJQZx2e0ckbXtUpeBpcFH70O2hQvx5Ha/bMCIh
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6903.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a95a6cc-855f-48a1-0648-08dd209dc6cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 02:26:57.3492
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CO2UENH/qm4yo/yqblAlosLEscphsPMO+xlfYAgI7YLN3HZC8NMkMKpDtqnr7JEuCIir3OfvsbrO0OueFzgapb9FOGAEJZBwv69KGCkM504=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_182709_353903_716D9EB5 
X-CRM114-Status: GOOD (  12.88  )
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

SGksIEpvbmF0aGFuDQoNCj4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2NwdWhvdHBs
dWcuaCBiL2luY2x1ZGUvbGludXgvY3B1aG90cGx1Zy5oDQo+ID4gPiBpbmRleCBhMDRiNzNjNDAx
NzMuLjIxMDA2ZDFjZGE1OSAxMDA2NDQNCj4gPiA+IC0tLSBhL2luY2x1ZGUvbGludXgvY3B1aG90
cGx1Zy5oDQo+ID4gPiArKysgYi9pbmNsdWRlL2xpbnV4L2NwdWhvdHBsdWcuaA0KPiA+ID4gQEAg
LTIyOCw2ICsyMjgsNyBAQCBlbnVtIGNwdWhwX3N0YXRlIHsNCj4gPiA+ICAJQ1BVSFBfQVBfUEVS
Rl9BUk1fQ0FWSVVNX1RYMl9VTkNPUkVfT05MSU5FLA0KPiA+ID4gIAlDUFVIUF9BUF9QRVJGX0FS
TV9NQVJWRUxMX0NOMTBLX0REUl9PTkxJTkUsDQo+ID4gPiAgCUNQVUhQX0FQX1BFUkZfQVJNX01S
VkxfUEVNX09OTElORSwNCj4gPiA+ICsJQ1BVSFBfQVBfUEVSRl9BUk1fRlVKSVRTVV9NQUNfT05M
SU5FLA0KPiA+DQo+ID4gSWYgdGhlIERZTiBvcHRpb24gd29ya3MgZm9yIHlvdSwgSSB0aGluayB3
ZSBzaG91bGQgZ28gd2l0aCB0aGF0Lg0KPiA+IFNvbWUgbW9yZSByZWNlbnQgUE1VIGRyaXZlcnMg
YXJlIGFscmVhZHkgdXNpbmcgaXQgd2l0aG91dCBwcm9ibGVtLg0KPiANCj4gSSB3aWxsIHRyeSB0
byBkbyBhcyB5b3Ugc3VnZ2VzdGVkLCBidXQgSSdsbCBjaGVjayBpdCBmaXJzdC4NCg0KQWZ0ZXIg
Y2hlY2tpbmcsIHdlIGZvdW5kIHRoYXQgdGhlIFVuY29yZSBNQUMvUENJIFBNVSBkcml2ZXIncw0K
Q1BVIGhvdHBsdWcgY2FsbGJhY2sgZnVuY3Rpb24gaGFzIG5vIGRlcGVuZGVuY3kgb24gb3RoZXIg
Y2FsbGJhY2sgZnVuY3Rpb25zLA0Kc28gd2UgY2hhbmdlZCBpdCB0byB0aGUgRFlOIG9wdGlvbi4N
Cg0KQmVzdCBSZWdhcmRzLA0KWW9zaGloaXJvIEZ1cnVkZXJhDQo=

