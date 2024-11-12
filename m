Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33EC4D32D96
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 11:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5PUUdanfV8/dMTaROo3OjL1mScK+2ashhKsQ/yXMrNE=; b=EO6wQhR4ffs3qh0HTaojvaLc9A
	QoQapqle2zavUW2LLgoy/LkRKXOfH78inaHSTi23T1eKnQLg7jWuMdWCc/Xyj+/nDo5xA22F6+HKS
	hPwZF6RG3vUy/iyoEMFrpauJ/S743BsAksTh94yqYN2+VfSpJAFTlKRsLGthkdchc7TmROQbj+q0t
	oTWgxjgMAf95AK+EuR218FgwTinZyFfZpU9UxZtXgrIfPDjar6xzmmykmJTJsgqt90EOJDrK2NH5P
	QSZebWz88XK2s+CQrWp8qmH0Peyg4ohkXrURf7GEwA5nkrqOSMD2QsiMOPxNHCYjb9AAF1XrDG8th
	ISdzQpeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAp9X-00000003Eyy-46r1;
	Tue, 12 Nov 2024 11:33:47 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoI9-000000034pg-152E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 10:38:38 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43159c9f617so43185705e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 02:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731407915; x=1732012715; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PUUdanfV8/dMTaROo3OjL1mScK+2ashhKsQ/yXMrNE=;
        b=eUR/YeNMWQwvCyDntFrDa2ohHfX87YWCCvenDxaJB5MAkEOMcvyzAUv1ezKzvqkRH/
         iNNPyaioEi9k2gGKSGlm31UT9v6xofjglWFIS2JF7z5/WQNnvtPCdOPKdnDb62mEVBQ2
         zupKV4vNCUWuLv7VnVocOEw5fGggNCiEk9X8VJsBWDwaw9avyoOJB5v98lfTeEPjKPE/
         ppZlCXkxyZn2uHcl0IAEsj4FMfgRHUl9vby3fFSnTn5QkWFfctUnZogEKAgV+WbV75wN
         ZhQOId/HOYds5L+mN/tyYdQck49vrhz4suSjp1eSg+UXC5XDsmc15sbnOIHRlVDZXfTx
         PQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731407915; x=1732012715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5PUUdanfV8/dMTaROo3OjL1mScK+2ashhKsQ/yXMrNE=;
        b=Thk5lVd/lL7f+0nQO2l3BNUWOpHDIDkTFSD4QkRwNztBhC5ZacluCIWUxbUeqUKN78
         PAdiISLcOR+UNtnAf7HFvvXdhP+YKO4adXay4//89fdkjbHsEfL6GMlJ7g9s4B8Z2nI8
         5jNyRJKA7ApItImLp8928zu5eJHWOjtFYSf1L+ZdGEqWiqzpQX5sHWi27N0G3erBP62o
         5PBI1Ac4dbH56RA64hX95mHqkOe/gMJwtnyyb3aAToBRJCyHGrmeEibbGjsSqGxOxB8m
         Uz9jV5fjZ3sfzCq4hYQd7fr/Of6QiTXKa4OKiuRpoaFeHVeyKADUMbqm+e4Xx4Ra1BKA
         VUBg==
X-Forwarded-Encrypted: i=1; AJvYcCV9gX9vJxagoL1zzrmvzbJJ7Rz2tZ13BFifncqM+JvJ17s2YawxFXCTSCbbciFHLmci6czFJHmZkCDAwDSVCVjB@lists.infradead.org
X-Gm-Message-State: AOJu0YzO09vp686hBimaA+lZPggCZJXQVlNy0ikZx5Qp/Xwp1/m70MWS
	m+TcOHUhaXw6mi/b6AlzptZsN5Wx54prgcDTvvi2ioooP0MRqTn8KuNLF2f3GGg=
X-Google-Smtp-Source: AGHT+IGRUXiwIphPDLp8SPINsrbnyjqSeYnthdnyXbEy6DX7IRif2HAVNDMi2ra2ERahPrHHXoqCRw==
X-Received: by 2002:a05:600c:35d5:b0:431:547e:81d0 with SMTP id 5b1f17b1804b1-432b7503749mr126843845e9.11.1731407915453;
        Tue, 12 Nov 2024 02:38:35 -0800 (PST)
