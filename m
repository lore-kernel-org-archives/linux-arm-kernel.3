Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121AFCD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 19:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zUfvJDWatpVt+iiRM4HzP8H2jLIkMlFqueFXiDB4Pis=; b=t+Q7QHA9nLFhp7NgmUnQcY5qVi
	k6EajFL911T+mXu7eozqaoXcrqPHj4rhBg30t2lGzLy8snd6fGRvThowN0ZgD4iyBliM+0oDC2IBK
	3RUN/cERk78u6bIFEgqwoVXIJwThttZyrxtcwUgAM7chan9M6Ndodmz7jJxD90+EaW7mLY4D2O0Df
	t0neB0225iI9Qg1X1GSsHfdtQ0140jzACZazTsa2k+cUGbOo5ocuAsWfCookq4c+gRkTCn2uprDZt
	niCTxopYVnRW5ljMejO5IN6vlot+R1jbZbpWbaSE+1hA8zJXOivsQ+hoa0E9RKWiXO26eCVuHVLei
	0gRWYvQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7ZM-0000000BSdI-3zHy;
	Fri, 12 Jun 2026 19:29:32 +0000
Received: from mail-oi1-x24a.google.com ([2607:f8b0:4864:20::24a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7ZC-0000000BSQN-00FX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 19:29:23 +0000
Received: by mail-oi1-x24a.google.com with SMTP id 5614622812f47-48638da0e05so1169363b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 12:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781292559; x=1781897359; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zUfvJDWatpVt+iiRM4HzP8H2jLIkMlFqueFXiDB4Pis=;
        b=d98weCbt4PbOBkrjBBw9sf9Tf2b88/6cRfzqT0ihK/+opWnLdq2k/0sjRGUP/yEHOn
         wvunm01QvMxu10+NrMfTZCn2UUS/KY6GT0kfAB0RGptLJhyIBavE8Hb9VGCJfKjK2sc8
         g5iGSLd2m5Z3ItW1hmbQ6UuYXboKwoJZxBDamd+f5WqkQx0a/IWhogSIKenkCoNffxlq
         wAQ5+NzUVfbv9/Nui/fVJV6Sc12QhIbNyPdWgFgj5DSteGDn7uxUmfJ+8/8dCcoLuNCj
         seMbBVrpYHhURa2FW6aVnzptmIwuFZ3hLnH34sFQ4xaxZXHzL08PhziXsQu5wpXz0kbi
         /6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781292559; x=1781897359;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zUfvJDWatpVt+iiRM4HzP8H2jLIkMlFqueFXiDB4Pis=;
        b=rPh/WTKasoBLfjTvsZtaOuU9Zz9gNlMOnQJq95qgBmFF04FQr24oZHT33uXOShoH/D
         ql09eOV+IAGIOQr7xGkCwc78kJ0RtpaLlxKc/ASkShiCjUVb6/WokX9Cb+3pIbM4JAxt
         Ljjit2j7pudFFasEWDWmU7Tx0ghIAemWtxsPcMif5GdzhU8/GiXbFMZIqeGkkc7uYL1c
         CkqWMwpZksp2WUUOSOt33/EV7VORgKoI4tad2uLAgBrXB61qWHD9nO1qEPErhi32zSru
         +Fgq3Aqmkd7U5azDMH+XBebIylr7k0RwUhZ8LtTmKaRLQU+xu9sBRi4ACiosCPZY7qSs
         zjxg==
X-Forwarded-Encrypted: i=1; AFNElJ9WhPE/39L9rmlyBeDVtQ+eG17Er4l2kF3tK3CG055gE3V+vGJ+cx/99A9jk1SyU2PIykr8w6XWNY8T37mJwgZF@lists.infradead.org
X-Gm-Message-State: AOJu0YyGAECR1y1+pUZXTvfTVxMrDRYwDrJfQqJG+o8xi2+0VizsX/W8
	aX58WK1uW859r8MPbQXzOOy+34CMHyP9yRTSF+W920m/SHI0T8xH3XKvhwdonWryGIYAVXy2TpZ
	yYsX0YA47yf503aWbmzLSLmHhnA==
X-Received: from jabjq11.prod.google.com ([2002:a05:6638:8d8b:b0:5e2:7e1d:1f79])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1790:b0:47b:bd7b:10e5 with SMTP id 5614622812f47-4872f35387fmr2525333b6e.3.1781292559384;
 Fri, 12 Jun 2026 12:29:19 -0700 (PDT)
Date: Fri, 12 Jun 2026 19:28:58 +0000
In-Reply-To: <20260612192909.1153907-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260612192909.1153907-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612192909.1153907-11-coltonlewis@google.com>
Subject: [PATCH 10/21] KVM: arm64: Set up MDCR_EL2 to handle a Partitioned PMU
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mingwei Zhang <mizhang@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	James Clark <james.clark@linaro.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_122922_168964_FF8B2A26 
X-CRM114-Status: GOOD (  16.41  )
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

Set up MDCR_EL2 to handle a Partitioned PMU. If partitioned, set the
HPME, HPMD, and HCCD bits. If we have the ability to use Fine Grain
Traps (FEAT_FGT) also, unset the TPM and TPMCR bits that trap all PMU
accesses and set HPMN to the correct number of guest counters so
hardware enforces the right values.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/debug.c | 27 ++++++++++++++++++++++++---
 arch/arm64/kvm/pmu.c   |  7 +++++++
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index f4d7b12045e8f..c84321277d893 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -43,14 +43,35 @@ static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
 	 * This also clears MDCR_EL2_E2PB_MASK and MDCR_EL2_E2TB_MASK
 	 * to disable guest access to the profiling and trace buffers
 	 */
-	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN,
-					 *host_data_ptr(nr_event_counters));
+
+	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN, *host_data_ptr(nr_event_counters));
 	vcpu->arch.mdcr_el2 |= (MDCR_EL2_TPM |
 				MDCR_EL2_TPMS |
 				MDCR_EL2_TTRF |
 				MDCR_EL2_TPMCR |
 				MDCR_EL2_TDRA |
-				MDCR_EL2_TDOSA);
+				MDCR_EL2_TDOSA |
+				MDCR_EL2_HPME);
+
+	if (kvm_pmu_is_partitioned(vcpu->kvm)) {
+		u8 nr_guest_cntr = vcpu->kvm->arch.nr_pmu_counters;
+
+		vcpu->arch.mdcr_el2 |= (MDCR_EL2_HPMD | MDCR_EL2_HCCD);
+
+		/*
+		 * Take out the coarse grain traps if we are using
+		 * fine grain traps and enforce counter access with
+		 * HPMN.
+		 */
+		if (!vcpu_on_unsupported_cpu(vcpu) &&
+		    cpus_have_final_cap(ARM64_HAS_FGT) &&
+		    (cpus_have_final_cap(ARM64_HAS_HPMN0) || nr_guest_cntr > 0)) {
+			vcpu->arch.mdcr_el2 &= ~(MDCR_EL2_TPM | MDCR_EL2_TPMCR | MDCR_EL2_HPMN);
+			vcpu->arch.mdcr_el2 |= FIELD_PREP(MDCR_EL2_HPMN, nr_guest_cntr);
+		}
+
+
+	}
 
 	/* Is the VM being debugged by userspace? */
 	if (vcpu->guest_debug)
diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index 9ad3520417413..55cda8021400a 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -552,6 +552,13 @@ u8 kvm_arm_pmu_get_max_counters(struct kvm *kvm)
 	if (cpus_have_final_cap(ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS))
 		return 1;
 
+	/*
+	 * If partitioned then we are limited by the max counters in
+	 * the guest partition.
+	 */
+	if (pmu_is_partitioned(arm_pmu))
+		return arm_pmu->max_guest_counters;
+
 	/*
 	 * The arm_pmu->cntr_mask considers the fixed counter(s) as well.
 	 * Ignore those and return only the general-purpose counters.
-- 
2.54.0.1136.gdb2ca164c4-goog


