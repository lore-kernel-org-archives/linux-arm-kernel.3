Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11B8C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 23:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZ8dG4IcFoEafWjbI5Tl7HqmjBNXuoxF6820bVcH07Q=; b=jYJQOltKfJCriYdybZpj6qWy91
	6tohHHKHMPSQE+7W1gcEcubcR2d3xnbA8wPcXahjKJ9NKal5p8fwXokyAe0w3tooRTuMqDRgUBigv
	9cq2KSxJrhpXuNjOT6qnC8MLK8zAg+8QK/Fv4pPZ5ybeJQO/dSZuHW1JFwbng5fRfwaoXhUU2fhZn
	YydZiRXo/nQPRtOq73BHjvCa3eWy2j90nFXi2XczEXb56GYHFNYvGt8DD8pL2gOSvuh+E1urHua5k
	uKY9TPsKRwSDr0c9fH7ZUlmT1Y9qaMkAjm6B7w8/4uWb3N8pcxaqlzdciy2ZoCkqOi7YNghzwZvQF
	WYc33DSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubSaM-00000003Xdr-1RIZ;
	Mon, 14 Jul 2025 23:27:50 +0000
Received: from mail-io1-xd4a.google.com ([2607:f8b0:4864:20::d4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubS97-00000003STy-0zuJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 22:59:42 +0000
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-86cf753423cso443509239f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 15:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752533980; x=1753138780; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BZ8dG4IcFoEafWjbI5Tl7HqmjBNXuoxF6820bVcH07Q=;
        b=EjCbwTaE+KgOndclmTZdMV/JbVnP37asW+qilN63N5KgdNAFqVSWCe8uUsqKlb+Xq7
         4KRQ2BXNrgYpvuSqfI2tWOPAfqvThJKqaK4MJii/EZAX0dyqUeSm8E24K2w5L8RyyG1E
         bHi9oYfGYQmf8nQhisxG2M/j3hmFr7cf3H0J3nktbnNMqBS6iYC8wkviYxMKpGqyH4mI
         sJxw9F75tvyXkQ5snKyw6xsH+y0FjSgoEAOqg9NLQ+4mlAZ8Vui/y/8rRfPB+lgbCnzM
         WFwlTf+cTaUGMrFO0NHGb4vZVQLzoOcKYH30Cfmb5jkQ3yeIHttwUMPTqalR4lx6wms3
         bgQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752533980; x=1753138780;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BZ8dG4IcFoEafWjbI5Tl7HqmjBNXuoxF6820bVcH07Q=;
        b=xTrq9Tb8lrUGAj78zI9h8kMJEg50Pt3BaV6HVuiubMfR/Y3EGEO+fzc2KURd0RFXO8
         VCEh/jCpnkQzJaAXQAui9HTOPc2v2qZDMTdWxqqnXjQL4D45/0FxXZpUttUHotwlh4fp
         Iic1isLTPFMWjEVzrAFPR5U3JoJ62IVo0i/d14ByY4AVimDDhmbPNQ4pkKU78/Ry+t8W
         TipfHSo5jVqMyMHfPfHJZtLLUtWU2NtjUApNBHrc8r2JmtyJkYTjepmHLpHLrm12zJcw
         bkTEH6cpgj4x7PWS7T3CYGfY3eW3zCq0SL2+Z2IWV220hd3TVZR5IHki+Z+9Ib1JK4C+
         1X/A==
X-Forwarded-Encrypted: i=1; AJvYcCUKl5EmRn8EFbEc/cirZBA5DfrfPA3w4SmhQnfUAXGnTpCU0qSBASArpMud9PfMdh1nHb8vw2LsCjd5+11q/Jhb@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+/szwFqht20dRDc7wI3Y7OT3T3tObhKyNypEo6yt11y9abacu
	MyxVHexJH4wHI0cVOCCYnbtaa2OaZtTuZwuJABKevfTFcwQmO+4r4heZtuGm2d7wjPnUdhhrsDx
	sPZKZMXyhvnzI+l8gEKhvgDotuw==
X-Google-Smtp-Source: AGHT+IGJW+F7N+Qps6LoDsgu+dPhKH89vA9SG/aNNYSKUKGt/XO72mo40SLlz3/qQJipXch8VyxKlGUxhSMvINEeyA==
X-Received: from iove26.prod.google.com ([2002:a05:6602:45a:b0:861:c7b1:d848])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6602:6d03:b0:86c:cf7e:d85d with SMTP id ca18e2360f4ac-8797888c692mr1676383639f.12.1752533980153;
 Mon, 14 Jul 2025 15:59:40 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:59:04 +0000
In-Reply-To: <20250714225917.1396543-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250714225917.1396543-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250714225917.1396543-11-coltonlewis@google.com>
Subject: [PATCH v4 10/23] KVM: arm64: Writethrough trapped PMEVTYPER register
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_155941_279036_1E9D73DC 
X-CRM114-Status: GOOD (  13.97  )
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

With FGT in place, the remaining trapped registers need to be written
through to the underlying physical registers as well as the virtual
ones. Failing to do this means delaying when guest writes take effect.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/sys_regs.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index b3f97980b11f..704e5d45ce52 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1036,6 +1036,30 @@ static bool access_pmu_evcntr(struct kvm_vcpu *vcpu,
 	return true;
 }
 
+static bool writethrough_pmevtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
+				   u64 reg, u64 idx)
+{
+	u64 eventsel;
+
+	if (idx == ARMV8_PMU_CYCLE_IDX)
+		eventsel = ARMV8_PMUV3_PERFCTR_CPU_CYCLES;
+	else
+		eventsel = p->regval & kvm_pmu_evtyper_mask(vcpu->kvm);
+
+	if (vcpu->kvm->arch.pmu_filter &&
+	    !test_bit(eventsel, vcpu->kvm->arch.pmu_filter))
+		return false;
+
+	__vcpu_assign_sys_reg(vcpu, reg, eventsel);
+
+	if (idx == ARMV8_PMU_CYCLE_IDX)
+		write_pmccfiltr(eventsel);
+	else
+		write_pmevtypern(idx, eventsel);
+
+	return true;
+}
+
 static bool access_pmu_evtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 			       const struct sys_reg_desc *r)
 {
@@ -1062,7 +1086,9 @@ static bool access_pmu_evtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 	if (!pmu_counter_idx_valid(vcpu, idx))
 		return false;
 
-	if (p->is_write) {
+	if (kvm_vcpu_pmu_is_partitioned(vcpu) && p->is_write) {
+		writethrough_pmevtyper(vcpu, p, reg, idx);
+	} else if (p->is_write) {
 		kvm_pmu_set_counter_event_type(vcpu, p->regval, idx);
 		kvm_vcpu_pmu_restore_guest(vcpu);
 	} else {
-- 
2.50.0.727.gbf7dc18ff4-goog


