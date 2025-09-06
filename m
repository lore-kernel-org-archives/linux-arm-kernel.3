Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13F6CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 16:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lEzEp4cxcXJVthqMH6SVNhJ6+RkBt+M0FVkeZIoAjOM=; b=i/W2mHZdaD8DCKmoCJeEjULP4V
	rNoVxwU7ztxqxmohbfFcgTVblHi7XaX/B601OITK2irCnTcp4TrpscXK/+ZuQa3NZyNivnZM8j44c
	5cX0XHK6/TEPX+JGm0buDvArsK95N34MP6gwUMt0j1UuH1HkqtXj3yZSRLG7yJ7P3ibhBvKpfSViV
	YDG2WIVYckcl+crw3zhDfUUwtElsJU+vFOAZrNQV3yKKIBEYq4mtH6aj/Dt/mneSREEoqRxhtOyXq
	8W31P50Sj3cCQjd+nuXzX00SY98g8NUQ+s2h9rtY+l9A3ZyL/NcLGguYvrsj4Hj5SBWJOHebVBljx
	sfyt5Qsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuwAA-000000089pm-2WJL;
	Sat, 06 Sep 2025 16:53:18 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuvKg-000000084le-04rD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 16:00:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757174406; x=1788710406;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WUhsfst+t0XA7eALQAuAAQ1QqyE/1cJqSc+0vKr5M+8=;
  b=jPk3COqEdqVvsXJAXCJKNGCV7vw+IBaSIp2V9ERQd66Ler8bkS4iocDE
   r2C2OkOAhnedoKfJT/+AolisIn3vBYjZg8WNJ/wy2m9HQoZhYpuQXTJqh
   mzVRQ0QsmBLR0CkDpyVH5qQqiY915MiVCrS4i7RbMSOCNBoPnjepkRl5E
   3fRe1ijDOS63WKyX81QupcELo95nhS35UKLVkD8t+aBxxIdWKP8bXGefQ
   mGorolIBAQxejfc2e7M5dJ7U4nkx96N9SGGN1w7dt4HmpcVUY8gDGtVmm
   meMQsHaaMNTQwbsW9FCA+UsS6cUVbtkX4nvs0VNyJqC6ueiJ9nMSU1yYU
   g==;
X-CSE-ConnectionGUID: jpgTgzL6TxOKoqtnRuQLmg==
X-CSE-MsgGUID: fcsRltE7TfyeLgvSHtVTGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11545"; a="63135064"
X-IronPort-AV: E=Sophos;i="6.18,244,1751266800"; 
   d="scan'208";a="63135064"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 09:00:04 -0700
X-CSE-ConnectionGUID: /80grLjnS9W6VoqG2YW13A==
X-CSE-MsgGUID: gvZKXpPfS72uzbhb/gOiQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,244,1751266800"; 
   d="scan'208";a="172513740"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Sep 2025 08:59:59 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuvKW-0001bD-0V;
	Sat, 06 Sep 2025 15:59:56 +0000
Date: Sat, 6 Sep 2025 23:59:38 +0800
From: kernel test robot <lkp@intel.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>, lee@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
	andrew@codeconstruct.com.au, linus.walleij@linaro.org,
	brgl@bgdev.pl, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org, BMC-SW@aspeedtech.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 3/4] pinctrl: aspeed: Add AST2700 pinmux support
Message-ID: <202509062340.wX64fW0j-lkp@intel.com>
References: <20250904103401.88287-4-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904103401.88287-4-billy_tsai@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_090006_163967_F48091D9 
X-CRM114-Status: GOOD (  13.77  )
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

Hi Billy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next robh/for-next lee-leds/for-leds-next linus/master v6.17-rc4 next-20250905]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Billy-Tsai/dt-bindings-mfd-aspeed-ast2x00-scu-Support-ast2700-pinctrl/20250904-184115
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20250904103401.88287-4-billy_tsai%40aspeedtech.com
patch subject: [PATCH v2 3/4] pinctrl: aspeed: Add AST2700 pinmux support
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20250906/202509062340.wX64fW0j-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250906/202509062340.wX64fW0j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509062340.wX64fW0j-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pinctrl/aspeed/pinctrl-aspeed.h:15,
                    from drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c:18:
