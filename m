Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10287D3A678
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 17:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y/cUNwC67vgWzQkYljMcwOebS3TfT5/smv/VO0xYuUs=; b=RjG9w0Pe1RsgnTEFzAKqscrJXs
	gWnpFDRwVSINUOBh8SbVaX3S6vX3HmbqzQALw5hggIryr2GMPy1BxGB8YCOIJP8/rSOa4Hc8s1EKS
	EfEdSzViiW5rDOtPoFoxYXVqVNuGuUFJzkmVK1Q6F5DYjQX1H2r/yXpwePNnC7Or76+f1o0HRS5ry
	OvfEfUA64PzVUY2smL8/vI3xHsmlv4hfUmskcq396amcK23eIPQ5YZ6747zm4ZBSws/SDW0CM5Ai7
	e5VFqxHI+zGceE1WGVqaTYI9mnCsadVDdrwD3w/7GKDS83/dwHWZDivJg5pDJQRP3xaQFsWcVpeRL
	iVTtAoSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5qKy-0000000FNYW-00MV;
	Tue, 29 Oct 2024 17:49:00 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5pfp-0000000FD45-2CsN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 17:06:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730221590; x=1761757590;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GFsoyu+gSq/aSU9jlBlwuMAGi0F5EJzjk+vasvk+KMY=;
  b=B8Y3NT4iINKxNrf9x9gPnCZsPd5MLkpTSGIf8ZXmru3Lr+v/9l+oN3Q/
   4hCgfiOdUjlFZm/uJOCHTnaRvEvToHwFmpv+aZnldYYdVgJPH5CM7TGQu
   yEc3xg5GnbxV0ZuNIfFlQn/NV0OSoFWm4swfJir2gQ3n8VK8ut0ejaCXb
   nSyjwK3nXGL9G+Y9BGzp6RXlglVToQhkemVXUFos8ASOPGwRmm+mCTNkB
   ADsSAbpQWZnNRKvt6Dj+8fVEhTait4JptuKboXf2p5VzZyGikyaO2WScK
   zXF+DF4ROBxhZA5kHud867CdF0OHulYa/0EjKir2bObLl2QhilrwCw5kP
   A==;
X-CSE-ConnectionGUID: 9hNuGqKLQIWm6NhuZywXWg==
X-CSE-MsgGUID: AX32xCkNQUmXJ9RwTwKy5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52435493"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52435493"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 10:06:23 -0700
X-CSE-ConnectionGUID: 7q9ZxRnpTnuEDnhZdkCFQg==
X-CSE-MsgGUID: WNsgyM8oS1ez1aK6WXHuiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="81945398"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Oct 2024 10:06:17 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5pfc-000dvO-0Q;
	Tue, 29 Oct 2024 17:06:16 +0000
Date: Wed, 30 Oct 2024 01:05:34 +0800
From: kernel test robot <lkp@intel.com>
To: alice.guo@oss.nxp.com, wahrenst@gmx.net, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	"alice.guo" <alice.guo@nxp.com>
Subject: Re: [PATCH v2] soc: imx: Add SoC device register for i.MX9
Message-ID: <202410300019.uWGJaR4m-lkp@intel.com>
References: <20241029083406.3888861-1-alice.guo@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029083406.3888861-1-alice.guo@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_100629_650743_BC6D616C 
X-CRM114-Status: GOOD (  12.47  )
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

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on linus/master v6.12-rc5 next-20241029]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/alice-guo-oss-nxp-com/soc-imx-Add-SoC-device-register-for-i-MX9/20241029-163718
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20241029083406.3888861-1-alice.guo%40oss.nxp.com
patch subject: [PATCH v2] soc: imx: Add SoC device register for i.MX9
config: arm-randconfig-002-20241029 (https://download.01.org/0day-ci/archive/20241030/202410300019.uWGJaR4m-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410300019.uWGJaR4m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410300019.uWGJaR4m-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arm/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from drivers/soc/imx/soc-imx9.c:8:
   drivers/soc/imx/soc-imx9.c: In function 'imx9_soc_device_register':
>> include/linux/kern_levels.h:5:25: warning: format '%d' expects argument of type 'int', but argument 3 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:462:25: note: in definition of macro 'printk_index_wrap'
     462 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:533:9: note: in expansion of macro 'printk'
     533 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:533:16: note: in expansion of macro 'KERN_ERR'
     533 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   drivers/soc/imx/soc-imx9.c:48:17: note: in expansion of macro 'pr_err'
      48 |                 pr_err("%s: SMC failed: %d\n", __func__, res.a0);
         |                 ^~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a7 Joe Perches 2012-07-30  4  
04d2c8c83d0e3ac Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3ac Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3ac Joe Perches 2012-07-30  7  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

