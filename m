Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE90D65C57
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 07:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PQjgdiUqXraPNDcbxlxlNIO9oB16Z7oV8WovL3tsB6k=; b=I9HnFf7JLEyXhOp0bx9UoSF5OR
	+BnSWwQ5640fW7lhdqZKZvGOP3NCJPDfJyF1fFOpCyYmGlyAQ1zGZzzM0N98XqQrP9fzVZM7d7GXV
	IoGMQBQcsnNkQyqENrJmYazTyE7Hr4CId1lyRhS0HlBuTUGK2Fh8yLyNxi1eJ+nqWEYT8nEm3nLIN
	Kdw1FBxxHdW8bWG9qeWGzW4ucuGG2e74O3eSZ8csRMmiBz5ollUZWSWI0bmueYE/YjoxHIPWtkDiN
	aPBXgVoQf8JYdcCqXZpmMbSxlKIK6ZeVyWVJ+9SjU1PbUId8GwjsbAejVMvXRVlPapw1YSr11v66r
	94jB3yWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBUSA-000000096Mc-1Ml9;
	Thu, 14 Nov 2024 07:39:46 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBUPh-0000000962W-3G9f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 07:37:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731569832; x=1763105832;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kOb2ZYhLdcrt1/fmMbUCYgTRegwUoDmTiVsCsnAKezo=;
  b=ME86+d6h9fdQdtkI3nVRF5Rk5czk7MW4RbKD3SNTlGGQdaj8CCOvFzX7
   00dCfJ9M0wUe9KWhqv7w0s1iTbRXOQw4wmVIgIq/JdZcxoCIP/OrDThL3
   rWbSUk4ZKTDvwVx83TbJeK0+9lrDXhSl6NOGxJsIBYe2u+xlhKmVisRyD
   fXT7qJhycShS/2j/V49Y8+4mFh0jgtRp2pVqlibL3QmkDHqk5SCStqH3B
   AV7DhlMYF2qDniDr3rn1xB3cvUOHJ4Xub4gQ0MDp7f66dT/c9SkcSNWF4
   I6Az5TRK17tVKajZE8DQQaDLXmhivahONG0Gs5zw2U+F1owkQ2yZ/Wm6P
   g==;
X-CSE-ConnectionGUID: T3Nwk93bQ9igKScA5fyQcg==
X-CSE-MsgGUID: g4Ng0SQQScmpSsqPzX/iKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="30901578"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="30901578"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 23:37:05 -0800
X-CSE-ConnectionGUID: x7vsDg8DR/+0mjqnT6TiPg==
X-CSE-MsgGUID: jfLzm6z/S9yFSOX6eaLqkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="93059751"
Received: from lkp-server01.sh.intel.com (HELO 8eed2ac03994) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Nov 2024 23:37:01 -0800
Received: from kbuild by 8eed2ac03994 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBUPS-00005j-30;
	Thu, 14 Nov 2024 07:36:58 +0000
Date: Thu, 14 Nov 2024 15:36:22 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 4/5] hwmon: tmp108: Add support for I3C device
Message-ID: <202411141530.qTxjCzf7-lkp@intel.com>
References: <20241111-p3t1085-v3-4-bff511550aad@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111-p3t1085-v3-4-bff511550aad@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_233713_875123_E150D525 
X-CRM114-Status: GOOD (  10.85  )
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

Hi Frank,

kernel test robot noticed the following build errors:

