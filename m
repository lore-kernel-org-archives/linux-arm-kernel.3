Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F17D43374
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 16:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jTitNezrnDKbgE4kBBdKx2gTtn2o1x8IwApXxf94/gk=; b=TQb/CLDMDnZZoEANnT9Tl7emP0
	x03yUbv194lruHnPJvWi28HROoUQik0WupP0WibQN1Qg3gOX7oeB/FaYkgCKyMfI53ZG3VXDvvATs
	y3mbFX/++rUOV8ILz1ZBMay81HWokSqZs3u03k+dw3/M7n9Bf5pQ3gzeJXyEH1w330tLJMCgOjESD
	jGmKbGur+lsvOp3AHLAcrSLk+LBkUK2r63PFBKxowNHO7c9lyBo+VNMznmGXLedCCXju8WFWB9y38
	tifSK4do2F2LHAuBVZirrNTcF/G8IAuk4BqSGTZxQW7x5yeAAqvQUPcdnBgpLCPnYWRP1JFhkO11M
	5QYlOCMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t95Aa-00000007aES-2NPB;
	Thu, 07 Nov 2024 16:15:40 +0000
Received: from mail-db8eur05on20618.outbound.protection.outlook.com ([2a01:111:f403:2614::618] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t953U-00000007Y9R-476h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 16:08:22 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=icAplWHCnxI8MvEbxLCtrkeT4CGCtXwtNrCIadMiBeuTO64T8h7nQ8xtH8Ov4Cm0BrjleAwC4QsCLIt2NtKMe22NajqpNiVtSYGaA2zd5GtyMDkGcp0dBK9MUvZGGVkQUGbOyBk++RivSZUwQENZaIbrHSJldECf+CMgpQWf1tRX17FMzB/EMuH4VlPsZGvB6uqYLZDk00QxhOtxkBzY+eYRBMjn7pr2RvrH0VL/WEOgZ4s51zKACNS0CimVVIY9TXDkp4K9A59PGsh+x1b1Yo7htpeN5GpSY0ng6kHQqDzPzX/vCVw9bu0OYWZKE6Vg0RhQiGmLYq32HciiptlXzw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTitNezrnDKbgE4kBBdKx2gTtn2o1x8IwApXxf94/gk=;
 b=tJgxY/hR6CeyBQRVV9O29avRXoNzh6ojIk+4XbQXtA6tSI+2KmM+FQDdsV5dz3y6uo+EAwU3UY/j5wlrfFx6UutY+pqmCOYRDDgj9URE5DBewR87Tyvg7Vrufrc4GKibHmvimiosL4RuG1s1g+qsUy8Ff1936BOmmPgu9gpCYw9BSVB9POEdI6KyRPjMrWqTxxGhb2x0PIXx5oHSNzneuqJSoH1BYBx/rGN7CMfcDnhzpZSEBgLSYvUO4faL/VTdIK11mZV1CNNa0qclC3FEt9zG94IDrnDdN+mS/lB4iMolzJwDjMw5ua8ql6tEL0+CdvpFGnVk3dpD4WicyJP6Pw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTitNezrnDKbgE4kBBdKx2gTtn2o1x8IwApXxf94/gk=;
 b=GIetak0DFGL4s5lrIHEdhqQ2oqS5QQpf6WAjdnBJkRcLgp2vmnDe4vTQDB4IWa8FxAhpw6ZR2XvlnNNeU6xnXa0pL09HfxU2r89Kh1oZI+8tZUFkQyGIqNyGp74b5BWKSpI0HMf00fZtB3k6EbzgM/nTPTOm9UI/hgrJOQSvOv4=
Received: from DU2PR04CA0296.eurprd04.prod.outlook.com (2603:10a6:10:28c::31)
 by DU2PR08MB10230.eurprd08.prod.outlook.com (2603:10a6:10:46e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Thu, 7 Nov
 2024 16:08:16 +0000
Received: from DB1PEPF000509F6.eurprd02.prod.outlook.com
 (2603:10a6:10:28c:cafe::9a) by DU2PR04CA0296.outlook.office365.com
 (2603:10a6:10:28c::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20 via Frontend
 Transport; Thu, 7 Nov 2024 16:08:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509F6.mail.protection.outlook.com (10.167.242.152) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8137.17
 via Frontend Transport; Thu, 7 Nov 2024 16:08:14 +0000
Received: ("Tessian outbound 373849c2df5a:v490"); Thu, 07 Nov 2024 16:08:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 667e1c8edd42b742
X-TessianGatewayMetadata: EK41TypnulX21YfZgfSD2ZsOnd+9H62c03T5EixXfD4zsHHccOw2Ewj+ENOSRXKBTWL2cpkxiVuEsAD1W2T1t1RIer9IwrNt1vN928t32WXnpbn6C0qjljJY8C9Wd4NydvT7O70mbrqGQGppcvvmEtFpUzv89bqSwnBrmXR4Ogc=
X-CR-MTA-TID: 64aa7808
Received: from Ld9aed62b4560.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A8BD3BC4-F6FA-43B3-B59F-6D7AC9E7A79C.1;
	Thu, 07 Nov 2024 16:08:07 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Ld9aed62b4560.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 07 Nov 2024 16:08:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pO+0xw+1iHYmxHhVIVHfMOLSFzgBe5Ap9duYY/9B/2ixTbU4eEqOJGFEg+uq8XPbQJuxu2BBYFy2DSvTYQ4R26cLZeZaZ92Dj8NKnCPqPtN+VGmT/XbBKUFhW1rDWLKERn0L72KDwxFJjpiX46x+KfOFQoN3o+KgN5ytCOQujrx37H8Mx9iSS9EiRZRea2jbgO1wjo8SO/TfMK9X7s2OnLLL229EdSzNDPqqAbjA9j34nQM9aGqlJMBdF+yCF2q5tpc52VyTFCwIV+24eCqGMGngRT7M0AyQ8D/vvI9NldEWtf00RgfvNI9YJqJah4K4f40nAV4676IUNip148mp5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTitNezrnDKbgE4kBBdKx2gTtn2o1x8IwApXxf94/gk=;
 b=OvsS6nbNa9xlNCr9C6jBrwUdbY1SCjs9dwudsRxTK3N9n/yDr4ZIMt/D8fgPupq/+7Knf08OMqonLz25Esll6SAma0v39gv1bia7JMNuyZqnpZPEhjOfxWob7pvSFATmuubDQxyugYqsQiKOW/Shc+55v2Mn11p9dTNyZCZ2mHi6m5uXve7ioOs2Dtl8G/PAfYu+h0kzS/El7+cUgkSQNOo5wvdbuKrIyawSFSF2KW3n1d/5PZKNo6UJHon8CEGaViWwd7fz3Ooh9jPTxHqtORIfJdN7eQAdI/P4dyeFvYTkdo9tK47icwz/eqeIxGjFQjvEd70Uwf/z6hnQ/EfPLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTitNezrnDKbgE4kBBdKx2gTtn2o1x8IwApXxf94/gk=;
 b=GIetak0DFGL4s5lrIHEdhqQ2oqS5QQpf6WAjdnBJkRcLgp2vmnDe4vTQDB4IWa8FxAhpw6ZR2XvlnNNeU6xnXa0pL09HfxU2r89Kh1oZI+8tZUFkQyGIqNyGp74b5BWKSpI0HMf00fZtB3k6EbzgM/nTPTOm9UI/hgrJOQSvOv4=
Received: from AM0PR03CA0025.eurprd03.prod.outlook.com (2603:10a6:208:14::38)
 by DB9PR08MB9539.eurprd08.prod.outlook.com (2603:10a6:10:453::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 16:08:00 +0000
Received: from AMS0EPF0000019C.eurprd05.prod.outlook.com
 (2603:10a6:208:14:cafe::f6) by AM0PR03CA0025.outlook.office365.com
 (2603:10a6:208:14::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19 via Frontend
 Transport; Thu, 7 Nov 2024 16:08:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Received: from nebula.arm.com (40.67.248.234) by
 AMS0EPF0000019C.mail.protection.outlook.com (10.167.16.248) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Thu, 7 Nov 2024 16:08:00 +0000
Received: from AZ-NEU-EX05.Arm.com (10.240.25.133) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 16:07:41 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX05.Arm.com
 (10.240.25.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 16:07:39 +0000
Received: from e132406.cambridge.arm.com (10.2.3.22) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 7 Nov 2024 16:07:39 +0000
From: Deepak Surti <deepak.surti@arm.com>
To: <peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<namhyung@kernel.org>
CC: <deepak.surti@arm.com>, <mark.barnett@arm.com>, <ben.gainey@arm.com>,
	<ak@linux.intel.com>, <will@kernel.org>, <james.clark@arm.com>,
	<mark.rutland@arm.com>, <alexander.shishkin@linux.intel.com>,
	<jolsa@kernel.org>, <irogers@google.com>, <adrian.hunter@intel.com>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v1 1/4] perf: Allow periodic events to alternate between two sample periods
Date: Thu, 7 Nov 2024 16:07:18 +0000
Message-ID: <20241107160721.1401614-2-deepak.surti@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241107160721.1401614-1-deepak.surti@arm.com>
References: <20241107160721.1401614-1-deepak.surti@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019C:EE_|DB9PR08MB9539:EE_|DB1PEPF000509F6:EE_|DU2PR08MB10230:EE_
X-MS-Office365-Filtering-Correlation-Id: c2b727d3-a336-4209-ce71-08dcff466264
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?6nrDMyYsVEdicetwPtPzqi5yyVJpMIDG925JUHWuPznpMyuYVoejACpxQ6ph?=
 =?us-ascii?Q?D9u0v/mtW4wtu1VARX7cbs9A+/MDL/o/hq5kiurCm9VUHxT2c2B6IakF3kDW?=
 =?us-ascii?Q?goi1Vo1S0J9b2cRkgfeArexTUtLihKyNCJfNPkG7cUPGDwGV/HTO2/7CSGU6?=
 =?us-ascii?Q?UmF9/q5Hw4+yq/r+K5Y3YqERL73ASwzSH8Td/IG25VN7uoddkkVb+4sZMYyo?=
 =?us-ascii?Q?hPd1c85ROy2PSyuMz9y0YFCdM6Lqf+P9b8b0WmKLqZZpWX3lS8jvJeRQ8jc5?=
 =?us-ascii?Q?onRsyB0w5Ic/ThmZpl3WdRHui9Aj9Nne28G2TcAKsRLZQNWfUcZo69YJxo1N?=
 =?us-ascii?Q?J1peInP2BDO23YXAGKtMDpDtTX1sm+ylRcU9uLIvDAWdY6Z6yI1ViVFvDd7J?=
 =?us-ascii?Q?yexJpnA92JFqmYDflatoEtJ5myQrrk2KJftaegqFdMvyUdnlk5DGjdrz36pe?=
 =?us-ascii?Q?37tz3iSdHgJXVmdtvjjBT4ukVUajQvJgiChIEooAKa+jwO2mXmO/HQ3F9pwJ?=
 =?us-ascii?Q?iwHKP9qYsaSbKqkiNhe4X6LfYXguZoS51gp7a14Qz8ZVV+KPRkovsHFqsrws?=
 =?us-ascii?Q?m8K6onu190bkdEJEapEDbeIwK5wm7ZuZgCyEFnY6AIFCN4VMx50uAabPafCm?=
 =?us-ascii?Q?tZXNXRHC77QUWa1n5HEKSokILjYPeIZl3OuKtXN5fsXa26AhF4CgYNPl2P4B?=
 =?us-ascii?Q?iuk9iAKYYQQq21EQCxd3PmS9VTPxzhDt3hlklI/QhopgXkr4SoJDYN2KkQVu?=
 =?us-ascii?Q?EEmQstMnP2YhBu6WGkMQZd0m8cOBt2+OkO0jNN7PE97RXL3ZZ6YCiCpx6PIF?=
 =?us-ascii?Q?VnA2GeI4fifWhdlw+AgBgIldXhweWQFAhFkEskX9BELwDZLmT/bGz7e4KVqI?=
 =?us-ascii?Q?FP+bU9ONsAlcEYAAMjwR91Kxu6vRHWXiwI2e2klDBx7bzzsczKCRYbP2Yqgn?=
 =?us-ascii?Q?y1RM4Qd96ANmSubWWtx/Moi64nf6EYNRqfsZlwDsHCUh2BzH3zBIuQUQ5TlW?=
 =?us-ascii?Q?o5Ks7Pc81+qKdx59wnYnBcuaddJupa6bDeHnkOXCCMXR7CweqZo0JYFi1ijZ?=
 =?us-ascii?Q?ZIOm1/GtE3IDC3CL3likA2M2zJANkarzM3eIyoP+7BjQGhVVUc/9MpqXNX0x?=
 =?us-ascii?Q?J8ApT0o54ePigSdNCR9jVZYkRR0sO7+Xe6Frp1tlu8HulOuM59sAsESRIWfr?=
 =?us-ascii?Q?lgZ7dme7j+fyvPDmoJf+KraG4NMjDVSTslkLVgVJQD9i8BUr4sKhQRfZxtVf?=
 =?us-ascii?Q?Vy8tnim+9Jg7Xu4yx9xXo++4tyz6aqca6a/RTHo8FIagCNUk9uoIQnQnNNrw?=
 =?us-ascii?Q?UsWylsulBGj+3t+ys4DvjdvYmZOANe349xxvRHO0gQkyJrN4SUatCRhgXoIw?=
 =?us-ascii?Q?T9VKPPrjMTLxHFITBVWXWH6fx02PYCctCXFweH3p6s2TWhXf4Q=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9539
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:208:14::38];domain=AM0PR03CA0025.eurprd03.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509F6.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 545309ad-36af-4957-2982-08dcff4659f6
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|1800799024|82310400026|14060799003|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1bKI71zKL7jeGyuKA/IaCx53+pDaVEwZfEaCRZ+gFAjZuT3MAFIxdF/nJkXG?=
 =?us-ascii?Q?7Mlxj+/adJ8MpJVwUxjhzVALBlM7Ty3V6o6qca+brf8SYhYbw1YZ0pJ660pY?=
 =?us-ascii?Q?rnA2L3/dhIB4pDuAl/7dRwniKe/r/5f45NFf2kaL0odPRjYERTgYO2NY2Iol?=
 =?us-ascii?Q?hwGwrtRN2AnYKRahcSHyyB7Wy/yEG3CKoj+uHHDCeScVfPsLGOytYioAa3MJ?=
 =?us-ascii?Q?7ahr0eZdOPlVxiu71iX2r1MT4wNsSq+tTdz2iU2RBNsNwosr+EemRi1HONTM?=
 =?us-ascii?Q?V/DpcDon1bkOXcsZ9KASjb7+FGfAn390xNNb5qn6z6gTd9bwWw5nE6XlEAPG?=
 =?us-ascii?Q?ZXrdOxtGmy7Cm+KMSmZ5cX7y+4fQCJqIlprs1Mq9W8kFxjugnsj7NYyb33mG?=
 =?us-ascii?Q?MzA5lc8rdTWKL/2im3G5yhcfMoRjX1Cd4eRvn/S7QyhiC0QGt1HRtLKH/7Ex?=
 =?us-ascii?Q?rNJtrQcI60xs6ZnANJJIJPT6R0gE3Q5GKR/2OvTTMvYE7UY7pEivvdEBA32N?=
 =?us-ascii?Q?yO/GiszEOJPdWFrfu66RzdNqtSu2Z+oY7J0QXGBMPqXiXbCHLehFkfaL27/a?=
 =?us-ascii?Q?feIcvIqidpUCbAdTF5rGpf71YhAtwhM+zlQbVzDXXGcx+0JvhZpaujuocFfD?=
 =?us-ascii?Q?2eZC66xv7nW6/Cvf8pUdDzrJ8fvqbUTNKUrLT3Xd8zXutv8mrxtF2VEmT6yW?=
 =?us-ascii?Q?qZVJ3K57NZt8EW7yTNQHhexFcTvsHsViLdkwxQ7BxZtd4L9vQYQN0rF9YJWU?=
 =?us-ascii?Q?mDLpB81kzVUuNO42Wxn/IlKdqm7sMhenWm8JuIMN0Mz21CEGo1wu4LaGO0Sg?=
 =?us-ascii?Q?UdgkGjopXgZ0cFYguiJNd0GA43tLdnbBN44Ac+lwLywRmwZr8h2MtLPvYK39?=
 =?us-ascii?Q?0squ5y0PCjjO2TeUU8XmhFwxxmZYFkrmJzLqBp7VuPbrh+J82c9WLM3eoHV2?=
 =?us-ascii?Q?HfbKRt4SJirGuhNcgrDR8owlzH/pUADWMVRV1BsnuNTnsxCVin4hbM+L/OuF?=
 =?us-ascii?Q?2Uu5xEUMwfh25CzFlxUnkwkTQaZJsx4dLxnr7KQKIScB+TfSeQT2Gpqh18Fu?=
 =?us-ascii?Q?ECmER/L+l03JLbchIpoc9Efb7cWs/P8wbbpSrBbEQ0VsEgpdqLLIBIADFLGH?=
 =?us-ascii?Q?OOtn8tKHrkZenNMn9SnGTf1GAp9A0c9fcnWI+40YUphxUpRh3kqktXJNDd5R?=
 =?us-ascii?Q?eZ8vilvT78NsdEFc/FDIDxiuEXndeEThdaqcrXs3SVwZRxhPXh8C6gbkCHDQ?=
 =?us-ascii?Q?WJDD4Uvc6z4PAKmXJC6FnQk2OccY/jMfPeJNIpRi66AhO6y0Jk5wA2jSCV8w?=
 =?us-ascii?Q?P9X52LDwKZrHQz/ueQNMr/b9pBfoACZRhQTiAhABqlUafIuMBSG9dZu5LjkW?=
 =?us-ascii?Q?0C00JSoBchfcHRiC5tWIsiSmdeQiZ6R4lLngtO5NI4KufxDJIw=3D=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(82310400026)(14060799003)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 16:08:14.3335
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2b727d3-a336-4209-ce71-08dcff466264
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F6.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10230
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_080821_191547_885A3CC1 
X-CRM114-Status: UNSURE (   7.25  )
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

From: Ben Gainey <ben.gainey@arm.com>

This change modifies perf_event_attr to add a second, alternative
sample period field, and modifies the core perf overflow handling
such that when specified an event will alternate between two sample
periods.

Currently, perf does not provide a  mechanism for decoupling the period
over which counters are counted from the period between samples. This is
problematic for building a tool to measure per-function metrics derived
from a sampled counter group. Ideally such a tool wants a very small
sample window in order to correctly attribute the metrics to a given
function, but prefers a larger sample period that provides representative
coverage without excessive probe effect, triggering throttling, or
generating excessive amounts of data.

By alternating between a long and short sample_period and subsequently
discarding the long samples, tools may decouple the period between
samples that the tool cares about from the window of time over which
interesting counts are collected.

It is expected that typically tools would use this feature with the
cycles or instructions events as an approximation for time, but no
restrictions are applied to which events this can be applied to.

Signed-off-by: Ben Gainey <ben.gainey@arm.com>
---
 include/linux/perf_event.h      |  5 +++++
 include/uapi/linux/perf_event.h |  3 +++
 kernel/events/core.c            | 39 +++++++++++++++++++++++++++++++++
 3 files changed, 47 insertions(+)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index fb908843f209..9910b3c115d0 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -270,6 +270,11 @@ struct hw_perf_event {
 	 */
 	u64				freq_time_stamp;
 	u64				freq_count_stamp;
+
+	/*
+	 * Indicates that the alternative_sample_period is used
+	 */
+	bool				using_alternative_sample_period;
 #endif
 };
 
diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index 4842c36fdf80..bedae424ba36 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -379,6 +379,7 @@ enum perf_event_read_format {
 #define PERF_ATTR_SIZE_VER6	120	/* add: aux_sample_size */
 #define PERF_ATTR_SIZE_VER7	128	/* add: sig_data */
 #define PERF_ATTR_SIZE_VER8	136	/* add: config3 */
+#define PERF_ATTR_SIZE_VER9	144	/* add: alternative_sample_period */
 
 /*
  * Hardware event_id to monitor via a performance monitoring event:
@@ -522,6 +523,8 @@ struct perf_event_attr {
 	__u64	sig_data;
 
 	__u64	config3; /* extension of config2 */
+
+	__u64	alternative_sample_period;
 };
 
 /*
diff --git a/kernel/events/core.c b/kernel/events/core.c
index df27d08a7232..579b04af70a2 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -4185,6 +4185,8 @@ static void perf_adjust_period(struct perf_event *event, u64 nsec, u64 count, bo
 	s64 period, sample_period;
 	s64 delta;
 
+	WARN_ON_ONCE(hwc->using_alternative_sample_period);
+
 	period = perf_calculate_period(event, nsec, count);
 
 	delta = (s64)(period - hwc->sample_period);
@@ -9806,6 +9808,7 @@ static int __perf_event_overflow(struct perf_event *event,
 				 int throttle, struct perf_sample_data *data,
 				 struct pt_regs *regs)
 {
+	struct hw_perf_event *hwc = &event->hw;
 	int events = atomic_read(&event->event_limit);
 	int ret = 0;
 
@@ -9822,6 +9825,26 @@ static int __perf_event_overflow(struct perf_event *event,
 	    !bpf_overflow_handler(event, data, regs))
 		return ret;
 
+	/*
+	 * Swap the sample period to the alternative period
+	 */
+	if (event->attr.alternative_sample_period) {
+		bool using_alt = hwc->using_alternative_sample_period;
+		u64 sample_period = (using_alt ? event->attr.sample_period
+					       : event->attr.alternative_sample_period);
+
+		hwc->sample_period = sample_period;
+		hwc->using_alternative_sample_period = !using_alt;
+
+		if (local64_read(&hwc->period_left) > 0) {
+			event->pmu->stop(event, PERF_EF_UPDATE);
+
+			local64_set(&hwc->period_left, 0);
+
+			event->pmu->start(event, PERF_EF_RELOAD);
+		}
+	}
+
 	/*
 	 * XXX event_limit might not quite work as expected on inherited
 	 * events
@@ -12244,6 +12267,12 @@ perf_event_alloc(struct perf_event_attr *attr, int cpu,
 
 	local64_set(&hwc->period_left, hwc->sample_period);
 
+	/*
+	 * alternative_sample_period cannot be used with freq
+	 */
+	if (attr->freq && attr->alternative_sample_period)
+		goto err_ns;
+
 	/*
 	 * We do not support PERF_SAMPLE_READ on inherited events unless
 	 * PERF_SAMPLE_TID is also selected, which allows inherited events to
@@ -12700,9 +12729,19 @@ SYSCALL_DEFINE5(perf_event_open,
 	if (attr.freq) {
 		if (attr.sample_freq > sysctl_perf_event_sample_rate)
 			return -EINVAL;
+		if (attr.alternative_sample_period)
+			return -EINVAL;
 	} else {
 		if (attr.sample_period & (1ULL << 63))
 			return -EINVAL;
+		if (attr.alternative_sample_period) {
+			if (!attr.sample_period)
+				return -EINVAL;
+			if (attr.alternative_sample_period & (1ULL << 63))
+				return -EINVAL;
+			if (attr.alternative_sample_period == attr.sample_period)
+				attr.alternative_sample_period = 0;
+		}
 	}
 
 	/* Only privileged users can get physical addresses */
-- 
2.43.0


