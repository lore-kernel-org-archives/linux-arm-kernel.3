Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BF3C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 19:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:Mime-Version:Date:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5g0ChK+VU2x5v032q51hIsX3hlUPkCrfaGOtPqHgaN4=; b=AV5VcffXmsF+6ogsBQ5HajkxzN
	zFVyva0M6KHNKKKfAUUjIcFlr6wFsCdqh4bcYy66zPQGCYUs9UswVhL2NYZkDlDDMe24bG1ICTbBO
	6Qo6+Z7SWKslh/lBc+1YKH4Eb9izst6GxXojJf3N9n0BTuo5LomvGXE5AHtNRRI2OutkGXIYRCd8E
	wHbnPvJI+fBOQLeTAtsW5JpX9pZ6Quqw3lam2g6RpSU0IxKkEkS+Z7nbzfJY/RdIBoPhQH99f1CG7
	z7btxnIsGEhVcal4DqcqxDPkHhFiQNkR5Hq/dBHCqM1M4L2X0sF4bLsuPVpprFN/O3WOMM6wc9S89
	pIn6FIdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH6aS-0000000AIJC-2RBX;
	Mon, 19 May 2025 19:55:48 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH5dw-0000000ABKe-2871
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 18:55:21 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-af9564001cbso3104522a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 11:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747680918; x=1748285718; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5g0ChK+VU2x5v032q51hIsX3hlUPkCrfaGOtPqHgaN4=;
        b=bwrnlNbWjevFNYJQuwpEFhqYRrsryNpW6JWuQk2DAWhAdofTAl1NgsVsejeg21bY1l
         PCD8GEITTFH2piyiyTvBDg9CONuRigv8mRfOC7rdVNnEU/ECinB11p9c8t2i/1Lvszvb
         fXrjetWv0UfMrxUcSxmHDh1Vu8N/YccniWYRyguOB6e2S5VmkAY+DtnlJrzwnhW/OSs6
         am83mdgh+gi77oiPfew9URhqzWZDVcBUU0lI/7M+V3eVzbuwZCr/CuUN0IRVqs9oa6UD
         UOBUn+5azL46znt0TTf8OmuIxpVA7Gf7owYqrmNPSSZOuZRqwJULsVbA25/rY0h9OcmP
         EJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747680918; x=1748285718;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5g0ChK+VU2x5v032q51hIsX3hlUPkCrfaGOtPqHgaN4=;
        b=UL+UPFKeLyvX0aEjvaiAtgv8DztSe7zn7XDxrs+fACCR1FsWmsS6bHnSEVPD3vyLIx
         VYOQjSQLZq0JJ23C4uAZpnAD1GtVn9SvVMfufNqIAhn2HDkrCHsEm/z/ItBUNZwoP3tU
         2E1hmQThIBCOA+w+CYHC+Q4YusLGM1dgeNcbUBvYGTwMDkCg9F7tEjis/qTVeTSIR+Ad
         Sb0N4SHEc8z4jcmXxgB6FewZYEOpM/VY92OVrI1HS4lOiVRsZDUu6Vz4IxgngKz2v0om
         i9+SoVkLr7/LCzzg0AytQA/fnB4BE8B6I1xW+y5zp1LnrkxIZTErtd7YxoK6vwrtedMT
         cU0g==
X-Forwarded-Encrypted: i=1; AJvYcCVdWywooQaAy2YIeCqSngajLcBAajQ2fklx1vZNcdTr5UH17MZ83pGCZnog4IbarrBIU7IVMPxj93nK6UNGiZQX@lists.infradead.org
X-Gm-Message-State: AOJu0YxwbszY3YgbRnbgTUjCcxY/GvDGS3iNYZc8quqnRBmvG+NA6v3l
	AMJNeeBjOqIXqHwwke+Qo7M2KaHiPp1vNc7FpCFA/nzzmWo17c2rWUHOkb0mGkkFmXIixtBa7dD
	FpaSQRw==
X-Google-Smtp-Source: AGHT+IFREGE+bVXqGWSTvcQtoaMDWNnydT+jkDJYEQ3EGIJqIQGkri2TmVqBm1NbHON/mC+PC5tsJfUk/NE=
X-Received: from plpd8.prod.google.com ([2002:a17:903:1b68:b0:230:136b:a034])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e5ca:b0:223:f9a4:3f9c
 with SMTP id d9443c01a7336-231d43d5526mr191572235ad.9.1747680918570; Mon, 19
 May 2025 11:55:18 -0700 (PDT)
Date: Mon, 19 May 2025 11:55:02 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250519185514.2678456-1-seanjc@google.com>
Subject: [PATCH v2 00/12] KVM: Make irqfd registration globally unique
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
X-CRM114-CacheID: sfid-20250519_115520_571189_F456E5C0 
X-CRM114-Status: GOOD (  14.12  )
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

Ingo/Peter,

Any objection to taking this through the KVM tree? (6.17 or later)
Assuming no one objects to the KVM changes...


Rework KVM's irqfd registration to require that an eventfd is bound to at
most one irqfd throughout the entire system.  KVM currently disallows
binding an eventfd to multiple irqfds for a single VM, but doesn't reject
attempts to bind an eventfd to multiple VMs.

This is obvious an ABI change, but I'm fairly confident that it won't
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

v2: Use guard(spinlock_irqsave). [Prateek]

v1: https://lore.kernel.org/all/20250401204425.904001-1-seanjc@google.com

Sean Christopherson (12):
  KVM: Use a local struct to do the initial vfs_poll() on an irqfd
  KVM: Acquire SCRU lock outside of irqfds.lock during assignment
  KVM: Initialize irqfd waitqueue callback when adding to the queue
  KVM: Add irqfd to KVM's list via the vfs_poll() callback
  KVM: Add irqfd to eventfd's waitqueue while holding irqfds.lock
  sched/wait: Add a waitqueue helper for fully exclusive priority
    waiters
  KVM: Disallow binding multiple irqfds to an eventfd with a priority
    waiter
  sched/wait: Drop WQ_FLAG_EXCLUSIVE from add_wait_queue_priority()
  KVM: Drop sanity check that per-VM list of irqfds is unique
  KVM: selftests: Assert that eventfd() succeeds in Xen shinfo test
  KVM: selftests: Add utilities to create eventfds and do KVM_IRQFD
  KVM: selftests: Add a KVM_IRQFD test to verify uniqueness requirements

 include/linux/kvm_irqfd.h                     |   1 -
 include/linux/wait.h                          |   2 +
 kernel/sched/wait.c                           |  22 ++-
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 tools/testing/selftests/kvm/arm64/vgic_irq.c  |  12 +-
 .../testing/selftests/kvm/include/kvm_util.h  |  40 ++++++
 tools/testing/selftests/kvm/irqfd_test.c      | 130 ++++++++++++++++++
 .../selftests/kvm/x86/xen_shinfo_test.c       |  21 +--
 virt/kvm/eventfd.c                            | 130 +++++++++++++-----
 9 files changed, 294 insertions(+), 65 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/irqfd_test.c


base-commit: 7ef51a41466bc846ad794d505e2e34ff97157f7f
-- 
2.49.0.1101.gccaa498523-goog


