Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B664DD132C8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 13:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HxxA8qOKzLiUY9hT0OrM+BS/2F7uNJDid+1gg9MXvMQ=; b=2Xvrl56KQ68inyKk62Rp9KJ+f3
	QW3cXO07jxpW8d0eKl4AlzylsUQVfTx7X5cHLPtLljsn1hlKvs2C+OD7/0MyiIGd/EKR9eJqfK7vc
	w7/vDGqJtxGuCB4nSJul7OuClDzb3g74YgZcSfJsV4E3xpGC56NsxATkBW5k0cIWt+qu1OEzi1mYt
	LLzRek9mFEtO3lzGLzwN2gF86c0rGvfCFUQgAyQmMiu9jHN3W25eaTUzf1h/N5ajlyaz2M879qsyI
	GrzeazW65nIAE0kKIGCgl18t0r+bz+E4/iZDCSMUfzMkvSre3jygEXR61NEVWuRcKtSR9XNKuyV7F
	ArgeJdKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xJq-0000000DuTF-01Ch;
	Mon, 04 Nov 2024 13:40:34 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xBh-0000000DsFu-4B21
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 13:32:11 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6ea86f1df79so29573027b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 05:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730727128; x=1731331928; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HxxA8qOKzLiUY9hT0OrM+BS/2F7uNJDid+1gg9MXvMQ=;
        b=VsEtejIPxyZG4CHStrY7eKmgPHhy1T+ckQguaSodNk37x8ELvRx0dbe8zHp2OIL4vd
         Dlu3tFZd2tOXzZxs5vf8Yv+uuSmI6BO2PiMGm81dw33vA9h7NZllrIfgf3Aqtkm4BBvm
         zsJMbC/eTCry6bV8RH5cjwUUB6kVuf3TfoNjwi9lg7qVa9Z13AybS56umGdQ0vmWx5B/
         p5tyd+Gj2M+5ElUIPeU8kW4UFOVYPkbVSjfUB+4nHHl4cAiBZHLV0cWhQe1GwKWp0kFC
         dxCSpoH7f7ef0m1nyDrVgAeA9ExMlZpJuS9G45lnzvmnnymxwNHdntTYQ08gCdxKdeKF
         87yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730727128; x=1731331928;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HxxA8qOKzLiUY9hT0OrM+BS/2F7uNJDid+1gg9MXvMQ=;
        b=kcaGhtmReP0AmF7ObXu6ymoCoy0MHNn5cJFeM2HMLICHGpikFjYw7nOhYNVruwNZbI
         x6TDfFJWCI6I1O95BcLgg6gAFoKVzvU5lZc/4mh8nCCaVzHTkVpRv1NsuSmh8CNn5A+/
         DLrzLkYe7aLuqER/63JmYVeLyHvcl22RYxlFVVgIcHHTIaVoiD/UGGOjocxhpW5f8SP9
         ApeUBZKEbvnyfEFObsiG0RSlbq5aKRmMN4PffFHLc1XmpJnogM+AH3LNEIcCl+pbKjVk
         1J1GjLJTpGVtrVBHNERydcPsdtlOEb0mWh29DlV3bvt8yL1Sqx6M0s05luLBJKdZuAGZ
         Medw==
X-Forwarded-Encrypted: i=1; AJvYcCWf42m/InJwZsCA5AdnR4vtUOo7ecH1M9um4HMTIPxePjPg6tTkvsvZ2fnWYX1e29zuTuTb9fLx2+cO5AZ1o2ap@lists.infradead.org
X-Gm-Message-State: AOJu0Yxya9HopZloP6KObiFrKXe/5N4USjLvBjuZHn5cRYZ2zyfKoj8A
	0DpxE7L38FwovMwUx+7YOdTWodM3nbCBV2DvLjiqhp6sNUhm0MiaOXDK5nHrHZcuq+/AeHreTua
	LJ/+TFQ==
X-Google-Smtp-Source: AGHT+IEVbGHAWJltvuCaJ/azx5l/1Epto/a62kcYMbtely3oTwYCl8xO82ZRv+bF0K6w89ccEMj5+aQu0mFT
X-Received: from big-boi.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:129])
 (user=qperret job=sendgmr) by 2002:a81:a8c3:0:b0:6e3:d670:f603 with SMTP id
 00721157ae682-6e9d8aada53mr4236877b3.3.1730727127723; Mon, 04 Nov 2024
 05:32:07 -0800 (PST)
Date: Mon,  4 Nov 2024 13:31:46 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241104133204.85208-1-qperret@google.com>
Subject: [PATCH 00/18] KVM: arm64: Non-protected guest stage-2 support for pKVM
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_053210_094153_606724B5 
X-CRM114-Status: GOOD (  22.19  )
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

Hi all,

This series moves the stage-2 page-table management of non-protected
guests to EL2 when pKVM is enabled. This is only intended as an
incremental step towards a 'feature-complete' pKVM, there is however a
lot more that needs to come on top.

