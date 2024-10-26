Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2D9D10BF5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 10:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ur879XE0CeHzIas577fOrhfkZr1ILc6LuztLaObrtqI=; b=X24+vL3jANnLQQDu0nDVep5kEE
	W9fcWyscvHbsPx1hs82Kv3S+HUgjE95QFUAtiIk2PNrJsByrtLjUwL+t84bEsZTqxiZxYr82cDTaM
	wCx2g67leK8bvlwl6jUf9aD7XBNfTiU2Rw5njbru2sPYL8qgDQ0xCtg1d7d4rHLLtcTl7UAHXYDHB
	KBzGw5Uc1LqgdBC+pQl99F3S7abHuYD6/gxEjeX8oETSkTIEsNzhpFjhUH8l19Z1CoIgo9haUuUiU
	TOyEy2uT8ZgPnPcIfyzrvwv6+kJBHbJQ8lcqTfMUvov2oa8vTle2g7yUtY8ZlFshB72U/NmBx0NG6
	9XE4qtcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4dd3-00000006Kgb-2gpe;
	Sat, 26 Oct 2024 10:02:41 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4dbS-00000006KWp-31ln
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Oct 2024 10:01:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729936862; x=1761472862;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mIO9fjYoPv61naCUwAwP4LP9ukzdvV7EzEpcI1LlGIo=;
  b=XfEqWnEzilRUla5Fnko6aZ6fgWosZi62TVpsu0Y1erzSc/v73fj1HGd8
   kdq8h0l5e8xRv8G4+5bxkMG0wx/V0E+H0fsRToWAeYApyE7UHaq2nDzuE
   Bpsn5LlWIfde6Zlcdf8avKZOEwihOmtEr7cyZaA0lHtQza8694AJH7ufZ
   UvZ9ElfNW6SAS02qAluS71AckNDK0rIWCpLO9VM9J8T3Vch3LFNWQgTYH
   BeFmcagsHXkzR+dO1cr4HmUowEYm2KEBsle6rmWYMiOqkof+GnV3vqc6f
   48rTxBTUtIFfhMhl2geX4BL1v41RnurmDjSJZwdOSol3/OJQ26xQcVge/
   A==;
X-CSE-ConnectionGUID: eim3m75oTB+6P8wBynposg==
X-CSE-MsgGUID: lm3x4eTASQWSaxpD6Hyf1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40703401"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40703401"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 03:00:59 -0700
X-CSE-ConnectionGUID: k7HnwS/mTAC6GDASBmoYfA==
X-CSE-MsgGUID: /3zSxkewT5SxS9d0jIDcxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,234,1725346800"; 
   d="scan'208";a="81314648"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 26 Oct 2024 03:00:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4dbJ-000ZUa-2l;
	Sat, 26 Oct 2024 10:00:53 +0000
Date: Sat, 26 Oct 2024 18:00:12 +0800
From: kernel test robot <lkp@intel.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: Re: [PATCH v12 7/7] remoteproc: stm32: Add support of an OP-TEE TA
 to load the firmware
Message-ID: <202410261701.jz99xF8B-lkp@intel.com>
References: <20241025205924.2087768-8-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025205924.2087768-8-arnaud.pouliquen@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_030102_872766_0DB517E8 
X-CRM114-Status: GOOD (  15.86  )
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

Hi Arnaud,

kernel test robot noticed the following build errors:

[auto build test ERROR on 42f7652d3eb527d03665b09edac47f85fb600924]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnaud-Pouliquen/remoteproc-core-Introduce-rproc_pa_to_va-helper/20241026-050443
base:   42f7652d3eb527d03665b09edac47f85fb600924
patch link:    https://lore.kernel.org/r/20241025205924.2087768-8-arnaud.pouliquen%40foss.st.com
patch subject: [PATCH v12 7/7] remoteproc: stm32: Add support of an OP-TEE TA to load the firmware
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20241026/202410261701.jz99xF8B-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410261701.jz99xF8B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410261701.jz99xF8B-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/remoteproc/stm32_rproc.c: In function 'stm32_rproc_probe':
>> drivers/remoteproc/stm32_rproc.c:904:21: error: assignment to 'int' from 'struct rproc_tee *' makes integer from pointer without a cast [-Wint-conversion]
     904 |                 ret = rproc_tee_register(dev, rproc, proc_id);
         |                     ^
