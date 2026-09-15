Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4314EC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 16:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9Paxi/2TIhwE2c9Okr0CkK1SPUyPKO37m6mWB8utFg=; b=TVY3y/KLe0iwngKl3tpDjkcDKH
	JlCptDGRExyW3agG97gg2WnE3tAALy7Juy+E87bNmmg/7Z4+5+iUmJ/bxVsHwmktYZJZBRWVUH+0u
	H80lfFis5fCNmSzr8qd+YIo99xRoxDPpDbzB8gUAllvw4a+jHKDbzeLzltQfPW5TerqnozXVcr2ET
	lMUVjh/PkVIYG/Cvmt/+IzVoE1AEyS1DFx2EiAk4NftE8o9TlKLyNDWrCMlbQb9omKAURXJRlZ+om
	iLJaOhfuwhIjxc5s3KW21MUC8qnfKKMHddGUYgTpPWNTqnmrJJf2tIrXHot9ZhANInrjRnzZInR/d
	6QLvlQ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WC6-00000007Qro-0EKD;
	Tue, 15 Sep 2026 16:39:42 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WBm-00000007QfT-3HyS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 16:39:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gDXttry/Oi9cquy11hcJPJujI40yc1P4nqo8wqr4macQ4B3WLFAHhPVYKTZR1sJvi/uRCcPLax2LGYPL1TuLa7X8WuRJyHC6kmKiiLBrKIZyRnAdojJPLPf2/RrzvVz9pI9vnvNwnbCVfdxoE23hedt8j6n857oqfvI9c89WcbypzRhcW4oQPH0FTR34rhXrdu9MQK4o4GsDRSOCTBFmi0FHvxHLdLbPdpaGaYkywqvZoKAXW4sc74fCm1d3/+RVRz/oU0JRyQsqUFdKRdPr4CsymY1L5Y17WTLx4OrC/1qQqK+UvgdZNCejlCGZthXjdAgSYp8bKDeDACoDLJj0kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9Paxi/2TIhwE2c9Okr0CkK1SPUyPKO37m6mWB8utFg=;
 b=J2+Abywg2dVWGm/+g9kUcF5WBo6mt24rguQcVvSFJuMp7IhH+nNzOzDTXMm1XcBkQTRTzuQHkadUTyQZBndF2DXDGLAtdZGHtMrdsWBHYbcbFcKGCxAjm6jC5skdDIuYC3YRH235H8r9wYHP3STwrRBTT+D/2UBO3SWaP44ZCP0svN4PUtR7ShynKtVYLiHjMXGnfy2aP3eC1/emmk5RhYKtrazOwGIPPmz7TiwLZRKvRMpNmpo/tcpAYF2XVp2pM+5kkJTYosrW1j3+X7CMtleplSk5ijN/574YZqQdUuf2cytnTf+7gh2ROr6Dvm2LwzCGeTR5V6PV2HQ9xIXjlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9Paxi/2TIhwE2c9Okr0CkK1SPUyPKO37m6mWB8utFg=;
 b=r2vJvrF409QDE5c9L+bU2XUn8/A6W/KixVqNzAEm4rh6UOV0Ms4cvwSKHyYoVyfB35yozHEpNGD7X7EPz33cFN6gtY18Fk4F1J4lfgFDYCDYdeE8AS/LVCtGA3reTAN4pvNs3HLi9UM/0Z2bxMqWBhYhkBZ9mImblrJuDgQ26IxHb3bATsAOVD+XvIH4JGeCtJEtESV+1r+lxmLK5jKnwmpHKC9TuclKRPGdrm0A+vxARsqJwkRxU2vcGdfl9Iq4vpxGglNcVK4je9x1IxlUlySDNwt1EbCrrD6H04VfdhaaB0uuPznlJT0zXBtLvNdnkDpQBvjgWZr8I3bkCpJKkQ==
