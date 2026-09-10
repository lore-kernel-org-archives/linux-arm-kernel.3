Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18280C88E41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 23:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ICnlVqiiBJ+hddObMiCPv5z+tHbz1S1nOqTNmiktoso=; b=3aD1n1+jW5Tj9nELyOOhMg9b0t
	7SOfWsHB3rudDBzQ0IhZqL+7bFA2EK0XAIjSxVDCK5OoKQ8jH8yuh8mqJJs8SfVUTpW0VVzb15Dz1
	CqvQNtgckwLdn4JGzmrgE7C/qF1xBpnXurAt2VMXoRIqC+tFjjZZ/iQXq8nD6EYdGGzLrS7ZaFJIg
	XvKzU/fO/seTQ7KX3GqwY2Cz+rqPRg8E2LTqAZ4e6QKdG8KZIZSHGbiBc5uH2dYHraptIvVQNy/hz
	uINI6gm1SLjG9UQvv0TITJPrFM3UtPSzYEhulK1ctbgUU7pGaXE6tX5MAfqBbgyZGx3Y9RaScw7P/
	aWXrYDsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4o25-0000000FWZk-3G3s;
	Thu, 10 Sep 2026 23:18:17 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4o1m-0000000FWMT-38oR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 23:18:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lz3RuXyDxvr7OmU3KqhePStPZRH0JBu2LEJ/ZbraSDPyb0jBhq5dAm4qRX3Xb3ejvipvaQeAHo6lRLz2MwKfu2SAhUU0cBV9KvVOXbjzE0L0DpQfxvS2dnNw0Do02sXAbUVjq4bqq/mDBIsDvuxWeXlUvLNFFxNKI2seTwUrtShKeA0wLkYNxhL1uNQn1JN/UMLZP1p1tjRaAkD8eaO7PlD9tb7S8ifVlvW08KS0JFp9tn4gmROifMbKjRifQYDpGmMUWwe4M/uSZ8C8su1A8cRKvYgw8wV1yKv2R3WuRF0hXH0IIKh8d2G6rGlMQVjwT17Tpt5dOi9C7cR3js6rEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICnlVqiiBJ+hddObMiCPv5z+tHbz1S1nOqTNmiktoso=;
 b=onXaJxPIVERdzpuezy8AbwoE/yqK0Y07a0AxoKHdvnqKzYYc+WroeLiSD1STfdm28gbIpd9qiIUwcVnN4Hyme/N4sIRrPo+d+OKCM5eGooiZ9fHvJ6kVSUgVnC4NP5cGZLeinlm24rsEIQamlm7eCVVNUzIaIE1coKUYyI8ObPHc0btfUdU6B3UM1c3a/3DdK19pjHHvnCUhc2cXAjK4NQKM0JeULomAytq45BKXXmU6vvjJQwX+5L0VPlX3F5LOmVIKW66BQSY5L0E5Jrqs79vKT8B1leNCtg2IePR2icY+QfOTr59Lm3iZMJPWynmADjMhByGQ8RzPZq3/jJbjrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICnlVqiiBJ+hddObMiCPv5z+tHbz1S1nOqTNmiktoso=;
 b=Lkb5IJrQAqWOWxpJaaiXIIAVhv9ukmkyge86qDUgkFj9ngwNqawIgC0o/evscipIIVx60fGU9p6UyDrahlK7857/HgY5tCNLw+LnvzIVKQAth2kcCo2IYj0CS+b53IVbq5qeGRH1SQTujRVNAiqfCSN2cbrmGKnScU2UQlniSWyAnahOggdHcRqtKNTis0xGoIuLJwIDuDA8VY9UM/j8pq84WechXmS9cwt6xKyV0BUyNSuTZmcsvUXdKtkYa5KrlKu26atriCoMnbADPB/pHDy77wB+sgRM8CMTqLzwpksskZXvvZhnN9pY+NmTPlBsvjeAHO0bMtA4AguV88U8wA==
