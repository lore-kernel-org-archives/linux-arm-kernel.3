Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D78CDE00E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 09:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oqp269fPqkkP0y4F1qhxEIUZdEYzw+E7N13spqrG24g=; b=AejwIt9vzGmfPLdOh2mVvBZWjY
	rkOIiRaQoXaAXnAIfN8v0UieNvMW15iHepa1H1XClW/TXdPafPyIa3iL0gMEW33w+nyw9CFficJfI
	bDjZpNbDCGh5/gSuIytdpGE5TCbI4DTo+FMGgg9hksNZYu5QFUuzLEF4fBNgbPM+gCiqT7Artf9vz
	IJLzrHuIQlBJc7O9JvTD7TQ1+RQOKjC98ZYXMCRis2EXByLBstsB9zOt8IIDl5YGiZAEEAdbwcrbe
	KYjGkTjZDXx0UZtwgqgUrJZS9gR+OoMNb0E80h7VKFDIHyqN+epkg6ehAc5aAzch80Bmr/XtoAUzK
	PWwYUGFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2k1-0000000Axl2-0TKL;
	Fri, 26 Jun 2026 09:20:53 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2jv-0000000AxfO-3v6K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 09:20:49 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-46f098551bfso313844f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 02:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782465646; x=1783070446; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oqp269fPqkkP0y4F1qhxEIUZdEYzw+E7N13spqrG24g=;
        b=S7PSJKfSInAHkjt+1w0zz0a6wOwoUT8uuC1a85Iryx50+IU3Nx5z4v+YRaZIvO2J16
         jjnRViNgDtP9dqLLnzNego0iTfrCocuIEUvMYxRXvTWwCBaDAsjsB/xlk2iyWdbdYpbD
         nAeOwDehbFzb2RDvzDQVcjtkJMLKRT9Bi9CepAe0Cbc0jEQQbKjWz1yFDRNcmTOVDVR5
         9BI9jlMj0/E3O56pO6ecM+8vK5atPnvQphOMlmcnNVlM7DSyIVxyEIejcWmqC0PfYGlv
         NZhZ4ldPwKH/1aAkw8GmOWpSGxKpPLTCiCPCAQwendveA9z1MLdpKoqNzaPj2Pxl8InJ
         Zz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782465646; x=1783070446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Oqp269fPqkkP0y4F1qhxEIUZdEYzw+E7N13spqrG24g=;
        b=F1IiqMmnMcxkqLXLFw94RVUNPqZofXYdNrCX0LPnBDhgg9fBefUfizsOpoQItruVJh
         eAbOwMcvBeMzkT+Ocv2nrXhYPgxFWlwIgcjh/Tf4q7+Qjx47h+sRUhoiiVSH3I51Sx3F
         LGYdVKS7m0ArdH6c1VMLKCi7o6CjPHv/elD3ny5IWql1+1M723NfU4Gsop1SPV9AWL5B
         Y0KxbDceY3nuHz9J2ShFAinGMIX9NbuIIXMvtTjmN0SwJPLXJAlBjXTNCXN5o404qwzf
         Mjh+8VqgL/vXKtju6WFNI7EMDUjong+ezTNzwdJqUxdcOIn4KOzEZUVeV0cru8hOU7BP
         t/EQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq4PeTk02JsxxKMAmygBHsaRLxx9RHbKIzXsb4ReATymHekUCpXANAcAuDj5QSTI3w8MwP4ick2GSYSsCgwbPO9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2NP76ReFuggSxCoMExikpHD5Nx9Z4tHnHTlb4vsKwgZwPh1/Z
	9B/Y4pSOx7to/IiGQcdeWtbcPxoTq69sdqx3edeF7myZsrYqLoAS54YE
X-Gm-Gg: AfdE7cmlcWQ6m6uCKk3tJwl2AHdOGWj8s4QimxSNTmX4HlIpsS4ffu6snyUUk1IjbmY
	Tb/vJIVz+R4jzK5Y97KZ2CpCXDHgNmvS/ts4taQvhZGEmap9IPKlF01lkW4Wp1CNcQO1KdBrDbq
	5IQ+cWS4ObCbYcPXZ+zgUq85hHaKV3aSqAsW7Zj/N+cbprJM/vKiV2V2uM1pem0istPQm29z13d
	0ZYW+bjphT/buI83pN6f7rZ0Sz4V4KMxLUdzUCdOQga+I1GNBQw5VnQBQ7aEhpVWh6JRcM4ZJW/
	nStjTmEo7gE3BsJlOgY8mD0mo3n1R8eHExUsMXeEPUWFZbP13y+z+/x5KQ5f6jyKjDTQnu4yUj1
	+/cRI2335q87lyj/Dyy8elklXcgtrkDPp8Lb04fp44nJHl11v9MbbX7zZ4H7ke66coTDGWOeH1w
	8oE1I0xtciS3u4hQjX0XiK5IZvdKhU9CaC8iFPVcOo1rqFrRmxi5+/bnqxvu5ayja06XFfeP74C
	GGJMt9JFK6D
X-Received: by 2002:a05:6000:1447:b0:464:8d68:616f with SMTP id ffacd0b85a97d-46dc2b0b64bmr10020789f8f.31.1782465645828;
        Fri, 26 Jun 2026 02:20:45 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-80-183-219-152.pool80183.interbusiness.it. [80.183.219.152])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-46e6167c05fsm9094388f8f.25.2026.06.26.02.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 02:20:45 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/4] clk: en7523: add support for dedicated PCIe PERSTOUT reset
