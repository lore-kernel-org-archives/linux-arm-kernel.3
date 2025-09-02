Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B41CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 14:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZJRlv5UOGfcUPVoc2PKAdr3wDfuDwyNBC6vBC34SzAY=; b=JwTj+vymgJYQWmF3Pz+GhohyUd
	cMikvtwkBOAJpJBhLQfghw1yBz2Gm7jpU2N/2esiC6EhdEKQLqy0/uymOvzMi+z9UJnYyGWyW8iRV
	qmtFICEVQO+L85ZdPsERagbv2KZq93fEXaNF5JymKWye4FyTkzUeVDJpgc/IHWdiF9wk1SbVZr1oV
	529jv0bc8DOHYwPSb2aflRYC0fRoFhEURyt+DnU7oGOkJIn+IEbbZUkNhsURcwoddSN/L1wy1XSx4
	yJc46lg7D+D3TzWwcyOIK4zUQu8HD6f/2hzTrLVYd2E5a9BdWQzM20maWg8U16zAsiHXjjfCz+xhp
	pO6+c8FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utRce-00000000ExR-3KDO;
	Tue, 02 Sep 2025 14:04:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPSF-0000000Gz4n-1krU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 11:45:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D450860212;
	Tue,  2 Sep 2025 11:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95C9CC4CEED;
	Tue,  2 Sep 2025 11:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756813538;
	bh=s9OgbUV3jMegR4yK5YJZn39bA8MN2bqc20M/qGI/rlg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QZuYqXi+TSZTdOoPLIGC+xq12gG0BUGZV/l6O6cGxTjuMso+gHFB60OFQQWy4bZwG
	 SCl+AxUwSejvbC60tDeruUtR24GXcbQQ6POOapbxD9gl7Qk9KIvGndoHeGR0HcMPFK
	 owi4z68OUMZ8Y665JLPPIoRATIwi/q7V/JuGTDYsluS/CBGfNB4lt5BmnaxVDgjxVg
	 J2WY1CgntRGRyILwRZB42gohn2824HLssRVhlsGmJUQER/Br6V7UJ9DEAk7q9tbmMr
	 yvK8ZWRDLOCLzs+9IWrHM4BfqjRE4vUFyYbr2efzrX3AqrZ4pXQHu5v78xaWCvMfJu
	 UFcE5fo+5oUUg==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 02 Sep 2025 12:36:20 +0100
Subject: [PATCH v8 17/29] KVM: arm64: Support TPIDR2_EL0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-kvm-arm64-sme-v8-17-2cb2199c656c@kernel.org>
References: <20250902-kvm-arm64-sme-v8-0-2cb2199c656c@kernel.org>
In-Reply-To: <20250902-kvm-arm64-sme-v8-0-2cb2199c656c@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=3465; i=broonie@kernel.org;
 h=from:subject:message-id; bh=s9OgbUV3jMegR4yK5YJZn39bA8MN2bqc20M/qGI/rlg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBottiHDFKJXw5f2H21IFF1uQvm/fPZsanmuSrom
 /a5i86XmZ6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaLbYhwAKCRAk1otyXVSH
 0OahB/9y3zF/euhwkQBojIIq0LMsL+jbp3v2b9QbC0+ZlZGtcktmT5/5mY8wKvAJGw/Tgu0/Q+Z
 5YLpJf5cp+gcsIV93+PFIPh42owo6MklqRVtxOj/8RF4g2vC3akJV1XD1lrZpZe/CZRXF7J+vDU
 F1TcDxb6Vh781UNrLAs9cTMINcu0R3QJXaCySGQ0WFb6tbvPPj+urfNZYwHq9/1rMKCKN7olb1X
 +bredmoG7fhmcywiAEgR0n8kF3V2SIiDigFPkMjT812i+nJqbGeXRVe6YE9rh+tQBPuXTR+deMH
 OVLTPtaUy6h8TRHTboPrmy7/OQaEJU05Iec6EPI2ZssuiBGw
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

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h          |  1 +
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 15 +++++++++++++++
 arch/arm64/kvm/sys_regs.c                  |  3 ++-
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index edb2acdb4bd1..632c74397fa9 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -450,6 +450,7 @@ enum vcpu_sysreg {
 	CSSELR_EL1,	/* Cache Size Selection Register */
 	TPIDR_EL0,	/* Thread ID, User R/W */
 	TPIDRRO_EL0,	/* Thread ID, User R/O */
+	TPIDR2_EL0,	/* Thread ID, Register 2 */
 	TPIDR_EL1,	/* Thread ID, Privileged */
 	CNTKCTL_EL1,	/* Timer Control Register (EL1) */
 	PAR_EL1,	/* Physical Address Register */
diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
index 5624fd705ae3..8c3b3d6df99f 100644
--- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
+++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
@@ -88,6 +88,17 @@ static inline bool ctxt_has_sctlr2(struct kvm_cpu_context *ctxt)
 	return kvm_has_sctlr2(kern_hyp_va(vcpu->kvm));
 }
 
+static inline bool ctxt_has_sme(struct kvm_cpu_context *ctxt)
+{
+	struct kvm_vcpu *vcpu;
+
+	if (!system_supports_sme())
+		return false;
+
+	vcpu = ctxt_to_vcpu(ctxt);
+	return kvm_has_sme(kern_hyp_va(vcpu->kvm));
+}
+
 static inline bool ctxt_is_guest(struct kvm_cpu_context *ctxt)
 {
 	return host_data_ptr(host_ctxt) != ctxt;
@@ -127,6 +138,8 @@ static inline void __sysreg_save_user_state(struct kvm_cpu_context *ctxt)
 {
 	ctxt_sys_reg(ctxt, TPIDR_EL0)	= read_sysreg(tpidr_el0);
 	ctxt_sys_reg(ctxt, TPIDRRO_EL0)	= read_sysreg(tpidrro_el0);
+	if (ctxt_has_sme(ctxt))
+		ctxt_sys_reg(ctxt, TPIDR2_EL0)	= read_sysreg_s(SYS_TPIDR2_EL0);
 }
 
 static inline void __sysreg_save_el1_state(struct kvm_cpu_context *ctxt)
@@ -204,6 +217,8 @@ static inline void __sysreg_restore_user_state(struct kvm_cpu_context *ctxt)
 {
 	write_sysreg(ctxt_sys_reg(ctxt, TPIDR_EL0),	tpidr_el0);
 	write_sysreg(ctxt_sys_reg(ctxt, TPIDRRO_EL0),	tpidrro_el0);
+	if (ctxt_has_sme(ctxt))
+		write_sysreg_s(ctxt_sys_reg(ctxt, TPIDR2_EL0), SYS_TPIDR2_EL0);
 }
 
 static inline void __sysreg_restore_el1_state(struct kvm_cpu_context *ctxt,
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 81742e9237c0..4166d396450d 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3243,7 +3243,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	  .visibility = s1poe_visibility },
 	{ SYS_DESC(SYS_TPIDR_EL0), NULL, reset_unknown, TPIDR_EL0 },
 	{ SYS_DESC(SYS_TPIDRRO_EL0), NULL, reset_unknown, TPIDRRO_EL0 },
-	{ SYS_DESC(SYS_TPIDR2_EL0), undef_access },
+	{ SYS_DESC(SYS_TPIDR2_EL0), NULL, reset_unknown, TPIDR2_EL0,
+	  .visibility = sme_visibility},
 
 	{ SYS_DESC(SYS_SCXTNUM_EL0), undef_access },
 

-- 
2.39.5


