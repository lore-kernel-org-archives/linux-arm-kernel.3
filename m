Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F530C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 12:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o9ejdnou82Zbhd+KhaDfJJzDGWQ+vrVWheflQoeY0WY=; b=pQ8M2SBvgU5y2Zppvde854nhRU
	4WUPbOO1ZCj4vNVZ1jUzyFh4FC4j11YmSunGX6yONjNMMkOKQ/zAzriqckvXd9dah5DShQfGglu9c
	e+kGN0OKudHdRuPJINfowcaczog9M5/7tKFPR5AcdQEVW0S4o04pSmLQVf9+SA/K75h+xFASUZ12u
	0ZddACyOqTgMoFStHd8YhNkB+pPVMg97OFNHgXuqT6ljvqUQNpzNDC5P+vLIlBj+Pc/aVLYDjJUFV
	b0JnbO7sF4XqEN2tIa9ZScTFw+8jgJOJCR2C+BYaxB50qE/1MQjMt0b/qrkJaqS6SJjNgLHA8GUIn
	2TvW69nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1HD-00000007f4u-3TOu;
	Wed, 16 Jul 2025 12:30:23 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1CL-00000007eVo-0bNe;
	Wed, 16 Jul 2025 12:25:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752668721; x=1784204721;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BWrLRFAp92FC1Lne9D6uyC23s8dUsoFZLRBGb5z/924=;
  b=k2ItrIrppbexyGZk4GY3wlY6RsrMBObCM4Pe6oxCRKnUPa8Fk7hi6HqT
   HQrTiJ+M7FBEQDMbe0DwF/iE06QCher8MiVa5pQY3QWQSgkPfNULgWm/5
   1Jv9PfFu6tfbvoY1LTk9zaaAQDJmsQCtIIhYrWFzki+CUBBOHRvZN6CY4
   +ZrA/tk25M43OKhWZnlM12BARbSDFpKYrlKrQ2VGKKNMvjEPUe6GRa5f9
   f7HSsujHsaEqSb2/wx1IYkgqz61QUDXZ7e7A8CtMu00qrH26jQtEUMnDU
   AWBz1mrFipuXeN5a+m/JIPCD9nxTMTNZsRcRmC8iXoysbcHwRmjtIvR4w
   w==;
X-CSE-ConnectionGUID: bkTDnTjPT+i7n72A/IrvFg==
X-CSE-MsgGUID: sJSmW0x3SbaQTAuoPlTCYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54020736"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; 
   d="scan'208";a="54020736"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 05:25:19 -0700
X-CSE-ConnectionGUID: JHf6O6CWSnWFwjKCUsM/Pg==
X-CSE-MsgGUID: TbiiyrIeSrCVY4Ejj0xc+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; 
   d="scan'208";a="162043447"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Jul 2025 05:25:15 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uc1CD-000CMB-0b;
	Wed, 16 Jul 2025 12:25:13 +0000
Date: Wed, 16 Jul 2025 20:24:38 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, lee@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	lgirdwood@gmail.com, broonie@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com, wenst@chromium.org
Subject: Re: [PATCH v5 4/8] regulator: Add support for MediaTek MT6363 SPMI
 PMIC Regulators
Message-ID: <202507162012.qDNKtUiI-lkp@intel.com>
References: <20250715140224.206329-5-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715140224.206329-5-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_052521_224774_8D725638 
X-CRM114-Status: GOOD (  16.28  )
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

Hi AngeloGioacchino,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-regulator/for-next]
[also build test ERROR on lee-mfd/for-mfd-next lee-mfd/for-mfd-fixes lee-leds/for-leds-next linus/master v6.16-rc6 next-20250715]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-regulator-Document-MediaTek-MT6316-PMIC-Regulators/20250715-222516
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20250715140224.206329-5-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v5 4/8] regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250716/202507162012.qDNKtUiI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507162012.qDNKtUiI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507162012.qDNKtUiI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/regulator/mt6363-regulator.c:519:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     519 |                 sel = FIELD_PREP(MT6363_RG_VEMC_VOSEL_1_MASK, sel);
         |                       ^
>> drivers/regulator/mt6363-regulator.c:577:10: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     577 |                 vsel = FIELD_GET(MT6363_RG_VEMC_VOSEL_1_MASK, vosel);
         |                        ^
   2 errors generated.


