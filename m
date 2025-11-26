Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59951D10371
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 01:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fRDkPuZHe2aNLg5QG6wZSH4NQ7XWtjiyMXSaT5CEdu4=; b=CVrYWbKebQcSUMJYEk8/MSTx+0
	3QT5DaCxgesez79uee2dD2ZomEFKVTrzUu33rYA2aN/0PaFelzNFcVvNP3RaVgkwXK6AS1bOKnfUz
	agxZWQuYMrdw1n2a+M24smrFxjn+RSWkbYtjdaVZ94PNYak8iTEGuwbJNdzXO8HoVnbng3/RXtRBo
	usIrCSJOJJJCM3xRdzIRzZcw5H2dLAlpHMrRhjFVaneNKOSoQGFVkscKPrigGb37HBI0WiGlMynkB
	aCoUemDZWLxYFeAc+2xhaMhICxAEMqzGgU6RbYYSBWno5n6p+zkEqHZdNTaQW4O6+YaR7jdacAk/P
	3V8dlylA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO41B-0000000E9LG-2IVu;
	Wed, 26 Nov 2025 01:08:25 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO418-0000000E9Kc-2ovC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 01:08:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MWwx7M7dzKe2UkAEsGgYNAAJz56ZPNwYk8LRCDp8FX3wbGbKuvsPT8IByXXdMEx8R+1Ts9J3TDMsy5SBaAnzE1aJn3k1THVWAoWNpldSDt0pIkEzr8kli6/9/NC0Wyej3u60aHHna7hXAa3PQ0k1JJy0w9gPY7iBZTytXh/p6qPMfqpIDGvehuW+CKKK2fAmWTpAL5dhT3M91d9knx9BcifpACI5NqwcS8L1Q1XLOUo6X/Ebh4oTOT7I0ejBXUgyKOvW8ieIQGPt0vj93OlEP3sFGb+6ZYgxbtNfoTwA34WFF6ydTeFgJ5lEQ8Afvn58Zr187vStyJI+3EbWIuKgHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fRDkPuZHe2aNLg5QG6wZSH4NQ7XWtjiyMXSaT5CEdu4=;
 b=IJUxpMnK7osfKLMLAzqHRB0ahtCfggSiSMoEMnVoPlt6xVKHpdIvf8SP+beAFRbPNWZ9HWQkiyPgz2pldz9x99gAcHpEK5jSYThQ3oBOE+IzmD8JSdKpPvjg/JCG5ZQV7QtBJhjhORTKAf3BPistEjoUa726SWKXXdMSJi9u67FJMItgJ1AkbiZkK1DALDKDOlx+1FafAbc8blKdnhGwXGbjDOYi3Omn/Xh7e6GSh3BvB/1t9r/meDcn+dY6QMfnpKQtuXAA7ivmbIK3vtJ/dHscx4wxRHe4FEbmnTzzja7lICdu3mPuOLiWQzzg5VsgvnwOughc+cpr9XQiw70wkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRDkPuZHe2aNLg5QG6wZSH4NQ7XWtjiyMXSaT5CEdu4=;
 b=d9O2ENulupTgOH06JKtfmk9W7HAnKhBCDBRnSl0VeHuWIWqqjfYVHTsB1jtjistgss6dHu0BEAzfuTOWNbRaS+YBOy8dm/fLtEe19Uo3FJp+Uny+tacaXDKzUYnMbIxQ7IVG3OKIWntJm9xRnBTlIeF/GOVdkmJHbNwcClDmzqHiMvEiP8BXJNAxwk4fHFwKPswRCEVhO+Eua+h/oiJJm4Xi8sdlBzIoAOKaTqX1TpmnwMcuTinO4QZ18ajEEUhV/KMF/sV6q3fB8DXmvU7y9SdBzqnZnF/J10qpRoMupfP8rxloCktUQkSDNxzMYtcv6CldWVQq1nHFT/JvzEc8HA==
