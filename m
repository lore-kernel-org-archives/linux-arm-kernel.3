Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0D5C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 16:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3UpOuqEkkw0pqhd8GQtdKwlBGOMndBN8SkjNCqEm5xw=; b=TcNFNiTTXYfqYikVMDyjNSVMHA
	pr04T1BviUvVT4X1rp3n8MTfSOqHwNTEZMh6+XR7+HibYtbp16FxBXJU1rOxx+SBpgeAaI2zAkp9M
	3/u1iLKIfMkSZHxOWRnhTVLjBftdfMqDmjKXSfigKRhv6chkMFZoDz4Igua7lrz4PWxzDc6pkRrLD
	DSyQLhRLqWBPQrFjMYOwh9rg+EoGlBuZaENbtBodWMqo9zYIOAKQOuShyo5FHVYrkdpyGu4XKlcj6
	Gtky+Ho+Lu2o3jp1oJHiecRbouk/zvbX4a+dNWrG0/tQLqzU/ii1cBmVlMKHJJ7AMe9beyHNDj/qp
	0XjFQ6mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqaQm-0000000EsNP-30Fs;
	Fri, 07 Mar 2025 16:20:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqaP8-0000000Erm0-3zsa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 16:18:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EA7CB5C51AF;
	Fri,  7 Mar 2025 16:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 624BBC4CED1;
	Fri,  7 Mar 2025 16:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741364309;
	bh=dou9LxTbjCg/TK9bz3v6nlT4kc6yvpg0t7FYG2dWH3o=;
	h=From:To:Cc:Subject:Date:From;
	b=lJeSkNOaWizpe65670I85HU9y6eg0HmOUp4LJ+c5Y05gNDJQFLl++Ag1xmLpkkdIo
	 xefmR/NR+AJyD58NKDuyPZxLOj8QSjmrwavVFdSIXQMpIVT/sKylb3tO2zh5p6g6uI
	 SGuIHVc+gQQVC7skzekT+0WroizhwoPhZrDFh3F2XU1dyCcdoIMAue2FPWCY5isglZ
	 JASfYBN8YpD71Ny9frSiw5P7qToxQQ6ZkV96iWFwZxjm1k08O8YESkUT8d+2CiJ29F
	 4kEhpHAuELMF3O/FI5zPsjubMBxFAIh0yzgawNFAtjaBvzrcVq1Yo/e6nSUkaFkuIk
	 MOnzUIn91yKUQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tqaP4-00BT9x-Uf;
	Fri, 07 Mar 2025 16:18:27 +0000
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Ahmed Genidi <ahmed.genidi@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Leo Yan <leo.yan@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] KVM/arm64 fixes for 6.14, take #4
Date: Fri,  7 Mar 2025 16:18:24 +0000
Message-Id: <20250307161824.2373079-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, ahmed.genidi@arm.com, ben.horgan@arm.com, catalin.marinas@arm.com, leo.yan@arm.com, mark.rutland@arm.com, oliver.upton@linux.dev, will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_081831_044055_46651C14 
X-CRM114-Status: GOOD (  11.50  )
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

Here's what I hope to be the last set of 6.14 fixes for
KVM/arm64. This time, two patches addressing the two side of the same
bug, where pKVM's PSCI relay wasn't correctly setting up the CPUs when
in the hVHE mode. Thanks to Ahmed and Mark for fixing it.

Please pull,

	M.

The following changes since commit fa808ed4e199ed17d878eb75b110bda30dd52434:

  KVM: arm64: Ensure a VMID is allocated before programming VTTBR_EL2 (2025-02-20 16:29:28 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kvmarm-fixes-6.14-4

for you to fetch changes up to 3855a7b91d42ebf3513b7ccffc44807274978b3d:

  KVM: arm64: Initialize SCTLR_EL1 in __kvm_hyp_init_cpu() (2025-03-02 08:36:52 +0000)

----------------------------------------------------------------
KVM/arm64 fixes for 6.14, take #4

- Fix a couple of bugs affecting pKVM's PSCI relay implementation
  when running in the hVHE mode, resulting in the host being entered
  with the MMU in an unknown state, and EL2 being in the wrong mode.

----------------------------------------------------------------
Ahmed Genidi (1):
      KVM: arm64: Initialize SCTLR_EL1 in __kvm_hyp_init_cpu()

Mark Rutland (1):
      KVM: arm64: Initialize HCR_EL2.E2H early

 arch/arm64/include/asm/el2_setup.h   | 31 ++++++++++++++++++++++++++-----
 arch/arm64/kernel/head.S             | 22 +++-------------------
 arch/arm64/kvm/hyp/nvhe/hyp-init.S   | 10 +++++++---
 arch/arm64/kvm/hyp/nvhe/psci-relay.c |  3 +++
 4 files changed, 39 insertions(+), 27 deletions(-)

