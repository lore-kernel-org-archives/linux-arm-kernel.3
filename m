Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08250D1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Dec 2025 08:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LL5/K1TLOew1Tsl3uROwjLfZ+mr1H9abaqMBpCaH/aI=; b=wWVJ9O6ntTFsQocP2/BABYObgI
	fDmSdaPi5UuQmhTCRBQx0UZevhPM1sg0zAu4RHsHKKHYqWP/BozoNsQn+NW5cIZ4PXWSeEx7EjaNo
	UD0R8ZB6PNoGqWs+nZIFKyRCVOBlR4No3oyBCQHkUokC09PvlEpYMSW42Mj/HsH7rwkZDwnZoW5Zo
	ggGA57zjZXegEiiScohgQyLRH6bdwGMwPJl/ySnYIzrg8BpmCUKKBczcNmdBV7c/aq0TYFjOxaF+C
	asF4chfAZovuWiGYzMg0zj/GnwnBNgstwjYj78o9//JeTLup4mLY7ENVRb1S3j3Pz7XaBLulS3DnJ
	R/SVJTsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSALs-0000000BbPs-1Eph;
	Sun, 07 Dec 2025 08:42:44 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSALp-0000000BbPH-0uiB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Dec 2025 08:42:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765096961; x=1796632961;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=81fHP63wwjUBO7vufHEqW2i1/EwDrAJK5Nz166GaB5w=;
  b=Oki/EnBz4p5ggSroBk5U1PKz5vXQ47iAk3FwLKJUtag3cEB5tRi06XNa
   TDNwjpMF2AHfRQm7RNTqGu8HQuYsGsEiZh9Mzp+pJARzqDaO7xjx9N/oX
   GpU3FZXrHx2ZB9KPQt7Oi0RFVeOI+OhnR4Ry2YoOWNDdh3F68xUupYfdy
   clWBvpXgbsCCUJ/x4sxszdeqJfdoXs6KpW2USSFbEugDL2jYKf/gc4K9i
   1i40v9/jch17Dkwy+nAhEis1J1Ozgb1RLAwYAoeQYPKFVWFIcuaIgUNvV
   0k7AICyPezNydAiIed0qyL+Qr3LPNmV+jmU9cjXFwvhevRkMHm/kCbvhA
   A==;
X-CSE-ConnectionGUID: tCc5vvMtTy+xCkpjTue/DA==
X-CSE-MsgGUID: bViNvI9ZSReg3Bz/oly5YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="78426773"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="78426773"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 00:42:37 -0800
X-CSE-ConnectionGUID: WhjFVEa8S4Gn1dyYhP97Ng==
X-CSE-MsgGUID: 85q/K6LiQPKuPr83qGUJFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="195738405"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Dec 2025 00:42:32 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSALd-00000000J8r-1pzF;
	Sun, 07 Dec 2025 08:42:29 +0000
Date: Sun, 7 Dec 2025 16:42:15 +0800
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
Message-ID: <202512071659.We0N43XW-lkp@intel.com>
References: <20251205011027.720512-6-willmcvicker@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205011027.720512-6-willmcvicker@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_004241_298225_064A09BE 
X-CRM114-Status: GOOD (  10.78  )
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
config: arm64-randconfig-001-20251207 (https://download.01.org/0day-ci/archive/20251207/202512071659.We0N43XW-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project a805147ac1ba123916de182babb0831fbb148756)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251207/202512071659.We0N43XW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512071659.We0N43XW-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: exynos4_mct_probe+0x84 (section: .text) -> mct_init_dt (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

