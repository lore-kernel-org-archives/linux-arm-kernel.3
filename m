Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F76CD98F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 07:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1QUYcee151+QuSJM7wM7vpmF/sftjcL7x2ymejauNs=; b=nWya9BdqY7qzfU097n7kmJTDJb
	cENv4GmF1Yaa4V2a2/cKhBdePySqXl5nF7Tai4SOa/8EejsNLMwg3KeUiMuhb5etAfux8S/uhqEj8
	9/E8KlTjGu/jdTwQh1vO5t/zwrRhzftplN+CC59mvnbO6aNsvQpm8QBZq8AmMQb7j8K2kLLOelnBl
	o7L5HSxmRx/Q8TxC6qlmo4iyDVMW0pZEbDv5ElaNySM1VwGsIIPc6H+4JOzppOE+aCD/uLFX5x7Bu
	R2HRRdL4Xnttezwxk4lvsQzeLrMSPQ0DHo+gQL0YsPbjAAbHAcddwnLjCFh1cPJA0IAJj+Vuu1jNK
	A1DZzO5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTIC-000000024bN-1odH;
	Fri, 19 Jun 2026 07:05:32 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTHx-000000024QQ-2wXq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 07:05:18 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-695837464bcso2199557a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 00:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781852715; x=1782457515; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=S1QUYcee151+QuSJM7wM7vpmF/sftjcL7x2ymejauNs=;
        b=Ut6oIBmDz5YhPjTLZdN0UiyYWwhmUCxOINd4QFghWj/A0/t59RSkhqfkD6s0Pj34g/
         Xhdd0diwM2l/2UIxVdpgnluUKf/arWWMA2OFBxC6J08JnBdHY3htfFRu+d2ZY5fZoIrm
         gBNvGWrY9vhzW2h+uKzb6fI5ZwtCVoO5Cx1mwISW1fXBaCoysGOQmcqPwUsI1H9tsSN5
         plHE9/iTi4XdBDYWZDbJPF8T6mDYYrb4mKUNzjzCes4/yDlARK9hP+Sfe10TeJC/npuO
         /Fu68YiwIxuNKBSBUCDbyKI8Ecc821Jlh9lrWZCSdgKGe/Yt1hOULedEgpo4t8hFlsLR
         gVuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781852715; x=1782457515;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S1QUYcee151+QuSJM7wM7vpmF/sftjcL7x2ymejauNs=;
        b=gmmeOAdj2PY29lzdEiWAZ48tJFkdt11fy3bw542HjkEUar/Da6V7Ic8/w7sYg2hpQU
         fDxk1ACFEdoxjlnt3K8d07WOB3XmRnT127SzuXTG4kplFmBoFMZjHVKdk0Bp2LRLjOSA
         8B5VGM5wNVNzfWyBe6Oxgs7WKKHNrttgo7E5lgMhH9TDYUpXU5xuP65alFBfHkmeZPtZ
         N3U9gsqj8QkyRs8IqzAVASXZk7K/pleUzn8VukeyP4lYVWQgv+Usly/VPCTwsUIybsc4
         13/JewVqW4Rdb2VPKqXPIICpbCZQAPlBw7/GL34bifiOwtDFmbaVQ4nhpzny9xHvun+l
         lZqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+mSuFaQYhrclM0tPX+qD2uhXjF5EnkBATXrtFlzJba7RaCS91lrT+RmF9RSyCltc/p0f69oby/9ZrygK2l40IW@lists.infradead.org
X-Gm-Message-State: AOJu0YxhXRYeeY03+Br6mxW9OtHAn38AEeMRvUbkdehJ8gqow/adWWTi
	tFfupDE5URGSdKQhVt7cg2oJbYtDdTFZFO4A2ZDB/fl8p/JU+ht6mgwbEv3tlJLQu1+1H8wuyxM
	hIQ==
X-Received: from edrl9.prod.google.com ([2002:aa7:c3c9:0:b0:696:1db4:76f8])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:274c:b0:693:ed2:3f7a
 with SMTP id 4fb4d7f45d1cf-696e52367dfmr1182084a12.25.1781852714655; Fri, 19
 Jun 2026 00:05:14 -0700 (PDT)
Date: Fri, 19 Jun 2026 08:05:04 +0100
In-Reply-To: <20260619070508.802802-1-tabba@google.com>
Mime-Version: 1.0
References: <20260619070508.802802-1-tabba@google.com>
X-Mailer: git-send-email 2.55.0.rc0.738.g0c8ab3ebcc-goog
Message-ID: <20260619070508.802802-5-tabba@google.com>
Subject: [PATCH 4/8] KVM: arm64: Move PSCI helper functions to a shared header
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
X-CRM114-CacheID: sfid-20260619_000517_780696_CB6F57D1 
X-CRM114-Status: GOOD (  15.49  )
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


