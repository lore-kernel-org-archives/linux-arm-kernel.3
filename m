Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1395CDB467
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 07:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1QUYcee151+QuSJM7wM7vpmF/sftjcL7x2ymejauNs=; b=pVOyUrzNMWa6y6e2//CYir+qYV
	YsE2IoHdn3izjEsgFkqRdMPaehTkSL1lmerNDs/xJnjr/MLRm8XE2jnn4tVhwchA5Me4alu18S/yH
	vL7xgRassbatFoMSNx4xTD85vhd3XK3QNugMqXzgYXC4TLSgxqG8M8ukVnRLVyYuBTUedF28apHHj
	fsoECBaFu7Lqx2RbIoY5Oh5y9kSo3e58sCBoi0XFky/bRnRxidGQ+Pf/WBUn8gSgE95NJeC8GyBlo
	3RhScfn172t/aXeV6PlnChdfhnqDg6Spcf0IU6P1L+WqZJKuF+u4Yy3PLDSE2B4HtB3PTGrBxkSc2
	WZsybqOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTK6-000000025Iu-0Cqd;
	Fri, 19 Jun 2026 07:07:30 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTK4-000000025FQ-0Tpk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 07:07:29 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-464f7476bfeso642778f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 00:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781852846; x=1782457646; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=S1QUYcee151+QuSJM7wM7vpmF/sftjcL7x2ymejauNs=;
        b=JZEneoMxn7gfXN/5mF1cq+UBPejCIADA3v/O5syZqfj1YGI91CslVr1wpjLFmZMGfG
         8SOFBZ1VsVvYN38J+EQ/J2UzDsbYgTXL0F48A63GVuxu1ThzCHmPvpPxOxeepZl7Vl3r
         rgm1g9UbufBHu/HZGc8U6HV+mrLcra64utiX/+4ml2SA+xywAuAaZYp7eTomjFGYc0mz
         Vf47s7/chQ5NB+VGY1klPX9S9YAaGJKrnSsijwg9lKW1Md0PdpYCaCRdL/wKjr7/AWj2
         CG3b6BFVqtwEyFMXN9M18/OtfZ78W1NqbD6Yi9avgIIbExzhSjBxPduNeglOhodDf6P9
         g6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781852846; x=1782457646;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S1QUYcee151+QuSJM7wM7vpmF/sftjcL7x2ymejauNs=;
        b=SwzsbKn+4onMO+lhp5AJaN6JFXamiuSgobh+LmtZLovIxTC12OTGseJGLPi+HxC1Tm
         Jw4YWXlA1hn8JP3/MKIe1zwunCIO0CHhvIvnDKAlS2SBmwl5669Bmo2EmV1/tdjtiAJv
         XrG03r5O4uaAe2nOAhlfZ6fgO4rW1zZJn2OB7DNpSDK3TlCxkM7DlNRRVxlc5+9iotGo
         q1ecmApHwE5/gNsT4DyBRvqeuu0l5H0dbjeCzSN2p0p+Tyuk82rW1JDFR9gVJgBFdDLO
         BbmTnHT4oYUyEzbpBPtrBHuXAzvsHU7s+u0nsx5E9TiQtlA4Bm8Xo/PnaLRSe+R4U4KS
         McvQ==
X-Forwarded-Encrypted: i=1; AFNElJ8r4OYAxIoZoCycI+SC7v2+Mnm52YGPDy//Z76V7Ys8ke0iyH8p/OsmjyW6xj5A9kA37QF7OXLKR0646UfGEABJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwXr/re23+14YVD9yulemCMV+1yvXFSnqg8fsynUyLIwIYLpVFj
	SC4yknGqe8xUhl7a7++YANjPqB2B66IM/d3ObkWsEFr4UAa8eZWN9bqVQ6M2XMD56WM5r4AVXVn
	FTw==
X-Received: from wrmd14.prod.google.com ([2002:adf:e88e:0:b0:44b:7bd5:1b9f])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:adf:e891:0:b0:45e:ea68:523b
 with SMTP id ffacd0b85a97d-465004395ccmr3242226f8f.10.1781852845441; Fri, 19
 Jun 2026 00:07:25 -0700 (PDT)
Date: Fri, 19 Jun 2026 08:07:15 +0100
In-Reply-To: <20260619070719.812227-1-tabba@google.com>
Mime-Version: 1.0
References: <20260619070719.812227-1-tabba@google.com>
X-Mailer: git-send-email 2.55.0.rc0.738.g0c8ab3ebcc-goog
Message-ID: <20260619070719.812227-5-tabba@google.com>
Subject: [PATCH v2 4/8] KVM: arm64: Move PSCI helper functions to a shared header
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Quentin Perret <qperret@google.com>, 
	Sebastian Ene <sebastianene@google.com>, Hyunwoo Kim <imv4bel@gmail.com>, 
	Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_000728_175130_F7BF5F16 
