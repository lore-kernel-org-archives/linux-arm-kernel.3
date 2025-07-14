Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FB4C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 23:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ssu6XVTznYXQ2t7039xq5/RphL9Rc3QnEHfinMHeLm8=; b=vvE1PHygUQW9PMPKgMWGzddTjr
	1m5JXyLH4bRz97Jw7wkSCkNfvBApOxBgWssCFZSk+XWhkiWQGfNA1OgzXBm23G8YyxeXFN/6bu4Ng
	ddinA8H31ruVCqhN+JrxDYcr+6mQm9lyXMTiBRCKEkRNdEQgMXRwglqIm+P5Eu7NkCDd9KZR6yUWH
	KBStUfoEicRlewQKXhAB8xHqdKYdS31NPaUU6RIYtY6c4zhsakq3CCofdqCKREDbg4N/Zzy+9gXHk
	lNy0tOycINSjQLRwfZN2PaVnrUtFiE9rDT0S+On596eoDVV1J148Bs27g7NL8pkmycNfcFsxwQjaR
	ezsZbkOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubT0h-00000003aG3-3iMD;
	Mon, 14 Jul 2025 23:55:03 +0000
Received: from mail-io1-xd4a.google.com ([2607:f8b0:4864:20::d4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubS9I-00000003Sc6-443j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 22:59:54 +0000
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-876afa8b530so534980639f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 15:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752533992; x=1753138792; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ssu6XVTznYXQ2t7039xq5/RphL9Rc3QnEHfinMHeLm8=;
        b=LYzU5UDCIX4Hg5+wF3HGR9fDXK90QlwkjZUhYmlMxhGiLCnL+UT3vPa/qbMNGT7U4t
         uwHVnW7niblwdsV1MBC/1fNbK9R6kVgr903x9Rc+3GA85CUazXL7TwwUVOwqDNDnmgmb
         sTtoNbG7FJ81CY1a4FRwvWX2Qz6K9ImO5O8XlTRPyAQxebTFaJWosGsNeLnENfPstFNL
         pwtJ0jQ3wc31fnb+muQycG8OqNG9mzM8DhnN1lkS6Gzd3kdDn1z4Z4cL8qKTwtzC9bwz
         EmdeAQabczsmv3NYAfYNFKErVDc7ottvAQjuwsVIqrEZOsJcxwPR7WEj/x81jqq0eNh5
         TfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752533992; x=1753138792;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ssu6XVTznYXQ2t7039xq5/RphL9Rc3QnEHfinMHeLm8=;
        b=hGir+Jw8NMuA03ix2TJLmc1jL/RUQv6rEkW5icenSNXB/unoaH6cjWCEqlbu881kj+
         pt/8B1Y/6nUTh0YPHoTgNmFEMUp85hVSpC/Ke7nnfWtbm+mG9YAuCJt84izT353zyNCx
         hObx9RZTkX3ikFTAF0rbk2LSp1+Ahi3vesU4gQFlr6ORM+qtxiJFwiuZ+t9UD0MnRQzK
         JmxK5+32wchUW/jivZEesi/9KdTzyCHIe67gWtcoeuEgn9wkqVzqygD2nRguz6gdCpis
         THqIKwAzo5saKRDR5/zYU/D0VEmd73aNtYJNlk5muMmqsgh30qXv5joFb7AkZKh58a36
         Uvsw==
X-Forwarded-Encrypted: i=1; AJvYcCVStDLl2AXzdXKPE3LrwlNCjRE2HAi5H0O/wxEnWYkHj8byryGBdW881pkZlYcpL1OtGNOsv5hzBF5ouSBnJwCK@lists.infradead.org
X-Gm-Message-State: AOJu0YzOuZcyzWmHZiZGsbATqtp2YxMaQFBwKejP0bAEQ8pk541UCa5u
	FYaH2dY/ZwVSRmbG0efZrILtdMWAN93nsOT9/uFA5EbEKR4w8suu7bPQIc7WMAI7zJdkB9Ww4yu
	PLL2Xzyus6uKO94uVzDBM14+oRA==
X-Google-Smtp-Source: AGHT+IGDw6Aiqn+peGv14I4uiw/UfAz/LnaAwVzpsB+zhVreBKr6TdqJGcvfwIs5Vp6INunAGafxrdf30hBME2OE7w==
X-Received: from iobbk15.prod.google.com ([2002:a05:6602:400f:b0:879:8855:695f])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6602:4019:b0:876:7876:a587 with SMTP id ca18e2360f4ac-87977e98946mr1665405839f.0.1752533992118;
 Mon, 14 Jul 2025 15:59:52 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:59:15 +0000
In-Reply-To: <20250714225917.1396543-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250714225917.1396543-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250714225917.1396543-22-coltonlewis@google.com>
Subject: [PATCH v4 21/23] KVM: arm64: Inject recorded guest interrupts
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
X-CRM114-CacheID: sfid-20250714_155953_011210_DA4E3FBB 
X-CRM114-Status: GOOD (  16.24  )
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

When we re-enter the VM after handling a PMU interrupt, calculate
whether it was any of the guest counters that overflowed and inject an
interrupt into the guest if so.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/kvm_pmu.h |  2 ++
 arch/arm64/kvm/pmu-direct.c      | 22 +++++++++++++++++++++-
 arch/arm64/kvm/pmu-emul.c        |  4 ++--
 arch/arm64/kvm/pmu.c             |  6 +++++-
 4 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pmu.h b/arch/arm64/include/asm/kvm_pmu.h
index 6149eb051ff9..908e43416b50 100644
--- a/arch/arm64/include/asm/kvm_pmu.h
+++ b/arch/arm64/include/asm/kvm_pmu.h
@@ -87,6 +87,8 @@ bool pmu_access_el0_disabled(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_resync_el0(void);
+bool kvm_pmu_emul_overflow_status(struct kvm_vcpu *vcpu);
+bool kvm_pmu_part_overflow_status(struct kvm_vcpu *vcpu);
 
 #define kvm_vcpu_has_pmu(vcpu)					\
 	(vcpu_has_feature(vcpu, KVM_ARM_VCPU_PMU_V3))
diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 3f9e0d4a74e1..80a3eb89fca1 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -280,7 +280,7 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu)
 	write_pmcr(val);
 
 	/*
-	 * Loading these registers is tricky because of
+	 * Loading these registers is more intricate because of
 	 * 1. Applying only the bits for guest counters (indicated by mask)
 	 * 2. Setting and clearing are different registers
 	 */
@@ -356,3 +356,23 @@ void kvm_pmu_handle_guest_irq(u64 govf)
 
 	__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, |=, govf);
 }
