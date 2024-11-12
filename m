Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA722D32D96
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 11:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hTXqo//8eCQsBk4kbAKUkYayo6ux0h+eu3YzsPig2os=; b=fLX+IwKh3XJQbZ0+IkjjoFKeqi
	Ih73Q0qQcU81ln8rRLAmPcJhS96s1U1Iv2OThyWZugu7Tc9AdUsVPeDcLB2QJm5Q8gseHwg3s2fpI
	z7XaLdCGX1jDTCpDzsIufHuW/kjfxHFINC80+EbqHeLBR3fswWxMzv2PF75gTDcHLq0JMyaYm958O
	RNVhpAAQYO3rZZVRSOuCjvLJIGW958XI9FNPezz+oVNln0/3j5AjN/IaMkghKAb3lGdCWz9NOsKSl
	dRv0coDYAoJ+QeYYfyVET2ixGlbJdiz6J4/jWwC4VCZJ2UdCy/qQzVJFMt/uSb5bb1OUj27oSPi7g
	xVnW9NMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tApEq-00000003Ftz-32Qk;
	Tue, 12 Nov 2024 11:39:16 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoIZ-000000034u5-3on4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 10:39:05 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-37d47eff9acso3341283f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 02:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731407942; x=1732012742; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTXqo//8eCQsBk4kbAKUkYayo6ux0h+eu3YzsPig2os=;
        b=bfj4cLh9QBtAxWWhQenJrKlhGHQFaV42P6pzP+1kPFkZlEcVJvtvuEkWHaibVIUGFP
         u4nKVjdqi8hw/En2ZuCVqNKu4Rzu1/cziuFXMbfEF4S4YoVuJT+ZGu5xvwYeblqIR/Gg
         ZmlIeP4pNSFVJW9V13eWyN4AbTpDOrCd6VuzwPRKIQs6ZQi6DqTdl5rjroJx05xchEsA
         kDZMJcrPSucmKMYVLGrcAGcsbH/vKmi/cXIH8XenDjWlgTpTu57RZgn3OdTKc03qvRCN
         SN8LvTuVNrN9f1vBsEebSRM0/68Hx2ZBc3z8Crx8yiySlutPNmNeiRvaGwH1oHc7ML/4
         U42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731407942; x=1732012742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hTXqo//8eCQsBk4kbAKUkYayo6ux0h+eu3YzsPig2os=;
        b=Hdcw9Gf7rhfTmvfDAeQRMIyvSLrXLVIvvoTpHaBf3T8LljuPGycuZICK+6MnvDApKC
         Xn9KM19hy/btygeFmvIxs6Mw3wXL2PpXvJhbNXNuh/swcYc1zncR3zo07R2Vri6sC9Hu
         gpScbS0K9zZGDt1Y6KiIDvjehBi4cj0N+ZHo2I8PwOgmvoxeiBeYNOVGqyrnPO68SqcZ
         yNtH+o8UR3rNv/7Wbr1S1sc6ePrFEAZZDrhuI3a+EEn5+TlBityaGa8ZnTv78cyLeVjo
         Gsw4kr57HKJjiiVXua2oL78qqC2qZcmQeeXHvVRQA9M8G6noMHAdd1uBnSWrgXFkT/np
         PjAw==
X-Forwarded-Encrypted: i=1; AJvYcCX1bmRUa5uG2/hAKM921VgRfSrD6d3ded5AI56lv7DQheDjBgd08iNHU3w4A/ELofciRH0Ivgj2PyEPnJlt5Ntg@lists.infradead.org
X-Gm-Message-State: AOJu0YzTZtRxIGCDnrT5BcVY3E7J23cSiZQjU4WytOVlDkBcZzuIHUh8
	0EHsFJYimXO9BvsLUxeyzPNgF7sNK8z6gmT/tmhNdCkvqKBp0BsGBG7UwyTPtVE=
X-Google-Smtp-Source: AGHT+IFyMdF9zAJjuyhAjQDTA00d8BetxuafJaMqAy1S8MkOFS5uQVVLGbU/acSR5z7cyBVpLtP1iA==
X-Received: by 2002:a5d:5f42:0:b0:37d:4436:4505 with SMTP id ffacd0b85a97d-381f186ccdemr13405089f8f.32.1731407942122;
        Tue, 12 Nov 2024 02:39:02 -0800 (PST)