With that series applied, pKVM provides near-parity with standard KVM
from a functional perspective all while Linux no longer touches the
stage-2 page-tables itself at EL1. The majority of mm-related KVM
features work out of the box, including MMU notifiers, dirty logging,
RO memslots and things of that nature. There are however two gotchas:

 - We don't support mapping devices into guests: this requires
   additional hypervisor support for tracking the 'state' of devices,
   which will come in a later series. No device assignment until then.

 - Stage-2 mappings are forced to page-granularity even when backed by a
   huge page for the sake of simplicity of this series. I'm only aiming
   at functional parity-ish (from userspace's PoV) for now, support for
   HP can be added on top later as a perf improvement.

Please note that the approach taken in this series is a departure from
the existing out-of-tree implementation in Android which relies on
long-term GUP pinning even for non-protected guests which I felt was a
non-starter for upstream. Android will obviously migrate to the
upstream implementation when that lands.

The last two patches are likely to be the most 'controversial' ones as
they do the integration into KVM (please see the notes in the commit
messages), but obviously feedback is more than welcome throughout. The
overall idea is to use the KVM/arm pgtable API as the 'contract' between
the standard KVM and pKVM backend implementations. With pKVM we use
wrappers at EL1 with the exact same prototype as the kvm_pgtable_stage2_*()
functions that end up simply doing hypercalls as that allows easy-ish
plumbing in kvm/mmu.c. The pKVM EL1 helpers use a simple RB-tree to
maintain the GFN->PFN mappings as we need to be able to walk those from
EL1. For the record, I have tried a few other data-structures. A maple
tree doesn't lend itself very well to the use-case as we need to
pre-allocate the node from outside the mmu_lock critical section. I also
considered using a 'dummy' s2 page-table at EL1 purely for tracking
purposes, and hook deep into pgtable.c to issue hypercalls to notify
pKVM directly from there. That has very nice properties, but gets
horrible as we try to elide the TLB invalidation / CMOs logic from the
dummy page-table.

The series is organized as follows:

 - Patches 01 to 04 move the host ownership state tracking from the
   host's stage-2 page-table to the hypervisor's vmemmap. This avoids
   fragmenting the host stage-2 for shared pages, which is only needed
   to store an annotation in the SW bits of the corresponding PTE. All
   pages mapped into non-protected guests are shared from pKVM's PoV,
   so the cost of stage-2 fragmentation will increase massively as we
   start tracking that at EL2. Note that these patches also help with
   the existing sharing for e.g. FF-A, so they could possibly be merged
   separately from the rest of the series.

 - Patches 05 to 07 implement a minor refactoring of the pgtable code to
   ease the integration of the pKVM MMU later on.

 - Patches 08 to 16 introduce all the infrastructure needed on the pKVM
   side for handling guest stage-2 page-tables at EL2.

 - Patches 17 and 18 plumb the newly introduced pKVM support into
   KVM/arm64.

Patches based on 6.12-rc5, tested on Pixel 6 and Qemu.

Thanks!
Quentin

Marc Zyngier (1):
  KVM: arm64: Introduce pkvm_vcpu_{load,put}()

Quentin Perret (17):
  KVM: arm64: Change the layout of enum pkvm_page_state
  KVM: arm64: Move enum pkvm_page_state to memory.h
  KVM: arm64: Make hyp_page::order a u8
  KVM: arm64: Move host page ownership tracking to the hyp vmemmap
  KVM: arm64: Pass walk flags to kvm_pgtable_stage2_mkyoung
  KVM: arm64: Pass walk flags to kvm_pgtable_stage2_relax_perms
  KVM: arm64: Make kvm_pgtable_stage2_init() a static inline function
  KVM: arm64: Introduce {get,put}_pkvm_hyp_vm() helpers
  KVM: arm64: Introduce __pkvm_host_share_guest()
  KVM: arm64: Introduce __pkvm_host_unshare_guest()
  KVM: arm64: Introduce __pkvm_host_relax_guest_perms()
  KVM: arm64: Introduce __pkvm_host_wrprotect_guest()
  KVM: arm64: Introduce __pkvm_host_test_clear_young_guest()
  KVM: arm64: Introduce __pkvm_host_mkyoung_guest()
  KVM: arm64: Introduce __pkvm_tlb_flush_vmid()
  KVM: arm64: Introduce the EL1 pKVM MMU
  KVM: arm64: Plumb the pKVM MMU in KVM

 arch/arm64/include/asm/kvm_asm.h              |   9 +
 arch/arm64/include/asm/kvm_host.h             |   4 +
 arch/arm64/include/asm/kvm_pgtable.h          |  42 ++-
 arch/arm64/include/asm/kvm_pkvm.h             |  28 ++
 arch/arm64/kvm/arm.c                          |  23 +-
 arch/arm64/kvm/hyp/include/nvhe/gfp.h         |   6 +-
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  38 +-
 arch/arm64/kvm/hyp/include/nvhe/memory.h      |  43 ++-
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |  15 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 210 ++++++++++-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 333 ++++++++++++++++--
 arch/arm64/kvm/hyp/nvhe/page_alloc.c          |  14 +-
 arch/arm64/kvm/hyp/nvhe/pkvm.c                |  55 +++
 arch/arm64/kvm/hyp/nvhe/setup.c               |   7 +-
 arch/arm64/kvm/hyp/pgtable.c                  |  13 +-
 arch/arm64/kvm/mmu.c                          | 110 ++++--
 arch/arm64/kvm/pkvm.c                         | 194 ++++++++++
 arch/arm64/kvm/vgic/vgic-v3.c                 |   6 +-
 18 files changed, 1007 insertions(+), 143 deletions(-)

-- 
2.47.0.163.g1226f6d8fa-goog


