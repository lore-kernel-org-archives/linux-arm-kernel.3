Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 292ABD41C06
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 12:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jxIKeVOKKznOiEAzo4EieHm79MDFj0Uu1MUXw8ICZPM=; b=ByC0Nx8i/n1TcsbQFcawQDS5uV
	4QwkWrOOzzfmayNR7PVRk1nIDxtEwlJF7SjrsysIAAJCu3xia4Emb2GXhALi5H8H7KKH3Wnt3xAGo
	vkRP6uiCeXxt30C2f45ZlyZMXTMUldN4d0xwBYSEH7zqGlnnydkD8frBWuAQ36dzGK72UZUXbqHOE
	WLoRjKF6ZLeVMH/lYv4F8MjFffG6u29Z6EPcnx+66cl5NFVD6BKY8hHtzssi1HiTXbWjT/CSZAQld
	gDjE/obVCTeaiflqYqU/dehWSwnpTUl/+aKAZZRtGJnwE9T9YIiIOM4LXQACe+tr3TfRYYqAsTcH4
	MCy6T3Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBCFf-00000006j2q-0NuH;
	Wed, 13 Nov 2024 12:13:39 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBC1g-00000006g6W-3D2W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 11:59:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731499153; x=1763035153;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S2yXI+RpE/4Z6IIWIoXWreQT7e9SUd1QZeV3E85aBM8=;
  b=MKymMy5EVEqpYpC+dCT4KWJ5GQM2SwaobrVXdbKUFjWBCz5BzSIjJOlu
   szQUsPdf4w4aCPRxTLNudNainTIo+ZYuMdzNOU37mw6ACOccah4cXP2wI
   TqvIeWwECCtBbcgEvLWzBGF7l93f8b4sOAKLZ+2WJrDAnxqT5heaAjhly
   syERIulG6w52UYkCpezgtoqs63OUeYfrvyUEtSBWvkUAtwKPyLotntx3X
   XiiXUbxnbWhTBMD4YnqDg+vel9Ra4RilRAFcBJRGWIFc1R848YbfDOXp6
   hjc019SE1NOlHhLx4ovM5QfZO32E12c0VyM4G0HrXG5RlZ+pthoqT8Nuj
   Q==;
X-CSE-ConnectionGUID: wkfhCCsIQumkhEoH26EWpA==
X-CSE-MsgGUID: iNe5EruUTpmloBxwGz2A+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="35314459"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="35314459"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 03:59:11 -0800
X-CSE-ConnectionGUID: mbuIIPKWTsC2Zo2OOWA+8Q==
X-CSE-MsgGUID: Drm0ljxqRt6tHanbqPmqGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="87842391"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Nov 2024 03:59:05 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBC1X-0000Kv-0X;
	Wed, 13 Nov 2024 11:59:03 +0000
Date: Wed, 13 Nov 2024 19:58:08 +0800
From: kernel test robot <lkp@intel.com>
To: Joey Lu <a0987203069@gmail.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, alexandre.torgue@foss.st.com,
	joabreu@synopsys.com, ychuang3@nuvoton.com, schung@nuvoton.com,
	yclu4@nuvoton.com, linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Joey Lu <a0987203069@gmail.com>
Subject: Re: [PATCH v2 3/3] net: stmmac: dwmac-nuvoton: Add dwmac support for
 MA35 family
Message-ID: <202411131946.ozq1D0f2-lkp@intel.com>
References: <20241113051857.12732-4-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113051857.12732-4-a0987203069@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_035912_845297_40F7FF18 
X-CRM114-Status: GOOD (  11.41  )
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

Hi Joey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on net-next/main net/main linus/master v6.12-rc7 next-20241113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joey-Lu/dt-bindings-net-nuvoton-Add-schema-for-MA35-family-GMAC/20241113-132300
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241113051857.12732-4-a0987203069%40gmail.com
patch subject: [PATCH v2 3/3] net: stmmac: dwmac-nuvoton: Add dwmac support for MA35 family
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241113/202411131946.ozq1D0f2-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411131946.ozq1D0f2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411131946.ozq1D0f2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c:20: warning: expecting prototype for dwmac(). Prototype was for PATHDLY_DEC() instead

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +20 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

    19	
  > 20	#define PATHDLY_DEC         134
    21	#define TXDLY_OFST          16
    22	#define TXDLY_MSK           GENMASK(19, 16)
    23	#define RXDLY_OFST          20
    24	#define RXDLY_MSK           GENMASK(23, 20)
    25	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

