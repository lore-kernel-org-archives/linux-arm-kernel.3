Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C181E9B250
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 10:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hFegG1SKfblu7TYgB2g2JejJqqd29kwFF2JVZmC5Njg=; b=Qcu9xrme5Nv3S2mHY7deCc3zuk
	dC09bvd2LBlbFn+ZmgGfxykhmpJe8ENJxxJGsNtFCt065qUt06U7dW6jj7R6utwgORZ0RnrFqbJUp
	h0d9mhuwFyxYRG3xIkSWGvBUGL6JP7thPtQDrf2/K8hZhBneYTOquleE3QIbkrorSImWr43qfxpGP
	8f/aZ5wtewnd1chPNvoSpyh/Pq+GKYZy0wMFGoI035VJQASBUoiNN2E6fD1ubgb37q6t5sXrq3V7f
	VcVEWDD4YfAyb8L2Q8SbBIT6nuIVK6y+/JzDISN8EsTp/mJ9es36cPE7Z5mPoXr4y/SSbbTlzfIE2
	w1ksjAPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vupMU-00000001pGK-14Po;
	Tue, 24 Feb 2026 10:09:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vupMT-00000001pEw-0D5f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 10:09:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 26A7061335;
	Tue, 24 Feb 2026 10:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD161C2BC9E;
	Tue, 24 Feb 2026 10:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771927787;
	bh=YOp56FnQQmNzzQ/Xwi1OTm36PaNCk+5LjoAZScSw1a4=;
	h=From:To:Cc:Subject:Date:From;
	b=u8kbHX3CefvKlWOy/GjXw52JU7MYcfHPOQMj/Fbke9kxopZWST5/f7zklaWHqgigD
	 pKBg5JY9/7jT9w+4XkVUIY6fVcesu+mXZ4P66kmdQ95j21iqZy3PnNPIAyN1fCd4cx
	 mrVVok+ETW3FyxgOpGdZA+DsqScBZ+W96CAgdf2T37tnjNa8MiDk21QPQxbJiXhpB0
	 N87jwGiQw0x+PPWQjItYYj9ywF9LHFf/7CKNeOGiz2bxnYQsYcqmHa6MNhNkeT5YA8
	 jFTxdLyVklfMN2AXakm3U7D9uQuOlzgZs6Sd+xd+0N8YfDRA15Tik6gN4+UaMV63MY
	 W6jUzbgKnLDfw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vupMP-0000000DIa5-2exa;
	Tue, 24 Feb 2026 10:09:45 +0000
From: Marc Zyngier <maz@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Thomas Gleixner <tglx@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/6] fsl-mc: Move over to device MSI infrastructure
Date: Tue, 24 Feb 2026 10:09:30 +0000
Message-ID: <20260224100936.3752303-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: ioana.ciornei@nxp.com, tglx@kernel.org, chleroy@kernel.org, sascha.bischoff@arm.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
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

This is the second drop of this cleanup series for the fsl-mc MSI
infrastructure, initially posted at [1].

* From v1 [1]:

  - Drop the now unused DOMAIN_BUS_FSL_MC_MSI bus token

  - Tidy-up fsl_mc_write_msi_msg() while removing the legacy helper

  - Fix include ordering in irq-gic-its-msi-parent.c

  - Various commit message cleanups

  - Collected tags from Ioana and Sascha, with thanks

  - Rebased on top of v7.0.rc1

[1] https://lore.kernel.org/r/20260218135203.2267907-1-maz@kernel.org

Marc Zyngier (6):
  fsl-mc: Remove MSI domain propagation to sub-devices
  fsl-mc: Add minimal infrastructure to use platform MSI
  irqchip/gic-v3-its: Add fsl_mc device plumbing to the msi-parent
    handling
  fsl-mc: Switch over to per-device platform MSI
  fsl-mc: Remove legacy MSI implementation
  platform-msi: Remove stale comment

 drivers/base/platform-msi.c                 |   4 -
 drivers/bus/fsl-mc/dprc-driver.c            |  14 +-
 drivers/bus/fsl-mc/fsl-mc-bus.c             |   4 +-
 drivers/bus/fsl-mc/fsl-mc-msi.c             | 166 +++----------------
 drivers/bus/fsl-mc/fsl-mc-private.h         |   2 +-
 drivers/irqchip/Kconfig                     |   6 -
 drivers/irqchip/Makefile                    |   1 -
 drivers/irqchip/irq-gic-its-msi-parent.c    |   7 +-
 drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c | 168 --------------------
 include/linux/fsl/mc.h                      |   6 +-
 include/linux/irqdomain_defs.h              |   1 -
 11 files changed, 39 insertions(+), 340 deletions(-)
 delete mode 100644 drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c

-- 
2.47.3


