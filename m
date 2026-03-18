Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 380221077610
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 20:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QAZwWZvsW61xPtq3RWf9T/TdjD/SNL9Gb2z+SAeeNBI=; b=rTKLiMo2N4/lc8z1+sOWltaeiT
	s4O0Z02rjkhEd7rbFfX085kXI8FKfl2M1xlOKmEJFhg8XpRFdP4a64yVJa5tk0DhOj7sdOR8FCMvR
	Xi9egksQFcN5bqpcGb+DkWniwxD+kMT2jsRLE+nHdeKWECuN/mGm7hMuQ5uMVAvV7rJwWRAWBw9s1
	HOoTQxtCTNrTyXIhbL40fCKYEVxbOFXI4922/ikygQuXtaS+rnFYszzbsZee/jXHSctgN8Dscyd9i
	cj2NE+OFeRaxbUxRAJGDsQiWbuUzrCmwbaOu0zKzeI0D95IJ+F9R1mRlgKJEn95G/qWp5/47QA4JU
	uQiRYVFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2x4m-00000009GRb-0uhd;
	Wed, 18 Mar 2026 20:01:10 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2x4j-00000009GRF-2gw4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 20:01:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XhZovrG42DxuPuGmZjQN3hsr/7gi0Df5DR2OfE0l5tncMDR2TK+dZuwi6EOZylTp0EGm5n3ZiBHteyAoFRROPyHn4AHm5wVCeDhu413tXz962c2rtjvj/ONywyE1L4BaicvIx8zc51jolFvytmw/mV0yQm5URaSX8RwNoL+pul2m87NtO/2jN45ScPCq2wufQykUHECHwshq9KPThOfIPQ+dRaSsR3endsm+WgeNnUh9WBIXxy1vVh7vCGhZii5i+kO6+zsRZBG7CkQsNYHtKZ0RzAk9IAX3svNqzloKH/DU2HF5L3MdVjKwsFDJRTUGlUpqZzgD4q3UdeRBeJiC5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QAZwWZvsW61xPtq3RWf9T/TdjD/SNL9Gb2z+SAeeNBI=;
 b=iAKwzBFM3+4HwSu3eo6C+eWYdU9kYOrCwmd3ebEG7Ro7kYsERP8Ej3Uuy3eaKIdXhmCD5CYbCtYWiXICpMdDCfXD9U5zB/Po2HR8KniIxzCRxVFPm6K2abHCH//MnIE14PJGqk2VI3bxt1h+jpIaegd2Vt5qaA9W9VnTnNWvv797QG3A/RVgUxOCbe56OEeD9IyIbNiqhGNixh2enO1Fu0f3XJjw+Nj7qK7WdDSsm9rWWkGOzY3dhpTXd0+143HkQmwB9dr7MvQq0W0XvI7nmLLSMT7JSF9wEah1RkPR3/y7c8m0swvZhDme81YLCHR5YUVQMyQAvjqvwMPkTBqlhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QAZwWZvsW61xPtq3RWf9T/TdjD/SNL9Gb2z+SAeeNBI=;
 b=C8HyPIpnWXRH4qSWHrTc245Apq1lFo5ZKdVT3WAeS563v0bgbYnuDUWb3IgnrcjOLs1XceRRH/LUXngL9NssBizJk9K1hVcVGwH6TR+pXrV2cnmD0noZvLFDDZCfANsyYmJVoXoY2QmXRUnC8xGjOvegPXhIs2K3HteN8QZb8HGJM+SaGEH3FrbN8VeKb9myCjfMuVKYGNHscPcv8FV6Rh0JYo6ta8YGh34nJhAj9/OhYCfPbQzMtGDVYFkESLm9CSWIpCc/ipm2y545PUz1rjV232Nc4D+akuNibgPMFG4dYbSUyzulKRwi+aY6L2aUO07BFhapwTmxPeIV6lPRkQ==