Received: from SJ0PR05CA0174.namprd05.prod.outlook.com (2603:10b6:a03:339::29)
 by CH3PR12MB8996.namprd12.prod.outlook.com (2603:10b6:610:170::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 23:17:49 +0000
Received: from SJ1PEPF000023CF.namprd02.prod.outlook.com
 (2603:10b6:a03:339:cafe::10) by SJ0PR05CA0174.outlook.office365.com
 (2603:10b6:a03:339::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Thu, 10
 Sep 2026 23:17:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000023CF.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 23:17:49 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 16:17:30 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 16:17:30 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Thu, 10 Sep 2026 16:17:29 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>, "Jonathan
 Cameron" <jonathan.cameron@oss.qualcomm.com>
CC: <joro@8bytes.org>, <bhelgaas@google.com>, <praan@google.com>,
	<kevin.tian@intel.com>, <kees@kernel.org>, <smostafa@google.com>,
	<baolu.lu@linux.intel.com>, Jean-Philippe Brucker <jpb@kernel.org>, "Eric
 Auger" <eric.auger@redhat.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <skaestle@nvidia.com>, <mmarrid@nvidia.com>,
	<skolothumtho@nvidia.com>, <bbiber@nvidia.com>, <harsha.v@oss.qualcomm.com>
Subject: [PATCH v4 07/15] iommu/arm-smmu-v3: Submit CMDQ_OP_PRI_RESP for IOPF event
Date: Thu, 10 Sep 2026 16:16:59 -0700
Message-ID: <ad96e41dec59e583822912f29d8bc7b443103519.1789081084.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1789081084.git.nicolinc@nvidia.com>
References: <cover.1789081084.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CF:EE_|CH3PR12MB8996:EE_
X-MS-Office365-Filtering-Correlation-Id: e17ea611-56f1-4002-da05-08df0f91baf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|7416014|5023799004|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: xzvrlbJZrK96Z0FQzvA2Y7DS9Vtpb/uwFnmUjUdmi5L2zOdNunO0Ji+dZtj2o9HKiRE2Bnan6+hfXcSj3v1sTv17cNB+APuhQUHlR4Q2/SDgYleydUZ8sNwf+wqSVkJM+G/CYFw3waUH1EpklmJZKOzeFO4h+6w5G40igsimQF978/j37c0MUcclD8K31LmW1ZOvd+3CG6ArFJR6ccB87AkRKYkcT8052sjLmagvRnTctcj6UlSABDE6zXCZwiza44G0SBXTu01vjoQdJlfB87Tuo1/DIZX7P+iS7Yh5P5WljhbAEJfYtX85uRXxcmcgan64OQmwRbBk6XmCFlC/TtRNC75R2Ph5lcS/PRIfjSBLS4NJVGwL3DnCMhLsIrbRpbHiwP8Ho+hcH+l2DB0d8WZbsuJOTu2YMRbDXOc9+P0HhWasS0Br9H+FpLx+0+Ici8lRYi/qgS4ZuPos2Nhk007AhCibqpywUxjEJAQKlcurCRM8BuiRKithxTndKQBizYNBWc5imDpaNGNu11NFmpo1B05q7DNa5dZGWx3CEqLI5czAqqxBULQ3zMPwwUmMlD569t/WI2NdsCO+rS9hXN6tw4VTDHdFemPLdikQ18AfBNdc+F7ED3kXSWuDZ8jT2ZHF124LRi28XVD1K0GFFQK5lkedqS6VeyaqtMkoCGjr1E4NzajYdGIVVbadNZ3Iq9RndofwvLRibnWncbAmpw==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(7416014)(5023799004)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wl54l9SEizUZgmsf9OAUDL3gQx3rmE6fRMfOdEjVB0S2iT7OYtPvwkFwlMToiKg+HAEvq1nzc2AvRgIRp4WGqhRJlZzw6uuOvCde5aTbK+C37McsEl+KcIJZV2XenSRqRfHLPuuq3i/MwUzo+UIEpxQyuagrx+IBzTbzXVjCop9I1rzfee14HyofIj80K5kCRNPaSyg/pGxZcvKHyYqiJJGkwZxisj1m8K6WoIg408gjgLmIk5V0Hd3PX/ZFfyIz0kVD/gRPtqv/ZNKqBgqU85el7NW/wvyC+dp7hh3LIVAGoOP9LnoR17J5Jzct1zmRJJZJssjnmYqfhLvz74FpAjjD0L0BpFacZKRfOcQLaO7/+/4Rr7J/E3yTJYkLwRwZnPQlEPniaXUyMVYXax75QH9LUNyKy/m0OYX/NTfMHg6sb/yyWDXYJwbWK9kQVxXM
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 23:17:49.0652
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e17ea611-56f1-4002-da05-08df0f91baf0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8996
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_161758_817535_0AF1A053 
X-CRM114-Status: GOOD (  19.83  )
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

Both EVTQ stall events and PRIQ requests reach the IOPF layer with the same
IOMMU_FAULT_PAGE_REQ, but these two fault models are mutually exclusive. A
stalling master holds a transaction until CMDQ_OP_RESUME and has no reason
to send a page request. A later patch rejects PRI for such a master, so the
response command can be selected from stall_enabled or pri_enabled.

Note that a CMD_PRI_RESP.Resp encodes 0b00 as ResponseFailure (a permanent
non-paging error), 0b01 as InvalidRequest (page-in unsuccessful), and 0b10
as Success. So IOMMU_PAGE_RESP_FAILURE maps to PRI_RESP_DENY (0b00) while
IOMMU_PAGE_RESP_INVALID maps to PRI_RESP_FAIL (0b01), following the codes
rather than the similarity of the enum names.

Extend arm_smmu_enable_iopf() to also proceed for a PRI-enabled master, so
that attaching a fault-capable domain would set up IOPF for it. Note that
a later change will set master->pri_enabled, once all PRI paths are ready.

Note: streams[0].id remains the RID because arm_smmu_enable_iopf() rejects
num_streams != 1.

Co-developed-by: Barak Biber <bbiber@nvidia.com>
Signed-off-by: Barak Biber <bbiber@nvidia.com>
Co-developed-by: Stefan Kaestle <skaestle@nvidia.com>
Signed-off-by: Stefan Kaestle <skaestle@nvidia.com>
Signed-off-by: Malak Marrid <mmarrid@nvidia.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  1 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 74 +++++++++++++++------
 2 files changed, 56 insertions(+), 19 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 21b00b9296b31..558ba40f2f456 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1017,6 +1017,7 @@ struct arm_smmu_master {
 	/* Locked by the iommu core using the group mutex */
 	struct arm_smmu_ctx_desc_cfg	cd_table;
 	unsigned int			num_streams;
+	bool				pri_enabled : 1;
 	bool				ats_enabled : 1;
 	bool				ste_ats_enabled : 1;
 	bool				stall_enabled;
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 8b7d88d469198..815847c2d7b43 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1031,32 +1031,68 @@ static int arm_smmu_wait_for_queue_drained(struct arm_smmu_device *smmu,
 	return -ETIMEDOUT;
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
+	if (master->stall_enabled) {
+		u8 resume_resp;
+
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
+	} else if (master->pri_enabled) {
+		struct iommu_fault_page_request *prm = &evt->fault.prm;
+		enum pri_resp pri_resp;
+		bool ssv;
+
+		/* PCIe allows only one PRG Response per group */
+		if (!(prm->flags & IOMMU_FAULT_PAGE_REQUEST_LAST_PAGE))
+			return;
+		switch (resp->code) {
+		case IOMMU_PAGE_RESP_SUCCESS:
+			pri_resp = PRI_RESP_SUCC;
+			break;
+		case IOMMU_PAGE_RESP_FAILURE:
+			/* 0b00 ResponseFailure: a permanent non-paging error */
+			pri_resp = PRI_RESP_DENY;
+			break;
+		case IOMMU_PAGE_RESP_INVALID:
+			/* 0b01 InvalidRequest: page-in unsuccessful */
+			pri_resp = PRI_RESP_FAIL;
+			break;
+		default:
+			WARN_ON(true);
+			return;
+		}
+		ssv = !!(prm->flags & IOMMU_FAULT_PAGE_REQUEST_PASID_VALID);
+		cmd = arm_smmu_make_cmd_pri_resp(sid, resp->pasid, ssv,
+						 resp->grpid, pri_resp);
+	} else {
+		WARN_ON_ONCE(1);
+		return;
 	}
 
-	arm_smmu_cmdq_issue_cmd(master->smmu,
-				arm_smmu_make_cmd_resume(master->streams[0].id,
-							 resp->grpid,
-							 resume_resp));
+	arm_smmu_cmdq_issue_cmd(master->smmu, cmd);
 	/*
 	 * Don't send a SYNC, it doesn't do anything for RESUME or PRI_RESP.
 	 * RESUME consumption guarantees that the stalled transaction will be
@@ -3212,7 +3248,7 @@ static int arm_smmu_enable_iopf(struct arm_smmu_master *master,
 	 * device-specific fault handlers and don't need IOPF, so this is not a
 	 * failure.
 	 */
-	if (!master->stall_enabled)
+	if (!master->stall_enabled && !master->pri_enabled)
 		return 0;
 
 	/* We're not keeping track of SIDs in fault events */
-- 
2.43.0


