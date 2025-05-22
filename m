Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAAC4C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 00:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tVNl4A6Kx8naMJGZ1E0eQITkQbAsVFllM1f24lX+kzQ=; b=smYuaBlMxCbVOsMMt7ne3OjtlR
	nZUMUOM6cnr4uvb//GPr2Bh0U0TnoOqyM0GQjnkZswab7rb7+ex2IBcn7ym+v8NrO3EL2zIZAK6Co
	UKjk+BuJSexNTepYpN2RVRQ1bdqmPbA95eQeW6D0u7lhoti8W5Gtt3JoQ514DUSbWKfQdFHKbnUZK
	D8Z2afW4OsOWznM66WrKTFwu8+DD2HBhOekCOatdPayt70+Uh9jgGOY4yL6Xn5kiIbxyt/bEK3k6d
	1K+0NzRjYsyLCLcJQja+xOKutyQ9zF8HOrKig5Auhbgl0bn6R/bDpogxkOglcSHL6Bprx9L5Hyzsq
	92I7WScA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIFqW-00000002Xvz-2Mgl;
	Fri, 23 May 2025 00:01:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIFiM-00000002VpJ-1hd8
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 May 2025 23:52:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tVNl4A6Kx8naMJGZ1E0eQITkQbAsVFllM1f24lX+kzQ=; b=S3Pf/ylB1lwmpQnktvFhjqCJ0w
	zjeX3r5gQuyQJpkokW553erakUEnHgMKUqJYM4NlMb7LF4dPTAKrFkqS49c/oQsvGv9W0WuB42kxJ
	ZzRJz6frKPIuAHOt68zMIRcBblEz9P1bHFm7JxcD0PbpG374mORJa3FMj9NrEyZ9tr/SaMreA1EgC
	WF2sm0V/KRRXKXo9UK5pp3sTpYqv7CgXLxlyfYVFkZUBL7s7QoR1ZfikJ+2Jbn9h7DMInY2JVj9Mj
	lzkDxjqWbEUpcRA4hHIQ4cOTa4V+ErD4H1Q5XIoYERDWYECOe6Vm+TfK1m7LCo4gx0ZHVrqsWFeeX
	dV6s4cuw==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIFiJ-000000016X2-1axW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 23:52:41 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-30e8425926eso9457269a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 16:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747957958; x=1748562758; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=tVNl4A6Kx8naMJGZ1E0eQITkQbAsVFllM1f24lX+kzQ=;
        b=I9S4XFPVVpgxQW8JT3JwvEoenYJ6QgifRyJ/Wj9TUY7ue984LWmofDB7qpcj1BVB5E
         +RyNIrc7zkKneE1vgMtZRcfrsUtPLDJ+2Ox5lsn5sT6iDMnWgTtFgAKvgcYIv2ZH8VxJ
         TFKMoK/cirfY8cdybv3GHzol75O6k/FxtDOwZevoB98eeE2t1OhUuS2SOswEmq1bhSDI
         BfbsSnP2LftOD4gok/fr/XBbulkv07K+ByBSFrWfH45P+CfblvnGcuouzxAxWhibtLXR
         FxTbF8owQE0NpE5tgPK1BYZo1rO3FbcwCopkLOyAZq3W/UataqJb2HIzMDbJL8cH15y/
         Sdag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747957958; x=1748562758;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tVNl4A6Kx8naMJGZ1E0eQITkQbAsVFllM1f24lX+kzQ=;
        b=ae6PWM7mfFcp4ZnkagbWguVqjSaHHhAAUogp3rHVVToiRjMMnrbGbXWTEZG6O+W4zR
         P7RbFR+uQy67U9PZNCuUHBoKirIHtD1gE0WudbI6F6mSluH9qJbfdwZJsvuSj7Vtsm8C
         +79G/QJcormcK6kHG2JZd3dY9hy4laluKJH0wvXH9+VeoL/OSk0c/h3eCFVlxqfj8u8l
         vWmDgfuT9c9VNof2MuYo0eJUPapNADj3rvLvwzuIcSRrUSCwG5qtbIOfExp9I3yAFUjT
         nymlbR986W6RCZ9T9wVlH6gkC2V0jrpPQaYrBGIsVrXvgfhPv/i7seeX8qkXwG7mduJM
         Am8g==
