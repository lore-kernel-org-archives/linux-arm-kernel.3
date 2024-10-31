Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45ED4D767C8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 14:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0uE91EvADFs3gwphzm5NV4HUPWyqES8AFEI+rsFLeuQ=; b=HfwQiYLQucc+ve+6+dC6v1EghX
	tVEYkNFPGXraTZNiA0SlWM1XJaF4tNUSduLjGTwMKU2xGANAJTSDC6/UJhGZorn1nRY2qdmxLT8zI
	4QIgh8fr+GD34UqYYK7ox2jaiw/PflWNYojoKb2IfZ8Tm6oz5GNFVQswXd3+74bzCyGjEhqKptGav
	6oT9oY7q9kVqPDfuXfM7Az0GcZUFQH8P0jfa4iK/KMcat5M7qpko0SSnRLBsmS/tNbRjC0OidYVGI
	9Pl5NphenzvHPuN8/efLDpLQBai9oEKppe+9bL5CxsUI7AtgrsPgItqIyyUFcPS/EtWFvGfFw1m2Z
	gxvZiWjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6VwH-00000003m1f-48iP;
	Thu, 31 Oct 2024 14:14:17 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Vub-00000003lli-0lzc;
	Thu, 31 Oct 2024 14:12:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730383954; x=1761919954;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A3ycCJbTERSDiBEUqrjApoZ6yv8BBa5XIMOLrpaNGik=;
  b=jFfjndfMKBcaoyEZdHQgqkeLNvMp8sHFDpuzo5t2eFntA5bAMkvCYaOk
   6oBKjpdwd7jXPKGtQNARsYnNwLtA84vS09FlyM05V7ZigAbMysx3mPyDo
   W01NAoWccKHGfjUH+YXfK5QGggJpgg9NvTa4MbTDJyX9pN/1y8n1YqHxR
   4Y059WMJDUX/ajRHAb8/mIXTLnhHeY3R74AJeXLdkVAsInSUXnuBz/0GZ
   hh3If0AO1uG8hznDxEnd916YqP8tlq0fak4aIKHlzJZT/ULz5sWxYREvl
   yskV6B9xo0tbkSbBPxJpCohOVRF6Vcs/KCTarO7BPsDNF3K0g+a1wQaIo
   g==;
X-CSE-ConnectionGUID: j/2eGNKKRwCU+ZEOJ2gcDQ==
X-CSE-MsgGUID: oMxC+wHuSE6tQkCkPCzhww==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52679359"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52679359"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 07:12:32 -0700
X-CSE-ConnectionGUID: CkchJSSSRamoQEo9lN09jQ==
X-CSE-MsgGUID: OdlONHy/Q9mJuz9JbSaeHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="86560456"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 31 Oct 2024 07:12:25 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6VuR-000gH7-13;
	Thu, 31 Oct 2024 14:12:23 +0000
Date: Thu, 31 Oct 2024 22:12:18 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 07/12] clk: rp1: Add support for clocks provided by RP1
Message-ID: <202410312134.vf7iY2Sz-lkp@intel.com>
References: <c20e3d6d87c71691b149cdeeafc94009953346b2.1730123575.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c20e3d6d87c71691b149cdeeafc94009953346b2.1730123575.git.andrea.porta@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_071233_315523_AA094DB0 
X-CRM114-Status: GOOD (  12.85  )
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

Hi Andrea,

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus robh/for-next linus/master v6.12-rc5]
[cannot apply to next-20241031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrea-della-Porta/dt-bindings-clock-Add-RaspberryPi-RP1-clock-bindings/20241028-221122
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/c20e3d6d87c71691b149cdeeafc94009953346b2.1730123575.git.andrea.porta%40suse.com
patch subject: [PATCH v3 07/12] clk: rp1: Add support for clocks provided by RP1
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20241031/202410312134.vf7iY2Sz-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410312134.vf7iY2Sz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410312134.vf7iY2Sz-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clk/clk-rp1.c: In function 'rp1_pll_set_rate':
>> drivers/clk/clk-rp1.c:399:19: error: implicit declaration of function 'FIELD_PREP'; did you mean 'FIELD_SET'? [-Wimplicit-function-declaration]
     399 |         (_reg) |= FIELD_PREP(mask, (_val));     \
         |                   ^~~~~~~~~~
   drivers/clk/clk-rp1.c:621:9: note: in expansion of macro 'FIELD_SET'
     621 |         FIELD_SET(prim, PLL_PRIM_DIV1_MASK, prim_div1);
         |         ^~~~~~~~~


vim +399 drivers/clk/clk-rp1.c

   394	
   395	#define FIELD_SET(_reg, _mask, _val)		\
   396	do {						\
   397		u32 mask = (_mask);			\
   398		(_reg) &= ~mask;			\
 > 399		(_reg) |= FIELD_PREP(mask, (_val));	\
   400	} while (0)
   401	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

