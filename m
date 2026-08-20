Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F391C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 11:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oIbyh1sJ34Xk+PcU5ETtwfiPtS/ItMr/lWdvH5Nakm4=; b=SlwlFBfC473Jxl08o8G+gPR3oz
	eptA5mpdhbQvCIAN62tq3XVTi6hn5YMHMblfI6245r9q9ic+KQbWPAHOnSes1WZAXfnaleFZ6kv8/
	aoTjD2XCeMKocZeJVLcwWYTAW/wvYcCWtWFVMYJLk3urqMq/j8cbsM29aZs9MpRl+WW56tHmoR/Jb
	9mPEsCqxylgcsLEBG+VDC8BZm50iIzVReUewSGdw4ATxhw/fcvJWX1C1swc1xJdacZw/iy/y9OsQK
	ttZ+FP92/z3xNBAk0yeEndXJhjKxxjtWGxq6IFt6YpSNT2M/vLFjiJ/RYlbzU1fnCBnmV2qApc3b3
	XwXmrOCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0ux-0000000BRys-2Pz5;
	Thu, 20 Aug 2026 11:26:43 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0uu-0000000BRyR-46yl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 11:26:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787225201; x=1818761201;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Yt7UVE5W62LcQI1dEzU6gH2ERHR8B3qY+szYyRafa/Y=;
  b=Hy0+DnxwAB6M2qVSNTG9MbO03azAccwyXzsWNrlZOfWAIgC5dlYd8aK+
   cEEvW87nxT84QD+j8lCHgI0eVhBmwgkFn4se57AMyfRUUIVMA81c8tyWG
   YYAjstFINLp3X0OWGPyp9+gMKu4lEN/0gBd5FIxzoPRUaVRIIq0eTM/P4
   kWS3QhOlvf6etrTW8nWPfv1XdbCqPuEJ9JOxNQBYx3WY1jfDarsa/x+ia
   VFjK0vkpGaGB719xUfPym5dqzdleNNr/4uuRy2H1sYrtxNToKAs6nVV4y
   TIgamjcIGi6kT94Hcy6KwnlCxqjXg610+QD9fIv+gUmMyZyLWHKK0Sufo
   w==;
X-CSE-ConnectionGUID: qMJUjUoWSliMFARGgFquHQ==
X-CSE-MsgGUID: 4YMMUiXiTH6BinuVKYz7mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="75289079"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="75289079"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 04:26:40 -0700
X-CSE-ConnectionGUID: E3cF2FKwTXqTXYwjmH0GAg==
X-CSE-MsgGUID: oOcCykvBRJeT9XYlAZsInw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="270226536"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Aug 2026 04:26:37 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wx0up-00000000iof-08nA;
	Thu, 20 Aug 2026 11:26:35 +0000
Date: Thu, 20 Aug 2026 19:25:43 +0800
From: kernel test robot <lkp@intel.com>
To: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>, Yiqi Sun <sunyiqixm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] arm64: syscall: Ensure saved x0 is kept in-sync with
 tracer updates
Message-ID: <202608201957.jszjEpsE-lkp@intel.com>
References: <20260714143600.23853-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714143600.23853-1-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_042641_058200_B7F2CF2C 
X-CRM114-Status: GOOD (  13.81  )
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
config: arm64-randconfig-001 (https://download.01.org/0day-ci/archive/20260820/202608201957.jszjEpsE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260820/202608201957.jszjEpsE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608201957.jszjEpsE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/ptrace.c:2461:13: error: conflicting types for 'update_syscall_orig_x0_after_ptrace'; have 'void(struct pt_regs *)'
    2461 | static void update_syscall_orig_x0_after_ptrace(struct pt_regs *regs)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/ptrace.c:563:13: note: previous definition of 'update_syscall_orig_x0_after_ptrace' with type 'void(struct task_struct *)'
     563 | static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +2461 arch/arm64/kernel/ptrace.c

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

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

