Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E15C7D32D9C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 11:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w4Y12830R+W7ydXEFfviSLc+JWTSWnSDcOvb7pMp1YA=; b=zyjts06ABto0R8WDnA9GSWRkF6
	lmTgNNO9j/VwWFiDkdN89HJq4ZNHRKKJ7760YI/XiUpKtiBndRDdaGkm1XFtTYdGPrnMdeGPGqnpx
	RslYYIteNty+6Mf9cRdJH1geLgy9wWxqKPm/EzyL1sJlKDaqO/Nq8iiq32fhl86jm9Pl9YyC+R9E5
	cJ+hbuye7skmKcbhSA5JyljEMmRLtBkj2ryV341xvnoBUijVE//Q1hXk11SphWSAkAvq/nJoDHBz7
	yBBClQXfmKA7fK5JfI1/9G6q3xnixxyuW1CshGvqM1qvml/3tynJ70QW//b7Mb3qhBmLtgiuz3o68
	wOilPmbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tApD4-00000003Fd7-1GGq;
	Tue, 12 Nov 2024 11:37:26 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoIR-000000034s8-2k6c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 10:38:57 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-37d50fad249so4105871f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 02:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731407934; x=1732012734; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4Y12830R+W7ydXEFfviSLc+JWTSWnSDcOvb7pMp1YA=;
        b=VVmFUv9iqeB6liE7R0FYQxlPXOw0JvA1fCMwyXpRLCFp2Oge0r/sx16OGTBOQNjI1P
         pjOQGgAFLcPuUvG7smO3zMpNxzXwMVRaLRKOJEKHsjx3d0bzNY15qegJywHAsIJO2NMk
         MV+jC48EBrclDufNC0yDB5mui5bt2MtuMXVJESO7FuKgdc2FaMNlsNmghg75njYyyXIq
         nuoTQmNg+Niwk+sPsAF5PpUNlYeVH2yXtOTO5LEeRtvX3dSRIvUCZlFLF+zxwuFbGKKt
         L+3TXwVWj3mZ+Rp97T4O+O0uYym+q4plN9EtPNM/oj8fJ3P8sjuH5b7rKmYf9HBFDxgO
         Posg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731407934; x=1732012734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w4Y12830R+W7ydXEFfviSLc+JWTSWnSDcOvb7pMp1YA=;
        b=RjhdkfG/h9r/2JZrzpejTfB5JU3BhU4Ncr53VX8Ns1tBwjHtnMirnqy7U5+p5oGrN9
         K2I+oYovaCJI9/u2VG0534syBXiYBzx8zrau1AfauubpYnFIja8t1doF0t8LFszLSzmb
         ozMndkeWwYAYNjazVPFIPHX1fR5kkReYw0Arj/t1fmwY1lgGG6JZazMTPff85DgDL7Ef
         Yb3f8d8XIHQGecwMTZ5TLLILpdMtaycNVFQW+uLTIU3+f1YyRZ28NzfnS1iSO40wGK3j
         O2QhHuV1hTfHOSBPH97vwNZhcbbqlsNsjN3/Lel/HqWCV4KVhUyxU2IGnAc9dHv1d8Iu
         0R9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWZt1wUrwqiv1YEXeKix+mC3Qoch9XogMFhjLh7m+Igeu+Py4xFPSOVquxg+0Hnt3qeMbKR5Ya4f1yLaWEbM0H0@lists.infradead.org
X-Gm-Message-State: AOJu0YyfcqSlEMxkaYoSWb+4H4K2N6+k9peKW7HvLY5QKaseeXMDwtPM
	2cIcjRVnCmsZDJ15sPfVL7QNbA5CL6WoMzOANEV8xbeaxA5KNrS75XYMs3SA66Y=
X-Google-Smtp-Source: AGHT+IFFrkKNgQSMLjx9o9fyzR37XC2Gr6CvPJDOYVlojhp8ArNiU1b7bN0q0qpEMeG5HrMUFygnww==
X-Received: by 2002:a5d:6c64:0:b0:37d:4a82:6412 with SMTP id ffacd0b85a97d-381f1885db0mr12627127f8f.46.1731407933761;
        Tue, 12 Nov 2024 02:38:53 -0800 (PST)
