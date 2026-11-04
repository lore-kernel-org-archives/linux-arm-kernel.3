Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F27606A332
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 23:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qqVutWjh;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=RftiUDPw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=craZvMOKShwQznguG90P50Ynv62UhMlNseXQqGecvgg=; b=qqVutWjh1IXOr0
	33sjFwE08HnGpkefOI/CFUxN3MoBeABfBiVr89OZQUlbO1A6/wFvPhuHrL+XDGITVHpA4ozbUkoNj
	/0XKH8dtwyxyRfWILCjcXBFY6DIiZE3D3REbiPDSiqimi0PMFBS8r+bQz79eDYKuMmAesfkQkRLp0
	6ODZOBrg7qEtIh39psDgJsPqsixhtiSh/ZBzsBqjIDR0OXHFg49KAI3mWznG211Zo5S0CV+ikfK9W
	RtIcK9XBQ6lbyFuvjw1pZNmYaLnH7hetPLVk9tZa4/r23A7v8F6sNt7zbhgpWDQ8sEEBkq94HaAxH
	B2TifMX70d+IQnvOKRHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOkj8-00000007HCD-1Ai2;
	Wed, 04 Nov 2026 23:49:10 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOkiz-00000007H68-2jOu;
	Wed, 04 Nov 2026 23:49:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793836139;
	bh=GfAyb2KdZIf1ttG9EdRmi74euMuvmqM9ACQXbRgW0IQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RftiUDPwSKfTskHKuK/mHz67+kpHqx12Jn2F/NJztC2SCx8+xR5f/86/KdFkRfrpC
	 +xqyX3RWiUYG4DHOCeX8ytTHVbAQq8UCIK1MNapCpy/vqjICIkETH6+uE3Y0+RC2iF
	 2NXq2u2prxWLzIrh4KDEMfayNJOvOmP7nBXea1OuyEFV1y9xYctzSmY7GFinCVDG+B
	 gVw+IVisdFDxwMY4g6c7US8rsxEnZ2WEgzoaqD2FPHjpsjxe6dmWOYk39odXsUjpv6
	 DVnqn56GPD0OLszSjLpGghdNaCXSpN0Yke+KCrgegiht5+uDaaHd/Oh/Ie/IgqHTgR
	 OvCYGZTOyPFkg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2C11317E0D49;
	Thu, 05 Nov 2026 00:48:59 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id E18AD480030; Thu, 05 Nov 2026 00:48:58 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 05 Nov 2026 00:47:04 +0100
Subject: [PATCH v8 3/9] PCI: dw-rockchip: Move devm_phy_get out of phy_init
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-rockchip-pcie-system-suspend-v8-3-0434b4f373bc@collabora.com>
References: <20261105-rockchip-pcie-system-suspend-v8-0-0434b4f373bc@collabora.com>
In-Reply-To: <20261105-rockchip-pcie-system-suspend-v8-0-0434b4f373bc@collabora.com>
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
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrrxGqMV+Xg9VX+SR6xfsjO6RAXuXVzfzGqS
 GrfO2RANO34VYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq68RqAAoJENju1/PI
 O/qa/5oQAJNNMbQ7tKg5p9pWBgN7slbywdVLPjvhqUi9Fvbhn8QDU/AKN4MotbHrtRBzRw3e+Q7
 xUP+qukp33KYAytEw9h+VGfaHnqFvVgwkDPLeOtPJE5dDRKLlR8x1KFGC6CWPO/3/iP/Q4HPPXH
 NjZ/EpMOeGT9MfkoZqUK/3cz05WHlSI8J0SoJ0EDEEHBnPurZS8LYoddUeYEXs5bnWosk2bFHQI
 31ZVC04FMOCHkXhTwwGqoG0L8ws3pSWN+AXVrFkCzmrhK1hM1WCSiuXcu6kXmY03qdPZ+ffPqXN
 5zjyy2DCx74X4zuzeMQCLGl1JTsv9FzhFLzCsTcY3Z1WJ4rFcYVIBcVKxTJt2EsZ9szPhKjupfT
 uvHhcER4KYhcWQobYiKhtFP1AnXO5SfA9HuesZb0tpP27U27aB7SDyt6GeczSnObjeB7elAwaex
 6FwcpHLaIrdglRrPIuqKgoj9NyV64POszjEfMJFBCecHBrB33i95jm2j33F2vOcpZH1tJi+/B+z
 /rTPVyS1H2MFwa2qbXlMXQX5HUWraP3Y9W6uPipfdMobRcYKIx9hW55jeZtm/LFOt059QD4AMfz
 0DSpJbgOVh8QocAO/RU3OkulqQ68l4jwMLdZ9X6bbOZdEOdBhsfFLbv9R54wLoXrGwWCViBGim7
 iyX/8ZmGVLtWdNTS5FPQzvw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_154901_872274_2BAC6669 
X-CRM114-Status: GOOD (  15.35  )
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


