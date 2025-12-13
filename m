Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08424D5B152
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 10:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4cS4tVfoy6096YwcGyqnlAXaJbgf7G1c8u4VErwhrg0=; b=tNFQ0wew/jp2lRqiG1uZemRFwU
	cULnB8a/xyEAN8B5xJuZWxnH+Ymyadk3h03tCxTFn43KnB/plYw1RmzVuVIhrGQrrgftYIV9fXjrM
	B9tZNtRLzmkg9hwwvt2zS9kfMWx10xjyEUVn/TDQlu4is6rHdGSqWTycVNuY8MWTjFOhR5JbLDjHO
	fvbL1nMrCeOmXXPartIouQvNkuUjw3thGnNEk4BMEDD0y26vIjPdaCggGfpzI93Sdf98Xa9wqkj1f
	SztT2dNG6LvrD18BmVLNw8eaQyFERlTst5DKuHa0owbafvSAOOCK16pmtPhFqVVrAjOCx1e7KGxE4
	cKufU5/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUMbF-00000001a16-2chk;
	Sat, 13 Dec 2025 10:11:41 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUMbB-00000001a0g-4BVs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Dec 2025 10:11:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765620698; x=1797156698;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CZ0nbq+TNEdlal6qWlcjS6ghxXVLkuG29vXwxsczpXE=;
  b=Dgx49wfKg5vnz/ShZD0aY5TnjbwB9u45nhDD5BykCUoJj48MFVsnyqET
   PyG0IE3kMeUm91pPGj1jyOYCPFeC7M3vh1c69grB08ocSHTncXE220W/3
   OotP2Zd+dABFcZ3+pbP+i29eClzkQN9KwOAfKA9qZZByuBtAaNBMM7GJu
   KeJDBYwsYZKLncCgGNXd8TraL00VzQS2V8vB9rqV6y/FirnonpmRoJQt3
   CfSEqlytyMy2xPOMN9LciG7t8Ft6l31NW/b7omiLanm1vNeKfihTlZuwb
   lORSisOmjaIvQIWkI0Tuv6rnIna6Ze5dvVB67rckOyLmoDCWfLjeRco4R
   w==;
X-CSE-ConnectionGUID: ojlE40glRByguTu9E51Khw==
X-CSE-MsgGUID: Y1EDsXPcTcaFmbbzSQVatA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71456388"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="71456388"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 02:11:31 -0800
X-CSE-ConnectionGUID: b0ctH/KrRUSaT01kkNxKSw==
X-CSE-MsgGUID: rjbF0X8iS1+LSKVj5U9vFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="197050364"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Dec 2025 02:11:29 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUMb0-000000007U9-2hay;
	Sat, 13 Dec 2025 10:11:26 +0000
Date: Sat, 13 Dec 2025 18:10:43 +0800
From: kernel test robot <lkp@intel.com>
To: Osama Abdelkader <osama.abdelkader@gmail.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: Re: [PATCH] arm64: hw_breakpoint: warn on invalid breakpoint length
Message-ID: <202512131730.89TvJc2D-lkp@intel.com>
References: <20251212205230.84606-1-osama.abdelkader@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212205230.84606-1-osama.abdelkader@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251213_021138_081458_FDB30DCC 
X-CRM114-Status: GOOD (  13.61  )
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

Hi Osama,

