Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F73CD98DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 06:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1n7cJGRx/zTufLA+k8QJWETRRdEVZBs0mmRutVAhkNk=; b=EyXGvulaJ6/2XrIcaT+iQ7XfPe
	LPAk16bw3FF29uv6NkLdR7bsQ5L21ZZVcpWcZj+CksbvTtoBYMsWu4bF73kWYUrQq09ZNvPDHMTdA
	/qaQ7tjGYkmsDJk7O4Rv3oKzB6mhrZnEUEY5XG7CDxwDUv/3MQKQe1Z50EC/AhUEFVt/EreXfn8hx
	wbbDQFYP4wVA3dSJ3xa7lMnjMjBkqie7HQKet60aMCaB62JiOtS7AFnMjaSAwS5C8AX2VZmz5LLHs
	BpRkurBGykZmxP/JYQrsBOL+ykO53O+fU4oW7D2kZUghkv5d/6EeGNtp9u8WwotYCzGMlhvJWjiFM
	nvFU3esQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXvrj-0000000AR4E-2Y5u;
	Fri, 12 Jun 2026 06:59:43 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXvrc-0000000AQwy-1X8J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 06:59:37 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490b93debc8so5130695e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 23:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781247574; x=1781852374; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1n7cJGRx/zTufLA+k8QJWETRRdEVZBs0mmRutVAhkNk=;
        b=elb/eUHKnOpNMOWPoemikrrCGG5WDxrmLEsmlLQkar0iRmURbC+3gN6WQkUvwg3Pkn
         Z+z88I1lj7XrAbeqauy2llbGYzjxzIVirzVlBNIg7lHImz9do+q7nJONtWrjJVxKIQ8x
         UAY+3Fo6qd4q+qdqMOAvRkwT9mGYoBl8eQ8PP+ZFGcQt6OMfULgQvYmKDDo+zZvM2jIM
         1jjaqidYpxtRHOkC7JkgClWEEk+iBV0jKux2kSOnTpziZMofFSv2+C+gnRO/HTsGj+ny
         du3ISxWgIVv5Oa5jGARQ1PW4JiyeKB5J/ihB5h8ZBQkoDnbPXWFYaBr4TpeKod15Invf
         twTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781247574; x=1781852374;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1n7cJGRx/zTufLA+k8QJWETRRdEVZBs0mmRutVAhkNk=;
        b=GbtzgOOqJ1ONtg9gHOs0LcXDlc41AC2qn42HANrekHFVy6krQ3nJ9uy42s62XwDQn/
         spA8fwasP0EL+RDQcvWEqwu+eD0qIteZ69Oov/ihJIsFD6Hu7QKpdpAizKEIY8o2a7K0
         HEGutXKuOIlnIUcfZ6kBXRxeCk7FYXP021FQaoittuHIrvdYj7OFvp2e9C7P4vMkSJYx
         OI/o0epk6yDwUzA6+mZghUEHF4XSaP6k5o8dPPmiB27XTXPG/YmME7ZQLWw7Sk6B4wvR
         wOOr9m4ahOTJeZeX+W89jRlWVfdP0BEuq4NLD1LZNQYNi2vNesMn00AMKWmWdAy2wFiL
         ITdw==
X-Forwarded-Encrypted: i=1; AFNElJ/VsE0IP/ijrCb+pKaq7+PFkqIOZzm7Of6TsZTzLStklctVHK0QHW5lr7G8UQRVrSwRsASCMzobXbx6svWqU05M@lists.infradead.org
X-Gm-Message-State: AOJu0YzJxL6Gy3Rhypege7Rzkscmpb7qmoljcaRMrRtSLEzdxVDBJK5n
	Bdx1awmepbZ2rOxujj/S1BO2z/8JQn34PR/vjXr72wBj+Dlj2MtY4YOsBKM4OqtxiLt9xDYc5sD
	DCQ==
X-Received: from wmc19.prod.google.com ([2002:a05:600c:6013:b0:490:bdab:4cf6])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c107:b0:48e:7854:1608
 with SMTP id 5b1f17b1804b1-490ec508dbfmr16032775e9.25.1781247573832; Thu, 11
 Jun 2026 23:59:33 -0700 (PDT)
Date: Fri, 12 Jun 2026 07:59:21 +0100
In-Reply-To: <20260612065925.755562-1-tabba@google.com>
Mime-Version: 1.0
References: <20260612065925.755562-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612065925.755562-8-tabba@google.com>
Subject: [PATCH v1 07/11] KVM: arm64: Move PSCI helper functions to a shared header
From: tabba@google.com
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Sebastian Ene <sebastianene@google.com>, 
	Per Larsen <perlarsen@google.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Hyunwoo Kim <imv4bel@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_235936_422666_F3CA8B0D 
X-CRM114-Status: GOOD (  15.54  )
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
 include/kvm/arm_psci.h | 28 ++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/kvm/psci.c b/arch/arm64/kvm/psci.c
index e1389c525e9d..228e5040c379 100644
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
@@ -131,7 +115,7 @@ static unsigned long kvm_psci_vcpu_affinity_info(struct kvm_vcpu *vcpu)
 		return PSCI_RET_INVALID_PARAMS;
 
 	/* Determine target affinity mask */
-	target_affinity_mask = psci_affinity_mask(lowest_affinity_level);
+	target_affinity_mask = kvm_psci_affinity_mask(lowest_affinity_level);
 	if (!target_affinity_mask)
 		return PSCI_RET_INVALID_PARAMS;
 
@@ -215,18 +199,6 @@ static void kvm_psci_system_suspend(struct kvm_vcpu *vcpu)
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
index cbaec804eb83..f12b74a4b176 100644
--- a/include/kvm/arm_psci.h
+++ b/include/kvm/arm_psci.h
@@ -38,6 +38,34 @@ static inline int kvm_psci_version(struct kvm_vcpu *vcpu)
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
2.54.0.1136.gdb2ca164c4-goog