+
+/**
+ * kvm_pmu_part_overflow_status() - Determine if any guest counters have overflowed
+ * @vcpu: Ponter to struct kvm_vcpu
+ *
+ * Determine if any guest counters have overflowed and therefore an
+ * IRQ needs to be injected into the guest.
+ *
+ * Return: True if there was an overflow, false otherwise
+ */
+bool kvm_pmu_part_overflow_status(struct kvm_vcpu *vcpu)
+{
+	struct arm_pmu *pmu = vcpu->kvm->arch.arm_pmu;
+	u64 mask = kvm_pmu_guest_counter_mask(pmu);
+	u64 pmovs = __vcpu_sys_reg(vcpu, PMOVSSET_EL0);
+	u64 pmint = read_pmintenset();
+	u64 pmcr = read_pmcr();
+
+	return (pmcr & ARMV8_PMU_PMCR_E) && (mask & pmovs & pmint);
+}
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index bcaa9f7a8ca2..6f41fc3e3f74 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -268,7 +268,7 @@ void kvm_pmu_reprogram_counter_mask(struct kvm_vcpu *vcpu, u64 val)
  * counter where the values of the global enable control, PMOVSSET_EL0[n], and
  * PMINTENSET_EL1[n] are all 1.
  */
-bool kvm_pmu_overflow_status(struct kvm_vcpu *vcpu)
+bool kvm_pmu_emul_overflow_status(struct kvm_vcpu *vcpu)
 {
 	u64 reg = __vcpu_sys_reg(vcpu, PMOVSSET_EL0);
 
@@ -405,7 +405,7 @@ static void kvm_pmu_perf_overflow(struct perf_event *perf_event,
 		kvm_pmu_counter_increment(vcpu, BIT(idx + 1),
 					  ARMV8_PMUV3_PERFCTR_CHAIN);
 
-	if (kvm_pmu_overflow_status(vcpu)) {
+	if (kvm_pmu_emul_overflow_status(vcpu)) {
 		kvm_make_request(KVM_REQ_IRQ_PENDING, vcpu);
 
 		if (!in_nmi())
diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index db11a3e9c4b7..d837cb8fef68 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -407,7 +407,11 @@ static void kvm_pmu_update_state(struct kvm_vcpu *vcpu)
 	struct kvm_pmu *pmu = &vcpu->arch.pmu;
 	bool overflow;
 
-	overflow = kvm_pmu_overflow_status(vcpu);
+	if (kvm_vcpu_pmu_is_partitioned(vcpu))
+		overflow = kvm_pmu_part_overflow_status(vcpu);
+	else
+		overflow = kvm_pmu_emul_overflow_status(vcpu);
+
 	if (pmu->irq_level == overflow)
 		return;
 
-- 
2.50.0.727.gbf7dc18ff4-goog


