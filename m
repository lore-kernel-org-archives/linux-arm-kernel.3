Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CB3E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 18:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nry6ZD5jx+IVUpy3t9HOyMzdyhtsHXVO0xqZKhrSmSQ=; b=IeZNKST3jWtJoPKJ3lW5eLdy+l
	8DCUZOswaJQIceY59rSoi2brZBcgDmQmsiGGWcjYAdQBatBRjkSRj99Ohnihz3p8JtB6erQ0sH6nF
	EQK7UvoS4aEAm6doixaX3hdNVIkebniwvf8XOIv+l2zKk6RvH7zzKtmvLc2CUnGr8ntBDGQISWxbJ
	QItl694pzW39WBFDRkCfma9eHMu96WVjmffOSG+hNZKTAaQeNTTbHeHMuJ3/r4hytpHmzj2hh3/yT
	7Rbezlpk1C0vDbBZNWlsKVkaUOgWCQCpZFlJhrbuBGTUpOpaJRqCnzXdd0rlu3udqWk9TpBbmOyea
	LOnIgX7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUUxL-0000000HESw-198E;
	Sun, 05 Jan 2025 18:02:31 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUUw9-0000000HELu-2F2f;
	Sun, 05 Jan 2025 18:01:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736100078; x=1767636078;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cspNj5F8aDJyAAQ4b/34Sfk3+U9AtmMxeKqzn6Bn/sg=;
  b=GupHcCAdL2HwNSIbNiZycCsG0QIl8LeyqpvTsVPPtG2qnUencOMXiW2K
   YFjx/9TWiHPoKx0ERkYI+QYsjha+vUXGmRYSCgwpyjilfn0FnNy5EjW9m
   qZ/dC2y+uFLsbg20lwHTP8zu/wzDFS/XCSMXqjrEGBtO6A5lMpVSyJAbV
   rRLuPxbv+5gIkMPZii+FgtbIfq80LCr6tbV9lSLKY/nLR0NCXLzkP36sl
   cSJpCCD3w7M7uVjessJ0P4kdJF3qsIUxNQnZl81omLtCvC6q5vrWDBE9p
   JnLJdH0XhJeHwpxNk0CVDq/u7kpdEmoos2HsdRJYm6aiKAGGvih9wFo6z
   g==;
X-CSE-ConnectionGUID: pH3FUh5xQSSuqnxtfY70hA==
X-CSE-MsgGUID: N9YoIjNFTsyFhzhLVSUNkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="36414375"
X-IronPort-AV: E=Sophos;i="6.12,291,1728975600"; 
   d="scan'208";a="36414375"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 10:01:11 -0800
X-CSE-ConnectionGUID: GDMyISq1QWqYzeHEk2plfQ==
X-CSE-MsgGUID: 3KYqPRWERYqSP0EY+2XogA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,291,1728975600"; 
   d="scan'208";a="133085080"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Jan 2025 10:01:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUUvw-000Btv-2D;
	Sun, 05 Jan 2025 18:01:04 +0000
Date: Mon, 6 Jan 2025 02:00:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jian Hu <jian.hu@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	robh+dt <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Jian Hu <jian.hu@amlogic.com>,
	devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-amlogic <linux-amlogic@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 5/5] clk: meson: t7: add t7 clock peripherals controller
 driver
Message-ID: <202501060104.R3FJGgmC-lkp@intel.com>
References: <20241231060047.2298871-6-jian.hu@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241231060047.2298871-6-jian.hu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_100117_671887_6D8F8D4D 
X-CRM114-Status: GOOD (  11.29  )
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

Hi Jian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jian-Hu/dt-bindings-clock-add-Amlogic-T7-PLL-clock-controller/20241231-141835
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20241231060047.2298871-6-jian.hu%40amlogic.com
patch subject: [PATCH 5/5] clk: meson: t7: add t7 clock peripherals controller driver
config: arm64-randconfig-r112-20250105 (https://download.01.org/0day-ci/archive/20250106/202501060104.R3FJGgmC-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce: (https://download.01.org/0day-ci/archive/20250106/202501060104.R3FJGgmC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501060104.R3FJGgmC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/meson/t7-peripherals.c:1276:26: sparse: sparse: Initializer entry defined twice
   drivers/clk/meson/t7-peripherals.c:1277:26: sparse:   also defined here

vim +1276 drivers/clk/meson/t7-peripherals.c

  1262	
  1263	 static u32 eth_rmii_table[] = { 0, 7 };
  1264	
  1265	static struct clk_regmap eth_rmii_sel = {
  1266		.data = &(struct clk_regmap_mux_data) {
  1267			.offset = CLKCTRL_ETH_CLK_CTRL,
  1268			.mask = 0x3,
  1269			.shift = 9,
  1270			.table = eth_rmii_table
  1271		},
  1272		.hw.init = &(struct clk_init_data){
  1273			.name = "eth_rmii_sel",
  1274			.ops = &clk_regmap_mux_ops,
  1275			.parent_data = &(const struct clk_parent_data) {
> 1276				.fw_name = "fdiv2",
  1277				.fw_name = "rmii_pad"
  1278			},
  1279			.num_parents = 2
  1280		},
  1281	};
  1282	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

