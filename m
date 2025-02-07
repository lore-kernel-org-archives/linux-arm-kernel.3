Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739BAC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 23:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ztksxNbL+kg5lZJfrd9HR1aJZxHiV3qB2FJAf6fQQmw=; b=mZglDCjdQ5tmfelThKN5lNAwNb
	4MXkNLdc/cz3hzryoFovLbE4Xp3TCT+KHizVSyuHw5ylO01elG8BvEl8nQ8F66QiRFxhf6Mi9ebN8
	1/VqPZ8kc7bdclLaGB2A0efCJqQjnWAiMz8zXmf+OrkID5VO9JkmxdxVEyruCNjm4ww6mztocb3NQ
	6f3LhN8OSSDUDCq72Grd2dFZ1H4V8k1GmRbA7ESoLNVklWAsVrtfZq1YK1N7IB/ECQny1pw4viLYr
	esJt4aXvXWZkp5wxNc/K3OIo+S+rpwjZdB4GnJuYgnt2v4JYVKrELNmG9nWBphPnXUc05q+BXW1Yp
	cJVQhGTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgXgV-0000000BVAk-3aEU;
	Fri, 07 Feb 2025 23:22:55 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgXf7-0000000BV3u-0OFu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 23:21:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738970489; x=1770506489;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Om09NgReZe+VkQbi9KsRs0AlCp6znfQUvuT1wpV5vjM=;
  b=X/V6Dq7LGO1k6f/dz9cC15GqY5AbcOqhkm0LYHP66HdsHyo7gjYufUrU
   V/dc4L/07OCTYnHo6l4NZJfEzHYh0jQPKOstpc0bo6ULPoj2bNW7VtTnS
   RzeSPuoTDEq9lwQqwZS2JdNrbuZH6IXUjf8jMfl1bTq+crpAG3cDqHz82
   7a81sF7eaEWP2HM8Z36s6ZxHGxtrMmyK4XWIgMHaE9+CxRIccbmphaZC8
   n8axaUZOqkb9Xs5TqyWg+sE96lPTAsk+8DQtvbw79G2Kds20RdZXbTHRp
   cvapREw4hNflElWMCuLzVx91waGAYv1QJO8fgvFHbZsk8ZYmAQAUUFdOg
   g==;
X-CSE-ConnectionGUID: PFBQtUH1SHqpgtCRdZNsog==
X-CSE-MsgGUID: tiBTsGpXQb6JoiecN2SL5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39647938"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; 
   d="scan'208";a="39647938"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 15:21:27 -0800
X-CSE-ConnectionGUID: ES1XdqWNSGauLADhTV6F3g==
X-CSE-MsgGUID: kMTqZrBpS7+3UnZSHzWbkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; 
   d="scan'208";a="111481510"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Feb 2025 15:21:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgXey-000zAh-16;
	Fri, 07 Feb 2025 23:21:20 +0000
Date: Sat, 8 Feb 2025 07:21:15 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Barret Rhoden <brho@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>, Waiman Long <llong@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>, Tejun Heo <tj@kernel.org>,
	Josh Don <joshdon@google.com>, Dohyun Kim <dohyunkim@google.com>,
	linux-arm-kernel@lists.infradead.org, kernel-team@meta.com
Subject: Re: [PATCH bpf-next v2 02/26] locking: Move common qspinlock helpers
 to a private header
