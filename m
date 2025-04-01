Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A56EC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 20:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:Mime-Version:Date:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4MHpp6KQzpe5YT4W+dH4Yie0ZZwtXZwZK/jMYGNOWeg=; b=yiRgfcUqZ/7OIt99qL0jsc7vvH
	WyaotILj98SFdEJGG0mlU8mB25hMgo0rkYBIUYTtEsvioaemnHrUg2HFIpxoOCyTC/wq2n14TOtEL
	lQr9fY7XHTdcW/z5HsURkKAG0Gz0M0R6rb34Y0o0ozC4DLkBt7zmfjYL8xEVjYGoGyE+QlAOsZTPM
	g7ekGbnBAm3lz8XPdPj2yp7uaznYqZzqjsAsJijrearAfQdF70BKGS0bCk4HjaHkcfVJE4yWJKSFt
	Ydn+jyrieXiMLLSuqQ26Cg/ws6rZYT23m7mIlUmEJLVzxOttBFRAFF6Rt7mouw8wuXku5Y+tNT43z
	pjNPpxYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tziXL-00000004Lgr-47Lh;
	Tue, 01 Apr 2025 20:48:43 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tziVV-00000004L4C-28LL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 20:46:51 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-229668c8659so6677835ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 13:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743540408; x=1744145208; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4MHpp6KQzpe5YT4W+dH4Yie0ZZwtXZwZK/jMYGNOWeg=;
        b=FP99ocTtUXLODFJ8eXhx8eRsioyQ20FHwdbVs4CE23I7tytsNyosKv6qYWDyrO9k/6
         J4UawOY4jLwIBs9/etx4OQSKvas1lxGBwoayIdPdQOLFhs/UKPBHLrKjaCI+kBSB0SBM
         sy9ddMJrQYnfVwBDTEWKyPn5ZkW/yvYkZFGS2KNa5xI1lND+AhoBqwiNGYnvwks3sHQE
         XVNjXJuYZ6UjMqgQrr4IPTCxEbWzoMxIyA3YwnkIAZ3LkUAN2JDG+yisuAaD1jG2inMK
         lN5bXJUbK66spZX4H++9Hgd8RVgiVGtUlhjLG84/ONsEuB2bTnok7VulxsPKEykt2pCN
         VkSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743540408; x=1744145208;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4MHpp6KQzpe5YT4W+dH4Yie0ZZwtXZwZK/jMYGNOWeg=;
        b=lQFv2Dk0H82uFWl1EOl8WDuFxCl5hvF9d2+HbEEi4+4mFtWdkU/fKXj9TzaZ5qHzkS
         jOx/rMpyHbCEdB9ys64IBWihnMJWEgl2SV31fB+TA1aDdRXkIm4ASUXXf2urtxRMwplO
         0IBOcAHhgB//E7ykk6VSN/aMBdsY45w/XAJ1WwLTfJZ5aC//vg0l8d5WxG/nIE5gVtGL
         xrVC/yDi6gLKIUWqlhhA4/4azNCn1ADBUmx31Dp3e1etAcZfjlAeZYXTcepxAp646lWF
         jTchNYxskvqd3kDisC29AV9vAa/5ApgXWE8X/7xFICGkat6jHWMRQnGu8KHtezXyItyI
         0rvg==
X-Forwarded-Encrypted: i=1; AJvYcCUtb+oLq2VcN8ZefQiphA6goiuLn2UuUiHBD0Vk3jrMIjo9ykIeC56psgXnth2Uoli0IxkEjSRO3u8BteofoEA3@lists.infradead.org
X-Gm-Message-State: AOJu0YyLMaW5Ry/4/afKyasT3F3QWv1pmGeeoVw71jPSgbYglNAh62Dg
	1ZNwFmNQnoNLOs5M/WOmLE5zEjP+OCRK7RtvrvtEhV5yjMi1Ve037qpdj+rgTdSYPjd0utxi6GA
	BIQ==
X-Google-Smtp-Source: AGHT+IHAsBNwKlX/xhMaBjKbVn5TdC1aApjFgyzFqGqs5j7Zym3fz03OLRDWDWGVCV86OCx3ObyBflUf12E=
X-Received: from pfbls13.prod.google.com ([2002:a05:6a00:740d:b0:737:5ee8:8403])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3d51:b0:739:50c0:b3fe
 with SMTP id d2e1a72fcca58-73980380c52mr22298727b3a.8.1743540407837; Tue, 01
 Apr 2025 13:46:47 -0700 (PDT)
Date: Tue,  1 Apr 2025 13:44:12 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250401204425.904001-1-seanjc@google.com>
Subject: [PATCH 00/12] KVM: Make irqfd registration globally unique
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
X-CRM114-CacheID: sfid-20250401_134649_616037_F7C00BCE 
X-CRM114-Status: GOOD (  14.73  )
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

Xen folks, I Cc'd y'all because "sched/wait: Drop WQ_FLAG_EXCLUSIVE from
add_wait_queue_priority()" changes the behavior of add_wait_queue_priority(),
which Xen's privcmd uses.  Unless I've misread the code, the Xen behavior
isn't actually affected, but extra eyeballs and any testing you can provide
would be much appreciated.


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
 kernel/sched/wait.c                           |  24 +++-
 tools/testing/selftests/kvm/Makefile.kvm      |   4 +
 tools/testing/selftests/kvm/arm64/vgic_irq.c  |  12 +-
 .../testing/selftests/kvm/include/kvm_util.h  |  40 ++++++
 tools/testing/selftests/kvm/irqfd_test.c      | 130 ++++++++++++++++++
 .../selftests/kvm/x86/xen_shinfo_test.c       |  21 +--
 virt/kvm/eventfd.c                            | 130 +++++++++++++-----
 9 files changed, 299 insertions(+), 65 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/irqfd_test.c


base-commit: 782f9feaa9517caf33186dcdd6b50a8f770ed29b
-- 
2.49.0.504.g3bcea36a83-goog


