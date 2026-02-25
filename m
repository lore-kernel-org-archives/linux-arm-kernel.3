Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA72F357DA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 07:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KjmmZwc6KWVq4M0dNXYbWQ21OGo4O/i55CZpo06FEF0=; b=mK/xh9hzFz4WF848NQ/MI532PN
	k6aI5Demp7AO9vLdswxWDn0/enig+h2qLONt3SNPB7fe9cA0yIZQW7mIZ8XiibDdQAhsSUrE/2++u
	fYNXU9rYJG5fq+dZC4szt2tv2HalNlRPvaMiQm7+pOpbxjBFkPjtuyWGXoS8N9oU2QQhfLjcY3g6P
	g/F8woghAnEh0mueCZQMw3PERcDKc2t6hWdi09+up/RWQ6fgjBAV70woZsdhUKGNQ9YGkS0rSo1DB
	/WRVB2hW1C3kgqOhoAGUSeVX4fClcV6x0znnKzUJqDufbqjTx2VWdS/wnLoSvj02xZO/tJmecI4UP
	TaCvILKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv9Ed-00000003PTG-1tdZ;
	Wed, 25 Feb 2026 07:23:03 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv9EY-00000003PNU-3UsP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 07:22:59 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2aae4816912so44388195ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 23:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772004178; x=1772608978; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjmmZwc6KWVq4M0dNXYbWQ21OGo4O/i55CZpo06FEF0=;
        b=J5K+l26L54eKlyGfZtuJrtqQNAWbyfgWdQG2xZ9xDnDzUWqyCxeYjONDiKNDCjaU2U
         guoymunHqVolcv4hBiizTtJWlb0VsK34E1o3/PJgXiMkEmDeqABduNMXXPFM4weNH3O3
         nhi5WDCZgrfRo/IWVTEZxNcCOQF8CTPGJENmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772004178; x=1772608978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KjmmZwc6KWVq4M0dNXYbWQ21OGo4O/i55CZpo06FEF0=;
        b=JNUdvBAG/znin28H5M+WkIMEjImn/SqYe8REdrj7+LQbTYHFEkyRZTmQwQbB2SIbXS
         g8Tok97RUUBNZ6NjLof209j6Ud0Y8iMcdpyYxLizFIbqr3tm9zB/ygSVLL07zU8ZrHTH
         NdcRAvUBihZAWPbLJIOqUy+ACL8SZjheIMG9Qmm4G1LB6ShPaacf3HcXC6KDo+egQSeB
         ITdBy01Y+d7bqSgi/232n1Q7zV6rKgIyrLCS4JoixsnQ1F5oEnQ03XOQKx+AGwSQwB48
         lNJDB5SyGJCZo4wQ+gVHo8/5yQUlAT/Tv4M6l0NY4tM0rGL2JD5qolLpj5xas5dFXgnH
         NZgw==
X-Forwarded-Encrypted: i=1; AJvYcCXzVwe4cxK2WmkDvLyhbY/osTJD4wtVQFWYDj66LbWmELsSP16+aoRf06zfceGT/YwWj17GHB5FTIG4yX1+E116@lists.infradead.org
X-Gm-Message-State: AOJu0YwIYWAdu96LJ7vLdcntFk1dLIbAzlD0XRn4FBya2tpt9ufGwyIh
	AYJGtbcrbvWcFbRPXWNdXTEKwxWqOd4dR5yWo8nAwvJu3+36tP0cajshw7AikMZblg==
X-Gm-Gg: ATEYQzz6NKK2gFPM2AGFY+fL5MabtXQUlTPpSkGwNPvKLv85RrPQjr+fvsw3uXsdph+
	tj9z6tITAG3do8Txtwu588M41wWuLhygX6oA5f33ygQ84WZ7gvO3fR1db1v0TtKLUoHcesZOXOq
	hzl56dKUqx7ERlW5mOTnmFzasGibQQq7PqG/Jf5c552XNe8Aia+/q74mnCmSnlAkeB7AM3LyWmz
	60N/eptJlOmYs428aLV5yj0qic6RRLlQJN8Wj52Y+AWdnF7A653VoBw1zkbqb/apggB0d4jCEFK
	HCGHVvDbukaB0U1yKwmH3zDPrwzYsvNZ28JFRSesppylXzPSgmnLMhAf5OwxDlGm3aCI76n8o6v
	AOxqHFW32P8YgWkks4Fddz7zsvSGINmO8YAAcjzPee+QNnHzcG7amsnvDPIm/kYFRL9PHOBMkGS
	CRoUvbV3w+QmZkEw71eKM510hTEKuAsFCROAWHbAyQh2+FKdZAoKKO5Y9PmDkbqjHEFSPCxGekX
	roCAA==
