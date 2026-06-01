Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD8BCD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 10:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q6jTRTil8r0amgpoQzoNkjOKV+KT8dF40vkuibwtKSg=; b=FmfxsmXnn3JujD7ReEbX3d2Wkn
	BjXKI9RDGDhXvUHi+1HmNSddYxW/18xDKRFvExZlEE1426xZN/mPI2pHcB5PiDd2Pb5W3JbekwxT8
	uayRklt96y9gigzGUEKLppDMJXORe1U0v847JAfBeAlrlpcrjMAEWqlnTri0zzvzBIM9jF3cHzMDc
	P9SkJplm1Rrcl6k1EzjVEcG5apN58jVsDjthbQThG0clqDeT1j5foGpVEs4QChR3J3SpXAayLdJKh
	XYv5ZUFCY1Oppreps7/7BEUvtfuRmt4DpNI7s1v5Xqwrcz9hkLoIfBetKf08g6oAmGpKqsnccn4q8
	3yzsZsAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU0Cj-0000000Aeow-19Sy;
	Mon, 01 Jun 2026 10:49:09 +0000
Received: from mail-westusazon11012022.outbound.protection.outlook.com ([52.101.43.22] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU0Cg-0000000AeoE-0oce
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 10:49:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z48FJiDWJuoeKZoyf40QiqyDeumOSs/NCxy6zHeTozKk7brMZd1m2oeRKYbdrwj9GxybN+VfvzJvHY90kxRXnNg0aaAHjEHebATTcEhGbkDK5s+DwJDDXXNJLuxLIqFZI8+qlS5xVUH0HqCbFPY1KHe7q75I2lE+Ba/NUgj0HMLWQjQfAKgTLduoLWy+NhLuphgxiuo+pXEttVJJURzIxdcwTqZ+5PRhCCyXGv0AaA+M3Bm4xQY88b5UI/9xKGUCz7R2IXO9Z/U0z+msXtr2hztPRUssmBYVQ5tK9Gu3clvA6k7IiOca/byvbDKYvs91fXvv8u08RppWvFYy5fbFxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q6jTRTil8r0amgpoQzoNkjOKV+KT8dF40vkuibwtKSg=;
 b=OhNW4TdUJFMsMHHuAQQTSPcppgWB7XlaGRn7oxN+WLHYi9ysEQwobsPF4ny+cdOdbgYBcADT+72/Du2RtgBy34XxHz/9Aj27QJ76uRvC2yJyR5xc5BGuTuILti2wmd4b1VttegT9Dx/5sQTGB5m/Pyn1Jfb/qmr297dSwtN6ujDESNgRKXYO+jfKUURR4I48ehXHV51I3wsM8MZHneUcJZyZuv42hCkFu+Zz2xmFrXjZwTCB/7rbgXXDzqQYrtnc3J1gQkLsawlj8xrHBp95NA9/I/rEC0DVk1ysiXoV+oK4Wo7vjVq2qJayrjDdGKsNjR1kFIIQ/tlRnBO9XJSheQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6jTRTil8r0amgpoQzoNkjOKV+KT8dF40vkuibwtKSg=;
 b=Hf4RkrtYcDzO+yH279hlgDOKoRoM3G911zmRktmCqNUghf4hqwGKYZb1mKB+rTp/uhjkhxMKdVAiGRBptE8yk7w4IUTkBjAvGJ6rpjc+deuInmK8HsshvesBCXywwOtsSTNCqR3C6PWgLWvgtvUYBEyRfoRBXHSJEFOytqejLLXQtBlO8+Qs5KVokiZPN3n/rdoheEC9y7Hn+mgeXoSNKxDjuPgTrN+zStbdG1M6+/qfCab1/PT2CMsM2/whYhDjQ5TrKNpxUP9neoXA5e3D74MRiUA4bJiSq5zSq/08nJG2sDLmBvU+xJirGskYNfhoaSAgy3wqRWQt7C43DA9JGQ==
Received: from SJ0PR03CA0298.namprd03.prod.outlook.com (2603:10b6:a03:39e::33)
 by MN2PR12MB4335.namprd12.prod.outlook.com (2603:10b6:208:1d4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 10:48:59 +0000
Received: from SJ1PEPF000023D7.namprd21.prod.outlook.com
 (2603:10b6:a03:39e:cafe::3e) by SJ0PR03CA0298.outlook.office365.com
 (2603:10b6:a03:39e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.17 via Frontend Transport; Mon, 1
 Jun 2026 10:48:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF000023D7.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.0 via Frontend Transport; Mon, 1 Jun 2026 10:48:59 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Jun
 2026 03:48:48 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 1 Jun 2026 03:48:48 -0700
Received: from build-amhetre-focal-20250829.internal (10.127.8.12) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Mon, 1 Jun 2026 03:48:48 -0700
From: Ashish Mhetre <amhetre@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jgg@ziepe.ca>, <nicolinc@nvidia.com>
CC: <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ashish Mhetre
	<amhetre@nvidia.com>
Subject: [PATCH v3 1/3] iommu/arm-smmu-v3: Factor out CMDQ batch force-sync conditions
Date: Mon, 1 Jun 2026 10:48:43 +0000
Message-ID: <20260601104845.995005-2-amhetre@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260601104845.995005-1-amhetre@nvidia.com>
References: <20260601104845.995005-1-amhetre@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D7:EE_|MN2PR12MB4335:EE_
X-MS-Office365-Filtering-Correlation-Id: 21caffa8-edd4-44f6-e3fa-08debfcb62e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: d3DtTG3SO8+2BDERgkO2SVI882oDTEY+R3E81mh8XwprE7W+kdXfdqpizSZ2TyK8odrIATEr71BG7+yQJzAn0TPwL2U9OtUc2o8leZhSzE5qe06400bANnqbpXxCGimnbKpQ5QnYg2B06PCok7oPEjTfmjCK0Ajqi/qHPb+rnhdAfig76STZivlUAcDvth1oWAulKSv69gvfaN4AToWHlG39bu6n1ubZg81dvBDjhjaDOixqupNL15lgp9kEUZynaMkoi15evabRwsMnrfdnV7Tq/7AzfrLYpw+kq0emwmV1CVRwKbLw+7bsNunf+dxGOivVqAWXgCqPTd8bCmc6hmDlkPZDNyN7DqHJrvqYz/rReT0Xe1WAbiBGZFclfl+A7AIimRyWXo3I1VTyck3B/El061mqQev0MTtzCH5w2L01VlepGqI6qeGWJkc20F6DgVbMjiEEYUf7T+ycstHTTWhndThRMfV8WuPaxekmhP7GRkYg3+2rtX2D5TxmvYpULudF7QcXdch2hmkvjkI5uiMGAdvwBU9/eBjaxweUdl8MWouHPFb+nZxeZUntQ5Iu+WKdxv5dMvaEv3sC/PSKmnvkvIVbf2ynts+NvJMysj0VhcF3Zoo0w94JU5qWV2khoF0Z4d7yOw2uWDi6S0svT6rtQPeA4fQqvVyjbiwUdajPnXclkurIrwRJbPMnioWcFi1uHbGIx7wYkJcnKQ1n/CtxkcqNfv7RsFIQ2+EnEtY=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: iTIs9+ghRE2+Lp2dp99DgnTDMsw9ZMdCwT9LiRShv0qXbKCsR0rYqIUtWEyRhU4p5T3VCS+zunUBPUqvCP3l8pMY5GMTGE/oS/pSiNs0QVHc1XoGBHbiBGQVaN/Jv0G931MkEnWobMzk4F7S6km7Tg9rDlC9T6X9lqLQfOCdgn6pSPgdBLa3AwlmH+zLZipMci5+Of61kFQi8f+KDYit7WRzOCqVaOFwdOycDM9ZgCT4qV2GB6CMvhHOFQjKYq+hdmkhwmz72bP56ZMdmczPEt2Eqo8SXOmhUJSPuEKVyjds35G5eXh9Hq+6KSSrXPw5DcJopX5xbO6ZnQ3oii6dhvWxdSlafDuJrQMqUXBZiZRZLcSGspibXKHznrXPG54pUoUJOaDQwkt97cc6LoMm/zdzE2mGjh1uvdNsejWxfu5EM+Y9OiBPzro86+z4BIMX
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 10:48:59.1594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21caffa8-edd4-44f6-e3fa-08debfcb62e8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4335
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_034906_244547_D9DC7B16 
X-CRM114-Status: GOOD (  12.29  )
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

From: Nicolin Chen <nicolinc@nvidia.com>

arm_smmu_cmdq_batch_add_cmd_p() carries two distinct reasons for
flushing the current batch with a CMD_SYNC before appending the
new command:

  - The batch's pre-assigned cmdq does not support the new command.
  - The Arm erratum 2812531 workaround (ARM_SMMU_OPT_CMDQ_FORCE_SYNC)
    forces a SYNC at one entry before the batch is full.

Lift those checks into a new arm_smmu_cmdq_batch_force_sync() helper
so that adding another force-sync condition becomes a one-line
addition. No functional change.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 26 ++++++++++++++++-----
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 9be589d14a3b..4d29bd343460 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -847,16 +847,30 @@ static void arm_smmu_cmdq_batch_init_cmd(struct arm_smmu_device *smmu,
 	cmds->cmdq = arm_smmu_get_cmdq(smmu, cmd);
 }
 
+static bool arm_smmu_cmdq_batch_force_sync(struct arm_smmu_device *smmu,
+					   struct arm_smmu_cmdq_batch *cmds,
+					   struct arm_smmu_cmd *cmd)
+{
+	if (!cmds->num)
+		return false;
+
+	/* The batch's pre-assigned cmdq doesn't support the new command */
+	if (!arm_smmu_cmdq_supports_cmd(cmds->cmdq, cmd))
+		return true;
+
+	/* Arm erratum 2812531 */
+	if (cmds->num == CMDQ_BATCH_ENTRIES - 1 &&
+	    (smmu->options & ARM_SMMU_OPT_CMDQ_FORCE_SYNC))
+		return true;
+
+	return false;
+}
+
 static void arm_smmu_cmdq_batch_add_cmd_p(struct arm_smmu_device *smmu,
 					  struct arm_smmu_cmdq_batch *cmds,
 					  struct arm_smmu_cmd *cmd)
 {
-	bool force_sync = (cmds->num == CMDQ_BATCH_ENTRIES - 1) &&
-			  (smmu->options & ARM_SMMU_OPT_CMDQ_FORCE_SYNC);
-	bool unsupported_cmd;
-
-	unsupported_cmd = !arm_smmu_cmdq_supports_cmd(cmds->cmdq, cmd);
-	if (force_sync || unsupported_cmd) {
+	if (arm_smmu_cmdq_batch_force_sync(smmu, cmds, cmd)) {
 		arm_smmu_cmdq_issue_cmdlist(smmu, cmds->cmdq, cmds->cmds,
 					    cmds->num, true);
 		arm_smmu_cmdq_batch_init_cmd(smmu, cmds, cmd);
-- 
2.50.1


