Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B277EC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 08:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L97ZG5NL6xVHCoyCNmGgV001wuFb1nzJpP9sCh9oKLM=; b=ifJi2nWB6u0ukcY+VQ7e9RytZW
	zFcPXSqLnf7u0bvu/HGk0WHt/uP+UvXmSMK66VYuY8SViykV97XZHypmv1aAKp77HU8GmEM/nhK+8
	TjNvdFIxiZN5e2pKJJtl8wErMXFuremOXQOrFR+uJW7nw6kngnfN/ksr37+w9lQ1oEWYdiYHXpMzc
	44hC0JSyzcF2WmFOwGIAKyMirQKz0o2mgVRH4w4kK1u5rqKvsiaKg/bSuJEVsb0SolE9Cb6/asRrO
	+HImGum9VF5QtakazTvRzpGd3EWN3o8pW7EJ6H+pdQWt7eowmt9TIn8pISW129IjgLLRkE8+Qca8w
	89Ddg0wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvBO1-0000000BY95-0etX;
	Thu, 20 Mar 2025 08:36:21 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvBIT-0000000BXEZ-3Syc;
	Thu, 20 Mar 2025 08:30:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742459437; x=1773995437;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2i1Q07byf32WTdPpCVWmD1WwQ9vrhVP60iBQr1OWOto=;
  b=a8UmRT4ihr1AR0wUYjFwWAJgVOeYgfUNdsLDI4ujOd92D5wTzrl2YnCr
   aWH01ek5yx/T6V0OPoC871KforKO0izaU+qO/x3bwq+udqHMhyT2Xf2HI
   S43GYEw8tsk/Spgxk5EYyo9iIGMp/lmG64yst8+5wZmghuoBljvTNe1/I
   IBzW0eFYxuBzBWpR6GpmOEB/YzUIz/RozV9CkCp7O8Unh/ruqtuqULFV7
   vZcJn05GnxGV/0MgYRtHFl/mor0uha9VdIXETOdOoXURCcc/uryIvbLL0
   Si6fjqSmFOYOmzzlruWHgjpQ/EYsRPoZ3sU+HB9Bv7NyO6veP81XjzeTS
   w==;
X-CSE-ConnectionGUID: 6hvFo2uWTfqb9zOs0laZqQ==
X-CSE-MsgGUID: iNb1CS5vRDGcvAJ9huOJZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="31264191"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="31264191"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 01:30:35 -0700
X-CSE-ConnectionGUID: y1wTRDJWSvqu5O+/2S+L3Q==
X-CSE-MsgGUID: fro6DZG5Qb+wS2jO1ntJwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="122961957"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 20 Mar 2025 01:30:30 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvBIJ-0000Is-2T;
	Thu, 20 Mar 2025 08:30:27 +0000
Date: Thu, 20 Mar 2025 16:29:52 +0800
From: kernel test robot <lkp@intel.com>
To: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com,
	jiebing chen <jiebing.chen@amlogic.com>
Subject: Re: [PATCH v4 4/6] ASoC: meson: g12a-toacodec: Add s4 tocodec driver
Message-ID: <202503201641.wf8Oe0aR-lkp@intel.com>
References: <20250319-audio_drvier-v4-4-686867fad719@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319-audio_drvier-v4-4-686867fad719@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_013037_875506_2E393460 
X-CRM114-Status: GOOD (  10.62  )
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

Hi jiebing,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6ecd20965bdc21b265a0671ccf36d9ad8043f5ab]

url:    https://github.com/intel-lab-lkp/linux/commits/jiebing-chen-via-B4-Relay/dt-bindings-clock-meson-Add-audio-power-domain-for-s4-soc/20250319-151110
base:   6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
patch link:    https://lore.kernel.org/r/20250319-audio_drvier-v4-4-686867fad719%40amlogic.com
patch subject: [PATCH v4 4/6] ASoC: meson: g12a-toacodec: Add s4 tocodec driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250320/202503201641.wf8Oe0aR-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503201641.wf8Oe0aR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503201641.wf8Oe0aR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/meson/g12a-toacodec.c:135:38: warning: unused variable 's4_toacodec_clk_enable' [-Wunused-const-variable]
     135 | static const struct snd_kcontrol_new s4_toacodec_clk_enable =
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/s4_toacodec_clk_enable +135 sound/soc/meson/g12a-toacodec.c

   112	
   113	static SOC_ENUM_SINGLE_DECL(g12a_toacodec_mux_enum, TOACODEC_CTRL0,
   114				    CTRL0_DAT_SEL_LSB,
   115				    g12a_toacodec_mux_texts);
   116	
   117	static SOC_ENUM_SINGLE_DECL(sm1_toacodec_mux_enum, TOACODEC_CTRL0,
   118				    CTRL0_DAT_SEL_SM1_LSB,
   119				    g12a_toacodec_mux_texts);
   120	
   121	static const struct snd_kcontrol_new g12a_toacodec_mux =
   122		SOC_DAPM_ENUM_EXT("Source", g12a_toacodec_mux_enum,
   123				  snd_soc_dapm_get_enum_double,
   124				  g12a_toacodec_mux_put_enum);
   125	
   126	static const struct snd_kcontrol_new sm1_toacodec_mux =
   127		SOC_DAPM_ENUM_EXT("Source", sm1_toacodec_mux_enum,
   128				  snd_soc_dapm_get_enum_double,
   129				  g12a_toacodec_mux_put_enum);
   130	
   131	static const struct snd_kcontrol_new g12a_toacodec_out_enable =
   132		SOC_DAPM_SINGLE_AUTODISABLE("Switch", TOACODEC_CTRL0,
   133					    CTRL0_ENABLE_SHIFT, 1, 0);
   134	
 > 135	static const struct snd_kcontrol_new s4_toacodec_clk_enable =
   136		SOC_DAPM_DOUBLE("Switch", TOACODEC_CTRL0,
   137				CTRL0_BCLK_ENABLE_SHIFT, CTRL0_MCLK_ENABLE_SHIFT, 1, 0);
   138	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

