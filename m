Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436FAC624CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 00:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sYr34MAu0X5AqiR4rtEj8Ame+wdQHOc776+em5XfcuI=; b=dH4hQB7TY7fAvB704TkCIUOLjo
	yGKMv5zHZ2yOg493yL72w2YPg6e7P3Y/A1S4LLaQZwtyEn581/buMJKIUv4WT3WgNnL0ZfX3agcvq
	EjRJSbyEiprSY20Yj4TcbEvZAaGHR3agy/dJIZQ922pioQqrYormjIM0CkobyN7uIVYKImoxfIjWF
	3Umw1S8w/PVg3LkWg+CFJ+KpEtcxo6SBIuNgV1bP6byQIkqSVoho7FtyGMPgMpYzhhhkdrVZugkxM
	3P4AmYU2ZvhYKVE4Feo73+INO3ZnQFDQTI7tN1v+5Dhh4U51QM1D4p8lVGfrrRNLivuRJSv9ZkMKY
	hbhuyw+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1CSh-0000000AjZb-3I1y;
	Tue, 01 Sep 2026 00:34:51 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1CSR-0000000AjMz-18Zv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 00:34:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FSsEoNZiAibR2/QuqZKAQeNVtjedXn6a1r3vhf5DxRZaU2D2AJs9bTt2z5CSv+aSB4D9gyS81GgKIdc988T6SFN9nrrFFK7BPmaCE0pzEog9TLKnbC/FgZSpNEl+7Pyu0hzBOdyr/ud9px3pQgvu5SM8EfmbO8Ubu8pbKg3keTxn8+wHK1yOU4uSC69PqXWQrDp0h+iUeODW4CK+imm+gWLrw0+WJlsahG7YVcnx6rIuPgaj8I3zzkfR1di4+j8F7FfmOIPKbd5IY9HkmgeRvAndTwlxcSl6SITcNTV2Cs9E9AZqi2LH0qHTsQRHCB4+ZrGQDV3YYcKgcElvxtrK4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYr34MAu0X5AqiR4rtEj8Ame+wdQHOc776+em5XfcuI=;
 b=KqilDi+5MbDPc2V0M6wmlRJpU7b6kmNLlXt1+ASt/PCPThtyQkPi971RYWq6t3l7KvZofqIlf3DVN8v0GrjwKW6rCN8VUz/MofEdscsqJ5N8n/VcJ5vWgxKbViwkLu0ZljrNd08xsjFRqnpf5t7WNwJ32+2CF3jW9M0gOelcftUdtVofGduHogFMMHy3d3Aliy2IwzbZHFPL7Vnzsl7UlSrWBJCgh+S/+ANDxz7O+ey482Okrl9wfesTDlR6veUDmGb3wuIq0DVawCUEFLEPY8nBAhPx00f/P3Hlr6TAazqYqbFBmL8x6PKNNOw6QHcl8JgQ4rNTvxMlP+HldI+sig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYr34MAu0X5AqiR4rtEj8Ame+wdQHOc776+em5XfcuI=;
 b=G4VH/HY1ytw4NYLGw61JUe/65zKU+7R1Od1go/O4A066VTf6XTkuYHric3z3GVkXSFfX68ICJTIhFex+f+3YegSD1fBcBG6oWJCj7jJ9l3kfeDSaAUuaXYjVybMtZ5IuVJa2Z1qGnuIHhWtvWBu2djCRIIGhnx18JsFZ+0PhimB+8lvGZzPz/cVymv01+adotCLrRtX9EIfYo2E8uom5OWqXDjZywN+M7/1cp/vzYnyOqbJas1Td20dFBh71b4IVvxrdAajmDg5eYbvu/ED0sy7IxXqOhRokcqbIz3pxcT1Qv1aquKBEjWAEX3bX/8CxaNDO0HuSBSct0ZBUPpdELw==
