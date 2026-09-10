Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2542C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 08:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kap318hNqbacDE8KAgpu0F2/4fLVNhPXS67UZ8DfBfw=; b=Q47Md96EZiqkD4oBAkLpEJR039
	xZDs5X/wyUUpEdrUzX2D6fwsEaF4Nn/BD3BfIM2kaN0pjCTGXlogRpY+KBHB4vhDilezaVB3ncjjA
	ln9+vVzDMatAEzgR9a738kXyy3j8+EEKLyMi6LCI4/pmMezCluYHijPxGtONN0qGPa5kkoC0SvVBx
	0/R5TKU50grqFAcqlFyBcRc/h2sXQacMY93tR/MCNC9mMh9/VEEoMitF/tUbPj1PQyAyi7HdWnELp
	dhpLDaChHeqMZ12c4rDUfV/cxP26lPRaNV2/vUmGhljlF7YsPTmHI7g8KamChuAgR3waJSzLHog9E
	a7BeVj9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4aBi-0000000DkYp-2ys5;
	Thu, 10 Sep 2026 08:31:18 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4aBb-0000000DkWi-2i3s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 08:31:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789029071; x=1820565071;
  h=date:from:to:cc:subject:message-id;
  bh=EbMmTU7fLPivajyYSwoJ3YfsJpgKKnzVrH3AmmeYbWY=;
  b=WJ38aaw2BjZXD78mDU7wAt++A0axfyUNTkrfwquUrt1iGTo/ktSXjUDP
   BrzRCB6HzKDN+vqDL28v9vALvXSSC5UefwW24qaputPx+oX2N65wuZPPw
   YN8rht2neH3RWC0flLkUp14kxi/JJrTwDI9pbtmdGXkAsDK9LX+V6uJOr
   FohQTjyIXXLsaMXAyZA6h5riWCdx9Q0lEyhGo7OsLGqzbOUsyoV+E2VjB
   cpV12twU6nnzh9HADB0M1/zVHWhy3KQ5bTn+7OyhB5UOmipYvkm6Fo1s0
   8mQNORKiNIferaO5Qm26wQI7dw/tmpbHMZlUAMrF6eC3WbrCEC+TXmoRW
   A==;
X-CSE-ConnectionGUID: /zQLhbpsR46004h+qMX3wA==
X-CSE-MsgGUID: Jfl/GuTfTxaeA3UwNwiJ8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100133699"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="100133699"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 01:31:11 -0700
X-CSE-ConnectionGUID: 276tAET0R2+fsWrn06/3ng==
X-CSE-MsgGUID: m3gKOmSiS8yt+RGdS1gQbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="301466410"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Sep 2026 01:31:09 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4aBW-000000001aM-2dEV;
	Thu, 10 Sep 2026 08:31:06 +0000
Date: Thu, 10 Sep 2026 16:30:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 barry.song@csr.com
Subject: [baohua:dev/kairui_scanbalance 9/9] mm/vmscan.c:1953:6:
 warning: variable 'zone' set but not used
