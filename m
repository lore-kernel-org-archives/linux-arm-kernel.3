Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE125C3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 16:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y6KHT1fuAVM+MkXSINIoI6H3OHOwSneU2VxsD+qo2oQ=; b=U0G5zFRMYqatyIn3WPPlF8h0Xe
	j4mGal3YuRUp5B8Fay0FXVcy8DM2ZD8NZw0UezsVWJ4QXBpAycptDyEN8EssDbra6+zkX62zrTDK1
	CqXA+fZFCAmvL1SvhBCQPsgYxUpuLK/vF1og12D5TTvMwBbtPom5DQBZOP6VYeHX091VfnREqJSvm
	GAHZThlu7L25WEgYfPE3ZDGghVny1DBTZksNwFJe4qWXPmW7rHRn3AaY7C6lzCTKBC/9DImvWFtkd
	j0gMao/Z2Oh9qws5pv5W9uyba57LueiRzBwoggfLFWJqto3yQFewbYJxgLbqmhlhbhIg5qDAdpL1Y
	4eUgpSEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBya9-00000007y6e-17Wr;
	Mon, 05 May 2025 16:22:17 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBySP-00000007wJ6-1opa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 16:14:18 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ff52e1c56fso6901496a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 09:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746461656; x=1747066456; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y6KHT1fuAVM+MkXSINIoI6H3OHOwSneU2VxsD+qo2oQ=;
        b=JeAe2dqYWVUw4t47HQodvBbHMHZDgXgQiuhKKH4ZKhVSoZHDZWa47m9d8ejfNblh6S
         n3c8g/6MkP9eOMP/Qxs+aHBpkzqj9Io1XEAItZZMkf7tPDeF77FVA3jGFUiPIKehUjqz
         UsOszuGIJYdez6XC9wtRxbX2xvBbfuPDAhlhbwCus2mNgU8gDbFDZQq96xAQ3H4Ww/ca
         G8PonBTvRDs441FmGobVDVBllFEZlJ0B3OV8KpG07/87mLLbnErzoKz/bsBQJ8Lz5X9h
         bEPu37u56tNTZPB8sgPd0GcJqwwVmHouw4QZfnNOru6vCr0d6PNAPRrcWKdIjlhUN+vs
         1b6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746461656; x=1747066456;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y6KHT1fuAVM+MkXSINIoI6H3OHOwSneU2VxsD+qo2oQ=;
        b=QY/3TJOrwqc2+0ImENtlVe76eRXgMI2OC+yKykyIXWaPaAuvNsMFEbVBmvLOx9l3LG
         qgWcz/pd4rKsD8HsNKOdgcSmV2peYzDweXwT73Aj6jK/V4j3KBFwKzjYsYI5q6DRGr2M
         nzrrEV9mgOUcDgTuZIpdoZe69ftw80XzW/BzdcUcoY6sU+PZPnb2BoeNnj7UK51z9Bhb
         Kw8Feberti0l2CcugUWI1qkebR/f4VGAC7BgV6x5cGg+F9DQQRTtAwWY5b/Iwr5og+qw
         CMZYeo77UXvcRvETIgzDwOdDVUWDjI1nhnSAYsCnLQDeXW2RuqVddFE1soWUAMTKrbrV
         P1aA==
X-Forwarded-Encrypted: i=1; AJvYcCVpLanIHe5Mch0dhal4gq6GMA1RwUCcpdmndCokmf6s15gT/Gx9vqGQMwKNZGDZeKMakdn2DEWZ2KU/elSJOyOm@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ+xlbxVxEXaredJcmCI3n+9rEn2EfZA/Ka1ceFDe1Jcog15Z1
	pKVv7DO5dnIY/HWX5Q+SwKSsLTfLRR3HFM7eBIj1X+rwNTgdc2AfF6+k08TRX8edTFM7veb8tAG
	lIafG4bgmEQ==
X-Google-Smtp-Source: AGHT+IFROwVfZzwUrc47gwt10xGllcKawPs6+PzhuOzeHVlfd+NhQ3axCf6K4h719pvA/HvyBR0gDvS7G15Lqw==
X-Received: from pji8.prod.google.com ([2002:a17:90b:3fc8:b0:2fc:2ee0:d38a])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4ec7:b0:309:e351:2e3d with SMTP id 98e67ed59e1d1-30a5ae132e5mr18020085a91.12.1746461655808;
 Mon, 05 May 2025 09:14:15 -0700 (PDT)
Date: Mon,  5 May 2025 16:14:06 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250505161412.1926643-1-jiaqiyan@google.com>
Subject: [PATCH v1 0/6] VMM can handle guest SEA via KVM_EXIT_ARM_SEA
From: Jiaqi Yan <jiaqiyan@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	shuah@kernel.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	duenwen@google.com, rananta@google.com, jthoughton@google.com, 
	Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_091417_488767_37D15692 
X-CRM114-Status: GOOD (  22.28  )
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

Problem
=======

When host APEI is unable to claim synchronous external abort (SEA)
during stage-2 guest abort, today KVM directly injects an async SError
into the VCPU then resumes it. The injected SError usually results in
unpleasant guest kernel panic.

One of the major situation of guest SEA is when VCPU consumes recoverable
uncorrected memory error (UER), which is not uncommon at all in modern
datacenter servers with large amounts of physical memory. Although SError
and guest panic is sufficient to stop the propagation of corrupted memory
there is still room to recover from memory UER in a more graceful manner.

Proposed Solution
=================

Alternatively KVM can replay the SEA to the faulting VCPU, via existing
KVM_SET_VCPU_EVENTS API. If the memory poison consumption or the fault
that cause SEA is not from guest kernel, the blast radius can be limited
to the consuming or faulting guest userspace process, so the VM can keep
running.

