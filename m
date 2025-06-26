Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284C3C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 23:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fWGQbv4PqjX3AdZV6mpdSB9bgCwNkiYjueMOUs2EQu8=; b=zKK0RiU6ugqD/4esa6P3DGtQnw
	LQYx2uW/J8s+c+557+kpSUpu6qdGUmcV9GNvVt2Vmam9d0P536lKXTXlInRBbMf2s0r+2RRn8DXKS
	gOpMg1PRe6iIPVUvLmg/UD9u2EPUaO/K+UsuVV+yAyKtzoHzdIWmR7emYiM+4Fr06/aChaMXNKyuj
	5p5Oxt2Z5dZUNuHP88vonRNHX4YXGqhYBL8u0xIvBa8WOyRKlrVM+/EV0XU3Ow7EPrNNDMMiOGhWW
	dqHi085ww73yUiFeQelysX6HBqRo+QUKNHwIcoByFzVoyI49Vu+h+u/ySfKI9A3k3MZMKPdfshklb
	bNXuXimw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvf9-0000000D0pI-3E6J;
	Thu, 26 Jun 2025 23:05:47 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUteN-0000000CmzY-2Hyp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 20:56:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750971411; x=1782507411;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cX6SXR0g40dHeXzSDIAAA8QSybpGitOG/g8EitOJ4vs=;
  b=hovlklsFSVWfLTAeoNsjQPiBL09ZrMvTJeI2st1r6dSd242t/MvfGBz/
   rwHNxwMx8ysQtIfDWztOssuFfseG8pEsT+t+GfQEkbMFOiuAaLcun8KJR
   d4sIUQ2mHVKjMQz7mVqxGvOWP+kCN4leTkW/v42eRc/UbSDf7+we6+ZyC
   Ko7BrmcCi7c5+0LLBw+0VAaKlVT6IsLrWrQobvxFZbeOLo0tHx7CX/sO+
   L9k4Byj7FNn3L4F+ff6MyF7wug/s32pq+JP8cP5lmsmLXS8vNmEgvQi8S
   zAsPN8exJ1q4rVahs55QtnQ5bz5O7/bPjzaIY3LLfFYhq5MK2n8r75UQ1
   w==;
X-CSE-ConnectionGUID: 6abGmJuqTTK1uMdmzCqw5A==
X-CSE-MsgGUID: JU5EuUAhS2WiEb8GJJAcCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="52512287"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="52512287"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 13:56:48 -0700
X-CSE-ConnectionGUID: jmhvGWpMQLSHpYPnRs42nQ==
X-CSE-MsgGUID: V1RSQYnIQs2oPCfocZNNdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="152245136"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Jun 2025 13:56:45 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUteF-000VXK-2M;
	Thu, 26 Jun 2025 20:56:43 +0000
