Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71C6C4450C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 20:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T9gAHke43E9NARCgwLis/EWSuaL8oNtcCDvUCs3PF3E=; b=W7KCrg+WpA3v6AHuOL7vdv2DU+
	P2ldHPIQIVfyxnEqcXl/ANH4ZzE76Gr+ykgzazSaL6BPDrnN/4YfV7g9RZjwqxVCgSiMU+Pw3BB9S
	C4PjJsyVxWPxC6CvNsQLFttv/jTFVK0iWJ6G9r+aRL8l08vAxLiI39xr3FPoNG2RZPvmskgEZ/MhG
	WAUEOcNcnG3BnabN3SOwgpYhBVsLXaRUuInoooXII31zLDwWAWY74M0KFuYtCs3pIty0f+QxGO7cQ
	RW66VDwv6IXox+5ANwTenIpTOXnW8qlozpFnRQHhFBwV9KXkHsvBecXY03NI9QfphW3klBu18ohIa
	1WQUAnKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjkAT-0000000DH5s-35FF;
	Tue, 14 Jul 2026 20:55:53 +0000
Received: from mail-westus3azon11012057.outbound.protection.outlook.com ([40.107.209.57] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjkAK-0000000DGyi-1kCQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 20:55:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BFGnTqOPQC3VolKBwdcJ7NU4LDvu8yE9RlD8SEwU3qa5Bf8zjQY2foBYhjkBqA/XpJ60JE42W1CCOfOig6md+LkbWPDgo0Kup1SDPZlcc7qt63tP698Xhy7U7HNgbQWLQKtqLMC4PcZD3MWiVoZqbmdW9yjssiwsaRADhWbw/Paf0RjXnHV+fhs4gdmBT2wXRGTsuZTu+ISWuVwvwaMGJvLpSM0we+VbcU7zwTHfF4P4J3pypkHarizDQEdly1Gq69+a/X/6Wx9wcwpd6jmVbLbbJSrBqImEleq58AhFxp7E0nV5KjK61djtNr86JdWd2U6LzITKtPamv4/UtLR+LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T9gAHke43E9NARCgwLis/EWSuaL8oNtcCDvUCs3PF3E=;
 b=Wh0PEy2E0Jp+Egsuigak6Tm8ibgtInGKHWiQCwp+vW6erCC36s/BFh8Su5f7z4EH4jrtwaDYxgUH95nKO+06EoSG5dBIkUX0m6P0VT9XCBF8kcATDvi96mAip69WBMlp7SR5lryzLV+gNaSDia0itAe71c7G7CGIDy3+Snhe+LVe30LhHnBavVOyPqDA7XjHslEabUrR7Fda3v08QEVWgtAEQhtLAjLAuHUmqQto3AvRkmdO0k7A0lHXhtC1k5KGMOKejRwK8/Z2JtvGmoqCdYCcJOhtHbzWiDED3A4+hJGOgGk+R5Rii12mlVM/pKSdaGLDUXr6AtUtC9ndgyngYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9gAHke43E9NARCgwLis/EWSuaL8oNtcCDvUCs3PF3E=;
 b=WaWe9CCJxSk2jw46RXQRQxSXvRhtamH5nyHN6UVc1tQyPhEkjCLrCGFu+XgWXk56iWSpb6UqQ3R9MmDrafCv6Ilnq23Gp/osFwRMwY8gHMvLB9VuE7JtLMCf3DjnwIgXu5rryocwcrikDBNeKKuliYHM/mf5WzJtbfJAh54PnJD/IBAAFuF/p69Dw5sbqSfSihSS7Hn32X85CRSVM2PsqBe9VKkJItTHTmTNF6wMS+GBbvmfhW4fkyoS6mqseoDFctxFif2Z+AKRmxBHE8FPbQP+c8ABkTaOKWuWHfw2lmscmFjP8XbiWPyCKhBGEPYVkNYhjZgcYfN76njBhg+K2w==
Received: from BN9PR03CA0589.namprd03.prod.outlook.com (2603:10b6:408:10d::24)
 by DS7PR12MB5741.namprd12.prod.outlook.com (2603:10b6:8:70::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9; Tue, 14 Jul 2026 20:55:33 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:408:10d:cafe::5d) by BN9PR03CA0589.outlook.office365.com
 (2603:10b6:408:10d::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Tue,
 14 Jul 2026 20:55:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 20:55:32 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Jul
 2026 13:55:13 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 14 Jul 2026 13:55:12 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 14 Jul 2026 13:55:12 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>
CC: Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)"
	<joro@8bytes.org>, Jason Gunthorpe <jgg@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 02/11] iommu/tegra241-cmdqv: Synchronize the error ISR against VINTF (de)init
