Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4EFC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 16:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dAx7Yc0kyneAxPsuf/LovkV8YSmMcdPkMGltRJXYKDY=; b=3YLpJXOX0PJ3hc3qhFL5f4RlSf
	cqBeWOfpt4emxE9ojMOJzapTXtxuYzA7txC2TwHAg2Fuk1wAm6NWO6Rr1BBtjcXvrw/KjZADIRZUP
	l7ffjMFs4c1HamNK9/bGn/2HyQOnMpdtXu8DBnTvMNPztKps7S6ah8vlPM/3dh8gJOBx9acDWnbxA
	SLCIyqOMaoV123uroDajZHjU5GXg/LXTgLIfnJetQYRXjTpVME07pd6kMhGwNLz3Y7wo9OQ1WZuoK
	2jP8Uav0rxQIq58dhnWJLjXNN+icY9ySQxIuOjOZfanZRKufsoNYkCiqul31uazADhCHS+ElqU2rh
	ux92XW8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcoRE-00000005Jyg-3sd9;
	Tue, 28 Jan 2025 16:27:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcoHN-00000005IKG-0OLv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 16:17:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 71517A40F8E;
	Tue, 28 Jan 2025 16:15:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 021FBC4CED3;
	Tue, 28 Jan 2025 16:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738081052;
	bh=p+DT68ITXpodlOtFqv3LPnEY38sb9Ym3VdrfO9j9S04=;
	h=From:To:Cc:Subject:Date:From;
	b=mdFGHd3LHptAWvmRPk4U1ZKheka1e6hFliuVgd0YPim82dfltJo1AzkKu0icDSsyL
	 s1wyfCHBlOtJKJ5oP6GdYU9/PBanz00uZ+esXrp6Sr5IsWTTIvNQ1ZW+lYQG4jReLh
	 v2NC/Glqj6+qihTQClFcUZZWquAeGTDaCy5MqkQmAatyuAJQJPRdmSW/EYVAq3OOgt
	 rBGLPXg7WFiTgpXJhSfzmV8jqOnQ40WsSawJyzJFdH1JzZVEk4OgScgiYA/IGOXHJC
	 VtWhj8BwVAlyCm8yUdF7sVfIxF03UhdezJ04f4ztafIe7T9VKSblWyWQ7ozm3ftPcl
	 0GXwk59DLyjBw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tcoHJ-00G6bi-Kg;
	Tue, 28 Jan 2025 16:17:29 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Dmytro Terletskyi <Dmytro_Terletskyi@epam.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 0/3] KVM/arm64: timer fixes for 6.14
Date: Tue, 28 Jan 2025 16:17:18 +0000
Message-Id: <20250128161721.3279927-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, r09922117@csie.ntu.edu.tw, Volodymyr_Babchuk@epam.com, Dmytro_Terletskyi@epam.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_081733_190975_F236EC00 
X-CRM114-Status: UNSURE (   9.90  )
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

It's been recently pointed out that the NV timer code that is
(hopefully) on its way upstream is marginally sub-optimal (read:
terminally broken). This short series attempts to fix things:

- Correctly arm a background timer in all situations

- Avoid corrupting the EL2 state by shoving the EL1 state into it, and
  simplify the handling of emulated timers

- Make the NV init of the timers less awkward and expensive

Thanks to Volodymyr Babchuk and Wei-Lin Chang for their help.

Patches on top of kvmarm-6.14, and merged back on top of my
kvm-arm64/nv-next branch.

Marc Zyngier (3):
  KVM: arm64: timer: Always evaluate the need for a soft timer
  KVM: arm64: timer: Correctly handle EL1 timer emulation when !FEAT_ECV
  KVM: arm64: timer: Consolidate NV configuration of virtual timers

 arch/arm64/kvm/arch_timer.c  | 82 ++++++++++++++----------------------
 arch/arm64/kvm/arm.c         |  3 ++
 include/kvm/arm_arch_timer.h |  1 +
 3 files changed, 36 insertions(+), 50 deletions(-)

-- 
2.39.2


