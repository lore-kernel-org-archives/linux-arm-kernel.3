Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A952CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 08:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qbz6//JmwfMRati7yJIqKJVh8kAD+ori3Lhbs5JEXXs=; b=JdTCvDxo+/mtBew/cjL0BoX0K4
	XjKsL3AsKL0pouOs/hLQVE3dJlM/ihWX5EWNR4/7jhot3SRX/9ZfmQ5lphxTwjrqWGf5gtufMCA1h
	0nKoGohfATCi5BxQURA9a9NVqtdn8QrRdEYoriI6hDekVjjehuXEVvU+NdMgJhj85KWuYAXFopj09
	G+ELRUqR/4PsuGnP8rPTnj2wh1v6196gXZ85fF+W19gy6ZWXUzUSgJaTf1PW+aBjyI2mfIvhs9cBB
	foa03rP4xS3zucoHUQqE+SGETOAHQ6YwTL2L60oPs283Bk4Po5xYlmLQDJMtaOWwqS9qqPj7CEqzm
	XtFZ2SPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6Em-00000005qkM-0IlU;
	Fri, 09 Oct 2026 08:45:56 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6Ef-00000005qfh-34vR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 08:45:51 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-495689bfcc8so48987665e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 01:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791535547; x=1792140347; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qbz6//JmwfMRati7yJIqKJVh8kAD+ori3Lhbs5JEXXs=;
        b=DCSNdg1a9DosGu7oMQJhiRctcALASJnf/p9WYmQjcZ53hYyaUbld2OZC0URJzt/sHO
         KqNZuSzFMCbW023gVkZUZTM3XohV4EFoHgWCscvcYcHOM8U6nkBQtCuuoXafhaGIs9M0
         MqhcNAFpu13iFzz5ofIEArHxgngI9gwWSnkohYNfeJSwApcecopga8rBJEG2rBI+XFL9
         i9EinZm3W+xnX+ExgVoKZdYpRb1nsH3ndWTCdQ9QNgRSSgIavp7u3kK6s2IAJqGLaDZp
         9skuo/4fiW9roxXFhD3//1LYS19qpW6j0EmEJzA3TtuOIrT+bB3cxZBZSHXCDrMTe5n9
         rkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791535547; x=1792140347;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qbz6//JmwfMRati7yJIqKJVh8kAD+ori3Lhbs5JEXXs=;
        b=riBv/Si6cqp0OOPcPNzBzbcLpIH6aFuZ9lA7+UZSyz+E+ISG0FE1V07xYkMqYbQ+5S
         ik2GYIU5CMVg3jG4EeSMzVBhS9cQIo5iJwUTJIoEyRcb5y+OC1z55tpOzOwNTmTZeK4Z
         M5dGGY/N9P5ki6FJaKovV6tccrta3FyxqkVFksZL0z/vEsBd5m6MYHV9jnyoo0OeMks6
         W+HfdrbzYDoxOop5JMBiMfv1OrYeiflqmIkPKhNMdTimbmYI0FwTqJQOhehwecufH0tc
         BdzTuHvUh3Yy4C37YmpiuL+YD4I0E+zDiTDZjPAy0DznUH8fvxUqegxqcPa8jOPNUgPt
         AmxQ==
X-Forwarded-Encrypted: i=1; AKwUvByCq+FTrLVwSYKo9VOXbgff8oMTiJ5yaywPkuZk8XaGi1dOW3i47wJR+ZrVFZ61zTV1ReGvKr9OVLZMQqEYSpW7@lists.infradead.org
X-Gm-Message-State: AFuF++lLV3bfhm6rE+dGkUbmiD9zFbMk6cj5E8zfYvt9X9AIr++3ufg8
	00EUN6hKQ38WIMdLqK8M54fVn9E89r41Kdo+2rIawu2GQ5iEZMqOFM4Anfnj8Oi07G2ZRl/xOOe
	OEdTiLMAjZt4sMx8OLKRp+A==
X-Received: from wmco24.prod.google.com ([2002:a05:600c:a318:b0:4a1:8915:6ed2])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:e557:20b0:49f:dd9f:6038 with SMTP id 5b1f17b1804b1-4a18e4bff94mr12611255e9.25.1791535547075;
 Fri, 09 Oct 2026 01:45:47 -0700 (PDT)
