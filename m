Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93CAC35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 09:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+bMpkAVOynda5P7ydoOSXioxAp6dNXrbOmJ322faHM=; b=Hw/onDXWxu9HjGOuxwUjmvImwN
	JNVJL/O98S/yniAkbgpSLjyUaQpFjka5m46AVHl+P1Kc72jpLEeYO/fn7Lxl87POJ0u8zdbgqGtap
	immPLic77vNFN0sTToJ15FA2WP5fep/08Efl5eo5dHcemcsfFHNyijPfxCcq7JI4R5d22dFW4RknH
	jjbIe9miv2fn6jGUAVJbKyGjPWGhmsXetwVgROgaycO4YzSAOlAI2VbsSuMfR/bbM1RxGLakFuvDX
	zS4Z62D2PFbIndxaaSrfiAwW9WPS+iYtaXV0zJuM7W6z+/qjh4pjgvt9j3eLMMywZ2OmVue9rk7s2
	WqNDspFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttNjO-0000000G7gb-1Czq;
	Sat, 15 Mar 2025 09:22:58 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttNZp-0000000G5rJ-11m8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Mar 2025 09:13:06 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-225df540edcso26155735ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Mar 2025 02:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1742029984; x=1742634784; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b+bMpkAVOynda5P7ydoOSXioxAp6dNXrbOmJ322faHM=;
        b=UTrCf3OLYyXkvxyD5a0mnVP37gaOtpxnQDxQKOhkKapRr/jJ75YygBOYsFemQMj/bu
         F5OBIAjmAfBDLwicZC0dAYyKQOW4+hV8NWRVGPAHn+wIXZMtPWZfgdR674j5/r98B/nl
         2hOfM52Fmahg2jVyi3zgfmQUjq/Ksf6fP+9o1d+Ta5wcli8d/uSJ3dVghJFuQAiAnyLX
         yf8mzECiD1Vm4FH2tey1BM1rVc5oec4MgNGjg3TxhyNEwAswOeLpoiCCEA6yWzCVGM4m
         TqOe2C+ho8sut6UgSaYbkv3D/gDY6ofTXl+aE23qpwIPbxNDacR9eN6psG/Gbl8s//hc
         HgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742029984; x=1742634784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+bMpkAVOynda5P7ydoOSXioxAp6dNXrbOmJ322faHM=;
        b=qurW9jshH2NuNAlhqkh4N2j6lBetT4abXj9FVbdFSfR7S/XTD4KXj044W8h1WJcl9r
         oZy0nQikH+fmqih75eCm1+deXc3WW1u4mjCJ8vkzaOCdMbAfmfSGL/eXHT7xrbu/uUrK
         vL+mZJA9UnJlGCa+U8x+DiyF/JqWbczxRU/uV1SP5hxBPvw1qUzzZCfap6smmf00KE+R
         JAnKqCVqLCVDzBd6xxp/dgKmAixeXxCefGjM+s0yhvzEMWQwQF3FgB4PdhbIDm/YweKL
         KZcaVnUYldxyH3QhAnNqwCI1I2dUlknR98OF5xzndGCQGF1SHrSdLruhKZZFKqD9HLZj
         VUNA==
X-Gm-Message-State: AOJu0YxeaAeNZlaW40LqGVv1b190jsjXni8nHr358ZKxdV5cEgU5lVaT
	ZJ3MNEieAxYyElrOtWXsV6oBZTICIeMuWf6a3JhyGWkUhSOY8RMgf9tw/pePbHs=
X-Gm-Gg: ASbGnctgpQjq3fJZ+hV2iu288ouDppzLaCS5/2Y1YZSCaetQ6R4JGOJBtTQFQt+qreq
	tcERT8yD8xH9/JrOcdcz6bzq69iIt+fkySHhZ2ynQXMTHtagsCOgRbdijt3ygna7tlF6FZ0Udj7
	8sLPbvhleY0xpCEm6KtvEjDNoiUSPlcr6Pn+b1U27ko4j3FZpynvAw1NOB8/AiTbtE1faUew2mx
	iKf+tTSPRxbFEKZfdtvG16SyM27tSqbvz8P1XAuwICfojArws4WD86ima9/A49gDo37Vl94HWBD
	B8101ApvAev+1ohDWkJIPGyI0+svshu9SDBHDlboyO6kpujDZucL5LV7CAg=
