Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2921FE94617
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 22:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BFy5cWkNZY/+Xo/CLxFQ4IBzC+Kh2JxP1U3xs6wsvsc=; b=wIFwsxngRQ8HOfH8o45YUe4kZz
	E2GoHeuQPmFCI6eny0oqbug5LgV3sY+pmh1Nb6Yrq6OuJJmU1iJ8EpvrMzDITxn/RDBYUy6pYXmSw
	p+f7t2CVS/Y7muICLHg0/rboGFiudDYdtCfGUcWJHcsu/3V3qADV4ppQt/SzjenAqPiLWywI6Hx4n
	3aeapf1BcBZ7f4hyv+42Ra1XJV7oO9v10+AlWTgqi6ZgRU/0MKNYAJKs6iVFBjrZTDYI8zTJRqSXy
	yGyewv0yd3WKy3unNyMqKjjx7OBn5cj4dqp+YIWgEfD80ETQo9T4d7BatEMSm015zRRr6rEdNT89C
	Rim8rBFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpa0I-0000000G9Gm-2nM2;
	Mon, 09 Feb 2026 22:45:14 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpa0F-0000000G9GF-1drm;
	Mon, 09 Feb 2026 22:45:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770677111; x=1802213111;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tkWj3JgcbeYlPLHKSXUowNE5MSQz4gAoqclO6I2NS5M=;
  b=jXu1ZV8e9zIY0ll8tAb5xyWlXTcpAATy8OdWPmfqKw4dpNq/O6w/gYmn
   +2ta9sYUPVwNPvHuVmnn36+mRvrfkDl55IPN3Q91maXNWmDHSTdSOGSXl
   fmJLzem3l/3B8M25iaBt3USgvmK15BNrcvtkZDRprvYqYdTkQKvAACYB8
   kq9rL9EJ1OPutFsH6PIm7d8A9t1lcUt4VGscqJHnMMv/Yg3jQKwHLlD/c
   bUFAKt8bZSZWcfGDMqt6kM8VAJPDqwftqxQpxkRHEqE/HR7hKBez9sovi
   jUxBDV4MKQ/UikgdxFNgs4ZidlNypJA1uPY3tG/wAlJvAajQ3xO52zDDa
   Q==;
X-CSE-ConnectionGUID: 2NcZzyPmSTSazQDQI/HCKg==
X-CSE-MsgGUID: 7ozHTBMtS7G4tCEQxFIHVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="89213180"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="89213180"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 14:45:06 -0800
X-CSE-ConnectionGUID: hD8YfJwIQVewqJzeCu1T2w==
X-CSE-MsgGUID: 0pEVhVq7QsGfJlBgGcnrwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211031702"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Feb 2026 14:45:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpa03-00000000oNk-1EMJ;
	Mon, 09 Feb 2026 22:44:59 +0000
Date: Tue, 10 Feb 2026 06:44:17 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	wsd_upstream@mediatek.com, rock.yeh@mediatek.com,
	hungwen.chien@mediatek.com,
	"kyle-jk.liao" <kyle-jk.liao@mediatek.com>
Subject: Re: [PATCH] KVM: arm64: Allow module-owned pages in host stage-2
 range adjustment
Message-ID: <202602100627.0HOjIqkT-lkp@intel.com>
References: <20260209032421.1278325-1-kyle-jk.liao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209032421.1278325-1-kyle-jk.liao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_144511_526888_685FBE86 
X-CRM114-Status: GOOD (  11.33  )
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
[also build test ERROR on linus/master v6.19 next-20260209]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/kyle-jk-liao-mediatek-com/KVM-arm64-Allow-module-owned-pages-in-host-stage-2-range-adjustment/20260209-112902
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git next
patch link:    https://lore.kernel.org/r/20260209032421.1278325-1-kyle-jk.liao%40mediatek.com
patch subject: [PATCH] KVM: arm64: Allow module-owned pages in host stage-2 range adjustment
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260210/202602100627.0HOjIqkT-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100627.0HOjIqkT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100627.0HOjIqkT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/mem_protect.c:513:53: error: use of undeclared identifier 'PKVM_MODULE_OWNED_PAGE'
     513 |                         (state != PKVM_NOPAGE && state != (PKVM_NOPAGE | PKVM_MODULE_OWNED_PAGE)));
         |                                                                          ^
   1 error generated.


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

