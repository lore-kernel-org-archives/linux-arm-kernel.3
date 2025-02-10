Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3F3C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 01:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xqj3IWKfNWBRlB/5JkZmJwoKusgw1v0NY8O7Il/LoAo=; b=JB4ozZjhDi2xGTfejvyPS0buey
	nFVHJf5dMGFVgCYF8louN4MJAVU49Kx4bU5sU7SJqYtJ0dKTwgB+SN1xIXCWIIcX2bcIZlAjNzwy6
	XrXHN78S1SVBu5XI4/++8JSejtpNvpCXsRukst068eL+DZGpC9iknYl2A+0slOu+jZgSq7R1jQSys
	Ry3r1Uli/pfqk2loMWFZAWjXz6odgfBMGHm1QDDdmwi3tAQILVWd+p9hC97T1DL8VlYhxAdaujsD0
	N+mdO0eLcNtS+xlCMwwiB/cWQVTIJCgThlEOBlNmGFSLv4p+aBmDxDS8A3tTqK9tDbD9mHBiGq0/d
	rLjmmm7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thInr-0000000FwM1-0F0j;
	Mon, 10 Feb 2025 01:41:39 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thImS-0000000FwHd-1hgK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 01:40:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739151613; x=1770687613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0X3TGr6+RrerfXCFz/YSGMQebGxVzRjsYIWZ35TeNNg=;
  b=XEirjSBt33rgqPZmhPYdoxLSebVVD+A1E5A1/vJISfJ/n+KuzjN2igu+
   gN07whJbj3ODZhP7KOY5A1XSz8wy+GrecheCJ8szxa1x7Ia1OQRwsxwSm
   /efnW15i6kFBQBYi1JS5kp97sdzLZIK4cIKhsOhThII4inBgFQLxfBvxe
   5oTd3aafZys+eNY6lP19pdjq11wynlo+7/NuGeoYf9rRDSOWsNHRFq5AB
   wYWhfPOMRm91woYMdkqCQZKly9TV2FaeFUSiPsIyX6h60K+U365Y7UfWI
   uY1h31KsEjIQUbgLl2NcVjJPh6S9FW3OlyhudSRNeIYUwJ2qDSE9QT4jc
   w==;
X-CSE-ConnectionGUID: nXZdxoScTXeQPb0Tjl5U/Q==
X-CSE-MsgGUID: /kGvuY6HQYOauVcldrbozw==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="51112185"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="51112185"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 17:40:08 -0800
X-CSE-ConnectionGUID: J/iQNsU+ShWZDGxNupx+iQ==
X-CSE-MsgGUID: 827OAA7iQNWFPr2Pt/rE3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="112686731"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Feb 2025 17:40:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thImI-001283-36;
	Mon, 10 Feb 2025 01:40:02 +0000
Date: Mon, 10 Feb 2025 09:39:04 +0800
From: kernel test robot <lkp@intel.com>
To: Quentin Perret <qperret@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [kvmarm:fixes 18/18] arch/arm64/kvm/hyp/nvhe/mem_protect.c:1086:9:
 warning: variable 'ret' is uninitialized when used here
Message-ID: <202502100911.8c9DbtKD-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_174012_520788_99EC1514 
X-CRM114-Status: UNSURE (   9.23  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git fixes
head:   eabc7aaef7a553b64bf6e631ce04526af6c8d104
commit: eabc7aaef7a553b64bf6e631ce04526af6c8d104 [18/18] KVM: arm64: Simplify np-guest hypercalls
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250210/202502100911.8c9DbtKD-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502100911.8c9DbtKD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502100911.8c9DbtKD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/mem_protect.c:1086:9: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
    1086 |         return ret;
         |                ^~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1076:9: note: initialize the variable 'ret' to silence this warning
    1076 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +1086 arch/arm64/kvm/hyp/nvhe/mem_protect.c

76f0b18b3db578 Quentin Perret 2024-12-18  1071  
76f0b18b3db578 Quentin Perret 2024-12-18  1072  int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu)
76f0b18b3db578 Quentin Perret 2024-12-18  1073  {
76f0b18b3db578 Quentin Perret 2024-12-18  1074  	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
76f0b18b3db578 Quentin Perret 2024-12-18  1075  	u64 ipa = hyp_pfn_to_phys(gfn);
76f0b18b3db578 Quentin Perret 2024-12-18  1076  	int ret;
76f0b18b3db578 Quentin Perret 2024-12-18  1077  
eabc7aaef7a553 Quentin Perret 2025-02-07  1078  	if (pkvm_hyp_vm_is_protected(vm))
eabc7aaef7a553 Quentin Perret 2025-02-07  1079  		return -EPERM;
76f0b18b3db578 Quentin Perret 2024-12-18  1080  
eabc7aaef7a553 Quentin Perret 2025-02-07  1081  	assert_host_shared_guest(vm, ipa);
eabc7aaef7a553 Quentin Perret 2025-02-07  1082  	guest_lock_component(vm);
76f0b18b3db578 Quentin Perret 2024-12-18  1083  	kvm_pgtable_stage2_mkyoung(&vm->pgt, ipa, 0);
76f0b18b3db578 Quentin Perret 2024-12-18  1084  	guest_unlock_component(vm);
76f0b18b3db578 Quentin Perret 2024-12-18  1085  
76f0b18b3db578 Quentin Perret 2024-12-18 @1086  	return ret;

:::::: The code at line 1086 was first introduced by commit
:::::: 76f0b18b3db57868fb0cabe691201aad3085b712 KVM: arm64: Introduce __pkvm_host_mkyoung_guest()

:::::: TO: Quentin Perret <qperret@google.com>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

