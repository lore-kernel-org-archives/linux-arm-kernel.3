Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18C9CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 21:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vvvExWFpSdxF1U5r97vObpZLpBpbjqEmnZt44hIldRo=; b=L66Ilcs7G78tjTegh+b/wIKRuN
	5uvMd5SgO2aBLyeCO49PImSil+YN7jDobdxk4Lxy5AsxV+BejH88Yk5vjAe5XR7QsKZNANnp1RJxP
	lWXSe2Ro0Eibxk9NaF4l3qqg6ubjv2/yZJwbmP0Bq9EPlUWUkEtvcgNJ9SFz0c7W9EQUEOOAn4Vod
	IXFJq/Xeo+9fyrGfMn3TFtBde4ww4NvuvfhtsFL9RFEZm7a3MYfBylB9lILNpuWk9as735ei/vNtd
	P5mOXDFK0RrUunscSzxwPgnhpbhotYXB66D+2a9sXh0ktO03D8gkEySMWIXjThZ2yr8v2x0g8nVQ3
	7v5ZQneQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK0gj-0000000ELdY-3Vqh;
	Mon, 04 May 2026 21:18:49 +0000
Received: from mail-oo1-xc4a.google.com ([2607:f8b0:4864:20::c4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK0gg-0000000ELWT-1qND
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 21:18:47 +0000
Received: by mail-oo1-xc4a.google.com with SMTP id 006d021491bc7-6949a8f3256so7145523eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 14:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777929525; x=1778534325; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vvvExWFpSdxF1U5r97vObpZLpBpbjqEmnZt44hIldRo=;
        b=C0uzNZzhYnQBNfS/SYY2ywMLVw3pwHF60icLtJe7AoYtzUbzst2+dsGDocOSdtep2B
         7D2a9l3ZBBhNYFgqi07tTBieZcjHP4nKT7Fnq5PmPlBVl3sqwE7yKE6nNTCLEjJ1tE4e
         q8flFtTsRDogH/saxhfH6BgaZcWtrgiWEMZm7ftGkIVJ1baeSeN1ziAGcSxtYTOYPBvs
         2l4fKK7Zeg3PBpzTibh3sucBK6+U0pTLOlt3suJhehwlpVI2GdqZQKGmlTcU2XRc//Ll
         W4Pfh+yMEOO7bnF1bo53ylaXWfoNzGFA7durkRelCN9wK5HutlYQB5ERYsREg2Z+1sEe
         JiXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777929525; x=1778534325;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vvvExWFpSdxF1U5r97vObpZLpBpbjqEmnZt44hIldRo=;
        b=TvHj4UkGPMslJGKlBDSlmoWQkDf5CHetxU6hvVcsgYjdCUH/RltOZijjcNWfXddeKL
         Q8uAHsC3OeKUDtc9FL60A29EtmNYHBTPFiFutP0+LmNQ2FsBm9FWqWJUdOyuXq3stsQx
         0zrYwNpSg1BrHBTQk7sjzDO35VfWybiqZmVHPwJea13WL3e5R6berZ1PCRK9GYap6Yf8
         DG8HKKYEdxCT/CBs5ekDDheM+eCPELH4fNKz7Q1Aavhtf2phIvlKoROn1tDocPKBpq7Y
         GjybckSumZ2mHsBp4vVy8Z5iskS/vNIn+e6dBwVOlBgi4ebz2yFm51/wlyTECE0s9dtP
         qOdw==
X-Forwarded-Encrypted: i=1; AFNElJ+Q79ElNMW8Wn9G/W0XUZmmY4faRIfzTjwmyoxE7UvdOv8zxJ6a0hfXkzs8fDghqSHLVuMaT9OtmOkII5Q+CzJw@lists.infradead.org
X-Gm-Message-State: AOJu0YwOrRKjedFZuY+aSZLYly9Z1mF/yyfBm+NOq6t93sn9lzSizCi2
	p42Dn1cXGn0hlwmFT29UTTUGMu/qvKshxJB38utHZJMYPclGp5K/ygBTeF6LZxyElxLll7YPFqb
	IN97IpYq8Bbq9RLu6MSEKZ9i8HQ==
X-Received: from ilpy14.prod.google.com ([2002:a92:c74e:0:b0:4fe:8f5f:a030])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:2b03:b0:693:7a6f:b311 with SMTP id 006d021491bc7-6989150d84emr387036eaf.22.1777929525215;
 Mon, 04 May 2026 14:18:45 -0700 (PDT)
Date: Mon,  4 May 2026 21:18:06 +0000
In-Reply-To: <20260504211813.1804997-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260504211813.1804997-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260504211813.1804997-14-coltonlewis@google.com>
Subject: [PATCH v7 13/20] KVM: arm64: Apply dynamic guest counter reservations
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_141846_518553_144D1940 
X-CRM114-Status: GOOD (  16.92  )
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

Apply dynamic guest counter reservations by checking if the requested
guest mask collides with any events the host has scheduled and calling
pmu_perf_resched_update() with a hook that updates the mask of
available counters in between schedule out and schedule in.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/pmu-direct.c  | 69 ++++++++++++++++++++++++++++++++++++
 include/linux/perf/arm_pmu.h |  1 +
 2 files changed, 70 insertions(+)

diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 2252d3b905db9..14cc419dbafad 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -100,6 +100,73 @@ u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu)
 	return *host_data_ptr(nr_event_counters);
 }
 
