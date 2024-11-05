Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522C2D1CA2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 05:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aP7jzB397TwLHZpvq8Wp+ukhzKvSf6SOBV3UlPyP33I=; b=Q6t6Sbaff3IfW3wIMqWn3V8qZi
	dMXFB1J3HfgLYyuLkIfI43tsIxH9KR+vEGG2P5jYzfpD8fTKQmPHM1czaNsDJo5f+W94n65crgiUf
	w0lpXi3OAX2hZ13oSN5bJCLCeAEiyWT2dxv3EXh4rNyLWxPIcSfkeGQbc9yGvL3uSgtBdv+PAqigA
	p27pyMMge6z3cYnTLKv3FKTRi1cIroySG764t2J3S4hHzdoBEXe8yMZe6QjjbRlyd5lJ8nMiMJDgy
	gAJjzBqueQhfKgYYtSxIeNdPTuZfK/ucqsZxE7VTQoiMysjY5J4cqAty3KHHUCMh6fAPWumGcZthE
	/4JundkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8CZE-0000000FzSe-068o;
	Tue, 05 Nov 2024 05:57:28 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8CW6-0000000FygM-3v2Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 05:54:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730786055; x=1762322055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mGA7O6fgfWIf/Pwu4MvEyfLhFnqrGvQTMMOxj9Qazzs=;
  b=MZuf2N+oVUhi9caL1a3Vel/xnub9p04BYPnA5Jh5nWKlkEkMvhtwlyOG
   P7r7YdhzgcaWMBegQ83h+dnseK+7ADLwtxfcRDJ1SbprG/REV791FkSbo
   ZGqvL0KsL7IS6QDJPS0ur5lx1ro9Tzql6A3o9H4+3dfACr+p5ZWnfUPhB
   QHwZyUOFfEOQn2gYKzQzLQiE/U9UhKUTivEwncaNfDZv1m7nejULU14aY
   Ur6jmIWFqhjJJ9JQEB8088aDwSJA1mvk1zWEtoiKfDVD92P/amP4pzJGC
   0bZrdwycZ/KRzynmzODPK6WFRYF54sZFDhj3/xKkuhtXL0UzZORHiCJZW
   A==;
X-CSE-ConnectionGUID: 32rLA05RSMGqH6NTeqSYtg==
X-CSE-MsgGUID: G3+VUbJiTkiZitzhrDR6kA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41618646"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41618646"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 21:54:12 -0800
X-CSE-ConnectionGUID: Ud1QZqu5Q7y+3MTYCN7GcA==
X-CSE-MsgGUID: s6QMNsPpSXyaQICF17edmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="88447927"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Nov 2024 21:54:08 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8CVy-000lgf-0o;
	Tue, 05 Nov 2024 05:54:06 +0000
Date: Tue, 5 Nov 2024 13:53:22 +0800
From: kernel test robot <lkp@intel.com>
To: Quentin Perret <qperret@google.com>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 18/18] KVM: arm64: Plumb the pKVM MMU in KVM
Message-ID: <202411051325.EBkzE0th-lkp@intel.com>
References: <20241104133204.85208-19-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104133204.85208-19-qperret@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_215415_055114_9E712A57 
X-CRM114-Status: GOOD (  15.80  )
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

Hi Quentin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.12-rc6]
[also build test WARNING on linus/master]
[cannot apply to kvmarm/next next-20241104]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Quentin-Perret/KVM-arm64-Change-the-layout-of-enum-pkvm_page_state/20241104-213817
base:   v6.12-rc6
patch link:    https://lore.kernel.org/r/20241104133204.85208-19-qperret%40google.com
patch subject: [PATCH 18/18] KVM: arm64: Plumb the pKVM MMU in KVM
config: arm64-randconfig-002-20241105 (https://download.01.org/0day-ci/archive/20241105/202411051325.EBkzE0th-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411051325.EBkzE0th-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411051325.EBkzE0th-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/mmu.c:338: warning: Function parameter or struct member 'pgt' not described in 'kvm_s2_unmap'
>> arch/arm64/kvm/mmu.c:338: warning: Function parameter or struct member 'addr' not described in 'kvm_s2_unmap'
>> arch/arm64/kvm/mmu.c:338: warning: expecting prototype for __unmap_stage2_range(). Prototype was for kvm_s2_unmap() instead


vim +338 arch/arm64/kvm/mmu.c

   299	
   300	/*
   301	 * Unmapping vs dcache management:
   302	 *
   303	 * If a guest maps certain memory pages as uncached, all writes will
   304	 * bypass the data cache and go directly to RAM.  However, the CPUs
   305	 * can still speculate reads (not writes) and fill cache lines with
   306	 * data.
   307	 *
   308	 * Those cache lines will be *clean* cache lines though, so a
   309	 * clean+invalidate operation is equivalent to an invalidate
   310	 * operation, because no cache lines are marked dirty.
   311	 *
   312	 * Those clean cache lines could be filled prior to an uncached write
   313	 * by the guest, and the cache coherent IO subsystem would therefore
   314	 * end up writing old data to disk.
   315	 *
   316	 * This is why right after unmapping a page/section and invalidating
   317	 * the corresponding TLBs, we flush to make sure the IO subsystem will
   318	 * never hit in the cache.
   319	 *
   320	 * This is all avoided on systems that have ARM64_HAS_STAGE2_FWB, as
   321	 * we then fully enforce cacheability of RAM, no matter what the guest
   322	 * does.
   323	 */
   324	/**
   325	 * __unmap_stage2_range -- Clear stage2 page table entries to unmap a range
   326	 * @mmu:   The KVM stage-2 MMU pointer
   327	 * @start: The intermediate physical base address of the range to unmap
   328	 * @size:  The size of the area to unmap
   329	 * @may_block: Whether or not we are permitted to block
   330	 *
   331	 * Clear a range of stage-2 mappings, lowering the various ref-counts.  Must
   332	 * be called while holding mmu_lock (unless for freeing the stage2 pgd before
   333	 * destroying the VM), otherwise another faulting VCPU may come in and mess
   334	 * with things behind our backs.
   335	 */
   336	
   337	static int kvm_s2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
 > 338	{
   339		return KVM_PGT_S2(unmap, pgt, addr, size);
   340	}
   341	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

