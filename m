Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA0ACD6E7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 16:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KB02rpRMRUcfAvlmeMfhCcaEDyoWU3wB7fjdf8ZKlQw=; b=RCB2NJujVwlQ1CLv4Ev/DiEcTL
	IkfjFBTmtzVaUaEukHIkURw3BbyrE3Vxl3lZZzrmu7sOvyBZnQqDvVbAL7gsq+3XGx6fXUZahRCxZ
	riJFTQCol/8u4WzPk5Ju14ZxnDKkulEqnGS8YoBkD9Gqshrmhw7yQnRCefCjUU8D1sua0AtySPZOh
	o+yAykGiigbgz7WVy4uHpIPjdCqZ2BWsx7rGxVYN4QQm2Tv7BUiA7wXSJAjyDG/VQ4iI8FIndnDmC
	iFxPHKUrA527oGaUCzjVS9vTvBr7k1hJqs0jI0MSiJn5ApfuRNDk03f/QpxTEwdEdO1qLkrXAO9nq
	jcsDeKRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVXfe-00000000vgQ-2k06;
	Fri, 05 Jun 2026 16:45:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVXfd-00000000vg8-327j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 16:45:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6CE5643910;
	Fri,  5 Jun 2026 16:45:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EDBF1F00893;
	Fri,  5 Jun 2026 16:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780677921;
	bh=KB02rpRMRUcfAvlmeMfhCcaEDyoWU3wB7fjdf8ZKlQw=;
	h=From:To:Cc:Subject:Date;
	b=OjK8K5k4KaldBITb/iA5qTAFwrvV+Gz3sVNozHPSYSqpatHJlA4PAM3PrAgaxalaC
	 yP1GopJ/MRfoC7AlCiiVRmZH+OQYm61MHASiPoFtSdzn/eaSHIKAG2V2ruYdNss4v9
	 JDgryOtfA3DFDORaflk9q9IU2xYM3cmpJ+qnTdd1eECZajiAMv/49yGpIwoU2SntaF
	 kEQdDkge91TndMlGrma9fiUzSNwP8jXtM5q42q0QZistQu1mRwf8cRLhyIbeSSasKd
	 o+xxLRt/6c7mpn1wyUpQLgCpr0oJcYYGZXDWqBoSMBIWcqigeujWfUfd7bSf2YAhoh
	 kc2eHwqaDpaZQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wVXfb-00000009qai-1RCM;
	Fri, 05 Jun 2026 16:45:19 +0000
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Hyunwoo Kim <imv4bel@gmail.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Subject: [GIT PULL] KVM/arm64 fixes for 7.1, take #5
Date: Fri,  5 Jun 2026 17:45:16 +0100
Message-ID: <20260605164516.2214533-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, imv4bel@gmail.com, joey.gouly@arm.com, oupton@kernel.org, weilin.chang@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
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

Yes, I said that last week's pull request was the last. I really meant
it, honest. But people (and their AI best mate) keep finding ugly
stuff in dark corners, and I can't sit on this stuff much longer.

So here we have an assorted mess of bad races, broken userspace, and
architectural bugs. What's not to like? As usual, details in the tag
below.

Please pull,

	M.

The following changes since commit 83726330748981372bde86ed5411d7b306612991:

  KVM: arm64: Correctly cap ZCR_EL2 provided by a guest hypervisor (2026-05-29 10:04:00 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kvmarm-fixes-7.1-5

for you to fetch changes up to 17f073f78fc43280891ecde8f8ec3f84f98bb37c:

  KVM: arm64: Correctly identify executable PTEs at stage-2 (2026-06-05 14:07:57 +0100)

----------------------------------------------------------------
KVM/arm64 fixes for 7.1, take #5

- Correctly drop the ITS translation cache reference when it actually
  gets invalidated

- Take the SRCU lock for SW page table walks

- Restore POR_EL0 access to host EL0, avoiding POR_EL0 becoming
  inaccessible from EL0 after running a guest

- Reassign nested_mmus array behind mmu_lock, ensuring that vcpu init
  and MMU notifiers are mutually exclusive

- Correctly handle FEAT_XNX at stage-2

----------------------------------------------------------------
Hyunwoo Kim (3):
      KVM: arm64: vgic-its: Drop the translation cache reference only for the erased entry
      KVM: arm64: Take the SRCU lock for page table walks in fault injection and AT emulation
      KVM: arm64: Reassign nested_mmus array behind mmu_lock

Joey Gouly (1):
      KVM: arm64: Restore POR_EL0 access to host EL0

Oliver Upton (2):
      KVM: arm64: nv: Fix handling of XN[0] when !FEAT_XNX
      KVM: arm64: Correctly identify executable PTEs at stage-2

 arch/arm64/include/asm/kvm_nested.h     |  4 ++--
 arch/arm64/kvm/at.c                     |  6 ++++--
 arch/arm64/kvm/hyp/include/hyp/switch.h |  2 ++
 arch/arm64/kvm/hyp/pgtable.c            |  4 +++-
 arch/arm64/kvm/nested.c                 | 33 ++++++++++++++++++++-------------
 arch/arm64/kvm/vgic/vgic-its.c          |  6 ++++--
 6 files changed, 35 insertions(+), 20 deletions(-)

