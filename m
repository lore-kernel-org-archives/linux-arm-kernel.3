Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCB9EF99E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 23:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QnDyPwS4Q+llctp6LQ/SlEfYWHKNFhQHk4I55u+/ouQ=; b=a228o8PnL9JH9gsjARxXBymvJc
	Z+HH7w5NC5PIrXrrmv5RtfM5zsW3qrAKz5Z7E+D0yMCWs+OGVoysc2lQJSmfyuD2fOzFKrw3A0uo9
	eoT/0U5EJ4YCYBoleX8jVVeItYcXuR3Mmw+DqkUbJX8lYwcua3Dk7FsX0Rg9gMZHxSkXCNsu6iUHo
	V41gViWFv/QHDoorS/cEF5fvFtWsLflpDz8p8Cy0hAZU8ydHJj8zOasJ2OKtZisX3Tw7YWM8Kcex/
	WgwRHV7U/GPVWb8+WannpD8RvQ8BWtN2lGEh6ixN1NNM/NDCUHAi9QuU08ZtC3MbN2UczgJ4olJeP
	Y0UQJZVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr2T1-000000041mA-2H0p;
	Fri, 13 Feb 2026 23:20:55 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr2Sy-000000041lm-2hNw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 23:20:54 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-354c0eb08ceso5684707a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Feb 2026 15:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771024850; x=1771629650; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QnDyPwS4Q+llctp6LQ/SlEfYWHKNFhQHk4I55u+/ouQ=;
        b=0ZqqlSLBTJBzTOK6xCH0gNVlK75YgWjXuT5SK57B6DviQc7PiVVSTGr4U0CJD6/WcE
         rr2VCRV3oadKN6Z2M6hwCvgJtRN9NZKFE1TPr8wsHV7cj2eZjaJhg3Ao7R298O5HEuAD
         Z4YLOrasn67zPOR8uq8xeuHv8JdM3aNwTLGiKA84TkI5m/4Usdb04l8Bq0t+hWvwtoqg
         bcCfHD/Q6PmI1HHaHc2s3rJdGlDv15aB91iQXI53zqG5NfnPqvt9SgmAw6ekYS7mvxre
         SD1nV9QHPZ/dij7O0Z73OI2w0a2524Uyg5jmpHkqBPxV+9UoTAvk6DmWmlho77en5Fi2
         0+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771024850; x=1771629650;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QnDyPwS4Q+llctp6LQ/SlEfYWHKNFhQHk4I55u+/ouQ=;
        b=sQPv3tZNcCuODsfvz9VHmyHQSbIPLjp1ChpwJXMc0hfIw8oZiPsSgKCLiQjaKk1nh+
         ia01BNJ0HuOJtEqFDdOBuPe3+bL+MInp56Wlnsdhzuzc9q8QuTYK6SMt6KHujQkYs+a3
         MGTHy4DppV6QGjm8PoW9uPT80rMZkBN+cK8x9u1DzaqPqtyIHHhdQ5+jLJb9Mp0oYjze
         oksM6t2/+xrM+zNtPBqafMHAN7/VyFaKYucTzMLM5hWUCNOp+xIectPdOcKF0k4IYlWk
         D3b5BWr0XlY2p7xNlbX0bfdXNEhXM8InSS8lisnS23+PjT7cUrvtiVS1B2w6cCYqhk61
         zxDw==
X-Forwarded-Encrypted: i=1; AJvYcCUeklBfyDKb5swodS6pisXpoAmEpqUNNH9hTbqbN2XaO+DfV+7ero24cWOyCSTLQ4DM8KyZsYXGq0bf2RS+WdB6@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3Fyctb8A+VblWJ/687RNSslbr2Y4vk6RRh19FW/Tx8uEH4Y6D
	LLgKhGMLVny0CHQcByNFlMCOlRlap9k1fUwzgUgjnfoFmsdVaRP6OlmCrXUrbYDouGOEgaTCQyB
	ref2eZQ==
X-Received: from pjd4.prod.google.com ([2002:a17:90b:54c4:b0:352:d19a:6739])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:dfc7:b0:336:9dcf:ed14
 with SMTP id 98e67ed59e1d1-356aad3cb00mr3334271a91.23.1771024849714; Fri, 13
 Feb 2026 15:20:49 -0800 (PST)
Date: Fri, 13 Feb 2026 15:20:48 -0800
In-Reply-To: <a84ddba8-12da-489a-9dd1-ccdf7451a1ba@amazon.com>
Mime-Version: 1.0
References: <20250909100007.3136249-1-keirf@google.com> <20250909100007.3136249-5-keirf@google.com>
 <a84ddba8-12da-489a-9dd1-ccdf7451a1ba@amazon.com>
