Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175A9C55ABE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 13:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qZqiGa7qVgeL2kSVsEYCXtYjnBVK1WxyXoYgOXTMoDA=; b=pllVD2vJuCBEROvmfRsaiaB1+n
	+Kv8onYgGSoeYV1Fgr+jZVSWKm5H/ey5CPVlCVVKCGhS0lujoMujARDSkVubs5Cp79j5yoVFp8AUS
	Yirwaw/4SQqthQK09p/2B8Wutn1BWbtkvlePeIYlDbavcgsXuBQCUvMDBM8Zb+o/EtqoTYFABfYGd
	emE2wx91pmGwbUX9o7K9Ro5klodnzQvmguaKCXG/Nn7K3ti0X34ePbKmgr7P+sNJDKQzdSef9Ir+r
	CL0Qt/u3/TPF+qBlhvcIYGLCfuA7AilguiOCKshtpdglcyN2tJg4GgCJWAo2G1WvIotiI7mXexh90
	1WJGXP2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtQrz-0000000Eae4-3GSD;
	Fri, 20 Feb 2026 13:48:35 +0000
Received: from mail-northeuropeazon11011001.outbound.protection.outlook.com ([52.101.65.1] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtQrx-0000000EacW-2K7j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 13:48:34 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wL/ZX8ggQqGwX8kl81QeR4bHCo5sdJYmY1gXkLZoBmd+MKE7RfH5S8U++hKM+kLlGBqh4ZFyZVrb/bCzNpVsFWIb2GR9ZqU+YyivHKn+VPHTtBu5AmsJbYbGbXXaZ0+QwJDGyKLFMPXSIb6nR8v8PZ0DyMZwNDS+BkG7b3cFGT5zCjwIVQf8UBD3un3Bpa1BT+jJ9LL15ilBTMAZ/6WZKhVfUaydRxhJUxh2amwMi2sDg0YX2PpAJwWJoA7koJbqsryiBKe895uFZ3HiqMxhA3sZb3OZIgCFsk+80jN2SedR1XLdPxQvGDQNJwWU0bn3u5WsTFW1pek1VWSU7rT74Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZqiGa7qVgeL2kSVsEYCXtYjnBVK1WxyXoYgOXTMoDA=;
 b=UWPU+Y1fAGlDAnZ9ZpsPQXj919cNAX5uHljRiRzdwMo0jRMAudF5kmrN/6gZM2jaz6dMC2+V3PsrOOyoxVPbra8ULzZcitjbMSS4j4ePiuX0Jhm6fWFiNAqq+RWTQIsS5OQTYSRLPgV0YaYb3WX0e6rbAmfa/mRx7aHZzsM0IJt8UHQqGW22NLXq4E4fFRgSIphWy1mUfHLZjwBR5511pN4j76klY/Br009WZWxrlY+UBxNODPAbeRHUAv5vLXZAIsJOptpVw2p8DtPrmLIaJVAYkLNGA+6M3izPC2ZB0DCm54+lv8Cw+Cd0k9JTXpNWnIGq+EZRwOqRR5YRJ5QB7Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.linaro.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZqiGa7qVgeL2kSVsEYCXtYjnBVK1WxyXoYgOXTMoDA=;
 b=I7+koWT/02W12eDVcRf/gCzXq4WR2q6NWSmHgspk6CfXNTKMyFIQfFieApWSGenQd1npjSNvKpQdMS6YTf5wGTJIV/bJJalOgNWmUfJIJEA74NW9i+/Io/XFp6GcvUiubUVQGJf40EbbbGAFKgEs6qGW98s9p98STGhipvkZgls=
Received: from DUZPR01CA0217.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::11) by AS4PR08MB7407.eurprd08.prod.outlook.com
 (2603:10a6:20b:4e2::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Fri, 20 Feb
 2026 13:48:24 +0000
Received: from DU6PEPF00009523.eurprd02.prod.outlook.com
 (2603:10a6:10:4b4:cafe::37) by DUZPR01CA0217.outlook.office365.com
 (2603:10a6:10:4b4::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Fri,
 20 Feb 2026 13:48:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009523.mail.protection.outlook.com (10.167.8.4) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12 via
 Frontend Transport; Fri, 20 Feb 2026 13:48:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=asGtEKFmiWjwlfuqBYWY+4H20jLhVLUApca0IPdc+2+xJbhtAJDfeohNZp20mEohOUl9RMHdSJ5dBEGkXJAN4mR0bmFbeazuOZ+9qlR6UBDq9JLfKf6iBRzLHxUAKDfD3NSAYA2XQ3R8R/+u2Zygq3IVJcfNZzLyddsqIG9CLVGSA8AqSY2XHoJyW0p9KAIHBtH92JcRo2Mwf6LuynSZ8yeo8hSPL8b1gYPVTB+bUieLmKkHR0dNXGa1Kq24/Ys12DTly5CVCEwEJ1uSN5j8ca/UPno7J5wYsVkva38vKXmhvtSPJq03D/GJBrEt4AxM0szI36XaM1a7IWcgPVJr9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZqiGa7qVgeL2kSVsEYCXtYjnBVK1WxyXoYgOXTMoDA=;
 b=URk5I2fKoUjovQ0q5TKPZ7SsIK9DWkHsqZSHidh+ddvFc1IJNqi2OjHPXYjNiaRXjNO0vTKLnqYewTBwNVbyNlQmNVFrG8xxl48vUXGANtdVELWHy5x8mH03g8vzjpzWN1FlI5PBWiqWjuY1gtWDjPKl/L9EFt1aDHPDEWtr6ETVtrmsrsKiBc1sroXASmn+pIjPnZ0oj2zAroZ8l7rebejC/rVU4vA2pp0Wpi2DTx4EAgBm4LchowpMgg8FAlasn8xHUoaOlyfHRQMOXvdTVDdSFgNKczJEmQmONeG+b6NiYStPasSZKI+ruYJZzsQIY21n/aVJEqQkD6wHcQ8bEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZqiGa7qVgeL2kSVsEYCXtYjnBVK1WxyXoYgOXTMoDA=;
 b=I7+koWT/02W12eDVcRf/gCzXq4WR2q6NWSmHgspk6CfXNTKMyFIQfFieApWSGenQd1npjSNvKpQdMS6YTf5wGTJIV/bJJalOgNWmUfJIJEA74NW9i+/Io/XFp6GcvUiubUVQGJf40EbbbGAFKgEs6qGW98s9p98STGhipvkZgls=
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com (2603:10a6:102:31d::14)
 by DB8PR08MB5466.eurprd08.prod.outlook.com (2603:10a6:10:114::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 20 Feb
 2026 13:47:21 +0000
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e]) by PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e%5]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 13:47:21 +0000
From: Mike Leach <Mike.Leach@arm.com>
To: Leo Yan <Leo.Yan@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>
CC: "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Leo Yan <Leo.Yan@arm.com>, nd <nd@arm.com>,
	James Clark <james.clark@linaro.org>, Alexander Shishkin
	<alexander.shishkin@linux.intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
	Yingchao Deng <yingchao.deng@oss.qualcomm.com>, Jie Gan
	<jie.gan@oss.qualcomm.com>
