Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3540C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 02:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJi7McdZx9NQyLkPXNW6Qvkt1SN9g7Jc3ziYLybJiOU=; b=Ih4ozVzzdl9bSqBzUzbKZ+wpXJ
	jj43BCepzkFkhW8IsEEahyD8KiFBvts/Rhud3zUxpNTmBzuqB/cWClI+Iq60k2MAZz8DGEqp18bxA
	uUUKc4+xBrVm3nZQ0+x8qJr6hvYbttCPrL5vRTqbtdvrCFF4Wug8rzGh6VhEOiE9bYmTTPl+WVP9R
	jX5THshyGihQ7mlkuX75UbY8vQfiEod7WAzm2eSVZGTByy/w/HOdtJhwrsq8I0row8T2Kq5G9F+Uk
	+WAJi0X2XrmycIjpZhMojEKW7PJxL4csgIXWA93RvVWBlO7a0rouPOtBkzkftsStBKT2uxmU+K7D1
	ijwzvrhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua3ro-0000000DYV5-3Smo;
	Fri, 11 Jul 2025 02:52:04 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua3pT-0000000DYMG-0qqp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 02:49:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752202179; x=1783738179;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LLjZv6YaeoDc4SEEKroZA66mxOHL4zJDsp3M43OYKV4=;
  b=R6u1IPPBIvw2NAHwoboWMRr5VsAzFYmLs/nuVlOYZOVDzOBb1ozCLeLm
   /ti4O2OqpAYLyQT7WnOHNOlIYoiOlwGDs+qZJkvHawz2r/r6JYQZK5Ugi
   4qsi1BG7CkrkBnK8lLpO5LqApI6MHj655U6EHsW4VMIqD3YjPq4YgwVBF
   mhBK6U733CODKX/sxwgPHKi6mcxVJoeaHRACHpIx8WBgiduI6poZW4Xr0
   JLM+EJnolnM9aN55R8YMiCMSAdE+1x6ILo2x3kaoPRkdEggHc23oWKC/1
   hjOH+isthc0CEjhWIAaXioSYqyj28oFvz+GEj0NGQKq+ssSe8OZpDIapd
   Q==;
X-CSE-ConnectionGUID: jqxEGWTUQtes2WeTcU3cAw==
X-CSE-MsgGUID: x8NIuYPpTO6/IQuW8Rsb7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="53604577"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="53604577"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 19:49:35 -0700
X-CSE-ConnectionGUID: diX3w/CCSQOd3a1b8DOe9A==
X-CSE-MsgGUID: 6Z1BSWOoSwiK5I6R6DFClw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="161817339"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Jul 2025 19:49:28 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ua3pG-0005l9-01;
	Fri, 11 Jul 2025 02:49:26 +0000
Date: Fri, 11 Jul 2025 10:48:44 +0800
From: kernel test robot <lkp@intel.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	Konrad Dybcio <konradybcio@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Elliot Berman <elliotb317@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Stephen Boyd <swboyd@chromium.org>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	Andre Draszik <andre.draszik@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH v10 01/10] power: reset: reboot-mode: Add device tree
 node-based registration
Message-ID: <202507111052.smU9DwLS-lkp@intel.com>
References: <20250710-arm-psci-system_reset2-vendor-reboots-v10-1-b2d3b882be85@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-arm-psci-system_reset2-vendor-reboots-v10-1-b2d3b882be85@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_194939_257556_FC60B1A3 
X-CRM114-Status: GOOD (  12.11  )
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

Hi Shivendra,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 58ba80c4740212c29a1cf9b48f588e60a7612209]

url:    https://github.com/intel-lab-lkp/linux/commits/Shivendra-Pratap/power-reset-reboot-mode-Add-device-tree-node-based-registration/20250710-172104
base:   58ba80c4740212c29a1cf9b48f588e60a7612209
patch link:    https://lore.kernel.org/r/20250710-arm-psci-system_reset2-vendor-reboots-v10-1-b2d3b882be85%40oss.qualcomm.com
patch subject: [PATCH v10 01/10] power: reset: reboot-mode: Add device tree node-based registration
config: riscv-randconfig-002-20250711 (https://download.01.org/0day-ci/archive/20250711/202507111052.smU9DwLS-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250711/202507111052.smU9DwLS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507111052.smU9DwLS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/power/reset/reboot-mode.c:15: warning: "pr_fmt" redefined
      15 | #define pr_fmt(fmt)     "reboot-mode: " fmt
         | 
   In file included from include/asm-generic/bug.h:28,
                    from arch/riscv/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from arch/riscv/include/asm/current.h:13,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/power/reset/reboot-mode.c:6:
   include/linux/printk.h:397: note: this is the location of the previous definition
     397 | #define pr_fmt(fmt) fmt
         | 


vim +/pr_fmt +15 drivers/power/reset/reboot-mode.c

    13	
    14	#define PREFIX "mode-"
  > 15	#define pr_fmt(fmt)	"reboot-mode: " fmt
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

