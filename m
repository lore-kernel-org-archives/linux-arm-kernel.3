Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3990DC5AD44
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 08:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+A/GWMMn/zlz2wejiFB/oEcYi+94/jbgzvZk1RNCE8=; b=CzFmDWDdeCMt/7oSgVyjBihm+/
	1HRpuNeDjbQya/1lASXM1Pv68E8cLs7zOu2dbFgYLs4ERgE39Nh2jPVzvr9PQmImoe3bQ/P9NegeX
	LjZewlxi3dkfucRsVIkFh3BZ2Df4FdRmaMkR1pt+Qv4cHTgnpsq/IbFymU5CkIV3r7UjJAyIVeW/K
	LM6fkUsoUvColNKdBAi4Fs81OiCY4OjvX4r9qSGBPpo2mzBPz6mbyVBhwzMT+YmJxyW9w9O7hsH5t
	8V4V78dyLpPFRXFDbCakulC8E6btkNWb9xj07wzrcwdbSTGpgNbBPL8JmlhWu6vm8SGgTzJ++svKG
	okaibI6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsct3-00000009Bbm-1aoQ;
	Sat, 08 Aug 2026 08:58:37 +0000
Received: from mail-ej1-x645.google.com ([2a00:1450:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsct0-00000009BZx-3L6n
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 08:58:35 +0000
Received: by mail-ej1-x645.google.com with SMTP id a640c23a62f3a-c15fff01a30so18278466b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 01:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786179512; x=1786784312; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w+A/GWMMn/zlz2wejiFB/oEcYi+94/jbgzvZk1RNCE8=;
        b=PHcXKyqhAMXruQ/SGkees9NbHd9vrElxUp4m7lgZJgiJqzOfMDN7LttRrZM0A0MrkQ
         /mUUqGEMZpZKnJRHQwLSPr7hMV+jEMkTB2uqQEZVRyBPCUzHW7MozTnCrGqFDtsMbTuC
         DwuYHbzNXeZZhB/ZFZ65bSrG9+sZq8dZiaH9WN8JXX2jJB8PsyShs0FiOtm+/JIBbabU
         e/4N8NCTtwnqL99A12hXWnl4dHPP7CBHXUZ1c0CTNAXyGKvi9rlS1YjDABrt9L39zeGP
         1RUB6/gpZ0FBiOu/quvgVuhfomfvW0//ORgMjkXy1KM24J92eF5NjCxb97czUwbqXUtm
         ZsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786179512; x=1786784312;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w+A/GWMMn/zlz2wejiFB/oEcYi+94/jbgzvZk1RNCE8=;
        b=VvKklVTGxxojKnFEMR9h6GMeBtSuy0CGjRpMwACSZrXjk2j5TtLwRXgc/ChWkmIhBi
         h63JC7GCViJuhNpYnza9GHsxyCXO3G5BZ4JdNd+8ZRoQVs/kot971dyX10Mt/yBkCj62
         oCC+xa0jEuuMYbW0KVKKX9sZ+YScEYqS/0NE73+Bmetc7Kk+nCNcu2bNjLTy+Ka7Yx91
         eNE6iPhrXreMnEIrCB6dQtlyzJU2G+1zCOTgmPfACdmopF8f8N7Ihq9JDNGRb2Z3SBkY
         A1aR1KGb5AVk0k8tgBqhxhFPNnuKN6aWjDqpT1VsiFiMZ3WMOinS4VZ0sR3zthcwkzMD
         N/jg==
X-Forwarded-Encrypted: i=1; AHgh+RpxLtsKvieXfjwZNrHBV4KMBFVWIycHsUS+OUyczeI9u2kzSIFVNoGcHYh8oCAkWctERH0buLFyowi0MFEuyi4h@lists.infradead.org
X-Gm-Message-State: AOJu0Yx74ZZxsk3Cg6TeDj4UjRqDo0YCVn/PQrbVWCeOyFCr+8xhhnKg
	785A2iS7oXpfOJv9OJ+SlCj4ngu1S0bnFawAB/Tvqi7dQirvzKwKtLb8VnB8NVrrtvL8IykcnqI
	+V8BgYEIFdw1htQ==
X-Received: from ejdao2.prod.google.com ([2002:a17:907:f482:b0:c15:cd6e:51d6])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:9729:b0:c15:db5c:7127 with SMTP id a640c23a62f3a-c2073364a2bmr714358466b.20.1786179511440;
 Sat, 08 Aug 2026 01:58:31 -0700 (PDT)
Date: Sat,  8 Aug 2026 08:58:22 +0000
In-Reply-To: <20260808085824.732659-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260808085824.732659-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.654.g21b8a5bc05-goog
Message-ID: <20260808085824.732659-2-smostafa@google.com>
Subject: [PATCH v2 1/3] KVM: arm64: Make timer_get_offset() work in all contexts
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, seiden@linux.ibm.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, vdonnefort@google.com, 
	tabba@google.com, sebastianene@google.com, keirf@google.com, 
	yaoyuan@linux.alibaba.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_015834_858559_E8A40006 
X-CRM114-Status: GOOD (  13.36  )
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

From: Marc Zyngier <maz@kernel.org>

We currently have two implementations of get_timer offset(), one
in arm_arch_timer.h, and another one in switch.h.

These two only differ by a pair of kern_hyp_va(), which seems a
pretty weak reason to open-code it.

Turn this function into a macro to avoid the include dependency hell
on kern_hyp_va(), and make it work correctly in all contexts.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/include/hyp/switch.h | 15 +----------
 include/kvm/arm_arch_timer.h            | 34 +++++++++++++++----------
 2 files changed, 22 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index 4bf624a49591..2aceda749641 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -706,22 +706,9 @@ static inline bool handle_tx2_tvm(struct kvm_vcpu *vcpu)
 	return true;
 }
 
-/* Open-coded version of timer_get_offset() to allow for kern_hyp_va() */
-static inline u64 hyp_timer_get_offset(struct arch_timer_context *ctxt)
-{
-	u64 offset = 0;
-
-	if (ctxt->offset.vm_offset)
-		offset += *kern_hyp_va(ctxt->offset.vm_offset);
-	if (ctxt->offset.vcpu_offset)
-		offset += *kern_hyp_va(ctxt->offset.vcpu_offset);
-
-	return offset;
-}
-
 static inline u64 compute_counter_value(struct arch_timer_context *ctxt)
 {
-	return arch_timer_read_cntpct_el0() - hyp_timer_get_offset(ctxt);
+	return arch_timer_read_cntpct_el0() - timer_get_offset(ctxt);
 }
 
 static bool kvm_handle_cntxct(struct kvm_vcpu *vcpu)
diff --git a/include/kvm/arm_arch_timer.h b/include/kvm/arm_arch_timer.h
index 725023ddc792..f3f0a79647cd 100644
--- a/include/kvm/arm_arch_timer.h
+++ b/include/kvm/arm_arch_timer.h
@@ -163,20 +163,28 @@ static inline bool has_cntpoff(void)
 	return (has_vhe() && cpus_have_final_cap(ARM64_HAS_ECV_CNTPOFF));
 }
 
