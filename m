Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A569D606D811
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 18:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H5kfb3p1;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=IsOzwrW6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Bd0quOoFJe0g9jNpT8SLzufibaLOJeXGBQUTTVHS5os=; b=H5kfb3p17n21lH
	ESfWa9sGV9R2uFnXXxzichiFiekcmOcC9WDnf+V9z/2389onOU3+8cYI44CQ7/ineTARXuFKmyUYt
	H62oCUe2m81lExhbb4vArkl7fe/MOldg3in643B+TGTr4rS2OHKVVvHM/R6ZQmjZw1MjbZwsB54Az
	JLAOdV0+IWTTYiWp8yMNrkOArxsTtMHTkMtGrLvg+kO5qcKTQAaAEdTOVKYmpmx2BK+ajvQhWaoBp
	3OlgZClZJ0PlFwz5fETiUXAmJm5n7CA7xaataVOSWvNrotSyh07JKNSU0rLHs+TB5kDOAQfeZG7Iq
	c5Cg4iXVmJW4u39B9S1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgAC-00000006TBB-0N2O;
	Wed, 04 Nov 2026 18:56:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgA8-00000006T8N-2Qoz;
	Wed, 04 Nov 2026 18:56:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793818601;
	bh=8gAjDeFID8mO/dDQRifUwMLmNaFsmqSGIncrUFAKD1o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IsOzwrW6bX1EQImCkZIQb5Dx7kGD4AGhAXYaje1aKhVMDL0Y+ahtNdJ5NPSVFQ6xp
	 A0KLj/j8ZDqW6nFbCz9PNPWek3UkDmEIOxEKGv4s/gA/EJ5xR4tnDz1W+z6gX+siv7
	 oi4YADYK5smYlS2O57G6KWoS+6YGU2oAgVAefGwKne9aXUMlMifd+QsenuO5Jn6VVl
	 bPy7WbLWOz7MDS/qnBqbJs+lRdDDB01ln7+sR9dCpQQZSTaOvavXk99Oz/VJjAs8SF
	 wAPveO1q3o44x8OemSmAY8pv53dcTD5z8ts/1T65Sgoe/UxI6vG8hnjeUWllnjp4EB
	 veqTul0CzzPXw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2730717E0D13;
	Wed, 04 Nov 2026 19:56:41 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D522348002F; Wed, 04 Nov 2026 19:56:40 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 04 Nov 2026 19:56:40 +0100
Subject: [PATCH v7 02/10] PCI: dw-rockchip: Restore vpcie3v3 regulator
 handle
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-rockchip-pcie-system-suspend-v7-2-6ae6875939a2@collabora.com>
References: <20261104-rockchip-pcie-system-suspend-v7-0-6ae6875939a2@collabora.com>
In-Reply-To: <20261104-rockchip-pcie-system-suspend-v7-0-6ae6875939a2@collabora.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 "Yury Norov (NVIDIA)" <yury.norov@gmail.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Alexey Charkov <alchark@flipper.net>, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2506;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=8gAjDeFID8mO/dDQRifUwMLmNaFsmqSGIncrUFAKD1o=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrrf+hWsPwkrnKKhHeAAJ7W5noTw0cPZKcxh
 N+Sm8Pbe29lT4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq63/oAAoJENju1/PI
 O/qaT5cQAI0c7NwScwUvTliwgTU60pm2xWD37FM8bHfZexTpjY/HigJSuemH+1UXhJsg8XfEXGk
 XVl9iyfBRXMz7gru156X4Sx/xCfKf8x+Md1RoPdFyXY7MGrdB3cq7Hi9Yl47SMNU0al1uYq2BMQ
 IzMOCFzffmwMhsg0MteUOOrixB9CWy+H0NMaCl70TOHUS/gbH6d8mnVGJ8T3LTlif5ur4XpLQtW
 Uoyz0txqCQAl4/LOBI9rip/4342jKSCGmUCkMcHNp4keB0p0H348UZP0icz466oQD0O4bY7poOY
 H7SSsgCgt0NWXIk6irobsNz16J4wM1b7756dOXYTiYSWtgFguLA7NfRjSMwzisFXQtVCPkao6Ms
 4KrKZEMIoOyKMZ48gK3eJkT27PPSDTacHsihLEtaf25/zU7Zj8EnwtJ665NSFYumIYjP2FbU/js
 Tb0GG/y7Fa9cTrHUHL7HySwRmqjHx4XdLcAdW1eJ9JSTCbGsFyZlQjIBFZuDSU2jnkOOmnkwRWA
 jOav+oGN4aklWm14adJnvnV74Dpgn5GeTLlZ30SDK7jvm+z60/9cTM0+dM5QI6or5MR2Jreif8I
 DUA2iHUVTC1e+bG1TYQ/YVsR9LioC56QFXE8JZjbU4YWPUrVeHvPtM2K4JLb7X85Un5LgRL9AD2
 +C0Q0TJUfs7F8X5e4xbQw4g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_105644_773824_63C316D8 
X-CRM114-Status: GOOD (  16.61  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This reverts commit c930b10f17c0 ("PCI: dw-rockchip: Simplify regulator
setup with devm_regulator_get_enable_optional()"), which nicely cleaned
up the code.

The vpcie3v3 regulator handle is needed to disable the regulator during
system suspend (to be added in its own patch).

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index c35c5583c797..574d3dcfcf8b 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -113,6 +113,7 @@ struct rockchip_pcie {
 	unsigned int clk_cnt;
 	struct reset_control *rst;
 	struct gpio_desc *rst_gpio;
+	struct regulator *vpcie3v3;
 	struct irq_domain *irq_domain;
 	const struct rockchip_pcie_of_data *data;
 	bool supports_clkreq;
@@ -844,15 +845,24 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
 		return ret;
 
 	/* DON'T MOVE ME: must be enable before PHY init */
-	ret = devm_regulator_get_enable_optional(dev, "vpcie3v3");
-	if (ret < 0 && ret != -ENODEV)
-		return dev_err_probe(dev, ret,
-				     "failed to enable vpcie3v3 regulator\n");
+	rockchip->vpcie3v3 = devm_regulator_get_optional(dev, "vpcie3v3");
+	if (IS_ERR(rockchip->vpcie3v3)) {
+		if (PTR_ERR(rockchip->vpcie3v3) != -ENODEV)
+			return dev_err_probe(dev, PTR_ERR(rockchip->vpcie3v3),
+					"failed to get vpcie3v3 regulator\n");
+		rockchip->vpcie3v3 = NULL;
+	} else {
+		ret = regulator_enable(rockchip->vpcie3v3);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to enable vpcie3v3 regulator\n");
+	}
 
 	ret = rockchip_pcie_phy_init(rockchip);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "failed to initialize the phy\n");
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to initialize the phy\n");
+		goto disable_regulator;
+	}
 
 	ret = reset_control_deassert(rockchip->rst);
 	if (ret)
@@ -885,6 +895,9 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
 	clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);
 deinit_phy:
 	rockchip_pcie_phy_deinit(rockchip);
+disable_regulator:
+	if (rockchip->vpcie3v3)
+		regulator_disable(rockchip->vpcie3v3);
 
 	return ret;
 }

-- 
2.53.0


