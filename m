Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DEAC624CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 00:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xp72hsNkYYsonb9P/X5IruRn8U3AoACC96gftLFqAXU=; b=wdMFYW+sfEtTGRwaxHz67+9uag
	eYfTPuggRFpzJSHcS1vrOd55yaSMmjEYOpc2X9YRCERJ5F9dfF8lG3SJRJn0aY9pI7wW8fTDOglla
	6hOV5YADAmBw3Ys1i3SOvh3VSPwzw09F6kwfbatEVlr5Cu1UNhx+ieBKYMv/Knl5Gr9q4suITgn72
	+YpsZF1r9oe+tXGU14Lk5hkJl2HjruSHU6c5zwh9jnh/g9SDG2MfZ9OFVz3KhXdX0nxMzBbNMmv6b
	Cow+BxrTqWjWFngjjNut1I6QE9s+2vcFT9utB5MnQrF78oDut7hMa1OzNSGwHNq9yd4W6BO7fYaS2
	vp/p4WJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1CTX-0000000AkJS-2eQ1;
	Tue, 01 Sep 2026 00:35:43 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1CSs-0000000Ajkx-0IrF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 00:35:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GTnDebKClmWmDJXL6g9+3iX1S0groYQ1WhmFIODxQgCxIIk6ZeR+udY+r5tH3UHzk/Hqj4fhFKqYq/Pl463BRF4WdbHhH3yTCn1X8VVPuI+5UKL6dE+wf5hvhkjsmPPoBKEM05fd3eAL8/6My/YiNM5ZWZrA5/94J6tm6Id7345sQOTTFF0bI+byOGoSwUJMOIWkOK3zC3+g6UYbksTjZhl93trjOE1YVmbo4UrlYcBrq7lNmd7icWh2KZbPA2Wh5nSJ/7KClxkYvnNKfOWxCA0gHfnQdkougNFcmRA/4Z96TahWrYg6ROnEsQIkQa20NBiakoEzkqx/GHuNLnHfvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xp72hsNkYYsonb9P/X5IruRn8U3AoACC96gftLFqAXU=;
 b=Ye8bjBJn1LNwjJSCeymWYK9xCEWEbqyafLuzmasTSgY0mSkw7ISwA55G27qcB9lv/JwRgnZY/WeYFcQmGu67Vp2r5pI+rcIA2Akrsj+FRq0bo1YzwWAnetskJrW2MwnV2siWRJsyT0ZyveZBopWm7FEDTDjoOMjNjusgiICLllSV36KbN7uRvMuBCwV99yIW3g6jaGwqKQfLM2hoJvkbO+t0vIn+CTvBfJWI77u6DkbUC/9NIjn5229dLjkNq01RXTyq4ygpwy9xAZ3X7FPcedx13s0fNupCO+ytmtdcXo8Gp0xPH2Z8rF/o0HXFL2wpzajgr2u6fs/QZwp6szPxNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xp72hsNkYYsonb9P/X5IruRn8U3AoACC96gftLFqAXU=;
 b=MN6Y9Z/Au36fUFx7lYXUMqPXqhDUvGj0zPmmHhmIS+3ZTtuMXJoqpTIrYA5yIQ7w4+S7EOFh64bwymZLCVWOp4Xt9917dSHi/+5UR+qooBbHl02BoVYrwyb2BuQTeHUBiHaYw4k6Bx1CkKEXWTtTvSc1EadWePnfB7BnTYtQTrRXJn6UvHHVOuuaC0A5TEiXMR0domvNVZ61sh0jn2sOsYxZJFKyuZpGm8r55W3WuE2y/QFJAoFcJFcK5VwUJR1lW7up7eOL0yfjs4VAiGwpblqxOLBq+3CfFoOvOKjfhpzilgTZXHFd2S7LjbukYTaHuMZSOX8YkuR6Uu601JKICg==
