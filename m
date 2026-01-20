Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2585D262A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 21:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IPW/Tiibf5Agq4KETYiHSyMUyI3h0jvp+z4ORATWDdc=; b=Pp4GnEC8L+04ox9vXU9idv9dqh
	FQOQcSE/xEFhWNnZH+fq8XEul6K/W7gxyAgqfNx/jee0nYwKpxRsOdLAQmSHKTJOVmzg4Hz6gDSmJ
	N2SEY2RbO3m22MiIfc4ZSoPtRc9YIYKkr5I0Wed/ZS9acUnzobHQDYiQVmzsjGPd1lrTL4P1+g4AH
	ZlgVqFDe537LgA9h2CH2jOemwf94oHVv7dgh9gp27F9WlEmWMY1zRF7HJybqT/1xp9fzqwuFdXpak
	BR08Qw9GAS4YiNtXETI91g7824rWI+rUz2aJTg8tY0eAwfM+oHxjpDs8fwne1ydmfGvB+aBRrkaFx
	cwaQ+tRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viIzF-00000004TPc-1nZJ;
	Tue, 20 Jan 2026 21:10:05 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viIzC-00000004TPE-0S1z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 21:10:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768943402; x=1800479402;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ivHtQ6gh6IXT2hO8yZKcCr+q7hqDkcejJS3fvf52Ppo=;
  b=Qf/4opCa5ESpQw/lRu/NTfJuA2nWFDkuAr2Pe2lz7WJLivxv01l0ND/Z
   HMPSxuQ9WLHfFtTatWSdQnrwUnxUEFaHMsOciSXzJYUxqs0pvOC/GeRHC
   ME7xP2UgaN8WDL2/15YBWVK5hfbwjF3bNCqWbkGllW5U9baQLWvqAxmdl
   AFWk9fKxIJsIxpYkKyAjscNheDfO/2SHMNNaFQA+agpQHQL5CeGLVZZFw
   FG14Gm2ukPYJR/oOrtnI0jCo1eNdfB/gwbhS3I6z41IVhFptAT0J0V48x
   1jmrn1x/B//O4Ggk4U4Y3XqVyMY0VmS+pHCt4BdQWphD20ITPYwD6Z/HJ
   w==;
X-CSE-ConnectionGUID: xQhHv4wVQj2iiqni3JhoPw==
X-CSE-MsgGUID: /F+23g1RR8uSr1UF8+0v4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="80791595"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="80791595"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 13:10:01 -0800
X-CSE-ConnectionGUID: AXjcRiQeSHCcT9bTnSKtZg==
X-CSE-MsgGUID: g2PZWbUQQhiY3dv6ggSIEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="237482957"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Jan 2026 13:09:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viIz1-00000000PXR-2Z9s;
	Tue, 20 Jan 2026 21:09:51 +0000
Date: Wed, 21 Jan 2026 05:09:48 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh R <mrathor@linux.microsoft.com>, linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-arch@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, kys@microsoft.com,
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
	longli@microsoft.com, catalin.marinas@arm.com, will@kernel.org,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, joro@8bytes.org,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, arnd@arndb.de,
	nunodasneves@linux.microsoft.com, mhklinux@outlook.com,
	romank@linux.microsoft.com
Subject: Re: [PATCH v0 01/15] iommu/hyperv: rename hyperv-iommu.c to
 hyperv-irq.c
Message-ID: <202601210423.wwOrf2K8-lkp@intel.com>
References: <20260120064230.3602565-2-mrathor@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120064230.3602565-2-mrathor@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_131002_169160_34842F84 
X-CRM114-Status: GOOD (  16.92  )
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

