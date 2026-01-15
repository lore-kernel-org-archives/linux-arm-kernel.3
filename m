Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2553D46630
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 22:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VyNaz6TnzQq6pqdp5vEpIcVyRU/KbKD0UdQlSGfMrWI=; b=s9POZO34p8QqWciEVbmJG34dcq
	mteuqWyVrZ2atdeVAjR4FjG75a3ueJ33SWbX2m49YrR/bqZIj963Ik50x8xsOHAbWcHunSvmF4KKp
	DRFyFEnqyi8r6bksOBaOCdxXmQKSbj1WNnrQrdKmZdfDgU4TmhLRVkC3FN0s8LpPQr6J0qa6v6sIV
	X3M+g6F5OQ5DNQ4IWZazCuQEMEG5byBhFIOP+bwFFF50Pyj/fFleE/M7spq9y/4smrPB2FpWNiHD8
	kjaThLbKFKF2dtrkH5J2ecnpgL4IEyB56YcOM0iGzRc8sy9YTPnVXjL4Ctz053iSdkTkNrBJIWKAG
	dFo6PgdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgVjX-0000000DH3V-3kVW;
	Thu, 15 Jan 2026 22:22:27 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgVjU-0000000DH33-1q0V;
	Thu, 15 Jan 2026 22:22:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768515744; x=1800051744;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GlSRthmmIe146YTP1TyKrEKATP5VoHXNP14ZSFLxRDI=;
  b=X7NF3ea2D2Nu76TbrvB41lZsQsXr/PgQqSKDZo2iAl0i2omU2dV3CHzu
   4bE8TXiblpi076xOy4HgdIrULDS0RD4XILIYYqtNTNSCBnVUUEiOyP+56
   QzvVTMPwmPrOUvNmlax9H98xO3QnqKnGaJ8467mXHalyMjnaghham3I44
   VCP5btvjvAZ1J8qw/nC+L8s7Wp6QVNxfa1hpG5vrKo3v2i7JtCzVu/ZcS
   RupUa7vIfCy8htJwr1YbIzEoaH1ZTkfzIOC3KgrsE8k0gm7wbrk4sU5Am
   waZBozsATJxWKW0nUkV6/iUBd/pMz9oplzEEiLLslp27UPrbMgEdBLlAQ
   A==;
X-CSE-ConnectionGUID: SeNPU4IoTwK+gB4vDOCK7Q==
X-CSE-MsgGUID: 7tdw2VC4QFe4xxwmXPHvfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="73683712"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="73683712"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 14:22:21 -0800
X-CSE-ConnectionGUID: JKJfZTyAT8SvyZZ64I1AXg==
X-CSE-MsgGUID: S39XQe80ROehLb43Zu6oZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="228127414"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Jan 2026 14:22:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgVjM-00000000K3s-0tal;
	Thu, 15 Jan 2026 22:22:16 +0000
Date: Fri, 16 Jan 2026 06:22:08 +0800
From: kernel test robot <lkp@intel.com>
To: Tzu-Hao Wei <twei@axiado.com>, SriNavmani A <srinavmani@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	Tzu-Hao Wei <twei@axiado.com>
Subject: Re: [PATCH 2/4] phy: axiado: add Axiado eMMC PHY driver
Message-ID: <202601160610.y8FbB5x1-lkp@intel.com>
References: <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-2-dd43459dbfea@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-2-dd43459dbfea@axiado.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_142224_502135_072DF39A 
X-CRM114-Status: GOOD (  11.28  )
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

Hi Tzu-Hao,

kernel test robot noticed the following build errors:

[auto build test ERROR on f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1]

url:    https://github.com/intel-lab-lkp/linux/commits/Tzu-Hao-Wei/dt-bindings-phy-axiado-ax3000-emmc-phy-add-Axiado-eMMC-PHY/20260109-174938
base:   f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
patch link:    https://lore.kernel.org/r/20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-2-dd43459dbfea%40axiado.com
patch subject: [PATCH 2/4] phy: axiado: add Axiado eMMC PHY driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260116/202601160610.y8FbB5x1-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601160610.y8FbB5x1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601160610.y8FbB5x1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/big_endian.h:14,
                    from include/linux/byteorder/big_endian.h:5,
                    from arch/m68k/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/m68k/include/asm/bitops.h:569,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from arch/m68k/include/asm/processor.h:11,
                    from include/linux/sched.h:13,
                    from include/linux/delay.h:13,
                    from drivers/phy/axiado/phy-axiado-emmc.c:11:
   drivers/phy/axiado/phy-axiado-emmc.c: In function 'axiado_emmc_phy_power_on':
