Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8A8C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 16:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I5Z2GdvrvX4Tqg2jxDkV/a0jkqcAFDJUofvgSxQ87/I=; b=UXiAlT5Ze0eZYap+tpfdHvMw9q
	tDIS1UbWir49h+cWEdtr/Ev8idBKpdiCpIYK/Dw9ERmUiwlM1TA43qBP9hW+kFaq0qpZmqvLxR2CM
	374PU2ingtnVL8nAhFIgejgyCCIcg5XrJkBkvC/TYwoA1DNe3Qy8jsWtPZUjpjX5nKM2bYPT9c56A
	+EbmzPEfXeaQeiz6ipnN/Xh5FKeJZX1K9E3TdKaI5T9OA0OfuK0UHhtce45ISqBNdxmheirwRAJTy
	tq8ze5IOgULrSaZke+zcxp4fue8yd4GoLTkSCYloXvzmVIogSUuTftsA7Kl8O99Ufl+XL1OLbjMyi
	GR5lcRnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEsmB-0000000CzGb-275V;
	Tue, 13 May 2025 16:46:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEsXp-0000000Cvuk-0Dae
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 16:31:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 60845A4D2D8;
	Tue, 13 May 2025 16:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0040DC4CEE9;
	Tue, 13 May 2025 16:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747153912;
	bh=66WBrZsbl2quOzJoVWNQg2OqyNcya0h5+RaekBq6n4U=;
	h=From:To:Cc:Subject:Date:From;
	b=dalVYDVczDf1XKT+irltMhMfburNDL6TddYufjf502HYTz7lpUxhKGCf+8RxBennc
	 ga7dNhsUJBPr6yUEsRiWw2GR2wtN+q+pucpIlHfMxOqsEXzd7rJf9+6woDIlH0oogc
	 PByi85xQZkKoh2XhqToehNYYLJs/neTTy6kATuqKuNWOvXk8Q2isSSjIYYyvi0R6Bt
	 adNX0gshaaw79Crbg96Z0YR4XiRRldSwGFV/nJENciOn/I7qLtgVUkfjShOa0V8S51
	 kOpcOt4zpx1Wc1wTX0a3Epm6LXdx1seCJAZah/0ztmxKEBLDLyvGS5VVybfytzw340
	 p3wAWJCrmqyow==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uEsXl-00EaLc-Mm;
	Tue, 13 May 2025 17:31:49 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>
Subject: [PATCH v2 0/5] genirq/msi: Fix device MSI prepare/alloc sequencing
Date: Tue, 13 May 2025 17:31:39 +0100
Message-Id: <20250513163144.2215824-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tglx@linutronix.de, lpieralisi@kernel.org, sascha.bischoff@arm.com, timothy.hayes@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_093153_226542_8796FA2D 
X-CRM114-Status: GOOD (  16.57  )
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

While reviewing (and debugging) the GICv5 code, it became obvious that there
was something pretty fishy about the way MSI allocation was taking place in
respect to the msi_prepare() callback.

There is a strong (though not 100% explicit) requirement that the
.msi_prepare() callback must take place exactly once during the lifetime of
an MSI domain, before any MSI is allocated. Sadly, that's not how the core
code behaves, leading to all sorts of "interesting" issues with MBIGEN or
the GICv5 IWB.

The fix is both simple and surprisingly convoluted. The first course of
action would be to hoist the "prepare" action before we allocate any MSI,
adding new tracking for the msi_alloc_info_t structure.

But this unveils another issue that the core code has been papering over,
which is that there is no pendant to the .msi_prepare() callback that would
be called on irqdomain destruction, and that at least the ITS code has been
using some crap heuristics to work around it.

So this needs to be addressed first, and that's the point of the first two
patches, introducing and implementing the .msi_teardown() callback.  The
.msi_prepare() call is then moved is the specific case of device-MSI, and
the .msi_teardown() callback wired up.

The last patch remove a gross hack in the ITS msi-parent code, which
was papering over the broken use of the "prepare" callback.

This has been tested on a GICv4 system with MBIGEN, patches on top of
tip/irq/msi (a1d8a83093675).

* From v1 [1]:

  - Fixed blunder in the ITS .msi_teardown()

  - Fixed spelling, grammar, and other use of unclear terms

  - Fixed line splitting, disgraceful underscores

  - Split the calling of .msi_teardown() into its own patch

  - Rebased on top of tip/irq/msi

[1] https://lore.kernel.org/r/20250511163520.1307654-1-maz@kernel.org

Marc Zyngier (5):
  genirq/msi: Add .msi_teardown() callback as the reverse of
    .msi_prepare()
  irqchip/gic-v3-its: Implement .msi_teardown() callback
  genirq/msi: Move prepare() call to per-device allocation
  genirq/msi: Engage the .msi_teardown() callback on domain removal
  irqchip/gic-v3-its: Use allocation size from the prepare call

 drivers/irqchip/irq-gic-v3-its-msi-parent.c | 29 +++++--------
 drivers/irqchip/irq-gic-v3-its.c            | 46 +++++++++++----------
 include/linux/msi.h                         | 12 +++++-
 kernel/irq/msi.c                            | 45 ++++++++++++++++++--
 4 files changed, 86 insertions(+), 46 deletions(-)

-- 
2.39.2


