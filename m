Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FB2C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 12:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ftPbLGvYsJt5cSyYlAPIaX6qyIcNYBcJB0O6Rx9rqeM=; b=ouUtJjVpEa0WUqmW2PZgqaeMfX
	dGUz9qRlTGI3/vXbOkzJcscpJlhO1/1DrSRXKzCzaVqjhXvx0JbZQoKcomdk/BeDloFpA+fM0hcVx
	ZA6TOODQXipf5O0zF1/7UPMAwjYsaVEzfJAb5OgPZ6ayjJ2RLrPbIhxsL7jTkR+R5cobAG9tOm4fg
	5X2vKZ23m9+nvN3Lu4P93LcRQ+b3qcgycOsWhc6JAoiJm+BRKsHmspYyqvp8Jfd8sljEbQq3XhO+v
	1Q82JiTsrizUd+uYBhStJ9EOg6ldfrYohWz2OPh/K50+/3yOzS6+FbW5tazuopXsoS9FuZEQoXo4Q
	B3zpssMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIAM-0000000295a-1mBO;
	Mon, 14 Jul 2025 12:20:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubHm7-000000024rE-1DNw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 11:55:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 013A843F70;
	Mon, 14 Jul 2025 11:55:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D624EC4CEED;
	Mon, 14 Jul 2025 11:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752494114;
	bh=KQgnlUjQYdLD1Hqbz0tCcapTT+nm1BoKMb7War2FM2c=;
	h=From:To:Cc:Subject:Date:From;
	b=mnSCzGIKJti7sYf3IagIZIHsK8M5/i38W+wicWYyP2WZ12Es2yG/oRdYPpddnJskE
	 vAyMoJkdfMdOQl+7VRfLzKrnqNcNaBjpa2gLp55V7vgqoGBjG9gLXY3Tm99DeXIKVf
	 KbAg9N3ftFrz14SA5GoJuW/POgzdjkC6T7+sz1WfwmyfZ2L6BsMsdg4HnZ777dYdu5
	 w1pLB9vBGBPBkuHPLeWWjmYdTzpmfWZz+EFDcz6ZyTyUg6zXHinc3SHqJ3qwmGtmQQ
	 c6/MZ2CP8uWGItXYlde8s375+WmyZKzIyyzAqryTogoTPcW/Vf5KcsyNsE+jpqbb9p
	 TMruml7ywCpIA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1ubHm4-00FVUo-K7;
	Mon, 14 Jul 2025 12:55:12 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 0/5] KVM: arm64: Config driven dependencies for TCR2/SCTLR/MDCR
Date: Mon, 14 Jul 2025 12:54:58 +0100
Message-Id: <20250714115503.3334242-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_045515_347995_C6735E1C 
X-CRM114-Status: UNSURE (   7.85  )
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

Here's a very short (and hopefully not too controversial) series
converting a few more registers to the config-driven sanitisation
framework (this is mostly a leftover from the corresponding 6.16
monster series).

Patches on top of -rc3.

	M.

Marc Zyngier (5):
  arm64: sysreg: Add THE/ASID2 controls to TCR2_ELx
  KVM: arm64: Convert TCR2_EL2 to config-driven sanitisation
  KVM: arm64: Convert SCTLR_EL1 to config-driven sanitisation
  KVM: arm64: Convert MDCR_EL2 to config-driven sanitisation
  KVM: arm64: Tighten the definition of FEAT_PMUv3p9

 arch/arm64/kvm/config.c | 227 +++++++++++++++++++++++++++++++++++++++-
 arch/arm64/kvm/nested.c |  60 +----------
 arch/arm64/tools/sysreg |  13 ++-
 3 files changed, 238 insertions(+), 62 deletions(-)

-- 
2.39.2


