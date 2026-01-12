Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12AB7D25035
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 05:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1BgxUtHv7uO0+2eTKrwg2ktCzhcicTHIo3bSy7AN5wA=; b=A0bAto1A8k1ebID26gJ5FFxDzd
	8lGlFdH726Cxd5u6fA3A9AxGi8QY6ABLYz9Vjz63Akmud0gGplZo1GVJYb7FuTtFRwPjesavQNv5z
	3m1SyX6m4eDzt2mfgGLPMUTTtfQeNk34VGOS+I8c62F8f+zgFSwlE1zrqSzd3jvmvzNuBiLN20Ztu
	f5PZmz/2pImfAxj/YPo0yuDTHbzncJfKabZZvNafgi7Ru3h87QAMMkOfzUuPh6/W5vLLfOrsxiOyW
	1vnawodwZATdKkKYBsMed2fMT2WTY6V9Y/q0dKRCpDWS9CRwMHiig50NASa0ZZAfZn9n1U8vqYFdi
	WhZ3LX1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfAka-00000004n9n-2kgY;
	Mon, 12 Jan 2026 05:46:00 +0000
Received: from mail-eastus2azon11010002.outbound.protection.outlook.com ([52.101.56.2] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfAkY-00000004n8R-1buY;
	Mon, 12 Jan 2026 05:45:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AbsKU9+WmeK41Y9RHyLoXHrUffgS/fkhzQ6TNKDaPCD1eDNujZRhyyU03H+xgGCOBY3/3in8T7QoqxlR41vqptyHpDxEgaHyWC0ELKVJvEpZGJtjBKmwGGtZgre9mleE5KPB/3WrlX7I03spMlph2GnWqhbdMaW9pdC0Tf0Ci5SEIDZwsTW3ZYyfRzAUO8T7RpddK2AYUB5gfClYPjK3GbE443bgjLWLYuda5uL2VCn/ntNnrFYNk5XTaTH9HyixjBb9r9Ts6KRfL/EVWKt1hCZVxnIWhLueAWNeejXLec8ElFrDe2HipH4wmaZi/ZnesLjS4yJroBPCZEIHBSoeLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1BgxUtHv7uO0+2eTKrwg2ktCzhcicTHIo3bSy7AN5wA=;
 b=GV62d2PyjuUfuLhBmeun5t+dLQdCqAUwx2Ru1CgU36HG5jzFxlvPMxwgMxmaA97bwL+I2EI84tqEAB7ROf6BTf9HNG1ASpXvvJXJnxdSAJwvfLMQYyyeOiT1o0f70HRpD18mAbfACdaqFq/+8iWYPLJaKuD40JvaVh8XrrDWZDjO4YVim2Q2N2ghv0LVVpUMfcDmAhPYi+NcL6QnbtI/I+SMGRzqx8+5wrBmjpsxuLE1j5rQvww4XPXdlhOK25I8zYbenr+VNLcD1JNJaDqyccoEvtU4AXEi7Pc9Mky45lH7otKnWthbYOurIsso0DNQPfuLkSVOQABl9TafPuk8tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1BgxUtHv7uO0+2eTKrwg2ktCzhcicTHIo3bSy7AN5wA=;
 b=bU/MGph9Fou5efZLZV9xSPQEl1Hb5e0Ouc5k6elPTf/MwAjGTA95hsUm+r6/gzIhk2BxGX5ewoVhD0AHGlhbS4h0dMrE4LHbJSxWJQHRA87JmNmaB5BxviZZoKZ9UUkeTYGMdn4fUYyLuxnu3GGs3e/8m5ql79uP9wZDVHblVvs=
Received: from BN0PR03CA0036.namprd03.prod.outlook.com (2603:10b6:408:e7::11)
 by MW4PR10MB6345.namprd10.prod.outlook.com (2603:10b6:303:1ed::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 05:45:53 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:e7:cafe::dc) by BN0PR03CA0036.outlook.office365.com
 (2603:10b6:408:e7::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 05:45:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 05:45:52 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 11 Jan
 2026 23:45:51 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 11 Jan
 2026 23:45:50 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 11 Jan 2026 23:45:50 -0600
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60C5jeQ94153405;
	Sun, 11 Jan 2026 23:45:46 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <vkoul@kernel.org>, <neil.armstrong@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <sjakhade@cadence.com>,
	<rogerq@kernel.org>, <thomas.richard@bootlin.com>
CC: <andrew@lunn.ch>, <linux-phy@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH v3 1/2] dt-bindings: phy: Add PHY_TYPE_XAUI definition
Date: Mon, 12 Jan 2026 11:16:30 +0530
Message-ID: <20260112054636.108027-2-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260112054636.108027-1-s-vadapalli@ti.com>
References: <20260112054636.108027-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|MW4PR10MB6345:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c200dbd-87cc-44df-1c86-08de519dd8ee
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|34020700016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RDJpRsa78h3eodQqLBQmt/14kAEbnZZeMaqaeEpB8T8APtsqCwXXbc97K3Kp?=
 =?us-ascii?Q?et+ARnh6xneR+Sr48PLhd25Q8dzAcbs0UrNEnkljgbfdeLrRebje4HxRZk+J?=
 =?us-ascii?Q?7REzdI04IjQc5zkRccOIjF2YfyZ5tCuBK00GLRfjAPhq6zp/epyB7iRoWuMU?=
 =?us-ascii?Q?+odulMKZcGssbhDkOqQ4kf/D5hFZ1VqhMh3m9ClfN1D/arIgyMLp/xhmgg6w?=
 =?us-ascii?Q?m0ZEeUyLmbJQX6wmiBcyR5lKSUO4vSk4L/Y5MglS7nZTihZJH4O/6lWpxSys?=
 =?us-ascii?Q?3UJ2apOW+6gvatvT3P+SW7u7+Fd11bHm8y82Ksh9j0mqH/XxhhOJYU23Z+Ur?=
 =?us-ascii?Q?NJKrqlEtPjoBZHL3g8VOZGXkWs1CVLvbrXMrKEhPnNftXxSFzIzFs/5dmAcP?=
 =?us-ascii?Q?zPY5JLSuEzcdYP7ImpARTpPCN1sozpoT1AJ9X9iCBlRJA1+vz98AV51WWfWz?=
 =?us-ascii?Q?4/I5GcCoVoJDeY1nbqwKtMRUno5SK95dVPsCtZECuro6wm2FyWJcOVWZGqzb?=
 =?us-ascii?Q?cYNU2wgfKiewcSSdSHvU1Il+cEhXGeLFrHSW/La7OQcDGV17wKbsy57IrjDg?=
 =?us-ascii?Q?In84hS1MgLtU4+lZZY5ZcUhFIhAHKRuGvGIRu+ZxKz3YQHX2JKlfz3G1x3u9?=
 =?us-ascii?Q?FQ92X+vDdvsZwbmzfPUvuwfvAGOpdmtKm/PZ+2B/KDimFMKZcLz/wK2JENRE?=
 =?us-ascii?Q?+DHd44u2EK6aE82BpdHSvZV9V564fLPeY5/iXRd+j9QpoAX8cEDpsHdkEhAg?=
 =?us-ascii?Q?nZ/gXBxSzL5vFle97J8vjpnUvLTGgAi/XFq+YXVI0yvK910tKMBzn7OHmVbK?=
 =?us-ascii?Q?NFhWt0mUifqErFRv+6fQJD2kfFIzmMEqME3GGCgtXElDZb/fRhcoORfsMuFV?=
 =?us-ascii?Q?CUgc7ewOIlmebNaC5bJcpyEI34tQ6dQujDM4T+Y/MZjl8P6LTDcEWIUzFfiz?=
 =?us-ascii?Q?jcfnzbIu/AfIBqGpAIHiV8PmyfQYOFN9vByU72NIHq3ANOwF0ekbWEVPOsjJ?=
 =?us-ascii?Q?nqRUYpFINUQqgt4EYJvvMIh+G/GqNdOI3ZrauhaWwjy2Q7dAuXQesINZUhTe?=
 =?us-ascii?Q?LMDKa7poosCdlmNm2hB5zXh84l5ZXBpXrCHIZQNoDxRPYdDvETAu6cg6Rjln?=
 =?us-ascii?Q?jyHzwPUTUgBr0HPZFNOrqjL+t+cZQ6+8uDR7LqWI5WsJgHreeLV85VTkoqRu?=
 =?us-ascii?Q?3KByGWxNAlFbnIdKnSiqs24U/byu8Vy7qE72i9JIIlACZm8rtJDC/LiP1X96?=
 =?us-ascii?Q?KliHLhNYwecZ88NoA8nkY5Yul6QLPWcPgNB1/fNSW6eu+8uIAAVUNRUSCsFL?=
 =?us-ascii?Q?m5dzH+KSkjNl+dApZL8TSGHD/Yh7Ld1jwred2xxh0glsu7wXjEHIYAxDFhiq?=
 =?us-ascii?Q?nJoZxGRwaDWb4INTmkbGvAYYfweJK67ywSEUB/UPhgLMF8xjWZWOirTsOH5L?=
 =?us-ascii?Q?JiTf1ZbkbTKLpadxZzo0D1vURGtwD0Pa495EmGBx3qeKDNIv/vvo+ELi+sb4?=
 =?us-ascii?Q?vJqfXL35IjBB+tgS1L+0zqOaDRuX+bIY7yPlssoQ2ZZ0Od5am4r4jLK2lGus?=
 =?us-ascii?Q?4KfevvX4EnILoS19GYmOabzdEnT1VuDi0GPLwqsD?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(34020700016)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 05:45:52.3144
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c200dbd-87cc-44df-1c86-08de519dd8ee
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6345
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_214558_443989_10CD9435 
X-CRM114-Status: GOOD (  10.41  )
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

From: Swapnil Jakhade <sjakhade@cadence.com>

XAUI (eXtended Attachment Unit Interface) is a high-speed serial interface
standard for 10 Gigabit Ethernet (10GbE). It uses four lanes with each
lane operating at 3.125 Gbps (totaling 10 Gbps), to extend the XGMII
interface across circuit boards, commonly used in backplanes for
networking switches and high-performance computing. XAUI is defined as a
standardized instantiation of XGMII Extender in the IEEE 802.3
specification.

Add definition for XAUI PHY type.

Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
[s-vadapalli: added detailed description of XAUI in the commit message]
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---

v2 of this patch is at:
https://lore.kernel.org/r/20260104114422.2868321-2-s-vadapalli@ti.com/
Changes since v2:
- Collected Acked-by tag from Rob Herring (Arm) <robh@kernel.org>
  https://lore.kernel.org/r/176772419699.2512006.6478554353373580831.robh@kernel.org/

Regards,
Siddharth.

 include/dt-bindings/phy/phy.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
index 6b901b342348..d77b372d302f 100644
--- a/include/dt-bindings/phy/phy.h
+++ b/include/dt-bindings/phy/phy.h
@@ -23,5 +23,6 @@
 #define PHY_TYPE_DPHY		10
 #define PHY_TYPE_CPHY		11
 #define PHY_TYPE_USXGMII	12
+#define PHY_TYPE_XAUI		13
 
 #endif /* _DT_BINDINGS_PHY */
-- 
2.51.1


