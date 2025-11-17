Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBCBCEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 09:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0qfsLN/izZJpHMJKPTcI6aIlgqqbdXz9ZMgpXVG2H6s=; b=26KDhoIL59Q40b0jap344os82i
	/bBA3KS6P7LGN5FO2Uf3TqC53Gbxn8dscGbP6Y2XXeJAKO31D0NobGbyJlTTBj7W+TfkyhoC82EsJ
	1uKxBUxBSUrVZK1wjItoLh8CcVYFcnklJWLVVDpAwfdk+oyrPJDbOrANBPkQEsb4zmj0+bUt/SHdY
	7jg8MHIxSuia/bGCXklwOWw+DUIMtzOBkSmL58eaqnfjG0tulN8Ht39UcOhOh+eJKMJaCOhkwZmn9
	0eHZ4hwOPdkOGbDfJ+f77f0hDRTuGbYptR2S3UYoMMxMrcAZC/IGEqv9BSb+xdcl5YCYSSmfKNHXZ
	idY0WA7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvS4-0000000Fmlx-0dNX;
	Mon, 17 Nov 2025 09:23:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvRp-0000000Fmeg-3e7h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 09:22:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9EF60445AA;
	Mon, 17 Nov 2025 09:22:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9CEEC4AF1D;
	Mon, 17 Nov 2025 09:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763370940;
	bh=mH/Jp7MHuDkzj0cxiq1eLsInTqMdrk+HHd3BkgjUU08=;
	h=From:To:Cc:Subject:Date:From;
	b=pQUxZ5N11uoXXupgGNvToPT7NVMZWZSD3hMglZkeH0cLnf8c1S/j1Hj5QRimtiUMk
	 niDaJzdb6wQhbstLpyocrd8RCkLWKBgAk0IseaIn1MhO3vAJ9IyDzdUnupeHtMihz4
	 ltTJ5bfnSwReL24GBCgqUD9fGYKYdukvW7kGX37RTMvpjWrW+2SXTJICcDlDdUyUaR
	 FJ75yTqWmh3WfqpCIPwbKe2QXTJvy8s+piZHJ0oWB3RUDf6JeHIDYbdKWoGeJvCCwk
	 oBqtUhYB1az0D3FQo6fY5I7DorgStpac2/q0LUdNJ7Nf7vrdwwBOwsqJBx60dfqVk1
	 CBuKkiahc7/jA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vKvKk-00000005lB2-1nkE;
	Mon, 17 Nov 2025 09:15:38 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v3 0/5] KVM: arm64: Add LR overflow infrastructure (the dregs, the bad and the ugly)
Date: Mon, 17 Nov 2025 09:15:22 +0000
Message-ID: <20251117091527.1119213-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, tabba@google.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_012257_949863_AD3ADCC6 
X-CRM114-Status: GOOD (  20.06  )
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

This is a follow-up to the original series [1] (and fixes [2][3])
with a bunch of bug-fixes and improvements. At least one patch has
already been posted, but I thought I might repost it as part of a
series, since I accumulated more stuff:

- The first patch addresses Mark's observation that the no-vgic-v3
  test has been broken once more. At some point, we'll have to retire
  that functionality, because even if we keep fixing the SR handling,
  nobody tests the actual interrupt state exposure to userspace, which
  I'm pretty sure has badly been broken for at least 5 years.

- The second one addresses a report from Fuad that on QEMU,
  ICH_HCR_EL2.TDIR traps ICC_DIR_EL1 on top of ICV_DIR_EL1, leading to
  the host exploding on deactivating an interrupt. This behaviour is
  allowed by the spec, so make sure we clear all trap bits

- Running vgic_irq in an L1 guest (the test being an L2) results in a
  MI storm on the host, as the state synchronisation is done at the
  wrong place, much like it was on the non-NV path before it was
  reworked. Apply the same methods to the NV code, and enjoy much
  better MI emulation, now tested all the way into an L3.

- Nuke a small leftover from previous rework.

- Force a read-back of ICH_MISR_EL2 when disabling the vgic, so that
  the trap prevents too many spurious MIs in an L1 guest, as the write
  to ICH_HCR_EL2 does exactly nothing on its own when running under
  FEAT_NV2.

Oliver: this is starting to be a large series of fixes on top of the
existing series, plus the two patches you have already added. I'd be
happy to respin a full v4 with the fixes squashed into their original
patches. On the other hand, if you want to see the history in its full
glory, that also works for me.

[1] https://msgid.link/20251109171619.1507205-1-maz@kernel.org
[2] https://msgid.link/20251113172524.2795158-1-maz@kernel.org
[3] https://lore.kernel.org/kvmarm/86frahu21h.wl-maz@kernel.org

Marc Zyngier (5):
  KVM: arm64: GICv3: Don't advertise ICH_HCR_EL2.En==1 when no vgic is
    configured
  KVM: arm64: GICv3: Completely disable trapping on vcpu exit
  KVM: arm64: GICv3: nv: Resync LRs/VMCR/HCR early for better MI
    emulation
  KVM: arm64: GICv3: Remove vgic_hcr workaround handling leftovers
  KVM: arm64: GICv3: Force exit to sync ICH_HCR_EL2.En

 arch/arm64/include/asm/kvm_hyp.h     |  1 +
 arch/arm64/kvm/hyp/vgic-v3-sr.c      | 11 +++-
 arch/arm64/kvm/vgic/vgic-v3-nested.c | 78 ++++++++++++++++------------
 arch/arm64/kvm/vgic/vgic-v3.c        |  3 ++
 arch/arm64/kvm/vgic/vgic.c           |  6 ++-
 arch/arm64/kvm/vgic/vgic.h           |  1 +
 6 files changed, 62 insertions(+), 38 deletions(-)

-- 
2.47.3


