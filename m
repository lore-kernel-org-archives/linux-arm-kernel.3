Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02FCE8FDD6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 09:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5clUxKO9K7/6AyW1lt2nWEWDwPpxTE1AZ0PW2Jqszc0=; b=NY7ePLS9rFlXTek+O3h8LENuhd
	5X+3AHnJ6BYgRa2E06Rmyg7g1DiatpEYoWrz7cfmQTUzkUNxS9iyH6pjSRtmX2bJNjVuQTDmTBxsW
	hYEwgVgQdy8JDs5RSSYYHTStbk2PbuRBvzi4DzRskejs7m2saeqjV1LWwT/ajdD4CJCvYBwI7RwMF
	h+O4ECgL7Pfet8C6UUWjUYvyzY4nmXYghiA0kZl5ilNsxf/tBlQvWnc06PUIz3vomZC+StjnQ/qFZ
	RIaB4xt09h5D7bIvxSIjWVgncNFV4hiiN7AmCAQDQgjZQlisVWC9zPpKtYgWhKbpFieF9x23mLsVU
	jqF8SrPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZR0b-00000001qHE-0YkR;
	Sat, 27 Dec 2025 09:54:49 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZR0W-00000001qGr-21nz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 09:54:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766829285; x=1798365285;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ky7LqFUiFeL0ivcTjN19Eav+OqAGEwFRZrjCsNjRqrw=;
  b=G5Fng3jupZN5tQkrhwG3pnz5k1sgaDWITE0zBphZGpLX7vG6hxyNiv/6
   skJvv92WTOLFEN6JiLDpd0ndjMltCnIo7n4PU8o7ArihK3g/96RsiuOKf
   6n3+pTRkVfeDZNa0tHb0GKS1UiNxbmJCphYg/cfW6PlRCj2r6w1ygMALu
   yhYHp3Vi1S32eC5JEdEEw6hELMRgts9OWamkdGuRXgp7Ck+18TRNKNFBp
   FpLvkQ1YV365cDeXQbuLuSrUHZeubDrBDzBDDPIrgiNqwAIR0ytzvFPdZ
   36eO2S4oNUJ4+2IQZi9gs4eI6wKG7j4suujQH61p51cMjtqzbz5367Qzu
   g==;
X-CSE-ConnectionGUID: XkoVaMMdTcGnmpt0K0oAvg==
X-CSE-MsgGUID: 8YyeFaPPSFyeymY++mIB9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="68429904"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="68429904"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 01:54:44 -0800
X-CSE-ConnectionGUID: /EliFEKZQeKY1t3uvyxKiw==
X-CSE-MsgGUID: EhErDzhLS2+n1gmfMnjIoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="199665797"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 27 Dec 2025 01:54:41 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZR0Q-000000005iv-1Rpp;
	Sat, 27 Dec 2025 09:54:38 +0000
Date: Sat, 27 Dec 2025 17:53:46 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas Wei <lucaswei@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: oe-kbuild-all@lists.linux.dev, sjadavani@google.com,
	Lucas Wei <lucaswei@google.com>, stable@vger.kernel.org,
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: errata: Workaround for SI L1 downstream coherency
 issue
Message-ID: <202512271720.e5kDPkoP-lkp@intel.com>
References: <20251226074106.3751725-1-lucaswei@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226074106.3751725-1-lucaswei@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_015446_446333_364D7BF0 
X-CRM114-Status: GOOD (  10.59  )
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

Hi Lucas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on arm-perf/for-next/perf arm/for-next arm/fixes kvmarm/next soc/for-next linus/master v6.19-rc2 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lucas-Wei/arm64-errata-Workaround-for-SI-L1-downstream-coherency-issue/20251226-154541
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20251226074106.3751725-1-lucaswei%40google.com
patch subject: [PATCH] arm64: errata: Workaround for SI L1 downstream coherency issue
config: arm64-randconfig-r123-20251227 (https://download.01.org/0day-ci/archive/20251227/202512271720.e5kDPkoP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512271720.e5kDPkoP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512271720.e5kDPkoP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kernel/cpu_errata.c:145:1: sparse: sparse: symbol 'arm_si_l1_workaround_4311569' was not declared. Should it be static?
   arch/arm64/kernel/cpu_errata.c:444:18: sparse: sparse: Initializer entry defined twice
   arch/arm64/kernel/cpu_errata.c:445:17: sparse:   also defined here
   arch/arm64/kernel/cpu_errata.c:450:18: sparse: sparse: Initializer entry defined twice
   arch/arm64/kernel/cpu_errata.c:451:17: sparse:   also defined here
   arch/arm64/kernel/cpu_errata.c:757:17: sparse: sparse: Initializer entry defined twice
   arch/arm64/kernel/cpu_errata.c:758:18: sparse:   also defined here

vim +/arm_si_l1_workaround_4311569 +145 arch/arm64/kernel/cpu_errata.c

   143	
   144	#ifdef CONFIG_ARM64_ERRATUM_4311569
 > 145	DEFINE_STATIC_KEY_FALSE(arm_si_l1_workaround_4311569);
   146	static int __init early_arm_si_l1_workaround_4311569_cfg(char *arg)
   147	{
   148		static_branch_enable(&arm_si_l1_workaround_4311569);
   149		pr_info("Enabling cache maintenance workaround for ARM SI-L1 erratum 4311569\n");
   150	
   151		return 0;
   152	}
   153	early_param("arm_si_l1_workaround_4311569", early_arm_si_l1_workaround_4311569_cfg);
   154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

