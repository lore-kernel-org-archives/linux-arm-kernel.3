Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594A0C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 21:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3qNS6IJrJZV1lITbvwt6t07h5m493TGqR/NU0h0LQEg=; b=C3mdz0q0prwRmhNM1hx0YzifWY
	tgJddEplA2LzepNZ1XagtYMIrnuVqOS9II4aD/kNz69z0O9TjRRjhG8hftakrIiJusmqy357bGirw
	ywVRdBdP/zu/MHIdcLSzPle9yZVCOBizS1Fz8mRPdQzBwwdKeNr+irTyz9WYydkgHYrBwBbHY3dEJ
	O5XC2xB0nF29U5NE/96cC/daos3JpTVWKdPO2/cYGl055PEEIWh8VeE9IZDOpxpAdLXePB22ksJhQ
	xX14/aOhtcdp/wutVvVC/B6FYQEX93XriT6l6SaHzzmsOktTTfDPYnWM2JZ5BvBPatn1O3asUAWrE
	t/YHizsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhax4-00000004Tox-0YPZ;
	Thu, 31 Jul 2025 21:36:38 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhah8-00000004S9X-2ACx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 21:20:15 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-31f3cfdd3d3so173333a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 14:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753996809; x=1754601609; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3qNS6IJrJZV1lITbvwt6t07h5m493TGqR/NU0h0LQEg=;
        b=jJ/C3dArVuRilMUebHBYUThh45gOiFMn6ri79henKirkMLYLmvY9wd3v2+6tLy6cba
         xZ+fLU6Z32/p6Sz0oT5DVwauM2/hD2b2Pj3DMzUxViCgrQnTr6n6dBIVbmYRXJUu7DVI
         V7bDjQKa+SCy5st7uH5vjYzLihcwnnQu04h/akvqYtn6Nri/MuQYvIGVv7O69i3nGavO
         X8f9fqRoyPo38bVWgjm23UOXA5SmupT4HP6dbGypCMF/z4eBlvwRclXo25AguanmjRxU
         9FOBUfucVoCz/Rr61NilKgeSr9+N69zT4D9+yePEw1Xf1YMH7sdWJ15rYIp8Bpv4FC8E
         CSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753996809; x=1754601609;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3qNS6IJrJZV1lITbvwt6t07h5m493TGqR/NU0h0LQEg=;
        b=gaSlhrZdZYb2Lj6IxIuFIaPAvDBILPNiM54Wl/SGpRrDlTyaLxcNqiXeYM04jwoSGC
         bwzbh2pSkNWHfFJ5Dcs9gxYGOwv5PzxgdGGvDBiJed+RfeKYkDJbOm+EqNBsjkIJO9rX
         opV6epmTPuzIPy5TI55EEH5n1vHC7bNnWe00jXTBPHMO4AyI9P6tqDOcUOWwtABKgOnl
         Ioj0aVVMIiH5YJeZ5Rn2poXraCSz379xx8T6pi2SUJ/akIQD/9YuI9iRCmpA7+iXvNBs
         tyAdHo8dTb44JfMLMRemzxuuUnKa0bdowGblz2DV37QvyZddiCmtldXm3UtkW9/Sx+hc
         3D2g==
X-Forwarded-Encrypted: i=1; AJvYcCXt98OFuYEOCYUIQmkJmQEMTC/ojXuFlvWEcK1ibAek8G4X9uWUxnMopwKsGDwMixI/caa142iACzN5CbIuL8gu@lists.infradead.org
X-Gm-Message-State: AOJu0Yx632p1mlbLsIFJNuH29O24wPDmoCRPfnJe4SdLsF7ndrR16X8c
	QwjSF4zW5rcoVMLuXFRlrwfR0gq1F/elQKDANAF+YrCb6XY1a9PrUuxV/mTxuafAwcUvZr5gZqx
	icX59f6STABRDcw==
