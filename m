Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C22CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 05:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GF8LJIyIrMWj1aEvph/qudyLFoABlv7uEc9R6thIf1E=; b=U2CGsG4OhbS9IlD5M8hpS+dbZH
	t2RiVIX8yVx/Sjqry4NUfDiA1vRDzEipM85QPQ9+dO/ZlVGZpI4DV8epiYA9N5GaJAr+Z+/f2vAPD
	Bft69uKCIBmzdpRrwPel4WaaGchktA6U1BEG/5XXbfmcKPTZ563+cFhdLEmDkf0lyAONvvxSusbAk
	YsGbioTOyZ6CmiMIuYtuOqElzjYPTyHkhfNlq2gIKz33tXWle1UxLYACl0L/LcKHIS3cT2lpkSsJm
	xy4MjK2QC5vKByaKDRA1cj331AUp8S9JUjtkehqXHCQpfpWUIDblXMnwvTZkDn7TilAr+QD8vMXhc
	WOlnMKDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXBRP-00000006owj-1SE5;
	Wed, 10 Jun 2026 05:25:27 +0000
Received: from mail-westus3azon11010049.outbound.protection.outlook.com ([52.101.201.49] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXBRL-00000006ovv-2ZLx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 05:25:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GsL3SXIKJ6f6XFj6t7lnKJKaWDhXze2nkDKUU43LipcKrfN0SX9Umq+NPb/CCzaWsdqefWkPvWZ7JSpAqhvbiBnZXtbGAFEOh/LCa/wP0tQXKMVa68/yofAprga+qz4C7lLlcMJV6+E6ZQQr311Ewzdvr/GTEe4AdvRwcdyWSpclb4QAoLLHY+cqLI/XOGhoi3gL3WT+uE3pTiUVf4Pg4J7sqkzEu9aTmINSKmEZm1B0tKbWA5jEXwlc3i178KyBMAIelca9Tkc1NJij5zTsDb60x7StBLasNb/499i+FXojoxdmduJKN9DtCZdrNe+FoNKyRKLXd8rJ1ErQzKKwbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GF8LJIyIrMWj1aEvph/qudyLFoABlv7uEc9R6thIf1E=;
 b=sS83uABfu+hB1usUUqda5mHMGnLgUXPKGk+igDNGnTinRV76YY3rZslaI4IfMgTO+sT9jP6I+Ge/GruRuLA+nOLRNRArJbDOcdP8n7A4vM6PCV7SRvCL5LDQQ0WfhRBjeKfx8+FWqh0f8HmyZnmX7mqdbfQDX2P0Hmi+nYx2PpiAF//PDRjmo7H74ARmXY8PmguEmjMzGy0bKYNHGKw53zmE1lQVM1VUxqvLW4g92052MV/SHijHMUjIpBJli3Wod76CTEAZuOXCcl6Jrtqx7RvICPxWoeCt3unlexao+MzVajA6IPwzKhE8Qjk+gKAT0h15RDQMGsDkJKdQ1+RMrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=users.sourceforge.net smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GF8LJIyIrMWj1aEvph/qudyLFoABlv7uEc9R6thIf1E=;
 b=gJ38Qlfpw5GbB2I/gB48K15gD8+oErA7mjf8aPYKrsHJU8rjc1faN/p1IAU2wIuzkNQyIuGlL2eFMMauKn3/RfAbG2602MDN/TTvR8hNyI0P3xuINXPIC9AMa8MZSHhm1zF5vwIMkLh//jttQs5Z657s7Fh3ArXdATWjhCydD7g=
Received: from DS3P221CA0014.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:45e::18) by
 CH3PR10MB7414.namprd10.prod.outlook.com (2603:10b6:610:155::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.13; Wed, 10 Jun 2026 05:25:18 +0000
Received: from DM2PEPF00003FC4.namprd04.prod.outlook.com
 (2603:10b6:8:45e:cafe::5f) by DS3P221CA0014.outlook.office365.com
 (2603:10b6:8:45e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Wed,
 10 Jun 2026 05:25:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DM2PEPF00003FC4.mail.protection.outlook.com (10.167.23.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 05:25:17 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 10 Jun
 2026 00:25:16 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 10 Jun
 2026 00:25:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 10 Jun 2026 00:25:16 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65A5PGE92601652;
	Wed, 10 Jun 2026 00:25:16 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.231.93])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 65A5PF97004443;
	Wed, 10 Jun 2026 00:25:15 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: <elfring@users.sourceforge.net>, <haokexin@gmail.com>,
	<vadim.fedorenko@linux.dev>, <devnexen@gmail.com>, <horms@kernel.org>,
	<jacob.e.keller@intel.com>, <m-malladi@ti.com>, <arnd@arndb.de>,
	<basharath@couthit.com>, <afd@ti.com>, <parvathi@couthit.com>,
	<vladimir.oltean@nxp.com>, <rogerq@kernel.org>, <danishanwar@ti.com>,
	<pabeni@redhat.com>, <kuba@kernel.org>, <edumazet@google.com>,
	<davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <srk@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
Subject: [PATCH net-next v7 0/2] Add Frame Preemption MAC Merge support for ICSSG
Date: Wed, 10 Jun 2026 10:55:09 +0530
Message-ID: <20260610052511.781752-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC4:EE_|CH3PR10MB7414:EE_
X-MS-Office365-Filtering-Correlation-Id: 52233a92-8cbf-428c-bf77-08dec6b0a871
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|23010399003|7416014|376014|36860700016|921020|3023799007|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: IB1mqapmCWOjouGACvUQ/6s/eLNdnLqU0w4TAcJnfuOiN9Q+It9lH4GZqsiu2rYCgvhCrikbQq+lIZ8C1b0BKImzxREn8wx/K/BAyIEnp+vh6x/XLRmOw52FceW/qlMmd4O7162epFTdgE8B8Cj7YxRdMHPWtd9lXjLyHNa2YLGqWMq3s3ReJLJcnQPGh6vDZgh9vSjvNVQNCYKiddYkRxUHNF3p6j1xAAAugf4LZVdE7YsBkdnW0i3n/AIGRm/H03c9SZ5nIqFC2QxydFEcFxSZj/+4hXg/xlPeGV5DcRLguBfFyemes0RuDKVv6jorOxMjt7tcE4m5r5sgN39ZVpqh3qrjfkd0v17I2XhXC5zr2673wA8+FKH0rNbVE/0IIqxz7QT3db4CT/AlUHR4wRDveJhtH3FMGS6T5Ws790H6n0NV1yflFfk9ijFM1QkLxF0pCIHzqs7dPXYtlfdp84VfBOnBBMh0wdpCWYrFFj09fGUIJ7d0Cev4ZLyTlt6HwxMVOf7CSkL4vpG6IHgfh0/AoFlVGqvF5Qdnc/3cmW3Kaif9rTv58t2djDrLoSJfZhmtRZHE/OslAzhLCVhVRcyO8+myskFlaz2+H6X1VAZfgH+aAektvbNhNMkNGLtkSJzWV9iAtuIkIRHz+drzEIRIr2q4V6JDXS4hcWb6oMSUg0y4VSlveyw1/EDIvCk43xV4h9gKFokdV9B6xkwnq/5U8s5OPfcg0cCkX927q6SQg0ka0fUzmmdF0/bTXrbioUlcptbvpZXU9WYSXp+Oq3fEEYOLH6GQtOezKwh9CGs=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(7416014)(376014)(36860700016)(921020)(3023799007)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Rvu0OCJqFLgqV70WCrEzRSskyFVc0PV4rSi3hXTQLf58Qe7NvsH2ajRxJUZyuzx0liJhFMpn7zzrEKt8jnV0ONjNQqflTVI3cGmXQFkKgMi2nNrmA5C9nvWHt3c6WJqY0KGh7owPI+Rtep4JiuFEXQwUHuZL1KKeZ4H3FVN2jmHq0AQ4zlJ5n5FDhBA0qX9/JG9Rk1UNtFHm/nPvDaMGWTBm5Oprey9yeMSpmhhLVH/oQt459DD3jm8KF5KArH/YnkfJsGaD/mH9HwTvwtm8UQMm3A7hLAtNDIr1mNB6rj3Vtd1IWCh7Glxifp1M3yjSuBJO6dfwlpGJ61m0HOG8JFiXP9/pq6MOfbU37+Lp6o1/rbW0u40ZgEthtIeirEMhv48MwS9S8fusqHU9hATezLgWIyqquglU7w+5S7BPpAkCsrUDSho5vJZyONqFdbnc
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 05:25:17.4716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52233a92-8cbf-428c-bf77-08dec6b0a871
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DM2PEPF00003FC4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7414
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_222523_780886_9E80F12E 
X-CRM114-Status: GOOD (  11.29  )
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

v6: https://lore.kernel.org/all/20260525182700.3135858-1-m-malladi@ti.com/

MD Danish Anwar (2):
  net: ti: icssg-prueth: Add Frame Preemption MAC Merge support
  net: ti: icssg-prueth: Add ethtool ops for Frame Preemption MAC Merge

 drivers/net/ethernet/ti/Makefile              |   3 +-
 drivers/net/ethernet/ti/icssg/icssg_common.c  |   1 +
 drivers/net/ethernet/ti/icssg/icssg_config.h  |   9 -
 drivers/net/ethernet/ti/icssg/icssg_ethtool.c | 100 +++++++
 drivers/net/ethernet/ti/icssg/icssg_prueth.c  |   6 +
 drivers/net/ethernet/ti/icssg/icssg_prueth.h  |  15 +-
 drivers/net/ethernet/ti/icssg/icssg_qos.c     | 282 ++++++++++++++++++
 drivers/net/ethernet/ti/icssg/icssg_qos.h     |  68 +++++
 drivers/net/ethernet/ti/icssg/icssg_stats.c   |   4 +-
 drivers/net/ethernet/ti/icssg/icssg_stats.h   |   7 +-
 .../net/ethernet/ti/icssg/icssg_switch_map.h  |   5 +
 11 files changed, 480 insertions(+), 20 deletions(-)
 create mode 100644 drivers/net/ethernet/ti/icssg/icssg_qos.c
 create mode 100644 drivers/net/ethernet/ti/icssg/icssg_qos.h


base-commit: 67ad35a58a88c360136d893cbc4c7f5b14100bb9
-- 
2.43.0