Hi Mukesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on pci/next pci/for-linus arm64/for-next/core clk/clk-next soc/for-next linus/master arnd-asm-generic/master v6.19-rc6 next-20260120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-R/iommu-hyperv-rename-hyperv-iommu-c-to-hyperv-irq-c/20260120-145832
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20260120064230.3602565-2-mrathor%40linux.microsoft.com
patch subject: [PATCH v0 01/15] iommu/hyperv: rename hyperv-iommu.c to hyperv-irq.c
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260121/202601210423.wwOrf2K8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210423.wwOrf2K8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601210423.wwOrf2K8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/intel/irq_remapping.c:6:
   include/linux/dmar.h:269:17: error: unknown type name '__u128'; did you mean '__u32'?
     269 |                 __u128 irte;
         |                 ^~~~~~
         |                 __u32
   drivers/iommu/intel/irq_remapping.c: In function 'modify_irte':
   drivers/iommu/intel/irq_remapping.c:181:17: error: unknown type name 'u128'
     181 |                 u128 old = irte->irte;
         |                 ^~~~
   In file included from arch/x86/include/asm/bug.h:193,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/asm-generic/bitops/generic-non-atomic.h:7,
                    from include/linux/bitops.h:28,
                    from include/linux/kernel.h:23,
                    from include/linux/interrupt.h:6,
                    from drivers/iommu/intel/irq_remapping.c:5:
   include/linux/atomic/atomic-arch-fallback.h:326:14: error: void value not ignored as it ought to be
     326 |         ___r = raw_cmpxchg128((_ptr), ___o, (_new)); \
         |              ^
   include/asm-generic/bug.h:110:32: note: in definition of macro 'WARN_ON'
     110 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4956:9: note: in expansion of macro 'raw_try_cmpxchg128'
    4956 |         raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/irq_remapping.c:182:26: note: in expansion of macro 'try_cmpxchg128'
     182 |                 WARN_ON(!try_cmpxchg128(&irte->irte, &old, irte_modified->irte));
         |                          ^~~~~~~~~~~~~~
   drivers/iommu/intel/irq_remapping.c: In function 'intel_ir_set_vcpu_affinity':
>> drivers/iommu/intel/irq_remapping.c:1270:40: warning: left shift count >= width of type [-Wshift-count-overflow]
    1270 |                                 ~(-1UL << PDA_HIGH_BIT);
         |                                        ^~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IRQ_REMAP
   Depends on [n]: IOMMU_SUPPORT [=y] && X86_64 [=n] && X86_IO_APIC [=y] && PCI_MSI [=y] && ACPI [=y]
   Selected by [y]:
   - HYPERV_IOMMU [=y] && IOMMU_SUPPORT [=y] && HYPERV [=y] && X86 [=y]


vim +1270 drivers/iommu/intel/irq_remapping.c

