Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9083C02199
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 00:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8vgzcVZOXO6SYkPSEJ5FGYjY8ABvincBFah+6/IiIW4=; b=kVEI56X+XykZAEKlWN9iq1IvK0
	INdAVdrdl2ONBr/t5Xh5da4/Gf00cL4xboI+PsggOJqGCle2W4je5g8a0nZGMY5Gn4nvG4P9Dt+XQ
	6g2ZZhLFZJG/HzgsuaHinOQIJ37sxkIja/QH3wfmFJ7JtnnlCmVeITAf/BTX6NExlBgPGCH5ExaYj
	AJU0pYKR7no41KPRtl+bFWJAoTrHQpx+BVT8VgwcagF5dvU1VtyidC6sPRX8bOxecizoFy+osYxFT
	/nRE06r6lnYDG+UhMykCo6Hv0MZv5WMAu1w5Zv2vO19ortBdlToNshk5ecr1hwcWfhJsWVsFMCI9+
	NPKypasQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgYy1-0000000Bik8-0OSB;
	Sat, 08 Feb 2025 00:45:05 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgYwc-0000000BiL0-2Gzp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 00:43:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738975418; x=1770511418;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xg/MgPonWvECjQA65kTkegGR9LxFyeFNABlwMtYCpSU=;
  b=C4DDrIpNf8vJJnJBzKMDonz9rnLAg6Q/aYS9ivdQH2rNqZPpJvWuDR1v
   b1QFeoOez57D3Lr2vbmrha0DpOYarmR4ZGjA/jWQqFRpSEvB4RjODnCCX
   XiPlAtIfHRHrtILpu6z6BaOr4cJxiK01g4gzdrqGlrGpCzKsyWaCEXbZk
   +YqknnLobo1yjzEskA41pRlHsOPxLp3qZP3eyjioEQU6fb5bthE0E8xq+
   xq89UqRqb6/R0+aZmB4nf0QrZutQD/n2dfZ2NU7+cifRZvaOJjAT+Bc/K
   SmjuB1svbaTtQOIrDjpuoMJb547he64trZ4NcP5iOBhaU6h2mPmULdHN/
   Q==;
X-CSE-ConnectionGUID: Xm8xv7poQJaTY9YvhbSNGg==
X-CSE-MsgGUID: eu0NX/rzSLehF+Q20BvjPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39892895"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; 
   d="scan'208";a="39892895"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 16:43:37 -0800
X-CSE-ConnectionGUID: Ge764EICRVGS8/4ATAXARw==
X-CSE-MsgGUID: gxJI/wlCTI2SpRIv2Y6toA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; 
   d="scan'208";a="116672578"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Feb 2025 16:43:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgYwU-000zGd-14;
	Sat, 08 Feb 2025 00:43:30 +0000
Date: Sat, 8 Feb 2025 08:43:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>,
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
Subject: Re: [PATCH bpf-next v2 18/26] rqspinlock: Add entry to Makefile,
 MAINTAINERS
Message-ID: <202502080835.XRxxo7P5-lkp@intel.com>
References: <20250206105435.2159977-19-memxor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206105435.2159977-19-memxor@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_164338_585424_E43A1F34 
X-CRM114-Status: GOOD (  12.56  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0abff462d802a352c87b7f5e71b442b09bf9cfff]

