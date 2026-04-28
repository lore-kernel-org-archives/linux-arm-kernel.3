Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8AE0FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 10:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ybPE6uBPAKDLSIVRQh3Dd/khXkWqQgT9nsbAgFbes8s=; b=wNXnvlUUR7MBWuk4YfFMNVs6nA
	JrWMje8psuwbPTRJ0cSLcPoGyz6pK5rlhwYBF5lAKYuPCUEg8+2juBbIilMBaRFsT7jmkG+5+j1Pj
	O6RSITE+6uThempQA2WnTWxtyQrwp6Mqji8/2LiNZBtJ6AloDa8KY0Ux4hogXsEo8b8KaXwkSTzS6
	PrD2xVPnAoWBdyGRmSZasq397k9Ue6zsmWPN9i3kT7vp6rjvz8S0ixjkiH44tk+zAw16QqP9Yw6kI
	YGnbts/7sIm5U7RDzMiZpwsOD4GeGkQGevGdo+uEmwgQA5xWQflpijq1wW8D9nKZmDOgtw6ub2efG
	44Ce7B/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfhm-00000001AgH-2fFf;
	Tue, 28 Apr 2026 10:30:14 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfhj-00000001Af6-3Ut5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 10:30:13 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-488c2aa6becso103172015e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 03:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777372209; x=1777977009; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ybPE6uBPAKDLSIVRQh3Dd/khXkWqQgT9nsbAgFbes8s=;
        b=PkDeVt/+GyDXK3W4GWVlAwjhwABi9WvgZ7u4glOzIqBtcNUPQfmLGMdhBT0ONTVzS2
         CEPsOJRq57qYXYwwvxJIjmuRt5kwg7w/+bZCNWCDEaPa3HMhydcc51TNULaFn7PVcaN6
         /koRj18EyZUzzXsL0/8lCfe2xD9q4pKdLjMqW59ym1ho0NGnxyp1QiQ3ljJuTjXPM364
         jrnQzr7CyTawF8sylgIX/1ab2eEFt+52213yMAKCtBvv7cZ7u01ZRtpWj3/r9X1aYeoD
         O1/aOKb/34tyaOM5kyAcut6+A+42D7Qj5M+8cwBHVHpolZ0AmSqGTnPHTT8bgPLKwYbd
         O1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777372209; x=1777977009;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ybPE6uBPAKDLSIVRQh3Dd/khXkWqQgT9nsbAgFbes8s=;
        b=IimZpmQtU+0TWsbS9lD+oJO9pY5RaCiZRvWIENaZymX5r+jsu4aMCPuILpou4kTQ2M
         qqNt7nrOS8oIjfB/E3Q2yeNJuIUd2YlYDMezDwwb2+PaYitBZfVyGVPD/x+lAeVTANor
         2JvFFlm/Ks9P4J0LHycjXbshcbhtEUzHyscpgbcVCDTFOCW7jkSt6dHybuuLCNuIVnaX
         wo8mOsObZIfjqO1QqJmd/XoHIX8OKZgG4Zm/JQ8wn4tRiaevM5GSqzE8ZIhVK8LG6TmG
         bmPQXjr7L2QBBM0omjgOQsxB630y/QFVRr0FM14vUZe7sZNb3I4s2+22h/rO7f14enWi
         5Zvg==
X-Forwarded-Encrypted: i=1; AFNElJ+dGkyLsYavcCZvdU0uDEJEEk0HTmdpLuhjrPbVnFecuoM3z9m8HqgeBvNQl589tDt8SRJNV87LExwbyd50Z+jP@lists.infradead.org
X-Gm-Message-State: AOJu0YxBwVyxotTJ7E07gk07+kD1xvpAoQVL/Fsk9mmtwsXTLFU5Jmex
	EmrZjjhgeClpeE1NMq4iU5oLxZx+XLz4cmhvFKxlcgIoasZkZ36ApEXBmwsQEilHJSH7YBeBPmZ
	8Ew==
X-Received: from wmby10.prod.google.com ([2002:a05:600c:c04a:b0:486:fca5:7a8d])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a013:b0:48a:563c:c8e0
 with SMTP id 5b1f17b1804b1-48a77ad5a89mr41979925e9.1.1777372209349; Tue, 28
 Apr 2026 03:30:09 -0700 (PDT)
