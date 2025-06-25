Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E815C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 14:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=unCp+BroZsl+DhAtxEi0yTqTczFnfy+h9fyAO8rav0c=; b=tWLFjHcJXCc4eiqDcP+uUDyS+u
	fXQoPMiroh3sHMEsoTPSWDSNXVdVKmdVkd1Rtu48r1znfggO5UxaO4SXIyb0EvkLIT28CzxS7TCPQ
	YI+jDa9n3surCnjK/az7Bcz2jn6KpKp10HZEWQcMWAExG6mDf3wAwRCgAM10/lZrnFftRhfQqxEte
	YHnCbgdygxu6sA3I7QUZfwEnSbMBlmV68HjXTvKLBGM+Kv2+zDfV7AMJ8tWoBbU8WHu/zQtviJ6E7
	hyr8kfRcG6hiZego3kPmiycryZU8VNndZSjoCAFn9ddfYR/7PmgaylANY9bwSou0T3cjswvYALbY6
	T+b2h2fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uURWN-000000092J8-0pga;
	Wed, 25 Jun 2025 14:54:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUO8s-00000008Rm5-0pQO;
	Wed, 25 Jun 2025 11:18:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 53CDEA522F3;
	Wed, 25 Jun 2025 11:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBDF2C4CEEA;
	Wed, 25 Jun 2025 11:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750850293;
	bh=f5Hh8EniuvqNTWMZOUFvKsPoX2Gz9kYbg420zS1PNeY=;
	h=From:To:Cc:Subject:Date:From;
	b=o2DCP5nU+45W7Fu/cDrRR1gxj+M/xIsd+BEBTrazCwp+72jGkeQnXW5oP1mLK9sAI
	 mbrDghA17d0XrcvECa7j6ga4ZMtyEXLNYCarO/ew8u4yRx7NXg3GnDVj7pTdYIRW4L
	 Jq5MC0klMMsPKIPR0mOUpBxSof2du6JxMgJhoosNZCUBJqYAnRUPSbQGz39B91D+iC
	 abiwjgPlVXP7G1az1n25LcjAVMGPIWiFGiMXh1v2UQuoas5IHf9AF+o6PQYpqp2ZJS
	 NSlYVX/h14CiGKu8k0QeZqc+H/ICvboUUXEjDCeDnlrCLvelhG3KF9yC32oD06A4Nz
	 F0HHNeEkNboLA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uUO8o-009qM2-LP;
	Wed, 25 Jun 2025 12:18:10 +0100
From: Marc Zyngier <maz@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] PCI: host-generic: Fix driver_data overwriting bugs
Date: Wed, 25 Jun 2025 12:18:03 +0100
Message-Id: <20250625111806.4153773-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: bhelgaas@google.com, alyssa@rosenzweig.io, robh@kernel.org, mani@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org, j@jannau.net, geert+renesas@glider.be, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_041814_303538_1703A8C0 
X-CRM114-Status: GOOD (  13.52  )
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

Geert reports that some drivers do rely on the device driver_data
field containing a pointer to the bridge structure at the point of
initialising the root port, while this has been recently changed to
contain some other data for the benefit of the Apple PCIe driver.

This small series builds on top of Geert previously posted (and
included as a prefix for reference) fix for the Microchip driver,
which breaks the Apple driver. This is basically swapping a regression
for another, which isn't a massive deal at this stage, as the
follow-up patch fixes things for the Apple driver by adding extra
tracking.

Finally, we can revert a one-liner that glued the whole thing
together, and that isn't needed anymore.

All of this is candidate for 6.16, as we have regressed the Microchip
driver in -rc1, and that fixing it breaks the Apple driver.

Geert Uytterhoeven (1):
  PCI: host-generic: Set driver_data before calling gen_pci_init()

Marc Zyngier (2):
  PCI: apple: Add tracking of probed root ports
  Revert "PCI: ecam: Allow cfg->priv to be pre-populated from the root
    port device"

 drivers/pci/controller/pci-host-common.c |  4 +-
 drivers/pci/controller/pcie-apple.c      | 53 ++++++++++++++++++++++--
 drivers/pci/ecam.c                       |  2 -
 3 files changed, 51 insertions(+), 8 deletions(-)

-- 
2.39.2


