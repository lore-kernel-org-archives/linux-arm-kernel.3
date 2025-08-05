Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A101C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 09:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PlO9RwWdnw5NqRg0z4j7gt2V8GNQ4fwY8d+QrFjrjeQ=; b=RGVARf02MGfM1NGcw6FDQR+ZCN
	6QDf6kS5qL0FVmfVqn7MhXIcdlpAoML+vwZOzxCjp2jutCcCw7EETgfDxWAQ56kY9XyLnodAwAOL6
	+K17zfqOieHabDmPeD6fyq6ethHyvHakLg2aHDqwIDAmhHVj1mhJj9Tn/PIgERI/HwouOu88LEnLF
	Owg+ulMrSH00paytAxn/mRbnH4gYYVwRi9F3IKERyEsT/qxePioLJb9HGGcaSFeXV0DERmmXBuWUn
	BkXSHDozQXs4DfW3q2bSJWUWooNGn6rEL1+hnOBr7HM/TUVgHukL1ocmFP4nRc4Wc9QxWGUVSBjtn
	ae2x4q/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujE36-0000000CMaO-386c;
	Tue, 05 Aug 2025 09:33:36 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujDYK-0000000CI99-3KRn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 09:01:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754384509; x=1785920509;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gf1YHbam51GMAXwrHRGJvU/JvLb/rUHVZyplFxxR3CM=;
  b=mWwrf4fNvf+qlMql58Mdi5I7+S5UYpfNvtad871P5Flr9ljDwSEevhSY
   S9XBTVk1hxPdgXHzLfpC/szodDLi0a6PiM1PoicgrqsODcugasRh5bnmT
   Xb9Kvpl/agEIlWExB7po7KdbDEwzwjGxCVpoYWEDgoab6xaYz3zlb4nGC
   3ZlgWU2qt3zcxxgZ0wESy5Wz2IKiuypYaNRlZ9Xg57EtKXv1lYIM0u237
   d9QuKkTWQcPzG45JaBVFcpOgALo+1GMPqGvWmN1zS2u4sWcQVaxhVxLwE
   R5fWuajwhlxYKL+q+S2XixUTd6qonkII3iQPUYXWONesNAyWsED8MjkEz
   g==;
X-CSE-ConnectionGUID: pneTkNK1SLOKUa7um+tF6A==
X-CSE-MsgGUID: utttO/RkRymjO4vhzhGzoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="60501703"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="60501703"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 02:01:45 -0700
X-CSE-ConnectionGUID: ku7DH78QTCyT3ySdc82PYQ==
X-CSE-MsgGUID: NeBvjl4QSdCmHZQiDtmxPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="163679737"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 05 Aug 2025 02:01:39 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujDY8-0000Uc-2T;
	Tue, 05 Aug 2025 09:01:36 +0000
Date: Tue, 5 Aug 2025 17:01:35 +0800
From: kernel test robot <lkp@intel.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>, catalin.marinas@arm.com,
	will@kernel.org, maz@kernel.org, broonie@kernel.org,
	oliver.upton@linux.dev, anshuman.khandual@arm.com, robh@kernel.org,
	james.morse@arm.com, mark.rutland@arm.com, joey.gouly@arm.com,
	ry111@xry111.site, Dave.Martin@arm.com, ahmed.genidi@arm.com,
	kevin.brodsky@arm.com, scott@os.amperecomputing.com, mbenes@suse.cz,
	james.clark@linaro.org, frederic@kernel.org, rafael@kernel.org,
	pavel@kernel.org, ryan.roberts@arm.com, suzuki.poulose@arm.com
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	kvmarm@lists.linux.dev, Yeoreum Yun <yeoreum.yun@arm.com>
Subject: Re: [PATCH 07/11] arm64: make the per-task SCTLR2_EL1
Message-ID: <202508051649.pyaqcE8d-lkp@intel.com>
References: <20250804121724.3681531-8-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250804121724.3681531-8-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_020148_902968_1A42B3CD 
X-CRM114-Status: UNSURE (   9.41  )
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

Hi Yeoreum,

kernel test robot noticed the following build errors:

[auto build test ERROR on 038d61fd642278bab63ee8ef722c50d10ab01e8f]

url:    https://github.com/intel-lab-lkp/linux/commits/Yeoreum-Yun/arm64-sysreg-add-system-registers-SCTLR2_EL2/20250804-202225
base:   038d61fd642278bab63ee8ef722c50d10ab01e8f
patch link:    https://lore.kernel.org/r/20250804121724.3681531-8-yeoreum.yun%40arm.com
patch subject: [PATCH 07/11] arm64: make the per-task SCTLR2_EL1
config: arm64-randconfig-001-20250805 (https://download.01.org/0day-ci/archive/20250805/202508051649.pyaqcE8d-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250805/202508051649.pyaqcE8d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508051649.pyaqcE8d-lkp@intel.com/

All errors (new ones prefixed by >>):

   /tmp/ccFwinHr.s: Assembler messages:
>> /tmp/ccFwinHr.s:1352: Error: selected processor does not support system register name 'sctlr2_el1'
   /tmp/ccFwinHr.s:1362: Error: selected processor does not support system register name 'sctlr2_el1'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

