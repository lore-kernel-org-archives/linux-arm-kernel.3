Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B490E668AE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 14:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zb6i1bFVR9o3KBp2Gh4Qv1ZIT9AK9xPJtSBthwihUvg=; b=ddNMHT5PGHUqnsS3lwvsO8gjFp
	mWOLO+9Pu0hSicm73LGpGJ08WxJA7puhJOA9XMkiQCN+Kk6yRgbK6T5KjxYDSZPlhSQUDsLhOfDZi
	mx9fCKPSMgyhZSf23PIFFRUbOtlhwuYE8ELwvq8DsM4FLtLnohgw8d1tZj/4+xD9GnYBntuCzT4Na
	urhFhBQyd3bxiFQF7pxW+Gwzu/rTb0EkJ0Opv/DeyWVMbtALlwWQCa6bX7BdppgnOyT3tOiqb1h2t
	EB7soMwB/vhfFgU9PN+jtRpsvpmD1tc+CxR9++F/0fkv8gFh3WFafvPl6nN3nvcH/H9ZfiiywjYss
	tVCUmtHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWy39-0000000Bem2-2n3l;
	Sat, 20 Dec 2025 14:35:15 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWy37-0000000BelQ-0wSj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Dec 2025 14:35:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766241313; x=1797777313;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9gOKI4ydE/etDrXVJz8yRHpBpx0bgUzny4+FMywWXSY=;
  b=ZnsD/Rf8BAxlNK0P5NG9i2gHWiuvm9WGjR8wU7ObMVp8Q+5rpHoYnuMY
   xMxjBSydF1NCoVhSNRZ4MyazByVB+xpYpFAE10xHLZdVP+MTjnbET6hrk
   eQycZlL2mTLG4zBg/IgWstiHnN11Qjsssbday91nd0SZQbuXqyRyi2cFe
   6J5dUIAs6Ixj1M0XN+PO0mtv8Lx7p6crbLlVllWSxv8OOjOA/E9um/mDi
   ZLu+Uj/M+5yFKpiZ0DjfqTs/IWPBiS6jBDUe6kKgEnvR9q9Ozs1+XcBLe
   vkSHG2pVNdKAgYAZ50lP0baMT3EQSwCPN4w99pBWB9Mlf6c+7se8Z23F1
   A==;
X-CSE-ConnectionGUID: Ou2Idj0RQt6oWVgB7kg3Ow==
X-CSE-MsgGUID: b8Z5NsTcRoiG0sDuvfw4mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="93650059"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="93650059"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 06:35:12 -0800
X-CSE-ConnectionGUID: N++nUyL/R02YBkaHhtghhA==
X-CSE-MsgGUID: F/GGCguNQ5ye63EfybK99w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199023543"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Dec 2025 06:35:07 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWy2z-000000004eI-0SXZ;
	Sat, 20 Dec 2025 14:35:05 +0000
Date: Sat, 20 Dec 2025 22:34:50 +0800
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
Subject: Re: [PATCH v12 20/46] arm64: RMI: Allow populating initial contents
Message-ID: <202512202203.1g4jywFB-lkp@intel.com>
References: <20251217101125.91098-21-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217101125.91098-21-steven.price@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_063513_328754_26E645F0 
X-CRM114-Status: GOOD (  11.10  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.19-rc1 next-20251219]
[cannot apply to kvmarm/next kvm/queue kvm/next arm64/for-next/core kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Price/kvm-arm64-Include-kvm_emulate-h-in-kvm-arm_psci-h/20251218-030351
base:   linus/master
patch link:    https://lore.kernel.org/r/20251217101125.91098-21-steven.price%40arm.com
patch subject: [PATCH v12 20/46] arm64: RMI: Allow populating initial contents
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251220/202512202203.1g4jywFB-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202203.1g4jywFB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202203.1g4jywFB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/rmi.c:805:16: warning: variable 'data_flags' set but not used [-Wunused-but-set-variable]
     805 |         unsigned long data_flags = 0;
         |                       ^
   1 warning generated.


vim +/data_flags +805 arch/arm64/kvm/rmi.c

   801	
   802	int kvm_arm_rmi_populate(struct kvm *kvm,
   803				 struct kvm_arm_rmi_populate *args)
   804	{
 > 805		unsigned long data_flags = 0;
   806		unsigned long ipa_start = args->base;
   807		unsigned long ipa_end = ipa_start + args->size;
   808		int ret;
   809	
   810		if (args->reserved ||
   811		    (args->flags & ~KVM_ARM_RMI_POPULATE_FLAGS_MEASURE) ||
   812		    !IS_ALIGNED(ipa_start, PAGE_SIZE) ||
   813		    !IS_ALIGNED(ipa_end, PAGE_SIZE))
   814			return -EINVAL;
   815	
   816		ret = realm_ensure_created(kvm);
   817		if (ret)
   818			return ret;
   819	
   820		if (args->flags & KVM_ARM_RMI_POPULATE_FLAGS_MEASURE)
   821			data_flags |= RMI_MEASURE_CONTENT;
   822	
   823		ret = populate_region(kvm, gpa_to_gfn(ipa_start),
   824				      args->size >> PAGE_SHIFT,
   825				      args->source_uaddr, args->flags);
   826	
   827		if (ret < 0)
   828			return ret;
   829	
   830		return ret * PAGE_SIZE;
   831	}
   832	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

