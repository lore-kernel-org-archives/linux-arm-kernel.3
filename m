Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0251CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 17:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QeLnel44jgOiYNiaqvGTFJsZYpBvv9pN2W15LbKBpBs=; b=zfQxwurXeCWLu8jJoz4exg8QOz
	AFi7SZDPjMt/PfStkeT0qcJIeArLsh1VB9HU6TDM8XK15J549U1/xc80YQIG0D8dfO4YPsa89iYfq
	BOZzjlf3ovR/auQBCAbGKN5p/fFH+q9bM5xyyyLfqVTu8+FNfRGfM7okJ7HR8R4r0Yad1WmdtdwTR
	Zcqp6aftl0NmRzNt7eHDrK84odkv2/j55d7G2nRpcuxr6z583b7ar9Lf6npoowPMYAuD+gdFZ4Rvw
	tB/Df5vpqLojCm9DJFXsng/kHluuMIjYmig1lY/s1GkhPmV18qR+y8mwRaJ++XyO9wwREI0TKNK9p
	9YgJephA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuwWG-00000008B5r-1Spj;
	Sat, 06 Sep 2025 17:16:08 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuwTR-00000008Arh-1B6t
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 17:13:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757178794; x=1788714794;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mv/Y3kvQFgparfIlQNQwNiMV1wrcDKs1S8/YH+Ac6po=;
  b=PexXLg99DL8eReMnD6xcW0xDZhsQgmVnsByH0yoGABYhMzbgMKY+6Cjz
   6lA9hlWsJvbljte4g4W6X7ATBjDlRrnk+xKF4vpp4GtQk9R1Vgfh87JzM
   0Nm/l14Jor0njexWG8LYMj2ZRL0xNe4TtJZidgOMzrZgZXqd3tDA5S9z4
   NQnBvJ3Q0XtYGlkogTZYtxTjndBoql8Yorx/ysC6mWqdVMrnJEEyFOJJV
   omkJQ21r2BMiODipCtlbmYFVRH8lIcRTBEF+1h/Zot4oaE3Mgx1c97a+c
   bRZCYZ0YsSsRenUn89/Bf7VtETC2PxtR7D0TpKVId1IxM+C035N9E1lpE
   g==;
X-CSE-ConnectionGUID: Di5oHj3cQQK11uc7tJ0fyQ==
X-CSE-MsgGUID: GjYFfv8MTT2XHee3l5NKJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11545"; a="70926737"
X-IronPort-AV: E=Sophos;i="6.18,244,1751266800"; 
   d="scan'208";a="70926737"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 10:13:11 -0700
X-CSE-ConnectionGUID: 3WS+ZCjMTFaHD/3JOA6TTw==
X-CSE-MsgGUID: 0iif958RTK6QdgJj0vJWIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,244,1751266800"; 
   d="scan'208";a="172298134"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Sep 2025 10:13:07 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuwTI-0001g7-1o;
	Sat, 06 Sep 2025 17:13:04 +0000
Date: Sun, 7 Sep 2025 01:12:31 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>,
	Eddie James <eajames@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Lee Jones <lee@kernel.org>, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 1/4] irqchip/aspeed-scu-ic: Refactor driver to support
 variant-based initialization
Message-ID: <202509070058.3Z4AtICl-lkp@intel.com>
References: <20250906014846.861368-2-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250906014846.861368-2-ryan_chen@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_101313_394645_BC8EE0ED 
X-CRM114-Status: GOOD (  17.36  )
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

Hi Ryan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/irq/core]
[also build test WARNING on robh/for-next lee-mfd/for-mfd-next lee-mfd/for-mfd-fixes linus/master v6.17-rc4 next-20250905]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/irqchip-aspeed-scu-ic-Refactor-driver-to-support-variant-based-initialization/20250906-095043
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20250906014846.861368-2-ryan_chen%40aspeedtech.com
patch subject: [PATCH v3 1/4] irqchip/aspeed-scu-ic: Refactor driver to support variant-based initialization
config: arm-randconfig-001-20250906 (https://download.01.org/0day-ci/archive/20250907/202509070058.3Z4AtICl-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7fb1dc08d2f025aad5777bb779dfac1197e9ef87)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250907/202509070058.3Z4AtICl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509070058.3Z4AtICl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-aspeed-scu-ic.c:79:34: warning: variable 'mask' is uninitialized when used here [-Wuninitialized]
      79 |                 writel((readl(scu_ic->base) & ~mask) |
         |                                                ^~~~
   drivers/irqchip/irq-aspeed-scu-ic.c:55:24: note: initialize the variable 'mask' to silence this warning
      55 |         unsigned int sts, mask;
         |                               ^
         |                                = 0
   1 warning generated.


vim +/mask +79 drivers/irqchip/irq-aspeed-scu-ic.c

    49	
    50	static void aspeed_scu_ic_irq_handler(struct irq_desc *desc)
    51	{
    52		struct aspeed_scu_ic *scu_ic = irq_desc_get_handler_data(desc);
    53		struct irq_chip *chip = irq_desc_get_chip(desc);
    54		unsigned long bit, enabled, max, status;
    55		unsigned int sts, mask;
    56	
    57		chained_irq_enter(chip, desc);
    58	
    59		/*
    60		 * The SCU IC has just one register to control its operation and read
    61		 * status. The interrupt enable bits occupy the lower 16 bits of the
    62		 * register, while the interrupt status bits occupy the upper 16 bits.
    63		 * The status bit for a given interrupt is always 16 bits shifted from
    64		 * the enable bit for the same interrupt.
    65		 * Therefore, perform the IRQ operations in the enable bit space by
    66		 * shifting the status down to get the mapping and then back up to
    67		 * clear the bit.
    68		 */
    69		sts = readl(scu_ic->base);
    70		enabled = sts & scu_ic->irq_enable;
    71		status = (sts >> ASPEED_SCU_IC_STATUS_SHIFT) & enabled;
    72	
    73		bit = scu_ic->irq_shift;
    74		max = scu_ic->num_irqs + bit;
    75	
    76		for_each_set_bit_from(bit, &status, max) {
    77			generic_handle_domain_irq(scu_ic->irq_domain,
    78						  bit - scu_ic->irq_shift);
  > 79			writel((readl(scu_ic->base) & ~mask) |
    80			       BIT(bit + ASPEED_SCU_IC_STATUS_SHIFT),
    81			       scu_ic->base);
    82		}
    83	
    84		chained_irq_exit(chip, desc);
    85	}
    86	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

