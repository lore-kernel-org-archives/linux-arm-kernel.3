Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0664EE6F092
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 21:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1IDjURZL/rhomMhFYD9E8suKZT7gMZrpBfEiK+YGGeA=; b=p+SWrjy/qY0BMbSIXxMcwahK9Z
	eP/c4OAZrZ8cAmIMaoR7zdJPE5LvQSzsZvyUrwmdGb9YmbqswXVBhiSgNAWpX+21YiHvFs0Czi2gz
	lQCB+CXuNPfeP7A/EL8eCC8DCW5W/AWenFlZw8b8jqAARRyBE4K9But6fI9BhN1h5zY2cH+Oh26I1
	8ZL2rnE5i9k6vDyAo4ByXmcR5m7JMJaD+30v6s2JGCTVxOwtTAasPSelP4ajeV2qwok23hd/Zd8if
	MjwKd5/g80i5qWnszUyxZG1WYcTxHJSf1ZfNaS+xXIXQa3pWVNdE/9tLhEGQtB1v/fb9XqaK8WVJj
	xMCjFhsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6zWk-00000008OkM-0pIP;
	Fri, 01 Nov 2024 21:49:54 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6zV4-00000008Oa1-3VX2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 21:48:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730497691; x=1762033691;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Dwdq9rHIpOh+78kD6lWNmELuBrWSfYZSR/MPnUOKJUA=;
  b=G1bOhbKjnTLSnzoBoWsYOT4xb/H/DB/RvWXPLjq4+3rNiUe9EpIvvPbI
   ZWjegthzH0zM1boYQNpUOpAQSJFkkh9KewPs0qNuMFpXBzoIS8tWl8tEv
   PV4vvgQ9bu1z1ZPEdvNmI9oiw60baLfJC2Qp2QOAyQwTiKYQ/Yt35qAdk
   QjpZh5zeHCE+qMhczPKP/cJN7CnywvKv87T2x2ObwYCX7G66UNa3caC1f
   jcDbegtv8FlzoV7EEg3to/Daz3NmJmDrebQa2pe6AzDbBS3avuVVQ0O7Y
   o9sdnpwmIa/yY8dsWPWffUmqNGuv1zZaM2egvHP9fCRM74yQRxlJ+FKI7
   w==;
X-CSE-ConnectionGUID: oEmWPJBfR7CDp6KktGVigQ==
X-CSE-MsgGUID: wMawmE6LRCWiVPDo+ye+xA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30229828"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30229828"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 14:48:07 -0700
X-CSE-ConnectionGUID: 9w/56nX/RnCHrAdIl5pDBA==
X-CSE-MsgGUID: yEtcosP4Tc+1RCMNMWkXcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="82613540"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 01 Nov 2024 14:48:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6zUt-000i55-08;
	Fri, 01 Nov 2024 21:47:59 +0000
Date: Sat, 2 Nov 2024 05:47:53 +0800
From: kernel test robot <lkp@intel.com>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev
Subject: Re: [PATCH v5 4/7] pinctrl: s32: convert the driver into an mfd cell
Message-ID: <202411020514.qOUrieWa-lkp@intel.com>
References: <20241101080614.1070819-5-andrei.stefanescu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101080614.1070819-5-andrei.stefanescu@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_144810_944542_CE455F99 
X-CRM114-Status: GOOD (  14.86  )
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

Hi Andrei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next lee-mfd/for-mfd-next shawnguo/for-next linus/master v6.12-rc5 next-20241101]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrei-Stefanescu/dt-bindings-mfd-add-support-for-the-NXP-SIUL2-module/20241101-160940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20241101080614.1070819-5-andrei.stefanescu%40oss.nxp.com
patch subject: [PATCH v5 4/7] pinctrl: s32: convert the driver into an mfd cell
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241102/202411020514.qOUrieWa-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411020514.qOUrieWa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411020514.qOUrieWa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/nxp/pinctrl-s32cc.c:103: warning: Function parameter or struct member 'gpio_configs_lock' not described in 's32_pinctrl'
>> drivers/pinctrl/nxp/pinctrl-s32cc.c:103: warning: Excess struct member 'gpiop_configs_lock' description in 's32_pinctrl'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +103 drivers/pinctrl/nxp/pinctrl-s32cc.c

fd84aaa8173d3f Chester Lin       2023-02-20   82  
157a51f7e5e81e Andrei Stefanescu 2024-11-01   83  /**
157a51f7e5e81e Andrei Stefanescu 2024-11-01   84   * struct s32_pinctrl - private driver data
fd84aaa8173d3f Chester Lin       2023-02-20   85   * @dev: a pointer back to containing device
fd84aaa8173d3f Chester Lin       2023-02-20   86   * @pctl: a pointer to the pinctrl device structure
fd84aaa8173d3f Chester Lin       2023-02-20   87   * @regions: reserved memory regions with start/end pin
fd84aaa8173d3f Chester Lin       2023-02-20   88   * @info: structure containing information about the pin
fd84aaa8173d3f Chester Lin       2023-02-20   89   * @gpio_configs: Saved configurations for GPIO pins
fd84aaa8173d3f Chester Lin       2023-02-20   90   * @gpiop_configs_lock: lock for the `gpio_configs` list
157a51f7e5e81e Andrei Stefanescu 2024-11-01   91   * @saved_context: Configuration saved over system sleep
fd84aaa8173d3f Chester Lin       2023-02-20   92   */
fd84aaa8173d3f Chester Lin       2023-02-20   93  struct s32_pinctrl {
fd84aaa8173d3f Chester Lin       2023-02-20   94  	struct device *dev;
fd84aaa8173d3f Chester Lin       2023-02-20   95  	struct pinctrl_dev *pctl;
fd84aaa8173d3f Chester Lin       2023-02-20   96  	struct s32_pinctrl_mem_region *regions;
fd84aaa8173d3f Chester Lin       2023-02-20   97  	struct s32_pinctrl_soc_info *info;
fd84aaa8173d3f Chester Lin       2023-02-20   98  	struct list_head gpio_configs;
fd84aaa8173d3f Chester Lin       2023-02-20   99  	spinlock_t gpio_configs_lock;
fd84aaa8173d3f Chester Lin       2023-02-20  100  #ifdef CONFIG_PM_SLEEP
fd84aaa8173d3f Chester Lin       2023-02-20  101  	struct s32_pinctrl_context saved_context;
fd84aaa8173d3f Chester Lin       2023-02-20  102  #endif
fd84aaa8173d3f Chester Lin       2023-02-20 @103  };
fd84aaa8173d3f Chester Lin       2023-02-20  104  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

