Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DBDD35698
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 10:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=idgpGrbuWY0t6nEBYaYywmOP0ri+BGPHjD93ex4AkpY=; b=DYMivmCvP4x0vKOkFf2yDP4IHQ
	NwWHQGFupGDXH4yXtWO7mmd1iri2r3Zsba4NTOTQDDZbgkpaLdCXDL/uI/hc+xrZ7dLINHyWGgCTZ
	VzYZZo8ybP8fHoQrwGljwNllwtoOkasW6x9WRG6u32Ut8+IphMgbiIBn4uBRdvJpD1xIMhld4WM9g
	JkbjGUjPhzMtoY7Tcpe6L2eazKP7fzJhriCfP4O6a34LruX826K3BeulLuAy7dtaE9hwUYMmuL1V5
	eT+jyVEeIJnQb053ajyOwWtz+jlJgiakyWAGsVhJDQtEthYqB4amIW3JlxaaYV7iug/bkez7f24Pb
	kyryk9bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2Nj-0000000Fnjw-1nTF;
	Wed, 28 Jan 2026 10:02:39 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2Ne-0000000FnjP-1g2z;
	Wed, 28 Jan 2026 10:02:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769594555; x=1801130555;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M/1XAAe2fXUTjteJOxDYo6ou5Wc8lghhfgq/fQ9TNFk=;
  b=mu3b6UoaLY3G6CzqgSsRAEE0/Ltuq0Ig0VzUIooB99DxOpwmRhiv/C1L
   NvTRcIgbjNncBAHh3+IVmgJpMHUe1VyhvQNAhaje81rdSW3/BTEub0aXW
   oRup7mFCNQWnbSIf6yRpSr6DPqaup3WaFltxaiVharf+THNW51mEdKkBc
   5x70s1ZsyObP3+cA+KNL8QDzfCtBWUmm8gJye+mRWRhBifs6Yw585+Nnc
   OKlOmkRBunHqnm4NlFhNHvikFld35HKUXqA7I2NUhn841k8h6FqxeWTeD
   TXx7dMEect53Ng1uRHZlAMVPk/SZ34Lm2L8HL7tNRQDIaaiseioVpl6wP
   Q==;
X-CSE-ConnectionGUID: 4pmSfkBhQ6uAcvI3s4OiKA==
X-CSE-MsgGUID: 2hABu3ZZRDG/l7HLzRnYRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70891967"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="70891967"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 02:02:33 -0800
X-CSE-ConnectionGUID: 8I8p/2p0TrGpQgtzGYcMgw==
X-CSE-MsgGUID: q85tbTJXQiWSPpZl4S4FGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208015458"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Jan 2026 02:02:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vl2NW-00000000ZWa-0RDG;
	Wed, 28 Jan 2026 10:02:26 +0000
Date: Wed, 28 Jan 2026 18:01:39 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexey Charkov <alchark@gmail.com>,
	Sjoerd Simons <sjoerd.simons@collabora.com>,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 10/10] ASoC: rockchip: spdif: Convert to FIELD_PREP
Message-ID: <202601281701.vJDagmwh-lkp@intel.com>
References: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-10-a7c547072bbb@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-10-a7c547072bbb@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_020234_455112_4409D6AD 
X-CRM114-Status: GOOD (  12.64  )
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

Hi Sebastian,

kernel test robot noticed the following build errors:

