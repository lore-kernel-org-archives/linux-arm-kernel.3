Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E86AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 19:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVYRE0iFhLpLnxfdW4dHe6rIsP68BjSfNRzJMhKZKk8=; b=ObXaxMV0aJkJ2K6xXMcvsnXkXe
	OqR5EB6fq6WTg0elotpUGmHpOS9g1Vkrew6k8j8rD/FAYPkU1OkbTbZYZH/j4B4pGiwJxfW3fYXik
	zkA8KyBBjbanS218XipKlHmxG0TP+HnmZ4qjBjIxcKV1jgY8ThQTSw7EcPR1f4PmR32YJ+JZDbx+Y
	6FmpqfTjPA2PXu+oyD/FI6xMKX5TynWw8b8Lga0PSDbL04ZjL3jQ0LxM/0MVFKV65RGxUfKyOO1uE
	2ee5TZAMIEEYWfcAHGLWbZtdJdg4r64+JLmwKGdsX9cXrekaQN0Q2PgSw3LnvORWcBViJQIrWKqcR
	B1zsDUOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTnnj-0000000DtAL-1aat;
	Fri, 03 Jan 2025 19:57:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTnbJ-0000000Dqd2-3YS2
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 03 Jan 2025 19:44:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pVYRE0iFhLpLnxfdW4dHe6rIsP68BjSfNRzJMhKZKk8=; b=hN7IpysLQQiYhw+FtJFJZCAd9/
	coEhX4tB2TMuWY8Elf1toL3jYVsFdWhoP73lS4EC4TFnuO0U8I2b8IlW0ISvPriVIPH0gU6cI3NQJ
	kmcwS8FsybPYlm7qE84kP+MWs0kONO98WRJPxf6J+kzJkeqdz8kz5ajdNA5nqqRdCt23CBl5Jt+bu
	mcn3r5zvx05koRsIViTnN1XN1FFADmwIwgqM20yGHSfVgz2l+8YyMVKn02NRQoX15ShzgwP4jFrr4
	++lOStt4LTJT2xyHpYr42sNoyL6EgvxIF8IPKB1pxU1nl2iGNkhT2euMJDXakfevW/e0GRr8xNoas
	NqH/+udw==;
