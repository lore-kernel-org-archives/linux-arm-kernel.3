Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7362E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Dec 2024 05:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oEZtiqj94vqTkyD0aNnVoV6+qzpRn2cgCci9mxRlk6Y=; b=vh0WlhvU5qIe+Z+VUD48cyZDmy
	nV9GglrwzjVLq/GG66BoOJfhnoSfM8bEPQ0QCRDmhkr78BHRM+69sk+56axMV1pHadYCDDrgprLRu
	FD3kwgNBV0KXJhPhUgazh0yRD9+atoRZkBnHldauhr59MrId2tM7GFmT10seYbR50+BbtUTjL5W8q
	KsIeB6mdJiyU7XyEwvEo91ISYhtE0ZId8dloltaXf39iX4FvuacUM4UQnFmxlm897QwgTUbx/FOmJ
	NR1/Wogyh8z6HVpcvLrwzw4Pmuoyxz+Hn6d/7ImaNJFKGKGYgfb4gYuq7eGWtlNjx+5AWNoOcnnDj
	JEenuoFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRP9B-00000001PRi-1RUH;
	Sat, 28 Dec 2024 05:13:57 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRP7w-00000001PLd-3muX;
	Sat, 28 Dec 2024 05:12:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735362762; x=1766898762;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ioBF6btaLkebkM4HUjVJqFMRdhQwf4/nTJIficbpk6U=;
  b=GKMGtEZTbzpRyRGr5dTyb1MIEfxfhoft/xKMmwjA5mNtd8uMJRtGt/5f
   3OJUtbNALr5PBKaNEUgTBaq5v+ypT1T+48sWwGhyOHGMzsY/AwaE8amw+
   N2jaWuwlBd9hiOEHaez6ojs8BqRWiqktWLak7pJ2Sc7CZjU7JuPxs30+S
   zQOAwUDrEynN78LBycSnWolVdhApivKcUH6xj93e6KictnplqkWBtgDV+
   cp2HAy7O+il+PJKdY80fc8geSW6LEdNdX4dYzv0Bbj1+QgNBKSAqzY4U2
   Dtj97sD+Efb80ZY85H5ihJDArtnJiv2kqaYnCXEMnfDLC0RLuAF8pdW4l
   w==;
X-CSE-ConnectionGUID: a4uGGLRPRPqEGPCIysr0aw==
X-CSE-MsgGUID: 5gamfRA+T9OgXFBCbhGOMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35886908"
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="35886908"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 21:12:38 -0800
X-CSE-ConnectionGUID: h4uyA0ddSTuuZ4tzLd9DvQ==
X-CSE-MsgGUID: Go8sLyvHTGyzRo44j8EaKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="131267180"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Dec 2024 21:12:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRP7m-0003rw-0r;
	Sat, 28 Dec 2024 05:12:30 +0000
Date: Sat, 28 Dec 2024 13:11:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 03/12] input: keyboard: omap4_keypad: Use
 devm_pm_set_wake_irq
Message-ID: <202412281211.h6tPLOqJ-lkp@intel.com>
References: <20241228-wake_irq-v1-3-09cfca77cd47@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241228-wake_irq-v1-3-09cfca77cd47@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_211241_043673_37F8CCA2 
X-CRM114-Status: UNSURE (   8.08  )
X-CRM114-Notice: Please train this message.
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

Hi Peng,

kernel test robot noticed the following build errors:

[auto build test ERROR on 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan-OSS/PM-sleep-wakeirq-Introduce-device-managed-variant-of-dev_pm_set_wake_irq/20241228-091859
base:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
patch link:    https://lore.kernel.org/r/20241228-wake_irq-v1-3-09cfca77cd47%40nxp.com
patch subject: [PATCH 03/12] input: keyboard: omap4_keypad: Use devm_pm_set_wake_irq
config: i386-buildonly-randconfig-002-20241228 (https://download.01.org/0day-ci/archive/20241228/202412281211.h6tPLOqJ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412281211.h6tPLOqJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412281211.h6tPLOqJ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_inflate/zlib_inflate.o
>> ERROR: modpost: "devm_pm_set_wake_irq" [drivers/input/keyboard/omap4-keypad.ko] undefined!
WARNING: modpost: module snd-compress uses symbol dma_buf_fd from namespace DMA_BUF, but does not import it.
WARNING: modpost: module snd-compress uses symbol dma_buf_get from namespace DMA_BUF, but does not import it.
WARNING: modpost: module snd-compress uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

