Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E25BC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 13:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OEOqSU3fRYeG3aRtUri3lwHgcB2Rym9rKZGuN/X3BPk=; b=J6DEJCYCiz9XH+kDGZ2pIn2NLo
	dgLB/QCKD6saOQfpwgrdoVN0uKJjU2UsfNztijHZcmt2q5CjRUvQ58/8aKawQ/Q9KEbc0e8QMi9e2
	87mwgYTxYfMypG0ZrOI5OHslqVpv3ffDvi8CQLt7CQreCALbCn+sRnTDPcrdnFv8//bFeEpDBLgyL
	ZolfFj+Th6ZeJ7bSi66aKuf9J/uys5ri30ghvK09+mrqAn/HJIyQKn2GgNKqMVFL5fxGARPlqRPU1
	fAFCVn98cQczX7SQ0g845RuI7QvCmmfFADBeJXKAO5LtKgYx4OzqtX0fc3ZpmAJtpRl+J6ux0/nO+
	cF4Nci/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgOgV-00000009i7P-26lW;
	Fri, 07 Feb 2025 13:46:19 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgOeW-00000009he6-05w9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 13:44:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738935856; x=1770471856;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yvDb/9al0b5cbGYGz+egPFvQ2z5zm9IAuwXMbV2aY9g=;
  b=UJcrWYj8vxwHNBuwzgZYTu4L3Gr4BSKf/1Tje0gr+JbAW655GQPLKk6A
   ZIoZZ+q9WBlkNn7CULRyzZKdSbSWimV8jQ/AxbSVGamcWzO5UqHuc/S12
   GTt/UuSimA5N+cGjxLo/9lJurXQv+vtCKqQ37/QIYruOceGxk5NuIbwWn
   YNcj+gQYnHT2Htf1bki//aRd9giraY8q3WQE29lJtVxNwgjj2vWYFE4Dj
   HP/iMhWXflyix+2Y+nWZf1naWby1IUzgIFUqGAYTZPuNH69bEcenZgvth
   lsERRQBWqgx37XCBohXJr+zFzPZvlkFC9avTCZT4gW7SH3fnPcSEvLj2T
   w==;
X-CSE-ConnectionGUID: shJHfU3CTy2K/tHT+ZS74w==
X-CSE-MsgGUID: 6DwvhHNATnqgfXbksJAAwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39448798"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="39448798"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 05:44:15 -0800
X-CSE-ConnectionGUID: YD3vx1NJSq2zirfoHgButQ==
X-CSE-MsgGUID: ndUXSvlTQgKqyCDXne74cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="116533405"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Feb 2025 05:44:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgOeN-000yPD-1L;
	Fri, 07 Feb 2025 13:44:07 +0000
Date: Fri, 7 Feb 2025 21:43:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>, Waiman Long <llong@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>, Tejun Heo <tj@kernel.org>,
	Barret Rhoden <brho@google.com>, Josh Don <joshdon@google.com>,
	Dohyun Kim <dohyunkim@google.com>,
	linux-arm-kernel@lists.infradead.org, kernel-team@meta.com
Subject: Re: [PATCH bpf-next v2 22/26] bpf: Introduce rqspinlock kfuncs
Message-ID: <202502072155.DbOeX8Le-lkp@intel.com>
References: <20250206105435.2159977-23-memxor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206105435.2159977-23-memxor@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_054416_114605_51DC72AC 
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

Hi Kumar,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0abff462d802a352c87b7f5e71b442b09bf9cfff]

url:    https://github.com/intel-lab-lkp/linux/commits/Kumar-Kartikeya-Dwivedi/locking-Move-MCS-struct-definition-to-public-header/20250206-190258
base:   0abff462d802a352c87b7f5e71b442b09bf9cfff
patch link:    https://lore.kernel.org/r/20250206105435.2159977-23-memxor%40gmail.com
patch subject: [PATCH bpf-next v2 22/26] bpf: Introduce rqspinlock kfuncs
config: x86_64-buildonly-randconfig-004-20250207 (https://download.01.org/0day-ci/archive/20250207/202502072155.DbOeX8Le-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502072155.DbOeX8Le-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502072155.DbOeX8Le-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/timerfd.c:26:
   In file included from include/linux/syscalls.h:94:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:62:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:33:
   In file included from arch/x86/include/asm/rqspinlock.h:27:
>> include/asm-generic/rqspinlock.h:40:12: error: conflicting types for 'resilient_tas_spin_lock'
      40 | extern int resilient_tas_spin_lock(rqspinlock_t *lock, u64 timeout);
         |            ^
   arch/x86/include/asm/rqspinlock.h:17:12: note: previous declaration is here
      17 | extern int resilient_tas_spin_lock(struct qspinlock *lock, u64 timeout);
         |            ^
   1 error generated.
--
   In file included from fs/splice.c:27:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from fs/splice.c:31:
   In file included from include/linux/syscalls.h:94:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:62:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:33:
   In file included from arch/x86/include/asm/rqspinlock.h:27:
>> include/asm-generic/rqspinlock.h:40:12: error: conflicting types for 'resilient_tas_spin_lock'
      40 | extern int resilient_tas_spin_lock(rqspinlock_t *lock, u64 timeout);
         |            ^
   arch/x86/include/asm/rqspinlock.h:17:12: note: previous declaration is here
      17 | extern int resilient_tas_spin_lock(struct qspinlock *lock, u64 timeout);
         |            ^
   2 warnings and 1 error generated.
--
   In file included from fs/aio.c:20:
   In file included from include/linux/syscalls.h:94:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:62:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:33:
   In file included from arch/x86/include/asm/rqspinlock.h:27:
>> include/asm-generic/rqspinlock.h:40:12: error: conflicting types for 'resilient_tas_spin_lock'
      40 | extern int resilient_tas_spin_lock(rqspinlock_t *lock, u64 timeout);
         |            ^
   arch/x86/include/asm/rqspinlock.h:17:12: note: previous declaration is here
      17 | extern int resilient_tas_spin_lock(struct qspinlock *lock, u64 timeout);
         |            ^
   In file included from fs/aio.c:29:
   include/linux/mman.h:159:9: warning: division by zero is undefined [-Wdivision-by-zero]
     159 |                _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:137:21: note: expanded from macro '_calc_vm_trans'
     137 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   include/linux/mman.h:160:9: warning: division by zero is undefined [-Wdivision-by-zero]
     160 |                _calc_vm_trans(flags, MAP_STACK,      VM_NOHUGEPAGE) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:137:21: note: expanded from macro '_calc_vm_trans'
     137 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   2 warnings and 1 error generated.


vim +/resilient_tas_spin_lock +40 include/asm-generic/rqspinlock.h

c34e46edef2a89 Kumar Kartikeya Dwivedi 2025-02-06  39  
7a9d3b27f7bf9c Kumar Kartikeya Dwivedi 2025-02-06 @40  extern int resilient_tas_spin_lock(rqspinlock_t *lock, u64 timeout);
7a9d3b27f7bf9c Kumar Kartikeya Dwivedi 2025-02-06  41  #ifdef CONFIG_QUEUED_SPINLOCKS
6516ce00a1482f Kumar Kartikeya Dwivedi 2025-02-06  42  extern int resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val, u64 timeout);
7a9d3b27f7bf9c Kumar Kartikeya Dwivedi 2025-02-06  43  #endif
6516ce00a1482f Kumar Kartikeya Dwivedi 2025-02-06  44  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

