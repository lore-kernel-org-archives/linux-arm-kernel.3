Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF9ECCA468
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6q+ZNE1nUGZxgVgcYbZb+/pWs2y4o/ysYPifpdn0rHw=; b=sB6BKHeb3lSEqQt2O/ulUSkaLf
	D2xDyL/Wos0y2OK+ogR+Xue4eOUe0S4pbBNZTdTAwggxtfXlSezndy18rcfKG539RcKCpW/Kd7kHD
	OlA9NtT5qceZHzaezHSzDup4euDZF50aRmBNm++KIcPC3/IvHb2shuF82bsniw/pW7Rj+GncV2FNn
	0bgDFifOhU3trFP6KKlPL/UjUuqDHu7eU6pqCq6l9TxPbs0a7mAZlgqUEBZD8SgnjPIFz2Iu99yEi
	EvXgTZzZWLdqUIsM0x+N4+oe+Sc/sg13DutS0M+Ow8qxuNIHChmoisFave5VLl7OEdvqi8MEsg1XK
	GHaFohQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GNA-00000002txP-42Qf;
	Mon, 29 Sep 2025 16:05:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GN8-00000002ttg-3n3V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 16:05:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 11DED625FB;
	Mon, 29 Sep 2025 16:05:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B76BDC113D0;
	Mon, 29 Sep 2025 16:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759161905;
	bh=ekwDuQm/LViV5dWIz28P721OuKbhpFowpx6Jkl0Irms=;
	h=From:To:Cc:Subject:Date:From;
	b=SKZPE8daQEViOlp2HYgoJhPIXdAGzG2SqZl/c0EV8UnHPLICvQzvHyxLogMv1M1h5
	 jY5z9NIIEWX0B5YXuFeGU+5xIpXUbNjmmidC6zJpm5ocEd9Yh3C+JH8EE4lEHDKqnJ
	 HP6wftqushbfhF4DhDsY2DgkRnZSnsPwXVc6mik1rAxNUJSMhQEHzu5EB26E0kNYCt
	 /DkVxxyvxErXR9KSNb1gLI2U/xD0ASscl8qHxVi+8V0HmN8XUJ4s7B3hILNveRnNgq
	 HT6slkrogWplR4QWwt9ksj0dEjcZkIHdnEr8gzvK8tFqMdDxNMdXNFoTXekdGbo/vo
	 dAmGqQooW+87g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v3GN5-0000000AHqo-0cJ2;
	Mon, 29 Sep 2025 16:05:03 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 00/13] KVM: arm64: De-specialise the timer UAPI
Date: Mon, 29 Sep 2025 17:04:44 +0100
Message-ID: <20250929160458.3351788-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
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

Since the beginning of the KVM/arm64 port, the timer registers were
handled out of the normal sysreg flow when it came to userspace
access, leading to extra complexity and a bit of code duplication.

When NV was introduced, the decision was made early to handle the new
timer registers as part of the generic infrastructure. However, the
EL0 timers were left behind until someone could be bothered to
entangle that mess.

Said mess is more complicated than it looks, due to a nasty bug
documented in 290a6bb06de9e ("arm64: KVM: Add UAPI notes for swapped
registers"), where it was realised that CNTV_CVAL_EL0 and CNTVCT_EL0
have had their encoding swapped at the user interface level. Handling
of this issue is spread all over the place instead of being contained
in a single location, and it needs to be contained.

Finally, it was noticed that we expose the CNTHV_*_EL2 registers to
userspace for nVHE guest, while the architecture is clear that they do
not exist in that configuration.

This series aims at fixing all of the above, moving the handling of
the timer sysregs to sys_regs.c, fix a corner case with WFxT, handle
the nVHE issue described above, and finally improve the testing by
introducing an E2H==0 configuration.

If excluding the selftests, this is a net deletion of code. What's not
to like?

Marc Zyngier (13):
  KVM: arm64: Hide CNTHV_*_EL2 from userspace for nVHE guests
  KVM: arm64: Introduce timer_context_to_vcpu() helper
  KVM: arm64: Replace timer context vcpu pointer with timer_id
  KVM: arm64: Make timer_set_offset() generally accessible
  KVM: arm64: Add timer UAPI workaround to sysreg infrastructure
  KVM: arm64: Move CNT*_CTL_EL0 userspace accessors to generic
    infrastructure
  KVM: arm64: Move CNT*_CVAL_EL0 userspace accessors to generic
    infrastructure
  KVM: arm64: Move CNT*CT_EL0 userspace accessors to generic
    infrastructure
  KVM: arm64: Fix WFxT handling of nested virt
  KVM: arm64: Kill leftovers of ad-hoc timer userspace access
  KVM: arm64: selftests: Make dependencies on VHE-specific registers
    explicit
  KVM: arm64: selftests: Add an E2H=0-specific configuration to
    get_reg_list
  KVM: arm64: selftest: Fix misleading comment about virtual timer
    encoding

 arch/arm64/kvm/arch_timer.c                   | 105 ++-------------
 arch/arm64/kvm/guest.c                        |  70 ----------
 arch/arm64/kvm/handle_exit.c                  |   7 +-
 arch/arm64/kvm/sys_regs.c                     | 123 +++++++++++++++---
 arch/arm64/kvm/sys_regs.h                     |   6 +
 include/kvm/arm_arch_timer.h                  |  24 ++--
 .../selftests/kvm/arm64/get-reg-list.c        |  99 +++++++++++++-
 7 files changed, 240 insertions(+), 194 deletions(-)

-- 
2.47.3


