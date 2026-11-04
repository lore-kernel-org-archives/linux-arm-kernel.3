Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB77F606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 23:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vofz+fx2;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=h5JTEh2V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+6KEAoCQ8UVREw+29ki3sy3gq19cTttnWP1dyJrgYI8=; b=vofz+fx2Hyhz7T
	bidXczbwkq7euHH+IeRr7jpsQ0pwVaGGpnLDJCiM0VW1zgSQdyGTQHZrafVQfr6/GO9CZd6bcgQEx
	2SA6oO8+gkOXVaBPFZA64slKxIqLtanecplYkrzqsdN26HMavFiyrRSTyB+tdU4H+QStrkOvzCjLj
	yTKBbbzq2+2/cS1JkOTOTBqpHROmFet9vSqe5u2q2QWBXUzJacJ7I3FE+Z2s31KBDj9U/BxB1rH4M
	zY+r5y3RU2tHTDID/DKyo7iG3huMhacDjfzR0Zkfrme36RrP+mnoWJAC1rsX/+EJifefQVClB3t/s
	Oyn0Bsjkss/R8r/+PY0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOkjD-00000007HGW-32Wg;
	Wed, 04 Nov 2026 23:49:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOkj3-00000007H7z-0bdh;
	Wed, 04 Nov 2026 23:49:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793836139;
	bh=t+Sk8DaOjl37LRgFHYoTMUyiYaOzy7rtv2N+aTckxP0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=h5JTEh2VNhXVqjBaTPQ/bnsDTTnRpVJA4Kt3+5KeeaNMKgUtpySZAoD3VxEVNa4MT
	 mRRUgGgNWADJ03+vKGpy0kE4sI2fxjX9DlEKBE5UW4Zb9PvtdnGU8PB9bkHeuhpgYZ
	 9LiSFZeDnwWqjQkoZqAozvHdvD8zd0Ecxet5pFiPo8AdEK0DCo/I01nH+3kpMwngHF
	 FAK1Iz8Gpeyoh/yl2lmlKuYzudtPsPqjPZIcd0vwAeU8lsME9C/YGRiEdoPG/Q0ZxD
	 NoBMnOlEXPWM1L50l0VWLNHnJDzhiQnGNMvnHw2ifFbfMl8f9F2Tqx6quzcCR3niBN
	 VJ7m5Wl84aPGQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7CF8817E0D5D;
	Thu, 05 Nov 2026 00:48:59 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id E6C65480038; Thu, 05 Nov 2026 00:48:58 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 05 Nov 2026 00:47:07 +0100
Subject: [PATCH v8 6/9] PCI: dw-rockchip: Add helper function for DDL
 indicator
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-rockchip-pcie-system-suspend-v8-6-0434b4f373bc@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1998;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=t+Sk8DaOjl37LRgFHYoTMUyiYaOzy7rtv2N+aTckxP0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrrxGo9yWZaeb88ImwkDIW+x2VLfpk+75f8V
 m1YZScgRxWQh4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq68RqAAoJENju1/PI
 O/qaTKoP/A7HCX6ZFuz9TZmWHUfDe39lNoH03CxTdiVMrA/ctGFe7N1y1cpZotNulZH5AWjQEhw
 YucDCAJop/5awLRAhZ6AykLa+imRagRuspgeTDbM3xg/tp6Q7qrNDHHkpIdxAK/PzOANpd4Opn3
 +qDOQDVup5qjcpzsqhuQMXtZXoTVYI4z2lcRDZmnfpaFCESlnMTTiynSnyI6QYhPUrEWvz6ZsPx
 iKniWCjQkCgTn0ipX6pGA3wZLMG2ctYK2zs4KsUHx2VqYBe0T2/JI2sxZMiCJxh4oFheVh8maGE
 GuMm63TE3q8AC3skfyLKYyr7lw474Sn4W2uCh+twjmUygh2NUXeW/2V9hY0rK+tbeDdLhttlKuk
 q3C+oIUDRWX8ugDoZ1k12eHI9/iz3qwQaKghT2p+0AgHNL8TOeosiedLnJZCq9TytiI+S4tIOti
 e8xgiMrzVcU6FrTbEzCgPuNj+htWfM2X9G3yvozflMi+/ftm9sCuRq4RCuBfXBbRi94xr0bC+Cm
 Vy+XN8/ePrWpGqc/QyLyWRqAeI4Bd35whKyJNcA+jvOOV2j0xBTSUlPBcG7/mSF0q/ak7HxTO43
 e2DByu3CRkzNiABT20RMGsSCtfdUgFP+TFhXez3zdwhRpK3ibQ93LpEswS5d4hmGsnB9HXr7Eaa
 NpWewbaf1V9fQe1irccMqJw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_154908_140493_00C0431A 
X-CRM114-Status: GOOD (  13.88  )
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
function to setup the DLL indicator.

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index c6a4649dae2e..0e26abc50920 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -700,6 +700,16 @@ static void rockchip_pcie_set_controller_mode(struct rockchip_pcie *rockchip, u3
 	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_SET_MODE(mode), PCIE_CLIENT_GENERAL_CON);
 }
 
+static void rockchip_pcie_unmask_dll_indicator(struct rockchip_pcie *rockchip)
+{
+	u32 val;
+
+	/* unmask DLL up/down indicator and hot reset/link-down reset */
+	val = FIELD_PREP_WM16(PCIE_RDLH_LINK_UP_CHGED, 0) |
+	      FIELD_PREP_WM16(PCIE_LINK_REQ_RST_NOT_INT, 0);
+	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_INTR_MASK_MISC);
+}
+
 static int rockchip_pcie_configure_rc(struct platform_device *pdev,
 				      struct rockchip_pcie *rockchip)
 {
@@ -760,7 +770,6 @@ static int rockchip_pcie_configure_ep(struct platform_device *pdev,
 {
 	struct device *dev = &pdev->dev;
 	int irq, ret;
-	u32 val;
 
 	if (!IS_ENABLED(CONFIG_PCIE_ROCKCHIP_DW_EP))
 		return -ENODEV;
@@ -800,10 +809,7 @@ static int rockchip_pcie_configure_ep(struct platform_device *pdev,
 
 	pci_epc_init_notify(rockchip->pci.ep.epc);
 
-	/* unmask DLL up/down indicator and hot reset/link-down reset */
-	val = FIELD_PREP_WM16(PCIE_RDLH_LINK_UP_CHGED, 0) |
-	      FIELD_PREP_WM16(PCIE_LINK_REQ_RST_NOT_INT, 0);
-	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_INTR_MASK_MISC);
+	rockchip_pcie_unmask_dll_indicator(rockchip);
 
 	return ret;
 }

-- 
2.53.0


