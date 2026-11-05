Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2879F606D828
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 13:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KhbPL1qd;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=kGgr4fgS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SL3c+Xn0SPE41xc8Ad0l64gG9trCMljB+pCfmOkxawI=; b=KhbPL1qdPQstU5
	8tbGLtTzB5azRXBfSXSrquvUsk5gjVQ4A2edZp9TCiLK9p5W9dCCDvluFurZIptte75uMgQ3V/7UX
	iHEyb/1iLSLnLUpkLr5bWGKogVdbQ+N0WakNqYYR0pp7ZIQtTQf13djDtjLUrx2ltJuHf7cJZyXTN
	F+Y6DP7kTyZX2nB1mlF0tHX2jeoapSRO6g7+FUiKrctRf90RiwrraUHlwV1RIl/qR7U+Vzqchb224
	SbOA+P3gQWUWS24XTDCwoXRxcGMiPENqRHZegE1vnk3Gb/m6SKALUij4xiSdR/V1kd9HYBKJ9nKXM
	txR/dYhDD8JLXS2VGbJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxak-000000098JZ-1Pt2;
	Thu, 05 Nov 2026 13:33:22 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxaf-000000098Af-1BTP;
	Thu, 05 Nov 2026 13:33:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793885591;
	bh=ptLOgwdQ/b+rU6Uy0kx26Ht8mJ6/4NDPhmCMpGs0vUk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kGgr4fgSB+QeXc1nzmhaz83Jz6wG6/Z/3vjapdSTZOcUOAlp7W+zrsx8EqNYUyGIw
	 9mAEOFP/zIrz25+Z+NP8nom0B3iGfvpOlgHEkgSqqqebCH3H6SSp8/3GEZKDsZIETx
	 VVYNshi4Ck/G33Tb6Prm9kOwv9As6I1mdlAs8MgnY6Et9t7yWE3xGR7Sfnvui0Kotr
	 /SaWWfcHLYpVUOHDJX+TWBH6oxt0nHG06oqZuIh3lpYU0JpvuJtBXRvujX18EcwaQH
	 1w6jM1RFyIVWk9EsZFP/97WTOEy+bUlOtAE8okXO844LMs+OBRB9QRiOnWZr7zv63w
	 Ge8j29Kj/hgfQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8FD3817E0BBE;
	Thu, 05 Nov 2026 14:33:11 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id E91FF480035; Thu, 05 Nov 2026 14:33:10 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 05 Nov 2026 14:33:13 +0100
Subject: [PATCH v9 5/9] PCI: dw-rockchip: Add helper function for
 controller mode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-rockchip-pcie-system-suspend-v9-5-a2e55846649e@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2427;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ptLOgwdQ/b+rU6Uy0kx26Ht8mJ6/4NDPhmCMpGs0vUk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrshZY9E27T8dp5BasZn7iXWUdUKnjbXdFRH
 XaRdXRINPr7SokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq7IWWAAoJENju1/PI
 O/qaS7cP/2xnyhbp4nAwb8YY8IfdPIIJRHMWG/LsS/aq3otLOhq+g0KocaKerSBPf2q3Cu603q+
 NW5VrL8eCutPMdOFVeJLlR/BbTu6xp7XCqPkKQdBd2nEo81hbTOo6mDfZjoHXX4O7OT+7I+XK9A
 f0uiVBpVXL+BxY2jn90yx7LZpRZVREI7O3SQCqFPlbR4Z1CnGAqQuKJO3623GAT3gKhTDg1NmrS
 1b2boi769vl2w2fZOboab+zkGSnWqiX3aBqCI5huk9Gpk11El07OcVFSm7lvkxzzYVH+EHTfw8T
 7r3uKPq0LOwx7NOovHYkWFn66KbIoO1AiADuNZePuaXEdrdeYlA1YvmD37JxdQ09Tr4iPDLu4l9
 FQUV8bJfGQXANulF0NSroJjV+x7L0J1Kaz47wgPgHXSorHn6iySRJ0R9MXgxHysAy7NtgVSPNnT
 ItUo1K9ZQpMZe0P5i3YBaVF4R3b1aERVEjv7j+vcEJ5J2G3Oh7AeahAbFbOciJK9g9BywXVha1S
 x3kMEepbJc+5CfGZWQVqxpB0faXoFBnnYgnySKw+X2RgNviFPTsf+4vvhtmP0xXpJhc9gvxIv4G
 /iL0tta++VY5GHor+yR598420Wpu6SZr6goKIZFHktbZh3QW6Kj0hcOpuX676pCG11Z4WWI2oPH
 eEaa4SeliVsSXXchno582hg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_053317_491990_96904CBC 
X-CRM114-Status: GOOD (  11.54  )
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

Remove code duplication and improve readability by introducing a new
function to setup the controller mode.

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 92154a790ac0..07718667c225 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -695,6 +695,11 @@ static void rockchip_pcie_enable_enhanced_ltssm_control_mode(struct rockchip_pci
 	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
 }
 
+static void rockchip_pcie_set_controller_mode(struct rockchip_pcie *rockchip, u32 mode)
+{
+	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_SET_MODE(mode), PCIE_CLIENT_GENERAL_CON);
+}
+
 static int rockchip_pcie_configure_rc(struct platform_device *pdev,
 				      struct rockchip_pcie *rockchip)
 {
@@ -719,10 +724,7 @@ static int rockchip_pcie_configure_rc(struct platform_device *pdev,
 	}
 
 	rockchip_pcie_enable_enhanced_ltssm_control_mode(rockchip, false);
-
-	rockchip_pcie_writel_apb(rockchip,
-				 PCIE_CLIENT_SET_MODE(PCIE_CLIENT_MODE_RC),
-				 PCIE_CLIENT_GENERAL_CON);
+	rockchip_pcie_set_controller_mode(rockchip, PCIE_CLIENT_MODE_RC);
 
 	irq = of_irq_get_byname(dev->of_node, "legacy");
 	if (irq < 0)
@@ -776,10 +778,7 @@ static int rockchip_pcie_configure_ep(struct platform_device *pdev,
 	}
 
 	rockchip_pcie_enable_enhanced_ltssm_control_mode(rockchip, true);
-
-	rockchip_pcie_writel_apb(rockchip,
-				 PCIE_CLIENT_SET_MODE(PCIE_CLIENT_MODE_EP),
-				 PCIE_CLIENT_GENERAL_CON);
+	rockchip_pcie_set_controller_mode(rockchip, PCIE_CLIENT_MODE_EP);
 
 	rockchip->pci.ep.ops = &rockchip_pcie_ep_ops;
 	rockchip->pci.ep.page_size = SZ_64K;
@@ -945,10 +944,7 @@ static int rockchip_pcie_rc_reset_root_port(struct pci_host_bridge *bridge,
 	}
 
 	rockchip_pcie_enable_enhanced_ltssm_control_mode(rockchip, false);
-
-	rockchip_pcie_writel_apb(rockchip,
-				 PCIE_CLIENT_SET_MODE(PCIE_CLIENT_MODE_RC),
-				 PCIE_CLIENT_GENERAL_CON);
+	rockchip_pcie_set_controller_mode(rockchip, PCIE_CLIENT_MODE_RC);
 
 	ret = dw_pcie_setup_rc(pp);
 	if (ret) {

-- 
2.53.0


