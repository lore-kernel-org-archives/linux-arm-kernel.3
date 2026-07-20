Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F95C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 13:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YYRiGgf2P+rtL76qHisSx9Ln84RXffHb3Zivhk5R26I=; b=gcl8itBwuC7aXRSWZ0gL0QuXs4
	obIl9olnNFCOOQ6eP/AeUYGrcwF/sP762U/EmSp5S+JDcY0Ith0lCEg7qrV/XcEpkxPn2BsRm6H9h
	aIpuyZKunaAa5HkdBbvuXkwPJnR7oKl95rTK3+k5w/yWBJs7aKKmyApsRM6XsCLKtNQuPP3wgMmxj
	mYT61YISMsgi80sf5tlEH3IJFbAGYDLKcMSZDEuWukexDo92to4JV9jcZ+erHvVi4RB+6laXc6k3t
	HXr8XhttQ84n/WAX2XyFZ7aw/NbpXy4zGjNEQ6P/JgbzRtPNfDzEjrxLeq8Paa0ivmkbO/l+OXgf8
	gSs4epxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnxC-00000006mox-2dRP;
	Mon, 20 Jul 2026 13:22:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnxB-00000006mnu-2a0s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 13:22:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 16FB660A80;
	Mon, 20 Jul 2026 13:22:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0DED1F000E9;
	Mon, 20 Jul 2026 13:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784553760;
	bh=YYRiGgf2P+rtL76qHisSx9Ln84RXffHb3Zivhk5R26I=;
	h=From:To:Cc:Subject:Date;
	b=Kwqi/3eRhssMvgchl6+7F/4RBwNzHroWKT+A2hYz3nKMfW5d5YlBOZEnMfMaGQAeV
	 lYzzscniQbeCYJpWumi1HVtBiy78qoTGoDI86qm0mFziOpwFtitvcwAFidjq4WcUvi
	 lkwRSTjiIkecMRYm4LiApkk5kOzpF86ZCW2sbsQVU4xOBPC7Ky1AVhlfwh8GMdw5mN
	 v1NB71LXg4LS5efxOBwH/yUZ6yCCm9oADYDf+HV1vlkRBh5PIU4etufqucWJifAYrv
	 rTVVBc71gQvmIRKOi/W3Y3pO7t0FFo+kjYuJY808KlUHPL9bVHyeY+YsiQgREdvoKO
	 Kd4t5nWdMycIQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wlnx8-00000006oKK-1w9t;
	Mon, 20 Jul 2026 13:22:38 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 0/5] KVM: arm64: Make ICH_VTR_EL2 accesses an inlined literal
Date: Mon, 20 Jul 2026 14:22:14 +0100
Message-ID: <20260720132220.2143486-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
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

I did it again.

I was looking at NV traces, and realised that we were trapping a whole
lot of accesses to ICH_VTR_EL2. But ICH_VTR_EL2 really is a constant
from a hypervisor perspective, and we usually cache this in memory, just
like any other ID register.

We do have a variable for this in kvm_vgic_global_state, but we don't
map this one at EL2 since 8aaf3f7dce746 ("KVM: arm64: Don't map
'kvm_vgic_global_state' at EL2 with pKVM").

So what can we do? We can revert back to mapping the global state, but
that's not a very good idea. Or we can be creative and turn the
ICH_VTR_EL2 accesses into a runtime constant patched into the
code. Since we already have a bunch of similar things for the GICv3
traps, that's no big deal.

And for consistency, let's kill kvm_vgic_global_state.ich_vtr_el2
altogether, so that there is only a single efficient way to read
ICH_VTR_EL2.

As usual, this has a significant impact on deeply nested workloads, a
solid 5% reduction in elapsed time for an L3 Linux guest running under
nested KVM instances. I expect this to benefit KVM running under other
hypervisors as well.

Patches on top of -rc3.

Marc Zyngier (5):
  KVM: arm64: vgic-v3: Make vtr_to_* helpers use architectural field
    symbols
  KVM: arm64: Add a helper providing an inlined literal value for
    ICH_VTR_EL2
  KVM: arm64: Convert most ICH_VTR_EL2 accesses to inlined literal value
  KVM: arm64: vgic-v3: Simplify initial GICv3 configuration sampling
  KVM: arm64: vgic-v3: Kill kvm_vgic_global_state.ich_vtr_el2

 arch/arm64/kernel/image-vars.h   |  1 +
 arch/arm64/kvm/hyp/vgic-v3-sr.c  | 29 ++++++--------
 arch/arm64/kvm/nested.c          |  3 +-
 arch/arm64/kvm/vgic-sys-reg-v3.c |  8 ++--
 arch/arm64/kvm/vgic/vgic-v3.c    | 69 +++++++++++++++++++++++++++-----
 arch/arm64/kvm/vgic/vgic-v5.c    |  5 +--
 arch/arm64/kvm/vgic/vgic.h       | 39 +++++++++++++-----
 include/kvm/arm_vgic.h           |  2 -
 8 files changed, 108 insertions(+), 48 deletions(-)

-- 
2.47.3


