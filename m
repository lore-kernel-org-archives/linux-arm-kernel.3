Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FDFCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 06:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+wWNnVA4LYPpwhLTgrLBXybU5mE+tW/imeD1ipp1QFs=; b=lcGs75e55wVTVBBF84LkfrRmjj
	Cu15Kh4sgLvoRiTCuWSKZfyNaOJfxKKnfolsXYHBk/E7/dT2E0gmtulEOt+JY1sXqlSIdXEzwwu97
	Zz/NKn/yq9NkLYL9l+H48KeftAwj6hF8ZmTNVu6voIBrI9HEXBFFHIQJfw3zadY/7z3Zl6cR/iz6C
	OubwZiFeKASvWhEDQ+6Lr1oyazuX6ZPgwBkdjaXXupCafa71yJH5gNb5OQ4cEOx28qqlmjWY3gUwi
	Oo75FZiH+KOcveOAXurO+AtKJLvIzzGX/gAiaI9yGl8B78AaWWEoWLPR8X6TImmDPI6iUD3h9XXYf
	tEqCxB2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um55M-0000000Co6d-2ntD;
	Wed, 13 Aug 2025 06:35:44 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um4j0-0000000Ckpw-29RR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 06:12:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755065559; x=1786601559;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WEjIl95UqMxFbzW3h7AnyHICcK65Ko5Swc2ymIiErOo=;
  b=bizJYultk4hx2GcnHqXgi5CQADoKALH/lzSZYqPKzEe2knnJGDoZg4LL
   puLj4BebYcDP6jLiLb6sZMpBSNFGqsu8rB5a2/zO/GkiDzbOnV/U7/eND
   r99C/WHXKsOPhgMLd4oHBgfKYDtEcHPsnccpybWZDUsQdrPPBYhDGLuxN
   H4efe4wUR+hJQj9/FCJjMEMzMj5Yao1hNlrHYaOZfnfIFZBjl5JzDBA2g
   uKT4S43GSw+7AlJbHo5e57LhScynTMFVztI5pX+ltcHlf68L/g6/3SQ2U
   vRRgIDu6jvm+i+uEtjIhFIxY3wMpKuE9KQhMsWj6b5hZTkcfRH9yLNmBn
   A==;
X-CSE-ConnectionGUID: 3bcJ/wlKS72u3GhbXQyZxQ==
X-CSE-MsgGUID: BuMqInwsQqmLtCnuLcLgXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="67955603"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="67955603"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 23:12:38 -0700
X-CSE-ConnectionGUID: +WW94DxgSR+S6rEfDZyLDQ==
X-CSE-MsgGUID: bYLOqADlRSeTUjYPXRWrFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="170591939"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 12 Aug 2025 23:12:33 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1um4is-0009aq-1w;
	Wed, 13 Aug 2025 06:12:30 +0000
Date: Wed, 13 Aug 2025 14:12:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jeremy Linton <jeremy.linton@arm.com>,
	linux-trace-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-perf-users@vger.kernel.org,
	mhiramat@kernel.org, oleg@redhat.com, peterz@infradead.org,
	mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, thiago.bauermann@linaro.org,
	broonie@kernel.org, yury.khrustalev@arm.com,
	kristina.martsenko@arm.com, liaochang1@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jeremy Linton <jeremy.linton@arm.com>,
	Steve Capper <steve.capper@arm.com>
Subject: Re: [PATCH v5 5/7] arm64: uprobes: Add GCS support to uretprobes
Message-ID: <202508131334.FfoZQ27h-lkp@intel.com>
References: <20250811141010.741989-6-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811141010.741989-6-jeremy.linton@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_231238_593853_EE2E7C3D 
X-CRM114-Status: GOOD (  15.84  )
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

Hi Jeremy,

kernel test robot noticed the following build errors:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on perf-tools-next/perf-tools-next tip/perf/core perf-tools/perf-tools linus/master v6.17-rc1 next-20250812]
[cannot apply to acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeremy-Linton/arm64-probes-Break-ret-out-from-bl-blr/20250811-221529
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20250811141010.741989-6-jeremy.linton%40arm.com
patch subject: [PATCH v5 5/7] arm64: uprobes: Add GCS support to uretprobes
config: arm64-randconfig-r111-20250813 (https://download.01.org/0day-ci/archive/20250813/202508131334.FfoZQ27h-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce: (https://download.01.org/0day-ci/archive/20250813/202508131334.FfoZQ27h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508131334.FfoZQ27h-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/probes/uprobes.c: In function 'arch_uretprobe_hijack_return_addr':
>> arch/arm64/kernel/probes/uprobes.c:171:33: error: implicit declaration of function 'get_user_gcs'; did you mean 'put_user_gcs'? [-Werror=implicit-function-declaration]
     171 |                 gcs_ret_vaddr = get_user_gcs((unsigned long __user *)gcspr, &err);
         |                                 ^~~~~~~~~~~~
         |                                 put_user_gcs
   cc1: some warnings being treated as errors


vim +171 arch/arm64/kernel/probes/uprobes.c

   157	
   158	unsigned long
   159	arch_uretprobe_hijack_return_addr(unsigned long trampoline_vaddr,
   160					  struct pt_regs *regs)
   161	{
   162		unsigned long orig_ret_vaddr;
   163		unsigned long gcs_ret_vaddr;
   164		int err = 0;
   165		u64 gcspr;
   166	
   167		orig_ret_vaddr = procedure_link_pointer(regs);
   168	
   169		if (task_gcs_el0_enabled(current)) {
   170			gcspr = read_sysreg_s(SYS_GCSPR_EL0);
 > 171			gcs_ret_vaddr = get_user_gcs((unsigned long __user *)gcspr, &err);
   172			if (err) {
   173				force_sig(SIGSEGV);
   174				goto out;
   175			}
   176	
   177			/*
   178			 * If the LR and GCS return addr don't match, then some kind of PAC
   179			 * signing or control flow occurred since entering the probed function.
   180			 * Likely because the user is attempting to retprobe on an instruction
   181			 * that isn't a function boundary or inside a leaf function. Explicitly
   182			 * abort this retprobe because it will generate a GCS exception.
   183			 */
   184			if (gcs_ret_vaddr != orig_ret_vaddr) {
   185				orig_ret_vaddr = -1;
   186				goto out;
   187			}
   188	
   189			put_user_gcs(trampoline_vaddr, (unsigned long __user *)gcspr, &err);
   190			if (err) {
   191				force_sig(SIGSEGV);
   192				goto out;
   193			}
   194		}
   195	
   196		/* Replace the return addr with trampoline addr */
   197		procedure_link_pointer_set(regs, trampoline_vaddr);
   198	
   199	out:
   200		return orig_ret_vaddr;
   201	}
   202	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

