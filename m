Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351A7C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 12:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4t1qrmSWuyCgBrcgPjWCCn3uT3usz5k+UseZyM1xIM=; b=PNPemPbrAdgRrnqpRLn3RJWxo1
	7hyL6J2JS20pPQnUu0MBqjpcdIk/DHf1ntlaLkFrexX43btJk+OcU0HNYN/hLkUQU18QeWcj3+IHF
	M3azNOZr6SDmHcpl+E+ufJPDETsloK/ykuhJDXftA73kul57t1f2neC8envHfmqSQx67OMhF0euhW
	W3zDA/hFFrCWTcmha6fE6N3t2PjLVOd8ajYVuTM3hgC94uiCSaIFfjNrZXcZtcLelyVX0hK0zNf7s
	CK9p+tWI2rAwCVRQKFdW3IrzQoo2W5bc5Bz2RfmrMEAeOl9ViVdgCOD3ckXqnkrwifn/yy/mY6sB1
	XmzfFyZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbIrQ-0000000EfQx-0QbT;
	Fri, 24 Jan 2025 12:32:32 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbImo-0000000Eedd-03Uk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 12:27:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737721666; x=1769257666;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9oBt5eh8mlxIfH1UK0nPtYWTn/a4BrjpdPj9YsykCGU=;
  b=QYfocZTbzRv1+1MMHngAJaBiZJtCzfhZiJcTo36UZSSRUi29HVykHTKG
   wsp3MiZ1Lj1irFO06R/B4HNS8OsoJCS7SKjSEEXs8Y9655hzVnwJeMm+v
   BKJ2k+BKhLAIkHmPIgI7k3k6OZsIK4uGfd9BAHjG/Hx6bC9K7nngbkQUJ
   v9xLTwlCzRr5A3MLgZXfsx05RGJl28aNDnR71TpoRuRkFu7niRHEL6yOw
   6szZKVb4x57nX2dqsh1Wys3eI/rz5FjJse/MnHqkoFCeDLSfqxQDHFGKb
   YqUlTF+nbNHmk0zmP3Inl3+gCqctZUT9LN40FB3DP0HeYume5CyOg14D2
   A==;
X-CSE-ConnectionGUID: DcFPdb83S8e3WwDlSYd7nQ==
X-CSE-MsgGUID: 2tYny6DSQwy+RmwlzCvtmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="37458582"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; 
   d="scan'208";a="37458582"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 04:27:42 -0800
X-CSE-ConnectionGUID: TcKqrqbOStiT63Vx3rUJ8g==
X-CSE-MsgGUID: 5YTnTvwzTZiG18df72xk5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112390003"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Jan 2025 04:27:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbImd-000cfL-38;
	Fri, 24 Jan 2025 12:27:35 +0000
Date: Fri, 24 Jan 2025 20:26:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiao, Joey" <quic_jiangenj@quicinc.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@quicinc.com
Subject: Re: [PATCH 4/7] kcov: introduce new kcov KCOV_TRACE_UNIQ_CMP mode
Message-ID: <202501242043.KmrFufhL-lkp@intel.com>
References: <20250114-kcov-v1-4-004294b931a2@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114-kcov-v1-4-004294b931a2@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_042746_077075_E8BE82CD 
X-CRM114-Status: GOOD (  13.50  )
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

url:    https://github.com/intel-lab-lkp/linux/commits/Jiao-Joey/kcov-introduce-new-kcov-KCOV_TRACE_UNIQ_PC-mode/20250114-133713
base:   9b2ffa6148b1e4468d08f7e0e7e371c43cac9ffe
patch link:    https://lore.kernel.org/r/20250114-kcov-v1-4-004294b931a2%40quicinc.com
patch subject: [PATCH 4/7] kcov: introduce new kcov KCOV_TRACE_UNIQ_CMP mode
config: x86_64-randconfig-001-20250124 (https://download.01.org/0day-ci/archive/20250124/202501242043.KmrFufhL-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501242043.KmrFufhL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501242043.KmrFufhL-lkp@intel.com/

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

