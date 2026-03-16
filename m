Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D67EF53D8D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 19:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqBEab12+3mxnhc85m6ielT/3CYiFb35OttXQaNCZrI=; b=CRDUsbzy4jZEZdbnwk+fF3JKNM
	IMjEY1wSzH5Bv8Hnp0Ixi3/aDHybCl7unb5DqaLDw3tewF1/8P5F9J56bNTr7TEw/E0PN57A5io94
	oPIxz3zPf15iBrgv/xuiig0YDLr5LBKonIqLwMtshiV1WMCC9gb8i4ZHm0NIYgTfUcwafdBbm0Gy1
	9jWMxmC5i9l3IwC7ajnVif+KZrbWcCNaHrXMxLR6NYZ7eTBJQaVaAyL/bFbojzIeQMcZcFqUxhaNr
	Lboes1UUq9mRNUhWIHKS+Z6SLB4tVrY7ZgGjMg13zwMidP4xGdAeeehIV4b6hf2JbX1ez/dOXw8w0
	tYJkjMkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2DLG-00000004ipQ-21jm;
	Mon, 16 Mar 2026 19:11:06 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2DLB-00000004ilj-3Wwq;
	Mon, 16 Mar 2026 19:11:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773688258;
	bh=LprbmXylD+ekLCDcp3duEB0CBRCKn4oD23OHkvred20=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bHV6Qht3q3Uu9xB/rP8O9AfN8IULgjF3xHmQoAB8FYBDHq7xKs5+ONNDLZrO0sGcC
	 bUYonypG02v2BNiuaME2U+Ca3t1jW0AFGi30JCtZzE711ryDAxBJSi3f+txqRbpL1J
	 JbiygDkA7QKWxUF7LNDmnE7oLpe5mZUOqLjPKd+KKqeeIarh38/ghiFc3PI3f1LPKt
	 9HAtiVnBMvOkSMpW2X2sDchoOoVxPIRhgxlPOjAU2HhpHgP1XVZC0ig/z6Cow+dRQ6
	 +yLttxZjNrZb9ZbMT/5tbPDAe9ld4p754NqyBq5RwpQ6KFWbny6DwQt7lYE9BoFytu
	 +/KVxFr5RemNA==
Received: from jupiter.universe (dyndsl-091-248-189-119.ewe-ip-backbone.de [91.248.189.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CADE817E0619;
	Mon, 16 Mar 2026 20:10:58 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 9887F480028; Mon, 16 Mar 2026 20:10:58 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Mon, 16 Mar 2026 20:10:45 +0100
Subject: [PATCH v5 1/8] PCI: dw-rockchip: Restore vpcie3v3 regulator handle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-rockchip-pcie-system-suspend-v5-1-5bb5ad37d643@collabora.com>
References: <20260316-rockchip-pcie-system-suspend-v5-0-5bb5ad37d643@collabora.com>
In-Reply-To: <20260316-rockchip-pcie-system-suspend-v5-0-5bb5ad37d643@collabora.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2361;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=LprbmXylD+ekLCDcp3duEB0CBRCKn4oD23OHkvred20=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGm4VcKwKFvt9u9p4f1YX7zooMxHpc9efNAS8
 6cognNJt0c26IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpuFXCAAoJENju1/PI
 O/qaircQAIStsoET6bMKGglBewLuG5ijKUnf5EwGgepDYj/eoaHiI98UgF8MBy99HbMF9tCtUvH
 dnwlHTwjJB07JgZZi05+xE5Qo7kWvjD9KVXsPLgBfuX0nIp6Up9FZdG52pXqjKPjwQD+PWARvaF
 F2t7l8rnP20hbK0fbFKMNkvH7YHQkrH+4HFmAP66Gi2td4jS9mykdr9Qn5dN4NRMkNQzsjYMt97
 Bl5BhEWxXnU6wZ68RG5JskTj1e9oQhUam7+9WtOGmhGb4A91WEvtGz82m/k2lzA9IFbbkGgYZ3R
 K+v4nzZlQL/Ho4Tyuf/Bfz8pGbIpV9VioneFcZjho3Hqg+CNSI9lPUGhqY4K7H7HGA6EiQg0TdM
 YV2wQjnxkUmj1tqExu6o9u3H7rVlb9+Yb02hX9oX9WLZVLONFV+PVF9CHrzXce1j0fJcH2oksjL
 elUEahM8HZrcACwd2XP2s6ZHUxkeyazvo76WmjQTYDzY46rk2FI6XYZEd9IddSUcftY7D6/vZzi
 jfvKFfNvKmzFUcqY9+mDdlWEcGfaDqMNKnv+Gt75JII6C4/CbtyUXLGVpsObnAGIIP5FH6sxdbd
 YtuAUf7MPfDGzifcI9JkQh1Ct3LqVb0OuwECKS+WtOa1yVk9CmQJRv3846120WSrUNbHJd/wDnl
 hulaNOOiTlkcILvrJL88yOw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_121102_033268_9E2861B4 
X-CRM114-Status: GOOD (  15.02  )
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

Revert commit c930b10f17c0 ("PCI: dw-rockchip: Simplify regulator setup
with devm_regulator_get_enable_optional()"), which nicely cleaned up the
code.

The vpcie3v3 regulator handle is needed to disable the regulator during
system suspend (to be added in its own patch).

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 5b17da63151d..dd482e74f891 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -95,6 +95,7 @@ struct rockchip_pcie {
 	unsigned int clk_cnt;
 	struct reset_control *rst;
 	struct gpio_desc *rst_gpio;
+	struct regulator *vpcie3v3;
 	struct irq_domain *irq_domain;
 	const struct rockchip_pcie_of_data *data;
 	bool supports_clkreq;
@@ -666,15 +667,22 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
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
@@ -707,6 +715,9 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
 	clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);
 deinit_phy:
 	rockchip_pcie_phy_deinit(rockchip);
+disable_regulator:
+	if (rockchip->vpcie3v3)
+		regulator_disable(rockchip->vpcie3v3);
 
 	return ret;
 }

-- 
2.51.0


