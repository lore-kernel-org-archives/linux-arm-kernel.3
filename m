Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBCBCCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 16:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yyn4lqAkjjlfKCGYC30WN8KIRSV8SV9b6Os6v4TjIdc=; b=rBZ5/gRt3vID3F0oRxv8VHv6RN
	lnVGxNttbZA4RkiX9CN92d07c0ViX8veEByqpmBt64QvEImH3hSk59wdO1aj82QPBTPkX65Fdz/kn
	XMt8abySNz/udCmL3nu3PfsaOpp0bTp38U2LGLFlBZeI05dlx/vFlnZZcqfv92vBXZbFAORmy0XiK
	UY8+UA8JgeaQtC5b2rbXzmeGgx3rWBO+QqPOiXS1cd50K3e3VI7uKdoPpvVX529KBYyGo5Cpoe4rt
	wh7oHIq2qiNvMAlfFNsTDxz1wqrjQyBfCWoYN+0/qI8CjrJOLF2RHhUSk2pgTJzq98s2WUR1sVrb1
	FnZnKdyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9myT-00000008NAm-0sGA;
	Fri, 17 Oct 2025 16:06:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9myR-00000008NAU-3Nkm
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 16:06:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Yyn4lqAkjjlfKCGYC30WN8KIRSV8SV9b6Os6v4TjIdc=; b=O08G1MkGTDcAsGw0iU1emVILjx
	qdKmZ84TCUzN/ph/w4CYRL8rMx16blvku3LXZ8Lek84LCr9WhN1LogIU8L4zu8UxN3L0oYrKLhSuk
	oJI6IoSJYMISYGwZVzCftugZu9F6BgOhl2+AY8rXGL8EdgXoGncJrSloM2ie1ltr+nL2okkhPoYpo
	uEefidocSiakgTYfYiM+45Wmjg08LJTY7H1kl5tOwdkqs7URD6GuYlZ2rapN+YbC2LBKPQ7ON6r6x
	nKouLvMwTlx7ZN4cCMKIBaff8sapDUG2kgNi1esIVBCrclMK1Oh8xwKAZMHaHlpnztbsoL1HAgCsk
	M1gJIw3g==;
Received: from mgamail.intel.com ([198.175.65.12])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9my7-00000007ir2-0LU9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 16:06:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760717175; x=1792253175;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u/8UedODI14grkfwwWOFNMbWTEn9jS5mcEENOEapc78=;
  b=SHNu6aPgyrBogrcPslkoUWjmqe62Jg2WAH6O+VTY8Wpx5sUMe37PmDuY
   +j2o/qycRLKf+ADQGGKidcFhAravC2bpRMoHAhNzpY6duPUsRIeGVJcKW
   jiZp/yvraZtvt3padUYZ4qCcWKon1OrO1KOuohl8uVBPpgaC48PC0Zi1M
   0iBE7+BrtB6SoKgFVsvzZA/m1cQiabEWgmuSUi2p1IjC113F8fq0Gk9gE
   7dqdI/gJ9DynESjVKFM47hJFwAvgICYS4DzKZtIiQsj1G93js5ZO715Sq
   SOoMNKwjUxBn9tlVGRUxlFXxrLU2EUzjXva3oS2YH+ZCF0CxVbKwihQyv
   g==;
X-CSE-ConnectionGUID: 9Ue8yWz3S826BTvyCQhKqQ==
X-CSE-MsgGUID: aekJdBaUTDO8oHQSsQcXzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="74371935"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="74371935"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 09:06:09 -0700
X-CSE-ConnectionGUID: RQC/0mwiTaGwQgz5XVF8Sw==
X-CSE-MsgGUID: tVXrX28pSfS6W+gJYu95eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="183190080"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 17 Oct 2025 09:06:04 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9mxu-0007Fx-0f;
	Fri, 17 Oct 2025 16:06:02 +0000
Date: Sat, 18 Oct 2025 00:03:27 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org, jgg@nvidia.com
Cc: oe-kbuild-all@lists.linux.dev, jean-philippe@linaro.org,
	robin.murphy@arm.com, joro@8bytes.org, balbirs@nvidia.com,
	miko.lenczewski@arm.com, peterz@infradead.org, kevin.tian@intel.com,
	praan@google.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/7] iommu/arm-smmu-v3: Populate smmu_domain->invs
 when attaching masters
Message-ID: <202510172340.XyneWIPI-lkp@intel.com>
References: <14d76eebae359825442a96c0ffa13687de792063.1760555863.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14d76eebae359825442a96c0ffa13687de792063.1760555863.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_170623_383592_3840BC5D 
X-CRM114-Status: GOOD (  16.18  )
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

