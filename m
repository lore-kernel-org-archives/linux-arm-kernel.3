Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256C8CD6E4B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 08:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bx2UFZLw29cKMkC7aOF7XpFva0R8UknvWWtY06QewIY=; b=epPtebsh11GcOaGuTdg2UPSdMY
	9G0YHeJPZgL2OeQdS3bRyg4ez8XuWY3jNL4JAyfjws/yli41Gf5pp5vC2ZpSyWOxcj6UNErfX7siQ
	ja+rpjeqI0N/ughcoVgf4i7QR7vBQ/dtcbs6ngMvvYFYLDMCjxGhwdvr23c0Eue3Ci/VY/csAOsrJ
	1VpMJNKWoK9N9QnEazlSQmG1A4h5k2ATjDoLhHpBInVnl/W2wbUM2Rif7AYOphevgd9KJCYGpoKmt
	CyhhQqOOE5Ned61twWLkTQ9/ovd5ubZMGSzRnCOFw1LUQsDjyWxwoQOQ4E90ZaggW2q6WlRDqgDU9
	/nost+dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVfZ-00000005Jtz-1J2Z;
	Thu, 28 May 2026 08:00:45 +0000
Received: from mail-westus2azon11012017.outbound.protection.outlook.com ([52.101.48.17] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVfR-00000005JqL-3ntz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 08:00:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jgve/rXmHqndB6QiiyFfK6fzC0y97uGTx2tIADsFltj30hEyGu4uXoBvsCPPoh+J/oReP55/LOurvzFO+AQfN3NifxtChO6+mCTaL/+pmxBm9IUVgEiB7CLyOqOJrsMhcMFpr/BDduavUYK24fmXGsKkA3lz+m4jjxN6qCa9dq6R2Nn4tpZA8SplRU2T0asc3VDlmAbQ4fNln/dEw4osOavcB3ry5xiCrXVGYluiR1XJfq3DrB0vP77Cj5GDQVCIV3tjSosvFfP9Dc1U8Y1JkGbH9oKRNpr3iVFO5OeHMm7BS7P0yia/N0wyLv/g3sE/WZGwbxm4oPmogYmRu0EFVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bx2UFZLw29cKMkC7aOF7XpFva0R8UknvWWtY06QewIY=;
 b=ZSUYBggON5Vd1uo7uq8seswapMFpGrGUFTLbS65ld4ZwOk7WhwCgyM1JH167EVfDh8SQdgPw3vJ5bZwD4tMzaxavZvcCe16ESsQNjj3/xGPKFTlOtkel6knlC6jkvH70UZDJUK2G7qDyMmm5SC6hWHpXMdS/gvjXkk6MQ+jqRSDMfcgDRSI1MUKAc5xZHoqSP0BHWu635uAKdrrpsxqw6adz2Dylq/QmAM/89+35oqDCtcGHOz7yFwvGfvNHDnGymhlcKYkZsb8AHWmSntQWgVn0PBHe8V2RG2b14CDjqHOdcXX8ggzdOw6LhXjup7FrI93Uck91jIJ0JFdZFNmH9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bx2UFZLw29cKMkC7aOF7XpFva0R8UknvWWtY06QewIY=;
 b=VbNLH7BWofbQYT+M9tRdnZfuHVObab40EdLigMAZlHdV3RAdoV/txqE2szEDYtaTSSVFvNlr36tVuihjUhx0hxkpO0RdFPAPN8HpPrvUNaHGT98BZSA1zwzmeIBe870LCcAqQpJ/KjNQ8MTnK3kLTMrI1u2jDZbGy/hUJiusHeCyC8BSvyT95LquhqWtPpizjW47oD8//aFsj2yv6xSZT+bBdLAxKfyjKmwDAiM1Rte8PMk8c/LXr8QA73DRm+y39VAgEoffW4f2dkQbZywwlQMNPe64gk0p8svrESxv7lOTyCu8DBdI0Qb3q7TUadXB3B+5oJHzWOLyjKDf0Xsz5g==
Received: from PH8PR02CA0049.namprd02.prod.outlook.com (2603:10b6:510:2da::25)
 by DS0PR12MB9060.namprd12.prod.outlook.com (2603:10b6:8:c4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 08:00:28 +0000
Received: from SN1PEPF0002BA52.namprd03.prod.outlook.com
 (2603:10b6:510:2da:cafe::5d) by PH8PR02CA0049.outlook.office365.com
 (2603:10b6:510:2da::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.14 via Frontend Transport; Thu, 28
 May 2026 08:00:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002BA52.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 28 May 2026 08:00:28 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 28 May
 2026 01:00:06 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 28 May
 2026 01:00:04 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 28 May 2026 01:00:03 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>
CC: <joro@8bytes.org>, <bhelgaas@google.com>, <praan@google.com>,
	<kevin.tian@intel.com>, <kees@kernel.org>, <smostafa@google.com>,
	<baolu.lu@linux.intel.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <skaestle@nvidia.com>, <mmarrid@nvidia.com>,
	<skolothumtho@nvidia.com>, <bbiber@nvidia.com>
Subject: [PATCH v2 05/11] iommu/arm-smmu-v3: Submit CMDQ_OP_PRI_RESP for IOPF event
Date: Thu, 28 May 2026 00:59:33 -0700
Message-ID: <6c713c724fa09bf5a1b5e2247c633e516036f079.1779944354.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779944354.git.nicolinc@nvidia.com>
References: <cover.1779944354.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA52:EE_|DS0PR12MB9060:EE_
X-MS-Office365-Filtering-Correlation-Id: bf200c17-b657-4b52-35b3-08debc8f2eab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700016|22082099003|18002099003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info: eKzt/ohtnNotZbklKEBrgqzxt9T4N+7nPF+bVjZsdEKk8MbAwSGVKb5qy8mm94Cfp/IN/qWkH1Skbxdt9GA8JLQWUT23rioCU7eeClyQzAAAkTPvUwKRWLiDvZTLPDUoVp43Y5PPxAHEoqxCy8Ag7FbNa4mB9mr3PaQuOl5nfbBj7yr4WhIeLZFnhQ+jbMtjY+xoNwZIsoo8WwFUo9VaxxmIt9AG8+FeXGHlQXeHj6cXtWh3oZS1fjKXji5VJXbeLzGH795Smupzo8c9dqcbY/+NM/nyfithfonLHptQ+709lFoNKAD4k3iFzLYD0Dwn0tAEs4cMLXVTC8JG6U22Py3yirTgFlj+5VWlr1nW7y8mBprA51UHs0K7UnpVh2Bq4qPdEsswzfpqzivcpxloB1uTbnKbaNKx2PxxYcN5htWOB/4di+EWvXPEwsBjeT4F43epgxsJAl70OlZMfAH2CWHgZVmuLnMjOh8S72UnWJQ0oaBie3mfdhU9hHZIhRQj+zcKG38o5DVORgaupXjwoqr18FTsVups0Xv+ccO7Y9PxGH+1NQ9DiNuWoXuW+jdpLRUl1V63lkEl/xHB2+GRKF97HpVBC4oUZjT5f4PCYT83mtLtZH58/K8AJWSHZ/hH/J2GsJXOZh7OsKEwVw07Yo4yY6cMODkCjtpA15+oINUw3ODrCQUhvOhhaPxDFWZfSn135CZPEj98VOYJhTBk6pNOvR+uPLDSMYzc89iFUrg=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700016)(22082099003)(18002099003)(11063799006)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Z0Y+PH2XxW7paP5Lsc70oC45C5DbgRv8tR654t3oWzh6n2vf/m9/XuiFdUJ+REVHnzIp4GSTn2zzEmOJ9yu5gJmL3llmAk3q19zdlrjt8D5EdFoG2Q3xTtkH3XRGyDqV6lleju6wFwPhnBg2nqFLQXfzMPqosUPm9dOmU5Wue7GyYehm8FXpv6zAmnV3JKy8LZzd+Pqsm/33nLHGnkCXXHRiLVblHKMHTDI/bkUGC30DuRE4CyySmzB6yZvbiZ3XeUrT5MF23DGBTni3YdLHVPpJxvphRGZ/I4HWAkgXWL/9ZzcbLt+DJg9QatHUZEbS4TILftt3TCHwUjVTmQ0J2POMgyDPy0H5XiAcudRV3tZfCGIHzMOoNGPf+4Pxbe8/44AwehrF4+AOtr9P6KgVozrzXK4FZQDILysjYvBjMCBCiZrGie33TiacCJLemZf4
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 08:00:28.1055
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf200c17-b657-4b52-35b3-08debc8f2eab
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA52.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_010037_960641_FBB5E33E 
X-CRM114-Status: GOOD (  17.14  )
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

From: Malak Marrid <mmarrid@nvidia.com>

To handle IOMMU_FAULT_PAGE_REQ from the PRI queue, arm_smmu_page_response()
must issue a CMDQ_OP_PRI_RESP back to the SMMU.

However, either a stall event in the EVTQ or a PRI request in the PRIQ can
surface to the IOPF infrastructure with fault.type == IOMMU_FAULT_PAGE_REQ,
and a single master can in principle be both stall-capable and PRI-capable
(e.g. FEAT_STALL_FORCE on a PCIe device with PRI), so master state is not a
reliable discriminator.

Add IOMMU_FAULT_PAGE_REQUEST_STALLS_TRANS to the generic flags so the fault
reporter can mark a page request that is holding the device's transaction:
    arm_smmu_handle_event() sets it on STALL events
    arm_smmu_handle_ppr() leaves it clear for PRI events

Note: streams[0].id remains the RID because arm_smmu_enable_iopf() rejects
num_streams != 1.

Co-developed-by: Barak Biber <bbiber@nvidia.com>
Signed-off-by: Barak Biber <bbiber@nvidia.com>
Co-developed-by: Stefan Kaestle <skaestle@nvidia.com>
Signed-off-by: Stefan Kaestle <skaestle@nvidia.com>
Signed-off-by: Malak Marrid <mmarrid@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  1 +
 include/linux/iommu.h                       |  1 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 75 +++++++++++++++------
 3 files changed, 58 insertions(+), 19 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 2bb810e4d5fce..1083621705f16 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1007,6 +1007,7 @@ struct arm_smmu_master {
 	/* Locked by the iommu core using the group mutex */
 	struct arm_smmu_ctx_desc_cfg	cd_table;
 	unsigned int			num_streams;
+	bool				pri_enabled : 1;
 	bool				ats_enabled : 1;
 	bool				ste_ats_enabled : 1;
 	bool				stall_enabled;
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index e587d4ac4d331..83c4dfcf20637 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -76,6 +76,7 @@ struct iommu_fault_page_request {
 #define IOMMU_FAULT_PAGE_REQUEST_PASID_VALID	(1 << 0)
 #define IOMMU_FAULT_PAGE_REQUEST_LAST_PAGE	(1 << 1)
 #define IOMMU_FAULT_PAGE_RESPONSE_NEEDS_PASID	(1 << 2)
+#define IOMMU_FAULT_PAGE_REQUEST_STALLS_TRANS	(1 << 3)
 	u32	flags;
 	u32	pasid;
 	u32	grpid;
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index ffc9621cd2288..061f1d46fda0d 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -921,32 +921,68 @@ static int arm_smmu_drain_queue_for_iopf(struct arm_smmu_device *smmu,
 	return ret;
 }
 
-static void arm_smmu_page_response(struct device *dev, struct iopf_fault *unused,
+static void arm_smmu_page_response(struct device *dev, struct iopf_fault *evt,
 				   struct iommu_page_response *resp)
 {
 	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
-	u8 resume_resp;
+	struct arm_smmu_cmd cmd;
+	int sid;
 
-	if (WARN_ON(!master->stall_enabled))
+	if (WARN_ON_ONCE(evt->fault.type != IOMMU_FAULT_PAGE_REQ))
 		return;
 
-	switch (resp->code) {
-	case IOMMU_PAGE_RESP_INVALID:
-	case IOMMU_PAGE_RESP_FAILURE:
-		resume_resp = CMDQ_RESUME_0_RESP_ABORT;
-		break;
-	case IOMMU_PAGE_RESP_SUCCESS:
-		resume_resp = CMDQ_RESUME_0_RESP_RETRY;
-		break;
-	default:
-		resume_resp = CMDQ_RESUME_0_RESP_TERM;
-		break;
+	/* IOPF is gated to num_streams == 1 in arm_smmu_enable_iopf() */
+	sid = master->streams[0].id;
+
+	if (evt->fault.prm.flags & IOMMU_FAULT_PAGE_REQUEST_STALLS_TRANS) {
+		u8 resume_resp;
+
+		if (WARN_ON_ONCE(!master->stall_enabled))
+			return;
+		switch (resp->code) {
+		case IOMMU_PAGE_RESP_INVALID:
+		case IOMMU_PAGE_RESP_FAILURE:
+			resume_resp = CMDQ_RESUME_0_RESP_ABORT;
+			break;
+		case IOMMU_PAGE_RESP_SUCCESS:
+			resume_resp = CMDQ_RESUME_0_RESP_RETRY;
+			break;
+		default:
+			resume_resp = CMDQ_RESUME_0_RESP_TERM;
+			break;
+		}
+		cmd = arm_smmu_make_cmd_resume(sid, resp->grpid, resume_resp);
+	} else {
+		enum pri_resp pri_resp;
+		bool ssv;
+
+		if (WARN_ON_ONCE(!master->pri_enabled))
+			return;
+		/* PCIe allows only one PRG Response per group */
+		if (!(evt->fault.prm.flags &
+		      IOMMU_FAULT_PAGE_REQUEST_LAST_PAGE))
+			return;
+		switch (resp->code) {
+		case IOMMU_PAGE_RESP_SUCCESS:
+			pri_resp = PRI_RESP_SUCC;
+			break;
+		case IOMMU_PAGE_RESP_FAILURE:
+			pri_resp = PRI_RESP_FAIL;
+			break;
+		case IOMMU_PAGE_RESP_INVALID:
+			pri_resp = PRI_RESP_DENY;
+			break;
+		default:
+			WARN_ON(true);
+			return;
+		}
+		ssv = !!(evt->fault.prm.flags &
+			 IOMMU_FAULT_PAGE_REQUEST_PASID_VALID);
+		cmd = arm_smmu_make_cmd_pri_resp(sid, resp->pasid, ssv,
+						 resp->grpid, pri_resp);
 	}
 
-	arm_smmu_cmdq_issue_cmd(master->smmu,
-				arm_smmu_make_cmd_resume(master->streams[0].id,
-							 resp->grpid,
-							 resume_resp));
+	arm_smmu_cmdq_issue_cmd(master->smmu, cmd);
 	/*
 	 * Don't send a SYNC, it doesn't do anything for RESUME or PRI_RESP.
 	 * RESUME consumption guarantees that the stalled transaction will be
@@ -2081,7 +2117,8 @@ static int arm_smmu_handle_event(struct arm_smmu_device *smmu, u64 *evt,
 
 		flt->type = IOMMU_FAULT_PAGE_REQ;
 		flt->prm = (struct iommu_fault_page_request){
-			.flags = IOMMU_FAULT_PAGE_REQUEST_LAST_PAGE,
+			.flags = IOMMU_FAULT_PAGE_REQUEST_LAST_PAGE |
+				 IOMMU_FAULT_PAGE_REQUEST_STALLS_TRANS,
 			.grpid = event->stag,
 			.perm = perm,
 			.addr = event->iova,
-- 
2.43.0


