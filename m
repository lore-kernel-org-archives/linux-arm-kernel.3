Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4BCBCCD1AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 12:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dkVD956SEjEfEFuoFuxVxcQAHkS+jr22/+ae4SC1ym4=; b=uWozULwIjx3WAzpSJS1VfvZTav
	xiIcJgIZ7i6s6JqhNp4KZfcbJWxq2XbBd462Yru/ncDYChzTN2SseF0PiB1f1uSDZPK1OTnmgPUmA
	3/cUpbT01qLPe/vlK76AjEvQNo7wYa5jEPRr6Vo83eMqZu38ASgmtXxKQ28RMAhcpi9pIh+3/BgkS
	W1vgfXbmp2VHI4bT6HwzRdUboL6mLshCQYIlKiRDLEceJFeSXZ6Pr3bo7RB7wGk6SU4kzdqVDNVne
	KZMa0L7chyEmnIqU0GxDvlceNszOLlyEZNEMk6pta1TNqN7tJYoXga/lT0hlfUor8YUIJUSoiiteH
	j2N8+KtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBfu-0000000H03c-1zTl;
	Tue, 21 Oct 2025 12:41:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBfr-0000000H025-1V8I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 12:41:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8248540C40;
	Tue, 21 Oct 2025 12:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE154C4CEF1;
	Tue, 21 Oct 2025 12:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761050470;
	bh=uAhf200dsvIo89TJRuvH8/3+8lhJkw1+gk7dnaDCeJg=;
	h=From:To:Cc:Subject:Date:From;
	b=Gnrk9jKgRAeBg5owfO6OldAN0DipPYh+Ou55m/NtzHfLkYGr38AaBczwOHZHpfMQn
	 jHuNoA8pxwtmnzpFUmugivMeFY1V40OglVJ9OQ43DcG8infqwxJrM9hFGnceAdSdaI
	 Lby0VFOMBeUZO7yVYYq/zsQCmeYNXMZFgjNQNTLWMbDoGSXlEgfUV4x5uS+NNTZ0Pm
	 IMWO8UEgEIix1brXfb+uRtlj+nTmoj3gBO2MzUW3u0+RXvM4vd+96pKMbUBfOnMNzx
	 mTLos9q3rK0o1dF4I3FoeKFEdPDN2hPubu9mU4hVnYfeKafaUy0pZOSN7sRZGF7kGF
	 4lG3b1W9CHyhw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Scott Branden <sbranden@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Rob Herring <robh@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Frank Li <Frank.Li@nxp.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v4 0/5] of/irq: Misc msi-parent handling fixes/clean-ups
Date: Tue, 21 Oct 2025 14:40:58 +0200
Message-ID: <20251021124103.198419-1-lpieralisi@kernel.org>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_054111_442430_22C90A6C 
X-CRM114-Status: GOOD (  11.24  )
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

This is series is a follow up to [1] - with additional patches that are
addressing Rob's feedback (pcie-layerscape-gen4 was removed from the
kernel, Yay !) and other bits and bobs I noticed while staring at the code.

Patch (1) is a fix and technically we would like to get it in v6.18 please.

Patch (4) is compile-tested only, I can not run it on HW, I do not have it,
Scott, Ray please test it if you can.

v3 -> v4:
	- Addressed Rob's review
	- Added trailers
	- Rebased against v6.18-rc2

v2 -> v3:
	- Added additional patch to export of_msi_xlate()
	- Addressed review feedback

v3: https://lore.kernel.org/lkml/20251017084752.1590264-1-lpieralisi@kernel.org/
v2: https://lore.kernel.org/lkml/20251014095845.1310624-1-lpieralisi@kernel.org/
v1: https://lore.kernel.org/lkml/20250916091858.257868-1-lpieralisi@kernel.org/

[1] https://lore.kernel.org/lkml/20250916091858.257868-1-lpieralisi@kernel.org/

Cc: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Scott Branden <sbranden@broadcom.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Ray Jui <rjui@broadcom.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>

Lorenzo Pieralisi (5):
  of/irq: Add msi-parent check to of_msi_xlate()
  of/irq: Fix OF node refcount in of_msi_get_domain()
  of/irq: Export of_msi_xlate() for module usage
  PCI: iproc: Implement MSI controller node detection with
    of_msi_xlate()
  irqchip/gic-its: Rework platform MSI deviceID detection

 drivers/irqchip/irq-gic-its-msi-parent.c | 91 ++++++------------------
 drivers/of/irq.c                         | 44 ++++++++++--
 drivers/pci/controller/pcie-iproc.c      | 22 ++----
 3 files changed, 68 insertions(+), 89 deletions(-)

-- 
2.50.1


