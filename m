Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D75F364B5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 19:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YlsgMILGi6M6Rfnr4sWvDKsCUOQ/IqxJ9ZegVh/xfS8=; b=gXjveDWSHP6E48n7T/FZ+/pDnU
	NE2ShkihaeYD+dF92JBxU6W7fPWsZh8W0jVcqmyv3VJUEEJHaeZiNWv9tuoSGPcUH4izCfnx4XelB
	iBfkPnH8bwG0xd/L6MxToQaCcuqWkuoUmiAGneL6E9c6N0wX7dDq0vMAoKvfcvVcERXbs+eRhjXLB
	zGLm4Od6DlJO7AsW2SDTXyiWlL+s6eO4s5+wETKmvqgZS2oeVWvP5XS/rx0Ynrc90vNFDTvXzOw0G
	dXv8p5mPdTHiWTP7oNCSVGQVSq2IBE9XAL4z73iFYmH2CvXZ54uAWwbGXpjA7rgUXxC4P0X8w909p
	iiqXgAgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAvLq-0000000B9tq-1ENI;
	Thu, 09 Apr 2026 19:47:42 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAvLk-0000000B9rX-0Wok
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 19:47:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rlt+ftQB9EamrOy+CPIovI3N1zkobO/+tMmuwbHZgxc4uxXwn8X1LadnD6o/QctF+zB6PhtTU6WA+q//dQOiOhWflg22YHZK2vckiNuR32MmZvpkFg7YPt2E6jc8gZDWbTPKvS9uHG5g5MwnWfal9rUTNbBhOh0+dHSb+tFeK47A3NKOkkqyXzbQttGQyo1d3YfcOWniFMq3cZ1zjCsw4EezPw9R7PQvMx9/+TcHqulOrNIfKtU9Th8c38PWqT8yWG6shZ+R7jvjHcKpc+fMM8dsDNREbYgCFyHbxweNDXdVFHHB+QsKq4rCXafR0hJ1vhdhxd9v8i5XoffX0+A+3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YlsgMILGi6M6Rfnr4sWvDKsCUOQ/IqxJ9ZegVh/xfS8=;
 b=g1bQ/IzzdcDfIplOKaJOX2iDfgOgGXEsGcUKbzCchaJj4ZYc2AhVI5asGBr9i30GvOPqhvISaukM0CFYMAJUaIP3ma5EN/Bp4O06GPmKQZ5WsRZpc+AccZUY2FEZL7QoHVA5EQjj89qmFDz7+T8Gr48j7jH7A6ZmaA0qQElGBrOJ7aTqDWiHTr+d2SHQjTuWpSnh44GCcv1tyUfLZRoBPOcbbC0jnwNcydW/fh19wu1B9AJNIcMXWig/wyQpPh/OOwsg+0drKVPmMN1wGzgK+3wxLFU5pUSF0mbSzzrfrmgMT0WbSnwEb1uCqfZxcMEeBDA9YPq1K4Re0HhJtj3fAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YlsgMILGi6M6Rfnr4sWvDKsCUOQ/IqxJ9ZegVh/xfS8=;
 b=bzib6ixov6kd+tKlQX6wO7VmZriJjiP3nAzW8QYhK7B6RvvFb7RpXebf/En/USE9yDto04qYZgsixSFUYaVTG//PoE/DFUd7fEQnvJNpvSR6ZLg5QSwxM9e9rzRzBSNsOT0kgItyCXNosdovKRxkydaqFyjxT0mp0E6mWACXR7t7Ddo4qCMN/qhD5WLTK4bBnlmmp6HpZSrn6KxsUXR4CJ18voEkhmvLZl9AgyiEnI29shApotOs0lc3H4/xSgb/AQy9VHyxu7fglbrjhtXDw3ACTgm0NroF9CMV4viiCipjoIT5WiZUh5jeKAdyy8hfb0O9VFXzC5u0xCYcvisOdA==
