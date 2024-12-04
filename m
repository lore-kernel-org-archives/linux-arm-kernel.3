Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F142E7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 06:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b2g79HuuWiMt0/kmfp2RR9OMrDyXPkvh7oo2jMXfuB8=; b=tOTiLIDaKX6Xp2WpHs9QfMRy+U
	6rCMPCZ378yIep/eKG8m70c0R72IrSeVy97Dc7SedT5gy59HRL5dRCehpjoA6vfzcdHtgyA5VkCby
	YfYiRJa1BOZQf7JwvEnpbBMuXgSy69vDt2Nj8TokicwIn+TGcdQ6qC5txKQIRQeVNuBgdxLiQl63E
	8VlBp+9fpvb2rBwkAl6MR7cl9+Lu/luQQWD3qUsOoFP5l++tTeArqVdFVTnHCyiznoNSAKrkrlEl5
	sgkUE24haJdFBGj5iX3HHptbCkm2HhFiAbhHsxV77fW1GLtGTyKRf2TbB+FeVcCQOfzRqoHQBGHmv
	GHPs85qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIj7R-0000000BdJv-2Rdl;
	Wed, 04 Dec 2024 06:44:17 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIj6Q-0000000BdEC-2SdF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 06:43:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733294594; x=1764830594;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fqqG73XwFCvTGJ4c82NLgng5ayihNxg9MWkqhGyy1Zs=;
  b=NrjcRDsFPw6QkyTbeTv+p8m75waKtKoIMpsM/gNqsVYr5omLYFNdWvLq
   vjX2d7ttZbt/8ZCnAPUikDiIk2zMHEutb/99vdv4E6h+USiqWsTkHUbm9
   j8m1BPwqHoMHIoFUT6FL7/jU1y6HPrUVcZb8rJufiJ1TqvYD4vfTZgMjb
   MNXOQXCrwpyDwfzI4Lm82LGwpo4LUVCpZvlFg2ffxhYm3pL65g/mseF7k
   98RAskDRi2wiowdINj5Xn9s8+pwaeYPuILmssuRASTB0zDF8VS5D5TNaa
   /IGYM5NYgNTOntkTQyPwEymGBFrtE1AL6N0vxAH/CsP1WWaiVJhNgnpsI
   Q==;
X-CSE-ConnectionGUID: NDBEm9vlQryZ0k/E3Uwiew==
X-CSE-MsgGUID: BwH0TkFAQjOTF1Y03OGl8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="32885432"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="32885432"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 22:43:11 -0800
X-CSE-ConnectionGUID: q1NPSO0gS4mdcusKJ0rY6w==
X-CSE-MsgGUID: noI9eRa3S9WhlfU0186WDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="124602675"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 03 Dec 2024 22:43:08 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIj6H-0002fp-1C;
	Wed, 04 Dec 2024 06:43:05 +0000
Date: Wed, 4 Dec 2024 14:42:17 +0800
From: kernel test robot <lkp@intel.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>, suzuki.poulose@arm.com,
	mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, bigeasy@linutronix.de,
	clrkwllms@kernel.org, rostedt@goodmis.org
Cc: oe-kbuild-all@lists.linux.dev, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, nd@arm.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: Re: [PATCH v2 2/9] coresight-etm4x: change etmv4_drvdata spinlock
 type to raw_spinlock_t
Message-ID: <202412041452.KCrCJWWm-lkp@intel.com>
References: <20241203114942.697188-3-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203114942.697188-3-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_224314_641997_E7720F1F 
X-CRM114-Status: GOOD (  13.65  )
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

Hi Yeoreum,

kernel test robot noticed the following build errors:

