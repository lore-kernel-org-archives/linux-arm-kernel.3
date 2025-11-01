Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB7CCCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 16:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9UR7/7fOLoOvUFsxoiASa+OB6Ugh6g8RrSXSHMskV8=; b=0Kpd+pO34lY2oajRlO+57slwJt
	HFeEhed9xQOcAsORbKNws6yZw+IMuElI4YvUSz9xcn9aFcjlw5CehUFFSYephls/9DEcQz06EEpuM
	lPQmhAwQ8Z9F6ni6VJbhz/aVejLnI7ZtJCTxM3as2aV2rOKxk1jI2JeKT55Mm5HwTE5bvcGy70y4c
	xIZDUL8mUx4i6BmuwjWSaYoCkBoiap7fIc484mjoBmyJAPyWYsTtFN2c7I0XTnTQUwdxZJ9ie4iMd
	VbyouFuFzMgL0cd/+GJx7pZAWhMLpUyw5wTO6846gLRidtj2s5JBS6V96v/IsxKD1kHcV0uPcLiyj
	IZhXA2PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFEQK-00000007vic-2zGr;
	Sat, 01 Nov 2025 16:25:52 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFEQI-00000007viB-1R4J
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Nov 2025 16:25:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762014350; x=1793550350;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pPFMBUE3E/n+AfJdNxDIBYoEpsa4YYKIvKgatrJJXhE=;
  b=VXNH+2c1J+P5CAPWd1eoIPmLZ4Hcjd96BxIm3g9Z2RnaD0q3AyXCRMFJ
   Mjc5kBD46paQbeRiyjSx75PfIAjGARamID3Pdlrjp0Oc1U6dMkj3UBCDd
   Y9uRWfXUKctU0qFFumxOmbRtNUcVyBCFQiTvJfWr3JAohB+ZEQFPLds7t
   0DnKqUTMxvKTPJ0/tI9kjvE/NVvhnu681MNHQ+UbwoYM88A3fL7DtociG
   pAutT9uLfA2fHrsrLasU7fspNyaIR6CaGly+oCKOVdxgU+59GTQ10+zco
   Hd1bQyA4j62W5qwSKwodKALiSBH3e1AdnWeBGKzHIop7r/zEr8LT6D+83
   w==;
X-CSE-ConnectionGUID: PUa6Pqg2TY6MjsMegAUXrw==
X-CSE-MsgGUID: vuPD0zEZR7W5XrWueSD3gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="81566511"
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="81566511"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 09:25:48 -0700
X-CSE-ConnectionGUID: /34bxfPXTfi+RPw7sLLQwg==
X-CSE-MsgGUID: 66b9k+8qQo6oJv7sbFfA9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="186940434"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 01 Nov 2025 09:25:44 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFEQA-000OSu-1r;
	Sat, 01 Nov 2025 16:25:42 +0000
Date: Sun, 2 Nov 2025 00:25:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>,
	Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Vishal Mahaveer <vishalm@ti.com>,
	Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	"Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
Subject: Re: [PATCH v9 3/3] firmware: ti_sci: Partial-IO support
Message-ID: <202511020037.8sAseAYs-lkp@intel.com>
References: <20251030-topic-am62-partialio-v6-12-b4-v9-3-074f55d9c16b@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030-topic-am62-partialio-v6-12-b4-v9-3-074f55d9c16b@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_092550_446890_89D9FE58 
X-CRM114-Status: GOOD (  10.47  )
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

Hi Markus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c9a389ffad27e7847c69f4d2b67ba56b77190209]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Schneider-Pargmann-TI-com/firmware-ti_sci-Remove-constant-0-function-arguments/20251030-173054
base:   c9a389ffad27e7847c69f4d2b67ba56b77190209
patch link:    https://lore.kernel.org/r/20251030-topic-am62-partialio-v6-12-b4-v9-3-074f55d9c16b%40baylibre.com
patch subject: [PATCH v9 3/3] firmware: ti_sci: Partial-IO support
config: arm-randconfig-002-20251101 (https://download.01.org/0day-ci/archive/20251102/202511020037.8sAseAYs-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251102/202511020037.8sAseAYs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511020037.8sAseAYs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/ti_sci.c:10:9: warning: 'pr_fmt' macro redefined [-Wmacro-redefined]
      10 | #define pr_fmt(fmt) "%s: " fmt, __func__
         |         ^
   include/linux/printk.h:402:9: note: previous definition is here
     402 | #define pr_fmt(fmt) fmt
         |         ^
   1 warning generated.


vim +/pr_fmt +10 drivers/firmware/ti_sci.c

aa276781a64a5f Nishanth Menon 2016-10-18 @10  #define pr_fmt(fmt) "%s: " fmt, __func__
aa276781a64a5f Nishanth Menon 2016-10-18  11  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

