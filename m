Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EEB7C02190
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 13:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FgaCamHnxvPMXaZFSAc1/BOzJH3l89NFFvdMd2pfmO8=; b=bUqDoSyJg8CCNAUP4zRuncXWPT
	7vGwEMUt+T5TtyaLf0L5PVMe8F4YS2qmMCHCun9W56JjisVsyGyBkSfLjh6C5TtTW1m/tMVxngTxh
	S3vE9C0zx8NFoh4SpVtUtH+VYamxLSp8WAqRlaLS+lCHe29huu0yv/rpHVJswqrXNptP8SJE9ismv
	ZcKJQIEKcliJ8KOALM1gBzsWvqMIRpsc7j3JnRduTxtS2GyeVF0A+mlhCO4pfc7T7t/eNJvsDMeE9
	q84/7EuvXpU8EY15gVOPWnHYnJkz8oqBYkPMGd52euPgSNOui+5g2TNCe3+NYcWMQY3GEbWV56u5L
	X5rmuVLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdUNl-00000008pwH-3fBX;
	Thu, 30 Jan 2025 13:14:57 +0000
Received: from mail-am7eur03on2060b.outbound.protection.outlook.com ([2a01:111:f403:260e::60b] helo=EUR03-AM7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdUIe-00000008p2X-0ZeJ;
	Thu, 30 Jan 2025 13:09:42 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Mo027iOtIOwBO/AsKToCnIMswMqET4MgHy2Z0ToZ2wHcfHCZwn3SOo1PR8koiOuAQH3B4h3siguZzEdN/vVEZbboWpcgt2s72b1iCOCQ3EwkCmXzpb+SJjHByokk+1riguLj3zVylNzF6iRRrg22+8ghVTSn5O+dnQj/1y3m4OtGe++aa8aCZe09toBJBIDjMtVABgDDo7MVPAVlCVecxLF3jRkddpuCIolGqfTx8a8KFW4g6JGURfquUyiOoxlVtZDLPP8/BvR6Zv6u10j8/AmcSxMLo1Zea+mDxOidsqQnPVSlhEloArWhf/dKMhwopW8ZxisofHNgAB6T9abKhA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FgaCamHnxvPMXaZFSAc1/BOzJH3l89NFFvdMd2pfmO8=;
 b=n/zJXn+yX0zRV7t5hKSJbeLgDSoRJzGSSzc45UELjvw4t9mVv+5T+itpMJTGG1fGKmOMwf1d9U31nK7as5DFiLwvPqK7H8r8M6pe67rVLiq2eFK0m0KrtJEwYg7Tg+DSL4/c2oK1NfiUW52P5170Lba1SWuCrzCJQYqjpKzh3kkdplRkydTpGsEzdFP+A2T+osLfNCL9P0nkL+Y9xnKLZWHH3EtW+0xcWbwbNIhe9YA5ZCA0Oh3Q4R0SU2gaeT3QdyRM2vYcgOwLwSwUYfIDecq21vXR3t6r9R6hEmBua31saTQdG/h2KmYKdbQW1X2JA1okwyv4O5Jvia5tHFsrww==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=0
 ltdi=1)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FgaCamHnxvPMXaZFSAc1/BOzJH3l89NFFvdMd2pfmO8=;
 b=dmC+bpbqsqNQNwGSG8FQ0oaJwBR6z8iZ6lnDuLWWxDwOequSaClXVdbfZXxqBNJNMbXXaSr4R+Te8pFJ8HeXIrQjQBeLnwXybISI5+3hG3mmisqfJ24OOm3YmKQIMPy1HA/95d9nxKuq6jwpQ/GuyV9/VLObdcpxNl3lPrbIl5g=
