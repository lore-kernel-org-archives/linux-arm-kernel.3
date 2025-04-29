Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5ADC3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 13:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jmwVSwL7UNaUQ1jfds4nV4hE6xI6SFKBwje6lexgNao=; b=Uk1N/b+TTAqgOjGdVRZQoWjlX0
	6j3rgHHBEYB+5DPANrpswMC2UfMt1zI/l56KLDxwN+5ipTPxjPEXu5CyTnECUjinoEUxuAXjRb+f1
	3cKkkpxdtQMncK8/eHEjkSAZzyGHE7yStNR4PPR9Ic6oD5x+p2jNzOrPVy2ZSqwdNhJuL6zAU8pzT
	mhqAi6RO3gqn6osWpGeqycAHZ2UIvl0E9AWcknbDN/HeKw24XW0wfI8EWFOr+qn3gi++ZQwfYpL7B
	gO8zKFvJdZloZk3ZFGuQlLwO0QKfGLy951cUT3iRX0VZ4iLzmlbfodrHeCiyVczfK3SmPYabTt4Xj
	n0RZwaKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9kaF-00000009iFx-2mXK;
	Tue, 29 Apr 2025 13:01:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9jL2-00000009VZC-1xQM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 11:41:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DAA0FA4ADF0;
	Tue, 29 Apr 2025 11:35:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EB46C4CEEB;
	Tue, 29 Apr 2025 11:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745926883;
	bh=z7vRY6j0385eKhIiCYAI50mg523Vhh6+q1JFXwnzUdE=;
	h=From:To:Cc:Subject:Date:From;
	b=Z5IDkc9QmnF156EVu9ZzmDZrwjdxZ90IGgHdzed+020IwE8u5OLLG3TW2V7tb/xnP
	 gaFfLfUq66jpo4tw4iXaSyhSluCA6IkVb4v5wfP06p/YqpnzTxnQTQr2vHwbAaT1cl
	 x3PsCXgMcBmtpwxKIkA7fsIWFYcS2gTuXX2hqJVcsm/prfh5HCCEQt7f5xk+eKiU3F
	 S0HgXNdI751oc1+EyQvlO0p5pwEY8IbgIZfdvLSFOyAzlILoRKL5GGiY6OTcv3ufyd
	 sTicQ27SPT+YjWApIXQ4T9inmqW+8dB6HVGklIbyvxMoyNyJ2OaA58bi955nNo/ooD
	 oaU901VICr6OA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u9jKz-009t0f-6k;
	Tue, 29 Apr 2025 12:41:21 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Subject: [PATCH 0/2] KVM: arm64: Make AArch64 support sticky
Date: Tue, 29 Apr 2025 12:41:15 +0100
Message-Id: <20250429114117.3618800-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, gankulkarni@os.amperecomputing.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_044124_583019_F3C2F4E4 
X-CRM114-Status: UNSURE (   9.21  )
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

It's been recently reported[1] that our sorry excuse for a test suite
is writing a bunch of zeroes to ID_AA64PFR0_EL1.EL{0,1,2,3},
effectively removing the advertised support for AArch64 to the guest.

This leads to an interesting interaction with the NV code which reacts
in a slightly overzealous way and inject an UNDEF at the earliest
opportunity.

This small series fixes KVM by bluntly refusing to disable AArch64,
and the test to stop being so lame. I'm also fixing the NV code
separately, since it isn't upstream.

[1] https://lore.kernel.org/r/4e63a13f-c5dc-4f97-879a-26b5548da07f@os.amperecomputing.com

Marc Zyngier (2):
  KVM: arm64: Prevent userspace from disabling AArch64 support at any
    virtualisable EL
  KVM: arm64: selftest: Don't try to disable AArch64 support

 arch/arm64/kvm/sys_regs.c                       | 6 ++++++
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 8 ++++----
 2 files changed, 10 insertions(+), 4 deletions(-)

-- 
2.39.2


