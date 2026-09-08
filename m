Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E47C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 14:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Znk6y3Y6E2mnGkYb5ykJ3dOAmXvVg+um0sAoS9EacFY=; b=gJZB+IC2318ICX8qfar7WEeyC4
	3BbuXkN3FNsxPa/MxvnLEbTQSbB7UwpQzm2iMxWWn94TZAoLMm/hTF2v0dG5BzfC2A6uCuq/WFnVW
	sW+vZy+DsmFs5r3gL1hoQ8m1B+3S7ZovcDysvpZcO4sj4iKSsNNu4uLxsfNnV2W+WgNMxCJCxd1JX
	FX+0bWYs3fFsT1p6/+vPIOyNB5P73MyZoD9tNqKuu3C2IaMH/UFCjmTGozrBLwZOYMUqeJpGJRkIj
	agMYAvah6oJbLfwSaZLORcae8NruyFFx+Zh7WUE2q0c/FG7vtd3YlP20LNnaWNknSMNACLwFWl7i1
	bzPNErWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xAo-00000009KCo-1Sid;
	Tue, 08 Sep 2026 14:51:46 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xAl-00000009KAl-3ZfF;
	Tue, 08 Sep 2026 14:51:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788879101;
	bh=kZcRY1c6StE/iaMpmxijtqbRZWber+zT7CoQUOt7B+w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lWtInLD7Mx+sw6LyHTAZmsnTe4uKElQZXMls+6J0T9WruF6eaGus3+dnYXWc6eZBw
	 YnYb0b4CRdV29kNGnK3pbY0sm3ieN/8NSIqGb+NbHyztVV6x83uBp9t2F2T9aGX7fT
	 +/5J/fqdTByNNWCAjWomgApGf3QbW0gd5ZT9IjTeXRAj0VyVwNpQ0MkNFOQ8o0beO7
	 Fv7HCXLScWgv9CcxfbGGYpwPkYa6e5xY/V30KDRKixKIbHk5fTuLS41lfHcGL9a3Wg
	 1SkrLaLDe/OA+Gok5MeDlND7c5LL6OEJ/tUMwWMp+scLnh2+hW0LLDqeBQtz+xkWce
	 TGNeGUv3cSL7g==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D973817E0D02;
	Tue, 08 Sep 2026 16:51:40 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 8EDE748002F; Tue, 08 Sep 2026 16:51:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 08 Sep 2026 16:51:20 +0200
Subject: [PATCH v6 02/10] PCI: dw-rockchip: Restore vpcie3v3 regulator
 handle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-rockchip-pcie-system-suspend-v6-2-fbabcca9921b@collabora.com>
References: <20260908-rockchip-pcie-system-suspend-v6-0-fbabcca9921b@collabora.com>
In-Reply-To: <20260908-rockchip-pcie-system-suspend-v6-0-fbabcca9921b@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2369;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=kZcRY1c6StE/iaMpmxijtqbRZWber+zT7CoQUOt7B+w=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqgIPwdJHE0SdIZNod/yxUcsi9mnZYZi5vOp
 gV2BaUaH13o94kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqoCD8AAoJENju1/PI
 O/qaUAoP/1jsU5fM8qWI7cJi8JJOag6aW+owxxRh1q9w3/2XzYTNsKsvXjczx9+1XqiiIs8HU9q
 aBIkUH+DpIDIUA9ZCyYqwGCDleUbeGVvD5G7whCWrur9sdDsu6j3dSiNqYyOux4Epzj50+xJHcM
 cfIXLCd++9+CQcBUqwBLj3qlPLxBxvOSHWwpO2QqBsw4r8/FWp84ab2Um4IRV60V2LsOW+ZLpRF
 ktqnFIH8rT2UxFbp+lyC2nmWizs67+5DM8lGBR8J1cweR5lMBWPNpn5zUWnZbKh3rJij+HnufTO
 EeTpQovIOJ2g6tL8UesKKbTb6Qj3RCvELjmAm01EPxvdExekuWgG8vYsbFLq5exEZvHk2ao/bcH
 MaRxV1UgeLWCpt0BEnwWHpuXHYoVIidT8qtqZoBz2sxWzymHIWsei3aePTD/bMy3YdRFfakA8Gv
 ga/12s+HXKn/QzC7PXD4xcv99GFp8oGzdP94mpjJ74cl6rBBxkbnEl8w4qFQLiyS7zKEKsb3aPk
 Nx6Ik80z3UpGB/jHWD0L5d+gXitvs2eiA+fz+w8DmEMJFIZoLGGMX9BCpZl0pNOCTRCZJt9TuMW
 3zGcDEsnc9iwTn86j3EfvNe6b4xYYa0X89H/qRFHhWsKj8AWb4S9g51q1o0XI7+oOD/TZtRR6+d
 0MS6gmMRfM/fZzfUjoNEtgg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_075144_045327_EC04ECFA 
X-CRM114-Status: GOOD (  16.13  )
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

This reverts commit c930b10f17c0 ("PCI: dw-rockchip: Simplify regulator
setup with devm_regulator_get_enable_optional()"), which nicely cleaned
up the code.

The vpcie3v3 regulator handle is needed to disable the regulator during
system suspend (to be added in its own patch).

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index dc85564e5001..f67ad3c31c35 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -112,6 +112,7 @@ struct rockchip_pcie {
 	unsigned int clk_cnt;
 	struct reset_control *rst;
 	struct gpio_desc *rst_gpio;
+	struct regulator *vpcie3v3;
 	struct irq_domain *irq_domain;
 	const struct rockchip_pcie_of_data *data;
 	bool supports_clkreq;
@@ -844,15 +845,22 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
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
 	if (ret)
-		return dev_err_probe(dev, ret,
-				     "failed to initialize the phy\n");
+		goto disable_regulator;
 
 	ret = reset_control_deassert(rockchip->rst);
 	if (ret)
@@ -885,6 +893,9 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
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


