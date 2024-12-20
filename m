Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7188E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 16:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=od4momYPyK7kQpN1zTPIBxGx8m4aSb0ud2n+8ECv+j4=; b=KFcF/P0RzW1n8BUYbgf6pZvcJw
	oEXDpy7lUYKvpthd8K3TgpqZFE0rK5z9fZiVJ9diA6RAydKvlGy03RQRUcnv/QaI6cVeeuWbR9uZ4
	we2vAEO/TtAth2Q5ZxYV1IBYw0f098/suiW78Z+HhGExMuaS8/ZrnF89nJjpn74TDJQCAO5V0JkSF
	zRO7uvk5+CD8rKFBuvHl0pOgD36EayAvKE/caUczTMrkKXIdJpX4xXTwS+wOMJrH0T4gYXpHYccer
	FcrwSQO0+zGmM6XyUEXFoES00yP+Uo8lkycJtYk4F8xd/IYmGZTuNm3KI01BY0+dEL2sOJw1wQhzc
	dhnmoQCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgLA-00000005XXK-13CN;
	Fri, 20 Dec 2024 16:59:04 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgDb-00000005VuP-0efH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 16:51:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F1690A42017;
	Fri, 20 Dec 2024 16:49:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C29C9C4CECD;
	Fri, 20 Dec 2024 16:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734713474;
	bh=phaIeng1WiDU914WINDJrAI0+xgwAcLxe8d8S1huhjs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y579vi1Siyxesfo001+xeaEan2VSDLQZ9byAjEVwNhCPhi4w7RBfGWzT/7ITaLy0e
	 rTP8ObslcZNaKQu1/iMRhRLBGCpbDrMkOwF0y1Hq/0QSIWjeIlGq376oxgH9ByHfGU
	 nnyHmSQ5IcpzB/P7d3nyvVytEjnuqn4zap5/ILeIAlP2h6rSVIldsvW4QfADqJFEab
	 mOXC4BBpmbCCepnGBv8ImV59Wh1q3vlvWfeWlfa3XxrSBB1JfsN70Mh+r7w/AmVgLT
	 kqgHf43tUXcvD4nB3CWpAoF7+HkvYVGzMsvPCZ/PFacDNCum3yHMf4XUnGkNsIitWi
	 LxH1Bc/xtXi9g==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 20 Dec 2024 16:46:30 +0000
Subject: [PATCH RFC v3 05/27] KVM: arm64: Introduce non-UNDEF FGT control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-kvm-arm64-sme-v3-5-05b018c1ffeb@kernel.org>
References: <20241220-kvm-arm64-sme-v3-0-05b018c1ffeb@kernel.org>
In-Reply-To: <20241220-kvm-arm64-sme-v3-0-05b018c1ffeb@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=2905; i=broonie@kernel.org;
 h=from:subject:message-id; bh=phaIeng1WiDU914WINDJrAI0+xgwAcLxe8d8S1huhjs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnZaBYrQCW+zfkM01sqaOmib9a+ea/2zSO7p87v75U
 yigA7fOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ2WgWAAKCRAk1otyXVSH0LtUB/
 9mLPR4Y7kByGjFjEVoh3AjCUjU6X4Sugn+ucmuPfz/9zXw1Ws2WqNmt9lVj4D3OAQAjNHAE2tFHxKK
 SDPcK7rQjxyKA7OgE64Um0DRYlGSFoFW0/Os0jgToloBTUMXiK3tzA5LU+raz9MfA+dLiA4PjcfXjn
 x3wcUxnX0aBklwYBtK0TGvrqKrWuzAG6w1mbFiLFbIQbQuDMWXWknV9uswR7ySE+pSawQdiNB0r4zT
 03ubmpq7Bi/gc1NGs7KcBiIiCNljl2Am+IP6HW/IQcv+IAbUvNOrBTDqHx+Dq34IwOZ0j8V0aD5qqc
 x6RGwPTwPObRuJx6Z4pA2lxBzJ+5zG
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_085115_342980_307B1681 
X-CRM114-Status: GOOD (  15.25  )
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

We have support for determining a set of fine grained traps to enable for
the guest which is tied to the support for injecting UNDEFs for undefined
features. This means that we can't use the mechanism for system registers
which should be present but need emulation, such as SMPRI_EL1 which should
be accessible when SME is present but if SME priority support is absent
SMPRI_EL1.Priority should be RAZ.

Add an additional set of fine grained traps fgt, mirroring the existing fgu
array. We use the same format where we always set the bit for the trap in
the array as for FGU. This makes it clear what is being explicitly managed
and keeps the code consistent.

We do not convert the handling of ARM_WORKAROUND_AMPERE_ACO3_CPU_38 to this
mechanism since this only enables a write trap and when implementing the
existing UNDEF that we would share the read and write trap enablement (this
being the overwhelmingly common case).

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h       | 6 ++++++
 arch/arm64/kvm/hyp/include/hyp/switch.h | 7 ++++---
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 7ba742b9067e0216a156eebb3e5ea6bb69239a44..fca81ede6140c0ee7d03cb6ca8f5eead45b87033 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -288,6 +288,12 @@ struct kvm_arch {
 	 */
 	u64 fgu[__NR_FGT_GROUP_IDS__];
 
+	/*
+	 * Additional FGTs to enable for the guests, eg. for emulated
+	 * registers,
+	 */
+	u64 fgt[__NR_FGT_GROUP_IDS__];
+
 	/*
 	 * Stage 2 paging state for VMs with nested S2 using a virtual
 	 * VMID.
diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index 34f53707892dfe7bba41620e7adb65f1f8376018..247dfadcdb22e1ef96f92a9d86e66c9eefb44600 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -98,9 +98,9 @@ static inline void __activate_traps_fpsimd32(struct kvm_vcpu *vcpu)
 		id;							\
 	})
 
-#define compute_undef_clr_set(vcpu, kvm, reg, clr, set)			\
+#define compute_trap_clr_set(vcpu, kvm, trap, reg, clr, set)		\
 	do {								\
-		u64 hfg = kvm->arch.fgu[reg_to_fgt_group_id(reg)];	\
+		u64 hfg = kvm->arch.trap[reg_to_fgt_group_id(reg)];	\
 		set |= hfg & __ ## reg ## _MASK;			\
 		clr |= hfg & __ ## reg ## _nMASK; 			\
 	} while(0)
@@ -113,7 +113,8 @@ static inline void __activate_traps_fpsimd32(struct kvm_vcpu *vcpu)
 		if (vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu))		\
 			compute_clr_set(vcpu, reg, c, s);		\
 									\
-		compute_undef_clr_set(vcpu, kvm, reg, c, s);		\
+		compute_trap_clr_set(vcpu, kvm, fgu, reg, c, s);	\
+		compute_trap_clr_set(vcpu, kvm, fgt, reg, c, s);	\
 									\
 		s |= set;						\
 		c |= clr;						\

-- 
2.39.5