Received: from mail-dm6nam10on20621.outbound.protection.outlook.com ([2a01:111:f403:2413::621] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTnbG-00000008RHG-2hD6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 19:44:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tLdbm8FzzDt0MkWsqo84ptWEQd2ux0myI5MbffxYc6MkaPKJ4Q6j/QI0Aou8mh5QixxpkqPUHL2o9KnbCWVQCf1bsTjUGN9u+QGGVP9I0yoG/BnMIDrV8f7PCskv0BusLvnJxog2YUNxzkG6ZyEGYepKPNYGu6w9bKp55DNE0McVv5wxX20k3UZw5cvDEj4fBz6ZDZO/63gEt+uwUhFLwqm0e21d4cmMkt75m2jNYPsNBOy6ct8Y7ECZRBI4GIVGu4oU712ENH5b6ZDXwTB0qBZFa59KT8wYYeeD5h9eXJsgjE9lTaPNo5ZlRN8dStvvcGGaayPbqKC2x7/qdB97dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVYRE0iFhLpLnxfdW4dHe6rIsP68BjSfNRzJMhKZKk8=;
 b=pVVxazZpIu6pEdviiuOks5dv7yNaSY0Ba1W4K/hAwVbb1afoHcVScjedGYYpCh5ksUYtMGtVaUKzh51Q05exCLfJ7J/Doty/tW1rK4OQjCmD2HgCy+e6kMXHAh/kSjwvljZQz/BLpvtoU3jxHgFbsk4HFM7i8VSFqkw+cRz3O4FogDs/fxk0IBSxi+7xhTCXWtm/jDZGvk2p7k3UCwD+zyIuEFr54HuW4Ta7J4KGUO1Nwn04aCk6CjEjBoxwEZGy9ooJqvVy3Z83MKDxoq8pt8/QurbDZUxOohDGHNGufaO3JyIXD8jIlOQlo6bQoyeEs3Rmic6yzMXNfBZ3VP1yog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVYRE0iFhLpLnxfdW4dHe6rIsP68BjSfNRzJMhKZKk8=;
 b=HMOZCeIy5DSJr3yEYxBf39+jHle0MJr6j5ORlqda2LshZdRUa8vGcikUAOP9oPmX+T3IDKurAFLNYF0gdlR3sArFt/ousFXGXPRVAvUkcYPREXU2qb12TojeE331QtlHcTCsHBGUJdCnqteD2ZY9jep+JuhyxtvPy/Q4Y1nSfTJGcldLZ/X6nnaqUw7iK1PBt4cf3qATypJ602Otbut/JkcOaN/sXPkYLSFr37W2fUVaw9xgPy+L0yc7d1iCDMdEZNKHo4zSmwt3Stfp6I1bvaEoJ7UMVu9PfpkZvqpBfRMQNftPl1N/kfUUvRwqGdCTaWtSb+39RcWmEN+l7FdOLg==
Received: from BN6PR17CA0028.namprd17.prod.outlook.com (2603:10b6:405:75::17)
 by DS0PR12MB8765.namprd12.prod.outlook.com (2603:10b6:8:14e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.11; Fri, 3 Jan
 2025 19:44:26 +0000
Received: from BN3PEPF0000B06F.namprd21.prod.outlook.com
 (2603:10b6:405:75:cafe::bf) by BN6PR17CA0028.outlook.office365.com
 (2603:10b6:405:75::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.12 via Frontend Transport; Fri,
 3 Jan 2025 19:44:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B06F.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.0 via Frontend Transport; Fri, 3 Jan 2025 19:44:26 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 3 Jan 2025
 11:44:09 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 3 Jan 2025
 11:44:09 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 3 Jan 2025 11:44:07 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <kevin.tian@intel.com>, <corbet@lwn.net>,
	<will@kernel.org>
CC: <joro@8bytes.org>, <suravee.suthikulpanit@amd.com>,
	<robin.murphy@arm.com>, <dwmw2@infradead.org>, <baolu.lu@linux.intel.com>,
	<shuah@kernel.org>, <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <eric.auger@redhat.com>,
	<jean-philippe@linaro.org>, <mdf@kernel.org>, <mshavit@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <smostafa@google.com>,
	<ddutile@redhat.com>, <yi.l.liu@intel.com>, <patches@lists.linux.dev>
Subject: [PATCH v4 04/14] iommufd: Abstract an iommufd_eventq from iommufd_fault
Date: Fri, 3 Jan 2025 11:43:27 -0800
Message-ID: <5d4bf92ce7e64a1c424f1b89d1a78f20bc6d7557.1735933254.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1735933254.git.nicolinc@nvidia.com>
References: <cover.1735933254.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06F:EE_|DS0PR12MB8765:EE_
X-MS-Office365-Filtering-Correlation-Id: 906c4bd6-e684-4570-18e1-08dd2c2f07c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rTG/xHxRmMiIrHRoayHAMMfca8mHeSGwei2JJIHx8n8zAM793/cYckRX0BPb?=
 =?us-ascii?Q?mCm1h9XGd+rEavbi1GzqnaMUI4ETIcjsNBAtYMisoARyuaCyLBgqGZqwX/Ma?=
 =?us-ascii?Q?ClzhCHCRYfx4GbHeIZr7Ntayzdxbu/46Y+VoHnfFkJuvE6oAs9jduJ8YfKxX?=
 =?us-ascii?Q?8jchA8W1pSYYV4cVkCTbIhsSaOXQvbQ8MJjEGyElXePlZo3LSQULtS62r6i4?=
 =?us-ascii?Q?Bvo4xbhChCJ/lgf+LqGQn96YeAVGbwMj23Y93WGDh27U77MbcAA8K0ql4qkR?=
 =?us-ascii?Q?NM1OBvZUeQpEsjWqMA076l6CV6yhOj3fVSLcGT3wWDu62Jd6MpDlndBD96wn?=
 =?us-ascii?Q?STYXHa6lpkIHsjUjehQCp3nspcs+uEyURMcFfk3WOXlGF6Xy+AmPIRCMR7ML?=
 =?us-ascii?Q?iOvvQinOsvlCEtWysyFDSus9ytpyNTRk3HGJBreZ8BXHActNGlCmWrU6QzKf?=
 =?us-ascii?Q?YlA7GhW0+clcatARDIwLnWFz4+UPLePXemxmjVvqKO+nZxEIFdYe1qF30Brl?=
 =?us-ascii?Q?fUs2KmS4gmInRpeyG3xqrxUE4wYL5Jh9jbo+XFbyLChO8q1OcTeUT1lsOETC?=
 =?us-ascii?Q?vuEEa6bbgCX4ujbE2YSIv8sL9k2g/TGLYqWLRfrJuYUPdMRzTMqBT6cOUZy7?=
 =?us-ascii?Q?CG/ET/XvciRsYteU5MIfzvi/laxiqmxR7E4Yo7ElAOsivqM2HfAESw66UjYP?=
 =?us-ascii?Q?YJaF2AlrmUMrMmVzmj+ftvYJHp6+g4/RISXffcQd4P8elSIS6hK0c14+HJdJ?=
 =?us-ascii?Q?Obp6f/gS/aTfMY7nGBArfanY7Saz7vqRLbGQ2SNfPrtg3H6dSdHhsiAOJNeR?=
 =?us-ascii?Q?Y/xaG403iqVM/2KoBJ46R46JZ/3ATryUtwJf2/16OmlagGSTN6V/r1e2Ll8v?=
 =?us-ascii?Q?AfoNZnHR0/6Oub35yh5CsFo4J6XJLmwlgaQYQQ1djQjbgnlY/qViwhezAEt9?=
 =?us-ascii?Q?F602blCSbkJ77aJgFFuXcksVxFtFwVLU0i5JRITccPmH9a33yWkRcabmfKeX?=
 =?us-ascii?Q?V+HLb20U5Aiq6BUCiOcaS0vBHjSjLwLKR6i2mR9NyygPupeFkTaf4luljFIB?=
 =?us-ascii?Q?p99SxsL3gcM0eYOzXlt297zNJlUgSs0tCVVoaAiQrgoazYOWKGV7AqIke1a2?=
 =?us-ascii?Q?emRRARP9yx4bbPFYKZHB9TW6OBtliUQTMf7LvUs7bU1TMhU/4enOKgo9BNK3?=
 =?us-ascii?Q?ItzG6F2h9PUXEPLZaYByzSvyIKfWYItx7zWUZe0B6ytBEWQGWxl94q9WNVQm?=
 =?us-ascii?Q?U02lfo6yS+mkWYcwbUcGDlnBoKfr3uV65yIv0qsMa9X+lAaW80Ey7OhKo7JB?=
 =?us-ascii?Q?P1Xvb0ucmw7x5Rute04s1t2i7RrGpr8k7lfIhmsTV0xkru/yK3MnDjWJGYrR?=
 =?us-ascii?Q?SxtCeL5Hy4XLmCictxjQIy6k00lLbiVFbd1OFRlu5U98aOid9dTjoQzdhQk2?=
 =?us-ascii?Q?TOkyio+66hqybMVqmr3/VVwHafQe7akKhmVQpw6dCfb8HAAyA7JNZVmEfXzt?=
 =?us-ascii?Q?l16G/yMO12Qx73g=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 19:44:26.0086
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 906c4bd6-e684-4570-18e1-08dd2c2f07c8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8765
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_194451_048214_BF737791 
X-CRM114-Status: GOOD (  18.58  )
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

The fault object was designed exclusively for hwpt's IO page faults (PRI).
But its queue implementation can be reused for other purposes too, such as
hardware IRQ and event injections to user space.

Meanwhile, a fault object holds a list of faults. So it's more accurate to
call it a "fault queue". Combining the reusing idea above, abstract a new
iommufd_eventq as a common structure embedded into struct iommufd_fault,
similar to hwpt_paging holding a common hwpt.

Add a common iommufd_eventq_ops and iommufd_eventq_init to prepare for an
IOMMUFD_OBJ_VEVENTQ (vIOMMU Event Queue).

Also, add missing xa_destroy and mutex_destroy in iommufd_fault_destroy().

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommufd/iommufd_private.h |  52 ++++++---
 drivers/iommu/iommufd/fault.c           | 142 +++++++++++++++---------
 drivers/iommu/iommufd/hw_pagetable.c    |   6 +-
 3 files changed, 130 insertions(+), 70 deletions(-)

diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
index 8b378705ee71..dfbc5cfbd164 100644
--- a/drivers/iommu/iommufd/iommufd_private.h
+++ b/drivers/iommu/iommufd/iommufd_private.h
@@ -18,6 +18,7 @@ struct iommu_domain;
 struct iommu_group;
 struct iommu_option;
 struct iommufd_device;
+struct iommufd_eventq;
 
 struct iommufd_ctx {
 	struct file *file;
@@ -433,32 +434,35 @@ void iopt_remove_access(struct io_pagetable *iopt,
 			u32 iopt_access_list_id);
 void iommufd_access_destroy_object(struct iommufd_object *obj);
 
-/*
- * An iommufd_fault object represents an interface to deliver I/O page faults
- * to the user space. These objects are created/destroyed by the user space and
- * associated with hardware page table objects during page-table allocation.
- */
-struct iommufd_fault {
+struct iommufd_eventq_ops {
+	ssize_t (*read)(struct iommufd_eventq *eventq, char __user *buf,
+			size_t count, loff_t *ppos); /* Mandatory op */
+	ssize_t (*write)(struct iommufd_eventq *eventq, const char __user *buf,
+			 size_t count, loff_t *ppos); /* Optional op */
+};
+
+struct iommufd_eventq {
 	struct iommufd_object obj;
 	struct iommufd_ctx *ictx;
 	struct file *filep;
 
-	/* The lists of outstanding faults protected by below mutex. */
+	const struct iommufd_eventq_ops *ops;
+
+	/* The lists of outstanding events protected by below mutex. */
 	struct mutex mutex;
 	struct list_head deliver;
-	struct xarray response;
 
 	struct wait_queue_head wait_queue;
 };
 
-static inline int iommufd_fault_notify(struct iommufd_fault *fault,
-				       struct list_head *new_fault)
+static inline int iommufd_eventq_notify(struct iommufd_eventq *eventq,
+					struct list_head *new_event)
 {
-	mutex_lock(&fault->mutex);
-	list_add_tail(new_fault, &fault->deliver);
-	mutex_unlock(&fault->mutex);
+	mutex_lock(&eventq->mutex);
+	list_add_tail(new_event, &eventq->deliver);
+	mutex_unlock(&eventq->mutex);
 
-	wake_up_interruptible(&fault->wait_queue);
+	wake_up_interruptible(&eventq->wait_queue);
 	return 0;
 }
 
@@ -470,12 +474,28 @@ struct iommufd_attach_handle {
 /* Convert an iommu attach handle to iommufd handle. */
 #define to_iommufd_handle(hdl)	container_of(hdl, struct iommufd_attach_handle, handle)
 
+/*
+ * An iommufd_fault object represents an interface to deliver I/O page faults
+ * to the user space. These objects are created/destroyed by the user space and
+ * associated with hardware page table objects during page-table allocation.
+ */
+struct iommufd_fault {
+	struct iommufd_eventq common;
+	struct xarray response;
+};
+
+static inline struct iommufd_fault *
+eventq_to_fault(struct iommufd_eventq *eventq)
+{
+	return container_of(eventq, struct iommufd_fault, common);
+}
+
 static inline struct iommufd_fault *
 iommufd_get_fault(struct iommufd_ucmd *ucmd, u32 id)
 {
 	return container_of(iommufd_get_object(ucmd->ictx, id,
 					       IOMMUFD_OBJ_FAULT),
-			    struct iommufd_fault, obj);
+			    struct iommufd_fault, common.obj);
 }
 
 int iommufd_fault_alloc(struct iommufd_ucmd *ucmd);
@@ -486,7 +506,7 @@ static inline int iommufd_fault_iopf_handler(struct iopf_group *group)
 	struct iommufd_hw_pagetable *hwpt =
 		group->attach_handle->domain->fault_data;
 
-	return iommufd_fault_notify(hwpt->fault, &group->node);
+	return iommufd_eventq_notify(&hwpt->fault->common, &group->node);
 }
 
 int iommufd_fault_domain_attach_dev(struct iommufd_hw_pagetable *hwpt,
diff --git a/drivers/iommu/iommufd/fault.c b/drivers/iommu/iommufd/fault.c
index d188994e4e84..e386b6c3e6ab 100644
--- a/drivers/iommu/iommufd/fault.c
+++ b/drivers/iommu/iommufd/fault.c
@@ -17,6 +17,8 @@
 #include "../iommu-priv.h"
 #include "iommufd_private.h"
 
+/* IOMMUFD_OBJ_FAULT Functions */
+
 static int iommufd_fault_iopf_enable(struct iommufd_device *idev)
 {
 	struct device *dev = idev->dev;
@@ -108,8 +110,8 @@ static void iommufd_auto_response_faults(struct iommufd_hw_pagetable *hwpt,
 	if (!fault)
 		return;
 
-	mutex_lock(&fault->mutex);
-	list_for_each_entry_safe(group, next, &fault->deliver, node) {
+	mutex_lock(&fault->common.mutex);
+	list_for_each_entry_safe(group, next, &fault->common.deliver, node) {
 		if (group->attach_handle != &handle->handle)
 			continue;
 		list_del(&group->node);
@@ -124,7 +126,7 @@ static void iommufd_auto_response_faults(struct iommufd_hw_pagetable *hwpt,
 		iopf_group_response(group, IOMMU_PAGE_RESP_INVALID);
 		iopf_free_group(group);
 	}
-	mutex_unlock(&fault->mutex);
+	mutex_unlock(&fault->common.mutex);
 }
 
 static struct iommufd_attach_handle *
@@ -211,7 +213,8 @@ int iommufd_fault_domain_replace_dev(struct iommufd_device *idev,
 
 void iommufd_fault_destroy(struct iommufd_object *obj)
 {
-	struct iommufd_fault *fault = container_of(obj, struct iommufd_fault, obj);
+	struct iommufd_eventq *eventq =
+		container_of(obj, struct iommufd_eventq, obj);
 	struct iopf_group *group, *next;
 
 	/*
@@ -220,11 +223,13 @@ void iommufd_fault_destroy(struct iommufd_object *obj)
 	 * accessing this pointer. Therefore, acquiring the mutex here
 	 * is unnecessary.
 	 */
-	list_for_each_entry_safe(group, next, &fault->deliver, node) {
+	list_for_each_entry_safe(group, next, &eventq->deliver, node) {
 		list_del(&group->node);
 		iopf_group_response(group, IOMMU_PAGE_RESP_INVALID);
 		iopf_free_group(group);
 	}
+	xa_destroy(&eventq_to_fault(eventq)->response);
+	mutex_destroy(&eventq->mutex);
 }
 
 static void iommufd_compose_fault_message(struct iommu_fault *fault,
@@ -242,11 +247,12 @@ static void iommufd_compose_fault_message(struct iommu_fault *fault,
 	hwpt_fault->cookie = cookie;
 }
 
-static ssize_t iommufd_fault_fops_read(struct file *filep, char __user *buf,
-				       size_t count, loff_t *ppos)
+static ssize_t iommufd_fault_fops_read(struct iommufd_eventq *eventq,
+				       char __user *buf, size_t count,
+				       loff_t *ppos)
 {
 	size_t fault_size = sizeof(struct iommu_hwpt_pgfault);
-	struct iommufd_fault *fault = filep->private_data;
+	struct iommufd_fault *fault = eventq_to_fault(eventq);
 	struct iommu_hwpt_pgfault data;
 	struct iommufd_device *idev;
 	struct iopf_group *group;
@@ -257,10 +263,10 @@ static ssize_t iommufd_fault_fops_read(struct file *filep, char __user *buf,
 	if (*ppos || count % fault_size)
 		return -ESPIPE;
 
-	mutex_lock(&fault->mutex);
-	while (!list_empty(&fault->deliver) && count > done) {
-		group = list_first_entry(&fault->deliver,
-					 struct iopf_group, node);
+	mutex_lock(&eventq->mutex);
+	while (!list_empty(&eventq->deliver) && count > done) {
+		group = list_first_entry(&eventq->deliver, struct iopf_group,
+					 node);
 
 		if (group->fault_count * fault_size > count - done)
 			break;
@@ -285,16 +291,17 @@ static ssize_t iommufd_fault_fops_read(struct file *filep, char __user *buf,
 
 		list_del(&group->node);
 	}
-	mutex_unlock(&fault->mutex);
+	mutex_unlock(&eventq->mutex);
 
 	return done == 0 ? rc : done;
 }
 
-static ssize_t iommufd_fault_fops_write(struct file *filep, const char __user *buf,
-					size_t count, loff_t *ppos)
+static ssize_t iommufd_fault_fops_write(struct iommufd_eventq *eventq,
+					const char __user *buf, size_t count,
+					loff_t *ppos)
 {
 	size_t response_size = sizeof(struct iommu_hwpt_page_response);
-	struct iommufd_fault *fault = filep->private_data;
+	struct iommufd_fault *fault = eventq_to_fault(eventq);
 	struct iommu_hwpt_page_response response;
 	struct iopf_group *group;
 	size_t done = 0;
@@ -303,7 +310,7 @@ static ssize_t iommufd_fault_fops_write(struct file *filep, const char __user *b
 	if (*ppos || count % response_size)
 		return -ESPIPE;
 
-	mutex_lock(&fault->mutex);
+	mutex_lock(&eventq->mutex);
 	while (count > done) {
 		rc = copy_from_user(&response, buf + done, response_size);
 		if (rc)
@@ -329,62 +336,93 @@ static ssize_t iommufd_fault_fops_write(struct file *filep, const char __user *b
 		iopf_free_group(group);
 		done += response_size;
 	}
-	mutex_unlock(&fault->mutex);
+	mutex_unlock(&eventq->mutex);
 
 	return done == 0 ? rc : done;
 }
 
-static __poll_t iommufd_fault_fops_poll(struct file *filep,
-					struct poll_table_struct *wait)
+static const struct iommufd_eventq_ops iommufd_fault_ops = {
+	.read = &iommufd_fault_fops_read,
+	.write = &iommufd_fault_fops_write,
+};
+
+/* Common Event Queue Functions */
+
+static ssize_t iommufd_eventq_fops_read(struct file *filep, char __user *buf,
+					size_t count, loff_t *ppos)
 {
-	struct iommufd_fault *fault = filep->private_data;
+	struct iommufd_eventq *eventq = filep->private_data;
+
+	return eventq->ops->read(eventq, buf, count, ppos);
+}
+
+static ssize_t iommufd_eventq_fops_write(struct file *filep,
+					 const char __user *buf, size_t count,
+					 loff_t *ppos)
+{
+	struct iommufd_eventq *eventq = filep->private_data;
+
+	if (!eventq->ops->write)
+		return -EOPNOTSUPP;
+	return eventq->ops->write(eventq, buf, count, ppos);
+}
+
+static __poll_t iommufd_eventq_fops_poll(struct file *filep,
+					 struct poll_table_struct *wait)
+{
+	struct iommufd_eventq *eventq = filep->private_data;
 	__poll_t pollflags = EPOLLOUT;
 
-	poll_wait(filep, &fault->wait_queue, wait);
-	mutex_lock(&fault->mutex);
-	if (!list_empty(&fault->deliver))
+	poll_wait(filep, &eventq->wait_queue, wait);
+	mutex_lock(&eventq->mutex);
+	if (!list_empty(&eventq->deliver))
 		pollflags |= EPOLLIN | EPOLLRDNORM;
-	mutex_unlock(&fault->mutex);
+	mutex_unlock(&eventq->mutex);
 
 	return pollflags;
 }
 
-static int iommufd_fault_fops_release(struct inode *inode, struct file *filep)
+static int iommufd_eventq_fops_release(struct inode *inode, struct file *filep)
 {
-	struct iommufd_fault *fault = filep->private_data;
+	struct iommufd_eventq *eventq = filep->private_data;
 
-	refcount_dec(&fault->obj.users);
-	iommufd_ctx_put(fault->ictx);
+	refcount_dec(&eventq->obj.users);
+	iommufd_ctx_put(eventq->ictx);
 	return 0;
 }
 
-static const struct file_operations iommufd_fault_fops = {
+static const struct file_operations iommufd_eventq_fops = {
 	.owner		= THIS_MODULE,
 	.open		= nonseekable_open,
-	.read		= iommufd_fault_fops_read,
-	.write		= iommufd_fault_fops_write,
-	.poll		= iommufd_fault_fops_poll,
-	.release	= iommufd_fault_fops_release,
+	.read		= iommufd_eventq_fops_read,
+	.write		= iommufd_eventq_fops_write,
+	.poll		= iommufd_eventq_fops_poll,
+	.release	= iommufd_eventq_fops_release,
 };
 
-static int iommufd_fault_init(struct iommufd_fault *fault, char *name,
-			      struct iommufd_ctx *ictx)
+static int iommufd_eventq_init(struct iommufd_eventq *eventq, char *name,
+			       struct iommufd_ctx *ictx,
+			       const struct iommufd_eventq_ops *ops)
 {
 	struct file *filep;
 	int fdno;
 
-	mutex_init(&fault->mutex);
-	INIT_LIST_HEAD(&fault->deliver);
-	init_waitqueue_head(&fault->wait_queue);
+	if (WARN_ON_ONCE(!ops || !ops->read))
+		return -EINVAL;
+
+	mutex_init(&eventq->mutex);
+	INIT_LIST_HEAD(&eventq->deliver);
+	init_waitqueue_head(&eventq->wait_queue);
 
-	filep = anon_inode_getfile(name, &iommufd_fault_fops, fault, O_RDWR);
+	filep = anon_inode_getfile(name, &iommufd_eventq_fops, eventq, O_RDWR);
 	if (IS_ERR(filep))
 		return PTR_ERR(filep);
 
-	fault->ictx = ictx;
-	iommufd_ctx_get(fault->ictx);
-	fault->filep = filep;
-	refcount_inc(&fault->obj.users);
+	eventq->ops = ops;
+	eventq->ictx = ictx;
+	iommufd_ctx_get(eventq->ictx);
+	refcount_inc(&eventq->obj.users);
+	eventq->filep = filep;
 
 	fdno = get_unused_fd_flags(O_CLOEXEC);
 	if (fdno < 0)
@@ -402,34 +440,36 @@ int iommufd_fault_alloc(struct iommufd_ucmd *ucmd)
 	if (cmd->flags)
 		return -EOPNOTSUPP;
 
-	fault = iommufd_object_alloc(ucmd->ictx, fault, IOMMUFD_OBJ_FAULT);
+	fault = __iommufd_object_alloc(ucmd->ictx, fault, IOMMUFD_OBJ_FAULT,
+				       common.obj);
 	if (IS_ERR(fault))
 		return PTR_ERR(fault);
 
 	xa_init_flags(&fault->response, XA_FLAGS_ALLOC1);
 
-	fdno = iommufd_fault_init(fault, "[iommufd-pgfault]", ucmd->ictx);
+	fdno = iommufd_eventq_init(&fault->common, "[iommufd-pgfault]",
+				   ucmd->ictx, &iommufd_fault_ops);
 	if (fdno < 0) {
 		rc = fdno;
 		goto out_abort;
 	}
 
-	cmd->out_fault_id = fault->obj.id;
+	cmd->out_fault_id = fault->common.obj.id;
 	cmd->out_fault_fd = fdno;
 
 	rc = iommufd_ucmd_respond(ucmd, sizeof(*cmd));
 	if (rc)
 		goto out_put_fdno;
-	iommufd_object_finalize(ucmd->ictx, &fault->obj);
+	iommufd_object_finalize(ucmd->ictx, &fault->common.obj);
 
-	fd_install(fdno, fault->filep);
+	fd_install(fdno, fault->common.filep);
 
 	return 0;
 out_put_fdno:
 	put_unused_fd(fdno);
-	fput(fault->filep);
+	fput(fault->common.filep);
 out_abort:
-	iommufd_object_abort_and_destroy(ucmd->ictx, &fault->obj);
+	iommufd_object_abort_and_destroy(ucmd->ictx, &fault->common.obj);
 
 	return rc;
 }
diff --git a/drivers/iommu/iommufd/hw_pagetable.c b/drivers/iommu/iommufd/hw_pagetable.c
index ce03c3804651..12a576f1f13d 100644
--- a/drivers/iommu/iommufd/hw_pagetable.c
+++ b/drivers/iommu/iommufd/hw_pagetable.c
@@ -14,7 +14,7 @@ static void __iommufd_hwpt_destroy(struct iommufd_hw_pagetable *hwpt)
 		iommu_domain_free(hwpt->domain);
 
 	if (hwpt->fault)
-		refcount_dec(&hwpt->fault->obj.users);
+		refcount_dec(&hwpt->fault->common.obj.users);
 }
 
 void iommufd_hwpt_paging_destroy(struct iommufd_object *obj)
@@ -403,8 +403,8 @@ int iommufd_hwpt_alloc(struct iommufd_ucmd *ucmd)
 		hwpt->fault = fault;
 		hwpt->domain->iopf_handler = iommufd_fault_iopf_handler;
 		hwpt->domain->fault_data = hwpt;
-		refcount_inc(&fault->obj.users);
-		iommufd_put_object(ucmd->ictx, &fault->obj);
+		refcount_inc(&fault->common.obj.users);
+		iommufd_put_object(ucmd->ictx, &fault->common.obj);
 	}
 
 	cmd->out_hwpt_id = hwpt->obj.id;
-- 
2.43.0