vim +/FIELD_PREP +519 drivers/regulator/mt6363-regulator.c

   481	
   482	static int mt6363_vemc_set_voltage_sel(struct regulator_dev *rdev, unsigned int sel)
   483	{
   484		const u16 tma_unlock_key = MT6363_TMA_UNLOCK_VALUE;
   485		const struct regulator_desc *rdesc = rdev->desc;
   486		struct regmap *regmap = rdev->regmap;
   487		unsigned int range, val;
   488		int i, ret;
   489		u16 mask;
   490	
   491		for (i = 0; i < rdesc->n_linear_ranges; i++) {
   492			const struct linear_range *r = &rdesc->linear_ranges[i];
   493			unsigned int voltages_in_range = linear_range_values_in_range(r);
   494	
   495			if (sel < voltages_in_range)
   496				break;
   497			sel -= voltages_in_range;
   498		}
   499	
   500		if (i == rdesc->n_linear_ranges)
   501			return -EINVAL;
   502	
   503		ret = regmap_read(rdev->regmap, MT6363_TOP_TRAP, &val);
   504		if (ret)
   505			return ret;
   506	
   507		if (val > 1)
   508			return -EINVAL;
   509	
   510		/* Unlock TMA for writing */
   511		ret = regmap_bulk_write(rdev->regmap, MT6363_TOP_TMA_KEY_L,
   512					&tma_unlock_key, sizeof(tma_unlock_key));
   513		if (ret)
   514			return ret;
   515	
   516		/* If HW trapping value is 1, use VEMC_VOSEL_1 instead of VEMC_VOSEL_0 */
   517		if (val == 1) {
   518			mask = MT6363_RG_VEMC_VOSEL_1_MASK;
 > 519			sel = FIELD_PREP(MT6363_RG_VEMC_VOSEL_1_MASK, sel);
   520		} else {
   521			mask = rdesc->vsel_mask;
   522		}
   523	
   524		sel <<= ffs(rdesc->vsel_mask) - 1;
   525		sel += rdesc->linear_ranges[i].min_sel;
   526	
   527		range = rdesc->linear_range_selectors_bitfield[i];
   528		range <<= ffs(rdesc->vsel_range_mask) - 1;
   529	
   530		/* Write to the vreg calibration register for voltage finetuning */
   531		ret = regmap_update_bits(regmap, rdesc->vsel_range_reg,
   532					 rdesc->vsel_range_mask, range);
   533		if (ret)
   534			goto lock_tma;
   535	
   536		/* Function must return the result of this write operation */
   537		ret = regmap_update_bits(regmap, rdesc->vsel_reg, mask, sel);
   538	
   539	lock_tma:
   540		/* Unconditionally re-lock TMA */
   541		val = 0;
   542		regmap_bulk_write(rdev->regmap, MT6363_TOP_TMA_KEY_L, &val, 2);
   543	
   544		return ret;
   545	}
   546	
   547	static int mt6363_vemc_get_voltage_sel(struct regulator_dev *rdev)
   548	{
   549		const struct regulator_desc *rdesc = rdev->desc;
   550		unsigned int vosel, trap, calsel;
   551		int vcal, vsel, range, ret;
   552	
   553		ret = regmap_read(rdev->regmap, rdesc->vsel_reg, &vosel);
   554		if (ret)
   555			return ret;
   556	
   557		ret = regmap_read(rdev->regmap, rdesc->vsel_range_reg, &calsel);
   558		if (ret)
   559			return ret;
   560	
   561		calsel &= rdesc->vsel_range_mask;
   562		for (range = 0; range < rdesc->n_linear_ranges; range++)
   563			if (rdesc->linear_range_selectors_bitfield[range] != calsel)
   564				break;
   565	
   566		if (range == rdesc->n_linear_ranges)
   567			return -EINVAL;
   568	
   569		ret = regmap_read(rdev->regmap, MT6363_TOP_TRAP, &trap);
   570		if (ret)
   571			return ret;
   572	
   573		/* If HW trapping value is 1, use VEMC_VOSEL_1 instead of VEMC_VOSEL_0 */
   574		if (trap > 1)
   575			return -EINVAL;
   576		else if (trap == 1)
 > 577			vsel = FIELD_GET(MT6363_RG_VEMC_VOSEL_1_MASK, vosel);
   578		else
   579			vsel = vosel & rdesc->vsel_mask;
   580	
   581		vcal = linear_range_values_in_range_array(rdesc->linear_ranges, range);
   582	
   583		return vsel + vcal;
   584	}
   585	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

