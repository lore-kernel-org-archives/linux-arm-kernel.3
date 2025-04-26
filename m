Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDC1C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 06:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+eoXjMXeITRoq0DZlz2gB2GR7ocIDVpz/0X3xcmn62g=; b=VN/Ne5WJPubzmq9y57OGvrKIts
	wzTruxf1NUAVOU6H9Uf9N7XhvM6PyS7YgyLqIeFoBXtT/tn9z9mRIZntX2SEiKpD/B68Owk90ICf4
	KYd12AEoZwKG3baPSX7vPk1/P2hidZgMpEgag5h3ByuvFC/B/Bk7IHRpfd/a6oBbPpHw33eS/SDt0
	ob0caxJvQkKeRygPkjPrw/Cm6JDXs8vZv0FslOyH7KRp4A2NcvThyb1XatwbojAoSrH243hgb1lR+
	nZPaKaZmkgwXHYq6V8dofa3xCUAtFl+3GfP6nEUH2cYyAgz5adFi9pCRROaXrNkqLVBv8hpG/pH7M
	BjsW3qbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Z0U-00000001YcV-3HV5;
	Sat, 26 Apr 2025 06:27:22 +0000
Received: from mail-mw2nam10on2060f.outbound.protection.outlook.com ([2a01:111:f403:2412::60f] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8YZX-00000001Tse-15jo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 05:59:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZbhaQ3o9KqptnIvHDXLtHfLmcyEU/5No5zRZrQN5/8XiAJxAOi+3dNgLrSNqrxJKLpw40a9UjWMErbzUcK1JIr824iIw6jsP1fYgR+2rk2SuLgigeXr8Bw3FkM+Floi5D0Xo0KSuyNegESoCKu2p0PqUOWwpCw00pY9NKVEYG/qE3jx1cq0p6kX4jFwAhXaMQc/yZ002jtxGEu2kq4wVMqs4Yma+lzo3992wLMZRWLKgDx0VJzg7T4yhIeUg6xX4rjOux9uctfW2RYjfOSbgSdaGIGgAMjSDtaBZCHtFX19NVWyAhCeZgQZTZ2tWFzP7HYnJ+BsnlJxeOW1YSFREoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+eoXjMXeITRoq0DZlz2gB2GR7ocIDVpz/0X3xcmn62g=;
 b=YNPwdzHkLd3jVzxaRmEALZe6+n54/Ag1akz8h5ODD0/2VZLoYdehZqNduS2X4Rmiue022xnKVlMgYLW5zH2Zdb9LCudKryBmHBjg0Gfia9oksgMXKy2C1yttFJLNKY5C0qe6971C5l4oKSrvAWaa3RPZqdbFd9s3V1IagKYRxchjrrp/KFDwrkFg2l1JOfV67kzAHGRKf8JC+76A2ATKE7StwF4dCPR1Zh/gJFVLqds37FiIU/4L3H04dnzvHPMDK5pAKb7I/wCEm+RoLAK0rNLwQHDhD+jqI3DZsRU9LskyUvqktz2vyHq6MGgepvSEqjeABw8DNd8Z8CWrCiUKEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+eoXjMXeITRoq0DZlz2gB2GR7ocIDVpz/0X3xcmn62g=;
 b=GPcO3qltRp5W8+yMMrlfHfuvcPhzp8ZNHOc8UcRR6MPKbRDThbBD7TDXURRFy3jnjP2dWavm/jjBPH+r2nr9rR93xOz6bddLOZ86dUqh1DuhXO4XJw4V52UkwEgAS48mhAF/cN+TnErSSrJLXZAyEzofWfUxhwnJm2tzAjLs+K8h1XVJkFryBhhe9p5EfkiowY/w4C9Ksj8d1+NNmqoBwGvhzhtS0nFH0XWMN3ZW6vk0lw9qVKe9BILG/Lqkbb6ZyBxoTI3c/82Dy0TM3UVd/oruD/xTpctO4S4EWEVDSuMxyJrZq5F69YpT/thf4gE5JusRnbU9YkaE+TswDRfFjw==
Received: from SA9PR13CA0042.namprd13.prod.outlook.com (2603:10b6:806:22::17)
 by PH7PR12MB5593.namprd12.prod.outlook.com (2603:10b6:510:133::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Sat, 26 Apr
 2025 05:59:26 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:806:22:cafe::99) by SA9PR13CA0042.outlook.office365.com
 (2603:10b6:806:22::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.34 via Frontend Transport; Sat,
 26 Apr 2025 05:59:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Sat, 26 Apr 2025 05:59:25 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 25 Apr
 2025 22:59:16 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 25 Apr
 2025 22:59:15 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 25 Apr 2025 22:59:13 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <kevin.tian@intel.com>, <corbet@lwn.net>,
	<will@kernel.org>
CC: <bagasdotme@gmail.com>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<thierry.reding@gmail.com>, <vdumpa@nvidia.com>, <jonathanh@nvidia.com>,
	<shuah@kernel.org>, <jsnitsel@redhat.com>, <nathan@kernel.org>,
	<peterz@infradead.org>, <yi.l.liu@intel.com>, <mshavit@google.com>,
	<praan@google.com>, <zhangzekun11@huawei.com>, <iommu@lists.linux.dev>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <patches@lists.linux.dev>,
	<mochs@nvidia.com>, <alok.a.tiwari@oracle.com>, <vasant.hegde@amd.com>
Subject: [PATCH v2 14/22] iommufd/selftest: Add coverage for the new mmap interface
Date: Fri, 25 Apr 2025 22:58:09 -0700
Message-ID: <4682c7707606f54ad4ef62d3f1218a4870819c03.1745646960.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745646960.git.nicolinc@nvidia.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|PH7PR12MB5593:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fe736cb-57a2-401b-24ec-08dd84877fea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|82310400026|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4X7TYvEJeMMfr0jGUvwahsMtIVOnNg5CVWNqlneHTCQyfHbPyb7qJZUw+MBs?=
 =?us-ascii?Q?c30Qeq/tQX404VVAZ8oE87heM74pl5d61IIjn9be0ZttG5mzuP7SyvCRdD6T?=
 =?us-ascii?Q?lyxM0NWYmaPzzTF8ieV5IzOreafyfobw3YaaoY9xdxhJd6BI8/n5emIcoiar?=
 =?us-ascii?Q?Drqeozh5IdmvYXOIB+fH3xwMP8/wuEG36RVoCRZzZ7Q3EQPXuHwDu4akKzod?=
 =?us-ascii?Q?bV9x7+ZSf5U+RyTO6mYegoSCPoGZ6No4QEN8js4Udef9UMSt+l6V3RgH2AP7?=
 =?us-ascii?Q?iPVw5VF3v4s+Ys4bFwDEfnFvu15R3AdssAE91i6IDUf2EGN4+HSqrZmdvR2p?=
 =?us-ascii?Q?YE3kbvIr42Fie0VvMggCtXA9tcaIpr2B0n7CLZ7T2vL9AhdhFOG85Cv80F08?=
 =?us-ascii?Q?OLVoREGnolJvdOpPCGHSTcdvji5sDmLsgbqu5Fjap2uHu9KnHrHP5vLHxQ1T?=
 =?us-ascii?Q?3VSUVlCrA6r1CfvPhymvqvDxf1y5NSbAfkv7wzEmFJMSXQ/cBeosytnMefly?=
 =?us-ascii?Q?5BhH0gXgoIBA0FnV8FbfHWQjEbZ4LuK6uwzh4ZD6j86cYHFKaWHZcLCiUGF/?=
 =?us-ascii?Q?i/cQq9UhrP1I4VF2gvr2Jsl9J+rbN3OI/Dg+ZdoeE8CwhqLi+GWVKI7/nq7W?=
 =?us-ascii?Q?ttxX4kb/L57lZEvBZhiQTdXcVLTbHDIFqqutYDtR2rHjMQwhyrHR+hwOVrs9?=
 =?us-ascii?Q?4pDe4R3ex1onVNKM3JGQYrsyj7HfTLAji/u1jog5/3hW21xi0X8WCHksHI4q?=
 =?us-ascii?Q?SzTJ+i/irdcqBalVmCpcJsGAoTADeH+19AAK1Axef/Gs9szx0KLhf6jPOrVO?=
 =?us-ascii?Q?lRKUfPXNBRr3T+T2TPc2NLRXmnKICDUaDlLvZuVZBkDVJQ5SQvfd0Lg0YTJa?=
 =?us-ascii?Q?g3rPJC2DljGrpe+NtrjrrcbzIcYmLltswE2GQDB8Me1NT2SN7DQKzFNaSj8Z?=
 =?us-ascii?Q?P4HaLYdPrNvGKfs4ZtTdg2YZUUvUbSxMJDCy3iTX/BBB9qaD8WRmRLHY8+Gp?=
 =?us-ascii?Q?/s7ci89t5FcayS/YbJ1F+Lvgz+EEBikwwVL8HomnHyUb/3MTG8BcCqSXNKv2?=
 =?us-ascii?Q?kiQe28Q30KS64JCECxlGemYknF/NNqrYIcdYN2IEsujZKfwQ91lE6AwpXtqo?=
 =?us-ascii?Q?AhjbC51iVyHG6kvREfT47YXTUsllx0ezY3nPb+Q6VeQorexyVhaClJ22EPPu?=
 =?us-ascii?Q?e3xLDZiBe0zG/ICj87dgs+GqVyBOb6CrbRD+pYe5ldt+tyi4Wu/tKo4TCt68?=
 =?us-ascii?Q?gW3EfDRH4uiXZY2JGB/WJPvZ6FVXb3TsFFzop7kQhZEcWypkKqSQV26WupP4?=
 =?us-ascii?Q?Xb4qQi9SfQqMFxYwgQ4KONvc29BvdEsYOThPrdrcAw92XJGSeyZGprmtzuJn?=
 =?us-ascii?Q?g7ZAx8xbTmyDd/B47rk9Pykb6Qxp7YKgS7dvs4jeW2RoDJOuEIvYxIrq6Tm9?=
 =?us-ascii?Q?UThh6tneEnMUHWVWs9s/eVZia2cNBx8VjaOPO4JKo6oZ9WDabDCfUnCfBwqL?=
 =?us-ascii?Q?c/6udJxAaSKlzhioLapwmnuxT+2I8tAA+zm2?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2025 05:59:25.6418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fe736cb-57a2-401b-24ec-08dd84877fea
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5593
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_225931_308651_01E73CC8 
X-CRM114-Status: GOOD (  15.58  )
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

Extend the loopback test to a new mmap page.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommufd/iommufd_test.h    |  4 +++
 drivers/iommu/iommufd/selftest.c        | 37 ++++++++++++++++++++++---
 tools/testing/selftests/iommu/iommufd.c |  5 ++++
 3 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/iommufd/iommufd_test.h b/drivers/iommu/iommufd/iommufd_test.h
index a0831d78fef1..86a983f59552 100644
--- a/drivers/iommu/iommufd/iommufd_test.h
+++ b/drivers/iommu/iommufd/iommufd_test.h
@@ -232,12 +232,16 @@ struct iommu_hwpt_invalidate_selftest {
  *                                (IOMMU_VIOMMU_TYPE_SELFTEST)
  * @in_data: Input random data from user space
  * @out_data: Output data (matching @in_data) to user space
+ * @out_mmap_pgoff: The offset argument for mmap syscall
+ * @out_mmap_pgsz: Maximum page size for mmap syscall
  *
  * Simply set @out_data=@in_data for a loopback test
  */
 struct iommu_viommu_selftest {
 	__u32 in_data;
 	__u32 out_data;
+	__aligned_u64 out_mmap_pgoff;
+	__aligned_u64 out_mmap_pgsz;
 };
 
 /* Should not be equal to any defined value in enum iommu_viommu_invalidate_data_type */
diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
index d6cc5b78821b..cd058dcd5984 100644
--- a/drivers/iommu/iommufd/selftest.c
+++ b/drivers/iommu/iommufd/selftest.c
@@ -149,6 +149,9 @@ struct mock_viommu {
 	struct iommufd_viommu core;
 	struct mock_iommu_domain *s2_parent;
 	struct mock_vcmdq *mock_vcmdq[IOMMU_TEST_VCMDQ_MAX];
+
+	unsigned long mmap_pgoff;
+	u32 *page; /* Mmap page to test u32 type of in_data */
 };
 
 static inline struct mock_viommu *to_mock_viommu(struct iommufd_viommu *viommu)
@@ -645,9 +648,12 @@ static void mock_viommu_destroy(struct iommufd_viommu *viommu)
 {
 	struct mock_iommu_device *mock_iommu = container_of(
 		viommu->iommu_dev, struct mock_iommu_device, iommu_dev);
+	struct mock_viommu *mock_viommu = to_mock_viommu(viommu);
 
 	if (refcount_dec_and_test(&mock_iommu->users))
 		complete(&mock_iommu->complete);
+	iommufd_ctx_free_mmap(viommu->ictx, mock_viommu->mmap_pgoff);
+	free_page((unsigned long)mock_viommu->page);
 
 	/* iommufd core frees mock_viommu and viommu */
 }
@@ -827,17 +833,40 @@ mock_viommu_alloc(struct device *dev, struct iommu_domain *domain,
 		return ERR_CAST(mock_viommu);
 
 	if (user_data) {
+		mock_viommu->page =
+			(u32 *)__get_free_page(GFP_KERNEL | __GFP_ZERO);
+		if (!mock_viommu->page) {
+			rc = -ENOMEM;
+			goto err_destroy_struct;
+		}
+
+		rc = iommufd_ctx_alloc_mmap(ictx, __pa(mock_viommu->page),
+					    PAGE_SIZE,
+					    &mock_viommu->mmap_pgoff);
+		if (rc)
+			goto err_free_page;
+
+		/* For loopback tests on both the page and out_data */
+		*mock_viommu->page = data.in_data;
 		data.out_data = data.in_data;
+		data.out_mmap_pgsz = PAGE_SIZE;
+		data.out_mmap_pgoff = mock_viommu->mmap_pgoff;
 		rc = iommu_copy_struct_to_user(
 			user_data, &data, IOMMU_VIOMMU_TYPE_SELFTEST, out_data);
-		if (rc) {
-			iommufd_struct_destroy(ictx, mock_viommu, core);
-			return ERR_PTR(rc);
-		}
+		if (rc)
+			goto err_free_mmap;
 	}
 
 	refcount_inc(&mock_iommu->users);
 	return &mock_viommu->core;
+
+err_free_mmap:
+	iommufd_ctx_free_mmap(ictx, mock_viommu->mmap_pgoff);
+err_free_page:
+	free_page((unsigned long)mock_viommu->page);
+err_destroy_struct:
+	iommufd_struct_destroy(ictx, mock_viommu, core);
+	return ERR_PTR(rc);
 }
 
 static const struct iommu_ops mock_ops = {
diff --git a/tools/testing/selftests/iommu/iommufd.c b/tools/testing/selftests/iommu/iommufd.c
index 7c464f6eb37b..f6dbee6a352c 100644
--- a/tools/testing/selftests/iommu/iommufd.c
+++ b/tools/testing/selftests/iommu/iommufd.c
@@ -2799,12 +2799,17 @@ TEST_F(iommufd_viommu, viommu_alloc_with_data)
 	struct iommu_viommu_selftest data = {
 		.in_data = 0xbeef,
 	};
+	uint32_t *test;
 
 	if (self->device_id) {
 		test_cmd_viommu_alloc(self->device_id, self->hwpt_id,
 				      IOMMU_VIOMMU_TYPE_SELFTEST, &data,
 				      sizeof(data), &self->viommu_id);
 		assert(data.out_data == data.in_data);
+		test = mmap(NULL, data.out_mmap_pgsz, PROT_READ | PROT_WRITE,
+			    MAP_SHARED, self->fd, data.out_mmap_pgoff);
+		assert(test && *test == data.in_data);
+		munmap(test, data.out_mmap_pgsz);
 	}
 }
 
-- 
2.43.0


