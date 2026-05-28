Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B97CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 06:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QUZLdg5gVy2XgmDVgCKi8BhT2mkdTGjgV3+xGQYi4BU=; b=Cfc9EfGCanyHJIc2UswyiUXLPJ
	mWhapSpKAoHJrTISVjn/ITIpWRBj5p7/eg/m0mdEi+fEBtFyKJO3+ybOEVjvCP00REPPZTHFgEfvF
	8vLfhVgxrqvPeqwzn9GMuWepL8Jp5PvJF7q/0XKfX7RJtIkdix2CmFt50J4z5ZYk6EzZHclHpXcJY
	ODAiaGDGp1BQdfJhyrE/coehemVo5486if5NeEqJiwq9um+QC693sQCwX7eGSpYxy/OCWx2y1KsIO
	nIPisey9NUMT0hS0ZisIPDlz8+LJ4g+k+8eRtfgNUfyIrzDErxnP4d6Vng0B+dJd+lb+NRE6d8tIk
	oefn0nLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSUQW-00000005Crx-2APY;
	Thu, 28 May 2026 06:41:08 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSUQT-00000005Cr7-1CEA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 06:41:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779950465; x=1811486465;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SioP6jDgWCwXbGQVSvOG90A2ONx8D8JxSS4hvLLdlx8=;
  b=NGG6EX04UsMEKG/cthGnyxO5Lf8beWWpHoxKhh11TiOiOT/v/Xtcmrkx
   v4L6wNOHCxUS/lxFGJRKemOWxpGr6V4X1/US26Y0vS1TaAQp52927TtB6
   l/tB+KkJkoxfwS+18IGrn+SqbUVo/S8d/O2dVm6f3IRSJKbbx9L0wlHQS
   4mO+0R8kES7dP6fmSMl/sMMpGV5Q864ItWrk4Opc5f2kIVSzx91YMPK5X
   oJXmu7a4m63BMcYYtBLhOYWqTPj9g7uGXDcS0iXjyjYHhcROhcPFuH3zp
   0AhWivTmYLN+5WIyJc61fKEENzxoi2B35CAjQVDn1zXjtBHMOXE8/SiO2
   A==;
X-CSE-ConnectionGUID: oBqXS7laQ6i0zaKl6aXOag==
X-CSE-MsgGUID: G7zrZsPgR/KISzjm7ybxnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="92263271"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="92263271"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 23:41:03 -0700
X-CSE-ConnectionGUID: AD0JX70CQtC2uKqoWuRP1w==
X-CSE-MsgGUID: xnwTCWx8SKiOK0BVLFC32w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="239892506"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 May 2026 23:40:58 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSUQJ-000000005dK-33pH;
	Thu, 28 May 2026 06:40:55 +0000
Date: Thu, 28 May 2026 14:40:51 +0800
From: kernel test robot <lkp@intel.com>
To: David Lechner <dlechner@baylibre.com>,
	Jyoti Bhayana <jbhayana@google.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, David Lechner <dlechner@baylibre.com>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH] iio: pressure: cros_ec_baro: simplify timestamp channel
 definition
Message-ID: <202605281432.a64fe4iY-lkp@intel.com>
References: <20260525014654.2399354-1-dlechner@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525014654.2399354-1-dlechner@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_234105_374323_8262916E 
X-CRM114-Status: GOOD (  11.43  )
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

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on jic23-iio/togreg]
[also build test ERROR on linus/master v7.1-rc5 next-20260527]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Lechner/iio-pressure-cros_ec_baro-simplify-timestamp-channel-definition/20260525-134550
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20260525014654.2399354-1-dlechner%40baylibre.com
patch subject: [PATCH] iio: pressure: cros_ec_baro: simplify timestamp channel definition
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260528/202605281432.a64fe4iY-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605281432.a64fe4iY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605281432.a64fe4iY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/iio/buffer.h:10,
                    from drivers/iio/pressure/cros_ec_baro.c:9:
   drivers/iio/pressure/cros_ec_baro.c: In function 'cros_ec_baro_probe':
>> include/linux/iio/iio.h:356:38: error: expected expression before '{' token
     356 | #define IIO_CHAN_SOFT_TIMESTAMP(_si) {                                  \
         |                                      ^
   drivers/iio/pressure/cros_ec_baro.c:174:20: note: in expansion of macro 'IIO_CHAN_SOFT_TIMESTAMP'
     174 |         *channel = IIO_CHAN_SOFT_TIMESTAMP(1);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~


vim +356 include/linux/iio/iio.h

00c5f80c2fad53 include/linux/iio/iio.h   Peter Rosin      2016-11-08  355  
07d4655b410a4d include/linux/iio/iio.h   Jonathan Cameron 2013-11-12 @356  #define IIO_CHAN_SOFT_TIMESTAMP(_si) {					\
07d4655b410a4d include/linux/iio/iio.h   Jonathan Cameron 2013-11-12  357  	.type = IIO_TIMESTAMP,						\
07d4655b410a4d include/linux/iio/iio.h   Jonathan Cameron 2013-11-12  358  	.channel = -1,							\
07d4655b410a4d include/linux/iio/iio.h   Jonathan Cameron 2013-11-12  359  	.scan_index = _si,						\
07d4655b410a4d include/linux/iio/iio.h   Jonathan Cameron 2013-11-12  360  	.scan_type = {							\
07d4655b410a4d include/linux/iio/iio.h   Jonathan Cameron 2013-11-12  361  		.sign = 's',						\
07d4655b410a4d include/linux/iio/iio.h   Jonathan Cameron 2013-11-12  362  		.realbits = 64,					\
07d4655b410a4d include/linux/iio/iio.h   Jonathan Cameron 2013-11-12  363  		.storagebits = 64,					\
07d4655b410a4d include/linux/iio/iio.h   Jonathan Cameron 2013-11-12  364  		},							\
07d4655b410a4d include/linux/iio/iio.h   Jonathan Cameron 2013-11-12  365  }
1d892719e70e47 drivers/staging/iio/iio.h Jonathan Cameron 2011-05-18  366  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

