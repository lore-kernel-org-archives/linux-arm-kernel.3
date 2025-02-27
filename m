Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B056C1B087
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YeTra3+blrtZBySNfvrRqtqHEmeVgtJ/OmVJ+5+2LEI=; b=D2koKdwfqezK10LY6n93p3TJJp
	WMDfty7PHWsG8Iva2yOS12fM3MYBrWjCZXWx3Yi9UMioa1G6udgB2aaGQV2oH8nNLOnmYLc9UBNSZ
	c+C+9hOCecjyLuc29iGGCWSF+u3+zXRJoN/we+gGdZkJ/SpdiJ2YQrr2iJ6faWrEcbXQsuOrWJHIs
	wgQZsGpyreHSlKTEKP2P3TSKFjeUdNhmNwuL/Mrk7Y6QAU2CFjCTotGXrmAeIrm0C2Tg2bNnyH2at
	2x7Q2JFU6WVIldT51I3rDe4dseY2/Qm5nGAtphYqv6J+EYg0/LvAvSubSvDG5E4qb1uKy7A3KPdwb
	NVaMTi7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjle-00000008c4a-1zx5;
	Thu, 27 Feb 2025 19:41:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tniGZ-00000008H2o-3Afh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 18:05:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 889281516;
	Thu, 27 Feb 2025 10:05:56 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4530D3F5A1;
	Thu, 27 Feb 2025 10:05:39 -0800 (PST)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: ahmed.genidi@arm.com,
	ben.horgan@arm.com,
	catalin.marinas@arm.com,
	kvmarm@lists.linux.dev,
	leo.yan@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	will@kernel.org
Subject: [PATCH 0/2] KVM: arm64: PSCI relay fixes
Date: Thu, 27 Feb 2025 18:05:24 +0000
Message-Id: <20250227180526.1204723-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_100547_836182_6235EE3E 
X-CRM114-Status: UNSURE (   8.79  )
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

These patches fix some missing initialization in the PSCI relay code
which can result in host kernel crashes shortly after entering the cold
entry points used by PSCI CPU_ON, CPU_SUSPEND, and SYSTEM_SUSPEND.

The SCTLR_EL1 issue was originally reported by Leo Yan and debugged by
Ahmed Genidi. While looking at Ahmed's patch I spotted a more general
issue with E2H, so I've fixed that up with patch 1, and I've tweaked his
patch accordingly. Any errors there are my fault.

The series is based on v6.14-rc3.

Mark.

Ahmed Genidi (1):
  KVM: arm64: Initialize SCTLR_EL1 in __kvm_hyp_init_cpu()

Mark Rutland (1):
  KVM: arm64: Initialize HCR_EL2.E2H early

 arch/arm64/include/asm/el2_setup.h   | 31 +++++++++++++++++++++++-----
 arch/arm64/kernel/head.S             | 22 +++-----------------
 arch/arm64/kvm/hyp/nvhe/hyp-init.S   | 10 ++++++---
 arch/arm64/kvm/hyp/nvhe/psci-relay.c |  3 +++
 4 files changed, 39 insertions(+), 27 deletions(-)

-- 
2.30.2