+/* Callback to update counter mask between perf scheduling */
+static void kvm_pmu_update_mask(struct pmu *pmu, void *data)
+{
+	struct arm_pmu *arm_pmu = to_arm_pmu(pmu);
+	unsigned long *new_mask = data;
+
+	bitmap_copy(arm_pmu->cntr_mask, new_mask, ARMPMU_MAX_HWEVENTS);
+}
+
+/**
+ * kvm_pmu_set_guest_counters() - Handle dynamic counter reservations
+ * @cpu_pmu: struct arm_pmu to potentially modify
+ * @guest_mask: new guest mask for the pmu
+ *
+ * Check if guest counters will interfere with current host events and
+ * call into perf_pmu_resched_update if a reschedule is required.
+ */
+static void kvm_pmu_set_guest_counters(struct arm_pmu *cpu_pmu, u64 guest_mask)
+{
+	struct pmu_hw_events *cpuc = this_cpu_ptr(cpu_pmu->hw_events);
+	DECLARE_BITMAP(guest_bitmap, ARMPMU_MAX_HWEVENTS);
+	DECLARE_BITMAP(new_mask, ARMPMU_MAX_HWEVENTS);
+	bool need_resched = false;
+
+	bitmap_from_arr64(guest_bitmap, &guest_mask, ARMPMU_MAX_HWEVENTS);
+	bitmap_copy(new_mask, cpu_pmu->hw_cntr_mask, ARMPMU_MAX_HWEVENTS);
+
+	if (guest_mask) {
+		/* Subtract guest counters from available host mask */
+		bitmap_andnot(new_mask, new_mask, guest_bitmap, ARMPMU_MAX_HWEVENTS);
+
+		/* Did we collide with an active host event? */
+		if (bitmap_intersects(cpuc->used_mask, guest_bitmap, ARMPMU_MAX_HWEVENTS)) {
+			int idx;
+
+			need_resched = true;
+			cpuc->host_squeezed = true;
+
+			/* Look for pinned events that are about to be preempted */
+			for_each_set_bit(idx, guest_bitmap, ARMPMU_MAX_HWEVENTS) {
+				if (test_bit(idx, cpuc->used_mask) && cpuc->events[idx] &&
+				    cpuc->events[idx]->attr.pinned) {
+					pr_warn_ratelimited("perf: Pinned host event squeezed out by KVM guest PMU partition\n");
+					break;
+				}
+			}
+		}
+	} else {
+		/*
+		 * Restoring to hw_cntr_mask.
+		 * Only resched if we previously squeezed an event.
+		 */
+		if (cpuc->host_squeezed) {
+			need_resched = true;
+			cpuc->host_squeezed = false;
+		}
+	}
+
+	if (need_resched) {
+		/* Collision: run full perf reschedule */
+		perf_pmu_resched_update(&cpu_pmu->pmu, kvm_pmu_update_mask, new_mask);
+	} else {
+		/* Host was never using guest counters anyway */
+		bitmap_copy(cpu_pmu->cntr_mask, new_mask, ARMPMU_MAX_HWEVENTS);
+	}
+}
+
 /**
  * kvm_pmu_host_counter_mask() - Compute bitmask of host-reserved counters
  * @pmu: Pointer to arm_pmu struct
@@ -218,6 +285,7 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu)
 
 	pmu = vcpu->kvm->arch.arm_pmu;
 	guest_counters = kvm_pmu_guest_counter_mask(pmu);
+	kvm_pmu_set_guest_counters(pmu, guest_counters);
 	kvm_pmu_apply_event_filter(vcpu);
 
 	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
@@ -319,5 +387,6 @@ void kvm_pmu_put(struct kvm_vcpu *vcpu)
 	val = read_sysreg(pmintenset_el1);
 	__vcpu_assign_sys_reg(vcpu, PMINTENSET_EL1, val & mask);
 
+	kvm_pmu_set_guest_counters(pmu, 0);
 	preempt_enable();
 }
diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
index f7b000bb3eca8..63f88fec5e80f 100644
--- a/include/linux/perf/arm_pmu.h
+++ b/include/linux/perf/arm_pmu.h
@@ -75,6 +75,7 @@ struct pmu_hw_events {
 
 	/* Active events requesting branch records */
 	unsigned int		branch_users;
+	bool host_squeezed;
 };
 
 enum armpmu_attr_groups {
-- 
2.54.0.545.g6539524ca2-goog


