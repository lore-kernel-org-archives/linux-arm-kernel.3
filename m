Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B0DCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 02:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGpEAUpDM4fDBWI7qC8tO7EQjL1G5J+QwXiIgPs7WV8=; b=kb7IzditC69CuNDaGVALirM9UE
	KQHsHoIcSOabcqePAcI6BDPfDfS6JsbXMRvyJPlwZmixy/Px9QPLGVqtdvZufcTlAims92orNt7vn
	/bsob9YH7+9Phxkdj3aeJDNte+T04w5QmWXt+6cREaRP/uh8wE2OLbervH1HNj0THn5F6t1fDNHFy
	iv4mdOfR1RaELj43W2hj5iGmeu8wGUh2hP7jRK8lRtqyKorOU9q0ylkn19ZrZkKZE6FLOxeaHTEec
	Nh2b6PKGr4lDOcGDgPf3jAWDZ8wbz7MhUD40JcTBEj+KAwiFTaf7tKescdv+29ADPvhH5AMyxfCwN
	I9BkRVUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGSst-0000000Cssh-0elk;
	Wed, 05 Nov 2025 02:04:27 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGSsr-0000000CssL-02LQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 02:04:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762308265; x=1793844265;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=79KjyqTVlFvWryaG61zBG7OjWd5+U+JNcu4D3sQkAb0=;
  b=bAcPVUkk77sBrx34BVDSEUr/m4DBRbJcfNJO01r+VUswEwaHVGuzUaNE
   TjHiU2W1XkwyRe4+CN+2rtFIlINyIqjy0RpUdxgx7KvDmgvOiOrgjNnIK
   UxVcO6oGm+mOizUKu23Bc8DAbTUHn//HYxjnmYWj8WjZXWPf2DggXKtVF
   gz4p4yuqK3IcZnh1mUpAyPjUlgY6yAw12diCTJn6u7Qb0gR4NQIkFGbWN
   oT9fSe1p8tHpTxH9ZjgB0ifVmMk5DE9e4UfMldQnslY1QEkGQzxT4wjBE
   wDnOJCCabGckM+XNVdaMpHVf1lCdfuSLYCPYNQk2jWJ+XagZxXfG+7a+K
   Q==;
X-CSE-ConnectionGUID: KAml9AvWQ7GIGAhj3t1buw==
X-CSE-MsgGUID: 6uG/3lInQHmfFYesMPg6MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="82043406"
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="82043406"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 18:04:24 -0800
X-CSE-ConnectionGUID: xSkiRYsLS6CKL8wvq7w4dA==
X-CSE-MsgGUID: Ssuz/sw4TJeIZFPhVyS4Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="186569005"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 04 Nov 2025 18:04:07 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGSrB-000S2R-12;
	Wed, 05 Nov 2025 02:03:04 +0000
Date: Wed, 5 Nov 2025 10:01:36 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 05/33] KVM: arm64: GICv3: Detect and work around the lack
 of ICV_DIR_EL1 trapping
Message-ID: <202511050925.kQxVnIUB-lkp@intel.com>
References: <20251103165517.2960148-6-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103165517.2960148-6-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_180425_063357_F886407E 
X-CRM114-Status: GOOD (  10.04  )
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

Hi Marc,

kernel test robot noticed the following build errors:

[auto build test ERROR on kvmarm/next]
[also build test ERROR on linus/master v6.18-rc4 next-20251104]
[cannot apply to arm64/for-next/core tip/irq/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marc-Zyngier/irqchip-gic-Add-missing-GICH_HCR-control-bits/20251104-011133
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git next
patch link:    https://lore.kernel.org/r/20251103165517.2960148-6-maz%40kernel.org
patch subject: [PATCH 05/33] KVM: arm64: GICv3: Detect and work around the lack of ICV_DIR_EL1 trapping
config: arm64-randconfig-003-20251105 (https://download.01.org/0day-ci/archive/20251105/202511050925.kQxVnIUB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511050925.kQxVnIUB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511050925.kQxVnIUB-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/hyp-stub.S: Assembler messages:
>> arch/arm64/kernel/hyp-stub.S:59: Error: unknown or missing system register name at operand 2 -- `mrs x1,ich_vtr_el2'


vim +59 arch/arm64/kernel/hyp-stub.S

    45	
    46		.align 11
    47	
    48	SYM_CODE_START_LOCAL(elx_sync)
    49		cmp	x0, #HVC_SET_VECTORS
    50		b.ne	1f
    51		msr	vbar_el2, x1
    52		b	9f
    53	
    54	1:	cmp	x0, #HVC_FINALISE_EL2
    55		b.eq	__finalise_el2
    56	
    57		cmp	x0, #HVC_GET_ICH_VTR_EL2
    58		b.ne	2f
  > 59		mrs	x1, ich_vtr_el2
    60		b	9f
    61	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

