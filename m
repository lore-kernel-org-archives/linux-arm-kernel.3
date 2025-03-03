Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0590C282D2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 14:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6pOb+PVv6DtzZuQq9+IfXDRC9avKT7RKZXbPt4VkKOA=; b=Bl2xI+xuU9WR1N4n34cgU4D6hN
	D4WnjXgdLwrcpoQJXWSIwpgXClpZMg5dTTSAkpnPJ57Y1t3GT8o+6EUuAaEIAwDAcefxzKRA0V+qU
	4I5zCfs4FTZj1dQxMWK2skP/8jWRpLKlvwxNyi5FlXyCOdDTzr9DXegV5txA/htz7Q+6VJ/o2qm8t
	o1FO9HS3RmvI+5ujd4EoKLFQobBER7jXsvQ+VuuZrMbrtp3OCW5SCI91AmAzq8FHjWmOHCHJTeDKY
	GH+C7jg/O1lHZEOjODAbysh6ZD5j5VW0be9/m1lXPe8NMb4IbE/Kx8KlIGrcdqbYfYwsu0bWgHuyo
	mfDEbFWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp6cS-0000000146F-2Lmv;
	Mon, 03 Mar 2025 14:18:08 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp6HW-00000000zsj-3zEA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 13:56:33 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hptL2cHfGtle95P6G3JrjQy2CjPsYs/UMjd153kzYByxi5B1JnbE+FRf6vhua8ZCQLM431hSwXTenpoeGE5mF2Oar8FKzBaNuoSyDjtXKt9kbG11ObrOa9jUv6MyNkpdkn6P4iNojwYpe+ypP2TtCAUwz2t8hLdArVB/jVMAzQ2xLCqtL+/C3JUpBAcmztdRE9FPWJFK9r5awc9mqo5GJasPUHUJcq10Jwnq+VCgGrZW/D1loly+l4G5AcgxpG/xz7M+hkKAIaEz9qdYMrwiVHK8vI1R/j5pKDq9I0l0M3mMFFs3w4lF7m8p3gyxhzqE60Jh1M0rO1VkKjDO0MUfEA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pOb+PVv6DtzZuQq9+IfXDRC9avKT7RKZXbPt4VkKOA=;
 b=j2tPkSBFL6QBgyWfAVrIPfvKM35pGdRgXWwObJWVS/PIbJHrE8yy2bnkPH71ocIM9NFvX6uxzJ9ZkWg0gnNyIHJ4PFUuryoTYkKadKvLyQI+r2shNHDLnc9RTf2oegf3Y42NAAYtCsNHc8mUXsMqbCkaBZmN5hNZvckVCqepEE+ZcuBjlsFyEdbrSzpruVlfNQvRP7cHeISAbo1EAdoM1wzFVkpOGe8/QdzV6CyLvrOXJmbNn6ZX6xW16PwA9+3NHezZqKfUGUiR/+wcAf+Wpy0fsWNPa8QRprQvho2aeNUnFsXkrrmRWE2sd6QHrtfaLGKpxCr4lRpBvuw3h1Ow/g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6pOb+PVv6DtzZuQq9+IfXDRC9avKT7RKZXbPt4VkKOA=;
 b=GSTmujm5oxmIixmsPSr4mkroJHeYM/Mi1xPUZYKcPd6fDVzc3/QImKc88vwrlmCoDFKs5YnPzfkyJcXOktKlvSFo75lK2z5JeSZu6D5X4o76kmRo6kKRmLunD5XbNISry2kR0QD6KAh9kg/zrMDL22d7Fn4uLyCwNjoNT4iOJKQ=
