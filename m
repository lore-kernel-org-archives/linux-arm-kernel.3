Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E72CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 13:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aXJO0WkU401jpk4kwGrc8SuCAOE3eIWrZnESqPAkAFM=; b=js+Xsj5qhAZtm2bN1V/R96BmAN
	mGBnTV1qgnvNeOjrvdM4wNBCG3YYJsMxFNoTqIx1lxBcbN8+gVeXZ0PRackuQQcefo0tG2X8eo/RD
	L1p0nVSpbEj6vmDuIUqFM/Q39E7FcR4QzcuiqB6PDEFfa3oy04C3jxn09/arBl94nQdCX+5iwUO4c
	sFwim1Bx80wZAwDkM+V32lG9QgG4bddX8k0usskm9yNsoKDPOxMbjCgFepFETmQ2QifsUj9OY4gDa
	zC0D26liauSzBroOVLca2Z4sLR03gwZhJ69Fv6/djb2GqiTIp7qAFtK1Z8RT0UIVHeZ0As5cUszx+
	0w3GxiIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v28TK-00000001YfR-2Vvk;
	Fri, 26 Sep 2025 13:26:50 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v28TH-00000001Ydi-1X2F;
	Fri, 26 Sep 2025 13:26:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758893208; x=1790429208;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tt8j4f67Myq2x91/cEcHImKhtQzK3hMmMD/sIcbXrSI=;
  b=C5iVojS+BUp0M4Jcv0Jhy3W49aPzSlDp+szlAqWzyQ0HBqCCgjdvLAzP
   /6doJ+NgaEM8T7mnIbDyxUQhuKOxqFBETu0Q5lz/6mbFdVTZOM/7YEZmd
   w9SIO3tfF2thHD4swGgD63gm50tMCBhFWrS4FXwpVeGiRcZCDAgjOFzXZ
   sSkPsOPCHKq8pbtL64t8l33MolquzSh1m2enx5Sk1tlpEKmTRWZCAauIm
   ZcXWVpUmko7ty6Dq4FRqd52wx81y82VEGMj62JQz+gSF4Y5aLkRSvfRyo
   cjqKJazX6GpDFySPvHfrJ9yfKw4tago6Qy11khqrWMHwXNeqDkbhpESzU
   A==;
X-CSE-ConnectionGUID: ipTeV35mS86imoBcnok+EA==
X-CSE-MsgGUID: og4z4ekhSwyNmtpXAt0EBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="72324278"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="72324278"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 06:26:46 -0700
X-CSE-ConnectionGUID: KyBoOnMDT3WLFyHiLckXHQ==
X-CSE-MsgGUID: gaUzxMHbRR2LRreEpd9+TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="181619627"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 26 Sep 2025 06:26:41 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v28T9-0006GP-0Q;
	Fri, 26 Sep 2025 13:26:39 +0000
Date: Fri, 26 Sep 2025 21:26:01 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	ulf.hansson@linaro.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, nfraprado@collabora.com,
	fshao@chromium.org, y.oudjana@protonmail.com, wenst@chromium.org,
	mandyjh.liu@mediatek.com, mbrugger@suse.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 3/5] pmdomain: mediatek: Add support for secure HWCCF
 infra power on
Message-ID: <202509262155.Ux4J6K4D-lkp@intel.com>
References: <20250925143122.39796-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925143122.39796-4-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_062647_446443_35E6FD7B 
X-CRM114-Status: GOOD (  13.99  )
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