Date: Fri, 26 Jun 2026 11:20:26 +0200
Message-ID: <20260626092029.3525264-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260626092029.3525264-1-ansuelsmth@gmail.com>
References: <20260626092029.3525264-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_022048_018063_4A74B2A4 
X-CRM114-Status: GOOD (  16.15  )
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

Add support for resetting the PCIe lines with the PERSTOUT reset. These
special reset are controlled by the PCIC register and are specific to each
of the 3 PCIe lines.

Notice that reset logic is inverted for these bit where 0 is assert and 1
deassert. This is intenrally handled in the reset function.

PCI enable/disable are updated to drop PERSTOUT bits in favor dedicated
reset handling.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 39 ++++++++++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 1ab0e2eca5d3..c9b21d9bf2f3 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -338,6 +338,7 @@ static const struct en_clk_desc en7581_base_clks[] = {
 static const u16 en7581_rst_ofs[] = {
 	REG_RST_CTRL2,
 	REG_RST_CTRL1,
+	REG_NP_SCU_PCIC,
 };
 
 static const u16 en751221_rst_ofs[] = {
@@ -450,6 +451,11 @@ static const u16 en7581_rst_map[] = {
 	[EN7581_CPU_TIMER_RST]		= RST_NR_PER_BANK + 28,
 	[EN7581_PCIE_HB_RST]		= RST_NR_PER_BANK + 29,
 	[EN7581_XPON_MAC_RST]		= RST_NR_PER_BANK + 31,
+
+	/* RST_PCIC */
+	[EN7581_PCIC_PERSTOUT0_RST]	= 2 * RST_NR_PER_BANK + 29,
+	[EN7581_PCIC_PERSTOUT1_RST]	= 2 * RST_NR_PER_BANK + 26,
+	[EN7581_PCIC_PERSTOUT2_RST]	= 2 * RST_NR_PER_BANK + 16,
 };
 
 static const u16 en751221_rst_map[] = {
@@ -635,9 +641,7 @@ static int en7581_pci_enable(struct clk_hw *hw)
 	void __iomem *np_base = cg->base;
 	u32 val, mask;
 
-	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1 |
-	       REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT2 |
-	       REG_PCI_CONTROL_PERSTOUT;
+	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
 	val = readl(np_base + REG_PCI_CONTROL);
 	writel(val | mask, np_base + REG_PCI_CONTROL);
 
@@ -650,9 +654,7 @@ static void en7581_pci_disable(struct clk_hw *hw)
 	void __iomem *np_base = cg->base;
 	u32 val, mask;
 
-	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1 |
-	       REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT2 |
-	       REG_PCI_CONTROL_PERSTOUT;
+	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
 	val = readl(np_base + REG_PCI_CONTROL);
 	writel(val & ~mask, np_base + REG_PCI_CONTROL);
 	usleep_range(1000, 2000);
@@ -754,14 +756,21 @@ static int en7523_reset_update(struct reset_controller_dev *rcdev,
 			       unsigned long id, bool assert)
 {
 	struct en_rst_data *rst_data = container_of(rcdev, struct en_rst_data, rcdev);
-	void __iomem *addr = rst_data->base + rst_data->bank_ofs[id / RST_NR_PER_BANK];
+	u32 offset = rst_data->bank_ofs[id / RST_NR_PER_BANK];
+	void __iomem *addr = rst_data->base + offset;
+	bool inverted = false;
 	u32 val;
 
+	/* For PCIC reset logic is inverted, 0:assert 1:deassert*/
+	if (offset == REG_NP_SCU_PCIC)
+		inverted = true;
+
 	val = readl(addr);
+	val &= ~BIT(id % RST_NR_PER_BANK);
 	if (assert)
-		val |= BIT(id % RST_NR_PER_BANK);
+		val |= inverted ? 0 : BIT(id % RST_NR_PER_BANK);
 	else
-		val &= ~BIT(id % RST_NR_PER_BANK);
+		val |= inverted ? BIT(id % RST_NR_PER_BANK) : 0;
 	writel(val, addr);
 
 	return 0;
@@ -783,9 +792,17 @@ static int en7523_reset_status(struct reset_controller_dev *rcdev,
 			       unsigned long id)
 {
 	struct en_rst_data *rst_data = container_of(rcdev, struct en_rst_data, rcdev);
-	void __iomem *addr = rst_data->base + rst_data->bank_ofs[id / RST_NR_PER_BANK];
+	u32 offset = rst_data->bank_ofs[id / RST_NR_PER_BANK];
+	void __iomem *addr = rst_data->base + offset;
+	bool inverted = false;
+	u32 val;
+
+	/* For PCIC reset logic is inverted, 0:assert 1:deassert*/
+	if (offset == REG_NP_SCU_PCIC)
+		inverted = true;
 
-	return !!(readl(addr) & BIT(id % RST_NR_PER_BANK));
+	val = readl(addr) & BIT(id % RST_NR_PER_BANK);
+	return inverted ? !val : !!val;
 }
 
 static int en7523_reset_xlate(struct reset_controller_dev *rcdev,
-- 
2.53.0