Received: from BY3PR04CA0003.namprd04.prod.outlook.com (2603:10b6:a03:217::8)
 by PH7PR12MB7937.namprd12.prod.outlook.com (2603:10b6:510:270::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 00:34:30 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:217:cafe::a6) by BY3PR04CA0003.outlook.office365.com
 (2603:10b6:a03:217::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Tue, 1
 Sep 2026 00:34:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Tue, 1 Sep 2026 00:34:30 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 31 Aug
 2026 17:34:12 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 31 Aug
 2026 17:34:12 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Mon, 31 Aug 2026 17:34:11 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>
CC: <joro@8bytes.org>, <bhelgaas@google.com>, <praan@google.com>,
	<kevin.tian@intel.com>, <kees@kernel.org>, <smostafa@google.com>,
	<baolu.lu@linux.intel.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <skaestle@nvidia.com>, <mmarrid@nvidia.com>,
	<skolothumtho@nvidia.com>, <bbiber@nvidia.com>, <harsha.v@oss.qualcomm.com>
Subject: [PATCH v3 07/13] iommu/arm-smmu-v3: Disable the queue IRQs before disabling the SMMU
Date: Mon, 31 Aug 2026 17:33:32 -0700
Message-ID: <a6fba7f7a01f5955dfb44d34adc6262c8534e829.1788222486.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1788222485.git.nicolinc@nvidia.com>
References: <cover.1788222485.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C8:EE_|PH7PR12MB7937:EE_
X-MS-Office365-Filtering-Correlation-Id: 926beaf2-8ae9-418c-11d5-08df07c0c96a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|7416014|376014|82310400026|1800799024|23010399003|10067099003|3023799007|22082099003|18002099003|11063799006|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info: Y5k1DwO0w4XV3PSIIFMFo0bAv964fzgxwibwesxpYM7nq02aKc1XhId5X9e7lMOeGSVv4WWBWyDKgryHwwrERFX9y8FyDExeDhltYwQ7X6mX3KRDFPg9jF4rGzoI7QGXTZkjAgaVeK3ipxBukG6RR914v8ySYDpHkjdItpTKtG33Akio12OIh/2QMk9siDHKdqL9/bXk/z0LYB5g+OLNySDRKcVpKRLcmJ9x/dX9OyV0iEUzOnga7kiwPCakiD20Vo02huQFXSX+3N88C1vl0RX5Yif6xIFVwlyC1VUnRwSLAe/wGklYkEilOa1789XsQ6L6v/JoPeDDW1I19WL4dE7UmftC8N8NuaL2kgHW8NQUIlpN4eiZJbjRU1rU8oZUUogeA6QMU2VC3GEpboIRVwvf8OJlYoJReg4kCCmiw+RN6P0FpHPtKjRbUhvs0dwhpMeDXcGal2+3kMnXrvIyN9jOEWWdwzk2TJ0pkXFi+4IlzZr6+RL4VvJiFQIfhQiKXUE6/PP0kglHYcu+4XDK4kYnuOCRL1XiHZgmm2xA8LzhoKNVnV2dWylf5jWO3HD1CmTEkAR17PGneXhJ2r7OtIJWV8WeOTnrpkhvCUihrY18CQdVdn5qXSXosYA+ZrcdwWT8VbrLraEmBUadLrNqq2Sqxqk93CDxegq+LXDNzK4RlFVp9uQmkhBKP4cxS9SdG7a5UFGZqggFARhj7nXhUw==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(82310400026)(1800799024)(23010399003)(10067099003)(3023799007)(22082099003)(18002099003)(11063799006)(56012099006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wI/RrQMacTE5tG2C/rNzuMDASpm2mX0wcpV6jHyqgQWgH20hJCDlYznbP0nEXQ5uNjx7DcKrH+YV8DSShI3LzXc+tU6a5Hp8mxUfr0CBGYXHOo//2o4ZuPQYqmjD5MXgbZbO2W1AI0hQ12KWN9Bzzr76qr1F7KTh9cSbKE80VjDCnCxKZxtWcd6ogad4Zle/Rzk+rtVbJHn85nn1YKnEzzuk93y/7M8NpLQU06aeZJ3/4rH3PbFOYYebGldlB9MEAU1aP5HjN9E1Hf9LiH2SHl7/mSsJF8bRn8f1t7tjsHlFLNZ9vFpxWI3+6xkCCY+t4O43/19EEcJBwUisU46ssgXL4pVdPbMJxW3tE25D1ndaKI/LyGP+UKuPECW5AUfd64gXJFAh7ciyrkR1ow4mvycEM6PlOj914lRzXaDys79upbp5nQNaBX4dRNyJLNCd
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 00:34:30.3181
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 926beaf2-8ae9-418c-11d5-08df07c0c96a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7937
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_173435_357733_0BEC6355 
X-CRM114-Status: GOOD (  16.72  )
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

The EVTQ, PRIQ and combined IRQ handlers are threaded and issue commands of
their own, e.g. a CMDQ_OP_PRI_RESP for a page request. Disabling the SMMU
while one is in flight hands that command to a queue consuming nothing, so
its poll waits out a full timeout.

Two paths disable the SMMU while those IRQs are still requested: a failing
arm_smmu_device_reset() returns to a probe that disables the device itself,
and arm_smmu_disable_action() covers an unbind or any later probe failure.
Both can run after arm_smmu_setup_irqs() requested the IRQs.

Disable those IRQs first in both paths, so that no handler is left running
once the SMMU goes down.

Also clear an IRQ number when its request fails or is skipped for a missing
ARM_SMMU_FEAT_PRI, keeping disable_irq() to the IRQs that this driver truly
owns.

Note that the IOPF queue needs no such care of its own, as devres frees the
IRQs before running the release action of that queue, which came earlier in
arm_smmu_init_queues().

Assisted-by: Claude:claude-opus-5
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 36 ++++++++++++++++++---
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 64540cfb73244..d45d97f356cf0 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4907,8 +4907,10 @@ static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
 						arm_smmu_evtq_thread,
 						IRQF_ONESHOT,
 						"arm-smmu-v3-evtq", smmu);
-		if (ret < 0)
+		if (ret < 0) {
 			dev_warn(smmu->dev, "failed to enable evtq irq\n");
+			smmu->evtq.q.irq = 0;
+		}
 	} else {
 		dev_warn(smmu->dev, "no evtq irq - events will not be reported!\n");
 	}
