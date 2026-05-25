Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A22ACD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 18:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nZcAd13lRr9uDeDWqdljvFymQRcKIUO32BpyDzGLaUc=; b=2DwlJ6S47TNPNiaEUbZuN6cA+U
	D9sEoCPhG7BmqfzKNFPU4YOgYFZVcddgVWxHZBpQjUDqUMBczzZM+VJDqnLitsM5TkqDKEapxS7bn
	RrMkS2t6Ok1py4eOQhOEwg2k8dGtpl/77oz9PDgG84vbeDFNab3k0TTjVULp2WxKPOYp2mnuvoBi+
	ShdxAZGNuDdZt6TOQnyElbqr/iFyxQ+ldOb0C4lTNLzFCO1/vjiKIsBXB4VB3VNcgpRbCdfNDfadw
	WD+kkmRlIBJ+r5f3KcxXltlIenIEmJyCoQjrzcS4hdOy3+bqON8UOO9HQQe+xjbaXH+/995aH85Gf
	O4uGj9AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRa1K-00000000EAG-0UAq;
	Mon, 25 May 2026 18:27:22 +0000
Received: from mail-westus2azon11010025.outbound.protection.outlook.com ([52.101.46.25] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRa1H-00000000E9C-1cw0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 18:27:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R0WyPN+gKA9AQQC1IEzn2Hp0gQErQKmeRRswROGS6QxC3Xo7W5Skf3XL+raUBbdCKpy5MCmY+cn7KkNBJvVZTsJE51X0a1ZVnj9JMkoIrdKyrYvk40HG/Wbzw19B0aqAkjsTNWjGR+t3LvmvgBtfB1Puj9ZqUHiGcvsv+BwEUblRidthpwJtcsTEwatkBTmXVjL3VNDrTX/j36kwdL0w0wUW+cy1djNdIgTciLJiUbCG6Al8TOjh97oYuaH9k9tCmPeS3xyM4pJUBDC0RLq9+u79Sq/oRJBMuhOkaRG6pd3fFlrp/sQSa2hZC4o0BtILUUNeNkcKChcV5q9sOnFsOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZcAd13lRr9uDeDWqdljvFymQRcKIUO32BpyDzGLaUc=;
 b=iaXM1829U5i/eYnIaiqQd8kZ+q2FMuBENXZ38zsL6fvauKKSOCeSRAvAVTxGm1fZBlXHW7ufPczA8lCxPxpfOjwPoRuNFxHrqzcwGxzq4eBqLYQA7OF90wazclCalbdSDx4nCWs6wxPB6g1wN/VDiBPElZiJqt5n8kRHu8Xp7MeDFmxlumAnvbGDKKXkw/a+Bm6xDKgmwFWz2DFeT4pMhP2DfCur+inf7QNslFbfjqVBHogPElsdI4eDHlfw2SpVC75POgJJvSlUG3iCYSXF6ta7Ku8XArQVeWkkBWDsxlLF3HFwayOmw/Uq8yTn8KK+Lz/LusZ7LauNKtdSsL5udQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZcAd13lRr9uDeDWqdljvFymQRcKIUO32BpyDzGLaUc=;
 b=gIkYLURnAaaHrL71Tj09Jc6Py85xPgrvPuRwU7PxiNU5tM32SyQHZsRViZ++ksi0bvWS+9n/Os82g1Gj6dA3cg94spgZm6lcWALvNIGxhVKwGuXgIWSfsfyhm499zGZOOCGtdRRhPVdUYPzNjDm8GkhiCXQ81AK1RjgZf4oFREE=
Received: from CH2PR04CA0022.namprd04.prod.outlook.com (2603:10b6:610:52::32)
 by SJ5PPFA634C6E92.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7be) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Mon, 25 May
 2026 18:27:14 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:52:cafe::7a) by CH2PR04CA0022.outlook.office365.com
 (2603:10b6:610:52::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.20 via Frontend Transport; Mon, 25
 May 2026 18:27:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Mon, 25 May 2026 18:27:13 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 25 May
 2026 13:27:13 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 25 May
 2026 13:27:08 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 25 May 2026 13:27:08 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64PIR82F241097;
	Mon, 25 May 2026 13:27:08 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 64PIR6AJ018219;
	Mon, 25 May 2026 13:27:07 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: <liuhangbin@gmail.com>, <h-mittal1@ti.com>, <haokexin@gmail.com>,
	<vadim.fedorenko@linux.dev>, <devnexen@gmail.com>, <horms@kernel.org>,
	<jacob.e.keller@intel.com>, <m-malladi@ti.com>, <arnd@arndb.de>,
	<afd@ti.com>, <basharath@couthit.com>, <parvathi@couthit.com>,
	<vladimir.oltean@nxp.com>, <rogerq@kernel.org>, <danishanwar@ti.com>,
	<pabeni@redhat.com>, <kuba@kernel.org>, <edumazet@google.com>,
	<davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <srk@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
Subject: [PATCH net-next v6 0/2] Add Frame Preemption MAC Merge support for ICSSG
Date: Mon, 25 May 2026 23:56:58 +0530
Message-ID: <20260525182700.3135858-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|SJ5PPFA634C6E92:EE_
X-MS-Office365-Filtering-Correlation-Id: b53256a3-27ee-4aac-88c2-08deba8b3e00
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|36860700016|376014|82310400026|1800799024|3023799007|921020|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: ENG4jQp+BAeRrn63iL0YZm3lJAlVFH/NWvjUL4KCHSa34wSWPg6M9Do06HNMWB8yLHbx9Hsv9hIxO3h0fqH2tuYHmKRX7MYFJDorzokjFdiBDI1T+sVua0abANUouTRgAeOhqfLVa4owOcuDh9QWP0raDotUHChgAlFXVR5nKoqDyAaqleECMJxuY7ui3rZs2vPwEy/rarFaUvZatxM9bt8Clsh/nMcMoHCX9IeMH5wV0YBR3LXa1tb3NItzNyBAuUMfihwq8f8/Y4CYw5j20Wsuedldf0F+TPQ7imSMntayDV+LFMLhDYLA6U6bezUbocNZPXaSIAT3Q7qtMLSyClpaQEhfsYWtMGStDYE6fJwbFZVBCLytNzMPbL70xg/eHXJuWKIFAbXwD4BJJClENa/09bm7fkrqgXQz376l76xfUfrYGgTIWqL5wHR+N5AUv6kr2hR3zmQ5JquFpAVHJ/0xSvRB/pzzY5Jyo7R2QsjzGKoInXoeoLj8fZSDXsXvFHRfAF+zfiQC4z+w5A3Bz7VFBz6nwJWEU8BqV9wka8NJ9/hpH/LhiXiTSrIMQKtvneZVsYy1q0BJsIxWgyoO5+LdpSGKCLR2CTxkDMEYIT/DyVThaxsW/nX2G7N4mzUrAi4QZ4VzKeA4OX9VX7rPcL0osN8QvVa8nDLO4lHCSQBBLbs87uSo3GOSgSZH3xeyJ3zZweoS1E5D90jggs4TPPLRiwCjgPzvosCKwDi/EDQn+aajJoog50q5HEFwUSsI+gK6YyXyqENTm3B3FzpCqQ==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(376014)(82310400026)(1800799024)(3023799007)(921020)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +dhfg3KHP45++zk9XxFTvwWcFk8h5Z7enuDli3kuA51vTphq3j+NVtPH7hwfVeDrhvlrTU4+IwDjepX1BmP2wLfpkT9ORUn6T7le8R45kMYdRGKYpfWLvgXxshWYIAlFhVpnjCv/KavfgZgE0YTJ5Gkxr99oGI8WJPROgP1pd1Rj8OhrlM8gmfn6x41mXzAaw0dNs/1KQntDESW8ACjlinr97rDYzlje3GDWSDHdYkUWVf/U3lkSrtHB31pZuGGA2MUyTqswZDjBNY+ZbD792lIvbt6+AwoUUy7bvCSvfYJkFgc/JGCIBeYN6jVDnkm0s3pGNFy0oiD+ylTUZQllf3FsGkY7/uoOHKkEEWKyk9iP6nWQqVoUqIQ4CvlCENuFteqBfa3TGbsmNVtpU4gPTyFP0iuU6Y6enZsWGXMd9lmwnoNLuJyfZIMes7kg6ChS
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 18:27:13.5632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b53256a3-27ee-4aac-88c2-08deba8b3e00
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFA634C6E92
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_112719_526942_DE1F5DAC 
X-CRM114-Status: GOOD (  11.61  )
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

This patch series adds QoS support to the ICSSG PRUETH driver.
The first patch implements mqprio qdisc handling and TC offload hooks
so userspace can request TC mappings and queue counts.

It also integrates a driver-side mechanism to program the firmware
with the IET/FPE preemption mask and to kick the firmware verify state
machine when frame preemption is enabled. The second patch adds ethtool
perations for the MAC Merge (Frame Preemption) sublayer, exposing .get_mm,
.set_mm and .get_mm_stats so admins can view and change MAC Merge
parameters and retrieve preemption statistics.

v5: https://lore.kernel.org/all/20260430111723.497113-1-m-malladi@ti.com/

MD Danish Anwar (2):
  net: ti: icssg-prueth: Add Frame Preemption MAC Merge support
  net: ti: icssg-prueth: Add ethtool ops for Frame Preemption MAC Merge

 drivers/net/ethernet/ti/Makefile              |   3 +-
 drivers/net/ethernet/ti/icssg/icssg_common.c  |   1 +
 drivers/net/ethernet/ti/icssg/icssg_config.h  |   9 -
 drivers/net/ethernet/ti/icssg/icssg_ethtool.c | 106 +++++++
 drivers/net/ethernet/ti/icssg/icssg_prueth.c  |   6 +
 drivers/net/ethernet/ti/icssg/icssg_prueth.h  |   9 +-
 drivers/net/ethernet/ti/icssg/icssg_qos.c     | 269 ++++++++++++++++++
 drivers/net/ethernet/ti/icssg/icssg_qos.h     | 112 ++++++++
 drivers/net/ethernet/ti/icssg/icssg_stats.c   |   4 +-
 drivers/net/ethernet/ti/icssg/icssg_stats.h   |   7 +-
 .../net/ethernet/ti/icssg/icssg_switch_map.h  |   5 +
 11 files changed, 514 insertions(+), 17 deletions(-)
 create mode 100644 drivers/net/ethernet/ti/icssg/icssg_qos.c
 create mode 100644 drivers/net/ethernet/ti/icssg/icssg_qos.h


base-commit: 830d8771ae3c7bc90a62dde76a6556e612529fbc
-- 
2.43.0


