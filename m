Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A48FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 18:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8QKfeY6MF9dpRy4jWvo6mGVT4QR36ThS7v75EfE7dSs=; b=UcNIb9P0fUOfMAfTfE7Kuh1Y5A
	P5+1ogWSRoaqT7X6HUHH0OxLk1ns8rMhpiM7kNjVE4ga9kTCDLpnazxCT+9ZNLf8mCyzZZXTMSKGl
	FQ512NI8X/4ELtrj6AThZCXafo7X8ajVq946mQ/qrDOR7dtXOluAt83BYd2Du5Pfx3h1Uj2EjXVxM
	vyhlLqlVCQfWI2UZKKXNgwv0tHbGCWe3kDyoSCR/MZug9vcCJR8FxissMQM2Fn0W8IikTyunPycpR
	GKNNC/YqiphjeA9twS8JzA46+BuiPf2+0o/wor47OvgBQmQusfjDOorRdOihVRXu70Sy5fjZsuj3j
	3+GrJYJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtgW-00000003G38-3ihD;
	Thu, 09 Jul 2026 18:41:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtgV-00000003G1N-1aIh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 18:41:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1641940105;
	Thu,  9 Jul 2026 18:41:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D07301F00A3E;
	Thu,  9 Jul 2026 18:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783622479;
	bh=8QKfeY6MF9dpRy4jWvo6mGVT4QR36ThS7v75EfE7dSs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Hb6aJg1Wjqo/SEoWUmFvb+zcUcQnZhXZEFej5E0iomb43yaaxRuf3tAAEjZqnm/0a
	 ZKlfz1IFf8UJske23+xBUmbH/PIR/4QM2Aa0cNnXd2ApBtmpxt4AbRyho2Gug92dgv
	 Ecqs8NqccQl5D7g1G8pfhE3UgbIZiBq62PPdOn35aUwoDjVp6KuEuKD1zNgxhG8YEs
	 QGJRYjRLAoOzpqXXRjbmVbe7jI46Uyxb3D8ecevg5Swtwn+Iq7uB6VAjGTV7A/W5BF
	 BqYK0fB8yduC2HY3V/Uez4bu77RWewBkGLHfGuIsXOdjFj+EvLvCqB3WX0JHv4vEMf
	 nQVeTkb/YKK7Q==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 09 Jul 2026 19:27:37 +0100
Subject: [PATCH v12 16/29] KVM: arm64: Support TPIDR2_EL0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-kvm-arm64-sme-v12-16-d0301d79ef58@kernel.org>
References: <20260709-kvm-arm64-sme-v12-0-d0301d79ef58@kernel.org>
In-Reply-To: <20260709-kvm-arm64-sme-v12-0-d0301d79ef58@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Jean-Philippe Brucker <jpb@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4705; i=broonie@kernel.org;
 h=from:subject:message-id; bh=OLmfKw1OWtsaEUazoIIIWYByRIJqe5QP2QutP6yHROg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqT+r2eWYjFk8bdfaH/Pjp6UDY1wM7lmpXxg5nA
 xo4v1+XpVuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak/q9gAKCRAk1otyXVSH
 0EBXB/9hZPH5pwvkWLxxYoLVFduATHzoN308+D/49F+SfOsHgHbM/Elxs8TuotNKs2PYckT7Gqd
 Y0Qz9UM/InYx+IGM+1hXRML4fiqlUBLjTWZElEXjvSt+dl2IeS1943h46NQXq9C3/jqy2h6wTtK
 IR7KTmVhqExxUcFrcFaYPjEyV7HMsosEW7fa+KfWWKVf9yCI7D7n6qkxupcTgXHxPqgyXxF6pHD
 5zmvbXwmeop2ymCrWSgpJFzwQXDJVwFkL7jJ3sk+pFsevfd4lGoo07t3vBu0f1q1IPACEy0B3I8
 UhjNI+f8yvglhms0QJu5ZQ7SwP9JYDF3TUEN8gmewqymbk5z
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

SME adds a new thread ID register, TPIDR2_EL0. This is used in userspace
for delayed saving of the ZA state but in terms of the architecture is
not really connected to SME other than being part of FEAT_SME. It has an
independent fine grained trap and the runtime connection with the rest
of SME is purely software defined.

Expose the register as a system register if the guest supports SME,
context switching it along with the other EL0 TPIDRs.

Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h          |  1 +
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 12 ++++++++++++
 arch/arm64/kvm/sys_regs.c                  |  6 +++++-
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 796b6e3a50f7..da7e572822a1 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -460,6 +460,7 @@ enum vcpu_sysreg {
 	CSSELR_EL1,	/* Cache Size Selection Register */
 	TPIDR_EL0,	/* Thread ID, User R/W */
 	TPIDRRO_EL0,	/* Thread ID, User R/O */
+	TPIDR2_EL0,	/* Thread ID, Register 2 */
 	TPIDR_EL1,	/* Thread ID, Privileged */
 	CNTKCTL_EL1,	/* Timer Control Register (EL1) */
 	PAR_EL1,	/* Physical Address Register */
diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
index 5624fd705ae3..0fd4092e4f25 100644
--- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
+++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
@@ -88,6 +88,14 @@ static inline bool ctxt_has_sctlr2(struct kvm_cpu_context *ctxt)
 	return kvm_has_sctlr2(kern_hyp_va(vcpu->kvm));
 }
 