b106ee63abccbba drivers/iommu/intel_irq_remapping.c Jiang Liu           2015-04-13  1241  
8541186faf3b596 drivers/iommu/intel_irq_remapping.c Feng Wu             2015-06-09  1242  static int intel_ir_set_vcpu_affinity(struct irq_data *data, void *info)
8541186faf3b596 drivers/iommu/intel_irq_remapping.c Feng Wu             2015-06-09  1243  {
8541186faf3b596 drivers/iommu/intel_irq_remapping.c Feng Wu             2015-06-09  1244  	struct intel_ir_data *ir_data = data->chip_data;
53527ea1b70224d drivers/iommu/intel/irq_remapping.c Sean Christopherson 2025-06-11  1245  	struct intel_iommu_pi_data *pi_data = info;
8541186faf3b596 drivers/iommu/intel_irq_remapping.c Feng Wu             2015-06-09  1246  
ed1e48ea4370300 drivers/iommu/intel/irq_remapping.c Jacob Pan           2024-04-23  1247  	/* stop posting interrupts, back to the default mode */
53527ea1b70224d drivers/iommu/intel/irq_remapping.c Sean Christopherson 2025-06-11  1248  	if (!pi_data) {
2454823e97a63d8 drivers/iommu/intel/irq_remapping.c Sean Christopherson 2025-03-19  1249  		__intel_ir_reconfigure_irte(data, true);
8541186faf3b596 drivers/iommu/intel_irq_remapping.c Feng Wu             2015-06-09  1250  	} else {
8541186faf3b596 drivers/iommu/intel_irq_remapping.c Feng Wu             2015-06-09  1251  		struct irte irte_pi;
8541186faf3b596 drivers/iommu/intel_irq_remapping.c Feng Wu             2015-06-09  1252  
8541186faf3b596 drivers/iommu/intel_irq_remapping.c Feng Wu             2015-06-09  1253  		/*
8541186faf3b596 drivers/iommu/intel_irq_remapping.c Feng Wu             2015-06-09  1254  		 * We are not caching the posted interrupt entry. We
8541186faf3b596 drivers/iommu/intel_irq_remapping.c Feng Wu             2015-06-09  1255  		 * copy the data from the remapped entry and modify
8541186faf3b596 drivers/iommu/intel_irq_remapping.c Feng Wu             2015-06-09  1256  		 * the fields which are relevant for posted mode. The
8541186faf3b596 drivers/iommu/intel_irq_remapping.c Feng Wu             2015-06-09  1257  		 * cached remapped entry is used for switching back to
8541186faf3b596 drivers/iommu/intel_irq_remapping.c Feng Wu             2015-06-09  1258  		 * remapped mode.
8541186faf3b596 drivers/iommu/intel_irq_remapping.c Feng Wu             2015-06-09  1259  		 */
8541186faf3b596 drivers/iommu/intel_irq_remapping.c Feng Wu             2015-06-09  1260  		memset(&irte_pi, 0, sizeof(irte_pi));
8541186faf3b596 drivers/iommu/intel_irq_remapping.c Feng Wu             2015-06-09  1261  		dmar_copy_shared_irte(&irte_pi, &ir_data->irte_entry);
8541186faf3b596 drivers/iommu/intel_irq_remapping.c Feng Wu             2015-06-09  1262  
8541186faf3b596 drivers/iommu/intel_irq_remapping.c Feng Wu             2015-06-09  1263  		/* Update the posted mode fields */
8541186faf3b596 drivers/iommu/intel_irq_remapping.c Feng Wu             2015-06-09  1264  		irte_pi.p_pst = 1;
8541186faf3b596 drivers/iommu/intel_irq_remapping.c Feng Wu             2015-06-09  1265  		irte_pi.p_urgent = 0;
53527ea1b70224d drivers/iommu/intel/irq_remapping.c Sean Christopherson 2025-06-11  1266  		irte_pi.p_vector = pi_data->vector;
53527ea1b70224d drivers/iommu/intel/irq_remapping.c Sean Christopherson 2025-06-11  1267  		irte_pi.pda_l = (pi_data->pi_desc_addr >>
8541186faf3b596 drivers/iommu/intel_irq_remapping.c Feng Wu             2015-06-09  1268  				(32 - PDA_LOW_BIT)) & ~(-1UL << PDA_LOW_BIT);
53527ea1b70224d drivers/iommu/intel/irq_remapping.c Sean Christopherson 2025-06-11  1269  		irte_pi.pda_h = (pi_data->pi_desc_addr >> 32) &
8541186faf3b596 drivers/iommu/intel_irq_remapping.c Feng Wu             2015-06-09 @1270  				~(-1UL << PDA_HIGH_BIT);
8541186faf3b596 drivers/iommu/intel_irq_remapping.c Feng Wu             2015-06-09  1271  
688124cc541f60d drivers/iommu/intel/irq_remapping.c Sean Christopherson 2025-03-19  1272  		ir_data->irq_2_iommu.posted_vcpu = true;
8541186faf3b596 drivers/iommu/intel_irq_remapping.c Feng Wu             2015-06-09  1273  		modify_irte(&ir_data->irq_2_iommu, &irte_pi);
8541186faf3b596 drivers/iommu/intel_irq_remapping.c Feng Wu             2015-06-09  1274  	}
8541186faf3b596 drivers/iommu/intel_irq_remapping.c Feng Wu             2015-06-09  1275  
8541186faf3b596 drivers/iommu/intel_irq_remapping.c Feng Wu             2015-06-09  1276  	return 0;
8541186faf3b596 drivers/iommu/intel_irq_remapping.c Feng Wu             2015-06-09  1277  }
8541186faf3b596 drivers/iommu/intel_irq_remapping.c Feng Wu             2015-06-09  1278  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

