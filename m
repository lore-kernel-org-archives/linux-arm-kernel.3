Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB0FD3B997
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 20:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7rslOWyfBKryoyVeAdT+vyRO2ASxcyyBGT1wwSBsKE=; b=kBddj71UaloAPXzEbe/S2x67KA
	r7wus1KeG5XQAUN/Mz+m0mU1P0TGxwOknaOR8sCEghdo/J6jxD8hp0gHx5ffDq8+xBbMphwPMRWxe
	xXMNhtZdwdgtEBfJgopcnK1YhnP1wC44haBmCwOoaZOLB04HGHYmCrr99qTzpKKI1MjPOBjuZQNuP
	KOQDWcDdnz/bFW14xEHd0l9ZOvGvHEtgoZP/LAXYwdvm9rghOx8YE/D7AJpmT0tSj7LOHSRxAtTy6
	GLwsUKHA3dtXs1xPJsw+MTIW17KMTSdsIYZLyDQe6A6HzblayqjQwA98rRjfJ2ZVA28UkVDBZk8lr
	TaVxSpUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4hg-0000000El6Q-3E2T;
	Tue, 09 Dec 2025 20:53:00 +0000
Received: from mail-oo1-xc49.google.com ([2607:f8b0:4864:20::c49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4hP-0000000EkkL-3xFL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 20:52:48 +0000
Received: by mail-oo1-xc49.google.com with SMTP id 006d021491bc7-657490e060dso5760363eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 12:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765313561; x=1765918361; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=I7rslOWyfBKryoyVeAdT+vyRO2ASxcyyBGT1wwSBsKE=;
        b=ZLUajriE0yOx6DjPMXVbQMvrj7JoCGR1JqNRA4+witXcc+KrZQOqXbmqwoGYDWIRMG
         legpHLWf/TNTITFGywpBPdPS9ZlmIG/sw0jQtK6oYIjtyMnCI1sXmfC/QFDjVopwwfvv
         /QhfkKYPFuDm810hpzA4rj7T0Em2wevOs/3O08TMH/iJzRHbeiowUInSp7kOyvgooTWY
         Dd66o2KbtpT5wwe/0urTEPS5UGq7yNM35DPiAPKLMqgvJJMpszIdMepT+hGcRDLr2VBO
         RvWNRAR53PC+0u8+0NJKSKhTg9V/QlTxwD7jsZP5WH2No1tG3mTC0pM9FHfWXZ5nwK5x
         5dwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765313561; x=1765918361;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I7rslOWyfBKryoyVeAdT+vyRO2ASxcyyBGT1wwSBsKE=;
        b=TCNu+TVh+YjhQllWTuDN2VLtx0lOkbn0GYc+8TFUnW6Ft1i7yLkfYgYr7GAFcof7O5
         SNVVyzmxMO7ySS3HLRm4aqMY86NN2Anm2o20JkTEoMTYs2bezVOOW+P3/jir9J0FoKtd
         XR9bXogszeNn7ckTPpWQEPBzRNndCrfiBZ37GdIlcSfK8NPsgnok+B/8UP/UaqzJPPB2
         NKlEoydotdRPQOMyH8jvj8RZpGER+QzD11jRGuyaEcG5lMnj5bJMsu4IYu2I3EiO8+Nh
         EgM+mEkZcFHkE2JYJ96WrB1U1sapQAeHdwmQeZ+aAogRCNTkkBZgngARhVFnkW1k4jZP
         wDoA==
X-Forwarded-Encrypted: i=1; AJvYcCUacXbcmqDkctcHThVJn2HgPWCkIH8LgnwWMc5LmsGzigggnUigNEMX57GEnOTq6gPg4TFm1+CIHyc6QTdGpicA@lists.infradead.org
X-Gm-Message-State: AOJu0YzSDn/A/1bclamhvCiE/89H/jIM5i3Dca4X/fPcDjbqSlElZkZP
	aDzB0rpkhOPr5utkCQJjpr78Xm+NHjsAYffuiEdQgATkHO+f8X7D9t1f/PMWycL9Fik+AGW8/zQ
	zu30e1qnWd9XlCUT02H8TJIf4Zw==
X-Google-Smtp-Source: AGHT+IFdNtZkxvJxJ9KoIinFxTXoYCnJbZauUeKj4oIMf+rqE8iUac1MGIbX45NhV6sJzZWUdWJoByDmtDg2d29Vpw==
X-Received: from ilbbc25.prod.google.com ([2002:a05:6e02:99:b0:434:972f:bf92])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:4cc2:b0:659:9a49:9050 with SMTP id 006d021491bc7-65b2ac45517mr108480eaf.27.1765313561253;
 Tue, 09 Dec 2025 12:52:41 -0800 (PST)
Date: Tue,  9 Dec 2025 20:51:12 +0000
In-Reply-To: <20251209205121.1871534-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20251209205121.1871534-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251209205121.1871534-16-coltonlewis@google.com>
Subject: [PATCH v5 15/24] KVM: arm64: Setup MDCR_EL2 to handle a partitioned PMU
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_125244_161479_14D623B7 
X-CRM114-Status: GOOD (  22.03  )
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

Setup MDCR_EL2 to handle a partitioned PMU. That means calculate an
appropriate value for HPMN instead of the default maximum setting the
host allows (which implies no partition) so hardware enforces that a
guest will only see the counters in the guest partition.

Setting HPMN to a non default value means the global enable bit for
the host counters is now MDCR_EL2.HPME instead of the usual
PMCR_EL0.E. Enable the HPME bit to allow the host to count guest
events. Since HPME only has an effect when HPMN is set which we only
do for the guest, it is correct to enable it unconditionally here.

Unset the TPM and TPMCR bits, which trap all PMU accesses, if
FGT (fine grain trapping) is being used.

If available, set the filtering bits HPMD and HCCD to be extra sure
nothing in the guest counts at EL2.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/kvm_pmu.h | 11 ++++++
 arch/arm64/kvm/debug.c           | 29 ++++++++++++--
 arch/arm64/kvm/pmu-direct.c      | 65 ++++++++++++++++++++++++++++++++
 3 files changed, 102 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pmu.h b/arch/arm64/include/asm/kvm_pmu.h
index 60b8a48cad456..8b634112eded2 100644
--- a/arch/arm64/include/asm/kvm_pmu.h
+++ b/arch/arm64/include/asm/kvm_pmu.h
@@ -101,6 +101,9 @@ u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu);
 void kvm_pmu_host_counters_enable(void);
 void kvm_pmu_host_counters_disable(void);
 
+u8 kvm_pmu_guest_num_counters(struct kvm_vcpu *vcpu);
+u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu);
+
 #if !defined(__KVM_NVHE_HYPERVISOR__)
 bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu);
 bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu);
