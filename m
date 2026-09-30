Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F72CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 21:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmI43dNjbW9ipLj+uvJbJhfjBFlJUEORAc9xQbdzhRk=; b=3pfoKpw3giqAKNvsB46whmiExu
	CU+9UBQrFJ5XGdhhdrUO+uV76fjE5tCrVHFx8N/OZKMDjd8qElbLmjAdhT1pG82PsjX9l3+kqumo/
	OvVAfdnMU14r1jx+s8no1EFZxqaV/wfxV8uYUT884EBdfhzOmSJWd9pkuP8tzIERgKZn+KZnG4i6X
	rgqur8F2byYfFQbV+5NKZFnmaWYicSwgm0RlwsVumkDex7qnApJ6oOv5iTg65NLdyDr+psEC8QWcW
	MxZ3M5i6kh2KusZNGpTCaoCWdbeDbQa7PfZteG2YfujxMfVdMeSAPSU6QPcsZUPqIyNOEqofhmAIS
	CP8G/aIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC2Ai-00000007ICE-1mnd;
	Wed, 30 Sep 2026 21:49:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC2Ag-00000007IBJ-39OW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 21:49:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E4A446053E;
	Wed, 30 Sep 2026 21:49:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27CB11F000FF;
	Wed, 30 Sep 2026 21:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790804941;
	bh=OmI43dNjbW9ipLj+uvJbJhfjBFlJUEORAc9xQbdzhRk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KHDNb2F21R1I7bXqmNAaWpXeQK9EChJqU9dgmuyRYicKt+bU8w88DAkJodincfhKo
	 BhvuBd4C2JLEEfBM7ZtIqgVtWY3vda9VqSGoQaP6/J/DzUVtmcrxVhmCtnSKdcyQmr
	 oAfhT0yZdeBUba2gyrT0OrDSBd43d30Tna3bo9boYT6qqYAhW9cj2KodZHPtf5UrYw
	 ssU8VcREWum3Lvd5ZW0zfk4gTxRGOIVF+9LTP7iwPYZJhf4HCuHD68bfl6PyixnbmM
	 VulLoPou/Vd90vkJln6yqTYCnL/PLyGkNdZCwSz6iklV6ckhbJgggTIqXiqPJF+doW
	 J6X6oYtTYPl3w==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 30 Sep 2026 22:48:12 +0100
Subject: [PATCH v21 02/15] KVM: arm64: Refuse to start a guest with S1PIE
 or S1POE but not TCR2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-arm64-gcs-v21-2-3556644cd927@kernel.org>
References: <20260930-arm64-gcs-v21-0-3556644cd927@kernel.org>
In-Reply-To: <20260930-arm64-gcs-v21-0-3556644cd927@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Leonardo Bras <leo.bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
 Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2332; i=broonie@kernel.org;
 h=from:subject:message-id; bh=DwBoYQFaczmEOWbnV9xSdDgF3MgqEmjOd72qq7R27xE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqvYO1hbtlerL9S2qZZZLtlBkEy8ZCDKCCOwfKK
 CCEvCtnPHqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCar2DtQAKCRAk1otyXVSH
 0IdcB/9X5ZZqHN11AV843Dho/QJXH3M8htRierETr6LGsfAgsUbLAaCXasBSRLg5jWHlN1MovSI
 sLP1OcVZAifIMlKimYLc4cCOfcbBEnV+s5hp59y6+tpr69dTeKFsHf7WOr/Ya4Eux7yVeU/Lum4
 q+8MSU4D2RaW/QgDSzv8byA/ntbYKtT5CttovlDl5yyIsPiGPMdCPhBAXuCqZkxBJBIWUwiL0EN
 JCY+7jtbPqzw1xEwzRy2+RTizp2VjO3rrOYnKGaQQvaSb1FkLMFWWa4QbOeewctPziXA7WKW/2+
 TeYk+aoHFvXDS6opSBe7JpxqvQxGFBF1ZEKsylTiITrJsDRe
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

Since there is an architectural dependency between the features as an
optimisation we only context switch guest registers for FEAT_S1PIE and
FEAT_S1POE if the guest also has FEAT_TCR2. We do not, however, enforce
this as a requirement when starting a guest and only configure the traps
for accessing the registers based on their individual features. This means
that a VMM can configure a guest which can read and write the system
registers for FEAT_S1PIE and FEAT_S1POE without the hypervisor updating the
values of these registers for the guest.

Avoid this by refusing to create a guest with an affected configuration.

Rather than doing something data driven we open code the checks, I started
doing something data driven but it was very clear that such code should be
shared with the host kernel cpufeature code. Refactoring for that seemed
like disproportionate effort and invasiveness for the context so is
deferred for followup work.

Fixes: 663abf04ee4d ("KVM: arm64: Make PIR{,E0}_EL1 save/restore conditional on FEAT_TCRX")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 44aae52c473d..3ae293798b27 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -5860,6 +5860,24 @@ void kvm_calculate_traps(struct kvm_vcpu *vcpu)
 	mutex_unlock(&kvm->arch.config_lock);
 }
 
+/*
+ * Some optimisations in fast paths would be broken by architecturally
+ * invalid feature combinations, reject those.
+ *
+ * This should share code with the host kernel cpufeature code, and
+ * make use of the MRS to generate dependencies.
+ */
+static bool kvm_validate_id_regs(struct kvm *kvm)
+{
+	if (kvm_has_s1pie(kvm) && !kvm_has_tcr2(kvm))
+		return false;
+
+	if (kvm_has_s1poe(kvm) && !kvm_has_tcr2(kvm))
+		return false;
+
+	return true;
+}
+
 /*
  * Perform last adjustments to the ID registers that are implied by the
  * configuration outside of the ID regs themselves, as well as any
@@ -5928,6 +5946,9 @@ int kvm_finalize_sys_regs(struct kvm_vcpu *vcpu)
 		kvm_vgic_finalize_idregs(kvm);
 	}
 
+	if (!kvm_validate_id_regs(vcpu->kvm))
+		return -EINVAL;
+
 	return 0;
 }
 

-- 
2.47.3


