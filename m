Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CEC5D69104
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 12:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8cW1xQg3A5S2kec6W3gcCXjMo2wpT2RcLePz0Y97Nf4=; b=wqyVIKi8dHU5i04matOUd7L3Dw
	+5B7dTk0b1VybjJRdXZZspUuPLXIKAmsPxqFsbF1G1zL/bO0jA3ZGGzO8igrt7tqk8zEAIsNV97Js
	kjZ5LsYgwmNly3NVddrG7pdwys/QE+PWL5fvy7Ycz+xIsb0mw2QJaZ8Smb6ojujrAO/iqxAcdWO0a
	u2KdYCt33fpQfbcwyR/w0Lpy6Se0kyok/RhWxY27VJF8bgsqbfUqLcn2WgTne+3nHTCT16bMUgAZu
	P8QylMAHxkiX5rNSpGHEZCaNbA0nSZlJ0ey6BuojqpCcyC1Pf/PbPRN3seW+e9HYfOsry0eemDQvU
	ytujX9gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGdz4-0000000FXSv-38gl;
	Thu, 28 Nov 2024 12:51:02 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGdkH-0000000FVQL-3Zmv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 12:35:46 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-382440c1f83so1007313f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 04:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732797344; x=1733402144; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8cW1xQg3A5S2kec6W3gcCXjMo2wpT2RcLePz0Y97Nf4=;
        b=nAYfm/FDZCDAKL625vk0WAJe4Vi/xqWU6ssRGMDodrTv+gjp0LEXXObI8XSBo2P0As
         rFJTtsZzuqwdBWKikeuIj5VzYqWax6oFq//M5NKGZsOKh1pu9lrf0Yco6ZXTkzaSbFqj
         XDlGIVpClA53KADv+SNTFsNCNWoIf1R5nTmd78X5zVSIzpRSMGEGsuiNUyEQlFHY75Vn
         h0R63/7N6cs9neh8rtX/5AuPoad5FJSIdBQi+M9MMMtTo6PGprsnXfuC4VUh+0XyJM5y
         xbWB8DZXjJd1rt9onHvVWy0Nq0WiuoXsgaRQp/wJgoU6Ag9SwDa0at4iT4uDqQZe8Wq6
         eXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732797344; x=1733402144;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8cW1xQg3A5S2kec6W3gcCXjMo2wpT2RcLePz0Y97Nf4=;
        b=OqNs/i2ZadcQCyzUFqCZ0FLtM2FTU4zaUFLFmUePWl2OfhdngtOZ5crsNfPQ46sKu2
         oT7VcaUUcXpwXPBw0ox+b0kbQdkjp3U3Vf0ev7HrygdxDSiyAPnwdfsG0VzNpkjS+XCj
         gphlB1iuFTO9R+hRlZnOkjMqhGQ3fBilME4mhbSfXYJ2+uHKAOMKiyrbARzZPeAvFSz1
         /FIvFrP3SV1qfj45ihuGd7tbGZfznA7dptx+Mu0RtULXrvIj/AuSjgB+bX2Qrj0GNHsS
         J6OBYk/YF5BXAOPOaM45GA61uYnXqcPuD8OcWjbxYOeWncNqMOx8Kkn23jCSYHAGR6sb
         7SJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjX1LEWInfKxEuKDXzB8RFLYf7M7Lyl+5ari8yeieladv5vzH1RuzT1J5RqNgzow0uWyYrH00W4Yzu+I1A084v@lists.infradead.org
X-Gm-Message-State: AOJu0YyOHdKFAzG785kvt8IB3WUi6oSY2mMkourbOjIMPmBy7S8P5SRh
	qfIUDBnWujIZmrwPmJSjjQYynX5Zsaio6IqozfDzECi/WCLnPP0Cs5kDOstj2oo16Efc/JBMNw=
	=
X-Google-Smtp-Source: AGHT+IGGTrA03bJnLdQaVg0s+G7g0LZ8HsrDY7536qPbFY2PR5LidlEiGux8vbzXJNvpQSf2c2hxAHBIrg==
X-Received: from wryf11.prod.google.com ([2002:a05:6000:1a8b:b0:382:4e57:48ec])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1547:b0:382:4b04:a586
 with SMTP id ffacd0b85a97d-385cbd7c54dmr2515942f8f.16.1732797343896; Thu, 28
 Nov 2024 04:35:43 -0800 (PST)
Date: Thu, 28 Nov 2024 12:35:13 +0000
In-Reply-To: <20241128123515.1709777-1-tabba@google.com>
Mime-Version: 1.0
References: <20241128123515.1709777-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241128123515.1709777-14-tabba@google.com>
Subject: [PATCH v3 13/15] KVM: arm64: Remove PtrAuth guest vcpu flag
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, kristina.martsenko@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_043545_888379_8E536D62 
X-CRM114-Status: GOOD (  13.63  )
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

