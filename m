Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90780CE7AE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 11:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WMgxT/L2foIrwPiQiB6dknLjOaDCuHlBwMBpnikTih0=; b=QYT2veOSvdNS0n/8gdA5zJg0Ec
	AbZiBxJPIw+FJf2Z3bkdD3UThgbhslIadxkw/oSjmrSkfSPKp1ujAh1RHSUfTBSQBlfP6HA3KdVla
	6o1NSZnwHCxPHmumYDHPoSmxYZtvKd3gZF9j8+tyFyq4hg1zIclGor1YMZmns0O4D34xgeWgSrW24
	hR6KExW5c4N492Gouuw9XNIz7DTKYgptg26DDhVhLncvFwBUzghnP8SgDGkf/0E9fSJgki5HMyLwu
	0fRKhF+OY9NU1dfuAbXKLI3+FHhsA+SnTpaO2j3GrnE9UbpRKL6X+0NHJUYUWmJDsJmiV1fzFHNwL
	dw3woDKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJs4j-0000000C7yF-16EL;
	Fri, 14 Nov 2025 11:34:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJs4i-0000000C7y9-23jP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 11:34:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 523106016F;
	Fri, 14 Nov 2025 11:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF769C19421;
	Fri, 14 Nov 2025 11:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763120083;
	bh=KV4hhmCrF50yCsv4HaclQvyKMdrM81Xxcq4YVAQQSdM=;
	h=From:To:Cc:Subject:Date:From;
	b=L2rRQ37z0sVAN0FA5ANL2E37QwZJvRNyI7QuUHhc6R5hz7YYRZyW2i43z80bvLIai
	 lemBuJC5vC6ZWyC7DMhcJREmerTrvldjmsTWXQKjiT1kEIJCj7MB1wwVAOlc9VqNHB
	 sawVRJauQ+m9txr8vDvkkT5mJNA2nak1hPwmDFUSIsOdWgnrCMsQubgSHO3rBdy1II
	 pT4JfFlMz1sNI99vz5LD8SV8J8INeZwGv9Ph2Tq/aYvP/gzMTRlBkZWNhddh1/RkI9
	 FmzuvdszNNBLiEo/kwgm884A0Zxla311ddGhbwKNFuhXrSjSyZFCDREGDnvBo4feeX
	 zTdaWfno+fEbw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vJs4e-00000005Brg-38Js;
	Fri, 14 Nov 2025 11:34:40 +0000
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Alexandru Elisei <alexandru.elisei@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] KVM/arm64 fix for 6.18, take #3
Date: Fri, 14 Nov 2025 11:34:15 +0000
Message-ID: <20251114113415.3217950-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, alexandru.elisei@arm.com, broonie@kernel.org, oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

I'm back with my weekly routine of collecting patches, plugging
another couple of regressions (the FGT one is particularly annoying).
I hope this is the last one for this cycle, but my gut feeling is that
we're not quite finished with it yet...

Please pull,

	M.

The following changes since commit 4af235bf645516481a82227d82d1352b9788903a:

  MAINTAINERS: Switch myself to using kernel.org address (2025-11-08 11:21:20 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kvmarm-fixes-6.18-3

for you to fetch changes up to 85592114ffda568b507bc2b04f5e9afbe7c13b62:

  KVM: arm64: VHE: Compute fgt traps before activating them (2025-11-12 10:52:58 +0000)

----------------------------------------------------------------
KVM/arm64 fixes for 6.18, take #3

- Only adjust the ID registers when no irqchip has been created once
  per VM run, instead of doing it once per vcpu, as this otherwise
  triggers a pretty bad conbsistency check failure in the sysreg code.

- Make sure the per-vcpu Fine Grain Traps are computed before we load
  the system registers on the HW, as we otherwise start running without
  anything set until the first preemption of the vcpu.

----------------------------------------------------------------
Alexandru Elisei (1):
      KVM: arm64: VHE: Compute fgt traps before activating them

Marc Zyngier (1):
      KVM: arm64: Finalize ID registers only once per VM

 arch/arm64/kvm/arm.c      | 2 +-
 arch/arm64/kvm/sys_regs.c | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