>> drivers/pinctrl/aspeed/pinmux-aspeed.h:741:26: warning: 'group_pins_LTPI_I2C3' defined but not used [-Wunused-const-variable=]
     741 | #define GROUP_SYM(group) group_pins_ ## group
         |                          ^~~~~~~~~~~
   drivers/pinctrl/aspeed/pinmux-aspeed.h:743:26: note: in expansion of macro 'GROUP_SYM'
     743 |         static const int GROUP_SYM(group)[] = { __VA_ARGS__ }
         |                          ^~~~~~~~~
   drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c:479:1: note: in expansion of macro 'GROUP_DECL'
     479 | GROUP_DECL(LTPI_I2C3, J9, J10);
         | ^~~~~~~~~~
>> drivers/pinctrl/aspeed/pinmux-aspeed.h:741:26: warning: 'group_pins_LTPI_I2C2' defined but not used [-Wunused-const-variable=]
     741 | #define GROUP_SYM(group) group_pins_ ## group
         |                          ^~~~~~~~~~~
   drivers/pinctrl/aspeed/pinmux-aspeed.h:743:26: note: in expansion of macro 'GROUP_SYM'
     743 |         static const int GROUP_SYM(group)[] = { __VA_ARGS__ }
         |                          ^~~~~~~~~
   drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c:478:1: note: in expansion of macro 'GROUP_DECL'
     478 | GROUP_DECL(LTPI_I2C2, H10, H11);
         | ^~~~~~~~~~
>> drivers/pinctrl/aspeed/pinmux-aspeed.h:741:26: warning: 'group_pins_LTPI_I2C1' defined but not used [-Wunused-const-variable=]
     741 | #define GROUP_SYM(group) group_pins_ ## group
         |                          ^~~~~~~~~~~
   drivers/pinctrl/aspeed/pinmux-aspeed.h:743:26: note: in expansion of macro 'GROUP_SYM'
     743 |         static const int GROUP_SYM(group)[] = { __VA_ARGS__ }
         |                          ^~~~~~~~~
   drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c:477:1: note: in expansion of macro 'GROUP_DECL'
     477 | GROUP_DECL(LTPI_I2C1, H8, H9);
         | ^~~~~~~~~~
>> drivers/pinctrl/aspeed/pinmux-aspeed.h:741:26: warning: 'group_pins_LTPI_I2C0' defined but not used [-Wunused-const-variable=]
     741 | #define GROUP_SYM(group) group_pins_ ## group
         |                          ^~~~~~~~~~~
   drivers/pinctrl/aspeed/pinmux-aspeed.h:743:26: note: in expansion of macro 'GROUP_SYM'
     743 |         static const int GROUP_SYM(group)[] = { __VA_ARGS__ }
         |                          ^~~~~~~~~
   drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c:476:1: note: in expansion of macro 'GROUP_DECL'
     476 | GROUP_DECL(LTPI_I2C0, G11, H7);
         | ^~~~~~~~~~


vim +/group_pins_LTPI_I2C3 +741 drivers/pinctrl/aspeed/pinmux-aspeed.h

