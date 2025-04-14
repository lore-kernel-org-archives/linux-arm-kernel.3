Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F70C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 12:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TsBDIP+6j3YBYTqyuD4e2mvdJ7/Zjpp+cUhethHLAi4=; b=Jw4f0+CWPYdIvZu6J7fJywNZ/x
	llqiJe3xyCkrjo7abBwaVdWxkBwnabP20aKVC7MeobwqVPIVDS49C53rOYTcatFwNxUrhUgRik4xY
	GLv3lwVVUubS+irPMET8VMhUqAWszG5SLwWN7CaVq7tRTdgujilUDKXjvmDtAAkJu9+3YmLbN3bbh
	ZBzngWTU2uzV+q5ZkzL7eQschIRGhzzwEmr3KGUOSmDZNAfXnrgAbzkS1KIC8SnSZP/hu5/fHvq26
	/fW4oMdOgGC6ijB3ewUwQrAQo9s/Cjf6P6aWMlRxw0bP0hlroIyqidYdkUgxMOWLvdyhAAZ7CVp3X
	kd5gBFQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4JKH-000000021Bi-0hQ3;
	Mon, 14 Apr 2025 12:54:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4J82-00000001zPx-2lDR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 12:41:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA1961007;
	Mon, 14 Apr 2025 05:41:32 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 83C403F59E;
	Mon, 14 Apr 2025 05:41:32 -0700 (PDT)
From: Ben Horgan <ben.horgan@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Cc: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	shuah@kernel.org,
	Ben Horgan <ben.horgan@arm.com>
Subject: [RFC PATCH 2/3] KVM: arm64: Make MTE_frac masking conditional on MTE capability
Date: Mon, 14 Apr 2025 13:40:58 +0100
Message-ID: <20250414124059.1938303-3-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250414124059.1938303-1-ben.horgan@arm.com>
References: <20250414124059.1938303-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_054134_818616_5DEA6333 
X-CRM114-Status: GOOD (  16.57  )
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

If MTE_frac is masked out unconditionally then the guest will always
see ID_AA64PFR1_EL1_MTE_frac as 0. However, a value of 0 when
ID_AA64PFR1_EL1_MTE is 2 indicates that MTE_ASYNC is supported. Hence, for
a host with ID_AA64PFR1_EL1_MTE==2 and ID_AA64PFR1_EL1_MTE_frac==0xf
(MTE_ASYNC unsupported) the guest would see MTE_ASYNC advertised as
supported whilst the host does not support it. Hence, expose the sanitised
value of MTE_frac to the guest and user-space.

As MTE_frac was previously hidden, always 0, and KVM must accept values
from KVM provided by user-space, when ID_AA64PFR1_EL1.MTE is 2 allow
user-space to set ID_AA64PFR1_EL1.MTE_frac to 0. However, ignore it to
avoid incorrectly claiming hardware support for MTE_ASYNC in the guest.

Note that linux does not check the value of ID_AA64PFR1_EL1_MTE_frac and
wrongly assumes that MTE async faults can be generated even on hardware
that does nto support them. This issue is not addressed here.

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 arch/arm64/kvm/sys_regs.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 005ad28f7306..9ae647082684 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1600,13 +1600,14 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
 		val = sanitise_id_aa64pfr0_el1(vcpu, val);
 		break;
 	case SYS_ID_AA64PFR1_EL1:
-		if (!kvm_has_mte(vcpu->kvm))
+		if (!kvm_has_mte(vcpu->kvm)) {
 			val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_MTE);
+			val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_MTE_frac);
+		}
 
 		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_SME);
 		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_RNDR_trap);
 		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_NMI);
-		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_MTE_frac);
 		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_GCS);
 		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_THE);
 		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_MTEX);
@@ -1953,11 +1954,32 @@ static int set_id_aa64pfr1_el1(struct kvm_vcpu *vcpu,
 {
 	u64 hw_val = read_sanitised_ftr_reg(SYS_ID_AA64PFR1_EL1);
 	u64 mpam_mask = ID_AA64PFR1_EL1_MPAM_frac_MASK;
+	u8 mte = SYS_FIELD_GET(ID_AA64PFR1_EL1, MTE, hw_val);
+	u8 user_mte_frac = SYS_FIELD_GET(ID_AA64PFR1_EL1, MTE_frac, user_val);
 
 	/* See set_id_aa64pfr0_el1 for comment about MPAM */
 	if ((hw_val & mpam_mask) == (user_val & mpam_mask))
 		user_val &= ~ID_AA64PFR1_EL1_MPAM_frac_MASK;
 
+	/*
+	 * Previously MTE_frac was hidden from guest. However, if the
+	 * hardware supports MTE2 but not MTE_ASYM_FAULT then a value
+	 * of 0 for this field indicates that the hardware supports
+	 * MTE_ASYNC. Whereas, 0xf indicates MTE_ASYNC is not supported.
+	 *
+	 * As KVM must accept values from KVM provided by user-space,
+	 * when ID_AA64PFR1_EL1.MTE is 2 allow user-space to set
+	 * ID_AA64PFR1_EL1.MTE_frac to 0. However, ignore it to avoid
+	 * incorrectly claiming hardware support for MTE_ASYNC in the
+	 * guest.
+	 */
+
+	if (mte == ID_AA64PFR1_EL1_MTE_MTE2 &&
+	    user_mte_frac == ID_AA64PFR1_EL1_MTE_frac_ASYNC) {
+		user_val &= ~ID_AA64PFR1_EL1_MTE_frac_MASK;
+		user_val |= hw_val & ID_AA64PFR1_EL1_MTE_frac_MASK;
+	}
+
 	return set_id_reg(vcpu, rd, user_val);
 }
 
-- 
2.43.0


