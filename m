Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6956C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 12:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YwaM1Lk7sNbwtCFn585TaybxMy2AAE9834HKWZzScn0=; b=q4Kcx4Fp65WrIFkOcQ6aff7dg9
	Rxq5qUJs0tKVmZGM3GJTsZxYLHzssYrL01ltydxdws9bOxBYJDJ4D7OARck8Y/tUEBC+OssP6muBU
	iL/Rmmt/oGe5P1oQy578UaMejPy57pSHffr3FK+X5lPNSTQbyCUxlimcsWJtPT4ngHsDq2Cjre8lt
	/X/trq25DMQ3rDv7at9NvOfM0nLadfO/DbRL3VDtvd3YTPmAN23KKC+Nm11Q/xeg+HaWxzlNGfViJ
	u12r99XPOS7kCc8uxey5Lyf6PzJNWkRfyz5gjxd2g1iRDJIrCq+kCkev092OKBUVtGYg3u6lv6V4q
	CtGqSRsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubITo-00000002Bvx-3gGP;
	Mon, 14 Jul 2025 12:40:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIGa-000000029ij-2GeQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 12:26:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E8DC05C5597;
	Mon, 14 Jul 2025 12:26:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A652C4CEED;
	Mon, 14 Jul 2025 12:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752496003;
	bh=ewJOgRj9eRRY+naXw54wKcAU6+y3/kMWLXLEIv8d//M=;
	h=From:To:Cc:Subject:Date:From;
	b=YV8VUAEEvUHnI4f8WE/EcPpt+WMASmIMFPkeRf44ltsof5XqXSEOUT8RxEE2bBp+p
	 CYyEhYdA5NMZRyqY44H3DKKbW2Jv/nrgTvRF2YvAgsOU/vBcSEcRJjpnvrN6nSjIIq
	 GbNE6codrQ1XNxtzO6t77JwXsEXcAo3d2Zs+mqLVw2I1nBhErusJXfXFSCXUZXUWHV
	 G1KfGCl/7s8G1APlejBO7N9osBKUC9TbvVeET5mTs26Aj00PjQ0DkltoC0eYNUke0g
	 27anZPIvVgnxaONb4gGZvIiuXlwb8pC21eZvrx/9sZLQu6nMCvGlQRz3Ad/G+4CU8o
	 Ai3BFuEahadyw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1ubIGX-00FW7V-Jv;
	Mon, 14 Jul 2025 13:26:41 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 00/11] KVM: arm64: nv: Userspace register visibility fixes
Date: Mon, 14 Jul 2025 13:26:23 +0100
Message-Id: <20250714122634.3334816-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com, peter.maydell@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_052644_662497_5A36CE7E 
X-CRM114-Status: GOOD (  10.95  )
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

Peter recently pointed out that we don't expose the EL2 GICv3
registers in a consistent manner, as they are presented through the
ONE_REG interface instead of KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS, despite
the latter already exposing the EL1 GICv3 regs.

While I was looking at this, I ended up finding a small number of
equally small problems:

- RVBAR_EL2 shouldn't be a thing at all

- FEAT_FGT registers should only be exposed to userspace if the
  feature is presented to the guest (and actually exists)

- FEAT_FGT2 registers are not exposed at all, and that's bad (though
  the machine that has FGT2 hasn't been built yet)

- Nothing documents which registers are exposed by
  KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS

So I cooked up a handful of fixes for those. And because I was feeling
generous, I hacked the get-reg-list test to check for the EL2
registers reported via ONE_REG /mindblown/.

Eric, I'd really appreciate if you could give this a go with QEMU to
check that you can now correctly get to the GIC El2 registers via the
expected interface.

Marc Zyngier (11):
  KVM: arm64: Make RVBAR_EL2 accesses UNDEF
  KVM: arm64: Don't advertise ICH_*_EL2 registers through GET_ONE_REG
  KVM: arm64: Define constant value for ICC_SRE_EL2
  KVM: arm64: Define helper for ICH_VTR_EL2
  KVM: arm64: Let GICv3 save/restore honor visibility attribute
  KVM: arm64: Expose GICv3 EL2 registers via
    KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS
  KVM: arm64: Condition FGT registers on feature availability
  KVM: arm64: Advertise FGT2 registers to userspace
  KVM: arm64: selftests: get-reg-list: Simplify feature dependency
  KVM: arm64: selftests: get-reg-list: Add base EL2 registers
  KVM: arm64: Document registers exposed via
    KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS

 .../virt/kvm/devices/arm-vgic-v3.rst          |  63 +++++-
 arch/arm64/kvm/sys_regs.c                     | 111 ++++++----
 arch/arm64/kvm/vgic-sys-reg-v3.c              | 121 ++++++++++-
 arch/arm64/kvm/vgic/vgic.h                    |  18 ++
 .../selftests/kvm/arm64/get-reg-list.c        | 197 +++++++++++++++---
 5 files changed, 432 insertions(+), 78 deletions(-)

-- 
2.39.2


