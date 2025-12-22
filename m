Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F7AE677F4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 16:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3FVIf7vIEPyDQ9uj2NQmFjVXeiBrTH6RyW05AUPCDg8=; b=UgxPJ7KlfjLkapRPN0eknFLk8I
	7DxmELERofE6NDFA3Z2B6vAue2Ikv3xG9ECMlw62nk6HeKaHj5la2VYSAnerFhVF/Xf+cDko1KWhc
	Ta5i1N+4PzQhn8mtJuCyEjV8mpV87HNSA1HrfD/sSDT7qwRePadBRau4uM7j+dphUIyBNpqR2LXzr
	7RAQc9l370cn2pc7LWgzJWCtkdbpyPvZXjL57APHQrJrYoc6CJdFw36iTZqAkXYNk+Jedyzxk7Znj
	gj/9OEMYuNql/n/qUBWa/7JqRGAbnIoPNcgQ3Mfv5NkH/SU7qcV6uK6YRdXmqbAXPDOzow+g+yphg
	mtzEfKuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXj7F-0000000DzEj-2v4F;
	Mon, 22 Dec 2025 16:50:37 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXj7A-0000000DzCf-2in6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 16:50:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766422233; x=1797958233;
  h=date:from:to:cc:subject:message-id;
  bh=96mVW64sPhr23FAIg0rYVwkHsM/AYJRpkhj2jG4xsEw=;
  b=RA/DSmWIiMR+KXzbzeq0NfiWOHLUeYq94cYks5wc0NBxy+T10/p1lVT+
   ++9nua/G5bfw+Msnu4+abkHDYC1GntqjJPWm7ynuT92lLtWZuiE0niH27
   Z0Gt588MUIOwSpxgA+Vw9MZc6s1gQpmoF+kiLniLnELzHqa03CXt7PwOm
   N4EEI3fJgjncRD3uUsA8hT1k+KwFVewSu25MXd2Br+0OxjX1V25MLK43r
   IJcWqep9v+cjvxIXD3iup4zqu7K5IUgKb/iEFrU9Yi9CMhBoL8ARQrEBt
   PjJFqmrKSOIN60nPlCUbI9QNSSbPTjN7cSz/0JHexpDDM97WDmzJB4oqM
   Q==;
X-CSE-ConnectionGUID: 1N7CF4wHSYGSGKXMeIcNZw==
X-CSE-MsgGUID: KSWqD7gbQ3KUMSfEitzN2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68170021"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="68170021"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 08:50:32 -0800
X-CSE-ConnectionGUID: RT4ESgfhQOigO46UYGpW/A==
X-CSE-MsgGUID: ZZhr6vZkSGiESP+pWe7l1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="230224264"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 22 Dec 2025 08:50:30 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXj75-000000000tH-48Gg;
	Mon, 22 Dec 2025 16:50:27 +0000
Date: Tue, 23 Dec 2025 00:50:04 +0800
From: kernel test robot <lkp@intel.com>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/gicv5-full 48/82]
 arch/arm64/kvm/vgic/vgic-v5.c:737:26: warning: variable 'd' set but not used
