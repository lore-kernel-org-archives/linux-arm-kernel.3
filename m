Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE2FCA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 11:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rfUe4WaJ69hNIL8Wisf/vnZAny+bfAFIJhOYOWk3/E8=; b=CvdRKSahq9u1q68+Oc6jL6LJTH
	PQVX4NYgIA/N7ci0VWCT/uLYeoRwc3Gq2eHNUwwxIwE4SSVV4kXdMivbiDji202xoCpNTl2SFkwqj
	tcabrHBinivyFtYcBXGrVN33OaNK6t9gXBdXTWxiQeV+KUn0akPLoupNZAIUTHfyZBi14BQb7GrPj
	9xI5OAhfc5CAW+rjAx7VxXtHFlw/x2yR0A+q1utw91jHX2fMzeO4b7VhikA33B/21xNJ5w1bgcu3W
	5n8srR0YGmXNsQQOo2qgYJIIySZwKrtKLShLJbqqAdfo5dSVGZe2F8RNBKvIfDjdR6S/umIs2sKLS
	hh3p2n6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE30A-00000000aqW-3d0Q;
	Tue, 06 Oct 2026 11:06:30 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE308-00000000aox-1InR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 11:06:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U6A9Yy9wFROuz5UvUA+7BXjfY9V22cD3Zgm8rnM7q7WDtMzAyjTkIIn042VmNa72Z053ZFUzDFZPOo+QyXcPrfZ15e/g4bCJtaOmTg3+qQa45CBrhjdk5pXgDojp6zqcgd4hE27RyhZzQylkGSJF9EmO1VlrBZaBcZDv1rBMYqR3h5A4Ye1M8ToDUA2iZRSK0kXn7dizkZ9itfecsz6QcKB5+u2eylEWcRNndXgzWAoBipZmxMFzVe1Ve18F8ixl2vI29qianejVIkoBwSMy79o918whcVQ3uzaJ1cx3la0GUYHFb3QpoOVpB/Crs+bqPSx1SJKy/Nz2k/9NxSDFFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rfUe4WaJ69hNIL8Wisf/vnZAny+bfAFIJhOYOWk3/E8=;
 b=G4iCVdAtMahxRNv1s5CvtZsle/+dyyczdJmhUC1EDXw1t1ujiA9rmemHxIQItrM4L6fAHgy1eg3n/dMiswbrqbvhmUgML5hv3JA27DnOL09XC8exT2+7FLSDURWw/jUQ8496cdFGMMdkWc2rGXQMRGwjIdOG15ipdat4oGTm/e7qeVTUXoWY9wUvsmEiSxFhPjmsRIzVIh8PAz8S9so0hKq2wnmoYKgN1/Lj1YafSddkvAqQvZcpeKVqEW33rsFixrmjTo0I2Lri1lthMehq+S0YuT3fGuL/KKD6Iph4ES/g7uGIj4XNrBm4whn/+vJ6ZW3QeGzbeJ72gAlv/4R73g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lunn.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rfUe4WaJ69hNIL8Wisf/vnZAny+bfAFIJhOYOWk3/E8=;
 b=BzHdeTZAURkI+sgOnZ67oViVUhHnCLgoD9RrJB9+Hsc7zz68c4IjhsapsgZ8Ck5oQau8BZNWnDsHgzuRadEZqSviCU9LYHqCIvHo8JcKj+M97uaNYgz2ew3Ba9cmwXwH9xpjLpJBa1qaLBTu6NskU/h1LkTP6Uc5GOMonBXraIU=
