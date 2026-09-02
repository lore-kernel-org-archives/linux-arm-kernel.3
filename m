Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26608C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 01:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eLo9S8PuOg5HvUQkJbCZdrhcdLFN1mpCpBFRPejbhUs=; b=RbUdrpxFgDe6mHy09mqpbeKZYN
	iVgc6zT2P9tDWMGWdr2Q/yUWMADg+mbV2PEtsAcRDj1f3QXEUh5xcLkmn+icZhhXJNxsg8Hotmqee
	QodwSvKZyORdCYOmvUCbL/TuaUNdbBQNMuEN8rnnaem/Zv0FkLYblfOpBEymcKczlCuk4dLhFruF7
	FAhaYYYepj1dTjnYwTOpZValOjoTmQ/TZvxDYT9zaBlb+yNsphAu8q/TkvVTHmDldC09lLNTZU6Q/
	IMLupbbFmrGeOeC7njZP+/ZZ4Rp/lqHmt/p7Zn60zn6LBJlzZhJ4BrDZET5aSv42eO7rqrGthOuGp
	VMepR0bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1a44-0000000De1z-11ST;
	Wed, 02 Sep 2026 01:47:00 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1a40-0000000De1Q-2iN7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 01:46:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788313616; x=1819849616;
  h=date:from:to:cc:subject:message-id;
  bh=iE0qA2/7PV2SFwoLVDG51fTE95ezA9s75pujqNV61FM=;
  b=fUapTBBYEe2EHtekucEmYZBiaqktFoYLykdbQG3qTJExAB207bmul73m
   z4VPk0FOxRMw8DCN+8gBWwTK9w3ZBxiZWS+9Yzw94bM72pxMQfGR9RJgr
   n+H00uPaFq/z2w8vrVhPD4+UGGvHlAkphmoUwfc+b+CBwVTCW5615soRx
   LAp/5OZnRH81nz360dsLs+hYIM+MACIvuvQLHVixihApYn+Uuuop6Z5w2
   nyxoaWR3bFRPuddgy3vkkoAkO0/MykbJcYrgvUljtQXD//2wLvBzZyWwK
   fMxlrC2scNITs96QZ1zsvsUb1yWcqGVdFY6LGwboGAX5EInB1Xs34bUhx
   A==;
X-CSE-ConnectionGUID: guER5pt/QhOUf0BpuXbBdQ==
X-CSE-MsgGUID: nYnelqM4TBS6X27yYfpa8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="87698857"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="87698857"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 18:46:54 -0700
X-CSE-ConnectionGUID: f2X8yTNDRfW9ga8iYW9T/Q==
X-CSE-MsgGUID: rBf27dSjSB2BSqS2GHr0rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="269290220"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 Sep 2026 18:46:52 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1a3t-000000001jG-2G3l;
	Wed, 02 Sep 2026 01:46:49 +0000
Date: Wed, 02 Sep 2026 09:46:43 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/nv3 19/19]
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h:207:2: warning: variable '__val'
 is uninitialized when used within its own initialization
Message-ID: <202609020944.8Ffx8eaS-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_184656_704837_CFC2F98D 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/nv3
head:   ae6cf96796e7f11ecba10429d64400e708687cdf
commit: ae6cf96796e7f11ecba10429d64400e708687cdf [19/19] KVM: arm64: Avoid writing to MDSCR_EL1 unless necessary
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260902/202609020944.8Ffx8eaS-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 678058af7da6a20593d8bb23076dc4773f9e55f1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260902/202609020944.8Ffx8eaS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609020944.8Ffx8eaS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/vhe/sysreg-sr.c:7:
>> arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h:207:2: warning: variable '__val' is uninitialized when used within its own initialization [-Wuninitialized]
     207 |         sysreg_cond_write(*ctxt_mdscr_el1(ctxt), mdscr_el1);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/sysreg.h:1222:16: note: expanded from macro 'sysreg_cond_write'
    1222 |                 write_sysreg(__val, sysreg);                            \
         |                 ~~~~~~~~~~~~~^~~~~~~~~~~~~~
   arch/arm64/include/asm/sysreg.h:1179:20: note: expanded from macro 'write_sysreg'
    1179 |         u64 __val = (u64)(v);                                   \
         |             ~~~~~         ^
   1 warning generated.


vim +/__val +207 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h

   199	
   200	static inline void __sysreg_restore_common_state(struct kvm_cpu_context *ctxt)
   201	{
   202		/*
   203		 * KVM NV traps writes to MDSCR_EL1, as the access is
   204		 * otherwise written to memory, with no effects. Avoid the
   205		 * high trap cost by only writing if the value has changed.
   206		 */
 > 207		sysreg_cond_write(*ctxt_mdscr_el1(ctxt), mdscr_el1);
   208	
   209		// POR_EL0 can affect uaccess, so must be saved/restored early.
   210		if (ctxt_has_s1poe(ctxt))
   211			write_sysreg_s(ctxt_sys_reg(ctxt, POR_EL0),	SYS_POR_EL0);
   212	}
   213	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

