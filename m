Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D90C3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 19:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1yNW4zWWpO6G9+zdCVIjhXgj8P623/AU8qHzqkHrm1A=; b=SCfQrP/cQRH1VhNrRyZMVHJzPs
	dlFsUwfmHV+8BCvRQwytX0zmoX/ro3XOTfkYC9M2ZCEiP49I8Gq26Y08Og/Qa8dPU0J5UFNO6rgIY
	zTFabHd8MrLISxuPZH9d9BQSAVV0HaDCA+mgf7BeqZIfVngjTYH4riFBDMOcYTYfwOo6CGkF9Lee/
	c0LVMFxSB1LrIZCBAZZNoSKRcYmkZNq9kCKyOEBbczVF2ztaCJOvNMQcbERcCYEaSWEBdY42cApss
	9C2S8D4SIBbG9iybTyEquTNGnDd0MDRSnMI8epCyv/IVKBfPlQem7kHl5722ooC8T848hfBY2qUpJ
	GzovxdAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFI0u-0000000GCQm-3Blp;
	Wed, 14 May 2025 19:43:36 +0000
Received: from mail-io1-xd4a.google.com ([2607:f8b0:4864:20::d4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFHg8-0000000GA11-1UIZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 19:22:09 +0000
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-86463467dddso13021239f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 12:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747250527; x=1747855327; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1yNW4zWWpO6G9+zdCVIjhXgj8P623/AU8qHzqkHrm1A=;
        b=X/BCvx3g1OoLID3nlujP4v0VirRLKnsnpqYB6fLOOjFvE8L6xTMlocS4H8nL5QkwTx
         97fD5cy0ryfHb/7cQoyvryElKBqyHUKkUWm1odKFCC5wOybm2Ismg8JOf+crJ9120gWl
         Z87NSIEaDrswSXj+zLwMg194v/zwazpuVOUCMVZjM35bqIlGRsR6rze6kZo0pmd/lFro
         PG2ibV+ry4dU+I2fpR34830WtsPIiPXkunmvKVIGiJSGbI+NuBhd8GpZvuGtCCSTP5tL
         4P+4VpSKkqTlvFsFk6DVDqSV+KTCEPxQuQYEPP7+DLl8bRyrthriHjaUFwK6tRJa7U98
         hAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250527; x=1747855327;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1yNW4zWWpO6G9+zdCVIjhXgj8P623/AU8qHzqkHrm1A=;
        b=OTAHxqP3qpsHbbJwRTWc/b1J5a+ZbrWsqlrryc0yYKTwHLCnwRAGlRIeWwye9iNDY2
         A61yKwDVMo58K3HlsWIgKHaFy6BGgIW1jUGDV5jKX7aVZtBvDD4tKLghpZyvg/oXLrVG
         PjrGbpjlUnyUbyyx6drxiMmNJN7r3NLVDq9KjrZldoM63nsTs0tRUY6xZY8a1WkpU2eS
         jB3tta3vy5HmQavSpaghshtoG13miUCK+wSmXuPjUSvdvAUglu/JY1SKl3HfrZuLRX4F
         NsobeyIoO67RJ9kbSSE4rpUotftdT9ReaxninlDbXtWLokXsjG2tIU58ix4qFaXNUzzC
         lHlg==
X-Forwarded-Encrypted: i=1; AJvYcCWfcXMAaV50WbAGRkhdOR8J2g9k295jRmxZFhGJL+wTK/KylHjIn3a6ohi2fDNiAJY38dmj4fN3UsnYOGGALNDv@lists.infradead.org
X-Gm-Message-State: AOJu0YxfJ0KaUfsI33N68MV8XNvmF/7Jj5dRfLe3sZEWnmwXmY6NjKdF
	Q/ho9xobcp8m6qUnfm2yb0HX41XZvj1xZ1q3sdRXQpybxmLxSprtryjRCsjDEWE2htGOpWOy2Uk
	pNPKqxw==
X-Google-Smtp-Source: AGHT+IFKQuF2BacC5AkCgJDM9pP+9hGGYSCBt0jtM4p1OPWuCYZziCJSB8eP4NMiOU8nR7NLUAah4kaGb+Oi
X-Received: from ilbbs4.prod.google.com ([2002:a05:6e02:2404:b0:3db:6e7d:fedf])
 (user=rananta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:3997:b0:864:4b3a:9e3a
 with SMTP id ca18e2360f4ac-86a08e6ef17mr571479539f.13.1747250527190; Wed, 14
 May 2025 12:22:07 -0700 (PDT)
Date: Wed, 14 May 2025 19:21:58 +0000
In-Reply-To: <20250514192159.1751538-1-rananta@google.com>
Mime-Version: 1.0
References: <20250514192159.1751538-1-rananta@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250514192159.1751538-3-rananta@google.com>
Subject: [PATCH 2/3] docs: kvm: devices/arm-vgic-v3: Document
 KVM_DEV_ARM_VGIC_CONFIG_GICV4 attr
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
Cc: Raghavendra Rao Anata <rananta@google.com>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_122208_390993_E4671778 
X-CRM114-Status: GOOD (  13.02  )
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

Document the KVM_DEV_ARM_VGIC_CONFIG_GICV4 attr under
KVM_DEV_ARM_VGIC_GRP_CTRL, that includes the values supported to set/get
and the expected error returns.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
---
 .../virt/kvm/devices/arm-vgic-v3.rst          | 24 +++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/Documentation/virt/kvm/devices/arm-vgic-v3.rst b/Documentation/virt/kvm/devices/arm-vgic-v3.rst
index e860498b1e35..2eed2ac13542 100644
--- a/Documentation/virt/kvm/devices/arm-vgic-v3.rst
+++ b/Documentation/virt/kvm/devices/arm-vgic-v3.rst
@@ -240,17 +240,33 @@ Groups:
       save all LPI pending bits into guest RAM pending tables.
 
       The first kB of the pending table is not altered by this operation.
+    KVM_DEV_ARM_VGIC_CONFIG_GICV4
+      attribute to enable/disable vGICv4 for a VM. It supports three values:
+      KVM_DEV_ARM_VGIC_CONFIG_GICV4_UNAVAILABLE: Kernel is not booted with
+      'kvm-arm.vgic_v4_enable=1' cmdline, and hence vGICv4 is unavailable to
+      the VM. The value can only be read by the userspace, but cannot be set.
+      KVM_DEV_ARM_VGIC_CONFIG_GICV4_ENABLE: Kernel is booted with
+      'kvm-arm.vgic_v4_enable=1' cmdline, and vGICv4 is available and enabled
+      for the VM (default config). Userspace can get and set this value.
+      KVM_DEV_ARM_VGIC_CONFIG_GICV4_DISABLE: Kernel is booted with
+      'kvm-arm.vgic_v4_enable=1' cmdline, and vGICv4 is available and disabled
+      for the VM. Userspace can get and set this value.
+
 
   Errors:
 
-    =======  ========================================================
+    =======  ==================================================================
     -ENXIO   VGIC not properly configured as required prior to calling
-             this attribute
+             this attribute or trying to enable/disable vGICv4 for the VM
+             on a vGICv3 configuration in the case of
+             KVM_DEV_ARM_VGIC_CONFIG_GICV4
+    -EINVAL  Invalid configuration supplied by userspace
     -ENODEV  no online VCPU
     -ENOMEM  memory shortage when allocating vgic internal data
     -EFAULT  Invalid guest ram access
-    -EBUSY   One or more VCPUS are running
-    =======  ========================================================
+    -EBUSY   One or more VCPUS are running or vGIC has already been initialized
+             in the case of KVM_DEV_ARM_VGIC_CONFIG_GICV4
+    =======  ==================================================================
 
 
   KVM_DEV_ARM_VGIC_GRP_LEVEL_INFO
-- 
2.49.0.1101.gccaa498523-goog


