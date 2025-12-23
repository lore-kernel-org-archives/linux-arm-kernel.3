Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05959E6F072
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 08:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gu+el4KtmH92Mznjfo6hUxhBsBsMGhSTxQmwUXZTpPo=; b=HtyNENQxZdu14jahYd8/GhdQ7j
	kOIAbTSNN6TX+dhgtxbxDU3UGzWF1YyjRqlbsJB8y0y3uyP5JI3jEeLr+D+PURVYI56s1DamhX8i4
	gPOtgoJQqTGaMLKs3FKXAvlRVWzsc3+t7IRMWg9FsIZ1tlEi2IOaYk44gZ3mZWD/sy3paM9AYmPeB
	bgCwf9sK28+hgOee4O1QoUCbkuLoScdPl+EOsq4VhRVsEaj7AIRN3J8KckoJxQBQtCIbOnE40FI3p
	ku0GiTDC8GPQRxQXBfw+8MeLk1Igbb7h4A4EdvesAfbMYVc8lAMx2og8pVZCeKRPhub8wax/5vU5a
	1p5erXbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXy5C-0000000EhmU-3zzg;
	Tue, 23 Dec 2025 08:49:30 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXy5A-0000000Ehm3-38hg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 08:49:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766479769; x=1798015769;
  h=date:from:to:cc:subject:message-id;
  bh=iRfbkSeLOOrtsVHqHSEjjPDMtS7k6kf6vVM+h5sTHrc=;
  b=JkyH9g9/ncA9eYGP0HWUhHe1inpLv5Hz13nLcReXNV/zBz6NxY1CCUag
   b7L0RCiVvAfdNckJbwD83ps7CiHO7cHmuXOjLtdNl+bZMlNBHe6uS9L6V
   5CtREJK1jRFOlIlqiqxhL7UYrJwmyDkDBr9krJok3fPAO+r+/W7LColEV
   YWUAL59BYLlm2NwKhjn4YDGAvU66f/h92lpdUbOBEYfr1EbnpAB6+sMzF
   tqBZ5DtkzmKv2TXd3GYHncQAlYcv5RiJycyp+koDviXU1IKYyKBwZVKhT
   HvxJlr0T47kFMQf98u5N9bKVy+8ehzykIiccfPLs56Lm85V2ZXxjBjudJ
   A==;
X-CSE-ConnectionGUID: xmlamOzqQCmbA5LPfp/qoQ==
X-CSE-MsgGUID: BF73CIOWTEqXeMdtvmSm+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68083657"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="68083657"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 00:49:26 -0800
X-CSE-ConnectionGUID: kTp39EBcQbKJL2bvY1f5Ig==
X-CSE-MsgGUID: xIslNmEDSh+WtkZlY92cGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="200036542"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 23 Dec 2025 00:49:24 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXy54-000000001en-1YWQ;
	Tue, 23 Dec 2025 08:49:22 +0000
Date: Tue, 23 Dec 2025 16:49:19 +0800
From: kernel test robot <lkp@intel.com>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/gicv5-full 59/82]
 arch/arm64/kvm/vgic/vgic-irs-v5.c:784:24: warning: variable 'ist_l2sz' is
 uninitialized when used here
