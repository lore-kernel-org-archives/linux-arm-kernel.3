Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DE0EA3F0D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 06:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OCfhGH8M8LlElLzMdVLr1X9D2Nc09yRJwA4DVQG2vJs=; b=p6VQ4qYiona6E+QegmRVTbgZU8
	WmoGw5dyyNb9Hc5ehmlNOW2728U5WohwMZoXSS9J6co0armS8vGibVIKeQ+aAojlFr6ycpycvixHa
	0FutebNGS5grBsDkYG7v/4Iei2Npjn4owuM7Et8unGJGvvFlriBZKLv3MU2VRfFt36wxkktuo6nnI
	kOB+L1Tb1Ha5sZ4KCurRasdarGBmNgfJrGTjRAipytriBsvTWcDQNtuw71G2A3QW+4BYLOIy9Vrr/
	lSYumnDdDdEMERCbWhNIN2f63yKW9Pppzo9HRAgqPN0Q1Gj60/QOlZc//fTyb4yVvwrlnuVImnTe+
	RnSvjdNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgoZ-0000000GViK-0AKs;
	Tue, 10 Feb 2026 06:01:35 +0000
Received: from mail-eastusazon11012024.outbound.protection.outlook.com ([52.101.53.24] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgoX-0000000GVhi-2G9k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 06:01:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cwsm5zQkCC/VqoCJi4dEG802sOPYOuJO9fvZR8/n54r+F1TJM0qKMooHqWygOcCf7G0xyEfq1Scqi9l/SLfx48zRtYG4iAyZOkW/0B+/bgNUsPb789qnbiw74fWG67yxc261cCEP557hdTz0f8OBo6vvEVG2IKgj7u/yAQegWsGWs5zU/hyt9VLSTHj/qYHaasw62XYpVurrzk5s8D5C8YSZlOMdmdOKMKInUV+G4PAKClsdRCGhAU9TtrfcGfIAZLH23NnP2MRBhiZDH903cVyoBBo4be4OfRurAyo/HwyI/RRNOD4vsU+XcVIprmBOfhP9V8nGzRr8nWq6bW8JmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCfhGH8M8LlElLzMdVLr1X9D2Nc09yRJwA4DVQG2vJs=;
 b=pfTKA6izKa/ZrId6IH6xiC6YNY+BaD5lH61ffGtZVXFlSRUwnNV9ukb8VkPrfUhPtyxGMjpuZZX3heelRzqeqS5c3DkMO6DGhgabLe7F0pQ///6GDzoouqI/zuEo7z18qlz/Cxjm+uOCLxQezXGq+UZfUIghJ+tkLxfbuMNhQMNcBtI7Jw7ubMeepPrmmOo/X3MHcERYbV47KQ97wuYhnNO/UxRWKmKOEfHCpf68/PSunovt7vBJH3VuvFK4dPdgjC1Yy6JhbzfbK32bKK2/M3q039571WD4ByB9YRMLP1hB//10J2DaAH8zRJN7vaTv8Kjd8OKWYmTE6HhvW3E1Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OCfhGH8M8LlElLzMdVLr1X9D2Nc09yRJwA4DVQG2vJs=;
 b=d6xIMQh0Vx0wumam5ZgKJJHR3H0gyQ4gENIWaZCjrdkGBjSQols1894tbn4QOVxFADl/kq5l+pMOGTtpDApX4DrfddYewT+ewr48DYaCRmO9uwgdYHNY4vjCgNVaV2AGsvXLkU5YI+Z3TgpQFezLHnaKStIGrfRbaPJxsMndZsOcLYwKkcAz6BO3HVk7miK9xQ81Wt+VK7qCMupONC0qbI3V6ZK+Rvcx3bFlDokhwzifxOe/M8GuCBUBzhFA8Kt3KKOHE7n1yf0b+hgcemGzwb4PfpxnAI8NdsTB5FffpPp+xHzAG26M7Z/nTpB+1ON0gGkNV8xQRmWGu2iPUMqhZg==
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f3a) by DS7PR11MB6270.namprd11.prod.outlook.com
 (2603:10b6:8:96::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 06:01:29 +0000
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::1a72:d8c6:a4e8:5199]) by DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::1a72:d8c6:a4e8:5199%3]) with mapi id 15.20.9587.013; Tue, 10 Feb 2026
 06:01:29 +0000
