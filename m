Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA24CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 08:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMUt5T+5CR+WlLku5wcMnvLOTIoA1+WCVgZbOKG3mQM=; b=eVlYrbtoXx5gwEM7Hx6qEem+RX
	HPpLl3QdontOIHeFbYh2+RFnYnf9BTuPWd7oVVHBSh2Y6CqwP6HAV08+GnFPRckVDtN+Ik57kFPeO
	w7VNoM9T1pFw0VyoFhtjmiLA5oN3BIw0p5UkDngbjMSMh8dOgJkzkk1HjqdpI0PWQOx2ey40MSsN/
	l28bRBLyohgZARrLY9hTa3aFkoXmEkhQb5orELlHz3qsJ+RFvOEbE2/swGYpKSGQrONw8PEJ46nzc
	agK6qWthvs51FlMnPmS3VXmw6IKXwtdONf/ONUa4uxbIcAnkEehLNaFXFFnaUsYjkbT0xeN6m1UKY
	VYPBCkKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uynWS-0000000AdIP-22mj;
	Wed, 17 Sep 2025 08:28:16 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uynWP-0000000AdHl-2fSr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 08:28:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758097694; x=1789633694;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MGVrxB/ZF16ux1N/bdvGH9wocGEyHCPQesgRGMarVsE=;
  b=iOHyVUijTXnZn1yN7kP4xjl4JF6CauRgZqhnf/5g6GwYdi5LjSo+asyH
   yUXEVIClhU3U2sNxDK78YXeK/lSCPL4doPfk9t2tCjLR0FYGeCuoK/FAe
   fcOkvbvQzF4CfuLN4jdD/prHnOsmMdWgTyDmtHwWd/wgBc1QfYZ+XH5kc
   y+8XTHmo2upiNmURO8e0jmjCb4Y21a2eVIyQcpqHIUwpfnUT13kfWidg5
   7U3mkdDQrfyczBq7aA4m62qq2FyRH0et65HwW9cadaEa1QmUbPps4MZfN
   5hsLutLua7gaqX2S687qp/aOkjaGLOLqv+6gHRRkd7XEobJ6GIB9gnUtA
   A==;
X-CSE-ConnectionGUID: He3ppFE4SIyjUXRxaBGf0w==
X-CSE-MsgGUID: Tes6+nVUSemXyL/qEg3r+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="59440034"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; 
   d="scan'208";a="59440034"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 01:28:13 -0700
X-CSE-ConnectionGUID: CHw4gGA6QPKatRWEth28wg==
X-CSE-MsgGUID: ahFwTMAYQ5aJ04VbMOIVBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; 
   d="scan'208";a="175957976"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Sep 2025 01:28:09 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uynWJ-0001GF-1J;
	Wed, 17 Sep 2025 08:28:07 +0000
Date: Wed, 17 Sep 2025 16:27:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
	will@kernel.org, oleg@redhat.com, tglx@linutronix.de,
	peterz@infradead.org, luto@kernel.org, kees@kernel.org,
	wad@chromium.org, charlie@rivosinc.com, macro@orcam.me.uk,
	deller@gmx.de, akpm@linux-foundation.org, ldv@strace.io,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, ruanjinjie@huawei.com
Subject: Re: [PATCH -next v6 08/10] entry: Add
 arch_ptrace_report_syscall_entry/exit()
Message-ID: <202509171609.V2opqAfm-lkp@intel.com>
References: <20250916082611.2972008-9-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916082611.2972008-9-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_012813_713441_948ECEB3 
X-CRM114-Status: GOOD (  10.48  )
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
patch link:    https://lore.kernel.org/r/20250916082611.2972008-9-ruanjinjie%40huawei.com
patch subject: [PATCH -next v6 08/10] entry: Add arch_ptrace_report_syscall_entry/exit()
config: i386-buildonly-randconfig-001-20250917 (https://download.01.org/0day-ci/archive/20250917/202509171609.V2opqAfm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509171609.V2opqAfm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509171609.V2opqAfm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/entry/syscall-common.c:29 function parameter 'regs' not described in 'arch_ptrace_report_syscall_entry'
>> Warning: kernel/entry/syscall-common.c:115 function parameter 'regs' not described in 'arch_ptrace_report_syscall_exit'
>> Warning: kernel/entry/syscall-common.c:115 function parameter 'step' not described in 'arch_ptrace_report_syscall_exit'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

