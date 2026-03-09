Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635FCF4180C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 16:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NkHqaF0Voln2FOHGSJG+Xa2sIZ5mFTGWevzJaf7mGg4=; b=FGmxVjjYcScywYKQLA98cRbmzk
	0DsOASYolwtcYuvv9TneCj6hrgSbgsToMfz4zc4vp555S2BNuzw4sW3QMPViUCrDf/eMH9lZiIIxf
	2SpunS3fiGQGTDLHNl+aXOaR+BbuzR9fwJsBZC2e981c3zd5+Ex4QdmcLYz1ypHksR1/LzbKD1Yua
	Ogi76gfPQRhfuFmlooebTJ//roEirETp4NE8+xoupO8x0aTfBd+3hFA/F7PZ8IJtjiNrd9Womc8gu
	a6i/XBYsrPM7WEf7JFZz2Ln4USqL6HG1xu7noXtjljVjI705WEH58umeHgTLQma1TpWbLX6Utzp6q
	1grCB6uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzd6R-00000007fB1-2S0J;
	Mon, 09 Mar 2026 16:05:07 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzd6O-00000007fAf-3x2h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 16:05:06 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b943a60ee02so288816966b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 09:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773072302; x=1773677102; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NkHqaF0Voln2FOHGSJG+Xa2sIZ5mFTGWevzJaf7mGg4=;
        b=f4bQ4A3HodLN2OaP9a6f4Tl9fRVPJi72N9S44TOwvLV39NRkNQ6k6f5+YSg+LmaFsq
         wyHTlLJSPpPVHIsWXkx4OzxK3Kjo5bBXIowCYpV28SsVpZqeaUH/e+hQrShvWRuiGAYY
         J65sqmN3cvdlf2fSCTcl3emguFGGDlAVj4LtT5z5Vc8lGzdXGddJEVYlDrG9R2BIK1cM
         5Yrzi989VMg5vMmf19B1YrEdjHmTOzbKBh45pk7rN2pbyP2kEqN7xLAcAwYshhJ3vD9p
         NRFsaV6QkWOm8MFb4STiha6ksiQOHPuT/GRBwm5/AVFjtR8mdJgmLkV12g4RnVBuzI6c
         piGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773072302; x=1773677102;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NkHqaF0Voln2FOHGSJG+Xa2sIZ5mFTGWevzJaf7mGg4=;
        b=IHQrn0kSKVtaSascweeJRX0rkhfDtRgtx6oJ3aUI2RVuQYIWTNJb9zxDe2CHQTWMhF
         jTsnxgSLnEoPuYvuZq/ndocQSWQKQr7ogNb97+Owb1saxIBLnwNPRlz0rLEwf8hovowC
         z3G7W+O94X33DmRTshjSbNBOKVl1dgUcQl4QzjomGkFlXZMoxTEwbmwBxTm4VALx3er4
         /HAjo22vdypq3E4KHgUbCdOwfEqto+o5GK99IhQTt3HyXmEQNuR/qgQ4Hk56QPPvhEcY
         9N3ciI1/XrAAuD2LzNP3SfTTI6BmT6HwttlY2BAu0frFnXpSjlDA/mrzrGwPLR8AJZki
         K+2g==
X-Forwarded-Encrypted: i=1; AJvYcCXb6AuvOz7sxJHLIj4C31qVYcFFyDAdcRqRhnMHO+nEmVUuR8eS/Ez5QMpOsmJNNWfjKRW3SbKuqNO2isXmc7OH@lists.infradead.org
X-Gm-Message-State: AOJu0YwfAxfBSVhiTk1X+9venHorjawomlFwWNOR6MR4XhRDohlQDGTh
	EUHybOrOCv1gqWMWQyOtgFgwwatfOzETNYpQ3GnmXu/1m4FCMq9koooCNEnNWdwQ/atuB3bIxp3
	XlwKXiBGZ39Qj+pLt1Yf0HA==
X-Received: from ejcgj34.prod.google.com ([2002:a17:907:7422:b0:b93:5286:36e5])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:6a0c:b0:b8a:f7ec:d995 with SMTP id a640c23a62f3a-b942da27c31mr679712466b.9.1773072302063;
 Mon, 09 Mar 2026 09:05:02 -0700 (PDT)