Received: from SA1P222CA0136.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::16)
 by LV8PR12MB9110.namprd12.prod.outlook.com (2603:10b6:408:18b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 01:08:03 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:806:3c2:cafe::34) by SA1P222CA0136.outlook.office365.com
 (2603:10b6:806:3c2::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.12 via Frontend Transport; Wed,
 26 Nov 2025 01:08:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Wed, 26 Nov 2025 01:08:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 25 Nov
 2025 17:07:50 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 25 Nov
 2025 17:07:49 -0800
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 25 Nov 2025 17:07:48 -0800
Date: Tue, 25 Nov 2025 17:07:47 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Will Deacon <will@kernel.org>, <jean-philippe@linaro.org>,
	<robin.murphy@arm.com>, <joro@8bytes.org>, <balbirs@nvidia.com>,
	<miko.lenczewski@arm.com>, <peterz@infradead.org>, <kevin.tian@intel.com>,
	<praan@google.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 3/7] iommu/arm-smmu-v3: Introduce a per-domain
 arm_smmu_invs array
Message-ID: <aSZS44uOqo1c8L2S@Asurada-Nvidia>
References: <cover.1762588839.git.nicolinc@nvidia.com>
 <eea7bffde13574e099212e3b3823a0f192d6aec3.1762588839.git.nicolinc@nvidia.com>
 <aSTRRyTBh1nATwBa@willie-the-truck>
 <aSTfC5WFoa6sJlBj@Asurada-Nvidia>
 <20251124230333.GM153257@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251124230333.GM153257@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|LV8PR12MB9110:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b6f47db-8ee6-47bb-299d-08de2c88400b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6JGVWSbgmSp6N2NuxolFCkCa34ywBTOwo2qAlwVeR+49KzWVmI5ao8E0Ltkd?=
 =?us-ascii?Q?dTXauswyRLYtfQEF1UYCZ2gMJlNS5UD5XiIQA9C/THXa9S6GgVF/ar8q/5z6?=
 =?us-ascii?Q?FrLnGt4afu/Jk86QN9zgnVax8Ctze8KeioJVS+gz+T8Rp7OvyASp+ayezmYV?=
 =?us-ascii?Q?Eb2IHTZ9Y9O5CSfpuam4xSH8xhXW7eyTdJTQS8TwS11JP82/G5Hd4/cApx8Y?=
 =?us-ascii?Q?Q35RZd6fE2cYVu5Ary7JLnZz84tJdKQyB0HXi+4QHXzYrE4xyGTBFVthXqF3?=
 =?us-ascii?Q?m+cajEfqQVbEy1mTa2ygEojuEwECi/4FHfkAr3t3+tthwI4cQyj4iVGC2Xcl?=
 =?us-ascii?Q?vulKg38XbI4j7n2OxxQ9hp5agwVFUJfP1y7qEWhcGWAJHw2duYYUYmEUouWm?=
 =?us-ascii?Q?Hzxas79TjcFTrXEKTbKE9h2pGWZYXf8b7Df7t4XHkYLSpQAaMCNKvPvzvqpX?=
 =?us-ascii?Q?LoRdQQ2qIRbj7QNU+MF0mUXnXkSJACWK2IBCjHFWbof+Qm2B1IJcNen3eHAp?=
 =?us-ascii?Q?kCOCE2qEsPYqcoBKPIBOerPaNkP7Pfm/nruNdkDAFjSF0bx+Fk+0pup1GwtZ?=
 =?us-ascii?Q?1F92QylTLHddnKLYZUGm41/Hvx+jM2hgK5BaPddHxtJpIGuegiDxJjFPUI7R?=
 =?us-ascii?Q?w4n8QYkgdZ39oXhPrf7X05xFUYHa1/m/9fTUq6e5vRs5V6jmkbDkoVt/c9rC?=
 =?us-ascii?Q?IHQ/MEY1eT8NWudgIUMQvuPagEPu/pRsD5cGNNo9iKRYyLNvd68CqvfLRl1/?=
 =?us-ascii?Q?CTLyXyx+iZ+YbzXmy81SEtFnqeMYLESjUKo6fO+LP7HceaMFv7QXrOBrhCTP?=
 =?us-ascii?Q?yqljp/gp6MHgcIFq+975fQ90A9pxNWgHgDxx/oH6jpZyrAN90gh3ZcYzXSYB?=
 =?us-ascii?Q?u6cN+brgK5zdbP5xmQhRx8J2lxU43btLywqpe+CqhRits3Uq28cJmcb7AnQZ?=
 =?us-ascii?Q?/t1RiMc2h+zBOjMr7ElZM9u2KOcLrZ1YdpF6XhSgedpSqkKxpzIOdLYOl7Kp?=
 =?us-ascii?Q?o9FNITtWbeAs7gWaSqOBhmRBDGixIt/CJX64wsIhJVlrUvBca7dmGdRR18Oa?=
 =?us-ascii?Q?A/tbDKNcxNSjt8WjSbGHGB/PmMONYp9sGRAz24AetosyKVJZ9ZC8Fl4w79hh?=
 =?us-ascii?Q?/mGPD896ODZU/57C0RY1PY6nEl2HCrx/nIPUtqyjBRKOPzzSB0fqUnto+I7I?=
 =?us-ascii?Q?6/jRSwsXTTqC/Ro+ZSBidT032nIpoRR1P0bRA/yn0rW6g4xzU/e+/ozSHFfH?=
 =?us-ascii?Q?Tn2Z1fHl81M1+3D3kq4XGMUFshKidmBkZ8Mix6/YSxD2rIkZbIIWNaot+o2F?=
 =?us-ascii?Q?FmPRX9rhe/UcNanCBPCASdVDcD+AHuG77T2TVA3BLS+eshES6AJakZDtabEo?=
 =?us-ascii?Q?5SbQkfiEBgodaBhJ2QPf2APTUOF+0HftWNDyqdwAjzsGsOR4912lwabhDzxx?=
 =?us-ascii?Q?+Alc7lJdXSzvC0ZD9PRnsB8MNFNIKuGbIQK1HDjrO0PCXgAYr0NxSmVR+rw1?=
 =?us-ascii?Q?J9xXJ82fqKe3sxb8KRcoVq7kKVbSKMttLBW0On3yIdDNvIzE1a/iWhy21ypn?=
 =?us-ascii?Q?Qq/T2stiE3N6A8d3xoU=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 01:08:03.3349
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6f47db-8ee6-47bb-299d-08de2c88400b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_170822_735824_C7DD5447 
X-CRM114-Status: GOOD (  22.30  )
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