@@ -173,6 +176,14 @@ static inline u64 kvm_pmu_fgt2_bits(void)
 {
 	return 0;
 }
+static inline u8 kvm_pmu_guest_num_counters(struct kvm_vcpu *vcpu)
+{
+	return 0;
+}
+static inline u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu)
+{
+	return 0;
+}
 static inline void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu,
 					     u64 select_idx, u64 val) {}
 static inline void kvm_pmu_set_counter_value_user(struct kvm_vcpu *vcpu,
diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index 3ad6b7c6e4ba7..0ab89c91e19cb 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -36,20 +36,43 @@ static int cpu_has_spe(u64 dfr0)
  */
 static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
 {
+	int hpmn = kvm_pmu_hpmn(vcpu);
+
 	preempt_disable();
 
 	/*
 	 * This also clears MDCR_EL2_E2PB_MASK and MDCR_EL2_E2TB_MASK
 	 * to disable guest access to the profiling and trace buffers
 	 */
-	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN,
-					 *host_data_ptr(nr_event_counters));
+
+	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN, hpmn);
 	vcpu->arch.mdcr_el2 |= (MDCR_EL2_TPM |
 				MDCR_EL2_TPMS |
 				MDCR_EL2_TTRF |
 				MDCR_EL2_TPMCR |
 				MDCR_EL2_TDRA |
-				MDCR_EL2_TDOSA);
+				MDCR_EL2_TDOSA |
+				MDCR_EL2_HPME);
+
+	if (kvm_vcpu_pmu_is_partitioned(vcpu)) {
+		/*
+		 * Filtering these should be redundant because we trap
+		 * all the TYPER and FILTR registers anyway and ensure
+		 * they filter EL2, but set the bits if they are here.
+		 */
+		if (is_pmuv3p1(read_pmuver()))
+			vcpu->arch.mdcr_el2 |= MDCR_EL2_HPMD;
+		if (is_pmuv3p5(read_pmuver()))
+			vcpu->arch.mdcr_el2 |= MDCR_EL2_HCCD;
+
+		/*
+		 * Take out the coarse grain traps if we are using
+		 * fine grain traps.
+		 */
+		if (kvm_vcpu_pmu_use_fgt(vcpu))
+			vcpu->arch.mdcr_el2 &= ~(MDCR_EL2_TPM | MDCR_EL2_TPMCR);
+
+	}
 
 	/* Is the VM being debugged by userspace? */
 	if (vcpu->guest_debug)
diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 4dd160c878862..7fb4fb5c22e2a 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -154,3 +154,68 @@ void kvm_pmu_host_counters_disable(void)
 	mdcr &= ~MDCR_EL2_HPME;
 	write_sysreg(mdcr, mdcr_el2);
 }
+
+/**
+ * kvm_pmu_guest_num_counters() - Number of counters to show to guest
+ * @vcpu: Pointer to struct kvm_vcpu
+ *
+ * Calculate the number of counters to show to the guest via
+ * PMCR_EL0.N, making sure to respect the maximum the host allows,
+ * which is hpmn_max if partitioned and host_max otherwise.
+ *
+ * Return: Valid value for PMCR_EL0.N
+ */
+u8 kvm_pmu_guest_num_counters(struct kvm_vcpu *vcpu)
+{
+	u8 nr_cnt = vcpu->kvm->arch.nr_pmu_counters;
+	int hpmn_max = armv8pmu_hpmn_max;
+	u8 host_max = *host_data_ptr(nr_event_counters);
+
+	if (vcpu->kvm->arch.arm_pmu)
+		hpmn_max = vcpu->kvm->arch.arm_pmu->hpmn_max;
+
+	if (kvm_vcpu_pmu_is_partitioned(vcpu)) {
+		if (nr_cnt <= hpmn_max && nr_cnt <= host_max)
+			return nr_cnt;
+		if (hpmn_max <= host_max)
+			return hpmn_max;
+	}
+
+	if (nr_cnt <= host_max)
+		return nr_cnt;
+
+	return host_max;
+}
+
+/**
+ * kvm_pmu_hpmn() - Calculate HPMN field value
+ * @vcpu: Pointer to struct kvm_vcpu
+ *
+ * Calculate the appropriate value to set for MDCR_EL2.HPMN. If
+ * partitioned, this is the number of counters set for the guest if
+ * supported, falling back to hpmn_max if needed. If we are not
+ * partitioned or can't set the implied HPMN value, fall back to the
+ * host value.
+ *
+ * Return: A valid HPMN value
+ */
+u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu)
+{
+	u8 nr_guest_cnt = kvm_pmu_guest_num_counters(vcpu);
+	int nr_guest_cnt_max = armv8pmu_hpmn_max;
+	u8 nr_host_cnt_max = *host_data_ptr(nr_event_counters);
+
+	if (vcpu->kvm->arch.arm_pmu)
+		nr_guest_cnt_max = vcpu->kvm->arch.arm_pmu->hpmn_max;
+
+	if (kvm_vcpu_pmu_is_partitioned(vcpu)) {
+		if (cpus_have_final_cap(ARM64_HAS_HPMN0))
+			return nr_guest_cnt;
+		else if (nr_guest_cnt > 0)
+			return nr_guest_cnt;
+		else if (nr_guest_cnt_max > 0)
+			return nr_guest_cnt_max;
+	}
+
+	return nr_host_cnt_max;
+}
-- 
2.52.0.239.gd5f0c6e74e-goog


