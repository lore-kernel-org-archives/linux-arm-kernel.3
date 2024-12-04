Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A09CE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 19:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rnZJyT6N3r8vTjoa4UcLa/XGdQ+PqihxUkrotorxiRo=; b=rtghKAB7N+Y4rC59dY/n3EDAOM
	rmOF75l34MvxT3hye9ormAO1XdiyaljPgaZrAZnYILQqU+kHSDbTC4dYcPynL+Xi4NugvX7fZ6S0Q
	LsV8/U96qclc526NK8sk1hYByU/Qm5ngiLkOjB3jUHMtwlMg9jY1xGMn69FRPs5l3tKmYkU5LY1E6
	uM9qB0OBlatJOLzTeNNCw8sc4bgEX6J15nT1S8xL/uCeDTGGfVCYU9Bsw8kpfGsDZY5ybKPLTqQVh
	Nd2rr8aaL9NMblO/pGzXaQSGCUAXCkVhzYEhzZUrLRAAVFxVVL0ZWX2xScAe6HhSdPJunTl86s2y7
	77qwk0mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIuuE-0000000Df5I-2a7b;
	Wed, 04 Dec 2024 19:19:26 +0000
Received: from mail-vk1-xa4a.google.com ([2607:f8b0:4864:20::a4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIupI-0000000Ddgf-0pyW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 19:14:21 +0000
Received: by mail-vk1-xa4a.google.com with SMTP id 71dfb90a1353d-515cb33556eso18351e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 11:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733339658; x=1733944458; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rnZJyT6N3r8vTjoa4UcLa/XGdQ+PqihxUkrotorxiRo=;
        b=J5/JqZthe4nyV75XAbN0M2nxMbL1/7qTU0IMla5WCiRZt6Bpqln3v79bQx1eiLIrGo
         6a7+LVVIMLvVkff6OHJldh7Gb33p0jyCROtF3lG0rn7lgw5e7joPTwu56x4UvFaIhRLc
         AZGXTdjNLOMmbupOMNtjDjLGk3j0clxAlwYE8kUf0nlIFs8L6oY5t+XFQ0zF/9grBezR
         UIbokCyVkH0lGrxt4D8Hlr8M+Mf8PKIdoECkcgNXbFnXJqjsAYNB0BTUwIPi/ZjhAunw
         BxPgGQ+LsoMB4A3tLB3/43sS6Rvq8EjvJZUXiH1TMpTUU6hQ500Zt3TdiECFqOxk0nYO
         xpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733339658; x=1733944458;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rnZJyT6N3r8vTjoa4UcLa/XGdQ+PqihxUkrotorxiRo=;
        b=IqewtFI9QvUzfpD1ijh1CCv1Wk2dohMKR1h438v5yP2yL9S0/PCdbxsn/OsEJbEvka
         FKi6D9ZQpH1b33zenQsXOtPoxCuENLSAXW2nShvujgRnoRAUIuvGkpuOEKnZtu99Vlrx
         pP7Qsui+R53d9DCZtMZ/VMzFTJMaU6MGkczP5Tfpa7H4xx+LFuzX4cVt8GWm0xAWytL0
         ljHtv2P9YlukDimYYGlWKBAjCveF5rjIrT1Ehcstk0Bu3w8p1BUR+aVSB5VjEPRQNYMO
         BzQzmsRXN97jrFGD/P61TnYxa0KE/pb8R/XDPN1BrF6yeJwFXfy/XtQ/xds1SvRe381m
         CPVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWF9dj0qW5dthcztnetD7gXsPUu9ZkSzilfNqlr6z0YY0a/h00wEzDDpihADGKwo/WL0z8gsPKMfArRCLeAe5LX@lists.infradead.org
X-Gm-Message-State: AOJu0YxU0QP4LExTB+Ylsy8zITH8/fuCvMZfhgjoxuAlYaZM/CoAumrB
	abDx1LgppBr+lS0wbgfAPlvkBtfywFDPJjWO7pDMflSJayfTJqqv0BQOFTvZVp6JZJmjo3bpWN7
	H7vdXtj2c2tVdM1zJnw==
X-Google-Smtp-Source: AGHT+IHeflh53wCdtG/eOTj3NVvzDZ1TR16bpwDBvuZyMyTF5KFF0ZrmPFZ5n9dphqqxj6PK08wZjYTOW77Q8bPv
X-Received: from vkbfc18.prod.google.com ([2002:a05:6122:4b12:b0:50d:6d20:c212])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6122:8d0:b0:50d:4cb8:5aef with SMTP id 71dfb90a1353d-515bf2ff82amr10640137e0c.6.1733339657905;
 Wed, 04 Dec 2024 11:14:17 -0800 (PST)
Date: Wed,  4 Dec 2024 19:13:38 +0000
In-Reply-To: <20241204191349.1730936-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20241204191349.1730936-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241204191349.1730936-4-jthoughton@google.com>
Subject: [PATCH v1 03/13] KVM: Allow late setting of KVM_MEM_USERFAULT on
 guest_memfd memslot
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, Wang@google.com, Wei W <wei.w.wang@intel.com>, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_111420_236791_4C3BA90D 
X-CRM114-Status: GOOD (  15.38  )
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

Currently guest_memfd memslots can only be deleted. Slightly change the
logic to allow KVM_MR_FLAGS_ONLY changes when the only flag being
changed is KVM_MEM_USERFAULT.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 virt/kvm/kvm_main.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 23fa3e911c4e..fa851704db94 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2009,9 +2009,6 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		if ((kvm->nr_memslot_pages + npages) < kvm->nr_memslot_pages)
 			return -EINVAL;
 	} else { /* Modify an existing slot. */
-		/* Private memslots are immutable, they can only be deleted. */
-		if (mem->flags & KVM_MEM_GUEST_MEMFD)
-			return -EINVAL;
 		if ((mem->userspace_addr != old->userspace_addr) ||
 		    (npages != old->npages) ||
 		    ((mem->flags ^ old->flags) & KVM_MEM_READONLY))
@@ -2025,6 +2022,16 @@ int __kvm_set_memory_region(struct kvm *kvm,
 			return 0;
 	}
 
+	/*
+	 * Except for being able to set KVM_MEM_USERFAULT, private memslots are
+	 * immutable, they can only be deleted.
+	 */
+	if (mem->flags & KVM_MEM_GUEST_MEMFD &&
+	    !(change == KVM_MR_CREATE ||
+	      (change == KVM_MR_FLAGS_ONLY &&
+	       (mem->flags ^ old->flags) == KVM_MEM_USERFAULT)))
+		return -EINVAL;
+
 	if ((change == KVM_MR_CREATE || change == KVM_MR_MOVE) &&
 	    kvm_check_memslot_overlap(slots, id, base_gfn, base_gfn + npages))
 		return -EEXIST;
@@ -2040,7 +2047,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	new->npages = npages;
 	new->flags = mem->flags;
 	new->userspace_addr = mem->userspace_addr;
-	if (mem->flags & KVM_MEM_GUEST_MEMFD) {
+	if (mem->flags & KVM_MEM_GUEST_MEMFD && change == KVM_MR_CREATE) {
 		r = kvm_gmem_bind(kvm, new, mem->guest_memfd, mem->guest_memfd_offset);
 		if (r)
 			goto out;
-- 
2.47.0.338.g60cca15819-goog


