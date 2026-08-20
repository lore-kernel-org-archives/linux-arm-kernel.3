Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B870C5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 06:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VMaTQKJsHb7QC+KLKybjiUaw6XAD1iDhRclDBCk3n4Y=; b=sEoyPivRqNCqJTqOjTOIz3Op8K
	YNCwqhTI/JsFRM/JKAWibFMINCjfHm+Bpjx9YZEk+BIZzCZ2rc58cLtIFZdG/UfsfmyHuwH7CG38N
	1SYkGowKrtkhkPlhz/FHIpZaU9U6tSJ1KcD8LB+MsjSMhIw15oRk2MsiOUkQjGKqGlbBR+gDOy99Q
	LMwG8BMHZ9IkcQE/bq6qwEExm42b3xEUA0KL9tngZcBSc/n+YxZqmM1M2B9GrIDgRUYuZMnTpZsEP
	Z71Jh5U4btuo3oUwOoJIM7yECevkiGmQV2zCPx3wL9rORGiBxSU2dPYrCWZSLPuJnnw1WIwMrijed
	ydEQ2n0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwwgH-0000000AzFg-47KB;
	Thu, 20 Aug 2026 06:55:17 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwwgF-0000000AzF0-0s03
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 06:55:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787208915; x=1818744915;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=utSokGxt+3fSEuTpympSX9BSn+GQNZCKZa3vtKKnUUw=;
  b=JlZjojJfqU9x0e5bbndUkLTJilGipxu8xKzfH2URjztjt6BHIu2GARwZ
   SsjDpd42HRpjyFjEjKAYtP/a4YK7d1oLhK2Wnf3Fp0y6Gxh0ONeqDYc56
   5MC1PJVzU1MAzz3mb2HzYFljK33ATGcCeARWI10r2eiFddC70hFG1ABKJ
   z+heoE3XnWkEN+P6qrPmECaWdhVZvcbigwfGRcdKNSSGVVq2OOzrNfs65
   ulCVeV5dN84tEkCFy/6zjY/dOBCdK4wnL+bs51ub5CHOVxaGBU0N7jUYT
   Tnu9gpMc1Gn8/Ml91rvK5/pqXwzb893D6wL+Ni4U+Lx4QKWIu8mRtufyt
   w==;
X-CSE-ConnectionGUID: mooIUGmrSDq6AB5kHVwwDA==
X-CSE-MsgGUID: LdAJkbteSvmFTjmHhWNRZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="110521105"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="110521105"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 23:55:14 -0700
X-CSE-ConnectionGUID: phWQVRXaQeeqZMoPlqWR/g==
X-CSE-MsgGUID: lmKVdcoeSyCWDw6qJYc2gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="269379556"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 Aug 2026 23:55:11 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwwg8-00000000i9l-3PRV;
	Thu, 20 Aug 2026 06:55:08 +0000
Date: Thu, 20 Aug 2026 14:54:50 +0800
From: kernel test robot <lkp@intel.com>
To: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
	Kees Cook <kees@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>, Yiqi Sun <sunyiqixm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] arm64: syscall: Ensure saved x0 is kept in-sync with
 tracer updates
Message-ID: <202608201418.4wnOzo3P-lkp@intel.com>
References: <20260714143600.23853-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714143600.23853-1-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_235515_292989_3AB9DFF5 
X-CRM114-Status: GOOD (  15.58  )
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

Hi Will,

kernel test robot noticed the following build errors:

[auto build test ERROR on linux-review/Yiqi-Sun/arm64-ptrace-use-live-x0-for-seccomp-and-audit-after-ptrace/20260815-210721]