kernel test robot noticed the following build errors:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on arm-perf/for-next/perf linus/master v6.18 next-20251212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Osama-Abdelkader/arm64-hw_breakpoint-warn-on-invalid-breakpoint-length/20251213-045501
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20251212205230.84606-1-osama.abdelkader%40gmail.com
patch subject: [PATCH] arm64: hw_breakpoint: warn on invalid breakpoint length
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251213/202512131730.89TvJc2D-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131730.89TvJc2D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131730.89TvJc2D-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/hw_breakpoint.c:483:17: warning: missing terminating '"' character [-Winvalid-pp-token]
     483 |                         pr_warn_once("hw_breakpoint: invalid AArch64 breakpoint length %d,
         |                                      ^
   arch/arm64/kernel/hw_breakpoint.c:484:24: warning: missing terminating '"' character [-Winvalid-pp-token]
     484 |                                 fixing to 4 bytes\n", hw->ctrl.len);
         |                                                    ^
>> arch/arm64/kernel/hw_breakpoint.c:483:4: error: unterminated function-like macro invocation
     483 |                         pr_warn_once("hw_breakpoint: invalid AArch64 breakpoint length %d,
         |                         ^
   include/linux/printk.h:669:9: note: macro 'pr_warn_once' defined here
     669 | #define pr_warn_once(fmt, ...)                                  \
         |         ^
>> arch/arm64/kernel/hw_breakpoint.c:1014:2: error: expected '}'
    1014 | }
         |  ^
   arch/arm64/kernel/hw_breakpoint.c:476:52: note: to match this '{'
     476 |                 } else if (hw->ctrl.len != ARM_BREAKPOINT_LEN_4) {
         |                                                                  ^
>> arch/arm64/kernel/hw_breakpoint.c:1014:2: error: expected '}'
    1014 | }
         |  ^
   arch/arm64/kernel/hw_breakpoint.c:471:47: note: to match this '{'
     471 |         if (hw->ctrl.type == ARM_BREAKPOINT_EXECUTE) {
         |                                                      ^
>> arch/arm64/kernel/hw_breakpoint.c:1014:2: error: expected '}'
    1014 | }
         |  ^
   arch/arm64/kernel/hw_breakpoint.c:417:1: note: to match this '{'
     417 | {
         | ^
   2 warnings and 4 errors generated.


vim +483 arch/arm64/kernel/hw_breakpoint.c

   410	
   411	/*
   412	 * Construct an arch_hw_breakpoint from a perf_event.
   413	 */
   414	static int arch_build_bp_info(struct perf_event *bp,
   415				      const struct perf_event_attr *attr,
   416				      struct arch_hw_breakpoint *hw)
   417	{
   418		/* Type */
   419		switch (attr->bp_type) {
   420		case HW_BREAKPOINT_X:
   421			hw->ctrl.type = ARM_BREAKPOINT_EXECUTE;
   422			break;
   423		case HW_BREAKPOINT_R:
   424			hw->ctrl.type = ARM_BREAKPOINT_LOAD;
   425			break;
   426		case HW_BREAKPOINT_W:
   427			hw->ctrl.type = ARM_BREAKPOINT_STORE;
   428			break;
   429		case HW_BREAKPOINT_RW:
   430			hw->ctrl.type = ARM_BREAKPOINT_LOAD | ARM_BREAKPOINT_STORE;
   431			break;
   432		default:
   433			return -EINVAL;
   434		}
   435	
   436		/* Len */
   437		switch (attr->bp_len) {
   438		case HW_BREAKPOINT_LEN_1:
   439			hw->ctrl.len = ARM_BREAKPOINT_LEN_1;
   440			break;
   441		case HW_BREAKPOINT_LEN_2:
   442			hw->ctrl.len = ARM_BREAKPOINT_LEN_2;
   443			break;
   444		case HW_BREAKPOINT_LEN_3:
   445			hw->ctrl.len = ARM_BREAKPOINT_LEN_3;
   446			break;
   447		case HW_BREAKPOINT_LEN_4:
   448			hw->ctrl.len = ARM_BREAKPOINT_LEN_4;
   449			break;
   450		case HW_BREAKPOINT_LEN_5:
   451			hw->ctrl.len = ARM_BREAKPOINT_LEN_5;
   452			break;
   453		case HW_BREAKPOINT_LEN_6:
   454			hw->ctrl.len = ARM_BREAKPOINT_LEN_6;
   455			break;
   456		case HW_BREAKPOINT_LEN_7:
   457			hw->ctrl.len = ARM_BREAKPOINT_LEN_7;
   458			break;
   459		case HW_BREAKPOINT_LEN_8:
   460			hw->ctrl.len = ARM_BREAKPOINT_LEN_8;
   461			break;
   462		default:
   463			return -EINVAL;
   464		}
   465	
   466		/*
   467		 * On AArch64, we only permit breakpoints of length 4, whereas
   468		 * AArch32 also requires breakpoints of length 2 for Thumb.
   469		 * Watchpoints can be of length 1, 2, 4 or 8 bytes.
   470		 */
   471		if (hw->ctrl.type == ARM_BREAKPOINT_EXECUTE) {
   472			if (is_compat_bp(bp)) {
   473				if (hw->ctrl.len != ARM_BREAKPOINT_LEN_2 &&
   474				    hw->ctrl.len != ARM_BREAKPOINT_LEN_4)
   475					return -EINVAL;
   476			} else if (hw->ctrl.len != ARM_BREAKPOINT_LEN_4) {
   477				/*
   478				 * Some tools (e.g. perf) incorrectly assume that
   479				 * breakpoints should be sizeof(long). This is wrong
   480				 * for AArch64 where breakpoints must be 4 bytes.
   481				 * Warn the user and fix up the parameter.
   482				 */
 > 483				pr_warn_once("hw_breakpoint: invalid AArch64 breakpoint length %d,
 > 484					fixing to 4 bytes\n", hw->ctrl.len);
   485				hw->ctrl.len = ARM_BREAKPOINT_LEN_4;
   486			}
   487		}
   488	
   489		/* Address */
   490		hw->address = attr->bp_addr;
   491	
   492		/*
   493		 * Privilege
   494		 * Note that we disallow combined EL0/EL1 breakpoints because
   495		 * that would complicate the stepping code.
   496		 */
   497		if (arch_check_bp_in_kernelspace(hw))
   498			hw->ctrl.privilege = AARCH64_BREAKPOINT_EL1;
   499		else
   500			hw->ctrl.privilege = AARCH64_BREAKPOINT_EL0;
   501	
   502		/* Enabled? */
   503		hw->ctrl.enabled = !attr->disabled;
   504	
   505		return 0;
   506	}
   507	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

