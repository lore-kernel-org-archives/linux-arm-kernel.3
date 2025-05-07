Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2F0C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qeabkBspSapmUgw5zWz1Kepb2Glds3c5gEzzUCyd1PQ=; b=sUU8TQXH51fNHkIrUFknTpnmLh
	Mk6hyWnfztwt9CZ6hm3/A245KWKqJ/t6Tv5ZysLhi/kOPmN+oeh+xlWyjNkqubbd06MnrTtpVP5gp
	gb7HA4JNSQkbw0cIdkxbYboom56CazgnMWl4hlj8ds8z1a3LsggThiwwe0RtYj5QskozIZPUrvlqz
	1QSCjDgbKS7rNy9rEXXdl5j+omMt+FRDvzExj+wn0CxEG9nqEonWIOnQSlVeuXc7Av/8z/rS+TUrP
	tSWVAuDYbG86ayNmO4TeLqywMD2qqNlsnCFhSrp6jjzzjWHPhWPcmcWtwKCBdbOvXwOBW/+esoW9x
	bjlLPbdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCieX-0000000GM0O-3DHV;
	Wed, 07 May 2025 17:33:53 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiD9-0000000GFfS-31l8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 17:05:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746637536; x=1778173536;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QjXPtL2Z0FqNpEjJnoeiA6m6hX40d2nW0ON106J55h8=;
  b=eNslqdXpsMIFCZIqhayk9Dzn4KSCQF3P/bQ82PwtWcA06YDDEP+Dv8cj
   Dp17ILTb6XgE/kRxgfuLwtdnz6+NurDkf9i+s4eaCIAHJ2yxDNWzyI/8S
   ciUQtrYnQea1pp5J3saSmAJWpqugSb7v2dvElK754xls4WvNsEH2N2/no
   qkH1MpnPZYBHgukbjLprVI/3DlMwSKSbXoR5gsd3VZ2Mgly04L6wddFTw
   Qzv5cmlZpfWBoZac4WZScw18QM/i46z7QFxC8q9n8LD0Dhfgq+Iq3AXdv
   ZhuRIDqEmkCzvMpgL+R38Uc/LhHRBVdcE7JW2yDGPd7yRiTE3dajDhlU9
   Q==;
X-CSE-ConnectionGUID: JgscU61VTcW/QB7cVgDyVg==
X-CSE-MsgGUID: xLPhldvWSNm5skanQgAkCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="47483873"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="47483873"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 10:05:29 -0700
X-CSE-ConnectionGUID: EUj57wh/TIG5s2ri294RQw==
X-CSE-MsgGUID: LstyuS/4R5uY8DhjXubgTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="136037095"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 May 2025 10:05:21 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCiCs-0008CH-2V;
	Wed, 07 May 2025 17:05:18 +0000
Date: Thu, 8 May 2025 01:04:31 +0800
From: kernel test robot <lkp@intel.com>
To: Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, "H. Peter Anvin" <hpa@zytor.com>,
	x86@kernel.org, Maxim Levitsky <mlevitsk@redhat.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Kunkun Jiang <jiangkunkun@huawei.com>,
	Jing Zhang <jingzhangos@google.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Keisuke Nishimura <keisuke.nishimura@inria.fr>,
	Anup Patel <anup@brainfault.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Atish Patra <atishp@atishpatra.org>, kvmarm@lists.linux.dev,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Peter Zijlstra <peterz@infradead.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sebastian Ott <sebott@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Ingo Molnar <mingo@redhat.com>, Alexandre Ghiti <alex@ghiti.fr>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v3 1/4] arm64: KVM: use mutex_trylock_nest_lock when
 locking all vCPUs
Message-ID: <202505080024.CZZ0ssB5-lkp@intel.com>
References: <20250430202311.364641-2-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430202311.364641-2-mlevitsk@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_100535_777448_AF0168CC 
X-CRM114-Status: GOOD (  14.68  )
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

Hi Maxim,

kernel test robot noticed the following build errors:

[auto build test ERROR on kvm/queue]
[also build test ERROR on kvm/next kvmarm/next tip/locking/core linus/master v6.15-rc5 next-20250507]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxim-Levitsky/arm64-KVM-use-mutex_trylock_nest_lock-when-locking-all-vCPUs/20250501-042643
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20250430202311.364641-2-mlevitsk%40redhat.com
patch subject: [PATCH v3 1/4] arm64: KVM: use mutex_trylock_nest_lock when locking all vCPUs
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20250508/202505080024.CZZ0ssB5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505080024.CZZ0ssB5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505080024.CZZ0ssB5-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/../../../virt/kvm/kvm_main.c: In function 'kvm_trylock_all_vcpus':
>> arch/x86/kvm/../../../virt/kvm/kvm_main.c:1381:22: error: implicit declaration of function 'mutex_trylock_nest_lock'; did you mean 'mutex_lock_nest_lock'? [-Werror=implicit-function-declaration]
    1381 |                 if (!mutex_trylock_nest_lock(&vcpu->mutex, &kvm->lock))
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
         |                      mutex_lock_nest_lock
   cc1: some warnings being treated as errors


vim +1381 arch/x86/kvm/../../../virt/kvm/kvm_main.c

  1370	
  1371	/*
  1372	 * Try to lock all of the VM's vCPUs.
  1373	 * Assumes that the kvm->lock is held.
  1374	 */
  1375	int kvm_trylock_all_vcpus(struct kvm *kvm)
  1376	{
  1377		struct kvm_vcpu *vcpu;
  1378		unsigned long i, j;
  1379	
  1380		kvm_for_each_vcpu(i, vcpu, kvm)
> 1381			if (!mutex_trylock_nest_lock(&vcpu->mutex, &kvm->lock))
  1382				goto out_unlock;
  1383		return 0;
  1384	
  1385	out_unlock:
  1386		kvm_for_each_vcpu(j, vcpu, kvm) {
  1387			if (i == j)
  1388				break;
  1389			mutex_unlock(&vcpu->mutex);
  1390		}
  1391		return -EINTR;
  1392	}
  1393	EXPORT_SYMBOL_GPL(kvm_trylock_all_vcpus);
  1394	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

