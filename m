Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F98C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 20:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fOLFhW+nTXVL7BxhdMvJBuznD8Y+66coDXImfXAuBI0=; b=TfdrM4rWT6xECyYBhrPr+gfSO7
	zgwWSkrMvTsUYLCOVzy+xjlqo2yRyZ3JbXCg9aCXub4F0zLZxMuPYfKR8QhnTmTYqxNroVD3cYy6j
	j72i9QG4kLD579wo0E4O+UeX5ytDVQ9737OgBbvDWSyuHKfwm1WOdcNuvSS2LlFeLvlYz1VIPFAyD
	k+cyctP6ZryA4PJbRi48if2DHjk1TZPKVQPh8v5CpPnx/SUXod9A7psFE2L4IGAxiY1WS77Dm2zv3
	fHZnIm1CbyFFdpvdsH+Cp846HsC+9OdYEHuakNyh16/be9/zrTDQvaw7UGsWJeYxtrIkn+d7kOWhA
	6HcfK2oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQlo-00000006WGi-226B;
	Mon, 13 Jan 2025 20:10:44 +0000
Received: from mail-mw2nam12on2060f.outbound.protection.outlook.com ([2a01:111:f403:200a::60f] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQUu-00000006T88-1vHW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 19:53:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UeRrtVEOg7Uua66Ik1cjw40G9deo0CKV449bP5ws4b3HHDJud8OmMRum+uVu6wdX/wHbjhX6qwbSlbMfj+B2ILDB7nXXokzQO7sR88wf7OjBQbftc5vATkxEtrSabq22+HLJ/dRUCc9QP/ymnbLKbgZBL0P3DzC7F/FhfeZHB8eCxxTXyarwONY8Bx3ubix1nysaJ8+n0fC2cHFDcLel+bQ36MQyhx2OVc1VbGIcE1K8f9/FxO3rGrA7zxaX0OQXui8JDebQuPpFl5jlzClO44R58vaasZw45NUfjrN99aD59fdzc1zexqSoF7JudR5oJI+59ROkPAmfiipWRma/+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fOLFhW+nTXVL7BxhdMvJBuznD8Y+66coDXImfXAuBI0=;
 b=Cgry4Mbz4AWdHLxGD4n2qjefh+i14RIb8fOvj2dZktucJJBspjSWUaHR+JlpByqPDeGQnRZr4uqa2Wc7inYVm4WpUmlTbL+jHXAHBEAfSSDIBNMG8l4kML0knFWmN9HWlxK3iB8s8b7zV9A5S7bMh20MJvrF/tS8++6xRod98BuYZltW8Q11hxv2noljpu/x29pLb65Hbaa/0JQL0HqXLDOz6NtmfCGkZuB92KKe97vjrTpMb6UN1ebcmbi9IW4sIgfQOHzAHEMewz0SVV3t7yWDQUuFvgttiKk/RsVH7tEty+2ccH7houmD9Vf4aey04SElR6XJytSn42uvIx8teA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOLFhW+nTXVL7BxhdMvJBuznD8Y+66coDXImfXAuBI0=;
 b=SLkddGfOSh7Kyvaxvugx8VbKvXI4YKdhoLE1KA7Foe0tL2NXlHvEcymDjKS/ccfNPQt5P0/By+vOglCskKWXS6nFlgn8dwCtFaxhWcqzmrPXkgCJZrIFcucxgROC11f0uLqf4rhX/KlV7c+90Kzqu1ohvVirO3GoWTXkhBX9SZiJRT+5WMuygtizZ94RShv97B+3apuINJMOFA5+WQPRoXfb0P9URvqUqqcDpmNg7zvvyMH2z4lBpc1zr1zum9Zs1sL5ngY3c3ulxREicJzPrayiqspJGAi0UVWEblsKzWJz0h0NlXAtM4Wwr8D7nXth/lE3iPg+j8hWK7JPCDl7Qw==
Received: from CH2PR16CA0012.namprd16.prod.outlook.com (2603:10b6:610:50::22)
 by PH7PR12MB8156.namprd12.prod.outlook.com (2603:10b6:510:2b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Mon, 13 Jan
 2025 19:53:12 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:610:50:cafe::b8) by CH2PR16CA0012.outlook.office365.com
 (2603:10b6:610:50::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.18 via Frontend Transport; Mon,
 13 Jan 2025 19:53:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.0 via Frontend Transport; Mon, 13 Jan 2025 19:53:08 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 13 Jan
 2025 11:52:59 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 13 Jan 2025 11:52:59 -0800
Received: from Asurada-Nvidia (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4 via Frontend
 Transport; Mon, 13 Jan 2025 11:52:57 -0800
Date: Mon, 13 Jan 2025 11:52:56 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <kevin.tian@intel.com>, <corbet@lwn.net>, <will@kernel.org>,
	<joro@8bytes.org>, <suravee.suthikulpanit@amd.com>, <robin.murphy@arm.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>, <shuah@kernel.org>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <eric.auger@redhat.com>,
	<jean-philippe@linaro.org>, <mdf@kernel.org>, <mshavit@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <smostafa@google.com>,
	<ddutile@redhat.com>, <yi.l.liu@intel.com>, <patches@lists.linux.dev>
Subject: Re: [PATCH v5 13/14] iommu/arm-smmu-v3: Introduce struct
 arm_smmu_vmaster
Message-ID: <Z4VvGIYtbCOj53qf@Asurada-Nvidia>
References: <cover.1736237481.git.nicolinc@nvidia.com>
 <115d6015219e5850ea49dc9f1247f9c3eb515770.1736237481.git.nicolinc@nvidia.com>
 <20250113192927.GJ396083@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250113192927.GJ396083@nvidia.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|PH7PR12MB8156:EE_
X-MS-Office365-Filtering-Correlation-Id: 37eb0476-a2c8-451b-b36e-08dd340be767
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eR1EqBjs/rI+xzDFpsoeAGa8JR5XgkH/vSjGkCI8TqoUiQlOR88R8/EMfLF7?=
 =?us-ascii?Q?XlajTZphRSBqOUv1C7psFnnOxt3vJ9HmaqTpMbf9gyBSY6vVZzTaABAPWVoP?=
 =?us-ascii?Q?QGrpE12uN8lTOAVnRgyM/cntKUoUnIiOJDVIkCxjpdwwH2gTxqVPfMaDGEu7?=
 =?us-ascii?Q?Q9R5WN3jAwGiJ+q2NGBibHoPGRQGDmpNWPEWUBETNNrPiTYqxLILTEm7F0Pu?=
 =?us-ascii?Q?7Ss/cGnO9v2ppS4F5Q6J1diEzfFqcdK7bHK3cpuIdISkxiGw3ac+EOmi+iAx?=
 =?us-ascii?Q?s3ZviuKkoRlm5B8On31GMuGqpLtiquZEVMQ4LZMX2Ay+OKGb9cR1oNtA/Mnv?=
 =?us-ascii?Q?zRPJ0Rq7kW9kLdHTGqLWzNGfk8esCVQlss+gmcY7OiLa1uraVNMVhw99ynrW?=
 =?us-ascii?Q?yGG9GAZc1oBBKXb62dOR06oK9METGV6tdMKPFGTsz1ZM53akk+HjXNIvSWwH?=
 =?us-ascii?Q?921Bk+ppESu/NgO7uy+sUpxoHG8Z4TLKWcEovCoy0lzE0FYlGLA0o2a2Txnq?=
 =?us-ascii?Q?jluMeWu6CmZopEtfRZq23C0d4efRYODDk8ASC0014xVaxYHcTCXBmQgrQygC?=
 =?us-ascii?Q?ar3UZAGArVO3+I3FLc/AxEw2zIr7FTrz2/cK1lnHSs7imQAEqguxOoQ38kOj?=
 =?us-ascii?Q?0JwJ8fOM7pdZPzNqpFCGn9ChNruC31ywhdKgNR8SzcucueTA2P1SPHvbxTj7?=
 =?us-ascii?Q?nZtI7JG0wrQuZjyKxVjAAsW7BwsX5NJt/zzfl8bYUVOcPAZxBuS5A4ih8puu?=
 =?us-ascii?Q?76lVLQXHCneQW4eX+2QM+Mvq/BuLujonttZImOxQsKx7Qb+NErXvttMscRZs?=
 =?us-ascii?Q?v6drf1k4qf2Dr/Vwh1qhnwTX9KsLS0rh21BqHv3TdILzMYRNlivsPUFgFEZN?=
 =?us-ascii?Q?4T530gl+VR2hI5hUD+1KjiWsunRKIoExb9JVY1SXlaoBdHwKs+3Ghf40Vsob?=
 =?us-ascii?Q?JRf2pVRdtXfpTRyFdwshgILnaHD30LXAtrRDubomTX84j6rFJokSVDbFebPj?=
 =?us-ascii?Q?Xn0TcUbyfMnWMWmZzTqm4k4AZCZr918ip9rUMheHNoLYMYvM+LwOcB+cza9N?=
 =?us-ascii?Q?WCUZ7oTfqkoUZ+BM0PKxeIlGa63L9klfMo9ajQk9k2HJbZH8mlMZSs+hI3g9?=
 =?us-ascii?Q?Lc2vQ1wFAYP9mpa37mYSj2WKgGHwsXLvWGjZnC1VNoqCYW0Tf1qSM5VAyw5O?=
 =?us-ascii?Q?lyFPvbrmjlqyvYQcmwCJzORNjGhvxzp4JtJZeYpLwoKFpVlQB9Hl3sQZCz3Z?=
 =?us-ascii?Q?C77a4vuwbuKOYEDp1kD5GtelnFVh4hUdPXRSTbiZ5e8dAHoO2ljTyLRgQfqU?=
 =?us-ascii?Q?Uq44azfxk787uV+/5st8cjdBRD/iXG3SyVKlOE+DF4PnKp8yvoLnLHNIUK5b?=
 =?us-ascii?Q?+jQxqgfLtfpOtxwTYUW2nul6gDosY9ty52icRsDz2h/MGaFE67tTu13SoVyS?=
 =?us-ascii?Q?x5B70m3vtbv2sV9LAiX4KJou2G3iOK+3I62TvPKmHyvzJUg9but8UZ/wwhQX?=
 =?us-ascii?Q?FF932bA/FQjXtX0=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 19:53:08.6689
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37eb0476-a2c8-451b-b36e-08dd340be767
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_115316_497151_0436D985 
X-CRM114-Status: GOOD (  17.52  )
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

On Mon, Jan 13, 2025 at 03:29:27PM -0400, Jason Gunthorpe wrote:
> On Tue, Jan 07, 2025 at 09:10:16AM -0800, Nicolin Chen wrote:
> 
> > +int arm_smmu_attach_prepare_vmaster(struct arm_smmu_attach_state *state,
> > +				    struct iommu_domain *domain)
> > +{
> > +	struct arm_smmu_nested_domain *nested_domain;
> > +	struct arm_smmu_vmaster *vmaster;
> > +	unsigned long vsid;
> > +	unsigned int cfg;
> > +
> > +	iommu_group_mutex_assert(state->master->dev);
> > +
> > +	if (domain->type != IOMMU_DOMAIN_NESTED)
> > +		return 0;
> > +	nested_domain = to_smmu_nested_domain(domain);
> > +
> > +	/* Skip ABORT/BYPASS or invalid vSTE */
> > +	cfg = FIELD_GET(STRTAB_STE_0_CFG, le64_to_cpu(nested_domain->ste[0]));
> > +	if (cfg == STRTAB_STE_0_CFG_ABORT || cfg == STRTAB_STE_0_CFG_BYPASS)
> > +		return 0;
> 
> Why? If the VM sets an ABORT vSTE then I would expect that any
> protection violation events the VM triggers are captured and forwarded
> as well?
>
> Basically any time a vSTE is in place we should capture events that
> are affiliated with the SID?

I see. I will drop this.
 
> > +	if (!(nested_domain->ste[0] & cpu_to_le64(STRTAB_STE_0_V)))
> > +		return 0;
> > +
> > +	vsid = iommufd_viommu_get_vdev_id(&nested_domain->vsmmu->core,
> > +					  state->master->dev);
> > +	/* Fail the attach if vSID is not correct set by the user space */
> > +	if (!vsid)
> > +		return -ENOENT;
> 
> Is it really OK that 0 is being used as invalid here?

Hmm, perhaps better to do an int function for -ENOENT. Will fix
this.

Thanks
Nicolin

