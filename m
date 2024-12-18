Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460BFE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 10:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t8P6OGnY9LeWIyMHQUW8ZZC60hP5k1SHsgt8/ZhZxvA=; b=DFJE0JUOScrtSjUsuuUKwHLjZ8
	v6u9Tj3DqC7j6cj5ZuIKeP/ZLJAHN3sephjDdjWqrnkiFUgydJtwxaJSjqSbHMDNsqtsK3g4kg7dG
	oGH13AUIuSw//4Q9DFwj3JxdIpUP/vfp7TVoHpyLYpfpTpdb64IbnkdwCLSYP7iqlrh4y568dZXVr
	x1cGfMZU++hcoeeI/6plNYaKAMjk+aEv7v+XLC1n1ae70MBKqghyEaD7nCv2MWqV2zPOUw2F7TxWZ
	gbuuklzWRUCZ7KOu9ZsoBiV9XrKwmhJvJniQsqzaepTzLdFt1maJmyvcNs0KL79BJBGhzLah6t74b
	VAkSxXOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqsD-0000000GBzt-02ql;
	Wed, 18 Dec 2024 10:01:45 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqr6-0000000GBs9-0hKb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 10:00:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734516036; x=1766052036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MpjkodXdjH0m2eFAy6RoEaJSjnejPp8HBAXSwOUjmd8=;
  b=Lb+cs0j5dcSIJhEcgXkKOnwgbR8tg7QLcNK5OvaslwKJR6Zk8/gXT6FT
   FJJ8rifxFLXGRY2umNJQsVICEjhLAWkWX4EvFQ5rZiMJaxm/2pFcHpQOf
   EiT9ab4TaVHBrsJsiZqGiMjeN7I8T9S0KE15RWAeSPi/ppX92F9iuRuOD
   iAMIEdKdS49JP0ms+MV/NUsPxJ2Yx4i1c5fhxzXv8wmBYhUmefTijIhuT
   KWLAWuJ/cdFtDx2W3/1liaIdN0jGpZFZzu4WSIHNl5X+gk5GjWCwYAEP+
   R1BlEiJ/EvMk/CdT/FsDGyVXcYRnfCL7cAMN3hRZ3wVcCIDb9ER17+scu
   g==;
X-CSE-ConnectionGUID: lgQeh9xfQGWz3Q7g1dpnLQ==
X-CSE-MsgGUID: 1Q49msXrQCycclw44L+zdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="52392740"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="52392740"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 02:00:34 -0800
X-CSE-ConnectionGUID: raX8lQnJSA6NjB1fN5vaVQ==
X-CSE-MsgGUID: wCX8OO2SSl6UQ4yd3jHfug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="128612878"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Dec 2024 02:00:33 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNqr0-000GGs-1U;
	Wed, 18 Dec 2024 10:00:30 +0000
Date: Wed, 18 Dec 2024 17:59:35 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/nv-next 14/20]
 arch/arm64/include/asm/kvm_nested.h:341:16: error: 'FIX_VNCR' undeclared
Message-ID: <202412181757.mImympcW-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_020036_251482_CDEA982B 
X-CRM114-Status: GOOD (  12.96  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/nv-next
head:   1e2a09d0a43f9c19dae9d321b4a5c840d45fc88b
commit: 0cb2c18e124cd31e01221ed6c60fddc478e3286b [14/20] KVM: arm64: nv: Handle mapping of VNCR_EL2 at EL2
config: arm64-randconfig-003-20241218 (https://download.01.org/0day-ci/archive/20241218/202412181757.mImympcW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412181757.mImympcW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412181757.mImympcW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/kvm_emulate.h:21,
                    from arch/arm64/include/asm/kvm_mmu.h:99,
                    from arch/arm64/kernel/smp.c:46:
   arch/arm64/include/asm/kvm_nested.h: In function 'vncr_fixmap':
>> arch/arm64/include/asm/kvm_nested.h:341:16: error: 'FIX_VNCR' undeclared (first use in this function)
     341 |         return FIX_VNCR - cpu;
         |                ^~~~~~~~
   arch/arm64/include/asm/kvm_nested.h:341:16: note: each undeclared identifier is reported only once for each function it appears in


vim +/FIX_VNCR +341 arch/arm64/include/asm/kvm_nested.h

   337	
   338	static inline unsigned int vncr_fixmap(unsigned int cpu)
   339	{
   340		BUG_ON(cpu > NR_CPUS);
 > 341		return FIX_VNCR - cpu;
   342	}
   343	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