Date: Tue, 14 Jul 2026 13:54:59 -0700
Message-ID: <0ed2144a80a3750ee6638336b575b5b968949be6.1784059577.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784059577.git.nicolinc@nvidia.com>
References: <cover.1784059577.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|DS7PR12MB5741:EE_
X-MS-Office365-Filtering-Correlation-Id: 71da4e7e-eda0-4f63-fc8d-08dee1ea3f12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|376014|18002099003|22082099003|5023799004|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: d7eT6Gec08Y1/esLsCukZ0bcihCbtDNB89jiptz+t4Q/pTI7WeNjAxMs+g4XF64jTR82mtNt6oAtn8Vtvaxtp0k5jzqNJ1VjivUyoO0e/Ai28KrKNE2WbgE7rE/7/JRMtWr1CV7O4qU/55pNR7sraoKhA3jj7fFu17P0s40EERaJN6XzERt3d86fkYxi5XzU6H0NCJ9EjwVFzS33qAdYvieXJHJsZSWKvNXFX3Mpt6toVPImbBwLYaXkyBhk83w39Z3Dd5DB1bRpRT3l9cZNvxu3i8xvqvSuScReMlg+5w14yFdSvMnmo6MoL3dYV5jYv3+ghIas0oItKg8Eo74f0IyaJXUp+/rHAMIJVXDYN4Ce5BGCFz3gtSsrfGM2oPmKvfVl/qzbGUYocUxdoGmIlNfUdRCjuNBkoGIA5ZtTRZYds984vxlMU152pgTEATDiZZAAdN4t1HjsoA34MET9+3hklsYDY22OBbY5RM8zTce+Hvc493dCi4umWsVxrSPC37NU/sbg8zo0krm1uUeTZf+B7w6z8yUl/tIM6m4v+RusMSAnDY/ChNoYYJyY5p4XZggH+QX0g/xHgd02f3Td3lIiyXDSFDZpMkIdRlGlZpsiUpNp0ylO+QlQ3retCc6Vxvh/BG7nlAah9Cw4vO5wVeSR9JhEWWiCJMOQiWXpYkOTVvPjTXn15iElI6q4NXYDO50J/q9qs2bzOW+ZUNsPqQ==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(18002099003)(22082099003)(5023799004)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /FGbpdsdUWML/TixHq2XQP0RB14DBPCgwANeRqYSUMNe0pJEduPpWkkRLUvmtK4eodmZ3Jh4zjVxh/cKoDQORi1JOgLnxCWxLMAHHVF7EfzhJ/NJDvsR0SioCe7tu3epcj6WMfopfY1UOhekN22vEiF2ft47CU6nvpFvzYmhcvPN3QB8mgCvRY3NnKhhH6h04+EVTxniNv1kLzkARSDD4BaFrs0iI8QGXFbI8RSDH2RVqHk+0f5fkBzWxshD50DZWxQNlBeeFdMnhIINUFN/pOSkiApJKeH8QI3Jb8r+7ZTU/SbKmolDL1VL9Ab0L7uD6aSFN/SfSCHid9FMgFx9j2ELOYsXfagjSrVdqkE9ngjVAw7ABrS6DOMG9tptYpbtU3mpDQ55l8SXnVdbv0a6jhzrrRBPlni5rC8fQha63x2Q8eq5tJ743BqA3fWcIEN9
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 20:55:32.7892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71da4e7e-eda0-4f63-fc8d-08dee1ea3f12
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5741
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_135544_467105_A17D38A0 
X-CRM114-Status: GOOD (  18.10  )
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

A user VINTF is torn down by tegra241_cmdqv_deinit_vintf(), which runs from
the destroy callback and from the init-failure unwind in the alloc handler.
It clears the cmdqv->vintfs[] slot and lets the iommufd core free it, but
nothing serializes that against the error interrupt: tegra241_cmdqv_isr()
reads cmdqv->vintfs[idx] and dereferences the vintf. A concurrent error can
make the ISR read a slot mid-clear (a NULL deref) or use a vintf which is
about to be freed (a use-after-free).

deinit_vintf() also returns idx to the IDA before clearing the slot, so a
concurrent create that reuses idx can publish its new vintf into the slot,
only for this teardown to erase it again with the stale NULL store.

