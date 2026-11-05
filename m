Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E876606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 13:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jcGuqBIy;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=kSj0tvAE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Bd0quOoFJe0g9jNpT8SLzufibaLOJeXGBQUTTVHS5os=; b=jcGuqBIyIDrdmZ
	cUz8F6jSM2QNPoVWS6wTZk5+ID018abgIv6bEYvvk6SUkCnQaf12/2m66w7VTk8208Ix6zwRScS52
	h1pwfNyz7+x2do1dp2KBdPnydZ1a49onPjq5polWpYstQYD2jDhbp48X00wwdQpwAMcjb2LAY+OAd
	cF8io6kR/IesBZ0pRJ1MCk8OxOdNP4bXpfnC2YZgf6NZq1Ox8AwKoNQNnoFelBBVA+7hrNeox0CjS
	v1fX8y4FQ69CGMvIcC1jm9cLzwZIRWIkJJX0xQcXxuJaDe9UZiuREoHSZr6UOsRwHxif9+kEhJ5lG
	bfCH5Nv6rtansc0ISXqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxai-000000098GN-3Om5;
	Thu, 05 Nov 2026 13:33:20 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxab-0000000989H-3ieV;
	Thu, 05 Nov 2026 13:33:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793885591;
	bh=8gAjDeFID8mO/dDQRifUwMLmNaFsmqSGIncrUFAKD1o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kSj0tvAEuq41sJ9BhzXdIqIOwIuWI93aN2UD9pyjRLUBfU0VeHlZYo+ewLRC9Cgcn
	 Hs5ZqMsaNTHoDMl8+AjpHoxKQ9Kxf/a+75OXN0q5c/Ufaqwz+BTgpr8vF+A3YDaR1z
	 O9yaelsz6YfxmNGQt7DbDU6VXb7cnI4j0KOrnMxx7QK88FJdv1CmcxwvVTI0GejIUQ
	 lZ8LaWPBPmU+z0wiKls7L0WQ/wRmmXtAfjhkde4ARrP6rBM0qhJKSeLXIBjkygJlRc
	 WFHS57US/G2wCMy9WWqiJvN8nmGpYwVPrDuMluog36wAewNRzLQZ2XNqpdtb0zb3UD
	 XDR6T9+VygGXg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 416EA17E09FA;
	Thu, 05 Nov 2026 14:33:11 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id E3C1F48002F; Thu, 05 Nov 2026 14:33:10 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 05 Nov 2026 14:33:10 +0100
Subject: [PATCH v9 2/9] PCI: dw-rockchip: Restore vpcie3v3 regulator handle
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-rockchip-pcie-system-suspend-v9-2-a2e55846649e@collabora.com>
References: <20261105-rockchip-pcie-system-suspend-v9-0-a2e55846649e@collabora.com>
In-Reply-To: <20261105-rockchip-pcie-system-suspend-v9-0-a2e55846649e@collabora.com>
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
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrshZaaFN74/4a1JqT1j4s/AeavAREvfMF84
 ux7J010D30UrokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq7IWWAAoJENju1/PI
 O/qaaqsQAJdzdyKe3Jk4MIaD1/dk+qZrCVFXk4CYaKghkrmBqLBiJSiHnbRVzk7E/X2QLpsVkcP
 V0ZFWgSJNcmI7sNJcuVtcMqjN7aele1pBkjbjoCUhufNMRUc531M5k2K0wJIAfZ9AE5B2D/3QFx
 pjKHcYqUbqieA3eNKamKH8FFOWZlIY2layRKQNyQvYeAYtmV+FZDULIrCFLPdmpIEpEgW7yUY+5
 yDxovjp7hXZnTdzA5boJB1fd8/Y4dvGgGwzORTYPyiDihPaEDzRczoufPYKlZW8Z8SsrXQJLbMt
 LqElqdGfINO6NDyezXq8DuCMh795BKa93O8MUquGZZOkz6i32N5GERbf7EXIducm4dM3Rl51N2H
 Xh6zfSH/UVZWsrgCM9S985+JTKmSl3iS7imWFPRB0gmMcIfrXOrWxIqJxpTfuiBKlPWpEqU3xb/
 fI48JPgIKinZ7gA1zqQ6sWOjuu8+DxzU2tQFB+FWpNnfehSUxsb5BfqGOcVqN247EKa2hRacUoZ
 dpgTp4OBocbUowc52M03v0xgRzr21qF3Vd4CpYdwy2lXdZ58xd2xY6n5XIOHlzkCMR9JIK6ynWP
 46yCqmaYDGJ9VOO+aEzfgONKmDmdztx8WGQHKeNDqcDOQOI6TxPgDAQm0WMNc6p19PF/HGNk0dW
 3HU0IieibI7Etti/hHWstLA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_053314_097990_D4B81EC7 
X-CRM114-Status: GOOD (  16.01  )
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