>> drivers/remoteproc/stm32_rproc.c:963:30: error: passing argument 1 of 'rproc_tee_unregister' from incompatible pointer type [-Wincompatible-pointer-types]
     963 |         rproc_tee_unregister(rproc);
         |                              ^~~~~
         |                              |
         |                              struct rproc *
   In file included from drivers/remoteproc/stm32_rproc.c:21:
   include/linux/remoteproc_tee.h:59:58: note: expected 'struct rproc_tee *' but argument is of type 'struct rproc *'
      59 | static inline int rproc_tee_unregister(struct rproc_tee *trproc)
         |                                        ~~~~~~~~~~~~~~~~~~^~~~~~
   drivers/remoteproc/stm32_rproc.c: In function 'stm32_rproc_remove':
   drivers/remoteproc/stm32_rproc.c:986:30: error: passing argument 1 of 'rproc_tee_unregister' from incompatible pointer type [-Wincompatible-pointer-types]
     986 |         rproc_tee_unregister(rproc);
         |                              ^~~~~
         |                              |
         |                              struct rproc *
   include/linux/remoteproc_tee.h:59:58: note: expected 'struct rproc_tee *' but argument is of type 'struct rproc *'
      59 | static inline int rproc_tee_unregister(struct rproc_tee *trproc)
         |                                        ~~~~~~~~~~~~~~~~~~^~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +904 drivers/remoteproc/stm32_rproc.c

   874	
   875	static int stm32_rproc_probe(struct platform_device *pdev)
   876	{
   877		struct device *dev = &pdev->dev;
   878		struct stm32_rproc *ddata;
   879		struct device_node *np = dev->of_node;
   880		struct rproc *rproc;
   881		unsigned int state;
   882		u32 proc_id;
   883		int ret;
   884	
   885		ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
   886		if (ret)
   887			return ret;
   888	
   889		if (of_device_is_compatible(np, "st,stm32mp1-m4-tee")) {
   890			/*
   891			 * Delegate the firmware management to the secure context.
   892			 * The firmware loaded has to be signed.
   893			 */
   894			ret = of_property_read_u32(np, "st,proc-id", &proc_id);
   895			if (ret) {
   896				dev_err(dev, "failed to read st,rproc-id property\n");
   897				return ret;
   898			}
   899	
   900			rproc = devm_rproc_alloc(dev, np->name, &st_rproc_tee_ops, NULL, sizeof(*ddata));
   901			if (!rproc)
   902				return -ENOMEM;
   903	
 > 904			ret = rproc_tee_register(dev, rproc, proc_id);
   905			if (ret)
   906				return dev_err_probe(dev, ret,  "signed firmware not supported by TEE\n");
   907		} else {
   908			rproc = devm_rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
   909			if (!rproc)
   910				return -ENOMEM;
   911		}
   912	
   913		ddata = rproc->priv;
   914	
   915		rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
   916	
   917		ret = stm32_rproc_parse_dt(pdev, ddata, &rproc->auto_boot);
   918		if (ret)
   919			goto free_rproc;
   920	
   921		ret = stm32_rproc_of_memory_translations(pdev, ddata);
   922		if (ret)
   923			goto free_rproc;
   924	
   925		ret = stm32_rproc_get_m4_status(ddata, &state);
   926		if (ret)
   927			goto free_rproc;
   928	
   929		if (state == M4_STATE_CRUN)
   930			rproc->state = RPROC_DETACHED;
   931	
   932		rproc->has_iommu = false;
   933		ddata->workqueue = create_workqueue(dev_name(dev));
   934		if (!ddata->workqueue) {
   935			dev_err(dev, "cannot create workqueue\n");
   936			ret = -ENOMEM;
   937			goto free_resources;
   938		}
   939	
   940		platform_set_drvdata(pdev, rproc);
   941	
   942		ret = stm32_rproc_request_mbox(rproc);
   943		if (ret)
   944			goto free_wkq;
   945	
   946		ret = rproc_add(rproc);
   947		if (ret)
   948			goto free_mb;
   949	
   950		return 0;
   951	
   952	free_mb:
   953		stm32_rproc_free_mbox(rproc);
   954	free_wkq:
   955		destroy_workqueue(ddata->workqueue);
   956	free_resources:
   957		rproc_resource_cleanup(rproc);
   958	free_rproc:
   959		if (device_may_wakeup(dev)) {
   960			dev_pm_clear_wake_irq(dev);
   961			device_init_wakeup(dev, false);
   962		}
 > 963		rproc_tee_unregister(rproc);
   964	
   965		return ret;
   966	}
   967	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