Date: Fri,  9 Oct 2026 09:45:27 +0100
In-Reply-To: <20261009084529.462577-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20261009084529.462577-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261009084529.462577-2-vdonnefort@google.com>
Subject: [PATCH v1 1/3] KVM: arm64: Add ESR class to the hyp_enter hyp event
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_014549_827660_FAE35DE9 
X-CRM114-Status: GOOD (  18.03  )
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

Give a more detailed reason the hyp has been entered by reading the ESR
class when relevant (that is on trap). Encode the ESR class directly
into the existing reason field.

To distinguish between a trap from host and from guest, add a "from="
field, which has 3 possibilities: "host", "vcpu" or "firmware". This
value can be deducted based on the existing vcpu field.

Finally, add a "to=" field to the hyp_exit event to mirror "hyp_enter".

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/include/asm/kvm_hypevents.h | 21 ++++++-----
 arch/arm64/kvm/hyp/nvhe/hyp-main.c     |  7 +---
 arch/arm64/kvm/hyp/nvhe/psci-relay.c   |  2 +-
 arch/arm64/kvm/hyp/nvhe/switch.c       |  6 ++-
 arch/arm64/kvm/hyp_trace.c             | 52 ++++++++++++++++++++------
 5 files changed, 59 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_hypevents.h b/arch/arm64/include/asm/kvm_hypevents.h
index 5f6e6789d121..96985c93a15e 100644
--- a/arch/arm64/include/asm/kvm_hypevents.h
+++ b/arch/arm64/include/asm/kvm_hypevents.h
@@ -10,15 +10,10 @@
 #ifndef __HYP_ENTER_EXIT_REASON
 #define __HYP_ENTER_EXIT_REASON
 enum hyp_enter_exit_reason {
-	HYP_REASON_SMC,
-	HYP_REASON_HVC,
-	HYP_REASON_SYS,
+	HYP_REASON_SMC = ESR_ELx_EC_MAX + 1,
 	HYP_REASON_PSCI,
-	HYP_REASON_HOST_ABORT,
-	HYP_REASON_GUEST_EXIT,
-	HYP_REASON_ERET_HOST,
-	HYP_REASON_ERET_GUEST,
-	HYP_REASON_UNKNOWN	/* Must be last */
+	HYP_REASON_IRQ,
+	HYP_REASON_ERET,
 };
 #endif
 
@@ -32,7 +27,10 @@ HYP_EVENT(hyp_enter,
 		__entry->reason = reason;
 		__entry->vcpu = __tracing_get_vcpu_pid(host_ctxt);
 	),
