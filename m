Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A67E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 21:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ydPARcREor40sy81MWPMmAqroHeXpt7SvRqSf2oB5W0=; b=ZHpnHfttz1gstqdE2MEFv+kb8A
	fFFg9omBFDtDpZoIEj0YSrbcw6JRkcgpi1cPu7i/Yi8oG7z+/F04oDAGjjAnvlS4h0+ihZlyp1ZvW
	4gdzvfASEN3Ur0xDe8W3HR7oJ5lalij2IP42zEqTnczZzKpAskrCBoy609MxA7RUqZaUm3qK5pbdW
	tLJOcgtfUJ51UscX3z8KQhThoooN/GzbujtosDh7rpwFhvDuhQbj2XKxDERG1TxdU3gXvK/2jNvLx
	e6vA45n0DJ9EJeRuomOYQj8bSZ0F4xbZ8izuxoOSEN0fCK0j1RwnFoWvPrHnAhrvc1fFUq/s85nSe
	tKLjX6Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLqka-00000001xZI-37aG;
	Thu, 12 Dec 2024 21:29:36 +0000
Received: from mail-mw2nam04on20617.outbound.protection.outlook.com ([2a01:111:f403:240a::617] helo=NAM04-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLqjV-00000001xII-43V6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 21:28:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yU5+nzxQGHn6d9VWllLrJepyRHlSkiJH1TBvbcZGRB3QrRUss6qiK7qp00Lc17W6jIlNFDDA/Y1AjiPLhRVblxGREnbnFiC8YOzXi7nP9GVL16053b8qEUQT3EFRgKFqgvCFUoQzNPJzzRUKWzo/yudokfbPzRlKELFOIGNT3EXb5HczmQ51p1yA2xYxDa9d5KO7/0wp9/HoVElYmwPZN2vCiz14NDz7aPua9cjwyMb8ZA7axxUvVBdf4EafY2sgDLcCDSa9hjZXMkN3R8cI+YXidmLEQJiHtLMsH17ZfCBytgRFzFi4jXqs8L5KqIw6a8GrRdbU8FRcG5Ssbl1rJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydPARcREor40sy81MWPMmAqroHeXpt7SvRqSf2oB5W0=;
 b=vQZ8+XxeDLMmPK2yPBRSGKZfI+wRdtjuYaRYt8CkkvA2olY/r2y1iopZ/wYzFDOYIoiaoRVFh75lqdnBKuh27jVx75ndMZ3uu4Z11VGPdTVWSP625GNuN2qyEpDfR3Ccil8lEvzlo8SVLFPI4IiI/otxgrSSmgkK7eKazZT9vvjVB+HvKkj5/yMaUJaT53kRvtFPBKkYTJpUSrjLPw9PKJ53RPYVdYWfk69ayF6fhmw/001fH/nabYszIJDAQWtAcg1T/poIlp6t32wMMIzmd3xgwCvUUvaf1ucJLo8TM0g+P687Z7CihNkPl5zuL77e3EjEMKTYv1MlH6Z0M3b1pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydPARcREor40sy81MWPMmAqroHeXpt7SvRqSf2oB5W0=;
 b=fAhEfqPh7R0vl/1gMCL79+nnTa8eMTmy/DeG62rtjBRaMkeKMJqIqh/LrlaJi37rW1seU8VqwqNThlnXE0nFXVodQuHUpRm78SmY4BEvggLj4UYu1cc6QrcxM55HQe/8TIgWbGEK9hXVchf67wWvFAbktLyhIfzFRaTbYxB69IkwBIphl9/aJ7y9ftBmm057xQRt5ZvnNsNzcBEw4/XAZJonJ4MnWVujqcFjdxYHGgw/aNBWaYXdIh2pQ40JzSFcw5bHlheBC8iUGXdFDuLbIkIiqJ5ucHEE0zi/Ngh8kkYsAMMo84VfPcIUkbNtWsizUfJdCUOVCxx9z/FiBsnYOw==
Received: from SJ0PR13CA0131.namprd13.prod.outlook.com (2603:10b6:a03:2c6::16)
 by SA3PR12MB7976.namprd12.prod.outlook.com (2603:10b6:806:312::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Thu, 12 Dec
 2024 21:28:22 +0000
Received: from SN1PEPF000397B0.namprd05.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::a7) by SJ0PR13CA0131.outlook.office365.com
 (2603:10b6:a03:2c6::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15 via Frontend Transport; Thu,
 12 Dec 2024 21:28:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SN1PEPF000397B0.mail.protection.outlook.com (10.167.248.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.15 via Frontend Transport; Thu, 12 Dec 2024 21:28:22 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 12 Dec
 2024 13:28:11 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 12 Dec 2024 13:28:11 -0800
Received: from Asurada-Nvidia (10.127.8.11) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4 via Frontend
 Transport; Thu, 12 Dec 2024 13:28:10 -0800
Date: Thu, 12 Dec 2024 13:28:08 -0800
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
Subject: Re: [PATCH v2 11/13] Documentation: userspace-api: iommufd: Update
 EVENTQ_IOPF and EVENTQ_VIRQ
Message-ID: <Z1tVaIdD4lAjpP8e@Asurada-Nvidia>
References: <cover.1733263737.git.nicolinc@nvidia.com>
 <a5025cbbd16f9c12dcaae7a14868419f17ce1d16.1733263737.git.nicolinc@nvidia.com>
 <BN9PR11MB5276E09D5F2206804A7C15968C3E2@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276E09D5F2206804A7C15968C3E2@BN9PR11MB5276.namprd11.prod.outlook.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B0:EE_|SA3PR12MB7976:EE_
X-MS-Office365-Filtering-Correlation-Id: 33668690-262c-4d15-9f57-08dd1af3e7b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3shIGpO4jzzoKIliVRCq3++r0lvL+b1UB0UxcYsqTz5a37UZSgPh+wq8F8LT?=
 =?us-ascii?Q?2UntGsl1D5ugD6MTs3L9GkmOHwKfdydMZ46n1MAxb4HH0tgTtEABHyCDO/pI?=
 =?us-ascii?Q?YsXINAAECUuIwZYFKZFy/dJYeHUDhhDmx8ErDVOA5DuShmqgd1Z4Cy7BUeCp?=
 =?us-ascii?Q?zkIH1d+tXbRN4+pVoMeLGF35PBLcT3euInPFWnAVNxgFTUXGJP+5CPqwbGx9?=
 =?us-ascii?Q?HlKh/yDZrw8tZs3mGVfOiNhLEc2Xzo5riYpNHSSLvO4FpQxRikLqFDAwA+Af?=
 =?us-ascii?Q?H50GDAJCappXAbNukRp/SEFkNeNBFEvE0yJ2Azv/tiK07MYNclKxXFnIGuHl?=
 =?us-ascii?Q?eT6W4ldSGgyNeSgUiNXSGJIsdwHxKtZpudcC/OYJZ0CcLuqAQAKwnkDp7MI/?=
 =?us-ascii?Q?xUGQMh6TvCRf6GLYPWwj6xaUKvBpubcdL/wEU4RDa/rbQykrK0eaS6pSwv9Z?=
 =?us-ascii?Q?pke6gb0xUAJgVLUbC4yHAbSqGoSDSLFiVNLufyExwTBGoKbB6oWmeTsciw5B?=
 =?us-ascii?Q?u6hJfwoAk6q3M4fKUDlNddQNqZiTTjMK7iVtZzUVcYbyhw5eU2Sfh3RQbaZd?=
 =?us-ascii?Q?GxIDbP8DQAvakPQR9HW+3SPznb0UKEPfnpRDCZC/f4i7+sHwiC7K3G/r8TlF?=
 =?us-ascii?Q?GQuH6B6idKGuOmxVSYv2F4ooz5HMDHybFMC5gqrwQYMuZdAym1cQPrNLFt3m?=
 =?us-ascii?Q?Ni4BRge9GXEq7h9M3mxGdfnspSC8tyTvlJnQl+fA35J2SFoLjoAIvPvd/Q6S?=
 =?us-ascii?Q?9kx081ERbIr9vti3PBglCU0AMsLR2z3ZH3n5FALJwPc13i7eeIib7MkVhRAZ?=
 =?us-ascii?Q?1Rw/QH3ILFI3cR7GoqS1e5pDTRqCtjB1S+O2E7ysSSxQjdXd2Zf/9/Flt/Xz?=
 =?us-ascii?Q?/uc6lD/Noh4t9/YaRUYFGb3lXGLRnRZ6EUYim5oI3eTsC6qM8JKPfBy1bS07?=
 =?us-ascii?Q?OF9S8DP0Kf96zIBh2dJrYn7zrOjdNrzVgcd4aq4JF/+/DGunCjwfqtOVC8lr?=
 =?us-ascii?Q?/se5UPjvv61GTrCFaSz/LFv9w/L+NdGg/VcoQwpUMZSahLyu4TwDUvQ4a8+h?=
 =?us-ascii?Q?hiHFGYqBbpoU45rLLsHkLp3CRGAH9YjrSJWnk9P2FQPJod9POiPqXeBrpKMF?=
 =?us-ascii?Q?KyrloYdtAOly94OPOjTtY2WOf9fEsCs+/W163Z8ND+hBS8+Qjh6/6l5k8Zo0?=
 =?us-ascii?Q?fwYPPyqJducy6y4OmFVArXCgFiqFS/3D+WuawSzp6ZVoLMNrAEt4mXJ1KrmL?=
 =?us-ascii?Q?LhmZbpEdDUKXlOhhWPnhpgM4Y20Odzof337e4UaVNS9XyZkwEzCrER7HdxmA?=
 =?us-ascii?Q?QKCaJnsMsFXSCj7RFSzRkSIGYoYLnbWUTJLXMCFuUjiW+TxsNkPrQ0rYyOXn?=
 =?us-ascii?Q?FtQtlMlokyGJ6nQm7uP6rtGhro8a7VHBHTZge89UiwOiPY1M8nLXZXUQTqeH?=
 =?us-ascii?Q?f5qZlDXniSp391iNdQrDTFLgBiNaCQul?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 21:28:22.1715
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33668690-262c-4d15-9f57-08dd1af3e7b0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7976
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_132829_999387_92A31ECB 
X-CRM114-Status: GOOD (  26.80  )
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

On Wed, Dec 11, 2024 at 08:11:03AM +0000, Tian, Kevin wrote:
> > From: Nicolin Chen <nicolinc@nvidia.com>
> > Sent: Wednesday, December 4, 2024 6:10 AM
> > 
> > With the introduction of the new objects, update the doc to reflect that.
> > 
> > Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> > ---
> >  Documentation/userspace-api/iommufd.rst | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/iommufd.rst
> > b/Documentation/userspace-api/iommufd.rst
> > index 70289d6815d2..798520d9344d 100644
> > --- a/Documentation/userspace-api/iommufd.rst
> > +++ b/Documentation/userspace-api/iommufd.rst
> > @@ -63,6 +63,14 @@ Following IOMMUFD objects are exposed to userspace:
> >    space usually has mappings from guest-level I/O virtual addresses to guest-
> >    level physical addresses.
> > 
> > +- IOMMUFD_OBJ_EVENTQ_IOPF, representing a software queue for an
> > HWPT_NESTED
> 
> now it can be used on paging hwpt too

Oh, that's why it's in the common path in the hwpt allocator...

Seems that we are missing its selftest coverage for paging hwpt?

> > +  reporting IO Page Fault using the IOMMU HW's PRI (Page Request
> > Interface).
> > +  This queue object provides user space an FD to poll the page fault events
> > +  and also to respond to those events. An EVENTQ_IOPF object must be
> > created
> > +  first to get a fault_id that could be then used to allocate an HWPT_NESTED
> > +  via the IOMMU_HWPT_ALLOC command setting
> > IOMMU_HWPT_FAULT_ID_VALID set in
> > +  its flags field.
> > +
> >  - IOMMUFD_OBJ_VIOMMU, representing a slice of the physical IOMMU
> > instance,
> >    passed to or shared with a VM. It may be some HW-accelerated
> > virtualization
> >    features and some SW resources used by the VM. For examples:
> > @@ -109,6 +117,15 @@ Following IOMMUFD objects are exposed to
> > userspace:
> >    vIOMMU, which is a separate ioctl call from attaching the same device to an
> >    HWPT_PAGING that the vIOMMU holds.
> > 
> > +- IOMMUFD_OBJ_EVENTQ_VIRQ, representing a software queue for
> > IOMMUFD_OBJ_VIOMMU
> > +  reporting its non-affiliated events, such as translation faults occurred to a
> 
> non-affiliated is only mentioned here. It's not a standard term in this
> area. Sticking to the later examples in 'such as' is straightforward.

OK.

> > +  nested stage-1 and HW-specific events/irqs e.g. events to invalidation
> > queues
> > +  that are assigned to VMs via vIOMMUs. This queue object provides user
> 
> vcmdq is not supported yet. add it later.

Ack.

Thanks
Nic

