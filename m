Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7E0C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 11:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JMxmoJT/2ktFoshknkLiPHq85Uiq59U6ylBoAxQuQVQ=; b=q2GlVopwLFFlbPFD1w28vGiAXu
	1W2RIjt2G3VFr75exYMUsQKnaf0POEuYu4IBxnR4+XtzgY2Oa4Hz6JEuyA3oe0bXqvOQ0AQBLs0Ao
	bnzM24lGkihuWEtiCqs1y9f0ajXpEkwWD7jd/X51LqteWPEtYqZkYr+yhWU93uo2evyIL8aatLZ4G
	5YEaVrVp8iDX/5iJ3SamkKIMbutwSup5YHpGOeQtEhJtCZjdhNFqwWfOI28JApTdl5IWT5ZDJmcsc
	16OmRtiHg/0/xEarFscoMyLDyNlhz9zRjkCjCIxy/VBSRFBjOx7UO2BzLhnxe46KvudBQOccmCiO1
	60oryu2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV7MG-0000000EVMW-0CTh;
	Fri, 27 Jun 2025 11:35:04 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV7IL-0000000EUXy-248X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 11:31:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751023862; x=1782559862;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i1WbDhB1+wY70SwMZLSulc6VyTG6n01VXfNaeicTBPY=;
  b=nM3GcEBfct0axn5Hdzoy3UNRA3k7suIkY31S2IvEtFYh8hwY0+av8sF/
   0qjEGhiIBBqTdwR8ko4StIKZ+Otzhw8cn3sl7064tKjFoEBI8nABUnMNJ
   Kub3Nb8F8c1SaSDjOFFUZ7RZEFwceppUePUNUbg+pr1wNc506vFXfaoHG
   afggWi+2VYvPBgk+//jgIvG581wzeZhPmwBntw/1yBUjJztGCpeUVAa5J
   t+y2DgFPcCPdQJDug/+0doRTvEIxXMb12KSx4OOocBDvkHUp3U2DqR5TP
   Dz4+srJrYuvxONN41GueVotTBErx//A9APyF/iMGUVNHD2wdEFLFLMxXt
   Q==;
X-CSE-ConnectionGUID: DD+JolnaSDGvXy2KA9MxYw==
X-CSE-MsgGUID: qlPCrYUsTVi2sw0CGWhKoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64393204"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="64393204"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 04:31:01 -0700
X-CSE-ConnectionGUID: KEnKKXs5TQOO1SoZnre3aQ==
X-CSE-MsgGUID: no3RA6baSOy1fFNI2uioOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="153309827"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Jun 2025 04:30:53 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV7IA-000W7m-0O;
	Fri, 27 Jun 2025 11:30:50 +0000
Date: Fri, 27 Jun 2025 19:30:25 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v1 1/1] mfd: syscon: atmel-smc: Don't use "proxy" headers
Message-ID: <202506271909.O9FuRVos-lkp@intel.com>
References: <20250626155435.325336-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626155435.325336-1-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_043101_590173_2AFE8EF7 
X-CRM114-Status: GOOD (  13.44  )
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