X-CRM114-Status: GOOD (  15.71  )
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

Move kvm_psci_valid_affinity() and kvm_psci_narrow_to_32bit() from
psci.c to include/kvm/arm_psci.h, and move psci_affinity_mask() there
too, renaming it kvm_psci_affinity_mask() now that it is no longer
file-local. A follow-up series handles some protected-guest PSCI calls
at EL2 using these helpers.

No functional change intended.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/psci.c  | 30 +-----------------------------
 include/kvm/arm_psci.h | 27 +++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/kvm/psci.c b/arch/arm64/kvm/psci.c
index 3b5dbe9a0a0e..e3db84400d1f 100644
--- a/arch/arm64/kvm/psci.c
+++ b/arch/arm64/kvm/psci.c
@@ -21,16 +21,6 @@
  * as described in ARM document number ARM DEN 0022A.
  */
 
-#define AFFINITY_MASK(level)	~((0x1UL << ((level) * MPIDR_LEVEL_BITS)) - 1)
-
-static unsigned long psci_affinity_mask(unsigned long affinity_level)
-{
-	if (affinity_level <= 3)
-		return MPIDR_HWID_BITMASK & AFFINITY_MASK(affinity_level);
-
-	return 0;
-}
-
 static unsigned long kvm_psci_vcpu_suspend(struct kvm_vcpu *vcpu)
 {
 	/*
@@ -51,12 +41,6 @@ static unsigned long kvm_psci_vcpu_suspend(struct kvm_vcpu *vcpu)
 	return PSCI_RET_SUCCESS;
 }
 
-static inline bool kvm_psci_valid_affinity(struct kvm_vcpu *vcpu,
-					   unsigned long affinity)
-{
-	return !(affinity & ~MPIDR_HWID_BITMASK);
-}
-
 static unsigned long kvm_psci_vcpu_on(struct kvm_vcpu *source_vcpu)
 {
 	struct vcpu_reset_state *reset_state;
@@ -135,7 +119,7 @@ static unsigned long kvm_psci_vcpu_affinity_info(struct kvm_vcpu *vcpu)
 		return PSCI_RET_INVALID_PARAMS;
 
 	/* Determine target affinity mask */
-	target_affinity_mask = psci_affinity_mask(lowest_affinity_level);
+	target_affinity_mask = kvm_psci_affinity_mask(lowest_affinity_level);
 	if (!target_affinity_mask)
 		return PSCI_RET_INVALID_PARAMS;
 
@@ -220,18 +204,6 @@ static void kvm_psci_system_suspend(struct kvm_vcpu *vcpu)
 	run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
 }
 
-static void kvm_psci_narrow_to_32bit(struct kvm_vcpu *vcpu)
-{
-	int i;
-
-	/*
-	 * Zero the input registers' upper 32 bits. They will be fully
-	 * zeroed on exit, so we're fine changing them in place.
-	 */
-	for (i = 1; i < 4; i++)
-		vcpu_set_reg(vcpu, i, lower_32_bits(vcpu_get_reg(vcpu, i)));
-}
-
 static unsigned long kvm_psci_check_allowed_function(struct kvm_vcpu *vcpu, u32 fn)
 {
 	/*
diff --git a/include/kvm/arm_psci.h b/include/kvm/arm_psci.h
index cbaec804eb83..f86a006d6713 100644
--- a/include/kvm/arm_psci.h
+++ b/include/kvm/arm_psci.h
@@ -38,6 +38,33 @@ static inline int kvm_psci_version(struct kvm_vcpu *vcpu)
 	return KVM_ARM_PSCI_0_1;
 }
 
+/* Narrow the PSCI register arguments (r1 to r3) to 32 bits. */
+static inline void kvm_psci_narrow_to_32bit(struct kvm_vcpu *vcpu)
+{
+	int i;
+
+	/*
+	 * Zero the input registers' upper 32 bits. They will be fully
+	 * zeroed on exit, so we're fine changing them in place.
+	 */
+	for (i = 1; i < 4; i++)
+		vcpu_set_reg(vcpu, i, lower_32_bits(vcpu_get_reg(vcpu, i)));
+}
+
+static inline bool kvm_psci_valid_affinity(struct kvm_vcpu *vcpu,
+					   unsigned long affinity)
+{
+	return !(affinity & ~MPIDR_HWID_BITMASK);
+}
+
+static inline unsigned long kvm_psci_affinity_mask(unsigned long affinity_level)
+{
+	if (affinity_level <= 3)
+		return MPIDR_HWID_BITMASK &
+			~((0x1UL << (affinity_level * MPIDR_LEVEL_BITS)) - 1);
+
+	return 0;
+}
 
 int kvm_psci_call(struct kvm_vcpu *vcpu);
 
-- 
2.55.0.rc0.738.g0c8ab3ebcc-goog


