Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31E1C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 20:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PbV1XuJ3+uJm4oL+QTmsTmtocPfmSX2G+6vA169NjlY=; b=BJxNa85UtD71yB+3KM6vJMmkCy
	s6u6XTvSHh/0gFFjowyy2vPlntjuRQ9KaCaPMCumWb0EgX20KPcUCPiP1w1xCSfsgiukUcwPT8dAo
	D8rCTNtxUt9eZfRoZ2dmto0G24uaiQECuY1Zs1qBTf9HroBCXtWq9yjrikfgE0sLpeUc31JZ+CU75
	CH/JzhH+RbxV/Cgwplv9iMsHcZc3Tfglqt8mlOm8f5AQJGslh0I4wSsPq+SZMXHjswGpPn11epwpQ
	5jLKPfg2Sak2e5+Hsj47Djc10SjHe7tou6HxhUAkdotl6lUCxMIpewr+ZWWJeqp9XqdgfzjBDxezk
	vf7GxH+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4mec-000000070C1-09vv;
	Tue, 15 Apr 2025 20:13:10 +0000
Received: from mail-bn8nam04on20609.outbound.protection.outlook.com ([2a01:111:f403:2408::609] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4mcl-00000006zqz-2ork
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 20:11:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eb6tqGEzmnArEYfR9O6WqubGTuqWPFV7228REIKy4PIE6HkR6EmvAl1DA7WnOQNPXCExPt8oWkZusts+Z8uApm4bW60amVs0dvt2UZ+Cw2uIbMCf37aZt2s8kQtaarxgDFmBVQ/srjQ4cjriQZMRV2190iuqYRKjvf8GlUwAQboTbm46pJNu9DekAU5FRmKxF8sOu1yZN+L9xmQzwAJOJSjsXprBqI9tdWF7th2A4AaJ6P4XSpQKAKbkRILzYo2l9u3jaAWOuUnkqCE2apsfhb5o1jc5p2XogTBeB7IAo6QlCv3GFI3F9Je/wK46jPc9NnJXVyDSq/VXGIxJWVYRZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PbV1XuJ3+uJm4oL+QTmsTmtocPfmSX2G+6vA169NjlY=;
 b=yc1q3zx//wCs72vKXzlXgLcsjkXhPVCPkyA15xJzvmeCa2lGy5YzZtdVsNqYsYZ3Srdl9Wo0JjmsfFdUTZjcs0H9ELJxbQZKOMRKG3mQbJi2DDNHdqyUPBuqmIcChLFqWgtSI5SWDzKirEM5b3Aa4OHtpB/ZW43qXV9cck5bMndvsJUU+nvArXAMTo9XwCveMCWliT+PM/M3VSvcRfpIeY9QhJgz7jtLj0Dgn5qTsdH9rJ+kBXo0vJKif/sU4MqJjxxYO7Hlt+5eEaIY57TtgKv6aaIDDEJyaAcsbIVTsOwErVcnWiYGGiIoIx1knn2ddNa+06lyr1Sw8jKzmxeW7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PbV1XuJ3+uJm4oL+QTmsTmtocPfmSX2G+6vA169NjlY=;
 b=hvtYBb8SY/2zi+MrUdURZxBFOHq6CL/8qXYiKUf7vb1nktdEfZpkjyNvUTy+BcEoLZkC8yDhJGXycX4IqDzA3/cH11QlA0GWwVkr/GKrPQbH1Gssn7Z58llaFWXAJq6JcYNl6QNSnwOYI1rMa8OdN2Gf2oW+mBIY/uKWVaeriIPJ79QRKxHLpMhpn+ffLN5rmxZXGqJG8F2m2TosckEYhSsXHlm1obeJ3fDebcNl7a3HMA7MOgcFjt3WcF13aOtL/9iWjxzZkSG3CMFgDMgonHGkAi8ZTwPE1Wyz/Gnh/wTvBM1LAyEjPVoxvJGYyA1NoI05Z8y0dHKYmICFqhY/2A==
Received: from MW4PR04CA0300.namprd04.prod.outlook.com (2603:10b6:303:89::35)
 by MW4PR12MB5604.namprd12.prod.outlook.com (2603:10b6:303:18d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 20:11:04 +0000
Received: from CO1PEPF000042AD.namprd03.prod.outlook.com
 (2603:10b6:303:89:cafe::36) by MW4PR04CA0300.outlook.office365.com
 (2603:10b6:303:89::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.15 via Frontend Transport; Tue,
 15 Apr 2025 20:11:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000042AD.mail.protection.outlook.com (10.167.243.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Tue, 15 Apr 2025 20:11:03 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 15 Apr
 2025 13:10:41 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 15 Apr
 2025 13:10:41 -0700
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Tue, 15 Apr 2025 13:10:39 -0700
Date: Tue, 15 Apr 2025 13:10:37 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<kevin.tian@intel.com>, <praan@google.com>, <nathan@kernel.org>,
	<yi.l.liu@intel.com>, <peterz@infradead.org>, <mshavit@google.com>,
	<jsnitsel@redhat.com>, <smostafa@google.com>,
	<jeff.johnson@oss.qualcomm.com>, <zhangzekun11@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v2 06/11] iommu/arm-smmu-v3: Introduce
 arm_smmu_s2_parent_tlb_ invalidation helpers
Message-ID: <Z/69PTDANYagKX3d@Asurada-Nvidia>
References: <cover.1744692494.git.nicolinc@nvidia.com>
 <61fef9052b2034e5b4ffa1fa6ce481667d8ea6b1.1744692494.git.nicolinc@nvidia.com>
 <20250415125042.GA517881@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250415125042.GA517881@nvidia.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AD:EE_|MW4PR12MB5604:EE_
X-MS-Office365-Filtering-Correlation-Id: b7ff6d03-0361-4e92-8cef-08dd7c59a63c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vyiGO3s/TEP53JlCyB7WiqEjO1MAaYUrq8Up2O2ecISdyTHFVRD5yIt+keRk?=
 =?us-ascii?Q?QQzbxcK+pHR5N4cwp1o103SWCOs9JUIayexFy23SkiDuivxuqrFHwWFB57A1?=
 =?us-ascii?Q?saLpKxTByi5Ay9Kgu6LHSTL/1wNykLzX+o4K/2rOcxBEzWV2zo9epBnQJvZX?=
 =?us-ascii?Q?gKBd/Z1vzvHhDt3EsVYKy4xLrGpyFIv/2MYTCemlFHz7eFVg08wJbP0i+8+s?=
 =?us-ascii?Q?4cikRBEsJLMqu+mNUyDIwk5uhLQh4CnahkvJ9WyIQyxopaCI8wCW9rh/aE37?=
 =?us-ascii?Q?n7hkZbILhOialjqgRKuy+yTabmHoIelr8GdykpKqwoXldIkX8gH5fy/Cl0jp?=
 =?us-ascii?Q?MAGFlDihkzJsG3dXuBd4H/pOQ7udtLJlPbgrMyP+/zsKcy4mlhU5CwLPA/lI?=
 =?us-ascii?Q?N3xCYBp1DwyyIwQWQ09z0zbTkuamdJOYrxoXTRRO+D6zi23Vic0uCvq7rXYO?=
 =?us-ascii?Q?o51O+oyahEjQ2jklA9vindO/M+RRTofWghygESO/SGqiOjnRs5QE/xkEqOPn?=
 =?us-ascii?Q?wTnzoALDOWEh/iZuMVeFQ7T6qHjyLR8pFQksSB7Pf72Ki3am/bVsfhk09zMf?=
 =?us-ascii?Q?4lExeDui5QGQsEhvl7w1xX3hCiqqnZ4dh3mBlHVHOvmLvoUXMtlqQ+x+TLBX?=
 =?us-ascii?Q?1Stfs9SULgBepy2FpmBc1t5jdsAEugLzgc6HNH0jesLUPkNCF0s3ErQgkTQw?=
 =?us-ascii?Q?d/MYv8Az8UkagloZpQ7f4WgjvmWdND8eoDdbS50AXb2QSWbUcpguU69rCUQu?=
 =?us-ascii?Q?kiGyePItDdANh5uKpxifsxSjrcsl4bA1JvSUezPak2He7pC/H9mvjqDg/OhE?=
 =?us-ascii?Q?i2Dcu/sJuA2gcw0hUifVeDe9n0AVKcCHNnLYLTn698Y/JqmQbFnj8qIMQFJz?=
 =?us-ascii?Q?TqNlblLsb7Izamr4uZZYPt571dls7gBKPj6mcWebloBMMnWnfEF8c3ZbSarD?=
 =?us-ascii?Q?+4oNm779Wm9lj1escdn5nJelvptMduPzaPNOjBpBDW+lSe5Waxy8kLkGNmOJ?=
 =?us-ascii?Q?zC49CD5k3kM6vhoWGkPuxpcHuZj+DEOjpkVcnUQwSNsHS4O12sQJgOjkedcy?=
 =?us-ascii?Q?0xZPJWp1/BtFha0MIbbTHgdhQCJMgJT5bLMvBXYYL017tzC++8TM/fn78CRU?=
 =?us-ascii?Q?JcxrZcRJ1Qwu1LKly4uEbV2bvCtv6GmBEDtZ5zTwXX+pb72UNXKNJLeqq7RK?=
 =?us-ascii?Q?9u0EnS3yM39OEVnmqnAz0sKqE+7G6UhjfrZDN7cbhtjBDgt9+mgBktZsYLT5?=
 =?us-ascii?Q?wDbgydAAwVh8IBOpiNMNCP9WVg5diTEg4toVGC0SZ9pGOmy5l53YeTDUTbXg?=
 =?us-ascii?Q?3wqQc2nwrlaYi92BvcGXURAbSiZBtIvemHVcFkIgipPK/HYV10CQTlaJemOe?=
 =?us-ascii?Q?PhtB8/cvU0nHHYNKGnfzIRvNkldKMYb8Z3GdJg7cORjphPvrowxnmx/e7n/2?=
 =?us-ascii?Q?e5s9QCz+fz32SKrLELX5rMYFOvZQ+xy+PaAfkka+/qJKX4EmryTJ+wZ9E+6n?=
 =?us-ascii?Q?y0ICGutXKb6o/Kf1UK3hud4HjdfkyjkPtcsB?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 20:11:03.7991
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7ff6d03-0361-4e92-8cef-08dd7c59a63c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5604
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_131115_731440_468A5339 
X-CRM114-Status: GOOD (  22.24  )
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

On Tue, Apr 15, 2025 at 09:50:42AM -0300, Jason Gunthorpe wrote:
> struct invalidation_op {
>     struct arm_smmu_device *smmu;
>     enum {ATS,S2_VMDIA_IPA,S2_VMID,S1_ASID} invalidation_op;
>     union {
>         u16 vmid;
>         u32 asid;
>     	u32 ats_id;
>     };
>     refcount_t users;
> };
> 
> Then invalidation would just iterate over this list following each
> instruction. 
> 
> When things are attached the list is mutated:
>  - Normal S1/S2 attach would reuse an ASID for the same instance or
>    allocate a new list entry, users keeps track of ID sharing
>  - VMID attach would use the VMID of the vSMMU
>  - ATS enabled would add entries for each PCI device instead of the
>    seperate ATS list

Interesting. I can see it generalize all the use cases.

Yet are you expecting a big list combining TLBI and ATC_INV cmds?

I think the ATC_INV entries doesn't need a refcount? And finding
an SID (to remove the device for example) would take long, when
there are a lot of entries in the list?

Should the ATS list still be separate, or even an xarray?

> To do this without locking on the invalidation side would require
> using RCU to manage the list, which suggests it is probably an array
> that is re-allocated each time it is changed.
> 
> That means some fancy algorithms to copy and mutate the array, deal
> with error cases and sort it (ATS must follow ID, want things grouped
> by instance).
> 
> There is some tricky memory barriers needed and RCU would require that
> SMMU unplug do a synchronize_rcu(). IIRC riscv did this in their
> driver.

I will refer to their driver. Yet, I wonder what we will gain from
RCU here? Race condition? Would you elaborate with some use case?

> But the end result is we fully disconnect the domain from the smmu
> instance and all domain types can be shared across all instances if
> they support the pagetable layout. The invalidation also becomes
> somewhat simpler as it just sweeps the list and does what it is
> told. The special ATS list, counter and locking is removed too.

OK. I'd like to give it another try. Or would you prefer to write
yourself?

Thanks
Nicolin