Received: from pop-os.. ([145.224.90.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432bbf436ffsm142270955e9.44.2024.11.12.02.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 02:39:01 -0800 (PST)
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
Subject: [PATCH v7 11/12] KVM: arm64: Swap TRFCR on guest switch
Date: Tue, 12 Nov 2024 10:37:10 +0000
Message-Id: <20241112103717.589952-12-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112103717.589952-1-james.clark@linaro.org>
References: <20241112103717.589952-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_023903_979852_5294E488 
X-CRM114-Status: GOOD (  17.45  )
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

This implements exclude/include guest rules of the active tracing
session. Only do it if a different value is required for the guest,
otherwise the filters remain untouched.

In VHE we can just directly write the value.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/include/asm/kvm_host.h  |  4 ++++
 arch/arm64/kvm/debug.c             | 16 ++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/debug-sr.c | 17 +++++++++++++++--
 3 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index a8846689512b..9109d10c656e 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -949,6 +949,8 @@ struct kvm_vcpu_arch {
 #define HOST_STATE_TRBE_EN	__kvm_single_flag(state, BIT(1))
 /* Hyp modified TRFCR */
 #define HOST_STATE_RESTORE_TRFCR __kvm_single_flag(state, BIT(2))
+/* Host wants a different trace filters for the guest */
+#define HOST_STATE_SWAP_TRFCR	__kvm_single_flag(state, BIT(3))
 
 /* Pointer to the vcpu's SVE FFR for sve_{save,load}_state() */
 #define vcpu_sve_pffr(vcpu) (kern_hyp_va((vcpu)->arch.sve_state) +	\
@@ -1392,6 +1394,7 @@ void kvm_clr_pmu_events(u64 clr);
 bool kvm_set_pmuserenr(u64 val);
 void kvm_set_pmblimitr(u64 pmblimitr);
 void kvm_set_trblimitr(u64 trblimitr);
+void kvm_set_trfcr(u64 host_trfcr, u64 guest_trfcr);
 #else
 static inline void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr) {}
 static inline void kvm_clr_pmu_events(u64 clr) {}
@@ -1401,6 +1404,7 @@ static inline bool kvm_set_pmuserenr(u64 val)
 }
 static inline void kvm_set_pmblimitr(u64 pmblimitr) {}
 static inline void kvm_set_trblimitr(u64 trblimitr) {}
+static inline void kvm_set_trfcr(u64 host_trfcr, u64 guest_trfcr) {}
 #endif
 
 void kvm_vcpu_load_vhe(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index e99df2c3f62a..9acec1b67d5f 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -380,3 +380,19 @@ void kvm_set_trblimitr(u64 trblimitr)
 		host_data_clear_flag(HOST_STATE_TRBE_EN);
 }
 EXPORT_SYMBOL_GPL(kvm_set_trblimitr);
+
+void kvm_set_trfcr(u64 host_trfcr, u64 guest_trfcr)
+{
+	if (kvm_arm_skip_trace_state())
+		return;
+
+	if (has_vhe())
+		write_sysreg_s(guest_trfcr, SYS_TRFCR_EL12);
+	else
+		if (host_trfcr != guest_trfcr) {
+			*host_data_ptr(host_debug_state.trfcr_el1) = guest_trfcr;
+			host_data_set_flag(HOST_STATE_SWAP_TRFCR);
+		} else
+			host_data_clear_flag(HOST_STATE_SWAP_TRFCR);
+}
+EXPORT_SYMBOL_GPL(kvm_set_trfcr);
diff --git a/arch/arm64/kvm/hyp/nvhe/debug-sr.c b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
index 17c23e52f5f4..47602c4d160a 100644
--- a/arch/arm64/kvm/hyp/nvhe/debug-sr.c
+++ b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
@@ -100,6 +100,15 @@ static void __debug_save_trace(void)
 	host_data_set_flag(HOST_STATE_RESTORE_TRFCR);
 }
 
+static void __debug_swap_trace(void)
+{
+	u64 trfcr = read_sysreg_el1(SYS_TRFCR);
+
+	write_sysreg_el1(*host_data_ptr(host_debug_state.trfcr_el1), SYS_TRFCR);
+	*host_data_ptr(host_debug_state.trfcr_el1) = trfcr;
+	host_data_set_flag(HOST_STATE_RESTORE_TRFCR);
+}
+
 static void __debug_restore_trace(void)
 {
 	u64 trfcr_el1;
@@ -124,10 +133,14 @@ void __debug_save_host_buffers_nvhe(void)
 	if (!host_data_get_flag(HOST_FEAT_HAS_TRF))
 		return;
 
-	/* Disable and flush Self-Hosted Trace generation */
+	/*
+	 * Disable and flush Self-Hosted Trace generation for pKVM and TRBE,
+	 * or swap if host requires different guest filters.
+	 */
 	if (__debug_should_save_trace())
 		__debug_save_trace();
-
+	else if (host_data_get_flag(HOST_STATE_SWAP_TRFCR))
+		__debug_swap_trace();
 }
 
 void __debug_switch_to_guest(struct kvm_vcpu *vcpu)
-- 
2.34.1


