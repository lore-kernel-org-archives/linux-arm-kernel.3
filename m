Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7E0D149C3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 16:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AnXiCdGD/CKTEHm2nBL85/df2l6mhhB4s0DdikOIGyg=; b=zQLnALBkkuknGm0h/enx4Vu0kN
	i7t64JvYB6txBAv7CezT85S1IPRce4QzXC7fZeA6V0vv/yTYsJ8nKlre7bXU4WupfCCeAduqZdI0t
	Mo/TGr56G6P1jXyrei8WvMkvSzGuQ56YOqMJcspyMGwEBmZijle0hAgZMa7KOi6DTFz6dRFELLwdC
	GmtUmI0brjtRYTC57EMgtXeKzmPN5WPaFosdfVDiu8iNlPFfY2DboKdv4ZhJdrEEeZyGDCe3Wo9lJ
	ope30LMBDBKUjGhiHqs6RZKVSmcIArEtjJCL8OkcVMss1ZvByzy5v/dwyYn4X/UdRn7cHNsy57DbI
	u4wu+AeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4N3R-00000004PC2-439p;
	Fri, 25 Oct 2024 16:20:49 +0000
Received: from mail-mw2nam12on20603.outbound.protection.outlook.com ([2a01:111:f403:200a::603] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4My0-00000004Nb6-1pQA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 16:15:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hsfZv+msXBkw1sKOIfb1P9s5jF0Web6nhfO5m3q+mLaaWkKeIM9sdJipOOtD56af9HGDE5W03Vl4HHdeu5Ped5lohMisbeRmc3kSLMX/N8ltWFGToG3xVI65Y4QAtSAg+lcxf3z6kxVccHqrf82jBmzgbTN86gaZ8rD3ppkx+3pjAdho7XBCP2vFuiYqyoIBshd8JMhh0SQTO7+cuD/cBlLr+c6X1QolqXcld5CjTtGVpVOe2TbV606NitXNVtdTBgAv+a7neNBON/dvSqI2WIjjcd+HiVOg/PqWBN9kfg2IgCBAYT9qXcovvWpXqWBOWTcDHokC+s7pVmzYHVFuBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnXiCdGD/CKTEHm2nBL85/df2l6mhhB4s0DdikOIGyg=;
 b=PR8T/q9VtAPX/y8lfjTadhflM9YXeMGcjrfZ2xwShLb8esU6UrAO7ZZ2osRl/ZicsE+jLeaUThmGDXY1u4ziwE9wJDM4MBYC8j2jiCDcGlMsUIhWb9gt1YIitgAbpmbJhrgYCXMrZWAgYYbspqLu8LxF/nsM17ZhV0QiuRuGZGRtzuWEM81vd/VTnU0QqGMkv1l7LoQ1j4M8Q0QCWoM507I4MMau+Kdu4Py+LgAvebkijzZbMtnGjEduGZFidXnGuxFIzBT9lopfiCvHOjao44hszappZRHNIVYigQyycJw2X8H14JMv+pNo5dm5IM8jci2oDQeffC4tOGR2PdwNKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AnXiCdGD/CKTEHm2nBL85/df2l6mhhB4s0DdikOIGyg=;
 b=UD8mDVr59mlVG4efXEJkDILqtda2K1qcOWJlsTVyCxCgyIKat8Wi70ePfImNDrqkMIOD6d4tjA16iXYxWh0ozGYSOuYPYnNHuDaTs8qWu1E2ptr03/k3/xcctsgzNw/Otp0dRRpb5VKOG822dbbOid9zai1Irbb1mkPf3L4lrUMwUhmzbLx5zqMSid8FgYqikHRuR7VLcWUGXTAjDaULj7TgDxfR2uuz2AQ1zBRgLLt+EtFs42UAuU2fdwNEAHY38Bdk9BEPQJovgxiR/GHMOnO/kF9h5RSxRHLPxFVHzD4VJRAbxyoUDvUZtJj0n8I6L7cuweuPO3H+YTHKaXdhCA==
Received: from BLAPR03CA0150.namprd03.prod.outlook.com (2603:10b6:208:32e::35)
 by CH3PR12MB7762.namprd12.prod.outlook.com (2603:10b6:610:151::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.22; Fri, 25 Oct
 2024 16:15:04 +0000
Received: from BL02EPF0002992C.namprd02.prod.outlook.com
 (2603:10b6:208:32e:cafe::e7) by BLAPR03CA0150.outlook.office365.com
 (2603:10b6:208:32e::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.19 via Frontend
 Transport; Fri, 25 Oct 2024 16:15:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL02EPF0002992C.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.14 via Frontend Transport; Fri, 25 Oct 2024 16:15:04 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 25 Oct
 2024 09:14:54 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 25 Oct 2024 09:14:54 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4 via Frontend
 Transport; Fri, 25 Oct 2024 09:14:53 -0700
Date: Fri, 25 Oct 2024 09:14:52 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
CC: "jgg@nvidia.com" <jgg@nvidia.com>, "will@kernel.org" <will@kernel.org>,
	"joro@8bytes.org" <joro@8bytes.org>, "suravee.suthikulpanit@amd.com"
	<suravee.suthikulpanit@amd.com>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>, "shuah@kernel.org"
	<shuah@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "eric.auger@redhat.com"
	<eric.auger@redhat.com>, "jean-philippe@linaro.org"
	<jean-philippe@linaro.org>, "mdf@kernel.org" <mdf@kernel.org>,
	"mshavit@google.com" <mshavit@google.com>,
	"shameerali.kolothum.thodi@huawei.com"
	<shameerali.kolothum.thodi@huawei.com>, "smostafa@google.com"
	<smostafa@google.com>, "Liu, Yi L" <yi.l.liu@intel.com>, "aik@amd.com"
	<aik@amd.com>, "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
	"patches@lists.linux.dev" <patches@lists.linux.dev>
Subject: Re: [PATCH v4 06/11] iommufd: Allow pt_id to carry viommu_id for
 IOMMU_HWPT_ALLOC
Message-ID: <ZxvD/KEnzjTMOYnA@Asurada-Nvidia>
References: <cover.1729553811.git.nicolinc@nvidia.com>
 <ba9ce9b3c8a93c9c790fee52961d075dfbb63ca7.1729553811.git.nicolinc@nvidia.com>
 <BN9PR11MB5276BEF20579F3CE7DBA15908C4F2@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276BEF20579F3CE7DBA15908C4F2@BN9PR11MB5276.namprd11.prod.outlook.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992C:EE_|CH3PR12MB7762:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eaaf42a-e82c-4a12-e6e2-08dcf5102f5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nrZmgaZb3t6PbpfXD94b+7Q0AmL/BhK6cxqeCs2t0GbNgu5RlidD+YOgHRwM?=
 =?us-ascii?Q?mpIcg/dXnsKj8z9fGNeiAYF5fjjxnrVva6bT9xSWRLmaiVb3zcC64ln/ANp7?=
 =?us-ascii?Q?IYmFT9Z1oyfUdY6EPK4ad76N4+3cm74KBHgYjA3dD1TrlJgVku+d/iPYO0hJ?=
 =?us-ascii?Q?UryUuwxDP8PBbmaAIJnN5vlMbtZBl5mbJmqn/oZNLpSKHttLCxUEEHLZ3UqF?=
 =?us-ascii?Q?dE+hbP/+nynwpMyexB+/zs4nRIpT68kmI0UWBWXCT8Gws/dX8/b+8FwTSofT?=
 =?us-ascii?Q?IFiJ5ho4kqhcmOFhJQz9r6OT0Hrh8Rj5E2E9xOQmomJ96p+S8wSu+8VY4usX?=
 =?us-ascii?Q?/hd3DG0iuJjtrz2xlMVyoiNNzq/1TqE4MRmA8W7whvvcqBvcHHhG7OF7ilVH?=
 =?us-ascii?Q?4Ne8Tx2lCxh43iJZUsPiePjkgEWv/VWhUaNo1VNBmX3XcVBO+raMt8LbB+Qp?=
 =?us-ascii?Q?uO3ZBR00bXq7M5DtJbLX+kbnzrBGVlVYkv14JWME/7MzU9G6R9cICyss7fX/?=
 =?us-ascii?Q?lDel1nTpjcfQvBO55Wum0iTxmN8GKIc74bbXjFRFVI8xMPcIgLFCkaaaYgih?=
 =?us-ascii?Q?FL8lqq+zXwgMsVJx1My92fhvkqWpaGGNY6nc0tpQLAHoNWQecHWOsHnp1ybK?=
 =?us-ascii?Q?qrBl0PKFYiLYLaQMIyCB1xXV6TwB8mSm81OOtbXIf6byInezO3QDkkpTXUEw?=
 =?us-ascii?Q?9xHPZsJU6PBHT+2wJsB6Qp8nAPx5cAgD06M6zQjuhrFimSTl3vtNS9Fe31GW?=
 =?us-ascii?Q?K/PWRN2qVs1UyiCWbANyjVToV0RUHm1AdQrL1r+eqSWq71klPTftvkrA+1Iz?=
 =?us-ascii?Q?ONyE+VR+4yWeUH+As03mmYVIQU4rb5U+Hdj8gBftfSijRtIib2uuRSWsrhxu?=
 =?us-ascii?Q?IPDaS0W161OpYrp6BzHAG0KiYed5ZvPf5G6A3FNdNajB/wML7icd3CczFHNO?=
 =?us-ascii?Q?wnS4CSW31trpaw1rEQeyqIWo49eu6xMUOhhcHQE8D7YgiuY7hi2C+x8C5rqR?=
 =?us-ascii?Q?ombN6kWV1sfXU3PeQ3QA1cUGUlP7dX371GgW8C7QxwRuvOSizWeoxZpiRGO8?=
 =?us-ascii?Q?a5daMOEWSiVc8yK49UuQar0x4HQNrARp1nJjUC153ga9hqp7CmDKzFsTkcUK?=
 =?us-ascii?Q?SmyGBizQskyZghOBwRqr/bO8IH8Ry2eZED3jDgxAYlRn9G3I1gBrA9D6rRHU?=
 =?us-ascii?Q?ebgbsHK9sZeBq9PYVRI1ETCw7gfp60Cy16CsWrV/jaWU5CnKrdShp5DNvy7l?=
 =?us-ascii?Q?n0z/kRTKrS8SiiCzbzLqp+fscZ9AP8tlLdpnTyY5vBinD6f5Dv+SbROOuFYl?=
 =?us-ascii?Q?f2VjNXpbTtR6ZW2NbClXt++QJPJsugK7uHLyH/AuSmAk4c1ufla8iZpUsmxO?=
 =?us-ascii?Q?mnvpxqObdy278X/DhcLekrNEfmTmnrApoH/fT4XO+/5LCfiDSA=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 16:15:04.0792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eaaf42a-e82c-4a12-e6e2-08dcf5102f5c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0002992C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7762
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_091512_528041_1E162A8E 
X-CRM114-Status: GOOD (  10.51  )
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

On Fri, Oct 25, 2024 at 09:04:15AM +0000, Tian, Kevin wrote:
> > From: Nicolin Chen <nicolinc@nvidia.com>
> > Sent: Tuesday, October 22, 2024 8:19 AM
> >
> > +static struct iommufd_hwpt_nested *
> > +iommufd_hwpt_nested_alloc_for_viommu(struct iommufd_viommu
> > *viommu,
> > +                                  const struct iommu_user_data *user_data)
> 
> probably "_for" can be skipped to reduce the name length

That would sound like a hwpt_nested allocating vIOMMU...

It'd be probably neutral to have iommufd_viommu_alloc_hwpt_nested,
yet we have iommufd_hwpt_nested_alloc (HWPT-based) to align with..

> looks there missed a check on flags in this path.

Oh yes, I missed that. Will pass in the cmd->flags.

Thanks
Nicolin

