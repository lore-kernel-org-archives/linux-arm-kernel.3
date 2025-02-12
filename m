Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7639C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 09:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f0q5ByYJHjIS50jAqmBRdmKL6LqId5dn8H8S6Ww7BZM=; b=DtLX+d9KzftdCec6NGOzid2xDA
	BjowaVsfxe/LrENCS01cpMouIAtGkwzJhVWfP6tRuZqCU608bOoLm+tz5+HAQtNvOC5BudSmzyZqa
	m5xXu464ahWp+nIvzyce9AF/H5d6HfDj8E3zHU78Y0cCzkCNpUZclOVxCqpbDOQ1+pCc5SRyxSNyz
	76tAojQuC6O8Mx9CNjOkC5ZvcW7v1JEQrIpeREPgaAU/2k9eBS62ibqt4wKrqw6bpywX9Rnb9x5Od
	hxMhn5nQHPwZxQlDxDPa5Mw/MoBajKss6mbvaE8jKTtB6gEsumkPg7ISXnAdZm3qQYbJAd58f/SP1
	/wpR68iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti8hF-00000006izo-3x73;
	Wed, 12 Feb 2025 09:06:17 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti8Yn-00000006hA2-2Am4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 08:57:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739350654; x=1770886654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vX6/CDrLsi+PiLy4kwaL8vsmQecJaGwqitg7vNz+psg=;
  b=RiZjoGPbeHA4adRY+t71J8ZREbTeuJq+vo3OgvtiulukZkvgeiiagDmW
   qYmgDomwWxR+A/OcDl5GixJZAVZSqpjDK5LlQf9VAsFdd0QPvb5fVm107
   QhIT8i+zrrip41z0EBlOSQ72EoiojRAjjLVqf3x5SgmpH0G/+SnDlJj08
   qL/tSk4Vi3Ht2Zn3NilzNuL05Z4j1dygderbwnRWKWjzcBC2Bjddnc10P
   OsAHlbrkH6xQoWB72TIFXpR5FVUSJmX9yX/KaWQrRdYjQyad5BOY6tmq2
   pFKo67WH4Qy0AiAwG+JgT1fEGsbA2o+Hs3eqL+v+MqNDU8vft2GFHEpoM
   g==;
X-CSE-ConnectionGUID: gCWUylztRwqIIrLD7ZjNHQ==
X-CSE-MsgGUID: K0N6QPbEQgGjP+tHD2Rbog==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="50630748"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="50630748"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 00:57:33 -0800
X-CSE-ConnectionGUID: dLQFfP+/S8+lS5adRI8UFQ==
X-CSE-MsgGUID: gpKNy4SXS6Kp2XEwreVocg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="117778390"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Feb 2025 00:57:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti8Yg-0015P7-1H;
	Wed, 12 Feb 2025 08:57:26 +0000
Date: Wed, 12 Feb 2025 16:57:10 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
	linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 3/3] clk: aspeed: add AST2700 clock driver
Message-ID: <202502121624.f9xpltGE-lkp@intel.com>
References: <20250210085004.1898895-4-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210085004.1898895-4-ryan_chen@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_005733_569297_11C44217 
X-CRM114-Status: GOOD (  13.91  )
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

Hi Ryan,

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on pza/reset/next linus/master v6.14-rc2]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-binding-clock-ast2700-modify-soc0-1-clock-define/20250210-165421
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20250210085004.1898895-4-ryan_chen%40aspeedtech.com
patch subject: [PATCH v8 3/3] clk: aspeed: add AST2700 clock driver
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20250212/202502121624.f9xpltGE-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502121624.f9xpltGE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502121624.f9xpltGE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/big_endian.h:14,
                    from include/linux/byteorder/big_endian.h:5,
                    from arch/m68k/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/m68k/include/asm/bitops.h:566,
                    from include/linux/bitops.h:68,
                    from include/linux/of.h:15,
                    from include/linux/clk-provider.h:9,
                    from drivers/clk/clk-ast2700.c:7:
   drivers/clk/clk-ast2700.c: In function 'ast2700_soc1_configure_i3c_clk':
>> drivers/clk/clk-ast2700.c:981:32: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     981 |                                FIELD_PREP(SCU1_CLK_I3C_DIV_MASK,
         |                                ^~~~~~~~~~
   include/uapi/linux/swab.h:118:38: note: in definition of macro '__swab32'
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |                                      ^
   include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^~~~~~~~~~~~~
   arch/m68k/include/asm/io_mm.h:373:26: note: in expansion of macro 'out_le32'
     373 | #define writel(val,addr) out_le32((addr),(val))
         |                          ^~~~~~~~
   drivers/clk/clk-ast2700.c:979:17: note: in expansion of macro 'writel'
     979 |                 writel((readl(clk_ctrl->base + SCU1_CLK_SEL2) &
         |                 ^~~~~~
   drivers/clk/clk-ast2700.c: At top level:
   drivers/clk/clk-ast2700.c:369:37: warning: 'd_clk_sels' defined but not used [-Wunused-const-variable=]
     369 | static const struct clk_parent_data d_clk_sels[] = {
         |                                     ^~~~~~~~~~
   drivers/clk/clk-ast2700.c:353:37: warning: 'soc1_ahb' defined but not used [-Wunused-const-variable=]
     353 | static const struct clk_parent_data soc1_ahb[] = {
         |                                     ^~~~~~~~
   drivers/clk/clk-ast2700.c:349:37: warning: 'uart16clk' defined but not used [-Wunused-const-variable=]
     349 | static const struct clk_parent_data uart16clk[] = {
         |                                     ^~~~~~~~~
   drivers/clk/clk-ast2700.c:345:37: warning: 'uart15clk' defined but not used [-Wunused-const-variable=]
     345 | static const struct clk_parent_data uart15clk[] = {
         |                                     ^~~~~~~~~
   drivers/clk/clk-ast2700.c:341:37: warning: 'uart14clk' defined but not used [-Wunused-const-variable=]
     341 | static const struct clk_parent_data uart14clk[] = {
         |                                     ^~~~~~~~~
   drivers/clk/clk-ast2700.c:337:37: warning: 'uart13clk' defined but not used [-Wunused-const-variable=]
     337 | static const struct clk_parent_data uart13clk[] = {
         |                                     ^~~~~~~~~
   drivers/clk/clk-ast2700.c:237:37: warning: 'soc0_ahb' defined but not used [-Wunused-const-variable=]
     237 | static const struct clk_parent_data soc0_ahb[] = {
         |                                     ^~~~~~~~
   drivers/clk/clk-ast2700.c:209:37: warning: 'soc0_mpll_div8' defined but not used [-Wunused-const-variable=]
     209 | static const struct clk_parent_data soc0_mpll_div8[] = {
         |                                     ^~~~~~~~~~~~~~


vim +/FIELD_PREP +981 drivers/clk/clk-ast2700.c

   974	
   975	static void ast2700_soc1_configure_i3c_clk(struct ast2700_clk_ctrl *clk_ctrl)
   976	{
   977		if (readl(clk_ctrl->base + SCU1_REVISION_ID) & REVISION_ID)
   978			/* I3C 250MHz = HPLL/4 */
   979			writel((readl(clk_ctrl->base + SCU1_CLK_SEL2) &
   980				~SCU1_CLK_I3C_DIV_MASK) |
 > 981				       FIELD_PREP(SCU1_CLK_I3C_DIV_MASK,
   982						  SCU1_CLK_I3C_DIV(4)),
   983			       clk_ctrl->base + SCU1_CLK_SEL2);
   984	}
   985	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

