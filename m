Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7F1C021A2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 03:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DJWBF00vEz8CMKBodpVhAImQU86zwPc67R0YZtDXUUU=; b=v3mUNnEsiWESuE5G0lX7SwA9dh
	sUP5UjxRZACfxKielns4+D23wwRnZqQZ40/iYNRG36X9v4h+hVwvbx1Hc1UVQO6ClH+6TiZJp0Mpw
	VFBU8atzRMQSn+ZXY0M2c/O/uneJal24OKLU+14byA/r/RH/oTWe/zqrPEHnfJqh1TO0LAxkBiBZu
	bXgIc1uIrK2HKTI8uytuTtQqpPB2Pq/xOruWzL2VaovulTy2SP47NdgvpPsT0V70EH4Z9BpHfSJ3j
	R+xjd5LQICCc4Idb9xkIav8ZjdwJVr2HNW22pVxhPrpz59WKV9HQICw+z8Nimi1dtUci2xDPIRpsv
	kVCTopAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti3KT-000000062Zj-29pU;
	Wed, 12 Feb 2025 03:22:25 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti3J1-000000062AP-1Dg0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 03:20:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739330455; x=1770866455;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tYCgJ3VVS2+wFIEAUg/38zMkc5w5kRNn/Jm1EEchQpM=;
  b=SVN8D0gNswWfC5l0+NJkzUU5R+2KaPe1d4yECg0yDsOyy3PjJnw7xFej
   n4OXV41eIeAHQzP3+RxzxzWkLtKrg5BrDDz2codqfDXCNvRlHIsh7JoKQ
   EhztXy4EHXQWEghP9xfH8uVfI/uJPeWxmR8+/hqkYIjXFo8bPvZOUGDzQ
   6WWoKBC5yt3bIATSrBx716RY7PU16OiZYFg4ES+XgfIl+Q6mUB6awK+KH
   IOAAXEgp/Ecz4aSBypFaxpg9cHYt/Iwo+jsOHqvRMbrCDdhT8yZyYc0uh
   2oWm5yWljAqsrPbMk3IzECUWiVGZcCwJrSiMc7R+40WJBk32qg/QYsbXV
   g==;
X-CSE-ConnectionGUID: DaJWblzsS9iIb+UKBxjU+A==
X-CSE-MsgGUID: vkQ/Lgl7SsWbyjXP1JOAhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="42816606"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="42816606"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 19:20:48 -0800
X-CSE-ConnectionGUID: k9ilJmnzQIWlITvoNIr6Ww==
X-CSE-MsgGUID: NFJ8fN+rQhObvj8hXYyRBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="143540262"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Feb 2025 19:20:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti3In-00153X-1Y;
	Wed, 12 Feb 2025 03:20:41 +0000
