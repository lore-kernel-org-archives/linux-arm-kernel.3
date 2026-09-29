Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E159BCA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 10:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hYU59M8C1gPUQhArhzPU6s2T2x+NlXNd39Hkn86eRTU=; b=ka94Ap2VvGJ6gnKqAk7ZL+znzA
	1ivxchpHjU8+ML/hWx/ThCJ5X/cX5iENLh5tcIzN0Qpuuac77o+sU6SrpIpp8pmAbGP4LUMNT67T7
	hGtOpE9BwCHjDP2t9f98M8ymMDWxSweIG/ES8Vcfmy2/4uUSE+2iHkfkU1cWZjlCyCCUHfdi4/ZtI
	66gPoBBYScmv37cHaSwpJMnM3OYGGUmoIx0hpiil2FlTBG9UDpjlrYJJDmeCEiTccW1OIW5xV4tBx
	0t7cck8Pu5pf4Co4dCN7LbeI2Lcqe0+ACaCazrywrMd6sSeVU1LZxy2aD7N453WuQ1OzoIj0nmsK+
	RCHe7ENw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVHN-00000003IZ8-1n4u;
	Tue, 29 Sep 2026 10:41:45 +0000
Received: from mail-northeuropeazon11011068.outbound.protection.outlook.com ([52.101.65.68] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVHC-00000003IWi-28KW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 10:41:36 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=FdtwG+SJtYA7FxmnvCOThtMZR7/V81sMomuw5IoxbouDG0G3d+xiSAiBw7TeP2eMxsJcO5MQEGl1Mnk+sZAeauRKd2JlEqgnkuljU2QIz9mfIwGZV0pCxpGzVeytyXtPElLU7rjVUnQQnQF2omrK8OXmwzYjJQpJapQoObyBoOwo9JCjMpNx/Ik6SYnJQyuY4zc2L+1E58bn8VrViaaMnijraPSMraqozL6HsbuA4KLRheJv3PXRyLlbDaxxCwTB8OVSI728MLrVJSEwdGZEYj66EFQNxvlCGkhdfYvvoDzLrfNY6yrYj/RlaIKJigU4FITCafli1gJBLVWRbg/SvA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hYU59M8C1gPUQhArhzPU6s2T2x+NlXNd39Hkn86eRTU=;
 b=jT6Tw4WcXg6Q230PzC8stAHFRZjmNe/OslxfGewEtMaGu8eklI9hD3uzRMEgy+/FsgJIfgz4/CyJ0ov8VJxlz34ury9JVA2d/T6upUo49FRwlKwgDODArCiN/V30MmB7ye2zjNQN89SNJiKsI9nZKuDiSwBmCDba5LxyIhernuRtCqpQgxDWDeboIc79xbdp9c746SU2fVXl1hxs1qVstKZK66mBBLrnWqFxOe7n3RFjGlJRG5j5PIs8l71VAGrUaEg7NCXw6wm4pjNkZM/eLinpuK3F4v99u+yEXg8fG0mdCvIIojjV6ZonxuYOUwW1wdloiFjseJN6ElFCUtyvQg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hYU59M8C1gPUQhArhzPU6s2T2x+NlXNd39Hkn86eRTU=;
 b=CtmMP2Z8ofUGC5t+x+YgJ+3AybPNgKtY8+umRNpLj4Hmq2vtfcOnNYG1LDdzt3jZEs4A9/bhcUakFB97KGpFVbLtUubbOZghmfN6nj1S42dcQa3b0Lgp/Nzbj+zXseaWrlDnj0+0jH5jJU+beoPxcNyeQoV8kZT0gx/vyEwyZ4A=
Received: from PAZP264CA0138.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f8::11)
 by GV2PR08MB388410.eurprd08.prod.outlook.com (2603:10a6:150:3b6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Tue, 29 Sep
 2026 10:41:28 +0000
Received: from MI3PEPF00008486.eurprd02.prod.outlook.com
 (2603:10a6:102:1f8:cafe::64) by PAZP264CA0138.outlook.office365.com
 (2603:10a6:102:1f8::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Tue,
 29 Sep 2026 10:41:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MI3PEPF00008486.mail.protection.outlook.com (10.167.240.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Tue, 29 Sep 2026 10:41:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X2gRDRSDVwkv4vH9P1MvWTDrrzHlsC8WEXjlZZgqlG0YEG5q7GgzMJebws8jPPpeLUMMinBdSLvY3qZ+kJ5JG+1Kowd+vgEO265IkT9XXVMLAUGNxYVNL4b2fJtZUnzs8vq/1RuFXGEUsxGz5A/YFdqwKGJydQwsAz0J/jVWk8pCU7rJ+3aglfWknV4+gaJnjaRVDcFpJxXK0EEe4wmzSRu9zt8ud9XF/069TagGAig9wIKnsV9dLZO5oLoFT46HqrURRVfHq3dx0mZdYpJ1uIEae+eB014vmZvVUeJZxCMgp+kKwfFire6ftJ9BWfrxfmzOrdH9QGANQgOgYPPJZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hYU59M8C1gPUQhArhzPU6s2T2x+NlXNd39Hkn86eRTU=;
 b=amr1QzlWGcjcKqtmsUNF+SKfdkarfHN7vaUAjGE2/6NAXUpfDS9gpMatf5I7n/27a+ubti6dh6FQgOm9VIErmgLAnLbdEdSksOBXJdCLCa0RP24aAuoyswkLfDjkmw7w1nGAoP0Ruta4oiEKTPIFGwGxuigPqUFU9jclHkMY+ZLjVBk22RqPG/tOl7VQGlKV+myArgcLbebGNN0KKKClZXSbjrrzX+Nas/+4+ePN2xDlsnXTOGdcCvEyhf+n8JzAL6Ph0K7qNwThRHCS2imyip3Sp+dC84l+CRAljIyZ+fdMs8JeqV5YXIUZiULceHoStZcTlFSBTMVIkjbvLmjrZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hYU59M8C1gPUQhArhzPU6s2T2x+NlXNd39Hkn86eRTU=;
 b=CtmMP2Z8ofUGC5t+x+YgJ+3AybPNgKtY8+umRNpLj4Hmq2vtfcOnNYG1LDdzt3jZEs4A9/bhcUakFB97KGpFVbLtUubbOZghmfN6nj1S42dcQa3b0Lgp/Nzbj+zXseaWrlDnj0+0jH5jJU+beoPxcNyeQoV8kZT0gx/vyEwyZ4A=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com (2603:10a6:102:31d::14)
 by DU0PR08MB9028.eurprd08.prod.outlook.com (2603:10a6:10:474::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Tue, 29 Sep
 2026 10:40:52 +0000
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e]) by PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e%5]) with mapi id 15.21.0472.005; Tue, 29 Sep 2026
 10:40:52 +0000
