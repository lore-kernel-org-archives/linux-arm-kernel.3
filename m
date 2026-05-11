Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C876DCD484D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 16:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lsiAOzaQ74kaxjx+Uq0MGP8ePYcDdh1dNRqbJGdqF3c=; b=IgF/r3B5vn/bOaw8IewXSoqY3h
	5/h9QKW9OvGBcInGtxTwcz7F6mOJiq/BeCorBVUbAKPceGwOJcnhPItadQUfnu48UMySxJhH1ijM5
	lG523T1bYxYujFvP4k1WUyI865pmA2GmI3rJTqkBxR33idWuT2rCMZeFu4YnmaugF3Um1rVc8zRno
	PmIg65AENRZDLzyYW407n6NEGvoTGhqBb9cOzxHoozrqYYOMSa/ruQpxXPwWuuKYKwO1dwfyOUFfE
	DbmozPN2BqYw8cpwnCmo9UFgeyBkxM2UdB8y8fJa3wYd7qGfWJ9SGnWVZD7T8L8nIN9F8hk8WZBhF
	WgWveRQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTYt-0000000EDTN-486v;
	Mon, 11 May 2026 16:32:55 +0000
Received: from mail-southcentralusazon11011065.outbound.protection.outlook.com ([40.93.194.65] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTYr-0000000EDSl-16d2;
	Mon, 11 May 2026 16:32:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gxloN8TWolRaI6pQe/jT6DKzudvbRVi2wdXeehS2bamjPKIb+/47lVHLWFggl02myOPiWIa/HtKr0CSS2NsiN8zk7uz+dT868+EuEnsQmMxZDYvar4sxHNlwNse/LxZZNhHoJKCjJnHfT6J7wPV4oyQdFpy/Ek/5QEdO6lf+vB0RprxCfBnjc24cdSb+2suBHiqWhoHQQO2QqF4uq1zNqwG+Jnr5sgfIRVSIKUAyv7UQU56pNyqBuEJf8kLrMFq84oterVkiXU8ay9Hql7Rj4gjkUMcD6GyAfc1Ss1lYPgBhLdN9ASt2YH3H7ayMXPlZ/IzK7KHtTn9x3g8F4LSXIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lsiAOzaQ74kaxjx+Uq0MGP8ePYcDdh1dNRqbJGdqF3c=;
 b=f3woYEQ5J72TFuDj7rNhge9CfZngwO29FtpM9SkIc3kEsV46hRtSIYxL58LS9odX9zquxUq4DfVp6tH2ekc2cv9HzeFMXn3K1drEWsbQ0gDHnjSTtuLPnyvgjaQE3p9K5nNgyZRPrpM72wI64OntlLyKykJSovo/kFpgm3379hy5SWUg5WkzbOrAiCEMJLgwrE1xLewT7tqGs2IZ0OgUX4QftdfHsmTtCfPf7iVVwPNNFyj33yPJ2yMssSqGzJcnXleOg73otO1wtGyZFZGRL1EubKwlmmGbBqlyhto9nAWLOsKDleRglDrtviPlHfyMhmHw3xosfyxfpeVHINcw5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsiAOzaQ74kaxjx+Uq0MGP8ePYcDdh1dNRqbJGdqF3c=;
 b=bp4kmF4I9GZuFHODyYPjsD9+5oDV9BVB8atf1RHAIQsOdktBWXK6WvIbggdZ5NZe0ELljttdCQ4sLQTejcpM4aHnFrAxUNGUW2iM61Ie0e/adwzuTtUu391owB7yl2U/0l++8ZrCpcVsc7Ei2aqwkJZq/H2AMMScCxe8QixmyMo=
Received: from DS7PR05CA0040.namprd05.prod.outlook.com (2603:10b6:8:2f::33) by
 IA1PR12MB9529.namprd12.prod.outlook.com (2603:10b6:208:592::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 16:32:44 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:8:2f:cafe::26) by DS7PR05CA0040.outlook.office365.com
 (2603:10b6:8:2f::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.15 via Frontend Transport; Mon, 11
 May 2026 16:32:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 16:32:44 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 11 May
 2026 11:32:24 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 11 May 2026 11:32:21 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <laurent.pinchart@ideasonboard.com>, <vkoul@kernel.org>,
	<neil.armstrong@linaro.org>, <michal.simek@amd.com>
CC: <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <git@amd.com>, Nava kishore Manne
	<nava.kishore.manne@amd.com>, <stable@vger.kernel.org>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH 2/3] phy: zynqmp: use read-modify-write for SERDES scrambler bypass
Date: Mon, 11 May 2026 22:01:34 +0530
Message-ID: <20260511163135.2924642-3-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20260511163135.2924642-1-radhey.shyam.pandey@amd.com>
References: <20260511163135.2924642-1-radhey.shyam.pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|IA1PR12MB9529:EE_
X-MS-Office365-Filtering-Correlation-Id: a14f4037-ff35-4eb8-83e4-08deaf7aedbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|18002099003|3023799003|11063799003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 2506spoD3JHM9JRCVmKD8vDr7FUCxFKXh1+i4gSYygIh3YaRvnTYDVCi2aMbYmJHDhhFHo/QL6KnTNRvy+aQMlHDRgpz36+1w1LzedWLhjDYpCLYcyqKXgxlAsb5vPpl7AEirufTuGGbpPzlQC3ytWYfHovfRGLVjnNjrmVkjcr3HO9bLR+08zkRFZOHRO+o0n6dcdCUx9LtR2QD4XLa+kdVaFwW4xCUx6LfiHQK6Uqx9an4BFPHHfcppLwNaenPLiWYACXqlMmGta2gfV27DGiJqVUyEb0scAnJeTbL/Jb0UlyDZpx4K5HmQkIYpl5mZ5m+tJCHICLs19R8HVnwGyCyT8dHP+GmAjUSVixn4S/SY5Gkw8rdzUp64O1cLCJ+cRdD8v4gTmiC6Hyb8jxA3cf5RNngzDFgCUlju2u/BXdPo4EnxS6eAwMk6D72jI8sDzMWUwRpdioCjNQ4IknIq3qNWIj9R5SUGwtK5679ZevOyXbBJfh8xFEnOta6yPLsoMuwOT1Euy/5EzxP2NJYMVBmIc6UoScRmzP6ZVpk+UQahuCi0xteYDI8hpl6AYLeILKidHjvcnR0H/2pDzddaCbrwL6qbEVcfod+pqnMqPpKEAMwqklJLEvNuqOHRWklaiT5Sxfokw55ey/To2eKwFFggA0DPx6ISr7ikMIrfTQ2KK92Sz9N1t3ivfRGWNfLYxUkUX83qD2fJ85OfP+Sds5zfkfVTE1DI8CMOWILH5U=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(18002099003)(3023799003)(11063799003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4LvkrVA/+2t8WZk6P/JefUVcDo4ft3B2y82O7bOTXzfPiT76NdeLK95XGVusDjAhBSPBcyVAIBa77XZMpDWp7KHNdBSsM46F9hfuvxpi8SU0RbtiFT7tIiQajK72sDABkpfyT/WLskfAW/ZVU/MWb8HSUxcwrRwogcOZtn8GNXIBJcPlvEp9B0j2aQPOzWjYI47+hq4UC8OU8tv2cVQpxSxTnhksdb4yReT0p68dUB1zqfc88NmK8rUXavgqa/agGm4g+GOpY/pt0jOizrqx6TWo99dIzL9tUUv7Vzn545Lls5hYjN8L0XlEb/709vcnDaGfzzo7Qf76wTZAUKDEyjXViyEi+iyh4ZulwmMfn6Zqp9U5rDYN6kNAnXeddyj15blwGtntk4m2f63M6g8/UEcH/fT74+Pa2VXL9pGFLwpGUIt5U73f6lyVpa57HpXJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 16:32:44.2001
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a14f4037-ff35-4eb8-83e4-08deaf7aedbf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9529
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_093253_349377_4E99944E 
X-CRM114-Status: GOOD (  10.61  )
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

From: Nava kishore Manne <nava.kishore.manne@amd.com>

xpsgtr_bypass_scrambler_8b10b() used xpsgtr_write_phy() which performs
a full register write, silently clearing any bits beyond the intended
bypass control fields.

Switch to xpsgtr_clr_set_phy() with clr=mask, set=mask to set only
the bypass bits while preserving the remaining bits in each register.

Fixes: 4a33bea00314 ("phy: zynqmp: Add PHY driver for the Xilinx ZynqMP Gigabit Transceiver")
Cc: stable@vger.kernel.org
Signed-off-by: Nava kishore Manne <nava.kishore.manne@amd.com>
Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
 drivers/phy/xilinx/phy-zynqmp.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/xilinx/phy-zynqmp.c b/drivers/phy/xilinx/phy-zynqmp.c
index c037d7c13d48..6c56c4df8523 100644
--- a/drivers/phy/xilinx/phy-zynqmp.c
+++ b/drivers/phy/xilinx/phy-zynqmp.c
@@ -505,8 +505,12 @@ static void xpsgtr_lane_set_protocol(struct xpsgtr_phy *gtr_phy)
 /* Bypass (de)scrambler and 8b/10b decoder and encoder. */
 static void xpsgtr_bypass_scrambler_8b10b(struct xpsgtr_phy *gtr_phy)
 {
-	xpsgtr_write_phy(gtr_phy, L0_TM_DIG_6, L0_TM_DIS_DESCRAMBLE_DECODER);
-	xpsgtr_write_phy(gtr_phy, L0_TX_DIG_61, L0_TM_DISABLE_SCRAMBLE_ENCODER);
+	xpsgtr_clr_set_phy(gtr_phy, L0_TM_DIG_6,
+			   L0_TM_DIS_DESCRAMBLE_DECODER,
+			   L0_TM_DIS_DESCRAMBLE_DECODER);
+	xpsgtr_clr_set_phy(gtr_phy, L0_TX_DIG_61,
+			   L0_TM_DISABLE_SCRAMBLE_ENCODER,
+			   L0_TM_DISABLE_SCRAMBLE_ENCODER);
 }
 
 /* DP-specific initialization. */
-- 
2.44.4


