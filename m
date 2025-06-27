Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93689C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 09:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kpK8yuZHKjtCxCrdJ3XTd6XKEM10WD427omoS6GE84g=; b=h8Bvo0VE1bksK+rcq7yZf4ITfj
	7Jwu54L5lWUYAvNvsCb9cPKb7qcfUkd//pW7IGCaSzxT6NVJNc3aAJxOm+imp5DkK5xreHh0L8L8T
	vjxT8dlEKbiEY9SNYjFACeEJTqUY3osLE0FqEWaaXZCJezVgeGMFRNqGIIg/v2dEY+vbvwWV+S9fN
	fDlmUmy5EUs14rUM1RDBL2p+IA+dHyRTQJ6bLt4PwbCQ4Yy60wxyueBbHO5RI0ijJttiNb82xtJJX
	xRJ0bZ2o88PdTXxDJ9s3tB5dFqS2x3fRP9jWQNdJeF+G0tcmp3b8PO186jMOgG74QP2sQVg3d/n/b
	BIEXtrOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV5ou-0000000EBBE-4BS7;
	Fri, 27 Jun 2025 09:56:33 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV5io-0000000EANo-1BWi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 09:50:16 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BbAjnpINRwnHFujJzmlcGvKbx3A0R1YNugcs/3FvmSNJHhhZMjlaDXj33EwNWwkAaK74SLrHO2rAO+RA90NvH4Zl4qnfCCwj89eR24sTRJqM33CmnDB6Jq/bl5RBBpI2BBVvFJyh754uynMP4UgIN5BYhuwSAF/SBYNvALhQM6EQYs0nclRH3NVOjCFZUsNWbfKu+OgvH/vTLxUettcnKftyoeTsyypXIBD2oAwCSYJ4sTWJb3F71qP4x558Pwse3TyBghZJjdIwyXWqTD38jpyLQk2rTfYGktBjqcm2ZvwaToygndOMZZ42GqPlRaZj6dDBJGmbHAARhfwv1dHyLg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kpK8yuZHKjtCxCrdJ3XTd6XKEM10WD427omoS6GE84g=;
 b=Fllx33v+Dpb73WRNhDSuDw+VfHjm2/z4UaseIMHfElLQM5R7PGJXl8bQe82RGq6wiaCNBFq8HT/VYWGlq/4vyi1iCcdqqNXmZoT9f7X4vQK/DhvsG6JHS9HF8ZLXRoPsM647a7m1aIfgh5u/YZzpOlb6EfmXzAKK1Z91QSNjrNoQd3kmsVyZoaCJPXGKBKzuD5yOvYKX/593WLpmsRJgnuT/gDtdYID36q4cMqRUufNyGPobPz7IuYC4+eyU5WZwp+E+d7jRIHs69A8Z4lkaVOcpige2cO3unP4o8CCSpDkgAFeAymf0aNsbF1AeapCdXQ5plGi7L8+A9phW6uAZJA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kpK8yuZHKjtCxCrdJ3XTd6XKEM10WD427omoS6GE84g=;
 b=qhm+brqDIbdgdkg2kqebIMcIh8UDf3CPk+yyNc2sS5ptHsP0WetGjGsi9IotpkrXwkpzkKIF5X6VTvcShTu3lPr6Lj5FyCiuiLQDatW9qZxoIzoBH84y1CqhS8zEmdHb6Te4EjTvyOHWRbIPQb0gAecswChbmXA+/Fws7xv+jJI=
