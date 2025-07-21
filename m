Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44947C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 11:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bp6iCOC7ttAH6/0lcRrn/tblIV2SweUjdxbaARH00tg=; b=xsCLdDE6+l9vNIg62grBFgmrLO
	EWrUiWqUMyWY02WSbllJ9zVBd1FBRSjDvgoUITfa73jeITvAO0Dr7RXoIJ809XMl3GrWrjbCystAU
	B0rf9iZ5SYMrOArHB+gf2z4bdfA6heEAVvONRyhzEHp+ufRPdKovzY5enjQ3V6uY2YVr9LDmhblrH
	1881WyOg2yfDntoHw1L6Gt1DzCyKbyMVd931dqxEIJvI9LwHBxbBY2IqnrXhH/m/RWIzK7RB1pX0s
	HbGEez6JCFyW3qAIl/+VIplt5JplUvdOUos1liS0KS0IdkAUEpdaLZBsXyfAqFwwC5gJ6+rx0Go7D
	IVjcO1Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udorm-0000000H7k1-2vUE;
	Mon, 21 Jul 2025 11:39:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udncu-0000000Gwl2-2HjM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 10:20:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D60F85C420D;
	Mon, 21 Jul 2025 10:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D904C4CEED;
	Mon, 21 Jul 2025 10:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753093207;
	bh=uZLZ0nK2M/lar7zqTQyEJsNemSM7m128SJkqJMrBgy8=;
	h=From:To:Cc:Subject:Date:From;
	b=fI9Pu2MTK5r7Nsu7I0bujcKmQTkvEBebgLAfduxnAcr24BQHeJLlFU0bszlC2rNMh
	 tcPJ6rDL60y67McSdZZK1jRVmSdoN0NZDC2EsYFFUOhciVKb29QTkxB0FKOnBd8QAz
	 lwW6CMuSejyhC0vwdV3v2iRoJGiSWrkvbLQprQH2fmRVfyYkGUqkuhJPDzlmDpTd3c
	 dHqGz4/9+DF+T96Ji30qCqZLZ4CrjQscTA+E3Mfvk+34tDYKhXSwfiR5q/exMGzuwN
	 1ONtpLqAAoNo0te6Em7NDB639HAhys9lqfTreiM4APeAN03P7YwBv/pPk1/2vaBMis
	 QVVF9rLo1X/pQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1udncr-00HZDF-D0;
	Mon, 21 Jul 2025 11:20:05 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH 0/7] KVM: arm64: FEAT_RASv1p1 support and RAS selection
Date: Mon, 21 Jul 2025 11:19:48 +0100
Message-Id: <20250721101955.535159-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_032008_647027_4D235D7D 
X-CRM114-Status: GOOD (  10.89  )
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

As I was debugging some RAS-related issues[1], I realised that:

- My test box is implementing RASv1p1

- We unconditionally advertise it to guests

- Issuing RASv1p1 accesses doesn't end very well

- [...]

- Profit?

The overall goal of this is to allow the RAS support to be downgraded
to not much, as we're not implementing anything interesting yet, while
still offering the appearance of architecture compliance up to RASv1p1
(everything is RAZ/WI). Along the way, we plug the most glaring holes
(HCR_EL2 bits propagated at the wrong spot, HCR_EL2.FIEN not being
filtered out).

Unusually, this is on top of the DoubleFault2 series, as this is where
the problems started.

[1] https://lore.kernel.org/r/87tt37ulvf.wl-maz@kernel.org

Marc Zyngier (7):
  arm64: Add capability denoting FEAT_RASv1p1
  KVM: arm64: Filter out HCR_EL2 bits when running in hypervisor context
  KVM: arm64: Make RAS registers UNDEF when RAS isn't advertised
  KVM: arm64: Handle RASv1p1 registers
  KVM: arm64: Ignore HCR_EL2.FIEN set by L1 guest's EL2
  KVM: arm64: Expose FEAT_RASv1p1 in a canonical manner
  KVM: arm64: Make ID_AA64PFR0_EL1.RAS writable

 arch/arm64/kernel/cpufeature.c  | 24 ++++++++++++++
 arch/arm64/kvm/hyp/vhe/switch.c | 19 +++++++++--
 arch/arm64/kvm/sys_regs.c       | 56 +++++++++++++++++++++++++++------
 arch/arm64/tools/cpucaps        |  1 +
 4 files changed, 88 insertions(+), 12 deletions(-)

-- 
2.39.2


