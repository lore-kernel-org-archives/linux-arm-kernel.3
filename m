Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C199CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 06:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3/A8TfYJZJXuz9sD68tmOmSoDXJZKG01yZuG4gQpAiw=; b=yJBdqmjBIrehZwTMsmIWs+yBwE
	bt9n6loA3bNzqE+3Rwom4eB0pUZKSepPyrc/radU17kpw3vUC1Elw0Dwp+15G0eVWRjFSH6eVnuMd
	BlqUcV9K2mZexiSoxKVW0RXWn9F9eu2jD5+UBQWGPysBAi5BW8XlsDXI6UhZ3B2ig7JpUWbw+IxXC
	6dcglrUHxWTZe9h6DpAn1QaMXpAoYsoziZAiL5IPjPVJE1KRv8gFnYKoy5bhpKbiFmreqnMUBmNFv
	w7XDr6U8PETW/xXy7tLIjYJO95saO6gVNXW8c+blseTfuU6NWNU4cXospAcjRfvE2kcwPwGWG/zcM
	To2zuiAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXvrX-0000000AQvV-3vdx;
	Fri, 12 Jun 2026 06:59:31 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXvrV-0000000AQuR-0NOT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 06:59:30 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490b4d3d3e6so3969845e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 23:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781247566; x=1781852366; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3/A8TfYJZJXuz9sD68tmOmSoDXJZKG01yZuG4gQpAiw=;
        b=wYjABEtBaOsHwprHnEnjyxEszp7QyPBxhS8B2U39TiyzqLGgG7Wdlgqry2g0v7YlEX
         eELyE5I9CNND3CEOtQmJRiO6seMkx2cAOiuGwls1GT6RDzvpLY/5aAU0hDxCULlNdYPY
         aRZstg3LN0qQT3ov6IARjxQ1I+GBnKoTPBBGrZ/wOz6KciNE8bkWpq1BWeth3rpoQKGR
         l+V1XRvZKFFaAS6Vo1LSfV2OIu2tGge91SLek2QCy6nz2AHX3zDQEyUH+8sbDBMsp01z
         uuXtgBMZU42jHjP700/8RTzGD8/MOTBekqSyvn+rQm3MT7857doyJ1Toqy8vOjpIWcoW
         Z/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781247566; x=1781852366;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3/A8TfYJZJXuz9sD68tmOmSoDXJZKG01yZuG4gQpAiw=;
        b=Mtl6et1X1bZ4O5SHZ47TXVUZ8PAFLEaCBdKa7oZkG2Pisun8Ekhtsp/Y2OLa9zkf7h
         75xdvkDAteR4hvS6GXXCzAyAH63t1kJ3VC+VTLgu4l46qs0TFuEATNhK2KOrlfRcvmHB
         LpmjTWSHeH8CtDoJp4R3VGuLw2mCFIXDNpS+TUOhJ5Zt32Zqu/w7SQEhvFOWmkPgLIvi
         8BtaCUKFQ8svJ6JL/wN0S0b4KKdSGIgcKEX1mlg9XzRhr78nPNYo/QAp24iMk9tnX0Pd
         XTXpVJxm1EwWc005C3PT+3JLd8UxjtOAXeOy7IG07io4wXhRbaAKEZQMIoWBtoNw/HE6
         CE5w==
X-Forwarded-Encrypted: i=1; AFNElJ9VPaknio7vg1zd/LXbpaFLChIiYtWIBk/2NFqFLuv+7zE89TPMNl2JF9+zOLns9BJZMT7+npGJlJtXdqwo8NyE@lists.infradead.org
X-Gm-Message-State: AOJu0YxZCHdAzFpbUT4ai2J7fRh3PcOyv0LKe6N/7QtYePKny3oZNN15
	e90Re4Quj4b4EOFRGoGzXvloFRWRFSJGwmWOtJYXDtwvvRRUf7uXN4Nkzgl1Jv5fuItJbL3CBZ8
	CCA==
X-Received: from wmbg25.prod.google.com ([2002:a05:600c:a419:b0:490:b2b0:c4aa])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600d:6447:10b0:490:e18f:d108
 with SMTP id 5b1f17b1804b1-490ec501b2cmr10440745e9.19.1781247566496; Thu, 11
 Jun 2026 23:59:26 -0700 (PDT)
