Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A437CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 18:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kudrMaLdxZuNOgCLxwon6tDj7gKDvIxUIEd0H3f6vc8=; b=pez4J/+DyFFwjC2PV4JiW42qGF
	lurWb6mvDkubhi1xVYN6vOVCunSqYBvr5hWGTre4nBrWQO6Bc1Zz+OBrGjCKoGd4hUm54lxGEWOSU
	+Bcftx0hZR2OmV/Nvhnv8BUHAwMBbcELdbOcaG0W0pSjUbgGy9z1kr/hm+DEltMoMR03pFdwvH6Iz
	pG5HpHjvIBmUo/k3Kr5RZ3qNtcITcI9R50t12fLOkBXRjLp5Hli/UcSY3PY3P8uWksjay/qvq7twb
	mvEXWrPEwRjtTfdZc9wdmK4nGuWssqXWdm5X4xajZj3Z5YI+BgyJVsKMwznK+m3LuL6j7/HDAyxj1
	Zz6TzyHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7I4N-000000099kI-1JJV;
	Fri, 10 Oct 2025 18:42:23 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7I4K-000000099jw-3VTk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 18:42:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760121741; x=1791657741;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yr5O1vBEL2Wcyj75rjICSFJodCn8Ot3ie+4ynX8Yldk=;
  b=jo+qH8ZgotwRFXd162Ez85ZGnA3y9Unq02OrRXnXtwTctgt6zChIez+S
   FOkR37EJMPCevlVUpF0lb1v4D8bYNzOBc8h3xY8RSSc3zsOEPLygXeGjI
   06zCkhNwnAC/heWQcBdMoXYsTxnauTM0P9/gsUkuI7OEmiZpneIBbUGQL
   bvFkVrnWd6JDuZmUlfng6qK+Xmym11y3cVHeHiFUd+m50uVbbFH3jJ+kD
   R6AYFQXgC5tARod6Bd7UbsKGgd9P1UIne9rWFgqkyAcTPqGYLCOBnhxaV
   3lCF7gfndraTVX/L1vk+qa5QndP2aBrTCK7GzK8pXhNAa7oTNw/+xr3vZ
   w==;
X-CSE-ConnectionGUID: 4dNPGfCpQUC6wdF0ef11sA==
X-CSE-MsgGUID: VHQrLzfMS/GwdAfCSZMRVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62288500"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62288500"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 11:42:18 -0700
X-CSE-ConnectionGUID: udKB6OpJROCUFgb3Kiq00g==
X-CSE-MsgGUID: 9kUA5bX/QIC8UPbCsBCYfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="180158850"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Oct 2025 11:42:12 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7I49-000345-2q;
	Fri, 10 Oct 2025 18:42:09 +0000
Date: Sat, 11 Oct 2025 02:41:35 +0800
From: kernel test robot <lkp@intel.com>
To: Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Brian Masney <bmasney@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Dan Carpenter <error27@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v5 4/6] clk: Add KUnit tests for assigned-clock-sscs
Message-ID: <202510110212.VLPx3MCC-lkp@intel.com>
References: <20251009-clk-ssc-v5-1-v5-4-d6447d76171e@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009-clk-ssc-v5-1-v5-4-d6447d76171e@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_114220_941336_4E266CE5 
X-CRM114-Status: GOOD (  11.45  )
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

Hi Peng,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7c3ba4249a3604477ea9c077e10089ba7ddcaa03]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan/dt-bindings-clock-Add-spread-spectrum-definition/20251010-085803
base:   7c3ba4249a3604477ea9c077e10089ba7ddcaa03
patch link:    https://lore.kernel.org/r/20251009-clk-ssc-v5-1-v5-4-d6447d76171e%40nxp.com
patch subject: [PATCH v5 4/6] clk: Add KUnit tests for assigned-clock-sscs
config: s390-randconfig-002-20251011 (https://download.01.org/0day-ci/archive/20251011/202510110212.VLPx3MCC-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510110212.VLPx3MCC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510110212.VLPx3MCC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/clk_test.c:115:32: error: initialization of 'int (*)(struct clk_hw *, const struct clk_spread_spectrum *)' from incompatible pointer type 'int (*)(struct clk_hw *, struct clk_spread_spectrum *)' [-Wincompatible-pointer-types]
     115 |         .set_spread_spectrum = clk_dummy_set_spread_spectrum,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk_test.c:115:32: note: (near initialization for 'clk_dummy_rate_ops.set_spread_spectrum')
   drivers/clk/clk_test.c:87:12: note: 'clk_dummy_set_spread_spectrum' declared here
      87 | static int clk_dummy_set_spread_spectrum(struct clk_hw *hw,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk_test.c:122:32: error: initialization of 'int (*)(struct clk_hw *, const struct clk_spread_spectrum *)' from incompatible pointer type 'int (*)(struct clk_hw *, struct clk_spread_spectrum *)' [-Wincompatible-pointer-types]
     122 |         .set_spread_spectrum = clk_dummy_set_spread_spectrum,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk_test.c:122:32: note: (near initialization for 'clk_dummy_maximize_rate_ops.set_spread_spectrum')
   drivers/clk/clk_test.c:87:12: note: 'clk_dummy_set_spread_spectrum' declared here
      87 | static int clk_dummy_set_spread_spectrum(struct clk_hw *hw,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk_test.c:129:32: error: initialization of 'int (*)(struct clk_hw *, const struct clk_spread_spectrum *)' from incompatible pointer type 'int (*)(struct clk_hw *, struct clk_spread_spectrum *)' [-Wincompatible-pointer-types]
     129 |         .set_spread_spectrum = clk_dummy_set_spread_spectrum,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk_test.c:129:32: note: (near initialization for 'clk_dummy_minimize_rate_ops.set_spread_spectrum')
   drivers/clk/clk_test.c:87:12: note: 'clk_dummy_set_spread_spectrum' declared here
      87 | static int clk_dummy_set_spread_spectrum(struct clk_hw *hw,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +115 drivers/clk/clk_test.c

   110	
   111	static const struct clk_ops clk_dummy_rate_ops = {
   112		.recalc_rate = clk_dummy_recalc_rate,
   113		.determine_rate = clk_dummy_determine_rate,
   114		.set_rate = clk_dummy_set_rate,
 > 115		.set_spread_spectrum = clk_dummy_set_spread_spectrum,
   116	};
   117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