Received: from AM0PR06CA0076.eurprd06.prod.outlook.com (2603:10a6:208:fa::17)
 by AS8PR08MB6277.eurprd08.prod.outlook.com (2603:10a6:20b:23d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 27 Jun
 2025 09:50:05 +0000
Received: from AMS0EPF0000019C.eurprd05.prod.outlook.com
 (2603:10a6:208:fa:cafe::1d) by AM0PR06CA0076.outlook.office365.com
 (2603:10a6:208:fa::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.18 via Frontend Transport; Fri,
 27 Jun 2025 09:50:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019C.mail.protection.outlook.com (10.167.16.248) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Fri, 27 Jun 2025 09:50:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IrzQE7PJpmnh1ftl2iQ/Vq7V2qOuy8ZRhY1qVH8CovoTMlenWNCKzULay+AhdOAVu5nBrKvSgu9TfpDgtIrKShh+LfQLBFSNEM7sviOhFHj9zN08+p/SSamowrwmtA8lU03YXnd8+aWGWEGYo5CCcMcO0qjpF+7m4gaGrNnpjFP1v92WrBRKzJH2Toab0m/13gbXDcorvyijPvlf9B3fgBVOYObXsKFL3XVV5FrP/ayeUhgnSrF3h+voBFUvkRt+vX7QMppKEzN4KylqSTVkOSEZnBVG43ZdlIBRBcaGfTx+W+Ja6IYCSugeBgdC5FdhDQcDfFJfKzGirSwcAWtBIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kpK8yuZHKjtCxCrdJ3XTd6XKEM10WD427omoS6GE84g=;
 b=CAiuoESuNY45GClSCBcMmzBfdh2nM6/hQQ/vQXyTRkiNXgGXGwyZa0StkAJCnKszo2IA14bV7iseiis6AUMeUXmIoMQeL915eweUnB5T415A6BBm73k6jbHiEjDFIFrlhHXUjoyGlJxxOyJRLRtUJ49LGuv1UGERhvL9fzF1z6ySqyKZ5Kw5/rm612FTtiytzH0WcS14NDxMK2l/l1Eec0yXQ7D0I/neWbYeNdbtWIF2z9/j8rCBNwy2YVxdelnft0iaowkqj7J9upwbjBEgyo5aScrCfRAsoL+ui5aF+ltQHfgk05mbtds58xsft6KrD3IxHv2NKVhIOa1mLNfH+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kpK8yuZHKjtCxCrdJ3XTd6XKEM10WD427omoS6GE84g=;
 b=qhm+brqDIbdgdkg2kqebIMcIh8UDf3CPk+yyNc2sS5ptHsP0WetGjGsi9IotpkrXwkpzkKIF5X6VTvcShTu3lPr6Lj5FyCiuiLQDatW9qZxoIzoBH84y1CqhS8zEmdHb6Te4EjTvyOHWRbIPQb0gAecswChbmXA+/Fws7xv+jJI=
Received: from DU2PR08MB10202.eurprd08.prod.outlook.com (2603:10a6:10:46e::5)
 by GVXPR08MB10520.eurprd08.prod.outlook.com (2603:10a6:150:155::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Fri, 27 Jun
 2025 09:49:32 +0000
Received: from DU2PR08MB10202.eurprd08.prod.outlook.com
 ([fe80::871d:8cc1:8a32:2d31]) by DU2PR08MB10202.eurprd08.prod.outlook.com
 ([fe80::871d:8cc1:8a32:2d31%3]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 09:49:31 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "lpieralisi@kernel.org" <lpieralisi@kernel.org>
CC: "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "tglx@linutronix.de"
	<tglx@linutronix.de>, Timothy Hayes <Timothy.Hayes@arm.com>, nd <nd@arm.com>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvm@vger.kernel.org"
	<kvm@vger.kernel.org>, Joey Gouly <Joey.Gouly@arm.com>, "maz@kernel.org"
	<maz@kernel.org>, Suzuki Poulose <Suzuki.Poulose@arm.com>, "will@kernel.org"
	<will@kernel.org>
Subject: Re: [PATCH 1/5] irqchip/gic-v5: Skip deactivate for forwarded PPI
 interrupts
Thread-Topic: [PATCH 1/5] irqchip/gic-v5: Skip deactivate for forwarded PPI
 interrupts
Thread-Index: AQHb4f14VUlvORHulEmA538kHw8XQ7QQ4OUAgAXsr4A=
Date: Fri, 27 Jun 2025 09:49:31 +0000
Message-ID: <99c4946f2857e165d74d498476be75db21ff4cee.camel@arm.com>
References: <20250620160741.3513940-1-sascha.bischoff@arm.com>
	 <20250620160741.3513940-2-sascha.bischoff@arm.com>
	 <aFlw4lOj8tUGrSTb@lpieralisi>
In-Reply-To: <aFlw4lOj8tUGrSTb@lpieralisi>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: DU2PR08MB10202:EE_|GVXPR08MB10520:EE_|AMS0EPF0000019C:EE_|AS8PR08MB6277:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bbef6fa-328b-48e1-9a21-08ddb55ffdf5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?WGdIc29rWWJBTEM0aWJnTXFZNzZqTmZia0xsRFAvVWtnT0JnUkI0SW4xcEs3?=
 =?utf-8?B?bUtkejBwYTk5ekF2ckR6dzVVeFJjUlNZVjRTNDNjQ250bklnUHQzVmVtM1Js?=
 =?utf-8?B?eDcyU0FXc0pLMmJtK1c4SnZaQXR4cFhsSXBMelJUWmZYTE5rSUZjSWZsRmlL?=
 =?utf-8?B?c2U4eSsrWm9OVGk5bmtpcjArTmpJbHh3YVZKdDY2blVNcmJ2UXY2dmZVekpu?=
 =?utf-8?B?U09QU0VPYUlyekZMWUJydk8vZk8rR2xJRy8xTE5tT2xDRkN6NUJveWJWQ2Ir?=
 =?utf-8?B?bkM4ZGk2eUYrbzBkNVdqNlhnYnRnZVpXT1NNemUxOGtkbDVUN0wzWU9kVHJI?=
 =?utf-8?B?Y2pKK2U0Wit1Q0NidHJPMFZnMklNWkJYZVVOQzVKWnpXOFVDQnFzZVdsWVRM?=
 =?utf-8?B?NUxCTjQ4YzN3SmVpeVUzZzJMck5ZSTdvSFlndUdYVmNoNkk5Q0V4YTJhVFpk?=
 =?utf-8?B?emFOZFJRREtCY1RwQW1zYmRCQWUzTHVuQ2FLWVduVFhDMUttOHBSZTJkaVBO?=
 =?utf-8?B?WVZ3NkR2VFBCQnhTZnBmZ2lVK3pGekZUdWpHN3BJSWNCNERza2lqZ25pT0pq?=
 =?utf-8?B?RFNobzAyUDVRR3VRcGd6NzJQaGg5WUFlRnlMSkNCRUlBZGtNNjg1WjdqVEJL?=
 =?utf-8?B?bXF6SUMrejBsSzczeDZ5NnFIWDhJc2dQTGlWMEgrM2paMHZUUC9KSHkzdy9v?=
 =?utf-8?B?bGhKY2FZWWtVdFI3Z2xpWmRONyt3MTNLV3NtNEVTZUowM1l0NHpuaDFjandt?=
 =?utf-8?B?KzZJZHpoaHFLVzl2WlZqMzhOVTZoc25VMEtFNXJHWWRsL1UwR1hyemluMUVL?=
 =?utf-8?B?TzdWTW5nVWdncW00a3IydlUrS1dVSTRubjBRZjVKNWhhTFJaUStyMGIwV0wv?=
 =?utf-8?B?NWZOMVJWV1FlaVBxai9WWWQ5dUJGQkYxWnhhZHhWNXpHWlFMdmlWZ2NIenQr?=
 =?utf-8?B?RzBnQ2I3V0xBTDRTYVVUMmdnemU0eVk5N3dYa3BBVm9NSFEyOUdrN1NtdmFp?=
 =?utf-8?B?d0RQVTh5YUxKSW96K3dTM1ZHemU4Wk1LTjVReTg5aytkL1EvOGlEcnZvLzVa?=
 =?utf-8?B?TStrWUIzaDl5c2k2QUFXeSs3MFd5Z0NQczhoZVNwc2pSTGNub3hWM2YxcmdP?=
 =?utf-8?B?SUgxZDVVVXF3NTJSNkxQQklnM1FOME1ZejZ3enE5MUVQd21HQWw2M2QyTkND?=
 =?utf-8?B?V1JBalVqbXBOSktpdTlETWJ2aHdiVEN2TS82d0ZZeld5YVhxejlNbEV6TkxQ?=
 =?utf-8?B?aTk4RXJqYXMrNDJrTTJlUTJlWFErU1k4TVJjb0cvWk1BQ2s3eW9oZFl2NVBZ?=
 =?utf-8?B?KzlCcVhjc2V3WmNaaFBXWTRJQ1R5azZZeTd6aHE4TVJIVWpkd1p1N1B6YTU4?=
 =?utf-8?B?MGhmOGNuZjludzRTOXkrdlJsYUN1Vk5UeDlKUTJ4QVRuRW1qRXcvWFcwamhU?=
 =?utf-8?B?RGQ0cU9xTVYvWFh4WG5iMlJ6YlY2N29TWVRoUWNUay9BZTNZbmtueHkzZTl1?=
 =?utf-8?B?dFFHaXB6UlV4R1MxN3UyMU1sUWJrTXhVbXN5c0dobTN6R3lGd254a24xajdZ?=
 =?utf-8?B?enNsVWRmRUNWM0FRb2R6SGMvM1BIRHcxS0lFYnBXVFYrRzdNNGloaXV3WGZ3?=
 =?utf-8?B?S1Z2STIvRTR6ZGpxeUVjWU5Iak8zUnVINXJRc2tGR2F6aWNuaUZFL09YcERh?=
 =?utf-8?B?blBZb2FTRGNtdE9iOHZPd3RtRy8wVm1YbFZSNW5iNElEYzZGL2ZkUzhJN3Ur?=
 =?utf-8?B?Y09FSWhaNXBick5qNldoTER5KzBKQmZRcExSMVZxTUc4YXFZMklYdGhLRks5?=
 =?utf-8?B?UFp4QTF3TUN6ZkZDc2JFVHF3RXZwbWRCZklxbTNGdnVjSDh1S1BGUDROaU15?=
 =?utf-8?B?NzZ2c295TEZ5dXNyc2NJS1VvUXV3NVlIUmJzTFYrREJWbkVueitVZ096ZWg0?=
 =?utf-8?B?YjIvcUtYTTVFRmJ4MlBrQlF6a2hhUHloZlNvN0UyNlFBTFd0bVloY05RaWsv?=
 =?utf-8?B?aWlya0hmNDhnPT0=?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10202.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8FDE4B6B06CF6F48AFD1A07270048716@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10520
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF0000019C.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7862515b-3004-42fc-eadc-08ddb55fea9e
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|35042699022|376014|14060799003|36860700013|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?LzJqRzBNNGNiREF1OFRYS0FVbDN0bWlTcGpPd29vUWFKZmRwVGswQmY4dlMx?=
 =?utf-8?B?VHcvNG5UQ2Y2MlhDWE5zRzVSZ1gzdkNKRStEM2ZjSzRIMU9FZDFlbTZUVTYz?=
 =?utf-8?B?TTZQb2Fidy9lTjZsdy9kUGhmeFFYRWhTZ2VLTnZweUNxMitaOVVybFdnaXBU?=
 =?utf-8?B?ZjMzc3lNdWI3azdhN0k5cUZSSWhwOTVOY1c0Nkx5UW1BVEtFOWpUY2NNZEF2?=
 =?utf-8?B?ZjF1bVhFTjdod2Rzd2FucG5pWStpWk11OVJrM0U4U1NTRG5CNkpsaGRlQnFh?=
 =?utf-8?B?blVIOE4rU1ZPcWdKSTVzT29TTjRtUU9tbTJHbDZKU2pnOUFBSC80MTJGUElK?=
 =?utf-8?B?KzZWN0ZNUURTck5zTmxuM29VSzhrdjVaZkUrUmFRalpnVnB3WHAxOElWeGhz?=
 =?utf-8?B?SHYwdWdVRHVDZGlYVUladzhjWVMvZ0pqaTE1YXJrYXJqeUpOb09mcTVWK1Ix?=
 =?utf-8?B?S1BrUTNKb1M1OFlwSHhMczYwd0Jhd1FDa2FRTVBaRHhwdDRZdjZ3SFJHVmtq?=
 =?utf-8?B?OE1wNmhlWEJPTUtjc2o3VEZUZnVnOVhCaEpFV3NnVlc4VENhZWRiM2txQlN6?=
 =?utf-8?B?SUUrQ2JFVVpLekZxU2p1M3grSEQxUTVZS3A3MWdVMHJSOEd5cjFSYzFYSXgr?=
 =?utf-8?B?M3JxMVNjNnBOK2daSUNjSDBBZjZTTlVWeEdBY3MvZGNuM0tDbWRmdlVobi9o?=
 =?utf-8?B?RDRQdi9DWDJFeFpFSmlKcmd0MVB5aWdPK05QRFp3VnViR0JGcmFhYmRyVC9n?=
 =?utf-8?B?NTBVNnZTNmpDM1ZCNjEraC9iMzkyeXZkclFBNXhScXIrVWFjeTRVWGpoZmww?=
 =?utf-8?B?NmFNYXdZWUlTckVHd0I1OW91ZnFmVEtKUXVaMGtrSHZzV0JlRmNjSmhndkZY?=
 =?utf-8?B?UlRCT3FxQlhMMHdpdXpLYW0wclpmZHFNV0tZVVQ2aERIanhXY1dwM2R4ZGEv?=
 =?utf-8?B?b3F6WTVGT0VydEJyc0V0VVhpSUR3Q24rNnV2d09vdmxVSjhHanBYTzVZbHpJ?=
 =?utf-8?B?UWNmUWFUUHl4bW9Nbys4MXNJaFVVdWhWMzUwWS9XRjVxYlVRSURnTzVhQjIy?=
 =?utf-8?B?T1VPcURMK2FVTUxHbzEvUnRLMlZSTDVQdW9uRnhjL0UvRDR0L2hpWnl2N3dJ?=
 =?utf-8?B?ODNqQVgySkR1ckdVNERCVW5LRk1wU0ZRaVZFcVoxb2prMU5LR0VPMXFJbjVT?=
 =?utf-8?B?RkN6blRuYUFzMW5rUkc4aUV0K0ZjV3V0STlYTmVOQkVjSllzaXhORTJ3VDlm?=
 =?utf-8?B?bXNTUUU1dXN3VlBtWWdBZkNkdmliTHhwNUFmQXdKOFRyK0xBcXE4UFd2Q0hk?=
 =?utf-8?B?YVB0WUtDRWQ0SG16cE9vZytvVGpydDhXWWtSLytXQnN0MjFhQXBJUWNkQ21x?=
 =?utf-8?B?eW1hcTRjMC8xbHhud0dROXZ3ODB5c2dIR0E5eERZSEZaL21CSFhRSTA3Tkpl?=
 =?utf-8?B?MXFvalNCdDNPVG0ra3ViVGhDdjVRRmpwcU9rWko3U2JCSDlGc3RaL05VRHdt?=
 =?utf-8?B?MDRBeHB4SXhtSmNQWmVIaitJa3Fjb01FNExxNmdTMTlWZEhNakdmZklIMytG?=
 =?utf-8?B?NmJEQWVYeGtqTFhqaXlOQVc0WWZPWTUwaVpUOURKMW9FYkVhbkRUalk4NXZq?=
 =?utf-8?B?dWdaekFQVGcwQTVITU9XMzlTVmNiaWhJWWExbExiMlRYRlBqck5hcUt4SHgv?=
 =?utf-8?B?WXNYaU03dmRjYkpNV0FhN1JVRi84b3doWXZlaWZZYWFUZGIwWmlDRzJvRU42?=
 =?utf-8?B?MGMvbWJONXB4MnF1eDBJQjI1NnNiVnh6ZSthRFpPVUMrTndCdk1KSHd0MVp6?=
 =?utf-8?B?UjFxcGpLV0ZaWGFlbmgyY2RnelprOFU4dzJBMGk3elZKUlNnMllUNDF4YXA0?=
 =?utf-8?B?SVg4M3NWODA0R3ZHR1M2Tnk1K1pwWFhOSytGOTNldU9oSnk5cVQ3NGdYZGpn?=
 =?utf-8?B?UE9qdjdZUzk5YmVlNDFXUDJOQXVJZjVCOFg1Y21jTUttTkZXczhHSG1kWWoz?=
 =?utf-8?B?MmhvT0hCTzZzMFhEeDJyN2p0b2RBaFpVb0tDQUJYRUVjMW5hbmFqS3lNWk5h?=
 =?utf-8?Q?8tgwL2?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(35042699022)(376014)(14060799003)(36860700013)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 09:50:04.2714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bbef6fa-328b-48e1-9a21-08ddb55ffdf5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6277
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_025014_565296_65D78AAC 
X-CRM114-Status: GOOD (  15.41  )
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

T24gTW9uLCAyMDI1LTA2LTIzIGF0IDE3OjIxICswMjAwLCBMb3JlbnpvIFBpZXJhbGlzaSB3cm90
ZToNCj4gT24gRnJpLCBKdW4gMjAsIDIwMjUgYXQgMDQ6MDc6NTBQTSArMDAwMCwgU2FzY2hhIEJp
c2Nob2ZmIHdyb3RlOg0KPiA+IElmIGEgUFBJIGludGVycnVwdCBpcyBmb3J3YXJkZWQgdG8gYSBn
dWVzdCwgc2tpcCB0aGUgZGVhY3RpdmF0ZSBhbmQNCj4gPiBvbmx5IEVPSS4gUmVseSBvbiB0aGUg
Z3Vlc3QgZGVhY3RpdmF0aW5nIHRoZSBib3RoIHRoZSB2aXJ0dWFsIGFuZA0KPiANCj4gImRlYWN0
aXZhdGluZyBib3RoIg0KDQpEb25lLg0KDQo+IA0KPiA+IHBoeXNpY2FsIGludGVycnVwdHMgKGR1
ZSB0byBJQ0hfTFJ4X0VMMi5IVyBiZWluZyBzZXQpIGxhdGVyIG9uIGFzDQo+ID4gcGFydA0KPiA+
IG9mIGhhbmRsaW5nIHRoZSBpbmplY3RlZCBpbnRlcnJ1cHQuIFRoaXMgbWltaWNzIHRoZSBiZWhh
dmlvdXIgc2Vlbg0KPiA+IG9uDQo+ID4gbmF0aXZlIEdJQ3YzLg0KPiA+IA0KPiA+IFRoaXMgaXMg
cGFydCBvZiBhZGRpbmcgc3VwcG9ydCBmb3IgdGhlIEdJQ3YzIGNvbXBhdGliaWxpdHkgbW9kZSBv
bg0KPiA+IGENCj4gPiBHSUN2NSBob3N0Lg0KPiA+IA0KPiA+IENvLWF1dGhvcmVkLWJ5OiBUaW1v
dGh5IEhheWVzIDx0aW1vdGh5LmhheWVzQGFybS5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogVGlt
b3RoeSBIYXllcyA8dGltb3RoeS5oYXllc0Bhcm0uY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNh
c2NoYSBCaXNjaG9mZiA8c2FzY2hhLmJpc2Nob2ZmQGFybS5jb20+DQo+ID4gLS0tDQo+ID4gwqBk
cml2ZXJzL2lycWNoaXAvaXJxLWdpYy12NS5jIHwgMTcgKysrKysrKysrKysrKysrKysNCj4gPiDC
oDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspDQo+IA0KPiBSZXZpZXdlZC1ieTogTG9y
ZW56byBQaWVyYWxpc2kgPGxwaWVyYWxpc2lAa2VybmVsLm9yZz4NCg0KRG9uZS4gVGhhbmtzIQ0K
U2FzY2hhDQoNCg0K