The vcpu flag GUEST_HAS_PTRAUTH is always associated with the
vcpu PtrAuth features, which are defined per vm rather than per
vcpu.

Remove the flag, and replace it with checks for the features
instead.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_emulate.h |  5 -----
 arch/arm64/include/asm/kvm_host.h    |  5 ++---
 arch/arm64/kvm/hyp/nvhe/pkvm.c       | 13 -------------
 arch/arm64/kvm/reset.c               |  4 ----
 4 files changed, 2 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 6602a4c091ac..406e99a452bf 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -691,9 +691,4 @@ static inline bool guest_hyp_sve_traps_enabled(const struct kvm_vcpu *vcpu)
 {
 	return __guest_hyp_cptr_xen_trap_enabled(vcpu, ZEN);
 }
-
-static inline void kvm_vcpu_enable_ptrauth(struct kvm_vcpu *vcpu)
-{
-	vcpu_set_flag(vcpu, GUEST_HAS_PTRAUTH);
-}
 #endif /* __ARM64_KVM_EMULATE_H__ */
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 69cb88c9ce3e..680ecef1d7aa 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -866,8 +866,6 @@ struct kvm_vcpu_arch {
 #define GUEST_HAS_SVE		__vcpu_single_flag(cflags, BIT(0))
 /* SVE config completed */
 #define VCPU_SVE_FINALIZED	__vcpu_single_flag(cflags, BIT(1))
-/* PTRAUTH exposed to guest */
-#define GUEST_HAS_PTRAUTH	__vcpu_single_flag(cflags, BIT(2))
 /* KVM_ARM_VCPU_INIT completed */
 #define VCPU_INITIALIZED	__vcpu_single_flag(cflags, BIT(3))
 
@@ -965,7 +963,8 @@ struct kvm_vcpu_arch {
 #define vcpu_has_ptrauth(vcpu)						\
 	((cpus_have_final_cap(ARM64_HAS_ADDRESS_AUTH) ||		\
 	  cpus_have_final_cap(ARM64_HAS_GENERIC_AUTH)) &&		\
-	  vcpu_get_flag(vcpu, GUEST_HAS_PTRAUTH))
+	 (vcpu_has_feature(vcpu, KVM_ARM_VCPU_PTRAUTH_ADDRESS) ||       \
+	  vcpu_has_feature(vcpu, KVM_ARM_VCPU_PTRAUTH_GENERIC)))
 #else
 #define vcpu_has_ptrauth(vcpu)		false
 #endif
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index c8ab3e59f4b1..dfd031acde31 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -278,18 +278,6 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
 		   allowed_features, KVM_VCPU_MAX_FEATURES);
 }
 
-static void pkvm_vcpu_init_ptrauth(struct pkvm_hyp_vcpu *hyp_vcpu)
-{
-	struct kvm_vcpu *vcpu = &hyp_vcpu->vcpu;
-
-	if (vcpu_has_feature(vcpu, KVM_ARM_VCPU_PTRAUTH_ADDRESS) ||
-	    vcpu_has_feature(vcpu, KVM_ARM_VCPU_PTRAUTH_GENERIC)) {
-		kvm_vcpu_enable_ptrauth(vcpu);
-	} else {
-		vcpu_clear_flag(&hyp_vcpu->vcpu, GUEST_HAS_PTRAUTH);
-	}
-}
-
 static void unpin_host_vcpu(struct kvm_vcpu *host_vcpu)
 {
 	if (host_vcpu)
@@ -359,7 +347,6 @@ static int init_pkvm_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu,
 		goto done;
 
 	pkvm_vcpu_init_sve(hyp_vcpu, host_vcpu);
-	pkvm_vcpu_init_ptrauth(hyp_vcpu);
 done:
 	if (ret)
 		unpin_host_vcpu(host_vcpu);
diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index 470524b31951..1cfab6a5d8a5 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -211,10 +211,6 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 		kvm_vcpu_reset_sve(vcpu);
 	}
 
-	if (vcpu_has_feature(vcpu, KVM_ARM_VCPU_PTRAUTH_ADDRESS) ||
-	    vcpu_has_feature(vcpu, KVM_ARM_VCPU_PTRAUTH_GENERIC))
-		kvm_vcpu_enable_ptrauth(vcpu);
-
 	if (vcpu_el1_is_32bit(vcpu))
 		pstate = VCPU_RESET_PSTATE_SVC;
 	else if (vcpu_has_nv(vcpu))
-- 
2.47.0.338.g60cca15819-goog


