Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331A5C02199
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 02:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJ0ITpSot12bWRIgUxfFL1nJMNuEe3fyU4TCb+rHvco=; b=3NOtQ7Xt/yQyYSPn49y4EBq+Ru
	6+GuBZexRBhmyM4MxhqyD7Y4/CbvAXwTBkZzyEp+ka9UcZF2Zuty3HbO/YumlQbXWEO9CpGA7Mtn9
	eLGVO7fN4Uib3dzqZ5jvPg1PwYHPvRXjtRuslvX0BCfUC0kRayFs9i1t+9YSl7GlTB+ZbKSZix6NC
	03iEAzp/KIa0xFaxKeEclgMQrldVBK6EXEZvwBKrXqgXGdVz6X4rUvxsqt4wdnFQZ4gU/0EbL8lvF
	yBqHiR30LP3LypFoCXqrNuEWCrpuxKy/YS7CMk/VPl6o/q4gjrgN3JJDTjvxdAFrW7HfwHf1gLyT+
	5tbtsBfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgaJ3-0000000BspH-00lB;
	Sat, 08 Feb 2025 02:10:53 +0000
Received: from mail-il1-x149.google.com ([2607:f8b0:4864:20::149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tga9v-0000000BrNF-1RHs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 02:01:29 +0000
Received: by mail-il1-x149.google.com with SMTP id e9e14a558f8ab-3d14c647935so7313585ab.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 18:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738980087; x=1739584887; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TJ0ITpSot12bWRIgUxfFL1nJMNuEe3fyU4TCb+rHvco=;
        b=1HpiEG0SNSzlJoz2c4t+p4U1/lnyzxro4+7/jVJu6Cx3kODYuQEn3ZOZfwBdVXKtgl
         DeBLr3SpsyOQA5PkVjZzw23iZLSufoVheaeub3PiBiDlK66bcNKJAtbSXkMinWa+9SAi
         PCG/jZbkLDUyRMdqCdBXmuVwEl8jO8Vxd1LKsABF8fdAbnaLT3KFG7ZW55cIqHFnq2Fr
         0e4MYMug/QpvuH07hzVGsxz5b6U4GpNLEMLg2iNkFMyLxWI57aUrTR9SfE1KnUPZKdYX
         JRpdr0VEQoYCR0d+CF+LUJpWpDvaAenmkf0pKjH2HkYx9c1XXkuNUNMCX9ZOV+KOJyqY
         2NJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738980087; x=1739584887;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TJ0ITpSot12bWRIgUxfFL1nJMNuEe3fyU4TCb+rHvco=;
        b=O/Nnm68UaZx1ryTuqxonj8rS/fdXAjBRf0XcRuFZdAAFiJMJMJE5hIdw06/VWtmR/S
         Whce9QDG8JzuA7XWDZjlaZIs36r+HqVhErn66xq1VKFrQaeaFhEUJ4OEt52i92o62ZHd
         sk4I8p/x7RgeEgwGW1zzve9NKkaq8jViDKUsc/KAvOqnwlEsntRPYwCLIoO6jaXd6bvn
         uWmmwmkJGL9RodhaqKw7c4h/YieNvgr4fN/XyQskdXcRDzSirpoXHI0tlOpOiPZze2tk
         1wIT0t+2wqYeR6AFhLHFsSBfwlWmUzLQKTudhrYZ8fzG++IRR8RcEYJSQlQzRBp+nMi7
         8j0w==
X-Forwarded-Encrypted: i=1; AJvYcCU4G8fuRSrdyknhCK5WaEanO1qKmBFUsYi9HaGmz3JKHfgl5yzP8lE/1abajNDDuTEVN/X5He6NheIb4wGbIy5R@lists.infradead.org
X-Gm-Message-State: AOJu0YyAaamoKH+PNQ0fS1tx3nVw/QHN93TPfZonIo68hyfZ/0dxNwTy
	EwLeLT5C9s6+NFB+7wUT1xKK+Y0oamPy2PwAJzicg2G6LsBUGzi2BfS8TBgPVgN2ubVagTm5plo
	fRm0kEEXvZw2G1PgnJOqjAQ==
X-Google-Smtp-Source: AGHT+IHGzAbpz5Gck/2Rf7WgkWKxzSWHxb28Hylkb71d1eO6uNKmPJkkI+3L+zJwZvOSJQqcK2g9jZxrFbjtaCAz6g==
X-Received: from ilbeh24.prod.google.com ([2002:a05:6e02:4c18:b0:3d0:499b:8e3d])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:20c9:b0:3cf:cdb8:78fb with SMTP id e9e14a558f8ab-3d13df0fb5fmr49647775ab.16.1738980086868;
 Fri, 07 Feb 2025 18:01:26 -0800 (PST)
Date: Sat,  8 Feb 2025 02:01:11 +0000
In-Reply-To: <20250208020111.2068239-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250208020111.2068239-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250208020111.2068239-5-coltonlewis@google.com>
Subject: [RFC PATCH v2 4/4] KVM: arm64: Make guests see only counters they can access
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_180127_393372_5E2A3AED 
X-CRM114-Status: GOOD (  14.11  )
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

The ARM architecture specifies that when MDCR_EL2.HPMN is set, EL1 and
EL0, which includes KVM guests, should read that value for PMCR.N.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/debug.c                                  | 3 +--
 arch/arm64/kvm/pmu-emul.c                               | 8 +++++++-
 tools/testing/selftests/kvm/arm64/vpmu_counter_access.c | 2 +-
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index 0e4c805e7e89..7c04db00bf6c 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -36,8 +36,7 @@ static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
 	 * This also clears MDCR_EL2_E2PB_MASK and MDCR_EL2_E2TB_MASK
 	 * to disable guest access to the profiling and trace buffers
 	 */
-	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN,
-					 *host_data_ptr(nr_event_counters));
+	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN, read_mdcr());
 	vcpu->arch.mdcr_el2 |= (MDCR_EL2_TPM |
 				MDCR_EL2_TPMS |
 				MDCR_EL2_TTRF |
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 6c5950b9ceac..052ce8c721fe 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -993,12 +993,18 @@ static bool pmu_irq_is_valid(struct kvm *kvm, int irq)
 u8 kvm_arm_pmu_get_max_counters(struct kvm *kvm)
 {
 	struct arm_pmu *arm_pmu = kvm->arch.arm_pmu;
+	u8 limit;
+
+	if (arm_pmu->partitioned)
+		limit = arm_pmu->hpmn - 1;
+	else
+		limit = ARMV8_PMU_MAX_GENERAL_COUNTERS;
 
 	/*
 	 * The arm_pmu->cntr_mask considers the fixed counter(s) as well.
 	 * Ignore those and return only the general-purpose counters.
 	 */
-	return bitmap_weight(arm_pmu->cntr_mask, ARMV8_PMU_MAX_GENERAL_COUNTERS);
+	return bitmap_weight(arm_pmu->cntr_mask, limit);
 }
 
 static void kvm_arm_set_pmu(struct kvm *kvm, struct arm_pmu *arm_pmu)
diff --git a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
index f16b3b27e32e..b5bc18b7528d 100644
--- a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
+++ b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
@@ -609,7 +609,7 @@ static void run_pmregs_validity_test(uint64_t pmcr_n)
  */
 static void run_error_test(uint64_t pmcr_n)
 {
-	pr_debug("Error test with pmcr_n %lu (larger than the host)\n", pmcr_n);
+	pr_debug("Error test with pmcr_n %lu (larger than the host allows)\n", pmcr_n);
 
 	test_create_vpmu_vm_with_pmcr_n(pmcr_n, true);
 	destroy_vpmu_vm();
-- 
2.48.1.502.g6dc24dfdaf-goog