Received: from DUZPR01CA0054.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::10) by VI1PR08MB5520.eurprd08.prod.outlook.com
 (2603:10a6:803:135::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 13:56:12 +0000
Received: from DU6PEPF00009524.eurprd02.prod.outlook.com
 (2603:10a6:10:469:cafe::7d) by DUZPR01CA0054.outlook.office365.com
 (2603:10a6:10:469::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.26 via Frontend Transport; Mon,
 3 Mar 2025 13:56:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF00009524.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15 via
 Frontend Transport; Mon, 3 Mar 2025 13:56:11 +0000
Received: ("Tessian outbound 93a06e49d4fd:v585"); Mon, 03 Mar 2025 13:56:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 675ab306485041da
X-TessianGatewayMetadata: NEF7rxruAlv9aKJeRaEwzT328NOGKWKi/lVnP0KXPCa1hnRkkF9a+k6ZgUNL5I1B50aouCHPPlq9ADCicwJkOwCztA5bc/MkfCsmmOO3CxCGg31MJaBxAh6yiJmDxK+suW7NDF6rVNDvKmfmx64IMn/3UYjmPjkcnuswhpGwb14=
X-CR-MTA-TID: 64aa7808
Received: from L9eab541c29d8.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A74E424F-E043-46D4-A728-B38B0FC420EF.1;
	Mon, 03 Mar 2025 13:55:58 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L9eab541c29d8.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 03 Mar 2025 13:55:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gCdYl7fYglrUiL7p5VKYcMFx1sbbej2eCwOjn49LCOydlDpHzGHJHt/Vxj9xTJ390++OWciLR9Q1y47mRTIvWaWNEyQgPTaPGEeb3Mg6NvA+53TIlycAAdYMKoxlkpr8DIG3JsXHhM7LJVOLpJsdrcF/S64xiildkxEyG9PNPdcqcUVOmgxwyvYMy92jw0/YlAqiUfKISPj9l4lFiNJ6XVmXuUwBtHnl65wPiF7HMqvUH6SVTbZTNZaBnvoJ29hyVB7rBm8RvTu8GwQvnAnFszZGzID98KCZLwQGV7yKI9iUtL253oh8tEVUZgou8qF2SSSmir0koYu4XM4wX/wW1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pOb+PVv6DtzZuQq9+IfXDRC9avKT7RKZXbPt4VkKOA=;
 b=cQ2/0S3Ph3uiMkqSZe92KeOW4yYBmndTZn7K/21DdAP9kcC6KeIUHIQ5Ly9mSg9X6CLoH5KXKE6U2008sGD4kVyRnYQrqXkcsTfjfUZM5iL3hq1cqKFL7CGIktD33/lrZiAmXyxEokI+DZej9YxxUlXmy1nK6+4cfw2WgxPoUyPCr/joJoR1WkHVCbCCKfNJk2gK6phNKUls1t6gUz/s913o8ZKBSzuyqT+N3JBUBs49yUMRXSam7/NunVCiQiciWDpFO3K+QctNG7CEp/Vj9bfM4HTG6v9xBs4D/S2rGj+GgRdVLWSa0XFOxy5bEmu7trFsoeeRbB49jWpmxywzdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6pOb+PVv6DtzZuQq9+IfXDRC9avKT7RKZXbPt4VkKOA=;
 b=GSTmujm5oxmIixmsPSr4mkroJHeYM/Mi1xPUZYKcPd6fDVzc3/QImKc88vwrlmCoDFKs5YnPzfkyJcXOktKlvSFo75lK2z5JeSZu6D5X4o76kmRo6kKRmLunD5XbNISry2kR0QD6KAh9kg/zrMDL22d7Fn4uLyCwNjoNT4iOJKQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS4PR08MB7925.eurprd08.prod.outlook.com (2603:10a6:20b:574::8)
 by VE1PR08MB5758.eurprd08.prod.outlook.com (2603:10a6:800:1a0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Mon, 3 Mar
 2025 13:55:51 +0000
Received: from AS4PR08MB7925.eurprd08.prod.outlook.com
 ([fe80::8ef3:b027:e22f:1ea7]) by AS4PR08MB7925.eurprd08.prod.outlook.com
 ([fe80::8ef3:b027:e22f:1ea7%4]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 13:55:51 +0000
Message-ID: <94f65cda-02bb-4165-ae6e-be19b7cee55f@arm.com>
Date: Mon, 3 Mar 2025 13:55:49 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] drm/panthor: Add i.MX95 support
To: Marek Vasut <marex@denx.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org, imx@lists.linux.dev
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-9-marex@denx.de> <4658624.cEBGB3zze1@steina-w>
 <887a6d8d-9eab-44ed-9fd0-9197598231f4@arm.com>
 <980075f9-5ad2-430e-b139-7e9477bf415c@denx.de>
Content-Language: en-GB
From: Florent Tomasin <florent.tomasin@arm.com>
In-Reply-To: <980075f9-5ad2-430e-b139-7e9477bf415c@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0479.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:3dc::20) To AS4PR08MB7925.eurprd08.prod.outlook.com
 (2603:10a6:20b:574::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS4PR08MB7925:EE_|VE1PR08MB5758:EE_|DU6PEPF00009524:EE_|VI1PR08MB5520:EE_
X-MS-Office365-Filtering-Correlation-Id: f3718424-1d95-431d-3e86-08dd5a5b282f
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?a1RzMGIzRDdwQjhGZlVYSkQvSFh6bU9QMGthdnZJbHE5ODF3cVkxbG9Ka0Z4?=
 =?utf-8?B?d0FYVGNHbGh6SnpOQWYwNHorV2J2UlNEZU16NEh4TFdRQzRDaDNxZFRmeUQz?=
 =?utf-8?B?WVJCVnd1MG5OeW16OVBaNEZwdEFHVi9kYWlMRUJ2YzBoTlFrTUdISFRXcnhT?=
 =?utf-8?B?VVR1RUI1SzAwbGUwdkt0RmwrUkJEVDRQWS9VbkloaWhUaHV1SDVscmYwK0Uy?=
 =?utf-8?B?Uk9ESUI5NEVMSHNjTnNSLzZFWW81TElVU21GZEZWdEErRnVKd2laUyszM3hh?=
 =?utf-8?B?bnJxcWExdjBaVlBROTZtVGVTWXRpRDNuWkVaYldhTG9FdHo3N2hSZW9jWXlh?=
 =?utf-8?B?Y0dUeU1kWG1IUlNkTCtPMldGcFVXemRNaU5EVCtDUS8yVEo4MjJlN1hEV2dW?=
 =?utf-8?B?NEtGVmppVXpNdzRTRysrMTJxdUhlYXVYaXdCOTljZW9vWE8vZ3dYM2daKzdI?=
 =?utf-8?B?cFR5eEExZ3h1NU0vU3FpSGxLWDBJM2ZsN2tqMTZlY24zMThvNkxYbUNFWEZs?=
 =?utf-8?B?cHhYR1QzdkJpOVFKaFdkb0FNeG1NUGgwYTBnQ2kydDR2UFhZSE9iWkRjRE5M?=
 =?utf-8?B?V1dpeTEyc1RJLzlqY2c2UWFuZWd5WDhvdERXRkR6aUM5NGpJVVhncGU4OGhi?=
 =?utf-8?B?SW1GN1RTN1dzTm5tcUg2SnpEN3dzd3NyWFAydlRydXJBVlhlN29yYXJjeFJE?=
 =?utf-8?B?M3ErKzVvTk1EMWNGc0tETFhJM1UxckdmNytVZ2IycXV1OU5LZXBWcDVMYW5E?=
 =?utf-8?B?Y2VXc0hKQVRIdklBbHlsYnZqQ3ZiaTNZQ1FTU3JwWWEwSDVoK2FVNjdzaGNv?=
 =?utf-8?B?cGVOcmJ1bDFTMVlYYURVQ0kxZzJVenR0MzZCWEFMOTJWSWNJek9wSThoRTFO?=
 =?utf-8?B?Q2tROVVOcUpDZUFhNXhaamtHb0FUR0g1L2ZEVHlNVW14Unc5dUIrdHI2VW8v?=
 =?utf-8?B?cmtiVWJPeXcxSzMvS3BYUTRNcFhlYUZQZzhiR3JnMExEeVh0VmdrM1VWRE1M?=
 =?utf-8?B?cktQc1ByUEI3Qlp5aVM2K2RKQVpNaHFkeHRhL3gvRXdpRUR0TzRyZ1VrRldw?=
 =?utf-8?B?TW9NamZoekdIOTR4V1cwblF4REs4SU5uRWc3c3NtcDNpMzF6eFRsdGFiSXNO?=
 =?utf-8?B?d1oxSFFLMmlvS0xwVXFIUnJaQUphZnl6SDJudHpvM1dJTTBBTU9nWi9QTDBu?=
 =?utf-8?B?WnN6TGxGc1hiNVJVaEdDY3EzTHNNT1FIZWhvYXFON2syZ25qTnczdjFzK0xn?=
 =?utf-8?B?RHF6Qkt5T3lOSnJ6dDNnNzJkQ1pVcmdtMmRMR1ZjcUpWY01ZZGRTbURNenhs?=
 =?utf-8?B?eGxuS0pzbDdKZGNDeDZKUjFJWGd5eE9yRlBtUWJSdGtQb01MWVhVZFhKeGx6?=
 =?utf-8?B?R2EweGNVTlNqY3E3Z1NvcndPYm9EVnl4S2ZaalIyNU9ZZXI1L0xOZTRMVTE5?=
 =?utf-8?B?aTdBWmtuMlg0NVZjb0piVXMyTllLem1DL2ZuVWMyQmt4MGZnUUxsQ0RFcTE0?=
 =?utf-8?B?YUV6Z3p6T0J6RjhDbTVUZklYUXBUT0VqM1FodWVQUG9ySTlLRWd0dmcrUGJS?=
 =?utf-8?B?c0lXS1U3THpsckw2YXg1ZDlzYWhYSjVaTlNHNkM4UXMyeTN3a2hiNVh4S3Vr?=
 =?utf-8?B?NlRNRXFIWXcyVU1wZnBnODhKSmlEeithYnJwM3ZXWmp1cGlrRHdhVlBrMUx6?=
 =?utf-8?B?aEcxKzNlcDdOSVZHTktudEJTVVkvNm4zY2t5Y1ozQU02Ly90aUJXOTFNK1NS?=
 =?utf-8?B?YWROTFlMNWpJOTlqRFJqVWRESUlxSVlnK2ZjZ0V6d05nNmtZMXVmNDFQQ2tq?=
 =?utf-8?B?eHZmNDV0NCtoWnZxTkpPM2xTcEs3eHdoYUxzVkJuTmRaYnFoVEFGb1RmTVlE?=
 =?utf-8?Q?IuiHDYTlyjBi/?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7925.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5758
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:574::8];domain=AS4PR08MB7925.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 98136230-b4a5-41c2-0319-08dd5a5b1bfc
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|36860700013|82310400026|1800799024|14060799003|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUxRanFLMnE4dkJhTVR1MVBiNndRRVZLR2NDR2ZUcEtSNGU0QVA5MWk4aHB5?=
 =?utf-8?B?eWFiOFVkS29RY1E3ZmpvRWIwQU1zRVIwcHBPRlJMOXFSVFozZWhPa2NZYmZm?=
 =?utf-8?B?L05wY1U3L0lBNWIyalZUdFpPRmJOV04vK1duZ29rVU5GbnQ2bS9jZUhNTEZJ?=
 =?utf-8?B?ZFpQd09Zbit0Q255djJjdE91OFRtMUNZcGZlTU84M0M4bWFuVDRsQzlSc21n?=
 =?utf-8?B?ajZNQVhZM1h5Zmk1WTBHMzUyRTRMSVk1blFrYW1TcHZCZFV4dk8vUncwa3lV?=
 =?utf-8?B?aG41THFLWkc1eFRKMlZqc0NsSDhyamZWZmdkVmh6RlNaNnNKZW4zc2czZkxT?=
 =?utf-8?B?U2wyTEpOMUlqdC9leHRXSytMQkkyRFF1UGxzcnFSV1NzMUJSOEhMMWpxZVhO?=
 =?utf-8?B?VFFXRVlrclc3SFZJRXlHQnh0blJBckM2VTQ0OEZVcVlkR1drallsdTlhZzdm?=
 =?utf-8?B?MHl3SFpBN3FETDJZNjlRazRKLzVlQll3SHY4MVNCMVp3UFlNb3ExVVdTYXFr?=
 =?utf-8?B?dnZhZnJkM1ZvUWoxWmZhdDl5N21xbnNLRWxuRXNaQW5WRUlmeHZDS2FxWkc5?=
 =?utf-8?B?U1RUbkwzSGNLNDdzOUZCUmdQcFo0SVR4WE53M2VJc2xUQzYvdHRJK2thRm5O?=
 =?utf-8?B?YjdNQVdxVUxvbWtqNUhnVCtNbkFsbC9CS2hrR0NCTUhaejhVTW1CTk1BTWJv?=
 =?utf-8?B?Ny9BWU9VVzdkNVl5ZmxnK1dwY0Y2RHZFTmhTRWt2ZUhSVEp1NkdvN2hSRFRJ?=
 =?utf-8?B?QmRRdHppUEU5ZWxWSWduTndLT3JvK0tDODVpdW5kL1AwbFRWV0xJRU5OQU1w?=
 =?utf-8?B?N1RTL0FOSHFpMGZxN2tjTG9KODJJRTN4dFVCTHpxc2dQMmoxTEpJdm5XbHBt?=
 =?utf-8?B?SkJXQm51SURneG96NDR4MkxGVk5yeVlHUkV2bVZXN2J0SlZHbGUzNGlLNDFV?=
 =?utf-8?B?ZUpHalppdnpMdXBHUjZQTHZRYXhWYi9YSHNDY1J6K2FqSnpLZStGVkZqclpK?=
 =?utf-8?B?elZxdEVTNU9OUWFnL2NaWnNzWktyb0dWT3ovYUY1UUkycEQrdjhhdFVVcVQ5?=
 =?utf-8?B?YWN3LzVGV0pTekVwOFcwR2Q1WS8xVExXSHdNSXI2NGhtVncyNlNHZEc1czZR?=
 =?utf-8?B?Rk1SOGY1aVZZclBtSkh4VzFFZkJmSTVWQWVGWEVxZmlmZXRjS0QyN1VHRm1Y?=
 =?utf-8?B?NFlORHpXeGNseHBjSWVYNjM1eHdDZ1NGRHY3dkdHbUNsbDZaaUNWUnlwZDJU?=
 =?utf-8?B?NlIxZU9WZHI1UlFKeldoM2NsTHpZNmo3SWdMdFNteWlPZnBGVzBUcFhVcW4y?=
 =?utf-8?B?elJ5cWdqbFo2Y1BTYkVWekJXZ3hSL1lTQzNoamU5WXcyMUJabGVXTEwrSk1q?=
 =?utf-8?B?NkVQOFV4N0plL01SUzFoM3FvVlRScG8rdHNRbzhLZEdydWZPRFpMM0VaZWx2?=
 =?utf-8?B?c3ZUdlU4Vk5oc1dPUHJHaktHbjZrYjM3Y1ZEL2J4ejFSODk1NEtkWkQ4cGFx?=
 =?utf-8?B?WnN5M2pwUEVRd0ZhS2FEVk03WVNnb1pjUVJHVkk2enVabVpyUW9TRnRzVUpC?=
 =?utf-8?B?OC82M1BvWXh4MnhDQkVHZE9CRHR4bU5hbUxGZGFRd2NzWGtKdWFBTDhoVFhk?=
 =?utf-8?B?dkVhRXJubStkbHFLOHcxaGMwaHRrclJtWklvaHIwQ1hFWitHMUhjTk9wcklP?=
 =?utf-8?B?Wld1cWFKaFZRNzZlZFVjU1kyajVQbis2OGtJVyt1Y1k0a0txaHhnYU9QZzAy?=
 =?utf-8?B?UUhCcXRsSDYyT0tWTTdsVDdINXdMVHBxM2pRT2lNaEJQVWVkZ3BUNFViZUd6?=
 =?utf-8?B?dm00UmFtbS9MWGpybEZQT2FlN3VqZjJsZUFPckI2OHJjV2U0NDl3alNhSTdu?=
 =?utf-8?B?UWJGb0t6SGR4OHkxVDdXN25DZFZDT3dGTWhIVU16OGNaTERHREw2Ym8yNzZY?=
 =?utf-8?B?YTdmS2JxcTNURWJBR2lPRzdCbURuNCtmcHM4WXJTYXNubmc3em1mUEpidjR4?=
 =?utf-8?Q?ClLR0TUpJA0AWd7CYYDe3GOtLXTB7U=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(82310400026)(1800799024)(14060799003)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 13:56:11.9187
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3718424-1d95-431d-3e86-08dd5a5b282f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5520
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_055631_145390_B3294878 
X-CRM114-Status: UNSURE (   7.34  )
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

Hi Marek,

On 28/02/2025 17:26, Marek Vasut wrote:
> On 2/28/25 12:23 PM, Florent Tomasin wrote:
> 
> Hi,
> 
>>>> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/
>>>> drm/panthor/panthor_drv.c
>>>> index 06fe46e320738..2504a456d45c4 100644
>>>> --- a/drivers/gpu/drm/panthor/panthor_drv.c
>>>> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
>>>> @@ -1591,6 +1591,7 @@ static struct attribute *panthor_attrs[] = {
>>>>   ATTRIBUTE_GROUPS(panthor);
>>>>     static const struct of_device_id dt_match[] = {
>>>> +    { .compatible = "fsl,imx95-mali" },    /* G310 */
>> No sure the comment about G310 is needed.
>>
>>>>       { .compatible = "rockchip,rk3588-mali" },
>>>>       { .compatible = "arm,mali-valhall-csf" },
>>>>       {}
>>>> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/
>>>> drm/panthor/panthor_gpu.c
>>>> index 0f07ef7d9aea7..2371ab8e50627 100644
>>>> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
>>>> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
>>>> @@ -67,6 +67,7 @@ struct panthor_model {
>>>>   }
>>>>     static const struct panthor_model gpu_models[] = {
>>>> +    GPU_MODEL(g310, 0, 0),    /* NXP i.MX95 */
>> We can remove the comment about the SoC. This GPU model could be found
>> in other vendor platforms.
> 
> Maybe it is a good idea to keep track of which GPU is in which SoC at
> least this way ?

I am worried the list gets bigger and bigger.
Maybe a comment in the DTB binding would be me more appropriate and
easier to search?

>>> Are you sure about 0, 0? With this I get
>>>> [drm] mali-unknown id 0xac74 major 0x0 minor 0x0 status 0x1
>>>
>>> Using GPU_MODEL(g310, 10, 4) I get:
>>>> [drm] mali-g310 id 0xac74 major 0x0 minor 0x0 status 0x1
>>
>> I'd agree it should be GPU_MODEL(g310, 10, 4). Unless the GPU
>> version has been changed by the vendor?
> With the fix suggested by Alexander, I get the following output on boot,
> so I think 10/4 is OK ?
> 
> panthor 4d900000.gpu: [drm] clock rate = 1000000000
> panthor 4d900000.gpu: EM: created perf domain
> panthor 4d900000.gpu: [drm] mali-g310 id 0xac74 major 0x0 minor 0x0
> status 0x1
> panthor 4d900000.gpu: [drm] Features: L2:0x7110306 Tiler:0x809 Mem:0x1
> MMU:0x2830 AS:0xff
> panthor 4d900000.gpu: [drm] shader_present=0x1 l2_present=0x1
> tiler_present=0x1
> panthor 4d900000.gpu: [drm] Firmware protected mode entry not be
> supported, ignoring
> panthor 4d900000.gpu: [drm] Firmware git sha:
> 8e5cfcfec20cc8aff8509d37e72babc935d34a3b
> panthor 4d900000.gpu: [drm] CSF FW using interface v1.1.0, Features 0x0
> Instrumentation features 0x71
> [drm] Initialized panthor 1.3.0 for 4d900000.gpu on minor 0

It looks about right

Regards,
Florent


