Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C831C36001
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 05:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0eQtkmuKmYM/Vfc+w0B810+J/iAsvOeoQPKe2lcMxdA=; b=R3/aySJw2V4Odz6wM21FEfwIp7
	s0xqkVRVacCUIad+Sn90jizqaPV3ssaD8sUJSYMXl7B6owcf002XnMz7li9Y+qItCF7bO5zfyOj5B
	g2Kd+FjE/bHX6pHookQN+Sp7jyeN3LLfripujinfn42csvl9+1uaxdmew4NhSaXrCCfJaFHfG379T
	mhVaIv7p8h8f8/6Rvoo4hBZSy2oHgEdTWrSb2uvMfheMxjMGp916AN9/bklkan+J/XP1td4OPPh5C
	2N0/NRvmPnr6Fz4L07q4riXS9cshaCWfSPuaheWv+A2zss5PvOjIepMwKbJ83CbcwujXneeIfolrJ
	kRcKQp/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twa7i-00000002Def-1wMm;
	Mon, 24 Mar 2025 05:13:18 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twa5y-00000002DYD-1Isp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 05:11:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742793090; x=1774329090;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=OGe21FZmth7HYF72oeDzQkXP1oyokZOoHTNNZQgVbus=;
  b=cRyROKHQT+Wh1+siBXZlkpJLUwOGur8Di/pe7Ybic8jaZfR7NVLWeuxq
   1iL+UgwqVYlgxklp7s39XWMoMG/Mp9q8wKH24rYWpoGbI8EHPnL8507YR
   81T7ZAtxqmzzeXFy9dhwNtDHlXkcUwI4jpLPgIOMZikzmJz1E8MwAWVwY
   6hZR+9JQMoAeYw+6WhaTKcd9ghq5DwgqkW1aScleJaqjCjZ8Tl0dqe+KN
   Vgr60mg1Wcw9UTMMh05+GdEAWhDeYofrIO+VUBfj63rq+5BNaCemlt0aR
   i1DhaJQSW+ql4vXY6pa2m30gU36w8/tWrXpXFAFRUFiy4z8reRCpWuJWd
   g==;
X-CSE-ConnectionGUID: Dpo8qeiTQD244eVhKUtE6Q==
X-CSE-MsgGUID: p1QIN8pWRiOzf8foiOhtig==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="43707323"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; 
   d="scan'208";a="43707323"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2025 22:11:27 -0700
X-CSE-ConnectionGUID: lvb+ApYzQ2CS7iUwR+4IJg==
X-CSE-MsgGUID: 6mngPGWLRXuxrTOUlhKXlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; 
   d="scan'208";a="124388459"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 23 Mar 2025 22:11:21 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twa5W-0003Hk-22;
	Mon, 24 Mar 2025 05:11:03 +0000
Date: Mon, 24 Mar 2025 13:09:59 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Subject: Re: [PATCH 20/34] mfd: sec: rework platform data and regmap
 instantiating
Message-ID: <202503241201.amdeUwuc-lkp@intel.com>
References: <20250323-s2mpg10-v1-20-d08943702707@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250323-s2mpg10-v1-20-d08943702707@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_221130_414921_17A73631 
X-CRM114-Status: GOOD (  11.20  )
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

Hi André,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c4d4884b67802c41fd67399747165d65c770621a]

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Draszik/dt-bindings-mfd-samsung-s2mps11-add-s2mpg10/20250324-064418
base:   c4d4884b67802c41fd67399747165d65c770621a
patch link:    https://lore.kernel.org/r/20250323-s2mpg10-v1-20-d08943702707%40linaro.org
patch subject: [PATCH 20/34] mfd: sec: rework platform data and regmap instantiating
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250324/202503241201.amdeUwuc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250324/202503241201.amdeUwuc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503241201.amdeUwuc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/sec-i2c.c:206:48: warning: 's2mps14_data' defined but not used [-Wunused-const-variable=]
     206 | static const struct sec_pmic_i2c_platform_data s2mps14_data = {
         |                                                ^~~~~~~~~~~~


vim +/s2mps14_data +206 drivers/mfd/sec-i2c.c

   205	
 > 206	static const struct sec_pmic_i2c_platform_data s2mps14_data = {
   207		.regmap_cfg = &s2mps14_regmap_config,
   208		.device_type = S2MPS14X,
   209	};
   210	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

