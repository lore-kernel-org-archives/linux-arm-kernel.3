Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9720EC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 14:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WUIATTpWkJ6ksl2lAiv6DWKa1CBYWFtB/jrFlUcnowU=; b=mn4GXEtVnuQhQBy7/q/2nn0+kR
	pucO2mi9mm4fPUlZBHVriXb08jSAogDw4AgQ4yF5m1mNjJAdRtIyK9smdvy4dMaDC+8phh6pP+H8x
	VMUHv08TqW/bM9TfnQNUgqWeDWWQY292OS8+q5q35t1eG4PdQo6O6lglW4Nq1+cnTG4Dx0kZDwf+l
	mVQY9nK+leFTwrugt9pz4lCWUA3412hIr+E8Rloy4diIqLnOWx0kch2vKx9NI3bVu4EH8DHfT4UTG
	cOqGHqh/+x722U79obFtWXkyNN07kXKNn2OjImkS36Gl2aOI50djx2XZX0HZFne4kvr1Y81M/Epnp
	CqlZu9rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPA2-00000009omb-12bA;
	Fri, 07 Feb 2025 14:16:50 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgP8d-00000009oTD-2B6c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 14:15:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738937723; x=1770473723;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1FkVz/U+uzeZGFUK+7kMEhIACeTn3T5bXbi5T/k6aZk=;
  b=CxyH/I/4p1Syomgj+xN9DiKxV8Z4FXjV57tR13XJ3og0/4QUZphvSR/S
   76vjKGiAI69DiIqrsZm6KR91Kv7vm4LtB6R9LzkIIODbbfQH8OipZChDs
   REkQgVmO9glm1MGN4ey9MvVL7YbnheVW1nRcL+Ufns1sj3WvzmyJEDdyx
   opxZvUzZC62+7eY4YDJulf/8jIUiqVJAnk4HR+y5p1pnNPTTuKN0SKK1p
   HJxLGAsNxL5sI7Amxx6uGM6we5bJLAyRjJb1/D86C4mfkJC9n174TB3ez
   imLXU2YOI94Fh/6y/AttCOvh251LL5/bp+Xr5JVLLtdcrnLN4mWrP1DSc
   w==;
X-CSE-ConnectionGUID: O7LjROCdSAyJDQ9GgX6mOw==
X-CSE-MsgGUID: 6618fL8IRTa5j7UjLivkgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="50199283"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="50199283"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 06:15:17 -0800
X-CSE-ConnectionGUID: qP9Nwvi7S+aRp61EDQ3aIQ==
X-CSE-MsgGUID: RnF9zi/sS2yJP209glu42g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="111319995"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Feb 2025 06:15:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgP8Q-000yQx-0z;
	Fri, 07 Feb 2025 14:15:10 +0000
