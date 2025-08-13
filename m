Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74CECA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 07:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jmTse71ZxUB+igTg1Ns0lYuIJGh3Zk0jV2ybZcG55QA=; b=Xv3RndY7XWf/+AY2O82yYQkyXt
	HEJHqCpu0+ubq5jzFNCigQhu6oaICeGqYDH1EzLD/L4VxRxCbrACxIr/bMZxNnF4D5X1TIQaJlgJr
	v/T25L91e/cKl+Pwcv8KH2G22srhNn5u6kcd7La2ANrEwmQ3iFaKtQlxU7iXJWF3gvD+4F1dTaPQ5
	QIW9clo4dtTDO58ASHMSv2vEoRjIDcqSvBety7EfDoo7y9KQKJOhdiY4PtT4zU2mdSUPnNfcEJvuq
	25tDx6evw8fxJW9cKnvOhVN1JVROyJpyKWgtRHgMhtUW+NVCcSzrcV3LorvlRoOVWKy+Bc6ftLs+Y
	5l5gdE9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6HX-0000000CzYY-1Pnn;
	Wed, 13 Aug 2025 07:52:23 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um5Pc-0000000Cr0q-11Vm;
	Wed, 13 Aug 2025 06:56:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755068200; x=1786604200;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2b1COblDpAIUuYejzeV5esO2WB8etW2fL7OBAJ4d5UU=;
  b=FU88SFlrOjTwOT5dnRqOAWHecRYQ59ZpvBEoUyCLRMJqzeZWIxPnhouG
   Yhcamd0LbT4UGEspFRmOmgkvumHAecHxO8nsEz55hTP9weE0RA4lLV0x1
   2HNCKTa6ck95QVhw0WK6zJEto13KS4ys2PSac8F6fGfE1tLSm5wrezV3D
   mIbqWXLFdv9/PtAmovY3N5whYipkTnm1bjcbJVZoCsEFb2iDeJhGXIsHV
   6B/36jQ32vsb2ZJhG0PCFVCfXOQ3vOvD16wQM0hYz6OgBthmszHhbv05E
   cawz5uImnd2XFOZu9imzKWB1pjUvGdg0hoLeiBmgMPO+3eXWAdj77mmvi
   Q==;
X-CSE-ConnectionGUID: HW4Q/53OR8yqxCRuvO9bog==
X-CSE-MsgGUID: VXgyK+TMShOjt1BAn/xX6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="56563438"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="56563438"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 23:56:39 -0700
X-CSE-ConnectionGUID: 4Be4PehFTYqPSTxVpOFDGg==
X-CSE-MsgGUID: W0wSj/oQRMODQtEyk6Xq7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="165616782"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 12 Aug 2025 23:56:36 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1um5PV-0009dE-0P;
	Wed, 13 Aug 2025 06:56:33 +0000
Date: Wed, 13 Aug 2025 14:56:13 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
	Peter Xu <peterx@redhat.com>, Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH] mm: Remove pud_user() from asm-generic/pgtable-nopmd.h
Message-ID: <202508131402.ZaPLdNsY-lkp@intel.com>
References: <c7f99612ecfa04054b37518df661d04f88f7c9af.1754997083.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7f99612ecfa04054b37518df661d04f88f7c9af.1754997083.git.christophe.leroy@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_235640_325950_0F83399C 
X-CRM114-Status: GOOD (  10.62  )
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

Hi Christophe,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/mm-Remove-pud_user-from-asm-generic-pgtable-nopmd-h/20250812-195212
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/c7f99612ecfa04054b37518df661d04f88f7c9af.1754997083.git.christophe.leroy%40csgroup.eu
patch subject: [PATCH] mm: Remove pud_user() from asm-generic/pgtable-nopmd.h
config: arm64-randconfig-002-20250813 (https://download.01.org/0day-ci/archive/20250813/202508131402.ZaPLdNsY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508131402.ZaPLdNsY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508131402.ZaPLdNsY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from arch/arm64/include/asm/io.h:12,
                    from include/linux/io.h:12,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from arch/arm64/include/asm/hardirq.h:17,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/trace_recursion.h:5,
                    from include/linux/ftrace.h:10,
                    from arch/arm64/kernel/asm-offsets.c:12:
   arch/arm64/include/asm/pgtable.h: In function 'pud_user_accessible_page':
>> arch/arm64/include/asm/pgtable.h:958:33: error: called object is not a function or function pointer
     958 | #define pud_user                false /* Always 0 with folding */
         |                                 ^~~~~
   arch/arm64/include/asm/pgtable.h:1307:54: note: in expansion of macro 'pud_user'
    1307 |         return pud_valid(pud) && !pud_table(pud) && (pud_user(pud) || pud_user_exec(pud));
         |                                                      ^~~~~~~~
>> arch/arm64/include/asm/pgtable.h:958:33: error: called object is not a function or function pointer
     958 | #define pud_user                false /* Always 0 with folding */
         |                                 ^~~~~
   arch/arm64/include/asm/pgtable.h:959:33: note: in expansion of macro 'pud_user'
     959 | #define pud_user_exec(pud)      pud_user(pud) /* Always 0 with folding */
         |                                 ^~~~~~~~
   arch/arm64/include/asm/pgtable.h:1307:71: note: in expansion of macro 'pud_user_exec'
    1307 |         return pud_valid(pud) && !pud_table(pud) && (pud_user(pud) || pud_user_exec(pud));
         |                                                                       ^~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:182: arch/arm64/kernel/asm-offsets.s] Error 1 shuffle=3093671401
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1281: prepare0] Error 2 shuffle=3093671401
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3093671401
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3093671401
   make: Target 'prepare' not remade because of errors.


vim +958 arch/arm64/include/asm/pgtable.h

   955	
   956	#define pud_valid(pud)		false
   957	#define pud_page_paddr(pud)	({ BUILD_BUG(); 0; })
 > 958	#define pud_user		false /* Always 0 with folding */
   959	#define pud_user_exec(pud)	pud_user(pud) /* Always 0 with folding */
   960	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