X-Forwarded-Encrypted: i=1; AJvYcCUmocMAG2p+PPhD1YuBOJbp7CRMKZ+SZYOBOTNrbuTLTs/Xylb9w/6A9Z+OHB+rUMSx3mapR52rjxTyHj4NZM/d@lists.infradead.org
X-Gm-Message-State: AOJu0Yx43m1aHdHPpQoGOWKuENMK/jadXYzC7W1p4g1nnGRfsMroRvbX
	yGGjezMS+mt3rSrJSotaguAlJ7sXCVRy+ilvMGide+r1PcedsI9I8Bzz9r2k/H0zWE0LrT5Hoy9
	AO4EGCQ==
X-Google-Smtp-Source: AGHT+IE81WM2WL+8EnB/6FCP5IRyDnOFUDXq+HJraLf558ghdMXYLyDo9m5RHDzKNMgflX319IgqoMhIQGU=
X-Received: from pjg13.prod.google.com ([2002:a17:90b:3f4d:b0:2ee:4a90:3d06])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e70f:b0:30a:2173:9f0b
 with SMTP id 98e67ed59e1d1-30e8322596bmr38028577a91.28.1747957957818; Thu, 22
 May 2025 16:52:37 -0700 (PDT)
Date: Thu, 22 May 2025 16:52:12 -0700
In-Reply-To: <20250522235223.3178519-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250522235223.3178519-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522235223.3178519-3-seanjc@google.com>
Subject: [PATCH v3 02/13] KVM: Acquire SCRU lock outside of irqfds.lock during assignment
From: Sean Christopherson <seanjc@google.com>
To: "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, K Prateek Nayak <kprateek.nayak@amd.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_005239_652919_1D32BAE1 
X-CRM114-Status: GOOD (  12.79  )
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

Acquire SRCU outside of irqfds.lock so that the locking is symmetrical,
and add a comment explaining why on earth KVM holds SRCU for so long.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/eventfd.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index 39e42b19d9f7..42c02c35e542 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -401,6 +401,18 @@ kvm_irqfd_assign(struct kvm *kvm, struct kvm_irqfd *args)
 	 */
 	init_waitqueue_func_entry(&irqfd->wait, irqfd_wakeup);
 
+	/*
+	 * Set the irqfd routing and add it to KVM's list before registering
+	 * the irqfd with the eventfd, so that the routing information is valid
+	 * and stays valid, e.g. if there are GSI routing changes, prior to
+	 * making the irqfd visible, i.e. before it might be signaled.
+	 *
+	 * Note, holding SRCU ensures a stable read of routing information, and
+	 * also prevents irqfd_shutdown() from freeing the irqfd before it's
+	 * fully initialized.
+	 */
+	idx = srcu_read_lock(&kvm->irq_srcu);
+
 	spin_lock_irq(&kvm->irqfds.lock);
 
 	ret = 0;
@@ -409,11 +421,9 @@ kvm_irqfd_assign(struct kvm *kvm, struct kvm_irqfd *args)
 			continue;
 		/* This fd is used for another irq already. */
 		ret = -EBUSY;
-		spin_unlock_irq(&kvm->irqfds.lock);
-		goto fail;
+		goto fail_duplicate;
 	}
 
-	idx = srcu_read_lock(&kvm->irq_srcu);
 	irqfd_update(kvm, irqfd);
 
 	list_add_tail(&irqfd->list, &kvm->irqfds.items);
@@ -449,6 +459,9 @@ kvm_irqfd_assign(struct kvm *kvm, struct kvm_irqfd *args)
 	srcu_read_unlock(&kvm->irq_srcu, idx);
 	return 0;
 
+fail_duplicate:
+	spin_unlock_irq(&kvm->irqfds.lock);
+	srcu_read_unlock(&kvm->irq_srcu, idx);
 fail:
 	if (irqfd->resampler)
 		irqfd_resampler_shutdown(irqfd);
-- 
2.49.0.1151.ga128411c76-goog


