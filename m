Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9FBC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 14:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OWIvTVOsNDhRbAvxvQqVkPa08dkzFWDu6M13pQjxpUM=; b=HLDstqkptsyVVfr/c2HNCpE0C5
	Us5PftyEocXSQqHX3mdEl36phLt9aGfDJqooumq5pKqU2melwLyxVwFlvpqz63snsAuIAJvWzQw20
	NU1FshQ3dcu6NsKYz4mE4seYG542vX/4bv9nVD2US7vPUkdVCIq04SolYYQfLO/DDR9MTesaYL3tq
	//UWEStpyPu7+2YS9v8ZiLvYQW1eX3VzSFQFeaxMvahE7PDxzL02COheVTHeBXDqSqWsq2WB1iGbT
	MgPpc1Fu4txAkgmNrk8/4YnwRY8Q4Rozs61CneWlJf9hHQrZv+6L9whkgSdqEFgoa+Kk0h172CetR
	FOOgkfCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh86g-00000001mD1-2ttg;
	Wed, 30 Jul 2025 14:48:38 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh81u-00000001lZz-0nod
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 14:43:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753886623; x=1785422623;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=idRnj5P4PrYGxexiNDf1IWPLr0mVthPDzs6oUfOLhrM=;
  b=k7+HGMIj2fJh4I80sSzLhN7vtJ63Vs4xfPZzGVtY+8CAKTYSiDzCI8i8
   4GNk7y73M0/AgaddFKqe6M3jZ+Dgd1LB8yY7ihsmDzcXTd30hjDhQOFvT
   RugsZKJM4gMXDQIdnB+yqgd/QdpHAiWkPgtqyfrSWxl4YHsXR4jUSbs5D
   cp568AvD3DOknEi8j7sk0u8r7cr1OxiYZdG6UG7040s4MayiyRGhDdzIz
   N7MB/uKtZfJs8q/Of7TXx3WteK7cqQY7PTEI6lvjo8Iijt0/efUV3pjHz
   I/ubcRFRhnLo4CmTVxupImtXpps/F1YDktJLwT7gSTP7Cl0Wi2vP9zTjA
   A==;
X-CSE-ConnectionGUID: +zgNAzo3S4OwidMt9fvdRQ==
X-CSE-MsgGUID: wfVj/Et4QKyQ4VH7N297lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="55890922"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="55890922"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 07:43:40 -0700
X-CSE-ConnectionGUID: oTzVPsG9QR+19wHO6VXhaA==
X-CSE-MsgGUID: 8uYbk/j7SeWAaepWravi+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="193987297"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Jul 2025 07:43:34 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uh81k-0002qG-0g;
	Wed, 30 Jul 2025 14:43:32 +0000
Date: Wed, 30 Jul 2025 22:43:04 +0800
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
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	Le Goffic <legoffic.clement@gmail.com>,
	Julius Werner <jwerner@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Subject: Re: [PATCH v5 13/20] perf: stm32: introduce DDRPERFM driver
Message-ID: <202507302237.gyVCBmXs-lkp@intel.com>
References: <20250728-ddrperfm-upstream-v5-13-03f1be8ad396@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250728-ddrperfm-upstream-v5-13-03f1be8ad396@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_074342_292315_1C1C205C 
X-CRM114-Status: GOOD (  12.46  )
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

[auto build test ERROR on 89be9a83ccf1f88522317ce02f854f30d6115c41]

