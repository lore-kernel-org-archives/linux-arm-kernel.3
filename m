Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10252C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 22:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6vRk6zke2lpK9XGCO0Sj8vZO43QSodRcPYun9h3GVGY=; b=PG9VsBSSRKGf6X5jw6vWyV3hRi
	CxqrRonrKgPNOFbanYYbbeLYly6SyYvmgL+Rf2dT5qYrXhWDtu7h1ectwRTsa7Fa/1zual7IppNjr
	igt0TyjKkBxznE9vXNN7b4NfoR1tdzk4EGdNGYxUvJFnIuOZVd7Un5tH73r60jkZUxb7vtFwkW6WT
	FElpafjC4dyLxZe3kkd16qeBNu7jOCuFNvP3SyaZOeMWap85On+uFXqg29g5SBD1SxMVnKCOtwiUl
	aAPh2hIzBIT9f73WVXo4OQBUTjC9m4b5eNCgw03+zbXvM+7Rpd0ELYxpNX60tMGk4NDnsczSTdJWU
	7DWNCKvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSkX3-0000000GlQ9-170B;
	Fri, 20 Jun 2025 22:48:25 +0000
Received: from mail-io1-xd4a.google.com ([2607:f8b0:4864:20::d4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSk4R-0000000Gh6t-0vB0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 22:18:52 +0000
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-86463467dddso188109139f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 15:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750457930; x=1751062730; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6vRk6zke2lpK9XGCO0Sj8vZO43QSodRcPYun9h3GVGY=;
        b=h6Kfzrxmi2vICrPCkj8nSy3KIwmd6iVTzvkXhLybQwIuyVP58/5v7tVPIR4RCaGGD3
         9KEtvnvRDpt3WYMl1zElyIQG3rw0miqxQAxwNsREEtidJgWk1OmWXunkpQTsJUBew3b6
         lsffPjo2jpyPpJLVYTAvKyz4CynVYwLB84XqjvARme7dQ1fqB1DXIOPt7K/pJTgFcP1d
         DnaokGYVqDCY0UsKhGIfBAgJgY8sE4kh0FfX7zFhqYMbbGNTdVaoJMpEGuPw2XPjkYiW
         bE/EyiZ8GCaY7UQrvK12M4S2FXq3rjQQ/YWPhe+rbiEv3h2Z4PNg2IecqGtitYeg4SQd
         k3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750457930; x=1751062730;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6vRk6zke2lpK9XGCO0Sj8vZO43QSodRcPYun9h3GVGY=;
        b=SmRcowxnSskAY4D+4bwRDe3fW+2HRTuOxO1DOYPBxBbUS8APHXHR6lE6FUT9RAvT9X
         g8gF1LOlnU7l4JA+eV8JmmT/ln96RqEDnGhBFpd/dUzcSJduga8u22IG0QYMUgGtRj2J
         dPUqQGyZVxsnJ6FYQHqTneWe+jkMqbfcZzfPQY/7U+iHceS+maJesJS64Yt2Y69KL3th
         Uo5M4FfrUyi/3dJDIuu9ydJNmvaTXk+rPt6v1IW3fcL0tWAMyR+o/kEq/11ukBX7CWuz
         bb4ZBGdEpCj9hHukulCBhFp0qgxHqrVVOOrM/vKEep4RTvaRtWaoE/psNjYB9cFOYY95
         HcDA==
X-Forwarded-Encrypted: i=1; AJvYcCWskczCKJQTkOocwgV6C5XqARa7frMko5a/hy/wbBWFynEreyZHncQHsXFUyMHIFwfYn+END94GdvYFLaPTb4jy@lists.infradead.org
X-Gm-Message-State: AOJu0YywFVwTYunmLR68eABswbpYpBw3MVkEpss6cRCAqZougwFLvpOP
	4z9PQUjSEoRB1Mdx+Ld2jyk2KmFTfITzNUQdHx+wt2NuNRbnlvIoxrTdAxn3gDfYJFVM2DRC334
	JnHRvB+D2eus1NjgzhXT7F3vtAA==
X-Google-Smtp-Source: AGHT+IEkoSb5VH84QY4nbT8Ifa51AqeoGsCAL340Tv3oIBa14LiCdgJYJOfuore5wja+yy1LW8r/DPYGzutAdJdswQ==
X-Received: from ilbbb11.prod.google.com ([2002:a05:6e02:b:b0:3de:11fe:800c])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:17c7:b0:3de:287b:c430 with SMTP id e9e14a558f8ab-3de38c1ba23mr58907475ab.3.1750457929911;
 Fri, 20 Jun 2025 15:18:49 -0700 (PDT)
Date: Fri, 20 Jun 2025 22:13:13 +0000
In-Reply-To: <20250620221326.1261128-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250620221326.1261128-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250620221326.1261128-14-coltonlewis@google.com>
Subject: [PATCH v2 12/23] KVM: arm64: Writethrough trapped PMEVTYPER register
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_151851_259283_7B7CDD63 
X-CRM114-Status: GOOD (  14.04  )
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
 arch/arm64/kvm/sys_regs.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index eaff6d63ef77..3733e3ce8f39 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -18,6 +18,7 @@
 #include <linux/printk.h>
 #include <linux/uaccess.h>
 #include <linux/irqchip/arm-gic-v3.h>
+#include <linux/perf/arm_pmu.h>
 #include <linux/perf/arm_pmuv3.h>
 
 #include <asm/arm_pmuv3.h>
@@ -943,6 +944,7 @@ static bool pmu_counter_idx_valid(struct kvm_vcpu *vcpu, u64 idx)
 	u64 pmcr, val;
 
 	pmcr = kvm_vcpu_read_pmcr(vcpu);
+
 	val = FIELD_GET(ARMV8_PMU_PMCR_N, pmcr);
 	if (idx >= val && idx != ARMV8_PMU_CYCLE_IDX) {
 		kvm_inject_undefined(vcpu);
@@ -1037,6 +1039,30 @@ static bool access_pmu_evcntr(struct kvm_vcpu *vcpu,
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
+	__vcpu_sys_reg(vcpu, reg) = eventsel;
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
@@ -1063,7 +1089,9 @@ static bool access_pmu_evtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
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
2.50.0.714.g196bf9f422-goog


