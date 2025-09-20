Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF56CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 00:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3TG54td4RzT/SFgS4WQz7ddnrtJ+s+JNhZCRLUZLkyc=; b=tMWxdmzbsZPVeeOS26W0FFCGKN
	6D3i8lGmHJvQYoP+1Ix9wZKV33e2gWBLCX62HSMOuYMuS1XRQeDUPP3qTceWCBr6yTQ8QqC2j/QP8
	mkp9wOJQfpuEzIV2Q36qxBtm8cLMyRY5QoQ63QigCKsogYN3X9PGXBNZAGs8uWZP5QOG+Q1l+t/HX
	Y4Lg8O+QoMefG496rrV75Lam6bO0tp7Z/UyRJfLv8tFyT+1azkLcycNVjydUPCN+QfHHRwTItkS/r
	MhnF5dwTEu+zA7rVXuORDqwsezEpbUG12TdjxX+UaHEwvK3IYKZnKcXXsFAXyQb43VUy+Oe0jOkNx
	OV/cLHKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzlkf-00000004Qg0-3Eff;
	Sat, 20 Sep 2025 00:46:57 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzlkb-00000004Qds-1qmt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 00:46:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758329214; x=1789865214;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IZK4QCUIsmSsq8uucHTLaXbe91586eFSYBj7chNzAMA=;
  b=EfKpYTx0lMy/xnW/X4qaCmr0ur6X0n5PYcEDz+n5YF688YKed016e+zO
   oe1APPEo5cBiJJpSsqF8HppjBAQ0owWu4oyCOw08l60m4L37VKpNwHqsl
   az7h+ZtItBIryqd6Hw3Nig47vFHCjkCk+rojUQ53JaGjnNIT7qw7kFU8Z
   GDgIHkH+aU9KBmCnGLDO4jxKtt+qS6PM7mkoXABB1b4dOhVQPzCnYMdhE
   RaMHSv7H8IWAmNaEgIf1zRxcGeqMPqSJPTSIco5d3lJYJh60Zg41MAOyA
   RF0b79ixgSw/EApqVu3SoU5h9cE8odlwn1bUkbYNbgOHe/gLqUCsmPwaC
   A==;
X-CSE-ConnectionGUID: v9fJg4MTRAidLORZUYuISQ==
X-CSE-MsgGUID: 3FOuEMj7S3KHxFLEd3zX7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="71784986"
X-IronPort-AV: E=Sophos;i="6.18,279,1751266800"; 
   d="scan'208";a="71784986"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 17:46:52 -0700
X-CSE-ConnectionGUID: WoInC2IWSW6olGkG7QTKqg==
X-CSE-MsgGUID: A9mArTNKQlujZhm4auirVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,279,1751266800"; 
   d="scan'208";a="181223585"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Sep 2025 17:46:48 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzlkT-0004vr-3D;
	Sat, 20 Sep 2025 00:46:46 +0000
Date: Sat, 20 Sep 2025 08:46:11 +0800
From: kernel test robot <lkp@intel.com>
To: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Dylan Hatch <dylanbhatch@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fanqin Cui <cuifq1@chinatelecom.cn>
Subject: Re: [PATCH 2/2] arch: arm64: Reject modules with internal
 alternative callbacks
Message-ID: <202509200821.Qy7LYrJP-lkp@intel.com>
References: <20250919122321.946462-3-abarnas@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919122321.946462-3-abarnas@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_174653_562746_5B96423D 
X-CRM114-Status: GOOD (  13.23  )
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