Hi Nicolin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[also build test WARNING on linus/master v6.18-rc1 next-20251016]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nicolin-Chen/iommu-arm-smmu-v3-Explicitly-set-smmu_domain-stage-for-SVA/20251016-034754
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/14d76eebae359825442a96c0ffa13687de792063.1760555863.git.nicolinc%40nvidia.com
patch subject: [PATCH v3 5/7] iommu/arm-smmu-v3: Populate smmu_domain->invs when attaching masters
config: arm64-randconfig-r123-20251017 (https://download.01.org/0day-ci/archive/20251017/202510172340.XyneWIPI-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510172340.XyneWIPI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510172340.XyneWIPI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3208:33: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct arm_smmu_invs **invs_ptr @@     got struct arm_smmu_invs [noderef] __rcu ** @@
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3208:33: sparse:     expected struct arm_smmu_invs **invs_ptr
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3208:33: sparse:     got struct arm_smmu_invs [noderef] __rcu **
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3226:33: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct arm_smmu_invs **invs_ptr @@     got struct arm_smmu_invs [noderef] __rcu ** @@
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3226:33: sparse:     expected struct arm_smmu_invs **invs_ptr
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3226:33: sparse:     got struct arm_smmu_invs [noderef] __rcu **
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3247:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3247:9: sparse:    struct arm_smmu_invs [noderef] __rcu *
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3247:9: sparse:    struct arm_smmu_invs *
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3305:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3305:9: sparse:    struct arm_smmu_invs [noderef] __rcu *
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3305:9: sparse:    struct arm_smmu_invs *
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: note: in included file (through arch/arm64/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/atomic.h, ...):
   arch/arm64/include/asm/cmpxchg.h:168:1: sparse: sparse: cast truncates bits from constant value (ffffffff80000000 becomes 0)
   arch/arm64/include/asm/cmpxchg.h:168:1: sparse: sparse: cast truncates bits from constant value (ffffffff80000000 becomes 0)
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: note: in included file:
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:1056:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct callback_head *head @@     got struct callback_head [noderef] __rcu * @@
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:1056:9: sparse:     expected struct callback_head *head
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:1056:9: sparse:     got struct callback_head [noderef] __rcu *
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:1056:9: sparse: sparse: cast removes address space '__rcu' of expression
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:1056:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct callback_head *head @@     got struct callback_head [noderef] __rcu * @@
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:1056:9: sparse:     expected struct callback_head *head
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:1056:9: sparse:     got struct callback_head [noderef] __rcu *
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:1056:9: sparse: sparse: cast removes address space '__rcu' of expression

vim +3208 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

  3174	
  3175	/*
  3176	 * During attachment, the updates of the two domain->invs arrays are sequenced:
  3177	 *  1. new domain updates its invs array, merging master->build_invs
  3178	 *  2. new domain starts to include the master during its invalidation
  3179	 *  3. master updates its STE switching from the old domain to the new domain
  3180	 *  4. old domain still includes the master during its invalidation
  3181	 *  5. old domain updates its invs array, unreferencing master->build_invs
  3182	 *
  3183	 * For 1 and 5, prepare the two updated arrays in advance, handling any changes
  3184	 * that can possibly failure. So the actual update of either 1 or 5 won't fail.
  3185	 * arm_smmu_asid_lock ensures that the old invs in the domains are intact while
  3186	 * we are sequencing to update them.
  3187	 */
  3188	static int arm_smmu_attach_prepare_invs(struct arm_smmu_attach_state *state,
  3189						struct arm_smmu_domain *new_smmu_domain)
  3190	{
  3191		struct arm_smmu_domain *old_smmu_domain =
  3192			to_smmu_domain_devices(state->old_domain);
  3193		struct arm_smmu_master *master = state->master;
  3194		ioasid_t ssid = state->ssid;
  3195	
  3196		/* A re-attach case doesn't need to update invs array */
  3197		if (new_smmu_domain == old_smmu_domain)
  3198			return 0;
  3199	
  3200		/*
  3201		 * At this point a NULL domain indicates the domain doesn't use the
  3202		 * IOTLB, see to_smmu_domain_devices().
  3203		 */
  3204		if (new_smmu_domain) {
  3205			struct arm_smmu_inv_state *invst = &state->new_domain_invst;
  3206			struct arm_smmu_invs *build_invs;
  3207	
> 3208			invst->invs_ptr = &new_smmu_domain->invs;
  3209			invst->old_invs = rcu_dereference_protected(
  3210				new_smmu_domain->invs,
  3211				lockdep_is_held(&arm_smmu_asid_lock));
  3212			build_invs = arm_smmu_master_build_invs(
  3213				master, state->ats_enabled, ssid, new_smmu_domain);
  3214			if (!build_invs)
  3215				return -EINVAL;
  3216	
  3217			invst->new_invs =
  3218				arm_smmu_invs_merge(invst->old_invs, build_invs);
  3219			if (IS_ERR(invst->new_invs))
  3220				return PTR_ERR(invst->new_invs);
  3221		}
  3222	
  3223		if (old_smmu_domain) {
  3224			struct arm_smmu_inv_state *invst = &state->old_domain_invst;
  3225	
  3226			invst->invs_ptr = &old_smmu_domain->invs;
  3227			invst->old_invs = rcu_dereference_protected(
  3228				old_smmu_domain->invs,
  3229				lockdep_is_held(&arm_smmu_asid_lock));
  3230			/* For old_smmu_domain, new_invs points to master->build_invs */
  3231			invst->new_invs = arm_smmu_master_build_invs(
  3232				master, master->ats_enabled, ssid, old_smmu_domain);
  3233		}
  3234	
  3235		return 0;
  3236	}
  3237	
  3238	/* Must be installed before arm_smmu_install_ste_for_dev() */
  3239	static void
  3240	arm_smmu_install_new_domain_invs(struct arm_smmu_attach_state *state)
  3241	{
  3242		struct arm_smmu_inv_state *invst = &state->new_domain_invst;
  3243	
  3244		if (!invst->invs_ptr)
  3245			return;
  3246	
> 3247		rcu_assign_pointer(*invst->invs_ptr, invst->new_invs);
  3248		/*
  3249		 * We are committed to updating the STE. Ensure the invalidation array
  3250		 * is visable to concurrent map/unmap threads, and acquire any racying
  3251		 * IOPTE updates.
  3252		 */
  3253		smp_mb();
  3254		kfree_rcu(invst->old_invs, rcu);
  3255	}
  3256	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