url:    https://github.com/intel-lab-lkp/linux/commits/Will-Deacon/arm64-syscall-Ensure-saved-x0-is-kept-in-sync-with-tracer-updates/20260815-220235
base:   https://github.com/intel-lab-lkp/linux Yiqi-Sun/arm64-ptrace-use-live-x0-for-seccomp-and-audit-after-ptrace/20260815-210721
patch link:    https://lore.kernel.org/r/20260714143600.23853-1-will%40kernel.org
patch subject: [PATCH] arm64: syscall: Ensure saved x0 is kept in-sync with tracer updates
config: arm64-randconfig-001-20260820 (https://download.01.org/0day-ci/archive/20260820/202608201418.4wnOzo3P-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260820/202608201418.4wnOzo3P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608201418.4wnOzo3P-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/ptrace.c:2461:13: error: conflicting types for 'update_syscall_orig_x0_after_ptrace'
    2461 | static void update_syscall_orig_x0_after_ptrace(struct pt_regs *regs)
         |             ^
   arch/arm64/kernel/ptrace.c:563:13: note: previous definition is here
     563 | static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
         |             ^
>> arch/arm64/kernel/ptrace.c:2490:39: error: incompatible pointer types passing 'struct pt_regs *' to parameter of type 'struct task_struct *' [-Wincompatible-pointer-types]
    2490 |                 update_syscall_orig_x0_after_ptrace(regs);
         |                                                     ^~~~
   arch/arm64/kernel/ptrace.c:563:69: note: passing argument to parameter 'target' here
     563 | static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
         |                                                                     ^
   arch/arm64/kernel/ptrace.c:2498:38: error: incompatible pointer types passing 'struct pt_regs *' to parameter of type 'struct task_struct *' [-Wincompatible-pointer-types]
    2498 |         update_syscall_orig_x0_after_ptrace(regs);
         |                                             ^~~~
   arch/arm64/kernel/ptrace.c:563:69: note: passing argument to parameter 'target' here
     563 | static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
         |                                                                     ^
   3 errors generated.


vim +/update_syscall_orig_x0_after_ptrace +2461 arch/arm64/kernel/ptrace.c

  2460	
> 2461	static void update_syscall_orig_x0_after_ptrace(struct pt_regs *regs)
  2462	{
  2463		/*
  2464		 * Keep orig_x0 authoritative so that seccomp (via
  2465		 * syscall_get_arguments()), audit and the restart path all see the same
  2466		 * first argument the syscall is dispatched with, even if it has been
  2467		 * updated by a tracer. Skip this for NO_SYSCALL (set either by the user
  2468		 * or the tracer), as regs[0] holds the return value (see the comment in
  2469		 * el0_svc_common()) and can be unwound using syscall_rollback().
  2470		 * For compat tasks, orig_r0 is provided directly through GPR index 17.
  2471		 */
  2472		if (!is_compat_task() && regs->syscallno != NO_SYSCALL)
  2473			regs->orig_x0 = regs->regs[0];
  2474	}
  2475	
  2476	int syscall_trace_enter(struct pt_regs *regs)
  2477	{
  2478		unsigned long flags = read_thread_flags();
  2479		int ret;
  2480	
  2481		if (flags & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE)) {
  2482			ret = report_syscall_entry(regs);
  2483			if (ret || (flags & _TIF_SYSCALL_EMU))
  2484				return NO_SYSCALL;
  2485	
  2486			/*
  2487			 * Ensure ptrace changes to x0 are visible to seccomp
  2488			 * ptrace exits (SECCOMP_RET_TRACE).
  2489			 */
> 2490			update_syscall_orig_x0_after_ptrace(regs);
  2491		}
  2492	
  2493		/* Do the secure computing after ptrace; failures should be fast. */
  2494		if (secure_computing() == -1)
  2495			return NO_SYSCALL;
  2496	
  2497		/* Ensure seccomp updates to x0 are visible to audit. */
  2498		update_syscall_orig_x0_after_ptrace(regs);
  2499	
  2500		if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
  2501			trace_sys_enter(regs, regs->syscallno);
  2502	
  2503		audit_syscall_entry(regs->syscallno, regs->regs[0], regs->regs[1],
  2504				    regs->regs[2], regs->regs[3]);
  2505	
  2506		return regs->syscallno;
  2507	}
  2508	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

