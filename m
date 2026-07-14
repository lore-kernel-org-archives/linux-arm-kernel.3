Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D662AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Uy1v136JBd/TwWAL0fK29hOy7EN7PDxODRCjp0URlHY=; b=DbviiiLpP8gf5oRncW8VwKtOQI
	cLBrc5G2LNeLq1Jv4Q5DqE6LXwkHmDqth+JCwbJbEW60jyt4xocA3/VthpvbFfMGRjwkM+ov6gUiz
	u+668Jtk8oQnbYuqt6fFvMa73DZbRwocsDxSYPf/6mIw0RkAMhhI1XcMJjwJv/nLPlDxYtBG5plKX
	mcX2QUr7C+EHnyj822KzNvzC2+BI9N5UUACXCgLXmsB8DGR56eYTAfc9ePFdpnpsQBhVLgs8dWSNX
	muZ73fmZDqwSNGKeDlBZv++Ooue/QxFWmogmDxssUxy3GpWleU0MuUelq5WiOS8mDQcMN6N6BPs4L
	5EMQO34w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjd3Z-0000000C9hQ-3LXc;
	Tue, 14 Jul 2026 13:20:17 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjd3X-0000000C9f9-0VxI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:20:16 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4h00KS5WqtzKtxQ;
	Tue, 14 Jul 2026 15:20:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784035212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Uy1v136JBd/TwWAL0fK29hOy7EN7PDxODRCjp0URlHY=;
	b=GKhLiPB4F8rXiuNGBhXLvKHsOaLYz6d3kdCfUFv+yXCbuMMWT+5aQZOQk05Gs1OVqsS9tA
	v2etbJItXbnOlF3psG3wcpPJPys5uIx12eXo2CDP0SxmUVIuLtiqqFFUcEDsHRcN/OJPzB
	ERYpiKOi61HIr9XvGwS9gSy0cuWdIEbYpjG0EhqiUK5ppi11St44A1tDk6LYCCtBPJAsAY
	DcKreRrTdxO9wB5/8QW5NyGXZJL1vrhvBR3odJrhjz1dANbU5jOMS812TkiKtqrvOQDIgX
	bcLoLkdZToek0aCo9oiqGVZGdQv21+XamWaeoYHIxcHvxCnkJlDXTrhSkDTwGQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=J+lyE4Sy;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784035207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Uy1v136JBd/TwWAL0fK29hOy7EN7PDxODRCjp0URlHY=;
	b=J+lyE4SysZUHi0CMVloGo6OKODciXi7fLmIRM+Cmwx/60T8VC7eMJZ41BTH7Y4hMd7gUUT
	NMCP0HU4oUJb2j6WjWvoi5wDvWNrF1LPxJnbPK97H1Avxk+sR9AVtRuw86ZzYA6aX3hARX
	x7ORYNx8OfoTx1nbmYH8rNHiRvvXgrHTug6HBUHSfUjK+QgktnekWKbJD1/IaupbRoEkZ8
	8kqtvgx5lNSnxjw6Yy42sTtnMpgMEvEyU8KhZq7vDIXHpWpdJ0pKu21NLosPBVE8c9qps9
	zej6gZYXzdzyR7USjxYUH8V/ig5lnD+8GCQ71lGYQrC9YNgDTaytZ3zlkFmkAQ==
To: linux-pci@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	kernel test robot <lkp@intel.com>,
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
Subject: [PATCH v2] PCI: rcar-gen4: Isolate driver to ARM64
Date: Tue, 14 Jul 2026 15:19:27 +0200
Message-ID: <20260714131957.38067-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 31c95b1302611529b56
X-MBO-RS-META: fexm4t6jjueq3oy4dg3s7beno87arnjf
X-Rspamd-Queue-Id: 4h00KS5WqtzKtxQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_062015_324289_55057217 
X-CRM114-Status: GOOD (  12.57  )
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

The driver includes linux/irqchip/arm-gic-v3.h which pulls in headers
which are available only on ARM and ARM64, on other architectures the
headers are not present and the driver fails to build. This driver is
used only on ARM64 hardware, isolate its build only to ARM64 to avoid
build failures on other architectures.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202607100310.iQw5m9Uo-lkp@intel.com/
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
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
---
V2: This is a rework of PCI: rcar-gen4: Inline GIC_TRANSLATER offset macro
    which isolates the driver build to ARM64 via Kconfig instead:
    https://lore.kernel.org/linux-pci/CAMuHMdVvWE7YZgKvreSn_vJLOVD4eMmn3TCGOyqSXksqjBCwvg@mail.gmail.com/
    https://lore.kernel.org/linux-pci/20260714110041.GA1349622@bhelgaas/
---
 drivers/pci/controller/dwc/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
index 49a7a2c50ca15..3260d916110b2 100644
--- a/drivers/pci/controller/dwc/Kconfig
+++ b/drivers/pci/controller/dwc/Kconfig
@@ -346,7 +346,7 @@ config PCIE_RCAR_GEN4
 
 config PCIE_RCAR_GEN4_HOST
 	tristate "Renesas R-Car Gen4 PCIe controller (host mode)"
-	depends on ARCH_RENESAS || COMPILE_TEST
+	depends on ARM64 && (ARCH_RENESAS || COMPILE_TEST)
 	depends on PCI_MSI
 	select PCIE_DW_HOST
 	select PCIE_RCAR_GEN4
@@ -357,7 +357,7 @@ config PCIE_RCAR_GEN4_HOST
 
 config PCIE_RCAR_GEN4_EP
 	tristate "Renesas R-Car Gen4 PCIe controller (endpoint mode)"
-	depends on ARCH_RENESAS || COMPILE_TEST
+	depends on ARM64 && (ARCH_RENESAS || COMPILE_TEST)
 	depends on PCI_ENDPOINT
 	select PCIE_DW_EP
 	select PCIE_RCAR_GEN4
-- 
2.53.0


