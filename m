Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FE8D1CA19
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 03:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FjJDy4EalIYtryHa0xuzOQVcUTbIUVLRXg2U+P7ZYM=; b=Cpa0iUsSYj8yUkuDV1p8mPMPOa
	GMFjZdAQQ3f0gknK2NHISfczOh+0neDsbBoRU9EMiNU5w6y1aMUf1rhyE9nRlCDhw0mHdWDBQ/4MN
	wvsHayXMcOQis1XrcceqzHuVBEpEg1LCQaadvz6lF2iPDB8EjH1S693cGY7x4zzEMo+JxSppnI5EN
	ZUbcrEr82jfugtXA4K+UrZYsiRvRVygaDd0LngEli4JKZcbJVcXhjvKPvwXFg6gkvGK2llbgpvF/6
	bUL7ooTA0qhQliKu4wVJViBpwkvCYb93ed+CMUC7QlvapkffVZWbBiSkqeKFcX5iupRAGZt9MBAB+
	VKdcr99w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8AaU-0000000Fo3I-0sku;
	Tue, 05 Nov 2024 03:50:38 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8AX9-0000000Fnia-3VDb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 03:47:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730778432; x=1762314432;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8TsvSQbE65UhTUrEuiAcFPCLHnlzDnvn34YkdDVwTWo=;
  b=dFobxGIfZpzHTTq0a009nKqMR98+Cxj3tkAl8gk/EJ/JcOEl1Ya8pJPF
   EIkOsmCKP8D4iUlZEc/OKvhnOjX95BUQbpnxu9rO3Y3KErQmR831vp/1V
   xg3jFcdJfO1xcKh/Hxn/5KbKfwwtNd0FI/Vlmt2VTJMEK8T22kVwWAbZX
   ZbTDQi63uXxj8y5T3obK/CAlvJrcsm0NEmOd0FZiwrKTOuyO5dL2O2YJQ
   lb/CuIu7DWLfONvdO7rxv3cJsJThoJ1rmXZMHgV7tL4NvY2RT09cqEDA0
   JQ7f1bIbFGL4cSOk5D17bOCjcyZmBx/3RXfh5Hd0JG2MlWDGIV/ZbBbav
   w==;
X-CSE-ConnectionGUID: pURpI28WSueI+AyUDdHTnQ==
X-CSE-MsgGUID: u6rMaozRSH2FBikZoJUb2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="29925007"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="29925007"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 19:47:06 -0800
X-CSE-ConnectionGUID: pBn/4mjpR56YEC47o0gLrQ==
X-CSE-MsgGUID: A0enPtwYTPWI2zbCLPgtuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="88366033"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Nov 2024 19:47:01 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8AWx-000lZh-1m;
	Tue, 05 Nov 2024 03:46:59 +0000
Date: Tue, 5 Nov 2024 11:46:27 +0800
From: kernel test robot <lkp@intel.com>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= via B4 Relay <devnull+duje.mihanovic.skole.hr@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
	Lubomir Rintel <lkundrak@v3.sk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RESEND v13 10/12] arm64: Kconfig.platforms: Add config
 for Marvell PXA1908 platform
Message-ID: <202411051124.7S823oLf-lkp@intel.com>
References: <20241104-pxa1908-lkml-v13-10-e050609b8d6c@skole.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104-pxa1908-lkml-v13-10-e050609b8d6c@skole.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_194712_033946_8C5B260C 
X-CRM114-Status: GOOD (  10.75  )
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

Hi Duje,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9852d85ec9d492ebef56dc5f229416c925758edc]

url:    https://github.com/intel-lab-lkp/linux/commits/Duje-Mihanovi-via-B4-Relay/clk-mmp-Switch-to-use-struct-u32_fract-instead-of-custom-one/20241105-010102
base:   9852d85ec9d492ebef56dc5f229416c925758edc
patch link:    https://lore.kernel.org/r/20241104-pxa1908-lkml-v13-10-e050609b8d6c%40skole.hr
patch subject: [PATCH RESEND v13 10/12] arm64: Kconfig.platforms: Add config for Marvell PXA1908 platform
config: arm64-kismet-CONFIG_I2C_GPIO-CONFIG_VIDEO_MMP_CAMERA-0-0 (https://download.01.org/0day-ci/archive/20241105/202411051124.7S823oLf-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241105/202411051124.7S823oLf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411051124.7S823oLf-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for I2C_GPIO when selected by VIDEO_MMP_CAMERA
   WARNING: unmet direct dependencies detected for I2C_GPIO
     Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (GPIOLIB [=n] || COMPILE_TEST [=n])
     Selected by [y]:
     - VIDEO_MMP_CAMERA [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && V4L_PLATFORM_DRIVERS [=y] && I2C [=y] && VIDEO_DEV [=y] && (ARCH_MMP [=y] || COMPILE_TEST [=n]) && COMMON_CLK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

