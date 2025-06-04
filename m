Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFFB1C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 05:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhgMslLmRs4t+ePEWLcUkFGdBSYtjx3MY6fMyfCWERc=; b=j26wA8DzDXcYLPQ+4GiCBDWIWJ
	vTHjwXQYHoRVF5w+uovJFWxntID51Yr/dikS8A3xEtIKKf5pLjHR1+SKWkUAd3uz4GlwWjGoL1AjY
	GzTD8pHMc52L7DVGDWKEwBBjkHySaT3DKVBhPJBEu3eQHQj0gJ8pnOUjQO4DVcJx7Vt05ihI3e+Ob
	8FeGzgvW+Na9H53Za1dXJFuoW/ssv70UrV63ZKY89fGqYYQ6irkAy9Ze7H27JGn4nyLjEBM4VDfMV
	JZJpAzqaBw1e6Hmj5u2vVMj5LPR9z1oSDndyWK8XzH6fpv9qIT6hcco5cQynv5uLVnBarZJynkcrr
	acoD8lJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMgVi-0000000CcI8-26FL;
	Wed, 04 Jun 2025 05:17:58 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMgNC-0000000CbJn-2cUD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 05:09:11 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-31315427249so156632a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 22:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749013749; x=1749618549; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xhgMslLmRs4t+ePEWLcUkFGdBSYtjx3MY6fMyfCWERc=;
        b=wg8FFg9gpFzuaQXsjtETkdyIi6BtXH7HKQUGmr/Bp2Jh+LGGhHJ+sEG+qrZdti8/vr
         X81h7y5t+BfLIZDuQVRFGh97TQ4ygfWvgNbckydA7XfkgaQeDEROGJb5Dw36CNI0KpJ+
         lSClL3mesgdz2ZvDcjqg0Rkay1IQFBwRWOPJErakC4REeofRLj24v5IfRIkPN4ff+3bq
         19CjT1cGLfrEa3wmplGIHXaPrVvruJN7yISSpO78Be5QnX8wf28OAWgcJdUJi5FqCEgO
         hI6i1VrTcFXOpFfPVSdpxP41tvpaig/v0LyUEu1tkKP51bxy16MIY4Z/gSr5Y8dt5MRu
         3tXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749013749; x=1749618549;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xhgMslLmRs4t+ePEWLcUkFGdBSYtjx3MY6fMyfCWERc=;
        b=WgpWBaQZOCu2PiB+h3e3auIy6SDwIP0rjMrJig4SYJttYxMWPhgQXDWcewVbplqI3P
         GijyMBiAN7rkAE2z59bqAZ853ayj8p+8K+NY99fYl6ooe7ser1MhPqiqYyckAJsHKyq8
         9EwHm0tK/GBs6YbAM7D1uEBewg6q0SXUGDCxt2jAWhJfv0GSoG/8tbpB7CNl8uyn0BS3
         HZQmCylTfq6kxRZ04wf6NDufXmXyF+J4JIwkYpq7EuYSerEv3FY9+oDHQOCk0pxbgxVK
         s6L1qUJGLye6GIIkc5z6Bkf2OMHSo09IZBqkgh7cd2JzY4bD9rHDgvHHp4MIlaKPW7xD
         lNZw==
X-Forwarded-Encrypted: i=1; AJvYcCVxJnUz8jIBUpmv8E1u1j/h8zimNnhFT6NXdI0OZCZeXHXQ8m0YlOpmwri7pIzx858VLoZ5swcyl/QBORoiWXOs@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4aIyJZUbP7yc8KMY2Wpur7f6/WtuXCGUMIfiViSEYvD40RVNi
	EdkxJaNt/OLNUan/3Hq+4iI4mj01ZvPIuRC5/T7Ghd/3K1EGKNXVUfjFIaKkBsGZsOIijFolmfU
	h1HgAkEASxpr7Eg==
X-Google-Smtp-Source: AGHT+IEYYVafnZZHkiG6O7O7lpguUgqLHBjMZ6tioGx87coJ7IpiOn+YvorcADDV9YLWFVwLHCGsICKRIiQ8ag==
X-Received: from pjbsw7.prod.google.com ([2002:a17:90b:2c87:b0:2ea:29de:af10])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1d47:b0:30e:9349:2da2 with SMTP id 98e67ed59e1d1-31310fc4f67mr1580065a91.4.1749013748995;
 Tue, 03 Jun 2025 22:09:08 -0700 (PDT)
Date: Wed,  4 Jun 2025 05:08:58 +0000
In-Reply-To: <20250604050902.3944054-1-jiaqiyan@google.com>
Mime-Version: 1.0
References: <20250604050902.3944054-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250604050902.3944054-4-jiaqiyan@google.com>
Subject: [PATCH v2 3/6] KVM: arm64: Allow userspace to inject external
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
X-CRM114-CacheID: sfid-20250603_220910_663682_65B61AB2 
X-CRM114-Status: GOOD (  18.12  )
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

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
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
index 99e0c6c16e437..78e8a82c38cfc 100644
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
index 4fed3fdfb13d6..2fc3775ac1183 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -943,6 +943,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_ARM_EL2 240
 #define KVM_CAP_ARM_EL2_E2H0 241
 #define KVM_CAP_ARM_SEA_TO_USER 242
+#define KVM_CAP_ARM_INJECT_EXT_IABT 243
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
-- 
2.49.0.1266.g31b7d2e469-goog


