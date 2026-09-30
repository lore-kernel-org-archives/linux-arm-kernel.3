Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB14ECA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 00:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eBv61ubj2emRkvPP3z2FQUUFpl5Duaa1ehfWKovlraw=; b=4boYEMroq8Dxvfagq1QR1uhVHr
	R04robkmadKlSa761M/Jsq1cDrSxtbLAcUjn31HWFJlebpHFMI39WSpcCNrPje8zC50/4J3KtpCsl
	qmRNQjWN/GixOCU3LGTL7d2O8jvmofCCE7iOEhWsLmYz9lj8wh1nJR0P3xdKfz8o8mDmeHT+ZrmuK
	0r0sOPoJencPoYIQQ5fnLkMDNBk74auVorU7TLzKmWU6L2PJDbgKN1nguNS0T0ICCfRzt3SuHqs7s
	uWCEWt2AuGFcoBYwGNWAJ/Pbkl/NnpsqT/uNWdoTEgkiV3qyD6WkDeWpofw4/xxRUUb8RBPykMN1o
	Ejsr215A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBiW6-00000004qEs-1gIS;
	Wed, 30 Sep 2026 00:49:50 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBiW3-00000004qEW-48k0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 00:49:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790729388; x=1822265388;
  h=date:from:to:cc:subject:message-id;
  bh=RqY47s1tER4u4T6dyOHTy778kipnXbCce72DTFocvzU=;
  b=dr0oARKlWapPE1V3Rv1dYZnkldbTulgEAv9RzW9FwKCN4URzwbN9YuUC
   f78ug0yoBijzVupxueCaUB5wiOJ39FLDtcfQXp51OhA2G4W+lZFfn9SuZ
   ZwEr30xuHAdzmLs0gnNF9kwkEhlt/1uvpCJVEJzRdpuOPVeEKK9Gt4V1r
   WyCXyR1Wlz+o/YrMhd05FiNuJ3cjvpYmpj4OD+SQqdoojdA5o8ScBKfVP
   dDo6/3E5+z0wpRMr+0ACf1XEO9+JdrcdAlGsR8eBvHYdzAObUCotGPewP
   WXo1NmeC6CZV4nhT0cW0P8tRgjK/oh4ImULRKiHy2rKfODTnKo25xcuhJ
   Q==;
X-CSE-ConnectionGUID: ij7WRkjJQVmJqeoLuUTWzw==
X-CSE-MsgGUID: +Fk2CDr+QD2NBu6fZvBAYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90502780"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="90502780"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 17:49:47 -0700
X-CSE-ConnectionGUID: N1ou1Gj7RVKSPY0I1u/RMQ==
X-CSE-MsgGUID: Z7e1b9YPR9GjKK1JyrOG4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="273302261"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 29 Sep 2026 17:49:45 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBiVz-000000001eR-1v7M;
	Wed, 30 Sep 2026 00:49:43 +0000
Date: Wed, 30 Sep 2026 02:49:00 +0200
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/vgic-last_lr_irq-fixes 1/8]
 include/linux/kvm_host.h:571:83: error: expected ')'
Message-ID: <202609300250.DJh814mB-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_174948_131835_169C528E 
X-CRM114-Status: GOOD (  10.21  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/vgic-last_lr_irq-fixes
head:   df9d6ca852c63334018676675870385055271f5a
commit: 863b2c5b18c975f73dd3008fac1a97b9168687a3 [1/8] KVM: Guarantee acquire semantics to kvm_vcpu_exiting_guest_mode()
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20260930/202609300250.DJh814mB-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7615da10b75c57286a4032eac8bb43c1b8d2ba46)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609300250.DJh814mB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609300250.DJh814mB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/asm-offsets.c:37:
   In file included from arch/powerpc/include/asm/dbell.h:17:
   In file included from arch/powerpc/include/asm/kvm_ppc.h:19:
>> include/linux/kvm_host.h:571:83: error: expected ')'
     571 |         return (cmpxchg(&vcpu->mode, IN_GUEST_MODE, EXITING_GUEST_MODE) == IN_GUEST_MODE :
         |                                                                                          ^
   include/linux/kvm_host.h:571:9: note: to match this '('
     571 |         return (cmpxchg(&vcpu->mode, IN_GUEST_MODE, EXITING_GUEST_MODE) == IN_GUEST_MODE :
         |                ^
   1 error generated.
   make[3]: *** [scripts/Makefile.build:185: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1425: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +571 include/linux/kvm_host.h

   559	
   560	static inline int kvm_vcpu_exiting_guest_mode(struct kvm_vcpu *vcpu)
   561	{
   562		/*
   563		 * The memory barrier ensures a previous write to vcpu->requests cannot
   564		 * be reordered with the read of vcpu->mode.  It pairs with the general
   565		 * memory barrier following the write of vcpu->mode in VCPU RUN.
   566		 *
   567		 * cmpxchg() is not ordered when failing, so make sure we perform an
   568		 * acquire in that case.
   569		 */
   570		smp_mb__before_atomic();
 > 571		return (cmpxchg(&vcpu->mode, IN_GUEST_MODE, EXITING_GUEST_MODE) == IN_GUEST_MODE :
   572			IN_GUEST_MODE : smp_load_acquire(&vcpu->mode));
   573	}
   574	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

