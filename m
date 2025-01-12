Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8F1E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 03:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nktFJcOtaVX8NVdbE5/yFPnZAwpR5/5dm34yZRTL6YY=; b=JKaLAnvMn75pWEf3lTW83k2MNl
	Xq9YL1fHm/viC22COZc7J7NZbAag4WsnAtX457Y/Yvx0ORVutLkzACJQV84PvXB+2xBbj1brZ3BTY
	7YIrELLit+eZuECfW7PnWbIG5o++Dd9UWYT+MWboouKc/WZodjPWcYqjmL1Y5xQEzxeV9JAkEfQ6d
	s5dq5sQbx28cySnF8VXs3q5HLiz0hUxtPa+6Hac7ERLtJZj+qL9GnNtGhG72dREPYdGTwgB1EIB8W
	AIVpKwY8QEa4ybpuXFlA0bejVhdWHdxNOHsoNIzRVHWWXLd2/ZZNeDuI+f9vM9tbpJEfOjKYekTkP
	LR5VmEeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWoCW-00000001wwn-2C47;
	Sun, 12 Jan 2025 02:59:44 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWoBF-00000001wkB-1EKX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 02:58:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736650705; x=1768186705;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IxEiiB3f0xJ4EWEPemzriMdc3QLi6o48eQiRZ3IMPnI=;
  b=OQmzoxNSkdcTW+QMzlykYUTnbboWkgDxDaab0oQvVCE5JX8RF2ItceE8
   bmdlqgCR4QIH1BNnjn7lQ/CG/y0Hr52KUj7IUPsu/ECipdTMvQViJtuGi
   z9L4vlooCGcaMMRNA2vsAm5peDzorKE9Gdc71GiaWt+ICrspfC9QjlXb6
   I2U4prJmvNyQ6+VUb5khlYhH/2KqhBuT3PblJgmMT2plvnFmwRHqSYA48
   o2Ex4L5NkXXr0+b1eFq157ismGyGmjcKwDOIWEBOUrOD9CsRXGseceUCl
   x0BHIFYNVCkPVzJZ1yau7v63GPhwtP0JVbuvIBJgM/Z7vup7S4te+Tuxq
   A==;
X-CSE-ConnectionGUID: mZ8bLyKhR6GvqZFT/5qoOw==
X-CSE-MsgGUID: DPQp4ugeQjOlHSlLll9Wdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="47567884"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="47567884"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 18:58:18 -0800
X-CSE-ConnectionGUID: 9W+LehN2Q+ybaFdfBxKJFg==
X-CSE-MsgGUID: Ji1haj5NSwahhisAC/YH0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141387404"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Jan 2025 18:58:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWoAy-000LVl-38;
	Sun, 12 Jan 2025 02:58:08 +0000
Date: Sun, 12 Jan 2025 10:57:26 +0800
From: kernel test robot <lkp@intel.com>
To: Joey Jiao <quic_jiangenj@quicinc.com>, dvyukov@google.com,
	andreyknvl@gmail.com, corbet@lwn.net, akpm@linux-foundation.org,
	gregkh@linuxfoundation.org, nogikh@google.com, elver@google.com,
	pierre.gondois@arm.com, cmllamas@google.com,
	quic_zijuhu@quicinc.com, richard.weiyang@gmail.com,
	tglx@linutronix.de, arnd@arndb.de, catalin.marinas@arm.com,
	will@kernel.org, dennis@kernel.org, tj@kernel.org, cl@linux.com,
	ruanjinjie@huawei.com, colyli@suse.de,
	andriy.shevchenko@linux.intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, kernel@quicinc.com,
	quic_likaid@quicinc.com, kasan-dev@googlegroups.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] kcov: add unique cover, edge, and cmp modes
Message-ID: <202501121036.JNteuRXG-lkp@intel.com>
References: <20250110073056.2594638-1-quic_jiangenj@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110073056.2594638-1-quic_jiangenj@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_185825_342881_9E6A5801 
X-CRM114-Status: GOOD (  13.48  )
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

Hi Joey,

kernel test robot noticed the following build errors:

[auto build test ERROR on 9b2ffa6148b1e4468d08f7e0e7e371c43cac9ffe]

