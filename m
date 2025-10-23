Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF59CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 02:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dlV5d49BwloPLjUsa/rutF/mdgwYLmGa4dkbC1ocetc=; b=Ulo84zyp+Eu/fFjVuFvIYhnpJI
	0Xx1rLTe0pIXd8KH2H7xFYono/7Yt35Ws9EnQQtrxg1IdF/2pgLhuk072LcH1q2jcDjVrAfYTaiRz
	yidjLNGZX0Ki3dpzb+JLc3wInVaLZStNFth3uQLNVvhonZBCGRwVqVq7yfTMklkTYeGdr5uVV4JaV
	N7NPFhBiYh2cvsCo8PQfpKGPHMI2MZdRO3llcKEBRMrUYS1swZrDAOCPBGE6AFMob9FlMY1nc6xh0
	CEYh66C5ieLwSyH+VrHIm0TiHZkR2S25x4OINrEzXnwP3cQjt8UGZpSC48dOeZqW2PBNgINQbBbxx
	LfZvoYfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBkfu-00000004nj0-2eg2;
	Thu, 23 Oct 2025 02:03:34 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBkfr-00000004niF-0PUo;
	Thu, 23 Oct 2025 02:03:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761185011; x=1792721011;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=II/ZdmUJAzGxv3QWKqJsX3UBm0ANX86R16zcAqswtp0=;
  b=k2Q5roQVcTWy2XUwAKg/K4Yycbjtxh9k4+m/Nu+dlbHpm6kTogvAHRad
   HCzNeFDHzJuJ6Uz4ANsc7T3SKoczczWn4DLFPJ0oWyH8+eyl5tsikCPZX
   5h12mL9Y5vduAiHauzW0RbRlz7QFqr8wY6PfEqkvAsqTt5GwGC42OmUel
   qkwhoCJf2AOXQwRjhYAviSeAVkw4JXDqN17mGajHivz3iINgIS0607n3v
   AL8Z/j5ACJDXAN3J/VjmADT98inTPS9ifgdFy4jyBTjGoSqpESdbmr+70
   o5M16MV+WHInbt5+/G+5K9NOXKsuTuSRXnQPAlKa7os8EoDPfvqPGxUx4
   g==;
X-CSE-ConnectionGUID: gNoUkNesQSeIoxk+aZHPxQ==
X-CSE-MsgGUID: uEIgXCQnRJm39jL7yS1HTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74691641"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="74691641"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 19:03:28 -0700
X-CSE-ConnectionGUID: 4N7oplQ1RIy9OOBPvJvjpQ==
X-CSE-MsgGUID: Ps9BDcO6Tf2jplnBrjoDwA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 22 Oct 2025 19:03:25 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBkfj-000Cv5-0Z;
	Thu, 23 Oct 2025 02:03:23 +0000
Date: Thu, 23 Oct 2025 10:03:17 +0800
From: kernel test robot <lkp@intel.com>
To: muhammed.efecetin.67@gmail.com, linux-rockchip@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	heiko@sntech.de, neil.armstrong@linaro.org, lee@kernel.org,
	rafael@kernel.org, efectn@protonmail.com, daniel.lezcano@linaro.org
Subject: Re: [PATCH v3 3/5] mfd: add Khadas Edge 2 registers to khadas-mcu.
Message-ID: <202510230921.N0ezsPtO-lkp@intel.com>
References: <adbd6dd5e9ed938bab7927597b7f21eca3274b78.1761059314.git.efectn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adbd6dd5e9ed938bab7927597b7f21eca3274b78.1761059314.git.efectn@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_190331_265936_5918F69B 
X-CRM114-Status: GOOD (  11.95  )
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
config: x86_64-buildonly-randconfig-002-20251023 (https://download.01.org/0day-ci/archive/20251023/202510230921.N0ezsPtO-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510230921.N0ezsPtO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510230921.N0ezsPtO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/khadas-mcu.c:103:35: warning: 'khadas_mcu_regmap_config_edge2' defined but not used [-Wunused-const-variable=]
     103 | static const struct regmap_config khadas_mcu_regmap_config_edge2 = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mfd/khadas-mcu.c:93:35: warning: 'khadas_mcu_regmap_config' defined but not used [-Wunused-const-variable=]
      93 | static const struct regmap_config khadas_mcu_regmap_config = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/khadas_mcu_regmap_config_edge2 +103 drivers/mfd/khadas-mcu.c

    92	
  > 93	static const struct regmap_config khadas_mcu_regmap_config = {
    94		.reg_bits	= 8,
    95		.reg_stride	= 1,
    96		.val_bits	= 8,
    97		.max_register	= KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG,
    98		.volatile_reg	= khadas_mcu_reg_volatile,
    99		.writeable_reg	= khadas_mcu_reg_writeable,
   100		.cache_type	= REGCACHE_MAPLE,
   101	};
   102	
 > 103	static const struct regmap_config khadas_mcu_regmap_config_edge2 = {
   104		.reg_bits	= 8,
   105		.reg_stride	= 1,
   106		.val_bits	= 8,
   107		.max_register	= KHADAS_MCU_EDGE2_SYS_RST_REG,
   108		.volatile_reg	= khadas_mcu_reg_volatile_edge2,
   109		.writeable_reg	= khadas_mcu_reg_writeable_edge2,
   110		.cache_type	= REGCACHE_MAPLE,
   111	};
   112	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

