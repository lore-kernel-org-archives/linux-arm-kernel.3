Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592CFC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 13:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0QzfJ3v+aRb95us3MnZgava0wEqdBBJqMw7WQnYDtqE=; b=Pmd5z/MjRpZOyP4Ay6oTKFWTGd
	l7sHbBd7mOjSu97zUWflr0jCJtfJQbSvg77GIqi7BqL2A0S8Uzhm0jVYEq7NLQBAohTv1De5co2ds
	m24sKuRXn93xkSUA9ytJpe5gsW4leT9kHJHWzCraHiuJxm5i5rzQcnfJwh/T2C3XzKy1Yis0sG9Zm
	O6j/4LtdHzQk28BkORU3SYzU4wEYNho1z8pfbRQUSJ/iPcupoRiotmMrjI2X13jonk8AkLfq1+dD2
	2t5Uw4GvUFGgY8HTqGaz38NcSi8S9ObzhHl0oXTy1TCWJw4orp+iC9d6ajmnsyt8ezF/WzOzMpV1E
	evZTU5ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51ek-0000000Gnmj-2Tga;
	Fri, 11 Sep 2026 13:51:08 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51ei-0000000GnlY-1aT6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 13:51:05 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-49564d4b849so3433235e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 06:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789134662; x=1789739462; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0QzfJ3v+aRb95us3MnZgava0wEqdBBJqMw7WQnYDtqE=;
        b=YilxPHsnSdhmkgGYcOk8xW6jDcfaodwX0G0k5Kjs6AmsVTwtdnwkkC8P44N62NMw9Y
         7t2skq7DUbvLslAqXoWxB1BqkmDZxI7uh+2r/FKi2IhI0gQ7A7zbBbY9sZ+gWi3wSYjK
         7uVzX25Oe8v1IkISzkT1vT2Pgb1MHndoTDdnFz2tWHwjq3DIM3Jn1Mzr+5j/dyTqSjWi
         sGBpJEkvPw5wZNUXmP2zMEoztQdbJl9pKAnO+c+nuPAtkxtHJFyxDuPm8tmcbQ9uB/FW
         FVpP9AWAppKyXJmvvf1u6W0X0RXxYND4TAUjUhPx+2s9Y1ONUsTC/UpsPlNveOq24Mkc
         buXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789134662; x=1789739462;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0QzfJ3v+aRb95us3MnZgava0wEqdBBJqMw7WQnYDtqE=;
        b=ZwgMc/k+6Om4snedOFEL5VgXfeK147OGZhkDSUL5Bw7V38drDbCrDIEFvL285gxwfg
         nIsCoTkhLv1rO0iapSPBDSHCicp73lfKkCtOi9AyUjOpGgPdsU+MWZUT9feQpdNikaqM
         c18uPZQg1Q/IlZCO2rDpEemI4JMn2aGiuZyzJNcrALEd7W27ShBBxquOZwxK8hma+Qo1
         qFz3DVH1i2obv/Ty2vEJ7+quebMcTRUQQasUpGM9qDxtWIYCuMsGnGG1BBaPUpaosxoN
         6EcHxpR94pmk7qs1UZNSAxUhaE2ciSL7BoAnX/kQbVpXGHcUl+CQPUBFOwv8Sw3UGmtl
         xazg==
X-Forwarded-Encrypted: i=1; AKwUvBy1b42Fdb0zDACjDksHymteRyZkJKVYBnu4h59LaQXy6ICEjedMQZbZ6Q5exBgs4jdApb3soo+7Gk6DSSscITbo@lists.infradead.org
X-Gm-Message-State: AFuF++lR6Hxrqoib9PWTd7J3BmgQeSYVkZMLbDAMRIFmlvO6Q6gmJ+Z0
	snd912bR4u4D3xXJTZ3bSA4D+DoVqCZaI/PS+KFwIn0+rkmsvrp1xkQ4IMtDlSPeAFJYqzmIB1W
	q16MOyFUS6V0qsjjBbscRXg==
X-Received: from wmdv10.prod.google.com ([2002:a05:600c:12ca:b0:49d:2629:5e30])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:8485:20b0:49d:1e3d:3b3f with SMTP id 5b1f17b1804b1-49e6198bd27mr3941365e9.8.1789134661787;
 Fri, 11 Sep 2026 06:51:01 -0700 (PDT)
Date: Fri, 11 Sep 2026 14:50:31 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260911135053.146435-1-vdonnefort@google.com>
Subject: [PATCH v2 00/22] Huge mapping support for protected VMs
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_065104_445252_2E415E70 
X-CRM114-Status: GOOD (  15.05  )
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

Currently, pKVM handles stage-2 mappings and ownership tracking strictly
at the PAGE_SIZE level. This series extends pKVM to support PMD_SIZE
block mappings, thereby enabling Transparent Huge Pages (THP) for
protected guests. hugetlbfs is currently unsupported as it does not
appear as swapbacked.

Summary of changes:

