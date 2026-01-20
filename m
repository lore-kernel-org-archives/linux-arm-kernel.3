Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DD3D262B1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 23:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OjSQELt6MhMSruMz4BeE6G4yXGXsO8zdav7zAwmJHAU=; b=0c5Hib4d811JpRRhRcAx5prz3v
	4QS6/KXm6nb20rsLELYUK4rpGoN7u/QwNXKASI6rmxLiPSHKK5G1uYBM/q9m3wN20EXHPbLfMzUGG
	QfRKKwar+xRtXJkU+Nzjijq0i9zGepsuHaNfyDnNEhedhPUjb6JydHQNKA+9pwwSI8ngjjKBIREbK
	alqN+5DRpN9x1hn4OgZCJaUHXK0ev1d/3ex1BgsjsVVX/vqzjBCaUqM8lMqXGRnSJFWBxNRPPgQ9k
	lTeLT1JIIa52g6T8rkbwUBxd4lIKyOB57NE3uqBqoyJ5n+s3GxQsY03kRH+ASEda31c5m6js0mM5x
	JGi3+IvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viLVC-00000004drE-49rk;
	Tue, 20 Jan 2026 23:51:14 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viLV9-00000004dqg-2YZx;
	Tue, 20 Jan 2026 23:51:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768953072; x=1800489072;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F5yoRbWch+cbaLBVp1uSb8AEgbjGteKlxCkICYJXx74=;
  b=XutWQJxzUMNGBhSxZlOD5pjNOpgUZlR3o3U0Ls7hL15SIALi1kAuiRiB
   qSD2U5nWzOeK4KpyXng4j5XNt2yN8b3OBBYlljX7Hhg+ezcPY6VNxI4ob
   3FNNyAJJosKhANmaFsYsnIxJMDdgQeAIUVx1hpXYxBf2g9jgPfaTJJ8m9
   zg33g3eAN8bUB4i8HJl0gKkwfkPpR6qsUrzX07uUrqvbYRpxe38noGWrE
   5d7JFdxWW7h+Zil8VO9lGmzyY6cZSNL/tVaENobrn47qHcvIe4b8BA3Gz
   AFDgl19qklo5hRQasaCKFxgfwiNprln4MNSMIpEBLaVVkymjCrQZmafV6
   A==;
X-CSE-ConnectionGUID: KECLcAO7S3a8HnqcJWHO9A==
X-CSE-MsgGUID: Rg9FXqPMTryyEhr/TRXZIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70085034"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="70085034"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 15:51:11 -0800
X-CSE-ConnectionGUID: rOndJBMSThSjHWZZ9Umqow==
X-CSE-MsgGUID: IGZYyd04RMieHEmL0zc4kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="206068459"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Jan 2026 15:51:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viLUy-00000000Phh-3QZT;
	Tue, 20 Jan 2026 23:51:00 +0000
Date: Wed, 21 Jan 2026 07:50:16 +0800
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
	Jeremy Linton <jeremy.linton@arm.com>,
	David Laight <david.laight.linux@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org
Subject: Re: [PATCH v4 3/3] randomize_kstack: Unify random source across
 arches
Message-ID: <202601210752.6Nsv9et9-lkp@intel.com>
References: <20260119130122.1283821-4-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119130122.1283821-4-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_155111_690285_CEE99FE5 
X-CRM114-Status: GOOD (  12.78  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.19-rc6 next-20260119]
[cannot apply to tip/sched/core kees/for-next/hardening kees/for-next/execve]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Roberts/randomize_kstack-Maintain-kstack_offset-per-task/20260119-210329
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260119130122.1283821-4-ryan.roberts%40arm.com
patch subject: [PATCH v4 3/3] randomize_kstack: Unify random source across arches
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260121/202601210752.6Nsv9et9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210752.6Nsv9et9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601210752.6Nsv9et9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: do_syscall_64+0x2c: call to preempt_count_add() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __do_fast_syscall_32+0x3d: call to preempt_count_add() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

