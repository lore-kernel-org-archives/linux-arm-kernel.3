Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A27C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 10:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8HCgT9xHt3G0yC7p+RFgF5wo4670dA9C/i7qia8sFGY=; b=MAE1DNl7DXwtlLQwpp8CWZ5sTs
	ztYn5BnVSfAzeWWrUCpuRPKdRNrxzcB+cQWHhwc/oVi0sQUU0Ymkmyr55moAd9YqAhh+50GvzRkrf
	DV/J0JPstFtwR7l1TrXSB1grXddeDv9G6QYQFCnVMaX/TTBhXN9KH5ytbEn7B0wdO08nIFejl5iut
	RMJvT1l6cCArDfDyLMIQQpa3d4XuhdVkAdRuRNslScn+qMomsCgHxMgI4Ukco3ZFHAgelaTsexfuy
	g8roUJqzQECzgSzhT+Bv6lB4ghjySPql6QNUoIAcTNcof9/RNBvtWxcr2cMNTXE5kFw01m8yd+oXv
	d34hkrfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uARGm-0000000FCd8-0ni1;
	Thu, 01 May 2025 10:35:56 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAREp-0000000FCS1-3meb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 10:33:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746095636; x=1777631636;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X6UR650SqjHCyahtjHRoHLJWzg+YRrp5P85X9aePAJY=;
  b=kms8sfDgY0ST4zr9ogTACs2uS9G6IzQLcTli6cCfplJRIz2CO9BEbRbs
   NeTHoOTkU1aVdXDwhZ6j8R277uDpYUOMEoylnkhxn1YtE7zBN5LsRsOyA
   f3WDLtlmIC1JEWXa1IusgkxCl4NMfjftRy9p2fn71Qwjqp+cnqG2lWFXD
   1QcKb+Yv/dEwN+lHwm5x1rqLeWrSnsJgI2wKSiq1q25CoAAyAHCVxau9K
   +5alCmhv+b+cTWsP0PQeJZ+VfjLb2mckUq/XXdhVnA79/WK/vvV6bx7jU
   CgNnFB5RZd5fGhn+ydt234nOvFKl31D58Iuog4wDMncgbERMHMDVVcf+p
   A==;
X-CSE-ConnectionGUID: 6rtEWqk0RaiZb6oFRtp65g==
X-CSE-MsgGUID: VNaON/Z1QK+9h1EK/SKrZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="70266722"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="70266722"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 03:33:52 -0700
X-CSE-ConnectionGUID: GFVwQs/WS9WyCnQPuxzS9A==
X-CSE-MsgGUID: 9/8z731hQXmpMAACsa26tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="134878633"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 01 May 2025 03:33:47 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAREe-00046b-2d;
	Thu, 01 May 2025 10:33:44 +0000
Date: Thu, 1 May 2025 18:32:50 +0800
From: kernel test robot <lkp@intel.com>
To: Claudiu <claudiu.beznea@tuxon.dev>, bhelgaas@google.com,
	lpieralisi@kernel.org, kw@linux.com,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
	saravanak@google.com, p.zabel@pengutronix.de
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	claudiu.beznea@tuxon.dev, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 1/8] soc: renesas: r9a08g045-sysc: Add max reg offset
Message-ID: <202505011843.2uKgWFN0-lkp@intel.com>
References: <20250430103236.3511989-2-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430103236.3511989-2-claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_033356_016595_4AFA9995 
X-CRM114-Status: GOOD (  11.88  )
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

Hi Claudiu,

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus geert-renesas-devel/next geert-renesas-drivers/renesas-clk robh/for-next arm64/for-next/core linus/master v6.15-rc4 next-20250430]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Claudiu/soc-renesas-r9a08g045-sysc-Add-max-reg-offset/20250430-183951
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20250430103236.3511989-2-claudiu.beznea.uj%40bp.renesas.com
patch subject: [PATCH 1/8] soc: renesas: r9a08g045-sysc: Add max reg offset
config: arm64-randconfig-003-20250501 (https://download.01.org/0day-ci/archive/20250501/202505011843.2uKgWFN0-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505011843.2uKgWFN0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505011843.2uKgWFN0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/renesas/r9a08g045-sysc.c:23:3: error: field designator 'max_register_offset' does not refer to any field in type 'const struct rz_sysc_init_data'
      23 |         .max_register_offset = 0xe28,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +23 drivers/soc/renesas/r9a08g045-sysc.c

    20	
    21	const struct rz_sysc_init_data rzg3s_sysc_init_data __initconst = {
    22		.soc_id_init_data = &rzg3s_sysc_soc_id_init_data,
  > 23		.max_register_offset = 0xe28,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