In addition, instead of doing under the hood without involving userspace,
there are benefits to redirect the SEA to VMM:

- VM customers care about the disruptions caused by memory errors, and
  VMM usually has the responsibility to start the process of notifying
  the customers of memory error events in their VMs. For example some
  cloud provider emits a critical log in their observability UI [1], and
  provides playbook for customers on how to mitigate disruptions to
  their workloads.

- VMM can protect future memory error consumption or faults by unmapping
  the poisoned pages from stage-2 page table with KVM userfault [2],
  which is more performant than splitting the memslot that contains
  the poisoned guest pages.

- VMM can keep track SEA events in the VM. When VMM thinks the status
  on the host or the VM is bad enough, e.g. number of distinct SEAs
  exceeds a threshold, it can restart the VM on another healthy host.

- Behavior parity with x86 architecture. When machine check exception
  (MCE) is caused by VCPU, kernel or KVM signals userspace SIGBUS to
  let VMM either recover from the MCE, or terminate itself with VM.
  The prior RFC proposes to implement SIGBUS on arm64 as well, but
  Marc preferred VCPU exit over signal [3]. However, implementation
  aside, returning SEA to VMM is on par with returning MCE to VMM.

Once SEA is redirected to VMM, among other actions, VMM is encouraged
to inject external aborts into the faulting VCPU, which is already
supported by KVM on arm64, although not fully supported by
KVM_SET_VCPU_EVENTS but complemented in this patchset.

New UAPIs
=========

This patchset introduces following userspace-visiable changes to empower
VMM to control what happens next for guest SEA:

- KVM_CAP_ARM_SEA_TO_USER. If userspace enables this new capability at VM
  creation, KVM will not inject SError while taking SEA, but VM exit to
  userspace.

- KVM_EXIT_ARM_SEA. This is the VM exit reason VMM gets. The details
  about the SEA is provided in arm_sea as much as possible, including
  ESR value at EL2, if guest virtual and physical addresses (GPA and GVA)
  are available and the values if available.

- KVM_CAP_ARM_INJECT_EXT_IABT. VMM today can inject external data abort
  to VCPU via KVM_SET_VCPU_EVENTS API. However, in case of instruction
  abort, VMM cannot inject it via KVM_SET_VCPU_EVENTS.
  KVM_CAP_ARM_INJECT_EXT_IABT is just a natural extend to
  KVM_CAP_ARM_INJECT_EXT_DABT that tells VMM KVM_SET_VCPU_EVENTS now
  supports external instruction abort.

Patchset utilizes commit 26fbdf369227 ("KVM: arm64: Don't translate
FAR if invalid/unsafe") from [4], available already in kvmarm/next.
[4] makes KVM safely do address translation for HPFAR_EL2, including at
the event of SEA, and indicate if HPFAR_EL2 is valid in NS bit.
This patchset depends on [4] to tell userspace if GPA is valid and
its value if valid.

Patchset is based on commit 68ec8b4e84446 ("Merge branch
kvm-arm64/pkvm-6.16 into kvmarm-master/next")

[1] https://cloud.google.com/solutions/sap/docs/manage-host-errors
[2] https://lpc.events/event/18/contributions/1757/attachments/1442/3073/LPC_%20KVM%20Userfault.pdf
[3] https://lore.kernel.org/kvm/86pljbqqh0.wl-maz@kernel.org
[4] https://lore.kernel.org/all/174369514508.3034362.13165690020799838042.b4-ty@linux.dev

Jiaqi Yan (5):
  KVM: arm64: VM exit to userspace to handle SEA
  KVM: arm64: Set FnV for VCPU when FAR_EL2 is invalid
  KVM: selftests: Test for KVM_EXIT_ARM_SEA and KVM_CAP_ARM_SEA_TO_USER
  KVM: selftests: Test for KVM_CAP_INJECT_EXT_IABT
  Documentation: kvm: new uAPI for handling SEA

Raghavendra Rao Ananta (1):
  KVM: arm64: Allow userspace to inject external instruction aborts

 Documentation/virt/kvm/api.rst                | 120 ++++++-
 arch/arm64/include/asm/kvm_emulate.h          |  12 +
 arch/arm64/include/asm/kvm_host.h             |   8 +
 arch/arm64/include/asm/kvm_ras.h              |  21 +-
 arch/arm64/include/uapi/asm/kvm.h             |   3 +-
 arch/arm64/kvm/Makefile                       |   3 +-
 arch/arm64/kvm/arm.c                          |   6 +
 arch/arm64/kvm/guest.c                        |  13 +-
 arch/arm64/kvm/inject_fault.c                 |   3 +
 arch/arm64/kvm/kvm_ras.c                      |  54 +++
 arch/arm64/kvm/mmu.c                          |  12 +-
 include/uapi/linux/kvm.h                      |  12 +
 tools/arch/arm64/include/uapi/asm/kvm.h       |   3 +-
 tools/testing/selftests/kvm/Makefile.kvm      |   2 +
 .../testing/selftests/kvm/arm64/inject_iabt.c | 100 ++++++
 .../testing/selftests/kvm/arm64/sea_to_user.c | 324 ++++++++++++++++++
 tools/testing/selftests/kvm/lib/kvm_util.c    |   1 +
 17 files changed, 654 insertions(+), 43 deletions(-)
 create mode 100644 arch/arm64/kvm/kvm_ras.c
 create mode 100644 tools/testing/selftests/kvm/arm64/inject_iabt.c
 create mode 100644 tools/testing/selftests/kvm/arm64/sea_to_user.c

-- 
2.49.0.967.g6a0df3ecc3-goog


