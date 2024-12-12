Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FD2E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 21:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fRLw4xc5AcLpyt3EIClRNiGhzjkKIakMs4BLl538M18=; b=qUwHvi9HXT8VahHh3VICfJWggz
	6QDTnOu3f3AfrWb8U4IxAUbMJTHy+N1nG8jlsFtn1R+of3yBfVhR09HD6ftmYG0v4oQC7CO6rsCgO
	Dxse3wlcMI1+qW5iWQsK2aJ1M7TIVe3ESgZMEkOJEkZa1CjXTUcjE5bqxBVgYL9RwMiNYhlIJ6hY8
	GoGeI5XWm2RygUa6jP5HTBUyPU6O7j9A41oj5TqA17PBhVNx+hrcCWveJoTOk/DuuglK8NvYI/xOh
	dDEPevx2SaggKkvxGkSBxltUJttbMclOR5olM7zo6dLjdWfdzZs3UzJM4BvO19wyXehqHi9KmesIG
	E6dZ7sSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLqYc-00000001voj-0pvg;
	Thu, 12 Dec 2024 21:17:14 +0000
Received: from mail-sn1nam02on2061b.outbound.protection.outlook.com ([2a01:111:f403:2406::61b] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLqXW-00000001vdi-214W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 21:16:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0Mp/OuEOV6q7zJrBq5Pf9S1cI4wip468eY+O2cI/T4lKKz7sUsrKSFVrkuJQEsBti1S8OEEDSpa9FTRhXlpn59nCEHGnpaDOCm2EHhIJFx9JTCPlvJfNfozGgxeGx1th+msE+o7YfPb1BSqWVyfXbKC2+u1/C/UPwQXib88EucbVazRh+T9uDa5h9iVi0ir+lqka0tINDUudpAzBQuGZAXNNJU/PZi4RV/8qKSeteV94AEiOQ7gWXzNO6jaAu/OJCgvKNhuT3hqVnz/KCRS+koKkN6t46Kp7mx/QGGMNLbw/qrPugubx8mFkE4/q3nYGH5ern7NOTN6xRbpsL53sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fRLw4xc5AcLpyt3EIClRNiGhzjkKIakMs4BLl538M18=;
 b=gWHGYmlU/Juk1x9yZd3rsywDJYetFxZkl9/WSy16quUIyvJj3xBOfpB2INzIG0FyyrTN9Bb8n5sWw73ibnveDCo5CC7WnBEkeepHwiWKVUBFtdjTHsGDlekS1HW9z9e30piHhch36KXKe4taINZYAJP0QZzCUq5mnb8Sy36MmvSpWL8l/WCvjKBy+Z/X/cw+vNB2pNucviQx6o42GWGqxxF5NmfK29P9lvKSXFM2JXFS1esOfiWSMgwGVqvCPi+q3ofm9QnP8QB99q7GccYwgH/JjXsHU4wLZGRRfiY+wH71HD6Hry2B/7p2QI37D3MB1pTHOAfS+zzmUPodG28JYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRLw4xc5AcLpyt3EIClRNiGhzjkKIakMs4BLl538M18=;
 b=h1ZfqCFAmnChTvs4lDJ80iWoN9Ao/xxMIDvrMMIpwkjlVZr3imY6CHlG+EKEm5nROM3/4P4FcxJRZBQ31QK0nTMHdmrwE5GkHgeCF5rg30/njvWEI/a7f2eKvCDFffSwWVulUJSzGqZGPc1c8qYKTqhixSoA27c5Xv2iZ/2szZrXtfwltjDosmmFQyNd3ix7XgdrGFhhm+4hZCiC8G0Eu/oShNeMG1/eGxmcGHumPcR8fGXHrDwigT/s7PDIFlQzluDqW92HsRM7iLHOzpJw2uGcj1YFYgtFaBDGEya2/LmxCvOzgNEQJvSFzwuUH+t4WACD5O56ULYxCM+gaarVGg==
Received: from BN9PR03CA0301.namprd03.prod.outlook.com (2603:10b6:408:112::6)
 by CH3PR12MB8584.namprd12.prod.outlook.com (2603:10b6:610:164::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.17; Thu, 12 Dec
 2024 21:15:57 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:408:112:cafe::38) by BN9PR03CA0301.outlook.office365.com
 (2603:10b6:408:112::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15 via Frontend Transport; Thu,
 12 Dec 2024 21:15:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.15 via Frontend Transport; Thu, 12 Dec 2024 21:15:57 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 12 Dec
 2024 13:15:46 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 12 Dec 2024 13:15:46 -0800
Received: from Asurada-Nvidia (10.127.8.11) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4 via Frontend
 Transport; Thu, 12 Dec 2024 13:15:45 -0800
Date: Thu, 12 Dec 2024 13:15:43 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
CC: "jgg@nvidia.com" <jgg@nvidia.com>, "will@kernel.org" <will@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>, "joro@8bytes.org" <joro@8bytes.org>,
	"suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>, "dwmw2@infradead.org"
	<dwmw2@infradead.org>, "baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"shuah@kernel.org" <shuah@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>, "mdf@kernel.org"
	<mdf@kernel.org>, "mshavit@google.com" <mshavit@google.com>,
	"shameerali.kolothum.thodi@huawei.com"
	<shameerali.kolothum.thodi@huawei.com>, "smostafa@google.com"
	<smostafa@google.com>, "ddutile@redhat.com" <ddutile@redhat.com>, "Liu, Yi L"
	<yi.l.liu@intel.com>
Subject: Re: [PATCH v2 03/13] iommufd: Rename IOMMUFD_OBJ_FAULT to
 IOMMUFD_OBJ_EVENTQ_IOPF
Message-ID: <Z1tSf+z0fvl2wTGU@Asurada-Nvidia>
References: <cover.1733263737.git.nicolinc@nvidia.com>
 <2e2dc5c9cd8013147d4a8ee0d6c9d59c9ebe1954.1733263737.git.nicolinc@nvidia.com>
 <BN9PR11MB5276F92171A516C2A17839458C3E2@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276F92171A516C2A17839458C3E2@BN9PR11MB5276.namprd11.prod.outlook.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|CH3PR12MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: 557c0775-81b5-49d0-2f0b-08dd1af22bc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wKL8Z6T4gNCHoZHatZIyKTNJpuU4q62kS5YpU/3Q5+uZiLNOkNd6ozBrgjks?=
 =?us-ascii?Q?LRVgct4ca2e7Kr8q49/cJGAN65LH9RHSmnZM5OF6JIWHhZQh5Ltxtu1BxtGT?=
 =?us-ascii?Q?biL4fc/mYDNM9BpHjhxNBlYDUxCnrhHEm1378i8rQfvc0nbcf7qi58F9U4Q4?=
 =?us-ascii?Q?CG7vf5l1S3ZWw1APFgQOToxpRtyvuRBnJDzDbj19YALt4LiXPj5DogYLqTng?=
 =?us-ascii?Q?koGHqvPxog8m0oxo4hsVXCyJQjB/kQKbh2PrAFfLQrFd1MwyzbH5F6LS5rL5?=
 =?us-ascii?Q?TZt2GWw6oRg8hlwIZUzdXT9GUmCPQq0DsGzzuv/6y7raVJTqntastvgCwsPR?=
 =?us-ascii?Q?yU2egdSuk/mtrhLrtoUlxyJkWPlWx1I9A88KMoMx7WcExNNcTbEJT0gZpRrH?=
 =?us-ascii?Q?BIGJRRF4bD5LBATVol9RQlPhlk8ex/bZ2YMSeYUWHDXYL3EOKxjHRC8symYL?=
 =?us-ascii?Q?EFIxAslpIOwWm0tqc4YW80jvCGdbiXEaCBMy/XVicn5lVZngSMTAqtmk2IPM?=
 =?us-ascii?Q?hK7Iix3OyOP1wP6eYk865ijsdvh+fi2w9LxvgT2iTxnaM5x7lPXsqHA4AiAB?=
 =?us-ascii?Q?AIRqAlB1y8zNISHlOHp7AqXDm2phk5JXx/ohzhOou1vMlozAV3OXQt+bgTgl?=
 =?us-ascii?Q?PDt7+twiqq6C61ksUBcX1gXHJGp/dd969vxYOHT9vEp7lmrc9nixqlBnawoZ?=
 =?us-ascii?Q?Hn5faQVDdwffYICYWbKXdssIc29VD/yujCL7I4BvfY/xuoug12+6juUn0AIy?=
 =?us-ascii?Q?RGBdn96SCvEmI9gOfAhIzOlYgYoc1FtG7BKr2MX/WTGF05sXzhIOtv6BOeal?=
 =?us-ascii?Q?IVpmsm6O02qkQ6uvCIAmhLXBkDIRpWrV/PrZc8BxtXUtH4c1V8X+gyDSQNzO?=
 =?us-ascii?Q?se8EsZ/SWIAOBwLjyrTxAdcdFRRq0c2WpgLcwEV0nmNhVP7V5H6/T3QFquYt?=
 =?us-ascii?Q?H82zuLnJUsaMt5Og4gr2UIyay4BUbHcRXu3uUufXWbgn9X5WjiXZKujc+yIW?=
 =?us-ascii?Q?uuY3p5tUXTSmPOUIeLN7TbMqpptlXL/msWktmtS+eJH8Jo9nP4e7u8DYpwO4?=
 =?us-ascii?Q?Jsek9mISq6FMDIh0odBPvvmh2yL61L9SbWux95UlIARAhT7/AizVqo+VK4a+?=
 =?us-ascii?Q?+buT3/oK5P9JF2PFGM2bfzIChCsd3SiQukXpk1R8m68a4QOhKDOt40N97dh3?=
 =?us-ascii?Q?eTep+dG7h3dc9RSrTw66R8ZDtkLBfi78DTKv6NYaLSXmu7ds+aT2ve4osbcS?=
 =?us-ascii?Q?FyIlvro5IXcLl7jl1ap4SYKAZs7XfeQBNHNyfmfi5Sp5qnqJLAio2fbR6b8J?=
 =?us-ascii?Q?eDzzuUsceVFQKtnOGpgi3RmgsmtE2Whtk3ULj3YHSF/boqKydCytI5nekWVy?=
 =?us-ascii?Q?i6GPlaQiwpEWq6+FE1Ru8oSM6ZlehcnSkyCVXdgfURFI8K86gsfxRGSub3dR?=
 =?us-ascii?Q?SSdhVfrFTgwRnLF8zsQzTWf11zgZyZyW?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 21:15:57.3026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 557c0775-81b5-49d0-2f0b-08dd1af22bc0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8584
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_131606_513730_262A1F63 
X-CRM114-Status: GOOD (  19.80  )
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

On Wed, Dec 11, 2024 at 07:40:52AM +0000, Tian, Kevin wrote:
> > From: Nicolin Chen <nicolinc@nvidia.com>
> > Sent: Wednesday, December 4, 2024 6:10 AM
> > 
> > The fault object was designed exclusively for hwpt's IO page faults (PRI).
> > But its implementation can actually be reused for other purposes too, such
> > as hardware IRQ and event injections to user space.
> > 
> > Meanwhile, a fault object holds a list of faults. So it's more accurate to
> > call it a "fault queue". Combining the reusing idea above, a "fault queue"
> > can further rephrase to an "Event Queue for IOPF".
> > 
> > Rename the struct iommufd_fault to struct iommufd_eventq_iopf that holds
> > a
> > common Event Queue struct, similar to hwpt_paging holding a common
> > hwpt.
> > 
> > Roll out a minimal level of renamings to all the related functions.
> 
> could we keep iommufd_fault? Internally it will use the new eventq
> common struct but external facing names are all still around fault.
> the size of changed lines will be much smaller.
> 
> Then later for virq it could be iommufd_viommu_virq instead of
> iommufd_eventq_virq to explicitly draw its connection to viommu.
> 
> this is unlike hwpt where 'paging' or 'nested' is just decorative while
> 'fault' or 'virq' is noun on its own. 

It's a personal preference, though I don't have a strong opinion
about it. I can change them to iommufd_fault and iommufd_virq --
feels nicer to align with the other iommufd_v*: iommufd_vdevice,
iommufd_vqueue..

> > +static ssize_t iommufd_eventq_fops_read(struct file *filep, char __user *buf,
> > +					size_t count, loff_t *ppos)
> > +{
> > +	struct iommufd_eventq *eventq = filep->private_data;
> > +
> > +	if (!eventq->ops || !eventq->ops->read)
> > +		return -EOPNOTSUPP;
> > +	return eventq->ops->read(eventq, buf, count, ppos);
> > +}
> 
> the check on ops can be done in iommufd_eventq_init()

Ack. I think that's fine since we don't have a !ops->read case.

Thanks
Nic

