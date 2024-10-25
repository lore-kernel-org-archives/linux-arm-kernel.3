Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A257CD0C61D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 15:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LsiMzfxRZfyTi6Y0SIIrYfzAD2Tk6w8IPazQnWYpXDU=; b=gOOdkoJFWxfS70GbJlhCcw7aYB
	yQcqLxgk6YN91IKMUs+h+bML4p9wavaWqoTlOuObDXoYwjGpvjrqE0zydZmF1o8ZV7hp3qGzaNOIR
	+4q19DoI1xdpC2Zo1on4+dbWp4VI3CAAYGnY/RCmcRDIz/ANxhHymeTtVKfSpb31koarpydxSRyRd
	3eQVcRXKIOjBvIbgfhwWTfTEEK4PcWfxq6dJTreTIg62yBXoRV1kGei6AxOAHqdnOeFAReWoS/AuJ
	tbP7Sz7hX4kKFi7gQRFCUjeezuEMfmI4ryUYUO5H6vjfdBtSe40qrVIJJrTJl9Q46QNznxmKzBs1I
	ONi6v0UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Ltx-000000049He-0QHY;
	Fri, 25 Oct 2024 15:06:57 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LRD-000000042ga-2mWg;
	Fri, 25 Oct 2024 14:37:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729867036; x=1761403036;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wBK4Q5W4WJLNTzG1NF53EifkW/90VdiVn34zzoNQPnk=;
  b=Dg343Y6euu8mjixSyTgQTSyUsqCSeTHPn/7jlX63pc/O3qlqfI70HGPq
   czfZkBlrkApL1mc5mrXmFiJWtHBjPhgl9cQ3wgym8Icf+6pubNvvK4SKC
   EMoZg4hD44bWnrYDMB4k1zxtZbJXSSJgFSe/nBTHKkfAw+Noq34NeroRd
   FYVay/CC2ZgZURxSY93GfemsQla2ravVhE1WNFZ8ad/ZG3ecNSPzKD4il
   afWm4ia89sgl1X+yro7of0mfWgU/4b+fm+rqwWUE3IbsArhS5KJCTcDnn
   lhYFVIyZGhrvSlucRcJExUh8WHrIgLiNPGV8sPQosTUPdTPH15GPq2zYi
   w==;
X-CSE-ConnectionGUID: GUhbVEfERxyyye6lV2izow==
X-CSE-MsgGUID: HkPMXGwvQMOF/V+P+2bR4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="47021769"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="47021769"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 07:37:15 -0700
X-CSE-ConnectionGUID: bCV38PoTTeCmNINXGqmYRA==
X-CSE-MsgGUID: j5RovBWzSgW+deRdUluG6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="85699443"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Oct 2024 07:37:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4LR4-000YMs-0J;
	Fri, 25 Oct 2024 14:37:06 +0000
Date: Fri, 25 Oct 2024 22:36:15 +0800
From: kernel test robot <lkp@intel.com>
To: Inochi Amaoto <inochiama@gmail.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 4/4] net: stmmac: Add glue layer for Sophgo SG2044 SoC
Message-ID: <202410252215.79396yyg-lkp@intel.com>
References: <20241025011000.244350-5-inochiama@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025011000.244350-5-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_073715_748513_B39BF16E 
X-CRM114-Status: GOOD (  14.76  )
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

Hi Inochi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on sophgo/for-next sophgo/fixes net-next/main net/main linus/master v6.12-rc4 next-20241025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Inochi-Amaoto/dt-bindings-net-snps-dwmac-Add-dwmac-5-30a-version/20241025-091315
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241025011000.244350-5-inochiama%40gmail.com
patch subject: [PATCH v2 4/4] net: stmmac: Add glue layer for Sophgo SG2044 SoC
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20241025/202410252215.79396yyg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410252215.79396yyg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410252215.79396yyg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c: In function 'sophgo_dwmac_fix_mac_speed':
   drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c:30:16: error: implicit declaration of function 'rgmii_clock' [-Werror=implicit-function-declaration]
      30 |         rate = rgmii_clock(speed);
         |                ^~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c: In function 'sophgo_sg2044_dwmac_init':
   drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c:46:13: warning: unused variable 'ret' [-Wunused-variable]
      46 |         int ret;
         |             ^~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c: In function 'sophgo_dwmac_fix_mac_speed':
>> drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c:31:12: warning: 'ret' is used uninitialized [-Wuninitialized]
      31 |         if (ret < 0) {
         |            ^
   drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c:28:13: note: 'ret' was declared here
      28 |         int ret;
         |             ^~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=n] || GCC_PLUGINS [=y]) && MODULES [=y]
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +/ret +31 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c

    23	
    24	static void sophgo_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
    25	{
    26		struct sophgo_dwmac *dwmac = priv;
    27		long rate;
    28		int ret;
    29	
    30		rate = rgmii_clock(speed);
  > 31		if (ret < 0) {
    32			dev_err(dwmac->dev, "invalid speed %u\n", speed);
    33			return;
    34		}
    35	
    36		ret = clk_set_rate(dwmac->clk_tx, rate);
    37		if (ret)
    38			dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
    39	}
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

