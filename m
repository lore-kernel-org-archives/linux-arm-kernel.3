Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215321088E61
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 01:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QzFjDZrweMI6dW+rD2FlckzO0Caj9oUE7ptoKdPUuQ8=; b=nK4uyBLY9N3RWN4oY+csY1cVc6
	nRRsGjj0WTRLdFyQ4tfnaGs/o/8cDZN4+ZxeSQ6ff4LhtN5ijLVTkc5y4+4ZzBbdgdI3JUAf43OQz
	ikRfOlnhyjnCQuJTNgFZnZV5LprX7fPls6PB0H/bM+kfWX7LY6H3fiSJnXY5/gpfbIIzqWdBKCvs1
	nv+RxPGmOVvEUmz9RjzLvk+4SmwMMLunvQ2R5ba82LqNQjcrslfEUFv0rdsRJFxOfVxX6suTpmxfj
	BdiTDp8O1MTdAUGQUuVCa0nRkrUNqg53ahMTWTB0T3EsL7zzwqW41nkoHihRjgAPDdpKNp4pMDhbo
	0LF3AGXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w32ER-00000009b8N-0Uu9;
	Thu, 19 Mar 2026 01:31:27 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w32EM-00000009b7O-46vE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 01:31:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KFjeA6GZwDdgj0w4x6BCAwOcsmOyxqJ5OHncH4WGuLeOorqWGMjfVTWlPUH9qHqcXdcuNxwdXKaICerHwodmkJdtY6hmxekl0DyVWq9Jv/rxTSuJjBDSCe9zSKUuoQoGUGIX5An3ioGfSjalmpcyPfxybdQx7IqJtGeGEAx5qU1gv1/cvQwOklBaVZcsY7o4e9zlIxbjcEIjg/Uoo0j/s7aAujnYRIWgwrqgixjqHzpyA+KiLKvnO/STIHW2TmZGlmxdmKeEJ0H2whfDgCJfTFtQuOhdZkKPPYwWdu/JCdYIG0ZEzZURttFcBNFMcffxGrDHQeFnzjR9zwhYcHfVww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QzFjDZrweMI6dW+rD2FlckzO0Caj9oUE7ptoKdPUuQ8=;
 b=ufakwemdMDHI62E43XJNSSaT8s+N3Nk5JjQWBLQGtBJVaN6ftgXPosDOFF2y0AkQO2zmctwowzx5VJD5gR95NGJYB2vfs6IMwiyvoeY+JBPSi6EGpseEXodcevWXaNUTv/piVwfSn1Gyr/AB3s22s3l0CNg/jMVpWT8/87MHuarnbdkGu/+vYWNT3hmat1hSKL4koNBz2WLhjvTrJxMFYr0jXEOY5b2p6ROQypG1DQAgFLGRHVuZIRlIymeDpRGteFgdx2alGbUqaSe3vZwx93HQuCiRW5LyhyLI2uTgf72MO7TxG7kqYzS+ejrOyJXHDPHKPqUxPHIDrIEu7dWgIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QzFjDZrweMI6dW+rD2FlckzO0Caj9oUE7ptoKdPUuQ8=;
 b=oKJwKlu7GK3ERI//hYhUFt2V2dE3tHirPnafPeqwclOlOmiZyGJ1fglmz6+mill/y58Yu7r5jDexP1RChRxOPt5GgKN6p4qfTBMQjyHVeL9cVc+ryrq6UlJp0I8WvJ9MyFRGx99abSFNumQaQs9j3cKybE5L3+2SiygrH7NViWcVy0hwjbyfO7J+4A1+Y+wusJKBhIXQ5nbTN4nQ3Oszd4WZ3DUDPAvmdf7SrWkj9ijIg6X9gHKAd2jwmsD/qcEn0t+XMRrmsZjOvg/a/si1K3nc6YSKGHPwVqMSi1rBwpW2ILa18QnpsuozPn+mIN9D1pqeVJn+pjP5tz44XIvUDA==
