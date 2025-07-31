Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94126C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 21:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1DNL4ZqkcIvug0P6zNDToFEaRqlmYm3XRLwrpfrR4hk=; b=Onmv8XfLkt/4Tl8Jmr+ahCOCSm
	fcwJH+NAO2WoTdgw5+ajLQCD+eNpRAA+XxUdipLqtQf60xH/3AT365Zn0leIdapChAt21qgYZNfd1
	oFasCUtHuVErTLmQPS36adDmxojtBMcFsovLM+mVbGSb/OiGVfjGHHgESFh+2ckbG0XZMbtj7mew/
	B/D1qvb6u1MmQN75HgAy7rIAj3KYfVB2/GkyHBJ1evatVd+PX8F/P/LTY7MNz4sZPWFvwZSA4KK9P
	IgnCEf1IurBIyp0bO12/rKs3OdlSNMqsE17X7aR/k9jCgLIEe7ue3HGqDI2q6HKEeCak3m4vb/Lnf
	7kAFofQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhaPB-00000004Ply-0Jh5;
	Thu, 31 Jul 2025 21:01:37 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhaMZ-00000004PN5-0uke
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 20:58:56 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-31f5f70a07bso209720a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 13:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753995534; x=1754600334; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1DNL4ZqkcIvug0P6zNDToFEaRqlmYm3XRLwrpfrR4hk=;
        b=xJeO8Cul/9/Ly4w8pM0RcFS7shVnScfPd4TCkFtODKfhgpHXy086uzt4cjfzb2mL3+
         YdMwv1xvtPBjgUGR7QNkohF9Nqalh43vZeCEqbwGXjvv6YEvZUCw9ZWLaToRTSkINLwz
         FoRZlzo/IEjj0C+k58AnMI4D2OTWgDUT1uWSCSuJ726XrZAt+ALyFgLpnQMn0VOoia4t
         W2mDeoKmJ6Z9lIOEQ8983r9HFzWDKBBbcmJWtSVEftme8kB+kRJLI+wGH3ecsLx/yhpg
         ZcD7TUhiZn/dTKNcLvJldbTGi4CvoX3RtuW33r6FqZIfSIFfBBgWMOGzrB13E3nt5y5q
         hRWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753995534; x=1754600334;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1DNL4ZqkcIvug0P6zNDToFEaRqlmYm3XRLwrpfrR4hk=;
        b=Chqfn2kRyYVvv8rIO8YLDjp7lh3WIFYrAdRF683NCG09etKmfMAudJa0MOEjQ76JMy
         KulMnUKdQ7LOPuoEexIJIBpLmPTXE9rmV8Znl3Se3x2ZjdU4PaHn3hWDt6APVHqYiDUr
         y5gIpXRxXzBj1yd2S+faJo//bh65v5A6ZAMB7HjZOXg0rC5/Z56mqHSPRRxp85fxtUoO
         pAE3zvUyLcoAjNlqcZYptvEvBT9SjSaN/zOmhXts20YplqUsqmBig7AZJhUgW448h0yZ
         GV/KPhKySKAFHdo7SB/lbZfZGkwQt8wrEOMlb0Le949lcbby1jCqFG4QWUxuxsjcHLVs
         cXkw==
X-Forwarded-Encrypted: i=1; AJvYcCX2HKEm9dQ8vg/fWqjB0XNEtWtk3NCOwy7V5NafS8Ox/6C+Iz7fVCT/j6jCMb6TdJVI1ihAcJxiks2IFaDw9rld@lists.infradead.org
X-Gm-Message-State: AOJu0YyGhRqDFZhpTTv7BTFL1xVBivaNVOAKc7qwLf6B8/qmrrjPXTkr
	uVKzG8e3k8ljUEMbu4wU3PydMrxNjdL5YVZ1irY9TIXrnlPwYXlqao+Ea19u5QL9J79JZPWGbm+
	8Oukwsco7zFV/Xg==
X-Google-Smtp-Source: AGHT+IFtBee05Y+0YcwYG+qw66EBKTnwyLUw2Zd87HU0sy3vcGl9Liy/DQSHpFber1pJeKsCOjefFdN8peNhiQ==
X-Received: from pji5.prod.google.com ([2002:a17:90b:3fc5:b0:31c:2fe4:33b6])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:39c5:b0:311:ea13:2e70 with SMTP id 98e67ed59e1d1-31f5de3ceb7mr12431905a91.14.1753995533793;
 Thu, 31 Jul 2025 13:58:53 -0700 (PDT)
Date: Thu, 31 Jul 2025 20:58:41 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250731205844.1346839-1-jiaqiyan@google.com>
Subject: [PATCH v3 0/3] VMM can handle guest SEA via KVM_EXIT_ARM_SEA
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
X-CRM114-CacheID: sfid-20250731_135855_256684_95DF2282 
X-CRM114-Status: GOOD (  20.63  )
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

When host APEI is unable to claim a synchronous external abort (SEA)
during guest abort, today KVM directly injects an asynchronous SError
into the VCPU then resumes it. The injected SError usually results in
unpleasant guest kernel panic.

