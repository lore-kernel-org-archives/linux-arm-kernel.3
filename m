Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B61C60A3814
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 18:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Sl8rr3JO;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Raq4b7zr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=t7xMbJMG2VUM23ld03/+Ifs7j6JVWZw5IU8pySs9oPI=; b=Sl8rr3JOXIYos6
	e60gQeRfvIKnsIJF9bGT/RD85jNJV3l/HubLzWEWGvxyAtB5PqjFQLkl6bB6cqTQXQ/oHiD/oTfNS
	irD598P8cEnM+5YdBi0GnZ/0Sh+SVzXsk7UUXf2JLYNSnmSmZWPLmElFpDaPVALM/hn0g9LVv6j2G
	V7JVBsvMGuAwTdNViixUxDCW5qQk0p8w8FfHTpUwzFyPpXo9+TduNquqJQliNHYZhkU9x2xi1kpHc
	ep+cPoUuZ0PFnkFtKEDBB4M16wKraeYjvwxop562tH+lgrqVx8MpfjVVNGSr0CzGAe/6LyqPQGZCS
	kDdy+qGz2OyDK1b2JpVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgAQ-00000006TUY-1pj9;
	Wed, 04 Nov 2026 18:57:02 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgAC-00000006TAR-2EAy;
	Wed, 04 Nov 2026 18:56:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793818601;
	bh=AzGfmeM2NBTmO5J6apj9zxNmBMfBu5Mr/CC4a2aHGHw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Raq4b7zr6Bbpf3ql+wiXiTofGet+yWKJEqMURRqqciFcwlCJoxrhbeZ1X1kq7i8dv
	 jNy1/JP98oZKdfYHQ6rKaiS1xvaoX+HLdMEGK00EZDafnCcKSR0q2jHr28u4kq8u4t
	 lSPLfiCy50J0SvfTgsXI+b/OFQh2C6eD3uWB8ayQl5Nblk1X2ard9TJgoCH6Y+ME7p
	 eH+zNziz8v8mipiXZeqb+J0Whrwh3OSluIshHiLu+50Tl/T2Ti0fAbfH4KEXCrkele
	 uhmgeJbu+8RviYJwDZPEFCDPESshb554OTc9sW2TI/TDI7/HWBrA/x0LsnWcvZjVHb
	 bvItnyowR8oCg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7558417E0D4A;
	Wed, 04 Nov 2026 19:56:41 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id DAA9C480035; Wed, 04 Nov 2026 19:56:40 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 04 Nov 2026 19:56:43 +0100
Subject: [PATCH v7 05/10] PCI: dw-rockchip: Add helper function for
 controller mode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-rockchip-pcie-system-suspend-v7-5-6ae6875939a2@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2004;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=AzGfmeM2NBTmO5J6apj9zxNmBMfBu5Mr/CC4a2aHGHw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrrf+ifRvptuh5cAzZefBXiny2Fi6F+8kQux
 b5YFo4C+dIpPYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq63/oAAoJENju1/PI
 O/qaWHUP/2N1ovg9JKbFE2hIEdnw9w/SSoUUAAXfQLSSELmoh8NIM1wrb9y6HdD0EuUgW2WFmUo
 gEnHCFtWi+VUomcYj14qNoFLQGvMW8Z1jto909A9aHGf2t5WTTulCoFDQRPOC0MN/o2Dz5Ks9Gj
 NFfy4K/Ic9+I5QK42qbs1rFX6uMuguae42bAkItcUQbKi7DVfvCB3T9xLMhB26okMvuXAYwj8wV
 IWK1vVvdVhYjv1OYt1PXVKe5tLGjZadim/IXivMxcIlzv23FnZ2OG8YKAbpHiWL7964AmWKkerc
 Sd2od0XpW1fRBRcogkEYx9aAt2bQVtrFSQqtVR8qo3NDQSsOB1F6/sFi43W7RPpUiPnVqbzbrBa
 itM0jHuFX0whahH7qLu0Ury7EIRqazoSP1ohFnQyLVEsZzNNErf5Yce/MhAFVrrixnzuQiXPnYA
 0uiY3rpy5M7gJx/rEOshIn9CzBYqlcL7CuqS8nN6DDAyiwNbX5fl3S0uqao00UsCcumMDLu/afw
 egcc2oxH3gJ3FpNQbfSq7mZygyldQsNy3uSJH8JtBajikYZEuys8GU+dpHq4SaF3hTu0fJInMg2
 h5X4thLv6ajqHOdN7NxrBVWt6fzvqIh5c3Xc2P7uP26UZdgiHyqW7k7plVRwrCg3hc+nVqT9ZtY
 bnV8QeEUyHpK2jIhVLNYxzw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_105648_786160_20D17544 
X-CRM114-Status: GOOD (  11.90  )
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
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 7645b0895bf9..18dce2f52a27 100644
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

-- 
2.53.0