Received: from CH0PR03CA0019.namprd03.prod.outlook.com (2603:10b6:610:b0::24)
 by PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 00:34:43 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::5d) by CH0PR03CA0019.outlook.office365.com
 (2603:10b6:610:b0::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Tue, 1
 Sep 2026 00:34:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Tue, 1 Sep 2026 00:34:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 31 Aug
 2026 17:34:21 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 31 Aug
 2026 17:34:21 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Mon, 31 Aug 2026 17:34:20 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>
CC: <joro@8bytes.org>, <bhelgaas@google.com>, <praan@google.com>,
	<kevin.tian@intel.com>, <kees@kernel.org>, <smostafa@google.com>,
	<baolu.lu@linux.intel.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <skaestle@nvidia.com>, <mmarrid@nvidia.com>,
	<skolothumtho@nvidia.com>, <bbiber@nvidia.com>, <harsha.v@oss.qualcomm.com>
Subject: [PATCH v3 13/13] iommu/arm-smmu-v3: Enable PRI for PCI device in arm_smmu_probe_device()
Date: Mon, 31 Aug 2026 17:33:38 -0700
Message-ID: <b0442ba9eb1598bf07782b14fbcad284bcefbe40.1788222486.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1788222485.git.nicolinc@nvidia.com>
References: <cover.1788222485.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|PH7PR12MB8796:EE_
X-MS-Office365-Filtering-Correlation-Id: dbda6301-0bc8-4599-1f60-08df07c0d117
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|23010399003|36860700016|6133799003|10067099003|11063799006|18002099003|22082099003|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info: lYINd/oHpElysjCy6Ps7XuZh722l7n3FrdbnhnD2EVAXzmCHWDHoVr3SpG/FMLlwbFnR+xGX50UYaWF/HZ3uWzE/2ll9H5x9EbeIECBsgwS+xKx2fnCASuJ1ZplJEv6ebR+9T3jjtyVq8syJmSOcwQiOVWFYMAtHqvt9fkrLD/gcEm+QwAb2AGA7L31KARx/VLTZtK0kn6htpSgrsdfm+wT1rv/187+qWnVoBgz0qTZlsMIm2tLrJS9a1FTASNFsUIR458VRwgYjP+lrjehTcLAVDhtQ+uaA0/3P1ZKtr2+lV0XwYVzfkWqcU/kKsdqduksw2ovai1YOPySjwrRSwbaQyLi0C44aCSeRhwpK+d9sldfnz/rBqcAbD2BtpbDsU+qQkUD9HVNfEU9AUmTuw553KoAhg7+91vQVbmlWnNBp8ofT70WHOD4TZN6VBaZ6Z6Ywkjl+glI0WUghulBO5VlMEhaLICLoyxpZldlrv7lGJ+eZk6+oCj1qWh3g28HiRRupCnBlrZ974IQNEkMOgDlBPlQjEEFkP7HUTq6+a13UyQZ+MQXt3y469ie2JutUE3wt54PSGPbXc5AmrvWCppfQDd3aSE9vjdLXN8DEvSJEXQBhfoReu0CGWYtVYpH7AbLqZ/ElEa/fO+5t0RZjUM1+R/WDdvY7lQKZ3mbsSgKXx+Gar8tEgd2kZX2dIdu7rgiMKkEtp6bANpUiW/dKBw==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(6133799003)(10067099003)(11063799006)(18002099003)(22082099003)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ckNeVch6eiiIZ/p5tBL30EFS0m9/1jiamGC9RVlk0vYxfqAGEtvf99GSSZS9cPsyJR0Z4GUxfKRucARlpDOk9/hCrzd2G8NAGTzDBH+W7Dt9O22iwClPg0eqqvkUx+Zi1LucjiO5PwgP44yDJcXwYXd+cN+LYNHRVQX36p3h7vUetC6bLeN6dQtsOJvdqhuVjiRFSAFhD/IIc8GCfdl/deggeo3WFU/lVjpuSeKt6ws/eSkC15wDcLsPwfWJOfzfb6SDcYxnGJfIMpwJ5tYZ6xz5EFNOqAIvskXpCSJHQaZMxi4E9psJVb49ThpVs99DBnJlHckCYx7knl5seukeVezDktJGXoPcQbalIJUB2VmESHOV4rlm4z2d6cUG9hHgefsrb/rNkNss4a4E2AEnEbDA7Vcu5OifCKLyjsFDYOt33eiLYvIqfCvowr5VKl0L
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 00:34:43.1342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbda6301-0bc8-4599-1f60-08df07c0d117
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8796
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_173502_138378_6BE2A19C 
X-CRM114-Status: GOOD (  20.62  )
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

Now PRI requests can be correctly handled. Enable the PCI cap when probing
a PCI device. Also flush the priq in arm_smmu_attach_release().

Drain the priq for any PRI-enabled master following the same rationale as
the eventq drain: a stale page request must be answered while it can still
resolve to the old attach handle, even when the old attachment did not set
up IOPF, or else the threaded handler could route it to the next domain.

Note that PRI is enabled at the probe time, while ATS gets toggled by the
attach/detach routines, so a master could have PRI enabled when its ATS is
disabled. PCIe (Base 6.3, Table 10-14) sets no ATS precondition on the PRI
Enable bit. Its only ordering rule is that the interface must have gotten
successfully Stopped prior to an enabling, which pci_enable_pri() already
checks using PCI_PRI_STATUS_STOPPED. Also, a PRI-enabled device would not
issue a page request until it starts to use ATS.

Set the per-device outstanding request budget to the full priq depth, same
as intel-iommu's per-device PRQ_DEPTH choice. A fixed per-device cap won't
prevent multiple PRI-capable devices from potentially exceeding the priq's
capacity; priq overflow is recoverable per the SMMUv3 spec, and it is rare
in practice.

Select PCI_PRI in Kconfig like other IOMMUs, gated on PCI so the build can
stay clean for non-PCI ARM SMMUv3 configurations.

SMMUv3 forbids the Stall model on PCIe streams. Refuse to enable PRI on a
PCIe master that came with stall_enabled, so page_response() can dispatch
on master state unambiguously.

Refuse to enable PRI as well on any master reporting num_streams != 1, as
arm_smmu_enable_iopf() rejects multi-stream masters, so IOPF cannot be set
up for them; keeping PRI enabled would let a PRI request arrive on an alias
StreamID and get a PRI_RESP_DENY issued against streams[0] by the driver's
error-response path.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/Kconfig                   |  1 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 49 +++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/iommu/arm/Kconfig b/drivers/iommu/arm/Kconfig
index b848a4253677d..a31d04f5b031a 100644
--- a/drivers/iommu/arm/Kconfig
+++ b/drivers/iommu/arm/Kconfig
@@ -80,6 +80,7 @@ config ARM_SMMU_V3
 	select IOMMU_IO_PGTABLE_LPAE
 	select IOMMU_IOPF
 	select GENERIC_MSI_IRQ
+	select PCI_PRI if PCI
 	select IOMMUFD_DRIVER if IOMMUFD
 	help
 	  Support for implementations of the ARM System MMU architecture
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 47c95b691503b..d35d814900cb2 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3509,6 +3509,17 @@ void arm_smmu_attach_release(struct arm_smmu_attach_state *state)
 			synchronize_irq(smmu->combined_irq);
 	}
 