-static inline u64 timer_get_offset(struct arch_timer_context *ctxt)
-{
-	u64 offset = 0;
+#ifdef __KVM_NVHE_HYPERVISOR__
+#define KERN_HYP_VA(x)		kern_hyp_va(x)
+#else
+#define KERN_HYP_VA(x)		x
+#endif
 
-	if (!ctxt)
-		return 0;
-
-	if (ctxt->offset.vm_offset)
-		offset += *ctxt->offset.vm_offset;
-	if (ctxt->offset.vcpu_offset)
-		offset += *ctxt->offset.vcpu_offset;
-
-	return offset;
-}
+#define timer_get_offset(ctxt)						\
+	({								\
+		struct arch_timer_context *__ctxt = (ctxt);		\
+		u64 off = 0;						\
+									\
+		if (__ctxt) {						\
+			struct arch_timer_offset *ato = &__ctxt->offset;\
+									\
+			if (ato->vm_offset)				\
+				off += *KERN_HYP_VA(ato->vm_offset);	\
+			if (ato->vcpu_offset)				\
+				off += *KERN_HYP_VA(ato->vcpu_offset);	\
+		}							\
+									\
+		off;							\
+	})
 
 static inline void timer_set_offset(struct arch_timer_context *ctxt, u64 offset)
 {
-- 
2.55.0.654.g21b8a5bc05-goog


