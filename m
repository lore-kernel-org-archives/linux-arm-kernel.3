Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88654CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 08:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4jsEz9fgJmk0ksX4kLPAefA4ve+DQm6tpFhq1fTW05k=; b=lX1LwkRBW/yEd0fvYhEhmvwe3r
	WfGj7td8tBLFBadAq7l3DyE/8HAj3CZ29/DPu4XYuJchsumSR0+xWClkX5MSmi2ZUG5mZhAmhHvWN
	yIP6gB76j9jPDt7Yt6P8Uso7kf8qEzg5xiLeigqieaofgXGXJxedpfj8dVrMJ8BRl6/PUDoOtf0do
	3M5lJYE3AHQpazwf3jArcCoLP7jWHQovAVgJr6v+Ci/baXYDG9judfbI+TqrXRN1SN3Q86bYGtpfY
	L6MCDflxNhSErSym7cvjP2Qf5JCO9O8T4w+Qj+k6t7eZOjPgcV8GYa7p87npqcqtHqnU4zYf158B+
	GLKR+/EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuBr-00000005kSB-3r88;
	Tue, 09 Sep 2025 08:59:04 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsiV-000000058sL-3VaA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 07:24:41 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45cb6d8f42bso50224395e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 00:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757402678; x=1758007478; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4jsEz9fgJmk0ksX4kLPAefA4ve+DQm6tpFhq1fTW05k=;
        b=JExEJCSXVEuMlEfkb7lykojeQh9t4nX4ydGk1EqGp1L6J5lKsOJPimFxVEA1UTZN77
         aaoocvPRWL+X72xnWI0fWQWhjbQTGV9Hp15GYS8EeTwAjJnJwIn+1PHEsRzr4wvNexaB
         fRNjOR3Ac81ce0VDtP0Z2bdpOEvHDX+G6sBGdVgzzdBRA91rxGgrCzr20QiNdtHQLTlP
         MIj1HZ1tCH0ItnbH47RQ82090sWOXGajyzErRuqaIZCjl1FFEVyIYJPVviwUia468ayH
         Sa9yi7GQ0VUbvl4xZMy3zqzbFaewgRK8gfVYjoljUlfNiz/97w3JkUYJlb4xtFeL0xA3
         6/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757402678; x=1758007478;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4jsEz9fgJmk0ksX4kLPAefA4ve+DQm6tpFhq1fTW05k=;
        b=jkb8zhaQUr1psM+vc0COOjIgoJWe6yGnWP9oDTyybE+j5DLZZsQFAxSkDQCHE+4zN4
         y5zXlQfJEAvekG3Z9ovaUOWqVwECV54Sc8e5e/iffl90SoauuyNvDVD6GYcVbLEUjD5E
         wRCrTQDUBhAVnhohmEwLcjbxS0WMkYCYn5X3l4K7uIkUXGf8X1xRhOdVPMM0VW4zimIT
         W7ZS79cEVHZxcUKUl7Z7kBDljU5BNITXnYuHzTYG3t98Dx7Y1bYy9q6rXLzZbCpyHMsC
         QbmlkzJSQCv6EP/pEEzvpz6r+aVOs3yoF91zBBmSWB0PMmgi0GIqqkKhiTufjvnfoJii
         ETwg==
X-Forwarded-Encrypted: i=1; AJvYcCXqwWRlYzzWJXkv0QgEGsXNbpA6h5kyseyYBO3w5+Q3UexwpKSGc/FgTDSTUN8hozZLDtD34cBzs/386+S30HIU@lists.infradead.org
X-Gm-Message-State: AOJu0YzgchNgrC/znjSZl+QwuY01+mr/Mc6QX6YA3BILmSWMoMolNhM9
	2LQKy40zPd1D7uJ+BvIzVeO4Q/8lkIAL8uwVaixrAhnOPDXKPuKWOka8czYbWmV2dTwaNja8ucZ
	78Q==
X-Google-Smtp-Source: AGHT+IEJrT7+VCqOsjnlAYQHGj+Hsu9QmUjEOE0MGoJ33in3RdQuQRwfShGEQa2Lrq6j1uzXWgMfX9wydA==
X-Received: from wmbei18.prod.google.com ([2002:a05:600c:3f12:b0:458:bdde:5c9b])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:5493:b0:45d:98be:ee9e
 with SMTP id 5b1f17b1804b1-45ddde6a3f0mr85599835e9.1.1757402677896; Tue, 09
 Sep 2025 00:24:37 -0700 (PDT)
