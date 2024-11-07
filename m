Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC39D5D689
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 20:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OEXLINbDZIAHOAqC0CkGOudarqFhAPc0O5/5sX9OnT0=; b=nwCUHILhamjTzpGhlcKz0XwPX8
	DJp9eWCteTS1PTjQ08tlhEgYY0+HuCymIuLBePb2x71OTrQirYnAh82j2/d8erFXCaQdKc3PDDFyy
	T8WrVEEgvyZyaqbgB3Cr896/aDZq1URK0AiCDFT9cq4xQRHGpigpZ5niNpvsyEehx/vmlPvbm2cYs
	JX42Uj5fviN+nELn+XiRzmhiedxCRBtCSmKrxO8t30uzxbkk1KL2UwWiJ3xm6fL6ktkLYyrlAMnda
	5VdpCEORlgn+mn4FhGBY6SMWrFodS4lIlOSrEz3UNF10Rb4+12gN0d2cE0lqEL7KrfY1XJQ4T6eUg
	Tqce/S2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t98sZ-00000008DNQ-0W7Q;
	Thu, 07 Nov 2024 20:13:19 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t98iO-00000008CGw-2Emt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 20:02:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731009768; x=1762545768;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IOhBT4+s9HKKZijqKV2MQyFUtiotLMC73AtMG4Y6HsI=;
  b=B+/ICLsOHDBxNTJIHr98ST1Dal6D/hvlSvM5RuCcED8cPaOHfCufe8u1
   G/fdNpil1m5vT3237BBkusXSSoOT2cpkHoZz3bHgW2EYJAAXIMMG2jFSl
   UQ0o7ZeJeEqXVYagdySpkBwknAoS4XjOnDlXu//PqLacXmapsEQdM1k6q
   50vzCnBWNFqtA3Fjg4M7xZGI0wCi5GPz+IYf/hLSyW/VGNqI1rz0CQ/TR
   L4BC07GbeOFocFLDpzRwursyfEwC53TrHaPuwHCYk4t/fn9fsq/lO+UQj
   ajn6gm310s+3T/WiKIVRuy+mEQ31b4U9J9wnz0VNcfF0rVA/rMIcJvzFQ
   A==;
X-CSE-ConnectionGUID: 2+J+Dr0BRt2dzNq3TjyYaA==
X-CSE-MsgGUID: oXbf7J4bSXqLIrmykNc/lA==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="48389754"
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="48389754"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 12:02:33 -0800
X-CSE-ConnectionGUID: ba7PxB6RT3iz2c17O0RJ7w==
X-CSE-MsgGUID: 29VcLRgfRSOszxnR9CtQRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="89860766"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Nov 2024 12:02:30 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t98i3-000qdG-2M;
	Thu, 07 Nov 2024 20:02:27 +0000
Date: Fri, 8 Nov 2024 04:01:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jonas Rebmann <jre@pengutronix.de>, Mark Brown <broonie@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-spi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Jonas Rebmann <jre@pengutronix.de>
Subject: Re: [PATCH 2/2] spi: imx: support word delay
Message-ID: <202411080315.8JXzpAnT-lkp@intel.com>
References: <20241107-imx-spi-word-delay-v1-2-2a969214d796@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107-imx-spi-word-delay-v1-2-2a969214d796@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_120248_645064_5AA79B69 
X-CRM114-Status: GOOD (  15.85  )
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

Hi Jonas,

kernel test robot noticed the following build errors:

