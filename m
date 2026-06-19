Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF97CD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 07:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PGcRBYs3Z9Uumpf23hDhMQDIQ6d9ZOsDwaNEYfVocws=; b=LbZpV++weT7fYtqg8k7B1tI92x
	Q6rBMKs66joR7GnAHx2+o7leo3WEjtmhajXw42kLlV/wZDM//Y7McVlKo4oxzItAA8kn9v0um4N11
	AYSXPvV5mBoaf2EUwuDBAA270SyLBpLZZ3UXq6kPyj9R2HRNNpze/t8orTJVYvD6fCdPlE+CdFDLi
	6Hy8ysBEeYqKYNueBRdfZHkfrIvVG47wukczKkgXDthsDGvciIZ9+/qwfl1kBhKv4+EK/12rK0B3v
	jzXsLSRlGuDJDqxt+FQXMp1LiNN/1s5s/ZseNkCbCSDHjVoac/oaLLFtRB6MVuoHL91FylsekLKqJ
	qPhb1ikQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTK0-000000025EK-2Fmk;
	Fri, 19 Jun 2026 07:07:24 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTJy-000000025Dk-3m0F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 07:07:24 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-697560b83f4so374930a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 00:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781852841; x=1782457641; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PGcRBYs3Z9Uumpf23hDhMQDIQ6d9ZOsDwaNEYfVocws=;
        b=HsyWu9dreyeceAI2yI6G3NMXfbmKjNjcvBrUhc90j6Cz9TQo3VSkWheY269YioBgNH
         gHSKGSR4MeShR5i/LEYVmpuc4VKRF8L0/dKkeYII907kbmV2GTIP7ocqw9V/oEJFH1+i
         jilIE8OtG4CrpwF1VvLilf+Wjy5Y7AmOa5gkgfG6EGI3y0Vi8ON4NQB5MEfmIcrIDyDB
         w27EsVMCbCNVayskwhV4nb3rcOlPqhG4Czpllb6AqTPgbAG+sHFn4ntCr7gTc0dIoojB
         MjYaPZD11sWRrm0xe9JEWMrjYNDhTW+/p8iSsB0rzyGMMj27zxVwwR3kZiPuc3kwC91X
         QT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781852841; x=1782457641;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PGcRBYs3Z9Uumpf23hDhMQDIQ6d9ZOsDwaNEYfVocws=;
        b=qXgFoQlYO7O2EFNnW4ZEu8NvgVbqcgkkYJ9Frpb/SDq8hBn2ABrn+Z0LnE7dytRRV+
         vtXRLP8Ik9Koi/5+nJvwWbel2VLDk9DsScJbxVn5MRBESSxWVQhR0gQIGCguDEMhwczh
         0V95iAX6Fb6bl/q7O9JxUXd5d4s2E9o6eY4tockS0h1cCsY0ffcT1l+huzeVYBzpgqqF
         Ea5sgIxswenK9gbx0BG1eJb3vbtJ1qsNDb0v7Sd/e/6YAHu8EScfeZS9AZv6ffRKI+Zv
         xjID5C8sHtVFo6EpbnApwlGPtKf1AWEk77WyUiuBHDMe9XNH7Zr0V6C75XLzkpj1oq2O
         nbmQ==
X-Forwarded-Encrypted: i=1; AFNElJ//arPIUW8ot/DCbZo08CCAS7CipMEYZfawgRJvIc31oZYq2zBKIG8x2RYGYm/ywuQHfu1Rh8LxJ9nWeg/+g4Mm@lists.infradead.org
X-Gm-Message-State: AOJu0Yzjfxy+vQw/GFA2tg0YSn3q4iFjcod8mYUlrxnd3dLMK/hVmiwe
	jHYq15aNodHG6MFLtPdHMyBBViv6WTG1RbgcDP3OkRQAr29H9LEjoUxlB99AJ4wq2POjnFz5iJi
	Nvg==
X-Received: from edf28.prod.google.com ([2002:a05:6402:21dc:b0:692:3d87:5b0d])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:5288:b0:68b:ca3c:6bbb
 with SMTP id 4fb4d7f45d1cf-6973bcaa247mr932499a12.11.1781852840465; Fri, 19
 Jun 2026 00:07:20 -0700 (PDT)
Date: Fri, 19 Jun 2026 08:07:11 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc0.738.g0c8ab3ebcc-goog
Message-ID: <20260619070719.812227-1-tabba@google.com>
Subject: [PATCH v2 0/8] KVM: arm64: Rework pKVM vCPU state synchronisation
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
X-CRM114-CacheID: sfid-20260619_000722_948655_414950FE 
X-CRM114-Status: GOOD (  12.62  )
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