Message-ID: <6716de22-b7b0-43f7-b343-f20d4630646c@arm.com>
Date: Tue, 29 Sep 2026 11:40:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 02/14] coresight: etm4x: prohibit modifying cntr_val
 while session is enabled
To: Yeoreum Yun <yeoreum.yun@arm.com>, James Clark <james.clark@linaro.org>,
 Leo Yan <leo.yan@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
References: <20260924-separate_etm_cfg_v2-v12-0-a2b41d2f7c2b@arm.com>
 <20260924-separate_etm_cfg_v2-v12-2-a2b41d2f7c2b@arm.com>
Content-Language: en-US
From: Mike Leach <mike.leach@arm.com>
In-Reply-To: <20260924-separate_etm_cfg_v2-v12-2-a2b41d2f7c2b@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0090.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::23) To PAVPR08MB9674.eurprd08.prod.outlook.com
 (2603:10a6:102:31d::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAVPR08MB9674:EE_|DU0PR08MB9028:EE_|MI3PEPF00008486:EE_|GV2PR08MB388410:EE_
X-MS-Office365-Filtering-Correlation-Id: 15942039-1d04-4b13-bd72-08df1e163752
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|11063799006|10067099003|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: DJdsVRcAF6oBEs/Nkrx0n7aBwDC5VhUpi7kt8uKRxWLWtr8D+Fnn5jW9XEfXB5/4gFiMCkzcvzOc0SWpR4H2ILBAn0QPkjWYcrxrAHn36Rg3Jw6odUThliAmMynGbPkwANvaP61PQ9XgMTfyBHF7KgR4aKgnbx6M1oaNfVWj5fHsA/i791M1KE9X/KMbKZxoQ/w/8KbrNqefOBP99ln6nYzIIkEkMg9BBkdc+IZiIbLZIArAVVLweF7jd9PspuMekoB4ONKOq+0hULGCITaB0tTDwjJ3EkOLnjxqhZTH4uI+ax0K5ilEEnpZAraAEbua1G+r5HfBqt2NbLxNz/5d79z0a6dqutr/1j0EiosG8KD4ZMPQbmV0PQ7JwvshbNxTROaaPlYC73tSBu+AI0rnXX8C7SpoEjgvdxWiLqvRUiBQWi8Jp1BZkDL5WLY8FYUNAGQyQfnS8zo4TGOxinZ2kPONtkk5R8AtnLgPX6LXbXLcMo1e5sXaX6KA+NrPbLKs6ymngR2eU9/MMUajvbJ/MapBp0Lf2RIpAfjOyT4k1CIuSi0iiJ9X3PtQqdg77hvWlDqwOSnxIaMwP0/LN7NFxq24wW5+dW81a3Xfg8i6bNJv7Muou4qMCn3QDFm2u8tO43MSWR7Y9TI3jQhE5Et6qcp293O9SmJ3lPu/rJEW6d4=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR08MB9674.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(11063799006)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: uEsl+Dgftreu7++MUVv93zRcU9oOx266EBWbGNbzgmZZ/86bGyZDURAfIjhOF4b377XTvkUy4ss0R3Phmp7yKbSRIq986Fj8A1zirGkt2SqjNe0XrfM5I/hqnD5toI+mbH33/EbgxhmCslcZRIQuFNAQSXVt2zVW0iZGe8QVfbn2VgIN0rA9BvHzpt7gy6CrtBzID4pjtA8YENqWR9WrtnzxR7Yenrh6WytGr9OtKDfgGuo5jFT2LchF28KiaYF3YuoXxNgYG+lJ3sokPnjMYyHpZ3ROpGnyuhrphMeHXSQ8OceIYB5piKabi/O8P/Ukl00q42thquPwiy+kvBmmZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9028
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: MI3PEPF00008486.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 73199880-1476-4b28-2a80-08df1e162203
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|1800799024|35042699022|82310400026|36860700016|376014|7416014|23010399003|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 93YQK+QCUjRVNUOR4PJ8f95B/8dT3EmXSNO0wiBF6BbxuWkMC2dTAkzJjtoIvr0v/b01r797N4W3/nW9jlLOykZBld5HG/rzsX8dV679oPH5NbcX2kmlav/XWNaYiTUEyaGLckCTI89JGo5FWOvpjbj3kU/esLooF6/eGubr1a4lHHYiEfG7JtEZxiF0ANna7lXXfeFhEwOJrarpLRf42/XOQzYIkCq4bPl/yKtOT1+ALOU9T/j/cybw6u2NVhweNOp4uWzltMOh2J8yksA1pRmZELSb4a3KpvDOhtBFHhS9y7du+rpVotO4Emxjn6VtjCZIRmmbvLUV6fBpK6agDnQMSoXFKvt2BP2kV+xTxZOL8HSYT98U/XmLDloyfBsyzw6ROQkTFYSpeKCmwT7YaOIo84hke2vNXZooygCGwGhZxqGV1XxwAg748OTIg+hTp0aFP8RNWm2jyGWYuNB0qLH31ee/xXWQFdz+QbKvMtO44eCa0ss1ySU0aaVto2cklXDKf5ngHIav5gSwoR6IyKod0zG+sg7wv5H2/3Sl1bYLbMI2S4X+a4a2KUrhNAzi5EWqgpgYaBXaTBpbczzxB96f7xkCFQ8VdwGMtzEjBkfno2v5Xpj6ARmj2SnNmHl573nPaXL6mITnjy1QVw6GZuzHh5lfQm+bHvv0SEpj/Sdl9mM8PZ6aK/g+CwgAC4LRInHVgoT9fwwHdB+Q2IRNqg==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(35042699022)(82310400026)(36860700016)(376014)(7416014)(23010399003)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4+GlxtpftvbC7iapAAH7/q2EtUYANjV1Bc9ntG5XkqK0zal4v/n5L7H8gBeQFlDd/hpJE19p3ArGNP8wz7NpM7dgakb1bT01vuUgn+FGE8f+g1S0+gASfmFdd+wgUjoRiJEfEIGqNeWVzFucKAg5PUcYOyG+pNvsNoqi7T8SkOpXTHmZ6eMxLX5/FGY/cPBTMFWlHAQqFhQp+3whAedt8pEQYm9d1F/hI8eO0NZv7WDI/Es+ByerqmGCopMKRx/YfFVnUR83ieLDtlbaWksgo1xIRT43tqn8RFGnh5wjn02RtNaVOZlAaFm4h3/UYJako9NGzYdLcsAYu5vgt9bkM7oHDy2jPuDnkwEKd1+H1+d6LXTV0AkbRp7bglDbDyD4WvIeYOYxVvpWvAzwM0JRURDjAkygG1dIEIm6t3TceXQxmckNniqJolvMjsFEMV0v
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 10:41:27.4495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15942039-1d04-4b13-bd72-08df1e163752
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008486.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB388410
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_034135_488565_24F4460F 
X-CRM114-Status: GOOD (  16.47  )
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

Reviewed-by: Mike Leach <mike.leach@arm.com>

On 9/24/26 18:33, Yeoreum Yun wrote:
> cntr_val is overwritten with the values read from the corresponding
> registers by etm4_disable_hw() when the session is disabled.
> 
> This means that any changes to these values made while the session is
> enabled would be lost when the session is disabled.
> 
> Therefore, prohibit modifying cntr_val while the session is enabled.
> 
> Tested-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm4x-sysfs.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> index db3cf4ad6806..a547de5a3f9c 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> @@ -1615,6 +1615,9 @@ static ssize_t cntr_val_store(struct device *dev,
>   		return -EINVAL;
>   	if (val > ETM_CNTR_MAX_VAL)
>   		return -EINVAL;
> +	if (IS_ERR_OR_NULL(drvdata->csdev) ||
> +	    coresight_get_mode(drvdata->csdev))
> +		return -EBUSY;
>   
>   	raw_spin_lock(&drvdata->spinlock);
>   	idx = config->cntr_idx;
> 


