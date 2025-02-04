Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A90C02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 16:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hauJu26kkXe1JdmoBS/fv8MeH/lH7c8n0YlDPmB8m+4=; b=hOC+BZ+SFelGiKKNm68pXwGdZf
	sUGaMUtVDj2UIPikugAca3AFQrEjMkH5MTmMvbvEkyrGq7nzObsVn2Y/3Dqfl3NcHgqEjxvScpWuP
	xenDI2uZIuhMsXzgSv6ms3kUr2gjLrN8Om4ReGo46nC/OxbUp34sPAGVHkiqoSXxZndlA0SDL5zR3
	boRQV3dd/H/TGlMlrk/sly7tbj5ylQeT/LGRsGl3rhFzp3mK5JmBOLC3vQnF+C6K4Ydx3BNvxC4LS
	/zHsV0vvlpsoSamCei/1HrYyCiJMeSUX+W2ds5AyxRT+8h8dbdwN5nNfVglT2aSoVIz63wFyPIXxc
	VylwQ4gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfLNf-00000000uRc-1mp5;
	Tue, 04 Feb 2025 16:02:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfLIi-00000000tjG-2zXA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 15:57:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4ABF05C57AF;
	Tue,  4 Feb 2025 15:56:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3D4C4CEDF;
	Tue,  4 Feb 2025 15:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738684643;
	bh=7uLPLkv/rRUvTQqmbKnITADQnn/mB3pVaCmFUVO5FDM=;
	h=From:To:Cc:Subject:Date:From;
	b=s1p8T9UGTcbP/kXq8edjVeaZHp1tIIwnu1WuADL2T35DF3lfME8nV3nDzfdY8dCW+
	 c3aTjhTOfdauijgrdMbmpezc1jb9n1/AVkG+M7SqwKk6rFVuTs3Jji/wfxDebQA0+m
	 qHe5nnvy1fwS0R08exexp1+GBwdIPSQsqVSvxIB+08+XIePqMOOZ2BPOjsJFL3yWxd
	 VYsYuQN8axQrYdz9db2NyEYOlIFLlnsjfVwIFjZxiO2+ko8JKqun0UUxsvVT8gzTSL
	 VBzJ873rAFPnTy0avAKTKZgKiYUbZZCEMnuXpVUnJ91tOx3B7OMWN0ypOVUNJHEqMD
	 hoxQQCuPDWGFA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tfLIf-000Tr7-6r;
	Tue, 04 Feb 2025 15:57:21 +0000
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Alexander Potapenko <glider@google.com>,
	Dmytro Terletskyi <dmytro_terletskyi@epam.com>,
	Fuad Tabba <tabba@google.com>,
	Lokesh Vutla <lokeshvutla@google.com>,
	Mark Brown <broonie@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei-Lin Chang <r09922117@csie.ntu.edu.tw>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Subject: [GIT PULL] KVM/arm64 fixes for 6.14, take #1
Date: Tue,  4 Feb 2025 15:56:56 +0000
Message-Id: <20250204155656.775615-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, glider@google.com, dmytro_terletskyi@epam.com, tabba@google.com, lokeshvutla@google.com, broonie@kernel.org, oliver.upton@linux.dev, Volodymyr_Babchuk@epam.com, r09922117@csie.ntu.edu.tw, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_075724_837005_B7EB30EC 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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

This is the first set of KVM/arm64 fixes for 6.14, most of them
addressing issues exposed by code introduced in the merge window
(timers, debug, protected mode...). Details in the tag, as usual.

Please pull,

	M.

The following changes since commit 01009b06a6b52d8439c55b530633a971c13b6cb2:

  arm64/sysreg: Get rid of TRFCR_ELx SysregFields (2025-01-17 11:07:55 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kvmarm-fixes-6.14-1

for you to fetch changes up to 0e459810285503fb354537e84049e212c5917c33:

  KVM: arm64: timer: Don't adjust the EL2 virtual timer offset (2025-02-04 15:10:38 +0000)

----------------------------------------------------------------
KVM/arm64 fixes for 6.14, take #1

- Correctly clean the BSS to the PoC before allowing EL2 to access it
  on nVHE/hVHE/protected configurations

- Propagate ownership of debug registers in protected mode after
  the rework that landed in 6.14-rc1

- Stop pretending that we can run the protected mode without a GICv3
  being present on the host

- Fix a use-after-free situation that can occur if a vcpu fails to
  initialise the NV shadow S2 MMU contexts

- Always evaluate the need to arm a background timer for fully emulated
  guest timers

- Fix the emulation of EL1 timers in the absence of FEAT_ECV

- Correctly handle the EL2 virtual timer, specially when HCR_EL2.E2H==0

----------------------------------------------------------------
Lokesh Vutla (1):
      KVM: arm64: Flush hyp bss section after initialization of variables in bss

Marc Zyngier (4):
      KVM: arm64: Fix nested S2 MMU structures reallocation
      KVM: arm64: timer: Always evaluate the need for a soft timer
      KVM: arm64: timer: Correctly handle EL1 timer emulation when !FEAT_ECV
      KVM: arm64: timer: Don't adjust the EL2 virtual timer offset

Oliver Upton (2):
      KVM: arm64: Flush/sync debug state in protected mode
      KVM: arm64: Fail protected mode init if no vgic hardware is present

 arch/arm64/kvm/arch_timer.c        | 49 +++++++++-----------------------------
 arch/arm64/kvm/arm.c               | 20 ++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 24 +++++++++++++++++++
 arch/arm64/kvm/nested.c            |  9 +++----
 arch/arm64/kvm/sys_regs.c          | 16 ++++++++++---
 5 files changed, 73 insertions(+), 45 deletions(-)

