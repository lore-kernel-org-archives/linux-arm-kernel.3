Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3CEC79FBB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 21:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OxXvQMohmjTu0OjYWb2ljZmqmLhh+Kf9BFuWBzZ90ZU=; b=jkoI/mXG8Begmkahv9qsh0EXu5
	rUEvTZoeNH3hOwW26dsVH08CudqWgmlKy2xVO0XBk0XBsXU2zGnUZ1PaLPDy0SiOGvB3zJxBSpFCS
	xhxHtclaM81khc8Dhb9ACag+LmyhFScTrS+8Bc9Upz3oY9deQtyWp/GIvy4sTgFNcpuIpwm1PH5Gv
	FY2AF6F80n5QUGrZCoO6nuIhMSxMHXP10mTQTEKZ4P7Q4G70NPJvXKVcP5Ig8LT2H2oqsXHFsta5l
	fNnlMG8jVAP62D4NpNxiztuQLUPLqbUzLK92XU7pOfH39DJcM+egAkCxbRIGPVkvd/BPMkY+B6TRa
	hilUJHPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4mAq-0000000FPTt-2Q2X;
	Thu, 10 Sep 2026 21:19:12 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4mAn-0000000FPTX-33uK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 21:19:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789075149; x=1820611149;
  h=date:from:to:cc:subject:message-id;
  bh=IawTxksbLdoQtjLcQx6qmRxSGThyH1QQ7RxndFI3xjA=;
  b=d3x0isizAF7ABJCzMYfHVBcR0RmEA3kdMW+/J8uUS3o5FcICFwtxdeD8
   /XRWPZmjwrsVjg6GUQAc/6yNVhSrbg6Zj0zm/mwyRY9Dx3rgxsq88z1Pu
   8/aDtBmynuIZUSYsXmKqBMCXw99M2xJu1pPLJkNaOugwDZF5E1oTdOez+
   N8ictMVU8Xb9aqpROI1ZbF9lyc0Qpyoq5RK3k1CL4KyCKiPfrOiUps0pz
   X4rdOC5W1bVtt6rqGRUcKV80zFech3UxvrMeuju7xYJ3hAl9Yvnc+dWLO
   lgNtKWYtBJmmqyYDUSdkU0eb9EEBxd/a9ybWEk/Zm8BIHMgA5ASDuDAfn
   Q==;
X-CSE-ConnectionGUID: 5IxAv9J5SnGr/abPnF01fQ==
X-CSE-MsgGUID: ylL/yltdQmipsOER2bX2Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100699849"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="100699849"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 14:19:08 -0700
X-CSE-ConnectionGUID: ulphI/UlRGOJg3xlh/3/qg==
X-CSE-MsgGUID: Mq914YN+Q8S5sAKZpi1JKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="269151317"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 10 Sep 2026 14:19:06 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4mAh-000000000Yh-3ZJm;
	Thu, 10 Sep 2026 21:19:03 +0000
Date: Fri, 11 Sep 2026 05:18:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 barry.song@csr.com
Subject: [baohua:dev/kairui_scanbalance 9/9] mm/vmscan.c:1957:46:
 error: dereferencing pointer to incomplete type 'struct lru_gen_folio'