Message-ID: <202512230041.45OmXxwl-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_085032_733947_6301DEBE 
X-CRM114-Status: GOOD (  13.57  )
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
commit: 784f082a09f253879e4c4f57182b3a7e0bb92539 [48/82] KVM: arm64: gic-v5: Init/tear down VMTEs
config: arm64-randconfig-003-20251222 (https://download.01.org/0day-ci/archive/20251223/202512230041.45OmXxwl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230041.45OmXxwl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230041.45OmXxwl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/vgic/vgic-v5.c: In function 'vgic_v5_init':
>> arch/arm64/kvm/vgic/vgic-v5.c:737:26: warning: variable 'd' set but not used [-Wunused-but-set-variable]
     737 |         struct irq_data *d;
         |                          ^
   At top level:
   arch/arm64/kvm/vgic/vgic-v5.c:174:12: warning: 'vgic_v5_irs_assign_vmt' defined but not used [-Wunused-function]
     174 | static int vgic_v5_irs_assign_vmt(bool two_level, u8 vm_id_bits, phys_addr_t vmt_base)
         |            ^~~~~~~~~~~~~~~~~~~~~~


vim +/d +737 arch/arm64/kvm/vgic/vgic-v5.c

   722	
   723	/*
   724	 * Claim and populate a VMTE (optionally making a new L2 VMT valid), create VPE
   725	 * doorbells, allocate VPET and populate for each VPE. Finally, we also init the
   726	 * vIRS, which means allocating and making the virtual SPI IST valid.
   727	 *
   728	 * Note: We do need to put the cart before the horse here. The VPE doorbells are
   729	 * our conduit for communication with the IRS, which means we need to have those
   730	 * before making the VMTE valid.
   731	 */
   732	int vgic_v5_init(struct kvm *kvm)
   733	{
   734		int nr_vcpus, ret = 0;
   735		struct kvm_vcpu *vcpu, *vcpu0;
   736		unsigned long i;
 > 737		struct irq_data *d;
   738		unsigned int db_virq;
   739	
   740		if (!vgic_v5_vmt_allocated()) {
   741			pr_err("No VM tables allocated; something is horribly wrong\n");
   742			return -ENODEV;
   743		}
   744	
   745		kvm_for_each_vcpu(i, vcpu, kvm) {
   746			if (vcpu_has_nv(vcpu)) {
   747				kvm_err("Nested GICv5 VMs are currently unsupported\n");
   748				return -EINVAL;
   749			}
   750		}
   751		nr_vcpus = atomic_read(&kvm->online_vcpus);
   752		if (WARN_ON(nr_vcpus == 0)) {
   753			ret = -ENODEV;
   754			goto fail;
   755	
   756		}
   757		kvm->arch.vgic.gicv5_vm.nr_vpes = nr_vcpus;
   758	
   759		/*
   760		 * We only allow userspace to drive the SW_PPI, if it is
   761		 * implemented.
   762		 */
   763		kvm->arch.vgic.gicv5_vm.userspace_ppis[0] = GICV5_SW_PPI & GICV5_HWIRQ_ID;
   764		kvm->arch.vgic.gicv5_vm.userspace_ppis[0] &= ppi_caps->impl_ppi_mask[0];
   765		kvm->arch.vgic.gicv5_vm.userspace_ppis[1] = 0;
   766	
   767		ret = vgic_v5_allocate_vm_id(kvm);
   768		if (ret)
   769			goto fail;
   770	
   771		if (vgic_v5_create_per_vm_domain(&kvm->arch.vgic.gicv5_vm))
   772			goto fail_cleanup_id;
   773	
   774		/*
   775		 * Allocate VPE doorbells first - these are our conduit for
   776		 * communicating with the host irqchip driver. Can't do any earlier as
   777		 * we wouldn't know the VM ID.
   778		 */
   779		db_virq = irq_domain_alloc_irqs(kvm->arch.vgic.gicv5_vm.domain,
   780						nr_vcpus, NUMA_NO_NODE,
   781						&kvm->arch.vgic.gicv5_vm);
   782		if (db_virq < 0) {
   783			ret = db_virq;
   784			goto fail_cleanup_domain;
   785		}
   786		kvm->arch.vgic.gicv5_vm.vpe_db_base = db_virq;
   787	
   788		kvm_for_each_vcpu(i, vcpu, kvm) {
   789			d = irq_domain_get_irq_data(kvm->arch.vgic.gicv5_vm.domain,
   790						    db_virq + i);
   791			irq_set_status_flags(db_virq + i, IRQ_NOAUTOEN);
   792	
   793			ret = request_irq(db_virq + i, db_handler, 0, "vcpu", vcpu);
   794			if (ret)
   795				goto fail_cleanup_partial_dbs;
   796	
   797			/* Stash it with the VCPU for easy retrieval */
   798			vcpu->arch.vgic_cpu.vgic_v5.gicv5_vpe.db = db_virq + i;
   799		}
   800	
   801		/* Populate VMTE (with VPET and VM descriptor) */
   802		ret = vgic_v5_vmte_init(kvm);
   803		if (ret)
   804			goto fail_cleanup_dbs;
   805	
   806		/* We pick the first vcpu to make the VMTE valid - any would do */
   807		vcpu0 = kvm_get_vcpu(kvm, 0);
   808		ret = vgic_v5_send_command(vcpu0, VMTE_MAKE_VALID);
   809		if (ret)
   810			goto fail_cleanup_vmte;
   811	
   812		/* Loop over all VPEs, allocate/populate their data structures */
   813		kvm_for_each_vcpu(i, vcpu, kvm) {
   814			ret = vgic_v5_vmte_alloc_vpe(vcpu);
   815			if (ret)
   816				goto fail_cleanup_vpes;
   817		}
   818	
   819		return ret;
   820	
   821	fail_cleanup_vpes:
   822		/* i contains the first vCPU that failed */
   823		if (i == 0)
   824			goto fail_cleanup_vmte;
   825	
   826		do {
   827			vcpu = kvm_get_vcpu(kvm, --i);
   828			vgic_v5_vmte_free_vpe(vcpu);
   829		} while (i != 0);
   830	
   831	fail_cleanup_vmte:
   832		vgic_v5_vmte_release(kvm);
   833	
   834	fail_cleanup_dbs:
   835		i = nr_vcpus;
   836	fail_cleanup_partial_dbs:
   837		/* i contains the first vCPU that failed */
   838		if (i == 0)
   839			goto fail_cleanup_domain;
   840	
   841		do {
   842			vcpu = kvm_get_vcpu(kvm, --i);
   843			vgic_v5_disable_vcpu(vcpu);
   844		} while (i != 0);
   845	
   846	fail_cleanup_domain:
   847		vgic_v5_teardown_per_vm_domain(&kvm->arch.vgic.gicv5_vm);
   848	
   849	fail_cleanup_id:
   850		vgic_v5_release_vm_id(kvm);
   851	
   852	fail:
   853		return ret;
   854	}
   855	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

