Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75146606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 05:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qv+nzDov;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hs0y98uK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GyaW8cKSCvgnBre4vU5D2ynqJt+96uflyUIRP2q47HE=; b=qv+nzDovjGlV9EMreF+wp821Bq
	vrIoJYALGnvcNK7vOVrtOOZHuJXTXedW86+/QxfW2znsGsG/qDpKC8Zpd9CbFn5WvFdJJiodCfg8p
	9fW5zhoX2nWqUAbftfFcYfdwbY3RNTojQ/Qg706B/RB0wystASezWm60NPslVRYEsr3EcgWM2JzBt
	2JttynGYs5xJVFBpfeH9MpzmIKTBBE/iVn7WQbnKG3sNdeEMHD9nRd/hV6oYxsHFOUfmVGRMFuVVA
	/sPwSMlgPx1pGnc0qzJSLtiCzoHLk74pv8wiM1mn85N1XbZujzq+1O7kddZJ6kOJbvMnTlKqpct/F
	23Bw64/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNkSn-0000000FYzO-1Yb6;
	Mon, 02 Nov 2026 05:20:09 +0000
Received: from mail-westcentralusazon11013041.outbound.protection.outlook.com ([40.93.201.41] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNkSi-0000000FYou-1Xtu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 05:20:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nUV86htsIQBhs+jMl5W1Dwx/NVDMSwY5xCkJybQZ1vlnNigXcRJW4s0b9cKJeVQVXp/oD+YnCVOu1EECxSd3w7KrjURZ6oD//lHhWNbny+keLllnP5344qt8Z/kZarVIom7MniYRopQKOoYk27+k2/r6H08CJDuLIL1Ebo5TysgCaI57h3wxs2wrMdHWxAK7b7cGUZn1+kVqDAFodaDyCTjf0iCiZYPmMPzCtobl82w1pzaCejDo7RlL6dfRfiCxWZ3VLWfyXcci5CNqskbjUIOoEqPuU+esqiPykxV6TtwtfWvZ95rZdxoXhcghGeZHDwc3uWOu1/L6jHYvfEV5Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GyaW8cKSCvgnBre4vU5D2ynqJt+96uflyUIRP2q47HE=;
 b=DaCzsrqEbb/pMHmsXxc+43VZjflLWAHVv1rQ9x3KXMRKWg76BzJ9BAOoVm9hsllCo/XVJevf4WZVgRVhCzJC8Qbj3xmUoTPIvq4qTzc1smosnifFZYgCMGcizIfqn0GOLkj41bxR7J4SFJaKJ16kaqdfsuzFR9rKE1cIxbcYaAE612ctWnpsGHjEpAawAAG08X47F/tGpUWxNrTEDJxH6/tSW4L17r7PfPu75CAKWn5KxVgP/Q/1THnENZ7jd1m7AUgG+P8YONuNUDQ46Hc69EuCavVpwETApgVixopxQ93jw+ATO/Ae4Pe5Q0cpTzHSghuHXaiTwEQ/TS+0Ir8FQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GyaW8cKSCvgnBre4vU5D2ynqJt+96uflyUIRP2q47HE=;
 b=hs0y98uKVSTb1z3xg5khUGSbRqxG7MLA3MidN1XM+eDpi4O0XerrO5l0MVEv4WnaLtY8FTnI/XzUqpxz7ToZhWKPlqGxl0A6o+bg5u9BTpfuO0bulCNenraX+k0ZWR5ErBa5jBRQ2jLmrqrbaD2Y3wyvhjbXAkByapmhh2CbQEvOxM+CRH4Rki6mHxMet0CE+aMY6uqsWFvTUjj/3kix6VdAL5/GA5iacCbSMK/mrsSkkvPv7YW/12RjDUt5MzizpvqFr6TyLBiP5iWOIeNdygHgxsxdqyn8Uoi2ehm5PhZ8jt3L0shlcRvXvdcMqtYVdhEyleTtl2sSKfuCDoYLOw==
Received: from PH8PR07CA0008.namprd07.prod.outlook.com (2603:10b6:510:2cd::16)
 by DM4PR12MB8522.namprd12.prod.outlook.com (2603:10b6:8:18f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 05:19:57 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:510:2cd:cafe::53) by PH8PR07CA0008.outlook.office365.com
 (2603:10b6:510:2cd::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 05:19:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 05:19:56 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Sun, 1 Nov
 2026 21:19:44 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Sun, 1 Nov
 2026 21:19:44 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Sun, 1 Nov 2026 21:19:43 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <jgg@nvidia.com>
CC: <robin.murphy@arm.com>, <joro@8bytes.org>, <praan@google.com>,
	<kevin.tian@intel.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <jamien@nvidia.com>, <kas@kernel.org>,
	Cristian Prundeanu <cpru@amazon.com>, Breno Leitao <leitao@kernel.org>,
	<xueshuai@linux.alibaba.com>, <john.garry@arm.com>
Subject: [PATCH v12 12/12] iommu/arm-smmu-v3: Detect ARM_SMMU_OPT_KDUMP_ADOPT in probe()
Date: Sun, 1 Nov 2026 21:19:20 -0800
Message-ID: <12d498a18dc5a40c4e251397e35f995544730482.1793593923.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793593923.git.nicolinc@nvidia.com>
References: <cover.1793593923.git.nicolinc@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|DM4PR12MB8522:EE_
X-MS-Office365-Filtering-Correlation-Id: e784ee16-6a3f-470c-c790-08df38a0ef34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|7416014|261021121427099003|261021135927099003|261022105027099003|261022075727099003|261009223027099003|261026140227099003|261026121527099003|261028144727099003|11063799006|10067099003|56012099006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: o7zg9GOuPkKQvnI7Mg2AMvUAttR3ax0LrUm9xgEZEfDm+kn7qXw1DlNFJrxNAoEgfZ97su+2D0hqZAxaoC0jfR/EHZdBHVuGbi8JEey2HObRHYatvdbjyHazQhJhqmBMEKFiP1ZVkCKaoPSnvhjQGpcVAb/a8QmAgYwB/MHJ6K8/1DkPy+Db5yQptsGW0Wg0AG6w95Nd3Cg1Y3Hso8EG2DuQs2dEE0xXhlbjkby/sRj6IiKO6tzY2XJKGSniil1NwaAle7NCVK0X9Zjrz0TJ2xX5Y8UiO/bd6oOnPkk9cQNCukTVqKcOSNbgPc6LT3j6bQvCdAGw/xPyNFPQeffXALLeCBFAzebq4Y0cUkq7aE3egkX6OK7WgtpW5upuXON03z+hPo8GSiO5u1YOOousKRYDehySyNKDL+btNqsrvbQBSm2h7429sMB6eGKKKWPZoyXkBKnUAb1tl3wXpBJAqP0hIlRKvnYW2OuvglNCLJUUVAXn7EloGxAmzkU0oHlXqglb5EsnXUCVzAEI6fq9EKaoVF6Kmt+A8UuXFc6WvcmoPzhSQdsd7OmyvVrLEckt1xrkkBUKOI7Udzebdvrq1w0sFxwRrWWIF9GzCtXNSiME1udI04UQsuqotGqZfW5HdsJgcDCwhf1lwA+NBFxMZPd6GjD/EgyvZN23HoLCo/CaA+UCr5nk6lWMyjF0EeOICLoeMh1Wtg36DslJBely6Q==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(7416014)(261021121427099003)(261021135927099003)(261022105027099003)(261022075727099003)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /KzUGXaOe+UDXjirEeHHxqXurQ+XpQfbVFBQv8zlb3FqJGHqu9Pjk0LI3q45NOZe+RqZpaTFvWb8NHj1qZfVVyYmhPzbhVk9FR8GlKG3Hs3nf7MugIKZljVg/vFFIjCxs1NB29KBhLlkRfR55gNiEbLv/qCxuDE3j4ORv71NIvKCQwl8Mxr0xTmS5spvQqB6KCLJIxi9ph/ReVl6Xni2zwgV9FH7mfdY2iS3noxQ+zddHhqXlt2kcKxs2ie9IPYiMbfqFA1C5+KP8tBHVk1HkOoDstKSW2HaXFo+Gb/S8gvpSuoHs0Lsmqh12vmCDTPqi5JDmdthMBtJeJOswZ+JfwmIofydcJslmlccCU3mIa5sM362m19wTbyrDzOkL01DibcTtSDT/szNoIt8ifWN5OR1IkNGlwKLVQupFT4S+OrnqURxayae0uh9ygefD7iB
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 05:19:56.8654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e784ee16-6a3f-470c-c790-08df38a0ef34
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8522
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_212004_671153_EF198FA7 
X-CRM114-Status: GOOD (  12.78  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

arm_smmu_device_hw_probe() runs before arm_smmu_init_structures(), so it's
natural to decide whether the kdump kernel must adopt the crashed kernel's
stream table.

Given that memremap is used to adopt the old stream table, set this option
only on a coherent SMMU.

And make sure SMMU isn't in Service Failure Mode.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Tested-by: Breno Leitao <leitao@kernel.org>
Tested-by: Cristian Prundeanu <cpru@amazon.com>
Tested-by: Shuai Xue <xueshuai@linux.alibaba.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  5 ++++
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kexec.c | 27 +++++++++++++++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  4 +++
 3 files changed, 36 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 5b2f6caf16c3d..25622f9e14201 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1344,6 +1344,7 @@ int arm_smmu_kdump_adopt_deferred_l2_strtab(struct arm_smmu_device *smmu,
 					    u32 sid, phys_addr_t base, u32 span,
 					    struct arm_smmu_strtab_l2 **l2table);
 bool arm_smmu_kdump_is_attach_deferred(struct arm_smmu_master *master);
+void arm_smmu_device_kdump_probe(struct arm_smmu_device *smmu);
 #else /* CONFIG_CRASH_DUMP */
 static inline int arm_smmu_kdump_adopt_strtab(struct arm_smmu_device *smmu)
 {
@@ -1363,6 +1364,10 @@ arm_smmu_kdump_is_attach_deferred(struct arm_smmu_master *master)
 {
 	return false;
 }
+
+static inline void arm_smmu_device_kdump_probe(struct arm_smmu_device *smmu)
+{
+}
 #endif /* CONFIG_CRASH_DUMP */
 
 struct arm_vsmmu {
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kexec.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kexec.c
index 2ab913f033515..da157e6620cf4 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kexec.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kexec.c
@@ -705,4 +705,31 @@ bool arm_smmu_kdump_is_attach_deferred(struct arm_smmu_master *master)
 
 	return false;
 }
+
+void arm_smmu_device_kdump_probe(struct arm_smmu_device *smmu)
+{
+	u32 gerror, gerrorn, active;
+
+	/* No adoption if SMMU is disabled (i.e., there is no in-flight DMA) */
+	if (!(readl_relaxed(smmu->base + ARM_SMMU_CR0) & CR0_SMMUEN))
+		return;
+
+	/* For now, only support a coherent SMMU that works with MEMREMAP_WB */
+	if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY)) {
+		dev_warn(smmu->dev,
+			 "non-coherent SMMU unsupported; reset to block all DMAs\n");
+		return;
+	}
+
+	gerror = readl_relaxed(smmu->base + ARM_SMMU_GERROR);
+	gerrorn = readl_relaxed(smmu->base + ARM_SMMU_GERRORN);
+	active = gerror ^ gerrorn;
+	if (active & GERROR_SFM_ERR) {
+		dev_warn(smmu->dev,
+			 "SMMU in Service Failure Mode, must reset\n");
+		return;
+	}
+
+	smmu->options |= ARM_SMMU_OPT_KDUMP_ADOPT;
+}
 #endif /* CONFIG_CRASH_DUMP */
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 3696d11c852a8..80a20e2d922dd 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -5641,6 +5641,10 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 
 	dev_info(smmu->dev, "oas %lu-bit (features 0x%08x)\n",
 		 smmu->oas, smmu->features);
+
+	if (is_kdump_kernel())
+		arm_smmu_device_kdump_probe(smmu);
+
 	return 0;
 }
 
-- 
2.43.0