+	/* Same as the eventq drain above, for the hardware priq */
+	if (master->pri_enabled) {
+		ret |= arm_smmu_drain_queue(smmu, &smmu->priq.q, false);
+		/* Ensure pending requests have reached the IOPF queue */
+		if (!ret && smmu->priq.q.irq)
+			synchronize_irq(smmu->priq.q.irq);
+		/* Pending requests might be in the combined_irq handler */
+		if (!ret && smmu->combined_irq)
+			synchronize_irq(smmu->combined_irq);
+	}
+
 	/*
 	 * Only IOPF-enabled attachments queue fault work, and such work
 	 * references the old domain via its attach handle. Flush it, as
@@ -4446,6 +4457,40 @@ static int arm_smmu_master_prepare_ats(struct arm_smmu_master *master)
 	return arm_smmu_alloc_cd_tables(master);
 }
 
+static void arm_smmu_master_enable_pri(struct arm_smmu_master *master)
+{
+	struct arm_smmu_device *smmu = master->smmu;
+	struct pci_dev *pdev;
+	unsigned int reqs;
+
+	if (!(smmu->features & ARM_SMMU_FEAT_PRI) || !smmu->evtq.iopf)
+		return;
+	if (!dev_is_pci(master->dev))
+		return;
+	pdev = to_pci_dev(master->dev);
+
+	if (!pci_pri_supported(pdev))
+		return;
+
+	/* SMMUv3 forbids the Stall model on PCIe streams */
+	if (master->stall_enabled) {
+		pci_warn(pdev, "stall enabled, skip PRI\n");
+		return;
+	}
+
+	if (master->num_streams != 1) {
+		pci_warn(pdev, "multi-SID master, skip PRI\n");
+		return;
+	}
+
+	reqs = 1 << smmu->priq.q.llq.max_n_shift;
+
+	if (!pci_reset_pri(pdev) && !pci_enable_pri(pdev, reqs))
+		master->pri_enabled = true;
+	else
+		pci_warn(pdev, "failed to enable PRI\n");
+}
+
 static struct iommu_device *arm_smmu_probe_device(struct device *dev)
 {
 	int ret;
@@ -4498,6 +4543,8 @@ static struct iommu_device *arm_smmu_probe_device(struct device *dev)
 	if (ret)
 		goto err_disable_pasid;
 
+	arm_smmu_master_enable_pri(master);
+
 	return &smmu->iommu;
 
 err_disable_pasid:
@@ -4523,6 +4570,8 @@ static void arm_smmu_release_device(struct device *dev)
 		iopf_queue_remove_device(master->smmu->evtq.iopf, dev);
 	}
 
+	if (master->pri_enabled)
+		pci_disable_pri(to_pci_dev(master->dev));
 	arm_smmu_disable_pasid(master);
 	arm_smmu_remove_master(master);
 	if (arm_smmu_cdtab_allocated(&master->cd_table))
-- 
2.43.0


