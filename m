Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AA4C02199
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 14:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ja8x65DogyFB+iDom6PTwdcc69z6F1d2KuMfXWkWU38=; b=02Pcf2SwKxmIIa4OaN99P6iJ3R
	T4t2jEA5MnSuiQ25cz4/pGqQl9Ob/CYI3UY7T09euJi0j4vS+qkLo1NBaLOCKC2MeMylivFriZ+af
	ThMHxq2qp6wXzyY2GGqUcMnPVlphEDGm4A6OUBLBmXHkqb0noYunziYyq4S+PlneFyzdNmYR7ng0T
	JWzDp+qVDJDA3coeRYyiDXTguDy5IqO0bCmqMD90ueC13WrqBIjcR03ovWd0iGKozRRKylQ02Oyj7
	JV53Aiz7ye+eO9GClwKINDIe+5ZJK+DU7CHDlU0u6blbQpppZ8aoAnX5D8n2FEqwnqlhn5z759qhU
	I5cIgZAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPf7-00000009wMv-3Bjr;
	Fri, 07 Feb 2025 14:48:57 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPcb-00000009vXX-3gbM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 14:46:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738939582; x=1770475582;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vC/OWDm/dfWU9Rdnb1rw4VdhifWMLCVsGEWZ1Y/wwg0=;
  b=BRJEqvykvjkix7Nwc7I3F3UG5F+tYNuYq5qORTBIvilBgOdABz/d7WUG
   SSfjgU28b9esg0kxwZ1Lkwszo3KcrXhalo3GE2ybYXjMnzQtvuC8w3s25
   9ArZUn+nkXtuj8NerO2vnN/oKVndnbqzpu9+tSJm+HjSqUN2Xuf/LTL91
   vW1QbU1mMNuQ0BMvMTMycHHvmdGi1+YvbsErQz+L0QYru/MNpxnnfdfmF
   1huWSBDOW7ozLs1aQbIuKC7IkMFaokTmKEi2RQd0f6EyfBBhyFYXd2u0O
   YDXm79IZMYKGcvcfYMnGFJTCGV/pmqUqSpN7oOU/sk+5DrY60wtLy0ItT
   A==;
X-CSE-ConnectionGUID: atq2OZLQSfiQstm8iUgpyA==
X-CSE-MsgGUID: h7C5g67gRnqYj1UdVXiGmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="56997461"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="56997461"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 06:46:21 -0800
X-CSE-ConnectionGUID: PLb9YVuETr67WQ2KncdH5Q==
X-CSE-MsgGUID: 4WBlToFGQvOsbbsT4/3MBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="111461551"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Feb 2025 06:46:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgPcU-000yTX-08;
	Fri, 07 Feb 2025 14:46:14 +0000
