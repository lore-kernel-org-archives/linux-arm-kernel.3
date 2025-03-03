Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6687BC282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 09:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZfxzz+F2AUS0UG3TwWk5clSiHVP4htK+tqH+TNcQ5c=; b=KOfML6K2TW9xWxNBnYO9iaST28
	bqd6AJa0wK539Don3B49/qKeOHSPF8IFzxYUUmDqscBO3eenMRf4MuqJVC9x0NUTGt4vLLUKBVqeK
	5fgOagJss01jHhS1gmY1vXiNOfda8bhH/iVqY97nRiwuC/Gokb4NTKyXlAfInXjgWrddMAqaSJMX0
	lUchGdJg0Md0LKh+5J6EcirSRMlbptpWe9KjIVFFfjW7Phe+WEcRf8kRRHAvlJ1KHVbw9Owzbawin
	QwYKXcFYaeqaB0jLIx0ts1TXKe7cw1U22IWNK1A44UCb3O9FR6KXdpK9ha2Hdamzyw2Dka+10ceYu
	FvTLwsXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1eU-000000002XO-2G8P;
	Mon, 03 Mar 2025 08:59:54 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1a7-000000000sf-37Ro
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 08:55:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740992123; x=1772528123;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qHRcyUI3/hi2BGAUKUDSudJssxHgKVCe/F4h7QO/AU8=;
  b=Z8Q6krosb4OFYC4m9CbT9f7jKBoOt5vmkVf/FXB5dW28yxnZVUhCikQi
   Zev6NjZsZCs25Khj3rsdQopaU9N0o5XoQVpZkdxqPVWWQy/qiiWObHEpe
   6rD6ystFQLM3pYXo5jBVF8o5bwHauwR0wza7/m1L+hkljtCVKk1ZsLOcn
   KGUaj91dkzOk//Wl/cYu7T5eDwDvJkUyD1ecd1kjLHXfmCWN6E3Nhq9GT
   0skWVRf3wx7T5J271mY4T/36WigsBqKcxAh6eiLL8a7QhR3ARRdch7rwI
   igG1UnvNMgczLbkaM5HKHxku8kop98Ai+puCc8+kbPfe7i1wvGqcPwQxc
   A==;
X-CSE-ConnectionGUID: d6V9eLW+SM+EcliU14Z6Rg==
X-CSE-MsgGUID: quAm90F6R8O5D9gcBowssA==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41745004"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="41745004"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 00:55:21 -0800
X-CSE-ConnectionGUID: y+w4sugQRWKpajzmYyVbLA==
X-CSE-MsgGUID: jEP1RSSlThqTB8fpBFAwUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="123095271"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 03 Mar 2025 00:55:14 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tp1Zv-000IES-2O;
	Mon, 03 Mar 2025 08:55:11 +0000
Date: Mon, 3 Mar 2025 16:55:03 +0800
From: kernel test robot <lkp@intel.com>
To: Peilin Ye <yepeilin@google.com>, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, Peilin Ye <yepeilin@google.com>,
	bpf@ietf.org, Alexei Starovoitov <ast@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	David Vernet <void@manifault.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Quentin Monnet <qmo@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Ihor Solodrai <ihor.solodrai@linux.dev>
Subject: Re: [PATCH bpf-next v4 04/10] bpf: Introduce load-acquire and
 store-release instructions
Message-ID: <202503031631.OeUhVRHz-lkp@intel.com>
References: <2c82b29f3530b961b41f94a4942e490ab35a31c8.1740978603.git.yepeilin@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c82b29f3530b961b41f94a4942e490ab35a31c8.1740978603.git.yepeilin@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_005523_801314_2D9FE164 
X-CRM114-Status: GOOD (  12.90  )
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

Hi Peilin,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Peilin-Ye/bpf-verifier-Factor-out-atomic_ptr_type_ok/20250303-134110
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/2c82b29f3530b961b41f94a4942e490ab35a31c8.1740978603.git.yepeilin%40google.com
patch subject: [PATCH bpf-next v4 04/10] bpf: Introduce load-acquire and store-release instructions
config: arc-randconfig-002-20250303 (https://download.01.org/0day-ci/archive/20250303/202503031631.OeUhVRHz-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250303/202503031631.OeUhVRHz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503031631.OeUhVRHz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   kernel/bpf/core.c: In function '___bpf_prog_run':
>> include/linux/compiler_types.h:542:45: error: call to '__compiletime_assert_459' declared with attribute error: Need native word sized stores/loads for atomicity.
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:523:25: note: in definition of macro '__compiletime_assert'
     523 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:545:9: note: in expansion of macro 'compiletime_assert'
     545 |         compiletime_assert(__native_word(t),                            \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:151:9: note: in expansion of macro 'compiletime_assert_atomic_type'
     151 |         compiletime_assert_atomic_type(*p);                             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   kernel/bpf/core.c:2222:45: note: in expansion of macro 'smp_load_acquire'
    2222 |                                 DST = (SIZE)smp_load_acquire(   \
         |                                             ^~~~~~~~~~~~~~~~
   kernel/bpf/core.c:2228:25: note: in expansion of macro 'LOAD_ACQUIRE'
    2228 |                         LOAD_ACQUIRE(DW, u64)
         |                         ^~~~~~~~~~~~
   include/linux/compiler_types.h:542:45: error: call to '__compiletime_assert_466' declared with attribute error: Need native word sized stores/loads for atomicity.
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:523:25: note: in definition of macro '__compiletime_assert'
     523 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:545:9: note: in expansion of macro 'compiletime_assert'
     545 |         compiletime_assert(__native_word(t),                            \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:141:9: note: in expansion of macro 'compiletime_assert_atomic_type'
     141 |         compiletime_assert_atomic_type(*p);                             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
     172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
         |                                                       ^~~~~~~~~~~~~~~~~~~
   kernel/bpf/core.c:2238:33: note: in expansion of macro 'smp_store_release'
    2238 |                                 smp_store_release(      \
         |                                 ^~~~~~~~~~~~~~~~~
   kernel/bpf/core.c:2244:25: note: in expansion of macro 'STORE_RELEASE'
    2244 |                         STORE_RELEASE(DW, u64)
         |                         ^~~~~~~~~~~~~


vim +/__compiletime_assert_459 +542 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  528  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  529  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  530  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  531  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  532  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  533   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  534   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  535   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  536   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  537   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  538   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  539   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  540   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  541  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @542  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  543  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

