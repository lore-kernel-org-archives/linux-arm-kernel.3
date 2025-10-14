Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96E5CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 14:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/IzsSt0Y6g8QSHpZg8Yt2xUQVi26ipSrVrtpsStGDOw=; b=31KSSB0V/vZ0h4OxXOTZ48falZ
	i60xLkzzs+Qi2JLys3Zlisu3EUfkraI26mc2bRM4vsQV71+iywaNMqtKKDaSfXxqpRD7I8cmlH7UL
	jrB5JLtH2fGBGjbG80au/Rx8xRGhdZZeeYqMcOrekXtX9CSzS+4xtV+WJSEByRtdWE042v7TAa4lz
	cqsBpoVu5WBQykUVaM8bYLJLDX9rIaRelGlVoDUVdJ85gta2pCwTwdZZbC+eLZkA0SkyNWv5YErmP
	FqQGRYzl+E0UFM9XbkbjAXtzHiOm49za5/EkWxYiQf1PWgcLUUecy8RRYM+UiAwPQ+XgP98zFEEcY
	L5pTBpog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gP3-0000000Ggxg-1yoj;
	Tue, 14 Oct 2025 14:53:29 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gP0-0000000Ggx7-17Ty
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 14:53:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760453606; x=1791989606;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z6qNyT2/oj6cU0ryqpoJ0qcaj3pCu/T9Mq36j0ZaZyo=;
  b=D1MfV+5E19xGZQ+fEZF0H94XJ/8Avhoi/dc6+/9GsSbXKm9wJPcZ1hqZ
   Vbbxr6/h6il7uRQkUT29YEGLzk3XDjHmrTUZBkTiaWzA4xaKbH2WFzriP
   EK6s+J4j7sqY3JDyTjxPebO100ooGCvMSSEBoro8sVI8Os3Un5tVfEILu
   SK1qyFp4wcalKw+LSpkq7PBOhm81baYYNAHsSraYuNRcUV3Xq1d98yQTD
   Fy0McQ4KxW6emxa1KJ7XkCJ8EPwja2NVZ2AOoHq5Q++/zYBsYYWnMl1S2
   hmy5mQwSZK3N8eyeWOu9coH3yia4Ak1eRY7txsVv4J+My2qGwFrSHpo6k
   Q==;
X-CSE-ConnectionGUID: FhgE4N3tTOCncwQ4ASTI1g==
X-CSE-MsgGUID: 5KVLTOEwRmWFGYlZbgyFxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="73215494"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; 
   d="scan'208";a="73215494"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 07:53:24 -0700
X-CSE-ConnectionGUID: poiBxSkoQCCEVEGLJGVzdw==
X-CSE-MsgGUID: 8lac8hSAQea4DlnmA1UaEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; 
   d="scan'208";a="219043783"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 14 Oct 2025 07:53:14 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8gNb-0002tJ-14;
	Tue, 14 Oct 2025 14:52:23 +0000
Date: Tue, 14 Oct 2025 22:46:56 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Will McVicker <willmcvicker@google.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, kernel-team@android.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH 7/9] clk: samsung: Implement automatic clock gating mode
 for CMUs
Message-ID: <202510142228.IQJSNIFa-lkp@intel.com>
References: <20251013-automatic-clocks-v1-7-72851ee00300@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-automatic-clocks-v1-7-72851ee00300@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_075326_502830_5DE235DA 
X-CRM114-Status: GOOD (  12.17  )
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

Hi Peter,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4a71531471926e3c391665ee9c42f4e0295a4585]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Griffin/dt-bindings-soc-samsung-exynos-sysreg-add-gs101-hsi0-and-misc-compatibles/20251014-045559
base:   4a71531471926e3c391665ee9c42f4e0295a4585
patch link:    https://lore.kernel.org/r/20251013-automatic-clocks-v1-7-72851ee00300%40linaro.org
patch subject: [PATCH 7/9] clk: samsung: Implement automatic clock gating mode for CMUs
config: loongarch-randconfig-001-20251014 (https://download.01.org/0day-ci/archive/20251014/202510142228.IQJSNIFa-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251014/202510142228.IQJSNIFa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510142228.IQJSNIFa-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/clk/samsung/clk.c:481:13: error: too many arguments to function call, expected 5, have 6
     478 |                 samsung_clk_extended_sleep_init(NULL, ctx->sysreg,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     479 |                                                 cmu->sysreg_clk_regs,
     480 |                                                 cmu->nr_sysreg_clk_regs,
     481 |                                                 NULL, 0);
         |                                                       ^
   drivers/clk/samsung/clk.h:453:20: note: 'samsung_clk_extended_sleep_init' declared here
     453 | static inline void samsung_clk_extended_sleep_init(void __iomem *reg_base,
         |                    ^                               ~~~~~~~~~~~~~~~~~~~~~~~
     454 |                         const unsigned long *rdump,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~
     455 |                         unsigned long nr_rdump,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~
     456 |                         const struct samsung_clk_reg_dump *rsuspend,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     457 |                         unsigned long nr_rsuspend) {}
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/samsung/clk.c:511:23: error: too many arguments to function call, expected 5, have 6
     509 |                 samsung_clk_extended_sleep_init(reg_base, NULL,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     510 |                         cmu->clk_regs, cmu->nr_clk_regs,
     511 |                         cmu->suspend_regs, cmu->nr_suspend_regs);
         |                                            ^~~~~~~~~~~~~~~~~~~~
   drivers/clk/samsung/clk.h:453:20: note: 'samsung_clk_extended_sleep_init' declared here
     453 | static inline void samsung_clk_extended_sleep_init(void __iomem *reg_base,
         |                    ^                               ~~~~~~~~~~~~~~~~~~~~~~~
     454 |                         const unsigned long *rdump,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~
     455 |                         unsigned long nr_rdump,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~
     456 |                         const struct samsung_clk_reg_dump *rsuspend,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     457 |                         unsigned long nr_rsuspend) {}
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.
--
>> Warning: drivers/clk/samsung/clk-exynos-arm64.c:249 function parameter 'init_clk_regs' not described in 'exynos_arm64_register_cmu_pm'


vim +481 drivers/clk/samsung/clk.c

   462	
   463	/* Enable Dynamic Root Clock Gating of bus components*/
   464	void samsung_en_dyn_root_clk_gating(struct device_node *np,
   465					    struct samsung_clk_provider *ctx,
   466					    const struct samsung_cmu_info *cmu)
   467	{
   468		if (ctx && !ctx->auto_clock_gate)
   469			return;
   470	
   471		ctx->sysreg = syscon_regmap_lookup_by_phandle(np, "samsung,sysreg");
   472		if (!IS_ERR_OR_NULL(ctx->sysreg)) {
   473			regmap_write(ctx->sysreg, ctx->drcg_offset, 0xffffffff);
   474			/* not every sysreg controller has memclk reg*/
   475			if (ctx->memclk_offset)
   476				regmap_write_bits(ctx->sysreg, ctx->memclk_offset, 0x1, 0x0);
   477	
   478			samsung_clk_extended_sleep_init(NULL, ctx->sysreg,
   479							cmu->sysreg_clk_regs,
   480							cmu->nr_sysreg_clk_regs,
 > 481							NULL, 0);
   482		} else {
   483			pr_warn("%pOF: Unable to get CMU sysreg\n", np);
   484			ctx->sysreg = NULL;
   485		}
   486	}
   487	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

