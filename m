Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D34E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 04:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQh5Cw5kMvST0Lk7StYFJXxl+3Yu9eJRgAXZ4c/sp8s=; b=LgE/HN8BFZOmMsvdZZG6GaHA/q
	AvmQK3+dD91+leNs5mccHkbe98frkbrx1ISFhdj4WW/1RrFR9gAnfFOMrJLoAZjHvrh94wNTbR8nf
	icC30yGKzhrhkaSJD5fyK/hN7Psx+C5LEjsg1csRPr+z07OxwbxUE3SuT1EPtyjuD2Jdsiqmu35sV
	EfnkS6Sw/IKRpcvh6NoaImpS47W3u9KU2RF/0f0kzD7vFPaeQXevmvgUMyIDDBP9cXf4hlsrer5fZ
	Q4TA5/SArXO3xdMagMg7XsZgRvBUr2kvlFrT/KqaNL1h9DJ0IyOrzjprd0F6AdypFKnsWRFE6Rs6S
	iiOsCLGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKVLe-00000006P6D-2Nz7;
	Mon, 09 Dec 2024 04:26:18 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKVKc-00000006Ozw-2Yl2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 04:25:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718314; x=1765254314;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C5FkjyJ7HvPJ4EqFDqUUuKw1p6YZrLqlh9u/z0GNe1w=;
  b=fIy+lnT+YLk9lu155wwLI5dGekZu78tYolriDxw4J2GmRR42Rzqa9QsJ
   Cqg2YH84+3Bc3c4gyXRCYSTrKPh8or82EJ2+r426H/URLxES3SDCbhbkv
   MKiVvdSvgdi6HmokSFDdb/02addXhC4CHnQ8xc/+7bgZnuF88wYCn4gdS
   /xgdl+mid0S2CmbImgxUXeCAhx7NaofsS8kdKgVD9xzyorIimS+7FSKUq
   HGCWM8OSNzOp2x8ezlEizdsypA38CIWy/GF6gCN5YMEir0eDo1RUXx9eq
   tWoRR2RtbSQzYGzjfNqSavWHol2cc38jkS757yDZh9EYx+rf5p7On9lYE
   g==;
X-CSE-ConnectionGUID: 2zX7LKh8Q8anG7jHoZLvJg==
X-CSE-MsgGUID: BeMPl1ovTaiawaUiWMJVrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="37930661"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="37930661"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:25:13 -0800
X-CSE-ConnectionGUID: jE5zo29IQtml4GznslC54w==
X-CSE-MsgGUID: DyfkoiC7QNaJ65/snZBYdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95751011"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Dec 2024 20:25:10 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVKV-0003qb-1R;
	Mon, 09 Dec 2024 04:25:07 +0000
Date: Mon, 9 Dec 2024 12:23:59 +0800
From: kernel test robot <lkp@intel.com>
To: Umer Uddin <umer.uddin@mentallysanemainliners.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org
Subject: Re: [PATCH v6 4/4] arm64: dts: exynos: Add initial support for
 Samsung Galaxy S20 (x1slte)
Message-ID: <202412072223.jniPKsyn-lkp@intel.com>
References: <20241206184609.2437-5-umer.uddin@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206184609.2437-5-umer.uddin@mentallysanemainliners.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_202514_662361_451FE69C 
X-CRM114-Status: GOOD (  11.51  )
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

Hi Umer,

kernel test robot noticed the following build errors:

[auto build test ERROR on krzk/for-next]
[also build test ERROR on next-20241206]
[cannot apply to krzk-dt/for-next pinctrl-samsung/for-next krzk-mem-ctrl/for-next linus/master v6.13-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Umer-Uddin/dt-bindings-arm-samsung-samsung-boards-Add-bindings-for-SM-G981B-and-SM-G980F-board/20241207-024917
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20241206184609.2437-5-umer.uddin%40mentallysanemainliners.org
patch subject: [PATCH v6 4/4] arm64: dts: exynos: Add initial support for Samsung Galaxy S20 (x1slte)
config: arm64-randconfig-003-20241207 (https://download.01.org/0day-ci/archive/20241207/202412072223.jniPKsyn-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412072223.jniPKsyn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412072223.jniPKsyn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dts:9:10: fatal error: 'exynos990-hubble-common.dtsi' file not found
       9 | #include "exynos990-hubble-common.dtsi"
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +9 arch/arm64/boot/dts/exynos/exynos990-x1slte.dts

   > 9	#include "exynos990-hubble-common.dtsi"
    10	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