>> drivers/phy/axiado/phy-axiado-emmc.c:69:34: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      69 | #define OTAP_SEL(x)             (FIELD_PREP(OTAP_SEL_MASK, x) | OTAPDLY_EN)
         |                                  ^~~~~~~~~~
   include/uapi/linux/swab.h:118:38: note: in definition of macro '__swab32'
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |                                      ^
   include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^~~~~~~~~~~~~
   arch/m68k/include/asm/io_mm.h:373:26: note: in expansion of macro 'out_le32'
     373 | #define writel(val,addr) out_le32((addr),(val))
         |                          ^~~~~~~~
   drivers/phy/axiado/phy-axiado-emmc.c:147:9: note: in expansion of macro 'writel'
     147 |         writel(val | OTAP_SEL(OTAP_DLY), ax_phy->reg_base + PHY_CTRL_2);
         |         ^~~~~~
   drivers/phy/axiado/phy-axiado-emmc.c:147:22: note: in expansion of macro 'OTAP_SEL'
     147 |         writel(val | OTAP_SEL(OTAP_DLY), ax_phy->reg_base + PHY_CTRL_2);
         |                      ^~~~~~~~


vim +/FIELD_PREP +69 drivers/phy/axiado/phy-axiado-emmc.c

  > 11	#include <linux/delay.h>
    12	#include <linux/io.h>
    13	#include <linux/iopoll.h>
    14	#include <linux/module.h>
    15	#include <linux/of.h>
    16	#include <linux/phy/phy.h>
    17	#include <linux/platform_device.h>
    18	
    19	/* Arasan eMMC 5.1 - PHY configuration registers */
    20	#define CAP_REG_IN_S1_LSB		0x00
    21	#define CAP_REG_IN_S1_MSB		0x04
    22	#define PHY_CTRL_1			0x38
    23	#define PHY_CTRL_2			0x3C
    24	#define PHY_CTRL_3			0x40
    25	#define STATUS				0x50
    26	
    27	#define DLL_ENBL	BIT(26)
    28	#define RTRIM_EN	BIT(21)
    29	#define PDB_ENBL	BIT(23)
    30	#define RETB_ENBL	BIT(1)
    31	
    32	#define REN_STRB	BIT(27)
    33	#define REN_CMD		BIT(12)
    34	#define REN_DAT0	BIT(13)
    35	#define REN_DAT1	BIT(14)
    36	#define REN_DAT2	BIT(15)
    37	#define REN_DAT3	BIT(16)
    38	#define REN_DAT4	BIT(17)
    39	#define REN_DAT5	BIT(18)
    40	#define REN_DAT6	BIT(19)
    41	#define REN_DAT7	BIT(20)
    42	#define REN_CMD_EN	(REN_CMD | REN_DAT0 | REN_DAT1 | REN_DAT2 | \
    43			REN_DAT3 | REN_DAT4 | REN_DAT5 | REN_DAT6 | REN_DAT7)
    44	
    45	/* Pull-UP Enable on CMD Line */
    46	#define PU_CMD		BIT(3)
    47	#define PU_DAT0		BIT(4)
    48	#define PU_DAT1		BIT(5)
    49	#define PU_DAT2		BIT(6)
    50	#define PU_DAT3		BIT(7)
    51	#define PU_DAT4		BIT(8)
    52	#define PU_DAT5		BIT(9)
    53	#define PU_DAT6		BIT(10)
    54	#define PU_DAT7		BIT(11)
    55	#define PU_CMD_EN (PU_CMD | PU_DAT0 | PU_DAT1 | PU_DAT2 | PU_DAT3 | \
    56			PU_DAT4 | PU_DAT5 | PU_DAT6 | PU_DAT7)
    57	
    58	/* Selection value for the optimum delay from 1-32 output tap lines */
    59	#define OTAP_DLY	0x02
    60	/* DLL charge pump current trim default [1000] */
    61	#define DLL_TRM_ICP	0x08
    62	/* Select the frequency range of DLL Operation */
    63	#define FRQ_SEL	0x01
    64	
    65	#define OTAP_SEL_MASK		GENMASK(10, 7)
    66	#define DLL_TRM_MASK		GENMASK(25, 22)
    67	#define DLL_FRQSEL_MASK		GENMASK(27, 25)
    68	
  > 69	#define OTAP_SEL(x)		(FIELD_PREP(OTAP_SEL_MASK, x) | OTAPDLY_EN)
    70	#define DLL_TRM(x)		(FIELD_PREP(DLL_TRM_MASK, x) | DLL_ENBL)
    71	#define DLL_FRQSEL(x)	FIELD_PREP(DLL_FRQSEL_MASK, x)
    72	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

