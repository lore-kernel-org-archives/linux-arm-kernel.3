Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2293E6C5F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 07:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i4ZSxjj++F6niM6MGkHfYxcazXxj7CnxPlbQm2mXX0Y=; b=3hhYIBkZQoo1BA3sMSgcA74RgC
	3Ee4hjGiyOuO40tfAK8hLrD+x8dTe9lK18cVwKa/hov0mKJMPhiqqdym1mC47AOpE9pbmrxVsvpRo
	3Z+qDDbQkPxvcDS+xQtttVqV6Qru5pkwmFQuAtpQfmSgLxgfIBKeJWY1rTKcate6RuGYOlCPFstfP
	Jp3k0nlIAeNfINXTOo+GO/J76Ss3FcbvQI4I93X3AbxeTyXmetYrJ/OHacOfJ74+nDq9CdGdoK5kL
	SmeMjZ/VrdXqDC1dxADpLkuywuywlSOWcHF3wLEbsgTfGw0vVsqI3JIFao+D1nEsq/lTR6LfqLRwW
	jat0KtQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXwQe-0000000Ed9M-2Pnr;
	Tue, 23 Dec 2025 07:03:32 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXwQb-0000000Ed8u-245w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 07:03:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766473409; x=1798009409;
  h=date:from:to:cc:subject:message-id;
  bh=OYAAOtt4UHChAD9CsR3wfzaIzubmt9+lGh284vG7Re0=;
  b=O1pLffRBvEApa41NQE54b4T9dGUHxr6DGRV0Xu4cA3tm19DqulsOpMKm
   eyzVH5xKhM1OayLy8ZdgxGXwzGFXjz9/pbhUS/XyoBH/tBpwVqP9C2R8z
   7SxSo2UwNCOiidyDLxFOwg5j7PSoVfj8hwy/xMnN7E9zGvrr+xDJUfhsp
   l4TsQmyi++92hTA2lnnaEikXSgjZzdxSJQzKLozY/tGUa8wsCFNbcV90b
   quV+WfE7M+4zevFQcF/5qUnVMZHArATDlvZl8wPnnMR4UNubfUDXunvYr
   1c68beYVl1MUMJ9KmxnjBU3INmoLjmWY95MJd2q8+4jEsbfEJmdX+H5o3
   Q==;
X-CSE-ConnectionGUID: Fk6CDqguRa6mlgmR93bKMQ==
X-CSE-MsgGUID: Vp1R2s4NTvm9IvY2Jm9RAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="85909428"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="85909428"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 23:03:28 -0800
X-CSE-ConnectionGUID: iY3TBslkSuqASOhb2LyBXg==
X-CSE-MsgGUID: uJKulmm/SXmELJJJEQhcCA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 22 Dec 2025 23:03:26 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXwQX-000000001Z7-0sKk;
	Tue, 23 Dec 2025 07:03:25 +0000
Date: Tue, 23 Dec 2025 15:02:49 +0800
From: kernel test robot <lkp@intel.com>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/gicv5-full 42/82]
 arch/arm64/kvm/vgic/vgic-v5-tables.c:502:2-7: WARNING: NULL check before some
 freeing functions is not needed.
Message-ID: <202512231452.XlBbTBAN-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_230329_584732_823F759C 
X-CRM114-Status: GOOD (  13.14  )
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
config: arm64-randconfig-r064-20251223 (https://download.01.org/0day-ci/archive/20251223/202512231452.XlBbTBAN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512231452.XlBbTBAN-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/vgic/vgic-v5-tables.c:502:2-7: WARNING: NULL check before some freeing functions is not needed.
   arch/arm64/kvm/vgic/vgic-v5-tables.c:504:2-7: WARNING: NULL check before some freeing functions is not needed.
   arch/arm64/kvm/vgic/vgic-v5-tables.c:506:2-7: WARNING: NULL check before some freeing functions is not needed.
   arch/arm64/kvm/vgic/vgic-v5-tables.c:508:2-7: WARNING: NULL check before some freeing functions is not needed.
--
>> arch/arm64/kvm/vgic/vgic-v5-tables.c:473:42-48: ERROR: application of sizeof to pointer
--
>> arch/arm64/kvm/vgic/vgic-v5-tables.c:391:5-10: WARNING: Unsigned expression compared with zero: vm_id < 0

vim +502 arch/arm64/kvm/vgic/vgic-v5-tables.c

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
   385		if (!vgic_v5_vmt_allocated()) {
   386			kvm_err("VMT is not allocated; cannot populate\n");
   387			ret = -EINVAL;
   388			goto out_fail;
   389		}
   390	
 > 391		if (vm_id < 0) {
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
 > 473		vped_ptrs = kzalloc(vmt_info->max_vpes * sizeof(vped_ptrs), GFP_KERNEL);
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
 > 502			kfree(vmd);
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

