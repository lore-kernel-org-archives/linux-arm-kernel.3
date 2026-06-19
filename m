Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D839DCD98E6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 07:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PGcRBYs3Z9Uumpf23hDhMQDIQ6d9ZOsDwaNEYfVocws=; b=QH/JhgJbo0RPZv4O7UOe5X5L3Y
	J+iQyr6N0GPYA5ZaSkIcxsVSaeJtDEgFo+dSfBP33BwKLGxThNf9krdTrMlhHtDLw5X4MsXIXHyt6
	oc9MFHZU6aoH2qot/9TnCbeZcPTAAz2cE5/4OckmhC/uqWmakDmhRfkzYqUtwXHixVQ20UYTTUdnj
	WXxBIgiMoTgyGQqjCuacq9tQ5UlXfdfx5WvfZK3rSA9wQGOd9gAxDtSUoeoddxsgdKGkrObnvb/qk
	XOuFSreo4WLnYrEykXHpiY7dvO07rJegC6lT1LzW3Nm9EbE0FvlPSvv0qpe4nis4+zXXgpj22zObW
	xO6rOkWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTHu-000000024Pe-24CM;
	Fri, 19 Jun 2026 07:05:14 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTHs-000000024Os-1pfS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 07:05:13 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490afe64f26so7540575e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 00:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781852710; x=1782457510; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PGcRBYs3Z9Uumpf23hDhMQDIQ6d9ZOsDwaNEYfVocws=;
        b=fnpiR2C8ucZeIudkHVN5UI0czrw14nNL4OmFOhitcZ7v+R5SwEOEf4vkem6WJ8pwkX
         LOvxEvI2FuIw3rM4Pb0HvLLzeB8lCrocMYPI+8GJXwGs0Da8eA/+HzFQmnWmbj1mAuhm
         ro7H6FegmBbjufujbW0tN30KChQ+4dROUE+mFI4JClbDgvN+d2s3ocKULuSeUKOimRRc
         bj7okogqhqVtRMCFb93+eevQ4nD+5tVfuVR+SJ1PoUXgR4yDtuEjgfbmYiTs+Snb+MuK
         fKyh5+hzh5YUeo9YOwCVMXnq/vziAW+4iiTjHs/xU88tHPViBju5qlvoLeKijyk0AqnH
         WA3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781852710; x=1782457510;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PGcRBYs3Z9Uumpf23hDhMQDIQ6d9ZOsDwaNEYfVocws=;
        b=LMnnJ5m0kIikHar2mfX+a6Emc2NVMgpBGg3LrlvNw8lM5M/XYIyomOYTCTVKzTz3VO
         HCwCwf7Mdpzqk5phAKcMeWsZ8sEQSpz0Xp1REOmwGUwKAvePfzbOfjrarJFv7cYz7vbO
         88e2UlSzCOAS5ffB0pCbVprjkswlPCi2tPpW9sdjbGZlPL3NqoWvKA4OGo+Pd20QtbS0
         gfIJl8Dj+t83rpHq48b0zqxhOy76EbAyaDHrw9LyjeoOLCxKa/rAE3OgdDuShDsnYybI
         kE/cyUCvmzrB4Hp67qQ/jcqzwfWuQRUysG29XqK+7H4o7esv4sBA3u6WXGoayK9Cz2i5
         wJLQ==
X-Forwarded-Encrypted: i=1; AFNElJ8dtsemahF0DY+JUS156Xc+esEi8n8zo625zK1ITnp0IsuzaiI1DoMTSREisYCe9rqz63KaYUoWIbyJ2nMm3gQL@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0ULKdGiD7WxFoRidegbVeyNkNuy7nFEimgB+eftcVLim1xdr5
	opxi1rGBw3T4YGJvOQQnLMql2W7SSMC2OjqAPg3fxt5abIALK9a6anFQKN/q735gawhdBiTBBXg
	3Vg==
X-Received: from wmpu38.prod.google.com ([2002:a05:600c:4d26:b0:492:4314:560e])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600d:15a:20b0:490:5000:917
 with SMTP id 5b1f17b1804b1-492409fbfc4mr20439135e9.1.1781852709851; Fri, 19
 Jun 2026 00:05:09 -0700 (PDT)
Date: Fri, 19 Jun 2026 08:05:00 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc0.738.g0c8ab3ebcc-goog
Message-ID: <20260619070508.802802-1-tabba@google.com>
Subject: [PATCH 0/8] KVM: arm64: Rework pKVM vCPU state synchronisation
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Quentin Perret <qperret@google.com>, 
	Sebastian Ene <sebastianene@google.com>, Hyunwoo Kim <imv4bel@gmail.com>, 
	Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_000512_544596_A10CCBE1 
X-CRM114-Status: GOOD (  11.81  )
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

Changes since v1 [2]:
  - Dropped the guard()/scoped_guard() conversion patches: standalone churn
    on code this series does not otherwise rework. (Marc)
  - Rebased onto kvmarm/next. The VGIC flush primitive now bounds used_lrs
    using the cached hyp_gicv3_nr_lr instead of reading ICH_VTR_EL2 on every
    entry. (Marc)
  - Grouped the PKVM_HOST_STATE_DIRTY flag with the other iflags and
    clarified its comment. (Marc)
  - Sync PSTATE alongside PC on every non-protected exit, and sync+dirty
    before host-side SError injection so the syndrome is not dropped. (sashiko)
  - Various cleanups and tidying up. (Vincent)

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

  01-04:  Preparatory refactoring (MPIDR, sys reg access, vCPU reset, PSCI
          helpers) to shared headers and HYP.
  05:     Host and hypervisor vCPU lookup primitives.
  06-07:  VGIC: reduce EL2's exposure to host state, add flush/sync primitives.
  08:     Lazy state sync for non-protected guests.

Based on kvmarm/next.

[1] https://lore.kernel.org/all/20260105154939.11041-1-will@kernel.org/
[2] https://lore.kernel.org/all/20260612065925.755562-1-tabba@google.com/

Cheers,
/fuad

Fuad Tabba (5):
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

 arch/arm64/include/asm/kvm_arm.h     |  12 ++
 arch/arm64/include/asm/kvm_asm.h     |   1 +
 arch/arm64/include/asm/kvm_emulate.h |  79 +++++++-
 arch/arm64/include/asm/kvm_host.h    |   2 +
 arch/arm64/kvm/arm.c                 |   7 +
 arch/arm64/kvm/handle_exit.c         |  30 ++++
 arch/arm64/kvm/hyp/exception.c       |  34 +---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c   | 258 +++++++++++++++++++++++----
 arch/arm64/kvm/psci.c                |  30 +---
 arch/arm64/kvm/reset.c               |  60 +------
 arch/arm64/kvm/sys_regs.c            |  14 +-
 arch/arm64/kvm/sys_regs.h            |  19 ++
 include/kvm/arm_psci.h               |  27 +++
 13 files changed, 410 insertions(+), 163 deletions(-)

-- 
2.55.0.rc0.738.g0c8ab3ebcc-goog


