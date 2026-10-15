Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A11CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 10:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O2M4w/ZFagUjIv202JHTtOzgBHFi+5K/W5bohYPHYz8=; b=1B1vPtIktCp+B6KJ4p6oebkLVj
	Wah+v47liM/xFtFohLjoWsAS7X8Hel18uo/hCBcBOrDz9jKccgsJ2MWmxfAA2QBJckoYK5g/l6mMd
	YpMiFi44cXJKhsMIITcAAq/JhChtBxrkY9kGXjAYfh+LFDqRHfuCSvHZrI1AOe5IR83M/e0hDzyfm
	54jzTfiNl/Rslve47/nVWRE+YGyeqjVzVufm+NJDUenQ7u31+uoxxDAJf6PSEfMErGTXJ79z1q8F5
	EhX7EhAxMtodwUcRUtVw0EBMWAaR1K1SmMinCk94zrbE8cHaRd/iMTs8xsHT9FE4KjvcuXw+/+rZ1
	WfsjfRrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHILN-0000000HNrZ-0WMK;
	Thu, 15 Oct 2026 10:05:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHILJ-0000000HNqD-2d5J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 10:05:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0CD3041A85;
	Thu, 15 Oct 2026 10:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2D331F000C5;
	Thu, 15 Oct 2026 10:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792058744;
	bh=O2M4w/ZFagUjIv202JHTtOzgBHFi+5K/W5bohYPHYz8=;
	h=From:To:Cc:Subject:Date;
	b=Ddg/nBt6jS+ELONe4oMAh0lQ+r3B91fEWE+/uzkG/CE13m3UYxb+yq0MMLIbkxhwy
	 vfbplBvUmBCiZF15fjrTcYiDGrUo7mbWHObJ/xIfNE+iBhBj3e7mPSmlh7J4mqmeqn
	 ZIrnGLaRuEMhOY3u9KnazIgXosIrTP+e4hxtRX1/58mWp8WjqbuhEz90FZY2ZpoBtN
	 LXPdpTRTzgGzpND6cstTj/UKSH0giaL/kKjXRdkYJTosJtNZz52UKsU1UWEHZbf4fg
	 +1jt1wdJ2Sm95wh029vsherJnGq4jEn93am6b3YWFyfuSkUxFWb1zV+yRO+ZL9w3Uz
	 USgIY/FHtMSSA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xHILG-00000003EfK-1xhU;
	Thu, 15 Oct 2026 10:05:42 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: [PATCH 0/7] KVM: arm64: Fix cross-CPU vcpu pausing
Date: Thu, 15 Oct 2026 11:05:32 +0100
Message-ID: <20261015100539.1011760-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, fuad.tabba@linux.dev
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

This series is a follow-up on what I previously posted at [1], and has
now grown a few more fixes, and inherited an improvement from Oliver.
Some of the fixes have already been merged, so what we have here
serves a slightly different goal.

As we are simplifying (and fixing) a bunch of vgic behaviours, it
becomes necessary to pause one (or all) vcpu(s) and *reliably*
introspect the state of interrupts.

It appears that the current KVM behaviour is remarkably broken:

- OUTSIDE_GUEST_MODE is published too early, before we have resynced
  the state, making it unreliable

- IN_GUEST_MODE is published too late, once we have already placed
  volatile state on the CPU (interrupts, for example), and making the
  in-memory state stale (edge pending bits are a particular sore spot)

- self-generated requests are sometimes posted too late, after we have
  committed to entering the guest, and are therefore delayed

- the pausing mechanism itself is unreliable, as it has no requirement
  to be called whilst holding a global lock, and therefore is able to
  nest, while it is backed by a simple boolean

This series addresses these defects, and builds on top of it to:

- add pausing to a single vcpu in addition to the full VM pausing

- convert LPI disabling and the MOVALL command to vcpu pausing

Patches on top of -rc6, most of them being Cc stable without any
qualification (this has been broken for as long as I can remember).

[1] https://lore.kernel.org/r/20260929093548.3598547-1-maz@kernel.org

Marc Zyngier (6):
  KVM: arm64: nv: Move L2->L1 switch on interrupt early
  KVM: arm64: Move OUTSIDE_GUEST_MODE publication past context being
    saved
  KVM: arm64: Move IN_GUEST_MODE ahead of state being loaded
  KVM: arm64: Turn vcpu->arch.pause into a counter
  KVM: arm64: vgic: Stop the target vcpu when disabling LPIs
  KVM: arm64: vgic-its: Stop the VM when handling MOVALL

Oliver Upton (1):
  KVM: arm64: Add helpers to halt a vCPU

 arch/arm64/include/asm/kvm_host.h  |  9 ++--
 arch/arm64/kvm/arm.c               | 69 ++++++++++++++++++++----------
 arch/arm64/kvm/nested.c            |  8 ++++
 arch/arm64/kvm/vgic/vgic-its.c     | 11 +++++
 arch/arm64/kvm/vgic/vgic-mmio-v3.c | 10 +++++
 arch/arm64/kvm/vgic/vgic.c         |  8 +---
 6 files changed, 81 insertions(+), 34 deletions(-)

-- 
2.47.3


