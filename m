Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB23D7496F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 09:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gQO8w8AHTkUMR2NwVJDb+ldM23mQYGpCJ1mpj+GiF14=; b=S4FuGijqpQleA1JgteF0dBsn9A
	gV9iLA6KjHzb46jLSnNbDZlyxtFHRmBrXz+nJzhJ14E4vd0ejC7oIMUB5wTuU8KWIS+dl2NZLj9A9
	D0Gb0YcjjoQ5R/GUEytvEPlps+a5hsIjAVgDKpl+45WyJWEP5IkhrLgm3mTVnCTDjiHGZ7xbRW4ve
	7x/889v/BZzlMOsDw0k6zXLJWjSs6xh2dJ7nV+GBV0civGQTe11FoPiqHUC6mT57fL+LJo/XdtwK8
	rapUtEGLSXhh4afYHGKCFiyEVLraqr5xoQLn56ySdPIc0DSQaDrXX3X42bFz1HybOj6f/2ZDnC35S
	aI0LsC4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWnI-00000009xAL-2MOp;
	Fri, 19 Dec 2025 09:29:04 +0000
Received: from mail-francecentralazon11023100.outbound.protection.outlook.com ([40.107.162.100] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWnE-00000009x8N-2ac3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 09:29:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bDN3AWJU5gHN6vUSmt3bC13R1gUDjHPL2ZtAK9jT6HK0UqgF/Eyy6TXn1hF7jSXMjca0xSrFMbbEco5OpiVzlzFG99a4XaHz9UwmwILvn6PlH4E8mSlx1/MKHJc/fcu0k8Rs8IGNRePIaPB42gpfkkybtZZKIYgqzIUFb9EyhByXBQAAebGg49K6WuSIFyvS19Y3vmap+8NBioyE4p4AtiYfEo9TDA4rhzc1un7UB73HZeyZGo16XVge+84axOefM/hAcfBkFL5MEKc8Na+dQ7q5clMw6JSPxl+E8qYxMuPudG8P1A1p3dr95cn3WzoG3QaG/vAKePxiQ909OgtNPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQO8w8AHTkUMR2NwVJDb+ldM23mQYGpCJ1mpj+GiF14=;
 b=bQvmnvUxnZ37nZE0MtkJuXFLAfvTE512G6QMEGeozec9CpLEqA1RbEV/qr16WClelY60vuDiDChp3PWnzATj67c4SMYoJP1XDN17r4CxnjTkbZvUbdKJ/zG2btG2btiIGgBv5eqFOx+a7K6NatdRzQbVICNQK/1TphVBrB6ABpdgh+Mjn//+N3f7vPt4IjWtoid84Nj1mMzcosIN9S1jCGQ5XTWHWOySCO9gPAeSkAZ41tEOeh6CqZOXUpdu0OSZOgHiGfz77YoCwbSYrIxHvHdVOOOI6KrDHGpP55t8LLYUuAAXH3HWjEbrGFpYYbeORMJAFCBQabaHkPEK1W3WqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.fr; dmarc=pass action=none header.from=phytec.fr;
 dkim=pass header.d=phytec.fr; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQO8w8AHTkUMR2NwVJDb+ldM23mQYGpCJ1mpj+GiF14=;
 b=Q4sNUR86zMGtR4E3mZaYHK4Jfoke2QTswTEI+Ns9iaiyd7ZjCi5q6Nhnp5fWrqtxVsZkIhy9gL9FyRs/AGCYhwl58B3wps4+wbvyWFJbJjxgU1fymGpMyBi7JLbDZ4W+0EKfUTppMUISqytzn4BzeQfRlnWRjC8Hpu2ZubdAVHU=
Received: from DU0P195MB2197.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:472::20)
 by PA2P195MB2494.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:40b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 09:28:52 +0000
