Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A10D5E12A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 05:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hh6JpM+wvkvQwGigWxFv7jGumOw75dLm9BqlyMv8D/w=; b=nN6PwMKFE0pd5SSH89smU5VlSA
	TFk36brHzU2HpKI4LKUERQLmd+qU8dhgQgZ0Jo7OmJcyLoobQgJwwldci4AqfkaxuwgobSAAmeoqW
	E3vyz9dIL2GnBLRn+qr164A4DKC5kyO8x8ss5d3PKjlu/BrQKzyl97bxn36qc9awqO0Z2iH0oYLhu
	yGe5imzV7aT4u783pifj2ebvEcoFmaxIS9gts/PGaM0I6pA1nZTR69ULONgPaSARujyYFEYu/l3r3
	DomDgTBUI217cWLlGbUB8WoySX8qoikO3YTAnPtLzJDQ95ikSZcGo3XXPjiHlBryZpzYsPUESdm9e
	Rak+EFNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9HLY-00000009MgD-1ooL;
	Fri, 08 Nov 2024 05:15:48 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9HJm-00000009MZr-48ZT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 05:14:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731042839; x=1762578839;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pYc9Qbhl30laTpqG2U4WFIYnywiRC9RUCYu1mKTYEf0=;
  b=jiRV/OPfjMJFYLADXOkGQrPxuDxKQKJqO8rg4ZuzHak3k6AOJY7fzcVw
   bO+kHRYKiwye8myE9BUSahNHWj1CmfeA+joGoSGRXoe+/vvxogSrAy47m
   6AVOGigo/bv3PbOSicTE+zQ7KGmChDhAcWLdVXCkh8GUhx80Iaa9EG9g4
   6KLU0j51dHGoY/4V0hEC0RWQahb+WBb861zjXnB5v7EPWHiAQFpkxd4hR
   alvSeJc3h9m24vtuGMxbEws/tFWuMFXAjABqW9ehJCwa8Ap2BRq9pbDX7
   dn+jVJdwrULSmpLfGbbI4CJiZShIME83ep9Jxqs3JZTirSU1Kga1X3wFZ
   w==;
X-CSE-ConnectionGUID: UGeUCARtRsyrytliEEserQ==
X-CSE-MsgGUID: 8wKQdxQDTAWzfhopr5TqfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="34842604"
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="34842604"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 21:13:54 -0800
X-CSE-ConnectionGUID: hj1jmGEURHufH/7Z2oU9RA==
X-CSE-MsgGUID: nD8TOoO9TvCWTbnMnhN+5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="90033772"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Nov 2024 21:13:50 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9HJc-000r3c-0f;
	Fri, 08 Nov 2024 05:13:48 +0000
Date: Fri, 8 Nov 2024 13:13:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jing Zhang <jingzhangos@google.com>, KVM <kvm@vger.kernel.org>,
	KVMARM <kvmarm@lists.linux.dev>,
	ARMLinux <linux-arm-kernel@lists.infradead.org>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@google.com>,
	Joey Gouly <joey.gouly@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Kunkun Jiang <jiangkunkun@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Colton Lewis <coltonlewis@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Shusen Li <lishusen2@huawei.com>, Eric Auger <eauger@redhat.com>,
	Jing Zhang <jingzhangos@google.com>
Subject: Re: [PATCH v4 3/5] KVM: arm64: vgic-its: Add a data length check in
 vgic_its_save_*
Message-ID: <202411081338.47eReEKu-lkp@intel.com>
References: <20241107214137.428439-4-jingzhangos@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107214137.428439-4-jingzhangos@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_211359_109037_4D690D70 
X-CRM114-Status: GOOD (  11.23  )
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

Hi Jing,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 59b723cd2adbac2a34fc8e12c74ae26ae45bf230]

