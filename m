Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B479AE7719A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 03:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3TyIoxqzKbU5TOqXbLBWWXwSPvFkN5kGJBIZi+nPuA=; b=Ex1Et5ghDQNXBUuiXO0RWd6oUm
	M2Ial2q0ZqjiotsoY1E+H+nZqM0Yu+0wbF/Q1Za2FGU7nT2V6tK1nY9aOxjKWwtsEs1Vx3UWKZ2v0
	I4yuhahfa4ytJa3Q2mBnHbX0VrL5h2uGZqRzDH8hGthbKnbtX4W5h8WPBQbAQiua9Z2ilfXVKmnjy
	OeuHJ5kK9qq24ySOPbea4xE74wE62CUmCGL07kM24zkeuLu+BekmQ/vKOF8iuRlGvQ6vBg3DsvJ71
	wipUjz+04VgdJb0/1tTqrL8LGJZ9ryf630EGZ87SnMPGIHNey60U1KsnwRwTrTxVchyf8z73VZO+u
	6OeXNbqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWSJj-000000004Tq-38NL;
	Sat, 11 Jan 2025 03:37:43 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWQFD-0000000HUQz-36un
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 01:24:56 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ef6ef9ba3fso4790115a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 17:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736558694; x=1737163494; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=L3TyIoxqzKbU5TOqXbLBWWXwSPvFkN5kGJBIZi+nPuA=;
        b=MZama5LY0TAW+qKnvCzVZfDiLty1i3X1R2et7hn9QtmfESyqNSh8j52ECO84N+vWLK
         WOQx1uwgQxcLYjSXBz+OyFDIQBOTeuhoCVrYolvHhdB0Vg1sNz415OJ78hXbErIhjZLe
         rRR//ZJBb2tvq2mEeVEcaW63bFgbBadf6lsRE2lUwbu6BJXZPGbEj157OGlS0afWTDp5
         ShYTAbPm9xlIZ8K/ZsNo44eNarkfh9nmw+e0n8GB/kg7HcO1mtfczSYS6C6IjPdzsBLm
         mZrHuWxVUKi6eJvzdUWj+xGu1cuUoBu/fIcsZS7PhS4ZC3+H7tjJpZeVIiKYeJc5PLrp
         2ygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736558694; x=1737163494;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L3TyIoxqzKbU5TOqXbLBWWXwSPvFkN5kGJBIZi+nPuA=;
        b=If7Pe2zbNoEPe709HZiFFyfMYths3zQB9SntxbErrzuaNaxtlEY7kvYw4BFm8xIdoz
         mYooHRjgRo1qgLVenIqTl/nP6pN2JRWcUYhYo2uTWs3K+GbIMyO7lQzgi7r7pwbq7LTT
         VyJBnblWgl58/uSu8xU1GDl3J4xqoUpclJNuJSlhIFUE6UjDfWnb4HlYIFO0uu/0hhm0
         ydsRZI9v6PB38xNpTulSty7OV+YtB/yoOzrXKbhsTAsps3gk7SLa1Uvf9FBeoEimmtmK
         hpvZDydKmn9KjJxV+DnTV47OoV0VpwvyLJAV6M3f0yCaUXNgcRXXsnyyduLeO32TBahx
         Is9Q==
X-Forwarded-Encrypted: i=1; AJvYcCW6TtI1BkC13fbM/WA0BPt9hOvcd2p14Bqxj4oQSbD1zmUa/TypT60O2MgIUR9a48ASW3ZWGoleExZCa5SqA5Iw@lists.infradead.org
X-Gm-Message-State: AOJu0YzuuAilBkeq84JBuCtrJ4PIQE5oXpyh2yfy+5iL4IqAVSJsp3hG
	sHEeHhxEy/5CgCwF+L/Pqk2N14ARxeJjLmHvr/yxqpOQOq345Z7q8lUYuCgOPhRCJkaSGYv0gMM
	8sw==