Received: from DU0P195MB2197.EURP195.PROD.OUTLOOK.COM
 ([fe80::6f68:e880:a341:452f]) by DU0P195MB2197.EURP195.PROD.OUTLOOK.COM
 ([fe80::6f68:e880:a341:452f%7]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 09:28:51 +0000
From: Christophe Parant <c.parant@phytec.fr>
To: "robh@kernel.org" <robh@kernel.org>
CC: "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "upstream@lists.phytec.de"
	<upstream@lists.phytec.de>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "mcoquelin.stm32@gmail.com"
	<mcoquelin.stm32@gmail.com>
Subject: Re: [PATCH RESEND v2 03/11] dt-bindings: arm: stm32: Modify
 STM32MP15x Phytec board items types
Thread-Topic: [PATCH RESEND v2 03/11] dt-bindings: arm: stm32: Modify
 STM32MP15x Phytec board items types
Thread-Index: AQHcardCA4jkgqRtikGcfueWeIeu/7UovleA
Date: Fri, 19 Dec 2025 09:28:51 +0000
Message-ID: <0ad7413a5252633b2a820db1cf2a10f7d658f6c6.camel@phytec.fr>
References: <20251210101611.27008-1-c.parant@phytec.fr>
	 <20251210101611.27008-4-c.parant@phytec.fr>
	 <20251211160013.GA1485420-robh@kernel.org>
In-Reply-To: <20251211160013.GA1485420-robh@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.fr;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0P195MB2197:EE_|PA2P195MB2494:EE_
x-ms-office365-filtering-correlation-id: 644e919c-ed7b-45b7-97b7-08de3ee105cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?bnNxVkNaaFJydWFxeklPR0ZVS1FZR2JoYnZUeGcxbWRyQUcxOTdsblNlbTV5?=
 =?utf-8?B?UUZzMmwxblhwMTZhb0NiSVp3aEg3SlZKREpPZ1RHV003akg4WGtsSkh1UjJ1?=
 =?utf-8?B?NmVWSVhvRzBVVngzSjRTY1lMTWg1V2liV3I4VE9rSWVyNjJkQlJiRDNUSE5i?=
 =?utf-8?B?WDJaYmx0eitobi9YTjdEdUNEVHVzNG0yRE8rM1B1aGlVb213Z2hVYk11Q2FS?=
 =?utf-8?B?NW04R1UvdHQvU2haNUVnYmhmTXNHS0FwaVBmeXUrWnlVaGowUmlpSTNscUkr?=
 =?utf-8?B?VzdxcDFWQ2VwYmVkR1FFRU9TbEVmZU1WZGwyYkpzQjZQUGFTbThNTzZ3M1Nm?=
 =?utf-8?B?SDVVcmxJZ0NTMVNEL25iSmRQQnk2cUZ0ek1lL2w1eXB1MC9HeU1YRzV3Z2Vs?=
 =?utf-8?B?MkFqOU1OOEN1NndscHV0ai9obzZhd3Z3T3NsbHJkZ0hLd01PMUN3UkZpeDZz?=
 =?utf-8?B?eWtOS3FkbEdFdEs3cXg1UE12alVteElhOFVrd0ZNSGZLVHU4YUNGVU85ZzFr?=
 =?utf-8?B?cW9RMUluZ2RMUHlGV0xoS2hDMjM0MThnNGNXTlZ3K1R3eE9RWDRnVVZNTE1W?=
 =?utf-8?B?YzJodU5kb2NSaEZvQjlycmYxVUJkVUZCL240dUJtbnhoUDZXNmNQSE01a3Er?=
 =?utf-8?B?UW0zMVBwM0NPRkpYU0pkeEhQMXp1S3cyYitFaWJ3SGVVejl0Sm5nN2d6bU9N?=
 =?utf-8?B?ajJvTER0cHNncmtNNDc1MUI0OU56ZHJXRERzcW5pbmVTTW9wRnQ3QTQ0aXF1?=
 =?utf-8?B?TVNmcnZEMXZxUHJrYUdhNHFnaHJaMElNZm9lOGZKOW9hUERqc0pJOHZhVlFt?=
 =?utf-8?B?OWFadFJneXpnTFVBZVhpc2ZyVVRueFphckdrak5NeStndkV4SzJsd0FhMmcx?=
 =?utf-8?B?VEJXWjVPZGgxVHdLTmtneVdxWEw2d1o0cHFPREl0OVp3NFRialBHdFVJQVpp?=
 =?utf-8?B?WGlnb3JLdjVMYzhoNHFkNDlGUlBsaHNxMlpnNUF4OFlMc2UyZU5qMnQ2SW1x?=
 =?utf-8?B?K01PaDM0K2o1NUVWak90RlVuSzhUZWNacDB1UE5RRlUxMHordlJaK3ByTlZI?=
 =?utf-8?B?TGVGY3NaNHE5VllMS0R0Z0Z5d3ZYeUgyd1ZjcjRoVENFbTVtTWt5MVhKdVA3?=
 =?utf-8?B?SW5pM3dhS2JQNnpmRktlRXRISk9wbWhOUW9Yem1aOEsvcENOOEZCRjIvOWRL?=
 =?utf-8?B?YkpNOGcxdzQ2cVF0TjVCSjRNbVRvOWVIdWVhdjJ1ZXRnUjRrOEgrWkFvQUpW?=
 =?utf-8?B?dlp6WEo5bEs2aFk1dUdpK0JiYlFya1QvVDNhYmFybmdySTQ2N202cGd3OHdB?=
 =?utf-8?B?eXQzcFdOUXVaQjdKMmxGOTZuYnA5TERmNGx4Titqc3BRYXFDcVdBbTVPV3g1?=
 =?utf-8?B?M3Yrb2JJYkszTk1SY2p1QVZ3cmQ3cjhXdU92T0N3S0I1c29GemRZSGRDdnJz?=
 =?utf-8?B?Qnc5MGlTOWRqQVlsL1ZMSXVJZDNITXRqdXA3K0VBcnd3Wi81YnlHRjVYSEhl?=
 =?utf-8?B?RnZaS3dtZ0RVYjVxdWNHb2dCMVBLSitJS1d6V1h6MWo0NmNaOW1mUjBiclhy?=
 =?utf-8?B?bzBBTjVBZ3pZVlhVQVM4aGlOVE9aa0ZyVGtlYkJoUjE0R2x3R1FrRGNTbTQr?=
 =?utf-8?B?UTJ1SVRwQlRqdkx5VkxwcTVXUHcyejN0dFN4K3FJMEZmNjFDdGc2WnFtK2FN?=
 =?utf-8?B?bzBOSWFyYitjRzdzYXVKUFFZM3lqVUhaaURxVEgwWEtsTlg5WTc2N296SUxi?=
 =?utf-8?B?R2M4a2RzU0k1Tjhwc3ExMmRDSlRLSEJ6NnlUNDE0RndWV1hxc21iekNEY2hh?=
 =?utf-8?B?UnhFQXZKYU5HR1NMNkRmUnZKMm1md2JKZTQyWjUxd05lTk1zSjdSa3ZYWHd3?=
 =?utf-8?B?Nm5NeTZCQ3FOQURVcVlDeVMxeS9jVWk5WjhsZjN4Qi9pZFVRNXRNQ3lJZXNu?=
 =?utf-8?B?TDI4QzZUQnpqWHZqK0g1WTJ0NmNWYXdqWDVvRCtheWY2TmxkVWZzV0JJQWlR?=
 =?utf-8?B?K20ycGFUbExwc0g0MThhQ0VYWW9ETEVnYUxrRGc2Yk9SS2E4TnE3QnNUUGVW?=
 =?utf-8?Q?4vUNrT?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0P195MB2197.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjRMaEtEaHhuby9kUGNISGxPd3JpUEltamlVUXI2NDN5ZU1VRnpvdFY3dGtp?=
 =?utf-8?B?T2ZGYWltVjlpUXlyL0JmcFA1ajRpSndhRnE0WjRFVE9PdElicmhPazJNbWhZ?=
 =?utf-8?B?REkrdWhmMWhjbDVwSzFDN0JkcU5ZZVFTejhOL3JNR2NwNzhuRnYvQVRkbXNm?=
 =?utf-8?B?aVpQNDVoS3EyRVNkamh1SlZHcnE4b3FQZVNZUVFsYTVXOUNYSE16U2ExTEJy?=
 =?utf-8?B?VDQ0bEMydlhZQkFpMVM2NXpXN3FFY1lxc2QrZFhyRmZCQysyVzZBNFJranJP?=
 =?utf-8?B?OXZQWEtpdklIRWlnams4VzFEeFlqbEFtWWFVakFwTWFrSlh0WlM1eUxKZjFQ?=
 =?utf-8?B?T1NPbHRSQjFYRjRuZERLVDNZbHJiZFl4a29meDBZN0twTGhib2pnYlJGMjJu?=
 =?utf-8?B?eFdMSmZveU01QTBhS1RVQVlvc0tkdGowVzB5L3pWS2VuQXRwUExCQk9SQ1Bw?=
 =?utf-8?B?RkFsMHBKZ3ZsY21PRHZ5ZW85Nk1UQTl1a041cXhsSWJFVFlUeUh2aDlDZlNG?=
 =?utf-8?B?NTY1cFAxMUhJNG8zTGV2YWc2ZEhWZEJjWVdyOU1xZGFHVnFEYXRTdjBkUEh5?=
 =?utf-8?B?bTdSbWx3OWcwMXBjS0RyVFcwanAzcWl2RlRrWSthYlpGcGxVaVlJSmM2UXU0?=
 =?utf-8?B?cVRURmZnckF0Q285dmRUUjBDOFkrRzd1blJjQlpLMjYwOG11cVRMRVZWQlk3?=
 =?utf-8?B?VzlPYUVTblg4TFlSNXVtaXk0bkw3TUxjNzhVR2RvK1hYbjRkZldUdlRhUTlp?=
 =?utf-8?B?VCtmTEJWS1Z6TzRZUWxiRFVxcldGSTl0Q1Q4cG5wWTFlWjFqbVE2MU1yZmxy?=
 =?utf-8?B?aEhlaTE2d0VVVW5pWWo3UmFzWVhoYjBsSlpnUUxmR3VXS3NRKytOSWJteGY5?=
 =?utf-8?B?WnZtUnQvSWFKWFdBNFhCb1lwN01MdHZjRW42S1RHTFg2MGpsVkxuelNyblYr?=
 =?utf-8?B?ZW9aZThJbzVSMlZjWElTZElvNXI3V3pTd3I3RXd4THBDaUdBYW0xZ0tEaU5C?=
 =?utf-8?B?a3hHNXV1WmN2YWpwU1ZUQzZ0TjBENDh6eGRyUE9TT0dHT3I1NEV0R0plM3hu?=
 =?utf-8?B?N0VPNlE2OW9UWUdDcXFvelNYalpwVUNsdC82S3djTGdta2RFZGRZMVNQVE9G?=
 =?utf-8?B?LzVZc0plYmdpRGtpd0dEYndXR20zODRJY0ZJTFhxTDJxK25DblZSS0duUlJO?=
 =?utf-8?B?Ky9mbWF4N29zTUozTjBKcWNQcFJvaFVkNXhlbnBTeVpvbDJ0enJqQUxtZnBY?=
 =?utf-8?B?VEE1bEYrQXB0Zm1EZHE5T2FwZXRxYU50U0pnaGYzamliRGgwR3p2VlZjSjNz?=
 =?utf-8?B?Q1FUcjJYNUc0Yjl6NVV6L0p3dHpYdHNudjVJbHVoUTZTZk9Ld1BBbjk2clY5?=
 =?utf-8?B?ZkFuYmxjaWwzN2t1UDB5N1FQWVJiN1N3U2doUkV2QWFRbHI1VDU1YkxvdjJM?=
 =?utf-8?B?R3lCcGpTUjYwK3VQK1NxazROd3lOWE9pZmdKdmc0TUNxYkJIeHVKcjZXTEEz?=
 =?utf-8?B?djNYWDNPNFlIN0xvcjY3UktjdmtqODczTXBzeUNtUGh6ZEk2RjA0dHFTM0cw?=
 =?utf-8?B?dk5FSVcvWmdnRnJVaVZsNlprWFFWcUxCZENTWC9BWUVHTSt6YTd6aitHa051?=
 =?utf-8?B?aVRGeSs3WlQ1YmVEemlOKzJ2aUU5QWJOUWJjUk5PSGlrUjExeTc0a0hMMklM?=
 =?utf-8?B?Mk95WW9tMGxvU1dWVzgzU2hEbTFPY2RSRjMrSllMZDdWNWhDMGJYVFE3Tklw?=
 =?utf-8?B?M2RLckQwbjUxS3dlS0ErRGNYbTE5SEpWaGxLWlF1VzBwVG1yano2OUlrYWVs?=
 =?utf-8?B?b0tIa3prMWlZSkpkWG1jeUJvamEwNjNHbGdrenpqNm1lMmc5OGpwTFMzVis3?=
 =?utf-8?B?RUZmMlNOSlBqYnFzZzVWQmh4OGFVeER1U3ZrQ3FaTXMxdFR1QzQvdHBvcnR5?=
 =?utf-8?B?RERjcWpaSXNmdGNJcXlIMFZDWmtRU1RtcDVHazJ3ZzFJTStDOW1QNndEVUlM?=
 =?utf-8?B?MU1hWUZiUHlVcmFTSzloaXU2OXJBZ2tsUHVyU011VmluQ1VWUFJZU3Y0WURx?=
 =?utf-8?B?cktQc3RCclROMUFpUE9iVjhvWS82cnlNUjF4dnEwVUR1dFJlODN1d1U5L3BN?=
 =?utf-8?B?aVVXSlM4S3V3V2NoZEpMRnpWeTNWZURZbWsyUlZrWFppTnBUWE50cU5YdkQx?=
 =?utf-8?Q?jkNQ6AEFnF0kEeA7oqc3MePKHJmEpgPS8Fbh9gHAv5nr?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2338067C98F7EB4A8F97069D41F0FCF7@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0P195MB2197.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 644e919c-ed7b-45b7-97b7-08de3ee105cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2025 09:28:51.9022
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1UVswPYpa+6DODuN+tlDbhjv5Siqb/5e4y7KSclwDr3eJMXXUsNrNJjE6KB2wgXcRP1+wqupJc4tD5uVmBc+5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2P195MB2494
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_012900_662120_BD6DE98E 
X-CRM114-Status: GOOD (  24.39  )
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

SGkgUm9iLA0KDQpMZSBqZXVkaSAxMSBkw6ljZW1icmUgMjAyNSDDoCAxMDowMCAtMDYwMCwgUm9i
IEhlcnJpbmcgYSDDqWNyaXTCoDoNCj4gT24gV2VkLCBEZWMgMTAsIDIwMjUgYXQgMTE6MTY6MDNB
TSArMDEwMCwgQ2hyaXN0b3BoZSBQYXJhbnQgd3JvdGU6DQo+ID4gQXMgUGh5dGVjIG1hbmFnZXMg
ZGlmZmVyZW50IFNvTSBjb25maWd1cmF0aW9ucyB3aXRoIGRpZmZlcmVudA0KPiA+IFNUTTMyTVAx
NQ0KPiA+IFNvQyB2ZXJzaW9ucywgbW9kaWZ5IHRoZSBwaHlCT0FSRCBhbmQgU29NIGNvbXBhdGli
bGUgaXRlbXMgdG8NCj4gPiAiZW51bSINCj4gPiBpbnN0ZWFkIG9mICJjb25zdCIuDQo+IA0KPiBD
aGFuZ2UgdG8gZW51bSB3aGVuIHlvdSBhZGQgYSAybmQgc3RyaW5nLiBJIGRvbid0IGZvbGxvdyB3
aHkgeW91DQo+IHdvdWxkIA0KT2ssIEkgdGhvdWdodCBpdCB3YXMgcG9zc2libGUgdG8gdXNlIGVu
dW0gaGVyZSAoa2luZCBvZiBpbmZvcm1hdGlvbg0KdGhhdCBvdGhlcnMgYm9hcmQgdmVyc2lvbnMg
YXJlIGF2YWlsYWJsZSBidXQgbm90IHVwc3RyZWFtIHlldCkuDQpBcyBJIHNhdyBleGFtcGxlcyBp
biB0aGUgc2FtZSBmaWxlIHdoZXJlIGVudW0gaXMgdXNlZCB3aXRoIG9ubHkgb25lDQpzdHJpbmcu
IEZvciBleGFtcGxlOiAic2VlZWQsc3RtMzJtcDE1N2Mtb2R5c3NleSIgb3IgInN0LHN0bTMybXAy
MzVmLQ0KZGsiLg0KQnV0IEkgY291bGQgY2hhbmdlIHRvIGNvbnN0IGlmIHRoaXMgaXMgYW4gaXNz
dWUsIG5vIHByb2JsZW0uDQoNCj4gZG8gdGhhdCBlaXRoZXIuIFlvdSBoYXZlIG1vcmUgdGhhbiAx
IFNvTSBmb3Igc3RtMzJtcDE1Nz8NClllcyB3ZSBoYXZlIHNldmVyYWwgdmVyc2lvbnMuIEhlcmUs
IHdlIHdvdWxkIGFsc28gbGlrZSB0byBhZGQgb3VyDQoicGh5Y29yZS1zdG0zMm1wMS00IiB3aGlj
aCBpcyBlcXVpcHBlZCB3aXRoIHRoZSAiRiIgdmVyc2lvbiBvZg0Kc3RtMzJtcDE1NzogInN0bTMy
bXAxNTdmIiAod2hpY2ggaXMNCmFub3RoZXIgYm9hcmQgZGV2aWNlIHRyZWUpLg0KQnV0IGRpZG4n
dCB3YW50IHRvIGFkZCBpdCBub3cgaW4gdGhpcyBwYXRjaCBzZXJpZXMuDQpXZSBhbHNvIGhhdmUg
InBoeWNvcmUtc3RtMzJtcDEtNiIgd2hpY2ggaXMgZXF1aXBwZWQgd2l0aCAic3RtMzJtcDE1M2Ei
Lg0KVGhlIGlkZWEgd2FzIHRvIGtlZXAgdGhpcyBEZXNjcmlwdGlvbiBzZWN0aW9uIGZvciB0aGUg
InN0LHN0bTMybXAxNTciDQooY29uc3QgaXRlbXMpIGFuZCB3b3VsZCBuZWVkIGFub3RoZXIgc2Vj
dGlvbiBmb3IgdGhlICJzdCxzdG0zMm1wMTNhIi4NCj4gDQo+ID4gVGhlIGRlc2NyaXB0aW9uIGNv
bmNlcm5zIFBIWVRFQyBTb00gZXF1aXBwZWQgd2l0aCBTVE0zMk1QMTU3DQo+ID4gKCJzdCxzdG0z
Mm1wMTU3IiBpcyAiY29uc3QiKS4NCj4gPiBBbHNvIGFkZCBjb21tZW50cyBpbiBmcm9udCBvZiB0
aGUgZW51bSBpdGVtcyB0byBiZSBhYmxlIHRvIGlkZW50aWZ5DQo+ID4gdGhlDQo+ID4gY29tcGF0
aWJsZSBzdHJpbmcgd2l0aCB0aGUgcGh5Qk9BUkQvcGh5Q09SRSBuYW1lcy4NCj4gPiANCj4gPiBT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIFBhcmFudCA8Yy5wYXJhbnRAcGh5dGVjLmZyPg0KPiA+
IC0tLQ0KPiA+IMKgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zdG0zMi9z
dG0zMi55YW1sIHwgOCArKysrKy0tDQo+ID4gLQ0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zdG0zMi9zdG0zMi55YW1sDQo+ID4gYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3N0bTMyL3N0bTMyLnlhbWwNCj4g
PiBpbmRleCA0MDg1MzI1MDRhMjQuLmZiZDNkMzY0YzFmNyAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3N0bTMyL3N0bTMyLnlhbWwNCj4gPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3N0bTMyL3N0bTMyLnlh
bWwNCj4gPiBAQCAtMTgyLDEwICsxODIsMTIgQEAgcHJvcGVydGllczoNCj4gPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAtIGNvbnN0OiBzZWVlZCxzdG0zMm1wMTU3Yy1vZHlzc2V5LXNvbQ0KPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC0gY29uc3Q6IHN0LHN0bTMybXAxNTcNCj4gPiDCoA0KPiA+IC3C
oMKgwqDCoMKgIC0gZGVzY3JpcHRpb246IFBoeXRlYyBTVE0zMk1QMSBTb00gYmFzZWQgQm9hcmRz
DQo+ID4gK8KgwqDCoMKgwqAgLSBkZXNjcmlwdGlvbjogUGh5dGVjIFNUTTMyTVAxNTcgU29NIGJh
c2VkIEJvYXJkcw0KPiA+IMKgwqDCoMKgwqDCoMKgwqAgaXRlbXM6DQo+ID4gLcKgwqDCoMKgwqDC
oMKgwqDCoCAtIGNvbnN0OiBwaHl0ZWMscGh5Y29yZS1zdG0zMm1wMS0zDQo+ID4gLcKgwqDCoMKg
wqDCoMKgwqDCoCAtIGNvbnN0OiBwaHl0ZWMscGh5Y29yZS1zdG0zMm1wMTU3Yy1zb20NCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgIC0gZW51bToNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLSBwaHl0ZWMscGh5Y29yZS1zdG0zMm1wMS0zICMgcGh5Qk9BUkQtU2FyZ2FzIHdpdGgNCj4g
PiBwaHlDT1JFLVNUTTMyTVAxNTdDIFNvTQ0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSBlbnVt
Og0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIHBoeXRlYyxwaHljb3JlLXN0bTMy
bXAxNTdjLXNvbSAjIHBoeUNPUkUtDQo+ID4gU1RNMzJNUDE1N0MgU29NDQo+ID4gwqDCoMKgwqDC
oMKgwqDCoMKgwqAgLSBjb25zdDogc3Qsc3RtMzJtcDE1Nw0KPiA+IMKgDQo+ID4gwqDCoMKgwqDC
oMKgIC0gZGVzY3JpcHRpb246IFVsdHJhdHJvbmlrIFNUTTMyTVAxIFNCQyBiYXNlZCBCb2FyZHMN
Cj4gPiAtLSANCj4gPiAyLjM0LjENCj4gPiANCg==

