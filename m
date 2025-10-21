Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4220CCD1AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 21:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w40MTnhd+zIQq64gc5YjueWL15befRzskaQDsFJAxHY=; b=HBsVB99D/766aNlw+PW48mGNgF
	6+1OX0erSsZf+6GpIGi1n/pl8bIM+FshenD61of5KTJ3uUU6JObWO7rkjsixyQpQh55oFYYJnFWK2
	K19X20eF7J+vRQxoeKAoUriLemoQfvXVc7zbKGI0NzvZSgkhweAVslJ3MhyJLlJ0Lk5b46M23jYZd
	W4MDNaOwD1j2CTPjzJponXxrqSio/A36IQL1Td0PlAPR5iAORmown7rO3zxR7b6LDtdijJtZvZc1X
	YeFo1tNlYqbcaVYeHFMIR3ZVxzjS715eGKYxFYGHcHZz5RBNcpvddgxkU3mpCn2rjASgzVQXbUn2V
	CzP6IAbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBJgq-00000000hP0-2HDL;
	Tue, 21 Oct 2025 21:14:44 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBJgm-00000000hO5-1squ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 21:14:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761081281; x=1792617281;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YQidWeBQThI4lFjuPpKQQPtrlVPDUTen2IXLFencNZg=;
  b=BaR7OxGXHHT/mVpNv2Y6U7cCO/dPAjk3r001s6swgow+40dalA++6tsl
   R0g2lv/uNRVnVAznmgsGTDU5vZM/UcgGm0GXbgjnJ33WvWmDoMUzx7hIQ
   rKhR0gfVhyw5dRWhUB48AgqBwkXVQTqViB1/wsPe3aysSY+2KjWSY3ptV
   aOhTg0AYzztcQ/r5YeTf4AXzpIQrC19PnkBoI6QOt0XCtR7P535XV8NNL
   znVzIwQTgau3E49SvoMeHXEshkAy2Eew22waCCcbV+s7P+DPPCiqMVy24
   5uFLRQEwyNCJkjeV89NUZnvTkkp84xYtk1VhGM+0o9kFIF/bjyc4hfoCh
   g==;
X-CSE-ConnectionGUID: ypBG0clYQ5u9/P8R6Uv30w==
X-CSE-MsgGUID: 8eFSh1g/RE6JZBIhdHhyjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="65836028"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="65836028"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 14:14:40 -0700
X-CSE-ConnectionGUID: GNdgFLJ0Ta2cVivOZcsn6A==
X-CSE-MsgGUID: N2vP9ISWSX2pfQevM9jjTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="187959834"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 21 Oct 2025 14:14:35 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBJgf-000Bm5-1n;
	Tue, 21 Oct 2025 21:14:33 +0000
Date: Wed, 22 Oct 2025 05:14:13 +0800
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
Subject: Re: [PATCH 11/11] [EXAMPLE] arm64: dts: allwinner: a527-cubie-a5e:
 Enable I2S and SPDIF output
Message-ID: <202510220453.UbrhVlRH-lkp@intel.com>
References: <20251020171059.2786070-12-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020171059.2786070-12-wens@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_141440_501110_0C08F5C8 
X-CRM114-Status: GOOD (  12.05  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on sunxi/sunxi/for-next]
[also build test ERROR on broonie-sound/for-next vkoul-dmaengine/next linus/master v6.18-rc2 next-20251021]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/dt-bindings-dma-allwinner-sun50i-a64-dma-Add-compatibles-for-A523/20251021-011340
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
patch link:    https://lore.kernel.org/r/20251020171059.2786070-12-wens%40kernel.org
patch subject: [PATCH 11/11] [EXAMPLE] arm64: dts: allwinner: a527-cubie-a5e: Enable I2S and SPDIF output
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251022/202510220453.UbrhVlRH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510220453.UbrhVlRH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510220453.UbrhVlRH-lkp@intel.com/

All errors (new ones prefixed by >>):

   also defined at arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts:393.8-397.3
>> ERROR: Input tree has errors, aborting (use -f to force output)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

