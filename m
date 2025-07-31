Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A75C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 21:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wTjiUI3VYu0NKZoAdRBhNFbi9ic5y3o11ghK/xobY4I=; b=DrEHw6Ke96dUyp7eoxxihnGaU5
	CnN9v48LysWCGsQC0spgdJK9Fp/32GtnCnuDR73TlSNU8kP28wgJRu6DaUEGZda+mLptYSpo0NNmn
	zAIi6MS8X2gD0s4qgUIOGa7uQIqZlOuDLFKhMZszeiIsW46/y/VveakDxM2MbA3kAnbpwJGJ/2/6V
	S9sL6KGD2IIxK6LK1GsuZSdX3d/ZBVr3KnJt4n9q+exNkMrAcWqCABGPt0ebWp9an5fvzEgAQPwX7
	JmpmwcVFt+lQ/xWeeAgH6SlgA7KsPoUbLIOdbUYzfBf2XDzMp9TpycssvAqDADSlYw6SiGlw6mHt/
	kPcnGUgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhazb-00000004U4B-01tr;
	Thu, 31 Jul 2025 21:39:15 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhahD-00000004SAn-0jxO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 21:20:16 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-74928291bc3so1477913b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 14:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753996814; x=1754601614; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wTjiUI3VYu0NKZoAdRBhNFbi9ic5y3o11ghK/xobY4I=;
        b=KVFKD2yHQl+4wsBKvCXya0z4Xv+6zExUCeAW61w88MGM4fDAVi+vV87ZiWVS1vF8q9
         RL++xhgF2K1DW14fsmxsI1nTxbSZyou6Bw3aYnr0bM3G+C1tsQhT8HxQhgHJdMenfbPp
         +4sUPG878Qg7B12paZgikGU2rfZspJpjcWwzfKzZFplKFdKT7iVbYbEaLL+pbRxCOD9h
         g+41m89wkyDGaDb8yd1K6sM6h1SP9M3c0JZrpRRsaLPd4Zlj8BS4XKL7E9tDfVM4Yg8Z
         kI9ihZL0IUDvcecpWoBCZ3bvvNhOoP5C2Qmxo0v1KgR7OIZQRAMZd8NCZkN99jBfAP12
         T+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753996814; x=1754601614;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wTjiUI3VYu0NKZoAdRBhNFbi9ic5y3o11ghK/xobY4I=;
        b=kE4zX5F2ngiKtjWUk7DM17i9xBJ9oozbZ6UQ8DWOx+HhIXX+ZkhZQ7KebrVdKBRla5
         UX5Y2CTtlUTA/Wup0gTgEBH0F5lJkaONhoDs7aBSJGPRYYniX63ESkK5lOjLVl/oOvKm
         3zvOdbq4WlX/AFlHwk0AyNZnR7kOqvM53jPosTbwWc3jmiGmwrbMtvNVsqT0TlqpD0Uz
         ClZJhW4a9MaGZapUET2t7j9fwPOVHOBTu87muooKdFcvWQJ/3u/Uz0f0jx+YDkjJma46
         cyHgLnumrEQ9r7n4dDMY06NLCke2iGBofDw/7CScgeUCKi0r1IXVjeAI8taD3e4ytfMF
         RbQA==
X-Forwarded-Encrypted: i=1; AJvYcCV11VxQi1iu0B+HMKtkx6KhZNzkA4NR5rJEQ+JfShBWlawiY3DpLhCLVYiKqOFmvcuWT+bNQb62n9HiYuWeNY2C@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2vXEYfuFN79npVutw6VWhi4kq1aBxtL3mRqVKz4jQPqJhPi4p
	HZXALdoZnoTic56zVYAuZkb27ygrYnrDbcgcnBd00P//6La3UidLpTE48TfdmGXUPMAUG+4Ypif
	eYMISqM8Z0355ew==
X-Google-Smtp-Source: AGHT+IFhVSv5g3S5dWH4OHRA2GJ8bC5E6G/7J0FiOp5/CduJgl6OwVsVKsUaRoPixkC/rA/rTNfaZg5FrktJgg==
X-Received: from pguc17.prod.google.com ([2002:a65:6751:0:b0:b42:2527:fdbe])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:939f:b0:233:b51a:8597 with SMTP id adf61e73a8af0-23dc0ea7837mr14728409637.35.1753996813871;
 Thu, 31 Jul 2025 14:20:13 -0700 (PDT)