[auto build test ERROR on 9852d85ec9d492ebef56dc5f229416c925758edc]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonas-Rebmann/spi-imx-pass-struct-spi_transfer-to-prepare_transfer/20241107-233756
base:   9852d85ec9d492ebef56dc5f229416c925758edc
patch link:    https://lore.kernel.org/r/20241107-imx-spi-word-delay-v1-2-2a969214d796%40pengutronix.de
patch subject: [PATCH 2/2] spi: imx: support word delay
config: arc-randconfig-002-20241108 (https://download.01.org/0day-ci/archive/20241108/202411080315.8JXzpAnT-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411080315.8JXzpAnT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411080315.8JXzpAnT-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/spi/spi-imx.c: In function 'mx51_ecspi_prepare_transfer':
>> drivers/spi/spi-imx.c:739:14: error: implicit declaration of function 'FIELD_FIT' [-Werror=implicit-function-declaration]
     739 |         if (!FIELD_FIT(MX51_ECSPI_PERIOD_MASK, word_delay_sck))
         |              ^~~~~~~~~
   In file included from include/linux/byteorder/little_endian.h:5,
                    from arch/arc/include/uapi/asm/byteorder.h:16,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/arc/include/asm/bitops.h:192,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:23,
                    from include/linux/clk.h:13,
                    from drivers/spi/spi-imx.c:6:
>> drivers/spi/spi-imx.c:742:16: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     742 |         writel(FIELD_PREP(MX51_ECSPI_PERIOD_MASK, word_delay_sck),
         |                ^~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:34:51: note: in definition of macro '__cpu_to_le32'
      34 | #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
         |                                                   ^
   arch/arc/include/asm/io.h:208:47: note: in expansion of macro 'writel_relaxed'
     208 | #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
         |                                               ^~~~~~~~~~~~~~
   drivers/spi/spi-imx.c:742:9: note: in expansion of macro 'writel'
     742 |         writel(FIELD_PREP(MX51_ECSPI_PERIOD_MASK, word_delay_sck),
         |         ^~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_FIT +739 drivers/spi/spi-imx.c

   665	
   666	static int mx51_ecspi_prepare_transfer(struct spi_imx_data *spi_imx,
   667					       struct spi_device *spi, struct spi_transfer *t)
   668	{
   669		u32 ctrl = readl(spi_imx->base + MX51_ECSPI_CTRL);
   670		u64 word_delay_sck;
   671		u32 clk;
   672	
   673		/* Clear BL field and set the right value */
   674		ctrl &= ~MX51_ECSPI_CTRL_BL_MASK;
   675		if (spi_imx->target_mode && is_imx53_ecspi(spi_imx))
   676			ctrl |= (spi_imx->target_burst * 8 - 1)
   677				<< MX51_ECSPI_CTRL_BL_OFFSET;
   678		else {
   679			ctrl |= (spi_imx->bits_per_word - 1)
   680				<< MX51_ECSPI_CTRL_BL_OFFSET;
   681		}
   682	
   683		/* set clock speed */
   684		ctrl &= ~(0xf << MX51_ECSPI_CTRL_POSTDIV_OFFSET |
   685			  0xf << MX51_ECSPI_CTRL_PREDIV_OFFSET);
   686		ctrl |= mx51_ecspi_clkdiv(spi_imx, spi_imx->spi_bus_clk, &clk);
   687		spi_imx->spi_bus_clk = clk;
   688	
   689		mx51_configure_cpha(spi_imx, spi);
   690	
   691		/*
   692		 * ERR009165: work in XHC mode instead of SMC as PIO on the chips
   693		 * before i.mx6ul.
   694		 */
   695		if (spi_imx->usedma && spi_imx->devtype_data->tx_glitch_fixed)
   696			ctrl |= MX51_ECSPI_CTRL_SMC;
   697		else
   698			ctrl &= ~MX51_ECSPI_CTRL_SMC;
   699	
   700		writel(ctrl, spi_imx->base + MX51_ECSPI_CTRL);
   701	
   702		/* calculate word delay in SPI Clock (SCLK) cycles */
   703		if (t->word_delay.value == 0) {
   704			word_delay_sck = 0;
   705		} else if (t->word_delay.unit == SPI_DELAY_UNIT_SCK) {
   706			word_delay_sck = t->word_delay.value;
   707	
   708			if (word_delay_sck <= MX51_ECSPI_PERIOD_MIN_DELAY_SCK)
   709				word_delay_sck = 0;
   710			else if (word_delay_sck <= MX51_ECSPI_PERIOD_MIN_DELAY_SCK + 1)
   711				word_delay_sck = 1;
   712			else
   713				word_delay_sck -= MX51_ECSPI_PERIOD_MIN_DELAY_SCK + 1;
   714		} else {
   715			int word_delay_ns;
   716	
   717			word_delay_ns = spi_delay_to_ns(&t->word_delay, t);
   718			if (word_delay_ns < 0)
   719				return word_delay_ns;
   720	
   721			if (word_delay_ns <= mul_u64_u32_div(NSEC_PER_SEC,
   722							     MX51_ECSPI_PERIOD_MIN_DELAY_SCK,
   723							     spi_imx->spi_bus_clk)) {
   724				word_delay_sck = 0;
   725			} else if (word_delay_ns <= mul_u64_u32_div(NSEC_PER_SEC,
   726								    MX51_ECSPI_PERIOD_MIN_DELAY_SCK + 1,
   727								    spi_imx->spi_bus_clk)) {
   728				word_delay_sck = 1;
   729			} else {
   730				word_delay_ns -= mul_u64_u32_div(NSEC_PER_SEC,
   731								 MX51_ECSPI_PERIOD_MIN_DELAY_SCK + 1,
   732								 spi_imx->spi_bus_clk);
   733	
   734				word_delay_sck = DIV_U64_ROUND_UP((u64)word_delay_ns * spi_imx->spi_bus_clk,
   735								  NSEC_PER_SEC);
   736			}
   737		}
   738	
 > 739		if (!FIELD_FIT(MX51_ECSPI_PERIOD_MASK, word_delay_sck))
   740			return -EINVAL;
   741	
 > 742		writel(FIELD_PREP(MX51_ECSPI_PERIOD_MASK, word_delay_sck),
   743		       spi_imx->base + MX51_ECSPI_PERIOD);
   744	
   745		return 0;
   746	}
   747	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

