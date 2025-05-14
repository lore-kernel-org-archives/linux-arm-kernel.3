Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AADC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 20:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wTKbOPf3XzotvKAOKanhpbCzEpXfOtEPWTwnlFlCAWA=; b=R6RS1N+If0SVaGVUnzT82UZF2M
	uS6LGt5N1ulk222vCSABm/PnDWD5wy4cIqdWr7lKAJcLhE0Kgt6NhJlD4nOpvB2TGNQYsaHhf5Jps
	5YplAP0rXnWf/jcjnpWggQ7iNWhAQ/JuThnYOZBknKalDlt6KjT8v95en6+h/inqtAbTS2PhHbK3z
	1bAZ/1mIUXNFEKP7p4t6xse8RY/UvincHbJPWRNvE5GsqV3vwIFZOk03DiJ0pX2y2TorIWEIjQ9io
	dAhjm61njm3XnHmJtsY1M7v9h08AimzkkVB52OO/t94r/NsRQF8+jI/+ZQ6oMmh4/AnwquZCOixEr
	gjoX5JDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFIbT-0000000GHFj-0fNe;
	Wed, 14 May 2025 20:21:23 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFIZQ-0000000GGj0-1tYu;
	Wed, 14 May 2025 20:19:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747253956; x=1778789956;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hYrU9RvV+4y2DHFLaQiCECHzjwEV+OkrnWnu8hwtrgU=;
  b=bbGSPkzBkSZeM9UmzZ0OLtKj/hmX6PfJAzzNxaEVEXXwW6uiJhF9rGeN
   5u5aVyqA33j/+v5akUMUdjWH3JYpvKos2qIjJRtChKXsO9KAKzc839hmv
   9PPhTDlNSsAQ9EhAMsF3JrCzHUiSh/CMNuYPoo/hO0siADILeU/QDnBKA
   4RtEs+I3mtXm534aEyI2bU59eTwqscx+72zaSgDI9JyjBacq1YgP5nK+4
   p97X3fl5VhvvSuQH9cbDUugBjzgI+QNqzoYdLM584SVqcngq1RyEBU7TU
   0+kynqUbcPofl+8lqi0QkBuz9x6KZ7ltcEzCbVaqVFMTS/mmOVY4O41Mg
   Q==;
X-CSE-ConnectionGUID: 4Bh+nJZcT1GsYVcIJUfEdA==
X-CSE-MsgGUID: ngbVKdk+RG+/2YsYdVOLxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="71677947"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="71677947"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 13:19:14 -0700
X-CSE-ConnectionGUID: aoXVi9WcQ9WWpZlstv9FhA==
X-CSE-MsgGUID: c9k03sXERRO7riqhJkfvNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="169084389"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 May 2025 13:19:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFIZH-000HWZ-2b;
	Wed, 14 May 2025 20:19:07 +0000
Date: Thu, 15 May 2025 04:18:24 +0800
From: kernel test robot <lkp@intel.com>
To: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: Re: [PATCH 5/8] pinctrl: meson: support amlogic S6/S7/S7D SoC
Message-ID: <202505150408.vMuuQH5G-lkp@intel.com>
References: <20250514-s6-s7-pinctrl-v1-5-39d368cad250@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-s6-s7-pinctrl-v1-5-39d368cad250@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_131916_553842_8F8525BB 
X-CRM114-Status: GOOD (  10.31  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on aa94665adc28f3fdc3de2979ac1e98bae961d6ca]

url:    https://github.com/intel-lab-lkp/linux/commits/Xianwei-Zhao-via-B4-Relay/dt-bindings-pinctl-amlogic-pinctrl-a4-Add-compatible-string-for-S7/20250514-150438
base:   aa94665adc28f3fdc3de2979ac1e98bae961d6ca
patch link:    https://lore.kernel.org/r/20250514-s6-s7-pinctrl-v1-5-39d368cad250%40amlogic.com
patch subject: [PATCH 5/8] pinctrl: meson: support amlogic S6/S7/S7D SoC
config: arm64-randconfig-004-20250514 (https://download.01.org/0day-ci/archive/20250515/202505150408.vMuuQH5G-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505150408.vMuuQH5G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505150408.vMuuQH5G-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/meson/pinctrl-amlogic-a4.c:128:13: error: designator into flexible array member subobject
     128 |         .multi_data[0] = {
         |                    ^~~~~~~
     129 |                 .m_bank_id = AMLOGIC_GPIO_CC,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     130 |                 .m_bit_offs = 24,
         |                 ~~~~~~~~~~~~~~~~~
     131 |                 .sid = (AMLOGIC_GPIO_X << 8) + 16,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     132 |                 .eid = (AMLOGIC_GPIO_X << 8) + 19,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     133 |         },
         |         ~
   drivers/pinctrl/meson/pinctrl-amlogic-a4.c:69:19: note: initialized flexible array member 'multi_data' is here
      69 |         struct multi_mux multi_data[];
         |                          ^
   drivers/pinctrl/meson/pinctrl-amlogic-a4.c:138:13: error: designator into flexible array member subobject
     138 |         .multi_data[0] = {
         |                    ^~~~~~~
     139 |                 .m_bank_id = AMLOGIC_GPIO_CC,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     140 |                 .m_bit_offs = 24,
         |                 ~~~~~~~~~~~~~~~~~
     141 |                 .sid = (AMLOGIC_GPIO_X << 8) + 16,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     142 |                 .eid = (AMLOGIC_GPIO_X << 8) + 19,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     143 |         },
         |         ~
   drivers/pinctrl/meson/pinctrl-amlogic-a4.c:69:19: note: initialized flexible array member 'multi_data' is here
      69 |         struct multi_mux multi_data[];
         |                          ^
   drivers/pinctrl/meson/pinctrl-amlogic-a4.c:144:13: error: designator into flexible array member subobject
     144 |         .multi_data[1] = {
         |                    ^~~~~~~
     145 |                 .m_bank_id = AMLOGIC_GPIO_F,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     146 |                 .m_bit_offs = 4,
         |                 ~~~~~~~~~~~~~~~~
     147 |                 .sid = (AMLOGIC_GPIO_D << 8) + 6,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     148 |                 .eid = (AMLOGIC_GPIO_D << 8) + 6,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     149 |         },
         |         ~
   drivers/pinctrl/meson/pinctrl-amlogic-a4.c:69:19: note: initialized flexible array member 'multi_data' is here
      69 |         struct multi_mux multi_data[];
         |                          ^
   3 errors generated.


vim +128 drivers/pinctrl/meson/pinctrl-amlogic-a4.c

   125	
   126	const struct aml_pctl_data s7_priv_data = {
   127		.number = 1,
 > 128		.multi_data[0] = {
   129			.m_bank_id = AMLOGIC_GPIO_CC,
   130			.m_bit_offs = 24,
   131			.sid = (AMLOGIC_GPIO_X << 8) + 16,
   132			.eid = (AMLOGIC_GPIO_X << 8) + 19,
   133		},
   134	};
   135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

