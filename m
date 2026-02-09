Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BB5E94622
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 22:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nily0rEh3mmY4uvAeTjqDVW7kEcYRK1QYtsSJT+aPhk=; b=KyF77gXpuszuUULmW+T1toghVW
	i4uf2WNZUNvS+cx6PyqJ3FYTYlkAVqCUIdM4JKahjei056lZcT6pSkDfDYTrULMaY3hgBG6OwtgrE
	wW07C+FCKJEXmbvrRc8n6rMxmOSBSVnHiKxKLWAEc2nww9JhbHiWBZUyQCiK/OpOt5POeuOyR9WlL
	cGrZFW552Xn7Jto+QfG+8vCx14XlfVlT2t2+85den92vq8EuL4e9WjZ06V96P1gRDIyxZN/eVP/gw
	kkiS9ylt4PRrJ+EJRbKcYagQ9UC7k/V1dSYyCiRTpvkq0UlOaonUR8iejShvKNF5Fo/pLdxE+hKyj
	9acc7+wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZwJ-0000000G7WT-13QB;
	Mon, 09 Feb 2026 22:41:07 +0000
Received: from mail-oo1-xc4a.google.com ([2607:f8b0:4864:20::c4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZw7-0000000G7Ln-0Bdr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 22:40:59 +0000
Received: by mail-oo1-xc4a.google.com with SMTP id 006d021491bc7-66317aad908so12089163eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 14:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770676852; x=1771281652; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nily0rEh3mmY4uvAeTjqDVW7kEcYRK1QYtsSJT+aPhk=;
        b=gvi31MgTYkri3LdB29EaZrHsyDqsWBV/AY81MFaMB3AxBOML0KQXa+1rIVmlIIN7Y3
         +Pm8P9JsowiO3qrkNBfpytqDoLxhzAw7+wYIgu0G5Zy9KEyil4Ahxt/UvYMuVx5zRUHE
         7AStXjYVOh5Sy8QezvyzqWGhRjcW13xLap7JduFvzKRnsh3GS+oo+VgGEkd8T9URtioc
         V5d4f7gQVVNgOcB18ddZTU+6Xy0XpjdsFxDSQmSt4ZvKoL3721cDTzwDecI/ucnnb6Hg
         PZZ4q16JeRW4KJu4vMmvEdep9Hz1VZfgecNvbGMgsPdkX7syuMdCNUTjavzN0MJVSAo8
         R+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770676852; x=1771281652;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nily0rEh3mmY4uvAeTjqDVW7kEcYRK1QYtsSJT+aPhk=;
        b=kA68Rf759UNzonRUsPccodFImzNlzQumcYsHlBKkwh5LoTwMv+CahTlM5Ao7hGYCMb
         fNhshot0hWd4CTTlMNiGcY4weyQqj4cGQEisysyIMzYf9d5jeBEztPIdGcoJDHk6Sf5v
         UlclpljqFCanDYOPFoApEkkp9cXEnyUDKCQ7WMZde5CFivf7j8zLmqPWv8USy4QmtZnu
         pIJCA+ZGBE6QrDpFM5XqbXjDsnk2DPD8/GAFZ5FgFoBOy9fZniBf/eqMN5MUaffIo3vx
         MVvztoFxrm1+fjV2GrVFV+HpROjzJOTRyf95cb9gke8O1MC0Jz2Ts7Y0BprJvIYBU2jR
         B0QA==
X-Forwarded-Encrypted: i=1; AJvYcCV0pjtY+lorrofb96o/dRYA73A1nGeqhse2dG9LHVD+c4OoSMCgUOTvRsUii1KBPg9tgykS+P471ul+fnK/4ktu@lists.infradead.org
X-Gm-Message-State: AOJu0YzGHJT7PnC/QNGKT8on/ah/slmpI6vmlmTJ2VaUIkWM+Tud5pvJ
	fv7+pM9OrdybyKIyTLPJV9mUURTs3OL1VmxUNKyBLWswuI059EHWhDy1MqKblXEw6NL0pFx+Q/z
	OXzfBiV/hSbY7d5t9rMF7ng5ZjA==
X-Received: from iobbx7.prod.google.com ([2002:a05:6602:4187:b0:957:50e1:3858])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a4a:e902:0:b0:66f:6d5e:76c3 with SMTP id 006d021491bc7-672fff0af95mr60439eaf.42.1770676852384;
 Mon, 09 Feb 2026 14:40:52 -0800 (PST)
Date: Mon,  9 Feb 2026 22:14:03 +0000
In-Reply-To: <20260209221414.2169465-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260209221414.2169465-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260209221414.2169465-9-coltonlewis@google.com>
Subject: [PATCH v6 08/19] KVM: arm64: Define access helpers for PMUSERENR and PMSELR
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mingwei Zhang <mizhang@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_144055_140520_F5EBB034 
X-CRM114-Status: GOOD (  16.10  )
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

In order to ensure register permission checks will have consistent
results whether or not the PMU is partitioned, define some access
helpers for PMUSERENR and PMSELR that always return the canonical
value for those registers, whether it lives in a physical or virtual
register.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/pmu.c      | 16 ++++++++++++++++
 arch/arm64/kvm/sys_regs.c |  6 +++---
 include/kvm/arm_pmu.h     | 12 ++++++++++++
 3 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index 74a5d35edb244..344ed9d8329a6 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -885,3 +885,19 @@ u64 kvm_vcpu_read_pmcr(struct kvm_vcpu *vcpu)
 
 	return u64_replace_bits(pmcr, n, ARMV8_PMU_PMCR_N);
 }
+
+u64 kvm_vcpu_read_pmselr(struct kvm_vcpu *vcpu)
+{
+	if (kvm_vcpu_pmu_is_partitioned(vcpu))
+		return read_sysreg(pmselr_el0);
+	else
+		return __vcpu_sys_reg(vcpu, PMSELR_EL0);
+}
+
+u64 kvm_vcpu_read_pmuserenr(struct kvm_vcpu *vcpu)
+{
+	if (kvm_vcpu_pmu_is_partitioned(vcpu))
+		return read_sysreg(pmuserenr_el0);
+	else
+		return __vcpu_sys_reg(vcpu, PMUSERENR_EL0);
+}
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index a460e93b1ad0a..9e893859a41c9 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -987,7 +987,7 @@ static u64 reset_pmcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
 
 static bool check_pmu_access_disabled(struct kvm_vcpu *vcpu, u64 flags)
 {
-	u64 reg = __vcpu_sys_reg(vcpu, PMUSERENR_EL0);
+	u64 reg = kvm_vcpu_read_pmuserenr(vcpu);
 	bool enabled = (reg & flags) || vcpu_mode_priv(vcpu);
 
 	if (!enabled)
@@ -1141,7 +1141,7 @@ static bool access_pmu_evcntr(struct kvm_vcpu *vcpu,
 				return false;
 
 			idx = SYS_FIELD_GET(PMSELR_EL0, SEL,
-					    __vcpu_sys_reg(vcpu, PMSELR_EL0));
+					    kvm_vcpu_read_pmselr(vcpu));
 		} else if (r->Op2 == 0) {
 			/* PMCCNTR_EL0 */
 			if (pmu_access_cycle_counter_el0_disabled(vcpu))
@@ -1191,7 +1191,7 @@ static bool access_pmu_evtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 
 	if (r->CRn == 9 && r->CRm == 13 && r->Op2 == 1) {
 		/* PMXEVTYPER_EL0 */
-		idx = SYS_FIELD_GET(PMSELR_EL0, SEL, __vcpu_sys_reg(vcpu, PMSELR_EL0));
+		idx = SYS_FIELD_GET(PMSELR_EL0, SEL, kvm_vcpu_read_pmselr(vcpu));
 		reg = PMEVTYPER0_EL0 + idx;
 	} else if (r->CRn == 14 && (r->CRm & 12) == 12) {
 		idx = ((r->CRm & 3) << 3) | (r->Op2 & 7);
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 50983cdbec045..f21439000129b 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -130,6 +130,8 @@ int kvm_arm_set_default_pmu(struct kvm *kvm);
 u8 kvm_arm_pmu_get_max_counters(struct kvm *kvm);
 
 u64 kvm_vcpu_read_pmcr(struct kvm_vcpu *vcpu);
+u64 kvm_vcpu_read_pmselr(struct kvm_vcpu *vcpu);
+u64 kvm_vcpu_read_pmuserenr(struct kvm_vcpu *vcpu);
 bool kvm_pmu_counter_is_hyp(struct kvm_vcpu *vcpu, unsigned int idx);
 void kvm_pmu_nested_transition(struct kvm_vcpu *vcpu);
 #else
@@ -250,6 +252,16 @@ static inline u64 kvm_vcpu_read_pmcr(struct kvm_vcpu *vcpu)
 	return 0;
 }
 
+static inline u64 kvm_vcpu_read_pmselr(struct kvm_vcpu *vcpu)
+{
+	return 0;
+}
+
+static u64 kvm_vcpu_read_pmuserenr(struct kvm_vcpu *vcpu)
+{
+	return 0;
+}
+
 static inline bool kvm_pmu_counter_is_hyp(struct kvm_vcpu *vcpu, unsigned int idx)
 {
 	return false;
-- 
2.53.0.rc2.204.g2597b5adb4-goog


