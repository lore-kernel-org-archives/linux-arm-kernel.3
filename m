Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB03C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 20:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NkxAlTQFGbaiuEekACY4kTmb7QT3eq8R9Ya17Km0roM=; b=XKZleKNxw9dg/eb7+eyXkoOWv2
	mWXFkVYzzmV/SG0xvS0jdXOXDhcw8kID0MuQyMCGGjf0hvfwIMNfTR6NQh/IuBXkBab7lkT9Y9O72
	B2odK7w+0i9wLc9xIk9Ehrc1MHrXIGjQd30KWmsC4SmfPJBzcY4N8ub/W1XY9ercwK4d4GwJ2POcG
	BwFwKscbFm+U91KjVBbomxvFYphGOWDPZTUGbafvf3lwABCgcTk2VBdavG21yZXBVpEFGk44v5gSJ
	ApxDO3X2N41c76/nGLLl4HkTNE7HtNCgF+nbvycOjdk2y8+HxCLHtrBGo4FrXjIdm1ZZe72TC9mnj
	QJkdIZLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whCYQ-0000000FsJY-2AiB;
	Tue, 07 Jul 2026 20:38:06 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whCYO-0000000FsIx-2wSO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 20:38:06 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gvtMq4YlWzKnYq;
	Tue, 07 Jul 2026 22:37:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783456679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NkxAlTQFGbaiuEekACY4kTmb7QT3eq8R9Ya17Km0roM=;
	b=qG71dQnDHH5TbSzfaJY2ona/Zb/tcdBlDpng/N0QlID4fOXL5xmMnK5F9f2JuF4e5oP5pe
	TPcfE75Dvf2+4gjiZp4hPYZAWRQOjh88H+uho6Yy4RWLAQAz1VcCbiz2M72Fh3ulQJnyDX
	1Km6wm68zp6THQZUjy2gSHFy1ixoUjrerDGF9lGRTKhslmXRToya2dWnY0zuCfd9Z7uUrN
	1ytkNDWC9YS5M2c6BpfvkGq22zFE+54bu1bVYdA7iQlMC4Am4x7J/GRBavyV3fFvGWmsoH
	NSVsnRKca3e4IaOlLcV42xwz8w0deYIliR2HQhJ2XDCKsp679HdB0JDJPM/RDw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=W8BbqTMc;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783456677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NkxAlTQFGbaiuEekACY4kTmb7QT3eq8R9Ya17Km0roM=;
	b=W8BbqTMcowFTauoj2C93jHgxjUCLS+vheaflWcub1dTsog1pIptOUUE1eQNpWlQQ9wa9zv
	Cvsb0wGqtDb8Lz/IOtZ7WvOYoW2tQimEw2SKZIu2xK0D2yY4wg9RAqpOzUO8Z4PTvjMSnu
	bhuubDLXN5RnvxwtFHwp9WF0WG427YJNBX3GEM//Q8/h8T9/Oba954959U1+pIlwMNkEFx
	HC4xTe2+XQkbC2cNH/dnFqwWsArN3GZYK4KgW6++GDbGkcUaX75oRUcXhwoZumTOpy8sPW
	GgzPrVzL90wf88N6SXzYzfkR7cm66ss3blUM6PhP6cs7jlgvgHNvzP6m5T8U0Q==
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
Subject: [PATCH v4 0/5] PCI: rcar-gen4: irqchip/gic-v3: Handle GIC ITS
Date: Tue,  7 Jul 2026 22:35:38 +0200
Message-ID: <20260707203743.88299-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: u96g9godcfeirhu3zryyw76zncezkakh
X-MBO-RS-ID: 68c9bf0ca49950fc27a
X-Rspamd-Queue-Id: 4gvtMq4YlWzKnYq
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_133804_895649_CAB6065C 
X-CRM114-Status: UNSURE (   9.00  )
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


