Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFF8C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 00:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+RlBFQKcUm851xKaMijOjPf8mHiI9ukDgAYZnStDiIk=; b=S2u7/i5SuR0v91jnjNu7G3g6ys
	w9MUkSjNj1S7RDk6ClDHBS+aTMiOXK/upJ7qNKQ84yqFMruuWaOxjsoy9CXYf7M/eIH0ZSEpl63sF
	FmyoZCVfDarL9K4GS+10KnH//QcXP6iohgnc4CMpoiZSlnbJ7IyeZvMY2OX50HQUSxWFvtqoQNilg
	WwyhbRX0l29g9rqWnnE3uyI+hFG/cDEzt86qtsmPS/9zGQDzu2PzhuCZHaLULacJeo0pHp0Ju2MCh
	4yZzMa/U5OMi99xLpuRdrepk48a8Zc+/QHxjopzvgt+7QRsj+PcqQIVbqFii6qjFxJiRN4EfBG6w8
	zlTgORiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvQZ3-0000000Dahe-1AiR;
	Fri, 21 Mar 2025 00:48:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvQ5i-0000000DXUO-01rH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 00:18:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6E8DB5C6827;
	Fri, 21 Mar 2025 00:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BE19C4CEDD;
	Fri, 21 Mar 2025 00:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742516305;
	bh=ehJMCPrMwHOlFomdHlkXQQW8qPj0SLCNghFqe+fTFOM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uhok4P0S6bgzI3Z7aFQKSSP/QCgeqUlIoUmipEsI4u6KJ2HPCO3jjFiuZcXamCWG9
	 P3bjVGzgsz8uWUslAoCpwoK+rVvPeox3BoE1niMr10DmrUjWyt4hAFYjhQD76k4k+a
	 QAtcb25F+gNpDsglUV1/hVjwAmr2YNkb0OVAfdQCJBtRy2uywPzuNsGPWuZR4FG+Ts
	 Nfs1moG/y1hz79wbnkK9hQNToVmLnkw4W8K9ZbCoQ6gpOO4PQCaRu8FSxUfSeRrRmq
	 WG13BzkxQrtouG3M+fY7goSEHoXdTb3JVc9E9kjaNZSCN7pVdTHZhQNVfoY4a82rwF
	 B4gsMLORcLTBA==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 21 Mar 2025 00:16:03 +0000
Subject: [PATCH 6.6 3/8] KVM: arm64: Remove host FPSIMD saving for
 non-protected KVM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250321-stable-sve-6-6-v1-3-0b3a6a14ea53@kernel.org>
References: <20250321-stable-sve-6-6-v1-0-0b3a6a14ea53@kernel.org>
In-Reply-To: <20250321-stable-sve-6-6-v1-0-0b3a6a14ea53@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Fuad Tabba <tabba@google.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=3882; i=broonie@kernel.org;
 h=from:subject:message-id; bh=RFWrMPCwzs0NH7GB08LQFJjXWfWPvpZMwKDg1phGkog=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBn3LA8ZtpxXliTO/VwpxtBvZVJylNzVfVYCbmDkzaj
 Xd/IK9aJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ9ywPAAKCRAk1otyXVSH0MbzB/
 wP53p1K4tkyva6gQKK/UQ2Am19w+vVgl1NQvUVQqQLG9B3EKdjC22dwXpA7xe8hotvZZdSHx9pjV7r
 tLOBh6K7tR4/HMm+D0XHhkhwaW7aa1kMUG/qomMwllR2qknV+1n2J6rnUZ+ZVb37Fk6MEXfAqw0ent
 j60z/STYlcC0O7caND8km2ZkzA1eQHCgfAO5JFacPKMAOqmEUGkU/wMx7zZlYmYMk7rJA0pMtV9LN1
 ulJgMiNYrDFJ33yFuEer869qv7lQfrsDRKOE6Hv7n8kldwUgodnXc+pCqr9ba084WVPN7sUO0cF+ti
 7KluJRVG4ZWjQWnlHBo+dXSO+hfwdK
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_171826_139541_0259BC00 
X-CRM114-Status: GOOD (  17.48  )
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

