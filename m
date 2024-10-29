Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0A6D3A678
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 17:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a5SZ9SlQOy8PwcNjwlSs7Jvcsbz5PU9qxwKjpyp1fOc=; b=QDYV7qZcvXugTmXVd2lbAai5c3
	OP2WMWFdUZ/AKcfqnLwG9LbFmYYM50+IoLlfk80dsqDSksQrGZ5PtfusRQFlrHKqN5SwLBC/78P3g
	0WSNMGUF5urkLOMH/+AG7VWDXzbaJoXHYQ4hI42rCnvOt+FNgyDsMN1pUkZUa4TSbCRQd1AqBdAkg
	MUsQmCUBF4TKzFEid1XJeiD6oj4SrZYmyPTxuTG2FevO3SnA8z1cVFQx2+POsTm61VzFpo0bdf64c
	Fz5UTMZ5BU2UsiX1OFLAHedzU6IrOHZFjS2cbLtzY3Hbpr9VDd4BX/wahFBTcq/GvLFoMyk1YZgn5
	GBPtp/Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5q9a-0000000FIwy-1hQb;
	Tue, 29 Oct 2024 17:37:14 +0000
Received: from mail-sn1nam02on2062b.outbound.protection.outlook.com ([2a01:111:f403:2406::62b] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oll-0000000F4Cf-1zuB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 16:08:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hi+r1wnHMD920vWL1WDM208/MSG6qnQmVH2utrD3RkOxq9bsP1xTUl2GiheJIhXwH4OHPTPKflhXFlNdWnDOVY26cpFTJnecDo9TCDAOkiaLcIZvYDGIicuRdkj0l2HyXh9sQhI/atlbKf3IuXl67EomqFld0AoT82OnOIHu/7UAvewGzLPHOqrYQAYQ1sf/Mo2CFOtXuQfZCGWxe39lRKlyztauNPINr1WZoqNmgcEc6vmL/3gM1giJ4l6INmwwTkZnD+KTAYOBHL12WD5iLw8ORIDBGlrchYoLzGXNvc4sEwAtLUAYhZODHDhr/wuYuc+ib39lyEf764Edsst2sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5SZ9SlQOy8PwcNjwlSs7Jvcsbz5PU9qxwKjpyp1fOc=;
 b=dZBLt6YrJeTNq87zblViQRbu2jItM+PDk2WeDEigNGMTpKFx+CqvARx7FhXD953m7h77qFnE84wJbzbtTMtE1M+Ql1UjJh5HVWUNcqYOGu+7Lu6ZKGILPNeMhsMnJyZuOfMO8qySmqEL4TN+d9nGdke5EAoNSn2uzRrLI/Ntfyll91Rj6cg4hTQ9w8kHTxG1hkHg+kING3nwSwVKQHODU+flcKGGwRDgJoruyKIdmWj/vdijt68sAo76de8I07GBzXsxoGJr9PzruM3/Mg0Te+C5QiEmdJjwn+Vf73MxwfNW3gpiuqMPaleJ0+VG7ailYrPrzVijs9nibwF7S6FuGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a5SZ9SlQOy8PwcNjwlSs7Jvcsbz5PU9qxwKjpyp1fOc=;
 b=WuATARzFtWKF33kVNawI9cRx7cORj26hiIcGs6NRYFcfsjG0ENb9NDyNVCi+SihT5qb9y48ddsvKg8yJVt7STtmxTQfEi0b3M0VLHGRgpA14Tg3Vc1xnO1sdB/tfQzrm8o0sVn6iKP9JFv8+BWXucucv3vFALRMFgrVQTLMeBMicnZANW4UivZyq9X9XdGYq1LfLz60Cwf/prjEE7WgEBh/n8FRiNF9Awr/wL9OOXQ2zMXafw930yg0/A47u6oS3WberYH7EAdmemg0Ar12gH5CXsVASBVan+YQYUW3oqfdULe6vv3xXB1O3hajQjxljZlcRY0gCQQMMtbEzzvzgbA==
Received: from MW4PR04CA0279.namprd04.prod.outlook.com (2603:10b6:303:89::14)
 by SA3PR12MB8801.namprd12.prod.outlook.com (2603:10b6:806:312::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Tue, 29 Oct
 2024 16:08:15 +0000
Received: from MN1PEPF0000ECD6.namprd02.prod.outlook.com
 (2603:10b6:303:89:cafe::e3) by MW4PR04CA0279.outlook.office365.com
 (2603:10b6:303:89::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25 via Frontend
 Transport; Tue, 29 Oct 2024 16:08:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MN1PEPF0000ECD6.mail.protection.outlook.com (10.167.242.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.16 via Frontend Transport; Tue, 29 Oct 2024 16:08:14 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Oct
 2024 09:07:42 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Oct
 2024 09:07:42 -0700
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4 via Frontend
 Transport; Tue, 29 Oct 2024 09:07:40 -0700
Date: Tue, 29 Oct 2024 09:07:38 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Zhangfei Gao <zhangfei.gao@linaro.org>, <kevin.tian@intel.com>,
	<will@kernel.org>, <joro@8bytes.org>, <suravee.suthikulpanit@amd.com>,
	<robin.murphy@arm.com>, <dwmw2@infradead.org>, <baolu.lu@linux.intel.com>,
	<shuah@kernel.org>, <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<eric.auger@redhat.com>, <jean-philippe@linaro.org>, <mdf@kernel.org>,
	<mshavit@google.com>, <shameerali.kolothum.thodi@huawei.com>,
	<smostafa@google.com>, <yi.l.liu@intel.com>, <aik@amd.com>,
	<patches@lists.linux.dev>
Subject: Re: [PATCH v5 06/13] iommufd: Allow pt_id to carry viommu_id for
 IOMMU_HWPT_ALLOC
Message-ID: <ZyEISs6uLbH+nCsi@Asurada-Nvidia>
References: <cover.1729897352.git.nicolinc@nvidia.com>
 <4f5ed9d75c23a503ffe672a85cf9010569652794.1729897352.git.nicolinc@nvidia.com>
 <CABQgh9Gkt5tsw+wr_=WeA+m=Kz2xY5Z7aSBNhHCvBG2r=7O3TQ@mail.gmail.com>
 <20241028130309.GP6956@nvidia.com>
 <Zx+lGr9iD4DSkc8I@Asurada-Nvidia>
 <20241029152746.GE209124@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241029152746.GE209124@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD6:EE_|SA3PR12MB8801:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e8c2eaf-f862-499d-8eab-08dcf833e4f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rXQuyvjnRFKJfurv+rkFq1M+fXnD7/xchUhLksW1KtqlDI8FpRegEoh4iOyI?=
 =?us-ascii?Q?PLKdGJnMxu5PARXENsZmXEyUEvpiGxQzA50yLJko/5TRwSonhcoQc6M4XwUA?=
 =?us-ascii?Q?yy/amsJrsR6op9EAEOPEpK2ZCvYoSld82W4VWz7/15vgBD87IRogwp3km9Ma?=
 =?us-ascii?Q?7kN5kIMUnbEZ7cYtc/iK+vfxKink5O/jNv4kRKxpz/ATNwqFqMzkJiApZ+mA?=
 =?us-ascii?Q?90v3KQ9jtZCJokiB4PmTu6aTEpgUHf8FHzltTEjv2b2Scj3nOE4+S25ApyOV?=
 =?us-ascii?Q?XxEN2Go621R3G+pS/wpHVfs8AQyaZ5vNvdSynoQ8Vcoj1f3TDaSi++Bo2gCw?=
 =?us-ascii?Q?fCYxJoK9qLOzkzXu4f2NFZxSsChYr3dY94U8sRFJKabrV8SXD9kLRoucd4Z9?=
 =?us-ascii?Q?iDjAaDuIEcG/qYAiBh5/9vLgHhEGnv8AemCtqxtnCMYgFPyNk+Cw5cyodhst?=
 =?us-ascii?Q?9b4WO0LVjMytfVpXt1vQfyV5RD35quAHBUHaw2B0A2nmxvO0QjNG4l3uWA/5?=
 =?us-ascii?Q?zNVOTkeEpe5TP/w5nCbD/QsAkUOhlz2jGf3Ss3QC1D4+c34G6VllQQia4K0W?=
 =?us-ascii?Q?VnRQtczNNGa7NMpuesbQoAPyJAvdLfaNuHUK7zgehIR3ANYLC2KvIYwbqluf?=
 =?us-ascii?Q?WufcsVO6V0J3aaKk1kaE7r8HvPzNKT9+ZyxS4wo82U4qh3NO1hJ0n9vU7yok?=
 =?us-ascii?Q?01KkTJ4UREQnlYJvWRgWJgP4xI3wh2qw7K6mHKts+GHB7MlDtNEhmn3SCPT9?=
 =?us-ascii?Q?x84/p+e2Gc6Gb2eTFkFwEBHlLd7nSbE5CcDOmJyVLGkfHAw4gckKDYEnDe93?=
 =?us-ascii?Q?K0pIIt1saG2hQ2uqP2i3wS2JvOPBfLhvcP51iZ3QQ+rMIU5vpTIAyIAv4c/t?=
 =?us-ascii?Q?mIOJTXQxm6vO15965ahURA3uKNSrA7a7pCUnFQRXiwCjBy67Sho93hDsk2YR?=
 =?us-ascii?Q?aAv/J+lVvpRFuVkFre47liQSaK9a0/4LI9oH1w0Q7Ctn+qwQ3o+rLHguDMHQ?=
 =?us-ascii?Q?pJp5zwivvUGbrGrm8JUxaPait1ipnxNU89H/wZkiJtHVocI4HLmjOr4Tbc6P?=
 =?us-ascii?Q?PJcBgZ1MmtjKHm2J011+UuiRb0bSesCuRVm7onQM0LcWr1IM8Y31qcTGeX5d?=
 =?us-ascii?Q?XHw2upGieDRovezoziojWLzj6TLukNvnPMeOg35sLUozy8ovSZ7tnTnFm6Bx?=
 =?us-ascii?Q?z1/oR9ttSl5gnOMpVsbCoG7HykTOdWQy928VljxRCP1h0gLH19iVSymHneQ6?=
 =?us-ascii?Q?ubM3tKJFtpFVy2t4OnXjmCVh1fRyLKKHnXr/4e4vLcHtKCBrg7qq8Z60bF5e?=
 =?us-ascii?Q?ui1GN7/vUooEM34r8Ks2NoYWeMrbsUdTMFhuzyaoPfZtSkdZcp5MaSRLT63A?=
 =?us-ascii?Q?VF6KYlYnrorn1T1WK4ukWwfm2o6ZCV08DDYE1xYeLZS263NWDA=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 16:08:14.5793
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e8c2eaf-f862-499d-8eab-08dcf833e4f1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8801
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_090833_543210_72AE5A56 
X-CRM114-Status: GOOD (  18.63  )
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

On Tue, Oct 29, 2024 at 12:27:46PM -0300, Jason Gunthorpe wrote:
> On Mon, Oct 28, 2024 at 07:52:10AM -0700, Nicolin Chen wrote:
> > On Mon, Oct 28, 2024 at 10:03:09AM -0300, Jason Gunthorpe wrote:
> > In iommufd_hwpt_paging_alloc(), we reject IOMMU_HWPT_FAULT_ID_VALID:
> > 	const u32 valid_flags = IOMMU_HWPT_ALLOC_NEST_PARENT |
> > 				IOMMU_HWPT_ALLOC_DIRTY_TRACKING;
> > 	...
> > 	if (flags & ~valid_flags)
> > 		return ERR_PTR(-EOPNOTSUPP);
> > 
> > In iommufd_hwpt_nested_alloc(), we mask the flag away:
> > 	if ((flags & ~IOMMU_HWPT_FAULT_ID_VALID) ||
> > 	    !user_data->len || !ops->domain_alloc_user)
> > 		return ERR_PTR(-EOPNOTSUPP);
> > 	...
> > 	hwpt->domain = ops->domain_alloc_user(idev->dev,
> > 					      flags & ~IOMMU_HWPT_FAULT_ID_VALID,
> > 					      parent->common.domain, user_data);
> > 
> > Then, in the common function it has a section of
> > 	if (cmd->flags & IOMMU_HWPT_FAULT_ID_VALID) {
> > 	...
> > 
> > It seems that this IOMMU_HWPT_FAULT_ID_VALID is for nested domains?
> 
> OK, but ARM should be blocking it since it doesn't work there.
> 
> I think we made some error here, it should have been passed in flags
> to the drivers and only intel should have accepted it.

Trying to limit changes here since two parts are already quite
large, I think a separate series fixing that would be nicer? 

> This suggests we should send flags down the viommu alloc domain path too.

Ack. Will pass it in.

Thanks
Nicolin

