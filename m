Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C87C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 19:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EvW/ttC5JRh/LPYdQJ6J3cVAwkFh6wSGOl9jEVKaPhQ=; b=0AcHjsuR2HCPZuYr/foXfEU4pM
	9wBRKQ2PcBnhnXGO0Qx69DCmqUds+drpADDGTqgHECId328HEYGUWNruscq+Q8yuYUW53fUcoCxKK
	dsWdRinApLPazNsckDK1oSsmGzehUlRqCwOUTK+k5RTegpz82a5WLaOK745/xVgaEDHILATCPcqsB
	siLH3Qu/xsaIQ+yRQcngc+MVahUz6OA6sPDLcwdA+se5JfTjyF5aG1lNjrbb44+lOlN5Mz2Xf7OQR
	Ff7JPClovztOhHmugfCjNuf3Uyl5ijG/OwDxvY9pZgB8CpFW1nUVT+0s5dZn6pQuA5/9zq63aseeY
	b5bAcy9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH6aU-0000000AIN2-1axt;
	Mon, 19 May 2025 19:55:50 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH5dz-0000000ABLZ-1qY4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 18:55:24 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b19226b5f7dso3348280a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 11:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747680922; x=1748285722; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=EvW/ttC5JRh/LPYdQJ6J3cVAwkFh6wSGOl9jEVKaPhQ=;
        b=u3iF/nHM2LQMobupF6Tz4xPsz2QQKXSyIeEj3PKiPWJw2M1LeMXbJDaZ0hLuh6V/bH
         y96moNPv9p3K0AX3c2VV2tlBk7XfzwjehIzCw0qz/mHvNzwndFg5GQyvuf52NsxNcgi9
         uoDIQYExUV5OKGV5v8bY9cjRDZ+ktPUDc+oaB1yMKotpgQbShWiAF75rxyKumNcInFLc
         RaZvuV5a9oNJWcGiVzZNiz8JDkun6LHhBPrW1ovFB9nXw8DNbSR54NxHG89voIDUss8W
         9n6Eil4ccD3hfn9BzZIcAEW1BbfaO5scA2VZ2+nvnfJe0IfGQMctReJhL1BDf2JnOlK0
         A/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747680922; x=1748285722;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EvW/ttC5JRh/LPYdQJ6J3cVAwkFh6wSGOl9jEVKaPhQ=;
        b=jKH/6R+KPZjmR5l0iA5a5673snCVH3Sifpbyw+CvivvQH590ouaAD0yx0j0AnAwaXn
         S5MEChNniwuUOTIZeb7Y3B9/PsUmOaYGPTpX7PIS3w6Uhf+4IFhBmVefPp1LvN1fQp6z
         nmzqEBunE9RuZKiSfZ41GHQIjb5jy4Tk1IBKLA4DnTyk1paHklL9gS/Utk2WE5cNkOdh
         b9jO4nHn3kM9mRjnKIffcLZL/myyjKWMp2IgDUkn1yv9tzl1pLEtKfwEv/Q3aXystlBe
         3fajReKpVEJTBSy48YUbz69+5XB5uf5KD5rPXYEp5ydvS3FI6QsnWiaSLuyDxQVELSxh
         ukUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLIzHrKQbLaX4bD3ossI1qt/LBFi+qupfICs7jXlj6Wng1HrzQ7qTraRXA9DrL8+2cN4eCZkPg0vtwGRWGHdLZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzokrVBNiOguLJcyihffqyFXro0e4k8MytEnPuLXpUnLj7qBW9K
	6jK00+SDrdSl9GH6xGQISQyRGXZcyBQ8NzrqqY9PBEUPl71GrrxDZG42lkr6rLEo1z387ZEldZ5
	jQSE63A==
X-Google-Smtp-Source: AGHT+IH9JoaEOfOB8zI2vxbbMIYbrh+JbpOCKy1k7VOcQtUTf5dKAMywqOhhzpJYNuTO32YplhBdVZbLjmE=
X-Received: from pliy13.prod.google.com ([2002:a17:903:3d0d:b0:223:4788:2e83])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2986:b0:232:2b90:1410
 with SMTP id d9443c01a7336-2322b901585mr92377195ad.10.1747680922171; Mon, 19
 May 2025 11:55:22 -0700 (PDT)
Date: Mon, 19 May 2025 11:55:04 -0700
In-Reply-To: <20250519185514.2678456-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250519185514.2678456-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250519185514.2678456-3-seanjc@google.com>
Subject: [PATCH v2 02/12] KVM: Acquire SCRU lock outside of irqfds.lock during assignment
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	K Prateek Nayak <kprateek.nayak@amd.com>, David Matlack <dmatlack@google.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_115523_476185_CB0506DD 
X-CRM114-Status: GOOD (  13.35  )
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
2.49.0.1101.gccaa498523-goog


