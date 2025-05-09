Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBCFC3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 00:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L89/IglAzebhYjNeLn1LyP6815QV69L//e8GCNfod6s=; b=DOm0CvYeEIp86dyVG7oQaUM0Jx
	eiEC0hgdV4l66jhcTpx0mz3nk7cafxXKknnIckbjmnkhYnvYipchQrwa2g5cnME2w9FxBrpv9oOwc
	qMQ1SSqIXgX2IG08HahhC7xswQxe6xbfj/HsXUGrCNvV5uMi7a5muK9EenEQs00ghZItHzxfajpve
	wsvYPznziPAUi29tjf6oUJm8bZVsUjisLuHXz9c7KzSoAA3CVfYFLPrMIuTiCfv4ZhJTi5ol0TR1c
	bOu6shJCZtvyLlmF8Dc1TQnl3yrtBBN80/D2v1ZTVZ6kDPnpXNG9ikL4BysPc5ejxrW23KXAbKklz
	gTYDaneQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDC2R-000000028vv-0OVi;
	Fri, 09 May 2025 00:56:31 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDBuK-0000000284R-3CUX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 00:48:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746751688; x=1778287688;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9l4UtHuSQviUswa9qLhvtxA1wFY9WmoH5OETvZtJ/+o=;
  b=Vb/MblTjRqdlZTHZchd5cE71NZOidMT7c2xCU2u78yQzjQwrZNZbmhgD
   SLiKhDr4jluUjaSD5w94pFGwtKwxjCi0UAvNjOcGa6Xs4zftN7cO2mBFa
   ASww8pUM117KDbHeh4uaQHyg86je/ZVDfEv/gr6cZzToqlxq99OSw4BNH
   rPtydZ6YF4+0UarSbwbvysdxAqrSjXHfxM2GoP2StNxTuS4/kuAaL6Y85
   rzTN/+KbMOziyTL1s1B7zSxYFKkl1JRP8v0EDf2nTfKiGTObxPZ2knzl+
   dyIoqcos0fA7l2KuuPMEGnTMfky0y0X8H8czOxUi8EWWciHwThePrWJFH
   A==;
X-CSE-ConnectionGUID: oQHXGLbTT7iz1m/RCh5jmw==
X-CSE-MsgGUID: QgQZGCxCRTCUfw5gkF6XVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48471305"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="48471305"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 17:48:08 -0700
X-CSE-ConnectionGUID: puZOYG22Q1q76b9afePLiA==
X-CSE-MsgGUID: 4Tb1fB3hSKWfSBG8Pmij3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="141372306"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 May 2025 17:48:04 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDBuE-000BVr-0Y;
	Fri, 09 May 2025 00:48:02 +0000
Date: Fri, 9 May 2025 08:47:04 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v3 24/25] irqchip/gic-v5: Add GICv5 ITS support
Message-ID: <202505090857.dvSPkqHI-lkp@intel.com>
References: <20250506-gicv5-host-v3-24-6edd5a92fd09@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506-gicv5-host-v3-24-6edd5a92fd09@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_174808_845254_F81B6576 
X-CRM114-Status: GOOD (  10.79  )
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

Hi Lorenzo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0af2f6be1b4281385b618cb86ad946eded089ac8]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Pieralisi/dt-bindings-interrupt-controller-Add-Arm-GICv5/20250506-203528
base:   0af2f6be1b4281385b618cb86ad946eded089ac8
patch link:    https://lore.kernel.org/r/20250506-gicv5-host-v3-24-6edd5a92fd09%40kernel.org
patch subject: [PATCH v3 24/25] irqchip/gic-v5: Add GICv5 ITS support
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505090857.dvSPkqHI-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/irqchip/arm-gic-v5.h: linux/iopoll.h is included more than once.

vim +8 include/linux/irqchip/arm-gic-v5.h

     7	
   > 8	#include <linux/iopoll.h>
     9	
    10	#include <asm/cacheflush.h>
  > 11	#include <linux/iopoll.h>
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

