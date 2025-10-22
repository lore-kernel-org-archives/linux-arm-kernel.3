Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BC5CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 07:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4vi+tv/alapT+lY35zJfhFktaqHLiIeRDfFJORz1cY=; b=DsORC1vkiwU/ovO/kScCBZByZx
	w0uPSldYJMNyvTYYIg/8ZCoIe16TB9NGhEfQtyK3uathKZjICXuzqGSsfQSLLgD5Rg1XHZuYQdNj+
	uwoTTzSxDV5Ik1I0xYnl79iXO6391WWZbTPD06lcSGi0gUHi6ScbSq30BPcnXj9lr0d/+tKNp2jmC
	YxX35WfPI2Ai8s4JcWAwIKBwbvhdkrpoZQSRaxmEXQCSpgHKDhgH/9pFKoACZ0mup/1lxjL0nqckn
	738EQzhGpyT54JbRZI4IWK5iSDFtjVOjLTcV5JyLXkYR/af3SVYvlLBMlCjRX422o6800WgknuwLe
	ektiGkww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBT84-00000001qAS-1Ljv;
	Wed, 22 Oct 2025 07:19:28 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBT80-00000001q9T-11vE;
	Wed, 22 Oct 2025 07:19:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761117564; x=1792653564;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UiGPap5OuCArfvp0Rq7pyLVsVmVZWUW9e6oIXM/7mSs=;
  b=Ewx+zRZSSfLLbkUITeq5HjzPuZl3txo2qrkQs2rq4/o2MgnhXiSNf1S0
   sJmp/xWP07oa4NVg1nYaca7qYU7mgskA+2cGLMVy+r71wy82fRKbqhW2j
   cr5sK4DqJp2tPsTn0u4fnnQT2RqidCzpPH/2ays2GfKgZDZ6RO8Ep8jrI
   Hj9m+CR3tuGIi7I81Kg0WB3YFUmrczW+bn6jAzMo8I5GfNjGm38a8Em6X
   oUmv9WtN16IGdBUYFsnMd/QB3c4HZIaOFEWOLe49XqfwAKiQVFzKjQ6yk
   DZBX0w2zLqYWBaSPoePwRngns2/jxdqUiE9NIo3SskCC7oCp+v7ciRKHg
   A==;
X-CSE-ConnectionGUID: 7T8kXoufQiimmMaFl+46HQ==
X-CSE-MsgGUID: yeQT0FK1RnuaeE9ZqlhT+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73926138"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="73926138"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 00:19:22 -0700
X-CSE-ConnectionGUID: 7M7TzhqdR9KlUZ387HsP5Q==
X-CSE-MsgGUID: 1tHd2Us/SE61EU8ZcZSO7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="188074733"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 Oct 2025 00:19:18 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBT7s-000C5h-1T;
	Wed, 22 Oct 2025 07:19:16 +0000
Date: Wed, 22 Oct 2025 15:18:28 +0800
From: kernel test robot <lkp@intel.com>
To: muhammed.efecetin.67@gmail.com, linux-rockchip@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de,
	neil.armstrong@linaro.org, lee@kernel.org, rafael@kernel.org,
	efectn@protonmail.com, daniel.lezcano@linaro.org
Subject: Re: [PATCH v3 3/5] mfd: add Khadas Edge 2 registers to khadas-mcu.
Message-ID: <202510221512.9Ji8w2KZ-lkp@intel.com>
References: <adbd6dd5e9ed938bab7927597b7f21eca3274b78.1761059314.git.efectn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adbd6dd5e9ed938bab7927597b7f21eca3274b78.1761059314.git.efectn@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_001924_425617_87C5F1D5 
X-CRM114-Status: GOOD (  11.93  )
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

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on lee-mfd/for-mfd-fixes rockchip/for-next rafael-pm/thermal linus/master v6.18-rc2 next-20251022]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/muhammed-efecetin-67-gmail-com/dt-bindings-mfd-khadas-mcu-add-new-compatible-for-Khadas-Edge-2/20251021-232554
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/adbd6dd5e9ed938bab7927597b7f21eca3274b78.1761059314.git.efectn%40protonmail.com
patch subject: [PATCH v3 3/5] mfd: add Khadas Edge 2 registers to khadas-mcu.
config: i386-buildonly-randconfig-002-20251022 (https://download.01.org/0day-ci/archive/20251022/202510221512.9Ji8w2KZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510221512.9Ji8w2KZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510221512.9Ji8w2KZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/khadas-mcu.c:93:35: warning: unused variable 'khadas_mcu_regmap_config' [-Wunused-const-variable]
      93 | static const struct regmap_config khadas_mcu_regmap_config = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mfd/khadas-mcu.c:103:35: warning: unused variable 'khadas_mcu_regmap_config_edge2' [-Wunused-const-variable]
     103 | static const struct regmap_config khadas_mcu_regmap_config_edge2 = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/khadas_mcu_regmap_config +93 drivers/mfd/khadas-mcu.c

54c97b83897fb1 Muhammed Efe Cetin 2025-10-21   92  
6c27219e349116 Neil Armstrong     2020-06-08  @93  static const struct regmap_config khadas_mcu_regmap_config = {
6c27219e349116 Neil Armstrong     2020-06-08   94  	.reg_bits	= 8,
6c27219e349116 Neil Armstrong     2020-06-08   95  	.reg_stride	= 1,
6c27219e349116 Neil Armstrong     2020-06-08   96  	.val_bits	= 8,
6c27219e349116 Neil Armstrong     2020-06-08   97  	.max_register	= KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG,
6c27219e349116 Neil Armstrong     2020-06-08   98  	.volatile_reg	= khadas_mcu_reg_volatile,
6c27219e349116 Neil Armstrong     2020-06-08   99  	.writeable_reg	= khadas_mcu_reg_writeable,
14100f8e58564d Bo Liu             2024-02-06  100  	.cache_type	= REGCACHE_MAPLE,
6c27219e349116 Neil Armstrong     2020-06-08  101  };
6c27219e349116 Neil Armstrong     2020-06-08  102  
54c97b83897fb1 Muhammed Efe Cetin 2025-10-21 @103  static const struct regmap_config khadas_mcu_regmap_config_edge2 = {
54c97b83897fb1 Muhammed Efe Cetin 2025-10-21  104  	.reg_bits	= 8,
54c97b83897fb1 Muhammed Efe Cetin 2025-10-21  105  	.reg_stride	= 1,
54c97b83897fb1 Muhammed Efe Cetin 2025-10-21  106  	.val_bits	= 8,
54c97b83897fb1 Muhammed Efe Cetin 2025-10-21  107  	.max_register	= KHADAS_MCU_EDGE2_SYS_RST_REG,
54c97b83897fb1 Muhammed Efe Cetin 2025-10-21  108  	.volatile_reg	= khadas_mcu_reg_volatile_edge2,
54c97b83897fb1 Muhammed Efe Cetin 2025-10-21  109  	.writeable_reg	= khadas_mcu_reg_writeable_edge2,
54c97b83897fb1 Muhammed Efe Cetin 2025-10-21  110  	.cache_type	= REGCACHE_MAPLE,
54c97b83897fb1 Muhammed Efe Cetin 2025-10-21  111  };
54c97b83897fb1 Muhammed Efe Cetin 2025-10-21  112  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

