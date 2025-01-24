Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DACC02182
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 02:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UPmM6acKSzQDeXlufKGeLR25eMLELY0p+Hjcp4bjlBk=; b=aH5Qc5hOpJaxDdQ8iPMhPdp7py
	38SIaJvGflfyRvaaNC6sWxqZtJZPzAcLbwoea8uDyGHl888SqVARP6UGcjg3CcKoGpbMUPEoV0mnM
	IgzAgtKflRYuFLpVcJRT9xcSDeNPiE1c0vqnHlDiJCQhsXoFoGxSeuESeOA34tGRbYp+4eBez0QaZ
	TYfMDhaoWdnas10iKKgmImUkoYfAh7TovyobDKRfCrO8xTVHuCH/Xq4RqY/4OqzVqnpf4U9uFm5nI
	BVmhdxd1+3jJwfvxXx3iZz/KY8kOsLrcP7hHYBrFtPMXfyHVm8mi4JO2Hy9myFSrN1zESxWu9vEdh
	Qt1oseFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb9Cp-0000000DhtX-0hQh;
	Fri, 24 Jan 2025 02:13:59 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb9BW-0000000Dhlg-1SC3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 02:12:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737684758; x=1769220758;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZVWsL5TzIlssbUAp6wHsmMyTAmfxKSHrFnKGbtmAIBQ=;
  b=Qvp2YzTh0njZtKpUU5ckkhTCItaJK2bOIaAQ1PI5zzMMzD+5fxbZQmfW
   m0rZgXUCgoeKAjLlQBFkp+Xg3mlGo3BJSS0IgkjUKLzxgFVBgeEV/W4se
   w/5e5P3OWJsoEMuy3wAD4Jn3BuIBOqB1tzp/GAeHVr43IOty+zgNCf07e
   mzcx6qd0AZ4BILuDUVlTtEwZLAsBvaWhd/pHNJPg2F7mmFfWDqI4e/3/j
   D3AcxEjKDS6Lrxq2Jef/OcGH+K6dcrxO1bskt9rnS73OfxccP/fG6METn
   ap6r7H7r5qFHIIXn+hQmxJfg2sBpuN2hmYufG06ywFTvG6xoZAq8VtOu6
   Q==;
X-CSE-ConnectionGUID: O/F6ANSJRCO6WsM01cKUWg==
X-CSE-MsgGUID: +xU77SdZTG+hWk5VhnIGLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="48875999"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="48875999"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 18:12:31 -0800
X-CSE-ConnectionGUID: nXYMOnQESfGam5t5ZaclGw==
X-CSE-MsgGUID: 6JPi4DtnRJujUu4v4yIVnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="107645960"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Jan 2025 18:12:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb9BI-000c19-0j;
	Fri, 24 Jan 2025 02:12:24 +0000
Date: Fri, 24 Jan 2025 10:11:52 +0800
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
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@quicinc.com
Subject: Re: [PATCH 4/7] kcov: introduce new kcov KCOV_TRACE_UNIQ_CMP mode
Message-ID: <202501240959.61XLxBYF-lkp@intel.com>
References: <20250114-kcov-v1-4-004294b931a2@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114-kcov-v1-4-004294b931a2@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_181238_399985_FBD4D775 
X-CRM114-Status: GOOD (  12.55  )
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
config: mips-randconfig-r073-20250124 (https://download.01.org/0day-ci/archive/20250124/202501240959.61XLxBYF-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501240959.61XLxBYF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240959.61XLxBYF-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/kcov.c: In function 'kcov_map_add':
>> kernel/kcov.c:309:60: error: 'struct kcov_entry' has no member named 'type'
     309 |                         if (entry->ent == ent->ent && entry->type == ent->type &&
         |                                                            ^~
   kernel/kcov.c:309:73: error: 'struct kcov_entry' has no member named 'type'
     309 |                         if (entry->ent == ent->ent && entry->type == ent->type &&
         |                                                                         ^~
>> kernel/kcov.c:310:34: error: 'struct kcov_entry' has no member named 'arg1'
     310 |                             entry->arg1 == ent->arg1 && entry->arg2 == ent->arg2) {
         |                                  ^~
   kernel/kcov.c:310:47: error: 'struct kcov_entry' has no member named 'arg1'
     310 |                             entry->arg1 == ent->arg1 && entry->arg2 == ent->arg2) {
         |                                               ^~
>> kernel/kcov.c:310:62: error: 'struct kcov_entry' has no member named 'arg2'
     310 |                             entry->arg1 == ent->arg1 && entry->arg2 == ent->arg2) {
         |                                                              ^~
   kernel/kcov.c:310:75: error: 'struct kcov_entry' has no member named 'arg2'
     310 |                             entry->arg1 == ent->arg1 && entry->arg2 == ent->arg2) {
         |                                                                           ^~
   kernel/kcov.c:343:48: error: 'struct kcov_entry' has no member named 'type'
     343 |                         area[start_index] = ent->type;
         |                                                ^~
   kernel/kcov.c:344:52: error: 'struct kcov_entry' has no member named 'arg1'
     344 |                         area[start_index + 1] = ent->arg1;
         |                                                    ^~
   kernel/kcov.c:345:52: error: 'struct kcov_entry' has no member named 'arg2'
     345 |                         area[start_index + 2] = ent->arg2;
         |                                                    ^~


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

