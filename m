Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCEB5C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 16:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ih0/JpStngeu2lOMQmMMElA7ojSkXNH4xy6u5tdpksc=; b=DlRjdK8rit9OqXn0DoKToTufPy
	EzgYoWxEM1tBTSmV7ubuNqYkl09NAxJ83KON/jz5uV5GXJkRGcCeXKhjD29Xbm16Ol8k9yMgkB7vN
	27CfnyxtNQVtMDW77sFA0LiBAFQ2SUkgaj5ALSWBc5bWXfgfzY2Dqvgrtp6Tq3w9AEYS/Lg6HEJOm
	KGYNyawhOmAE0DHi+sGKt6CXcU5BeRJqNkz5sUGwu768zaQQ1kB00v1mrSRd6q/HoIzzKl1ZefE6E
	Zo2x+pylnnCLN7HB4/qLe0YDIsZThltVSQHfee0GTPhXn3Uwg942l41nWJmXHpPgj0LID2SG9kYPj
	+Fpm13zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBye4-00000007yf1-3823;
	Mon, 05 May 2025 16:26:20 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uByST-00000007wKq-3Ezs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 16:14:22 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b1c122308dcso5145568a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 09:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746461660; x=1747066460; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ih0/JpStngeu2lOMQmMMElA7ojSkXNH4xy6u5tdpksc=;
        b=hd8TM/USpuBRF0Ib1Ch/JKokEnXd8OBQ+fzgFQOd2YfCMiRt8GEgSHCfLzrsXbpwTV
         l9ntVzh+RnaDbs9EDBydMNQ5QrXVwSj3ivcs33EldTUWVkcsZ+FIAH1EzDTpxEotH7/J
         nJW/OUSR0awRc6xLPez42iKAmtzc+oaWXStFSiWJWaPNVYzdwt/SBuPbpHDqZsw6ROW5
         bWOo+foRp9Ponb+EBJy4D0nR0he7m1SvOaZ2Q/gFiof210iA0bTsrx/reVjqlbs3Opv5
         KUeuuBVarg8MvE3RdAH7NL5UgGX8iprBKmiHukDyL/L7v7w+skLJ3d9TL6GVIbhex871
         xtbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746461660; x=1747066460;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ih0/JpStngeu2lOMQmMMElA7ojSkXNH4xy6u5tdpksc=;
        b=wYPsu1+SoVI8CfRpoyK4BlY+kmzCLDBBvkflbZZVyXzOPe7gPQLfff0vCCWXi6p8E9
         raPy+1doOB0vM6Aq2A6h3W79Oq166o0f9rQYn4EKvoJxAArYQN02t6+3Mt7KMW2DwBPj
         ps9pqs6m9mi5jSZwgEhLGAbLa9KP+uNMdDYnRQ+SwBa/nN///TFxzaJ6RzjkmGC4nVRw
         dAwOPXJmiI706Cg/PvhFwmNtAGNl0B2buKjdHKvn/w2QaHkFWuQ4BQXzP2Bu8hk9y7Dm
         LidewqNESIEkQ8BEqS+srSgpFC8YX8+Nr11ZUFs/EuZ0SCUp8q5+6pkZH6kHqY/Zppky
         qnKw==
X-Forwarded-Encrypted: i=1; AJvYcCXdBemeqAWqu8CMMR6pLi1FO7DujEHNsMbd4VsW+j7BMeU7B3RlB8gDYq4eGPPu8l1di7IY4QyXU+QY6p4Lhs0S@lists.infradead.org
X-Gm-Message-State: AOJu0YxssJTJT7fd+Lo5EfTKm2vA0y2U5JXsIhqxrGIcNvwdwOP0/RAp
	HyPHMHzxkARcWPBEQZyjAIWAuzbCrZtYHDfRrIRUDt6MOuJGmM/QB2mmOupCiyvMMK0qKyWmOOv
	ep2//XvQLHA==
X-Google-Smtp-Source: AGHT+IEALx06q4ifLBOjCQ9ZZOZ/gQJWNi+Q92PHdvJDeENKCM2QDj0Em0rsjG/Q7RXdhODS4FzwytaIsf6wMQ==
X-Received: from pfvo15.prod.google.com ([2002:a05:6a00:1b4f:b0:73d:b1c6:c137])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f683:b0:224:f12:3734 with SMTP id d9443c01a7336-22e1ea87368mr99744415ad.30.1746461659950;
 Mon, 05 May 2025 09:14:19 -0700 (PDT)
Date: Mon,  5 May 2025 16:14:09 +0000
In-Reply-To: <20250505161412.1926643-1-jiaqiyan@google.com>
Mime-Version: 1.0
References: <20250505161412.1926643-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250505161412.1926643-4-jiaqiyan@google.com>
Subject: [PATCH v1 3/6] KVM: arm64: Allow userspace to inject external
 instruction aborts