Date: Fri, 12 Jun 2026 07:59:14 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612065925.755562-1-tabba@google.com>
Subject: [PATCH v1 00/11] KVM: arm64: Rework pKVM vCPU state synchronisation
From: tabba@google.com
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Sebastian Ene <sebastianene@google.com>, 
	Per Larsen <perlarsen@google.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Hyunwoo Kim <imv4bel@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_235929_147014_8FD34A6F 
X-CRM114-Status: GOOD (  12.99  )
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

Hi folks,

Building on Will's pKVM infrastructure series [1], this series reworks
how pKVM moves vCPU state between the host and EL2, and stops copying a
non-protected guest's state on every world switch.

EL2 gains proper primitives for the state it transfers: vCPU lookup
helpers, and VGIC flush/sync that reduces how much host state EL2
dereferences. The series also moves some preparatory code (such as sys
reg access and PSCI helpers) to shared headers and HYP, and implements
lazy copying of a non-protected guest's register state back to the host
until the host actually needs it, instead of on every exit.

This is the first of two series moving pKVM vCPU state management to
EL2. The follow-up completes the job for protected VMs: state
isolation, PSCI handling at EL2, and the resulting API behaviour.

The series is structured as follows:

  01-03:  Guard/scoped-resource support for hyp_spinlock and KVM locking
          (Marc asked for this to land as a prequel to a series that uses it).
  04-07:  Preparatory refactoring (MPIDR, sys reg access, vCPU reset, PSCI
          helpers) to shared headers and HYP.
  08:     Host and hypervisor vCPU lookup primitives.
  09-10:  VGIC: reduce EL2's exposure to host state, add flush/sync primitives.
  11:     Lazy state sync for non-protected guests.

Based on v7.1-rc7.

[1] https://lore.kernel.org/all/20260105154939.11041-1-will@kernel.org/

Cheers,
/fuad

Fuad Tabba (8):
  KVM: arm64: Add scoped resource management (guard) for hyp_spinlock
  KVM: arm64: Use guard(hyp_spinlock) in pKVM hypervisor code
  KVM: arm64: Use guard()/scoped_guard() in arm64 KVM EL1 code
  KVM: arm64: Extract MPIDR computation into a shared header
  KVM: arm64: Make vcpu_{read,write}_sys_reg available to HYP code
  KVM: arm64: Factor out reusable vCPU reset helpers
  KVM: arm64: Move PSCI helper functions to a shared header
  KVM: arm64: Implement lazy vCPU state sync for non-protected guests

Marc Zyngier (3):
  KVM: arm64: Add host and hypervisor vCPU lookup primitives
  KVM: arm64: Minimise EL2's exposure of host VGIC state during world
    switch
  KVM: arm64: Add primitives to flush/sync the VGIC state at EL2

 arch/arm64/include/asm/kvm_arm.h           |  12 +
 arch/arm64/include/asm/kvm_asm.h           |   1 +
 arch/arm64/include/asm/kvm_emulate.h       |  80 ++++++-
 arch/arm64/include/asm/kvm_host.h          |   2 +
 arch/arm64/kvm/arm.c                       |  21 +-
 arch/arm64/kvm/handle_exit.c               |  22 ++
 arch/arm64/kvm/hyp/include/nvhe/spinlock.h |   6 +
 arch/arm64/kvm/hyp/nvhe/ffa.c              | 154 +++++--------
 arch/arm64/kvm/hyp/nvhe/hyp-main.c         | 255 ++++++++++++++++++---
 arch/arm64/kvm/hyp/nvhe/mm.c               |  37 +--
 arch/arm64/kvm/hyp/nvhe/page_alloc.c       |  13 +-
 arch/arm64/kvm/hyp/nvhe/pkvm.c             |  86 +++----
 arch/arm64/kvm/mmu.c                       |  80 +++----
 arch/arm64/kvm/pkvm.c                      |  26 +--
 arch/arm64/kvm/psci.c                      |  47 +---
 arch/arm64/kvm/reset.c                     |  68 +-----
 arch/arm64/kvm/sys_regs.c                  |  14 +-
 arch/arm64/kvm/sys_regs.h                  |  19 ++
 include/kvm/arm_psci.h                     |  28 +++
 19 files changed, 562 insertions(+), 409 deletions(-)


base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
-- 
2.54.0.1136.gdb2ca164c4-goog


