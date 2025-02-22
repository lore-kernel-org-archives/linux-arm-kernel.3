Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36AA9C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 14:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Y0JvpEoV6NsVStd76DFiU0ugL16h2lmkndqINTg8pE=; b=OAswxiVpx5ercetZZYVboF46sw
	mdONtOm+6SgLguCxaLDD67cho0RtCfZoAyS7jeCFPAOamb9IrTTe5F61VrLvBAbpRtj5Z7cBJQAWM
	t4ILevk3bIVgjl2y2AxZOmGVJ/BtSpMf6KAu7GQcfn6tzzcsme5+5KiCsDcuEt1s/Jf03WknpUGUN
	gcLWAcW40aKKI7nNSlrU/kfA9rEvHzsW1oQB0JPrriyg1DtGtDC/blJuK70PSS44KpxIgeB+UfYwm
	WEZRHXlmkCick9WX7t5juBUGztxaoGTBstwQ54Kqr/WSQedq70GTep5CE/LY3PoGXZm6dKtq1mXR9
	TLJdznhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlq70-000000087cG-2lRU;
	Sat, 22 Feb 2025 14:04:10 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlq5W-000000087X7-35IG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 14:02:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740232958; x=1771768958;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cqLdn3pSfdlFMz8BT1qTRt7U9h2eoJo3ZzvxPRvlrbM=;
  b=fwDKw5k14xHBcS/vQyvXl/wV0ddd3/fp7G8ClVBGM0u6jG+5Z8MuPzIW
   WoWK5XohjGguVf82zo+e1g3ruzDf7HvNysyplCYnuMEqczuvGN1HZiIXn
   CHLvPi+NemLCEMKOyqQVnSNnERdNnfC1RgAK7W9aybgI8dkC4v1wEiHP8
   p1jVDQykYz19GzQnqYGR27tgNL6Ze4/AalW26e05nBiFJCUIAkDPR709B
   WQ+mrX2rivL+ohpOfE2AUqEce4hKprcVFUq8nRHC6EdNueZacLHqpxgbA
   T6rVoCYKpWzJElXiSWceBQfsFimxQ7wc2iSYdgHFI2OHdl9ha9Z4c8fpI
   w==;
X-CSE-ConnectionGUID: ql14wSimQ4SZox2G4y+Hvg==
X-CSE-MsgGUID: Et2vJU1OTainyvLILC+lYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41247809"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41247809"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 06:02:35 -0800
X-CSE-ConnectionGUID: YpbMq6JwSYqlDX5v5TKBPw==
X-CSE-MsgGUID: 5foC5zoJSDSp20UImXrUdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="120722829"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 22 Feb 2025 06:02:32 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlq5N-0006d5-2d;
	Sat, 22 Feb 2025 14:02:29 +0000
Date: Sat, 22 Feb 2025 22:01:32 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Eggers <ceggers@arri.de>,
	Russell King <linux@armlinux.org.uk>,
	Yuntao Liu <liuyuntao12@huawei.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, ceggers@gmx.de,
	Christian Eggers <ceggers@arri.de>, stable@vger.kernel.org
Subject: Re: [PATCH] ARM: add KEEP() keyword to ARM_VECTORS
Message-ID: <202502222158.UhwuvDZv-lkp@intel.com>
References: <20250221125520.14035-1-ceggers@arri.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221125520.14035-1-ceggers@arri.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_060238_889272_F22C4405 
X-CRM114-Status: GOOD (  12.57  )
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

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on soc/for-next]
[also build test ERROR on linus/master v6.14-rc3 next-20250221]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Eggers/ARM-add-KEEP-keyword-to-ARM_VECTORS/20250221-205720
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20250221125520.14035-1-ceggers%40arri.de
patch subject: [PATCH] ARM: add KEEP() keyword to ARM_VECTORS
config: arm-randconfig-003-20250222 (https://download.01.org/0day-ci/archive/20250222/202502222158.UhwuvDZv-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502222158.UhwuvDZv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502222158.UhwuvDZv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: ./arch/arm/kernel/vmlinux.lds:33: ( expected, but got }
   >>>  __vectors_lma = .; OVERLAY 0xffff0000 : AT(__vectors_lma) { .vectors { KEEP(*(.vectors)) } .vectors.bhb.loop8 { KEEP(*(.vectors.bhb.loop8)) } .vectors.bhb.bpiall { KEEP(*(.vectors.bhb.bpiall)) } } __vectors_start = LOADADDR(.vectors); __vectors_end = LOADADDR(.vectors) + SIZEOF(.vectors); __vectors_bhb_loop8_start = LOADADDR(.vectors.bhb.loop8); __vectors_bhb_loop8_end = LOADADDR(.vectors.bhb.loop8) + SIZEOF(.vectors.bhb.loop8); __vectors_bhb_bpiall_start = LOADADDR(.vectors.bhb.bpiall); __vectors_bhb_bpiall_end = LOADADDR(.vectors.bhb.bpiall) + SIZEOF(.vectors.bhb.bpiall); . = __vectors_lma + SIZEOF(.vectors) + SIZEOF(.vectors.bhb.loop8) + SIZEOF(.vectors.bhb.bpiall); __stubs_lma = .; .stubs ADDR(.vectors) + 0x1000 : AT(__stubs_lma) { *(.stubs) } __stubs_start = LOADADDR(.stubs); __stubs_end = LOADADDR(.stubs) + SIZEOF(.stubs); . = __stubs_lma + SIZEOF(.stubs); PROVIDE(vector_fiq_offset = vector_fiq - ADDR(.vectors));
   >>>                                                                                           ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

