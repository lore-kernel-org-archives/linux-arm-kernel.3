Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A873BC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 00:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJen3+9FX51ozrXkniRfuUAIfxCcc6hP6WhzsxIWP+U=; b=axagegpbCFQdIjIqGz7z8IPwnj
	vYEDM+RiNsuf0BMfY8W33nzMkxOartsbsXCJcIdco3bgE6H9XfGULLrmK1+fCSUe8cXR3ncibqzFC
	2sfUWjH9/pYtiRVohmGf9s0GcAY8G3owX/v8FXDcKb21+KtF/4Pd14uye02uFQtq110AK7ZofimFd
	aBSr7mUbVOzLsxhyeLPuVS3VHLaZFpjDON7kd27Ckg1SFa1s+G9GF8N0ngf3NPKtxYeVEXq8NOoV0
	wyG6G7R5+6Z5b3FNuqxspEnsogAyOs1oP/MzEHZB7VsxKSulSxiDeEz+cb4KtVe+FVmLjdIbXFYm8
	LnuCH6pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrav-00000004HHC-3Szi;
	Tue, 24 Jun 2025 00:33:01 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTo0h-00000003wdj-1NDM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 20:43:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750711403; x=1782247403;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ZF8iOADmf8w+7qUTaik1sR5sLxxucpt9xz9r6IIBx8E=;
  b=m2Gx2QLTZX6LD6wfW9YGJYjKfWRA80CSfKOfJnB52pSiGwkz9RVWJ6e7
   huf0zrvy9qARIg/+r5ADLgbO88F21X6fDnc+OqFwnDSUhKdWrAdKYAwOY
   Sza5OOpRcNmnctxER1H3Gw8nccRvcgUx/JPTfhPjsgWi4g/UlvHR2Vm3q
   ctyeVMMd8SawFwqb3VFbW07X7tbFmCcF6/TBYcscpgRoe5df9G7sPAzfl
   MMdhk86qoW9YeqHcZlGM5zUGdgjTlLxZLxIoPRCb3RCny2BjrkKCKb8Dw
   U770yz+Rake+Aah2ckDj4N7rCutamWbAR9Oz3HBvTfAZI3TKoYKI2kfXn
   Q==;
X-CSE-ConnectionGUID: GvHG2sjHTZOr2U65Fu3oyg==
X-CSE-MsgGUID: FTv6QRY6Qo67UHVET8FGcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="40547175"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="40547175"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 13:43:21 -0700
X-CSE-ConnectionGUID: vhpMNoOJRVyHoigd9p+7Iw==
X-CSE-MsgGUID: sLayHnBySu6O9o+QgzInsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="151185395"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Jun 2025 13:43:15 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTo0W-000PJq-2Z;
	Mon, 23 Jun 2025 20:43:12 +0000
Date: Tue, 24 Jun 2025 04:43:02 +0800
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
Message-ID: <202506240401.zlRG1qiO-lkp@intel.com>
References: <20250623-ddrperfm-upstream-v1-6-7dffff168090@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250623-ddrperfm-upstream-v1-6-7dffff168090@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_134323_408873_B0DC3E3B 
X-CRM114-Status: GOOD (  12.29  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on 86731a2a651e58953fc949573895f2fa6d456841]

url:    https://github.com/intel-lab-lkp/linux/commits/Cl-ment-Le-Goffic/bus-firewall-move-stm32_firewall-header-file-in-include-folder/20250623-173554
base:   86731a2a651e58953fc949573895f2fa6d456841
patch link:    https://lore.kernel.org/r/20250623-ddrperfm-upstream-v1-6-7dffff168090%40foss.st.com
patch subject: [PATCH 06/13] perf: stm32: introduce DDRPERFM driver
config: i386-buildonly-randconfig-002-20250624 (https://download.01.org/0day-ci/archive/20250624/202506240401.zlRG1qiO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506240401.zlRG1qiO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506240401.zlRG1qiO-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/perf/stm32_ddr_pmu.c: In function 'stm32_ddr_start_counters':
>> drivers/perf/stm32_ddr_pmu.c:205:9: error: implicit declaration of function 'writel_relaxed' [-Werror=implicit-function-declaration]
     205 |         writel_relaxed(r->start.mask, pmu->membase + r->start.reg);
         |         ^~~~~~~~~~~~~~
   drivers/perf/stm32_ddr_pmu.c: In function 'stm32_ddr_clear_counter':
>> drivers/perf/stm32_ddr_pmu.c:232:22: error: implicit declaration of function 'readl_relaxed' [-Werror=implicit-function-declaration]
     232 |         u32 status = readl_relaxed(pmu->membase + r->status.reg);
         |                      ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/writel_relaxed +205 drivers/perf/stm32_ddr_pmu.c

   200	
   201	static void stm32_ddr_start_counters(struct stm32_ddr_pmu *pmu)
   202	{
   203		const struct stm32_ddr_pmu_regspec *r = pmu->cfg->regs;
   204	
 > 205		writel_relaxed(r->start.mask, pmu->membase + r->start.reg);
   206	}
   207	
   208	static void stm32_ddr_stop_counters(struct stm32_ddr_pmu *pmu)
   209	{
   210		const struct stm32_ddr_pmu_regspec *r = pmu->cfg->regs;
   211	
   212		writel_relaxed(r->stop.mask, pmu->membase + r->stop.reg);
   213	}
   214	
   215	static void stm32_ddr_clear_time_counter(struct stm32_ddr_pmu *pmu)
   216	{
   217		const struct stm32_ddr_pmu_regspec *r = pmu->cfg->regs;
   218	
   219		writel_relaxed(r->clear_time.mask, pmu->membase + r->clear_time.reg);
   220	}
   221	
   222	static void stm32_ddr_clear_event_counter(struct stm32_ddr_pmu *pmu, struct stm32_ddr_cnt *counter)
   223	{
   224		const struct stm32_ddr_pmu_regspec *r = pmu->cfg->regs;
   225	
   226		writel_relaxed(r->clear_cnt.mask & BIT(counter->idx), pmu->membase + r->clear_cnt.reg);
   227	}
   228	
   229	static void stm32_ddr_clear_counter(struct stm32_ddr_pmu *pmu, struct stm32_ddr_cnt *counter)
   230	{
   231		const struct stm32_ddr_pmu_regspec *r = pmu->cfg->regs;
 > 232		u32 status = readl_relaxed(pmu->membase + r->status.reg);
   233	
   234		if (counter->idx == pmu->cfg->time_cnt_idx)
   235			stm32_ddr_clear_time_counter(pmu);
   236		else
   237			stm32_ddr_clear_event_counter(pmu, counter);
   238	
   239		if (status & r->status.mask)
   240			dev_err(pmu->dev, "Failed to clear counter %i because the PMU is busy\n",
   241				counter->idx);
   242	}
   243	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