X-Google-Smtp-Source: AGHT+IHQFtnrz9Qz4G4DVM+w+HCWHLq9SWFcOY5MsmF5EmSUkf18xpdPguK9lOowTA48c954eXDA8ByTfJE=
X-Received: from pfld20.prod.google.com ([2002:a05:6a00:1994:b0:728:b3dd:ba8c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:114e:b0:728:f337:a721
 with SMTP id d2e1a72fcca58-72d21f29214mr17702842b3a.7.1736558694264; Fri, 10
 Jan 2025 17:24:54 -0800 (PST)
Date: Fri, 10 Jan 2025 17:24:46 -0800
In-Reply-To: <20250111012450.1262638-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250111012450.1262638-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111012450.1262638-2-seanjc@google.com>
Subject: [PATCH 1/5] KVM: x86: Document that KVM_EXIT_HYPERCALL requires completion
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Michael Ellerman <mpe@ellerman.id.au>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_172455_782593_400F46CC 
X-CRM114-Status: GOOD (  13.31  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Update KVM's documentation to call out that KVM_EXIT_HYPERCALL requires
userspace to do KVM_RUN before state save/restore, so that KVM can skip
the hypercall instruction, otherwise resuming the vCPU after restore will
restart the instruction and potentially lead to a spurious MAP_GPA_RANGE.

Fixes: 0dbb11230437 ("KVM: X86: Introduce KVM_HC_MAP_GPA_RANGE hypercall")
Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 Documentation/virt/kvm/api.rst | 39 +++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 454c2aaa155e..c92c8d4e8779 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6615,13 +6615,29 @@ The 'data' member contains, in its first 'len' bytes, the value as it would
 appear if the VCPU performed a load or store of the appropriate width directly
 to the byte array.
 
+It is strongly recommended that userspace use ``KVM_EXIT_IO`` (x86) or
+``KVM_EXIT_MMIO`` (all except s390) to implement functionality that
+requires a guest to interact with host userspace.
+
+.. note:: KVM_EXIT_IO is significantly faster than KVM_EXIT_MMIO.
+
+		/* KVM_EXIT_HYPERCALL */
+		struct {
+			__u64 nr;
+			__u64 args[6];
+			__u64 ret;
+			__u64 flags;
+		} hypercall;
+
+
 .. note::
 
       For KVM_EXIT_IO, KVM_EXIT_MMIO, KVM_EXIT_OSI, KVM_EXIT_PAPR, KVM_EXIT_XEN,
-      KVM_EXIT_EPR, KVM_EXIT_X86_RDMSR and KVM_EXIT_X86_WRMSR the corresponding
-      operations are complete (and guest state is consistent) only after userspace
-      has re-entered the kernel with KVM_RUN.  The kernel side will first finish
-      incomplete operations and then check for pending signals.
+      KVM_EXIT_EPR, KVM_EXIT_X86_RDMSR, KVM_EXIT_X86_WRMSR, and KVM_EXIT_HYPERCALL
+      the corresponding operations are complete (and guest state is consistent)
+      only after userspace has re-entered the kernel with KVM_RUN.  The kernel
+      side will first finish incomplete operations and then check for pending
+      signals.
 
       The pending state of the operation is not preserved in state which is
       visible to userspace, thus userspace should ensure that the operation is
@@ -6632,21 +6648,6 @@ to the byte array.
 
 ::
 
-		/* KVM_EXIT_HYPERCALL */
-		struct {
-			__u64 nr;
-			__u64 args[6];
-			__u64 ret;
-			__u64 flags;
-		} hypercall;
-
-
-It is strongly recommended that userspace use ``KVM_EXIT_IO`` (x86) or
-``KVM_EXIT_MMIO`` (all except s390) to implement functionality that
-requires a guest to interact with host userspace.
-
-.. note:: KVM_EXIT_IO is significantly faster than KVM_EXIT_MMIO.
-
 For arm64:
 ----------
 
-- 
2.47.1.613.gc27f4b7a9f-goog


