Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64737E6749A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 04:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o0S5jPcyr4qMUNF+3OzJ3SiZ3q2w7OwmMlYW9YOxQoY=; b=F/zzZiQJo2o/uIWOzKIGSs31eq
	eawp5PJyDnBOx8ritKrCZOBuW6+iL8BjPZ7m+VVF33Z9K2gs7qxASCEZoqench/nHBWMJ8PkKUCis
	iWrbJdwDX9eifLIRnp/a9Atn18kGj/KVbciwFrUYiJ+L1MdGG1c7nwtSgNBhm+zdU6DgxLOqI2y6X
	b3tEn1Yn0n4R4Dt8x7OUqGuwcD2UdIsA1olj8xpK3ZCyKAk4+5GZzxrIzCZ6aTM6bU/VboDEu1A1V
	tCCCUr5YZZnsTUhPyPcNhpv1ID5GWUrJUINupcTIFmPjJOP+ku9QhRSrfEkwUXncgOIVTTMG6jGPV
	XZJ4JhnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6j5r-00000005jp8-2CX7;
	Fri, 01 Nov 2024 04:17:03 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6j48-00000005ja4-46bt;
	Fri, 01 Nov 2024 04:15:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730434517; x=1761970517;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VJA0AjiK6NmricA4WfL9xHrUVhSflUDFGoIEBijSa3M=;
  b=BnzjbXxFeoGaxv+Os+jm3hCFaKpbrOFCdx83WLE/ERs8PaQ3oI29XJs2
   p168ToNj1I+iyVtT8bNkCmtJubZORKp/haGUIteYLlBwJXdNC4HtYu2rd
   VwjOzXW3QRi7jMaD0d5Ebx6CDdMwXneOug4D2mQxDvljXYgSJ71PyEQyi
   iwC/Dhr7wFWE0gG5n9U3J3ZVTbDtcECYnwMoYExQFi5bJALmzzIuqlYhC
   Y9vpoEiCKbKnFI6ZNgqjihfkxruyCOXXj6XAbGlYp9sBIqIG0u/SDgQxO
   AVYJw0jD327geLSYOKOMPwZGPG6dAT3ZRmVMJb0eD4c75nraIQhaiTGs1
   Q==;
X-CSE-ConnectionGUID: InTiaZqhQzi+1zJ05djl2Q==
X-CSE-MsgGUID: E3s5utnBRiqPa01BJrRIiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="30414502"
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="30414502"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 21:15:13 -0700
X-CSE-ConnectionGUID: cFVYI5qoQiaeYqRZHIqwSw==
X-CSE-MsgGUID: keQXpCkbQTeVGDbcHGrUGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="82524144"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Oct 2024 21:15:06 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6j3w-000h7d-1T;
	Fri, 01 Nov 2024 04:15:04 +0000
Date: Fri, 1 Nov 2024 12:14:33 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 07/12] clk: rp1: Add support for clocks provided by RP1
Message-ID: <202411011129.wmWcuU9Z-lkp@intel.com>
References: <c20e3d6d87c71691b149cdeeafc94009953346b2.1730123575.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c20e3d6d87c71691b149cdeeafc94009953346b2.1730123575.git.andrea.porta@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_211517_130624_32C08ED9 
X-CRM114-Status: GOOD (  14.95  )
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

Hi Andrea,

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus robh/for-next linus/master v6.12-rc5]
[cannot apply to next-20241031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrea-della-Porta/dt-bindings-clock-Add-RaspberryPi-RP1-clock-bindings/20241028-221122
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/c20e3d6d87c71691b149cdeeafc94009953346b2.1730123575.git.andrea.porta%40suse.com
patch subject: [PATCH v3 07/12] clk: rp1: Add support for clocks provided by RP1
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241101/202411011129.wmWcuU9Z-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411011129.wmWcuU9Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411011129.wmWcuU9Z-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/clk/clk-rp1.c:9:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
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
   In file included from drivers/clk/clk-rp1.c:9:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/clk/clk-rp1.c:9:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
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
>> drivers/clk/clk-rp1.c:621:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     621 |         FIELD_SET(prim, PLL_PRIM_DIV1_MASK, prim_div1);
         |         ^
   drivers/clk/clk-rp1.c:399:12: note: expanded from macro 'FIELD_SET'
     399 |         (_reg) |= FIELD_PREP(mask, (_val));     \
         |                   ^
   drivers/clk/clk-rp1.c:622:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     622 |         FIELD_SET(prim, PLL_PRIM_DIV2_MASK, prim_div2);
         |         ^
   drivers/clk/clk-rp1.c:399:12: note: expanded from macro 'FIELD_SET'
     399 |         (_reg) |= FIELD_PREP(mask, (_val));     \
         |                   ^
   drivers/clk/clk-rp1.c:767:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     767 |         FIELD_SET(sec, PLL_SEC_DIV_MASK, div);
         |         ^
   drivers/clk/clk-rp1.c:399:12: note: expanded from macro 'FIELD_SET'
     399 |         (_reg) |= FIELD_PREP(mask, (_val));     \
         |                   ^
   drivers/clk/clk-rp1.c:948:3: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     948 |                 FIELD_SET(ctrl, CLK_CTRL_AUXSRC_MASK, index - data->num_std_parents);
         |                 ^
   drivers/clk/clk-rp1.c:399:12: note: expanded from macro 'FIELD_SET'
     399 |         (_reg) |= FIELD_PREP(mask, (_val));     \
         |                   ^
   6 warnings and 4 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/FIELD_PREP +621 drivers/clk/clk-rp1.c

   607	
   608	static int rp1_pll_set_rate(struct clk_hw *hw,
   609				    unsigned long rate, unsigned long parent_rate)
   610	{
   611		struct rp1_clk_desc *pll = container_of(hw, struct rp1_clk_desc, hw);
   612		struct rp1_clockman *clockman = pll->clockman;
   613		const struct rp1_pll_data *data = pll->data;
   614	
   615		u32 prim, prim_div1, prim_div2;
   616	
   617		get_pll_prim_dividers(rate, parent_rate, &prim_div1, &prim_div2);
   618	
   619		spin_lock(&clockman->regs_lock);
   620		prim = clockman_read(clockman, data->ctrl_reg);
 > 621		FIELD_SET(prim, PLL_PRIM_DIV1_MASK, prim_div1);
   622		FIELD_SET(prim, PLL_PRIM_DIV2_MASK, prim_div2);
   623		clockman_write(clockman, data->ctrl_reg, prim);
   624		spin_unlock(&clockman->regs_lock);
   625	
   626		return 0;
   627	}
   628	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