Subject: RE: [PATCH 5/8] coresight: cti: Rename cti_active() to
 cti_is_active()
Thread-Topic: [PATCH 5/8] coresight: cti: Rename cti_active() to
 cti_is_active()
Thread-Index: AQHcme4mMdqmcJDGDUiHEG4nHlP6pbWLqrHg
Date: Fri, 20 Feb 2026 13:47:21 +0000
Message-ID: <PAVPR08MB967487AC0969ADCCB5BCF6208C68A@PAVPR08MB9674.eurprd08.prod.outlook.com>
References: <20260209-arm_coresight_cti_refactor_v1-v1-0-db71ab4d200b@arm.com>
 <20260209-arm_coresight_cti_refactor_v1-v1-5-db71ab4d200b@arm.com>
In-Reply-To: <20260209-arm_coresight_cti_refactor_v1-v1-5-db71ab4d200b@arm.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: PAVPR08MB9674:EE_|DB8PR08MB5466:EE_|DU6PEPF00009523:EE_|AS4PR08MB7407:EE_
X-MS-Office365-Filtering-Correlation-Id: 88dd81b2-e4e4-4249-8365-08de7086b7fe
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007|38070700021;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?MWMyVUwwQmJvdDNNRFVHNjJINW1ta3pDQmkrd0RTdjJZeGhZSTBIS0JCMk5M?=
 =?utf-8?B?eW9td3dKY0F2ZTdBVEZONzVNVmNaSE1aL0JTQTRtK3N3R1ZiQzRNdTJMdVpV?=
 =?utf-8?B?bVlIMDJ6WUd5UGNiRzB2cVo2Z095QkFMcFM2Q1lXZGpPSHM5bkdOV0VPbllv?=
 =?utf-8?B?WmY3eDBnc09kTWhMZFFFaDY2ODl4aEorWmNDamVKSnB6cCs2MXd4bjJqVTR0?=
 =?utf-8?B?UjNFOW8vSW1xNlJDM3ZSd0lZMEhWNVJEOVBqUHVMM3RsWmMrSUtnSWh3NmZC?=
 =?utf-8?B?dEVZV0VHcWZFbWdEczdUaGhhTWdiRWt0WmxNU2kya2FCVUVFZWdoeFU0T0Uw?=
 =?utf-8?B?T0dIWjBma000M3poVE05ZWlrejF4WWd5UU9TTHptRFVOa0crMjM5ZHhiM3BS?=
 =?utf-8?B?Ymh6QTB3d3F4VXk5K1o2azBwcjduU3lTVktLUHZBQVBnY0lqcWZyLzZtOTNX?=
 =?utf-8?B?OFoxZFd1Sm9QWExMOEhuS0cxQzhkd3BTbnNPQ010L0owZ0k4YkNxUFF0SzBU?=
 =?utf-8?B?cm10S2RDME5sdVh2RUd4UzI3RndNZlZ5UXlDMFZsdXhtcWtEbnpFL3k0WHVV?=
 =?utf-8?B?S0hsRTlWK0VNMVdpZnI5eitsb0RVWXpRYjBBTnh2V0tIZ0FXQ3k4QllyRkxX?=
 =?utf-8?B?QlVtcHFZQmVzbFZjTTlWSzNhL3NtaW1IemhsQkxscnpLTittNzRZSG9xUHdB?=
 =?utf-8?B?dzJCT3o4azc4Q2hEOEd6aEhFRzFCRUt5Wk9oRVZ3NFdDZWhlQ2tWck45dkZF?=
 =?utf-8?B?OWlVb2V2NlFXM3RQNWYwNHlsRGRGY3NIdW1KditBSlVlVTljUzFRblQ5V0tp?=
 =?utf-8?B?NUdUZWhBVTFnUnB1U2FqbU9tYUErUi8rZ1UyQ1B1dGNWWmM0cWhiL3BrbkRy?=
 =?utf-8?B?MWlKQ01OVmRDRUltQTdTd2NSVTA2ZHdIN1V2djZSbVNTRHNyc0txRGVzQ2xy?=
 =?utf-8?B?VmljTWc1TzdMR20zbXpxSzg1aE1hME9ML1VYZFJlWkV2YWlBOWpVRkFlWXBP?=
 =?utf-8?B?Z2lLdjlRMXloekhpQWR3clNhZy9TYm1pUGd0eUd5QnJ6d3pQVUMrbm1XbVdM?=
 =?utf-8?B?dTErajZDQ0loR1EzQ0F5QlR2VTlvczFlYkRqeXZFYW5DQ3lvQ1JJQmRzcTEx?=
 =?utf-8?B?L1Z0UVVnUFFNZVZrUmRDa1hHV3ovZFNtRGMzMjJtQ2NRa05HM1JQN0tvMGxy?=
 =?utf-8?B?RnhxdkpCRWJWczc2MlNWWXpHRFdiREJGRXFsbmlCWFYwWGdleHdYVXc0Ym5l?=
 =?utf-8?B?MDRKbWZ6UzZaU1R2SlN5ZGI5YlcwTm50d2l5djdaUCs0S0VGcWRjZURpVi83?=
 =?utf-8?B?bkwyVjExV1N6dEErVThST1dYYTRCQVJkckdtbWk2TTBGNjJuNTcrREh1aVNy?=
 =?utf-8?B?RWcvY3kwU0cyYmRiclh2MDBVUm0vdWNpOWNsQmZyTFhIZ3dTYVIveU5KNXBJ?=
 =?utf-8?B?bC9UWjRiemtrVWdvRW4ra0Y2YlE5RlF2TU9oM28zOUxLV2hTOUNuWmVub0tR?=
 =?utf-8?B?Mk14cVVpWFdBR0RHNnJNN2k4dmhJNkU0THdNa0w3RDFXU3g1U285cVVJK21i?=
 =?utf-8?B?MWlkVEhkL2dDRVBoTmtaOC93Wm4wWDk2bWJhYXJnSk4yNWtSK3JhaXNNc3NZ?=
 =?utf-8?B?UlBBQXNFYmNwN2Vvb0EzbG8rMmpQM0VydlkyVE9zYTMwYXhKOXZBeDl5Q0Fw?=
 =?utf-8?B?WUY1b2p6T3B0QWdYZU5rNjFFc09CeWZDRWVoNkplZFliam12UmVXQjlLRmNs?=
 =?utf-8?B?TkNDM0prQTlDZmZwMXovd1NsTDR1SDQxcUtWV2FtaWdFVWtjcDVadWdmN1Fk?=
 =?utf-8?B?TncyRFovSHBsTDcxZzQyTzRFU1RlQlJvckZVWXM0MUpEN0tSNkxVTTh0dUNS?=
 =?utf-8?B?RzJodElBWkZuenNYVytZZ0JOSlIzbWNMMXZjMXQrbS9SajNiOXJmcWNFRmhn?=
 =?utf-8?B?czhneFJnZTkzaVp1Q1pzUi9jRVJiOFJHQ0xGb3BTbEdmNWRQMU9QbVdNd3Zm?=
 =?utf-8?B?b00vSk4vT3QxeFlzcnRRVGF1bzF1Q2ZGUHkwN0pyRnR2WFp0K0pjMTRvK0I0?=
 =?utf-8?B?YXdmRUswbnNCVjdNMkhLT2ZKSkJ2WE5tNEhEWjZvaEY5TjZlTmRQS3BKSzh1?=
 =?utf-8?B?RWR3QkhxeTJDeVlrWFdQZ3VSUDBJaTRxcEgzT2JNQzRHUjNhbW1mNGR3MHZx?=
 =?utf-8?Q?WWCBJpIdmSr1A5mTuYoq7/Q=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR08MB9674.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5466
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF00009523.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 261dc705-e588-48a3-bf6a-08de7086921d
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|14060799003|35042699022|82310400026|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2FlSnk3L3B4UjlpNlVmdzZlblVCZG03MFh5OFd5NG9QU1lPa3dVYXdOeVMx?=
 =?utf-8?B?alkyWTI5NFkvNkEyV1NJaFJ1K2lTN3Y1SDJCVVRmOXlyR1hDc2pDOW14YUFP?=
 =?utf-8?B?eXAzVkF1bWx4cXdlZzdNSGlzSCtrQVFlMFB6QjZKOS85ZlhIc3ppZjQ3WURk?=
 =?utf-8?B?aVFMYTExYWVTVXE4dkpTTGVaZHY3RW9wOFVadS9zQnBvVkQ1amdHeEltYTY4?=
 =?utf-8?B?aUNzU1JVdjdpcEM2QzhvZ2RIMXkwWnRlMklGNGYvVXphcGdzOHk0Nk03OTEr?=
 =?utf-8?B?VW5NNWxoNmpCRi92OTV1NzNtNnpCNmpZcWNEY3pUS2JlWW5xcjhWUlRwemRl?=
 =?utf-8?B?MUZBODB3bFNRWXJ5YnluOVV5cTQ4T1huTW5HdHhzZm11OFJnT0VFaGpsYmFM?=
 =?utf-8?B?czRCOXZKNHJ2MjJrY3VsV2lmVVlFSnExdU4vOUpSM1hIN3pGWVRTQ3llWFp0?=
 =?utf-8?B?c213OFN5bjRQdjVGRWs1dlpISngxVFN5V3d1ckY1QjlGNlAvV0F2dGRESjk0?=
 =?utf-8?B?Tm5LYlBFOEx6TTA0aGovZ2JpcWwzR0FuWTYvSXZpWFliV3JEVWVyaS9IY1lh?=
 =?utf-8?B?YnpSRWVvTWZ4RUJSdDJpR0MzMkxvd2x4U1ZGRWNtY1hzcFAwOUxsU3F3VW01?=
 =?utf-8?B?bUdvNFlOVGdDSjRIME10ZGNlN2hUc2xCT0VYTjRsMkgzOUtVYlZtaXJUeUdr?=
 =?utf-8?B?akdWRjZ4K3BpWDN0RS9FbSs2dTl0blhSSXYrSWlIMmdsRVN5OHFCTDNHSG56?=
 =?utf-8?B?Nko5ZUVsSDAyeENZLzFtWkJ1alBPNUI4UUtQTUZoTkVwZFloMXZBUVh5c2Vx?=
 =?utf-8?B?aFlPNllMaDc5dDgwWUhHOHdIWEJidkdhenJuZ3h0RjNiaEVWWXhGOUZmenBZ?=
 =?utf-8?B?bzQ0bzhKcG55VklPOWU1VzRkL0s0aDhBTmVUcEY0dlVOUjlkVUJxUFlzMUp6?=
 =?utf-8?B?dmp1dWZlRjZzc2Q0QkJKL0kwdm5GYkNMNHEweXAwczlGWG0zZW1talFHRDJZ?=
 =?utf-8?B?eE1xVzhsK2JZVFE5cVJ0dWx5SmpkbmU3R2VLK1BwNStJNUtsT1BORlBvMGpG?=
 =?utf-8?B?SVgrRXh3TXlFM290dkROUktBUmh6dysxNkZ3V2ROZjhlSUFsWGdXRC9MTXdi?=
 =?utf-8?B?Ym9HdmV2bE42blFQOWkvRmpEOURheCtzMUlVTnhOVXpVYnljeGhNZG54OEFu?=
 =?utf-8?B?M0FFU3p3Qjd0R3ZNeXBOeERxVkVBdXFxSVpMdWM2Z0pvZmtVYXAvN1JoWUFW?=
 =?utf-8?B?R0xhVkFodk5oeThqbDJieFBqT003aEZFRUlUZk5GNlRmK2loZ0owWm5LZURh?=
 =?utf-8?B?YzIzUVp4VDh1Q2V5U1hCT3dDSWdHUkFpMWpIUitpU3d1MGY5bTNhUHRhTUZ1?=
 =?utf-8?B?YS9uNXFoYjhWTWpwcFk3bFM4bmY1Tkd5bTJWNGY5dTl4ZTgyUERvVld2Yllu?=
 =?utf-8?B?QStMcC9JVXNOT040YXpXUUFaR0VJSHlqSmVONnpWam9DTUtTdXNnR0pMNWJ1?=
 =?utf-8?B?RDl6SE5tYklXdllMamVwT3ozaEtTNWUyclFuOG1DZkxFMUFlUVF1UHh4Wjhw?=
 =?utf-8?B?elpxTk5zWEFPbHhjSXNDTi9sNCtBTm5iZmsrbTBQZ2hyWGppU1lFbUpRQU4y?=
 =?utf-8?B?SEEraHdabEdPbDZFbFJpNzZjaVlHSWdTNWhEV0tlRHVUV3FPN1hBeFJGTmFk?=
 =?utf-8?B?Ni9wamNXZy9GOXNZUytaYk8zaUIwU2lZejNsalpHZHJmRHRKTnBiZGozVkt2?=
 =?utf-8?B?RGo4UUhwamlReDFNVkkvMFdGR21RTGJCV1hSeUVuS2pTdjVOMUhHNGlmTUpI?=
 =?utf-8?B?YTZvaXIrUFduRGs5dVJuMW9hdDRFcTVCVzdUNHA4WmNKM2Foa1BLbEw3WVVi?=
 =?utf-8?B?K0k3Q3lQWFZxME96U1hkdEcrL0pDVmVDZ2orR1JwbVFzNnhVT2pJcitNTVJr?=
 =?utf-8?B?TFlwdDVoN0tVM1FtLzlIM2tHVUIxOFRRYzJtTUNueXM3bE5sVHdnRlRXcjB5?=
 =?utf-8?B?UkFrTWZvYllwTGZ0OFZ4cWhLWHVYZ1NqdlRNWkc2VXFuS3Bxak9JVnV4UDVC?=
 =?utf-8?B?NDFQdkdzRms4dnFmN25TTFlvQjEvYWpreTlBRW5RU2ROY2YxVlhGbDY4MDV4?=
 =?utf-8?B?WVptaVZ6SFdJYzliQitVRCtnRC96TmRDTFB0azF0bWxDcDNQNnRsaWZWVWNv?=
 =?utf-8?B?dnFrZ2tLcTFrbk1odVRsQXBWZ2pldkc2L0pLd1hEeDlNL2M1RzJjSDYxcEcy?=
 =?utf-8?B?YUJHb1lxSXEvYXE2ZjU5SE5EYzV3PT0=?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(35042699022)(82310400026)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: z/VABQy6ODaLLFTZ/9TiVSTRcVG9yvguYuxX5Ba+RHCU2vEy7cIdm6ToTB93iFW7pV6pfFbf+tKw0waNILDdwJtKjsvV7ZFfCviTpjAaLXTY2JAX7nQ5LOWq5+16RzmRa6Wfk0xLdZ4KFReFl16R1yu7gx0M1JdhuVKLxOCSYKIBjzhAOPPTipEHb1zOsCyJnZX2N4UVu7PDJVZBR30PXEgd25S8bnnBNzgGov9Aycz+vLnadqXEXtnMew2CGuUufpNKxXip8ZHsPc2vvOKdz9/jiIXDM5kO0QOhi6PydqeJfIBzxuzqCrU2Fipt6WCIifFdOSI4SPVLVC6xnWyH0UzaRvqfwqy1cfRadbdRSYaV9S3BVtT1QveD+m6vJxvwIueKhNB/0KU/334CE3qrmgdGPnyMFzwW/2D62tLoVmjeXXG6WeZSkqG3GAuFG65n
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 13:48:24.6891
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88dd81b2-e4e4-4249-8365-08de7086b7fe
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009523.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_054833_741004_16262DD1 
X-CRM114-Status: UNSURE (   5.91  )
X-CRM114-Notice: Please train this message.
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGVvIFlhbiA8bGVvLnlh
bkBhcm0uY29tPg0KPiBTZW50OiBNb25kYXksIEZlYnJ1YXJ5IDksIDIwMjYgNjowMSBQTQ0KPiBU
bzogU3V6dWtpIFBvdWxvc2UgPFN1enVraS5Qb3Vsb3NlQGFybS5jb20+OyBNaWtlIExlYWNoDQo+
IDxNaWtlLkxlYWNoQGFybS5jb20+OyBKYW1lcyBDbGFyayA8amFtZXMuY2xhcmtAbGluYXJvLm9y
Zz47IEFsZXhhbmRlcg0KPiBTaGlzaGtpbiA8YWxleGFuZGVyLnNoaXNoa2luQGxpbnV4LmludGVs
LmNvbT47IEdyZWcgS3JvYWgtSGFydG1hbg0KPiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+
OyBNYXRoaWV1IFBvaXJpZXINCj4gPG1hdGhpZXUucG9pcmllckBsaW5hcm8ub3JnPjsgVGluZ3dl
aSBaaGFuZyA8cXVpY190aW5nd2VpQHF1aWNpbmMuY29tPjsNCj4gWWluZ2NoYW8gRGVuZyA8eWlu
Z2NoYW8uZGVuZ0Bvc3MucXVhbGNvbW0uY29tPjsgSmllIEdhbg0KPiA8amllLmdhbkBvc3MucXVh
bGNvbW0uY29tPg0KPiBDYzogY29yZXNpZ2h0QGxpc3RzLmxpbmFyby5vcmc7IGxpbnV4LWFybS1r
ZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc7IExlbyBZYW4gPExlby5ZYW5AYXJtLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIDUvOF0gY29y
ZXNpZ2h0OiBjdGk6IFJlbmFtZSBjdGlfYWN0aXZlKCkgdG8gY3RpX2lzX2FjdGl2ZSgpDQo+IA0K
PiBSZW5hbWUgY3RpX2FjdGl2ZSgpIHRvIGN0aV9pc19hY3RpdmUoKSB0byBjbGFyaWZ5IHRoYXQg
aXQgY2hlY2tzIHdoZXRoZXINCj4gdGhlIENUSSBkZXZpY2UgaXMgYWN0aXZlLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogTGVvIFlhbiA8bGVvLnlhbkBhcm0uY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMv
aHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtY3RpLWNvcmUuYyAgfCAgOCArKysrLS0tLQ0K
PiAgZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1jdGktc3lzZnMuYyB8IDE0
ICsrKysrKystLS0tLS0tDQo+ICBkcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0
LWN0aS5oICAgICAgIHwgIDIgKy0NCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygr
KSwgMTIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9od3RyYWNpbmcv
Y29yZXNpZ2h0L2NvcmVzaWdodC1jdGktY29yZS5jDQo+IGIvZHJpdmVycy9od3RyYWNpbmcvY29y
ZXNpZ2h0L2NvcmVzaWdodC1jdGktY29yZS5jDQo+IGluZGV4DQo+IDNiZWNlZjYwN2U1ZWM1MjI1
Y2I2ZmQ2MTZkYTgwNDkwMzY1MWZkZjEuLjQ4ZGI4N2UyZmQwZjFhNjY5ZjJkMjANCj4gYTAwMTQx
MDhkYTIxNWUyNmZkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQv
Y29yZXNpZ2h0LWN0aS1jb3JlLmMNCj4gKysrIGIvZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0
L2NvcmVzaWdodC1jdGktY29yZS5jDQo+IEBAIC0xNjQsNyArMTY0LDcgQEAgdm9pZCBjdGlfd3Jp
dGVfaW50YWNrKHN0cnVjdCBkZXZpY2UgKmRldiwgdTMyIGFja3ZhbCkNCj4gIAlndWFyZChyYXdf
c3BpbmxvY2tfaXJxc2F2ZSkoJmRydmRhdGEtPnNwaW5sb2NrKTsNCj4gDQo+ICAJLyogd3JpdGUg
aWYgZW5hYmxlZCAqLw0KPiAtCWlmIChjdGlfYWN0aXZlKGNvbmZpZykpDQo+ICsJaWYgKGN0aV9p
c19hY3RpdmUoY29uZmlnKSkNCj4gIAkJY3RpX3dyaXRlX3NpbmdsZV9yZWcoZHJ2ZGF0YSwgQ1RJ
SU5UQUNLLCBhY2t2YWwpOw0KPiAgfQ0KPiANCj4gQEAgLTM1MSw3ICszNTEsNyBAQCBpbnQgY3Rp
X2NoYW5uZWxfdHJpZ19vcChzdHJ1Y3QgZGV2aWNlICpkZXYsIGVudW0NCj4gY3RpX2NoYW5fb3Ag
b3AsDQo+ICAJCWNvbmZpZy0+Y3Rpb3V0ZW5bdHJpZ2dlcl9pZHhdID0gcmVnX3ZhbHVlOw0KPiAN
Cj4gIAkvKiB3cml0ZSB0aHJvdWdoIGlmIGVuYWJsZWQgKi8NCj4gLQlpZiAoY3RpX2FjdGl2ZShj
b25maWcpKQ0KPiArCWlmIChjdGlfaXNfYWN0aXZlKGNvbmZpZykpDQo+ICAJCWN0aV93cml0ZV9z
aW5nbGVfcmVnKGRydmRhdGEsIHJlZ19vZmZzZXQsIHJlZ192YWx1ZSk7DQo+IA0KPiAgCXJldHVy
biAwOw0KPiBAQCAtMzg5LDcgKzM4OSw3IEBAIGludCBjdGlfY2hhbm5lbF9nYXRlX29wKHN0cnVj
dCBkZXZpY2UgKmRldiwgZW51bQ0KPiBjdGlfY2hhbl9nYXRlX29wIG9wLA0KPiAgCX0NCj4gIAlp
ZiAoZXJyID09IDApIHsNCj4gIAkJY29uZmlnLT5jdGlnYXRlID0gcmVnX3ZhbHVlOw0KPiAtCQlp
ZiAoY3RpX2FjdGl2ZShjb25maWcpKQ0KPiArCQlpZiAoY3RpX2lzX2FjdGl2ZShjb25maWcpKQ0K
PiAgCQkJY3RpX3dyaXRlX3NpbmdsZV9yZWcoZHJ2ZGF0YSwgQ1RJR0FURSwgcmVnX3ZhbHVlKTsN
Cj4gIAl9DQo+IA0KPiBAQCAtNDM4LDcgKzQzOCw3IEBAIGludCBjdGlfY2hhbm5lbF9zZXRvcChz
dHJ1Y3QgZGV2aWNlICpkZXYsIGVudW0NCj4gY3RpX2NoYW5fc2V0X29wIG9wLA0KPiAgCQlicmVh
azsNCj4gIAl9DQo+IA0KPiAtCWlmICgoZXJyID09IDApICYmIGN0aV9hY3RpdmUoY29uZmlnKSkN
Cj4gKwlpZiAoKGVyciA9PSAwKSAmJiBjdGlfaXNfYWN0aXZlKGNvbmZpZykpDQo+ICAJCWN0aV93
cml0ZV9zaW5nbGVfcmVnKGRydmRhdGEsIHJlZ19vZmZzZXQsIHJlZ192YWx1ZSk7DQo+IA0KPiAg
CXJldHVybiBlcnI7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQv
Y29yZXNpZ2h0LWN0aS1zeXNmcy5jDQo+IGIvZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2Nv
cmVzaWdodC1jdGktc3lzZnMuYw0KPiBpbmRleA0KPiBjMTVhNTgwZjZlOTBmNTdiMTM3NmUwYjg4
M2EyNzcwMDk2NmZlYjFhLi5hMjJjYzlhMmJlZTI0ZWI2MTE1ZTcNCj4gYWRiNjE4ODBjYzg2ZDAz
ZTEyZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdo
dC1jdGktc3lzZnMuYw0KPiArKysgYi9kcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNp
Z2h0LWN0aS1zeXNmcy5jDQo+IEBAIC0yNjgsNyArMjY4LDcgQEAgc3RhdGljIHNzaXplX3QgY3Rp
X3JlZzMyX3Nob3coc3RydWN0IGRldmljZSAqZGV2LCBjaGFyDQo+ICpidWYsDQo+ICAJc3RydWN0
IGN0aV9jb25maWcgKmNvbmZpZyA9ICZkcnZkYXRhLT5jb25maWc7DQo+IA0KPiAgCXNjb3BlZF9n
dWFyZChyYXdfc3BpbmxvY2tfaXJxc2F2ZSwgJmRydmRhdGEtPnNwaW5sb2NrKSB7DQo+IC0JCWlm
ICgocmVnX29mZnNldCA+PSAwKSAmJiBjdGlfYWN0aXZlKGNvbmZpZykpIHsNCj4gKwkJaWYgKChy
ZWdfb2Zmc2V0ID49IDApICYmIGN0aV9pc19hY3RpdmUoY29uZmlnKSkgew0KPiAgCQkJdmFsID0g
Y3RpX3JlYWRfc2luZ2xlX3JlZyhkcnZkYXRhLCByZWdfb2Zmc2V0KTsNCj4gIAkJCWlmIChwY2Fj
aGVkX3ZhbCkNCj4gIAkJCQkqcGNhY2hlZF92YWwgPSB2YWw7DQo+IEBAIC0zMDEsNyArMzAxLDcg
QEAgc3RhdGljIHNzaXplX3QgY3RpX3JlZzMyX3N0b3JlKHN0cnVjdCBkZXZpY2UgKmRldiwNCj4g
Y29uc3QgY2hhciAqYnVmLA0KPiAgCQkJKnBjYWNoZWRfdmFsID0gKHUzMil2YWw7DQo+IA0KPiAg
CQkvKiB3cml0ZSB0aHJvdWdoIGlmIG9mZnNldCBhbmQgZW5hYmxlZCAqLw0KPiAtCQlpZiAoKHJl
Z19vZmZzZXQgPj0gMCkgJiYgY3RpX2FjdGl2ZShjb25maWcpKQ0KPiArCQlpZiAoKHJlZ19vZmZz
ZXQgPj0gMCkgJiYgY3RpX2lzX2FjdGl2ZShjb25maWcpKQ0KPiAgCQkJY3RpX3dyaXRlX3Npbmds
ZV9yZWcoZHJ2ZGF0YSwgcmVnX29mZnNldCwgdmFsKTsNCj4gIAl9DQo+IA0KPiBAQCAtMzkzLDcg
KzM5Myw3IEBAIHN0YXRpYyBzc2l6ZV90IGluZW5fc3RvcmUoc3RydWN0IGRldmljZSAqZGV2LA0K
PiAgCWNvbmZpZy0+Y3RpaW5lbltpbmRleF0gPSB2YWw7DQo+IA0KPiAgCS8qIHdyaXRlIHRocm91
Z2ggaWYgZW5hYmxlZCAqLw0KPiAtCWlmIChjdGlfYWN0aXZlKGNvbmZpZykpDQo+ICsJaWYgKGN0
aV9pc19hY3RpdmUoY29uZmlnKSkNCj4gIAkJY3RpX3dyaXRlX3NpbmdsZV9yZWcoZHJ2ZGF0YSwg
Q1RJSU5FTihpbmRleCksIHZhbCk7DQo+IA0KPiAgCXJldHVybiBzaXplOw0KPiBAQCAtNDM0LDcg
KzQzNCw3IEBAIHN0YXRpYyBzc2l6ZV90IG91dGVuX3N0b3JlKHN0cnVjdCBkZXZpY2UgKmRldiwN
Cj4gIAljb25maWctPmN0aW91dGVuW2luZGV4XSA9IHZhbDsNCj4gDQo+ICAJLyogd3JpdGUgdGhy
b3VnaCBpZiBlbmFibGVkICovDQo+IC0JaWYgKGN0aV9hY3RpdmUoY29uZmlnKSkNCj4gKwlpZiAo
Y3RpX2lzX2FjdGl2ZShjb25maWcpKQ0KPiAgCQljdGlfd3JpdGVfc2luZ2xlX3JlZyhkcnZkYXRh
LCBDVElPVVRFTihpbmRleCksIHZhbCk7DQo+IA0KPiAgCXJldHVybiBzaXplOw0KPiBAQCAtNDc2
LDcgKzQ3Niw3IEBAIHN0YXRpYyBzc2l6ZV90IGFwcGNsZWFyX3N0b3JlKHN0cnVjdCBkZXZpY2Ug
KmRldiwNCj4gIAljb25maWctPmN0aWFwcHNldCAmPSB+dmFsOw0KPiANCj4gIAkvKiB3cml0ZSB0
aHJvdWdoIGlmIGVuYWJsZWQgKi8NCj4gLQlpZiAoY3RpX2FjdGl2ZShjb25maWcpKQ0KPiArCWlm
IChjdGlfaXNfYWN0aXZlKGNvbmZpZykpDQo+ICAJCWN0aV93cml0ZV9zaW5nbGVfcmVnKGRydmRh
dGEsIENUSUFQUENMRUFSLCB2YWwpOw0KPiANCj4gIAlyZXR1cm4gc2l6ZTsNCj4gQEAgLTQ5Nyw3
ICs0OTcsNyBAQCBzdGF0aWMgc3NpemVfdCBhcHBwdWxzZV9zdG9yZShzdHJ1Y3QgZGV2aWNlICpk
ZXYsDQo+ICAJZ3VhcmQocmF3X3NwaW5sb2NrX2lycXNhdmUpKCZkcnZkYXRhLT5zcGlubG9jayk7
DQo+IA0KPiAgCS8qIHdyaXRlIHRocm91Z2ggaWYgZW5hYmxlZCAqLw0KPiAtCWlmIChjdGlfYWN0
aXZlKGNvbmZpZykpDQo+ICsJaWYgKGN0aV9pc19hY3RpdmUoY29uZmlnKSkNCj4gIAkJY3RpX3dy
aXRlX3NpbmdsZV9yZWcoZHJ2ZGF0YSwgQ1RJQVBQUFVMU0UsIHZhbCk7DQo+IA0KPiAgCXJldHVy
biBzaXplOw0KPiBAQCAtNzYzLDcgKzc2Myw3IEBAIHN0YXRpYyBzc2l6ZV90IGNoYW5feHRyaWdz
X3Jlc2V0X3N0b3JlKHN0cnVjdCBkZXZpY2UNCj4gKmRldiwNCj4gIAljb25maWctPnh0cmlnX3Jj
aGFuX3NlbCA9IDA7DQo+IA0KPiAgCS8qIGlmIGVuYWJsZWQgdGhlbiB3cml0ZSB0aHJvdWdoICov
DQo+IC0JaWYgKGN0aV9hY3RpdmUoY29uZmlnKSkNCj4gKwlpZiAoY3RpX2lzX2FjdGl2ZShjb25m
aWcpKQ0KPiAgCQljdGlfd3JpdGVfYWxsX2h3X3JlZ3MoZHJ2ZGF0YSk7DQo+IA0KPiAgCXJldHVy
biBzaXplOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVz
aWdodC1jdGkuaA0KPiBiL2RyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtY3Rp
LmgNCj4gaW5kZXgNCj4gN2EzZTdmODA2ZGNiMDkzZTUwNGYxYWFjYjNiMjk1NjRiZWEyOGY2Yy4u
NDAwYzE1NDViMjJiZmU2MzExNDRkDQo+IDI0ZmFjZWIzNTRmZjJkNDkxNjYgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtY3RpLmgNCj4gKysrIGIv
ZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1jdGkuaA0KPiBAQCAtMjM4LDcg
KzIzOCw3IEBAIGNvcmVzaWdodF9jdGlfZ2V0X3BsYXRmb3JtX2RhdGEoc3RydWN0IGRldmljZSAq
ZGV2KTsNCj4gIGNvbnN0IGNoYXIgKmN0aV9wbGF0X2dldF9ub2RlX25hbWUoc3RydWN0IGZ3bm9k
ZV9oYW5kbGUgKmZ3bm9kZSk7DQo+IA0KPiAgLyogY3RpIHBvd2VyZWQgYW5kIGVuYWJsZWQgKi8N
Cj4gLXN0YXRpYyBpbmxpbmUgYm9vbCBjdGlfYWN0aXZlKHN0cnVjdCBjdGlfY29uZmlnICpjZmcp
DQo+ICtzdGF0aWMgaW5saW5lIGJvb2wgY3RpX2lzX2FjdGl2ZShzdHJ1Y3QgY3RpX2NvbmZpZyAq
Y2ZnKQ0KPiAgew0KPiAgCXJldHVybiBjZmctPmh3X3Bvd2VyZWQgJiYgY2ZnLT5od19lbmFibGVk
Ow0KPiAgfQ0KPiANCj4gLS0NCj4gMi4zNC4xDQoNClJldmlld2VkLWJ5OiBNaWtlIExlYWNoIDxt
aWtlLmxlYWNoQGFybS5jb20+DQoNCg==