Hi Andy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on lee-mfd/for-mfd-fixes soc/for-next lee-leds/for-leds-next linus/master v6.16-rc3 next-20250626]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/mfd-syscon-atmel-smc-Don-t-use-proxy-headers/20250626-235519
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20250626155435.325336-1-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 1/1] mfd: syscon: atmel-smc: Don't use "proxy" headers
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250627/202506271909.O9FuRVos-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506271909.O9FuRVos-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506271909.O9FuRVos-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/atmel-smc.c:24:1: warning: data definition has no type or storage class
      24 | EXPORT_SYMBOL_GPL(atmel_smc_cs_conf_init);
         | ^~~~~~~~~~~~~~~~~
   drivers/mfd/atmel-smc.c:24:1: error: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
   drivers/mfd/atmel-smc.c:24:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   drivers/mfd/atmel-smc.c:118:1: warning: data definition has no type or storage class
     118 | EXPORT_SYMBOL_GPL(atmel_smc_cs_conf_set_timing);
         | ^~~~~~~~~~~~~~~~~
   drivers/mfd/atmel-smc.c:118:1: error: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
   drivers/mfd/atmel-smc.c:118:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   drivers/mfd/atmel-smc.c:157:1: warning: data definition has no type or storage class
     157 | EXPORT_SYMBOL_GPL(atmel_smc_cs_conf_set_setup);
         | ^~~~~~~~~~~~~~~~~
   drivers/mfd/atmel-smc.c:157:1: error: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
   drivers/mfd/atmel-smc.c:157:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   drivers/mfd/atmel-smc.c:196:1: warning: data definition has no type or storage class
     196 | EXPORT_SYMBOL_GPL(atmel_smc_cs_conf_set_pulse);
         | ^~~~~~~~~~~~~~~~~
   drivers/mfd/atmel-smc.c:196:1: error: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
   drivers/mfd/atmel-smc.c:196:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   drivers/mfd/atmel-smc.c:234:1: warning: data definition has no type or storage class
     234 | EXPORT_SYMBOL_GPL(atmel_smc_cs_conf_set_cycle);
         | ^~~~~~~~~~~~~~~~~
   drivers/mfd/atmel-smc.c:234:1: error: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
   drivers/mfd/atmel-smc.c:234:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   drivers/mfd/atmel-smc.c: In function 'atmel_smc_cs_conf_apply':
   drivers/mfd/atmel-smc.c:248:9: error: implicit declaration of function 'regmap_write' [-Wimplicit-function-declaration]
     248 |         regmap_write(regmap, ATMEL_SMC_SETUP(cs), conf->setup);
         |         ^~~~~~~~~~~~
   drivers/mfd/atmel-smc.c: At top level:
   drivers/mfd/atmel-smc.c:253:1: warning: data definition has no type or storage class
     253 | EXPORT_SYMBOL_GPL(atmel_smc_cs_conf_apply);
         | ^~~~~~~~~~~~~~~~~
   drivers/mfd/atmel-smc.c:253:1: error: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
   drivers/mfd/atmel-smc.c:253:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   drivers/mfd/atmel-smc.c:275:1: warning: data definition has no type or storage class
     275 | EXPORT_SYMBOL_GPL(atmel_hsmc_cs_conf_apply);
         | ^~~~~~~~~~~~~~~~~
   drivers/mfd/atmel-smc.c:275:1: error: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
   drivers/mfd/atmel-smc.c:275:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   drivers/mfd/atmel-smc.c: In function 'atmel_smc_cs_conf_get':
   drivers/mfd/atmel-smc.c:289:9: error: implicit declaration of function 'regmap_read' [-Wimplicit-function-declaration]
     289 |         regmap_read(regmap, ATMEL_SMC_SETUP(cs), &conf->setup);
         |         ^~~~~~~~~~~
   drivers/mfd/atmel-smc.c: At top level:
   drivers/mfd/atmel-smc.c:294:1: warning: data definition has no type or storage class
     294 | EXPORT_SYMBOL_GPL(atmel_smc_cs_conf_get);
         | ^~~~~~~~~~~~~~~~~
   drivers/mfd/atmel-smc.c:294:1: error: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
   drivers/mfd/atmel-smc.c:294:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   drivers/mfd/atmel-smc.c:316:1: warning: data definition has no type or storage class
     316 | EXPORT_SYMBOL_GPL(atmel_hsmc_cs_conf_get);
         | ^~~~~~~~~~~~~~~~~
   drivers/mfd/atmel-smc.c:316:1: error: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
   drivers/mfd/atmel-smc.c:316:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   drivers/mfd/atmel-smc.c:326:34: error: array type has incomplete element type 'struct of_device_id'
     326 | static const struct of_device_id atmel_smc_ids[] __maybe_unused = {
         |                                  ^~~~~~~~~~~~~
   drivers/mfd/atmel-smc.c: In function 'atmel_hsmc_get_reg_layout':
   drivers/mfd/atmel-smc.c:347:17: error: implicit declaration of function 'of_match_node' [-Wimplicit-function-declaration]
     347 |         match = of_match_node(atmel_smc_ids, np);
         |                 ^~~~~~~~~~~~~
   drivers/mfd/atmel-smc.c:349:29: error: invalid use of undefined type 'const struct of_device_id'
     349 |         return match ? match->data : ERR_PTR(-EINVAL);
         |                             ^~
   drivers/mfd/atmel-smc.c: At top level:
   drivers/mfd/atmel-smc.c:351:1: warning: data definition has no type or storage class
     351 | EXPORT_SYMBOL_GPL(atmel_hsmc_get_reg_layout);
         | ^~~~~~~~~~~~~~~~~
   drivers/mfd/atmel-smc.c:351:1: error: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
   drivers/mfd/atmel-smc.c:351:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   drivers/mfd/atmel-smc.c:326:34: warning: 'atmel_smc_ids' defined but not used [-Wunused-variable]
     326 | static const struct of_device_id atmel_smc_ids[] __maybe_unused = {
         |                                  ^~~~~~~~~~~~~


vim +24 drivers/mfd/atmel-smc.c

fe9d7cb22ef3a2 Boris Brezillon 2017-03-16  13  
fe9d7cb22ef3a2 Boris Brezillon 2017-03-16  14  /**
fe9d7cb22ef3a2 Boris Brezillon 2017-03-16  15   * atmel_smc_cs_conf_init - initialize a SMC CS conf
fe9d7cb22ef3a2 Boris Brezillon 2017-03-16  16   * @conf: the SMC CS conf to initialize
fe9d7cb22ef3a2 Boris Brezillon 2017-03-16  17   *
fe9d7cb22ef3a2 Boris Brezillon 2017-03-16  18   * Set all fields to 0 so that one can start defining a new config.
fe9d7cb22ef3a2 Boris Brezillon 2017-03-16  19   */
fe9d7cb22ef3a2 Boris Brezillon 2017-03-16  20  void atmel_smc_cs_conf_init(struct atmel_smc_cs_conf *conf)
fe9d7cb22ef3a2 Boris Brezillon 2017-03-16  21  {
fe9d7cb22ef3a2 Boris Brezillon 2017-03-16  22  	memset(conf, 0, sizeof(*conf));
fe9d7cb22ef3a2 Boris Brezillon 2017-03-16  23  }
fe9d7cb22ef3a2 Boris Brezillon 2017-03-16 @24  EXPORT_SYMBOL_GPL(atmel_smc_cs_conf_init);
fe9d7cb22ef3a2 Boris Brezillon 2017-03-16  25  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

