Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7C1CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 14:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2XOzs5O/NdTUGx0NhRnfK59Ou0Cy782S75PA0wBVuPQ=; b=jVR/3P3upHP4c+GdyfEovAUASD
	uuM8HOYDlrQPK2DXIdYTZ5LU14BKhhD0rh9a/ZiqW8hnKI3iuFVLUJ9s67Pvky+z9Yb2+wjDvrkI6
	EzDidTRm4/5GjnOzwdSIoQnbXsjxPvt2c3A67zwXSb7LkBUI4Ufgn2L/IS+k4eg7yPrAt2LYZLdGA
	AhnRwUGBly/2TFbkgnb1eGXaGAyFlIDfvqGlHvhAfrnoFHdrL34xumfy8u3m4myFzEFHGdsG4oFA8
	xQLtHJLIQ8vKR5fldych5ygg8uxNXhTDReKInRc344hB2VH10AUZYqtb5Cu5KfoAhrLGLIey7XNoP
	ggxDu1vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzbfO-000000033T7-0u77;
	Fri, 19 Sep 2025 14:00:50 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzbfK-000000033RY-3CsN;
	Fri, 19 Sep 2025 14:00:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758290446; x=1789826446;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2Fw6+9wC1pe/2aHJyHIT5pgPlo5xcUmfFXENMUNHfqk=;
  b=ajRlCmQqG58YPch/5rvIwk3vmDRMmhmhRFYg2K4oijWab4Yl0Iq7skD8
   lOBg9f1lpiuYmUA/gyzTavt4r5wSMHjeAzidP8jEU50gMrmm4L7APsVrF
   KoXbztibQDLrEvtCg6zBRHodBne9N7JQ/vG/CHLdBmu5jeThVZIVZ62dW
   FzT/LUL62xMdLVMQuMGfGZZMVHk9ar4vDl44wm+gkWe5vMI0ws/SZ24yi
   grTxGxMU6oqzEOYL8PZYXjUpgxERnGyo8rd1Q/FG7EUhaSARmnHUpNlY/
   Ht9vtHIv+MqP3SwxGueH0VF0+nX9EYAqyDdSvyeXmWClZvAObH1lT7jp/
   g==;
X-CSE-ConnectionGUID: /mktL4TpT1ODB5ssXi1N6Q==
X-CSE-MsgGUID: Ufl3SkiUQuud2zrPSlaf5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60523791"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="60523791"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 07:00:45 -0700
X-CSE-ConnectionGUID: KLjTf8AqQCqudD5ECbxUSQ==
X-CSE-MsgGUID: 8I+0wv0HRzSTzVRIDmNthQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Sep 2025 07:00:39 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzbfB-0004Ln-1N;
	Fri, 19 Sep 2025 14:00:37 +0000
Date: Fri, 19 Sep 2025 21:59:58 +0800
From: kernel test robot <lkp@intel.com>
To: Dang Huynh via B4 Relay <devnull+dang.huynh.mainlining.org@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-unisoc@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-mmc@vger.kernel.org,
	Dang Huynh <dang.huynh@mainlining.org>
Subject: Re: [PATCH 06/25] rtc: Add driver for RDA Micro SoC
Message-ID: <202509192152.OXdK6bpd-lkp@intel.com>
References: <20250917-rda8810pl-drivers-v1-6-9ca9184ca977@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917-rda8810pl-drivers-v1-6-9ca9184ca977@mainlining.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_070046_852610_855CE2A8 
X-CRM114-Status: GOOD (  15.72  )
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

Hi Dang,

kernel test robot noticed the following build errors:

[auto build test ERROR on 590b221ed4256fd6c34d3dea77aa5bd6e741bbc1]

url:    https://github.com/intel-lab-lkp/linux/commits/Dang-Huynh-via-B4-Relay/ARM-dts-unisoc-rda8810pl-Add-label-to-GPIO-nodes/20250917-043025
base:   590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
patch link:    https://lore.kernel.org/r/20250917-rda8810pl-drivers-v1-6-9ca9184ca977%40mainlining.org
patch subject: [PATCH 06/25] rtc: Add driver for RDA Micro SoC
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250919/202509192152.OXdK6bpd-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250919/202509192152.OXdK6bpd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509192152.OXdK6bpd-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/rtc/rtc-rda.c: In function 'rda_rtc_settime':
>> drivers/rtc/rtc-rda.c:67:15: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      67 |         low = FIELD_PREP(RDA_SEC_MASK, tm->tm_sec) |
         |               ^~~~~~~~~~
   drivers/rtc/rtc-rda.c: In function 'rda_rtc_readtime':
>> drivers/rtc/rtc-rda.c:128:22: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     128 |         tm->tm_sec = FIELD_GET(RDA_SEC_MASK, low);
         |                      ^~~~~~~~~


