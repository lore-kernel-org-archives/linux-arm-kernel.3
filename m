Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DC6C71157
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 08:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=suVnQvsGEV8jCLR7EWqQ6LhJALtHVEOYpwn3iZU8550=; b=eqU0XgBt8mRhX5JiLQ3qQbXoFv
	s2wO1S76sqI2xCnx3zwSP7Hkny6VkTHuNFZHUn2RSRj/OSMUKnD/RDIHT3IYmAfNpAsPNiEHOgCAf
	ET9L9OXoVhKhhSNMZcW1J3ADrEarBvxngkw48MWDOpWUEqKfye7sZRzpf8bBdCVlJAySc5DRqOPNk
	ToaqJgnZqAaN1924aeLOFH1me56/T0QR3yMhAqOYK8KPO9tpjxCeTzGTUaF69dAQZgugJInoKzc2r
	X9y+yrd2oZ0dl1Nlx1xBrwMMRUsZ1mPLTvoCFyW6asxlMblA2LpSq9yG4UdqZbJCgooSm4oRac+hI
	sfAWzKNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uStjc-0000000HG3H-0KhH;
	Sat, 21 Jun 2025 08:38:00 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSthK-0000000HFuN-3E3C;
	Sat, 21 Jun 2025 08:35:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750494939; x=1782030939;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IxnvwpPtE9uiMFUZjHjsqPPB12QCtRhBXJ2KaoEI0sk=;
  b=mJVUJZ/GMMKyymdeTYHvn+8A/55SzicpiBvQu39pcyzUcplA2cx0vXlC
   HGBdOhjy1DozdoiUX4BciqkEpZddnH6/PwR6uIW2vF0ATfBYJ8ehbTTd1
   wswSbL1nR3ozRt9FVXJiba7VPaCx9QgF0XKAse1uvZQtUDppeOvM+8f4Y
   OxoKbE2dXNJwFypl6PLwsYP0yaL4bIOB2qFsH5b2arKW4geIXq2fcTx5C
   KZCwz0Ag4FuI/Je3PFmXRLaN+Fgjs5xqaxNnAjBOGfq1FXmStbsO+L6Au
   pVtOLLaeEXJhiyQ/VhocZiuBrHnUjLHfKHShzMRuevXvUTeczWLL+p61G
   g==;
X-CSE-ConnectionGUID: yext3jtkTz+K9U51v6VVXQ==
X-CSE-MsgGUID: lIKtIlzxSXaPdA8wLq24mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52459037"
X-IronPort-AV: E=Sophos;i="6.16,253,1744095600"; 
   d="scan'208";a="52459037"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2025 01:35:33 -0700
X-CSE-ConnectionGUID: x3bpnHumREixSSOk2WjHgQ==
X-CSE-MsgGUID: tYh93x4SQcS5i6AK0sfC5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,253,1744095600"; 
   d="scan'208";a="150897564"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Jun 2025 01:35:28 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSth7-000MU4-1R;
	Sat, 21 Jun 2025 08:35:25 +0000
Date: Sat, 21 Jun 2025 16:34:28 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	Darren Ye <darren.ye@mediatek.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: Re: [PATCH v5 01/10] ASoC: mediatek: common: modify mtk afe platform
 driver for mt8196
Message-ID: <202506211649.TGCEqNZ6-lkp@intel.com>
References: <20250620094140.11093-2-darren.ye@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620094140.11093-2-darren.ye@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_013538_876668_B93FB10F 
X-CRM114-Status: GOOD (  15.48  )
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
[also build test WARNING on broonie-spi/for-next robh/for-next linus/master v6.16-rc2 next-20250620]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Darren-Ye/ASoC-mediatek-common-modify-mtk-afe-platform-driver-for-mt8196/20250620-174746
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250620094140.11093-2-darren.ye%40mediatek.com
patch subject: [PATCH v5 01/10] ASoC: mediatek: common: modify mtk afe platform driver for mt8196
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250621/202506211649.TGCEqNZ6-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250621/202506211649.TGCEqNZ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506211649.TGCEqNZ6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/mediatek/common/mtk-afe-platform-driver.c:125:18: warning: shift count is negative [-Wshift-count-negative]
     125 |         pcm_ptr_bytes = MTK_ALIGN_16BYTES(hw_ptr - hw_base);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/common/mtk-afe-platform-driver.h:15:37: note: expanded from macro 'MTK_ALIGN_16BYTES'
      15 | #define MTK_ALIGN_16BYTES(x) ((x) & GENMASK(39, 4))
         |                                     ^~~~~~~~~~~~~~
   include/linux/bits.h:87:31: note: expanded from macro 'GENMASK'
      87 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:7:56: note: expanded from macro '__GENMASK'
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                                                        ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +125 sound/soc/mediatek/common/mtk-afe-platform-driver.c

    79	
    80	snd_pcm_uframes_t mtk_afe_pcm_pointer(struct snd_soc_component *component,
    81					      struct snd_pcm_substream *substream)
    82	{
    83		struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
    84		struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
    85		struct mtk_base_afe_memif *memif = &afe->memif[snd_soc_rtd_to_cpu(rtd, 0)->id];
    86		const struct mtk_base_memif_data *memif_data = memif->data;
    87		struct regmap *regmap = afe->regmap;
    88		struct device *dev = afe->dev;
    89		unsigned int hw_ptr_lower32 = 0, hw_ptr_upper32 = 0;
    90		unsigned int hw_base_lower32 = 0, hw_base_upper32 = 0;
    91		unsigned long long hw_ptr = 0, hw_base = 0;
    92		int ret;
    93		unsigned long long pcm_ptr_bytes = 0;
    94	
    95		ret = regmap_read(regmap, memif_data->reg_ofs_cur, &hw_ptr_lower32);
    96		if (ret || hw_ptr_lower32 == 0) {
    97			dev_err(dev, "%s hw_ptr_lower32 err\n", __func__);
    98			goto POINTER_RETURN_FRAMES;
    99		}
   100	
   101		if (memif_data->reg_ofs_cur_msb) {
   102			ret = regmap_read(regmap, memif_data->reg_ofs_cur_msb, &hw_ptr_upper32);
   103			if (ret) {
   104				dev_err(dev, "%s hw_ptr_upper32 err\n", __func__);
   105				goto POINTER_RETURN_FRAMES;
   106			}
   107		}
   108	
   109		ret = regmap_read(regmap, memif_data->reg_ofs_base, &hw_base_lower32);
   110		if (ret || hw_base_lower32 == 0) {
   111			dev_err(dev, "%s hw_base_lower32 err\n", __func__);
   112			goto POINTER_RETURN_FRAMES;
   113		}
   114		if (memif_data->reg_ofs_base_msb) {
   115			ret = regmap_read(regmap, memif_data->reg_ofs_base_msb, &hw_base_upper32);
   116			if (ret) {
   117				dev_err(dev, "%s hw_base_upper32 err\n", __func__);
   118				goto POINTER_RETURN_FRAMES;
   119			}
   120		}
   121		hw_ptr = ((unsigned long long)hw_ptr_upper32 << 32) + hw_ptr_lower32;
   122		hw_base = ((unsigned long long)hw_base_upper32 << 32) + hw_base_lower32;
   123	
   124	POINTER_RETURN_FRAMES:
 > 125		pcm_ptr_bytes = MTK_ALIGN_16BYTES(hw_ptr - hw_base);
   126		return bytes_to_frames(substream->runtime, (ssize_t)pcm_ptr_bytes);
   127	}
   128	EXPORT_SYMBOL_GPL(mtk_afe_pcm_pointer);
   129	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