Date: Mon,  9 Mar 2026 16:04:50 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260309160450.2610295-1-vdonnefort@google.com>
Subject: [PATCH] KVM: arm64: Fix ICV_DIR_EL1 trapping detection for pKVM
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, tabba@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_090505_019676_CD5A11A0 
X-CRM114-Status: GOOD (  12.07  )
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

For non-VHE KVM, can_trap_icv_dir_el1() relies on a hyp-stub HVC to
read the ICH_VTR_EL2 register. This isn't compatible with pKVM enabled
devices which are failing late calls to verify_local_cpu_caps() when
hotplugging a CPU.

In verify_local_cpu_caps(), system_has_cap initialised before pKVM kills
the hyp-stub is most likely set, while cpu_has_cap fails to probe the
feature creates a capability conflict and prevents the CPU from going
online.

Add an HVC to get the ICH_VTR_EL2 register and use it in for ICV_DIR_EL1
trapping detection.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index a1ad12c72ebf..81bac8faec44 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -81,6 +81,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___kvm_timer_set_cntvoff,
 	__KVM_HOST_SMCCC_FUNC___vgic_v3_save_aprs,
 	__KVM_HOST_SMCCC_FUNC___vgic_v3_restore_vmcr_aprs,
+	__KVM_HOST_SMCCC_FUNC___vgic_v3_get_ich_vtr_el2,
 	__KVM_HOST_SMCCC_FUNC___pkvm_reserve_vm,
 	__KVM_HOST_SMCCC_FUNC___pkvm_unreserve_vm,
 	__KVM_HOST_SMCCC_FUNC___pkvm_init_vm,
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index c31f8e17732a..0bca57c1cbe0 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2345,13 +2345,17 @@ static bool can_trap_icv_dir_el1(const struct arm64_cpu_capabilities *entry,
 	    !is_midr_in_range_list(has_vgic_v3))
 		return false;
 
-	if (is_kernel_in_hyp_mode())
+	if (is_kernel_in_hyp_mode()) {
 		res.a1 = read_sysreg_s(SYS_ICH_VTR_EL2);
-	else
+	} else if (system_capabilities_finalized() && is_protected_kvm_enabled()) {
+		arm_smccc_1_1_hvc(KVM_HOST_SMCCC_FUNC(__vgic_v3_get_ich_vtr_el2), &res);
+		if (res.a0 == SMCCC_RET_NOT_SUPPORTED)
+			return false;
+	} else {
 		arm_smccc_1_1_hvc(HVC_GET_ICH_VTR_EL2, &res);
-
-	if (res.a0 == HVC_STUB_ERR)
-		return false;
+		if (res.a0 == HVC_STUB_ERR)
+			return false;
+	}
 
 	return res.a1 & ICH_VTR_EL2_TDS;
 }
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index e7790097db93..0432852228f9 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -463,6 +463,11 @@ static void handle___vgic_v3_get_gic_config(struct kvm_cpu_context *host_ctxt)
 	cpu_reg(host_ctxt, 1) = __vgic_v3_get_gic_config();
 }
 
+static void handle___vgic_v3_get_ich_vtr_el2(struct kvm_cpu_context *host_ctxt)
+{
+	cpu_reg(host_ctxt, 1) = read_sysreg_s(SYS_ICH_VTR_EL2);
+}
+
 static void handle___vgic_v3_init_lrs(struct kvm_cpu_context *host_ctxt)
 {
 	__vgic_v3_init_lrs();
@@ -622,6 +627,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__kvm_timer_set_cntvoff),
 	HANDLE_FUNC(__vgic_v3_save_aprs),
 	HANDLE_FUNC(__vgic_v3_restore_vmcr_aprs),
+	HANDLE_FUNC(__vgic_v3_get_ich_vtr_el2),
 	HANDLE_FUNC(__pkvm_reserve_vm),
 	HANDLE_FUNC(__pkvm_unreserve_vm),
 	HANDLE_FUNC(__pkvm_init_vm),

base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
-- 
2.53.0.473.g4a7958ca14-goog


