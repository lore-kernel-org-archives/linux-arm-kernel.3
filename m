Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D538CCCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 17:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Di3ZApnxCl0wa001MXy2q3Q979yTcSpo9qN3rOYWbY0=; b=pmPwgfSCUA5D6U1umvEmSIeWxE
	XjFL6v35WUnDawpcDCSCOKBkCXmxHT51OH1RutDvpvPcWznmLtW1DsT9inyXqGNFH6pw75KoLRrfJ
	cKk+c2pCsJ78MSPB4sP7lOa9T89kvnJgCfCvFKeyD8d8YVnH/N6FfeYxYT7MCU6gxJt9bUglIwtX6
	JNcwkSqTtU9JZqryLXFQ2zYJQk3y6cSsuNWe3OU8i8ToUsxJCTJ4a2UEKn8aFpuO40jqpDrEAsY2k
	exb2DAdRpcP46pF9su+EwZ/fW3cv4/hmemHxSifsYcrQNWnyzwFE1OJPq9aedrZRIP7pmoErywG5c
	7+wPzI0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsWN-00000006RmA-1tPY;
	Fri, 31 Oct 2025 17:02:39 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsWK-00000006Rle-1rxV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 17:02:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761930157; x=1793466157;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yDv6EgtiAeu4cOA0bFneDjrfyEEmzUj26cMNw39epTU=;
  b=kdDMZSnirkeTKx9eF6/GSp8gQaTt50P4ivFZ+4stDPZhzyrJYL8ACEwl
   OQnI9PF5ym02x43l5r79ATF7THyoRPoKtJoKrtiGu0YNOD067w+JdBe5l
   qTNtdPZntLG5pes3cQeFovPsc/Ofd1HZe+eX6/eiTZ2JWMUK78wNF0VzM
   T66wgldN3bhzw1ZQdHy2UoLBl0EhlKCGKGW2okL/6rCOpbl4dviYoLmLB
   FvAcJUzbp+u7X3IkYTLk0KvKxqdqs2kOIMRdE05uddYuhvTe4u1uCEAS5
   SmcAiDZrtcceL5nHEFgXetpDf+gcoO0/5RSoG+WKdPTMUNHumUtJ6Hx0+
   w==;
X-CSE-ConnectionGUID: FTMA+1mYSfqC/8/Yrfq9ZQ==
X-CSE-MsgGUID: ufXjZLadRIGuTA5Ld+0QGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64126154"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="64126154"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 10:02:36 -0700
X-CSE-ConnectionGUID: D1sa5WS/TvqpPNu3Vd6RTA==
X-CSE-MsgGUID: tBaFbmKcS9O0+gxgVl/e3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="216937489"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 31 Oct 2025 10:02:31 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEsWC-000NUM-38;
	Fri, 31 Oct 2025 17:02:28 +0000
Date: Sat, 1 Nov 2025 01:02:26 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Will McVicker <willmcvicker@google.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, kernel-team@android.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH v2 3/4] clk: samsung: Implement automatic clock gating
 mode for CMUs
Message-ID: <202511010049.sebVqntI-lkp@intel.com>
References: <20251029-automatic-clocks-v2-3-f8edd3a2d82b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-automatic-clocks-v2-3-f8edd3a2d82b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_100236_505198_57319CFC 
X-CRM114-Status: GOOD (  11.04  )
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

Hi Peter,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 72fb0170ef1f45addf726319c52a0562b6913707]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Griffin/dt-bindings-clock-google-gs101-clock-add-samsung-sysreg-property-as-required/20251030-053356
base:   72fb0170ef1f45addf726319c52a0562b6913707
patch link:    https://lore.kernel.org/r/20251029-automatic-clocks-v2-3-f8edd3a2d82b%40linaro.org
patch subject: [PATCH v2 3/4] clk: samsung: Implement automatic clock gating mode for CMUs
config: riscv-randconfig-002-20251031 (https://download.01.org/0day-ci/archive/20251101/202511010049.sebVqntI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511010049.sebVqntI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511010049.sebVqntI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/clk/samsung/clk.c:458 function parameter 'np' not described in 'samsung_cmu_register_clocks'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

