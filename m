Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709ACC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 00:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QGL1S7/YzSgMxVPFfRCciYaZJILzuBk35bThtAabNUE=; b=q4K2hIWH8qUHSFTmCX2KllfF7p
	lIKVOOuop6L4SLFJA6cXAY+g3hcJDWLewD+RgsLb4Ebg5Apzy/jqk1W1YSD1bXbex45YBhZef/UKd
	EdjQJtPkAV2TaPuFHd3TEWjJVAbAkE93w9yEuWqKfymnZVBfgI/Ewovwg35Jz3q0rKkt5w33BXhp8
	H/5/Hsz3OglHu32Hi5VRu5Gk6vmoBqQC+pa+93B7/Jvr/1FccjbfnOrv4jvIiodjGRWbc/ahC7TcJ
	aEK4duYlV/VyLeE5zjxYRr49bPOtxIYON7SVet/J4m9w/O0Jhz9MN3icyB82/IhjIcfmWwGhMnmQM
	NFm+Tnvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5DLd-0000000BLQu-1PQA;
	Thu, 17 Apr 2025 00:43:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5D55-0000000BGs5-0608
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 00:26:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F38543A1D;
	Thu, 17 Apr 2025 00:26:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F542C4CEE2;
	Thu, 17 Apr 2025 00:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744849574;
	bh=a0Ia76ikFrUJD8FigO1QWjiw7c+Y7loFA8aT5ZqeiW0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ta9GsKKBznileJpn86YktlmV/2ZVpEB4KwCBYsiKyDZWXyRJubcHVGl+nF+7asAsN
	 V5UXraXUbS6/mU8PZ3bDelUkLvDGZIumJFSc7b2RSi8z3cdB1OlESEBXx7pSHVh8AW
	 JUwbzhpiCosUVJhG9orsvKtm3Z3l9mhTUMuEWxTIRAXazeL2fxCg6pqNWhWSUKiwrH
	 pKedc+J+eCk8WhAA2fGEMA4RMHcgdGogp5+I/cI8S309+UjgYz1TDA7N8lItdgeocV
	 4xD7BxFiAw+pIBEgAhQ2uPspi2K43Pij4ey7wAUEMrES6vSkKx9cauKu5VyDPkzvZ0
	 Iq9tk+3P/8eGA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 17 Apr 2025 01:25:12 +0100
Subject: [PATCH v5 08/28] KVM: arm64: Move SVE state access macros after
 feature test macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-kvm-arm64-sme-v5-8-f469a2d5f574@kernel.org>
References: <20250417-kvm-arm64-sme-v5-0-f469a2d5f574@kernel.org>
In-Reply-To: <20250417-kvm-arm64-sme-v5-0-f469a2d5f574@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2566; i=broonie@kernel.org;
 h=from:subject:message-id; bh=a0Ia76ikFrUJD8FigO1QWjiw7c+Y7loFA8aT5ZqeiW0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoAEp1jatlIUZQb9blHKMZHeDBVqZrdc3aooPmUoKd
 9Enk3MqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaABKdQAKCRAk1otyXVSH0NmSB/
 0duzDLiieA4h9tp1fqx0R0MozC0Iiep5u4vpp5wHs0vYyxYrBSrrwa3fTLRt67q6lPFy/26m3CJ3v1
 4LorI2sfQfvKloiy8rIoKCAaOYbGaHdLABTBHCxW+Tnwvj+ehpmGxLxyVFwdmqfelS/K8mgl/FGkXN
 0XJmUD6cP2G0zu5k0G2HIc+fnE4ZORVSOWLKpfNgjyXkb5N2KFXrzWYignYo4w8KLlQaW0fWNvET/i
 yVgcT663qkewkU7BSkAlNfOXnor8Bf3HRxplprlJFzUhjMCEUHaTs7QbaHvtWmyADFa7GX4MIouIVw
 qprHWiaQg2wdk4VfXbdXJV4A3p7zEc
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_172615_118040_6F8A14A7 
X-CRM114-Status: GOOD (  12.04  )
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

In preparation for SME support move the macros used to access SVE state
after the feature test macros, we will need to test for SME subfeatures to
determine the size of the SME state.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h | 46 +++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 3fc8260d55a6..fb577e10c95d 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -968,29 +968,6 @@ struct kvm_vcpu_arch {
 #define IN_NESTED_ERET		__vcpu_single_flag(sflags, BIT(7))
 
 
-/* Pointer to the vcpu's SVE FFR for sve_{save,load}_state() */
-#define vcpu_sve_pffr(vcpu) (kern_hyp_va((vcpu)->arch.sve_state) +	\
-			     sve_ffr_offset((vcpu)->arch.sve_max_vl))
-
-#define vcpu_sve_max_vq(vcpu)	sve_vq_from_vl((vcpu)->arch.sve_max_vl)
-
-#define vcpu_sve_zcr_elx(vcpu)						\
-	(unlikely(is_hyp_ctxt(vcpu)) ? ZCR_EL2 : ZCR_EL1)
-
-#define vcpu_sve_state_size(vcpu) ({					\
-	size_t __size_ret;						\
-	unsigned int __vcpu_vq;						\
-									\
-	if (WARN_ON(!sve_vl_valid((vcpu)->arch.sve_max_vl))) {		\
-		__size_ret = 0;						\
-	} else {							\
-		__vcpu_vq = vcpu_sve_max_vq(vcpu);			\
-		__size_ret = SVE_SIG_REGS_SIZE(__vcpu_vq);		\
-	}								\
-									\
-	__size_ret;							\
-})
-
 #define KVM_GUESTDBG_VALID_MASK (KVM_GUESTDBG_ENABLE | \
 				 KVM_GUESTDBG_USE_SW_BP | \
 				 KVM_GUESTDBG_USE_HW | \
@@ -1026,6 +1003,29 @@ struct kvm_vcpu_arch {
 
 #define vcpu_gp_regs(v)		(&(v)->arch.ctxt.regs)
 
+/* Pointer to the vcpu's SVE FFR for sve_{save,load}_state() */
+#define vcpu_sve_pffr(vcpu) (kern_hyp_va((vcpu)->arch.sve_state) +	\
+			     sve_ffr_offset((vcpu)->arch.sve_max_vl))
+
+#define vcpu_sve_max_vq(vcpu)	sve_vq_from_vl((vcpu)->arch.sve_max_vl)
+
+#define vcpu_sve_zcr_elx(vcpu)						\
+	(unlikely(is_hyp_ctxt(vcpu)) ? ZCR_EL2 : ZCR_EL1)
+
+#define vcpu_sve_state_size(vcpu) ({					\
+	size_t __size_ret;						\
+	unsigned int __vcpu_vq;						\
+									\
+	if (WARN_ON(!sve_vl_valid((vcpu)->arch.sve_max_vl))) {		\
+		__size_ret = 0;						\
+	} else {							\
+		__vcpu_vq = vcpu_sve_max_vq(vcpu);			\
+		__size_ret = SVE_SIG_REGS_SIZE(__vcpu_vq);		\
+	}								\
+									\
+	__size_ret;							\
+})
+
 /*
  * Only use __vcpu_sys_reg/ctxt_sys_reg if you know you want the
  * memory backed version of a register, and not the one most recently

-- 
2.39.5


