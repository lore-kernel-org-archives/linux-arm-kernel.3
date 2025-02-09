Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D061DC02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 05:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4f+AQvoKCIHHgxRWdT9otBPAsReCy6lALJnC1iMUhBc=; b=Y1BtgznLs6kiQu1iVnqIh082Kg
	g3dSjogbbZ0maiwLJP5bx6Z1oP+M8Y8AzFcIWT9buVHjcGkILIV9158XlvUdHamDXmaizeI7ePSML
	TyM6wEqadBJ51cR+fCYP/FU1ol3NZT/pOmpwAdjGQAhKWjUn02AJxocc57ZfAOxL7TlAmcKDYJHHl
	DMrv+7EoMvKiJrAxp1pCVLP1clvKEEOuYDwBKGXUGnGCMnsb+ur5l/NvV94LzZkTrl6GGWYDi2PAD
	9AfzMn/4Rr6kxv38YviZuvCjKzi204nFY55RKgSlKD5grybGyUYtiHw20dROpOQ1hkmVGBnNkcIZk
	AwQr4kXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th01Z-0000000EA7q-0oWq;
	Sun, 09 Feb 2025 05:38:33 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th009-0000000E9zu-3vkL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 05:37:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739079426; x=1770615426;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LQYHpToHZqvrvUEO8vPOG+RisUsfNychAkbijb2JVT4=;
  b=ERRujRkSB7P3dZ8zl3OYY+gT3KQyBDz69WfQn3YA2oeYMT92jwQaGhPJ
   Ms2buPQfLa/GqrAUbZy4RJ7917vrsfAYYgit4xYnJucoHhwQEa+XLm8vI
   A0048hzhhnREfKjfpvq17x9vTjs6yGmAYhkkJ694AAopbnxPXkEngIUa8
   QRg1mBQ55fiMOZzOVt/Y0EUei2GhFgfs9DCBTT3KkuvEiZz5PJe7qgpTw
   VhFudRNZ3HrG/YQCw8529VQ0ZLKkiDSuHGUVqw+965X9UdB61bAv/DrKe
   fZ0FIHjCL2RiqxeEcAjUQ3Hrn97Y43HqwJgCgYnYnYwYfbD6PGCtAtKEv
   A==;
X-CSE-ConnectionGUID: wU3pMf0cQweOTB5hII4eww==
X-CSE-MsgGUID: uR7R4Q7CRum8Cqjvuxt4zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="62157870"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="62157870"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 21:37:04 -0800
X-CSE-ConnectionGUID: uJznlC4YT/+W9s625x6DMA==
X-CSE-MsgGUID: /jWVE8OJTeyAq4L1lGPEag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116486851"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Feb 2025 21:37:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1th001-00117X-3A;
	Sun, 09 Feb 2025 05:36:57 +0000
Date: Sun, 9 Feb 2025 13:36:00 +0800
From: kernel test robot <lkp@intel.com>
To: Artur Weber <aweber.kernel@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Christian Daudt <bcm@fixthebug.org>,
	Sherman Yin <syin@broadcom.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	Artur Weber <aweber.kernel@gmail.com>
Subject: Re: [PATCH 4/7] pinctrl: bcm281xx: Provide pinctrl device info as OF
 platform data
Message-ID: <202502091354.vwFJOxGn-lkp@intel.com>
References: <20250207-bcm21664-pinctrl-v1-4-e7cfac9b2d3b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207-bcm21664-pinctrl-v1-4-e7cfac9b2d3b@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_213706_075225_B882C0C1 
X-CRM114-Status: GOOD (  11.05  )
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

Hi Artur,

kernel test robot noticed the following build errors:

[auto build test ERROR on ffd294d346d185b70e28b1a28abe367bbfe53c04]

url:    https://github.com/intel-lab-lkp/linux/commits/Artur-Weber/dt-bindings-pinctrl-Add-bindings-for-BCM21664-pin-controller/20250208-040646
base:   ffd294d346d185b70e28b1a28abe367bbfe53c04
patch link:    https://lore.kernel.org/r/20250207-bcm21664-pinctrl-v1-4-e7cfac9b2d3b%40gmail.com
patch subject: [PATCH 4/7] pinctrl: bcm281xx: Provide pinctrl device info as OF platform data
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20250209/202502091354.vwFJOxGn-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502091354.vwFJOxGn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502091354.vwFJOxGn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/bcm/pinctrl-bcm281xx.c:971:19: error: initializer element is not a compile-time constant
           .regmap_config = bcm281xx_pinctrl_regmap_config,
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/bcm/pinctrl-bcm281xx.c:1424:6: warning: unused variable 'rc' [-Wunused-variable]
           int rc;
               ^
   1 warning and 1 error generated.


vim +971 drivers/pinctrl/bcm/pinctrl-bcm281xx.c

   962	
   963	static const struct bcm281xx_pinctrl_info bcm281xx_pinctrl = {
   964		.device_type = BCM281XX_PINCTRL_TYPE,
   965	
   966		.pins = bcm281xx_pinctrl_pins,
   967		.npins = ARRAY_SIZE(bcm281xx_pinctrl_pins),
   968		.functions = bcm281xx_functions,
   969		.nfunctions = ARRAY_SIZE(bcm281xx_functions),
   970	
 > 971		.regmap_config = bcm281xx_pinctrl_regmap_config,
   972	};
   973	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