vim +/FIELD_PREP +67 drivers/rtc/rtc-rda.c

    50	
    51	static int rda_rtc_settime(struct device *dev, struct rtc_time *tm)
    52	{
    53		struct rda_rtc *rtc = dev_get_drvdata(dev);
    54		u32 high, low;
    55		int ret;
    56	
    57		ret = rtc_valid_tm(tm);
    58		if (ret < 0)
    59			return ret;
    60	
    61		/*
    62		 * The number of years since 1900 in kernel,
    63		 * but it is defined since 2000 by HW.
    64		 * The number of mons' range is from 0 to 11 in kernel,
    65		 * but it is defined from 1 to 12 by HW.
    66		 */
  > 67		low = FIELD_PREP(RDA_SEC_MASK, tm->tm_sec) |
    68			FIELD_PREP(RDA_MIN_MASK, tm->tm_min) |
    69			FIELD_PREP(RDA_HRS_MASK, tm->tm_hour);
    70	
    71		high = FIELD_PREP(RDA_MDAY_MASK, tm->tm_mday) |
    72			FIELD_PREP(RDA_MON_MASK, tm->tm_mon + 1) |
    73			FIELD_PREP(RDA_YEAR_MASK, tm->tm_year - 100) |
    74			FIELD_PREP(RDA_WDAY_MASK, tm->tm_wday);
    75	
    76		ret = regmap_write(rtc->regmap, RDA_RTC_CAL_LOAD_LOW_REG, low);
    77		if (ret < 0) {
    78			dev_err(dev, "Failed to update RTC low register: %d\n", ret);
    79			return ret;
    80		}
    81	
    82		ret = regmap_write(rtc->regmap, RDA_RTC_CAL_LOAD_HIGH_REG, high);
    83		if (ret < 0) {
    84			dev_err(dev, "Failed to update RTC low register: %d\n", ret);
    85			return ret;
    86		}
    87	
    88		ret = regmap_update_bits(rtc->regmap, RDA_RTC_CMD_REG, RDA_RTC_CMD_CAL_LOAD, 1);
    89		if (ret < 0) {
    90			dev_err(dev, "Failed to update RTC cal load register: %d\n", ret);
    91			return ret;
    92		}
    93	
    94		return 0;
    95	}
    96	
    97	static int rda_rtc_readtime(struct device *dev, struct rtc_time *tm)
    98	{
    99		struct rda_rtc *rtc = dev_get_drvdata(dev);
   100		unsigned int high, low;
   101		int ret;
   102	
   103		/*
   104		 * Check if RTC data is valid.
   105		 *
   106		 * When this bit is set, it means the data in the RTC is invalid
   107		 * or not configured.
   108		 */
   109		ret = regmap_test_bits(rtc->regmap, RDA_RTC_STA_REG, RDA_RTC_STA_NOT_PROG);
   110		if (ret < 0) {
   111			dev_err(dev, "Failed to read RTC status: %d\n", ret);
   112			return ret;
   113		} else if (ret > 0)
   114			return -EINVAL;
   115	
   116		ret = regmap_read(rtc->regmap, RDA_RTC_CUR_LOAD_HIGH_REG, &high);
   117		if (ret) {
   118			dev_err(dev, "Failed to read RTC high reg: %d\n", ret);
   119			return ret;
   120		}
   121	
   122		ret = regmap_read(rtc->regmap, RDA_RTC_CUR_LOAD_LOW_REG, &low);
   123		if (ret) {
   124			dev_err(dev, "Failed to read RTC low reg: %d\n", ret);
   125			return ret;
   126		}
   127	
 > 128		tm->tm_sec = FIELD_GET(RDA_SEC_MASK, low);
   129		tm->tm_min = FIELD_GET(RDA_MIN_MASK, low);
   130		tm->tm_hour = FIELD_GET(RDA_HRS_MASK, low);
   131		tm->tm_mday = FIELD_GET(RDA_MDAY_MASK, high);
   132		tm->tm_mon = FIELD_GET(RDA_MON_MASK, high);
   133		tm->tm_year = FIELD_GET(RDA_YEAR_MASK, high);
   134		tm->tm_wday = FIELD_GET(RDA_WDAY_MASK, high);
   135	
   136		/*
   137		 * The number of years since 1900 in kernel,
   138		 * but it is defined since 2000 by HW.
   139		 */
   140		tm->tm_year += 100;
   141		/*
   142		 * The number of mons' range is from 0 to 11 in kernel,
   143		 * but it is defined from 1 to 12 by HW.
   144		 */
   145		tm->tm_mon -= 1;
   146	
   147		return 0;
   148	}
   149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

