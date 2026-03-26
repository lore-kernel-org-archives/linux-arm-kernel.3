Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8472510AB802
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 18:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=70dx2TmCW1kN7PAsE0EPd3QnAagndkpU7G4X0MLAceM=; b=pjsq6tqEOVvMuFOJgGjvivK4Gt
	HJn87eCkQVYXFlXDWg2EP5t+ztul5wrQl7j0zBVamytR/+Ob0uI11A+w0A0EA3GO3cTvVN3socuO1
	7oBo95JpjpFXhQUGJ9OZ8RbtVNOS7VaYypG0HC8IAFUTpfQ2VmQaCGunorgJO/ELclUvo+PMT6l1f
	hTBayfBjErWZgbZnDHHvbPrEmMQQxH3sLZ2ph8coIzxTiPorg5No+z5E6rP8d3tMhauFdeRcntyr7
	JkNkhAj5KxthxVsWkOUJmdWq55qdMGB6FVz8dmC31RqP5fXf7T8iHezvTs78x8XeGuYK7e98a0cQf
	/F0Hes9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5pre-000000064Vc-3K46;
	Thu, 26 Mar 2026 18:55:30 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5prb-000000064US-33Tg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 18:55:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VCD8wH/ThRxkk4QrlaT4HxjQFXDspyiD1XQ9CUjnR+wt8qFftmoukQFBErX+b5g/rq32pR0IShhsRH6qbz4bZ+fWxBz51Sw6mvnXRqKFim4m2PozG3eMcWeKULQOQliIwYYxwl2FoMkVRL8JP1bj7sAq1r8JSS6KCthLqztVvmQgu2zYmRDvbkQZaGY1EDLdyC83Mo5j23BeQ9LO/uVwKQpJTI8DHoRNNqoW3pgODW/nGumE41lQ23XHwVwu9IF/hRZ+xkxkHnvsWKs1heIFF5vbdngIs/2vqmv0hV1WhsZlrK3GuJ+BzM0dpcrfj2VukXpAspVJHX5j800bRUqu+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70dx2TmCW1kN7PAsE0EPd3QnAagndkpU7G4X0MLAceM=;
 b=M/HfgSCCYmiL26u54teGoyBi6YjoW8RFFktVYLJQMtWXnOM7crnU9+vSmHbOfraBSvrZ5sznyLTSWowiqFLHbMroZTXyd+B2YGwBZEy2uGR/rLe9ZjvfYREo0HyDMm/QQxJZBpC6at2n5QY2lPSfa7LfoUKg8j818SYet/IPKgYWDHFF4+9wDyAKCqONJ8ThCxOaIKzWu+hz8CgwolVSxZA/nS3e3Xg3N416xLWRJcGl7E4bEclI6A7sfsktjckptWvXlKdyDZ7LzT86D1ZlqUwQsKI8PVgkK7x+V0QhG1W0DEIcKgY929nyO35aeVFCSSkC9OblwRSM56KkSsPApw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lunn.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70dx2TmCW1kN7PAsE0EPd3QnAagndkpU7G4X0MLAceM=;
 b=eaUxL8BwydYqy6vOJb2MgwRG66stTafIxy8EmHsRmEbx6dfR0bjIzPRCn5KOXd4ZwpqPUeT+QqcLU9rpJE56F9JV3+ysvKE2TbwvIm8FaoNJ7eQ7NGgk/RzZDC3lPc7XZOQxU/mhxjg4BV7it3jiedNs6nKCCIw2kBUF3ytaQyM=