Message-ID: <aY-x0OlJQEqInyNF@google.com>
Subject: Re: [PATCH v4 4/4] KVM: Avoid synchronize_srcu() in kvm_io_bus_register_dev()
From: Sean Christopherson <seanjc@google.com>
To: Nikita Kalyazin <kalyazin@amazon.com>
Cc: Keir Fraser <keirf@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Eric Auger <eric.auger@redhat.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Li RongQing <lirongqing@baidu.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_152052_725051_383D48CC 
X-CRM114-Status: GOOD (  30.66  )
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

On Fri, Feb 13, 2026, Nikita Kalyazin wrote:
> 
> 
> On 09/09/2025 11:00, Keir Fraser wrote:
> > Device MMIO registration may happen quite frequently during VM boot,
> > and the SRCU synchronization each time has a measurable effect
> > on VM startup time. In our experiments it can account for around 25%
> > of a VM's startup time.
> > 
> > Replace the synchronization with a deferred free of the old kvm_io_bus
> > structure.
> 
> 
> Hi,
> 
> We noticed that this change introduced a regression of ~20 ms to the first
> KVM_CREATE_VCPU call of a VM, which is significant for our use case.
> 
> Before the patch:
> 45726 14:45:32.914330 ioctl(25, KVM_CREATE_VCPU, 0) = 28 <0.000137>
> 45726 14:45:32.914533 ioctl(25, KVM_CREATE_VCPU, 1) = 30 <0.000046>
> 
> After the patch:
> 30295 14:47:08.057412 ioctl(25, KVM_CREATE_VCPU, 0) = 28 <0.025182>
> 30295 14:47:08.082663 ioctl(25, KVM_CREATE_VCPU, 1) = 30 <0.000031>
> 
> The reason, as I understand, it happens is call_srcu() called from
> kvm_io_bus_register_dev() are adding callbacks to be called after a normal
> GP, which is 10 ms with HZ=100.  The subsequent synchronize_srcu_expedited()
> called from kvm_swap_active_memslots() (from KVM_CREATE_VCPU) has to wait
> for the normal GP to complete before making progress.  I don't fully
> understand why the delay is consistently greater than 1 GP, but that's what
> we see across our testing scenarios.
> 
> I verified that the problem is relaxed if the GP is reduced by configuring
> HZ=1000.  In that case, the regression is in the order of 1 ms.
> 
> It looks like in our case we don't benefit much from the intended
> optimisation as the number of device MMIO registrations is limited and and
> they don't cost us much (each takes at most 16 us, but most commonly ~6 us):

Maybe differences in platforms for arm64 vs x86?

> I am not aware of way to make it fast for both use cases and would be more
> than happy to hear about possible solutions.

What if we key off of vCPUS being created?  The motivation for Keir's change was
to avoid stalling during VM boot, i.e. *after* initial VM creation.

--
From: Sean Christopherson <seanjc@google.com>
Date: Fri, 13 Feb 2026 15:15:01 -0800
Subject: [PATCH] KVM: Synchronize SRCU on I/O device registration if vCPUs
 haven't been created

TODO: Write a changelog if this works.

Fixes: 7d9a0273c459 ("KVM: Avoid synchronize_srcu() in kvm_io_bus_register_dev()")
Reported-by: Nikita Kalyazin <kalyazin@amazon.com>
Closes: https://lkml.kernel.org/r/a84ddba8-12da-489a-9dd1-ccdf7451a1ba%40amazon.com
Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 571cf0d6ec01..043b1c3574ab 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -6027,7 +6027,30 @@ int kvm_io_bus_register_dev(struct kvm *kvm, enum kvm_bus bus_idx, gpa_t addr,
 	memcpy(new_bus->range + i + 1, bus->range + i,
 		(bus->dev_count - i) * sizeof(struct kvm_io_range));
 	rcu_assign_pointer(kvm->buses[bus_idx], new_bus);
-	call_srcu(&kvm->srcu, &bus->rcu, __free_bus);
+
+	/*
+	 * To optimize VM creation *and* boot time, use different tactics for
+	 * safely freeing the old bus based on where the VM is at in its
+	 * lifecycle.  If vCPUs haven't yet been created, simply synchronize
+	 * and free, as there are unlikely to be active SRCU readers; if not,
+	 * defer freeing the bus via SRCU callback.
+	 *
+	 * If there are active SRCU readers, synchronizing will stall until the
+	 * current grace period completes, which can meaningfully impact boot
+	 * time for VMs that trigger a large number of registrations.
+	 *
+	 * If there aren't SRCU readers, using an SRCU callback can be a net
+	 * negative due to starting a grace period of its own, which in turn
+	 * can unnecessarily cause a future synchronization to stall.  E.g. if
+	 * devices are registered before memslots are created, then creating
+	 * the first memslot will have to wait for a superfluous grace period.
+	 */
+	if (!READ_ONCE(kvm->created_vcpus)) {
+		synchronize_srcu_expedited(&kvm->srcu);
+		kfree(bus);
+	} else {
+		call_srcu(&kvm->srcu, &bus->rcu, __free_bus);
+	}
 
 	return 0;
 }

base-commit: 183bb0ce8c77b0fd1fb25874112bc8751a461e49
--

