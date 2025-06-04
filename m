Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1311C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 05:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f1C4xwS1oja4BGMpJEnpH51GbWTCvJSr7fg34G4M8Z0=; b=Y8KoDP3JqN/OCozDt0np5+8GWS
	JGOh3Kbi0SPeMsm3V5HgrIwTwXVkdj4Du1eAbo2H8RvO+lDt/NI23tbtbj9PPZYgtpbh9W3NAtWsx
	mZ+PwaMvsdgh0X9EH1klgLeGUcC3bAPV3tjoytdgtwta+zMkRD0aadRgRZAGNhDieSRBmXjx2w6Z2
	9SL8PWudz0WOSNdlqOpi2RWPu30Nl9++yE3PFjdHZN72jZjug+cQv9VvdUTa0uMCIT+A3IQ4YeNLT
	ZdDgBSiJ+RTSGc84iLxMvUN+YL7CU/ziOE+smY3JJsMLasmXnQFKVZklVCby9GbMIY3+f45r7//J0
	KosEiSLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMgc5-0000000Ccnz-2wwa;
	Wed, 04 Jun 2025 05:24:33 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMgNG-0000000CbLL-0ddC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 05:09:15 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-311d067b3faso9572002a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 22:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749013753; x=1749618553; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=f1C4xwS1oja4BGMpJEnpH51GbWTCvJSr7fg34G4M8Z0=;
        b=kHzr6QUXTkyoYW+g/Nr6sQ8UoG0QVjt5+dJoIQr1n/P7slzacJFx10P2gXMU2IQzP6
         zC1x2e4te5bKiDBMJ73g4/R5lFnbRQAjUG41WaG4wZo7gi/f7HoILwCvXTnmfVecNjcn
         9vA8msMKUsABxPlUTXieGE/b87sZYKXgeRQ50hMkBln9J62Q+UP27K5G1AvmX//Fv5uT
         c525pH4UBeGudUu9VH6LUdx5vRL8wKmm67gBh5AED9aOEt7awwMcyCab1UiyVRQC1fn+
         ldFZHKxKBvbwElZt2Rn69mVC7YaxJ0aNyvBq+VH/yP0Jq6+dYhT/QEjKMWCgZA3j8Ax6
         bOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749013753; x=1749618553;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f1C4xwS1oja4BGMpJEnpH51GbWTCvJSr7fg34G4M8Z0=;
        b=Mr1p7LjKQIUHK4Fb0GdtFeEMfi6ngGpYeIpiQTAUMhLINi6XzYwryxk9eLmLRZW1yV
         biDeelNCi2dg7wm6cDQaddUIjvPFV5zMbekRXY3iFySm0H6PeQkeUQXJk/jxD8+PQco8
         AxbnFiX6rpN92jRf0/CC/EEtPRKMCS+tG0b1eYquLJFmjquo1rY2+y3dDO6o1lElRIc9
         CPQMTkKZmKReuCH08C0IhodSjHaO6kNpvroV/dbRgrHWWBuIZM4f2gZnBlICZDkSylpG
         /uiG2cVkQx6ZEI/HvtmzgGKkDAh33OZL0O/TmyezKJi2hv91Opt3Mnh85E/aihFxUjVA
         3vdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOa2hyfdcm7krR0Ty9xPSgek9j9r6pEgbx3BxfwRPcUI7BI54no0tBKWoEJ1SDLA1mmB89Q27N/oXU7bIiYPVn@lists.infradead.org
X-Gm-Message-State: AOJu0YyOVuQ4hiAJMLk6kqJXQeHMXjO9YZIFgJeDt3xm7CmF9WrYjI7K
	xvoV4XA+3qVTobU3wKvRWlEjS1Djd09PAUyoGC+X2oh2dA0Tx4pef3QhrxIQ5FKyorwl8DHz4Vm
	cMeRl7uBXl/uSgg==
X-Google-Smtp-Source: AGHT+IE37oF7FCdLRpvsoThAtQNnQsYjorBYGpuYCRvh2E+9sV6A3UsbG7Yq0ZEVRpNgSOSMEJKUi/G7O4PeZg==
X-Received: from pjbpw6.prod.google.com ([2002:a17:90b:2786:b0:311:4201:4021])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:35c6:b0:30e:ee4:3094 with SMTP id 98e67ed59e1d1-3130ccf5129mr2212286a91.1.1749013752906;
 Tue, 03 Jun 2025 22:09:12 -0700 (PDT)
Date: Wed,  4 Jun 2025 05:09:01 +0000
In-Reply-To: <20250604050902.3944054-1-jiaqiyan@google.com>
Mime-Version: 1.0
References: <20250604050902.3944054-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250604050902.3944054-7-jiaqiyan@google.com>
Subject: [PATCH v2 6/6] Documentation: kvm: new uAPI for handling SEA
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
X-CRM114-CacheID: sfid-20250603_220914_198838_ED6089EE 
X-CRM114-Status: GOOD (  27.72  )
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
- KVM_EXIT_ARM_SEA: When userspace needs to handle SEA and what
  userspace gets while taking the SEA.
