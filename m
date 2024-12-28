Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B27E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Dec 2024 05:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=19zLUJniSMt2LNOd05dk7idqQfxFGWeilURd4+JjHAQ=; b=r/lwO/MYaDJWAk4eocJ7utF1jQ
	3JEFiQxVTSRb5ANtczk8YSuCs+3R72oXIBY5DfupULU+17DFQcHgIsttLO0sQu3wNi5Tfaw+padCP
	fwOMjEAzirSczu5TvMV0ziDqgBasnRgtGQIjMRi/T9ST3C5Mc8tU0e1uU1DXssVNY8D3LXIv1OpFH
	pkcIp0wh6psHdbLt8LDlXLRnz5F3ZitCX8/802/wPdRvqsnGzAkKuf0vWVhBF+CX27yqJZNH9NPcU
	eeqtI6xptYp1jyIioKCbSWjXaPwucgrpvBcamBlXKA34PuzasTUB4qSvfPq2sKK1vHE2288OmYA5l
	U3wcrmkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRPe8-00000001RFw-2FXx;
	Sat, 28 Dec 2024 05:45:56 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRPcu-00000001RA2-4BOQ;
	Sat, 28 Dec 2024 05:44:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735364681; x=1766900681;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7+MJqD3C48EXjWCp0o71PXcfiXhqzoReRXFzpsHCzo0=;
  b=N77EwN1gnb2zMIZ0/r7QHBCxMR9dgzaOlAVNuFusPQhuWcv6LtJHYsU7
   e9tmI2RUkhv4X7so4IrHnE0JEZ638XkmexQIhsatGIsMBZeT4l7N4r4Ik
   /wSjqxZUG+FgXNLtFftjn7y9a/CY4FNDlUye1Q3oGu0kR45zzEJrYGYMV
   OSuOPyo/qV4Fv6lKMvkXfqGoi4YFzl1Uaf8jn4OG4wHc+xd12VZriokll
   ZyL2IJAOD+QdeU8uYI0y65qmEIeW6oAgXik4N393XjNp88j1VNzHECsHg
   QbqgmDy6zex8j4mrpMBYqIjYbG9/Ualh4CfHwr7V6fJ8SkySEaEFBhFNm
   A==;
X-CSE-ConnectionGUID: qrDfo4bCRv6S3wr4p0suUA==
X-CSE-MsgGUID: X/XqDeQESvynSH8r2t6bZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35864193"
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="35864193"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 21:44:40 -0800
X-CSE-ConnectionGUID: BbyMppGaSKywwZy7sbq9gg==
X-CSE-MsgGUID: XIGLvPlGQVWDxl/TReHwHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="100492194"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Dec 2024 21:44:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRPcm-0003tE-25;
	Sat, 28 Dec 2024 05:44:32 +0000
Date: Sat, 28 Dec 2024 13:43:46 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 06/12] rtc: stm32: Use resource managed API to simplify
 code
Message-ID: <202412281302.N1Bd2W48-lkp@intel.com>
References: <20241228-wake_irq-v1-6-09cfca77cd47@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241228-wake_irq-v1-6-09cfca77cd47@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_214441_120229_250634FF 
X-CRM114-Status: UNSURE (   8.33  )
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
patch link:    https://lore.kernel.org/r/20241228-wake_irq-v1-6-09cfca77cd47%40nxp.com
patch subject: [PATCH 06/12] rtc: stm32: Use resource managed API to simplify code
config: arm64-randconfig-003-20241228 (https://download.01.org/0day-ci/archive/20241228/202412281302.N1Bd2W48-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412281302.N1Bd2W48-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412281302.N1Bd2W48-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o
ERROR: modpost: "devm_pm_set_wake_irq" [drivers/input/touchscreen/ti_am335x_tsc.ko] undefined!
>> ERROR: modpost: "devm_pm_set_wake_irq" [drivers/rtc/rtc-stm32.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

