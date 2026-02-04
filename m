Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA21FE9538F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 12:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJtZH3fJEhinzYeX9oLa4RMlTVQiEZy/hlRDAYV69sI=; b=N16T9dehmj43BLcsszbjqqRuRe
	1x9bCAAa2uZwtk1+fmoA07c4sbk01iKiTPCE/fCnymvS0+t5C1AmNQecYtVkdq5qk1iWSxbfDl6lL
	GmlGu9B/lDIQg7PuYEAIvV9Kxs3lMYP371/5FlLtYwkxtLMg+MKrTgvXlZHJaEYtvtGROlw0a9M4z
	tD/tJorWFcz5ryigTyRvPQemrqTiOE2oIUXhPrLPfZIqw/Ox80E65ajRn7rMurWNihBoqpmm4u95o
	tmojCAGMEAH1KmtJN4i1jandgmssU08LrFivjWOhNGOesz6/6abREHQgQrK7pcAY/N0Rh/xjBVpDS
	Ch7duBmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnbiJ-00000008Py3-2zLX;
	Wed, 04 Feb 2026 12:10:31 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnbiG-00000008PxR-30Q6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 12:10:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770207029; x=1801743029;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+PD9kPlOhiNRJ5eVE2tCAKpwL+HFCmAsSnc7GfEb0C8=;
  b=G77mW6wQq4s5XKTG3jzgKcEu4L0QVM+SinC5WActRav9wqcwbq4WHayJ
   OqlVc9I/NYX3VzVtdAyaygQ4aruXcCkJRPoOO3EdvCRwsX5nzl8H++Z6i
   OR4Nd5AUuTtBfh0aNRX0l2CuNaD7nKMOSErpzWDaNSfyIMKcnoKQfVfPk
   HixJzNz2+Ik0XSRiuLNewF7y2dIj5X5KgqkEv9XyLck0LLz42epjCf8F1
   Elpppt5AWW9D4AKXB6398SYVU2Dc2LZcqG4dm5UV3BKVXQVoofY2QegD2
   8omQblaNoytO1jPzdfecjjPPDBjcnoeMMYWcLTKpJoS4s5+tpiE4qyhaq
   w==;
X-CSE-ConnectionGUID: Fn1EmLnuQ/296YT0jRbTPw==
X-CSE-MsgGUID: 3ltyavTZRvixHrgKJkt5VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71425506"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="71425506"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 04:10:27 -0800
X-CSE-ConnectionGUID: jMqUk0dMRq+vKyxseg0bNg==
X-CSE-MsgGUID: L6+UxEbmTEq/Tlho+El/GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="209244113"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 Feb 2026 04:10:21 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnbi5-00000000hlQ-20h9;
	Wed, 04 Feb 2026 12:10:17 +0000
Date: Wed, 4 Feb 2026 20:10:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?iso-8859-1?Q?J=E9r=E9mie?= Dautheribes <jeremie.dautheribes@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	"Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Subject: Re: [PATCH v3 4/5] gpio: aaeon: Add GPIO driver for SRG-IMX8P MCU
Message-ID: <202602042017.bULyWOXm-lkp@intel.com>
References: <20260203-dev-b4-aaeon-mcu-driver-v3-4-0a19432076ac@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203-dev-b4-aaeon-mcu-driver-v3-4-0a19432076ac@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_041028_824244_6FB52FA4 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on d358e5254674b70f34c847715ca509e46eb81e6f]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Perrot-Schneider-Electric/dt-bindings-vendor-prefixes-Add-AAEON-vendor-prefix/20260204-004221
base:   d358e5254674b70f34c847715ca509e46eb81e6f
patch link:    https://lore.kernel.org/r/20260203-dev-b4-aaeon-mcu-driver-v3-4-0a19432076ac%40bootlin.com
patch subject: [PATCH v3 4/5] gpio: aaeon: Add GPIO driver for SRG-IMX8P MCU
config: mips-randconfig-r113-20260204 (https://download.01.org/0day-ci/archive/20260204/202602042017.bULyWOXm-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602042017.bULyWOXm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602042017.bULyWOXm-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "aaeon_mcu_i2c_xfer" [drivers/gpio/gpio-aaeon-mcu.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=m]
   Selected by [m]:
   - CAN [=m] && NET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

