Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16CCC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 09:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iTG8fxlmYXAlax6nSmeXc8A6YgmKjSnnFRoCzKTT16E=; b=dv+TR/Bl+XfscIFMg9KN5oNycI
	RbsfR4hjls0YII9oKd3TyxUCEyJ+cHCCIXuiVAvBVgC1hRmaDu8/M7IejKxi48fLFqlivCoSTLi7G
	cCPPCXe2BKN9H0u+N8+J6PUqZrVbhms5IyonNPKUdWMn8L0Aa3TIRk0Thy5CD5cYb/dUSXHqJh1F8
	ieTrhK3GzUQtbovfEJL3ivVqtRCuzehTY0tJTTSci33+9UX7J/DvNkKQ+ekSgE6BN4jKexfpw1LaI
	Cydd3CsX43UYlz/phjh8kiN8+9y1HIzO7XddtrPh4DT3PW9JElX36ndlH04llLwDVeVeflYeyJ1Ui
	oIWnqnqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOHn-00000003nd5-439G;
	Tue, 04 Mar 2025 09:09:59 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOGC-00000003n5J-3RDe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 09:08:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741079301; x=1772615301;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GXuRz06hDfIRTVBK7Y7J5u3Fy/4jNuBeBSyafYInY64=;
  b=C5YWoQqxrFlXBnJEqCviSGlZtU8sxMyRIAW943RjN6TT4Bi21kWkOoq+
   AUEvs/KInq6bXX5ztwZpcNd8KE4QTpT2r2SAhUtiXcgziNnoQw58KBVZt
   QZOAxmtwCGtrVetQKwwGQG7epPV9V4a+7ee+YMRP+fuCJqqO2FcMr4QVq
   dPJq3kFf0bJ9rPzsyRKoj9IaM2H+9a1ZtMlRS8mYTtYOtgdthKrrF8OEZ
   kA3eAi1Yxf96TABpxbzniUcw0/BiqmQWvZ7nCfCdyhXr3ktREU8hWxIhi
   whQWkf8boBjYSuUUSpA1rcIZjjRx9Vq7PwEd3KwgG/2I3lkY2K050TRtT
   Q==;
X-CSE-ConnectionGUID: QmKNfZHoT8aZBeZ8NhQ3Qw==
X-CSE-MsgGUID: ENxc/ytHS5WN8TNeEq9yNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="53391439"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="53391439"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 01:08:20 -0800
X-CSE-ConnectionGUID: WsdSvD8kQSqq8xlLa15QJg==
X-CSE-MsgGUID: wBNumz0fSaSG5Y1WNX0q2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119230033"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 04 Mar 2025 01:08:16 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpOG5-000JWI-26;
	Tue, 04 Mar 2025 09:08:13 +0000
