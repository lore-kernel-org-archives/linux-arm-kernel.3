Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC76AC44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 11:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oqp269fPqkkP0y4F1qhxEIUZdEYzw+E7N13spqrG24g=; b=POFxuCUWWxIPuHwNuthlqPRSUZ
	neg71GfdAGTN0YZkWp07f2UKQclT76d+fwvDI1gfY+TFbAhJAf674VWfTpPE7TuINgkPh2PbkJKwJ
	FT4oZPs7ggGN6fHfkoxloSw3T3RkklOVcOQQE9USmrKGCS/VmR1lI4dMFHtLdjsRfvnjQZRvDCCo3
	lkAsVdZt95bb5UOlGDdZ5eg9/rKLcYZSG4QRHo2PpRWDg14zqNaX4tVN+X5WoNXuo6LayACBtbDD1
	cDBms3jyc/LVtq/OEogWZ6gsbZDcODMGJSY6+BHDVvz1uAAVmicErTITuj24z4csovMK381xRPclJ
	KmfaiDkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbn6-0000000Bp3C-3D9v;
	Tue, 14 Jul 2026 11:59:12 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbmw-0000000Bosv-0HDd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 11:59:03 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-493b7612475so32964775e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 04:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784030340; x=1784635140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Oqp269fPqkkP0y4F1qhxEIUZdEYzw+E7N13spqrG24g=;
        b=OvsJeGfSW9zZBZG4Wls4I/RBVzXgWz6I8xqknLz7X4sqK38PTmVccTkhZ3W9GlFJ9m
         zGCAgeWfGW+9U8Njm2kCYDJho7TqFXfZjLwd734FvwUmWl9ovl89nhueFSEos+1Og+79
         7lxiLmJKWMCelHH2l2uWqjy8VZfEIMsEJorzQjHozpX6rxlditFazein6dgL/TibH7D9
         PB4OvgAsmosxvzbDiObDCI06dc2Eo+4YJrSa4OuUwmo9DJLX+JJbCMmb362d7LgA4CmH
         ysPIbA07FuZg9c/rqbzQnvqQPFLlsHGGA3YsEhDf05GR7ofh8g9tNVSpdptSg+yWcvth
         D02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784030340; x=1784635140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Oqp269fPqkkP0y4F1qhxEIUZdEYzw+E7N13spqrG24g=;
        b=s9oWjgpiDJl2XqCQUFc7/6Qi+/yijhfoDFn38+uLxRqsXyTKyiGMnLqAuGGczIFZPA
         aeTdXRjfEtTrnxB5PpI13Xz0iQZFytRcMyWFyC0HIkCO5eES6l/+7Zxz3txlImpjph/O
         wt0LXNKMD0zMfhxMBMuatTexEB3Axifww8cEJITqaZqtW2GoSiKdtikMH1qzu023P7QL
         U3Y45rUaubifp+EzJeHyzWM6rRy5tCl3uj+zxpdJPdgENDWLytZB6Ya7I5GZGE3CxK3r
         0pXZ+aY+Rjy4+elA2ptiv+s2XdfOuQ0dzv2m1JNo+YVQ9TY7AxKNVhaVHOwZy6vyGkix
         w8MA==
X-Forwarded-Encrypted: i=1; AHgh+RrUzE+bXV8n9+syTz7U4Hj95dG7J67/0NTW6gwaDgsBuMTu4x9OMPdBhatBP262Z5QhxEeMMcXxZZpKBHTK9NhO@lists.infradead.org
X-Gm-Message-State: AOJu0YzENfCr2Ix/+4JM/E0ROvqjT/2Mom1Dd3Ahfz/s9bvk+4ZLRLb4
	vVHHmaLRdH3nstTRI5Rr5MVp76jB795aZeJwukq/t3LVvVKtmOANmob1
X-Gm-Gg: AfdE7cmqu6Ofm1raPdLV/DG8zRMsfCcxckO+bA1trlt5yVGm4oSsQHZqXr345tUDGpF
	ubySttkP5sooTAh7lG8KkykKgGsBMWlaZMZ+SnEPaKik4m/NIlHyM427MSC122TbC4isscbcY0k
	yoV2ts7cXUZKnUPNe69akZUQIJlWRxnsiyEb7GEWJZ1T5SP1PA8NlKhcV/kf18XiYn3TPy8kNO+
	Cq4lS7dmRBLxYCsXKK8Yhdb5XUsA4XFDgQyYKreaDBHUr+k64XLW09W9UzzvKhDOGnTbQ0Cw2Q5
	7Ux7P76xn534aOTblLjLzrGBDCcgVN1uFkySRmRpwwDyj0zI6BFsMgCre6jaE7UA69DK12E1D6f
	AUc+MgNLsb4rJ8symLHcgWcknjBCKSOZpN+b6AsKy7zof0YuuF17KZfSRF/CjpTa+zAqvO16Su2
	Hg0HpuzY6O0luP/ERVkb08VBGrNVwxxtgJav00LRTnTgTqDrqA3DajD269jc4nOSWbAGZArovMa
	PlXTTie
X-Received: by 2002:a05:600c:19d0:b0:492:6efc:7c60 with SMTP id 5b1f17b1804b1-49518308220mr36197365e9.28.1784030339968;
        Tue, 14 Jul 2026 04:58:59 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493fd3ccfd4sm180531655e9.2.2026.07.14.04.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 04:58:59 -0700 (PDT)
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
Subject: [PATCH v4 2/4] clk: en7523: add support for dedicated PCIe PERSTOUT reset
Date: Tue, 14 Jul 2026 13:58:44 +0200
Message-ID: <20260714115848.8537-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260714115848.8537-1-ansuelsmth@gmail.com>
References: <20260714115848.8537-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_045902_175322_F6DE0636 
X-CRM114-Status: GOOD (  16.81  )
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


