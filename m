Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5D7C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 00:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JE7uxGOqMR+bT5gQEbcxlQDnRokQiR9UdLU/z0PqWOM=; b=Ub5KTnKD665KLPtUXoIJh7v+zi
	j1n0MCNlPSmUDKGWvEOy5xgFEUuuIES3vCDzU6/5OZUQMuca2LPaHJfnkoL9asG7367mdRVC9eWYI
	bzMU9FTZCU964efSgzjog3WPNNm6NGrNbSqc0CauvuJuFOkWkOKP7DtwZNgMx1/gvZaKm40PASXmm
	obXIMLZ8e26vKQuT4UdXLZCPbVwpfNj/PDldLDKPF2zmjlPOqcqwX5WMn8UOAGkaO4aI8b4COIyYI
	VDHih+2HrCMfvNyaykQ/UYaFzKwyk5OdwvBgBWogu5R5GtBqMd2KWOQMMA7b3aMyb9Sq4afgh1CuX
	+rfBqFrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Tq4-00000003xc2-1ULe;
	Tue, 15 Apr 2025 00:07:44 +0000
Received: from mail-dm6nam12on20627.outbound.protection.outlook.com ([2a01:111:f403:2417::627] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ToF-00000003xQn-1bKn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 00:05:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bFn0By5W9teZgbUZgB6xfOS0G64SBybgMFeOYQCJRsIbopUMlt2hVn1vCnlhTe0HW1O9nkQ6O0/MWgH68P4qFHMQpRlj1bH7VOHlX1yfwyHH35yloXUObg1ES0F64llgk9kkO/Uh7QXQQf/b56w8oPlR/FJdPus44/YIJe/FAgaKYS5B6h+L3gFpJl5iqIc/nazvFQHoGnf/CmFUeFQ04S1UmV3f3M+4n75SgD6Blxc4Lvi0thxd2S+1o0rAoAYcc4jkM7xvHLIUY4feO6k4ZjMjX8GtY8aXXYNt6DlB2yaOYnraKaaNIBvpO15ELcNFQjz9IxOZtK0bg9tZSB59YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JE7uxGOqMR+bT5gQEbcxlQDnRokQiR9UdLU/z0PqWOM=;
 b=IDDrnrAp6HyOaYoP1k40fZah6Rm65VIH/Mh5ccFnvcS29k9RGmfxKl1pStaC1jB7FIC77ILKjrPaZqbYR4UeRuivcL+CIWEo+idAuqvrwVFDkeuE/jAs1gk6CPR2K2CrmGIQxUqA1KiW/t40kg9w0RXJCIgCivdfEGGpR6sIW2ngtiubUB8BmSNUGByNLZA92OPnoK+6pTU8BBCh069jacnal9h7vzrVxt2LwJk9wt6IZOvcmhN3dd5o0333WItRoYAwdFgiwYLIOdjsVIz+HRh0C7Bn4CfrR70gi7Y7kOgat/7lRWFXKOLXPA38ra+8ULfHPUOE1csHTz252ZXiTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JE7uxGOqMR+bT5gQEbcxlQDnRokQiR9UdLU/z0PqWOM=;
 b=G4+1KXB/rM6lA7spR2Eak1S2hJJsoKjDuoOjEFF0YObmSri1JQBP8+N6CHSkN7MUAzBZLO/iVNu/JW4+vMHNcTDeNGNydV1X+GwP3BXGRTcrdTF4KvVG6Uv8oJ+K2XwWWIwhkfhg8R/iXJyWUZO4BhtkZCQ+j6B8dFi9IDP03X+eZsXCTwZithfwHW92CPmoFksqGjnr8hfnIzGK8l9hn14uL/y7VczrAqqciO3nHQIx+TUro3am5tAQF8f7sRxLMb6VOnZ918R0mBjx4Zctv0OUCl94y+KS4WWbgJV8enhWUzvcL9JteFd0WxOVVMkI8JeX0QF7PyFqJJkpTjzGvA==
Received: from DM6PR03CA0046.namprd03.prod.outlook.com (2603:10b6:5:100::23)
 by LV3PR12MB9401.namprd12.prod.outlook.com (2603:10b6:408:21c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.30; Tue, 15 Apr
 2025 00:05:43 +0000
Received: from DS3PEPF000099D9.namprd04.prod.outlook.com
 (2603:10b6:5:100:cafe::26) by DM6PR03CA0046.outlook.office365.com
 (2603:10b6:5:100::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.33 via Frontend Transport; Tue,
 15 Apr 2025 00:05:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099D9.mail.protection.outlook.com (10.167.17.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Tue, 15 Apr 2025 00:05:42 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 14 Apr
 2025 17:05:34 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 14 Apr
 2025 17:05:34 -0700
Received: from Asurada-Nvidia (10.127.8.11) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Mon, 14 Apr 2025 17:05:33 -0700
Date: Mon, 14 Apr 2025 17:05:32 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>,
	<joro@8bytes.org>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v1 3/4] iommu/arm-smmu-v3: Decouple vmid from S2
 nest_parent domain
Message-ID: <Z/2izCr+/bRE7k50@Asurada-Nvidia>
References: <cover.1741150594.git.nicolinc@nvidia.com>
 <0429d554fb0f54f6d79bdacacb3fb3e7877ca8f7.1741150594.git.nicolinc@nvidia.com>
 <Z_OuLJ7RGnChDckY@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z_OuLJ7RGnChDckY@google.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D9:EE_|LV3PR12MB9401:EE_
X-MS-Office365-Filtering-Correlation-Id: c26194e0-e148-4caa-0c22-08dd7bb14380
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3I8GyL2Ev4ZUGMWzORt6HWUPOBF4cDhel/Kqsol93tmFG3Fmob8h1OrrSD5s?=
 =?us-ascii?Q?d0Mq4rNCtjvdFZSsrTFnckoYvMwhyy4/mwX6wVfFr6NY1kVy2RaYcqsrquia?=
 =?us-ascii?Q?kUaplplOYA6f/TfG4mRDjWAIMVJtHrd9KT2LokpoGraD0eiIFfZegvQpuP+n?=
 =?us-ascii?Q?LWVIYVo1a1kTkocescjXcBbRMCSftNbA45KVftgzdPwX5W3hBhWzUqewHh0I?=
 =?us-ascii?Q?Sp2CtxaIuCPiTUPwKRg+eiyUFxrRTIIKyJ47ySTw3Y8OuHbtlKlCLmhWcFzd?=
 =?us-ascii?Q?gXjXYRhjdi7vnnq859InH8U6p8xSm/atpPYdpymR7lKSh5dAbplJpbQEaci4?=
 =?us-ascii?Q?q35oUn541ezMwiBkXPD+xZHJe3677EDLx8qkCjJ8iIOcpWRVYVlz6MpItMu6?=
 =?us-ascii?Q?ravVg8hFLLACrOD5zkldlGlGV+PnNVz4wBv8EuSJg0B8YoKw2ECRQ3/D/GmA?=
 =?us-ascii?Q?xudUieH+rt0XtSRPXBQ0XXgSlABIKfJIhCj4YtII77frteLbGiZdm8Ts4XuF?=
 =?us-ascii?Q?HhzqlPMsBqLH59OBcnX2d9Kj8lKLzEyOKHlky+CYFYHL+SJhaeI4tSY1a4aC?=
 =?us-ascii?Q?mLunJXeiatwpUuHFXiyg6iE72fc91uCc11ypKX90IkalEh8Gi/SvI8FUkzjN?=
 =?us-ascii?Q?6PWNrdKz4Guv2bxLk9rgg6VHjO128GtEdb9kLPS0f3iPGGx0n5G/b5vkPCIk?=
 =?us-ascii?Q?nxiwRkPkPDfRA1EJPZOSV/JzrZMPMYFbjy4awyyePukJeYkf/MJ4gfKsRYyu?=
 =?us-ascii?Q?sGWcJWMy1SWKR0W+RVW0zzp9HYvwYs0f1PNlKCIwcFZElUFySsTCdg+eF23s?=
 =?us-ascii?Q?UbOfDVBUOHSqYpHNXiP0d+Px27kCzXFG8ZFine0PIR4HIzSLqI/KOewKi2U/?=
 =?us-ascii?Q?0ZQ43b2+nP8KQcuQn3E/y79Z+1AIdQbH7vrAj2A52cVAZfQGfvFKb/1TniWq?=
 =?us-ascii?Q?c6VBc048OEItmz38Sk3aNMQbKOg+omoaKdpeha/ikl0fEbnGgSw3bDeRPfzr?=
 =?us-ascii?Q?ZGucp+87yMi71WCet1MJO0ZDJ6nLf5o0NU5mMgt6hpVpxdYA7MYUN88MuJr9?=
 =?us-ascii?Q?Jdz1IyvzkboVgV5ZkQjWwE0QQWoxe2MVpitmFpPYHViA6xDSczlRgyuoTOO1?=
 =?us-ascii?Q?L3lRJ3Un70l5u2Kd9wA/8ynyGxm5NjlOB/HYxsVvG/2vxVHmF5UQYhUBydHm?=
 =?us-ascii?Q?G46GfQpcnWvfh+a8xA54KPDob0opM5nrvoQG0o2iRN2jjiVnUSUjy6XwfMWb?=
 =?us-ascii?Q?4l2+R0ISMDJKIfYpS7WkngoWk6wOUBo4eswJE+HAlfVL9X78wIDcNMaw2YCU?=
 =?us-ascii?Q?O6m0xnIU9gucFgIt6Wo0o366UY1DahUG0fOp2gQzW53Z8MQ85AdRYMUaNT4X?=
 =?us-ascii?Q?MPHbgcskLUCJ2hRy5w2FfopGf7B7MPfUBssjNQNHHRlBnlIeaR3ayddkpZVh?=
 =?us-ascii?Q?gi9tVp4vXMx6xLQpuvVic+wqaWQ5Og2nkzMc1vLMaeB/T9s6t5GLFKkMfSqx?=
 =?us-ascii?Q?e+jMCAyF69QE5v4P5PhN/dDjU9Ne5VYW3Fk2?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 00:05:42.7121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c26194e0-e148-4caa-0c22-08dd7bb14380
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9401
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_170551_424546_C1A23C9A 
X-CRM114-Status: GOOD (  18.85  )
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

On Mon, Apr 07, 2025 at 10:51:24AM +0000, Pranjal Shrivastava wrote:
> On Tue, Mar 04, 2025 at 09:04:02PM -0800, Nicolin Chen wrote:
> > @@ -2249,10 +2249,22 @@ static void arm_smmu_tlb_inv_context(void *cookie)
> >  	 */
> >  	if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1) {
> >  		arm_smmu_tlb_inv_asid(smmu, smmu_domain->cd.asid);
> > -	} else {
> > +	} else if (!smmu_domain->nest_parent) {
> >  		cmd.opcode	= CMDQ_OP_TLBI_S12_VMALL;
> >  		cmd.tlbi.vmid	= smmu_domain->s2_cfg.vmid;
> >  		arm_smmu_cmdq_issue_cmd_with_sync(smmu, &cmd);
> > +	} else {
> > +		struct arm_vsmmu *vsmmu, *next;
> > +		unsigned long flags;
> > +
> > +		cmd.opcode = CMDQ_OP_TLBI_S12_VMALL;
> > +		spin_lock_irqsave(&smmu_domain->vsmmus.lock, flags);
> > +		list_for_each_entry_safe(vsmmu, next, &smmu_domain->vsmmus.list,
> > +					 vsmmus_elm) {
> > +			cmd.tlbi.vmid = vsmmu->vmid;
> > +			arm_smmu_cmdq_issue_cmd_with_sync(smmu, &cmd);
> 
> Shouldn't this be vsmmu->smmu?

Yes. I had fixed that locally after I sent this..

> > @@ -2342,19 +2354,33 @@ static void arm_smmu_tlb_inv_range_domain(unsigned long iova, size_t size,
> >  		cmd.opcode	= smmu_domain->smmu->features & ARM_SMMU_FEAT_E2H ?
> >  				  CMDQ_OP_TLBI_EL2_VA : CMDQ_OP_TLBI_NH_VA;
> >  		cmd.tlbi.asid	= smmu_domain->cd.asid;
> > -	} else {
> > +		__arm_smmu_tlb_inv_range(&cmd, iova, size, granule,
> > +					 smmu_domain);
> > +	} else if (!smmu_domain->nest_parent) {
> >  		cmd.opcode	= CMDQ_OP_TLBI_S2_IPA;
> >  		cmd.tlbi.vmid	= smmu_domain->s2_cfg.vmid;
> > -	}
> > -	__arm_smmu_tlb_inv_range(&cmd, iova, size, granule, smmu_domain);
> > +		__arm_smmu_tlb_inv_range(&cmd, iova, size, granule,
> > +					 smmu_domain);
> > +	} else {
> > +		struct arm_vsmmu *vsmmu, *next;
> > +		unsigned long flags;
> >  
> > -	if (smmu_domain->nest_parent) {
> 
> Minor Nit: IMO, an explicit like this clarifies it better. I think we 
> can keep this add gotos for the __arm_smmu_tlb_inv_range calls above?
> (Like the arm_smmu_domain_finalise_s2 changes below).

I've reworked this part. It looks like this now:
	 if (smmu_domain->nest_parent) {
		 return arm_smmu_s2_parent_tlb_inv_range(smmu_domain, iova, size,
							 granule, leaf);
	 }

	 if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1) {
		 cmd.opcode      = smmu_domain->smmu->features & ARM_SMMU_FEAT_E2H ?
				   CMDQ_OP_TLBI_EL2_VA : CMDQ_OP_TLBI_NH_VA;
		 cmd.tlbi.asid   = smmu_domain->cd.asid;
	 } else {
		 cmd.opcode      = CMDQ_OP_TLBI_S2_IPA;
		 cmd.tlbi.vmid   = smmu_domain->s2_cfg.vmid;
	 }
	 __arm_smmu_tlb_inv_range(smmu_domain->smmu, &cmd, iova, size, granule,
				  &smmu_domain->domain);

> > @@ -2506,7 +2532,10 @@ static int arm_smmu_domain_finalise_s2(struct arm_smmu_device *smmu,
> >  				       struct arm_smmu_domain *smmu_domain)
> >  {
> >  	int vmid;
> > -	struct arm_smmu_s2_cfg *cfg = &smmu_domain->s2_cfg;
> 
> Is this really required? I see we're still doing the same thing for
> the nest_parent == false case.. we'll anyway return without doing much
> if (smmu_domain->nest_parent)

It's clearer and safer to reference S2_cfg after the "if" below.

> > +
> > +	/* nest_parent stores vmid in vSMMU instead of a shared S2 domain */
> > +	if (smmu_domain->nest_parent)
> > +		return 0;

Thanks
Nicolin