One of the major situation of guest SEA is when VCPU consumes recoverable
uncorrected memory error (UER), which is not uncommon at all in modern
datacenter servers with large amounts of physical memory. Although SError
and guest panic is sufficient to stop the propagation of corrupted memory,
there is room to recover from an UER in a more graceful manner.

Proposed Solution
=================

The idea is, we can replay the SEA to the faulting VCPU. If the memory
error consumption or the fault that cause SEA is not from guest kernel,
the blast radius can be limited to the poison-consuming guest process,
while the VM can keep running.

In addition, instead of doing under the hood without involving userspace,
there are benefits to redirect the SEA to VMM:

- VM customers care about the disruptions caused by memory errors, and
  VMM usually has the responsibility to start the process of notifying
  the customers of memory error events in their VMs. For example some
  cloud provider emits a critical log in their observability UI [1], and
  provides a playbook for customers on how to mitigate disruptions to
  their workloads.

- VMM can protect future memory error consumption by unmapping the poisoned
  pages from stage-2 page table with KVM userfault [2], or by splitting the
  memslot that contains the poisoned pages.

- VMM can keep track of SEA events in the VM. When VMM thinks the status
  on the host or the VM is bad enough, e.g. number of distinct SEAs
  exceeds a threshold, it can restart the VM on another healthy host.

- Behavior parity with x86 architecture. When machine check exception
  (MCE) is caused by VCPU, kernel or KVM signals userspace SIGBUS to
  let VMM either recover from the MCE, or terminate itself with VM.
  The prior RFC proposes to implement SIGBUS on arm64 as well, but
  Marc preferred KVM exit over signal [3]. However, implementation
  aside, returning SEA to VMM is on par with returning MCE to VMM.

Once SEA is redirected to VMM, among other actions, VMM is encouraged
to inject external aborts into the faulting VCPU.

New UAPIs
=========

This patchset introduces following userspace-visible changes to empower
VMM to control what happens for SEA on guest memory:

- KVM_CAP_ARM_SEA_TO_USER. While taking SEA, if userspace has enabled
  this new capability at VM creation, and the SEA is not owned by kernel
  allocated memory, instead of injecting SError, return KVM_EXIT_ARM_SEA
  to userspace.

- KVM_EXIT_ARM_SEA. This is the VM exit reason VMM gets. The details
  about the SEA is provided in arm_sea as much as possible, including
  sanitized ESR value at EL2, faulting guest virtual and physical
  addresses if available.

* From v2 [4]:
  - Rebased on "[PATCH] KVM: arm64: nv: Handle SEAs due to VNCR redirection" [5]
    and kvmarm/next commit 7b8346bd9fce ("KVM: arm64: Don't attempt vLPI
    mappings when vPE allocation is disabled")
  - Took the host_owns_sea implementation from Oliver [6, 7].
  - Excluded the guest SEA injection patches.
  - Updated selftest.

* From v1 [8]:
  - Rebased on commit 4d62121ce9b5 ("KVM: arm64: vgic-debug: Avoid
    dereferencing NULL ITE pointer").
  - Sanitize ESR_EL2 before reporting it to userspace.
  - Do not do KVM_EXIT_ARM_SEA when SEA is caused by memory allocated to
    stage-2 translation table.

[1] https://cloud.google.com/solutions/sap/docs/manage-host-errors
[2] https://lore.kernel.org/kvm/20250109204929.1106563-1-jthoughton@google.com
[3] https://lore.kernel.org/kvm/86pljbqqh0.wl-maz@kernel.org
[4] https://lore.kernel.org/kvm/20250604050902.3944054-1-jiaqiyan@google.com/
[5] https://lore.kernel.org/kvmarm/20250729182342.3281742-1-oliver.upton@linux.dev/
[6] https://lore.kernel.org/kvm/aHFohmTb9qR_JG1E@linux.dev/#t
[7] https://lore.kernel.org/kvm/aHK-DPufhLy5Dtuk@linux.dev/
[8] https://lore.kernel.org/kvm/20250505161412.1926643-1-jiaqiyan@google.com

Jiaqi Yan (3):
  KVM: arm64: VM exit to userspace to handle SEA
  KVM: selftests: Test for KVM_EXIT_ARM_SEA
  Documentation: kvm: new UAPI for handling SEA

 Documentation/virt/kvm/api.rst                |  61 ++++
 arch/arm64/include/asm/kvm_host.h             |   2 +
 arch/arm64/kvm/arm.c                          |   5 +
 arch/arm64/kvm/mmu.c                          |  68 +++-
 include/uapi/linux/kvm.h                      |  10 +
 tools/arch/arm64/include/asm/esr.h            |   2 +
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../testing/selftests/kvm/arm64/sea_to_user.c | 327 ++++++++++++++++++
 tools/testing/selftests/kvm/lib/kvm_util.c    |   1 +
 9 files changed, 476 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/kvm/arm64/sea_to_user.c

-- 
2.50.1.565.gc32cd1483b-goog