Received: from AS9PR06CA0013.eurprd06.prod.outlook.com (2603:10a6:20b:462::17)
 by PR3PR08MB5610.eurprd08.prod.outlook.com (2603:10a6:102:91::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 13:09:32 +0000
Received: from AM4PEPF00027A6C.eurprd04.prod.outlook.com
 (2603:10a6:20b:462:cafe::e4) by AS9PR06CA0013.outlook.office365.com
 (2603:10a6:20b:462::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.20 via Frontend Transport; Thu,
 30 Jan 2025 13:09:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A6C.mail.protection.outlook.com (10.167.16.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14
 via Frontend Transport; Thu, 30 Jan 2025 13:09:32 +0000
Received: ("Tessian outbound 671aa0ad34c4:v560"); Thu, 30 Jan 2025 13:09:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3b96bd91acacdd57
X-TessianGatewayMetadata: qoVaNJHo09g7Nr7WiHlnEBFdWsRJB86Jj/NwpEIIV1Qq88fWkjIEUWHk+pCw1TL7pUy+TLEebcJOBSpZN7EgS0ol5XZzuTyDaNnuFpQ6xF40pIoQcfXKCTIdNoBADG1ONgGHHMq20bCs8l4tVPN+DvhO2Hy6iQETymIfAALxHbX4frIPiHLUbNYM2hvY+X5J7eSYGku2M8AuZnlReqTqeA==
X-CR-MTA-TID: 64aa7808
Received: from Le713702a97a6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 53CAB092-6D8F-46A4-93F9-AB52E14BE0B5.1;
	Thu, 30 Jan 2025 13:09:23 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Le713702a97a6.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 30 Jan 2025 13:09:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NcYGZlKtG/CiW2quSQm53ORx3ZwKWmz5l/J/qsZAdT96OM/1Cly36e1DrVpOrHtRpTcYGc31DLUsuzkpONfyiNpH1ovmGek3BntuXp9NO0VCHvsZRhlUsc4fFnWVdocmEfgHrZFPiUVlzuSUPK+kHQ56Q07ep5u3MLhh/gFBsr0OYm5e8CTYQzeGF7iGGR/z6qZ8e2Uwlco6JGtYOs4pUosIWk1q5vC+7H+iK/C5X61rXyWMJ6km5pFa302DMUgp/3Z5POXykrXWd1efcAC97BKjLNORXuYUJy8VW6kC1+LZGe3Pb+wnZe/k5Nby3KBMO2yF34SxzGuNHn7bOInd1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FgaCamHnxvPMXaZFSAc1/BOzJH3l89NFFvdMd2pfmO8=;
 b=D0WhO/Q/XdUsh8ikXb/MvammaXbC/hohJqZdJ60/yhGBjTGaD++zetwSHqRXRDiGA0VQctwhvbGWtI48aLGOLsAPryXS882x83K1X1gBhg6fTZkc9TJV5Weg2bfbGsHHeX3YW4CQXjHxLJjxHkuhw+Uv8ciKEWtCS8ywMewO7jDIhYaR0unFnEW8i3wXzwd61TaxbcKe533CHAsWxRZ86EFefDw2y/8QvSP9JgHYs3THlAPAevqmwfVvw0CkmsHq5FmUEnKIyEs7CR1vqILbiUSz0dcDCwJZpJ5BUrRfqZXfxcdxzY/m9uVg6ToUvb7sM4poFbFX5pBZT8DoSjjROg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 172.205.89.229) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FgaCamHnxvPMXaZFSAc1/BOzJH3l89NFFvdMd2pfmO8=;
 b=dmC+bpbqsqNQNwGSG8FQ0oaJwBR6z8iZ6lnDuLWWxDwOequSaClXVdbfZXxqBNJNMbXXaSr4R+Te8pFJ8HeXIrQjQBeLnwXybISI5+3hG3mmisqfJ24OOm3YmKQIMPy1HA/95d9nxKuq6jwpQ/GuyV9/VLObdcpxNl3lPrbIl5g=
Received: from DU7P194CA0027.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::7) by
 GV2PR08MB9374.eurprd08.prod.outlook.com (2603:10a6:150:d0::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.20; Thu, 30 Jan 2025 13:09:13 +0000
Received: from DU6PEPF00009525.eurprd02.prod.outlook.com
 (2603:10a6:10:553:cafe::e2) by DU7P194CA0027.outlook.office365.com
 (2603:10a6:10:553::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.18 via Frontend Transport; Thu,
 30 Jan 2025 13:09:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 172.205.89.229)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 172.205.89.229 as permitted sender)
 receiver=protection.outlook.com; client-ip=172.205.89.229;
 helo=nebula.arm.com;
Received: from nebula.arm.com (172.205.89.229) by
 DU6PEPF00009525.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 30 Jan 2025 13:09:13 +0000
Received: from AZ-NEU-EX06.Arm.com (10.240.25.134) by AZ-NEU-EX06.Arm.com
 (10.240.25.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 30 Jan
 2025 13:09:06 +0000
Received: from e121164.cambridge.arm.com (10.2.10.32) by mail.arm.com
 (10.240.25.134) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 30 Jan 2025 13:09:05 +0000
From: Florent Tomasin <florent.tomasin@arm.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Boris
 Brezillon" <boris.brezillon@collabora.com>, Steven Price
	<steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey
	<Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T . J . Mercier"
	<tjmercier@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yong Wu
	<yong.wu@mediatek.com>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<nd@arm.com>, Akash Goel <akash.goel@arm.com>, Florent Tomasin
	<florent.tomasin@arm.com>
Subject: [RFC PATCH 1/5] dt-bindings: dma: Add CMA Heap bindings
Date: Thu, 30 Jan 2025 13:08:57 +0000
Message-ID: <771534be8dfa2a3bdc3876502752f518224b9298.1738228114.git.florent.tomasin@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1738228114.git.florent.tomasin@arm.com>
References: <cover.1738228114.git.florent.tomasin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: DU6PEPF00009525:EE_|GV2PR08MB9374:EE_|AM4PEPF00027A6C:EE_|PR3PR08MB5610:EE_
X-MS-Office365-Filtering-Correlation-Id: 96cdd02c-9f83-4114-b457-08dd412f5661
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013|921020;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?kp7y9OlcNnlxCGnxZwdQsMAB37oeT5uUdoygQ5PD3ph0+XkNzmSYUKIvo1Rw?=
 =?us-ascii?Q?vj7CuGFQF9RsvFkRJvRVhl6moydjlfwp+6lTi8xaBVFPL/fnvV7BC9Lb8HBe?=
 =?us-ascii?Q?bBabXoZ0XKkW705JdLXytHzZCA9bEUA5qAQ9PlJnc2374P8Q5Ovivfu2O5fQ?=
 =?us-ascii?Q?iUUTo3NKkaWAD0B5oT2PDbBGvlu0W1chD+9nmd5umC0fd/yh5eAZc8RacAne?=
 =?us-ascii?Q?05jvopguUjipA5u1HlJSytE0VQCkyqHk6NnUbiU+pRismDuh7Z+JNo/04G6U?=
 =?us-ascii?Q?iP1Dt11x2g9M/w6MHJKQD1+Pfq2J5Nh+ywbrrKh5ONG2TwAny1kM3vbEwcJn?=
 =?us-ascii?Q?CYdwKGte2csmQThyJlmfDF0ktDhDs6TlaZaj2i+7O87IM3HodFzf3BdfFvsR?=
 =?us-ascii?Q?gsFfzvio/OfYQdIYmqb13ZYIKzXcD0DTKF8Mt5zGZNkJA/fZTX2eXH2JxzRi?=
 =?us-ascii?Q?pdz+JmF5yN8gKnphfzNHky2jUW64ydHf9NRFc/YhnNwTA7aTjTjnAf2WCi2C?=
 =?us-ascii?Q?F+FD/8OeLVZomq9s65jFPpUrpqELjJAoQezS8y+TKKzual1ZcQwKOMr5WESC?=
 =?us-ascii?Q?vtzehZQbj4Bd1t0H2DnGP+xGke3ft6WKTSPadthR2PKcXa983DtMN6sHGiAI?=
 =?us-ascii?Q?qC/PT3E3gYnry8gJ39Y6eUzO3T+9UoLf7hJuegXMaljtSJgrBU/zcc2lN/XI?=
 =?us-ascii?Q?JDTzSOGrRrtvNflqmYHD8q+9oNG5f6QOZ9fLW2fFHGQGJ1kQPyTdUHRzn7Di?=
 =?us-ascii?Q?9rWukmDYF2iKBX4BmgZENboTuTFxRZCkmAuVHuwXWp9U32cKBMmeqQZAXd0S?=
 =?us-ascii?Q?XNVms56q5/Rv9u92OJne8U7vEb8izzeA60A1jXCNGk+wAXdeQAx7CAMf8F0T?=
 =?us-ascii?Q?/c3z7X88mzK5NzxeDQqJXKtkLXAfCjhYjLK3TyAeVmAvu5l5iw8Ldyifs8n7?=
 =?us-ascii?Q?PQRzEf/36FkM2wYq0OJsuV4w5Vv3Fkj5uvY3XjBqo+dyokTHl2q6/b+Mm45W?=
 =?us-ascii?Q?477f5qiPIau56UvBAnVPGXQpDeUsM2q/PLTc+UTVCauz9UjEibTW/9Yj62Rz?=
 =?us-ascii?Q?UmiEw6fhkhKGprpFjx0CsXrB26CO4TYkIoyN3rEn6G+Jv4UfTpcTHZGe7ZRy?=
 =?us-ascii?Q?Y2lf6RMYMFC/AvFW+go0r5ezEjsKEDRJtIhiZfjFE0KfiU7y3Ur0ixgKF2Oj?=
 =?us-ascii?Q?XULmlEhPU0i1o0EIJ6Dm0bVHjZuWRoLCayxCdf5ZvxvnH04HydeTtXbphzH1?=
 =?us-ascii?Q?LJ4ZOabhm2et0uAEkZnTFwHPLBnuLKIKtiQl8HtDs1hj0CEt6VVYjJzgGGww?=
 =?us-ascii?Q?YdhdjS645rlwhKFsE4izav4zGBX0r+FP0D2Jgmz/rYs9VXJJjsPN27pfDw5z?=
 =?us-ascii?Q?/cwf6YAVHmL7lN9qzjqB9fhp5CegXNaskjko6SHoQV2av1nJFeMbqsZ0r3R4?=
 =?us-ascii?Q?GgTu3XoYa5ktMxeN6jl3m6tJ7yu0gfP9?=
X-Forefront-Antispam-Report-Untrusted: CIP:172.205.89.229;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9374
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:10:553::7];domain=DU7P194CA0027.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 250177de-9e0c-40fa-488a-08dd412f4ac8
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700013|35042699022|82310400026|14060799003|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?td35FtwrX+BZ7f2ZZ8AU4diJQLHOcbmBidMAsSChKMZbl0DmWlNGyzaOKwT9?=
 =?us-ascii?Q?ByvPk6m5XTV37eKdooOBsawpaS53KAER8Zl2QLHVUs2HuJs8aQbP00fkxWW1?=
 =?us-ascii?Q?Hk6iYsJqmSVk/gOjBAASFxF7KDDG9yz5GQAKH4Ow8GcMYg6kZ8qWqqZzrx9x?=
 =?us-ascii?Q?OvXgsbCLOfJfjfbbGACJ+B+CMSoIZvRyehiBSOZkSW9nWZIe3tC//oLhggDC?=
 =?us-ascii?Q?gfEblPD1uloFSMkuDyTfHrKWriR+HSk/uglHe9vtlBol/mVjQYLbWVorV8/L?=
 =?us-ascii?Q?mjb8V7+nVUr4KinErPV/qHjinuyOxJu+lKuQ/Bn7a7+ODVqtdw8KCisNbf3Z?=
 =?us-ascii?Q?vcvh/Me7pZ8b3iezOTZ2jqikzMcplmDxSCgnwNneJm6FrA6Jq9MlPaixBRKc?=
 =?us-ascii?Q?QxzDNSfNIWdSKXPneocB1bW/5Q1IWLGEbzKfO1wxVdlzuzZTcMg4hDap3ICe?=
 =?us-ascii?Q?Z/NBYA6EuzhVKHzh3JYzOm2wbshKG2XfIT5wJ9aa7N5geRGhJde3bqqAgiDi?=
 =?us-ascii?Q?k4Y1QsmeAFpN9aOWXrucnmIn9J/mGkiLATqoNm7NNJLEGqMYr0pymagDO32o?=
 =?us-ascii?Q?DYeSkY9fGmmLhkIN4dceNhyqJIBXhaKkkMQgfzl9IB0fYHCD5p49CIYBWTbn?=
 =?us-ascii?Q?dqvQWNEbXTchfeGreNzUYp4uqAYa/HLoqNtaPE7lX/Roo2to2T9PwIOOrah7?=
 =?us-ascii?Q?QkAfvMMJEkmDKRBjzXo9kq1F5nYksoNFTh1r7qV+befbZVzNL4LRSJQ+lZSi?=
 =?us-ascii?Q?IvR6iMFmNecVKQ0MRM9NKv/sHtycYzeAefQdW/4SE7A8/UFo2kRCujidLvvu?=
 =?us-ascii?Q?sfHqyqjEayVVv7wJ28E7UwunQWfx+PPYZKA+48gUn9nHYne1v4+pRkRBJ7ci?=
 =?us-ascii?Q?yXxmopl96jtEbeOkhmMNC4c5OIXCxjfZtn8FmNNTrvoOZhWqqFCYPG60qzNa?=
 =?us-ascii?Q?4bgNhisc+NipUnG04McRTD2d6x2VzJGMvg8B9fm7hWgG2j6oxnj9X7/Bw/Wx?=
 =?us-ascii?Q?dVTeUQ07NK3422meAMFvYvA3cmN0JCVjwfGIIhO/WFQq33vTntP+wp3af5c6?=
 =?us-ascii?Q?kNvbd1QXCoQvsXm0BcIc7r3N7EBpcfhvr4RLDlJ+6/6uHZR9ohTZISZgLVUj?=
 =?us-ascii?Q?ryOBJA7hp5ErFNlh0A+9d+ApZ235OK0Sv0E7Q+ttw8/Y92vqhVzOmRtfWwmB?=
 =?us-ascii?Q?rGb157IDeJmhbYGjMXKULuYIy/JThT5fJ7UkZSYfINy1vz6fUum2ntL/kUpD?=
 =?us-ascii?Q?T6Fgxy+H8lSdMxuWLGtGOgsvSOPaUFsZuKF5TXp6hydVtvlzShRfVPWRdgTw?=
 =?us-ascii?Q?JPkBhqOFNr2I9H6dnMPcmbFSIuJs0UKAUrS0ZxjFcxMRy/yrWDX/Z/JJArhJ?=
 =?us-ascii?Q?IkaH1wwC3t260UuxnQg3hVSGrb7CM+nhAdIUnI6UOYPOOBeTJB9Z0G33fFDG?=
 =?us-ascii?Q?w3wZ/TDfO83EXNV6G6UWcO7ATP5oaTns?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(35042699022)(82310400026)(14060799003)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 13:09:32.4365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96cdd02c-9f83-4114-b457-08dd412f5661
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5610
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_050940_335698_CC81C450 
X-CRM114-Status: UNSURE (   7.82  )
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

Introduce a CMA Heap dt-binding allowing custom
CMA heap registrations.

* Note to the reviewers:
The patch was used for the development of the protected mode
feature in Panthor CSF kernel driver and is not initially thought
to land in the Linux kernel. It is mostly relevant if someone
wants to reproduce the environment of testing. Please, raise
interest if you think the patch has value in the Linux kernel.

Signed-off-by: Florent Tomasin <florent.tomasin@arm.com>
---
 .../devicetree/bindings/dma/linux,cma.yml     | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/linux,cma.yml

diff --git a/Documentation/devicetree/bindings/dma/linux,cma.yml b/Documentation/devicetree/bindings/dma/linux,cma.yml
new file mode 100644
index 000000000000..c532e016bbe5
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/linux,cma.yml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/linux-cma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Custom Linux CMA heap
+
+description:
+  The custom Linux CMA heap device tree node allows registering
+  of multiple CMA heaps.
+
+  The CMA heap name will match the node name of the "memory-region".
+
+properties:
+  compatible:
+    enum:
+      - linux,cma
+
+  memory-region:
+    maxItems: 1
+    description: |
+      Phandle to the reserved memory node associated with the CMA Heap.
+      The reserved memory node must follow this binding convention:
+       - Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
+
+examples:
+  - |
+    reserved-memory {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      custom_cma_heap: custom-cma-heap {
+        compatible = "shared-dma-pool";
+        reg = <0x0 0x90600000 0x0 0x1000000>;
+        reusable;
+      };
+    };
+
+    device_cma_heap: device-cma-heap {
+      compatible = "linux,cma";
+      memory-region = <&custom_cma_heap>;
+    };
-- 
2.34.1


