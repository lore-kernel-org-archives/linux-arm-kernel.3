Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10111EC1130
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 20:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4TGg+WU9yTkclOjTusP8IoukudeC+F9/YaPQGE+6RBc=; b=wmsgHemvZkMmIm8juLmk1CSwxL
	oMLEEF3RXKQ7PnoVUAiIx9iIybuN0cv2B1Jjpn0NeulzZtV94844MYyItOT1DGzyVMRfnF7zSq5Vf
	QAoY6ppZCG68iHrijjQ/p6Gk6KznD+fTwBpXKKWLzdCmZet2D2F/E16C5lTA+tja5e5xiRcnU+aNH
	gLsQE96ON68/LHnlc33iFQ9F+R/eD52hBIVndwIa6xIXfeyAhJ3SvAqNxKHxagEqcI60Qcu5i5AQa
	8tphu6QZWEhq3Dxf76ZS9H0uTxpoFw7MQj3cVOoiakYKdXk3MSZi31UqH2+kj7zmjdyMKpJ9v2xsL
	ohwU1qqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vucXy-000000010Ej-0TMZ;
	Mon, 23 Feb 2026 20:28:50 +0000
Received: from mail-centralusazon11011046.outbound.protection.outlook.com ([52.101.62.46] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vucXw-000000010EG-12jr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 20:28:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tvub5a8VfQxqtq41tJ2Cz2zMdp3/URsokADlZSaOnSdP6yPoqv6flDogaW5xDGBiiSA8o+Z40GW53/rXoeau1hn6aNprm21F1rHTS6vawdsNGh3vMRhaynsTFbA7rwU3Lvh9bHOhWHxfC8GNPYZQnscLuCoCIVvkrCCp2EI6SZurp2RNCDjt1LIG2be9AS+Wfhfn9KRAyTbM/eGDJS3ePJksiat+TXNwa/Pj0Ipy94zu6b0jf3imZu8itZV4Fp/eh01Wr0C3DJ9s15rKrmPlbA/GCWU2eOWg/qrAwt3h+RSJe0fYUjCR6Yqn2SPpCBIswYLwlSdPptgn6z7y3XjfiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4TGg+WU9yTkclOjTusP8IoukudeC+F9/YaPQGE+6RBc=;
 b=PS2E4W8ISn+EAbywl12wpD2xzXtan9cYnhDttFwnw1Py7lbYfjNjk/nSb0+Y5JznuSGlHv/BE7TPrf2gWmpYO4T28af2BsSf/tuQCWofFHcHQ0c9QF/zOyKQWQ0m0VUc+Ppg04JecIcLXf5y2DRtCkdvUMqJXysHq/beCGt5uvdKBSE/3p2qIC533oHpD+5Nz10VC03czlcdi/Zn282FK4HVLlZHYnGa7DVRrlwjPAwrbtY5tVRPoJ3Ebh4m5rYiAK7Ju5M0L+cbDiHH2wTqn4aqSB4gj+KOc/Sg6JjwlMVvIbafMJTU+0A7CiO1IiARxyfJRHticBcY3hk0krArTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4TGg+WU9yTkclOjTusP8IoukudeC+F9/YaPQGE+6RBc=;
 b=kwddvz2dbqIw9zcu1ktytfxEp7doMXOXO2gPobzbREUtySA//Mgno7znpfq2/UVQ9iZPT4t12z0QhrfrTFWRJ9E3GkhrUkpQ3wqkw/vyAYQ9Es4Vi3nRRlOc1Q0UpxZT3edjhiPILeU0jnaUuYK+bJVT4ZyQNQLbPuJMMbWMKkJB7c3AWQUw/OPIuPP/vSFfKthyRyfNB8YljlASa0XZbi+PykS5wUZIto29t29dfHR6lDGdz8+7p9kzK4j7I0y9Yn3+6hdwM9lXii1369Rdk/Uo1WfXIWSkT1KQB0Js4Ufh4ZtmIC8I8strXa/9CbC1Ewdp+hxhEwl6fbHrVeteYg==
Received: from BYAPR05CA0024.namprd05.prod.outlook.com (2603:10b6:a03:c0::37)
 by DS2PR12MB9688.namprd12.prod.outlook.com (2603:10b6:8:27d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 20:28:39 +0000
Received: from CO1PEPF00012E60.namprd05.prod.outlook.com
 (2603:10b6:a03:c0:cafe::8) by BYAPR05CA0024.outlook.office365.com
 (2603:10b6:a03:c0::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 20:28:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF00012E60.mail.protection.outlook.com (10.167.249.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 20:28:38 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 12:28:20 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 12:28:19 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 12:28:19 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>
CC: <joro@8bytes.org>, <jpb@kernel.org>, <praan@google.com>,
	<miko.lenczewski@arm.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <patches@lists.linux.dev>
Subject: [PATCH v3 01/10] iommu/arm-smmu-v3: Add a wrapper for arm_smmu_make_sva_cd()
Date: Mon, 23 Feb 2026 12:27:37 -0800
Message-ID: <10bb2ceeea66c6e82f553e9427e779b71d860a72.1771877893.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771877893.git.nicolinc@nvidia.com>
References: <cover.1771877893.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E60:EE_|DS2PR12MB9688:EE_
X-MS-Office365-Filtering-Correlation-Id: 45213fd7-390f-4dae-4c97-08de731a20d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KukUg6y8DczhPx7QYyrH6NHZ1nCbN8/waj+QE89JVVG3EbJNRy+xLhVHoY40?=
 =?us-ascii?Q?8mSdCNTW1VPZApU14fy9+jQ3lyOue+ka2brN+N3P1hgd/HwWMxzH+nf5zN58?=
 =?us-ascii?Q?u4pnBt67atZdgFbKAxoOcrTrrSLzmawFVIe6Kn3wz3BGKasr/R+ulb+cWsyo?=
 =?us-ascii?Q?ivBjhkWeVH/GMZUVGVmhbQdQ9d8m/a9nXPFgfDwInDKEAzf+WNOdfkfuhJy0?=
 =?us-ascii?Q?KvUMMzbnFFfLF7XVnRGBaDXpS1V0HLoSIDaCrQhhBLwiNPkSW7EM8/E3fSNJ?=
 =?us-ascii?Q?YSBv6dlYuM9otEUwkFqIbF6F//ZhiCeruILqCTT3PEePYUj2Q5rhM2c0gzRz?=
 =?us-ascii?Q?qFjNAfsRfS7UxNDg05Hmb9qneIhbmtqEvg9Y4lvlMOX+/Gquhqfgy87F+QHE?=
 =?us-ascii?Q?Oqj+6ZJ06H+eyKdZq7L7yZHfFGuXBjRReao7KZ0sYAhZEXe9O8yuElS7PrC/?=
 =?us-ascii?Q?G0dmd84ZAslSW9sJzKpYf3sCgmS+vUfOBwwH97+Ny96zrV7MGF1wA2XI4htP?=
 =?us-ascii?Q?368PkLyC0sHVB/QqWW3CSj2ReBhXqhYnM6m3DG7v/EHUSYR0vnWxVg53uINy?=
 =?us-ascii?Q?9rbeB9Cjje2MWxG5UXlw9Js6UU0Fw8J9h6BrFm0JGExYpmGQOWFBQ4S5m6tl?=
 =?us-ascii?Q?HOnMVdEDk2ktQ794WyL6NmpnVCyEk2ezlnAFCMiQn907Tz+2NLHYNrQ8g7c2?=
 =?us-ascii?Q?Fdk5Y85XunVEg4/+g7OB6GRpoe3yffg4jUx2hUO8gaIWmjcCCzBoxoxazRJz?=
 =?us-ascii?Q?ZyQmgt1aAXA6GHOX0WNIfrYwjtR6HQ0RgCtLPnzFwXC+vkjs4cjNt+SScULF?=
 =?us-ascii?Q?Ni4a/buk/Q+DXLz8hmZkdkTwcP6n9k9jfBmZcjMAHoc29UcAjrWPN6s3F8d2?=
 =?us-ascii?Q?L9C2SZpVRufPRs2fD/ddnOA4ac4BTA10rL8NYdRSHL4h4b5zrpqgnjbQ+TUD?=
 =?us-ascii?Q?5S5DcL1gNxXgalWcp4dVgXInEYd22JotocJ9AAQapYTveYnhsntg5fD5qfS+?=
 =?us-ascii?Q?MhDCvwnp4xh2ObYhrdFmNgoCGrsQRz0j+IWfGBHWGxi8yZ0MNcagaBGhS5+D?=
 =?us-ascii?Q?1b2RoiB+RjpcOutMzmkovMr4Z54G6OcK3YxpqH2CaMWqBJGp8cwjR1s9EJkM?=
 =?us-ascii?Q?OcXipmh1lYFngxiTPoUmeKKVi+XoDBLuS/M4af3nGv8ODu4limuCauSWIrlG?=
 =?us-ascii?Q?rT0647JUGhAWDB9lh5ufhONqHjWAfJlMwwMeePpLRFNsIJ9ozW7FkRvEIrss?=
 =?us-ascii?Q?7O23z84O8uW2lhX99saB62C6ypEx+/L+1/nrKwV6M5cyswK4jriz0aiIHzZE?=
 =?us-ascii?Q?B7HMbmPsLiwX2k/VxWUPAjFpOgM/sjSJhlVUljnK3LkQFIZt/KpIBq/GLXdk?=
 =?us-ascii?Q?4+bJ8mO4COBvLlkLRxEYYHc4zzNXdMFRhwRW/44HTnPdbMZ0APPQVDL6z25x?=
 =?us-ascii?Q?x/J9Uek8u+rN7uIBblB/5VvJUnHq5KQ6sxPnUhNa7VA7AO1JZYCXvWFUXtKH?=
 =?us-ascii?Q?RvVVdcVuq5jMcjI9tZ+OJL1StOSN2gxo1OIuc8kAOI1Q+d1g1PftLqRPqARY?=
 =?us-ascii?Q?C/K7p7m/gU3q3QixkhgzQEUeOXBd4dEsAsVRZo9D6UAvVyfJUd4pz22HEW4l?=
 =?us-ascii?Q?h+AY9jpFzePFrNKORiSI4WdJhWWmOratyYiJAZFJp8HE0upPHuPTdj83tS/1?=
 =?us-ascii?Q?Hw9Nrg=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Qz2xTBqhiT3DIrYZRjwoCEAVnrUzf2OJ6mTL0ydZK3glFmXccc5YkRdfHCvjh//peUX1CUiFjSQCWGEP5zH6+QIfyeVefucPqG9FNNkhecaZibo1j7eQ4PqUmRz79U5gjIkIoTwsjCcNVUVuXXKPfyxmCNS0DXd+nQzEDVi3eXtPaSP+8hMWgqEE18HKDPYZZIK6e2FU/ciK8o33M6g5svGwpEqjXL21hHiH03xY6Ugkhp7eKTiBNVsSjDnWBg+XEx55TKxXWdAdCn2sHVUCmIMuGT3UrLlvt2ZSm9AkmPCXwF2BveELiRyloxfKM5MVAgHEcI8CFwP29QdB+qIW25eB2+xYQDqEpArvT57w57gwHfdHYDjMy+yYPFxTtTDL2LTeiCguXEHd+ILKSgtb8rjd4bZzp18hIHps63iafhFGE/oDcp2KKbnF66WS5kXv
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 20:28:38.9332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45213fd7-390f-4dae-4c97-08de731a20d5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E60.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9688
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_122848_300592_D0C07C76 
X-CRM114-Status: GOOD (  10.13  )
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

Rename the existing arm_smmu_make_sva_cd() to __arm_smmu_make_sva_cd().

Add a higher-level wrapper arm_smmu_make_s1_cd() receiving smmu_domain
and master pointers, aligning with arm_smmu_make_s1_cd(). Then, the two
function can share a common typedef function pointer.

No functional changes.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  6 ++---
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c   | 22 +++++++++++++------
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  |  4 ++--
 3 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 36de2b0b2ebe6..dd5d2b5acf664 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1019,9 +1019,9 @@ void arm_smmu_make_bypass_ste(struct arm_smmu_device *smmu,
 void arm_smmu_make_cdtable_ste(struct arm_smmu_ste *target,
 			       struct arm_smmu_master *master, bool ats_enabled,
 			       unsigned int s1dss);
-void arm_smmu_make_sva_cd(struct arm_smmu_cd *target,
-			  struct arm_smmu_master *master, struct mm_struct *mm,
-			  u16 asid);
+void __arm_smmu_make_sva_cd(struct arm_smmu_cd *target,
+			    struct arm_smmu_master *master,
+			    struct mm_struct *mm, u16 asid);
 
 struct arm_smmu_invs *arm_smmu_invs_merge(struct arm_smmu_invs *invs,
 					  struct arm_smmu_invs *to_merge);
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
index f1f8e01a7e914..414fc899140f7 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
@@ -48,9 +48,9 @@ static u64 page_size_to_cd(void)
 }
 
 VISIBLE_IF_KUNIT
-void arm_smmu_make_sva_cd(struct arm_smmu_cd *target,
-			  struct arm_smmu_master *master, struct mm_struct *mm,
-			  u16 asid)
+void __arm_smmu_make_sva_cd(struct arm_smmu_cd *target,
+			    struct arm_smmu_master *master,
+			    struct mm_struct *mm, u16 asid)
 {
 	u64 par;
 
@@ -120,7 +120,15 @@ void arm_smmu_make_sva_cd(struct arm_smmu_cd *target,
 	if (system_supports_poe() || system_supports_gcs())
 		dev_warn_once(master->smmu->dev, "SVA devices ignore permission overlays and GCS\n");
 }
-EXPORT_SYMBOL_IF_KUNIT(arm_smmu_make_sva_cd);
+EXPORT_SYMBOL_IF_KUNIT(__arm_smmu_make_sva_cd);
+
+static void arm_smmu_make_sva_cd(struct arm_smmu_cd *target,
+				 struct arm_smmu_master *master,
+				 struct arm_smmu_domain *smmu_domain)
+{
+	__arm_smmu_make_sva_cd(target, master, smmu_domain->domain.mm,
+			       smmu_domain->cd.asid);
+}
 
 static void arm_smmu_mm_arch_invalidate_secondary_tlbs(struct mmu_notifier *mn,
 						struct mm_struct *mm,
@@ -162,8 +170,8 @@ static void arm_smmu_mm_release(struct mmu_notifier *mn, struct mm_struct *mm)
 		cdptr = arm_smmu_get_cd_ptr(master, master_domain->ssid);
 		if (WARN_ON(!cdptr))
 			continue;
-		arm_smmu_make_sva_cd(&target, master, NULL,
-				     smmu_domain->cd.asid);
+		__arm_smmu_make_sva_cd(&target, master, NULL,
+				       smmu_domain->cd.asid);
 		arm_smmu_write_cd_entry(master, master_domain->ssid, cdptr,
 					&target);
 	}
@@ -265,7 +273,7 @@ static int arm_smmu_sva_set_dev_pasid(struct iommu_domain *domain,
 	 * This does not need the arm_smmu_asid_lock because SVA domains never
 	 * get reassigned
 	 */
-	arm_smmu_make_sva_cd(&target, master, domain->mm, smmu_domain->cd.asid);
+	arm_smmu_make_sva_cd(&target, master, smmu_domain);
 	ret = arm_smmu_set_pasid(master, smmu_domain, id, &target, old);
 
 	mmput(domain->mm);
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
index 7b8035b1db24d..bf4412e904b01 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
@@ -546,7 +546,7 @@ static void arm_smmu_test_make_sva_cd(struct arm_smmu_cd *cd, unsigned int asid)
 		.smmu = &smmu,
 	};
 
-	arm_smmu_make_sva_cd(cd, &master, &sva_mm, asid);
+	__arm_smmu_make_sva_cd(cd, &master, &sva_mm, asid);
 }
 
 static void arm_smmu_test_make_sva_release_cd(struct arm_smmu_cd *cd,
@@ -556,7 +556,7 @@ static void arm_smmu_test_make_sva_release_cd(struct arm_smmu_cd *cd,
 		.smmu = &smmu,
 	};
 
-	arm_smmu_make_sva_cd(cd, &master, NULL, asid);
+	__arm_smmu_make_sva_cd(cd, &master, NULL, asid);
 }
 
 static void arm_smmu_v3_write_ste_test_s1_to_s2_stall(struct kunit *test)
-- 
2.43.0


