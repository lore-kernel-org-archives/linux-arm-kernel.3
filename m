Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3552FCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 12:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oeq3Tkb9dfp2ojcvlPDjFG08YFVIhXdY2L3p1I6fQEs=; b=cuyOMZClLBCFbsLkQvBfEU2VF8
	XxivF9giX8oG4lQKZU1w+Z5B6HfOPqx152/c5cqe+46hcQr0kQQHd386OP4xABaigAxPax2HmhTCp
	2aGM7qq2CJBQ61+U9TIrHrlJ4JaZ4qZHXS7EBd+qdcSf/YAFmQcN94GVr1NjwdgJHOiMx4Nz0DViZ
	3XpFWUlTn38kpVdg2AyE65ZZaWSOTRrJIg94WmwxX/I0yy5HI6irkOciExm6+ayDLizPieAkq94np
	kjG+Ajk7+9ypy7MpjUn/WWkC1MBw/lWu0AvMhvOSZX8vSe2Lyz5cPo9EUG7FvliWksImH/+3zVjWP
	KD5IUtmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBuQ-0000000H3Sl-2rRN;
	Tue, 21 Oct 2025 12:56:14 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBuO-0000000H3SF-1jha
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 12:56:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761051372; x=1792587372;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+CO+/an1hiocjSGMGzZYAKHx4UcThwwf4NGM2r5oRxc=;
  b=dknEBuXb9BI+MR6Aq+eAQcIITck4ifvh6rK1HR0aE/XLqmXlOcpNG3Y9
   O/suK9tFwZWJL1pRQ+V0ytztJJd1huB5U7HV7NwUPMx1BtpOhqZzDTdoJ
   XWZLf+d0ZPqYmiF5Tyzgq68STCHwD4N5YAg6eLJeErtLRY5TkEO3PCNBP
   vqTYszY+QEqErD1VYSUw2xTt2T6euzmUhA+yo6hNyfFDFG3dThNZUiMVM
   ZkaNYDDnX0qVV73K30K3IwDNLCSxZnG2Nm2pfmFdhXpOQtV2cxZyJjuoZ
   ZhL+JvLYMhS29BmeV6cTY3vnHDczrZl1QuMGpPswyMg6mL7O5iQoKLKDj
   w==;
X-CSE-ConnectionGUID: dA2i8UibS+uvvJCud4uSjw==
X-CSE-MsgGUID: ALPFbyS0T/qSZcG7YDUzPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74516877"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="74516877"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 05:56:12 -0700
X-CSE-ConnectionGUID: BxovcXqjQZemzDJ3BcibFQ==
X-CSE-MsgGUID: qYr8i8VcSOqS+siN1Hg8+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="183443263"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 21 Oct 2025 05:56:08 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBBuI-000App-0T;
	Tue, 21 Oct 2025 12:56:06 +0000
Date: Tue, 21 Oct 2025 20:55:47 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Mark Brown <broonie@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-sunxi@lists.linux.dev,
	linux-sound@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/11] ASoC: sun4i-spdif: Support SPDIF output on A523
 family
Message-ID: <202510212039.XiolKgXp-lkp@intel.com>
References: <20251020171059.2786070-5-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020171059.2786070-5-wens@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_055612_663637_24B049EA 
X-CRM114-Status: GOOD (  12.80  )
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

Hi Chen-Yu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sunxi/sunxi/for-next]
[also build test WARNING on broonie-sound/for-next vkoul-dmaengine/next linus/master v6.18-rc2 next-20251021]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/dt-bindings-dma-allwinner-sun50i-a64-dma-Add-compatibles-for-A523/20251021-011340
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
patch link:    https://lore.kernel.org/r/20251020171059.2786070-5-wens%40kernel.org
patch subject: [PATCH 04/11] ASoC: sun4i-spdif: Support SPDIF output on A523 family
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20251021/202510212039.XiolKgXp-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510212039.XiolKgXp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510212039.XiolKgXp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: sound/soc/sunxi/sun4i-spdif.c:180 struct member 'mclk_multiplier' not described in 'sun4i_spdif_quirks'
>> Warning: sound/soc/sunxi/sun4i-spdif.c:180 struct member 'tx_clk_name' not described in 'sun4i_spdif_quirks'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

