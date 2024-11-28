Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8A4D690ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 09:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V6EUOpS5MiFuhDtNJeH6ax893pbxnpcfrZLS5+0FqFI=; b=kj1IoNtzHA+T2SRFuxc3Vvjq4H
	2bJJtr73sQ0K6EcohV2lJkKPEj8mSdebsllhSMzWKrlvuJlYiku2SzZTfkZtpXxkIO83BHoDqerDp
	a4PAeSR2u9qUmlhWYDJO9XEw8pqL6+x2ajaV8hQ08CgCB3AW57WkjmVehk/xxgaF26gIlIMDkBi+M
	r7dpLZ3Wk1QdduwSImsa0hUSJIa5ugPjvuhDkVhwE6GPlltWjIFc0IX4nZCCa9Ar9mAbFBQSgmS8j
	r6yk2zZPdiPxfyl9JRHXozscBEGV4AWOG1tzF14TPXbXT9g6EA8VxvrLEYv/zI8q7RJBzlN0SYz6p
	wMaW14NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGacD-0000000F7dd-05uZ;
	Thu, 28 Nov 2024 09:15:13 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGabC-0000000F7W0-3zMq;
	Thu, 28 Nov 2024 09:14:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732785251; x=1764321251;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xw2wO2fUU8KQ8iSrqcL95ODU94SFi+VqIXlFh7Mb7T0=;
  b=lb1Ipw074WlN9SR7xAjO2h4H8+u5Xpordn7IwxNJkZhzDo20GVcZ3iwj
   5s71VRJjD841bRKnCx0tLbWHyScGU+2V+c7nM3054XP+L0R++smzpVuSM
   rKX/5wHuvXU0Jc86EtwKKuT7vOME6/6XznvuoqDjSwOLfpPAHlNEla7y7
   lW0FUblYGJOTTB4sQEirAjT8kSS48PG+U0fgmcqOSk6iBfjHmOeslCJpa
   23OHgRHVQHY8KeatHUyFQNbLCH9+W3MkRoo7On6fs6QXHL2hMrL6xf+p7
   xDVr7y7w93UL2/mH0NaD/KbqzCuDkmPyXiNE0NqegndAGjKk10+M90E3/
   g==;
X-CSE-ConnectionGUID: lx95Vvg7T8i6njHX/T4tCA==
X-CSE-MsgGUID: C4IWD1sCQ9uA2WdxSfHQow==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="32946943"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="32946943"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 01:14:09 -0800
X-CSE-ConnectionGUID: uqOmvXfmQWGhfoFoRafCKg==
X-CSE-MsgGUID: qGqrPxt/RbKGmMsdYDmvEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="96942880"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Nov 2024 01:14:03 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGab3-0009Nx-07;
	Thu, 28 Nov 2024 09:14:01 +0000
Date: Thu, 28 Nov 2024 17:13:47 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Stuebner <heiko@sntech.de>, vkoul@kernel.org, kishon@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, quentin.schulz@cherry.de,
	sebastian.reichel@collabora.com, heiko@sntech.de,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	dse@thaumatec.com, Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v4 2/2] phy: rockchip: Add Samsung MIPI D-/C-PHY driver
Message-ID: <202411281638.UyY41bPE-lkp@intel.com>
References: <20241126131736.465111-3-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126131736.465111-3-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_011411_092905_5A9CEDC0 
X-CRM114-Status: GOOD (  13.30  )
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

Hi Heiko,

kernel test robot noticed the following build errors:

[auto build test ERROR on rockchip/for-next]
[also build test ERROR on robh/for-next linus/master v6.12 next-20241128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiko-Stuebner/dt-bindings-phy-Add-Rockchip-MIPI-C-D-PHY-schema/20241128-100435
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20241126131736.465111-3-heiko%40sntech.de
patch subject: [PATCH v4 2/2] phy: rockchip: Add Samsung MIPI D-/C-PHY driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241128/202411281638.UyY41bPE-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411281638.UyY41bPE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411281638.UyY41bPE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c:15:
   In file included from include/linux/phy/phy.h:17:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
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
   In file included from drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c:15:
   In file included from include/linux/phy/phy.h:17:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c:15:
   In file included from include/linux/phy/phy.h:17:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
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
   In file included from drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c:15:
   In file included from include/linux/phy/phy.h:17:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c:895:23: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     895 |                            I_MUX_SEL_MASK, I_MUX_SEL_400MV);
         |                                            ^
   drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c:33:26: note: expanded from macro 'I_MUX_SEL_400MV'
      33 | #define I_MUX_SEL_400MV         I_MUX_SEL(0)
         |                                 ^
   drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c:32:23: note: expanded from macro 'I_MUX_SEL'
      32 | #define I_MUX_SEL(x)            FIELD_PREP(I_MUX_SEL_MASK, x)
         |                                 ^
   drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c:900:50: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     900 |         regmap_write(samsung->regmap, DPHY_MC_GNR_CON1, T_PHY_READY(0x2000));
         |                                                         ^
   drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c:69:25: note: expanded from macro 'T_PHY_READY'
      69 | #define T_PHY_READY(x)          FIELD_PREP(GENMASK(15, 0), x)
         |                                 ^
   drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c:945:7: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     945 |                            S(samsung->pll.scaler) | P(samsung->pll.prediv));
         |                            ^
   drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c:40:16: note: expanded from macro 'S'
      40 | #define S(x)                    FIELD_PREP(S_MASK, x)
         |                                 ^
   drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c:1116:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1116 |         val = EDGE_CON(7) | EDGE_CON_DIR(0) | EDGE_CON_EN |
         |               ^
   drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c:71:22: note: expanded from macro 'EDGE_CON'
      71 | #define EDGE_CON(x)             FIELD_PREP(GENMASK(14, 12), x)
         |                                 ^
   drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c:1170:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1170 |         val = EDGE_CON(7) | EDGE_CON_DIR(0) | EDGE_CON_EN |
         |               ^
   drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c:71:22: note: expanded from macro 'EDGE_CON'
      71 | #define EDGE_CON(x)             FIELD_PREP(GENMASK(14, 12), x)
         |                                 ^
   7 warnings and 5 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/FIELD_PREP +895 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c

   881	
   882	static void samsung_mipi_dcphy_bias_block_enable(struct samsung_mipi_dcphy *samsung)
   883	{
   884		u32 bias_con2 = 0x3223;
   885	
   886		regmap_write(samsung->regmap, BIAS_CON0, 0x0010);
   887		regmap_write(samsung->regmap, BIAS_CON1, 0x0110);
   888		regmap_write(samsung->regmap, BIAS_CON2, bias_con2);
   889	
   890		/* default output voltage select:
   891		 * dphy: 400mv
   892		 * cphy: 530mv
   893		 */
   894		regmap_update_bits(samsung->regmap, BIAS_CON4,
 > 895				   I_MUX_SEL_MASK, I_MUX_SEL_400MV);
   896	}
   897	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

