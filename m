Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247B9D59F7A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 08:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wRNDaAeI5HqR9GvBSy96Ik3Fc8MEF/Ll0r6pu6cWsu0=; b=dWZZcj8PDd33YrFZxV57mOXgjc
	31LCnwmIADn1ufcOirZzyBWNhklDV8PcZEhXjUyKhthLtVdIAQb1TRSOeX9ZRGMNOCopBmoXP5TOl
	nQoWPO5kMIxHW+hJ0pIGy5pfZoJiHTMYIb+Vh4bHIoCNxPCGagMjiHkFPbvW1l4yJ74ChfoqWGiB6
	KeJGaNNRR7iFBqLXfqcdoZ4meuPJ/J35bcUWZEvNq1Mnnd6ALJ9ODMXFav3kLWGwYMop3K08RzcEn
	yYsRKIQf9g0VOcu1qdb1ilJsNT0LdMIwSiPlsRd12O8xWY191gkBuKqHRqb3K1uawojgYSLI09v6P
	dsTiuQzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUKd3-00000001WKP-1vIU;
	Sat, 13 Dec 2025 08:05:25 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUKcy-00000001WJw-1z2U
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Dec 2025 08:05:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765613121; x=1797149121;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wol9oS19c9bBdlTBpPH9ntNcDtf/6ZWS5Gp4NfQ0SYg=;
  b=kEUFA/LBfbThBKWfcVSuBk6/vdNX/9PjG2PsGVplIArGOVtH1hwaDixk
   G+JZiJ8zKO7+/IOyBsJ7/Kr+oP8ikey6TYiujJTm28uwnaD2Ca5mGtYHn
   BT7eF6eUmL+dtom1ZOUrxVl/kpBAl98N/e/4dOczzb4b9Wa3TUKMs9dg5
   La9ZuZjsdS3H/KQAs6VFmwnIetYOJfIJeluWTGgHWiafix6t1iqhOM9IV
   aPZdcBZMEq1GLSm9Ow3uIddUzfbP0MuNfCCMez8TJXPimLy74NycWWbof
   SqXQeWxEjgHg5R9VtvAA07Vcd34c/S/lak3415fwE4fCaQDO+GmSrZmDd
   w==;
X-CSE-ConnectionGUID: zz7wKttXR8Cs8hZ9unYBog==
X-CSE-MsgGUID: VnPfjcfjS/yBCb5Jc/chWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67675498"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="67675498"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 00:05:19 -0800
X-CSE-ConnectionGUID: +REegi4BSZ6Pyhok8jMjiA==
X-CSE-MsgGUID: EDrkqM7KRneDKww23KbinA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="227937216"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Dec 2025 00:05:15 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUKcq-000000007H3-3MBs;
	Sat, 13 Dec 2025 08:05:12 +0000
Date: Sat, 13 Dec 2025 16:05:00 +0800
From: kernel test robot <lkp@intel.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, nd <nd@arm.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	Joey Gouly <Joey.Gouly@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Timothy Hayes <Timothy.Hayes@arm.com>
Subject: Re: [PATCH 14/32] KVM: arm64: gic-v5: Implement GICv5 load/put and
 save/restore
Message-ID: <202512131539.zPrweF7e-lkp@intel.com>
References: <20251212152215.675767-15-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212152215.675767-15-sascha.bischoff@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251213_000522_632252_9B56F6F6 
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

Hi Sascha,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on next-20251212]
[cannot apply to kvmarm/next arm64/for-next/core kvm/queue kvm/next kvm/linux-next v6.18]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sascha-Bischoff/KVM-arm64-Account-for-RES1-bits-in-DECLARE_FEAT_MAP-and-co/20251212-233140
base:   linus/master
patch link:    https://lore.kernel.org/r/20251212152215.675767-15-sascha.bischoff%40arm.com
patch subject: [PATCH 14/32] KVM: arm64: gic-v5: Implement GICv5 load/put and save/restore
config: arm64-randconfig-002-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131539.zPrweF7e-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131539.zPrweF7e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131539.zPrweF7e-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:16:
   In file included from include/linux/kvm_host.h:45:
   In file included from arch/arm64/include/asm/kvm_host.h:36:
>> include/kvm/arm_vgic.h:392:19: error: field has incomplete type 'struct gicv5_vpe'
     392 |         struct gicv5_vpe gicv5_vpe;
         |                          ^
   include/kvm/arm_vgic.h:392:9: note: forward declaration of 'struct gicv5_vpe'
     392 |         struct gicv5_vpe gicv5_vpe;
         |                ^
   1 error generated.
   make[3]: *** [scripts/Makefile.build:182: arch/arm64/kernel/asm-offsets.s] Error 1 shuffle=1891526797
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1314: prepare0] Error 2 shuffle=1891526797
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1891526797
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=1891526797
   make: Target 'prepare' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=y]
   Selected by [y]:
   - CAN [=y] && NET [=y]


vim +392 include/kvm/arm_vgic.h

   360	
   361	struct vgic_v5_cpu_if {
   362		u64	vgic_apr;
   363		u64	vgic_vmcr;
   364	
   365		/* PPI register state */
   366		u64	vgic_ppi_hmr[2];
   367		u64	vgic_ppi_dvir[2];
   368		u64	vgic_ppi_priorityr[16];
   369	
   370		/* The pending state of the guest. This is merged with the exit state */
   371		u64	vgic_ppi_pendr[2];
   372	
   373		/* The state flushed to the regs when entering the guest */
   374		u64	vgic_ppi_activer_entry[2];
   375		u64	vgic_ich_ppi_enabler_entry[2];
   376		u64	vgic_ppi_pendr_entry[2];
   377	
   378		/* The saved state of the regs when leaving the guest */
   379		u64	vgic_ppi_activer_exit[2];
   380		u64	vgic_ich_ppi_enabler_exit[2];
   381		u64	vgic_ppi_pendr_exit[2];
   382	
   383		/*
   384		 * The ICSR is re-used across host and guest, and hence it needs to be
   385		 * saved/restored. Only one copy is required as the host should block
   386		 * preemption between executing GIC CDRCFG and acccessing the
   387		 * ICC_ICSR_EL1. A guest, of course, can never guarantee this, and hence
   388		 * it is the hyp's responsibility to keep the state constistent.
   389		 */
   390		u64	vgic_icsr;
   391	
 > 392		struct gicv5_vpe gicv5_vpe;
   393	};
   394	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

