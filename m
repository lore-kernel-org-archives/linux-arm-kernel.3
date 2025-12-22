Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E98E6B260
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 23:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VZgemvbq2UPsthBmuzg1RXjIe3SH9WUJ3i0KwNEIJ+Q=; b=10Yy6FvfROFeQ+gEJLDs/JxQ5l
	+CJL5XC2I1VrRXL+3/+jg36zNtIuPAncf/Ui0GF/1WQ+XvxEcDXd5ZhBmwk89N32aQxZPMrkhOs7/
	kWeHjOXI4a5bnt3huRyTk4YQGcWdYhBieI9VO+YFqyw6LkYycv9pyEuSPSuP+JTyJHhNjA9xRt4dH
	or/wbJ7v7JMTqbGKXsHhiZy+kHxMYOVMY4rngg/5GbBMLVivnjbGRVMPO6KEm1ex+P888G+MJQzxx
	3uFPLcOICbmtAmqx+nMzhS0vrj8ZrqKXCWKlPHE1kAZidJh89YbZlBI32vW2wtnGc2ilG5huBSTkZ
	AdMGoJjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXpng-0000000EHTz-3Tsx;
	Mon, 22 Dec 2025 23:58:52 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXpnd-0000000EHTb-1UAX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 23:58:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766447930; x=1797983930;
  h=date:from:to:cc:subject:message-id;
  bh=KzVR2g280YZkfI3eeA+zGnqzICxm4EfKBt86UW+btdY=;
  b=oHW76vqSA24GoleWJ8B+rqRuQ5b74ev4jgVjQtW4GWhdfQAyJJeELPnp
   NUddkOyOIInH4E1k3qDheaLOhh25tXelWtyjOXH5r01/qzEQ1ve+5xXq8
   Se2u75KKRWdC5hwZEy7U1PuKszRtvux7JFt06G2ZltrlgYzijkN9N1KUy
   023Xhi3EfKzUvwYkwlT9gJvjSqIc25VaneVVu8/OBH9/6z+rrOiVW+rNk
   l8HojKZVgf8l2gd3hI2u30duALaQ21snNJm22VFmd3gaxT3Ydz/eRkdPh
   KK/VdmfD9MRAEdX/ad+7osUMupHdrinYpwqxd0YSVNbHhEm9t+FfGOLz4
   g==;
X-CSE-ConnectionGUID: y0tjlTyvRNSst2v7pDHZXg==
X-CSE-MsgGUID: M03keSWVQyGtqvspbGEelg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79420824"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="79420824"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 15:58:47 -0800
X-CSE-ConnectionGUID: zO7L59eUTEKGxkmCH/oSKQ==
X-CSE-MsgGUID: oHt/qga/SjKgHYs/SK6j3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="237048305"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 22 Dec 2025 15:58:45 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXpnW-000000001F0-3tht;
	Mon, 22 Dec 2025 23:58:42 +0000
Date: Tue, 23 Dec 2025 07:58:22 +0800
From: kernel test robot <lkp@intel.com>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/gicv5-full 42/82]
 arch/arm64/kvm/vgic/vgic-v5-tables.c:385:6: warning: variable 'vmi' is used
 uninitialized whenever 'if' condition is true
Message-ID: <202512230706.u4lubWCl-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_155849_476912_524616E1 
X-CRM114-Status: GOOD (  14.99  )
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
commit: a994bc0447523a526e17ae0a62024bf8ef371ce6 [42/82] KVM: arm64: gic-v5: Create, manage, and teardown VMT & VPETs
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251223/202512230706.u4lubWCl-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230706.u4lubWCl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230706.u4lubWCl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/vgic/vgic-v5-tables.c:385:6: warning: variable 'vmi' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     385 |         if (!vgic_v5_vmt_allocated()) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/vgic/vgic-v5-tables.c:507:6: note: uninitialized use occurs here
     507 |         if (vmi)
         |             ^~~
   arch/arm64/kvm/vgic/vgic-v5-tables.c:385:2: note: remove the 'if' if its condition is always false
     385 |         if (!vgic_v5_vmt_allocated()) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     386 |                 kvm_err("VMT is not allocated; cannot populate\n");
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     387 |                 ret = -EINVAL;
         |                 ~~~~~~~~~~~~~~
     388 |                 goto out_fail;
         |                 ~~~~~~~~~~~~~~
     389 |         }
         |         ~
   arch/arm64/kvm/vgic/vgic-v5-tables.c:377:20: note: initialize the variable 'vmi' to silence this warning
     377 |         gicv5_vm_info *vmi;
         |                           ^
         |                            = NULL
   1 warning generated.


