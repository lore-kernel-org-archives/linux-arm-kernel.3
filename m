Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1381AD3B994
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 20:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ihXpQp4YbEFBpuWRcFtm84jVRjsgBgDbq/Ms0l8x8e0=; b=Nvu0UdFNzJ46lGuU85XZN3Bk2k
	IIKcD+Aj3IIeo12gsJsSkGQf4WrbEQil/pffKqfNRCyey8MWXsDtd9tuSp8DW0k07Edt3oLa0SIB6
	Byeh2QMRvQrfbrONFr90/Z5d68AIeVT3OeI5N38WfFj+0Kn7FvMmarEZiNXRs5XdgFLIghOpoFUTN
	YWAhbqreVF1QFZMMNXl/GCCoihYl+WxXtH1H4MDOpiInb+mOlMT0o00O51nu+n5ApSRYZ81hf3L7q
	VZDluzTi7/FTQJWg01Ssm8vQo4YmEvIlo67N/OgijdbmcKfxo3ujE9eExQLTIY25S2/4Xa6A9LLlY
	Mz4pHYMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4hj-0000000El91-0jwD;
	Tue, 09 Dec 2025 20:53:03 +0000
Received: from mail-oo1-xc4a.google.com ([2607:f8b0:4864:20::c4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4hR-0000000EkoG-1SKh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 20:52:48 +0000
Received: by mail-oo1-xc4a.google.com with SMTP id 006d021491bc7-657a6c9d45eso4368594eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 12:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765313564; x=1765918364; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ihXpQp4YbEFBpuWRcFtm84jVRjsgBgDbq/Ms0l8x8e0=;
        b=lDqjl9YQjMSBm4g/O5IBe9FfMYqqmyLNF1xmGrdkwowRNyrrs3hqM98GJzqXtNp8XR
         xrXti2K5uGgKM23UcYIUsNEiJKa02DDV9ySRK9Ac6OQQkvFaU6EEkBugjxYgX+YI598G
         if8mQzkEHdQXEldekPc6/Ze4r7cnuDDWMBa37V5kZePtfLEeUwVTVCo5g3SUH/hYs8dI
         tEkJmHHVcE/2MUuIhQJJbkDXxvJg7iq+2eGSeqvxO6yBgAf9ApjCOhlTN03Era9yoy/i
         3AtGIFhjeL+8Lvvm9xZ54aVg98QjfyMf4jB9rmu+lSI2wlXyK/0nZ5ZgfJmTh01mKfIb
         GwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765313564; x=1765918364;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ihXpQp4YbEFBpuWRcFtm84jVRjsgBgDbq/Ms0l8x8e0=;
        b=jleMfO0pV4BXG+syOeltumq860uWGL/GIloknK/I/bx944V7g09nHgTo/oh1MrU1Ta
         TCy0uSbNFqnCS8vvZy6YmCs79u0tTlT/Tk8pwoC/aRlVAsZxOjAucPYYBD0xO2u78PCo
         CqELE3cjJZ//5KGlvTBJj38YCPm6FfS9VHdyURZULSleKSMge+T/rVFWSxxh5iSc2GKl
         wewmBtl2JOVSxGPAFZ7PB5KOW9Lb/zVzm2kCWoxWoIoNegRWl0RRLqB716XgW+7//pLK
         KiBBAiksXBASoG0+P+3xwacVLdjxstby6Jr1ZfAobFHGvKe98RCy0Mbv802T6GWDIU7k
         u+Zg==
X-Forwarded-Encrypted: i=1; AJvYcCXzppD4MMJIcn0jJ4zYP1oyzlmjE9TymmZooBVzyVngxznKYYVaADVT8p2k2c6nxj57Jq5dulup5RwTGGH/Hgmt@lists.infradead.org
X-Gm-Message-State: AOJu0YxFjgbuBRy+bz/RzJK+hXzkYTU/+30i5unsEf2BuIbgfSMhNU/V
	7kIA9ZnLazu0pdDnqeuBSpWRWwPeqnInxRfkWoLDVHJ8gEMbMVVueV7Z5+1CssVOEM8+9k3U3JM
	qzD5SO9shrJQc/wIhioawOys2iQ==
X-Google-Smtp-Source: AGHT+IHxM7HDFMt11Fktl9vAFCiqioFJsGX2hMXvHLM0Q/bfIgLNdr5sCpLbQ+drd5Dfesj8Rx6njSPwYNcP8RB94g==
X-Received: from ilbck7.prod.google.com ([2002:a05:6e02:3707:b0:430:c858:3dd3])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:20e:b0:657:64ce:b40f with SMTP id 006d021491bc7-65b2ac06416mr132080eaf.4.1765313564200;
 Tue, 09 Dec 2025 12:52:44 -0800 (PST)
Date: Tue,  9 Dec 2025 20:51:15 +0000
In-Reply-To: <20251209205121.1871534-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20251209205121.1871534-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251209205121.1871534-19-coltonlewis@google.com>
Subject: [PATCH v5 18/24] KVM: arm64: Enforce PMU event filter at vcpu_load()
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
X-CRM114-CacheID: sfid-20251209_125245_437217_20EF19A9 
X-CRM114-Status: GOOD (  16.12  )
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

The KVM API for event filtering says that counters do not count when
blocked by the event filter. To enforce that, the event filter must be
rechecked on every load since it might have changed since the last
time the guest wrote a value. If the event is filtered, exclude
counting at all exception levels before writing the hardware.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/pmu-direct.c | 44 +++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 71977d24f489a..8d0d6d1a0d851 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -221,6 +221,49 @@ u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu)
 	return nr_host_cnt_max;
 }
 