From: Mark Rutland <mark.rutland@arm.com>

[ Upstream commit 8eca7f6d5100b6997df4f532090bc3f7e0203bef ]

Now that the host eagerly saves its own FPSIMD/SVE/SME state,
non-protected KVM never needs to save the host FPSIMD/SVE/SME state,
and the code to do this is never used. Protected KVM still needs to
save/restore the host FPSIMD/SVE state to avoid leaking guest state to
the host (and to avoid revealing to the host whether the guest used
FPSIMD/SVE/SME), and that code needs to be retained.

Remove the unused code and data structures.

To avoid the need for a stub copy of kvm_hyp_save_fpsimd_host() in the
VHE hyp code, the nVHE/hVHE version is moved into the shared switch
header, where it is only invoked when KVM is in protected mode.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Tested-by: Mark Brown <broonie@kernel.org>
Acked-by: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
Link: https://lore.kernel.org/r/20250210195226.1215254-3-mark.rutland@arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h       | 1 -
 arch/arm64/kvm/fpsimd.c                 | 2 --
 arch/arm64/kvm/hyp/include/hyp/switch.h | 4 ----
 arch/arm64/kvm/hyp/nvhe/hyp-main.c      | 1 -
 4 files changed, 8 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 6a165ec5d3b74ece3e98e7bf45f3ea94cc30e6ec..3891963d42e00c8f999886dc5d7322bbacbc6c7f 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -535,7 +535,6 @@ struct kvm_vcpu_arch {
 	struct kvm_guest_debug_arch vcpu_debug_state;
 	struct kvm_guest_debug_arch external_debug_state;
 
-	struct user_fpsimd_state *host_fpsimd_state;	/* hyp VA */
 	struct task_struct *parent_task;
 
 	struct {
diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
index 8b55de502c8c220e15e3a6b782d5012b9349b612..7c36d2a7aa3196056f76acfe8f9c41763ed67d9d 100644
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -49,8 +49,6 @@ int kvm_arch_vcpu_run_map_fp(struct kvm_vcpu *vcpu)
 	if (ret)
 		return ret;
 
-	vcpu->arch.host_fpsimd_state = kern_hyp_va(fpsimd);
-
 	/*
 	 * We need to keep current's task_struct pinned until its data has been
 	 * unshared with the hypervisor to make sure it is not re-used by the
diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index 9cfe6bd1dbe459cb3588bccd94359369a546947e..1cdc8d161e7dd3aeeb6b03170e239b0c1ace7790 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -321,10 +321,6 @@ static bool kvm_hyp_handle_fpsimd(struct kvm_vcpu *vcpu, u64 *exit_code)
 	}
 	isb();
 
-	/* Write out the host state if it's in the registers */
-	if (vcpu->arch.fp_state == FP_STATE_HOST_OWNED)
-		__fpsimd_save_state(vcpu->arch.host_fpsimd_state);
-
 	/* Restore the guest state */
 	if (sve_guest)
 		__hyp_sve_restore_guest(vcpu);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 67cc07283e642ab07e1c98c5745e2c6a2dd4f36e..8390173f7f5b38e01c04ae6563853df11a1c3df2 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -41,7 +41,6 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 	hyp_vcpu->vcpu.arch.fp_state	= host_vcpu->arch.fp_state;
 
 	hyp_vcpu->vcpu.arch.debug_ptr	= kern_hyp_va(host_vcpu->arch.debug_ptr);
-	hyp_vcpu->vcpu.arch.host_fpsimd_state = host_vcpu->arch.host_fpsimd_state;
 
 	hyp_vcpu->vcpu.arch.vsesr_el2	= host_vcpu->arch.vsesr_el2;
 

-- 
2.39.5


