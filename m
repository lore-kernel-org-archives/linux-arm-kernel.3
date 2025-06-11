Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA094C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 03:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0cGvo6y6v0YUqrCajBwMrv/GrzP7x0+qV7joM7fWNwc=; b=tiZZUpC0LO3BX8sGZcqUM/b4VP
	Q8Z0yGMrpPO1MxnrYcIOzbVHL485USnysiOqv9FVN/o9K4vLyGByzQpkGHmxoUspk8teEyw1CgCPo
	RLh4maVN8TL7GTLGhCBlCP/oKx7xE1z6ukgHseJ4qTcvlBkcrbjEJoWCnG8PtaG0XXab5Z2hVqOok
	X3qbHALnRUuS3u9357kcmTRfBcwyHsvJvLYlC60Inbu2Jq1JnjudRlO9E+IWwgmfAoTPPwDvc/GKO
	kqkiR4qN5dNszfQsFhDi6Rek7poXKwiTzEmcMpdA8aTHT1yhDQwTpsIVLpgiLQUt5dPB/yGJDhfkZ
	ZUHGiSmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPBor-00000008iKg-1ZiC;
	Wed, 11 Jun 2025 03:08:05 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPBkg-00000008i0e-1YOg;
	Wed, 11 Jun 2025 03:03:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749611027; x=1781147027;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3zY7OPrHfBJ8D5fNCMI/aXZ74/+C9WQVAvtm2BH8Q9I=;
  b=Z8PBMouBoFqPWrcaq6UU0Vu8SEuCjaBjEhjN6qepcb8hvgPLtlKtTYQ9
   x3EQGIB+7yLLqDYDkl5hlKa6Wq38Nq4gLebhFiFe9CTLybcYQdmgRgX6m
   13OjnSw7gHs5V0ENw1g41vDJn20Oq/CfbeQOOs72xC26H5AYMkWd7789a
   G3bijDwjsZi24I/2DmELqkmCWTd7fKxEQXGFZ7UaG/v0LdzON5oHtMW35
   svtRVLG9doJf4zYOURte69xU/y8jgXwUTKE5zQ/Z5pSDnGkmyuSHT/JyW
   YtE4jYFZOCBs/IqcYitbfDwyARKRyhjlAFh1symHsRDB60fW/QQHQK7Ym
   g==;
X-CSE-ConnectionGUID: taCxBl4pSXGrJA17OupKbg==
X-CSE-MsgGUID: Istj/XcuR1Kzyi/VkiXw1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="55544312"
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="55544312"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 20:03:46 -0700
X-CSE-ConnectionGUID: 2dff+bDFRzGZFeWc8MMivA==
X-CSE-MsgGUID: 3H9wXEEfRfec+bJEfsTIRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="146930170"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Jun 2025 20:03:41 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPBkY-0009xY-1A;
	Wed, 11 Jun 2025 03:03:38 +0000
Date: Wed, 11 Jun 2025 11:03:11 +0800
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
Subject: Re: [PATCH v4 03/10] ASoC: mediatek: mt8196: support audio clock
 control
