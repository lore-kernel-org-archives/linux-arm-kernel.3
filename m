Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4277EE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 11:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=364ZluCIZr7a70dPj3sh51q1QQ1v/Q982RL9ATBcfj8=; b=ZKSE8gSnBilBCZmcf89aljsV4L
	FWeOpYFmsg4wVBYhP9VVEhjq7+TDVrIPa9fnxeWGUUyBpGj5YK7BXCdNCEwQUhyLRssV2/1K8mdlB
	7UkjRQHDCr06xoA+/uHupOBataLFfqmxlgRd1MbIgn0FObv4ceS3QUwIrP4Syf3Os160VPDbx0KHQ
	Db7iwCsjB/A962GYm57epIihltWs/Z9ANNtNNSrD2mFgJ59yIy5wT9pd/qCdMWOsR5Sy5ctgnIOcT
	+Hllw1EyqdBdES5xFHoevM9VumMQO5pZ3VfRqf14LE3IdnM/fP3y0PjD4f9ANJhUGlNmPc9CIFa/J
	I4O/sg4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEmK-00000001fxw-02xW;
	Thu, 19 Dec 2024 11:33:16 +0000
Received: from mail-am6eur05on2061f.outbound.protection.outlook.com ([2a01:111:f403:2612::61f] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOElD-00000001fsE-3okY;
	Thu, 19 Dec 2024 11:32:09 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SiTDzs0Wkvich/UHVigqtiLpYY4NPC6sRPsLtM9lm1yZ5sm8kVdmEj9GArTt7pJgDp/mQqxSvPnoh7pJNee+4tarSk3VKHFOKU+fVrqe8o8m+NEFWFDwQVPmbcHLwd7Yob2mp/nqHeW0RHJWpxBuGiu1WlVl0XPcs+HWlngvS8LlL3cEm/eoY/tSnqxjCGou9uv+75tHH4XaMsbRoRZAp6dj2s7vhmWOXhaHCUhp89y+mDcFEdx9KyFnwGHayOp8BR/Kqyi9/MjXn2h20pURC8jonfi6OtaoHvUyajVYWnOayV0p/QygbBq8wq52k/IoQHHUtEgopLd1oeOYGFCXvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=364ZluCIZr7a70dPj3sh51q1QQ1v/Q982RL9ATBcfj8=;
 b=HBVXRmwkOJdeEl7gZiJ9BNmEsd/mQWypTycPl4jMHVOLRK6fLcrnhZd3GhCJTq+7NIM4oKiqnyBqOrYhfX1AuP20yUh43abkU+ydy4+0fPcahb20P3Kz3mXteuV/3FI8f+fbJaqi86CHmWLQDvoRRKwmSNJ63TbfGEDnU6UWGuHEuq4fOq8ymujMQ1gppC7UlRWCLTfxY3dECldlgvJrwcewAtViw4vDSNVNgzaarFwdYULXVIbrZR5OTv0lDSTYkIAzUTUgEFLxmJClKx3DTKjm2CUFlWF+LGfleI7E3TvuOxVLRxxW9kpUiAClcjlZAqNfWvq1QIEK4mEo13e6dw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=0
 ltdi=1)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=364ZluCIZr7a70dPj3sh51q1QQ1v/Q982RL9ATBcfj8=;
 b=l25/pkBmgDJDBtnON4YIgwzbz9KNxxgs2gr6Z/sECN8FICQXmTHypKvy/K54G/+FwKdUdas+K2XFIf81P58j7n1Jeep6dD/S3Tq/FzU9wEWoskPekimnItoeFFCrP2gKrZVK0smk5XK1bQSVv7C4I98OTYNe9QCK3Ft+no+1gVw=
