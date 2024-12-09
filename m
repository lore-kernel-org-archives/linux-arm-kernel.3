Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3E4E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 19:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+C0wemJB3C/lSef0G0hoH7hA8RcjUdCGQTP82Vb41a4=; b=OTjD+BdrFdWhIoys8Bl9pVkP4+
	bYDN+XgSI9n23jpSvpLBHhNYBd0Syju8vWTn3bjSKXZ0900wWuGZKUAboydKJIXPnoSJN4gJRLxMs
	H+0Gi2W6BPr86rHxoSFVHnGND1CeKlo+I/jiuuMHWomT6q7hF//9zwPe03mjdmy+UYa70RKARRiX1
	vdOQfmEhqbB4eoe4DU4in1tzzdVi7jzzzTSHYhQM0q4T9142Jq0UE0vbY8PHU1YkO/LxRfa1IIR4r
	ZuwrgK5IvozEWuoX6aSXqPsY0N7jkrtOo/LUZmwiVsukstzq3bKa9qczyh/nsN0GjWuVaUvjWL+C6
	o+gMH1Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKja8-000000094hp-3ht7;
	Mon, 09 Dec 2024 19:38:12 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKjZ5-000000094ZF-2Y6q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 19:37:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733773028; x=1765309028;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MReSg/ADihE6zgaGj+frthB/C+MsbysHrihWVPpu0pI=;
  b=hs6/GhJiC6FMRVMnT9Gud9TFojMjWhLNB+CtQdIiAnsP/MIMISQ7Odhl
   e8vP7ThzcMcNKWcWU0059vqMIhWdjvi3ZZefJ1gN4Z5YXUqaX9pXRfui/
   vymb3oK0Z+Tzm2xedDjeD/gewPNbFE1U+ZxDAENkr/+qpb5a3zyBsZzl0
   N3ybJJHj5vCLocyt4QFTJE7pJ2q+JC4JzA8fIFwmHbOm9B3hkA1HqF6/F
   U2fk0HCBZmgutBf0PASWzRjAwln2k1q0RGyjqOt2JpMxzKiFVBxKuXnaE
   MG2sOC+cI6s6/9lj/t1x7SrpHk1hab1JvFepcRhV/0LhAAnpr5ln7Ruq+
   g==;
X-CSE-ConnectionGUID: kRD4wIJQQKaBdPL1LyTAJQ==
X-CSE-MsgGUID: 28WtoQXfRW+GUiT554as+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="44770049"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="44770049"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 11:37:02 -0800
X-CSE-ConnectionGUID: ewzXBMAaRu+nvLnpHzj5Lw==
X-CSE-MsgGUID: XfCJLZL/SWKU4aZ9z8kW3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="126004877"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Dec 2024 11:36:58 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKjYt-0004lJ-1X;
	Mon, 09 Dec 2024 19:36:55 +0000
Date: Tue, 10 Dec 2024 03:36:09 +0800
From: kernel test robot <lkp@intel.com>
To: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, maz@kernel.org,
	oliver.upton@linux.dev, christoffer.dall@arm.com,
	suzuki.poulose@arm.com, will@kernel.org, catalin.marinas@arm.com,
	coltonlewis@google.com, joey.gouly@arm.com, yuzenghui@huawei.com,
	darren@os.amperecomputing.com, gankulkarni@os.amperecomputing.com,
	vishnu@os.amperecomputing.com
Subject: Re: [PATCH] KVM: arm64: nv: Set ISTATUS for emulated timers, If
 timer expired
Message-ID: <202412100311.HEYAT0bx-lkp@intel.com>
References: <20241209053201.339939-1-gankulkarni@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209053201.339939-1-gankulkarni@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_113707_688177_5BEB94D3 
X-CRM114-Status: GOOD (  11.82  )
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

Hi Ganapatrao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kvmarm/next]
[also build test WARNING on arm64/for-next/core soc/for-next linus/master arm/for-next arm/fixes v6.13-rc2 next-20241209]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ganapatrao-Kulkarni/KVM-arm64-nv-Set-ISTATUS-for-emulated-timers-If-timer-expired/20241209-133651
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git next
patch link:    https://lore.kernel.org/r/20241209053201.339939-1-gankulkarni%40os.amperecomputing.com
patch subject: [PATCH] KVM: arm64: nv: Set ISTATUS for emulated timers, If timer expired
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241210/202412100311.HEYAT0bx-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412100311.HEYAT0bx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412100311.HEYAT0bx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/arch_timer.c:1202:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
    1202 |                 struct timer_map map;
         |                 ^
   1 warning generated.


vim +1202 arch/arm64/kvm/arch_timer.c

  1190	
  1191	static void kvm_arm_timer_write(struct kvm_vcpu *vcpu,
  1192					struct arch_timer_context *timer,
  1193					enum kvm_arch_timer_regs treg,
  1194					u64 val)
  1195	{
  1196		switch (treg) {
  1197		case TIMER_REG_TVAL:
  1198			timer_set_cval(timer, kvm_phys_timer_read() - timer_get_offset(timer) + (s32)val);
  1199			break;
  1200	
  1201		case TIMER_REG_CTL:
> 1202			struct timer_map map;
  1203	
  1204			val &= ~ARCH_TIMER_CTRL_IT_STAT;
  1205			get_timer_map(vcpu, &map);
  1206			/* Set ISTATUS bit for emulated timers, if timer expired. */
  1207			if (timer == map.emul_vtimer || timer == map.emul_ptimer) {
  1208				if (!kvm_timer_compute_delta(timer))
  1209					val |= ARCH_TIMER_CTRL_IT_STAT;
  1210			}
  1211			timer_set_ctl(timer, val);
  1212			break;
  1213	
  1214		case TIMER_REG_CVAL:
  1215			timer_set_cval(timer, val);
  1216			break;
  1217	
  1218		case TIMER_REG_VOFF:
  1219			*timer->offset.vcpu_offset = val;
  1220			break;
  1221	
  1222		default:
  1223			BUG();
  1224		}
  1225	}
  1226	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

