Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A33C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 16:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RnOmp9vqB0RVVDdSdYPGFCoZOJTwVv6/eQpaDqVmnwY=; b=2rFZ5ac009cExALrWzqDqZMgFM
	N9dgpSijN3WcZ5uYRxFxmOsjcxg0TCJgbxEp/bavlWiR9U/DhB9agJPmKeZ6s/9U9VkDrq5knlNzm
	B+RfZm31FazuKh3UErqBu9jxU0F0/Cvj39EHezvzGwswayxg6uIMEGSU6pWK5jXaBXmJvaZHzwRWh
	OdC1ggcBNTHAeqggFaHdgm/5EYZW/lq638t6a2qH0+6rbdYCsrCs/v83o4bEYBMKUEzR9f6pRYpQM
	gPrz/om0uOdGtpFWPj2lUbXws9150f0jFVoAPoW7GbWXxsgyzUKhA+y37CeCC6NMRUxjS3Q5mLTRa
	DPWnXk0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE9hc-00000007Wn1-2Lut;
	Sun, 11 May 2025 16:39:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE9eD-00000007WIA-1sGr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 May 2025 16:35:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B25160EDF;
	Sun, 11 May 2025 16:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFA92C4CEE4;
	Sun, 11 May 2025 16:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746981326;
	bh=Ly0ycxk5mViKXGJnV6ik8fNXIyzCE67TE4MNRvRYDU0=;
	h=From:To:Cc:Subject:Date:From;
	b=d1W9G37zJPqqF4f/mBIHCXsvdjTkI8imS4jliuc8YuPQRmtNxTQw81Qxqx6/ZCgu2
	 TIl+MjJE/s6o10aNnCaGefD8tGR13H6Zt78ZJHNqQbLUfkpC/AKLxNLytcAqVm43dk
	 Arb7dAQhQ6V8ggMJaTl4LEN8kSMQ4Whr4NRat7Xgg0SzI/Qhby4CxgdEIQTZ6x+D9A
	 UdaIQ64NWs8M4ogTKUgbuIP1XgSbNjXfNpJluJD3/qIQFjo4KWiSGdexP8ex3zwHNg
	 jVgxhatzD0m9F5KoztUc5ZQVkEpFSe/DSfML5gYjHFWzqsOIO3kLj5Nm4vm1aLkJWA
	 jyOFENw/AfJpQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uE9e8-00Dt22-En;
	Sun, 11 May 2025 17:35:24 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>
Subject: [PATCH 0/4] genirq/msi: Fix device MSI prepare/alloc sequencing
Date: Sun, 11 May 2025 17:35:16 +0100
Message-Id: <20250511163520.1307654-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tglx@linutronix.de, lpieralisi@kernel.org, sascha.bischoff@arm.com, timothy.hayes@arm.com
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

While reviewing (and debugging) the GICv5 code, it became obvious that
there was something pretty fishy about the way MSI allocation was
taking place in respect to the msi_prepare() callback.

There is a strong (though not 100% explicit) requirement that the
.msi_prepare() callback must take place exactly once during the lifetime
of an MSI domain, before any MSI is allocated. Sadly, that's not how the
core code behaves, leading to all sorts of odd bad issues with MBIGEN or
the GICv5 IWB.

The fix is both simple and surprisingly convoluted. The first course
of action would be to hoist the "prepare" action before we allocate
any MSI, adding new tracking for the msi_alloc_info_t structure.

But this unveils another issue that the core code has been papering
over, which is that there is no pendant to the .msi_prepare() callback
that would be called on irqdomain destruction, and that at least the
ITS code has been using some crap heuristics to work around it.

So this needs to be addressed first, and that's the point of the first
two patches, introducing and implementing the .msi_teardown() callback.

The last patch remove a gross hack in the ITS msi-parent code, which
was papering over the broken use of the "prepare" callback.

This has been tested on a GICv4 system with MBIGEN, patches on top of
6.15-rc5.

Marc Zyngier (4):
  genirq/msi: Add .msi_teardown() callback as the reverse of
    .msi_prepare()
  irqchip/gic-v3-its: Implement .msi_teardown() callback
  genirq/msi: Move prepare() call to per-device allocation
  irqchip/gic-v3-its: Use allocation size from the prepare call

 drivers/irqchip/irq-gic-v3-its-msi-parent.c | 29 ++++-------
 drivers/irqchip/irq-gic-v3-its.c            | 56 +++++++++++++--------
 include/linux/msi.h                         | 12 ++++-
 kernel/irq/msi.c                            | 51 +++++++++++++++++--
 4 files changed, 101 insertions(+), 47 deletions(-)

-- 
2.39.2


