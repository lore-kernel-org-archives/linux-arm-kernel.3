Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F805C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 01:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z/uVpQ7PLCRSxcig0My3AaP+Q3ZbgcGzY9VErjsdtEE=; b=OWT/azeCqj2eRybObC+JUnrWez
	+Q1BgJKy4doVJsiNoV/HKJZXQGtRv3Z8IiOsPlf+FoLVCxESxbAAD1/VjwZE9cfwbN97Bn4UAo4t3
	NZLOl6Wi8KZnpIYfGDQ7rRXb6HinnUUJW0OZMQx3wyI53oEBokPs88REfcyB8Ft0IVYPxV1aO/rF9
	8692wBQix7/RDJahjKy+c4XoC7HmX35oN9z0K/Xo6nbFaF2fXK5dFLUBiys/oqjiQ67zRbYB6tDVY
	SYgiFopCWzXeY33phv5IC2q1rJjBRg1uieNz1S51VXQqylt0lmkBWKAuJ5iNBuQZE0SL7yn3geFTx
	tKf7OROw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUEly-00000007FI2-0SFj;
	Wed, 25 Jun 2025 01:17:58 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUEjf-00000007F2p-3aDO;
	Wed, 25 Jun 2025 01:15:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750814136; x=1782350136;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kS3ORGHMAm1WSArCy9GZIu9x7Ni3+9c8myn5vEq4Uaw=;
  b=LO5T5lPQV36qnSHrl70rNUE2C3zkVzUn+sO5rYes5EWJHda/RTo+vCHr
   cR0BKEcSjoGqm/oi1wPKjO2j28br5eTgieX9SGWO5KDTV7mWPuOD2A8Ta
   t4x9hTIKVFDcf/BpOOk7+mkFggbo/3dgDtAvqxv4FZW4+QqIABNXFAkg5
   319s2ubimR0xP7U+ymBMgu3dTSFbsTi9x50YpC2Giq25WAKgF7uNurf7v
   oZgMGmWa+gyoXD5BbhzEH9v1FmwQKtrkdvOkCBu/l6mD4y+5UYtqLYcSZ
   /HwPrXKwcGcAnmyu2ID2g6y0IyHiGhzUZfbE8aW10jikgdm5Dixanc7gd
   A==;
X-CSE-ConnectionGUID: EzaGs50eQPKwEsDFYNhD+g==
X-CSE-MsgGUID: 3L4bm2vXTz+GWPJ6g04rWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52186033"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="52186033"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 18:15:32 -0700
X-CSE-ConnectionGUID: K0CGdRIhRn2u+rZKk+0HDQ==
X-CSE-MsgGUID: uOrbc5G/QPGzRZU3elknYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="151816874"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Jun 2025 18:15:27 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUEjV-000SeM-12;
	Wed, 25 Jun 2025 01:15:25 +0000
Date: Wed, 25 Jun 2025 09:14:49 +0800
From: kernel test robot <lkp@intel.com>
To: Yao Zi <ziyao@disroot.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>, Jonas Karlman <jonas@kwiboo.se>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/6] arm64: dts: rockchip: Add naneng-combphy for
 RK3528
Message-ID: <202506250816.aR1dRh1e-lkp@intel.com>
References: <20250624033733.50197-7-ziyao@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624033733.50197-7-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_181535_916331_BA76A75A 
X-CRM114-Status: GOOD (  12.39  )
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

Hi Yao,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on rockchip/for-next linus/master v6.16-rc3 next-20250624]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yao-Zi/dt-bindings-soc-rockchip-Add-RK3528-pipe-phy-GRF-syscon/20250624-114238
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250624033733.50197-7-ziyao%40disroot.org
patch subject: [PATCH v4 6/6] arm64: dts: rockchip: Add naneng-combphy for RK3528
config: arm64-randconfig-001-20250624 (https://download.01.org/0day-ci/archive/20250625/202506250816.aR1dRh1e-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506250816.aR1dRh1e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506250816.aR1dRh1e-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/rockchip/rk3528.dtsi:952.28-29 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

