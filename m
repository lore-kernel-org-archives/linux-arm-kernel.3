Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED801C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 00:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TEN68Sq98ceDWKLbmmwr6QLiAT2Etx4msV2UZKpurUE=; b=jQET3j3FLtId0wr4ay05lNRrMI
	Xur9UJ3ij4v+ekhMSSu7CIMIAe0lhH/cnwRFu8Q033feDPcVFkDD1JWZQqolOctoSZSHa+GMFnWnM
	/H5j2IiZwuUuksHwQsAMI9mYkmo5SnF3KTMu9e1znoFSirb96TJ7rvdDFsc35LqiM6iZVC7AOMzE3
	clNs6Dgbb9mdIOYuWHnaN/u9egfuh/BapIHzCUsFjMu3zCGED4HBdFOBlQTE+B3B66lrAEuKl3xWH
	BqDjgOIiI5TH5nYEYbU/F0Ln7/sczX4jMDFXmSqTY6joaY3A3SawXmb6gSEHFhdKTw7e8xKP3hCUD
	hK6xRQsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUxCT-0000000DEH2-49Uv;
	Fri, 27 Jun 2025 00:44:17 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwP7-0000000D6hW-10Cr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 23:53:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750981997; x=1782517997;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=SN/NGzVIJgralBcDDuVPGj29WH5pdAz4U3HXHsEVx8s=;
  b=goqhwdc/OE4m1I8qlZ+tPCclsafXQERmNjmNYcO11CDqJHucbUJ4u2XQ
   wMf6V31267SYO8b2biaoH20bmb96cl6AR9eP9xqO8U1IwMh1oX9c7pw/X
   50NlDz6mJuDNQKXq/JNECcXpaEHfkSMl/UfWQhxsq96eEh2KdshAozLYV
   mH2NnG1a26jrmijjDp9WPNQsMQgA5lSiTVumEnjjVbGQV91FePKr1lfFR
   oeh2U9bkwIjV2ACh0PK9PPRjKUBwNuyia4MewbIbgnIIdO/WMUQTf6mdv
   C3tFyBSquZZDD/zS8J5wTozIU2zUyXMcO+j0HNQNjIL0VvhmEESm1K63d
   A==;
X-CSE-ConnectionGUID: UrJPPxKwQdmLsSKdhlFxaA==
X-CSE-MsgGUID: AnXk0GfwT1i/ZwKi+0lxyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53236099"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="53236099"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 16:53:16 -0700
X-CSE-ConnectionGUID: gp+S1qc3Qt+VQ3YEWjmHMQ==
X-CSE-MsgGUID: FWOuogMYQS6kHK1SwV6JTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="183554204"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Jun 2025 16:53:12 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUwOz-000VeA-2T;
	Thu, 26 Jun 2025 23:53:09 +0000
Date: Fri, 27 Jun 2025 07:52:47 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Subject: Re: [PATCH 06/13] perf: stm32: introduce DDRPERFM driver
Message-ID: <202506270708.6w6phhmi-lkp@intel.com>
References: <20250623-ddrperfm-upstream-v1-6-7dffff168090@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250623-ddrperfm-upstream-v1-6-7dffff168090@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_165317_292161_39F8FAE8 
X-CRM114-Status: GOOD (  12.87  )
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

Hi Clément,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 86731a2a651e58953fc949573895f2fa6d456841]

url:    https://github.com/intel-lab-lkp/linux/commits/Cl-ment-Le-Goffic/bus-firewall-move-stm32_firewall-header-file-in-include-folder/20250623-173554
base:   86731a2a651e58953fc949573895f2fa6d456841
patch link:    https://lore.kernel.org/r/20250623-ddrperfm-upstream-v1-6-7dffff168090%40foss.st.com
patch subject: [PATCH 06/13] perf: stm32: introduce DDRPERFM driver
config: i386-buildonly-randconfig-004-20250627 (https://download.01.org/0day-ci/archive/20250627/202506270708.6w6phhmi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506270708.6w6phhmi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506270708.6w6phhmi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/perf/stm32_ddr_pmu.c: In function 'stm32_ddr_start_counters':
   drivers/perf/stm32_ddr_pmu.c:205:9: error: implicit declaration of function 'writel_relaxed' [-Werror=implicit-function-declaration]
     205 |         writel_relaxed(r->start.mask, pmu->membase + r->start.reg);
         |         ^~~~~~~~~~~~~~
   drivers/perf/stm32_ddr_pmu.c: In function 'stm32_ddr_clear_counter':
   drivers/perf/stm32_ddr_pmu.c:232:22: error: implicit declaration of function 'readl_relaxed' [-Werror=implicit-function-declaration]
     232 |         u32 status = readl_relaxed(pmu->membase + r->status.reg);
         |                      ^~~~~~~~~~~~~
   drivers/perf/stm32_ddr_pmu.c: At top level:
>> drivers/perf/stm32_ddr_pmu.c:862:34: warning: 'stm32_ddr_pmu_of_match' defined but not used [-Wunused-const-variable=]
     862 | static const struct of_device_id stm32_ddr_pmu_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/stm32_ddr_pmu_of_match +862 drivers/perf/stm32_ddr_pmu.c

   861	
 > 862	static const struct of_device_id stm32_ddr_pmu_of_match[] = {
   863		{
   864			.compatible = "st,stm32mp131-ddr-pmu",
   865			.data = &stm32_ddr_pmu_cfg_mp1
   866		},
   867		{
   868			.compatible = "st,stm32mp151-ddr-pmu",
   869			.data = &stm32_ddr_pmu_cfg_mp1
   870		},
   871		{
   872			.compatible = "st,stm32mp251-ddr-pmu",
   873			.data = &stm32_ddr_pmu_cfg_mp2
   874		},
   875		{ },
   876	};
   877	MODULE_DEVICE_TABLE(of, stm32_ddr_pmu_of_match);
   878	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

