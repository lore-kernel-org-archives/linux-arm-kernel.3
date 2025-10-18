Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C820CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 08:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IUKNZndPvh6ngzx+JKUqjbqaS1mvFUvjO4ruTxv0kLg=; b=WuZFntD3FGlX+mjzw0xg8P4pRu
	Hs57ePsYOceivuSY/fRGqjDRWYomqg0kKyNj/KmVdMmFmAslGaj/70skMtJrb7H/v/n+4zA6wE6Hu
	cJTzf085T0VDYuZ4TiaI35UzO3GlW3zRC+dn6UOKsCS5fkzoGmPjqcEBNptO3lsojEhNcdD7+2ovp
	ZvGXKkdtTZd76l01JcKMo31xpeZjKOfi535fgBy/O09cVYaoFtWlkFPV7ssFSvFj46i76oDQxwMVF
	6FQc4o/FwMswNmuFM29Dc7VXw4PZCrTaBGHqLk9jDWGRB968REs3vZz/XbSwkbna7t5fWT0wCvQsk
	9dsgvq2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA2F9-00000009gDu-1uxh;
	Sat, 18 Oct 2025 08:24:51 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA2F6-00000009gD6-2SaH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 08:24:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760775888; x=1792311888;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xveeeHbBkRzYTsyaDDmpSiybjRa5hkiGj6eDae8sz/U=;
  b=SFeJuGxYqw/oRsiTW+Zb3iGwMdsdJEqWUAt6YJ1QDwCqzLCexCUuQPS5
   oJmdTcUM3nZ8fWto21e3LmiFYu5XO5KjFiLxm6oEN9cR2fisBuj6AA90i
   cuUX2b8zvJ/RAT77/H6Z70dULWla7uJSfjaAxho77lL3VHtRvw7OoiyvG
   bm1XIMiT8Y4AF3F185BMjqRLuYXcsEZqh8jqjNRu32ut6cg+6ZIXLnAuE
   cIdKzsqXV2M0l3/CsYZCghEwNCKNp6lUWVWTJCtNZCLgevq0lxR9OzFcS
   jgYnhBESK+kaOVmfORPrROOv5opVBxXLs6vFyD57IONOuRSNNTxF/bZEg
   g==;
X-CSE-ConnectionGUID: YdudLF6YQZaVX4hULTVjLg==
X-CSE-MsgGUID: GvQ5v5oNR7e8/OVLApjpDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="74327359"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="74327359"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 01:24:42 -0700
X-CSE-ConnectionGUID: w+gjILSNQPaSKyWWiEmNuQ==
X-CSE-MsgGUID: ZQJmWX4mQGWqARhTuZxczA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="182051693"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 18 Oct 2025 01:24:39 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vA2Eu-0008AF-2n;
	Sat, 18 Oct 2025 08:24:36 +0000
Date: Sat, 18 Oct 2025 16:24:08 +0800
From: kernel test robot <lkp@intel.com>
To: Bill Tsui <b10902118@ntu.edu.tw>, oleg@redhat.com,
	catalin.marinas@arm.com, will@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com, morbo@google.com,
	justinstitt@google.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Bill Tsui <b10902118@ntu.edu.tw>
Subject: Re: [PATCH v3 1/1] arm64: ptrace: fix hw_break_set() to set addr and
 ctrl together
Message-ID: <202510181547.dI5kyPuT-lkp@intel.com>
References: <20251016154401.35799-2-b10902118@ntu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016154401.35799-2-b10902118@ntu.edu.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_012448_666202_0B93B087 
X-CRM114-Status: GOOD (  11.85  )
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