From: Jiaqi Yan <jiaqiyan@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	shuah@kernel.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	duenwen@google.com, rananta@google.com, jthoughton@google.com, 
	Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_091421_813107_66763559 
X-CRM114-Status: GOOD (  17.78  )
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

From: Raghavendra Rao Ananta <rananta@google.com>

When KVM returns to userspace for KVM_EXIT_ARM_SEA, the userspace is
encouraged to inject the abort into the guest via KVM_SET_VCPU_EVENTS.

KVM_SET_VCPU_EVENTS currently only allows injecting external data aborts.
However, the synchronous external abort that caused KVM_EXIT_ARM_SEA
is possible to be an instruction abort. Userspace is already able to
tell if an abort is due to data or instruction via kvm_run.arm_sea.esr,
by checking its Exception Class value.

Extend the KVM_SET_VCPU_EVENTS ioctl to allow injecting instruction
abort into the guest.

Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
---
 arch/arm64/include/uapi/asm/kvm.h |  3 ++-
 arch/arm64/kvm/arm.c              |  1 +
 arch/arm64/kvm/guest.c            | 13 ++++++++++---
 include/uapi/linux/kvm.h          |  1 +
 4 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
index ed5f3892674c7..643e8c4825451 100644
--- a/arch/arm64/include/uapi/asm/kvm.h
+++ b/arch/arm64/include/uapi/asm/kvm.h
@@ -184,8 +184,9 @@ struct kvm_vcpu_events {
 		__u8 serror_pending;
 		__u8 serror_has_esr;
 		__u8 ext_dabt_pending;
+		__u8 ext_iabt_pending;
 		/* Align it to 8 bytes */
-		__u8 pad[5];
+		__u8 pad[4];
 		__u64 serror_esr;
 	} exception;
 	__u32 reserved[12];
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 47544945fba45..dc2efb627f450 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -319,6 +319,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_ARM_IRQ_LINE_LAYOUT_2:
 	case KVM_CAP_ARM_NISV_TO_USER:
 	case KVM_CAP_ARM_INJECT_EXT_DABT:
+	case KVM_CAP_ARM_INJECT_EXT_IABT:
 	case KVM_CAP_SET_GUEST_DEBUG:
 	case KVM_CAP_VCPU_ATTRIBUTES:
 	case KVM_CAP_PTP_KVM:
diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index 2196979a24a32..4917361ecf5cb 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -825,9 +825,9 @@ int __kvm_arm_vcpu_get_events(struct kvm_vcpu *vcpu,
 		events->exception.serror_esr = vcpu_get_vsesr(vcpu);
 
 	/*
-	 * We never return a pending ext_dabt here because we deliver it to
-	 * the virtual CPU directly when setting the event and it's no longer
-	 * 'pending' at this point.
+	 * We never return a pending ext_dabt or ext_iabt here because we
+	 * deliver it to the virtual CPU directly when setting the event
+	 * and it's no longer 'pending' at this point.
 	 */
 
 	return 0;
@@ -839,6 +839,7 @@ int __kvm_arm_vcpu_set_events(struct kvm_vcpu *vcpu,
 	bool serror_pending = events->exception.serror_pending;
 	bool has_esr = events->exception.serror_has_esr;
 	bool ext_dabt_pending = events->exception.ext_dabt_pending;
+	bool ext_iabt_pending = events->exception.ext_iabt_pending;
 
 	if (serror_pending && has_esr) {
 		if (!cpus_have_final_cap(ARM64_HAS_RAS_EXTN))
@@ -852,8 +853,14 @@ int __kvm_arm_vcpu_set_events(struct kvm_vcpu *vcpu,
 		kvm_inject_vabt(vcpu);
 	}
 
+	/* DABT and IABT cannot happen at the same time. */
+	if (ext_dabt_pending && ext_iabt_pending)
+		return -EINVAL;
+
 	if (ext_dabt_pending)
 		kvm_inject_dabt(vcpu, kvm_vcpu_get_hfar(vcpu));
+	else if (ext_iabt_pending)
+		kvm_inject_pabt(vcpu, kvm_vcpu_get_hfar(vcpu));
 
 	return 0;
 }
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 79dc4676ff74b..bcf2b95b79123 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -941,6 +941,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_X86_GUEST_MODE 238
 #define KVM_CAP_ARM_WRITABLE_IMP_ID_REGS 239
 #define KVM_CAP_ARM_SEA_TO_USER 240
+#define KVM_CAP_ARM_INJECT_EXT_IABT 241
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
-- 
2.49.0.967.g6a0df3ecc3-goog


