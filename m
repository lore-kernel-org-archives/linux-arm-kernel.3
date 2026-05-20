Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D53FCD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 06:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yYHpRvmHgyd2r+qwGHW4DPX/jne+mtmdMxHFrz6XWZw=; b=Ql8isPloAhrU1KEmwS++Cij0QT
	7LsjmHLbe58ZtsuCI6SOxDBy7Xzom6XfAfkgm9fuf6qyjxnJ+PM4LuzqbEoVTLH+o3vg1qhfa8bmb
	gtvVoDpFZcIRapCpWnESmgG6sswxXg1hxQcjDybnI0jY7TiH5xCJTrQqwzIGbrd5e7bg2x0em7MbP
	8yDuVrHWgV4VdtSf4xRQeTMjpRtQeemz0jzQiuAIH66FDsli2/Lep4DjfbKhx1JDwDymrpKRykz+H
	MlC4qcMholBVKLgv/oB/6huDRwMLHBv71M45LbMm6aK9sfmLdOEYdBO/9fP0RYByJxHX2uw0rCIhG
	RlGdy2+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPaaH-00000003gTK-39oy;
	Wed, 20 May 2026 06:39:13 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPaaE-00000003gSX-40h0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 06:39:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m8ysso2vXNyoXRj84evfctTxgaMUgeGQgEWMLOL5xm7Pf0qAc7OB8yUc6lDeFHdkJYmbtdKY1DIO2Zd0vHbtD7MUzSzTaaC3TdnxXPlxGkT3EkPbHrtLqhAy7laeRJaix/dsfVUoRBiSh/g22IOpslIe+3U5F3McEppEZo4MwkSQkYHSn4/tOuCA73ZEc6xgfBAswRy3ooJUc5rfDdk4SSq9LSJwM5vCedSqlUD3aCuA8HoDoglhRVfK36th3NOJ5NawK9gvSE+3b6YKMmumsOFsHttyl/+fH//SlJSAmSeolEK+o4f17ue+l+/qYtINrX8hP/BrXa2i+glijfZwfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yYHpRvmHgyd2r+qwGHW4DPX/jne+mtmdMxHFrz6XWZw=;
 b=kfaRyxix+3CzoyR6Qui49UhLwuyjtoOkEGPK2nnbj9iTqoifgKypBRrh3jlQHUfZ4PqMfpqinuViU/8827cmNoyj9oS2KnvMG0QbExC14EEQpxiVkLkuSC3ZC2nO1459V5TbMR1qFGoNDiLYMSLE8Ihpyvk1cOOtQD0wOBe+nqGFEk1ZgI8ckj7vYFNEtu92TgzaBJYNv9s3zns6tBXofcipEhHqKsNIzgy0JOPhrLSQinFZVm+3eRn8qOzaI5NCskEtez3gFVLzmXcLJJtRdVdmuvu9IuKFqGsPExc0dhwpqI2RtFID3hiiowJCeU5Yl41hvPJBePRS4ECZ3Flefg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYHpRvmHgyd2r+qwGHW4DPX/jne+mtmdMxHFrz6XWZw=;
 b=MPxz3Z62Ye2fqlQVrioM/ClEfSw4+DEx0/xgfDKDOaxnPFMhHNRJsT8zbQi3gGWYNcb9G7RNmOOJZHBLIOoVQENkxpYVv3ZmOBPsLy7m/gAWRdfiusx4FGD2emLeAzGZDQo/m5yUgCuirnlBU2YWElrIU956yrUtysBvE/bQxGBqm+7iJBbXy15PCsetiPnoG0XM9aqRv2N+YV/vuuCPOjp9j3kre0fZmSB3fLMfja8TtqEhpV5qjOYWvp2/bHg3EhsOPBarwOwj0dNNL4yGxcF0Z7E53iidHDyTNvY/4FIRJVuBsTDly3dHK/9uTwwYEhSCFrzto/TxA3a56PioUQ==
