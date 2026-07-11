Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FA5C44501
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 00:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p5pT36nqb1+MuEyIOL+WrcfHNl25MJNp5XeOnEX0WGI=; b=ApTFbTl8bX8W44yyiXww1Ro2VO
	32GkesTMC03KJELLC3fVwX8FMKfz0tjKYzDUr8jp0uq4LW7DAt5h022rYalIeCXQmU65ZINISxCBo
	U6OAkPoJNLdyP/arlegXX+SLNGWG4rHK0cy0XHPKITAKCwJezBe8iRxQOEeN7+clH/VM3dHIE2zVn
	30yA3G894uOHLxHTPoZ/LSc7bZaT8kAF7ZZOeeICG/L95p+3vKaK4dHsGIHHCI1RCHPeuc8U1FiiO
	MCJPPXcvBkBZtouxDfWlDvd5wR6J8F3oHqw34Z0gOAFhi68+MHu8SnHjUnlbn1egnlPsoJZz5faeb
	dLcJCblQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiLyA-000000064D6-04fp;
	Sat, 11 Jul 2026 00:53:26 +0000
Received: from mail-southcentralusazon11013056.outbound.protection.outlook.com ([40.93.196.56] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiLy4-000000064A9-428L
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 00:53:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=crYUiDSDPPSzWpoHHrwPh8DdbngoDyPvy3bgvdL4BrSEqM+jcum21PalHbQl3jtnEtSlaOJP7e5bSp+ZALfP8OT5gquZbkK/NW4s8nUUghNuNizUubpoageiqYzWDvas6/g5IF/IWfo1AYF/tdjuPquuzByxKSBRMO6pdczKnAFmDtJ0Pt8u5nij6p2Jt7dRi2n/KE/dRox0YUl9V00S5RKJkvtYMt6uwjrro7Rn+2ueb4HvPjexdtOSmd5szkZ+QWfHJGqjIs4QAwttnM9UMY31v4vVkdUkCFykJ2l7sENHj5Rl/chrVJL/fmCvQZR1peUSfNpxU+8g6KzMrl+RlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5pT36nqb1+MuEyIOL+WrcfHNl25MJNp5XeOnEX0WGI=;
 b=lq7APpbExdZLUpKyOHT8g0fJ+sA9kVP2kAVOmgt2nigDyY6QjVMWGeubRAkaLxCkjEfDLM22hbZYvntX/EMQM1SeA5rxSTKV86j1tJFNZnIoPI6mgeLw83cnnwUfh/4G1Jy6XhBYV5AdwRVREecVug8h/gxrBfl8pPe9zFGF+t8b2O+rImw68WKUzkAXALnhwhCH06nN0MonaysurX2Jaq/u9kmTEQzlHcImeeyq9Vhjz3MZ7y3L34z9h3CdrIVLd4HDknqEp93W/eKjOIC/1XpowD1jAZlkc66Zj+IdA1pTSneErCG17tH08Buu2IrUQVbCWjvaVGoWZDqzdRhPeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5pT36nqb1+MuEyIOL+WrcfHNl25MJNp5XeOnEX0WGI=;
 b=iFjT7qJR6CeAJXjxdsljT+8YEdmcivQG5yh2OTl2DthfNeCWzoQ4oIHLfmXXXK8E3XjX8OlfYGVWFSSZAHkIzmz+oNFFaouPr9gLJ3J0h0+UX1AN7xwPfCZPXH3dOh7ZVamKgdD1hSYuLXI2+3sch3xJ3dDmOosBsxHxJNrRLFK6JUsQoaqwBcacH7MEllCeHs7E3BUocBZGUePFS6hVVm1lubYG/K4ZMCLs56GYEf6cIrvC9LloiWj2k1HX2q3q6alxWvH74/fLmRAsycdbR1hABmWqnar/hbfba+0eGIQZWNkp2hAAIGmhMEHEuddDNM9Be7Eh7AQNNFG8WJc2jg==
Received: from SJ0PR13CA0079.namprd13.prod.outlook.com (2603:10b6:a03:2c4::24)
 by CY8PR12MB8338.namprd12.prod.outlook.com (2603:10b6:930:7b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Sat, 11 Jul
 2026 00:53:13 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::27) by SJ0PR13CA0079.outlook.office365.com
 (2603:10b6:a03:2c4::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.6 via Frontend Transport; Sat, 11
 Jul 2026 00:53:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Sat, 11 Jul 2026 00:53:13 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Jul
 2026 17:53:03 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Jul
 2026 17:53:02 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Jul 2026 17:53:02 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>
CC: <joro@8bytes.org>, <praan@google.com>, <kevin.tian@intel.com>,
	<smostafa@google.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>, <jamien@nvidia.com>
Subject: [PATCH v8 7/9] iommu/arm-smmu-v3: Retain CR0_SMMUEN during kdump device reset
Date: Fri, 10 Jul 2026 17:52:48 -0700
Message-ID: <28cc228a127cccecaf86eeafedc852a9ea456c3d.1783729633.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783729633.git.nicolinc@nvidia.com>
References: <cover.1783729633.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|CY8PR12MB8338:EE_
X-MS-Office365-Filtering-Correlation-Id: 693b38e1-cb4a-4f80-110d-08dedee6c986
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|22082099003|18002099003|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: GVvUM3S862BaijlPospCSeswXM3A8CRNHi4OK/lHFgH1tNV9d5cU7p7r5VYyTjOB7+U3KXRC2K4C+K4rkJZXqO2Z8S2DA9s+9rdGM7xYKQ35Tw3vguFnd+2vn8boAWDKX+ZX96iaWiAkRMU+NNK1u9c7c17LP22MOltd9VZkEXUqfyw8BPCDQTyNbQLjsrtL98lF6I24o6suqNb3kAlAuI9SIjNLdoMH0gPUOjyj4PD90W7fuX7dtBV/2AOokZ3roffCx2YOFXbf/ab4c5V/lOYWXp31kW9d7FcuJLZ7TgmuK1bk/o0IVIDUXY1P8S4ZZyKTg0l0FxQ9YmhUPZj6Sdh53Y+8tlpr+Wu64Mnr/+39qEc54liRqgWJoSMRVLQ/dySdWbMoa0Dl/vTEiZOetdOvaXhw1yNYt1pPLhPIu19IooaVTHqE9VqDM3xh8srchTyvYoWs6Cyqnl4RkavxB1nQGlGelh8CDlvtc/OKFzJGsZG4KZQQOHIbrfb02ZuFNTMN5/CPbu4CU4zdKXaDimFvT2C9jloiSP4s89tdi0kuQEAyLRaALy3A7s8WSFycr1X7XtfrlBV5Hk0w66MCsjq4r454pPBsue6VAbyFyoV1xLeIXFNwFSJ480wwYGw6fQO4oZwR66R/G7Ng/ZO6f+M8v+XF0r6WSqCiizvce96kPXvpYw0/XTzNdUjrseHdWn2O631H88gP3VvVgK4nxw==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(22082099003)(18002099003)(11063799006)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: cCynMVruQnM0gUKdL5TMAldpam5U4ntF3Vk/nnW1uv8hJOcqJw+A/37pWELCBQ44Py+5E2Sn3glMm3h2O7cU4vnlH8z9yoB1+e/35kby4Fj36CyP7PsLLGedODFSlwpEWqpv8JA+e1Bqek6Ht0mrxELz8OK4zERuDYAGvyyoxaCoNIqHOMAWHPQRvtNk1mDFhC4of2JAAL1Czd0lxLTpzf9HphIAU/x1hwxiBqa3nvd7MTFlhkU58Wn3uJ1ZOwfmwrgAnTjQyiIwEyZmEOJJfb8irbK30aVba0GqOj3ORWMX1oDtfwdVpvuHOL2vgHGFs0XK7XddOb181F54kqZbm/KX2ZaDXP6mam56JxgtrR8XC1/fg/qLZ3m3iLejeVpbeSCPiaEPs2cUk3XLNppXfQcQUmKwWKjUwRDqaOJ5zsutAaeY/XMq48BFWMig9xf8
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2026 00:53:13.7611
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 693b38e1-cb4a-4f80-110d-08dedee6c986
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8338
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_175321_003637_1E8DB55D 
X-CRM114-Status: GOOD (  17.66  )
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

When ARM_SMMU_OPT_KDUMP_ADOPT is detected, do not disable SMMUEN and skip
the CR1/CR2/STRTAB_BASE update sequence in arm_smmu_device_reset(). Those
register writes are all CONSTRAINED UNPREDICTABLE while CR0_SMMUEN==1, so
leaving them intact lets in-flight DMAs continue to be translated by the
adopted stream table.

Initialize 'enables' to 0, so it can carry the retained CR0 fields in the
kdump case, clearing only the queue enable bits. Then, preserve them when
enabling the command queue.

Clear latched gerror bits if necessary.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 60 +++++++++++++++++++--
 1 file changed, 56 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 97c024c133f41..9aa1df1e53cf5 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4781,10 +4781,28 @@ static void arm_smmu_write_strtab(struct arm_smmu_device *smmu)
 static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 {
 	int ret;
-	u32 reg, enables;
+	u32 reg, enables = 0;
 
-	/* Clear CR0 and sync (disables SMMU and queue processing) */
 	reg = readl_relaxed(smmu->base + ARM_SMMU_CR0);
+
+	/*
+	 * In a kdump case (set when CR0_SMMUEN=1 and !GERROR_SFM_ERR), retain
+	 * all the live CR0 fields, e.g. CR0_SMMUEN to avoid aborting in-flight
+	 * DMA and CR0_ATSCHK to carry on the ATS-check policy, while clearing
+	 * only the queue enable bits for this kernel to take over the queues.
+	 *
+	 * According to spec, updating STRTAB_BASE/CR1/CR2 when CR0_SMMUEN=1 is
+	 * CONSTRAINED UNPREDICTABLE. So, skip those register updates and rely
+	 * on the adopted stream table from the crashed kernel.
+	 */
+	if (smmu->options & ARM_SMMU_OPT_KDUMP_ADOPT) {
+		dev_info(smmu->dev,
+			 "kdump: retaining SMMUEN for in-flight DMA\n");
+		enables = reg & ~(CR0_CMDQEN | CR0_EVTQEN | CR0_PRIQEN);
+		goto reset_queues;
+	}
+
+	/* Clear CR0 and sync (disables SMMU and queue processing) */
 	if (reg & CR0_SMMUEN) {
 		dev_warn(smmu->dev, "SMMU currently enabled! Resetting...\n");
 		arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
@@ -4814,12 +4832,41 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	/* Stream table */
 	arm_smmu_write_strtab(smmu);
 
+reset_queues:
+	if (smmu->options & ARM_SMMU_OPT_KDUMP_ADOPT) {
+		/*
+		 * Disable queues since arm_smmu_device_disable() was skipped.
+		 * CR0 fields are independent per spec, so the queue enable bits
+		 * can be cleared while retaining SMMUEN=1.
+		 */
+		ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
+					      ARM_SMMU_CR0ACK);
+		if (ret) {
+			dev_err(smmu->dev, "failed to disable queues\n");
+			return ret;
+		}
+	}
+
+	/*
+	 * GERROR bits are latched. Read after queue disabling so that unhandled
+	 * errors would be visible. Ack everything prior to re-enabling the CMDQ
+	 * as a stale CMDQ_ERR would halt the CMDQ and new command will timeout.
+	 * Acking SFM_ERR is defined too, although it would not exit the SFM.
+	 */
+	if (is_kdump_kernel()) {
+		u32 gerror = readl_relaxed(smmu->base + ARM_SMMU_GERROR);
+		u32 gerrorn = readl_relaxed(smmu->base + ARM_SMMU_GERRORN);
+
+		if ((gerror ^ gerrorn) & GERROR_ERR_MASK)
+			writel(gerror, smmu->base + ARM_SMMU_GERRORN);
+	}
+
 	/* Command queue */
 	writeq_relaxed(smmu->cmdq.q.q_base, smmu->base + ARM_SMMU_CMDQ_BASE);
 	writel_relaxed(smmu->cmdq.q.llq.prod, smmu->base + ARM_SMMU_CMDQ_PROD);
 	writel_relaxed(smmu->cmdq.q.llq.cons, smmu->base + ARM_SMMU_CMDQ_CONS);
 
-	enables = CR0_CMDQEN;
+	enables |= CR0_CMDQEN;
 	ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
 				      ARM_SMMU_CR0ACK);
 	if (ret) {
@@ -4885,7 +4932,12 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 		}
 	}
 
-	if (smmu->features & ARM_SMMU_FEAT_ATS) {
+	/*
+	 * In a kdump adopt case, retain the crashed kernel's ATS-check policy
+	 * captured above rather than forcing it on.
+	 */
+	if (!(smmu->options & ARM_SMMU_OPT_KDUMP_ADOPT) &&
+	    (smmu->features & ARM_SMMU_FEAT_ATS)) {
 		enables |= CR0_ATSCHK;
 		ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
 					      ARM_SMMU_CR0ACK);
-- 
2.43.0


