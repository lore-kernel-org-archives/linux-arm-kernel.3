Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB9110ED65E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MorT9+svurKSsp87Tda9RA/kcx4IhoAUHVy48kp3aEk=; b=OPOPrDhRHmuOdhF9lprnMHLhqy
	WVZ3oS/P5eAg3kfrnq4+c1qtPZCAm9xN3ZsegJgpBlcPglSC8v/mqJT/FwlS3fTu1VW7O821Julsp
	MNob8o1yQGtSFEV9HYvyFPXFCEGqhOd1zo6hiUxrPPym5ycEPOBrzLoYH1ZaG7ls9krCz7cmBFLWc
	pNBZk7Mr3vchFWYuwj71L3Ds00jEFiiFfdMa3RNztQ3okvgRx7y7FvUtPCd0ugIjKj7GksUIxrWqe
	VIGiTmjihlJsAnhKrxuD81cAKaw6gN9hde3dZnR/gPVmifz7BFkq6bS1eQ/IWwzxF0/bImOSTpv7U
	988kyIXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65Ub-00000007FG2-0noD;
	Fri, 27 Mar 2026 11:36:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65UH-00000007F0X-1k53
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:36:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AD31340AF5;
	Fri, 27 Mar 2026 11:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A0EC2BC9E;
	Fri, 27 Mar 2026 11:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774611384;
	bh=1945uWrxwNslBzTSapDbIB81Prp34pHOmT5p20fTkGM=;
	h=From:To:Cc:Subject:Date:From;
	b=VFX8eX55UA1C+SFaBNAJHlbF8m2WxXRJePQ8QZDtHzyzDlk2Z67xZbsCz5HItjTIQ
	 gxysCUXAruN4kQfkuBem1tnzNWo+1f6Gc/CJWi7znOawOh2/lwILVqzCmHDqRysz89
	 aS2pG1Z5U4WnIh7/f8O/PI98LP4CGrsrkQJo1DjCZR9D+ZBS4aQlIxDRpGcywAgqaN
	 OJzca0rBimBlW/PqF4JLfxErjOqdu4FM5K8w/Zh4LD+wQo+xk7yE0x/8lVPRLFKpPb
	 CbKWsQgFVuJ4Lqbk5kdvjKnljC0rwulNN/b2D+PqEZVxr1YlZVuvYEHdwNpWYwtqZ2
	 Jgs4fWKeSWAMQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w65UE-00000006K4a-06SS;
	Fri, 27 Mar 2026 11:36:22 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>
Subject: [PATCH v2 00/30] KVM: arm64: Combined user_mem_abort() rework
Date: Fri, 27 Mar 2026 11:35:48 +0000
Message-ID: <20260327113618.4051534-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, qperret@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_043625_494976_F39190D9 
X-CRM114-Status: UNSURE (   9.30  )
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

Fuad and I have been working on this "put a stick of dynamite in
user_mem_abort() and watch the resulting firework" project, and it
looks surprisingly OK so far. Disappointingly so, I'd even say.

This v2 is has very few changes from the original posting (cleaning up
the comments in Fuad's series [1], and some minor restructuring in
mine [2]), but I wanted to post the combined series for people's
awareness and for the sake of running it through sashiko.

If nothing catches fire, I'll may end-up taking it into 7.1.

[1] https://lore.kernel.org/all/20260306140232.2193802-1-tabba@google.com
[2] https://lore.kernel.org/all/20260316175451.1866175-1-maz@kernel.org

Fuad Tabba (13):
  KVM: arm64: Extract VMA size resolution in user_mem_abort()
  KVM: arm64: Introduce struct kvm_s2_fault to user_mem_abort()
  KVM: arm64: Extract PFN resolution in user_mem_abort()
  KVM: arm64: Isolate mmap_read_lock inside new
    kvm_s2_fault_get_vma_info() helper
  KVM: arm64: Extract stage-2 permission logic in user_mem_abort()
  KVM: arm64: Extract page table mapping in user_mem_abort()
  KVM: arm64: Simplify nested VMA shift calculation
  KVM: arm64: Remove redundant state variables from struct kvm_s2_fault
  KVM: arm64: Simplify return logic in user_mem_abort()
  KVM: arm64: Initialize struct kvm_s2_fault completely at declaration
  KVM: arm64: Optimize early exit checks in kvm_s2_fault_pin_pfn()
  KVM: arm64: Hoist MTE validation check out of MMU lock path
  KVM: arm64: Clean up control flow in kvm_s2_fault_map()

Marc Zyngier (17):
  KVM: arm64: Kill fault->ipa
  KVM: arm64: Make fault_ipa immutable
  KVM: arm64: Move fault context to const structure
  KVM: arm64: Replace fault_is_perm with a helper
  KVM: arm64: Constrain fault_granule to kvm_s2_fault_map()
  KVM: arm64: Kill write_fault from kvm_s2_fault
  KVM: arm64: Kill exec_fault from kvm_s2_fault
  KVM: arm64: Kill topup_memcache from kvm_s2_fault
  KVM: arm64: Move VMA-related information to kvm_s2_fault_vma_info
  KVM: arm64: Kill logging_active from kvm_s2_fault
  KVM: arm64: Restrict the scope of the 'writable' attribute
  KVM: arm64: Move kvm_s2_fault.{pfn,page} to kvm_s2_vma_info
  KVM: arm64: Replace force_pte with a max_map_size attribute
  KVM: arm64: Move device mapping management into kvm_s2_fault_pin_pfn()
  KVM: arm64: Directly expose mapping prot and kill kvm_s2_fault
  KVM: arm64: Simplify integration of adjust_nested_*_perms()
  KVM: arm64: Convert gmem_abort() to struct kvm_s2_fault_desc

 arch/arm64/kvm/mmu.c | 507 +++++++++++++++++++++++++------------------
 1 file changed, 299 insertions(+), 208 deletions(-)

-- 
2.47.3