Date: Fri, 27 Jun 2025 04:56:13 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v1 1/1] mfd: syscon: atmel-smc: Don't use "proxy" headers
Message-ID: <202506270640.lghOwS7H-lkp@intel.com>
References: <20250626155435.325336-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626155435.325336-1-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_135651_601324_8F09A19E 
X-CRM114-Status: GOOD (  13.97  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-mfd/for-mfd-next]
[also build test ERROR on lee-mfd/for-mfd-fixes soc/for-next lee-leds/for-leds-next linus/master v6.16-rc3 next-20250626]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/mfd-syscon-atmel-smc-Don-t-use-proxy-headers/20250626-235519
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20250626155435.325336-1-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 1/1] mfd: syscon: atmel-smc: Don't use "proxy" headers
config: i386-buildonly-randconfig-001-20250627 (https://download.01.org/0day-ci/archive/20250627/202506270640.lghOwS7H-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506270640.lghOwS7H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506270640.lghOwS7H-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/mfd/atmel-smc.c: In function 'atmel_smc_cs_conf_apply':
>> drivers/mfd/atmel-smc.c:248:9: error: implicit declaration of function 'regmap_write' [-Werror=implicit-function-declaration]
     248 |         regmap_write(regmap, ATMEL_SMC_SETUP(cs), conf->setup);
         |         ^~~~~~~~~~~~
   drivers/mfd/atmel-smc.c: In function 'atmel_smc_cs_conf_get':
>> drivers/mfd/atmel-smc.c:289:9: error: implicit declaration of function 'regmap_read' [-Werror=implicit-function-declaration]
     289 |         regmap_read(regmap, ATMEL_SMC_SETUP(cs), &conf->setup);
         |         ^~~~~~~~~~~
   drivers/mfd/atmel-smc.c: At top level:
>> drivers/mfd/atmel-smc.c:326:34: error: array type has incomplete element type 'struct of_device_id'
     326 | static const struct of_device_id atmel_smc_ids[] __maybe_unused = {
         |                                  ^~~~~~~~~~~~~
   drivers/mfd/atmel-smc.c: In function 'atmel_hsmc_get_reg_layout':
>> drivers/mfd/atmel-smc.c:347:17: error: implicit declaration of function 'of_match_node' [-Werror=implicit-function-declaration]
     347 |         match = of_match_node(atmel_smc_ids, np);
         |                 ^~~~~~~~~~~~~
>> drivers/mfd/atmel-smc.c:349:29: error: invalid use of undefined type 'const struct of_device_id'
     349 |         return match ? match->data : ERR_PTR(-EINVAL);
         |                             ^~
>> drivers/mfd/atmel-smc.c:350:1: warning: control reaches end of non-void function [-Wreturn-type]
     350 | }
         | ^
   drivers/mfd/atmel-smc.c: At top level:
   drivers/mfd/atmel-smc.c:326:34: warning: 'atmel_smc_ids' defined but not used [-Wunused-variable]
     326 | static const struct of_device_id atmel_smc_ids[] __maybe_unused = {
         |                                  ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/regmap_write +248 drivers/mfd/atmel-smc.c

fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  235  
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  236  /**
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  237   * atmel_smc_cs_conf_apply - apply an SMC CS conf
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  238   * @regmap: the SMC regmap
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  239   * @cs: the CS id
1574360a98cef98 Lee Jones                    2020-06-24  240   * @conf: the SMC CS conf to apply
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  241   *
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  242   * Applies an SMC CS configuration.
53291cb23c919c5 Hans-Christian Noren Egtvedt 2018-10-20  243   * Only valid on at91sam9 SoCs.
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  244   */
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  245  void atmel_smc_cs_conf_apply(struct regmap *regmap, int cs,
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  246  			     const struct atmel_smc_cs_conf *conf)
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  247  {
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16 @248  	regmap_write(regmap, ATMEL_SMC_SETUP(cs), conf->setup);
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  249  	regmap_write(regmap, ATMEL_SMC_PULSE(cs), conf->pulse);
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  250  	regmap_write(regmap, ATMEL_SMC_CYCLE(cs), conf->cycle);
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  251  	regmap_write(regmap, ATMEL_SMC_MODE(cs), conf->mode);
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  252  }
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  253  EXPORT_SYMBOL_GPL(atmel_smc_cs_conf_apply);
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  254  
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  255  /**
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  256   * atmel_hsmc_cs_conf_apply - apply an SMC CS conf
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  257   * @regmap: the HSMC regmap
b0f3ab20e76499d Ludovic Desroches            2017-07-18  258   * @layout: the layout of registers
6af8d30527e6abb Julia Lawall                 2024-09-30  259   * @cs: the CS id
1574360a98cef98 Lee Jones                    2020-06-24  260   * @conf: the SMC CS conf to apply
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  261   *
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  262   * Applies an SMC CS configuration.
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  263   * Only valid on post-sama5 SoCs.
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  264   */
b0f3ab20e76499d Ludovic Desroches            2017-07-18  265  void atmel_hsmc_cs_conf_apply(struct regmap *regmap,
b0f3ab20e76499d Ludovic Desroches            2017-07-18  266  			      const struct atmel_hsmc_reg_layout *layout,
b0f3ab20e76499d Ludovic Desroches            2017-07-18  267  			      int cs, const struct atmel_smc_cs_conf *conf)
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  268  {
b0f3ab20e76499d Ludovic Desroches            2017-07-18  269  	regmap_write(regmap, ATMEL_HSMC_SETUP(layout, cs), conf->setup);
b0f3ab20e76499d Ludovic Desroches            2017-07-18  270  	regmap_write(regmap, ATMEL_HSMC_PULSE(layout, cs), conf->pulse);
b0f3ab20e76499d Ludovic Desroches            2017-07-18  271  	regmap_write(regmap, ATMEL_HSMC_CYCLE(layout, cs), conf->cycle);
b0f3ab20e76499d Ludovic Desroches            2017-07-18  272  	regmap_write(regmap, ATMEL_HSMC_TIMINGS(layout, cs), conf->timings);
b0f3ab20e76499d Ludovic Desroches            2017-07-18  273  	regmap_write(regmap, ATMEL_HSMC_MODE(layout, cs), conf->mode);
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  274  }
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  275  EXPORT_SYMBOL_GPL(atmel_hsmc_cs_conf_apply);
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  276  
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  277  /**
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  278   * atmel_smc_cs_conf_get - retrieve the current SMC CS conf
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  279   * @regmap: the SMC regmap
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  280   * @cs: the CS id
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  281   * @conf: the SMC CS conf object to store the current conf
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  282   *
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  283   * Retrieve the SMC CS configuration.
53291cb23c919c5 Hans-Christian Noren Egtvedt 2018-10-20  284   * Only valid on at91sam9 SoCs.
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  285   */
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  286  void atmel_smc_cs_conf_get(struct regmap *regmap, int cs,
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  287  			   struct atmel_smc_cs_conf *conf)
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  288  {
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16 @289  	regmap_read(regmap, ATMEL_SMC_SETUP(cs), &conf->setup);
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  290  	regmap_read(regmap, ATMEL_SMC_PULSE(cs), &conf->pulse);
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  291  	regmap_read(regmap, ATMEL_SMC_CYCLE(cs), &conf->cycle);
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  292  	regmap_read(regmap, ATMEL_SMC_MODE(cs), &conf->mode);
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  293  }
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  294  EXPORT_SYMBOL_GPL(atmel_smc_cs_conf_get);
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  295  
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  296  /**
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  297   * atmel_hsmc_cs_conf_get - retrieve the current SMC CS conf
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  298   * @regmap: the HSMC regmap
b0f3ab20e76499d Ludovic Desroches            2017-07-18  299   * @layout: the layout of registers
6af8d30527e6abb Julia Lawall                 2024-09-30  300   * @cs: the CS id
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  301   * @conf: the SMC CS conf object to store the current conf
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  302   *
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  303   * Retrieve the SMC CS configuration.
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  304   * Only valid on post-sama5 SoCs.
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  305   */
b0f3ab20e76499d Ludovic Desroches            2017-07-18  306  void atmel_hsmc_cs_conf_get(struct regmap *regmap,
b0f3ab20e76499d Ludovic Desroches            2017-07-18  307  			    const struct atmel_hsmc_reg_layout *layout,
b0f3ab20e76499d Ludovic Desroches            2017-07-18  308  			    int cs, struct atmel_smc_cs_conf *conf)
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  309  {
b0f3ab20e76499d Ludovic Desroches            2017-07-18  310  	regmap_read(regmap, ATMEL_HSMC_SETUP(layout, cs), &conf->setup);
b0f3ab20e76499d Ludovic Desroches            2017-07-18  311  	regmap_read(regmap, ATMEL_HSMC_PULSE(layout, cs), &conf->pulse);
b0f3ab20e76499d Ludovic Desroches            2017-07-18  312  	regmap_read(regmap, ATMEL_HSMC_CYCLE(layout, cs), &conf->cycle);
b0f3ab20e76499d Ludovic Desroches            2017-07-18  313  	regmap_read(regmap, ATMEL_HSMC_TIMINGS(layout, cs), &conf->timings);
b0f3ab20e76499d Ludovic Desroches            2017-07-18  314  	regmap_read(regmap, ATMEL_HSMC_MODE(layout, cs), &conf->mode);
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  315  }
fe9d7cb22ef3a26 Boris Brezillon              2017-03-16  316  EXPORT_SYMBOL_GPL(atmel_hsmc_cs_conf_get);
b0f3ab20e76499d Ludovic Desroches            2017-07-18  317  
b0f3ab20e76499d Ludovic Desroches            2017-07-18  318  static const struct atmel_hsmc_reg_layout sama5d3_reg_layout = {
b0f3ab20e76499d Ludovic Desroches            2017-07-18  319  	.timing_regs_offset = 0x600,
b0f3ab20e76499d Ludovic Desroches            2017-07-18  320  };
b0f3ab20e76499d Ludovic Desroches            2017-07-18  321  
b0f3ab20e76499d Ludovic Desroches            2017-07-18  322  static const struct atmel_hsmc_reg_layout sama5d2_reg_layout = {
b0f3ab20e76499d Ludovic Desroches            2017-07-18  323  	.timing_regs_offset = 0x700,
b0f3ab20e76499d Ludovic Desroches            2017-07-18  324  };
b0f3ab20e76499d Ludovic Desroches            2017-07-18  325  
f130faebcdb6c7f Krzysztof Kozlowski          2023-03-11 @326  static const struct of_device_id atmel_smc_ids[] __maybe_unused = {
b0f3ab20e76499d Ludovic Desroches            2017-07-18  327  	{ .compatible = "atmel,at91sam9260-smc", .data = NULL },
b0f3ab20e76499d Ludovic Desroches            2017-07-18  328  	{ .compatible = "atmel,sama5d3-smc", .data = &sama5d3_reg_layout },
b0f3ab20e76499d Ludovic Desroches            2017-07-18  329  	{ .compatible = "atmel,sama5d2-smc", .data = &sama5d2_reg_layout },
b0f3ab20e76499d Ludovic Desroches            2017-07-18  330  	{ /* sentinel */ },
b0f3ab20e76499d Ludovic Desroches            2017-07-18  331  };
b0f3ab20e76499d Ludovic Desroches            2017-07-18  332  
b0f3ab20e76499d Ludovic Desroches            2017-07-18  333  /**
b0f3ab20e76499d Ludovic Desroches            2017-07-18  334   * atmel_hsmc_get_reg_layout - retrieve the layout of HSMC registers
b0f3ab20e76499d Ludovic Desroches            2017-07-18  335   * @np: the HSMC regmap
b0f3ab20e76499d Ludovic Desroches            2017-07-18  336   *
b0f3ab20e76499d Ludovic Desroches            2017-07-18  337   * Retrieve the layout of HSMC registers.
b0f3ab20e76499d Ludovic Desroches            2017-07-18  338   *
b0f3ab20e76499d Ludovic Desroches            2017-07-18  339   * Returns NULL in case of SMC, a struct atmel_hsmc_reg_layout pointer
b0f3ab20e76499d Ludovic Desroches            2017-07-18  340   * in HSMC case, otherwise ERR_PTR(-EINVAL).
b0f3ab20e76499d Ludovic Desroches            2017-07-18  341   */
b0f3ab20e76499d Ludovic Desroches            2017-07-18  342  const struct atmel_hsmc_reg_layout *
b0f3ab20e76499d Ludovic Desroches            2017-07-18  343  atmel_hsmc_get_reg_layout(struct device_node *np)
b0f3ab20e76499d Ludovic Desroches            2017-07-18  344  {
b0f3ab20e76499d Ludovic Desroches            2017-07-18  345  	const struct of_device_id *match;
b0f3ab20e76499d Ludovic Desroches            2017-07-18  346  
b0f3ab20e76499d Ludovic Desroches            2017-07-18 @347  	match = of_match_node(atmel_smc_ids, np);
b0f3ab20e76499d Ludovic Desroches            2017-07-18  348  
b0f3ab20e76499d Ludovic Desroches            2017-07-18 @349  	return match ? match->data : ERR_PTR(-EINVAL);
b0f3ab20e76499d Ludovic Desroches            2017-07-18 @350  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

