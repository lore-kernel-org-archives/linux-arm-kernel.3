Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AF7E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 04:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3c7UrkPwEJmNTYLKjTPwjQfK8kP5sLbyVZ2qJ+Q9acM=; b=ia7Tk5kv1VRLWHev56ARbTfsbP
	rB01lI378t3V/BFr6NBHcijUBNDQ/oQC3qaA8Rk6THCHPwasH6Cf+baN4zxstvWLBt2fOIYl2LxhN
	I8RwNUaj2mG7rh0ofFj3FQjHLV20XfuPsnfw7e0QJdaxFb0QyrWc4mCkoXdP8/ommkYSiW252rvVe
	rxx8DJwg0jIxFJYBoA2TPdl/crbaVPtQ+aPYjvXwRY6fpn/svJhYSoPTCgPAVfw9pQ31LRmmiKps4
	iu6/dRaomv4cfY3ArH3BA+CGBBhbEoZb8RoQbp6hUM2QkUpAZaCJMn5LlFz1CHLAx0h7UtpZv7sdw
	1y2GYLXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKVQb-00000006Phq-0lW3;
	Mon, 09 Dec 2024 04:31:25 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKVPY-00000006PYF-32xZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 04:30:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718620; x=1765254620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZD8v5zLjBKPnmArvvG/i9Wzpgt6cbLYB/rU1FRThEXg=;
  b=QvxChZvWoeijxn5TTkqjVQTIIF0g/tb4XKrizY7hmbJypXDyfzz8DzCY
   hKmdN5tTU631vfGZ0m6x6m8NXGhvNKVVPZcYxPkZPtsExRWlrk+gwMIaF
   Xp4/QTs2NqluaQLXtwrd3/IH7hmyH1FxPH7uTxcwdqRsbrkmdQVy0ee7Y
   CwEnQaACSehI9A63YUEy4rVyFYZ2kDtf3QAYskqYIGiqddFT5KEqgO8VJ
   vXLeSemKHDHzT2hWP8vuSQEhVePyC7e40y9RnO0p8ZPPOYfjJwg4yXnWh
   ihHoXB+A5DWUzZsIi/MBgN4bbYPgqE8symK1g7TkS+Wq9GKloPfWqmX/q
   A==;
X-CSE-ConnectionGUID: mKb5T8UpT6CdudFuZQaI8w==
X-CSE-MsgGUID: cCRa/ALfTniugVR2vjGQ+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="37930980"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="37930980"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:30:19 -0800
X-CSE-ConnectionGUID: gtwP+bBKQbe9rNGPn+1LNQ==
X-CSE-MsgGUID: gAGa+rOfR2qDX21D1STTHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95751349"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Dec 2024 20:30:19 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVPU-0003rm-0E;
	Mon, 09 Dec 2024 04:30:16 +0000
Date: Mon, 9 Dec 2024 12:30:01 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:arm64/sysreg-el12 2/4] arch/arm64/mm/proc.S:504:
 Error: undefined symbol TCR2_EL1x_HAFT used as an immediate value
