Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4292C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 19:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Poz3I487RB9O4jwIRoBAfXWckv1ynhEdVwenmAkjsNo=; b=4ppFVNvSb4/KxB1unaKKb4IqHc
	D0aBWSmaG/LjWxhOP1c58LuQiSKHQl7t03ts3KrW2OiQRf8kyhu85OMlIjgFxStaBMvlYXAbjmulj
	8KO/q05xvlbfn5/FAcI7p3Eadil3CzBt5CCp97Z0pxe1mpX+w5NI/Bg+nBn3O+qwE9+H2/NlibpIc
	usun4PigNkPH0K9k/kDS4bqLsPYg0crVswagaPFgXHJ3QO5YCyZcbmxSV0Qb2gyAWc6zf9xDXdIMo
	aYSOHc0EPj4TBr23UscyZrg2Vw/rU/W5kC4REj7us7B9joF+MDc/ZVdMjpeV6jt9wuQNLnRidEb1V
	X2ZZOi5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toS7d-0000000EnxM-3FXZ;
	Sat, 01 Mar 2025 19:03:37 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toS64-0000000EnlH-2W2i
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 19:02:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740855720; x=1772391720;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lMXy4Mm5N4WPWxUEKOlhMHEGyxhNvffspeCsLxw9/Ns=;
  b=HJn5bWUIaY8A9BFxaX4bxP9u9rMVbTEWuauV9Esfw+vwsBJNYYlCfpwi
   LgRzZiJ6LHie6ZrtFnog73v6Bc+DbQda26cjtgREqa7AS6HnHLWd3+Puo
   f8Af7wSYYBKjDXsARD8ddmSHLMH10ZPtoct3l0ei98zRPno2GDSmsnQLu
   eqFmy9j5SYhXcSgBS/yB0AluseXde9EXOnpYsaoJhGz+OUv57pEYFf43p
   fSCRVodqEdPXiBdsJJ2R4HaH5cCmZwjRXGmK3D07L1sOt+dr3HVCrlQy1
   viXFHbcJ4SGAkhtSfJlktJrWDOvWTcGvvFbBKH3RhVlPldzuBZrNiyulH
   A==;
X-CSE-ConnectionGUID: EUt8kFYDR0WDye6eqDiHfA==
X-CSE-MsgGUID: X0y5zH62QD2u9MEjGKeqQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="53154318"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="53154318"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 11:01:59 -0800
X-CSE-ConnectionGUID: slerZluNR+aP4+ASjjT6qQ==
X-CSE-MsgGUID: apmxOb0fT/OkQwTYM9ch9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="117409863"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 01 Mar 2025 11:01:54 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toS5L-000Gak-2N;
	Sat, 01 Mar 2025 19:01:20 +0000
Date: Sun, 2 Mar 2025 03:00:19 +0800
From: kernel test robot <lkp@intel.com>
To: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Boqun Feng <boqun.feng@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"(maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT))" <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>,
	Juergen Christ <jchrist@linux.ibm.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	"(moderated list:ARM64 PORT (AARCH64 ARCHITECTURE))" <linux-arm-kernel@lists.infradead.org>,
	linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v9 2/9] preempt: Introduce __preempt_count_{sub,
 add}_return()
Message-ID: <202503020203.USVBw4Bn-lkp@intel.com>
References: <20250227221924.265259-3-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227221924.265259-3-lyude@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_110200_703644_911BA58E 
X-CRM114-Status: GOOD (  12.85  )
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

Hi Lyude,

kernel test robot noticed the following build errors:

[auto build test ERROR on 2014c95afecee3e76ca4a56956a936e23283f05b]

url:    https://github.com/intel-lab-lkp/linux/commits/Lyude-Paul/preempt-Introduce-HARDIRQ_DISABLE_BITS/20250228-062508
base:   2014c95afecee3e76ca4a56956a936e23283f05b
patch link:    https://lore.kernel.org/r/20250227221924.265259-3-lyude%40redhat.com
patch subject: [PATCH v9 2/9] preempt: Introduce __preempt_count_{sub, add}_return()
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250302/202503020203.USVBw4Bn-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503020203.USVBw4Bn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020203.USVBw4Bn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/preempt.h:85,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/percpu.h:5,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/kvm_host.h:7,
                    from arch/s390/kernel/asm-offsets.c:11:
   arch/s390/include/asm/preempt.h: In function '__preempt_count_add_return':
>> arch/s390/include/asm/preempt.h:109:38: error: void value not ignored as it ought to be
     109 |                         return val + __atomic_add_const(val, &get_lowcore()->preempt_count);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:102: arch/s390/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1264: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +109 arch/s390/include/asm/preempt.h

   100	
   101	static __always_inline int __preempt_count_add_return(int val)
   102	{
   103		/*
   104		 * With some obscure config options and CONFIG_PROFILE_ALL_BRANCHES
   105		 * enabled, gcc 12 fails to handle __builtin_constant_p().
   106		 */
   107		if (!IS_ENABLED(CONFIG_PROFILE_ALL_BRANCHES)) {
   108			if (__builtin_constant_p(val) && (val >= -128) && (val <= 127)) {
 > 109				return val + __atomic_add_const(val, &get_lowcore()->preempt_count);
   110			}
   111		}
   112		return val + __atomic_add(val, &get_lowcore()->preempt_count);
   113	}
   114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