Hi Bill,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on linus/master v6.18-rc1 next-20251017]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bill-Tsui/arm64-ptrace-fix-hw_break_set-to-set-addr-and-ctrl-together/20251016-235711
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20251016154401.35799-2-b10902118%40ntu.edu.tw
patch subject: [PATCH v3 1/1] arm64: ptrace: fix hw_break_set() to set addr and ctrl together
config: arm64-randconfig-r113-20251018 (https://download.01.org/0day-ci/archive/20251018/202510181547.dI5kyPuT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510181547.dI5kyPuT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510181547.dI5kyPuT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/ptrace.c:449:12: warning: 'ptrace_hbp_set_addr' defined but not used [-Wunused-function]
    static int ptrace_hbp_set_addr(unsigned int note_type,
               ^~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/ptrace.c:424:12: warning: 'ptrace_hbp_set_ctrl' defined but not used [-Wunused-function]
    static int ptrace_hbp_set_ctrl(unsigned int note_type,
               ^~~~~~~~~~~~~~~~~~~


vim +/ptrace_hbp_set_addr +449 arch/arm64/kernel/ptrace.c

478fcb2cdb2351 Will Deacon 2012-03-05  423  
478fcb2cdb2351 Will Deacon 2012-03-05 @424  static int ptrace_hbp_set_ctrl(unsigned int note_type,
478fcb2cdb2351 Will Deacon 2012-03-05  425  			       struct task_struct *tsk,
478fcb2cdb2351 Will Deacon 2012-03-05  426  			       unsigned long idx,
478fcb2cdb2351 Will Deacon 2012-03-05  427  			       u32 uctrl)
478fcb2cdb2351 Will Deacon 2012-03-05  428  {
478fcb2cdb2351 Will Deacon 2012-03-05  429  	int err;
478fcb2cdb2351 Will Deacon 2012-03-05  430  	struct perf_event *bp;
478fcb2cdb2351 Will Deacon 2012-03-05  431  	struct perf_event_attr attr;
478fcb2cdb2351 Will Deacon 2012-03-05  432  	struct arch_hw_breakpoint_ctrl ctrl;
478fcb2cdb2351 Will Deacon 2012-03-05  433  
478fcb2cdb2351 Will Deacon 2012-03-05  434  	bp = ptrace_hbp_get_initialised_bp(note_type, tsk, idx);
478fcb2cdb2351 Will Deacon 2012-03-05  435  	if (IS_ERR(bp)) {
478fcb2cdb2351 Will Deacon 2012-03-05  436  		err = PTR_ERR(bp);
478fcb2cdb2351 Will Deacon 2012-03-05  437  		return err;
478fcb2cdb2351 Will Deacon 2012-03-05  438  	}
478fcb2cdb2351 Will Deacon 2012-03-05  439  
478fcb2cdb2351 Will Deacon 2012-03-05  440  	attr = bp->attr;
478fcb2cdb2351 Will Deacon 2012-03-05  441  	decode_ctrl_reg(uctrl, &ctrl);
478fcb2cdb2351 Will Deacon 2012-03-05  442  	err = ptrace_hbp_fill_attr_ctrl(note_type, ctrl, &attr);
478fcb2cdb2351 Will Deacon 2012-03-05  443  	if (err)
478fcb2cdb2351 Will Deacon 2012-03-05  444  		return err;
478fcb2cdb2351 Will Deacon 2012-03-05  445  
478fcb2cdb2351 Will Deacon 2012-03-05  446  	return modify_user_hw_breakpoint(bp, &attr);
478fcb2cdb2351 Will Deacon 2012-03-05  447  }
478fcb2cdb2351 Will Deacon 2012-03-05  448  
478fcb2cdb2351 Will Deacon 2012-03-05 @449  static int ptrace_hbp_set_addr(unsigned int note_type,
478fcb2cdb2351 Will Deacon 2012-03-05  450  			       struct task_struct *tsk,
478fcb2cdb2351 Will Deacon 2012-03-05  451  			       unsigned long idx,
478fcb2cdb2351 Will Deacon 2012-03-05  452  			       u64 addr)
478fcb2cdb2351 Will Deacon 2012-03-05  453  {
478fcb2cdb2351 Will Deacon 2012-03-05  454  	int err;
478fcb2cdb2351 Will Deacon 2012-03-05  455  	struct perf_event *bp;
478fcb2cdb2351 Will Deacon 2012-03-05  456  	struct perf_event_attr attr;
478fcb2cdb2351 Will Deacon 2012-03-05  457  
478fcb2cdb2351 Will Deacon 2012-03-05  458  	bp = ptrace_hbp_get_initialised_bp(note_type, tsk, idx);
478fcb2cdb2351 Will Deacon 2012-03-05  459  	if (IS_ERR(bp)) {
478fcb2cdb2351 Will Deacon 2012-03-05  460  		err = PTR_ERR(bp);
478fcb2cdb2351 Will Deacon 2012-03-05  461  		return err;
478fcb2cdb2351 Will Deacon 2012-03-05  462  	}
478fcb2cdb2351 Will Deacon 2012-03-05  463  
478fcb2cdb2351 Will Deacon 2012-03-05  464  	attr = bp->attr;
478fcb2cdb2351 Will Deacon 2012-03-05  465  	attr.bp_addr = addr;
478fcb2cdb2351 Will Deacon 2012-03-05  466  	err = modify_user_hw_breakpoint(bp, &attr);
478fcb2cdb2351 Will Deacon 2012-03-05  467  	return err;
478fcb2cdb2351 Will Deacon 2012-03-05  468  }
478fcb2cdb2351 Will Deacon 2012-03-05  469  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

