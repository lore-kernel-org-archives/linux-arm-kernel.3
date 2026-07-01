Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F086EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 20:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NkxAlTQFGbaiuEekACY4kTmb7QT3eq8R9Ya17Km0roM=; b=QLMIO+DYJHFeOIZXIBH8s3VW3I
	2gd2EJaA1/ZeiLk5tMwqOl6vjhxYaTSXmls0yEvdhS0ImLu9N69eK2D3yIHlqho7hNfwGJ792nDk5
	M/CGhc32v5irkMDIOVvBn7nGwCPmXOzw6Fpc5iVMkt4YS8zc6dXuG68PPHFDiwSLC2a+J/AAv9RbA
	n3cpzeP3ptMK6qlDlWJ6Ast9iAn5jO1aBruBvDdTTXir41cSN+w9IFj7LeHlIp2bjRdqD24L2F/PN
	OwY8dW4wBC6Vbf1xFrQY39E4EKNq12Mncr2nygWbZCsf0tSE556mIMNRsw5ToQRuGyEG6EUj0MhFt
	FaWkFZHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1is-00000002yYD-0MoQ;
	Wed, 01 Jul 2026 20:39:54 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1io-00000002yWR-3cOs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 20:39:53 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4grBhf05h0z9v3b;
	Wed,  1 Jul 2026 22:39:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782938386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NkxAlTQFGbaiuEekACY4kTmb7QT3eq8R9Ya17Km0roM=;
	b=xExFM1qyH1faobKmzBOkzKHHYG0vK2RhwDumRw2uDRJf3HzJQbSso9yCfk3zJd/5MhdiWU
	oUQrlYAdGic7O8BNN6XEL5oYfejW7JDmoe3gyFZ7Mc0UEoqtULy1sLZC8c8E3j42Jubilf
	K93v6IhJOj6Bf2th6nlRktBnv2AOhRKfB3OCUtK2sPsoK7yEDJSowuFw5IJXftLTe1Kipr
	8DsIDxWvzCYUl5BlZQn9Tqlkk+FPNuNF/DVVt216wQ3R1JXZVu2CbeuBCCA7r1M4Rsh0B+
	gitTcEXCCrziwHwgUFF6n1Q8zu5X3zI+PLtOf+JqbslK2ofBj16rKZ3nz0zNvg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=jOfnk6I8;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782938384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NkxAlTQFGbaiuEekACY4kTmb7QT3eq8R9Ya17Km0roM=;
	b=jOfnk6I898Lgh1qcpjzFHAMB9Cqhlmfh/Ok1puVoyftl4dAB3IfpmUPEZ/v3NGPjyCYLyo
	C+32SYu9ziYYtAkLH/vSmqaT9ci9byJs8ua6ifHJ2HUqVgStR14O+JRsV8gtxGaoYr8eJ7
	Y499fjgo5PFw0i92B1dx0MAf+PgC8l/MikHx5cdWZ2UYkjhllVqjfNmoi+wrbwh1x994zy
	InEgMGQqv9q59TrZhmYMfYhH1pISkC7z2iIqETUKdE/V5Z83CE/RkTmMWb1Syt+xSxKwUr
	SQbKvq9CFiCbWEfHwF13981rqC2DL9VoVZOqDC9EoXnsA0dVgyjZYRCLKQOVgw==
To: linux-pci@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 0/5] PCI: rcar-gen4: irqchip/gic-v3: Handle GIC ITS
Date: Wed,  1 Jul 2026 22:37:43 +0200
Message-ID: <20260701203918.63189-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 8qus3hraqq8rxg6as1fu3rbgzyipbcr5
X-MBO-RS-ID: 35fafbef4d7d3e030fb
X-Rspamd-Queue-Id: 4grBhf05h0z9v3b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_133951_051866_2E955B90 
X-CRM114-Status: UNSURE (   9.08  )
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

Configure all R-Car Gen4 PCIe controller MSI registers fully, both in
case MSI are enabled and disabled.

Patch GIC ITS driver and add quirks for R-Car Gen4 GIC ITS, which is
configured to 32-bit address width for AXI or APB interface.

Switch R-Car V4H to use GIC ITS in its DT and describe the GIC ITS
implementation cacheable and shareable limitations.

Marek Vasut (5):
  PCI: dwc: Determine whether iMSI is used before calling .init
  PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not used
  irqchip/gic-v3: Refactor GIC600 limited to 32bit PA erratum handling
  irqchip/gic-v3: Add Renesas R-Car Gen4 erratum workaround
  arm64: dts: renesas: r8a779g0: Add GICv3 ITS and update PCIe nodes

 Documentation/arch/arm64/silicon-errata.rst   |   1 +
 arch/arm64/Kconfig                            |   9 ++
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi     |  31 +++--
 drivers/irqchip/irq-gic-v3-its.c              |  24 ++--
 .../pci/controller/dwc/pcie-designware-host.c |  10 +-
 drivers/pci/controller/dwc/pcie-rcar-gen4.c   | 118 +++++++++++++++++-
 6 files changed, 168 insertions(+), 25 deletions(-)

---
Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org

-- 
2.53.0


