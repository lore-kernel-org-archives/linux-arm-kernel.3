Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCF3D339BC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 14:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zbgbQIsqzCa1o96WJeiI4BktIUQEIR3H5wPQ2n58Thw=; b=c7TrawrT6xMSvKHCcmWjdsuBeS
	QObYTO+vxCKLPTgRuCZv1tZdZC/x1UIxbHyn+mlvZFxDA8maJfyoYGT2nRB/dzSE2G9MZDSgJkEyR
	LWvrYlfew6zjkHuV9xpXtTBXYfVwiyyXlPe1uNWrULWM2YmBhCKx/b+XPx1444Ry65OLvJp1QxA3B
	u8pet0c0GVpTpWkFuOe0ZBmJsDgz985Q4Utcjl5jSfJKsMRbW17rHqEss/ahQXy9uTjDjmTloufih
	CDV1XBTkNy+4f6TAy8ZXYS9m16grcwQ0rwl49jdR842WZWPv23WVRFyZvGrEN4znSJ/QBaJcZo60K
	A7Ff8Wiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRtDj-0000000AyxF-3Isd;
	Sat, 06 Dec 2025 14:25:11 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRtDa-0000000AywY-2lIb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 14:25:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765031102; x=1796567102;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rhJy0MuZoX1IN0c3VNkXR9OgQWBNKyzexnJsWC4tqmk=;
  b=MG0KP76JFA0fi4G+ZjZ9VYFvMTG2TsPPLJhpdavNfiUzHhPKDmz2y4UA
   8pvk1eF46Nazr482y9pWioqxFJiiENSQaPfI9eJYjqrBJG01wvLgE6zg+
   XmLy4RSFW5ONp3dNre1centzm2WoPdTxYT121/w9lK29ttITAM43XSF8R
   62lvaYbZUSW24F/K33omMbF2MRLwHgXXGM9pmEsPn9BBQ0124VZloWetQ
   Xhfh3NrQkaqpCxzpHd6I0dA9d21IeSl1h085gfau0dyAwatT1iC/req3n
   jJ2NldcW5YPwEqyCz4sk4fjyQZszEm0rRqBsg+0SCAQIKz8j5NIzdzJgC
   g==;
X-CSE-ConnectionGUID: HOCBXu/ZQ5mLZcoaGv7L9A==
X-CSE-MsgGUID: QJJ6ab+rTe6T+C4tQbVChg==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="66041585"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="66041585"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 06:25:01 -0800
X-CSE-ConnectionGUID: fBohExo1RaaxqdrSlmEprQ==
X-CSE-MsgGUID: leGyjN9HS1KwkpMGCoe/dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="199982689"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Dec 2025 06:24:58 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRtDT-00000000IEv-25PT;
	Sat, 06 Dec 2025 14:24:55 +0000
Date: Sat, 6 Dec 2025 22:24:34 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Genoud <richard.genoud@bootlin.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: Re: [PATCH 2/4] pwm: sun50i: Add H616 PWM support
Message-ID: <202512062245.KFjCln1y-lkp@intel.com>
References: <20251205100239.1563353-3-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205100239.1563353-3-richard.genoud@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_062504_492091_BB6A8A01 
X-CRM114-Status: GOOD (  10.20  )
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

Hi Richard,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6987d58a9cbc5bd57c983baa514474a86c945d56]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Genoud/dt-bindings-pwm-sunxi-add-PWM-controller-for-Allwinner-H616/20251205-214804
base:   6987d58a9cbc5bd57c983baa514474a86c945d56
patch link:    https://lore.kernel.org/r/20251205100239.1563353-3-richard.genoud%40bootlin.com
patch subject: [PATCH 2/4] pwm: sun50i: Add H616 PWM support
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20251206/202512062245.KFjCln1y-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512062245.KFjCln1y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512062245.KFjCln1y-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pwm/pwm-sun50i-h616.c: In function 'h616_pwm_get_state':
>> drivers/pwm/pwm-sun50i-h616.c:76:41: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
      76 | #define PWM_REG_DUTY(reg)               FIELD_GET(PWM_DUTY_MASK, reg)
         |                                         ^~~~~~~~~
   drivers/pwm/pwm-sun50i-h616.c:452:30: note: in expansion of macro 'PWM_REG_DUTY'
     452 |         tmp = NSEC_PER_SEC * PWM_REG_DUTY(val);
         |                              ^~~~~~~~~~~~
   drivers/pwm/pwm-sun50i-h616.c: In function 'h616_pwm_calc':
>> drivers/pwm/pwm-sun50i-h616.c:79:41: error: implicit declaration of function 'FIELD_MAX' [-Wimplicit-function-declaration]
      79 | #define PWM_PERIOD_MAX                  FIELD_MAX(PWM_PERIOD_MASK)
         |                                         ^~~~~~~~~
   drivers/pwm/pwm-sun50i-h616.c:493:54: note: in expansion of macro 'PWM_PERIOD_MAX'
     493 |                 freq = div64_u64(NSEC_PER_SEC * (u64)PWM_PERIOD_MAX, period);
         |                                                      ^~~~~~~~~~~~~~
   drivers/pwm/pwm-sun50i-h616.c: In function 'h616_pwm_apply':
>> drivers/pwm/pwm-sun50i-h616.c:78:41: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      78 | #define PWM_DUTY(dty)                   FIELD_PREP(PWM_DUTY_MASK, dty)
         |                                         ^~~~~~~~~~
   drivers/pwm/pwm-sun50i-h616.c:577:23: note: in expansion of macro 'PWM_DUTY'
     577 |                 val = PWM_DUTY(chan->active_cycles);
         |                       ^~~~~~~~
   drivers/pwm/pwm-sun50i-h616.c: In function 'h616_add_composite_clk':
   drivers/pwm/pwm-sun50i-h616.c:666:28: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     666 |                 mux->reg = (u64)mux->reg + reg;
         |                            ^
   drivers/pwm/pwm-sun50i-h616.c:676:29: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     676 |                 gate->reg = (u64)gate->reg + reg;
         |                             ^
   drivers/pwm/pwm-sun50i-h616.c:686:29: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     686 |                 rate->reg = (u64)rate->reg + reg;
         |                             ^


vim +/FIELD_GET +76 drivers/pwm/pwm-sun50i-h616.c

    70	
    71	/* PWM Period Register */
    72	#define PWM_PERIOD_REG(ch)		(0x64 + (ch) * 0x20)
    73	#define PWM_PERIOD_MASK			GENMASK(31, 16)
    74	#define PWM_DUTY_MASK			GENMASK(15, 0)
    75	#define PWM_REG_PERIOD(reg)		(FIELD_GET(PWM_PERIOD_MASK, reg) + 1)
  > 76	#define PWM_REG_DUTY(reg)		FIELD_GET(PWM_DUTY_MASK, reg)
    77	#define PWM_PERIOD(prd)			FIELD_PREP(PWM_PERIOD_MASK, (prd) - 1)
  > 78	#define PWM_DUTY(dty)			FIELD_PREP(PWM_DUTY_MASK, dty)
  > 79	#define PWM_PERIOD_MAX			FIELD_MAX(PWM_PERIOD_MASK)
    80	
    81	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