Hi Adrian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm/for-next]
[also build test WARNING on arm/fixes kvmarm/next soc/for-next linus/master v6.17-rc6 next-20250919]
[cannot apply to arm64/for-next/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Adrian-Barna/arch-arm64-Fail-module-loading-if-dynamic-SCS-patching-fails/20250919-202643
base:   git://git.armlinux.org.uk/~rmk/linux-arm.git for-next
patch link:    https://lore.kernel.org/r/20250919122321.946462-3-abarnas%40google.com
patch subject: [PATCH 2/2] arch: arm64: Reject modules with internal alternative callbacks
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20250920/202509200821.Qy7LYrJP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509200821.Qy7LYrJP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509200821.Qy7LYrJP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/sysreg.h:1111,
                    from arch/arm64/include/asm/cputype.h:250,
                    from arch/arm64/include/asm/cache.h:43,
                    from include/vdso/cache.h:5,
                    from include/linux/cache.h:6,
                    from include/linux/slab.h:15,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from arch/arm64/kernel/asm-offsets.c:10:
   arch/arm64/include/asm/alternative.h: In function 'apply_alternatives_module':
>> arch/arm64/include/asm/alternative.h:31:1: warning: no return statement in function returning non-void [-Wreturn-type]
      31 | static inline int apply_alternatives_module(void *start, size_t length) { }
         | ^~~~~~
--
   In file included from arch/arm64/include/asm/sysreg.h:1111,
                    from arch/arm64/include/asm/memory.h:223,
                    from arch/arm64/include/asm/thread_info.h:17,
                    from include/linux/thread_info.h:60,
                    from arch/arm64/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:7,
                    from arch/arm64/kernel/sys.c:11:
   arch/arm64/include/asm/alternative.h: In function 'apply_alternatives_module':
>> arch/arm64/include/asm/alternative.h:31:1: warning: no return statement in function returning non-void [-Wreturn-type]
      31 | static inline int apply_alternatives_module(void *start, size_t length) { }
         | ^~~~~~
   ./arch/arm64/include/generated/asm/syscall_table_64.h: At top level:
   arch/arm64/kernel/sys.c:58:40: warning: initialized field overwritten [-Woverride-init]
      58 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   arch/arm64/kernel/sys.c:51:52: note: in expansion of macro '__SYSCALL'
      51 | #define __SYSCALL_WITH_COMPAT(nr, native, compat)  __SYSCALL(nr, native)
         |                                                    ^~~~~~~~~
   ./arch/arm64/include/generated/asm/syscall_table_64.h:1:1: note: in expansion of macro '__SYSCALL_WITH_COMPAT'
       1 | __SYSCALL_WITH_COMPAT(0, sys_io_setup, compat_sys_io_setup)
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/sys.c:58:40: note: (near initialization for 'sys_call_table[0]')
      58 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   arch/arm64/kernel/sys.c:51:52: note: in expansion of macro '__SYSCALL'
      51 | #define __SYSCALL_WITH_COMPAT(nr, native, compat)  __SYSCALL(nr, native)
         |                                                    ^~~~~~~~~
   ./arch/arm64/include/generated/asm/syscall_table_64.h:1:1: note: in expansion of macro '__SYSCALL_WITH_COMPAT'
       1 | __SYSCALL_WITH_COMPAT(0, sys_io_setup, compat_sys_io_setup)
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/sys.c:58:40: warning: initialized field overwritten [-Woverride-init]
      58 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   ./arch/arm64/include/generated/asm/syscall_table_64.h:2:1: note: in expansion of macro '__SYSCALL'
       2 | __SYSCALL(1, sys_io_destroy)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:58:40: note: (near initialization for 'sys_call_table[1]')
      58 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   ./arch/arm64/include/generated/asm/syscall_table_64.h:2:1: note: in expansion of macro '__SYSCALL'
       2 | __SYSCALL(1, sys_io_destroy)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:58:40: warning: initialized field overwritten [-Woverride-init]
      58 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   arch/arm64/kernel/sys.c:51:52: note: in expansion of macro '__SYSCALL'
      51 | #define __SYSCALL_WITH_COMPAT(nr, native, compat)  __SYSCALL(nr, native)
         |                                                    ^~~~~~~~~
   ./arch/arm64/include/generated/asm/syscall_table_64.h:3:1: note: in expansion of macro '__SYSCALL_WITH_COMPAT'
       3 | __SYSCALL_WITH_COMPAT(2, sys_io_submit, compat_sys_io_submit)
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/sys.c:58:40: note: (near initialization for 'sys_call_table[2]')
      58 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   arch/arm64/kernel/sys.c:51:52: note: in expansion of macro '__SYSCALL'
      51 | #define __SYSCALL_WITH_COMPAT(nr, native, compat)  __SYSCALL(nr, native)
         |                                                    ^~~~~~~~~
   ./arch/arm64/include/generated/asm/syscall_table_64.h:3:1: note: in expansion of macro '__SYSCALL_WITH_COMPAT'
       3 | __SYSCALL_WITH_COMPAT(2, sys_io_submit, compat_sys_io_submit)
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/sys.c:58:40: warning: initialized field overwritten [-Woverride-init]
      58 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   ./arch/arm64/include/generated/asm/syscall_table_64.h:4:1: note: in expansion of macro '__SYSCALL'
       4 | __SYSCALL(3, sys_io_cancel)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:58:40: note: (near initialization for 'sys_call_table[3]')
      58 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   ./arch/arm64/include/generated/asm/syscall_table_64.h:4:1: note: in expansion of macro '__SYSCALL'
       4 | __SYSCALL(3, sys_io_cancel)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:58:40: warning: initialized field overwritten [-Woverride-init]
      58 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   ./arch/arm64/include/generated/asm/syscall_table_64.h:5:1: note: in expansion of macro '__SYSCALL'
       5 | __SYSCALL(4, sys_io_getevents)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:58:40: note: (near initialization for 'sys_call_table[4]')
      58 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   ./arch/arm64/include/generated/asm/syscall_table_64.h:5:1: note: in expansion of macro '__SYSCALL'
       5 | __SYSCALL(4, sys_io_getevents)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:58:40: warning: initialized field overwritten [-Woverride-init]
      58 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   ./arch/arm64/include/generated/asm/syscall_table_64.h:6:1: note: in expansion of macro '__SYSCALL'
       6 | __SYSCALL(5, sys_setxattr)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:58:40: note: (near initialization for 'sys_call_table[5]')
      58 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   ./arch/arm64/include/generated/asm/syscall_table_64.h:6:1: note: in expansion of macro '__SYSCALL'
       6 | __SYSCALL(5, sys_setxattr)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:58:40: warning: initialized field overwritten [-Woverride-init]
      58 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   ./arch/arm64/include/generated/asm/syscall_table_64.h:7:1: note: in expansion of macro '__SYSCALL'
       7 | __SYSCALL(6, sys_lsetxattr)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:58:40: note: (near initialization for 'sys_call_table[6]')
      58 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   ./arch/arm64/include/generated/asm/syscall_table_64.h:7:1: note: in expansion of macro '__SYSCALL'
       7 | __SYSCALL(6, sys_lsetxattr)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:58:40: warning: initialized field overwritten [-Woverride-init]
--
   In file included from arch/arm64/include/asm/sysreg.h:1111,
                    from arch/arm64/include/asm/cputype.h:250,
                    from arch/arm64/include/asm/cache.h:43,
                    from include/vdso/cache.h:5,
                    from include/linux/cache.h:6,
                    from arch/arm64/include/asm/processor.h:29,
                    from include/linux/sched.h:13,
                    from include/linux/context_tracking.h:5,
                    from arch/arm64/kernel/traps.c:10:
   arch/arm64/include/asm/alternative.h: In function 'apply_alternatives_module':
>> arch/arm64/include/asm/alternative.h:31:1: warning: no return statement in function returning non-void [-Wreturn-type]
      31 | static inline int apply_alternatives_module(void *start, size_t length) { }
         | ^~~~~~
   arch/arm64/kernel/traps.c: At top level:
   arch/arm64/kernel/traps.c:831:43: warning: initialized field overwritten [-Woverride-init]
     831 |         [ESR_ELx_EC_UNKNOWN]            = "Unknown/Uncategorized",
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:831:43: note: (near initialization for 'esr_class_str[0]')
   arch/arm64/kernel/traps.c:832:43: warning: initialized field overwritten [-Woverride-init]
     832 |         [ESR_ELx_EC_WFx]                = "WFI/WFE",
         |                                           ^~~~~~~~~
   arch/arm64/kernel/traps.c:832:43: note: (near initialization for 'esr_class_str[1]')
   arch/arm64/kernel/traps.c:833:43: warning: initialized field overwritten [-Woverride-init]
     833 |         [ESR_ELx_EC_CP15_32]            = "CP15 MCR/MRC",
         |                                           ^~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:43: note: (near initialization for 'esr_class_str[3]')
   arch/arm64/kernel/traps.c:834:43: warning: initialized field overwritten [-Woverride-init]
     834 |         [ESR_ELx_EC_CP15_64]            = "CP15 MCRR/MRRC",
         |                                           ^~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:834:43: note: (near initialization for 'esr_class_str[4]')
   arch/arm64/kernel/traps.c:835:43: warning: initialized field overwritten [-Woverride-init]
     835 |         [ESR_ELx_EC_CP14_MR]            = "CP14 MCR/MRC",
         |                                           ^~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:835:43: note: (near initialization for 'esr_class_str[5]')
   arch/arm64/kernel/traps.c:836:43: warning: initialized field overwritten [-Woverride-init]
     836 |         [ESR_ELx_EC_CP14_LS]            = "CP14 LDC/STC",
         |                                           ^~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:836:43: note: (near initialization for 'esr_class_str[6]')
   arch/arm64/kernel/traps.c:837:43: warning: initialized field overwritten [-Woverride-init]
     837 |         [ESR_ELx_EC_FP_ASIMD]           = "ASIMD",
         |                                           ^~~~~~~
   arch/arm64/kernel/traps.c:837:43: note: (near initialization for 'esr_class_str[7]')
   arch/arm64/kernel/traps.c:838:43: warning: initialized field overwritten [-Woverride-init]
     838 |         [ESR_ELx_EC_CP10_ID]            = "CP10 MRC/VMRS",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:838:43: note: (near initialization for 'esr_class_str[8]')
   arch/arm64/kernel/traps.c:839:43: warning: initialized field overwritten [-Woverride-init]
     839 |         [ESR_ELx_EC_PAC]                = "PAC",
         |                                           ^~~~~
   arch/arm64/kernel/traps.c:839:43: note: (near initialization for 'esr_class_str[9]')
   arch/arm64/kernel/traps.c:840:43: warning: initialized field overwritten [-Woverride-init]
     840 |         [ESR_ELx_EC_CP14_64]            = "CP14 MCRR/MRRC",
         |                                           ^~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:840:43: note: (near initialization for 'esr_class_str[12]')
   arch/arm64/kernel/traps.c:841:43: warning: initialized field overwritten [-Woverride-init]
     841 |         [ESR_ELx_EC_BTI]                = "BTI",
         |                                           ^~~~~
   arch/arm64/kernel/traps.c:841:43: note: (near initialization for 'esr_class_str[13]')
   arch/arm64/kernel/traps.c:842:43: warning: initialized field overwritten [-Woverride-init]
     842 |         [ESR_ELx_EC_ILL]                = "PSTATE.IL",
         |                                           ^~~~~~~~~~~
   arch/arm64/kernel/traps.c:842:43: note: (near initialization for 'esr_class_str[14]')
   arch/arm64/kernel/traps.c:843:43: warning: initialized field overwritten [-Woverride-init]
     843 |         [ESR_ELx_EC_SVC32]              = "SVC (AArch32)",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:843:43: note: (near initialization for 'esr_class_str[17]')
   arch/arm64/kernel/traps.c:844:43: warning: initialized field overwritten [-Woverride-init]
     844 |         [ESR_ELx_EC_HVC32]              = "HVC (AArch32)",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:844:43: note: (near initialization for 'esr_class_str[18]')
   arch/arm64/kernel/traps.c:845:43: warning: initialized field overwritten [-Woverride-init]
     845 |         [ESR_ELx_EC_SMC32]              = "SMC (AArch32)",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:845:43: note: (near initialization for 'esr_class_str[19]')
   arch/arm64/kernel/traps.c:846:43: warning: initialized field overwritten [-Woverride-init]
     846 |         [ESR_ELx_EC_SVC64]              = "SVC (AArch64)",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:846:43: note: (near initialization for 'esr_class_str[21]')
   arch/arm64/kernel/traps.c:847:43: warning: initialized field overwritten [-Woverride-init]
     847 |         [ESR_ELx_EC_HVC64]              = "HVC (AArch64)",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:847:43: note: (near initialization for 'esr_class_str[22]')
   arch/arm64/kernel/traps.c:848:43: warning: initialized field overwritten [-Woverride-init]
     848 |         [ESR_ELx_EC_SMC64]              = "SMC (AArch64)",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:848:43: note: (near initialization for 'esr_class_str[23]')
   arch/arm64/kernel/traps.c:849:43: warning: initialized field overwritten [-Woverride-init]
     849 |         [ESR_ELx_EC_SYS64]              = "MSR/MRS (AArch64)",
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:849:43: note: (near initialization for 'esr_class_str[24]')
   arch/arm64/kernel/traps.c:850:43: warning: initialized field overwritten [-Woverride-init]
     850 |         [ESR_ELx_EC_SVE]                = "SVE",
         |                                           ^~~~~
   arch/arm64/kernel/traps.c:850:43: note: (near initialization for 'esr_class_str[25]')
   arch/arm64/kernel/traps.c:851:43: warning: initialized field overwritten [-Woverride-init]
     851 |         [ESR_ELx_EC_ERET]               = "ERET/ERETAA/ERETAB",
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:851:43: note: (near initialization for 'esr_class_str[26]')
   arch/arm64/kernel/traps.c:852:43: warning: initialized field overwritten [-Woverride-init]
     852 |         [ESR_ELx_EC_FPAC]               = "FPAC",
         |                                           ^~~~~~
   arch/arm64/kernel/traps.c:852:43: note: (near initialization for 'esr_class_str[28]')
   arch/arm64/kernel/traps.c:853:43: warning: initialized field overwritten [-Woverride-init]
     853 |         [ESR_ELx_EC_SME]                = "SME",
         |                                           ^~~~~
   arch/arm64/kernel/traps.c:853:43: note: (near initialization for 'esr_class_str[29]')
   arch/arm64/kernel/traps.c:854:43: warning: initialized field overwritten [-Woverride-init]
     854 |         [ESR_ELx_EC_IMP_DEF]            = "EL3 IMP DEF",
         |                                           ^~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:854:43: note: (near initialization for 'esr_class_str[31]')
   arch/arm64/kernel/traps.c:855:43: warning: initialized field overwritten [-Woverride-init]
--
   In file included from arch/arm64/include/asm/sysreg.h:1111,
                    from arch/arm64/include/asm/cputype.h:250,
                    from arch/arm64/include/asm/cache.h:43,
                    from include/vdso/cache.h:5,
                    from include/linux/cache.h:6,
                    from include/linux/slab.h:15,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from arch/arm64/kernel/asm-offsets.c:10:
   arch/arm64/include/asm/alternative.h: In function 'apply_alternatives_module':
>> arch/arm64/include/asm/alternative.h:31:1: warning: no return statement in function returning non-void [-Wreturn-type]
      31 | static inline int apply_alternatives_module(void *start, size_t length) { }
         | ^~~~~~
   In file included from arch/arm64/include/asm/vdso/gettimeofday.h:10,
                    from include/vdso/datapage.h:197,
                    from lib/vdso/gettimeofday.c:5,
                    from <command-line>:
   arch/arm64/include/asm/alternative.h: In function 'apply_alternatives_module':
>> arch/arm64/include/asm/alternative.h:31:1: warning: no return statement in function returning non-void [-Wreturn-type]
      31 | static inline int apply_alternatives_module(void *start, size_t length) { }
         | ^~~~~~
   In file included from arch/arm64/include/asm/vdso/gettimeofday.h:10,
                    from include/vdso/datapage.h:197,
                    from lib/vdso/getrandom.c:8,
                    from <command-line>:
   arch/arm64/include/asm/alternative.h: In function 'apply_alternatives_module':
>> arch/arm64/include/asm/alternative.h:31:1: warning: no return statement in function returning non-void [-Wreturn-type]
      31 | static inline int apply_alternatives_module(void *start, size_t length) { }
         | ^~~~~~


vim +31 arch/arm64/include/asm/alternative.h

    27	
    28	#ifdef CONFIG_MODULES
    29	int apply_alternatives_module(void *start, size_t length);
    30	#else
  > 31	static inline int apply_alternatives_module(void *start, size_t length) { }
    32	#endif
    33	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

