Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19481E6F079
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RGj5/vEcKpGfphzRwV0EnCA6Ln6NE3rpLViVG5qI3l8=; b=0A6WPJ6q0aYOjSM2CuAPNbXatp
	gCpS9FBi0VRk9KLTyldzobVA/NNq/W8kA8AaQllEhzj7qNCPCZPue9ovjZK+RQg4lnGR4UZDFV4RS
	svmbp9oJlzDXvI9gHpTcOyv68kKZp/yl9P7THC+c6hFYiEYKjGVKDiVdLxMzZGW8hfxUAFliJqD+m
	tP7Ark6NamFZrQ6gk3ez3u1GC3wQ1dlrGnRJnSbwE4mM3FbKi7bsCsmlqBrYQ2MJGbbizdxMWKZl3
	hcNE67VhGdQB5yuH5jDtiDImGLgwXhlwSXHz9C8EqRTOs4jYmHm/Nte1t1Dx3BOAi82qw+msC/XZm
	jsNVZ0NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzFV-0000000EpeE-3ww2;
	Tue, 23 Dec 2025 10:04:13 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzFO-0000000EpZC-1ZPb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:04:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766484247; x=1798020247;
  h=date:from:to:cc:subject:message-id;
  bh=qj4QEAihXlsQNlgJauaO3CmNuKYw58EgVmTxBEJ09ok=;
  b=DKGrqbpEFrM+twphkJwG2G8r5H+2Dqim+0elawv2KkmkM1tzfGldI24T
   SoXp3xqgsl8Ry8kq2vstzzDrN0+bhdOf6J3Tt/7d1Gmt4XG+IJYOVVii5
   ZBX+7gTCyqGg6aF7xiUQS+3rReN5l/WGVPBmoHv0keco2bxZOwIN6NwVf
   JIxD463bx+PM5hYfffJkocsxyzjwiqryQrG+ScvqfuNrARrSbH6YEB2hV
   yOe4ih65BVWDa2iSp7IYgbPCHO7topQR2x1WkxKi4f0DMyMcuKo4IKW1m
   v6bXtZIxBlKT0FcVhw61/VV0xfcp1Kog87V0zd/PQp9b7piMuhn04y13H
   g==;
X-CSE-ConnectionGUID: Poy+TyC4TkqeTyal8UkHzQ==
X-CSE-MsgGUID: Tt7d4/B0Rey2ZGekHxjYGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68270541"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68270541"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 02:04:06 -0800
X-CSE-ConnectionGUID: uDhFuWaXQLq2uW6SejGaag==
X-CSE-MsgGUID: Xx9F9QUdS1WLtVygN3ahvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="198986343"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 23 Dec 2025 02:04:04 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXzFJ-000000001ij-1Urm;
	Tue, 23 Dec 2025 10:04:01 +0000
Date: Tue, 23 Dec 2025 18:03:30 +0800
From: kernel test robot <lkp@intel.com>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/gicv5-full 62/82]
 arch/arm64/kvm/vgic/vgic-v5.c:896:2-7: WARNING: NULL check before some
 freeing functions is not needed.
Message-ID: <202512231705.sZJLmMXm-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_020406_491252_888E1D69 
X-CRM114-Status: UNSURE (   7.83  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/gicv5-full
head:   1426b88096b597395df4c82f089b87c62bab45da
commit: 9c3aa62ac1b11cec38e958d7f7bf033bf308902d [62/82] KVM: arm64: gic-v5: Add IRS init/teardown to vgic_v5 init/teardown
config: arm64-randconfig-r064-20251223 (https://download.01.org/0day-ci/archive/20251223/202512231705.sZJLmMXm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512231705.sZJLmMXm-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/vgic/vgic-v5.c:896:2-7: WARNING: NULL check before some freeing functions is not needed.

vim +896 arch/arm64/kvm/vgic/vgic-v5.c

   858	
   859	void vgic_v5_teardown(struct kvm *kvm)
   860	{
   861		struct kvm_vcpu *vcpu, *vcpu0;
   862		struct vgic_dist *dist = &kvm->arch.vgic;
   863		unsigned long i;
   864		int rc;
   865	
   866		/*
   867		 * There's a chance we don't have CPUs yet, in which case we've also not
   868		 * initialised the tables.
   869		 */
   870		if (!atomic_read(&kvm->online_vcpus))
   871			goto out_no_vcpus;
   872	
   873		/* Make the VM invalid  */
   874		vcpu0 = kvm_get_vcpu(kvm, 0);
   875		rc = vgic_v5_send_command(vcpu0, VMTE_MAKE_INVALID);
   876		if (rc)
   877			kvm_err("could not make VMTE invalid\n");
   878	
   879		kvm_for_each_vcpu(i, vcpu, kvm) {
   880			/* Goodbye doorbell */
   881			vgic_v5_disable_vcpu(vcpu);
   882	
   883			if (vgic_v5_vmte_free_vpe(vcpu))
   884				kvm_err("Failed to free VPE\n");
   885		}
   886	
   887		vgic_v5_teardown_per_vm_domain(&kvm->arch.vgic.gicv5_vm);
   888	
   889		if (vgic_v5_vmte_release(kvm))
   890			kvm_err("Failed to release VM 0x%x\n", dist->gicv5_vm.vm_id);
   891	
   892		vgic_v5_release_vm_id(kvm);
   893	
   894	out_no_vcpus:
   895		if (dist->vgic_v5_irs_data)
 > 896			kfree(dist->vgic_v5_irs_data);
   897		dist->vgic_v5_irs_data = NULL;
   898	}
   899	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

