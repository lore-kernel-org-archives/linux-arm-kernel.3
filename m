Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222D0C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 00:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/bSVn4A7P2buqPsSBN19q3GFhevpNvbqSjxF/MHUfow=; b=EieZUcNHHWE9NajAW6INWfbh53
	Z7J1dFGhrDUglboHSs5oyaPqpoW4vYPwAIotxKpA+e1Xs6yQOL7wR53a68TpBZYT6SKm4QslsjaOW
	ZUIV+vRF3GsHSSBV+Zwg/t00V1DrfPW8N0A+Qy6KPhls6xaf9bwi9vM2UOt48i0mPR02tEGP/JCWi
	NHYHBicQp+jVx+p+QIUFtFS+leGfTBc7Ue+kUPH3THL6I5P0gsh9TelAzmfKNYChFbRkgH8VFMX9p
	vaGG5csAjHVw3SNaDzQF/1VWf166uXVYi6n60NRI94joH4RMLhPiA4aiD2nRZ8avrvzs29LbKbUHm
	3wr7pvvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whd1z-00000000i4e-3KYs;
	Thu, 09 Jul 2026 00:54:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whd1y-00000000i2z-2BX8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 00:54:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 46E35403BD;
	Thu,  9 Jul 2026 00:54:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB441F00A3D;
	Thu,  9 Jul 2026 00:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783558462;
	bh=/bSVn4A7P2buqPsSBN19q3GFhevpNvbqSjxF/MHUfow=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ISkTgtQdHCY3Kl6PyNrcXVINDT1nJ2/I55vKrqhSbY5sBIdkNcFg9QPT3DuRZ6/zu
	 xPcRHtCijzrJm5BsWhzTaWODWPuwlfrCiEYe4xCSXjs/ZTlBFnr3kf+pHA7eGGMyHO
	 QhPJ/XNDU2pe1woOo4J4JI2KcsFplW6BjLrKsKHfdnjP3BUmoenJyTZaY+uihDq1UY
	 M0CPYhKktKeYnjjwDbwNeEmv0HFnyV+p+gNQFD6jTxEwmakHXok+lwPfvqJnCn1rXd
	 F95cRh8/1ZrKedwdwN+Ujdyclyl7cEwLe4KTHi1Nhe14vYpGOZE/xeon0v5hbTra6A
	 LAZSCEC8c5tSQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 09 Jul 2026 01:52:01 +0100
Subject: [PATCH v11 24/29] KVM: arm64: Expose SME to nested guests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-kvm-arm64-sme-v11-24-32799f66db9d@kernel.org>
References: <20260709-kvm-arm64-sme-v11-0-32799f66db9d@kernel.org>
In-Reply-To: <20260709-kvm-arm64-sme-v11-0-32799f66db9d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2042; i=broonie@kernel.org;
 h=from:subject:message-id; bh=tZf10BakJWINVrDfcuSYxIcK5/guAElrikKeFmB4JK0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqTvDMcl7J3RgZf+7SCMTnD9CB6c9Ps/Vlln5v+
 mRgG0QzeC6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak7wzAAKCRAk1otyXVSH
 0CnqB/9YB/pEKAZDDChEBjui3D02Mo6xRPbmaFeQ4t4L21k3mpxLMVnyGuZjjnI6WlK66jQd77E
 4rmyQA5DyVOAPdHKPxIr6QDA1x2Lh8VC6yvcL+aqn3tndobvvuPXzMVIzXLx2Tc6VGyRZJUcJgj
 cvE/jCRegPcBMovfhp9P4sjH7t8YfgxotzsV4uwY5AucVGOlIXqS3FczPWk3WY28V6NlFa2aKx0
 TzIrXrgPugHIqnyuLy19iTJtvL1JXsd5cKRoyjAJkuAKlsigS3uPSVSYYAPRbHncGvybO/emGfm
 V119rZIGQf8ZUAyNyJIpTPMqiGw8qCMQeAFmpxb2TAjoxCf7
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

With support for context switching SME state in place allow access to SME
in nested guests.

The SME floating point state is handled along with all the other floating
point state, SME specific floating point exceptions are directed into the
same handlers as other floating point exceptions with NV specific handling
for the vector lengths already in place.

TPIDR2_EL0 is context switched along with the other TPIDRs as part of the
main guest register context switch.

SME priority support is currently masked from all guests including nested
ones.

Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_nested.h | 2 ++
 arch/arm64/kvm/nested.c             | 3 +--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index cdf3e8422ea1..9df3cea39b09 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -42,6 +42,8 @@ static inline u64 translate_cptr_el2_to_cpacr_el1(u64 cptr_el2)
 		cpacr_el1 |= CPACR_EL1_FPEN;
 	if (!(cptr_el2 & CPTR_EL2_TZ))
 		cpacr_el1 |= CPACR_EL1_ZEN;
+	if (!(cptr_el2 & CPTR_EL2_TSM))
+		cpacr_el1 |= CPACR_EL1_SMEN;
 
 	cpacr_el1 |= cptr_el2 & (CPTR_EL2_TCPAC | CPTR_EL2_TAM);
 
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 50e25ab9b604..fb6087426f95 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1630,14 +1630,13 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
 		break;
 
 	case SYS_ID_AA64PFR1_EL1:
-		/* Only support BTI, SSBS, CSV2_frac */
+		/* Only support BTI, SME, SSBS, CSV2_frac */
 		val &= ~(ID_AA64PFR1_EL1_PFAR		|
 			 ID_AA64PFR1_EL1_MTEX		|
 			 ID_AA64PFR1_EL1_THE		|
 			 ID_AA64PFR1_EL1_GCS		|
 			 ID_AA64PFR1_EL1_MTE_frac	|
 			 ID_AA64PFR1_EL1_NMI		|
-			 ID_AA64PFR1_EL1_SME		|
 			 ID_AA64PFR1_EL1_RES0		|
 			 ID_AA64PFR1_EL1_MPAM_frac	|
 			 ID_AA64PFR1_EL1_MTE);

-- 
2.47.3


