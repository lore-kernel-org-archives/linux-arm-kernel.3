Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1CAFC71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 23:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/3PczYBmJcOG0C3ARaiFDhHj/pmMtg2pIU2S5RNJPv4=; b=AMKgJamiHMY8O/ZCOS8bN9oEuu
	qJcirOpZ56VQDy7VfDwr5TkuXMOuvMDdFoJnnwWVN/H6qs6b361Uo2zdTL+z4BClEX1/UCdHewUf7
	y+tvj0WInDqxZ1LaOQ/xcCrZx6uI1t9zY/eNMFprPbbRj/h0IEirS0TSf+vomPapvWpGFQoFxGK0p
	JyLb1yULmMObvxykyYzS3cPT1MhlVhOugwNN0/oKRTKybKiu1R9hBTac+8mSQ5Q9w36XRt4FFqNaU
	X0yqDNQTA1B3SRGSGc9hv0f5JCPlpIx+A+/IHVe9bmegX/0Na97rqjnDIlvwbK5a3cuG0k5jj2g6k
	wfN3zT8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQE03-00000000KMh-3qUO;
	Fri, 13 Jun 2025 23:39:55 +0000
Received: from mail-bn8nam04on2062c.outbound.protection.outlook.com ([2a01:111:f403:2408::62c] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQDxt-00000000KFZ-25Oq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 23:37:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=di+DSFzZzX+h1xh5aQzXrz1cWtE0KuOOcnMoaPcDqfFAwbZZf7MFK2zT6BhadqSnf7rpecVGTkrp5Lj5kV5KrhKqoRzZ05DON2Fma0D5MIZ+qgZc5+rqM1R2mZe6bWWXjeXH8+cF/S7iGxvMCJDTfKRPzqjplxn75VolV633bt5KSrsLQJ67y4V1P8zkUe9fkxIYKPmmNzAh53Ko4aGgY49umgOs+7sIZxLyVKUOOBkD7CPQEZIVRpdsPmJiFe/pO/XZ4TpiNYfVs3H2PwHkCVO3GqY87La0+vLHKvSQhFCayIHEck2qwFCRaETc4Cv6dykps/KrsKAvvaS4BN5a4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/3PczYBmJcOG0C3ARaiFDhHj/pmMtg2pIU2S5RNJPv4=;
 b=GNMugmuiaIHEXpy/FO83uCjrcZzCULvlSofFKcAFJKtEIOMUzFCMc8r3NPXV/y8L8exT/+A27IMcuNgpZ7qOlMlx5MvLSumXNa5KXeqRhDuzNlL2uD2KauiM8Fro/odn5wBDmprnyEo9Vkl8ZDYtDbGHYrMAHRx0bVt1Y+iZSTWdgyVnirnBJqAY5HHgH4uqc2JtadkwokQOSYlUizfv4oDRWc93zwEpIDqRXG8A3p7QKaz+sihwMz6qgVnV9WtMuofibNq3537JYppnwGMUCAOw3Jc6uwbAFBLnpLGVj2CLZelYQvF8xNmxmGJeDcJm/xSUW/KX04AFVtKsb7gMaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3PczYBmJcOG0C3ARaiFDhHj/pmMtg2pIU2S5RNJPv4=;
 b=fYBGUucEY5cRgNfCmFJMzIirtgLisVNYyl84ZJOypJBv6+kk1e5vFWzf4YK5aRey+0gcWEKcB3xEa5Axb7bJ+0BrMxwq1IGuz6OSVS1Vfij63zbJhaIEp2QJ8IdsWNNHXFQT6V/G8nZE8J+MUFeAZ+1+KuKOQ/FynpFwiMQVQMlsXDGGPBk3syF9fn40yQOXYMimcgaMXkWNeM76bYC69lx5L4wd6XEZgpi9vPrvgI1cIipnGD8MmS2tKicRmhqrH2Qj583LzSTe8S33NWAW/jd/iI+wVNdqj7GYs7/hVSZqH4p5WyUNLRp+QE/9Q+r69PAj+lUqGamnpXTD+Zarzw==
Received: from BL1PR13CA0369.namprd13.prod.outlook.com (2603:10b6:208:2c0::14)
 by DM4PR12MB6133.namprd12.prod.outlook.com (2603:10b6:8:ae::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.33; Fri, 13 Jun 2025 23:37:32 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:208:2c0:cafe::d1) by BL1PR13CA0369.outlook.office365.com
 (2603:10b6:208:2c0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Fri,
 13 Jun 2025 23:37:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 23:37:32 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 13 Jun
 2025 16:37:11 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 13 Jun
 2025 16:37:11 -0700
Received: from nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Fri, 13 Jun 2025 16:37:07 -0700
Date: Fri, 13 Jun 2025 16:37:05 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <kevin.tian@intel.com>, <will@kernel.org>, <robin.murphy@arm.com>,
	<joro@8bytes.org>, <ddutile@redhat.com>, <yi.l.liu@intel.com>,
	<peterz@infradead.org>, <jsnitsel@redhat.com>, <praan@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <patches@lists.linux.dev>,
	<baolu.lu@linux.intel.com>
Subject: Re: [PATCH v1 06/12] iommufd/selftest: Implement
 mock_get_viommu_size and mock_viommu_init
Message-ID: <aEy2IYL5XTbR54Z3@nvidia.com>
References: <cover.1749488870.git.nicolinc@nvidia.com>
 <5880f4d754b2b7a7c4bc8664a5b954821c73aab7.1749488870.git.nicolinc@nvidia.com>
 <20250613134522.GE1174925@nvidia.com>
 <aEyH1YPkmW1gy2da@nvidia.com>
 <20250613232318.GP1174925@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250613232318.GP1174925@nvidia.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|DM4PR12MB6133:EE_
X-MS-Office365-Filtering-Correlation-Id: 73e4a9f9-c4d5-4afb-1e16-08ddaad344b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WRGiAmlvddkgi+zdNBYmn7jNn0xU+g9MBiP7pb5Xj3m7wE2+zQ6EvAzOif07?=
 =?us-ascii?Q?Qs0vD0PlH/qBSMX9g5O+cL6f3YresPpOKWcHlOvjD+SFAHMewdez0eB2WsJ6?=
 =?us-ascii?Q?XY87NjGAhakL3oIU8PzfOf2siOKMPzXoYTta/MgFwkUSJNSzYkr7XNOTbdrv?=
 =?us-ascii?Q?llS8woaDTApcN2aTNQggoNp4CeZRt3rQnmawVoxXnzKu+mjTRqsnndlv9KVM?=
 =?us-ascii?Q?0HMXY5eXheJpkif4r/uQ36555JATrcTrYnusnaQu/jlqwoJTIq662heVvwgj?=
 =?us-ascii?Q?lXUxCWr616YoMA5HcthIcB6XUyhMJKPcmzdyDEuM4DbKhXpszovSd6+MrwYj?=
 =?us-ascii?Q?oaxaY7d4oyZ5gQKfa3rZozpje3kkCHkqvJj/4R8LxFkwKFVsTGia8hL/pGin?=
 =?us-ascii?Q?eT1ZyM5sFx27txTBWPyixBGE0evVZi68BqHaubsqvZespcI5Y0XYMa3JK+qe?=
 =?us-ascii?Q?+BEm7S2rvu0Ay8wGKdmR3N6+nTqNpeCAil2t3+p3p35R/ZORQdxuF9X3xdyT?=
 =?us-ascii?Q?SjIzge819Vg0FncYkVJCfp6J0FPWnLOKTuyp3kZ3XmWeFvM4Oo/OzUqZs5jC?=
 =?us-ascii?Q?cNtRellh1QQ/Wou1uLkCRhBHfEQzKDxn+dCO6uWB0OmIAIJhRN7dA5B5RIQD?=
 =?us-ascii?Q?7bVtYX/tH7lFPSxdRoswdAU7ol+hzWU0QCm3z6Xao8K9IFdO/69EUQD2hWBT?=
 =?us-ascii?Q?Y4FPk0BUE8EnRZ3qN4leZKuoXEzsS0npepFR8Hk1zEXinBj4hNVXQZt/HDB3?=
 =?us-ascii?Q?ZWJ78GpXOZYZOtyPOpzAM3T88FUVySkxlVTuDLZ0chf5LwPwSI1PuBQK7JbR?=
 =?us-ascii?Q?6Rzjru+nKPmrTc2py2RU+Ep9PhWUsKc/lKgoFoe0Z7iZP24X51sb0m+/1hp6?=
 =?us-ascii?Q?DOZjGbDfzPwpHTXi/atjbfMkAaOPr/QSguZgeOmqNkE+xc68owfY1kcysIlW?=
 =?us-ascii?Q?9+lcfKXoGYjLWZwTia+01ngEEhShmUW9PZwPULWD3qBJBo0cuXX7aQt0JJm0?=
 =?us-ascii?Q?jXdZ+AHgvaE3So99Ur8JcNSYRNOXpWrFMOsAkDP5fIxYAcQAABjRbk4n/udD?=
 =?us-ascii?Q?IeLZvGrUB3Kl2drC+b1dUz05h9PqfXVVbdpHcSeFSlYWJuejToYlOrrhYBB4?=
 =?us-ascii?Q?JLCkeTGpwyliYMryKmHKpUXPRnSUIClvy+4BzVaV0diiHiWpIpTwYmQDbdcm?=
 =?us-ascii?Q?J43KX+F/JEooGLgWplFiUOvciB3a/Airy/DSdDeBw/26rR+TuSGHhvA+AtQt?=
 =?us-ascii?Q?xlECe7ZFc6PGyQeMQfHHIK8L11qSnC/f6j5fBE/sUdZc/zzr5VOT8eHnNSQ7?=
 =?us-ascii?Q?QuM4LHgbzjDsHy4PuNxhL0sO6tzfkFhyluMLYjpnQrQeO8LIkEUIhGxq/bhO?=
 =?us-ascii?Q?MEWPCLdXoXpgvpubFwd7Yo8Xq0edXXKhlHr6c2ceRYbDq2DIZSU5T/gX0POM?=
 =?us-ascii?Q?GXjVVEPT8eIjyqBBG4k3QNqGtwFYeM1u9C8Tcr3qc3sHJ1Sx8XLwRp5LwkOT?=
 =?us-ascii?Q?bh0naXs5XEoip2Rh5aHbrvpz2ktpvHBxIU/7?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 23:37:32.1595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73e4a9f9-c4d5-4afb-1e16-08ddaad344b0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_163741_529641_B5BFD1E3 
X-CRM114-Status: GOOD (  19.25  )
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

On Fri, Jun 13, 2025 at 08:23:18PM -0300, Jason Gunthorpe wrote:
> On Fri, Jun 13, 2025 at 01:19:33PM -0700, Nicolin Chen wrote:
> > > The patches will read better if you add the call logic for init along
> > > side alloc based on init or alloc ops being non-NULL in the prior
> > > patch and then have these driver patches replace alloc with init.
> > > 
> > > Duplicating alloc into init and leaving both makes the patch harder to
> > > check.
> > 
> > I see. That will add an additional patch tentatively supporting
> > both ops.
> 
> An additional patch is not needed, just add calls to the ops in the
> same patch where you add the ops.

I have a long writing in that iommu ops patch, as Don requested
per an offline email. So separating them would be a bit cleaner.

Yet, I am merging two cleanup patches (viommu.c + iommu.h):

iommu: Introduce get_viommu_size and viommu_init ops
iommufd/viommu: Support get_viommu_size and viommu_init ops
iommufd/selftest: Drop parent domain from mock_iommu_domain_nested
iommufd/selftest: Replace mock_viommu_alloc with mock_viommu_init
iommu/arm-smmu-v3: Replace arm_vsmmu_alloc with arm_vsmmu_init
iommu: Deprecate viommu_alloc op

Net-net will be the same. And the driver patch has viommu_alloc
and viommu_init parts side by side.

> Then the patch that removes the old ops removes the extra logic
> deciding which set to call. This is the preferred way to do driver
> conversions.

Yes. I made a very small diff in the last patch:

@@ -33,8 +33,6 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)

        ops = dev_iommu_ops(idev->dev);
        if (!ops->get_viommu_size || !ops->viommu_init) {
-               if (ops->viommu_alloc)
-                       goto get_hwpt_paging;
                rc = -EOPNOTSUPP;
                goto out_put_idev;
        }
@@ -54,7 +52,6 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
                goto out_put_idev;
        }

-get_hwpt_paging:
        hwpt_paging = iommufd_get_hwpt_paging(ucmd, cmd->hwpt_id);
        if (IS_ERR(hwpt_paging)) {
                rc = PTR_ERR(hwpt_paging);
@@ -66,13 +63,8 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
                goto out_put_hwpt;
        }

-       if (!ops->viommu_init)
-               viommu = ops->viommu_alloc(idev->dev,
-                                          hwpt_paging->common.domain,
-                                          ucmd->ictx, cmd->type);
-       else
-               viommu = (struct iommufd_viommu *)_iommufd_object_alloc(
-                       ucmd->ictx, viommu_size, IOMMUFD_OBJ_VIOMMU);
+       viommu = (struct iommufd_viommu *)_iommufd_object_alloc(
+               ucmd->ictx, viommu_size, IOMMUFD_OBJ_VIOMMU);
        if (IS_ERR(viommu)) {
                rc = PTR_ERR(viommu);
                goto out_put_hwpt;

Thanks!
Nicolin

