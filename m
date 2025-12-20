Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC959E668B4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 14:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z/84MXVAGdg1OYeg+9/C3lM+nPVcHe9BxYjAMSpTJEI=; b=M/5H/kEruUWcho6B2hBbKzx3uy
	1j7/favMrBhdg21rCuWD/S4cUtFYGQ+L0LdnpKJkIACFC419Ku9dlXxqJP4NV1rjU3pAhkSmSlJNb
	NUBlLFNdiRxcEcNEKGe+dBqgun1K8PimSCGjZSXPV0B/RufzoxusZ+VBKkinOPKmJS1v6pwk2C9Xq
	iqLHoba0T1UBJMtKROXCuOaG51wJGEPzE4PsWzHMcDTWqJ1ZRp6op35ufAylyDV7vq0zpGX9aypgh
	R0bG6gEuzSmC2wluPL+JatraWbckQ2iYfS4gNhAUjzutDAZfV5JYMMDBm3VRpUILlFn8bix0S968w
	JJgl4Ebg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWxV9-0000000Bdha-0n97;
	Sat, 20 Dec 2025 14:00:07 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWxV6-0000000BdhE-0V28
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Dec 2025 14:00:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766239204; x=1797775204;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+H/npnpo/aHP5YbM3+ZLB+6vTAQkvqdVC9uKXkV2xjY=;
  b=LWskeNTq+8VUXfOTPN257L1p+h8fc+/k28W3ldfgHbZZMmbB5ovlBKjn
   gnumQiJmnqTVbPXz/UTIBu1XFJDfQfNKG8/DmtHnWyWFh430cnHDKayZ+
   RE4dFovELE2JQclzi6x+uwwds3JgxVV3PTezjbvEVawRcR6FUxu7NwU5n
   4kE6JnGs6sod1CNJhrlXXXdSyudvOmzBlsgAXqaDQRfruiraS9XrirOaT
   h7QS+fsdDHsHshNMsBbXeRtkLoSnrhuZ2AQfXKRL0gaokXXa//BmhvIcQ
   dSBzGKFljNkLd2lYNYVesCJgF2Nu4adfRZ3BUYby1KQ05ReEteX2Pj4Td
   w==;
X-CSE-ConnectionGUID: MC3dWLIGRaCmHdQfajvXZQ==
X-CSE-MsgGUID: hk8br6GKQ8u1ptAGmpovaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="71806579"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="71806579"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 06:00:02 -0800
X-CSE-ConnectionGUID: 8w7HrFL5RDqOfTYJHrs1RQ==
X-CSE-MsgGUID: t8l+VLJmR8aABKYJ508zcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="198256643"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Dec 2025 05:59:57 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWxUv-000000004b5-3nWI;
	Sat, 20 Dec 2025 13:59:53 +0000
Date: Sat, 20 Dec 2025 21:59:51 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Steven Price <steven.price@arm.com>,
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
Message-ID: <202512202152.gapj1OD5-lkp@intel.com>
References: <20251217101125.91098-20-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217101125.91098-20-steven.price@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_060004_230913_E2944199 
X-CRM114-Status: GOOD (  10.56  )
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
[also build test ERROR on v6.19-rc1 next-20251219]
[cannot apply to kvmarm/next kvm/queue kvm/next arm64/for-next/core kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Price/kvm-arm64-Include-kvm_emulate-h-in-kvm-arm_psci-h/20251218-030351
base:   linus/master
patch link:    https://lore.kernel.org/r/20251217101125.91098-20-steven.price%40arm.com
patch subject: [PATCH v12 19/46] KVM: arm64: Expose support for private memory
config: arm64-randconfig-001-20251219 (https://download.01.org/0day-ci/archive/20251220/202512202152.gapj1OD5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b324c9f4fa112d61a553bf489b5f4f7ceea05ea8)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202152.gapj1OD5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202152.gapj1OD5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:16:
>> include/linux/kvm_host.h:725:45: error: expected identifier or '('
     725 | static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
         |                                             ^
>> include/linux/kvm_host.h:725:45: error: expected ')'
   include/linux/kvm_host.h:725:20: note: to match this '('
     725 | static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
         |                    ^
   arch/arm64/include/asm/kvm_host.h:1465:40: note: expanded from macro 'kvm_arch_has_private_mem'
    1465 | #define kvm_arch_has_private_mem(kvm) ((kvm)->arch.is_realm)
         |                                        ^
   In file included from arch/arm64/kernel/asm-offsets.c:16:
   include/linux/kvm_host.h:725:20: error: expected ')'
     725 | static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
         |                    ^
   arch/arm64/include/asm/kvm_host.h:1465:45: note: expanded from macro 'kvm_arch_has_private_mem'
    1465 | #define kvm_arch_has_private_mem(kvm) ((kvm)->arch.is_realm)
         |                                             ^
   include/linux/kvm_host.h:725:20: note: to match this '('
   arch/arm64/include/asm/kvm_host.h:1465:39: note: expanded from macro 'kvm_arch_has_private_mem'
    1465 | #define kvm_arch_has_private_mem(kvm) ((kvm)->arch.is_realm)
         |                                       ^
   3 errors generated.
   make[3]: *** [scripts/Makefile.build:182: arch/arm64/kernel/asm-offsets.s] Error 1 shuffle=1976660145
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1314: prepare0] Error 2 shuffle=1976660145
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1976660145
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=1976660145
   make: Target 'prepare' not remade because of errors.


vim +725 include/linux/kvm_host.h

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

