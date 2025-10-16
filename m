Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8EA9CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 07:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=extAlUhf/impFqwg0Wj6ULvBiljWdecFeg3pD23Ew8g=; b=0At2rQt5oSBx3N0fn3TokNCOLO
	/9zsirYK8wSdO/eIczxztQCO9068ICkA/GiVrYf5iduBoIcAznc6WOKuPR3hJ9iDpZEy3aLQmIPPB
	eZU6EgU4SQpg5Ud55lHlXITEXXMPLG9Gj39g4cGYdeaONpvxgnZd3eg5UQc6LpSCVvpduu2Lcrgt5
	53MgCi1i6WjN/WSZvRD+lGG8g+V7rOVi/hADX3Rcs5iQHkVxgqFJVyk1fbDejuYBvNA6FXMNdZIM+
	mUEnvC1rkYnptBoKjdUWgAaYRJIzSKUvkconPPBterT8Hq+P2OkUKr2Lwp/nmI/K0jyC7IDkRM4uH
	uaOCmISA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9IOA-00000003lIC-1XOL;
	Thu, 16 Oct 2025 07:27:06 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9IO6-00000003lGs-3OJ3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 07:27:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760599623; x=1792135623;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l0F0laf+iCtL5JuXaUI/oTJb2yYhJ9ZT5i4/qirUsn0=;
  b=m9oeQPWHbNSGYjSSXzSvr6FmD2ZdcCkJwZuc1X8w7EMqj/Pg/WG0g8iQ
   /kDILWVkkXa2LzFPjPgt0ig5XNDJ5G3shN40IIUQHqFzQ9ETlyoBjfdCk
   9dqs1r6PRD1EWLU8HstitVrxLA8Arins38FTLAIF8fTSPX8jXrf3XDnP+
   43q/kQ0FasogzP2wkhdBY1HEeFIPm77uyn3/OtKVI08RchwUknvEbzcxt
   ThikzLGe0i1mpaiQooFyeCYVo8cKsVDKzVsYlDdyl3PrAqYpmmc5YJ4s7
   4IEyV6+W11g6HKXtJxfpzDXXtwZo03JUJKeFkXS7ajyxHYNqYj4NM8P67
   Q==;
X-CSE-ConnectionGUID: CU3jcgJ1T1a5LZJ0JBxkEw==
X-CSE-MsgGUID: Bk05CfwkRvODinYGOdFt+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62682780"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="62682780"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 00:27:01 -0700
X-CSE-ConnectionGUID: CrydLVaNS2ySysIWWmok1A==
X-CSE-MsgGUID: PIbLrSV+R+SEAuHxwOS9Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="186652836"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 16 Oct 2025 00:26:59 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9IO0-0004Yd-1p;
	Thu, 16 Oct 2025 07:26:56 +0000
Date: Thu, 16 Oct 2025 15:26:01 +0800
From: kernel test robot <lkp@intel.com>
To: Yang Shi <yang@os.amperecomputing.com>, ryan.roberts@arm.com,
	cl@gentwo.org, catalin.marinas@arm.com, will@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, yang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: mm: show direct mapping use in /proc/meminfo
Message-ID: <202510161508.mbPZHa8r-lkp@intel.com>
References: <20251013235118.3072941-1-yang@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013235118.3072941-1-yang@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_002702_883356_B0B2EA65 
X-CRM114-Status: GOOD (  11.05  )
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

Hi Yang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on linus/master v6.18-rc1 next-20251015]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yang-Shi/arm64-mm-show-direct-mapping-use-in-proc-meminfo/20251014-075409
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20251013235118.3072941-1-yang%40os.amperecomputing.com
patch subject: [PATCH] arm64: mm: show direct mapping use in /proc/meminfo
config: arm64-randconfig-r121-20251016 (https://download.01.org/0day-ci/archive/20251016/202510161508.mbPZHa8r-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510161508.mbPZHa8r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510161508.mbPZHa8r-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/mm/mmu.c:64:15: sparse: sparse: symbol 'direct_map_cnt' was not declared. Should it be static?

vim +/direct_map_cnt +64 arch/arm64/mm/mmu.c

    63	
  > 64	unsigned long direct_map_cnt[NR_DIRECT_MAP_TYPE];
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

