Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71F4C83F05
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 06:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zlThohAGIHYBINV5GtjgIMqDKWtTGPhES8cv6kX6qVo=; b=dApq7Cj/eIFNyHRxHhmkJ+srJO
	wA36NqLgH0J2mD2cZ8yzSygAr6iws4uxLwFFKEP4fwjwWFXVx9ZuqesRI6fEeAhcGjUYq5Sw0evpj
	IDq4OYTc32AWZlEYW6xiEuZeNG+igNyi3M6ZvKJ8jcXKk9iod700kRbJKCnVpGGg5x7vkc9bvheZ/
	eRSWDbDlLXyVS1pSARHlU8uMmjrnlFPlFwJy6P8coaHmQu+FxaZVVHfaYG9Ul/sRxpfRTX6MntDpO
	poP3LdimCFdJITapSyyWu+/I1s9Wvpa+uG90bw9dyB//4A5PwKVLx3SUTFz7xCuGxtxn2twgC33J9
	Xyy5Q9AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYInz-0000000HRyb-1cdj;
	Sun, 06 Jul 2025 06:24:51 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYIlf-0000000HRqo-2X4K;
	Sun, 06 Jul 2025 06:22:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751782948; x=1783318948;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nW8O8YdElWySi7VcpRvqBHn54tWkhNDJ64guVXrJuCc=;
  b=lwuvItPUJOqoCtP5CfIIMvLRR3X6oSWJOE1nnnWs5X2C++pdEVVcKAtB
   LjmIb7L4eV5brty2WseIctE8N7Tx7OyfXjRsSFozAS9Fpx4bNxqW4VqdX
   he+OtvOWtdfwOqefu1Au3KxkdJR+0pBH8BOo/sAA9a2uEhph6xjIrXqSo
   JVVZPfl15dTWV37TUIg3I6ogVPr8dlEyckp1RYLyrfti3GxwhTSKnOixs
   yObVniyQXJltcirjpOogQcdDK+meXLqJFSPVEaC4oWuVwxkZroRwMTEdX
   O0ms2P0TDciTX0b7mSqOB4Zm6btDqjwdcG7t5hMWWf8I8GAIl0/KBcURW
   g==;
X-CSE-ConnectionGUID: tw/m++kjSEaWHdhQq2raqQ==
X-CSE-MsgGUID: BhmJruKHQHSGr/sMGphhoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="57703927"
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="57703927"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 23:22:22 -0700
X-CSE-ConnectionGUID: bHDd9G8XRAqckPZ8lMKU7A==
X-CSE-MsgGUID: iSE7HrUbTUCEPReK/zoDzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="159486719"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Jul 2025 23:22:18 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYIlT-0004v1-2N;
	Sun, 06 Jul 2025 06:22:15 +0000
Date: Sun, 6 Jul 2025 14:22:01 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	broonie@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 4/6] regulator: Add support for MediaTek MT6363 SPMI
 PMIC Regulators
Message-ID: <202507061437.VKBqvJPn-lkp@intel.com>
References: <20250624073548.29732-5-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624073548.29732-5-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_232227_689388_613CF08D 
X-CRM114-Status: GOOD (  14.29  )
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
[also build test ERROR on linus/master v6.16-rc4 next-20250704]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-regulator-Document-MediaTek-MT6316-PMIC-Regulators/20250624-154048
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20250624073548.29732-5-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v2 4/6] regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250706/202507061437.VKBqvJPn-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250706/202507061437.VKBqvJPn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507061437.VKBqvJPn-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/regulator/mt6363-regulator.c:375:14: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     375 |                 } else if (cur_mode == REGULATOR_MODE_IDLE) {
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6363-regulator.c:388:6: note: uninitialized use occurs here
     388 |         if (ret) {
         |             ^~~
   drivers/regulator/mt6363-regulator.c:375:10: note: remove the 'if' if its condition is always true
     375 |                 } else if (cur_mode == REGULATOR_MODE_IDLE) {
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6363-regulator.c:347:19: note: initialize the variable 'ret' to silence this warning
     347 |         int cur_mode, ret;
         |                          ^
         |                           = 0
   drivers/regulator/mt6363-regulator.c:351:28: warning: variable 'regmap' is uninitialized when used here [-Wuninitialized]
     351 |                 ret = mt6363_buck_unlock(regmap, true);
         |                                          ^~~~~~
   drivers/regulator/mt6363-regulator.c:346:23: note: initialize the variable 'regmap' to silence this warning
     346 |         struct regmap *regmap;
         |                              ^
         |                               = NULL
>> drivers/regulator/mt6363-regulator.c:455:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     455 |                 sel = FIELD_PREP(MT6363_RG_VEMC_VOSEL_1_MASK, sel);
         |                       ^
>> drivers/regulator/mt6363-regulator.c:487:9: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     487 |                 ret = FIELD_GET(MT6363_RG_VEMC_VOSEL_1_MASK, sel);
         |                       ^
   2 warnings and 2 errors generated.


vim +/FIELD_PREP +455 drivers/regulator/mt6363-regulator.c

   430	
   431	static int mt6363_vemc_set_voltage_sel(struct regulator_dev *rdev, unsigned int sel)
   432	{
   433		const u16 tma_unlock_key = MT6363_TMA_UNLOCK_VALUE;
   434		struct regmap *regmap = rdev->regmap;
   435		unsigned int val;
   436		u16 mask;
   437		int ret;
   438	
   439		ret = regmap_read(rdev->regmap, MT6363_TOP_TRAP, &val);
   440		if (ret)
   441			return ret;
   442	
   443		if (val > 1)
   444			return -EINVAL;
   445	
   446		/* Unlock TMA for writing */
   447		ret = regmap_bulk_write(rdev->regmap, MT6363_TOP_TMA_KEY_L,
   448					&tma_unlock_key, sizeof(tma_unlock_key));
   449		if (ret)
   450			return ret;
   451	
   452		/* If HW trapping value is 1, use VEMC_VOSEL_1 instead of VEMC_VOSEL_0 */
   453		if (val == 1) {
   454			mask = MT6363_RG_VEMC_VOSEL_1_MASK;
 > 455			sel = FIELD_PREP(MT6363_RG_VEMC_VOSEL_1_MASK, sel);
   456		} else {
   457			mask = rdev->desc->vsel_mask;
   458		}
   459	
   460		/* Function must return the result of this write operation */
   461		ret = regmap_update_bits(regmap, rdev->desc->vsel_reg, mask, sel);
   462	
   463		/* Unconditionally re-lock TMA */
   464		val = 0;
   465		regmap_bulk_write(rdev->regmap, MT6363_TOP_TMA_KEY_L, &val, 2);
   466	
   467		return ret;
   468	}
   469	
   470	static int mt6363_vemc_get_voltage_sel(struct regulator_dev *rdev)
   471	{
   472		unsigned int sel, trap;
   473		int ret;
   474	
   475		ret = regmap_read(rdev->regmap, rdev->desc->vsel_reg, &sel);
   476		if (ret)
   477			return ret;
   478	
   479		ret = regmap_read(rdev->regmap, MT6363_TOP_TRAP, &trap);
   480		if (ret)
   481			return ret;
   482	
   483		/* If HW trapping value is 1, use VEMC_VOSEL_1 instead of VEMC_VOSEL_0 */
   484		if (trap > 1)
   485			return -EINVAL;
   486		else if (trap == 1)
 > 487			ret = FIELD_GET(MT6363_RG_VEMC_VOSEL_1_MASK, sel);
   488		else
   489			ret = sel & rdev->desc->vsel_mask;
   490	
   491		return ret;
   492	}
   493	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

