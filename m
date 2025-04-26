Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F64BC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 19:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUkqLUp3pKVi4cuG+SYOqW7C8vmLTaogO0mFVlWkN5M=; b=l40T2jZ9Hd7MpzUz0hl0pUCQSh
	b2H8oys2hTwoyKgOMTPbsbbni/MErIZzPcKYMZ/YBmx08eq/jAM5+a2iv1nq+spUxqnjDYilfLrlQ
	3DPpnSypcIbprihbKkHWjvMKPRWaWzhB9DyEz5tybJBrVb5/vCLTfCiP+qBSX3A8tNnxq8Zqitidz
	M7dUHdRG++sbHLB0ReJ2iUa8rwMQzDBzLdpZ1higI2xVobJSzI9UakGzmrjtqbcSc/5UEC75U+6dN
	4TodDPxYSbeeokaUmhq+eGjUpQQWAOBT7+bOP0mBIz0m9Nv5k5jyFA3Z1MOg0fRscmkG+lmVETcUH
	fQB7vF0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8l1l-00000002QiX-4BCH;
	Sat, 26 Apr 2025 19:17:30 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8kzt-00000002Qc1-0pOr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 19:15:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745694933; x=1777230933;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=brOk3A6MPbfofZsQC9PM6kvZwS6E7KFFlMtFDrx1zJQ=;
  b=frwqe0GjJbZhaoJrpsquC6+9hmJlNgQ66mH0i8huhOG4ZshdyERfd12L
   esQ9OtMb+3e63riTg6872nxjHaYc3DzuAl/d9iI8J5VG5yPbwFJXF4LQx
   A0i3vMx12lOx+ZkfKc0O0m/wVCGTBnTjrtR6e6L8YZ5B0HK9KEnH3Jpwy
   ATrVh5kV2vdRA5QMnSW+fpdrwuE8x5V6dnQb+hY0xp9LZu05RPKZH3p9a
   osL/F9y0MBzBpp8C3Z5g+KbR0ulLt8UDQuY1BTyTT8G0WaygbN9GnxLpH
   JdWWoVDnF+cdVn6U0Xa9f1HsgO4VISGozgwUlWMdX0qcPsiVKTTsnUO5s
   A==;
X-CSE-ConnectionGUID: NpubzsSTQRSdFS7ugk+aDQ==
X-CSE-MsgGUID: yFy/MYdbTS22Sj1BgsJCdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="46445892"
X-IronPort-AV: E=Sophos;i="6.15,242,1739865600"; 
   d="scan'208";a="46445892"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 12:15:33 -0700
X-CSE-ConnectionGUID: gokFKn95S0S6quEt4GqBow==
X-CSE-MsgGUID: tawfhFxxRKmiVUC6cgQZOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,242,1739865600"; 
   d="scan'208";a="133477669"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 Apr 2025 12:15:29 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8kzn-0005xV-1e;
	Sat, 26 Apr 2025 19:15:27 +0000
Date: Sun, 27 Apr 2025 03:15:26 +0800
From: kernel test robot <lkp@intel.com>
To: David Lechner <dlechner@baylibre.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/6] iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
Message-ID: <202504270311.4lppXI1u-lkp@intel.com>
References: <20250425-iio-introduce-iio_declare_buffer_with_ts-v3-1-f12df1bff248@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-iio-introduce-iio_declare_buffer_with_ts-v3-1-f12df1bff248@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_121533_280857_8C21FD53 
X-CRM114-Status: GOOD (  13.34  )
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

[auto build test ERROR on aff301f37e220970c2f301b5c65a8bfedf52058e]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Lechner/iio-introduce-IIO_DECLARE_BUFFER_WITH_TS-macros/20250426-051240
base:   aff301f37e220970c2f301b5c65a8bfedf52058e
patch link:    https://lore.kernel.org/r/20250425-iio-introduce-iio_declare_buffer_with_ts-v3-1-f12df1bff248%40baylibre.com
patch subject: [PATCH v3 1/6] iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
config: openrisc-randconfig-r053-20250427 (https://download.01.org/0day-ci/archive/20250427/202504270311.4lppXI1u-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250427/202504270311.4lppXI1u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504270311.4lppXI1u-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/kobject.h:19,
                    from include/linux/cdev.h:5,
                    from drivers/iio/industrialio-core.c:13:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "macros above assume that IIO_DMA_MINALIGN also ensures s64 timestamp alignment"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/iio/iio.h:815:1: note: in expansion of macro 'static_assert'
     815 | static_assert(IIO_DMA_MINALIGN % sizeof(s64) == 0,
         | ^~~~~~~~~~~~~


vim +78 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10  60  
6bab69c65013be Rasmus Villemoes 2019-03-07  61  /**
6bab69c65013be Rasmus Villemoes 2019-03-07  62   * static_assert - check integer constant expression at build time
6bab69c65013be Rasmus Villemoes 2019-03-07  63   *
6bab69c65013be Rasmus Villemoes 2019-03-07  64   * static_assert() is a wrapper for the C11 _Static_assert, with a
6bab69c65013be Rasmus Villemoes 2019-03-07  65   * little macro magic to make the message optional (defaulting to the
6bab69c65013be Rasmus Villemoes 2019-03-07  66   * stringification of the tested expression).
6bab69c65013be Rasmus Villemoes 2019-03-07  67   *
6bab69c65013be Rasmus Villemoes 2019-03-07  68   * Contrary to BUILD_BUG_ON(), static_assert() can be used at global
6bab69c65013be Rasmus Villemoes 2019-03-07  69   * scope, but requires the expression to be an integer constant
6bab69c65013be Rasmus Villemoes 2019-03-07  70   * expression (i.e., it is not enough that __builtin_constant_p() is
6bab69c65013be Rasmus Villemoes 2019-03-07  71   * true for expr).
6bab69c65013be Rasmus Villemoes 2019-03-07  72   *
6bab69c65013be Rasmus Villemoes 2019-03-07  73   * Also note that BUILD_BUG_ON() fails the build if the condition is
6bab69c65013be Rasmus Villemoes 2019-03-07  74   * true, while static_assert() fails the build if the expression is
6bab69c65013be Rasmus Villemoes 2019-03-07  75   * false.
6bab69c65013be Rasmus Villemoes 2019-03-07  76   */
6bab69c65013be Rasmus Villemoes 2019-03-07  77  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
6bab69c65013be Rasmus Villemoes 2019-03-07 @78  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
6bab69c65013be Rasmus Villemoes 2019-03-07  79  
07a368b3f55a79 Maxim Levitsky   2022-10-25  80  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

