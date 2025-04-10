Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7A3C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 11:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ee6LsVDDTHsvKI/YOpZeHH6mP+kh8OeNoQudrAcoQfA=; b=zm35gaooSQGiZBn/kN4l3KGXEk
	ha80/9ch3yHjVMj4mwkDBelFTf9AIdgBGLEuwqGiPdvEug0f0ur4gq9DA+Pqa/5Ffn4xLvPcLEBdH
	L64xqydp0tiz524NNdqTc4CQVArNA5g509RZndOun9c+uOB/3yiF5Xy/ZZAHKZWIqrVA8J1VqFwKq
	Fl5X/Faz67VWq0P+js60izD/REwea7VJsuZFUBAOp8CMiWVqRSvEiCM1E7idN2zwxFrqqirsbWVql
	Rp0hrrQXIwVBrhKeUYPsJRAuYL/xxBZ9LDRTychLz1hbr553sobTKNLCSvcGRtqWzcrA6DFxMZJM4
	SuQdAlOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ptb-0000000ACSN-2Mkb;
	Thu, 10 Apr 2025 11:16:35 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2oD4-00000009wQg-42R8;
	Thu, 10 Apr 2025 09:28:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744277315; x=1775813315;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=grsUTpdnhqvjd0Hm7iEVppv5u0om2yQPbXAfzbCduKs=;
  b=mlQDxoIhehzkUmFzOf/0/yMuiFQiCrGYUn6FCcsi1Wnov6BEcWmejwbb
   3FZbYbACsF175OprtXjItzI+PUORJP19VmIBMwKJwe5tu/NQpb6Wz5f0Q
   uAJMnaZU6Ig9FwhtLT3N4JMt8LowEhKTVfoOr4iMQFNfMMZbmtQJ8yvQF
   +6/jaYa5uKvEFHGOkfqL+FwqFXXY9UC7M4IIDSGSv14S6NrCAuittt/Ea
   OUYNpcLTYa/pHXtRmVeJj/3g/C2vV2FXtrKzX8pjsWVGfSvMDeHUTBsl3
   nEfer02PQOL9UuaiIwIjDCRjiWKDuWoduJIicu1Sx4HJvyiTFb1tgehSx
   w==;
X-CSE-ConnectionGUID: q9xwGGC1T26wbZ+a0jpgXA==
X-CSE-MsgGUID: oL+Sr9HsQzef4uUmZQj5PQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="57154701"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="57154701"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 02:28:33 -0700
X-CSE-ConnectionGUID: HTOMgKl7QMKOdgpykKC3QQ==
X-CSE-MsgGUID: aWnZQ6t4QfuhR77cbVIRBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="133968976"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Apr 2025 02:28:30 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2oCy-0009s3-03;
	Thu, 10 Apr 2025 09:28:28 +0000
Date: Thu, 10 Apr 2025 17:28:08 +0800
From: kernel test robot <lkp@intel.com>
To: yiru zhang <yiru.zhang@mediatek.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	yiru zhang <yiru.zhang@mediatek.com>
Subject: Re: [PATCH] [Patch v2]Add ETE devarch condition in
 etm4_init_iomem_access
Message-ID: <202504101759.7Ls0Uy4o-lkp@intel.com>
References: <20250409032917.7580-1-yiru.zhang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409032917.7580-1-yiru.zhang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_022835_038115_76B987A5 
X-CRM114-Status: GOOD (  11.82  )
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
[also build test WARNING on linus/master v6.15-rc1 next-20250410]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/yiru-zhang/Add-ETE-devarch-condition-in-etm4_init_iomem_access/20250409-113037
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20250409032917.7580-1-yiru.zhang%40mediatek.com
patch subject: [PATCH] [Patch v2]Add ETE devarch condition in etm4_init_iomem_access
config: arm64-randconfig-002-20250410 (https://download.01.org/0day-ci/archive/20250410/202504101759.7Ls0Uy4o-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250410/202504101759.7Ls0Uy4o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504101759.7Ls0Uy4o-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwtracing/coresight/coresight-etm4x-core.c:1144:9: warning: format specifies type 'unsigned int' but the argument has type 'unsigned long' [-Wformat]
    1143 |                 pr_warn_once("Unknown ETM architecture: %x\n",
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                         %lx
    1144 |                              devarch & ETM_DEVARCH_ID_MASK);
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:659:42: note: expanded from macro 'pr_warn_once'
     659 |         printk_once(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/printk.h:640:30: note: expanded from macro 'printk_once'
     640 |         DO_ONCE_LITE(printk, fmt, ##__VA_ARGS__)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/once_lite.h:11:32: note: expanded from macro 'DO_ONCE_LITE'
      11 |         DO_ONCE_LITE_IF(true, func, ##__VA_ARGS__)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/once_lite.h:31:9: note: expanded from macro 'DO_ONCE_LITE_IF'
      31 |                         func(__VA_ARGS__);                              \
         |                         ~~~~~^~~~~~~~~~~~
   include/linux/printk.h:501:60: note: expanded from macro 'printk'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/printk.h:473:19: note: expanded from macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +1144 drivers/hwtracing/coresight/coresight-etm4x-core.c

  1121	
  1122	static bool etm4_init_iomem_access(struct etmv4_drvdata *drvdata,
  1123					   struct csdev_access *csa)
  1124	{
  1125		u32 devarch = readl_relaxed(drvdata->base + TRCDEVARCH);
  1126	
  1127		if (!is_coresight_device(drvdata->base) || !is_devtype_cpu_trace(drvdata->base))
  1128			return false;
  1129	
  1130		/*
  1131		 * All ETMs must implement TRCDEVARCH to indicate that
  1132		 * the component is an ETMv4. Even though TRCIDR1 also
  1133		 * contains the information, it is part of the "Trace"
  1134		 * register and must be accessed with the OSLK cleared,
  1135		 * with MMIO. But we cannot touch the OSLK until we are
  1136		 * sure this is an ETM. So rely only on the TRCDEVARCH.
  1137		 */
  1138		switch (devarch & ETM_DEVARCH_ID_MASK) {
  1139		case ETM_DEVARCH_ETMv4x_ARCH:
  1140		case ETM_DEVARCH_ETE_ARCH:
  1141			break;
  1142		default:
  1143			pr_warn_once("Unknown ETM architecture: %x\n",
> 1144				     devarch & ETM_DEVARCH_ID_MASK);
  1145			return false;
  1146		}
  1147		drvdata->arch = etm_devarch_to_arch(devarch);
  1148		*csa = CSDEV_ACCESS_IOMEM(drvdata->base);
  1149		return true;
  1150	}
  1151	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

