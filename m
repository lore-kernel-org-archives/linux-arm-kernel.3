Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3412AE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 20:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zwxnelFEQr4C3vtPtPgRGtQjenWxHSmpAHQLFMvsChA=; b=3gTbNLsPgalz1cpBOobL6733EC
	2sCn3WLBaJeXBQ98xVQtbo+df66Gw4JBFDm1SjOrCCYG185/sPfttcuJz1RkrrTs3bZwXqBlx+ZKN
	pn2N08e4UC7w/56abTiuCFTHMxIlp/ay5w1pXddF2Jg3i++bvMcWGGsVKRp0yclkF2wtQnBKwcshb
	XGeIfcdnj3tYLKMhLKew31/UpxER4xuZHxYjlxuEUNydZhFLHVG+EY9zaquLgOum1MVOt5zeU/iHZ
	tdzT59rqFKl67GWNaGbaWrD9TN8wA/v0cnnqxnScexjuWpHUS5UnP7DVg7oxG5cAwRRFMrs3Eb00M
	eD/fUkZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzVm-0000000DHMc-3CXK;
	Thu, 09 Jan 2025 20:52:14 +0000
Received: from mail-vs1-xe4a.google.com ([2607:f8b0:4864:20::e4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzTZ-0000000DGUu-12A4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 20:49:58 +0000
Received: by mail-vs1-xe4a.google.com with SMTP id ada2fe7eead31-4afd9b88ac2so195527137.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 12:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736455795; x=1737060595; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zwxnelFEQr4C3vtPtPgRGtQjenWxHSmpAHQLFMvsChA=;
        b=gEpTcly42EC4KWdK7ZzGPAJXljfma5t9QrzA9FJCsSvqKpjBiuHT9ZCV5reKOKMepu
         NxhqFctz+2SO+e54atYMfybS8sVS2CPdKZlEfJdzKPxRnlMSzsSUZa1+qs1eHwFn1aoi
         k8bxz2B8KVoCH4h5eQeosv75urXr5xfv25EL0FlptqukvaapcKBbed8vDUMlYGp3CYcZ
         /4k6XqXxQbf26IoJS99G5Lq+ir4lI6QMgAfmxwN3fvB1P4yQuCsf39u5ysiyEM+Jgydj
         TBpioSs64u3IUKInlw6mRKpX1d+R8DCrlZtXWN0CbfQcj6piypYiaQuNP2MHgNmBCUC1
         I8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736455795; x=1737060595;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zwxnelFEQr4C3vtPtPgRGtQjenWxHSmpAHQLFMvsChA=;
        b=sGQASJIFNZfPGFtoz0GinrhvFxZGCJiLqyUCC/rfb149Awx8Jmsm/IBo1hS1eUWdFV
         9CGDaQFPB0QSsOo1gKmmNhbUDJ+WNJkybqP+Lh16vcgKU1Vy0+1JpzELCzKAu+oYcfqA
         FsPRL4FybNkqXAfQVjHIcM+eUmJKdCJ7QN15UsdCRAjzLE1a8VmSoIhaWK5zzHCNW9Cb
         QgR39+1eks062cQdAdK0/LTgdEXAsMgTk960V0VIq+fJDX+Z0uIci30IJfut5hDqlepv
         nAl2MGChC7hEihZL/tCnGcgekkshQtLa5MptMZNhzo6zA3Zy6gCLh06bYLGkORTSlSD2
         ec1g==
X-Forwarded-Encrypted: i=1; AJvYcCXKv3vl5UNfRylxMkaJvTlWYg678X+nGjvBItXjpMBkb91/iE9xYB/Km7OBhKhXiTmeXRLwnyOdnrKo6l7RrtDt@lists.infradead.org
X-Gm-Message-State: AOJu0YyLuFpiWhiYPKzmcTQqrEJ3rFUcpfsA1zWWu01ZAlfHrDQZrFuX
	pERBBdWjLOFIzVftYoeAXZkAJucA7L/Ysyf255vLeesCDnETXD4goEsx2QLa7LkW1Jdjpo4y6N7
	lUzaZ0qF0BaI8pewtsA==
X-Google-Smtp-Source: AGHT+IEQb1u/rfnn1fSyPTU2pPIfyZ5lKsGhAlzX80eQpvo3eWAajg+PF8bqh67MyuBcqLLCXncCH9d2iaL7ubsN
X-Received: from vsbbq8.prod.google.com ([2002:a05:6102:5348:b0:4af:b35d:162c])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:2b92:b0:4af:f892:e9f0 with SMTP id ada2fe7eead31-4b3d0f2d8f1mr8447963137.14.1736455795460;
 Thu, 09 Jan 2025 12:49:55 -0800 (PST)
Date: Thu,  9 Jan 2025 20:49:16 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109204929.1106563-1-jthoughton@google.com>
Subject: [PATCH v2 00/13] KVM: Introduce KVM Userfault
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_124957_303283_462AC53E 
X-CRM114-Status: GOOD (  14.43  )
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

This is a v2 of KVM Userfault, mostly unchanged from v1[5]. Changelog here:

v1->v2:
- For arm64, no longer zap stage 2 when disabling KVM_MEM_USERFAULT
  (thanks Oliver).
- Fix the userfault_bitmap validation and casts (thanks kernel test
  robot).
- Fix _Atomic cast for the userfault bitmap in the selftest (thanks
  kernel test robot).
- Pick up Reviewed-by on doc changes (thanks Bagas).

And here is a trimmed down cover letter from v1, slightly modified
given the small arm64 change:

Please see the RFC[1] for the problem description. In summary,
guest_memfd VMs have no mechanism for doing post-copy live migration.
KVM Userfault provides such a mechanism.

There is a second problem that KVM Userfault solves: userfaultfd-based
post-copy doesn't scale very well. KVM Userfault when used with
userfaultfd can scale much better in the common case that most post-copy
demand fetches are a result of vCPU access violations. This is a
continuation of the solution Anish was working on[3]. This aspect of
KVM Userfault is important for userfaultfd-based live migration when
scaling up to hundreds of vCPUs with ~30us network latency for a
PAGE_SIZE demand-fetch.

The implementation in this series is version than the RFC[1]. It adds...
 1. a new memslot flag is added: KVM_MEM_USERFAULT,
 2. a new parameter, userfault_bitmap, into struct kvm_memory_slot,
 3. a new KVM_RUN exit reason: KVM_MEMORY_EXIT_FLAG_USERFAULT,
 4. a new KVM capability KVM_CAP_USERFAULT.

KVM Userfault does not attempt to catch KVM's own accesses to guest
memory. That is left up to userfaultfd.

When enabling KVM_MEM_USERFAULT for a memslot, the second-stage mappings
are zapped, and new faults will check `userfault_bitmap` to see if the
fault should exit to userspace.

When KVM_MEM_USERFAULT is enabled, only PAGE_SIZE mappings are
permitted.

When disabling KVM_MEM_USERFAULT, huge mappings will be reconstructed
consistent with dirty log disabling. So on x86, huge mappings will be
reconstructed, but on arm64, they won't be.

KVM Userfault is not compatible with async page faults. Nikita has
proposed a new implementation of async page faults that is more
userspace-driven that *is* compatible with KVM Userfault[4].

See v1 for more performance details[5]. They are unchanged in this v2.

This series is based on the latest kvm/next.

[1]: https://lore.kernel.org/kvm/20240710234222.2333120-1-jthoughton@google.com/
[2]: https://lpc.events/event/18/contributions/1757/
[3]: https://lore.kernel.org/all/20240215235405.368539-1-amoorthy@google.com/
[4]: https://lore.kernel.org/kvm/20241118123948.4796-1-kalyazin@amazon.com/#t
[5]: https://lore.kernel.org/kvm/20241204191349.1730936-1-jthoughton@google.com/

James Houghton (13):
  KVM: Add KVM_MEM_USERFAULT memslot flag and bitmap
  KVM: Add KVM_MEMORY_EXIT_FLAG_USERFAULT
  KVM: Allow late setting of KVM_MEM_USERFAULT on guest_memfd memslot
  KVM: Advertise KVM_CAP_USERFAULT in KVM_CHECK_EXTENSION
  KVM: x86/mmu: Add support for KVM_MEM_USERFAULT
  KVM: arm64: Add support for KVM_MEM_USERFAULT
  KVM: selftests: Fix vm_mem_region_set_flags docstring
  KVM: selftests: Fix prefault_mem logic
  KVM: selftests: Add va_start/end into uffd_desc
  KVM: selftests: Add KVM Userfault mode to demand_paging_test
  KVM: selftests: Inform set_memory_region_test of KVM_MEM_USERFAULT
  KVM: selftests: Add KVM_MEM_USERFAULT + guest_memfd toggle tests
  KVM: Documentation: Add KVM_CAP_USERFAULT and KVM_MEM_USERFAULT
    details

 Documentation/virt/kvm/api.rst                |  33 +++-
 arch/arm64/kvm/Kconfig                        |   1 +
 arch/arm64/kvm/mmu.c                          |  26 +++-
 arch/x86/kvm/Kconfig                          |   1 +
 arch/x86/kvm/mmu/mmu.c                        |  27 +++-
 arch/x86/kvm/mmu/mmu_internal.h               |  20 ++-
 arch/x86/kvm/x86.c                            |  36 +++--
 include/linux/kvm_host.h                      |  19 ++-
 include/uapi/linux/kvm.h                      |   6 +-
 .../selftests/kvm/demand_paging_test.c        | 145 ++++++++++++++++--
 .../testing/selftests/kvm/include/kvm_util.h  |   5 +
 .../selftests/kvm/include/userfaultfd_util.h  |   2 +
 tools/testing/selftests/kvm/lib/kvm_util.c    |  42 ++++-
 .../selftests/kvm/lib/userfaultfd_util.c      |   2 +
 .../selftests/kvm/set_memory_region_test.c    |  33 ++++
 virt/kvm/Kconfig                              |   3 +
 virt/kvm/kvm_main.c                           |  54 ++++++-
 17 files changed, 419 insertions(+), 36 deletions(-)


base-commit: 10b2c8a67c4b8ec15f9d07d177f63b563418e948
-- 
2.47.1.613.gc27f4b7a9f-goog


