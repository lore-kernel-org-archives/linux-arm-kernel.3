Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA2BC36017
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 20:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j8aM8OQNKmiMYC4fpWY1Tcz4TDYVMXdrg7MtQvLe+/k=; b=aeLrrusqEK6jXo3ogq9RnslAFY
	1Vb94pd/uuD2fLM+ey//CCg9eDlqf4W36/53TY8Ab02divnq1dJl2hy/X2SZjnIlaBjXbjRbLOypf
	4SrncJKM/8kt9cDXfZ3OR0wxoaUqObHrDq2h+0luxpebulfOIPyAcO2nHeKy3baO8pVm/G0Qk+Rln
	4uTuF16SqiKlGR4tqXGIe89lsaLdsBW9wDtYzuUEStqFDSDzLOOm0M94HeESAWgGmQHgvCFZcCzYV
	O+ug8UGgQF0VoFl0Xkar13iycc3CBapnjPxiCluf4gz7HKNdF4Aescl6JwWFIUgBlpERQvbdTkZqC
	dzqKQwSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tziau-00000004Mgt-4A3Q;
	Tue, 01 Apr 2025 20:52:24 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tziVY-00000004L60-0sF2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 20:46:53 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2241e7e3addso95148805ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 13:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743540411; x=1744145211; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=j8aM8OQNKmiMYC4fpWY1Tcz4TDYVMXdrg7MtQvLe+/k=;
        b=IVk/X0unrvYVnLd2I/cauJQvfInLyHl/QQcjKxHMU39WfBfKdE32NtEXOHp2ndr561
         7+jYaC8sVxB2xruN94vn0m3pwkV4qln3Ue+bOtN6ijWi+2VjrvnpL3WeEcM32csTu9r4
         kOjXHk4a1Z1i3P79KY7lSQCDYNN5jwkPYMADfbhNZtNJ+L/h7w8+erQyAxFsdilIoWV1
         sC9d+9ZBFOOfaR/Oy4heVkdNyDEQiB/AygW/MTH4kT8rPleIMwz+5Fzg1S+T0TUyfssw
         8IGQAu2nariqZZSbhlgk6aDMq+dAO/dyDkYB4Gc8IXePRMcMJrN0ntvEnu2wdR/qUB3O
         nuPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743540411; x=1744145211;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j8aM8OQNKmiMYC4fpWY1Tcz4TDYVMXdrg7MtQvLe+/k=;
        b=q0BpDUfSd56pQB9HJdAcEU0FvXndMJsDR1JEumW52FT/zr7nJyH1NRa9V8woZlBM6z
         9KfRovlJGJyVqdWY4E08bLV3bGScTgeCS40bYYja8QDVyuFmHM8kaSk+wyhHovEMXM0Q
         2pm6Hgy05IHUmMLQRq6uDnleAaDvA7adCmT5pqrNAmXx8SiO/eFJTSPUnSAv3UkWrrrj
         NEnrPbuCIVk8OyTcXICSg7CYspoURXuxotkJFIVWFHsLkZNrCDt6UGAZos8fIt3FmoZV
         aen+wu9It7A1r9mlcQAviDkDelB2P5U7n6WSSNd3duDd/HBENyordB1eNcOcV17C9PwS
         Blyg==
X-Forwarded-Encrypted: i=1; AJvYcCWsSJFZ96GoGkr7dfipdNguI9TW9z985sRyEJoYHNSEkePcAUOZ/xN+nUOrJCyhZAPsfkQmJY0g0whcmRS5K3QE@lists.infradead.org
X-Gm-Message-State: AOJu0YysK8/bFL+JKuiDhikc5xYPoLNT74YmWRBbKC/55lcOSWHan9xE
	kGHZaSuPziBwS8I4zwX81Ts9aY4GTOzAhgjxh3UKuRG4GhEzD+Da1yESPnItDl6cJwhxQy9KQ7t
	HhQ==
X-Google-Smtp-Source: AGHT+IHk4c/1IjO1MwiDzaYInvb39GIpeBXBReykLE1mG0z4QyNEUAZvNPkX1TcPikaWCjInx7JyJFujPu0=
X-Received: from pfbcw10.prod.google.com ([2002:a05:6a00:450a:b0:736:3a40:5df5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c411:b0:220:f7bb:842
 with SMTP id d9443c01a7336-2295c0ed243mr67188835ad.42.1743540411361; Tue, 01
 Apr 2025 13:46:51 -0700 (PDT)
Date: Tue,  1 Apr 2025 13:44:14 -0700
In-Reply-To: <20250401204425.904001-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250401204425.904001-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250401204425.904001-3-seanjc@google.com>
Subject: [PATCH 02/12] KVM: Acquire SCRU lock outside of irqfds.lock during assignment
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, David Matlack <dmatlack@google.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_134652_280948_6A643AE7 
X-CRM114-Status: GOOD (  13.43  )
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
index 01c6eb4dceb8..e47b7b6df94f 100644
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
2.49.0.504.g3bcea36a83-goog


