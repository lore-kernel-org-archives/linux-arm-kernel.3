Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFEFCA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 13:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnOIy/XMzg6V74qcKTfNV4IhhXy43rsVuIFJygp9nSU=; b=l9aBCA3Va/NPV625ocLwhL9gRb
	NgMMV3srfyswAAy0l33ys9EBYOXWJhFpmwRi5xNxB/9MaHOt9fzeytSndHzu6JPWskyhxbtzvJ4Dv
	9TxXIZuwFRS++GJ//pheeLrQ7xiJUwEzkI1ObcL380nwq5zCLAc85nbNrLJ5tWVcS0xPXWgburY0C
	JPRL74GsY1cZDOzNGNkw5vinhWX7xA7NQYdO5ORwJvPTMT4RxzIfY1ZDQyIr/B+cNP9xQJtLomY6+
	iXF85Bl2+a5b33PC8hWinUdjEZv0oqYedJtThSTUU5hJL+mDuugTPGwxPwBgiToc4A1usXoRi6BWf
	a/L0Zngg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utRX9-00000000Cy2-0awO;
	Tue, 02 Sep 2025 13:58:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPSB-0000000Gz3W-09V1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 11:45:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 779CE60213;
	Tue,  2 Sep 2025 11:45:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46704C4CEF8;
	Tue,  2 Sep 2025 11:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756813534;
	bh=0fLGhfB6VaFN9V2OPaprNenzTUhxjwQ4WMNFeuSowXY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=g4kXt23bpso+nNFv4THNUTimu6aAahPoUlS7Z6aoNlCLT/j2+CtW5dCfj6EDDQroY
	 CxDvLmbUpyO8y75GuVNZap4vAKva9rzeu3dNgaGiyhurMFWMxwHNlovKuxO5HZwwtq
	 0ONwLNEAqk/SNy61KJnLH9//DsOWm/WCTb5BZ+tWfDqGaRkOpVXE9tlMkKGdfloha9
	 x+pjinSnKXPE7ehi67TFp0oreZBtsnXmoNlBOcyjmQtOXg+VTWsDsvbcvp+4D+tLr/
	 IUEiZkIJrWyaJsOnCvNGmXtkL593y9itmTIi6gJoL+PYXN83vJGorcyJ8/jiFUOux8
	 XnMV8IpdTsOLg==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 02 Sep 2025 12:36:19 +0100
Subject: [PATCH v8 16/29] KVM: arm64: Support SME control registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-kvm-arm64-sme-v8-16-2cb2199c656c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4807; i=broonie@kernel.org;
 h=from:subject:message-id; bh=0fLGhfB6VaFN9V2OPaprNenzTUhxjwQ4WMNFeuSowXY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBottiGSWd/Ihob9g8NK9RPBSZUvgmJDyCN/VXIh
 FyC9PxLim2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaLbYhgAKCRAk1otyXVSH
 0GEnB/9nLGGwCKUeQvIiZCjBrlVztcGG0JqnYGJjaypFwfonrlb2ZStP+KZEN5/SScNrtdA0qV3
 mn/WSpC+Pkd2G9b/FmbIC4y2xUWcLkmYpcDbDFGRfjz02ORZztG2wcby4L7ZamjBoY4UCPkD4Be
 cB4jm8DBF3Dz2R/xZcGE3T5FVMpn/9kqyq8BCl8D9qefupeJD83xNF2WpAODL1oZqqGj7mufFB4
 /o7HQ2IzCvt6AaJ2DqGIEvoHiDZvI6vG45poloILrogZWjhjjYk3DohpEUNwIxT0Rfg8ELHxltu
 FDdwqlR6m7/rc1hn8kBRGlYXRq5yZ79HJgJMc74ps2IfSYnk
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

