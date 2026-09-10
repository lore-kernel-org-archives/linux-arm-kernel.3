Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29FFC88E41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 23:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kKLSfupZoSgA5cwU7ZcqM3ylvCoHJATUagBvxSIuQ/w=; b=t+xow9tgD/9pp1rvJhyJ4CSalE
	hTgU0+jkNeONlZ4f75LPmlZbn1Slyt6FGaAqiUFMhbk8FGpRzaryAo1o9AaXIU2XgiuHBlMuwiuQs
	xRkvON2z4Pw2+6cCD792jizd5yxZogzhkaWzs7YOty21c+ae9/hOWrnGDElasq8/iVMuqyaHu322g
	cSyBe4/icVQUY0vnLfL9qt22fErzo1+afhY7QsTKXYxv3GwC0SkD1aR8ElSXzlsMvQJTNFVlC3z0c
	YjJWvNPM4N5k19GRnwwzp1ezJS7NLls3DsNAinZZpTQ4g96dU/xx+gtSZpTaU6ewCdBDW8W0+sVoF
	uRsycD1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4o1p-0000000FWOo-0F0G;
	Thu, 10 Sep 2026 23:18:01 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4o1k-0000000FWLZ-2TPO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 23:17:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rj7VM94TkjORpu2nHDfJP/AVG49T3EL3xIq8VdecrvUCx2RfNVh0IKe3Y0OPpCIVzsce7L50nvUl2UNGIJJNWgFoDdkZi0aWqK1rINz50TZ+4+r551RASl1PCJrjNftKpR8/LXVLZ+TNTm3HKZfYBrpjz7iSneeTPTqRCSEVIrOerm93JtmfgM4RU8aDnavltkfZ3cW1K18vP/hK4xGAkz7KmFjSDmSold9ZMSA6YKy9rlC0517/jIIGNw1+X4t4A3an8wzE2Tz1h0pl2ffWE/TVIpkB/2hA14q3mTv3z3UEybob/qw1c6r0/Qdq+IoTCMOC3o45+Vh9PCBD2BdZog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kKLSfupZoSgA5cwU7ZcqM3ylvCoHJATUagBvxSIuQ/w=;
 b=SgxHxct7Vsay9SbuvMn0aMZRDmraFcEeR5JDZdQbBI35qoxvmxLqTO8w6kPvzfaHE5ckw2fTXehKeubDrFw3eHtu4RjER568wgYzOVPzOrKnV7Bboqoa/30ehv8eVi0N+IK5HUw0JdxMvblsZfw0pMkxyW3vYS41+kp7SXIwqP99kJLEuk/DdCHnKDHn9KIeWlhluL0zUuovebI9NRodPvDJeTq70k7ZHShA9LMvxL5sTlEStv9SHHCJ0PqFMdDNdEYoBWzwfa4MJTH7tiGNbGIwO6movtmE+22qIiPq6iO8A6G2Vl/0klgi4oxf5H39v6nf4/Oj8ZTwFY17qr4v/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kKLSfupZoSgA5cwU7ZcqM3ylvCoHJATUagBvxSIuQ/w=;
 b=nw78kK+NWaNOz4oHP5618lgQdzix8mG+OOkHIipAO3IZJkHrQ26d+l6fELgoO2ae3kT08Th8YvkGE4e6OWQ9rn/gBwOmyiR1ahCOC15tGs1/F2G/HF43oSN9HCVvfxyZCT0lIfXMpQkYpdIbxK78M+YOhPXKs5Q31aYN/etJQrk0jEpWWWXqq8UtQVktoQpoMmKJDGKDIyIaqYPd3JKKAhNBzPqbPQN/xn7MTBmqvSjZ7pDLHFx/5RIkY4wSeTqa5WuhUCpMc5Gicrz8yHJi7QOurzb/s5vrEh80j7DWRlSHU492vL7K6a0iYT6obsuUNr3jA76FoBgDXQqk8zeuYg==
