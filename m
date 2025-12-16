Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F8BD609C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 16:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZRUio5zfRZF4Wp0TXIUZCi5a4FZapbOokb+FP2/ep4=; b=FqPA1ull2h4MPMd6nRYY2vuAeB
	8RWttSe6nZC4m8tlelMB0xHeEAgV6o71wezUj0NsaoKFWBvl7edBYNDNitvp2++RvEccKqfXd1I0Y
	lgbvoXBeRCHkDH0SyaxLXI0N7Xt1uYHLFQGO7dqb8ExXs7jr/INNTSEqIjtY2NpR9tqVonV3nVkGL
	m6FByMaN3jpT1LHiMMdUrWn8YGD4rR4YswVEKgcy9neQLFppYIhEF0dRwFtXTVwgEP9zNqWk1zs3S
	z3bwnDU86tULYoiA/nsijWRyceoDDzCCWBcMklsqhf/iCFWNMxyj7pMbi0RaPgJSD3oYw3DByxiJN
	+WrvUDyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVXy7-00000005Wth-2yva;
	Tue, 16 Dec 2025 16:32:11 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVXy5-00000005WtH-2RR3;
	Tue, 16 Dec 2025 16:32:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765902729; x=1797438729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BYYyvPXCv/z3Zv/yIQlMx58UIuXYnnZWL+o4/ZYGJM8=;
  b=Ww//Ya2IZVJRpwLMfIwJ5jgCThrWjqPhEoxWXeH0Q7zcAiCH3AQhNnnz
   l41g73hFbnrfLDMjG3thBu05ij8egQPGaO8OfRPf0NmK5ftcBq8Rik6hH
   Y2gQQt5DsdKNme5DYj8+d+VrEpKrDhhcIZo+mDgzvkEdlxrd9hkSnHGoZ
   KIuRl1Dyy8WN6O3TxCtyo/9vEfkV+i3okOkJR+voSESeeD5tjLbMfRczV
   oCOCiY1OdMT2CnPWg5xQXalu3iIMbT8TgVvJUOyNu5/yYebNPhp/x3zBd
   r5sYnu09RCOzZ1SqGI3/FSJqx1ZYeJ7/R65Gtd9WwkCDPYhKVYzb+20lc
   Q==;
X-CSE-ConnectionGUID: 8cSpbeVITI+irXho8Tn9hQ==
X-CSE-MsgGUID: fJ0M90HpTC2tpIqVKQQHKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67868233"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="67868233"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 08:32:07 -0800
X-CSE-ConnectionGUID: hOe0vqPVR7CciV+fTWvORw==
X-CSE-MsgGUID: v02B96M3SIa8VhPps1uokQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="197808734"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 16 Dec 2025 08:32:00 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVXxu-000000003YO-0J5B;
	Tue, 16 Dec 2025 16:31:58 +0000
Date: Wed, 17 Dec 2025 00:31:27 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Roberts <ryan.roberts@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jeremy Linton <jeremy.linton@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 3/3] randomize_kstack: Unify random source across
 arches
Message-ID: <202512170038.vJZdUhEN-lkp@intel.com>
References: <20251215163520.1144179-4-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215163520.1144179-4-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_083209_711411_12604CCE 
X-CRM114-Status: GOOD (  13.45  )
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

Hi Ryan,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on akpm-mm/mm-everything linus/master v6.19-rc1 next-20251216]
[cannot apply to kees/for-next/hardening kees/for-next/execve]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Roberts/prandom-Convert-prandom_u32_state-to-__always_inline/20251216-013546
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20251215163520.1144179-4-ryan.roberts%40arm.com
patch subject: [PATCH v2 3/3] randomize_kstack: Unify random source across arches
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251217/202512170038.vJZdUhEN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512170038.vJZdUhEN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512170038.vJZdUhEN-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/x86/boot/startup/sev-startup.o: warning: objtool: section .discard.addressable has absolute relocation at offset 0x0
--
   In file included from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/blk_types.h:11,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:23,
                    from include/linux/resume_user_mode.h:8,
                    from include/linux/entry-virt.h:6,
                    from include/linux/kvm_host.h:5,
                    from arch/x86/kvm/svm/svm.c:3:
>> include/linux/module.h:132:49: error: redefinition of '__inittest'
     132 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^~~~~~~~~~
   arch/x86/kvm/svm/svm.c:5509:1: note: in expansion of macro 'module_init'
    5509 | module_init(svm_init)
         | ^~~~~~~~~~~
   include/linux/module.h:132:49: note: previous definition of '__inittest' with type 'int (*(void))(void)'
     132 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/module.h:125:41: note: in expansion of macro 'module_init'
     125 | #define late_initcall(fn)               module_init(fn)
         |                                         ^~~~~~~~~~~
   include/linux/randomize_kstack.h:86:1: note: in expansion of macro 'late_initcall'
      86 | late_initcall(random_kstack_init);
         | ^~~~~~~~~~~~~
>> include/linux/module.h:134:13: error: redefinition of 'init_module'
     134 |         int init_module(void) __copy(initfn)                    \
         |             ^~~~~~~~~~~
   arch/x86/kvm/svm/svm.c:5509:1: note: in expansion of macro 'module_init'
    5509 | module_init(svm_init)
         | ^~~~~~~~~~~
   include/linux/module.h:134:13: note: previous definition of 'init_module' with type 'int(void)'
     134 |         int init_module(void) __copy(initfn)                    \
         |             ^~~~~~~~~~~
   include/linux/module.h:125:41: note: in expansion of macro 'module_init'
     125 | #define late_initcall(fn)               module_init(fn)
         |                                         ^~~~~~~~~~~
   include/linux/randomize_kstack.h:86:1: note: in expansion of macro 'late_initcall'
      86 | late_initcall(random_kstack_init);
         | ^~~~~~~~~~~~~
--
   ld: arch/x86/kvm/vmx/main.o: in function `vt_init':
>> arch/x86/kvm/vmx/main.c:1038: multiple definition of `init_module'; arch/x86/kvm/vmx/vmx.o:include/linux/randomize_kstack.h:81: first defined here
--
   In file included from drivers/misc/sgi-xp/xpc_main.c:47:
>> include/linux/module.h:132:49: error: redefinition of '__inittest'
     132 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^~~~~~~~~~
   drivers/misc/sgi-xp/xpc_main.c:1285:1: note: in expansion of macro 'module_init'
    1285 | module_init(xpc_init);
         | ^~~~~~~~~~~
   include/linux/module.h:132:49: note: previous definition of '__inittest' with type 'int (*(void))(void)'
     132 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/module.h:125:41: note: in expansion of macro 'module_init'
     125 | #define late_initcall(fn)               module_init(fn)
         |                                         ^~~~~~~~~~~
   include/linux/randomize_kstack.h:86:1: note: in expansion of macro 'late_initcall'
      86 | late_initcall(random_kstack_init);
         | ^~~~~~~~~~~~~
>> include/linux/module.h:134:13: error: redefinition of 'init_module'
     134 |         int init_module(void) __copy(initfn)                    \
         |             ^~~~~~~~~~~
   drivers/misc/sgi-xp/xpc_main.c:1285:1: note: in expansion of macro 'module_init'
    1285 | module_init(xpc_init);
         | ^~~~~~~~~~~
   include/linux/module.h:134:13: note: previous definition of 'init_module' with type 'int(void)'
     134 |         int init_module(void) __copy(initfn)                    \
         |             ^~~~~~~~~~~
   include/linux/module.h:125:41: note: in expansion of macro 'module_init'
     125 | #define late_initcall(fn)               module_init(fn)
         |                                         ^~~~~~~~~~~
   include/linux/randomize_kstack.h:86:1: note: in expansion of macro 'late_initcall'
      86 | late_initcall(random_kstack_init);
         | ^~~~~~~~~~~~~


vim +1038 arch/x86/kvm/vmx/main.c

d6bee7813752b3 Kai Huang 2025-01-22  1036  
d6bee7813752b3 Kai Huang 2025-01-22  1037  static int __init vt_init(void)
d6bee7813752b3 Kai Huang 2025-01-22 @1038  {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