[auto build test ERROR on 63804fed149a6750ffd28610c5c1c98cce6bd377]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Reichel/ASoC-rockchip-spdif-Use-device_get_match_data/20260128-001701
base:   63804fed149a6750ffd28610c5c1c98cce6bd377
patch link:    https://lore.kernel.org/r/20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-10-a7c547072bbb%40collabora.com
patch subject: [PATCH 10/10] ASoC: rockchip: spdif: Convert to FIELD_PREP
config: hexagon-randconfig-002-20260128 (https://download.01.org/0day-ci/archive/20260128/202601281701.vJDagmwh-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601281701.vJDagmwh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601281701.vJDagmwh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/rockchip/rockchip_spdif.c:109:21: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     109 |         unsigned int val = SPDIF_CFGR_HALFWORD_ENABLE;
         |                            ^
   sound/soc/rockchip/rockchip_spdif.h:33:36: note: expanded from macro 'SPDIF_CFGR_HALFWORD_ENABLE'
      33 | #define SPDIF_CFGR_HALFWORD_ENABLE      FIELD_PREP(SPDIF_CFGR_HALFWORD_MASK, 1)
         |                                         ^
   sound/soc/rockchip/rockchip_spdif.c:182:7: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     182 |                                          SPDIF_DMACR_TDE_ENABLE |
         |                                          ^
   sound/soc/rockchip/rockchip_spdif.h:48:33: note: expanded from macro 'SPDIF_DMACR_TDE_ENABLE'
      48 | #define SPDIF_DMACR_TDE_ENABLE          FIELD_PREP(SPDIF_DMACR_TDE_MASK, 1)
         |                                         ^
   2 errors generated.


vim +/FIELD_PREP +109 sound/soc/rockchip/rockchip_spdif.c

f874b80e157111 Sjoerd Simons     2015-10-08  102  
f874b80e157111 Sjoerd Simons     2015-10-08  103  static int rk_spdif_hw_params(struct snd_pcm_substream *substream,
f874b80e157111 Sjoerd Simons     2015-10-08  104  			      struct snd_pcm_hw_params *params,
f874b80e157111 Sjoerd Simons     2015-10-08  105  			      struct snd_soc_dai *dai)
f874b80e157111 Sjoerd Simons     2015-10-08  106  {
f874b80e157111 Sjoerd Simons     2015-10-08  107  	struct rk_spdif_dev *spdif = snd_soc_dai_get_drvdata(dai);
b8e112b77e45b4 Sugar Zhang       2026-01-27  108  	unsigned int mclk_rate = clk_get_rate(spdif->mclk);
f874b80e157111 Sjoerd Simons     2015-10-08 @109  	unsigned int val = SPDIF_CFGR_HALFWORD_ENABLE;
9cd33c09d22fd1 Sugar Zhang       2026-01-27  110  	int bmc, div, ret, i;
9cd33c09d22fd1 Sugar Zhang       2026-01-27  111  	u16 *fc;
9cd33c09d22fd1 Sugar Zhang       2026-01-27  112  	u8 cs[CS_BYTE];
9cd33c09d22fd1 Sugar Zhang       2026-01-27  113  
9cd33c09d22fd1 Sugar Zhang       2026-01-27  114  	ret = snd_pcm_create_iec958_consumer_hw_params(params, cs, sizeof(cs));
9cd33c09d22fd1 Sugar Zhang       2026-01-27  115  	if (ret < 0)
9cd33c09d22fd1 Sugar Zhang       2026-01-27  116  		return ret;
9cd33c09d22fd1 Sugar Zhang       2026-01-27  117  
9cd33c09d22fd1 Sugar Zhang       2026-01-27  118  	fc = (u16 *)cs;
9cd33c09d22fd1 Sugar Zhang       2026-01-27  119  	for (i = 0; i < CS_BYTE / 2; i++)
9cd33c09d22fd1 Sugar Zhang       2026-01-27  120  		regmap_write(spdif->regmap, SPDIF_CHNSRn(i), CS_FRAME(fc[i]));
9cd33c09d22fd1 Sugar Zhang       2026-01-27  121  
9cd33c09d22fd1 Sugar Zhang       2026-01-27  122  	regmap_update_bits(spdif->regmap, SPDIF_CFGR, SPDIF_CFGR_CSE_MASK,
9cd33c09d22fd1 Sugar Zhang       2026-01-27  123  			   SPDIF_CFGR_CSE_EN);
f874b80e157111 Sjoerd Simons     2015-10-08  124  
b8e112b77e45b4 Sugar Zhang       2026-01-27  125  	/* bmc = 128fs */
b8e112b77e45b4 Sugar Zhang       2026-01-27  126  	bmc = 128 * params_rate(params);
b8e112b77e45b4 Sugar Zhang       2026-01-27  127  	div = DIV_ROUND_CLOSEST(mclk_rate, bmc);
b8e112b77e45b4 Sugar Zhang       2026-01-27  128  	val |= SPDIF_CFGR_CLK_DIV(div);
f874b80e157111 Sjoerd Simons     2015-10-08  129  
f874b80e157111 Sjoerd Simons     2015-10-08  130  	switch (params_format(params)) {
f874b80e157111 Sjoerd Simons     2015-10-08  131  	case SNDRV_PCM_FORMAT_S16_LE:
f874b80e157111 Sjoerd Simons     2015-10-08  132  		val |= SPDIF_CFGR_VDW_16;
908589f3825713 Sugar Zhang       2026-01-27  133  		val |= SPDIF_CFGR_ADJ_RIGHT_J;
f874b80e157111 Sjoerd Simons     2015-10-08  134  		break;
f874b80e157111 Sjoerd Simons     2015-10-08  135  	case SNDRV_PCM_FORMAT_S20_3LE:
f874b80e157111 Sjoerd Simons     2015-10-08  136  		val |= SPDIF_CFGR_VDW_20;
908589f3825713 Sugar Zhang       2026-01-27  137  		val |= SPDIF_CFGR_ADJ_RIGHT_J;
f874b80e157111 Sjoerd Simons     2015-10-08  138  		break;
f874b80e157111 Sjoerd Simons     2015-10-08  139  	case SNDRV_PCM_FORMAT_S24_LE:
f874b80e157111 Sjoerd Simons     2015-10-08  140  		val |= SPDIF_CFGR_VDW_24;
908589f3825713 Sugar Zhang       2026-01-27  141  		val |= SPDIF_CFGR_ADJ_RIGHT_J;
908589f3825713 Sugar Zhang       2026-01-27  142  		break;
908589f3825713 Sugar Zhang       2026-01-27  143  	case SNDRV_PCM_FORMAT_S32_LE:
908589f3825713 Sugar Zhang       2026-01-27  144  		val |= SPDIF_CFGR_VDW_24;
908589f3825713 Sugar Zhang       2026-01-27  145  		val |= SPDIF_CFGR_ADJ_LEFT_J;
f874b80e157111 Sjoerd Simons     2015-10-08  146  		break;
f874b80e157111 Sjoerd Simons     2015-10-08  147  	default:
f874b80e157111 Sjoerd Simons     2015-10-08  148  		return -EINVAL;
f874b80e157111 Sjoerd Simons     2015-10-08  149  	}
f874b80e157111 Sjoerd Simons     2015-10-08  150  
908589f3825713 Sugar Zhang       2026-01-27  151  	/*
908589f3825713 Sugar Zhang       2026-01-27  152  	 * clear MCLK domain logic before setting Fmclk and Fsdo to ensure
908589f3825713 Sugar Zhang       2026-01-27  153  	 * that switching between S16_LE and S32_LE audio does not result
908589f3825713 Sugar Zhang       2026-01-27  154  	 * in accidential channels swap.
908589f3825713 Sugar Zhang       2026-01-27  155  	 */
908589f3825713 Sugar Zhang       2026-01-27  156  	regmap_update_bits(spdif->regmap, SPDIF_CFGR, SPDIF_CFGR_CLR_MASK,
908589f3825713 Sugar Zhang       2026-01-27  157  			   SPDIF_CFGR_CLR_EN);
908589f3825713 Sugar Zhang       2026-01-27  158  	udelay(1);
908589f3825713 Sugar Zhang       2026-01-27  159  
f874b80e157111 Sjoerd Simons     2015-10-08  160  	ret = regmap_update_bits(spdif->regmap, SPDIF_CFGR,
acc8b9d117912c Sugar Zhang       2021-08-24  161  				 SPDIF_CFGR_CLK_DIV_MASK |
85c46be12ede08 Sebastian Reichel 2026-01-27  162  				 SPDIF_CFGR_HALFWORD_MASK |
908589f3825713 Sugar Zhang       2026-01-27  163  				 SDPIF_CFGR_VDW_MASK |
908589f3825713 Sugar Zhang       2026-01-27  164  				 SPDIF_CFGR_ADJ_MASK, val);
f874b80e157111 Sjoerd Simons     2015-10-08  165  
f874b80e157111 Sjoerd Simons     2015-10-08  166  	return ret;
f874b80e157111 Sjoerd Simons     2015-10-08  167  }
f874b80e157111 Sjoerd Simons     2015-10-08  168  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