+static inline bool ctxt_has_sme(struct kvm_cpu_context *ctxt)
+{
+	struct kvm_vcpu *vcpu;
+
+	vcpu = ctxt_to_vcpu(ctxt);
+	return kvm_has_sme(kern_hyp_va(vcpu->kvm));
+}
+
 static inline bool ctxt_is_guest(struct kvm_cpu_context *ctxt)
 {
 	return host_data_ptr(host_ctxt) != ctxt;
@@ -127,6 +135,8 @@ static inline void __sysreg_save_user_state(struct kvm_cpu_context *ctxt)
 {
 	ctxt_sys_reg(ctxt, TPIDR_EL0)	= read_sysreg(tpidr_el0);
 	ctxt_sys_reg(ctxt, TPIDRRO_EL0)	= read_sysreg(tpidrro_el0);
+	if (ctxt_has_sme(ctxt))
+		ctxt_sys_reg(ctxt, TPIDR2_EL0)	= read_sysreg_s(SYS_TPIDR2_EL0);
 }
 
 static inline void __sysreg_save_el1_state(struct kvm_cpu_context *ctxt)
@@ -204,6 +214,8 @@ static inline void __sysreg_restore_user_state(struct kvm_cpu_context *ctxt)
 {
 	write_sysreg(ctxt_sys_reg(ctxt, TPIDR_EL0),	tpidr_el0);
 	write_sysreg(ctxt_sys_reg(ctxt, TPIDRRO_EL0),	tpidrro_el0);
+	if (ctxt_has_sme(ctxt))
+		write_sysreg_s(ctxt_sys_reg(ctxt, TPIDR2_EL0), SYS_TPIDR2_EL0);
 }
 
 static inline void __sysreg_restore_el1_state(struct kvm_cpu_context *ctxt,
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 24bbe30c075a..8f19caac6008 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -131,6 +131,7 @@ static enum sr_loc_attr locate_direct_register(const struct kvm_vcpu *vcpu,
 
 	case TPIDR_EL0:
 	case TPIDRRO_EL0:
+	case TPIDR2_EL0:
 	case TPIDR_EL1:
 	case PAR_EL1:
 	case DACR32_EL2:
@@ -246,6 +247,7 @@ static u64 read_sr_from_cpu(enum vcpu_sysreg reg)
 	case SCTLR2_EL1:	val = read_sysreg_s(SYS_SCTLR2_EL12);	break;
 	case TPIDR_EL0:		val = read_sysreg_s(SYS_TPIDR_EL0);	break;
 	case TPIDRRO_EL0:	val = read_sysreg_s(SYS_TPIDRRO_EL0);	break;
+	case TPIDR2_EL0:	val = read_sysreg_s(SYS_TPIDR2_EL0);	break;
 	case TPIDR_EL1:		val = read_sysreg_s(SYS_TPIDR_EL1);	break;
 	case PAR_EL1:		val = read_sysreg_par();		break;
 	case DACR32_EL2:	val = read_sysreg_s(SYS_DACR32_EL2);	break;
@@ -285,6 +287,7 @@ static void write_sr_to_cpu(enum vcpu_sysreg reg, u64 val)
 	case SCTLR2_EL1:	write_sysreg_s(val, SYS_SCTLR2_EL12);	break;
 	case TPIDR_EL0:		write_sysreg_s(val, SYS_TPIDR_EL0);	break;
 	case TPIDRRO_EL0:	write_sysreg_s(val, SYS_TPIDRRO_EL0);	break;
+	case TPIDR2_EL0:	write_sysreg_s(val, SYS_TPIDR2_EL0);	break;
 	case TPIDR_EL1:		write_sysreg_s(val, SYS_TPIDR_EL1);	break;
 	case PAR_EL1:		write_sysreg_s(val, SYS_PAR_EL1);	break;
 	case DACR32_EL2:	write_sysreg_s(val, SYS_DACR32_EL2);	break;
@@ -3598,7 +3601,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	  .visibility = s1poe_visibility },
 	{ SYS_DESC(SYS_TPIDR_EL0), NULL, reset_unknown, TPIDR_EL0 },
 	{ SYS_DESC(SYS_TPIDRRO_EL0), NULL, reset_unknown, TPIDRRO_EL0 },
-	{ SYS_DESC(SYS_TPIDR2_EL0), undef_access },
+	{ SYS_DESC(SYS_TPIDR2_EL0), NULL, reset_unknown, TPIDR2_EL0,
+	  .visibility = sme_visibility },
 
 	{ SYS_DESC(SYS_SCXTNUM_EL0), undef_access },
 

-- 
2.47.3