- KVM_CAP_ARM_INJECT_EXT_(D|I)ABT: How userspace injects SEA to
  guest while taking the SEA.

Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
---
 Documentation/virt/kvm/api.rst | 128 +++++++++++++++++++++++++++++----
 1 file changed, 115 insertions(+), 13 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index fe3d6b5d2acca..c58ecb72a4b4d 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -1236,8 +1236,9 @@ directly to the virtual CPU).
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
@@ -1292,20 +1293,57 @@ ARM64:
 
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
+- If the guest consumed an uncorrected memory error, and RAS extension in the
+  Trusted Firmware chooses to notify PE with SEA, KVM has to handle it when
+  host APEI is unable to claim the SEA. For the following types of faults,
+  if userspace has enabled KVM_CAP_ARM_SEA_TO_USER, KVM returns to userspace
+  with KVM_EXIT_ARM_SEA:
+
+  - Synchronous external abort, not on translation table walk or hardware
+    update of translation table.
+
+  - Synchronous external abort on stage-1 translation table walk or hardware
+    update of stage-1 translation table, including all levels.
+
+  - Synchronous parity or ECC error on memory access, not on translation table
+    walk.
+
+  - Synchronous parity or ECC error on memory access on stage-1 translation
+    table walk or hardware update of stage-1 translation table, including
+    all levels.
+
+Note that external abort or ECC error on memory access on stage-2 translation
+table walk or hardware update of stage-2 translation table does not results in
+KVM_EXIT_ARM_SEA, even if KVM_CAP_ARM_SEA_TO_USER is enabled.
+
+For the cases above, userspace can ask the kernel to replay either an external
+data abort (by setting ext_dabt_pending) or an external instruction abort
+(by setting ext_iabt_pending) into the faulting VCPU. KVM will use the address
+from the existing fault on the VCPU. Setting both ext_dabt_pending and
+ext_iabt_pending at the same time will return -EINVAL.
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
 
@@ -7163,6 +7201,58 @@ The valid value for 'flags' is:
   - KVM_NOTIFY_CONTEXT_INVALID -- the VM context is corrupted and not valid
     in VMCS. It would run into unknown result if resume the target VM.
 
+::
+
+    /* KVM_EXIT_ARM_SEA */
+    struct {
+      __u64 esr;
+  #define KVM_EXIT_ARM_SEA_FLAG_GVA_VALID   (1ULL << 0)
+  #define KVM_EXIT_ARM_SEA_FLAG_GPA_VALID   (1ULL << 1)
+      __u64 flags;
+      __u64 gva;
+      __u64 gpa;
+    } arm_sea;
+
+Used on arm64 systems. When the VM capability KVM_CAP_ARM_SEA_TO_USER is
+enabled, a VM exit is generated if guest causes a synchronous external abort
+(SEA) and the host APEI fails to handle the SEA.
+
+Historically KVM handles SEA by first delegating the SEA to host APEI as there
+is high chance that the SEA is caused by consuming uncorrected memory error.
+However, not all platforms support SEA handling in APEI, and KVM's fallback
+handling is to inject an async SError into the guest, which usually panics
+guest kernel unpleasantly. As an alternative, userspace can participate into
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
+The 'flags' field indicates if the faulting addresses are valid while taking
+the SEA:
+
+  - KVM_EXIT_ARM_SEA_FLAG_GVA_VALID -- the faulting guest virtual address
+    is valid and userspace can get its value in the 'gva' field.
+  - KVM_EXIT_ARM_SEA_FLAG_GPA_VALID -- the faulting guest physical address
+    is valid and userspace can get its value in the 'gpa' field.
+
+Userspace needs to take actions to handle guest SEA synchronously, namely in
+the same thread that runs KVM_RUN and receives KVM_EXIT_ARM_SEA. One of the
+encouraged approaches is to utilize the KVM_SET_VCPU_EVENTS to inject the SEA
+to the faulting VCPU. This way, the guest has the opportunity to keep running
+and limit the blast radius of the SEA to the particular guest application that
+caused the SEA. If the Exception Class indicated by 'esr' field in 'arm_sea'
+is data abort, userspace should inject data abort. If the Exception Class is
+instruction abort, userspace should inject instruction abort. Userspace may
+also emulate the SEA to VM by itself using the KVM_SET_ONE_REG API. In this
+case, it can use the valid values from 'gva' and 'gpa' fields to manipulate
+VCPU's registers (e.g. FAR_EL1, HPFAR_EL1).
+
 ::
 
 		/* Fix the size of the union. */
@@ -8490,7 +8580,7 @@ ENOSYS for the others.
 When enabled, KVM will exit to userspace with KVM_EXIT_SYSTEM_EVENT of
 type KVM_SYSTEM_EVENT_SUSPEND to process the guest suspend request.
 
-7.37 KVM_CAP_ARM_WRITABLE_IMP_ID_REGS
+7.42 KVM_CAP_ARM_WRITABLE_IMP_ID_REGS
 -------------------------------------
 
 :Architectures: arm64
@@ -8508,6 +8598,18 @@ aforementioned registers before the first KVM_RUN. These registers are VM
 scoped, meaning that the same set of values are presented on all vCPUs in a
 given VM.
 
+7.43 KVM_CAP_ARM_SEA_TO_USER
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
2.49.0.1266.g31b7d2e469-goog