Received: from BN9PR03CA0415.namprd03.prod.outlook.com (2603:10b6:408:111::30)
 by DM4PR12MB8498.namprd12.prod.outlook.com (2603:10b6:8:183::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Thu, 26 Mar
 2026 18:55:17 +0000
Received: from BN2PEPF000044A0.namprd02.prod.outlook.com
 (2603:10b6:408:111:cafe::6) by BN9PR03CA0415.outlook.office365.com
 (2603:10b6:408:111::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Thu,
 26 Mar 2026 18:55:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044A0.mail.protection.outlook.com (10.167.243.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Thu, 26 Mar 2026 18:55:14 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 26 Mar
 2026 13:55:14 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 26 Mar
 2026 11:55:13 -0700
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 26 Mar 2026 13:55:10 -0500
From: Suraj Gupta <suraj.gupta2@amd.com>
To: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <michal.simek@amd.com>,
	<sean.anderson@linux.dev>, <radhey.shyam.pandey@amd.com>, <horms@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <harini.katakam@amd.com>
Subject: [PATCH net V2 0/2] Correct BD length masks and BQL accounting for multi-BD TX packets
Date: Fri, 27 Mar 2026 00:25:07 +0530
Message-ID: <20260326185510.3840084-1-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A0:EE_|DM4PR12MB8498:EE_
X-MS-Office365-Filtering-Correlation-Id: 20ce70de-413f-40b9-ab6a-08de8b693716
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: osh1OPd5W+A0u8Q2IbTwL7p6UxsG6emFiYj6IVMCk+cCEL9/o2DwQ1l73+cPtzIhNM9QKO+cOUl6stWzHUapzfoOuBMOMXn3EgY36XM0x4esUehstHxHqLVumsIoAs0oav59+3Z0fgK46MDQt9cRD5xWQzTZu5ztY7PnyCg7uUSwELAr7oxnSDvqhDh6PC7ouAEutAL3tfwTT30ZV4aCtM2bKY0tin7NRMtGFu1L+ZxLMm3c1iwN/uV7t+2OZ8zdj+BzKutkhz2BfXaCWZZanhS1A0tCvWJ5Jmflzod6aFsC19snv66IyAvZwnAAlVJDX8dQENKqRnyRIgbeaASBONS4HJ0QPRX+YuwVRZ2HcgeBQhTZ1E3RTLv6RdzsDwrRsgcZ5iw+KnGkOksnQOwQEG7CBeSncFrNqWKzBmzOlaJxqXe+3Lc/YMpTESJiQXl1xXunI9NQiR21U0tn6QtFrMXigDzKoatypisoFedsoUqZrnCwYEft/TI9HP9RStm4K4T9mnH5nJbcxi9YtmmNscuz7g8NFs+pdiD3a828u4kV5c2DIT4vkDsib6fxMBUZVoMrujQp016wZIASAyQzuukTtW68kzA4nCj8pLMWzx2O8VUz2O57XVZYPVhqyBf8sfz8kZvE0VvMEn5WT4EDLgWWmgHIh4Y3cWGWHewvekQb94rm9pkdOtw1oBy+mrbk6qUWJvMeHKo1huytMbaWzZRYdIXO4oaJjyJguEjbCG/kGCGrbzFifs1lPBhaYoJVh651T8OACmGiB26JCzkYkw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: q2XVazAeif4JOuNZMrOkM0yjnzYj5VJyD8m+YvxhUveHhj9lXaUFnTYYnIMDYIZjRiVvO+/DB3RAYRQnwFfjrp91WBgC4HW37avS89V26Z+DtG7TJt2YSs35dqRuhfaLai3ZwCjhEWTvZq7faTusiREOEgAgU4QyfxKczHGtmrETzJSYIfrGhkuWh1N/MvgP1m7GIJB5IyYegs5qt7YU3OYM6PP0xS2nCUlRKUcWfoINSyykkXqlP1j/qwVAJqDMRrn3WXp2kyd7hcVqhd240CD7KE46Di/gLIP+Z3dQ0ieSXHo7GlavQsqh2aDvAlFQIzdPgoqo+XZRDuP8dxj7sIii1LtIrTMXevcURxjq4yeMnU5HUAS9pMx31AXsPVmt6lvbR5WBzLQIHxPcI5HMOU8ajSIceQCaFxuJt8d5HTQ3fHoKr/b6ujpJUDeROtNc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 18:55:14.4838
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ce70de-413f-40b9-ab6a-08de8b693716
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8498
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_115527_768945_285CB2FB 
X-CRM114-Status: UNSURE (   7.72  )
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

This patch series fixes two issues in the Xilinx AXI Ethernet driver:
 1. Corrects the BD length masks to match the AXIDMA IP spec.
 2. Fixes BQL accounting for multi-BD TX packets.

---
Changes in V2:
Use GENMASK() to define the BD length masks.
---
Suraj Gupta (2):
  net: xilinx: axienet: Correct BD length masks to match AXIDMA IP spec
  net: xilinx: axienet: Fix BQL accounting for multi-BD TX packets

 drivers/net/ethernet/xilinx/xilinx_axienet.h  |  7 +++++--
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 20 +++++++++----------
 2 files changed, 15 insertions(+), 12 deletions(-)

-- 
2.49.1


