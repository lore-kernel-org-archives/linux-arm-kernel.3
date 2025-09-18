Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BE7CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 09:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gp63iyTDJ1Dz1er6ukYxPK4NgDPkit7JkWWcVpDcnIM=; b=Mp2ewBWvydFQFJ75VPi167LTJF
	YDxLX821P+i5qn0RX8fEYDoXTDu9sIflRCrrrNDsd0+rUEZulRAnC+KjHZxwyA6DJFxhG/syZFhuZ
	5W6xobqj6aXU1ZxRB5txjOsTCal2WP1MLBhq8bDYRsv/1GCdRddPRYnQWrTsxWmUCjAZfk9asvBBf
	/V5NmE/0njpJbLEvakDYlXJIF2TaP5Kw2tipDb7Owu9IVdvmHUhrS4tup3UhCEMDlLpzafuBM6E1V
	UqF6w0EHOlcsyxLZd8SJuOzTbT3mvLHg73YLyJ0cy4oSGNuc/Nf3um6XzPrgvLunl+GlJKVoCN0De
	iYq1spUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBJp-0000000GwFK-3xRT;
	Thu, 18 Sep 2025 09:52:49 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBJn-0000000GwEk-1zqN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 09:52:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758189167; x=1789725167;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uggpLqEklF7aPa8WtKvaaRdHITJ4XoDIFxYFt+0xgEo=;
  b=HoITI2kbdwwCZLpNO22hburvV1EqfPqMsUuNrAYNexs1R1IdgOt+AnB7
   mJePd5IkDzLzfZ4x3pXUSfTFbbpSK2Gq/TLqagnrr2sXstUybK9Lyq7eX
   pb1XZcOB+0J5sT/0ZdIyAeNXDC0WbXWy6qe/G6hQ18ohF/fYebNWBtBY4
   9jemqbJNlZkdeFMamCSgBHog9xqBy9JE7JtfclvpDnwhVKmPvZEhsIDSI
   Z0Q9UxwHFBztTKD//eqKpkgtRdA3qrRlmD2DFK9EYj+vglyN/KylcF/9k
   TWp4oiShP3OEpDusWiszsD690TubiIF3uSXXJ63yXPs8W1zRZtJaIiuFW
   Q==;
X-CSE-ConnectionGUID: kXnkLrqSQvarJck374pUUw==
X-CSE-MsgGUID: +ACqingXSNW9TsvTrOiwYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="64142187"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; 
   d="scan'208";a="64142187"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 02:52:46 -0700
X-CSE-ConnectionGUID: KNknfnMdQRS+XyskpsLUDQ==
X-CSE-MsgGUID: CO4XNbPHQluhoPfDS4klTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; 
   d="scan'208";a="175422987"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Sep 2025 02:52:41 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzBJf-00034t-2e;
	Thu, 18 Sep 2025 09:52:39 +0000
Date: Thu, 18 Sep 2025 17:52:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
	will@kernel.org, oleg@redhat.com, tglx@linutronix.de,
	peterz@infradead.org, luto@kernel.org, kees@kernel.org,
	wad@chromium.org, charlie@rivosinc.com, macro@orcam.me.uk,
	deller@gmx.de, akpm@linux-foundation.org, ldv@strace.io,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	ruanjinjie@huawei.com
Subject: Re: [PATCH -next v6 10/10] arm64: entry: Convert to generic entry
Message-ID: <202509181742.AlhRJJjD-lkp@intel.com>
References: <20250916082611.2972008-11-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916082611.2972008-11-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_025247_588507_C0BF14A1 
X-CRM114-Status: GOOD (  10.75  )
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

Hi Jinjie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250915]

url:    https://github.com/intel-lab-lkp/linux/commits/Jinjie-Ruan/arm64-ptrace-Split-report_syscall-into-report_syscall_enter-exit/20250916-163202
base:   next-20250915
patch link:    https://lore.kernel.org/r/20250916082611.2972008-11-ruanjinjie%40huawei.com
patch subject: [PATCH -next v6 10/10] arm64: entry: Convert to generic entry
config: arm64-randconfig-001-20250918 (https://download.01.org/0day-ci/archive/20250918/202509181742.AlhRJJjD-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7c861bcedf61607b6c087380ac711eb7ff918ca6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250918/202509181742.AlhRJJjD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509181742.AlhRJJjD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/entry/syscall-common.c:30:8: warning: attribute declaration must precede definition [-Wignored-attributes]
      30 | static __always_inline int arch_ptrace_report_syscall_entry(struct pt_regs *regs);
         |        ^
   include/linux/compiler_attributes.h:55:63: note: expanded from macro '__always_inline'
      55 | #define __always_inline                 inline __attribute__((__always_inline__))
         |                                                               ^
   arch/arm64/include/asm/entry-common.h:62:19: note: previous definition is here
      62 | static inline int arch_ptrace_report_syscall_entry(struct pt_regs *regs)
         |                   ^
   kernel/entry/syscall-common.c:115:8: warning: attribute declaration must precede definition [-Wignored-attributes]
     115 | static __always_inline void arch_ptrace_report_syscall_exit(struct pt_regs *regs,
         |        ^
   include/linux/compiler_attributes.h:55:63: note: expanded from macro '__always_inline'
      55 | #define __always_inline                 inline __attribute__((__always_inline__))
         |                                                               ^
   arch/arm64/include/asm/entry-common.h:98:20: note: previous definition is here
      98 | static inline void arch_ptrace_report_syscall_exit(struct pt_regs *regs,
         |                    ^
   2 warnings generated.


vim +30 kernel/entry/syscall-common.c

a70e9f647f501e3 Jinjie Ruan 2025-06-24  19  
204f38f88c6f9db Jinjie Ruan 2025-09-16  20  /**
204f38f88c6f9db Jinjie Ruan 2025-09-16  21   * arch_ptrace_report_syscall_entry - Architecture specific
204f38f88c6f9db Jinjie Ruan 2025-09-16  22   *				      ptrace_report_syscall_entry().
204f38f88c6f9db Jinjie Ruan 2025-09-16  23   *
204f38f88c6f9db Jinjie Ruan 2025-09-16  24   * Invoked from syscall_trace_enter() to wrap ptrace_report_syscall_entry().
204f38f88c6f9db Jinjie Ruan 2025-09-16  25   * Defaults to ptrace_report_syscall_entry.
204f38f88c6f9db Jinjie Ruan 2025-09-16  26   *
204f38f88c6f9db Jinjie Ruan 2025-09-16  27   * The main purpose is to support arch-specific ptrace_report_syscall_entry()
204f38f88c6f9db Jinjie Ruan 2025-09-16  28   * implementation.
204f38f88c6f9db Jinjie Ruan 2025-09-16  29   */
204f38f88c6f9db Jinjie Ruan 2025-09-16 @30  static __always_inline int arch_ptrace_report_syscall_entry(struct pt_regs *regs);
204f38f88c6f9db Jinjie Ruan 2025-09-16  31  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

