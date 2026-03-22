Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC73FFC72C5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Mar 2026 14:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Q3D5UodZCeTWd6dbr4yequOrylCC4hXWkSBxOD/kow=; b=WcC8CYV8KxG15lKWBMv+ghyNL5
	7SPwFkfsi9HqsS+BOaBdrg46XsoMn36Pr+kkJCN3d26vn/hRtz9v1+kbwrtLW6KwFjpvwSVEA7FYG
	7rNyzePY74f5k3HACQGeSq8aqhKT+dFoE9ncnJ4oSWyx61PcucqQXRN2bhp+x8xEtgxCZuekLU9/W
	bga8IMFSrpHHvN13vEqKjcgZvyfn5ji/IDfGlfdYzM6TTVzwcqmVP15Z/HPmR1MNTi4eWTgOpeDUY
	za+tzn9CWboc6BNo8xNUyGkhPreEPhxdJ2LYb9Rk3uuOTnANrR1+7/5Q+b/yV0HRElMHTjlSHbujx
	PrWhH+gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Jb8-0000000FPAo-19jb;
	Sun, 22 Mar 2026 14:16:10 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Jb5-0000000FPAU-2s5B
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Mar 2026 14:16:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774188967; x=1805724967;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IigGF6U3blVwl7+mttTv8ABlCNI5lUMx+1rU3nKGGxA=;
  b=Uydeq0/W5NPZOKK6bwS0ZZoosmSOWdnVEsVke2fQ9MDjqff0isLb85OE
   ElCYvVy3QK2C39upZKNtmInV5kemTDoMXdc4nvRFgcsvypy18uj/MYJfP
   L3bzY93DGUbebEIP5ufBR2psKH6Wwv5knC16noD/bnbaAF299zyKfrTdu
   kjqB29Z9YrTQIfF7W7GcksXBdypwG7Tbj7Vquha4qnGSzexM3tf34hKQd
   zLbffv9GCrF3CGuxpUOLOzOBOdlqyLKNpSLeDX876dRgJTDc0uHBjG981
   QJMQozmvHTmPaCh+Kij7JWx7khzzZ4I6kUfWmycVeOCBtmPa8elwFCNoy
   A==;
X-CSE-ConnectionGUID: SkH9h+/MSRGW0hHaZbkEiQ==
X-CSE-MsgGUID: wgveC2FGRh+A6s7ES37OEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="62765357"
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="62765357"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 07:16:05 -0700
X-CSE-ConnectionGUID: JRLBnVVlSqa6fLyDLAUY4Q==
X-CSE-MsgGUID: qbzVjqmzRUKzhYMJv9+fAA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 22 Mar 2026 07:16:00 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4Jav-000000002Dx-1Ld7;
	Sun, 22 Mar 2026 14:15:57 +0000
Date: Sun, 22 Mar 2026 22:15:01 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Klimov <alexey.klimov@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexey Klimov <alexey.klimov@linaro.org>
Subject: Re: [PATCH 4/5] mailbox: exynos: Add support for Exynos850 mailbox
Message-ID: <202603222239.JTuBxs7K-lkp@intel.com>
References: <20260320-exynos850-ap2apm-mailbox-v1-4-983eb3f296fc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-exynos850-ap2apm-mailbox-v1-4-983eb3f296fc@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_071607_762313_04104A12 
X-CRM114-Status: GOOD (  11.16  )
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

Hi Alexey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Klimov/dt-bindings-clock-exynos850-Add-APM_AP-MAILBOX-clock/20260322-085441
base:   785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
patch link:    https://lore.kernel.org/r/20260320-exynos850-ap2apm-mailbox-v1-4-983eb3f296fc%40linaro.org
patch subject: [PATCH 4/5] mailbox: exynos: Add support for Exynos850 mailbox
config: x86_64-buildonly-randconfig-004-20260322 (https://download.01.org/0day-ci/archive/20260322/202603222239.JTuBxs7K-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603222239.JTuBxs7K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603222239.JTuBxs7K-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/mailbox/exynos-mailbox.c:60 struct member 'irq_mask_value' not described in 'exynos_mbox_driver_data'
>> Warning: drivers/mailbox/exynos-mailbox.c:60 struct member 'irq_mask_value' not described in 'exynos_mbox_driver_data'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

