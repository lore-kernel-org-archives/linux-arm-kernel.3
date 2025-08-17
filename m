Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E008CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Aug 2025 12:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2TRwKRfP8dUjVzXuwyTJDz9oMpzc7MZ8G20fmyEAcOg=; b=2dVfVI6yJB3OGYm80jSd1J8PqH
	pQNqniiS/MwIxWIO388WeaLS+GqNwpyx867ApdQCUt5vM327KIooE44Sj6hz9DJlgq5Frk7F0KABR
	UEQeQBtBEhhJbt4GoW1etLCTP1txVHhNvGUjKJ4qbbT3ZGvugDkFR1TG2kxNXx/amDWCHT7FjNJUc
	ZNlpZgD6o+vbSqULi/PBaiyK/hC3uVA9xMwf+dd6/8u/tV01XIx9smLmiQk/82F6NOVHZFPhOdneQ
	WYv2VLd6l2TZjz3atWYhMol36rpH2SSHtsIkSPyPY4qhbwoNDVB5lYiBOQ8SKaXaKc9jIeNe8BJKP
	b/PbwcqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uncRS-00000005eOO-1L7h;
	Sun, 17 Aug 2025 12:24:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uncMK-00000005e3T-1RU9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Aug 2025 12:19:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C1709601E7;
	Sun, 17 Aug 2025 12:19:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78009C4CEEB;
	Sun, 17 Aug 2025 12:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755433175;
	bh=dASPEeUs8fF0JPg3CriKPlz4cPW/fuQlXdkrCNipZ94=;
	h=From:To:Cc:Subject:Date:From;
	b=H9+H61TmbPT1dYHWQNGeArlMFwF2rWVIbw/Aj6xGhtxf4UIb6GHqCPt3HYiSoFz/I
	 OZnBgzdHRATym/EZ9I5zW/sy7gxU/wSrwFujauVxbDhRfadOJOYH18eP5qkQop2T4E
	 1BS2UG4fWrx+G3m7rcH3u6713WUYywLikKFFTNryx+qXX4iRzNtkHkSJkA0XAaL8OV
	 zyFtIR/DrldGnWUJzwWHyNKzTLNlZvPuthB3QW6nGALBa2mm+XIFh3QrOt/jXiTAuz
	 k9K9hHkstqKOGK+IGutqJYCrYzy4AgXYC8NcwPQ8O/sRgcZ+eXPps3K3ifY+5/8oY2
	 uTo/D7bT3/X0Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uncME-008L0z-9v;
	Sun, 17 Aug 2025 13:19:30 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 0/4] KVM: arm64: Live system register access fixes
Date: Sun, 17 Aug 2025 13:19:22 +0100
Message-Id: <20250817121926.217900-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, volodymyr_babchuk@epam.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
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

This series stems from [1], which outlined some rather bad bugs in the
way we handle live system registers with VHE. As the discussion
progressed, I decided to tighten things a bit, and found a couple more
bugs in the process.

I appreciate this is a bit big for a -rc, but at the same time some of
the issues are rather annoying, and I'd like to make sure we address
these for good.

[1] https://lore.kernel.org/all/20250809144811.2314038-3-maz@kernel.org/

Marc Zyngier (4):
  KVM: arm64: Check for SYSREGS_ON_CPU before accessing the 32bit state
  KVM: arm64: Simplify sysreg access on exception delivery
  KVM: arm64: Fix vcpu_{read,write}_sys_reg() accessors
  KVM: arm64: Remove __vcpu_{read,write}_sys_reg_{from,to}_cpu()

 arch/arm64/include/asm/kvm_host.h | 111 +---------
 arch/arm64/kvm/hyp/exception.c    |  20 +-
 arch/arm64/kvm/sys_regs.c         | 344 ++++++++++++++++++++----------
 3 files changed, 243 insertions(+), 232 deletions(-)

-- 
2.39.2


