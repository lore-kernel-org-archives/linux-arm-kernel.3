Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D64ECA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 09:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LeiFWtNEfQIlCLdk5VOMusPM6Xa81QyDO89KQ0cDxT8=; b=oAskQgjm+vJmzPfLwpuMgfCPxy
	y6c66pzNobYI8Z1i8Z3v+K2LQtfXrBLHMPVh4jwRszEL8zjj0uZxZLyo8qlO0uGIgJSMg4kujBycs
	k0BIna42fFNJtFV274zCwxOiExB+DrVQY6j/F86281lbxT8K9I07ETE80LBlhoedc+yNdnzFgmj54
	4t9k/XHhNw15FvX3AbcKEb/hlrNpUTz8JS7fBB/iE/nRuFLaR4FzJqZX6VGB+RKVfRpyf/0EqWTvF
	wn+UN3bzXz4IJKGRT7XO6tg0Iatl1DwOVlQgsHmR0CawTKBOJ10fp3s4nE2aFvmfZHrkH8kWDD75i
	MEjxr/pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUGR-00000002yk4-1Ls0;
	Tue, 29 Sep 2026 09:36:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUGP-00000002yjC-3JUb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 09:36:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CE6B4437BE;
	Tue, 29 Sep 2026 09:36:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B01501F00898;
	Tue, 29 Sep 2026 09:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790674600;
	bh=LeiFWtNEfQIlCLdk5VOMusPM6Xa81QyDO89KQ0cDxT8=;
	h=From:To:Cc:Subject:Date;
	b=fwcryUnmOjuhztjAj/w700YKC/W5Bi2U2gx2HEFvbH26pS5uTNgdyfV6lLgFPIeZn
	 5+j5ajnsrjCcjxT1HQPEEpgb6RzEIVAQ1FMDxWAkCarlDrKE+w9zB/JTULDnVd7mji
	 +o38seElYNEQUDwZLnaUzZL8AgxKEbwSByEy8bqv1bz4HA71Z96IVh7gwv2uLys5OA
	 5PYMDVc6AgUngxmSjdh+n4y1Bf2eeCP6MiwxA8xNCUNRScuFo7DEnUj1nC4R9XbaBK
	 qEiTONKucDBCYV01S3CFkkZU8a6F+r09ZPbZizbLswblohan/tJfnqNVL1eV7qF75C
	 J25fHJkOyXlnQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xBUGM-0000000ElEa-1S5Q;
	Tue, 29 Sep 2026 09:36:38 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: [PATCH v2 0/7] KVM: arm64: vgic-v3: Make LPI disabling robust (and more)
Date: Tue, 29 Sep 2026 10:35:41 +0100
Message-ID: <20260929093548.3598547-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, fuad.tabba@linux.dev, ndaugoing@gmail.com
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

This is v2 of this series addressing shortcomings of LPIs being
disabled on one CPU from another. It has now expanded into some more
common areas.

Yuchao Zhang reported that disabling LPIs on one CPU from another
could result in UAFs and other horrors.

There are two reasons for this:

- the last_lr_irq pointer does not contribute to LPI refcount, and
  that LPI being removed results in a dangling pointer

- LPIs can be deleted from a remote vcpu by disabling them while that
  vcpu is actually running, and has LPIs in its LRs.

Address the two issues in one go, by actively taking a refcount on all
IRQs referenced by last_lr_irq, and making sure that disabling LPIs
force all vcpus to be paused, making it safe.

Review of the initial version pointed out two more general issues:

- OUTSIDE_GUEST_MODE is published too early, when the guest state is
  not yet visible to other threads, resulting in the wrong state being
  evaluated from another CPU.

- kvm_{halt,resume}_guest() can be called without holding a global
  lock, and therefore can nest. This can result in a vcpu being
  restarted too early.

This is addressed by the first two patches.

Finally, MOVALL suffers from similar issues as LPI disabling, but also
appears to be broken (the filtering on the source RD was accidentally
removed a while ago). Fix the filtering and move MOVALL to a "stop the
world" approach.

* From v1 [1]:

  - Fix OUTSIDE_GUEST_MODE publication to occur after the saving of
    the guest state

  - Turn vcpu->arch.pause into an atomic counter, allowing nesting

  - Fix MOVALL to filter by source RD

  - Make MOVALL a "stop the world" command

[1] https://lore.kernel.org/r/20260922214212.3327146-1-maz@kernel.org

Marc Zyngier (7):
  KVM: arm64: Move OUTSIDE_GUEST_MODE publication past context being
    saved
  KVM: arm64: Turn vcpu->arch.pause into a counter
  KVM: arm64: vgic: Allow last_lr_irq to be NULL when LRs are not
    overflowing
  KVM: arm64: vgic: Take a refcount on IRQs referenced by last_lr_irq
  KVM: arm64: vgic: Stop the VM when disabling LPIs
  KVM: arm64: vgic-its: Fix MOVALL handling of source redistributor
  KVM: arm64: vgic-its: Stop the VM when handling MOVALL

 arch/arm64/include/asm/kvm_host.h  |  7 +++----
 arch/arm64/kvm/arm.c               | 28 ++++++++++++++++++----------
 arch/arm64/kvm/vgic/vgic-its.c     | 23 +++++++++++++++++++----
 arch/arm64/kvm/vgic/vgic-mmio-v3.c | 10 ++++++++++
 arch/arm64/kvm/vgic/vgic-v2.c      |  6 ++++--
 arch/arm64/kvm/vgic/vgic-v3.c      |  6 ++++--
 arch/arm64/kvm/vgic/vgic.c         | 21 ++++++++++++++++-----
 7 files changed, 74 insertions(+), 27 deletions(-)

-- 
2.47.3