Message-ID: <202512231615.mYXXEOUa-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_004928_907458_B8FEA2A6 
X-CRM114-Status: GOOD (  14.82  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/gicv5-full
head:   1426b88096b597395df4c82f089b87c62bab45da
commit: e19948af6683f38c4f8634a3ee7e30347e481aa9 [59/82] KVM: arm64: gic-v5: Add GICv5 IRS IODEV
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251223/202512231615.mYXXEOUa-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512231615.mYXXEOUa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512231615.mYXXEOUa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/vgic/vgic-irs-v5.c:675:5: warning: no previous prototype for function 'vgic_v5_register_irs_iodev' [-Wmissing-prototypes]
     675 | int vgic_v5_register_irs_iodev(struct kvm *kvm, gpa_t irs_base_address)
         |     ^
   arch/arm64/kvm/vgic/vgic-irs-v5.c:675:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     675 | int vgic_v5_register_irs_iodev(struct kvm *kvm, gpa_t irs_base_address)
         | ^
         | static 
>> arch/arm64/kvm/vgic/vgic-irs-v5.c:784:24: warning: variable 'ist_l2sz' is uninitialized when used here [-Wuninitialized]
     784 |                                              nr_spi_bits, ist_l2sz, istsz,
         |                                                           ^~~~~~~~
   arch/arm64/kvm/vgic/vgic-irs-v5.c:712:47: note: initialize the variable 'ist_l2sz' to silence this warning
     712 |         size_t istsz, nr_spi_bits, istmd_sz, ist_l2sz;
         |                                                      ^
         |                                                       = 0
   2 warnings generated.


vim +/ist_l2sz +784 arch/arm64/kvm/vgic/vgic-irs-v5.c

   699	
   700	/**
   701	 * kvm_vgic_v5_irs_init: initialize the IRS data structures
   702	 * @kvm: kvm struct pointer
   703	 * @nr_spis: number of spis, frozen by caller
   704	 */
   705	int kvm_vgic_v5_irs_init(struct kvm *kvm, unsigned int nr_spis)
   706	{
   707		struct vgic_dist *dist = &kvm->arch.vgic;
   708		struct vgic_v5_irs *irs = dist->vgic_v5_irs_data;
   709		struct kvm_vcpu *vcpu0 = kvm_get_vcpu(kvm, 0);
   710		int i;
   711		phys_addr_t spi_ist_phys_base;
   712		size_t istsz, nr_spi_bits, istmd_sz, ist_l2sz;
   713		u64 mmfr0;
   714		int ret = 0;
   715	
   716		INIT_LIST_HEAD(&dist->vgic_v5_spi_ap_list_head);
   717		raw_spin_lock_init(&dist->vgic_v5_spi_ap_list_lock);
   718	
   719		/*
   720		 * We (KVM) allocate an Interrupt State Table (IST) for SPIs. The
   721		 * hardware mandates that lower 6 bits of the address are 0. Each ISTE
   722		 * is 4 bytes in size (or larger if metadata storage is required). In
   723		 * order to simplify the allocation logic, we round up the minimum
   724		 * number of SPIs to 16 (2^6 = 64, 64/4 = 16).
   725		 */
   726		if (nr_spis && nr_spis < 16)
   727			nr_spis = 16;
   728	
   729		if (nr_spis) {
   730			dist->spis = kcalloc(nr_spis, sizeof(struct vgic_irq),
   731					     GFP_KERNEL_ACCOUNT);
   732			if (!dist->spis)
   733				return -ENOMEM;
   734	
   735			/*
   736			 * In the following code we do not take the irq struct lock since
   737			 * no other action on irq structs can happen while the VGIC is
   738			 * not initialized yet:
   739			 * If someone wants to inject an interrupt or does a MMIO access,
   740			 * we require prior initialization in case of a virtual GICv3.
   741			 */
   742			for (i = 0; i < nr_spis; i++) {
   743				struct vgic_irq *irq = &dist->spis[i];
   744	
   745				/*
   746				 * We use the full GICv5-style IntID here, rather than
   747				 * just the index of the SPI. This helps to correctly
   748				 * identify the interrupt when injecting it.
   749				 */
   750				irq->intid = i | FIELD_PREP(GICV5_HWIRQ_TYPE,
   751							    GICV5_HWIRQ_TYPE_SPI);
   752				INIT_LIST_HEAD(&irq->ap_list);
   753				raw_spin_lock_init(&irq->irq_lock);
   754				irq->vcpu = NULL;
   755				irq->target_vcpu = vcpu0;
   756				refcount_set(&irq->refcount, 0);
   757				/*
   758				 * The guest controls the enable state, and again it is
   759				 * directly handled by the hardware. From our point of
   760				 * view it is always enabled.
   761				 */
   762				irq->enabled = 1;
   763				vgic_v5_set_spi_ops(irq);
   764			}
   765	
   766			nr_spi_bits = fls(roundup_pow_of_two(nr_spis)) - 1;
   767	
   768			istsz = GICV5_IRS_IST_CFGR_ISTSZ_4;
   769			if (vgic_v5_host_caps()->istmd) {
   770				istmd_sz = vgic_v5_host_caps()->istmd_sz;
   771	
   772				if (nr_spi_bits < istmd_sz)
   773					istsz = GICV5_IRS_IST_CFGR_ISTSZ_8;
   774				else
   775					istsz = GICV5_IRS_IST_CFGR_ISTSZ_16;
   776			}
   777	
   778			ret = vgic_v5_spi_ist_allocate(kvm, &spi_ist_phys_base,
   779						      nr_spi_bits, istsz);
   780			if (ret)
   781				return ret;
   782	
   783			ret = vgic_v5_vmte_assign_ist(kvm, spi_ist_phys_base, false,
 > 784						     nr_spi_bits, ist_l2sz, istsz,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