Received: from pop-os.. ([145.224.90.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432bbf436ffsm142270955e9.44.2024.11.12.02.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 02:38:53 -0800 (PST)
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
	Mark Brown <broonie@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	James Morse <james.morse@arm.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>,
	Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 10/12] KVM: arm64: Don't hit sysregs to see if TRBE is enabled or not
Date: Tue, 12 Nov 2024 10:37:09 +0000
Message-Id: <20241112103717.589952-11-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112103717.589952-1-james.clark@linaro.org>
References: <20241112103717.589952-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_023855_718456_ACC47C41 
X-CRM114-Status: GOOD (  21.55  )
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

Now that the driver tells us whether TRBE was used or not we can use
that. Except in pKVM where the host isn't trusted we keep the existing
feature + sysreg check.

Now in the normal nVHE case, TRBE save and restore are gated by flag
checks on kvm_host_data.

Instead of using a magic value of host_debug_state.trfcr_el1 to
determine whether to restore, add a flag. This will also simplify the
logic in the next commit where restoration but no disabling is required.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/include/asm/kvm_host.h  |  2 ++
 arch/arm64/kvm/hyp/nvhe/debug-sr.c | 51 +++++++++++++++++++++++-------
 2 files changed, 41 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index b1dccac996a6..a8846689512b 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -947,6 +947,8 @@ struct kvm_vcpu_arch {
 #define HOST_STATE_SPE_EN	__kvm_single_flag(state, BIT(0))
 /* TRBLIMITR_EL1_E is set (TRBE trace buffer enabled) */
 #define HOST_STATE_TRBE_EN	__kvm_single_flag(state, BIT(1))
+/* Hyp modified TRFCR */
+#define HOST_STATE_RESTORE_TRFCR __kvm_single_flag(state, BIT(2))
 
 /* Pointer to the vcpu's SVE FFR for sve_{save,load}_state() */
 #define vcpu_sve_pffr(vcpu) (kern_hyp_va((vcpu)->arch.sve_state) +	\
diff --git a/arch/arm64/kvm/hyp/nvhe/debug-sr.c b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
index 578c549af3c6..17c23e52f5f4 100644
--- a/arch/arm64/kvm/hyp/nvhe/debug-sr.c
+++ b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
@@ -63,32 +63,55 @@ static void __debug_restore_spe(void)
 	*host_data_ptr(host_debug_state.pmscr_el1) = 0;
 }
 
-static void __debug_save_trace(u64 *trfcr_el1)
+static bool __debug_should_save_trace(void)
 {
-	*trfcr_el1 = 0;
+	/* pKVM reads the state for itself rather than trusting the host */
+	if (unlikely(is_protected_kvm_enabled())) {
+		/* Always disable any trace regardless of TRBE */
+		if (read_sysreg_el1(SYS_TRFCR) &
+		    (TRFCR_ELx_E0TRE | TRFCR_ELx_ExTRE))
+			return true;
+
+		/*
+		 * Trace could already be disabled but TRBE buffer
+		 * might still need to be drained if it was in use.
+		 */
+		if (host_data_get_flag(HOST_FEAT_HAS_TRBE))
+			return read_sysreg_s(SYS_TRBLIMITR_EL1) &
+			       TRBLIMITR_EL1_E;
+	}
+
+	return host_data_get_flag(HOST_STATE_TRBE_EN);
+}
 
-	/* Check if the TRBE is enabled */
-	if (!(read_sysreg_s(SYS_TRBLIMITR_EL1) & TRBLIMITR_EL1_E))
-		return;
+static void __debug_save_trace(void)
+{
 	/*
 	 * Prohibit trace generation while we are in guest.
 	 * Since access to TRFCR_EL1 is trapped, the guest can't
 	 * modify the filtering set by the host.
 	 */
-	*trfcr_el1 = read_sysreg_el1(SYS_TRFCR);
+	*host_data_ptr(host_debug_state.trfcr_el1) = read_sysreg_el1(SYS_TRFCR);
 	write_sysreg_el1(0, SYS_TRFCR);
 	isb();
 	/* Drain the trace buffer to memory */
 	tsb_csync();
+
+	host_data_set_flag(HOST_STATE_RESTORE_TRFCR);
 }
 
-static void __debug_restore_trace(u64 trfcr_el1)
+static void __debug_restore_trace(void)
 {
-	if (!trfcr_el1)
+	u64 trfcr_el1;
+
+	if (!host_data_get_flag(HOST_STATE_RESTORE_TRFCR))
 		return;
 
 	/* Restore trace filter controls */
+	trfcr_el1 = *host_data_ptr(host_debug_state.trfcr_el1);
+	*host_data_ptr(host_debug_state.trfcr_el1) = read_sysreg_el1(SYS_TRFCR);
 	write_sysreg_el1(trfcr_el1, SYS_TRFCR);
+	host_data_clear_flag(HOST_STATE_RESTORE_TRFCR);
 }
 
 void __debug_save_host_buffers_nvhe(void)
@@ -97,9 +120,14 @@ void __debug_save_host_buffers_nvhe(void)
 	if (__debug_spe_enabled())
 		__debug_save_spe();
 
+	/* Any trace filtering requires TRFCR register */
+	if (!host_data_get_flag(HOST_FEAT_HAS_TRF))
+		return;
+
 	/* Disable and flush Self-Hosted Trace generation */
-	if (host_data_get_flag(HOST_FEAT_HAS_TRBE))
-		__debug_save_trace(host_data_ptr(host_debug_state.trfcr_el1));
+	if (__debug_should_save_trace())
+		__debug_save_trace();
+
 }
 
 void __debug_switch_to_guest(struct kvm_vcpu *vcpu)
@@ -110,8 +138,7 @@ void __debug_switch_to_guest(struct kvm_vcpu *vcpu)
 void __debug_restore_host_buffers_nvhe(struct kvm_vcpu *vcpu)
 {
 	__debug_restore_spe();
-	if (host_data_get_flag(HOST_FEAT_HAS_TRBE))
-		__debug_restore_trace(*host_data_ptr(host_debug_state.trfcr_el1));
+	__debug_restore_trace();
 }
 
 void __debug_switch_to_host(struct kvm_vcpu *vcpu)
-- 
2.34.1


