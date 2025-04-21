Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F32CC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 15:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1TKqd7mWqqzRUirHIeediymt7eXLD2wLwsMa1eMtIac=; b=j1Hkb4GF8MUpCzP4WmQt//NwB7
	g8WAXli2CGGYUHMPJuVV/JjTWKUedKICCyQGQeLQUYPBOBZdh+JkEl2ccCBe8LZ5udnknlY0260Ou
	2Bzso6Biif0kYZ6lYVLmvurRYyyyLK6QnWczQgvc5syVSkFEyswP7tGXcoLabuKK7r3PYFqo8TBNq
	cS/c8us/nvrIscqPFL6Rvt3LYPQg7utYfMkbw7biKa5hZaal7AtxgkxTctblGcl6a3wvtAlzKtzVj
	fMckPPf9GFaZTTYXKHOBn/8amqJrttoTjoGB6Zz6AbMpFB6CwzrW8C6q/glhyMSdKDj/hz9wvxA9d
	hJgicpJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6tKW-00000004byp-3v7e;
	Mon, 21 Apr 2025 15:45:08 +0000
Received: from mail-dm6nam11on20606.outbound.protection.outlook.com ([2a01:111:f403:2415::606] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6tIe-00000004bsM-3PYg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 15:43:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UaaZPMVOULZFL6FLWjoTiQiVqhIII+uoaKba8BX9RNHp6OQIRiQvVvaN80IDI0zW9df1RI3t1Yah495cgdNTgl2YuV3rNxVTJzec5RIDlS5M9U7uxE60hsVSZIIF92UuBoueHpW1swZICAiy97YIvbfB7W5KxNLmEx5kTIOxj4kiSqJxfdX/P4Mfsn0mC3qJevi24pLAVf0gKeMneaXt5pSeuAuJreeO3PDDlLnneVn7VeUSwtpDgnSxtPASZPy/ogPyOpH27VE6f7PfLb1qDJBW6O56BP6j91CceWO6PEMFN0kyymchqMKKomk1QS/P5x/AyVlj94sBghgJirerXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TKqd7mWqqzRUirHIeediymt7eXLD2wLwsMa1eMtIac=;
 b=ia5lFEflD2uSgeZJfRko+2GJKvEmnsyW1QC8PH7KPMs271kgcL3yW4MbYQvK6Mzq4+3qer06EXoiedmM9yWsutu8AfscfB2egDeFmAeUNU81SmpC1ea7uSHC16LbtRj+c+4YfBWpc/kTqgMJZdWE2EE2WXQSeVupWClGrVSpeSEOX2LOGnRUFZEo1/+Dy9ECXT07yLdkiia0kVo0ZpJv+Yhz3TYeMzsIpysHjjnV0MIXQV6gWi8zbFum6qc413ugs49Rs11BMm9wZJ32XnIBYd5ykJz9f8himzC3GIE5IA/Qrs9yE0y0wMg5IT5TZKZecwOTqs58gaK0OohkdsJ3xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1TKqd7mWqqzRUirHIeediymt7eXLD2wLwsMa1eMtIac=;
 b=LtI1DtnrwB356m+3C3pUgt+9SfyXIZPjlQsNcV2qv55yxV6xF1jAOLvSmqxsrwUy1C87vPGwj6ObyjiiuCCqd18RR/bUEzdogEXyVtxEU43S1Nvpy131MICcWWWcLntSikBGT3mgjfeMh9Y+CuucBofc/NlvQw4+7BknQT7BbXUOQBcERG65c6VeBKKMISYEkmK9SLbZBTXBqTnk9OKvbNQuSe1Q9FPv7ft19KPbPKREPGWg6eU76bNhH4QnavQLoVG/ved2mLpB5ojmFA7xrh0ab7sOZJVF5JbS+KNZAT23mWhhJrWFkSMFr7cDW+Kts4wMQxks7fci2b0WazVCFw==
Received: from CH0PR03CA0217.namprd03.prod.outlook.com (2603:10b6:610:e7::12)
 by LV3PR12MB9332.namprd12.prod.outlook.com (2603:10b6:408:20f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.31; Mon, 21 Apr
 2025 15:43:05 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:e7:cafe::bb) by CH0PR03CA0217.outlook.office365.com
 (2603:10b6:610:e7::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Mon,
 21 Apr 2025 15:43:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Mon, 21 Apr 2025 15:43:05 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 21 Apr
 2025 08:42:54 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 08:42:53 -0700
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Mon, 21 Apr 2025 08:42:52 -0700
Date: Mon, 21 Apr 2025 08:42:50 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
CC: "jgg@nvidia.com" <jgg@nvidia.com>, "corbet@lwn.net" <corbet@lwn.net>,
	"will@kernel.org" <will@kernel.org>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>, "joro@8bytes.org" <joro@8bytes.org>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, "vdumpa@nvidia.com"
	<vdumpa@nvidia.com>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
	"shuah@kernel.org" <shuah@kernel.org>, "praan@google.com" <praan@google.com>,
	"nathan@kernel.org" <nathan@kernel.org>, "peterz@infradead.org"
	<peterz@infradead.org>, "Liu, Yi L" <yi.l.liu@intel.com>,
	"jsnitsel@redhat.com" <jsnitsel@redhat.com>, "mshavit@google.com"
	<mshavit@google.com>, "zhangzekun11@huawei.com" <zhangzekun11@huawei.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>
Subject: Re: [PATCH v1 09/16] iommufd/viommmu: Add IOMMUFD_CMD_VCMDQ_ALLOC
 ioctl
Message-ID: <aAZnei9tnO8Pjy+d@Asurada-Nvidia>
References: <cover.1744353300.git.nicolinc@nvidia.com>
 <5cd2c7c4d92c79baf0cfc59e2a6b3e1db4e86ab8.1744353300.git.nicolinc@nvidia.com>
 <BN9PR11MB5276F362FA971F6A5861BA418CB82@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276F362FA971F6A5861BA418CB82@BN9PR11MB5276.namprd11.prod.outlook.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|LV3PR12MB9332:EE_
X-MS-Office365-Filtering-Correlation-Id: 175c7346-bf2a-45bd-a437-08dd80eb3548
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p/UYrMln642Rn3MqK76N0TXyosWYWo9WnVjbxLZEyCVhTgdxkv5jcrhzeBT2?=
 =?us-ascii?Q?FCbwZ+kVxAgJZYrPAA28YFUgkUIQP3IMaXUc5nkauwTjpmJ3+s92S/H1HUdh?=
 =?us-ascii?Q?uMuQjfujvP+acv+oWF6vPuci6XG1EwzYSHfhK36LG/BV5SeaGAtT84xxePNt?=
 =?us-ascii?Q?KaDab0SK/PaIOnTkHuvAR53+CeCczq6yLUSaWpb75wMAJzefekxsTpnbnGTY?=
 =?us-ascii?Q?6rt8iXwJJ55MZ63P4RrBvpDvICWep7RjA0wUhDXr6wqH0CpllIPoKqno/+bX?=
 =?us-ascii?Q?46JqFx46g/Rl7PXq8RtXfK0ta/+Jvz14uqbRelSQYVBNvRa25amchz6VvUSC?=
 =?us-ascii?Q?BxYQSn4rQEONPtpC+oEpPszPqTKNS8yXm4KFcLZrKZqmrgnmQiq0d+UnQxAU?=
 =?us-ascii?Q?VT8gMXo9LtPjMxkQTAW6tc4+jt9G/x0zt2VNYYvawGfqqnOIxMyLa9WiyMSI?=
 =?us-ascii?Q?WfuNkKnviI5PU8pVPRB8+rQrXgltntmxXWEZCV+SpCJF49AGBZTn4bHB48I+?=
 =?us-ascii?Q?vRA/ohEUnfgip6s77OZLedf/llr0cPfi7SIdlZYKjUzG18E5cFaKQOOPCqPR?=
 =?us-ascii?Q?m2qX6Egw8Iaky/pLXX7q+HvGpvczaMFG3s0olAM4cYKeB60dyFhpAMgwtqMo?=
 =?us-ascii?Q?IXeet8VX9prl0ge/1wKoFv3weBDR9qCI5RgoxuUR/oaAWOWrONeDVBJNH1k9?=
 =?us-ascii?Q?bZs1TzzqpFvqJMO8aMx3/0iYqCZJFyZkGcfuH5PoNB7j3GD81alP1CZIaWW3?=
 =?us-ascii?Q?Xr0PhQ+2Z4tZH1iSaudtu4KvgOtI0a8jfeY7Mr1YE21Zab+zkqaEWDGUlICf?=
 =?us-ascii?Q?MUH7BA3SFZEEHZsWsN50jjTGN2iWWKm7O4/Ba681/O+GcPhBvdlZrMi7N4Wr?=
 =?us-ascii?Q?C0tFENAdle0ThyBL+8Q4fm7OG4kHyS66CcBcFD6kE8uBLkakL3xp6rZeZVcL?=
 =?us-ascii?Q?r0vvIfeYWeYLdXaXLrTonFg8LYsuXjotqAlFAZEcp+dz6OAQRoHgdPIWVC2Q?=
 =?us-ascii?Q?fcmhz5NGyhUtZcpD4nSnArcvyZWX9f+zYOpaybyponBy7FTRKAe99vPetoxw?=
 =?us-ascii?Q?4g/9MYyKXRS50o0e0q2H1yDAriHSvcV6EeZE/UDNTRsnaDfVsHj+JDQgZQi3?=
 =?us-ascii?Q?/WQCcjTWU6o9S5p5elkiF3zmULczYm2Md0ZPZSLjVG2oJpwiEspIvtR1NCdg?=
 =?us-ascii?Q?/Bbidgs9WNmgtkG4OdyQTliQdUOksBRq9wuEuVi3+Q+bu6xINeyCdPjIPS1c?=
 =?us-ascii?Q?CueI4jzzictTiMIYgotYTY00/2pITYRx+iE87baszHH9nUS+0DfUzZO1ExJL?=
 =?us-ascii?Q?NLTujy3W9uq2/45QPCmXgr78M3ARdYhX39sQqkvAaILuPp+bFvUYXVDu5U6v?=
 =?us-ascii?Q?QU53LByfI13Ui3TxxaE9gPgoh7SkCWeWEBBL09j+5+sI4ecEDlAYP/iOZqD5?=
 =?us-ascii?Q?SIT3WtLDlM0jn9V6DbGSPOJvTBmO+0qAjJLl42p9S7xhkVzNZV1t5JcEBTSf?=
 =?us-ascii?Q?pdpcvtqNv55ycUs64ohopCGr7AnmdXV/NbWV?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 15:43:05.4653
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 175c7346-bf2a-45bd-a437-08dd80eb3548
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9332
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_084312_846727_049B6979 
X-CRM114-Status: GOOD (  14.69  )
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

On Mon, Apr 21, 2025 at 08:05:40AM +0000, Tian, Kevin wrote:
> > From: Nicolin Chen <nicolinc@nvidia.com>
> > Sent: Friday, April 11, 2025 2:38 PM
> > 
> > +
> > +/**
> > + * enum iommu_vcmdq_type - Virtual Queue Type
> 
> "Virtual Command Queue Type"
> 
> > + * @IOMMU_VCMDQ_TYPE_DEFAULT: Reserved for future use
> > + */
> > +enum iommu_vcmdq_data_type {
> > +	IOMMU_VCMDQ_TYPE_DEFAULT = 0,
> > +};
> > +
> > +/**
> > + * struct iommu_vcmdq_alloc - ioctl(IOMMU_VCMDQ_ALLOC)
> > + * @size: sizeof(struct iommu_vcmdq_alloc)
> > + * @flags: Must be 0
> > + * @viommu_id: viommu ID to associate the virtual queue with
> > + * @type: One of enum iommu_vcmdq_type
> 
> s/ iommu_vcmdq_type/ iommu_vcmdq_data_type/
> 
> > +int iommufd_vcmdq_alloc_ioctl(struct iommufd_ucmd *ucmd)
> > +{
> > +	struct iommu_vcmdq_alloc *cmd = ucmd->cmd;
> > +	const struct iommu_user_data user_data = {
> > +		.type = cmd->type,
> > +		.uptr = u64_to_user_ptr(cmd->data_uptr),
> > +		.len = cmd->data_len,
> > +	};
> > +	struct iommufd_vcmdq *vcmdq;
> > +	struct iommufd_viommu *viommu;
> > +	int rc;
> > +
> > +	if (cmd->flags || cmd->type == IOMMU_VCMDQ_TYPE_DEFAULT)
> > +		return -EOPNOTSUPP;
> > +	if (!cmd->data_len)
> > +		return -EINVAL;
> > +
> > +	viommu = iommufd_get_viommu(ucmd, cmd->viommu_id);
> > +	if (IS_ERR(viommu))
> > +		return PTR_ERR(viommu);
> > +
> > +	if (!viommu->ops || !viommu->ops->vcmdq_alloc) {
> > +		rc = -EOPNOTSUPP;
> > +		goto out_put_viommu;
> > +	}
> > +
> > +	vcmdq = viommu->ops->vcmdq_alloc(viommu,
> > +					 user_data.len ? &user_data : NULL);
> 
> the length cannot be zero at this point due to earlier check.

Yes. Will fix them all.

Thanks!
Nicolin

