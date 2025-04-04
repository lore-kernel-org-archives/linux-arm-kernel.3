Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B135C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 13:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i8cR9zwHtfrGwAZzZvi07Fb5vpqwnNfXNFjt+wO/qS0=; b=cvsOQ134ojpmpcaMF/XaR9U4DM
	PQjAV3hcmGQyUrDsOkIX6UXHLdCtP1i6JQiD9bTHXQucPjdvEicH9WSSO4frqbAaXHoMcRtXazIdH
	HVU6aT3ZVf/+eFJaPfmo69DZhxMyu25okL64mmjv5AuJIvOfr0Tny0sVGmSnJcIMQHlltPKZN1sBx
	8636KwS7ZNIrFokjsrBI2L9ssUJyBIU83PMCXvV1pEbJDrxdiKSX4QxhcIx8cJeJSN4+vVTK/6fm1
	+gAfJkSUCWkulyKIJlC8If5lJdN23+aBnMzS1oZCU2HITCXO0M0Bb805Df/Ndfu3qobrWrINT6trx
	caOgMi5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0hGv-0000000BrHz-2umu;
	Fri, 04 Apr 2025 13:39:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0h5I-0000000BpAh-1bBQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 13:27:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9494945063;
	Fri,  4 Apr 2025 13:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FC9BC4CEDD;
	Fri,  4 Apr 2025 13:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743773268;
	bh=hbSvXiBm9+ecDREEoF8K9gTlgChPGoVUykMZmaDm+6o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PTJUHtQgiGAVjWZVpHELgRO9Y4YrwfoUmAp2LmJIckrB0H+DP8Uvktuv/kG3rixHg
	 ggHHsYVZpPXo6jJPZQ2lwGyJE7ehQsrhsy/g3r6h1dpVXckr359ikSnEWilL9ZND0Q
	 r7f68x7Y1aX6rXOr7uZ8J4+f9HzSMrl/7MV24G9vB7vKsqw9Gej0EIHc09YPdAS1dN
	 g2N+U6BzMEEyGagyDfoS8FYQF1irwu11c1/9PGWrPHmD9q9AAUIGmeiW8+KNmTds8C
	 Y6vhbfwTLFGU5oBVJ+OyW7O78ic7f54mgd5ybz/bT2KysNYyZjSJGCA7VUyUZ3wsZF
	 tUzZK+4yIER+A==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 04 Apr 2025 14:23:39 +0100
Subject: [PATCH RESEND 6.1 06/12] KVM: arm64: Remove host FPSIMD saving for
 non-protected KVM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-stable-sve-6-1-v1-6-cd5c9eb52d49@kernel.org>
References: <20250404-stable-sve-6-1-v1-0-cd5c9eb52d49@kernel.org>
In-Reply-To: <20250404-stable-sve-6-1-v1-0-cd5c9eb52d49@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Oliver Upton <oliver.upton@linux.dev>, Oleg Nesterov <oleg@redhat.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
 Mark Brown <broonie@kernel.org>, stable@vger.kernel.org, 
 Mark Rutland <mark.rutland@arm.com>, Fuad Tabba <tabba@google.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3037; i=broonie@kernel.org;
 h=from:subject:message-id; bh=uTm4PvNAnNOKeIcBzhUY58bCxrtjcjA28blOXgiiseU=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhvT39wxtFU6Fmt71K12zwlJNWu9wwpRw7511af2Kp68tWe6z
 0T6lk9GYhYGRi0FWTJFl7bOMVenhElvnP5r/CmYQKxPIFAYuTgGYyA9t9n8GW8LedOokhfrPPcR8Ki
 yHL69OyfLe3DmW78MuLldaoVNhXaKxOeurVeCpaK113eutDzxLTjrpYOKzWYujPeC7aME8f93+WrPt
 5vxCZXdLuKPTWiT/XKrbr7bTOKlLTWKDXoe46sQffzpv/ws5vdz3h/K/jWe2yAQfMIh6uoZH8ZjWLg
 HJl4yqeU/cT/cHPo7/kC+ufsHn4fX1GqnSFxjsDHmKPO48dQ5YVxn/wmJCA2vLqYfftnXtLIw786jo
 0YfKngMP+oJy7st16mSV+CQs7Ao46Xek0jGs/kDWJL2arn/tAp098lZv+Pcn77xZs7ZnT/GcKM1PP1
 9E+4jO2dLdUhU26Y3WHQmJTwLOAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_062748_465025_5DC86CDA 
X-CRM114-Status: GOOD (  16.93  )
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
 3 files changed, 7 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 0e9b093adc67..7f187ac24e5d 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -380,7 +380,6 @@ struct kvm_vcpu_arch {
 	struct kvm_guest_debug_arch vcpu_debug_state;
 	struct kvm_guest_debug_arch external_debug_state;
 
-	struct user_fpsimd_state *host_fpsimd_state;	/* hyp VA */
 	struct task_struct *parent_task;
 
 	struct {
diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
index 1765f723afd4..ee7c59f96451 100644
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
index 081aca8f432e..50e6f3fcc27c 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -207,10 +207,6 @@ static bool kvm_hyp_handle_fpsimd(struct kvm_vcpu *vcpu, u64 *exit_code)
 	}
 	isb();
 
-	/* Write out the host state if it's in the registers */
-	if (vcpu->arch.fp_state == FP_STATE_HOST_OWNED)
-		__fpsimd_save_state(vcpu->arch.host_fpsimd_state);
-
 	/* Restore the guest state */
 	if (sve_guest)
 		__hyp_sve_restore_guest(vcpu);

-- 
2.39.5