url:    https://github.com/intel-lab-lkp/linux/commits/Joey-Jiao/kcov-add-unique-cover-edge-and-cmp-modes/20250110-153559
base:   9b2ffa6148b1e4468d08f7e0e7e371c43cac9ffe
patch link:    https://lore.kernel.org/r/20250110073056.2594638-1-quic_jiangenj%40quicinc.com
patch subject: [PATCH] kcov: add unique cover, edge, and cmp modes
config: um-randconfig-002-20250112 (https://download.01.org/0day-ci/archive/20250112/202501121036.JNteuRXG-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f5cd181ffbb7cb61d582fe130d46580d5969d47a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501121036.JNteuRXG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501121036.JNteuRXG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/kcov.c:309:41: error: no member named 'type' in 'struct kcov_entry'
     309 |                         if (entry->ent == ent->ent && entry->type == ent->type &&
         |                                                       ~~~~~  ^
   kernel/kcov.c:309:54: error: no member named 'type' in 'struct kcov_entry'
     309 |                         if (entry->ent == ent->ent && entry->type == ent->type &&
         |                                                                      ~~~  ^
>> kernel/kcov.c:310:15: error: no member named 'arg1' in 'struct kcov_entry'
     310 |                             entry->arg1 == ent->arg1 && entry->arg2 == ent->arg2) {
         |                             ~~~~~  ^
   kernel/kcov.c:310:28: error: no member named 'arg1' in 'struct kcov_entry'
     310 |                             entry->arg1 == ent->arg1 && entry->arg2 == ent->arg2) {
         |                                            ~~~  ^
>> kernel/kcov.c:310:43: error: no member named 'arg2' in 'struct kcov_entry'
     310 |                             entry->arg1 == ent->arg1 && entry->arg2 == ent->arg2) {
         |                                                         ~~~~~  ^
   kernel/kcov.c:310:56: error: no member named 'arg2' in 'struct kcov_entry'
     310 |                             entry->arg1 == ent->arg1 && entry->arg2 == ent->arg2) {
         |                                                                        ~~~  ^
   kernel/kcov.c:343:29: error: no member named 'type' in 'struct kcov_entry'
     343 |                         area[start_index] = ent->type;
         |                                             ~~~  ^
   kernel/kcov.c:344:33: error: no member named 'arg1' in 'struct kcov_entry'
     344 |                         area[start_index + 1] = ent->arg1;
         |                                                 ~~~  ^
   kernel/kcov.c:345:33: error: no member named 'arg2' in 'struct kcov_entry'
     345 |                         area[start_index + 2] = ent->arg2;
         |                                                 ~~~  ^
   9 errors generated.


vim +309 kernel/kcov.c

   290	
   291	static notrace inline void kcov_map_add(struct kcov_map *map, struct kcov_entry *ent,
   292						struct task_struct *t, unsigned int mode)
   293	{
   294		struct kcov *kcov;
   295		struct kcov_entry *entry;
   296		unsigned int key = hash_key(ent);
   297		unsigned long pos, start_index, end_pos, max_pos, *area;
   298	
   299		kcov = t->kcov;
   300	
   301		if ((mode == KCOV_MODE_TRACE_UNIQ_PC ||
   302		     mode == KCOV_MODE_TRACE_UNIQ_EDGE))
   303			hash_for_each_possible_rcu(map->buckets, entry, node, key) {
   304				if (entry->ent == ent->ent)
   305					return;
   306			}
   307		else
   308			hash_for_each_possible_rcu(map->buckets, entry, node, key) {
 > 309				if (entry->ent == ent->ent && entry->type == ent->type &&
 > 310				    entry->arg1 == ent->arg1 && entry->arg2 == ent->arg2) {
   311					return;
   312				}
   313			}
   314	
   315		entry = (struct kcov_entry *)gen_pool_alloc(map->pool, 1 << MIN_POOL_ALLOC_ORDER);
   316		if (unlikely(!entry))
   317			return;
   318	
   319		barrier();
   320		memcpy(entry, ent, sizeof(*entry));
   321		hash_add_rcu(map->buckets, &entry->node, key);
   322	
   323		if (mode == KCOV_MODE_TRACE_UNIQ_PC || mode == KCOV_MODE_TRACE_UNIQ_CMP)
   324			area = t->kcov_area;
   325		else
   326			area = kcov->map_edge->area;
   327	
   328		pos = READ_ONCE(area[0]) + 1;
   329		if (mode == KCOV_MODE_TRACE_UNIQ_PC || mode == KCOV_MODE_TRACE_UNIQ_EDGE) {
   330			if (likely(pos < t->kcov_size)) {
   331				WRITE_ONCE(area[0], pos);
   332				barrier();
   333				area[pos] = ent->ent;
   334			}
   335		} else {
   336			start_index = 1 + (pos - 1) * KCOV_WORDS_PER_CMP;
   337			max_pos = t->kcov_size * sizeof(unsigned long);
   338			end_pos = (start_index + KCOV_WORDS_PER_CMP) * sizeof(u64);
   339			if (likely(end_pos <= max_pos)) {
   340				/* See comment in __sanitizer_cov_trace_pc(). */
   341				WRITE_ONCE(area[0], pos);
   342				barrier();
   343				area[start_index] = ent->type;
   344				area[start_index + 1] = ent->arg1;
   345				area[start_index + 2] = ent->arg2;
   346				area[start_index + 3] = ent->ent;
   347			}
   348		}
   349	}
   350	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

