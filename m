Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1714BC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 21:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fdNYUN2NKYN/Z1c6wkVpv11hDVgUadb9eUS5kEIFV7Q=; b=noG6eO8sQk/bVKPXv9blNztAK8
	tmA25pb/H+NDZYwgBRRNp7WjKEdT6550xtEBzarUXMGQBhnpCkNoUC+DRQIz+L2UaZ6Nh+jUl2HV+
	shqfAsrWLyMpaZBIGNoRCkazA8Bgp1bHM1QbaGFKFu+KFYs9QxNLLmnovrS2ctjgwpHh2OS4C7EO5
	ovwgGOqkXGpwKI6jeZVP9bR6jDB70PRQdfGIWUYMYOxh737i1LCm2Y55j1MDLyRgYEKrZOLe9bK8A
	aPZCoGmtgsV89EzEIUrtyKe9c8ekRFTkRTTso52sHA2OY80nPZNpbrFx7Z0RoPRTTQkBqZsUvgHX0
	RHxtHXjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws5zz-00000006kxc-1pQh;
	Thu, 06 Aug 2026 21:51:35 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws5zw-00000006kxE-2cMO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 21:51:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786053093; x=1817589093;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7YXZzO7rHKj6qKOZ2jDkYVaRVikc1Wt8k9LrXwdPOkI=;
  b=STrjp17ZrWDDfBkq6sC6Z3ueXIF2jXJWW7OIEK375PjXAX9+Kg0x881B
   B/tFAsOhA40Z0lvuWVffvaQAEljKw7HYMqX/u7KP0ur9dOv6jJC6wRO0d
   DHJUEQxewFwF/3wcMAPvZ3ix9baxvlK4Vk9YNc++PpXraV3YglmGArkoC
   iKmr4WFz3XinofM9bF2IfWwapjytMYTSBBTRaGoHF485ODLSJ+83P9WYi
   TWw13K4aqwMmD5m4HxjNkjtU44HLV1zYQPtySd2JSudd5Gj+2p4RPZQKS
   mpPou75Nx/vjJJkTUg/wpXIUtZopZQJCa9y9NqB10rFxJ7pc54PduokLY
   g==;
X-CSE-ConnectionGUID: 5HgRR0sPSIOmI1fbZ2SQig==
X-CSE-MsgGUID: obO1qUzOQ966pcRwDJf90w==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="109453873"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="109453873"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 14:51:32 -0700
X-CSE-ConnectionGUID: AB8YyTXOSCSKko1pPJhpvA==
X-CSE-MsgGUID: gfPYtjsYTwuf1P+pMEQQWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="285586569"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Aug 2026 14:51:25 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ws5zl-00000000GKf-1GLg;
	Thu, 06 Aug 2026 21:51:21 +0000
Date: Fri, 7 Aug 2026 05:50:26 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Elfring <Markus.Elfring@web.de>, acpica-devel@lists.linux.dev,
	bpf@vger.kernel.org, coresight@lists.linaro.org,
	kvm@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
	linux-perf-users@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	mptcp@lists.linux.dev, netdev@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, virtualization@lists.linux.dev,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alex Mastro <amastro@fb.com>, Alex Williamson <alex@shazbot.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andi Kleen <ak@linux.intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH] tools: Use fputc() calls in some functions
Message-ID: <202608070547.MRKfa3bH-lkp@intel.com>
References: <48f2d61f-d468-49b7-881e-f00777db073f@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48f2d61f-d468-49b7-881e-f00777db073f@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_145132_709634_835905A7 
X-CRM114-Status: GOOD (  13.66  )
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

Hi Markus,

kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on tip/perf/core perf-tools/perf-tools linus/master v7.2-rc6 next-20260806]
[cannot apply to acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Elfring/tools-Use-fputc-calls-in-some-functions/20260806-165154
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/48f2d61f-d468-49b7-881e-f00777db073f%40web.de
patch subject: [PATCH] tools: Use fputc() calls in some functions
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260807/202608070547.MRKfa3bH-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260807/202608070547.MRKfa3bH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608070547.MRKfa3bH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> builtin-check.c:300:8: error: incompatible pointer to integer conversion passing 'FILE *' (aka 'struct _IO_FILE *') to parameter of type 'int' [-Wint-conversion]
     300 |         fputc(stderr, '\n');
         |               ^~~~~~
   /usr/include/stdio.h:155:16: note: expanded from macro 'stderr'
     155 | #define stderr stderr
         |                ^~~~~~
   /usr/include/stdio.h:611:23: note: passing argument to parameter '__c' here
     611 | extern int fputc (int __c, FILE *__stream) __nonnull ((2));
         |                       ^
>> builtin-check.c:300:16: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'FILE *' (aka 'struct _IO_FILE *') [-Wint-conversion]
     300 |         fputc(stderr, '\n');
         |                       ^~~~
   /usr/include/stdio.h:611:34: note: passing argument to parameter '__stream' here
     611 | extern int fputc (int __c, FILE *__stream) __nonnull ((2));
         |                                  ^
   2 errors generated.
>> disas.c:540:9: error: incompatible pointer to integer conversion passing 'FILE *' (aka 'struct _IO_FILE *') to parameter of type 'int' [-Wint-conversion]
     540 |                 fputc(stream, '\n');
         |                       ^~~~~~
   /usr/include/stdio.h:611:23: note: passing argument to parameter '__c' here
     611 | extern int fputc (int __c, FILE *__stream) __nonnull ((2));
         |                       ^
>> disas.c:540:17: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'FILE *' (aka 'struct _IO_FILE *') [-Wint-conversion]
     540 |                 fputc(stream, '\n');
         |                               ^~~~
   /usr/include/stdio.h:611:34: note: passing argument to parameter '__stream' here
     611 | extern int fputc (int __c, FILE *__stream) __nonnull ((2));
         |                                  ^
   make[5]: *** [tools/build/Makefile.build:96: tools/objtool/builtin-check.o] Error 1
   2 errors generated.
   make[5]: *** [tools/build/Makefile.build:95: tools/objtool/disas.o] Error 1
   make[5]: Target '__build' not remade because of errors.
   make[4]: *** [Makefile:123: tools/objtool/objtool-in.o] Error 2
   make[4]: Target 'all' not remade because of errors.
   make[3]: *** [Makefile:74: objtool] Error 2
   make[2]: *** [Makefile:1587: tools/objtool] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

