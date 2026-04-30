Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D84AFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 11:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sfPC35Nar/yissUiJ/LQDUwgvhO4OohgsCA7wJ/JJy4=; b=xs5nVAKn3DTG2alJET+ToBxppY
	NLiGO7AtE6z5HJdzzEjjxw3HykHsTgTjjZm2nGxaZxZTsoDVNwtiOhfrYXCmXbpT6DzTWE81adR5d
	WUdabpsSBN9FUH4XAqBYMn2g21PFyVT+uPe3rmSBbqkufnPwGuIDTPtFH/o8nMCrOH3oESWXw14qy
	gX4FvWZLNcbnLr2khgbiGJ7leRfSIZj0XnWwNxGxQrITjzk+TqccxVXB3+7vrcXeYFGEgoK4SmEWY
	SAePslSZ64AtNinMcmVoBCNERXiYAl1kbuKd+vyM8FxSzlM4u1y94nFBvY5HStVLlV2EkPf36O+Dz
	rWVTv2Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPOj-00000005MQx-3tFs;
	Thu, 30 Apr 2026 11:17:37 +0000
Received: from mail-westus3azon11011065.outbound.protection.outlook.com ([40.107.208.65] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPOh-00000005MPd-0bU1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 11:17:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQhHGkh3lDjmutaY4ECQylJWwB+X+tc4Jwf6PuT/C5o2qp8EZ4BxJ+ocBcLQ0DT23yYgZK/knk+NQ/68GgYbut/bsZW3iXWms5XvaqJzi5qa13NJ4064NLBfu37vQAYgbBjGkug8JH2zrIpBPYdy+k+SmkKEOpunvoOIReEBGBJYSQQWNNvGBPgOjAfJXGyW7pIHwGpu8uigjSDiU9fMDcgIGpNFCxevDHUn3JCY7wwQ18LPN0Nvxck+DWh1iEQqFRrwzAVihFdqk4P2WH2FH1owQtD8dWLPNyi7fzl+cLT3Uz+ozYKK4Jlr8u6GrXISo3odH4lPK+4mbzocbmflCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sfPC35Nar/yissUiJ/LQDUwgvhO4OohgsCA7wJ/JJy4=;
 b=QndFDBPfX6pEEdoCxoX0nLnlb/MI09DhzasCxm3+QXz5aWYu30QR5aS1IMGBnBZeJTFD0t7+1qbPhewa0/uvMAdMDntPmD9JFecQLenS34Q5Uipm+zcHTGACupw9d6rZEEvwzSmf1IJW+RugFVWXd56qpcqjDUgrs1LNZvZJuPfq9aEspoQ6vxqtEjIuNN5RSmSP0bsFDpvRm56xiO2Xhsx4wz05SYjg8sGgN/XqHByvlAB4svLMWvv0WxNgm9BoEW63V4eme6c7RkkHDF2iyf3pF8rRM5DuobY4KdWqZ6QrGRL9uDM2pNfhkTEvZcrJWaJT7lV+egTFjVfAjv4l4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfPC35Nar/yissUiJ/LQDUwgvhO4OohgsCA7wJ/JJy4=;
 b=dB4Bdqil8NKCocPV+yFgusnmH7aatfGC3utdpBl4++EbSwCOMah39XdUbgBPI128tksl0otsJEGDCKH0ylz3LDeJU9NEL3PtRBqVtX6MDDZiLeqk6lQdmlA918O+NkkiH4d0CPJJe/SLvES02hLU3ag/LXWGOwMicuXP3c/SzH4=
Received: from CH0PR03CA0369.namprd03.prod.outlook.com (2603:10b6:610:119::22)
 by SJ0PR10MB4493.namprd10.prod.outlook.com (2603:10b6:a03:2dd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.21; Thu, 30 Apr
 2026 11:17:31 +0000
Received: from DM2PEPF00003FC8.namprd04.prod.outlook.com
 (2603:10b6:610:119:cafe::ee) by CH0PR03CA0369.outlook.office365.com
 (2603:10b6:610:119::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 11:17:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DM2PEPF00003FC8.mail.protection.outlook.com (10.167.23.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 30 Apr 2026 11:17:29 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 06:17:29 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 06:17:28 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 30 Apr 2026 06:17:28 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63UBHSbB1243042;
	Thu, 30 Apr 2026 06:17:28 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 63UBHRDY031157;
	Thu, 30 Apr 2026 06:17:27 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: <vadim.fedorenko@linux.dev>, <haokexin@gmail.com>,
	<jacob.e.keller@intel.com>, <horms@kernel.org>, <m-malladi@ti.com>,
	<arnd@arndb.de>, <parvathi@couthit.com>, <afd@ti.com>,
	<basharath@couthit.com>, <vladimir.oltean@nxp.com>, <rogerq@kernel.org>,
	<danishanwar@ti.com>, <pabeni@redhat.com>, <kuba@kernel.org>,
	<edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <srk@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
Subject: [PATCH net-next v5 0/2] Add Frame Preemption MAC Merge support for ICSSG
Date: Thu, 30 Apr 2026 16:47:21 +0530
Message-ID: <20260430111723.497113-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC8:EE_|SJ0PR10MB4493:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ef5e938-fe76-44ed-a8a5-08dea6aa112f
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700016|18002099003|56012099003|921020;
X-Microsoft-Antispam-Message-Info: QBUavrHHv9Nbp+nxrRVnpjkfzWih3dl0gMuBv9C8aPNAJnbVKqVz49WW46rxMK+WbZu6ZWFxkgDYlGDBLNaAIunpEayWSOMLOOACaaL/QXBsu+f7yV5/sn33/vRXqzYV/9Q8mUP/T4zvQNjl3kYaYw1dOQl8tgrbWCeIr/udPpQjNsK/gx74gthQi0FgXLKzI3/Ee04yPtxGLtnn5Zthz3cs24gUiPCzGwmX9oziewmHih0TnrMkJ+5jHZBv9niU/QaXqlRiBKKa4s5WYlF+ItjAJQXcDFNVWAONoT+iprCf3TRJJTHSTarJnEhGhNA3u0gz26kG41KyFsJ6E6DgF6Es9RB4EnFoHGYPIQ4qi0GeEnYFnpbr9tYHQPRbOJk4n41Zggl6MI9Z2+M1B+R4bApBw4JU+GUAtF3W9khZpQ4juUYGOLTwRq/7Auf8xBHlBSz3M3XUefMpvJTUAQkzPTZCg4L9QfOijBZxcsZ9fUIM1LIQtA74sWMdc46QSBvl8grs86iELit7gwV8AM555K6ni3WxSoqdXtez7AEqLjn90ChVOCerMiYlxkxGDGFdWTiUfg651o0x3dUD5qmPrtSi3lxM+JBNme2kcew4R7mw4znuPUISt1S97SJxyXOjOk6u9w3xCKEGiNst9ifWnI9o5NQMrFZGDu1r7EKpY8B0iBeADcqWgUD9YOj/lhXqE8iP6ylEqtixEaEwInjO3HC//ExlHTkXeXZc//u7ovg4TYFNQeTZG+xQ2RXndgIu9I+SRzr2Uqw+43k5NbJUAP6Z198LxTaoMSnqL5Ebop8iFBO5psgf7vXVK1J7Ajhp
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700016)(18002099003)(56012099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: KiWj6cBhjda5wAgDLOyvM42vSrFnqOCGWAmZHRTopzi0tbrFe8q4M9eOj/4Im2F6DaMRVSfJRs2X7qjZ1U0x+SuecUXh0R+aG0P/FshQA4zI6QDflisHJBxCeRYc86U9MmXSn0OASpcm0vC79jOIRPOszIgDKSs3hLMHwDp1lR6kGmjOqUwNTlGhrcyJq6N95yJwVQtksALmBCdnPd5YPf+YTN/+ZLSRz/1apfGqWBYAfOwQDw57Bp+S68J5ASYIJiLQyl27Gp3hUUBu7cffCYVks38n0bnZ7W3ZQvLpXHvcfhILfLHzbPKxXCFVQH17/63SExIcGZUSyOGO/P6OK83rO9uF4EtkvEkvy2JuP6dY2O4zXUuVecIwPxPmNPeDr7nQE2Nf7+ViRzEbSdOqc+faImgZS0HonweUWnbkdwNr2oAYamQ3cPKPbIuwdLsl
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 11:17:29.5154
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef5e938-fe76-44ed-a8a5-08dea6aa112f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DM2PEPF00003FC8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4493
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_041735_189976_CA791A63 
X-CRM114-Status: GOOD (  10.80  )
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

v4: https://lore.kernel.org/all/20260224124803.3634808-1-m-malladi@ti.com/

MD Danish Anwar (2):
  net: ti: icssg-prueth: Add Frame Preemption MAC Merge support
  net: ti: icssg-prueth: Add ethtool ops for Frame Preemption MAC Merge

 drivers/net/ethernet/ti/Makefile              |   3 +-
 drivers/net/ethernet/ti/icssg/icssg_config.h  |   9 -
 drivers/net/ethernet/ti/icssg/icssg_ethtool.c | 107 +++++++-
 drivers/net/ethernet/ti/icssg/icssg_prueth.c  |   7 +
 drivers/net/ethernet/ti/icssg/icssg_prueth.h  |   9 +-
 drivers/net/ethernet/ti/icssg/icssg_qos.c     | 232 ++++++++++++++++++
 drivers/net/ethernet/ti/icssg/icssg_qos.h     | 106 ++++++++
 drivers/net/ethernet/ti/icssg/icssg_stats.c   |   5 +-
 drivers/net/ethernet/ti/icssg/icssg_stats.h   |   5 +
 .../net/ethernet/ti/icssg/icssg_switch_map.h  |   5 +
 10 files changed, 471 insertions(+), 17 deletions(-)
 create mode 100644 drivers/net/ethernet/ti/icssg/icssg_qos.c
 create mode 100644 drivers/net/ethernet/ti/icssg/icssg_qos.h


base-commit: 790ead9394860e7d70c5e0e50a35b243e909a618
-- 
2.43.0