[auto build test ERROR on next-20250924]
[cannot apply to robh/for-next linus/master v6.17-rc7 v6.17-rc6 v6.17-rc5 v6.17-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-power-Add-support-for-MT8196-power-controllers/20250925-223530
base:   next-20250924
patch link:    https://lore.kernel.org/r/20250925143122.39796-4-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v2 3/5] pmdomain: mediatek: Add support for secure HWCCF infra power on
config: i386-buildonly-randconfig-001-20250926 (https://download.01.org/0day-ci/archive/20250926/202509262155.Ux4J6K4D-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509262155.Ux4J6K4D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509262155.Ux4J6K4D-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pmdomain/mediatek/mtk-pm-domains.c:124:23: error: variable has incomplete type 'struct arm_smccc_res'
     124 |         struct arm_smccc_res res;
         |                              ^
   drivers/pmdomain/mediatek/mtk-pm-domains.c:124:9: note: forward declaration of 'struct arm_smccc_res'
     124 |         struct arm_smccc_res res;
         |                ^
>> drivers/pmdomain/mediatek/mtk-pm-domains.c:127:2: error: call to undeclared function 'arm_smccc_smc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     127 |         arm_smccc_smc(MTK_SIP_KERNEL_HWCCF_CONTROL, cmd, 0, 0, 0, 0, 0, 0, &res);
         |         ^
>> drivers/pmdomain/mediatek/mtk-pm-domains.c:127:16: error: call to undeclared function 'ARM_SMCCC_CALL_VAL'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     127 |         arm_smccc_smc(MTK_SIP_KERNEL_HWCCF_CONTROL, cmd, 0, 0, 0, 0, 0, 0, &res);
         |                       ^
   drivers/pmdomain/mediatek/mtk-pm-domains.c:55:38: note: expanded from macro 'MTK_SIP_KERNEL_HWCCF_CONTROL'
      55 | #define MTK_SIP_KERNEL_HWCCF_CONTROL    MTK_SIP_SMC_CMD(0x540)
         |                                         ^
   include/linux/soc/mediatek/mtk_sip_svc.h:22:2: note: expanded from macro 'MTK_SIP_SMC_CMD'
      22 |         ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, MTK_SIP_SMC_CONVENTION, \
         |         ^
>> drivers/pmdomain/mediatek/mtk-pm-domains.c:127:16: error: use of undeclared identifier 'ARM_SMCCC_FAST_CALL'
   drivers/pmdomain/mediatek/mtk-pm-domains.c:55:38: note: expanded from macro 'MTK_SIP_KERNEL_HWCCF_CONTROL'
      55 | #define MTK_SIP_KERNEL_HWCCF_CONTROL    MTK_SIP_SMC_CMD(0x540)
         |                                         ^
   include/linux/soc/mediatek/mtk_sip_svc.h:22:21: note: expanded from macro 'MTK_SIP_SMC_CMD'
      22 |         ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, MTK_SIP_SMC_CONVENTION, \
         |                            ^
>> drivers/pmdomain/mediatek/mtk-pm-domains.c:127:16: error: use of undeclared identifier 'ARM_SMCCC_SMC_32'
   drivers/pmdomain/mediatek/mtk-pm-domains.c:55:38: note: expanded from macro 'MTK_SIP_KERNEL_HWCCF_CONTROL'
      55 | #define MTK_SIP_KERNEL_HWCCF_CONTROL    MTK_SIP_SMC_CMD(0x540)
         |                                         ^
   include/linux/soc/mediatek/mtk_sip_svc.h:22:42: note: expanded from macro 'MTK_SIP_SMC_CMD'
      22 |         ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, MTK_SIP_SMC_CONVENTION, \
         |                                                 ^
   include/linux/soc/mediatek/mtk_sip_svc.h:18:41: note: expanded from macro 'MTK_SIP_SMC_CONVENTION'
      18 | #define MTK_SIP_SMC_CONVENTION          ARM_SMCCC_SMC_32
         |                                         ^
>> drivers/pmdomain/mediatek/mtk-pm-domains.c:127:16: error: use of undeclared identifier 'ARM_SMCCC_OWNER_SIP'
   drivers/pmdomain/mediatek/mtk-pm-domains.c:55:38: note: expanded from macro 'MTK_SIP_KERNEL_HWCCF_CONTROL'
      55 | #define MTK_SIP_KERNEL_HWCCF_CONTROL    MTK_SIP_SMC_CMD(0x540)
         |                                         ^
   include/linux/soc/mediatek/mtk_sip_svc.h:23:7: note: expanded from macro 'MTK_SIP_SMC_CMD'
      23 |                            ARM_SMCCC_OWNER_SIP, fn_id)
         |                            ^
   6 errors generated.


vim +124 drivers/pmdomain/mediatek/mtk-pm-domains.c

    54	
  > 55	#define MTK_SIP_KERNEL_HWCCF_CONTROL	MTK_SIP_SMC_CMD(0x540)
    56	
    57	struct scpsys_domain {
    58		struct generic_pm_domain genpd;
    59		const struct scpsys_domain_data *data;
    60		const struct scpsys_hwv_domain_data *hwv_data;
    61		struct scpsys *scpsys;
    62		int num_clks;
    63		struct clk_bulk_data *clks;
    64		int num_subsys_clks;
    65		struct clk_bulk_data *subsys_clks;
    66		struct regulator *supply;
    67	};
    68	
    69	struct scpsys {
    70		struct device *dev;
    71		struct regmap *base;
    72		const struct scpsys_soc_data *soc_data;
    73		u8 bus_prot_index[BUS_PROT_BLOCK_COUNT];
    74		struct regmap **bus_prot;
    75		struct genpd_onecell_data pd_data;
    76		struct generic_pm_domain *domains[];
    77	};
    78	
    79	#define to_scpsys_domain(gpd) container_of(gpd, struct scpsys_domain, genpd)
    80	
    81	static bool scpsys_domain_is_on(struct scpsys_domain *pd)
    82	{
    83		struct scpsys *scpsys = pd->scpsys;
    84		u32 status, status2;
    85	
    86		regmap_read(scpsys->base, pd->data->pwr_sta_offs, &status);
    87		status &= pd->data->sta_mask;
    88	
    89		regmap_read(scpsys->base, pd->data->pwr_sta2nd_offs, &status2);
    90		status2 &= pd->data->sta_mask;
    91	
    92		/* A domain is on when both status bits are set. */
    93		return status && status2;
    94	}
    95	
    96	static bool scpsys_hwv_domain_is_disable_done(struct scpsys_domain *pd)
    97	{
    98		const struct scpsys_hwv_domain_data *hwv = pd->hwv_data;
    99		u32 regs[2] = { hwv->done, hwv->clr_sta };
   100		u32 val[2];
   101		u32 mask = BIT(hwv->setclr_bit);
   102	
   103		regmap_multi_reg_read(pd->scpsys->base, regs, val, 2);
   104	
   105		/* Disable is done when the bit is set in DONE, cleared in CLR_STA */
   106		return (val[0] & mask) && !(val[1] & mask);
   107	}
   108	
   109	static bool scpsys_hwv_domain_is_enable_done(struct scpsys_domain *pd)
   110	{
   111		const struct scpsys_hwv_domain_data *hwv = pd->hwv_data;
   112		u32 regs[3] = { hwv->done, hwv->en, hwv->set_sta };
   113		u32 val[3];
   114		u32 mask = BIT(hwv->setclr_bit);
   115	
   116		regmap_multi_reg_read(pd->scpsys->base, regs, val, 3);
   117	
   118		/* Enable is done when the bit is set in DONE and EN, cleared in SET_STA */
   119		return (val[0] & mask) && (val[1] & mask) && !(val[2] & mask);
   120	}
   121	
   122	static int scpsys_sec_infra_power_on(bool on)
   123	{
 > 124		struct arm_smccc_res res;
   125		unsigned long cmd = on ? 1 : 0;
   126	
 > 127		arm_smccc_smc(MTK_SIP_KERNEL_HWCCF_CONTROL, cmd, 0, 0, 0, 0, 0, 0, &res);
   128		return res.a0;
   129	}
   130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

