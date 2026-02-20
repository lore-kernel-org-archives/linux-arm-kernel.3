Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36962C54FD0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 08:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mN83pQl9CQdYsXIMsMuFQeZZ5lC6BZzAsrmBF4gxJiE=; b=hR445kztbrL3PwBN8K/DliK3SD
	6noKgBf3H7lRVsfO31iM3Iuhz3u1lK9OMLtB07hkk03AwUERD5sXiEDicMT0iNPZTr5k6ckEbJL2G
	NH0f9lZfSn7q4pls9euc/srlhM63brYlooRjkNaaL7hEaFSdGCZX5yf7+DFl5Uo1IdWjrLZY/7SsW
	oq95QP5ngznEplJ9LnedPG4jxU+/4HPaav51P5m5kE8w2N9xlLSrR0Mn4AtOWAMKoKgqv1obH6l3f
	LV/7bCREJCUdJ0kfa93rV/+KsMs5PMYsV0DmNSEXZZ5RBmQfaDuJg98jui2qlsgGAG2WgDNxbSdIK
	YfYgE+jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtLc6-0000000DONn-1PK5;
	Fri, 20 Feb 2026 08:11:50 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtLc2-0000000DONQ-3zOH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 08:11:48 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qtPAcVtzfRdZo7MN+57h2KT+lbjPVodwStLRXK9Wh6ZvLm6BjkHaQ25YNn4UOahegEt7Ur4+F9M0BWxuLYzg3LunYegjGZ+QRuyVRN8nVcjGbEiH4vrSVdewmUBduUj/+x95xX94OGFwkiSVtSKfvq1o8uElhst+ir9d6bcmpCkpoIGxUjVq525cFJg24DAGNittCfskUXuPwHYA9o7wHZNUQx5IeRfiK4vqoLYGlupxiL0IXKsY66Xh3oKUxs7H18QVFDpJJ+siZn2KZCXjp4oyxZRLQALudJhDMmaFPWfw0x/NGDqZdOQ8XsdGpxxxNPI5yiDuogcZJazPsAoREg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mN83pQl9CQdYsXIMsMuFQeZZ5lC6BZzAsrmBF4gxJiE=;
 b=N30m84C1SWZH2K2b7WZT7Zmm3HjHUnvcBoGD6S9rruf4gvM2X2Rroc1GKIhzecE1yVejO7tBBSwcCzkm+rn6nwGRmdpcDbeE++/+UlyaH6lysPmRD6wjqWbTvLkt0CApzZwygn/1qkyPIMNes10iA0po9iJZ0D0CAWehdqLFMGg6MhPEfpHc0sH6XN8f66SN/4H0pMD0Asy6buM7tUliI7jZkuXKr3c6M2+TlfyC9x+2oERutm+4QlnUQBcT8tVClKS70jncKCjFYJAVBdSP2uig3iJQ1aQ+R2HEJ5lAOT/qhk/5ehjKneSMCsD+jKbi56v5NEDGjCqqf2laEZylYA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mN83pQl9CQdYsXIMsMuFQeZZ5lC6BZzAsrmBF4gxJiE=;
 b=NGV1ZMZYut92byjKKjgeZI3UQKiYQ5490CUXZBZVbhYh8MvFgwuu/CJNz3i625+0AocQd1461VUQd/SSmUJysVcxzYcFaVZM/dnE1QkLwm4rJc2C9IoDsvAzzVimrpLoRfjKAy3i87RGpqSo8H7JOKPpeTAJtajkmjwdXbkreG4=
