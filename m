Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D31CD609B1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 15:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4xBR7s2gCOsT6cGLBMdEb7kJoMwrXCZ2X50ZSJOF9SE=; b=F2XtpVY05OMDWCtvvsSnTarjGe
	Yro9bansCeNm0e7vIFRJix4ZZ4dl4rt7ejLXV2SEqxNskgwN7a/IP3jaDDrK3vuVRBKFbxWz8/9X5
	alPaXfhRa+dx71tLI9BpcfHlDujC4bJEDbFoWTOMD+WhYOQDrk3WSSTu2FyIHjtPIUtZNsekv+USn
	wGes8MiTuu7oc2hgbO+Uc11G+hAWsfEYVmUZ+kcvOzzw71yks0ymiCUyCdQxleD557t9DIXZ9wD7G
	/t2kEeQLnMUfwH0sJZka9t5g4aA9oq+GJH4d9xww9yWwd47pW0JyPYSH1tLhZoUwauZKAD1Brvgtk
	4RgJqFlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWyP-00000005RXI-1V7n;
	Tue, 16 Dec 2025 15:28:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWyL-00000005RUo-2Rh4;
	Tue, 16 Dec 2025 15:28:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4xBR7s2gCOsT6cGLBMdEb7kJoMwrXCZ2X50ZSJOF9SE=; b=RpBgMD7bUsmyD23oNY/OS7bXmu
	I93DxeNpwIS1s/fovR3Y51RxXr3d08cirfxj0r88W7hEfDJYEgTiZcUeOMqLsu83TVnWu7i2z1c0a
	PpDf8+9LTaN796igR8iIu2JWBby4yeTLZciP/bjGxdSeStRFrX2lbtY3Llu8hhLq7Jvpt7qpEVV1N
	veHQ4nCWk+1NpaV3kiULdcfhSxMaji0yaO0EE+LJ40lAv430wI2h7hgPHw5yOOBxxuK1xbo6/Bi2T
	J+dSdW82D1G+C6g5raUh4DnzGiGCPR78gaxj+I2s/YtKK+cnjU6dFPJeIJSiq1MQxTyXimOLB73Nk
	4ZQ5tCRw==;
Received: from mgamail.intel.com ([192.198.163.10])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVW6o-000000051ie-3ndQ;
	Tue, 16 Dec 2025 14:33:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765898898; x=1797434898;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sD65R5UGhCtay10P/5W+7TM+UmAjlbjVbXwRe2em6yA=;
  b=B//HjEcNmi57i7BpqPIKYfqoxt1jhf8IYpmDrC8wnjhxyGAai/6nmY95
   jTVkXdU2enRmC/grO7LlOviwxqNSapJvJ+ZdcGZtRNjKAevE04L7Q9L5c
   DXwK/q2vS88iwz77Forzay8YHUcXuWGNdYFI8frPTJ832eMjUFAbRYUoE
   f8IDyzTLcHLHfmVwT3PdnBMSw7E8owFtibSNAt98eZtGvbgJSFfNtQ62C
   bYnCMHRJ2OEq4ifP9pG+hgqBmxEZQUgwmXn/Lza933uTlIUmrjUYuKHVa
   l9huusLVYfde6C2y54qNGUQpW3Jy9eDeXRgJA+SrICZIedRhfEG6nrK8u
   w==;
X-CSE-ConnectionGUID: Qy/5H/bzSTOMl3M7cywgbg==
X-CSE-MsgGUID: pNsE3PCISUCSKhyRCXLuJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="79187680"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="79187680"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 07:28:15 -0800
X-CSE-ConnectionGUID: 2xFsI/dBQXKE8DWUTEVNrg==
X-CSE-MsgGUID: HIgAl8RFQHWXgAdjx3aUnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="202458915"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 16 Dec 2025 07:28:08 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVWy6-000000003RG-37cv;
	Tue, 16 Dec 2025 15:28:06 +0000
Date: Tue, 16 Dec 2025 23:27:25 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 3/3] randomize_kstack: Unify random source across
 arches
Message-ID: <202512162320.WFgo042e-lkp@intel.com>
References: <20251215163520.1144179-4-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215163520.1144179-4-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_143303_359995_078F4779 
X-CRM114-Status: GOOD (  11.70  )
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
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251216/202512162320.WFgo042e-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512162320.WFgo042e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512162320.WFgo042e-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/svm/svm.c:5509:1: error: redefinition of '__inittest'
    5509 | module_init(svm_init)
         | ^
   include/linux/module.h:132:42: note: expanded from macro 'module_init'
     132 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^
   include/linux/randomize_kstack.h:86:1: note: previous definition is here
      86 | late_initcall(random_kstack_init);
         | ^
   include/linux/module.h:125:28: note: expanded from macro 'late_initcall'
     125 | #define late_initcall(fn)               module_init(fn)
         |                                         ^
   include/linux/module.h:132:42: note: expanded from macro 'module_init'
     132 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^
>> arch/x86/kvm/svm/svm.c:5509:1: error: redefinition of 'init_module'
    5509 | module_init(svm_init)
         | ^
   include/linux/module.h:134:6: note: expanded from macro 'module_init'
     134 |         int init_module(void) __copy(initfn)                    \
         |             ^
   include/linux/randomize_kstack.h:86:1: note: previous definition is here
      86 | late_initcall(random_kstack_init);
         | ^
   include/linux/module.h:125:28: note: expanded from macro 'late_initcall'
     125 | #define late_initcall(fn)               module_init(fn)
         |                                         ^
   include/linux/module.h:134:6: note: expanded from macro 'module_init'
     134 |         int init_module(void) __copy(initfn)                    \
         |             ^
   2 errors generated.
--
>> drivers/misc/sgi-xp/xpc_main.c:1285:1: error: redefinition of '__inittest'
    1285 | module_init(xpc_init);
         | ^
   include/linux/module.h:132:42: note: expanded from macro 'module_init'
     132 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^
   include/linux/randomize_kstack.h:86:1: note: previous definition is here
      86 | late_initcall(random_kstack_init);
         | ^
   include/linux/module.h:125:28: note: expanded from macro 'late_initcall'
     125 | #define late_initcall(fn)               module_init(fn)
         |                                         ^
   include/linux/module.h:132:42: note: expanded from macro 'module_init'
     132 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^
>> drivers/misc/sgi-xp/xpc_main.c:1285:1: error: redefinition of 'init_module'
    1285 | module_init(xpc_init);
         | ^
   include/linux/module.h:134:6: note: expanded from macro 'module_init'
     134 |         int init_module(void) __copy(initfn)                    \
         |             ^
   include/linux/randomize_kstack.h:86:1: note: previous definition is here
      86 | late_initcall(random_kstack_init);
         | ^
   include/linux/module.h:125:28: note: expanded from macro 'late_initcall'
     125 | #define late_initcall(fn)               module_init(fn)
         |                                         ^
   include/linux/module.h:134:6: note: expanded from macro 'module_init'
     134 |         int init_module(void) __copy(initfn)                    \
         |             ^
   2 errors generated.


vim +/__inittest +5509 arch/x86/kvm/svm/svm.c

6aa8b732ca01c3d drivers/kvm/svm.c Avi Kivity 2006-12-10  5508  
6aa8b732ca01c3d drivers/kvm/svm.c Avi Kivity 2006-12-10 @5509  module_init(svm_init)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

