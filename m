Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF648C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 19:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RlZp+z2B+VT2044GWCHGy2qhuCQ9tKm6XOpnpN5T3NY=; b=NEmClXrIgsJbIBnF+VhzcO+zJ7
	1fck9mkRQ/I+Ks+8Ag9cd2x1dWjUoBTscMPSeWvpa+ofjf4EtMgvAG08mWdHzqZr6cxjBNaiNJEZy
	RcuzJ0hSvkB+DRPqDnLo5wb/ljziwLVbh5/ItKOF1u+YFhmv0Cg/e5rjQgsWZ0Rn9qdVFi2k9/fPd
	vXtHhvljbX/MP3B6QCmPBafy/CyVA6tnoWaTTNhuDEZqDbFn1gstZBk4DcU5Xjjoli7R+FuUc62rP
	OEz9YMPvyZLXzEMvDVJdWW/kx9Q2GCsx7Semj76zRLCO602h38nRzkOSY0/k+iNw9Qbm/P/QBarGt
	XhfFhfIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuypF-00000009vBl-1gzl;
	Wed, 19 Mar 2025 19:11:37 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuyhP-00000009u82-2jZd;
	Wed, 19 Mar 2025 19:03:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742411012; x=1773947012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kwOrHksy+YhrJJoSEw9ASHTSL1O0f+mcM2mEQsUJ2wI=;
  b=TLeBmIY/VdtdIWu3OGDWDfAhL1ZJcZ0l3v0ZFePd0qRd2qtm9dWZApZu
   wmkwjp2iUaTzf2AXNuHul/eCK9pw0LEWrgntG5c2oNnJYiD4M/cbNUkSL
   mOWd0Zh1ivOt0/GiOv9kryfNno45L1ql5Eg+LLSrmewa04ILge6OR+vpJ
   bENYYg1DDF3CAK8RkDlo/lZa6IsBXAW1xwmzDLf08DAt/V0QHCd3gNOVt
   y2Q4psAGItGIHVZP/wwUVOqqkozrvnGsi3D3vaMmzSSMe+szUZLg1x0Jo
   3m5NW+tj67K9LOrmnDZ2wOxy8N/YP7+5e+U7zegWGFPiWqsqGYW1tP6Lo
   A==;
X-CSE-ConnectionGUID: enO9omaNQTChhM729HzMFQ==
X-CSE-MsgGUID: c3xLmiKLQsmygZe5gPjAqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="54997454"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="54997454"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 12:03:29 -0700
X-CSE-ConnectionGUID: Mbl85Yu1QW60SEdFPGiOjw==
X-CSE-MsgGUID: RJQQdPK8QPK/WswUp91UjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="122769594"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 19 Mar 2025 12:03:24 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuyhG-000FcE-0R;
	Wed, 19 Mar 2025 19:03:22 +0000
Date: Thu, 20 Mar 2025 03:02:22 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com,
	jiebing chen <jiebing.chen@amlogic.com>
Subject: Re: [PATCH v4 4/6] ASoC: meson: g12a-toacodec: Add s4 tocodec driver
Message-ID: <202503200205.amGhOXua-lkp@intel.com>
References: <20250319-audio_drvier-v4-4-686867fad719@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319-audio_drvier-v4-4-686867fad719@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_120331_728354_15AAAAEF 
X-CRM114-Status: GOOD (  11.88  )
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
config: i386-buildonly-randconfig-005-20250320 (https://download.01.org/0day-ci/archive/20250320/202503200205.amGhOXua-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503200205.amGhOXua-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503200205.amGhOXua-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/meson/g12a-toacodec.c:135:38: warning: 's4_toacodec_clk_enable' defined but not used [-Wunused-const-variable=]
     135 | static const struct snd_kcontrol_new s4_toacodec_clk_enable =
         |                                      ^~~~~~~~~~~~~~~~~~~~~~


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

