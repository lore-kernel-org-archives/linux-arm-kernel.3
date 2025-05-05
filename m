Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BEFC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 17:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCRTPaLL/ddSZCO1i6dVdhSDdFDF5EjuW/HmAYg1Ry0=; b=qsErOxZE1FbqQE0g/OpByhcbzG
	h3jjaJA9tuY6hsPP3uijBiWpRUdqVYEf6mtHiJOBCZ48dLmna1WjhNo6sRsHw0TYk2cQIt9+C/EPn
	iibaXy0mazy265+12z/ifTbPxwUYolRV+0A7eCfVfM0JN3L0UVGcidF0dIfU8k7GUzXxZ6apIyc5e
	USlSs/NFsvbjNj2z2ahoiyFFDnp842s0xQzczHJPndtVJ4s2jgvCBiGRwXUzheDYrEwHCmQPtR27X
	Odc0rE3RK2x40FheE5jpPYbo44fAq2vgnEQFttn5o3zjfmMxp/MsaTtUgQvfShj4g4mTmFtL8ilZu
	VX8QgqQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBztL-00000008CrP-3JLj;
	Mon, 05 May 2025 17:46:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBySd-00000007wNi-1Keb
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 05 May 2025 16:14:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qCRTPaLL/ddSZCO1i6dVdhSDdFDF5EjuW/HmAYg1Ry0=; b=Wj/CGQu5591mr88UKcLSNCtQim
	hnAx49nZrufYwlpaH+mBx0/wcmE47iBtZD5HKzNXI4RO4bccFhU9maRB65Y/kha5Q1+zNI4LCYbLr
	zI+lEwsxFMq8ggufU5nPI4zOp52pD2ikObNgHi33XofemGBTOqir95H5VNX7t6IOX60gV3F+CqBka
	a4mR6FXGaV79s8ICoRjD02rVooWmQGTpFPa7oKA4wqIsZbRePsWAtEsPkVAd5OZZZR3G7z+RGkwWH
	XHHjeA0xo6UA40JYyBUom/IjELF2ePDoRAWxDFVKClUnldLMtSbktvkC5wn2LSZ5Ql0A13w7lSFey
	F8TlErTg==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uBySZ-0000000FVjl-24wO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 16:14:29 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-736c7df9b6cso6338875b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 09:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746461664; x=1747066464; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qCRTPaLL/ddSZCO1i6dVdhSDdFDF5EjuW/HmAYg1Ry0=;
        b=JAMiKlbADFLqY752gYiWQOF8glJgL/EMk3ZYgwSOSQ093JK71V7JehRzFv1nBwo8Vt
         MSpJ9obnMCBVVK7l2stpOm7SjNwtOcaBc9up8lP4yGt3YqxQ9nRJJicOjejk6ZErGdeE
         E6zI5qpSHZJCuqlfDcTPkyXZtx6ARDO3VsjsBKiFhJAixUAIAcx9YbFRjleMJyLitiGQ
         wrAIeKvOtQWL9Z8/ICebuyCrXMJlQy1lyX/RrSQMvVKornaBd8+k4QQxw1FJY+/TBYZF
         Vk4GwXYYq/wWugcnjzJ9cKskTAPeA4rr+oM6JMnGWwD38iRQhmh5dgEavdDw3yLoj2Xs
         cUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746461664; x=1747066464;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qCRTPaLL/ddSZCO1i6dVdhSDdFDF5EjuW/HmAYg1Ry0=;
        b=lAHUhTr9WNEVN3vIPyxj5uI2C1nSbPiLAePMuxZQ0lcZ2tNHNB3gzjzX00vAgn5r94
         ygKffAg12/tcycoY8gYxkiEG+OLHhwOFVeh5NH4nFxcd/VTEiQCZN556alo1fsm1cF5g
         +S4RzqAE8DOq6GW7OzWMCfg9U/h70AFoqVSY4OZAeJROkljrcD53Ssgi/LZTEfARCxdn
         7LykOsMtwm0ESqPafbTYRtlGMfii/Xm1xKypP+2QEg11+T1C6/igC3BPzs0UO+uWbbon
         RjfmPE/WlAttsLLUWE1a9LWNly/l+jV2rzybiYKI1ODbg1cS3xyLZv0P/0hI1yElydVn
         N3tw==
X-Forwarded-Encrypted: i=1; AJvYcCXI/R14vKXy8jhB6Qqil/uqg+bGmM9r0iw6oHOBUgt2uE729H8wRd5JP0bT1Ft+pAmCBsmcCTHvlk+10zoNLlcc@lists.infradead.org
X-Gm-Message-State: AOJu0YxMMWdHLQD2LHZ+8rzw/4kFT6BHvA/PO3Uh9ksTbST/vgh/lfMY
	1A5mV1m3Bslv9otxbKWKa3v4uH9qndVBePDx5YZVtds/Vf3wKa0syrs2H4+jCXXAheYyQkA7A2t
	nvV/hqEDoUw==
