Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B09CA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 04:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+QCQHoHMZMKL4gCByhn+RUDlkHZshjMLMIJ1PFBFVo=; b=fFZdGJGxEDTIHgNWiXKDRkInNc
	ZYdrMnsjqwfi/Z6WWYSjARdiG93JYSflHS0ISzfFr8tWL69WMrhsx/2aHuVmQj1+0jkQZJM9vApWu
	1y3eogkA149qTNA4jfKUA3FFw2Lu9OjLx13AAQGJ25QIcHV3PqWcUKO1N+CEBTR53roMIFgzVBx7A
	xXmYcXR+ZrKk15/TaeCps12Tm/Wgm9ufOUJd/mcBdZmY4eWRwBNIH5oxTQE0l66p2rrEjPq8TPXRf
	dF69g0Br+8qIVZoUybSIKKtsaRbkyFdPMHbkZMYZxvUQVxdH7LtE/0HMu66EvZqDrc1TjhCdy7Aqq
	nPPs+gFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoE9s-00000009Npw-0lZB;
	Tue, 19 Aug 2025 04:41:16 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoE7G-00000009Nlm-0Nzj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 04:38:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755578314; x=1787114314;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fX1fDtkJlgXe21ThnDLJ12QhRuLIMPpV4e+3sPurSW0=;
  b=UxwsOZ1ulEZYVQIiVzewu33WAQcTwICFFB9AIRLG/YjXQDXUlLqRGFzC
   Ie1ADYwBltMu2Nhr5WXpxhFSiUSG0/ph77cS8I524/5XK6VcnKKreHoDS
   yvRtg0F9KxzQH1U3jlaD9GVZLy2DgS/mGcoWZ6vUdtAesYCxCtGKvna/d
   DaUpiy86JDdcfsl2vEG0Xrsr6iwNG3V5fUPRNIMi01gIYrVlDTNoP06Q9
   EdKL660xpWOgJhjyE97URmsqTVa/aiv/2+QvNvhXcqzD3d6Lcb60imyVv
   QL+Yx3MLsU78U3XpMhTvpUXWYgIFYV3pwgXzTWzfLsjyeTOe7/WkOTHof
   g==;
X-CSE-ConnectionGUID: SWDnuV0pSq+zAIcjglupSw==
X-CSE-MsgGUID: GKhQCyfqTRu6+XnaHBo64g==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57882453"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="57882453"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 21:38:33 -0700
X-CSE-ConnectionGUID: xr1bnbrgSICKne4JN1ZibA==
X-CSE-MsgGUID: Zwnm0lBgRl6z9KTr/9UVMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="166981588"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 18 Aug 2025 21:38:29 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoE78-000GVn-2D;
	Tue, 19 Aug 2025 04:38:26 +0000
Date: Tue, 19 Aug 2025 12:38:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jacky Bai <ping.bai@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Jacky Bai <ping.bai@nxp.com>
Subject: Re: [PATCH v3 3/4] thermal: qoriq: workaround unexpected temperature
 readings from tmu
Message-ID: <202508191258.tYXB63eu-lkp@intel.com>
References: <20250818-imx93_tmu-v3-3-35f79a86c072@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818-imx93_tmu-v3-3-35f79a86c072@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_213834_176665_B90DCAE5 
X-CRM114-Status: GOOD (  12.63  )
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

Hi Jacky,

kernel test robot noticed the following build errors:

[auto build test ERROR on b9ddaa95fd283bce7041550ddbbe7e764c477110]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacky-Bai/dt-bindings-thermal-qoriq-Add-compatible-string-for-imx93/20250818-173822
base:   b9ddaa95fd283bce7041550ddbbe7e764c477110
patch link:    https://lore.kernel.org/r/20250818-imx93_tmu-v3-3-35f79a86c072%40nxp.com
patch subject: [PATCH v3 3/4] thermal: qoriq: workaround unexpected temperature readings from tmu
config: riscv-randconfig-001-20250819 (https://download.01.org/0day-ci/archive/20250819/202508191258.tYXB63eu-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250819/202508191258.tYXB63eu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508191258.tYXB63eu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/thermal/qoriq_thermal.c:8:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:804:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     804 |         insb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:104:53: note: expanded from macro 'insb'
     104 | #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/thermal/qoriq_thermal.c:8:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:812:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     812 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
     105 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/thermal/qoriq_thermal.c:8:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:820:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     820 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
     106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/thermal/qoriq_thermal.c:8:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:829:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     829 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
     118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/thermal/qoriq_thermal.c:8:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:838:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     838 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
     119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/thermal/qoriq_thermal.c:8:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:847:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     847 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
     120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/thermal/qoriq_thermal.c:8:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/thermal/qoriq_thermal.c:281:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     281 |                              FIELD_PREP(TMRTRCTR_TEMP_MASK, 0x7));
         |                              ^
   7 warnings and 1 error generated.


vim +/FIELD_PREP +281 drivers/thermal/qoriq_thermal.c

   264	
   265	static void qoriq_tmu_init_device(struct qoriq_tmu_data *data)
   266	{
   267		/* Disable interrupt, using polling instead */
   268		regmap_write(data->regmap, REGS_TIER, TIER_DISABLE);
   269	
   270		/* Set update_interval */
   271		if (data->ver == TMU_VER1) {
   272			regmap_write(data->regmap, REGS_TMTMIR, TMTMIR_DEFAULT);
   273		} else {
   274			regmap_write(data->regmap, REGS_V2_TMTMIR, TMTMIR_DEFAULT);
   275			regmap_write(data->regmap, REGS_V2_TEUMR(0), GET_TEUMR0(data->drvdata));
   276		}
   277	
   278		/* ERR052243: Set the raising & falling edge monitor */
   279		if (CHECK_ERRATA_FLAG(data->drvdata, TMU_ERR052243)) {
   280			regmap_write(data->regmap, TMRTRCTR, TMRTRCTR_EN |
 > 281				     FIELD_PREP(TMRTRCTR_TEMP_MASK, 0x7));
   282			regmap_write(data->regmap, TMFTRCTR, TMFTRCTR_EN |
   283				     FIELD_PREP(TMFTRCTR_TEMP_MASK, 0x7));
   284	
   285		}
   286		/* Disable monitoring */
   287		regmap_write(data->regmap, REGS_TMR, TMR_DISABLE);
   288	}
   289	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