Received: from LV3P220CA0023.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::24)
 by DS4PR12MB634945.namprd12.prod.outlook.com (2603:10b6:8:514::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 16:39:14 +0000
Received: from BN1PEPF00018075.namprd04.prod.outlook.com
 (2603:10b6:408:234:cafe::4e) by LV3P220CA0023.outlook.office365.com
 (2603:10b6:408:234::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Tue, 15
 Sep 2026 16:39:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN1PEPF00018075.mail.protection.outlook.com (10.167.245.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 16:39:13 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 15 Sep
 2026 09:38:44 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 15 Sep 2026 09:38:44 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 15 Sep 2026 09:38:43 -0700
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
Subject: [PATCH v5 09/15] iommu/arm-smmu-v3: Disable PRI when no IRQ handler is registered
Date: Tue, 15 Sep 2026 09:38:21 -0700
Message-ID: <ea41f8fede603737093390772bf6dba393593407.1789446520.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1789446520.git.nicolinc@nvidia.com>
References: <cover.1789446520.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018075:EE_|DS4PR12MB634945:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cfe7daa-223e-4637-1237-08df1347e06c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|23010399003|36860700016|6133799003|10067099003|56012099006|11063799006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: v8MG//bMhR4EmmzjOcKo8z3st4eB5b7tX3HqxucTU4Mno1gHOfM9+5estC9S0wM6S+IM2amMAHukfpLTJ5MnGhIVO9qh6e3vxqN1ECti+Qo5/GiMzhw/QB7UEnHUnjJnFpgnyk2qA7BGiToQBtiAeOsKYv6tXUZeu920GN+gtxqKwvFnRrZ0jPlnD8i4Lthc2COJaFLcBdOadd7yRS551HkMBQgVamtsKhFgWaX+b3UxFZ0CN+7kMvx0vJHFtn4f9vAibSUV2gp/xNH/y5TWEDIN7cA7ZiKKkgJEkJL31FX1ZQV21udqKE/3m33Sa/iCKOCCn+jPoPWz+CnI0yFeHNzkpOeqEvaWnOL0v/uUr0+qbUpV3gJDz7Og22dClhjqRCYxwJb0riZ5Nhc3hd879ikLlLPvzzaPZsAJ3lWVTQxcZK+mQfWfUTZiIVt3ekZ+IP1B/6b6Eup8kdpLCXbBBp3CYrS2WwPh+4VqtRzWVsiIOSM0zGhK5d+wrlel5z8q4o7EmOjqYh1ptKIrVJ1+HlT3mX8TVqp7MtxjGG5nccWUMikfZWUbbZW8HqksAFECeeM1oawdo8lqkk1Ce/nhFGmenxLfLGHFBrOPREbcNbSWEGgXkXbb0HwC5gPMv4c1EIJk46Cfg/P7nwE6U5WElMx0SBp4J5btOGiADbc0luuBjgwr0lGGIqCWuoSYSC/XyN/Xb6WotkgAd0bMMGCyvg==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(23010399003)(36860700016)(6133799003)(10067099003)(56012099006)(11063799006)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UHqcr97K5Le7MFTrsHw8iDB0L2C49+8fjDdC6I1PiZQHQbWObEee0uumPnEl8m0kje64y8DbgVfhT3dPcsvwjHOdhj8Wj7LRhT2nTcNnzRv+OdQewZPDXQghw5m8hQ4SvUWTi7E+/pz9ziitHmvTeq7DFwuCeSS8O+kUyhpOjfYh/DqkMqGzq8DUr7M65N3BuUhcDisZMXUD3GHneQ2gF1Q7lW5ASinAdyZrpqTmMOwtSiP78JJNCR7su2sgYDeNPhtlrMrO9NcFhfEG8ueWOXGtV+UYJa3fB/Mx7Kx8IJgSTouXyxyT5yOKJihT4IUjV1dKmvfocqSMZCjk4fhwE+LS7UIKF0zu4V6+EDKyDfTtFLQzaemTA6JGzbLAG9QgmjUlpQbV/hiVaMmeWLXv/uCdznbAy2ueLIjxC4XA7NDbhat8KZzkNmretoweqdhC
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 16:39:13.6801
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cfe7daa-223e-4637-1237-08df1347e06c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00018075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB634945
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_093922_907382_BB5F4C20 
X-CRM114-Status: GOOD (  13.52  )
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

arm_smmu_setup_irqs() can leave the PRIQ without any registered handler if
its IRQ is missing, its request fails, or the combined IRQ request fails.
These paths warn but leave ARM_SMMU_FEAT_PRI set.

This function itself would then go on to enable IRQ_CTRL_PRIQ_IRQEN, even
though no handler will drain the queue. A later patch also enables PRI on
such endpoints. The caller already enabled CR0_PRIQEN before this function
even runs.

Clear ARM_SMMU_FEAT_PRI in all three failure paths, so that subsequent code
treats PRI as unavailable. And disable CR0_PRIQEN after the setup function
returns.

A kdump kernel doesn't service page requests: strip FEAT_PRI when detecting
features, so downstream PRI setup is skipped.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Assisted-by: LLM
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index d2a6dc756c783..40ea5bd382d89 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4944,9 +4944,11 @@ static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
 				dev_warn(smmu->dev,
 					 "failed to enable priq irq\n");
 				smmu->priq.q.irq = 0;
+				smmu->features &= ~ARM_SMMU_FEAT_PRI;
 			}
 		} else {
 			dev_warn(smmu->dev, "no priq irq - PRI will be broken\n");
+			smmu->features &= ~ARM_SMMU_FEAT_PRI;
 		}
 	} else {
 		/* An unrequested IRQ (e.g. set by DT) must not be disabled */
@@ -4981,6 +4983,7 @@ static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
 		if (ret < 0) {
 			dev_warn(smmu->dev, "failed to enable combined irq\n");
 			smmu->combined_irq = 0;
+			smmu->features &= ~ARM_SMMU_FEAT_PRI;
 		}
 	} else
 		arm_smmu_setup_unique_irqs(smmu);
@@ -5161,6 +5164,10 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 		return ret;
 	}
 
+	/* arm_smmu_setup_irqs() might have unset the ARM_SMMU_FEAT_PRI */
+	if (!(smmu->features & ARM_SMMU_FEAT_PRI))
+		enables &= ~CR0_PRIQEN;
+
 	if (is_kdump_kernel())
 		enables &= ~(CR0_EVTQEN | CR0_PRIQEN);
 
@@ -5302,7 +5309,7 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 	}
 
 	/* Boolean feature flags */
-	if (IS_ENABLED(CONFIG_PCI_PRI) && reg & IDR0_PRI)
+	if (IS_ENABLED(CONFIG_PCI_PRI) && reg & IDR0_PRI && !is_kdump_kernel())
 		smmu->features |= ARM_SMMU_FEAT_PRI;
 
 	if (IS_ENABLED(CONFIG_PCI_ATS) && reg & IDR0_ATS)
-- 
2.43.0


