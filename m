Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EB3CC6B39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 17:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FEG/VAjAcHH5Q/D2MIVWcgHJsvBvnxs5hUqZT/aI/yc=; b=xBQcrKR08Vrb2cbvIonNgXqOod
	1v8KlBk10ugdEQKhsz6h2207fYZl8ucLMgoETP39vB8mWNk+fWKsym12E/gJBlrn+fF6ehc9WEjLE
	nNmQzN+KODcUQYbKi8R32rf7K8rYN769x6Ua2KGglZMuIz9FP/FtvR8Ecg/tcdgtf2+CMCwXVyueI
	toJm7kU4KqX7Pyz0YpGnIRuFJf3PajTHNzftl1Z0yBdsMdzi3/6uGicZkmUmX8mH14v16lZG8ZFdJ
	Frx3Wqn47xg5mj3WqhsSAoBAr2eQNuFHBd8NdlTzhL+OkmnnbpjYoXL9aMK0MAdQq939+Ftc9Ubwt
	3+/WEicg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPND-000000010s0-49zm;
	Thu, 15 Oct 2026 17:36:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPNC-000000010rJ-3nru
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 17:36:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A17E436FF;
	Thu, 15 Oct 2026 17:36:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CC961F000C4;
	Thu, 15 Oct 2026 17:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792085770;
	bh=FEG/VAjAcHH5Q/D2MIVWcgHJsvBvnxs5hUqZT/aI/yc=;
	h=From:To:Cc:Subject:Date;
	b=dPXO9WxGcZniEhYNw0YlmFZlGsspCf76PXmzpJQT+No+9oHJrX5PJf63lWEtse+qZ
	 /Ew/LjiSbE0bgaadMnqfOFVdbsYjgfStoe50rvwimtMK9UJjbSRi6siqtEs342kxaJ
	 ZWMaXYvM7P7xBoWiw9z4JhtzSac/mYqFKSNqWeb66gQbT7vIdjMP3kMYpYvxOlf5tG
	 GBzoSS1UafdrUZZrQKVQ5xkibimyPIYgZDup186Z1UpUut0YABDvyExM3/juzdtgXa
	 yR5aVquaS6KUGv0zg+bT4IFSRQXGlEkEpTymqa4UujuKq88IWDAkWXcoxdcAPiJpBv
	 v02wu1pSVEKrg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xHPNA-00000003Q3a-06QO;
	Thu, 15 Oct 2026 17:36:08 +0000
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
Subject: [PATCH 0/2] KVM: arm64: Cleanup the HCR_xyz macros
Date: Thu, 15 Oct 2026 18:36:03 +0100
Message-ID: <20261015173605.1072963-1-maz@kernel.org>
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

I've been postponing this for some time, but it finally happened: no
more HCR_xyz macros.

This series converts the whole thing in one go, using the script
fragment contained in the first patch. No AI agent involved, all bugs
are mine! I intend to take this in for 7.4-rc1.

Patches on top of kvmarm-7.4.

Marc Zyngier (2):
  KVM: arm64: Convert HCR_xyz to HCR_EL2_xyz
  KVM: arm64: Get rid of compatibility HCR_EL2 aliases

 arch/arm64/include/asm/el2_setup.h      |   4 +-
 arch/arm64/include/asm/hardirq.h        |   6 +-
 arch/arm64/include/asm/kvm_arm.h        |  79 ++--------------
 arch/arm64/include/asm/kvm_emulate.h    |  18 ++--
 arch/arm64/include/asm/kvm_mte.h        |   4 +-
 arch/arm64/include/asm/kvm_ptrauth.h    |   4 +-
 arch/arm64/kernel/head.S                |   4 +-
 arch/arm64/kvm/arm.c                    |  28 +++---
 arch/arm64/kvm/at.c                     |  18 ++--
 arch/arm64/kvm/emulate-nested.c         | 116 ++++++++++++------------
 arch/arm64/kvm/guest.c                  |   2 +-
 arch/arm64/kvm/handle_exit.c            |   2 +-
 arch/arm64/kvm/hyp/include/hyp/switch.h |  14 +--
 arch/arm64/kvm/hyp/nvhe/host.S          |   2 +-
 arch/arm64/kvm/hyp/nvhe/hyp-init.S      |   2 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c      |  20 ++--
 arch/arm64/kvm/hyp/nvhe/mem_protect.c   |   6 +-
 arch/arm64/kvm/hyp/nvhe/pkvm.c          |  32 +++----
 arch/arm64/kvm/hyp/vgic-v3-sr.c         |   4 +-
 arch/arm64/kvm/hyp/vhe/switch.c         |  12 +--
 arch/arm64/kvm/hyp/vhe/tlb.c            |   2 +-
 arch/arm64/kvm/inject_fault.c           |   6 +-
 arch/arm64/kvm/mmu.c                    |   8 +-
 arch/arm64/kvm/nested.c                 |   8 +-
 arch/arm64/kvm/sys_regs.c               |  24 ++---
 arch/arm64/kvm/vgic/vgic-v3-nested.c    |   4 +-
 26 files changed, 182 insertions(+), 247 deletions(-)

-- 
2.47.3


