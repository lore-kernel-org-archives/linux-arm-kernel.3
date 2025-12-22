Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8DCE677FD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 16:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7q8wRM/8v+Uftt6ArKO5GhO4Kdfpa2N8hxqGhl858H0=; b=JnqRGLpiF8thszespeDe1xMtlf
	RdZWs8y0G09R+TkzWpEfKLeiQkTqhSsON0GC57bj1UWJAYxejxOZzErIIcJsIdDezzGZnAh80BEi6
	Hs4dBcAsFkaAxdTNEJ1bT5soz2A4R/Vi4dX5Y4pdA4c1yiYZYuEMLkeeom5gCWX0vNYXKwQOjHSh2
	DrNNc39ZB2bFMU/pcw9RMe19hOA73UXMDBjU44SOcSzoRGfxUNCRhAw6nuALLKHfq6+9sSBdnpLer
	NC4ks0D6ULUmON7XzZjCe0vZiy8CmsiYWDjoORncbiuwVPBkTU8sPKGjHcOr3HiIURASGj6sHYCXR
	BxjGknbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXjA2-0000000Dzbp-3CHs;
	Mon, 22 Dec 2025 16:53:30 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXjA0-0000000DzbT-0RYG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 16:53:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766422408; x=1797958408;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SLzPCyVSf2GCKYqR6ihp41nIyXMktxWN6o79iAcwaVc=;
  b=grEnWQ+BFTD3cZYfM4HaLe4om01wW2b8wMQCLUqV7EVXzpJthfReELMs
   wVc53/QXaR6T5r3x7C8rV8axnpqCgZ/ANICpVfxCS8tluy/3DRR0uX5bm
   dmr09nMOdQZcGf51URBFUDX2dwdnDG3mXNqkAIvFp6dVoD7OaTpOrPpii
   GKEidCOYOa75q1ZoIHnoJ6wQKBmqG22SrIVNdhiWW0H5ERmYA3Z9Cmbj3
   /Mg8IVjYlrVK91T66n737ExFXpXaxfNGX09W6wdtwpvGZqOq/eKLUhnfC
   o9Z6GLTeWnCE8QQ/45iABSsibtGUs3/W1qeQxrBrBhqXr/4Uk5hRP2KMO
   g==;
X-CSE-ConnectionGUID: cUagrNQ6RVqU773OKAqjBQ==
X-CSE-MsgGUID: Gq7KhJ/6R9GRS/lzQeFLmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="55849969"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="55849969"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 08:53:26 -0800
X-CSE-ConnectionGUID: 6fDkPJhHRFmrLp8CGDNaLQ==
X-CSE-MsgGUID: AZDQkn5AQxWF4NRtHppNNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="204049302"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 22 Dec 2025 08:53:22 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXj9s-000000005Ym-1Tsx;
	Mon, 22 Dec 2025 16:53:20 +0000
Date: Mon, 22 Dec 2025 17:52:47 +0100
From: kernel test robot <lkp@intel.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, nd <nd@arm.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	Joey Gouly <Joey.Gouly@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Timothy Hayes <Timothy.Hayes@arm.com>
Subject: Re: [PATCH 14/32] KVM: arm64: gic-v5: Implement GICv5 load/put and
 save/restore
Message-ID: <202512221751.nHKObHNq-lkp@intel.com>
References: <20251212152215.675767-15-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212152215.675767-15-sascha.bischoff@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_085328_183780_51A90656 
X-CRM114-Status: GOOD (  13.87  )
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

Hi Sascha,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.19-rc2 next-20251219]
[cannot apply to kvmarm/next arm64/for-next/core kvm/queue kvm/next kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sascha-Bischoff/KVM-arm64-Account-for-RES1-bits-in-DECLARE_FEAT_MAP-and-co/20251212-233140
base:   linus/master
patch link:    https://lore.kernel.org/r/20251212152215.675767-15-sascha.bischoff%40arm.com
patch subject: [PATCH 14/32] KVM: arm64: gic-v5: Implement GICv5 load/put and save/restore
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251222/202512221751.nHKObHNq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ecaf673850beb241957352bd61e95ed34256635f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512221751.nHKObHNq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221751.nHKObHNq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:16:
   In file included from ./include/linux/kvm_host.h:45:
   In file included from ./arch/arm64/include/asm/kvm_host.h:36:
>> ./include/kvm/arm_vgic.h:392:19: error: field has incomplete type 'struct gicv5_vpe'
     392 |         struct gicv5_vpe gicv5_vpe;
         |                          ^
   ./include/kvm/arm_vgic.h:392:9: note: forward declaration of 'struct gicv5_vpe'
     392 |         struct gicv5_vpe gicv5_vpe;
         |                ^
   1 error generated.


vim +392 ./include/kvm/arm_vgic.h

   360	
   361	struct vgic_v5_cpu_if {
   362		u64	vgic_apr;
   363		u64	vgic_vmcr;
   364	
   365		/* PPI register state */
   366		u64	vgic_ppi_hmr[2];
   367		u64	vgic_ppi_dvir[2];
   368		u64	vgic_ppi_priorityr[16];
   369	
   370		/* The pending state of the guest. This is merged with the exit state */
   371		u64	vgic_ppi_pendr[2];
   372	
   373		/* The state flushed to the regs when entering the guest */
   374		u64	vgic_ppi_activer_entry[2];
   375		u64	vgic_ich_ppi_enabler_entry[2];
   376		u64	vgic_ppi_pendr_entry[2];
   377	
   378		/* The saved state of the regs when leaving the guest */
   379		u64	vgic_ppi_activer_exit[2];
   380		u64	vgic_ich_ppi_enabler_exit[2];
   381		u64	vgic_ppi_pendr_exit[2];
   382	
   383		/*
   384		 * The ICSR is re-used across host and guest, and hence it needs to be
   385		 * saved/restored. Only one copy is required as the host should block
   386		 * preemption between executing GIC CDRCFG and acccessing the
   387		 * ICC_ICSR_EL1. A guest, of course, can never guarantee this, and hence
   388		 * it is the hyp's responsibility to keep the state constistent.
   389		 */
   390		u64	vgic_icsr;
   391	
 > 392		struct gicv5_vpe gicv5_vpe;
   393	};
   394	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