url:    https://github.com/intel-lab-lkp/linux/commits/Kumar-Kartikeya-Dwivedi/locking-Move-MCS-struct-definition-to-public-header/20250206-190258
base:   0abff462d802a352c87b7f5e71b442b09bf9cfff
patch link:    https://lore.kernel.org/r/20250206105435.2159977-19-memxor%40gmail.com
patch subject: [PATCH bpf-next v2 18/26] rqspinlock: Add entry to Makefile, MAINTAINERS
config: x86_64-randconfig-121-20250207 (https://download.01.org/0day-ci/archive/20250208/202502080835.XRxxo7P5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502080835.XRxxo7P5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502080835.XRxxo7P5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/locking/rqspinlock.c:101:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rqspinlock_held * @@
   kernel/locking/rqspinlock.c:101:39: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/locking/rqspinlock.c:101:39: sparse:     got struct rqspinlock_held *
   kernel/locking/rqspinlock.c:123:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rqspinlock_held * @@
   kernel/locking/rqspinlock.c:123:39: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/locking/rqspinlock.c:123:39: sparse:     got struct rqspinlock_held *
   kernel/locking/rqspinlock.c:136:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rqspinlock_held * @@
   kernel/locking/rqspinlock.c:136:51: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/locking/rqspinlock.c:136:51: sparse:     got struct rqspinlock_held *
   kernel/locking/rqspinlock.c:206:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rqspinlock_held * @@
   kernel/locking/rqspinlock.c:206:39: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/locking/rqspinlock.c:206:39: sparse:     got struct rqspinlock_held *
>> kernel/locking/rqspinlock.c:572:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct qnode *qnodes @@     got struct qnode [noderef] __percpu * @@
   kernel/locking/rqspinlock.c:572:41: sparse:     expected struct qnode *qnodes
   kernel/locking/rqspinlock.c:572:41: sparse:     got struct qnode [noderef] __percpu *
   kernel/locking/rqspinlock.c: note: in included file:
   kernel/locking/qspinlock.h:67:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct mcs_spinlock * @@
   kernel/locking/qspinlock.h:67:16: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/locking/qspinlock.h:67:16: sparse:     got struct mcs_spinlock *

vim +101 kernel/locking/rqspinlock.c

6516ce00a1482f Kumar Kartikeya Dwivedi 2025-02-06   97  
6516ce00a1482f Kumar Kartikeya Dwivedi 2025-02-06   98  static noinline int check_deadlock_AA(rqspinlock_t *lock, u32 mask,
6516ce00a1482f Kumar Kartikeya Dwivedi 2025-02-06   99  				      struct rqspinlock_timeout *ts)
6516ce00a1482f Kumar Kartikeya Dwivedi 2025-02-06  100  {
6516ce00a1482f Kumar Kartikeya Dwivedi 2025-02-06 @101  	struct rqspinlock_held *rqh = this_cpu_ptr(&rqspinlock_held_locks);
6516ce00a1482f Kumar Kartikeya Dwivedi 2025-02-06  102  	int cnt = min(RES_NR_HELD, rqh->cnt);
6516ce00a1482f Kumar Kartikeya Dwivedi 2025-02-06  103  
6516ce00a1482f Kumar Kartikeya Dwivedi 2025-02-06  104  	/*
6516ce00a1482f Kumar Kartikeya Dwivedi 2025-02-06  105  	 * Return an error if we hold the lock we are attempting to acquire.
6516ce00a1482f Kumar Kartikeya Dwivedi 2025-02-06  106  	 * We'll iterate over max 32 locks; no need to do is_lock_released.
6516ce00a1482f Kumar Kartikeya Dwivedi 2025-02-06  107  	 */
6516ce00a1482f Kumar Kartikeya Dwivedi 2025-02-06  108  	for (int i = 0; i < cnt - 1; i++) {
6516ce00a1482f Kumar Kartikeya Dwivedi 2025-02-06  109  		if (rqh->locks[i] == lock)
6516ce00a1482f Kumar Kartikeya Dwivedi 2025-02-06  110  			return -EDEADLK;
6516ce00a1482f Kumar Kartikeya Dwivedi 2025-02-06  111  	}
6516ce00a1482f Kumar Kartikeya Dwivedi 2025-02-06  112  	return 0;
6516ce00a1482f Kumar Kartikeya Dwivedi 2025-02-06  113  }
6516ce00a1482f Kumar Kartikeya Dwivedi 2025-02-06  114  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