-	HE_PRINTK("reason=%s vcpu=%d", __hyp_enter_exit_reason_str(__entry->reason), __entry->vcpu)
+	HE_PRINTK("from=%s reason=%s vcpu=%d",
+		  __hyp_enter_exit_str(__entry->reason, __entry->vcpu),
+		  __hyp_enter_exit_reason_str(__entry->reason),
+		  __entry->vcpu)
 );
 
 HYP_EVENT(hyp_exit,
@@ -45,7 +43,10 @@ HYP_EVENT(hyp_exit,
 		__entry->reason = reason;
 		__entry->vcpu = __tracing_get_vcpu_pid(host_ctxt);
 	),
-	HE_PRINTK("reason=%s vcpu=%d", __hyp_enter_exit_reason_str(__entry->reason), __entry->vcpu)
+	HE_PRINTK("to=%s reason=%s vcpu=%d",
+		  __hyp_enter_exit_str(__entry->reason, __entry->vcpu),
+		  __hyp_enter_exit_reason_str(__entry->reason),
+		  __entry->vcpu)
 );
 
 HYP_EVENT(selftest,
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index ac64a036b0a9..76d08c503dc0 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -1112,23 +1112,20 @@ void handle_trap(struct kvm_cpu_context *host_ctxt)
 {
 	u64 esr = read_sysreg_el2(SYS_ESR);
 
+	trace_hyp_enter(host_ctxt, ESR_ELx_EC(esr));
 
 	switch (ESR_ELx_EC(esr)) {
 	case ESR_ELx_EC_HVC64:
-		trace_hyp_enter(host_ctxt, HYP_REASON_HVC);
 		handle_host_hcall(host_ctxt);
 		break;
 	case ESR_ELx_EC_SMC64:
-		trace_hyp_enter(host_ctxt, HYP_REASON_SMC);
 		handle_host_smc(host_ctxt);
 		break;
 	case ESR_ELx_EC_IABT_LOW:
 	case ESR_ELx_EC_DABT_LOW:
-		trace_hyp_enter(host_ctxt, HYP_REASON_HOST_ABORT);
 		handle_host_mem_abort(host_ctxt);
 		break;
 	case ESR_ELx_EC_SYS64:
-		trace_hyp_enter(host_ctxt, HYP_REASON_SYS);
 		if (handle_host_mte(esr))
 			break;
 		fallthrough;
@@ -1136,5 +1133,5 @@ void handle_trap(struct kvm_cpu_context *host_ctxt)
 		BUG();
 	}
 
-	trace_hyp_exit(host_ctxt, HYP_REASON_ERET_HOST);
+	trace_hyp_exit(host_ctxt, HYP_REASON_ERET);
 }
diff --git a/arch/arm64/kvm/hyp/nvhe/psci-relay.c b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
index e20db999e328..c771c1d150c4 100644
--- a/arch/arm64/kvm/hyp/nvhe/psci-relay.c
+++ b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
@@ -213,7 +213,7 @@ static void __noreturn __kvm_host_psci_cpu_entry(unsigned long pc, unsigned long
 	write_sysreg_el1(INIT_SCTLR_EL1_MMU_OFF, SYS_SCTLR);
 	write_sysreg(INIT_PSTATE_EL1, SPSR_EL2);
 
-	trace_hyp_exit(host_ctxt, HYP_REASON_PSCI);
+	trace_hyp_exit(host_ctxt, HYP_REASON_ERET);
 	__host_enter(host_ctxt);
 }
 
diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index 7318e3e6a5f3..cf4de8287b97 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -324,13 +324,15 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
 	__debug_switch_to_guest(vcpu);
 
 	do {
-		trace_hyp_exit(host_ctxt, HYP_REASON_ERET_GUEST);
+		trace_hyp_exit(host_ctxt, HYP_REASON_ERET);
 
 		/* Jump in the fire! */
 		exit_code = __guest_enter(vcpu);
 
 		/* And we're baaack! */
-		trace_hyp_enter(host_ctxt, HYP_REASON_GUEST_EXIT);
+		trace_hyp_enter(host_ctxt,
+				ARM_EXCEPTION_CODE(exit_code) == ARM_EXCEPTION_IRQ ?
+				HYP_REASON_IRQ : ESR_ELx_EC(read_sysreg_el2(SYS_ESR)));
 	} while (fixup_guest_exit(vcpu, &exit_code));
 
 	__sysreg_save_state_nvhe(guest_ctxt);
diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index 9644c424819b..e47b91bf3ae1 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -400,25 +400,55 @@ static struct trace_remote_callbacks trace_remote_callbacks = {
 	.enable_event		= hyp_trace_enable_event,
 };
 
+static const char *__hyp_enter_exit_str(u8 reason, pid_t vcpu);
 static const char *__hyp_enter_exit_reason_str(u8 reason);
 
 #include <asm/kvm_define_hypevents.h>
 
+static const char *__hyp_enter_exit_str(u8 reason, pid_t vcpu)
+{
+	switch (reason) {
+	case 0 ... ESR_ELx_EC_MAX:
+	case HYP_REASON_IRQ:
+	case HYP_REASON_ERET:
+		return vcpu ? "vcpu" : "host";
+	case HYP_REASON_SMC:
+	case HYP_REASON_PSCI:
+		return "firmware";
+	default:
+		return "unknown";
+	}
+}
+
 static const char *__hyp_enter_exit_reason_str(u8 reason)
 {
-	static const char strs[][12] = {
-		"smc",
-		"hvc",
-		"sys",
-		"psci",
-		"host_abort",
-		"guest_exit",
-		"eret_host",
-		"eret_guest",
-		"unknown",
+	static const struct trace_print_flags class[] = {
+		kvm_arm_exception_class
 	};
 
-	return strs[min(reason, HYP_REASON_UNKNOWN)];
+	if (reason <= ESR_ELx_EC_MAX) {
+		int i;
+
+		for (i = 0; i < ARRAY_SIZE(class); i++) {
+			if (class[i].mask == reason)
+				return class[i].name;
+		}
+
+		return "UNKNOWN_ESR";
+	}
+
+	switch (reason) {
+	case HYP_REASON_SMC:
+		return "SMC";
+	case HYP_REASON_PSCI:
+		return "PSCI";
+	case HYP_REASON_IRQ:
+		return "IRQ";
+	case HYP_REASON_ERET:
+		return "ERET";
+	default:
+		return "UNKNOWN_REASON";
+	}
 }
 
 static void __init hyp_trace_init_events(void)
-- 
2.56.0.385.gd3acb90ef8-goog


