Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C736A1125859
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 17:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4h5SU9HO2ZfA4q8fg8X/kLgnjdPUZGjXMXOuZYXI9nw=; b=SM+YeES1FdIgx/Jl/EKfNuRlCy
	dT25EB9qHxC0to7t1r4LHjk7AbP5F5/cTPpK2AFSTJFXqezmgNAArJKhPaH83N4MVqOPXsPh8oE1b
	Fl+4IKAS640+7ciWH9qf7ntT3TCd7ayvUSsfWAkR2cSqSxloX0kzZqtOJwe/2kedxj+4wO7s+Pi9r
	mVFbx/ut2U60Rc7dtM6LlD4U7yHrla+FWSgNcUIfbONWxc2dER1xpfsOU9bwkrgrLzdibBrRaaOj9
	W9nRzCUNZgPBmG1tEiJ3v36gBS65Uvgd+CLx7aOw6YoMcURXva238TGx5UvY/m5qKKbFmwcaSjlzf
	UREmQnCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0NWd-0000000C3Di-2v5o;
	Wed, 11 Mar 2026 17:39:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0NWc-0000000C3Dc-44Zc
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Mar 2026 17:39:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=4h5SU9HO2ZfA4q8fg8X/kLgnjdPUZGjXMXOuZYXI9nw=; b=MAdsM8inpmhBvGn48A5sw+8DyM
	zmWFCOXfSXtqkEb9JARubkTr0LVOv3fXOT/gIy7oOFlyU9OHrskQjdifwf+M6a2tBiuj9Nm7ZqoXq
	SssROEhiZ87DkbhR5oq1h/mK7sVOiJgkBylGyPzK2NwfiQ+2V1Z9g8aMqLWYOdMYPJ9KStEbTsbnd
	wuC5raxqQH0otCOoF89Y4+iSzsteRmrsovwbOkbXhcZ3rD7lcOihBSI+TXTMC7QPphlltAKod59UF
	Nc3iO8pMSIlnks6+5MBVJNKpA6snv67rYzKf/mLm1TDfK4vwC2S/JtYDhUqXdWWteWbCuUMG1o7m4
	L/eW+oNQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0NWZ-0000000HQxg-3wvc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 17:39:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EB7E243EDB;
	Wed, 11 Mar 2026 17:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0BCBC4CEF7;
	Wed, 11 Mar 2026 17:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773250747;
	bh=fP9knvWB809mP95QO2qmeNhA8WW80ekwnk7WzqZ8LtU=;
	h=From:To:Cc:Subject:Date:From;
	b=HUTiNV1yR9BPpa9FYPJ75orhiMDMoTljqgdkwThDZKRRKhTn2V8Z2e7cterG3IR2B
	 s7BNvftfWlxiKIq7GyJeqjsGPU6KBXz86yfJBKnR0gW88sMPVG1eMTBiPUeXQXMCSD
	 EPJ/QyG2d4HAs+d0tJIWB0QV8tOtKml0w9W4zSkUVQlTF3vhoS74FZTYlVDYoLuSTQ
	 F3FcCE4Ov7jdOXUQjl7U8tekYhbAqrDp2d52k1/Uh48CijbYiZbtMSanYRqIDehN4l
	 5BsH/El1yj7xkhLHdQhGk1MmYnUdmL7PIOSKzjci1RdKgB64+7k1EUhY3wCoo2N47t
	 BpAdEDpBFy5Cg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w0NWT-00000000yNN-1L8K;
	Wed, 11 Mar 2026 17:39:05 +0000
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Valentine Burley <valentine.burley@collabora.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org
Subject: [GIT PULL] KVM/arm64 fixes for 7.0, take #3
Date: Wed, 11 Mar 2026 17:39:02 +0000
Message-ID: <20260311173902.329537-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, suzuki.poulose@arm.com, valentine.burley@collabora.com, vdonnefort@google.com, joey.gouly@arm.com, oupton@kernel.org, yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_173912_341029_D51B94F0 
X-CRM114-Status: GOOD (  13.10  )
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

Here's the third set of fixes for 7.0. Two fixes, both related to the
pretty large vgic rewrite that went into 6.19. One is affecting
interrupt deactivation, and therefore leading to guests locking
up. The other is affecting CPU hotplug with pKVM, leading to the
onlined CPU not booting at all.

Please pull,

	M.

Marc Zyngier (2):
  KVM: arm64: vgic: Pick EOIcount deactivations from AP-list tail
  KVM: arm64: pkvm: Don't reprobe for ICH_VTR_EL2.TDS on CPU hotplug

 arch/arm64/include/asm/kvm_host.h |  3 +++
 arch/arm64/kernel/cpufeature.c    |  9 +++++++++
 arch/arm64/kvm/vgic/vgic-v2.c     |  4 ++--
 arch/arm64/kvm/vgic/vgic-v3.c     | 12 ++++++------
 arch/arm64/kvm/vgic/vgic.c        |  6 ++++++
 5 files changed, 26 insertions(+), 8 deletions(-)

-- 
2.47.3

The following changes since commit 3599c714c08c324f0fcfa392bfb857c92c575400:

  KVM: arm64: Remove the redundant ISB in __kvm_at_s1e2() (2026-03-06 10:42:21 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kvmarm-fixes-7.0-3

for you to fetch changes up to a79f7b4aeb8e7562cd6dbf9c223e2c2a04b1a85f:

  KVM: arm64: pkvm: Don't reprobe for ICH_VTR_EL2.TDS on CPU hotplug (2026-03-10 09:48:45 +0000)

----------------------------------------------------------------
KVM/arm64 fixes for 7.0, take #3

- Correctly handle deeactivation of out-of-LRs interrupts by
  starting the EOIcount deactivation walk *after* the last irq
  that made it into an LR. This avoids deactivating irqs that
  are in the LRs and that the vcpu hasn't deactivated yet.

- Avoid calling into the stubs to probe for ICH_VTR_EL2.TDS when
  pKVM is already enabled -- not only thhis isn't possible (pKVM
  will reject the call), but it is also useless: this can only
  happen for a CPU that has already booted once, and the capability
  will not change.

----------------------------------------------------------------
Marc Zyngier (2):
      KVM: arm64: vgic: Pick EOIcount deactivations from AP-list tail
      KVM: arm64: pkvm: Don't reprobe for ICH_VTR_EL2.TDS on CPU hotplug

 arch/arm64/include/asm/kvm_host.h |  3 +++
 arch/arm64/kernel/cpufeature.c    |  9 +++++++++
 arch/arm64/kvm/vgic/vgic-v2.c     |  4 ++--
 arch/arm64/kvm/vgic/vgic-v3.c     | 12 ++++++------
 arch/arm64/kvm/vgic/vgic.c        |  6 ++++++
 5 files changed, 26 insertions(+), 8 deletions(-)

