Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E052FC531FC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 08:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uKLIfBLG1tq0sn4tnF1BsPaKM61vke1+Ik5sqk+B9hs=; b=EqPPiXUw6EKVYiGP8SwPJEwI44
	Cb1+wiM48Vbom6BfciqBMlRnOn77tNLXni2EG404wVO0veHWSNk21pW+/914B4GBEjXqiwhRCvhqP
	33lrS2SXSYv4U59biVjTBB0DJzkSpPirr8X4gUZl1B8Wvzfd61+or1EW7suVfFicWUkzoC+Ns4uC5
	XTzQY4tdTtwnSvx8m790D3IAlqKs85M8520OWfbML4YtgjuPLxV6YhjD+RicRZdUNWhWU8vQ0pVBe
	uiiFWkqgdZfTsLhIAY1nEnwMkzRghQAOdKGuitJzF6/yKzt6ZruqP2F5u7LRP19O7qyAEiJKeKw2G
	6IrRbxvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBZP-0000000FsOH-2YoI;
	Fri, 24 Jul 2026 08:47:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBZO-0000000FsNx-0a83
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 08:47:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E33B600AA;
	Fri, 24 Jul 2026 08:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7B6B1F00A3A;
	Fri, 24 Jul 2026 08:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784882868;
	bh=uKLIfBLG1tq0sn4tnF1BsPaKM61vke1+Ik5sqk+B9hs=;
	h=From:To:Cc:Subject:Date;
	b=I6pDOTAWnXXAN8/KovxZG8z6DUDCbvAnAiMK/YYX3Bt5PnRAAMo1du8PdgwKMHYGJ
	 anPwADR6ZPYd1ZARervT+mqWCI/eUVva3zJVyMFl7K98e3ZpxXikvHER5kFP1w06va
	 eVcRX7nnGsEs+EjCOrzyHQ/CrdbtJwazbGbPx3C7kj+Gvy7mUa+g7A0vQWK6aUK8hr
	 UBdTNqbNMLLQfMNoCVfdZbnlWnQE6vBEaPurmu7XnCgxpqZXHizvQqrKhXnPEyx4g2
	 y1X+B9G1lbtw8gebYPDQFHdAxoQh0NjQK9HKprWnChN3lEgmwVbig1jBGUwWyOxHNM
	 78Go6NLNOH4xQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wnBZK-00000008Ls6-1roU;
	Fri, 24 Jul 2026 08:47:46 +0000
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Alexandru Elisei <alexandru.elisei@arm.com>,
	=?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Vincent Donnefort <vdonnefort@google.com>,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] KVM/arm64 fixes for 7.2, take #3
Date: Fri, 24 Jul 2026 09:47:42 +0100
Message-ID: <20260724084742.3358321-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, alexandru.elisei@arm.com, clopez@suse.de, scott@os.amperecomputing.com, fuad.tabba@linux.dev, vdonnefort@google.com, kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Paolo,

Here's another set of KVM/arm64 fixes for 7.2. A bunch of fixes for
AI-discovered issues, with two main areas of activity:

- plugging annoying LPI mapping races

- fixing corner cases in the EL2 tracing management

The rest is a heady mix of CPU errata workaround, API tidy up and low
impact fixes.

Please pull,

	M.

The following changes since commit 1590cf0329716306e948a8fc29f1d3ee87d3989f:

  Linux 7.2-rc4 (2026-07-19 13:54:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kvmarm-fixes-7.2-3

for you to fetch changes up to 679d7201c1f09e37fa1c12ce28d84079c17fc87f:

  KVM: arm64: Reject guest_memfd memslots when the VM has MTE (2026-07-23 09:57:06 +0100)

----------------------------------------------------------------
KVM/arm64 fixes for 7.2, take #3

- Fix a tiny buglet when propagating the deactivation of an interrupt
  from a nested guest, which happened to trigger a gold plated CPU bug
  on a particular implementation

- Fix a race between LPI unmapping and mapping, resulting in leaked
  LPIs

- Make LPI mapping more robust on memory allocation failure

- Fix the handling of the EL2 tracing clock being disabled

- A couple of Sashiko-driven fixes for corner cases in the EL2 tracing
  code

- Add missing sysreg tracepoint for the EL2 code

- Tidy-up the mutual exclusion of guest-memfd and MTE

- Update Fuad's email address to point to @linux.dev

----------------------------------------------------------------
Alexandru Elisei (1):
      KVM: arm64: Reject guest_memfd memslots when the VM has MTE

Carlos López (2):
      KVM: arm64: vgic: Fix race between LPI release and re-registration
      KVM: arm64: vgic: Mitigate potential LPI registration failure

D Scott Phillips (1):
      KVM: arm64: vgic: Avoid double-deactivate of IRQs in the nested context

Fuad Tabba (1):
      KVM: arm64: Update Fuad Tabba's email address

Vincent Donnefort (4):
      KVM: arm64: Fix hyp_trace clock disabling
      KVM: arm64: Fix potential leak in hyp_trace_buffer_alloc_bpages_backing
      KVM: arm64: Fix hyp_trace_desc allocation size in hyp_trace_load()
      KVM: arm64: Add missing hyp_enter when trapping sysreg

 .mailmap                                    |  1 +
 Documentation/arch/arm64/silicon-errata.rst |  4 ++++
 Documentation/virt/kvm/api.rst              |  6 +++++
 MAINTAINERS                                 |  2 +-
 arch/arm64/include/asm/kvm_hypevents.h      |  1 +
 arch/arm64/kvm/arm.c                        | 25 +++++++++++++++-----
 arch/arm64/kvm/hyp/nvhe/hyp-main.c          |  1 +
 arch/arm64/kvm/hyp_trace.c                  | 36 +++++++++++++++++++----------
 arch/arm64/kvm/mmu.c                        |  4 ++++
 arch/arm64/kvm/vgic/vgic-its.c              | 25 +++++++++++++-------
 arch/arm64/kvm/vgic/vgic-v3.c               |  8 ++++++-
 arch/arm64/kvm/vgic/vgic.c                  | 18 +++++++--------
 include/kvm/arm_vgic.h                      |  3 ---
 13 files changed, 93 insertions(+), 41 deletions(-)

