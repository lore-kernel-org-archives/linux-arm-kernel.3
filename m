Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B257C98313
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 20:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uw5y6QSLpJ3OAucUpF1Oy8LdUdv5TzJMJ6nIpXoAbqc=; b=va51A2sqBp9t92rpj6Bpt0IBvK
	jmPo3qt+fpNeF31BZ51MucM9YKV5j1PYpF8tDEq70uzrGS6Y4vEBel5/cZpPTG0ymC3K0aFeW6USt
	ikJtu3T2A8FNLlS6yE/UPXY5syw7IKgOMEK/zMPXWQ30thz9bDb5DLy1WKrsHgRrIBu13ANUyV0wL
	aM3QuQJ6TsHc3ePETEC+y6pprtiRPemX805Tvu9Pv/xtQtvcL9P4sd0n43bmYEJ1un3hHdpI6o6I4
	IKCn1WWg6W0akwtKF0MDa0TOgbqpOYS8DqqquLEZPS1XdiUQdU2xJ4Qqnx32bAlOJVp4oElV+LGeO
	56XeX+EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9TLH-00000009Q1J-1NjP;
	Wed, 23 Sep 2026 20:13:23 +0000
Received: from mail-northcentralusazon11010046.outbound.protection.outlook.com ([52.101.193.46] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9TKh-00000009Pcq-0A7N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 20:12:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VEafNyIYFR1Y1a+zffggn5olA8DDx5iejZaMvQeD+qGAaMXlvUEtk48XnahVZmEC7M7m29bxIQ7SaJTRRoA1g74n4dqRDhN2KvImRsnDitYg98x+0Dd+8DoBiGjUYTv2USPsIXsIKNmz3GIKMDwq7LZmcBuRjqp3FqO63MkqE3XqkTpCfnXRoB1j1GP8uM2DCt2INunc7pR0JAyopwKv0xqdkmaLCLL67ybPWVLHzTJv/aYZUVkck1/uyiDhuPWfYuZ4aCHFaD5vKRSAOiajjmrEDQNN2KvAhIxCrbR6uBsJxrlATfA6dIZu0mAppilzEDBzMT2B5tSW3Zu2FxLSJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uw5y6QSLpJ3OAucUpF1Oy8LdUdv5TzJMJ6nIpXoAbqc=;
 b=B9bVDPDpk9tuQ9fv1GDZypfYvZ8RJipl0dqdzbqxsTeL75wiUKhvAlVGSc+DlIbNy9ZmXpZcgfZlyZGG1e4rPvQHZWTkXk9/8ltbqpiXkIGmEO6mUHt+9Mc3jSfjCkhAKj7BgE3wJV6N7NmNB90Lutr9KfqcoiehGsDMzII9RA6sw2D67f2jmuyMnMOmH/63CC705CQy1LY201m1v6/pdxzUF0chrGt+B1fCiCk6cPd9USSUQ9Ag5hLB7Kk6SXXzXFNW2dAZc3Sdgo6AqTcUckok/e2jFWta2hKFcTJFyf/VpDinFduyjC0h8m5EfzW4WFcQNaEjckT3VDc/AkVwEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uw5y6QSLpJ3OAucUpF1Oy8LdUdv5TzJMJ6nIpXoAbqc=;
 b=X0n3OUQDNVtF7Yecx1qyAfpDNqSaOJffZysA+xfXMYLr4PUUASmJx8dNXklnc4JwImU7cpmKxEnjjhUMkNfThx8KscVf6HrbhBNAgKr6i6dLNO7oHv9SGqvYzOroQMmui6/ah3OAIig3DZMyKOH3iUFyoh8mGpoLF5nYVjqnd23cunxCUkDjRqx/8c20T2VgRb/ztpb7K0mDE2N2Xti/d5Nxh588D/ItBe239QuwVhXsDsS5LRGi9hK2kPThqL866wPvo+IoS6KcK7fk8EVM7rFqy0Rest1haTl1XZjhrq2RN1AvOzKK2wYEfyO0t1VYG4QKOR1zRj5oy8t/kwGCUw==
Received: from LV3P220CA0030.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::10)
 by IA1PR12MB8495.namprd12.prod.outlook.com (2603:10b6:208:44d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Wed, 23 Sep
 2026 20:12:36 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:408:234:cafe::3c) by LV3P220CA0030.outlook.office365.com
 (2603:10b6:408:234::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 20:12:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 20:12:34 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 23 Sep
 2026 13:12:13 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 23 Sep
 2026 13:12:12 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Wed, 23 Sep 2026 13:12:11 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Joerg
 Roedel" <joro@8bytes.org>, Bjorn Helgaas <bhelgaas@google.com>, "Jason
 Gunthorpe" <jgg@nvidia.com>
CC: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Pranjal Shrivastava <praan@google.com>, Mostafa Saleh <smostafa@google.com>,
	Lu Baolu <baolu.lu@linux.intel.com>, Kevin Tian <kevin.tian@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <linux-cxl@vger.kernel.org>,
	<vsethi@nvidia.com>, Shuai Xue <xueshuai@linux.alibaba.com>
Subject: [PATCH v6 16/17] iommu/arm-smmu-v3: Thread arm_smmu_master_domain on a per-master list
Date: Wed, 23 Sep 2026 13:11:35 -0700
Message-ID: <c8b198a773d7de1bfd6202a9fa724e4786b5bf1b.1790188511.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1790188510.git.nicolinc@nvidia.com>
References: <cover.1790188510.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|IA1PR12MB8495:EE_
X-MS-Office365-Filtering-Correlation-Id: 58163b5f-d705-4042-3a56-08df19af018c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|36860700016|82310400026|3023799007|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 7yMzhhZPmYpIqvKUUSPFWKwU+Zg7FTNiwgdGp+pzVS/PSVFRvoTS6vglHsT6MERK2DBVNrFGYn2AeFWiydhAtEdp5nXFXy17OWlBfOi0vcwLHihzR/74ICuyUYWt5IArLuJ7hiradrCnXEsPTMAMzj/XsvxlplFWcDZZtHfXbGIulHsYNhblufxhpCOMNauOW8vbezcE901UnY49QG1uRKHYOyxng4QSkgmlZsOkyMtnZUb2sGlPuavDjV+j3+fdrfRDsCKyRyz++5/iv5DwJ6HJtQSy5B6s5LXhFlXW9I670caad7hhbPURlpGOl76P7TVrfe6BzIc5jroWE18L5Nqc/7Ux2VgTBnXOQw4AovZgroJrJ+1FuuUunNjGzLn6nzXK3M7BPtNmp01D4Jmgqr7T5VarQqYJCjKoAx9PSHyj7KlDgPxhawT+6mQ/SqjIUzbMzdvw84iubYIPIgoXjtmharnwKB/L4KqT2AyUuYuaJC5meGNcg83GqRy2ueuNLdvldt1iA/C4KIneqKaOrEWqHkGX7Yxy7WmgRKnaYYlK2gYZTBKTSLm9Q/NmOHGQsN4Qa+m5ZMIRnNX8fAckTwL+qzh/n8pGz3r4p35lD4ORowAG2L2Lka2iHX4qgVeoDzxETYRaDk87CmKUzas8JpQ5cdKIUiuMzB8LMD/nmp2/XpXSlAceosNkfNwHIaXYlcPYXIG49nr8pEB+Rm6/Og==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(36860700016)(82310400026)(3023799007)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TGemA9OG7TzGsVJXp5c/+P7jmBk8VQZLImWY4MBp4P+A2CVoUgFETKlmKft3xXGuyC6HfWVLsyPBPFN9B6t1/Eb10J8FLmBp+CeZ+ktgch9PwDOLeZygm81LLsvdkqj7f6XhrPcZWRQbjNjMS/dMjN1eoceJBDjMvBL890EGZ/rOyWykAs6jo5XbUEhOINHZmcJwo2qLpiPJLkeYPEVuXIni7QC5h6QD77mi5OBhqVu8F2ZXPehBgVKj465JMTTGtBhmq6v4he8k0Cv9Hu79eembRWj66CjiWHiIFHTA4Z8BVgzXfqsHUrDKB0pfpaYFmU0p3/ahY8WBFnsN+lGxSieGUQoIWkvWsQy5kNA2iGgG2+3Gm2+oLBliBI7lLVypfTUUZHlTBMD1lZCPhhgtUpbfHlC+t03v8AP16rWZJeCIYlHLm9Wmhgk/p3HIu5vO
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 20:12:34.3975
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58163b5f-d705-4042-3a56-08df19af018c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8495
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_131247_198979_53F8C6F7 
X-CRM114-Status: GOOD (  14.95  )
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

A subsequent change needs to enumerate, from the CMDQ error path in atomic
context, every domain a master is attached to so it can mark this master's
ATS entries broken in each domain's invs after an ATC invalidation timeout.
The existing per-domain smmu_domain->devices list tracks the inverse
direction (masters in a given domain), so introduce a per-master list.

Add a second list_head master_elm to arm_smmu_master_domain, threaded onto
a new master->master_domains list under master_domains_lock. The CMDQ error
path walks the list while holding smmu->streams_lock; that path runs under
the invs->rwlock read side, which is itself sleepable on PREEMPT_RT, so a
plain spinlock_t suffices for both. The attach and detach sites now take it
with spin_lock(), nested inside the existing devices_lock critical section
that already disables IRQs; it is a leaf in the lock order, so no inversion
is introduced.

No functional change.

Assisted-by: LLM
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 4 ++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 1394a14241fd3..1fa207c44763e 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1035,6 +1035,9 @@ struct arm_smmu_master {
 	struct arm_smmu_vmaster		*vmaster; /* use smmu->streams_mutex */
 	/* Locked by the iommu core using the group mutex */
 	struct arm_smmu_ctx_desc_cfg	cd_table;
+	struct list_head		master_domains;
+	/* Protects master_domains */
+	spinlock_t			master_domains_lock;
 	unsigned int			num_streams;
 	bool				ats_enabled : 1;
 	bool				ste_ats_enabled : 1;
@@ -1129,6 +1132,7 @@ struct arm_smmu_invs *arm_smmu_invs_purge(struct arm_smmu_invs *invs);
 
 struct arm_smmu_master_domain {
 	struct list_head devices_elm;
+	struct list_head master_elm;
 	struct arm_smmu_master *master;
 	/*
 	 * For nested domains the master_domain is threaded onto the S2 parent,
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 359cbee20ce5a..c56fd5c6b6242 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3431,6 +3431,9 @@ static void arm_smmu_remove_master_domain(struct arm_smmu_master *master,
 						    ssid, nested_ats_flush);
 	if (master_domain) {
 		list_del(&master_domain->devices_elm);
+		spin_lock(&master->master_domains_lock);
+		list_del(&master_domain->master_elm);
+		spin_unlock(&master->master_domains_lock);
 		if (master->ats_enabled)
 			atomic_dec(&smmu_domain->nr_ats_masters);
 	}
@@ -3681,6 +3684,9 @@ int arm_smmu_attach_prepare(struct arm_smmu_attach_state *state,
 		if (state->ats_enabled)
 			atomic_inc(&smmu_domain->nr_ats_masters);
 		list_add(&master_domain->devices_elm, &smmu_domain->devices);
+		spin_lock(&master->master_domains_lock);
+		list_add(&master_domain->master_elm, &master->master_domains);
+		spin_unlock(&master->master_domains_lock);
 		spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
 
 		arm_smmu_install_new_domain_invs(state);
@@ -4405,6 +4411,8 @@ static struct iommu_device *arm_smmu_probe_device(struct device *dev)
 	master->dev = dev;
 	master->smmu = smmu;
 	dev_iommu_priv_set(dev, master);
+	INIT_LIST_HEAD(&master->master_domains);
+	spin_lock_init(&master->master_domains_lock);
 
 	ret = arm_smmu_insert_master(smmu, master);
 	if (ret)
-- 
2.43.0


