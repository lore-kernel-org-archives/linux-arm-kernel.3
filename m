Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EA7CD4840
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 16:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vau+agOGPE/0eA03S+pf3NTi4uwetT8K5GjSz2ATBzU=; b=D70JJZgn/35kr9lSiGMxaTcru+
	hBzl/QBz1PtKsbLmEm0iw0sQ2Qc4C5HC5vBWy4H0cGLA9+4ZAM64EZQPfxmKhIlobOVSXDQrfKZx3
	RysV3YjZ16RG4vwgC/IvwUeEdak7853x3rq7AdA91p2cjJYjl6LL6gRK1SQQvvOw+XQE9qkXLmU8j
	SJNFd9PijnaPgU4cNlu2HsFkg/aGxR4tZ1F+1kP0KT72dFO5cMF+QmU8vKgt1Pn7TmyIJ02q3ubtU
	bKDA485AjEm7QCy69E++xIglDqKTVLvFmPFpyayGuMtV7t+r1vVVzuhNu+ajnrzoCss3uJVGn6m9g
	+b7z4Iaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTZB-0000000EDbe-0KDE;
	Mon, 11 May 2026 16:33:13 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTZ9-0000000EDZn-08ji;
	Mon, 11 May 2026 16:33:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EcqNiG+CMMHU3rfXwH2iG1wF7FFzwJeet4gRlCaN8xgKp01HypAoiWCO7KuahpsvlJtAbKvE1x+eli8THa6ICC+rjcvjptXk+FWNfDOjtHLS1h36FvA13J1dnZ9ycGjFGqysM0JDYQhd7qArzsMxoPwPcC5R0G3eSlL/xIhVesWo6+L23YVzUeW7jr1ULmfZ0nxqWrYg5ctBYxJMPBtho58d9Kb5wc2yM5BMEIiRM6DPe4A5jfaL11V8E5ypJZkYVuYpCBX7Jk5WM44uH5mijNO69Wt0FV+9YUB2ae4/xYpKojTzNAamXbGeTcUPmJl9EkbQDaodX3qnDJWDLaLk1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vau+agOGPE/0eA03S+pf3NTi4uwetT8K5GjSz2ATBzU=;
 b=UU5c2FY/Ejn2JU+yhnh7EnKN2VNu+Zuki2lW1UAmjicg+iIWv7ZBG1irH48Ik9upvJ7mABSq1I8Bd759PTtRnJkjlNfLp+T/y99ZryiFm06mZqBUJ88wX+J+PXCK6ETuja0+PJRMyD2yKhwuXA/OBMRWqhmB3RfQ3g5we4pYUeaPhUvmnjujqaZsOFFlq2Ii222dsaahsEboLJ+xVgLuUWiwq2HvPBKIo7Sa1fOAp1ZYFaZNXR1mY2bpiK9dzHIYPqkb69q0quRTbh3KnomLUkaahJhkfre7fUVHEnK4N/ZU3Pc9EuFb6deV9mS+MYA67/oJrhn6OJBy3emCoJnyag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vau+agOGPE/0eA03S+pf3NTi4uwetT8K5GjSz2ATBzU=;
 b=O+QRZRqxTeQHjsC8Bs0kd2O4VYqF3i/5eoAAD8upSNgA7wZdqimN02Wbz0N+tCTWOUVSaP+MKcIDEuivlBF2eOKMLxfRwz07dDkAMZ9SxWIVvPg4xY1xZDKEiPaFtG2MFL0GJ23rwqHMPJKP7/wO1JgpPmH56BKIuFZWIS9vdpM=
Received: from BL1PR13CA0005.namprd13.prod.outlook.com (2603:10b6:208:256::10)
 by CH3PR12MB8236.namprd12.prod.outlook.com (2603:10b6:610:121::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 16:33:03 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:208:256:cafe::ac) by BL1PR13CA0005.outlook.office365.com
 (2603:10b6:208:256::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.15 via Frontend Transport; Mon, 11
 May 2026 16:33:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 16:33:03 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 11 May
 2026 11:32:37 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 11 May
 2026 09:32:08 -0700
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 11 May 2026 11:32:05 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <laurent.pinchart@ideasonboard.com>, <vkoul@kernel.org>,
	<neil.armstrong@linaro.org>, <michal.simek@amd.com>
CC: <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <git@amd.com>, Nava kishore Manne
	<nava.kishore.manne@amd.com>, <stable@vger.kernel.org>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH 1/3] phy: zynqmp: fix L0_TM_DISABLE_SCRAMBLE_ENCODER mask