[auto build test ERROR on 74741a050b79d31d8d2eeee12c77736596d0a6b2]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/dt-bindings-hwmon-ti-tmp108-Add-nxp-p3t1085-compatible-string/20241112-013721
base:   74741a050b79d31d8d2eeee12c77736596d0a6b2
patch link:    https://lore.kernel.org/r/20241111-p3t1085-v3-4-bff511550aad%40nxp.com
patch subject: [PATCH v3 4/5] hwmon: tmp108: Add support for I3C device
config: arc-randconfig-001-20241114 (https://download.01.org/0day-ci/archive/20241114/202411141530.qTxjCzf7-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411141530.qTxjCzf7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411141530.qTxjCzf7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from drivers/hwmon/tmp108.c:8:
>> include/linux/module.h:131:49: error: redefinition of '__inittest'
     131 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/device/driver.h:262:1: note: in expansion of macro 'module_init'
     262 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/i3c/device.h:233:9: note: in expansion of macro 'module_driver'
     233 |         module_driver(__drv, i3c_driver_register, i3c_driver_unregister)
         |         ^~~~~~~~~~~~~
   drivers/hwmon/tmp108.c:473:1: note: in expansion of macro 'module_i3c_driver'
     473 | module_i3c_driver(p3t1085_driver);
         | ^~~~~~~~~~~~~~~~~
   include/linux/module.h:131:49: note: previous definition of '__inittest' with type 'int (*(void))(void)'
     131 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/device/driver.h:262:1: note: in expansion of macro 'module_init'
     262 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/i2c.h:965:9: note: in expansion of macro 'module_driver'
     965 |         module_driver(__i2c_driver, i2c_add_driver, \
         |         ^~~~~~~~~~~~~
   drivers/hwmon/tmp108.c:444:1: note: in expansion of macro 'module_i2c_driver'
     444 | module_i2c_driver(tmp108_driver);
         | ^~~~~~~~~~~~~~~~~
>> include/linux/module.h:133:13: error: redefinition of 'init_module'
     133 |         int init_module(void) __copy(initfn)                    \
         |             ^~~~~~~~~~~
   include/linux/device/driver.h:262:1: note: in expansion of macro 'module_init'
     262 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/i3c/device.h:233:9: note: in expansion of macro 'module_driver'
     233 |         module_driver(__drv, i3c_driver_register, i3c_driver_unregister)
         |         ^~~~~~~~~~~~~
   drivers/hwmon/tmp108.c:473:1: note: in expansion of macro 'module_i3c_driver'
     473 | module_i3c_driver(p3t1085_driver);
         | ^~~~~~~~~~~~~~~~~
   include/linux/module.h:133:13: note: previous definition of 'init_module' with type 'int(void)'
     133 |         int init_module(void) __copy(initfn)                    \
         |             ^~~~~~~~~~~
   include/linux/device/driver.h:262:1: note: in expansion of macro 'module_init'
     262 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/i2c.h:965:9: note: in expansion of macro 'module_driver'
     965 |         module_driver(__i2c_driver, i2c_add_driver, \
         |         ^~~~~~~~~~~~~
   drivers/hwmon/tmp108.c:444:1: note: in expansion of macro 'module_i2c_driver'
     444 | module_i2c_driver(tmp108_driver);
         | ^~~~~~~~~~~~~~~~~
>> include/linux/module.h:139:49: error: redefinition of '__exittest'
     139 |         static inline exitcall_t __maybe_unused __exittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/device/driver.h:267:1: note: in expansion of macro 'module_exit'
     267 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/i3c/device.h:233:9: note: in expansion of macro 'module_driver'
     233 |         module_driver(__drv, i3c_driver_register, i3c_driver_unregister)
         |         ^~~~~~~~~~~~~
   drivers/hwmon/tmp108.c:473:1: note: in expansion of macro 'module_i3c_driver'
     473 | module_i3c_driver(p3t1085_driver);
         | ^~~~~~~~~~~~~~~~~
   include/linux/module.h:139:49: note: previous definition of '__exittest' with type 'void (*(void))(void)'
     139 |         static inline exitcall_t __maybe_unused __exittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/device/driver.h:267:1: note: in expansion of macro 'module_exit'
     267 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/i2c.h:965:9: note: in expansion of macro 'module_driver'
     965 |         module_driver(__i2c_driver, i2c_add_driver, \
         |         ^~~~~~~~~~~~~
   drivers/hwmon/tmp108.c:444:1: note: in expansion of macro 'module_i2c_driver'
     444 | module_i2c_driver(tmp108_driver);
         | ^~~~~~~~~~~~~~~~~
>> include/linux/module.h:141:14: error: redefinition of 'cleanup_module'
     141 |         void cleanup_module(void) __copy(exitfn)                \
         |              ^~~~~~~~~~~~~~
   include/linux/device/driver.h:267:1: note: in expansion of macro 'module_exit'
     267 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/i3c/device.h:233:9: note: in expansion of macro 'module_driver'
     233 |         module_driver(__drv, i3c_driver_register, i3c_driver_unregister)
         |         ^~~~~~~~~~~~~
   drivers/hwmon/tmp108.c:473:1: note: in expansion of macro 'module_i3c_driver'
     473 | module_i3c_driver(p3t1085_driver);
         | ^~~~~~~~~~~~~~~~~
   include/linux/module.h:141:14: note: previous definition of 'cleanup_module' with type 'void(void)'
     141 |         void cleanup_module(void) __copy(exitfn)                \
         |              ^~~~~~~~~~~~~~
   include/linux/device/driver.h:267:1: note: in expansion of macro 'module_exit'
     267 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/i2c.h:965:9: note: in expansion of macro 'module_driver'
     965 |         module_driver(__i2c_driver, i2c_add_driver, \
         |         ^~~~~~~~~~~~~
   drivers/hwmon/tmp108.c:444:1: note: in expansion of macro 'module_i2c_driver'
     444 | module_i2c_driver(tmp108_driver);
         | ^~~~~~~~~~~~~~~~~


vim +/__inittest +131 include/linux/module.h

0fd972a7d91d6e1 Paul Gortmaker 2015-05-01  128  
0fd972a7d91d6e1 Paul Gortmaker 2015-05-01  129  /* Each module must use one module_init(). */
0fd972a7d91d6e1 Paul Gortmaker 2015-05-01  130  #define module_init(initfn)					\
1f318a8bafcfba9 Arnd Bergmann  2017-02-01 @131  	static inline initcall_t __maybe_unused __inittest(void)		\
0fd972a7d91d6e1 Paul Gortmaker 2015-05-01  132  	{ return initfn; }					\
cf68fffb66d60d9 Sami Tolvanen  2021-04-08 @133  	int init_module(void) __copy(initfn)			\
cf68fffb66d60d9 Sami Tolvanen  2021-04-08  134  		__attribute__((alias(#initfn)));		\
92efda8eb15295a Sami Tolvanen  2022-09-08  135  	___ADDRESSABLE(init_module, __initdata);
0fd972a7d91d6e1 Paul Gortmaker 2015-05-01  136  
0fd972a7d91d6e1 Paul Gortmaker 2015-05-01  137  /* This is only required if you want to be unloadable. */
0fd972a7d91d6e1 Paul Gortmaker 2015-05-01  138  #define module_exit(exitfn)					\
1f318a8bafcfba9 Arnd Bergmann  2017-02-01 @139  	static inline exitcall_t __maybe_unused __exittest(void)		\
0fd972a7d91d6e1 Paul Gortmaker 2015-05-01  140  	{ return exitfn; }					\
cf68fffb66d60d9 Sami Tolvanen  2021-04-08 @141  	void cleanup_module(void) __copy(exitfn)		\
cf68fffb66d60d9 Sami Tolvanen  2021-04-08  142  		__attribute__((alias(#exitfn)));		\
92efda8eb15295a Sami Tolvanen  2022-09-08  143  	___ADDRESSABLE(cleanup_module, __exitdata);
0fd972a7d91d6e1 Paul Gortmaker 2015-05-01  144  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

