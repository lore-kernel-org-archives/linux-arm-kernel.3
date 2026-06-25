Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F140DCDE00E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 21:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZznG8nXpNdUsgio0AWCkV/jSav7ySTRqhFzl8X19lM=; b=tfI0iOvqA5iY+Kf5tuKAkJ80uE
	TclxCMJQJyKpCkFbBM4xiSmy+w61rxMShH84ZPhZVuCPNbK76b4n2DaN962vGL5RhGMQz/+vqN+wE
	W2jm2HHPbCTTHZ/b1BqLOS8zAbtzJaYlajKaop2ASud4wZva2//dh382CsERi25kRv5G8IRcxFMpf
	lsrcsz54d5yuBtnHHXi6ZYAVtHqdVI+TCfd1gCkIL5rNeGb8cIunPZbj0JX3ZtajZzkbDkjWLbu2C
	A7g63qi6OJWNYWuz/XQQBT1qeFLndEd8f9+zl/2+ZtANZG0Z01cNtHXcrjekXY4UsU9kDg3x6D770
	wv/qBWfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcs5G-00000009tgz-1Nkw;
	Thu, 25 Jun 2026 21:58:06 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcs5B-00000009tdW-4A68
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 21:58:03 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-490b9318997so2552155e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 14:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782424680; x=1783029480; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uZznG8nXpNdUsgio0AWCkV/jSav7ySTRqhFzl8X19lM=;
        b=cIftPd3dFcMTyfCQg5UgZyG1ucjv8UhBZlYJeRqiwrWn+l9R75dFEWQXK4gy3eOiHU
         9CynWW8xrfHxfih3N4aAYhwF70k0NhCMcPE1z25UlVLRY1bNFR2iqa0gjG6p+lWlZFLG
         jbS/qJ4jVFANLXe7lFPEs8p1yl24OGar6j07bChMSBctYkOh7I6BN6UgGKUmKg2tirie
         FCmDDr+yA5lrSlGzcsILZFIJf5yX+qRrOM/RWjo4k1peqUFWQ/mb1yM4NweOpk7evtAo
         D+MuNCj12vu8iII6xaXUx4Q1c5c27XaAUJ15oGZ7gk0hIRCnL8Wgl3VSzmyVJ8CCSb7q
         Auxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782424680; x=1783029480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uZznG8nXpNdUsgio0AWCkV/jSav7ySTRqhFzl8X19lM=;
        b=Ag1r3J4VgKJ/fEtF4njysrtXZyhzuFdtE4eX/oR4+7D2lEWTK5CygRgn5g6vT7p2cG
         /GglUE2xBJsG1GkicEXsRHQsz1mllWsF1EydjgAg+BwiJnjtnhrfN73IexI/Ea8rr91G
         jZk4M6mHQD9K/hOdYKlzAtB64V/wpdis55ZWyS+Pc8OGtNKJ8Rf2Dy80IjTpD4SFT3W/
         U48prET3yzmjQ5Dxabl60HrqhTJKZ7zyxvNeBK/uE/d/mrktt0qXKtbjZ2/XHs8j7tCD
         6Iykkb8zuetRxa+sPndRRZVuRjl/PEDzWecJFrCCjf92KQ+JFAJHXuOr+mrb4m+2ayaz
         qShw==
X-Forwarded-Encrypted: i=1; AFNElJ/FNYinV8QgKVmEYwDxMsPjFfzAEmbMrQWZlW4u/hEuHZHmBMw9BePMiNdd4lnyRi6o7wtKrEnX74QXYv02jQdD@lists.infradead.org
X-Gm-Message-State: AOJu0YwICUrxL/YOyOnjocceEsXjxEbyEsbYcRVdBV5mScCxBB/xToXe
	K11Md2G5sKw2+6NAaRTyfIgIcApu2GvZCUR6EGa+jNw4triSXvkAtfjG
X-Gm-Gg: AfdE7clNFYFkwGUmRUqbCtQm1qhgW39PhttDj3P87ApmeZx61G2CyRgekD33UCuCjuC
	Dm/AnDN42FTsX1bcWQMueZvJmSiDGzwFR36zNNj3z+SIk54GH2MPdrPSsz51nPvRnvL9LJ7WuDg
	2moYxqDzRAncP5akaSSJOJej07u+9EUIngXuILfDbryv8WGSHGPiGR+0PuMPTV9Lb5Zl7uvUWfb
	lsqJAxXuPfINfsAluAcXUadQ776chzYQAavVJw+HXEDrq/wINIYCkfpRGxZocwyUS4r8VFDu4FQ
	IuzV1NGgKTcg4/N8jd9CLpUxbz42DHAn6D4XPJwT4Qum1S/zFXTd1PGlnVO35Uu5eqHVZUCVK8U
	5QjcEctvp1OXkt7ECOPVE76IotSqKSeeREX40pF+jQtGuqPZcrvjt0Dj/onpOUon3LB1kJfvbLX
	OXP9OYElVKMpg0qTy8R+JVcoLUjTFjOEjzfaYl72r9AguFPZscu6ZagYR23D4MKUyBTq8KeguQt
	UxxN6ybQSXb
X-Received: by 2002:a05:600d:8444:20b0:492:1e7f:d41e with SMTP id 5b1f17b1804b1-4926685aa04mr49083755e9.10.1782424680236;
        Thu, 25 Jun 2026 14:58:00 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-80-183-219-152.pool80183.interbusiness.it. [80.183.219.152])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-492690988e0sm27339185e9.14.2026.06.25.14.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 14:57:59 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
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
Subject: [PATCH 2/4] clk: en7523: add support for dedicated PCIe PERSTOUT reset
Date: Thu, 25 Jun 2026 23:57:35 +0200
Message-ID: <20260625215741.3253212-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260625215741.3253212-1-ansuelsmth@gmail.com>
References: <20260625215741.3253212-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_145802_069907_279E9218 
X-CRM114-Status: GOOD (  15.79  )
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
 drivers/clk/clk-en7523.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 1ab0e2eca5d3..a33cf2e1b76f 100644
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
-- 
2.53.0


