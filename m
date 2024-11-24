Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB3AE668BC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 19:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DjUH+o7Zc6/bi6ol9QFkyKV/TQAgUu2SDeonPt1aGT8=; b=lYZZ4ClwRD0Dmnq5mtwdpEjStr
	2T1hJWVgQuWEgckO2iTXB+csRktnhxW9C1sPumvMSYTZJD8FdwOe1rtqYLkrEnRkHtQ37a4qj3eej
	I4y9TTSps/FGnK7pS9P+jI/psI+9C6Tej/nAW75nM8waSbvjL/9fij9oYu3ycGvThmBoSfNyEgjfH
	HleOEJyk+Ph6pp5kVFxHovDMIF2+KHjZo/4rU8DPUsO3D419qbdz5mDsNdx2DKjt6v9eYvdV+D8ap
	9bHFG4s8ziH2Gjd/pQP0VPmcYFulXSRnLP8MnNmJArIQ4lULSfRyTcOCpWYCQ8BE+GbeKh0B4nS3m
	pnju0+kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFIWW-00000006al0-1IXI;
	Sun, 24 Nov 2024 19:44:00 +0000
Received: from [198.175.65.10] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFIVZ-00000006ahA-01il
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 19:43:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732477381; x=1764013381;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1h4BcuyvvEVLEHYpHlgsXSM2L17Jzh8Omzewenc3ugc=;
  b=Amn5GGa2+gO53f2lLkNbDoWZoFaLNtE0Qm76vpfES6fcvAU1PL2MydlI
   RwjhGCu6RPOHNRTyKY3gqh3xdLX/ih+0XwY7rgh7t78xIHu4m8avSxcCW
   S5j11VyeHk3hjuzvfVJKMljt1Xeho8crAgeZZsaPy2HkX/eZPlpo3H3eZ
   5ZbfgY5ReeoYLX2AvSG1R1OTRflrjfZUUhe+5LIUx4TDui+0UpcNpG77w
   Vaq9RQTN+iu6s44GAWf0tlCQq8iMi+Pkpqwa9/Mlci1iOd7s438A92xWB
   Jc/Z8tBGB9NPhSd9qxTsUhYIcFNpWPnf4CZ2DtvfwfJli9JUNxuRmAaOo
   A==;
X-CSE-ConnectionGUID: SlVk2fA4T1CkEHb6EwB3hA==
X-CSE-MsgGUID: GGN7seh6SxqGJE9XYmH03A==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="49987877"
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="49987877"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 11:42:59 -0800
X-CSE-ConnectionGUID: TpHfrTAvS9mtiPtLW+Mivg==
X-CSE-MsgGUID: jDw+b8GoRkCXktJH8PQJ1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="91867666"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 Nov 2024 11:42:57 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFIVT-0005C9-2V;
	Sun, 24 Nov 2024 19:42:55 +0000
Date: Mon, 25 Nov 2024 03:41:56 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Jintack Lim <jintack@cs.columbia.edu>,
	Christoffer Dall <christoffer.dall@arm.com>
Subject: [arm-platforms:kvm-arm64/nv-gic 4/11]
 arch/arm64/kvm/vgic/vgic-init.c:207: warning: expecting prototype for
 kvm_vgic_vcpu_init(). Prototype was for vgic_allocate_private_irqs_locked()
 instead
Message-ID: <202411250324.1ah9afGm-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_114301_122995_EA683B80 
X-CRM114-Status: GOOD (  11.75  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/nv-gic
head:   f02c94e64607418b939b5660440a826b405e383d
commit: 05a6e17890c506952c27f53d3dd8ebabc83ab0ad [4/11] KVM: arm64: nv: Nested GICv3 Support
config: arm64-randconfig-003-20241124 (https://download.01.org/0day-ci/archive/20241125/202411250324.1ah9afGm-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411250324.1ah9afGm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411250324.1ah9afGm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/vgic/vgic-init.c:207: warning: expecting prototype for kvm_vgic_vcpu_init(). Prototype was for vgic_allocate_private_irqs_locked() instead


vim +207 arch/arm64/kvm/vgic/vgic-init.c

05a6e17890c5069 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  196  
05a6e17890c5069 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  197  /**
05a6e17890c5069 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  198   * kvm_vgic_vcpu_init() - Initialize static VGIC VCPU data
05a6e17890c5069 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  199   * structures and register VCPU-specific KVM iodevs
05a6e17890c5069 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  200   *
05a6e17890c5069 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  201   * @vcpu: pointer to the VCPU being created and initialized
05a6e17890c5069 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  202   *
05a6e17890c5069 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  203   * Only do initialization, but do not actually enable the
05a6e17890c5069 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  204   * VGIC CPU interface
05a6e17890c5069 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  205   */
03b3d00a70b5585 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  206  static int vgic_allocate_private_irqs_locked(struct kvm_vcpu *vcpu)
1aab6f468c10a1e virt/kvm/arm/vgic/vgic-init.c   Christoffer Dall 2017-05-08 @207  {
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  208  	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  209  	int i;
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  210  
03b3d00a70b5585 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  211  	lockdep_assert_held(&vcpu->kvm->arch.config_lock);
c011f4ea106b94e virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  212  
03b3d00a70b5585 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  213  	if (vgic_cpu->private_irqs)
03b3d00a70b5585 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  214  		return 0;
03b3d00a70b5585 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  215  
03b3d00a70b5585 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  216  	vgic_cpu->private_irqs = kcalloc(VGIC_NR_PRIVATE_IRQS,
03b3d00a70b5585 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  217  					 sizeof(struct vgic_irq),
03b3d00a70b5585 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  218  					 GFP_KERNEL_ACCOUNT);
03b3d00a70b5585 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  219  
03b3d00a70b5585 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  220  	if (!vgic_cpu->private_irqs)
03b3d00a70b5585 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  221  		return -ENOMEM;
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  222  
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  223  	/*
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  224  	 * Enable and configure all SGIs to be edge-triggered and
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  225  	 * configure all PPIs as level-triggered.
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  226  	 */
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  227  	for (i = 0; i < VGIC_NR_PRIVATE_IRQS; i++) {
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  228  		struct vgic_irq *irq = &vgic_cpu->private_irqs[i];
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  229  
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  230  		INIT_LIST_HEAD(&irq->ap_list);
8fa3adb8c6beee4 virt/kvm/arm/vgic/vgic-init.c   Julien Thierry   2019-01-07  231  		raw_spin_lock_init(&irq->irq_lock);
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  232  		irq->intid = i;
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  233  		irq->vcpu = NULL;
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  234  		irq->target_vcpu = vcpu;
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  235  		kref_init(&irq->refcount);
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  236  		if (vgic_irq_is_sgi(i)) {
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  237  			/* SGIs */
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  238  			irq->enabled = 1;
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  239  			irq->config = VGIC_CONFIG_EDGE;
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  240  		} else {
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  241  			/* PPIs */
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  242  			irq->config = VGIC_CONFIG_LEVEL;
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  243  		}
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  244  	}
1aab6f468c10a1e virt/kvm/arm/vgic/vgic-init.c   Christoffer Dall 2017-05-08  245  
03b3d00a70b5585 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  246  	return 0;
03b3d00a70b5585 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  247  }
03b3d00a70b5585 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  248  

:::::: The code at line 207 was first introduced by commit
:::::: 1aab6f468c10a1ec3977fb6f7bc12869174d516e KVM: arm/arm64: Register iodevs when setting redist base and creating VCPUs

:::::: TO: Christoffer Dall <cdall@linaro.org>
:::::: CC: Christoffer Dall <cdall@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

