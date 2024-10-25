Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF26D149F7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 23:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nlxFZtXbv8TUgrDYmzDIRMchZkPrluvgK/V/ik4gZ/A=; b=GDMJf3IQAyypBpWcYvI7ju9iGE
	nViHra5NMO3rAzXOn5jp7FJ7WqP1WowAA597vEJP7jdfquUNjFOZ+UO8bgUJ0xpCjSA6ql+ikD2uU
	JZ1XvNsKylaW6lv8tQ7epvZ6QcxjmC9kyCovIIdvD1uDqGwrrNzY02q5r4GWK56BdvTRNaOCZZ1FU
	q2zpjhAKKhzufFt2NLlV804hyAX545WdyOLn5AuW1pRVLRHQ1M+SZ3BAPA3vgi9ZpzgOzUdtotLiq
	GZKK/95CLqQNKvaVOtzm94wDcEuvUMkuRTve7a4+qlVHY6kNpCTGHPRF6qni2PC6SQz2PcMx83aga
	6CAqvxFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4UAn-00000005ac4-0oXK;
	Fri, 25 Oct 2024 23:56:53 +0000
Received: from mail-dm6nam10on2060a.outbound.protection.outlook.com ([2a01:111:f403:2413::60a] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4U4X-00000005YnQ-2jPU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 23:50:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OdGhwXSVUI7upYGP5UIsBfWw96RiGoNmwx+kg5LuMXHSLOnRJrnU0ys/LOUialDBYhEwJwHcROAQaM/vaG23/3sgq0obyHjB3PI7f74ekhufYpsbunkhlMEGzV+kF3ceEkjaiTdOIdv8zEuKgsIhSM3npVUNF1Rv4vGF6qVTqq0db6OKqoXNd82VqaH7wm8b99PgvvoeMsz8SX29G+O/EGCkoEAehYSs2aieZsyrKCDvRQK+nxvVZGXnlB+lQKe15tTVkDkjeL7pVUN7oLQUVQhXZtuBdeb0u9c92v3cYCTVu6/rstypMSfkpveG35fM29jt13Osqt10nUMoN/tXIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlxFZtXbv8TUgrDYmzDIRMchZkPrluvgK/V/ik4gZ/A=;
 b=EzygujGvOUGuvaa4Mqy8zOZ4bYzBagVticSi+3ZpjKol/qpeSORehLAibQ42rqYLpDWqovjouJBZRFHPNCp2C8Zb75KegryzpaGbIZ/IowMkgQshb+44HRA6j9+HKyW1Lcn8kWWLOlAOp2H0xRWqS31yWtU8wHib9TpV/3IWFoIlI4psLlUWAi2g96izlmuAwmxGZcpw21jsxb6+cfw6pruziSiPhNJF25HsTZ4Wk8txW/0ZgbYdABnfSmwe9WU0U6ledP2WuS+HUg3kiMXvtrVsM8AQaBOuViKYQNXd/5qSljNqXsnJgjFrDdrTzUdKJ9jZIOwClNZa2zsK316XzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlxFZtXbv8TUgrDYmzDIRMchZkPrluvgK/V/ik4gZ/A=;
 b=ZhRoVPTmAfgjSGlK0QCD0hlTlWLK+bmpynOQr0kbD5EeSNuUW8940adeb7RNHcw+ARU5LAGiEf5wcVgBanMbx0+AIpK+Cw8JFUkP2cHL0rVBHJvfroQvkqQ15mzfrsu8hnXxc0TYz2NEm3wgGHlXum3vWdsapMuG+PYpvupqKSV/i0RHsVZjfdTSsbVfzaMf80LdOJPjZrchZgvWFEPXo5rGmc7YtAiYGAGzdoCoFA0N5b9zQLgCHtoh4lOpo1BXhVzfVqKT5nebezQnRS/ITUMXvjOydZb6fKG7VqOCure1PcGdCLWY4/138fqdG+9kivSR86Us9flhraY/H8p97A==
Received: from MW4PR03CA0230.namprd03.prod.outlook.com (2603:10b6:303:b9::25)
 by CH2PR12MB4215.namprd12.prod.outlook.com (2603:10b6:610:ab::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Fri, 25 Oct
 2024 23:50:19 +0000
Received: from CO1PEPF000075F0.namprd03.prod.outlook.com
 (2603:10b6:303:b9:cafe::1f) by MW4PR03CA0230.outlook.office365.com
 (2603:10b6:303:b9::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20 via Frontend
 Transport; Fri, 25 Oct 2024 23:50:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF000075F0.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.14 via Frontend Transport; Fri, 25 Oct 2024 23:50:19 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 25 Oct
 2024 16:50:09 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 25 Oct 2024 16:50:09 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 25 Oct 2024 16:50:08 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <kevin.tian@intel.com>, <will@kernel.org>
CC: <joro@8bytes.org>, <suravee.suthikulpanit@amd.com>,
	<robin.murphy@arm.com>, <dwmw2@infradead.org>, <baolu.lu@linux.intel.com>,
	<shuah@kernel.org>, <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<eric.auger@redhat.com>, <jean-philippe@linaro.org>, <mdf@kernel.org>,
	<mshavit@google.com>, <shameerali.kolothum.thodi@huawei.com>,
	<smostafa@google.com>, <yi.l.liu@intel.com>, <aik@amd.com>,
	<zhangfei.gao@linaro.org>, <patches@lists.linux.dev>
Subject: [PATCH v5 05/13] iommufd: Add alloc_domain_nested op to iommufd_viommu_ops
Date: Fri, 25 Oct 2024 16:49:45 -0700
Message-ID: <fa5231cad2bf4b3ee9a18434a8981acb45f0e0b5.1729897352.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1729897352.git.nicolinc@nvidia.com>
References: <cover.1729897352.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F0:EE_|CH2PR12MB4215:EE_
X-MS-Office365-Filtering-Correlation-Id: 65acd73d-5f08-4c7b-4e24-08dcf54fc894
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NsrxnRwaw/vMJ2Hs2l1oWDKK6u8T1JSwvuuuG10Hug1ftutpcgH8yG16I7Nn?=
 =?us-ascii?Q?U1zKKKMYC9zWYHUFIoMD3VZ7MhDbFBdTcVMB1SWx1rKjeSqVEuoiycZ3qOgc?=
 =?us-ascii?Q?TkdPr4xzaqBl17RovTFBKYBfDOji591y8+KIBdKNCpT0x+jSybmIgxznjw/m?=
 =?us-ascii?Q?V4qDtnTQaoFR4CWa5AvuK7eP22/Eh1QulcWWxvyAivyQyPfAYjpmaUPuTd1h?=
 =?us-ascii?Q?VL3l9MfG70y6lKG7vhqfDkytkROO3u/Q2cFYh/diom2l5+t9t3zZbQ7DS9oW?=
 =?us-ascii?Q?yVfgDPKAcqLEqWX8NDaxGXwOXPjPwiqDCz9vO/LHRZE3Z7hiXInNk6rnXif1?=
 =?us-ascii?Q?v+PIbZl2V5ttZZ7qAUZ5Lk2lYbUCck6PNLXuAS7wNwAHJZJsF3DMEgNx6Dp8?=
 =?us-ascii?Q?eTq21b8UIbXgtfH2cnfMU/SZ3vosGEtOoIZWu0dnREwhUUwoyxG0jvrKy3Ko?=
 =?us-ascii?Q?EQ0GpJgn+0JzWt8jmSftzQTAXKa+lBy6J6UQOAxmJ8US9DyRvJp25vrhdXD/?=
 =?us-ascii?Q?eWrCgCk6wNJIeFS3ScPVVs7sVMqNGmM1OrQ3a1qO2/qYWvPQVhh0+xBTpCBG?=
 =?us-ascii?Q?cA2oLWhwXUctk10fI+G8AQVB3EiENtTdzw8x7+XgHouuXunMD3ioipILLGKg?=
 =?us-ascii?Q?kusIhFLcuIwNf8CYffYd1yvb+kab59fHcyvpKnlPfob+oPQC42vt1pLt/IqV?=
 =?us-ascii?Q?VQ2wVSr3TKMtQtmiNGg+kTWs01dTWMvdtccBT18VEI4iix0hYY6baJnqQB/J?=
 =?us-ascii?Q?IoEg2j5I4J6ZGFYeNkTq6QdncJafVNzkotUSlF/rtuTwANaE+9Vmd2L2CUZF?=
 =?us-ascii?Q?t5qn0+GBIPaBQ1NZF8/2YuUfC7++bOobmE16IcgwwGX7PzDltg2IjXdHxIZY?=
 =?us-ascii?Q?QLTuI11nyro56dEzu4ZlzABV2F9Jm8XxuZIPlLyU+RawOOqTnVMUq8AVc7yx?=
 =?us-ascii?Q?7lCIrlJtWex6sEe3a0NsmMNN1k80Vqzq5LejpkgCgwQUsk7pOaYoN8bRJpNz?=
 =?us-ascii?Q?NP2ick4zXjMt/DExcyMd9r2DXznGUlNsN4/Hu96zc87qqLMvW2gLJYvy7wP9?=
 =?us-ascii?Q?Bbf27+Hje0OTm6DfxcexVDeOsxIMcGF3AKYrH5w5GQetF20v0AP1nCPd6y8j?=
 =?us-ascii?Q?a7DZRmLYAhcSaphHFHH+T1+Htn6rS1rVT6+u84B8JlHlSJR4i9eqrxuhP91t?=
 =?us-ascii?Q?pQs8ubbqfvql6h7fQqMvsl8m2P0/gZV02BIVJJ2iywVd3OzHzGEbWwSy9cU8?=
 =?us-ascii?Q?fbt579g7f9vPpU6lKLUEZ3G6X2gqHiJwoMoyJ1e4yFrUI/f/+rUOA/ib6FPk?=
 =?us-ascii?Q?TzuijzkY9Dkhx8u5rLSqhLi8DJ7fJMLbc4flY481t+o1xYEquQFMeqrdRK+w?=
 =?us-ascii?Q?0P1Wp7NWennm/A2OlCFO88E2hZ/bWNjfhXxxbHzlklZks0YIlw=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 23:50:19.5214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65acd73d-5f08-4c7b-4e24-08dcf54fc894
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_165025_804005_5F990EAB 
X-CRM114-Status: GOOD (  10.27  )
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

Allow IOMMU driver to use a vIOMMU object that holds a nesting parent
hwpt/domain to allocate a nested domain.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 include/linux/iommufd.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index 4435f21bd833..083ceb209704 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -14,6 +14,7 @@
 struct device;
 struct file;
 struct iommu_group;
+struct iommu_user_data;
 struct iommufd_access;
 struct iommufd_ctx;
 struct iommufd_device;
@@ -95,9 +96,17 @@ struct iommufd_viommu {
  * struct iommufd_viommu_ops - vIOMMU specific operations
  * @free: Free all driver-specific parts of an iommufd_viommu. The memory of the
  *        vIOMMU will be free-ed by iommufd core after calling this free op.
+ * @alloc_domain_nested: Allocate a IOMMU_DOMAIN_NESTED on a vIOMMU that holds a
+ *                       nesting parent domain (IOMMU_DOMAIN_PAGING). @user_data
+ *                       must be defined in include/uapi/linux/iommufd.h.
+ *                       It must fully initialize the new iommu_domain before
+ *                       returning. Upon failure, ERR_PTR must be returned.
  */
 struct iommufd_viommu_ops {
 	void (*free)(struct iommufd_viommu *viommu);
+	struct iommu_domain *(*alloc_domain_nested)(
+		struct iommufd_viommu *viommu,
+		const struct iommu_user_data *user_data);
 };
 
 #if IS_ENABLED(CONFIG_IOMMUFD)
-- 
2.43.0


