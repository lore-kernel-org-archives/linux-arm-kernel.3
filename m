Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B705C7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Jun 2025 21:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJVZKSVaSOfixf0yBTWqJgolNGXGzJTY/oeqr1f6HN8=; b=yjhRseGEsSYJC2W16EEqa8GpxJ
	o2PY9B99juD8kYaPtsoaZpLZRv+wFFrzXhweeRxllgNvth0uI0SNsPlfL4KNa2KUzwh0YpQBW/S3n
	alCj/tIZ3Raa/nNkz2YFhEgLwNOIA2QPv2yJEuJIKB0xQrZhrlIZd3FlrZri9nx/cijXuihGNKsPD
	BOfxpxcwVxV8eI6rsHMWjg1HMeaR+8nth0wd4qxL0AH3f88ip72JLVc9a3QjkFIITNM8uNEvW6uJu
	qkJ/mTP3e6pA5OMzuKDXtdE4R7WlBn2MLr9eZBRJrzdmTch1pGnD+2pT5UqnvO6hTvmYHT4TzxBfy
	tXnRb88g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVz86-00000000k0w-3FiT;
	Sun, 29 Jun 2025 21:00:02 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVz5m-00000000jqj-3l04;
	Sun, 29 Jun 2025 20:57:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751230659; x=1782766659;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4sGclJ7JPmOXEyw1qCkUxmj9+SxiJpgXHWGQ3kI7L8E=;
  b=eygVsrlgeKdTWf9igBbSSHZ6wOYVEWN41p/4nSBCbMq6s2EOHxgtbSDQ
   pzBA0tKrvIQQx2LempI2nUQ64fybv+jxZBUBTLpSImbwzeuRRZwvtlIIr
   1L7ArfHCLo0gd0OyuW1qyf7ohXCF/V6xvoJE6oKGtVO0N9CaQDOQH+P87
   7U8mpt1m9VqMyGcqz/K/l8bLxPdyyLZ7wXi06Se5OGt/3J2zMXMlKkvDd
   zW5sT1ZH4UF7BkJgpjxKIQ2N/9nBe7hNpib5TUABtaIk5hKVKg6Hls+MS
   o4RMHxjcPPLtuQTMTBmf6Xhmejg68JfPGiYjdahN60FeX553wlWL2R/Xo
   g==;
X-CSE-ConnectionGUID: TgDDpHAKTHyXJvoCT9+GPw==
X-CSE-MsgGUID: jE1KQOW2QGWcG8de+GBPGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="76006850"
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="76006850"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 13:57:34 -0700
X-CSE-ConnectionGUID: yqedKzWcThKyEa84V8mKAQ==
X-CSE-MsgGUID: 2xMj3oDGTH6CIdlGLr8kEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="152780971"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Jun 2025 13:57:29 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVz5b-000YE2-1w;
	Sun, 29 Jun 2025 20:57:27 +0000
Date: Mon, 30 Jun 2025 04:56:37 +0800
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
Subject: Re: [PATCH v2 22/29] clk: mediatek: Add MT8196 mfg clock support
Message-ID: <202506300416.dbAiyBcI-lkp@intel.com>
References: <20250624143220.244549-23-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624143220.244549-23-laura.nao@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_135738_998474_CA44C16A 
X-CRM114-Status: GOOD (  13.15  )
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
[also build test WARNING on linus/master v6.16-rc3 next-20250627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Laura-Nao/clk-mediatek-clk-pll-Add-set-clr-regs-for-shared-PLL-enable-control/20250624-225217
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20250624143220.244549-23-laura.nao%40collabora.com
patch subject: [PATCH v2 22/29] clk: mediatek: Add MT8196 mfg clock support
config: arm64-randconfig-r053-20250629 (https://download.01.org/0day-ci/archive/20250630/202506300416.dbAiyBcI-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506300416.dbAiyBcI-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/clk/mediatek/clk-mt8196-mfg.c:143:3-8: No need to set .owner here. The core will do it.

vim +143 drivers/clk/mediatek/clk-mt8196-mfg.c

   137	
   138	static struct platform_driver clk_mt8196_mfg_drv = {
   139		.probe = clk_mt8196_mfg_probe,
   140		.remove = clk_mt8196_mfg_remove,
   141		.driver = {
   142			.name = "clk-mt8196-mfg",
 > 143			.owner = THIS_MODULE,
   144			.of_match_table = of_match_clk_mt8196_mfg,
   145		},
   146	};
   147	module_platform_driver(clk_mt8196_mfg_drv);
   148	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