Date: Tue, 4 Mar 2025 17:07:44 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mun Yew Tham <mun.yew.tham@intel.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, patches@opensource.cirrus.com,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH 02/15] gpio: adnp: use lock guards for the I2C lock
Message-ID: <202503041612.G8O0Bdrg-lkp@intel.com>
References: <20250303-gpiochip-set-conversion-v1-2-1d5cceeebf8b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303-gpiochip-set-conversion-v1-2-1d5cceeebf8b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_010820_871128_0D9C318F 
X-CRM114-Status: GOOD (  14.30  )
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

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9778568dede2166c7bd124d473f9ec365f782935]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/gpio-74x164-use-new-line-value-setter-callbacks/20250303-212738
base:   9778568dede2166c7bd124d473f9ec365f782935
patch link:    https://lore.kernel.org/r/20250303-gpiochip-set-conversion-v1-2-1d5cceeebf8b%40linaro.org
patch subject: [PATCH 02/15] gpio: adnp: use lock guards for the I2C lock
config: x86_64-buildonly-randconfig-001-20250304 (https://download.01.org/0day-ci/archive/20250304/202503041612.G8O0Bdrg-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250304/202503041612.G8O0Bdrg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503041612.G8O0Bdrg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-adnp.c:241:8: warning: variable 'isr' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     241 |                         if (err < 0)
         |                             ^~~~~~~
   drivers/gpio/gpio-adnp.c:265:14: note: uninitialized use occurs here
     265 |                 pending &= isr & ier;
         |                            ^~~
   drivers/gpio/gpio-adnp.c:241:4: note: remove the 'if' if its condition is always false
     241 |                         if (err < 0)
         |                         ^~~~~~~~~~~~
     242 |                                 continue;
         |                                 ~~~~~~~~
   drivers/gpio/gpio-adnp.c:235:25: note: initialize the variable 'isr' to silence this warning
     235 |                 u8 changed, level, isr, ier;
         |                                       ^
         |                                        = '\0'
>> drivers/gpio/gpio-adnp.c:245:8: warning: variable 'ier' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     245 |                         if (err < 0)
         |                             ^~~~~~~
   drivers/gpio/gpio-adnp.c:265:20: note: uninitialized use occurs here
     265 |                 pending &= isr & ier;
         |                                  ^~~
   drivers/gpio/gpio-adnp.c:245:4: note: remove the 'if' if its condition is always false
     245 |                         if (err < 0)
         |                         ^~~~~~~~~~~~
     246 |                                 continue;
         |                                 ~~~~~~~~
   drivers/gpio/gpio-adnp.c:241:8: warning: variable 'ier' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     241 |                         if (err < 0)
         |                             ^~~~~~~
   drivers/gpio/gpio-adnp.c:265:20: note: uninitialized use occurs here
     265 |                 pending &= isr & ier;
         |                                  ^~~
   drivers/gpio/gpio-adnp.c:241:4: note: remove the 'if' if its condition is always false
     241 |                         if (err < 0)
         |                         ^~~~~~~~~~~~
     242 |                                 continue;
         |                                 ~~~~~~~~
   drivers/gpio/gpio-adnp.c:235:30: note: initialize the variable 'ier' to silence this warning
     235 |                 u8 changed, level, isr, ier;
         |                                            ^
         |                                             = '\0'
   3 warnings generated.


vim +241 drivers/gpio/gpio-adnp.c

   225	
   226	static irqreturn_t adnp_irq(int irq, void *data)
   227	{
   228		struct adnp *adnp = data;
   229		unsigned int num_regs, i;
   230	
   231		num_regs = 1 << adnp->reg_shift;
   232	
   233		for (i = 0; i < num_regs; i++) {
   234			unsigned int base = i << adnp->reg_shift, bit;
   235			u8 changed, level, isr, ier;
   236			unsigned long pending;
   237			int err;
   238	
   239			scoped_guard(mutex, &adnp->i2c_lock) {
   240				err = adnp_read(adnp, GPIO_PLR(adnp) + i, &level);
 > 241				if (err < 0)
   242					continue;
   243	
   244				err = adnp_read(adnp, GPIO_ISR(adnp) + i, &isr);
 > 245				if (err < 0)
   246					continue;
   247	
   248				err = adnp_read(adnp, GPIO_IER(adnp) + i, &ier);
   249				if (err < 0)
   250					continue;
   251			}
   252	
   253			/* determine pins that changed levels */
   254			changed = level ^ adnp->irq_level[i];
   255	
   256			/* compute edge-triggered interrupts */
   257			pending = changed & ((adnp->irq_fall[i] & ~level) |
   258					     (adnp->irq_rise[i] & level));
   259	
   260			/* add in level-triggered interrupts */
   261			pending |= (adnp->irq_high[i] & level) |
   262				   (adnp->irq_low[i] & ~level);
   263	
   264			/* mask out non-pending and disabled interrupts */
   265			pending &= isr & ier;
   266	
   267			for_each_set_bit(bit, &pending, 8) {
   268				unsigned int child_irq;
   269				child_irq = irq_find_mapping(adnp->gpio.irq.domain,
   270							     base + bit);
   271				handle_nested_irq(child_irq);
   272			}
   273		}
   274	
   275		return IRQ_HANDLED;
   276	}
   277	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