Received: from PA7P264CA0238.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:372::11)
 by AM8PR08MB6562.eurprd08.prod.outlook.com (2603:10a6:20b:355::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Thu, 19 Dec
 2024 11:32:03 +0000
Received: from AM1PEPF000252DC.eurprd07.prod.outlook.com
 (2603:10a6:102:372:cafe::3) by PA7P264CA0238.outlook.office365.com
 (2603:10a6:102:372::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Thu,
 19 Dec 2024 11:32:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM1PEPF000252DC.mail.protection.outlook.com (10.167.16.54) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Thu, 19 Dec 2024 11:32:03 +0000
Received: ("Tessian outbound 7762b28e8285:v528"); Thu, 19 Dec 2024 11:32:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ead70154cb8d63c1
X-TessianGatewayMetadata: MtLI+QKBzKBOORuBNxkhJodQeBy4wgmQxiM4k1f2zpt0W9AlozLoJxaJunMLpU6rhgi6PQzW1xQf793+aqTcK6zmDmPj5PIXQRkxyWABr5iXK9+DXCyP6j9U0luFIunknE496UkGyhyJseTZMmZsel52+4Pru5yv0pbspVkzMTc=
X-CR-MTA-TID: 64aa7808
Received: from Ld4b557958c1f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7FB69301-B5E1-4EEF-9B5A-B64B054D3BD0.1;
	Thu, 19 Dec 2024 11:31:56 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Ld4b557958c1f.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 19 Dec 2024 11:31:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xzy7i3fjko2VpjGC264Nqw9JF0e2xSPxMxpzuXQp3qV86QnOrO4YEAZFBJgfc6xX7Tv4V3dAhhAIMihf+vSpOs1PD/sOfa3l8HRlajdoPnHwYbgb7/HWnWCbs0jPMn1Nt5bebgdq8VAR12q9+X37UnAChhhnr4ncA9pTpeSZMXQzwqk6G6FHAnKdMcGJnGLzt8H8FPumyvVHNCBy6eTKE+KOHQ4fJJBYJpg1RXoXJ8PtmlqFnWCwLD2VpNo4orsX/SJwSgOwwf8YabP5pYQKa193aJG+WGm4249f5uT09X+enMGu8OwGXg7O2tBY/zSQg3be6qDfl5X3w/SRI+lcwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=364ZluCIZr7a70dPj3sh51q1QQ1v/Q982RL9ATBcfj8=;
 b=LBLvAe6UDA8viO0BbTo78ZPTMDUp9M8q0gcvuunZZ9WobcIN/V6HMPx5IeyigB2adHrSYGZp4zEkLySHtgA7KeGHDUOlNuozHiaqea9veR83a0WyP7OeG9JPspmB2EkeJ00I5HcWOYJC6cxEWaNAIj9hJeRVrBd8RRmTvn+JnWSy2/ZTbp2utK7LoqT87Zqvalrvh39+Fvs6Ogqf5b/qbqmCF/6oUGr7U0UL6+j9sRTRy5yucSjf+/eOwGaN+HE3tVe+0/hC20ylUdZHml1BQYUm9UYIoDgTGG5cPAr6SARKkFrD8wmA1r06FDSyZkB1dfhwFsjNbbzeQwS4vhPMWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 172.205.89.229) smtp.rcpttodomain=sntech.de smtp.mailfrom=arm.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=364ZluCIZr7a70dPj3sh51q1QQ1v/Q982RL9ATBcfj8=;
 b=l25/pkBmgDJDBtnON4YIgwzbz9KNxxgs2gr6Z/sECN8FICQXmTHypKvy/K54G/+FwKdUdas+K2XFIf81P58j7n1Jeep6dD/S3Tq/FzU9wEWoskPekimnItoeFFCrP2gKrZVK0smk5XK1bQSVv7C4I98OTYNe9QCK3Ft+no+1gVw=
Received: from AM8P251CA0008.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::13)
 by AS8PR08MB6056.eurprd08.prod.outlook.com (2603:10a6:20b:299::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Thu, 19 Dec
 2024 11:31:53 +0000
Received: from AMS0EPF000001A9.eurprd05.prod.outlook.com
 (2603:10a6:20b:21b:cafe::ff) by AM8P251CA0008.outlook.office365.com
 (2603:10a6:20b:21b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Thu,
 19 Dec 2024 11:31:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 172.205.89.229)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 172.205.89.229 as permitted sender)
 receiver=protection.outlook.com; client-ip=172.205.89.229;
 helo=nebula.arm.com;
