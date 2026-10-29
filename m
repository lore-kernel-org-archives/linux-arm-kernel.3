Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B728606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 03:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FJzUyWzy;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZlkUj1KF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=T2wJHvvfHh5stRmUDRprT6CqvsTMqTsUp6BRdeqqGCI=; b=FJzUyWzyj1GGi3uRXVOZUNpD0Y
	SMAIPLHRVM93AMELyaqYQ/szFrgEhKb44YjPYycQojuxtc/MjSNMD3kco7EcjN2jv/Kw24xk0F5U3
	A3INDY+lNU9ZTqsPLaXCwaYV1jzO8dBG+ZnBu5FeBXP8RpAOGz8Brz3k/s6WOEqRz60fwWa3AWEUc
	wyJszvHsyG4Qxc9mOLuRI3yr6dA756Gz/MWQdppungcQtvWRRYZyhjzkqhMXJHt0i75noID35EjFd
	3aikDqOMeFo8w8cLSezfgVJc2wJJac/NYJaEml2d3xzZhFgnk0ZEt5P8DVCzQLBx5/gYHDlZrAhUu
	kGoHQ66A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMH02-00000008FoG-2yxv;
	Thu, 29 Oct 2026 03:40:22 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMH00-00000008Fnt-0mar
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 03:40:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793245220; x=1824781220;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6He+g3AusxeH/gTF4BqtGi6Idfhj/4/mur9we+ezF4w=;
  b=ZlkUj1KFGQ0CHAoMAKsPK0CsiEEJJu+7ttpobi5UK2lPdaAT+O1PMlTM
   K2BqOfjvEShSFtntSauhZ7eBboCwEaA6/ympxV5bLlNG+NDfkztyiAPeM
   +kcJQPKow9IIIDe2zbCTW5xcIpAPPC4T5jUkhJ3S5W6oVtbC+RBIN0jiX
   B432Qqn8QM2qxd4DghKIHiA4X/AFyY7SpZvKhUuTE8u9sTje84V6znlLw
   ZN6YYFdWJImZN5Qs50Jk2OoImkOZpv07Lk3f3ZRdDSimLiQWBuYSL53Em
   JwnCJFG9sLGwamlIKjpuru3ZEWb3opFqJFlyVdvz3/1+/vSLARbMflo7r
   Q==;
X-CSE-ConnectionGUID: tbFDEkVqSzeMycuPpwHDSA==
X-CSE-MsgGUID: 6IY4RFlARf2SrNG+Sj4krg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2012088"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="2012088"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 20:40:19 -0700
X-CSE-ConnectionGUID: ksy7pyXKTUmlIOtfUgQwJw==
X-CSE-MsgGUID: Xn2yZ/ccSASehaLbTgTq5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5143393"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Oct 2026 20:40:15 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMGzs-00000000ZYe-0jbr;
	Thu, 29 Oct 2026 03:40:12 +0000
Date: Thu, 29 Oct 2026 11:39:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jinjiang Tu <tujinjiang@huawei.com>, akpm@linux-foundation.org,
	david@kernel.org, ljs@kernel.org, catalin.marinas@arm.com,
	will@kernel.org, mark.rutland@arm.com, ryan.roberts@arm.com,
	peterx@redhat.com, dave.jiang@intel.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, wangkefeng.wang@huawei.com,
	sunnanyong@huawei.com, tujinjiang@huawei.com
Subject: Re: [PATCH RESEND 3/3] arm64: Add PUD THP support for DAX and pfnmap
Message-ID: <202610291125.dNGHD2Vr-lkp@intel.com>
References: <20261028121404.853944-4-tujinjiang@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028121404.853944-4-tujinjiang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_204020_240296_0DC5A84E 
X-CRM114-Status: GOOD (  12.33  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jinjiang,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on arm64/for-next/core powerpc/next powerpc/fixes tip/x86/core tip/x86/mm linus/master v7.3 next-20261027]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jinjiang-Tu/mm-define-generic-pudp_invalidate-implementation/20261028-201402
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20261028121404.853944-4-tujinjiang%40huawei.com
patch subject: [PATCH RESEND 3/3] arm64: Add PUD THP support for DAX and pfnmap
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261029/202610291125.dNGHD2Vr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610291125.dNGHD2Vr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610291125.dNGHD2Vr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/io.h:13,
                    from include/linux/io.h:12,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from arch/arm64/include/asm/hardirq.h:17,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/trace_recursion.h:5,
                    from include/linux/ftrace.h:10,
                    from arch/arm64/kernel/asm-offsets.c:13:
>> include/linux/pgtable.h:2098:19: error: redefinition of 'pud_trans_huge'
    2098 | static inline int pud_trans_huge(pud_t pud)
         |                   ^~~~~~~~~~~~~~
   In file included from include/linux/pgtable.h:6:
   arch/arm64/include/asm/pgtable.h:842:19: note: previous definition of 'pud_trans_huge' with type 'int(pud_t)'
     842 | static inline int pud_trans_huge(pud_t pud)
         |                   ^~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:185: arch/arm64/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1416: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/pud_trans_huge +2098 include/linux/pgtable.h

1501899a898dfb5 include/asm-generic/pgtable.h Dan Williams   2017-11-29  2095  
a00cc7d9dd93d66 include/asm-generic/pgtable.h Matthew Wilcox 2017-02-24  2096  #if !defined(CONFIG_TRANSPARENT_HUGEPAGE) || \
bcd0dea5f4fb3d0 include/linux/pgtable.h       Liu Shixin     2022-08-29  2097  	!defined(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
a00cc7d9dd93d66 include/asm-generic/pgtable.h Matthew Wilcox 2017-02-24 @2098  static inline int pud_trans_huge(pud_t pud)
a00cc7d9dd93d66 include/asm-generic/pgtable.h Matthew Wilcox 2017-02-24  2099  {
a00cc7d9dd93d66 include/asm-generic/pgtable.h Matthew Wilcox 2017-02-24  2100  	return 0;
a00cc7d9dd93d66 include/asm-generic/pgtable.h Matthew Wilcox 2017-02-24  2101  }
a00cc7d9dd93d66 include/asm-generic/pgtable.h Matthew Wilcox 2017-02-24  2102  #endif
a00cc7d9dd93d66 include/asm-generic/pgtable.h Matthew Wilcox 2017-02-24  2103  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