url:    https://github.com/intel-lab-lkp/linux/commits/Jing-Zhang/KVM-selftests-aarch64-Add-VGIC-selftest-for-save-restore-ITS-table-mappings/20241108-054433
base:   59b723cd2adbac2a34fc8e12c74ae26ae45bf230
patch link:    https://lore.kernel.org/r/20241107214137.428439-4-jingzhangos%40google.com
patch subject: [PATCH v4 3/5] KVM: arm64: vgic-its: Add a data length check in vgic_its_save_*
config: arm64-randconfig-004-20241108 (https://download.01.org/0day-ci/archive/20241108/202411081338.47eReEKu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411081338.47eReEKu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411081338.47eReEKu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/vgic/vgic-its.c: In function 'vgic_its_save_collection_table':
>> arch/arm64/kvm/vgic/vgic-its.c:2495:13: warning: unused variable 'val' [-Wunused-variable]
    2495 |         u64 val;
         |             ^~~


vim +/val +2495 arch/arm64/kvm/vgic/vgic-its.c

ea1ad53e1e31a3 virt/kvm/arm/vgic/vgic-its.c   Eric Auger         2017-01-09  2484  
0aa34b37a78d06 arch/arm64/kvm/vgic/vgic-its.c Sebastian Ott      2024-07-23  2485  /*
3b65808f4b2914 virt/kvm/arm/vgic/vgic-its.c   Eric Auger         2016-12-24  2486   * vgic_its_save_collection_table - Save the collection table into
3b65808f4b2914 virt/kvm/arm/vgic/vgic-its.c   Eric Auger         2016-12-24  2487   * guest RAM
3b65808f4b2914 virt/kvm/arm/vgic/vgic-its.c   Eric Auger         2016-12-24  2488   */
3b65808f4b2914 virt/kvm/arm/vgic/vgic-its.c   Eric Auger         2016-12-24  2489  static int vgic_its_save_collection_table(struct vgic_its *its)
3b65808f4b2914 virt/kvm/arm/vgic/vgic-its.c   Eric Auger         2016-12-24  2490  {
ea1ad53e1e31a3 virt/kvm/arm/vgic/vgic-its.c   Eric Auger         2017-01-09  2491  	const struct vgic_its_abi *abi = vgic_its_get_abi(its);
c2385eaa6c5a87 virt/kvm/arm/vgic/vgic-its.c   Eric Auger         2017-10-26  2492  	u64 baser = its->baser_coll_table;
8ad50c8985d805 virt/kvm/arm/vgic/vgic-its.c   Kristina Martsenko 2018-09-26  2493  	gpa_t gpa = GITS_BASER_ADDR_48_to_52(baser);
ea1ad53e1e31a3 virt/kvm/arm/vgic/vgic-its.c   Eric Auger         2017-01-09  2494  	struct its_collection *collection;
ea1ad53e1e31a3 virt/kvm/arm/vgic/vgic-its.c   Eric Auger         2017-01-09 @2495  	u64 val;
ea1ad53e1e31a3 virt/kvm/arm/vgic/vgic-its.c   Eric Auger         2017-01-09  2496  	size_t max_size, filled = 0;
ea1ad53e1e31a3 virt/kvm/arm/vgic/vgic-its.c   Eric Auger         2017-01-09  2497  	int ret, cte_esz = abi->cte_esz;
ea1ad53e1e31a3 virt/kvm/arm/vgic/vgic-its.c   Eric Auger         2017-01-09  2498  
c2385eaa6c5a87 virt/kvm/arm/vgic/vgic-its.c   Eric Auger         2017-10-26  2499  	if (!(baser & GITS_BASER_VALID))
ea1ad53e1e31a3 virt/kvm/arm/vgic/vgic-its.c   Eric Auger         2017-01-09  2500  		return 0;
ea1ad53e1e31a3 virt/kvm/arm/vgic/vgic-its.c   Eric Auger         2017-01-09  2501  
c2385eaa6c5a87 virt/kvm/arm/vgic/vgic-its.c   Eric Auger         2017-10-26  2502  	max_size = GITS_BASER_NR_PAGES(baser) * SZ_64K;
ea1ad53e1e31a3 virt/kvm/arm/vgic/vgic-its.c   Eric Auger         2017-01-09  2503  
ea1ad53e1e31a3 virt/kvm/arm/vgic/vgic-its.c   Eric Auger         2017-01-09  2504  	list_for_each_entry(collection, &its->collection_list, coll_list) {
ea1ad53e1e31a3 virt/kvm/arm/vgic/vgic-its.c   Eric Auger         2017-01-09  2505  		ret = vgic_its_save_cte(its, collection, gpa, cte_esz);
ea1ad53e1e31a3 virt/kvm/arm/vgic/vgic-its.c   Eric Auger         2017-01-09  2506  		if (ret)
ea1ad53e1e31a3 virt/kvm/arm/vgic/vgic-its.c   Eric Auger         2017-01-09  2507  			return ret;
ea1ad53e1e31a3 virt/kvm/arm/vgic/vgic-its.c   Eric Auger         2017-01-09  2508  		gpa += cte_esz;
ea1ad53e1e31a3 virt/kvm/arm/vgic/vgic-its.c   Eric Auger         2017-01-09  2509  		filled += cte_esz;
ea1ad53e1e31a3 virt/kvm/arm/vgic/vgic-its.c   Eric Auger         2017-01-09  2510  	}
ea1ad53e1e31a3 virt/kvm/arm/vgic/vgic-its.c   Eric Auger         2017-01-09  2511  
ea1ad53e1e31a3 virt/kvm/arm/vgic/vgic-its.c   Eric Auger         2017-01-09  2512  	if (filled == max_size)
ea1ad53e1e31a3 virt/kvm/arm/vgic/vgic-its.c   Eric Auger         2017-01-09  2513  		return 0;
ea1ad53e1e31a3 virt/kvm/arm/vgic/vgic-its.c   Eric Auger         2017-01-09  2514  
ea1ad53e1e31a3 virt/kvm/arm/vgic/vgic-its.c   Eric Auger         2017-01-09  2515  	/*
ea1ad53e1e31a3 virt/kvm/arm/vgic/vgic-its.c   Eric Auger         2017-01-09  2516  	 * table is not fully filled, add a last dummy element
ea1ad53e1e31a3 virt/kvm/arm/vgic/vgic-its.c   Eric Auger         2017-01-09  2517  	 * with valid bit unset
ea1ad53e1e31a3 virt/kvm/arm/vgic/vgic-its.c   Eric Auger         2017-01-09  2518  	 */
c4380c338c9607 arch/arm64/kvm/vgic/vgic-its.c Kunkun Jiang       2024-11-07  2519  	return vgic_its_write_entry_lock(its, gpa, 0, cte_esz);
3b65808f4b2914 virt/kvm/arm/vgic/vgic-its.c   Eric Auger         2016-12-24  2520  }
3b65808f4b2914 virt/kvm/arm/vgic/vgic-its.c   Eric Auger         2016-12-24  2521  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