From: <Manikandan.M@microchip.com>
To: <Cyrille.Pitchen@microchip.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux@armlinux.org.uk>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v7 4/5] ARM: dts: microchip: sam9x7: Add GFX2D GPU
Thread-Topic: [PATCH v7 4/5] ARM: dts: microchip: sam9x7: Add GFX2D GPU
Thread-Index: AQHcmaqJfzPJWdIygEGPmy3/HXSBbbV7cf4A
Date: Tue, 10 Feb 2026 06:01:29 +0000
Message-ID: <119ffebe-0caa-40d1-898e-15fa5420a766@microchip.com>
References: <20260209-cpitchen-mainline_gfx2d-v7-0-0c12e64a0950@microchip.com>
 <20260209-cpitchen-mainline_gfx2d-v7-4-0c12e64a0950@microchip.com>
In-Reply-To: <20260209-cpitchen-mainline_gfx2d-v7-4-0c12e64a0950@microchip.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF9623118BD:EE_|DS7PR11MB6270:EE_
x-ms-office365-filtering-correlation-id: 9fa85d25-498c-4495-7af7-08de6869d535
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?WlhYV2JaSDNMTFJIZkF1dG9aV0Z2MEJ2ZnFRQmdRQ2xzT0F5bUN4blZtR0I4?=
 =?utf-8?B?byt0bFBjelNqeUIxWE1xVndKc256L0xJbVhtMTZiZ2hDNU1NKzBpZmcrVGt5?=
 =?utf-8?B?RGhhNWw0RFE1VUhZZ216YTRtOG9mZ1QwTFFKY3FFcTJCMmVuSnA0YTBJY3Jv?=
 =?utf-8?B?ZHBtWlJwY2lZRFRkVzlRKzFLVWZtUjVZbUJKMGx4Ymk3NDJxYWJLT3ZoVDZi?=
 =?utf-8?B?SWNNZ2MzcFVYUjdKM1h2Mm9PLy84V3RzTGtFU0Y5dVUwaUpiVEZFWk0rVHdt?=
 =?utf-8?B?cEdOWXZpeHlrUjJ5dWJXcGJIbllHaG9DaVhTRDRWc0VEbWc1ZHNCUlVWWjdD?=
 =?utf-8?B?NGdtczgrczFoaW84UzJ2S1RGWW82NmxQYW84a1o3RzhWMzJUa2t6R3diTzlY?=
 =?utf-8?B?d3JDYmhFcWRxd3NuWjBBdk1vTkVJZkVrVDFHelM3TWhaQlRaT3Q3a2E3MW11?=
 =?utf-8?B?Mkt3R2F6V01NdWI4UlcwWDF4bkpsbEFuNWNNdHJZODVkSFk0V2tVK0FWRm54?=
 =?utf-8?B?RkgyejhPSFBtVVJSRHZ5L2tQWWNPU2JoazIxL21qMkdiVUtTZDIzM0tLR0Zu?=
 =?utf-8?B?b1RZcm9qZXRXaEVQZEtsTEluOURlQzdDQXQ3SnliR05PMTloSXQ3NmNhZ3gv?=
 =?utf-8?B?Q0xOS2JaL25ndVlhblRXb2lhMHI4RVZpZ2trcFVaUUttLytnVWlHazVzR0VN?=
 =?utf-8?B?dzdMVXlDNkpXdVBMRFZSUmt5OTRINjM4WnhvdVp3Z1FGbnozN3pvYytYdXhO?=
 =?utf-8?B?SlhpVmxFQURzUWpQRDIyNVRwamgrdFpMRXdkUVVsaXd5ZVlteEllYTRqN1pr?=
 =?utf-8?B?UFp5cmdMeWxENHRuVmp5U2kybEFwb1RPWitSWElNNDdWOVZTQnQwb2tsSFA1?=
 =?utf-8?B?QWJIZDE2ZnhUVG9PS0xjNkM5NjJVRkhIeWowcDgxT25YQ1VlTGE5RVgvNURp?=
 =?utf-8?B?VTM1UHA5UVl3aElIUllCWjB3MW1wZUVJQ2l4MWxPaGpLaFp4TC9YbmFYcVZp?=
 =?utf-8?B?dXFXSWRKRGVVZ2tWRDY1N2JnYVRXNjIza3JkWUpueVhMZXZ3TG1FVnRWNUNU?=
 =?utf-8?B?dFVxR1hBTjlWd0Z5Nzd5blFldnZyRVFSb1RCcHJUMmtEeTQ1cnpXa2tqS3Zn?=
 =?utf-8?B?QXJobCs5UDNwOVVhWVBSUHF0aU1vMXM3MkJ3U0xvb0Y0ZFMyOWs1aHJPdCtr?=
 =?utf-8?B?K3V0QU9jZjVUSTJmZHZxWHBVRUkzUXRaOWhwdTBQYm45S295T2dUc3BRTjVS?=
 =?utf-8?B?bHV4U1JmQTdlU3FOOVFhNEZwd2QvUkpraTFra1FlNG15WG5iaVpIRVMwN1Za?=
 =?utf-8?B?eVhrcHA0d0RTNzVWNi85VVJMUWVLRHNDOGhPS2svdWRHL1ZaWklwZHltYmp2?=
 =?utf-8?B?ZGZkb0N4R3d6RnFFTGd0NitLS0tkZU5mQjdVdlZDR2UwUktOdndycGRKZVND?=
 =?utf-8?B?Q25DMi9ER3dnb3h6OWd4VjJSakx5amZRZ0VhbHA1NnRYZFd0dEIreHEwejdB?=
 =?utf-8?B?SGF4c2ljVTNyQ1JIZDhsZWcrckNDMFRpQ0tWbFcrQThHV1hPMGRKOHNsRVNS?=
 =?utf-8?B?cnVrY2IzUkVPdDNIY3IwMTNvUkp2SGtJeXRsdldyUzY3d3dWRUVVS01nWTBa?=
 =?utf-8?B?Skh1TVdFNGJxbi8ya1YvVkZHbzVyWmJ5eElUS0NOY2VDRUMzTm5lRnBQMjZw?=
 =?utf-8?B?WXlOcWNLQmEvZjlFaXZBVW1WdU5hZUxiV3QwOHliU0NWZlczS3RiWTNCSko2?=
 =?utf-8?B?Q3lTUDVTMXlzY01saDRMRVkyNDRCVkExQ3hxdXc3SGpzNTVURjNFNDhzTzNa?=
 =?utf-8?B?UlZYTzNoMU8yK2ErelJrUmc3SHhCR3gxdWkxRWFrN2sycmJNSHZuMXRFdEU5?=
 =?utf-8?B?bnh1UkgvVlIwTVpQdWV6UW1PSlc2MWxDMmxqdEtMbldLSk9yTERIcGwrVTRX?=
 =?utf-8?B?clZmRUFmVVB3RTVBaVY3dXN1dVlVc3dkQkxpME9BdmhjZm9IaGxnejQyWlR3?=
 =?utf-8?B?R1M5ME1HM3VZSndXb2lOQ3FRSXVaalVUdkVkMGc5Z2RyYXlUS0RUMFVNTTVt?=
 =?utf-8?B?S2JYTTd1N09tQ0F4K3hGeUU0NXYwMWJJcVVpYWx5YmEzZFRLNWpXNDNxM3Zr?=
 =?utf-8?B?N2JCMGNyT1ZxbXJ3NWlQODVpSmJlcXRkLy9NSUQrbDJOT1dYSUJOZkhmZml4?=
 =?utf-8?Q?+YxrUfwQO2b72v5+B/STrJK0zI5qpWt2B4D9gyk04Ry2?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF9623118BD.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TlhHL083Zm1EcDNRU0IweHpDMWk0ZWVIUzJSTmwzcXp2WEdlNU4rc216NGtY?=
 =?utf-8?B?dWJZRGJYR09BRjZ6SFB3K1lLNzBtbE5KaFZzWlNiR3p1YjNUbVJLRStPdlVJ?=
 =?utf-8?B?ZGRmRUlBdUszUFhLZVR4RkpaQVo0WFB6UFRtYjBlM2h3bExTSVIwUEp4d2V5?=
 =?utf-8?B?RktRWXFIaldjdW42QzRnS2JjNnh0KzJwMGJvUXdZYWRFbnVacWFyb3dwdm1H?=
 =?utf-8?B?SG1GYitTV3ZKV0ZMdlVhY2toaE9SRVVjM3IvUlNrYUszL2plbUVpbzQ2Yjdq?=
 =?utf-8?B?WGtwbXprMHFudWlCMVZPTjhsOUp3L0JZODZadmlRYTdpRGFZZS92THdXTUlK?=
 =?utf-8?B?NVFWMlV6T2RGb3UzMHhiSlNGU2lBbDE0RXNaTWpRTVFESElKNkFFQmJYMHox?=
 =?utf-8?B?MGM1MEgrL1lqRThoaFFacFlzdTdoLzY4ZlNIQnRDWlNFdW94NURuSHM4ZFVR?=
 =?utf-8?B?aVRQZXljUVp0QjNDK1JvSE5jOGw3ZGltWHNDODFtWWh5WkVSSjlQTGJubTln?=
 =?utf-8?B?ajhWU3BaaFVzRjFoVlY0bmJkVlc2WUhmVG5FZ1RnMFV0bUJUNTJjY3J2ZXJE?=
 =?utf-8?B?ajNFRGQ4b01RMTJvWUFNSERONWZLSnkrVUg1MlhWVVI3b09lRktpY1RsU3Yz?=
 =?utf-8?B?d1dTeVFWZFpCNnI3QzFYWkplVThid3Nnb2dFSVg3ZmVnTXhqOS9MSDhQcFpT?=
 =?utf-8?B?QlB3bDAzZWx3cXNGWGRtck83aWd2QUdlYjVyY3BRSDg4V0FVWnpnMWhqU2pi?=
 =?utf-8?B?Um5UMlU5MkNYeEQ3eHN6S1ZrZVRUZlk0WEt3VXAvM0ROKzZPZWhJdllZaVRy?=
 =?utf-8?B?MzJkTHNRakhMelkwQ21iNFN5REcxWkhBcVRlQTRNdHE5Vm1KYkczSmlIOEtu?=
 =?utf-8?B?ajltTnZJMkRWaW82UmZZSWx1WnVKZnNxbzlDdHBrcXU0TU9lRmlHUzl3ZjVj?=
 =?utf-8?B?ZmIyelNheDZVVE1UVWpucFF4dnUrR1kydVhXN09jd044dERtcWtObXp2SnNN?=
 =?utf-8?B?cE9DblUxYXN6M21nNEc2TTlUbkE1NllySkNFbmQ5bXlJUktBZFZkMlFPcG5F?=
 =?utf-8?B?SVlsdXZ6RHdxNUZHS1pwR3Zod0t4MzNaMG5TTGl0ZmJveXhCRms0ZU1pTUwr?=
 =?utf-8?B?aTVmWXFHdTdnK1d6dTZ3UUE0VU43L0RRQ2RTRk91NWI2QWZLblJ4VEhBc211?=
 =?utf-8?B?RTRZVXFWRUJBTDRxN084NlMyZ29MT0xDeklOL2lCRisxdy9TeTk4eVh1Z21w?=
 =?utf-8?B?QnpNcjhNWDloOFBVajhjcG45Q2Y1S2ZWWWNxcDFHUG5ldnhMRk5mOGlISkcw?=
 =?utf-8?B?NW9Lb1BDWmlwSzY5R0dEcTJ4Rjl0b3VYSGUwMys4K0NEb3NqN05RdHEzeHRQ?=
 =?utf-8?B?OUNpR01jV2lpWmZRMXBVYnpyai9Ed0hZbEhHZmxydC9Odk5EYmViVlJHd2Ex?=
 =?utf-8?B?cHJReUlDRTVxUFhvekpTSndxNi94NzhtbXM1dDhVWmExQWVXR2dSeW92L1RY?=
 =?utf-8?B?a3h2NTB5WHJOVjkvUUFoSHRKYUhuVHU2N3FtM3FtSVZzTmJvL1BVUzg0WndH?=
 =?utf-8?B?aWFCQWpVVTNQQXFYcklkak9vS1FIY2Zsbm9veTNyYVNIdTNmT1o3akx5aEJM?=
 =?utf-8?B?dHlZejV4bHJ3a1lMRVVXT1J3U2phRUtGWC9WV1ZiSVEwNldHaG5oUmx6NnIv?=
 =?utf-8?B?emFHRmpkQmMvMmY2SDlFVVV2dnZ5N0NmMTJ4dmJYTXNZS0JmMS9ibUdzSUdP?=
 =?utf-8?B?aHpHMnJWQm1zQUh4eHBxZEpZaXRWUk1hVVNkak1oMFlnWThDbWxEVkVzeHBx?=
 =?utf-8?B?MXNXWFZwWFBFMW9ySDJkeDVSTFhDTENDR0xiTTNyOUtUSWpwMTBmVHV3aGMr?=
 =?utf-8?B?KzJNd0RrNUVQMXZWMnNVKy9wNFRvSC9pL2p6cnlzVi9ZRmJGTlpwc0JYOWVi?=
 =?utf-8?B?UnhSYWRWYmMxbWZlbDFaYnVmeU5abkZSbGxSSkh2Y0YrOURUcEVKTmxYVlpa?=
 =?utf-8?B?WkYyOUY1YnMxemZoM09ZWjBwYjIxbWZoMDI5WmRDSlBIRGVRckRVc05PUHZD?=
 =?utf-8?B?SGJuMHF0Y2ZMRFRiRXRGMm1Gb0lGM0dTNC9VWlQvSDBwTUp0NmdNdFdmcHlY?=
 =?utf-8?B?bWJyWlcwUlg3WTdUN0NIRGZtN1M1T3hKcTMwWmZIL1Q2U2xyNGVuQk9JNVNB?=
 =?utf-8?B?TTRveTJMRzg0WDloQm52cHIzZ3V3OWRnUXJPTjhaakwyM1MvTDVCNHJJZHA2?=
 =?utf-8?B?OVBlTHFUbTlTdTM2QkZRVHNhb2RGeWw1V1pSUEwrNXc4V1NpZnZMQ0Vuc0JG?=
 =?utf-8?B?M1paMTVDdEd4TUR2N21sV3dFOG91cHBhTVFNVFRwU2M5cGtyZWxJZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8D58071C2C4A9945A5582100CE47B30A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF9623118BD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fa85d25-498c-4495-7af7-08de6869d535
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 06:01:29.0690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EX+hwzlV2EhInQyMY/g0t2lhC/O3zp7V3AvOz8Fqe+FUGvcrbfybkOrfEkG8I/nGd8UDV6oNQ5FRBKBtemaE1zmVrbNspmxthwsN+p45iaM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6270
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_220133_582964_7391913F 
X-CRM114-Status: GOOD (  14.53  )
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

