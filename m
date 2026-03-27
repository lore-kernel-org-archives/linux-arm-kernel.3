Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D6510BA435
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 07:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7Lw3Xr3tzeWhm7IMeEFBS4oGCg0PVxBCcbz9CNMfMas=; b=2fwKxwEidhpXEt2ovs/zja/8b0
	8bBLRlmBHWvCzxusfGYf375baOvkhXfOaVe14CeDGZsLs+9HJDYgwQWZLrn79BRoq5xP9E19RHkTs
	UpuskgS9t+9Dzia57EncqXfvF53Ur7htgaWw8RO/NY7Sxg62MAimka1lznPDICOexBEzVvokYjAdg
	gQf7pqUw4YJTnNsTRHhmE39EBm84eTYvLRv50/t4DEAXZq+dmNa6DIgZLMADSBlozkKwNiNix+NFF
	WUUTK/TLrfXWPGYKzKgu3C3hdCkPtpOp9YuHTf9QNk27s/3eYY5VTFpSgs2BsNZujMqvGz/IOOW6b
	vh+KGfgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w61gh-00000006tVd-2WJa;
	Fri, 27 Mar 2026 07:32:59 +0000
Received: from mail-westus2azon11010004.outbound.protection.outlook.com ([52.101.46.4] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w61ge-00000006tUx-3LYx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 07:32:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YCOtdM6YCZDJLPAJ8FYnucz7H7z458aIzYsVGDHq+VRX1tb2xHEv7tF4+73QETdN+SP6WdF+1cuPx2SuKJDbbkqxP434yiRjFGGaxUjHf/Bkl33fqrtZrbWp+13jSwtoMUVmDfElQrQONkIw2V+7jocl+iCnfdsLHVXIDKVc6KWezJfbdxTHIeBw2eXsxxqmLmNwMtglUtkq52uFSYLXkuwAKK9i8UD3NhcQcW0hzYsGh6C9iVnHIztxHppLOYIbqPU0mswg1hAFXqFQ0lzZy3lVQeiJKF1T/W0ZF6vpT9NAfJUe9BhQFH3bnDgUb4EhgTF6gMUBFHgS+YA1yqQJWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Lw3Xr3tzeWhm7IMeEFBS4oGCg0PVxBCcbz9CNMfMas=;
 b=TjAwoo2wuNv9v7GQNwSiSyqanOYwIhC9oH+sFlBTZ1FLsfoiYcOCX3XjmoTjoP9NSzfzr65pY1fWy6gWAUN6pbTPMjVdcicaZN3OHcNbgqz1eQcYfzqS20WlIYY2j/03YHh2YuNIex8YuGPNdJPtUnzoNXm0yoh/VA8z2Fim7/6HAdBfNJ7J95UHFQ+9fsXM/glKHQiOgFevd635E3M4rxXt8nLlex6BCw+xsmhCDK2DhO02ZXFensgEOYbXolbE5VFvadbtxrYSARhf9iY5AB4ZxWHp/XnjR/JohP92G+xFNIQBiCfqTHnJvfgE+PrGxdQKd0OYUlAU7bXV/iA/qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lunn.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Lw3Xr3tzeWhm7IMeEFBS4oGCg0PVxBCcbz9CNMfMas=;
 b=Um9sZbBI5xIIrCAmsNe0wkBZsXk7gVaepgGeUGRXMjnK7EsJsI7rQwusBx5th72T2GIC0D/GUnbMCxDLdSHF/uRzM8Kt5WxoLpFrLf1LW8CJCCmUDln8mMsIXqYdA9iTJPqjCaVzM5djROTzZ0effQSAh0dq52N4EaFAoTrIN9Y=
Received: from CH5P222CA0005.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::16)
 by CH2PR12MB9460.namprd12.prod.outlook.com (2603:10b6:610:27f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Fri, 27 Mar
 2026 07:32:49 +0000
Received: from DS2PEPF000061C5.namprd02.prod.outlook.com
 (2603:10b6:610:1ee:cafe::e7) by CH5P222CA0005.outlook.office365.com
 (2603:10b6:610:1ee::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.23 via Frontend Transport; Fri,
 27 Mar 2026 07:32:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF000061C5.mail.protection.outlook.com (10.167.23.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 07:32:49 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 27 Mar
 2026 02:32:48 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Mar
 2026 02:32:47 -0500
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 27 Mar 2026 02:32:44 -0500
From: Suraj Gupta <suraj.gupta2@amd.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>
CC: Michal Simek <michal.simek@amd.com>, Sean Anderson
	<sean.anderson@linux.dev>, Daniel Borkmann <daniel@iogearbox.net>, "Ariane
 Keller" <ariane.keller@tik.ee.ethz.ch>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH net V2 0/2] Correct BD length masks and BQL accounting for multi-BD TX packets
Date: Fri, 27 Mar 2026 13:02:36 +0530
Message-ID: <20260327073238.134948-1-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: suraj.gupta2@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C5:EE_|CH2PR12MB9460:EE_
X-MS-Office365-Filtering-Correlation-Id: 040db9c3-8ed2-4f27-16c6-08de8bd30c34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: wuxDM7e0ndSE0yPYMahbU1ZCrU542IwkqjlSGnCLr9HkvQK1iH4ho9Iq4Xx5JS2pzCKQZOiMuwrkQFdvEpDi2fvNssbOlVVNYZ/Oi1E9Evvd6wZEhvzglD2NO5azJtJci6YJTISX2LE9ggX8gKLjJxkxdfO/6JzwK+X/iv3BgNCxWIosrBLokOsag0D7nXetAEEWN+JracLcosQgxNSuK2q+uGYjD2LECLFJirM3lBHgCZV4RLf182BoxEjCGoj5BdfpR9iy+GuqZ5XliL51GdoA1raVZ7Ckyn1TLHjZO8AF3Xx6gcRo2XapqHMOF44Hr6/pPF2pVNa2VyoStaBO8NPzwCXcsi1lc8hxVgqkEBxvEcUEaF0tY5jTsG3t8U3HqABGZ97gRkh/rY+AjBEAM9GwyvXHaM+zUIXXYYAUC8g0qE6YEllRgw7PLNFFuPtnvLG6FgzrsNmHjhpI9oXx2OvI8ty9dymF7AkwQXbAr/RPuc78zkPauz9bCR9t/6Kn1MyL/ZRuAflKhZry1xzhS5fNbTqSqgJ8DwpHhlt1qVeDHCQImiJbreWoDGgBrM+i9GHDN/KlHqJ22kpYxDtMVBOVLY1W2kx3MSFCJ15Z8lZjhg2MtQs0blmc/jkMTTxYK+FwNbAEVsT96JzNmeF89nSKMBN2y7NeyoIma6okVNhGCIJOiCm6Bgo+Ursr/giSOyXi8xZgxyMBeZS1Uq0ih2fNWDjViSy0bMQvhyNDdDP86r6n2jpTystwCCA/FMzNdjPWWWgzo/BAaX+aIFfIIA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hFi5wXJVfAr4LIixCjAjJVOgtwgmHps7UXBvBT9sdY/5clUaodJtBwIr9k8EQDza3KiK6w8sgFVS0Nw8iCjSBhV5GFA4fD7o9KsDjfdTOAxasM7paduVwTVFWijk0/HjA9ux76fTzTh9Wg3kR5dr2NnEb1+O4iZ4uWbF/lyRC4v2DIZsfuWqxGxsc/0pLq+G6IGwGiCQ5NkE7OxIn4C91ssobiTXUUmxYZUXJiBZ0EQ/z7CyOpXyG0hO7kZOqjnZxgNggZAbvKMH7bmpIaV9zyMxcX5NEjlRqVzE318j8PdE6v5evL9xtLdCV1XbKAjgkbVg7WquIwvMzK7P6B34bzuhE9bTCSSpsRSvPJMvg88UTABzb6f2XjkxPFrEonlM4oiVWvTmfi0b12REnv1Mlq0XJ/i6ovbnU5ee743q5u/Hh+nsKUUku1o8xi70dveE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 07:32:49.1526
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 040db9c3-8ed2-4f27-16c6-08de8bd30c34
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF000061C5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9460
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_003256_838413_5FFE1399 
X-CRM114-Status: UNSURE (   8.85  )
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
- Define BD length masks with GENMASK(25, 0) per PG021.
- Credit BQL using skb->len on packet completion instead of summing
  per-BD actual lengths from descriptor status.
---

Suraj Gupta (2):
  net: xilinx: axienet: Correct BD length masks to match AXIDMA IP spec
  net: xilinx: axienet: Fix BQL accounting for multi-BD TX packets

 drivers/net/ethernet/xilinx/xilinx_axienet.h      | 4 ++--
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 9 ++++-----
 2 files changed, 6 insertions(+), 7 deletions(-)

-- 
2.49.1