efa5623981b72f Andrew Jeffery 2019-06-28  655  
7b388970816665 Andrew Jeffery 2019-07-29  656  #define PIN_DECL_(pin, ...) \
efa5623981b72f Andrew Jeffery 2019-06-28  657  	static const struct aspeed_sig_expr **PIN_EXPRS_SYM(pin)[] = \
efa5623981b72f Andrew Jeffery 2019-06-28  658  		{ __VA_ARGS__, NULL }; \
efa5623981b72f Andrew Jeffery 2019-06-28  659  	static const struct aspeed_pin_desc PIN_SYM(pin) = \
efa5623981b72f Andrew Jeffery 2019-06-28  660  		{ #pin, PIN_EXPRS_PTR(pin) }
efa5623981b72f Andrew Jeffery 2019-06-28  661  
efa5623981b72f Andrew Jeffery 2019-06-28  662  /**
efa5623981b72f Andrew Jeffery 2019-06-28  663   * Declare a single signal pin
efa5623981b72f Andrew Jeffery 2019-06-28  664   *
efa5623981b72f Andrew Jeffery 2019-06-28  665   * @pin: The pin number
efa5623981b72f Andrew Jeffery 2019-06-28  666   * @other: Macro name for "other" functionality (subjected to stringification)
efa5623981b72f Andrew Jeffery 2019-06-28  667   * @sig: Macro name for the signal (subjected to stringification)
efa5623981b72f Andrew Jeffery 2019-06-28  668   *
efa5623981b72f Andrew Jeffery 2019-06-28  669   * For example:
efa5623981b72f Andrew Jeffery 2019-06-28  670   *
efa5623981b72f Andrew Jeffery 2019-06-28  671   *     #define E3 80
efa5623981b72f Andrew Jeffery 2019-06-28  672   *     SIG_EXPR_LIST_DECL_SINGLE(SCL5, I2C5, I2C5_DESC);
7b388970816665 Andrew Jeffery 2019-07-29  673   *     PIN_DECL_1(E3, GPIOK0, SCL5);
efa5623981b72f Andrew Jeffery 2019-06-28  674   */
7b388970816665 Andrew Jeffery 2019-07-29  675  #define PIN_DECL_1(pin, other, sig) \
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  676  	SIG_EXPR_LIST_DECL_SESG(pin, other, other); \
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  677  	PIN_DECL_(pin, SIG_EXPR_LIST_PTR(pin, sig), \
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  678  		  SIG_EXPR_LIST_PTR(pin, other))
efa5623981b72f Andrew Jeffery 2019-06-28  679  
efa5623981b72f Andrew Jeffery 2019-06-28  680  /**
efa5623981b72f Andrew Jeffery 2019-06-28  681   * Single signal, single function pin declaration
efa5623981b72f Andrew Jeffery 2019-06-28  682   *
efa5623981b72f Andrew Jeffery 2019-06-28  683   * @pin: The pin number
efa5623981b72f Andrew Jeffery 2019-06-28  684   * @other: Macro name for "other" functionality (subjected to stringification)
efa5623981b72f Andrew Jeffery 2019-06-28  685   * @sig: Macro name for the signal (subjected to stringification)
efa5623981b72f Andrew Jeffery 2019-06-28  686   * @...: Signal descriptors that define the function expression
efa5623981b72f Andrew Jeffery 2019-06-28  687   *
efa5623981b72f Andrew Jeffery 2019-06-28  688   * For example:
efa5623981b72f Andrew Jeffery 2019-06-28  689   *
efa5623981b72f Andrew Jeffery 2019-06-28  690   *    SSSF_PIN_DECL(A4, GPIOA2, TIMER3, SIG_DESC_SET(SCU80, 2));
efa5623981b72f Andrew Jeffery 2019-06-28  691   */
efa5623981b72f Andrew Jeffery 2019-06-28  692  #define SSSF_PIN_DECL(pin, other, sig, ...) \
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  693  	SIG_EXPR_LIST_DECL_SESG(pin, sig, sig, __VA_ARGS__); \
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  694  	SIG_EXPR_LIST_DECL_SESG(pin, other, other); \
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  695  	PIN_DECL_(pin, SIG_EXPR_LIST_PTR(pin, sig), \
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  696  		  SIG_EXPR_LIST_PTR(pin, other)); \
efa5623981b72f Andrew Jeffery 2019-06-28  697  	FUNC_GROUP_DECL(sig, pin)
27d1f73670774e Andrew Jeffery 2019-07-29  698  /**
27d1f73670774e Andrew Jeffery 2019-07-29  699   * Declare a two-signal pin
27d1f73670774e Andrew Jeffery 2019-07-29  700   *
27d1f73670774e Andrew Jeffery 2019-07-29  701   * @pin: The pin number
27d1f73670774e Andrew Jeffery 2019-07-29  702   * @other: Macro name for "other" functionality (subjected to stringification)
27d1f73670774e Andrew Jeffery 2019-07-29  703   * @high: Macro name for the highest priority signal functions
27d1f73670774e Andrew Jeffery 2019-07-29  704   * @low: Macro name for the low signal functions
27d1f73670774e Andrew Jeffery 2019-07-29  705   *
27d1f73670774e Andrew Jeffery 2019-07-29  706   * For example:
27d1f73670774e Andrew Jeffery 2019-07-29  707   *
27d1f73670774e Andrew Jeffery 2019-07-29  708   *     #define A8 56
27d1f73670774e Andrew Jeffery 2019-07-29  709   *     SIG_EXPR_DECL(ROMD8, ROM16, SIG_DESC_SET(SCU90, 6));
27d1f73670774e Andrew Jeffery 2019-07-29  710   *     SIG_EXPR_DECL(ROMD8, ROM16S, SIG_DESC_SET(HW_STRAP1, 4),
27d1f73670774e Andrew Jeffery 2019-07-29  711   *              { HW_STRAP1, GENMASK(1, 0), 0, 0 });
27d1f73670774e Andrew Jeffery 2019-07-29  712   *     SIG_EXPR_LIST_DECL(ROMD8, SIG_EXPR_PTR(ROMD8, ROM16),
27d1f73670774e Andrew Jeffery 2019-07-29  713   *              SIG_EXPR_PTR(ROMD8, ROM16S));
27d1f73670774e Andrew Jeffery 2019-07-29  714   *     SIG_EXPR_LIST_DECL_SINGLE(NCTS6, NCTS6, SIG_DESC_SET(SCU90, 7));
27d1f73670774e Andrew Jeffery 2019-07-29  715   *     PIN_DECL_2(A8, GPIOH0, ROMD8, NCTS6);
27d1f73670774e Andrew Jeffery 2019-07-29  716   */
27d1f73670774e Andrew Jeffery 2019-07-29  717  #define PIN_DECL_2(pin, other, high, low) \
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  718  	SIG_EXPR_LIST_DECL_SESG(pin, other, other); \
27d1f73670774e Andrew Jeffery 2019-07-29  719  	PIN_DECL_(pin, \
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  720  			SIG_EXPR_LIST_PTR(pin, high), \
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  721  			SIG_EXPR_LIST_PTR(pin, low), \
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  722  			SIG_EXPR_LIST_PTR(pin, other))
27d1f73670774e Andrew Jeffery 2019-07-29  723  
27d1f73670774e Andrew Jeffery 2019-07-29  724  #define PIN_DECL_3(pin, other, high, medium, low) \
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  725  	SIG_EXPR_LIST_DECL_SESG(pin, other, other); \
27d1f73670774e Andrew Jeffery 2019-07-29  726  	PIN_DECL_(pin, \
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  727  			SIG_EXPR_LIST_PTR(pin, high), \
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  728  			SIG_EXPR_LIST_PTR(pin, medium), \
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  729  			SIG_EXPR_LIST_PTR(pin, low), \
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  730  			SIG_EXPR_LIST_PTR(pin, other))
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  731  
0b9714845935ae Steven Lee     2021-05-25  732  #define PIN_DECL_4(pin, other, prio1, prio2, prio3, prio4) \
0b9714845935ae Steven Lee     2021-05-25  733  	SIG_EXPR_LIST_DECL_SESG(pin, other, other); \
0b9714845935ae Steven Lee     2021-05-25  734  	PIN_DECL_(pin, \
0b9714845935ae Steven Lee     2021-05-25  735  			SIG_EXPR_LIST_PTR(pin, prio1), \
0b9714845935ae Steven Lee     2021-05-25  736  			SIG_EXPR_LIST_PTR(pin, prio2), \
0b9714845935ae Steven Lee     2021-05-25  737  			SIG_EXPR_LIST_PTR(pin, prio3), \
0b9714845935ae Steven Lee     2021-05-25  738  			SIG_EXPR_LIST_PTR(pin, prio4), \
0b9714845935ae Steven Lee     2021-05-25  739  			SIG_EXPR_LIST_PTR(pin, other))
0b9714845935ae Steven Lee     2021-05-25  740  
e7a96b0b7d1669 Andrew Jeffery 2019-07-29 @741  #define GROUP_SYM(group) group_pins_ ## group
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  742  #define GROUP_DECL(group, ...) \
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  743  	static const int GROUP_SYM(group)[] = { __VA_ARGS__ }
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  744  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

