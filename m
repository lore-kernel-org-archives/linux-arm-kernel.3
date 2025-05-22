Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E279BC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 23:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:Mime-Version:Date:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tip5ipIFHbSR2IYZnXAE5GbVsPWdm0Tjm7OJATFbViQ=; b=r6grtNQ7Qw94984zdMOIrMPxi8
	G68zw52+neeh2VdXAS9VbxCOiQa5S7gd4ZqJIoicdCp7TOHg+6udPNGFMO+GHxUk9mUWDYyqQ7tkd
	DaJa4ELyHiC94rNPpIU/KoQ8I/4fw48yl9vs8E/VwBW5Jeq3vmjIrUE66noVo7WViejhRz8TcIL/q
	oJjbrAkrQhxxJrPlfuY8hhHXqCbOyrlhbV2k+DHiCt4RFMvXSL4VPbCAU+R/1IuVQBjOQ9MmOfGcO
	i5wdwnIYkf0vGQEGsEu011VuIBCNAlhq0rWiTSHCtAXTOu5iwOV6h/U/HWgMtbe0RX6LjJi1R1uH/
	umqKQIQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIFkO-00000002WOt-1IdH;
	Thu, 22 May 2025 23:54:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIFiK-00000002VoR-37Rn
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 May 2025 23:52:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:Mime-Version:Date:Reply-To:Sender:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=Tip5ipIFHbSR2IYZnXAE5GbVsPWdm0Tjm7OJATFbViQ=; b=BJhzUPYqAgyhHgfmcu46He5xnf
	wePEuBlT8Bv4DwG5biT0CNtFy4PBTAlEgj4GjRAQBkY+DwpXaVTKmvnJyf2xeFNqSqdQh1nQoCZap
	jCQljTnJO6A6jF1Ki9D/mGD08j11oootMMLMPzxX25cCEDY4KlvxxrYYxHu+bLdqk+een/WmVXYcS
	Ot5Jzs7mzsnRED3w+2mqysvO1twNNhxiqMnZsreUUcUMTj6W4H8i2Ybj3l2YJd9n2ZmWWoyuGIW1f
	B7wWyxxgaipIxh7kktgOrbk/yT0aTSwkhKJxiCFUdX4wIrrguraAq4oYpYtN3uxI23/cTJtckauYc
	kBhhYwWA==;
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIFiH-000000016WV-0s8o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 23:52:39 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b0e0c573531so5862050a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 16:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747957954; x=1748562754; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tip5ipIFHbSR2IYZnXAE5GbVsPWdm0Tjm7OJATFbViQ=;
        b=RE6BJ+I6n//qwm6R06K/kQ+Eif8ZS0rs6APK9nOD/LnbREadpLJ2AkxzsRnhNyk7Ts
         jbCAiCux7r/bvv2lQMMVNiyWUSiJQhl+2vLkLl5vgcUjBjsC9o+4ujVXGFlUqnUbAff2
         hmxVy5U+f+UyTAn08poH2VZkDbl7PbGqGVODsdrN0yTOYsykJeJwCtIMath0xLR2IHLY
         yRZlpa8Ik5rrjDaM2JxmMbA7rBq4yB6vs7UwQDOY0KXC8C4FR198g9ScLNnUN7KnG2Rm
         0Qfjg6Wuj31FcLfXsgkrmaaAs3R5mLt6lhqu7jkaryKUPC9E/HiGCi7w70ZhdnaWdI7/
         D2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747957954; x=1748562754;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tip5ipIFHbSR2IYZnXAE5GbVsPWdm0Tjm7OJATFbViQ=;
        b=QrgKJkmPX8UMj+u9omMvSmUsM0ITHQl0K5zBYtdD3LNECCHDExPiJRjZa9sRlpd/yr
         8CF6uxG1QkFS3IKB+4h+OOq04U7NZ/7NBnXdTQYR7/tP4vYXUTseW9A/081+c9BDsWj7
         Qh66tnl7mA0ceRcwB0EPPKigFBOJ+XuXEqwnwYM2nMn7SPLZxznBKaCuj6chSi6k19WM
         BSACuYZDn3XzgWRVlILF6o+qlnHYBZng7XSx3i0LGtxinx4glYvKmwhQgW/QqG0bzyjh
         MiSIaZl10ZVGHG7FfbTnWGA+XZ/vqfV0e4bFFKdMvR2hDXXKp7yG9PHsHO5m2AXxa6rp
         O44w==
X-Forwarded-Encrypted: i=1; AJvYcCUcC2xL483p/CFE0x516rfef3Dc3Y6n/aO+LII1+NnIpPefR8TXw7ByA0+ogKsOWUXbiqyHuc/5+2yy1qiaQ7Qq@lists.infradead.org
X-Gm-Message-State: AOJu0YyMeXUB0APS6FtqgONvi0DF/Po1wStTFAu1ATHqPEZ9J2iT5GUs
	qbS/irYfcoxBvFwXzy65K9l2rXgS75avpy6xhAQxDz8qe3PQcaJHURESo9l4VFR/0lOayPZbf3R
	EPz3zAw==
