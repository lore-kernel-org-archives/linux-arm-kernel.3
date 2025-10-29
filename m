Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976EFCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 17:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zPC8+ydpK775Er8X8bpehe7R4tLL5ecwyJCNaTdb2gQ=; b=uDssu2h1P2VQo2U/jeu6W1XO1S
	DQTd27ph0iLvNInK1VdZU99mn1KyH32fWr1WK4g3gDoPda6ZutSx6jWWVv25A8/oICm2UELi/oAH7
	oy8HbZYpF5mAk3NgJEyJ5tLKqoHr5tenoARfucx58SaQJUIs/RBNhWykSsPuYc29CoHVPVI7wdtDd
	zasY7A1VrQQg7710j5mMvLROSbK2xG+Tp2SE4+VGXjRpgZlEYD/IjfgGHbi1S8IK1ljgPfdfy3qQD
	FFa8A6+ThaCOauEzXUAOpIOsFsAEen7NtLH3iOYfvsmYM00LNCceuzkPh+yBPCV0QnKCBjCWGY0eb
	ONQ/dn/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAQ0-00000002ISN-3EJ9;
	Wed, 29 Oct 2025 17:57:08 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAPx-00000002IOr-3ybx;
	Wed, 29 Oct 2025 17:57:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761760622;
	bh=Ra0i+Wp3K8/16SuE0WP8++cHCg9npNLPkxIz/SvpPzw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kcRqOuMexzz5qgpkcAXBFkVxcpKq2VzLU6/CMOIRabhxUj/XMGRU5pLMMjKKhXQPF
	 1j1B1/shxucmhUvZOEaOLPQ5cMX9cKwusGAJQGNVj1QmNInfCiAz6SzgGc/swIYU1C
	 sJSjI689ENcryzqcp9kZ5UdiozyO6jeJ1kNhLqG7B8ZNm+2MR6nXNlaszOvTsWQE0d
	 aOecjHoZ2653hb33Ymz2B0J7sigsV2gOYwbLC1cdNckvl5JzlLXXEhJH5r7kdLU3r6
	 WDSKJn+rlqm2nZWCUOY2HCs+x4z28KA9QuhsD0GWinmxkf1FwvVw5Bx3Zvqnockyeh
	 +w5IBH9rLKNyw==
Received: from jupiter.universe (dyndsl-091-248-085-053.ewe-ip-backbone.de [91.248.85.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9AF3917E1396;
	Wed, 29 Oct 2025 18:57:02 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1E6D048004C; Wed, 29 Oct 2025 18:57:02 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 29 Oct 2025 18:56:42 +0100
Subject: [PATCH v4 3/9] PCI: dw-rockchip: Move devm_phy_get out of phy_init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-rockchip-pcie-system-suspend-v4-3-ce2e1b0692d2@collabora.com>
References: <20251029-rockchip-pcie-system-suspend-v4-0-ce2e1b0692d2@collabora.com>
In-Reply-To: <20251029-rockchip-pcie-system-suspend-v4-0-ce2e1b0692d2@collabora.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1528;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Ra0i+Wp3K8/16SuE0WP8++cHCg9npNLPkxIz/SvpPzw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGkCVW35BAkuWyyv4n1/D8lG9T4dxxXpLX84S
 lQ0yAAwPOYTe4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpAlVtAAoJENju1/PI
 O/qacykP/3VQwPyTdZ8x+76VWzJjNmgurwAKulw8T/aBbWtjucZPQGoNo/2j7kseMHRtLpy9PAQ
 otVtaSht4MXeexlxjS9XYupUE/UoMsxdYJE9KVxP6tAMeiJow3gTP6SZe3SAGWjApf+Fmv+Cc30
 R/s8pDIHeehYL7x7ZnlgVdSqAyktmwkLSwAHo3eGpXIW5sbb6dBi0/7JD7y6gb6I9Jnl8tvhAVs
 2Z0tGCXYN1X9SLU1G8AYHpsg4OK4ixjbZdctR7Q9JqTttY2IKJKEJVvP9uspBokz8nEfAoJYHws
 TpvMNSPTjnSsbbjFE2bS2DTIqXMQ5EfgcY/DuTLA0lPXnLNqaf8z8tJt887yKCfGnosN5E1kJgt
 BmtuAQl9UFIzqGNDsWkpzcBAw0lBdUKkiBKBO5FVYPAJBi6DWQZZZrGAtEMq4Sdh9UovwgnojVk
 3p9k3BRVr2WlEY6oWq5k0aAWFUHLz6yZt4VYyOufjivuA/FPaHzr9EyFGs1Ksi5GrY1FSAg6O71
 UEEptPqAbq6QyI3Loo2gINJRQTAIH53Yw55OI+HhG3lOvkDi93bi3Zu1ib9AHmm6qwwyzVU1yzS
 GnIxwNiKnmKNi8cMoE48TeKWX0JJjKXYYp0yc5yS3uw18YTvWW0KseWScxW5Izrta8l2UMv3sPb
 fKtOu0VcMxB3pY/KM7+wn4g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_105706_150712_CDB69CD2 
X-CRM114-Status: GOOD (  14.61  )
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

By moving devm_phy_get() to the probe routine, rockchip_pcie_phy_init()
can be used to re-initialize the PCIe PHY, which is for example needed
after a system suspend/resume cycle.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index e3d7792f7819..8e584016e244 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -425,14 +425,8 @@ static int rockchip_pcie_resource_get(struct platform_device *pdev,
 
 static int rockchip_pcie_phy_init(struct rockchip_pcie *rockchip)
 {
-	struct device *dev = rockchip->pci.dev;
 	int ret;
 
-	rockchip->phy = devm_phy_get(dev, "pcie-phy");
-	if (IS_ERR(rockchip->phy))
-		return dev_err_probe(dev, PTR_ERR(rockchip->phy),
-				     "missing PHY\n");
-
 	ret = phy_init(rockchip->phy);
 	if (ret < 0)
 		return ret;
@@ -674,6 +668,13 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
 					     "failed to enable vpcie3v3 regulator\n");
 	}
 
+	rockchip->phy = devm_phy_get(dev, "pcie-phy");
+	if (IS_ERR(rockchip->phy)) {
+		ret = PTR_ERR(rockchip->phy);
+		dev_err_probe(dev, ret, "missing PHY\n");
+		goto disable_regulator;
+	}
+
 	ret = rockchip_pcie_phy_init(rockchip);
 	if (ret)
 		goto disable_regulator;

-- 
2.51.0


