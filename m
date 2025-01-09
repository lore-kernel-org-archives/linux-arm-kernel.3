Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C31E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 20:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sy46ZKdMOYPNfFozinwrK5U4YnAl6mgCHSprJv2I5EE=; b=kSrCi4rNQLqDQIFNXaYSsHk5aZ
	mdh2svuVj04DmJOCNXnnuPgZ3YFJvT+hq+rH7UjxSiZgxoQLtKKbiVrFCQjmUlBilV1h7K4Rtv/sW
	FcBKz1q7cgxC9TFKPsDffQs3GG0DOqbEV2kqfMEn8hFLFcTrTsqPLIW0E2kiKngKCndZOW4YMCPDI
	sRrSt8OuejSFyks1r07cPVnjGFhc44VqjcPf2eWSJwyqhAspbxz0AMzvsZmm6d8LRxXEu31Nkp/tU
	q0rBjWB9a9zqaPCH38+nXX1DsDix5euNh2cPYBu3p0ShjXGStdzUwj+KEmBKBDGT4oTgfYqwJ0uhY
	17DnVYzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzZL-0000000DISN-2oAS;
	Thu, 09 Jan 2025 20:55:55 +0000
Received: from mail-ua1-x949.google.com ([2607:f8b0:4864:20::949])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzTb-0000000DGVh-09jz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 20:50:00 +0000
Received: by mail-ua1-x949.google.com with SMTP id a1e0cc1a2514c-85ba1d9dcf8so359751241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 12:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736455798; x=1737060598; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sy46ZKdMOYPNfFozinwrK5U4YnAl6mgCHSprJv2I5EE=;
        b=RY0h/ymjiFbLpXMnFxucUPqUIH18EPhigGzOXN7JyeFJG/Ysiy8jjOUp+BWxkVVHLu
         oEOE+WgR1XvzTZT1gHz7TOZxhJofTtSb345JaaBfCgQO2bf8PV/6bBD98Jv7honpzr18
         F3XUcELWLlLw5xCtxa+y9AAjxcjxs81MF/Z3HgCoVdEFInsjFVgSi3WzINiR1DMnF0jC
         1/mTUeYljT+A2vkDQrqs0TFDkOLfgNVlhLPiaH/ktSFFlDj+5csTALSGwMURk/0knWV9
         orYinLMVPSNLrheiLgNybgsOfq/5kCM+3sYi3ICZKwyASwijX/XXAdzR6wB0UdlhL+Lb
         iiSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736455798; x=1737060598;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sy46ZKdMOYPNfFozinwrK5U4YnAl6mgCHSprJv2I5EE=;
        b=TQT8HVGLZtWQjc6Qw1zCJOTqfz5Jy5efWo2vudVtxj1pg2Da1bNI3Pv0IHhBITM/ER
         xRvhrjGqQOatztcFMIt+XisMTTZ6ESqY1ylHa+IrqdLTaI5Qab1KrAvCo+iTlDXLZ56R
         +loch0nF9amkW5RcfyexkSfLuEE+91q4BNIDdDSAfSQz+ECXFeGK/rKr6ICReug69UQT
         ER3/2F7i7lFZl1I+NlZKX4tGRTUGef6y3XGLcrJ8wcAmlpjoKTTxc3/K7AsYqsm8lKQH
         vVM0Et4giBpQHriM4AQsWBpMRfd/1Aqo5Ln+8w6I5YrGGJoRETsVVoQ+9OcvrDn17ohS
         SEyg==
X-Forwarded-Encrypted: i=1; AJvYcCWDAiFHF1hhXnZ+1UEvVUoEB6IeBffHsLoKdBROyD1tyheIqi/oXHkGtwPk+d8nDkGMyhMI4kRNonJrA427ZNEQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwHjI81D3XwBz3EISyMkW4ufe2WUQyghOBLIAUU3VOm1zdtUXBr
	TDe2KRGvwwCNXsg4pxySS+JzS143mM9LpYjzUMTHl5Lp4Il6c1vCwVCzVdaDSRs7UHq9fDOWThq
	P45fDpl3C0H3aq8TGoQ==
X-Google-Smtp-Source: AGHT+IGxjoRseI0ptp1PpNGkamYSZpMVzGlMOrPqkiBhNVZ0uPSquo0Jh6/07xFgWyNiCB/pmTP7I9swsH2tkGpZ
X-Received: from vsvj16.prod.google.com ([2002:a05:6102:3e10:b0:4b4:f067:c6f])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:c12:b0:4b1:1a11:fe3 with SMTP id ada2fe7eead31-4b3d0f15e35mr7763898137.8.1736455797824;
 Thu, 09 Jan 2025 12:49:57 -0800 (PST)
Date: Thu,  9 Jan 2025 20:49:19 +0000
In-Reply-To: <20250109204929.1106563-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109204929.1106563-4-jthoughton@google.com>
Subject: [PATCH v2 03/13] KVM: Allow late setting of KVM_MEM_USERFAULT on
 guest_memfd memslot
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
X-CRM114-CacheID: sfid-20250109_124959_096387_9A747092 
X-CRM114-Status: GOOD (  14.96  )
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
index 4bceae6a6401..882c1f7b4aa8 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2015,9 +2015,6 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		if ((kvm->nr_memslot_pages + npages) < kvm->nr_memslot_pages)
 			return -EINVAL;
 	} else { /* Modify an existing slot. */
-		/* Private memslots are immutable, they can only be deleted. */
-		if (mem->flags & KVM_MEM_GUEST_MEMFD)
-			return -EINVAL;
 		if ((mem->userspace_addr != old->userspace_addr) ||
 		    (npages != old->npages) ||
 		    ((mem->flags ^ old->flags) & KVM_MEM_READONLY))
@@ -2031,6 +2028,16 @@ int __kvm_set_memory_region(struct kvm *kvm,
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
@@ -2046,7 +2053,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	new->npages = npages;
 	new->flags = mem->flags;
 	new->userspace_addr = mem->userspace_addr;
-	if (mem->flags & KVM_MEM_GUEST_MEMFD) {
+	if (mem->flags & KVM_MEM_GUEST_MEMFD && change == KVM_MR_CREATE) {
 		r = kvm_gmem_bind(kvm, new, mem->guest_memfd, mem->guest_memfd_offset);
 		if (r)
 			goto out;
-- 
2.47.1.613.gc27f4b7a9f-goog


