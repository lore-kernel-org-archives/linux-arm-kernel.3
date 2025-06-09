Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E7DC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 10:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1OwvzFINvmCOHFJISfJcKfLNmIz3HgkKL8EOq6FONK8=; b=Gp8PRvk+c5Rp2Dttj230iGujUg
	zCNoifAk6PlXO5nHrE2Eg4+bvL+FKvVubKqDwZRR4oGuHuimTiLmXXbuMpqMZeU/rM00/v9fZ+TKW
	f4fSSinr47vZwtM6teWeOdstsiHLn3fcu4+zOuiVB1qLJY0M01zC6H9eSPS8K+J2F2l+J2Ch9JVzv
	uXRw5Q7lIXpU/E2vr5yhebg8IZz+E/zreaxK3DSsNKTl+LMzwzJKtH6c5IIXV4TaP77EcJd9nl1nj
	daCus1K+xEOCAONTRfUyq5oGB9BlKMnUmIHNvSEUqYWvddPengeRJF0GCuqc1nqgpZKYUdl1z7FzF
	Ea5wbqcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOZXt-00000003sKu-1pr9;
	Mon, 09 Jun 2025 10:16:01 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOZVl-00000003sF9-0hDE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 10:13:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749464029; x=1781000029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cHxjFsUS8LL4QHA5PiRliG2F2zhRtTL4xLSY9x7AJmc=;
  b=GthHHlG+mcHiVl9A+Yp5ZfkEudYO7AkPKQWyeIZJlA9C9GBt/waSdxXK
   SGF0pscjyvCa9HuJ2fly3tz1tJtJeYszjMh+USTEGPhBKd1wyAB+jLHS9
   x5Th1rh/PwwQ2EOZ41Txhc906aYAXHJspVEQ3VHD6TJpAu4D5oEA7T0Cx
   TAcmQKegb3V3P2zG/byRqWGX2pJdXvHkgpEK+iTo+Y1NBraxwFo2xnIAv
   MtW0AcddxgGmQLx5Jx5yjej4Bqj0OdidhBxtO7zQba3xspcN3Hezhx2Ii
   bub+4kILUfmYNA6g27IyGGRVAnfITuPJY9G34PDuxnmPhW/Ngxjsv/cJZ
   g==;
X-CSE-ConnectionGUID: IHqvrcIUTaG5mY3Fo9tnLA==
X-CSE-MsgGUID: a2wbqRGGQWatJXZj0hnL9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="51394385"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="51394385"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 03:13:48 -0700
X-CSE-ConnectionGUID: vJt+yROBSTiQpMXLTL4bLg==
X-CSE-MsgGUID: M3k+/SSLRzKXL3bClz57zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="146993921"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jun 2025 03:13:46 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOZVg-0006wT-1V;
	Mon, 09 Jun 2025 10:13:44 +0000
Date: Mon, 9 Jun 2025 18:13:30 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:arm64/binutils-cleanup 1/2]
 arch/arm64/include/asm/alternative-macros.h:228:2: error: expected absolute
 expression