Date: Thu, 31 Jul 2025 21:20:04 +0000
In-Reply-To: <20250731212004.1437336-1-jiaqiyan@google.com>
Mime-Version: 1.0
References: <20250731212004.1437336-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250731212004.1437336-5-jiaqiyan@google.com>
Subject: [PATCH v1 4/4] Documentation: kvm: update UAPI for injecting SEA
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
X-CRM114-CacheID: sfid-20250731_142015_217694_F2C8EA27 
X-CRM114-Status: GOOD (  17.64  )
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

- KVM_CAP_ARM_INJECT_EXT_IABT: userspace can inject external
  instruction abort to guest.
- ext_abt_has_esr and ext_abt_esr: userspace can supplement ISS
  fields while injecting SEA, for both data and instruction aborts.

Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
---
 Documentation/virt/kvm/api.rst | 48 +++++++++++++++++++++++++---------
 1 file changed, 36 insertions(+), 12 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 53e0179d52949..8190ffb145c37 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -1236,9 +1236,11 @@ directly to the virtual CPU).
 		__u8 serror_pending;
 		__u8 serror_has_esr;
 		__u8 ext_dabt_pending;
+		__u8 ext_iabt_pending;
 		/* Align it to 8 bytes */
-		__u8 pad[5];
+		__u8 pad[4];
 		__u64 serror_esr;
+		__u64 ext_abt_esr;
 	} exception;
 	__u32 reserved[12];
   };
@@ -1292,20 +1294,42 @@ ARM64:
 
 User space may need to inject several types of events to the guest.
 
+Inject SError
+~~~~~~~~~~~~~
+
 Set the pending SError exception state for this VCPU. It is not possible to
 'cancel' an Serror that has been made pending.
 
-If the guest performed an access to I/O memory which could not be handled by
-userspace, for example because of missing instruction syndrome decode
-information or because there is no device mapped at the accessed IPA, then
-userspace can ask the kernel to inject an external abort using the address
-from the exiting fault on the VCPU. It is a programming error to set
-ext_dabt_pending after an exit which was not either KVM_EXIT_MMIO or
-KVM_EXIT_ARM_NISV. This feature is only available if the system supports
-KVM_CAP_ARM_INJECT_EXT_DABT. This is a helper which provides commonality in
-how userspace reports accesses for the above cases to guests, across different
-userspace implementations. Nevertheless, userspace can still emulate all Arm
-exceptions by manipulating individual registers using the KVM_SET_ONE_REG API.
+Inject SEA (synchronous external abort)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+- If the guest performed an access to I/O memory which could not be handled by
+  userspace, for example because of missing instruction syndrome decode
+  information or because there is no device mapped at the accessed IPA.
+
+- If the guest consumed an uncorrectable memory error on guest owned memory,
+  and RAS in the Trusted Firmware chooses to notify PE with SEA, KVM has to
+  handle it when host APEI is unable to claim the SEA. If userspace has enabled
+  KVM_CAP_ARM_SEA_TO_USER, KVM returns to userspace with KVM_EXIT_ARM_SEA.
+
+For the cases above, userspace can ask the kernel to replay either an external
+data abort (by setting ext_dabt_pending) or an external instruction abort
+(by setting ext_iabt_pending) into the faulting VCPU. Userspace can provide
+Instruction Specific Syndrome (ISS) in the ext_abt_esr field to supplement
+the ESR register value being injected into the faulting VCPU. KVM will use the
+address from the existing fault on the VCPU. Setting both ext_dabt_pending and
+ext_iabt_pending at the same time will return -EINVAL. Setting anything not
+being part of the ISS (bits [24:0] of ext_abt_esr) will return -EINVAL.
+
+It is a programming error to set ext_dabt_pending or ext_iabt_pending after an
+exit which was not KVM_EXIT_MMIO, KVM_EXIT_ARM_NISV or KVM_EXIT_ARM_SEA.
+Injecting SEA for data and instruction abort is only available if KVM supports
+KVM_CAP_ARM_INJECT_EXT_DABT and KVM_CAP_ARM_INJECT_EXT_IABT respectively.
+
+This is a helper which provides commonality in how userspace reports accesses
+for the above cases to guests, across different userspace implementations.
+Nevertheless, userspace can still emulate all Arm exceptions by manipulating
+individual registers using the KVM_SET_ONE_REG API.
 
 See KVM_GET_VCPU_EVENTS for the data structure.
 
-- 
2.50.1.565.gc32cd1483b-goog


