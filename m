Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED96F53D89
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 19:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AWkS5vD7v2/yEBYFFCfx9Nhi5sMrZAh+rm0LB4tjGPU=; b=FRFPnwZNyVA0DNspF583nyamHk
	PDaC9MRUs60t4sbKR3+NENVamOxxY3ygDW9alK4dCLA/kqdfxlA6dxuO12qWZcjzAHLQRr056get9
	k6w6pieC2E6u3egRtpOqHzO8ciDlOd6DYzMvCatD83HZjSYRDtrbcbGpMi1SA7sUZqF8aMXSPmEqb
	ZmfiWgW7gYmKzT/SVHNcoHQJbrgSsUsLSG7dkd1wctTT0d6JeLYVqCmMe+uFuZjJyCfG5ciyEl2WB
	pfv3gfWfR4jSy92Nn0+oa4rgDa5SwH68hvO0J9I8TrzyaLFKkHtSeP/KXUa9sN+ZpZvouFhy5ueF9
	92Pi+5OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2DLF-00000004ioB-2WZA;
	Mon, 16 Mar 2026 19:11:05 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2DLB-00000004ilh-3Mxc;
	Mon, 16 Mar 2026 19:11:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773688259;
	bh=w3zzCs74SGQRUYAzehdZ2v0RymbokOH6Yl7y89mYD2Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZjB10VJTvA/9MYjJQK1K/9NhLKiMow0ZXNstqYVgTcsckBwc3RuqJQ+2mT+N0tVdH
	 t3kmFqq9JZLRjZPGLQysKpyI8UCc5kTndJbg7Ir59QcSQCiUsipaxKkrgUIyE+aU81
	 W5zm4N78CyWzfs6i8WtTk18mDmu7ysxiGwiIhgFAMAKlAU+8GdEbbJZ6xZZ5Qy8BtX
	 ujJglQ2SN8ZU4rjCCs0HxkkT68CQ2j1FsHKnbA9T71tDKPiVhBI/ITEg4AZQFM3q6I
	 waO/b1yVYCVp7fVDb2eecCE0NPwJy5j28uwuDhyQhpkl1TqYNURlmIQ+RGeTa7vrDj
	 Y5jP6FWAdUhCg==
Received: from jupiter.universe (dyndsl-091-248-189-119.ewe-ip-backbone.de [91.248.189.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DD3C617E1330;
	Mon, 16 Mar 2026 20:10:58 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 994B948002C; Mon, 16 Mar 2026 20:10:58 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Mon, 16 Mar 2026 20:10:46 +0100
Subject: [PATCH v5 2/8] PCI: dw-rockchip: Move devm_phy_get out of phy_init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-rockchip-pcie-system-suspend-v5-2-5bb5ad37d643@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1528;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=w3zzCs74SGQRUYAzehdZ2v0RymbokOH6Yl7y89mYD2Y=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGm4VcJ+m/NxYAzY406hnMCHGjeQh4XYy7xkv
 8nI0PVeXsCv5okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpuFXCAAoJENju1/PI
 O/qa+GUP/Au6HE1sXQJHpSS2LLBDex0LdTykJbvLVll7azXKvQCiiQbVaIwx2lRd6Ix38G9MgrA
 kIfSjp9PEvgTLx11Q+ycvJTh4/cFDybTINoVaWgQGZQ+niQApOHogPI1wUm7NUjx4KsDl9T8Spe
 IPCiubGIYw5XORNG9Vxc33ga/7ZEk5RSqU9jaSQDK3X6By52imB9xRj7RG/yXBMbRJlWSq3dafF
 yk3lGy15VjPsk+H0LyNe4ipAU2KtnR1Y2FqzJbFbX/goU72bMvgY+FBlO28DdJ31G9NJCSepqyC
 4lfsVTGwcJwkRInntli+ISbrrrFNcR0BpBz8Qh0voXS8/YmUsbwi4ybTNOuxx7cc+nIFeqyO9fl
 Xxg6Vf+X0BpjhWIUdJDyFkVz/XhJlxsBFxD992dUQ+Oy5UN+94atVLoKWPWqPalTCx+ayKnk4b0
 f+Y1Ao4hwXnVQSIBNQjWV0B2wlMPSnvI2wocXqGkqG9A0X/qCRfcDdOz8QgUuEI1zbKzZDY4Ict
 +K0GNKRqNpNVpiXlPaC7oeaQvsZM3XTCrLUYTk09Nf3CiU1leK91wc2zxyBJT7IhercEuFqAbxh
 ky+QirsIIyLEsF7NiGKhohm+eUCys9zvIZYsXxM3yxA0QU1i5PFM2TzzrMFdZ/iBRw3d7BpFQqD
 24j+PWy1Hkdstbm7l/AkwPA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_121102_010171_0DD284F0 
X-CRM114-Status: GOOD (  13.90  )
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
index dd482e74f891..0228f7b6f100 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -485,14 +485,8 @@ static int rockchip_pcie_resource_get(struct platform_device *pdev,
 
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
@@ -680,6 +674,13 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
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


