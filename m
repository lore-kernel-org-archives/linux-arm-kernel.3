Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32170D0BB56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 15:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+V+9768taUvAAR9n9sO9MLQWWRG0UQS5MiH998erbmY=; b=3cIR2cfNAJj+rytBCKymLrqQMU
	lgHYjYJW7WhxYCWnT/wnOCTchgks8Ta/r8GM1sGFi+NVLISYpx0/l3+pBrqtk4blwAKk3gOrFJHQR
	0t6StcFsOQ7IJ+UHGJqlrPqA7/GmfovqkS6lIjKnm7G7ot7OGmWIXWSKCOBPqxQSrXgp9qOWUrIsa
	wnDBaAdKpXk7DpA+BbIlNWXpEnHUFqQs1hU2WGYnSgmzKbo586do5qNhokGpzK1PyTxglEjTHngcW
	YGZfH2X1vTo23oPFUboeotiR3oHpE6jBi7Oz9FnsbgDHHK/QDXJAZKpo0zaiJMEOMg4NSVIYtPraQ
	M+Kh8ZRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4M7L-00000004Dkb-3nPH;
	Fri, 25 Oct 2024 15:20:47 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LkX-0000000476y-19Pn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 14:58:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729868233; x=1761404233;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=slQFkpvsOAihEgvv9wUjUeRexTrOCI2advJJoQkRFNw=;
  b=f+e7jg41V2cfZkh7VpXXXfpsq/5W1NA2NIj/6Ye5uvR1vr1YVUav1Yl4
   8qdgbT8kJlNJXCwctNoNdzcR4QZO9EbdxFkSkC4abLzEi+4MTMZ88blRP
   GKMmgzlMV53XzlnIPjWNgqXNQIVMyUxnbQK6Aso4EiBzE07Hn1QY2B4et
   OknzEE2csqeKVjBohVUcgjj8PpGWaiSudbE1VF0wJFQLRUUieDM+puG1b
   c/olI/qxHOyIgifv/S9SRM2kQF6ELRm6N/dq2Hv3SR6Zd3fObJ+XFMdO9
   pPfK5I12xGgnLKNGFIV28UWB4ku/Ppr1kX6plukgWkFGxuZbb3XyaRtmo
   w==;
X-CSE-ConnectionGUID: c85zYY3iTfqSFm8epQnpHw==
X-CSE-MsgGUID: 8PAz4pF6QTW7vdNaYfqpCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="47023393"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="47023393"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 07:57:12 -0700
X-CSE-ConnectionGUID: kFs+VMZSS8yTo5wXD3UPKA==
X-CSE-MsgGUID: CqzqTi+lQnmMt48hJypgFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="81239477"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 Oct 2024 07:57:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4LkQ-000YNi-1v;
	Fri, 25 Oct 2024 14:57:06 +0000
Date: Fri, 25 Oct 2024 22:56:45 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>, lee@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
	andrew@codeconstruct.com.au, mturquette@baylibre.com,
	sboyd@kernel.org, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, dmitry.baryshkov@linaro.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 3/3] clk: aspeed: add AST2700 clock driver.
Message-ID: <202410252216.a0X0bOLS-lkp@intel.com>
References: <20241023090153.1395220-4-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023090153.1395220-4-ryan_chen@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_075713_362025_BF99E34A 
X-CRM114-Status: GOOD (  11.58  )
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

Hi Ryan,

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on pza/reset/next lee-mfd/for-mfd-next lee-leds/for-leds-next linus/master lee-mfd/for-mfd-fixes v6.12-rc4 next-20241025]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-bindings-mfd-aspeed-support-for-AST2700/20241023-170434
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20241023090153.1395220-4-ryan_chen%40aspeedtech.com
patch subject: [PATCH v6 3/3] clk: aspeed: add AST2700 clock driver.
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241025/202410252216.a0X0bOLS-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410252216.a0X0bOLS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410252216.a0X0bOLS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: aspeed_reset_controller_register
   >>> referenced by clk-ast2700.c
   >>>               drivers/clk/clk-ast2700.o:(ast2700_soc_clk_probe) in archive vmlinux.a
   >>> referenced by clk-ast2700.c
   >>>               drivers/clk/clk-ast2700.o:(ast2700_soc_clk_probe) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

