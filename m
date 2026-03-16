Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13301F53D80
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 17:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HpCcSOV6njoqt8AXcXZYXSoSkJ49sEAQqpokcgOqjA4=; b=AjmnUJX9/rjSLeUH18JZxAHQWy
	HH/3deRWKp/gvZ4Ggb9epnDKSyx72HrxSljQUiJ4lFpCYBMEtEht6BZej023FQIZhUukn4H54VMzz
	MLNfxzEinGVOsEqehLiRRLetwkzySPnyF5fpcgrt+d42ShGQa7zxghj+lyyzaow2LcxfY3r/6Adl7
	X6sQKZzanRi2F/7l1dokp/iToZwCKKkgUzkNLfn+7ZDgdd8JtIYe7WWOiSArhUnf0t5HFZCWbfRRA
	ksR6TapU4ZJCL2gy9u2PzNSJq2yi8ROOotMOa/RMSJJv/Oo70dyqF9FhPtd/tN6Oo+O2GNsvNL+SF
	BLBTQctg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Bqm-00000004Zmc-3YfP;
	Mon, 16 Mar 2026 17:35:32 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Bqk-00000004Zlj-43sI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 17:35:32 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48532df52c5so68882745e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 10:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773682528; x=1774287328; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HpCcSOV6njoqt8AXcXZYXSoSkJ49sEAQqpokcgOqjA4=;
        b=Bcn7MymWAoOle6JNNjF5iHuysLVsaJUbL+Tx8Lu7eq6capyMeIvDtRQIQ5uxct0dFE
         DzZ73cUjC1rTQNBPrC+tLjp2syr7KnF9oNHicAyMStX8KuuuB4KnKuO3DgNUm5TfxtB/
         5AsfJZt+LgnGWZIfRTPoiC05LFf+WRTPFZpMs6VdHFbC6jaBebNK84P48AMD7eoaZILS
         fK2KpS25VQU/4IriBWR5WJeOL14nJsoZBPGprUmO/TkVMR0lXq64HsUo9z36ezRnzqYp
         G/Z9IhjeljGDoCVqVeENuexM1L9M9SrzemipDyzjNB0vvr3rDaJHn9LxasrBUgMMC1h8
         q0zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773682528; x=1774287328;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpCcSOV6njoqt8AXcXZYXSoSkJ49sEAQqpokcgOqjA4=;
        b=kb40LbXT4PpZefhuzQ3EraPACLZxAAC4HbObMscU0Tw/o30QJsuJSTXF18J/AHKQPG
         LIM2rBeWIQ3zAcfoD/pSc1wDZ9CV9ZhzmmI3EqJEUzAY3AAOSqB3KKgdJ4izdHlMvpn6
         Xvn796lvo6fr7REOXAuPCikHoq3dLH/4nD/uBv2tGpu2RzOoDR+fwnujkq4HLKWcxYdn
         rfB9wNpC7ja77HrnONUhXyQtcqWyCy9wG7687OsqLhvVm1+wxrgS52JLomFkUwe09xce
         lwaAynSLLWlo+7/7xkA8UJZcqwVAo+Wf37mD3s/LpvG1ejWxT1XDmqOkM13m3HIWzfNB
         viUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJvgP2JmLZFrfOC2FGZeWkOn9D64FVWfa3JXCmz29ZzyWmjnmuSPB5j+BU0TjfIg6AoAGCRcMSl3zK3zsIAWd0@lists.infradead.org
X-Gm-Message-State: AOJu0YzELKbao0W/jfr8VBZ83nLcIlXGTLKfSw/wBnjrAqDOi6l6n2z8
	yfigf4YNKG9kU6eTM6xAzLi+1jE6Dw2AASV9vLfrWR0UcV4JQvFFGrwGq8yWw1u3vMVWV2CCSiE
	Mkw==
X-Received: from wmsu11-n2.prod.google.com ([2002:a05:600c:c3cb:20b0:485:3925:a795])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1d0f:b0:485:3f38:3de3
 with SMTP id 5b1f17b1804b1-485566d2fc4mr232752095e9.3.1773682527900; Mon, 16
 Mar 2026 10:35:27 -0700 (PDT)
Date: Mon, 16 Mar 2026 17:35:21 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFk/uGkC/x3MQQqAIBBA0avIrBNMwairRMSYYw1EhVYE4d2Tl
 m/x/wuJIlOCTrwQ6ebE+1ZQVwKmBbeZJPti0EpbZWorT3QOJa16nC+MXurQkAmobLAtlOqIFPj 5j/2Q8wd4MR/zYQAAAA==