X-Google-Smtp-Source: AGHT+IE1SVeU3n4ai6CrxrMJm0u9dBQoZvk8Si1b7xa5PwydPXT87LL3o3Oqy2HVQLl3IBAbqfHn31O9UmD3SA==
X-Received: from pfbki23.prod.google.com ([2002:a05:6a00:9497:b0:73d:b1c4:5d7f])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2e9d:b0:740:6f7f:7645 with SMTP id d2e1a72fcca58-7406f7f7a1amr12841654b3a.8.1746461664178;
 Mon, 05 May 2025 09:14:24 -0700 (PDT)
Date: Mon,  5 May 2025 16:14:12 +0000
In-Reply-To: <20250505161412.1926643-1-jiaqiyan@google.com>
Mime-Version: 1.0
References: <20250505161412.1926643-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250505161412.1926643-7-jiaqiyan@google.com>
Subject: [PATCH v1 6/6] Documentation: kvm: new uAPI for handling SEA
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
X-CRM114-CacheID: sfid-20250505_171427_758168_0AA31CBB 
X-CRM114-Status: GOOD (  26.31  )
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
 Documentation/virt/kvm/api.rst | 120 +++++++++++++++++++++++++++++----
 1 file changed, 107 insertions(+), 13 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 47c7c3f92314e..fa91a123e1b88 100644
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
@@ -1292,20 +1293,52 @@ ARM64:
 
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
+  Trusted Firmware choose to notify PE with SEA, KVM has to handle it when
+  host APEI is unable to claim the SEA. For the following types of faults,
+  if userspace enabled KVM_CAP_ARM_SEA_TO_USER, KVM returns to userspace with
+  KVM_EXIT_ARM_SEA:
+
+  - Synchronous external abort, not on translation table walk or hardware
+    update of translation table.
+
+  - Synchronous external abort on translation table walk or hardware update of
+    translation table, including all levels.
+
+  - Synchronous parity or ECC error on memory access, not on translation table
+    walk.
+
+  - Synchronous parity or ECC error on memory access on translation table walk
+    or hardware update of translation table, including all levels.
+
+For the cases above, userspace can ask the kernel to replay either an external
+data abort (by setting ext_dabt_pending) or an external instruciton abort
+(by setting ext_iabt_pending) into the faulting VCPU. KVM will use the address
+from the exiting fault on the VCPU. Setting both ext_dabt_pending and
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
 
@@ -7151,6 +7184,55 @@ The valid value for 'flags' is:
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
+	    __u64 gpa;
+    } arm_sea;
+
+Used on arm64 systems. When the VM capability KVM_CAP_ARM_SEA_TO_USER is
+enabled, a VM exit is generated if guest caused a synchronous external abort
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
+The 'esr' filed holds the value of the exception syndrome register (ESR) while
+KVM taking the SEA, which tells userspace the character of the current SEA,
+such as its Exception Class, Synchronous Error Type, Fault Specific Code and
+so on. For more details on ESR, check the Arm Architecture Registers
+documentation.
+
+The 'flags' field indicates if the faulting addresses are available while
+taking the SEA:
+
+  - KVM_EXIT_ARM_SEA_FLAG_GVA_VALID -- the faulting guest virtual address
+    is valid and userspace can get its value in the 'gva' field.
+  - KVM_EXIT_ARM_SEA_FLAG_GPA_VALID -- the faulting guest physical address
+    is valid and userspace can get its value in the 'gpa' filed.
+
+Userspace needs to take actions to handle guest SEA synchronously, namely in
+the same thread that runs KVM_RUN and receives KVM_EXIT_ARM_SEA. One of the
+encouraged approaches is to utilize the KVM_SET_VCPU_EVENTS to inject the SEA
+to the faulting VCPU. This way, the guest has the opportunity to keep running
+and limit the blast radius of the SEA to the particular guest application that
+caused the SEA. If the Exception Class indicated by 'esr' field in 'arm_sea'
+is data abort, userspace should inject data abort. If the Exception Class is
+instruction abort, userspace should inject instruction abort.
+
 ::
 
 		/* Fix the size of the union. */
@@ -8478,7 +8560,7 @@ ENOSYS for the others.
 When enabled, KVM will exit to userspace with KVM_EXIT_SYSTEM_EVENT of
 type KVM_SYSTEM_EVENT_SUSPEND to process the guest suspend request.
 
-7.37 KVM_CAP_ARM_WRITABLE_IMP_ID_REGS
+7.42 KVM_CAP_ARM_WRITABLE_IMP_ID_REGS
 -------------------------------------
 
 :Architectures: arm64
@@ -8496,6 +8578,18 @@ aforementioned registers before the first KVM_RUN. These registers are VM
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
2.49.0.967.g6a0df3ecc3-goog