Received: from MW4P221CA0013.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::18)
 by PH7PR12MB6764.namprd12.prod.outlook.com (2603:10b6:510:1ae::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Thu, 19 Mar
 2026 01:31:13 +0000
Received: from MWH0EPF000A6731.namprd04.prod.outlook.com
 (2603:10b6:303:8b:cafe::2d) by MW4P221CA0013.outlook.office365.com
 (2603:10b6:303:8b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Thu,
 19 Mar 2026 01:31:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A6731.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 01:31:13 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 18:30:53 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 18:30:41 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 18:30:40 -0700
Date: Wed, 18 Mar 2026 18:30:38 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
CC: "will@kernel.org" <will@kernel.org>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>, "joro@8bytes.org" <joro@8bytes.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>, "jgg@nvidia.com"
	<jgg@nvidia.com>, "rafael@kernel.org" <rafael@kernel.org>, "lenb@kernel.org"
	<lenb@kernel.org>, "praan@google.com" <praan@google.com>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"xueshuai@linux.alibaba.com" <xueshuai@linux.alibaba.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-acpi@vger.kernel.org"
	<linux-acpi@vger.kernel.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, Vikram Sethi <vsethi@nvidia.com>
Subject: Re: [PATCH v2 3/7] iommu: Add iommu_report_device_broken() to
 quarantine a broken device
Message-ID: <abtRvoEessOlRzn/@Asurada-Nvidia>
References: <cover.1773774441.git.nicolinc@nvidia.com>
 <c5390aeaeccfa86a1c79f26d2c0ff5df380940a4.1773774441.git.nicolinc@nvidia.com>
 <BN9PR11MB52765AB4CF7B9966D545CD1F8C4EA@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BN9PR11MB52765AB4CF7B9966D545CD1F8C4EA@BN9PR11MB5276.namprd11.prod.outlook.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6731:EE_|PH7PR12MB6764:EE_
X-MS-Office365-Filtering-Correlation-Id: c477a61c-3672-4e87-a7e7-08de85573547
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|36860700016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: YuxBH0zdbzIxY33Emo++irLXOwCSgqh/I/0ymmTHsBe6W3c308uhFvkPUQe3WMHQ4gsRvOUM4TgIfRC0OCPqnlhKIOkhDU3vnp17vOHjSvkc7HQOlVscX8RyqmuK3gRMi+qUZmprYoTC03CYVjgnc0pVri129uvMpplrxTtD3nBqT3STl/ysTeQ5sHpymulwMKwZsfyF4AzcMsBRYKl9owXz+T2nJTKmFuOlhwji6ejANQMLPZbXGATGXxbnp2A9uJWFeWReU4oc98uZ+p2Npcgrgyl9Ou7ydH3Nn48ghRw6n9srTjwEa0J9t7y+3a3Br5i8bTHvecXFpePo7ZtDZhpYuTJMK9f/Z4kZXhkDj+e2E5hIoO+Hj/YEnzxQnuEyboJL/CLVcIeUhXnIixIbldGLPWvAkVxjdtA/Ezxtj9lyi8xgCTYWC3qHQWwxYfRUEpRd1LFCM3C7F/NRUsLGwO165JaVu5BP7zq6cKyOxihh43s3KI1vkPdne5w4+3xCn9W5Q2v//0YDRHmOcaxUymqvCLwVurDR74qkgUkU9g6Tx5IVB2dGMcmBK0wlnn6MZ59rLJGQRD+pfEVn45H693flJEiV4AuhqTghZ87jN5uXZckIYDaYG3ydsKVtX6Fno+WmHxvtFUnNi2pZcXh8KjhJiAlpm2sR6LX5/DjN+mrO2VYfqBd4z7KUQa89G5+6XXS58wbabr0nPdZ5Ef4SvX7eVzrnaULYI/yx4H3CZyNMmtmrSrGm8y//CSAiHw7OifjX5rwoFdtvqihP4glK8A==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8TaAm7Z9AZnbmuMemrfVWybXVvoXBM+SliDVF+CmkckKYwqvHx181y2VTlDyMycgt+Hx2BJXQhtGrNqgagN2B8K7fgbBGYoF3uaXgLcsr+3nBpoJsiqWIjy4DMHusc0zSaAnPZG34voUaFDCklVIwFKeQrj0HmWpF+N71eTWwpy+FNAcGoPWgBjPRYa0Dm/kEcHX2x3U9bhpFagSepjn5KqNBDlvQIFCUUCi7g+HqHe2UPu1x3PQ2aO/0hFNrzS/GhIgmgbYWB1/PQeVol0kgj1NS/clSyNmghPAqsDPTcoR41aHgHUKNaIluR19eBxeF3Z+EV9Kg1u6fNA4vGhbZWIIysWq3xFVQ410Mq5KWEez7VxQCMSs5ltUzAXTg3vE4NM07xrdNbH7gYtAEjqwfRHNPQ7u7HOnQ4a/dzRKQXBY2mVapk8hvJXMDgs79DG5
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 01:31:13.4756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c477a61c-3672-4e87-a7e7-08de85573547
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6731.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6764
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_183123_821222_73CD5784 
X-CRM114-Status: GOOD (  21.78  )
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

On Wed, Mar 18, 2026 at 07:31:18AM +0000, Tian, Kevin wrote:
> > From: Nicolin Chen <nicolinc@nvidia.com>
> > Sent: Wednesday, March 18, 2026 3:16 AM
> > 
> > +static void iommu_group_broken_worker(struct work_struct *work)
> > +{
> > +	struct iommu_group *group =
> > +		container_of(work, struct iommu_group, broken_work);
> > +	struct pci_dev *pdev = NULL;
> > +	struct device *dev;
> > +
> > +	scoped_guard(mutex, &group->mutex) {
> > +		/* Do not block the device again if it has been recovered */
> > +		if (!READ_ONCE(group->requires_reset))
> > +			goto out_put;
> > +		if (list_is_singular(&group->devices)) {
> > +			/* Note: only support group with a single device */
> 
> this series is about fixing a vulnerability. Then it sounds incomplete to
> leave certain configuration still under risk. Probably we should first 
> ensure ATS can be enabled only in singleton group, just like how we
> did for pci_enable_pasid()?

I understand your concern. But I am not very sure about applying
limitation to ATS support. Would this block some existing cases?

> > +			dev = iommu_group_first_dev(group);
> > +			if (dev_is_pci(dev)) {
> > +				pdev = to_pci_dev(dev);
> > +				pci_dev_get(pdev);
> > +			}
> > +		}
> > +	}
> > +
> > +	if (pdev) {
> > +		/*
> > +		 * Quarantine the device completely. This will be cleared
> > upon
> > +		 * a pci_dev_reset_iommu_done() call indicating the recovery.
> > +		 */
> > +		pci_dev_lock(pdev);
> > +		pci_dev_reset_iommu_prepare(pdev);
> 
> let's rename it to iommu_quarantine_device() to be called here. then
> have another wrapper pci_dev_reset_iommu_prepare() to call it too.
> 
> this path has nothing to do with reset.

But the implementation of that iommu_quarantine_device would be
still to shift to resetting_domain. Perhaps, we can rename that
to quarantine_domain or so.

Thanks
Nicolin