Received: from nebula.arm.com (172.205.89.229) by
 AMS0EPF000001A9.mail.protection.outlook.com (10.167.16.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Thu, 19 Dec 2024 11:31:53 +0000
Received: from AZ-NEU-EX06.Arm.com (10.240.25.134) by AZ-NEU-EX06.Arm.com
 (10.240.25.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 11:31:51 +0000
Received: from e123574.cambridge.arm.com (10.1.197.68) by mail.arm.com
 (10.240.25.134) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 19 Dec 2024 11:31:51 +0000
From: <anton.kirilov@arm.com>
To: <heiko@sntech.de>
CC: <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <krzk+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-rockchip@lists.infradead.org>, <robh@kernel.org>, <nd@arm.com>, "Anton
 Kirilov" <anton.kirilov@arm.com>
Subject: [PATCH] arm64: dts: rockchip: Fix the SD card detection on NanoPi R6C/R6S
Date: Thu, 19 Dec 2024 11:31:45 +0000
Message-ID: <20241219113145.483205-1-anton.kirilov@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A9:EE_|AS8PR08MB6056:EE_|AM1PEPF000252DC:EE_|AM8PR08MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: c0b35a0e-5cb3-43c9-1530-08dd2020c296
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?ZGVNZMD0e9QpGRO0jp7Mu7f/8ZiWxUBIokPVjspC+a/dF/qJgk2losWVfKEY?=
 =?us-ascii?Q?I/Xeb7uNQSK/zMq3QzZ9L0fNRWyLdhVBW9qszMV0k1to4gmRX+Vycl1URUPt?=
 =?us-ascii?Q?Wx12UEyS1o0so2z/vpU4wHa8jBycupO8IoBYqqwwV340mVQc0dEK7cFERzcC?=
 =?us-ascii?Q?vX5fY/t270QQBPBj6EdmX4GCb23S7/ToWttz3KsnDY0SSaqUlvMFv0CDK1S3?=
 =?us-ascii?Q?WovyCbjrhWBgQnVH0e3+aAIs6wUHQbWJG1Ll61rXTkB6AnukXSssRy9s8o8x?=
 =?us-ascii?Q?9FQ95CsxX1lc6Ti+58ph4d1dmo65R5/E7+4nRJpjxh4nHoCclhOoBJJi3QYC?=
 =?us-ascii?Q?lvp5NEoQ5xHNBWFFH7ciMHdeew+SXShfL+lyw7aHBdp8gfPHwTQMyyKUpR5Z?=
 =?us-ascii?Q?5LMnV7DuNyoLQjFKSNlCUtJLsQtjcBCLW5o6ZAZC9H+ujc3VblB28MO0OV5T?=
 =?us-ascii?Q?gJ+aB9PdvM8LZmNKQWJcPhBnYUpTxYJZocLCmDpjUIZln0vXN3tEZSZXG6ak?=
 =?us-ascii?Q?qg7aFVZtiKo5tBMCKAt2uLaIoYgfltG+MbTQYA47E0ir+zV5kJv1/oNaRTzB?=
 =?us-ascii?Q?vwY/FilT/hCWUzurlnpXlvkexoYuzpNtlPf1xxjyhAlF/ReXAEK8ogB9UEIt?=
 =?us-ascii?Q?Zy6mdq/GRbgX/bWjTDy0A8Lo4O+HAeAXfRH8JgL4QCqN5QIV8EwT/ll2JOGv?=
 =?us-ascii?Q?TiVp+ZavGn0Fl+99oXbND5QHwgtZGxzC7TPwi+u2oHclv9zvRJ5dv5ob51Wh?=
 =?us-ascii?Q?kaJNJAKwxpJn5FYbwNz/xlhXsOs8yFiXbgginDqntlLwJIw5076SqRnXczry?=
 =?us-ascii?Q?ebQpJ/mngxF4afuiauP5HDmE6KtF59wgBpdrBUa9QL0WDKluaDxtbJrwTrST?=
 =?us-ascii?Q?oc96gT4gjqcrKUhZXKqsX+ritw8ORZQ/UeJEm+ipKMzBTIRrg0IrwwLxWvPy?=
 =?us-ascii?Q?St2I0DDTrQzxAjI2H/kzutRwVyJquXqlcOCPSbP1bruKwbm1vwdcAD3DJL9q?=
 =?us-ascii?Q?QT4m/yRD7p3htKn5X87wwpBd0Cw7+gRIqwQbBZZheBxbjSUA7eNCnEharcFn?=
 =?us-ascii?Q?kxSo+ZKe7pQm8KiDRnzOLg7erpNQlii3A9pgLc1hzFJamV+IDkXKORjHpW05?=
 =?us-ascii?Q?1fETwmDPPqMLxzv7uqnTraSF2fgTHz9nDQDv2fDi6zyEtjnckiCDymMXSLXu?=
 =?us-ascii?Q?LuELNHw7x3gOEqc5+04rM6dI807JY0R3ROiic88dvg6RdXNzvPwnEPfxkBrv?=
 =?us-ascii?Q?BXuDRrHEqVoAh6gXJEJbxX1216nJW308g3k58BJlqr1r9lwvSqrNRGr82lug?=
 =?us-ascii?Q?PIoXT1Wqoe7uIijCtGLZjJXWQPPFSGTZe8eaOHpER+/3pVWnVL8xRQ5SAwpi?=
 =?us-ascii?Q?VgcevEXgrlizsiKbLz25mGAbUnzvJwohBwtrHieQR0/k+SSVItaH1Wwq78ys?=
 =?us-ascii?Q?ky/LII3M0Vf93wCYS/7Ai49QXf37XQ72ZzIrEPF9b3Fe/70OqDVVyA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:172.205.89.229;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6056
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:21b::13];domain=AM8P251CA0008.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM1PEPF000252DC.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: a4559fea-913d-4310-13ec-08dd2020bc9f
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|35042699022|36860700013|14060799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kE6jolk5xRODk2neiXJ8UOZs6pEVIMrlgYNU+TViTkQb5xGAqBLYIwP1VZI0?=
 =?us-ascii?Q?hBtOPMA32mlwk1GK1BnEbY+MMZEoDOQp+rFuAVpx7qb5g70mPp0h5gOtr+KZ?=
 =?us-ascii?Q?M4Qx9u1uJAQHXeaoheBi5+j/PTZO3mPzrYU+jLSMAg551/0E8Eiit3wXmdSd?=
 =?us-ascii?Q?c+2meStDuIJ0fHFrGy4eG26kafBQgyWP5g+s+qntEfk0Qa+uIGyyHIiE9cJC?=
 =?us-ascii?Q?gmFsI2P0G9Tku6i/rdeIf0UDkNqzds1rI0XLK+PRg3VXLAeGeb5LbGUWpkQu?=
 =?us-ascii?Q?gJONkaGBPcSXZDYtCuO+xtVvuVhLT1x9+wps8sqBByorFTHTAwP4jlGOWrUb?=
 =?us-ascii?Q?QSO+KpPMtY8JZHflDlyST1NC1fpIqAYBfUuW/jSpe0rMjgJ50CjB6NoFu01q?=
 =?us-ascii?Q?5RkfH3ps6UEYZd9h2szop+Lwss7MYgr6xllDvY7bx52mvWY0MwTUoGTbY+/q?=
 =?us-ascii?Q?SQUejcqJ5ugZRpNx92ERimemgdFSGH2F9Pc/HWQygbUc3UJdtxHWcnEK79Wn?=
 =?us-ascii?Q?3lAOTP/Qb+2t6eKz1j2WcoE6uZoBc334xid4R1gD76sAphdkIhnv4Gg6P6dL?=
 =?us-ascii?Q?0xuXU2xI55QFuR/zNy6K2pHGirEyBy2F2LLrA4TKY3lkVDTL7j1c2i9ILL23?=
 =?us-ascii?Q?OpUps53OZ1KWT6jSkawwSiMkur+miJEALFiyS942lb29cic2pZUV9iUyWUKJ?=
 =?us-ascii?Q?ib7yiqlEUdJRxUxpGJir+BSy6ziN9xK9B/D56pF5LGGrHNm1UKHTjaKS/amG?=
 =?us-ascii?Q?iDH7AOGZCO9RZsh1irGmZNp0fmFtEXjE9GisKgSt3MGbbKcxNUAYCTC2DGsu?=
 =?us-ascii?Q?sajHp6rVUl4HYtOLyRSYUoDFG+rv+Z1mVJLh+HLm+pjw9yVbtDp6Z/tRSeXK?=
 =?us-ascii?Q?E4QDrT+3S2mery5BCcHjjVV8YSnebVLiYMI8SRx2kumtW5Zz8voZ4a3/qCbm?=
 =?us-ascii?Q?oMHg/r8BuFO3NvD3Q6h4TeltuXeJROL6iPlcfqZSg8nH+coBHj/truXAf8dk?=
 =?us-ascii?Q?ba6sDeIILGy60R/AY0q7frlOB/Yqa/KeTtaCsa6AHzOUte15//0FDE8E8Bos?=
 =?us-ascii?Q?87CNi+4MRj635hIDCVvqd2zj8HLcEo67uBEXK8B1SW+kAgAaplunufREqRU9?=
 =?us-ascii?Q?YBuPfNxVn9UDBt7gKcmCjDbYG4vFGeLafb/SXkpJpSnCkLAKahRWyFyCDtZW?=
 =?us-ascii?Q?Jk5OdmM56zmLOccBTb4mBpGO04qvaJ1rdX/yPY1JwYiaBNs1uPXhRsOjWi8I?=
 =?us-ascii?Q?ajPfEizPI1XnTtKgqZedBoCVeTTyzeLDoUuWtwiRRxqWNbkcT6iaBlu7St6M?=
 =?us-ascii?Q?7MRO/QrP8dbI1kP/zh30f3G//8xpKMupDem5SBw99s9S4PeUKxwM0Ibrk2+0?=
 =?us-ascii?Q?KPTxMdwL09gb1vgJXCH1h0TWXNTrG0RH6/dtuOxnvc6PVq0/iESKNXOhsSJA?=
 =?us-ascii?Q?1Po0XH8DGCQg07f5zjKzOOWF8UqJMI5EhqP2/iLkDlCH0kicai3XBaqjJanA?=
 =?us-ascii?Q?AUaJlfOI2pRZCr0=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(36860700013)(14060799003)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 11:32:03.1355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b35a0e-5cb3-43c9-1530-08dd2020c296
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252DC.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6562
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_033208_106213_81D17BFE 
X-CRM114-Status: UNSURE (   6.71  )
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

From: Anton Kirilov <anton.kirilov@arm.com>

Fix the SD card detection on FriendlyElec NanoPi R6C/R6S boards.

Signed-off-by: Anton Kirilov <anton.kirilov@arm.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index 76a6e8e517e9..c9749cb50076 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -434,6 +434,7 @@ &sdhci {
 &sdmmc {
 	bus-width = <4>;
 	cap-sd-highspeed;
+	cd-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
 	disable-wp;
 	max-frequency = <150000000>;
 	no-mmc;
-- 
2.43.0


