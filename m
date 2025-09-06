Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42FC8CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 21:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpGvdDDzxeb87tuqFs6ccwLx+keES1rnW17BWnp2DKI=; b=Qe560BJ6dfMJ4Wxf3f17uT4zbo
	am1mDXxrEDOYOd3LJh+qjp0XGxzyitXz5j6BXSwMXvFkkJBAaI9wMBu4zA9pQUkFFN1KDCKpV83yC
	uJ8APm+I/vM3Zt3YcnJBnqbeMRXgLQ5d6PdnzmA5gsdsmvYOWchWzwQfSsQds0nEGaxHdjzXF1ipb
	n8wqLMnlD5mnl25DOzF//XgyTSWnCY9dDDesIzuNYe4rZM4O9N2Bb68xc07QuCmbrq0JR/P9lS6+2
	okT/RHAkA8td9+uEFA1P8QBTMX67Kg319qE/G7Xj6aec81PPpFP5Q88f8Z9p+y7EOutzG/YHsQwHL
	Y4Y2AxEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uv0TO-00000008UXD-0BCx;
	Sat, 06 Sep 2025 21:29:26 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uv0Qc-00000008UKs-1mIE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 21:26:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757193994; x=1788729994;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CMGs8i3Y8nSpfA6lMpvHldw8w4ip7mYjXqWISfeH/PM=;
  b=BrDAUEMgptalS0wIn9WfDHBPTgsG6PBElO2xTQQM1d8UzNUtNYFGAlkb
   kWC5CbKtW+GqadCSJINzx+HpnI3M519tjqQ+Myqrux8/C2Z/yu6oekCcE
   NqwkONNka+yZycAp0oN2t1f4mI0VPGgWKQTnfFhInHdofsq1Rdbelw0mo
   tePYYAshMJfUP7/lnaOfIYywlWaN8Drs7MvMYnrO3mxQcpD/wjYP4Vmhl
   S9pGZEMxJW0dClpE5QwABA65mQkLh4hXiUaXleImqF8rEsAZ/SIvdhA28
   ldTR3nlhV74xo+NcMCDN+UXaRU6qVf2bOnUBeABL5KXUnOSWYKn452uu2
   g==;
X-CSE-ConnectionGUID: 0fl5++JkQTm9PL8JvOfEfA==
X-CSE-MsgGUID: THU4mXbhQw6omaj8T5+/IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11545"; a="58715852"
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="58715852"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 14:26:31 -0700
X-CSE-ConnectionGUID: VbX9FkwRSrCKGheZZSUk1w==
X-CSE-MsgGUID: XHIZwNXBQuyDKp8oVdJh6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="172009225"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Sep 2025 14:26:27 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uv0QT-0001np-1W;
	Sat, 06 Sep 2025 21:26:25 +0000
Date: Sun, 7 Sep 2025 05:26:13 +0800
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
Subject: Re: [PATCH v3 4/4] irqchip/aspeed-scu-ic: Add support AST2700 SCU
 interrupt controllers
Message-ID: <202509070538.5HcCJf2T-lkp@intel.com>
References: <20250906014846.861368-5-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250906014846.861368-5-ryan_chen@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_142634_478542_84D18F19 
X-CRM114-Status: GOOD (  13.61  )
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
patch link:    https://lore.kernel.org/r/20250906014846.861368-5-ryan_chen%40aspeedtech.com
patch subject: [PATCH v3 4/4] irqchip/aspeed-scu-ic: Add support AST2700 SCU interrupt controllers
config: arm-randconfig-001-20250906 (https://download.01.org/0day-ci/archive/20250907/202509070538.5HcCJf2T-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7fb1dc08d2f025aad5777bb779dfac1197e9ef87)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250907/202509070538.5HcCJf2T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509070538.5HcCJf2T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/irqchip/irq-aspeed-scu-ic.c:93:34: warning: variable 'mask' is uninitialized when used here [-Wuninitialized]
      93 |                 writel((readl(scu_ic->base) & ~mask) |
         |                                                ^~~~
   drivers/irqchip/irq-aspeed-scu-ic.c:69:24: note: initialize the variable 'mask' to silence this warning
      69 |         unsigned int sts, mask;
         |                               ^
         |                                = 0
>> drivers/irqchip/irq-aspeed-scu-ic.c:106:20: warning: variable 'mask' set but not used [-Wunused-but-set-variable]
     106 |         unsigned int sts, mask;
         |                           ^
   2 warnings generated.


vim +/mask +106 drivers/irqchip/irq-aspeed-scu-ic.c

   100	
   101	static void aspeed_scu_ic_irq_handler_split(struct irq_desc *desc)
   102	{
   103		struct aspeed_scu_ic *scu_ic = irq_desc_get_handler_data(desc);
   104		struct irq_chip *chip = irq_desc_get_chip(desc);
   105		unsigned long bit, enabled, max, status;
 > 106		unsigned int sts, mask;
   107	
   108		chained_irq_enter(chip, desc);
   109	
   110		mask = scu_ic->irq_enable;
   111		sts = readl(scu_ic->base + scu_ic->isr);
   112		enabled = sts & scu_ic->irq_enable;
   113		sts = readl(scu_ic->base + scu_ic->isr);
   114		status = sts & enabled;
   115	
   116		bit = scu_ic->irq_shift;
   117		max = scu_ic->num_irqs + bit;
   118	
   119		for_each_set_bit_from(bit, &status, max) {
   120			generic_handle_domain_irq(scu_ic->irq_domain, bit - scu_ic->irq_shift);
   121			writel(BIT(bit), scu_ic->base + scu_ic->isr); // clear interrupt
   122		}
   123	
   124		chained_irq_exit(chip, desc);
   125	}
   126	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

