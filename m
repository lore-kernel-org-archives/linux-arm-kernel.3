Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9748FF60F0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 15:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0YDSQUpj6pEomxVlhgVS6wSSUzQvrVhdeH37nnJloc4=; b=0B9YFFIOw+YFfq/dqhESKGwAIw
	vmpD842uTLW2389WaJMxlzachNor29XMKtAqkAnD2X2cwjVQIr7b7NjELY2iYELaSiEp0U5xiVjRF
	NDfu2C6dWms0fHrRNyKDMFp2O/aVcLZavhjOut8o8LF3McI8OZiwbUQF2/0GPkw0aY1PKIJ3PJM5Q
	khB+hnBi/LWcr46MxEv4rGeVVAcLt03eI4mAQTKAJRc+uAPUzY6zB9Ry4TAqd3JbtTnKv5dEjEzw1
	9ftHR24hGyRaiv+OysA+qLMKCfs1Aw/mD3/7a4073GtmlP0UDV7D4K8u1pvqVlY9AQVJPlWiJrgfq
	cL30Mz7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7apn-0000000D9xt-2CmY;
	Tue, 31 Mar 2026 15:16:51 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7apl-0000000D9ws-0oHo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 15:16:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774970209; x=1806506209;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tyOix1UW3bb2O6tgpfvkqzC+tRZ6dSt6wxdQRR75WR8=;
  b=NJ2infEuJYbES9zPb99Qmr9viDs2YD+Jo7ZmS9hlzmkzc+yiOqtkvybw
   aPi1cmSddA/ojYzVgqgc4P7FTl2MK1BWAb81hpLemEcVJaQexDQRzTomJ
   2w3WhgyGWP5kUOg7n0UA8ZOSY6NL91BfYradOZ0rhgRKJhVPNyWUXE+Vc
   ofxkWvpG53p8AdhpqUZb1KdsjpTzbddS4yPWx6cXD+QDdojM+URu5NiUg
   J2/ccKUetkCYXWEbxjyN3P8oEwOSl1bCRUenLYVwIHwbPTg4JwsE1DeGO
   QCN2UhSrYSuNclupnDhR2pnEmPjr/ELLc//ZwgytYarzZYMO8vm7YeLUp
   Q==;
X-CSE-ConnectionGUID: 29Pyru4/Txmsx0tuwtXT1w==
X-CSE-MsgGUID: yaSxtkedQemsJVC0T73W0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="63539405"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="63539405"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 08:16:47 -0700
X-CSE-ConnectionGUID: IiYkO5c1S5KBcqP7V6n9nw==
X-CSE-MsgGUID: RKElrtYSTEGWS3sFojImjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="223091921"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Mar 2026 08:16:43 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7apd-000000002nl-2ATg;
	Tue, 31 Mar 2026 15:16:41 +0000
Date: Tue, 31 Mar 2026 23:16:15 +0800
From: kernel test robot <lkp@intel.com>
To: Wei-Lin Chang <weilin.chang@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Wei-Lin Chang <weilin.chang@arm.com>
Subject: Re: [PATCH 1/4] KVM: arm64: nv: Avoid full shadow s2 unmap
Message-ID: <202603312322.Bli3MO76-lkp@intel.com>
References: <20260330100633.2817076-2-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330100633.2817076-2-weilin.chang@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_081649_284439_590322C8 
X-CRM114-Status: GOOD (  14.08  )
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

Hi Wei-Lin,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20260327]
[cannot apply to kvmarm/next arm64/for-next/core arm/for-next arm/fixes soc/for-next v7.0-rc6 v7.0-rc5 v7.0-rc4 linus/master v7.0-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Lin-Chang/KVM-arm64-nv-Avoid-full-shadow-s2-unmap/20260330-230122
base:   next-20260327
patch link:    https://lore.kernel.org/r/20260330100633.2817076-2-weilin.chang%40arm.com
patch subject: [PATCH 1/4] KVM: arm64: nv: Avoid full shadow s2 unmap
config: arm64-randconfig-002-20260331 (https://download.01.org/0day-ci/archive/20260331/202603312322.Bli3MO76-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603312322.Bli3MO76-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603312322.Bli3MO76-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kvm/nested.c:792:2: error: member reference type 'rwlock_t' (aka 'struct rwlock') is not a pointer; did you mean to use '.'?
     792 |         lockdep_assert_held_write(kvm_s2_mmu_to_kvm(mmu)->mmu_lock);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:291:22: note: expanded from macro 'lockdep_assert_held_write'
     291 |         do { lockdep_assert(lockdep_is_held_type(l, 0)); __assume_ctx_lock(l); } while (0)
         |              ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:253:64: note: expanded from macro 'lockdep_is_held_type'
     253 | #define lockdep_is_held_type(lock, r)   lock_is_held_type(&(lock)->dep_map, (r))
         |                                                                  ^
   include/linux/lockdep.h:279:32: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |              ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/asm-generic/bug.h:110:25: note: expanded from macro 'WARN_ON'
     110 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
>> arch/arm64/kvm/nested.c:792:2: error: cannot take the address of an rvalue of type 'struct lockdep_map'
     792 |         lockdep_assert_held_write(kvm_s2_mmu_to_kvm(mmu)->mmu_lock);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:291:22: note: expanded from macro 'lockdep_assert_held_write'
     291 |         do { lockdep_assert(lockdep_is_held_type(l, 0)); __assume_ctx_lock(l); } while (0)
         |              ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:253:57: note: expanded from macro 'lockdep_is_held_type'
     253 | #define lockdep_is_held_type(lock, r)   lock_is_held_type(&(lock)->dep_map, (r))
         |                                                           ^
   include/linux/lockdep.h:279:32: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |              ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/asm-generic/bug.h:110:25: note: expanded from macro 'WARN_ON'
     110 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   2 errors generated.


vim +792 arch/arm64/kvm/nested.c

   782	
   783	int kvm_record_nested_revmap(gpa_t ipa, struct kvm_s2_mmu *mmu,
   784				     gpa_t fault_ipa, size_t map_size)
   785	{
   786		struct maple_tree *mt = &mmu->nested_revmap_mt;
   787		gpa_t start = ipa;
   788		gpa_t end = ipa + map_size - 1;
   789		u64 entry, new_entry = 0;
   790		int r = 0;
   791	
 > 792		lockdep_assert_held_write(kvm_s2_mmu_to_kvm(mmu)->mmu_lock);
   793	
   794		MA_STATE(mas, mt, start, end);
   795		entry = (u64)mas_find_range(&mas, end);
   796	
   797		if (entry) {
   798			/* maybe just a perm update... */
   799			if (!(entry & UNKNOWN_IPA) && mas.index == start &&
   800			    mas.last == end &&
   801			    fault_ipa == (entry & NESTED_IPA_MASK))
   802				goto out;
   803			/*
   804			 * Remove every overlapping range, then create a "polluted"
   805			 * range that spans all these ranges and store it.
   806			 */
   807			while (entry && mas.index <= end) {
   808				start = min(mas.index, start);
   809				end = max(mas.last, end);
   810				mas_erase(&mas);
   811				entry = (u64)mas_find_range(&mas, end);
   812			}
   813			new_entry |= UNKNOWN_IPA;
   814		} else {
   815			new_entry |= fault_ipa;
   816		}
   817	
   818		mas_set_range(&mas, start, end);
   819		r = mas_store_gfp(&mas, (void *)new_entry, GFP_KERNEL_ACCOUNT);
   820	out:
   821		return r;
   822	}
   823	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

