Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E163C2A072
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 05:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KIi3uODrPqS3XQtcl8tlKSSRc8kMBiAzKaf01PViwM4=; b=Pde2qzOUcDSLJsDP6Z30uI007a
	wFM0F+fJ8duqltyCzsM1P/lK0czVsx2CWy1nGqr4QotgVmWC88AX8PH7hRxeDKO48HVRE09FvGt4b
	XyTc7tQFl1e3HYxvI1IvmUBZIHeDHPl8JPfzD84qUCWXgJ4j5ejuZMpBarX+1MFyloY0LO5hT2dCN
	wn+i5MjjH4BDqhqk7TB1h4xsg7qg+6XPqhKR4FW+gzbJKcJu9MgVc/T5NkrInSu2Epp3owx/Aew+a
	uYbemIFEpNi72CPzBfKHcz+0PpYnidF+lr52DKmuju0TVvx0AxYr6d3cHTCCKFK7D2yX/XLT8yMgt
	1NTdWl9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccko-0000000Aicr-0BUr;
	Mon, 05 Jan 2026 05:03:42 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcckk-0000000AicR-2Id1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 05:03:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767589419; x=1799125419;
  h=date:from:to:cc:subject:message-id;
  bh=5lFrewzT4b4Z7EBUYiIwuBcAiITuiUvpH6ddAamhtT0=;
  b=eqvYvqk0SqrJNbfhv2tItpAEq4L6BK9bgylKZdw1qLBWQ087rjwOtg9L
   0ap6/FlQMO8At/71Tfo7X7ucIWGDLlopZG8nVECfVnulYilrgMVRhQSUP
   bbxsCPH4WHzoJrkN8JIYQorcAsebtiuYmW6WIEB64CpiPPeCA0GwPY/rj
   eyjFnITnspVaZKlMWiTmf5qVNgRB366t+XuenSEvWiXXyDbdhaVW4f7LH
   TlZukdV9Y1aieAL9I8GmjY/2bxCmnUAB4YjYyOXJnLiTdK0jSEcO99Xfd
   BnFNyxcfJfrzn1+qIH3YvbOj3LOW/5zjhv+pnYzkp7mHrVfK14RqsW8R/
   w==;
X-CSE-ConnectionGUID: gGyUclorRkC1hIKJsLspmA==
X-CSE-MsgGUID: POJeiqRCRvOri4SraNcWHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="72813270"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="72813270"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 21:03:35 -0800
X-CSE-ConnectionGUID: zMaMu3RdSve/Z1nZF6Ck6w==
X-CSE-MsgGUID: eCe8mnzhTRSQF+trPIlM4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="201539357"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 04 Jan 2026 21:03:33 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcckd-0000000011t-0olP;
	Mon, 05 Jan 2026 05:03:31 +0000
Date: Mon, 05 Jan 2026 06:02:37 +0100
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/pan-opticon 12/15]
 arm64/set_id_regs.c:94:2: error: use of undeclared identifier
 'ID_AA64ISAR0_EL1_TME_SHIFT'
Message-ID: <202601050608.TC3CBB7L-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_210338_639911_CB25B718 
X-CRM114-Status: UNSURE (   7.54  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/pan-opticon
head:   e0c0ca59df5170d6045ce9389baed5f38d0d1499
commit: 2cb34575bea47cd18dd0fd0a6997548617d05255 [12/15] KVM: arm64: Remove all traces of FEAT_TME
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260105/202601050608.TC3CBB7L-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260105/202601050608.TC3CBB7L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601050608.TC3CBB7L-lkp@intel.com/

Note: the arm-platforms/kvm-arm64/pan-opticon HEAD e0c0ca59df5170d6045ce9389baed5f38d0d1499 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> arm64/set_id_regs.c:94:2: error: use of undeclared identifier 'ID_AA64ISAR0_EL1_TME_SHIFT'
      94 |         REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64ISAR0_EL1, TME, 0),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arm64/set_id_regs.c:58:52: note: expanded from macro 'REG_FTR_BITS'
      58 |         __REG_FTR_BITS(reg##_##field, FTR_UNSIGNED, type, reg##_##field##_SHIFT, \
         |                                                           ^~~~~~~~~~~~~~~~~~~~~
   <scratch space>:11:1: note: expanded from here
      11 | ID_AA64ISAR0_EL1_TME_SHIFT
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> arm64/set_id_regs.c:94:2: error: use of undeclared identifier 'ID_AA64ISAR0_EL1_TME_MASK'
      94 |         REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64ISAR0_EL1, TME, 0),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arm64/set_id_regs.c:59:10: note: expanded from macro 'REG_FTR_BITS'
      59 |                        reg##_##field##_MASK, safe_val)
         |                        ^~~~~~~~~~~~~~~~~~~~
   <scratch space>:14:1: note: expanded from here
      14 | ID_AA64ISAR0_EL1_TME_MASK
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

