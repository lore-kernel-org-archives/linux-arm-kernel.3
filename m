Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1AE7CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 20:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PdtW1becQz7imrRsMFHLMWulynwYa1UeOsHgq3oAlsw=; b=tldjRv6YqaaJdfrv8G3a7YzG3J
	exwA+3hp8vr05YSyqdrv6aVXy3MgOgG2h4t6tALA6LIrfifxDL5lvjv6OhFIn+3k217eIigBuijxd
	+yajj7vb2URPCJg86H2jnabSKmb1i2GOu1LU3xXqkHgRokVjp/RZkVmi+f4U4qS/41o8GjV6zBUje
	huYS9XEaHiCYG9BVH4yOd+/nxLp6jSggeilxDMJORKG2cIg4x/r3Mzv3RYxxeeZ9umBld1kgJBK8n
	Rqp5yD/5fl5iU9hsIihSN0h6oAAgndeDojDn10Vgy204pU2cM6lr2UKDpyz95Wc6zbWMv5u9kXqfY
	WdJw1WVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXPzu-00000008MK8-1L8I;
	Wed, 10 Jun 2026 20:58:02 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXPzq-00000008MJV-1e6s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 20:58:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781125079; x=1812661079;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q6FiXZY/j5YuhQLvlVa3VnejylmiONQ3vGkSHgpj0Ws=;
  b=cshvOao6xvH2daQmEP+xt4o7+flOFwjwfGK+4HrFZZpaMsRWyUHEEWYJ
   RgC7oRzfpF5C9ORDVo3vqlVRnqLTyV8qEvuVAReru7Nlsi9ZSyd1oVtjn
   02X5LZl3bZWaRwC3W4djiiP6V1/FkfzsQc/7o3jdfMY4W/gUj77+WxQ6e
   BvfIj+SmygZ0dd7cI6v/0QgnRGc07Ht8kDxQmLQxOTUgdjLMJKPUfMo5z
   ttxLOSqkPPpbHVIBu28QmeKrdXdwOP+/0K2+5xEUwbunVqXB9dk+So7Fm
   SwD/3xyI0EvPgkp8ck39gwTaoZmIfHgzI4jVlysmRBS60KV6+l/tr9AGM
   Q==;
X-CSE-ConnectionGUID: Eikz/ZEJSF+dMy61tT7LwA==
X-CSE-MsgGUID: SGtAf9JERH211OIfLZEKFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81670630"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81670630"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 13:57:58 -0700
X-CSE-ConnectionGUID: ScDz+liFRbC+coxUyRfGPQ==
X-CSE-MsgGUID: 2+hJQl8DQsy+iBkrZXj0vA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jun 2026 13:57:53 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXPzi-00000000LuA-0tiY;
	Wed, 10 Jun 2026 20:57:50 +0000
Date: Thu, 11 Jun 2026 04:57:20 +0800
From: kernel test robot <lkp@intel.com>
To: sk@gentwo.org, linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Hildenbrand <david@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Mike Rapoport <rppt@kernel.org>, Dev Jain <dev.jain@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	cl@gentwo.org, Sayali Kulkarni <sskulkarni@amperecomputing.com>
Subject: Re: [PATCH 2/2] arm64: tlbflush: Reset active_cpu on ASID rollover
Message-ID: <202606110405.ytZbcvhH-lkp@intel.com>
References: <20260609213615.2788698-3-sk@gentwo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609213615.2788698-3-sk@gentwo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_135758_481560_B0A5707F 
X-CRM114-Status: GOOD (  10.35  )
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

Hi Ryan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on kvmarm/next soc/for-next linus/master v7.1-rc7 next-20260609]
[cannot apply to arm/for-next arm/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/sk-gentwo-org/arm64-tlbflush-Reset-active_cpu-on-ASID-rollover/20260610-063444
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20260609213615.2788698-3-sk%40gentwo.org
patch subject: [PATCH 2/2] arm64: tlbflush: Reset active_cpu on ASID rollover
config: arm64-randconfig-r132-20260610 (https://download.01.org/0day-ci/archive/20260611/202606110405.ytZbcvhH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606110405.ytZbcvhH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606110405.ytZbcvhH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/mm/context.c: note: in included file (through arch/arm64/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/atomic.h, ...):
>> arch/arm64/include/asm/cmpxchg.h:169:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
>> arch/arm64/include/asm/cmpxchg.h:169:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)

vim +169 arch/arm64/include/asm/cmpxchg.h

10b663aef1c2479 Catalin Marinas 2012-03-05  168  
305d454aaa292be Will Deacon     2015-10-08 @169  __CMPXCHG_GEN()
305d454aaa292be Will Deacon     2015-10-08  170  __CMPXCHG_GEN(_acq)
305d454aaa292be Will Deacon     2015-10-08  171  __CMPXCHG_GEN(_rel)
305d454aaa292be Will Deacon     2015-10-08  172  __CMPXCHG_GEN(_mb)
10b663aef1c2479 Catalin Marinas 2012-03-05  173  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