Message-ID: <202609101609.c4jRncpS-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_013111_726017_FDD8F737 
X-CRM114-Status: GOOD (  12.79  )
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
config: arm64-randconfig-r072-20260910 (https://download.01.org/0day-ci/archive/20260910/202609101609.c4jRncpS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609101609.c4jRncpS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609101609.c4jRncpS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     702 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |  ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |                     ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |  compiletime_assert_rwonce_type(x);    \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:1955:26: note: in expansion of macro 'READ_ONCE'
    1955 |  unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
         |                          ^~~~~~~~~
   mm/vmscan.c:1955:44: error: 'struct lruvec' has no member named 'lrugen'
    1955 |  unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
         |                                            ^~
   include/linux/compiler_types.h:682:9: note: in definition of macro '__compiletime_assert'
     682 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     702 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |  ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |                     ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |  compiletime_assert_rwonce_type(x);    \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:1955:26: note: in expansion of macro 'READ_ONCE'
    1955 |  unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
         |                          ^~~~~~~~~
   mm/vmscan.c:1955:44: error: 'struct lruvec' has no member named 'lrugen'
    1955 |  unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
         |                                            ^~
   include/linux/compiler_types.h:682:9: note: in definition of macro '__compiletime_assert'
     682 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     702 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |  ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |  compiletime_assert_rwonce_type(x);    \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:1955:26: note: in expansion of macro 'READ_ONCE'
    1955 |  unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
         |                          ^~~~~~~~~
   In file included from <command-line>:
   mm/vmscan.c:1955:44: error: 'struct lruvec' has no member named 'lrugen'
    1955 |  unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
         |                                            ^~
   include/linux/compiler_types.h:626:13: note: in definition of macro '__unqual_scalar_typeof'
     626 |   _Generic((x),      \
         |             ^
   include/asm-generic/rwonce.h:50:2: note: in expansion of macro '__READ_ONCE'
      50 |  __READ_ONCE(x);       \
         |  ^~~~~~~~~~~
   mm/vmscan.c:1955:26: note: in expansion of macro 'READ_ONCE'
    1955 |  unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
         |                          ^~~~~~~~~
   In file included from arch/arm64/include/asm/rwonce.h:81,
                    from include/linux/compiler.h:369,
                    from include/asm-generic/bug.h:5,
                    from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:7,
                    from mm/vmscan.c:15:
   mm/vmscan.c:1955:44: error: 'struct lruvec' has no member named 'lrugen'
    1955 |  unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
         |                                            ^~
   include/asm-generic/rwonce.h:44:72: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x) (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                        ^
   mm/vmscan.c:1955:26: note: in expansion of macro 'READ_ONCE'
    1955 |  unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
         |                          ^~~~~~~~~
   mm/vmscan.c:1957:46: error: invalid use of undefined type 'struct lru_gen_folio'
    1957 |  if (folio_test_unevictable(folio) || !lrugen->enabled)
         |                                              ^~
   mm/vmscan.c:1960:8: error: implicit declaration of function 'lru_gen_folio_seq' [-Werror=implicit-function-declaration]
    1960 |  seq = lru_gen_folio_seq(lruvec, folio, false);
         |        ^~~~~~~~~~~~~~~~~
   mm/vmscan.c:1962:8: error: implicit declaration of function 'lru_gen_from_seq' [-Werror=implicit-function-declaration]
    1962 |  gen = lru_gen_from_seq(seq);
         |        ^~~~~~~~~~~~~~~~
   mm/vmscan.c:1967:2: error: implicit declaration of function 'lru_gen_update_size'; did you mean 'huge_page_size'? [-Werror=implicit-function-declaration]
    1967 |  lru_gen_update_size(lruvec, folio, -1, gen);
         |  ^~~~~~~~~~~~~~~~~~~
         |  huge_page_size
   mm/vmscan.c:1968:31: error: invalid use of undefined type 'struct lru_gen_folio'
    1968 |  list_add(&folio->lru, &lrugen->folios[gen][type][zone]);
         |                               ^~
>> mm/vmscan.c:1953:6: warning: variable 'zone' set but not used [-Wunused-but-set-variable]
    1953 |  int zone = folio_zonenum(folio);
         |      ^~~~
>> mm/vmscan.c:1952:6: warning: variable 'type' set but not used [-Wunused-but-set-variable]
    1952 |  int type = folio_is_file_lru(folio);
         |      ^~~~
   cc1: some warnings being treated as errors


vim +/zone +1953 mm/vmscan.c

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
> 1952		int type = folio_is_file_lru(folio);
> 1953		int zone = folio_zonenum(folio);
  1954		struct lru_gen_folio *lrugen = &lruvec->lrugen;
  1955		unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
  1956	
  1957		if (folio_test_unevictable(folio) || !lrugen->enabled)
  1958			return false;
  1959	
  1960		seq = lru_gen_folio_seq(lruvec, folio, false);
  1961		seq = max(seq, min(scanned_seq + 1, max_seq));
  1962		gen = lru_gen_from_seq(seq);
  1963		flags = (gen + 1UL) << LRU_GEN_PGOFF;
  1964		/* see the comment on MIN_NR_GENS about PG_active */
  1965		set_mask_bits(folio_flags(folio, 0), LRU_GEN_MASK | BIT(PG_active), flags);
  1966	
> 1967		lru_gen_update_size(lruvec, folio, -1, gen);
> 1968		list_add(&folio->lru, &lrugen->folios[gen][type][zone]);
  1969	
  1970		return true;
  1971	}
  1972	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

