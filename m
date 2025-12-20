Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41EDE668B4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 14:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YRBt34GRGMTtz8xrxdG3h7BK5bfJ6LWyQ06KfAkuEoE=; b=EHe2J6PPfqDGVO8tA9xNn5fNTc
	4kqJQM9CJBCHjE5AUTg55Zvk4RrjVZjs5L0+0jT6Ih02cEuM9QpJ3C+AjonZLI9jOJ/Cf/lHjMrAR
	m09M10twLFZ5b3s55fUsBWbTRdBVlkxkYUa1zUpErZok8OHAd+0eGDVcQ77/1BBXdfBsAOLxET6iP
	T48J05VDQUt3BVKrMZrpWPyFCMiazv+m7bQEOulXRKDhttJUvcdEVfLJn9Eev/eZGY4CTGfpoFK2g
	IXeMSdqzw3gKGvj+ZjvCeJH5ZC51PiRppf9P3c8sKYOmBESW2VYrXf8fM7Ng0CZmKrVRszqYbmDKi
	EQvz2S7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWxnG-0000000BeNl-2xF6;
	Sat, 20 Dec 2025 14:18:50 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWxnD-0000000BeNQ-3wET
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Dec 2025 14:18:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766240328; x=1797776328;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IlFgiyLO8O26Ptr6Yel73607DUKyQzNFhwrReyq53qY=;
  b=FvfP4fVYitCOOOq7rPvRVZqAX5fSvja6fBWvzUYPiHiCEso8URMzGKJV
   Z24hHh0RN6NSZ3nV2/NMI2nJ6WBD3HUK86uwbvFX1srwsE6+WqB8PDMDj
   iohkA1t18ovuuLjZJusa4H8zcxrzQDFXJwTy0AMr2EN1BCOyZJ8tHEDQz
   JUfYv1BGDxzqLLbveAdqYDNqd1iRlqgSfIpdTeg1NWJFt9fX+1vPlZTbv
   shxVILZdQFbkoED5VHTyDu3RpUU1fBy8OBZ54dSRf5RlMG6LHb7cdf692
   lQ2L2FlmGiwR5p24A+GcgxYofAwVkYuhtOyNmb34ZNlYmzn+szvB+EOao
   Q==;
X-CSE-ConnectionGUID: VMLZWoBOTl27Rd/KSWCPwg==
X-CSE-MsgGUID: abkSk4sCT+WTJmVJRdD5pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="93649026"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="93649026"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 06:18:45 -0800
X-CSE-ConnectionGUID: WYX4smkkRf+9uiPCatM6Tg==
X-CSE-MsgGUID: GvLJtsJsTAGDc5ftWSQ93w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199022075"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 20 Dec 2025 06:18:41 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWxn4-000000004e4-2aKD;
	Sat, 20 Dec 2025 14:18:38 +0000
Date: Sat, 20 Dec 2025 15:18:35 +0100
From: kernel test robot <lkp@intel.com>
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: oe-kbuild-all@lists.linux.dev, Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>
Subject: Re: [PATCH v12 19/46] KVM: arm64: Expose support for private memory
Message-ID: <202512201539.ZhAox5t9-lkp@intel.com>
References: <20251217101125.91098-20-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217101125.91098-20-steven.price@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_061848_022841_177E148F 
X-CRM114-Status: GOOD (  10.29  )
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

Hi Steven,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on next-20251219]
[cannot apply to kvmarm/next kvm/queue kvm/next arm64/for-next/core kvm/linux-next v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Price/kvm-arm64-Include-kvm_emulate-h-in-kvm-arm_psci-h/20251217-224409
base:   linus/master
patch link:    https://lore.kernel.org/r/20251217101125.91098-20-steven.price%40arm.com
patch subject: [PATCH v12 19/46] KVM: arm64: Expose support for private memory
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251220/202512201539.ZhAox5t9-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ecaf673850beb241957352bd61e95ed34256635f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512201539.ZhAox5t9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512201539.ZhAox5t9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:16:
>> ./include/linux/kvm_host.h:725:45: error: expected identifier or '('
     725 | static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
         |                                             ^
>> ./include/linux/kvm_host.h:725:45: error: expected ')'
   ./include/linux/kvm_host.h:725:20: note: to match this '('
     725 | static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
         |                    ^
   ./arch/arm64/include/asm/kvm_host.h:1465:40: note: expanded from macro 'kvm_arch_has_private_mem'
    1465 | #define kvm_arch_has_private_mem(kvm) ((kvm)->arch.is_realm)
         |                                        ^
   In file included from arch/arm64/kernel/asm-offsets.c:16:
   ./include/linux/kvm_host.h:725:20: error: expected ')'
     725 | static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
         |                    ^
   ./arch/arm64/include/asm/kvm_host.h:1465:45: note: expanded from macro 'kvm_arch_has_private_mem'
    1465 | #define kvm_arch_has_private_mem(kvm) ((kvm)->arch.is_realm)
         |                                             ^
   ./include/linux/kvm_host.h:725:20: note: to match this '('
   ./arch/arm64/include/asm/kvm_host.h:1465:39: note: expanded from macro 'kvm_arch_has_private_mem'
    1465 | #define kvm_arch_has_private_mem(kvm) ((kvm)->arch.is_realm)
         |                                       ^
   3 errors generated.


vim +725 ./include/linux/kvm_host.h

f481b069e67437 Paolo Bonzini       2015-05-17  723  
d1e54dd08f163a Fuad Tabba          2025-07-29  724  #ifndef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
a7800aa80ea4d5 Sean Christopherson 2023-11-13 @725  static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
a7800aa80ea4d5 Sean Christopherson 2023-11-13  726  {
a7800aa80ea4d5 Sean Christopherson 2023-11-13  727  	return false;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  728  }
a7800aa80ea4d5 Sean Christopherson 2023-11-13  729  #endif
a7800aa80ea4d5 Sean Christopherson 2023-11-13  730  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

