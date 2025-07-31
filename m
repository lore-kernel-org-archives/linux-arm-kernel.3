Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A37EC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 21:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUXB20g5KTDpVxkdi+cD6LrJ9ZPidMR3ejh7YHbLbWc=; b=Mtn3WUFlhJ6KhETvqg7VHgahaN
	y5efAdhcLB5ZEd5+H/N6cdzG+Xu3aGji8bkJ7kpMFePv6ETFIczGCekLT4HtrJJ3x1zX4Lbeh2mXy
	28Nq2Z/BuAGG94X5+dVoLpjgwREP1AmbH8NnCRAt3toU5iEvqcW6KtJ5bcL8+5ZkVJcrtFQ0JjsGf
	HhABNITISpMK5AD0OjpxHofV+3/rzbhwKl6fq1ehLkjvMXRlC9/iBBveWjdtKQNw922RqShu0nk4A
	GwjTXL40SjZomBzgT0D8LSDWiBpoy4ghMLWooIrZiLQHpunvPB/FaWHRgZNRRkqoY8k0QnWiV61Ws
	6RPGBdRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhaWr-00000004R3U-2Q6f;
	Thu, 31 Jul 2025 21:09:33 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhaMd-00000004PPd-0gru
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 20:59:00 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-31ea14cc097so800721a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 13:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753995538; x=1754600338; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eUXB20g5KTDpVxkdi+cD6LrJ9ZPidMR3ejh7YHbLbWc=;
        b=bCQildnMKdvpEnkJ3tTpwB+we30ispQiljJz1h99oL4J1nCeCjgC4hW8dOxE6H5D8F
         LKFdaAfvycR/qvWYVqtbguZpGPyT/ZZS01AWkfgpTksAkM1J/B2pCBZVGd5pt/1GF7PU
         IT3UgnM5ZMi0eR74/QQlEUJz5Z2ZxNm8HeNRtTKDuEQqeR8FhIojoQoP5N/f25NLrO98
         O5WlWMpxqKrnwXfWuWiQ9vLocvpVhEXSLEGzoCpKllfi0wOLHSYgdsRantgoYxuL9iK+
         2xbeZUPkO8PRokVABlP+rI71mcNs+1M8iwsI8jBaBYOOm5aENUMZUOVhmMccnEL8KH8O
         VQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753995538; x=1754600338;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eUXB20g5KTDpVxkdi+cD6LrJ9ZPidMR3ejh7YHbLbWc=;
        b=kXlSDLMndhoHZQiNmdd3aYnxrdxcAveL+0nLfjJBialF9G2MIKkNOkOivnQL3dIWd3
         wjV7mZUgeCt3LtqLxqj66h+w0LtWP7x/3VGIEjLXdLmr35Jb7V9lyRiF73Vl98dtthqT
         Uu10gefPWYMfcgg+m+wPNJEB/IFZFRplXw/DZHPZ6kOwwYwfwvv+Quc8nqRmjGnLHS5i
         sodHvm6QhYb7kxa3IWyBJcesAeEm27YPe7oV4uKGet4lsVGsLasNXqPj2PRTRc13Dd+O
         AqG52biMq53FxHTGAW2jrnYAuXcVra03tvw6YWh99wBnT6YnuGGzInTd+6llbdwnlAjk
         fKCg==
X-Forwarded-Encrypted: i=1; AJvYcCWfznEVp+iOUQqCegLuWSSR6ut708slmRndJ7GDxys/ybzgeuxnVVHgxSQgmgBvzhuae/nVjvPy+wR8Hp2Q4w4g@lists.infradead.org
X-Gm-Message-State: AOJu0YzZSrVp/G311BCZxb9hkWIXQs3lmkExKj7FEOq9oGo8fBFGudhB
	1v6esGbzSUBxK52HBUhTJwO+r+2+UsEAAIrvJ1m77dJS4mkEmW9n3R6Vyd3SZcjrk1Nm7pJ1157
	xEl+zFwru9WnbMg==
X-Google-Smtp-Source: AGHT+IHpN+KMEdudZzx9R+o2+YGbSRX7Sb8ugKl+/4e/Osfparz535RYvSTWw1nMv5ihMLOYXj3j/6PFJN9K4g==
X-Received: from pjtq5.prod.google.com ([2002:a17:90a:c105:b0:31c:2fe4:33bc])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2b46:b0:315:9cae:bd8 with SMTP id 98e67ed59e1d1-31f5de3f47dmr11403605a91.23.1753995538407;
 Thu, 31 Jul 2025 13:58:58 -0700 (PDT)