Date: Tue, 28 Apr 2026 11:30:00 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428103008.696141-1-tabba@google.com>
Subject: [PATCH 0/8] KVM: arm64: EL2 synchronisation and pKVM stage-2 error
 propagation fixes
From: Fuad Tabba <tabba@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: james.morse@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	qperret@google.com, vdonnefort@google.com, tabba@google.com, 
	catalin.marinas@arm.com, will@kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_033011_890409_FEB7F824 
X-CRM114-Status: GOOD (  15.17  )
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

This is yet another series of fixes I'd like to land before posting a
follow-up to Will's pKVM infrastructure series [1].

I found these while developing KVM and arm64 system guides for
review-prompts [2], an open-source set of AI-assisted review prompts
used by sashiko [3]. While writing the guides I tried to find cases
that would be easy to miss or trip up an LLM, and stumbled on these
bugs. A local run with the updated guides flagged all of them
correctly (some of the commit messages incorporate feedback from that
run, e.g., the impact of WARN_ON() in hyp). I plan to upstream the
guides once they are complete.

The patches fall into three groups:

EL2 context-synchronisation (patches 1-2):

  Patch 1 sets SCTLR_EL2.EIS and SCTLR_EL2.EOS in
  INIT_SCTLR_EL2_MMU_ON. On FEAT_ExS hardware these bits are
  UNKNOWN at reset; without them EL2 exception entry and exit are
  not architecturally guaranteed to be Context Synchronisation
  Events. KVM/arm64 hot paths rely on that guarantee implicitly to
  elide explicit ISBs after MSRs to context-switching sysregs.

  Patch 2 adds an explicit ISB after write_sysreg_hcr() on the
  __deactivate_traps() path. The activate path is covered by the
  ERET that follows (a CSE, guaranteed by patch 1); on the
  deactivate path, subsequent EL2 sysreg accesses run before any
  natural CSE.

Minor fixes (patches 3-4):

  Patch 3 fixes a parameter-name typo in __deactivate_fgt() that
  causes it to silently capture a variable from the enclosing scope
  rather than use its declared parameter.

  Patch 4 guards the VHE hyp panic path against a NULL vcpu pointer;
  the nVHE counterpart already has this guard.

pKVM stage-2 error propagation (patches 5-8):

  At EL2 in nVHE/pKVM, WARN_ON() is not warn-and-continue: it
  expands to a BRK that enters the invalid-host-el2 vector and
  branches to hyp_panic(), which is __noreturn.

  Four pKVM memory-transition functions wrapped the return value of
  kvm_pgtable_stage2_map() in WARN_ON() and discarded it. For the
  share and donation paths the map can fail via -ENOMEM when the
  vcpu memcache is exhausted, converting a recoverable hypercall
  error into a fatal hyp panic. The four patches capture and
  propagate the return value, with appropriate stage-2 unmap and
  host-side rollback for the reachable failure cases.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260105154939.11041-1-will@kernel.org/
[2] https://github.com/masoncl/review-prompts
[3] https://sashiko.dev/

Fuad Tabba (8):
  KVM: arm64: Make EL2 exception entry and exit context-synchronization
    events
  KVM: arm64: Synchronise HCR_EL2 writes on the guest exit path
  KVM: arm64: Guard against NULL vcpu on VHE hyp panic path
  KVM: arm64: Fix __deactivate_fgt macro parameter typo
  KVM: arm64: Propagate stage-2 map failure on host->guest share
  KVM: arm64: Propagate stage-2 map failure on host->guest donation
  KVM: arm64: Propagate stage-2 map failure on guest->host share
  KVM: arm64: Propagate stage-2 map failure on guest->host unshare

 arch/arm64/include/asm/sysreg.h         |  2 +-
 arch/arm64/kvm/hyp/include/hyp/switch.h |  2 +-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c   | 99 +++++++++++++++++++++----
 arch/arm64/kvm/hyp/nvhe/switch.c        | 11 +++
 arch/arm64/kvm/hyp/vhe/switch.c         | 14 +++-
 5 files changed, 111 insertions(+), 17 deletions(-)

-- 
2.54.0.545.g6539524ca2-goog


