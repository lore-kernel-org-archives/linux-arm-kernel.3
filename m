Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430F8C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 10:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WilBWoVxe780vaB8SUw9b0HZ/qMJgs5Zb2UJHgCknoE=; b=l/ccRo+b+UDle/3AcHNmerEF8U
	yr7S0bayVPq3zUgSlL0Ev4VND4yMvGCQ53+atUmSX8H4wiJhXSq9J1TI9pzcF6Otnk6MvPEhpPfA8
	/jIlzL+3RJfoqx/j159VZaabRVskmkl8wFkAy4TdvdNxdRJERuWVyhGkMLxw0coGRX+e6suAnlel/
	XZRf+0Rg+3ivD/6ycE3th7vMhjWaxb2xLgkEDbVkb/6DN3kcN1xi7F2RAhRffVSkcciQzAIWpiLLP
	vuwrZATKIFca2uglOr5rulScXJOmuJoi7ShFL7N6biDps7KwhPhLBC/MQYmRRK4mv98AFMDc++nAS
	xbyit9LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXGtY-0000000Awnw-41l3;
	Thu, 03 Jul 2025 10:10:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXGrD-0000000AwZ3-0Tmh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 10:07:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 83F4D5C5E8A;
	Thu,  3 Jul 2025 10:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C768C4CEE3;
	Thu,  3 Jul 2025 10:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751537274;
	bh=F/OkyKp+J6DRlUl/QwnUYqH016WngjOoTrYbS5ddsoQ=;
	h=From:To:Cc:Subject:Date:From;
	b=tDh6RQ+GnEb9Sr0A2319xxm6TfoOJdpr7LZSry7gSyoC0W4p6dWv4Zm4BENSOuXFi
	 KQ4Tx+ww3cqm3iQ164Hn2fgEBYpUCCEGPxCtxCDXRO7/6nWoSbcWnu6y2f9Rt83vkR
	 k+lw27QX1lE+Xkne73cGPepo5yIkj6feNwBM3OMmAIs/gE18xQdOPZzOwmLqfwH3Jr
	 nyu24tIUiltzyHMAflxlkQpwFMGGTgokSh2nN1YWmoRxZWaaF5y4+AHNyijIPqfZCF
	 lsxHJ5+mA2ab5XkG0WgNxstfx4qhxUzt0y7etKXi9nyR9921sjcqUDUcO686EgdBwJ
	 toQFGmfiWRxSA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uXGpD-00CG4L-Q0;
	Thu, 03 Jul 2025 11:07:51 +0100
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] KVM/arm64 fixes for 6.16, take #5
Date: Thu,  3 Jul 2025 11:05:44 +0100
Message-Id: <20250703100544.947908-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, catalin.marinas@arm.com, tabba@google.com, broonie@kernel.org, mark.rutland@arm.com, oliver.upton@linux.dev, will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_030755_240584_2852FE18 
X-CRM114-Status: UNSURE (   9.19  )
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

The one-fixes-PR-per-week trend continues, with ever decreasing levels
of severity.

This time, we drop some leftovers from past fixes, removing the EL1 S1
mapping of the host FPSIMD state, and stop advertising bogus S2 base
granule sizes to the guest.

I expect you will bundle this with the kvmarm-fixes-6.16-4 PR from
last week.

Please pull,

	M.

Marc Zyngier (1):
  KVM: arm64: Fix handling of FEAT_GTG for unimplemented granule sizes

Mark Rutland (1):
  KVM: arm64: Remove kvm_arch_vcpu_run_map_fp()

 arch/arm64/include/asm/kvm_host.h |  1 -
 arch/arm64/kvm/arm.c              |  4 ----
 arch/arm64/kvm/fpsimd.c           | 26 --------------------------
 arch/arm64/kvm/nested.c           | 26 +++++++++++++++++++++++---
 4 files changed, 23 insertions(+), 34 deletions(-)

-- 
2.39.2

The following changes since commit 0e02219f9cf4f0c0aa3dbf3c820e6612bf3f0c8c:

  KVM: arm64: Don't free hyp pages with pKVM on GICv2 (2025-06-26 11:39:15 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kvmarm-fixes-6.16-5

for you to fetch changes up to 42ce432522a17685f5a84529de49e555477c0a1f:

  KVM: arm64: Remove kvm_arch_vcpu_run_map_fp() (2025-07-03 10:39:24 +0100)

----------------------------------------------------------------
KVM/arm64 fixes for 6.16, take #

- Remove the last leftovers from the ill-fated FPSIMD host state
  mapping at EL2 stage-1

- Fix unexpected advertisement to the guest of unimplemented S2 base
  granule sizes

----------------------------------------------------------------
Marc Zyngier (1):
      KVM: arm64: Fix handling of FEAT_GTG for unimplemented granule sizes

Mark Rutland (1):
      KVM: arm64: Remove kvm_arch_vcpu_run_map_fp()

 arch/arm64/include/asm/kvm_host.h |  1 -
 arch/arm64/kvm/arm.c              |  4 ----
 arch/arm64/kvm/fpsimd.c           | 26 --------------------------
 arch/arm64/kvm/nested.c           | 26 +++++++++++++++++++++++---
 4 files changed, 23 insertions(+), 34 deletions(-)

