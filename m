Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6940CFC29A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 19:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/O9Eii6dat9eCp/ibDvYWvyJXa+g5foPa3ruMXQLMzo=; b=0Wi0yoVTv+D1cdx8JeeuZ7TUia
	A3HzhPOgEeUlBvhXk5W+p1SPkmXtpuoO+Kvj/+XzT0Q/4wf2+jTO6RW+mQLBglKvUcFxWK8QJ0rDu
	GohyAQ7GMz00GEslabGYbdkRpAbrsM3nBTLNauh8A3zgyLqCLvhMf9pMcbpNTqcpytd/2s77MJxN6
	cOEsdlDD8zJDb9caQp5sUR4dqfVNhTDBItuH7fHB95mD8bTwEkfk3Far1lUtl6qEthfxbWX1udG65
	Y4ssAxGGDhkvXmRbNP/SbkSfoUspgDkP5qvNRnLaLgQCGArOkqaEN/RsJo3wkJSHB2EJHnGdwb3j5
	AK5lpHtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMWad-00000008tE0-10s1;
	Fri, 21 Nov 2025 19:14:39 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMWaa-00000008tDZ-2Ril
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 19:14:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763752477; x=1795288477;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fGWNibXFUGAhDYfqhQTSp+K9Mm1aNTTr8crCL6BSz6s=;
  b=CKqEaJ7m+Util47zKTvqYfABDTgN/de324F/q1iCwMtB4ONat0RZwmjN
   EDLkH5cIibuWVmwiDS7PdhNOvpY0qM5Nw8LumH3u0YUCy5qqsNTQ6dMHx
   bmFvRHCRxJGXZ7kVhasbzdVvzz0pJl/Fd2PjFKxBRgc7lAyWmPnDUdgz5
   +iSi0pqQsiCbovnUbGiYLqlxLzdDnfpjhKNIM4f+8NqkOIhFo6k6GgvPI
   8b8fwO64SlPvlPPzB6WCTPCJW/CMrxMuDFCdMg8wynmpMGhx5m/Vzqd8H
   jBrF0/LZLSUUTYZo/BgJPeSpzSrRo+kFOypUJyQuEkzU3BzGdbSkFePVx
   Q==;
X-CSE-ConnectionGUID: LAd54eEFRMOVYIroOtNtng==
X-CSE-MsgGUID: LXp/gEAiTrqnL/hHdin8lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="68455003"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="68455003"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 11:14:35 -0800
X-CSE-ConnectionGUID: 2Ijzr5YBT3aA7bLtsNb2Hw==
X-CSE-MsgGUID: PUXp5Oq0QOCwVdGLd9G5ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="195936493"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Nov 2025 11:14:28 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMWaP-0006m3-1U;
	Fri, 21 Nov 2025 19:14:25 +0000
Date: Sat, 22 Nov 2025 03:13:48 +0800
From: kernel test robot <lkp@intel.com>
To: Eugen Hristev <eugen.hristev@linaro.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	tglx@linutronix.de, andersson@kernel.org, pmladek@suse.com,
	rdunlap@infradead.org, corbet@lwn.net, david@redhat.com,
	mhocko@suse.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org, jonechou@google.com,
	rostedt@goodmis.org, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org, tony.luck@intel.com, kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: Re: [PATCH 03/26] mm/percpu: Annotate static information into
 meminspect
Message-ID: <202511220241.7y7acdEZ-lkp@intel.com>
References: <20251119154427.1033475-4-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119154427.1033475-4-eugen.hristev@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_111436_684669_CBDD43C2 
X-CRM114-Status: GOOD (  11.76  )
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

Hi Eugen,

kernel test robot noticed the following build errors:

[auto build test ERROR on rppt-memblock/fixes]
[also build test ERROR on linus/master v6.18-rc6]
[cannot apply to akpm-mm/mm-everything rppt-memblock/for-next next-20251121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eugen-Hristev/kernel-Introduce-meminspect/20251119-235912
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git fixes
patch link:    https://lore.kernel.org/r/20251119154427.1033475-4-eugen.hristev%40linaro.org
patch subject: [PATCH 03/26] mm/percpu: Annotate static information into meminspect
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20251122/202511220241.7y7acdEZ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511220241.7y7acdEZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511220241.7y7acdEZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/percpu.c:3350:25: error: use of undeclared identifier '__per_cpu_offset'; did you mean '__per_cpu_start'?
    3350 | MEMINSPECT_SIMPLE_ENTRY(__per_cpu_offset);
         |                         ^~~~~~~~~~~~~~~~
         |                         __per_cpu_start
   include/linux/meminspect.h:101:40: note: expanded from macro 'MEMINSPECT_SIMPLE_ENTRY'
     101 |         MEMINSPECT_ENTRY(MEMINSPECT_ID_##sym, sym, sizeof(sym))
         |                                               ^~~
   include/linux/meminspect.h:92:29: note: expanded from macro 'MEMINSPECT_ENTRY'
      92 |                                                .va = (void *)&(sym),            \
         |                                                                ^~~
   include/asm-generic/sections.h:42:13: note: '__per_cpu_start' declared here
      42 | extern char __per_cpu_start[], __per_cpu_end[];
         |             ^
>> mm/percpu.c:3350:25: error: use of undeclared identifier '__per_cpu_offset'; did you mean '__per_cpu_start'?
    3350 | MEMINSPECT_SIMPLE_ENTRY(__per_cpu_offset);
         |                         ^~~~~~~~~~~~~~~~
         |                         __per_cpu_start
   include/linux/meminspect.h:101:52: note: expanded from macro 'MEMINSPECT_SIMPLE_ENTRY'
     101 |         MEMINSPECT_ENTRY(MEMINSPECT_ID_##sym, sym, sizeof(sym))
         |                                                           ^~~
   include/linux/meminspect.h:93:22: note: expanded from macro 'MEMINSPECT_ENTRY'
      93 |                                                .size = (sz),                    \
         |                                                         ^~
   include/asm-generic/sections.h:42:13: note: '__per_cpu_start' declared here
      42 | extern char __per_cpu_start[], __per_cpu_end[];
         |             ^
>> mm/percpu.c:3350:1: error: invalid application of 'sizeof' to an incomplete type 'char[]'
    3350 | MEMINSPECT_SIMPLE_ENTRY(__per_cpu_offset);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/meminspect.h:101:51: note: expanded from macro 'MEMINSPECT_SIMPLE_ENTRY'
     101 |         MEMINSPECT_ENTRY(MEMINSPECT_ID_##sym, sym, sizeof(sym))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/linux/meminspect.h:93:22: note: expanded from macro 'MEMINSPECT_ENTRY'
      93 |                                                .size = (sz),                    \
         |                                                         ^~
   3 errors generated.


vim +3350 mm/percpu.c

  3349	
> 3350	MEMINSPECT_SIMPLE_ENTRY(__per_cpu_offset);
  3351	/*
  3352	 * pcpu_nr_pages - calculate total number of populated backing pages
  3353	 *
  3354	 * This reflects the number of pages populated to back chunks.  Metadata is
  3355	 * excluded in the number exposed in meminfo as the number of backing pages
  3356	 * scales with the number of cpus and can quickly outweigh the memory used for
  3357	 * metadata.  It also keeps this calculation nice and simple.
  3358	 *
  3359	 * RETURNS:
  3360	 * Total number of populated backing pages in use by the allocator.
  3361	 */
  3362	unsigned long pcpu_nr_pages(void)
  3363	{
  3364		return data_race(READ_ONCE(pcpu_nr_populated)) * pcpu_nr_units;
  3365	}
  3366	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