Received: from DB9PR06CA0006.eurprd06.prod.outlook.com (2603:10a6:10:1db::11)
 by AS4PR08MB7508.eurprd08.prod.outlook.com (2603:10a6:20b:4fa::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 08:11:40 +0000
Received: from DB5PEPF00014B99.eurprd02.prod.outlook.com
 (2603:10a6:10:1db:cafe::40) by DB9PR06CA0006.outlook.office365.com
 (2603:10a6:10:1db::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Fri,
 20 Feb 2026 08:11:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B99.mail.protection.outlook.com (10.167.8.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Fri, 20 Feb 2026 08:11:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tAAoCA924426N56sNqja2/hQtj7zBql5DuVfPgvggkVs3xjymBqNoKfsOi3OJO6ZD86eXY+/3A/0bMC9Lcqk9hGAPjkmszWYZ2/B9VEgGsIMWhIjbO57Agl9NeLM7GwDlGGXruxe8Ms37bNWQHmUFOa1FVMkNkocterG8IKvLpMK8iieVJXhxRETCNmmRxO0L8+n6rTsGgGLSBM6wa0MljS+jdCL9Df0W7jCD19LJWGzfftpH/7ctvNjYJMWOdDILxVZBb9LuXWKomZ8dNBCfLF8VUt6WSuphQpjaGLgLNh/S+ALV/iaz1FWfaKo7DtDQutRjWK4sYWDcnIf4Ns9Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mN83pQl9CQdYsXIMsMuFQeZZ5lC6BZzAsrmBF4gxJiE=;
 b=t2Ap7CdjljR709BslWCWxEtwUvlP+Lg3Y43MZb7M5XjrN2L5C0EgIhHKf7YBi5iuyekSiUCtQbIuuoTDKX9/MxLiLoaU234Uj77X7Eud4U4NQ53N2ct0IkvdZ8g7j0kpQ6uuFaAbal8YdSRWN5+eedcrwsTzYXjvv0bgzxuXQ7NQkrKOA0SiwWl92YD65YRTOIHccYikkojNv0uK3ovRq9GoqCQY7cVtjcT1RkJO/Z0mkWBrGl1JIgoutXUUMz36Rm8odEV3Qe4Fb1oJe6jEW1q1Zf/7epcYz7rG5z4jTbtAXI3fVWVbTsuPNINWKlC9RSj8wNqTTXdY91R+r5NGxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mN83pQl9CQdYsXIMsMuFQeZZ5lC6BZzAsrmBF4gxJiE=;
 b=NGV1ZMZYut92byjKKjgeZI3UQKiYQ5490CUXZBZVbhYh8MvFgwuu/CJNz3i625+0AocQd1461VUQd/SSmUJysVcxzYcFaVZM/dnE1QkLwm4rJc2C9IoDsvAzzVimrpLoRfjKAy3i87RGpqSo8H7JOKPpeTAJtajkmjwdXbkreG4=
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com (2603:10a6:102:31d::14)
 by GVXPR08MB10764.eurprd08.prod.outlook.com (2603:10a6:150:14f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Fri, 20 Feb
 2026 08:10:35 +0000
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e]) by PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e%5]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 08:10:34 +0000
From: Mike Leach <Mike.Leach@arm.com>
To: Leo Yan <Leo.Yan@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>, James
 Clark <james.clark@linaro.org>, Alexander Shishkin
	<alexander.shishkin@linux.intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
	Yingchao Deng <yingchao.deng@oss.qualcomm.com>, Jie Gan
	<jie.gan@oss.qualcomm.com>
CC: "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Leo Yan <Leo.Yan@arm.com>
Subject: RE: [PATCH 2/8] coresight: cti: Fix register reads
Thread-Topic: [PATCH 2/8] coresight: cti: Fix register reads
Thread-Index: AQHcme4lCESGR+u7Z0C1fxz3r2mVs7WLTJUw
Date: Fri, 20 Feb 2026 08:10:34 +0000
Message-ID: <PAVPR08MB9674109948BEC2997BCB4F548C68A@PAVPR08MB9674.eurprd08.prod.outlook.com>
References: <20260209-arm_coresight_cti_refactor_v1-v1-0-db71ab4d200b@arm.com>
 <20260209-arm_coresight_cti_refactor_v1-v1-2-db71ab4d200b@arm.com>
In-Reply-To: <20260209-arm_coresight_cti_refactor_v1-v1-2-db71ab4d200b@arm.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: PAVPR08MB9674:EE_|GVXPR08MB10764:EE_|DB5PEPF00014B99:EE_|AS4PR08MB7508:EE_
X-MS-Office365-Filtering-Correlation-Id: 2adcac51-d559-42aa-fbbe-08de7057acc2
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?c01lWGtwMndsdXpFMWtlYnNVa3V4cnlTYjZseXdiVFRMMDZDRG1CSDM3QUZq?=
 =?utf-8?B?MVdrZFNuVFA3NlNDOEJIemVNUHpOazdDTlF3eTA2cTRGeHBFSlR1emxXcUMx?=
 =?utf-8?B?NGQ2aXJsSTJrWGhDMTFSRFpjbW9ENHRuTDA4ZUFzTVdQd1ZOMG9pc21aamNn?=
 =?utf-8?B?RTR1cFBXV0tOY0Z6R2Vaa3RMa292eUNGUHhZTGhyWm1nbmEwTVQvNStuV0dv?=
 =?utf-8?B?Wk83RFF2WVErMzc3MFJqL2JoR2Y3S0xFc3VjVG1hVFJ5eWZOOWxzbDlDZGIr?=
 =?utf-8?B?Y3g2REhVNC9NZzJDZXE5emJWTDE5TEhYNHh6cFJOWndMbzAra2xhbE5vcVZo?=
 =?utf-8?B?MENSdERHamY0cElUemtKRGtKWTBmcnZGQWRmaHg3ZVVIRGRVZWsxTmpkVXhK?=
 =?utf-8?B?RmdRMUdHTlBkVjBJZTl2WE4zSHhYci8ybXQ1c1JlODM5bHhsc0RlSFRpU3Qr?=
 =?utf-8?B?ZmZROTVLQW84NmFlbUowdVFCNWZpOHlwUkQxY0haSUtpeU5jenZSR1dFVlMy?=
 =?utf-8?B?aWZGQ0J4N3dKMjhYUHc1TUVqM2NHc2hHZFpGWlpPTzUwSDg3SmNoemFJNG1u?=
 =?utf-8?B?b0pwVjhXUWdSY3JTVWdIcDNTQmpJajd2OGtBaHcvbElYWXhxWkpBdmoySkp5?=
 =?utf-8?B?dzZKTSt3K1o1L0lMU0NmK1JsNHVCUkl2U1ltdS9lYTlMTSs5bFBxQ1hybkdv?=
 =?utf-8?B?QTlabXJnMngxVHUxWHhTaHJOVnhJMEVCRjZURGVsN0l1QWJXbXg2VjZ6Rjlo?=
 =?utf-8?B?K0xZMVlyYWtoMzQyREQyZ3diQU1qdFB2TGtvakgvS3pFR1JSQWpXSDU0MVpT?=
 =?utf-8?B?MU1MRUtWNVUvdzRjUDNVVnlqZ2t0bjBOWkEveHRZeE1DMm1pQkI3UHBLT0xp?=
 =?utf-8?B?THZmWnBURitwN0RlOEJzcnVpOURPYncxbHpZVnlVVGdsa1dYdkNYaUxhdG5R?=
 =?utf-8?B?Q2twdWRvZXkzak5IVG1tcDd5aUp4TERvNUUyRFplYStHSC92dXdBQTQ3eWdP?=
 =?utf-8?B?bnN4Tm1UaXpVVm5YT2NWVm9ocGNWSVIyVFlGMExLd2NSYTB3REY1eW1VOGtR?=
 =?utf-8?B?T05namQrVi9BTlhMRjYwVXNIYXhsVWN4cVpIaUVtWGpKanNQeldsYWhHVTN1?=
 =?utf-8?B?MHRjRnJHNnhqcFVQTUZmWG9USWJQMzE4U1crR1dKMjZQNk9JWFQyK0RyT29T?=
 =?utf-8?B?Wnc5V0FEdnczWWtzYWxjUTcxUzgxRW1sWGFOL2ZyNFFnUGo4NjZrZ1IxQWt6?=
 =?utf-8?B?SnFTM3JjUkcxU3BqSXBzUkltN2JoTXRweHB4OGRRTXhVa3V2MFF6M1BlR1dJ?=
 =?utf-8?B?dWFFb1JkQ2RHcTRtWlEraVo1cUJQblhDcWhWeGZCTVM1elhBSS9wZ3lxQ3Zu?=
 =?utf-8?B?dUlzNG5JMUNNSkgvdW90UmpVQnc3cnZaSThHQXpTblVJdVNhV0RlMnRJY2F6?=
 =?utf-8?B?V1NVWWppdXN1cXFKSC94eWJzTUVEdm5CaDh5VitpclVEZ2Jid0oyOXk3VEZ6?=
 =?utf-8?B?YmM3RVprUUpLWHRHb2UxR3pDSGQzQUMxamFCM1RoTWJmSk5rWlhwVG5QTmZq?=
 =?utf-8?B?N1d1ZGI5NWdWSlRENWRoQklUN3IwTHhjSGwyWnZySkJhK01QcGE0cVNuYlFE?=
 =?utf-8?B?Z1ptYitFQWNqSzdxTzBTRHFNRHFDMkhKeGlIVi8zVFU0ZkxaL1NmcjJ5N29Z?=
 =?utf-8?B?cFdyZ1RlS0M2Qkdnd05GNnhFK1JJVkJ4Zk9GYjFrTGo3aHdSSDhLTXJudDRO?=
 =?utf-8?B?RW9oSVBpaHUyT0Q0VnJ5K3o0Qy9QMTZYc1ZFV05yVWhINXVsNXRINWZYdUpF?=
 =?utf-8?B?OTc4SGZ2RmFUdEpYSFNiOHo1djVuMU05WDkvWGw4aUFIZGRqQlYwV2hWYW1Q?=
 =?utf-8?B?cmlyUlVCSG5qRC94cTlScWRaNm45RUpvNXY3aWR5ZzdFa21MZU05OE1RR0NI?=
 =?utf-8?B?dlVIWlZZb05zVFdscmRFZEVSL2ZjZlg4UmpZY0o3ZnlJVXJpYmJuSTltUG04?=
 =?utf-8?B?NGhsNENwRlNOZlJlQy9OK21aTVdKazZqUUxvUk1Cc21iQThQZDNLbjRBMXlJ?=
 =?utf-8?B?bkVtb2FCTW1LVWUzZ2o5V0w4UktxS2F1UDVrajEycWo2cEdrZ3VtZDZuclRv?=
 =?utf-8?B?VTgvWWVaWlNpT0RYcjV1STlOaHRrM2NrWHJjaStBOWk0Z1piRGhvbWtxZldl?=
 =?utf-8?Q?5ZPaH020Jcc0UxqbvmaB2Po=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR08MB9674.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10764
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6aab219d-d8b3-49b0-0248-08de705785e3
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|14060799003|35042699022|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RUtRSkJnUCtRMit6NjhlRllia2RGeWFoMTd2anVycEFaREkzWjgwZU83SDlq?=
 =?utf-8?B?aWpsbHVYN3F4SmRyQ0JmeHloQVA4V0FoVGRrM0J0a05mN1V6REx6eVhIYkNo?=
 =?utf-8?B?NFUyQWtPeDJoRXFZMzhHbktyZTFpTHZiN3d4MDdJNU9QSGpkcGlpbkt0SlA3?=
 =?utf-8?B?WWIyNGJ3TkJrWUhGYjZnWjNIVFpVWGRydXNYUVp5dlRqSU9iOS9EdUVyZXVs?=
 =?utf-8?B?dU1ZZkhVeTk1MUZtMlhRTnVGM2grWHYydnhKYk1oUC9IWVdBczlqWUN1Lzcx?=
 =?utf-8?B?VmhGRy9jNm5OcTVMY0J2dlVjU0dNM25rWnk1KzdOOHp5Z3J1RXUzUjJJSU1K?=
 =?utf-8?B?cGtPK2NVMDB4aVdPcUtHTVVpOTIwRUYwUTFWWFFWMSt0MWp1SnlmMnA3MUJ0?=
 =?utf-8?B?cUM4WUF0U3p0YkRmQmpTdkV5ekMyZFNTVXhNbDRpS3Buc0lNcThlM3k1b1N0?=
 =?utf-8?B?VytXaHVBVC9OWGZ6Y3lwTE1mU1JaYkxTQ2NqVkZBRVkrdGRhV2pkeGMxaTdn?=
 =?utf-8?B?QytuOVRGL0hweFhsK2Y4b0R4L1N6cFpnb3RpR3M5MnNsQk5ta2lScm1obGFV?=
 =?utf-8?B?bVJDRXRCYlFWN2orZDBxZHU1aWVWWHBMeXh0RnZkcTBNM1JRQnNzUU4vM3h1?=
 =?utf-8?B?eVBMUlpHZ09iSzFNWXhKRURkRW03WXZVTzdaYkxGN05Nd05DN1RHMlJkaHcv?=
 =?utf-8?B?d2NiRVI0RFlvNGtqNFI5K2l6eDJFVm9lT0Z3NVFLaURBUEtTREp1NjkxWlMz?=
 =?utf-8?B?ckppaTJKRU42VUpOOTdHZDBIdlc5amFmdGpYUWtEOUxyZEUyK2MyNHNXSU9G?=
 =?utf-8?B?TU15YTVRQUZGOUNqL0RQZDF3dkY2NUlUeUFPcW8veWM4OTBXbTQza1JibmRB?=
 =?utf-8?B?Y1AySmxiR1k2c3J1SUl0R2RvVHFPR29yc2N0SHpkY1VFV3NMU1h6YmJ5Yk1z?=
 =?utf-8?B?UXVuUnlmdkFsZ2lKeHJsam02SVo1NlQ3QXBSU2ZYWnowT1RBclJOZzZVOGRU?=
 =?utf-8?B?Yjhhc2NKajBlelJzaDA4MXUvOGRXbEhVR0twZnUwczhubnQ2S0k0Z1l5Uy9W?=
 =?utf-8?B?MmNBcjZKbWNFTXdUWm1MbE15SnArYTJZb1V5aVRFcUJvb1lnOHl1ZEtqajNO?=
 =?utf-8?B?bFZRajZPUDhPamR0UlNrTkZxd2sxZGdPTHVoNmZhM1RFekczK2NpTTNtcHdH?=
 =?utf-8?B?a2xLOWZCRjdBVTBvYTVXbzUvOSthV3NXUlFjUWR6TUk0UTZPYWRORTN3R1lK?=
 =?utf-8?B?WVRPSXBOclc2T2NjTkZjUGJhM0k2WUZWT255azZoZzdPbFcxcjVlMDUwZkEy?=
 =?utf-8?B?TnBvZGp1UW9Yc3FRc2lpYi80c1h3K0F1dGJKdnloWGxORlNOTStEeEc5VW53?=
 =?utf-8?B?ZS85L0VGQjFwN1kveWpOeXhLSDNUM2p4VE1SeW5NQlZvSnRibWVmRnBlZEJU?=
 =?utf-8?B?Y0NDYUdLczdma3ZNRGxDL1NBTURZMTkyK2RjNmZLbUEvMldTL0lSWDlEaHVG?=
 =?utf-8?B?SmdFdlNKK1VHUkJ5VkxucnJFdDBaYnU2N2piREtUVTBhUHRoOFBET2FMY2t1?=
 =?utf-8?B?M0U3Vmlkb0pNbWVMZkNyUXVUS0FaWHBoNi9rMGdoSjdTU1RNVytUMzh4THpQ?=
 =?utf-8?B?YnFEOUZPNmc3NlBYSTJuVWsvcHN1WUtUbjZLbElVSzRkY1dlRktyV3lhWlor?=
 =?utf-8?B?UncwcENEUXpDMU1EaVhBTk05aCtJbW81OTRyMEpudVBNKy9RaXA0eXo0cVdz?=
 =?utf-8?B?Nm5meWhtdnFjTnNTYzJKM0FFVndJbzUxTEZPRytzTUhoMWZJMk9jQXlHSDY4?=
 =?utf-8?B?cC9nWnBSWHFYbzRubGtjL3FQc3lkQmVKV2oyZ01LNWJtN1pMaUVXc3JmU2Vz?=
 =?utf-8?B?SFdScHlpVnNpTXdLU2hjVnlXSENFNUhOWmF2RGhMbFpBYUxQRTJXMVNmWGRi?=
 =?utf-8?B?V3RpeGJvVERSNTVNb2QwSjF5bmlwck1aOE90UTkzdjVsMzlBWktXRXVIYmFC?=
 =?utf-8?B?cUJySllXQWJkSzJkNStZdVNVb0RhNnZtbFpBdG0wczMrckczbE5WN0E5VnhE?=
 =?utf-8?B?WVNWS1U4VXl3Sk1ReERFOEs4WGpuL1NRQkRISTNGaE5PeDAvOEliUmMvUGQ2?=
 =?utf-8?B?RTZTQ1JKMmFPYU0vVzZqVVVIRTM5Qmsya3QzNVA5ZDB5ZC9td1ljYUppQnZq?=
 =?utf-8?B?QlNXc3ZZbUxVc05iRm1EUUdrNjJ0NlgvZFhGSTRYYVBkMVYwVkZVS2l1OXhl?=
 =?utf-8?B?ZEptTTlKRUFBMys1S3AxTHY0NWhnPT0=?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(14060799003)(35042699022)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TMN/KkoJNDusdtS65/cPj5Xnihfqq/wsm+6ITQVxd3HoWBKkkQBCkBM+0kTNWG4ZVsley3NBxaUH7a9GbORruaShnu7n4ZA7u+b5BcH3AVDhHlDrdNjlJx0+5lr3zvQGfDHS3++pG8bR9YDi42hjxU04YUonzJKsysFaHhKYn4i7Zz0k6iSM2KpifsoPyUCkXN+v4eweRBc5JNSwRY16rU9X5tuTbCGxhiUU8lLV3KjfJhg7m1fMq62eYvpEVwxmjBtCrAJnB6yBmzyoEze+E2vssFVb0azzw2Uhl8EkaEObmgAjbBawyEPmAiAv555J+nXhAeA7ARjlmLomoYcM36yyx+0IpSKWGN+1Ht4aPkxdevQns5AXw2bnpCdkYP1wWaHit19O45whtGu/TuFmOWNlfkU3xMUg1LQoGfM8ylGkV+DBuOwPkIn70r16NS1I
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 08:11:39.4900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2adcac51-d559-42aa-fbbe-08de7057acc2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7508
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_001147_235863_8286FEDA 
X-CRM114-Status: UNSURE (   5.65  )
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
cmc7IExlbyBZYW4gPExlby5ZYW5AYXJtLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIDIvOF0gY29y
ZXNpZ2h0OiBjdGk6IEZpeCByZWdpc3RlciByZWFkcw0KPiANCj4gSW50cm9kdWNlIGN0aV9yZWFk
X3NpbmdsZV9yZWcoKSBhcyBhbiBpbnRlcmZhY2UgZm9yIHJlYWRpbmcgcmVnaXN0ZXJzDQo+IHdp
dGggdW5sb2NraW5nIHRoZSBDUyBsb2NrLiAgQ29uc29saWRhdGUgcmVnaXN0ZXIgcmVhZCBpbiBz
eXNmcw0KPiBpbnRlcmZhY2VzIHVzaW5nIHRoaXMgbmV3IGhlbHBlci4NCj4gDQo+IEZpeGVzOiBi
NTIxMzM3NmMyNDAgKCJjb3Jlc2lnaHQ6IGN0aTogQWRkIHN5c2ZzIGFjY2VzcyB0byBwcm9ncmFt
IGZ1bmN0aW9uDQo+IHJlZ2lzdGVycyIpDQo+IEZpeGVzOiAxYTU1NmNhNmNjMjQgKCJjb3Jlc2ln
aHQ6IGN0aTogQWRkIHN5c2ZzIGNvcmVzaWdodCBtZ210IHJlZ2lzdGVyDQo+IGFjY2VzcyIpDQo+
IFNpZ25lZC1vZmYtYnk6IExlbyBZYW4gPGxlby55YW5AYXJtLmNvbT4NCj4gLS0tDQo+ICBkcml2
ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWN0aS1jb3JlLmMgIHwgMTEgKysrKysr
KysrKysNCj4gIGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtY3RpLXN5c2Zz
LmMgfCAgNiArKy0tLS0NCj4gIGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQt
Y3RpLmggICAgICAgfCAgMSArDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9od3RyYWNpbmcvY29y
ZXNpZ2h0L2NvcmVzaWdodC1jdGktY29yZS5jDQo+IGIvZHJpdmVycy9od3RyYWNpbmcvY29yZXNp
Z2h0L2NvcmVzaWdodC1jdGktY29yZS5jDQo+IGluZGV4DQo+IGI3NWM0ZWMyYzhkNWQ1OGRhODc2
MTMzNDY0M2RiYTM0MDAxYjQ4YzcuLjJkOGIxY2JlNWJmNWM5Y2UwMzgzDQo+IGRjOTAzMzVmMDA4
NWIyMmE3ZjYxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29y
ZXNpZ2h0LWN0aS1jb3JlLmMNCj4gKysrIGIvZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2Nv
cmVzaWdodC1jdGktY29yZS5jDQo+IEBAIC0xNjUsNiArMTY1LDE3IEBAIHN0YXRpYyBpbnQgY3Rp
X2Rpc2FibGVfaHcoc3RydWN0IGN0aV9kcnZkYXRhDQo+ICpkcnZkYXRhKQ0KPiAgCXJldHVybiAw
Ow0KPiAgfQ0KPiANCj4gK3UzMiBjdGlfcmVhZF9zaW5nbGVfcmVnKHN0cnVjdCBjdGlfZHJ2ZGF0
YSAqZHJ2ZGF0YSwgaW50IG9mZnNldCkNCj4gK3sNCj4gKwlpbnQgdmFsOw0KPiArDQo+ICsJQ1Nf
VU5MT0NLKGRydmRhdGEtPmJhc2UpOw0KPiArCXZhbCA9IHJlYWRsX3JlbGF4ZWQoZHJ2ZGF0YS0+
YmFzZSArIG9mZnNldCk7DQo+ICsJQ1NfTE9DSyhkcnZkYXRhLT5iYXNlKTsNCj4gKw0KPiArCXJl
dHVybiB2YWw7DQo+ICt9DQo+ICsNCj4gIHZvaWQgY3RpX3dyaXRlX3NpbmdsZV9yZWcoc3RydWN0
IGN0aV9kcnZkYXRhICpkcnZkYXRhLCBpbnQgb2Zmc2V0LCB1MzIgdmFsdWUpDQo+ICB7DQo+ICAJ
Q1NfVU5MT0NLKGRydmRhdGEtPmJhc2UpOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9od3RyYWNp
bmcvY29yZXNpZ2h0L2NvcmVzaWdodC1jdGktc3lzZnMuYw0KPiBiL2RyaXZlcnMvaHd0cmFjaW5n
L2NvcmVzaWdodC9jb3Jlc2lnaHQtY3RpLXN5c2ZzLmMNCj4gaW5kZXgNCj4gNDU1ZDA4YmNjY2Q0
OWEzZjFlYWM4YWJkODI0NjgwNmVmNzNhOWFiNi4uOWE5OTdiMmYwOTA0NzI3NjFlOTczDQo+IDRm
ZmZjNTM0NjYzZGY4YjA2YzYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaHd0cmFjaW5nL2NvcmVz
aWdodC9jb3Jlc2lnaHQtY3RpLXN5c2ZzLmMNCj4gKysrIGIvZHJpdmVycy9od3RyYWNpbmcvY29y
ZXNpZ2h0L2NvcmVzaWdodC1jdGktc3lzZnMuYw0KPiBAQCAtMTgzLDcgKzE4Myw3IEBAIHN0YXRp
YyBzc2l6ZV90IGNvcmVzaWdodF9jdGlfcmVnX3Nob3coc3RydWN0IGRldmljZQ0KPiAqZGV2LA0K
PiANCj4gIAlzY29wZWRfZ3VhcmQocmF3X3NwaW5sb2NrX2lycXNhdmUsICZkcnZkYXRhLT5zcGlu
bG9jaykgew0KPiAgCQlpZiAoZHJ2ZGF0YS0+Y29uZmlnLmh3X3Bvd2VyZWQpDQo+IC0JCQl2YWwg
PSByZWFkbF9yZWxheGVkKGRydmRhdGEtPmJhc2UgKyBjdGlfYXR0ci0+b2ZmKTsNCj4gKwkJCXZh
bCA9IGN0aV9yZWFkX3NpbmdsZV9yZWcoZHJ2ZGF0YSwgY3RpX2F0dHItPm9mZik7DQo+ICAJfQ0K
PiANCj4gIAlwbV9ydW50aW1lX3B1dF9zeW5jKGRldi0+cGFyZW50KTsNCj4gQEAgLTI2OSwxMSAr
MjY5LDkgQEAgc3RhdGljIHNzaXplX3QgY3RpX3JlZzMyX3Nob3coc3RydWN0IGRldmljZSAqZGV2
LA0KPiBjaGFyICpidWYsDQo+IA0KPiAgCXNjb3BlZF9ndWFyZChyYXdfc3BpbmxvY2tfaXJxc2F2
ZSwgJmRydmRhdGEtPnNwaW5sb2NrKSB7DQo+ICAJCWlmICgocmVnX29mZnNldCA+PSAwKSAmJiBj
dGlfYWN0aXZlKGNvbmZpZykpIHsNCj4gLQkJCUNTX1VOTE9DSyhkcnZkYXRhLT5iYXNlKTsNCj4g
LQkJCXZhbCA9IHJlYWRsX3JlbGF4ZWQoZHJ2ZGF0YS0+YmFzZSArIHJlZ19vZmZzZXQpOw0KPiAr
CQkJdmFsID0gY3RpX3JlYWRfc2luZ2xlX3JlZyhkcnZkYXRhLCByZWdfb2Zmc2V0KTsNCj4gIAkJ
CWlmIChwY2FjaGVkX3ZhbCkNCj4gIAkJCQkqcGNhY2hlZF92YWwgPSB2YWw7DQo+IC0JCQlDU19M
T0NLKGRydmRhdGEtPmJhc2UpOw0KPiAgCQl9IGVsc2UgaWYgKHBjYWNoZWRfdmFsKSB7DQo+ICAJ
CQl2YWwgPSAqcGNhY2hlZF92YWw7DQo+ICAJCX0NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaHd0
cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtY3RpLmgNCj4gYi9kcml2ZXJzL2h3dHJhY2luZy9j
b3Jlc2lnaHQvY29yZXNpZ2h0LWN0aS5oDQo+IGluZGV4DQo+IDRmODkwOTFlZTkzZjVmYjA0NmQ5
M2I5N2E0MDg1MDUxZmNhNmIzOWQuLjY0ZjczMjRmMDk4ZThiNWY5MGM2NQ0KPiA1NGUzODcyZTNi
ZjAxOTg4NzE3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29y
ZXNpZ2h0LWN0aS5oDQo+ICsrKyBiL2RyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2ln
aHQtY3RpLmgNCj4gQEAgLTIyMiw2ICsyMjIsNyBAQCBpbnQgY3RpX2Rpc2FibGUoc3RydWN0IGNv
cmVzaWdodF9kZXZpY2UgKmNzZGV2LCBzdHJ1Y3QNCj4gY29yZXNpZ2h0X3BhdGggKnBhdGgpOw0K
PiAgdm9pZCBjdGlfd3JpdGVfYWxsX2h3X3JlZ3Moc3RydWN0IGN0aV9kcnZkYXRhICpkcnZkYXRh
KTsNCj4gIHZvaWQgY3RpX3dyaXRlX2ludGFjayhzdHJ1Y3QgZGV2aWNlICpkZXYsIHUzMiBhY2t2
YWwpOw0KPiAgdm9pZCBjdGlfd3JpdGVfc2luZ2xlX3JlZyhzdHJ1Y3QgY3RpX2RydmRhdGEgKmRy
dmRhdGEsIGludCBvZmZzZXQsIHUzMiB2YWx1ZSk7DQo+ICt1MzIgY3RpX3JlYWRfc2luZ2xlX3Jl
ZyhzdHJ1Y3QgY3RpX2RydmRhdGEgKmRydmRhdGEsIGludCBvZmZzZXQpOw0KPiAgaW50IGN0aV9j
aGFubmVsX3RyaWdfb3Aoc3RydWN0IGRldmljZSAqZGV2LCBlbnVtIGN0aV9jaGFuX29wIG9wLA0K
PiAgCQkJZW51bSBjdGlfdHJpZ19kaXIgZGlyZWN0aW9uLCB1MzIgY2hhbm5lbF9pZHgsDQo+ICAJ
CQl1MzIgdHJpZ2dlcl9pZHgpOw0KPiANCj4gLS0NCj4gMi4zNC4xDQoNClJldmlld2VkLWJ5OiBN
aWtlIExlYWNoIDxtaWtlLmxlYWNoQGFybS5jb20+DQo=

