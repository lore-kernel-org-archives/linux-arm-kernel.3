Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48561C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 17:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H7XWeEuCN6rH5IyC1gkDtve0NaKkni2h3YomSvKG9wQ=; b=YFY1i/CyTAq3NwdKqw7d45OUWq
	VBBwa/A1168N5jqVyn8jMtic27BZcDHPjQQA1J0wVyNF7fPDnS5EpphnHhSsfzDPokP0ZpSKyGfVP
	V7ncElnqJXDqqpjpHt915OIwl4JL+Be+gYeWR8JWtat/WjIPX3PDbIshZ6AN77pg7P1sg3/ObQOgj
	ORI1vFO8RUmJudqWQRGQkL7rjIRkrdGyQnLf3iCqVmhidgzXrlDyNYxRvwWToiF54M5/0TalIuv9p
	eI9mw4L6+bH1wWFVRxU2MxGwnVcqhrbQX9Ix6S8U3q5ZPHOw62k7IEZCrdXGK2I8OJwPlT1fJN3gZ
	cYhP2VYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDwu-0000000A0WR-3OXO;
	Tue, 21 Jul 2026 17:08:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDws-0000000A0Ux-396I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 17:08:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 73D7243BDF;
	Tue, 21 Jul 2026 17:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 574B61F00A3A;
	Tue, 21 Jul 2026 17:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784653686;
	bh=H7XWeEuCN6rH5IyC1gkDtve0NaKkni2h3YomSvKG9wQ=;
	h=From:To:Cc:Subject:Date;
	b=b1RMtAfbk8W+IThhGs+jkNBSAmMCo1OnaSllxQPwuvHNuEDgxZHloU0v9Pyhmk1HR
	 hS5EzXdRMFXdaymWz3pFlplhpOev71x9nn+gJbt6SV1dINOv5RiybJlTIVfd5n3iqt
	 CxsnyYVsRaYWh4Umq5RDGyiHBIOQ2yx7fkyRZXvJOcq4ywIawyUU/CQTpr0aih3//2
	 f5SNjlXy2JK3oXEc46woHRK8p+gyEOpiZBTpQ2CH5N703/dP73p4GaHCOzvDyY46Nn
	 O4MNrIqN+trfHFMtXmxqZOcviPmeaSMYVmN7MLKUlPaA3d8PxIIXnzcIWHnYnHQH/X
	 zcWvfLypdJMmA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wmDwq-00000007J9p-0mu5;
	Tue, 21 Jul 2026 17:08:04 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 0/6] KVM: arm64: Make ICH_VTR_EL2 accesses an inlined literal
Date: Tue, 21 Jul 2026 18:07:48 +0100
Message-ID: <20260721170754.3150521-1-maz@kernel.org>
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

I'm reposting this early as there were so many issues to the original
posting that I decided to deviate from my own rules... Bite me.

This is the second version of this series I initially sent as [1],
which aims at removing the large number of traps that ICH_VTR_EL2
generates in NV environments, leading to pointless overheads.

By moving from a sysreg access to a patched constant, running an L3
workload with a a healthy amount of IO results in a 5% reduction of
wall-clock time from a baseline without this series.

* From v1 [1]:

  - Move the "broken SEIS" detection to an erratum, something it
    should always have been, so that vgic_broken_seis() doesn't have
    to use non-noinstr function calls (sashiko)

  - Drop WARN_ON() in the patch function (sashiko)

  - Switch from this_cpu_has_cap() to cpus_have_cap() (shashiko)

  - Reorganise the patches so that some of the code movements are less
    surprising to our favourite Artificial Idiot

  - Simplify __vgic_v3_get_config() to only return the MMIO attribute
    as a boolean, dropping all form of GICv5 support which made little
    sense

[1] https://lore.kernel.org/r/20260720132220.2143486-1-maz@kernel.org

Marc Zyngier (6):
  KVM: arm64: vgic-v3: Make vtr_to_* helpers use architectural field
    symbols
  KVM: arm64: Move GICv3 broken SEIS implementation detection to a CPU
    errrata
  KVM: arm64: Add a helper providing an inlined literal value for
    ICH_VTR_EL2
  KVM: arm64: Convert most ICH_VTR_EL2 accesses to inlined literal value
  KVM: arm64: vgic-v3: Simplify initial GICv3 configuration sampling
  KVM: arm64: vgic-v3: Kill kvm_vgic_global_state.ich_vtr_el2

 arch/arm64/include/asm/kvm_asm.h |  2 +-
 arch/arm64/kernel/cpu_errata.c   | 17 +++++-
 arch/arm64/kernel/image-vars.h   |  1 +
 arch/arm64/kvm/hyp/vgic-v3-sr.c  | 43 +++++----------
 arch/arm64/kvm/nested.c          |  3 +-
 arch/arm64/kvm/vgic-sys-reg-v3.c |  8 +--
 arch/arm64/kvm/vgic/vgic-v3.c    | 93 +++++++++++++++++++++-----------
 arch/arm64/kvm/vgic/vgic-v5.c    |  5 +-
 arch/arm64/kvm/vgic/vgic.h       | 19 ++++++-
 arch/arm64/tools/cpucaps         |  1 +
 include/kvm/arm_vgic.h           |  2 -
 11 files changed, 118 insertions(+), 76 deletions(-)

-- 
2.47.3