X-Google-Smtp-Source: AGHT+IFoFNCkbt8aJJ0xnDKCzmCnIh6gGll4rd5AbALinv7jGcAxGvJdpWgEmk1cX+UlvCwIOcTYID0HpNU=
X-Received: from pjtu15.prod.google.com ([2002:a17:90a:c88f:b0:30a:2020:e2bd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d604:b0:303:75a7:26a4
 with SMTP id 98e67ed59e1d1-30e7d4fea75mr43035958a91.7.1747957954327; Thu, 22
 May 2025 16:52:34 -0700 (PDT)
Date: Thu, 22 May 2025 16:52:10 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522235223.3178519-1-seanjc@google.com>
Subject: [PATCH v3 00/13] KVM: Make irqfd registration globally unique
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
X-CRM114-CacheID: sfid-20250523_005237_420403_ED795B88 
X-CRM114-Status: GOOD (  15.75  )
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

Non-KVM folks,

I am hoping to route this through the KVM tree (6.17 or later), as the non-KVM
changes should be glorified nops.  Please holler if you object to that idea.

Hyper-V folks in particular, let me know if you want a stable topic branch/tag,
e.g. on the off chance you want to make similar changes to the Hyper-V code,
and I'll make sure that happens.


As for what this series actually does...

Rework KVM's irqfd registration to require that an eventfd is bound to at
most one irqfd throughout the entire system.  KVM currently disallows
binding an eventfd to multiple irqfds for a single VM, but doesn't reject
attempts to bind an eventfd to multiple VMs.

This is obviously an ABI change, but I'm fairly confident that it won't
break userspace, because binding an eventfd to multiple irqfds hasn't
truly worked since commit e8dbf19508a1 ("kvm/eventfd: Use priority waitqueue
to catch events before userspace").  A somewhat undocumented, and perhaps
even unintentional, side effect of suppressing eventfd notifications for
userspace is that the priority+exclusive behavior also suppresses eventfd
notifications for any subsequent waiters, even if they are priority waiters.
I.e. only the first VM with an irqfd+eventfd binding will get notifications.

And for IRQ bypass, a.k.a. device posted interrupts, globally unique
bindings are a hard requirement (at least on x86; I assume other archs are
the same).  KVM and the IRQ bypass manager kinda sorta handle this, but in
the absolute worst way possible (IMO).  Instead of surfacing an error to
userspace, KVM silently ignores IRQ bypass registration errors.

The motivation for this series is to harden against userspace goofs.  AFAIK,
we (Google) have never actually had a bug where userspace tries to assign
an eventfd to multiple VMs, but the possibility has come up in more than one
bug investigation (our intra-host, a.k.a. copyless, migration scheme
transfers eventfds from the old to the new VM when updating the host VMM).

v3:
 - Retain WQ_FLAG_EXCLUSIVE in mshv_eventfd.c, which snuck in between v1
   and v2. [Peter]
 - Use EXPORT_SYMBOL_GPL. [Peter]
 - Move WQ_FLAG_EXCLUSIVE out of add_wait_queue_priority() in a prep patch
   so that the affected subsystems are more explicitly documented (and then
   immediately drop the flag from drivers/xen/privcmd.c, which amusingly
   hides that file from the diff stats).

v2:
 - https://lore.kernel.org/all/20250519185514.2678456-1-seanjc@google.com
 - Use guard(spinlock_irqsave). [Prateek]

v1: https://lore.kernel.org/all/20250401204425.904001-1-seanjc@google.com


Sean Christopherson (13):
  KVM: Use a local struct to do the initial vfs_poll() on an irqfd
  KVM: Acquire SCRU lock outside of irqfds.lock during assignment
  KVM: Initialize irqfd waitqueue callback when adding to the queue
  KVM: Add irqfd to KVM's list via the vfs_poll() callback
  KVM: Add irqfd to eventfd's waitqueue while holding irqfds.lock
  sched/wait: Drop WQ_FLAG_EXCLUSIVE from add_wait_queue_priority()
  xen: privcmd: Don't mark eventfd waiter as EXCLUSIVE
  sched/wait: Add a waitqueue helper for fully exclusive priority
    waiters
  KVM: Disallow binding multiple irqfds to an eventfd with a priority
    waiter
  KVM: Drop sanity check that per-VM list of irqfds is unique
  KVM: selftests: Assert that eventfd() succeeds in Xen shinfo test
  KVM: selftests: Add utilities to create eventfds and do KVM_IRQFD
  KVM: selftests: Add a KVM_IRQFD test to verify uniqueness requirements

 drivers/hv/mshv_eventfd.c                     |   8 ++
 include/linux/kvm_irqfd.h                     |   1 -
 include/linux/wait.h                          |   2 +
 kernel/sched/wait.c                           |  22 ++-
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 tools/testing/selftests/kvm/arm64/vgic_irq.c  |  12 +-
 .../testing/selftests/kvm/include/kvm_util.h  |  40 ++++++
 tools/testing/selftests/kvm/irqfd_test.c      | 130 ++++++++++++++++++
 .../selftests/kvm/x86/xen_shinfo_test.c       |  21 +--
 virt/kvm/eventfd.c                            | 130 +++++++++++++-----
 10 files changed, 302 insertions(+), 65 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/irqfd_test.c


base-commit: 45eb29140e68ffe8e93a5471006858a018480a45
-- 
2.49.0.1151.ga128411c76-goog


