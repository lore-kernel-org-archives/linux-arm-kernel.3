Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22306E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 19:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BSzLz/NB8iZRVakyD8hxE+7xE/j2B7OiQveGEuYl71E=; b=NOYCehxyCBjLI6u3MTDVEmH5Gl
	BghCOl08UUpuCFUYawCY3O/lW0Sr6Wlk9zz7F0cYJ41tlClLTylti1jeeTjho3CwnTzadCAyfHKiO
	Rpe/s+1ib67ri/V1JsT+6QtRbi9XmoxENYJzd27kxkTsCw4XhQc3pfaxaqn7IcfNSjJ2aPUkv7wcB
	nbQH5Nds+Eh6lhQTaR5nLAfcSddcZ8DOSxLUKK52VhuG0p3831Zp74U1fbUaAbmw44UkyMAy/Hd0y
	mnugb0Hdw6VL1cSa4VZcZIj7MxTcxV8yuN60LSFjPRqAG5WLBsMpbOwgDXXeXGcwh+ZBJod6Pw9nx
	m1jv7CvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTnfb-0000000DsNm-3J3R;
	Fri, 03 Jan 2025 19:49:19 +0000
Received: from mail-co1nam11on20627.outbound.protection.outlook.com ([2a01:111:f403:2416::627] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTnb5-0000000DqV5-25Bg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 19:44:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jb3/fy+1hD67pdHD1ToRkzVoDgd1BxKTlVzi07bdjujsRe08yP9Z5pjmDXxwekwyeRTCTrJtSkWNrA7l6QgjAsL4eqRB3RRAI4xAGyFMpgWeA0IZfVrf9o6Y3plRPWDIt8daCGA73l2+p/m7skGXkPH14k+k04tpfQVUUKyczsaBlux9aT9g8c5tcBlQoQBkHMfYUOoVwe/1l8HYDmFopQx9JkuaAvM13ukbo+hGyQ5j5MY2mlZRyTcldI6AQbmWnHPD8hN/scFAd1mpnSFIHfkEfVNzfNzR43Lid0htZOB6LCdt1NDTS6U4a4w0UKLu4tA+hPUq90mGMSaPFQdT/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BSzLz/NB8iZRVakyD8hxE+7xE/j2B7OiQveGEuYl71E=;
 b=bXIL017CHYM6IcvBxqN5tiYeOttQGFs6brajKJ+DZxYArRlAg+Ovu5Va8G+E0ksAAQ4aLpknMPK2I7CRq+F4lqYOoRAlcZnMNnKHLDGEdYsdQpuaVAF/LSsEavMcqyNfAXE0oRZax5l0Dn33EPaTFNYsHAzdszHTufn5VFSqdpUDgvcvXZ4lkBB8S5EsUJfIuQ1k5y8higSf3AB/+8gR8MlUkbsuAMQICdV1YXc2i1HiBpNzsy+0jIwciO4v8aU9tpFTrWzuxH3TFTZH0lgp5e0XnMfCaDRlVl08oR7Czsd6Hg5Je4Zvi4UAYcdmlpwKsdkJdY8DazeQpJ652ZRTCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSzLz/NB8iZRVakyD8hxE+7xE/j2B7OiQveGEuYl71E=;
 b=ZbtIBhi+FDHavAOk7vrwGc5ii+9mPZCq9CsZU5g3slbHqxb2bstLdV+nlKstBE1XvqIMb4bJT02lUxnCY+hTtZk6h5RjiLa72B1m3caHYiZcQu5tCa9xllZBiWptNzBmfFgfsvr3yw1IfxZGX+e2+nadjwEQBDbxYgwIgR/UlznLuON9dEeU7sKq2lzk9xeRmHm8HGylyIWIyBglu0W+NPCK27bvzHIcmsdneFrmQm8McAtwqA5xMiJrg4UKqBNko/vgt8yc4rx/oAJP1QfnRRCwyuBAo8yAKjD9Fxzkkb7zTWR7esQAYrhxTRCUZEnvw2z4FDBqNyp+uTJm66b/pA==
Received: from BN6PR17CA0046.namprd17.prod.outlook.com (2603:10b6:405:75::35)
 by IA0PR12MB8839.namprd12.prod.outlook.com (2603:10b6:208:493::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.14; Fri, 3 Jan
 2025 19:44:23 +0000
Received: from BN3PEPF0000B06F.namprd21.prod.outlook.com
 (2603:10b6:405:75:cafe::e4) by BN6PR17CA0046.outlook.office365.com
 (2603:10b6:405:75::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.15 via Frontend Transport; Fri,
 3 Jan 2025 19:44:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B06F.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.0 via Frontend Transport; Fri, 3 Jan 2025 19:44:22 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 3 Jan 2025
 11:44:04 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 3 Jan 2025
 11:44:04 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 3 Jan 2025 11:44:01 -0800
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
Subject: [PATCH v4 02/14] iommufd/fault: Add an iommufd_fault_init() helper
Date: Fri, 3 Jan 2025 11:43:25 -0800
Message-ID: <f01c9eb88608f349a31756eb975e24d300796759.1735933254.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1735933254.git.nicolinc@nvidia.com>
References: <cover.1735933254.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06F:EE_|IA0PR12MB8839:EE_
X-MS-Office365-Filtering-Correlation-Id: 51b44f74-e94e-4f6b-92bc-08dd2c2f05da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kUsqUrljVugUPui8ChmRUxNTd9w6FDwewGveKcRhoEAiKaQB84SShfAyy0qW?=
 =?us-ascii?Q?GIgoJURa/GkpXycl4HsmsYi6w5ySUgs834JLonH0UMduluOAGD/YZPJEWj5R?=
 =?us-ascii?Q?i5mWE02+sbDD+k67eEn315qQqEac2SZCiZIZxRduQBB0H4iV8cuLWgH3iBvb?=
 =?us-ascii?Q?qtJKcBc9HqqtmfxUjP7k/dUf5eHjCaTnnjjAxLLQoyysE+MlebTH2s/1kr+8?=
 =?us-ascii?Q?0iQ+KBIqbaDBKOUsu3VPh9bzfGivhnXp/1C5Lhy96XIFZRkW5IyzsIoYLQFp?=
 =?us-ascii?Q?J9x72DD31YInodByT3rkkg3kaJe7du7zil7Uwd9GxJExTE0f2T8YSjacMGvW?=
 =?us-ascii?Q?+lNSphP4PYe19kq7dghHxgAmt2VLC56P4576jSunl7mlY8xI1fxgV6d7bTH/?=
 =?us-ascii?Q?AFbhvokrFOGDxuiZWUH6G/lKdmjWp/MlDAtEBQG0QFa/9KO0YyTZl0IA3IBU?=
 =?us-ascii?Q?/7hi/+CYZ3p6+eBE6wuqu2bIYJll0lM2PIizR0Do7O3kpK3ORYY1agvPFhQO?=
 =?us-ascii?Q?GbcCfP4JFWQAyqi2UwKc9SnsdT0Dvqe6AsS01bYVAUm4IDjTsz3NnppB8o4U?=
 =?us-ascii?Q?FXqiW/MQAntzZsDvVP2kwrlqNrligyraUbbHvGFF5wyM/zfhzikVf9aBeV5G?=
 =?us-ascii?Q?+u7HPX2rsNcfizVIkzu0QewcgKlKZSrq91hXLK7ojIWTj7weCoF1HMhUoyan?=
 =?us-ascii?Q?cVUwpV6vUzg2MEuSB/C2d0u/CuTeHeDUiYqc1YiEaFVXVJ4As4UtnpVJkLwv?=
 =?us-ascii?Q?9nCkrUnVAmwYf92KvUPxWa/0sCxpz0DqdgqMeq5y7kn6+DDP3r+w4EFzH4tR?=
 =?us-ascii?Q?1hlYCHjfuVrSM8/2c/PP5Kkaz3QOOZNCVE0PKnbJc924IfVo7PTim+urEj5C?=
 =?us-ascii?Q?DfUEMIGAdC8nE6omk3NEvFhq59m6MYvioaE5KapkdDZHxmBZWQMWVizcwote?=
 =?us-ascii?Q?VNHkhlnr84+83yOp8wWz8uoPa1mLNYiH6BO2Ogg+gVN6pB0BHj974bwmU2Gh?=
 =?us-ascii?Q?+rSa2BpyLZo4Ni5RiwVNFBrdlT1lQWM4oeGV0OR+N94B7pGUtdUXRAF4bO3n?=
 =?us-ascii?Q?DoN37Dj7ctntOPq6oDY8FCHhns5+5mPsuIBEL0BiiW951Q1gRbcYIRbL5D2f?=
 =?us-ascii?Q?GbhR8RLSOyu+GFA/eNBEqmVxdezTWmy1oGyjpQHaBYbGS6BgvklGtGgdOLAF?=
 =?us-ascii?Q?pzsre3AFQCztikFhQg88k3n4yREn51ExWF4veAJTkUHgVaH7VwObplwgCvGJ?=
 =?us-ascii?Q?SOPDyKfg+6rHkxMA1jWK6Z7IdTiAl4+EGBnrYXDYpxEQXI/+53rI4YVFD8Hp?=
 =?us-ascii?Q?7nizqdcxQ9p0hFu1v1Nf48CAPD8IwwV5zkCrMmwCbhWQcoedcsf2IE3FvJtC?=
 =?us-ascii?Q?FkD6eo/BItTvS0pZrMso6AtpxIdHPcmPAJvhx28VCgq0ks0GFG4MkQN1I9mm?=
 =?us-ascii?Q?pYamgvQ4YLo5LDqX2pB6jh0UDvYmKgyswPER7oT8RZI6kcuEo3rtuNO2aXML?=
 =?us-ascii?Q?7KJvLm/7Y/TicmY=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 19:44:22.7899
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51b44f74-e94e-4f6b-92bc-08dd2c2f05da
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8839
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_114439_537903_46E8100A 
X-CRM114-Status: GOOD (  15.30  )
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

The infrastructure of a fault object will be shared with a new vEVENTQ
object in a following change. Add a helper for a vEVENTQ allocator to
call it too.

Reorder the iommufd_ctx_get and refcount_inc, to keep them symmetrical
with the iommufd_fault_fops_release().

Since the new vEVENTQ doesn't need "response", leave the xa_init_flags
in its original location.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommufd/fault.c | 48 ++++++++++++++++++++---------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/iommu/iommufd/fault.c b/drivers/iommu/iommufd/fault.c
index 1fe804e28a86..1d1095fc8224 100644
--- a/drivers/iommu/iommufd/fault.c
+++ b/drivers/iommu/iommufd/fault.c
@@ -367,11 +367,35 @@ static const struct file_operations iommufd_fault_fops = {
 	.release	= iommufd_fault_fops_release,
 };
 
+static int iommufd_fault_init(struct iommufd_fault *fault, char *name,
+			      struct iommufd_ctx *ictx)
+{
+	struct file *filep;
+	int fdno;
+
+	mutex_init(&fault->mutex);
+	INIT_LIST_HEAD(&fault->deliver);
+	init_waitqueue_head(&fault->wait_queue);
+
+	filep = anon_inode_getfile(name, &iommufd_fault_fops, fault, O_RDWR);
+	if (IS_ERR(filep))
+		return PTR_ERR(filep);
+
+	fault->ictx = ictx;
+	iommufd_ctx_get(fault->ictx);
+	fault->filep = filep;
+	refcount_inc(&fault->obj.users);
+
+	fdno = get_unused_fd_flags(O_CLOEXEC);
+	if (fdno < 0)
+		fput(filep);
+	return fdno;
+}
+
 int iommufd_fault_alloc(struct iommufd_ucmd *ucmd)
 {
 	struct iommu_fault_alloc *cmd = ucmd->cmd;
 	struct iommufd_fault *fault;
-	struct file *filep;
 	int fdno;
 	int rc;
 
@@ -382,27 +406,12 @@ int iommufd_fault_alloc(struct iommufd_ucmd *ucmd)
 	if (IS_ERR(fault))
 		return PTR_ERR(fault);
 
-	fault->ictx = ucmd->ictx;
-	INIT_LIST_HEAD(&fault->deliver);
 	xa_init_flags(&fault->response, XA_FLAGS_ALLOC1);
-	mutex_init(&fault->mutex);
-	init_waitqueue_head(&fault->wait_queue);
-
-	filep = anon_inode_getfile("[iommufd-pgfault]", &iommufd_fault_fops,
-				   fault, O_RDWR);
-	if (IS_ERR(filep)) {
-		rc = PTR_ERR(filep);
-		goto out_abort;
-	}
 
-	refcount_inc(&fault->obj.users);
-	iommufd_ctx_get(fault->ictx);
-	fault->filep = filep;
-
-	fdno = get_unused_fd_flags(O_CLOEXEC);
+	fdno = iommufd_fault_init(fault, "[iommufd-pgfault]", ucmd->ictx);
 	if (fdno < 0) {
 		rc = fdno;
-		goto out_fput;
+		goto out_abort;
 	}
 
 	cmd->out_fault_id = fault->obj.id;
@@ -418,8 +427,7 @@ int iommufd_fault_alloc(struct iommufd_ucmd *ucmd)
 	return 0;
 out_put_fdno:
 	put_unused_fd(fdno);
-out_fput:
-	fput(filep);
+	fput(fault->filep);
 out_abort:
 	iommufd_object_abort_and_destroy(ucmd->ictx, &fault->obj);
 
-- 
2.43.0