Received: from MN2PR14CA0018.namprd14.prod.outlook.com (2603:10b6:208:23e::23)
 by DS4PR12MB9745.namprd12.prod.outlook.com (2603:10b6:8:2a9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Wed, 18 Mar
 2026 20:00:51 +0000
Received: from BL6PEPF0001AB55.namprd02.prod.outlook.com
 (2603:10b6:208:23e:cafe::10) by MN2PR14CA0018.outlook.office365.com
 (2603:10b6:208:23e::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 20:00:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB55.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 18 Mar 2026 20:00:50 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 13:00:27 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 13:00:26 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 13:00:25 -0700
Date: Wed, 18 Mar 2026 13:00:24 -0700
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
Subject: Re: [PATCH v2 6/7] iommu/arm-smmu-v3: Introduce master->ats_broken
 flag
Message-ID: <absEWLLh9RgMj3mC@Asurada-Nvidia>
References: <cover.1773774441.git.nicolinc@nvidia.com>
 <c101108ad1e52824dbadb5d35a534584be28824b.1773774441.git.nicolinc@nvidia.com>
 <BN9PR11MB5276CAF65238D9818D3D8BC78C4EA@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276CAF65238D9818D3D8BC78C4EA@BN9PR11MB5276.namprd11.prod.outlook.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB55:EE_|DS4PR12MB9745:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d014859-bbea-4643-3f4f-08de85290dea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|1800799024|7416014|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: vpjLU6Lg8sX3KAsOCUK7Wz3LTU0I5H9DqQRXFhdbmPFlfEQJUfVeNEaleh9CYkSfjUsavMHG9ujFHQkrp0j/c1/YCk9rtYfPNPA6f+2hHnHfVQDc0ViQAx4a6ZkHvMKMJtFXARVx0d5xDFE3HHVuLwEzABin268Ve4q3hN9tHEFpNLnTbIei19iYx7ti4qYMi10pqzU3CtTPXTu43a9VGowLBHGlcXzEOX+CyID7fKqDvdBEksINrTeZY2vEhixT81T0CXmdG8UjohC1lGEAuzBRiIy4pIar16ON/KSjPPdwfW+9bY7iWmng2li5fwpcDICD8Ix8atx1FRGz3LAl6bgZgGRwHZDoil1gF1sWTyFMSMQmR+/5dNhsCf7Hw8HNkShz/c3xV1pCTdXQCjmP50DQD/wuEtVTYQzgDjWN+wa1V+5eFxrLaSwrBBJOYJDfnO3JJ4nHL0YfpsxNVKdX+6zu5WatxJCdisskCBMacox8r2tPDp1KPci2WyYC6ptwp2hfZgwX5DjGTc4HAwkZv/4apvjq34Mivd3Z7vKupbr/iBye9bK0knQHmf/LKt6jg/9v2Al1AFNDNxPcaNcN7gh22+FIUuA650OT1ZgCW2xE4z/3g2Jka6r8TsBsKjebwB/qNmvwZcRhMkLiqdWRcIDPwPY5IjckPODexEfuERoI0y9dkDxfHUOxysq+yM4g+euj+isBBbQ0+aLIFYpaz2jsO2nyv92v7bj5YofnBuEs7UhFJuZ8NGN/ob5Ov5/tMPAHCasZhmDs2FE5Ex51eA==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(7416014)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6EkKcg2zrvBXfG9OnFPaQ9F5yYZnDVRLzmPdzdeKzvIDLP+ObSlSI3ZpGJV1KoDxYdfQTsPvTo3M8qV0uGstNJmJwPbxMIJhG2BhoUefCfw5cBepzkkp09l09REbrP6TgSGcg/mauv85oLNzhFmFDTCgyCsyuAfgfS5inBtNQegy1WmDxbvzPaNQTcs8lzFPDfRWBJz5KTJs5+eR9lQWPhpsW+fzprCRaj79W00FY/da0jKmIHi576k4SHJNSCXC82TLgnkdPgazGUEVc/grKtv4MqVwzuuwNagdoX4zYjXbn1dOE1BcB5tCCbRo4kXjFOE0x/3WF/Z+x7ae8dow3OOtaXlin41J5M1YQC1ZmnSykkHu2jGcLM5hvsKIhMw9YMSsaAOYxC0mqMI0UjqBiTG2dhAsE0HtDv5yqPHmPDCg723ugn5uRXi20KAaS0UO
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 20:00:50.4922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d014859-bbea-4643-3f4f-08de85290dea
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB55.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9745
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_130105_882156_0A895C2F 
X-CRM114-Status: GOOD (  15.88  )
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

On Wed, Mar 18, 2026 at 07:39:53AM +0000, Tian, Kevin wrote:
> > From: Nicolin Chen <nicolinc@nvidia.com>
> > Sent: Wednesday, March 18, 2026 3:16 AM
> > 
> > @@ -3060,6 +3079,14 @@ static bool arm_smmu_ats_supported(struct
> > arm_smmu_master *master)
> >  	if (!(fwspec->flags & IOMMU_FWSPEC_PCI_RC_ATS))
> >  		return false;
> > 
> > +	/*
> > +	 * Reject any new ATS request because ATC invalidation was timed
> > out.
> > +	 * The PCI device should go through a recovery (reset) and notify the
> > +	 * SMMUv3 driver via a reset_device_done callback.
> > +	 */
> > +	if (READ_ONCE(master->ats_broken))
> > +		return false;
> > +
> 
> "Reject any new ATS request" means any new request to enable ATS
> on this device, instead of rejecting any new ATS translation request,
> correct? next patch does the actual work to block ATS...

Yes. We won't call pci_enable_ats() due to !arm_smmu_ats_supported.
So, there shouldn't be any new ATS request any more.

I will change it to:
	/*
	 * Do not enable ATS if master->ats_broken is set. The PCI device should
	 * go through a recovery (reset) that shall notify the SMMUv3 driver via
	 * a reset_device_done callback.
	 */

Thanks
Nicolin