SME is configured by the system registers SMCR_EL1 and SMCR_EL2, add
definitions and userspace access for them.  These control the SME vector
length in a manner similar to that for SVE and also have feature enable
bits for SME2 and FA64.  A subsequent patch will add management of them
for guests as part of the general floating point context switch, as is
done for the equivalent SVE registers.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h     |  2 ++
 arch/arm64/include/asm/vncr_mapping.h |  1 +
 arch/arm64/kvm/sys_regs.c             | 37 ++++++++++++++++++++++++++++++++++-
 3 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 4348f297b5ae..edb2acdb4bd1 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -506,6 +506,7 @@ enum vcpu_sysreg {
 	CPTR_EL2,	/* Architectural Feature Trap Register (EL2) */
 	HACR_EL2,	/* Hypervisor Auxiliary Control Register */
 	ZCR_EL2,	/* SVE Control Register (EL2) */
+	SMCR_EL2,	/* SME Control Register (EL2) */
 	TTBR0_EL2,	/* Translation Table Base Register 0 (EL2) */
 	TTBR1_EL2,	/* Translation Table Base Register 1 (EL2) */
 	TCR_EL2,	/* Translation Control Register (EL2) */
@@ -544,6 +545,7 @@ enum vcpu_sysreg {
 	VNCR(ACTLR_EL1),/* Auxiliary Control Register */
 	VNCR(CPACR_EL1),/* Coprocessor Access Control */
 	VNCR(ZCR_EL1),	/* SVE Control */
+	VNCR(SMCR_EL1),	/* SME Control */
 	VNCR(TTBR0_EL1),/* Translation Table Base Register 0 */
 	VNCR(TTBR1_EL1),/* Translation Table Base Register 1 */
 	VNCR(TCR_EL1),	/* Translation Control Register */
diff --git a/arch/arm64/include/asm/vncr_mapping.h b/arch/arm64/include/asm/vncr_mapping.h
index f6ec500ad3fa..5ab6a964bccf 100644
--- a/arch/arm64/include/asm/vncr_mapping.h
+++ b/arch/arm64/include/asm/vncr_mapping.h
@@ -44,6 +44,7 @@
 #define VNCR_HDFGWTR_EL2	0x1D8
 #define VNCR_ZCR_EL1            0x1E0
 #define VNCR_HAFGRTR_EL2	0x1E8
+#define VNCR_SMCR_EL1		0x1F0
 #define VNCR_TTBR0_EL1          0x200
 #define VNCR_TTBR1_EL1          0x210
 #define VNCR_FAR_EL1            0x220
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 111b07a78787..81742e9237c0 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -142,6 +142,7 @@ static bool get_el2_to_el1_mapping(unsigned int reg,
 		MAPPED_EL2_SYSREG(ELR_EL2,     ELR_EL1,	    NULL	     );
 		MAPPED_EL2_SYSREG(SPSR_EL2,    SPSR_EL1,    NULL	     );
 		MAPPED_EL2_SYSREG(ZCR_EL2,     ZCR_EL1,     NULL	     );
+		MAPPED_EL2_SYSREG(SMCR_EL2,    SMCR_EL1,    NULL	     );
 		MAPPED_EL2_SYSREG(CONTEXTIDR_EL2, CONTEXTIDR_EL1, NULL	     );
 		MAPPED_EL2_SYSREG(SCTLR2_EL2,  SCTLR2_EL1,  NULL	     );
 	default:
@@ -2589,6 +2590,37 @@ static bool access_gic_elrsr(struct kvm_vcpu *vcpu,
 	return true;
 }
 
+static unsigned int sme_el2_visibility(const struct kvm_vcpu *vcpu,
+				       const struct sys_reg_desc *rd)
+{
+	return __el2_visibility(vcpu, rd, sme_visibility);
+}
+
+static bool access_smcr_el2(struct kvm_vcpu *vcpu,
+			    struct sys_reg_params *p,
+			    const struct sys_reg_desc *r)
+{
+	unsigned int vq;
+	u64 smcr;
+
+	if (guest_hyp_sve_traps_enabled(vcpu)) {
+		kvm_inject_nested_sve_trap(vcpu);
+		return true;
+	}
+
+	if (!p->is_write) {
+		p->regval = vcpu_read_sys_reg(vcpu, SMCR_EL2);
+		return true;
+	}
+
+	smcr = p->regval;
+	vq = SYS_FIELD_GET(SMCR_ELx, LEN, smcr) + 1;
+	vq = min(vq, vcpu_sme_max_vq(vcpu));
+	vcpu_write_sys_reg(vcpu, SYS_FIELD_PREP(SMCR_ELx, LEN, vq - 1),
+			   SMCR_EL2);
+	return true;
+}
+
 static unsigned int s1poe_visibility(const struct kvm_vcpu *vcpu,
 				     const struct sys_reg_desc *rd)
 {
@@ -3035,7 +3067,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_ZCR_EL1), NULL, reset_val, ZCR_EL1, 0, .visibility = sve_visibility },
 	{ SYS_DESC(SYS_TRFCR_EL1), undef_access },
 	{ SYS_DESC(SYS_SMPRI_EL1), undef_access },
-	{ SYS_DESC(SYS_SMCR_EL1), undef_access },
+	{ SYS_DESC(SYS_SMCR_EL1), NULL, reset_val, SMCR_EL1, 0, .visibility = sme_visibility },
 	{ SYS_DESC(SYS_TTBR0_EL1), access_vm_reg, reset_unknown, TTBR0_EL1 },
 	{ SYS_DESC(SYS_TTBR1_EL1), access_vm_reg, reset_unknown, TTBR1_EL1 },
 	{ SYS_DESC(SYS_TCR_EL1), access_vm_reg, reset_val, TCR_EL1, 0 },
@@ -3391,6 +3423,9 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 
 	EL2_REG_VNCR(HCRX_EL2, reset_val, 0),
 
+	EL2_REG_FILTERED(SMCR_EL2, access_smcr_el2, reset_val, 0,
+			 sme_el2_visibility),
+
 	EL2_REG(TTBR0_EL2, access_rw, reset_val, 0),
 	EL2_REG(TTBR1_EL2, access_rw, reset_val, 0),
 	EL2_REG(TCR_EL2, access_rw, reset_val, TCR_EL2_RES1),

-- 
2.39.5