On Mon, Nov 24, 2025 at 07:03:33PM -0400, Jason Gunthorpe wrote:
> On Mon, Nov 24, 2025 at 02:41:15PM -0800, Nicolin Chen wrote:
> > On Mon, Nov 24, 2025 at 09:42:31PM +0000, Will Deacon wrote:
> > > On Sat, Nov 08, 2025 at 12:08:04AM -0800, Nicolin Chen wrote:
> > 
> > > > +EXPORT_SYMBOL_IF_KUNIT(arm_smmu_invs_merge);
> > > 
> > > There's nothing really SMMU-specific about this data structure manipulation.
> > > Do you think we can abstract the invalidation array concept into a library
> > > which other IOMMU drivers could use too?
> > 
> > Yea, I am trying to shift to that at this moment, hopefully to
> > combine the iotlb tag (asid/vmid) allocation as well. We do see
> > it could be quite useful in AMD driver already.
> 
> I do want to see this, but also without doing work on the other
> drivers to integrate something it will be hard to design.
> 
> My preference is to get the basic system agreed here in ARM and then
> move to a generalization. There is quite a bit of work needed in the
> other drivers before they could use it - which makes me worry it might
> never happen anyhow. riscv is probably the closest, followed by intel.

OK. I'm sending a v6, keeping it as-is. I think this itself could
be merged as an introductory series, so long as Will is okay with
it.

Meanwhile, I will spare a bit more time to organize the ASID/VMID
allocation (part-2) to hopefully integrate into the array helpers
that will be required to share a nesting parent domain.

After that, we may think of shifting it to a core library.

Thanks
Nicolin