vim +385 arch/arm64/kvm/vgic/vgic-v5-tables.c

   357	
   358	/*
   359	 * Initialise an entry in the VMT based on the index of the VM. We
   360	 * make the assumption that our VM ID is zero based, and that we can
   361	 * use it to index into the VMT. We check that the index is in the
   362	 * allowed range, just in case.
   363	 *
   364	 * We allocate:
   365	 *     * The VM Descriptor
   366	 *     * The VPE Table
   367	 *
   368	 * We set:
   369	 *     * The VPE ID Bits
   370	 *
   371	 * Note: We don't mark the VMTE as valid as this needs to be done by
   372	 * the hardware..
   373	 */
   374	int vgic_v5_vmte_init(struct kvm *kvm)
   375	{
   376		struct vmtl2_entry *vmte;
   377		gicv5_vm_info *vmi;
   378		void *vmd = NULL, *vpet = NULL;
   379		void **vped_ptrs = NULL;
   380		size_t vpet_alloc_size;
   381		int ret;
   382		u64 tmp;
   383		u16 vm_id = vgic_v5_vm_id(kvm);
   384	
 > 385		if (!vgic_v5_vmt_allocated()) {
   386			kvm_err("VMT is not allocated; cannot populate\n");
   387			ret = -EINVAL;
   388			goto out_fail;
   389		}
   390	
   391		if (vm_id < 0) {
   392			kvm_err("Failed to find free vm_id\n");
   393			return vm_id;
   394		}
   395	
   396		if (vgic_v5_alloc_l2_vmt(kvm)) {
   397			kvm_err("Failed to make the L2 VMTE valid!\n");
   398			return -EIO;
   399		}
   400	
   401		ret = vgic_v5_get_l2_vmte(vm_id, &vmte);
   402		if (ret) {
   403			kvm_err("Failed to look up VMTE\n");
   404			return ret;
   405		}
   406	
   407		if (FIELD_GET(GICV5_VMTEL2E_VALID, vmte->val[0])) {
   408			kvm_err("Attempt to initialize a valid VMTE (0x%x)!\n", vm_id);
   409			return -EINVAL;
   410		}
   411	
   412		ret = vgic_v5_reset_vmte(vm_id);
   413		if (ret) {
   414			kvm_err("Failed to reset VMTE\n");
   415			return ret;
   416		}
   417	
   418		vmi = kzalloc(sizeof(gicv5_vm_info), GFP_KERNEL);
   419		if (vmi == NULL) {
   420			ret = -ENOMEM;
   421			goto out_fail;
   422		}
   423	
   424		/* Allocate and assign the VM Descriptor, if requested. */
   425		if (vmt_info->vmd_size != 0) {
   426			vmd = kzalloc(vmt_info->vmd_size, GFP_KERNEL);
   427			if (vmd == NULL) {
   428				kvm_err("Failed to allocate memory for VM Descriptor\n");
   429				ret = -ENOMEM;
   430				goto out_fail;
   431			}
   432	
   433			if (!IS_ALIGNED((u64)vmd, vmt_info->vmd_size)) {
   434				kvm_err("VMD is incorrectly aligned\n");
   435				ret = -EFAULT;
   436				goto out_fail;
   437			}
   438	
   439			/* Stash the VA so we can free it later */
   440			vmi->vmd_base = vmd;
   441	
   442			tmp = FIELD_PREP(GICV5_VMTEL2E_VMD_ADDR,
   443					virt_to_phys(vmd) >>
   444					GICV5_VMTEL2E_VMD_ADDR_SHIFT);
   445			WRITE_ONCE(vmte->val[0], cpu_to_le64(tmp));
   446		}
   447	
   448		/*
   449		 * Allocate and assign the VPE Table.
   450		 */
   451		vpet_alloc_size = sizeof(vpe_entry) * vmt_info->max_vpes;
   452		vpet = kzalloc(vpet_alloc_size, GFP_KERNEL);
   453		if (vpet == NULL) {
   454			kvm_err("Failed to allocate memory for VPE Table\n");
   455			ret = -ENOMEM;
   456			goto out_fail;
   457		}
   458	
   459		if (!IS_ALIGNED((u64)vpet, vpet_alloc_size)) {
   460			kvm_err("VPET is incorrectly aligned\n");
   461			ret = -EFAULT;
   462			goto out_fail;
   463		}
   464	
   465		/* Stash the VA so we can free it later */
   466		vmi->vpet_base = vpet;
   467	
   468		tmp = FIELD_PREP(GICV5_VMTEL2E_VPET_ADDR,
   469				virt_to_phys(vpet) >> GICV5_VMTEL2E_VPET_ADDR_SHIFT);
   470		tmp |= FIELD_PREP(GICV5_VMTEL2E_VPE_ID_BITS, fls(vmt_info->max_vpes) - 1);
   471		WRITE_ONCE(vmte->val[1], cpu_to_le64(tmp));
   472	
   473		vped_ptrs = kzalloc(vmt_info->max_vpes * sizeof(vped_ptrs), GFP_KERNEL);
   474		if (vped_ptrs == NULL) {
   475			kvm_err("Failed to allocate memory for VPED tracking\n");
   476			ret = -ENOMEM;
   477			goto out_fail;
   478		}
   479		vmi->vped_ptrs = vped_ptrs;
   480	
   481		if (gicv5_host_ist_caps.irs_non_coherent) {
   482			if (vmd)
   483				dcache_clean_inval_poc((unsigned long)vmd,
   484						       (unsigned long)vmd + vmt_info->vmd_size);
   485			if (vpet)
   486				dcache_clean_inval_poc((unsigned long)vpet,
   487						       (unsigned long)vpet + vpet_alloc_size);
   488			dcache_clean_poc((unsigned long)vmte,
   489					 (unsigned long)vmte + sizeof(*vmte));
   490		} else {
   491			dsb(ishst);
   492		}
   493	
   494		ret = xa_insert(&vm_info, vm_id, vmi, GFP_KERNEL);
   495		if (ret)
   496			goto out_fail;
   497	
   498		return 0;
   499	
   500	out_fail:
   501		if (vmd)
   502			kfree(vmd);
   503		if (vpet)
   504			kfree(vpet);
   505		if (vped_ptrs)
   506			kfree(vped_ptrs);
   507		if (vmi)
   508			kfree(vmi);
   509	
   510		vgic_v5_reset_vmte(vm_id);
   511	
   512		return ret;
   513	}
   514	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

