Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AFBD32D96
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 11:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sA/W0+Ap46dgMFolE2VZt7mXSZE4H0GHR4Td8I21hdI=; b=Wx71/vlO4mAMyQlx0tnLRxc7Hr
	swyaA94bq9v/27/T0cq9wwcBshCiNHN+iXEDqRvB3c0XUl8dEcaV4XY3G3PbnSYvU2tmhq0Kuhs0/
	FOgazIFKeYW7FzEE0uSoxpVYDuYFNZNNTyOMgTOuRjepfrp0wg4qJNoiKQPfcnpi0wEDtHAcfQx15
	Vlka7+4R3mVKj1VXHioPLlSRuDePF3CePB9DND8OY34j/PBTZk+ySfLj/GrL2lKwd+1s+WIApPjRv
	mweHWzgqrhpW6216QYLqs3TqVo8Bmdn955njBusYfXJmJxAl1a27+SfvGHdBt8Pns275+zl95BhGW
	TkGsW02w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tApBJ-00000003FMv-3DtK;
	Tue, 12 Nov 2024 11:35:37 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoIH-000000034qf-0d6g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 10:38:46 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43159c9f617so43186645e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 02:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731407924; x=1732012724; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sA/W0+Ap46dgMFolE2VZt7mXSZE4H0GHR4Td8I21hdI=;
        b=kHkaWOQRMS5CwTIhalIt5iBtj+fqgTNzm9qRdd9qWiqiwCK2dwu+Yj4/tBR2M/FA3p
         oLPnzJvpA9sWobEoIQOA0wFU32hVwqpO5riJwJXMdH6d8SKjHf9CxjKvI0XvmidjjNYd
         ZO2intGbYqS0haw19jeIJFoNnOWnTHu4caBAEqzgKDDwglIG4uFv4deOP880XBAPvDFc
         kJaEj1hMKL8bWNyjfBkimx24Zy5SH8ZOVSq8Kx+Yeqw5k+Zf5PKMcI5ZB/mxFzNb33Q6
         7SS15eCWYwx0tqkUGivlAbaMTsDMwWQRv23MGXtf9669fJ3FpjfIaC9XDfCZuy+0pxYr
         3NuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731407924; x=1732012724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sA/W0+Ap46dgMFolE2VZt7mXSZE4H0GHR4Td8I21hdI=;
        b=hZ9chWbZSGGZ37/3UqZv2mtvacTLqTa2S9jI85UqOkV59tqLMfpaQeCTGlinTnOZS4
         0ZT0VB8t+VFXa0yAdPLMMEz1nSrdc2ywz612UxvcNWxN2EqT4CFb9C8GUpFI1CFj1MTi
         8N0Xxwqf8XF815U33bk/DELxEnIGL9h1w9UtgpGjP9cdpTA+lkfe0LC4WPi1JcQovHwh
         uigFQFWvsvZJCU3HgHPfdXxTdPTiCsLQ+G7hf0RlXKlbKF1yJnuw3nvik7BdcvDaeagu
         3CfUhWTpZIshFaQp8TY8ZUDMHG9DomBLfJv4v7v8XQ1VMyYg2HarvJh26Jk+Kf9Uk6GK
         Cfzw==
X-Forwarded-Encrypted: i=1; AJvYcCVp1mC2BwMe93vvQ3DJz2hyRoNHZ/T7MMN7r3//kNUinmiyi33ZyppgaCY2Zb1PMSrbvNzXUoAbF5l4qrUcE8Sm@lists.infradead.org
X-Gm-Message-State: AOJu0YzV04hZdMoCpY7mPUC66adVEkOTGShKks3gsEhr+FZMEx8uEEhK
	EFtKX6/6rJMHLkMZlqsfy99PNCb2c6MU4R4sagxw5tT7kxLSAjcWmeLp48cksZs=
X-Google-Smtp-Source: AGHT+IGTCpYEG2uHYkmh8Yj6DuYaWz+qEgTFVaZXTljNTeTGXpI0pqO9pJabhlxETKSZqiOHdB14Pg==
X-Received: by 2002:a05:600c:190f:b0:42f:7e87:3438 with SMTP id 5b1f17b1804b1-432b749ee57mr144547575e9.0.1731407923685;
        Tue, 12 Nov 2024 02:38:43 -0800 (PST)
