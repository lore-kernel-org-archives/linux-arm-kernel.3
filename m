Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1C2E7E0D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 17:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4uLZFA9EDgwufVfCNMxyHtsbVojkXIGepFycqtkX6Y8=; b=MQyN07EzNbYM6hES40kgDp6/cI
	k075Ac+1Jd/Rgb7bwm/hHP3bdx2EvcfNfewgGtROV2Y77e/PzMrm4TnH4+IzKtppw5ceERk8BtwH8
	VPm+OiEed9Feo0k7eU+CujpDIOONLsx5db7h/nd+5Q75lB5vM6bHnmVR8WPP12sDlo7svb0/oNPWv
	kSEvPbvvWJcdfWxBWkz7uPGGSX+l/eU7YAs0SrXpFKCT/sTsxRx4y+bcP+LvGr3jCM6s626ZTKJIP
	Vks+WKLijWQfWSyWAMYTPA5t5487wqR/NO0DEodyjbt8Vo/vtnf+bOftgPvusxeexVdfasClUK/sd
	e3KsPMEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpVB3-0000000Fmia-3X5b;
	Mon, 09 Feb 2026 17:36:01 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpVB1-0000000FmhL-2t2i;
	Mon, 09 Feb 2026 17:36:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770658560; x=1802194560;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hhc+P7FHqU4LgtmCeJTNFX3Ofym7oq3Q9RPdNlZvRIk=;
  b=Zuk0V5g6MywxZC+MdTn5/kgviydXyJHM/FOMKXvcWTWYI+o9aeBv9SiU
   ATsegVCZ/Uc28v+8X+sejxuZ1EtTAKEhPVtXsvwFYBOuxUl+x1nBWvT1p
   +Pfcpdi/+QIvZF3ENiHDQ123JF27hBZN6UNUfYvrfmccvcQ20zS+kcisY
   XIN3f76wEGS8XBLizS8pcaA932mbnYYzUyDxu0IZbJqo96REFWg/vyVO1
   7VFofeo/xNrh6GvoIeoxzkTNJBv/Dy8N/2tsY2d7hAhZ3xYPpCzicQjr6
   efOM6GumwkRxfJW9fDVJrj0cQoE7AU9Sbb2/63/e9VlqA6S3O7CrOqjoh
   w==;
X-CSE-ConnectionGUID: /6XN+H2IRjaBFHbkFmB/qw==
X-CSE-MsgGUID: /XIC/d3rSH2AP5bWbFuelg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="74375254"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="74375254"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 09:35:56 -0800
X-CSE-ConnectionGUID: 4hFr77PNRICoNQu5PyKO+Q==
X-CSE-MsgGUID: HZKBtb4ASjqQd/aLqRnCJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="216622485"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Feb 2026 09:35:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpVAp-00000000oB4-3Ap7;
	Mon, 09 Feb 2026 17:35:47 +0000
Date: Tue, 10 Feb 2026 01:35:07 +0800
From: kernel test robot <lkp@intel.com>
To: kyle-jk.liao@mediatek.com, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Quentin Perret <qperret@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, wsd_upstream@mediatek.com,
	rock.yeh@mediatek.com, hungwen.chien@mediatek.com,
	"kyle-jk.liao" <kyle-jk.liao@mediatek.com>
Subject: Re: [PATCH] KVM: arm64: Allow module-owned pages in host stage-2
 range adjustment
Message-ID: <202602100127.gNjhsGVB-lkp@intel.com>
References: <20260209032421.1278325-1-kyle-jk.liao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209032421.1278325-1-kyle-jk.liao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_093559_741424_6E416B61 
X-CRM114-Status: GOOD (  15.42  )
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

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on kvmarm/next]
[also build test ERROR on linus/master v6.19 next-20260205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/kyle-jk-liao-mediatek-com/KVM-arm64-Allow-module-owned-pages-in-host-stage-2-range-adjustment/20260209-112902
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git next
patch link:    https://lore.kernel.org/r/20260209032421.1278325-1-kyle-jk.liao%40mediatek.com
patch subject: [PATCH] KVM: arm64: Allow module-owned pages in host stage-2 range adjustment
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260210/202602100127.gNjhsGVB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100127.gNjhsGVB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100127.gNjhsGVB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from arch/arm64/include/asm/processor.h:35,
                    from include/linux/sched.h:13,
                    from include/linux/resume_user_mode.h:6,
                    from include/linux/entry-virt.h:6,
                    from include/linux/kvm_host.h:5,
                    from arch/arm64/kvm/hyp/nvhe/mem_protect.c:7:
   arch/arm64/kvm/hyp/nvhe/mem_protect.c: In function 'host_stage2_adjust_range':
>> arch/arm64/kvm/hyp/nvhe/mem_protect.c:513:74: error: 'PKVM_MODULE_OWNED_PAGE' undeclared (first use in this function)
     513 |                         (state != PKVM_NOPAGE && state != (PKVM_NOPAGE | PKVM_MODULE_OWNED_PAGE)));
         |                                                                          ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:110:32: note: in definition of macro 'WARN_ON'
     110 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:513:74: note: each undeclared identifier is reported only once for each function it appears in
     513 |                         (state != PKVM_NOPAGE && state != (PKVM_NOPAGE | PKVM_MODULE_OWNED_PAGE)));
         |                                                                          ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:110:32: note: in definition of macro 'WARN_ON'
     110 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~


vim +/PKVM_MODULE_OWNED_PAGE +513 arch/arm64/kvm/hyp/nvhe/mem_protect.c

   492	
   493	static int host_stage2_adjust_range(u64 addr, struct kvm_mem_range *range)
   494	{
   495		struct kvm_mem_range cur;
   496		kvm_pte_t pte;
   497		u64 granule;
   498		s8 level;
   499		int ret;
   500		enum pkvm_page_state state;
   501	
   502		hyp_assert_lock_held(&host_mmu.lock);
   503		ret = kvm_pgtable_get_leaf(&host_mmu.pgt, addr, &pte, &level);
   504		if (ret)
   505			return ret;
   506	
   507		if (kvm_pte_valid(pte))
   508			return -EAGAIN;
   509	
   510		if (pte) {
   511			state = get_host_state(hyp_phys_to_page(addr));
   512			WARN_ON(addr_is_memory(addr) &&
 > 513				(state != PKVM_NOPAGE && state != (PKVM_NOPAGE | PKVM_MODULE_OWNED_PAGE)));
   514			return -EPERM;
   515		}
   516	
   517		for (; level <= KVM_PGTABLE_LAST_LEVEL; level++) {
   518			if (!kvm_level_supports_block_mapping(level))
   519				continue;
   520			granule = kvm_granule_size(level);
   521			cur.start = ALIGN_DOWN(addr, granule);
   522			cur.end = cur.start + granule;
   523			if (!range_included(&cur, range))
   524				continue;
   525			*range = cur;
   526			return 0;
   527		}
   528	
   529		WARN_ON(1);
   530	
   531		return -EINVAL;
   532	}
   533	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