X-Google-Smtp-Source: AGHT+IGi3W8REoNKT4VRn0WWKc9QG1YF4F8owx+E1JqaZjpyHJlhcdTCOBswIo9sfFOEAW14j8Fh6YM2HTafvw==
X-Received: from pjpo9.prod.google.com ([2002:a17:90a:9f89:b0:31e:d618:a29c])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3d8f:b0:311:a314:c2d1 with SMTP id 98e67ed59e1d1-31f5dd6fd1bmr12129421a91.6.1753996809220;
 Thu, 31 Jul 2025 14:20:09 -0700 (PDT)
Date: Thu, 31 Jul 2025 21:20:01 +0000
In-Reply-To: <20250731212004.1437336-1-jiaqiyan@google.com>
Mime-Version: 1.0
References: <20250731212004.1437336-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250731212004.1437336-2-jiaqiyan@google.com>
Subject: [PATCH v1 1/4] KVM: arm64: Allow userspace to inject external
 instruction abort
From: Jiaqi Yan <jiaqiyan@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	shuah@kernel.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	rananta@google.com, Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_142010_559782_F13B619F 
X-CRM114-Status: GOOD (  17.53  )
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

When guest causes synchronous instruction external abort, VMM may
need to inject instruction abort to guest. However, KVM_SET_VCPU_EVENTS
currently only allows injecting external data aborts.

Extend the KVM_SET_VCPU_EVENTS ioctl to allow userspace injecting
instruction abort into the guest.

Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
---
 arch/arm64/include/uapi/asm/kvm.h |  3 ++-
 arch/arm64/kvm/arm.c              |  1 +
 arch/arm64/kvm/guest.c            | 15 ++++++++++-----
 include/uapi/linux/kvm.h          |  1 +
 4 files changed, 14 insertions(+), 6 deletions(-)

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
index 7a1a8210ff918..3d86d0ae7898b 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -315,6 +315,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_ARM_IRQ_LINE_LAYOUT_2:
 	case KVM_CAP_ARM_NISV_TO_USER:
 	case KVM_CAP_ARM_INJECT_EXT_DABT:
+	case KVM_CAP_ARM_INJECT_EXT_IABT:
 	case KVM_CAP_SET_GUEST_DEBUG:
 	case KVM_CAP_VCPU_ATTRIBUTES:
 	case KVM_CAP_PTP_KVM:
diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index 16ba5e9ac86c3..d3c7b5015f20e 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -826,9 +826,9 @@ int __kvm_arm_vcpu_get_events(struct kvm_vcpu *vcpu,
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
@@ -853,16 +853,21 @@ int __kvm_arm_vcpu_set_events(struct kvm_vcpu *vcpu,
 	bool serror_pending = events->exception.serror_pending;
 	bool has_esr = events->exception.serror_has_esr;
 	bool ext_dabt_pending = events->exception.ext_dabt_pending;
+	bool ext_iabt_pending = events->exception.ext_iabt_pending;
 	u64 esr = events->exception.serror_esr;
 	int ret = 0;
 
+	/* DABT and IABT cannot happen at the same time. */
+	if (ext_dabt_pending && ext_iabt_pending)
+		return -EINVAL;
 	/*
 	 * Immediately commit the pending SEA to the vCPU's architectural
 	 * state which is necessary since we do not return a pending SEA
 	 * to userspace via KVM_GET_VCPU_EVENTS.
 	 */
-	if (ext_dabt_pending) {
-		ret = kvm_inject_sea_dabt(vcpu, kvm_vcpu_get_hfar(vcpu));
+	if (ext_dabt_pending || ext_iabt_pending) {
+		ret = kvm_inject_sea(vcpu, ext_iabt_pending,
+				     kvm_vcpu_get_hfar(vcpu));
 		commit_pending_events(vcpu);
 	}
 
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index e4e566ff348b0..a7b047f95887c 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -957,6 +957,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_ARM_EL2_E2H0 241
 #define KVM_CAP_RISCV_MP_STATE_RESET 242
 #define KVM_CAP_ARM_CACHEABLE_PFNMAP_SUPPORTED 243
+#define KVM_CAP_ARM_INJECT_EXT_IABT 245
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
-- 
2.50.1.565.gc32cd1483b-goog


