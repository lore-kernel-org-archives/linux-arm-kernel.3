Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1606CCD192
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 12:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jx//A7kOdn3bjTLwIjxnRY0L9a5xEGYJ8UjOBWQWwFY=; b=HlvgN15oCF42T03GndorsQRRxR
	j68q2n9HSRmtxeZTdZNG89LuD6ltmhkR7smpKc/slxedl1MAMuORtbO8Xxzuzy7rFE5L52so2gRjN
	dx4VS99dzq3ZThUOp6rFNCHR4DSo9NFUHcy4nB78+mLXT3AFipFEGp77QfGk7rdY7AwWNWM6GyCU/
	dUr29of3qJ+0aw4c5v+ncsGieSoNOYeZ2ymRMuRyCzoSP+4D+4poC+rCNDY4dnbYYKTRPJ6Jz8Dwx
	6gc9bp94oFwfFarPsWBWklgjstKxoTcmdxeAtKrC8B5lXZqi5jQj0Ek2Bxg4k6N87HWz1l85tOGQe
	2fB2eULA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v916D-00000001d3A-1VOe;
	Wed, 15 Oct 2025 12:59:25 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v916A-00000001d22-2gy7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 12:59:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760533163; x=1792069163;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6uvgU2DO/vJBfjeKJsnaa+R1w9fMeXXQbnP/pzNa2/c=;
  b=YTdYN19Y14xvIcDBwpX9uQm+ClsvJAJc2M5/US9WGth6vzWmqyqEYywF
   ugFsi/hlLgxWozrMIIa3A9cslKcX8NDUD5ie1KFnCjYyE35TwD+5P9S4R
   8DJiH1O+Bk4d7g42/1EB9A2/r1YPpzZldI7KsZQoIRSfzGxq6tRSA8gVN
   EswQEjUMtqP5zhFU87igln/39DaixH/Oi5mXTigJ734GxL1OPJFinl2Wt
   8IeWjZliRi9uo8H+soKWXFP5/oyMz+UpCFQXbpVOCQOvTC7rc/cxuhLac
   d+oOlj3tJMSNHmpJnTry2pkb3HzUITtpMD99NK0fPs5WRThbfl6+p6YRZ
   w==;
X-CSE-ConnectionGUID: O0jCKzNzTTuyNnwmf/X7pw==
X-CSE-MsgGUID: C7koktpuSDOw0stdCw1sNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="88174003"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="88174003"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 05:59:19 -0700
X-CSE-ConnectionGUID: 9KHMWdBXRZu0EmKcjQU1DA==
X-CSE-MsgGUID: bmOgqiACRdiA+LQnl1AJbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="182955490"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 15 Oct 2025 05:59:17 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9162-0003qh-2s;
	Wed, 15 Oct 2025 12:59:14 +0000
Date: Wed, 15 Oct 2025 20:59:03 +0800
From: kernel test robot <lkp@intel.com>
To: Yang Shi <yang@os.amperecomputing.com>, ryan.roberts@arm.com,
	cl@gentwo.org, catalin.marinas@arm.com, will@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, yang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: mm: show direct mapping use in /proc/meminfo
Message-ID: <202510152040.SlpMogzu-lkp@intel.com>
References: <20251013235118.3072941-1-yang@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013235118.3072941-1-yang@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_055922_688942_79B971F9 
X-CRM114-Status: GOOD (  11.98  )
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
[also build test WARNING on linus/master v6.18-rc1 next-20251014]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yang-Shi/arm64-mm-show-direct-mapping-use-in-proc-meminfo/20251014-075409
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20251013235118.3072941-1-yang%40os.amperecomputing.com
patch subject: [PATCH] arm64: mm: show direct mapping use in /proc/meminfo
config: arm64-randconfig-002-20251015 (https://download.01.org/0day-ci/archive/20251015/202510152040.SlpMogzu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251015/202510152040.SlpMogzu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510152040.SlpMogzu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/mm/mmu.c:186:6: warning: no previous prototype for 'arch_report_meminfo' [-Wmissing-prototypes]
     186 | void arch_report_meminfo(struct seq_file *m)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/arch_report_meminfo +186 arch/arm64/mm/mmu.c

   185	
 > 186	void arch_report_meminfo(struct seq_file *m)
   187	{
   188		char *size[NR_DIRECT_MAP_TYPE];
   189		unsigned int shift[NR_DIRECT_MAP_TYPE];
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