On the other end, tegra241_cmdqv_init_vintf() publishes a new vintf with a
plain store to the cmdqv->vintfs[] slot, and the ISR dereferences fields of
a published vintf such as vintf->base. A plain store gives no ordering on a
weakly-ordered CPU, and a stale VINTF_ERR_MAP bit on a reused idx can make
the ISR pick a vintf the moment it is published, before its fields are set
or tegra241_vintf_hw_init() runs.

The cmdqv->vintfs[0] slot stays NULL until tegra241_cmdqv_init_structures()
first creates VINTF0, so the slot 0 read needs the same NULL check.

Publish every slot with an smp_store_release(), and read each slot in the
ISR with an smp_load_acquire() under a NULL check, so the ISR always sees
a fully built vintf or NULL. Also make deinit_vintf() clear the slot, and
synchronize_irq() prior to returning idx to the IDA, so no vintf is freed
under a running handler and no reused idx is clobbered.

Fixes: 4dc0d12474f9 ("iommu/tegra241-cmdqv: Add user-space use support")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    | 37 +++++++++++++++++--
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index f843d607c8134..5fbc1c85874a5 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -335,6 +335,13 @@ static void tegra241_vintf0_handle_error(struct tegra241_vintf *vintf)
 	}
 }
 
+/*
+ * The CMDQV error interrupt is edge-triggered, so a pending VINTF error fires
+ * this ISR once and does not re-assert. An unacked guest therefore cannot
+ * storm the host. The HW latches and forwards each new error event on its
+ * own, so an already-set ERR_MAP bit does not suppress the interrupt for a
+ * new error.
+ */
 static irqreturn_t tegra241_cmdqv_isr(int irq, void *devid)
 {
 	struct tegra241_cmdqv *cmdqv = (struct tegra241_cmdqv *)devid;
@@ -357,16 +364,27 @@ static irqreturn_t tegra241_cmdqv_isr(int irq, void *devid)
 
 	/* Handle VINTF0 and its LVCMDQs */
 	if (vintf_map & BIT_ULL(0)) {
-		tegra241_vintf0_handle_error(cmdqv->vintfs[0]);
+		struct tegra241_vintf *vintf0;
+
 		vintf_map &= ~BIT_ULL(0);
+
+		/* NULL until tegra241_cmdqv_init_structures() publishes it */
+		vintf0 = smp_load_acquire(&cmdqv->vintfs[0]);
+		if (vintf0)
+			tegra241_vintf0_handle_error(vintf0);
 	}
 
 	/* Handle other user VINTFs and their LVCMDQs */
 	while (vintf_map) {
 		unsigned long idx = __ffs64(vintf_map);
+		struct tegra241_vintf *vintf;
 
-		tegra241_vintf_user_handle_error(cmdqv->vintfs[idx]);
 		vintf_map &= ~BIT_ULL(idx);
+
+		/* The slot may be published or torn down (NULL'd) concurrently */
+		vintf = smp_load_acquire(&cmdqv->vintfs[idx]);
+		if (vintf)
+			tegra241_vintf_user_handle_error(vintf);
 	}
 
 	return IRQ_HANDLED;
@@ -730,8 +748,18 @@ tegra241_vintf_alloc_lvcmdq(struct tegra241_vintf *vintf, u16 lidx)
 static void tegra241_cmdqv_deinit_vintf(struct tegra241_cmdqv *cmdqv, u16 idx)
 {
 	kfree(cmdqv->vintfs[idx]->lvcmdqs);
+	/*
+	 * Clear the slot and drain any in-flight ISR before returning idx to
+	 * the IDA, so a concurrent create that reuses idx cannot have its
+	 * freshly published VINTF erased here. A plain WRITE_ONCE() suffices
+	 * since clearing the slot publishes no data. This also covers the
+	 * init-failure unwind, which reaches deinit_vintf() without the
+	 * destroy callback.
+	 */
+	WRITE_ONCE(cmdqv->vintfs[idx], NULL);
+	if (cmdqv->irq > 0)
+		synchronize_irq(cmdqv->irq);
 	ida_free(&cmdqv->vintf_ids, idx);
-	cmdqv->vintfs[idx] = NULL;
 }
 
 static int tegra241_cmdqv_init_vintf(struct tegra241_cmdqv *cmdqv, u16 max_idx,
@@ -757,7 +785,8 @@ static int tegra241_cmdqv_init_vintf(struct tegra241_cmdqv *cmdqv, u16 max_idx,
 		return -ENOMEM;
 	}
 
-	cmdqv->vintfs[idx] = vintf;
+	/* Pairs with the smp_load_acquire() in tegra241_cmdqv_isr() */
+	smp_store_release(&cmdqv->vintfs[idx], vintf);
 	return ret;
 }
 
-- 
2.43.0