Received: from pop-os.. ([145.224.90.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432bbf436ffsm142270955e9.44.2024.11.12.02.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 02:38:34 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: suzuki.poulose@arm.com,
	oliver.upton@linux.dev,
	coresight@lists.linaro.org,
	kvmarm@lists.linux.dev
Cc: James Clark <james.clark@linaro.org>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Shiqi Liu <shiqiliu@hust.edu.cn>,
	Fuad Tabba <tabba@google.com>,
	James Morse <james.morse@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 08/12] KVM: arm64: Don't hit sysregs to see if SPE is enabled or not
Date: Tue, 12 Nov 2024 10:37:07 +0000
Message-Id: <20241112103717.589952-9-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112103717.589952-1-james.clark@linaro.org>
References: <20241112103717.589952-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_023837_320363_D168BA94 
X-CRM114-Status: GOOD (  22.96  )
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

Now that the driver tells us whether SPE was used or not we can use
that. Except in pKVM where the host isn't trusted we keep the existing
feature + sysreg check.

The unconditional zeroing of pmscr_el1 if nothing is saved can also be
dropped. Zeroing it after the restore has the same effect, but only
incurs the write if it was actually enabled.

Now in the normal nVHE case, SPE saving is gated by a single flag read
on kvm_host_data.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/include/asm/kvm_hyp.h   |  2 +-
 arch/arm64/kvm/hyp/nvhe/debug-sr.c | 52 ++++++++++++++++++------------
 arch/arm64/kvm/hyp/nvhe/switch.c   |  2 +-
 3 files changed, 34 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_hyp.h b/arch/arm64/include/asm/kvm_hyp.h
index c838309e4ec4..4039a42ca62a 100644
--- a/arch/arm64/include/asm/kvm_hyp.h
+++ b/arch/arm64/include/asm/kvm_hyp.h
@@ -105,7 +105,7 @@ void __debug_switch_to_guest(struct kvm_vcpu *vcpu);
 void __debug_switch_to_host(struct kvm_vcpu *vcpu);
 
 #ifdef __KVM_NVHE_HYPERVISOR__
-void __debug_save_host_buffers_nvhe(struct kvm_vcpu *vcpu);
+void __debug_save_host_buffers_nvhe(void);
 void __debug_restore_host_buffers_nvhe(struct kvm_vcpu *vcpu);
 #endif
 
diff --git a/arch/arm64/kvm/hyp/nvhe/debug-sr.c b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
index 89f44a51a172..578c549af3c6 100644
--- a/arch/arm64/kvm/hyp/nvhe/debug-sr.c
+++ b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
@@ -14,24 +14,23 @@
 #include <asm/kvm_hyp.h>
 #include <asm/kvm_mmu.h>
 
-static void __debug_save_spe(u64 *pmscr_el1)
+static bool __debug_spe_enabled(void)
 {
-	u64 reg;
-
-	/* Clear pmscr in case of early return */
-	*pmscr_el1 = 0;
-
 	/*
-	 * At this point, we know that this CPU implements
-	 * SPE and is available to the host.
-	 * Check if the host is actually using it ?
+	 * Check if the host is actually using SPE. In pKVM read the state,
+	 * otherwise just trust that the host told us it was being used.
 	 */
-	reg = read_sysreg_s(SYS_PMBLIMITR_EL1);
-	if (!(reg & BIT(PMBLIMITR_EL1_E_SHIFT)))
-		return;
+	if (unlikely(is_protected_kvm_enabled()))
+		return host_data_get_flag(HOST_FEAT_HAS_SPE) &&
+		       (read_sysreg_s(SYS_PMBLIMITR_EL1) & PMBLIMITR_EL1_E);
+	else
+		return host_data_get_flag(HOST_STATE_SPE_EN);
+}
 
-	/* Yes; save the control register and disable data generation */
-	*pmscr_el1 = read_sysreg_el1(SYS_PMSCR);
+static void __debug_save_spe(void)
+{
+	/* Save the control register and disable data generation */
+	*host_data_ptr(host_debug_state.pmscr_el1) = read_sysreg_el1(SYS_PMSCR);
 	write_sysreg_el1(0, SYS_PMSCR);
 	isb();
 
@@ -39,8 +38,14 @@ static void __debug_save_spe(u64 *pmscr_el1)
 	psb_csync();
 }
 
-static void __debug_restore_spe(u64 pmscr_el1)
+static void __debug_restore_spe(void)
 {
+	u64 pmscr_el1 = *host_data_ptr(host_debug_state.pmscr_el1);
+
+	/*
+	 * PMSCR was set to 0 to disable so if it's already 0, no restore is
+	 * necessary.
+	 */
 	if (!pmscr_el1)
 		return;
 
@@ -49,6 +54,13 @@ static void __debug_restore_spe(u64 pmscr_el1)
 
 	/* Re-enable data generation */
 	write_sysreg_el1(pmscr_el1, SYS_PMSCR);
+
+	/*
+	 * Disable future restores until a non zero value is saved again. Since
+	 * this is called unconditionally on exit, future register writes are
+	 * skipped until they are needed again.
+	 */
+	*host_data_ptr(host_debug_state.pmscr_el1) = 0;
 }
 
 static void __debug_save_trace(u64 *trfcr_el1)
@@ -79,11 +91,12 @@ static void __debug_restore_trace(u64 trfcr_el1)
 	write_sysreg_el1(trfcr_el1, SYS_TRFCR);
 }
 
-void __debug_save_host_buffers_nvhe(struct kvm_vcpu *vcpu)
+void __debug_save_host_buffers_nvhe(void)
 {
 	/* Disable and flush SPE data generation */
-	if (host_data_get_flag(HOST_FEAT_HAS_SPE))
-		__debug_save_spe(host_data_ptr(host_debug_state.pmscr_el1));
+	if (__debug_spe_enabled())
+		__debug_save_spe();
+
 	/* Disable and flush Self-Hosted Trace generation */
 	if (host_data_get_flag(HOST_FEAT_HAS_TRBE))
 		__debug_save_trace(host_data_ptr(host_debug_state.trfcr_el1));
@@ -96,8 +109,7 @@ void __debug_switch_to_guest(struct kvm_vcpu *vcpu)
 
 void __debug_restore_host_buffers_nvhe(struct kvm_vcpu *vcpu)
 {
-	if (host_data_get_flag(HOST_FEAT_HAS_SPE))
-		__debug_restore_spe(*host_data_ptr(host_debug_state.pmscr_el1));
+	__debug_restore_spe();
 	if (host_data_get_flag(HOST_FEAT_HAS_TRBE))
 		__debug_restore_trace(*host_data_ptr(host_debug_state.trfcr_el1));
 }
diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index cc69106734ca..edd657797463 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -300,7 +300,7 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
 	 * translation regime to EL2 (via MDCR_EL2_E2PB == 0) and
 	 * before we load guest Stage1.
 	 */
-	__debug_save_host_buffers_nvhe(vcpu);
+	__debug_save_host_buffers_nvhe();
 
 	/*
 	 * We're about to restore some new MMU state. Make sure
-- 
2.34.1