X-Google-Smtp-Source: AGHT+IF0dYo0boBR+9bl0vawDxMBgd8T0cqY/hF/tRnsNt/62E4WUY/Xos2ArXYf2sRSNXond0EV3Q==
X-Received: by 2002:a05:6a21:69b:b0:1e1:9e9f:ae4 with SMTP id adf61e73a8af0-1f5c2952640mr6319263637.13.1742029984462;
        Sat, 15 Mar 2025 02:13:04 -0700 (PDT)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7371155aa8bsm4082744b3a.70.2025.03.15.02.13.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Mar 2025 02:13:04 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Sat, 15 Mar 2025 18:12:14 +0900
Subject: [PATCH v5 5/5] KVM: arm64: PMU: Reload when resetting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250315-pmc-v5-5-ecee87dab216@daynix.com>
References: <20250315-pmc-v5-0-ecee87dab216@daynix.com>
In-Reply-To: <20250315-pmc-v5-0-ecee87dab216@daynix.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Andrew Jones <andrew.jones@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devel@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.15-dev-edae6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_021305_301603_F2CFBE99 
X-CRM114-Status: GOOD (  12.58  )
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

Replace kvm_pmu_vcpu_reset() with the generic PMU reloading mechanism to
ensure the consistency with system registers and to reduce code size.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 arch/arm64/kvm/pmu-emul.c | 14 --------------
 arch/arm64/kvm/reset.c    |  3 ---
 arch/arm64/kvm/sys_regs.c |  3 +++
 include/kvm/arm_pmu.h     |  2 --
 4 files changed, 3 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 8e10124a7420..aae5713d8993 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -254,20 +254,6 @@ void kvm_pmu_vcpu_init(struct kvm_vcpu *vcpu)
 		pmu->pmc[i].idx = i;
 }
 
-/**
- * kvm_pmu_vcpu_reset - reset pmu state for cpu
- * @vcpu: The vcpu pointer
- *
- */
-void kvm_pmu_vcpu_reset(struct kvm_vcpu *vcpu)
-{
-	unsigned long mask = kvm_pmu_implemented_counter_mask(vcpu);
-	int i;
-
-	for_each_set_bit(i, &mask, 32)
-		kvm_pmu_stop_counter(kvm_vcpu_idx_to_pmc(vcpu, i));
-}
-
 /**
  * kvm_pmu_vcpu_destroy - free perf event of PMU for cpu
  * @vcpu: The vcpu pointer
diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index 803e11b0dc8f..f82fcc614e13 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -196,9 +196,6 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 	vcpu->arch.reset_state.reset = false;
 	spin_unlock(&vcpu->arch.mp_state_lock);
 
-	/* Reset PMU outside of the non-preemptible section */
-	kvm_pmu_vcpu_reset(vcpu);
-
 	preempt_disable();
 	loaded = (vcpu->cpu != -1);
 	if (loaded)
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 727579acc7f6..14f66c7a4545 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -4480,6 +4480,9 @@ void kvm_reset_sys_regs(struct kvm_vcpu *vcpu)
 	}
 
 	set_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &kvm->arch.flags);
+
+	if (kvm_vcpu_has_pmu(vcpu))
+		kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
 }
 
 /**
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index b6d0a682505d..d6ad13925978 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -53,7 +53,6 @@ u64 kvm_pmu_accessible_counter_mask(struct kvm_vcpu *vcpu);
 u64 kvm_pmu_valid_counter_mask(struct kvm_vcpu *vcpu);
 u64 kvm_pmu_get_pmceid(struct kvm_vcpu *vcpu, bool pmceid1);
 void kvm_pmu_vcpu_init(struct kvm_vcpu *vcpu);
-void kvm_pmu_vcpu_reset(struct kvm_vcpu *vcpu);
 void kvm_pmu_vcpu_destroy(struct kvm_vcpu *vcpu);
 void kvm_pmu_reprogram_counter_mask(struct kvm_vcpu *vcpu, u64 val);
 void kvm_pmu_flush_hwstate(struct kvm_vcpu *vcpu);
@@ -126,7 +125,6 @@ static inline u64 kvm_pmu_accessible_counter_mask(struct kvm_vcpu *vcpu)
 	return 0;
 }
 static inline void kvm_pmu_vcpu_init(struct kvm_vcpu *vcpu) {}
-static inline void kvm_pmu_vcpu_reset(struct kvm_vcpu *vcpu) {}
 static inline void kvm_pmu_vcpu_destroy(struct kvm_vcpu *vcpu) {}
 static inline void kvm_pmu_reprogram_counter_mask(struct kvm_vcpu *vcpu, u64 val) {}
 static inline void kvm_pmu_flush_hwstate(struct kvm_vcpu *vcpu) {}

-- 
2.48.1