[auto build test ERROR on soc/for-next]
[also build test ERROR on linus/master v6.13-rc1 next-20241128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yeoreum-Yun/coresight-change-coresight_device-lock-type-to-raw_spinlock_t/20241203-203214
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20241203114942.697188-3-yeoreum.yun%40arm.com
patch subject: [PATCH v2 2/9] coresight-etm4x: change etmv4_drvdata spinlock type to raw_spinlock_t
config: arm64-randconfig-001-20241204 (https://download.01.org/0day-ci/archive/20241204/202412041452.KCrCJWWm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041452.KCrCJWWm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412041452.KCrCJWWm-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwtracing/coresight/coresight-etm4x-core.c: In function 'etm4_starting_cpu':
>> drivers/hwtracing/coresight/coresight-etm4x-core.c:1666:19: error: passing argument 1 of 'spin_lock' from incompatible pointer type [-Wincompatible-pointer-types]
    1666 |         spin_lock(&etmdrvdata[cpu]->spinlock);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                   |
         |                   raw_spinlock_t * {aka struct raw_spinlock *}
   In file included from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from drivers/hwtracing/coresight/coresight-etm4x-core.c:6:
   include/linux/spinlock.h:349:51: note: expected 'spinlock_t *' {aka 'struct spinlock *'} but argument is of type 'raw_spinlock_t *' {aka 'struct raw_spinlock *'}
     349 | static __always_inline void spin_lock(spinlock_t *lock)
         |                                       ~~~~~~~~~~~~^~~~
>> drivers/hwtracing/coresight/coresight-etm4x-core.c:1672:21: error: passing argument 1 of 'spin_unlock' from incompatible pointer type [-Wincompatible-pointer-types]
    1672 |         spin_unlock(&etmdrvdata[cpu]->spinlock);
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                     |
         |                     raw_spinlock_t * {aka struct raw_spinlock *}
   include/linux/spinlock.h:389:53: note: expected 'spinlock_t *' {aka 'struct spinlock *'} but argument is of type 'raw_spinlock_t *' {aka 'struct raw_spinlock *'}
     389 | static __always_inline void spin_unlock(spinlock_t *lock)
         |                                         ~~~~~~~~~~~~^~~~
   drivers/hwtracing/coresight/coresight-etm4x-core.c: In function 'etm4_dying_cpu':
   drivers/hwtracing/coresight/coresight-etm4x-core.c:1681:19: error: passing argument 1 of 'spin_lock' from incompatible pointer type [-Wincompatible-pointer-types]
    1681 |         spin_lock(&etmdrvdata[cpu]->spinlock);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                   |
         |                   raw_spinlock_t * {aka struct raw_spinlock *}
   include/linux/spinlock.h:349:51: note: expected 'spinlock_t *' {aka 'struct spinlock *'} but argument is of type 'raw_spinlock_t *' {aka 'struct raw_spinlock *'}
     349 | static __always_inline void spin_lock(spinlock_t *lock)
         |                                       ~~~~~~~~~~~~^~~~
   drivers/hwtracing/coresight/coresight-etm4x-core.c:1684:21: error: passing argument 1 of 'spin_unlock' from incompatible pointer type [-Wincompatible-pointer-types]
    1684 |         spin_unlock(&etmdrvdata[cpu]->spinlock);
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                     |
         |                     raw_spinlock_t * {aka struct raw_spinlock *}
   include/linux/spinlock.h:389:53: note: expected 'spinlock_t *' {aka 'struct spinlock *'} but argument is of type 'raw_spinlock_t *' {aka 'struct raw_spinlock *'}
     389 | static __always_inline void spin_unlock(spinlock_t *lock)
         |                                         ~~~~~~~~~~~~^~~~


vim +/spin_lock +1666 drivers/hwtracing/coresight/coresight-etm4x-core.c

2e1cdfe184b520 drivers/hwtracing/coresight/coresight-etm4x.c      Pratik Patel              2015-05-13  1660  
58eb457be0283d drivers/hwtracing/coresight/coresight-etm4x.c      Sebastian Andrzej Siewior 2016-07-13  1661  static int etm4_starting_cpu(unsigned int cpu)
58eb457be0283d drivers/hwtracing/coresight/coresight-etm4x.c      Sebastian Andrzej Siewior 2016-07-13  1662  {
2e1cdfe184b520 drivers/hwtracing/coresight/coresight-etm4x.c      Pratik Patel              2015-05-13  1663  	if (!etmdrvdata[cpu])
58eb457be0283d drivers/hwtracing/coresight/coresight-etm4x.c      Sebastian Andrzej Siewior 2016-07-13  1664  		return 0;
2e1cdfe184b520 drivers/hwtracing/coresight/coresight-etm4x.c      Pratik Patel              2015-05-13  1665  
2e1cdfe184b520 drivers/hwtracing/coresight/coresight-etm4x.c      Pratik Patel              2015-05-13 @1666  	spin_lock(&etmdrvdata[cpu]->spinlock);
6d7651015c16e1 drivers/hwtracing/coresight/coresight-etm4x.c      Andrew Murray             2019-08-29  1667  	if (!etmdrvdata[cpu]->os_unlock)
2e1cdfe184b520 drivers/hwtracing/coresight/coresight-etm4x.c      Pratik Patel              2015-05-13  1668  		etm4_os_unlock(etmdrvdata[cpu]);
2e1cdfe184b520 drivers/hwtracing/coresight/coresight-etm4x.c      Pratik Patel              2015-05-13  1669  
c95c2733e5feb1 drivers/hwtracing/coresight/coresight-etm4x-core.c James Clark               2024-01-29  1670  	if (coresight_get_mode(etmdrvdata[cpu]->csdev))
2e1cdfe184b520 drivers/hwtracing/coresight/coresight-etm4x.c      Pratik Patel              2015-05-13  1671  		etm4_enable_hw(etmdrvdata[cpu]);
2e1cdfe184b520 drivers/hwtracing/coresight/coresight-etm4x.c      Pratik Patel              2015-05-13 @1672  	spin_unlock(&etmdrvdata[cpu]->spinlock);
58eb457be0283d drivers/hwtracing/coresight/coresight-etm4x.c      Sebastian Andrzej Siewior 2016-07-13  1673  	return 0;
58eb457be0283d drivers/hwtracing/coresight/coresight-etm4x.c      Sebastian Andrzej Siewior 2016-07-13  1674  }
2e1cdfe184b520 drivers/hwtracing/coresight/coresight-etm4x.c      Pratik Patel              2015-05-13  1675  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

