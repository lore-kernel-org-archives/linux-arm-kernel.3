Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8459AD374B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 23:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=69Ne4bTbrNtYk5Bud8XASWIu/vbomwNFF3lm1F3VSU0=; b=JuF5e1BfoKTDlc4tcWVuhaZyrZ
	njeIkNhm1qS5ITjLm9LG07EgwbDNEgv1zWz780WLtev0OBEEvH5AE1W//Jinj74ymyIMeEtA0Ok3q
	MjgzDThOy7imyBoXyBoLGVO+DDQdDzDKI9y077pDX0Qu3pzeC8GYzh90rclsdUkkG+bVGLxtbiPBi
	0HSXq4kZ96vHKVa+O4+IA0QGeQ98nAwzYL/3XZiklTzf89RJW8DP+pZrfV2ZCxF2P96Fe0ikL/FU8
	dsvITU1TfdAslTsaC3B49qS4WvrJx0mNBbxOFBhM6dwQiKhI8eCam0FeI1E2XRcfqVTgU4kl9Ma3s
	h/J6nykA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRfE4-0000000AC1W-3aHy;
	Fri, 05 Dec 2025 23:28:36 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRfE1-0000000AC0h-40GF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 23:28:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764977314; x=1796513314;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=06GVYZhezTLwymxE0BBOOw8R+VWOzdpCWMmOUljCHSE=;
  b=T4Z6IptIhLQMl21nVNUtgkJNC5NVSf7y26U8qFf8xvXd84u7diXe/QE7
   BQSTVG0l8HTO4IsYerVndrp6blrm6SQ8+kaGLnyXcZfEg1gjvwykHBV6L
   LY/uCHHdbcyXGXEAZKyJzOkdozkBo8QGWZdkNq7qZZtfvJJehTYlrBdJB
   gTlepeDlMEjI8TpE/4F3FfcsK7gMdHkfx+BoHnNY8QxEopLBeUBS9g1BX
   sScIBrGOoVveO+4NpDMa/bCNEX0uzk/Jo1F2tFklI6EyamwG5iwnCcMK9
   J8MozpRrh7sBBnJlcciiKr+OOUeJbWUfD4XSrhdyCI6VsM5hFPm3TBHjt
   A==;
X-CSE-ConnectionGUID: XvQ4/js/QfenhI7T+1r1qg==
X-CSE-MsgGUID: Z78kYzAOQAKDpZqK7YyusA==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="70633840"
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; 
   d="scan'208";a="70633840"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 15:28:33 -0800
X-CSE-ConnectionGUID: VRBZGpVlTEKrNLGb2AjDVQ==
X-CSE-MsgGUID: jdVY+2RWT8y8YlhD9KahRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; 
   d="scan'208";a="195857387"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Dec 2025 15:28:28 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRfDt-00000000Feb-3xD7;
	Fri, 05 Dec 2025 23:28:25 +0000
Date: Sat, 6 Dec 2025 07:27:43 +0800
From: kernel test robot <lkp@intel.com>
To: Will McVicker <willmcvicker@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Will McVicker <willmcvicker@google.com>,
	Donghoon Yu <hoony.yu@samsung.com>, Rob Herring <robh@kernel.org>,
	John Stultz <jstultz@google.com>,
	Youngmin Nam <youngmin.nam@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	"Russell King (Oracle)" <linux@armlinux.org.uk>,
	linux-samsung-soc@vger.kernel.org, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 5/6] clocksource/drivers/exynos_mct: Add module
 support for ARM64
Message-ID: <202512060730.wBnpCnQv-lkp@intel.com>
References: <20251205011027.720512-6-willmcvicker@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205011027.720512-6-willmcvicker@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_152834_062304_6031483D 
X-CRM114-Status: GOOD (  10.10  )
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

Hi Will,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bca42080637ce3a21092fc0f7d5411e853b0c3b3]

url:    https://github.com/intel-lab-lkp/linux/commits/Will-McVicker/clocksource-drivers-exynos_mct-Don-t-register-as-a-sched_clock-on-arm64/20251205-091403
base:   bca42080637ce3a21092fc0f7d5411e853b0c3b3
patch link:    https://lore.kernel.org/r/20251205011027.720512-6-willmcvicker%40google.com
patch subject: [PATCH v7 5/6] clocksource/drivers/exynos_mct: Add module support for ARM64
config: arm64-randconfig-004-20251205 (https://download.01.org/0day-ci/archive/20251206/202512060730.wBnpCnQv-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 14bf95b06a18b9b59c89601cbc0e5a6f2176b118)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512060730.wBnpCnQv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512060730.wBnpCnQv-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: exynos4_mct_probe+0x70 (section: .text.exynos4_mct_probe) -> mct_init_dt (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

