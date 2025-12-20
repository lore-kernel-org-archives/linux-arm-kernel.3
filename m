Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAACE668B4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 13:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8y8c+YSRj5ciykxkJrONlfyuhw3Te+gCjXLl7t5bFMU=; b=D+IJPF99NdwWinMxl3k96Yo4bT
	9bUPftVT1sTF4+NSPNyevOUrBDQjoF/2zxrflu1RCg/X91HLavx1GNrFskXqjoZ/rlnRJDjimCySr
	7vyWU8VB2G0H1pr75LCHhVXFpdSG8rdk2MuugEhjIOx6DF9Dht0piy9SY5ImUicAyS4v198GIYmcJ
	oFdlgYxkQ4z+KAPSB4h9L1a0GVZ4XTerehHruUx3+Edq+gBlXwRqdzJSATjCLDks+SDI2340PTS2L
	9K7XcmNTFkc3Vg32wHV3axc8hLVqwmoypHZ2t38urmmwAfXjoGwpWUtrC1kxckyxgKIp9WcgID1xa
	QWpAxN6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWxIa-0000000BdI2-3auO;
	Sat, 20 Dec 2025 13:47:08 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWxIX-0000000BdHe-0q3v
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Dec 2025 13:47:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766238425; x=1797774425;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1pFvDAhK/0OcjfDXa8369dj+tMnoofvfLqxmhTvaU8c=;
  b=DkdpMNbB4n0TkTtTU5i9FFBQaIJEvsGmbeDwSJp8dIuUtnmXItAPY3eQ
   bejJJkox0PxChF6FC2Yqoc+eDhVnsD0AvxGiGXVDYS1wOIDD/D3YZFMqh
   zXRi6d8P9N2zRnvX7zTmqi5nzw68CZlKlwATVIzXHt5y+h5wbeUZaoRkJ
   XFhdtVimYOVY+xV+W9m8B7Rl4WDrNODY15rqYTdDAkBtBqmxvY+KQHeb6
   V9g58Y/Ov8kEQcWnL4NL70/+crFmmhxTz+63bfsfjyavvPKagpG7l26U3
   WZge7oB9uPpZsrQBQzWFVKP6H1ScinKpQqP7c618PRzKIY2bbMk002oWR
   g==;
X-CSE-ConnectionGUID: gr3xnggmTYagPgk3tXljbw==
X-CSE-MsgGUID: vcoFOuItR7uC9XgPJnKhkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="70743487"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="70743487"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 05:47:01 -0800
X-CSE-ConnectionGUID: bCJ4A+TsSdWZ9Q4Ncue62A==
X-CSE-MsgGUID: CKi6IRQPS9Sz/jESAesUuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="229775584"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Dec 2025 05:46:55 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWxIK-000000004Zz-3jrU;
	Sat, 20 Dec 2025 13:46:52 +0000
Date: Sat, 20 Dec 2025 21:46:50 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: oe-kbuild-all@lists.linux.dev, Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>
Subject: Re: [PATCH v12 19/46] KVM: arm64: Expose support for private memory
Message-ID: <202512202102.XFW5Jfym-lkp@intel.com>
References: <20251217101125.91098-20-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217101125.91098-20-steven.price@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_054705_256703_C88C5E82 
X-CRM114-Status: GOOD (  10.39  )
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

Hi Steven,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.19-rc1 next-20251219]
[cannot apply to kvmarm/next kvm/queue kvm/next arm64/for-next/core kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Price/kvm-arm64-Include-kvm_emulate-h-in-kvm-arm_psci-h/20251218-030351
base:   linus/master
patch link:    https://lore.kernel.org/r/20251217101125.91098-20-steven.price%40arm.com
patch subject: [PATCH v12 19/46] KVM: arm64: Expose support for private memory
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20251220/202512202102.XFW5Jfym-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202102.XFW5Jfym-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202102.XFW5Jfym-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kvm_host.h:45,
                    from arch/arm64/kernel/asm-offsets.c:16:
>> include/linux/kvm_host.h:725:45: error: expected identifier or '(' before 'struct'
     725 | static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
         |                                             ^~~~~~
   arch/arm64/include/asm/kvm_host.h:1465:41: note: in definition of macro 'kvm_arch_has_private_mem'
    1465 | #define kvm_arch_has_private_mem(kvm) ((kvm)->arch.is_realm)
         |                                         ^~~
>> arch/arm64/include/asm/kvm_host.h:1465:45: error: expected ')' before '->' token
    1465 | #define kvm_arch_has_private_mem(kvm) ((kvm)->arch.is_realm)
         |                                             ^~
   include/linux/kvm_host.h:725:20: note: in expansion of macro 'kvm_arch_has_private_mem'
     725 | static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:182: arch/arm64/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1314: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +725 include/linux/kvm_host.h

f481b069e67437 Paolo Bonzini       2015-05-17  723  
d1e54dd08f163a Fuad Tabba          2025-07-29  724  #ifndef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
a7800aa80ea4d5 Sean Christopherson 2023-11-13 @725  static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
a7800aa80ea4d5 Sean Christopherson 2023-11-13  726  {
a7800aa80ea4d5 Sean Christopherson 2023-11-13  727  	return false;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  728  }
a7800aa80ea4d5 Sean Christopherson 2023-11-13  729  #endif
a7800aa80ea4d5 Sean Christopherson 2023-11-13  730  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