Message-ID: <202506091850.ZQDMasOg-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_031349_243008_0A64E8CD 
X-CRM114-Status: GOOD (  10.26  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git arm64/binutils-cleanup
head:   61189b46d4cae85952b67f48da9af226155e9dd7
commit: 08c6df2c373ba216ffc1d0b79c3e028adae5d2c4 [1/2] arm64: Remove .inst workarounds after binutils bump
config: arm64-randconfig-r053-20250609 (https://download.01.org/0day-ci/archive/20250609/202506091850.ZQDMasOg-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250609/202506091850.ZQDMasOg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506091850.ZQDMasOg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:4:
   In file included from lib/vdso/getrandom.c:8:
   In file included from include/vdso/datapage.h:197:
   In file included from arch/arm64/include/asm/vdso/gettimeofday.h:10:
   In file included from arch/arm64/include/asm/alternative.h:5:
>> arch/arm64/include/asm/alternative-macros.h:228:2: error: expected absolute expression
     228 |         ALTERNATIVE("b  %l[l_no]", "nop", %[cpucap])
         |         ^
   arch/arm64/include/asm/alternative-macros.h:214:2: note: expanded from macro 'ALTERNATIVE'
     214 |         _ALTERNATIVE_CFG(oldinstr, newinstr, __VA_ARGS__, 1)
         |         ^
   arch/arm64/include/asm/alternative-macros.h:76:2: note: expanded from macro '_ALTERNATIVE_CFG'
      76 |         __ALTERNATIVE_CFG(oldinstr, newinstr, cpucap, IS_ENABLED(cfg))
         |         ^
   arch/arm64/include/asm/alternative-macros.h:56:9: note: expanded from macro '__ALTERNATIVE_CFG'
      56 |         "664:\n\t"                                                      \
         |                ^
   <inline asm>:16:6: note: instantiated into assembly here
      16 |         .if ((664b-663b) != (662b-661b))
         |             ^
   In file included from <built-in>:4:
   In file included from lib/vdso/getrandom.c:8:
   In file included from include/vdso/datapage.h:197:
   In file included from arch/arm64/include/asm/vdso/gettimeofday.h:10:
   In file included from arch/arm64/include/asm/alternative.h:5:
>> arch/arm64/include/asm/alternative-macros.h:228:2: error: Alternatives instruction length mismatch
     228 |         ALTERNATIVE("b  %l[l_no]", "nop", %[cpucap])
         |         ^
   arch/arm64/include/asm/alternative-macros.h:214:2: note: expanded from macro 'ALTERNATIVE'
     214 |         _ALTERNATIVE_CFG(oldinstr, newinstr, __VA_ARGS__, 1)
         |         ^
   arch/arm64/include/asm/alternative-macros.h:76:2: note: expanded from macro '_ALTERNATIVE_CFG'
      76 |         __ALTERNATIVE_CFG(oldinstr, newinstr, cpucap, IS_ENABLED(cfg))
         |         ^
   arch/arm64/include/asm/alternative-macros.h:58:3: note: expanded from macro '__ALTERNATIVE_CFG'
      58 |         ".error \"Alternatives instruction length mismatch\"\n"         \
         |          ^
   <inline asm>:17:1: note: instantiated into assembly here
      17 | .error "Alternatives instruction length mismatch"
         | ^
   2 errors generated.
   In file included from <built-in>:4:
   In file included from lib/vdso/gettimeofday.c:5:
   In file included from include/vdso/datapage.h:197:
   In file included from arch/arm64/include/asm/vdso/gettimeofday.h:11:
>> arch/arm64/include/asm/arch_timer.h:204:15: error: expected absolute expression
     204 |         asm volatile(ALTERNATIVE("isb\n mrs %0, cntvct_el0",
         |                      ^
   arch/arm64/include/asm/alternative-macros.h:214:2: note: expanded from macro 'ALTERNATIVE'
     214 |         _ALTERNATIVE_CFG(oldinstr, newinstr, __VA_ARGS__, 1)
         |         ^
   arch/arm64/include/asm/alternative-macros.h:76:2: note: expanded from macro '_ALTERNATIVE_CFG'
      76 |         __ALTERNATIVE_CFG(oldinstr, newinstr, cpucap, IS_ENABLED(cfg))
         |         ^
   arch/arm64/include/asm/alternative-macros.h:56:9: note: expanded from macro '__ALTERNATIVE_CFG'
      56 |         "664:\n\t"                                                      \
         |                ^
   <inline asm>:29:6: note: instantiated into assembly here
      29 |         .if ((664b-663b) != (662b-661b))
         |             ^
   In file included from <built-in>:4:
   In file included from lib/vdso/gettimeofday.c:5:
   In file included from include/vdso/datapage.h:197:
   In file included from arch/arm64/include/asm/vdso/gettimeofday.h:11:
>> arch/arm64/include/asm/arch_timer.h:204:15: error: Alternatives instruction length mismatch
     204 |         asm volatile(ALTERNATIVE("isb\n mrs %0, cntvct_el0",
         |                      ^
   arch/arm64/include/asm/alternative-macros.h:214:2: note: expanded from macro 'ALTERNATIVE'
     214 |         _ALTERNATIVE_CFG(oldinstr, newinstr, __VA_ARGS__, 1)
         |         ^
   arch/arm64/include/asm/alternative-macros.h:76:2: note: expanded from macro '_ALTERNATIVE_CFG'
      76 |         __ALTERNATIVE_CFG(oldinstr, newinstr, cpucap, IS_ENABLED(cfg))
         |         ^
   arch/arm64/include/asm/alternative-macros.h:58:3: note: expanded from macro '__ALTERNATIVE_CFG'
      58 |         ".error \"Alternatives instruction length mismatch\"\n"         \
         |          ^
   <inline asm>:30:1: note: instantiated into assembly here
      30 | .error "Alternatives instruction length mismatch"
         | ^
   make[3]: *** [scripts/Makefile.build:203: arch/arm64/kernel/vdso/vgetrandom.o] Error 1
   In file included from <built-in>:4:
   In file included from lib/vdso/gettimeofday.c:5:
   In file included from include/vdso/datapage.h:197:
   In file included from arch/arm64/include/asm/vdso/gettimeofday.h:11:
>> arch/arm64/include/asm/arch_timer.h:204:15: error: expected absolute expression
     204 |         asm volatile(ALTERNATIVE("isb\n mrs %0, cntvct_el0",
         |                      ^
   arch/arm64/include/asm/alternative-macros.h:214:2: note: expanded from macro 'ALTERNATIVE'
     214 |         _ALTERNATIVE_CFG(oldinstr, newinstr, __VA_ARGS__, 1)
         |         ^
   arch/arm64/include/asm/alternative-macros.h:76:2: note: expanded from macro '_ALTERNATIVE_CFG'
      76 |         __ALTERNATIVE_CFG(oldinstr, newinstr, cpucap, IS_ENABLED(cfg))
         |         ^
   arch/arm64/include/asm/alternative-macros.h:56:9: note: expanded from macro '__ALTERNATIVE_CFG'
      56 |         "664:\n\t"                                                      \
         |                ^
   <inline asm>:29:6: note: instantiated into assembly here
      29 |         .if ((664b-663b) != (662b-661b))
         |             ^
   In file included from <built-in>:4:
   In file included from lib/vdso/gettimeofday.c:5:
   In file included from include/vdso/datapage.h:197:
   In file included from arch/arm64/include/asm/vdso/gettimeofday.h:11:
>> arch/arm64/include/asm/arch_timer.h:204:15: error: Alternatives instruction length mismatch
     204 |         asm volatile(ALTERNATIVE("isb\n mrs %0, cntvct_el0",
         |                      ^
   arch/arm64/include/asm/alternative-macros.h:214:2: note: expanded from macro 'ALTERNATIVE'
     214 |         _ALTERNATIVE_CFG(oldinstr, newinstr, __VA_ARGS__, 1)
         |         ^
   arch/arm64/include/asm/alternative-macros.h:76:2: note: expanded from macro '_ALTERNATIVE_CFG'
      76 |         __ALTERNATIVE_CFG(oldinstr, newinstr, cpucap, IS_ENABLED(cfg))
         |         ^
   arch/arm64/include/asm/alternative-macros.h:58:3: note: expanded from macro '__ALTERNATIVE_CFG'
      58 |         ".error \"Alternatives instruction length mismatch\"\n"         \
         |          ^
   <inline asm>:30:1: note: instantiated into assembly here
      30 | .error "Alternatives instruction length mismatch"
         | ^
   4 errors generated.
   make[3]: *** [scripts/Makefile.build:203: arch/arm64/kernel/vdso/vgettimeofday.o] Error 1
   make[3]: Target 'include/generated/vdso-offsets.h' not remade because of errors.
   make[3]: Target 'arch/arm64/kernel/vdso/vdso.so' not remade because of errors.
   make[2]: *** [arch/arm64/Makefile:203: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +228 arch/arm64/include/asm/alternative-macros.h

21fb26bfb01ffe Mark Rutland   2022-09-12  219  
21fb26bfb01ffe Mark Rutland   2022-09-12  220  static __always_inline bool
5235c7e2cfccb5 Mark Rutland   2023-06-07  221  alternative_has_cap_likely(const unsigned long cpucap)
21fb26bfb01ffe Mark Rutland   2022-09-12  222  {
de66cb37ab6488 Mark Rutland   2023-10-16  223  	if (!cpucap_is_possible(cpucap))
de66cb37ab6488 Mark Rutland   2023-10-16  224  		return false;
21fb26bfb01ffe Mark Rutland   2022-09-12  225  
4356e9f841f7fb Linus Torvalds 2024-02-09  226  	asm goto(
2c2ca3416b4090 Mark Rutland   2024-09-03  227  #ifdef BUILD_VDSO
2c2ca3416b4090 Mark Rutland   2024-09-03 @228  	ALTERNATIVE("b	%l[l_no]", "nop", %[cpucap])
2c2ca3416b4090 Mark Rutland   2024-09-03  229  #else
5235c7e2cfccb5 Mark Rutland   2023-06-07  230  	ALTERNATIVE_CB("b	%l[l_no]", %[cpucap], alt_cb_patch_nops)
2c2ca3416b4090 Mark Rutland   2024-09-03  231  #endif
21fb26bfb01ffe Mark Rutland   2022-09-12  232  	:
5235c7e2cfccb5 Mark Rutland   2023-06-07  233  	: [cpucap] "i" (cpucap)
21fb26bfb01ffe Mark Rutland   2022-09-12  234  	:
21fb26bfb01ffe Mark Rutland   2022-09-12  235  	: l_no);
21fb26bfb01ffe Mark Rutland   2022-09-12  236  
21fb26bfb01ffe Mark Rutland   2022-09-12  237  	return true;
21fb26bfb01ffe Mark Rutland   2022-09-12  238  l_no:
21fb26bfb01ffe Mark Rutland   2022-09-12  239  	return false;
21fb26bfb01ffe Mark Rutland   2022-09-12  240  }
21fb26bfb01ffe Mark Rutland   2022-09-12  241  

:::::: The code at line 228 was first introduced by commit
:::::: 2c2ca3416b4090aef8c646adccfc3be4b712db8a arm64: alternative: make alternative_has_cap_likely() VDSO compatible

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Jason A. Donenfeld <Jason@zx2c4.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

