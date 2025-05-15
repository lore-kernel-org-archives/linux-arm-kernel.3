Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A4BC54755
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 04:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kvfcu7T2A/G2Hmbq54J3Mh0UqDMA4DYECzMCK1eoCtE=; b=Ws1OO4ljgl0A5dxvCLPRz0OFwC
	MTp5jJj8S179t7DCNmIrH21HosSxjRWRHz+FpE/ZWc8nI//OGWDuljHfCCgsyA+6hGpWp4KG+bjuP
	GUET9TVRKrgJ48bdXYRho3xfbBWMO29d2WkEcZ4U6+QWK++qPScbr0ltzJTbBzdqSSDDIfpUX37Jr
	oEnLqpUSsMYyu/GEYFXkIUhSNyMs0UdiqgzlaadX5mp8xQhPIyWifuAfNLLxu2uDjrnUGQkZE73EG
	5zgZARHP632755QHzjHbGEPy0WBsOeTETYRcd8dPT8528E6qCgGdVBkn8fM59lxqKaKucuJdEu9Sh
	ad4WNvgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFQS6-0000000H0HK-3Pe9;
	Thu, 15 May 2025 04:44:14 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFQQ5-0000000H0AE-08eo;
	Thu, 15 May 2025 04:42:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747284129; x=1778820129;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eMKbF1YyG2PQHQK5zGvXb1tw4RrftzaTI5iILQ1V+To=;
  b=WACE7H+j2+qXRqsLnKqDJM22eVtAFqlcrzMLM/z0EdEJDFrk1NgdEH9L
   r4WYwMqpVEKqiKPHSnfSrdRZep9mn2vHbtzutVbri9eHy5YsMMbARx3PN
   wjpm9zvdxJhkFyfwLwMS84Uo9wujGSjR0JYx47qlxvBv7fVpvCH+Srjsh
   4rly5X/2arOgWVGQeAh8Nrs9Mgrhwjy0oqz+yv7+VMlmvuxNyi3dov1g6
   NOHKzeKSrqOlE3XSldKf++BnELYL1L3vGRa7GwgBlQSgzp1PFln+sAaQ+
   m6ic0YrSFEdzNUqkTEg7UETpx6hhfY1N/db0LlZ8yer0LZSUBrjO0xB/J
   g==;
X-CSE-ConnectionGUID: ErInYbBlTcK1+Dbt9Npyhg==
X-CSE-MsgGUID: GR3iPyjCQAa3MrNBjgApyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="36825722"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="36825722"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 21:42:00 -0700
X-CSE-ConnectionGUID: gmMAhZyOTOWsmCZCt08MmQ==
X-CSE-MsgGUID: /lVec4e1RMaGj5d52888vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="138119667"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 May 2025 21:41:56 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFQPp-000HvT-1C;
	Thu, 15 May 2025 04:41:53 +0000
Date: Thu, 15 May 2025 12:41:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Darren.Ye" <darren.ye@mediatek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: oe-kbuild-all@lists.linux.dev, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	Darren Ye <darren.ye@mediatek.com>
Subject: Re: [PATCH v3 07/10] ASoC: mediatek: mt8196: add platform driver
Message-ID: <202505151200.uFAkmc5O-lkp@intel.com>
References: <20250514081125.24475-8-darren.ye@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514081125.24475-8-darren.ye@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_214209_088942_C483B639 
X-CRM114-Status: GOOD (  14.57  )
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

Hi Darren.Ye,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on broonie-spi/for-next robh/for-next linus/master v6.15-rc6 next-20250514]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Darren-Ye/ASoC-mediatek-common-modify-mtk-afe-platform-driver-for-mt8196/20250514-161921
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250514081125.24475-8-darren.ye%40mediatek.com
patch subject: [PATCH v3 07/10] ASoC: mediatek: mt8196: add platform driver
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250515/202505151200.uFAkmc5O-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505151200.uFAkmc5O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505151200.uFAkmc5O-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/mediatek/mt8196/mt8196-dai-adda.c:384:30: warning: 'mt8196_adda_enum' defined but not used [-Wunused-const-variable=]
     384 | static const struct soc_enum mt8196_adda_enum[] = {
         |                              ^~~~~~~~~~~~~~~~
--
   sound/soc/mediatek/mt8196/mt8196-dai-i2s.c: In function 'init_i2s_priv_data':
>> sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:4001:21: warning: the comparison will always evaluate as 'true' for the address of 'mt8196_i2s_priv' will never be NULL [-Waddress]
    4001 |                 if (&mt8196_i2s_priv[i]) {
         |                     ^
   sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:3889:38: note: 'mt8196_i2s_priv' declared here
    3889 | static const struct mtk_afe_i2s_priv mt8196_i2s_priv[DAI_I2S_NUM] = {
         |                                      ^~~~~~~~~~~~~~~


vim +/mt8196_adda_enum +384 sound/soc/mediatek/mt8196/mt8196-dai-adda.c

640b731680b027 Darren Ye 2025-05-14  383  
640b731680b027 Darren Ye 2025-05-14 @384  static const struct soc_enum mt8196_adda_enum[] = {
640b731680b027 Darren Ye 2025-05-14  385  	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(mt8196_adda_off_on_str),
640b731680b027 Darren Ye 2025-05-14  386  			    mt8196_adda_off_on_str),
640b731680b027 Darren Ye 2025-05-14  387  };
640b731680b027 Darren Ye 2025-05-14  388  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