T24gMDkvMDIvMjYgMzoyNiBwbSwgQ3lyaWxsZSBQaXRjaGVuIHdyb3RlOg0KPiBBZGQgc3VwcG9y
dCBmb3IgdGhlIEdGWDJEIEdQVS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEN5cmlsbGUgUGl0Y2hl
biA8Y3lyaWxsZS5waXRjaGVuQG1pY3JvY2hpcC5jb20+DQpSZXZpZXdlZC1ieTogTWFuaWthbmRh
biBNdXJhbGlkaGFyYW4gPG1hbmlrYW5kYW4ubUBtaWNyb2NoaXAuY29tPg0KPiAtLS0NCj4gICBh
cmNoL2FybS9ib290L2R0cy9taWNyb2NoaXAvc2FtOXg3LmR0c2kgfCA4ICsrKysrKysrDQo+ICAg
MSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gv
YXJtL2Jvb3QvZHRzL21pY3JvY2hpcC9zYW05eDcuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL21p
Y3JvY2hpcC9zYW05eDcuZHRzaQ0KPiBpbmRleCA0NmRhY2JiZDIwMWRkYjY4YTc0NTZkNmZlMWFm
YWZhNTlkYjkwZWM4Li40NGFkMDVhZjdmOTY5YzJjNmMxMzMxMGE4NWMwNzM3NTQ0MjM4OGU2IDEw
MDY0NA0KPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9taWNyb2NoaXAvc2FtOXg3LmR0c2kNCj4g
KysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvbWljcm9jaGlwL3NhbTl4Ny5kdHNpDQo+IEBAIC0yOTIs
NiArMjkyLDE0IEBAIEFUOTFfWERNQUNfRFRfUEVSSUQoMjYpKT4sDQo+ICAgCQkJc3RhdHVzID0g
ImRpc2FibGVkIjsNCj4gICAJCX07DQo+ICAgDQo+ICsJCWdwdTogZ3B1QGYwMDE4MDAwIHsNCj4g
KwkJCWNvbXBhdGlibGUgPSAibWljcm9jaGlwLHNhbTl4Ny1nZngyZCI7DQo+ICsJCQlyZWcgPSA8
MHhmMDAxODAwMCAweDEwMD47DQo+ICsJCQlpbnRlcnJ1cHRzID0gPDM2IElSUV9UWVBFX0xFVkVM
X0hJR0ggMD47DQo+ICsJCQljbG9ja3MgPSA8JnBtYyBQTUNfVFlQRV9QRVJJUEhFUkFMIDM2PjsN
Cj4gKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ICsJCX07DQo+ICsNCj4gICAJCWkyczogaTJz
QGYwMDFjMDAwIHsNCj4gICAJCQljb21wYXRpYmxlID0gIm1pY3JvY2hpcCxzYW05eDctaTJzbWNj
IiwgIm1pY3JvY2hpcCxzYW05eDYwLWkyc21jYyI7DQo+ICAgCQkJcmVnID0gPDB4ZjAwMWMwMDAg
MHgxMDA+Ow0KPiANCg0KLS0gDQpUaGFua3MgYW5kIFJlZ2FyZHMsDQpNYW5pa2FuZGFuIE0uDQoN
Cg==

