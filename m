Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B153C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 06:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8NO5ZGZ5Iq2VTCvccuZFUmGSmFQkNEgoLMOvRvdBEac=; b=udao5EWQg6AyZummGEQoIfJf6r
	4QAlGL/cfM1XRKabG/rlSS6A90mQLKU8vwnbLRDjBe79zGWoIg+3PZyXOiiUYzDscwdJCsFmPzJ9F
	mbNBnzvO3y9YXVPauouPv0sR5ASmHVnbuv3+T4OXPXZktOqdwo/ADzwIR1kqnrCZXmSP33rUA/uX2
	1/e8Qz8gezb0AC+n7srk32FFaGTvwLnqcr8Drer5NlCGKRvD93S4As5Lgzee7hbtRhqPS4s/wN5JJ
	m1yuS/xBGXfs9UzD4cDiHgaANF8Um5H2Ni21d+wqoR1ziqaQct+3VwNPLI4ZaBS8OBrjRaIojlgpq
	Yy1sn2eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTxXX-00000004oFl-2Pj6;
	Tue, 24 Jun 2025 06:53:55 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTxLl-00000004mcb-3ID2;
	Tue, 24 Jun 2025 06:41:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750747306; x=1782283306;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XbgEhC+fI0zEai/znLDBDx3WSxt18trUioMURpeGfM4=;
  b=ii7QynolNuKhDaq751MX3IMMf1BE59dX/FXGyqa0QugxD51V5BqygUKR
   LW7Hv0KRhP8FqFvcryzEuxUOYEWvWjshfFA5lN0zqGFBVmivxz1n2Ayez
   3eNqfXXjIQL/LtF13Kdv1bASfLUQcdcpxsgKiLO2sLX4Y7jlJ/qUgjigN
   79xY1MT7ueBud+ORNOqmoVww8kqzg9kkNCppAYt30qZDSjWFUb42u5YD6
   A/PGOXCayDv+0PX+4ISTnVqHwNLLBLuQU6gkSuNQwZNAvFbgIgAfN0Gvq
   2P0SUS0nRPKnaL/N8hZ4FzrGK3gwstnUHp/AtVqxrTJmePqfbyRliOJ/V
   A==;
X-CSE-ConnectionGUID: oEh0GsjWSr6gQQOzUpTJHw==
X-CSE-MsgGUID: 4HyRfT6QQyGq6ZxAyfXYeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="53107552"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="53107552"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 23:41:46 -0700
X-CSE-ConnectionGUID: FaRihE0RS/ChSZqkWDGsLA==
X-CSE-MsgGUID: AMgtjDzgTkKJg1vnnqz3dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="157599303"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Jun 2025 23:41:41 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTxLe-000Roo-1k;
	Tue, 24 Jun 2025 06:41:38 +0000
Date: Tue, 24 Jun 2025 14:40:55 +0800
From: kernel test robot <lkp@intel.com>
To: Laura Nao <laura.nao@collabora.com>, mturquette@baylibre.com,
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de,
	richardcochran@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, guangjie.song@mediatek.com,
	wenst@chromium.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	kernel@collabora.com, Laura Nao <laura.nao@collabora.com>
Subject: Re: [PATCH 24/30] clk: mediatek: Add MT8196 disp-ao clock support
Message-ID: <202506241439.PGytyi4q-lkp@intel.com>
References: <20250623102940.214269-25-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623102940.214269-25-laura.nao@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_234145_896618_267F89FB 
X-CRM114-Status: GOOD (  12.16  )
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

Hi Laura,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v6.16-rc3 next-20250623]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Laura-Nao/clk-mediatek-clk-pll-Add-set-clr-regs-for-shared-PLL-enable-control/20250623-184204
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20250623102940.214269-25-laura.nao%40collabora.com
patch subject: [PATCH 24/30] clk: mediatek: Add MT8196 disp-ao clock support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250624/202506241439.PGytyi4q-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506241439.PGytyi4q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506241439.PGytyi4q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/mediatek/clk-mt8196-vdisp_ao.c:62:34: warning: 'of_match_clk_mt8196_vdisp_ao' defined but not used [-Wunused-const-variable=]
      62 | static const struct of_device_id of_match_clk_mt8196_vdisp_ao[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/of_match_clk_mt8196_vdisp_ao +62 drivers/clk/mediatek/clk-mt8196-vdisp_ao.c

    61	
  > 62	static const struct of_device_id of_match_clk_mt8196_vdisp_ao[] = {
    63		{ .compatible = "mediatek,mt8196-vdisp-ao", .data = &mm_v_mcd },
    64		{ /* sentinel */ }
    65	};
    66	MODULE_DEVICE_TABLE(of, of_match_clk_mt8196_vdisp_ao);
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

