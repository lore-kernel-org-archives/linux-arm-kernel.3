Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF46C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 20:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zRvJBG7XTSycUxxt5zdP43ky6wtHNMh8xw+LW4doH7w=; b=1mWLowMb/6o0yzZiKtyMRYF7aP
	QUrKm4tLuCtts9q2d1DXMP5TNr7et3xuW+0Rbgat8d0A54x7QAaLgFw2dszq8GDEB9XzgeSLgsk2b
	QZVPErLo40+qEsWjcIKBNlyekIYv5CQWamH9rP2RL0A5MwrbTpwW21l4IgyqdQeQGc5g6s5m1ROWj
	taPzrX80T8MP/qiFurJMBYEvvTU6q6WJHPEI8vPCUSGDyc5nxRt4YHVDFT/8s/0oosUGm8ruRvO1y
	x5WlKmY7yjAM+9MFPRl/b63BRhhShJx9JUwmHeqU89T/hl8kP904m3Hqnf0IaNfSHL9kr6Fxhol//
	sXtp0HIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSMGR-0000000EFqa-10ja;
	Thu, 19 Jun 2025 20:53:39 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLmc-0000000EC6D-26eJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 20:22:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750364570; x=1781900570;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1306ugvPqvYx0GNhUobnRO2BRmD0tvRO5GZ6dyr69A0=;
  b=cl3PoDbmMfVvG45W/kk7fJtmruhqyZ5haKf8WUHoZy/gWDGlaRuhitgQ
   e1AjzkmEV7X0MYhXoyxhHh+maUmLlWIgHhaWnNdZiR2gipRqDgMfNUrWu
   z/3i5yfN0yHdZ6na/9tVRtl8LLVHMZbUiAH9wYhdyd+67beykhk7wXTEd
   JJre7q3bnLSse5g7+IJWaOGIvwWUf1v7fclWYjC/8oVRig9EWBKyQ/WG4
   QO0h7H3RUrurD/lmhqt6mRIdiHvPUyPEDqqd7R8BZeAY2+xxPAlh/Kf/7
   lUmqONatw7JNjfVUiY4kKUWRdMyzuyEiTfRFpk/GB49hhwpR6prhGvJFF
   w==;
X-CSE-ConnectionGUID: lIFABUeiQ6Cz7E8rTHMNHg==
X-CSE-MsgGUID: YpSlK8aERgW64Ndjfha78A==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="51852708"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="51852708"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 13:22:47 -0700
X-CSE-ConnectionGUID: HbfmO9QBTz2wrgvuPHbqPA==
X-CSE-MsgGUID: fjTzpWQ/Sxa+NwOTsif4Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="155290205"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Jun 2025 13:22:41 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSLmQ-000L5G-2H;
	Thu, 19 Jun 2025 20:22:38 +0000
Date: Fri, 20 Jun 2025 04:22:00 +0800
From: kernel test robot <lkp@intel.com>
To: Will McVicker <willmcvicker@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Will McVicker <willmcvicker@google.com>,
	Donghoon Yu <hoony.yu@samsung.com>,
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	John Stultz <jstultz@google.com>,
	Youngmin Nam <youngmin.nam@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 5/6] clocksource/drivers/exynos_mct: Add module support
Message-ID: <202506200445.1vdWU11a-lkp@intel.com>
References: <20250618210851.661527-6-willmcvicker@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618210851.661527-6-willmcvicker@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_132250_559306_DE08209F 
X-CRM114-Status: GOOD (  11.71  )
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

[auto build test WARNING on tip/timers/core]
[also build test WARNING on arm64/for-next/core robh/for-next linus/master v6.16-rc2 next-20250619]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Will-McVicker/of-irq-Export-of_irq_count-for-modules/20250619-051424
base:   tip/timers/core
patch link:    https://lore.kernel.org/r/20250618210851.661527-6-willmcvicker%40google.com
patch subject: [PATCH 5/6] clocksource/drivers/exynos_mct: Add module support
config: arm-multi_v7_defconfig (https://download.01.org/0day-ci/archive/20250620/202506200445.1vdWU11a-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506200445.1vdWU11a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506200445.1vdWU11a-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: mct_init_dt+0x164 (section: .text) -> register_current_timer_delay (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: mct_init_dt+0x178 (section: .text) -> sched_clock_register (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mct_init_dt+0x20c (section: .text) -> register_current_timer_delay (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mct_init_dt+0x220 (section: .text) -> sched_clock_register (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