X-Change-Id: 20260316-tabba-el2_guard-2f7e3fa06f69
X-Mailer: b4 0.14.3
Message-ID: <20260316-tabba-el2_guard-v1-0-456875a2c6db@google.com>
Subject: [PATCH 00/10] KVM: arm64: Adopt scoped resource management (guard)
 for EL1 and EL2
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"KERNEL VIRTUAL MACHINE FOR ARM64 KVM/arm64" <linux-arm-kernel@lists.infradead.org>, 
	"KERNEL VIRTUAL MACHINE FOR ARM64 KVM/arm64" <kvmarm@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Cc: Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_103531_044775_EE3DCBA6 
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi everyone,

I stumbled upon a lock leak while reviewing Sebastien's recent GIC Hardenin=
g
series [1] on an early error path. It reminded me that we've run into this =
exact
kind of bug pretty often while working on pKVM. Since we're going to be
hopefully upstream even more pKVM code soon, I'd like to try and fix this
pattern once and for all.

This series refactors a good chunk of KVM/arm64 codebase=E2=80=94covering b=
oth the host
at EL1 and the hypervisor at EL2=E2=80=94to use the guard() and scoped_guar=
d() macros
from <linux/cleanup.h>.

By tying our locks to the scope:
- We can safely use early returns (like return -EINVAL;) without accidental=
ly
  leaking locks.
- We can get rid of a lot of tangled goto exit labels.
- Reviewing patches gets a lot easier since we don't have to mentally track=
 lock
  states across giant functions.

A common concern with these RAII-style macros is that they might bloat the
generated assembly. However, looking at the compiled code, it actually does=
 the
opposite. As an example, looking at the EL2 object file
arch/arm64/kvm/hyp/nvhe/pkvm.nvhe.o before and after this series:
- Instruction count: Dropped by 39 lines of assembly.
- .text segment size: Shrank by 166 bytes.

This happens because the compiler no longer has to generate dedicated branc=
h
targets for exit blocks, nor the stack frame unwinding jumps just to call
hyp_spin_unlock. It just efficiently inlines the unlock instruction right w=
here
the return happens.

The series is split into two parts:
- Patches 1-5 (EL2): Adds the DEFINE_LOCK_GUARD_1 wrapper for hyp_spinlock =
and
  cleans up the nvhe/ directory.
- Patches 6-10 (EL1): Cleans up manual mutex_lock and spin_lock calls acros=
s the
  standard KVM host code (mmu.c, arm.c, psci.c, reset.c, pkvm.c).

There are definitely other parts of the KVM codebase that could benefit fro=
m
this (especially the vGIC), but I'm stopping here for now to see what every=
one
thinks of the approach before touching anything else.

Based on Linux 7.0-rc3.

Cheers,
/fuad

[1] https://lore.kernel.org/all/CA+EHjTy051kjdReuESmk3HpMsBEW=3Ds3DxhJXa8vQ=
JFHz--wG2Q@mail.gmail.com/

To:=20

---
Fuad Tabba (10):
      KVM: arm64: Add scoped resource management (guard) for hyp_spinlock
      KVM: arm64: Use guard(hyp_spinlock) in page_alloc.c
      KVM: arm64: Use guard(hyp_spinlock) in ffa.c
      KVM: arm64: Use guard(hyp_spinlock) in mm.c
      KVM: arm64: Use guard(hyp_spinlock) in pkvm.c
      KVM: arm64: Use guard(mutex) in mmu.c
      KVM: arm64: Use scoped resource management in arm.c
      KVM: arm64: Use guard(spinlock) in psci.c
      KVM: arm64: Use guard(spinlock) in reset.c
      KVM: arm64: Use guard(mutex) in pkvm.c

 arch/arm64/kvm/arm.c                       |  53 +++++--------
 arch/arm64/kvm/hyp/include/nvhe/spinlock.h |   5 ++
 arch/arm64/kvm/hyp/nvhe/ffa.c              |  86 +++++++++-----------
 arch/arm64/kvm/hyp/nvhe/mm.c               |  37 +++------
 arch/arm64/kvm/hyp/nvhe/page_alloc.c       |  13 +--
 arch/arm64/kvm/hyp/nvhe/pkvm.c             | 122 ++++++++++++-------------=
----
 arch/arm64/kvm/mmu.c                       |  95 +++++++++-------------
 arch/arm64/kvm/pkvm.c                      |  19 ++---
 arch/arm64/kvm/psci.c                      |  19 ++---
 arch/arm64/kvm/reset.c                     |   8 +-
 10 files changed, 182 insertions(+), 275 deletions(-)
---
base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
change-id: 20260316-tabba-el2_guard-2f7e3fa06f69

Best regards,
--=20
Fuad Tabba <tabba@google.com>


