Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0689C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 04:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eEY0+4y3gdNHlGFTzn9MLgiD1FrJm+HM+oTRXBGFjmU=; b=XJ9kVU86TJosFSeJE+JXKxt9gt
	S1cVwaBViZKQN9PXrfIG3hWlyeUSZnKKubwsP15uFfCI47ip0lGpKWiMqczpW6aeE0VyBXeWs8t5k
	fNHu5pUt3XJAmO185hGV4NLTKjh3nDiYJgLor43UlJIT8B3oLQ/nE3wUB9urD9LhSBcykuOv/Bn3O
	re0OhjhcGmLwyol4Ix06k5x90N7XtlCh/t73LNXhbuk6p34kbc8yDiL1mrGjG8yebQyfw1yHYWMWG
	rgYzFpiH3W1ZubZ9y72w9BJT9ZLHjSzjUruPpRBEB7B7Uy37lkTKVemr38s0ib0kBqLAUledJh5ey
	WWM7CQlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTupK-00000004aeG-3a0X;
	Tue, 24 Jun 2025 04:00:06 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTumn-00000004aOt-3VVr;
	Tue, 24 Jun 2025 03:57:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750737449; x=1782273449;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KMEHcEq0X+pga2fcQQgj1lL/UKHHxkGD3F5FhJ7ooD8=;
  b=hai3S5MzFYLhhdkLe7aut2e3FV/XSshACCtMO0ezKa4vpcjDkuJ20GUD
   2MQ9GMYzSbtgWSNcZHDOob+UNA61dV8DaHdNpdKviSUcIxqB93PTzfA3x
   0gp+S06HuVuEU8xP/YFFJvbh6W2i0ihJZn3B7TUJTngfFmgQpNxwTrqtE
   BS2W9c56f//cVa/XYCVGyumWOcV1yTTJZ0ehwCvochQl1EPOifXeZqaEa
   hjTxdMfbvgyMYP84tqhlhjo71c135sXFbg30yG3xMQ+uj17s1s97Fdy4u
   bM2IJ2iOIgI2Cdm1F2gB9KCEu7LcU5vhPpqNpDTpLF2M8DM5a23bOmqzU
   A==;
X-CSE-ConnectionGUID: bL28e3K1R+e45y+fJUMTgQ==
X-CSE-MsgGUID: ftDO3DnwT3yDpYw2lU+rVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52900006"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="52900006"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 20:57:25 -0700
X-CSE-ConnectionGUID: VRKdCaRxSG6B/sLih1UGgA==
X-CSE-MsgGUID: UwxYRyrQQxy2q7hZRfl5dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="157282862"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 Jun 2025 20:57:22 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTume-000RhR-2W;
	Tue, 24 Jun 2025 03:57:20 +0000
Date: Tue, 24 Jun 2025 11:56:58 +0800
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
Subject: Re: [PATCH v1 2/6] regulator: Add support for MediaTek MT6316 SPMI
 PMIC Regulators
Message-ID: <202506241156.TWxCzjh3-lkp@intel.com>
References: <20250623120016.108732-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623120016.108732-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_205729_941682_6178477B 
X-CRM114-Status: GOOD (  13.97  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-regulator/for-next]
[also build test WARNING on linus/master v6.16-rc3 next-20250623]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-regulator-Document-MediaTek-MT6316-PMIC-Regulators/20250623-200316
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20250623120016.108732-3-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v1 2/6] regulator: Add support for MediaTek MT6316 SPMI PMIC Regulators
config: i386-buildonly-randconfig-004-20250624 (https://download.01.org/0day-ci/archive/20250624/202506241156.TWxCzjh3-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506241156.TWxCzjh3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506241156.TWxCzjh3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/regulator/mt6316-regulator.c:205:14: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     205 |                 } else if (cur_mode == REGULATOR_MODE_IDLE) {
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6316-regulator.c:218:6: note: uninitialized use occurs here
     218 |         if (ret) {
         |             ^~~
   drivers/regulator/mt6316-regulator.c:205:10: note: remove the 'if' if its condition is always true
     205 |                 } else if (cur_mode == REGULATOR_MODE_IDLE) {
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6316-regulator.c:189:19: note: initialize the variable 'ret' to silence this warning
     189 |         int cur_mode, ret;
         |                          ^
         |                           = 0
>> drivers/regulator/mt6316-regulator.c:193:25: warning: variable 'regmap' is uninitialized when used here [-Wuninitialized]
     193 |                 ret = regmap_set_bits(regmap, info->modeset_reg, info->modeset_mask);
         |                                       ^~~~~~
   drivers/regulator/mt6316-regulator.c:188:23: note: initialize the variable 'regmap' to silence this warning
     188 |         struct regmap *regmap;
         |                              ^
         |                               = NULL
   2 warnings generated.


vim +205 drivers/regulator/mt6316-regulator.c

   183	
   184	static int mt6316_regulator_set_mode(struct regulator_dev *rdev,
   185					     unsigned int mode)
   186	{
   187		struct mt6316_regulator_info *info = rdev_get_drvdata(rdev);
   188		struct regmap *regmap;
   189		int cur_mode, ret;
   190	
   191		switch (mode) {
   192		case REGULATOR_MODE_FAST:
 > 193			ret = regmap_set_bits(regmap, info->modeset_reg, info->modeset_mask);
   194			break;
   195		case REGULATOR_MODE_NORMAL:
   196			cur_mode = mt6316_regulator_get_mode(rdev);
   197			if (cur_mode < 0) {
   198				ret = cur_mode;
   199				break;
   200			}
   201	
   202			if (cur_mode == REGULATOR_MODE_FAST) {
   203				ret = regmap_clear_bits(regmap, info->modeset_reg, info->modeset_mask);
   204				break;
 > 205			} else if (cur_mode == REGULATOR_MODE_IDLE) {
   206				ret = regmap_clear_bits(regmap, info->lp_mode_reg, info->lp_mode_mask);
   207				if (ret == 0)
   208					usleep_range(100, 200);
   209			}
   210			break;
   211		case REGULATOR_MODE_IDLE:
   212			ret = regmap_set_bits(regmap, info->lp_mode_reg, info->lp_mode_mask);
   213			break;
   214		default:
   215			ret = -EINVAL;
   216		}
   217	
   218		if (ret) {
   219			dev_err(&rdev->dev, "Failed to set mode %u: %d\n", mode, ret);
   220			return ret;
   221		}
   222	
   223		return 0;
   224	}
   225	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

