Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2505DD32D92
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 11:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oGQZgIecdgJFFuz0ar27zElDtqI8/ASy5Gql7KrbLX0=; b=UvFuA/6euRLwWqr0v1RW7IrEBT
	jMn/vGnjL+DPaCtAfLMOPmImOUph9VYNYvabOpPBmlKBlN8FuuDma0/3XHQuR/pcohr8lKIFMtme+
	hS+roKjD+zbRUlbiTYC00Qoit/1DJu+xiTNAtT6rrtONPrjoSafNBRu2UhqJQjfMuDoJRDiEZ3BZf
	/dZDvP7sAn60cur83Dr9ElL0qoathqdbwMzrUaUt8xODXx1ZMJqHxOWMrS+cbJWsOz1MtFDpPE2Rg
	wkufR68aYM4eJf/msHyh7z6Ugf0CBYDSvFrp87c3680Ep3OxOYNu01AYuxfRq4af1AVgmt+ezfMcu
	byAsYJKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAotd-00000003BuY-1sTt;
	Tue, 12 Nov 2024 11:17:21 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoHb-000000034fg-1nEW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 10:38:04 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-431481433bdso48154215e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 02:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731407882; x=1732012682; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGQZgIecdgJFFuz0ar27zElDtqI8/ASy5Gql7KrbLX0=;
        b=MIroOh90IvIxcTDXxnUW/ubRZzooKGutpRt06bcvOZ2gB2wkNupmHPZXKDAB3wj54Q
         eevERbgy/QfNSROwOIjrEM/N05ikOzEYeXO7vJBb5CCB49rUfw6mitU1Eaq2Z4eueCc1
         Nl+gDV1+rJcGTVTd494vfSfNvs30nY+7GGXgIKe1SIBY8sL8Db/gAAzoXC8Vh9W1rJQN
         /Z7SKcg5rt9p3CISmLwdghF3p8WaPZOfQ0pRhWq5qMvbs7n2wa+K2Y4AbupTPH4vdZ4H
         otRd3SOZhaEbJX/juNX9jBu+kPRz5+ueIvFP+vyHBtpXsdgXGeGKMPH5O5CZopdoS8MJ
         2mxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731407882; x=1732012682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oGQZgIecdgJFFuz0ar27zElDtqI8/ASy5Gql7KrbLX0=;
        b=QUnTjYyKqEImlEvY5Uq3cz/qAldP9DuCRYPtjYoz6V67KV1puj9xbkqtW3GxD0S671
         IlU72YuKnxhNYT+52oSnP2EYhoGRdlEbyZMOEXwKcWrnQk5RE9VPfDtkfrRenvQfgTdl
         /OhhvKP8Xk66jqeWM8ssVrN6vt9T09LFG7c6fSXUs+zEq3BkCz0biqVkb0qE5+vA+4w4
         74Su/vxuruNYdfugWg0OeeXsu/tZbRsEsCSmvCrbRIgzhA0qRGdRlXyVUgJxOxzUFY6Q
         WU/adoWDl794AyDQqIkWGcW8ZB51Gwxj1O5Ii7F1mnJRi7NVxLxX80WOTjtFLUOLDTyB
         rDJQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8uv4n9PSahXucJcfrQX6hfF2KMA3qDkh2qYBaUjPubQKn2c0ftaxu6BT2x+VokRXXUFl5/kjFhUjgiQH4h78g@lists.infradead.org
X-Gm-Message-State: AOJu0YwF7TfhN7S9BWnB6THxtQZtzJtx06uahD9kSpgCw4sIwpEyh4kU
	ibTTnklSWvWzGDvPitqP3ogUjf13LwT2xdKQgeI7a95dQI5PmchErB6BXCAZhTw=
X-Google-Smtp-Source: AGHT+IHGEHyPFWqoNoYrbeGSGMnOBwTa4lfpM6N5kuAUTD0JGTXynuOGzkoJhiocD1Pug6afrml1XA==
X-Received: by 2002:a05:600c:354c:b0:42c:acb0:dda5 with SMTP id 5b1f17b1804b1-432b74fdaeemr135858735e9.1.1731407881909;
        Tue, 12 Nov 2024 02:38:01 -0800 (PST)
