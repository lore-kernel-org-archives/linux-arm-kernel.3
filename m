Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FD9CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 19:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q7KEvMciwGamTwHxAnK/ewv8bbFHQ1YXKD+ikm5AJUM=; b=rNZFoMg0AOjM78Rp5j12ZKDlBG
	hgNj3D5/fMMI7uUi69iUgwVU9gc8075LX6J1R2eOuHiUkEXgmfOMJLFK2ITMu1d8kCor5GPI4gdcW
	mWpM0kYjL7THgw2k7nyh6e1pwwtzcuSCTBvRS80hNhCoqTPIh/AN18M/Ey4LmkpivGTHqk8HkCb0l
	kk3j/kOpdTDWaLwFPE2o1kWrVsBlwUtqIhLjv0nULQy2uFF84YhLRxHBiJrsybKqHLkyCClF5o27l
	7fkYbk5BHqFlJVyqwHfCtcPcaLFLjr6YrU9vXwS5rx+gX7yHNDlFeUFPguqbx9USv4CRad0n9/MCt
	Hse8RepA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT2uy-00000008BJq-3nlo;
	Fri, 29 May 2026 19:30:52 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT2uv-00000008BJK-3MCF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 19:30:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780083049; x=1811619049;
  h=date:from:to:cc:subject:message-id;
  bh=QZ/5ipK/QhhxD1HdAIKiPbLGE1KQ3R7JNjuwA3TLQXg=;
  b=lfAC2Z/0zMjGo7e7YeLYezoEd5OGfr2FM+sadRfJM5a5Av70TtEEb/MS
   iv6hJGVP5pbOOg26dCT1Vxpkt53wshQ8Vv2GSrktu4iYlQuEqZpgh/Y/j
   5hlk4mYAVcoKKO3W7crPLHhO8pKxZbZPm1lmpRrJ7U11GQgDzP3iHt68m
   5y6xJ/Cz2pxDRCAkcxBQKLqDYf+hO6Kg34huKWsFhaS8Lhtvifk7o73Aq
   vsC4SunE48f9DJkJILWePa7J3CTxfi1x+WGZ52/xCwOqP995E+SB0hIJo
   /lA6/qcexFhVrOiV72cb/ELfY+/vnkF1VnkucN4VJ4xgvERv6kmBapXR0
   w==;
X-CSE-ConnectionGUID: b0LkswdgS3KUYJFOxSOGxQ==
X-CSE-MsgGUID: wcYG01lXQY6AOOGPQ8S+Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="80794870"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="80794870"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 12:30:47 -0700
X-CSE-ConnectionGUID: 1uz+UkfMTPOhXjDFeWNIUA==
X-CSE-MsgGUID: S8hhaTx6R8mKwH2T6miNtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="241889273"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 May 2026 12:30:46 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wT2up-000000007cM-0ghC;
	Fri, 29 May 2026 19:30:43 +0000
Date: Sat, 30 May 2026 03:29:55 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/nv3 25/32]
 arch/arm64/kvm/hyp/vhe/switch.c:368:22: warning: value size does not match
 register size specified by the constraint and modifier
Message-ID: <202605300331.uAxQip7s-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_123049_877985_1488F32B 
X-CRM114-Status: GOOD (  10.89  )
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
head:   1779d2897784632a8fee0474e0dd5d124a8beeff
commit: f967f8c6811b3c791cb2fd70289b633d04785aa5 [25/32] KVM: arm64: Implement runtime handling of HCRX_EL2.NVTGE==1
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260530/202605300331.uAxQip7s-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605300331.uAxQip7s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605300331.uAxQip7s-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/vhe/switch.c:368:22: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
     368 |                      : [err] "+r" (err), [v] "=&r" (v)
         |                                    ^
   arch/arm64/kvm/hyp/vhe/switch.c:365:16: note: use constraint modifier "w"
     365 |                      "2:        mov     %[err], %[errcode]\n"
         |                                         ^~~~~~
         |                                         %w[err]
   1 warning generated.


vim +368 arch/arm64/kvm/hyp/vhe/switch.c

   350	
   351	static int __vcpu_l1_vncr_read(struct kvm_vcpu *vcpu, enum vcpu_sysreg reg, u64 *val)
   352	{
   353		u64 vncr_va = read_sysreg_s(SYS_VNCR_EL2);
   354		u64 *reg_va = &((u64 *)vncr_va)[reg - __VNCR_START__];
   355		u64 spsr, elr, esr, far, v;
   356		int err = 0;
   357	
   358		spsr = read_sysreg_el2(SYS_SPSR);
   359		elr = read_sysreg_el2(SYS_ELR);
   360		esr = read_sysreg_el2(SYS_ESR);
   361		far = read_sysreg_el2(SYS_FAR);
   362	
   363		asm volatile("1:	ldr	%[v], [%[va]]\n"
   364			     "		b	9f\n"
   365			     "2:	mov	%[err], %[errcode]\n"
   366			     "9:\n"
   367			     __KVM_EXTABLE(1b, 2b)
 > 368			     : [err] "+r" (err), [v] "=&r" (v)
   369			     : [va] "r" (reg_va), [errcode] "i" (-EFAULT));
   370	
   371		if (unlikely(err)) {
   372			unsigned int ec;
   373	
   374			/*
   375			 * We expect this to be ESR_ELx_EC_DABT_CUR, and to be dealt
   376			 * with by the VNCR fault handler on the slow path.
   377			 */
   378			vcpu->arch.fault.esr_el2 = read_sysreg_el2(SYS_ESR);
   379			ec = kvm_vcpu_trap_get_class(vcpu);
   380	
   381			if (!WARN_ONCE(ec != ESR_ELx_EC_DABT_CUR,
   382				       "Unexpected EC=%x reading L1 VNCR\n", ec)) {
   383				vcpu->arch.fault.esr_el2 &= ESR_ELx_EC_MASK | ESR_ELx_FSC;
   384				vcpu->arch.fault.esr_el2 |= ESR_ELx_VNCR | ESR_ELx_IL;
   385				vcpu->arch.fault.far_el2  = read_sysreg_el2(SYS_FAR);
   386			}
   387	
   388			/* Restore the original fault context, just in case */
   389			write_sysreg_el2(spsr, SYS_SPSR);
   390			write_sysreg_el2(elr,  SYS_ELR);
   391			write_sysreg_el2(esr,  SYS_ESR);
   392			write_sysreg_el2(far,  SYS_FAR);
   393	
   394			return err;
   395		}
   396	
   397		/* Apply our own sanitisation, just like HW would... */
   398		*val = kvm_vcpu_apply_reg_masks(vcpu, reg, v);
   399	
   400		return 0;
   401	}
   402	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

