Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8BDC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 12:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F6hZzTvoh0KLvOqAA8WI/Mc6uZzKv/BxPKGXZAGtusA=; b=gPPLtwE+Ijc5R9ioZElqxfbNO3
	SkGKkvSb57iEXYKNe8S4x84JNxsJ5FJc3IkWC7L3BrX8QYohN3ndUe3vZen7u8fFucqfxX7xDH3zx
	+HFE4zT5A0zUdNnzhyRLr1ozmZXoMSGElwQ2jIUQYZ2giVp+ibexPB5Tfg2hw5XNMv/VmU09y5LdM
	JwBEfcxqOt99+3Z5WFuF5kuL1nIyyupI/OkB1a4eXB9rcCfd4mrr+qjRJdWuzRJx8TQgZIdfjYIfe
	+XS7XNrqgMVYWBg+xIElQZfaTC79Vu2x1puQf4c0HvuZWtwlew9v3HvuSdwE3zhM0136tjfAvQmw4
	efemacAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnz9W-0000000AqZY-2FvN;
	Fri, 28 Feb 2025 12:07:38 +0000
Received: from mail-vi1eur05on20620.outbound.protection.outlook.com ([2a01:111:f403:2613::620] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnyT4-0000000Ak6O-2pAR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 11:23:48 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=pK+yfxnspG1xp8rch27eNnloJUscEkR+Al0IExvNsFiuCrvkRDQ5j7yzGEIFkUnd/G43d4++0x6bEj7BYLmLy4uRKuY/0vnLNHL0z1Ls4k6rgj/RmV9SW4Pd83QKJzz+MLPFSuSto6tW3imPVHZYGWYXwSkkbzTwodBd9z7tMumFqC9Fjs73yxPYSjJkAZTVZFuXRSCyqhU5MDYsdNc4+gRqlJpwtJPgPyQpuxiJvvPJNUBW8OnFGbBwnBTcSF88k4obF+XC+U8G38RVmkXj1CMbTBBmUisVgyprdqW0SX9/lQ0GcXYKlZ9J1xABYzuiU8Exq+mExP2exYUHyzGalw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6hZzTvoh0KLvOqAA8WI/Mc6uZzKv/BxPKGXZAGtusA=;
 b=YOLsEtg7OIJ6fiS5g9Nv7HGqLXxzTGOCAJQyu/A5RBkVcyn9eYe9sgDpyPGNu7Wm5/+/ekF5AipVumiElfRTX5sBC9iXvTv2vAj2eSPj+Rv6RuCNyGGzqEy/ODr7tIYm4mhQZ9xwau09lP38GcH9ZxwPCfERGjXfRCR2NF8+GYxbJMsaNlelAqqgBf4H3iOFmxrGFMtfuovXz8WxV741+JIchzlMR32gnaYVIX0RnXH66S93O/MyXXB5KN5p+XMIE1zvdl7pKoXnVOO10CL6Kj7Vs1Q0gt68EnszosVSTpNaWg1zxWOzuvLJnl6oN75dxsZK90K0NjI5C2e/P3ao2g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6hZzTvoh0KLvOqAA8WI/Mc6uZzKv/BxPKGXZAGtusA=;
 b=dUIXVVliCwdfEkxznzhQvZpzgJiuaMQ+A3vnh4mLRuw8O0F7ruBA+MO1VesV8+ujQo8RC8Zu8d0DI5u9OyLsBy3eqJ4KlUgD6RMNmXvYQNu/i2BGmQ0Tqn8YubU8E3ZE2jFbbzYbOTj0DPUfO/mkNjWH+7AQsuqjAcicNB5K59k=
Received: from PA7P264CA0015.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2d3::19)
 by DB9PR08MB8578.eurprd08.prod.outlook.com (2603:10a6:10:3d5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.21; Fri, 28 Feb
 2025 11:23:32 +0000
Received: from AMS1EPF0000003F.eurprd04.prod.outlook.com
 (2603:10a6:102:2d3:cafe::73) by PA7P264CA0015.outlook.office365.com
 (2603:10a6:102:2d3::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.23 via Frontend Transport; Fri,
 28 Feb 2025 11:23:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF0000003F.mail.protection.outlook.com (10.167.16.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.11
 via Frontend Transport; Fri, 28 Feb 2025 11:23:31 +0000
Received: ("Tessian outbound c3a902884497:v585"); Fri, 28 Feb 2025 11:23:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1a0b39d7270c71ab
X-TessianGatewayMetadata: wdXZzLD6JoLo/oYHrwOwjAABHPs3DTQnc5+H2eLkIzZjMyMLfYK+TWOld1nvMOnrzijnetAmbdRABTN5e4+zyGD7ciFdLVXmF3nilFokRzhxlvX2rfGYOiRp27tMWuuk6RCtA8u76xMeqtIS6MzSiEaTiGRZZBFBMWxRiHdXUUE=
X-CR-MTA-TID: 64aa7808
Received: from L1f12baae5a48.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 63CEA973-8215-4A0A-B08F-DF954FE3C85B.1;
	Fri, 28 Feb 2025 11:23:20 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L1f12baae5a48.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Fri, 28 Feb 2025 11:23:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h8AGfzjnEdShManAP3hjuL4bXXtElGTUXVAmzZTXs6NV//UUO3uc6PKL/mKxwQbBPL0UsT74C8PvZQpvqRwU2AggKUVRMMGanAPwPySDwePCHzBACakmqClUqA09g3dSV4Rk6vQ/sH6GDuCwIMCQ2eS/xb1oa9pMtoPl9f6C6ShlxBb6jw9RCemXmKggtIQc/yOwqfoKh0qIZU/bSFxPgLzmoAdfSImcEZIXXzHsxqzSZ0BdtFUtOeEWBXkpb2N+CVYo5vrXnukNKDO8U5VxMGdin26sJZV6ovbgmRuXsltusf4kjzXRJBMU7o3B0CL8urlbxvUZ6ElYytgWi2g88w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6hZzTvoh0KLvOqAA8WI/Mc6uZzKv/BxPKGXZAGtusA=;
 b=g7u1cFh7MTXSmyojrEhlxdpAoQ6gymDSIdQ1Nw46ej18BxM6j6GcPnl4Cdkj4w5TCP7Ds6UIlL9l9B2LshS2RgYSx2kmJjKoE1TiHa0x3WIvpOWwbnDrrfbN2BWerNBMKqoC1vSDuuYonbwDpieySpdM9It2WaS9BglplziAH71pHDDmCZVs0EPGNtk8BQZsRqqxfllnvQ4f1FngDEnan+3oAvDOw6qbwashmHmxtXil3jFGELVRRY9TtLwYGFLMX1STGiMioaG5ksXF/ym/ED/91IdxJH2e0D9El6omMAWmuweEwlImvKte9j1KB5zL2TtqaNuDhlysts9KFGbqlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6hZzTvoh0KLvOqAA8WI/Mc6uZzKv/BxPKGXZAGtusA=;
 b=dUIXVVliCwdfEkxznzhQvZpzgJiuaMQ+A3vnh4mLRuw8O0F7ruBA+MO1VesV8+ujQo8RC8Zu8d0DI5u9OyLsBy3eqJ4KlUgD6RMNmXvYQNu/i2BGmQ0Tqn8YubU8E3ZE2jFbbzYbOTj0DPUfO/mkNjWH+7AQsuqjAcicNB5K59k=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS4PR08MB7925.eurprd08.prod.outlook.com (2603:10a6:20b:574::8)
 by DBBPR08MB6090.eurprd08.prod.outlook.com (2603:10a6:10:208::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Fri, 28 Feb
 2025 11:23:17 +0000
Received: from AS4PR08MB7925.eurprd08.prod.outlook.com
 ([fe80::8ef3:b027:e22f:1ea7]) by AS4PR08MB7925.eurprd08.prod.outlook.com
 ([fe80::8ef3:b027:e22f:1ea7%4]) with mapi id 15.20.8466.020; Fri, 28 Feb 2025
 11:23:17 +0000
Message-ID: <887a6d8d-9eab-44ed-9fd0-9197598231f4@arm.com>
Date: Fri, 28 Feb 2025 11:23:16 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] drm/panthor: Add i.MX95 support
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>,
 Boris Brezillon <boris.brezillon@collabora.com>,
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
Content-Language: en-GB
From: Florent Tomasin <florent.tomasin@arm.com>
In-Reply-To: <4658624.cEBGB3zze1@steina-w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P265CA0017.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::22) To AS4PR08MB7925.eurprd08.prod.outlook.com
 (2603:10a6:20b:574::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS4PR08MB7925:EE_|DBBPR08MB6090:EE_|AMS1EPF0000003F:EE_|DB9PR08MB8578:EE_
X-MS-Office365-Filtering-Correlation-Id: a55ab92a-3bee-45e7-6630-08dd57ea550d
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?d0JSTGdHUGRGd3VkOUtNU0lQRFNlZWhqRnJaNDhtb0R0SDFDM09hd2lMZW1m?=
 =?utf-8?B?bGxtRXhrSTR2S0lqaStaeUVYNHh2Y1pjNUZ2Y21XR3FoaExvYmQxOUxTU1hV?=
 =?utf-8?B?V0JVSGR3S2xvOTZXaURUMTJIcWtZOE0ycFp6VldVOTdObjJTL0w4RnhiYWNh?=
 =?utf-8?B?OG9XN25GTGJaZzByRGRwell6b1pDZG1NK2l2U2NMZnA4dWpoQ2c2bWdVeXhX?=
 =?utf-8?B?WXROVENBS2dLcVZOalR5cnplaU43Mi8zcW94dnUwaXZaalg0RGMyb2xweFpT?=
 =?utf-8?B?bDVtYk4xYWJPZS85QlEwRk1GUHRUaEZ6UE8zZncxVFpNeUpiaFhSUWtDZ3Zj?=
 =?utf-8?B?WHZ5YWVpaDltWjF5OXYvOGZOVS9JVHNrTkdZOEhJMkltWXJoS2Q2N2dIRHJi?=
 =?utf-8?B?bnZzYzhxZWRNaVoxcGRRaWFPWG5wY3BLU3lqUXlYdVEwZWYvRFhUeW5DZXhM?=
 =?utf-8?B?ZFUra08rTEJISXp3eThrZkZlZWNkVUYzeTczTjNDRVZXMDNmcys0OWR0NitH?=
 =?utf-8?B?czUzN3ZocGdkUzBNODhWb3VNSmpQNkszRUxXWi93cVNiUWlpV0RXcmtRbzFW?=
 =?utf-8?B?MUVRd0hCU1hOejR3TGk1b09HMnFMMGhJYTIzbE8wNFpqdk9vbmtiU1pmVHBq?=
 =?utf-8?B?anU2T0Rjc2xrL1hWa29YZ0IwYWdHSG4vOEt2Q0ZkMlZZRWlpaVpudVJqRnRT?=
 =?utf-8?B?NGt4WXBTQUNRS2JjWFZTRFhYdGVtZUlSWkppYkp4MmcwNlNPSFdzaXNpM3V4?=
 =?utf-8?B?ektYWDF1NmpOSjVaQzR0UmxDamhrSkp4bXpaWkZDNEc2MTd3V3BmOUFrR21P?=
 =?utf-8?B?SGVES0pTdzRLdFJnK2ZlU1VLdzRGNmY2UG9ES2g5ak5QQm5paEpCMDBDYkRI?=
 =?utf-8?B?ZGc1MjRPamtkYVVESWNJMzJtS1ZIZnhITXFtMkdXNnZyaEUxaE5jcG9KOXNV?=
 =?utf-8?B?eVBERUQzcnFGWkxmdlM4aC93VXhpd2NjcnpXdFYvWHIyTGZwb2o2VlRkVmx4?=
 =?utf-8?B?TDE5SVRLbDhZVU5sMUZXcFVvRkhXazQ3d05qTVM3VFJ6RGVDOCtweXdKK3BG?=
 =?utf-8?B?cnN1M1ZpczhzTjFMY0JVY3YzQm0yN0p4SGZXYVo3Zmw0cnpraDJVaEYyRUJw?=
 =?utf-8?B?KzJxbjJndzhqMHV1UWRFazdaNUQwMktZd2g4S3doVU1mZGZ3blpJWEVtcWQy?=
 =?utf-8?B?ZE1YTUc0c3RDcDc0TmIyREtwYk93d1dTYm9haXJBb1JkUVhHQnk1OUFETW00?=
 =?utf-8?B?K0hmb294NU4rbHp5VS9Sb2pVam0rUFBGVmQ3Yjd4ekRGWWp2eC9DdVFpbEtB?=
 =?utf-8?B?WkFETVllbGNXbXpYWjNyZDB1NHZPaUlWQmJyVzB0TVVHSGR5NEhUeFBhd1Zq?=
 =?utf-8?B?bEpabXFaR1BOeUFoNXo5Y3U0Z2dvRlRXcytoYS9ibDA0a1pPQmF5QnZZL1kv?=
 =?utf-8?B?ZGx4bmhEVHdjbks5SVM1Z3gvSmJ0bmEybjdsY2QxRURoTnU4cXJOWDJ4bHZ3?=
 =?utf-8?B?VmJHbk9qTmJ6Qnh0SjV5OWVCNHJLbmwvWU9IeVJmMXVaTzdPNFBDekpSemZq?=
 =?utf-8?B?MnV5L24yR1Y2N3U2VmhFcjkyaDFBVjJiY3h2SXVnZy9pYWFIRzdCZUtURitY?=
 =?utf-8?B?aUVrQW1McEgwV2M2cllLTCszTzZnVGZycVltRVZUdkpuWTBLOHFRN3VmME9P?=
 =?utf-8?B?bmV2MS9EbTVMalJWdWpvMm1WcUNKTVhudGZPdnM4OU5mSjY1bmdRaXUycVhZ?=
 =?utf-8?B?SXB1L3UwWllBYXl2Y0gyY2ZoTzdxNk8xTEl6eTZydFhTVkJiNXlDKzhiQTJR?=
 =?utf-8?B?WEsxSVlPb01RODQvRGd4a2VacnUyRDhKZUVRNVFPRlhubGZMZGFTYnVsQmw3?=
 =?utf-8?Q?JheXa6lDbp53H?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7925.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6090
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:574::8];domain=AS4PR08MB7925.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2b4076fe-a0f4-4e15-d7fd-08dd57ea4c80
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|376014|82310400026|36860700013|35042699022|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WEkwK1pwVkgrV0FpQzVMYW8rM3M1ZkhGS0FvWGFhU3RxUWRQb3lteDdQdjhX?=
 =?utf-8?B?S0ZGNmlHUmJKSkNaQ0Rpb0NsT0hWMkVDNTMwOUFqUEZNYWdHaUxUME1RMVZa?=
 =?utf-8?B?U2pOR0ZRb3FITWJZNjB1cUdHb2YwQmdYYjJrdTBINnR2VFhWcTJlaVM1UnNR?=
 =?utf-8?B?R3pOOS9LeTQxQWNGRVhnWlZtTVYweXhkOVp2RkFBUU8zMDB2SVhQMkFqTVRN?=
 =?utf-8?B?bnAvKzNlMHFFckNZNVEwUFpwUDBFd3RTTVR2aEk0OElBQ2xPQU4wTG9zblNH?=
 =?utf-8?B?Rldid05lcUtHakVLQlZFSlpyVDBWaEREVzN0TU5ZVTFaTXJWWUZQSnhiMmlJ?=
 =?utf-8?B?RC9aYTBrOVRUZ2swR2w0b1hGMk4ySW85MWpJR0t1QXYyaGg1eUJnYnhWVmJY?=
 =?utf-8?B?NW9FNmUzWGZSNTAvZThxWUlIK2ZSblZLVGlzMGdjYzc4V0JPOFR4ZmR1dzVt?=
 =?utf-8?B?Y2E4VElvWDNTMkt3WUd6M1d1enpPay9GcXJ5b0JwZ3Jla3QxMVVzaWs3aW9M?=
 =?utf-8?B?M0hRV3lUek9jWDlsN3NuZ2RoclJvWDJuSVd2QlIvaEFkUmtEaURiSnBMV2hY?=
 =?utf-8?B?QUR1azlhNEhpZk54citYWmJ6enJyb2p0WDE1SGV4QnI3OWRCSlVpY3UrY1Zy?=
 =?utf-8?B?VEpUaWJ4a1QxeTJnT0JKMENES0pOZDFYTWpOSUFZV2ZtcVdSdHZOYUVYdlR4?=
 =?utf-8?B?aHgwSWxEcU00QTF4bzQvSjdlUGZFdm5TdFNhSXlHZWVnRnJkOERuTFFXZTdY?=
 =?utf-8?B?aWoweFF4NEtzRUZaVVV4Ymh2MGZkaEpZOEpIc09EM1NSV2RYNGNSYm9LMXRp?=
 =?utf-8?B?NHg1L1FhQ0ZNQnlueEhSeGhrWWU1Q1ZnRW04cXMwUjBYNHZBcm1oTjNQSWMv?=
 =?utf-8?B?dFhqRzkyc0R4YzJ6eUk5QXJaS2oralhJRFRIaGNnYlNXV2duUm0vcE1XSUNV?=
 =?utf-8?B?N2ltMTR4YWpsck1pbENDQWR6WHBIazllZlZvbnFxS055a3pPZmVLOE5wMlVR?=
 =?utf-8?B?VEVkU1EvTFpXbDNpdnFCZnNKRTRPUEFKNllOMncwM3VRWXhaVC9jY1dOd0R1?=
 =?utf-8?B?RXBGWi8zNFE3R2ZvNVI0UkNhdGNmOFJDc1BlbFNLaTF4U3lvblpXdlFjRmhY?=
 =?utf-8?B?MGxza21ZWmI4MzNxS1hKNFVlSUp3UzBpYlhpWnhlM0FRelVZUGNidlUzUURY?=
 =?utf-8?B?c2pxK2xiWEY1SllYK3VFdVA0UjdJN0dDT3hYdXQzN05hRUhpemxiaTJyMTY0?=
 =?utf-8?B?WisvWkJkemNlNEVRMG9XSVhrVVliYVpPcnRmcE50M0RhclJSVWExRHhuMnZH?=
 =?utf-8?B?Y0l2V3lzREtWZWkvM2FTS2V3dXRHajhaYWQxSUxsaDRyVEFnK3MyZE5oTUht?=
 =?utf-8?B?Mk05QTFjUjFqcExaZ1VYam1hNjcvbjlSRHhVaEt1MkVtMmpkMEZhL3BvRFB1?=
 =?utf-8?B?c2dqUWsxOUluNkFlV3dwU2M0b2FUY3M5RThLNXhPeGRrTjFlZ1dSWjk2RzNZ?=
 =?utf-8?B?cXZLQWQ0T2t2NU5CRmVjVi9BRGlZQVNNRlFHdG43cDJXNlNCUW5TQjBaNzcz?=
 =?utf-8?B?ck9uTEVsR1FaQnJWdFhwaFV1Vjk3SnBMN2ZJTmRsWFMvR1l0RG1aOC9nR0I4?=
 =?utf-8?B?NEtTd1FEVnIxcVFldUpLK3hwdFZkdUhaTENYVVV3dFpxbkE4OUg0Q3o0cTNx?=
 =?utf-8?B?L1FLRmlFbE5IbDU0TUJjRjJrTmJrZUdDOGhPMk91SmFheDdiazVjMnd6V1lM?=
 =?utf-8?B?ZFF2Qy9PL2tOTXBpZDRMUS9BQW1uNDBkTXZqYnFtQ0lsSGxDQUdiVTlmVE5W?=
 =?utf-8?B?Sm9QNzNMbWJvelBIT0F6bkpBZmUwYmVpTDZiYW5GdjlEUzdVKzJwTWhaNjZu?=
 =?utf-8?B?RVp0cTVlY3JXTk1TVUpjR3ZtTmYrUXdMNE9icERzRjU5YVNXbnEwOUJiRGRD?=
 =?utf-8?B?d05WbEZEZHVFeDdhQzRYaWNyK3RmOGRsRmhNRS9LSUxiOVo3ZlVxbUdYYlZu?=
 =?utf-8?Q?F1MuyyZ+x8ADmhbGjAmtOW8mS3mgWs=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(376014)(82310400026)(36860700013)(35042699022)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 11:23:31.6758
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a55ab92a-3bee-45e7-6630-08dd57ea550d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8578
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_032346_872887_E532D1BB 
X-CRM114-Status: UNSURE (   8.23  )
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

Hi Marek and Alexander,

On 28/02/2025 10:21, Alexander Stein wrote:
> Hi Marek,
> 
> Am Donnerstag, 27. Februar 2025, 17:58:08 CET schrieb Marek Vasut:
>> The instance of the GPU populated in Freescale i.MX95 is the
>> Mali G310, add support for this variant.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Fabio Estevam <festevam@gmail.com>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Liviu Dudau <liviu.dudau@arm.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>> Cc: Sebastian Reichel <sre@kernel.org>
>> Cc: Shawn Guo <shawnguo@kernel.org>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Steven Price <steven.price@arm.com>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: devicetree@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: imx@lists.linux.dev
>> Cc: linux-arm-kernel@lists.infradead.org
>> ---
>>  drivers/gpu/drm/panthor/panthor_drv.c | 1 +
>>  drivers/gpu/drm/panthor/panthor_gpu.c | 1 +
>>  2 files changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
>> index 06fe46e320738..2504a456d45c4 100644
>> --- a/drivers/gpu/drm/panthor/panthor_drv.c
>> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
>> @@ -1591,6 +1591,7 @@ static struct attribute *panthor_attrs[] = {
>>  ATTRIBUTE_GROUPS(panthor);
>>  
>>  static const struct of_device_id dt_match[] = {
>> +	{ .compatible = "fsl,imx95-mali" },	/* G310 */
No sure the comment about G310 is needed.

>>  	{ .compatible = "rockchip,rk3588-mali" },
>>  	{ .compatible = "arm,mali-valhall-csf" },
>>  	{}
>> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
>> index 0f07ef7d9aea7..2371ab8e50627 100644
>> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
>> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
>> @@ -67,6 +67,7 @@ struct panthor_model {
>>  }
>>  
>>  static const struct panthor_model gpu_models[] = {
>> +	GPU_MODEL(g310, 0, 0),	/* NXP i.MX95 */
We can remove the comment about the SoC. This GPU model could be found
in other vendor platforms.

> 
> Are you sure about 0, 0? With this I get
>> [drm] mali-unknown id 0xac74 major 0x0 minor 0x0 status 0x1
> 
> Using GPU_MODEL(g310, 10, 4) I get:
>> [drm] mali-g310 id 0xac74 major 0x0 minor 0x0 status 0x1

I'd agree it should be GPU_MODEL(g310, 10, 4). Unless the GPU
version has been changed by the vendor?

> Note the output is GPU_VER_MAJOR() but this table is for GPU_ARCH_MAJOR()
> (and the corresponding minor).
> 
> Best regards,
> Alexander
> 
>>  	GPU_MODEL(g610, 10, 7),
>>  	{},
>>  };
>>
> 
> 

Kind regards,
Florent