Received: from pop-os.. ([145.224.90.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432bbf436ffsm142270955e9.44.2024.11.12.02.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 02:38:43 -0800 (PST)
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
	James Morse <james.morse@arm.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>,
	Fuad Tabba <tabba@google.com>,
	Mark Brown <broonie@kernel.org>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 09/12] KVM: arm64: coresight: Give TRBE enabled state to KVM
Date: Tue, 12 Nov 2024 10:37:08 +0000
Message-Id: <20241112103717.589952-10-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112103717.589952-1-james.clark@linaro.org>
References: <20241112103717.589952-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_023845_233075_2E57D437 
X-CRM114-Status: GOOD (  17.61  )
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

Currently in nVHE, KVM has to check if TRBE is enabled on every guest
switch even if it was never used. Because it's a debug feature and is
more likely to not be used than used, give KVM the TRBE buffer status to
allow a much simpler and faster do-nothing path in the hyp.

This is always called with preemption disabled except for probe/hotplug
which gets wrapped with preempt_disable().

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/include/asm/kvm_host.h            |  4 ++++
 arch/arm64/kvm/debug.c                       | 16 ++++++++++++++++
 drivers/hwtracing/coresight/coresight-trbe.c | 15 ++++++++++++---
 3 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 7f1e32d40f0c..b1dccac996a6 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -945,6 +945,8 @@ struct kvm_vcpu_arch {
 #define HOST_FEAT_HAS_TRF	__kvm_single_flag(feats, BIT(2))
 /* PMBLIMITR_EL1_E is set (SPE profiling buffer enabled) */
 #define HOST_STATE_SPE_EN	__kvm_single_flag(state, BIT(0))
+/* TRBLIMITR_EL1_E is set (TRBE trace buffer enabled) */
+#define HOST_STATE_TRBE_EN	__kvm_single_flag(state, BIT(1))
 
 /* Pointer to the vcpu's SVE FFR for sve_{save,load}_state() */
 #define vcpu_sve_pffr(vcpu) (kern_hyp_va((vcpu)->arch.sve_state) +	\
@@ -1387,6 +1389,7 @@ void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr);
 void kvm_clr_pmu_events(u64 clr);
 bool kvm_set_pmuserenr(u64 val);
 void kvm_set_pmblimitr(u64 pmblimitr);
+void kvm_set_trblimitr(u64 trblimitr);
 #else
 static inline void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr) {}
 static inline void kvm_clr_pmu_events(u64 clr) {}
@@ -1395,6 +1398,7 @@ static inline bool kvm_set_pmuserenr(u64 val)
 	return false;
 }
 static inline void kvm_set_pmblimitr(u64 pmblimitr) {}
+static inline void kvm_set_trblimitr(u64 trblimitr) {}
 #endif
 
 void kvm_vcpu_load_vhe(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index ed3b4d057c52..e99df2c3f62a 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -364,3 +364,19 @@ void kvm_set_pmblimitr(u64 pmblimitr)
 		host_data_clear_flag(HOST_STATE_SPE_EN);
 }
 EXPORT_SYMBOL_GPL(kvm_set_pmblimitr);
+
+void kvm_set_trblimitr(u64 trblimitr)
+{
+	/* Only read in nVHE */
+	if (has_vhe())
+		return;
+
+	if (kvm_arm_skip_trace_state())
+		return;
+
+	if (trblimitr & TRBLIMITR_EL1_E)
+		host_data_set_flag(HOST_STATE_TRBE_EN);
+	else
+		host_data_clear_flag(HOST_STATE_TRBE_EN);
+}
+EXPORT_SYMBOL_GPL(kvm_set_trblimitr);
diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 96a32b213669..ff281b445682 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -18,6 +18,7 @@
 #include <asm/barrier.h>
 #include <asm/cpufeature.h>
 #include <linux/vmalloc.h>
+#include <linux/kvm_host.h>
 
 #include "coresight-self-hosted-trace.h"
 #include "coresight-trbe.h"
@@ -213,6 +214,12 @@ static inline void trbe_drain_buffer(void)
 	dsb(nsh);
 }
 
+static void trbe_write_trblimitr(u64 val)
+{
+	write_sysreg_s(val, SYS_TRBLIMITR_EL1);
+	kvm_set_trblimitr(val);
+}
+
 static inline void set_trbe_enabled(struct trbe_cpudata *cpudata, u64 trblimitr)
 {
 	/*
@@ -220,7 +227,7 @@ static inline void set_trbe_enabled(struct trbe_cpudata *cpudata, u64 trblimitr)
 	 * might be required for fetching the buffer limits.
 	 */
 	trblimitr |= TRBLIMITR_EL1_E;
-	write_sysreg_s(trblimitr, SYS_TRBLIMITR_EL1);
+	trbe_write_trblimitr(trblimitr);
 
 	/* Synchronize the TRBE enable event */
 	isb();
@@ -238,7 +245,7 @@ static inline void set_trbe_disabled(struct trbe_cpudata *cpudata)
 	 * might be required for fetching the buffer limits.
 	 */
 	trblimitr &= ~TRBLIMITR_EL1_E;
-	write_sysreg_s(trblimitr, SYS_TRBLIMITR_EL1);
+	trbe_write_trblimitr(trblimitr);
 
 	if (trbe_needs_drain_after_disable(cpudata))
 		trbe_drain_buffer();
@@ -253,8 +260,10 @@ static void trbe_drain_and_disable_local(struct trbe_cpudata *cpudata)
 
 static void trbe_reset_local(struct trbe_cpudata *cpudata)
 {
+	preempt_disable();
 	trbe_drain_and_disable_local(cpudata);
-	write_sysreg_s(0, SYS_TRBLIMITR_EL1);
+	trbe_write_trblimitr(0);
+	preempt_enable();
 	write_sysreg_s(0, SYS_TRBPTR_EL1);
 	write_sysreg_s(0, SYS_TRBBASER_EL1);
 	write_sysreg_s(0, SYS_TRBSR_EL1);
-- 
2.34.1


