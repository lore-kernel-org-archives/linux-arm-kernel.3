Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590BBCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WKL5cQ/fLjoPuQjEebN9B21OORU9phndSZn8oOC4Grk=; b=iXgfQNC9H0TM5Ynl7xlEb+wq43
	cqoj+4pk+Hde5GfQEjGvxqfeBjFNQ/QTqe7VOyacst+BoXxvidRs+yB4wqYR4xmhCnxPImXXWXXDL
	EbaGUh4xkSM/eOxgufSwUbOPv0w7RVl28LSFPHrG65+4MFxt3qpJxRbX0qVftr/6HOJkgfVeCUACd
	iiF97EtfSmk5ps8bKo8lMJcoZFTdBs3RtDFzfdXBKCqu+ACh7PrXWYQ97L9UW1SWeehMDdX1MYi2Q
	F1Usbhu3pB82Rb2KDxFHBy5URCO0PDOg7jPyd7xbSCBtHfkJh9qlofJzg4BmWYEK4oVjzlSMDxce/
	gyXdIWUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGL9-00000000J4B-24va;
	Thu, 18 Sep 2025 15:14:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGL7-00000000J2N-2dRW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:14:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C9C556021D;
	Thu, 18 Sep 2025 15:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77A0CC4CEF7;
	Thu, 18 Sep 2025 15:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758208468;
	bh=lySSroNwuLPO9Po2mMkpeuuB5AfkkzflRth74TTL0bU=;
	h=From:To:Cc:Subject:Date:From;
	b=vP+SQseV0wUM7tXyxUy/F8GJnb3kAJLp9q0siYT48MB4h5Nm2K2JMa5naKb/sO6w+
	 fB3+0EEZObxkjPdVQyImBCLEtv+2V4/90aJAgqVkWujAyYW8p/OnPjAhwSIZuVL3bW
	 UQlX+sdWlcaOTmZBIJm+23DeYZgbTw+/uVH7/Wu78l5t1SHko0qQHgRAlA0ky2m0Uz
	 xaGSYHQRvdEXlrQObqTAy1b2ynEVR1lv4/4UzPlI3BtKAK+vyNBpR+81EzsRobc6q+
	 vWn5Yz+2EEB7iB1PtuB/4yn4RXuw+sCKo56oXfzDdR13ZDjKJXQtoxm+JT6Q161sKB
	 zlq7nm7RR0R4w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uzGL4-00000007TmF-0Yts;
	Thu, 18 Sep 2025 15:14:26 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jinqian Yang <yangjinqian1@huawei.com>
Subject: [PATCH v2 00/10] KVM: arm64: Handle effective RES0 behaviour of undefined registers
Date: Thu, 18 Sep 2025 16:13:52 +0100
Message-Id: <20250918151402.1665315-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, yangjinqian1@huawei.com
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

[After yesterday's blunder, I'm reposting this, with proper commit
 messages, and having taken Oliver's feedback into account.]

When a feature is removed from a guest, we ensure that the trap and
control bits for that particular feature are made RES0.

For example, SCTLR2_EL2 contains a large number of bits. For any
feature FEAT_FOO that is controlled by a bit FOO in SCTLR2_EL2, we
make sure that SCTLR2_EL2.FOO is RES0 if FEAT_FOO is not visible to
the guest.

However, nothing makes SCTLR2_EL2 RES0 if FEAT_SCTLR2 is not visible.

This series aims at solving this sort of situations. It is still quite
incomplete, but aims at bridging a couple of other series:

- 20250911114621.3724469-1-yangjinqian1@huawei.com which wants to
  make EL2-related fields writable to allow migration

- 20250912212258.407350-1-oliver.upton@linux.dev which wants to align
  the NV support with the rest of the kernel

Hopefully this helps getting to a point where we everything is
sanitised according to the architecture, EL2 on the same footing as
EL1, and everything migrating in every possible case.

And winning the lottery.

* From v1:

  - Commit messages!

  - Simplified declaration macros

  - Added helpful comments (or so I hope)

  - Changed type names according to Oliver's suggestion

Marc Zyngier (10):
  KVM: arm64: Remove duplicate FEAT_{SYSREG128,MTE2} descriptions
  KVM: arm64: Add reg_feat_map_desc to describe full register dependency
  KVM: arm64: Enforce absence of FEAT_FGT on FGT registers
  KVM: arm64: Enforce absence of FEAT_FGT2 on FGT2 registers
  KVM: arm64: Enforce absence of FEAT_HCX on HCRX_EL2
  KVM: arm64: Convert HCR_EL2 RES0 handling to compute_reg_res0_bits()
  KVM: arm64: Enforce absence of FEAT_SCTLR2 on SCTLR2_EL{1,2}
  KVM: arm64: Enforce absence of FEAT_TCR2 on TCR2_EL2
  KVM: arm64: Convert SCTLR_EL1 RES0 handling to compute_reg_res0_bits()
  KVM: arm64: Convert MDCR_EL2 RES0 handling to compute_reg_res0_bits()

 arch/arm64/kvm/config.c | 357 +++++++++++++++++++++++++---------------
 1 file changed, 227 insertions(+), 130 deletions(-)

-- 
2.39.2


