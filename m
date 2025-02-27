Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E57C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 08:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DWTP4AXqqiCep0Jx0uQmmll/rQYbTsz4gOWq/iHZ0Jc=; b=w942m/92hoz290mi8Nk0OWCec9
	O8ZTSk49lVDKzKsk3IjI+HiMwRtPKgCu50VcolIb19s63s1cQgedyQNskryNxJRV9WC84ldSYxSXE
	1a+WBze5q5akydJ95HIs8vZ8sLq48TSUQhnPYT4E9ziNMAM80yYRrwft+qDwy8krmvj2yR191mPnK
	+x9SOQ0Og+aZYx6K85AS6Z0MXaiOdwVgmZ9V9gfAR6Kao2PqGMmus5ofZwpn28dA0YgvYBj7xsq5W
	ppZGYvqQ51hFt0idVNZ0KMQ5K40Xf7jEW+X6THDC6VHOs4GenMGE1ZMIACIKCoCUdg9AvYjf8JcVA
	WEDNHdeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnYqj-00000006cn6-0S9X;
	Thu, 27 Feb 2025 08:02:29 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnYpA-00000006cXK-1Ds8;
	Thu, 27 Feb 2025 08:00:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740643253; x=1772179253;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GERZIpGTfivi/XxhhXMCRz1fUPVlachQDluzBuUuNF0=;
  b=VogtjN9uefWOjw0DGUlqS6rho6BWtJGOAcRDzWmlWQp1CRQfmeW2ziS5
   8PWEA3yjmWzDsrACqDkXkbsZMXDXmUvfF2vtT6QWbSoVMUNhzmSXPrRdy
   3fhT/gXlSGttT8vxpBS3exLZIKzfHM8SPC5+m56y5SyCrWokPHBWDHHF3
   RkYNJaBbqpsYCIcS+BZGMt1FbvAFIGd6fxHPw+La5ysN6kfTDZc0I8p2T
   hXNqO9KHgHn+kivmFHgkcsopsdsuTfAC6F/FNGLcNilEyYk/CrZDR7UK4
   ydcfkaGXKIDesJ+VD3lLNgZXY/Y3UsyDW6nYXf5yofOqlvsHrMXNpVhzE
   Q==;
X-CSE-ConnectionGUID: PeQS9KK3RASmhWA/dTpS4A==
X-CSE-MsgGUID: 4mKrJWk0SLi9kiTxBRrBBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="45300310"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="45300310"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 00:00:50 -0800
X-CSE-ConnectionGUID: Mi5AFG9QStWCHdsceajeag==
X-CSE-MsgGUID: 0dQJGJDzR1O3bz8fqtjv/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="122067414"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 27 Feb 2025 00:00:46 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnYoX-000D38-20;
	Thu, 27 Feb 2025 08:00:34 +0000
Date: Thu, 27 Feb 2025 15:59:28 +0800
From: kernel test robot <lkp@intel.com>
To: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: Re: [PATCH v2 2/4] irqchip: Add support for Amlogic A4 and A5 SoCs
Message-ID: <202502271527.emvNC71m-lkp@intel.com>
References: <20250226-irqchip-gpio-a4-a5-v2-2-c55b1050cb55@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226-irqchip-gpio-a4-a5-v2-2-c55b1050cb55@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_000052_378770_0CC7E95C 
X-CRM114-Status: GOOD (  10.96  )
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

Hi Xianwei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 953913df9c3ab6f496c6facd5aa7fc9f2f847ac2]

url:    https://github.com/intel-lab-lkp/linux/commits/Xianwei-Zhao-via-B4-Relay/dt-bindings-interrupt-controller-Add-support-for-Amlogic-A4-and-A5-SoCs/20250226-135013
base:   953913df9c3ab6f496c6facd5aa7fc9f2f847ac2
patch link:    https://lore.kernel.org/r/20250226-irqchip-gpio-a4-a5-v2-2-c55b1050cb55%40amlogic.com
patch subject: [PATCH v2 2/4] irqchip: Add support for Amlogic A4 and A5 SoCs
config: arc-randconfig-001-20250227 (https://download.01.org/0day-ci/archive/20250227/202502271527.emvNC71m-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502271527.emvNC71m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502271527.emvNC71m-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-meson-gpio.c:58:12: warning: 'meson_ao_gpio_irq_set_type' declared 'static' but never defined [-Wunused-function]
      58 | static int meson_ao_gpio_irq_set_type(struct meson_gpio_irq_controller *ctl,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +58 drivers/irqchip/irq-meson-gpio.c

    45	
    46	struct meson_gpio_irq_controller;
    47	static void meson8_gpio_irq_sel_pin(struct meson_gpio_irq_controller *ctl,
    48					    unsigned int channel, unsigned long hwirq);
    49	static void meson_gpio_irq_init_dummy(struct meson_gpio_irq_controller *ctl);
    50	static void meson_a1_gpio_irq_sel_pin(struct meson_gpio_irq_controller *ctl,
    51					      unsigned int channel,
    52					      unsigned long hwirq);
    53	static void meson_a1_gpio_irq_init(struct meson_gpio_irq_controller *ctl);
    54	static int meson8_gpio_irq_set_type(struct meson_gpio_irq_controller *ctl,
    55					    unsigned int type, u32 *channel_hwirq);
    56	static int meson_s4_gpio_irq_set_type(struct meson_gpio_irq_controller *ctl,
    57					      unsigned int type, u32 *channel_hwirq);
  > 58	static int meson_ao_gpio_irq_set_type(struct meson_gpio_irq_controller *ctl,
    59					      unsigned int type, u32 *channel_hwirq);
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