Received: from SJ0PR05CA0204.namprd05.prod.outlook.com (2603:10b6:a03:330::29)
 by IA0PPFD4454CAA9.namprd12.prod.outlook.com (2603:10b6:20f:fc04::be5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.33; Thu, 9 Apr
 2026 19:47:28 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::57) by SJ0PR05CA0204.outlook.office365.com
 (2603:10b6:a03:330::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Thu,
 9 Apr 2026 19:47:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 19:47:28 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 12:47:12 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 12:47:11 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 12:47:10 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <will@kernel.org>, <robin.murphy@arm.com>
CC: <jamien@nvidia.com>, <joro@8bytes.org>, <praan@google.com>,
	<baolu.lu@linux.intel.com>, <kevin.tian@intel.com>, <smostafa@google.com>,
	<miko.lenczewski@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
Subject: [PATCH rc v1 2/4] iommu/arm-smmu-v3: Implement is_attach_deferred() for kdump
Date: Thu, 9 Apr 2026 12:46:51 -0700
Message-ID: <e8ecb53e8b435fe324e685ebcc4942a3204a733b.1775763475.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1775763475.git.nicolinc@nvidia.com>
References: <cover.1775763475.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|IA0PPFD4454CAA9:EE_
X-MS-Office365-Filtering-Correlation-Id: ebe3c974-1038-4af3-7f0f-08de9670d4e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 54jw8tL56ab3/PmFqeDxELpD8w8u+nKL/fGRxgUFmhOiXSIWNRqgmhfNj9Jzr9JAJeW3aj7/NOiG33S2Xj+o8RBOeRXJyYnabOkodE9vtEvnSC2U1Bt8/3YMLaAbqfhXraitpTm4bJZU44vVdXWURm56sQRu7nhJg6T9+2VMTvsGyvXfmH0aU6y30DgDkPbWyl6f1MvMW+XjeVPPKejjbuAkcqw85bC8S1shdqPzJosu9grV5Wk+nmU/Zgc2oMeyj8FfXOfQxsBDKTcmOyuMcaJ9cmKk1hORpcnuXBdYgXcjipvfYTsAJDaZS6mEpOiqaoA4suFCPsMC3VHBjot4D3HXE72XaOmlZxJNWFsXyGIyyKFBXUXKi/UMaCVlZNtEQNoiWrxqY/9za0jBdfJOy1eXTdGOXjXU9CrXLjQ3A7/0gXzqO9chx/vlmyA5JQ34ZfCQ0Zj/ec5rTT/0Y9jzPsMxaMOOafDVgbQlbhuLMyExrcka+ToIV/wgqUk5WSYg4i1064fV/H+pZovEDmXp+N8Cc+yzIvfzVadT9NA84klHR3MIW+0+8exc8C86CKxIpXTSxb9rOhU0E9rjo1oBn1vj6D5Gg0szKuvPFUCmPnluKIpGH+7coXzSTmEHAqz37z+V5ZNt3aMH6+yXN8oI7vbovti6juPckuunlOEzhLcnlU8jYGHqlXUigrBX/uWD/zmF7foxsM7ykfKaffW751owKNFcjfflfui5c7VMlT3dBoT/mJ9kjnU9Qt6pMkwPKisYqcRDaJ9kq7rsJb/37g==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: tAq8NWwdHwGqpYt9jDGDVKwTreG801jIw19BLwPs7UrY9tTwvriJh0wZO3sSoyH+a3Jz8B7mp62GjWHTLdsS6B8N6tr6QHI06kRngr55cbH98qgS37zoF8KutFURXwD1dsGlX2+owtG3/9UQXUSyoAwgrzpK3+GpOcxuTbTYERXrKbxIfN13wiNiSYBAzOuNyM3m62cg+NU1exZQuW/uLwkGNYKQpwDIiAGT0fLjY1qEuheR7Y9kRVs3hMM0VGoOlg9w8IVFE6T5cF7sz4f+zFbpg6SL3NMdBQ8CB2Q9vaBICjxnqQgq96WZD0UZ8Trls2k0F/ydiz6jOWZD6Mfkv6+bgnwq5j/ECMlqxeoTQVOU/BYT25DSK3B3Ep4s7MUltrzhl7e9sJ7Zuunakyaf1h34z8WIEUlW5lVdnaVYQG7vZ3NKDoAZq9AjUVXk3yDD
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 19:47:28.4863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebe3c974-1038-4af3-7f0f-08de9670d4e5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFD4454CAA9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_124736_212846_614E8F0E 
X-CRM114-Status: GOOD (  15.12  )
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

Though the kdump kernel adopts the crashed kernel's stream table, the iommu
core will still try to attach each probed device to a default domain, which
overwrites the adopted STE and breaks in-flight DMA from that device.

Implement an is_attach_deferred() callback to prevent this. For each device
that has STE.V=1 in the adopted table, defer the default domain attachment,
until the device driver explicitly requests it.

Fixes: b63b3439b856 ("iommu/arm-smmu-v3: Abort all transactions if SMMU is enabled in kdump kernel")
Cc: stable@vger.kernel.org # v6.12+
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 28 +++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 8a1de3a67f78c..ff3c1beb3739e 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4212,6 +4212,33 @@ static void arm_smmu_remove_master(struct arm_smmu_master *master)
 	kfree(master->build_invs);
 }
 
+static bool arm_smmu_is_attach_deferred(struct device *dev)
+{
+	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
+	struct arm_smmu_device *smmu = master->smmu;
+	int i;
+
+	if (!(smmu->options & ARM_SMMU_OPT_KDUMP))
+		return false;
+
+	for (i = 0; i < master->num_streams; i++) {
+		u32 sid = master->streams[i].id;
+		struct arm_smmu_ste *step;
+
+		/* Guard against unpopulated L2 entries in the adopted table */
+		if ((smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) &&
+		    !smmu->strtab_cfg.l2.l2ptrs[arm_smmu_strtab_l1_idx(sid)])
+			continue;
+
+		step = arm_smmu_get_step_for_sid(smmu, sid);
+		/* If the STE has the Valid bit set, defer the attach */
+		if (le64_to_cpu(step->data[0]) & STRTAB_STE_0_V)
+			return true;
+	}
+
+	return false;
+}
+
 static struct iommu_device *arm_smmu_probe_device(struct device *dev)
 {
 	int ret;
@@ -4374,6 +4401,7 @@ static const struct iommu_ops arm_smmu_ops = {
 	.hw_info		= arm_smmu_hw_info,
 	.domain_alloc_sva       = arm_smmu_sva_domain_alloc,
 	.domain_alloc_paging_flags = arm_smmu_domain_alloc_paging_flags,
+	.is_attach_deferred	= arm_smmu_is_attach_deferred,
 	.probe_device		= arm_smmu_probe_device,
 	.release_device		= arm_smmu_release_device,
 	.device_group		= arm_smmu_device_group,
-- 
2.43.0


