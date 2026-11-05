Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB156606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 13:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bhWj/b1N;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ECkNLWFZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qVP1z+8P/cev3nwRMweUSEcM661bS+NxTKhyHL2FR6I=; b=bhWj/b1NOkXvWj
	W3QOQ0sgAPcTTJoqb1Fek8d/irnfLl0t/A8AoMxzrSNH/ZRdq2m1Xcwz3iytG/Lyty9DK+zr0NhIb
	3E+DkSXMXlpmqaqXuHr5venq6X76rUt0qcpykimskv7sTIOfTZY2Z6+ZW65G/XVLBEH/QgYXC1jmE
	wL3NhLNKL4PtZat8z1HCRTGeP4XICnj6VcReIPy5go5C89IPQ7WwtnUGhjMfFgy2naUhAfm3PTsxY
	GkTpo095ZfkolxCcXTPv8M5WHIa9jeMPI0xZFQcMhEmenCKGry6uoPlx6WnMUYHDEZhRglOrOyK0U
	0i17xw+TQwGq/5diA2rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxae-000000098Ao-0zre;
	Thu, 05 Nov 2026 13:33:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxab-0000000989F-35FT;
	Thu, 05 Nov 2026 13:33:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793885591;
	bh=SUw4+10Lg2ZDAwZtr18eSAbgDCoszLb8eKffkbMHfiU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ECkNLWFZJCA5gVrr3psWKPc63U1t5/rE46792/8SFf/MwDC6cQ9+tCY0piXN7yrNh
	 sfvJqjebm9T7v8eZ3spi+sLGP2xH6P1Q5gdHF6IHFfGgz4S/gXWx/tSpL0fLYinVOw
	 gHwQfs3wGqsr088JZHX0BmveHpEQdJS41C9NpU2BLBFiQoKGJngR//nBBaYMvvEh1J
	 E3KldPFDHNNmyt4C7lVsq4IYP8WGotoFkz73Ue0KfYR8aCvu2SLNtG464BoVTt6g/R
	 WIU4jvPeTym8cgUIMe7JJikNT7T3u4oNTYKq12/mQVqkg/KYb7vD6al10gZQ6FEe2f
	 NZG2nL9TuCTFQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 449BC17E0B36;
	Thu, 05 Nov 2026 14:33:11 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id E754B480031; Thu, 05 Nov 2026 14:33:10 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 05 Nov 2026 14:33:12 +0100
Subject: [PATCH v9 4/9] PCI: dw-rockchip: Add helper function for enhanced
 LTSSM control mode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-rockchip-pcie-system-suspend-v9-4-a2e55846649e@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2814;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=SUw4+10Lg2ZDAwZtr18eSAbgDCoszLb8eKffkbMHfiU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrshZZHX1fso8CSlXsdPX5Wot4Rqt3hyBkqm
 e+BUJxaE3aAgokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq7IWWAAoJENju1/PI
 O/qa25IP/AnmzFH7BIEBRozskjOIUzAi2fB+sKjfW2cohgPpObSaPCzQPWczguR1eHyzPIGG/by
 gTA2FBaGVFF6MHHfYXXRFw6IBd0yXPmdUuhISXwa4y3o8IIpm8NielIgMmOZcQ6gRSs6PUnkJLd
 3egh3iTOnYNH1Tcqw6LHXHvJBOFTmMWB4pCidLcKOhjujwHt6vJdXmbbkc3ijOO5oHXrk+F0DvJ
 5dEdO7eB+j1LmVnexFz6AaVJ5wOM1NELjr6M8d2rNlrEePesErZtwobpzMlmF9a23Onm7tUJgKn
 nS2f32QuIcqsNisMv+hYfKvuamqaSQeZKTN95GDm8Xv7/n2jR8s7RdTR/21nBUXndqoLLkoEG0F
 uhDEaD9dxiGFcNRV671RvsowUSHNhSPSUPXJeQgXSKqC/tWziaBeq4eXBUgM8Bv0wJbm0cCGFDq
 R3jF/pBodrHE/i7SjOnNZiZHxl0yDbP+wJ1HWl/jbBwaGbm//WqYT6rrK9F25tO2lIq3Gullch5
 YYwwse4r9Op8zIcGjieAZHc6NLbSimNJ4/6vxkVfHZDCAsqfDQJe/6DJ0BjeCrWJhkeq8RAjbLr
 tJZoohuq11q/xT6cBUIwjU1uG/EOq6ZdOvr+ExLQZOSX/vO96CXZ1oebEXBUv8M4xfAh6d8Lz0y
 +nWesW6GVgjR+IbR4388nGw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_053313_996801_EA029663 
X-CRM114-Status: GOOD (  13.30  )
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
function to setup the enhanced LTSSM mode.

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 28 ++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index a3b0fb918479..92154a790ac0 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -683,6 +683,18 @@ static irqreturn_t rockchip_pcie_ep_sys_irq_thread(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
+static void rockchip_pcie_enable_enhanced_ltssm_control_mode(struct rockchip_pcie *rockchip,
+							     bool delay_link_training_after_reset)
+{
+	u32 val;
+
+	/* Enable the enhanced control mode of signal app_ltssm_enable */
+	val = FIELD_PREP_WM16(PCIE_LTSSM_ENABLE_ENHANCE, 1);
+	if (delay_link_training_after_reset)
+		val |= FIELD_PREP_WM16(PCIE_LTSSM_APP_DLY2_EN, 1);
+	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
+}
+
 static int rockchip_pcie_configure_rc(struct platform_device *pdev,
 				      struct rockchip_pcie *rockchip)
 {
@@ -706,9 +718,7 @@ static int rockchip_pcie_configure_rc(struct platform_device *pdev,
 		return ret;
 	}
 
-	/* LTSSM enable control mode */
-	val = FIELD_PREP_WM16(PCIE_LTSSM_ENABLE_ENHANCE, 1);
-	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
+	rockchip_pcie_enable_enhanced_ltssm_control_mode(rockchip, false);
 
 	rockchip_pcie_writel_apb(rockchip,
 				 PCIE_CLIENT_SET_MODE(PCIE_CLIENT_MODE_RC),
@@ -765,13 +775,7 @@ static int rockchip_pcie_configure_ep(struct platform_device *pdev,
 		return ret;
 	}
 
-	/*
-	 * LTSSM enable control mode, and automatically delay link training on
-	 * hot reset/link-down reset.
-	 */
-	val = FIELD_PREP_WM16(PCIE_LTSSM_ENABLE_ENHANCE, 1) |
-	      FIELD_PREP_WM16(PCIE_LTSSM_APP_DLY2_EN, 1);
-	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
+	rockchip_pcie_enable_enhanced_ltssm_control_mode(rockchip, true);
 
 	rockchip_pcie_writel_apb(rockchip,
 				 PCIE_CLIENT_SET_MODE(PCIE_CLIENT_MODE_EP),
@@ -940,9 +944,7 @@ static int rockchip_pcie_rc_reset_root_port(struct pci_host_bridge *bridge,
 		goto deinit_clk;
 	}
 
-	/* LTSSM enable control mode */
-	val = FIELD_PREP_WM16(PCIE_LTSSM_ENABLE_ENHANCE, 1);
-	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
+	rockchip_pcie_enable_enhanced_ltssm_control_mode(rockchip, false);
 
 	rockchip_pcie_writel_apb(rockchip,
 				 PCIE_CLIENT_SET_MODE(PCIE_CLIENT_MODE_RC),

-- 
2.53.0


