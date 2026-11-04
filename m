Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DAB608363D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 18:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1fTkWXWx;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=kEGmOBPn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=craZvMOKShwQznguG90P50Ynv62UhMlNseXQqGecvgg=; b=1fTkWXWx8kCelx
	rx0Efb9JXZU7Mx+88JIwj0BW6IHhiJbyP2yylFVMO2Y/rodj/SWPTE2Km341JwkH1rCpkKC0wvFGy
	k/7gU3G+nd9szVJPcUBihFZnQgAe9+H/a106AouCuF0uEdBFQMhmHHqsDzX9gn39CfT+bliKxF10n
	sqn5BYpnIULdRJF/4yI+DxJBcxJk46ePSYgekL1Y9M91xekHWUXPHDpEHMEQ9znXAQHSCHDHdS3de
	AQ/W5VGrcPyXxAmRFK7dsZRgFnA/SWImQNf+Lgy7V7EZAUgVfU38yw7qEiKdgo5wf925sZdiDSQoe
	ldLgYcGUx7C7+1HLVekQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgAG-00000006TIr-1LVz;
	Wed, 04 Nov 2026 18:56:52 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgA8-00000006T8M-19Ac;
	Wed, 04 Nov 2026 18:56:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793818601;
	bh=GfAyb2KdZIf1ttG9EdRmi74euMuvmqM9ACQXbRgW0IQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kEGmOBPnYQ71FGBEBH7gOc38RUucsbBdQupZdPjks592JGn7zHJkECg9dV2F8bubs
	 osjFVXXTaQ1yUsyzzrdV2Ggk37CBhB9eHLBtgpmGZfwbuZFb+6Jrow1rokGC2LbG2D
	 hRt/xB5KTOZsUWUKdb6fwTpbt3ZKV7WCUGYmJsCQjSzMJqNSPEnKjGCHZRYk6oowMN
	 fj8Ogt6YYt9IZU3IzpxzqAlt66bhCx1YSWPfkp031vb1NApoEwmPm7J7cmJEJziJOA
	 6uJKvcOAxaqUHpyVdhKceymYgwQfGl+af1LTRTKellwULNjUWiighA9evCeizt9U9l
	 smrjk2ZtHnN/A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 285BF17E0D48;
	Wed, 04 Nov 2026 19:56:41 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D6D62480030; Wed, 04 Nov 2026 19:56:40 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 04 Nov 2026 19:56:41 +0100
Subject: [PATCH v7 03/10] PCI: dw-rockchip: Move devm_phy_get out of
 phy_init
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-rockchip-pcie-system-suspend-v7-3-6ae6875939a2@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1616;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=GfAyb2KdZIf1ttG9EdRmi74euMuvmqM9ACQXbRgW0IQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrrf+iOCnNQEgupJrLVo+9YP/9a0zkkHjQyH
 z/+NFpO5dnYu4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq63/oAAoJENju1/PI
 O/qa56sQAJqPx6Py6yuyYdBJjIXad1AqPJIugircbGE1CIQ3ma1q/5wN/cEhp+cV6J7xacJ/qz7
 nyZpBknT4k3v6HxWHsVwuBwZTIJ42pgnlwElhn1bZ7jbd7FP6s6gp8LsHW1f8cnooS/39gwmeO2
 RiclQ7TiCQXIBnxXVI4kNSL/mP2cax1IqYBtcz7z6CkYlH693n5YyIxp5Wrec8gLqk3hf10xRQW
 8g9NUHozl65zhM1fSH+g6v+qX+U23YTgkkgdWoLUtSyLutRcyfpXoHrKnJoiCCpQ5OCqdiYGbhV
 ZBVCJJEPDI8rj4bBmORr26FmQADEpWDoCVtPFRWFkHA/+n0UVSaEhbb9iCSyHO71Ah98zpIuUMI
 7Xol0t/vWVTbwApGmy0N6NfRVL0HnL7B+oT4HhTrj/XxEmd4d2Cgcc2aeytCgv6B/j1OwVm4Rg7
 l95BKYpVxnPrilvtTR7l1OJFE/fRloB+jTMvqZxMvnCjmvcju+oFdRTTrYk7MH78qKUrKN4afxy
 1qapiW2hYJhn+xIF4DJ5mJP8t4+cnYkMJYrrFPAurHa/Loc+mf5Fvx+1TLqBxTYsK6umJDmZoht
 judbEPRqpo+YuHtvdOvNpqqcSFuL6IY8f8VPdrZ5PMYHz9UU0R8/nUSc7WD4ZCbiNSXgHVtOR4z
 zN6Mx470afhazHWVbzng1Vg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_105644_481288_49529725 
X-CRM114-Status: GOOD (  15.32  )
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

By moving devm_phy_get() to the probe routine, rockchip_pcie_phy_init()
can be used to re-initialize the PCIe PHY, which is for example needed
after a system suspend/resume cycle.

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 574d3dcfcf8b..a3b0fb918479 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -599,14 +599,8 @@ static int rockchip_pcie_resource_get(struct platform_device *pdev,
 
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
@@ -858,6 +852,13 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
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
 	if (ret) {
 		dev_err_probe(dev, ret, "failed to initialize the phy\n");

-- 
2.53.0


