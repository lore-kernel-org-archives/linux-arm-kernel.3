Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2265DD149C4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 16:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tHNdCPpM2O+butzQDqs8QZNVpkjUU3guD1lgMZTy2j8=; b=tIbnM8CF09ZuVjRhXdDhDKK8B2
	z4c3F/9WSp0n1Q5d+HhTfp+p+Bw3nzg5HyfzjdunAjMZ/um448of+pSgbq1aBipFlQO8XMla62Wcn
	PyxZB+zfZpqkUeZ0k33jA/hakH5PxZuiYHjBLzj5e519axEPrvO8bsdD9y1ZYdvPh/jpk5nTKzbAH
	2RkZ1fpzM5bs/qn8gpF3pcV0BcC0uoM4YjpAD7bCOTLF5XlRW6eFQkuBPjvhQDjyiFq0U2mah//BC
	vjfPvEdxJP8zmsxEKkuQxvynaLJVhCsaxb5CHiC0plnoGY6XhjOPWaFDkJ5ODNbHKWyEcU/yWXkDE
	42Gc2BMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4N6D-00000004QY4-0zoE;
	Fri, 25 Oct 2024 16:23:41 +0000
Received: from mail-mw2nam10on2061f.outbound.protection.outlook.com ([2a01:111:f403:2412::61f] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4N0c-00000004OEF-0Dkf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 16:17:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pnrwobu/AgTxAg534ITKfJCpEZ7ypV7fppg4/dqQmVQoTvqzyLa7eXh1uLaBmI1Z2gDvGFjVNy2ZM0xCKGbluvokwLmJs+l8x4p0Fa6JdEGStdkqwcID2kSB5Mx5j5m/m1J+qwRyr12IBZjG/HYXWiuxmC98imKe8cMblc2Y881dAnJ0CbZVBBllcCws/bfjND53XbpAU2zik1GmTu8We9BmDpm5jDVWm4opkVlB/v8DCOZDsQnpXyDkZjQKwVRwPIIKU7c5YXFeb8/XlY62JnGjLFF1ulxI9P/ST4dFogO07sz/J/HIARtTmXi0GSOjqFpI/pzoTAdY1NaiczwTLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHNdCPpM2O+butzQDqs8QZNVpkjUU3guD1lgMZTy2j8=;
 b=lA1wb6MS/cDRtT8njZv0T35wAQQYEM8k64x+xqDhiMcoF1Z+oRTdvugdypHokZPZQWM6QtF9f3ARCdV4XjB7v+d8k70aDcuDm1tlIUHT6Ry5C/TR0njuSSUHdrtsByJ1Lj0KumYmDoxpPlM0Uep3ZQSSrBM8dAQGACh0Kfy3K8bfzYOYZZgCG9OkdUkCEqJ8wpncq2qIHafTTnEptckEBZmFDnG9sba544eH23yR93vH3Fb+GySUuRkzBMkF+UCacilkA+NiOCAq6ttJdCFOOEMm7gI8EhkKmhr3CipoF0KwKaLp2FGWi+ER6md3D3G6xARnQb20oO0XJTK9iha99A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHNdCPpM2O+butzQDqs8QZNVpkjUU3guD1lgMZTy2j8=;
 b=nVVB3evhr8V86Uonfxdg1mJ+sJjjjGMQxNPzTT2IBhnXhN1ee3AWILe1MZ0EQjjsjvitAvxDCsjmdjhGuQNR3N686MLsROkKVxbYaHhsOJdUZh6VMd7bPh3JznHoV9W6UMmziiialZck4e4QaJOTkh0vhCrzxKUbZtO3M2WuDeqfxuT4FKf+JyZD+EXpo9HYiv8yDzWeuFirpvsuHP6zWtv0WJDr7+2hL/KUf3Erxq7uvTFWqXkBUQGXMhVnvkogV8YJjVv54ngGpRRWTZ1NfIENwn5CdKUcZi0jqECOnsQkx5E9pknDIopZhlqU0yCzHvZ+q2xfMG8HPNJMBXQrmA==
Received: from BN9PR03CA0630.namprd03.prod.outlook.com (2603:10b6:408:106::35)
 by IA0PR12MB7532.namprd12.prod.outlook.com (2603:10b6:208:43e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.19; Fri, 25 Oct
 2024 16:17:48 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:408:106:cafe::9a) by BN9PR03CA0630.outlook.office365.com
 (2603:10b6:408:106::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21 via Frontend
 Transport; Fri, 25 Oct 2024 16:17:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.14 via Frontend Transport; Fri, 25 Oct 2024 16:17:48 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 25 Oct
 2024 09:17:35 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 25 Oct
 2024 09:17:34 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4 via Frontend
 Transport; Fri, 25 Oct 2024 09:17:33 -0700
Date: Fri, 25 Oct 2024 09:17:32 -0700
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
Subject: Re: [PATCH v4 04/11] iommufd/viommu: Add IOMMU_VIOMMU_ALLOC ioctl
Message-ID: <ZxvEnGCNYJZYTwf2@Asurada-Nvidia>
References: <cover.1729553811.git.nicolinc@nvidia.com>
 <9da2cf334a182ced4d4ffa578b87889e9c0856f3.1729553811.git.nicolinc@nvidia.com>
 <BN9PR11MB5276528AB82E7C8AF53FBA1D8C4F2@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276528AB82E7C8AF53FBA1D8C4F2@BN9PR11MB5276.namprd11.prod.outlook.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|IA0PR12MB7532:EE_
X-MS-Office365-Filtering-Correlation-Id: a702fcb1-6767-4945-60a2-08dcf510913a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|7416014|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/28XlbTX0m12q3bilvEr6gxiqdxZw0qjR6ZinRhmCuHA48Vwms7MfVSEhkUV?=
 =?us-ascii?Q?Gwz+tAQfFljbAa9Cz8d5HebIxxjhSdOxHcZYwVd7k4jHgFoo48owhqz/RpCM?=
 =?us-ascii?Q?+VJJzC5uf8H8u7RtmwvrOSRdOicGGGWWFMs0+WbWZ+sIVSkqickgdrMwMbEh?=
 =?us-ascii?Q?Yh5umXQ4nXs70bHCinUS3KJtBRVHp7g795/HXQJHquNZ2G9JdmNW74UlTLnp?=
 =?us-ascii?Q?qAVA89x8AgHvbvb8YTbwbZfLcw4yGjjGA9/jnr//AVz1KKBrAmR5eh3SXFLS?=
 =?us-ascii?Q?cN4KoVYIsWXka9AKuzFK1/1tbBe19wd5IDE0ZZ6Cg78ZNk509xm4uv8ho2Dh?=
 =?us-ascii?Q?wJu9+mzIme/VznXixVIzipkDqfWThoRStbX43JMr7MX+F0mAYYSy092PWRvg?=
 =?us-ascii?Q?1o37aQ0j0zOI9K1ZqUIcnh9XEwGYmqN3U5lPu3AwQE8SsePKLKuZJoiP+Ph7?=
 =?us-ascii?Q?SDh9hsX+GjT003BQKTyj7EXuDpSfWU4+wGkBLayq6pp/edyPRzdXT2X2n/Lm?=
 =?us-ascii?Q?qi7/SaOjRg4QEfxCPaLZ+LYm9GxcamjpITE5/pjKc6CJrZR429ucIEIK6rqB?=
 =?us-ascii?Q?s+cVtgq0VHNsQv5KodS7okPmzXeSoRu/te+2lKFM11c/+NNpeeV6223BUJcH?=
 =?us-ascii?Q?gRXN0N9ORCaFN/U9azv3r9ftnI0xhozhTF0IqHGYUnquW0jNGjlqouQjU621?=
 =?us-ascii?Q?7mIT7We110H6fWozPNCXsyuvSrWHvmNE5+HITH5G7yQJMBNCu3LI+QtFoqQn?=
 =?us-ascii?Q?k3zHQkJ/jgf1hlsWKXN1bkO6NtfTWKL5hqu3fbdF4/4hAXZslsL6eyhCSlLq?=
 =?us-ascii?Q?7KVJAggQzvVJDRP39gqShnDQC4gL0vOQl66j27r9JLO9cg2UdftDmtOETs+1?=
 =?us-ascii?Q?w7F0NiO47uJCkmkkKXLvxiWUADoUo98gazekbCj0MtVfZP3Gv1bJ0dH/9Pb3?=
 =?us-ascii?Q?/I9CyC6qZW19vMogwdKIcc01ka8d8/bEaUpuyhlLKgFWye0WJVZmDPvtjm2s?=
 =?us-ascii?Q?vej9mcqsO5crnvTNKbf6KjgLT61s8UJvArmC9wFJXVpTMFySKP1u6fqHkbxA?=
 =?us-ascii?Q?H1YycZcJN4kP3/rHwwl1IHTbaREKOo4Dk+/0zZcZ8tvL71yF1rruhTpSUZ8h?=
 =?us-ascii?Q?hQFsJAjqOZ0M2z0BopsH8kloiRefrdCPExu3UllNb/s4DzeMAWs1jNlYNUCg?=
 =?us-ascii?Q?du/vS2xrATqGyj8RhtNJA7lx7pQqS6Z7J6ICeY8QYRdaTHPXI4tqSUs6U+1P?=
 =?us-ascii?Q?tuSGnW1Mtar53XVE7pPntXJXDFrAmFt1I5l6Srg60Um2KcSQLByx13O43wsr?=
 =?us-ascii?Q?61tcGSeC/Ozazbxqmlasig8PZv5LoqgPfZ3DVwAN5HFwacoPZm2937U0cash?=
 =?us-ascii?Q?ceL/Tc62Y7CszPof+4BILJhkaYFtrKqhNeFtO4KKpkWVflEmNQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 16:17:48.2540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a702fcb1-6767-4945-60a2-08dcf510913a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7532
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_091754_121712_A6AD5CAC 
X-CRM114-Status: GOOD (  10.23  )
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

On Fri, Oct 25, 2024 at 09:05:58AM +0000, Tian, Kevin wrote:
> > From: Nicolin Chen <nicolinc@nvidia.com>
> > Sent: Tuesday, October 22, 2024 8:19 AM
> > +
> > +     viommu->type = cmd->type;
> > +     viommu->ictx = ucmd->ictx;
> > +     viommu->hwpt = hwpt_paging;
> > +     /* Assume physical IOMMUs are unpluggable (the most likely case)
> > */
> > +     viommu->iommu_dev = __iommu_get_iommu_dev(idev->dev);
> > +
> 
> so what would happen if this assumption breaks?

I had a very verbose comments previously that Alexey suggested to
optimize away.. Perhaps I should add back the part that mentions
adding a refcount for pluggable ones..

Nicolin

