Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37470CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 08:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oan0Ag8xJfRA9JuE+GbtnubQnpOhc55nHWF5ous9/D4=; b=EpLDn6lK4W4CxeKBQaCszicXtV
	pNc0t5b7ToqqgvWwBJ6SuEuAEdXCq36wwvB9jocrWYUeu/vom6ih8EPOKX7SrpDPvS5vFaQVhDaz5
	2SiPo6+V0k25Gs/3axJ6JMd0GBQzpdtSTfesv7ykZu/rdJMcgmx6LUIL9Po8vveMOrpWtcfQVpopY
	WlXMmG6MmWB0/+m5Lg9uQBp+cYDOBUdECDTb9JUPpstRDf2VbjLUSU4e9+QNS8TNJIvDRRe3kys3G
	mWEDfPNMWI879NSs1RXLE0MxFkJN1w27bOWCOHyFhSonuXyxiNDma9swjJmvzntFER/S1KQjjpZBP
	HFV/YY1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVfZ-00000005Jue-20Dv;
	Thu, 28 May 2026 08:00:45 +0000
Received: from mail-northcentralusazon11013014.outbound.protection.outlook.com ([40.107.201.14] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVfU-00000005JrG-0g2B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 08:00:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZ6PdFG8A9/AWqlD7EC6FGynmm66pTfr1U7Q4I/H3XTwVuOy6U2DF38+utrOiFeS91mnaauV3T5vSrATgVkYFCzK4QLkcAFkiRYtEFwiJfk+pOWd+comqYcWioCm+9hht5XQrpvateJLKS1bu+nMqulw4PiS+248OUMiAH+YYumN9F1sjiDjkibC8x0ja6u0EkC5MrSW8hTIQoIw7o8awetxIj4DE3JD3NT21NHFfgVux8ksTHudc/anZ0AGjChX4/jh66NMDmhjw9wWUzPpIZqisiecXCxaOWrzabEi78rAk86H5CkTVuAuOvILqLMwyUzzQiq08reNdI1kt7gQ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oan0Ag8xJfRA9JuE+GbtnubQnpOhc55nHWF5ous9/D4=;
 b=lloyOeaQztUEfmdX4ttapN5UWDqCuFmZKP1RuaaEEmtvVzyuRi/HuohF3XKsmyiJPtVdjtPFEw8fulFwe09LPDtQoS+eJwFxS9GVn2H4EkKbd2rMGVou1ayM0nhMWUcgqqHhy/ZlV2t3VFd/6isknsA3fEwKRMQynhSoi0+PtscY1hm+atRUZTANz0LVLRbrBvkQgAvb/u1rgVp6T9lLeBbJOG3YNNsSraJBDWBLlGtukd41WGBLy8lXFMOHC8kTDDAgw+CsSoUursXvMHz9kJMZN4KZ+0ZTA8KsIKP/ivLeBUinsqMNhN7xaEDBUyp6cLUjGk8B3IR8t8cWvWtRhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oan0Ag8xJfRA9JuE+GbtnubQnpOhc55nHWF5ous9/D4=;
 b=QWuOmEh03oJvMVj2hEVWhWNO1/jB7KQOhMfNfD/ldwAJbbAG+B8j7gJZeUhguKqAXG3XhLK5S/Z97QHwMSJdskDhe591fOWkZ16Xn5IzON+o2wli6umurc6c23D1pJ440Gz1MOuE+wqOkLrT0iscbbVLb+9BRyDtPe0MT1073cXofzW4/ChwYJfRY9mV5oXfnOHxUYqPp0mABrkX67tta+noIc7wK8EIw3ZynxBf6GHcReF14mykIeHRy1cDTNeIY0o3/Qphy/qcBeew3tx7fEBWu1vivcAYL7x0wm0Hve/2cGa4vYB6iTL7uzkrWDuvRKW6HBbdFDi/kRCjYfaoUg==
Received: from PH3PEPF000040A3.namprd05.prod.outlook.com (2603:10b6:518:1::57)
 by BY5PR12MB4050.namprd12.prod.outlook.com (2603:10b6:a03:207::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 28 May
 2026 08:00:32 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2a01:111:f403:f90e::3) by PH3PEPF000040A3.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via Frontend Transport; Thu, 28
 May 2026 08:00:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 28 May 2026 08:00:32 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 28 May
 2026 01:00:07 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 28 May
 2026 01:00:06 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 28 May 2026 01:00:05 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>
CC: <joro@8bytes.org>, <bhelgaas@google.com>, <praan@google.com>,
	<kevin.tian@intel.com>, <kees@kernel.org>, <smostafa@google.com>,
	<baolu.lu@linux.intel.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <skaestle@nvidia.com>, <mmarrid@nvidia.com>,
	<skolothumtho@nvidia.com>, <bbiber@nvidia.com>
Subject: [PATCH v2 06/11] iommu/arm-smmu-v3: Support PRI Page Request in arm_smmu_handle_ppr()
Date: Thu, 28 May 2026 00:59:34 -0700
Message-ID: <bfb23bc455b4f3d8c39663fb2316dbede8f5e7d9.1779944354.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779944354.git.nicolinc@nvidia.com>
References: <cover.1779944354.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|BY5PR12MB4050:EE_
X-MS-Office365-Filtering-Correlation-Id: ed03e4e6-fc6c-4743-aeaf-08debc8f311e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|36860700016|82310400026|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: JXUjBViJlJQ96pdRbThMnR9kr4yBXltCL0InHCUyGVej08B8u5JWcy56z2IrNrXXnbYO8UYMOJqbpuBIQ0BDHyNbW6MYl+Q6TzSLDb8lyVbCSakClKt/w9yYSPJfgZB7PlGbWNsXL3R5svfVB9EyGVFQJ0K5+CXK9/x6BNzn2ylGk4rERcNedOWhJd/fl7gBaP1HhSHwKNDIfsFxDvks+3sxzcDBrEor9FF7vbTKW70X48Rs8YUyjybbFNzsCEcp3wU4HzNQaTIJaYVhcUZ7vYW7uxlPmlLHjKrQn76G10wzTnIMCfYrlDwey1JcVyPS23xDGsOFeTk/RMvoZg29OuQYdPObCg8GfYdFvjcrj1m0g4vgqJB3ElFxmCWFFObnMHl5XfRlvZAegbfa5gVu1i8B5XN11R8BkI4rYiNaUJEeDjPt6ELwS915ewV+BjuoH5OCve07MQhtUdNqRTySMPNPmiJUFfgOe7gblJdpLQj0XkC+UpXan+kuQN4Qr6atLmJSNYeBApexXp1vaNl4oP0QVV9QEjwHsgMQgE0s8VJAtbKxoVlg/8lDIg8plOIBEcyWQ17XgRVgOwvPDi2p9scsqOxKHFp2HxFmdk5MOB1obIVCCJf//62rb1F5y+iKWlQiW7BrSk1oRulsvY71gRcb5dnWMWuxaU8OPlRgYee4got5WRj2IQl0kFQvK/Iud1IseEQa/aa2TPeUOAdNJ0jqhZuHURVfMSJ6KBGeU4U=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700016)(82310400026)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6O9DagRcA/iN4QsPhwLuXtBcwoGY5ARN1EQDlErz3/+0KQJygFu3s7oe3FEtmkppcrhCRuN/no76ipdOIE5WMp5lvVWN/s0IPpW4IjEQwuOPp5SpbdDPSAWZJOn0GEbDg6z1epnqEZABtIvImwHjoiuWO2NbZ3+JFN3MZnrTxq6TpDHZeHh94VMnRs0zhUMIiRUIOHvrVf2RMjvZfhDOqLMjaeo+zotivftJMwvOgjSVHOdaZ+1Ko+wucclTNfBZ59Ia20jC1+7qFNKnbv+lOVfvI5VjUhKVI6eOEcrJ2NYxZ2LFkCm2Lvh+X+BalBQkVd01SJ+wEGysYWKfSVgmiD0iCX+c65vbBlCVmtSSymGdwfkgnFUxOUiQGS5405zRUPenDdlSug4WxUcPtydicZ47vJucOxdxi0cRZRhRZlXqQlKUsMCFq0KSaYg8lOUs
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 08:00:32.2022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed03e4e6-fc6c-4743-aeaf-08debc8f311e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_010040_208116_162DA87D 
X-CRM114-Status: GOOD (  11.84  )
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

Now, arm_smmu_page_response() can issue CMDQ_OP_PRI_RESP for page requests
from the IOPF infrastructure. Forward PRI requests from the priq into the
IOPF infrastructure for PRI-enabled masters by building an iopf_fault from
the priq entry and calling iommu_report_device_fault().

For an unrecognised StreamID or a master without master->pri_enabled, fall
through to the existing "unexpected PRI request" log + LAST-page DENY path
to release the credit per the PCIe PRI spec.

Co-developed-by: Barak Biber <bbiber@nvidia.com>
Signed-off-by: Barak Biber <bbiber@nvidia.com>
Co-developed-by: Stefan Kaestle <skaestle@nvidia.com>
Signed-off-by: Stefan Kaestle <skaestle@nvidia.com>
Signed-off-by: Malak Marrid <mmarrid@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 32 +++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 061f1d46fda0d..371a8bbdf6756 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2242,6 +2242,7 @@ static irqreturn_t arm_smmu_evtq_thread(int irq, void *dev)
 
 static void arm_smmu_handle_ppr(struct arm_smmu_device *smmu, u64 *evt)
 {
+	struct arm_smmu_master *master;
 	u32 sid, ssid;
 	u16 grpid;
 	bool ssv, last;
@@ -2252,6 +2253,37 @@ static void arm_smmu_handle_ppr(struct arm_smmu_device *smmu, u64 *evt)
 	last = FIELD_GET(PRIQ_0_PRG_LAST, evt[0]);
 	grpid = FIELD_GET(PRIQ_1_PRG_IDX, evt[1]);
 
+	mutex_lock(&smmu->streams_mutex);
+	master = arm_smmu_find_master(smmu, sid);
+	if (master && master->pri_enabled) {
+		struct iopf_fault iopf_fault = {0};
+		struct iommu_fault *fault = &iopf_fault.fault;
+
+		fault->type = IOMMU_FAULT_PAGE_REQ;
+		if (last)
+			fault->prm.flags |= IOMMU_FAULT_PAGE_REQUEST_LAST_PAGE;
+		if (ssv) {
+			fault->prm.flags |=
+				IOMMU_FAULT_PAGE_REQUEST_PASID_VALID;
+			fault->prm.pasid = ssid;
+		}
+		fault->prm.grpid = grpid;
+		if (evt[0] & PRIQ_0_PERM_READ)
+			fault->prm.perm |= IOMMU_FAULT_PERM_READ;
+		if (evt[0] & PRIQ_0_PERM_WRITE)
+			fault->prm.perm |= IOMMU_FAULT_PERM_WRITE;
+		if (evt[0] & PRIQ_0_PERM_EXEC)
+			fault->prm.perm |= IOMMU_FAULT_PERM_EXEC;
+		if (evt[0] & PRIQ_0_PERM_PRIV)
+			fault->prm.perm |= IOMMU_FAULT_PERM_PRIV;
+		fault->prm.addr = FIELD_GET(PRIQ_1_ADDR_MASK, evt[1]) << 12;
+
+		iommu_report_device_fault(master->dev, &iopf_fault);
+		mutex_unlock(&smmu->streams_mutex);
+		return;
+	}
+	mutex_unlock(&smmu->streams_mutex);
+
 	dev_info(smmu->dev, "unexpected PRI request received:\n");
 	dev_info(smmu->dev,
 		 "\tsid 0x%08x.0x%05x: [%u%s] %sprivileged %s%s%s access at iova 0x%016llx\n",
-- 
2.43.0


