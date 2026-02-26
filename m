Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D583FC5927
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 10:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RWcD+2Uqn5EYgU77jQhzDtuYFBL+FL++ev1G5j4ATXA=; b=WVsuHf5kLTrwtoEvpcfPKwi5YP
	11iGPJZ95NivQQn6F1RKnTkRXZ0Le1CWen53/9NcEzN/NdYpzcHLEwr80/b8bS9k3DTG5qvhYSKir
	cs5WbL5Wto48/SDSZy7J2kKTtNMrzT3l3DJ6QTBAqRkue8nUpS+FdSw2+LzQRJ2aG6C89wuXfWI/u
	13lwWoOOUJzi6HlUpkAr1WZgQpwMonlTth4a4OnusZjMBmc4rMUmlzrYmmsmY/XuAlj2ytyUIyTc4
	C25Cb+e2xgTCGJpOGsTRQzP+OEEDC2xG28J5ONk04lG+CL7ZPXw6S+TFVQxs0FfYeMQV7sGG+4PHR
	wD2pXd9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYXT-00000005tz1-01EA;
	Thu, 26 Feb 2026 10:24:13 +0000
Received: from mail-northcentralusazon11013040.outbound.protection.outlook.com ([40.107.201.40] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYXP-00000005ty7-3QVU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 10:24:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vBz+ahnSV2VCDUiiOO64X+gfnWydlx3evztZ01EH4pEjSZp2mKL1Darkm123UwqvqHaCbzHj1y9NV2cgrh/QzNYxNiHO6qfA3aWlNyhV4di05u1nnaT1/ivsxZgzOaRpBqzxy9pC57S04GTaaotuGEhjE5hX60icU9kh0+c7V80fmDiqAJqdOgcv+ODvm0Yb3dVAWRjGuT7BNyQRffQk2c/Dt3BPpKke80zV/C1pKA0tnY83J/S9ZZ2C/IkkiiOYLpaWqJ87X2OV7qgr4K47hRDxpVdNUfqTJyL3AzU6U3Fo1+5xztAZSXXOJu7nsHkV5ph9Z4m3bRjOSMgVmo6ikg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RWcD+2Uqn5EYgU77jQhzDtuYFBL+FL++ev1G5j4ATXA=;
 b=r2uUBXILrolYEDsa7hrkZ9gq+088EAfZR0RM2o5TAKd+I6Na6Xrld3xGbPTBMQxTOMo1CheCKDu23rU9nirMS5ka7v6ptU96xU5R/m2YLhnZ5i1Z+qk+b/nqHxaXoR6gsQ/+RmIF6MIY5PbcGVzwlTZMEYKYFVvdowzo3PAr93GBh/J7GVGsUXbWVoSvgGpRPf07Ez+53adL/zN8k/tMt/XmKZaUfn8a/qIyzQxHUK96O5PMXRgOQLbkqdqYC+ENyUT30yoAmOo7KpZKf+lK3uzv6l1jFbVKmtPH/doWTS/iYhmMPF2rAjf4WQGXWEVJSe0glS83mlRnGzIxmHnoGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lunn.ch smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RWcD+2Uqn5EYgU77jQhzDtuYFBL+FL++ev1G5j4ATXA=;
 b=PTsROdkflUw+Td++zS855kOZkRFHbHqH8o+TlKzgjTefQrKXw1hq23tYaR0GGs+pk5g0lW00exXhdWzX2p+xuVyIRoS4dhUU6z9EQM5lSOgbs0iA+K5q5HNsFCUqJuufjqgF7J4qY9q3ITMH/3/9Bad5Kcl5bnxQk6qrdOQdaSw=
Received: from BL1PR13CA0142.namprd13.prod.outlook.com (2603:10b6:208:2bb::27)
 by BN0PR10MB4823.namprd10.prod.outlook.com (2603:10b6:408:12d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 10:24:03 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:2bb:cafe::2) by BL1PR13CA0142.outlook.office365.com
 (2603:10b6:208:2bb::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.14 via Frontend Transport; Thu,
 26 Feb 2026 10:24:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 10:24:02 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 04:24:02 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 04:24:02 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Feb 2026 04:24:02 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61QAO2ix2183376;
	Thu, 26 Feb 2026 04:24:02 -0600
Received: from localhost (dhcp-172-24-231-152.dhcp.ti.com [172.24.231.152])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 61QAO1BE011477;
	Thu, 26 Feb 2026 04:24:01 -0600
From: MD Danish Anwar <danishanwar@ti.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Meghana Malladi
	<m-malladi@ti.com>, Jacob Keller <jacob.e.keller@intel.com>
CC: <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <srk@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net] net: ti: icssg-prueth: Fix ping failure after offload mode setup when link speed is not 1G
Date: Thu, 26 Feb 2026 15:53:56 +0530
Message-ID: <20260226102356.2141871-1-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|BN0PR10MB4823:EE_
X-MS-Office365-Filtering-Correlation-Id: cc20d9cb-8d5b-4ef7-1a7a-08de752129de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|34020700016|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: ZP5F/fUN9VMD3MbvlIJqZ+f4XnEkBD8WbrCBg+Y7+UeCju2y+2AjQZ0eKC8rsb2ICqxktIB2gdVuoAD27z0hPGU7Ho8tBWP8xusqttLAvDKQ6drlFXdJKAYYVutisd7GuT2yWda2onKDJkNunR7iX+WV/VMVPpG7T97vm5uyZ3oQWCwfPFSmBPwmr3yBiLStopQAadenSlbT2GgLgzTTN6vJDabVwOWDh+k+v5l2iIWs3CQRDnOBk6oL7A7Z8LcZ7IcVDN49OQeF9p6/NxlxqKyyFzibpaPegEciIA/p/V2CqSJLFvVI2btukXpuHHOw97GY8orWezoBLskl0k8E/BF+7nlVOvJkFPsluEbYlyUh5++DoRA/WDUFXfg3GF7FQyxD6GsLETBwbEuTiAcgg7GDFhimVP7DAoUqNkv83dX5g8F31WXA26mLoPPi+nLHnf01DQfrB2cWf9d+AnrX0Jlr0Nlz2EwP5O4XPftrd8SjdXaoBRFJm1Znfm0e7tcFQ5i7695T4ZE4stzjdyQpnZK5Omy/u0VMOy2HOpK75W+q1oPB5hXnjvln/G/SbnLYzdXbdTVM5OArxZXOPR0yzrthbo/1I3UfN4ZzuB00aSx6/NUTmfEwtsGZ0Kr9BOPXu6RolVKgeKh9KZoYjnQooDVAABz5lFrGwTujyCl+B8RKOkPm8OwqlDqExTPBY1IEZnMXLDmvTPBeb1/zf0pwz+9vcSCSARBxwNZUvM0dmjaPamjZtYLoeH+kmKEcQIpPIHQCm1OxsE6hrviBrz21ooe6x3Xo/6pq1VsZPez7K0sUVUJlXve9B2x5I1femMwUa+XdaGwbiKETfBm3I2qzlg==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(34020700016)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: e4+m/SdXg70qpUJLalhhkKvNf7GiZoOKNk2s4OtXPBeo1ekKCVbtVh9KPrV9/Sc14bivhPBHe17ZzL8gWw9JD8ZwfUWP42z13yzKb3u3m6+3+eV4jc62MLHSjd5NzC+5k7xN5oBMMdxO8Czp4CXM0lHUTWP/iN4/lwrU9Ci+pgrvkI8C9WECAWIuLhWvnCDL8z6c/RBdYqPSiyNMxIooukWU1Qumf7E+6wEeIdX2GqaC+RONhXai6ugyoOsg9mx5GSBMdSzh76b5n/pmdNgnKAs7tipsEy1g3CRF2fpbDRWC+5JLzPT2uPa/3v0lC+FJ85mPA/l5fsLv+/vJw7hEk5y5ZwAIw9ERDcO4HAlyH/Fz//DivNJqcuLbY0Y2G8PMMgGpbdcuf1ewGCdiXTTXm7cm68zv2eXLXCzIjAkNi0eqf8OjRfCUMx97c5Ttxjy2
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 10:24:02.8836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc20d9cb-8d5b-4ef7-1a7a-08de752129de
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4823
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_022407_908948_1B23E522 
X-CRM114-Status: GOOD (  12.98  )
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

When both eth interfaces with links up are added to a bridge or hsr
interface, ping fails if the link speed is not 1Gbps (e.g., 100Mbps).

The issue is seen because when switching to offload (bridge/hsr) mode,
prueth_emac_restart() restarts the firmware and clears DRAM with
memset_io(), setting all memory to 0. This includes PORT_LINK_SPEED_OFFSET
which firmware reads for link speed. The value 0 corresponds to
FW_LINK_SPEED_1G (0x00), so for 1Gbps links the default value is correct
and ping works. For 100Mbps links, the firmware needs FW_LINK_SPEED_100M
(0x01) but gets 0 instead, causing ping to fail. The function
emac_adjust_link() is called to reconfigure, but it detects no state change
(emac->link is still 1, speed/duplex match PHY) so new_state remains false
and icssg_config_set_speed() is never called to correct the firmware speed
value.

The fix resets emac->link to 0 before calling emac_adjust_link() in
prueth_emac_common_start(). This forces new_state=true, ensuring
icssg_config_set_speed() is called to write the correct speed value to
firmware memory.

Fixes: 06feac15406f ("net: ti: icssg-prueth: Fix emac link speed handling")
Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index 0939994c932f..42a881bee109 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -273,6 +273,14 @@ static int prueth_emac_common_start(struct prueth *prueth)
 		if (ret)
 			goto disable_class;
 
+		/* Reset link state to force reconfiguration in
+		 * emac_adjust_link(). Without this, if the link was already up
+		 * before restart, emac_adjust_link() won't detect any state
+		 * change and will skip critical configuration like writing
+		 * speed to firmware.
+		 */
+		emac->link = 0;
+
 		mutex_lock(&emac->ndev->phydev->lock);
 		emac_adjust_link(emac->ndev);
 		mutex_unlock(&emac->ndev->phydev->lock);

base-commit: 97f87e578883abe2c8bec947dbdfdc4bf624f796
-- 
2.34.1


