Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61166C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 08:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cflsv8YST2MBm+umVa9HQ/h7bkXIY0JRE6FjMXf9GMU=; b=h4BuX8ZFyGFxVXbwx/AyzlFKRL
	6G0QxdUMRMUMKiqyRFdTZ+8g9UGv0zvwoYl5uMZ94LHCzOnfYuaEDEc58nh2OfNP416gLKOscWiEw
	xAqnJ1OCLX1oGbcujIgFiH4xmNrS0x9VmRZCigtlOetiJSjVsSqq9n9enWz/VZw41geBPmPtzO6S7
	U0hi7/GRiVial+BNwlCoacwOla942opIl6JIGGD/Y8ZNi80nNw71m32t+X5Y3ft77rxMqDCTW9BYo
	BMRPQ0zZAlfDTPahd9vd1ANi2MYsjt9UCOt9AghjWxRSfVo5lVLlrTqSsYAFl5rFt/R91IuZnkAAX
	TXeVjdaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mtT-00000009fEY-2Rbl;
	Thu, 10 Apr 2025 08:04:15 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mIk-00000009XrH-4AGM;
	Thu, 10 Apr 2025 07:26:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744269979; x=1775805979;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0xlIXYUBUvG3wGtvpTNW3LrzwtVDKeMirqEaW1TlAFo=;
  b=bKP24ngFUfnGOr3EEnRLbsR3PbcwEdneUeFz0u2qHfHf0ZWhJhjbaRuI
   3h3uw3EsDIthbElVJDpO6KgsFzJTy2cPFdTWfJqN0Gvsw2bKdzcuO5Fyv
   yNafTZCgKVyBkGU83VO6SXaVzvkgsb5MJz5xQy7KrfZ4Cv/QS2TKo+gxs
   PqAG+Mwogx/+HiaNS92T0lj2urrnwOgtvZAHTNyCH7buc08Q3yf8fQ7DF
   lFjaYgGK1f/i0Dec6HDFLXj7ANGJiri8K+uvDYJsslP/LnBpKRrGhogsJ
   GrWUqyCwiSl97/opcs6jIVlbjl+X2caRUxxt4Tuqx9gkLbJTq7toIpHnT
   w==;
X-CSE-ConnectionGUID: UImCYqGmSkO9y97LQrPgoA==
X-CSE-MsgGUID: qXxnyJgbQAOquFfZrqUlTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45866233"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="45866233"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 00:26:18 -0700
X-CSE-ConnectionGUID: 1/99+IAFTrGcGsjkrZjS/w==
X-CSE-MsgGUID: r5Dfg6khRFazoUjhz2nKwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="133683537"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Apr 2025 00:26:14 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2mIe-0009lV-2c;
	Thu, 10 Apr 2025 07:26:12 +0000
Date: Thu, 10 Apr 2025 15:25:13 +0800
From: kernel test robot <lkp@intel.com>
To: yiru zhang <yiru.zhang@mediatek.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yiru zhang <yiru.zhang@mediatek.com>
Subject: Re: [PATCH] [Patch v2]Add ETE devarch condition in
 etm4_init_iomem_access
Message-ID: <202504101502.T3kUYupS-lkp@intel.com>
References: <20250409032917.7580-1-yiru.zhang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409032917.7580-1-yiru.zhang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_002619_180940_A20FFEAF 
X-CRM114-Status: GOOD (  11.66  )
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

Hi yiru,

kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[also build test WARNING on linus/master v6.15-rc1 next-20250409]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/yiru-zhang/Add-ETE-devarch-condition-in-etm4_init_iomem_access/20250409-113037
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20250409032917.7580-1-yiru.zhang%40mediatek.com
patch subject: [PATCH] [Patch v2]Add ETE devarch condition in etm4_init_iomem_access
config: arm64-randconfig-004-20250410 (https://download.01.org/0day-ci/archive/20250410/202504101502.T3kUYupS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250410/202504101502.T3kUYupS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504101502.T3kUYupS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from arch/arm64/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from drivers/hwtracing/coresight/coresight-etm4x-core.c:6:
   drivers/hwtracing/coresight/coresight-etm4x-core.c: In function 'etm4_init_iomem_access':
>> include/linux/kern_levels.h:5:18: warning: format '%x' expects argument of type 'unsigned int', but argument 2 has type 'long unsigned int' [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^~~~~~
   include/linux/printk.h:473:11: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
              ^~~~
   include/linux/once_lite.h:31:4: note: in expansion of macro 'printk'
       func(__VA_ARGS__);    \
       ^~~~
   include/linux/once_lite.h:11:2: note: in expansion of macro 'DO_ONCE_LITE_IF'
     DO_ONCE_LITE_IF(true, func, ##__VA_ARGS__)
     ^~~~~~~~~~~~~~~
   include/linux/printk.h:640:2: note: in expansion of macro 'DO_ONCE_LITE'
     DO_ONCE_LITE(printk, fmt, ##__VA_ARGS__)
     ^~~~~~~~~~~~
   include/linux/printk.h:659:2: note: in expansion of macro 'printk_once'
     printk_once(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~~~~~~
   include/linux/kern_levels.h:12:22: note: in expansion of macro 'KERN_SOH'
    #define KERN_WARNING KERN_SOH "4" /* warning conditions */
                         ^~~~~~~~
   include/linux/printk.h:659:14: note: in expansion of macro 'KERN_WARNING'
     printk_once(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                 ^~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-etm4x-core.c:1143:3: note: in expansion of macro 'pr_warn_once'
      pr_warn_once("Unknown ETM architecture: %x\n",
      ^~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-etm4x-core.c:1143:44: note: format string is defined here
      pr_warn_once("Unknown ETM architecture: %x\n",
                                              ~^
                                              %lx


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