X-Received: by 2002:a17:903:46c6:b0:2a0:e5cd:80a1 with SMTP id d9443c01a7336-2add141780dmr17635675ad.41.1772004178049;
        Tue, 24 Feb 2026 23:22:58 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9d6:2e6a:941b:690])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7503fdc9sm130814435ad.80.2026.02.24.23.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:22:57 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] PCI: mediatek-gen3: Split out device power helpers
Date: Wed, 25 Feb 2026 15:22:20 +0800
Message-ID: <20260225072225.3345307-4-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
In-Reply-To: <20260225072225.3345307-1-wenst@chromium.org>
References: <20260225072225.3345307-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_232258_897917_F7D482A0 
X-CRM114-Status: GOOD (  18.72  )
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

Split out existing code that deals with device power sequencing into
into helpers to allow cleaning up the error paths and integrating the
new PCI pwrctrl API,

This change is purely code movement.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 87 ++++++++++++---------
 1 file changed, 52 insertions(+), 35 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index f2bf4afbdc2f..870d3b3db11d 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -403,6 +403,54 @@ static void mtk_pcie_enable_msi(struct mtk_gen3_pcie *pcie)
 	writel_relaxed(val, pcie->base + PCIE_INT_ENABLE_REG);
 }
 
+static int mtk_pcie_device_power_up(struct mtk_gen3_pcie *pcie)
+{
+	int err;
+	u32 val;
+
+	/*
+	 * Airoha EN7581 has a hw bug asserting/releasing PCIE_PE_RSTB signal
+	 * causing occasional PCIe link down. In order to overcome the issue,
+	 * PCIE_RSTB signals are not asserted/released at this stage and the
+	 * PCIe block is reset using en7523_reset_assert() and
+	 * en7581_pci_enable().
+	 */
+	if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
+		/* Assert all reset signals */
+		val = readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
+		val |= PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB |
+		       PCIE_PE_RSTB;
+		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
+
+		/*
+		 * Described in PCIe CEM specification revision 6.0.
+		 *
+		 * The deassertion of PERST# should be delayed 100ms (TPVPERL)
+		 * for the power and clock to become stable.
+		 */
+		msleep(PCIE_T_PVPERL_MS);
+
+		/* De-assert reset signals */
+		val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB |
+			 PCIE_PE_RSTB);
+		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
+	}
+
+	return 0;
+}
+
+static void mtk_pcie_device_power_down(struct mtk_gen3_pcie *pcie)
+{
+	u32 val;
+
+	if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
+		/* Assert the PERST# pin */
+		val = readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
+		val |= PCIE_PE_RSTB;
+		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
+	}
+}
+
 static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 {
 	struct resource_entry *entry;
@@ -464,33 +512,9 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 	val |= PCIE_DISABLE_DVFSRC_VLT_REQ;
 	writel_relaxed(val, pcie->base + PCIE_MISC_CTRL_REG);
 
-	/*
-	 * Airoha EN7581 has a hw bug asserting/releasing PCIE_PE_RSTB signal
-	 * causing occasional PCIe link down. In order to overcome the issue,
-	 * PCIE_RSTB signals are not asserted/released at this stage and the
-	 * PCIe block is reset using en7523_reset_assert() and
-	 * en7581_pci_enable().
-	 */
-	if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
-		/* Assert all reset signals */
-		val = readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
-		val |= PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB |
-		       PCIE_PE_RSTB;
-		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
-
-		/*
-		 * Described in PCIe CEM specification revision 6.0.
-		 *
-		 * The deassertion of PERST# should be delayed 100ms (TPVPERL)
-		 * for the power and clock to become stable.
-		 */
-		msleep(PCIE_T_PVPERL_MS);
-
-		/* De-assert reset signals */
-		val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB |
-			 PCIE_PE_RSTB);
-		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
-	}
+	err = mtk_pcie_device_power_up(pcie);
+	if (err)
+		return err;
 
 	/* Check if the link is up or not */
 	err = readl_poll_timeout(pcie->base + PCIE_LINK_STATUS_REG, val,
@@ -1269,7 +1293,6 @@ static int mtk_pcie_suspend_noirq(struct device *dev)
 {
 	struct mtk_gen3_pcie *pcie = dev_get_drvdata(dev);
 	int err;
-	u32 val;
 
 	/* Trigger link to L2 state */
 	err = mtk_pcie_turn_off_link(pcie);
@@ -1278,13 +1301,7 @@ static int mtk_pcie_suspend_noirq(struct device *dev)
 		return err;
 	}
 
-	if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
-		/* Assert the PERST# pin */
-		val = readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
-		val |= PCIE_PE_RSTB;
-		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
-	}
-
+	mtk_pcie_device_power_down(pcie);
 	dev_dbg(pcie->dev, "entered L2 states successfully");
 
 	mtk_pcie_irq_save(pcie);
-- 
2.53.0.414.gf7e9f6c205-goog