Date: Mon, 11 May 2026 22:01:33 +0530
Message-ID: <20260511163135.2924642-2-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20260511163135.2924642-1-radhey.shyam.pandey@amd.com>
References: <20260511163135.2924642-1-radhey.shyam.pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|CH3PR12MB8236:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bbbc1c6-15b3-405a-706f-08deaf7af8f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|10086099003|11063799003|3023799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: XPw2zVkwUVMKtgBfckbzflHLKynmKjMKa8VzuSR1lJgSmatERSBITI1MCKpY+f7BqwhYkIkVnJRPJCPFk097WiQ/B7UsNyEdOt7oROF/mqOuG/pKBUcMRC2kS6WgS0VSvEGQ3nKgIRORQ4c5ZtJF/ow1SeA06dnVK1yfnHCEoXhybOYStHC2SNpD6PKuq/VI4IUfnlrGHAB1FRQlgC7vx7Fe8khaMqb0n5kZnKZV6My2brTeXpaLH6b/R08TUfQrWsh92MzyaLxP15ALTJPRUKuLQUMCxQzZlfBEeUt81gjcoQFgwANJg7e6cd0N6yHGxFAGEYGHBs4nR0plWkoua5c8nCT5uEzl5uyAQn7s2qsHqjyrXXB/HtjL7aEE+8Vw0W1x5uF2DWV2uoqfuGCprugYZ5VXcwE0BsJEsSbILaSN11693y0jwX2nRP0JFheLS1I9hfaUBXaVyPQpsRWOYqQmNtp6bjyez+o/ZuSECYPoqQBQ9F5lFm5khkfuhheV9dPVEW/JmERaXIjClVI9dyt64mgHAG+nh+TtmmvWgFx7nx+hIVNfAiPSZC/0+Nm+dRRe/e9PIYNR5fUpxkupcIro7TtkMype6emJ+WYJ2T7NZjRCLMFCFRUeDnVEKKbyNWfY/67BuI1cXkyP3bZ5Br9pdbH1/sRl5XqUaIWYEJ5/AQ/KPFTjbHxv130ykZPeu+1MY68txjaO9A/Q/T6oJeCnenpHYqodHkMtzib7rcc=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(10086099003)(11063799003)(3023799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: uEr1rmZkZ52ImDjSzuhD+HAQKuE/Iu1TNEHX5mEwXV+JY+ibHT0gkWer41dx9MuDBFgszNJH3icLT5kcqgloL5vlhskRRvUns/Fyp0pnHsXfVcg9HPV5EZOqUEgczFF7KbfbETrPUSjlL9Ebsy45572I0/piWLk+NuJaxXQAaPxXPrpfIqOE0QqnpWOdB1cHifR3n1jkq6Fjg2JLImBN93H/WOkPtcy6b2fpl3OyDN4fkJKbx6m+b/19K4bj/1vMN2V7g+uJos/S5G3APU0F8whWBznCmVu48894KAtJx0J6SYuOM2ZbaVK0DhZ/OjxVrme6gifjckqJf/MvUyPHIKFuj9DfRPRM5kWhzej1ELhc5BGRAFfKnG01oBMlXHbD+XRJZeyB5LuuhT0sr70u90u2ciYYewvyp671JoArlkQ21abob4shOK9Cwwz6f9O5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 16:33:03.0185
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bbbc1c6-15b3-405a-706f-08deaf7af8f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8236
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_093311_143487_D96C7263 
X-CRM114-Status: GOOD (  11.60  )
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

The L0_TX_DIG_61 register bit 2 is a reserved read-only field.
The previous mask value 0x0f incorrectly included bit 2, causing
unintended writes to a reserved bit on every scrambler bypass
operation.

Correct the mask to (BIT(3) | GENMASK(1, 0)) to cover only the
valid scramble bypass control bits.

Fixes: 4a33bea00314 ("phy: zynqmp: Add PHY driver for the Xilinx ZynqMP Gigabit Transceiver")
Cc: stable@vger.kernel.org
Signed-off-by: Nava kishore Manne <nava.kishore.manne@amd.com>
Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
 drivers/phy/xilinx/phy-zynqmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/xilinx/phy-zynqmp.c b/drivers/phy/xilinx/phy-zynqmp.c
index fe6b4925d166..c037d7c13d48 100644
--- a/drivers/phy/xilinx/phy-zynqmp.c
+++ b/drivers/phy/xilinx/phy-zynqmp.c
@@ -53,7 +53,7 @@
 #define L0_TM_DIG_6			0x106c
 #define L0_TM_DIS_DESCRAMBLE_DECODER	0x0f
 #define L0_TX_DIG_61			0x00f4
-#define L0_TM_DISABLE_SCRAMBLE_ENCODER	0x0f
+#define L0_TM_DISABLE_SCRAMBLE_ENCODER	(BIT(3) | GENMASK(1, 0))
 
 /* PLL Test Mode register parameters */
 #define L0_TM_PLL_DIG_37		0x2094
-- 
2.44.4


