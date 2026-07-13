Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D3BC44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 11:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1HjK7/VpxvpKPOyTKw+TQ15mT5aGjfcm/clObjEwDA=; b=W4BS+45pD7jT6jiMQ7Dm+WDQXS
	EM/6fLeHzo3Bluo1TR2LBpJYwFpQ4g90/n3VSgU0Sn02YgfcM3Mposae5B7bpjKoQuFpXfS8Cy3+b
	oTFqoJ685cwHWyTtt1GmTdTCu4+sFRQmW5kiuVVhDWm+XqeAtyPIGyhqfUfnCn03k2HfrIDZQ5ggv
	eLUsSHIad78VkiFIwoLSEi51hIrLGyNrZMVh7DROxUajlr6kuQCffdWlxkMAU4drB/p/7QOaf5HOK
	LQctW5ZFU/OupLYIrt070CkiCG+/ArpJU1UtKddVAIl7Nb5c548rageibIkJLtYiwsyupyamnOyH0
	hIP/pwOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEe3-00000008z11-2ZxF;
	Mon, 13 Jul 2026 11:16:19 +0000
Received: from mail-westus3azon11011021.outbound.protection.outlook.com ([40.107.208.21] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEdy-00000008yyf-21Yb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 11:16:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FhEjI5FSA+VUm+MuVkhzoSLq8cEvIpx9U32fOe+FnaxcF7OOfT65medBKQGN2F5D4gwCFa91idQD/jqXF+9j5k+Hy2gAl+PjVSvXAXAobU5M/XBZerct3OYuwVBD3FuRWGfy56gq/enOuQydfQ6wNiGW3c6cJajHHPy/5v+QvfBy6Dic910ZiP9/enPnbfq74LEwrY6KNl4WCx2ztwtxqBzq7ZGqVWAzO8O4r+Z3Gcj+EzZdu8pbVXN2F1NHlTXbcKXcCdtld1tx9cTFmbAbnLWB0bKYC3ou6bQzEO7WS4jw1BmsE/9NzzfVxJSarqOgkN+/GiQTbNehyE2xTpVKpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1HjK7/VpxvpKPOyTKw+TQ15mT5aGjfcm/clObjEwDA=;
 b=rNtqbWU3h4R9BKyaaknwyxEr5uSTh8IuOIxIbiM3DmUP3NwGRuYE03TVv3tdqGWXKDF5ItDW/XvATQEGPrvToszE530uPGN4XrrRix1YG0dGXNbOPBa6j3RuwMiVF/h/MSzmOtEM6sPuRvmppyHcE+/ijuB/JufAcWAzLW0jEQUJVdzJpDewOjjI2avQG68p3tHKBsmgcGaBoySUNmdhAGjejq4U2omnHw5DYQSr65FIzChdLuZpxLdo8dmPnPII67BADqOcHXYnuaKLhpbjl/nY7fCpllbr0pkDGlwoZ2hzlMTtju+KBIi8VwNhEGAEsxNS79siWiTfD48R8FvQ+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1HjK7/VpxvpKPOyTKw+TQ15mT5aGjfcm/clObjEwDA=;
 b=NyU3a4Jp/dYFvx9wKDT+T8Tno+6XRn3K5r/uNa8gKLTWfvH5YD2+jsHhuE4OQ0wZRbNIa17N6/xsC53b2ipwH+oRU+N3L8cMGDDQ5r7edBjX99VyXgYVMndXo7EW0FIgzdUDTI584fuOoBQGPtTb/yIy9Tfmfse7lm6NsbRYkmU3CwJMF+mIyf81mglVXmZTTOr2VXSBtITn99Bpcwbp+jTy7ZOfa9KWjtwF1VILfxulCGxgqIRo25NvIBYmfmqNrzdc7P8L1nczw/Q9ho6kFpqi2Qz6BgxTmnl2kmLSxa+k19OaDV7sR2uNKsyrAzhfJmc+9ifvurZOlKWLaYROvg==
Received: from BN9PR03CA0341.namprd03.prod.outlook.com (2603:10b6:408:f6::16)
 by DS4PR12MB999076.namprd12.prod.outlook.com (2603:10b6:8:2fa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 11:16:01 +0000
Received: from BN1PEPF00006001.namprd05.prod.outlook.com
 (2603:10b6:408:f6:cafe::4f) by BN9PR03CA0341.outlook.office365.com
 (2603:10b6:408:f6::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Mon,
 13 Jul 2026 11:16:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00006001.mail.protection.outlook.com (10.167.243.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 11:16:00 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 13 Jul
 2026 04:15:47 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 13 Jul
 2026 04:15:46 -0700
Received: from build-amhetre-focal-20250829.internal (10.127.8.12) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 13 Jul 2026 04:15:46 -0700
From: Ashish Mhetre <amhetre@nvidia.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<nicolinc@nvidia.com>, <jgg@ziepe.ca>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-tegra@vger.kernel.org>, Ashish Mhetre <amhetre@nvidia.com>
Subject: [PATCH v6 1/3] iommu/arm-smmu-v3: Factor out CMDQ batch force-sync conditions
Date: Mon, 13 Jul 2026 11:15:40 +0000
Message-ID: <20260713111543.1462161-2-amhetre@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713111543.1462161-1-amhetre@nvidia.com>
References: <20260713111543.1462161-1-amhetre@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006001:EE_|DS4PR12MB999076:EE_
X-MS-Office365-Filtering-Correlation-Id: 9046e1f4-0140-4364-31fe-08dee0d01eb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|7416014|376014|36860700016|1800799024|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: zJb1WNwM/W6VojA7kd778HD+7WfAsF16ZMjjtagzxs6R6bisdPTVfZ2e2x0bPRAVDZmUSn0iMUSif88B9W8S6vgu2Fu1FPJijiFSmLIg/0eFi/ZQRT3ol684+VynKXYXkgVsS++C6uU8MFuIunrPRTRjqpmXukE3xVz2dbBfatj39p/lkix2ZVy8LNH6YNUqR1pLRiZAo0eoVJsU2SIdQxU5pMbU08yl2lGI554766miK2h6CK7HoYG/a81kQgsanoCjDdG17cEO601eUk8PvGsIJVOJFrUKTYBUtCG6tf/XIE5BC2qxnKPLc6WM+/pddYoH77IxiVL8NVAC/8EcX6dmZYtz9tBeaVs6S5XfA+yxX/HcnBSPqRypoty4pC+NHLzwCGnklOKjvtCiv1cklKQzHB6rmF3bI9hJdwv4Sex3lWdyXlhIfBnaXLVHbIjcSsxhPUHFC6HX7dVYulP0CPUdVbq76yhSvUmycBKw9sHbqgL9hkbZkBUtCkoAviiWVbJL3/27QjGCDzDwk9qmiR+JsJTK8+j+ga6CrQrKg9xxP7ASn1e43bW4M6pSmSAkSPwmGbKQhT/p7vjsB6sYFOICGqrjES5IXeM78FkMhC4q3qGszD5VK9GRJp78a/krq7G3L7/Q9Q8xecrq6HK14bCik7sh8hY5iGCrbBZck3p0y6KPrnDqpDFmqRgd4ri3TgF1mzLTvcwc2b0ci3aQiw==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(7416014)(376014)(36860700016)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: lmLIceyX07h6bnPDO5M8AQwKSFPSC85Sf3AgkW0lgigImMbv1AFx/AgH0wv+MPPwFn5PfjLdclsgTAHY9HCa9GZ2oEhtHXYRZX2mcITWYc8JWcO7A+nHdyulXAumJJKAzG0nx8jVjfoVyRlWoLrQIt+OYcg8el+S2H98pOLkoJwukjUlCc+5PTnPwPJX9i88pHDDjMlBzq/sb+Amk4mC1M6CgCjwNcIZRIp4yN171wlXYUtTAzNJyvV8LMlQQUKAzrpqgdRdGDodi35Tcvwt2caDNWhxn9lKDl9nH+5HpH6yzWkEXTBu6Tg86FMc/oNo9se0m+6N0Zq7AxCfodt0MVse2Q3TgPtJIzE3L2/TabQwTH8uFaG5bkDoBW570EOI+luDHUu5OhJM4JJzyqoAIWqY7WHhsXnfx3LvyPv3YZ71fBrqxTb3zNtPR8uJQBXD
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 11:16:00.4373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9046e1f4-0140-4364-31fe-08dee0d01eb7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006001.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB999076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_041614_529113_91ED40AA 
X-CRM114-Status: GOOD (  12.06  )
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
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 23 +++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 57b750ebcd3d..dd7475c50afc 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -847,16 +847,27 @@ static void arm_smmu_cmdq_batch_init_cmd(struct arm_smmu_device *smmu,
 	cmds->cmdq = arm_smmu_get_cmdq(smmu, cmd);
 }
 
+static bool arm_smmu_cmdq_batch_force_sync(struct arm_smmu_device *smmu,
+					   struct arm_smmu_cmdq_batch *cmds,
+					   struct arm_smmu_cmd *cmd)
+{
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