Received: from BL1P223CA0006.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::11)
 by DM6PR12MB4092.namprd12.prod.outlook.com (2603:10b6:5:214::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Wed, 20 May
 2026 06:38:59 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:208:2c4:cafe::3f) by BL1P223CA0006.outlook.office365.com
 (2603:10b6:208:2c4::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Wed, 20
 May 2026 06:38:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.0 via Frontend Transport; Wed, 20 May 2026 06:38:58 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 19 May
 2026 23:38:38 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 19 May
 2026 23:38:38 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 19 May 2026 23:38:37 -0700
Date: Tue, 19 May 2026 23:38:35 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
CC: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Joerg
 Roedel" <joro@8bytes.org>, Bjorn Helgaas <bhelgaas@google.com>, "Jason
 Gunthorpe" <jgg@nvidia.com>, "Rafael J . Wysocki" <rafael@kernel.org>, "Len
 Brown" <lenb@kernel.org>, Pranjal Shrivastava <praan@google.com>, "Mostafa
 Saleh" <smostafa@google.com>, Lu Baolu <baolu.lu@linux.intel.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-acpi@vger.kernel.org"
	<linux-acpi@vger.kernel.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, Vikram Sethi <vsethi@nvidia.com>, Shuai Xue
	<xueshuai@linux.alibaba.com>
Subject: Re: [PATCH v4 00/24] iommu/arm-smmu-v3: Quarantine device upon ATC
 invalidation timeout
Message-ID: <ag1W6xFSdWMH65Zc@Asurada-Nvidia>
References: <cover.1779161849.git.nicolinc@nvidia.com>
 <BN9PR11MB52761E126A213C6CD2CF77D68C012@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BN9PR11MB52761E126A213C6CD2CF77D68C012@BN9PR11MB5276.namprd11.prod.outlook.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|DM6PR12MB4092:EE_
X-MS-Office365-Filtering-Correlation-Id: f636b2f9-1e0a-43dd-7471-08deb63a790f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700016|1800799024|30052699003|82310400026|22082099003|18002099003|56012099003|13003099007|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: HX7l02A34/zG+Ecv+RDvSKB0k2++6jkwEAThbmcd8yY4HgApiDNLkk+5KWZRJWpKlOM023P0ysaIK4WW/qYrBrzj2fDUXoWEPr+dlzcWJUJtusdxglX/C+Tei14S8qlDfVBZgpTNW8EQVOGejYFCLKZdedqqTIYVhY0HJui3UmucdLq4l1CCB9epmqRnP0IJSwIkWlRkEVF4s4VNyE1+44Hr9LkxjIGO0ZWk6KEMGC0lfV70yH8x78lVl8XSFfTwOsH1QqB9ziTFkeBsRM2pZOVUEv79eg7BV9mVUYHiuR4joRrgw0OUo7HfL05oP1kCW3J3wko/c4/OlmBYSkwQy4a/vTPCKxJ3hI1XJKtMoMx+LfgFx1G4flbpEvgKNm22Z7UdcWGfvaSBMFH3bsR4sdtmFbOKC/TECKDNjwqg9MhZxvffh+lsp4tYOeapHXsQu0+YEZhu4rfeGkVR7D6MzxrWYmu4+8ub3kCCKPiqs6W+TXK7/VfOAVTmi7kYqDVRpgEoHaMV0VI+UTPG89qNUIM7/Ru5U/dxx2iX43+sxJa2f3/tJdvuCXUxxMxOtbavYQEQUfMl+SoRHd66M2fkuuIGwQh792Cygq3tWRTKPgLOLbXbRJXmFwnFqax1x2NOA626xhu848VrZNH/rQ2KfJL9OVkHaGkctR35TVbMsGSy2RVPua+ppVHntRTGrHgoO9U83W88fgSlpUKaEBP0b8QlFqDxtmvshVify5XelkG3R/1ouIcB9qABoMDNCcFG
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(1800799024)(30052699003)(82310400026)(22082099003)(18002099003)(56012099003)(13003099007)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZJmd1JsB9PhYnTsvNa+ALOe9taQSZq075qsodcivGwY9FqackR/KibDQ+OaSvCHwbjTGs92oqW/IhliAzBkE4SGORf8t854hNGTzTT5p9ukP47Xcq9TAN/51we4ycJg5FJa29CD4HPqA2R4PbMJKogMfDzNDQXZAEFSzpg1WxZhMT+YA8pQ+cGqf8rwN9xwBWoKWEFfQAuZIcZJCVlprnaVbx8yxnx+MArtpzxrJxsKfhZjzCorzevP595CgvBQFnvjzxqlXr7+6S3CGv/qcR4u1rFLq7Sen2qD3KQD77QyMxt1nw68wRjiGzBBLV0Fo3FiYimKt5R8ejv3hO08cEge4e4Th7nmRecD40/ERs9I1s6LYUUviRyYHFySD9Ge9EoY4BQQzf2fc3ABx3Yc4APpqBxngXOJ+F6RRJ7VeDwNzC/B97rBAcr4tTSe1qF7d
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 06:38:58.6701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f636b2f9-1e0a-43dd-7471-08deb63a790f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_233911_000833_9F4C4A8D 
X-CRM114-Status: GOOD (  14.74  )
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

On Wed, May 20, 2026 at 03:59:43AM +0000, Tian, Kevin wrote:
> > From: Nicolin Chen <nicolinc@nvidia.com>
> > Sent: Tuesday, May 19, 2026 11:39 AM
> >
> > Changelog
> > v4:
> >  * Rebase on Joerg's IOMMU "fixes" branch
> >  * Rebase on Jason's SMMUv3 cmd_ent series
> >    https://lore.kernel.org/all/0-v2-47b2bf710ad5+716ac-
> > smmu_no_cmdq_ent_jgg@nvidia.com/
> >  * [PCI] Don't suspend IOMMU in probe mode
> >  * [iommu] kfree_rcu() iommu_group
> >  * [iommu] Convert gdev->blocked to enum gdev_blocked
> >  * [iommu] Use disable_work_sync() to fix UAF and ref leak
> >  * [iommu] Gate done() transitions to preserve BLOCKED_BROKEN
> >  * [iommu] Decrement recovery_cnt when unplugging a blocked gdev
> >  * [iommu] Drop racy dev_has_iommu() in iommu_report_device_broken()
> >  * [iommu] Add gdev->broken_pending to skip worker after racing recovery
> >  * [smmuv3] Add master->ats_invs scratch
> >  * [smmuv3] Add arm_smmu_cmdq_batch_issue() wrapper
> >  * [smmuv3] Force per-flush sync for has_ats batches
> >  * [smmuv3] Serialize STE.EATS and ats_broken updates
> >  * [smmuv3] Co-clear pending CMDQ_ERR from cmdq issuer
> >  * [smmuv3] Add invs and has_ats to arm_smmu_cmdq_batch
> >  * [smmuv3] Move arm_smmu_invs_for_each_entry to header
> >  * [smmuv3] Set master->ats_broken after clearing STE.EATS
> >  * [smmuv3] Issue CFGI_STE via arm_smmu_cmdq_issue_cmd_with_sync()
> >  * [smmuv3] Keep "smmu" pointer in arm_smmu_inv but add "master" for
> > ATS
> 
> Not check the detail yet, but this v4 more than doubles the number of
> patches in v3. Are they all necessary to be in one series? any chance to
> split to ease the review...

Ah, sorry. Mostly these are dealing with racing and corner cases in
the async design...

Jason has suggested to drop quite a few things. So, I will respin a
v5 that should be much smaller. Let's ignore this v4 for now.

Thanks
Nicolin

