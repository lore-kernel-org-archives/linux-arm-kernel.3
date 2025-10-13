Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA51CCD18D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 18:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QUhJwaTYTLlWJW6PvotT0NnhH894vpuEW0sON2hXEJ4=; b=PaxqVUP3pA7orJ+EimAN1A60AN
	Nlw4pMspPszagAI9weoTGq8ty9pRu6JLPf1xs0F2mppNARywIziDgneJx4ziZ9DksUc2mT0ltrjpU
	N1ADJrSFm8ikXRFwdOtCtdDqkFU1i/N+VC5Qr6qkwzxeaBUTBt0wHM2JeKyu/QgE0T1XmOUkMkNJu
	/vXErmYkX90/IrXSyEG8S8fUioTAZZE/V4/VoJoDjkoEKG+L4dM5sBhFMH6RLL2LWUwSiiyBJor+A
	hMwVWShqH14NH2/Ql3f3yplupv/xFx377VFFSrgA5BVhoeCv7BnKd2bN8lt5jGZXveloB03SpfUMU
	Y5KsWx6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8NlR-0000000EDBx-2CtF;
	Mon, 13 Oct 2025 18:59:21 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8NlM-0000000ED7L-3vyj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 18:59:18 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-32eae48beaaso8574474a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 11:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760381956; x=1760986756; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QUhJwaTYTLlWJW6PvotT0NnhH894vpuEW0sON2hXEJ4=;
        b=NdrYThw3xZgR/zLx1+9FnIRABiVhneTsjNiPDMZrWOqg8Fdryg5XtJ7COKkPgcU8Bs
         sL5e6auGNM4P0joGqlBEiNGl5eDxecHpFeg092f88gwemLUlFPlAbEm2dL33ZfG1bAij
         36zeuhappedoTRzE/wL8bFB5DmppFQJuN2ErlboWMZMO/Lj8AtJbwGZVamKXTSZiOo32
         AXC2E2qGjM7VjbyR0RXdrNUUPYCAC6H/Bsu+zOCTKAtK3yN+KBbhjfAM/SyGqEcoEijg
         MFkjtMh602d1xEhQQGQ+DZbkZVcZ9ql93MD4AnhT0dzqUJHQN94qlch8uzjnX6TeDsU6
         aq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760381956; x=1760986756;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QUhJwaTYTLlWJW6PvotT0NnhH894vpuEW0sON2hXEJ4=;
        b=VdMI2i1sfU5J5BcahCEOmKxAcB1FWXEjZr4iq5xrziH6TD43Ok7KcXQJbD4xzyL5Gd
         x4cPvEXvfDQK1rSOHOkJ69M38nWgdtzYj7CZwKgQ9Tk6MSQyMloCbNHepbt70wY4ICQv
         DAhCTAKVtFhj0krM+pi6PkmvSDZzAGK2t/Dxo+QJBom0GmrsxnlgV5Vuaxq6gVc1d4yK
         j0eqN4q4WhoHUPOKh7PPkY+oEiAbDJsobly7RoGGX2Alao7VcUqUvRylRfzjLi0+NRoo
         pr58/nE7NaNYdfX0AtGoakz4oXblDq5JROPLZw+/torI75wBzRRQ0ZmTSfip0zewIrdY
         yWJw==
X-Forwarded-Encrypted: i=1; AJvYcCWn2owIb4jDYvoDGROlHdmu8FZoCB3tiCwG7oSuspHEr+rYiFeobCZpCySDCatMXkr4KxrFUIWaBNUqn2lh90GQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwWtU3elV+G0Ul7syxebbK8eoTsNSgKtzeGpPQUwO28KTUXEHWW
	c3RSjnSXUZVLdRQxuc2r9xQIXWQSGfR4EPhVH2Qrg2loG3zWPfNa9BiUcgnSnKxm9iQM5QGHL5S
	3o2HHSDyBveoOQA==
X-Google-Smtp-Source: AGHT+IGwypBb0mDfdIn0W0YpuT1qvoN3uirrptacGmPUlbNvOoNVC+pU0bOpfORyj1duGVbXmE/Ph8TFfVXERw==
X-Received: from pjuq15.prod.google.com ([2002:a17:90a:d38f:b0:32e:ae63:2947])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1641:b0:330:4a1d:223c with SMTP id 98e67ed59e1d1-33b5116a6a6mr32151423a91.15.1760381955636;
 Mon, 13 Oct 2025 11:59:15 -0700 (PDT)
Date: Mon, 13 Oct 2025 18:59:03 +0000
In-Reply-To: <20251013185903.1372553-1-jiaqiyan@google.com>
Mime-Version: 1.0
References: <20251013185903.1372553-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.51.0.760.g7b8bcc2412-goog
Message-ID: <20251013185903.1372553-4-jiaqiyan@google.com>
Subject: [PATCH v4 3/3] Documentation: kvm: new UAPI for handling SEA
From: Jiaqi Yan <jiaqiyan@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: duenwen@google.com, rananta@google.com, jthoughton@google.com, 
	vsethi@nvidia.com, jgg@nvidia.com, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	pbonzini@redhat.com, corbet@lwn.net, shuah@kernel.org, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_115916_979536_A43D093C 
X-CRM114-Status: GOOD (  18.88  )
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
index 6ae24c5ca5598..43bc2a1d78e01 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -7272,6 +7272,55 @@ exit, even without calls to ``KVM_ENABLE_CAP`` or similar.  In this case,
 it will enter with output fields already valid; in the common case, the
 ``unknown.ret`` field of the union will be ``TDVMCALL_STATUS_SUBFUNC_UNSUPPORTED``.
 Userspace need not do anything if it does not wish to support a TDVMCALL.
+
+::
+		/* KVM_EXIT_ARM_SEA */
+		struct {
+  #define KVM_EXIT_ARM_SEA_FLAG_GPA_VALID   (1ULL << 0)
+			__u64 flags;
+			__u64 esr;
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
+is to inject an asynchronous SError into the guest, which usually panics
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
+The following values are defined for the 'flags' field
+
+  - KVM_EXIT_ARM_SEA_FLAG_GPA_VALID -- the faulting guest physical address
+    is valid and userspace can get its value in the 'gpa' field.
+
+Note userspace can tell whether the faulting guest virtual address is valid
+from the FnV bit in 'esr' field. If FnV bit in 'esr' field is not set, the
+'gva' field hols the valid faulting guest virtual address.
+
+Userspace needs to take actions to handle guest SEA synchronously, namely in
+the same thread that runs KVM_RUN and receives KVM_EXIT_ARM_SEA. One of the
+encouraged approaches is to utilize the KVM_SET_VCPU_EVENTS to inject the SEA
+to the faulting VCPU. This way, the guest has the opportunity to keep running
+and limit the blast radius of the SEA to the particular guest application that
+caused the SEA. Userspace may also emulate the SEA to VM by itself using the
+KVM_SET_ONE_REG API. In this case, it can use the valid values from 'gva' and
+'gpa' fields to manipulate VCPU's registers (e.g. FAR_EL1, HPFAR_EL1).
+
 ::
 
 		/* Fix the size of the union. */
@@ -8689,6 +8738,18 @@ This capability indicate to the userspace whether a PFNMAP memory region
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
2.51.0.760.g7b8bcc2412-goog


