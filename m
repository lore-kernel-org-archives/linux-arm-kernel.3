Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64135C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 02:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tDeo0yq4IgKjH0KpWx8B87yEcLpD4MkC2r0r05DtPkw=; b=H23TLdam4cRfw/FL4kFAQZ8Djf
	0qRpOTu34u6wU7TJsFr+Q+PF38a2rDiuFVCLQ1YzKoxxOIiimEIc4BXb77475VGm4Ty/p4kVhBLEL
	+RHFHZJraf9oNVaeh9lcw7gtSJhgWHEbbrOIcWJffTjBXBCOF0H3viGn0o929pyNLhpppvv1kQ7GP
	8buReCGkdm6g3gp1tQzAUSc/L0ltS/p5/b5hPQiY/TBI4lIBWv0F3LVmib5SOn1R2TOEQ3oYaJ1BS
	TJIOTMAE35ponqOt/8pNRhEwALXYvFxSrjjsryj8np5feVX4Ct0CAV1bbdfR6P/WkMqfQvTQX65LW
	UJy+DByA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubVGw-00000003mre-3rKS;
	Tue, 15 Jul 2025 02:19:58 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubVE1-00000003mW3-42OK;
	Tue, 15 Jul 2025 02:16:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752545819; x=1784081819;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jmxCqU7vT9wDGVqn13z5bf8xdfrCR0BgKtLcYkpE5QY=;
  b=Kv8CNlw7GI46QnSGiuRs8YNMmYwUjfyifId4Ox2hmW9GzIPujfHLk4M3
   zgPBgAdTEz5n9jydjLD2t56AOMQMrxk2AotZz9Phx5D1frIMq8gwYY0Ox
   MDgkVNO/YadohwRk7ufXuRlS2gKRFS9VfOM1PYbgQunE7H21dje+7yI0Y
   s+dfcbEwMduEC1fCBjxDgHW2pEilZkN7PBvz0luApL0GmID6120OhO6Li
   r5VHtyYUYAYAbH1KtQHNFPATa7HzoiiHug87u+tDNmTAbFeJWksf1nE7h
   PiKrsP0GqnTjO/6b9A6vp9/hwY7rMQiMJHtcOqW66gY5mEjsmnV9USSQq
   g==;
X-CSE-ConnectionGUID: JgT7zTRlRMW6Du3xz3XIzg==
X-CSE-MsgGUID: 1dK9WN6ZTR62jZXypDGRVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="66202045"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="66202045"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 19:16:56 -0700
X-CSE-ConnectionGUID: YPJe4lDXQxS/h0wBLeMU/w==
X-CSE-MsgGUID: M9YyJfrZSWqedUuQIlDCJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="157813800"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Jul 2025 19:16:52 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubVDt-0009Y3-3C;
	Tue, 15 Jul 2025 02:16:49 +0000
Date: Tue, 15 Jul 2025 10:16:17 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, lee@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, lgirdwood@gmail.com,
	broonie@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH v2 4/8] regulator: Add support for MediaTek MT6363 SPMI
 PMIC Regulators
Message-ID: <202507150934.VLFQsCyK-lkp@intel.com>
References: <20250707134451.154346-5-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707134451.154346-5-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_191658_044867_8C36C5FF 
X-CRM114-Status: GOOD (  14.04  )
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
[also build test ERROR on lee-mfd/for-mfd-next lee-mfd/for-mfd-fixes lee-leds/for-leds-next linus/master v6.16-rc6 next-20250714]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-regulator-Document-MediaTek-MT6316-PMIC-Regulators/20250707-214911
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20250707134451.154346-5-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v2 4/8] regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20250715/202507150934.VLFQsCyK-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250715/202507150934.VLFQsCyK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507150934.VLFQsCyK-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/regulator/mt6363-regulator.c: In function 'mt6363_vemc_set_voltage_sel':
>> drivers/regulator/mt6363-regulator.c:457:23: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     457 |                 sel = FIELD_PREP(MT6363_RG_VEMC_VOSEL_1_MASK, sel);
         |                       ^~~~~~~~~~
   drivers/regulator/mt6363-regulator.c: In function 'mt6363_vemc_get_voltage_sel':
>> drivers/regulator/mt6363-regulator.c:489:23: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     489 |                 ret = FIELD_GET(MT6363_RG_VEMC_VOSEL_1_MASK, sel);
         |                       ^~~~~~~~~


vim +/FIELD_PREP +457 drivers/regulator/mt6363-regulator.c

   432	
   433	static int mt6363_vemc_set_voltage_sel(struct regulator_dev *rdev, unsigned int sel)
   434	{
   435		const u16 tma_unlock_key = MT6363_TMA_UNLOCK_VALUE;
   436		struct regmap *regmap = rdev->regmap;
   437		unsigned int val;
   438		u16 mask;
   439		int ret;
   440	
   441		ret = regmap_read(rdev->regmap, MT6363_TOP_TRAP, &val);
   442		if (ret)
   443			return ret;
   444	
   445		if (val > 1)
   446			return -EINVAL;
   447	
   448		/* Unlock TMA for writing */
   449		ret = regmap_bulk_write(rdev->regmap, MT6363_TOP_TMA_KEY_L,
   450					&tma_unlock_key, sizeof(tma_unlock_key));
   451		if (ret)
   452			return ret;
   453	
   454		/* If HW trapping value is 1, use VEMC_VOSEL_1 instead of VEMC_VOSEL_0 */
   455		if (val == 1) {
   456			mask = MT6363_RG_VEMC_VOSEL_1_MASK;
 > 457			sel = FIELD_PREP(MT6363_RG_VEMC_VOSEL_1_MASK, sel);
   458		} else {
   459			mask = rdev->desc->vsel_mask;
   460		}
   461	
   462		/* Function must return the result of this write operation */
   463		ret = regmap_update_bits(regmap, rdev->desc->vsel_reg, mask, sel);
   464	
   465		/* Unconditionally re-lock TMA */
   466		val = 0;
   467		regmap_bulk_write(rdev->regmap, MT6363_TOP_TMA_KEY_L, &val, 2);
   468	
   469		return ret;
   470	}
   471	
   472	static int mt6363_vemc_get_voltage_sel(struct regulator_dev *rdev)
   473	{
   474		unsigned int sel, trap;
   475		int ret;
   476	
   477		ret = regmap_read(rdev->regmap, rdev->desc->vsel_reg, &sel);
   478		if (ret)
   479			return ret;
   480	
   481		ret = regmap_read(rdev->regmap, MT6363_TOP_TRAP, &trap);
   482		if (ret)
   483			return ret;
   484	
   485		/* If HW trapping value is 1, use VEMC_VOSEL_1 instead of VEMC_VOSEL_0 */
   486		if (trap > 1)
   487			return -EINVAL;
   488		else if (trap == 1)
 > 489			ret = FIELD_GET(MT6363_RG_VEMC_VOSEL_1_MASK, sel);
   490		else
   491			ret = sel & rdev->desc->vsel_mask;
   492	
   493		return ret;
   494	}
   495	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

