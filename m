Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171C4E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 20:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1DrcQjgptnhIcToWnmFksBp0MRaAX2CW6X5qNo+eD6A=; b=mCGWKCKXtOBDmiVgJQM5l4CMmk
	gd8HnnskeQ5xyQlrSXEFDWSuIkhz3luyPJuyxy2BfelpEDugphd0qpBAxNKpsw+niQ2ePpm4z51Yo
	IpEna+M0T0mYot89LdMY2H4igceOAn1sKRsxu6mHVEkOis+zBP9CFz+YOuzL11BK7McAqZuXdmAIh
	7S+PQMeAcHz4CXdudh6GgyyfGwQxC9/RmkcoOkUkEURMsxqz4k4qq7rh7pgFh9ZnZTkHZw58Z+u4k
	J+f++O5xqI/S4IeNSOh1HwfQFvNU6VvfsFyLk5Y0RkS5TI4C/IgpACjVolyvTvatLzHOsZ6u5VJtI
	2u9XBiPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzaX-0000000DIZ1-1RQp;
	Thu, 09 Jan 2025 20:57:09 +0000
Received: from mail-ua1-x94a.google.com ([2607:f8b0:4864:20::94a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzTc-0000000DGVt-0SVA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 20:50:01 +0000
Received: by mail-ua1-x94a.google.com with SMTP id a1e0cc1a2514c-85ba1d9dcf8so359752241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 12:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736455798; x=1737060598; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1DrcQjgptnhIcToWnmFksBp0MRaAX2CW6X5qNo+eD6A=;
        b=rBv/bhBkU9zPSo0JBcfODO6q3wjfDEp3D6+/VvglDeMCa6Bu3dNi/dAOQjUPRMYUqA
         sogYREeECFhDe4RNDcOodjc4FpPKA5jkvsqMxcnmNOpDemo9DHGzn1kTD4n4fxbGGKOc
         JwImFnWAS/hxyDwZSvcunaHyrHoIbTLAjA//KL4BySjkfrRFgGC9CsxPlyCyNZG/ih7l
         EtHPBgD+JySO0ETwVdhTwedOrDYLqgVyMInb8GCoIEeddG8NwiOet+UaUCFaqP8ZHUZv
         JFkLI+BwjG2PxEOX7TC4l3vIDAWFYzQqMa/xPKG4FpyZnlQGj7xYORAt08f+JdO81j4O
         R19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736455798; x=1737060598;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1DrcQjgptnhIcToWnmFksBp0MRaAX2CW6X5qNo+eD6A=;
        b=pAsfTg7NkG0TXOsnp8vJV3FxPRJ5JdU6jtKeHT8DqIHIep6ZXXwlO3WEFKf2Xr8CuW
         R9p2oWwt8O8+jGp2M9oC1XkPf7w7eUzGbsIOluT6r0zoto6UX6sPOnMjdctYKdk85eZ8
         jHvXE6ttu3AuFevcPPGpeqvC2xyaM88N+6RQGX9AXBHDaHAzg6ku7c4NXKv+qEzy7UHl
         8xz+dLxIi1JNsQM41Xx5dRXw4quAkC2IfUWGr+O3pNmL3mRjRRNjAaqSv/VFGEfgVHj3
         UHct58DRS6Vjg4rdVYNhTCfS+ZkWUPIOZvpTrXrQihgDSjY1hDo6UVggVaZCDXauwlwP
         gGsw==
X-Forwarded-Encrypted: i=1; AJvYcCWDiXLPqrZ9wppiXsSE1hdUpc0Vh6MdRx6PO7qTuFJgBnkOwNEsl0vUsMjrA9kFFE0kEwEOspk7VckNCzv+Ze6k@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+2CWnGbHcCFIg5Enfi89GNEyQUBAZcMOrh0DJDK8Nsgw7K4rq
	71kQA4sz5O9L24UfKucEPey1O1oSc2CftSQi64cie4uXfoUq7T45dViVvEsmGHGrq4JGeLqtAcg
	WVjRhya9tN5OX5V1/pw==
X-Google-Smtp-Source: AGHT+IEK0449o9KbC3fWak3S16jydYyIqzxOV/2eZ44AIR7w7I0DQuvF+HeqMnZYowZ6lm/VqNUOgc0IX+KhZU1E
X-Received: from vscv18.prod.google.com ([2002:a05:6102:3312:b0:4af:df7b:f439])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:2c02:b0:4af:d487:45f3 with SMTP id ada2fe7eead31-4b3d0ffc73fmr8314563137.23.1736455798514;
 Thu, 09 Jan 2025 12:49:58 -0800 (PST)
Date: Thu,  9 Jan 2025 20:49:20 +0000
In-Reply-To: <20250109204929.1106563-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109204929.1106563-5-jthoughton@google.com>
Subject: [PATCH v2 04/13] KVM: Advertise KVM_CAP_USERFAULT in KVM_CHECK_EXTENSION
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_125000_144699_4B4F21CE 
X-CRM114-Status: GOOD (  10.87  )
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

Advertise support for KVM_CAP_USERFAULT when kvm_has_userfault() returns
true. Currently this is merely IS_ENABLED(CONFIG_HAVE_KVM_USERFAULT), so
it is somewhat redundant.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 include/uapi/linux/kvm.h | 1 +
 virt/kvm/kvm_main.c      | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index c302edf1c984..defcad38d423 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -936,6 +936,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_PRE_FAULT_MEMORY 236
 #define KVM_CAP_X86_APIC_BUS_CYCLES_NS 237
 #define KVM_CAP_X86_GUEST_MODE 238
+#define KVM_CAP_USERFAULT 239
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 882c1f7b4aa8..30f09141df64 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4811,6 +4811,10 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 #ifdef CONFIG_KVM_PRIVATE_MEM
 	case KVM_CAP_GUEST_MEMFD:
 		return !kvm || kvm_arch_has_private_mem(kvm);
+#endif
+#ifdef CONFIG_HAVE_KVM_USERFAULT
+	case KVM_CAP_USERFAULT:
+		return kvm_has_userfault(kvm);
 #endif
 	default:
 		break;
-- 
2.47.1.613.gc27f4b7a9f-goog