Date: Thu, 31 Jul 2025 20:58:44 +0000
In-Reply-To: <20250731205844.1346839-1-jiaqiyan@google.com>
Mime-Version: 1.0
References: <20250731205844.1346839-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250731205844.1346839-4-jiaqiyan@google.com>
Subject: [PATCH v3 3/3] Documentation: kvm: new UAPI for handling SEA
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
X-CRM114-CacheID: sfid-20250731_135859_209293_6CF947FB 
X-CRM114-Status: GOOD (  18.80  )
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

Document the new userspace-visible features and APIs for handling
synchronous external abort (SEA)
- KVM_CAP_ARM_SEA_TO_USER: How userspace enables the new feature.
- KVM_EXIT_ARM_SEA: exit userspace gets when it needs to handle SEA
  and what userspace gets while taking the SEA.

Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
---
 Documentation/virt/kvm/api.rst | 61 ++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 53e0179d52949..b61bca10a3a10 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -7231,6 +7231,55 @@ exit, even without calls to ``KVM_ENABLE_CAP`` or similar.  In this case,
 it will enter with output fields already valid; in the common case, the
 ``unknown.ret`` field of the union will be ``TDVMCALL_STATUS_SUBFUNC_UNSUPPORTED``.
 Userspace need not do anything if it does not wish to support a TDVMCALL.
+
+::
+		/* KVM_EXIT_ARM_SEA */
+		struct {
+			__u64 esr;
+			#define KVM_EXIT_ARM_SEA_FLAG_GPA_VALID   (1ULL << 0)
+			__u64 flags;
+			__u64 gva;
+			__u64 gpa;
+		} arm_sea;
+
+Used on arm64 systems. When the VM capability KVM_CAP_ARM_SEA_TO_USER is
+enabled, a VM exit is generated if guest causes a synchronous external abort
+(SEA) and the host APEI fails to handle the SEA.
+
+Historically KVM handles SEA by first delegating the SEA to host APEI as there
+is high chance that the SEA is caused by consuming uncorrected memory error.
+However, not all platforms support SEA handling in APEI, and KVM's fallback
+handling is to inject an async SError into the guest, which usually panics
+guest kernel unpleasantly. As an alternative, userspace can participate in
+the SEA handling by enabling KVM_CAP_ARM_SEA_TO_USER at VM creation, after
+querying the capability. Once enabled, when KVM has to handle the guest
+caused SEA, it returns to userspace with KVM_EXIT_ARM_SEA, with details
+about the SEA available in 'arm_sea'.
+
+The 'esr' field holds the value of the exception syndrome register (ESR) while
+KVM taking the SEA, which tells userspace the character of the current SEA,
+such as its Exception Class, Synchronous Error Type, Fault Specific Code and
+so on. For more details on ESR, check the Arm Architecture Registers
+documentation.
+
+The following values are defined for the 'flags' field
+
+  - KVM_EXIT_ARM_SEA_FLAG_GPA_VALID -- the faulting guest physical address
+    is valid and userspace can get its value in the 'gpa' field.
+
+Note userspace can tell whether the faulting guest virtual address is valid
+from the FnV bit in 'esr' field. If FnV bit in 'esr' field is not set, the
+'gva' field holds the valid faulting guest virtual address.
+
+Userspace needs to take actions to handle guest SEA synchronously, namely in
+the same thread that runs KVM_RUN and receives KVM_EXIT_ARM_SEA. One of the
+encouraged approach is to utilize the KVM_SET_VCPU_EVENTS to inject the SEA
+to the faulting VCPU. This way, the guest has the opportunity to keep running
+and limit the blast radius of the SEA to the particular guest application that
+caused the SEA. Userspace may also emulate the SEA to VM by itself using the
+KVM_SET_ONE_REG API. In this case, it can use the valid values from 'gva' and
+'gpa' fields to manipulate VCPU's registers (e.g. FAR_EL1, HPFAR_EL1).
+
 ::
 
 		/* Fix the size of the union. */
@@ -8625,6 +8674,18 @@ This capability indicate to the userspace whether a PFNMAP memory region
 can be safely mapped as cacheable. This relies on the presence of
 force write back (FWB) feature support on the hardware.
 
+7.45 KVM_CAP_ARM_SEA_TO_USER
+----------------------------
+
+:Architecture: arm64
+:Target: VM
+:Parameters: none
+:Returns: 0 on success, -EINVAL if unsupported.
+
+This capability, if KVM_CHECK_EXTENSION indicates that it is available, means
+that KVM has an implementation that allows userspace to participate in handling
+synchronous external abort caused by VM, by an exit of KVM_EXIT_ARM_SEA.
+
 8. Other capabilities.
 ======================
 
-- 
2.50.1.565.gc32cd1483b-goog