Date: Tue,  9 Sep 2025 08:24:27 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250909072437.4110547-1-tabba@google.com>
Subject: [PATCH v4 0/9] KVM: arm64: Reserve pKVM VM handle during initial VM setup
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, broonie@kernel.org, vdonnefort@google.com, 
	qperret@google.com, sebastianene@google.com, keirf@google.com, 
	smostafa@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_002439_878932_2CB27775 
X-CRM114-Status: GOOD (  17.44  )
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

Changes since v3 [1]:
- NOTE: only the last patch (9/9) has changed.
- Fix bug reported by Mark [2]. The existing call to pkvm_init_host_vm()
  wasn't gated by protected mode being enabled, unlike the call to
  pkvm_destroy_hyp_vm(). This imbalance caused failures in non-protected
  mode, especially when creating and destroying multiple VMs. Tested
  with kvm demand_paging_test using nvhe, vhe, and protected.
- Rebase on Linux 6.17-rc5

All VMs in pKVM identified by their handle, a unique per-VM ID. This
handle is shared between the host kernel and the hypvervisor, and used
to track the VM across both.

In pKVM, this handle is allocated when the VM is initialized at the
hypervisor, which is on the first vCPU run. However, the host starts
initializing the VM and setting up its data structures earlier. MMU
notifiers for the VMs are also registered before VM initialization at
the hypervisor, and rely on the handle to identify the VM [3].
Therefore, there is a potential gap between when the VM is (partially)
setup at the host, but still without a valid pKVM handle to identify it
when communicating with the hypervisor.

Additionally, in the future, the host needs to communicate with
TrustZone about the before the VM first run. Therefore, move handle
creation to when the VM is first initialized at the host.

This patch series also takes the oportunity to do some refactoring
(mostly renaming and fixing documentation) of the code. We are in the
process of upstreaming pKVM. Refactoring this code now would generate
less churn than postponing it, as the upstreamed codebase grows.
Moreover, the exsiting names and documentation are at best misleading
(and in cases actually wrong), which could lead to more confusion and
problems reviewing code in the future.

This patch series is divided into two parts:

- Patches 1-5: Renaming, refactoring, and tidying up to lay the
  groundwork for moving handle initialization and to fix existing
  issues.
- Patches 6-9: Decouple handle creation from VM initialization at the
  hypervisor and move the handle creation to VM initialization at the
  host.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20250827101949.4089456-1-tabba@google.com/
[2] https://lore.kernel.org/all/1a248f14-60f2-4f8f-8b4d-3c63e602fd54@sirena.org.uk/
[3] https://lore.kernel.org/all/20250303214947.GA30619@willie-the-truck/

Fuad Tabba (9):
  KVM: arm64: Add build-time check for duplicate DECLARE_REG use
  KVM: arm64: Rename pkvm.enabled to pkvm.is_protected
  KVM: arm64: Rename 'host_kvm' to 'kvm' in pKVM host code
  KVM: arm64: Clarify comments to distinguish pKVM mode from protected
    VMs
  KVM: arm64: Decouple hyp VM creation state from its handle
  KVM: arm64: Separate allocation and insertion of pKVM VM table entries
  KVM: arm64: Consolidate pKVM hypervisor VM initialization logic
  KVM: arm64: Introduce separate hypercalls for pKVM VM reservation and
    initialization
  KVM: arm64: Reserve pKVM handle during pkvm_init_host_vm()

 arch/arm64/include/asm/kvm_asm.h              |   2 +
 arch/arm64/include/asm/kvm_host.h             |   5 +-
 arch/arm64/include/asm/kvm_pkvm.h             |   1 +
 arch/arm64/kvm/arm.c                          |  14 +-
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |   4 +-
 .../arm64/kvm/hyp/include/nvhe/trap_handler.h |   3 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  14 ++
 arch/arm64/kvm/hyp/nvhe/pkvm.c                | 177 +++++++++++++-----
 arch/arm64/kvm/pkvm.c                         |  76 +++++---
 9 files changed, 221 insertions(+), 75 deletions(-)


base-commit: 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c
-- 
2.51.0.384.g4c02a37b29-goog


