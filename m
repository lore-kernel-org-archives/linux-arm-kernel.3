Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB21D2F000
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 12:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5IJRoSxWQb8JN7fISEhqmMWdc69kkUQGsVQmOgvzHe4=; b=osQEKHG59uiHwOy2X3KbxefOEV
	lkufVxIAh4amwpxcaajxFuSpoM9f0hCItib2HU9P7rKgQlUpxWL4EwN2KdBkB1sym7vCy0Exz04ue
	2EDUVyMWjO4Chi7POps8JX0Q0e1sW5RCPnc3kO1HYc8aYkub6lCEFNMy/qrn1DiPnn2T6vN2gX7gj
	CGcFMySLRufehvEJsk/rwP38Gm9afFsXSocx+Uj/ICwVNiRAyjiOCu3oM2AOQwGVgAQYg2PAZx0lF
	gYgA531EvH842U0sk0vsGmPWTvz7InM6RCSYcFUjqGeXv8gQWxLYvaYlvZETxi6yMrVCMNHnTO7oM
	+5d+MrvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkiYc-0000000EH0g-1zeg;
	Tue, 27 Jan 2026 12:52:34 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkiYZ-0000000EGzd-3XMS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 12:52:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769518352; x=1801054352;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vgbQx0vDwWYjR3sK+ZddrCDH4qHiveEQokdGsfxcS2g=;
  b=SES5YQjNcyUd8k/laP9GFC14cP68poR/dc6b6XTEnFsdEraYHJ23evy/
   6DO5aEgWGrfliAqgJxweNzstlIFiPUKtz21Cm14DlV3KdhIs+DNl1QjLY
   HUGPeWxwKVpLtmL28GGY3gIR2iqaLOUDMNCqrJiBWMnJpKAGTtmC+2XBA
   SvQLbu0CesrmolT3nfD7csmfJ5d7k+q+wYMYhYG9IdTHwzBz50/URyppV
   jVc3qzwgHzRF+U7t5ZSV4NU7dHaIO2eVBPrAMDJhz9zhnX0nFm92To6Jr
   yLvxRLpLwCLS3xqQu9RIWox4JvKwS+mH72tmLvQ4auIGeEfDy22eZB1eW
   Q==;
X-CSE-ConnectionGUID: VxuAQSn7QkGrm75xYhPDqg==
X-CSE-MsgGUID: ODWvNalESbeQClrDMyYC9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="69911721"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="69911721"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 04:52:31 -0800
X-CSE-ConnectionGUID: wIcgciS6QfOH3oFLtMWbAA==
X-CSE-MsgGUID: Xwu+uTG+Su+JHQ8O8Uf/EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="230922383"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Jan 2026 04:52:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkiYR-00000000YUG-3ffS;
	Tue, 27 Jan 2026 12:52:23 +0000
Date: Tue, 27 Jan 2026 20:52:04 +0800
From: kernel test robot <lkp@intel.com>
To: Ruidong Tian <tianruidong@linux.alibaba.com>, catalin.marinas@arm.com,
	will@kernel.org, lpieralisi@kernel.org, guohanjun@huawei.com,
	sudeep.holla@arm.com, rafael@kernel.org, robin.murphy@arm.com,
	mark.rutland@arm.com, tony.luck@intel.com, bp@alien8.de,
	tglx@linutronix.de, peterz@infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, lenb@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-edac@vger.kernel.org, mchehab@kernel.org,
	xueshuai@linux.alibaba.com, zhuo.song@linux.alibaba.com,
	oliver.yang@linux.alibaba.com,
	Ruidong Tian <tianruidong@linux.alibaba.com>
Subject: Re: [PATCH v6 13/16] ras: AEST: Introduce AEST inject interface to
 test AEST driver
Message-ID: <202601272009.SKq0aXMN-lkp@intel.com>
References: <20260122094656.73399-14-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122094656.73399-14-tianruidong@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_045231_925117_D415B12A 
X-CRM114-Status: GOOD (  13.08  )
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

Hi Ruidong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on rafael-pm/linux-next rafael-pm/bleeding-edge linus/master v6.19-rc7 next-20260126]
[cannot apply to tip/smp/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ruidong-Tian/ACPI-AEST-Parse-the-AEST-table/20260122-180219
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20260122094656.73399-14-tianruidong%40linux.alibaba.com
patch subject: [PATCH v6 13/16] ras: AEST: Introduce AEST inject interface to test AEST driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260127/202601272009.SKq0aXMN-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601272009.SKq0aXMN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601272009.SKq0aXMN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ras/aest/aest-sysfs.c:194:45: warning: more '%' conversions than data arguments [-Wformat-insufficient-args]
     194 |                 snprintf(name, sizeof(name), "processor%u%u", cpu);
         |                                                          ~^
   1 warning generated.


vim +194 drivers/ras/aest/aest-sysfs.c

   182	
   183	static void
   184	aest_oncore_dev_init_debugfs(struct aest_device *adev)
   185	{
   186		int cpu, i;
   187		struct aest_node *node;
   188		struct aest_device *percpu_dev;
   189		char name[16];
   190	
   191		for_each_possible_cpu(cpu) {
   192			percpu_dev = this_cpu_ptr(adev->adev_oncore);
   193	
 > 194			snprintf(name, sizeof(name), "processor%u%u", cpu);
   195			percpu_dev->debugfs = debugfs_create_dir(name, adev->debugfs);
   196	
   197			for (i = 0; i < adev->node_cnt; i++) {
   198				node = &adev->nodes[i];
   199	
   200				node->debugfs = debugfs_create_dir(node->name,
   201								percpu_dev->debugfs);
   202				aest_node_init_debugfs(node);
   203			}
   204		}
   205	}
   206	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