Date: Fri, 7 Feb 2025 22:14:11 +0800
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
Message-ID: <202502072249.IXcsG9Tu-lkp@intel.com>
References: <20250206105435.2159977-19-memxor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206105435.2159977-19-memxor@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_061523_573580_EF4BDA45 
X-CRM114-Status: GOOD (  11.91  )
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
patch link:    https://lore.kernel.org/r/20250206105435.2159977-19-memxor%40gmail.com
patch subject: [PATCH bpf-next v2 18/26] rqspinlock: Add entry to Makefile, MAINTAINERS
config: i386-randconfig-014-20250207 (https://download.01.org/0day-ci/archive/20250207/202502072249.IXcsG9Tu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502072249.IXcsG9Tu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502072249.IXcsG9Tu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/rqspinlock.h:27,
                    from kernel/locking/rqspinlock.c:28:
   include/asm-generic/rqspinlock.h:33:12: error: conflicting types for 'resilient_tas_spin_lock'; have 'int(rqspinlock_t *, u64)' {aka 'int(struct rqspinlock *, long long unsigned int)'}
      33 | extern int resilient_tas_spin_lock(rqspinlock_t *lock, u64 timeout);
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/rqspinlock.h:17:12: note: previous declaration of 'resilient_tas_spin_lock' with type 'int(struct qspinlock *, u64)' {aka 'int(struct qspinlock *, long long unsigned int)'}
      17 | extern int resilient_tas_spin_lock(struct qspinlock *lock, u64 timeout);
         |            ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/locking/rqspinlock.c:293:16: error: conflicting types for 'resilient_tas_spin_lock'; have 'int(rqspinlock_t *, u64)' {aka 'int(struct rqspinlock *, long long unsigned int)'}
     293 | int __lockfunc resilient_tas_spin_lock(rqspinlock_t *lock, u64 timeout)
         |                ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/rqspinlock.h:17:12: note: previous declaration of 'resilient_tas_spin_lock' with type 'int(struct qspinlock *, u64)' {aka 'int(struct qspinlock *, long long unsigned int)'}
      17 | extern int resilient_tas_spin_lock(struct qspinlock *lock, u64 timeout);
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rqspinlock.c:204:13: warning: 'rqspinlock_report_violation' defined but not used [-Wunused-function]
     204 | static void rqspinlock_report_violation(const char *s, void *lock)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +293 kernel/locking/rqspinlock.c

65ba402b78bc5d Kumar Kartikeya Dwivedi 2025-02-06  288  
7a9d3b27f7bf9c Kumar Kartikeya Dwivedi 2025-02-06  289  /*
7a9d3b27f7bf9c Kumar Kartikeya Dwivedi 2025-02-06  290   * Provide a test-and-set fallback for cases when queued spin lock support is
7a9d3b27f7bf9c Kumar Kartikeya Dwivedi 2025-02-06  291   * absent from the architecture.
7a9d3b27f7bf9c Kumar Kartikeya Dwivedi 2025-02-06  292   */
7a9d3b27f7bf9c Kumar Kartikeya Dwivedi 2025-02-06 @293  int __lockfunc resilient_tas_spin_lock(rqspinlock_t *lock, u64 timeout)
7a9d3b27f7bf9c Kumar Kartikeya Dwivedi 2025-02-06  294  {
7a9d3b27f7bf9c Kumar Kartikeya Dwivedi 2025-02-06  295  	struct rqspinlock_timeout ts;
7a9d3b27f7bf9c Kumar Kartikeya Dwivedi 2025-02-06  296  	int val, ret = 0;
7a9d3b27f7bf9c Kumar Kartikeya Dwivedi 2025-02-06  297  
7a9d3b27f7bf9c Kumar Kartikeya Dwivedi 2025-02-06  298  	RES_INIT_TIMEOUT(ts, timeout);
7a9d3b27f7bf9c Kumar Kartikeya Dwivedi 2025-02-06  299  	grab_held_lock_entry(lock);
7a9d3b27f7bf9c Kumar Kartikeya Dwivedi 2025-02-06  300  retry:
7a9d3b27f7bf9c Kumar Kartikeya Dwivedi 2025-02-06  301  	val = atomic_read(&lock->val);
7a9d3b27f7bf9c Kumar Kartikeya Dwivedi 2025-02-06  302  
7a9d3b27f7bf9c Kumar Kartikeya Dwivedi 2025-02-06  303  	if (val || !atomic_try_cmpxchg(&lock->val, &val, 1)) {
7a9d3b27f7bf9c Kumar Kartikeya Dwivedi 2025-02-06  304  		if (RES_CHECK_TIMEOUT(ts, ret, ~0u)) {
7a9d3b27f7bf9c Kumar Kartikeya Dwivedi 2025-02-06  305  			lockevent_inc(rqspinlock_lock_timeout);
7a9d3b27f7bf9c Kumar Kartikeya Dwivedi 2025-02-06  306  			goto out;
7a9d3b27f7bf9c Kumar Kartikeya Dwivedi 2025-02-06  307  		}
7a9d3b27f7bf9c Kumar Kartikeya Dwivedi 2025-02-06  308  		cpu_relax();
7a9d3b27f7bf9c Kumar Kartikeya Dwivedi 2025-02-06  309  		goto retry;
7a9d3b27f7bf9c Kumar Kartikeya Dwivedi 2025-02-06  310  	}
7a9d3b27f7bf9c Kumar Kartikeya Dwivedi 2025-02-06  311  
7a9d3b27f7bf9c Kumar Kartikeya Dwivedi 2025-02-06  312  	return 0;
7a9d3b27f7bf9c Kumar Kartikeya Dwivedi 2025-02-06  313  out:
7a9d3b27f7bf9c Kumar Kartikeya Dwivedi 2025-02-06  314  	release_held_lock_entry();
7a9d3b27f7bf9c Kumar Kartikeya Dwivedi 2025-02-06  315  	return ret;
7a9d3b27f7bf9c Kumar Kartikeya Dwivedi 2025-02-06  316  }
7a9d3b27f7bf9c Kumar Kartikeya Dwivedi 2025-02-06  317  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