Received: from pop-os.. ([145.224.90.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432bbf436ffsm142270955e9.44.2024.11.12.02.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 02:38:01 -0800 (PST)
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
	Fuad Tabba <tabba@google.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 04/12] KVM: arm64: Make vcpu flag macros more generic
Date: Tue, 12 Nov 2024 10:37:03 +0000
Message-Id: <20241112103717.589952-5-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112103717.589952-1-james.clark@linaro.org>
References: <20241112103717.589952-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_023803_504264_129CF402 
X-CRM114-Status: GOOD (  20.01  )
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

Rename vcpu_* to kvm_* so that the same flags mechanism can be used in
places other than vcpu without being confusing. Wherever macros are
still related to vcpu like vcpu_get_flag() with hard coded v->arch, keep
the vcpu_* name, otherwise change it.

Also move the "v->arch" access one macro higher for the same reason.

This will be used for moving flags to host_data in a later commit.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/include/asm/kvm_host.h | 88 +++++++++++++++----------------
 arch/arm64/kvm/hyp/exception.c    | 12 ++---
 arch/arm64/kvm/inject_fault.c     |  4 +-
 arch/arm64/kvm/mmio.c             | 10 ++--
 4 files changed, 57 insertions(+), 57 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index f333b189fb43..34aa59f498c4 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -790,22 +790,22 @@ struct kvm_vcpu_arch {
 /*
  * Each 'flag' is composed of a comma-separated triplet:
  *
- * - the flag-set it belongs to in the vcpu->arch structure
+ * - the flag-set it belongs to in the structure pointed to by 'v'
  * - the value for that flag
  * - the mask for that flag
  *
- *  __vcpu_single_flag() builds such a triplet for a single-bit flag.
- * unpack_vcpu_flag() extract the flag value from the triplet for
+ *  __kvm_single_flag() builds such a triplet for a single-bit flag.
+ * unpack_kvm_flag() extract the flag value from the triplet for
  * direct use outside of the flag accessors.
  */
-#define __vcpu_single_flag(_set, _f)	_set, (_f), (_f)
+#define __kvm_single_flag(_set, _f)	_set, (_f), (_f)
 
 #define __unpack_flag(_set, _f, _m)	_f
-#define unpack_vcpu_flag(...)		__unpack_flag(__VA_ARGS__)
+#define unpack_kvm_flag(...)		__unpack_flag(__VA_ARGS__)
 
 #define __build_check_flag(v, flagset, f, m)			\
 	do {							\
-		typeof(v->arch.flagset) *_fset;			\
+		typeof(v.flagset) *_fset;			\
 								\
 		/* Check that the flags fit in the mask */	\
 		BUILD_BUG_ON(HWEIGHT(m) != HWEIGHT((f) | (m)));	\
@@ -813,11 +813,11 @@ struct kvm_vcpu_arch {
 		BUILD_BUG_ON((sizeof(*_fset) * 8) <= __fls(m));	\
 	} while (0)
 
-#define __vcpu_get_flag(v, flagset, f, m)			\
+#define __kvm_get_flag(v, flagset, f, m)			\
 	({							\
 		__build_check_flag(v, flagset, f, m);		\
 								\
-		READ_ONCE(v->arch.flagset) & (m);		\
+		READ_ONCE(v.flagset) & (m);		\
 	})
 
 /*
@@ -826,64 +826,64 @@ struct kvm_vcpu_arch {
  */
 #ifdef __KVM_NVHE_HYPERVISOR__
 /* the nVHE hypervisor is always non-preemptible */
-#define __vcpu_flags_preempt_disable()
-#define __vcpu_flags_preempt_enable()
+#define __kvm_flags_preempt_disable()
+#define __kvm_flags_preempt_enable()
 #else
-#define __vcpu_flags_preempt_disable()	preempt_disable()
-#define __vcpu_flags_preempt_enable()	preempt_enable()
+#define __kvm_flags_preempt_disable()	preempt_disable()
+#define __kvm_flags_preempt_enable()	preempt_enable()
 #endif
 
-#define __vcpu_set_flag(v, flagset, f, m)			\
+#define __kvm_set_flag(v, flagset, f, m)			\
 	do {							\
-		typeof(v->arch.flagset) *fset;			\
+		typeof(v.flagset) *fset;			\
 								\
 		__build_check_flag(v, flagset, f, m);		\
 								\
-		fset = &v->arch.flagset;			\
-		__vcpu_flags_preempt_disable();			\
+		fset = &v.flagset;			\
+		__kvm_flags_preempt_disable();			\
 		if (HWEIGHT(m) > 1)				\
 			*fset &= ~(m);				\
 		*fset |= (f);					\
-		__vcpu_flags_preempt_enable();			\
+		__kvm_flags_preempt_enable();			\
 	} while (0)
 
-#define __vcpu_clear_flag(v, flagset, f, m)			\
+#define __kvm_clear_flag(v, flagset, f, m)			\
 	do {							\
-		typeof(v->arch.flagset) *fset;			\
+		typeof(v.flagset) *fset;			\
 								\
 		__build_check_flag(v, flagset, f, m);		\
 								\
-		fset = &v->arch.flagset;			\
-		__vcpu_flags_preempt_disable();			\
+		fset = &v.flagset;			\
+		__kvm_flags_preempt_disable();			\
 		*fset &= ~(m);					\
-		__vcpu_flags_preempt_enable();			\
+		__kvm_flags_preempt_enable();			\
 	} while (0)
 
-#define vcpu_get_flag(v, ...)	__vcpu_get_flag((v), __VA_ARGS__)
-#define vcpu_set_flag(v, ...)	__vcpu_set_flag((v), __VA_ARGS__)
-#define vcpu_clear_flag(v, ...)	__vcpu_clear_flag((v), __VA_ARGS__)
+#define vcpu_get_flag(v, ...)	__kvm_get_flag(((v)->arch), __VA_ARGS__)
+#define vcpu_set_flag(v, ...)	__kvm_set_flag(((v)->arch), __VA_ARGS__)
+#define vcpu_clear_flag(v, ...)	__kvm_clear_flag(((v)->arch), __VA_ARGS__)
 
 /* SVE exposed to guest */
-#define GUEST_HAS_SVE		__vcpu_single_flag(cflags, BIT(0))
+#define GUEST_HAS_SVE		__kvm_single_flag(cflags, BIT(0))
 /* SVE config completed */
-#define VCPU_SVE_FINALIZED	__vcpu_single_flag(cflags, BIT(1))
+#define VCPU_SVE_FINALIZED	__kvm_single_flag(cflags, BIT(1))
 /* PTRAUTH exposed to guest */
-#define GUEST_HAS_PTRAUTH	__vcpu_single_flag(cflags, BIT(2))
+#define GUEST_HAS_PTRAUTH	__kvm_single_flag(cflags, BIT(2))
 /* KVM_ARM_VCPU_INIT completed */
-#define VCPU_INITIALIZED	__vcpu_single_flag(cflags, BIT(3))
+#define VCPU_INITIALIZED	__kvm_single_flag(cflags, BIT(3))
 
 /* Exception pending */
-#define PENDING_EXCEPTION	__vcpu_single_flag(iflags, BIT(0))
+#define PENDING_EXCEPTION	__kvm_single_flag(iflags, BIT(0))
 /*
  * PC increment. Overlaps with EXCEPT_MASK on purpose so that it can't
  * be set together with an exception...
  */
-#define INCREMENT_PC		__vcpu_single_flag(iflags, BIT(1))
+#define INCREMENT_PC		__kvm_single_flag(iflags, BIT(1))
 /* Target EL/MODE (not a single flag, but let's abuse the macro) */
-#define EXCEPT_MASK		__vcpu_single_flag(iflags, GENMASK(3, 1))
+#define EXCEPT_MASK		__kvm_single_flag(iflags, GENMASK(3, 1))
 
 /* Helpers to encode exceptions with minimum fuss */
-#define __EXCEPT_MASK_VAL	unpack_vcpu_flag(EXCEPT_MASK)
+#define __EXCEPT_MASK_VAL	unpack_kvm_flag(EXCEPT_MASK)
 #define __EXCEPT_SHIFT		__builtin_ctzl(__EXCEPT_MASK_VAL)
 #define __vcpu_except_flags(_f)	iflags, (_f << __EXCEPT_SHIFT), __EXCEPT_MASK_VAL
 
@@ -907,28 +907,28 @@ struct kvm_vcpu_arch {
 #define EXCEPT_AA64_EL2_FIQ	__vcpu_except_flags(6)
 #define EXCEPT_AA64_EL2_SERR	__vcpu_except_flags(7)
 /* Guest debug is live */
-#define DEBUG_DIRTY		__vcpu_single_flag(iflags, BIT(4))
+#define DEBUG_DIRTY		__kvm_single_flag(iflags, BIT(4))
 /* Save SPE context if active  */
-#define DEBUG_STATE_SAVE_SPE	__vcpu_single_flag(iflags, BIT(5))
+#define DEBUG_STATE_SAVE_SPE	__kvm_single_flag(iflags, BIT(5))
 /* Save TRBE context if active  */
-#define DEBUG_STATE_SAVE_TRBE	__vcpu_single_flag(iflags, BIT(6))
+#define DEBUG_STATE_SAVE_TRBE	__kvm_single_flag(iflags, BIT(6))
 
 /* SVE enabled for host EL0 */
-#define HOST_SVE_ENABLED	__vcpu_single_flag(sflags, BIT(0))
+#define HOST_SVE_ENABLED	__kvm_single_flag(sflags, BIT(0))
 /* SME enabled for EL0 */
-#define HOST_SME_ENABLED	__vcpu_single_flag(sflags, BIT(1))
+#define HOST_SME_ENABLED	__kvm_single_flag(sflags, BIT(1))
 /* Physical CPU not in supported_cpus */
-#define ON_UNSUPPORTED_CPU	__vcpu_single_flag(sflags, BIT(2))
+#define ON_UNSUPPORTED_CPU	__kvm_single_flag(sflags, BIT(2))
 /* WFIT instruction trapped */
-#define IN_WFIT			__vcpu_single_flag(sflags, BIT(3))
+#define IN_WFIT			__kvm_single_flag(sflags, BIT(3))
 /* vcpu system registers loaded on physical CPU */
-#define SYSREGS_ON_CPU		__vcpu_single_flag(sflags, BIT(4))
+#define SYSREGS_ON_CPU		__kvm_single_flag(sflags, BIT(4))
 /* Software step state is Active-pending */
-#define DBG_SS_ACTIVE_PENDING	__vcpu_single_flag(sflags, BIT(5))
+#define DBG_SS_ACTIVE_PENDING	__kvm_single_flag(sflags, BIT(5))
 /* PMUSERENR for the guest EL0 is on physical CPU */
-#define PMUSERENR_ON_CPU	__vcpu_single_flag(sflags, BIT(6))
+#define PMUSERENR_ON_CPU	__kvm_single_flag(sflags, BIT(6))
 /* WFI instruction trapped */
-#define IN_WFI			__vcpu_single_flag(sflags, BIT(7))
+#define IN_WFI			__kvm_single_flag(sflags, BIT(7))
 
 
 /* Pointer to the vcpu's SVE FFR for sve_{save,load}_state() */
diff --git a/arch/arm64/kvm/hyp/exception.c b/arch/arm64/kvm/hyp/exception.c
index 424a5107cddb..6bb61e933644 100644
--- a/arch/arm64/kvm/hyp/exception.c
+++ b/arch/arm64/kvm/hyp/exception.c
@@ -320,13 +320,13 @@ static void kvm_inject_exception(struct kvm_vcpu *vcpu)
 {
 	if (vcpu_el1_is_32bit(vcpu)) {
 		switch (vcpu_get_flag(vcpu, EXCEPT_MASK)) {
-		case unpack_vcpu_flag(EXCEPT_AA32_UND):
+		case unpack_kvm_flag(EXCEPT_AA32_UND):
 			enter_exception32(vcpu, PSR_AA32_MODE_UND, 4);
 			break;
-		case unpack_vcpu_flag(EXCEPT_AA32_IABT):
+		case unpack_kvm_flag(EXCEPT_AA32_IABT):
 			enter_exception32(vcpu, PSR_AA32_MODE_ABT, 12);
 			break;
-		case unpack_vcpu_flag(EXCEPT_AA32_DABT):
+		case unpack_kvm_flag(EXCEPT_AA32_DABT):
 			enter_exception32(vcpu, PSR_AA32_MODE_ABT, 16);
 			break;
 		default:
@@ -335,15 +335,15 @@ static void kvm_inject_exception(struct kvm_vcpu *vcpu)
 		}
 	} else {
 		switch (vcpu_get_flag(vcpu, EXCEPT_MASK)) {
-		case unpack_vcpu_flag(EXCEPT_AA64_EL1_SYNC):
+		case unpack_kvm_flag(EXCEPT_AA64_EL1_SYNC):
 			enter_exception64(vcpu, PSR_MODE_EL1h, except_type_sync);
 			break;
 
-		case unpack_vcpu_flag(EXCEPT_AA64_EL2_SYNC):
+		case unpack_kvm_flag(EXCEPT_AA64_EL2_SYNC):
 			enter_exception64(vcpu, PSR_MODE_EL2h, except_type_sync);
 			break;
 
-		case unpack_vcpu_flag(EXCEPT_AA64_EL2_IRQ):
+		case unpack_kvm_flag(EXCEPT_AA64_EL2_IRQ):
 			enter_exception64(vcpu, PSR_MODE_EL2h, except_type_irq);
 			break;
 
diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index a640e839848e..a7a2540cc507 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -83,7 +83,7 @@ static void inject_abt64(struct kvm_vcpu *vcpu, bool is_iabt, unsigned long addr
 
 	esr |= ESR_ELx_FSC_EXTABT;
 
-	if (match_target_el(vcpu, unpack_vcpu_flag(EXCEPT_AA64_EL1_SYNC))) {
+	if (match_target_el(vcpu, unpack_kvm_flag(EXCEPT_AA64_EL1_SYNC))) {
 		vcpu_write_sys_reg(vcpu, addr, FAR_EL1);
 		vcpu_write_sys_reg(vcpu, esr, ESR_EL1);
 	} else {
@@ -105,7 +105,7 @@ static void inject_undef64(struct kvm_vcpu *vcpu)
 	if (kvm_vcpu_trap_il_is32bit(vcpu))
 		esr |= ESR_ELx_IL;
 
-	if (match_target_el(vcpu, unpack_vcpu_flag(EXCEPT_AA64_EL1_SYNC)))
+	if (match_target_el(vcpu, unpack_kvm_flag(EXCEPT_AA64_EL1_SYNC)))
 		vcpu_write_sys_reg(vcpu, esr, ESR_EL1);
 	else
 		vcpu_write_sys_reg(vcpu, esr, ESR_EL2);
diff --git a/arch/arm64/kvm/mmio.c b/arch/arm64/kvm/mmio.c
index ab365e839874..1728e37739fe 100644
--- a/arch/arm64/kvm/mmio.c
+++ b/arch/arm64/kvm/mmio.c
@@ -79,17 +79,17 @@ static bool kvm_pending_sync_exception(struct kvm_vcpu *vcpu)
 
 	if (vcpu_el1_is_32bit(vcpu)) {
 		switch (vcpu_get_flag(vcpu, EXCEPT_MASK)) {
-		case unpack_vcpu_flag(EXCEPT_AA32_UND):
-		case unpack_vcpu_flag(EXCEPT_AA32_IABT):
-		case unpack_vcpu_flag(EXCEPT_AA32_DABT):
+		case unpack_kvm_flag(EXCEPT_AA32_UND):
+		case unpack_kvm_flag(EXCEPT_AA32_IABT):
+		case unpack_kvm_flag(EXCEPT_AA32_DABT):
 			return true;
 		default:
 			return false;
 		}
 	} else {
 		switch (vcpu_get_flag(vcpu, EXCEPT_MASK)) {
-		case unpack_vcpu_flag(EXCEPT_AA64_EL1_SYNC):
-		case unpack_vcpu_flag(EXCEPT_AA64_EL2_SYNC):
+		case unpack_kvm_flag(EXCEPT_AA64_EL1_SYNC):
+		case unpack_kvm_flag(EXCEPT_AA64_EL2_SYNC):
 			return true;
 		default:
 			return false;
-- 
2.34.1