Date: Wed, 12 Feb 2025 11:19:46 +0800
From: kernel test robot <lkp@intel.com>
To: patrice.chotard@foss.st.com, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	christophe.kerello@foss.st.com, patrice.chotard@foss.st.com
Subject: Re: [PATCH v3 4/8] memory: Add STM32 Octo Memory Manager driver
Message-ID: <202502121131.W1HsUg9j-lkp@intel.com>
References: <20250210131826.220318-5-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210131826.220318-5-patrice.chotard@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_192055_353871_D30923AA 
X-CRM114-Status: GOOD (  16.95  )
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

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-spi/for-next]
[also build test ERROR on atorgue-stm32/stm32-next krzk-mem-ctrl/for-next linus/master v6.14-rc2 next-20250210]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/patrice-chotard-foss-st-com/dt-bindings-spi-Add-STM32-OSPI-controller/20250210-212554
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20250210131826.220318-5-patrice.chotard%40foss.st.com
patch subject: [PATCH v3 4/8] memory: Add STM32 Octo Memory Manager driver
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20250212/202502121131.W1HsUg9j-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502121131.W1HsUg9j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502121131.W1HsUg9j-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/memory/stm32_omm.c:82:25: note: in expansion of macro 'dev_err'
      82 |                         dev_err(dev, "[0x%llx-0x%llx] doesn't fit inside [0x%llx-0x%llx]\n",
         |                         ^~~~~~~
   drivers/memory/stm32_omm.c:82:80: note: format string is defined here
      82 |                         dev_err(dev, "[0x%llx-0x%llx] doesn't fit inside [0x%llx-0x%llx]\n",
         |                                                                             ~~~^
         |                                                                                |
         |                                                                                long long unsigned int
         |                                                                             %x
   drivers/memory/stm32_omm.c:82:38: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 6 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
      82 |                         dev_err(dev, "[0x%llx-0x%llx] doesn't fit inside [0x%llx-0x%llx]\n",
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/memory/stm32_omm.c:82:25: note: in expansion of macro 'dev_err'
      82 |                         dev_err(dev, "[0x%llx-0x%llx] doesn't fit inside [0x%llx-0x%llx]\n",
         |                         ^~~~~~~
   drivers/memory/stm32_omm.c:82:87: note: format string is defined here
      82 |                         dev_err(dev, "[0x%llx-0x%llx] doesn't fit inside [0x%llx-0x%llx]\n",
         |                                                                                    ~~~^
         |                                                                                       |
         |                                                                                       long long unsigned int
         |                                                                                    %x
   drivers/memory/stm32_omm.c:96:46: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
      96 |                                 dev_err(dev, "[0x%llx-0x%llx] overlaps [0x%llx-0x%llx]\n",
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/memory/stm32_omm.c:96:33: note: in expansion of macro 'dev_err'
      96 |                                 dev_err(dev, "[0x%llx-0x%llx] overlaps [0x%llx-0x%llx]\n",
         |                                 ^~~~~~~
   drivers/memory/stm32_omm.c:96:53: note: format string is defined here
      96 |                                 dev_err(dev, "[0x%llx-0x%llx] overlaps [0x%llx-0x%llx]\n",
         |                                                  ~~~^
         |                                                     |
         |                                                     long long unsigned int
         |                                                  %x
   drivers/memory/stm32_omm.c:96:46: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
      96 |                                 dev_err(dev, "[0x%llx-0x%llx] overlaps [0x%llx-0x%llx]\n",
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/memory/stm32_omm.c:96:33: note: in expansion of macro 'dev_err'
      96 |                                 dev_err(dev, "[0x%llx-0x%llx] overlaps [0x%llx-0x%llx]\n",
         |                                 ^~~~~~~
   drivers/memory/stm32_omm.c:96:60: note: format string is defined here
      96 |                                 dev_err(dev, "[0x%llx-0x%llx] overlaps [0x%llx-0x%llx]\n",
         |                                                         ~~~^
         |                                                            |
         |                                                            long long unsigned int
         |                                                         %x
   drivers/memory/stm32_omm.c:96:46: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
      96 |                                 dev_err(dev, "[0x%llx-0x%llx] overlaps [0x%llx-0x%llx]\n",
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/memory/stm32_omm.c:96:33: note: in expansion of macro 'dev_err'
      96 |                                 dev_err(dev, "[0x%llx-0x%llx] overlaps [0x%llx-0x%llx]\n",
         |                                 ^~~~~~~
   drivers/memory/stm32_omm.c:96:78: note: format string is defined here
      96 |                                 dev_err(dev, "[0x%llx-0x%llx] overlaps [0x%llx-0x%llx]\n",
         |                                                                           ~~~^
         |                                                                              |
         |                                                                              long long unsigned int
         |                                                                           %x
   drivers/memory/stm32_omm.c:96:46: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 6 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
      96 |                                 dev_err(dev, "[0x%llx-0x%llx] overlaps [0x%llx-0x%llx]\n",
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/memory/stm32_omm.c:96:33: note: in expansion of macro 'dev_err'
      96 |                                 dev_err(dev, "[0x%llx-0x%llx] overlaps [0x%llx-0x%llx]\n",
         |                                 ^~~~~~~
   drivers/memory/stm32_omm.c:96:85: note: format string is defined here
      96 |                                 dev_err(dev, "[0x%llx-0x%llx] overlaps [0x%llx-0x%llx]\n",
         |                                                                                  ~~~^
         |                                                                                     |
         |                                                                                     long long unsigned int
         |                                                                                  %x
   drivers/memory/stm32_omm.c: In function 'stm32_omm_configure':
>> drivers/memory/stm32_omm.c:224:35: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     224 |                         req2ack = FIELD_PREP(CR_REQ2ACK_MASK, req2ack);
         |                                   ^~~~~~~~~~


vim +/FIELD_PREP +224 drivers/memory/stm32_omm.c

   164	
   165	static int stm32_omm_configure(struct device *dev)
   166	{
   167		struct stm32_omm *omm = dev_get_drvdata(dev);
   168		struct reset_control *rstc;
   169		unsigned long clk_rate, clk_rate_max = 0;
   170		int ret;
   171		u8 i;
   172		u32 mux = 0;
   173		u32 cssel_ovr = 0;
   174		u32 req2ack = 0;
   175	
   176		omm->clk = devm_clk_get(dev, NULL);
   177		if (IS_ERR(omm->clk)) {
   178			dev_err(dev, "Failed to get OMM clock (%ld)\n",
   179				PTR_ERR(omm->clk));
   180	
   181			return PTR_ERR(omm->clk);
   182		}
   183	
   184		ret = pm_runtime_resume_and_get(dev);
   185		if (ret < 0)
   186			return ret;
   187	
   188		/* parse children's clock */
   189		for (i = 0; i < omm->nb_child; i++) {
   190			clk_rate = clk_get_rate(omm->child[i].clk);
   191			if (!clk_rate) {
   192				dev_err(dev, "Invalid clock rate\n");
   193				goto err_clk_disable;
   194			}
   195	
   196			if (clk_rate > clk_rate_max)
   197				clk_rate_max = clk_rate;
   198		}
   199	
   200		rstc = devm_reset_control_get_optional_exclusive(dev, NULL);
   201		if (IS_ERR(rstc)) {
   202			ret = dev_err_probe(dev, PTR_ERR(rstc), "reset get failed\n");
   203			goto err_clk_disable;
   204		}
   205	
   206		reset_control_assert(rstc);
   207		udelay(2);
   208		reset_control_deassert(rstc);
   209	
   210		omm->cr = readl_relaxed(omm->io_base + OMM_CR);
   211		/* optional */
   212		ret = of_property_read_u32(dev->of_node, "st,omm-mux", &mux);
   213		if (!ret) {
   214			if (mux & CR_MUXEN) {
   215				ret = of_property_read_u32(dev->of_node, "st,omm-req2ack-ns",
   216							   &req2ack);
   217				if (!ret && !req2ack) {
   218					req2ack = DIV_ROUND_UP(req2ack, NSEC_PER_SEC / clk_rate_max) - 1;
   219	
   220					if (req2ack > 256)
   221						req2ack = 256;
   222				}
   223	
 > 224				req2ack = FIELD_PREP(CR_REQ2ACK_MASK, req2ack);
   225	
   226				omm->cr &= ~CR_REQ2ACK_MASK;
   227				omm->cr |= FIELD_PREP(CR_REQ2ACK_MASK, req2ack);
   228	
   229				/*
   230				 * If the mux is enabled, the 2 OSPI clocks have to be
   231				 * always enabled
   232				 */
   233				ret = stm32_omm_enable_child_clock(dev, true);
   234				if (ret)
   235					goto err_clk_disable;
   236			}
   237	
   238			omm->cr &= ~CR_MUXENMODE_MASK;
   239			omm->cr |= FIELD_PREP(CR_MUXENMODE_MASK, mux);
   240		}
   241	
   242		/* optional */
   243		ret = of_property_read_u32(dev->of_node, "st,omm-cssel-ovr", &cssel_ovr);
   244		if (!ret) {
   245			omm->cr &= ~CR_CSSEL_OVR_MASK;
   246			omm->cr |= FIELD_PREP(CR_CSSEL_OVR_MASK, cssel_ovr);
   247			omm->cr |= CR_CSSEL_OVR_EN;
   248		}
   249	
   250		omm->restore_omm = true;
   251		writel_relaxed(omm->cr, omm->io_base + OMM_CR);
   252	
   253		ret = stm32_omm_set_amcr(dev, true);
   254	
   255	err_clk_disable:
   256		pm_runtime_put_sync_suspend(dev);
   257	
   258		return ret;
   259	}
   260	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

