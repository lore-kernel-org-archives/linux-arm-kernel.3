Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB8ECD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 08:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+nx/ellcx1Mv97RqkTjRt5fVhpQjE38YqlkbCrr5x2Y=; b=SpJlUe9Mj07VO0+Xdp7ehUix5X
	LdV3E8kNQ9HR6cVOdvfALV/F+zMYVrbTkP1n3y82iH5ab8mOHxW29rbCozH9eK2/AHbXyjd5ZG+hy
	/F/fOV1lrolGjkj62XlYfZMO+QJkOwKGosxx7vn+lc3M9j7CaPTcytwh3AUnGxgFJ7lJEV71OtwAr
	ITeZOzNkPnSGKWp+xVCEkViv8ov9VJLootRJRVhGXdWDbjnJT063CuAzeAaTjOH+HDZrzNY1M+Smi
	jcoeUiHeqZ5AbZMPaHDX+PArqQ7c0db9nJOaujajuW5Silo53UPMjTxc7JaglCWC4SLAc3xReHTzp
	M/Q2XIwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVfK-00000005Jm6-2LyC;
	Thu, 28 May 2026 08:00:30 +0000
Received: from mail-centralusazon11011039.outbound.protection.outlook.com ([52.101.62.39] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVfH-00000005JkG-0N1U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 08:00:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOwVCg0Rv1iB5iIq4n5b8SoXZbZZp5QiWtQUYIlF/4KZ6G2v6ueZLLdZaKdHcxBbAOzGyI4ZaLw2NM2wyT9ps5vGkmsWGTzj/6Hb6xLL9p2j1MvyTsLygweBltm50QxnqGkaAwFsQPW7GFSlr9t1tegMZXET27w/zzmb0eEbpEB58khcJuUjkST5YdwHZh/ayNuXwfRIZRi0IHpmhQ0R5ndAyhqw8NkTiE0RbU+BG3HpxXiLqLSws3eI8qhAbZIeahq6dKbSLSxnu2oOO43jMPNhdkaR1oHUCBKodijdnP+Yg6JX2JzN4pYpPOTPTip1CnHd+oWvueH/NovDiXFqxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+nx/ellcx1Mv97RqkTjRt5fVhpQjE38YqlkbCrr5x2Y=;
 b=PtiOAm2swZ7+h8Dr3uC2CJYQebf+pyAbKgo0WXDr9Q9fAlEf2963+xOqFXUpKEIZ/N2mlaffDpwV5nZ6Jdg/CMUmBIylfFsVeGepNPKXjSU67bf6GFDftsuAl7PMQz6yAmBHHqTCHRQet+GXsWImM2prT21FhDSC4jZvBDnfaM4OxOQBO+CyF+uZOw7ryiu40f4syI07ph0uperepypWBf80c96NPNlqpk24rli4Zstp9jOyiUrJbGQqGaSlR9bMWdiOFccXWcizl9QT5gI7IMk2jRp4cdn/qvnT4GFyJ6306lTMEhKf3MD+RXU+k58Kq3ddzDCCXXECehEsOaoZjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+nx/ellcx1Mv97RqkTjRt5fVhpQjE38YqlkbCrr5x2Y=;
 b=cEsv57JCIO6QVKpwrDuz0hcl3goHM7TOcqhfj/IN0UZEh4iKLRlqDHEcFG5fWix2T2XPIhYy3A4TLvxsU4UOcU3jF0ld5hFZO2BWG/LmJnu30Q1cew4UJ5Dr/9EmML2JezpvHZf4AiQJ4vii3PGenhvBs0hycQyFaMyjZFmOxCZcITggu0gZaLZx1RPGv+g0oy9+chS7KSreJyTcL2WVPJaQ9eJlwQpyu8im3nXEaaV6ddbVwFa+6VQMzR/ic01vPwHNUWnb25Lk18zMXhmvBp1jJtKQAsO11QDqKNLrP6dNCUCGtk3vTyuOCbiJ10l+qkoTn00F5XxdkEYC4COpEA==
Received: from PH5P222CA0009.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:34b::14)
 by DM4PR12MB7671.namprd12.prod.outlook.com (2603:10b6:8:104::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 28 May
 2026 08:00:19 +0000
Received: from SN1PEPF0002BA4E.namprd03.prod.outlook.com
 (2603:10b6:510:34b:cafe::22) by PH5P222CA0009.outlook.office365.com
 (2603:10b6:510:34b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.14 via Frontend Transport; Thu, 28
 May 2026 08:00:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002BA4E.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 28 May 2026 08:00:19 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 28 May
 2026 01:00:02 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 28 May
 2026 01:00:01 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 28 May 2026 01:00:00 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>
CC: <joro@8bytes.org>, <bhelgaas@google.com>, <praan@google.com>,
	<kevin.tian@intel.com>, <kees@kernel.org>, <smostafa@google.com>,
	<baolu.lu@linux.intel.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <skaestle@nvidia.com>, <mmarrid@nvidia.com>,
	<skolothumtho@nvidia.com>, <bbiber@nvidia.com>
Subject: [PATCH v2 03/11] iommu/arm-smmu-v3: Add arm_smmu_drain_queue_for_iopf() helper
Date: Thu, 28 May 2026 00:59:31 -0700
Message-ID: <a62db13ab63916e9a62cddeec41a74a98cdf6a8f.1779944354.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779944354.git.nicolinc@nvidia.com>
References: <cover.1779944354.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4E:EE_|DM4PR12MB7671:EE_
X-MS-Office365-Filtering-Correlation-Id: 772d3ebc-3191-48f8-5f8b-08debc8f2971
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|1800799024|6133799003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: YqVyF1ZPfyF9sftfzmiuoLh9ejpveI/l4Zc9RnbrWgD2QaqIcwJdkQbNGW0Chl96xEng2hVBujzlVNDTwY7fPnMhLuPQM/G6WwUPpXWK1paUyt5/gZeKBsCmGG5frU6TFzPi2CrWhqjao/nQ/vCn5AtknWzQSR0tFlgUVayM/Cfy8yEswawhHEQSZrXe35PCj+zs3cyAgqjKXux9ZsNU2vVThoT07pa/MlEhL6kOYfawVVwIP93iRC/SVuauOtuEBIQUm6xbMlMv4LR1nVOfl6FHaZ23SmrnEKPPpNXD/3T7dMOUJsFGf2Xalpcs0o77baD16/kuyiY2EM/sokKOAnjLilNQXxiHW1zLYnQpDg+4iQOeXs1mc+G19BHDRR0siK11eQxY+mxNSm5GcGgMsnFQHq0uZ2ciXBOtleEZtNGExKRuVgVcRxQWSCCFZp6D9IeXsUfluFvmK8g+VhqvDg9yPVGq5XD3nwGFTxnnABukfEq0wFhTxPq5vUG85oGg4vWnajSLbtwmo0bXujGgZVR24KlcSWTWEP3pAbdTSnXMYKXau1Laa9Rncv/zogfcAFrX1zgp/MfvR2K48vjR6xYkVnHp0eDBBHNG20l8dFie8le5ppiTbbpqdf1tUreDzEyrsM7cMwMpMtmcCwyrqdTHI6DTBJychLxr9sIPu0b/H8sCtVSVz31cEtjCslkFijImOBrd2feBCyANuorVGz5zWFJvrY2CnPIjsTKzvHQ=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(1800799024)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: K8ihJEIZzKW03FPO9iXnMAMw35uVTDOIHs+yDnSX5n7FZUZE4FQiMP6MO43U8ZeqeoX2uja1s25qFDh3wmLahit351AWlbOeUhLjBTleFrlxHYuUplOC+tR/iXzuHj1VF4gikEmx42MT/N3jXy35w3vuaewb7TZa1XAldlPKR3hj/smlqdLsMCpRGB7ZhRn9yc9CREzgbx83vGZS32N/rYyFpJA4vZPp/5/rnX5ikCysyUzWRdDAj9JBTpyM9QxmNoBWaLQl94NRw2FDXpWT3AaajCUh814okQ2auSlPFnapW2KY6Hw69W3X6eccKgxiIeiE3Wh4MwQUOMTToCaJ8iRAUnSBWax3PJyfzoG2SXsYY8HBzxurzQ6Dk07X2fwtkMpzi7B1vxzZbBjqgqCBMpJTIFmS+GQUHBPxDGHB6qNT3cHNMlxMAFDbxUkzfVFg
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 08:00:19.3317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 772d3ebc-3191-48f8-5f8b-08debc8f2971
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7671
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_010027_135625_F6F3E381 
X-CRM114-Status: GOOD (  16.45  )
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

A poll-until-empty form does not converge on the shared EVTQ or PRIQ since
other masters keep advancing PROD with unrelated traffic. A fixed snapshot
bounds the wait even under sustained unrelated load, since the target does
not move with subsequent enqueues.

Add a helper that drains an SMMU EVTQ or PRIQ up to a PROD snapshot taken
on entry, waiting until CONS reaches the snapshot. Every entry already in
the queue is consumed by the threaded IRQ handler before this returns. A
subsequent change uses it from the IOPF attach-release path.

SMMUv3 guarantees that after a CMD_SYNC following STE/CD invalidation and
any CMD_ATC_INV, no further entries tied to the pre-SYNC configuration will
appear in either queue. A caller that has completed that sequence captures
its entire in-flight cohort in the snapshot.

Read CONS from MMIO each iteration so the comparison does not rely on the
cached llq->cons, which the threaded handler owns. Disable WFE since SMMU
does not signal SEV on EVTQ/PRIQ PROD advance. Call cond_resched() inside
the loop so this caller does not starve the threaded IRQ handler it waits
on when both share a CPU on a non-preemptible kernel.

This is a prerequisite to apply bug fix calling iopf_queue_flush_dev().

Fixes: cfea71aea921 ("iommu/arm-smmu-v3: Put iopf enablement in the domain attach path")
Cc: stable@vger.kernel.org # v6.16
Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 27 +++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index cf41b3cf5985f..4794a15f351c4 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -894,6 +894,33 @@ static int arm_smmu_cmdq_batch_submit(struct arm_smmu_device *smmu,
 					   cmds->num, true);
 }
 
+/* Drain an SMMU EVTQ or PRIQ to a PROD snapshot taken on entry */
+static int arm_smmu_drain_queue_for_iopf(struct arm_smmu_device *smmu,
+					 struct arm_smmu_queue *q)
+{
+	struct arm_smmu_queue_poll qp;
+	u32 prod, cons;
+	int ret = 0;
+
+	/* Snapshot PROD; entries [old_cons, prod) are the cohort to drain */
+	prod = readl_relaxed(q->prod_reg);
+	queue_poll_init(smmu, &qp);
+	qp.wfe = false; /* No SEV on EVTQ/PRIQ PROD advance */
+	/* Read MMIO each iteration; llq->cons is the threaded handler's */
+	do {
+		cons = readl_relaxed(q->cons_reg);
+		if (__queue_empty(&q->llq, cons, prod) ||
+		    __queue_consumed(&q->llq, cons, prod))
+			return 0;
+		cond_resched();
+	} while (!(ret = queue_poll(&qp)));
+
+	dev_warn_ratelimited(smmu->dev,
+			     "queue drain timed out at prod=0x%x cons=0x%x\n",
+			     prod, cons);
+	return ret;
+}
+
 static void arm_smmu_page_response(struct device *dev, struct iopf_fault *unused,
 				   struct iommu_page_response *resp)
 {
-- 
2.43.0