Message-ID: <202412080512.D8NvzV7F-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_203020_781692_CA3702B8 
X-CRM114-Status: UNSURE (   9.76  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git arm64/sysreg-el12
head:   43aafbc40b7a211579f624bf594eaa42d7675daf
commit: 9633732169ec11efc9e7aaa727feb3087c664832 [2/4] arm64/sysreg: Get rid of the TCR2_EL1x SysregFields
config: arm64-randconfig-004-20241208 (https://download.01.org/0day-ci/archive/20241208/202412080512.D8NvzV7F-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241208/202412080512.D8NvzV7F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412080512.D8NvzV7F-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/mm/proc.S: Assembler messages:
>> arch/arm64/mm/proc.S:504: Error: undefined symbol TCR2_EL1x_HAFT used as an immediate value


vim +504 arch/arm64/mm/proc.S

dd006da21646f1 Ard Biesheuvel           2015-03-19  486  
87366d8cf7b3f6 Radha Mohan Chintakuntla 2014-03-07  487  	/*
787fd1d019b269 Kristina Martsenko       2017-12-13  488  	 * Set the IPS bits in TCR_EL1.
87366d8cf7b3f6 Radha Mohan Chintakuntla 2014-03-07  489  	 */
5cd6fa6de5e903 Mark Rutland             2021-03-26  490  	tcr_compute_pa_size tcr, #TCR_IPS_SHIFT, x5, x6
2f4b829c625ec3 Catalin Marinas          2015-07-10  491  #ifdef CONFIG_ARM64_HW_AFDBM
2f4b829c625ec3 Catalin Marinas          2015-07-10  492  	/*
05abb595bbaccc Suzuki K Poulose         2018-03-26  493  	 * Enable hardware update of the Access Flags bit.
05abb595bbaccc Suzuki K Poulose         2018-03-26  494  	 * Hardware dirty bit management is enabled later,
05abb595bbaccc Suzuki K Poulose         2018-03-26  495  	 * via capabilities.
2f4b829c625ec3 Catalin Marinas          2015-07-10  496  	 */
2f4b829c625ec3 Catalin Marinas          2015-07-10  497  	mrs	x9, ID_AA64MMFR1_EL1
efe72541355d4d Yicong Yang              2024-11-02  498  	ubfx	x9, x9, ID_AA64MMFR1_EL1_HAFDBS_SHIFT, #4
05abb595bbaccc Suzuki K Poulose         2018-03-26  499  	cbz	x9, 1f
5cd6fa6de5e903 Mark Rutland             2021-03-26  500  	orr	tcr, tcr, #TCR_HA		// hardware Access flag update
efe72541355d4d Yicong Yang              2024-11-02  501  #ifdef CONFIG_ARM64_HAFT
efe72541355d4d Yicong Yang              2024-11-02  502  	cmp	x9, ID_AA64MMFR1_EL1_HAFDBS_HAFT
efe72541355d4d Yicong Yang              2024-11-02  503  	b.lt	1f
efe72541355d4d Yicong Yang              2024-11-02 @504  	orr	tcr2, tcr2, TCR2_EL1x_HAFT
efe72541355d4d Yicong Yang              2024-11-02  505  #endif /* CONFIG_ARM64_HAFT */
05abb595bbaccc Suzuki K Poulose         2018-03-26  506  1:
2f4b829c625ec3 Catalin Marinas          2015-07-10  507  #endif	/* CONFIG_ARM64_HW_AFDBM */
776e49af6000ef Mark Rutland             2021-03-26  508  	msr	mair_el1, mair
5cd6fa6de5e903 Mark Rutland             2021-03-26  509  	msr	tcr_el1, tcr
9e9bb6ede00a84 Joey Gouly               2023-06-06  510  
9e9bb6ede00a84 Joey Gouly               2023-06-06  511  	mrs_s	x1, SYS_ID_AA64MMFR3_EL1
9e9bb6ede00a84 Joey Gouly               2023-06-06  512  	ubfx	x1, x1, #ID_AA64MMFR3_EL1_S1PIE_SHIFT, #4
9e9bb6ede00a84 Joey Gouly               2023-06-06  513  	cbz	x1, .Lskip_indirection
9e9bb6ede00a84 Joey Gouly               2023-06-06  514  
60d043c101769b Ard Biesheuvel           2024-02-14  515  	/*
60d043c101769b Ard Biesheuvel           2024-02-14  516  	 * The PROT_* macros describing the various memory types may resolve to
60d043c101769b Ard Biesheuvel           2024-02-14  517  	 * C expressions if they include the PTE_MAYBE_* macros, and so they
60d043c101769b Ard Biesheuvel           2024-02-14  518  	 * can only be used from C code. The PIE_E* constants below are also
60d043c101769b Ard Biesheuvel           2024-02-14  519  	 * defined in terms of those macros, but will mask out those
60d043c101769b Ard Biesheuvel           2024-02-14  520  	 * PTE_MAYBE_* constants, whether they are set or not. So #define them
60d043c101769b Ard Biesheuvel           2024-02-14  521  	 * as 0x0 here so we can evaluate the PIE_E* constants in asm context.
60d043c101769b Ard Biesheuvel           2024-02-14  522  	 */
60d043c101769b Ard Biesheuvel           2024-02-14  523  

:::::: The code at line 504 was first introduced by commit
:::::: efe72541355d4d40a4f076af453f6533e98e058c arm64: Add support for FEAT_HAFT

:::::: TO: Yicong Yang <yangyicong@hisilicon.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