url:    https://github.com/intel-lab-lkp/linux/commits/Cl-ment-Le-Goffic/bus-firewall-move-stm32_firewall-header-file-in-include-folder/20250728-234144
base:   89be9a83ccf1f88522317ce02f854f30d6115c41
patch link:    https://lore.kernel.org/r/20250728-ddrperfm-upstream-v5-13-03f1be8ad396%40foss.st.com
patch subject: [PATCH v5 13/20] perf: stm32: introduce DDRPERFM driver
config: s390-randconfig-001-20250730 (https://download.01.org/0day-ci/archive/20250730/202507302237.gyVCBmXs-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507302237.gyVCBmXs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507302237.gyVCBmXs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/perf/stm32_ddr_pmu.c:213:2: error: call to undeclared function 'writel_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     213 |         writel_relaxed(r->start.mask, pmu->membase + r->start.reg);
         |         ^
   drivers/perf/stm32_ddr_pmu.c:220:2: error: call to undeclared function 'writel_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     220 |         writel_relaxed(r->stop.mask, pmu->membase + r->stop.reg);
         |         ^
   drivers/perf/stm32_ddr_pmu.c:227:2: error: call to undeclared function 'writel_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     227 |         writel_relaxed(r->clear_time.mask, pmu->membase + r->clear_time.reg);
         |         ^
   drivers/perf/stm32_ddr_pmu.c:234:2: error: call to undeclared function 'writel_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     234 |         writel_relaxed(r->clear_cnt.mask & BIT(counter->idx), pmu->membase + r->clear_cnt.reg);
         |         ^
>> drivers/perf/stm32_ddr_pmu.c:240:15: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     240 |         u32 status = readl_relaxed(pmu->membase + r->status.reg);
         |                      ^
   drivers/perf/stm32_ddr_pmu.c:255:12: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     255 |         u32 val = readl_relaxed(pmu->membase + r->enable.reg);
         |                   ^
   drivers/perf/stm32_ddr_pmu.c:258:2: error: call to undeclared function 'writel_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     258 |         writel_relaxed(val, pmu->membase + r->enable.reg);
         |         ^
   drivers/perf/stm32_ddr_pmu.c:264:12: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     264 |         u32 val = readl_relaxed(pmu->membase + r->enable.reg);
         |                   ^
   drivers/perf/stm32_ddr_pmu.c:267:2: error: call to undeclared function 'writel_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     267 |         writel_relaxed(val, pmu->membase + r->enable.reg);
         |         ^
   drivers/perf/stm32_ddr_pmu.c:285:17: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     285 |                 cnt_sel_val = readl_relaxed(pmu->membase + r->cfg.reg);
         |                               ^
   drivers/perf/stm32_ddr_pmu.c:288:3: error: call to undeclared function 'writel_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     288 |                 writel_relaxed(cnt_sel_val, pmu->membase + r->cfg.reg);
         |                 ^
   drivers/perf/stm32_ddr_pmu.c:302:16: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     302 |         cnt_sel_val = readl_relaxed(pmu->membase + cnt_sel_evt_reg);
         |                       ^
   drivers/perf/stm32_ddr_pmu.c:306:2: error: call to undeclared function 'writel_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     306 |         writel_relaxed(cnt_sel_val, pmu->membase + cnt_sel_evt_reg);
         |         ^
   drivers/perf/stm32_ddr_pmu.c:428:9: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     428 |                 val = readl_relaxed(pmu->membase + r->counter_evt[counter->idx].reg);
         |                       ^
   drivers/perf/stm32_ddr_pmu.c:778:3: error: call to undeclared function 'writel_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     778 |                 writel_relaxed(pmu->dram_type, pmu->membase + pmu->cfg->regs->dram_inf.reg);
         |                 ^
   drivers/perf/stm32_ddr_pmu.c:803:2: error: call to undeclared function 'writel_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     803 |         writel_relaxed(pmu->dram_type, pmu->membase + pmu->cfg->regs->dram_inf.reg);
         |         ^
   16 errors generated.


vim +/writel_relaxed +213 drivers/perf/stm32_ddr_pmu.c

   208	
   209	static void stm32_ddr_start_counters(struct stm32_ddr_pmu *pmu)
   210	{
   211		const struct stm32_ddr_pmu_regspec *r = pmu->cfg->regs;
   212	
 > 213		writel_relaxed(r->start.mask, pmu->membase + r->start.reg);
   214	}
   215	
   216	static void stm32_ddr_stop_counters(struct stm32_ddr_pmu *pmu)
   217	{
   218		const struct stm32_ddr_pmu_regspec *r = pmu->cfg->regs;
   219	
   220		writel_relaxed(r->stop.mask, pmu->membase + r->stop.reg);
   221	}
   222	
   223	static void stm32_ddr_clear_time_counter(struct stm32_ddr_pmu *pmu)
   224	{
   225		const struct stm32_ddr_pmu_regspec *r = pmu->cfg->regs;
   226	
   227		writel_relaxed(r->clear_time.mask, pmu->membase + r->clear_time.reg);
   228	}
   229	
   230	static void stm32_ddr_clear_event_counter(struct stm32_ddr_pmu *pmu, struct stm32_ddr_cnt *counter)
   231	{
   232		const struct stm32_ddr_pmu_regspec *r = pmu->cfg->regs;
   233	
   234		writel_relaxed(r->clear_cnt.mask & BIT(counter->idx), pmu->membase + r->clear_cnt.reg);
   235	}
   236	
   237	static void stm32_ddr_clear_counter(struct stm32_ddr_pmu *pmu, struct stm32_ddr_cnt *counter)
   238	{
   239		const struct stm32_ddr_pmu_regspec *r = pmu->cfg->regs;
 > 240		u32 status = readl_relaxed(pmu->membase + r->status.reg);
   241	
   242		if (counter->idx == pmu->cfg->time_cnt_idx)
   243			stm32_ddr_clear_time_counter(pmu);
   244		else
   245			stm32_ddr_clear_event_counter(pmu, counter);
   246	
   247		if (status & r->status.mask)
   248			dev_err(pmu->dev, "Failed to clear counter %i because the PMU is busy\n",
   249				counter->idx);
   250	}
   251	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