Received: from IA1P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:461::6)
 by CYYPR12MB8923.namprd12.prod.outlook.com (2603:10b6:930:bc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 23:17:46 +0000
Received: from BN2PEPF0000A891.namprd04.prod.outlook.com
 (2603:10b6:208:461:cafe::8b) by IA1P220CA0009.outlook.office365.com
 (2603:10b6:208:461::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 23:17:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF0000A891.mail.protection.outlook.com (10.167.248.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 23:17:46 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 16:17:28 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 16:17:28 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Thu, 10 Sep 2026 16:17:27 -0700
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
Subject: [PATCH v4 05/15] iommu/arm-smmu-v3: Flush in-flight fault work on domain detach
Date: Thu, 10 Sep 2026 16:16:57 -0700
Message-ID: <848cb4c8a79da1f434966d998be0f4ebddf80fb7.1789081084.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1789081084.git.nicolinc@nvidia.com>
References: <cover.1789081084.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A891:EE_|CYYPR12MB8923:EE_
X-MS-Office365-Filtering-Correlation-Id: ce48bfe0-50e8-40be-6359-08df0f91b96b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|82310400026|23010399003|36860700016|1800799024|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: JvadtxiyYoD9bDkD+FbGrT4xdNzi4sFIfmrc8NENfLi6pemU5Djbr2hOvIaMpuO3suA3pfc5j0z394UxymmIJH37GZBGDydALxroSOsYCEoYuiDc7tW2MgIoBhiF3XXzTD78mCryABzPF3CMjBpyBoVvnUdz+o8zbNqG9f9U1GIyl5+D84yg29iyE91HNf04MHb2dDzAIN2qNJ6Z1iLV7+5QdwtuTKh2PG8TGEMh4g8MzxKQ7xsku7m8YERK1d5in8ceNQkcRnAuXmHdheHnP5GvUTLABBie4MulkfSZDARBpiTm3syaml1yWfL4CWBSxw1GcZAghK6IRXV7iyVj4df4plO7Dv5Ru5L/dfrg2h7zryXuoCOZgYwF1+sllV3GW8J/H4CnM8cLb2e4CjSeNoTt2m0s+6Au0lg4CZQD/kHByQWgiZkHiXUNpugT+TEarufTh/+rZcBfh3r/ua69e88ct7pzl2crNLOZwZg+PwF1gOHtjncyh+eM93XEYyAfpc/Lkz66/nEsH3J8FII7uUmh0sUlcePtUofCgwzBENGoWEicCMTTTu2PSJy/WhBA7CPxo+l1bdjKNqb9308MHwSjDBbZRpZa7f8NlS/oVkhIIbwaOzCDlerINZ3OavvwQZ5Obs9BkUH3ZVOb6ZO72xY/fuAW6OOjhOHqPoMWz2jwPknocB2E8ir9DkpVNcHElVlxsTdPmjII+il+N3hsDg==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(23010399003)(36860700016)(1800799024)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +abFohO2hPagCateLfU7QJ6rtZm0h8Q4t9krS8GAU2U2taEoUn08fSTAIDcniXGBMCgkf+WRJt7lkZc8zNYUCSnNtkFiJnEzd12uEUux0IKHScrgTK8I6OwWAfoefu8f7cwKo4eLaZtw+mU61EG7V9OvLxzyQ0WmXxJU3RZSjd2rf3c20+PvLLHKASB0rx4ssM6jtd3/Ckre6YqrkPlnRRITNnkgdomJxnyc9lKbTZ/BVv/4Nnwbx5KKQIO9sidLUEs7yTIEhgcmW80nm5NBQzQOgrDf57iCmjsyGZaNUagcPNYADQos/cpHfE2nJTMEYLrmFIUuoAvjp7Qv3ZpoolTVtexqmMl9b9NhPSZfyOorGsAMvw6eaQiTVkubOu7JvrESQWiTb9clWIHnyg1cmRZfMkv/L2MxWmSGK/7gKW9xjLdXpumj7IwxZEhBi3me
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 23:17:46.3595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce48bfe0-50e8-40be-6359-08df0f91b96b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000A891.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8923
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_161756_670875_63E210AA 
X-CRM114-Status: GOOD (  19.11  )
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

After the hardware queue is drained, an event may still be moving from the
IRQ thread to the IOPF workqueue, while earlier IOPF work is still running.

Synchronize the EVTQ and combined IRQs, then call iopf_queue_flush_dev().
This finishes all old-domain work before the IOMMU core frees the domain.
Skip synchronize_irq() after a drain timeout because a stuck consumer can
otherwise leave it waiting forever.

If arm_smmu_wait_for_queue_drained() times out, fault work may still be in
flight, and iopf_queue_remove_device() would free iopf groups that the work
also references. Skip the iopf teardown and leak the master_domain, rather
than risk a use-after-free.

The skip also leaks the iopf refcount, keeping the device enrolled on the
IOPF queue, which would strand its fault parameter on the queue list once
the device teardown frees dev->iommu, crashing a later iopf_queue_free().
Reclaim the enrollment in arm_smmu_release_device(), where all the attach
handles are gone so a straggler report cannot queue a new fault group.

Note that a residual race window remains between an iopf_queue_flush_dev()
and iopf_queue_remove_device(): a fault arriving in between still resolves
to the old attach handle, as the IOMMU core publishes a handle change only
after the driver ops return. This window predates the drain narrowing it,
and is only closable by an ordering fix in the IOMMU core. Furthermore, a
timed-out drain shares exactly the same window, given that it must keep the
device enrolled on the IOPF queue, where iopf_queue_remove_device() would
free the iopf groups that any in-flight fault work still references.

Fixes: cfea71aea921 ("iommu/arm-smmu-v3: Put iopf enablement in the domain attach path")
Cc: stable@vger.kernel.org # v6.16
Co-developed-by: Barak Biber <bbiber@nvidia.com>
Signed-off-by: Barak Biber <bbiber@nvidia.com>
Co-developed-by: Stefan Kaestle <skaestle@nvidia.com>
Signed-off-by: Stefan Kaestle <skaestle@nvidia.com>
Signed-off-by: Malak Marrid <mmarrid@nvidia.com>
Assisted-by: Claude:claude-fable-5
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 46 +++++++++++++++++++--
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index ef1fddad7868e..a915d8b0baf69 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3402,6 +3402,7 @@ void arm_smmu_attach_release(struct arm_smmu_attach_state *state)
 	struct arm_smmu_master_domain *master_domain = state->old_master_domain;
 	struct arm_smmu_master *master = state->master;
 	struct arm_smmu_device *smmu = master->smmu;
+	bool timed_out = false;
 
 	lockdep_assert_not_held(&arm_smmu_asid_lock);
 	iommu_group_mutex_assert(master->dev);
@@ -3414,8 +3415,38 @@ void arm_smmu_attach_release(struct arm_smmu_attach_state *state)
 	 * which the IOMMU core might free once this returns. Drain the hardware
 	 * eventq, so that a pending event cannot turn into new fault work.
 	 */
-	if (master_domain->using_iopf && master->stall_enabled)
-		arm_smmu_wait_for_queue_drained(smmu, &smmu->evtq.q, false);
+	if (master_domain->using_iopf && master->stall_enabled) {
+		timed_out = arm_smmu_wait_for_queue_drained(smmu, &smmu->evtq.q,
+							    false);
+		/*
+		 * Ensure pending events have reached the IOPF queue, unless
+		 * the drain timed out: a stuck consumer would also block an
+		 * unbounded wait_event() inside the synchronize_irq().
+		 */
+		if (!timed_out) {
+			if (smmu->evtq.q.irq)
+				synchronize_irq(smmu->evtq.q.irq);
+			/* Pending events might be in the combined_irq handler */
+			if (smmu->combined_irq)
+				synchronize_irq(smmu->combined_irq);
+		}
+	}
+
+	/* Lastly, flush the fault work that the drained events queued */
+	if (master_domain->using_iopf) {
+		iopf_queue_flush_dev(master->dev);
+
+		/*
+		 * A timed-out drain may leave fault work in flight, and
+		 * iopf_queue_remove_device() would free iopf groups that
+		 * such work still references. Skip the iopf teardown and
+		 * leak master_domain, rather than risk a UAF.
+		 */
+		if (WARN_ON(timed_out)) {
+			state->old_master_domain = NULL;
+			return;
+		}
+	}
 
 	arm_smmu_disable_iopf(master, master_domain);
 	kfree(master_domain);
@@ -4399,7 +4430,16 @@ static void arm_smmu_release_device(struct device *dev)
 {
 	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
 
-	WARN_ON(master->iopf_refcount);
+	/*
+	 * A timed-out drain in arm_smmu_attach_release() leaks the refcount,
+	 * keeping the device on the IOPF queue. Reclaim it here, since every
+	 * attach handle is gone: a straggler fault can no longer queue a new
+	 * fault group, so the queue turns stable once flushed.
+	 */
+	if (WARN_ON(master->iopf_refcount)) {
+		iopf_queue_flush_dev(dev);
+		iopf_queue_remove_device(master->smmu->evtq.iopf, dev);
+	}
 
 	arm_smmu_disable_pasid(master);
 	arm_smmu_remove_master(master);
-- 
2.43.0