Date: Fri, 7 Feb 2025 22:45:31 +0800
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
Message-ID: <202502072210.Fzbbpkun-lkp@intel.com>
References: <20250206105435.2159977-19-memxor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206105435.2159977-19-memxor@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_064621_988060_BB492101 
X-CRM114-Status: GOOD (  15.76  )
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
config: arm-randconfig-001-20250207 (https://download.01.org/0day-ci/archive/20250207/202502072210.Fzbbpkun-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502072210.Fzbbpkun-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502072210.Fzbbpkun-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/locking/rqspinlock.c:77:
>> kernel/locking/mcs_spinlock.h:57:27: warning: 'struct mcs_spinlock' declared inside parameter list will not be visible outside of this definition or declaration
      57 | void mcs_spin_lock(struct mcs_spinlock **lock, struct mcs_spinlock *node)
         |                           ^~~~~~~~~~~~
   kernel/locking/mcs_spinlock.h: In function 'mcs_spin_lock':
>> kernel/locking/mcs_spinlock.h:62:13: error: invalid use of undefined type 'struct mcs_spinlock'
      62 |         node->locked = 0;
         |             ^~
   kernel/locking/mcs_spinlock.h:63:13: error: invalid use of undefined type 'struct mcs_spinlock'
      63 |         node->next   = NULL;
         |             ^~
   In file included from <command-line>:
   kernel/locking/mcs_spinlock.h:83:24: error: invalid use of undefined type 'struct mcs_spinlock'
      83 |         WRITE_ONCE(prev->next, node);
         |                        ^~
   include/linux/compiler_types.h:522:23: note: in definition of macro '__compiletime_assert'
     522 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/mcs_spinlock.h:83:9: note: in expansion of macro 'WRITE_ONCE'
      83 |         WRITE_ONCE(prev->next, node);
         |         ^~~~~~~~~~
   kernel/locking/mcs_spinlock.h:83:24: error: invalid use of undefined type 'struct mcs_spinlock'
      83 |         WRITE_ONCE(prev->next, node);
         |                        ^~
   include/linux/compiler_types.h:522:23: note: in definition of macro '__compiletime_assert'
     522 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/mcs_spinlock.h:83:9: note: in expansion of macro 'WRITE_ONCE'
      83 |         WRITE_ONCE(prev->next, node);
         |         ^~~~~~~~~~
   kernel/locking/mcs_spinlock.h:83:24: error: invalid use of undefined type 'struct mcs_spinlock'
      83 |         WRITE_ONCE(prev->next, node);
         |                        ^~
   include/linux/compiler_types.h:522:23: note: in definition of macro '__compiletime_assert'
     522 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/mcs_spinlock.h:83:9: note: in expansion of macro 'WRITE_ONCE'
      83 |         WRITE_ONCE(prev->next, node);
         |         ^~~~~~~~~~
   kernel/locking/mcs_spinlock.h:83:24: error: invalid use of undefined type 'struct mcs_spinlock'
      83 |         WRITE_ONCE(prev->next, node);
         |                        ^~
   include/linux/compiler_types.h:522:23: note: in definition of macro '__compiletime_assert'
     522 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/mcs_spinlock.h:83:9: note: in expansion of macro 'WRITE_ONCE'
      83 |         WRITE_ONCE(prev->next, node);
         |         ^~~~~~~~~~
   kernel/locking/mcs_spinlock.h:83:24: error: invalid use of undefined type 'struct mcs_spinlock'
      83 |         WRITE_ONCE(prev->next, node);
         |                        ^~
   include/linux/compiler_types.h:522:23: note: in definition of macro '__compiletime_assert'
     522 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'


vim +62 kernel/locking/mcs_spinlock.h

e207552e64ea05 include/linux/mcs_spinlock.h  Will Deacon     2014-01-21  39  
e72246748ff006 include/linux/mcs_spinlock.h  Tim Chen        2014-01-21  40  /*
e72246748ff006 include/linux/mcs_spinlock.h  Tim Chen        2014-01-21  41   * Note: the smp_load_acquire/smp_store_release pair is not
e72246748ff006 include/linux/mcs_spinlock.h  Tim Chen        2014-01-21  42   * sufficient to form a full memory barrier across
e72246748ff006 include/linux/mcs_spinlock.h  Tim Chen        2014-01-21  43   * cpus for many architectures (except x86) for mcs_unlock and mcs_lock.
e72246748ff006 include/linux/mcs_spinlock.h  Tim Chen        2014-01-21  44   * For applications that need a full barrier across multiple cpus
e72246748ff006 include/linux/mcs_spinlock.h  Tim Chen        2014-01-21  45   * with mcs_unlock and mcs_lock pair, smp_mb__after_unlock_lock() should be
e72246748ff006 include/linux/mcs_spinlock.h  Tim Chen        2014-01-21  46   * used after mcs_lock.
e72246748ff006 include/linux/mcs_spinlock.h  Tim Chen        2014-01-21  47   */
5faeb8adb956a5 include/linux/mcs_spinlock.h  Jason Low       2014-01-21  48  
5faeb8adb956a5 include/linux/mcs_spinlock.h  Jason Low       2014-01-21  49  /*
5faeb8adb956a5 include/linux/mcs_spinlock.h  Jason Low       2014-01-21  50   * In order to acquire the lock, the caller should declare a local node and
5faeb8adb956a5 include/linux/mcs_spinlock.h  Jason Low       2014-01-21  51   * pass a reference of the node to this function in addition to the lock.
5faeb8adb956a5 include/linux/mcs_spinlock.h  Jason Low       2014-01-21  52   * If the lock has already been acquired, then this will proceed to spin
5faeb8adb956a5 include/linux/mcs_spinlock.h  Jason Low       2014-01-21  53   * on this node->locked until the previous lock holder sets the node->locked
5faeb8adb956a5 include/linux/mcs_spinlock.h  Jason Low       2014-01-21  54   * in mcs_spin_unlock().
5faeb8adb956a5 include/linux/mcs_spinlock.h  Jason Low       2014-01-21  55   */
e72246748ff006 include/linux/mcs_spinlock.h  Tim Chen        2014-01-21  56  static inline
e72246748ff006 include/linux/mcs_spinlock.h  Tim Chen        2014-01-21 @57  void mcs_spin_lock(struct mcs_spinlock **lock, struct mcs_spinlock *node)
e72246748ff006 include/linux/mcs_spinlock.h  Tim Chen        2014-01-21  58  {
e72246748ff006 include/linux/mcs_spinlock.h  Tim Chen        2014-01-21  59  	struct mcs_spinlock *prev;
e72246748ff006 include/linux/mcs_spinlock.h  Tim Chen        2014-01-21  60  
e72246748ff006 include/linux/mcs_spinlock.h  Tim Chen        2014-01-21  61  	/* Init node */
e72246748ff006 include/linux/mcs_spinlock.h  Tim Chen        2014-01-21 @62  	node->locked = 0;
e72246748ff006 include/linux/mcs_spinlock.h  Tim Chen        2014-01-21  63  	node->next   = NULL;
e72246748ff006 include/linux/mcs_spinlock.h  Tim Chen        2014-01-21  64  
920c720aa5aa39 kernel/locking/mcs_spinlock.h Peter Zijlstra  2016-02-01  65  	/*
920c720aa5aa39 kernel/locking/mcs_spinlock.h Peter Zijlstra  2016-02-01  66  	 * We rely on the full barrier with global transitivity implied by the
920c720aa5aa39 kernel/locking/mcs_spinlock.h Peter Zijlstra  2016-02-01  67  	 * below xchg() to order the initialization stores above against any
920c720aa5aa39 kernel/locking/mcs_spinlock.h Peter Zijlstra  2016-02-01  68  	 * observation of @node. And to provide the ACQUIRE ordering associated
920c720aa5aa39 kernel/locking/mcs_spinlock.h Peter Zijlstra  2016-02-01  69  	 * with a LOCK primitive.
920c720aa5aa39 kernel/locking/mcs_spinlock.h Peter Zijlstra  2016-02-01  70  	 */
920c720aa5aa39 kernel/locking/mcs_spinlock.h Peter Zijlstra  2016-02-01  71  	prev = xchg(lock, node);
e72246748ff006 include/linux/mcs_spinlock.h  Tim Chen        2014-01-21  72  	if (likely(prev == NULL)) {
5faeb8adb956a5 include/linux/mcs_spinlock.h  Jason Low       2014-01-21  73  		/*
5faeb8adb956a5 include/linux/mcs_spinlock.h  Jason Low       2014-01-21  74  		 * Lock acquired, don't need to set node->locked to 1. Threads
5faeb8adb956a5 include/linux/mcs_spinlock.h  Jason Low       2014-01-21  75  		 * only spin on its own node->locked value for lock acquisition.
5faeb8adb956a5 include/linux/mcs_spinlock.h  Jason Low       2014-01-21  76  		 * However, since this thread can immediately acquire the lock
5faeb8adb956a5 include/linux/mcs_spinlock.h  Jason Low       2014-01-21  77  		 * and does not proceed to spin on its own node->locked, this
5faeb8adb956a5 include/linux/mcs_spinlock.h  Jason Low       2014-01-21  78  		 * value won't be used. If a debug mode is needed to
5faeb8adb956a5 include/linux/mcs_spinlock.h  Jason Low       2014-01-21  79  		 * audit lock status, then set node->locked value here.
5faeb8adb956a5 include/linux/mcs_spinlock.h  Jason Low       2014-01-21  80  		 */
e72246748ff006 include/linux/mcs_spinlock.h  Tim Chen        2014-01-21  81  		return;
e72246748ff006 include/linux/mcs_spinlock.h  Tim Chen        2014-01-21  82  	}
4d3199e4ca8e66 kernel/locking/mcs_spinlock.h Davidlohr Bueso 2015-02-22  83  	WRITE_ONCE(prev->next, node);
e207552e64ea05 include/linux/mcs_spinlock.h  Will Deacon     2014-01-21  84  
e207552e64ea05 include/linux/mcs_spinlock.h  Will Deacon     2014-01-21  85  	/* Wait until the lock holder passes the lock down. */
e207552e64ea05 include/linux/mcs_spinlock.h  Will Deacon     2014-01-21  86  	arch_mcs_spin_lock_contended(&node->locked);
e72246748ff006 include/linux/mcs_spinlock.h  Tim Chen        2014-01-21  87  }
e72246748ff006 include/linux/mcs_spinlock.h  Tim Chen        2014-01-21  88  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

