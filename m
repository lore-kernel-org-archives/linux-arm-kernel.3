Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709B0D43357
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 01:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZp/uQMVsfZ2Kz2u0tZhpWZ5w3Xv75u7omFSx9LicXA=; b=zKbvAQYoqUDirTAtrXwiMicKg7
	b7RpjxF2yrj2+ludUG8jKdpioSVnk8avh8taeYAy4LSks1mV7muF2Dsxo9gxiTxm8YBW6e0vp/sMD
	WRfn5J+10CIjYMt6t6nqKWTADYNId393dABYVvQ1cMRIPkPf7EPoRx3GUyPPFhhayfAyoZWAO0L83
	qnV+WQjqHPOoiQmgxzDNbCjxlO0oDORByT0xcjTEb8PLE53BPVFyeD3D0EpT56n+rSuV2GmPyQk1W
	jaR5aqUFCLQ5N8SXvXglIEdMDbpAZxlUByZ2JaHt5g2Iq1oj7vdr4AdKVGjHxtWFbYDztt1J0bLOS
	ygvbxd1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9DQU-00000008tRa-0tq6;
	Fri, 08 Nov 2024 01:04:38 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9DOk-00000008tG4-0uI3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 01:02:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731027770; x=1762563770;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GZkEOK11nLTG5sCW1VUVnGYZevL9I7vu4xi4O7heksc=;
  b=MCXzm3d19jDXbWzeLCB0AhL/s0MPPWGU7axPWsANAyBxxy3OndvLoCoe
   3YJLUiGVwB/d6QeMgyZiRpsTEl5M/UUZ5bj/8SpbxRKcGtUtQDtmgO27c
   nlA9YhZZLS1Kh1UlPKZoPma80zbYNPsObGIQuIR47biP2pLJczMwbys5n
   9KIv/fmBehJgLct9XDQywIWZ93q5VOIIlkWs3+XEsJasvm9swnR8ksv1l
   Stgb3thkz/f9usTbfmKPzbS6f5vfqls/mryGj+qOu+HECHaFzAf2utVgf
   OxT1JraZ89a61wMDBNulmsQw0rZgBueVvmIHCsa4znGWF7hQvdkCQHeiz
   w==;
X-CSE-ConnectionGUID: 27ua7wZVSKKlqYnlvNLydg==
X-CSE-MsgGUID: 57iwNAKuSweJGgX2U6BDLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="31125250"
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="31125250"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 17:02:43 -0800
X-CSE-ConnectionGUID: OFxicbAhQcKvTfEBfAzY9Q==
X-CSE-MsgGUID: jt30Y2yDSyaCXqUsfx4Q2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="84926883"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Nov 2024 17:02:39 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9DOX-000qq6-0O;
	Fri, 08 Nov 2024 01:02:37 +0000
Date: Fri, 8 Nov 2024 09:02:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jonas Rebmann <jre@pengutronix.de>, Mark Brown <broonie@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-spi@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Jonas Rebmann <jre@pengutronix.de>
Subject: Re: [PATCH 2/2] spi: imx: support word delay
Message-ID: <202411080814.OtrMOufy-lkp@intel.com>
References: <20241107-imx-spi-word-delay-v1-2-2a969214d796@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107-imx-spi-word-delay-v1-2-2a969214d796@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_170250_343070_67450B1E 
X-CRM114-Status: GOOD (  16.34  )
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
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241108/202411080814.OtrMOufy-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411080814.OtrMOufy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411080814.OtrMOufy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/spi/spi-imx.c:9:
   In file included from include/linux/dmaengine.h:12:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/spi/spi-imx.c:9:
   In file included from include/linux/dmaengine.h:12:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/spi/spi-imx.c:9:
   In file included from include/linux/dmaengine.h:12:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/spi/spi-imx.c:9:
   In file included from include/linux/dmaengine.h:12:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/spi/spi-imx.c:739:7: error: call to undeclared function 'FIELD_FIT'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     739 |         if (!FIELD_FIT(MX51_ECSPI_PERIOD_MASK, word_delay_sck))
         |              ^
>> drivers/spi/spi-imx.c:742:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     742 |         writel(FIELD_PREP(MX51_ECSPI_PERIOD_MASK, word_delay_sck),
         |                ^
   7 warnings and 2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


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

