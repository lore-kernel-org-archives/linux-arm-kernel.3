Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3967E74903
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 05:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93JfRTqLL1sVhnVZaG5Do5cRHK1neVFHV9re5S1b/V0=; b=Q+2/tq+tdwnH/hH3Zrj9V5GMSi
	KGYYpsVE93ShZL87JUL63fi/mzIWlj7gLeLCgUm0IIQOS/WE9xv8A8NcUH/gH75Vcwzny45pNV+hQ
	FUGyYSzwiCOOTPNMtMXlIokY01awj51BOPOIJBkhOrSWhN34GUsB0mRGNTUvSIhaS/6fMvm37CU8l
	2I2WVh9RBobvB7oWU+ac7kbj9V8WSra7K/B/sXbUNUivxoSBMYJM/ClZ1RyUt8XEgs5aGuzueUJYq
	M8ZUgezM8j8f6sbZLg4zeMw8AJdM4IKOo7PfyBlMOWkNlVqON2xsZMhgnku13w5LRROZu/L3TaC0H
	tnpbT8iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYHje-0000000GSaN-1Zn5;
	Wed, 24 Dec 2025 05:48:34 +0000
Received: from mail-eastus2azon11010020.outbound.protection.outlook.com ([52.101.56.20] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYHjb-0000000GSZD-3InH;
	Wed, 24 Dec 2025 05:48:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DaO8xqYPkfX8FPaXx6W3KZIZzAWIQvMdzMo8q+vPCYGjkdcL7duMZjLoXYQnqUMBgHNWAudAyKwHs4omylPQaWw8bAlALVEePR4/rnc8ydzBhzDHyAj4uQt4JJWSzaAMDKivWaN9qI27CHLaOEds9vaQsCqHRlggzrDcnu23wjTJTalR7iByiiozH1n+ilAUREAsKGXQO5IwAIXOu+Qwy2HrWJjmxDKvo7X8t4VqlNrtQgRtuGYwiOYF+p1nEjvHRs3c0oKAaX3zVjSj6dMEuZG4qTMYErstvWxDpxyH2fRxqptLEZUZEUfzo79BgPbPwzu7/ZJ6vlAXEYE5Sd7P+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93JfRTqLL1sVhnVZaG5Do5cRHK1neVFHV9re5S1b/V0=;
 b=V/xVgifyBN43RPxfG6dgAm/YajcUSsaKBg01keX9vz5Y8aUIvMxaRToYITNx2iXUpY9ibQk8Zmrp92m98878y44M7QLhvLJ95vgL1XRgehJ48jrrg/EzyhBacNNpS2oDXO0pZqtfIL6D/tnh/3D8H3J0wFinalkdenGr19o9A1U+AZGYfan6Wm+op6Ax3a0BpAuIXuORfd/KO8fEQOpeKZQTCpMOHzsLJCT9QZTMfQD+jRTiLqVlm0nJXuAhnPP/6J4rjbm/BLdyxK7nhmzKjQ0FOE4MF5dtux+0mHknb+NM0TlT/U8haf/CiYfj7E/FZJG+UNbwVx3FfRyDZKsn/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93JfRTqLL1sVhnVZaG5Do5cRHK1neVFHV9re5S1b/V0=;
 b=lAPP2HAxNcg5fUM8ozQ7GbvZFO6n7hCc8Nrlt9KsYoCpbi2vwYiJovDxdpJ5FZCR6IpKDMQW5hPNAWBrrIZvR19309LJwH28ttn8his6WaVQ7dXLuo/BAtqXSXECSazDbff0gOJZH6fI8jusf9x52rBLMtz6dCanYKRf4cZY9nw=
Received: from BL1PR13CA0223.namprd13.prod.outlook.com (2603:10b6:208:2bf::18)
 by IA1PR10MB6783.namprd10.prod.outlook.com (2603:10b6:208:429::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Wed, 24 Dec
 2025 05:48:27 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:2bf:cafe::77) by BL1PR13CA0223.outlook.office365.com
 (2603:10b6:208:2bf::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.11 via Frontend Transport; Wed,
 24 Dec 2025 05:48:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.9 via Frontend Transport; Wed, 24 Dec 2025 05:48:27 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 23 Dec
 2025 23:48:23 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 23 Dec
 2025 23:48:22 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 23 Dec 2025 23:48:23 -0600
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BO5mFtD079101;
	Tue, 23 Dec 2025 23:48:19 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <vkoul@kernel.org>, <neil.armstrong@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <sjakhade@cadence.com>,
	<rogerq@kernel.org>
CC: <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH 1/2] dt-bindings: phy: Add PHY_TYPE_XAUI definition
Date: Wed, 24 Dec 2025 11:18:58 +0530
Message-ID: <20251224054905.763399-2-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251224054905.763399-1-s-vadapalli@ti.com>
References: <20251224054905.763399-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|IA1PR10MB6783:EE_
X-MS-Office365-Filtering-Correlation-Id: 120086c9-eb6e-4682-2f8f-08de42b00f53
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jn4zTQnltYH1NrUdoXtKX4M8ZDAGkpmCoD5jKd5gcmrEvZPbzQ7c+boEeFUB?=
 =?us-ascii?Q?6YVI5oDixWJSe1bNseyZkL+CpLDC20W7MkjCTgqgfr45NrOdQabOjR9M/4Uq?=
 =?us-ascii?Q?+14eJpxfDoMAUqGwPKFzyfYGhNPq52dED+TUcC7FgsUcw9786QblXmuupYQL?=
 =?us-ascii?Q?GpkCBHt8StAKN2x2RTq7LE+cu1irQOArY9zxB1BBBE2PtKyf8cBoJccjUotD?=
 =?us-ascii?Q?FGotqjlz1dYNU+wHFap3Tb3tGGkK/ctksAQhWf3vAa1orf8HqtmAMOUm8MQS?=
 =?us-ascii?Q?Tc9cPIeQhCR+F+clj2tFKzT2xKrByzePmkC4xH6WGVrQjnfojLSyDWrijhHQ?=
 =?us-ascii?Q?hI33KTPVsc87nfz1NjMEKeWHsLNXGwOKJfJBwXH1Tcf7bTilqt3pU69wamM3?=
 =?us-ascii?Q?eClfBg/d8SIYVyFO5EBpfINcLSEvLJlmWqgdTECrAKBApG/wN7J1SUqfIq1a?=
 =?us-ascii?Q?NyPI/tFIMd3LFuPZ66c+567eTIQkeO1qyCX42fI4xGFeCPNoB3hoboa78fPD?=
 =?us-ascii?Q?M+cO5x/jwh3RZxcboJfvfOvwGiGGRKCOvqqG56V9fLru4KUVQfc38LKHHW0T?=
 =?us-ascii?Q?Gfj2bCOiyFPxdCIWKMlGWuBS+J71PbCE2rOj3t5ALFiw9dU4QE35Wx9AXqF7?=
 =?us-ascii?Q?JYMqcLfVjrYfyAhTMAWBS7YN0M4pPMZ56/9g7T1fZnP8h3A+dQOZKYQwNm7I?=
 =?us-ascii?Q?oJ0YL78wmL16YZewBO1Q3YpW8XxkZqPLQRCQp/hyfzDrPSjx944ury6WwuTe?=
 =?us-ascii?Q?WGRxF+ytm/iVEuFuYCtewzfcq6Lwc4Hy/nYsaMwO5jgZeUlmbLWhLfbJEbs1?=
 =?us-ascii?Q?1CDZuywzjqIS8Qnkx/X73L8+rXNuTZq2FJ+3227ngQmHGS+vobm/AbDgd635?=
 =?us-ascii?Q?frUaYIqWYIfDGKVkEQFfDTZjkOY/JSQTHbjiWD5/AaYIBfXRiN1tXC/95dTx?=
 =?us-ascii?Q?v5/IYOD0zb1/89RD2pJywiysXowi8LcSn8xo1qgtbifcavdn0WcILSKgSKs0?=
 =?us-ascii?Q?8E7esqz2M/3S1tscP70RD3IwGmoOZYt4MrKNP7OZNg7QRNeW5xKoF6RLKhzD?=
 =?us-ascii?Q?A17NOt3BC8oLJwyyIAb1Ac+S7Cn1Ak0mOVgFWQ/SVVB3pHJi8MPXBg/51alY?=
 =?us-ascii?Q?EW5Hn6Ls+H/fI/eL+Dj35zKpqVg3ElL1BiTBvjRrnGYYXcntuybtwk/ZJzTi?=
 =?us-ascii?Q?gA2sTf6OfHj0j/k2AgzL8ZCl82eTj3D/MFp5mj7vk3yJurvXGyF0mSaWj7KH?=
 =?us-ascii?Q?GoC0s9gkurZVONSDIiF98Yl195D4GR3lopO+Vry+N34LoJmAHA7wCi4H8Pfy?=
 =?us-ascii?Q?Bx2b05MHkuV6lTT7fYBd6UyqXlSs9YfAK5HV/T8VIHKSkS0q7Gvu8yiFGris?=
 =?us-ascii?Q?6IqrI7+8g1MSLPcdTUyMvED4+Qs/5mT88gK6ptoOyJkbqkg8xo9/ieJWiAfO?=
 =?us-ascii?Q?4uO+T96bGs9xg5zuKi/9JuTnx+crABPV2TUl9OvilWKbAHa3F2CmWkKZh8o5?=
 =?us-ascii?Q?h66lRyK944CMdBmtlbbzir/pxgCPtAWNW6Iv97z9EyfGMZyIBnWGcWTMQ8s2?=
 =?us-ascii?Q?jH/fMm5ww5Ld689/0Yw=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 05:48:27.0809
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 120086c9-eb6e-4682-2f8f-08de42b00f53
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6783
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_214831_826746_E16E8429 
X-CRM114-Status: UNSURE (   8.91  )
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

From: Swapnil Jakhade <sjakhade@cadence.com>

Add definition for XAUI phy type.

Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
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


