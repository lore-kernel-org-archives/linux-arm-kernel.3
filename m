Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CE8C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 16:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lkJoeqTokIW33gZr+ORI1JiQpsL7lJ5VnNFt0bbNP4E=; b=guSjStJMfFCAFsu3wjHeF+beoz
	CRK/aR/Zw3OP8rpxH15Ww6JKhUW//xzVYpMnsPt64GaguWVlyYeVQIcazFInYxqIUcD54IaTpLl1x
	9QjEclQKuB0r8dCD0CtE/fV5wyblp3ciJMLFw9MpvXxa29y0e2WyH9awxomE3DpQgoM4Uxz+UR4xe
	YaIkP+coNAYlMTlDUAgAMhqsWH4dHpzf2KepwdLPfN5yrCOxi8ENfhCw9lpWO/34HBOQsyDZK7Con
	GVAc/SZ/9hDyCciW3pdmRQ44za4cWpai1TNk9/X/q6MPEGF5PtEbHT0YE1KQBXIR89/E7KLoarr0B
	oXu2d/Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKJdS-0000000DezV-3YrU;
	Wed, 28 May 2025 16:28:10 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKIpM-0000000DZKP-3A6f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 15:36:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748446585; x=1779982585;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=NyxJjdO0uqLgRbXeG3fMSXDtDw3lT9wwstsorauv94E=;
  b=OCeUZ5ZyAPJ7zEuTg/L9QQRXzC/vkNOKcqZSTMi1/x1h9uiXmNnznN04
   wg9m9B584/ma/smNrHC4Aq/4yopUgaXIx4uBa6U9G+JbpC78tadDDhBaz
   /KOxfpB97czzCocbS71u0CsOIJaSLbuKofxPUonFbNfmpfyaK+K4uwVi1
   FypwzTQeghBU3Ml1j851k9NaDDrjLAbIRANhQVnzSLUhnnKWnkVGCEW7J
   5Nsjmv4VT3dDm9rb0siLYF81iwFmP3V2qJkkkMe0G7qJ7hP0bU4GBSwL8
   vhK3lAAhAUW+kXlonr7GRZi+BmOQFbAKCsE284cVySTQs5MzRr1nPGGos
   g==;
X-CSE-ConnectionGUID: rstV7NCZRXujsyWTDKsjHw==
X-CSE-MsgGUID: PVxRrmw8RmeVxjAPKCNgzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="67894313"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="67894313"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 08:36:22 -0700
X-CSE-ConnectionGUID: ZOSc//TGTDiNqLFdZkNVow==
X-CSE-MsgGUID: 4kneYjTAQt+FRNP8RxgZhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="147154189"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 May 2025 08:36:19 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKIpE-000VnY-2r;
	Wed, 28 May 2025 15:36:16 +0000
Date: Wed, 28 May 2025 23:36:16 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Subject: Re: [PATCH v4 4/9] =?iso-8859-1?Q?MAINTAIN?=
 =?iso-8859-1?Q?ERS=3A_add_Cl=E9ment?= Le Goffic as STM32 HDP maintainer
Message-ID: <202505282333.T9mzfGT8-lkp@intel.com>
References: <20250528-hdp-upstream-v4-4-7e9b3ad2036d@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250528-hdp-upstream-v4-4-7e9b3ad2036d@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_083624_836626_36E6EE41 
X-CRM114-Status: GOOD (  10.77  )
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

Hi Clément,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a08b2b34239e63bd839078de98911d3653cdab83]

url:    https://github.com/intel-lab-lkp/linux/commits/Cl-ment-Le-Goffic/gpio-mmio-add-BGPIOF_NO_INPUT-flag-for-GPO-gpiochip/20250528-213620
base:   a08b2b34239e63bd839078de98911d3653cdab83
patch link:    https://lore.kernel.org/r/20250528-hdp-upstream-v4-4-7e9b3ad2036d%40foss.st.com
patch subject: [PATCH v4 4/9] MAINTAINERS: add Clément Le Goffic as STM32 HDP maintainer
reproduce: (https://download.01.org/0day-ci/archive/20250528/202505282333.T9mzfGT8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505282333.T9mzfGT8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl-hdp.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
   Can't build as 1 mandatory dependency is missing at ./scripts/sphinx-pre-install line 984.
   make[2]: *** [Documentation/Makefile:121: htmldocs] Error 255
   make[1]: *** [Makefile:1799: htmldocs] Error 2
   make: *** [Makefile:248: __sub-make] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

