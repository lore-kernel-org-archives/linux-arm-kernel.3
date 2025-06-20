Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9270C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 22:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1gZPdqHIaC5N89cxtk14Y15WeUbkAXiFR8OakDw0fW4=; b=2MoBs4h8YQ377foAWnFOec44vt
	v/UEhyu1HL5yqT+GyE5QgOwgp4l0mm2MOKdXNAf3UKOA+x+d2oODmU2K0V3spiPvEZ7HMy1kAcuUQ
	iRlmEcze2N6EUtAVhkIa1b1hYCB16F/bd49RyHeZpAiqYB3KjFDD2IjQU0oFs2S3WPNk62y38XuRo
	eyO+6NVNVnyGU9LI+kSCoDuO3WGbc/WhMoJ1k5Xh4d2gdMXxwI4RpVu1b8yGFBIfwR9K//ddeNjRR
	RaIliWqCs+JVfaXUabqi4+Hp+GeX9FyVv2yZqlWDHiUlXBLx+BTKQsNbL/71K0rAkiQ9u24DMYVCO
	YIIPwx4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSkZF-0000000GlZN-44RD;
	Fri, 20 Jun 2025 22:50:41 +0000
Received: from mail-io1-xd49.google.com ([2607:f8b0:4864:20::d49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSk4S-0000000Gh7e-0XbV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 22:18:53 +0000
Received: by mail-io1-xd49.google.com with SMTP id ca18e2360f4ac-86d07ccc9ecso180714439f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 15:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750457931; x=1751062731; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1gZPdqHIaC5N89cxtk14Y15WeUbkAXiFR8OakDw0fW4=;
        b=rxYG4SR6WQbZMK9c3NoUvc4e3LDbRNdzzvNx86L0Zi3rS0DuODfCf9GnwUVGJg6KR7
         UxG+5xQmnS7wc12q/C9b0HIPqvUCHEkMdr0N/W3pKtCF8woqtejGwRwqLTMsWtGZHPPB
         hKHqVMz1xFh2VY87xlwsmHkExMy1XhZTrVy+OjvaA4jcl0oc0MelgLRxfw6UShe5LhDw
         OJ+iI3wzeZIYitzwOg84qFWpuGOCfkJxoc3Q6OPOdKeSlWteSeoTkb0eX1pbC+1VRN2K
         7EjSgDZDLCv6RNk9frs+gqGDlH+1z78Cyd78nPUucyKz/rIVyu165eAYTFRSLBlep/Q9
         ypXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750457931; x=1751062731;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1gZPdqHIaC5N89cxtk14Y15WeUbkAXiFR8OakDw0fW4=;
        b=Rb0TGCWp79FqG6lGY4zdh8yt0Qx41Z/7khtJ7hHRB7tKk55i4VeDB0Atu0rgNXeFI9
         criQ9UZkBgIHC+lqG9rkdjJFK45gTb2ea+nuD6yRmHfo6GNRw9pZK4vqSKUF4I9Unszz
         Hp5+7iLtAE/nMzzBDtwZdORhIdJG6NAqOlANrlCQ+6gPyyk5kiiMqOKTcViCx8PGr5Jw
         buBCxu62N///k+6YbYHWay0p6j0IuzTTWguh8GvNC4yBXjgAuOR9YFBo1rz08gCHcCIu
         Fin3XnIft5VoUtFIwn8yokO1sMOMombbf+6LsnWz8yVfME6tY8UU6MyAhqujl0h9kLTI
         6VAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXI1+qGDZRSfCu9UXLZL/nnkeBY8NG5q1lcymJNRmMjges4bA6MgosZMRh0RwzklCHR9et6nqZLkzP+3eFsD1EF@lists.infradead.org
X-Gm-Message-State: AOJu0YxcO64Epqvy9iKKCBMAuIVTO4lY43BI1sIgq7aqbOgOnBx/NvsN
	/oFBdRQVvlfTnx5oBbI2g3pU05Oxpzz+g1bNF1Ta04XJKly5uBa0wJt4bdoeQJxrk+wrJRC8BzK
	eZrrFn0Xj7u8ba91twqyXBcfgWw==
X-Google-Smtp-Source: AGHT+IGjv4MwAm4QLbkXWrYC7rAHKw9/iUlbnKxWWkdEwdxKvGAPykFMMacviS9dcIIIxXL7XUy6syolfW7Tyi7fWg==
X-Received: from ilbbd7.prod.google.com ([2002:a05:6e02:3007:b0:3dd:b63a:d0bb])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:3801:b0:3dd:b655:2d6a with SMTP id e9e14a558f8ab-3de38c245c5mr47355195ab.7.1750457931036;
 Fri, 20 Jun 2025 15:18:51 -0700 (PDT)
Date: Fri, 20 Jun 2025 22:13:14 +0000
In-Reply-To: <20250620221326.1261128-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250620221326.1261128-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250620221326.1261128-15-coltonlewis@google.com>
Subject: [PATCH v2 13/23] KVM: arm64: Use physical PMSELR for PMXEVTYPER if partitioned
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
X-CRM114-CacheID: sfid-20250620_151852_165197_E7DE01E3 
X-CRM114-Status: GOOD (  13.27  )
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

Because PMXEVTYPER is trapped and PMSELR is not, it is not appropriate
to use the virtual PMSELR register when it could be outdated and lead
to an invalid write. Use the physical register.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/arm_pmuv3.h | 7 ++++++-
 arch/arm64/kvm/sys_regs.c          | 9 +++++++--
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
index e2057365ba73..1880e426a559 100644
--- a/arch/arm64/include/asm/arm_pmuv3.h
+++ b/arch/arm64/include/asm/arm_pmuv3.h
@@ -72,11 +72,16 @@ static inline u64 read_pmcr(void)
 	return read_sysreg(pmcr_el0);
 }
 
-static inline void write_pmselr(u32 val)
+static inline void write_pmselr(u64 val)
 {
 	write_sysreg(val, pmselr_el0);
 }
 
+static inline u64 read_pmselr(void)
+{
+	return read_sysreg(pmselr_el0);
+}
+
 static inline void write_pmccntr(u64 val)
 {
 	write_sysreg(val, pmccntr_el0);
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 3733e3ce8f39..3140d90849c1 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1066,14 +1066,19 @@ static bool writethrough_pmevtyper(struct kvm_vcpu *vcpu, struct sys_reg_params
 static bool access_pmu_evtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 			       const struct sys_reg_desc *r)
 {
-	u64 idx, reg;
+	u64 idx, reg, pmselr;
 
 	if (pmu_access_el0_disabled(vcpu))
 		return false;
 
 	if (r->CRn == 9 && r->CRm == 13 && r->Op2 == 1) {
 		/* PMXEVTYPER_EL0 */
-		idx = SYS_FIELD_GET(PMSELR_EL0, SEL, __vcpu_sys_reg(vcpu, PMSELR_EL0));
+		if (kvm_vcpu_pmu_is_partitioned(vcpu))
+			pmselr = read_pmselr();
+		else
+			pmselr = __vcpu_sys_reg(vcpu, PMSELR_EL0);
+
+		idx = SYS_FIELD_GET(PMSELR_EL0, SEL, pmselr);
 		reg = PMEVTYPER0_EL0 + idx;
 	} else if (r->CRn == 14 && (r->CRm & 12) == 12) {
 		idx = ((r->CRm & 3) << 3) | (r->Op2 & 7);
-- 
2.50.0.714.g196bf9f422-goog