1. Enable host stage-2 block-level annotations:

The host stage-2 being annotated with the GFN of the guest on the
host->guest donation transitions, we allow block-level annotations to
ensure the host stage-2 mapping size matches the guest stage-2.

2. Expand ownership transition HVCs:

Enable the ownership test to work with PMD_SIZE so we can test
transitions supporting more than PAGE_SIZE.

3. Implements the PKVM_HYP_REQ_SPLIT hypervisor request:

Allows the hypervisor to ask the host to split a mapping. This ensures
the guest s2, pkvm_mapping tree and host s2 are always using the same
mapping size.

4. Wires up THP support for protected VMs:

Use a PMD_SIZE mapping for protected VMs whenever
transparent_hugepage_adjust() acknowledge the presence of a huge-mapping
in the VMM stage-1.

Changelog:

v2:
  - Reorder patches to make the series bisectable.
  - Check memcache and WARN_ON if stage-2 split fails in __pkvm_host_split_guest()
  - __pkvm_pgtable_stage2_split(): return 0 if the block is already split.
  - kvm_pgtable_stage2_table_install() to let mem_protect handle the stage-2 splitting.
  - Refactor fix_host_ownership() (Wei-Lin)
  - Handle non-linear mappings in fix_host_ownership()
  - Drop _page_ from __pkvm_host_reclaim_page_guest and __pkvm_reclaim_dying_guest_page() (Wei-Lin)
  - Make a separate patch for hyp_poison_range() (Wei-Lin)
  - Use folio_add_pins in __pkvm_pgtable_stage2_split() (Wei-Lin)
  - Hold the mmap_read_lock() for transparent_hugepage_adjust() (Sashiko)
  - Catch 2MiB fault on existing 4KiB fault (Sashiko)
  - Add share/unshare testing of split blocks.
  - Rebased on 7.3-rc2

v1 (https://lore.kernel.org/all/20260803100904.3563942-1-vdonnefort@google.com/)

Keir Fraser (1):
  KVM: arm64: Prefault host stage-2 entries on block split

Vincent Donnefort (21):
  KVM: arm64: Propagate host stage-2 annotated entries on block split
  KVM: arm64: Allow block-level stage-2 annotation
  KVM: arm64: Use block-level annotations when setting up the host
    stage-2
  KVM: arm64: Make pKVM ownership selftest an HVC
  KVM: arm64: Add a range to __pkvm_host_share/unshare_hyp()
  KVM: arm64: Add a range to __pkvm_host_donate_guest()
  KVM: arm64: Add a range to hyp_poison_page()
  KVM: arm64: Add a range to __pkvm_host_reclaim_guest()
  KVM: arm64: Add a range to __pkvm_guest_share_host()
  KVM: arm64: Add a range to __pkvm_guest_unshare_host()
  KVM: arm64: Handle huge mappings in
    __pkvm_host_force_reclaim_page_guest()
  KVM: arm64: Handle huge mappings in __pkvm_vcpu_in_poison_fault()
  KVM: arm64: Add a range to pKVM ownership selftest
  KVM: arm64: Warn on pKVM guest stage-2 block collapse
  KVM: arm64: Add pkvm_hyp_req infrastructure
  KVM: arm64: Introduce kvm_pgtable_stage2_table_install()
  KVM: arm64: Add __pkvm_host_split_guest HVC
  KVM: arm64: Extend pKVM page ownership selftests to cover guest block
    split
  KVM: arm64: Add PKVM_HYP_REQ_SPLIT
  KVM: arm64: Raise PKVM_HYP_REQ_SPLIT on guest to host sharing
  KVM: arm64: Stage-2 huge mappings for protected VMs

 arch/arm64/include/asm/kvm_asm.h              |  14 +-
 arch/arm64/include/asm/kvm_host.h             |  19 +
 arch/arm64/include/asm/kvm_pgtable.h          |  12 +
 arch/arm64/include/asm/kvm_pkvm.h             |  18 +-
 arch/arm64/kvm/arm.c                          |   2 +
 arch/arm64/kvm/handle_exit.c                  |   3 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  25 +-
 arch/arm64/kvm/hyp/include/nvhe/memory.h      |   5 +
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |   6 +-
 arch/arm64/kvm/hyp/nvhe/ffa.c                 |  12 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  48 +-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 588 ++++++++++++------
 arch/arm64/kvm/hyp/nvhe/pkvm.c                |  59 +-
 arch/arm64/kvm/hyp/nvhe/setup.c               | 140 +++--
 arch/arm64/kvm/hyp/pgtable.c                  | 137 +++-
 arch/arm64/kvm/mmu.c                          | 119 ++--
 arch/arm64/kvm/pkvm.c                         | 230 ++++++-
 arch/arm64/kvm/trace_pkvm.h                   |  44 ++
 18 files changed, 1129 insertions(+), 352 deletions(-)
 create mode 100644 arch/arm64/kvm/trace_pkvm.h


base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.55.0.1007.g17ff1f9808-goog


