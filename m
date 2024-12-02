Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CB6D78333
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 16:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nNriDIcshtJkMosS2LovJ2HK/mvE14mb05+LrMMa6to=; b=q7JW8MrkPMyNGC3Bdww7Bt/eCX
	gkWSlRhETmLjHpiQUNSIibzk2p3/Lzb2+9Re7BYZwvDFmxBDoziqVr5IZWgeIeyNvPPZzL0h3o4+4
	QoNk6Na9TDNEzlk2Jsv3+7KhD8+/Zc1RwFpHllxsWKKoz6p9Sq2l9x243fdXQ7z4TRkfRYACZORrh
	s0Ki9Tngi0ViEgR6Et6/GsooQ8mzXZqYI3lr5BVYzdp+uuqVohgJEtvww6tRiZKZo6orR52OMe/l/
	xwnG7gBX4bUB9JvkHrzBsIY5NdsMwaVPGzgLDvI6R2DoaxIV2E/KDQ/jlyh/OZJ0hKVt+MKEJB/0Z
	ySD1f6OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8xo-00000006maD-46RL;
	Mon, 02 Dec 2024 16:07:56 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8ei-00000006iao-0udB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 15:48:13 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-385dcadffebso1514007f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 07:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733154490; x=1733759290; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nNriDIcshtJkMosS2LovJ2HK/mvE14mb05+LrMMa6to=;
        b=W4YTZu4q9Wjzs0slj8kKkpbIAlNh2bi9XvJLmjmiEi5lbrlSAuJCE3dWyI4GLwmF5w
         VJSj3TJTibGNDi8YxXp8Ssl51SjpDFZwIYBWd4u6t7+VIbd6mjd87QJxJ0feBNR1vTT+
         sQ55cn0lnnRi6NBlGRtkqjH2XTJBSt0Oy+FqkkcMP8eeUD4rL3F+poopatp4TWqOhKsD
         SbLnPKqbo/O2FNZCaFWlgFJ8UG5Jz1LHkddzuIzEXl0wxISsY8WPnhk2VnFmyWQD7x3N
         fa0j8VIaIpnWbOkmAVOAaWeKFi0d0nPlqPS9FdguAAx1uk9uKRLybi6e1i5J5+SkydPc
         DlLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733154490; x=1733759290;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nNriDIcshtJkMosS2LovJ2HK/mvE14mb05+LrMMa6to=;
        b=sLVfldAQZ1H3FfYa/vGOWTahWXuKhSJRZH3lR/WF1ODa8a6/4JaVI3Gxxce6ZIfmww
         Tb9MTNZ0tOEjrBQ+PXWo0bL7/z2vW69ZcegPNSrUDWYPQogXd3suIPOh3P3j42puUKTX
         32/0GhHlpMXexqGTuVeFHBYj9f8GOTUttxLnYSIiatalOSORiSziS7nxILq2n+YxNxCc
         tAmjyxhiSHIpQYmtS3svMolO+kqjNv55iFRHGiRPWo1jCm3KHGkap3pajJN/RZIiv0/Q
         CC4LN6GF3mOkaAr+JBMDjaxw58JHJaPxNg64li3NytiGVdGZn66JNu1KAGtCh4qpaxun
         Rsrg==
X-Forwarded-Encrypted: i=1; AJvYcCU51ma84Fo8GXSRpWldWqE4h5y8kBAYv71IXP7DuYeJ12nex/ClMGlwUE8SzJCVshjWFUxUIcPw2wGDHKVeRNTb@lists.infradead.org
X-Gm-Message-State: AOJu0YyDZ0Zz7o95L3vaX2C894azCh1s05VZuLuGDpBC/cvIih0qwtCI
	/CDK5YCK9tqMBDrFymAvyDnbW3MMEc2Gnrm+CGoT1LCd1Zo8Cnv+8k2sBfObuM4YJHrYIMGOGA=
	=
X-Google-Smtp-Source: AGHT+IFMWiIi0v51OtFih5Zeq632c5WjlhMWfVw/sUtZadDZJoAaiVmEgqqMRPRI8VUya2bOd/51D3qZvQ==
X-Received: from wryi8.prod.google.com ([2002:a05:6000:1ac8:b0:382:321f:137f])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:18ac:b0:385:e1a8:e2a1
 with SMTP id ffacd0b85a97d-385e1a8e594mr9562794f8f.3.1733154490186; Mon, 02
 Dec 2024 07:48:10 -0800 (PST)
Date: Mon,  2 Dec 2024 15:47:40 +0000
In-Reply-To: <20241202154742.3611749-1-tabba@google.com>
Mime-Version: 1.0
References: <20241202154742.3611749-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241202154742.3611749-14-tabba@google.com>
Subject: [PATCH v4 13/14] KVM: arm64: Remove PtrAuth guest vcpu flag
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, kristina.martsenko@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_074812_255246_2F23C2BB 
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

The vcpu flag GUEST_HAS_PTRAUTH is always associated with the
vcpu PtrAuth features, which are defined per vm rather than per
vcpu.

Remove the flag, and replace it with checks for the features
instead.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_emulate.h |  5 -----
 arch/arm64/include/asm/kvm_host.h    |  7 +++----
 arch/arm64/kvm/hyp/nvhe/pkvm.c       | 13 -------------
 arch/arm64/kvm/reset.c               |  4 ----
 4 files changed, 3 insertions(+), 26 deletions(-)

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
index 69cb88c9ce3e..e6be8fe6627a 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -866,10 +866,8 @@ struct kvm_vcpu_arch {
 #define GUEST_HAS_SVE		__vcpu_single_flag(cflags, BIT(0))
 /* SVE config completed */
 #define VCPU_SVE_FINALIZED	__vcpu_single_flag(cflags, BIT(1))
-/* PTRAUTH exposed to guest */
-#define GUEST_HAS_PTRAUTH	__vcpu_single_flag(cflags, BIT(2))
 /* KVM_ARM_VCPU_INIT completed */
-#define VCPU_INITIALIZED	__vcpu_single_flag(cflags, BIT(3))
+#define VCPU_INITIALIZED	__vcpu_single_flag(cflags, BIT(2))
 
 /* Exception pending */
 #define PENDING_EXCEPTION	__vcpu_single_flag(iflags, BIT(0))
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