Message-ID: <202506111019.lK2Vphtz-lkp@intel.com>
References: <20250610092852.21986-4-darren.ye@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610092852.21986-4-darren.ye@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_200346_482765_AB1BEF70 
X-CRM114-Status: GOOD (  12.83  )
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
[also build test WARNING on broonie-spi/for-next robh/for-next linus/master v6.16-rc1 next-20250610]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Darren-Ye/ASoC-mediatek-common-modify-mtk-afe-platform-driver-for-mt8196/20250610-175139
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250610092852.21986-4-darren.ye%40mediatek.com
patch subject: [PATCH v4 03/10] ASoC: mediatek: mt8196: support audio clock control
config: i386-buildonly-randconfig-001-20250611 (https://download.01.org/0day-ci/archive/20250611/202506111019.lK2Vphtz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250611/202506111019.lK2Vphtz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506111019.lK2Vphtz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/pcm186x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/pcm3060.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/pcm3168a.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/pcm512x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/rl6231.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/rl6347a.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/rt-sdw-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/rt5514-spi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/rt5640.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/rt5645.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/rt5659.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/rt5663.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/rt5670.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/rt5677-spi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/rt5677.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/rt5682.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/rt5682s.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/sigmadsp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/src4xxx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/ssm2602.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/tas2781-comlib-i2c.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/tas2781-comlib.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/tas2781-fmwlib.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/tlv320aic23.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/tlv320aic32x4-clk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/tlv320aic32x4.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/tlv320aic3x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/ts3a227e.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/twl6040.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wcd-clsh-v2.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wcd-mbhc-v2.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wcd937x-sdw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wcd938x-sdw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wcd939x-sdw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wl1273.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wm8350.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wm8731.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wm8804.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wm8903.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wm8962.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wm8994.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wm8996.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wm_adsp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wm_hubs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/fsl/fsl_asrc_dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/fsl/fsl_asrc_m2m.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/fsl/fsl_utils.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/fsl/imx-audmux.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/fsl/imx-pcm-dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/fsl/imx-pcm-fiq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/fsl/lpc3xxx-pcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/fsl/mpc5200_dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/generic/audio-graph-card.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/generic/audio-graph-card2.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/generic/simple-card-utils.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/atom/sst-mfld-platform-pcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/atom/sst/sst.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/atom/sst/sst_pvt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/boards/hda_dsp_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/boards/sof_board_helpers.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/boards/sof_cirrus_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/boards/sof_maxim_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/boards/sof_nuvoton_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/boards/sof_realtek_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-adl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-arl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-bxt-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-byt-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-cfl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-cht-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-cml-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-cnl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-ehl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-glk-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-hda-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-icl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-jsl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-kbl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-lnl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-mtl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-ptl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-rpl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-sdca-quirks.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-skl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-ssp-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-tgl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/common/mtk-afe-fe-dai.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/common/mtk-afe-platform-driver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/common/mtk-dai-adda-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/common/mtk-dsp-sof-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/common/mtk-soundcard-driver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/mt8186/mt8186-afe-gpio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/mt8186/mt8186-dai-i2s.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/mt8186/mt8186-mt6366-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/mt8188/mt8188-afe-clk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/mt8192/mt8192-afe-gpio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/mt8192/mt8192-dai-i2s.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/mt8195/mt8195-afe-clk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> sound/soc/mediatek/mt8196/mt8196-afe-clk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/meson/axg-fifo.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/meson/axg-tdm-formatter.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/meson/axg-tdm-interface.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/meson/meson-card-utils.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/meson/meson-codec-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mxs/mxs-pcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mxs/mxs-saif.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/lpass-cpu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/lpass-hdmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/qdsp6/audioreach.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/qdsp6/q6adm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/qdsp6/q6afe.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/qdsp6/q6apm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/qdsp6/q6asm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/qdsp6/q6core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/qdsp6/q6dsp-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/qdsp6/q6prm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/qdsp6/q6routing.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/qdsp6/topology.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/sdw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/usb_offload_utils.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/renesas/siu_pcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/samsung/dmaengine.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/samsung/idma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdca/sdca_asoc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdca/sdca_device.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdca/sdca_functions.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdca/sdca_regmap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_cs42l42.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_cs42l43.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_cs_amp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_dmic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_maxim.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_rt5682.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_rt700.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_rt711.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_rt_amp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_rt_dmic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_utils.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/soc-card.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/soc-component.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/soc-compress.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/soc-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/soc-dai.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/soc-dapm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/soc-devres.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/soc-generic-dmaengine-pcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/soc-link.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/soc-ops.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/soc-usb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/acp-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/acp-ipc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/acp-loader.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/acp-pcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/acp-probes.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/acp-stream.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/acp-trace.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/acp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/acp63.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/acp70.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/rembrandt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/renoir.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/vangogh.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/compress.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/debug.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/fw-file-profile.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/imx/imx-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/atom.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/cnl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-codec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-common-ops.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-ctrl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-dai.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-dsp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-ipc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-loader.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-mlink.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-pcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-probes.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-sdw-bpt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-stream.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-trace.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/lnl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/mtl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/ptl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/skl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/telemetry.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/iomem-utils.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/ipc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/ipc3.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/ipc4-pcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

