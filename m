Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F5F606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 13:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TiZIEmF8;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=bvWQbDyq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=craZvMOKShwQznguG90P50Ynv62UhMlNseXQqGecvgg=; b=TiZIEmF8is+WGr
	xK8Xg3DRSs2lrYaxe56vRwkOFaOvJRI340JlbaqG92Xx+42oiW0bYTl0KIo9y6j1XIkb+fIpAfLr9
	B8pWT1vPb4YYYtUYDfJcDby8na7w5l3AHanPjja2ur/gQ3uMF/kNABFCIZoM3BSZFNGpDVcXfpsfi
	Rq0hY7O+Ij6ZcZrT7SfdY1/qnmTGMKDSbnSczKehuOrUbVYAsdcszYyqK3NzZfaJ3fLrMbKyCgQ9I
	MnrBvRzuMFJXveESNyP5I46Jy4MJc2awJ3klWB4dG2kZoaXR+NjyKM3UexefJu9wEuGzw4b9LgHJ3
	CZg9xNt9hCiTQaeb2ddg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxah-000000098Eh-3Dk6;
	Thu, 05 Nov 2026 13:33:19 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxac-0000000989I-1b7o;
	Thu, 05 Nov 2026 13:33:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793885591;
	bh=GfAyb2KdZIf1ttG9EdRmi74euMuvmqM9ACQXbRgW0IQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bvWQbDyqyU4FsNL7ZK0moUHArw/ZqOtZDbZCVLnJ2+nFPH5kWgaTjZkWRjLSZaUI9
	 JzFgItAGgNs5P4UIbrVEPSmANSifWcQn2qdoAuw7wEsu9c2a4C7UpqHirnAbAMkN1F
	 P7rjVJC7xC1Rf9RtlJHXbJKJ+0bp2MQvlkLizmzEXbbRaG9Vypa/anWBb8mUD7A12k
	 kcgDUYTEb4mjnS/7jJku/YEaXc63xXMxkYVdfnOeOXOfF+z0O9lJ20uF4n9z+jTMUP
	 wUc+o5L88aTiIOTuGY8IS8WAWzryohyTJGh9W2zS2+Ujxq2j3Jek+e+CiW1oMQq9bp
	 KA69aiBcYHB3A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 42ADD17E0B10;
	Thu, 05 Nov 2026 14:33:11 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id E5C2D480030; Thu, 05 Nov 2026 14:33:10 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 05 Nov 2026 14:33:11 +0100
Subject: [PATCH v9 3/9] PCI: dw-rockchip: Move devm_phy_get out of phy_init
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-rockchip-pcie-system-suspend-v9-3-a2e55846649e@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1616;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=GfAyb2KdZIf1ttG9EdRmi74euMuvmqM9ACQXbRgW0IQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrshZaWKikzrWxxNOh06sMXTLUqlXAG1mapS
 VAdSXaq+TxED4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq7IWWAAoJENju1/PI
 O/qa0h4P/0AzSa+JdId14Z41L/1TvB3J8I16KekPIsh8Ew2QNvPwfhhWHliOkJrVp53NA9WPTcr
 gD8CeUCH8Pwe5FdhI8QHnaVKkwIA830dlCmjIvCMXU7XDhqKtwaFtKJalLriMbDwbfBRNsEQQX0
 DDoemxz3XSVlmgO4/dzg8yH5iLIkAWvHSxNZ5ctcreIVDgGNlrUWY6Z6RoU7F1oVuRrEfxOHMyT
 z3JadXoZnNADc0jzqHXXWHtvgacdAEp+FLnggqJA2EUEOW6P6DfsmObOpc0ZLeQA2P580Gg0BlL
 ZLcEkNOXscFt1uVHnSOPoAMmE1Yx44Bx/XbcG/pHV/ZG9/dhi3rvIGX4ZPa6d1SVlporbkN1aRY
 bkZ+kKREwGwKSaUVremx2E05nPzcITNjhgGFKAAKk05nFPHgB8QOmDrMhqNrYmWb7hjcnYIFoZh
 7OC06u8VgaszzDzDsueziFGH5nf+BjsDdS+hJymg2JjQDED5h18VT03E8QI5ZfGiq8miuYEgaS4
 TqEjylGZJhPVF9+jmUl/5mi2FJIFDo+vBOOEBPRCDMWtAlrxsicUBOIIMCmvsSMTMGjB5xTc43B
 0mZ5Yj/r0vlrvkZym15mZvzFXoRwTTAhWVHixfaSkH1hAoRERhsbKqYpe8TKijgVfkIK5yT/sgz
 Hj8bdc2jnfwh7khe7VZMdug==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_053314_605755_2FD73B9D 
X-CRM114-Status: GOOD (  14.72  )
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


