Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C577E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 04:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fVL5hSGO1ra7UzZk8atXqHqk9OeKFHrRojmk7O/XoAE=; b=KyOkS9dcLqfNaHX8oa9OWG4MBx
	prz4V6N0rqRdUjDz0GquKeh121E1EGP8djcHCH1pwGUPL/k1M5yAUpUsbb4c1pfl43X1I9T8NvRX3
	K0obu5plEzKUyqMz5mBZI2zMF6MuSVKhiiJ916ll0faNismUpxvm2c7YASm5q/EmZk+1fo6SB6Wj/
	6v+rkzJ8+jBdMGHQaimvhHwuPBtSuQU4iB6STjp4zRB26YuYaPQSNHPEY5/5DzTjq4wdeG4s1M4e4
	v4syfwuIya25xyLiDm8VJaU1carL7av/MaP37wBItPw1KncMNH4tAuwGpeInwpmbaqaEhXVjhNaPC
	ebTVYI4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV1MX-00000003UTc-1i58;
	Tue, 07 Jan 2025 04:38:41 +0000
Received: from mail-bn8nam12on2062e.outbound.protection.outlook.com ([2a01:111:f403:2418::62e] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV1LH-00000003UNF-2458
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 04:37:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y+4gsjxafwS3BSTGLb3F3C+ts6Ul7AQSoMAD//ccYPk4geOPVQ+xlAjVPIJ5yBaovbrLJFnDS0WP3YYRe1SGjy3nds2g2tFPNAN+/FO9qQUEr9D7yQebqgXFQrBx/R7Qn9/uf+adS1cDl+CxXxoS6NwDXLl5jOY8Ceb3O/cSvRm/mo34pUlIwgVwyBKiMoaCnGRODDH4tWl+4af5bF/XCztzVsyQSNTuu1cx2Urd+ILIa2YlFymKZWb6rkeIGEIlExq60vdB/Abq6gdrfZY48jelWP3+3Wfj9EHqZKI0B/WhtNNkiciN8ngWPiyK+RBffC/H+2E9+sZAeP+bwI9mqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fVL5hSGO1ra7UzZk8atXqHqk9OeKFHrRojmk7O/XoAE=;
 b=ljUq57kiiyVpxOdT4T5nlq3egJZEnmT4ciywv5X1sZzSvomsv56wslFSUErjKMj+Kszq+TpQPH+SkAL7ZTPH9nT7wyAj+hJAvr5MvUlc6FB0jUqur9JU9vc7JnE1nZdahRXcY9wmpgSXhJXFGsG19JfcwNHJycP9z54KeulPJoRRxki3yYNNLACHWdpI0SoOSTzgY+oUFzN2+p0ZoGeTsGLHmSWQUdSSD7UkUml7LcGHsQhpgFLaeCvl+1fKObHB7XuSX6stYdYHZdpfxe6E035xx9iSKNBuYhDkc7HEVJRsWZZi+4d8q9hm0i0qLGDpcWt/eKds+N9wzde9pBy+hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fVL5hSGO1ra7UzZk8atXqHqk9OeKFHrRojmk7O/XoAE=;
 b=KhpW0GQcPlK5Q7m4kcZH5YPeupVdIRmNos+hvrld8FaVJ7FXbL+FDB03vUmw7+coTNf/bFDRq/MFhL+q1UGZ29rD3Vmv2rvTdeV26camGQwABIRPq+5SwQ71hT0sOl0hcrq2b8IdAsvtfKkDXKQluO2fwaRMGaRHVL/90jRtLqZFVgqQFM4+PSOmIEdzpXTiHwo5CNtCdy9Kjqn3PhA+JkQrJ3uoyJ2TVPwiptzYtZ7ve8c9uITOuB9eDKr69WhsZPHnAP1ZOq9SCDxEuzISsF4/4XudqCHRYJjoZ2QTFoDbCtG4fXI2XIP+jam534te7qwe/JeWuyk0bUDu1YvsHg==
Received: from CH0PR03CA0400.namprd03.prod.outlook.com (2603:10b6:610:11b::20)
 by PH7PR12MB8793.namprd12.prod.outlook.com (2603:10b6:510:27a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 04:37:10 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::ff) by CH0PR03CA0400.outlook.office365.com
 (2603:10b6:610:11b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.17 via Frontend Transport; Tue,
 7 Jan 2025 04:37:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Tue, 7 Jan 2025 04:37:09 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 6 Jan 2025
 20:36:57 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 6 Jan 2025 20:36:57 -0800
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4 via Frontend
 Transport; Mon, 6 Jan 2025 20:36:55 -0800
Date: Mon, 6 Jan 2025 20:36:54 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
CC: <jgg@nvidia.com>, <kevin.tian@intel.com>, <corbet@lwn.net>,
	<will@kernel.org>, <joro@8bytes.org>, <suravee.suthikulpanit@amd.com>,
	<robin.murphy@arm.com>, <dwmw2@infradead.org>, <shuah@kernel.org>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <eric.auger@redhat.com>,
	<jean-philippe@linaro.org>, <mdf@kernel.org>, <mshavit@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <smostafa@google.com>,
	<ddutile@redhat.com>, <yi.l.liu@intel.com>, <patches@lists.linux.dev>
Subject: Re: [PATCH v4 14/14] iommu/arm-smmu-v3: Report events that belong to
 devices attached to vIOMMU
Message-ID: <Z3yvZsq77bpnaoAb@Asurada-Nvidia>
References: <cover.1735933254.git.nicolinc@nvidia.com>
 <69a46c72e43ed086840be462eef731167d90a9d8.1735933254.git.nicolinc@nvidia.com>
 <585fc99f-c2dc-459c-929a-c7c7631b9caf@linux.intel.com>
 <Z3wk9TvmUhB3/zlk@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z3wk9TvmUhB3/zlk@Asurada-Nvidia>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000099:EE_|PH7PR12MB8793:EE_
X-MS-Office365-Filtering-Correlation-Id: ad0f60b0-07f1-44c3-778a-08dd2ed4f2c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9JNA6DWLHZdW96ES7nTcqIqH1XAq8NORU/MasGwao8IRml1EXsSdeMsQ9cXE?=
 =?us-ascii?Q?SSCpdTWx/CdNwqZjY/AQ4cyC1QKwQxDgACsaplSKSGMi6aGtZYqftFYmlOvL?=
 =?us-ascii?Q?Ny4T+WIMiPV4PvPTHWsU750URwbQ1bS+3f1XWV/JzXFAXLfxcvNc/lYTDwBZ?=
 =?us-ascii?Q?NlIEyqd/HMupTg4T4xnpL8/dXUrt3oRxHfNvWHXbFjua6YaQgNmIREihmD9l?=
 =?us-ascii?Q?MAUZiX8y9yp6QOq4INZeJ60jgiuX7hGjiGiZg9OsV9r8aBsNgtlw4U7CWztm?=
 =?us-ascii?Q?+sYda3+j7KhCVXMSc6X57zL3fbUcx2sr+jZs2WsAb4JQIl3VkryKTUVE+BUM?=
 =?us-ascii?Q?iqUcsA5jAHXjXXakHOFgaBIdAVeLgA4IN7P1J3Qc5mykRFED5oEBFzvC8GZ8?=
 =?us-ascii?Q?6pGZ7cGR4FpwPHL6EFZJhr9F7BPpJV1jLgLkFrPrOMT+ZojhPSR3QV42JQqO?=
 =?us-ascii?Q?E4CNW1zDWc1qesQwS+K3qr9deMsLZfx8ITNPzy7+4Jdr+usBQqnE4K2BsVqo?=
 =?us-ascii?Q?Sn49g/Ysf9LBZZEqtezEpyLFQYCqYICf6mZBYDOIbqCy1v/3+6IfL806HGe/?=
 =?us-ascii?Q?kMJBwDyxczazdBDIoYvZvdX+jotX8t1LsPMdH+LLu/9lK8+rCVpDECrVoIdI?=
 =?us-ascii?Q?7fX5SFLTvlKOfgApF/4qblG0gzpBZXUTbxG15j2TYUG3iwt1wIGSkRoHUKFc?=
 =?us-ascii?Q?7xNOSKDYCDUGMT6GXpYNBxiSZ/RAJdkqukn7ordARzKyTPrYFnUlXEmKO04o?=
 =?us-ascii?Q?MYpd1Iq7ezflxG1l9BNEb1oK0z67ft+TmLHHzx8O3jD5wSfDVNMB8DIVKjPT?=
 =?us-ascii?Q?E4azV90aAprXBA5TL37E3KSCq1UM/MCf8e/qHmucORwMQwuGkToy/jtBPRy4?=
 =?us-ascii?Q?lLgH7hXH4jbzjFuKySyXEQzWbtI6NXxa065jg/gZBr6W1nsBF+Hqq/MnYBYH?=
 =?us-ascii?Q?24gpkdWBgoVHYLNiVpx5l/al8fxg2/ytODH/MWu+JfzibDk2PnifmAPsEqMG?=
 =?us-ascii?Q?kwtRtFJLejZtIX024dxiGKoHhfY2fqleYn9p8uNYpSSEveEYDxJzCcumWXDJ?=
 =?us-ascii?Q?8JwJYwBQGJpfEgLGO1mA1N3JA8JJRaAI68ITlURXadRrqoxquNvskHIE4W3y?=
 =?us-ascii?Q?bc4WT+Fyvpdq/nsOoq9QC3wqyLXoG2jJU10Qh1PlsuZ+/+nKDW9cUqUkTFbj?=
 =?us-ascii?Q?6LVFGj0vylK6FoVYmIyQo+9QdEQM3rKveL5d3X0aRNQ3zFA5rlnoffBKQM0v?=
 =?us-ascii?Q?L8e1x40oVZprS68+1sHDVsphue1V63hSqWrC5WnM5z6HGRNS/jlO7kkBMJ7i?=
 =?us-ascii?Q?71EhAnVcTGBuFmjBZUnG9mFE8bHY/GVDMjII43ekiNTOZzgECa3dHVCcLaNV?=
 =?us-ascii?Q?pcokYAVZ6PA4pkcmormpV1DJi+N8xoWJOPvqbQnpGuIrhlGbvyhXb2dSX8x5?=
 =?us-ascii?Q?QJSejYsd4c1sv3HrgP+1RcCbVRMiOeO57Q7HITKkbFJZKjjs2U0HqCDKbU1B?=
 =?us-ascii?Q?sT9BWr1iNc+kOgE=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 04:37:09.6134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad0f60b0-07f1-44c3-778a-08dd2ed4f2c4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000099.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8793
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_203723_525616_AA6081BE 
X-CRM114-Status: GOOD (  23.45  )
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

On Mon, Jan 06, 2025 at 10:46:21AM -0800, Nicolin Chen wrote:
> On Mon, Jan 06, 2025 at 11:01:32AM +0800, Baolu Lu wrote:
> > Nit: I think it would be more readable to add a check in the vevent
> > reporting helper.
> > 
> > diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
> > index 77c34f8791ef..ccada0ada5ff 100644
> > --- a/drivers/iommu/iommufd/driver.c
> > +++ b/drivers/iommu/iommufd/driver.c
> > @@ -86,6 +86,9 @@ int iommufd_viommu_report_event(struct iommufd_viommu
> > *viommu,
> >         if (WARN_ON_ONCE(!data_len || !event_data))
> >                 return -EINVAL;
> > 
> > +       if (WARN_ON_ONCE(type != IOMMU_VEVENTQ_TYPE_ARM_SMMUV3))
> > +               return -EINVAL;
> > +
> 
> Hmm, that's a good point I think.
> 
> >         down_read(&viommu->veventqs_rwsem);
> > 
> >         veventq = iommufd_viommu_find_veventq(viommu, type);
> 		    ^
> 		    |
> We actually have been missing a type validation entirely, so the
> type could have been rejected by this function. Perhaps we should
> add a static list of supported types to struct iommufd_viommu_ops
> for drivers to report so that then the core could reject from the
> first place during a vEVENTQ allocation.

I added something like this. Will send a v5.

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
index 0c7a5894ba07..348179f3cf2a 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
@@ -399,9 +399,15 @@ static int arm_vsmmu_cache_invalidate(struct iommufd_viommu *viommu,
 	return ret;
 }
 
+static bool arm_vsmmu_supports_veventq(unsigned int type)
+{
+	return type == IOMMU_VIOMMU_TYPE_ARM_SMMUV3;
+}
+
 static const struct iommufd_viommu_ops arm_vsmmu_ops = {
 	.alloc_domain_nested = arm_vsmmu_alloc_domain_nested,
 	.cache_invalidate = arm_vsmmu_cache_invalidate,
+	.supports_veventq = arm_vsmmu_supports_veventq,
 };
 
 struct iommufd_viommu *arm_vsmmu_alloc(struct device *dev,
diff --git a/drivers/iommu/iommufd/eventq.c b/drivers/iommu/iommufd/eventq.c
index bf0c04f571a7..b5be629f38ed 100644
--- a/drivers/iommu/iommufd/eventq.c
+++ b/drivers/iommu/iommufd/eventq.c
@@ -555,6 +555,11 @@ int iommufd_veventq_alloc(struct iommufd_ucmd *ucmd)
 	viommu = iommufd_get_viommu(ucmd, cmd->viommu_id);
 	if (IS_ERR(viommu))
 		return PTR_ERR(viommu);
+
+	if (!viommu->ops || !viommu->ops->supports_veventq ||
+	    !viommu->ops->supports_veventq(cmd->type))
+		return -EOPNOTSUPP;
+
 	down_write(&viommu->veventqs_rwsem);
 
 	if (iommufd_viommu_find_veventq(viommu, cmd->type)) {
diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index 6b3b46e382f8..55e71dca3664 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -117,6 +117,7 @@ struct iommufd_viommu {
  *                    array->entry_num to report the number of handled requests.
  *                    The data structure of the array entry must be defined in
  *                    include/uapi/linux/iommufd.h
+ * @supports_veventq: Whether the vIOMMU supports a given vEVENTQ type
  */
 struct iommufd_viommu_ops {
 	void (*destroy)(struct iommufd_viommu *viommu);
@@ -125,6 +126,7 @@ struct iommufd_viommu_ops {
 		const struct iommu_user_data *user_data);
 	int (*cache_invalidate)(struct iommufd_viommu *viommu,
 				struct iommu_user_data_array *array);
+	bool (*supports_veventq)(unsigned int type);
 };
 
 #if IS_ENABLED(CONFIG_IOMMUFD)

