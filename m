Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E2AC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 04:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u7uDKQXpUwdrzKwoUkA90P4kaViu0b/lAOUYW7NM+2o=; b=bD/UJnfQB5r77FGmE9RYv36twb
	HNiarZtTngaAX/goqFNKI2LEfUz56X1lPjJiyHO1RxhAb7pkDyS0MGnQjff2xGgYhdOX5dDo2XKET
	9umf+Tb7vVIpzdN7kxN+SwrLDAOwayYtxaINdqULHZHCJ3IaeXcbxbZCWCeo+Jja4AN5dOv2Z4Nwb
	+l4X823qOJlzD+crLDQHANe/MBCBEa9JZdh5syMLo0HTnkXVDkM8GhbKc82Ks0QmbARD0Uv9Edeac
	rtDirqznFiaaJj+H+eLqhlH5qq/pC92jTGrlwd4iJwzzLwI09sHoI6S4EpyUvaTzHAh8a2CAugrlC
	O/O3495A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRkcz-0000000926Q-1PYf;
	Wed, 18 Jun 2025 04:42:25 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRkLn-00000008zrA-0LLo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 04:24:40 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-313d346dc8dso6885441a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 21:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750220678; x=1750825478; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=u7uDKQXpUwdrzKwoUkA90P4kaViu0b/lAOUYW7NM+2o=;
        b=QR4QsagjsK99KC4LcdqZCAgDyh5gpbgrI8wmeCVHifG3cW0NzyVbsm1oIKgnvTL6qG
         T0eJ2vxD5nDPy70/2gjCOVs4jxy6kkZ4kt7+uamj3d94iahE1lmmHWzUEzZsaqJWXvQx
         Yica+a1brl6lIHi2kjrZ+9UCZI713O/V6YTQR8/IMNzGlpkqmPcy7K7oJ+YZUGW35+fr
         ZgxkZDafW1HQTQcZHiEhMjS4IWmK95kbwUq63RXlwaxQARPgsv30LT4v8Y5+ck7CfRqd
         fuxApFTnK1drfjBR94rICyIo8PB7kfRlTQ3dE/0io1UQgWvl88+cF+N9GWAN3oy14Hkm
         7YQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750220678; x=1750825478;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u7uDKQXpUwdrzKwoUkA90P4kaViu0b/lAOUYW7NM+2o=;
        b=aWUFoL5rg+MSDWbFaPlHUlc605JyenhqmBiXnpG9ktlXyw/CcalP02k8ykHCK5lQlN
         W3Wlk+g/pI+Gn0+DJS48bMtBQZly4bSGcz2aBh2ni148fPeeZToW3r6yYWBm6GLdyK7U
         5akjMWk7DNQpLIPlvI0RR6WEYMkY7ZXEMVc/jMAp03/MXMKmvlejWkTk/DxtPOceXgNO
         zKF/J5FJhkiNLfgUv2OE74wZt5iP0vVsaZ2gWfuSMNBlEpqDNLOIvVkmtncfV0Sta/Lp
         Ds6X2yAUN/6xJWG570HBxTZGucUGcT82DQ2JBcTfd+0zsZ0AUJCrytNKvdwGMp0ad1/7
         voAw==
X-Forwarded-Encrypted: i=1; AJvYcCX9WPGGA7vSzBjbTXEyw4Wqo5ddZk1bs31f/cdttIjO7MrAt5OgsZ56JqR63S80twYLKiboGnJHHsSKRveVPJ9C@lists.infradead.org
X-Gm-Message-State: AOJu0Yywg3UpgAtUzlSgxG9VppzKWSZBS2A18Rhj2ksZ1W9g0jr2CIsb
	aWdmIt73x68Pjtqlp3i6PZNn2xD6zGpOlMXNwwrDGn54+myH+MS+PBbM4SpyUaxhNBAqWiCpT6x
	cQrAd0HIWVmJjyicByty5QQ==
X-Google-Smtp-Source: AGHT+IEsvRhaA+pgvEn2VcIt6EZL6lLvB8OQlgHyuSOj5NMOQERsIQvH6ATMkLPJIOGQBvW8tdGSJDJWdEvdsdMB
X-Received: from pjbsm7.prod.google.com ([2002:a17:90b:2e47:b0:312:f650:c7aa])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2d47:b0:312:db8f:9a09 with SMTP id 98e67ed59e1d1-313f1c380f7mr29459716a91.14.1750220677882;
 Tue, 17 Jun 2025 21:24:37 -0700 (PDT)
Date: Wed, 18 Jun 2025 04:24:16 +0000
In-Reply-To: <20250618042424.330664-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20250618042424.330664-1-jthoughton@google.com>
X-Mailer: git-send-email 2.50.0.rc2.696.g1fc2a0284f-goog
Message-ID: <20250618042424.330664-8-jthoughton@google.com>
Subject: [PATCH v3 07/15] KVM: Enable and advertise support for KVM userfault exits
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Oliver Upton <oliver.upton@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_212439_122447_85D2C6F0 
X-CRM114-Status: GOOD (  10.72  )
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

Now that all architectures (arm64 and x86) that utilize "generic" page
faults also support userfault exits, advertise support for
KVM_CAP_USERFAULT and let userspace set KVM_MEM_USERFAULT in memslots.

Signed-off-by: James Houghton <jthoughton@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/uapi/linux/kvm.h | 1 +
 virt/kvm/kvm_main.c      | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index e3b871506ec85..0ba265f99f033 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -937,6 +937,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_ARM_EL2 240
 #define KVM_CAP_ARM_EL2_E2H0 241
 #define KVM_CAP_RISCV_MP_STATE_RESET 242
+#define KVM_CAP_USERFAULT 243
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index bef6760cd1c0e..2962be09d5ebf 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1604,6 +1604,9 @@ static int check_memory_region_flags(struct kvm *kvm,
 	    !(mem->flags & KVM_MEM_GUEST_MEMFD))
 		valid_flags |= KVM_MEM_READONLY;
 
+	if (IS_ENABLED(CONFIG_KVM_GENERIC_PAGE_FAULT))
+		valid_flags |= KVM_MEM_USERFAULT;
+
 	if (mem->flags & ~valid_flags)
 		return -EINVAL;
 
@@ -4881,6 +4884,9 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 	case KVM_CAP_CHECK_EXTENSION_VM:
 	case KVM_CAP_ENABLE_CAP_VM:
 	case KVM_CAP_HALT_POLL:
+#ifdef CONFIG_KVM_GENERIC_PAGE_FAULT
+	case KVM_CAP_USERFAULT:
+#endif
 		return 1;
 #ifdef CONFIG_KVM_MMIO
 	case KVM_CAP_COALESCED_MMIO:
-- 
2.50.0.rc2.692.g299adb8693-goog