Message-ID: <202502080738.raao5j60-lkp@intel.com>
References: <20250206105435.2159977-3-memxor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206105435.2159977-3-memxor@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_152129_204933_FC860C9C 
X-CRM114-Status: GOOD (  20.35  )
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
patch link:    https://lore.kernel.org/r/20250206105435.2159977-3-memxor%40gmail.com
patch subject: [PATCH bpf-next v2 02/26] locking: Move common qspinlock helpers to a private header
config: x86_64-randconfig-121-20250207 (https://download.01.org/0day-ci/archive/20250208/202502080738.raao5j60-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502080738.raao5j60-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502080738.raao5j60-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/locking/qspinlock.c:285:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct qnode *qnodes @@     got struct qnode [noderef] __percpu * @@
   kernel/locking/qspinlock.c:285:41: sparse:     expected struct qnode *qnodes
   kernel/locking/qspinlock.c:285:41: sparse:     got struct qnode [noderef] __percpu *
   kernel/locking/qspinlock.c: note: in included file:
>> kernel/locking/qspinlock.h:67:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct mcs_spinlock * @@
   kernel/locking/qspinlock.h:67:16: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/locking/qspinlock.h:67:16: sparse:     got struct mcs_spinlock *

vim +285 kernel/locking/qspinlock.c

   108	
   109	/**
   110	 * queued_spin_lock_slowpath - acquire the queued spinlock
   111	 * @lock: Pointer to queued spinlock structure
   112	 * @val: Current value of the queued spinlock 32-bit word
   113	 *
   114	 * (queue tail, pending bit, lock value)
   115	 *
   116	 *              fast     :    slow                                  :    unlock
   117	 *                       :                                          :
   118	 * uncontended  (0,0,0) -:--> (0,0,1) ------------------------------:--> (*,*,0)
   119	 *                       :       | ^--------.------.             /  :
   120	 *                       :       v           \      \            |  :
   121	 * pending               :    (0,1,1) +--> (0,1,0)   \           |  :
   122	 *                       :       | ^--'              |           |  :
   123	 *                       :       v                   |           |  :
   124	 * uncontended           :    (n,x,y) +--> (n,0,0) --'           |  :
   125	 *   queue               :       | ^--'                          |  :
   126	 *                       :       v                               |  :
   127	 * contended             :    (*,x,y) +--> (*,0,0) ---> (*,0,1) -'  :
   128	 *   queue               :         ^--'                             :
   129	 */
   130	void __lockfunc queued_spin_lock_slowpath(struct qspinlock *lock, u32 val)
   131	{
   132		struct mcs_spinlock *prev, *next, *node;
   133		u32 old, tail;
   134		int idx;
   135	
   136		BUILD_BUG_ON(CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS));
   137	
   138		if (pv_enabled())
   139			goto pv_queue;
   140	
   141		if (virt_spin_lock(lock))
   142			return;
   143	
   144		/*
   145		 * Wait for in-progress pending->locked hand-overs with a bounded
   146		 * number of spins so that we guarantee forward progress.
   147		 *
   148		 * 0,1,0 -> 0,0,1
   149		 */
   150		if (val == _Q_PENDING_VAL) {
   151			int cnt = _Q_PENDING_LOOPS;
   152			val = atomic_cond_read_relaxed(&lock->val,
   153						       (VAL != _Q_PENDING_VAL) || !cnt--);
   154		}
   155	
   156		/*
   157		 * If we observe any contention; queue.
   158		 */
   159		if (val & ~_Q_LOCKED_MASK)
   160			goto queue;
   161	
   162		/*
   163		 * trylock || pending
   164		 *
   165		 * 0,0,* -> 0,1,* -> 0,0,1 pending, trylock
   166		 */
   167		val = queued_fetch_set_pending_acquire(lock);
   168	
   169		/*
   170		 * If we observe contention, there is a concurrent locker.
   171		 *
   172		 * Undo and queue; our setting of PENDING might have made the
   173		 * n,0,0 -> 0,0,0 transition fail and it will now be waiting
   174		 * on @next to become !NULL.
   175		 */
   176		if (unlikely(val & ~_Q_LOCKED_MASK)) {
   177	
   178			/* Undo PENDING if we set it. */
   179			if (!(val & _Q_PENDING_MASK))
   180				clear_pending(lock);
   181	
   182			goto queue;
   183		}
   184	
   185		/*
   186		 * We're pending, wait for the owner to go away.
   187		 *
   188		 * 0,1,1 -> *,1,0
   189		 *
   190		 * this wait loop must be a load-acquire such that we match the
   191		 * store-release that clears the locked bit and create lock
   192		 * sequentiality; this is because not all
   193		 * clear_pending_set_locked() implementations imply full
   194		 * barriers.
   195		 */
   196		if (val & _Q_LOCKED_MASK)
   197			smp_cond_load_acquire(&lock->locked, !VAL);
   198	
   199		/*
   200		 * take ownership and clear the pending bit.
   201		 *
   202		 * 0,1,0 -> 0,0,1
   203		 */
   204		clear_pending_set_locked(lock);
   205		lockevent_inc(lock_pending);
   206		return;
   207	
   208		/*
   209		 * End of pending bit optimistic spinning and beginning of MCS
   210		 * queuing.
   211		 */
   212	queue:
   213		lockevent_inc(lock_slowpath);
   214	pv_queue:
   215		node = this_cpu_ptr(&qnodes[0].mcs);
   216		idx = node->count++;
   217		tail = encode_tail(smp_processor_id(), idx);
   218	
   219		trace_contention_begin(lock, LCB_F_SPIN);
   220	
   221		/*
   222		 * 4 nodes are allocated based on the assumption that there will
   223		 * not be nested NMIs taking spinlocks. That may not be true in
   224		 * some architectures even though the chance of needing more than
   225		 * 4 nodes will still be extremely unlikely. When that happens,
   226		 * we fall back to spinning on the lock directly without using
   227		 * any MCS node. This is not the most elegant solution, but is
   228		 * simple enough.
   229		 */
   230		if (unlikely(idx >= _Q_MAX_NODES)) {
   231			lockevent_inc(lock_no_node);
   232			while (!queued_spin_trylock(lock))
   233				cpu_relax();
   234			goto release;
   235		}
   236	
   237		node = grab_mcs_node(node, idx);
   238	
   239		/*
   240		 * Keep counts of non-zero index values:
   241		 */
   242		lockevent_cond_inc(lock_use_node2 + idx - 1, idx);
   243	
   244		/*
   245		 * Ensure that we increment the head node->count before initialising
   246		 * the actual node. If the compiler is kind enough to reorder these
   247		 * stores, then an IRQ could overwrite our assignments.
   248		 */
   249		barrier();
   250	
   251		node->locked = 0;
   252		node->next = NULL;
   253		pv_init_node(node);
   254	
   255		/*
   256		 * We touched a (possibly) cold cacheline in the per-cpu queue node;
   257		 * attempt the trylock once more in the hope someone let go while we
   258		 * weren't watching.
   259		 */
   260		if (queued_spin_trylock(lock))
   261			goto release;
   262	
   263		/*
   264		 * Ensure that the initialisation of @node is complete before we
   265		 * publish the updated tail via xchg_tail() and potentially link
   266		 * @node into the waitqueue via WRITE_ONCE(prev->next, node) below.
   267		 */
   268		smp_wmb();
   269	
   270		/*
   271		 * Publish the updated tail.
   272		 * We have already touched the queueing cacheline; don't bother with
   273		 * pending stuff.
   274		 *
   275		 * p,*,* -> n,*,*
   276		 */
   277		old = xchg_tail(lock, tail);
   278		next = NULL;
   279	
   280		/*
   281		 * if there was a previous node; link it and wait until reaching the
   282		 * head of the waitqueue.
   283		 */
   284		if (old & _Q_TAIL_MASK) {
 > 285			prev = decode_tail(old, qnodes);
   286	
   287			/* Link @node into the waitqueue. */
   288			WRITE_ONCE(prev->next, node);
   289	
   290			pv_wait_node(node, prev);
   291			arch_mcs_spin_lock_contended(&node->locked);
   292	
   293			/*
   294			 * While waiting for the MCS lock, the next pointer may have
   295			 * been set by another lock waiter. We optimistically load
   296			 * the next pointer & prefetch the cacheline for writing
   297			 * to reduce latency in the upcoming MCS unlock operation.
   298			 */
   299			next = READ_ONCE(node->next);
   300			if (next)
   301				prefetchw(next);
   302		}
   303	
   304		/*
   305		 * we're at the head of the waitqueue, wait for the owner & pending to
   306		 * go away.
   307		 *
   308		 * *,x,y -> *,0,0
   309		 *
   310		 * this wait loop must use a load-acquire such that we match the
   311		 * store-release that clears the locked bit and create lock
   312		 * sequentiality; this is because the set_locked() function below
   313		 * does not imply a full barrier.
   314		 *
   315		 * The PV pv_wait_head_or_lock function, if active, will acquire
   316		 * the lock and return a non-zero value. So we have to skip the
   317		 * atomic_cond_read_acquire() call. As the next PV queue head hasn't
   318		 * been designated yet, there is no way for the locked value to become
   319		 * _Q_SLOW_VAL. So both the set_locked() and the
   320		 * atomic_cmpxchg_relaxed() calls will be safe.
   321		 *
   322		 * If PV isn't active, 0 will be returned instead.
   323		 *
   324		 */
   325		if ((val = pv_wait_head_or_lock(lock, node)))
   326			goto locked;
   327	
   328		val = atomic_cond_read_acquire(&lock->val, !(VAL & _Q_LOCKED_PENDING_MASK));
   329	
   330	locked:
   331		/*
   332		 * claim the lock:
   333		 *
   334		 * n,0,0 -> 0,0,1 : lock, uncontended
   335		 * *,*,0 -> *,*,1 : lock, contended
   336		 *
   337		 * If the queue head is the only one in the queue (lock value == tail)
   338		 * and nobody is pending, clear the tail code and grab the lock.
   339		 * Otherwise, we only need to grab the lock.
   340		 */
   341	
   342		/*
   343		 * In the PV case we might already have _Q_LOCKED_VAL set, because
   344		 * of lock stealing; therefore we must also allow:
   345		 *
   346		 * n,0,1 -> 0,0,1
   347		 *
   348		 * Note: at this point: (val & _Q_PENDING_MASK) == 0, because of the
   349		 *       above wait condition, therefore any concurrent setting of
   350		 *       PENDING will make the uncontended transition fail.
   351		 */
   352		if ((val & _Q_TAIL_MASK) == tail) {
   353			if (atomic_try_cmpxchg_relaxed(&lock->val, &val, _Q_LOCKED_VAL))
   354				goto release; /* No contention */
   355		}
   356	
   357		/*
   358		 * Either somebody is queued behind us or _Q_PENDING_VAL got set
   359		 * which will then detect the remaining tail and queue behind us
   360		 * ensuring we'll see a @next.
   361		 */
   362		set_locked(lock);
   363	
   364		/*
   365		 * contended path; wait for next if not observed yet, release.
   366		 */
   367		if (!next)
   368			next = smp_cond_load_relaxed(&node->next, (VAL));
   369	
   370		arch_mcs_spin_unlock_contended(&next->locked);
   371		pv_kick_node(lock, next);
   372	
   373	release:
   374		trace_contention_end(lock, 0);
   375	
   376		/*
   377		 * release the node
   378		 */
   379		__this_cpu_dec(qnodes[0].mcs.count);
   380	}
   381	EXPORT_SYMBOL(queued_spin_lock_slowpath);
   382	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