+/**
+ * kvm_pmu_apply_event_filter()
+ * @vcpu: Pointer to vcpu struct
+ *
+ * To uphold the guarantee of the KVM PMU event filter, we must ensure
+ * no counter counts if the event is filtered. Accomplish this by
+ * filtering all exception levels if the event is filtered.
+ */
+static void kvm_pmu_apply_event_filter(struct kvm_vcpu *vcpu)
+{
+	struct arm_pmu *pmu = vcpu->kvm->arch.arm_pmu;
+	u64 evtyper_set = ARMV8_PMU_EXCLUDE_EL0 |
+		ARMV8_PMU_EXCLUDE_EL1;
+	u64 evtyper_clr = ARMV8_PMU_INCLUDE_EL2;
+	u8 i;
+	u64 val;
+	u64 evsel;
+
+	if (!pmu)
+		return;
+
+	for (i = 0; i < pmu->hpmn_max; i++) {
+		val = __vcpu_sys_reg(vcpu, PMEVTYPER0_EL0 + i);
+		evsel = val & kvm_pmu_event_mask(vcpu->kvm);
+
+		if (vcpu->kvm->arch.pmu_filter &&
+		    !test_bit(evsel, vcpu->kvm->arch.pmu_filter))
+			val |= evtyper_set;
+
+		val &= ~evtyper_clr;
+		write_pmevtypern(i, val);
+	}
+
+	val = __vcpu_sys_reg(vcpu, PMCCFILTR_EL0);
+
+	if (vcpu->kvm->arch.pmu_filter &&
+	    !test_bit(ARMV8_PMUV3_PERFCTR_CPU_CYCLES, vcpu->kvm->arch.pmu_filter))
+		val |= evtyper_set;
+
+	val &= ~evtyper_clr;
+	write_pmccfiltr(val);
+}
+
 /**
  * kvm_pmu_load() - Load untrapped PMU registers
  * @vcpu: Pointer to struct kvm_vcpu
@@ -244,6 +287,7 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu)
 		return;
 
 	pmu = vcpu->kvm->arch.arm_pmu;
+	kvm_pmu_apply_event_filter(vcpu);
 
 	for (i = 0; i < pmu->hpmn_max; i++) {
 		val = __vcpu_sys_reg(vcpu, PMEVCNTR0_EL0 + i);
-- 
2.52.0.239.gd5f0c6e74e-goog


