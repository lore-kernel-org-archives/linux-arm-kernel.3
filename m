Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D96CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 08:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LBaf3jAL4MQazDXFMl8SRV3CeLMWOqObvUD9n9ap5Fo=; b=QFs+c2Mdvu6hebg5p+/l6bu6Yf
	WCXG3Gnr9O5R9wZVuYFoVg1Ckrjydnoog4iW59SHfXFMyxla0B8nC10knOS7zgMzxeSUteDMrvSwh
	9IPn1OUX9X0T9rel4Ab1DGPDK2Opwp/i+myLEBNI1J8tncKnJzTRyokGcPTRQqZSjlKsUxRoCloM6
	MhvZcY5qJWAvcknjFbfWxFEA6NvfZiFjHLL2SWh/KUyW7flvdwaZcTMS00SymYKodELE5go9DD3DC
	gcz0Hn6piteNPSHzBHweVskLr0U/1jFTZbYMm8DDGUHXcH/nZwk0T0QWsBJygpDh4rhGUVVIAlIiP
	Ncn45y7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9g81-000000077bx-2ccU;
	Fri, 17 Oct 2025 08:48:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9g80-000000077ay-1otl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 08:48:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 86E0860B51;
	Fri, 17 Oct 2025 08:47:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73406C4CEF9;
	Fri, 17 Oct 2025 08:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760690879;
	bh=qb2lOaLu7mGcTG3Wb+zCcqzvBbzN9049OIe/kjq4vec=;
	h=From:To:Cc:Subject:Date:From;
	b=mjMj1K9cHqbpV+gjMypV+bRUcvPMZ9BKVZBEpKJ1P/8vLpHODrvqNDSm1WcVrXvkl
	 KroqecCGou1+PpVskK0zTVJqH4/x0xvmPGD2jvAz8uIzaV9pVz7a7WDw9YXH/g3C2Z
	 A6Zl5W7rxj+HwHov+lLmZ4xvhnijtNPt9V8WXxpFqCg8AdiORVpwGETZ1CPTcGhNJY
	 vUZMkfC3qB3ux7d/W1ZHmI16tmjAYTAR493dmjcmdpmEpml1mlGXI1jjs/hjq/vYm0
	 43V9mg3DlTidj5aTaEpfFmh0a7GIh64O1vwVmwS2y3ds5AWqg+WPlHWO3R8ILSM2Cf
	 MCXbtiL9ZjbVA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
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
Subject: [PATCH v3 0/5] of/irq: Misc msi-parent handling fixes/clean-ups
Date: Fri, 17 Oct 2025 10:47:47 +0200
Message-ID: <20251017084752.1590264-1-lpieralisi@kernel.org>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

v2 -> v3:
	- Added additional patch to export of_msi_xlate()
	- Merged Marc's ITS parent diff
	- Added trailers, fixed commit logs

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
 drivers/of/irq.c                         | 43 +++++++++--
 drivers/pci/controller/pcie-iproc.c      | 22 ++----
 3 files changed, 67 insertions(+), 89 deletions(-)

-- 
2.50.1