Message-ID: <202609110429.UIZ3Tr8e-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_141909_823752_58F8C7FF 
X-CRM114-Status: GOOD (  13.05  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/baohua/linux.git dev/kairui_scanbalance
head:   c96aacd4045a7a4c8d292e6c9ba6d169cdc0b570
commit: c96aacd4045a7a4c8d292e6c9ba6d169cdc0b570 [9/9] mm/mglru: avoid placing rejected folios below populated gen
config: powerpc-randconfig-r123-20260910 (https://download.01.org/0day-ci/archive/20260911/202609110429.UIZ3Tr8e-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609110429.UIZ3Tr8e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609110429.UIZ3Tr8e-lkp@intel.com/

All errors (new ones prefixed by >>):

                        ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
     compiletime_assert_rwonce_type(x);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:1955:26: note: in expansion of macro 'READ_ONCE'
     unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
                             ^~~~~~~~~
   mm/vmscan.c:1955:44: error: 'struct lruvec' has no member named 'lrugen'
     unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
                                               ^~
   include/linux/compiler.h:68:3: note: in definition of macro '__trace_if_value'
     (cond) ?     \
      ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:682:3: note: in expansion of macro 'if'
      if (!(condition))     \
      ^~
   include/linux/compiler_types.h:690:2: note: in expansion of macro '__compiletime_assert'
     __compiletime_assert(condition, msg, prefix, suffix)
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
     ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
                        ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
     compiletime_assert_rwonce_type(x);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:1955:26: note: in expansion of macro 'READ_ONCE'
     unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
                             ^~~~~~~~~
   mm/vmscan.c:1955:44: error: 'struct lruvec' has no member named 'lrugen'
     unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
                                               ^~
   include/linux/compiler.h:68:3: note: in definition of macro '__trace_if_value'
     (cond) ?     \
      ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:682:3: note: in expansion of macro 'if'
      if (!(condition))     \
      ^~
   include/linux/compiler_types.h:690:2: note: in expansion of macro '__compiletime_assert'
     __compiletime_assert(condition, msg, prefix, suffix)
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
     ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
     compiletime_assert_rwonce_type(x);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:1955:26: note: in expansion of macro 'READ_ONCE'
     unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
                             ^~~~~~~~~
   In file included from <command-line>:
   mm/vmscan.c:1955:44: error: 'struct lruvec' has no member named 'lrugen'
     unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
                                               ^~
   include/linux/compiler_types.h:626:13: note: in definition of macro '__unqual_scalar_typeof'
      _Generic((x),      \
                ^
   include/asm-generic/rwonce.h:50:2: note: in expansion of macro '__READ_ONCE'
     __READ_ONCE(x);       \
     ^~~~~~~~~~~
   mm/vmscan.c:1955:26: note: in expansion of macro 'READ_ONCE'
     unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
                             ^~~~~~~~~
   In file included from ./arch/powerpc/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:369,
                    from include/asm-generic/bug.h:5,
                    from arch/powerpc/include/asm/bug.h:116,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:7,
                    from mm/vmscan.c:15:
   mm/vmscan.c:1955:44: error: 'struct lruvec' has no member named 'lrugen'
     unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
                                               ^~
   include/asm-generic/rwonce.h:44:72: note: in definition of macro '__READ_ONCE'
    #define __READ_ONCE(x) (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                                                                           ^
   mm/vmscan.c:1955:26: note: in expansion of macro 'READ_ONCE'
     unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
                             ^~~~~~~~~
   In file included from include/asm-generic/bug.h:5,
                    from arch/powerpc/include/asm/bug.h:116,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:7,
                    from mm/vmscan.c:15:
>> mm/vmscan.c:1957:46: error: dereferencing pointer to incomplete type 'struct lru_gen_folio'
     if (folio_test_unevictable(folio) || !lrugen->enabled)
                                                 ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                       ^~~~
   mm/vmscan.c:1957:2: note: in expansion of macro 'if'
     if (folio_test_unevictable(folio) || !lrugen->enabled)
     ^~
   mm/vmscan.c:1960:8: error: implicit declaration of function 'lru_gen_folio_seq'; did you mean 'lru_to_folio'? [-Werror=implicit-function-declaration]
     seq = lru_gen_folio_seq(lruvec, folio, false);
           ^~~~~~~~~~~~~~~~~
           lru_to_folio
   mm/vmscan.c:1962:8: error: implicit declaration of function 'lru_gen_from_seq'; did you mean 'lru_gen_set_refs'? [-Werror=implicit-function-declaration]
     gen = lru_gen_from_seq(seq);
           ^~~~~~~~~~~~~~~~
           lru_gen_set_refs
   mm/vmscan.c:1967:2: error: implicit declaration of function 'lru_gen_update_size'; did you mean 'huge_page_size'? [-Werror=implicit-function-declaration]
     lru_gen_update_size(lruvec, folio, -1, gen);
     ^~~~~~~~~~~~~~~~~~~
     huge_page_size
   mm/vmscan.c:1953:6: warning: variable 'zone' set but not used [-Wunused-but-set-variable]
     int zone = folio_zonenum(folio);
         ^~~~
   mm/vmscan.c:1952:6: warning: variable 'type' set but not used [-Wunused-but-set-variable]
     int type = folio_is_file_lru(folio);
         ^~~~
   cc1: some warnings being treated as errors


vim +1957 mm/vmscan.c

  1938	
  1939	/*
  1940	 * Even though we have called folio_set_active() for rejected folios
  1941	 * in evict_folios(), they may still be demoted or placed in the last
  1942	 * populated generation since we can now scan all generations.
  1943	 * Make sure these folios are neither demoted nor placed in the last
  1944	 * populated generation, unless it is also the youngest generation
  1945	 */
  1946	static inline bool lru_gen_add_rejected_folio(struct lruvec *lruvec, struct folio *folio,
  1947			unsigned long scanned_seq)
  1948	{
  1949		unsigned long seq;
  1950		unsigned long flags;
  1951		int gen;
  1952		int type = folio_is_file_lru(folio);
  1953		int zone = folio_zonenum(folio);
  1954		struct lru_gen_folio *lrugen = &lruvec->lrugen;
> 1955		unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
  1956	
> 1957		if (folio_test_unevictable(folio) || !lrugen->enabled)
  1958			return false;
  1959	
  1960		seq = lru_gen_folio_seq(lruvec, folio, false);
  1961		seq = max(seq, min(scanned_seq + 1, max_seq));
  1962		gen = lru_gen_from_seq(seq);
  1963		flags = (gen + 1UL) << LRU_GEN_PGOFF;
  1964		/* see the comment on MIN_NR_GENS about PG_active */
  1965		set_mask_bits(folio_flags(folio, 0), LRU_GEN_MASK | BIT(PG_active), flags);
  1966	
  1967		lru_gen_update_size(lruvec, folio, -1, gen);
  1968		list_add(&folio->lru, &lrugen->folios[gen][type][zone]);
  1969	
  1970		return true;
  1971	}
  1972	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

