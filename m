Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F7CCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 18:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3zyOsXjgR2slTOTUParrmMvaOPp3Y8R1z3YFebNy+kY=; b=BrQO891Ku12O6Wyz+Sxw5DrK8t
	wllDM8dGIv278PZzbMSU0bwgZKnYKhRfF882e3cYjIwWNBo2ybk/22mEu2g33iaYQoDL2uCvWaiFw
	J7Id5Jo2Cnbqhxolnm0/RsxaSpieaWY6PnhDyj9CRqBdLKoN+WSL1J1Va5Lw5S0p69t0PnizSmPPP
	5BZ1FDEvOcV+t+bjwuVc6woRuyCkxvpLoue1Cv4SnVD5RvjF48Tse+ye8ZSlV57Sc687VHzGNGuZR
	rGhyep7oOfKDEJHoeBvyOVYeMqVXcPaPXwplKq98ctrP3JPxgaHlWgmRfA0sjlN6hOmJydCSpAKUY
	Ke2YpMWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8NlI-0000000ED4w-1v5V;
	Mon, 13 Oct 2025 18:59:12 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8NlG-0000000ED4D-1nen
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 18:59:11 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-32ee4998c50so8728231a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 11:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760381948; x=1760986748; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3zyOsXjgR2slTOTUParrmMvaOPp3Y8R1z3YFebNy+kY=;
        b=J6s+1sagPnzRFqA97S8x5H6p+xtuz7UTLXLR/lWYoKKkMphHsH4F7zxbTZAY0MPR3M
         DmwbvfkWSuk8WMrZBLJXOVuFtr6uec9o/rc/67ytbYAFec1k5z0rYYoGnGotAvoL+M80
         zbnAPAf9h0ab3mSwijT85uYFwJFlZMehE4MEdOt80eaH3tDvEQVuzlz6NZ6sR4p4ehEb
         kKIaQ6AH8RTb2nTklWy5E4Y3RN9wJyysrC1iTpUdEqnGss3Uub4zc1nCWbJuhEgMOvBE
         fAXJBttZFNWj5pZKZWYvd213LIMRbojwhrB6nujfiV3fl4x4n37cGGEw8a+5hDe0iixk
         1n1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760381948; x=1760986748;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3zyOsXjgR2slTOTUParrmMvaOPp3Y8R1z3YFebNy+kY=;
        b=sYwpX7HlSGQZkPO6jWrlDgh/YUFHmBUFZllMHW1NCJuoxRz4R6IDdD3JtNlpLOOw7I
         ldhqn+fOxOSBYG7r6fRJonfT2e/dSe5AMTzI0oTnmc3rLpFcFbSmKXQiZCfuC0wa1FaJ
         NZbFEfJfmYqIL0IChQUnxrOzdld/944cMQltmJERFkvSWoEt7z5/nDUCuZRWxJ8SyyI2
         V30H5MGlg9qiHfAWftqj01laXnHT0sXpIy2QhOFJZejSfIxCdEcEdNtqPE62b6qrl5L0
         UgMjJvBIJINu3dASFh1/KqgZbUnJF8jVKrv10PDdEgIpjdfqDZ+30zT+Pu+M89kgFGew
         wE4g==
X-Forwarded-Encrypted: i=1; AJvYcCX40tXSHD3XWGljPoOG7gVyZANNWzSgLckKXGQsAFW1Z7xbNeafKemVvNm5JnA+VLDXn51i1yuiXnPiDqw2iHtU@lists.infradead.org
X-Gm-Message-State: AOJu0YzzdxeRsJvFejgumtKdhHW9zMxSBZLnpZvE3c4GjbHu4tjB6uO7
	82dAfiSP+9K/vYLLS7rsHX9WJ2gcsKelGPNPt4/2m0ziYhlNOREwNC8z94hUfD80gUTy5+9cdR5
	9PsN/IPRIJ9+bhg==
X-Google-Smtp-Source: AGHT+IFQCZ0F3mAV98Keda3BZRrx76PXArL7t60ZigncnYG4BTa+6j6T70pbIysH6cLO49q77f6O/f7NZYgb1A==
X-Received: from pjbkw19.prod.google.com ([2002:a17:90b:2213:b0:330:8c66:4984])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3e82:b0:339:a4ef:c8b9 with SMTP id 98e67ed59e1d1-33b5127ac7fmr33043099a91.17.1760381947731;
 Mon, 13 Oct 2025 11:59:07 -0700 (PDT)
Date: Mon, 13 Oct 2025 18:59:00 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.760.g7b8bcc2412-goog
Message-ID: <20251013185903.1372553-1-jiaqiyan@google.com>
Subject: [PATCH v4 0/3] VMM can handle guest SEA via KVM_EXIT_ARM_SEA
From: Jiaqi Yan <jiaqiyan@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: duenwen@google.com, rananta@google.com, jthoughton@google.com, 
	vsethi@nvidia.com, jgg@nvidia.com, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	pbonzini@redhat.com, corbet@lwn.net, shuah@kernel.org, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_115910_494446_323A39B4 
X-CRM114-Status: GOOD (  20.70  )
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

* From v3 [4]
  - Rebased on commit 3a8660878839 ("Linux 6.18-rc1").
  - In selftest, print a message if GVA or GPA expects to be valid.

* From v2 [5]:
  - Rebased on "[PATCH] KVM: arm64: nv: Handle SEAs due to VNCR redirection" [6]
    and kvmarm/next commit 7b8346bd9fce6 ("KVM: arm64: Don't attempt vLPI
    mappings when vPE allocation is disabled")
  - Took the host_owns_sea implementation from Oliver [7, 8].
  - Excluded the guest SEA injection patches.
  - Updated selftest.

* From v1 [9]:
  - Rebased on commit 4d62121ce9b5 ("KVM: arm64: vgic-debug: Avoid
    dereferencing NULL ITE pointer").
  - Sanitize ESR_EL2 before reporting it to userspace.
  - Do not do KVM_EXIT_ARM_SEA when SEA is caused by memory allocated to
    stage-2 translation table.

[1] https://cloud.google.com/solutions/sap/docs/manage-host-errors
[2] https://lore.kernel.org/kvm/20250109204929.1106563-1-jthoughton@google.com
[3] https://lore.kernel.org/kvm/86pljbqqh0.wl-maz@kernel.org
[4] https://lore.kernel.org/kvmarm/20250731205844.1346839-1-jiaqiyan@google.com
[5] https://lore.kernel.org/kvm/20250604050902.3944054-1-jiaqiyan@google.com
[6] https://lore.kernel.org/kvmarm/20250729182342.3281742-1-oliver.upton@linux.dev
[7] https://lore.kernel.org/kvm/aHFohmTb9qR_JG1E@linux.dev
[8] https://lore.kernel.org/kvm/aHK-DPufhLy5Dtuk@linux.dev
[9] https://lore.kernel.org/kvm/20250505161412.1926643-1-jiaqiyan@google.com

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
 .../testing/selftests/kvm/arm64/sea_to_user.c | 331 ++++++++++++++++++
 tools/testing/selftests/kvm/lib/kvm_util.c    |   1 +
 9 files changed, 480 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/kvm/arm64/sea_to_user.c

-- 
2.51.0.760.g7b8bcc2412-goog