@@ -4931,12 +4933,17 @@ static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
 							IRQF_ONESHOT,
 							"arm-smmu-v3-priq",
 							smmu);
-			if (ret < 0)
+			if (ret < 0) {
 				dev_warn(smmu->dev,
 					 "failed to enable priq irq\n");
+				smmu->priq.q.irq = 0;
+			}
 		} else {
 			dev_warn(smmu->dev, "no priq irq - PRI will be broken\n");
 		}
+	} else {
+		/* An unrequested IRQ (e.g. set by DT) must not be disabled */
+		smmu->priq.q.irq = 0;
 	}
 }
 
@@ -4964,8 +4971,10 @@ static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
 					arm_smmu_combined_irq_thread,
 					IRQF_ONESHOT,
 					"arm-smmu-v3-combined-irq", smmu);
-		if (ret < 0)
+		if (ret < 0) {
 			dev_warn(smmu->dev, "failed to enable combined irq\n");
+			smmu->combined_irq = 0;
+		}
 	} else
 		arm_smmu_setup_unique_irqs(smmu);
 
@@ -4992,10 +5001,22 @@ static int arm_smmu_device_disable(struct arm_smmu_device *smmu)
 	return ret;
 }
 
+/* Quiesce the queue IRQ threads, e.g. before disabling the SMMU */
+static void arm_smmu_disable_irqs(struct arm_smmu_device *smmu)
+{
+	if (smmu->combined_irq)
+		disable_irq(smmu->combined_irq);
+	if (smmu->evtq.q.irq)
+		disable_irq(smmu->evtq.q.irq);
+	if (smmu->priq.q.irq)
+		disable_irq(smmu->priq.q.irq);
+}
+
 static void arm_smmu_disable_action(void *data)
 {
 	struct arm_smmu_device *smmu = data;
 
+	arm_smmu_disable_irqs(smmu);
 	if (smmu->impl_ops && smmu->impl_ops->device_disable)
 		smmu->impl_ops->device_disable(smmu);
 	arm_smmu_device_disable(smmu);
@@ -5142,18 +5163,23 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 				      ARM_SMMU_CR0ACK);
 	if (ret) {
 		dev_err(smmu->dev, "failed to enable SMMU interface\n");
-		return ret;
+		goto err_disable_irqs;
 	}
 
 	if (smmu->impl_ops && smmu->impl_ops->device_reset) {
 		ret = smmu->impl_ops->device_reset(smmu);
 		if (ret) {
 			dev_err(smmu->dev, "failed to reset impl\n");
-			return ret;
+			goto err_disable_irqs;
 		}
 	}
 
 	return 0;
+
+err_disable_irqs:
+	/* The probe error path cannot tell if the IRQs were requested */
+	arm_smmu_disable_irqs(smmu);
+	return ret;
 }
 
 #define IIDR_IMPLEMENTER_ARM		0x43b
-- 
2.43.0


