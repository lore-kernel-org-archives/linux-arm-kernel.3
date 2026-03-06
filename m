Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243B5F513EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 01:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W9Io0gngRGfUNcODUVQzjKm9eYSvdlrjPunR5Pjv2B0=; b=AUZ3HQ/Ik7iCAZsFtYw/IHvm1M
	ymCZXKaou5z8oCpruV7TnCsK+E69ZhdiIDAoRg+Ufg4O4qmoFIKFSAiIFf8QBlTS7TrTyIxKOEYXZ
	rlrumGpMmNThIGCuVY1Q4t4d42gkPFHGyfZixj6V5638W6vgNZGdq6+li6dsU+h/TFNg8+O5siihf
	B8QlWvvEniTxlh4qR4izt8iqfzhK0ImREkkloS7S4Zp2tE3AtEBRF2RbraWdJT9PlidrOdgMtcckQ
	57z7NkNCt5rMb+p3WOZiXEIhjgQHJ6y3JHZnfc1W2BagsoOiLnfv0+5Hyp31mF1k04j14G+SHw2bQ
	4qgcSRng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyJeV-00000002oUr-1FUd;
	Fri, 06 Mar 2026 01:06:51 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyJeN-00000002oUT-1W5S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 01:06:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772759203; x=1804295203;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/3UzXOX7nYsk0ycjPDcHwDC51rQGido5I13QEdeIfH8=;
  b=CjQZmHKhh40ReecmwgL3XVtWb4Cl/sWHfYkX93rbrhX7+ao9P3gl4c3d
   MYc91p+CPnEVDKtyLQ6/QVXL/twa+Eic7zaW8YzU01stobIYfqx1TLaA0
   8HZR6eSuublqvv3AduwVh5GpOfptNAj+PHZfXlgjioAGY0Wzatbsy0fx8
   odFYZy1KuTzlxG5E/S6cWjq4BxLCY5GnauPAtGi+IVGL+hgjdjtYuzIxz
   C3HSNnBc4I3489GtaGApa0QLN/Ad1XrnHMM1fGo9IzdjqrSECSAbETymk
   GqsSnNwPOQqNy+S9UOMKp1vfg8zJwX+h2ob+c6GNA0hzlgXkBc+1OQ6RB
   g==;
X-CSE-ConnectionGUID: ZmaBwXp7SCePrx5FwrZuvA==
X-CSE-MsgGUID: Jp1mTTx7RsSSsuzWOs4JwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73779503"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="73779503"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 17:06:40 -0800
X-CSE-ConnectionGUID: Fb6imYfYRdyyNHiSGLSlLg==
X-CSE-MsgGUID: fmZ26AOZSoCSufqFWdsyZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="218805096"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Mar 2026 17:06:34 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyJe9-0000000009N-2EjF;
	Fri, 06 Mar 2026 01:06:29 +0000
Date: Fri, 6 Mar 2026 09:06:24 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Frank Rowand <frowand.list@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/6] gpio: move hogs into GPIO core
Message-ID: <202603060850.dUlmPBav-lkp@intel.com>
References: <20260305-gpio-hog-fwnode-v1-2-97d7df6bbd17@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-gpio-hog-fwnode-v1-2-97d7df6bbd17@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_170643_481886_E3E25371 
X-CRM114-Status: GOOD (  12.82  )
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

[auto build test WARNING on c025f6cf4209e1542ec2afebe49f42bbaf1a5c7b]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/gpio-of-clear-OF_POPULATED-on-hog-nodes-in-remove-path/20260305-175735
base:   c025f6cf4209e1542ec2afebe49f42bbaf1a5c7b
patch link:    https://lore.kernel.org/r/20260305-gpio-hog-fwnode-v1-2-97d7df6bbd17%40oss.qualcomm.com
patch subject: [PATCH 2/6] gpio: move hogs into GPIO core
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20260306/202603060850.dUlmPBav-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c32caeec8158d634bb71ab8911a6031248b9fc47)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603060850.dUlmPBav-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603060850.dUlmPBav-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpiolib.c:981:10: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     981 |                 return ret;
         |                        ^~~
   drivers/gpio/gpiolib.c:971:9: note: initialize the variable 'ret' to silence this warning
     971 |         int ret, argc;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +981 drivers/gpio/gpiolib.c

   962	
   963	int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
   964	{
   965		struct fwnode_handle *gc_node = dev_fwnode(&gc->gpiodev->dev);
   966		struct of_phandle_args gpiospec;
   967		enum gpiod_flags dflags;
   968		struct gpio_desc *desc;
   969		unsigned long lflags;
   970		const char *name;
   971		int ret, argc;
   972		u32 gpios[3]; /* We support up to three-cell bindings. */
   973		u32 cells;
   974	
   975		lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
   976		dflags = GPIOD_ASIS;
   977		name = NULL;
   978	
   979		argc = fwnode_property_count_u32(fwnode, "gpios");
   980		if (argc < 0)
 > 981			return ret;
   982		if (argc > 3)
   983			return -EINVAL;
   984	
   985		ret = fwnode_property_read_u32_array(fwnode, "gpios", gpios, argc);
   986		if (ret < 0)
   987			return ret;
   988	
   989		if (is_of_node(fwnode)) {
   990			/*
   991			 * OF-nodes need some additional special handling for
   992			 * translating of devicetree flags.
   993			 */
   994			ret = fwnode_property_read_u32(gc_node, "#gpio-cells", &cells);
   995			if (ret)
   996				return ret;
   997			if (cells && argc != cells)
   998				return -EINVAL;
   999	
  1000			memset(&gpiospec, 0, sizeof(gpiospec));
  1001			gpiospec.np = to_of_node(fwnode);
  1002			gpiospec.args_count = argc;
  1003			memcpy(&gpiospec.args, gpios, argc * sizeof(u32));
  1004	
  1005			ret = of_gpiochip_get_lflags(gc, &gpiospec, &lflags);
  1006			if (ret)
  1007				return ret;
  1008		} else {
  1009			/*
  1010			 * GPIO_ACTIVE_LOW is currently the only lookup flag
  1011			 * supported for non-OF firmware nodes.
  1012			 */
  1013			if (gpios[1])
  1014				lflags |= GPIO_ACTIVE_LOW;
  1015		}
  1016	
  1017		if (fwnode_property_present(fwnode, "input"))
  1018			dflags |= GPIOD_IN;
  1019		else if (fwnode_property_present(fwnode, "output-low"))
  1020			dflags |= GPIOD_OUT_LOW;
  1021		else if (fwnode_property_present(fwnode, "output-high"))
  1022			dflags |= GPIOD_OUT_HIGH;
  1023		else
  1024			return -EINVAL;
  1025	
  1026		fwnode_property_read_string(fwnode, "line-name", &name);
  1027	
  1028		desc = gpiochip_get_desc(gc, gpios[0]);
  1029		if (IS_ERR(desc))
  1030			return PTR_ERR(desc);
  1031	
  1032		ret = gpiod_hog(desc, name, lflags, dflags);
  1033		if (ret)
  1034			return ret;
  1035	
  1036		return 0;
  1037	}
  1038	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