Received: from BN0PR04CA0140.namprd04.prod.outlook.com (2603:10b6:408:ed::25)
 by PH7PR12MB8154.namprd12.prod.outlook.com (2603:10b6:510:2b9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Tue, 6 Oct
 2026 11:06:18 +0000
Received: from IA0PEPF00000044.namprd04.prod.outlook.com
 (2603:10b6:408:ed:cafe::54) by BN0PR04CA0140.outlook.office365.com
 (2603:10b6:408:ed::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue, 6
 Oct 2026 11:06:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 IA0PEPF00000044.mail.protection.outlook.com (10.167.249.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Tue, 6 Oct 2026 11:06:18 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 6 Oct
 2026 06:06:12 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 6 Oct
 2026 06:06:12 -0500
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 6 Oct 2026 06:06:08 -0500
From: Suraj Gupta <suraj.gupta2@amd.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Michal Simek <michal.simek@amd.com>, Russell King <linux@armlinux.org.uk>,
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH net-next v4 4/6] net: xilinx: axienet: Make axienet_rmon_ranges non-static for reuse
Date: Tue, 6 Oct 2026 16:35:48 +0530
Message-ID: <20261006110550.1990213-5-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261006110550.1990213-1-suraj.gupta2@amd.com>
References: <20261006110550.1990213-1-suraj.gupta2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF00000044:EE_|PH7PR12MB8154:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e3e8a07-67e2-4742-eb81-08df2399d8cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|23010399003|376014|36860700016|1800799024|11063799006|22082099003|18002099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: Tt77J0UqafbAnk88+680nrX6Cs3K04MO/8R7i4C6Xjj3QnZVRD8/T+BHQubcXjUe3vdOKTmCDyXoO/sqegXVTTwfEOoSKIy8m3Prra0XJKQZGjGjPr5EcY5HJoDGZNAuZvQYBxcjDFQyNRLglrEM/teTRXsv9iA5L8Us8JobO5B8lf4wMqaZylaDZeN1rQ/K5r53aIFx7OamsOn8xq1d+e/lXSzKhQZgleKMFA6fIqzduVmOdgQ47SA7sBPusf0a5fKBKCvN+pWq/74l3U6Bi7f8cgLn66BsK23tR3g4a/GAbH7v43DcJId/pvf7Q5sFaafR3gNvKlzOD2DHrQKsBAynDyTQala85a5WEh9wZ+y5Sp7DWC7y21haAd0DhMKySFz3vG4lTMjpWwLfC3+M7Z7/i17/fTwvrHI0VPTxX7fakEif/cD6/0xgw7S8pjpaY5LmqV/z+ZDN8tjrhlBqMEQZYGWTRebkbSRIkjYYPDG/tH7fJQKSK6Sq8RsDhNdhprbTtYzCdT5N1+LWaBgdCpf1bYwRZYP57onKvC+vDM26hrvTzMXpGPsnM0C4UM4lkcfwqCNdVse5uIRllVLDLsl4afYxsqTvWV3w0+HJJCwngYr1fJuT0XFIKcl8knYUIim/e57z8qbgWsu032hyOwXmtMK5RIvbMhP7KYUoRwqUkBlrWVhP2ynzTeb+jZl0rB8vVT7V/emxBn11Xm0dlQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(23010399003)(376014)(36860700016)(1800799024)(11063799006)(22082099003)(18002099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zd4TJW/Vytzi5jkADebXyQf7gqv3FUa82CNO+rHOqGtUGZycQFjypdR6um6ULnQvQ6m6N8Pp9um1CmJAwHDqmC+FrhHaFKGq7gGgFtHIege7WHNkj3jiO6gL1BSsdDdmlqDSqCoQZ2N6c2u1aJIbKMhVF3UqEXIkBvsUkgtM9OcILSTNOBCj1kM34qm2GrzxroMS9+/r0cmN5eQ6DDjPN2lCEcUi3CrTMsKSUSj+hQvHh+wBKNUtBTXJ3KKl9MhdFKqnqhN75dcV0PR7sqntk+aT7jJf9Y8oO/OJ/X5a+cdhS/iTpST9m6RAEuYp306S9xvD6W9a9NcW3G8c5nrVnnOJM7QxapE9VFtGe+cwBbxy6Fi6/dNqFMsxpjz9WbeFdBfnyYdnL+u5MhTCCsMBCVZNzOSVsCY/G1F5Lm7yqwxO50HDF3T8sLLMwW2FTnhv
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 11:06:18.3953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e3e8a07-67e2-4742-eb81-08df2399d8cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: IA0PEPF00000044.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_040628_358656_2E3A7603 
X-CRM114-Status: GOOD (  13.02  )
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

The RMON histogram range table axienet_rmon_ranges[] is MAC-agnostic.
Make it non-static and declare it in the shared xilinx_axienet.h so the
upcoming XXV RMON callback can reuse the same table instead of
duplicating it. Include <linux/ethtool.h> for the range element type.

No functional change intended.

Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet.h      | 4 ++++
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet.h b/drivers/net/ethernet/xilinx/xilinx_axienet.h
index c4edf2c36b06..07545eae3c12 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet.h
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet.h
@@ -10,6 +10,7 @@
 #define XILINX_AXIENET_H
 
 #include <linux/dim.h>
+#include <linux/ethtool.h>
 #include <linux/netdevice.h>
 #include <linux/spinlock.h>
 #include <linux/interrupt.h>
@@ -802,4 +803,7 @@ static inline void axienet_dma_out_addr(struct axienet_local *lp, off_t reg,
 int axienet_mdio_setup(struct axienet_local *lp);
 void axienet_mdio_teardown(struct axienet_local *lp);
 
+/* RMON histogram ranges shared by all MAC types */
+extern const struct ethtool_rmon_hist_range axienet_rmon_ranges[];
+
 #endif /* XILINX_AXI_ENET_H */
diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 5c9cf61e6855..68e94231ff04 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -2499,7 +2499,7 @@ axienet_ethtool_get_eth_ctrl_stats(struct net_device *dev,
 	} while (read_seqcount_retry(&lp->hw_stats_seqcount, start));
 }
 
-static const struct ethtool_rmon_hist_range axienet_rmon_ranges[] = {
+const struct ethtool_rmon_hist_range axienet_rmon_ranges[] = {
 	{   64,    64 },
 	{   65,   127 },
 	{  128,   255 },
-- 
2.25.1


